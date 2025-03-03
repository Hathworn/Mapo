; ModuleID = '../data/hip_kernels/10552/89/main.cu'
source_filename = "../data/hip_kernels/10552/89/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_logplossiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %59

18:                                               ; preds = %4
  %19 = sitofp i32 %1 to float
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = icmp sgt i32 %0, 0
  br label %27

27:                                               ; preds = %18, %31
  %28 = phi i32 [ %16, %18 ], [ %32, %31 ]
  %29 = mul nsw i32 %28, %0
  %30 = add nsw i32 %29, %0
  br i1 %26, label %34, label %31

31:                                               ; preds = %34, %27
  %32 = add i32 %25, %28
  %33 = icmp slt i32 %32, %1
  br i1 %33, label %27, label %59, !llvm.loop !16

34:                                               ; preds = %27, %34
  %35 = phi i32 [ %57, %34 ], [ %29, %27 ]
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !18
  %39 = fmul float %38, 0x3FF7154760000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = fcmp ogt float %38, 0x40562E4300000000
  %42 = fcmp olt float %38, 0xC059D1DA00000000
  %43 = fneg float %39
  %44 = tail call float @llvm.fma.f32(float %38, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %38, float 0x3E54AE0BE0000000, float %44)
  %46 = fsub float %39, %40
  %47 = fadd float %45, %46
  %48 = tail call float @llvm.exp2.f32(float %47)
  %49 = fptosi float %40 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %49)
  %51 = select i1 %42, float 0.000000e+00, float %50
  %52 = select i1 %41, float 0x7FF0000000000000, float %51
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !18
  %55 = fsub contract float %52, %54
  %56 = fdiv contract float %55, %19
  store float %56, float addrspace(1)* %53, align 4, !tbaa !18
  %57 = add nsw i32 %35, 1
  %58 = icmp slt i32 %57, %30
  br i1 %58, label %34, label %31, !llvm.loop !22

59:                                               ; preds = %31, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
