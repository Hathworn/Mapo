; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/73/apply_weight_decay_util_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/73/apply_weight_decay_util_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30apply_weight_decay_util_kernelPK15HIP_vector_typeIfLj4EEPS0_fi(%struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture %1, float %2, i32 %3) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %45

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load float, float addrspace(1)* %17, align 16, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load float, float addrspace(1)* %19, align 4, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 2
  %22 = load float, float addrspace(1)* %21, align 8, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 3
  %24 = load float, float addrspace(1)* %23, align 4, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 0
  %26 = load float, float addrspace(1)* %25, align 16, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 1
  %28 = load float, float addrspace(1)* %27, align 4, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 2
  %30 = load float, float addrspace(1)* %29, align 8, !amdgpu.noclobber !5
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 3
  %32 = load float, float addrspace(1)* %31, align 4, !amdgpu.noclobber !5
  %33 = fmul contract float %18, %2
  %34 = fsub contract float 1.000000e+00, %33
  %35 = fmul contract float %20, %2
  %36 = fsub contract float 1.000000e+00, %35
  %37 = fmul contract float %22, %2
  %38 = fsub contract float 1.000000e+00, %37
  %39 = fmul contract float %24, %2
  %40 = fsub contract float 1.000000e+00, %39
  %41 = fmul contract float %34, %26
  %42 = fmul contract float %36, %28
  %43 = fmul contract float %38, %30
  %44 = fmul contract float %40, %32
  store float %41, float addrspace(1)* %25, align 16
  store float %42, float addrspace(1)* %27, align 4
  store float %43, float addrspace(1)* %29, align 8
  store float %44, float addrspace(1)* %31, align 4
  br label %45

45:                                               ; preds = %15, %4
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
