; ModuleID = '../data/hip_kernels/3007/118/main.cu'
source_filename = "../data/hip_kernels/3007/118/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_atan2iiPKfiiS0_iiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %84

32:                                               ; preds = %11
  %33 = add nsw i32 %20, %3
  %34 = mul nsw i32 %28, %4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, %6
  %40 = mul nsw i32 %28, %7
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = tail call float @llvm.fabs.f32(float %44)
  %46 = tail call float @llvm.fabs.f32(float %38)
  %47 = tail call float @llvm.minnum.f32(float %45, float %46)
  %48 = tail call float @llvm.maxnum.f32(float %45, float %46)
  %49 = fdiv float %47, %48, !fpmath !11
  %50 = fmul float %49, %49
  %51 = tail call float @llvm.fmuladd.f32(float %50, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float 0x3FA53F67E0000000)
  %53 = tail call float @llvm.fmuladd.f32(float %50, float %52, float 0xBFB2FA9AE0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %50, float %53, float 0x3FBB263640000000)
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %54, float 0xBFC22C1CC0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %50, float %55, float 0x3FC99717E0000000)
  %57 = tail call float @llvm.fmuladd.f32(float %50, float %56, float 0xBFD5554C40000000)
  %58 = fmul float %50, %57
  %59 = tail call float @llvm.fmuladd.f32(float %49, float %58, float %49)
  %60 = fsub float 0x3FF921FB60000000, %59
  %61 = fcmp ogt float %46, %45
  %62 = select i1 %61, float %60, float %59
  %63 = fsub float 0x400921FB60000000, %62
  %64 = fcmp olt float %44, 0.000000e+00
  %65 = select i1 %64, float %63, float %62
  %66 = bitcast float %44 to i32
  %67 = icmp slt i32 %66, 0
  %68 = select i1 %67, float 0x400921FB60000000, float 0.000000e+00
  %69 = fcmp oeq float %38, 0.000000e+00
  %70 = select i1 %69, float %68, float %65
  %71 = select i1 %64, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %72 = fcmp oeq float %45, 0x7FF0000000000000
  %73 = fcmp oeq float %46, 0x7FF0000000000000
  %74 = and i1 %73, %72
  %75 = select i1 %74, float %71, float %70
  %76 = fcmp uno float %44, %38
  %77 = select i1 %76, float 0x7FF8000000000000, float %75
  %78 = tail call float @llvm.copysign.f32(float %77, float %38)
  %79 = add nsw i32 %20, %9
  %80 = mul nsw i32 %28, %10
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %8, i64 %82
  store float %78, float addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %32, %11
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
!11 = !{float 2.500000e+00}
