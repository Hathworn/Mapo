; ModuleID = '../data/hip_kernels/4844/21/main.cu'
source_filename = "../data/hip_kernels/4844/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16KerComputeSpsTaujjffPK15HIP_vector_typeIfLj4EEPKS_IfLj2EEPS3_(i32 %0, i32 %1, float %2, float %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %0
  br i1 %17, label %18, label %104

18:                                               ; preds = %7
  %19 = add i32 %16, %1
  %20 = mul i32 %19, 3
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %21, i32 0, i32 0, i32 0, i64 0
  %23 = load float, float addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %21, i32 0, i32 0, i32 0, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = add i32 %20, 1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %27, i32 0, i32 0, i32 0, i64 0
  %29 = load float, float addrspace(1)* %28, align 8, !amdgpu.noclobber !5
  %30 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %27, i32 0, i32 0, i32 0, i64 1
  %31 = load float, float addrspace(1)* %30, align 4, !amdgpu.noclobber !5
  %32 = add i32 %20, 2
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %33, i32 0, i32 0, i32 0, i64 0
  %35 = load float, float addrspace(1)* %34, align 8, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %33, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !amdgpu.noclobber !5
  %38 = fmul contract float %23, %23
  %39 = fmul contract float %31, %31
  %40 = fadd contract float %38, %39
  %41 = fmul contract float %37, %37
  %42 = fadd contract float %40, %41
  %43 = fmul contract float %25, %25
  %44 = fmul contract float %29, %29
  %45 = fadd contract float %43, %44
  %46 = fmul contract float %35, %35
  %47 = fadd contract float %45, %46
  %48 = fadd contract float %47, %42
  %49 = fadd contract float %42, %48
  %50 = fcmp olt float %49, 0x39F0000000000000
  %51 = select i1 %50, float 0x41F0000000000000, float 1.000000e+00
  %52 = fmul float %49, %51
  %53 = tail call float @llvm.sqrt.f32(float %52)
  %54 = bitcast float %53 to i32
  %55 = add nsw i32 %54, -1
  %56 = bitcast i32 %55 to float
  %57 = add nsw i32 %54, 1
  %58 = bitcast i32 %57 to float
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 608)
  %60 = select i1 %50, float 0x3EF0000000000000, float 1.000000e+00
  %61 = fneg float %58
  %62 = tail call float @llvm.fma.f32(float %61, float %53, float %52)
  %63 = fcmp ogt float %62, 0.000000e+00
  %64 = fneg float %56
  %65 = tail call float @llvm.fma.f32(float %64, float %53, float %52)
  %66 = fcmp ole float %65, 0.000000e+00
  %67 = select i1 %66, float %56, float %53
  %68 = select i1 %63, float %58, float %67
  %69 = fmul float %60, %68
  %70 = select i1 %59, float %52, float %69
  %71 = fmul contract float %70, %2
  %72 = fadd contract float %23, %31
  %73 = fadd contract float %72, %37
  %74 = fmul contract float %71, 0x3FE5555560000000
  %75 = fmul contract float %73, %74
  %76 = fmul contract float %49, %3
  %77 = fadd contract float %76, %75
  %78 = fadd contract float %71, %71
  %79 = zext i32 %19 to i64
  %80 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %79, i32 0, i32 0, i32 0, i64 3
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fdiv contract float 1.000000e+00, %81
  %83 = fmul contract float %23, %78
  %84 = fsub contract float %83, %77
  %85 = fmul contract float %82, %84
  %86 = fmul contract float %25, %71
  %87 = fmul contract float %82, %86
  %88 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %21, i32 0, i32 0, i32 0, i64 0
  store float %85, float addrspace(1)* %88, align 8
  %89 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %21, i32 0, i32 0, i32 0, i64 1
  store float %87, float addrspace(1)* %89, align 4
  %90 = fmul contract float %29, %71
  %91 = fmul contract float %82, %90
  %92 = fmul contract float %31, %78
  %93 = fsub contract float %92, %77
  %94 = fmul contract float %82, %93
  %95 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %27, i32 0, i32 0, i32 0, i64 0
  store float %91, float addrspace(1)* %95, align 8
  %96 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %27, i32 0, i32 0, i32 0, i64 1
  store float %94, float addrspace(1)* %96, align 4
  %97 = fmul contract float %35, %71
  %98 = fmul contract float %82, %97
  %99 = fmul contract float %37, %78
  %100 = fsub contract float %99, %77
  %101 = fmul contract float %82, %100
  %102 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %33, i32 0, i32 0, i32 0, i64 0
  store float %98, float addrspace(1)* %102, align 8
  %103 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %33, i32 0, i32 0, i32 0, i64 1
  store float %101, float addrspace(1)* %103, align 4
  br label %104

104:                                              ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
