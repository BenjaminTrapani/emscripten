; ModuleID = 'tests/hello_world.bc'
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [18 x i8] c"hello, world %d!\0A\00", align 1

define i32 @main() {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @llvm.ctlz.i32(i32 109, i1 0)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @llvm.ctlz.i32(i32, i1)

