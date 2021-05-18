NAME = spl

LLVM_CONFIG=/usr/local/Cellar/llvm@9/9.0.1_2/bin/llvm-config

NO_WARNING =  -Wno-return-type \
	-Wno-c++11-compat-deprecated-writable-strings \
	-Wno-deprecated-register \
	-Wno-switch \

CXXFLAGS = -I/usr/local/opt/llvm@9/include `$(LLVM_CONFIG) --cppflags` -std=c++11 $(NO_WARNING)
LDFLAGS = -L/usr/local/opt/llvm@9/lib `$(LLVM_CONFIG) --ldflags`
#LIBS = -v `$(LLVM_CONFIG) --libs --system-libs` -lm   -lpthread -ldl 
LIBS = `$(LLVM_CONFIG) --system-libs --libs e ngine interpreter ` -lffi``
OBJS = parser.o tokenizer.o ast.o  main.o CodeGenerator.o

all : $(NAME)

parser.cpp: ${NAME}.y
	bison -d -o parser.cpp ${NAME}.y

parser.hpp: parser.cpp

tokenizer.cpp: ${NAME}.l
	flex -o tokenizer.cpp ${NAME}.l

%.o: %.cpp ast.h CodeGenerator.h
	g++ -c $(CXXFLAGS) -g -o $@ $< 

$(NAME): $(OBJS)
	g++ -o $@ $(OBJS) $(LDFLAGS) $(LIBS)


.PHONY: clean
clean:
	-rm -f *.o
	-rm -f parser.hpp parser.cpp tokenizer.cpp spl
	-rm -f tree.json
	-rm -f *.s
	-rm -f *.ll
