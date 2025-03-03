; ModuleID = '../data/hip_kernels/247/46/main.cu'
source_filename = "../data/hip_kernels/247/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9kCopyIntoPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
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
  %20 = mul i32 %19, %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %4
  br i1 %23, label %24, label %70

24:                                               ; preds = %5
  %25 = shl nsw i32 %3, 1
  %26 = add nsw i32 %25, %2
  %27 = mul i32 %2, %2
  %28 = mul i32 %27, %22
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = mul i32 %26, %26
  %32 = mul i32 %31, %22
  %33 = shl i32 %3, 8
  %34 = ashr exact i32 %33, 8
  %35 = shl i32 %26, 8
  %36 = ashr exact i32 %35, 8
  %37 = mul nsw i32 %36, %34
  %38 = add i32 %37, %3
  %39 = add i32 %38, %32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %43 = icmp slt i32 %42, %2
  br i1 %43, label %44, label %70

44:                                               ; preds = %24
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %46 = icmp ult i32 %45, %2
  %47 = shl i32 %2, 8
  %48 = ashr exact i32 %47, 8
  br label %49

49:                                               ; preds = %44, %56
  %50 = phi i32 [ %42, %44 ], [ %57, %56 ]
  br i1 %46, label %51, label %56

51:                                               ; preds = %49
  %52 = shl i32 %50, 8
  %53 = ashr exact i32 %52, 8
  %54 = mul nsw i32 %53, %48
  %55 = mul nsw i32 %53, %36
  br label %59

56:                                               ; preds = %59, %49
  %57 = add nuw nsw i32 %50, 16
  %58 = icmp slt i32 %57, %2
  br i1 %58, label %49, label %70, !llvm.loop !16

59:                                               ; preds = %51, %59
  %60 = phi i32 [ %45, %51 ], [ %68, %59 ]
  %61 = add nsw i32 %60, %54
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %30, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !18
  %65 = add nsw i32 %60, %55
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %41, i64 %66
  store float %64, float addrspace(1)* %67, align 4, !tbaa !18
  %68 = add nuw nsw i32 %60, 16
  %69 = icmp slt i32 %68, %2
  br i1 %69, label %59, label %56, !llvm.loop !22

70:                                               ; preds = %56, %24, %5
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
