; ModuleID = '../data/hip_kernels/3736/5/main.cu'
source_filename = "../data/hip_kernels/3736/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11addForces_kP15HIP_vector_typeIfLj2EEiiiiffim(%struct.HIP_vector_type addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, float %5, float %6, i32 %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %13 = add nsw i32 %11, %4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, %8
  %16 = getelementptr inbounds i8, i8 addrspace(1)* %12, i64 %15
  %17 = bitcast i8 addrspace(1)* %16 to %struct.HIP_vector_type addrspace(1)*
  %18 = zext i32 %10 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %17, i64 %18
  %20 = sext i32 %3 to i64
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 %20
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %21, i64 0, i32 0, i32 0, i32 0, i64 0
  %23 = load float, float addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %21, i64 0, i32 0, i32 0, i32 0, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = sub nsw i32 %10, %7
  %27 = sub nsw i32 %11, %7
  %28 = mul i32 %26, %26
  %29 = mul i32 %28, %28
  %30 = sitofp i32 %29 to float
  %31 = fadd contract float %30, 1.000000e+00
  %32 = mul i32 %27, %27
  %33 = mul i32 %32, %32
  %34 = sitofp i32 %33 to float
  %35 = fadd contract float %31, %34
  %36 = fdiv contract float 1.000000e+00, %35
  %37 = fmul contract float %36, %5
  %38 = fadd contract float %37, %23
  %39 = fmul contract float %36, %6
  %40 = fadd contract float %39, %25
  store float %38, float addrspace(1)* %22, align 8
  store float %40, float addrspace(1)* %24, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{}
