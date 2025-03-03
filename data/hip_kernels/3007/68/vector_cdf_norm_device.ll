; ModuleID = '../data/hip_kernels/3007/68/main.cu'
source_filename = "../data/hip_kernels/3007/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15vector_cdf_normiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %98

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp ogt float %24, 0x402C572280000000
  %26 = tail call float @llvm.copysign.f32(float 0x402C572280000000, float %23)
  %27 = select i1 %25, float %26, float %23
  %28 = fmul float %27, 0xBFE6A09E60000000
  %29 = fneg float %28
  %30 = tail call float @llvm.fma.f32(float %27, float 0xBFE6A09E60000000, float %29)
  %31 = tail call float @llvm.fma.f32(float %27, float 0xBE49FCEF40000000, float %30)
  %32 = fadd float %28, %31
  %33 = fsub float %32, %28
  %34 = fsub float %31, %33
  %35 = tail call float @llvm.fabs.f32(float %32)
  %36 = fneg float %32
  %37 = fmul float %32, %36
  %38 = fneg float %37
  %39 = tail call float @llvm.fma.f32(float %36, float %32, float %38)
  %40 = fmul float %37, 0x3FF7154760000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = fcmp ogt float %37, 0x40562E4300000000
  %43 = fcmp olt float %37, 0xC059D1DA00000000
  %44 = fneg float %40
  %45 = tail call float @llvm.fma.f32(float %37, float 0x3FF7154760000000, float %44)
  %46 = tail call float @llvm.fma.f32(float %37, float 0x3E54AE0BE0000000, float %45)
  %47 = fsub float %40, %41
  %48 = fadd float %46, %47
  %49 = tail call float @llvm.exp2.f32(float %48)
  %50 = fptosi float %41 to i32
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %50)
  %52 = select i1 %43, float 0.000000e+00, float %51
  %53 = select i1 %42, float 0x7FF0000000000000, float %52
  %54 = tail call float @llvm.fma.f32(float %53, float %39, float %53)
  %55 = fadd float %35, -2.000000e+00
  %56 = fadd float %35, 2.000000e+00
  %57 = tail call float @llvm.amdgcn.rcp.f32(float %56)
  %58 = fmul float %55, %57
  %59 = fneg float %58
  %60 = fadd float %58, 1.000000e+00
  %61 = tail call float @llvm.fma.f32(float %60, float -2.000000e+00, float %35)
  %62 = tail call float @llvm.fma.f32(float %59, float %35, float %61)
  %63 = tail call float @llvm.fma.f32(float %57, float %62, float %58)
  %64 = tail call float @llvm.fmuladd.f32(float %63, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %65 = tail call float @llvm.fmuladd.f32(float %63, float %64, float 0x3F55A5F680000000)
  %66 = tail call float @llvm.fmuladd.f32(float %63, float %65, float 0x3F81B44CE0000000)
  %67 = tail call float @llvm.fmuladd.f32(float %63, float %66, float 0xBF8082B620000000)
  %68 = tail call float @llvm.fmuladd.f32(float %63, float %67, float 0xBFABC14300000000)
  %69 = tail call float @llvm.fmuladd.f32(float %63, float %68, float 0x3FC4FFC540000000)
  %70 = tail call float @llvm.fmuladd.f32(float %63, float %69, float 0xBFC5407FA0000000)
  %71 = tail call float @llvm.fmuladd.f32(float %63, float %70, float 0xBFB7BF6160000000)
  %72 = tail call float @llvm.fmuladd.f32(float %63, float %71, float 0x3FD1BA0380000000)
  %73 = fadd float %35, %35
  %74 = fadd float %73, 1.000000e+00
  %75 = tail call float @llvm.amdgcn.rcp.f32(float %74)
  %76 = tail call float @llvm.fma.f32(float %72, float %75, float %75)
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %77, float %73, float 1.000000e+00)
  %79 = fsub float %72, %76
  %80 = fadd float %78, %79
  %81 = tail call float @llvm.fma.f32(float %75, float %80, float %76)
  %82 = fmul float %54, %81
  %83 = fcmp ogt float %35, 0x40241BBF80000000
  %84 = select i1 %83, float 0.000000e+00, float %82
  %85 = fsub float 2.000000e+00, %84
  %86 = fcmp olt float %32, 0.000000e+00
  %87 = select i1 %86, float %85, float %84
  %88 = fmul float %32, -2.000000e+00
  %89 = fmul float %88, %87
  %90 = fcmp oge float %27, -1.000000e+00
  %91 = select i1 %90, float 0.000000e+00, float %89
  %92 = tail call float @llvm.fma.f32(float %34, float %91, float %87)
  %93 = fmul float %92, 5.000000e-01
  %94 = mul nsw i32 %16, %6
  %95 = add nsw i32 %94, %5
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  store float %93, float addrspace(1)* %97, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %18, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
