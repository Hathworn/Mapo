; ModuleID = '../data/hip_kernels/8085/17/main.cu'
source_filename = "../data/hip_kernels/8085/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19kernel_for_z_planesPhiii(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul i32 %2, %1
  %7 = mul nsw i32 %6, %3
  %8 = sext i32 %7 to i64
  %9 = mul i32 %6, %5
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %10
  store i8 2, i8 addrspace(1)* %11, align 1, !tbaa !5
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %14 = sext i32 %1 to i64
  %15 = icmp slt i32 %1, 1
  br label %16

16:                                               ; preds = %155, %4
  br i1 %12, label %17, label %83

17:                                               ; preds = %16, %79
  %18 = phi i32 [ %81, %79 ], [ 0, %16 ]
  %19 = phi i8 [ %80, %79 ], [ 0, %16 ]
  br i1 %13, label %20, label %79

20:                                               ; preds = %17
  %21 = zext i32 %18 to i64
  %22 = add nsw i64 %21, %10
  br label %23

23:                                               ; preds = %75, %20
  %24 = phi i32 [ 0, %20 ], [ %77, %75 ]
  %25 = phi i8 [ %19, %20 ], [ %76, %75 ]
  %26 = mul nsw i32 %24, %1
  %27 = sext i32 %26 to i64
  %28 = add nsw i64 %22, %27
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !5
  %31 = icmp eq i8 %30, 2
  br i1 %31, label %32, label %75

32:                                               ; preds = %23
  %33 = add nsw i64 %28, %14
  %34 = icmp sgt i64 %33, -1
  %35 = icmp slt i64 %33, %8
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %42

37:                                               ; preds = %32
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !5
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %37
  store i8 2, i8 addrspace(1)* %38, align 1, !tbaa !5
  br label %42

42:                                               ; preds = %41, %37, %32
  %43 = phi i8 [ 1, %41 ], [ %25, %37 ], [ %25, %32 ]
  %44 = sub nsw i64 %28, %14
  %45 = icmp sgt i64 %44, -1
  %46 = icmp slt i64 %44, %8
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %53

48:                                               ; preds = %42
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !5
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  store i8 2, i8 addrspace(1)* %49, align 1, !tbaa !5
  br label %53

53:                                               ; preds = %52, %48, %42
  %54 = phi i8 [ 1, %52 ], [ %43, %48 ], [ %43, %42 ]
  %55 = add nsw i64 %28, 1
  %56 = icmp sgt i64 %28, -2
  %57 = icmp slt i64 %55, %8
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %64

59:                                               ; preds = %53
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !5
  %62 = icmp eq i8 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %59
  store i8 2, i8 addrspace(1)* %60, align 1, !tbaa !5
  br label %64

64:                                               ; preds = %63, %59, %53
  %65 = phi i8 [ 1, %63 ], [ %54, %59 ], [ %54, %53 ]
  %66 = icmp slt i64 %28, 1
  %67 = icmp sgt i64 %28, %8
  %68 = select i1 %66, i1 true, i1 %67
  br i1 %68, label %75, label %69

69:                                               ; preds = %64
  %70 = add nsw i64 %28, -1
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !5
  %73 = icmp eq i8 %72, 0
  br i1 %73, label %74, label %75

74:                                               ; preds = %69
  store i8 2, i8 addrspace(1)* %71, align 1, !tbaa !5
  br label %75

75:                                               ; preds = %74, %69, %64, %23
  %76 = phi i8 [ 1, %74 ], [ %65, %69 ], [ %65, %64 ], [ %25, %23 ]
  %77 = add nuw nsw i32 %24, 1
  %78 = icmp eq i32 %77, %2
  br i1 %78, label %79, label %23, !llvm.loop !8

79:                                               ; preds = %75, %17
  %80 = phi i8 [ %19, %17 ], [ %76, %75 ]
  %81 = add nuw nsw i32 %18, 1
  %82 = icmp eq i32 %81, %1
  br i1 %82, label %83, label %17, !llvm.loop !10

83:                                               ; preds = %79, %16
  %84 = phi i8 [ 0, %16 ], [ %80, %79 ]
  %85 = and i8 %84, 1
  %86 = icmp eq i8 %85, 0
  %87 = select i1 %86, i1 true, i1 %15
  %88 = select i1 %86, i8 %84, i8 0
  br i1 %87, label %155, label %92

89:                                               ; preds = %152, %92
  %90 = phi i8 [ %94, %92 ], [ %153, %152 ]
  %91 = icmp sgt i32 %93, 1
  br i1 %91, label %92, label %155, !llvm.loop !11

92:                                               ; preds = %83, %89
  %93 = phi i32 [ %95, %89 ], [ %1, %83 ]
  %94 = phi i8 [ %90, %89 ], [ 0, %83 ]
  %95 = add nsw i32 %93, -1
  br i1 %13, label %96, label %89

96:                                               ; preds = %92
  %97 = zext i32 %95 to i64
  %98 = add nsw i64 %97, %10
  br label %99

99:                                               ; preds = %152, %96
  %100 = phi i32 [ %2, %96 ], [ %102, %152 ]
  %101 = phi i8 [ %94, %96 ], [ %153, %152 ]
  %102 = add nsw i32 %100, -1
  %103 = mul nsw i32 %102, %1
  %104 = sext i32 %103 to i64
  %105 = add nsw i64 %98, %104
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !5
  %108 = icmp eq i8 %107, 2
  br i1 %108, label %109, label %152

109:                                              ; preds = %99
  %110 = add nsw i64 %105, %14
  %111 = icmp sgt i64 %110, -1
  %112 = icmp slt i64 %110, %8
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %119

114:                                              ; preds = %109
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %110
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !5
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %118, label %119

118:                                              ; preds = %114
  store i8 2, i8 addrspace(1)* %115, align 1, !tbaa !5
  br label %119

119:                                              ; preds = %118, %114, %109
  %120 = phi i8 [ 1, %118 ], [ %101, %114 ], [ %101, %109 ]
  %121 = sub nsw i64 %105, %14
  %122 = icmp sgt i64 %121, -1
  %123 = icmp slt i64 %121, %8
  %124 = select i1 %122, i1 %123, i1 false
  br i1 %124, label %125, label %130

125:                                              ; preds = %119
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %121
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !5
  %128 = icmp eq i8 %127, 0
  br i1 %128, label %129, label %130

129:                                              ; preds = %125
  store i8 2, i8 addrspace(1)* %126, align 1, !tbaa !5
  br label %130

130:                                              ; preds = %129, %125, %119
  %131 = phi i8 [ 1, %129 ], [ %120, %125 ], [ %120, %119 ]
  %132 = add nsw i64 %105, 1
  %133 = icmp sgt i64 %105, -2
  %134 = icmp slt i64 %132, %8
  %135 = select i1 %133, i1 %134, i1 false
  br i1 %135, label %136, label %141

136:                                              ; preds = %130
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %132
  %138 = load i8, i8 addrspace(1)* %137, align 1, !tbaa !5
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %140, label %141

140:                                              ; preds = %136
  store i8 2, i8 addrspace(1)* %137, align 1, !tbaa !5
  br label %141

141:                                              ; preds = %140, %136, %130
  %142 = phi i8 [ 1, %140 ], [ %131, %136 ], [ %131, %130 ]
  %143 = icmp slt i64 %105, 1
  %144 = icmp sgt i64 %105, %8
  %145 = select i1 %143, i1 true, i1 %144
  br i1 %145, label %152, label %146

146:                                              ; preds = %141
  %147 = add nsw i64 %105, -1
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %147
  %149 = load i8, i8 addrspace(1)* %148, align 1, !tbaa !5
  %150 = icmp eq i8 %149, 0
  br i1 %150, label %151, label %152

151:                                              ; preds = %146
  store i8 2, i8 addrspace(1)* %148, align 1, !tbaa !5
  br label %152

152:                                              ; preds = %151, %146, %141, %99
  %153 = phi i8 [ 1, %151 ], [ %142, %146 ], [ %142, %141 ], [ %101, %99 ]
  %154 = icmp ugt i32 %100, 1
  br i1 %154, label %99, label %89, !llvm.loop !12

155:                                              ; preds = %89, %83
  %156 = phi i8 [ %88, %83 ], [ %90, %89 ]
  %157 = and i8 %156, 1
  %158 = icmp eq i8 %157, 0
  br i1 %158, label %159, label %16

159:                                              ; preds = %155
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
