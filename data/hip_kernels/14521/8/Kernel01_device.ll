; ModuleID = '../data/hip_kernels/14521/8/main.cu'
source_filename = "../data/hip_kernels/14521/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8Kernel01iiiPfS_S_E2sA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ8Kernel01iiiPfS_S_E2sB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8Kernel01iiiPfS_S_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = sdiv i32 %2, 16
  %16 = icmp sgt i32 %2, 15
  br i1 %16, label %17, label %54

17:                                               ; preds = %6
  %18 = mul nsw i32 %12, %2
  %19 = add i32 %18, %9
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 0
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 0, i32 %9
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 1
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 1, i32 %9
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 2
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 2, i32 %9
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 3
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 3, i32 %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 4
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 4, i32 %9
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 5
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 5, i32 %9
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 6
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 6, i32 %9
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 7
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 7, i32 %9
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 8
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 8, i32 %9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 9
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 9, i32 %9
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 10
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 10, i32 %9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 11
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 11, i32 %9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 12
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 12, i32 %9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 13
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 13, i32 %9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 14
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 14, i32 %9
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sA, i32 0, i32 %10, i32 15
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel01iiiPfS_S_E2sB, i32 0, i32 15, i32 %9
  br label %60

54:                                               ; preds = %60, %6
  %55 = phi float [ 0.000000e+00, %6 ], [ %137, %60 ]
  %56 = mul nsw i32 %12, %1
  %57 = add nsw i32 %56, %14
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !5
  ret void

60:                                               ; preds = %17, %60
  %61 = phi i32 [ 0, %17 ], [ %138, %60 ]
  %62 = phi float [ 0.000000e+00, %17 ], [ %137, %60 ]
  %63 = shl nsw i32 %61, 4
  %64 = add i32 %19, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %67, float addrspace(3)* %20, align 4, !tbaa !5
  %68 = add nuw nsw i32 %63, %10
  %69 = mul nsw i32 %68, %1
  %70 = add nsw i32 %69, %14
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %73, float addrspace(3)* %21, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = load float, float addrspace(3)* %22, align 16, !tbaa !5
  %75 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %76 = fmul contract float %74, %75
  %77 = fadd contract float %62, %76
  %78 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %79 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %80 = fmul contract float %78, %79
  %81 = fadd contract float %77, %80
  %82 = load float, float addrspace(3)* %26, align 8, !tbaa !5
  %83 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %84 = fmul contract float %82, %83
  %85 = fadd contract float %81, %84
  %86 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %87 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %85, %88
  %90 = load float, float addrspace(3)* %30, align 16, !tbaa !5
  %91 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %92 = fmul contract float %90, %91
  %93 = fadd contract float %89, %92
  %94 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %96 = fmul contract float %94, %95
  %97 = fadd contract float %93, %96
  %98 = load float, float addrspace(3)* %34, align 8, !tbaa !5
  %99 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %97, %100
  %102 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %103 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %38, align 16, !tbaa !5
  %107 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %111 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %42, align 8, !tbaa !5
  %115 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %119 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %46, align 16, !tbaa !5
  %123 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %131 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %135 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = add nuw nsw i32 %61, 1
  %139 = icmp eq i32 %138, %15
  br i1 %139, label %54, label %60, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
