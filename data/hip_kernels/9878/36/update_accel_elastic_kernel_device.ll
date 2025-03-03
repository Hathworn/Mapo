; ModuleID = '../data/hip_kernels/9878/36/main.cu'
source_filename = "../data/hip_kernels/9878/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27update_accel_elastic_kernelPfPKfifS1_S1_S1_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = udiv i32 %17, %14
  %20 = mul i32 %19, %14
  %21 = icmp ugt i32 %17, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %18
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %14
  %27 = add i32 %26, %8
  %28 = icmp slt i32 %27, %2
  br i1 %28, label %29, label %60

29:                                               ; preds = %7
  %30 = mul nsw i32 %27, 3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !6
  %34 = sext i32 %27 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !6
  %37 = fmul contract float %33, %36
  %38 = add nsw i32 %30, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !6
  %42 = fmul contract float %41, %3
  %43 = fadd contract float %37, %42
  store float %43, float addrspace(1)* %32, align 4, !tbaa !16
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !6
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = fmul contract float %45, %47
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fmul contract float %50, %3
  %52 = fsub contract float %48, %51
  store float %52, float addrspace(1)* %44, align 4, !tbaa !16
  %53 = add nsw i32 %30, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !6
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %34
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fmul contract float %56, %58
  store float %59, float addrspace(1)* %55, align 4, !tbaa !16
  br label %60

60:                                               ; preds = %29, %7
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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
