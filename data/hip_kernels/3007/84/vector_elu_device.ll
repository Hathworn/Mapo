; ModuleID = '../data/hip_kernels/3007/84/main.cu'
source_filename = "../data/hip_kernels/3007/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10vector_eluifPKfiiPfii(i32 %0, float %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %55

19:                                               ; preds = %8
  %20 = mul nsw i32 %17, %4
  %21 = add nsw i32 %20, %3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fmul float %24, 0x3FF7154760000000
  %26 = tail call float @llvm.rint.f32(float %25)
  %27 = fneg float %26
  %28 = tail call float @llvm.fma.f32(float %27, float 0x3FE62E4300000000, float %24)
  %29 = tail call float @llvm.fma.f32(float %27, float 0xBE205C6100000000, float %28)
  %30 = tail call float @llvm.fmuladd.f32(float %29, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float 0x3F8110FF20000000)
  %32 = tail call float @llvm.fmuladd.f32(float %29, float %31, float 0x3FA5555020000000)
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %32, float 0x3FC5555560000000)
  %34 = tail call float @llvm.fmuladd.f32(float %29, float %33, float 5.000000e-01)
  %35 = fmul float %29, %34
  %36 = tail call float @llvm.fma.f32(float %29, float %35, float %29)
  %37 = fcmp oeq float %26, 1.280000e+02
  %38 = fptosi float %26 to i32
  %39 = select i1 %37, i32 127, i32 %38
  %40 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %39)
  %41 = fadd float %40, -1.000000e+00
  %42 = tail call float @llvm.fma.f32(float %40, float %36, float %41)
  %43 = fmul float %42, 2.000000e+00
  %44 = select i1 %37, float %43, float %42
  %45 = fcmp ogt float %24, 0x40562E42E0000000
  %46 = select i1 %45, float 0x7FF0000000000000, float %44
  %47 = fcmp olt float %24, -1.700000e+01
  %48 = select i1 %47, float -1.000000e+00, float %46
  %49 = fmul contract float %48, %1
  %50 = tail call float @llvm.maxnum.f32(float %24, float %49)
  %51 = mul nsw i32 %17, %7
  %52 = add nsw i32 %51, %6
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  store float %50, float addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %19, %8
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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
