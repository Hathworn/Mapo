; ModuleID = '../data/hip_kernels/151/14/main.cu'
source_filename = "../data/hip_kernels/151/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cuInsertionSortPfiPiiiii(float addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %4
  br i1 %17, label %18, label %147

18:                                               ; preds = %7
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  %22 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 1, i32 addrspace(1)* %21, align 4, !tbaa !11
  %23 = icmp sgt i32 %6, 1
  br i1 %23, label %24, label %84

24:                                               ; preds = %18, %80
  %25 = phi i32 [ %81, %80 ], [ 1, %18 ]
  %26 = phi float [ %82, %80 ], [ %22, %18 ]
  %27 = mul nsw i32 %25, %1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %20, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = fcmp contract olt float %30, %26
  br i1 %31, label %32, label %75

32:                                               ; preds = %24
  %33 = add nsw i32 %25, -1
  %34 = icmp ugt i32 %25, 1
  br i1 %34, label %35, label %45

35:                                               ; preds = %32, %42
  %36 = phi i32 [ %43, %42 ], [ 0, %32 ]
  %37 = mul nsw i32 %36, %1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %20, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fcmp contract ogt float %40, %30
  br i1 %41, label %45, label %42

42:                                               ; preds = %35
  %43 = add nuw nsw i32 %36, 1
  %44 = icmp ult i32 %43, %33
  br i1 %44, label %35, label %45, !llvm.loop !13

45:                                               ; preds = %42, %35, %32
  %46 = phi i32 [ %33, %32 ], [ %33, %42 ], [ %36, %35 ]
  %47 = icmp ugt i32 %25, %46
  br i1 %47, label %48, label %66

48:                                               ; preds = %45, %48
  %49 = phi i32 [ %50, %48 ], [ %25, %45 ]
  %50 = add nsw i32 %49, -1
  %51 = mul nsw i32 %50, %1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %20, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = mul nsw i32 %49, %1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %20, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = mul nsw i32 %50, %3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !11
  %62 = mul nsw i32 %49, %3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %63
  store i32 %61, i32 addrspace(1)* %64, align 4, !tbaa !11
  %65 = icmp sgt i32 %50, %46
  br i1 %65, label %48, label %66, !llvm.loop !15

66:                                               ; preds = %48, %45
  %67 = mul nsw i32 %46, %1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %20, i64 %68
  store float %30, float addrspace(1)* %69, align 4, !tbaa !7
  %70 = add nuw nsw i32 %25, 1
  %71 = mul nsw i32 %46, %3
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %72
  store i32 %70, i32 addrspace(1)* %73, align 4, !tbaa !11
  %74 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  br label %80

75:                                               ; preds = %24
  %76 = add nuw nsw i32 %25, 1
  %77 = mul nsw i32 %25, %3
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %78
  store i32 %76, i32 addrspace(1)* %79, align 4, !tbaa !11
  br label %80

80:                                               ; preds = %75, %66
  %81 = phi i32 [ %76, %75 ], [ %70, %66 ]
  %82 = phi float [ %30, %75 ], [ %74, %66 ]
  %83 = icmp eq i32 %81, %6
  br i1 %83, label %84, label %24, !llvm.loop !16

84:                                               ; preds = %80, %18
  %85 = phi float [ %22, %18 ], [ %82, %80 ]
  %86 = add i32 %6, -1
  %87 = icmp slt i32 %6, %5
  br i1 %87, label %88, label %147

88:                                               ; preds = %84
  %89 = mul nsw i32 %86, %1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %20, i64 %90
  br label %92

92:                                               ; preds = %88, %143
  %93 = phi i32 [ %6, %88 ], [ %144, %143 ]
  %94 = phi float [ %85, %88 ], [ %145, %143 ]
  %95 = mul nsw i32 %93, %1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %20, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fcmp contract olt float %98, %94
  br i1 %99, label %102, label %100

100:                                              ; preds = %92
  %101 = add nsw i32 %93, 1
  br label %143

102:                                              ; preds = %92
  br i1 %23, label %103, label %113

103:                                              ; preds = %102, %110
  %104 = phi i32 [ %111, %110 ], [ 0, %102 ]
  %105 = mul nsw i32 %104, %1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %20, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fcmp contract ogt float %108, %98
  br i1 %109, label %113, label %110

110:                                              ; preds = %103
  %111 = add nuw nsw i32 %104, 1
  %112 = icmp eq i32 %111, %86
  br i1 %112, label %113, label %103, !llvm.loop !17

113:                                              ; preds = %110, %103, %102
  %114 = phi i32 [ %86, %102 ], [ %86, %110 ], [ %104, %103 ]
  %115 = icmp sgt i32 %86, %114
  br i1 %115, label %116, label %134

116:                                              ; preds = %113, %116
  %117 = phi i32 [ %118, %116 ], [ %86, %113 ]
  %118 = add nsw i32 %117, -1
  %119 = mul nsw i32 %118, %1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %20, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = mul nsw i32 %117, %1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %20, i64 %124
  store float %122, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = mul nsw i32 %118, %3
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !11
  %130 = mul nsw i32 %117, %3
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %131
  store i32 %129, i32 addrspace(1)* %132, align 4, !tbaa !11
  %133 = icmp sgt i32 %118, %114
  br i1 %133, label %116, label %134, !llvm.loop !18

134:                                              ; preds = %116, %113
  %135 = mul nsw i32 %114, %1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %20, i64 %136
  store float %98, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = add nsw i32 %93, 1
  %139 = mul nsw i32 %114, %3
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %140
  store i32 %138, i32 addrspace(1)* %141, align 4, !tbaa !11
  %142 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  br label %143

143:                                              ; preds = %100, %134
  %144 = phi i32 [ %101, %100 ], [ %138, %134 ]
  %145 = phi float [ %94, %100 ], [ %142, %134 ]
  %146 = icmp slt i32 %144, %5
  br i1 %146, label %92, label %147, !llvm.loop !19

147:                                              ; preds = %143, %84, %7
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
