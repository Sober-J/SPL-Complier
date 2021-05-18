; ModuleID = 'main'
source_filename = "main"

@ic = constant i32 1
@l = constant i32 1
@r = constant i32 6
@rc = constant double 1.500000e+00
@bc = constant i1 false
@cc = constant i8 97
@iv = global i32 0
@rv = global double 0.000000e+00
@bv = global i1 false
@cv = global i8 0
@p = global i32 0
@a = global [6 x i32] zeroinitializer
@.str = constant [4 x i8] c"%d\0A\00"

define internal void @main() {
entrypoint:
  %tmp = load i32, i32* @r
  %tmp1 = load i32, i32* @l
  store i32 0, i32* @iv
  %tmp2 = load i32, i32* @l
  %tmp3 = load i32, i32* @r
  store i32 %tmp2, i32* @iv
  br label %cond

cond:                                             ; preds = %loop, %entrypoint
  %tmp4 = load i32, i32* @iv
  %0 = icmp sle i32 %tmp4, %tmp3
  %forCond = icmp ne i1 %0, false
  br i1 %forCond, label %loop, label %afterLoop

loop:                                             ; preds = %cond
  %tmp5 = load i32, i32* @iv
  %addtmpi = add i32 %tmp5, 1
  %tmp6 = load i32, i32* @l
  %addtmpi7 = add i32 %tmp6, 1
  %subtmpi = sub i32 %addtmpi7, %tmp1
  %1 = getelementptr inbounds [6 x i32], [6 x i32]* @a, i32 0, i32 %subtmpi
  store i32 %addtmpi, i32* %1
  %tmp8 = load i32, i32* @l
  %addtmpi9 = add i32 %tmp8, 1
  %subtmpi10 = sub i32 %addtmpi9, %tmp1
  %2 = getelementptr inbounds [6 x i32], [6 x i32]* @a, i32 0, i32 %subtmpi10
  %arrRef = load i32, i32* %2
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %arrRef)
  %3 = add i32 %tmp4, 1
  store i32 %3, i32* @iv
  br label %cond

afterLoop:                                        ; preds = %cond
  %tmp11 = load i32, i32* @l
  %addtmpi12 = add i32 %tmp11, 1
  %subtmpi13 = sub i32 %addtmpi12, %tmp1
  %4 = getelementptr inbounds [6 x i32], [6 x i32]* @a, i32 0, i32 %subtmpi13
  store i32 8, i32* %4
  ret void
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)
