; ModuleID = '../data/hip_kernels/3879/17/main.cu'
source_filename = "../data/hip_kernels/3879/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_incerementPim(i32 addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = mul i32 %3, %8
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %14 = add i32 %12, %13
  %15 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !16
  %22 = udiv i32 %11, %8
  %23 = mul i32 %22, %8
  %24 = icmp ugt i32 %11, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %8
  %28 = udiv i32 %21, %18
  %29 = mul i32 %28, %18
  %30 = icmp ugt i32 %21, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %18
  %34 = icmp ult i32 %14, 7000
  br i1 %34, label %35, label %62

35:                                               ; preds = %2
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %37 = mul i32 %36, %18
  %38 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %39 = add i32 %37, %38
  %40 = bitcast i32 addrspace(1)* %0 to i8 addrspace(1)*
  br label %41

41:                                               ; preds = %35, %58
  %42 = phi i32 [ %14, %35 ], [ %60, %58 ]
  %43 = phi i32 [ %39, %35 ], [ %59, %58 ]
  %44 = icmp ult i32 %43, 60000
  br i1 %44, label %45, label %58

45:                                               ; preds = %41
  %46 = zext i32 %42 to i64
  %47 = mul i64 %46, %1
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %40, i64 %47
  %49 = bitcast i8 addrspace(1)* %48 to i32 addrspace(1)*
  br label %50

50:                                               ; preds = %45, %50
  %51 = phi i32 [ %43, %45 ], [ %56, %50 ]
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %49, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !17
  %55 = add nsw i32 %54, 1
  store i32 %55, i32 addrspace(1)* %53, align 4, !tbaa !17
  %56 = add i32 %51, %33
  %57 = icmp ult i32 %56, 60000
  br i1 %57, label %50, label %58, !llvm.loop !21

58:                                               ; preds = %50, %41
  %59 = phi i32 [ %43, %41 ], [ %56, %50 ]
  %60 = add i32 %42, %27
  %61 = icmp ult i32 %60, 7000
  br i1 %61, label %41, label %62, !llvm.loop !23

62:                                               ; preds = %58, %2
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
