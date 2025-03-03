; ModuleID = '../data/hip_kernels/1206/0/main.cu'
source_filename = "../data/hip_kernels/1206/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z7kernel1iPi(i32 %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %20

4:                                                ; preds = %2
  %5 = and i32 %0, 7
  %6 = icmp ult i32 %0, 8
  br i1 %6, label %9, label %7

7:                                                ; preds = %4
  %8 = and i32 %0, -8
  br label %21

9:                                                ; preds = %21, %4
  %10 = phi i32 [ 0, %4 ], [ %47, %21 ]
  %11 = icmp eq i32 %5, 0
  br i1 %11, label %20, label %12

12:                                               ; preds = %9, %12
  %13 = phi i32 [ %17, %12 ], [ %10, %9 ]
  %14 = phi i32 [ %18, %12 ], [ 0, %9 ]
  %15 = zext i32 %13 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  store i32 0, i32 addrspace(1)* %16, align 4, !tbaa !4
  %17 = add nuw nsw i32 %13, 1
  %18 = add i32 %14, 1
  %19 = icmp eq i32 %18, %5
  br i1 %19, label %20, label %12, !llvm.loop !8

20:                                               ; preds = %9, %12, %2
  ret void

21:                                               ; preds = %21, %7
  %22 = phi i32 [ 0, %7 ], [ %47, %21 ]
  %23 = phi i32 [ 0, %7 ], [ %48, %21 ]
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  store i32 0, i32 addrspace(1)* %25, align 4, !tbaa !4
  %26 = or i32 %22, 1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  store i32 0, i32 addrspace(1)* %28, align 4, !tbaa !4
  %29 = or i32 %22, 2
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  store i32 0, i32 addrspace(1)* %31, align 4, !tbaa !4
  %32 = or i32 %22, 3
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  store i32 0, i32 addrspace(1)* %34, align 4, !tbaa !4
  %35 = or i32 %22, 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  store i32 0, i32 addrspace(1)* %37, align 4, !tbaa !4
  %38 = or i32 %22, 5
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  store i32 0, i32 addrspace(1)* %40, align 4, !tbaa !4
  %41 = or i32 %22, 6
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  store i32 0, i32 addrspace(1)* %43, align 4, !tbaa !4
  %44 = or i32 %22, 7
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  store i32 0, i32 addrspace(1)* %46, align 4, !tbaa !4
  %47 = add nuw nsw i32 %22, 8
  %48 = add i32 %23, 8
  %49 = icmp eq i32 %48, %8
  br i1 %49, label %9, label %21, !llvm.loop !10
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

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
