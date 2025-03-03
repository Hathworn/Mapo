; ModuleID = '../data/hip_kernels/11474/59/main.cu'
source_filename = "../data/hip_kernels/11474/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8getValueP15HIP_vector_typeIfLj4EEPf(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %4 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %5 = load float, float addrspace(1)* %4, align 4, !tbaa !4, !amdgpu.noclobber !8
  %6 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %7 = load float, float addrspace(1)* %6, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = insertelement <4 x float> undef, float %3, i64 0
  %11 = insertelement <4 x float> %10, float %5, i64 1
  %12 = insertelement <4 x float> %11, float %7, i64 2
  %13 = insertelement <4 x float> %12, float %9, i64 3
  %14 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  store <4 x float> %13, <4 x float> addrspace(1)* %14, align 16
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

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
