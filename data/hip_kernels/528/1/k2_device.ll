; ModuleID = '../data/hip_kernels/528/1/main.cu'
source_filename = "../data/hip_kernels/528/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2k2iPbPiS_(i32 %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %6, label %34

6:                                                ; preds = %4
  %7 = and i32 %0, 3
  %8 = icmp ult i32 %0, 4
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i32 %0, -4
  br label %36

11:                                               ; preds = %85, %6
  %12 = phi i32 [ undef, %6 ], [ %86, %85 ]
  %13 = phi i32 [ 0, %6 ], [ %87, %85 ]
  %14 = phi i32 [ 0, %6 ], [ %86, %85 ]
  %15 = icmp eq i32 %7, 0
  br i1 %15, label %34, label %16

16:                                               ; preds = %11, %29
  %17 = phi i32 [ %31, %29 ], [ %13, %11 ]
  %18 = phi i32 [ %30, %29 ], [ %14, %11 ]
  %19 = phi i32 [ %32, %29 ], [ 0, %11 ]
  %20 = zext i32 %17 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !4, !range !8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %29, label %24

24:                                               ; preds = %16
  store i8 0, i8 addrspace(1)* %21, align 1, !tbaa !4
  %25 = add nsw i32 %18, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  store i32 %17, i32 addrspace(1)* %27, align 4, !tbaa !9
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %20
  store i8 1, i8 addrspace(1)* %28, align 1, !tbaa !4
  br label %29

29:                                               ; preds = %24, %16
  %30 = phi i32 [ %25, %24 ], [ %18, %16 ]
  %31 = add nuw nsw i32 %17, 1
  %32 = add i32 %19, 1
  %33 = icmp eq i32 %32, %7
  br i1 %33, label %34, label %16, !llvm.loop !11

34:                                               ; preds = %11, %29, %4
  %35 = phi i32 [ 0, %4 ], [ %12, %11 ], [ %30, %29 ]
  store i32 %35, i32 addrspace(1)* %2, align 4, !tbaa !9
  ret void

36:                                               ; preds = %85, %9
  %37 = phi i32 [ 0, %9 ], [ %87, %85 ]
  %38 = phi i32 [ 0, %9 ], [ %86, %85 ]
  %39 = phi i32 [ 0, %9 ], [ %88, %85 ]
  %40 = zext i32 %37 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !4, !range !8
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %49, label %44

44:                                               ; preds = %36
  store i8 0, i8 addrspace(1)* %41, align 1, !tbaa !4
  %45 = add nsw i32 %38, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  store i32 %37, i32 addrspace(1)* %47, align 4, !tbaa !9
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  store i8 1, i8 addrspace(1)* %48, align 1, !tbaa !4
  br label %49

49:                                               ; preds = %36, %44
  %50 = phi i32 [ %45, %44 ], [ %38, %36 ]
  %51 = or i32 %37, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !4, !range !8
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %61, label %56

56:                                               ; preds = %49
  store i8 0, i8 addrspace(1)* %53, align 1, !tbaa !4
  %57 = add nsw i32 %50, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  store i32 %51, i32 addrspace(1)* %59, align 4, !tbaa !9
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %52
  store i8 1, i8 addrspace(1)* %60, align 1, !tbaa !4
  br label %61

61:                                               ; preds = %56, %49
  %62 = phi i32 [ %57, %56 ], [ %50, %49 ]
  %63 = or i32 %37, 2
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !4, !range !8
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %73, label %68

68:                                               ; preds = %61
  store i8 0, i8 addrspace(1)* %65, align 1, !tbaa !4
  %69 = add nsw i32 %62, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %70
  store i32 %63, i32 addrspace(1)* %71, align 4, !tbaa !9
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %64
  store i8 1, i8 addrspace(1)* %72, align 1, !tbaa !4
  br label %73

73:                                               ; preds = %68, %61
  %74 = phi i32 [ %69, %68 ], [ %62, %61 ]
  %75 = or i32 %37, 3
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !4, !range !8
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %85, label %80

80:                                               ; preds = %73
  store i8 0, i8 addrspace(1)* %77, align 1, !tbaa !4
  %81 = add nsw i32 %74, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %82
  store i32 %75, i32 addrspace(1)* %83, align 4, !tbaa !9
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %76
  store i8 1, i8 addrspace(1)* %84, align 1, !tbaa !4
  br label %85

85:                                               ; preds = %80, %73
  %86 = phi i32 [ %81, %80 ], [ %74, %73 ]
  %87 = add nuw nsw i32 %37, 4
  %88 = add i32 %39, 4
  %89 = icmp eq i32 %88, %10
  br i1 %89, label %11, label %36, !llvm.loop !13
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
!5 = !{!"bool", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i8 0, i8 2}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
