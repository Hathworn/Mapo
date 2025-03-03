; ModuleID = '../data/hip_kernels/9088/2/main.cu'
source_filename = "../data/hip_kernels/9088/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z46cunn_ClassNLLCriterion_updateGradInput_kernel1PfS_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = load float, float addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = fcmp contract ugt float %7, 0.000000e+00
  br i1 %8, label %9, label %30

9:                                                ; preds = %6
  %10 = icmp eq i32 %4, 0
  %11 = fdiv contract float 1.000000e+00, %7
  %12 = select contract i1 %10, float 1.000000e+00, float %11
  %13 = load float, float addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi float %13 to i32
  %15 = icmp slt i32 %14, 1
  %16 = icmp sgt i32 %14, %5
  %17 = select i1 %15, i1 true, i1 %16
  br i1 %17, label %30, label %18

18:                                               ; preds = %9
  %19 = add nsw i32 %14, -1
  %20 = icmp eq float addrspace(1)* %1, addrspacecast (float* null to float addrspace(1)*)
  %21 = zext i32 %19 to i64
  br i1 %20, label %25, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !4, !amdgpu.noclobber !8
  br label %25

25:                                               ; preds = %18, %22
  %26 = phi contract float [ %24, %22 ], [ 1.000000e+00, %18 ]
  %27 = fneg contract float %26
  %28 = fmul contract float %12, %27
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float %28, float addrspace(1)* %29, align 4, !tbaa !4
  br label %30

30:                                               ; preds = %9, %25, %6
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
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
