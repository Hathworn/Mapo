; ModuleID = '../data/hip_kernels/1874/2/main.cu'
source_filename = "../data/hip_kernels/1874/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17boundaryConditioniPdS_S_(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %6 = load double, double addrspace(1)* %5, align 8, !tbaa !4, !amdgpu.noclobber !8
  store double %6, double addrspace(1)* %1, align 8, !tbaa !4
  %7 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !4
  %9 = fneg contract double %8
  store double %9, double addrspace(1)* %2, align 8, !tbaa !4
  %10 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4
  store double %11, double addrspace(1)* %3, align 8, !tbaa !4
  %12 = add nsw i32 %0, -2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds double, double addrspace(1)* %1, i64 %13
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4
  %16 = add nsw i32 %0, -1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, double addrspace(1)* %1, i64 %17
  store double %15, double addrspace(1)* %18, align 8, !tbaa !4
  %19 = getelementptr inbounds double, double addrspace(1)* %2, i64 %13
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4
  %21 = fneg contract double %20
  %22 = getelementptr inbounds double, double addrspace(1)* %2, i64 %17
  store double %21, double addrspace(1)* %22, align 8, !tbaa !4
  %23 = getelementptr inbounds double, double addrspace(1)* %3, i64 %13
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !4
  %25 = getelementptr inbounds double, double addrspace(1)* %3, i64 %17
  store double %24, double addrspace(1)* %25, align 8, !tbaa !4
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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
