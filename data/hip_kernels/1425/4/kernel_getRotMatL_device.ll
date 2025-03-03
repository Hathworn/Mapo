; ModuleID = '../data/hip_kernels/1425/4/main.cu'
source_filename = "../data/hip_kernels/1425/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@matS = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_getRotMatLPdS_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = mul nuw nsw i32 %4, 18
  %6 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @matS, i32 0, i32 %5
  %7 = getelementptr inbounds double, double addrspace(3)* %6, i32 9
  store double 0.000000e+00, double addrspace(3)* %6, align 8, !tbaa !5
  %8 = getelementptr inbounds double, double addrspace(3)* %6, i32 4
  store double 0.000000e+00, double addrspace(3)* %8, align 8, !tbaa !5
  %9 = getelementptr inbounds double, double addrspace(3)* %6, i32 8
  store double 0.000000e+00, double addrspace(3)* %9, align 8, !tbaa !5
  %10 = shl nuw nsw i32 %4, 2
  %11 = add nuw nsw i32 %10, 1
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds double, double addrspace(1)* %1, i64 %12
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !5
  %15 = getelementptr inbounds double, double addrspace(3)* %6, i32 5
  store double %14, double addrspace(3)* %15, align 8, !tbaa !5
  %16 = add nuw nsw i32 %10, 2
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %1, i64 %17
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !5
  %20 = getelementptr inbounds double, double addrspace(3)* %6, i32 6
  store double %19, double addrspace(3)* %20, align 8, !tbaa !5
  %21 = add nuw nsw i32 %10, 3
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !5
  %25 = getelementptr inbounds double, double addrspace(3)* %6, i32 1
  store double %24, double addrspace(3)* %25, align 8, !tbaa !5
  %26 = fneg contract double %14
  %27 = getelementptr inbounds double, double addrspace(3)* %6, i32 7
  store double %26, double addrspace(3)* %27, align 8, !tbaa !5
  %28 = fneg contract double %19
  %29 = getelementptr inbounds double, double addrspace(3)* %6, i32 2
  store double %28, double addrspace(3)* %29, align 8, !tbaa !5
  %30 = fneg contract double %24
  %31 = getelementptr inbounds double, double addrspace(3)* %6, i32 3
  store double %30, double addrspace(3)* %31, align 8, !tbaa !5
  %32 = getelementptr inbounds double, double addrspace(3)* %6, i32 10
  %33 = getelementptr inbounds double, double addrspace(3)* %6, i32 11
  %34 = getelementptr inbounds double, double addrspace(3)* %6, i32 12
  %35 = getelementptr inbounds double, double addrspace(3)* %6, i32 13
  %36 = getelementptr inbounds double, double addrspace(3)* %6, i32 14
  %37 = getelementptr inbounds double, double addrspace(3)* %6, i32 15
  %38 = getelementptr inbounds double, double addrspace(3)* %6, i32 16
  %39 = getelementptr inbounds double, double addrspace(3)* %6, i32 17
  %40 = fmul contract double %24, %24
  %41 = fsub contract double 0.000000e+00, %40
  %42 = fmul contract double %19, %28
  %43 = fadd contract double %41, %42
  store double %43, double addrspace(3)* %7, align 8, !tbaa !5
  %44 = fmul contract double %24, -0.000000e+00
  %45 = fadd contract double %44, 0.000000e+00
  %46 = fadd contract double %45, %44
  %47 = fmul contract double %19, %14
  %48 = fadd contract double %46, %47
  store double %48, double addrspace(3)* %34, align 8, !tbaa !5
  %49 = fmul contract double %19, 0.000000e+00
  %50 = fadd contract double %49, 0.000000e+00
  %51 = fmul contract double %24, %14
  %52 = fadd contract double %50, %51
  %53 = fadd contract double %52, %49
  store double %53, double addrspace(3)* %37, align 8, !tbaa !5
  %54 = fmul contract double %24, 0.000000e+00
  %55 = fadd contract double %54, 0.000000e+00
  %56 = fadd contract double %55, %54
  %57 = fmul contract double %14, %19
  %58 = fadd contract double %56, %57
  store double %58, double addrspace(3)* %32, align 8, !tbaa !5
  %59 = fadd contract double %41, 0.000000e+00
  %60 = fmul contract double %14, %14
  %61 = fsub contract double %59, %60
  store double %61, double addrspace(3)* %35, align 8, !tbaa !5
  %62 = fmul contract double %24, %19
  %63 = fadd contract double %62, 0.000000e+00
  %64 = fmul contract double %14, -0.000000e+00
  %65 = fadd contract double %63, %64
  %66 = fadd contract double %65, %64
  store double %66, double addrspace(3)* %38, align 8, !tbaa !5
  %67 = fmul contract double %19, -0.000000e+00
  %68 = fadd contract double %67, 0.000000e+00
  %69 = fmul contract double %14, %24
  %70 = fadd contract double %68, %69
  %71 = fadd contract double %70, %67
  store double %71, double addrspace(3)* %33, align 8, !tbaa !5
  %72 = fmul contract double %19, %24
  %73 = fadd contract double %72, 0.000000e+00
  %74 = load double, double addrspace(3)* %8, align 8, !tbaa !5
  %75 = fmul contract double %14, %74
  %76 = fadd contract double %73, %75
  %77 = load double, double addrspace(3)* %9, align 8, !tbaa !5
  %78 = load double, double addrspace(3)* %15, align 8, !tbaa !5
  %79 = fmul contract double %77, %78
  %80 = fadd contract double %76, %79
  store double %80, double addrspace(3)* %36, align 8, !tbaa !5
  %81 = fadd contract double %42, 0.000000e+00
  %82 = fmul contract double %14, %78
  %83 = fsub contract double %81, %82
  %84 = fmul contract double %77, %77
  %85 = fadd contract double %83, %84
  store double %85, double addrspace(3)* %39, align 8, !tbaa !5
  %86 = zext i32 %10 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %1, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !5, !amdgpu.noclobber !9
  %89 = fmul contract double %88, 2.000000e+00
  %90 = load double, double addrspace(3)* %6, align 8, !tbaa !5
  %91 = fmul contract double %89, %90
  %92 = fmul contract double %43, 2.000000e+00
  %93 = fadd contract double %91, %92
  %94 = load double, double addrspace(3)* %25, align 8, !tbaa !5
  %95 = fmul contract double %89, %94
  %96 = fmul contract double %58, 2.000000e+00
  %97 = fadd contract double %95, %96
  store double %97, double addrspace(3)* %25, align 8, !tbaa !5
  %98 = load double, double addrspace(3)* %29, align 8, !tbaa !5
  %99 = fmul contract double %89, %98
  %100 = fmul contract double %71, 2.000000e+00
  %101 = fadd contract double %99, %100
  store double %101, double addrspace(3)* %29, align 8, !tbaa !5
  %102 = load double, double addrspace(3)* %31, align 8, !tbaa !5
  %103 = fmul contract double %89, %102
  %104 = fmul contract double %48, 2.000000e+00
  %105 = fadd contract double %103, %104
  store double %105, double addrspace(3)* %31, align 8, !tbaa !5
  %106 = fmul contract double %89, %74
  %107 = fmul contract double %61, 2.000000e+00
  %108 = fadd contract double %106, %107
  %109 = fmul contract double %89, %78
  %110 = fmul contract double %80, 2.000000e+00
  %111 = fadd contract double %109, %110
  store double %111, double addrspace(3)* %15, align 8, !tbaa !5
  %112 = load double, double addrspace(3)* %20, align 8, !tbaa !5
  %113 = fmul contract double %89, %112
  %114 = fmul contract double %53, 2.000000e+00
  %115 = fadd contract double %113, %114
  store double %115, double addrspace(3)* %20, align 8, !tbaa !5
  %116 = load double, double addrspace(3)* %27, align 8, !tbaa !5
  %117 = fmul contract double %89, %116
  %118 = fmul contract double %66, 2.000000e+00
  %119 = fadd contract double %117, %118
  store double %119, double addrspace(3)* %27, align 8, !tbaa !5
  %120 = fmul contract double %89, %77
  %121 = fmul contract double %85, 2.000000e+00
  %122 = fadd contract double %120, %121
  %123 = fadd contract double %93, 1.000000e+00
  store double %123, double addrspace(3)* %6, align 8, !tbaa !5
  %124 = fadd contract double %108, 1.000000e+00
  store double %124, double addrspace(3)* %8, align 8, !tbaa !5
  %125 = fadd contract double %122, 1.000000e+00
  store double %125, double addrspace(3)* %9, align 8, !tbaa !5
  %126 = mul nuw nsw i32 %4, 9
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %0, i64 %127
  store double %123, double addrspace(1)* %128, align 8, !tbaa !5
  %129 = add nuw nsw i32 %126, 1
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %0, i64 %130
  store double %97, double addrspace(1)* %131, align 8, !tbaa !5
  %132 = add nuw nsw i32 %126, 2
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %0, i64 %133
  store double %101, double addrspace(1)* %134, align 8, !tbaa !5
  %135 = add nuw nsw i32 %126, 3
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %0, i64 %136
  store double %105, double addrspace(1)* %137, align 8, !tbaa !5
  %138 = add nuw nsw i32 %126, 4
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %0, i64 %139
  store double %124, double addrspace(1)* %140, align 8, !tbaa !5
  %141 = add nuw nsw i32 %126, 5
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %0, i64 %142
  store double %111, double addrspace(1)* %143, align 8, !tbaa !5
  %144 = add nuw nsw i32 %126, 6
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %0, i64 %145
  store double %115, double addrspace(1)* %146, align 8, !tbaa !5
  %147 = add nuw nsw i32 %126, 7
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds double, double addrspace(1)* %0, i64 %148
  store double %119, double addrspace(1)* %149, align 8, !tbaa !5
  %150 = add nuw nsw i32 %126, 8
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %0, i64 %151
  store double %125, double addrspace(1)* %152, align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
