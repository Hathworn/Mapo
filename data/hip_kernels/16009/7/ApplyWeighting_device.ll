; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/7/ApplyWeighting.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/7/ApplyWeighting.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @ApplyWeighting(%struct.HIP_vector_type addrspace(1)* noalias nocapture %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %85

28:                                               ; preds = %7
  %29 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %30 = mul nsw i32 %24, %5
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %29, i64 %31
  %33 = bitcast i8 addrspace(1)* %32 to %struct.HIP_vector_type addrspace(1)*
  %34 = sext i32 %16 to i64
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %33, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 0
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %33, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !amdgpu.noclobber !5
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %33, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 2
  %39 = load float, float addrspace(1)* %38, align 4, !amdgpu.noclobber !5
  %40 = bitcast %struct.HIP_vector_type addrspace(1)* %1 to i8 addrspace(1)*
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %40, i64 %31
  %42 = bitcast i8 addrspace(1)* %41 to %struct.HIP_vector_type addrspace(1)*
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %42, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 0
  %44 = load float, float addrspace(1)* %43, align 4, !amdgpu.noclobber !5
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %42, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 1
  %46 = load float, float addrspace(1)* %45, align 4, !amdgpu.noclobber !5
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %42, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 2
  %48 = load float, float addrspace(1)* %47, align 4, !amdgpu.noclobber !5
  %49 = bitcast %struct.HIP_vector_type addrspace(1)* %2 to i8 addrspace(1)*
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %49, i64 %31
  %51 = bitcast i8 addrspace(1)* %50 to %struct.HIP_vector_type addrspace(1)*
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %51, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 0
  %53 = load float, float addrspace(1)* %52, align 4, !amdgpu.noclobber !5
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %51, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 1
  %55 = load float, float addrspace(1)* %54, align 4, !amdgpu.noclobber !5
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %51, i64 %34, i32 0, i32 0, i32 0, i32 0, i64 2
  %57 = load float, float addrspace(1)* %56, align 4, !amdgpu.noclobber !5
  %58 = fcmp contract olt float %53, %6
  br i1 %58, label %59, label %63

59:                                               ; preds = %28
  %60 = load float, float addrspace(1)* %35, align 4, !amdgpu.noclobber !5
  %61 = fadd contract float %44, %60
  %62 = fadd contract float %53, 1.000000e+00
  br label %63

63:                                               ; preds = %59, %28
  %64 = phi float [ %61, %59 ], [ %44, %28 ]
  %65 = phi float [ %62, %59 ], [ %53, %28 ]
  %66 = fcmp contract une float %65, 0.000000e+00
  %67 = fdiv contract float %64, %65
  %68 = select i1 %66, float %67, float 0.000000e+00
  %69 = fcmp contract olt float %55, %6
  %70 = fadd contract float %55, 1.000000e+00
  %71 = select i1 %69, float %37, float -0.000000e+00
  %72 = fadd contract float %46, %71
  %73 = select i1 %69, float %70, float %55
  %74 = fcmp contract une float %73, 0.000000e+00
  %75 = fdiv contract float %72, %73
  %76 = select i1 %74, float %75, float 0.000000e+00
  %77 = fcmp contract olt float %57, %6
  %78 = fadd contract float %57, 1.000000e+00
  %79 = select i1 %77, float %39, float -0.000000e+00
  %80 = fadd contract float %48, %79
  %81 = select i1 %77, float %78, float %57
  %82 = fcmp contract une float %81, 0.000000e+00
  %83 = fdiv contract float %80, %81
  %84 = select i1 %82, float %83, float 0.000000e+00
  store float %68, float addrspace(1)* %35, align 4
  store float %76, float addrspace(1)* %36, align 4
  store float %84, float addrspace(1)* %38, align 4
  br label %85

85:                                               ; preds = %7, %63
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
