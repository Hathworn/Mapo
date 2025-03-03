; ModuleID = '../data/hip_kernels/3007/56/main.cu'
source_filename = "../data/hip_kernels/3007/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11vector_ataniPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %45

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp ogt float %24, 1.000000e+00
  %26 = tail call float @llvm.amdgcn.rcp.f32(float %24)
  %27 = select i1 %25, float %26, float %24
  %28 = fmul float %27, %27
  %29 = tail call float @llvm.fmuladd.f32(float %28, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float 0x3FA53F67E0000000)
  %31 = tail call float @llvm.fmuladd.f32(float %28, float %30, float 0xBFB2FA9AE0000000)
  %32 = tail call float @llvm.fmuladd.f32(float %28, float %31, float 0x3FBB263640000000)
  %33 = tail call float @llvm.fmuladd.f32(float %28, float %32, float 0xBFC22C1CC0000000)
  %34 = tail call float @llvm.fmuladd.f32(float %28, float %33, float 0x3FC99717E0000000)
  %35 = tail call float @llvm.fmuladd.f32(float %28, float %34, float 0xBFD5554C40000000)
  %36 = fmul float %28, %35
  %37 = tail call float @llvm.fmuladd.f32(float %27, float %36, float %27)
  %38 = fsub float 0x3FF921FB60000000, %37
  %39 = select i1 %25, float %38, float %37
  %40 = tail call float @llvm.copysign.f32(float %39, float %23)
  %41 = mul nsw i32 %16, %6
  %42 = add nsw i32 %41, %5
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  store float %40, float addrspace(1)* %44, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

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
