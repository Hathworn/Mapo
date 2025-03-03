; ModuleID = '../data/hip_kernels/16323/10/main.cu'
source_filename = "../data/hip_kernels/16323/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13kernel_updateP15HIP_vector_typeIfLj4EES1_S1_Pfm(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readnone %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, %4
  br i1 %16, label %17, label %58

17:                                               ; preds = %5
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %15, i32 0, i32 0, i32 0, i64 0
  %19 = load float, float addrspace(1)* %18, align 16, !amdgpu.noclobber !6
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %15, i32 0, i32 0, i32 0, i64 1
  %21 = load float, float addrspace(1)* %20, align 4, !amdgpu.noclobber !6
  %22 = fmul contract float %19, %19
  %23 = fmul contract float %21, %21
  %24 = fadd contract float %22, %23
  %25 = fcmp olt float %24, 0x39F0000000000000
  %26 = select i1 %25, float 0x41F0000000000000, float 1.000000e+00
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.sqrt.f32(float %27)
  %29 = bitcast float %28 to i32
  %30 = add nsw i32 %29, -1
  %31 = bitcast i32 %30 to float
  %32 = add nsw i32 %29, 1
  %33 = bitcast i32 %32 to float
  %34 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 608)
  %35 = select i1 %25, float 0x3EF0000000000000, float 1.000000e+00
  %36 = fneg float %33
  %37 = tail call float @llvm.fma.f32(float %36, float %28, float %27)
  %38 = fcmp ogt float %37, 0.000000e+00
  %39 = fneg float %31
  %40 = tail call float @llvm.fma.f32(float %39, float %28, float %27)
  %41 = fcmp ole float %40, 0.000000e+00
  %42 = select i1 %41, float %31, float %28
  %43 = select i1 %38, float %33, float %42
  %44 = fmul float %35, %43
  %45 = select i1 %34, float %27, float %44
  %46 = fpext float %45 to double
  %47 = fmul contract double %46, 3.000000e-02
  %48 = fptrunc double %47 to float
  %49 = tail call float @llvm.minnum.f32(float %48, float 5.000000e-01)
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 0
  %51 = load float, float addrspace(1)* %50, align 16, !tbaa !7, !amdgpu.noclobber !6
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 1
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = insertelement <4 x float> <float poison, float poison, float poison, float 0.000000e+00>, float %51, i64 0
  %55 = insertelement <4 x float> %54, float %53, i64 1
  %56 = insertelement <4 x float> %55, float %49, i64 2
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0
  store <4 x float> %56, <4 x float> addrspace(1)* %57, align 16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %58

58:                                               ; preds = %5, %17
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
