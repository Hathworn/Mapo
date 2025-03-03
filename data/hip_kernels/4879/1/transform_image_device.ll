; ModuleID = '../data/hip_kernels/4879/1/main.cu'
source_filename = "../data/hip_kernels/4879/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15transform_imagePfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = freeze i32 %13
  %15 = freeze i32 %2
  %16 = sdiv i32 %14, %15
  %17 = add nsw i32 %16, -1
  %18 = mul i32 %16, %15
  %19 = sub i32 %14, %18
  %20 = add nsw i32 %19, -1
  %21 = mul nsw i32 %3, 9
  %22 = add nsw i32 %21, 1
  %23 = mul nsw i32 %13, %22
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %65

25:                                               ; preds = %4
  %26 = icmp slt i32 %16, 1
  %27 = icmp eq i32 %17, %2
  %28 = select i1 %26, i1 true, i1 %27
  %29 = icmp slt i32 %19, 1
  %30 = icmp eq i32 %20, %2
  %31 = select i1 %29, i1 true, i1 %30
  %32 = icmp slt i32 %19, 0
  %33 = add nsw i32 %19, 1
  %34 = icmp slt i32 %19, -1
  %35 = icmp eq i32 %33, %2
  %36 = select i1 %34, i1 true, i1 %35
  %37 = icmp slt i32 %16, 0
  %38 = icmp eq i32 %16, %2
  %39 = or i1 %37, %38
  %40 = icmp slt i32 %19, 1
  %41 = icmp eq i32 %20, %2
  %42 = select i1 %40, i1 true, i1 %41
  %43 = icmp slt i32 %19, 0
  %44 = add nsw i32 %19, 1
  %45 = icmp slt i32 %19, -1
  %46 = icmp eq i32 %44, %2
  %47 = select i1 %45, i1 true, i1 %46
  %48 = add nsw i32 %16, 1
  %49 = icmp slt i32 %16, -1
  %50 = icmp eq i32 %48, %2
  %51 = select i1 %49, i1 true, i1 %50
  %52 = icmp slt i32 %19, 1
  %53 = icmp eq i32 %20, %2
  %54 = select i1 %52, i1 true, i1 %53
  %55 = icmp slt i32 %19, 0
  %56 = add nsw i32 %19, 1
  %57 = icmp slt i32 %19, -1
  %58 = icmp eq i32 %56, %2
  %59 = select i1 %57, i1 true, i1 %58
  br label %60

60:                                               ; preds = %25, %174
  %61 = phi i32 [ 0, %25 ], [ %175, %174 ]
  %62 = mul i32 %61, %2
  %63 = mul nsw i32 %61, 9
  %64 = add nsw i32 %63, %23
  br i1 %28, label %103, label %71

65:                                               ; preds = %174, %4
  %66 = add nsw i32 %13, 1
  %67 = mul nsw i32 %66, %22
  %68 = add nsw i32 %67, -1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float 1.000000e+00, float addrspace(1)* %70, align 4, !tbaa !7
  ret void

71:                                               ; preds = %60
  %72 = add i32 %17, %62
  %73 = mul i32 %72, %2
  br i1 %31, label %81, label %74

74:                                               ; preds = %71
  %75 = add i32 %20, %73
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = sext i32 %64 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  store float %78, float addrspace(1)* %80, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %74, %71
  %82 = phi i32 [ 0, %71 ], [ 1, %74 ]
  br i1 %32, label %92, label %83

83:                                               ; preds = %81
  %84 = add i32 %19, %73
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %64, %82
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = add nuw nsw i32 %82, 1
  br label %92

92:                                               ; preds = %83, %81
  %93 = phi i32 [ %82, %81 ], [ %91, %83 ]
  br i1 %36, label %103, label %94

94:                                               ; preds = %92
  %95 = add i32 %33, %73
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = add nsw i32 %64, %93
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !7
  %102 = add nuw nsw i32 %93, 1
  br label %103

103:                                              ; preds = %60, %92, %94
  %104 = phi i32 [ 0, %60 ], [ %93, %92 ], [ %102, %94 ]
  br i1 %39, label %139, label %105

105:                                              ; preds = %103
  %106 = add i32 %16, %62
  %107 = mul i32 %106, %2
  br i1 %42, label %117, label %108

108:                                              ; preds = %105
  %109 = add i32 %20, %107
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = add nsw i32 %64, %104
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %112, float addrspace(1)* %115, align 4, !tbaa !7
  %116 = add nuw nsw i32 %104, 1
  br label %117

117:                                              ; preds = %105, %108
  %118 = phi i32 [ %104, %105 ], [ %116, %108 ]
  br i1 %43, label %128, label %119

119:                                              ; preds = %117
  %120 = add i32 %19, %107
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = add nsw i32 %64, %118
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  store float %123, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = add nuw nsw i32 %118, 1
  br label %128

128:                                              ; preds = %119, %117
  %129 = phi i32 [ %118, %117 ], [ %127, %119 ]
  br i1 %47, label %139, label %130

130:                                              ; preds = %128
  %131 = add i32 %44, %107
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = add nsw i32 %64, %129
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  store float %134, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = add nuw nsw i32 %129, 1
  br label %139

139:                                              ; preds = %130, %128, %103
  %140 = phi i32 [ %104, %103 ], [ %129, %128 ], [ %138, %130 ]
  br i1 %51, label %174, label %141

141:                                              ; preds = %139
  %142 = add i32 %48, %62
  %143 = mul i32 %142, %2
  br i1 %54, label %153, label %144

144:                                              ; preds = %141
  %145 = add i32 %20, %143
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = add nsw i32 %64, %140
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %148, float addrspace(1)* %151, align 4, !tbaa !7
  %152 = add nuw nsw i32 %140, 1
  br label %153

153:                                              ; preds = %141, %144
  %154 = phi i32 [ %140, %141 ], [ %152, %144 ]
  br i1 %55, label %164, label %155

155:                                              ; preds = %153
  %156 = add i32 %19, %143
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = add nsw i32 %64, %154
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  store float %159, float addrspace(1)* %162, align 4, !tbaa !7
  %163 = add nuw nsw i32 %154, 1
  br label %164

164:                                              ; preds = %155, %153
  %165 = phi i32 [ %154, %153 ], [ %163, %155 ]
  br i1 %59, label %174, label %166

166:                                              ; preds = %164
  %167 = add i32 %56, %143
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = add nsw i32 %64, %165
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  store float %170, float addrspace(1)* %173, align 4, !tbaa !7
  br label %174

174:                                              ; preds = %166, %164, %139
  %175 = add nuw nsw i32 %61, 1
  %176 = icmp eq i32 %175, %3
  br i1 %176, label %65, label %60, !llvm.loop !11
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
