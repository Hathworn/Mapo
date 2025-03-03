; ModuleID = '../data/hip_kernels/866/12/main.cu'
source_filename = "../data/hip_kernels/866/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21momentum_update_1D_1DPfS_S_fffbi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float %3, float %4, float %5, i1 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = udiv i32 %17, %14
  %22 = mul i32 %21, %14
  %23 = icmp ugt i32 %17, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %14
  %27 = icmp slt i32 %20, %7
  br i1 %27, label %28, label %52

28:                                               ; preds = %8
  %29 = fneg contract float %5
  br label %30

30:                                               ; preds = %28, %30
  %31 = phi i32 [ %20, %28 ], [ %50, %30 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fcmp contract ogt float %34, %5
  %36 = select i1 %35, float %5, float %34
  %37 = fcmp contract olt float %36, %29
  %38 = select i1 %37, float %29, float %36
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = fmul contract float %40, %4
  %42 = fadd contract float %41, %38
  store float %42, float addrspace(1)* %39, align 4, !tbaa !16
  %43 = fmul contract float %42, %4
  %44 = fadd contract float %38, %43
  %45 = select i1 %6, float %44, float %42
  %46 = fmul contract float %45, %3
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = fsub contract float %48, %46
  store float %49, float addrspace(1)* %47, align 4, !tbaa !16
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !16
  %50 = add nsw i32 %31, %26
  %51 = icmp slt i32 %50, %7
  br i1 %51, label %30, label %52, !llvm.loop !20

52:                                               ; preds = %30, %8
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
