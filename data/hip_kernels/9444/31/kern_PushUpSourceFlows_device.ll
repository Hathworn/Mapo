; ModuleID = '../data/hip_kernels/9444/31/main.cu'
source_filename = "../data/hip_kernels/9444/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22kern_PushUpSourceFlowsPfS_S_S_S_ffi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = udiv i32 %17, %14
  %20 = mul i32 %19, %14
  %21 = icmp ugt i32 %17, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 16
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 8, !tbaa !16
  %28 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %27, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %38 = mul i32 %36, %37
  %39 = add i32 %38, %24
  %40 = mul i32 %39, %23
  %41 = add i32 %40, %18
  %42 = mul i32 %41, %14
  %43 = add i32 %42, %9
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = icmp slt i32 %43, %7
  br i1 %46, label %47, label %63

47:                                               ; preds = %8
  %48 = load float, float addrspace(1)* %45, align 4, !tbaa !17, !amdgpu.noclobber !6
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !17, !amdgpu.noclobber !6
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !17, !amdgpu.noclobber !6
  %53 = fsub contract float %50, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !17, !amdgpu.noclobber !6
  %56 = fadd contract float %53, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !17, !amdgpu.noclobber !6
  %59 = fmul contract float %58, %6
  %60 = fsub contract float %56, %59
  %61 = fmul contract float %60, %5
  %62 = fadd contract float %48, %61
  store float %62, float addrspace(1)* %45, align 4, !tbaa !17
  br label %63

63:                                               ; preds = %47, %8
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
