; ModuleID = '../data/hip_kernels/13887/27/main.cu'
source_filename = "../data/hip_kernels/13887/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14UnpackPointersPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = sdiv i32 %3, 32
  %8 = icmp sgt i32 %3, 31
  br i1 %8, label %9, label %80

9:                                                ; preds = %5
  %10 = icmp sgt i32 %2, 0
  br label %11

11:                                               ; preds = %9, %81
  %12 = phi i32 [ 0, %9 ], [ %83, %81 ]
  %13 = phi i32 [ 0, %9 ], [ %82, %81 ]
  br i1 %10, label %14, label %81

14:                                               ; preds = %11
  %15 = mul nsw i32 %12, %2
  %16 = shl nsw i32 %12, 5
  %17 = mul nsw i32 %16, %2
  %18 = add nuw nsw i32 %16, 1
  %19 = mul nsw i32 %18, %2
  %20 = add nuw nsw i32 %16, 2
  %21 = mul nsw i32 %20, %2
  %22 = add nuw nsw i32 %16, 3
  %23 = mul nsw i32 %22, %2
  %24 = add nuw nsw i32 %16, 4
  %25 = mul nsw i32 %24, %2
  %26 = add nuw nsw i32 %16, 5
  %27 = mul nsw i32 %26, %2
  %28 = add nuw nsw i32 %16, 6
  %29 = mul nsw i32 %28, %2
  %30 = add nuw nsw i32 %16, 7
  %31 = mul nsw i32 %30, %2
  %32 = add nuw nsw i32 %16, 8
  %33 = mul nsw i32 %32, %2
  %34 = add nuw nsw i32 %16, 9
  %35 = mul nsw i32 %34, %2
  %36 = add nuw nsw i32 %16, 10
  %37 = mul nsw i32 %36, %2
  %38 = add nuw nsw i32 %16, 11
  %39 = mul nsw i32 %38, %2
  %40 = add nuw nsw i32 %16, 12
  %41 = mul nsw i32 %40, %2
  %42 = add nuw nsw i32 %16, 13
  %43 = mul nsw i32 %42, %2
  %44 = add nuw nsw i32 %16, 14
  %45 = mul nsw i32 %44, %2
  %46 = add nuw nsw i32 %16, 15
  %47 = mul nsw i32 %46, %2
  %48 = add nuw nsw i32 %16, 16
  %49 = mul nsw i32 %48, %2
  %50 = add nuw nsw i32 %16, 17
  %51 = mul nsw i32 %50, %2
  %52 = add nuw nsw i32 %16, 18
  %53 = mul nsw i32 %52, %2
  %54 = add nuw nsw i32 %16, 19
  %55 = mul nsw i32 %54, %2
  %56 = add nuw nsw i32 %16, 20
  %57 = mul nsw i32 %56, %2
  %58 = add nuw nsw i32 %16, 21
  %59 = mul nsw i32 %58, %2
  %60 = add nuw nsw i32 %16, 22
  %61 = mul nsw i32 %60, %2
  %62 = add nuw nsw i32 %16, 23
  %63 = mul nsw i32 %62, %2
  %64 = add nuw nsw i32 %16, 24
  %65 = mul nsw i32 %64, %2
  %66 = add nuw nsw i32 %16, 25
  %67 = mul nsw i32 %66, %2
  %68 = add nuw nsw i32 %16, 26
  %69 = mul nsw i32 %68, %2
  %70 = add nuw nsw i32 %16, 27
  %71 = mul nsw i32 %70, %2
  %72 = add nuw nsw i32 %16, 28
  %73 = mul nsw i32 %72, %2
  %74 = add nuw nsw i32 %16, 29
  %75 = mul nsw i32 %74, %2
  %76 = add nuw nsw i32 %16, 30
  %77 = mul nsw i32 %76, %2
  %78 = add nuw nsw i32 %16, 31
  %79 = mul nsw i32 %78, %2
  br label %85

80:                                               ; preds = %81, %5
  ret void

81:                                               ; preds = %508, %11
  %82 = phi i32 [ %13, %11 ], [ %509, %508 ]
  %83 = add nuw nsw i32 %12, 1
  %84 = icmp eq i32 %83, %7
  br i1 %84, label %80, label %11, !llvm.loop !5

85:                                               ; preds = %14, %508
  %86 = phi i32 [ 0, %14 ], [ %510, %508 ]
  %87 = phi i32 [ %13, %14 ], [ %509, %508 ]
  %88 = add nuw i32 %86, %6
  %89 = add i32 %88, %15
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %508, label %94

94:                                               ; preds = %85
  %95 = and i32 %92, 1
  %96 = icmp ne i32 %95, 0
  %97 = icmp slt i32 %87, %4
  %98 = select i1 %96, i1 %97, i1 false
  br i1 %98, label %99, label %106

99:                                               ; preds = %94
  %100 = add i32 %88, %17
  %101 = shl nsw i32 %87, 4
  %102 = add nsw i32 %101, %6
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  store i32 %100, i32 addrspace(1)* %104, align 4, !tbaa !7
  %105 = add nsw i32 %87, 1
  br label %106

106:                                              ; preds = %99, %94
  %107 = phi i32 [ %105, %99 ], [ %87, %94 ]
  %108 = and i32 %92, 2
  %109 = icmp ne i32 %108, 0
  %110 = icmp slt i32 %107, %4
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %112, label %119

112:                                              ; preds = %106
  %113 = add i32 %88, %19
  %114 = shl nsw i32 %107, 4
  %115 = add nsw i32 %114, %6
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  store i32 %113, i32 addrspace(1)* %117, align 4, !tbaa !7
  %118 = add nsw i32 %107, 1
  br label %119

119:                                              ; preds = %112, %106
  %120 = phi i32 [ %118, %112 ], [ %107, %106 ]
  %121 = and i32 %92, 4
  %122 = icmp ne i32 %121, 0
  %123 = icmp slt i32 %120, %4
  %124 = select i1 %122, i1 %123, i1 false
  br i1 %124, label %125, label %132

125:                                              ; preds = %119
  %126 = add i32 %88, %21
  %127 = shl nsw i32 %120, 4
  %128 = add nsw i32 %127, %6
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %129
  store i32 %126, i32 addrspace(1)* %130, align 4, !tbaa !7
  %131 = add nsw i32 %120, 1
  br label %132

132:                                              ; preds = %125, %119
  %133 = phi i32 [ %131, %125 ], [ %120, %119 ]
  %134 = and i32 %92, 8
  %135 = icmp ne i32 %134, 0
  %136 = icmp slt i32 %133, %4
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %145

138:                                              ; preds = %132
  %139 = add i32 %88, %23
  %140 = shl nsw i32 %133, 4
  %141 = add nsw i32 %140, %6
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %142
  store i32 %139, i32 addrspace(1)* %143, align 4, !tbaa !7
  %144 = add nsw i32 %133, 1
  br label %145

145:                                              ; preds = %138, %132
  %146 = phi i32 [ %144, %138 ], [ %133, %132 ]
  %147 = and i32 %92, 16
  %148 = icmp ne i32 %147, 0
  %149 = icmp slt i32 %146, %4
  %150 = select i1 %148, i1 %149, i1 false
  br i1 %150, label %151, label %158

151:                                              ; preds = %145
  %152 = add i32 %88, %25
  %153 = shl nsw i32 %146, 4
  %154 = add nsw i32 %153, %6
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %155
  store i32 %152, i32 addrspace(1)* %156, align 4, !tbaa !7
  %157 = add nsw i32 %146, 1
  br label %158

158:                                              ; preds = %151, %145
  %159 = phi i32 [ %157, %151 ], [ %146, %145 ]
  %160 = and i32 %92, 32
  %161 = icmp ne i32 %160, 0
  %162 = icmp slt i32 %159, %4
  %163 = select i1 %161, i1 %162, i1 false
  br i1 %163, label %164, label %171

164:                                              ; preds = %158
  %165 = add i32 %88, %27
  %166 = shl nsw i32 %159, 4
  %167 = add nsw i32 %166, %6
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %168
  store i32 %165, i32 addrspace(1)* %169, align 4, !tbaa !7
  %170 = add nsw i32 %159, 1
  br label %171

171:                                              ; preds = %164, %158
  %172 = phi i32 [ %170, %164 ], [ %159, %158 ]
  %173 = and i32 %92, 64
  %174 = icmp ne i32 %173, 0
  %175 = icmp slt i32 %172, %4
  %176 = select i1 %174, i1 %175, i1 false
  br i1 %176, label %177, label %184

177:                                              ; preds = %171
  %178 = add i32 %88, %29
  %179 = shl nsw i32 %172, 4
  %180 = add nsw i32 %179, %6
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %181
  store i32 %178, i32 addrspace(1)* %182, align 4, !tbaa !7
  %183 = add nsw i32 %172, 1
  br label %184

184:                                              ; preds = %177, %171
  %185 = phi i32 [ %183, %177 ], [ %172, %171 ]
  %186 = and i32 %92, 128
  %187 = icmp ne i32 %186, 0
  %188 = icmp slt i32 %185, %4
  %189 = select i1 %187, i1 %188, i1 false
  br i1 %189, label %190, label %197

190:                                              ; preds = %184
  %191 = add i32 %88, %31
  %192 = shl nsw i32 %185, 4
  %193 = add nsw i32 %192, %6
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %194
  store i32 %191, i32 addrspace(1)* %195, align 4, !tbaa !7
  %196 = add nsw i32 %185, 1
  br label %197

197:                                              ; preds = %190, %184
  %198 = phi i32 [ %196, %190 ], [ %185, %184 ]
  %199 = and i32 %92, 256
  %200 = icmp ne i32 %199, 0
  %201 = icmp slt i32 %198, %4
  %202 = select i1 %200, i1 %201, i1 false
  br i1 %202, label %203, label %210

203:                                              ; preds = %197
  %204 = add i32 %88, %33
  %205 = shl nsw i32 %198, 4
  %206 = add nsw i32 %205, %6
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %207
  store i32 %204, i32 addrspace(1)* %208, align 4, !tbaa !7
  %209 = add nsw i32 %198, 1
  br label %210

210:                                              ; preds = %203, %197
  %211 = phi i32 [ %209, %203 ], [ %198, %197 ]
  %212 = and i32 %92, 512
  %213 = icmp ne i32 %212, 0
  %214 = icmp slt i32 %211, %4
  %215 = select i1 %213, i1 %214, i1 false
  br i1 %215, label %216, label %223

216:                                              ; preds = %210
  %217 = add i32 %88, %35
  %218 = shl nsw i32 %211, 4
  %219 = add nsw i32 %218, %6
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %220
  store i32 %217, i32 addrspace(1)* %221, align 4, !tbaa !7
  %222 = add nsw i32 %211, 1
  br label %223

223:                                              ; preds = %216, %210
  %224 = phi i32 [ %222, %216 ], [ %211, %210 ]
  %225 = and i32 %92, 1024
  %226 = icmp ne i32 %225, 0
  %227 = icmp slt i32 %224, %4
  %228 = select i1 %226, i1 %227, i1 false
  br i1 %228, label %229, label %236

229:                                              ; preds = %223
  %230 = add i32 %88, %37
  %231 = shl nsw i32 %224, 4
  %232 = add nsw i32 %231, %6
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %233
  store i32 %230, i32 addrspace(1)* %234, align 4, !tbaa !7
  %235 = add nsw i32 %224, 1
  br label %236

236:                                              ; preds = %229, %223
  %237 = phi i32 [ %235, %229 ], [ %224, %223 ]
  %238 = and i32 %92, 2048
  %239 = icmp ne i32 %238, 0
  %240 = icmp slt i32 %237, %4
  %241 = select i1 %239, i1 %240, i1 false
  br i1 %241, label %242, label %249

242:                                              ; preds = %236
  %243 = add i32 %88, %39
  %244 = shl nsw i32 %237, 4
  %245 = add nsw i32 %244, %6
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %246
  store i32 %243, i32 addrspace(1)* %247, align 4, !tbaa !7
  %248 = add nsw i32 %237, 1
  br label %249

249:                                              ; preds = %242, %236
  %250 = phi i32 [ %248, %242 ], [ %237, %236 ]
  %251 = and i32 %92, 4096
  %252 = icmp ne i32 %251, 0
  %253 = icmp slt i32 %250, %4
  %254 = select i1 %252, i1 %253, i1 false
  br i1 %254, label %255, label %262

255:                                              ; preds = %249
  %256 = add i32 %88, %41
  %257 = shl nsw i32 %250, 4
  %258 = add nsw i32 %257, %6
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %259
  store i32 %256, i32 addrspace(1)* %260, align 4, !tbaa !7
  %261 = add nsw i32 %250, 1
  br label %262

262:                                              ; preds = %255, %249
  %263 = phi i32 [ %261, %255 ], [ %250, %249 ]
  %264 = and i32 %92, 8192
  %265 = icmp ne i32 %264, 0
  %266 = icmp slt i32 %263, %4
  %267 = select i1 %265, i1 %266, i1 false
  br i1 %267, label %268, label %275

268:                                              ; preds = %262
  %269 = add i32 %88, %43
  %270 = shl nsw i32 %263, 4
  %271 = add nsw i32 %270, %6
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %272
  store i32 %269, i32 addrspace(1)* %273, align 4, !tbaa !7
  %274 = add nsw i32 %263, 1
  br label %275

275:                                              ; preds = %268, %262
  %276 = phi i32 [ %274, %268 ], [ %263, %262 ]
  %277 = and i32 %92, 16384
  %278 = icmp ne i32 %277, 0
  %279 = icmp slt i32 %276, %4
  %280 = select i1 %278, i1 %279, i1 false
  br i1 %280, label %281, label %288

281:                                              ; preds = %275
  %282 = add i32 %88, %45
  %283 = shl nsw i32 %276, 4
  %284 = add nsw i32 %283, %6
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %285
  store i32 %282, i32 addrspace(1)* %286, align 4, !tbaa !7
  %287 = add nsw i32 %276, 1
  br label %288

288:                                              ; preds = %281, %275
  %289 = phi i32 [ %287, %281 ], [ %276, %275 ]
  %290 = and i32 %92, 32768
  %291 = icmp ne i32 %290, 0
  %292 = icmp slt i32 %289, %4
  %293 = select i1 %291, i1 %292, i1 false
  br i1 %293, label %294, label %301

294:                                              ; preds = %288
  %295 = add i32 %88, %47
  %296 = shl nsw i32 %289, 4
  %297 = add nsw i32 %296, %6
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %298
  store i32 %295, i32 addrspace(1)* %299, align 4, !tbaa !7
  %300 = add nsw i32 %289, 1
  br label %301

301:                                              ; preds = %294, %288
  %302 = phi i32 [ %300, %294 ], [ %289, %288 ]
  %303 = and i32 %92, 65536
  %304 = icmp ne i32 %303, 0
  %305 = icmp slt i32 %302, %4
  %306 = select i1 %304, i1 %305, i1 false
  br i1 %306, label %307, label %314

307:                                              ; preds = %301
  %308 = add i32 %88, %49
  %309 = shl nsw i32 %302, 4
  %310 = add nsw i32 %309, %6
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %311
  store i32 %308, i32 addrspace(1)* %312, align 4, !tbaa !7
  %313 = add nsw i32 %302, 1
  br label %314

314:                                              ; preds = %307, %301
  %315 = phi i32 [ %313, %307 ], [ %302, %301 ]
  %316 = and i32 %92, 131072
  %317 = icmp ne i32 %316, 0
  %318 = icmp slt i32 %315, %4
  %319 = select i1 %317, i1 %318, i1 false
  br i1 %319, label %320, label %327

320:                                              ; preds = %314
  %321 = add i32 %88, %51
  %322 = shl nsw i32 %315, 4
  %323 = add nsw i32 %322, %6
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %324
  store i32 %321, i32 addrspace(1)* %325, align 4, !tbaa !7
  %326 = add nsw i32 %315, 1
  br label %327

327:                                              ; preds = %320, %314
  %328 = phi i32 [ %326, %320 ], [ %315, %314 ]
  %329 = and i32 %92, 262144
  %330 = icmp ne i32 %329, 0
  %331 = icmp slt i32 %328, %4
  %332 = select i1 %330, i1 %331, i1 false
  br i1 %332, label %333, label %340

333:                                              ; preds = %327
  %334 = add i32 %88, %53
  %335 = shl nsw i32 %328, 4
  %336 = add nsw i32 %335, %6
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %337
  store i32 %334, i32 addrspace(1)* %338, align 4, !tbaa !7
  %339 = add nsw i32 %328, 1
  br label %340

340:                                              ; preds = %333, %327
  %341 = phi i32 [ %339, %333 ], [ %328, %327 ]
  %342 = and i32 %92, 524288
  %343 = icmp ne i32 %342, 0
  %344 = icmp slt i32 %341, %4
  %345 = select i1 %343, i1 %344, i1 false
  br i1 %345, label %346, label %353

346:                                              ; preds = %340
  %347 = add i32 %88, %55
  %348 = shl nsw i32 %341, 4
  %349 = add nsw i32 %348, %6
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %350
  store i32 %347, i32 addrspace(1)* %351, align 4, !tbaa !7
  %352 = add nsw i32 %341, 1
  br label %353

353:                                              ; preds = %346, %340
  %354 = phi i32 [ %352, %346 ], [ %341, %340 ]
  %355 = and i32 %92, 1048576
  %356 = icmp ne i32 %355, 0
  %357 = icmp slt i32 %354, %4
  %358 = select i1 %356, i1 %357, i1 false
  br i1 %358, label %359, label %366

359:                                              ; preds = %353
  %360 = add i32 %88, %57
  %361 = shl nsw i32 %354, 4
  %362 = add nsw i32 %361, %6
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %363
  store i32 %360, i32 addrspace(1)* %364, align 4, !tbaa !7
  %365 = add nsw i32 %354, 1
  br label %366

366:                                              ; preds = %359, %353
  %367 = phi i32 [ %365, %359 ], [ %354, %353 ]
  %368 = and i32 %92, 2097152
  %369 = icmp ne i32 %368, 0
  %370 = icmp slt i32 %367, %4
  %371 = select i1 %369, i1 %370, i1 false
  br i1 %371, label %372, label %379

372:                                              ; preds = %366
  %373 = add i32 %88, %59
  %374 = shl nsw i32 %367, 4
  %375 = add nsw i32 %374, %6
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %376
  store i32 %373, i32 addrspace(1)* %377, align 4, !tbaa !7
  %378 = add nsw i32 %367, 1
  br label %379

379:                                              ; preds = %372, %366
  %380 = phi i32 [ %378, %372 ], [ %367, %366 ]
  %381 = and i32 %92, 4194304
  %382 = icmp ne i32 %381, 0
  %383 = icmp slt i32 %380, %4
  %384 = select i1 %382, i1 %383, i1 false
  br i1 %384, label %385, label %392

385:                                              ; preds = %379
  %386 = add i32 %88, %61
  %387 = shl nsw i32 %380, 4
  %388 = add nsw i32 %387, %6
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %389
  store i32 %386, i32 addrspace(1)* %390, align 4, !tbaa !7
  %391 = add nsw i32 %380, 1
  br label %392

392:                                              ; preds = %385, %379
  %393 = phi i32 [ %391, %385 ], [ %380, %379 ]
  %394 = and i32 %92, 8388608
  %395 = icmp ne i32 %394, 0
  %396 = icmp slt i32 %393, %4
  %397 = select i1 %395, i1 %396, i1 false
  br i1 %397, label %398, label %405

398:                                              ; preds = %392
  %399 = add i32 %88, %63
  %400 = shl nsw i32 %393, 4
  %401 = add nsw i32 %400, %6
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %402
  store i32 %399, i32 addrspace(1)* %403, align 4, !tbaa !7
  %404 = add nsw i32 %393, 1
  br label %405

405:                                              ; preds = %398, %392
  %406 = phi i32 [ %404, %398 ], [ %393, %392 ]
  %407 = and i32 %92, 16777216
  %408 = icmp ne i32 %407, 0
  %409 = icmp slt i32 %406, %4
  %410 = select i1 %408, i1 %409, i1 false
  br i1 %410, label %411, label %418

411:                                              ; preds = %405
  %412 = add i32 %88, %65
  %413 = shl nsw i32 %406, 4
  %414 = add nsw i32 %413, %6
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %415
  store i32 %412, i32 addrspace(1)* %416, align 4, !tbaa !7
  %417 = add nsw i32 %406, 1
  br label %418

418:                                              ; preds = %411, %405
  %419 = phi i32 [ %417, %411 ], [ %406, %405 ]
  %420 = and i32 %92, 33554432
  %421 = icmp ne i32 %420, 0
  %422 = icmp slt i32 %419, %4
  %423 = select i1 %421, i1 %422, i1 false
  br i1 %423, label %424, label %431

424:                                              ; preds = %418
  %425 = add i32 %88, %67
  %426 = shl nsw i32 %419, 4
  %427 = add nsw i32 %426, %6
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %428
  store i32 %425, i32 addrspace(1)* %429, align 4, !tbaa !7
  %430 = add nsw i32 %419, 1
  br label %431

431:                                              ; preds = %424, %418
  %432 = phi i32 [ %430, %424 ], [ %419, %418 ]
  %433 = and i32 %92, 67108864
  %434 = icmp ne i32 %433, 0
  %435 = icmp slt i32 %432, %4
  %436 = select i1 %434, i1 %435, i1 false
  br i1 %436, label %437, label %444

437:                                              ; preds = %431
  %438 = add i32 %88, %69
  %439 = shl nsw i32 %432, 4
  %440 = add nsw i32 %439, %6
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %441
  store i32 %438, i32 addrspace(1)* %442, align 4, !tbaa !7
  %443 = add nsw i32 %432, 1
  br label %444

444:                                              ; preds = %437, %431
  %445 = phi i32 [ %443, %437 ], [ %432, %431 ]
  %446 = and i32 %92, 134217728
  %447 = icmp ne i32 %446, 0
  %448 = icmp slt i32 %445, %4
  %449 = select i1 %447, i1 %448, i1 false
  br i1 %449, label %450, label %457

450:                                              ; preds = %444
  %451 = add i32 %88, %71
  %452 = shl nsw i32 %445, 4
  %453 = add nsw i32 %452, %6
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %454
  store i32 %451, i32 addrspace(1)* %455, align 4, !tbaa !7
  %456 = add nsw i32 %445, 1
  br label %457

457:                                              ; preds = %450, %444
  %458 = phi i32 [ %456, %450 ], [ %445, %444 ]
  %459 = and i32 %92, 268435456
  %460 = icmp ne i32 %459, 0
  %461 = icmp slt i32 %458, %4
  %462 = select i1 %460, i1 %461, i1 false
  br i1 %462, label %463, label %470

463:                                              ; preds = %457
  %464 = add i32 %88, %73
  %465 = shl nsw i32 %458, 4
  %466 = add nsw i32 %465, %6
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %467
  store i32 %464, i32 addrspace(1)* %468, align 4, !tbaa !7
  %469 = add nsw i32 %458, 1
  br label %470

470:                                              ; preds = %463, %457
  %471 = phi i32 [ %469, %463 ], [ %458, %457 ]
  %472 = and i32 %92, 536870912
  %473 = icmp ne i32 %472, 0
  %474 = icmp slt i32 %471, %4
  %475 = select i1 %473, i1 %474, i1 false
  br i1 %475, label %476, label %483

476:                                              ; preds = %470
  %477 = add i32 %88, %75
  %478 = shl nsw i32 %471, 4
  %479 = add nsw i32 %478, %6
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %480
  store i32 %477, i32 addrspace(1)* %481, align 4, !tbaa !7
  %482 = add nsw i32 %471, 1
  br label %483

483:                                              ; preds = %476, %470
  %484 = phi i32 [ %482, %476 ], [ %471, %470 ]
  %485 = and i32 %92, 1073741824
  %486 = icmp ne i32 %485, 0
  %487 = icmp slt i32 %484, %4
  %488 = select i1 %486, i1 %487, i1 false
  br i1 %488, label %489, label %496

489:                                              ; preds = %483
  %490 = add i32 %88, %77
  %491 = shl nsw i32 %484, 4
  %492 = add nsw i32 %491, %6
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %493
  store i32 %490, i32 addrspace(1)* %494, align 4, !tbaa !7
  %495 = add nsw i32 %484, 1
  br label %496

496:                                              ; preds = %489, %483
  %497 = phi i32 [ %495, %489 ], [ %484, %483 ]
  %498 = icmp slt i32 %92, 0
  %499 = icmp slt i32 %497, %4
  %500 = select i1 %498, i1 %499, i1 false
  br i1 %500, label %501, label %508

501:                                              ; preds = %496
  %502 = add i32 %88, %79
  %503 = shl nsw i32 %497, 4
  %504 = add nsw i32 %503, %6
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %505
  store i32 %502, i32 addrspace(1)* %506, align 4, !tbaa !7
  %507 = add nsw i32 %497, 1
  br label %508

508:                                              ; preds = %496, %501, %85
  %509 = phi i32 [ %87, %85 ], [ %507, %501 ], [ %497, %496 ]
  %510 = add nuw nsw i32 %86, 16
  %511 = icmp slt i32 %510, %2
  br i1 %511, label %85, label %81, !llvm.loop !11
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !6}
