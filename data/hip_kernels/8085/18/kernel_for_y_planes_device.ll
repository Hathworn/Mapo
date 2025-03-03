; ModuleID = '../data/hip_kernels/8085/18/main.cu'
source_filename = "../data/hip_kernels/8085/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19kernel_for_y_planesPhiii(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul i32 %2, %1
  %7 = mul nsw i32 %6, %3
  %8 = sext i32 %7 to i64
  %9 = mul nsw i32 %5, %1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %10
  store i8 3, i8 addrspace(1)* %11, align 1, !tbaa !5
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %3, 0
  %14 = sext i32 %6 to i64
  %15 = icmp slt i32 %1, 1
  br label %16

16:                                               ; preds = %147, %4
  br i1 %12, label %17, label %79

17:                                               ; preds = %16, %75
  %18 = phi i32 [ %77, %75 ], [ 0, %16 ]
  %19 = phi i8 [ %76, %75 ], [ 0, %16 ]
  br i1 %13, label %20, label %75

20:                                               ; preds = %17
  %21 = zext i32 %18 to i64
  %22 = add nsw i64 %21, %10
  br label %23

23:                                               ; preds = %71, %20
  %24 = phi i32 [ 0, %20 ], [ %73, %71 ]
  %25 = phi i8 [ %19, %20 ], [ %72, %71 ]
  %26 = mul i32 %24, %6
  %27 = sext i32 %26 to i64
  %28 = add nsw i64 %22, %27
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !5
  %31 = icmp eq i8 %30, 3
  br i1 %31, label %32, label %71

32:                                               ; preds = %23
  %33 = add nsw i64 %28, %14
  %34 = icmp sgt i64 %33, -1
  %35 = icmp slt i64 %33, %8
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %41

37:                                               ; preds = %32
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !5
  switch i8 %39, label %41 [
    i8 0, label %40
    i8 2, label %40
  ]

40:                                               ; preds = %37, %37
  store i8 3, i8 addrspace(1)* %38, align 1, !tbaa !5
  br label %41

41:                                               ; preds = %40, %37, %32
  %42 = phi i8 [ 1, %40 ], [ %25, %32 ], [ %25, %37 ]
  %43 = sub nsw i64 %28, %14
  %44 = icmp sgt i64 %43, -1
  %45 = icmp slt i64 %43, %8
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %47, label %51

47:                                               ; preds = %41
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !5
  switch i8 %49, label %51 [
    i8 0, label %50
    i8 2, label %50
  ]

50:                                               ; preds = %47, %47
  store i8 3, i8 addrspace(1)* %48, align 1, !tbaa !5
  br label %51

51:                                               ; preds = %50, %47, %41
  %52 = phi i8 [ 1, %50 ], [ %42, %41 ], [ %42, %47 ]
  %53 = add nsw i64 %28, 1
  %54 = icmp sgt i64 %28, -2
  %55 = icmp slt i64 %53, %8
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %61

57:                                               ; preds = %51
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !5
  switch i8 %59, label %61 [
    i8 0, label %60
    i8 2, label %60
  ]

60:                                               ; preds = %57, %57
  store i8 3, i8 addrspace(1)* %58, align 1, !tbaa !5
  br label %61

61:                                               ; preds = %60, %57, %51
  %62 = phi i8 [ 1, %60 ], [ %52, %51 ], [ %52, %57 ]
  %63 = icmp slt i64 %28, 1
  %64 = icmp sgt i64 %28, %8
  %65 = select i1 %63, i1 true, i1 %64
  br i1 %65, label %71, label %66

66:                                               ; preds = %61
  %67 = add nsw i64 %28, -1
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !5
  switch i8 %69, label %71 [
    i8 0, label %70
    i8 2, label %70
  ]

70:                                               ; preds = %66, %66
  store i8 3, i8 addrspace(1)* %68, align 1, !tbaa !5
  br label %71

71:                                               ; preds = %70, %66, %61, %23
  %72 = phi i8 [ 1, %70 ], [ %62, %61 ], [ %25, %23 ], [ %62, %66 ]
  %73 = add nuw nsw i32 %24, 1
  %74 = icmp eq i32 %73, %3
  br i1 %74, label %75, label %23, !llvm.loop !8

75:                                               ; preds = %71, %17
  %76 = phi i8 [ %19, %17 ], [ %72, %71 ]
  %77 = add nuw nsw i32 %18, 1
  %78 = icmp eq i32 %77, %1
  br i1 %78, label %79, label %17, !llvm.loop !10

79:                                               ; preds = %75, %16
  %80 = phi i8 [ 0, %16 ], [ %76, %75 ]
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  %83 = select i1 %82, i1 true, i1 %15
  %84 = select i1 %82, i8 %80, i8 0
  br i1 %83, label %147, label %88

85:                                               ; preds = %144, %88
  %86 = phi i8 [ %90, %88 ], [ %145, %144 ]
  %87 = icmp sgt i32 %89, 1
  br i1 %87, label %88, label %147, !llvm.loop !11

88:                                               ; preds = %79, %85
  %89 = phi i32 [ %91, %85 ], [ %1, %79 ]
  %90 = phi i8 [ %86, %85 ], [ 0, %79 ]
  %91 = add nsw i32 %89, -1
  br i1 %13, label %92, label %85

92:                                               ; preds = %88
  %93 = zext i32 %91 to i64
  %94 = add nsw i64 %93, %10
  br label %95

95:                                               ; preds = %144, %92
  %96 = phi i32 [ %3, %92 ], [ %98, %144 ]
  %97 = phi i8 [ %90, %92 ], [ %145, %144 ]
  %98 = add nsw i32 %96, -1
  %99 = mul i32 %98, %6
  %100 = sext i32 %99 to i64
  %101 = add nsw i64 %94, %100
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !5
  %104 = icmp eq i8 %103, 3
  br i1 %104, label %105, label %144

105:                                              ; preds = %95
  %106 = add nsw i64 %101, %14
  %107 = icmp sgt i64 %106, -1
  %108 = icmp slt i64 %106, %8
  %109 = select i1 %107, i1 %108, i1 false
  br i1 %109, label %110, label %114

110:                                              ; preds = %105
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %106
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !5
  switch i8 %112, label %114 [
    i8 0, label %113
    i8 2, label %113
  ]

113:                                              ; preds = %110, %110
  store i8 3, i8 addrspace(1)* %111, align 1, !tbaa !5
  br label %114

114:                                              ; preds = %113, %110, %105
  %115 = phi i8 [ 1, %113 ], [ %97, %105 ], [ %97, %110 ]
  %116 = sub nsw i64 %101, %14
  %117 = icmp sgt i64 %116, -1
  %118 = icmp slt i64 %116, %8
  %119 = select i1 %117, i1 %118, i1 false
  br i1 %119, label %120, label %124

120:                                              ; preds = %114
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !5
  switch i8 %122, label %124 [
    i8 0, label %123
    i8 2, label %123
  ]

123:                                              ; preds = %120, %120
  store i8 3, i8 addrspace(1)* %121, align 1, !tbaa !5
  br label %124

124:                                              ; preds = %123, %120, %114
  %125 = phi i8 [ 1, %123 ], [ %115, %114 ], [ %115, %120 ]
  %126 = add nsw i64 %101, 1
  %127 = icmp sgt i64 %101, -2
  %128 = icmp slt i64 %126, %8
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %130, label %134

130:                                              ; preds = %124
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %126
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !5
  switch i8 %132, label %134 [
    i8 0, label %133
    i8 2, label %133
  ]

133:                                              ; preds = %130, %130
  store i8 3, i8 addrspace(1)* %131, align 1, !tbaa !5
  br label %134

134:                                              ; preds = %133, %130, %124
  %135 = phi i8 [ 1, %133 ], [ %125, %124 ], [ %125, %130 ]
  %136 = icmp slt i64 %101, 1
  %137 = icmp sgt i64 %101, %8
  %138 = select i1 %136, i1 true, i1 %137
  br i1 %138, label %144, label %139

139:                                              ; preds = %134
  %140 = add nsw i64 %101, -1
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %140
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !5
  switch i8 %142, label %144 [
    i8 0, label %143
    i8 2, label %143
  ]

143:                                              ; preds = %139, %139
  store i8 3, i8 addrspace(1)* %141, align 1, !tbaa !5
  br label %144

144:                                              ; preds = %143, %139, %134, %95
  %145 = phi i8 [ 1, %143 ], [ %135, %134 ], [ %97, %95 ], [ %135, %139 ]
  %146 = icmp ugt i32 %96, 1
  br i1 %146, label %95, label %85, !llvm.loop !12

147:                                              ; preds = %85, %79
  %148 = phi i8 [ %84, %79 ], [ %86, %85 ]
  %149 = and i8 %148, 1
  %150 = icmp eq i8 %149, 0
  br i1 %150, label %151, label %16

151:                                              ; preds = %147
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
