; ModuleID = '../data/hip_kernels/121/95/main.cu'
source_filename = "../data/hip_kernels/121/95/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z39kBesselRatioActivationContinuedFractionPfS_fij(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = icmp ult i32 %17, %4
  br i1 %24, label %25, label %30

25:                                               ; preds = %5
  %26 = sitofp i32 %3 to float
  %27 = fadd contract float %26, %2
  %28 = fmul contract float %27, 2.000000e+00
  %29 = icmp sgt i32 %3, 1
  br label %31

30:                                               ; preds = %37, %5
  ret void

31:                                               ; preds = %25, %37
  %32 = phi i32 [ %17, %25 ], [ %41, %37 ]
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %36 = fdiv contract float %28, %35
  br i1 %29, label %43, label %37

37:                                               ; preds = %43, %31
  %38 = phi float [ %36, %31 ], [ %52, %43 ]
  %39 = fdiv contract float 1.000000e+00, %38
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %39, float addrspace(1)* %40, align 4, !tbaa !16
  %41 = add i32 %32, %23
  %42 = icmp ult i32 %41, %4
  br i1 %42, label %31, label %30, !llvm.loop !20

43:                                               ; preds = %31, %43
  %44 = phi i32 [ %46, %43 ], [ %3, %31 ]
  %45 = phi float [ %52, %43 ], [ %36, %31 ]
  %46 = add nsw i32 %44, -1
  %47 = sitofp i32 %46 to float
  %48 = fadd contract float %47, %2
  %49 = fmul contract float %48, 2.000000e+00
  %50 = fdiv contract float %49, %35
  %51 = fdiv contract float 1.000000e+00, %45
  %52 = fadd contract float %51, %50
  %53 = icmp ugt i32 %44, 2
  br i1 %53, label %43, label %37, !llvm.loop !22
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
