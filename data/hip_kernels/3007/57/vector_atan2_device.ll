; ModuleID = '../data/hip_kernels/3007/57/main.cu'
source_filename = "../data/hip_kernels/3007/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_atan2iPKfiiS0_iiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %70

21:                                               ; preds = %10
  %22 = mul nsw i32 %19, %3
  %23 = add nsw i32 %22, %2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = mul nsw i32 %19, %6
  %28 = add nsw i32 %27, %5
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = tail call float @llvm.fabs.f32(float %31)
  %33 = tail call float @llvm.fabs.f32(float %26)
  %34 = tail call float @llvm.minnum.f32(float %32, float %33)
  %35 = tail call float @llvm.maxnum.f32(float %32, float %33)
  %36 = fdiv float %34, %35, !fpmath !11
  %37 = fmul float %36, %36
  %38 = tail call float @llvm.fmuladd.f32(float %37, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float 0x3FA53F67E0000000)
  %40 = tail call float @llvm.fmuladd.f32(float %37, float %39, float 0xBFB2FA9AE0000000)
  %41 = tail call float @llvm.fmuladd.f32(float %37, float %40, float 0x3FBB263640000000)
  %42 = tail call float @llvm.fmuladd.f32(float %37, float %41, float 0xBFC22C1CC0000000)
  %43 = tail call float @llvm.fmuladd.f32(float %37, float %42, float 0x3FC99717E0000000)
  %44 = tail call float @llvm.fmuladd.f32(float %37, float %43, float 0xBFD5554C40000000)
  %45 = fmul float %37, %44
  %46 = tail call float @llvm.fmuladd.f32(float %36, float %45, float %36)
  %47 = fsub float 0x3FF921FB60000000, %46
  %48 = fcmp ogt float %33, %32
  %49 = select i1 %48, float %47, float %46
  %50 = fsub float 0x400921FB60000000, %49
  %51 = fcmp olt float %31, 0.000000e+00
  %52 = select i1 %51, float %50, float %49
  %53 = bitcast float %31 to i32
  %54 = icmp slt i32 %53, 0
  %55 = select i1 %54, float 0x400921FB60000000, float 0.000000e+00
  %56 = fcmp oeq float %26, 0.000000e+00
  %57 = select i1 %56, float %55, float %52
  %58 = select i1 %51, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %59 = fcmp oeq float %32, 0x7FF0000000000000
  %60 = fcmp oeq float %33, 0x7FF0000000000000
  %61 = and i1 %60, %59
  %62 = select i1 %61, float %58, float %57
  %63 = fcmp uno float %31, %26
  %64 = select i1 %63, float 0x7FF8000000000000, float %62
  %65 = tail call float @llvm.copysign.f32(float %64, float %26)
  %66 = mul nsw i32 %19, %9
  %67 = add nsw i32 %66, %8
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %7, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %21, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
!11 = !{float 2.500000e+00}
