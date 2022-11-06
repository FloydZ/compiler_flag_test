; ModuleID = 'simple.ll'
source_filename = "simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"output: %f, %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"time: %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca [100000 x float], align 16
  %11 = alloca [100000 x float], align 16
  %12 = alloca [100000 x float], align 16
  %13 = alloca [100000 x float], align 16
  %14 = alloca i64, align 8
  %15 = alloca double, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %16 = call i64 @clock() #3
  store i64 %16, i64* %14, align 8
  store i64 0, i64* %7, align 8
  br label %17

17:                                               ; preds = %37, %2
  %18 = load i64, i64* %7, align 8
  %19 = icmp ult i64 %18, 100000
  br i1 %19, label %20, label %40

20:                                               ; preds = %17
  %21 = load i64, i64* %7, align 8
  %22 = uitofp i64 %21 to double
  %23 = fmul double %22, 1.500000e+00
  %24 = fptrunc double %23 to float
  %25 = load i64, i64* %7, align 8
  %26 = getelementptr inbounds [100000 x float], [100000 x float]* %10, i64 0, i64 %25
  store float %24, float* %26, align 4
  %27 = load i64, i64* %7, align 8
  %28 = uitofp i64 %27 to double
  %29 = fadd double %28, 2.235000e+01
  %30 = fptrunc double %29 to float
  %31 = load i64, i64* %7, align 8
  %32 = getelementptr inbounds [100000 x float], [100000 x float]* %11, i64 0, i64 %31
  store float %30, float* %32, align 4
  %33 = load i64, i64* %7, align 8
  %34 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 %33
  store float 1.000000e+00, float* %34, align 4
  %35 = load i64, i64* %7, align 8
  %36 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 %35
  store float 1.000000e+00, float* %36, align 4
  br label %37

37:                                               ; preds = %20
  %38 = load i64, i64* %7, align 8
  %39 = add i64 %38, 1
  store i64 %39, i64* %7, align 8
  br label %17, !llvm.loop !6

40:                                               ; preds = %17
  store i64 0, i64* %6, align 8
  br label %41

41:                                               ; preds = %83, %40
  %42 = load i64, i64* %6, align 8
  %43 = icmp ult i64 %42, 100000
  br i1 %43, label %44, label %86

44:                                               ; preds = %41
  store i64 0, i64* %7, align 8
  br label %45

45:                                               ; preds = %79, %44
  %46 = load i64, i64* %7, align 8
  %47 = icmp ult i64 %46, 100000
  br i1 %47, label %48, label %82

48:                                               ; preds = %45
  %49 = load i64, i64* %7, align 8
  %50 = getelementptr inbounds [100000 x float], [100000 x float]* %10, i64 0, i64 %49
  %51 = load float, float* %50, align 4
  %52 = load i64, i64* %7, align 8
  %53 = getelementptr inbounds [100000 x float], [100000 x float]* %11, i64 0, i64 %52
  %54 = load float, float* %53, align 4
  %55 = fadd float %51, %54
  %56 = load i64, i64* %7, align 8
  %57 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 %56
  %58 = load float, float* %57, align 4
  %59 = load i64, i64* %6, align 8
  %60 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 %59
  %61 = load float, float* %60, align 4
  %62 = fdiv float %58, %61
  %63 = fsub float %55, %62
  %64 = load i64, i64* %7, align 8
  %65 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 %64
  store float %63, float* %65, align 4
  %66 = load i64, i64* %7, align 8
  %67 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 %66
  %68 = load float, float* %67, align 4
  %69 = load i64, i64* %7, align 8
  %70 = getelementptr inbounds [100000 x float], [100000 x float]* %10, i64 0, i64 %69
  %71 = load float, float* %70, align 4
  %72 = load i64, i64* %7, align 8
  %73 = getelementptr inbounds [100000 x float], [100000 x float]* %11, i64 0, i64 %72
  %74 = load float, float* %73, align 4
  %75 = fsub float %71, %74
  %76 = fmul float %68, %75
  %77 = load i64, i64* %6, align 8
  %78 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 %77
  store float %76, float* %78, align 4
  br label %79

79:                                               ; preds = %48
  %80 = load i64, i64* %7, align 8
  %81 = add i64 %80, 1
  store i64 %81, i64* %7, align 8
  br label %45, !llvm.loop !8

82:                                               ; preds = %45
  br label %83

83:                                               ; preds = %82
  %84 = load i64, i64* %6, align 8
  %85 = add i64 %84, 1
  store i64 %85, i64* %6, align 8
  br label %41, !llvm.loop !9

86:                                               ; preds = %41
  store i64 0, i64* %7, align 8
  br label %87

87:                                               ; preds = %108, %86
  %88 = load i64, i64* %7, align 8
  %89 = icmp ult i64 %88, 100000
  br i1 %89, label %90, label %111

90:                                               ; preds = %87
  %91 = load i64, i64* %7, align 8
  %92 = getelementptr inbounds [100000 x float], [100000 x float]* %10, i64 0, i64 %91
  %93 = load float, float* %92, align 4
  %94 = load i64, i64* %7, align 8
  %95 = getelementptr inbounds [100000 x float], [100000 x float]* %11, i64 0, i64 %94
  %96 = load float, float* %95, align 4
  %97 = fmul float %93, %96
  %98 = load i64, i64* %7, align 8
  %99 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 %98
  %100 = load float, float* %99, align 4
  %101 = fdiv float %97, %100
  %102 = load i64, i64* %7, align 8
  %103 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 %102
  %104 = load float, float* %103, align 4
  %105 = fadd float %101, %104
  %106 = load i64, i64* %7, align 8
  %107 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 %106
  store float %105, float* %107, align 4
  br label %108

108:                                              ; preds = %90
  %109 = load i64, i64* %7, align 8
  %110 = add i64 %109, 1
  store i64 %110, i64* %7, align 8
  br label %87, !llvm.loop !10

111:                                              ; preds = %87
  %112 = call i64 @clock() #3
  %113 = load i64, i64* %14, align 8
  %114 = sub nsw i64 %112, %113
  %115 = sitofp i64 %114 to double
  %116 = fdiv double %115, 1.000000e+06
  store double %116, double* %15, align 8
  %117 = getelementptr inbounds [100000 x float], [100000 x float]* %12, i64 0, i64 0
  %118 = load float, float* %117, align 16
  %119 = fpext float %118 to double
  %120 = getelementptr inbounds [100000 x float], [100000 x float]* %13, i64 0, i64 1
  %121 = load float, float* %120, align 4
  %122 = fpext float %121 to double
  %123 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), double noundef %119, double noundef %122)
  %124 = load double, double* %15, align 8
  %125 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), double noundef %124)
  %126 = load i32, i32* %3, align 4
  ret i32 %126
}

; Function Attrs: nounwind
declare i64 @clock() #1

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
