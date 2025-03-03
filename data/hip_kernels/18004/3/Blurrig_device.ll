; ModuleID = '../data/hip_kernels/18004/3/main.cu'
source_filename = "../data/hip_kernels/18004/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7BlurrigPhS_ii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %174

25:                                               ; preds = %4
  %26 = add nsw i32 %21, -1
  %27 = icmp sgt i32 %21, 0
  %28 = mul nsw i32 %26, %3
  %29 = add nsw i32 %13, -1
  br i1 %27, label %30, label %40

30:                                               ; preds = %25
  %31 = icmp sgt i32 %13, 0
  %32 = icmp sle i32 %13, %3
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %40

34:                                               ; preds = %30
  %35 = add nsw i32 %29, %28
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !6
  %39 = zext i8 %38 to i32
  br label %40

40:                                               ; preds = %34, %30, %25
  %41 = phi i32 [ 1, %34 ], [ 0, %30 ], [ 0, %25 ]
  %42 = phi i32 [ %39, %34 ], [ 0, %30 ], [ 0, %25 ]
  %43 = icmp sgt i32 %13, -1
  %44 = select i1 %27, i1 %43, i1 false
  br i1 %44, label %45, label %53

45:                                               ; preds = %40
  %46 = add nsw i32 %13, %28
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !amdgpu.noclobber !6
  %50 = zext i8 %49 to i32
  %51 = add nuw nsw i32 %42, %50
  %52 = add nuw nsw i32 %41, 1
  br label %53

53:                                               ; preds = %45, %40
  %54 = phi i32 [ %52, %45 ], [ %41, %40 ]
  %55 = phi i32 [ %51, %45 ], [ %42, %40 ]
  %56 = add nsw i32 %13, 1
  br i1 %27, label %57, label %69

57:                                               ; preds = %53
  %58 = icmp sgt i32 %13, -2
  %59 = icmp slt i32 %56, %3
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %61, label %69

61:                                               ; preds = %57
  %62 = add nsw i32 %56, %28
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !6
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %55, %66
  %68 = add nuw nsw i32 %54, 1
  br label %69

69:                                               ; preds = %61, %57, %53
  %70 = phi i32 [ %68, %61 ], [ %54, %57 ], [ %54, %53 ]
  %71 = phi i32 [ %67, %61 ], [ %55, %57 ], [ %55, %53 ]
  %72 = icmp sgt i32 %21, -1
  %73 = mul nsw i32 %21, %3
  br i1 %72, label %74, label %86

74:                                               ; preds = %69
  %75 = icmp sgt i32 %13, 0
  %76 = icmp sle i32 %13, %3
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %86

78:                                               ; preds = %74
  %79 = add nsw i32 %29, %73
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !6
  %83 = zext i8 %82 to i32
  %84 = add nuw nsw i32 %71, %83
  %85 = add nuw nsw i32 %70, 1
  br label %86

86:                                               ; preds = %78, %74, %69
  %87 = phi i32 [ %85, %78 ], [ %70, %74 ], [ %70, %69 ]
  %88 = phi i32 [ %84, %78 ], [ %71, %74 ], [ %71, %69 ]
  %89 = icmp sgt i32 %13, -1
  %90 = select i1 %72, i1 %89, i1 false
  br i1 %90, label %91, label %99

91:                                               ; preds = %86
  %92 = add nsw i32 %13, %73
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !7, !amdgpu.noclobber !6
  %96 = zext i8 %95 to i32
  %97 = add nuw nsw i32 %88, %96
  %98 = add nuw nsw i32 %87, 1
  br label %99

99:                                               ; preds = %91, %86
  %100 = phi i32 [ %98, %91 ], [ %87, %86 ]
  %101 = phi i32 [ %97, %91 ], [ %88, %86 ]
  br i1 %72, label %102, label %114

102:                                              ; preds = %99
  %103 = icmp sgt i32 %13, -2
  %104 = icmp slt i32 %56, %3
  %105 = select i1 %103, i1 %104, i1 false
  br i1 %105, label %106, label %114

106:                                              ; preds = %102
  %107 = add nsw i32 %56, %73
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %108
  %110 = load i8, i8 addrspace(1)* %109, align 1, !tbaa !7, !amdgpu.noclobber !6
  %111 = zext i8 %110 to i32
  %112 = add nuw nsw i32 %101, %111
  %113 = add nuw nsw i32 %100, 1
  br label %114

114:                                              ; preds = %106, %102, %99
  %115 = phi i32 [ %113, %106 ], [ %100, %102 ], [ %100, %99 ]
  %116 = phi i32 [ %112, %106 ], [ %101, %102 ], [ %101, %99 ]
  %117 = add nsw i32 %21, 1
  %118 = icmp sgt i32 %21, -2
  %119 = icmp slt i32 %117, %2
  %120 = mul nsw i32 %117, %3
  br i1 %118, label %121, label %134

121:                                              ; preds = %114
  %122 = icmp sgt i32 %13, 0
  %123 = select i1 %119, i1 %122, i1 false
  %124 = icmp sle i32 %13, %3
  %125 = select i1 %123, i1 %124, i1 false
  br i1 %125, label %126, label %134

126:                                              ; preds = %121
  %127 = add nsw i32 %29, %120
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %128
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !7, !amdgpu.noclobber !6
  %131 = zext i8 %130 to i32
  %132 = add nuw nsw i32 %116, %131
  %133 = add nuw nsw i32 %115, 1
  br label %134

134:                                              ; preds = %126, %121, %114
  %135 = phi i1 [ %119, %126 ], [ %119, %121 ], [ false, %114 ]
  %136 = phi i32 [ %133, %126 ], [ %115, %121 ], [ %115, %114 ]
  %137 = phi i32 [ %132, %126 ], [ %116, %121 ], [ %116, %114 ]
  %138 = icmp sgt i32 %13, -1
  %139 = select i1 %135, i1 %138, i1 false
  br i1 %139, label %140, label %148

140:                                              ; preds = %134
  %141 = add nsw i32 %13, %120
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !7, !amdgpu.noclobber !6
  %145 = zext i8 %144 to i32
  %146 = add nuw nsw i32 %137, %145
  %147 = add nuw nsw i32 %136, 1
  br label %148

148:                                              ; preds = %140, %134
  %149 = phi i32 [ %147, %140 ], [ %136, %134 ]
  %150 = phi i32 [ %146, %140 ], [ %137, %134 ]
  br i1 %118, label %151, label %164

151:                                              ; preds = %148
  %152 = icmp sgt i32 %13, -2
  %153 = select i1 %119, i1 %152, i1 false
  %154 = icmp slt i32 %56, %3
  %155 = select i1 %153, i1 %154, i1 false
  br i1 %155, label %156, label %164

156:                                              ; preds = %151
  %157 = add nsw i32 %56, %120
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %158
  %160 = load i8, i8 addrspace(1)* %159, align 1, !tbaa !7, !amdgpu.noclobber !6
  %161 = zext i8 %160 to i32
  %162 = add nuw nsw i32 %150, %161
  %163 = add nuw nsw i32 %149, 1
  br label %164

164:                                              ; preds = %156, %151, %148
  %165 = phi i32 [ %163, %156 ], [ %149, %151 ], [ %149, %148 ]
  %166 = phi i32 [ %162, %156 ], [ %150, %151 ], [ %150, %148 ]
  %167 = trunc i32 %166 to i16
  %168 = trunc i32 %165 to i16
  %169 = udiv i16 %167, %168
  %170 = trunc i16 %169 to i8
  %171 = add nsw i32 %73, %13
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %172
  store i8 %170, i8 addrspace(1)* %173, align 1, !tbaa !7
  br label %174

174:                                              ; preds = %164, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
