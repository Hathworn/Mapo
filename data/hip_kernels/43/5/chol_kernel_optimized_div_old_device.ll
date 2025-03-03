; ModuleID = '../data/hip_kernels/43/5/main.cu'
source_filename = "../data/hip_kernels/43/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29chol_kernel_optimized_div_oldPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = sub nsw i32 0, %11
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %53

14:                                               ; preds = %3
  %15 = shl i32 %1, 11
  %16 = mul i32 %1, 2049
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = fcmp olt float %19, 0x39F0000000000000
  %21 = select i1 %20, float 0x41F0000000000000, float 1.000000e+00
  %22 = fmul float %19, %21
  %23 = tail call float @llvm.sqrt.f32(float %22)
  %24 = bitcast float %23 to i32
  %25 = add nsw i32 %24, -1
  %26 = bitcast i32 %25 to float
  %27 = add nsw i32 %24, 1
  %28 = bitcast i32 %27 to float
  %29 = tail call i1 @llvm.amdgcn.class.f32(float %22, i32 608)
  %30 = select i1 %20, float 0x3EF0000000000000, float 1.000000e+00
  %31 = fneg float %28
  %32 = tail call float @llvm.fma.f32(float %31, float %23, float %22)
  %33 = fcmp ogt float %32, 0.000000e+00
  %34 = fneg float %26
  %35 = tail call float @llvm.fma.f32(float %34, float %23, float %22)
  %36 = fcmp ole float %35, 0.000000e+00
  %37 = select i1 %36, float %26, float %23
  %38 = select i1 %33, float %28, float %37
  %39 = fmul float %30, %38
  %40 = select i1 %29, float %22, float %39
  store float %40, float addrspace(1)* %18, align 4, !tbaa !7
  %41 = add i32 %1, 1
  %42 = icmp ult i32 %41, 2048
  br i1 %42, label %43, label %53

43:                                               ; preds = %14, %43
  %44 = phi i32 [ %51, %43 ], [ %41, %14 ]
  %45 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %46 = add i32 %44, %15
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fdiv contract float %49, %45
  store float %50, float addrspace(1)* %48, align 4, !tbaa !7
  %51 = add nuw nsw i32 %44, 1
  %52 = icmp ult i32 %44, 2047
  br i1 %52, label %43, label %53, !llvm.loop !11

53:                                               ; preds = %43, %14, %3
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
