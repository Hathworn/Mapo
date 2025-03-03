; ModuleID = '../data/hip_kernels/8929/0/main.cu'
source_filename = "../data/hip_kernels/8929/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z17initTempNodeArrayiiPiS_S_S_(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %14
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = add nsw i32 %1, 1
  %28 = shl nsw i32 %27, 1
  %29 = add nuw nsw i32 %28, 1
  %30 = mul nsw i32 %29, %0
  %31 = icmp slt i32 %26, %30
  br i1 %31, label %32, label %58

32:                                               ; preds = %6
  %33 = sdiv i32 %26, %0
  %34 = icmp sgt i32 %33, %1
  br i1 %34, label %38, label %35

35:                                               ; preds = %32
  %36 = sext i32 %26 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  store i32 -30000, i32 addrspace(1)* %37, align 4, !tbaa !16
  br label %50

38:                                               ; preds = %32
  %39 = icmp eq i32 %27, %33
  br i1 %39, label %40, label %43

40:                                               ; preds = %38
  %41 = sext i32 %26 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %41
  store i32 0, i32 addrspace(1)* %42, align 4, !tbaa !16
  br label %50

43:                                               ; preds = %38
  %44 = sub i32 %27, %33
  %45 = shl i32 %44, 1
  %46 = add nsw i32 %45, -5
  %47 = sext i32 %26 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  store i32 %46, i32 addrspace(1)* %48, align 4, !tbaa !16
  %49 = add nsw i32 %45, -10
  br label %50

50:                                               ; preds = %40, %43, %35
  %51 = phi i64 [ %36, %35 ], [ %47, %43 ], [ %41, %40 ]
  %52 = phi i32 [ -30000, %35 ], [ %49, %43 ], [ -5, %40 ]
  %53 = phi i32 [ -30000, %35 ], [ %46, %43 ], [ -5, %40 ]
  %54 = phi i32 [ -30000, %35 ], [ 0, %43 ], [ 0, %40 ]
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  store i32 %52, i32 addrspace(1)* %55, align 4, !tbaa !16
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  store i32 %53, i32 addrspace(1)* %56, align 4, !tbaa !16
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  store i32 %54, i32 addrspace(1)* %57, align 4, !tbaa !16
  br label %58

58:                                               ; preds = %50, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
