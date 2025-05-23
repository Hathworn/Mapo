; ModuleID = '../data/hip_kernels/324/158/main.cu'
source_filename = "../data/hip_kernels/324/158/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8kRMSPropPfS_fi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = udiv i32 %13, %10
  %18 = mul i32 %17, %10
  %19 = icmp ugt i32 %13, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %10
  %23 = icmp ult i32 %16, %3
  br i1 %23, label %24, label %26

24:                                               ; preds = %4
  %25 = fsub contract float 1.000000e+00, %2
  br label %27

26:                                               ; preds = %27, %4
  ret void

27:                                               ; preds = %24, %27
  %28 = phi i32 [ %16, %24 ], [ %60, %27 ]
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = fmul contract float %31, %2
  %33 = fmul contract float %31, %32
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %36 = fmul contract float %25, %35
  %37 = fmul contract float %35, %36
  %38 = fadd contract float %33, %37
  %39 = fcmp olt float %38, 0x39F0000000000000
  %40 = select i1 %39, float 0x41F0000000000000, float 1.000000e+00
  %41 = fmul float %38, %40
  %42 = tail call float @llvm.sqrt.f32(float %41)
  %43 = bitcast float %42 to i32
  %44 = add nsw i32 %43, -1
  %45 = bitcast i32 %44 to float
  %46 = add nsw i32 %43, 1
  %47 = bitcast i32 %46 to float
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %41, i32 608)
  %49 = select i1 %39, float 0x3EF0000000000000, float 1.000000e+00
  %50 = fneg float %47
  %51 = tail call float @llvm.fma.f32(float %50, float %42, float %41)
  %52 = fcmp ogt float %51, 0.000000e+00
  %53 = fneg float %45
  %54 = tail call float @llvm.fma.f32(float %53, float %42, float %41)
  %55 = fcmp ole float %54, 0.000000e+00
  %56 = select i1 %55, float %45, float %42
  %57 = select i1 %52, float %47, float %56
  %58 = fmul float %49, %57
  %59 = select i1 %48, float %41, float %58
  store float %59, float addrspace(1)* %30, align 4, !tbaa !16
  %60 = add i32 %28, %22
  %61 = icmp ult i32 %60, %3
  br i1 %61, label %27, label %26, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
