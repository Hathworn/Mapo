; ModuleID = '../data/hip_kernels/3679/15/main.cu'
source_filename = "../data/hip_kernels/3679/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22normalize_delta_kerneliPfS_S_S_S_iiiS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %11
  %28 = mul i32 %27, %20
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %81

32:                                               ; preds = %10
  %33 = sdiv i32 %30, %8
  %34 = srem i32 %33, %7
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %9, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !14
  %38 = sext i32 %34 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
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
  %63 = fdiv contract float %37, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %5, i64 %38
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = fmul contract float %65, 2.000000e+00
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !14
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !14
  %71 = fsub contract float %68, %70
  %72 = fmul contract float %66, %71
  %73 = mul nsw i32 %8, %6
  %74 = sitofp i32 %73 to float
  %75 = fdiv contract float %72, %74
  %76 = fadd contract float %75, %63
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !14
  %79 = fdiv contract float %78, %74
  %80 = fadd contract float %79, %76
  store float %80, float addrspace(1)* %36, align 4, !tbaa !16
  br label %81

81:                                               ; preds = %10, %32
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
