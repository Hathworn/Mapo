; ModuleID = '../data/hip_kernels/1025/5/main.cu'
source_filename = "../data/hip_kernels/1025/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15sphereTransformPfj(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = icmp ult i32 %11, %1
  br i1 %12, label %13, label %45

13:                                               ; preds = %2
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = fmul contract float %16, 3.600000e+02
  %18 = fadd contract float %17, -1.800000e+02
  store float %18, float addrspace(1)* %15, align 4, !tbaa !7
  %19 = add i32 %11, %1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = fmul contract float %22, 2.000000e+00
  %24 = fadd contract float %23, -1.000000e+00
  %25 = tail call float @llvm.fabs.f32(float %24)
  %26 = tail call float @llvm.fmuladd.f32(float %25, float -5.000000e-01, float 5.000000e-01)
  %27 = fmul float %24, %24
  %28 = fcmp ogt float %25, 5.000000e-01
  %29 = select i1 %28, float %26, float %27
  %30 = tail call float @llvm.fmuladd.f32(float %29, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float 0x3FA0698780000000)
  %32 = tail call float @llvm.fmuladd.f32(float %29, float %31, float 0x3FA6C83620000000)
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %32, float 0x3FB3337900000000)
  %34 = tail call float @llvm.fmuladd.f32(float %29, float %33, float 0x3FC5555580000000)
  %35 = fmul float %29, %34
  %36 = tail call float @llvm.sqrt.f32(float %29)
  %37 = tail call float @llvm.fmuladd.f32(float %36, float %35, float %36)
  %38 = fmul float %37, 2.000000e+00
  %39 = fsub float 0x400921FB60000000, %38
  %40 = fcmp olt float %24, 0.000000e+00
  %41 = select i1 %40, float %39, float %38
  %42 = tail call float @llvm.fmuladd.f32(float %24, float %35, float %24)
  %43 = fsub float 0x3FF921FB60000000, %42
  %44 = select i1 %28, float %41, float %43
  store float %44, float addrspace(1)* %21, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %13, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
