; ModuleID = '../data/hip_kernels/9256/18/main.cu'
source_filename = "../data/hip_kernels/9256/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14groupSumKernelPfPiS0_S0_ii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !4, !amdgpu.noclobber !8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %12 = mul i32 %11, %5
  %13 = mul nsw i32 %10, %4
  %14 = add nsw i32 %13, %12
  %15 = add nsw i32 %14, %5
  %16 = add nsw i32 %13, %4
  %17 = tail call i32 @llvm.smin.i32(i32 %15, i32 %16)
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %8
  %19 = bitcast i32 addrspace(1)* %18 to <2 x i32> addrspace(1)*
  %20 = load <2 x i32>, <2 x i32> addrspace(1)* %19, align 4, !tbaa !4
  %21 = extractelement <2 x i32> %20, i64 0
  %22 = extractelement <2 x i32> %20, i64 1
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %6
  %25 = icmp slt i32 %14, %17
  br label %27

26:                                               ; preds = %48, %6
  ret void

27:                                               ; preds = %24, %48
  %28 = phi i32 [ %21, %24 ], [ %49, %48 ]
  br i1 %25, label %29, label %48

29:                                               ; preds = %27
  %30 = sext i32 %28 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4, !amdgpu.noclobber !8
  %33 = mul nsw i32 %32, %4
  %34 = add nsw i32 %33, %12
  br label %35

35:                                               ; preds = %29, %35
  %36 = phi i32 [ %46, %35 ], [ %34, %29 ]
  %37 = phi i32 [ %45, %35 ], [ %14, %29 ]
  %38 = sext i32 %36 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !10
  %41 = sext i32 %37 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !10
  %44 = fadd contract float %40, %43
  store float %44, float addrspace(1)* %42, align 4, !tbaa !10
  store float 0x7FF8000000000000, float addrspace(1)* %39, align 4, !tbaa !10
  %45 = add nsw i32 %37, 1
  %46 = add nsw i32 %36, 1
  %47 = icmp slt i32 %45, %17
  br i1 %47, label %35, label %48, !llvm.loop !12

48:                                               ; preds = %35, %27
  %49 = add nsw i32 %28, 1
  %50 = icmp slt i32 %49, %22
  br i1 %50, label %27, label %26, !llvm.loop !14
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !6, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
