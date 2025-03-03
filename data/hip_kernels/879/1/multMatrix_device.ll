; ModuleID = '../data/hip_kernels/879/1/main.cu'
source_filename = "../data/hip_kernels/879/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10multMatrixPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = mul nsw i32 %8, %5
  %10 = add nsw i32 %9, %7
  %11 = mul nsw i32 %5, %3
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %99

13:                                               ; preds = %6
  %14 = sext i32 %10 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  store i32 0, i32 addrspace(1)* %15, align 4, !tbaa !5
  %16 = icmp sgt i32 %4, 0
  br i1 %16, label %17, label %99

17:                                               ; preds = %13
  %18 = mul nsw i32 %8, %4
  %19 = and i32 %4, 3
  %20 = icmp ult i32 %4, 4
  br i1 %20, label %77, label %21

21:                                               ; preds = %17
  %22 = and i32 %4, -4
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %73, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %74, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %75, %23 ]
  %27 = add nsw i32 %25, %18
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5
  %31 = mul nsw i32 %25, %5
  %32 = add nsw i32 %31, %7
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5
  %36 = mul nsw i32 %35, %30
  %37 = add nsw i32 %24, %36
  store i32 %37, i32 addrspace(1)* %15, align 4, !tbaa !5
  %38 = or i32 %25, 1
  %39 = add nsw i32 %38, %18
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = mul nsw i32 %38, %5
  %44 = add nsw i32 %43, %7
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5
  %48 = mul nsw i32 %47, %42
  %49 = add nsw i32 %37, %48
  store i32 %49, i32 addrspace(1)* %15, align 4, !tbaa !5
  %50 = or i32 %25, 2
  %51 = add nsw i32 %50, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !5
  %55 = mul nsw i32 %50, %5
  %56 = add nsw i32 %55, %7
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !5
  %60 = mul nsw i32 %59, %54
  %61 = add nsw i32 %49, %60
  store i32 %61, i32 addrspace(1)* %15, align 4, !tbaa !5
  %62 = or i32 %25, 3
  %63 = add nsw i32 %62, %18
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !5
  %67 = mul nsw i32 %62, %5
  %68 = add nsw i32 %67, %7
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5
  %72 = mul nsw i32 %71, %66
  %73 = add nsw i32 %61, %72
  store i32 %73, i32 addrspace(1)* %15, align 4, !tbaa !5
  %74 = add nuw nsw i32 %25, 4
  %75 = add i32 %26, 4
  %76 = icmp eq i32 %75, %22
  br i1 %76, label %77, label %23, !llvm.loop !9

77:                                               ; preds = %23, %17
  %78 = phi i32 [ 0, %17 ], [ %73, %23 ]
  %79 = phi i32 [ 0, %17 ], [ %74, %23 ]
  %80 = icmp eq i32 %19, 0
  br i1 %80, label %99, label %81

81:                                               ; preds = %77, %81
  %82 = phi i32 [ %95, %81 ], [ %78, %77 ]
  %83 = phi i32 [ %96, %81 ], [ %79, %77 ]
  %84 = phi i32 [ %97, %81 ], [ 0, %77 ]
  %85 = add nsw i32 %83, %18
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !5
  %89 = mul nsw i32 %83, %5
  %90 = add nsw i32 %89, %7
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5
  %94 = mul nsw i32 %93, %88
  %95 = add nsw i32 %82, %94
  store i32 %95, i32 addrspace(1)* %15, align 4, !tbaa !5
  %96 = add nuw nsw i32 %83, 1
  %97 = add i32 %84, 1
  %98 = icmp eq i32 %97, %19
  br i1 %98, label %99, label %81, !llvm.loop !11

99:                                               ; preds = %77, %81, %13, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
