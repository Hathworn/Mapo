; ModuleID = '../data/hip_kernels/7690/0/main.cu'
source_filename = "../data/hip_kernels/7690/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10blurKernelPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %1897

25:                                               ; preds = %4
  %26 = add nsw i32 %13, -5
  %27 = icmp sgt i32 %13, 4
  %28 = icmp slt i32 %26, %2
  %29 = add nsw i32 %13, -4
  %30 = icmp sgt i32 %13, 3
  %31 = icmp slt i32 %29, %2
  %32 = add nsw i32 %13, -3
  %33 = icmp sgt i32 %13, 2
  %34 = icmp slt i32 %32, %2
  %35 = add nsw i32 %13, -2
  %36 = icmp sgt i32 %13, 1
  %37 = icmp slt i32 %35, %2
  %38 = add nsw i32 %13, -1
  %39 = icmp sgt i32 %13, 0
  %40 = icmp sgt i32 %13, -1
  %41 = add nsw i32 %13, 1
  %42 = icmp sgt i32 %13, -2
  %43 = icmp slt i32 %41, %2
  %44 = add nsw i32 %13, 2
  %45 = icmp sgt i32 %13, -3
  %46 = icmp slt i32 %44, %2
  %47 = add nsw i32 %13, 3
  %48 = icmp sgt i32 %13, -4
  %49 = icmp slt i32 %47, %2
  %50 = add nsw i32 %13, 4
  %51 = icmp sgt i32 %13, -5
  %52 = icmp slt i32 %50, %2
  %53 = add nsw i32 %13, 5
  %54 = icmp sgt i32 %13, -6
  %55 = icmp slt i32 %53, %2
  %56 = add nsw i32 %21, -5
  %57 = icmp sgt i32 %21, 4
  %58 = icmp slt i32 %56, %3
  %59 = mul nsw i32 %56, %2
  %60 = select i1 %57, i1 %58, i1 false
  %61 = select i1 %60, i1 %27, i1 false
  %62 = select i1 %61, i1 %28, i1 false
  br i1 %62, label %63, label %70

63:                                               ; preds = %25
  %64 = add nsw i32 %26, %59
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fadd contract float %67, 0.000000e+00
  %69 = fptosi float %68 to i32
  br label %70

70:                                               ; preds = %63, %25
  %71 = phi i32 [ 1, %63 ], [ 0, %25 ]
  %72 = phi i32 [ %69, %63 ], [ 0, %25 ]
  %73 = select i1 %57, i1 %58, i1 false
  %74 = select i1 %73, i1 %30, i1 false
  %75 = select i1 %74, i1 %31, i1 false
  br i1 %75, label %76, label %85

76:                                               ; preds = %70
  %77 = add nsw i32 %29, %59
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = sitofp i32 %72 to float
  %82 = fadd contract float %80, %81
  %83 = fptosi float %82 to i32
  %84 = add nuw nsw i32 %71, 1
  br label %85

85:                                               ; preds = %76, %70
  %86 = phi i32 [ %84, %76 ], [ %71, %70 ]
  %87 = phi i32 [ %83, %76 ], [ %72, %70 ]
  %88 = select i1 %57, i1 %58, i1 false
  %89 = select i1 %88, i1 %33, i1 false
  %90 = select i1 %89, i1 %34, i1 false
  br i1 %90, label %91, label %100

91:                                               ; preds = %85
  %92 = add nsw i32 %32, %59
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = sitofp i32 %87 to float
  %97 = fadd contract float %95, %96
  %98 = fptosi float %97 to i32
  %99 = add nsw i32 %86, 1
  br label %100

100:                                              ; preds = %91, %85
  %101 = phi i32 [ %99, %91 ], [ %86, %85 ]
  %102 = phi i32 [ %98, %91 ], [ %87, %85 ]
  %103 = select i1 %57, i1 %58, i1 false
  %104 = select i1 %103, i1 %36, i1 false
  %105 = select i1 %104, i1 %37, i1 false
  br i1 %105, label %106, label %115

106:                                              ; preds = %100
  %107 = add nsw i32 %35, %59
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = sitofp i32 %102 to float
  %112 = fadd contract float %110, %111
  %113 = fptosi float %112 to i32
  %114 = add nsw i32 %101, 1
  br label %115

115:                                              ; preds = %106, %100
  %116 = phi i32 [ %114, %106 ], [ %101, %100 ]
  %117 = phi i32 [ %113, %106 ], [ %102, %100 ]
  %118 = select i1 %57, i1 %58, i1 false
  %119 = select i1 %118, i1 %39, i1 false
  br i1 %119, label %120, label %129

120:                                              ; preds = %115
  %121 = add nsw i32 %38, %59
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = sitofp i32 %117 to float
  %126 = fadd contract float %124, %125
  %127 = fptosi float %126 to i32
  %128 = add nsw i32 %116, 1
  br label %129

129:                                              ; preds = %120, %115
  %130 = phi i32 [ %128, %120 ], [ %116, %115 ]
  %131 = phi i32 [ %127, %120 ], [ %117, %115 ]
  %132 = select i1 %57, i1 %58, i1 false
  %133 = select i1 %132, i1 %40, i1 false
  br i1 %133, label %134, label %143

134:                                              ; preds = %129
  %135 = add nsw i32 %13, %59
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = sitofp i32 %131 to float
  %140 = fadd contract float %138, %139
  %141 = fptosi float %140 to i32
  %142 = add nsw i32 %130, 1
  br label %143

143:                                              ; preds = %134, %129
  %144 = phi i32 [ %142, %134 ], [ %130, %129 ]
  %145 = phi i32 [ %141, %134 ], [ %131, %129 ]
  %146 = select i1 %57, i1 %58, i1 false
  %147 = select i1 %146, i1 %42, i1 false
  %148 = select i1 %147, i1 %43, i1 false
  br i1 %148, label %149, label %158

149:                                              ; preds = %143
  %150 = add nsw i32 %41, %59
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = sitofp i32 %145 to float
  %155 = fadd contract float %153, %154
  %156 = fptosi float %155 to i32
  %157 = add nsw i32 %144, 1
  br label %158

158:                                              ; preds = %149, %143
  %159 = phi i32 [ %157, %149 ], [ %144, %143 ]
  %160 = phi i32 [ %156, %149 ], [ %145, %143 ]
  %161 = select i1 %57, i1 %58, i1 false
  %162 = select i1 %161, i1 %45, i1 false
  %163 = select i1 %162, i1 %46, i1 false
  br i1 %163, label %164, label %173

164:                                              ; preds = %158
  %165 = add nsw i32 %44, %59
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !5
  %169 = sitofp i32 %160 to float
  %170 = fadd contract float %168, %169
  %171 = fptosi float %170 to i32
  %172 = add nsw i32 %159, 1
  br label %173

173:                                              ; preds = %164, %158
  %174 = phi i32 [ %172, %164 ], [ %159, %158 ]
  %175 = phi i32 [ %171, %164 ], [ %160, %158 ]
  %176 = select i1 %57, i1 %58, i1 false
  %177 = select i1 %176, i1 %48, i1 false
  %178 = select i1 %177, i1 %49, i1 false
  br i1 %178, label %179, label %188

179:                                              ; preds = %173
  %180 = add nsw i32 %47, %59
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7, !amdgpu.noclobber !5
  %184 = sitofp i32 %175 to float
  %185 = fadd contract float %183, %184
  %186 = fptosi float %185 to i32
  %187 = add nsw i32 %174, 1
  br label %188

188:                                              ; preds = %179, %173
  %189 = phi i32 [ %187, %179 ], [ %174, %173 ]
  %190 = phi i32 [ %186, %179 ], [ %175, %173 ]
  %191 = select i1 %57, i1 %58, i1 false
  %192 = select i1 %191, i1 %51, i1 false
  %193 = select i1 %192, i1 %52, i1 false
  br i1 %193, label %194, label %203

194:                                              ; preds = %188
  %195 = add nsw i32 %50, %59
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7, !amdgpu.noclobber !5
  %199 = sitofp i32 %190 to float
  %200 = fadd contract float %198, %199
  %201 = fptosi float %200 to i32
  %202 = add nsw i32 %189, 1
  br label %203

203:                                              ; preds = %194, %188
  %204 = phi i32 [ %202, %194 ], [ %189, %188 ]
  %205 = phi i32 [ %201, %194 ], [ %190, %188 ]
  %206 = select i1 %57, i1 %58, i1 false
  %207 = select i1 %206, i1 %54, i1 false
  %208 = select i1 %207, i1 %55, i1 false
  br i1 %208, label %209, label %218

209:                                              ; preds = %203
  %210 = add nsw i32 %53, %59
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %1, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !5
  %214 = sitofp i32 %205 to float
  %215 = fadd contract float %213, %214
  %216 = fptosi float %215 to i32
  %217 = add nsw i32 %204, 1
  br label %218

218:                                              ; preds = %209, %203
  %219 = phi i32 [ %217, %209 ], [ %204, %203 ]
  %220 = phi i32 [ %216, %209 ], [ %205, %203 ]
  %221 = add nsw i32 %21, -4
  %222 = icmp sgt i32 %21, 3
  %223 = icmp slt i32 %221, %3
  %224 = mul nsw i32 %221, %2
  %225 = select i1 %222, i1 %223, i1 false
  %226 = select i1 %225, i1 %27, i1 false
  %227 = select i1 %226, i1 %28, i1 false
  br i1 %227, label %228, label %237

228:                                              ; preds = %218
  %229 = add nsw i32 %26, %224
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = sitofp i32 %220 to float
  %234 = fadd contract float %232, %233
  %235 = fptosi float %234 to i32
  %236 = add nsw i32 %219, 1
  br label %237

237:                                              ; preds = %228, %218
  %238 = phi i32 [ %236, %228 ], [ %219, %218 ]
  %239 = phi i32 [ %235, %228 ], [ %220, %218 ]
  %240 = select i1 %222, i1 %223, i1 false
  %241 = select i1 %240, i1 %30, i1 false
  %242 = select i1 %241, i1 %31, i1 false
  br i1 %242, label %243, label %252

243:                                              ; preds = %237
  %244 = add nsw i32 %29, %224
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %1, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7, !amdgpu.noclobber !5
  %248 = sitofp i32 %239 to float
  %249 = fadd contract float %247, %248
  %250 = fptosi float %249 to i32
  %251 = add nsw i32 %238, 1
  br label %252

252:                                              ; preds = %243, %237
  %253 = phi i32 [ %251, %243 ], [ %238, %237 ]
  %254 = phi i32 [ %250, %243 ], [ %239, %237 ]
  %255 = select i1 %222, i1 %223, i1 false
  %256 = select i1 %255, i1 %33, i1 false
  %257 = select i1 %256, i1 %34, i1 false
  br i1 %257, label %258, label %267

258:                                              ; preds = %252
  %259 = add nsw i32 %32, %224
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %1, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7, !amdgpu.noclobber !5
  %263 = sitofp i32 %254 to float
  %264 = fadd contract float %262, %263
  %265 = fptosi float %264 to i32
  %266 = add nsw i32 %253, 1
  br label %267

267:                                              ; preds = %258, %252
  %268 = phi i32 [ %266, %258 ], [ %253, %252 ]
  %269 = phi i32 [ %265, %258 ], [ %254, %252 ]
  %270 = select i1 %222, i1 %223, i1 false
  %271 = select i1 %270, i1 %36, i1 false
  %272 = select i1 %271, i1 %37, i1 false
  br i1 %272, label %273, label %282

273:                                              ; preds = %267
  %274 = add nsw i32 %35, %224
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %1, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !7, !amdgpu.noclobber !5
  %278 = sitofp i32 %269 to float
  %279 = fadd contract float %277, %278
  %280 = fptosi float %279 to i32
  %281 = add nsw i32 %268, 1
  br label %282

282:                                              ; preds = %273, %267
  %283 = phi i32 [ %281, %273 ], [ %268, %267 ]
  %284 = phi i32 [ %280, %273 ], [ %269, %267 ]
  %285 = select i1 %222, i1 %223, i1 false
  %286 = select i1 %285, i1 %39, i1 false
  br i1 %286, label %287, label %296

287:                                              ; preds = %282
  %288 = add nsw i32 %38, %224
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7, !amdgpu.noclobber !5
  %292 = sitofp i32 %284 to float
  %293 = fadd contract float %291, %292
  %294 = fptosi float %293 to i32
  %295 = add nsw i32 %283, 1
  br label %296

296:                                              ; preds = %287, %282
  %297 = phi i32 [ %295, %287 ], [ %283, %282 ]
  %298 = phi i32 [ %294, %287 ], [ %284, %282 ]
  %299 = select i1 %222, i1 %223, i1 false
  %300 = select i1 %299, i1 %40, i1 false
  br i1 %300, label %301, label %310

301:                                              ; preds = %296
  %302 = add nsw i32 %13, %224
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7, !amdgpu.noclobber !5
  %306 = sitofp i32 %298 to float
  %307 = fadd contract float %305, %306
  %308 = fptosi float %307 to i32
  %309 = add nsw i32 %297, 1
  br label %310

310:                                              ; preds = %301, %296
  %311 = phi i32 [ %309, %301 ], [ %297, %296 ]
  %312 = phi i32 [ %308, %301 ], [ %298, %296 ]
  %313 = select i1 %222, i1 %223, i1 false
  %314 = select i1 %313, i1 %42, i1 false
  %315 = select i1 %314, i1 %43, i1 false
  br i1 %315, label %316, label %325

316:                                              ; preds = %310
  %317 = add nsw i32 %41, %224
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %1, i64 %318
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !7, !amdgpu.noclobber !5
  %321 = sitofp i32 %312 to float
  %322 = fadd contract float %320, %321
  %323 = fptosi float %322 to i32
  %324 = add nsw i32 %311, 1
  br label %325

325:                                              ; preds = %316, %310
  %326 = phi i32 [ %324, %316 ], [ %311, %310 ]
  %327 = phi i32 [ %323, %316 ], [ %312, %310 ]
  %328 = select i1 %222, i1 %223, i1 false
  %329 = select i1 %328, i1 %45, i1 false
  %330 = select i1 %329, i1 %46, i1 false
  br i1 %330, label %331, label %340

331:                                              ; preds = %325
  %332 = add nsw i32 %44, %224
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %1, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7, !amdgpu.noclobber !5
  %336 = sitofp i32 %327 to float
  %337 = fadd contract float %335, %336
  %338 = fptosi float %337 to i32
  %339 = add nsw i32 %326, 1
  br label %340

340:                                              ; preds = %331, %325
  %341 = phi i32 [ %339, %331 ], [ %326, %325 ]
  %342 = phi i32 [ %338, %331 ], [ %327, %325 ]
  %343 = select i1 %222, i1 %223, i1 false
  %344 = select i1 %343, i1 %48, i1 false
  %345 = select i1 %344, i1 %49, i1 false
  br i1 %345, label %346, label %355

346:                                              ; preds = %340
  %347 = add nsw i32 %47, %224
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %1, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7, !amdgpu.noclobber !5
  %351 = sitofp i32 %342 to float
  %352 = fadd contract float %350, %351
  %353 = fptosi float %352 to i32
  %354 = add nsw i32 %341, 1
  br label %355

355:                                              ; preds = %346, %340
  %356 = phi i32 [ %354, %346 ], [ %341, %340 ]
  %357 = phi i32 [ %353, %346 ], [ %342, %340 ]
  %358 = select i1 %222, i1 %223, i1 false
  %359 = select i1 %358, i1 %51, i1 false
  %360 = select i1 %359, i1 %52, i1 false
  br i1 %360, label %361, label %370

361:                                              ; preds = %355
  %362 = add nsw i32 %50, %224
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float addrspace(1)* %1, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !7, !amdgpu.noclobber !5
  %366 = sitofp i32 %357 to float
  %367 = fadd contract float %365, %366
  %368 = fptosi float %367 to i32
  %369 = add nsw i32 %356, 1
  br label %370

370:                                              ; preds = %361, %355
  %371 = phi i32 [ %369, %361 ], [ %356, %355 ]
  %372 = phi i32 [ %368, %361 ], [ %357, %355 ]
  %373 = select i1 %222, i1 %223, i1 false
  %374 = select i1 %373, i1 %54, i1 false
  %375 = select i1 %374, i1 %55, i1 false
  br i1 %375, label %376, label %385

376:                                              ; preds = %370
  %377 = add nsw i32 %53, %224
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %1, i64 %378
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !7, !amdgpu.noclobber !5
  %381 = sitofp i32 %372 to float
  %382 = fadd contract float %380, %381
  %383 = fptosi float %382 to i32
  %384 = add nsw i32 %371, 1
  br label %385

385:                                              ; preds = %376, %370
  %386 = phi i32 [ %384, %376 ], [ %371, %370 ]
  %387 = phi i32 [ %383, %376 ], [ %372, %370 ]
  %388 = add nsw i32 %21, -3
  %389 = icmp sgt i32 %21, 2
  %390 = icmp slt i32 %388, %3
  %391 = mul nsw i32 %388, %2
  %392 = select i1 %389, i1 %390, i1 false
  %393 = select i1 %392, i1 %27, i1 false
  %394 = select i1 %393, i1 %28, i1 false
  br i1 %394, label %395, label %404

395:                                              ; preds = %385
  %396 = add nsw i32 %26, %391
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %1, i64 %397
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !7, !amdgpu.noclobber !5
  %400 = sitofp i32 %387 to float
  %401 = fadd contract float %399, %400
  %402 = fptosi float %401 to i32
  %403 = add nsw i32 %386, 1
  br label %404

404:                                              ; preds = %395, %385
  %405 = phi i32 [ %403, %395 ], [ %386, %385 ]
  %406 = phi i32 [ %402, %395 ], [ %387, %385 ]
  %407 = select i1 %389, i1 %390, i1 false
  %408 = select i1 %407, i1 %30, i1 false
  %409 = select i1 %408, i1 %31, i1 false
  br i1 %409, label %410, label %419

410:                                              ; preds = %404
  %411 = add nsw i32 %29, %391
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds float, float addrspace(1)* %1, i64 %412
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !7, !amdgpu.noclobber !5
  %415 = sitofp i32 %406 to float
  %416 = fadd contract float %414, %415
  %417 = fptosi float %416 to i32
  %418 = add nsw i32 %405, 1
  br label %419

419:                                              ; preds = %410, %404
  %420 = phi i32 [ %418, %410 ], [ %405, %404 ]
  %421 = phi i32 [ %417, %410 ], [ %406, %404 ]
  %422 = select i1 %389, i1 %390, i1 false
  %423 = select i1 %422, i1 %33, i1 false
  %424 = select i1 %423, i1 %34, i1 false
  br i1 %424, label %425, label %434

425:                                              ; preds = %419
  %426 = add nsw i32 %32, %391
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %1, i64 %427
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !7, !amdgpu.noclobber !5
  %430 = sitofp i32 %421 to float
  %431 = fadd contract float %429, %430
  %432 = fptosi float %431 to i32
  %433 = add nsw i32 %420, 1
  br label %434

434:                                              ; preds = %425, %419
  %435 = phi i32 [ %433, %425 ], [ %420, %419 ]
  %436 = phi i32 [ %432, %425 ], [ %421, %419 ]
  %437 = select i1 %389, i1 %390, i1 false
  %438 = select i1 %437, i1 %36, i1 false
  %439 = select i1 %438, i1 %37, i1 false
  br i1 %439, label %440, label %449

440:                                              ; preds = %434
  %441 = add nsw i32 %35, %391
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds float, float addrspace(1)* %1, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7, !amdgpu.noclobber !5
  %445 = sitofp i32 %436 to float
  %446 = fadd contract float %444, %445
  %447 = fptosi float %446 to i32
  %448 = add nsw i32 %435, 1
  br label %449

449:                                              ; preds = %440, %434
  %450 = phi i32 [ %448, %440 ], [ %435, %434 ]
  %451 = phi i32 [ %447, %440 ], [ %436, %434 ]
  %452 = select i1 %389, i1 %390, i1 false
  %453 = select i1 %452, i1 %39, i1 false
  br i1 %453, label %454, label %463

454:                                              ; preds = %449
  %455 = add nsw i32 %38, %391
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %1, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !7, !amdgpu.noclobber !5
  %459 = sitofp i32 %451 to float
  %460 = fadd contract float %458, %459
  %461 = fptosi float %460 to i32
  %462 = add nsw i32 %450, 1
  br label %463

463:                                              ; preds = %454, %449
  %464 = phi i32 [ %462, %454 ], [ %450, %449 ]
  %465 = phi i32 [ %461, %454 ], [ %451, %449 ]
  %466 = select i1 %389, i1 %390, i1 false
  %467 = select i1 %466, i1 %40, i1 false
  br i1 %467, label %468, label %477

468:                                              ; preds = %463
  %469 = add nsw i32 %13, %391
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds float, float addrspace(1)* %1, i64 %470
  %472 = load float, float addrspace(1)* %471, align 4, !tbaa !7, !amdgpu.noclobber !5
  %473 = sitofp i32 %465 to float
  %474 = fadd contract float %472, %473
  %475 = fptosi float %474 to i32
  %476 = add nsw i32 %464, 1
  br label %477

477:                                              ; preds = %468, %463
  %478 = phi i32 [ %476, %468 ], [ %464, %463 ]
  %479 = phi i32 [ %475, %468 ], [ %465, %463 ]
  %480 = select i1 %389, i1 %390, i1 false
  %481 = select i1 %480, i1 %42, i1 false
  %482 = select i1 %481, i1 %43, i1 false
  br i1 %482, label %483, label %492

483:                                              ; preds = %477
  %484 = add nsw i32 %41, %391
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds float, float addrspace(1)* %1, i64 %485
  %487 = load float, float addrspace(1)* %486, align 4, !tbaa !7, !amdgpu.noclobber !5
  %488 = sitofp i32 %479 to float
  %489 = fadd contract float %487, %488
  %490 = fptosi float %489 to i32
  %491 = add nsw i32 %478, 1
  br label %492

492:                                              ; preds = %483, %477
  %493 = phi i32 [ %491, %483 ], [ %478, %477 ]
  %494 = phi i32 [ %490, %483 ], [ %479, %477 ]
  %495 = select i1 %389, i1 %390, i1 false
  %496 = select i1 %495, i1 %45, i1 false
  %497 = select i1 %496, i1 %46, i1 false
  br i1 %497, label %498, label %507

498:                                              ; preds = %492
  %499 = add nsw i32 %44, %391
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %1, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !7, !amdgpu.noclobber !5
  %503 = sitofp i32 %494 to float
  %504 = fadd contract float %502, %503
  %505 = fptosi float %504 to i32
  %506 = add nsw i32 %493, 1
  br label %507

507:                                              ; preds = %498, %492
  %508 = phi i32 [ %506, %498 ], [ %493, %492 ]
  %509 = phi i32 [ %505, %498 ], [ %494, %492 ]
  %510 = select i1 %389, i1 %390, i1 false
  %511 = select i1 %510, i1 %48, i1 false
  %512 = select i1 %511, i1 %49, i1 false
  br i1 %512, label %513, label %522

513:                                              ; preds = %507
  %514 = add nsw i32 %47, %391
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %1, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7, !amdgpu.noclobber !5
  %518 = sitofp i32 %509 to float
  %519 = fadd contract float %517, %518
  %520 = fptosi float %519 to i32
  %521 = add nsw i32 %508, 1
  br label %522

522:                                              ; preds = %513, %507
  %523 = phi i32 [ %521, %513 ], [ %508, %507 ]
  %524 = phi i32 [ %520, %513 ], [ %509, %507 ]
  %525 = select i1 %389, i1 %390, i1 false
  %526 = select i1 %525, i1 %51, i1 false
  %527 = select i1 %526, i1 %52, i1 false
  br i1 %527, label %528, label %537

528:                                              ; preds = %522
  %529 = add nsw i32 %50, %391
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds float, float addrspace(1)* %1, i64 %530
  %532 = load float, float addrspace(1)* %531, align 4, !tbaa !7, !amdgpu.noclobber !5
  %533 = sitofp i32 %524 to float
  %534 = fadd contract float %532, %533
  %535 = fptosi float %534 to i32
  %536 = add nsw i32 %523, 1
  br label %537

537:                                              ; preds = %528, %522
  %538 = phi i32 [ %536, %528 ], [ %523, %522 ]
  %539 = phi i32 [ %535, %528 ], [ %524, %522 ]
  %540 = select i1 %389, i1 %390, i1 false
  %541 = select i1 %540, i1 %54, i1 false
  %542 = select i1 %541, i1 %55, i1 false
  br i1 %542, label %543, label %552

543:                                              ; preds = %537
  %544 = add nsw i32 %53, %391
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %1, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !7, !amdgpu.noclobber !5
  %548 = sitofp i32 %539 to float
  %549 = fadd contract float %547, %548
  %550 = fptosi float %549 to i32
  %551 = add nsw i32 %538, 1
  br label %552

552:                                              ; preds = %543, %537
  %553 = phi i32 [ %551, %543 ], [ %538, %537 ]
  %554 = phi i32 [ %550, %543 ], [ %539, %537 ]
  %555 = add nsw i32 %21, -2
  %556 = icmp sgt i32 %21, 1
  %557 = icmp slt i32 %555, %3
  %558 = mul nsw i32 %555, %2
  %559 = select i1 %556, i1 %557, i1 false
  %560 = select i1 %559, i1 %27, i1 false
  %561 = select i1 %560, i1 %28, i1 false
  br i1 %561, label %562, label %571

562:                                              ; preds = %552
  %563 = add nsw i32 %26, %558
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds float, float addrspace(1)* %1, i64 %564
  %566 = load float, float addrspace(1)* %565, align 4, !tbaa !7, !amdgpu.noclobber !5
  %567 = sitofp i32 %554 to float
  %568 = fadd contract float %566, %567
  %569 = fptosi float %568 to i32
  %570 = add nsw i32 %553, 1
  br label %571

571:                                              ; preds = %562, %552
  %572 = phi i32 [ %570, %562 ], [ %553, %552 ]
  %573 = phi i32 [ %569, %562 ], [ %554, %552 ]
  %574 = select i1 %556, i1 %557, i1 false
  %575 = select i1 %574, i1 %30, i1 false
  %576 = select i1 %575, i1 %31, i1 false
  br i1 %576, label %577, label %586

577:                                              ; preds = %571
  %578 = add nsw i32 %29, %558
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds float, float addrspace(1)* %1, i64 %579
  %581 = load float, float addrspace(1)* %580, align 4, !tbaa !7, !amdgpu.noclobber !5
  %582 = sitofp i32 %573 to float
  %583 = fadd contract float %581, %582
  %584 = fptosi float %583 to i32
  %585 = add nsw i32 %572, 1
  br label %586

586:                                              ; preds = %577, %571
  %587 = phi i32 [ %585, %577 ], [ %572, %571 ]
  %588 = phi i32 [ %584, %577 ], [ %573, %571 ]
  %589 = select i1 %556, i1 %557, i1 false
  %590 = select i1 %589, i1 %33, i1 false
  %591 = select i1 %590, i1 %34, i1 false
  br i1 %591, label %592, label %601

592:                                              ; preds = %586
  %593 = add nsw i32 %32, %558
  %594 = sext i32 %593 to i64
  %595 = getelementptr inbounds float, float addrspace(1)* %1, i64 %594
  %596 = load float, float addrspace(1)* %595, align 4, !tbaa !7, !amdgpu.noclobber !5
  %597 = sitofp i32 %588 to float
  %598 = fadd contract float %596, %597
  %599 = fptosi float %598 to i32
  %600 = add nsw i32 %587, 1
  br label %601

601:                                              ; preds = %592, %586
  %602 = phi i32 [ %600, %592 ], [ %587, %586 ]
  %603 = phi i32 [ %599, %592 ], [ %588, %586 ]
  %604 = select i1 %556, i1 %557, i1 false
  %605 = select i1 %604, i1 %36, i1 false
  %606 = select i1 %605, i1 %37, i1 false
  br i1 %606, label %607, label %616

607:                                              ; preds = %601
  %608 = add nsw i32 %35, %558
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %1, i64 %609
  %611 = load float, float addrspace(1)* %610, align 4, !tbaa !7, !amdgpu.noclobber !5
  %612 = sitofp i32 %603 to float
  %613 = fadd contract float %611, %612
  %614 = fptosi float %613 to i32
  %615 = add nsw i32 %602, 1
  br label %616

616:                                              ; preds = %607, %601
  %617 = phi i32 [ %615, %607 ], [ %602, %601 ]
  %618 = phi i32 [ %614, %607 ], [ %603, %601 ]
  %619 = select i1 %556, i1 %557, i1 false
  %620 = select i1 %619, i1 %39, i1 false
  br i1 %620, label %621, label %630

621:                                              ; preds = %616
  %622 = add nsw i32 %38, %558
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds float, float addrspace(1)* %1, i64 %623
  %625 = load float, float addrspace(1)* %624, align 4, !tbaa !7, !amdgpu.noclobber !5
  %626 = sitofp i32 %618 to float
  %627 = fadd contract float %625, %626
  %628 = fptosi float %627 to i32
  %629 = add nsw i32 %617, 1
  br label %630

630:                                              ; preds = %621, %616
  %631 = phi i32 [ %629, %621 ], [ %617, %616 ]
  %632 = phi i32 [ %628, %621 ], [ %618, %616 ]
  %633 = select i1 %556, i1 %557, i1 false
  %634 = select i1 %633, i1 %40, i1 false
  br i1 %634, label %635, label %644

635:                                              ; preds = %630
  %636 = add nsw i32 %13, %558
  %637 = sext i32 %636 to i64
  %638 = getelementptr inbounds float, float addrspace(1)* %1, i64 %637
  %639 = load float, float addrspace(1)* %638, align 4, !tbaa !7, !amdgpu.noclobber !5
  %640 = sitofp i32 %632 to float
  %641 = fadd contract float %639, %640
  %642 = fptosi float %641 to i32
  %643 = add nsw i32 %631, 1
  br label %644

644:                                              ; preds = %635, %630
  %645 = phi i32 [ %643, %635 ], [ %631, %630 ]
  %646 = phi i32 [ %642, %635 ], [ %632, %630 ]
  %647 = select i1 %556, i1 %557, i1 false
  %648 = select i1 %647, i1 %42, i1 false
  %649 = select i1 %648, i1 %43, i1 false
  br i1 %649, label %650, label %659

650:                                              ; preds = %644
  %651 = add nsw i32 %41, %558
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds float, float addrspace(1)* %1, i64 %652
  %654 = load float, float addrspace(1)* %653, align 4, !tbaa !7, !amdgpu.noclobber !5
  %655 = sitofp i32 %646 to float
  %656 = fadd contract float %654, %655
  %657 = fptosi float %656 to i32
  %658 = add nsw i32 %645, 1
  br label %659

659:                                              ; preds = %650, %644
  %660 = phi i32 [ %658, %650 ], [ %645, %644 ]
  %661 = phi i32 [ %657, %650 ], [ %646, %644 ]
  %662 = select i1 %556, i1 %557, i1 false
  %663 = select i1 %662, i1 %45, i1 false
  %664 = select i1 %663, i1 %46, i1 false
  br i1 %664, label %665, label %674

665:                                              ; preds = %659
  %666 = add nsw i32 %44, %558
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds float, float addrspace(1)* %1, i64 %667
  %669 = load float, float addrspace(1)* %668, align 4, !tbaa !7, !amdgpu.noclobber !5
  %670 = sitofp i32 %661 to float
  %671 = fadd contract float %669, %670
  %672 = fptosi float %671 to i32
  %673 = add nsw i32 %660, 1
  br label %674

674:                                              ; preds = %665, %659
  %675 = phi i32 [ %673, %665 ], [ %660, %659 ]
  %676 = phi i32 [ %672, %665 ], [ %661, %659 ]
  %677 = select i1 %556, i1 %557, i1 false
  %678 = select i1 %677, i1 %48, i1 false
  %679 = select i1 %678, i1 %49, i1 false
  br i1 %679, label %680, label %689

680:                                              ; preds = %674
  %681 = add nsw i32 %47, %558
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds float, float addrspace(1)* %1, i64 %682
  %684 = load float, float addrspace(1)* %683, align 4, !tbaa !7, !amdgpu.noclobber !5
  %685 = sitofp i32 %676 to float
  %686 = fadd contract float %684, %685
  %687 = fptosi float %686 to i32
  %688 = add nsw i32 %675, 1
  br label %689

689:                                              ; preds = %680, %674
  %690 = phi i32 [ %688, %680 ], [ %675, %674 ]
  %691 = phi i32 [ %687, %680 ], [ %676, %674 ]
  %692 = select i1 %556, i1 %557, i1 false
  %693 = select i1 %692, i1 %51, i1 false
  %694 = select i1 %693, i1 %52, i1 false
  br i1 %694, label %695, label %704

695:                                              ; preds = %689
  %696 = add nsw i32 %50, %558
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds float, float addrspace(1)* %1, i64 %697
  %699 = load float, float addrspace(1)* %698, align 4, !tbaa !7, !amdgpu.noclobber !5
  %700 = sitofp i32 %691 to float
  %701 = fadd contract float %699, %700
  %702 = fptosi float %701 to i32
  %703 = add nsw i32 %690, 1
  br label %704

704:                                              ; preds = %695, %689
  %705 = phi i32 [ %703, %695 ], [ %690, %689 ]
  %706 = phi i32 [ %702, %695 ], [ %691, %689 ]
  %707 = select i1 %556, i1 %557, i1 false
  %708 = select i1 %707, i1 %54, i1 false
  %709 = select i1 %708, i1 %55, i1 false
  br i1 %709, label %710, label %719

710:                                              ; preds = %704
  %711 = add nsw i32 %53, %558
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds float, float addrspace(1)* %1, i64 %712
  %714 = load float, float addrspace(1)* %713, align 4, !tbaa !7, !amdgpu.noclobber !5
  %715 = sitofp i32 %706 to float
  %716 = fadd contract float %714, %715
  %717 = fptosi float %716 to i32
  %718 = add nsw i32 %705, 1
  br label %719

719:                                              ; preds = %710, %704
  %720 = phi i32 [ %718, %710 ], [ %705, %704 ]
  %721 = phi i32 [ %717, %710 ], [ %706, %704 ]
  %722 = add nsw i32 %21, -1
  %723 = icmp sgt i32 %21, 0
  %724 = icmp sle i32 %21, %3
  %725 = mul nsw i32 %722, %2
  %726 = select i1 %723, i1 %724, i1 false
  %727 = select i1 %726, i1 %27, i1 false
  %728 = select i1 %727, i1 %28, i1 false
  br i1 %728, label %729, label %738

729:                                              ; preds = %719
  %730 = add nsw i32 %26, %725
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds float, float addrspace(1)* %1, i64 %731
  %733 = load float, float addrspace(1)* %732, align 4, !tbaa !7, !amdgpu.noclobber !5
  %734 = sitofp i32 %721 to float
  %735 = fadd contract float %733, %734
  %736 = fptosi float %735 to i32
  %737 = add nsw i32 %720, 1
  br label %738

738:                                              ; preds = %729, %719
  %739 = phi i32 [ %737, %729 ], [ %720, %719 ]
  %740 = phi i32 [ %736, %729 ], [ %721, %719 ]
  %741 = select i1 %723, i1 %724, i1 false
  %742 = select i1 %741, i1 %30, i1 false
  %743 = select i1 %742, i1 %31, i1 false
  br i1 %743, label %744, label %753

744:                                              ; preds = %738
  %745 = add nsw i32 %29, %725
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds float, float addrspace(1)* %1, i64 %746
  %748 = load float, float addrspace(1)* %747, align 4, !tbaa !7, !amdgpu.noclobber !5
  %749 = sitofp i32 %740 to float
  %750 = fadd contract float %748, %749
  %751 = fptosi float %750 to i32
  %752 = add nsw i32 %739, 1
  br label %753

753:                                              ; preds = %744, %738
  %754 = phi i32 [ %752, %744 ], [ %739, %738 ]
  %755 = phi i32 [ %751, %744 ], [ %740, %738 ]
  %756 = select i1 %723, i1 %724, i1 false
  %757 = select i1 %756, i1 %33, i1 false
  %758 = select i1 %757, i1 %34, i1 false
  br i1 %758, label %759, label %768

759:                                              ; preds = %753
  %760 = add nsw i32 %32, %725
  %761 = sext i32 %760 to i64
  %762 = getelementptr inbounds float, float addrspace(1)* %1, i64 %761
  %763 = load float, float addrspace(1)* %762, align 4, !tbaa !7, !amdgpu.noclobber !5
  %764 = sitofp i32 %755 to float
  %765 = fadd contract float %763, %764
  %766 = fptosi float %765 to i32
  %767 = add nsw i32 %754, 1
  br label %768

768:                                              ; preds = %759, %753
  %769 = phi i32 [ %767, %759 ], [ %754, %753 ]
  %770 = phi i32 [ %766, %759 ], [ %755, %753 ]
  %771 = select i1 %723, i1 %724, i1 false
  %772 = select i1 %771, i1 %36, i1 false
  %773 = select i1 %772, i1 %37, i1 false
  br i1 %773, label %774, label %783

774:                                              ; preds = %768
  %775 = add nsw i32 %35, %725
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds float, float addrspace(1)* %1, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7, !amdgpu.noclobber !5
  %779 = sitofp i32 %770 to float
  %780 = fadd contract float %778, %779
  %781 = fptosi float %780 to i32
  %782 = add nsw i32 %769, 1
  br label %783

783:                                              ; preds = %774, %768
  %784 = phi i32 [ %782, %774 ], [ %769, %768 ]
  %785 = phi i32 [ %781, %774 ], [ %770, %768 ]
  %786 = select i1 %723, i1 %724, i1 false
  %787 = select i1 %786, i1 %39, i1 false
  br i1 %787, label %788, label %797

788:                                              ; preds = %783
  %789 = add nsw i32 %38, %725
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds float, float addrspace(1)* %1, i64 %790
  %792 = load float, float addrspace(1)* %791, align 4, !tbaa !7, !amdgpu.noclobber !5
  %793 = sitofp i32 %785 to float
  %794 = fadd contract float %792, %793
  %795 = fptosi float %794 to i32
  %796 = add nsw i32 %784, 1
  br label %797

797:                                              ; preds = %788, %783
  %798 = phi i32 [ %796, %788 ], [ %784, %783 ]
  %799 = phi i32 [ %795, %788 ], [ %785, %783 ]
  %800 = select i1 %723, i1 %724, i1 false
  %801 = select i1 %800, i1 %40, i1 false
  br i1 %801, label %802, label %811

802:                                              ; preds = %797
  %803 = add nsw i32 %13, %725
  %804 = sext i32 %803 to i64
  %805 = getelementptr inbounds float, float addrspace(1)* %1, i64 %804
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !7, !amdgpu.noclobber !5
  %807 = sitofp i32 %799 to float
  %808 = fadd contract float %806, %807
  %809 = fptosi float %808 to i32
  %810 = add nsw i32 %798, 1
  br label %811

811:                                              ; preds = %802, %797
  %812 = phi i32 [ %810, %802 ], [ %798, %797 ]
  %813 = phi i32 [ %809, %802 ], [ %799, %797 ]
  %814 = select i1 %723, i1 %724, i1 false
  %815 = select i1 %814, i1 %42, i1 false
  %816 = select i1 %815, i1 %43, i1 false
  br i1 %816, label %817, label %826

817:                                              ; preds = %811
  %818 = add nsw i32 %41, %725
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds float, float addrspace(1)* %1, i64 %819
  %821 = load float, float addrspace(1)* %820, align 4, !tbaa !7, !amdgpu.noclobber !5
  %822 = sitofp i32 %813 to float
  %823 = fadd contract float %821, %822
  %824 = fptosi float %823 to i32
  %825 = add nsw i32 %812, 1
  br label %826

826:                                              ; preds = %817, %811
  %827 = phi i32 [ %825, %817 ], [ %812, %811 ]
  %828 = phi i32 [ %824, %817 ], [ %813, %811 ]
  %829 = select i1 %723, i1 %724, i1 false
  %830 = select i1 %829, i1 %45, i1 false
  %831 = select i1 %830, i1 %46, i1 false
  br i1 %831, label %832, label %841

832:                                              ; preds = %826
  %833 = add nsw i32 %44, %725
  %834 = sext i32 %833 to i64
  %835 = getelementptr inbounds float, float addrspace(1)* %1, i64 %834
  %836 = load float, float addrspace(1)* %835, align 4, !tbaa !7, !amdgpu.noclobber !5
  %837 = sitofp i32 %828 to float
  %838 = fadd contract float %836, %837
  %839 = fptosi float %838 to i32
  %840 = add nsw i32 %827, 1
  br label %841

841:                                              ; preds = %832, %826
  %842 = phi i32 [ %840, %832 ], [ %827, %826 ]
  %843 = phi i32 [ %839, %832 ], [ %828, %826 ]
  %844 = select i1 %723, i1 %724, i1 false
  %845 = select i1 %844, i1 %48, i1 false
  %846 = select i1 %845, i1 %49, i1 false
  br i1 %846, label %847, label %856

847:                                              ; preds = %841
  %848 = add nsw i32 %47, %725
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds float, float addrspace(1)* %1, i64 %849
  %851 = load float, float addrspace(1)* %850, align 4, !tbaa !7, !amdgpu.noclobber !5
  %852 = sitofp i32 %843 to float
  %853 = fadd contract float %851, %852
  %854 = fptosi float %853 to i32
  %855 = add nsw i32 %842, 1
  br label %856

856:                                              ; preds = %847, %841
  %857 = phi i32 [ %855, %847 ], [ %842, %841 ]
  %858 = phi i32 [ %854, %847 ], [ %843, %841 ]
  %859 = select i1 %723, i1 %724, i1 false
  %860 = select i1 %859, i1 %51, i1 false
  %861 = select i1 %860, i1 %52, i1 false
  br i1 %861, label %862, label %871

862:                                              ; preds = %856
  %863 = add nsw i32 %50, %725
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds float, float addrspace(1)* %1, i64 %864
  %866 = load float, float addrspace(1)* %865, align 4, !tbaa !7, !amdgpu.noclobber !5
  %867 = sitofp i32 %858 to float
  %868 = fadd contract float %866, %867
  %869 = fptosi float %868 to i32
  %870 = add nsw i32 %857, 1
  br label %871

871:                                              ; preds = %862, %856
  %872 = phi i32 [ %870, %862 ], [ %857, %856 ]
  %873 = phi i32 [ %869, %862 ], [ %858, %856 ]
  %874 = select i1 %723, i1 %724, i1 false
  %875 = select i1 %874, i1 %54, i1 false
  %876 = select i1 %875, i1 %55, i1 false
  br i1 %876, label %877, label %886

877:                                              ; preds = %871
  %878 = add nsw i32 %53, %725
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds float, float addrspace(1)* %1, i64 %879
  %881 = load float, float addrspace(1)* %880, align 4, !tbaa !7, !amdgpu.noclobber !5
  %882 = sitofp i32 %873 to float
  %883 = fadd contract float %881, %882
  %884 = fptosi float %883 to i32
  %885 = add nsw i32 %872, 1
  br label %886

886:                                              ; preds = %877, %871
  %887 = phi i32 [ %885, %877 ], [ %872, %871 ]
  %888 = phi i32 [ %884, %877 ], [ %873, %871 ]
  %889 = icmp sgt i32 %21, -1
  %890 = icmp slt i32 %21, %3
  %891 = mul nsw i32 %21, %2
  %892 = select i1 %889, i1 %890, i1 false
  %893 = select i1 %892, i1 %27, i1 false
  %894 = select i1 %893, i1 %28, i1 false
  br i1 %894, label %895, label %904

895:                                              ; preds = %886
  %896 = add nsw i32 %26, %891
  %897 = sext i32 %896 to i64
  %898 = getelementptr inbounds float, float addrspace(1)* %1, i64 %897
  %899 = load float, float addrspace(1)* %898, align 4, !tbaa !7, !amdgpu.noclobber !5
  %900 = sitofp i32 %888 to float
  %901 = fadd contract float %899, %900
  %902 = fptosi float %901 to i32
  %903 = add nsw i32 %887, 1
  br label %904

904:                                              ; preds = %895, %886
  %905 = phi i32 [ %903, %895 ], [ %887, %886 ]
  %906 = phi i32 [ %902, %895 ], [ %888, %886 ]
  %907 = select i1 %889, i1 %890, i1 false
  %908 = select i1 %907, i1 %30, i1 false
  %909 = select i1 %908, i1 %31, i1 false
  br i1 %909, label %910, label %919

910:                                              ; preds = %904
  %911 = add nsw i32 %29, %891
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds float, float addrspace(1)* %1, i64 %912
  %914 = load float, float addrspace(1)* %913, align 4, !tbaa !7, !amdgpu.noclobber !5
  %915 = sitofp i32 %906 to float
  %916 = fadd contract float %914, %915
  %917 = fptosi float %916 to i32
  %918 = add nsw i32 %905, 1
  br label %919

919:                                              ; preds = %910, %904
  %920 = phi i32 [ %918, %910 ], [ %905, %904 ]
  %921 = phi i32 [ %917, %910 ], [ %906, %904 ]
  %922 = select i1 %889, i1 %890, i1 false
  %923 = select i1 %922, i1 %33, i1 false
  %924 = select i1 %923, i1 %34, i1 false
  br i1 %924, label %925, label %934

925:                                              ; preds = %919
  %926 = add nsw i32 %32, %891
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds float, float addrspace(1)* %1, i64 %927
  %929 = load float, float addrspace(1)* %928, align 4, !tbaa !7, !amdgpu.noclobber !5
  %930 = sitofp i32 %921 to float
  %931 = fadd contract float %929, %930
  %932 = fptosi float %931 to i32
  %933 = add nsw i32 %920, 1
  br label %934

934:                                              ; preds = %925, %919
  %935 = phi i32 [ %933, %925 ], [ %920, %919 ]
  %936 = phi i32 [ %932, %925 ], [ %921, %919 ]
  %937 = select i1 %889, i1 %890, i1 false
  %938 = select i1 %937, i1 %36, i1 false
  %939 = select i1 %938, i1 %37, i1 false
  br i1 %939, label %940, label %949

940:                                              ; preds = %934
  %941 = add nsw i32 %35, %891
  %942 = sext i32 %941 to i64
  %943 = getelementptr inbounds float, float addrspace(1)* %1, i64 %942
  %944 = load float, float addrspace(1)* %943, align 4, !tbaa !7, !amdgpu.noclobber !5
  %945 = sitofp i32 %936 to float
  %946 = fadd contract float %944, %945
  %947 = fptosi float %946 to i32
  %948 = add nsw i32 %935, 1
  br label %949

949:                                              ; preds = %940, %934
  %950 = phi i32 [ %948, %940 ], [ %935, %934 ]
  %951 = phi i32 [ %947, %940 ], [ %936, %934 ]
  %952 = select i1 %889, i1 %890, i1 false
  %953 = select i1 %952, i1 %39, i1 false
  br i1 %953, label %954, label %963

954:                                              ; preds = %949
  %955 = add nsw i32 %38, %891
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds float, float addrspace(1)* %1, i64 %956
  %958 = load float, float addrspace(1)* %957, align 4, !tbaa !7, !amdgpu.noclobber !5
  %959 = sitofp i32 %951 to float
  %960 = fadd contract float %958, %959
  %961 = fptosi float %960 to i32
  %962 = add nsw i32 %950, 1
  br label %963

963:                                              ; preds = %954, %949
  %964 = phi i32 [ %962, %954 ], [ %950, %949 ]
  %965 = phi i32 [ %961, %954 ], [ %951, %949 ]
  %966 = select i1 %889, i1 %890, i1 false
  %967 = select i1 %966, i1 %40, i1 false
  br i1 %967, label %968, label %977

968:                                              ; preds = %963
  %969 = add nsw i32 %13, %891
  %970 = sext i32 %969 to i64
  %971 = getelementptr inbounds float, float addrspace(1)* %1, i64 %970
  %972 = load float, float addrspace(1)* %971, align 4, !tbaa !7, !amdgpu.noclobber !5
  %973 = sitofp i32 %965 to float
  %974 = fadd contract float %972, %973
  %975 = fptosi float %974 to i32
  %976 = add nsw i32 %964, 1
  br label %977

977:                                              ; preds = %968, %963
  %978 = phi i32 [ %976, %968 ], [ %964, %963 ]
  %979 = phi i32 [ %975, %968 ], [ %965, %963 ]
  %980 = select i1 %889, i1 %890, i1 false
  %981 = select i1 %980, i1 %42, i1 false
  %982 = select i1 %981, i1 %43, i1 false
  br i1 %982, label %983, label %992

983:                                              ; preds = %977
  %984 = add nsw i32 %41, %891
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds float, float addrspace(1)* %1, i64 %985
  %987 = load float, float addrspace(1)* %986, align 4, !tbaa !7, !amdgpu.noclobber !5
  %988 = sitofp i32 %979 to float
  %989 = fadd contract float %987, %988
  %990 = fptosi float %989 to i32
  %991 = add nsw i32 %978, 1
  br label %992

992:                                              ; preds = %983, %977
  %993 = phi i32 [ %991, %983 ], [ %978, %977 ]
  %994 = phi i32 [ %990, %983 ], [ %979, %977 ]
  %995 = select i1 %889, i1 %890, i1 false
  %996 = select i1 %995, i1 %45, i1 false
  %997 = select i1 %996, i1 %46, i1 false
  br i1 %997, label %998, label %1007

998:                                              ; preds = %992
  %999 = add nsw i32 %44, %891
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1000
  %1002 = load float, float addrspace(1)* %1001, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1003 = sitofp i32 %994 to float
  %1004 = fadd contract float %1002, %1003
  %1005 = fptosi float %1004 to i32
  %1006 = add nsw i32 %993, 1
  br label %1007

1007:                                             ; preds = %998, %992
  %1008 = phi i32 [ %1006, %998 ], [ %993, %992 ]
  %1009 = phi i32 [ %1005, %998 ], [ %994, %992 ]
  %1010 = select i1 %889, i1 %890, i1 false
  %1011 = select i1 %1010, i1 %48, i1 false
  %1012 = select i1 %1011, i1 %49, i1 false
  br i1 %1012, label %1013, label %1022

1013:                                             ; preds = %1007
  %1014 = add nsw i32 %47, %891
  %1015 = sext i32 %1014 to i64
  %1016 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1015
  %1017 = load float, float addrspace(1)* %1016, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1018 = sitofp i32 %1009 to float
  %1019 = fadd contract float %1017, %1018
  %1020 = fptosi float %1019 to i32
  %1021 = add nsw i32 %1008, 1
  br label %1022

1022:                                             ; preds = %1013, %1007
  %1023 = phi i32 [ %1021, %1013 ], [ %1008, %1007 ]
  %1024 = phi i32 [ %1020, %1013 ], [ %1009, %1007 ]
  %1025 = select i1 %889, i1 %890, i1 false
  %1026 = select i1 %1025, i1 %51, i1 false
  %1027 = select i1 %1026, i1 %52, i1 false
  br i1 %1027, label %1028, label %1037

1028:                                             ; preds = %1022
  %1029 = add nsw i32 %50, %891
  %1030 = sext i32 %1029 to i64
  %1031 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1030
  %1032 = load float, float addrspace(1)* %1031, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1033 = sitofp i32 %1024 to float
  %1034 = fadd contract float %1032, %1033
  %1035 = fptosi float %1034 to i32
  %1036 = add nsw i32 %1023, 1
  br label %1037

1037:                                             ; preds = %1028, %1022
  %1038 = phi i32 [ %1036, %1028 ], [ %1023, %1022 ]
  %1039 = phi i32 [ %1035, %1028 ], [ %1024, %1022 ]
  %1040 = select i1 %889, i1 %890, i1 false
  %1041 = select i1 %1040, i1 %54, i1 false
  %1042 = select i1 %1041, i1 %55, i1 false
  br i1 %1042, label %1043, label %1052

1043:                                             ; preds = %1037
  %1044 = add nsw i32 %53, %891
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1045
  %1047 = load float, float addrspace(1)* %1046, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1048 = sitofp i32 %1039 to float
  %1049 = fadd contract float %1047, %1048
  %1050 = fptosi float %1049 to i32
  %1051 = add nsw i32 %1038, 1
  br label %1052

1052:                                             ; preds = %1043, %1037
  %1053 = phi i32 [ %1051, %1043 ], [ %1038, %1037 ]
  %1054 = phi i32 [ %1050, %1043 ], [ %1039, %1037 ]
  %1055 = add nsw i32 %21, 1
  %1056 = icmp sgt i32 %21, -2
  %1057 = icmp slt i32 %1055, %3
  %1058 = mul nsw i32 %1055, %2
  %1059 = select i1 %1056, i1 %1057, i1 false
  %1060 = select i1 %1059, i1 %27, i1 false
  %1061 = select i1 %1060, i1 %28, i1 false
  br i1 %1061, label %1062, label %1071

1062:                                             ; preds = %1052
  %1063 = add nsw i32 %26, %1058
  %1064 = sext i32 %1063 to i64
  %1065 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1064
  %1066 = load float, float addrspace(1)* %1065, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1067 = sitofp i32 %1054 to float
  %1068 = fadd contract float %1066, %1067
  %1069 = fptosi float %1068 to i32
  %1070 = add nsw i32 %1053, 1
  br label %1071

1071:                                             ; preds = %1062, %1052
  %1072 = phi i32 [ %1070, %1062 ], [ %1053, %1052 ]
  %1073 = phi i32 [ %1069, %1062 ], [ %1054, %1052 ]
  %1074 = select i1 %1056, i1 %1057, i1 false
  %1075 = select i1 %1074, i1 %30, i1 false
  %1076 = select i1 %1075, i1 %31, i1 false
  br i1 %1076, label %1077, label %1086

1077:                                             ; preds = %1071
  %1078 = add nsw i32 %29, %1058
  %1079 = sext i32 %1078 to i64
  %1080 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1079
  %1081 = load float, float addrspace(1)* %1080, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1082 = sitofp i32 %1073 to float
  %1083 = fadd contract float %1081, %1082
  %1084 = fptosi float %1083 to i32
  %1085 = add nsw i32 %1072, 1
  br label %1086

1086:                                             ; preds = %1077, %1071
  %1087 = phi i32 [ %1085, %1077 ], [ %1072, %1071 ]
  %1088 = phi i32 [ %1084, %1077 ], [ %1073, %1071 ]
  %1089 = select i1 %1056, i1 %1057, i1 false
  %1090 = select i1 %1089, i1 %33, i1 false
  %1091 = select i1 %1090, i1 %34, i1 false
  br i1 %1091, label %1092, label %1101

1092:                                             ; preds = %1086
  %1093 = add nsw i32 %32, %1058
  %1094 = sext i32 %1093 to i64
  %1095 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1094
  %1096 = load float, float addrspace(1)* %1095, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1097 = sitofp i32 %1088 to float
  %1098 = fadd contract float %1096, %1097
  %1099 = fptosi float %1098 to i32
  %1100 = add nsw i32 %1087, 1
  br label %1101

1101:                                             ; preds = %1092, %1086
  %1102 = phi i32 [ %1100, %1092 ], [ %1087, %1086 ]
  %1103 = phi i32 [ %1099, %1092 ], [ %1088, %1086 ]
  %1104 = select i1 %1056, i1 %1057, i1 false
  %1105 = select i1 %1104, i1 %36, i1 false
  %1106 = select i1 %1105, i1 %37, i1 false
  br i1 %1106, label %1107, label %1116

1107:                                             ; preds = %1101
  %1108 = add nsw i32 %35, %1058
  %1109 = sext i32 %1108 to i64
  %1110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1109
  %1111 = load float, float addrspace(1)* %1110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1112 = sitofp i32 %1103 to float
  %1113 = fadd contract float %1111, %1112
  %1114 = fptosi float %1113 to i32
  %1115 = add nsw i32 %1102, 1
  br label %1116

1116:                                             ; preds = %1107, %1101
  %1117 = phi i32 [ %1115, %1107 ], [ %1102, %1101 ]
  %1118 = phi i32 [ %1114, %1107 ], [ %1103, %1101 ]
  %1119 = select i1 %1056, i1 %1057, i1 false
  %1120 = select i1 %1119, i1 %39, i1 false
  br i1 %1120, label %1121, label %1130

1121:                                             ; preds = %1116
  %1122 = add nsw i32 %38, %1058
  %1123 = sext i32 %1122 to i64
  %1124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1123
  %1125 = load float, float addrspace(1)* %1124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1126 = sitofp i32 %1118 to float
  %1127 = fadd contract float %1125, %1126
  %1128 = fptosi float %1127 to i32
  %1129 = add nsw i32 %1117, 1
  br label %1130

1130:                                             ; preds = %1121, %1116
  %1131 = phi i32 [ %1129, %1121 ], [ %1117, %1116 ]
  %1132 = phi i32 [ %1128, %1121 ], [ %1118, %1116 ]
  %1133 = select i1 %1056, i1 %1057, i1 false
  %1134 = select i1 %1133, i1 %40, i1 false
  br i1 %1134, label %1135, label %1144

1135:                                             ; preds = %1130
  %1136 = add nsw i32 %13, %1058
  %1137 = sext i32 %1136 to i64
  %1138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1137
  %1139 = load float, float addrspace(1)* %1138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1140 = sitofp i32 %1132 to float
  %1141 = fadd contract float %1139, %1140
  %1142 = fptosi float %1141 to i32
  %1143 = add nsw i32 %1131, 1
  br label %1144

1144:                                             ; preds = %1135, %1130
  %1145 = phi i32 [ %1143, %1135 ], [ %1131, %1130 ]
  %1146 = phi i32 [ %1142, %1135 ], [ %1132, %1130 ]
  %1147 = select i1 %1056, i1 %1057, i1 false
  %1148 = select i1 %1147, i1 %42, i1 false
  %1149 = select i1 %1148, i1 %43, i1 false
  br i1 %1149, label %1150, label %1159

1150:                                             ; preds = %1144
  %1151 = add nsw i32 %41, %1058
  %1152 = sext i32 %1151 to i64
  %1153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1152
  %1154 = load float, float addrspace(1)* %1153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1155 = sitofp i32 %1146 to float
  %1156 = fadd contract float %1154, %1155
  %1157 = fptosi float %1156 to i32
  %1158 = add nsw i32 %1145, 1
  br label %1159

1159:                                             ; preds = %1150, %1144
  %1160 = phi i32 [ %1158, %1150 ], [ %1145, %1144 ]
  %1161 = phi i32 [ %1157, %1150 ], [ %1146, %1144 ]
  %1162 = select i1 %1056, i1 %1057, i1 false
  %1163 = select i1 %1162, i1 %45, i1 false
  %1164 = select i1 %1163, i1 %46, i1 false
  br i1 %1164, label %1165, label %1174

1165:                                             ; preds = %1159
  %1166 = add nsw i32 %44, %1058
  %1167 = sext i32 %1166 to i64
  %1168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1167
  %1169 = load float, float addrspace(1)* %1168, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1170 = sitofp i32 %1161 to float
  %1171 = fadd contract float %1169, %1170
  %1172 = fptosi float %1171 to i32
  %1173 = add nsw i32 %1160, 1
  br label %1174

1174:                                             ; preds = %1165, %1159
  %1175 = phi i32 [ %1173, %1165 ], [ %1160, %1159 ]
  %1176 = phi i32 [ %1172, %1165 ], [ %1161, %1159 ]
  %1177 = select i1 %1056, i1 %1057, i1 false
  %1178 = select i1 %1177, i1 %48, i1 false
  %1179 = select i1 %1178, i1 %49, i1 false
  br i1 %1179, label %1180, label %1189

1180:                                             ; preds = %1174
  %1181 = add nsw i32 %47, %1058
  %1182 = sext i32 %1181 to i64
  %1183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1182
  %1184 = load float, float addrspace(1)* %1183, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1185 = sitofp i32 %1176 to float
  %1186 = fadd contract float %1184, %1185
  %1187 = fptosi float %1186 to i32
  %1188 = add nsw i32 %1175, 1
  br label %1189

1189:                                             ; preds = %1180, %1174
  %1190 = phi i32 [ %1188, %1180 ], [ %1175, %1174 ]
  %1191 = phi i32 [ %1187, %1180 ], [ %1176, %1174 ]
  %1192 = select i1 %1056, i1 %1057, i1 false
  %1193 = select i1 %1192, i1 %51, i1 false
  %1194 = select i1 %1193, i1 %52, i1 false
  br i1 %1194, label %1195, label %1204

1195:                                             ; preds = %1189
  %1196 = add nsw i32 %50, %1058
  %1197 = sext i32 %1196 to i64
  %1198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1197
  %1199 = load float, float addrspace(1)* %1198, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1200 = sitofp i32 %1191 to float
  %1201 = fadd contract float %1199, %1200
  %1202 = fptosi float %1201 to i32
  %1203 = add nsw i32 %1190, 1
  br label %1204

1204:                                             ; preds = %1195, %1189
  %1205 = phi i32 [ %1203, %1195 ], [ %1190, %1189 ]
  %1206 = phi i32 [ %1202, %1195 ], [ %1191, %1189 ]
  %1207 = select i1 %1056, i1 %1057, i1 false
  %1208 = select i1 %1207, i1 %54, i1 false
  %1209 = select i1 %1208, i1 %55, i1 false
  br i1 %1209, label %1210, label %1219

1210:                                             ; preds = %1204
  %1211 = add nsw i32 %53, %1058
  %1212 = sext i32 %1211 to i64
  %1213 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1212
  %1214 = load float, float addrspace(1)* %1213, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1215 = sitofp i32 %1206 to float
  %1216 = fadd contract float %1214, %1215
  %1217 = fptosi float %1216 to i32
  %1218 = add nsw i32 %1205, 1
  br label %1219

1219:                                             ; preds = %1210, %1204
  %1220 = phi i32 [ %1218, %1210 ], [ %1205, %1204 ]
  %1221 = phi i32 [ %1217, %1210 ], [ %1206, %1204 ]
  %1222 = add nsw i32 %21, 2
  %1223 = icmp sgt i32 %21, -3
  %1224 = icmp slt i32 %1222, %3
  %1225 = mul nsw i32 %1222, %2
  %1226 = select i1 %1223, i1 %1224, i1 false
  %1227 = select i1 %1226, i1 %27, i1 false
  %1228 = select i1 %1227, i1 %28, i1 false
  br i1 %1228, label %1229, label %1238

1229:                                             ; preds = %1219
  %1230 = add nsw i32 %26, %1225
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1231
  %1233 = load float, float addrspace(1)* %1232, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1234 = sitofp i32 %1221 to float
  %1235 = fadd contract float %1233, %1234
  %1236 = fptosi float %1235 to i32
  %1237 = add nsw i32 %1220, 1
  br label %1238

1238:                                             ; preds = %1229, %1219
  %1239 = phi i32 [ %1237, %1229 ], [ %1220, %1219 ]
  %1240 = phi i32 [ %1236, %1229 ], [ %1221, %1219 ]
  %1241 = select i1 %1223, i1 %1224, i1 false
  %1242 = select i1 %1241, i1 %30, i1 false
  %1243 = select i1 %1242, i1 %31, i1 false
  br i1 %1243, label %1244, label %1253

1244:                                             ; preds = %1238
  %1245 = add nsw i32 %29, %1225
  %1246 = sext i32 %1245 to i64
  %1247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1246
  %1248 = load float, float addrspace(1)* %1247, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1249 = sitofp i32 %1240 to float
  %1250 = fadd contract float %1248, %1249
  %1251 = fptosi float %1250 to i32
  %1252 = add nsw i32 %1239, 1
  br label %1253

1253:                                             ; preds = %1244, %1238
  %1254 = phi i32 [ %1252, %1244 ], [ %1239, %1238 ]
  %1255 = phi i32 [ %1251, %1244 ], [ %1240, %1238 ]
  %1256 = select i1 %1223, i1 %1224, i1 false
  %1257 = select i1 %1256, i1 %33, i1 false
  %1258 = select i1 %1257, i1 %34, i1 false
  br i1 %1258, label %1259, label %1268

1259:                                             ; preds = %1253
  %1260 = add nsw i32 %32, %1225
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1261
  %1263 = load float, float addrspace(1)* %1262, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1264 = sitofp i32 %1255 to float
  %1265 = fadd contract float %1263, %1264
  %1266 = fptosi float %1265 to i32
  %1267 = add nsw i32 %1254, 1
  br label %1268

1268:                                             ; preds = %1259, %1253
  %1269 = phi i32 [ %1267, %1259 ], [ %1254, %1253 ]
  %1270 = phi i32 [ %1266, %1259 ], [ %1255, %1253 ]
  %1271 = select i1 %1223, i1 %1224, i1 false
  %1272 = select i1 %1271, i1 %36, i1 false
  %1273 = select i1 %1272, i1 %37, i1 false
  br i1 %1273, label %1274, label %1283

1274:                                             ; preds = %1268
  %1275 = add nsw i32 %35, %1225
  %1276 = sext i32 %1275 to i64
  %1277 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1276
  %1278 = load float, float addrspace(1)* %1277, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1279 = sitofp i32 %1270 to float
  %1280 = fadd contract float %1278, %1279
  %1281 = fptosi float %1280 to i32
  %1282 = add nsw i32 %1269, 1
  br label %1283

1283:                                             ; preds = %1274, %1268
  %1284 = phi i32 [ %1282, %1274 ], [ %1269, %1268 ]
  %1285 = phi i32 [ %1281, %1274 ], [ %1270, %1268 ]
  %1286 = select i1 %1223, i1 %1224, i1 false
  %1287 = select i1 %1286, i1 %39, i1 false
  br i1 %1287, label %1288, label %1297

1288:                                             ; preds = %1283
  %1289 = add nsw i32 %38, %1225
  %1290 = sext i32 %1289 to i64
  %1291 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1290
  %1292 = load float, float addrspace(1)* %1291, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1293 = sitofp i32 %1285 to float
  %1294 = fadd contract float %1292, %1293
  %1295 = fptosi float %1294 to i32
  %1296 = add nsw i32 %1284, 1
  br label %1297

1297:                                             ; preds = %1288, %1283
  %1298 = phi i32 [ %1296, %1288 ], [ %1284, %1283 ]
  %1299 = phi i32 [ %1295, %1288 ], [ %1285, %1283 ]
  %1300 = select i1 %1223, i1 %1224, i1 false
  %1301 = select i1 %1300, i1 %40, i1 false
  br i1 %1301, label %1302, label %1311

1302:                                             ; preds = %1297
  %1303 = add nsw i32 %13, %1225
  %1304 = sext i32 %1303 to i64
  %1305 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1304
  %1306 = load float, float addrspace(1)* %1305, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1307 = sitofp i32 %1299 to float
  %1308 = fadd contract float %1306, %1307
  %1309 = fptosi float %1308 to i32
  %1310 = add nsw i32 %1298, 1
  br label %1311

1311:                                             ; preds = %1302, %1297
  %1312 = phi i32 [ %1310, %1302 ], [ %1298, %1297 ]
  %1313 = phi i32 [ %1309, %1302 ], [ %1299, %1297 ]
  %1314 = select i1 %1223, i1 %1224, i1 false
  %1315 = select i1 %1314, i1 %42, i1 false
  %1316 = select i1 %1315, i1 %43, i1 false
  br i1 %1316, label %1317, label %1326

1317:                                             ; preds = %1311
  %1318 = add nsw i32 %41, %1225
  %1319 = sext i32 %1318 to i64
  %1320 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1319
  %1321 = load float, float addrspace(1)* %1320, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1322 = sitofp i32 %1313 to float
  %1323 = fadd contract float %1321, %1322
  %1324 = fptosi float %1323 to i32
  %1325 = add nsw i32 %1312, 1
  br label %1326

1326:                                             ; preds = %1317, %1311
  %1327 = phi i32 [ %1325, %1317 ], [ %1312, %1311 ]
  %1328 = phi i32 [ %1324, %1317 ], [ %1313, %1311 ]
  %1329 = select i1 %1223, i1 %1224, i1 false
  %1330 = select i1 %1329, i1 %45, i1 false
  %1331 = select i1 %1330, i1 %46, i1 false
  br i1 %1331, label %1332, label %1341

1332:                                             ; preds = %1326
  %1333 = add nsw i32 %44, %1225
  %1334 = sext i32 %1333 to i64
  %1335 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1334
  %1336 = load float, float addrspace(1)* %1335, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1337 = sitofp i32 %1328 to float
  %1338 = fadd contract float %1336, %1337
  %1339 = fptosi float %1338 to i32
  %1340 = add nsw i32 %1327, 1
  br label %1341

1341:                                             ; preds = %1332, %1326
  %1342 = phi i32 [ %1340, %1332 ], [ %1327, %1326 ]
  %1343 = phi i32 [ %1339, %1332 ], [ %1328, %1326 ]
  %1344 = select i1 %1223, i1 %1224, i1 false
  %1345 = select i1 %1344, i1 %48, i1 false
  %1346 = select i1 %1345, i1 %49, i1 false
  br i1 %1346, label %1347, label %1356

1347:                                             ; preds = %1341
  %1348 = add nsw i32 %47, %1225
  %1349 = sext i32 %1348 to i64
  %1350 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1349
  %1351 = load float, float addrspace(1)* %1350, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1352 = sitofp i32 %1343 to float
  %1353 = fadd contract float %1351, %1352
  %1354 = fptosi float %1353 to i32
  %1355 = add nsw i32 %1342, 1
  br label %1356

1356:                                             ; preds = %1347, %1341
  %1357 = phi i32 [ %1355, %1347 ], [ %1342, %1341 ]
  %1358 = phi i32 [ %1354, %1347 ], [ %1343, %1341 ]
  %1359 = select i1 %1223, i1 %1224, i1 false
  %1360 = select i1 %1359, i1 %51, i1 false
  %1361 = select i1 %1360, i1 %52, i1 false
  br i1 %1361, label %1362, label %1371

1362:                                             ; preds = %1356
  %1363 = add nsw i32 %50, %1225
  %1364 = sext i32 %1363 to i64
  %1365 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1364
  %1366 = load float, float addrspace(1)* %1365, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1367 = sitofp i32 %1358 to float
  %1368 = fadd contract float %1366, %1367
  %1369 = fptosi float %1368 to i32
  %1370 = add nsw i32 %1357, 1
  br label %1371

1371:                                             ; preds = %1362, %1356
  %1372 = phi i32 [ %1370, %1362 ], [ %1357, %1356 ]
  %1373 = phi i32 [ %1369, %1362 ], [ %1358, %1356 ]
  %1374 = select i1 %1223, i1 %1224, i1 false
  %1375 = select i1 %1374, i1 %54, i1 false
  %1376 = select i1 %1375, i1 %55, i1 false
  br i1 %1376, label %1377, label %1386

1377:                                             ; preds = %1371
  %1378 = add nsw i32 %53, %1225
  %1379 = sext i32 %1378 to i64
  %1380 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1379
  %1381 = load float, float addrspace(1)* %1380, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1382 = sitofp i32 %1373 to float
  %1383 = fadd contract float %1381, %1382
  %1384 = fptosi float %1383 to i32
  %1385 = add nsw i32 %1372, 1
  br label %1386

1386:                                             ; preds = %1377, %1371
  %1387 = phi i32 [ %1385, %1377 ], [ %1372, %1371 ]
  %1388 = phi i32 [ %1384, %1377 ], [ %1373, %1371 ]
  %1389 = add nsw i32 %21, 3
  %1390 = icmp sgt i32 %21, -4
  %1391 = icmp slt i32 %1389, %3
  %1392 = mul nsw i32 %1389, %2
  %1393 = select i1 %1390, i1 %1391, i1 false
  %1394 = select i1 %1393, i1 %27, i1 false
  %1395 = select i1 %1394, i1 %28, i1 false
  br i1 %1395, label %1396, label %1405

1396:                                             ; preds = %1386
  %1397 = add nsw i32 %26, %1392
  %1398 = sext i32 %1397 to i64
  %1399 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1398
  %1400 = load float, float addrspace(1)* %1399, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1401 = sitofp i32 %1388 to float
  %1402 = fadd contract float %1400, %1401
  %1403 = fptosi float %1402 to i32
  %1404 = add nsw i32 %1387, 1
  br label %1405

1405:                                             ; preds = %1396, %1386
  %1406 = phi i32 [ %1404, %1396 ], [ %1387, %1386 ]
  %1407 = phi i32 [ %1403, %1396 ], [ %1388, %1386 ]
  %1408 = select i1 %1390, i1 %1391, i1 false
  %1409 = select i1 %1408, i1 %30, i1 false
  %1410 = select i1 %1409, i1 %31, i1 false
  br i1 %1410, label %1411, label %1420

1411:                                             ; preds = %1405
  %1412 = add nsw i32 %29, %1392
  %1413 = sext i32 %1412 to i64
  %1414 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1413
  %1415 = load float, float addrspace(1)* %1414, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1416 = sitofp i32 %1407 to float
  %1417 = fadd contract float %1415, %1416
  %1418 = fptosi float %1417 to i32
  %1419 = add nsw i32 %1406, 1
  br label %1420

1420:                                             ; preds = %1411, %1405
  %1421 = phi i32 [ %1419, %1411 ], [ %1406, %1405 ]
  %1422 = phi i32 [ %1418, %1411 ], [ %1407, %1405 ]
  %1423 = select i1 %1390, i1 %1391, i1 false
  %1424 = select i1 %1423, i1 %33, i1 false
  %1425 = select i1 %1424, i1 %34, i1 false
  br i1 %1425, label %1426, label %1435

1426:                                             ; preds = %1420
  %1427 = add nsw i32 %32, %1392
  %1428 = sext i32 %1427 to i64
  %1429 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1428
  %1430 = load float, float addrspace(1)* %1429, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1431 = sitofp i32 %1422 to float
  %1432 = fadd contract float %1430, %1431
  %1433 = fptosi float %1432 to i32
  %1434 = add nsw i32 %1421, 1
  br label %1435

1435:                                             ; preds = %1426, %1420
  %1436 = phi i32 [ %1434, %1426 ], [ %1421, %1420 ]
  %1437 = phi i32 [ %1433, %1426 ], [ %1422, %1420 ]
  %1438 = select i1 %1390, i1 %1391, i1 false
  %1439 = select i1 %1438, i1 %36, i1 false
  %1440 = select i1 %1439, i1 %37, i1 false
  br i1 %1440, label %1441, label %1450

1441:                                             ; preds = %1435
  %1442 = add nsw i32 %35, %1392
  %1443 = sext i32 %1442 to i64
  %1444 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1443
  %1445 = load float, float addrspace(1)* %1444, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1446 = sitofp i32 %1437 to float
  %1447 = fadd contract float %1445, %1446
  %1448 = fptosi float %1447 to i32
  %1449 = add nsw i32 %1436, 1
  br label %1450

1450:                                             ; preds = %1441, %1435
  %1451 = phi i32 [ %1449, %1441 ], [ %1436, %1435 ]
  %1452 = phi i32 [ %1448, %1441 ], [ %1437, %1435 ]
  %1453 = select i1 %1390, i1 %1391, i1 false
  %1454 = select i1 %1453, i1 %39, i1 false
  br i1 %1454, label %1455, label %1464

1455:                                             ; preds = %1450
  %1456 = add nsw i32 %38, %1392
  %1457 = sext i32 %1456 to i64
  %1458 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1457
  %1459 = load float, float addrspace(1)* %1458, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1460 = sitofp i32 %1452 to float
  %1461 = fadd contract float %1459, %1460
  %1462 = fptosi float %1461 to i32
  %1463 = add nsw i32 %1451, 1
  br label %1464

1464:                                             ; preds = %1455, %1450
  %1465 = phi i32 [ %1463, %1455 ], [ %1451, %1450 ]
  %1466 = phi i32 [ %1462, %1455 ], [ %1452, %1450 ]
  %1467 = select i1 %1390, i1 %1391, i1 false
  %1468 = select i1 %1467, i1 %40, i1 false
  br i1 %1468, label %1469, label %1478

1469:                                             ; preds = %1464
  %1470 = add nsw i32 %13, %1392
  %1471 = sext i32 %1470 to i64
  %1472 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1471
  %1473 = load float, float addrspace(1)* %1472, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1474 = sitofp i32 %1466 to float
  %1475 = fadd contract float %1473, %1474
  %1476 = fptosi float %1475 to i32
  %1477 = add nsw i32 %1465, 1
  br label %1478

1478:                                             ; preds = %1469, %1464
  %1479 = phi i32 [ %1477, %1469 ], [ %1465, %1464 ]
  %1480 = phi i32 [ %1476, %1469 ], [ %1466, %1464 ]
  %1481 = select i1 %1390, i1 %1391, i1 false
  %1482 = select i1 %1481, i1 %42, i1 false
  %1483 = select i1 %1482, i1 %43, i1 false
  br i1 %1483, label %1484, label %1493

1484:                                             ; preds = %1478
  %1485 = add nsw i32 %41, %1392
  %1486 = sext i32 %1485 to i64
  %1487 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1486
  %1488 = load float, float addrspace(1)* %1487, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1489 = sitofp i32 %1480 to float
  %1490 = fadd contract float %1488, %1489
  %1491 = fptosi float %1490 to i32
  %1492 = add nsw i32 %1479, 1
  br label %1493

1493:                                             ; preds = %1484, %1478
  %1494 = phi i32 [ %1492, %1484 ], [ %1479, %1478 ]
  %1495 = phi i32 [ %1491, %1484 ], [ %1480, %1478 ]
  %1496 = select i1 %1390, i1 %1391, i1 false
  %1497 = select i1 %1496, i1 %45, i1 false
  %1498 = select i1 %1497, i1 %46, i1 false
  br i1 %1498, label %1499, label %1508

1499:                                             ; preds = %1493
  %1500 = add nsw i32 %44, %1392
  %1501 = sext i32 %1500 to i64
  %1502 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1501
  %1503 = load float, float addrspace(1)* %1502, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1504 = sitofp i32 %1495 to float
  %1505 = fadd contract float %1503, %1504
  %1506 = fptosi float %1505 to i32
  %1507 = add nsw i32 %1494, 1
  br label %1508

1508:                                             ; preds = %1499, %1493
  %1509 = phi i32 [ %1507, %1499 ], [ %1494, %1493 ]
  %1510 = phi i32 [ %1506, %1499 ], [ %1495, %1493 ]
  %1511 = select i1 %1390, i1 %1391, i1 false
  %1512 = select i1 %1511, i1 %48, i1 false
  %1513 = select i1 %1512, i1 %49, i1 false
  br i1 %1513, label %1514, label %1523

1514:                                             ; preds = %1508
  %1515 = add nsw i32 %47, %1392
  %1516 = sext i32 %1515 to i64
  %1517 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1516
  %1518 = load float, float addrspace(1)* %1517, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1519 = sitofp i32 %1510 to float
  %1520 = fadd contract float %1518, %1519
  %1521 = fptosi float %1520 to i32
  %1522 = add nsw i32 %1509, 1
  br label %1523

1523:                                             ; preds = %1514, %1508
  %1524 = phi i32 [ %1522, %1514 ], [ %1509, %1508 ]
  %1525 = phi i32 [ %1521, %1514 ], [ %1510, %1508 ]
  %1526 = select i1 %1390, i1 %1391, i1 false
  %1527 = select i1 %1526, i1 %51, i1 false
  %1528 = select i1 %1527, i1 %52, i1 false
  br i1 %1528, label %1529, label %1538

1529:                                             ; preds = %1523
  %1530 = add nsw i32 %50, %1392
  %1531 = sext i32 %1530 to i64
  %1532 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1531
  %1533 = load float, float addrspace(1)* %1532, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1534 = sitofp i32 %1525 to float
  %1535 = fadd contract float %1533, %1534
  %1536 = fptosi float %1535 to i32
  %1537 = add nsw i32 %1524, 1
  br label %1538

1538:                                             ; preds = %1529, %1523
  %1539 = phi i32 [ %1537, %1529 ], [ %1524, %1523 ]
  %1540 = phi i32 [ %1536, %1529 ], [ %1525, %1523 ]
  %1541 = select i1 %1390, i1 %1391, i1 false
  %1542 = select i1 %1541, i1 %54, i1 false
  %1543 = select i1 %1542, i1 %55, i1 false
  br i1 %1543, label %1544, label %1553

1544:                                             ; preds = %1538
  %1545 = add nsw i32 %53, %1392
  %1546 = sext i32 %1545 to i64
  %1547 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1546
  %1548 = load float, float addrspace(1)* %1547, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1549 = sitofp i32 %1540 to float
  %1550 = fadd contract float %1548, %1549
  %1551 = fptosi float %1550 to i32
  %1552 = add nsw i32 %1539, 1
  br label %1553

1553:                                             ; preds = %1544, %1538
  %1554 = phi i32 [ %1552, %1544 ], [ %1539, %1538 ]
  %1555 = phi i32 [ %1551, %1544 ], [ %1540, %1538 ]
  %1556 = add nsw i32 %21, 4
  %1557 = icmp sgt i32 %21, -5
  %1558 = icmp slt i32 %1556, %3
  %1559 = mul nsw i32 %1556, %2
  %1560 = select i1 %1557, i1 %1558, i1 false
  %1561 = select i1 %1560, i1 %27, i1 false
  %1562 = select i1 %1561, i1 %28, i1 false
  br i1 %1562, label %1563, label %1572

1563:                                             ; preds = %1553
  %1564 = add nsw i32 %26, %1559
  %1565 = sext i32 %1564 to i64
  %1566 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1565
  %1567 = load float, float addrspace(1)* %1566, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1568 = sitofp i32 %1555 to float
  %1569 = fadd contract float %1567, %1568
  %1570 = fptosi float %1569 to i32
  %1571 = add nsw i32 %1554, 1
  br label %1572

1572:                                             ; preds = %1563, %1553
  %1573 = phi i32 [ %1571, %1563 ], [ %1554, %1553 ]
  %1574 = phi i32 [ %1570, %1563 ], [ %1555, %1553 ]
  %1575 = select i1 %1557, i1 %1558, i1 false
  %1576 = select i1 %1575, i1 %30, i1 false
  %1577 = select i1 %1576, i1 %31, i1 false
  br i1 %1577, label %1578, label %1587

1578:                                             ; preds = %1572
  %1579 = add nsw i32 %29, %1559
  %1580 = sext i32 %1579 to i64
  %1581 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1580
  %1582 = load float, float addrspace(1)* %1581, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1583 = sitofp i32 %1574 to float
  %1584 = fadd contract float %1582, %1583
  %1585 = fptosi float %1584 to i32
  %1586 = add nsw i32 %1573, 1
  br label %1587

1587:                                             ; preds = %1578, %1572
  %1588 = phi i32 [ %1586, %1578 ], [ %1573, %1572 ]
  %1589 = phi i32 [ %1585, %1578 ], [ %1574, %1572 ]
  %1590 = select i1 %1557, i1 %1558, i1 false
  %1591 = select i1 %1590, i1 %33, i1 false
  %1592 = select i1 %1591, i1 %34, i1 false
  br i1 %1592, label %1593, label %1602

1593:                                             ; preds = %1587
  %1594 = add nsw i32 %32, %1559
  %1595 = sext i32 %1594 to i64
  %1596 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1595
  %1597 = load float, float addrspace(1)* %1596, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1598 = sitofp i32 %1589 to float
  %1599 = fadd contract float %1597, %1598
  %1600 = fptosi float %1599 to i32
  %1601 = add nsw i32 %1588, 1
  br label %1602

1602:                                             ; preds = %1593, %1587
  %1603 = phi i32 [ %1601, %1593 ], [ %1588, %1587 ]
  %1604 = phi i32 [ %1600, %1593 ], [ %1589, %1587 ]
  %1605 = select i1 %1557, i1 %1558, i1 false
  %1606 = select i1 %1605, i1 %36, i1 false
  %1607 = select i1 %1606, i1 %37, i1 false
  br i1 %1607, label %1608, label %1617

1608:                                             ; preds = %1602
  %1609 = add nsw i32 %35, %1559
  %1610 = sext i32 %1609 to i64
  %1611 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1610
  %1612 = load float, float addrspace(1)* %1611, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1613 = sitofp i32 %1604 to float
  %1614 = fadd contract float %1612, %1613
  %1615 = fptosi float %1614 to i32
  %1616 = add nsw i32 %1603, 1
  br label %1617

1617:                                             ; preds = %1608, %1602
  %1618 = phi i32 [ %1616, %1608 ], [ %1603, %1602 ]
  %1619 = phi i32 [ %1615, %1608 ], [ %1604, %1602 ]
  %1620 = select i1 %1557, i1 %1558, i1 false
  %1621 = select i1 %1620, i1 %39, i1 false
  br i1 %1621, label %1622, label %1631

1622:                                             ; preds = %1617
  %1623 = add nsw i32 %38, %1559
  %1624 = sext i32 %1623 to i64
  %1625 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1624
  %1626 = load float, float addrspace(1)* %1625, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1627 = sitofp i32 %1619 to float
  %1628 = fadd contract float %1626, %1627
  %1629 = fptosi float %1628 to i32
  %1630 = add nsw i32 %1618, 1
  br label %1631

1631:                                             ; preds = %1622, %1617
  %1632 = phi i32 [ %1630, %1622 ], [ %1618, %1617 ]
  %1633 = phi i32 [ %1629, %1622 ], [ %1619, %1617 ]
  %1634 = select i1 %1557, i1 %1558, i1 false
  %1635 = select i1 %1634, i1 %40, i1 false
  br i1 %1635, label %1636, label %1645

1636:                                             ; preds = %1631
  %1637 = add nsw i32 %13, %1559
  %1638 = sext i32 %1637 to i64
  %1639 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1638
  %1640 = load float, float addrspace(1)* %1639, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1641 = sitofp i32 %1633 to float
  %1642 = fadd contract float %1640, %1641
  %1643 = fptosi float %1642 to i32
  %1644 = add nsw i32 %1632, 1
  br label %1645

1645:                                             ; preds = %1636, %1631
  %1646 = phi i32 [ %1644, %1636 ], [ %1632, %1631 ]
  %1647 = phi i32 [ %1643, %1636 ], [ %1633, %1631 ]
  %1648 = select i1 %1557, i1 %1558, i1 false
  %1649 = select i1 %1648, i1 %42, i1 false
  %1650 = select i1 %1649, i1 %43, i1 false
  br i1 %1650, label %1651, label %1660

1651:                                             ; preds = %1645
  %1652 = add nsw i32 %41, %1559
  %1653 = sext i32 %1652 to i64
  %1654 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1653
  %1655 = load float, float addrspace(1)* %1654, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1656 = sitofp i32 %1647 to float
  %1657 = fadd contract float %1655, %1656
  %1658 = fptosi float %1657 to i32
  %1659 = add nsw i32 %1646, 1
  br label %1660

1660:                                             ; preds = %1651, %1645
  %1661 = phi i32 [ %1659, %1651 ], [ %1646, %1645 ]
  %1662 = phi i32 [ %1658, %1651 ], [ %1647, %1645 ]
  %1663 = select i1 %1557, i1 %1558, i1 false
  %1664 = select i1 %1663, i1 %45, i1 false
  %1665 = select i1 %1664, i1 %46, i1 false
  br i1 %1665, label %1666, label %1675

1666:                                             ; preds = %1660
  %1667 = add nsw i32 %44, %1559
  %1668 = sext i32 %1667 to i64
  %1669 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1668
  %1670 = load float, float addrspace(1)* %1669, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1671 = sitofp i32 %1662 to float
  %1672 = fadd contract float %1670, %1671
  %1673 = fptosi float %1672 to i32
  %1674 = add nsw i32 %1661, 1
  br label %1675

1675:                                             ; preds = %1666, %1660
  %1676 = phi i32 [ %1674, %1666 ], [ %1661, %1660 ]
  %1677 = phi i32 [ %1673, %1666 ], [ %1662, %1660 ]
  %1678 = select i1 %1557, i1 %1558, i1 false
  %1679 = select i1 %1678, i1 %48, i1 false
  %1680 = select i1 %1679, i1 %49, i1 false
  br i1 %1680, label %1681, label %1690

1681:                                             ; preds = %1675
  %1682 = add nsw i32 %47, %1559
  %1683 = sext i32 %1682 to i64
  %1684 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1683
  %1685 = load float, float addrspace(1)* %1684, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1686 = sitofp i32 %1677 to float
  %1687 = fadd contract float %1685, %1686
  %1688 = fptosi float %1687 to i32
  %1689 = add nsw i32 %1676, 1
  br label %1690

1690:                                             ; preds = %1681, %1675
  %1691 = phi i32 [ %1689, %1681 ], [ %1676, %1675 ]
  %1692 = phi i32 [ %1688, %1681 ], [ %1677, %1675 ]
  %1693 = select i1 %1557, i1 %1558, i1 false
  %1694 = select i1 %1693, i1 %51, i1 false
  %1695 = select i1 %1694, i1 %52, i1 false
  br i1 %1695, label %1696, label %1705

1696:                                             ; preds = %1690
  %1697 = add nsw i32 %50, %1559
  %1698 = sext i32 %1697 to i64
  %1699 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1698
  %1700 = load float, float addrspace(1)* %1699, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1701 = sitofp i32 %1692 to float
  %1702 = fadd contract float %1700, %1701
  %1703 = fptosi float %1702 to i32
  %1704 = add nsw i32 %1691, 1
  br label %1705

1705:                                             ; preds = %1696, %1690
  %1706 = phi i32 [ %1704, %1696 ], [ %1691, %1690 ]
  %1707 = phi i32 [ %1703, %1696 ], [ %1692, %1690 ]
  %1708 = select i1 %1557, i1 %1558, i1 false
  %1709 = select i1 %1708, i1 %54, i1 false
  %1710 = select i1 %1709, i1 %55, i1 false
  br i1 %1710, label %1711, label %1720

1711:                                             ; preds = %1705
  %1712 = add nsw i32 %53, %1559
  %1713 = sext i32 %1712 to i64
  %1714 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1713
  %1715 = load float, float addrspace(1)* %1714, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1716 = sitofp i32 %1707 to float
  %1717 = fadd contract float %1715, %1716
  %1718 = fptosi float %1717 to i32
  %1719 = add nsw i32 %1706, 1
  br label %1720

1720:                                             ; preds = %1711, %1705
  %1721 = phi i32 [ %1719, %1711 ], [ %1706, %1705 ]
  %1722 = phi i32 [ %1718, %1711 ], [ %1707, %1705 ]
  %1723 = add nsw i32 %21, 5
  %1724 = icmp sgt i32 %21, -6
  %1725 = icmp slt i32 %1723, %3
  %1726 = mul nsw i32 %1723, %2
  %1727 = select i1 %1724, i1 %1725, i1 false
  %1728 = select i1 %1727, i1 %27, i1 false
  %1729 = select i1 %1728, i1 %28, i1 false
  br i1 %1729, label %1730, label %1739

1730:                                             ; preds = %1720
  %1731 = add nsw i32 %26, %1726
  %1732 = sext i32 %1731 to i64
  %1733 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1732
  %1734 = load float, float addrspace(1)* %1733, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1735 = sitofp i32 %1722 to float
  %1736 = fadd contract float %1734, %1735
  %1737 = fptosi float %1736 to i32
  %1738 = add nsw i32 %1721, 1
  br label %1739

1739:                                             ; preds = %1730, %1720
  %1740 = phi i32 [ %1738, %1730 ], [ %1721, %1720 ]
  %1741 = phi i32 [ %1737, %1730 ], [ %1722, %1720 ]
  %1742 = select i1 %1724, i1 %1725, i1 false
  %1743 = select i1 %1742, i1 %30, i1 false
  %1744 = select i1 %1743, i1 %31, i1 false
  br i1 %1744, label %1745, label %1754

1745:                                             ; preds = %1739
  %1746 = add nsw i32 %29, %1726
  %1747 = sext i32 %1746 to i64
  %1748 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1747
  %1749 = load float, float addrspace(1)* %1748, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1750 = sitofp i32 %1741 to float
  %1751 = fadd contract float %1749, %1750
  %1752 = fptosi float %1751 to i32
  %1753 = add nsw i32 %1740, 1
  br label %1754

1754:                                             ; preds = %1745, %1739
  %1755 = phi i32 [ %1753, %1745 ], [ %1740, %1739 ]
  %1756 = phi i32 [ %1752, %1745 ], [ %1741, %1739 ]
  %1757 = select i1 %1724, i1 %1725, i1 false
  %1758 = select i1 %1757, i1 %33, i1 false
  %1759 = select i1 %1758, i1 %34, i1 false
  br i1 %1759, label %1760, label %1769

1760:                                             ; preds = %1754
  %1761 = add nsw i32 %32, %1726
  %1762 = sext i32 %1761 to i64
  %1763 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1762
  %1764 = load float, float addrspace(1)* %1763, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1765 = sitofp i32 %1756 to float
  %1766 = fadd contract float %1764, %1765
  %1767 = fptosi float %1766 to i32
  %1768 = add nsw i32 %1755, 1
  br label %1769

1769:                                             ; preds = %1760, %1754
  %1770 = phi i32 [ %1768, %1760 ], [ %1755, %1754 ]
  %1771 = phi i32 [ %1767, %1760 ], [ %1756, %1754 ]
  %1772 = select i1 %1724, i1 %1725, i1 false
  %1773 = select i1 %1772, i1 %36, i1 false
  %1774 = select i1 %1773, i1 %37, i1 false
  br i1 %1774, label %1775, label %1784

1775:                                             ; preds = %1769
  %1776 = add nsw i32 %35, %1726
  %1777 = sext i32 %1776 to i64
  %1778 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1777
  %1779 = load float, float addrspace(1)* %1778, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1780 = sitofp i32 %1771 to float
  %1781 = fadd contract float %1779, %1780
  %1782 = fptosi float %1781 to i32
  %1783 = add nsw i32 %1770, 1
  br label %1784

1784:                                             ; preds = %1775, %1769
  %1785 = phi i32 [ %1783, %1775 ], [ %1770, %1769 ]
  %1786 = phi i32 [ %1782, %1775 ], [ %1771, %1769 ]
  %1787 = select i1 %1724, i1 %1725, i1 false
  %1788 = select i1 %1787, i1 %39, i1 false
  br i1 %1788, label %1789, label %1798

1789:                                             ; preds = %1784
  %1790 = add nsw i32 %38, %1726
  %1791 = sext i32 %1790 to i64
  %1792 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1791
  %1793 = load float, float addrspace(1)* %1792, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1794 = sitofp i32 %1786 to float
  %1795 = fadd contract float %1793, %1794
  %1796 = fptosi float %1795 to i32
  %1797 = add nsw i32 %1785, 1
  br label %1798

1798:                                             ; preds = %1789, %1784
  %1799 = phi i32 [ %1797, %1789 ], [ %1785, %1784 ]
  %1800 = phi i32 [ %1796, %1789 ], [ %1786, %1784 ]
  %1801 = select i1 %1724, i1 %1725, i1 false
  %1802 = select i1 %1801, i1 %40, i1 false
  br i1 %1802, label %1803, label %1812

1803:                                             ; preds = %1798
  %1804 = add nsw i32 %13, %1726
  %1805 = sext i32 %1804 to i64
  %1806 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1805
  %1807 = load float, float addrspace(1)* %1806, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1808 = sitofp i32 %1800 to float
  %1809 = fadd contract float %1807, %1808
  %1810 = fptosi float %1809 to i32
  %1811 = add nsw i32 %1799, 1
  br label %1812

1812:                                             ; preds = %1803, %1798
  %1813 = phi i32 [ %1811, %1803 ], [ %1799, %1798 ]
  %1814 = phi i32 [ %1810, %1803 ], [ %1800, %1798 ]
  %1815 = select i1 %1724, i1 %1725, i1 false
  %1816 = select i1 %1815, i1 %42, i1 false
  %1817 = select i1 %1816, i1 %43, i1 false
  br i1 %1817, label %1818, label %1827

1818:                                             ; preds = %1812
  %1819 = add nsw i32 %41, %1726
  %1820 = sext i32 %1819 to i64
  %1821 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1820
  %1822 = load float, float addrspace(1)* %1821, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1823 = sitofp i32 %1814 to float
  %1824 = fadd contract float %1822, %1823
  %1825 = fptosi float %1824 to i32
  %1826 = add nsw i32 %1813, 1
  br label %1827

1827:                                             ; preds = %1818, %1812
  %1828 = phi i32 [ %1826, %1818 ], [ %1813, %1812 ]
  %1829 = phi i32 [ %1825, %1818 ], [ %1814, %1812 ]
  %1830 = select i1 %1724, i1 %1725, i1 false
  %1831 = select i1 %1830, i1 %45, i1 false
  %1832 = select i1 %1831, i1 %46, i1 false
  br i1 %1832, label %1833, label %1842

1833:                                             ; preds = %1827
  %1834 = add nsw i32 %44, %1726
  %1835 = sext i32 %1834 to i64
  %1836 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1835
  %1837 = load float, float addrspace(1)* %1836, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1838 = sitofp i32 %1829 to float
  %1839 = fadd contract float %1837, %1838
  %1840 = fptosi float %1839 to i32
  %1841 = add nsw i32 %1828, 1
  br label %1842

1842:                                             ; preds = %1833, %1827
  %1843 = phi i32 [ %1841, %1833 ], [ %1828, %1827 ]
  %1844 = phi i32 [ %1840, %1833 ], [ %1829, %1827 ]
  %1845 = select i1 %1724, i1 %1725, i1 false
  %1846 = select i1 %1845, i1 %48, i1 false
  %1847 = select i1 %1846, i1 %49, i1 false
  br i1 %1847, label %1848, label %1857

1848:                                             ; preds = %1842
  %1849 = add nsw i32 %47, %1726
  %1850 = sext i32 %1849 to i64
  %1851 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1850
  %1852 = load float, float addrspace(1)* %1851, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1853 = sitofp i32 %1844 to float
  %1854 = fadd contract float %1852, %1853
  %1855 = fptosi float %1854 to i32
  %1856 = add nsw i32 %1843, 1
  br label %1857

1857:                                             ; preds = %1848, %1842
  %1858 = phi i32 [ %1856, %1848 ], [ %1843, %1842 ]
  %1859 = phi i32 [ %1855, %1848 ], [ %1844, %1842 ]
  %1860 = select i1 %1724, i1 %1725, i1 false
  %1861 = select i1 %1860, i1 %51, i1 false
  %1862 = select i1 %1861, i1 %52, i1 false
  br i1 %1862, label %1863, label %1872

1863:                                             ; preds = %1857
  %1864 = add nsw i32 %50, %1726
  %1865 = sext i32 %1864 to i64
  %1866 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1865
  %1867 = load float, float addrspace(1)* %1866, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1868 = sitofp i32 %1859 to float
  %1869 = fadd contract float %1867, %1868
  %1870 = fptosi float %1869 to i32
  %1871 = add nsw i32 %1858, 1
  br label %1872

1872:                                             ; preds = %1863, %1857
  %1873 = phi i32 [ %1871, %1863 ], [ %1858, %1857 ]
  %1874 = phi i32 [ %1870, %1863 ], [ %1859, %1857 ]
  %1875 = select i1 %1724, i1 %1725, i1 false
  %1876 = select i1 %1875, i1 %54, i1 false
  %1877 = select i1 %1876, i1 %55, i1 false
  br i1 %1877, label %1878, label %1887

1878:                                             ; preds = %1872
  %1879 = add nsw i32 %53, %1726
  %1880 = sext i32 %1879 to i64
  %1881 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1880
  %1882 = load float, float addrspace(1)* %1881, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1883 = sitofp i32 %1874 to float
  %1884 = fadd contract float %1882, %1883
  %1885 = fptosi float %1884 to i32
  %1886 = add nsw i32 %1873, 1
  br label %1887

1887:                                             ; preds = %1878, %1872
  %1888 = phi i32 [ %1886, %1878 ], [ %1873, %1872 ]
  %1889 = phi i32 [ %1885, %1878 ], [ %1874, %1872 ]
  %1890 = sdiv i32 %1889, %1888
  %1891 = trunc i32 %1890 to i8
  %1892 = uitofp i8 %1891 to float
  %1893 = mul nsw i32 %21, %2
  %1894 = add nsw i32 %1893, %13
  %1895 = sext i32 %1894 to i64
  %1896 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1895
  store float %1892, float addrspace(1)* %1896, align 4, !tbaa !7
  br label %1897

1897:                                             ; preds = %1887, %4
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
