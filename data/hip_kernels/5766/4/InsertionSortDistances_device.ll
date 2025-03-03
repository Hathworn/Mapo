; ModuleID = '../data/hip_kernels/5766/4/main.cu'
source_filename = "../data/hip_kernels/5766/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22InsertionSortDistancesPfPiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %47

15:                                               ; preds = %4
  %16 = mul i32 %13, %2
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  store i32 0, i32 addrspace(1)* %18, align 4, !tbaa !7
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %20 = icmp sgt i32 %2, 1
  br i1 %20, label %21, label %47

21:                                               ; preds = %15, %40
  %22 = phi i32 [ %45, %40 ], [ 1, %15 ]
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %19, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  br label %26

26:                                               ; preds = %21, %33
  %27 = phi i32 [ %22, %21 ], [ %28, %33 ]
  %28 = add nsw i32 %27, -1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %19, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  %32 = fcmp contract ogt float %31, %25
  br i1 %32, label %33, label %40

33:                                               ; preds = %26
  %34 = zext i32 %27 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %19, i64 %34
  store float %31, float addrspace(1)* %35, align 4, !tbaa !11
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %29
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %34
  store i32 %37, i32 addrspace(1)* %38, align 4, !tbaa !7
  %39 = icmp sgt i32 %27, 1
  br i1 %39, label %26, label %40, !llvm.loop !13

40:                                               ; preds = %33, %26
  %41 = phi i32 [ 0, %33 ], [ %27, %26 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %19, i64 %42
  store float %25, float addrspace(1)* %43, align 4, !tbaa !11
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %42
  store i32 %22, i32 addrspace(1)* %44, align 4, !tbaa !7
  %45 = add nuw nsw i32 %22, 1
  %46 = icmp eq i32 %45, %2
  br i1 %46, label %47, label %21, !llvm.loop !15

47:                                               ; preds = %40, %15, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
