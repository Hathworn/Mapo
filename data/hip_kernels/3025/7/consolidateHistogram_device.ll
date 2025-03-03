; ModuleID = '../data/hip_kernels/3025/7/main.cu'
source_filename = "../data/hip_kernels/3025/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20consolidateHistogramPmS_j(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %2, 0
  br i1 %5, label %31, label %6

6:                                                ; preds = %3
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %7
  %9 = load i64, i64 addrspace(1)* %8, align 8, !tbaa !5
  %10 = and i32 %2, 7
  %11 = icmp ult i32 %2, 8
  br i1 %11, label %14, label %12

12:                                               ; preds = %6
  %13 = and i32 %2, -8
  br label %32

14:                                               ; preds = %32, %6
  %15 = phi i64 [ %9, %6 ], [ %90, %32 ]
  %16 = phi i32 [ 0, %6 ], [ %91, %32 ]
  %17 = icmp eq i32 %10, 0
  br i1 %17, label %31, label %18

18:                                               ; preds = %14, %18
  %19 = phi i64 [ %27, %18 ], [ %15, %14 ]
  %20 = phi i32 [ %28, %18 ], [ %16, %14 ]
  %21 = phi i32 [ %29, %18 ], [ 0, %14 ]
  %22 = shl i32 %20, 8
  %23 = add i32 %22, %4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %24
  %26 = load i64, i64 addrspace(1)* %25, align 8, !tbaa !5
  %27 = add i64 %19, %26
  store i64 %27, i64 addrspace(1)* %8, align 8, !tbaa !5
  %28 = add nuw i32 %20, 1
  %29 = add i32 %21, 1
  %30 = icmp eq i32 %29, %10
  br i1 %30, label %31, label %18, !llvm.loop !9

31:                                               ; preds = %14, %18, %3
  ret void

32:                                               ; preds = %32, %12
  %33 = phi i64 [ %9, %12 ], [ %90, %32 ]
  %34 = phi i32 [ 0, %12 ], [ %91, %32 ]
  %35 = phi i32 [ 0, %12 ], [ %92, %32 ]
  %36 = shl i32 %34, 8
  %37 = or i32 %36, %4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %38
  %40 = load i64, i64 addrspace(1)* %39, align 8, !tbaa !5
  %41 = add i64 %33, %40
  store i64 %41, i64 addrspace(1)* %8, align 8, !tbaa !5
  %42 = shl i32 %34, 8
  %43 = or i32 %42, 256
  %44 = add nuw nsw i32 %43, %4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %45
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !5
  %48 = add i64 %41, %47
  store i64 %48, i64 addrspace(1)* %8, align 8, !tbaa !5
  %49 = shl i32 %34, 8
  %50 = or i32 %49, 512
  %51 = add nuw nsw i32 %50, %4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %52
  %54 = load i64, i64 addrspace(1)* %53, align 8, !tbaa !5
  %55 = add i64 %48, %54
  store i64 %55, i64 addrspace(1)* %8, align 8, !tbaa !5
  %56 = shl i32 %34, 8
  %57 = or i32 %56, 768
  %58 = add nuw nsw i32 %57, %4
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %59
  %61 = load i64, i64 addrspace(1)* %60, align 8, !tbaa !5
  %62 = add i64 %55, %61
  store i64 %62, i64 addrspace(1)* %8, align 8, !tbaa !5
  %63 = shl i32 %34, 8
  %64 = or i32 %63, %4
  %65 = or i32 %64, 1024
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %66
  %68 = load i64, i64 addrspace(1)* %67, align 8, !tbaa !5
  %69 = add i64 %62, %68
  store i64 %69, i64 addrspace(1)* %8, align 8, !tbaa !5
  %70 = shl i32 %34, 8
  %71 = or i32 %70, 1280
  %72 = add i32 %71, %4
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %73
  %75 = load i64, i64 addrspace(1)* %74, align 8, !tbaa !5
  %76 = add i64 %69, %75
  store i64 %76, i64 addrspace(1)* %8, align 8, !tbaa !5
  %77 = shl i32 %34, 8
  %78 = or i32 %77, 1536
  %79 = add i32 %78, %4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %80
  %82 = load i64, i64 addrspace(1)* %81, align 8, !tbaa !5
  %83 = add i64 %76, %82
  store i64 %83, i64 addrspace(1)* %8, align 8, !tbaa !5
  %84 = shl i32 %34, 8
  %85 = or i32 %84, 1792
  %86 = add i32 %85, %4
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %87
  %89 = load i64, i64 addrspace(1)* %88, align 8, !tbaa !5
  %90 = add i64 %83, %89
  store i64 %90, i64 addrspace(1)* %8, align 8, !tbaa !5
  %91 = add nuw i32 %34, 8
  %92 = add i32 %35, 8
  %93 = icmp eq i32 %92, %13
  br i1 %93, label %14, label %32, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
