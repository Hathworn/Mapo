; ModuleID = '../data/hip_kernels/3007/186/main.cu'
source_filename = "../data/hip_kernels/3007/186/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8uplo_erfiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %86

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %86

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp olt float %44, 1.000000e+00
  br i1 %45, label %46, label %54

46:                                               ; preds = %37
  %47 = fmul float %43, %43
  %48 = tail call float @llvm.fmuladd.f32(float %47, float 0xBF4268BC20000000, float 0x3F74208280000000)
  %49 = tail call float @llvm.fmuladd.f32(float %47, float %48, float 0xBF9B593700000000)
  %50 = tail call float @llvm.fmuladd.f32(float %47, float %49, float 0x3FBCE077C0000000)
  %51 = tail call float @llvm.fmuladd.f32(float %47, float %50, float 0xBFD8126600000000)
  %52 = tail call float @llvm.fmuladd.f32(float %47, float %51, float 0x3FC06EBA00000000)
  %53 = tail call float @llvm.fma.f32(float %44, float %52, float %44)
  br label %78

54:                                               ; preds = %37
  %55 = tail call float @llvm.fmuladd.f32(float %44, float 0x3EF1D31560000000, float 0xBF38D12900000000)
  %56 = tail call float @llvm.fmuladd.f32(float %44, float %55, float 0x3F6F9A6D20000000)
  %57 = tail call float @llvm.fmuladd.f32(float %44, float %56, float 0xBF98C31640000000)
  %58 = tail call float @llvm.fmuladd.f32(float %44, float %57, float 0x3FBB4E9C80000000)
  %59 = tail call float @llvm.fmuladd.f32(float %44, float %58, float 0x3FE4515FA0000000)
  %60 = tail call float @llvm.fmuladd.f32(float %44, float %59, float 0x3FC078E500000000)
  %61 = tail call float @llvm.fma.f32(float %44, float %60, float %44)
  %62 = fneg float %61
  %63 = fmul float %61, 0xBFF7154760000000
  %64 = tail call float @llvm.rint.f32(float %63)
  %65 = fcmp olt float %61, 0xC0562E4300000000
  %66 = fcmp ogt float %61, 0x4059D1DA00000000
  %67 = fneg float %63
  %68 = tail call float @llvm.fma.f32(float %62, float 0x3FF7154760000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %62, float 0x3E54AE0BE0000000, float %68)
  %70 = fsub float %63, %64
  %71 = fadd float %69, %70
  %72 = tail call float @llvm.exp2.f32(float %71)
  %73 = fptosi float %64 to i32
  %74 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 %73)
  %75 = fsub float 1.000000e+00, %74
  %76 = select i1 %66, float 1.000000e+00, float %75
  %77 = select i1 %65, float 0xFFF0000000000000, float %76
  br label %78

78:                                               ; preds = %46, %54
  %79 = phi float [ %53, %46 ], [ %77, %54 ]
  %80 = tail call float @llvm.copysign.f32(float %79, float %43)
  %81 = add nsw i32 %18, %7
  %82 = mul nsw i32 %26, %8
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  store float %80, float addrspace(1)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %9, %78, %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
