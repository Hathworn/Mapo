; ModuleID = '../data/hip_kernels/17514/0/main.cu'
source_filename = "../data/hip_kernels/17514/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15MultiplyGPUMultPfS_S_iE2As = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ15MultiplyGPUMultPfS_S_iE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15MultiplyGPUMultPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %5, %3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = sdiv i32 %3, 16
  %11 = icmp sgt i32 %3, 15
  %12 = mul nsw i32 %8, %3
  %13 = add nsw i32 %12, %9
  %14 = sext i32 %13 to i64
  br i1 %11, label %15, label %52

15:                                               ; preds = %4
  %16 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 %9
  %17 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 %8, i32 %9
  %18 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 0
  %19 = getelementptr float, float addrspace(1)* %0, i64 %14
  %20 = getelementptr float, float addrspace(1)* %1, i64 %14
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 0, i32 %9
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 1, i32 %9
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 2, i32 %9
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 3, i32 %9
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 4, i32 %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 5, i32 %9
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 6, i32 %9
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 7, i32 %9
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 8, i32 %9
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 9, i32 %9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 10
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 10, i32 %9
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 11
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 11, i32 %9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 12
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 12, i32 %9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 13
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 13, i32 %9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 14
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 14, i32 %9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2As, i32 0, i32 %8, i32 15
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ15MultiplyGPUMultPfS_S_iE2Bs, i32 0, i32 15, i32 %9
  br label %59

52:                                               ; preds = %59, %4
  %53 = phi float [ 0.000000e+00, %4 ], [ %136, %59 ]
  %54 = add i32 %7, %6
  %55 = shl i32 %54, 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = getelementptr inbounds float, float addrspace(1)* %57, i64 %14
  store float %53, float addrspace(1)* %58, align 4, !tbaa !5
  ret void

59:                                               ; preds = %15, %59
  %60 = phi float [ 0.000000e+00, %15 ], [ %136, %59 ]
  %61 = phi i32 [ 0, %15 ], [ %137, %59 ]
  %62 = add i32 %61, %7
  %63 = shl i32 %62, 4
  %64 = sext i32 %63 to i64
  %65 = mul i32 %61, %3
  %66 = add i32 %65, %6
  %67 = shl i32 %66, 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr float, float addrspace(1)* %19, i64 %64
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %70, float addrspace(3)* %16, align 4, !tbaa !5
  %71 = getelementptr float, float addrspace(1)* %20, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %72, float addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = load float, float addrspace(3)* %18, align 16, !tbaa !5
  %74 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %75 = fmul contract float %73, %74
  %76 = fadd contract float %60, %75
  %77 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %79 = fmul contract float %77, %78
  %80 = fadd contract float %76, %79
  %81 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %82 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %80, %83
  %85 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %86 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %87 = fmul contract float %85, %86
  %88 = fadd contract float %84, %87
  %89 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %90 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %88, %91
  %93 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %92, %95
  %97 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %98 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %102 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %106 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %114 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %118 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %122 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %126 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %130 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = add nuw nsw i32 %61, 1
  %138 = icmp eq i32 %137, %10
  br i1 %138, label %52, label %59, !llvm.loop !10
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
