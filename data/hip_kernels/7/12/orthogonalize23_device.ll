; ModuleID = '../data/hip_kernels/7/12/main.cu'
source_filename = "../data/hip_kernels/7/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15orthogonalize23PfPiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !5
  %17 = icmp sgt i32 %16, 0
  %18 = mul i32 %13, %3
  br i1 %17, label %19, label %49

19:                                               ; preds = %4
  %20 = add i32 %16, -1
  %21 = and i32 %16, 7
  %22 = icmp ult i32 %20, 7
  br i1 %22, label %25, label %23

23:                                               ; preds = %19
  %24 = and i32 %16, -8
  br label %57

25:                                               ; preds = %57, %19
  %26 = phi float [ undef, %19 ], [ %163, %57 ]
  %27 = phi i32 [ 0, %19 ], [ %164, %57 ]
  %28 = phi float [ 0.000000e+00, %19 ], [ %163, %57 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %49, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %46, %30 ], [ %27, %25 ]
  %32 = phi float [ %45, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %47, %30 ], [ 0, %25 ]
  %34 = add i32 %31, %18
  %35 = mul i32 %34, 6
  %36 = add nsw i32 %35, 3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11
  %40 = add nsw i32 %35, 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %44 = fmul contract float %39, %43
  %45 = fadd contract float %32, %44
  %46 = add nuw nsw i32 %31, 1
  %47 = add i32 %33, 1
  %48 = icmp eq i32 %47, %21
  br i1 %48, label %49, label %30, !llvm.loop !13

49:                                               ; preds = %25, %30, %4
  %50 = phi float [ 0.000000e+00, %4 ], [ %26, %25 ], [ %45, %30 ]
  br i1 %17, label %51, label %271

51:                                               ; preds = %49
  %52 = add i32 %16, -1
  %53 = and i32 %16, 3
  %54 = icmp ult i32 %52, 3
  br i1 %54, label %167, label %55

55:                                               ; preds = %51
  %56 = and i32 %16, -4
  br label %194

57:                                               ; preds = %57, %23
  %58 = phi i32 [ 0, %23 ], [ %164, %57 ]
  %59 = phi float [ 0.000000e+00, %23 ], [ %163, %57 ]
  %60 = phi i32 [ 0, %23 ], [ %165, %57 ]
  %61 = add i32 %58, %18
  %62 = mul i32 %61, 6
  %63 = add nsw i32 %62, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !11
  %67 = add nsw i32 %62, 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !11
  %71 = fmul contract float %66, %70
  %72 = fadd contract float %59, %71
  %73 = or i32 %58, 1
  %74 = add i32 %73, %18
  %75 = mul i32 %74, 6
  %76 = add nsw i32 %75, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11
  %80 = add nsw i32 %75, 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %72, %84
  %86 = or i32 %58, 2
  %87 = add i32 %86, %18
  %88 = mul i32 %87, 6
  %89 = add nsw i32 %88, 3
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = add nsw i32 %88, 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %85, %97
  %99 = or i32 %58, 3
  %100 = add i32 %99, %18
  %101 = mul i32 %100, 6
  %102 = add nsw i32 %101, 3
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11
  %106 = add nsw i32 %101, 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11
  %110 = fmul contract float %105, %109
  %111 = fadd contract float %98, %110
  %112 = or i32 %58, 4
  %113 = add i32 %112, %18
  %114 = mul i32 %113, 6
  %115 = add nsw i32 %114, 3
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !11
  %119 = add nsw i32 %114, 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11
  %123 = fmul contract float %118, %122
  %124 = fadd contract float %111, %123
  %125 = or i32 %58, 5
  %126 = add i32 %125, %18
  %127 = mul i32 %126, 6
  %128 = add nsw i32 %127, 3
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !11
  %132 = add nsw i32 %127, 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11
  %136 = fmul contract float %131, %135
  %137 = fadd contract float %124, %136
  %138 = or i32 %58, 6
  %139 = add i32 %138, %18
  %140 = mul i32 %139, 6
  %141 = add nsw i32 %140, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !11
  %145 = add nsw i32 %140, 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !11
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %137, %149
  %151 = or i32 %58, 7
  %152 = add i32 %151, %18
  %153 = mul i32 %152, 6
  %154 = add nsw i32 %153, 3
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !11
  %158 = add nsw i32 %153, 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !11
  %162 = fmul contract float %157, %161
  %163 = fadd contract float %150, %162
  %164 = add nuw nsw i32 %58, 8
  %165 = add i32 %60, 8
  %166 = icmp eq i32 %165, %24
  br i1 %166, label %25, label %57, !llvm.loop !15

167:                                              ; preds = %194, %51
  %168 = phi i32 [ 0, %51 ], [ %248, %194 ]
  %169 = icmp eq i32 %53, 0
  br i1 %169, label %188, label %170

170:                                              ; preds = %167, %170
  %171 = phi i32 [ %185, %170 ], [ %168, %167 ]
  %172 = phi i32 [ %186, %170 ], [ 0, %167 ]
  %173 = add i32 %171, %18
  %174 = mul i32 %173, 6
  %175 = add nsw i32 %174, 3
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !11
  %179 = fmul contract float %50, %178
  %180 = add nsw i32 %174, 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !11
  %184 = fsub contract float %183, %179
  store float %184, float addrspace(1)* %182, align 4, !tbaa !11
  %185 = add nuw nsw i32 %171, 1
  %186 = add i32 %172, 1
  %187 = icmp eq i32 %186, %53
  br i1 %187, label %188, label %170, !llvm.loop !17

188:                                              ; preds = %170, %167
  br i1 %17, label %189, label %271

189:                                              ; preds = %188
  %190 = and i32 %16, 7
  %191 = icmp ult i32 %52, 7
  br i1 %191, label %251, label %192

192:                                              ; preds = %189
  %193 = and i32 %16, -8
  br label %301

194:                                              ; preds = %194, %55
  %195 = phi i32 [ 0, %55 ], [ %248, %194 ]
  %196 = phi i32 [ 0, %55 ], [ %249, %194 ]
  %197 = add i32 %195, %18
  %198 = mul i32 %197, 6
  %199 = add nsw i32 %198, 3
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !11
  %203 = fmul contract float %50, %202
  %204 = add nsw i32 %198, 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %0, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !11
  %208 = fsub contract float %207, %203
  store float %208, float addrspace(1)* %206, align 4, !tbaa !11
  %209 = or i32 %195, 1
  %210 = add i32 %209, %18
  %211 = mul i32 %210, 6
  %212 = add nsw i32 %211, 3
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %0, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !11
  %216 = fmul contract float %50, %215
  %217 = add nsw i32 %211, 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !11
  %221 = fsub contract float %220, %216
  store float %221, float addrspace(1)* %219, align 4, !tbaa !11
  %222 = or i32 %195, 2
  %223 = add i32 %222, %18
  %224 = mul i32 %223, 6
  %225 = add nsw i32 %224, 3
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %0, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !11
  %229 = fmul contract float %50, %228
  %230 = add nsw i32 %224, 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %0, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !11
  %234 = fsub contract float %233, %229
  store float %234, float addrspace(1)* %232, align 4, !tbaa !11
  %235 = or i32 %195, 3
  %236 = add i32 %235, %18
  %237 = mul i32 %236, 6
  %238 = add nsw i32 %237, 3
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !11
  %242 = fmul contract float %50, %241
  %243 = add nsw i32 %237, 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !11
  %247 = fsub contract float %246, %242
  store float %247, float addrspace(1)* %245, align 4, !tbaa !11
  %248 = add nuw nsw i32 %195, 4
  %249 = add i32 %196, 4
  %250 = icmp eq i32 %249, %56
  br i1 %250, label %167, label %194, !llvm.loop !18

251:                                              ; preds = %301, %189
  %252 = phi float [ undef, %189 ], [ %375, %301 ]
  %253 = phi i32 [ 0, %189 ], [ %376, %301 ]
  %254 = phi float [ 0.000000e+00, %189 ], [ %375, %301 ]
  %255 = icmp eq i32 %190, 0
  br i1 %255, label %271, label %256

256:                                              ; preds = %251, %256
  %257 = phi i32 [ %268, %256 ], [ %253, %251 ]
  %258 = phi float [ %267, %256 ], [ %254, %251 ]
  %259 = phi i32 [ %269, %256 ], [ 0, %251 ]
  %260 = add i32 %257, %18
  %261 = mul i32 %260, 6
  %262 = add i32 %261, 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !11
  %266 = fmul contract float %265, %265
  %267 = fadd contract float %258, %266
  %268 = add nuw nsw i32 %257, 1
  %269 = add i32 %259, 1
  %270 = icmp eq i32 %269, %190
  br i1 %270, label %271, label %256, !llvm.loop !19

271:                                              ; preds = %251, %256, %49, %188
  %272 = phi float [ 0.000000e+00, %188 ], [ 0.000000e+00, %49 ], [ %252, %251 ], [ %267, %256 ]
  %273 = fcmp olt float %272, 0x39F0000000000000
  %274 = select i1 %273, float 0x41F0000000000000, float 1.000000e+00
  %275 = fmul float %272, %274
  %276 = tail call float @llvm.sqrt.f32(float %275)
  %277 = bitcast float %276 to i32
  %278 = add nsw i32 %277, -1
  %279 = bitcast i32 %278 to float
  %280 = add nsw i32 %277, 1
  %281 = bitcast i32 %280 to float
  %282 = tail call i1 @llvm.amdgcn.class.f32(float %275, i32 608)
  %283 = select i1 %273, float 0x3EF0000000000000, float 1.000000e+00
  %284 = fneg float %281
  %285 = tail call float @llvm.fma.f32(float %284, float %276, float %275)
  %286 = fcmp ogt float %285, 0.000000e+00
  %287 = fneg float %279
  %288 = tail call float @llvm.fma.f32(float %287, float %276, float %275)
  %289 = fcmp ole float %288, 0.000000e+00
  %290 = select i1 %289, float %279, float %276
  %291 = select i1 %286, float %281, float %290
  %292 = fmul float %283, %291
  %293 = select i1 %282, float %275, float %292
  %294 = fdiv contract float 1.000000e+00, %293
  br i1 %17, label %295, label %535

295:                                              ; preds = %271
  %296 = add i32 %16, -1
  %297 = and i32 %16, 7
  %298 = icmp ult i32 %296, 7
  br i1 %298, label %379, label %299

299:                                              ; preds = %295
  %300 = and i32 %16, -8
  br label %1067

301:                                              ; preds = %301, %192
  %302 = phi i32 [ 0, %192 ], [ %376, %301 ]
  %303 = phi float [ 0.000000e+00, %192 ], [ %375, %301 ]
  %304 = phi i32 [ 0, %192 ], [ %377, %301 ]
  %305 = add i32 %302, %18
  %306 = mul i32 %305, 6
  %307 = add i32 %306, 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %0, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !11
  %311 = fmul contract float %310, %310
  %312 = fadd contract float %303, %311
  %313 = or i32 %302, 1
  %314 = add i32 %313, %18
  %315 = mul i32 %314, 6
  %316 = add i32 %315, 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %0, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !11
  %320 = fmul contract float %319, %319
  %321 = fadd contract float %312, %320
  %322 = or i32 %302, 2
  %323 = add i32 %322, %18
  %324 = mul i32 %323, 6
  %325 = add i32 %324, 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %0, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !11
  %329 = fmul contract float %328, %328
  %330 = fadd contract float %321, %329
  %331 = or i32 %302, 3
  %332 = add i32 %331, %18
  %333 = mul i32 %332, 6
  %334 = add i32 %333, 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %0, i64 %335
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !11
  %338 = fmul contract float %337, %337
  %339 = fadd contract float %330, %338
  %340 = or i32 %302, 4
  %341 = add i32 %340, %18
  %342 = mul i32 %341, 6
  %343 = add i32 %342, 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !11
  %347 = fmul contract float %346, %346
  %348 = fadd contract float %339, %347
  %349 = or i32 %302, 5
  %350 = add i32 %349, %18
  %351 = mul i32 %350, 6
  %352 = add i32 %351, 4
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %0, i64 %353
  %355 = load float, float addrspace(1)* %354, align 4, !tbaa !11
  %356 = fmul contract float %355, %355
  %357 = fadd contract float %348, %356
  %358 = or i32 %302, 6
  %359 = add i32 %358, %18
  %360 = mul i32 %359, 6
  %361 = add i32 %360, 4
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %0, i64 %362
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !11
  %365 = fmul contract float %364, %364
  %366 = fadd contract float %357, %365
  %367 = or i32 %302, 7
  %368 = add i32 %367, %18
  %369 = mul i32 %368, 6
  %370 = add i32 %369, 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %0, i64 %371
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !11
  %374 = fmul contract float %373, %373
  %375 = fadd contract float %366, %374
  %376 = add nuw nsw i32 %302, 8
  %377 = add i32 %304, 8
  %378 = icmp eq i32 %377, %193
  br i1 %378, label %251, label %301, !llvm.loop !20

379:                                              ; preds = %1067, %295
  %380 = phi i32 [ 0, %295 ], [ %1133, %1067 ]
  %381 = icmp eq i32 %297, 0
  br i1 %381, label %395, label %382

382:                                              ; preds = %379, %382
  %383 = phi i32 [ %392, %382 ], [ %380, %379 ]
  %384 = phi i32 [ %393, %382 ], [ 0, %379 ]
  %385 = add i32 %383, %18
  %386 = mul i32 %385, 6
  %387 = add i32 %386, 4
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float addrspace(1)* %0, i64 %388
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !11
  %391 = fmul contract float %294, %390
  store float %391, float addrspace(1)* %389, align 4, !tbaa !11
  %392 = add nuw nsw i32 %383, 1
  %393 = add i32 %384, 1
  %394 = icmp eq i32 %393, %297
  br i1 %394, label %395, label %382, !llvm.loop !21

395:                                              ; preds = %382, %379
  br i1 %17, label %396, label %535

396:                                              ; preds = %395
  %397 = and i32 %16, 7
  %398 = icmp ult i32 %296, 7
  br i1 %398, label %511, label %399

399:                                              ; preds = %396
  %400 = and i32 %16, -8
  br label %401

401:                                              ; preds = %401, %399
  %402 = phi i32 [ 0, %399 ], [ %508, %401 ]
  %403 = phi float [ 0.000000e+00, %399 ], [ %507, %401 ]
  %404 = phi i32 [ 0, %399 ], [ %509, %401 ]
  %405 = add i32 %402, %18
  %406 = mul i32 %405, 6
  %407 = add nsw i32 %406, 3
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds float, float addrspace(1)* %0, i64 %408
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !11
  %411 = add nsw i32 %406, 5
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds float, float addrspace(1)* %0, i64 %412
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !11
  %415 = fmul contract float %410, %414
  %416 = fadd contract float %403, %415
  %417 = or i32 %402, 1
  %418 = add i32 %417, %18
  %419 = mul i32 %418, 6
  %420 = add nsw i32 %419, 3
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %0, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !11
  %424 = add nsw i32 %419, 5
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %0, i64 %425
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !11
  %428 = fmul contract float %423, %427
  %429 = fadd contract float %416, %428
  %430 = or i32 %402, 2
  %431 = add i32 %430, %18
  %432 = mul i32 %431, 6
  %433 = add nsw i32 %432, 3
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(1)* %0, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !11
  %437 = add nsw i32 %432, 5
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds float, float addrspace(1)* %0, i64 %438
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !11
  %441 = fmul contract float %436, %440
  %442 = fadd contract float %429, %441
  %443 = or i32 %402, 3
  %444 = add i32 %443, %18
  %445 = mul i32 %444, 6
  %446 = add nsw i32 %445, 3
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !11
  %450 = add nsw i32 %445, 5
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds float, float addrspace(1)* %0, i64 %451
  %453 = load float, float addrspace(1)* %452, align 4, !tbaa !11
  %454 = fmul contract float %449, %453
  %455 = fadd contract float %442, %454
  %456 = or i32 %402, 4
  %457 = add i32 %456, %18
  %458 = mul i32 %457, 6
  %459 = add nsw i32 %458, 3
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %0, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !11
  %463 = add nsw i32 %458, 5
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(1)* %0, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !11
  %467 = fmul contract float %462, %466
  %468 = fadd contract float %455, %467
  %469 = or i32 %402, 5
  %470 = add i32 %469, %18
  %471 = mul i32 %470, 6
  %472 = add nsw i32 %471, 3
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds float, float addrspace(1)* %0, i64 %473
  %475 = load float, float addrspace(1)* %474, align 4, !tbaa !11
  %476 = add nsw i32 %471, 5
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds float, float addrspace(1)* %0, i64 %477
  %479 = load float, float addrspace(1)* %478, align 4, !tbaa !11
  %480 = fmul contract float %475, %479
  %481 = fadd contract float %468, %480
  %482 = or i32 %402, 6
  %483 = add i32 %482, %18
  %484 = mul i32 %483, 6
  %485 = add nsw i32 %484, 3
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds float, float addrspace(1)* %0, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !11
  %489 = add nsw i32 %484, 5
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds float, float addrspace(1)* %0, i64 %490
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !11
  %493 = fmul contract float %488, %492
  %494 = fadd contract float %481, %493
  %495 = or i32 %402, 7
  %496 = add i32 %495, %18
  %497 = mul i32 %496, 6
  %498 = add nsw i32 %497, 3
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %0, i64 %499
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !11
  %502 = add nsw i32 %497, 5
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %0, i64 %503
  %505 = load float, float addrspace(1)* %504, align 4, !tbaa !11
  %506 = fmul contract float %501, %505
  %507 = fadd contract float %494, %506
  %508 = add nuw nsw i32 %402, 8
  %509 = add i32 %404, 8
  %510 = icmp eq i32 %509, %400
  br i1 %510, label %511, label %401, !llvm.loop !15

511:                                              ; preds = %401, %396
  %512 = phi float [ undef, %396 ], [ %507, %401 ]
  %513 = phi i32 [ 0, %396 ], [ %508, %401 ]
  %514 = phi float [ 0.000000e+00, %396 ], [ %507, %401 ]
  %515 = icmp eq i32 %397, 0
  br i1 %515, label %535, label %516

516:                                              ; preds = %511, %516
  %517 = phi i32 [ %532, %516 ], [ %513, %511 ]
  %518 = phi float [ %531, %516 ], [ %514, %511 ]
  %519 = phi i32 [ %533, %516 ], [ 0, %511 ]
  %520 = add i32 %517, %18
  %521 = mul i32 %520, 6
  %522 = add nsw i32 %521, 3
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds float, float addrspace(1)* %0, i64 %523
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !11
  %526 = add nsw i32 %521, 5
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %0, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !11
  %530 = fmul contract float %525, %529
  %531 = fadd contract float %518, %530
  %532 = add nuw nsw i32 %517, 1
  %533 = add i32 %519, 1
  %534 = icmp eq i32 %533, %397
  br i1 %534, label %535, label %516, !llvm.loop !22

535:                                              ; preds = %511, %516, %271, %395
  %536 = phi float [ 0.000000e+00, %395 ], [ 0.000000e+00, %271 ], [ %512, %511 ], [ %531, %516 ]
  br i1 %17, label %537, label %761

537:                                              ; preds = %535
  %538 = add i32 %16, -1
  %539 = and i32 %16, 3
  %540 = icmp ult i32 %538, 3
  br i1 %540, label %600, label %541

541:                                              ; preds = %537
  %542 = and i32 %16, -4
  br label %543

543:                                              ; preds = %543, %541
  %544 = phi i32 [ 0, %541 ], [ %597, %543 ]
  %545 = phi i32 [ 0, %541 ], [ %598, %543 ]
  %546 = add i32 %544, %18
  %547 = mul i32 %546, 6
  %548 = add nsw i32 %547, 3
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %0, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !11
  %552 = fmul contract float %536, %551
  %553 = add nsw i32 %547, 5
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %0, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !11
  %557 = fsub contract float %556, %552
  store float %557, float addrspace(1)* %555, align 4, !tbaa !11
  %558 = or i32 %544, 1
  %559 = add i32 %558, %18
  %560 = mul i32 %559, 6
  %561 = add nsw i32 %560, 3
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds float, float addrspace(1)* %0, i64 %562
  %564 = load float, float addrspace(1)* %563, align 4, !tbaa !11
  %565 = fmul contract float %536, %564
  %566 = add nsw i32 %560, 5
  %567 = sext i32 %566 to i64
  %568 = getelementptr inbounds float, float addrspace(1)* %0, i64 %567
  %569 = load float, float addrspace(1)* %568, align 4, !tbaa !11
  %570 = fsub contract float %569, %565
  store float %570, float addrspace(1)* %568, align 4, !tbaa !11
  %571 = or i32 %544, 2
  %572 = add i32 %571, %18
  %573 = mul i32 %572, 6
  %574 = add nsw i32 %573, 3
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %0, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !11
  %578 = fmul contract float %536, %577
  %579 = add nsw i32 %573, 5
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds float, float addrspace(1)* %0, i64 %580
  %582 = load float, float addrspace(1)* %581, align 4, !tbaa !11
  %583 = fsub contract float %582, %578
  store float %583, float addrspace(1)* %581, align 4, !tbaa !11
  %584 = or i32 %544, 3
  %585 = add i32 %584, %18
  %586 = mul i32 %585, 6
  %587 = add nsw i32 %586, 3
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 %588
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !11
  %591 = fmul contract float %536, %590
  %592 = add nsw i32 %586, 5
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds float, float addrspace(1)* %0, i64 %593
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !11
  %596 = fsub contract float %595, %591
  store float %596, float addrspace(1)* %594, align 4, !tbaa !11
  %597 = add nuw nsw i32 %544, 4
  %598 = add i32 %545, 4
  %599 = icmp eq i32 %598, %542
  br i1 %599, label %600, label %543, !llvm.loop !18

600:                                              ; preds = %543, %537
  %601 = phi i32 [ 0, %537 ], [ %597, %543 ]
  %602 = icmp eq i32 %539, 0
  br i1 %602, label %621, label %603

603:                                              ; preds = %600, %603
  %604 = phi i32 [ %618, %603 ], [ %601, %600 ]
  %605 = phi i32 [ %619, %603 ], [ 0, %600 ]
  %606 = add i32 %604, %18
  %607 = mul i32 %606, 6
  %608 = add nsw i32 %607, 3
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %0, i64 %609
  %611 = load float, float addrspace(1)* %610, align 4, !tbaa !11
  %612 = fmul contract float %536, %611
  %613 = add nsw i32 %607, 5
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %0, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !11
  %617 = fsub contract float %616, %612
  store float %617, float addrspace(1)* %615, align 4, !tbaa !11
  %618 = add nuw nsw i32 %604, 1
  %619 = add i32 %605, 1
  %620 = icmp eq i32 %619, %539
  br i1 %620, label %621, label %603, !llvm.loop !23

621:                                              ; preds = %603, %600
  br i1 %17, label %622, label %761

622:                                              ; preds = %621
  %623 = and i32 %16, 7
  %624 = icmp ult i32 %538, 7
  br i1 %624, label %737, label %625

625:                                              ; preds = %622
  %626 = and i32 %16, -8
  br label %627

627:                                              ; preds = %627, %625
  %628 = phi i32 [ 0, %625 ], [ %734, %627 ]
  %629 = phi float [ 0.000000e+00, %625 ], [ %733, %627 ]
  %630 = phi i32 [ 0, %625 ], [ %735, %627 ]
  %631 = add i32 %628, %18
  %632 = mul i32 %631, 6
  %633 = add nsw i32 %632, 4
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds float, float addrspace(1)* %0, i64 %634
  %636 = load float, float addrspace(1)* %635, align 4, !tbaa !11
  %637 = add nsw i32 %632, 5
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds float, float addrspace(1)* %0, i64 %638
  %640 = load float, float addrspace(1)* %639, align 4, !tbaa !11
  %641 = fmul contract float %636, %640
  %642 = fadd contract float %629, %641
  %643 = or i32 %628, 1
  %644 = add i32 %643, %18
  %645 = mul i32 %644, 6
  %646 = add nsw i32 %645, 4
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds float, float addrspace(1)* %0, i64 %647
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !11
  %650 = add nsw i32 %645, 5
  %651 = sext i32 %650 to i64
  %652 = getelementptr inbounds float, float addrspace(1)* %0, i64 %651
  %653 = load float, float addrspace(1)* %652, align 4, !tbaa !11
  %654 = fmul contract float %649, %653
  %655 = fadd contract float %642, %654
  %656 = or i32 %628, 2
  %657 = add i32 %656, %18
  %658 = mul i32 %657, 6
  %659 = add nsw i32 %658, 4
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds float, float addrspace(1)* %0, i64 %660
  %662 = load float, float addrspace(1)* %661, align 4, !tbaa !11
  %663 = add nsw i32 %658, 5
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds float, float addrspace(1)* %0, i64 %664
  %666 = load float, float addrspace(1)* %665, align 4, !tbaa !11
  %667 = fmul contract float %662, %666
  %668 = fadd contract float %655, %667
  %669 = or i32 %628, 3
  %670 = add i32 %669, %18
  %671 = mul i32 %670, 6
  %672 = add nsw i32 %671, 4
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds float, float addrspace(1)* %0, i64 %673
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !11
  %676 = add nsw i32 %671, 5
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds float, float addrspace(1)* %0, i64 %677
  %679 = load float, float addrspace(1)* %678, align 4, !tbaa !11
  %680 = fmul contract float %675, %679
  %681 = fadd contract float %668, %680
  %682 = or i32 %628, 4
  %683 = add i32 %682, %18
  %684 = mul i32 %683, 6
  %685 = add nsw i32 %684, 4
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds float, float addrspace(1)* %0, i64 %686
  %688 = load float, float addrspace(1)* %687, align 4, !tbaa !11
  %689 = add nsw i32 %684, 5
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds float, float addrspace(1)* %0, i64 %690
  %692 = load float, float addrspace(1)* %691, align 4, !tbaa !11
  %693 = fmul contract float %688, %692
  %694 = fadd contract float %681, %693
  %695 = or i32 %628, 5
  %696 = add i32 %695, %18
  %697 = mul i32 %696, 6
  %698 = add nsw i32 %697, 4
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds float, float addrspace(1)* %0, i64 %699
  %701 = load float, float addrspace(1)* %700, align 4, !tbaa !11
  %702 = add nsw i32 %697, 5
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds float, float addrspace(1)* %0, i64 %703
  %705 = load float, float addrspace(1)* %704, align 4, !tbaa !11
  %706 = fmul contract float %701, %705
  %707 = fadd contract float %694, %706
  %708 = or i32 %628, 6
  %709 = add i32 %708, %18
  %710 = mul i32 %709, 6
  %711 = add nsw i32 %710, 4
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds float, float addrspace(1)* %0, i64 %712
  %714 = load float, float addrspace(1)* %713, align 4, !tbaa !11
  %715 = add nsw i32 %710, 5
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds float, float addrspace(1)* %0, i64 %716
  %718 = load float, float addrspace(1)* %717, align 4, !tbaa !11
  %719 = fmul contract float %714, %718
  %720 = fadd contract float %707, %719
  %721 = or i32 %628, 7
  %722 = add i32 %721, %18
  %723 = mul i32 %722, 6
  %724 = add nsw i32 %723, 4
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds float, float addrspace(1)* %0, i64 %725
  %727 = load float, float addrspace(1)* %726, align 4, !tbaa !11
  %728 = add nsw i32 %723, 5
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds float, float addrspace(1)* %0, i64 %729
  %731 = load float, float addrspace(1)* %730, align 4, !tbaa !11
  %732 = fmul contract float %727, %731
  %733 = fadd contract float %720, %732
  %734 = add nuw nsw i32 %628, 8
  %735 = add i32 %630, 8
  %736 = icmp eq i32 %735, %626
  br i1 %736, label %737, label %627, !llvm.loop !15

737:                                              ; preds = %627, %622
  %738 = phi float [ undef, %622 ], [ %733, %627 ]
  %739 = phi i32 [ 0, %622 ], [ %734, %627 ]
  %740 = phi float [ 0.000000e+00, %622 ], [ %733, %627 ]
  %741 = icmp eq i32 %623, 0
  br i1 %741, label %761, label %742

742:                                              ; preds = %737, %742
  %743 = phi i32 [ %758, %742 ], [ %739, %737 ]
  %744 = phi float [ %757, %742 ], [ %740, %737 ]
  %745 = phi i32 [ %759, %742 ], [ 0, %737 ]
  %746 = add i32 %743, %18
  %747 = mul i32 %746, 6
  %748 = add nsw i32 %747, 4
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %0, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !11
  %752 = add nsw i32 %747, 5
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds float, float addrspace(1)* %0, i64 %753
  %755 = load float, float addrspace(1)* %754, align 4, !tbaa !11
  %756 = fmul contract float %751, %755
  %757 = fadd contract float %744, %756
  %758 = add nuw nsw i32 %743, 1
  %759 = add i32 %745, 1
  %760 = icmp eq i32 %759, %623
  br i1 %760, label %761, label %742, !llvm.loop !24

761:                                              ; preds = %737, %742, %535, %621
  %762 = phi float [ 0.000000e+00, %621 ], [ 0.000000e+00, %535 ], [ %738, %737 ], [ %757, %742 ]
  br i1 %17, label %763, label %951

763:                                              ; preds = %761
  %764 = add i32 %16, -1
  %765 = and i32 %16, 3
  %766 = icmp ult i32 %764, 3
  br i1 %766, label %826, label %767

767:                                              ; preds = %763
  %768 = and i32 %16, -4
  br label %769

769:                                              ; preds = %769, %767
  %770 = phi i32 [ 0, %767 ], [ %823, %769 ]
  %771 = phi i32 [ 0, %767 ], [ %824, %769 ]
  %772 = add i32 %770, %18
  %773 = mul i32 %772, 6
  %774 = add nsw i32 %773, 4
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %0, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !11
  %778 = fmul contract float %762, %777
  %779 = add nsw i32 %773, 5
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds float, float addrspace(1)* %0, i64 %780
  %782 = load float, float addrspace(1)* %781, align 4, !tbaa !11
  %783 = fsub contract float %782, %778
  store float %783, float addrspace(1)* %781, align 4, !tbaa !11
  %784 = or i32 %770, 1
  %785 = add i32 %784, %18
  %786 = mul i32 %785, 6
  %787 = add nsw i32 %786, 4
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds float, float addrspace(1)* %0, i64 %788
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !11
  %791 = fmul contract float %762, %790
  %792 = add nsw i32 %786, 5
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds float, float addrspace(1)* %0, i64 %793
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !11
  %796 = fsub contract float %795, %791
  store float %796, float addrspace(1)* %794, align 4, !tbaa !11
  %797 = or i32 %770, 2
  %798 = add i32 %797, %18
  %799 = mul i32 %798, 6
  %800 = add nsw i32 %799, 4
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds float, float addrspace(1)* %0, i64 %801
  %803 = load float, float addrspace(1)* %802, align 4, !tbaa !11
  %804 = fmul contract float %762, %803
  %805 = add nsw i32 %799, 5
  %806 = sext i32 %805 to i64
  %807 = getelementptr inbounds float, float addrspace(1)* %0, i64 %806
  %808 = load float, float addrspace(1)* %807, align 4, !tbaa !11
  %809 = fsub contract float %808, %804
  store float %809, float addrspace(1)* %807, align 4, !tbaa !11
  %810 = or i32 %770, 3
  %811 = add i32 %810, %18
  %812 = mul i32 %811, 6
  %813 = add nsw i32 %812, 4
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds float, float addrspace(1)* %0, i64 %814
  %816 = load float, float addrspace(1)* %815, align 4, !tbaa !11
  %817 = fmul contract float %762, %816
  %818 = add nsw i32 %812, 5
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds float, float addrspace(1)* %0, i64 %819
  %821 = load float, float addrspace(1)* %820, align 4, !tbaa !11
  %822 = fsub contract float %821, %817
  store float %822, float addrspace(1)* %820, align 4, !tbaa !11
  %823 = add nuw nsw i32 %770, 4
  %824 = add i32 %771, 4
  %825 = icmp eq i32 %824, %768
  br i1 %825, label %826, label %769, !llvm.loop !18

826:                                              ; preds = %769, %763
  %827 = phi i32 [ 0, %763 ], [ %823, %769 ]
  %828 = icmp eq i32 %765, 0
  br i1 %828, label %847, label %829

829:                                              ; preds = %826, %829
  %830 = phi i32 [ %844, %829 ], [ %827, %826 ]
  %831 = phi i32 [ %845, %829 ], [ 0, %826 ]
  %832 = add i32 %830, %18
  %833 = mul i32 %832, 6
  %834 = add nsw i32 %833, 4
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds float, float addrspace(1)* %0, i64 %835
  %837 = load float, float addrspace(1)* %836, align 4, !tbaa !11
  %838 = fmul contract float %762, %837
  %839 = add nsw i32 %833, 5
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds float, float addrspace(1)* %0, i64 %840
  %842 = load float, float addrspace(1)* %841, align 4, !tbaa !11
  %843 = fsub contract float %842, %838
  store float %843, float addrspace(1)* %841, align 4, !tbaa !11
  %844 = add nuw nsw i32 %830, 1
  %845 = add i32 %831, 1
  %846 = icmp eq i32 %845, %765
  br i1 %846, label %847, label %829, !llvm.loop !25

847:                                              ; preds = %829, %826
  br i1 %17, label %848, label %951

848:                                              ; preds = %847
  %849 = and i32 %16, 7
  %850 = icmp ult i32 %764, 7
  br i1 %850, label %931, label %851

851:                                              ; preds = %848
  %852 = and i32 %16, -8
  br label %853

853:                                              ; preds = %853, %851
  %854 = phi i32 [ 0, %851 ], [ %928, %853 ]
  %855 = phi float [ 0.000000e+00, %851 ], [ %927, %853 ]
  %856 = phi i32 [ 0, %851 ], [ %929, %853 ]
  %857 = add i32 %854, %18
  %858 = mul i32 %857, 6
  %859 = add i32 %858, 5
  %860 = sext i32 %859 to i64
  %861 = getelementptr inbounds float, float addrspace(1)* %0, i64 %860
  %862 = load float, float addrspace(1)* %861, align 4, !tbaa !11
  %863 = fmul contract float %862, %862
  %864 = fadd contract float %855, %863
  %865 = or i32 %854, 1
  %866 = add i32 %865, %18
  %867 = mul i32 %866, 6
  %868 = add i32 %867, 5
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds float, float addrspace(1)* %0, i64 %869
  %871 = load float, float addrspace(1)* %870, align 4, !tbaa !11
  %872 = fmul contract float %871, %871
  %873 = fadd contract float %864, %872
  %874 = or i32 %854, 2
  %875 = add i32 %874, %18
  %876 = mul i32 %875, 6
  %877 = add i32 %876, 5
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds float, float addrspace(1)* %0, i64 %878
  %880 = load float, float addrspace(1)* %879, align 4, !tbaa !11
  %881 = fmul contract float %880, %880
  %882 = fadd contract float %873, %881
  %883 = or i32 %854, 3
  %884 = add i32 %883, %18
  %885 = mul i32 %884, 6
  %886 = add i32 %885, 5
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds float, float addrspace(1)* %0, i64 %887
  %889 = load float, float addrspace(1)* %888, align 4, !tbaa !11
  %890 = fmul contract float %889, %889
  %891 = fadd contract float %882, %890
  %892 = or i32 %854, 4
  %893 = add i32 %892, %18
  %894 = mul i32 %893, 6
  %895 = add i32 %894, 5
  %896 = sext i32 %895 to i64
  %897 = getelementptr inbounds float, float addrspace(1)* %0, i64 %896
  %898 = load float, float addrspace(1)* %897, align 4, !tbaa !11
  %899 = fmul contract float %898, %898
  %900 = fadd contract float %891, %899
  %901 = or i32 %854, 5
  %902 = add i32 %901, %18
  %903 = mul i32 %902, 6
  %904 = add i32 %903, 5
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds float, float addrspace(1)* %0, i64 %905
  %907 = load float, float addrspace(1)* %906, align 4, !tbaa !11
  %908 = fmul contract float %907, %907
  %909 = fadd contract float %900, %908
  %910 = or i32 %854, 6
  %911 = add i32 %910, %18
  %912 = mul i32 %911, 6
  %913 = add i32 %912, 5
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds float, float addrspace(1)* %0, i64 %914
  %916 = load float, float addrspace(1)* %915, align 4, !tbaa !11
  %917 = fmul contract float %916, %916
  %918 = fadd contract float %909, %917
  %919 = or i32 %854, 7
  %920 = add i32 %919, %18
  %921 = mul i32 %920, 6
  %922 = add i32 %921, 5
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds float, float addrspace(1)* %0, i64 %923
  %925 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %926 = fmul contract float %925, %925
  %927 = fadd contract float %918, %926
  %928 = add nuw nsw i32 %854, 8
  %929 = add i32 %856, 8
  %930 = icmp eq i32 %929, %852
  br i1 %930, label %931, label %853, !llvm.loop !20

931:                                              ; preds = %853, %848
  %932 = phi float [ undef, %848 ], [ %927, %853 ]
  %933 = phi i32 [ 0, %848 ], [ %928, %853 ]
  %934 = phi float [ 0.000000e+00, %848 ], [ %927, %853 ]
  %935 = icmp eq i32 %849, 0
  br i1 %935, label %951, label %936

936:                                              ; preds = %931, %936
  %937 = phi i32 [ %948, %936 ], [ %933, %931 ]
  %938 = phi float [ %947, %936 ], [ %934, %931 ]
  %939 = phi i32 [ %949, %936 ], [ 0, %931 ]
  %940 = add i32 %937, %18
  %941 = mul i32 %940, 6
  %942 = add i32 %941, 5
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds float, float addrspace(1)* %0, i64 %943
  %945 = load float, float addrspace(1)* %944, align 4, !tbaa !11
  %946 = fmul contract float %945, %945
  %947 = fadd contract float %938, %946
  %948 = add nuw nsw i32 %937, 1
  %949 = add i32 %939, 1
  %950 = icmp eq i32 %949, %849
  br i1 %950, label %951, label %936, !llvm.loop !26

951:                                              ; preds = %931, %936, %761, %847
  %952 = phi float [ 0.000000e+00, %847 ], [ 0.000000e+00, %761 ], [ %932, %931 ], [ %947, %936 ]
  %953 = fcmp olt float %952, 0x39F0000000000000
  %954 = select i1 %953, float 0x41F0000000000000, float 1.000000e+00
  %955 = fmul float %952, %954
  %956 = tail call float @llvm.sqrt.f32(float %955)
  %957 = bitcast float %956 to i32
  %958 = add nsw i32 %957, -1
  %959 = bitcast i32 %958 to float
  %960 = add nsw i32 %957, 1
  %961 = bitcast i32 %960 to float
  %962 = tail call i1 @llvm.amdgcn.class.f32(float %955, i32 608)
  %963 = select i1 %953, float 0x3EF0000000000000, float 1.000000e+00
  %964 = fneg float %961
  %965 = tail call float @llvm.fma.f32(float %964, float %956, float %955)
  %966 = fcmp ogt float %965, 0.000000e+00
  %967 = fneg float %959
  %968 = tail call float @llvm.fma.f32(float %967, float %956, float %955)
  %969 = fcmp ole float %968, 0.000000e+00
  %970 = select i1 %969, float %959, float %956
  %971 = select i1 %966, float %961, float %970
  %972 = fmul float %963, %971
  %973 = select i1 %962, float %955, float %972
  %974 = fdiv contract float 1.000000e+00, %973
  br i1 %17, label %975, label %1066

975:                                              ; preds = %951
  %976 = add i32 %16, -1
  %977 = and i32 %16, 7
  %978 = icmp ult i32 %976, 7
  br i1 %978, label %1050, label %979

979:                                              ; preds = %975
  %980 = and i32 %16, -8
  br label %981

981:                                              ; preds = %981, %979
  %982 = phi i32 [ 0, %979 ], [ %1047, %981 ]
  %983 = phi i32 [ 0, %979 ], [ %1048, %981 ]
  %984 = add i32 %982, %18
  %985 = mul i32 %984, 6
  %986 = add i32 %985, 5
  %987 = sext i32 %986 to i64
  %988 = getelementptr inbounds float, float addrspace(1)* %0, i64 %987
  %989 = load float, float addrspace(1)* %988, align 4, !tbaa !11
  %990 = fmul contract float %974, %989
  store float %990, float addrspace(1)* %988, align 4, !tbaa !11
  %991 = or i32 %982, 1
  %992 = add i32 %991, %18
  %993 = mul i32 %992, 6
  %994 = add i32 %993, 5
  %995 = sext i32 %994 to i64
  %996 = getelementptr inbounds float, float addrspace(1)* %0, i64 %995
  %997 = load float, float addrspace(1)* %996, align 4, !tbaa !11
  %998 = fmul contract float %974, %997
  store float %998, float addrspace(1)* %996, align 4, !tbaa !11
  %999 = or i32 %982, 2
  %1000 = add i32 %999, %18
  %1001 = mul i32 %1000, 6
  %1002 = add i32 %1001, 5
  %1003 = sext i32 %1002 to i64
  %1004 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1003
  %1005 = load float, float addrspace(1)* %1004, align 4, !tbaa !11
  %1006 = fmul contract float %974, %1005
  store float %1006, float addrspace(1)* %1004, align 4, !tbaa !11
  %1007 = or i32 %982, 3
  %1008 = add i32 %1007, %18
  %1009 = mul i32 %1008, 6
  %1010 = add i32 %1009, 5
  %1011 = sext i32 %1010 to i64
  %1012 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1011
  %1013 = load float, float addrspace(1)* %1012, align 4, !tbaa !11
  %1014 = fmul contract float %974, %1013
  store float %1014, float addrspace(1)* %1012, align 4, !tbaa !11
  %1015 = or i32 %982, 4
  %1016 = add i32 %1015, %18
  %1017 = mul i32 %1016, 6
  %1018 = add i32 %1017, 5
  %1019 = sext i32 %1018 to i64
  %1020 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1019
  %1021 = load float, float addrspace(1)* %1020, align 4, !tbaa !11
  %1022 = fmul contract float %974, %1021
  store float %1022, float addrspace(1)* %1020, align 4, !tbaa !11
  %1023 = or i32 %982, 5
  %1024 = add i32 %1023, %18
  %1025 = mul i32 %1024, 6
  %1026 = add i32 %1025, 5
  %1027 = sext i32 %1026 to i64
  %1028 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1027
  %1029 = load float, float addrspace(1)* %1028, align 4, !tbaa !11
  %1030 = fmul contract float %974, %1029
  store float %1030, float addrspace(1)* %1028, align 4, !tbaa !11
  %1031 = or i32 %982, 6
  %1032 = add i32 %1031, %18
  %1033 = mul i32 %1032, 6
  %1034 = add i32 %1033, 5
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1035
  %1037 = load float, float addrspace(1)* %1036, align 4, !tbaa !11
  %1038 = fmul contract float %974, %1037
  store float %1038, float addrspace(1)* %1036, align 4, !tbaa !11
  %1039 = or i32 %982, 7
  %1040 = add i32 %1039, %18
  %1041 = mul i32 %1040, 6
  %1042 = add i32 %1041, 5
  %1043 = sext i32 %1042 to i64
  %1044 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1043
  %1045 = load float, float addrspace(1)* %1044, align 4, !tbaa !11
  %1046 = fmul contract float %974, %1045
  store float %1046, float addrspace(1)* %1044, align 4, !tbaa !11
  %1047 = add nuw nsw i32 %982, 8
  %1048 = add i32 %983, 8
  %1049 = icmp eq i32 %1048, %980
  br i1 %1049, label %1050, label %981, !llvm.loop !27

1050:                                             ; preds = %981, %975
  %1051 = phi i32 [ 0, %975 ], [ %1047, %981 ]
  %1052 = icmp eq i32 %977, 0
  br i1 %1052, label %1066, label %1053

1053:                                             ; preds = %1050, %1053
  %1054 = phi i32 [ %1063, %1053 ], [ %1051, %1050 ]
  %1055 = phi i32 [ %1064, %1053 ], [ 0, %1050 ]
  %1056 = add i32 %1054, %18
  %1057 = mul i32 %1056, 6
  %1058 = add i32 %1057, 5
  %1059 = sext i32 %1058 to i64
  %1060 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1059
  %1061 = load float, float addrspace(1)* %1060, align 4, !tbaa !11
  %1062 = fmul contract float %974, %1061
  store float %1062, float addrspace(1)* %1060, align 4, !tbaa !11
  %1063 = add nuw nsw i32 %1054, 1
  %1064 = add i32 %1055, 1
  %1065 = icmp eq i32 %1064, %977
  br i1 %1065, label %1066, label %1053, !llvm.loop !28

1066:                                             ; preds = %1050, %1053, %951
  ret void

1067:                                             ; preds = %1067, %299
  %1068 = phi i32 [ 0, %299 ], [ %1133, %1067 ]
  %1069 = phi i32 [ 0, %299 ], [ %1134, %1067 ]
  %1070 = add i32 %1068, %18
  %1071 = mul i32 %1070, 6
  %1072 = add i32 %1071, 4
  %1073 = sext i32 %1072 to i64
  %1074 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1073
  %1075 = load float, float addrspace(1)* %1074, align 4, !tbaa !11
  %1076 = fmul contract float %294, %1075
  store float %1076, float addrspace(1)* %1074, align 4, !tbaa !11
  %1077 = or i32 %1068, 1
  %1078 = add i32 %1077, %18
  %1079 = mul i32 %1078, 6
  %1080 = add i32 %1079, 4
  %1081 = sext i32 %1080 to i64
  %1082 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1081
  %1083 = load float, float addrspace(1)* %1082, align 4, !tbaa !11
  %1084 = fmul contract float %294, %1083
  store float %1084, float addrspace(1)* %1082, align 4, !tbaa !11
  %1085 = or i32 %1068, 2
  %1086 = add i32 %1085, %18
  %1087 = mul i32 %1086, 6
  %1088 = add i32 %1087, 4
  %1089 = sext i32 %1088 to i64
  %1090 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1089
  %1091 = load float, float addrspace(1)* %1090, align 4, !tbaa !11
  %1092 = fmul contract float %294, %1091
  store float %1092, float addrspace(1)* %1090, align 4, !tbaa !11
  %1093 = or i32 %1068, 3
  %1094 = add i32 %1093, %18
  %1095 = mul i32 %1094, 6
  %1096 = add i32 %1095, 4
  %1097 = sext i32 %1096 to i64
  %1098 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1097
  %1099 = load float, float addrspace(1)* %1098, align 4, !tbaa !11
  %1100 = fmul contract float %294, %1099
  store float %1100, float addrspace(1)* %1098, align 4, !tbaa !11
  %1101 = or i32 %1068, 4
  %1102 = add i32 %1101, %18
  %1103 = mul i32 %1102, 6
  %1104 = add i32 %1103, 4
  %1105 = sext i32 %1104 to i64
  %1106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1105
  %1107 = load float, float addrspace(1)* %1106, align 4, !tbaa !11
  %1108 = fmul contract float %294, %1107
  store float %1108, float addrspace(1)* %1106, align 4, !tbaa !11
  %1109 = or i32 %1068, 5
  %1110 = add i32 %1109, %18
  %1111 = mul i32 %1110, 6
  %1112 = add i32 %1111, 4
  %1113 = sext i32 %1112 to i64
  %1114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1113
  %1115 = load float, float addrspace(1)* %1114, align 4, !tbaa !11
  %1116 = fmul contract float %294, %1115
  store float %1116, float addrspace(1)* %1114, align 4, !tbaa !11
  %1117 = or i32 %1068, 6
  %1118 = add i32 %1117, %18
  %1119 = mul i32 %1118, 6
  %1120 = add i32 %1119, 4
  %1121 = sext i32 %1120 to i64
  %1122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1121
  %1123 = load float, float addrspace(1)* %1122, align 4, !tbaa !11
  %1124 = fmul contract float %294, %1123
  store float %1124, float addrspace(1)* %1122, align 4, !tbaa !11
  %1125 = or i32 %1068, 7
  %1126 = add i32 %1125, %18
  %1127 = mul i32 %1126, 6
  %1128 = add i32 %1127, 4
  %1129 = sext i32 %1128 to i64
  %1130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1129
  %1131 = load float, float addrspace(1)* %1130, align 4, !tbaa !11
  %1132 = fmul contract float %294, %1131
  store float %1132, float addrspace(1)* %1130, align 4, !tbaa !11
  %1133 = add nuw nsw i32 %1068, 8
  %1134 = add i32 %1069, 8
  %1135 = icmp eq i32 %1134, %300
  br i1 %1135, label %379, label %1067, !llvm.loop !27
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !16}
!28 = distinct !{!28, !14}
