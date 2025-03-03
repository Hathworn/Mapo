; ModuleID = '../data/hip_kernels/16673/16/main.cu'
source_filename = "../data/hip_kernels/16673/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22iterative_saxpy_kernelPfPKfffi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float %2, float %3, i32 %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %4, 0
  br i1 %6, label %7, label %33

7:                                                ; preds = %5
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %20 = and i32 %4, 7
  %21 = icmp ult i32 %4, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %7
  %23 = and i32 %4, -8
  br label %34

24:                                               ; preds = %34, %7
  %25 = icmp eq i32 %20, 0
  br i1 %25, label %33, label %26

26:                                               ; preds = %24, %26
  %27 = phi i32 [ %31, %26 ], [ 0, %24 ]
  %28 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %29 = fmul contract float %28, %2
  %30 = fadd contract float %29, %3
  store float %30, float addrspace(1)* %19, align 4, !tbaa !7
  %31 = add i32 %27, 1
  %32 = icmp eq i32 %31, %20
  br i1 %32, label %33, label %26, !llvm.loop !11

33:                                               ; preds = %24, %26, %5
  ret void

34:                                               ; preds = %34, %22
  %35 = phi i32 [ 0, %22 ], [ %60, %34 ]
  %36 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %37 = fmul contract float %36, %2
  %38 = fadd contract float %37, %3
  store float %38, float addrspace(1)* %19, align 4, !tbaa !7
  %39 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %40 = fmul contract float %39, %2
  %41 = fadd contract float %40, %3
  store float %41, float addrspace(1)* %19, align 4, !tbaa !7
  %42 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %43 = fmul contract float %42, %2
  %44 = fadd contract float %43, %3
  store float %44, float addrspace(1)* %19, align 4, !tbaa !7
  %45 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %46 = fmul contract float %45, %2
  %47 = fadd contract float %46, %3
  store float %47, float addrspace(1)* %19, align 4, !tbaa !7
  %48 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %49 = fmul contract float %48, %2
  %50 = fadd contract float %49, %3
  store float %50, float addrspace(1)* %19, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %52 = fmul contract float %51, %2
  %53 = fadd contract float %52, %3
  store float %53, float addrspace(1)* %19, align 4, !tbaa !7
  %54 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %55 = fmul contract float %54, %2
  %56 = fadd contract float %55, %3
  store float %56, float addrspace(1)* %19, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %58 = fmul contract float %57, %2
  %59 = fadd contract float %58, %3
  store float %59, float addrspace(1)* %19, align 4, !tbaa !7
  %60 = add i32 %35, 8
  %61 = icmp eq i32 %60, %23
  br i1 %61, label %24, label %34, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
