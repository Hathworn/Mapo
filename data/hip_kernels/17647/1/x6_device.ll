; ModuleID = '../data/hip_kernels/17647/1/main.cu'
source_filename = "../data/hip_kernels/17647/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2x6PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %12
  %20 = mul i32 %17, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %19, %21
  %23 = icmp slt i32 %22, %3
  br i1 %23, label %24, label %35

24:                                               ; preds = %4, %24
  %25 = phi i32 [ %33, %24 ], [ %22, %4 ]
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16
  %31 = fadd contract float %28, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  store float %31, float addrspace(1)* %32, align 4, !tbaa !16
  %33 = add nsw i32 %25, %20
  %34 = icmp slt i32 %33, %3
  br i1 %34, label %24, label %35, !llvm.loop !20

35:                                               ; preds = %24, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
