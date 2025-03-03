; ModuleID = '../data/hip_kernels/7801/39/main.cu'
source_filename = "../data/hip_kernels/7801/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfcxf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %86

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 0x40241BBF80000000
  br i1 %19, label %20, label %48

20:                                               ; preds = %15
  %21 = fadd float %18, -2.000000e+00
  %22 = fadd float %18, 2.000000e+00
  %23 = tail call float @llvm.amdgcn.rcp.f32(float %22)
  %24 = fmul float %21, %23
  %25 = fneg float %24
  %26 = fadd float %24, 1.000000e+00
  %27 = tail call float @llvm.fma.f32(float %26, float -2.000000e+00, float %18)
  %28 = tail call float @llvm.fma.f32(float %25, float %18, float %27)
  %29 = tail call float @llvm.fma.f32(float %23, float %28, float %24)
  %30 = tail call float @llvm.fmuladd.f32(float %29, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float 0x3F55A5F680000000)
  %32 = tail call float @llvm.fmuladd.f32(float %29, float %31, float 0x3F81B44CE0000000)
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %32, float 0xBF8082B620000000)
  %34 = tail call float @llvm.fmuladd.f32(float %29, float %33, float 0xBFABC14300000000)
  %35 = tail call float @llvm.fmuladd.f32(float %29, float %34, float 0x3FC4FFC540000000)
  %36 = tail call float @llvm.fmuladd.f32(float %29, float %35, float 0xBFC5407FA0000000)
  %37 = tail call float @llvm.fmuladd.f32(float %29, float %36, float 0xBFB7BF6160000000)
  %38 = tail call float @llvm.fmuladd.f32(float %29, float %37, float 0x3FD1BA0380000000)
  %39 = fadd float %18, %18
  %40 = fadd float %39, 1.000000e+00
  %41 = tail call float @llvm.amdgcn.rcp.f32(float %40)
  %42 = tail call float @llvm.fma.f32(float %38, float %41, float %41)
  %43 = fneg float %42
  %44 = tail call float @llvm.fma.f32(float %43, float %39, float 1.000000e+00)
  %45 = fsub float %38, %42
  %46 = fadd float %44, %45
  %47 = tail call float @llvm.fma.f32(float %41, float %46, float %42)
  br label %59

48:                                               ; preds = %15
  %49 = fmul float %18, 2.500000e-01
  %50 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %51 = fmul float %50, %50
  %52 = fmul float %51, 6.250000e-02
  %53 = tail call float @llvm.fmuladd.f32(float %52, float 6.562500e+00, float -1.875000e+00)
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float 7.500000e-01)
  %55 = tail call float @llvm.fmuladd.f32(float %52, float %54, float -5.000000e-01)
  %56 = tail call float @llvm.fmuladd.f32(float %52, float %55, float 1.000000e+00)
  %57 = fmul float %50, 0x3FC20DD760000000
  %58 = fmul float %57, %56
  br label %59

59:                                               ; preds = %48, %20
  %60 = phi float [ %47, %20 ], [ %58, %48 ]
  %61 = fcmp olt float %17, 0.000000e+00
  br i1 %61, label %62, label %83

62:                                               ; preds = %59
  %63 = fmul float %17, %17
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %17, float %17, float %64)
  %66 = fmul float %63, 0x3FF7154760000000
  %67 = tail call float @llvm.rint.f32(float %66)
  %68 = fcmp ogt float %63, 0x40562E4300000000
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %63, float 0x3FF7154760000000, float %69)
  %71 = tail call float @llvm.fma.f32(float %63, float 0x3E54AE0BE0000000, float %70)
  %72 = fsub float %66, %67
  %73 = fadd float %71, %72
  %74 = tail call float @llvm.exp2.f32(float %73)
  %75 = fptosi float %67 to i32
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 %75)
  %77 = select i1 %68, float 0x7FF0000000000000, float %76
  %78 = tail call float @llvm.fma.f32(float %77, float %65, float %77)
  %79 = fneg float %60
  %80 = tail call float @llvm.fma.f32(float %78, float 2.000000e+00, float %79)
  %81 = fcmp olt float %17, 0xC022D6ABC0000000
  %82 = select i1 %81, float 0x7FF0000000000000, float %80
  br label %83

83:                                               ; preds = %59, %62
  %84 = phi float [ %82, %62 ], [ %60, %59 ]
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %84, float addrspace(1)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %83, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

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
