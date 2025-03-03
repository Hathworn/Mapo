; ModuleID = '../data/hip_kernels/1513/56/main.cu'
source_filename = "../data/hip_kernels/1513/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z36build_sequence_length_padding_offsetPKiiiPiS1_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %9, label %7

7:                                                ; preds = %33, %5
  %8 = phi i32 [ 0, %5 ], [ %37, %33 ]
  store i32 %8, i32 addrspace(1)* %3, align 4, !tbaa !4
  ret void

9:                                                ; preds = %5, %33
  %10 = phi i32 [ %37, %33 ], [ 0, %5 ]
  %11 = phi i32 [ %38, %33 ], [ 0, %5 ]
  %12 = phi i32 [ %34, %33 ], [ 0, %5 ]
  %13 = phi i32 [ %36, %33 ], [ 0, %5 ]
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %9
  %19 = add i32 %12, %16
  %20 = and i32 %16, 7
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %30, label %22

22:                                               ; preds = %18, %22
  %23 = phi i32 [ %27, %22 ], [ %12, %18 ]
  %24 = phi i32 [ %28, %22 ], [ 0, %18 ]
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %25
  store i32 %13, i32 addrspace(1)* %26, align 4, !tbaa !4
  %27 = add i32 %23, 1
  %28 = add i32 %24, 1
  %29 = icmp eq i32 %28, %20
  br i1 %29, label %30, label %22, !llvm.loop !8

30:                                               ; preds = %22, %18
  %31 = phi i32 [ %12, %18 ], [ %27, %22 ]
  %32 = icmp ult i32 %16, 8
  br i1 %32, label %33, label %40

33:                                               ; preds = %30, %40, %9
  %34 = phi i32 [ %12, %9 ], [ %19, %40 ], [ %19, %30 ]
  %35 = add i32 %13, %2
  %36 = sub i32 %35, %16
  %37 = add nsw i32 %16, %10
  %38 = add nuw nsw i32 %11, 1
  %39 = icmp eq i32 %38, %1
  br i1 %39, label %7, label %9, !llvm.loop !10

40:                                               ; preds = %30, %40
  %41 = phi i32 [ %65, %40 ], [ %31, %30 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  store i32 %13, i32 addrspace(1)* %43, align 4, !tbaa !4
  %44 = add i32 %41, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %45
  store i32 %13, i32 addrspace(1)* %46, align 4, !tbaa !4
  %47 = add i32 %41, 2
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %48
  store i32 %13, i32 addrspace(1)* %49, align 4, !tbaa !4
  %50 = add i32 %41, 3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  store i32 %13, i32 addrspace(1)* %52, align 4, !tbaa !4
  %53 = add i32 %41, 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %54
  store i32 %13, i32 addrspace(1)* %55, align 4, !tbaa !4
  %56 = add i32 %41, 5
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  store i32 %13, i32 addrspace(1)* %58, align 4, !tbaa !4
  %59 = add i32 %41, 6
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  store i32 %13, i32 addrspace(1)* %61, align 4, !tbaa !4
  %62 = add i32 %41, 7
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %63
  store i32 %13, i32 addrspace(1)* %64, align 4, !tbaa !4
  %65 = add i32 %41, 8
  %66 = icmp eq i32 %65, %19
  br i1 %66, label %33, label %40, !llvm.loop !12
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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
