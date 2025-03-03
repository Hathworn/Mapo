; ModuleID = '../data/hip_kernels/14887/13/main.cu'
source_filename = "../data/hip_kernels/14887/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16initGuessBuffersPK15HIP_vector_typeIhLj4EEPS_IfLj3EES4_jj(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = mul i32 %4, %3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %6
  br i1 %16, label %17, label %40

17:                                               ; preds = %5
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = load i8, i8 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = uitofp i8 %20 to float
  %22 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %21, float addrspace(1)* %22, align 4, !tbaa !7
  %23 = load i8, i8 addrspace(1)* %19, align 4, !tbaa !7
  %24 = uitofp i8 %23 to float
  %25 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %24, float addrspace(1)* %25, align 4, !tbaa !7
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !7
  %28 = uitofp i8 %27 to float
  %29 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %28, float addrspace(1)* %29, align 4, !tbaa !7
  %30 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !7
  %31 = uitofp i8 %30 to float
  %32 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %31, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  %34 = load i8, i8 addrspace(1)* %33, align 2, !tbaa !7
  %35 = uitofp i8 %34 to float
  %36 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = load i8, i8 addrspace(1)* %33, align 2, !tbaa !7
  %38 = uitofp i8 %37 to float
  %39 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %38, float addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %17, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
