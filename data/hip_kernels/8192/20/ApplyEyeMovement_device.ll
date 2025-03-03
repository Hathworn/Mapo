; ModuleID = '../data/hip_kernels/8192/20/main.cu'
source_filename = "../data/hip_kernels/8192/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16ApplyEyeMovementPfS_fff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %7 = load float, float addrspace(1)* %6, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = fcmp contract ogt float %7, 0.000000e+00
  br i1 %8, label %9, label %52

9:                                                ; preds = %5
  %10 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %11 = fmul contract float %10, %2
  %12 = tail call float @llvm.minnum.f32(float %11, float 1.000000e+00)
  %13 = tail call float @llvm.maxnum.f32(float %12, float -1.000000e+00)
  store float %13, float addrspace(1)* %0, align 4, !tbaa !4
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !4
  %16 = fmul contract float %15, %2
  %17 = tail call float @llvm.minnum.f32(float %16, float 1.000000e+00)
  %18 = tail call float @llvm.maxnum.f32(float %17, float -1.000000e+00)
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  store float %18, float addrspace(1)* %19, align 4, !tbaa !4
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %21 = bitcast float addrspace(1)* %20 to <2 x float> addrspace(1)*
  %22 = load <2 x float>, <2 x float> addrspace(1)* %21, align 4, !tbaa !4
  %23 = extractelement <2 x float> %22, i64 0
  %24 = extractelement <2 x float> %22, i64 1
  %25 = fadd contract float %23, %24
  %26 = fmul contract float %25, 5.000000e-01
  %27 = fcmp olt float %26, 0x39F0000000000000
  %28 = select i1 %27, float 0x41F0000000000000, float 1.000000e+00
  %29 = fmul float %26, %28
  %30 = tail call float @llvm.sqrt.f32(float %29)
  %31 = bitcast float %30 to i32
  %32 = add nsw i32 %31, -1
  %33 = bitcast i32 %32 to float
  %34 = add nsw i32 %31, 1
  %35 = bitcast i32 %34 to float
  %36 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 608)
  %37 = select i1 %27, float 0x3EF0000000000000, float 1.000000e+00
  %38 = fneg float %35
  %39 = tail call float @llvm.fma.f32(float %38, float %30, float %29)
  %40 = fcmp ogt float %39, 0.000000e+00
  %41 = fneg float %33
  %42 = tail call float @llvm.fma.f32(float %41, float %30, float %29)
  %43 = fcmp ole float %42, 0.000000e+00
  %44 = select i1 %43, float %33, float %30
  %45 = select i1 %40, float %35, float %44
  %46 = fmul float %37, %45
  %47 = select i1 %36, float %29, float %46
  %48 = fmul contract float %47, %3
  %49 = fadd contract float %48, %4
  %50 = tail call float @llvm.minnum.f32(float %49, float 1.000000e+00)
  %51 = tail call float @llvm.maxnum.f32(float %50, float 0.000000e+00)
  br label %54

52:                                               ; preds = %5
  store float 0.000000e+00, float addrspace(1)* %0, align 4, !tbaa !4
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  store float 0.000000e+00, float addrspace(1)* %53, align 4, !tbaa !4
  br label %54

54:                                               ; preds = %52, %9
  %55 = phi float [ %51, %9 ], [ 1.000000e+00, %52 ]
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  store float %55, float addrspace(1)* %56, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
