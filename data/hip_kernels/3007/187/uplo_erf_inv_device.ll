; ModuleID = '../data/hip_kernels/3007/187/main.cu'
source_filename = "../data/hip_kernels/3007/187/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12uplo_erf_inviiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %126

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %126

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp olt float %44, 3.750000e-01
  br i1 %45, label %46, label %54

46:                                               ; preds = %37
  %47 = fmul float %43, %43
  %48 = tail call float @llvm.fmuladd.f32(float %47, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %49 = tail call float @llvm.fmuladd.f32(float %47, float %48, float 0x3FB65B0B40000000)
  %50 = tail call float @llvm.fmuladd.f32(float %47, float %49, float 0x3FB5581AE0000000)
  %51 = tail call float @llvm.fmuladd.f32(float %47, float %50, float 0x3FC05AA560000000)
  %52 = tail call float @llvm.fmuladd.f32(float %47, float %51, float 0x3FCDB27480000000)
  %53 = tail call float @llvm.fmuladd.f32(float %47, float %52, float 0x3FEC5BF8A0000000)
  br label %113

54:                                               ; preds = %37
  %55 = fneg float %44
  %56 = tail call float @llvm.fma.f32(float %55, float %44, float 1.000000e+00)
  %57 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 144)
  %58 = select i1 %57, float 0x41F0000000000000, float 1.000000e+00
  %59 = fmul float %56, %58
  %60 = tail call float @llvm.log2.f32(float %59)
  %61 = fmul float %60, 0x3FE62E42E0000000
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 519)
  %63 = fneg float %61
  %64 = tail call float @llvm.fma.f32(float %60, float 0x3FE62E42E0000000, float %63)
  %65 = tail call float @llvm.fma.f32(float %60, float 0x3E6EFA39E0000000, float %64)
  %66 = fadd float %61, %65
  %67 = select i1 %62, float %60, float %66
  %68 = select i1 %57, float 0x40362E4300000000, float 0.000000e+00
  %69 = fsub float %67, %68
  %70 = fcmp ogt float %69, -5.000000e+00
  br i1 %70, label %71, label %81

71:                                               ; preds = %54
  %72 = fsub float -2.500000e+00, %69
  %73 = tail call float @llvm.fmuladd.f32(float %72, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %74 = tail call float @llvm.fmuladd.f32(float %72, float %73, float 0xBECD8E6AE0000000)
  %75 = tail call float @llvm.fmuladd.f32(float %72, float %74, float 0xBED26B5820000000)
  %76 = tail call float @llvm.fmuladd.f32(float %72, float %75, float 0x3F2CA65B60000000)
  %77 = tail call float @llvm.fmuladd.f32(float %72, float %76, float 0xBF548A8100000000)
  %78 = tail call float @llvm.fmuladd.f32(float %72, float %77, float 0xBF711C9DE0000000)
  %79 = tail call float @llvm.fmuladd.f32(float %72, float %78, float 0x3FCF91EC60000000)
  %80 = tail call float @llvm.fmuladd.f32(float %72, float %79, float 0x3FF805C5E0000000)
  br label %113

81:                                               ; preds = %54
  %82 = fneg float %69
  %83 = fcmp ogt float %69, 0xB9F0000000000000
  %84 = select i1 %83, float 0x41F0000000000000, float 1.000000e+00
  %85 = fmul float %84, %82
  %86 = tail call float @llvm.sqrt.f32(float %85)
  %87 = bitcast float %86 to i32
  %88 = add nsw i32 %87, -1
  %89 = bitcast i32 %88 to float
  %90 = add nsw i32 %87, 1
  %91 = bitcast i32 %90 to float
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %92, float %86, float %85)
  %94 = fcmp ogt float %93, 0.000000e+00
  %95 = fneg float %89
  %96 = tail call float @llvm.fma.f32(float %95, float %86, float %85)
  %97 = fcmp ole float %96, 0.000000e+00
  %98 = select i1 %97, float %89, float %86
  %99 = select i1 %94, float %91, float %98
  %100 = select i1 %83, float 0x3EF0000000000000, float 1.000000e+00
  %101 = fmul float %100, %99
  %102 = tail call i1 @llvm.amdgcn.class.f32(float %85, i32 608)
  %103 = select i1 %102, float %85, float %101
  %104 = fadd float %103, -3.000000e+00
  %105 = tail call float @llvm.fmuladd.f32(float %104, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %106 = tail call float @llvm.fmuladd.f32(float %104, float %105, float 0x3F561B8E40000000)
  %107 = tail call float @llvm.fmuladd.f32(float %104, float %106, float 0xBF6E17BCE0000000)
  %108 = tail call float @llvm.fmuladd.f32(float %104, float %107, float 0x3F77824F60000000)
  %109 = tail call float @llvm.fmuladd.f32(float %104, float %108, float 0xBF7F38BAE0000000)
  %110 = tail call float @llvm.fmuladd.f32(float %104, float %109, float 0x3F8354AFC0000000)
  %111 = tail call float @llvm.fmuladd.f32(float %104, float %110, float 0x3FF006DB60000000)
  %112 = tail call float @llvm.fmuladd.f32(float %104, float %111, float 0x4006A9EFC0000000)
  br label %113

113:                                              ; preds = %46, %71, %81
  %114 = phi float [ %53, %46 ], [ %80, %71 ], [ %112, %81 ]
  %115 = fmul float %44, %114
  %116 = fcmp ogt float %44, 1.000000e+00
  %117 = select i1 %116, float 0x7FF8000000000000, float %115
  %118 = fcmp oeq float %44, 1.000000e+00
  %119 = select i1 %118, float 0x7FF0000000000000, float %117
  %120 = tail call float @llvm.copysign.f32(float %119, float %43)
  %121 = add nsw i32 %18, %7
  %122 = mul nsw i32 %26, %8
  %123 = add nsw i32 %121, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %6, i64 %124
  store float %120, float addrspace(1)* %125, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %9, %113, %30
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
