; ModuleID = '../data/hip_kernels/12941/6/main.cu'
source_filename = "../data/hip_kernels/12941/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11seq_compactPhtPj(i8 addrspace(1)* nocapture %0, i16 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = icmp eq i16 %1, 0
  br i1 %4, label %7, label %9

5:                                                ; preds = %54
  %6 = zext i16 %56 to i32
  br label %7

7:                                                ; preds = %5, %3
  %8 = phi i32 [ 0, %3 ], [ %6, %5 ]
  store i32 %8, i32 addrspace(1)* %2, align 4, !tbaa !4
  ret void

9:                                                ; preds = %3, %54
  %10 = phi i16 [ %56, %54 ], [ 0, %3 ]
  %11 = phi i16 [ %57, %54 ], [ 0, %3 ]
  %12 = shl i16 %11, 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %13
  %15 = load i8, i8 addrspace(1)* %14, align 1, !tbaa !8
  %16 = zext i16 %10 to i64
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %16
  %18 = zext i8 %15 to i32
  %19 = add nuw nsw i32 %18, 1
  %20 = zext i32 %19 to i64
  %21 = icmp ugt i8 %15, 2
  br i1 %21, label %22, label %40

22:                                               ; preds = %9, %22
  %23 = phi i8 addrspace(1)* [ %37, %22 ], [ %14, %9 ]
  %24 = phi i8 addrspace(1)* [ %38, %22 ], [ %17, %9 ]
  %25 = phi i64 [ %36, %22 ], [ %20, %9 ]
  %26 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !8
  store i8 %26, i8 addrspace(1)* %24, align 1, !tbaa !8
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %23, i64 1
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !8
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 1
  store i8 %28, i8 addrspace(1)* %29, align 1, !tbaa !8
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %23, i64 2
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !8
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 2
  store i8 %31, i8 addrspace(1)* %32, align 1, !tbaa !8
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %23, i64 3
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !8
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 3
  store i8 %34, i8 addrspace(1)* %35, align 1, !tbaa !8
  %36 = add i64 %25, -4
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %23, i64 4
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 4
  %39 = icmp ugt i64 %36, 3
  br i1 %39, label %22, label %40, !llvm.loop !9

40:                                               ; preds = %22, %9
  %41 = phi i64 [ %20, %9 ], [ %36, %22 ]
  %42 = phi i8 addrspace(1)* [ %17, %9 ], [ %38, %22 ]
  %43 = phi i8 addrspace(1)* [ %14, %9 ], [ %37, %22 ]
  switch i64 %41, label %54 [
    i64 3, label %44
    i64 2, label %48
    i64 1, label %52
  ]

44:                                               ; preds = %40
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 2
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !8
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 2
  store i8 %46, i8 addrspace(1)* %47, align 1, !tbaa !8
  br label %48

48:                                               ; preds = %44, %40
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 1
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !8
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 1
  store i8 %50, i8 addrspace(1)* %51, align 1, !tbaa !8
  br label %52

52:                                               ; preds = %48, %40
  %53 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !8
  store i8 %53, i8 addrspace(1)* %42, align 1, !tbaa !8
  br label %54

54:                                               ; preds = %40, %52
  %55 = trunc i32 %19 to i16
  %56 = add i16 %10, %55
  %57 = add nuw i16 %11, 1
  %58 = icmp ult i16 %57, %1
  br i1 %58, label %9, label %5, !llvm.loop !11
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
