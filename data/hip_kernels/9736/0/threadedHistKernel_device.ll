; ModuleID = '../data/hip_kernels/9736/0/main.cu'
source_filename = "../data/hip_kernels/9736/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18threadedHistKernelPiS_iii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = mul nsw i32 %6, %2
  %9 = add nsw i32 %8, %7
  %10 = icmp sgt i32 %4, 0
  br i1 %10, label %11, label %36

11:                                               ; preds = %5
  %12 = mul nsw i32 %9, %4
  %13 = mul nsw i32 %9, %3
  %14 = and i32 %4, 7
  %15 = icmp ult i32 %4, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %11
  %17 = and i32 %4, -8
  br label %37

18:                                               ; preds = %37, %11
  %19 = phi i32 [ 0, %11 ], [ %119, %37 ]
  %20 = icmp eq i32 %14, 0
  br i1 %20, label %36, label %21

21:                                               ; preds = %18, %21
  %22 = phi i32 [ %33, %21 ], [ %19, %18 ]
  %23 = phi i32 [ %34, %21 ], [ 0, %18 ]
  %24 = add nsw i32 %22, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %28 = add nsw i32 %27, %13
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !5
  %32 = add nsw i32 %31, 1
  store i32 %32, i32 addrspace(1)* %30, align 4, !tbaa !5
  %33 = add nuw nsw i32 %22, 1
  %34 = add i32 %23, 1
  %35 = icmp eq i32 %34, %14
  br i1 %35, label %36, label %21, !llvm.loop !9

36:                                               ; preds = %18, %21, %5
  ret void

37:                                               ; preds = %37, %16
  %38 = phi i32 [ 0, %16 ], [ %119, %37 ]
  %39 = phi i32 [ 0, %16 ], [ %120, %37 ]
  %40 = add nsw i32 %38, %12
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5
  %44 = add nsw i32 %43, %13
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5
  %48 = add nsw i32 %47, 1
  store i32 %48, i32 addrspace(1)* %46, align 4, !tbaa !5
  %49 = or i32 %38, 1
  %50 = add nsw i32 %49, %12
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !5
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5
  %58 = add nsw i32 %57, 1
  store i32 %58, i32 addrspace(1)* %56, align 4, !tbaa !5
  %59 = or i32 %38, 2
  %60 = add nsw i32 %59, %12
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %64 = add nsw i32 %63, %13
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5
  %68 = add nsw i32 %67, 1
  store i32 %68, i32 addrspace(1)* %66, align 4, !tbaa !5
  %69 = or i32 %38, 3
  %70 = add nsw i32 %69, %12
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5
  %74 = add nsw i32 %73, %13
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %78 = add nsw i32 %77, 1
  store i32 %78, i32 addrspace(1)* %76, align 4, !tbaa !5
  %79 = or i32 %38, 4
  %80 = add nsw i32 %79, %12
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !5
  %84 = add nsw i32 %83, %13
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5
  %88 = add nsw i32 %87, 1
  store i32 %88, i32 addrspace(1)* %86, align 4, !tbaa !5
  %89 = or i32 %38, 5
  %90 = add nsw i32 %89, %12
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5
  %94 = add nsw i32 %93, %13
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !5
  %98 = add nsw i32 %97, 1
  store i32 %98, i32 addrspace(1)* %96, align 4, !tbaa !5
  %99 = or i32 %38, 6
  %100 = add nsw i32 %99, %12
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !5
  %104 = add nsw i32 %103, %13
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !5
  %108 = add nsw i32 %107, 1
  store i32 %108, i32 addrspace(1)* %106, align 4, !tbaa !5
  %109 = or i32 %38, 7
  %110 = add nsw i32 %109, %12
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !5
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5
  %118 = add nsw i32 %117, 1
  store i32 %118, i32 addrspace(1)* %116, align 4, !tbaa !5
  %119 = add nuw nsw i32 %38, 8
  %120 = add i32 %39, 8
  %121 = icmp eq i32 %120, %17
  br i1 %121, label %18, label %37, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
