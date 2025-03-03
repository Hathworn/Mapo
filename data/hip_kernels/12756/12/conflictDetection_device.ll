; ModuleID = '../data/hip_kernels/12756/12/main.cu'
source_filename = "../data/hip_kernels/12756/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17conflictDetectionPiS_S_iiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %61

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = add nsw i32 %3, -1
  %24 = icmp eq i32 %15, %23
  br i1 %24, label %25, label %27

25:                                               ; preds = %17
  %26 = shl nsw i32 %4, 1
  br label %32

27:                                               ; preds = %17
  %28 = add nsw i32 %15, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %32

32:                                               ; preds = %27, %25
  %33 = phi i32 [ %26, %25 ], [ %31, %27 ]
  %34 = icmp slt i32 %22, %33
  br i1 %34, label %35, label %61

35:                                               ; preds = %32
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %18
  br label %37

37:                                               ; preds = %35, %58
  %38 = phi i32 [ %22, %35 ], [ %59, %58 ]
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = add nsw i32 %41, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  %46 = icmp eq i32 %45, %20
  br i1 %46, label %47, label %58

47:                                               ; preds = %37
  %48 = icmp slt i32 %15, %42
  br i1 %48, label %49, label %52

49:                                               ; preds = %47
  %50 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %56

52:                                               ; preds = %47
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %58, label %56

56:                                               ; preds = %52, %49
  %57 = phi i32 addrspace(1)* [ %36, %49 ], [ %53, %52 ]
  store i32 1, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %56, %37, %52, %49
  %59 = add nsw i32 %38, 1
  %60 = icmp slt i32 %59, %33
  br i1 %60, label %37, label %61, !llvm.loop !11

61:                                               ; preds = %58, %32, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
