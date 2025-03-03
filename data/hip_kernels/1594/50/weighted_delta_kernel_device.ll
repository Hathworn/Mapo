; ModuleID = '../data/hip_kernels/1594/50/main.cu'
source_filename = "../data/hip_kernels/1594/50/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21weighted_delta_kerneliPfS_S_S_S_S_S_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* %4, float addrspace(1)* %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !4
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %18
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %0
  br i1 %29, label %30, label %67

30:                                               ; preds = %8
  %31 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  br i1 %31, label %42, label %32

32:                                               ; preds = %30
  %33 = sext i32 %28 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %7, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !14
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !14
  %38 = fmul contract float %35, %37
  %39 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !14
  %41 = fadd contract float %40, %38
  store float %41, float addrspace(1)* %39, align 4, !tbaa !16
  br label %42

42:                                               ; preds = %32, %30
  %43 = icmp eq float addrspace(1)* %5, addrspacecast (float* null to float addrspace(1)*)
  %44 = sext i32 %28 to i64
  br i1 %43, label %55, label %45

45:                                               ; preds = %42
  %46 = getelementptr inbounds float, float addrspace(1)* %7, i64 %44
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = fsub contract float 1.000000e+00, %49
  %51 = fmul contract float %47, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fadd contract float %53, %51
  store float %54, float addrspace(1)* %52, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %42, %45
  %56 = getelementptr inbounds float, float addrspace(1)* %7, i64 %44
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fsub contract float %59, %61
  %63 = fmul contract float %57, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %6, i64 %44
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fadd contract float %65, %63
  store float %66, float addrspace(1)* %64, align 4, !tbaa !16
  br label %67

67:                                               ; preds = %55, %8
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
