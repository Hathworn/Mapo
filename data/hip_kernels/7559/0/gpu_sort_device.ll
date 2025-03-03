; ModuleID = '../data/hip_kernels/7559/0/main.cu'
source_filename = "../data/hip_kernels/7559/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8gpu_sortPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = mul i32 %12, %2
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %51

15:                                               ; preds = %3
  %16 = add nsw i32 %13, %2
  %17 = tail call i32 @llvm.smin.i32(i32 %16, i32 %1)
  %18 = add nsw i32 %13, 1
  %19 = icmp slt i32 %18, %17
  br i1 %19, label %20, label %51

20:                                               ; preds = %15
  %21 = add nsw i32 %13, -1
  br label %22

22:                                               ; preds = %48, %20
  %23 = phi i32 [ %18, %20 ], [ %49, %48 ]
  %24 = phi i32 [ %13, %20 ], [ %23, %48 ]
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7
  %28 = icmp slt i32 %24, %21
  br i1 %28, label %48, label %29

29:                                               ; preds = %22, %42
  %30 = phi i32 [ %46, %42 ], [ %24, %22 ]
  %31 = icmp eq i32 %30, %21
  br i1 %31, label %37, label %32

32:                                               ; preds = %29
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %36 = icmp sgt i32 %27, %35
  br i1 %36, label %37, label %42

37:                                               ; preds = %32, %29
  %38 = phi i32 [ %30, %32 ], [ %21, %29 ]
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  store i32 %27, i32 addrspace(1)* %41, align 4, !tbaa !7
  br label %48

42:                                               ; preds = %32
  %43 = add nsw i32 %30, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 %35, i32 addrspace(1)* %45, align 4, !tbaa !7
  %46 = add nsw i32 %30, -1
  %47 = icmp slt i32 %30, %13
  br i1 %47, label %48, label %29, !llvm.loop !11

48:                                               ; preds = %42, %37, %22
  %49 = add nsw i32 %23, 1
  %50 = icmp slt i32 %49, %17
  br i1 %50, label %22, label %51, !llvm.loop !13

51:                                               ; preds = %48, %15, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
