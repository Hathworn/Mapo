; ModuleID = '../data/hip_kernels/12764/3/main.cu'
source_filename = "../data/hip_kernels/12764/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27kernelReadMotionEnergyAsyncPfS_iiiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %53

18:                                               ; preds = %7
  %19 = mul nsw i32 %3, %2
  %20 = mul nsw i32 %19, %4
  %21 = add nsw i32 %16, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fmul contract float %24, %24
  %28 = fmul contract float %26, %26
  %29 = fadd contract float %27, %28
  %30 = fcmp olt float %29, 0x39F0000000000000
  %31 = select i1 %30, float 0x41F0000000000000, float 1.000000e+00
  %32 = fmul float %29, %31
  %33 = tail call float @llvm.sqrt.f32(float %32)
  %34 = bitcast float %33 to i32
  %35 = add nsw i32 %34, -1
  %36 = bitcast i32 %35 to float
  %37 = add nsw i32 %34, 1
  %38 = bitcast i32 %37 to float
  %39 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 608)
  %40 = select i1 %30, float 0x3EF0000000000000, float 1.000000e+00
  %41 = fneg float %38
  %42 = tail call float @llvm.fma.f32(float %41, float %33, float %32)
  %43 = fcmp ogt float %42, 0.000000e+00
  %44 = fneg float %36
  %45 = tail call float @llvm.fma.f32(float %44, float %33, float %32)
  %46 = fcmp ole float %45, 0.000000e+00
  %47 = select i1 %46, float %36, float %33
  %48 = select i1 %43, float %38, float %47
  %49 = fmul float %40, %48
  %50 = select i1 %39, float %32, float %49
  %51 = sext i32 %16 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %18, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
