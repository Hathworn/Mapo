; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/20/rectified_linear_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/20/rectified_linear_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23rectified_linear_kernelP15HIP_vector_typeIfLj4EEPKS0_fi(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, float %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %41

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load float, float addrspace(1)* %17, align 16, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load float, float addrspace(1)* %19, align 4, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 2
  %22 = load float, float addrspace(1)* %21, align 8, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 3
  %24 = load float, float addrspace(1)* %23, align 4, !amdgpu.noclobber !5
  %25 = fcmp contract olt float %18, 0.000000e+00
  %26 = select i1 %25, float %2, float 1.000000e+00
  %27 = fmul contract float %18, %26
  %28 = fcmp contract olt float %20, 0.000000e+00
  %29 = select i1 %28, float %2, float 1.000000e+00
  %30 = fmul contract float %20, %29
  %31 = fcmp contract olt float %22, 0.000000e+00
  %32 = select i1 %31, float %2, float 1.000000e+00
  %33 = fmul contract float %22, %32
  %34 = fcmp contract olt float %24, 0.000000e+00
  %35 = select i1 %34, float %2, float 1.000000e+00
  %36 = fmul contract float %24, %35
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 0
  store float %27, float addrspace(1)* %37, align 16
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 1
  store float %30, float addrspace(1)* %38, align 4
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 2
  store float %33, float addrspace(1)* %39, align 8
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 3
  store float %36, float addrspace(1)* %40, align 4
  br label %41

41:                                               ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
