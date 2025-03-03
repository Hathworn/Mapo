; ModuleID = '../data/hip_kernels/2332/42/main.cu'
source_filename = "../data/hip_kernels/2332/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12compute_absvjPKfS0_S0_Pf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %0
  br i1 %15, label %16, label %51

16:                                               ; preds = %5
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fmul contract float %19, %19
  %25 = fmul contract float %21, %21
  %26 = fadd contract float %24, %25
  %27 = fmul contract float %23, %23
  %28 = fadd contract float %26, %27
  %29 = fcmp olt float %28, 0x39F0000000000000
  %30 = select i1 %29, float 0x41F0000000000000, float 1.000000e+00
  %31 = fmul float %28, %30
  %32 = tail call float @llvm.sqrt.f32(float %31)
  %33 = bitcast float %32 to i32
  %34 = add nsw i32 %33, -1
  %35 = bitcast i32 %34 to float
  %36 = add nsw i32 %33, 1
  %37 = bitcast i32 %36 to float
  %38 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 608)
  %39 = select i1 %29, float 0x3EF0000000000000, float 1.000000e+00
  %40 = fneg float %37
  %41 = tail call float @llvm.fma.f32(float %40, float %32, float %31)
  %42 = fcmp ogt float %41, 0.000000e+00
  %43 = fneg float %35
  %44 = tail call float @llvm.fma.f32(float %43, float %32, float %31)
  %45 = fcmp ole float %44, 0.000000e+00
  %46 = select i1 %45, float %35, float %32
  %47 = select i1 %42, float %37, float %46
  %48 = fmul float %39, %47
  %49 = select i1 %38, float %31, float %48
  %50 = getelementptr inbounds float, float addrspace(1)* %4, i64 %17
  store float %49, float addrspace(1)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %16, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
