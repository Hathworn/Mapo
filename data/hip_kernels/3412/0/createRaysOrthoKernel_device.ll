; ModuleID = '../data/hip_kernels/3412/0/main.cu'
source_filename = "../data/hip_kernels/3412/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z21createRaysOrthoKernelP15HIP_vector_typeIfLj4EEiifffffj(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp slt i32 %18, %1
  %28 = icmp slt i32 %26, %2
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %50

30:                                               ; preds = %9
  %31 = bitcast i32 %8 to float
  %32 = mul nsw i32 %26, %1
  %33 = add nsw i32 %32, %18
  %34 = sitofp i32 %18 to float
  %35 = fmul contract float %34, %6
  %36 = fadd contract float %35, %3
  %37 = sitofp i32 %26 to float
  %38 = fmul contract float %37, %7
  %39 = fadd contract float %38, %4
  %40 = insertelement <4 x float> undef, float %36, i64 0
  %41 = insertelement <4 x float> %40, float %39, i64 1
  %42 = insertelement <4 x float> %41, float %5, i64 2
  %43 = insertelement <4 x float> %42, float %31, i64 3
  %44 = shl nsw i32 %33, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %45, i32 0, i32 0, i32 0
  store <4 x float> %43, <4 x float> addrspace(1)* %46, align 16
  %47 = add nuw nsw i32 %44, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %48, i32 0, i32 0, i32 0
  store <4 x float> <float 0.000000e+00, float 0.000000e+00, float 1.000000e+00, float 0x46FED09BE0000000>, <4 x float> addrspace(1)* %49, align 16
  br label %50

50:                                               ; preds = %9, %30
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
