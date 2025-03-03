; ModuleID = '../data/hip_kernels/7801/64/main.cu'
source_filename = "../data/hip_kernels/7801/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_sinpif(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %57

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fmul float %18, 5.000000e-01
  %20 = tail call float @llvm.amdgcn.fract.f32(float %19)
  %21 = tail call i1 @llvm.amdgcn.class.f32(float %19, i32 516)
  %22 = fmul float %20, 2.000000e+00
  %23 = select i1 %21, float 0.000000e+00, float %22
  %24 = fcmp ogt float %18, 1.000000e+00
  %25 = select i1 %24, float %23, float %18
  %26 = fmul float %25, 2.000000e+00
  %27 = tail call float @llvm.rint.f32(float %26)
  %28 = tail call float @llvm.fmuladd.f32(float %27, float -5.000000e-01, float %25)
  %29 = fptosi float %27 to i32
  %30 = fmul float %28, %28
  %31 = tail call float @llvm.fmuladd.f32(float %30, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float 0x400468E6C0000000)
  %33 = tail call float @llvm.fmuladd.f32(float %30, float %32, float 0xC014ABC1C0000000)
  %34 = fmul float %28, %30
  %35 = fmul float %34, %33
  %36 = tail call float @llvm.fmuladd.f32(float %28, float 0x400921FB60000000, float %35)
  %37 = tail call float @llvm.fmuladd.f32(float %30, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %38 = tail call float @llvm.fmuladd.f32(float %30, float %37, float 0xBFF55A3B40000000)
  %39 = tail call float @llvm.fmuladd.f32(float %30, float %38, float 0x40103C1A60000000)
  %40 = tail call float @llvm.fmuladd.f32(float %30, float %39, float 0xC013BD3CC0000000)
  %41 = tail call float @llvm.fmuladd.f32(float %30, float %40, float 1.000000e+00)
  %42 = and i32 %29, 1
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, float %36, float %41
  %45 = bitcast float %44 to i32
  %46 = shl i32 %29, 30
  %47 = and i32 %46, -2147483648
  %48 = bitcast float %17 to i32
  %49 = bitcast float %18 to i32
  %50 = xor i32 %49, %48
  %51 = xor i32 %50, %47
  %52 = xor i32 %51, %45
  %53 = bitcast i32 %52 to float
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 504)
  %55 = select i1 %54, float %53, float 0x7FF8000000000000
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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
