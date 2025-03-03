; ModuleID = '../data/hip_kernels/9088/3/main.cu'
source_filename = "../data/hip_kernels/9088/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z45cunn_ClassNLLCriterion_updateGradInput_kernelPfS_S_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = load float, float addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = fcmp contract ugt float %9, 0.000000e+00
  br i1 %10, label %11, label %45

11:                                               ; preds = %8
  %12 = icmp eq i32 %4, 0
  %13 = fdiv contract float 1.000000e+00, %9
  %14 = select contract i1 %12, float 1.000000e+00, float %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %45

17:                                               ; preds = %11
  %18 = icmp eq float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  br label %19

19:                                               ; preds = %17, %42
  %20 = phi i32 [ %15, %17 ], [ %43, %42 ]
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !4
  %24 = fptosi float %23 to i32
  %25 = add nsw i32 %24, -1
  %26 = icmp slt i32 %24, 1
  %27 = icmp sgt i32 %24, %7
  %28 = select i1 %26, i1 true, i1 %27
  br i1 %28, label %42, label %29

29:                                               ; preds = %19
  br i1 %18, label %34, label %30

30:                                               ; preds = %29
  %31 = zext i32 %25 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !4
  br label %34

34:                                               ; preds = %29, %30
  %35 = phi contract float [ %33, %30 ], [ 1.000000e+00, %29 ]
  %36 = fneg contract float %35
  %37 = fmul contract float %14, %36
  %38 = mul nsw i32 %20, %6
  %39 = add nsw i32 %25, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  store float %37, float addrspace(1)* %41, align 4, !tbaa !4
  br label %42

42:                                               ; preds = %19, %34
  %43 = add nuw nsw i32 %20, 32
  %44 = icmp slt i32 %43, %5
  br i1 %44, label %19, label %45, !llvm.loop !10

45:                                               ; preds = %42, %11, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
