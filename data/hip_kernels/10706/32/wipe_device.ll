; ModuleID = '../data/hip_kernels/10706/32/main.cu'
source_filename = "../data/hip_kernels/10706/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z4wipePii(i32 addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp sgt i32 %1, 31
  br i1 %4, label %5, label %25

5:                                                ; preds = %2
  %6 = lshr i32 %1, 5
  %7 = add nsw i32 %6, -1
  %8 = and i32 %6, 7
  %9 = icmp ult i32 %7, 7
  br i1 %9, label %12, label %10

10:                                               ; preds = %5
  %11 = and i32 %6, 134217720
  br label %26

12:                                               ; preds = %26, %5
  %13 = phi i32 [ 0, %5 ], [ %68, %26 ]
  %14 = icmp eq i32 %8, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %12, %15
  %16 = phi i32 [ %22, %15 ], [ %13, %12 ]
  %17 = phi i32 [ %23, %15 ], [ 0, %12 ]
  %18 = shl i32 %16, 5
  %19 = add nuw nsw i32 %18, %3
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  store i32 -1, i32 addrspace(1)* %21, align 4, !tbaa !5
  %22 = add nuw nsw i32 %16, 1
  %23 = add i32 %17, 1
  %24 = icmp eq i32 %23, %8
  br i1 %24, label %25, label %15, !llvm.loop !9

25:                                               ; preds = %12, %15, %2
  ret void

26:                                               ; preds = %26, %10
  %27 = phi i32 [ 0, %10 ], [ %68, %26 ]
  %28 = phi i32 [ 0, %10 ], [ %69, %26 ]
  %29 = shl i32 %27, 5
  %30 = add nuw nsw i32 %29, %3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  store i32 -1, i32 addrspace(1)* %32, align 4, !tbaa !5
  %33 = shl i32 %27, 5
  %34 = or i32 %33, 32
  %35 = add nuw nsw i32 %34, %3
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  store i32 -1, i32 addrspace(1)* %37, align 4, !tbaa !5
  %38 = shl i32 %27, 5
  %39 = or i32 %38, 64
  %40 = add nuw nsw i32 %39, %3
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  store i32 -1, i32 addrspace(1)* %42, align 4, !tbaa !5
  %43 = shl i32 %27, 5
  %44 = or i32 %43, 96
  %45 = add nuw nsw i32 %44, %3
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  store i32 -1, i32 addrspace(1)* %47, align 4, !tbaa !5
  %48 = shl i32 %27, 5
  %49 = or i32 %48, 128
  %50 = add nuw nsw i32 %49, %3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  store i32 -1, i32 addrspace(1)* %52, align 4, !tbaa !5
  %53 = shl i32 %27, 5
  %54 = or i32 %53, 160
  %55 = add nuw nsw i32 %54, %3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  store i32 -1, i32 addrspace(1)* %57, align 4, !tbaa !5
  %58 = shl i32 %27, 5
  %59 = or i32 %58, 192
  %60 = add nuw nsw i32 %59, %3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 -1, i32 addrspace(1)* %62, align 4, !tbaa !5
  %63 = shl i32 %27, 5
  %64 = or i32 %63, 224
  %65 = add nuw nsw i32 %64, %3
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  store i32 -1, i32 addrspace(1)* %67, align 4, !tbaa !5
  %68 = add nuw nsw i32 %27, 8
  %69 = add i32 %28, 8
  %70 = icmp eq i32 %69, %11
  br i1 %70, label %12, label %26, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
