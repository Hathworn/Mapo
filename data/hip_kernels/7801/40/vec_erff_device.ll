; ModuleID = '../data/hip_kernels/7801/40/main.cu'
source_filename = "../data/hip_kernels/7801/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erff(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %56

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 1.000000e+00
  br i1 %19, label %20, label %28

20:                                               ; preds = %15
  %21 = fmul float %17, %17
  %22 = tail call float @llvm.fmuladd.f32(float %21, float 0xBF4268BC20000000, float 0x3F74208280000000)
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float 0xBF9B593700000000)
  %24 = tail call float @llvm.fmuladd.f32(float %21, float %23, float 0x3FBCE077C0000000)
  %25 = tail call float @llvm.fmuladd.f32(float %21, float %24, float 0xBFD8126600000000)
  %26 = tail call float @llvm.fmuladd.f32(float %21, float %25, float 0x3FC06EBA00000000)
  %27 = tail call float @llvm.fma.f32(float %18, float %26, float %18)
  br label %52

28:                                               ; preds = %15
  %29 = tail call float @llvm.fmuladd.f32(float %18, float 0x3EF1D31560000000, float 0xBF38D12900000000)
  %30 = tail call float @llvm.fmuladd.f32(float %18, float %29, float 0x3F6F9A6D20000000)
  %31 = tail call float @llvm.fmuladd.f32(float %18, float %30, float 0xBF98C31640000000)
  %32 = tail call float @llvm.fmuladd.f32(float %18, float %31, float 0x3FBB4E9C80000000)
  %33 = tail call float @llvm.fmuladd.f32(float %18, float %32, float 0x3FE4515FA0000000)
  %34 = tail call float @llvm.fmuladd.f32(float %18, float %33, float 0x3FC078E500000000)
  %35 = tail call float @llvm.fma.f32(float %18, float %34, float %18)
  %36 = fneg float %35
  %37 = fmul float %35, 0xBFF7154760000000
  %38 = tail call float @llvm.rint.f32(float %37)
  %39 = fcmp olt float %35, 0xC0562E4300000000
  %40 = fcmp ogt float %35, 0x4059D1DA00000000
  %41 = fneg float %37
  %42 = tail call float @llvm.fma.f32(float %36, float 0x3FF7154760000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %36, float 0x3E54AE0BE0000000, float %42)
  %44 = fsub float %37, %38
  %45 = fadd float %43, %44
  %46 = tail call float @llvm.exp2.f32(float %45)
  %47 = fptosi float %38 to i32
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %46, i32 %47)
  %49 = fsub float 1.000000e+00, %48
  %50 = select i1 %40, float 1.000000e+00, float %49
  %51 = select i1 %39, float 0xFFF0000000000000, float %50
  br label %52

52:                                               ; preds = %20, %28
  %53 = phi float [ %27, %20 ], [ %51, %28 ]
  %54 = tail call float @llvm.copysign.f32(float %53, float %17)
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %54, float addrspace(1)* %55, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %52, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
