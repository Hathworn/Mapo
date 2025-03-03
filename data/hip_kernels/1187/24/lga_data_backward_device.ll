; ModuleID = '../data/hip_kernels/1187/24/main.cu'
source_filename = "../data/hip_kernels/1187/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17lga_data_backwardiPKfS0_iiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %427

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = shl nsw i32 %6, 1
  %22 = add nuw nsw i32 %21, 1
  %23 = mul nsw i32 %20, %5
  %24 = sdiv i32 %17, %23
  %25 = mul i32 %22, %22
  %26 = mul i32 %25, 3
  %27 = mul i32 %26, %20
  %28 = mul i32 %27, %24
  %29 = freeze i32 %17
  %30 = freeze i32 %20
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = add nsw i32 %28, %33
  %35 = sdiv i32 %33, %4
  %36 = srem i32 %17, %4
  %37 = srem i32 %31, %5
  %38 = sub i32 0, %6
  %39 = icmp slt i32 %6, 0
  %40 = sext i32 %17 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = getelementptr inbounds float, float addrspace(1)* %7, i64 %40
  %43 = tail call i32 @llvm.abs.i32(i32 %6, i1 false)
  br i1 %39, label %427, label %44

44:                                               ; preds = %19
  %45 = icmp sgt i32 %37, 0
  %46 = icmp sgt i32 %5, -1
  %47 = shl i32 %22, 1
  %48 = add i32 %43, %6
  %49 = add i32 %48, 1
  %50 = and i32 %49, 1
  %51 = icmp eq i32 %50, 0
  %52 = sub i32 %36, %6
  %53 = icmp sgt i32 %52, -1
  %54 = icmp slt i32 %52, %4
  %55 = sub i32 1, %6
  %56 = icmp eq i32 %48, 0
  br label %57

57:                                               ; preds = %44, %355
  %58 = phi i32 [ %38, %44 ], [ %356, %355 ]
  %59 = add nsw i32 %58, %35
  %60 = icmp sgt i32 %59, -1
  %61 = icmp slt i32 %59, %3
  %62 = add i32 %58, %6
  %63 = mul i32 %62, %22
  %64 = add i32 %63, %6
  %65 = mul nsw i32 %58, %4
  %66 = sub i32 %6, %58
  %67 = add i32 %66, %47
  %68 = mul i32 %67, %22
  %69 = add i32 %68, %6
  br i1 %51, label %99, label %70

70:                                               ; preds = %57
  %71 = select i1 %60, i1 %53, i1 false
  %72 = select i1 %71, i1 %45, i1 false
  %73 = select i1 %72, i1 %61, i1 false
  %74 = select i1 %73, i1 %54, i1 false
  %75 = select i1 %74, i1 %46, i1 false
  br i1 %75, label %79, label %76

76:                                               ; preds = %70
  %77 = mul nsw i32 %63, %20
  %78 = add nsw i32 %77, %34
  br label %89

79:                                               ; preds = %70
  %80 = sub i32 %65, %6
  %81 = add i32 %69, %6
  %82 = add i32 %80, %17
  %83 = sub i32 %82, %20
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = mul nsw i32 %81, %20
  %87 = add i32 %80, %34
  %88 = add i32 %87, %86
  br label %89

89:                                               ; preds = %79, %76
  %90 = phi i32 [ %78, %76 ], [ %88, %79 ]
  %91 = phi float addrspace(1)* [ %41, %76 ], [ %85, %79 ]
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = sext i32 %90 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fmul contract float %92, %95
  %97 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %98 = fadd contract float %97, %96
  store float %98, float addrspace(1)* %42, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %89, %57
  %100 = phi i32 [ %38, %57 ], [ %55, %89 ]
  br i1 %56, label %355, label %358

101:                                              ; preds = %355
  br i1 %39, label %427, label %102

102:                                              ; preds = %101
  %103 = icmp sgt i32 %37, -1
  %104 = icmp sgt i32 %5, -1
  %105 = add i32 %22, %6
  %106 = and i32 %49, 1
  %107 = icmp eq i32 %106, 0
  %108 = sub i32 %36, %6
  %109 = icmp sgt i32 %108, -1
  %110 = icmp slt i32 %108, %4
  %111 = sub i32 1, %6
  %112 = icmp eq i32 %48, 0
  br label %113

113:                                              ; preds = %223, %102
  %114 = phi i32 [ %38, %102 ], [ %224, %223 ]
  %115 = add nsw i32 %114, %35
  %116 = icmp sgt i32 %115, -1
  %117 = icmp slt i32 %115, %3
  %118 = add i32 %105, %114
  %119 = mul i32 %118, %22
  %120 = add i32 %119, %6
  %121 = mul nsw i32 %114, %4
  %122 = sub i32 %6, %114
  %123 = add i32 %122, %22
  %124 = mul i32 %123, %22
  %125 = add i32 %124, %6
  br i1 %107, label %154, label %126

126:                                              ; preds = %113
  %127 = select i1 %116, i1 %109, i1 false
  %128 = select i1 %127, i1 %103, i1 false
  %129 = select i1 %128, i1 %117, i1 false
  %130 = select i1 %129, i1 %110, i1 false
  %131 = select i1 %130, i1 %104, i1 false
  br i1 %131, label %135, label %132

132:                                              ; preds = %126
  %133 = mul nsw i32 %119, %20
  %134 = add nsw i32 %133, %34
  br label %144

135:                                              ; preds = %126
  %136 = sub i32 %121, %6
  %137 = add i32 %125, %6
  %138 = add i32 %136, %17
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = mul nsw i32 %137, %20
  %142 = add i32 %136, %34
  %143 = add i32 %142, %141
  br label %144

144:                                              ; preds = %135, %132
  %145 = phi i32 [ %143, %135 ], [ %134, %132 ]
  %146 = phi float addrspace(1)* [ %140, %135 ], [ %41, %132 ]
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = sext i32 %145 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fmul contract float %147, %150
  %152 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %153 = fadd contract float %152, %151
  store float %153, float addrspace(1)* %42, align 4, !tbaa !7
  br label %154

154:                                              ; preds = %144, %113
  %155 = phi i32 [ %38, %113 ], [ %111, %144 ]
  br i1 %112, label %223, label %156

156:                                              ; preds = %154, %211
  %157 = phi i32 [ %221, %211 ], [ %155, %154 ]
  %158 = add nsw i32 %157, %36
  %159 = icmp sgt i32 %158, -1
  %160 = select i1 %116, i1 %159, i1 false
  %161 = select i1 %160, i1 %103, i1 false
  %162 = select i1 %161, i1 %117, i1 false
  %163 = icmp slt i32 %158, %4
  %164 = select i1 %162, i1 %163, i1 false
  %165 = select i1 %164, i1 %104, i1 false
  br i1 %165, label %170, label %166

166:                                              ; preds = %156
  %167 = add i32 %120, %157
  %168 = mul nsw i32 %167, %20
  %169 = add nsw i32 %168, %34
  br label %179

170:                                              ; preds = %156
  %171 = add i32 %157, %121
  %172 = sub i32 %125, %157
  %173 = add i32 %171, %17
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %2, i64 %174
  %176 = mul nsw i32 %172, %20
  %177 = add i32 %171, %34
  %178 = add i32 %177, %176
  br label %179

179:                                              ; preds = %170, %166
  %180 = phi i32 [ %178, %170 ], [ %169, %166 ]
  %181 = phi float addrspace(1)* [ %175, %170 ], [ %41, %166 ]
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = sext i32 %180 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = fmul contract float %182, %185
  %187 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %188 = fadd contract float %187, %186
  store float %188, float addrspace(1)* %42, align 4, !tbaa !7
  %189 = add i32 %157, 1
  %190 = add nsw i32 %189, %36
  %191 = icmp sgt i32 %190, -1
  %192 = select i1 %116, i1 %191, i1 false
  %193 = select i1 %192, i1 %103, i1 false
  %194 = select i1 %193, i1 %117, i1 false
  %195 = icmp slt i32 %190, %4
  %196 = select i1 %194, i1 %195, i1 false
  %197 = select i1 %196, i1 %104, i1 false
  br i1 %197, label %202, label %198

198:                                              ; preds = %179
  %199 = add i32 %120, %189
  %200 = mul nsw i32 %199, %20
  %201 = add nsw i32 %200, %34
  br label %211

202:                                              ; preds = %179
  %203 = add i32 %189, %121
  %204 = sub i32 %125, %189
  %205 = add i32 %203, %17
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %2, i64 %206
  %208 = mul nsw i32 %204, %20
  %209 = add i32 %203, %34
  %210 = add i32 %209, %208
  br label %211

211:                                              ; preds = %202, %198
  %212 = phi i32 [ %210, %202 ], [ %201, %198 ]
  %213 = phi float addrspace(1)* [ %207, %202 ], [ %41, %198 ]
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = sext i32 %212 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = fmul contract float %214, %217
  %219 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %220 = fadd contract float %219, %218
  store float %220, float addrspace(1)* %42, align 4, !tbaa !7
  %221 = add i32 %157, 2
  %222 = icmp eq i32 %189, %43
  br i1 %222, label %223, label %156, !llvm.loop !11

223:                                              ; preds = %211, %154
  %224 = add i32 %114, 1
  %225 = icmp eq i32 %114, %43
  br i1 %225, label %226, label %113, !llvm.loop !13

226:                                              ; preds = %223
  br i1 %39, label %427, label %227

227:                                              ; preds = %226
  %228 = add nsw i32 %37, 1
  %229 = icmp sgt i32 %37, -2
  %230 = icmp slt i32 %228, %5
  %231 = shl i32 %22, 1
  %232 = add i32 %231, %6
  %233 = and i32 %49, 1
  %234 = icmp eq i32 %233, 0
  %235 = sub i32 %36, %6
  %236 = icmp sgt i32 %235, -1
  %237 = icmp slt i32 %235, %4
  %238 = sub i32 1, %6
  %239 = icmp eq i32 %48, 0
  br label %240

240:                                              ; preds = %352, %227
  %241 = phi i32 [ %38, %227 ], [ %353, %352 ]
  %242 = add nsw i32 %241, %35
  %243 = icmp sgt i32 %242, -1
  %244 = icmp slt i32 %242, %3
  %245 = add i32 %232, %241
  %246 = mul i32 %245, %22
  %247 = add i32 %246, %6
  %248 = mul nsw i32 %241, %4
  %249 = sub i32 %6, %241
  %250 = mul i32 %249, %22
  %251 = add i32 %250, %6
  br i1 %234, label %281, label %252

252:                                              ; preds = %240
  %253 = select i1 %243, i1 %236, i1 false
  %254 = select i1 %253, i1 %229, i1 false
  %255 = select i1 %254, i1 %244, i1 false
  %256 = select i1 %255, i1 %237, i1 false
  %257 = select i1 %256, i1 %230, i1 false
  br i1 %257, label %261, label %258

258:                                              ; preds = %252
  %259 = mul nsw i32 %246, %20
  %260 = add nsw i32 %259, %34
  br label %271

261:                                              ; preds = %252
  %262 = sub i32 %248, %6
  %263 = add i32 %251, %6
  %264 = add i32 %262, %17
  %265 = add i32 %264, %20
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %2, i64 %266
  %268 = mul nsw i32 %263, %20
  %269 = add i32 %262, %34
  %270 = add i32 %269, %268
  br label %271

271:                                              ; preds = %261, %258
  %272 = phi i32 [ %270, %261 ], [ %260, %258 ]
  %273 = phi float addrspace(1)* [ %267, %261 ], [ %41, %258 ]
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = sext i32 %272 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %1, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !7
  %278 = fmul contract float %274, %277
  %279 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %280 = fadd contract float %279, %278
  store float %280, float addrspace(1)* %42, align 4, !tbaa !7
  br label %281

281:                                              ; preds = %271, %240
  %282 = phi i32 [ %38, %240 ], [ %238, %271 ]
  br i1 %239, label %352, label %283

283:                                              ; preds = %281, %340
  %284 = phi i32 [ %350, %340 ], [ %282, %281 ]
  %285 = add nsw i32 %284, %36
  %286 = icmp sgt i32 %285, -1
  %287 = select i1 %243, i1 %286, i1 false
  %288 = select i1 %287, i1 %229, i1 false
  %289 = select i1 %288, i1 %244, i1 false
  %290 = icmp slt i32 %285, %4
  %291 = select i1 %289, i1 %290, i1 false
  %292 = select i1 %291, i1 %230, i1 false
  br i1 %292, label %297, label %293

293:                                              ; preds = %283
  %294 = add i32 %247, %284
  %295 = mul nsw i32 %294, %20
  %296 = add nsw i32 %295, %34
  br label %307

297:                                              ; preds = %283
  %298 = add i32 %284, %248
  %299 = sub i32 %251, %284
  %300 = add i32 %298, %17
  %301 = add i32 %300, %20
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %2, i64 %302
  %304 = mul nsw i32 %299, %20
  %305 = add i32 %298, %34
  %306 = add i32 %305, %304
  br label %307

307:                                              ; preds = %297, %293
  %308 = phi i32 [ %306, %297 ], [ %296, %293 ]
  %309 = phi float addrspace(1)* [ %303, %297 ], [ %41, %293 ]
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7
  %311 = sext i32 %308 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %1, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !7
  %314 = fmul contract float %310, %313
  %315 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %316 = fadd contract float %315, %314
  store float %316, float addrspace(1)* %42, align 4, !tbaa !7
  %317 = add i32 %284, 1
  %318 = add nsw i32 %317, %36
  %319 = icmp sgt i32 %318, -1
  %320 = select i1 %243, i1 %319, i1 false
  %321 = select i1 %320, i1 %229, i1 false
  %322 = select i1 %321, i1 %244, i1 false
  %323 = icmp slt i32 %318, %4
  %324 = select i1 %322, i1 %323, i1 false
  %325 = select i1 %324, i1 %230, i1 false
  br i1 %325, label %330, label %326

326:                                              ; preds = %307
  %327 = add i32 %247, %317
  %328 = mul nsw i32 %327, %20
  %329 = add nsw i32 %328, %34
  br label %340

330:                                              ; preds = %307
  %331 = add i32 %317, %248
  %332 = sub i32 %251, %317
  %333 = add i32 %331, %17
  %334 = add i32 %333, %20
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %2, i64 %335
  %337 = mul nsw i32 %332, %20
  %338 = add i32 %331, %34
  %339 = add i32 %338, %337
  br label %340

340:                                              ; preds = %330, %326
  %341 = phi i32 [ %339, %330 ], [ %329, %326 ]
  %342 = phi float addrspace(1)* [ %336, %330 ], [ %41, %326 ]
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !7
  %344 = sext i32 %341 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %1, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !7
  %347 = fmul contract float %343, %346
  %348 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %349 = fadd contract float %348, %347
  store float %349, float addrspace(1)* %42, align 4, !tbaa !7
  %350 = add i32 %284, 2
  %351 = icmp eq i32 %317, %43
  br i1 %351, label %352, label %283, !llvm.loop !11

352:                                              ; preds = %340, %281
  %353 = add i32 %241, 1
  %354 = icmp eq i32 %241, %43
  br i1 %354, label %427, label %240, !llvm.loop !13

355:                                              ; preds = %415, %99
  %356 = add i32 %58, 1
  %357 = icmp eq i32 %58, %43
  br i1 %357, label %101, label %57, !llvm.loop !13

358:                                              ; preds = %99, %415
  %359 = phi i32 [ %425, %415 ], [ %100, %99 ]
  %360 = add nsw i32 %359, %36
  %361 = icmp sgt i32 %360, -1
  %362 = select i1 %60, i1 %361, i1 false
  %363 = select i1 %362, i1 %45, i1 false
  %364 = select i1 %363, i1 %61, i1 false
  %365 = icmp slt i32 %360, %4
  %366 = select i1 %364, i1 %365, i1 false
  %367 = select i1 %366, i1 %46, i1 false
  br i1 %367, label %368, label %378

368:                                              ; preds = %358
  %369 = add i32 %359, %65
  %370 = sub i32 %69, %359
  %371 = add i32 %369, %17
  %372 = sub i32 %371, %20
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds float, float addrspace(1)* %2, i64 %373
  %375 = mul nsw i32 %370, %20
  %376 = add i32 %369, %34
  %377 = add i32 %376, %375
  br label %382

378:                                              ; preds = %358
  %379 = add i32 %64, %359
  %380 = mul nsw i32 %379, %20
  %381 = add nsw i32 %380, %34
  br label %382

382:                                              ; preds = %378, %368
  %383 = phi i32 [ %381, %378 ], [ %377, %368 ]
  %384 = phi float addrspace(1)* [ %41, %378 ], [ %374, %368 ]
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7
  %386 = sext i32 %383 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %1, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !7
  %389 = fmul contract float %385, %388
  %390 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %391 = fadd contract float %390, %389
  store float %391, float addrspace(1)* %42, align 4, !tbaa !7
  %392 = add i32 %359, 1
  %393 = add nsw i32 %392, %36
  %394 = icmp sgt i32 %393, -1
  %395 = select i1 %60, i1 %394, i1 false
  %396 = select i1 %395, i1 %45, i1 false
  %397 = select i1 %396, i1 %61, i1 false
  %398 = icmp slt i32 %393, %4
  %399 = select i1 %397, i1 %398, i1 false
  %400 = select i1 %399, i1 %46, i1 false
  br i1 %400, label %405, label %401

401:                                              ; preds = %382
  %402 = add i32 %64, %392
  %403 = mul nsw i32 %402, %20
  %404 = add nsw i32 %403, %34
  br label %415

405:                                              ; preds = %382
  %406 = add i32 %392, %65
  %407 = sub i32 %69, %392
  %408 = add i32 %406, %17
  %409 = sub i32 %408, %20
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %2, i64 %410
  %412 = mul nsw i32 %407, %20
  %413 = add i32 %406, %34
  %414 = add i32 %413, %412
  br label %415

415:                                              ; preds = %405, %401
  %416 = phi i32 [ %404, %401 ], [ %414, %405 ]
  %417 = phi float addrspace(1)* [ %41, %401 ], [ %411, %405 ]
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !7
  %419 = sext i32 %416 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %1, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !7
  %422 = fmul contract float %418, %421
  %423 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %424 = fadd contract float %423, %422
  store float %424, float addrspace(1)* %42, align 4, !tbaa !7
  %425 = add i32 %359, 2
  %426 = icmp eq i32 %392, %43
  br i1 %426, label %355, label %358, !llvm.loop !11

427:                                              ; preds = %352, %226, %101, %19, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!13 = distinct !{!13, !12}
