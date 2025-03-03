; ModuleID = '../data/hip_kernels/12252/0/main.cu'
source_filename = "../data/hip_kernels/12252/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6golGpuiiPhS_(i32 %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 1
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = mul nsw i32 %8, %0
  %14 = add nsw i32 %13, %12
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %15
  %17 = load i8, i8 addrspace(1)* %16, align 1, !tbaa !5, !amdgpu.noclobber !8
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %15
  store i8 %17, i8 addrspace(1)* %18, align 1, !tbaa !5
  %19 = add nsw i32 %8, -1
  %20 = icmp slt i32 %8, 1
  br i1 %20, label %34, label %21

21:                                               ; preds = %4
  %22 = icmp sle i32 %8, %0
  %23 = icmp sgt i32 %12, -1
  %24 = select i1 %22, i1 %23, i1 false
  %25 = icmp slt i32 %12, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %34

27:                                               ; preds = %21
  %28 = mul nsw i32 %19, %0
  %29 = add nsw i32 %28, %12
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !5
  %33 = zext i8 %32 to i32
  br label %34

34:                                               ; preds = %27, %21, %4
  %35 = phi i32 [ %33, %27 ], [ 0, %21 ], [ 0, %4 ]
  %36 = add nsw i32 %8, 1
  %37 = icmp sgt i32 %8, -2
  br i1 %37, label %38, label %52

38:                                               ; preds = %34
  %39 = icmp slt i32 %36, %0
  %40 = icmp sgt i32 %12, -1
  %41 = select i1 %39, i1 %40, i1 false
  %42 = icmp slt i32 %12, %1
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %52

44:                                               ; preds = %38
  %45 = mul nsw i32 %36, %0
  %46 = add nsw i32 %45, %12
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !5
  %50 = zext i8 %49 to i32
  %51 = add nuw nsw i32 %35, %50
  br label %52

52:                                               ; preds = %44, %38, %34
  %53 = phi i32 [ %51, %44 ], [ %35, %38 ], [ %35, %34 ]
  %54 = icmp sgt i32 %8, -1
  %55 = icmp slt i32 %8, %0
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %69

57:                                               ; preds = %52
  %58 = icmp slt i32 %12, 1
  %59 = icmp sgt i32 %12, %1
  %60 = select i1 %58, i1 true, i1 %59
  br i1 %60, label %69, label %61

61:                                               ; preds = %57
  %62 = add nsw i32 %12, -1
  %63 = add nsw i32 %62, %13
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !5
  %67 = zext i8 %66 to i32
  %68 = add nuw nsw i32 %53, %67
  br label %69

69:                                               ; preds = %61, %57, %52
  %70 = phi i32 [ %68, %61 ], [ %53, %57 ], [ %53, %52 ]
  br i1 %56, label %71, label %83

71:                                               ; preds = %69
  %72 = add nsw i32 %12, 1
  %73 = icmp sgt i32 %12, -2
  %74 = icmp slt i32 %72, %1
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %83

76:                                               ; preds = %71
  %77 = add nsw i32 %13, %72
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !5
  %81 = zext i8 %80 to i32
  %82 = add nuw nsw i32 %70, %81
  br label %83

83:                                               ; preds = %76, %71, %69
  %84 = phi i32 [ %82, %76 ], [ %70, %71 ], [ %70, %69 ]
  %85 = icmp sgt i32 %8, %0
  %86 = select i1 %20, i1 true, i1 %85
  br i1 %86, label %100, label %87

87:                                               ; preds = %83
  %88 = icmp slt i32 %12, 1
  %89 = icmp sgt i32 %12, %1
  %90 = select i1 %88, i1 true, i1 %89
  br i1 %90, label %100, label %91

91:                                               ; preds = %87
  %92 = add nsw i32 %12, -1
  %93 = mul nsw i32 %19, %0
  %94 = add nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !5
  %98 = zext i8 %97 to i32
  %99 = add nuw nsw i32 %84, %98
  br label %100

100:                                              ; preds = %91, %87, %83
  %101 = phi i32 [ %99, %91 ], [ %84, %87 ], [ %84, %83 ]
  br i1 %86, label %115, label %102

102:                                              ; preds = %100
  %103 = add nsw i32 %12, 1
  %104 = icmp sgt i32 %12, -2
  %105 = icmp slt i32 %103, %1
  %106 = select i1 %104, i1 %105, i1 false
  br i1 %106, label %107, label %115

107:                                              ; preds = %102
  %108 = mul nsw i32 %19, %0
  %109 = add nsw i32 %108, %103
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !5
  %113 = zext i8 %112 to i32
  %114 = add nuw nsw i32 %101, %113
  br label %115

115:                                              ; preds = %107, %102, %100
  %116 = phi i32 [ %114, %107 ], [ %101, %102 ], [ %101, %100 ]
  %117 = icmp slt i32 %36, %0
  %118 = select i1 %37, i1 %117, i1 false
  br i1 %118, label %119, label %132

119:                                              ; preds = %115
  %120 = icmp slt i32 %12, 1
  %121 = icmp sgt i32 %12, %1
  %122 = select i1 %120, i1 true, i1 %121
  br i1 %122, label %132, label %123

123:                                              ; preds = %119
  %124 = add nsw i32 %12, -1
  %125 = mul nsw i32 %36, %0
  %126 = add nsw i32 %124, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %127
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !5
  %130 = zext i8 %129 to i32
  %131 = add nuw nsw i32 %116, %130
  br label %132

132:                                              ; preds = %123, %119, %115
  %133 = phi i32 [ %131, %123 ], [ %116, %119 ], [ %116, %115 ]
  br i1 %118, label %134, label %147

134:                                              ; preds = %132
  %135 = add nsw i32 %12, 1
  %136 = icmp sgt i32 %12, -2
  %137 = icmp slt i32 %135, %1
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %139, label %147

139:                                              ; preds = %134
  %140 = mul nsw i32 %36, %0
  %141 = add nsw i32 %140, %135
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !5
  %145 = zext i8 %144 to i32
  %146 = add nuw nsw i32 %133, %145
  br label %147

147:                                              ; preds = %139, %134, %132
  %148 = phi i32 [ %146, %139 ], [ %133, %134 ], [ %133, %132 ]
  %149 = and i32 %148, -2
  %150 = icmp eq i32 %149, 2
  br i1 %150, label %152, label %151

151:                                              ; preds = %147
  store i8 0, i8 addrspace(1)* %18, align 1, !tbaa !5
  br label %152

152:                                              ; preds = %147, %151
  %153 = icmp eq i32 %148, 3
  br i1 %153, label %154, label %158

154:                                              ; preds = %152
  %155 = load i8, i8 addrspace(1)* %16, align 1, !tbaa !5
  %156 = icmp eq i8 %155, 0
  br i1 %156, label %157, label %158

157:                                              ; preds = %154
  store i8 1, i8 addrspace(1)* %18, align 1, !tbaa !5
  br label %158

158:                                              ; preds = %157, %154, %152
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{}
