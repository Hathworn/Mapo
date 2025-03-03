; ModuleID = '../data/hip_kernels/8085/19/main.cu'
source_filename = "../data/hip_kernels/8085/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19kernel_for_x_planesPhiii(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul nsw i32 %2, %1
  %7 = mul nsw i32 %6, %3
  %8 = sext i32 %7 to i64
  %9 = zext i32 %5 to i64
  %10 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %9
  store i8 4, i8 addrspace(1)* %10, align 1, !tbaa !5
  %11 = icmp sgt i32 %2, 0
  %12 = icmp sgt i32 %3, 0
  %13 = sext i32 %6 to i64
  %14 = sext i32 %1 to i64
  %15 = icmp slt i32 %2, 1
  br label %16

16:                                               ; preds = %145, %4
  br i1 %11, label %17, label %78

17:                                               ; preds = %16, %74
  %18 = phi i32 [ %76, %74 ], [ 0, %16 ]
  %19 = phi i8 [ %75, %74 ], [ 0, %16 ]
  br i1 %12, label %20, label %74

20:                                               ; preds = %17, %70
  %21 = phi i32 [ %72, %70 ], [ 0, %17 ]
  %22 = phi i8 [ %71, %70 ], [ %19, %17 ]
  %23 = mul i32 %21, %2
  %24 = add i32 %23, %18
  %25 = mul i32 %24, %1
  %26 = sext i32 %25 to i64
  %27 = add nsw i64 %26, %9
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !5
  %30 = icmp eq i8 %29, 4
  br i1 %30, label %31, label %70

31:                                               ; preds = %20
  %32 = add nsw i64 %27, %13
  %33 = icmp sgt i64 %32, -1
  %34 = icmp slt i64 %32, %8
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %40

36:                                               ; preds = %31
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !5
  switch i8 %38, label %40 [
    i8 0, label %39
    i8 2, label %39
    i8 3, label %39
  ]

39:                                               ; preds = %36, %36, %36
  store i8 4, i8 addrspace(1)* %37, align 1, !tbaa !5
  br label %40

40:                                               ; preds = %39, %36, %31
  %41 = phi i8 [ 1, %39 ], [ %22, %31 ], [ %22, %36 ]
  %42 = sub nsw i64 %27, %13
  %43 = icmp sgt i64 %42, -1
  %44 = icmp slt i64 %42, %8
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %50

46:                                               ; preds = %40
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !5
  switch i8 %48, label %50 [
    i8 0, label %49
    i8 2, label %49
    i8 3, label %49
  ]

49:                                               ; preds = %46, %46, %46
  store i8 4, i8 addrspace(1)* %47, align 1, !tbaa !5
  br label %50

50:                                               ; preds = %49, %46, %40
  %51 = phi i8 [ 1, %49 ], [ %41, %40 ], [ %41, %46 ]
  %52 = add nsw i64 %27, %14
  %53 = icmp sgt i64 %52, -1
  %54 = icmp slt i64 %52, %8
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %60

56:                                               ; preds = %50
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %52
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !5
  switch i8 %58, label %60 [
    i8 0, label %59
    i8 2, label %59
    i8 3, label %59
  ]

59:                                               ; preds = %56, %56, %56
  store i8 4, i8 addrspace(1)* %57, align 1, !tbaa !5
  br label %60

60:                                               ; preds = %59, %56, %50
  %61 = phi i8 [ 1, %59 ], [ %51, %50 ], [ %51, %56 ]
  %62 = sub nsw i64 %27, %14
  %63 = icmp sgt i64 %62, -1
  %64 = icmp slt i64 %62, %8
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %70

66:                                               ; preds = %60
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !5
  switch i8 %68, label %70 [
    i8 0, label %69
    i8 2, label %69
    i8 3, label %69
  ]

69:                                               ; preds = %66, %66, %66
  store i8 4, i8 addrspace(1)* %67, align 1, !tbaa !5
  br label %70

70:                                               ; preds = %69, %66, %60, %20
  %71 = phi i8 [ 1, %69 ], [ %61, %60 ], [ %22, %20 ], [ %61, %66 ]
  %72 = add nuw nsw i32 %21, 1
  %73 = icmp eq i32 %72, %3
  br i1 %73, label %74, label %20, !llvm.loop !8

74:                                               ; preds = %70, %17
  %75 = phi i8 [ %19, %17 ], [ %71, %70 ]
  %76 = add nuw nsw i32 %18, 1
  %77 = icmp eq i32 %76, %2
  br i1 %77, label %78, label %17, !llvm.loop !10

78:                                               ; preds = %74, %16
  %79 = phi i8 [ 0, %16 ], [ %75, %74 ]
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  %82 = select i1 %81, i1 true, i1 %15
  %83 = select i1 %81, i8 %79, i8 0
  br i1 %82, label %145, label %87

84:                                               ; preds = %142, %87
  %85 = phi i8 [ %89, %87 ], [ %143, %142 ]
  %86 = icmp sgt i32 %88, 1
  br i1 %86, label %87, label %145, !llvm.loop !11

87:                                               ; preds = %78, %84
  %88 = phi i32 [ %90, %84 ], [ %2, %78 ]
  %89 = phi i8 [ %85, %84 ], [ 0, %78 ]
  %90 = add nsw i32 %88, -1
  br i1 %12, label %91, label %84

91:                                               ; preds = %87, %142
  %92 = phi i32 [ %94, %142 ], [ %3, %87 ]
  %93 = phi i8 [ %143, %142 ], [ %89, %87 ]
  %94 = add nsw i32 %92, -1
  %95 = mul i32 %94, %2
  %96 = add i32 %95, %90
  %97 = mul i32 %96, %1
  %98 = sext i32 %97 to i64
  %99 = add nsw i64 %98, %9
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %99
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !5
  %102 = icmp eq i8 %101, 4
  br i1 %102, label %103, label %142

103:                                              ; preds = %91
  %104 = add nsw i64 %99, %13
  %105 = icmp sgt i64 %104, -1
  %106 = icmp slt i64 %104, %8
  %107 = select i1 %105, i1 %106, i1 false
  br i1 %107, label %108, label %112

108:                                              ; preds = %103
  %109 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %104
  %110 = load i8, i8 addrspace(1)* %109, align 1, !tbaa !5
  switch i8 %110, label %112 [
    i8 0, label %111
    i8 2, label %111
    i8 3, label %111
  ]

111:                                              ; preds = %108, %108, %108
  store i8 4, i8 addrspace(1)* %109, align 1, !tbaa !5
  br label %112

112:                                              ; preds = %111, %108, %103
  %113 = phi i8 [ 1, %111 ], [ %93, %103 ], [ %93, %108 ]
  %114 = sub nsw i64 %99, %13
  %115 = icmp sgt i64 %114, -1
  %116 = icmp slt i64 %114, %8
  %117 = select i1 %115, i1 %116, i1 false
  br i1 %117, label %118, label %122

118:                                              ; preds = %112
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %114
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !5
  switch i8 %120, label %122 [
    i8 0, label %121
    i8 2, label %121
    i8 3, label %121
  ]

121:                                              ; preds = %118, %118, %118
  store i8 4, i8 addrspace(1)* %119, align 1, !tbaa !5
  br label %122

122:                                              ; preds = %121, %118, %112
  %123 = phi i8 [ 1, %121 ], [ %113, %112 ], [ %113, %118 ]
  %124 = add nsw i64 %99, %14
  %125 = icmp sgt i64 %124, -1
  %126 = icmp slt i64 %124, %8
  %127 = select i1 %125, i1 %126, i1 false
  br i1 %127, label %128, label %132

128:                                              ; preds = %122
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %124
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !5
  switch i8 %130, label %132 [
    i8 0, label %131
    i8 2, label %131
    i8 3, label %131
  ]

131:                                              ; preds = %128, %128, %128
  store i8 4, i8 addrspace(1)* %129, align 1, !tbaa !5
  br label %132

132:                                              ; preds = %131, %128, %122
  %133 = phi i8 [ 1, %131 ], [ %123, %122 ], [ %123, %128 ]
  %134 = sub nsw i64 %99, %14
  %135 = icmp sgt i64 %134, -1
  %136 = icmp slt i64 %134, %8
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %142

138:                                              ; preds = %132
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %134
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !5
  switch i8 %140, label %142 [
    i8 0, label %141
    i8 2, label %141
    i8 3, label %141
  ]

141:                                              ; preds = %138, %138, %138
  store i8 4, i8 addrspace(1)* %139, align 1, !tbaa !5
  br label %142

142:                                              ; preds = %141, %138, %132, %91
  %143 = phi i8 [ 1, %141 ], [ %133, %132 ], [ %93, %91 ], [ %133, %138 ]
  %144 = icmp ugt i32 %92, 1
  br i1 %144, label %91, label %84, !llvm.loop !12

145:                                              ; preds = %84, %78
  %146 = phi i8 [ %83, %78 ], [ %85, %84 ]
  %147 = and i8 %146, 1
  %148 = icmp eq i8 %147, 0
  br i1 %148, label %149, label %16

149:                                              ; preds = %145
  ret void
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
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
