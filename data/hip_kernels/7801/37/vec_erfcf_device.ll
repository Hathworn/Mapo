; ModuleID = '../data/hip_kernels/7801/37/main.cu'
source_filename = "../data/hip_kernels/7801/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfcf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %72

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fneg float %17
  %20 = fmul float %17, %19
  %21 = fneg float %20
  %22 = tail call float @llvm.fma.f32(float %19, float %17, float %21)
  %23 = fmul float %20, 0x3FF7154760000000
  %24 = tail call float @llvm.rint.f32(float %23)
  %25 = fcmp ogt float %20, 0x40562E4300000000
  %26 = fcmp olt float %20, 0xC059D1DA00000000
  %27 = fneg float %23
  %28 = tail call float @llvm.fma.f32(float %20, float 0x3FF7154760000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %20, float 0x3E54AE0BE0000000, float %28)
  %30 = fsub float %23, %24
  %31 = fadd float %29, %30
  %32 = tail call float @llvm.exp2.f32(float %31)
  %33 = fptosi float %24 to i32
  %34 = tail call float @llvm.amdgcn.ldexp.f32(float %32, i32 %33)
  %35 = select i1 %26, float 0.000000e+00, float %34
  %36 = select i1 %25, float 0x7FF0000000000000, float %35
  %37 = tail call float @llvm.fma.f32(float %36, float %22, float %36)
  %38 = fadd float %18, -2.000000e+00
  %39 = fadd float %18, 2.000000e+00
  %40 = tail call float @llvm.amdgcn.rcp.f32(float %39)
  %41 = fmul float %38, %40
  %42 = fneg float %41
  %43 = fadd float %41, 1.000000e+00
  %44 = tail call float @llvm.fma.f32(float %43, float -2.000000e+00, float %18)
  %45 = tail call float @llvm.fma.f32(float %42, float %18, float %44)
  %46 = tail call float @llvm.fma.f32(float %40, float %45, float %41)
  %47 = tail call float @llvm.fmuladd.f32(float %46, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float 0x3F55A5F680000000)
  %49 = tail call float @llvm.fmuladd.f32(float %46, float %48, float 0x3F81B44CE0000000)
  %50 = tail call float @llvm.fmuladd.f32(float %46, float %49, float 0xBF8082B620000000)
  %51 = tail call float @llvm.fmuladd.f32(float %46, float %50, float 0xBFABC14300000000)
  %52 = tail call float @llvm.fmuladd.f32(float %46, float %51, float 0x3FC4FFC540000000)
  %53 = tail call float @llvm.fmuladd.f32(float %46, float %52, float 0xBFC5407FA0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %46, float %53, float 0xBFB7BF6160000000)
  %55 = tail call float @llvm.fmuladd.f32(float %46, float %54, float 0x3FD1BA0380000000)
  %56 = fadd float %18, %18
  %57 = fadd float %56, 1.000000e+00
  %58 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %59 = tail call float @llvm.fma.f32(float %55, float %58, float %58)
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %60, float %56, float 1.000000e+00)
  %62 = fsub float %55, %59
  %63 = fadd float %61, %62
  %64 = tail call float @llvm.fma.f32(float %58, float %63, float %59)
  %65 = fmul float %37, %64
  %66 = fcmp ogt float %18, 0x40241BBF80000000
  %67 = select i1 %66, float 0.000000e+00, float %65
  %68 = fsub float 2.000000e+00, %67
  %69 = fcmp olt float %17, 0.000000e+00
  %70 = select i1 %69, float %68, float %67
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %70, float addrspace(1)* %71, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
