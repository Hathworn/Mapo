; ModuleID = '../data/hip_kernels/7801/41/main.cu'
source_filename = "../data/hip_kernels/7801/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfinvf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %96

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 3.750000e-01
  br i1 %19, label %20, label %28

20:                                               ; preds = %15
  %21 = fmul float %17, %17
  %22 = tail call float @llvm.fmuladd.f32(float %21, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float 0x3FB65B0B40000000)
  %24 = tail call float @llvm.fmuladd.f32(float %21, float %23, float 0x3FB5581AE0000000)
  %25 = tail call float @llvm.fmuladd.f32(float %21, float %24, float 0x3FC05AA560000000)
  %26 = tail call float @llvm.fmuladd.f32(float %21, float %25, float 0x3FCDB27480000000)
  %27 = tail call float @llvm.fmuladd.f32(float %21, float %26, float 0x3FEC5BF8A0000000)
  br label %87

28:                                               ; preds = %15
  %29 = fneg float %18
  %30 = tail call float @llvm.fma.f32(float %29, float %18, float 1.000000e+00)
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %30, i32 144)
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %30, %32
  %34 = tail call float @llvm.log2.f32(float %33)
  %35 = fmul float %34, 0x3FE62E42E0000000
  %36 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 519)
  %37 = fneg float %35
  %38 = tail call float @llvm.fma.f32(float %34, float 0x3FE62E42E0000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %34, float 0x3E6EFA39E0000000, float %38)
  %40 = fadd float %35, %39
  %41 = select i1 %36, float %34, float %40
  %42 = select i1 %31, float 0x40362E4300000000, float 0.000000e+00
  %43 = fsub float %41, %42
  %44 = fcmp ogt float %43, -5.000000e+00
  br i1 %44, label %45, label %55

45:                                               ; preds = %28
  %46 = fsub float -2.500000e+00, %43
  %47 = tail call float @llvm.fmuladd.f32(float %46, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float 0xBECD8E6AE0000000)
  %49 = tail call float @llvm.fmuladd.f32(float %46, float %48, float 0xBED26B5820000000)
  %50 = tail call float @llvm.fmuladd.f32(float %46, float %49, float 0x3F2CA65B60000000)
  %51 = tail call float @llvm.fmuladd.f32(float %46, float %50, float 0xBF548A8100000000)
  %52 = tail call float @llvm.fmuladd.f32(float %46, float %51, float 0xBF711C9DE0000000)
  %53 = tail call float @llvm.fmuladd.f32(float %46, float %52, float 0x3FCF91EC60000000)
  %54 = tail call float @llvm.fmuladd.f32(float %46, float %53, float 0x3FF805C5E0000000)
  br label %87

55:                                               ; preds = %28
  %56 = fneg float %43
  %57 = fcmp ogt float %43, 0xB9F0000000000000
  %58 = select i1 %57, float 0x41F0000000000000, float 1.000000e+00
  %59 = fmul float %58, %56
  %60 = tail call float @llvm.sqrt.f32(float %59)
  %61 = bitcast float %60 to i32
  %62 = add nsw i32 %61, -1
  %63 = bitcast i32 %62 to float
  %64 = add nsw i32 %61, 1
  %65 = bitcast i32 %64 to float
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %66, float %60, float %59)
  %68 = fcmp ogt float %67, 0.000000e+00
  %69 = fneg float %63
  %70 = tail call float @llvm.fma.f32(float %69, float %60, float %59)
  %71 = fcmp ole float %70, 0.000000e+00
  %72 = select i1 %71, float %63, float %60
  %73 = select i1 %68, float %65, float %72
  %74 = select i1 %57, float 0x3EF0000000000000, float 1.000000e+00
  %75 = fmul float %74, %73
  %76 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 608)
  %77 = select i1 %76, float %59, float %75
  %78 = fadd float %77, -3.000000e+00
  %79 = tail call float @llvm.fmuladd.f32(float %78, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %80 = tail call float @llvm.fmuladd.f32(float %78, float %79, float 0x3F561B8E40000000)
  %81 = tail call float @llvm.fmuladd.f32(float %78, float %80, float 0xBF6E17BCE0000000)
  %82 = tail call float @llvm.fmuladd.f32(float %78, float %81, float 0x3F77824F60000000)
  %83 = tail call float @llvm.fmuladd.f32(float %78, float %82, float 0xBF7F38BAE0000000)
  %84 = tail call float @llvm.fmuladd.f32(float %78, float %83, float 0x3F8354AFC0000000)
  %85 = tail call float @llvm.fmuladd.f32(float %78, float %84, float 0x3FF006DB60000000)
  %86 = tail call float @llvm.fmuladd.f32(float %78, float %85, float 0x4006A9EFC0000000)
  br label %87

87:                                               ; preds = %20, %45, %55
  %88 = phi float [ %27, %20 ], [ %54, %45 ], [ %86, %55 ]
  %89 = fmul float %18, %88
  %90 = fcmp ogt float %18, 1.000000e+00
  %91 = select i1 %90, float 0x7FF8000000000000, float %89
  %92 = fcmp oeq float %18, 1.000000e+00
  %93 = select i1 %92, float 0x7FF0000000000000, float %91
  %94 = tail call float @llvm.copysign.f32(float %93, float %17)
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %94, float addrspace(1)* %95, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %87, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
