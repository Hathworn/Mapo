; ModuleID = '../data/hip_kernels/14502/3/main.cu'
source_filename = "../data/hip_kernels/14502/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3addPiS_S_S_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %9 = add nsw i32 %8, %7
  store i32 %9, i32 addrspace(1)* %2, align 4, !tbaa !4
  %10 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  %11 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %12 = sub nsw i32 %10, %11
  store i32 %12, i32 addrspace(1)* %3, align 4, !tbaa !4
  %13 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  %14 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %15 = mul nsw i32 %14, %13
  store i32 %15, i32 addrspace(1)* %4, align 4, !tbaa !4
  %16 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  %17 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %18 = sdiv i32 %16, %17
  store i32 %18, i32 addrspace(1)* %5, align 4, !tbaa !4
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
