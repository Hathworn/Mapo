; ModuleID = '../data/hip_kernels/8192/201/main.cu'
source_filename = "../data/hip_kernels/8192/201/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20AdaptRefVectorKerneliPffffPiS_i(i32 %0, float addrspace(1)* nocapture %1, float %2, float %3, float %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %18
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %17
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %25
  %29 = icmp slt i32 %28, %7
  br i1 %29, label %30, label %63

30:                                               ; preds = %8
  %31 = fsub contract float %3, %2
  %32 = fneg contract float %4
  %33 = sext i32 %0 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !5
  %36 = sitofp i32 %35 to float
  %37 = fmul contract float %32, %36
  %38 = fmul float %37, 0x3FF7154760000000
  %39 = tail call float @llvm.rint.f32(float %38)
  %40 = fcmp ogt float %37, 0x40562E4300000000
  %41 = fcmp olt float %37, 0xC059D1DA00000000
  %42 = fneg float %38
  %43 = tail call float @llvm.fma.f32(float %37, float 0x3FF7154760000000, float %42)
  %44 = tail call float @llvm.fma.f32(float %37, float 0x3E54AE0BE0000000, float %43)
  %45 = fsub float %38, %39
  %46 = fadd float %44, %45
  %47 = tail call float @llvm.exp2.f32(float %46)
  %48 = fptosi float %39 to i32
  %49 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %48)
  %50 = select i1 %41, float 0.000000e+00, float %49
  %51 = select i1 %40, float 0x7FF0000000000000, float %50
  %52 = fmul contract float %31, %51
  %53 = fadd contract float %52, %2
  %54 = mul nsw i32 %7, %0
  %55 = add nsw i32 %28, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !20, !amdgpu.noclobber !5
  %59 = fmul contract float %58, %53
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !20, !amdgpu.noclobber !5
  %62 = fadd contract float %61, %59
  store float %62, float addrspace(1)* %60, align 4, !tbaa !20
  br label %63

63:                                               ; preds = %30, %8
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
