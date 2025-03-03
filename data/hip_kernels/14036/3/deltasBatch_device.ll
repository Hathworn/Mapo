; ModuleID = '../data/hip_kernels/14036/3/main.cu'
source_filename = "../data/hip_kernels/14036/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @deltasBatch(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = add i32 %5, 1
  %18 = mul nsw i32 %17, 5
  %19 = add nsw i32 %18, 5
  %20 = add nsw i32 %18, 6
  %21 = mul nsw i32 %16, %20
  %22 = mul i32 %16, %4
  %23 = srem i32 %6, 5
  %24 = icmp slt i32 %5, 0
  br i1 %24, label %44, label %25

25:                                               ; preds = %7
  %26 = mul nsw i32 %23, %17
  %27 = add nsw i32 %21, %26
  %28 = and i32 %17, 7
  %29 = icmp ult i32 %5, 7
  br i1 %29, label %32, label %30

30:                                               ; preds = %25
  %31 = and i32 %17, -8
  br label %130

32:                                               ; preds = %130, %25
  %33 = phi i32 [ 0, %25 ], [ %164, %130 ]
  %34 = icmp eq i32 %28, 0
  br i1 %34, label %44, label %35

35:                                               ; preds = %32, %35
  %36 = phi i32 [ %41, %35 ], [ %33, %32 ]
  %37 = phi i32 [ %42, %35 ], [ 0, %32 ]
  %38 = add nsw i32 %27, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  store float 0.000000e+00, float addrspace(1)* %40, align 4, !tbaa !7
  %41 = add nuw i32 %36, 1
  %42 = add i32 %37, 1
  %43 = icmp eq i32 %42, %28
  br i1 %43, label %44, label %35, !llvm.loop !11

44:                                               ; preds = %32, %35, %7
  %45 = add nsw i32 %21, %18
  %46 = add nsw i32 %45, %23
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = icmp sgt i32 %4, 0
  br i1 %49, label %50, label %173

50:                                               ; preds = %44
  %51 = icmp sgt i32 %5, 0
  %52 = sext i32 %19 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = add nsw i32 %45, 5
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = add nsw i32 %18, %23
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = mul nsw i32 %23, %17
  %61 = add nsw i32 %21, %60
  %62 = add i32 %60, %5
  %63 = add i32 %62, %21
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = sext i32 %5 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = add nsw i32 %17, %5
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %71 = shl nsw i32 %17, 1
  %72 = shl nsw i32 %17, 1
  %73 = mul nsw i32 %17, 3
  %74 = mul nsw i32 %17, 3
  %75 = shl nsw i32 %17, 2
  %76 = shl nsw i32 %17, 2
  %77 = sext i32 %18 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = add nsw i32 %18, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = add nsw i32 %18, 2
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = add nsw i32 %18, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = add nsw i32 %18, 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = sext i32 %45 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = add nsw i32 %45, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %3, i64 %94
  %96 = add nsw i32 %45, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  %99 = add nsw i32 %45, 3
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %3, i64 %100
  %102 = add nsw i32 %45, 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %103
  %105 = add i32 %5, -1
  %106 = and i32 %5, 7
  %107 = icmp ult i32 %105, 7
  %108 = and i32 %5, -8
  %109 = icmp eq i32 %106, 0
  %110 = and i32 %5, 7
  %111 = icmp ult i32 %105, 7
  %112 = and i32 %5, -8
  %113 = icmp eq i32 %110, 0
  %114 = and i32 %5, 7
  %115 = icmp ult i32 %105, 7
  %116 = and i32 %5, -8
  %117 = icmp eq i32 %114, 0
  %118 = and i32 %5, 7
  %119 = icmp ult i32 %105, 7
  %120 = and i32 %5, -8
  %121 = icmp eq i32 %118, 0
  %122 = and i32 %5, 7
  %123 = icmp ult i32 %105, 7
  %124 = and i32 %5, -8
  %125 = icmp eq i32 %122, 0
  %126 = and i32 %5, 7
  %127 = icmp ult i32 %105, 7
  %128 = and i32 %5, -8
  %129 = icmp eq i32 %126, 0
  br label %167

130:                                              ; preds = %130, %30
  %131 = phi i32 [ 0, %30 ], [ %164, %130 ]
  %132 = phi i32 [ 0, %30 ], [ %165, %130 ]
  %133 = add nsw i32 %27, %131
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %3, i64 %134
  store float 0.000000e+00, float addrspace(1)* %135, align 4, !tbaa !7
  %136 = or i32 %131, 1
  %137 = add nsw i32 %27, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %138
  store float 0.000000e+00, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = or i32 %131, 2
  %141 = add nsw i32 %27, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %142
  store float 0.000000e+00, float addrspace(1)* %143, align 4, !tbaa !7
  %144 = or i32 %131, 3
  %145 = add nsw i32 %27, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  store float 0.000000e+00, float addrspace(1)* %147, align 4, !tbaa !7
  %148 = or i32 %131, 4
  %149 = add nsw i32 %27, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %3, i64 %150
  store float 0.000000e+00, float addrspace(1)* %151, align 4, !tbaa !7
  %152 = or i32 %131, 5
  %153 = add nsw i32 %27, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  store float 0.000000e+00, float addrspace(1)* %155, align 4, !tbaa !7
  %156 = or i32 %131, 6
  %157 = add nsw i32 %27, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  store float 0.000000e+00, float addrspace(1)* %159, align 4, !tbaa !7
  %160 = or i32 %131, 7
  %161 = add nsw i32 %27, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %3, i64 %162
  store float 0.000000e+00, float addrspace(1)* %163, align 4, !tbaa !7
  %164 = add nuw i32 %131, 8
  %165 = add i32 %132, 8
  %166 = icmp eq i32 %165, %31
  br i1 %166, label %32, label %130, !llvm.loop !13

167:                                              ; preds = %50, %967
  %168 = phi i32 [ 0, %50 ], [ %968, %967 ]
  %169 = phi <5 x float> [ undef, %50 ], [ %709, %967 ]
  %170 = add i32 %168, %22
  %171 = mul i32 %170, %5
  br i1 %51, label %172, label %194

172:                                              ; preds = %167
  br i1 %107, label %174, label %740

173:                                              ; preds = %967, %44
  ret void

174:                                              ; preds = %740, %172
  %175 = phi float [ undef, %172 ], [ %822, %740 ]
  %176 = phi i32 [ 0, %172 ], [ %823, %740 ]
  %177 = phi float [ 0.000000e+00, %172 ], [ %822, %740 ]
  br i1 %109, label %194, label %178

178:                                              ; preds = %174, %178
  %179 = phi i32 [ %191, %178 ], [ %176, %174 ]
  %180 = phi float [ %190, %178 ], [ %177, %174 ]
  %181 = phi i32 [ %192, %178 ], [ 0, %174 ]
  %182 = add nsw i32 %171, %179
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = zext i32 %179 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %2, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !7
  %189 = fmul contract float %185, %188
  %190 = fadd contract float %180, %189
  %191 = add nuw nsw i32 %179, 1
  %192 = add i32 %181, 1
  %193 = icmp eq i32 %192, %106
  br i1 %193, label %194, label %178, !llvm.loop !15

194:                                              ; preds = %174, %178, %167
  %195 = phi float [ 0.000000e+00, %167 ], [ %175, %174 ], [ %190, %178 ]
  %196 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %197 = fadd contract float %195, %196
  %198 = fcmp contract ogt float %197, 0.000000e+00
  %199 = insertelement <5 x float> %169, float 1.000000e+00, i64 0
  %200 = insertelement <5 x float> %169, float 0.000000e+00, i64 0
  %201 = select i1 %198, <5 x float> %199, <5 x float> %200
  br i1 %51, label %202, label %318

202:                                              ; preds = %194
  br i1 %111, label %297, label %203

203:                                              ; preds = %202, %203
  %204 = phi i32 [ %294, %203 ], [ 0, %202 ]
  %205 = phi float [ %293, %203 ], [ 0.000000e+00, %202 ]
  %206 = phi i32 [ %295, %203 ], [ 0, %202 ]
  %207 = add nsw i32 %171, %204
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %0, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %211 = add nsw i32 %204, %17
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %2, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = fmul contract float %210, %214
  %216 = fadd contract float %205, %215
  %217 = or i32 %204, 1
  %218 = add nsw i32 %171, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %0, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = add nsw i32 %217, %17
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = fmul contract float %221, %225
  %227 = fadd contract float %216, %226
  %228 = or i32 %204, 2
  %229 = add nsw i32 %171, %228
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7
  %233 = add nsw i32 %228, %17
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %2, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = fmul contract float %232, %236
  %238 = fadd contract float %227, %237
  %239 = or i32 %204, 3
  %240 = add nsw i32 %171, %239
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !7
  %244 = add nsw i32 %239, %17
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %2, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = fmul contract float %243, %247
  %249 = fadd contract float %238, %248
  %250 = or i32 %204, 4
  %251 = add nsw i32 %171, %250
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = add nsw i32 %250, %17
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %2, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = fmul contract float %254, %258
  %260 = fadd contract float %249, %259
  %261 = or i32 %204, 5
  %262 = add nsw i32 %171, %261
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !7
  %266 = add nsw i32 %261, %17
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %2, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !7
  %270 = fmul contract float %265, %269
  %271 = fadd contract float %260, %270
  %272 = or i32 %204, 6
  %273 = add nsw i32 %171, %272
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %0, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %277 = add nsw i32 %272, %17
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %2, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7
  %281 = fmul contract float %276, %280
  %282 = fadd contract float %271, %281
  %283 = or i32 %204, 7
  %284 = add nsw i32 %171, %283
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !7
  %288 = add nsw i32 %283, %17
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %2, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7
  %292 = fmul contract float %287, %291
  %293 = fadd contract float %282, %292
  %294 = add nuw nsw i32 %204, 8
  %295 = add i32 %206, 8
  %296 = icmp eq i32 %295, %112
  br i1 %296, label %297, label %203, !llvm.loop !16

297:                                              ; preds = %203, %202
  %298 = phi float [ undef, %202 ], [ %293, %203 ]
  %299 = phi i32 [ 0, %202 ], [ %294, %203 ]
  %300 = phi float [ 0.000000e+00, %202 ], [ %293, %203 ]
  br i1 %113, label %318, label %301

301:                                              ; preds = %297, %301
  %302 = phi i32 [ %315, %301 ], [ %299, %297 ]
  %303 = phi float [ %314, %301 ], [ %300, %297 ]
  %304 = phi i32 [ %316, %301 ], [ 0, %297 ]
  %305 = add nsw i32 %171, %302
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %0, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  %309 = add nsw i32 %302, %17
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %2, i64 %310
  %312 = load float, float addrspace(1)* %311, align 4, !tbaa !7
  %313 = fmul contract float %308, %312
  %314 = fadd contract float %303, %313
  %315 = add nuw nsw i32 %302, 1
  %316 = add i32 %304, 1
  %317 = icmp eq i32 %316, %110
  br i1 %317, label %318, label %301, !llvm.loop !17

318:                                              ; preds = %297, %301, %194
  %319 = phi float [ 0.000000e+00, %194 ], [ %298, %297 ], [ %314, %301 ]
  %320 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %321 = fadd contract float %319, %320
  %322 = fcmp contract ogt float %321, 0.000000e+00
  %323 = insertelement <5 x float> %201, float 1.000000e+00, i64 1
  %324 = insertelement <5 x float> %201, float 0.000000e+00, i64 1
  %325 = select i1 %322, <5 x float> %323, <5 x float> %324
  br i1 %51, label %326, label %442

326:                                              ; preds = %318
  br i1 %115, label %421, label %327

327:                                              ; preds = %326, %327
  %328 = phi i32 [ %418, %327 ], [ 0, %326 ]
  %329 = phi float [ %417, %327 ], [ 0.000000e+00, %326 ]
  %330 = phi i32 [ %419, %327 ], [ 0, %326 ]
  %331 = add nsw i32 %171, %328
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %0, i64 %332
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7
  %335 = add nsw i32 %328, %72
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %2, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7
  %339 = fmul contract float %334, %338
  %340 = fadd contract float %329, %339
  %341 = or i32 %328, 1
  %342 = add nsw i32 %171, %341
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %0, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = add nsw i32 %341, %72
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %2, i64 %347
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !7
  %350 = fmul contract float %345, %349
  %351 = fadd contract float %340, %350
  %352 = or i32 %328, 2
  %353 = add nsw i32 %171, %352
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %0, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7
  %357 = add nsw i32 %352, %72
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %2, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7
  %361 = fmul contract float %356, %360
  %362 = fadd contract float %351, %361
  %363 = or i32 %328, 3
  %364 = add nsw i32 %171, %363
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !7
  %368 = add nsw i32 %363, %72
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %2, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7
  %372 = fmul contract float %367, %371
  %373 = fadd contract float %362, %372
  %374 = or i32 %328, 4
  %375 = add nsw i32 %171, %374
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %0, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = add nsw i32 %374, %72
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds float, float addrspace(1)* %2, i64 %380
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !7
  %383 = fmul contract float %378, %382
  %384 = fadd contract float %373, %383
  %385 = or i32 %328, 5
  %386 = add nsw i32 %171, %385
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %0, i64 %387
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  %390 = add nsw i32 %385, %72
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %2, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !7
  %394 = fmul contract float %389, %393
  %395 = fadd contract float %384, %394
  %396 = or i32 %328, 6
  %397 = add nsw i32 %171, %396
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %0, i64 %398
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !7
  %401 = add nsw i32 %396, %72
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %2, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7
  %405 = fmul contract float %400, %404
  %406 = fadd contract float %395, %405
  %407 = or i32 %328, 7
  %408 = add nsw i32 %171, %407
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %0, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !7
  %412 = add nsw i32 %407, %72
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds float, float addrspace(1)* %2, i64 %413
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !7
  %416 = fmul contract float %411, %415
  %417 = fadd contract float %406, %416
  %418 = add nuw nsw i32 %328, 8
  %419 = add i32 %330, 8
  %420 = icmp eq i32 %419, %116
  br i1 %420, label %421, label %327, !llvm.loop !16

421:                                              ; preds = %327, %326
  %422 = phi float [ undef, %326 ], [ %417, %327 ]
  %423 = phi i32 [ 0, %326 ], [ %418, %327 ]
  %424 = phi float [ 0.000000e+00, %326 ], [ %417, %327 ]
  br i1 %117, label %442, label %425

425:                                              ; preds = %421, %425
  %426 = phi i32 [ %439, %425 ], [ %423, %421 ]
  %427 = phi float [ %438, %425 ], [ %424, %421 ]
  %428 = phi i32 [ %440, %425 ], [ 0, %421 ]
  %429 = add nsw i32 %171, %426
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds float, float addrspace(1)* %0, i64 %430
  %432 = load float, float addrspace(1)* %431, align 4, !tbaa !7
  %433 = add nsw i32 %426, %72
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(1)* %2, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !7
  %437 = fmul contract float %432, %436
  %438 = fadd contract float %427, %437
  %439 = add nuw nsw i32 %426, 1
  %440 = add i32 %428, 1
  %441 = icmp eq i32 %440, %114
  br i1 %441, label %442, label %425, !llvm.loop !18

442:                                              ; preds = %421, %425, %318
  %443 = phi i32 [ %71, %318 ], [ %72, %425 ], [ %72, %421 ]
  %444 = phi float [ 0.000000e+00, %318 ], [ %422, %421 ], [ %438, %425 ]
  %445 = add nsw i32 %443, %5
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds float, float addrspace(1)* %2, i64 %446
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !7
  %449 = fadd contract float %444, %448
  %450 = fcmp contract ogt float %449, 0.000000e+00
  %451 = insertelement <5 x float> %325, float 1.000000e+00, i64 2
  %452 = insertelement <5 x float> %325, float 0.000000e+00, i64 2
  %453 = select i1 %450, <5 x float> %451, <5 x float> %452
  br i1 %51, label %454, label %570

454:                                              ; preds = %442
  br i1 %119, label %549, label %455

455:                                              ; preds = %454, %455
  %456 = phi i32 [ %546, %455 ], [ 0, %454 ]
  %457 = phi float [ %545, %455 ], [ 0.000000e+00, %454 ]
  %458 = phi i32 [ %547, %455 ], [ 0, %454 ]
  %459 = add nsw i32 %171, %456
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %0, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !7
  %463 = add nsw i32 %456, %74
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %2, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !7
  %467 = fmul contract float %462, %466
  %468 = fadd contract float %457, %467
  %469 = or i32 %456, 1
  %470 = add nsw i32 %171, %469
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds float, float addrspace(1)* %0, i64 %471
  %473 = load float, float addrspace(1)* %472, align 4, !tbaa !7
  %474 = add nsw i32 %469, %74
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %2, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !7
  %478 = fmul contract float %473, %477
  %479 = fadd contract float %468, %478
  %480 = or i32 %456, 2
  %481 = add nsw i32 %171, %480
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds float, float addrspace(1)* %0, i64 %482
  %484 = load float, float addrspace(1)* %483, align 4, !tbaa !7
  %485 = add nsw i32 %480, %74
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds float, float addrspace(1)* %2, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !7
  %489 = fmul contract float %484, %488
  %490 = fadd contract float %479, %489
  %491 = or i32 %456, 3
  %492 = add nsw i32 %171, %491
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds float, float addrspace(1)* %0, i64 %493
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !7
  %496 = add nsw i32 %491, %74
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float addrspace(1)* %2, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7
  %500 = fmul contract float %495, %499
  %501 = fadd contract float %490, %500
  %502 = or i32 %456, 4
  %503 = add nsw i32 %171, %502
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds float, float addrspace(1)* %0, i64 %504
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %507 = add nsw i32 %502, %74
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds float, float addrspace(1)* %2, i64 %508
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !7
  %511 = fmul contract float %506, %510
  %512 = fadd contract float %501, %511
  %513 = or i32 %456, 5
  %514 = add nsw i32 %171, %513
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %0, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %518 = add nsw i32 %513, %74
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %2, i64 %519
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !7
  %522 = fmul contract float %517, %521
  %523 = fadd contract float %512, %522
  %524 = or i32 %456, 6
  %525 = add nsw i32 %171, %524
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds float, float addrspace(1)* %0, i64 %526
  %528 = load float, float addrspace(1)* %527, align 4, !tbaa !7
  %529 = add nsw i32 %524, %74
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds float, float addrspace(1)* %2, i64 %530
  %532 = load float, float addrspace(1)* %531, align 4, !tbaa !7
  %533 = fmul contract float %528, %532
  %534 = fadd contract float %523, %533
  %535 = or i32 %456, 7
  %536 = add nsw i32 %171, %535
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %0, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !7
  %540 = add nsw i32 %535, %74
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds float, float addrspace(1)* %2, i64 %541
  %543 = load float, float addrspace(1)* %542, align 4, !tbaa !7
  %544 = fmul contract float %539, %543
  %545 = fadd contract float %534, %544
  %546 = add nuw nsw i32 %456, 8
  %547 = add i32 %458, 8
  %548 = icmp eq i32 %547, %120
  br i1 %548, label %549, label %455, !llvm.loop !16

549:                                              ; preds = %455, %454
  %550 = phi float [ undef, %454 ], [ %545, %455 ]
  %551 = phi i32 [ 0, %454 ], [ %546, %455 ]
  %552 = phi float [ 0.000000e+00, %454 ], [ %545, %455 ]
  br i1 %121, label %570, label %553

553:                                              ; preds = %549, %553
  %554 = phi i32 [ %567, %553 ], [ %551, %549 ]
  %555 = phi float [ %566, %553 ], [ %552, %549 ]
  %556 = phi i32 [ %568, %553 ], [ 0, %549 ]
  %557 = add nsw i32 %171, %554
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds float, float addrspace(1)* %0, i64 %558
  %560 = load float, float addrspace(1)* %559, align 4, !tbaa !7
  %561 = add nsw i32 %554, %74
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds float, float addrspace(1)* %2, i64 %562
  %564 = load float, float addrspace(1)* %563, align 4, !tbaa !7
  %565 = fmul contract float %560, %564
  %566 = fadd contract float %555, %565
  %567 = add nuw nsw i32 %554, 1
  %568 = add i32 %556, 1
  %569 = icmp eq i32 %568, %118
  br i1 %569, label %570, label %553, !llvm.loop !19

570:                                              ; preds = %549, %553, %442
  %571 = phi i32 [ %73, %442 ], [ %74, %553 ], [ %74, %549 ]
  %572 = phi float [ 0.000000e+00, %442 ], [ %550, %549 ], [ %566, %553 ]
  %573 = add nsw i32 %571, %5
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds float, float addrspace(1)* %2, i64 %574
  %576 = load float, float addrspace(1)* %575, align 4, !tbaa !7
  %577 = fadd contract float %572, %576
  %578 = fcmp contract ogt float %577, 0.000000e+00
  %579 = insertelement <5 x float> %453, float 1.000000e+00, i64 3
  %580 = insertelement <5 x float> %453, float 0.000000e+00, i64 3
  %581 = select i1 %578, <5 x float> %579, <5 x float> %580
  br i1 %51, label %582, label %698

582:                                              ; preds = %570
  br i1 %123, label %677, label %583

583:                                              ; preds = %582, %583
  %584 = phi i32 [ %674, %583 ], [ 0, %582 ]
  %585 = phi float [ %673, %583 ], [ 0.000000e+00, %582 ]
  %586 = phi i32 [ %675, %583 ], [ 0, %582 ]
  %587 = add nsw i32 %171, %584
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 %588
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = add nsw i32 %584, %76
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds float, float addrspace(1)* %2, i64 %592
  %594 = load float, float addrspace(1)* %593, align 4, !tbaa !7
  %595 = fmul contract float %590, %594
  %596 = fadd contract float %585, %595
  %597 = or i32 %584, 1
  %598 = add nsw i32 %171, %597
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %0, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !7
  %602 = add nsw i32 %597, %76
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds float, float addrspace(1)* %2, i64 %603
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !7
  %606 = fmul contract float %601, %605
  %607 = fadd contract float %596, %606
  %608 = or i32 %584, 2
  %609 = add nsw i32 %171, %608
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds float, float addrspace(1)* %0, i64 %610
  %612 = load float, float addrspace(1)* %611, align 4, !tbaa !7
  %613 = add nsw i32 %608, %76
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %2, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !7
  %617 = fmul contract float %612, %616
  %618 = fadd contract float %607, %617
  %619 = or i32 %584, 3
  %620 = add nsw i32 %171, %619
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds float, float addrspace(1)* %0, i64 %621
  %623 = load float, float addrspace(1)* %622, align 4, !tbaa !7
  %624 = add nsw i32 %619, %76
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %2, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !7
  %628 = fmul contract float %623, %627
  %629 = fadd contract float %618, %628
  %630 = or i32 %584, 4
  %631 = add nsw i32 %171, %630
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds float, float addrspace(1)* %0, i64 %632
  %634 = load float, float addrspace(1)* %633, align 4, !tbaa !7
  %635 = add nsw i32 %630, %76
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds float, float addrspace(1)* %2, i64 %636
  %638 = load float, float addrspace(1)* %637, align 4, !tbaa !7
  %639 = fmul contract float %634, %638
  %640 = fadd contract float %629, %639
  %641 = or i32 %584, 5
  %642 = add nsw i32 %171, %641
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds float, float addrspace(1)* %0, i64 %643
  %645 = load float, float addrspace(1)* %644, align 4, !tbaa !7
  %646 = add nsw i32 %641, %76
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds float, float addrspace(1)* %2, i64 %647
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !7
  %650 = fmul contract float %645, %649
  %651 = fadd contract float %640, %650
  %652 = or i32 %584, 6
  %653 = add nsw i32 %171, %652
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds float, float addrspace(1)* %0, i64 %654
  %656 = load float, float addrspace(1)* %655, align 4, !tbaa !7
  %657 = add nsw i32 %652, %76
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %2, i64 %658
  %660 = load float, float addrspace(1)* %659, align 4, !tbaa !7
  %661 = fmul contract float %656, %660
  %662 = fadd contract float %651, %661
  %663 = or i32 %584, 7
  %664 = add nsw i32 %171, %663
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %0, i64 %665
  %667 = load float, float addrspace(1)* %666, align 4, !tbaa !7
  %668 = add nsw i32 %663, %76
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds float, float addrspace(1)* %2, i64 %669
  %671 = load float, float addrspace(1)* %670, align 4, !tbaa !7
  %672 = fmul contract float %667, %671
  %673 = fadd contract float %662, %672
  %674 = add nuw nsw i32 %584, 8
  %675 = add i32 %586, 8
  %676 = icmp eq i32 %675, %124
  br i1 %676, label %677, label %583, !llvm.loop !16

677:                                              ; preds = %583, %582
  %678 = phi float [ undef, %582 ], [ %673, %583 ]
  %679 = phi i32 [ 0, %582 ], [ %674, %583 ]
  %680 = phi float [ 0.000000e+00, %582 ], [ %673, %583 ]
  br i1 %125, label %698, label %681

681:                                              ; preds = %677, %681
  %682 = phi i32 [ %695, %681 ], [ %679, %677 ]
  %683 = phi float [ %694, %681 ], [ %680, %677 ]
  %684 = phi i32 [ %696, %681 ], [ 0, %677 ]
  %685 = add nsw i32 %171, %682
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds float, float addrspace(1)* %0, i64 %686
  %688 = load float, float addrspace(1)* %687, align 4, !tbaa !7
  %689 = add nsw i32 %682, %76
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds float, float addrspace(1)* %2, i64 %690
  %692 = load float, float addrspace(1)* %691, align 4, !tbaa !7
  %693 = fmul contract float %688, %692
  %694 = fadd contract float %683, %693
  %695 = add nuw nsw i32 %682, 1
  %696 = add i32 %684, 1
  %697 = icmp eq i32 %696, %122
  br i1 %697, label %698, label %681, !llvm.loop !20

698:                                              ; preds = %677, %681, %570
  %699 = phi i32 [ %75, %570 ], [ %76, %681 ], [ %76, %677 ]
  %700 = phi float [ 0.000000e+00, %570 ], [ %678, %677 ], [ %694, %681 ]
  %701 = add nsw i32 %699, %5
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds float, float addrspace(1)* %2, i64 %702
  %704 = load float, float addrspace(1)* %703, align 4, !tbaa !7
  %705 = fadd contract float %700, %704
  %706 = fcmp contract ogt float %705, 0.000000e+00
  %707 = insertelement <5 x float> %581, float 1.000000e+00, i64 4
  %708 = insertelement <5 x float> %581, float 0.000000e+00, i64 4
  %709 = select i1 %706, <5 x float> %707, <5 x float> %708
  %710 = extractelement <5 x float> %709, i64 0
  %711 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %712 = fmul contract float %710, %711
  %713 = fadd contract float %712, 0.000000e+00
  %714 = extractelement <5 x float> %709, i64 1
  %715 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %716 = fmul contract float %714, %715
  %717 = fadd contract float %713, %716
  %718 = extractelement <5 x float> %709, i64 2
  %719 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %720 = fmul contract float %718, %719
  %721 = fadd contract float %717, %720
  %722 = extractelement <5 x float> %709, i64 3
  %723 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %724 = fmul contract float %722, %723
  %725 = fadd contract float %721, %724
  %726 = extractelement <5 x float> %709, i64 4
  %727 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %728 = fmul contract float %726, %727
  %729 = fadd contract float %725, %728
  %730 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %731 = fadd contract float %729, %730
  %732 = fcmp contract ogt float %731, 0.000000e+00
  %733 = select i1 %732, float 1.000000e+00, float 0.000000e+00
  %734 = add nsw i32 %168, %22
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %1, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !7
  %738 = fsub contract float %737, %733
  %739 = fcmp contract une float %738, 0.000000e+00
  br i1 %739, label %826, label %967

740:                                              ; preds = %172, %740
  %741 = phi i32 [ %823, %740 ], [ 0, %172 ]
  %742 = phi float [ %822, %740 ], [ 0.000000e+00, %172 ]
  %743 = phi i32 [ %824, %740 ], [ 0, %172 ]
  %744 = add nsw i32 %171, %741
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds float, float addrspace(1)* %0, i64 %745
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !7
  %748 = zext i32 %741 to i64
  %749 = getelementptr inbounds float, float addrspace(1)* %2, i64 %748
  %750 = load float, float addrspace(1)* %749, align 4, !tbaa !7
  %751 = fmul contract float %747, %750
  %752 = fadd contract float %742, %751
  %753 = or i32 %741, 1
  %754 = add nsw i32 %171, %753
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds float, float addrspace(1)* %0, i64 %755
  %757 = load float, float addrspace(1)* %756, align 4, !tbaa !7
  %758 = zext i32 %753 to i64
  %759 = getelementptr inbounds float, float addrspace(1)* %2, i64 %758
  %760 = load float, float addrspace(1)* %759, align 4, !tbaa !7
  %761 = fmul contract float %757, %760
  %762 = fadd contract float %752, %761
  %763 = or i32 %741, 2
  %764 = add nsw i32 %171, %763
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds float, float addrspace(1)* %0, i64 %765
  %767 = load float, float addrspace(1)* %766, align 4, !tbaa !7
  %768 = zext i32 %763 to i64
  %769 = getelementptr inbounds float, float addrspace(1)* %2, i64 %768
  %770 = load float, float addrspace(1)* %769, align 4, !tbaa !7
  %771 = fmul contract float %767, %770
  %772 = fadd contract float %762, %771
  %773 = or i32 %741, 3
  %774 = add nsw i32 %171, %773
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %0, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !7
  %778 = zext i32 %773 to i64
  %779 = getelementptr inbounds float, float addrspace(1)* %2, i64 %778
  %780 = load float, float addrspace(1)* %779, align 4, !tbaa !7
  %781 = fmul contract float %777, %780
  %782 = fadd contract float %772, %781
  %783 = or i32 %741, 4
  %784 = add nsw i32 %171, %783
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds float, float addrspace(1)* %0, i64 %785
  %787 = load float, float addrspace(1)* %786, align 4, !tbaa !7
  %788 = zext i32 %783 to i64
  %789 = getelementptr inbounds float, float addrspace(1)* %2, i64 %788
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !7
  %791 = fmul contract float %787, %790
  %792 = fadd contract float %782, %791
  %793 = or i32 %741, 5
  %794 = add nsw i32 %171, %793
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds float, float addrspace(1)* %0, i64 %795
  %797 = load float, float addrspace(1)* %796, align 4, !tbaa !7
  %798 = zext i32 %793 to i64
  %799 = getelementptr inbounds float, float addrspace(1)* %2, i64 %798
  %800 = load float, float addrspace(1)* %799, align 4, !tbaa !7
  %801 = fmul contract float %797, %800
  %802 = fadd contract float %792, %801
  %803 = or i32 %741, 6
  %804 = add nsw i32 %171, %803
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds float, float addrspace(1)* %0, i64 %805
  %807 = load float, float addrspace(1)* %806, align 4, !tbaa !7
  %808 = zext i32 %803 to i64
  %809 = getelementptr inbounds float, float addrspace(1)* %2, i64 %808
  %810 = load float, float addrspace(1)* %809, align 4, !tbaa !7
  %811 = fmul contract float %807, %810
  %812 = fadd contract float %802, %811
  %813 = or i32 %741, 7
  %814 = add nsw i32 %171, %813
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %0, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = zext i32 %813 to i64
  %819 = getelementptr inbounds float, float addrspace(1)* %2, i64 %818
  %820 = load float, float addrspace(1)* %819, align 4, !tbaa !7
  %821 = fmul contract float %817, %820
  %822 = fadd contract float %812, %821
  %823 = add nuw nsw i32 %741, 8
  %824 = add i32 %743, 8
  %825 = icmp eq i32 %824, %108
  br i1 %825, label %174, label %740, !llvm.loop !16

826:                                              ; preds = %698
  %827 = fmul contract float %738, %710
  %828 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %829 = fadd contract float %827, %828
  store float %829, float addrspace(1)* %92, align 4, !tbaa !7
  %830 = fmul contract float %738, %714
  %831 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %832 = fadd contract float %830, %831
  store float %832, float addrspace(1)* %95, align 4, !tbaa !7
  %833 = fmul contract float %738, %718
  %834 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %835 = fadd contract float %833, %834
  store float %835, float addrspace(1)* %98, align 4, !tbaa !7
  %836 = fmul contract float %738, %722
  %837 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %838 = fadd contract float %836, %837
  store float %838, float addrspace(1)* %101, align 4, !tbaa !7
  %839 = fmul contract float %738, %726
  %840 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %841 = fadd contract float %839, %840
  store float %841, float addrspace(1)* %104, align 4, !tbaa !7
  %842 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %843 = fadd contract float %738, %842
  store float %843, float addrspace(1)* %56, align 4, !tbaa !7
  %844 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %845 = fmul contract float %738, %844
  %846 = fcmp contract ogt float %845, 0.000000e+00
  %847 = select i1 %846, float 1.000000e+00, float 0.000000e+00
  %848 = extractelement <5 x float> %709, i32 %23
  %849 = fsub contract float %847, %848
  %850 = fcmp contract une float %849, 0.000000e+00
  br i1 %850, label %851, label %967

851:                                              ; preds = %826
  br i1 %51, label %852, label %871

852:                                              ; preds = %851
  br i1 %127, label %853, label %874

853:                                              ; preds = %874, %852
  %854 = phi i32 [ 0, %852 ], [ %964, %874 ]
  br i1 %129, label %871, label %855

855:                                              ; preds = %853, %855
  %856 = phi i32 [ %868, %855 ], [ %854, %853 ]
  %857 = phi i32 [ %869, %855 ], [ 0, %853 ]
  %858 = add nsw i32 %171, %856
  %859 = sext i32 %858 to i64
  %860 = getelementptr inbounds float, float addrspace(1)* %0, i64 %859
  %861 = load float, float addrspace(1)* %860, align 4, !tbaa !7
  %862 = fmul contract float %849, %861
  %863 = add nsw i32 %61, %856
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds float, float addrspace(1)* %3, i64 %864
  %866 = load float, float addrspace(1)* %865, align 4, !tbaa !7
  %867 = fadd contract float %866, %862
  store float %867, float addrspace(1)* %865, align 4, !tbaa !7
  %868 = add nuw nsw i32 %856, 1
  %869 = add i32 %857, 1
  %870 = icmp eq i32 %869, %126
  br i1 %870, label %871, label %855, !llvm.loop !21

871:                                              ; preds = %853, %855, %851
  %872 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %873 = fadd contract float %849, %872
  store float %873, float addrspace(1)* %65, align 4, !tbaa !7
  br label %967

874:                                              ; preds = %852, %874
  %875 = phi i32 [ %964, %874 ], [ 0, %852 ]
  %876 = phi i32 [ %965, %874 ], [ 0, %852 ]
  %877 = add nsw i32 %171, %875
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds float, float addrspace(1)* %0, i64 %878
  %880 = load float, float addrspace(1)* %879, align 4, !tbaa !7
  %881 = fmul contract float %849, %880
  %882 = add nsw i32 %61, %875
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds float, float addrspace(1)* %3, i64 %883
  %885 = load float, float addrspace(1)* %884, align 4, !tbaa !7
  %886 = fadd contract float %885, %881
  store float %886, float addrspace(1)* %884, align 4, !tbaa !7
  %887 = or i32 %875, 1
  %888 = add nsw i32 %171, %887
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds float, float addrspace(1)* %0, i64 %889
  %891 = load float, float addrspace(1)* %890, align 4, !tbaa !7
  %892 = fmul contract float %849, %891
  %893 = add nsw i32 %61, %887
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds float, float addrspace(1)* %3, i64 %894
  %896 = load float, float addrspace(1)* %895, align 4, !tbaa !7
  %897 = fadd contract float %896, %892
  store float %897, float addrspace(1)* %895, align 4, !tbaa !7
  %898 = or i32 %875, 2
  %899 = add nsw i32 %171, %898
  %900 = sext i32 %899 to i64
  %901 = getelementptr inbounds float, float addrspace(1)* %0, i64 %900
  %902 = load float, float addrspace(1)* %901, align 4, !tbaa !7
  %903 = fmul contract float %849, %902
  %904 = add nsw i32 %61, %898
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds float, float addrspace(1)* %3, i64 %905
  %907 = load float, float addrspace(1)* %906, align 4, !tbaa !7
  %908 = fadd contract float %907, %903
  store float %908, float addrspace(1)* %906, align 4, !tbaa !7
  %909 = or i32 %875, 3
  %910 = add nsw i32 %171, %909
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds float, float addrspace(1)* %0, i64 %911
  %913 = load float, float addrspace(1)* %912, align 4, !tbaa !7
  %914 = fmul contract float %849, %913
  %915 = add nsw i32 %61, %909
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds float, float addrspace(1)* %3, i64 %916
  %918 = load float, float addrspace(1)* %917, align 4, !tbaa !7
  %919 = fadd contract float %918, %914
  store float %919, float addrspace(1)* %917, align 4, !tbaa !7
  %920 = or i32 %875, 4
  %921 = add nsw i32 %171, %920
  %922 = sext i32 %921 to i64
  %923 = getelementptr inbounds float, float addrspace(1)* %0, i64 %922
  %924 = load float, float addrspace(1)* %923, align 4, !tbaa !7
  %925 = fmul contract float %849, %924
  %926 = add nsw i32 %61, %920
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds float, float addrspace(1)* %3, i64 %927
  %929 = load float, float addrspace(1)* %928, align 4, !tbaa !7
  %930 = fadd contract float %929, %925
  store float %930, float addrspace(1)* %928, align 4, !tbaa !7
  %931 = or i32 %875, 5
  %932 = add nsw i32 %171, %931
  %933 = sext i32 %932 to i64
  %934 = getelementptr inbounds float, float addrspace(1)* %0, i64 %933
  %935 = load float, float addrspace(1)* %934, align 4, !tbaa !7
  %936 = fmul contract float %849, %935
  %937 = add nsw i32 %61, %931
  %938 = sext i32 %937 to i64
  %939 = getelementptr inbounds float, float addrspace(1)* %3, i64 %938
  %940 = load float, float addrspace(1)* %939, align 4, !tbaa !7
  %941 = fadd contract float %940, %936
  store float %941, float addrspace(1)* %939, align 4, !tbaa !7
  %942 = or i32 %875, 6
  %943 = add nsw i32 %171, %942
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds float, float addrspace(1)* %0, i64 %944
  %946 = load float, float addrspace(1)* %945, align 4, !tbaa !7
  %947 = fmul contract float %849, %946
  %948 = add nsw i32 %61, %942
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds float, float addrspace(1)* %3, i64 %949
  %951 = load float, float addrspace(1)* %950, align 4, !tbaa !7
  %952 = fadd contract float %951, %947
  store float %952, float addrspace(1)* %950, align 4, !tbaa !7
  %953 = or i32 %875, 7
  %954 = add nsw i32 %171, %953
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds float, float addrspace(1)* %0, i64 %955
  %957 = load float, float addrspace(1)* %956, align 4, !tbaa !7
  %958 = fmul contract float %849, %957
  %959 = add nsw i32 %61, %953
  %960 = sext i32 %959 to i64
  %961 = getelementptr inbounds float, float addrspace(1)* %3, i64 %960
  %962 = load float, float addrspace(1)* %961, align 4, !tbaa !7
  %963 = fadd contract float %962, %958
  store float %963, float addrspace(1)* %961, align 4, !tbaa !7
  %964 = add nuw nsw i32 %875, 8
  %965 = add i32 %876, 8
  %966 = icmp eq i32 %965, %128
  br i1 %966, label %853, label %874, !llvm.loop !22

967:                                              ; preds = %698, %871, %826
  %968 = add nuw nsw i32 %168, 1
  %969 = icmp eq i32 %968, %4
  br i1 %969, label %173, label %167, !llvm.loop !23
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
