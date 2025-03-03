; ModuleID = '../data/hip_kernels/13153/9/main.cu'
source_filename = "../data/hip_kernels/13153/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15Mask_Sum_KernelPiiS_(i32 addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp sgt i32 %1, 1
  br i1 %13, label %14, label %43

14:                                               ; preds = %3
  %15 = udiv i32 %10, %9
  %16 = icmp ugt i16 %8, 1
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = icmp eq i32 %4, 0
  %20 = sext i32 %15 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  br label %22

22:                                               ; preds = %14, %40
  %23 = phi i32 [ %1, %14 ], [ %41, %40 ]
  br i1 %16, label %24, label %37

24:                                               ; preds = %22, %35
  %25 = phi i32 [ %26, %35 ], [ %9, %22 ]
  %26 = lshr i32 %25, 1
  %27 = icmp ult i32 %4, %26
  br i1 %27, label %28, label %35

28:                                               ; preds = %24
  %29 = add nsw i32 %26, %12
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7
  %34 = add nsw i32 %33, %32
  store i32 %34, i32 addrspace(1)* %18, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %28, %24
  %36 = icmp ugt i32 %25, 3
  br i1 %36, label %24, label %37, !llvm.loop !11

37:                                               ; preds = %35, %22
  br i1 %19, label %38, label %40

38:                                               ; preds = %37
  %39 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7
  store i32 %39, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %38, %37
  %41 = udiv i32 %23, %9
  %42 = icmp sgt i32 %41, 1
  br i1 %42, label %22, label %43, !llvm.loop !13

43:                                               ; preds = %40, %3
  %44 = icmp eq i32 %12, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %43
  %46 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7
  store i32 %46, i32 addrspace(1)* %2, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %45, %43
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
