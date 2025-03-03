; ModuleID = '../data/hip_kernels/16024/0/main.cu'
source_filename = "../data/hip_kernels/16024/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8NextQTurPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %1, i64 %4
  %6 = load float, float addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = fmul contract float %6, 0x3F1A36E2E0000000
  %8 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = fadd contract float %9, %7
  store float %10, float addrspace(1)* %8, align 4, !tbaa !5
  %11 = add nuw nsw i32 %3, 1
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5
  %15 = fmul contract float %14, 0x3F1A36E2E0000000
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = fadd contract float %17, %15
  store float %18, float addrspace(1)* %16, align 4, !tbaa !5
  %19 = add nuw nsw i32 %3, 2
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %23 = fmul contract float %22, 0x3F1A36E2E0000000
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = fadd contract float %25, %23
  store float %26, float addrspace(1)* %24, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
