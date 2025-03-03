; ModuleID = '../data/hip_kernels/4879/3/main.cu'
source_filename = "../data/hip_kernels/4879/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9transformPfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  br i1 %24, label %25, label %85

25:                                               ; preds = %4
  %26 = icmp slt i32 %16, 1
  %27 = icmp eq i32 %17, %2
  %28 = select i1 %26, i1 true, i1 %27
  %29 = mul nsw i32 %17, %2
  %30 = icmp slt i32 %19, 1
  %31 = icmp eq i32 %20, %2
  %32 = select i1 %30, i1 true, i1 %31
  %33 = add nsw i32 %20, %29
  %34 = mul nsw i32 %33, %3
  %35 = icmp slt i32 %19, 0
  %36 = add nsw i32 %19, %29
  %37 = mul nsw i32 %36, %3
  %38 = add nsw i32 %19, 1
  %39 = icmp slt i32 %19, -1
  %40 = icmp eq i32 %38, %2
  %41 = select i1 %39, i1 true, i1 %40
  %42 = add nsw i32 %38, %29
  %43 = mul nsw i32 %42, %3
  %44 = icmp slt i32 %16, 0
  %45 = icmp eq i32 %16, %2
  %46 = or i1 %44, %45
  %47 = mul nsw i32 %16, %2
  %48 = icmp slt i32 %19, 1
  %49 = icmp eq i32 %20, %2
  %50 = select i1 %48, i1 true, i1 %49
  %51 = add nsw i32 %20, %47
  %52 = mul nsw i32 %51, %3
  %53 = icmp slt i32 %19, 0
  %54 = add nsw i32 %19, %47
  %55 = mul nsw i32 %54, %3
  %56 = add nsw i32 %19, 1
  %57 = icmp slt i32 %19, -1
  %58 = icmp eq i32 %56, %2
  %59 = select i1 %57, i1 true, i1 %58
  %60 = add nsw i32 %56, %47
  %61 = mul nsw i32 %60, %3
  %62 = add nsw i32 %16, 1
  %63 = icmp slt i32 %16, -1
  %64 = icmp eq i32 %62, %2
  %65 = select i1 %63, i1 true, i1 %64
  %66 = mul nsw i32 %62, %2
  %67 = icmp slt i32 %19, 1
  %68 = icmp eq i32 %20, %2
  %69 = select i1 %67, i1 true, i1 %68
  %70 = add nsw i32 %20, %66
  %71 = mul nsw i32 %70, %3
  %72 = icmp slt i32 %19, 0
  %73 = add nsw i32 %19, %66
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %19, 1
  %76 = icmp slt i32 %19, -1
  %77 = icmp eq i32 %75, %2
  %78 = select i1 %76, i1 true, i1 %77
  %79 = add nsw i32 %75, %66
  %80 = mul nsw i32 %79, %3
  br label %81

81:                                               ; preds = %25, %206
  %82 = phi i32 [ 0, %25 ], [ %207, %206 ]
  %83 = mul nsw i32 %82, 9
  %84 = add nsw i32 %83, %23
  br i1 %28, label %127, label %91

85:                                               ; preds = %206, %4
  %86 = add nsw i32 %13, 1
  %87 = mul nsw i32 %86, %22
  %88 = add nsw i32 %87, -1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float 1.000000e+00, float addrspace(1)* %90, align 4, !tbaa !7
  ret void

91:                                               ; preds = %81
  br i1 %32, label %101, label %92

92:                                               ; preds = %91
  %93 = add nsw i32 %34, %82
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fcmp contract olt float %96, 0.000000e+00
  %98 = select contract i1 %97, float 0.000000e+00, float %96
  %99 = sext i32 %84 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float %98, float addrspace(1)* %100, align 4, !tbaa !7
  br label %101

101:                                              ; preds = %92, %91
  %102 = phi i32 [ 0, %91 ], [ 1, %92 ]
  br i1 %35, label %114, label %103

103:                                              ; preds = %101
  %104 = add nsw i32 %37, %82
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fcmp contract olt float %107, 0.000000e+00
  %109 = select contract i1 %108, float 0.000000e+00, float %107
  %110 = add nsw i32 %84, %102
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  store float %109, float addrspace(1)* %112, align 4, !tbaa !7
  %113 = add nuw nsw i32 %102, 1
  br label %114

114:                                              ; preds = %103, %101
  %115 = phi i32 [ %102, %101 ], [ %113, %103 ]
  br i1 %41, label %127, label %116

116:                                              ; preds = %114
  %117 = add nsw i32 %43, %82
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fcmp contract olt float %120, 0.000000e+00
  %122 = select contract i1 %121, float 0.000000e+00, float %120
  %123 = add nsw i32 %84, %115
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  store float %122, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = add nuw nsw i32 %115, 1
  br label %127

127:                                              ; preds = %81, %114, %116
  %128 = phi i32 [ 0, %81 ], [ %115, %114 ], [ %126, %116 ]
  br i1 %46, label %167, label %129

129:                                              ; preds = %127
  br i1 %50, label %141, label %130

130:                                              ; preds = %129
  %131 = add nsw i32 %52, %82
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fcmp contract olt float %134, 0.000000e+00
  %136 = select contract i1 %135, float 0.000000e+00, float %134
  %137 = add nsw i32 %84, %128
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  store float %136, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = add nuw nsw i32 %128, 1
  br label %141

141:                                              ; preds = %129, %130
  %142 = phi i32 [ %128, %129 ], [ %140, %130 ]
  br i1 %53, label %154, label %143

143:                                              ; preds = %141
  %144 = add nsw i32 %55, %82
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fcmp contract olt float %147, 0.000000e+00
  %149 = select contract i1 %148, float 0.000000e+00, float %147
  %150 = add nsw i32 %84, %142
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  store float %149, float addrspace(1)* %152, align 4, !tbaa !7
  %153 = add nuw nsw i32 %142, 1
  br label %154

154:                                              ; preds = %143, %141
  %155 = phi i32 [ %142, %141 ], [ %153, %143 ]
  br i1 %59, label %167, label %156

156:                                              ; preds = %154
  %157 = add nsw i32 %61, %82
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fcmp contract olt float %160, 0.000000e+00
  %162 = select contract i1 %161, float 0.000000e+00, float %160
  %163 = add nsw i32 %84, %155
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  store float %162, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = add nuw nsw i32 %155, 1
  br label %167

167:                                              ; preds = %156, %154, %127
  %168 = phi i32 [ %128, %127 ], [ %155, %154 ], [ %166, %156 ]
  br i1 %65, label %206, label %169

169:                                              ; preds = %167
  br i1 %69, label %181, label %170

170:                                              ; preds = %169
  %171 = add nsw i32 %71, %82
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fcmp contract olt float %174, 0.000000e+00
  %176 = select contract i1 %175, float 0.000000e+00, float %174
  %177 = add nsw i32 %84, %168
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  store float %176, float addrspace(1)* %179, align 4, !tbaa !7
  %180 = add nuw nsw i32 %168, 1
  br label %181

181:                                              ; preds = %169, %170
  %182 = phi i32 [ %168, %169 ], [ %180, %170 ]
  br i1 %72, label %194, label %183

183:                                              ; preds = %181
  %184 = add nsw i32 %74, %82
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !7
  %188 = fcmp contract olt float %187, 0.000000e+00
  %189 = select contract i1 %188, float 0.000000e+00, float %187
  %190 = add nsw i32 %84, %182
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  store float %189, float addrspace(1)* %192, align 4, !tbaa !7
  %193 = add nuw nsw i32 %182, 1
  br label %194

194:                                              ; preds = %183, %181
  %195 = phi i32 [ %182, %181 ], [ %193, %183 ]
  br i1 %78, label %206, label %196

196:                                              ; preds = %194
  %197 = add nsw i32 %80, %82
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %1, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %201 = fcmp contract olt float %200, 0.000000e+00
  %202 = select contract i1 %201, float 0.000000e+00, float %200
  %203 = add nsw i32 %84, %195
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  store float %202, float addrspace(1)* %205, align 4, !tbaa !7
  br label %206

206:                                              ; preds = %196, %194, %167
  %207 = add nuw nsw i32 %82, 1
  %208 = icmp eq i32 %207, %3
  br i1 %208, label %85, label %81, !llvm.loop !11
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
