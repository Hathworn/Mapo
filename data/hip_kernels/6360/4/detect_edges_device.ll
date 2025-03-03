; ModuleID = '../data/hip_kernels/6360/4/main.cu'
source_filename = "../data/hip_kernels/6360/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12detect_edgesPhS_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %52
  %4 = phi i32 [ 0, %2 ], [ %53, %52 ]
  %5 = trunc i32 %4 to i16
  %6 = urem i16 %5, 100
  %7 = icmp eq i16 %6, 0
  %8 = icmp ult i32 %4, 100
  %9 = or i1 %8, %7
  %10 = icmp eq i16 %6, 99
  %11 = or i1 %10, %9
  %12 = add nsw i32 %4, -7100
  %13 = icmp ult i32 %12, 100
  %14 = select i1 %11, i1 true, i1 %13
  br i1 %14, label %15, label %19

15:                                               ; preds = %3
  %16 = zext i32 %4 to i64
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %16
  store i8 0, i8 addrspace(1)* %17, align 1, !tbaa !4
  %18 = add nuw nsw i32 %4, 1
  br label %52

19:                                               ; preds = %3
  %20 = add nuw nsw i32 %4, 100
  %21 = add nsw i32 %4, -1
  %22 = add nuw nsw i32 %4, 1
  %23 = add nsw i32 %4, -100
  %24 = zext i32 %4 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !4
  %27 = zext i8 %26 to i32
  %28 = shl nuw nsw i32 %27, 2
  %29 = zext i32 %20 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !4
  %32 = zext i8 %31 to i32
  %33 = sext i32 %21 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !4
  %36 = zext i8 %35 to i32
  %37 = add nuw nsw i32 %36, %32
  %38 = zext i32 %22 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !4
  %41 = zext i8 %40 to i32
  %42 = add nuw nsw i32 %37, %41
  %43 = sext i32 %23 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !4
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %42, %46
  %48 = icmp ugt i32 %28, %47
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %24
  br i1 %48, label %50, label %51

50:                                               ; preds = %19
  store i8 -1, i8 addrspace(1)* %49, align 1, !tbaa !4
  br label %52

51:                                               ; preds = %19
  store i8 0, i8 addrspace(1)* %49, align 1, !tbaa !4
  br label %52

52:                                               ; preds = %50, %51, %15
  %53 = phi i32 [ %22, %50 ], [ %22, %51 ], [ %18, %15 ]
  %54 = icmp eq i32 %53, 7200
  br i1 %54, label %55, label %3, !llvm.loop !7

55:                                               ; preds = %52
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
