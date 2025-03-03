; ModuleID = '../data/hip_kernels/18353/3/main.cu'
source_filename = "../data/hip_kernels/18353/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z67awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernelPlS_S_S_S_S_l(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture writeonly %3, i64 addrspace(1)* nocapture writeonly %4, i64 addrspace(1)* nocapture writeonly %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !15
  %26 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %25, %29
  %31 = mul i32 %30, %29
  %32 = icmp ugt i32 %25, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %36 = mul i32 %34, %35
  %37 = add i32 %36, %9
  %38 = mul i32 %37, %22
  %39 = add i32 %38, %8
  %40 = zext i32 %39 to i64
  %41 = zext i16 %16 to i64
  %42 = mul nuw nsw i64 %40, %41
  %43 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %44 = zext i32 %43 to i64
  %45 = add nuw nsw i64 %42, %44
  %46 = icmp slt i64 %45, %6
  br i1 %46, label %47, label %65

47:                                               ; preds = %7
  %48 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %45
  %49 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !17, !amdgpu.noclobber !14
  %50 = add nsw i64 %49, -1
  %51 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %50
  %52 = load i64, i64 addrspace(1)* %51, align 8, !tbaa !17, !amdgpu.noclobber !14
  %53 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %45
  store i64 %52, i64 addrspace(1)* %53, align 8, !tbaa !17
  %54 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %45
  %55 = load i64, i64 addrspace(1)* %54, align 8, !tbaa !17
  %56 = icmp slt i64 %55, 0
  %57 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %45
  br i1 %56, label %58, label %59

58:                                               ; preds = %47
  store i64 -1, i64 addrspace(1)* %57, align 8, !tbaa !17
  br label %61

59:                                               ; preds = %47
  store i64 %45, i64 addrspace(1)* %57, align 8, !tbaa !17
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %49
  br label %61

61:                                               ; preds = %59, %58
  %62 = phi i64 addrspace(1)* [ %51, %58 ], [ %60, %59 ]
  %63 = load i64, i64 addrspace(1)* %62, align 8, !tbaa !17
  %64 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %45
  store i64 %63, i64 addrspace(1)* %64, align 8, !tbaa !17
  br label %65

65:                                               ; preds = %61, %7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"long", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
