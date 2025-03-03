; ModuleID = '../data/hip_kernels/10959/34/main.cu'
source_filename = "../data/hip_kernels/10959/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30TemporalConvolutionTBC_fp_biasPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = icmp slt i32 %12, %3
  br i1 %13, label %14, label %27

14:                                               ; preds = %4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 8, !tbaa !10
  %19 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !19, !invariant.load !9
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %18, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %18, %24
  %26 = zext i1 %25 to i32
  br label %28

27:                                               ; preds = %28, %4
  ret void

28:                                               ; preds = %14, %28
  %29 = phi i32 [ %12, %14 ], [ %35, %28 ]
  %30 = mul nsw i32 %29, %2
  %31 = add nsw i32 %30, %8
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float %11, float addrspace(1)* %33, align 4, !tbaa !5
  %34 = add i32 %23, %29
  %35 = add i32 %34, %26
  %36 = icmp slt i32 %35, %3
  br i1 %36, label %28, label %27, !llvm.loop !20
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !15, i64 16}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i16 1, i16 1025}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
