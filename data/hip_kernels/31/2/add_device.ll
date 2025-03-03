; ModuleID = '../data/hip_kernels/31/2/main.cu'
source_filename = "../data/hip_kernels/31/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3addPfS_S_S_S_S_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %26

9:                                                ; preds = %6
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %13 = getelementptr inbounds float, float addrspace(1)* %3, i64 %10
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !4, !amdgpu.noclobber !8
  %15 = fadd contract float %12, %14
  store float %15, float addrspace(1)* %11, align 4, !tbaa !4
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !4
  %18 = getelementptr inbounds float, float addrspace(1)* %4, i64 %10
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !4
  %20 = fadd contract float %17, %19
  store float %20, float addrspace(1)* %16, align 4, !tbaa !4
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %10
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !4
  %23 = getelementptr inbounds float, float addrspace(1)* %5, i64 %10
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !4
  %25 = fadd contract float %22, %24
  store float %25, float addrspace(1)* %21, align 4, !tbaa !4
  br label %26

26:                                               ; preds = %6, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
