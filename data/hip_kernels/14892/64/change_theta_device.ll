; ModuleID = '../data/hip_kernels/14892/64/main.cu'
source_filename = "../data/hip_kernels/14892/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12change_thetaiPK15HIP_vector_typeIfLj3EEPS_IfLj4EES4_S4_(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %2, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %3, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %0
  br i1 %15, label %16, label %62

16:                                               ; preds = %5
  %17 = shl i32 %14, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 0
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = zext i32 %14 to i64
  %22 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %21, i32 0, i32 0, i32 0, i64 0
  store float %20, float addrspace(1)* %22, align 16, !tbaa !7
  %23 = add nuw nsw i32 %17, 1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 0
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %21, i32 0, i32 0, i32 0, i64 1
  store float %26, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add nuw nsw i32 %17, 2
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 0
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %21, i32 0, i32 0, i32 0, i64 2
  store float %31, float addrspace(1)* %32, align 8, !tbaa !7
  %33 = add nuw nsw i32 %17, 3
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 0
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %21, i32 0, i32 0, i32 0, i64 3
  store float %36, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7
  %40 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i64 0
  store float %39, float addrspace(1)* %40, align 16, !tbaa !7
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 1
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i64 1
  store float %42, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 1
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i64 2
  store float %45, float addrspace(1)* %46, align 8, !tbaa !7
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 1
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i64 3
  store float %48, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i32 0, i64 2
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i64 0
  store float %51, float addrspace(1)* %52, align 16, !tbaa !7
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 2
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i64 1
  store float %54, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 2
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i64 2
  store float %57, float addrspace(1)* %58, align 8, !tbaa !7
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 2
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i64 3
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %16, %5
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
