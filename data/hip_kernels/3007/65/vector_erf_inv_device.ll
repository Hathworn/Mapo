; ModuleID = '../data/hip_kernels/3007/65/main.cu'
source_filename = "../data/hip_kernels/3007/65/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14vector_erf_inviPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %105

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp olt float %24, 3.750000e-01
  br i1 %25, label %26, label %34

26:                                               ; preds = %18
  %27 = fmul float %23, %23
  %28 = tail call float @llvm.fmuladd.f32(float %27, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float 0x3FB65B0B40000000)
  %30 = tail call float @llvm.fmuladd.f32(float %27, float %29, float 0x3FB5581AE0000000)
  %31 = tail call float @llvm.fmuladd.f32(float %27, float %30, float 0x3FC05AA560000000)
  %32 = tail call float @llvm.fmuladd.f32(float %27, float %31, float 0x3FCDB27480000000)
  %33 = tail call float @llvm.fmuladd.f32(float %27, float %32, float 0x3FEC5BF8A0000000)
  br label %93

34:                                               ; preds = %18
  %35 = fneg float %24
  %36 = tail call float @llvm.fma.f32(float %35, float %24, float 1.000000e+00)
  %37 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %38 = select i1 %37, float 0x41F0000000000000, float 1.000000e+00
  %39 = fmul float %36, %38
  %40 = tail call float @llvm.log2.f32(float %39)
  %41 = fmul float %40, 0x3FE62E42E0000000
  %42 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 519)
  %43 = fneg float %41
  %44 = tail call float @llvm.fma.f32(float %40, float 0x3FE62E42E0000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %40, float 0x3E6EFA39E0000000, float %44)
  %46 = fadd float %41, %45
  %47 = select i1 %42, float %40, float %46
  %48 = select i1 %37, float 0x40362E4300000000, float 0.000000e+00
  %49 = fsub float %47, %48
  %50 = fcmp ogt float %49, -5.000000e+00
  br i1 %50, label %51, label %61

51:                                               ; preds = %34
  %52 = fsub float -2.500000e+00, %49
  %53 = tail call float @llvm.fmuladd.f32(float %52, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float 0xBECD8E6AE0000000)
  %55 = tail call float @llvm.fmuladd.f32(float %52, float %54, float 0xBED26B5820000000)
  %56 = tail call float @llvm.fmuladd.f32(float %52, float %55, float 0x3F2CA65B60000000)
  %57 = tail call float @llvm.fmuladd.f32(float %52, float %56, float 0xBF548A8100000000)
  %58 = tail call float @llvm.fmuladd.f32(float %52, float %57, float 0xBF711C9DE0000000)
  %59 = tail call float @llvm.fmuladd.f32(float %52, float %58, float 0x3FCF91EC60000000)
  %60 = tail call float @llvm.fmuladd.f32(float %52, float %59, float 0x3FF805C5E0000000)
  br label %93

61:                                               ; preds = %34
  %62 = fneg float %49
  %63 = fcmp ogt float %49, 0xB9F0000000000000
  %64 = select i1 %63, float 0x41F0000000000000, float 1.000000e+00
  %65 = fmul float %64, %62
  %66 = tail call float @llvm.sqrt.f32(float %65)
  %67 = bitcast float %66 to i32
  %68 = add nsw i32 %67, -1
  %69 = bitcast i32 %68 to float
  %70 = add nsw i32 %67, 1
  %71 = bitcast i32 %70 to float
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %72, float %66, float %65)
  %74 = fcmp ogt float %73, 0.000000e+00
  %75 = fneg float %69
  %76 = tail call float @llvm.fma.f32(float %75, float %66, float %65)
  %77 = fcmp ole float %76, 0.000000e+00
  %78 = select i1 %77, float %69, float %66
  %79 = select i1 %74, float %71, float %78
  %80 = select i1 %63, float 0x3EF0000000000000, float 1.000000e+00
  %81 = fmul float %80, %79
  %82 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 608)
  %83 = select i1 %82, float %65, float %81
  %84 = fadd float %83, -3.000000e+00
  %85 = tail call float @llvm.fmuladd.f32(float %84, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float 0x3F561B8E40000000)
  %87 = tail call float @llvm.fmuladd.f32(float %84, float %86, float 0xBF6E17BCE0000000)
  %88 = tail call float @llvm.fmuladd.f32(float %84, float %87, float 0x3F77824F60000000)
  %89 = tail call float @llvm.fmuladd.f32(float %84, float %88, float 0xBF7F38BAE0000000)
  %90 = tail call float @llvm.fmuladd.f32(float %84, float %89, float 0x3F8354AFC0000000)
  %91 = tail call float @llvm.fmuladd.f32(float %84, float %90, float 0x3FF006DB60000000)
  %92 = tail call float @llvm.fmuladd.f32(float %84, float %91, float 0x4006A9EFC0000000)
  br label %93

93:                                               ; preds = %26, %51, %61
  %94 = phi float [ %33, %26 ], [ %60, %51 ], [ %92, %61 ]
  %95 = fmul float %24, %94
  %96 = fcmp ogt float %24, 1.000000e+00
  %97 = select i1 %96, float 0x7FF8000000000000, float %95
  %98 = fcmp oeq float %24, 1.000000e+00
  %99 = select i1 %98, float 0x7FF0000000000000, float %97
  %100 = tail call float @llvm.copysign.f32(float %99, float %23)
  %101 = mul nsw i32 %16, %6
  %102 = add nsw i32 %101, %5
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %4, i64 %103
  store float %100, float addrspace(1)* %104, align 4, !tbaa !7
  br label %105

105:                                              ; preds = %93, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

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
