; ModuleID = '../data/hip_kernels/3007/125/main.cu'
source_filename = "../data/hip_kernels/3007/125/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6ge_erfiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %78

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp olt float %36, 1.000000e+00
  br i1 %37, label %38, label %46

38:                                               ; preds = %29
  %39 = fmul float %35, %35
  %40 = tail call float @llvm.fmuladd.f32(float %39, float 0xBF4268BC20000000, float 0x3F74208280000000)
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float 0xBF9B593700000000)
  %42 = tail call float @llvm.fmuladd.f32(float %39, float %41, float 0x3FBCE077C0000000)
  %43 = tail call float @llvm.fmuladd.f32(float %39, float %42, float 0xBFD8126600000000)
  %44 = tail call float @llvm.fmuladd.f32(float %39, float %43, float 0x3FC06EBA00000000)
  %45 = tail call float @llvm.fma.f32(float %36, float %44, float %36)
  br label %70

46:                                               ; preds = %29
  %47 = tail call float @llvm.fmuladd.f32(float %36, float 0x3EF1D31560000000, float 0xBF38D12900000000)
  %48 = tail call float @llvm.fmuladd.f32(float %36, float %47, float 0x3F6F9A6D20000000)
  %49 = tail call float @llvm.fmuladd.f32(float %36, float %48, float 0xBF98C31640000000)
  %50 = tail call float @llvm.fmuladd.f32(float %36, float %49, float 0x3FBB4E9C80000000)
  %51 = tail call float @llvm.fmuladd.f32(float %36, float %50, float 0x3FE4515FA0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %36, float %51, float 0x3FC078E500000000)
  %53 = tail call float @llvm.fma.f32(float %36, float %52, float %36)
  %54 = fneg float %53
  %55 = fmul float %53, 0xBFF7154760000000
  %56 = tail call float @llvm.rint.f32(float %55)
  %57 = fcmp olt float %53, 0xC0562E4300000000
  %58 = fcmp ogt float %53, 0x4059D1DA00000000
  %59 = fneg float %55
  %60 = tail call float @llvm.fma.f32(float %54, float 0x3FF7154760000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %54, float 0x3E54AE0BE0000000, float %60)
  %62 = fsub float %55, %56
  %63 = fadd float %61, %62
  %64 = tail call float @llvm.exp2.f32(float %63)
  %65 = fptosi float %56 to i32
  %66 = tail call float @llvm.amdgcn.ldexp.f32(float %64, i32 %65)
  %67 = fsub float 1.000000e+00, %66
  %68 = select i1 %58, float 1.000000e+00, float %67
  %69 = select i1 %57, float 0xFFF0000000000000, float %68
  br label %70

70:                                               ; preds = %38, %46
  %71 = phi float [ %45, %38 ], [ %69, %46 ]
  %72 = tail call float @llvm.copysign.f32(float %71, float %35)
  %73 = add nsw i32 %17, %6
  %74 = mul nsw i32 %25, %7
  %75 = add nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %5, i64 %76
  store float %72, float addrspace(1)* %77, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %70, %8
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
