; ModuleID = '../data/hip_kernels/8929/7/main.cu'
source_filename = "../data/hip_kernels/8929/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12binarySearchiiPKlS0_Pi(i32 %0, i32 %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = mul i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = add i32 %20, %21
  %23 = mul i32 %22, %13
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %61

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %28
  %30 = load i64, i64 addrspace(1)* %29, align 8, !tbaa !16, !amdgpu.noclobber !14
  %31 = add nsw i32 %1, -1
  br label %32

32:                                               ; preds = %52, %27
  %33 = phi i32 [ %31, %27 ], [ %53, %52 ]
  %34 = phi i32 [ 0, %27 ], [ %54, %52 ]
  %35 = phi i32 [ -1, %27 ], [ %55, %52 ]
  %36 = icmp sgt i32 %34, %33
  br i1 %36, label %58, label %37

37:                                               ; preds = %32
  %38 = add nsw i32 %34, %33
  %39 = ashr i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %40
  %42 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !16, !amdgpu.noclobber !14
  %43 = icmp slt i64 %42, %30
  br i1 %43, label %44, label %46

44:                                               ; preds = %37
  %45 = add nsw i32 %39, 1
  br label %52

46:                                               ; preds = %37
  %47 = icmp eq i64 %42, %30
  %48 = add nsw i32 %39, -1
  %49 = select i1 %47, i32 %33, i32 %48
  %50 = select i1 %47, i32 %39, i32 %35
  %51 = select i1 %47, i32 3, i32 0
  br label %52

52:                                               ; preds = %46, %44
  %53 = phi i32 [ %33, %44 ], [ %49, %46 ]
  %54 = phi i32 [ %45, %44 ], [ %34, %46 ]
  %55 = phi i32 [ %35, %44 ], [ %50, %46 ]
  %56 = phi i32 [ 0, %44 ], [ %51, %46 ]
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %32, label %58

58:                                               ; preds = %52, %32
  %59 = phi i32 [ %55, %52 ], [ %35, %32 ]
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !20
  br label %61

61:                                               ; preds = %58, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
