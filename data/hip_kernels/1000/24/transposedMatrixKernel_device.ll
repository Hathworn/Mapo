; ModuleID = '../data/hip_kernels/1000/24/main.cu'
source_filename = "../data/hip_kernels/1000/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22transposedMatrixKernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = mul i32 %5, %9
  %14 = add i32 %13, %3
  %15 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !16
  %22 = icmp slt i32 %14, 4
  br i1 %22, label %23, label %60

23:                                               ; preds = %2
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = mul i32 %24, %18
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %27, 4
  %29 = udiv i32 %12, %9
  %30 = mul i32 %29, %9
  %31 = icmp ugt i32 %12, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %9
  br label %35

35:                                               ; preds = %23, %57
  %36 = phi i32 [ %14, %23 ], [ %58, %57 ]
  br i1 %28, label %37, label %57

37:                                               ; preds = %35
  %38 = shl nsw i32 %36, 2
  %39 = udiv i32 %21, %18
  %40 = mul i32 %39, %18
  %41 = icmp ugt i32 %21, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %43, %18
  br label %45

45:                                               ; preds = %37, %45
  %46 = phi i32 [ %27, %37 ], [ %55, %45 ]
  %47 = shl nsw i32 %46, 2
  %48 = add nsw i32 %47, %36
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !17
  %52 = add nsw i32 %46, %38
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %51, i32 addrspace(1)* %54, align 4, !tbaa !17
  %55 = add i32 %44, %46
  %56 = icmp slt i32 %55, 4
  br i1 %56, label %45, label %57, !llvm.loop !21

57:                                               ; preds = %45, %35
  %58 = add i32 %34, %36
  %59 = icmp slt i32 %58, 4
  br i1 %59, label %35, label %60, !llvm.loop !23

60:                                               ; preds = %57, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
