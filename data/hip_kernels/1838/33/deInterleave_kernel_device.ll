; ModuleID = '../data/hip_kernels/1838/33/main.cu'
source_filename = "../data/hip_kernels/1838/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19deInterleave_kernelPfS_P15HIP_vector_typeIfLj2EEiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp ult i32 %16, %5
  %26 = icmp ult i32 %24, %6
  %27 = and i1 %25, %26
  br i1 %27, label %28, label %49

28:                                               ; preds = %7
  %29 = bitcast %struct.HIP_vector_type addrspace(1)* %2 to i8 addrspace(1)*
  %30 = mul i32 %24, %4
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %29, i64 %31
  %33 = bitcast i8 addrspace(1)* %32 to %struct.HIP_vector_type addrspace(1)*
  %34 = zext i32 %16 to i64
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %33, i64 %34, i32 0, i32 0, i32 0, i64 0
  %36 = load float, float addrspace(1)* %35, align 8, !amdgpu.noclobber !5
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %33, i64 %34, i32 0, i32 0, i32 0, i64 1
  %38 = load float, float addrspace(1)* %37, align 4, !amdgpu.noclobber !5
  %39 = bitcast float addrspace(1)* %0 to i8 addrspace(1)*
  %40 = mul i32 %24, %3
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %39, i64 %41
  %43 = bitcast i8 addrspace(1)* %42 to float addrspace(1)*
  %44 = getelementptr inbounds float, float addrspace(1)* %43, i64 %34
  store float %36, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = bitcast float addrspace(1)* %1 to i8 addrspace(1)*
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %45, i64 %41
  %47 = bitcast i8 addrspace(1)* %46 to float addrspace(1)*
  %48 = getelementptr inbounds float, float addrspace(1)* %47, i64 %34
  store float %38, float addrspace(1)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %28, %7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
