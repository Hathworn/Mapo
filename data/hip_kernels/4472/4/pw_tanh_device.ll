; ModuleID = '../data/hip_kernels/4472/4/main.cu'
source_filename = "../data/hip_kernels/4472/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7pw_tanhPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %49

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 6.250000e-01
  br i1 %19, label %20, label %28

20:                                               ; preds = %14
  %21 = fmul float %17, %17
  %22 = tail call float @llvm.fmuladd.f32(float %21, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float 0xBFAB8389C0000000)
  %24 = tail call float @llvm.fmuladd.f32(float %21, float %23, float 0x3FC1107040000000)
  %25 = tail call float @llvm.fmuladd.f32(float %21, float %24, float 0xBFD5555320000000)
  %26 = fmul float %18, %25
  %27 = tail call float @llvm.fmuladd.f32(float %21, float %26, float %18)
  br label %45

28:                                               ; preds = %14
  %29 = fmul float %18, 2.000000e+00
  %30 = fmul float %29, 0x3FF7154760000000
  %31 = tail call float @llvm.rint.f32(float %30)
  %32 = fcmp ogt float %29, 0x40562E4300000000
  %33 = fneg float %30
  %34 = tail call float @llvm.fma.f32(float %29, float 0x3FF7154760000000, float %33)
  %35 = tail call float @llvm.fma.f32(float %29, float 0x3E54AE0BE0000000, float %34)
  %36 = fsub float %30, %31
  %37 = fadd float %35, %36
  %38 = tail call float @llvm.exp2.f32(float %37)
  %39 = fptosi float %31 to i32
  %40 = tail call float @llvm.amdgcn.ldexp.f32(float %38, i32 %39)
  %41 = fadd float %40, 1.000000e+00
  %42 = select i1 %32, float 0x7FF0000000000000, float %41
  %43 = tail call float @llvm.amdgcn.rcp.f32(float %42)
  %44 = tail call float @llvm.fmuladd.f32(float %43, float -2.000000e+00, float 1.000000e+00)
  br label %45

45:                                               ; preds = %20, %28
  %46 = phi float [ %27, %20 ], [ %44, %28 ]
  %47 = tail call float @llvm.copysign.f32(float %46, float %17)
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %45, %3
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
