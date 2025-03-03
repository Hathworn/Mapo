; ModuleID = '../data/hip_kernels/3007/190/main.cu'
source_filename = "../data/hip_kernels/3007/190/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13uplo_cdf_normiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %119

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %119

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp ogt float %44, 0x402C572280000000
  %46 = tail call float @llvm.copysign.f32(float 0x402C572280000000, float %43)
  %47 = select i1 %45, float %46, float %43
  %48 = fmul float %47, 0xBFE6A09E60000000
  %49 = fneg float %48
  %50 = tail call float @llvm.fma.f32(float %47, float 0xBFE6A09E60000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %47, float 0xBE49FCEF40000000, float %50)
  %52 = fadd float %48, %51
  %53 = fsub float %52, %48
  %54 = fsub float %51, %53
  %55 = tail call float @llvm.fabs.f32(float %52)
  %56 = fneg float %52
  %57 = fmul float %52, %56
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %56, float %52, float %58)
  %60 = fmul float %57, 0x3FF7154760000000
  %61 = tail call float @llvm.rint.f32(float %60)
  %62 = fcmp ogt float %57, 0x40562E4300000000
  %63 = fcmp olt float %57, 0xC059D1DA00000000
  %64 = fneg float %60
  %65 = tail call float @llvm.fma.f32(float %57, float 0x3FF7154760000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %57, float 0x3E54AE0BE0000000, float %65)
  %67 = fsub float %60, %61
  %68 = fadd float %66, %67
  %69 = tail call float @llvm.exp2.f32(float %68)
  %70 = fptosi float %61 to i32
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %69, i32 %70)
  %72 = select i1 %63, float 0.000000e+00, float %71
  %73 = select i1 %62, float 0x7FF0000000000000, float %72
  %74 = tail call float @llvm.fma.f32(float %73, float %59, float %73)
  %75 = fadd float %55, -2.000000e+00
  %76 = fadd float %55, 2.000000e+00
  %77 = tail call float @llvm.amdgcn.rcp.f32(float %76)
  %78 = fmul float %75, %77
  %79 = fneg float %78
  %80 = fadd float %78, 1.000000e+00
  %81 = tail call float @llvm.fma.f32(float %80, float -2.000000e+00, float %55)
  %82 = tail call float @llvm.fma.f32(float %79, float %55, float %81)
  %83 = tail call float @llvm.fma.f32(float %77, float %82, float %78)
  %84 = tail call float @llvm.fmuladd.f32(float %83, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %85 = tail call float @llvm.fmuladd.f32(float %83, float %84, float 0x3F55A5F680000000)
  %86 = tail call float @llvm.fmuladd.f32(float %83, float %85, float 0x3F81B44CE0000000)
  %87 = tail call float @llvm.fmuladd.f32(float %83, float %86, float 0xBF8082B620000000)
  %88 = tail call float @llvm.fmuladd.f32(float %83, float %87, float 0xBFABC14300000000)
  %89 = tail call float @llvm.fmuladd.f32(float %83, float %88, float 0x3FC4FFC540000000)
  %90 = tail call float @llvm.fmuladd.f32(float %83, float %89, float 0xBFC5407FA0000000)
  %91 = tail call float @llvm.fmuladd.f32(float %83, float %90, float 0xBFB7BF6160000000)
  %92 = tail call float @llvm.fmuladd.f32(float %83, float %91, float 0x3FD1BA0380000000)
  %93 = fadd float %55, %55
  %94 = fadd float %93, 1.000000e+00
  %95 = tail call float @llvm.amdgcn.rcp.f32(float %94)
  %96 = tail call float @llvm.fma.f32(float %92, float %95, float %95)
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %97, float %93, float 1.000000e+00)
  %99 = fsub float %92, %96
  %100 = fadd float %98, %99
  %101 = tail call float @llvm.fma.f32(float %95, float %100, float %96)
  %102 = fmul float %74, %101
  %103 = fcmp ogt float %55, 0x40241BBF80000000
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fsub float 2.000000e+00, %104
  %106 = fcmp olt float %52, 0.000000e+00
  %107 = select i1 %106, float %105, float %104
  %108 = fmul float %52, -2.000000e+00
  %109 = fmul float %108, %107
  %110 = fcmp oge float %47, -1.000000e+00
  %111 = select i1 %110, float 0.000000e+00, float %109
  %112 = tail call float @llvm.fma.f32(float %54, float %111, float %107)
  %113 = fmul float %112, 5.000000e-01
  %114 = add nsw i32 %18, %7
  %115 = mul nsw i32 %26, %8
  %116 = add nsw i32 %114, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %6, i64 %117
  store float %113, float addrspace(1)* %118, align 4, !tbaa !7
  br label %119

119:                                              ; preds = %9, %37, %30
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
