; ModuleID = '../data/hip_kernels/3007/127/main.cu'
source_filename = "../data/hip_kernels/3007/127/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7ge_erfciiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %94

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fneg float %35
  %38 = fmul float %35, %37
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %37, float %35, float %39)
  %41 = fmul float %38, 0x3FF7154760000000
  %42 = tail call float @llvm.rint.f32(float %41)
  %43 = fcmp ogt float %38, 0x40562E4300000000
  %44 = fcmp olt float %38, 0xC059D1DA00000000
  %45 = fneg float %41
  %46 = tail call float @llvm.fma.f32(float %38, float 0x3FF7154760000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %38, float 0x3E54AE0BE0000000, float %46)
  %48 = fsub float %41, %42
  %49 = fadd float %47, %48
  %50 = tail call float @llvm.exp2.f32(float %49)
  %51 = fptosi float %42 to i32
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 %51)
  %53 = select i1 %44, float 0.000000e+00, float %52
  %54 = select i1 %43, float 0x7FF0000000000000, float %53
  %55 = tail call float @llvm.fma.f32(float %54, float %40, float %54)
  %56 = fadd float %36, -2.000000e+00
  %57 = fadd float %36, 2.000000e+00
  %58 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %59 = fmul float %56, %58
  %60 = fneg float %59
  %61 = fadd float %59, 1.000000e+00
  %62 = tail call float @llvm.fma.f32(float %61, float -2.000000e+00, float %36)
  %63 = tail call float @llvm.fma.f32(float %60, float %36, float %62)
  %64 = tail call float @llvm.fma.f32(float %58, float %63, float %59)
  %65 = tail call float @llvm.fmuladd.f32(float %64, float 0xBF3ADF1880000000, float 0xBF545AEA60000000)
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float 0x3F55A5F680000000)
  %67 = tail call float @llvm.fmuladd.f32(float %64, float %66, float 0x3F81B44CE0000000)
  %68 = tail call float @llvm.fmuladd.f32(float %64, float %67, float 0xBF8082B620000000)
  %69 = tail call float @llvm.fmuladd.f32(float %64, float %68, float 0xBFABC14300000000)
  %70 = tail call float @llvm.fmuladd.f32(float %64, float %69, float 0x3FC4FFC540000000)
  %71 = tail call float @llvm.fmuladd.f32(float %64, float %70, float 0xBFC5407FA0000000)
  %72 = tail call float @llvm.fmuladd.f32(float %64, float %71, float 0xBFB7BF6160000000)
  %73 = tail call float @llvm.fmuladd.f32(float %64, float %72, float 0x3FD1BA0380000000)
  %74 = fadd float %36, %36
  %75 = fadd float %74, 1.000000e+00
  %76 = tail call float @llvm.amdgcn.rcp.f32(float %75)
  %77 = tail call float @llvm.fma.f32(float %73, float %76, float %76)
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %78, float %74, float 1.000000e+00)
  %80 = fsub float %73, %77
  %81 = fadd float %79, %80
  %82 = tail call float @llvm.fma.f32(float %76, float %81, float %77)
  %83 = fmul float %55, %82
  %84 = fcmp ogt float %36, 0x40241BBF80000000
  %85 = select i1 %84, float 0.000000e+00, float %83
  %86 = fsub float 2.000000e+00, %85
  %87 = fcmp olt float %35, 0.000000e+00
  %88 = select i1 %87, float %86, float %85
  %89 = add nsw i32 %17, %6
  %90 = mul nsw i32 %25, %7
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %5, i64 %92
  store float %88, float addrspace(1)* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %29, %8
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
