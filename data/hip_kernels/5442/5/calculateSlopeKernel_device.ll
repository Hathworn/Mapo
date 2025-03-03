; ModuleID = '../data/hip_kernels/5442/5/main.cu'
source_filename = "../data/hip_kernels/5442/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20calculateSlopeKernelPfP15HIP_vector_typeIfLj2EEjj(float addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = add i32 %2, -1
  %12 = add i32 %3, -1
  %13 = bitcast i8 addrspace(4)* %7 to <2 x i16> addrspace(4)*
  %14 = load <2 x i16>, <2 x i16> addrspace(4)* %13, align 4, !invariant.load !5
  %15 = zext <2 x i16> %14 to <2 x i32>
  %16 = insertelement <2 x i32> poison, i32 %5, i64 0
  %17 = insertelement <2 x i32> %16, i32 %9, i64 1
  %18 = mul <2 x i32> %17, %15
  %19 = insertelement <2 x i32> poison, i32 %8, i64 0
  %20 = insertelement <2 x i32> %19, i32 %10, i64 1
  %21 = add <2 x i32> %18, %20
  %22 = shufflevector <2 x i32> %21, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %23 = extractelement <2 x i32> %21, i64 1
  %24 = mul i32 %23, %2
  %25 = extractelement <2 x i32> %21, i64 0
  %26 = add i32 %24, %25
  %27 = insertelement <4 x i32> <i32 poison, i32 poison, i32 0, i32 0>, i32 %11, i64 0
  %28 = insertelement <4 x i32> %27, i32 %12, i64 1
  %29 = icmp ult <4 x i32> %22, %28
  %30 = icmp ne <4 x i32> %22, %28
  %31 = shufflevector <4 x i1> %29, <4 x i1> %30, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %32 = freeze <4 x i1> %31
  %33 = bitcast <4 x i1> %32 to i4
  %34 = icmp eq i4 %33, -1
  br i1 %34, label %35, label %54

35:                                               ; preds = %4
  %36 = add i32 %26, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !6, !amdgpu.noclobber !5
  %40 = add i32 %26, -1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !6, !amdgpu.noclobber !5
  %44 = fsub contract float %39, %43
  %45 = add i32 %26, %2
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !6, !amdgpu.noclobber !5
  %49 = sub i32 %26, %2
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !6, !amdgpu.noclobber !5
  %53 = fsub contract float %48, %52
  br label %54

54:                                               ; preds = %35, %4
  %55 = phi float [ %53, %35 ], [ 0.000000e+00, %4 ]
  %56 = phi float [ %44, %35 ], [ 0.000000e+00, %4 ]
  %57 = zext i32 %26 to i64
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 0
  store float %56, float addrspace(1)* %58, align 8
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 1
  store float %55, float addrspace(1)* %59, align 4
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
!4 = !{i32 0, i32 1024}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
