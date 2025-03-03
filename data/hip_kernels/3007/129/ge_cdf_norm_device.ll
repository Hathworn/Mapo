; ModuleID = '../data/hip_kernels/3007/129/main.cu'
source_filename = "../data/hip_kernels/3007/129/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11ge_cdf_normiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %111

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp ogt float %36, 0x402C572280000000
  %38 = tail call float @llvm.copysign.f32(float 0x402C572280000000, float %35)
  %39 = select i1 %37, float %38, float %35
  %40 = fmul float %39, 0xBFE6A09E60000000
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %39, float 0xBFE6A09E60000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %39, float 0xBE49FCEF40000000, float %42)
  %44 = fadd float %40, %43
  %45 = fsub float %44, %40
  %46 = fsub float %43, %45
  %47 = tail call float @llvm.fabs.f32(float %44)
  %48 = fneg float %44
  %49 = fmul float %44, %48
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %48, float %44, float %50)
  %52 = fmul float %49, 0x3FF7154760000000
  %53 = tail call float @llvm.rint.f32(float %52)
  %54 = fcmp ogt float %49, 0x40562E4300000000
  %55 = fcmp olt float %49, 0xC059D1DA00000000
  %56 = fneg float %52
  %57 = tail call float @llvm.fma.f32(float %49, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %49, float 0x3E54AE0BE0000000, float %57)
  %59 = fsub float %52, %53
  %60 = fadd float %58, %59
  %61 = tail call float @llvm.exp2.f32(float %60)
  %62 = fptosi float %53 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = select i1 %55, float 0.000000e+00, float %63
  %65 = select i1 %54, float 0x7FF0000000000000, float %64
  %66 = tail call float @llvm.fma.f32(float %65, float %51, float %65)
  %67 = fadd float %47, -2.000000e+00
  %68 = fadd float %47, 2.000000e+00
  %69 = tail call float @llvm.amdgcn.rcp.f32(float %68)
  %70 = fmul float %67, %69
  %71 = fneg float %70
  %72 = fadd float %70, 1.000000e+00
  %73 = tail call float @llvm.fma.f32(float %72, float -2.000000e+00, float %47)
  %74 = tail call float @llvm.fma.f32(float %71, float %47, float %73)
  %75 = tail call float @llvm.fma.f32(float %69, float %74, float %70)
  %76 = tail call float @llvm.fmuladd.f32(float %75, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %77 = tail call float @llvm.fmuladd.f32(float %75, float %76, float 0x3F55A5F680000000)
  %78 = tail call float @llvm.fmuladd.f32(float %75, float %77, float 0x3F81B44CE0000000)
  %79 = tail call float @llvm.fmuladd.f32(float %75, float %78, float 0xBF8082B620000000)
  %80 = tail call float @llvm.fmuladd.f32(float %75, float %79, float 0xBFABC14300000000)
  %81 = tail call float @llvm.fmuladd.f32(float %75, float %80, float 0x3FC4FFC540000000)
  %82 = tail call float @llvm.fmuladd.f32(float %75, float %81, float 0xBFC5407FA0000000)
  %83 = tail call float @llvm.fmuladd.f32(float %75, float %82, float 0xBFB7BF6160000000)
  %84 = tail call float @llvm.fmuladd.f32(float %75, float %83, float 0x3FD1BA0380000000)
  %85 = fadd float %47, %47
  %86 = fadd float %85, 1.000000e+00
  %87 = tail call float @llvm.amdgcn.rcp.f32(float %86)
  %88 = tail call float @llvm.fma.f32(float %84, float %87, float %87)
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %89, float %85, float 1.000000e+00)
  %91 = fsub float %84, %88
  %92 = fadd float %90, %91
  %93 = tail call float @llvm.fma.f32(float %87, float %92, float %88)
  %94 = fmul float %66, %93
  %95 = fcmp ogt float %47, 0x40241BBF80000000
  %96 = select i1 %95, float 0.000000e+00, float %94
  %97 = fsub float 2.000000e+00, %96
  %98 = fcmp olt float %44, 0.000000e+00
  %99 = select i1 %98, float %97, float %96
  %100 = fmul float %44, -2.000000e+00
  %101 = fmul float %100, %99
  %102 = fcmp oge float %39, -1.000000e+00
  %103 = select i1 %102, float 0.000000e+00, float %101
  %104 = tail call float @llvm.fma.f32(float %46, float %103, float %99)
  %105 = fmul float %104, 5.000000e-01
  %106 = add nsw i32 %17, %6
  %107 = mul nsw i32 %25, %7
  %108 = add nsw i32 %106, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %5, i64 %109
  store float %105, float addrspace(1)* %110, align 4, !tbaa !7
  br label %111

111:                                              ; preds = %29, %8
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
