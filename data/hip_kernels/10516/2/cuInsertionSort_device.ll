; ModuleID = '../data/hip_kernels/10516/2/main.cu'
source_filename = "../data/hip_kernels/10516/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cuInsertionSortPfPiiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %2
  br i1 %15, label %16, label %131

16:                                               ; preds = %5
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %20 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 1, i32 addrspace(1)* %19, align 4, !tbaa !11
  %21 = icmp sgt i32 %4, 1
  br i1 %21, label %22, label %74

22:                                               ; preds = %16, %70
  %23 = phi i32 [ %71, %70 ], [ 1, %16 ]
  %24 = phi float [ %72, %70 ], [ %20, %16 ]
  %25 = mul nsw i32 %23, %2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %18, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = fcmp contract olt float %28, %24
  br i1 %29, label %30, label %67

30:                                               ; preds = %22
  %31 = add nsw i32 %23, -1
  %32 = icmp ugt i32 %23, 1
  br i1 %32, label %33, label %43

33:                                               ; preds = %30, %40
  %34 = phi i32 [ %41, %40 ], [ 0, %30 ]
  %35 = mul nsw i32 %34, %2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %18, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = fcmp contract ogt float %38, %28
  br i1 %39, label %43, label %40

40:                                               ; preds = %33
  %41 = add nuw nsw i32 %34, 1
  %42 = icmp ult i32 %41, %31
  br i1 %42, label %33, label %43, !llvm.loop !13

43:                                               ; preds = %40, %33, %30
  %44 = phi i32 [ %31, %30 ], [ %31, %40 ], [ %34, %33 ]
  %45 = icmp ugt i32 %23, %44
  br i1 %45, label %46, label %60

46:                                               ; preds = %43, %46
  %47 = phi i32 [ %48, %46 ], [ %23, %43 ]
  %48 = add nsw i32 %47, -1
  %49 = mul nsw i32 %48, %2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %18, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = mul nsw i32 %47, %2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %18, i64 %54
  store float %52, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %50
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !11
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %54
  store i32 %57, i32 addrspace(1)* %58, align 4, !tbaa !11
  %59 = icmp sgt i32 %48, %44
  br i1 %59, label %46, label %60, !llvm.loop !15

60:                                               ; preds = %46, %43
  %61 = mul nsw i32 %44, %2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %18, i64 %62
  store float %28, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nuw nsw i32 %23, 1
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %62
  store i32 %64, i32 addrspace(1)* %65, align 4, !tbaa !11
  %66 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  br label %70

67:                                               ; preds = %22
  %68 = add nuw nsw i32 %23, 1
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %26
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !11
  br label %70

70:                                               ; preds = %67, %60
  %71 = phi i32 [ %68, %67 ], [ %64, %60 ]
  %72 = phi float [ %28, %67 ], [ %66, %60 ]
  %73 = icmp eq i32 %71, %4
  br i1 %73, label %74, label %22, !llvm.loop !16

74:                                               ; preds = %70, %16
  %75 = phi float [ %20, %16 ], [ %72, %70 ]
  %76 = add i32 %4, -1
  %77 = icmp slt i32 %4, %3
  br i1 %77, label %78, label %131

78:                                               ; preds = %74
  %79 = mul nsw i32 %76, %2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %18, i64 %80
  br label %82

82:                                               ; preds = %78, %127
  %83 = phi i32 [ %4, %78 ], [ %128, %127 ]
  %84 = phi float [ %75, %78 ], [ %129, %127 ]
  %85 = mul nsw i32 %83, %2
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %18, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fcmp contract olt float %88, %84
  br i1 %89, label %92, label %90

90:                                               ; preds = %82
  %91 = add nsw i32 %83, 1
  br label %127

92:                                               ; preds = %82
  br i1 %21, label %93, label %103

93:                                               ; preds = %92, %100
  %94 = phi i32 [ %101, %100 ], [ 0, %92 ]
  %95 = mul nsw i32 %94, %2
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %18, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fcmp contract ogt float %98, %88
  br i1 %99, label %103, label %100

100:                                              ; preds = %93
  %101 = add nuw nsw i32 %94, 1
  %102 = icmp eq i32 %101, %76
  br i1 %102, label %103, label %93, !llvm.loop !17

103:                                              ; preds = %100, %93, %92
  %104 = phi i32 [ %76, %92 ], [ %76, %100 ], [ %94, %93 ]
  %105 = icmp sgt i32 %76, %104
  br i1 %105, label %106, label %120

106:                                              ; preds = %103, %106
  %107 = phi i32 [ %108, %106 ], [ %76, %103 ]
  %108 = add nsw i32 %107, -1
  %109 = mul nsw i32 %108, %2
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %18, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = mul nsw i32 %107, %2
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %18, i64 %114
  store float %112, float addrspace(1)* %115, align 4, !tbaa !7
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %110
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !11
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %114
  store i32 %117, i32 addrspace(1)* %118, align 4, !tbaa !11
  %119 = icmp sgt i32 %108, %104
  br i1 %119, label %106, label %120, !llvm.loop !18

120:                                              ; preds = %106, %103
  %121 = mul nsw i32 %104, %2
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %18, i64 %122
  store float %88, float addrspace(1)* %123, align 4, !tbaa !7
  %124 = add nsw i32 %83, 1
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %122
  store i32 %124, i32 addrspace(1)* %125, align 4, !tbaa !11
  %126 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  br label %127

127:                                              ; preds = %90, %120
  %128 = phi i32 [ %91, %90 ], [ %124, %120 ]
  %129 = phi float [ %84, %90 ], [ %126, %120 ]
  %130 = icmp slt i32 %128, %3
  br i1 %130, label %82, label %131, !llvm.loop !19

131:                                              ; preds = %127, %74, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
