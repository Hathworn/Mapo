; ModuleID = '../data/hip_kernels/7801/56/main.cu'
source_filename = "../data/hip_kernels/7801/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_normcdff(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %89

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp ogt float %18, 0x402C572280000000
  %20 = tail call float @llvm.copysign.f32(float 0x402C572280000000, float %17)
  %21 = select i1 %19, float %20, float %17
  %22 = fmul float %21, 0xBFE6A09E60000000
  %23 = fneg float %22
  %24 = tail call float @llvm.fma.f32(float %21, float 0xBFE6A09E60000000, float %23)
  %25 = tail call float @llvm.fma.f32(float %21, float 0xBE49FCEF40000000, float %24)
  %26 = fadd float %22, %25
  %27 = fsub float %26, %22
  %28 = fsub float %25, %27
  %29 = tail call float @llvm.fabs.f32(float %26)
  %30 = fneg float %26
  %31 = fmul float %26, %30
  %32 = fneg float %31
  %33 = tail call float @llvm.fma.f32(float %30, float %26, float %32)
  %34 = fmul float %31, 0x3FF7154760000000
  %35 = tail call float @llvm.rint.f32(float %34)
  %36 = fcmp ogt float %31, 0x40562E4300000000
  %37 = fcmp olt float %31, 0xC059D1DA00000000
  %38 = fneg float %34
  %39 = tail call float @llvm.fma.f32(float %31, float 0x3FF7154760000000, float %38)
  %40 = tail call float @llvm.fma.f32(float %31, float 0x3E54AE0BE0000000, float %39)
  %41 = fsub float %34, %35
  %42 = fadd float %40, %41
  %43 = tail call float @llvm.exp2.f32(float %42)
  %44 = fptosi float %35 to i32
  %45 = tail call float @llvm.amdgcn.ldexp.f32(float %43, i32 %44)
  %46 = select i1 %37, float 0.000000e+00, float %45
  %47 = select i1 %36, float 0x7FF0000000000000, float %46
  %48 = tail call float @llvm.fma.f32(float %47, float %33, float %47)
  %49 = fadd float %29, -2.000000e+00
  %50 = fadd float %29, 2.000000e+00
  %51 = tail call float @llvm.amdgcn.rcp.f32(float %50)
  %52 = fmul float %49, %51
  %53 = fneg float %52
  %54 = fadd float %52, 1.000000e+00
  %55 = tail call float @llvm.fma.f32(float %54, float -2.000000e+00, float %29)
  %56 = tail call float @llvm.fma.f32(float %53, float %29, float %55)
  %57 = tail call float @llvm.fma.f32(float %51, float %56, float %52)
  %58 = tail call float @llvm.fmuladd.f32(float %57, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %59 = tail call float @llvm.fmuladd.f32(float %57, float %58, float 0x3F55A5F680000000)
  %60 = tail call float @llvm.fmuladd.f32(float %57, float %59, float 0x3F81B44CE0000000)
  %61 = tail call float @llvm.fmuladd.f32(float %57, float %60, float 0xBF8082B620000000)
  %62 = tail call float @llvm.fmuladd.f32(float %57, float %61, float 0xBFABC14300000000)
  %63 = tail call float @llvm.fmuladd.f32(float %57, float %62, float 0x3FC4FFC540000000)
  %64 = tail call float @llvm.fmuladd.f32(float %57, float %63, float 0xBFC5407FA0000000)
  %65 = tail call float @llvm.fmuladd.f32(float %57, float %64, float 0xBFB7BF6160000000)
  %66 = tail call float @llvm.fmuladd.f32(float %57, float %65, float 0x3FD1BA0380000000)
  %67 = fadd float %29, %29
  %68 = fadd float %67, 1.000000e+00
  %69 = tail call float @llvm.amdgcn.rcp.f32(float %68)
  %70 = tail call float @llvm.fma.f32(float %66, float %69, float %69)
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %71, float %67, float 1.000000e+00)
  %73 = fsub float %66, %70
  %74 = fadd float %72, %73
  %75 = tail call float @llvm.fma.f32(float %69, float %74, float %70)
  %76 = fmul float %48, %75
  %77 = fcmp ogt float %29, 0x40241BBF80000000
  %78 = select i1 %77, float 0.000000e+00, float %76
  %79 = fsub float 2.000000e+00, %78
  %80 = fcmp olt float %26, 0.000000e+00
  %81 = select i1 %80, float %79, float %78
  %82 = fmul float %26, -2.000000e+00
  %83 = fmul float %82, %81
  %84 = fcmp oge float %21, -1.000000e+00
  %85 = select i1 %84, float 0.000000e+00, float %83
  %86 = tail call float @llvm.fma.f32(float %28, float %85, float %81)
  %87 = fmul float %86, 5.000000e-01
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %87, float addrspace(1)* %88, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
