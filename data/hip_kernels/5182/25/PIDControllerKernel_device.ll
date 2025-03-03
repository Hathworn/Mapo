; ModuleID = '../data/hip_kernels/5182/25/main.cu'
source_filename = "../data/hip_kernels/5182/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_PROPORTIONAL_GAIN = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_INTEGRAL_GAIN = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_DERIVATIVE_GAIN = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_INTEGRAL_DECAY = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_OFFSET = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_MIN_OUTPUT = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_MAX_OUTPUT = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_COUNT = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [8 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_COUNT to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_DERIVATIVE_GAIN to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_INTEGRAL_DECAY to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_INTEGRAL_GAIN to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_MAX_OUTPUT to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_MIN_OUTPUT to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_OFFSET to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_PROPORTIONAL_GAIN to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19PIDControllerKernelPfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = load i32, i32 addrspace(4)* @D_COUNT, align 4, !tbaa !16
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %61

28:                                               ; preds = %5
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !20, !amdgpu.noclobber !5
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !20, !amdgpu.noclobber !5
  %34 = fsub contract float %31, %33
  %35 = load float, float addrspace(4)* @D_INTEGRAL_DECAY, align 4, !tbaa !20
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !20, !amdgpu.noclobber !5
  %38 = fmul contract float %35, %37
  %39 = fadd contract float %34, %38
  store float %39, float addrspace(1)* %36, align 4, !tbaa !20
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !20
  %42 = fsub contract float %34, %41
  store float %34, float addrspace(1)* %40, align 4, !tbaa !20
  %43 = load float, float addrspace(4)* @D_OFFSET, align 4, !tbaa !20
  %44 = load float, float addrspace(4)* @D_PROPORTIONAL_GAIN, align 4, !tbaa !20
  %45 = fmul contract float %34, %44
  %46 = fadd contract float %43, %45
  %47 = load float, float addrspace(4)* @D_INTEGRAL_GAIN, align 4, !tbaa !20
  %48 = load float, float addrspace(1)* %36, align 4, !tbaa !20
  %49 = fmul contract float %47, %48
  %50 = fadd contract float %46, %49
  %51 = load float, float addrspace(4)* @D_DERIVATIVE_GAIN, align 4, !tbaa !20
  %52 = fmul contract float %42, %51
  %53 = fadd contract float %50, %52
  %54 = load float, float addrspace(4)* @D_MAX_OUTPUT, align 4, !tbaa !20
  %55 = fcmp contract ogt float %53, %54
  %56 = select i1 %55, float %54, float %53
  %57 = load float, float addrspace(4)* @D_MIN_OUTPUT, align 4, !tbaa !20
  %58 = fcmp contract olt float %56, %57
  %59 = select i1 %58, float %57, float %56
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  store float %59, float addrspace(1)* %60, align 4, !tbaa !20
  br label %61

61:                                               ; preds = %28, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
