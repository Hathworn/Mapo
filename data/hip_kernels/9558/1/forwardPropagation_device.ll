; ModuleID = '../data/hip_kernels/9558/1/main.cu'
source_filename = "../data/hip_kernels/9558/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18forwardPropagationPfS_iE4temp = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18forwardPropagationPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = add nsw i32 %2, 1
  %7 = mul nsw i32 %6, %5
  %8 = add nsw i32 %7, %4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ18forwardPropagationPfS_iE4temp, i32 0, i32 %5, i32 %4
  store float %11, float addrspace(3)* %12, align 4, !tbaa !5
  %13 = icmp sgt i32 %2, 1
  br i1 %13, label %19, label %16

14:                                               ; preds = %37
  %15 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  br label %16

16:                                               ; preds = %14, %3
  %17 = phi float [ %15, %14 ], [ %11, %3 ]
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  store float %17, float addrspace(1)* %18, align 4, !tbaa !5
  ret void

19:                                               ; preds = %3, %37
  %20 = phi i32 [ %38, %37 ], [ 1, %3 ]
  %21 = add nuw nsw i32 %20, %5
  %22 = icmp slt i32 %21, %2
  br i1 %22, label %23, label %37

23:                                               ; preds = %19
  %24 = add nsw i32 %20, -1
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ18forwardPropagationPfS_iE4temp, i32 0, i32 %24, i32 %24
  %26 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ18forwardPropagationPfS_iE4temp, i32 0, i32 %21, i32 %24
  %28 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %29 = fneg contract float %26
  %30 = fdiv contract float %29, %28
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ18forwardPropagationPfS_iE4temp, i32 0, i32 %24, i32 %4
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ18forwardPropagationPfS_iE4temp, i32 0, i32 %21, i32 %4
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = fmul contract float %30, %34
  %36 = fadd contract float %32, %35
  store float %36, float addrspace(3)* %33, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %23, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = add nuw nsw i32 %20, 1
  %39 = icmp eq i32 %38, %2
  br i1 %39, label %14, label %19, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
