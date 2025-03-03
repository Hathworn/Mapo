; ModuleID = '../data/hip_kernels/3007/81/main.cu'
source_filename = "../data/hip_kernels/3007/81/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14vector_sigmoidiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %61

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fmul contract float %23, 5.000000e-01
  %25 = tail call float @llvm.fabs.f32(float %24)
  %26 = fcmp olt float %25, 6.250000e-01
  br i1 %26, label %27, label %35

27:                                               ; preds = %18
  %28 = fmul float %24, %24
  %29 = tail call float @llvm.fmuladd.f32(float %28, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float 0xBFAB8389C0000000)
  %31 = tail call float @llvm.fmuladd.f32(float %28, float %30, float 0x3FC1107040000000)
  %32 = tail call float @llvm.fmuladd.f32(float %28, float %31, float 0xBFD5555320000000)
  %33 = fmul float %25, %32
  %34 = tail call float @llvm.fmuladd.f32(float %28, float %33, float %25)
  br label %52

35:                                               ; preds = %18
  %36 = fmul float %25, 2.000000e+00
  %37 = fmul float %36, 0x3FF7154760000000
  %38 = tail call float @llvm.rint.f32(float %37)
  %39 = fcmp ogt float %36, 0x40562E4300000000
  %40 = fneg float %37
  %41 = tail call float @llvm.fma.f32(float %36, float 0x3FF7154760000000, float %40)
  %42 = tail call float @llvm.fma.f32(float %36, float 0x3E54AE0BE0000000, float %41)
  %43 = fsub float %37, %38
  %44 = fadd float %42, %43
  %45 = tail call float @llvm.exp2.f32(float %44)
  %46 = fptosi float %38 to i32
  %47 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 %46)
  %48 = fadd float %47, 1.000000e+00
  %49 = select i1 %39, float 0x7FF0000000000000, float %48
  %50 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %51 = tail call float @llvm.fmuladd.f32(float %50, float -2.000000e+00, float 1.000000e+00)
  br label %52

52:                                               ; preds = %27, %35
  %53 = phi float [ %34, %27 ], [ %51, %35 ]
  %54 = tail call float @llvm.copysign.f32(float %53, float %24)
  %55 = fmul contract float %54, 5.000000e-01
  %56 = fadd contract float %55, 5.000000e-01
  %57 = mul nsw i32 %16, %6
  %58 = add nsw i32 %57, %5
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  store float %56, float addrspace(1)* %60, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %52, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
