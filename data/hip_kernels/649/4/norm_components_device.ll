; ModuleID = '../data/hip_kernels/649/4/main.cu'
source_filename = "../data/hip_kernels/649/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15norm_componentsPfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %1
  br i1 %13, label %14, label %55

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = fmul contract float %17, %17
  %19 = add nsw i32 %12, %1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fmul contract float %22, %22
  %24 = fadd contract float %18, %23
  %25 = shl nsw i32 %1, 1
  %26 = add nsw i32 %12, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fmul contract float %29, %29
  %31 = fadd contract float %24, %30
  %32 = fcmp olt float %31, 0x39F0000000000000
  %33 = select i1 %32, float 0x41F0000000000000, float 1.000000e+00
  %34 = fmul float %31, %33
  %35 = tail call float @llvm.sqrt.f32(float %34)
  %36 = bitcast float %35 to i32
  %37 = add nsw i32 %36, -1
  %38 = bitcast i32 %37 to float
  %39 = add nsw i32 %36, 1
  %40 = bitcast i32 %39 to float
  %41 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 608)
  %42 = select i1 %32, float 0x3EF0000000000000, float 1.000000e+00
  %43 = fneg float %40
  %44 = tail call float @llvm.fma.f32(float %43, float %35, float %34)
  %45 = fcmp ogt float %44, 0.000000e+00
  %46 = fneg float %38
  %47 = tail call float @llvm.fma.f32(float %46, float %35, float %34)
  %48 = fcmp ole float %47, 0.000000e+00
  %49 = select i1 %48, float %38, float %35
  %50 = select i1 %45, float %40, float %49
  %51 = fmul float %42, %50
  %52 = select i1 %41, float %34, float %51
  %53 = tail call float @llvm.maxnum.f32(float %52, float 0x3DDB7CDFE0000000)
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  store float %53, float addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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
