; ModuleID = '../data/hip_kernels/175/51/main.cu'
source_filename = "../data/hip_kernels/175/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28findCentroidsAtomicFreeLocaliPiiS_S_Pj(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul nsw i32 %9, %2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %13 = mul nsw i32 %7, %0
  %14 = add nsw i32 %7, 1
  %15 = mul nsw i32 %14, %0
  %16 = tail call i32 @llvm.smin.i32(i32 %15, i32 %2)
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %46, label %18

18:                                               ; preds = %59, %6
  %19 = phi i32 [ 0, %6 ], [ %60, %59 ]
  %20 = phi i32 [ 0, %6 ], [ %61, %59 ]
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 16
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 8, !tbaa !5
  %25 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !14, !invariant.load !15
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 4, !range !14, !invariant.load !15
  %37 = zext i16 %36 to i32
  %38 = mul i32 %7, %37
  %39 = mul i32 %38, %33
  %40 = shl nuw nsw i32 %9, 5
  %41 = add i32 %40, %8
  %42 = add i32 %41, %39
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  store i32 %20, i32 addrspace(1)* %44, align 4, !tbaa !16
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  store i32 %19, i32 addrspace(1)* %45, align 4, !tbaa !16
  ret void

46:                                               ; preds = %6, %59
  %47 = phi i32 [ %61, %59 ], [ 0, %6 ]
  %48 = phi i32 [ %62, %59 ], [ %13, %6 ]
  %49 = phi i32 [ %60, %59 ], [ 0, %6 ]
  %50 = sext i32 %48 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !15
  %53 = icmp eq i32 %52, %8
  br i1 %53, label %54, label %59

54:                                               ; preds = %46
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %50
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !15
  %57 = add nsw i32 %56, %47
  %58 = add nsw i32 %49, 1
  br label %59

59:                                               ; preds = %46, %54
  %60 = phi i32 [ %58, %54 ], [ %49, %46 ]
  %61 = phi i32 [ %57, %54 ], [ %47, %46 ]
  %62 = add nsw i32 %48, 1
  %63 = icmp slt i32 %62, %16
  br i1 %63, label %46, label %18, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 16}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
