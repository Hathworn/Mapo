; ModuleID = '../data/hip_kernels/10833/4/main.cu'
source_filename = "../data/hip_kernels/10833/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4Inc1PfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %13, label %60

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  br label %17

17:                                               ; preds = %13, %21
  %18 = phi i32 [ 0, %13 ], [ %22, %21 ]
  %19 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %20 = fadd contract float %19, 1.000000e+00
  store float %20, float addrspace(1)* %15, align 4, !tbaa !7
  br label %24

21:                                               ; preds = %24
  %22 = add nuw nsw i32 %18, 1
  %23 = icmp eq i32 %22, 1048576
  br i1 %23, label %60, label %17, !llvm.loop !11

24:                                               ; preds = %24, %17
  %25 = phi i32 [ 0, %17 ], [ %58, %24 ]
  %26 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %26, float addrspace(1)* %16, align 4, !tbaa !7
  %27 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %27, float addrspace(1)* %16, align 4, !tbaa !7
  %28 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %28, float addrspace(1)* %16, align 4, !tbaa !7
  %29 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %29, float addrspace(1)* %16, align 4, !tbaa !7
  %30 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %30, float addrspace(1)* %16, align 4, !tbaa !7
  %31 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %31, float addrspace(1)* %16, align 4, !tbaa !7
  %32 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %32, float addrspace(1)* %16, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %33, float addrspace(1)* %16, align 4, !tbaa !7
  %34 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %34, float addrspace(1)* %16, align 4, !tbaa !7
  %35 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %35, float addrspace(1)* %16, align 4, !tbaa !7
  %36 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %36, float addrspace(1)* %16, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %37, float addrspace(1)* %16, align 4, !tbaa !7
  %38 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %38, float addrspace(1)* %16, align 4, !tbaa !7
  %39 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %39, float addrspace(1)* %16, align 4, !tbaa !7
  %40 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %40, float addrspace(1)* %16, align 4, !tbaa !7
  %41 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %41, float addrspace(1)* %16, align 4, !tbaa !7
  %42 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %42, float addrspace(1)* %16, align 4, !tbaa !7
  %43 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %43, float addrspace(1)* %16, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %44, float addrspace(1)* %16, align 4, !tbaa !7
  %45 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %45, float addrspace(1)* %16, align 4, !tbaa !7
  %46 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %46, float addrspace(1)* %16, align 4, !tbaa !7
  %47 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %47, float addrspace(1)* %16, align 4, !tbaa !7
  %48 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %48, float addrspace(1)* %16, align 4, !tbaa !7
  %49 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %49, float addrspace(1)* %16, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %50, float addrspace(1)* %16, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %51, float addrspace(1)* %16, align 4, !tbaa !7
  %52 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %52, float addrspace(1)* %16, align 4, !tbaa !7
  %53 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %53, float addrspace(1)* %16, align 4, !tbaa !7
  %54 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %54, float addrspace(1)* %16, align 4, !tbaa !7
  %55 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %55, float addrspace(1)* %16, align 4, !tbaa !7
  %56 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %56, float addrspace(1)* %16, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  store float %57, float addrspace(1)* %16, align 4, !tbaa !7
  %58 = add nuw nsw i32 %25, 32
  %59 = icmp eq i32 %58, 256
  br i1 %59, label %21, label %24, !llvm.loop !13

60:                                               ; preds = %21, %2
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
