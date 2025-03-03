; ModuleID = '../data/hip_kernels/1538/14/main.cu'
source_filename = "../data/hip_kernels/1538/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16normalize_kerneliPfS_S_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %8
  %25 = mul i32 %24, %17
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %27, %0
  br i1 %28, label %29, label %64

29:                                               ; preds = %7
  %30 = sdiv i32 %27, %6
  %31 = srem i32 %30, %5
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !14
  %35 = sext i32 %31 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !14
  %38 = fsub contract float %34, %37
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !14
  %41 = fadd contract float %40, 0x3EE4F8B580000000
  %42 = fcmp olt float %41, 0x39F0000000000000
  %43 = select i1 %42, float 0x41F0000000000000, float 1.000000e+00
  %44 = fmul float %41, %43
  %45 = tail call float @llvm.sqrt.f32(float %44)
  %46 = bitcast float %45 to i32
  %47 = add nsw i32 %46, -1
  %48 = bitcast i32 %47 to float
  %49 = add nsw i32 %46, 1
  %50 = bitcast i32 %49 to float
  %51 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 608)
  %52 = select i1 %42, float 0x3EF0000000000000, float 1.000000e+00
  %53 = fneg float %50
  %54 = tail call float @llvm.fma.f32(float %53, float %45, float %44)
  %55 = fcmp ogt float %54, 0.000000e+00
  %56 = fneg float %48
  %57 = tail call float @llvm.fma.f32(float %56, float %45, float %44)
  %58 = fcmp ole float %57, 0.000000e+00
  %59 = select i1 %58, float %48, float %45
  %60 = select i1 %55, float %50, float %59
  %61 = fmul float %52, %60
  %62 = select i1 %51, float %44, float %61
  %63 = fdiv contract float %38, %62
  store float %63, float addrspace(1)* %33, align 4, !tbaa !16
  br label %64

64:                                               ; preds = %7, %29
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
