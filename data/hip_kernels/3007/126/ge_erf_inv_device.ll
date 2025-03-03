; ModuleID = '../data/hip_kernels/3007/126/main.cu'
source_filename = "../data/hip_kernels/3007/126/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10ge_erf_inviiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %118

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp olt float %36, 3.750000e-01
  br i1 %37, label %38, label %46

38:                                               ; preds = %29
  %39 = fmul float %35, %35
  %40 = tail call float @llvm.fmuladd.f32(float %39, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float 0x3FB65B0B40000000)
  %42 = tail call float @llvm.fmuladd.f32(float %39, float %41, float 0x3FB5581AE0000000)
  %43 = tail call float @llvm.fmuladd.f32(float %39, float %42, float 0x3FC05AA560000000)
  %44 = tail call float @llvm.fmuladd.f32(float %39, float %43, float 0x3FCDB27480000000)
  %45 = tail call float @llvm.fmuladd.f32(float %39, float %44, float 0x3FEC5BF8A0000000)
  br label %105

46:                                               ; preds = %29
  %47 = fneg float %36
  %48 = tail call float @llvm.fma.f32(float %47, float %36, float 1.000000e+00)
  %49 = tail call i1 @llvm.amdgcn.class.f32(float %48, i32 144)
  %50 = select i1 %49, float 0x41F0000000000000, float 1.000000e+00
  %51 = fmul float %48, %50
  %52 = tail call float @llvm.log2.f32(float %51)
  %53 = fmul float %52, 0x3FE62E42E0000000
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 519)
  %55 = fneg float %53
  %56 = tail call float @llvm.fma.f32(float %52, float 0x3FE62E42E0000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %52, float 0x3E6EFA39E0000000, float %56)
  %58 = fadd float %53, %57
  %59 = select i1 %54, float %52, float %58
  %60 = select i1 %49, float 0x40362E4300000000, float 0.000000e+00
  %61 = fsub float %59, %60
  %62 = fcmp ogt float %61, -5.000000e+00
  br i1 %62, label %63, label %73

63:                                               ; preds = %46
  %64 = fsub float -2.500000e+00, %61
  %65 = tail call float @llvm.fmuladd.f32(float %64, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float 0xBECD8E6AE0000000)
  %67 = tail call float @llvm.fmuladd.f32(float %64, float %66, float 0xBED26B5820000000)
  %68 = tail call float @llvm.fmuladd.f32(float %64, float %67, float 0x3F2CA65B60000000)
  %69 = tail call float @llvm.fmuladd.f32(float %64, float %68, float 0xBF548A8100000000)
  %70 = tail call float @llvm.fmuladd.f32(float %64, float %69, float 0xBF711C9DE0000000)
  %71 = tail call float @llvm.fmuladd.f32(float %64, float %70, float 0x3FCF91EC60000000)
  %72 = tail call float @llvm.fmuladd.f32(float %64, float %71, float 0x3FF805C5E0000000)
  br label %105

73:                                               ; preds = %46
  %74 = fneg float %61
  %75 = fcmp ogt float %61, 0xB9F0000000000000
  %76 = select i1 %75, float 0x41F0000000000000, float 1.000000e+00
  %77 = fmul float %76, %74
  %78 = tail call float @llvm.sqrt.f32(float %77)
  %79 = bitcast float %78 to i32
  %80 = add nsw i32 %79, -1
  %81 = bitcast i32 %80 to float
  %82 = add nsw i32 %79, 1
  %83 = bitcast i32 %82 to float
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %84, float %78, float %77)
  %86 = fcmp ogt float %85, 0.000000e+00
  %87 = fneg float %81
  %88 = tail call float @llvm.fma.f32(float %87, float %78, float %77)
  %89 = fcmp ole float %88, 0.000000e+00
  %90 = select i1 %89, float %81, float %78
  %91 = select i1 %86, float %83, float %90
  %92 = select i1 %75, float 0x3EF0000000000000, float 1.000000e+00
  %93 = fmul float %92, %91
  %94 = tail call i1 @llvm.amdgcn.class.f32(float %77, i32 608)
  %95 = select i1 %94, float %77, float %93
  %96 = fadd float %95, -3.000000e+00
  %97 = tail call float @llvm.fmuladd.f32(float %96, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %98 = tail call float @llvm.fmuladd.f32(float %96, float %97, float 0x3F561B8E40000000)
  %99 = tail call float @llvm.fmuladd.f32(float %96, float %98, float 0xBF6E17BCE0000000)
  %100 = tail call float @llvm.fmuladd.f32(float %96, float %99, float 0x3F77824F60000000)
  %101 = tail call float @llvm.fmuladd.f32(float %96, float %100, float 0xBF7F38BAE0000000)
  %102 = tail call float @llvm.fmuladd.f32(float %96, float %101, float 0x3F8354AFC0000000)
  %103 = tail call float @llvm.fmuladd.f32(float %96, float %102, float 0x3FF006DB60000000)
  %104 = tail call float @llvm.fmuladd.f32(float %96, float %103, float 0x4006A9EFC0000000)
  br label %105

105:                                              ; preds = %38, %63, %73
  %106 = phi float [ %45, %38 ], [ %72, %63 ], [ %104, %73 ]
  %107 = fmul float %36, %106
  %108 = fcmp ogt float %36, 1.000000e+00
  %109 = select i1 %108, float 0x7FF8000000000000, float %107
  %110 = fcmp oeq float %36, 1.000000e+00
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  %112 = tail call float @llvm.copysign.f32(float %111, float %35)
  %113 = add nsw i32 %17, %6
  %114 = mul nsw i32 %25, %7
  %115 = add nsw i32 %113, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %5, i64 %116
  store float %112, float addrspace(1)* %117, align 4, !tbaa !7
  br label %118

118:                                              ; preds = %105, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
