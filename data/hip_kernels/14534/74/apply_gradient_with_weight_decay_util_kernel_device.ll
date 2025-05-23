; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/74/apply_gradient_with_weight_decay_util_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/74/apply_gradient_with_weight_decay_util_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z44apply_gradient_with_weight_decay_util_kernelPK15HIP_vector_typeIfLj2EES2_PS0_fi(%struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture %2, float %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %38

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 0
  %19 = load float, float addrspace(1)* %18, align 8, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %17, i32 0, i32 0, i32 0, i64 1
  %21 = load float, float addrspace(1)* %20, align 4, !amdgpu.noclobber !5
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 0
  %23 = load float, float addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %17, i32 0, i32 0, i32 0, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 0, i64 0
  %27 = load float, float addrspace(1)* %26, align 8, !amdgpu.noclobber !5
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 0, i64 1
  %29 = load float, float addrspace(1)* %28, align 4, !amdgpu.noclobber !5
  %30 = fmul contract float %23, %3
  %31 = fsub contract float %27, %30
  %32 = fmul contract float %19, %31
  %33 = fadd contract float %23, %32
  %34 = fmul contract float %25, %3
  %35 = fsub contract float %29, %34
  %36 = fmul contract float %21, %35
  %37 = fadd contract float %25, %36
  store float %33, float addrspace(1)* %22, align 8
  store float %37, float addrspace(1)* %24, align 4
  br label %38

38:                                               ; preds = %16, %5
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
