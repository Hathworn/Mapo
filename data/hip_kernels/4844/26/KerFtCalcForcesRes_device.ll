; ModuleID = '../data/hip_kernels/4844/26/main.cu'
source_filename = "../data/hip_kernels/4844/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<double, 3>::Native_vec_" }
%"struct.HIP_vector_base<double, 3>::Native_vec_" = type { [3 x double] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18KerFtCalcForcesResjbdPK15HIP_vector_typeIfLj3EES2_PKS_IdLj3EES2_PS0_PS3_(i32 %0, i1 %1, double %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type addrspace(1)* nocapture readonly %6, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %7, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp ult i32 %18, %0
  br i1 %19, label %20, label %105

20:                                               ; preds = %9
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 0
  %23 = load float, float addrspace(1)* %22, align 4, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 2
  %27 = load float, float addrspace(1)* %26, align 4, !amdgpu.noclobber !5
  %28 = shl i32 %18, 1
  %29 = add nuw nsw i32 %28, 1
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(1)* %31, align 4, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  %36 = load float, float addrspace(1)* %35, align 4, !amdgpu.noclobber !5
  %37 = fpext float %32 to double
  %38 = fmul contract double %37, %2
  %39 = fpext float %23 to double
  %40 = fadd contract double %38, %39
  %41 = fptrunc double %40 to float
  %42 = fpext float %34 to double
  %43 = fmul contract double %42, %2
  %44 = fpext float %25 to double
  %45 = fadd contract double %43, %44
  %46 = fptrunc double %45 to float
  %47 = fpext float %36 to double
  %48 = fmul contract double %47, %2
  %49 = fpext float %27 to double
  %50 = fadd contract double %48, %49
  %51 = fptrunc double %50 to float
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 0
  %53 = load float, float addrspace(1)* %52, align 4, !amdgpu.noclobber !5
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 1
  %55 = load float, float addrspace(1)* %54, align 4, !amdgpu.noclobber !5
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 2
  %57 = load float, float addrspace(1)* %56, align 4, !amdgpu.noclobber !5
  %58 = zext i32 %28 to i64
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 0
  %60 = load float, float addrspace(1)* %59, align 4, !amdgpu.noclobber !5
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 1
  %62 = load float, float addrspace(1)* %61, align 4, !amdgpu.noclobber !5
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 2
  %64 = load float, float addrspace(1)* %63, align 4, !amdgpu.noclobber !5
  %65 = select i1 %1, float 0.000000e+00, float %41
  %66 = select i1 %1, float 0.000000e+00, float %51
  %67 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 0
  %68 = load double, double addrspace(1)* %67, align 8, !amdgpu.noclobber !5
  %69 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 1
  %70 = load double, double addrspace(1)* %69, align 8, !amdgpu.noclobber !5
  %71 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 2
  %72 = load double, double addrspace(1)* %71, align 8, !amdgpu.noclobber !5
  %73 = fpext float %53 to double
  %74 = fmul contract double %73, %2
  %75 = fadd contract double %74, %68
  %76 = fpext float %55 to double
  %77 = select i1 %1, double 0.000000e+00, double %76
  %78 = fmul contract double %77, %2
  %79 = fadd contract double %78, %70
  %80 = fpext float %57 to double
  %81 = fmul contract double %80, %2
  %82 = fadd contract double %81, %72
  %83 = fpext float %60 to double
  %84 = fmul contract double %83, %2
  %85 = fadd contract double %84, %73
  %86 = fptrunc double %85 to float
  %87 = fpext float %62 to double
  %88 = select i1 %1, double 0.000000e+00, double %87
  %89 = fmul contract double %88, %2
  %90 = fadd contract double %77, %89
  %91 = fptrunc double %90 to float
  %92 = fpext float %64 to double
  %93 = fmul contract double %92, %2
  %94 = fadd contract double %93, %80
  %95 = fptrunc double %94 to float
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %65, float addrspace(1)* %96, align 4
  %97 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %46, float addrspace(1)* %97, align 4
  %98 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %58, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %66, float addrspace(1)* %98, align 4
  %99 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %86, float addrspace(1)* %99, align 4
  %100 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %91, float addrspace(1)* %100, align 4
  %101 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %95, float addrspace(1)* %101, align 4
  %102 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 0
  store double %75, double addrspace(1)* %102, align 8
  %103 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 1
  store double %79, double addrspace(1)* %103, align 8
  %104 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %21, i32 0, i32 0, i32 0, i32 0, i64 2
  store double %82, double addrspace(1)* %104, align 8
  br label %105

105:                                              ; preds = %20, %9
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
