; ModuleID = '../data/hip_kernels/15997/1/main.cu'
source_filename = "../data/hip_kernels/15997/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cuInsertionSortPfPliii(float addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  br i1 %15, label %16, label %134

16:                                               ; preds = %5
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %17
  %20 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i64 1, i64 addrspace(1)* %19, align 8, !tbaa !11
  %21 = icmp sgt i32 %4, 1
  br i1 %21, label %22, label %76

22:                                               ; preds = %16, %72
  %23 = phi i32 [ %73, %72 ], [ 1, %16 ]
  %24 = phi float [ %74, %72 ], [ %20, %16 ]
  %25 = mul nsw i32 %23, %2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %18, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = fcmp contract olt float %28, %24
  br i1 %29, label %30, label %68

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
  %56 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %50
  %57 = load i64, i64 addrspace(1)* %56, align 8, !tbaa !11
  %58 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %54
  store i64 %57, i64 addrspace(1)* %58, align 8, !tbaa !11
  %59 = icmp sgt i32 %48, %44
  br i1 %59, label %46, label %60, !llvm.loop !15

60:                                               ; preds = %46, %43
  %61 = mul nsw i32 %44, %2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %18, i64 %62
  store float %28, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nuw nsw i32 %23, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %62
  store i64 %65, i64 addrspace(1)* %66, align 8, !tbaa !11
  %67 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  br label %72

68:                                               ; preds = %22
  %69 = add nuw nsw i32 %23, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %26
  store i64 %70, i64 addrspace(1)* %71, align 8, !tbaa !11
  br label %72

72:                                               ; preds = %68, %60
  %73 = phi i32 [ %69, %68 ], [ %64, %60 ]
  %74 = phi float [ %28, %68 ], [ %67, %60 ]
  %75 = icmp eq i32 %73, %4
  br i1 %75, label %76, label %22, !llvm.loop !16

76:                                               ; preds = %72, %16
  %77 = phi float [ %20, %16 ], [ %74, %72 ]
  %78 = add i32 %4, -1
  %79 = icmp slt i32 %4, %3
  br i1 %79, label %80, label %134

80:                                               ; preds = %76
  %81 = mul nsw i32 %78, %2
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %18, i64 %82
  br label %84

84:                                               ; preds = %80, %130
  %85 = phi i32 [ %4, %80 ], [ %131, %130 ]
  %86 = phi float [ %77, %80 ], [ %132, %130 ]
  %87 = mul nsw i32 %85, %2
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %18, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fcmp contract olt float %90, %86
  br i1 %91, label %94, label %92

92:                                               ; preds = %84
  %93 = add nsw i32 %85, 1
  br label %130

94:                                               ; preds = %84
  br i1 %21, label %95, label %105

95:                                               ; preds = %94, %102
  %96 = phi i32 [ %103, %102 ], [ 0, %94 ]
  %97 = mul nsw i32 %96, %2
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %18, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fcmp contract ogt float %100, %90
  br i1 %101, label %105, label %102

102:                                              ; preds = %95
  %103 = add nuw nsw i32 %96, 1
  %104 = icmp eq i32 %103, %78
  br i1 %104, label %105, label %95, !llvm.loop !17

105:                                              ; preds = %102, %95, %94
  %106 = phi i32 [ %78, %94 ], [ %78, %102 ], [ %96, %95 ]
  %107 = icmp sgt i32 %78, %106
  br i1 %107, label %108, label %122

108:                                              ; preds = %105, %108
  %109 = phi i32 [ %110, %108 ], [ %78, %105 ]
  %110 = add nsw i32 %109, -1
  %111 = mul nsw i32 %110, %2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %18, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = mul nsw i32 %109, %2
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %18, i64 %116
  store float %114, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %112
  %119 = load i64, i64 addrspace(1)* %118, align 8, !tbaa !11
  %120 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %116
  store i64 %119, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = icmp sgt i32 %110, %106
  br i1 %121, label %108, label %122, !llvm.loop !18

122:                                              ; preds = %108, %105
  %123 = mul nsw i32 %106, %2
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %18, i64 %124
  store float %90, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = add nsw i32 %85, 1
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i64, i64 addrspace(1)* %19, i64 %124
  store i64 %127, i64 addrspace(1)* %128, align 8, !tbaa !11
  %129 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  br label %130

130:                                              ; preds = %92, %122
  %131 = phi i32 [ %93, %92 ], [ %126, %122 ]
  %132 = phi float [ %86, %92 ], [ %129, %122 ]
  %133 = icmp slt i32 %131, %3
  br i1 %133, label %84, label %134, !llvm.loop !19

134:                                              ; preds = %130, %76, %5
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
!12 = !{!"long", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
