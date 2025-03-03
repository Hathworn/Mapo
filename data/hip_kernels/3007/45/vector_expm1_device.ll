; ModuleID = '../data/hip_kernels/3007/45/main.cu'
source_filename = "../data/hip_kernels/3007/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_expm1iPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %52

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fmul float %23, 0x3FF7154760000000
  %25 = tail call float @llvm.rint.f32(float %24)
  %26 = fneg float %25
  %27 = tail call float @llvm.fma.f32(float %26, float 0x3FE62E4300000000, float %23)
  %28 = tail call float @llvm.fma.f32(float %26, float 0xBE205C6100000000, float %27)
  %29 = tail call float @llvm.fmuladd.f32(float %28, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float 0x3F8110FF20000000)
  %31 = tail call float @llvm.fmuladd.f32(float %28, float %30, float 0x3FA5555020000000)
  %32 = tail call float @llvm.fmuladd.f32(float %28, float %31, float 0x3FC5555560000000)
  %33 = tail call float @llvm.fmuladd.f32(float %28, float %32, float 5.000000e-01)
  %34 = fmul float %28, %33
  %35 = tail call float @llvm.fma.f32(float %28, float %34, float %28)
  %36 = fcmp oeq float %25, 1.280000e+02
  %37 = fptosi float %25 to i32
  %38 = select i1 %36, i32 127, i32 %37
  %39 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %38)
  %40 = fadd float %39, -1.000000e+00
  %41 = tail call float @llvm.fma.f32(float %39, float %35, float %40)
  %42 = fmul float %41, 2.000000e+00
  %43 = select i1 %36, float %42, float %41
  %44 = fcmp ogt float %23, 0x40562E42E0000000
  %45 = select i1 %44, float 0x7FF0000000000000, float %43
  %46 = fcmp olt float %23, -1.700000e+01
  %47 = select i1 %46, float -1.000000e+00, float %45
  %48 = mul nsw i32 %16, %6
  %49 = add nsw i32 %48, %5
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  store float %47, float addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %18, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
