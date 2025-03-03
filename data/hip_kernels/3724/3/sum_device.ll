; ModuleID = '../data/hip_kernels/3724/3/main.cu'
source_filename = "../data/hip_kernels/3724/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3sumPlS_S_ii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %13, %4
  %15 = add i32 %14, %12
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %43

17:                                               ; preds = %5
  %18 = add nsw i32 %15, 1
  %19 = icmp slt i32 %18, %3
  br i1 %19, label %20, label %43

20:                                               ; preds = %17
  %21 = sext i32 %15 to i64
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %21
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %21
  %24 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %21
  br label %25

25:                                               ; preds = %20, %40
  %26 = phi i32 [ %18, %20 ], [ %41, %40 ]
  %27 = load i64, i64 addrspace(1)* %22, align 8, !tbaa !7
  %28 = sext i32 %26 to i64
  %29 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %28
  %30 = load i64, i64 addrspace(1)* %29, align 8, !tbaa !7
  %31 = icmp eq i64 %27, %30
  br i1 %31, label %32, label %40

32:                                               ; preds = %25
  %33 = load i64, i64 addrspace(1)* %23, align 8, !tbaa !7
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %28
  %35 = load i64, i64 addrspace(1)* %34, align 8, !tbaa !7
  %36 = icmp eq i64 %33, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %32
  %38 = load i64, i64 addrspace(1)* %24, align 8, !tbaa !7
  %39 = add nsw i64 %38, 1
  store i64 %39, i64 addrspace(1)* %24, align 8, !tbaa !7
  br label %40

40:                                               ; preds = %25, %32, %37
  %41 = add nsw i32 %26, 1
  %42 = icmp slt i32 %41, %3
  br i1 %42, label %25, label %43, !llvm.loop !11

43:                                               ; preds = %40, %17, %5
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
