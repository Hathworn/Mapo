; ModuleID = '../data/hip_kernels/3007/66/main.cu'
source_filename = "../data/hip_kernels/3007/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11vector_erfciPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %81

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fneg float %23
  %26 = fmul float %23, %25
  %27 = fneg float %26
  %28 = tail call float @llvm.fma.f32(float %25, float %23, float %27)
  %29 = fmul float %26, 0x3FF7154760000000
  %30 = tail call float @llvm.rint.f32(float %29)
  %31 = fcmp ogt float %26, 0x40562E4300000000
  %32 = fcmp olt float %26, 0xC059D1DA00000000
  %33 = fneg float %29
  %34 = tail call float @llvm.fma.f32(float %26, float 0x3FF7154760000000, float %33)
  %35 = tail call float @llvm.fma.f32(float %26, float 0x3E54AE0BE0000000, float %34)
  %36 = fsub float %29, %30
  %37 = fadd float %35, %36
  %38 = tail call float @llvm.exp2.f32(float %37)
  %39 = fptosi float %30 to i32
  %40 = tail call float @llvm.amdgcn.ldexp.f32(float %38, i32 %39)
  %41 = select i1 %32, float 0.000000e+00, float %40
  %42 = select i1 %31, float 0x7FF0000000000000, float %41
  %43 = tail call float @llvm.fma.f32(float %42, float %28, float %42)
  %44 = fadd float %24, -2.000000e+00
  %45 = fadd float %24, 2.000000e+00
  %46 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %47 = fmul float %44, %46
  %48 = fneg float %47
  %49 = fadd float %47, 1.000000e+00
  %50 = tail call float @llvm.fma.f32(float %49, float -2.000000e+00, float %24)
  %51 = tail call float @llvm.fma.f32(float %48, float %24, float %50)
  %52 = tail call float @llvm.fma.f32(float %46, float %51, float %47)
  %53 = tail call float @llvm.fmuladd.f32(float %52, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float 0x3F55A5F680000000)
  %55 = tail call float @llvm.fmuladd.f32(float %52, float %54, float 0x3F81B44CE0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %52, float %55, float 0xBF8082B620000000)
  %57 = tail call float @llvm.fmuladd.f32(float %52, float %56, float 0xBFABC14300000000)
  %58 = tail call float @llvm.fmuladd.f32(float %52, float %57, float 0x3FC4FFC540000000)
  %59 = tail call float @llvm.fmuladd.f32(float %52, float %58, float 0xBFC5407FA0000000)
  %60 = tail call float @llvm.fmuladd.f32(float %52, float %59, float 0xBFB7BF6160000000)
  %61 = tail call float @llvm.fmuladd.f32(float %52, float %60, float 0x3FD1BA0380000000)
  %62 = fadd float %24, %24
  %63 = fadd float %62, 1.000000e+00
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %65 = tail call float @llvm.fma.f32(float %61, float %64, float %64)
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %66, float %62, float 1.000000e+00)
  %68 = fsub float %61, %65
  %69 = fadd float %67, %68
  %70 = tail call float @llvm.fma.f32(float %64, float %69, float %65)
  %71 = fmul float %43, %70
  %72 = fcmp ogt float %24, 0x40241BBF80000000
  %73 = select i1 %72, float 0.000000e+00, float %71
  %74 = fsub float 2.000000e+00, %73
  %75 = fcmp olt float %23, 0.000000e+00
  %76 = select i1 %75, float %74, float %73
  %77 = mul nsw i32 %16, %6
  %78 = add nsw i32 %77, %5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %79
  store float %76, float addrspace(1)* %80, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %18, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
