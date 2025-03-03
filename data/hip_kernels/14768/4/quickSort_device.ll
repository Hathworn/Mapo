; ModuleID = '../data/hip_kernels/14768/4/main.cu'
source_filename = "../data/hip_kernels/14768/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9quickSortPiS_S_S_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %6
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %6
  store i32 0, i32 addrspace(1)* %11, align 4, !tbaa !5
  %12 = icmp slt i32 %8, %10
  br i1 %12, label %13, label %55

13:                                               ; preds = %4
  %14 = sext i32 %8 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  br label %16

16:                                               ; preds = %38, %13
  %17 = phi i32 [ %8, %13 ], [ %21, %38 ]
  %18 = phi i32 [ %10, %13 ], [ %30, %38 ]
  %19 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %20, %16
  %21 = phi i32 [ %28, %20 ], [ %17, %16 ]
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5
  %25 = icmp sle i32 %24, %19
  %26 = icmp slt i32 %21, %10
  %27 = select i1 %25, i1 %26, i1 false
  %28 = add nsw i32 %21, 1
  br i1 %27, label %20, label %29, !llvm.loop !10

29:                                               ; preds = %20, %29
  %30 = phi i32 [ %35, %29 ], [ %18, %20 ]
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %34 = icmp sgt i32 %33, %19
  %35 = add nsw i32 %30, -1
  br i1 %34, label %29, label %36, !llvm.loop !12

36:                                               ; preds = %29
  %37 = icmp slt i32 %21, %30
  br i1 %37, label %38, label %39

38:                                               ; preds = %36
  store i32 %33, i32 addrspace(1)* %23, align 4, !tbaa !5
  store i32 %24, i32 addrspace(1)* %32, align 4, !tbaa !5
  br label %16

39:                                               ; preds = %36
  %40 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %33, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %40, i32 addrspace(1)* %32, align 4, !tbaa !5
  br label %41

41:                                               ; preds = %44, %39
  %42 = phi i32 [ %8, %39 ], [ %48, %44 ]
  %43 = icmp sgt i32 %42, %10
  br i1 %43, label %55, label %44

44:                                               ; preds = %41
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5
  %48 = add nsw i32 %42, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5
  %52 = icmp sgt i32 %47, %51
  br i1 %52, label %53, label %41, !llvm.loop !13

53:                                               ; preds = %44
  %54 = add nsw i32 %30, 1
  store i32 %54, i32 addrspace(1)* %11, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %41, %53, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
