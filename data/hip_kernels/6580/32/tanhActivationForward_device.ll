; ModuleID = '../data/hip_kernels/6580/32/main.cu'
source_filename = "../data/hip_kernels/6580/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21tanhActivationForwardPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %3, %2
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %51

16:                                               ; preds = %4
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = tail call float @llvm.fabs.f32(float %19)
  %21 = fcmp olt float %20, 6.250000e-01
  br i1 %21, label %22, label %30

22:                                               ; preds = %16
  %23 = fmul float %19, %19
  %24 = tail call float @llvm.fmuladd.f32(float %23, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float 0xBFAB8389C0000000)
  %26 = tail call float @llvm.fmuladd.f32(float %23, float %25, float 0x3FC1107040000000)
  %27 = tail call float @llvm.fmuladd.f32(float %23, float %26, float 0xBFD5555320000000)
  %28 = fmul float %20, %27
  %29 = tail call float @llvm.fmuladd.f32(float %23, float %28, float %20)
  br label %47

30:                                               ; preds = %16
  %31 = fmul float %20, 2.000000e+00
  %32 = fmul float %31, 0x3FF7154760000000
  %33 = tail call float @llvm.rint.f32(float %32)
  %34 = fcmp ogt float %31, 0x40562E4300000000
  %35 = fneg float %32
  %36 = tail call float @llvm.fma.f32(float %31, float 0x3FF7154760000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %31, float 0x3E54AE0BE0000000, float %36)
  %38 = fsub float %32, %33
  %39 = fadd float %37, %38
  %40 = tail call float @llvm.exp2.f32(float %39)
  %41 = fptosi float %33 to i32
  %42 = tail call float @llvm.amdgcn.ldexp.f32(float %40, i32 %41)
  %43 = fadd float %42, 1.000000e+00
  %44 = select i1 %34, float 0x7FF0000000000000, float %43
  %45 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %46 = tail call float @llvm.fmuladd.f32(float %45, float -2.000000e+00, float 1.000000e+00)
  br label %47

47:                                               ; preds = %22, %30
  %48 = phi float [ %29, %22 ], [ %46, %30 ]
  %49 = tail call float @llvm.copysign.f32(float %48, float %19)
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %49, float addrspace(1)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %47, %4
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
