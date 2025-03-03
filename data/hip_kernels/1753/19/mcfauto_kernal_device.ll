; ModuleID = '../data/hip_kernels/1753/19/main.cu'
source_filename = "../data/hip_kernels/1753/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14mcfauto_kernalPKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !5
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !14, !invariant.load !15
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = shl i32 %21, 8
  %23 = shl nuw nsw i32 %4, 1
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %62

26:                                               ; preds = %3
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !15
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !15
  %32 = fmul contract float %29, %31
  %33 = or i32 %24, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !15
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !15
  %39 = fmul contract float %36, %38
  %40 = fadd contract float %32, %39
  %41 = fcmp olt float %40, 0x39F0000000000000
  %42 = select i1 %41, float 0x41F0000000000000, float 1.000000e+00
  %43 = fmul float %40, %42
  %44 = tail call float @llvm.sqrt.f32(float %43)
  %45 = bitcast float %44 to i32
  %46 = add nsw i32 %45, -1
  %47 = bitcast i32 %46 to float
  %48 = add nsw i32 %45, 1
  %49 = bitcast i32 %48 to float
  %50 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 608)
  %51 = select i1 %41, float 0x3EF0000000000000, float 1.000000e+00
  %52 = fneg float %49
  %53 = tail call float @llvm.fma.f32(float %52, float %44, float %43)
  %54 = fcmp ogt float %53, 0.000000e+00
  %55 = fneg float %47
  %56 = tail call float @llvm.fma.f32(float %55, float %44, float %43)
  %57 = fcmp ole float %56, 0.000000e+00
  %58 = select i1 %57, float %47, float %44
  %59 = select i1 %54, float %49, float %58
  %60 = fmul float %51, %59
  %61 = select i1 %50, float %43, float %60
  store float %61, float addrspace(1)* %30, align 4, !tbaa !16
  store float 0.000000e+00, float addrspace(1)* %37, align 4, !tbaa !16
  br label %62

62:                                               ; preds = %26, %3
  ret void
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{!6, !10, i64 12}
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
