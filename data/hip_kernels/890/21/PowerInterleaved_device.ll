; ModuleID = '../data/hip_kernels/890/21/main.cu'
source_filename = "../data/hip_kernels/890/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16PowerInterleavedP15HIP_vector_typeIfLj4EES1_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 0
  %14 = load float, float addrspace(1)* %13, align 16, !tbaa !7, !amdgpu.noclobber !5
  %15 = fmul contract float %14, %14
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 1
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = fmul contract float %17, %17
  %19 = fadd contract float %15, %18
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %12, i32 0, i32 0, i32 0, i64 0
  %21 = load float, float addrspace(1)* %20, align 16, !tbaa !7, !amdgpu.noclobber !5
  %22 = fadd contract float %21, %19
  store float %22, float addrspace(1)* %20, align 16, !tbaa !7
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 2
  %24 = load float, float addrspace(1)* %23, align 8, !tbaa !7
  %25 = fmul contract float %24, %24
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 3
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = fmul contract float %27, %27
  %29 = fadd contract float %25, %28
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %12, i32 0, i32 0, i32 0, i64 1
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fadd contract float %31, %29
  store float %32, float addrspace(1)* %30, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %13, align 16, !tbaa !7
  %34 = load float, float addrspace(1)* %23, align 8, !tbaa !7
  %35 = fmul contract float %33, %34
  %36 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %38 = fmul contract float %36, %37
  %39 = fadd contract float %35, %38
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %12, i32 0, i32 0, i32 0, i64 2
  %41 = load float, float addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fadd contract float %41, %39
  store float %42, float addrspace(1)* %40, align 8, !tbaa !7
  %43 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %23, align 8, !tbaa !7
  %45 = fmul contract float %43, %44
  %46 = load float, float addrspace(1)* %13, align 16, !tbaa !7
  %47 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %48 = fmul contract float %46, %47
  %49 = fsub contract float %45, %48
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %12, i32 0, i32 0, i32 0, i64 3
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract float %51, %49
  store float %52, float addrspace(1)* %50, align 4, !tbaa !7
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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
