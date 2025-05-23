; ModuleID = '../data/hip_kernels/248/1/main.cu'
source_filename = "../data/hip_kernels/248/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kRgb2XYZP15HIP_vector_typeIhLj4EEPS_IfLj4EEii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %17, %19
  %21 = mul i32 %20, %2
  %22 = add i32 %11, %18
  %23 = add i32 %22, %21
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 0
  %26 = load i8, i8 addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 1
  %28 = load i8, i8 addrspace(1)* %27, align 1, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 2
  %30 = load i8, i8 addrspace(1)* %29, align 2, !amdgpu.noclobber !5
  %31 = uitofp i8 %26 to double
  %32 = fdiv contract double %31, 2.550000e+02
  %33 = fptrunc double %32 to float
  %34 = uitofp i8 %28 to double
  %35 = fdiv contract double %34, 2.550000e+02
  %36 = fptrunc double %35 to float
  %37 = uitofp i8 %30 to double
  %38 = fdiv contract double %37, 2.550000e+02
  %39 = fptrunc double %38 to float
  %40 = fpext float %39 to double
  %41 = fmul contract double %40, 4.124530e-01
  %42 = fpext float %36 to double
  %43 = fmul contract double %42, 3.575800e-01
  %44 = fadd contract double %43, %41
  %45 = fpext float %33 to double
  %46 = fmul contract double %45, 1.804230e-01
  %47 = fadd contract double %46, %44
  %48 = fptrunc double %47 to float
  %49 = fmul contract double %40, 2.126710e-01
  %50 = fmul contract double %42, 7.151600e-01
  %51 = fadd contract double %50, %49
  %52 = fmul contract double %45, 0x3FB279AAE6C8F755
  %53 = fadd contract double %52, %51
  %54 = fptrunc double %53 to float
  %55 = fmul contract double %40, 1.933400e-02
  %56 = fmul contract double %42, 1.191930e-01
  %57 = fadd contract double %56, %55
  %58 = fmul contract double %45, 9.502270e-01
  %59 = fadd contract double %58, %57
  %60 = fptrunc double %59 to float
  %61 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 0
  store float %48, float addrspace(1)* %61, align 16
  %62 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 1
  store float %54, float addrspace(1)* %62, align 4
  %63 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %1, i64 %24, i32 0, i32 0, i32 0, i64 2
  store float %60, float addrspace(1)* %63, align 8
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
