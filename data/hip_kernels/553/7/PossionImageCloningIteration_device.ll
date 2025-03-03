; ModuleID = '../data/hip_kernels/553/7/main.cu'
source_filename = "../data/hip_kernels/553/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28PossionImageCloningIterationPKfPKiPfS3_ii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %15, %4
  %25 = add nsw i32 %24, %23
  %26 = icmp slt i32 %15, %5
  %27 = icmp slt i32 %23, %4
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %588

29:                                               ; preds = %6
  %30 = add nsw i32 %23, -2
  %31 = add nsw i32 %15, -2
  %32 = mul nsw i32 %31, %4
  %33 = add nsw i32 %32, %30
  %34 = icmp sgt i32 %23, 1
  br i1 %34, label %35, label %62

35:                                               ; preds = %29
  %36 = icmp slt i32 %30, %4
  %37 = icmp sgt i32 %15, 1
  %38 = select i1 %36, i1 %37, i1 false
  %39 = icmp slt i32 %31, %5
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %62

41:                                               ; preds = %35
  %42 = sext i32 %33 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %62, label %46

46:                                               ; preds = %41
  %47 = mul nsw i32 %33, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = fadd contract float %50, 0.000000e+00
  %52 = add nsw i32 %47, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11, !amdgpu.noclobber !5
  %56 = fadd contract float %55, 0.000000e+00
  %57 = add nsw i32 %47, 2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !5
  %61 = fadd contract float %60, 0.000000e+00
  br label %62

62:                                               ; preds = %46, %41, %35, %29
  %63 = phi float [ %61, %46 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ], [ 0.000000e+00, %29 ]
  %64 = phi float [ %56, %46 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ], [ 0.000000e+00, %29 ]
  %65 = phi float [ %51, %46 ], [ 0.000000e+00, %41 ], [ 0.000000e+00, %35 ], [ 0.000000e+00, %29 ]
  %66 = add nsw i32 %32, %23
  %67 = icmp sgt i32 %23, -1
  br i1 %67, label %68, label %93

68:                                               ; preds = %62
  %69 = icmp sgt i32 %15, 1
  %70 = icmp slt i32 %31, %5
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %93

72:                                               ; preds = %68
  %73 = sext i32 %66 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %93, label %77

77:                                               ; preds = %72
  %78 = mul nsw i32 %66, 3
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  %82 = fadd contract float %65, %81
  %83 = add nsw i32 %78, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !5
  %87 = fadd contract float %64, %86
  %88 = add nsw i32 %78, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11, !amdgpu.noclobber !5
  %92 = fadd contract float %63, %91
  br label %93

93:                                               ; preds = %77, %72, %68, %62
  %94 = phi float [ %92, %77 ], [ %63, %72 ], [ %63, %68 ], [ %63, %62 ]
  %95 = phi float [ %87, %77 ], [ %64, %72 ], [ %64, %68 ], [ %64, %62 ]
  %96 = phi float [ %82, %77 ], [ %65, %72 ], [ %65, %68 ], [ %65, %62 ]
  %97 = add nsw i32 %23, 2
  %98 = add nsw i32 %32, %97
  %99 = icmp sgt i32 %23, -3
  br i1 %99, label %100, label %127

100:                                              ; preds = %93
  %101 = icmp slt i32 %97, %4
  %102 = icmp sgt i32 %15, 1
  %103 = select i1 %101, i1 %102, i1 false
  %104 = icmp slt i32 %31, %5
  %105 = select i1 %103, i1 %104, i1 false
  br i1 %105, label %106, label %127

106:                                              ; preds = %100
  %107 = sext i32 %98 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %127, label %111

111:                                              ; preds = %106
  %112 = mul nsw i32 %98, 3
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11, !amdgpu.noclobber !5
  %116 = fadd contract float %96, %115
  %117 = add nsw i32 %112, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !11, !amdgpu.noclobber !5
  %121 = fadd contract float %95, %120
  %122 = add nsw i32 %112, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !5
  %126 = fadd contract float %94, %125
  br label %127

127:                                              ; preds = %111, %106, %100, %93
  %128 = phi float [ %126, %111 ], [ %94, %106 ], [ %94, %100 ], [ %94, %93 ]
  %129 = phi float [ %121, %111 ], [ %95, %106 ], [ %95, %100 ], [ %95, %93 ]
  %130 = phi float [ %116, %111 ], [ %96, %106 ], [ %96, %100 ], [ %96, %93 ]
  %131 = add nsw i32 %23, -1
  %132 = add nsw i32 %15, -1
  %133 = mul nsw i32 %132, %4
  %134 = add nsw i32 %133, %131
  %135 = icmp sgt i32 %23, 0
  br i1 %135, label %136, label %166

136:                                              ; preds = %127
  %137 = icmp sle i32 %23, %4
  %138 = icmp sgt i32 %15, 0
  %139 = select i1 %137, i1 %138, i1 false
  %140 = icmp sle i32 %15, %5
  %141 = select i1 %139, i1 %140, i1 false
  br i1 %141, label %142, label %166

142:                                              ; preds = %136
  %143 = sext i32 %134 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %166, label %147

147:                                              ; preds = %142
  %148 = mul nsw i32 %134, 3
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !11, !amdgpu.noclobber !5
  %152 = fmul contract float %151, 2.000000e+00
  %153 = fadd contract float %130, %152
  %154 = add nsw i32 %148, 1
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !11, !amdgpu.noclobber !5
  %158 = fmul contract float %157, 2.000000e+00
  %159 = fadd contract float %129, %158
  %160 = add nsw i32 %148, 2
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !11, !amdgpu.noclobber !5
  %164 = fmul contract float %163, 2.000000e+00
  %165 = fadd contract float %128, %164
  br label %166

166:                                              ; preds = %147, %142, %136, %127
  %167 = phi float [ %165, %147 ], [ %128, %142 ], [ %128, %136 ], [ %128, %127 ]
  %168 = phi float [ %159, %147 ], [ %129, %142 ], [ %129, %136 ], [ %129, %127 ]
  %169 = phi float [ %153, %147 ], [ %130, %142 ], [ %130, %136 ], [ %130, %127 ]
  %170 = add nsw i32 %133, %23
  br i1 %67, label %171, label %199

171:                                              ; preds = %166
  %172 = icmp sgt i32 %15, 0
  %173 = icmp sle i32 %15, %5
  %174 = select i1 %172, i1 %173, i1 false
  br i1 %174, label %175, label %199

175:                                              ; preds = %171
  %176 = sext i32 %170 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %176
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !5
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %199, label %180

180:                                              ; preds = %175
  %181 = mul nsw i32 %170, 3
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %2, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !11, !amdgpu.noclobber !5
  %185 = fmul contract float %184, 2.000000e+00
  %186 = fadd contract float %169, %185
  %187 = add nsw i32 %181, 1
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %2, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !11, !amdgpu.noclobber !5
  %191 = fmul contract float %190, 2.000000e+00
  %192 = fadd contract float %168, %191
  %193 = add nsw i32 %181, 2
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !11, !amdgpu.noclobber !5
  %197 = fmul contract float %196, 2.000000e+00
  %198 = fadd contract float %167, %197
  br label %199

199:                                              ; preds = %180, %175, %171, %166
  %200 = phi float [ %198, %180 ], [ %167, %175 ], [ %167, %171 ], [ %167, %166 ]
  %201 = phi float [ %192, %180 ], [ %168, %175 ], [ %168, %171 ], [ %168, %166 ]
  %202 = phi float [ %186, %180 ], [ %169, %175 ], [ %169, %171 ], [ %169, %166 ]
  %203 = add nsw i32 %23, 1
  %204 = add nsw i32 %133, %203
  %205 = icmp sgt i32 %23, -2
  br i1 %205, label %206, label %236

206:                                              ; preds = %199
  %207 = icmp slt i32 %203, %4
  %208 = icmp sgt i32 %15, 0
  %209 = select i1 %207, i1 %208, i1 false
  %210 = icmp sle i32 %15, %5
  %211 = select i1 %209, i1 %210, i1 false
  br i1 %211, label %212, label %236

212:                                              ; preds = %206
  %213 = sext i32 %204 to i64
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %213
  %215 = load i32, i32 addrspace(1)* %214, align 4, !tbaa !7, !amdgpu.noclobber !5
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %236, label %217

217:                                              ; preds = %212
  %218 = mul nsw i32 %204, 3
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %2, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !11, !amdgpu.noclobber !5
  %222 = fmul contract float %221, 2.000000e+00
  %223 = fadd contract float %202, %222
  %224 = add nsw i32 %218, 1
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !11, !amdgpu.noclobber !5
  %228 = fmul contract float %227, 2.000000e+00
  %229 = fadd contract float %201, %228
  %230 = add nsw i32 %218, 2
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %2, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !11, !amdgpu.noclobber !5
  %234 = fmul contract float %233, 2.000000e+00
  %235 = fadd contract float %200, %234
  br label %236

236:                                              ; preds = %217, %212, %206, %199
  %237 = phi float [ %235, %217 ], [ %200, %212 ], [ %200, %206 ], [ %200, %199 ]
  %238 = phi float [ %229, %217 ], [ %201, %212 ], [ %201, %206 ], [ %201, %199 ]
  %239 = phi float [ %223, %217 ], [ %202, %212 ], [ %202, %206 ], [ %202, %199 ]
  %240 = add nsw i32 %24, %30
  br i1 %34, label %241, label %266

241:                                              ; preds = %236
  %242 = icmp slt i32 %30, %4
  %243 = icmp sgt i32 %15, -1
  %244 = select i1 %242, i1 %243, i1 false
  br i1 %244, label %245, label %266

245:                                              ; preds = %241
  %246 = sext i32 %240 to i64
  %247 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %246
  %248 = load i32, i32 addrspace(1)* %247, align 4, !tbaa !7, !amdgpu.noclobber !5
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %266, label %250

250:                                              ; preds = %245
  %251 = mul nsw i32 %240, 3
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %2, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !11, !amdgpu.noclobber !5
  %255 = fadd contract float %239, %254
  %256 = add nsw i32 %251, 1
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %2, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !11, !amdgpu.noclobber !5
  %260 = fadd contract float %238, %259
  %261 = add nsw i32 %251, 2
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %2, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !11, !amdgpu.noclobber !5
  %265 = fadd contract float %237, %264
  br label %266

266:                                              ; preds = %250, %245, %241, %236
  %267 = phi float [ %265, %250 ], [ %237, %245 ], [ %237, %241 ], [ %237, %236 ]
  %268 = phi float [ %260, %250 ], [ %238, %245 ], [ %238, %241 ], [ %238, %236 ]
  %269 = phi float [ %255, %250 ], [ %239, %245 ], [ %239, %241 ], [ %239, %236 ]
  %270 = add nsw i32 %24, %131
  br i1 %135, label %271, label %299

271:                                              ; preds = %266
  %272 = icmp sle i32 %23, %4
  %273 = icmp sgt i32 %15, -1
  %274 = select i1 %272, i1 %273, i1 false
  br i1 %274, label %275, label %299

275:                                              ; preds = %271
  %276 = sext i32 %270 to i64
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %276
  %278 = load i32, i32 addrspace(1)* %277, align 4, !tbaa !7, !amdgpu.noclobber !5
  %279 = icmp eq i32 %278, 0
  br i1 %279, label %299, label %280

280:                                              ; preds = %275
  %281 = mul nsw i32 %270, 3
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %2, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !11, !amdgpu.noclobber !5
  %285 = fmul contract float %284, 2.000000e+00
  %286 = fadd contract float %269, %285
  %287 = add nsw i32 %281, 1
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %2, i64 %288
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !11, !amdgpu.noclobber !5
  %291 = fmul contract float %290, 2.000000e+00
  %292 = fadd contract float %268, %291
  %293 = add nsw i32 %281, 2
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %2, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !11, !amdgpu.noclobber !5
  %297 = fmul contract float %296, 2.000000e+00
  %298 = fadd contract float %267, %297
  br label %299

299:                                              ; preds = %280, %275, %271, %266
  %300 = phi float [ %298, %280 ], [ %267, %275 ], [ %267, %271 ], [ %267, %266 ]
  %301 = phi float [ %292, %280 ], [ %268, %275 ], [ %268, %271 ], [ %268, %266 ]
  %302 = phi float [ %286, %280 ], [ %269, %275 ], [ %269, %271 ], [ %269, %266 ]
  %303 = add nsw i32 %24, %203
  br i1 %205, label %304, label %332

304:                                              ; preds = %299
  %305 = icmp slt i32 %203, %4
  %306 = icmp sgt i32 %15, -1
  %307 = select i1 %305, i1 %306, i1 false
  br i1 %307, label %308, label %332

308:                                              ; preds = %304
  %309 = sext i32 %303 to i64
  %310 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %309
  %311 = load i32, i32 addrspace(1)* %310, align 4, !tbaa !7, !amdgpu.noclobber !5
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %332, label %313

313:                                              ; preds = %308
  %314 = mul nsw i32 %303, 3
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %2, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !11, !amdgpu.noclobber !5
  %318 = fmul contract float %317, 2.000000e+00
  %319 = fadd contract float %302, %318
  %320 = add nsw i32 %314, 1
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %2, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !11, !amdgpu.noclobber !5
  %324 = fmul contract float %323, 2.000000e+00
  %325 = fadd contract float %301, %324
  %326 = add nsw i32 %314, 2
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %2, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !11, !amdgpu.noclobber !5
  %330 = fmul contract float %329, 2.000000e+00
  %331 = fadd contract float %300, %330
  br label %332

332:                                              ; preds = %313, %308, %304, %299
  %333 = phi float [ %331, %313 ], [ %300, %308 ], [ %300, %304 ], [ %300, %299 ]
  %334 = phi float [ %325, %313 ], [ %301, %308 ], [ %301, %304 ], [ %301, %299 ]
  %335 = phi float [ %319, %313 ], [ %302, %308 ], [ %302, %304 ], [ %302, %299 ]
  %336 = add nsw i32 %24, %97
  br i1 %99, label %337, label %362

337:                                              ; preds = %332
  %338 = icmp slt i32 %97, %4
  %339 = icmp sgt i32 %15, -1
  %340 = select i1 %338, i1 %339, i1 false
  br i1 %340, label %341, label %362

341:                                              ; preds = %337
  %342 = sext i32 %336 to i64
  %343 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %342
  %344 = load i32, i32 addrspace(1)* %343, align 4, !tbaa !7, !amdgpu.noclobber !5
  %345 = icmp eq i32 %344, 0
  br i1 %345, label %362, label %346

346:                                              ; preds = %341
  %347 = mul nsw i32 %336, 3
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %2, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !11, !amdgpu.noclobber !5
  %351 = fadd contract float %335, %350
  %352 = add nsw i32 %347, 1
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %2, i64 %353
  %355 = load float, float addrspace(1)* %354, align 4, !tbaa !11, !amdgpu.noclobber !5
  %356 = fadd contract float %334, %355
  %357 = add nsw i32 %347, 2
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %2, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !11, !amdgpu.noclobber !5
  %361 = fadd contract float %333, %360
  br label %362

362:                                              ; preds = %346, %341, %337, %332
  %363 = phi float [ %361, %346 ], [ %333, %341 ], [ %333, %337 ], [ %333, %332 ]
  %364 = phi float [ %356, %346 ], [ %334, %341 ], [ %334, %337 ], [ %334, %332 ]
  %365 = phi float [ %351, %346 ], [ %335, %341 ], [ %335, %337 ], [ %335, %332 ]
  %366 = add nsw i32 %15, 1
  %367 = mul nsw i32 %366, %4
  %368 = add nsw i32 %367, %131
  br i1 %135, label %369, label %399

369:                                              ; preds = %362
  %370 = icmp sle i32 %23, %4
  %371 = icmp sgt i32 %15, -2
  %372 = select i1 %370, i1 %371, i1 false
  %373 = icmp slt i32 %366, %5
  %374 = select i1 %372, i1 %373, i1 false
  br i1 %374, label %375, label %399

375:                                              ; preds = %369
  %376 = sext i32 %368 to i64
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %376
  %378 = load i32, i32 addrspace(1)* %377, align 4, !tbaa !7, !amdgpu.noclobber !5
  %379 = icmp eq i32 %378, 0
  br i1 %379, label %399, label %380

380:                                              ; preds = %375
  %381 = mul nsw i32 %368, 3
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds float, float addrspace(1)* %2, i64 %382
  %384 = load float, float addrspace(1)* %383, align 4, !tbaa !11, !amdgpu.noclobber !5
  %385 = fmul contract float %384, 2.000000e+00
  %386 = fadd contract float %365, %385
  %387 = add nsw i32 %381, 1
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float addrspace(1)* %2, i64 %388
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !11, !amdgpu.noclobber !5
  %391 = fmul contract float %390, 2.000000e+00
  %392 = fadd contract float %364, %391
  %393 = add nsw i32 %381, 2
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %2, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !11, !amdgpu.noclobber !5
  %397 = fmul contract float %396, 2.000000e+00
  %398 = fadd contract float %363, %397
  br label %399

399:                                              ; preds = %380, %375, %369, %362
  %400 = phi float [ %398, %380 ], [ %363, %375 ], [ %363, %369 ], [ %363, %362 ]
  %401 = phi float [ %392, %380 ], [ %364, %375 ], [ %364, %369 ], [ %364, %362 ]
  %402 = phi float [ %386, %380 ], [ %365, %375 ], [ %365, %369 ], [ %365, %362 ]
  %403 = add nsw i32 %367, %23
  br i1 %67, label %404, label %432

404:                                              ; preds = %399
  %405 = icmp sgt i32 %15, -2
  %406 = icmp slt i32 %366, %5
  %407 = select i1 %405, i1 %406, i1 false
  br i1 %407, label %408, label %432

408:                                              ; preds = %404
  %409 = sext i32 %403 to i64
  %410 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %409
  %411 = load i32, i32 addrspace(1)* %410, align 4, !tbaa !7, !amdgpu.noclobber !5
  %412 = icmp eq i32 %411, 0
  br i1 %412, label %432, label %413

413:                                              ; preds = %408
  %414 = mul nsw i32 %403, 3
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %2, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !11, !amdgpu.noclobber !5
  %418 = fmul contract float %417, 2.000000e+00
  %419 = fadd contract float %402, %418
  %420 = add nsw i32 %414, 1
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %2, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !11, !amdgpu.noclobber !5
  %424 = fmul contract float %423, 2.000000e+00
  %425 = fadd contract float %401, %424
  %426 = add nsw i32 %414, 2
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %2, i64 %427
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !11, !amdgpu.noclobber !5
  %430 = fmul contract float %429, 2.000000e+00
  %431 = fadd contract float %400, %430
  br label %432

432:                                              ; preds = %413, %408, %404, %399
  %433 = phi float [ %431, %413 ], [ %400, %408 ], [ %400, %404 ], [ %400, %399 ]
  %434 = phi float [ %425, %413 ], [ %401, %408 ], [ %401, %404 ], [ %401, %399 ]
  %435 = phi float [ %419, %413 ], [ %402, %408 ], [ %402, %404 ], [ %402, %399 ]
  %436 = add nsw i32 %367, %203
  br i1 %205, label %437, label %467

437:                                              ; preds = %432
  %438 = icmp slt i32 %203, %4
  %439 = icmp sgt i32 %15, -2
  %440 = select i1 %438, i1 %439, i1 false
  %441 = icmp slt i32 %366, %5
  %442 = select i1 %440, i1 %441, i1 false
  br i1 %442, label %443, label %467

443:                                              ; preds = %437
  %444 = sext i32 %436 to i64
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %444
  %446 = load i32, i32 addrspace(1)* %445, align 4, !tbaa !7, !amdgpu.noclobber !5
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %467, label %448

448:                                              ; preds = %443
  %449 = mul nsw i32 %436, 3
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds float, float addrspace(1)* %2, i64 %450
  %452 = load float, float addrspace(1)* %451, align 4, !tbaa !11, !amdgpu.noclobber !5
  %453 = fmul contract float %452, 2.000000e+00
  %454 = fadd contract float %435, %453
  %455 = add nsw i32 %449, 1
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %2, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !11, !amdgpu.noclobber !5
  %459 = fmul contract float %458, 2.000000e+00
  %460 = fadd contract float %434, %459
  %461 = add nsw i32 %449, 2
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds float, float addrspace(1)* %2, i64 %462
  %464 = load float, float addrspace(1)* %463, align 4, !tbaa !11, !amdgpu.noclobber !5
  %465 = fmul contract float %464, 2.000000e+00
  %466 = fadd contract float %433, %465
  br label %467

467:                                              ; preds = %448, %443, %437, %432
  %468 = phi float [ %466, %448 ], [ %433, %443 ], [ %433, %437 ], [ %433, %432 ]
  %469 = phi float [ %460, %448 ], [ %434, %443 ], [ %434, %437 ], [ %434, %432 ]
  %470 = phi float [ %454, %448 ], [ %435, %443 ], [ %435, %437 ], [ %435, %432 ]
  %471 = add nsw i32 %15, 2
  %472 = mul nsw i32 %471, %4
  %473 = add nsw i32 %472, %30
  br i1 %34, label %474, label %501

474:                                              ; preds = %467
  %475 = icmp slt i32 %30, %4
  %476 = icmp sgt i32 %15, -3
  %477 = select i1 %475, i1 %476, i1 false
  %478 = icmp slt i32 %471, %5
  %479 = select i1 %477, i1 %478, i1 false
  br i1 %479, label %480, label %501

480:                                              ; preds = %474
  %481 = sext i32 %473 to i64
  %482 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %481
  %483 = load i32, i32 addrspace(1)* %482, align 4, !tbaa !7, !amdgpu.noclobber !5
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %501, label %485

485:                                              ; preds = %480
  %486 = mul nsw i32 %473, 3
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds float, float addrspace(1)* %2, i64 %487
  %489 = load float, float addrspace(1)* %488, align 4, !tbaa !11, !amdgpu.noclobber !5
  %490 = fadd contract float %470, %489
  %491 = add nsw i32 %486, 1
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds float, float addrspace(1)* %2, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !11, !amdgpu.noclobber !5
  %495 = fadd contract float %469, %494
  %496 = add nsw i32 %486, 2
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float addrspace(1)* %2, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !11, !amdgpu.noclobber !5
  %500 = fadd contract float %468, %499
  br label %501

501:                                              ; preds = %485, %480, %474, %467
  %502 = phi float [ %500, %485 ], [ %468, %480 ], [ %468, %474 ], [ %468, %467 ]
  %503 = phi float [ %495, %485 ], [ %469, %480 ], [ %469, %474 ], [ %469, %467 ]
  %504 = phi float [ %490, %485 ], [ %470, %480 ], [ %470, %474 ], [ %470, %467 ]
  %505 = add nsw i32 %472, %23
  br i1 %67, label %506, label %531

506:                                              ; preds = %501
  %507 = icmp sgt i32 %15, -3
  %508 = icmp slt i32 %471, %5
  %509 = select i1 %507, i1 %508, i1 false
  br i1 %509, label %510, label %531

510:                                              ; preds = %506
  %511 = sext i32 %505 to i64
  %512 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %511
  %513 = load i32, i32 addrspace(1)* %512, align 4, !tbaa !7, !amdgpu.noclobber !5
  %514 = icmp eq i32 %513, 0
  br i1 %514, label %531, label %515

515:                                              ; preds = %510
  %516 = mul nsw i32 %505, 3
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %2, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !11, !amdgpu.noclobber !5
  %520 = fadd contract float %504, %519
  %521 = add nsw i32 %516, 1
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds float, float addrspace(1)* %2, i64 %522
  %524 = load float, float addrspace(1)* %523, align 4, !tbaa !11, !amdgpu.noclobber !5
  %525 = fadd contract float %503, %524
  %526 = add nsw i32 %516, 2
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %2, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !11, !amdgpu.noclobber !5
  %530 = fadd contract float %502, %529
  br label %531

531:                                              ; preds = %515, %510, %506, %501
  %532 = phi float [ %530, %515 ], [ %502, %510 ], [ %502, %506 ], [ %502, %501 ]
  %533 = phi float [ %525, %515 ], [ %503, %510 ], [ %503, %506 ], [ %503, %501 ]
  %534 = phi float [ %520, %515 ], [ %504, %510 ], [ %504, %506 ], [ %504, %501 ]
  %535 = add nsw i32 %472, %97
  br i1 %99, label %536, label %563

536:                                              ; preds = %531
  %537 = icmp slt i32 %97, %4
  %538 = icmp sgt i32 %15, -3
  %539 = select i1 %537, i1 %538, i1 false
  %540 = icmp slt i32 %471, %5
  %541 = select i1 %539, i1 %540, i1 false
  br i1 %541, label %542, label %563

542:                                              ; preds = %536
  %543 = sext i32 %535 to i64
  %544 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %543
  %545 = load i32, i32 addrspace(1)* %544, align 4, !tbaa !7, !amdgpu.noclobber !5
  %546 = icmp eq i32 %545, 0
  br i1 %546, label %563, label %547

547:                                              ; preds = %542
  %548 = mul nsw i32 %535, 3
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %2, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !11, !amdgpu.noclobber !5
  %552 = fadd contract float %534, %551
  %553 = add nsw i32 %548, 1
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %2, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !11, !amdgpu.noclobber !5
  %557 = fadd contract float %533, %556
  %558 = add nsw i32 %548, 2
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %2, i64 %559
  %561 = load float, float addrspace(1)* %560, align 4, !tbaa !11, !amdgpu.noclobber !5
  %562 = fadd contract float %532, %561
  br label %563

563:                                              ; preds = %547, %542, %536, %531
  %564 = phi float [ %562, %547 ], [ %532, %542 ], [ %532, %536 ], [ %532, %531 ]
  %565 = phi float [ %557, %547 ], [ %533, %542 ], [ %533, %536 ], [ %533, %531 ]
  %566 = phi float [ %552, %547 ], [ %534, %542 ], [ %534, %536 ], [ %534, %531 ]
  %567 = mul nsw i32 %25, 3
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %0, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !11, !amdgpu.noclobber !5
  %571 = fdiv contract float %566, 2.400000e+01
  %572 = fadd contract float %571, %570
  %573 = getelementptr inbounds float, float addrspace(1)* %3, i64 %568
  store float %572, float addrspace(1)* %573, align 4, !tbaa !11
  %574 = add nsw i32 %567, 1
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %0, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !11
  %578 = fdiv contract float %565, 2.400000e+01
  %579 = fadd contract float %578, %577
  %580 = getelementptr inbounds float, float addrspace(1)* %3, i64 %575
  store float %579, float addrspace(1)* %580, align 4, !tbaa !11
  %581 = add nsw i32 %567, 2
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %0, i64 %582
  %584 = load float, float addrspace(1)* %583, align 4, !tbaa !11
  %585 = fdiv contract float %564, 2.400000e+01
  %586 = fadd contract float %585, %584
  %587 = getelementptr inbounds float, float addrspace(1)* %3, i64 %582
  store float %586, float addrspace(1)* %587, align 4, !tbaa !11
  br label %588

588:                                              ; preds = %563, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
