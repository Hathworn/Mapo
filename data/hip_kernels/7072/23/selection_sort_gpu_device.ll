; ModuleID = '../data/hip_kernels/7072/23/main.cu'
source_filename = "../data/hip_kernels/7072/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18selection_sort_gpuiiiiPfPiS_(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %2
  %10 = mul i32 %9, %1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %4, i64 %11
  %13 = mul i32 %9, %3
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %14
  %16 = getelementptr inbounds float, float addrspace(1)* %6, i64 %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = icmp slt i32 %17, %2
  br i1 %23, label %24, label %26

24:                                               ; preds = %7
  %25 = icmp sgt i32 %3, 0
  br label %27

26:                                               ; preds = %32, %7
  ret void

27:                                               ; preds = %24, %32
  %28 = phi i32 [ %17, %24 ], [ %33, %32 ]
  %29 = mul nsw i32 %28, %1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %12, i64 %30
  br i1 %25, label %35, label %32

32:                                               ; preds = %39, %27
  %33 = add nuw nsw i32 %28, %22
  %34 = icmp slt i32 %33, %2
  br i1 %34, label %27, label %26, !llvm.loop !7

35:                                               ; preds = %27, %39
  %36 = phi i32 [ %37, %39 ], [ 0, %27 ]
  %37 = add nuw nsw i32 %36, 1
  %38 = icmp slt i32 %37, %1
  br i1 %38, label %53, label %39

39:                                               ; preds = %53, %35
  %40 = phi i32 [ %36, %35 ], [ %63, %53 ]
  %41 = add nsw i32 %36, %29
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %42
  store i32 %40, i32 addrspace(1)* %43, align 4, !tbaa !9
  %44 = sext i32 %40 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %31, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !13
  %47 = getelementptr inbounds float, float addrspace(1)* %16, i64 %42
  store float %46, float addrspace(1)* %47, align 4, !tbaa !13
  %48 = load float, float addrspace(1)* %45, align 4, !tbaa !13
  %49 = zext i32 %36 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %31, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !13
  store float %51, float addrspace(1)* %45, align 4, !tbaa !13
  store float %48, float addrspace(1)* %50, align 4, !tbaa !13
  %52 = icmp eq i32 %37, %3
  br i1 %52, label %32, label %35, !llvm.loop !15

53:                                               ; preds = %35, %53
  %54 = phi i32 [ %64, %53 ], [ %37, %35 ]
  %55 = phi i32 [ %63, %53 ], [ %36, %35 ]
  %56 = zext i32 %54 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %31, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !13
  %59 = sext i32 %55 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %31, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !13
  %62 = fcmp contract olt float %58, %61
  %63 = select i1 %62, i32 %54, i32 %55
  %64 = add nuw nsw i32 %54, 1
  %65 = icmp slt i32 %64, %1
  br i1 %65, label %53, label %39, !llvm.loop !16
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !11, i64 0}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
