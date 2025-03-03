; ModuleID = '../data/hip_kernels/2766/24/main.cu'
source_filename = "../data/hip_kernels/2766/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21cudaSScaleSign_kerneljPfS_ffS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float %3, float %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  %25 = fcmp contract une float %4, 0.000000e+00
  %26 = icmp ult i32 %18, %0
  br i1 %25, label %28, label %27

27:                                               ; preds = %6
  br i1 %26, label %46, label %60

28:                                               ; preds = %6
  br i1 %26, label %29, label %60

29:                                               ; preds = %28, %29
  %30 = phi i32 [ %44, %29 ], [ %18, %28 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %34 = fcmp contract oge float %33, 0.000000e+00
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fneg contract float %36
  %38 = select contract i1 %34, float %36, float %37
  %39 = fmul contract float %38, %3
  %40 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %42 = fmul contract float %41, %4
  %43 = fadd contract float %39, %42
  store float %43, float addrspace(1)* %40, align 4, !tbaa !16
  %44 = add i32 %30, %24
  %45 = icmp ult i32 %44, %0
  br i1 %45, label %29, label %60, !llvm.loop !20

46:                                               ; preds = %27, %46
  %47 = phi i32 [ %58, %46 ], [ %18, %27 ]
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fcmp contract oge float %50, 0.000000e+00
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fneg contract float %53
  %55 = select contract i1 %51, float %53, float %54
  %56 = fmul contract float %55, %3
  %57 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  store float %56, float addrspace(1)* %57, align 4, !tbaa !16
  %58 = add i32 %47, %24
  %59 = icmp ult i32 %58, %0
  br i1 %59, label %46, label %60, !llvm.loop !22

60:                                               ; preds = %46, %29, %27, %28
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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
