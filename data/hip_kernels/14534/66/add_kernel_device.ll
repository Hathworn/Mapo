; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/66/add_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14534/66/add_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10add_kernelP15HIP_vector_typeIfLj4EEPKS0_S3_ffi(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %2, float %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %51

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = load float, float addrspace(1)* %19, align 16, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 1
  %22 = load float, float addrspace(1)* %21, align 4, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 2
  %24 = load float, float addrspace(1)* %23, align 8, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 3
  %26 = load float, float addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i64 0
  %28 = load float, float addrspace(1)* %27, align 16, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i64 1
  %30 = load float, float addrspace(1)* %29, align 4, !amdgpu.noclobber !5
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i64 2
  %32 = load float, float addrspace(1)* %31, align 8, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i64 3
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = fmul contract float %20, %3
  %36 = fmul contract float %28, %4
  %37 = fadd contract float %35, %36
  %38 = fmul contract float %22, %3
  %39 = fmul contract float %30, %4
  %40 = fadd contract float %38, %39
  %41 = fmul contract float %24, %3
  %42 = fmul contract float %32, %4
  %43 = fadd contract float %41, %42
  %44 = fmul contract float %26, %3
  %45 = fmul contract float %34, %4
  %46 = fadd contract float %44, %45
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  store float %37, float addrspace(1)* %47, align 16
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  store float %40, float addrspace(1)* %48, align 4
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  store float %43, float addrspace(1)* %49, align 8
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 3
  store float %46, float addrspace(1)* %50, align 4
  br label %51

51:                                               ; preds = %17, %6
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
