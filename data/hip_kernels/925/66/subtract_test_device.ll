; ModuleID = '../data/hip_kernels/925/66/main.cu'
source_filename = "../data/hip_kernels/925/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13subtract_testP15HIP_vector_typeIdLj2EES1_S1_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  %5 = load <2 x double>, <2 x double> addrspace(1)* %4, align 16, !amdgpu.noclobber !4
  %6 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 0, i32 0, i32 0, i32 0
  %7 = load <2 x double>, <2 x double> addrspace(1)* %6, align 16, !amdgpu.noclobber !4
  %8 = extractelement <2 x double> %5, i64 0
  %9 = extractelement <2 x double> %7, i64 0
  %10 = fsub contract double %8, %9
  %11 = extractelement <2 x double> %5, i64 1
  %12 = extractelement <2 x double> %7, i64 1
  %13 = fsub contract double %11, %12
  %14 = insertelement <2 x double> undef, double %10, i64 0
  %15 = insertelement <2 x double> %14, double %13, i64 1
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 0, i32 0, i32 0, i32 0
  store <2 x double> %15, <2 x double> addrspace(1)* %16, align 16
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
!4 = !{}
