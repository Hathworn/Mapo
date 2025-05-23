; ModuleID = '../data/hip_kernels/4522/9/main.cu'
source_filename = "../data/hip_kernels/4522/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10RGBToBGRA8P15HIP_vector_typeIfLj3EEPS_IhLj4EEiif(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %49

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 0
  %31 = load float, float addrspace(1)* %30, align 4, !amdgpu.noclobber !5
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !amdgpu.noclobber !5
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %29, i32 0, i32 0, i32 0, i32 0, i64 2
  %35 = load float, float addrspace(1)* %34, align 4, !amdgpu.noclobber !5
  %36 = fmul contract float %35, %4
  %37 = fptoui float %36 to i8
  %38 = fmul contract float %33, %4
  %39 = fptoui float %38 to i8
  %40 = fmul contract float %31, %4
  %41 = fptoui float %40 to i8
  %42 = fmul contract float %4, 2.550000e+02
  %43 = fptoui float %42 to i8
  %44 = insertelement <4 x i8> undef, i8 %37, i64 0
  %45 = insertelement <4 x i8> %44, i8 %39, i64 1
  %46 = insertelement <4 x i8> %45, i8 %41, i64 2
  %47 = insertelement <4 x i8> %46, i8 %43, i64 3
  %48 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %29, i32 0, i32 0, i32 0
  store <4 x i8> %47, <4 x i8> addrspace(1)* %48, align 4
  br label %49

49:                                               ; preds = %5, %26
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
