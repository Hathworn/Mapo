; ModuleID = '../data/hip_kernels/7801/45/main.cu'
source_filename = "../data/hip_kernels/7801/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_expm1f(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %43

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fmul float %17, 0x3FF7154760000000
  %19 = tail call float @llvm.rint.f32(float %18)
  %20 = fneg float %19
  %21 = tail call float @llvm.fma.f32(float %20, float 0x3FE62E4300000000, float %17)
  %22 = tail call float @llvm.fma.f32(float %20, float 0xBE205C6100000000, float %21)
  %23 = tail call float @llvm.fmuladd.f32(float %22, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float 0x3F8110FF20000000)
  %25 = tail call float @llvm.fmuladd.f32(float %22, float %24, float 0x3FA5555020000000)
  %26 = tail call float @llvm.fmuladd.f32(float %22, float %25, float 0x3FC5555560000000)
  %27 = tail call float @llvm.fmuladd.f32(float %22, float %26, float 5.000000e-01)
  %28 = fmul float %22, %27
  %29 = tail call float @llvm.fma.f32(float %22, float %28, float %22)
  %30 = fcmp oeq float %19, 1.280000e+02
  %31 = fptosi float %19 to i32
  %32 = select i1 %30, i32 127, i32 %31
  %33 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %32)
  %34 = fadd float %33, -1.000000e+00
  %35 = tail call float @llvm.fma.f32(float %33, float %29, float %34)
  %36 = fmul float %35, 2.000000e+00
  %37 = select i1 %30, float %36, float %35
  %38 = fcmp ogt float %17, 0x40562E42E0000000
  %39 = select i1 %38, float 0x7FF0000000000000, float %37
  %40 = fcmp olt float %17, -1.700000e+01
  %41 = select i1 %40, float -1.000000e+00, float %39
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %41, float addrspace(1)* %42, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

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
