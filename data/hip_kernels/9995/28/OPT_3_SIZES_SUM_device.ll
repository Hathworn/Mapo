; ModuleID = '../data/hip_kernels/9995/28/main.cu'
source_filename = "../data/hip_kernels/9995/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15OPT_3_SIZES_SUMPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %25

4:                                                ; preds = %2
  %5 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  %6 = and i32 %1, 7
  %7 = icmp ult i32 %1, 8
  br i1 %7, label %10, label %8

8:                                                ; preds = %4
  %9 = and i32 %1, -8
  br label %26

10:                                               ; preds = %26, %4
  %11 = phi i32 [ %5, %4 ], [ %69, %26 ]
  %12 = phi i32 [ 0, %4 ], [ %65, %26 ]
  %13 = icmp eq i32 %6, 0
  br i1 %13, label %25, label %14

14:                                               ; preds = %10, %14
  %15 = phi i32 [ %22, %14 ], [ %11, %10 ]
  %16 = phi i32 [ %18, %14 ], [ %12, %10 ]
  %17 = phi i32 [ %23, %14 ], [ 0, %10 ]
  %18 = add nuw nsw i32 %16, 1
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4
  %22 = add nsw i32 %21, %15
  store i32 %22, i32 addrspace(1)* %20, align 4, !tbaa !4
  %23 = add i32 %17, 1
  %24 = icmp eq i32 %23, %6
  br i1 %24, label %25, label %14, !llvm.loop !8

25:                                               ; preds = %10, %14, %2
  ret void

26:                                               ; preds = %26, %8
  %27 = phi i32 [ %5, %8 ], [ %69, %26 ]
  %28 = phi i32 [ 0, %8 ], [ %65, %26 ]
  %29 = phi i32 [ 0, %8 ], [ %70, %26 ]
  %30 = or i32 %28, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !4
  %34 = add nsw i32 %33, %27
  store i32 %34, i32 addrspace(1)* %32, align 4, !tbaa !4
  %35 = or i32 %28, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !4
  %39 = add nsw i32 %38, %34
  store i32 %39, i32 addrspace(1)* %37, align 4, !tbaa !4
  %40 = or i32 %28, 3
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !4
  %44 = add nsw i32 %43, %39
  store i32 %44, i32 addrspace(1)* %42, align 4, !tbaa !4
  %45 = or i32 %28, 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !4
  %49 = add nsw i32 %48, %44
  store i32 %49, i32 addrspace(1)* %47, align 4, !tbaa !4
  %50 = or i32 %28, 5
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !4
  %54 = add nsw i32 %53, %49
  store i32 %54, i32 addrspace(1)* %52, align 4, !tbaa !4
  %55 = or i32 %28, 6
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !4
  %59 = add nsw i32 %58, %54
  store i32 %59, i32 addrspace(1)* %57, align 4, !tbaa !4
  %60 = or i32 %28, 7
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !4
  %64 = add nsw i32 %63, %59
  store i32 %64, i32 addrspace(1)* %62, align 4, !tbaa !4
  %65 = add nuw nsw i32 %28, 8
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !4
  %69 = add nsw i32 %68, %64
  store i32 %69, i32 addrspace(1)* %67, align 4, !tbaa !4
  %70 = add i32 %29, 8
  %71 = icmp eq i32 %70, %9
  br i1 %71, label %10, label %26, !llvm.loop !10
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
