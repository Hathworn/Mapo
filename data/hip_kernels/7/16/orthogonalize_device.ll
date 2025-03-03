; ModuleID = '../data/hip_kernels/7/16/main.cu'
source_filename = "../data/hip_kernels/7/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13orthogonalizePfS_iPiS0_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %16
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = sdiv i32 %20, 3
  %22 = icmp slt i32 %18, 1
  %23 = icmp eq i32 %18, 6
  %24 = or i1 %22, %23
  br i1 %24, label %51, label %25

25:                                               ; preds = %6
  %26 = mul i32 %15, %5
  %27 = add i32 %18, -1
  %28 = and i32 %18, 3
  %29 = icmp ult i32 %27, 3
  %30 = and i32 %18, -4
  %31 = icmp eq i32 %28, 0
  %32 = and i32 %18, 3
  %33 = icmp ult i32 %27, 3
  %34 = and i32 %18, -4
  %35 = icmp eq i32 %32, 0
  %36 = and i32 %18, 3
  %37 = icmp ult i32 %27, 3
  %38 = and i32 %18, -4
  %39 = icmp eq i32 %36, 0
  %40 = and i32 %18, 7
  %41 = icmp ult i32 %27, 7
  %42 = and i32 %18, -8
  %43 = icmp eq i32 %40, 0
  %44 = and i32 %18, 1
  %45 = icmp eq i32 %27, 0
  %46 = and i32 %18, -2
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %25, %502
  %49 = phi i32 [ 0, %25 ], [ %504, %502 ]
  %50 = phi i32 [ 6, %25 ], [ %503, %502 ]
  br i1 %29, label %61, label %83

51:                                               ; preds = %502, %6
  %52 = phi i32 [ 6, %6 ], [ %503, %502 ]
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %512

54:                                               ; preds = %51
  %55 = icmp sgt i32 %18, 0
  %56 = mul i32 %15, %5
  %57 = and i32 %18, 3
  %58 = icmp ult i32 %18, 4
  %59 = and i32 %18, -4
  %60 = icmp eq i32 %57, 0
  br label %508

61:                                               ; preds = %83, %48
  %62 = phi i32 [ 0, %48 ], [ %133, %83 ]
  br i1 %31, label %80, label %63

63:                                               ; preds = %61, %63
  %64 = phi i32 [ %77, %63 ], [ %62, %61 ]
  %65 = phi i32 [ %78, %63 ], [ 0, %61 ]
  %66 = add nsw i32 %64, %20
  %67 = mul nsw i32 %66, %5
  %68 = add nsw i32 %67, %49
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11
  %72 = add i32 %64, %26
  %73 = mul i32 %72, 6
  %74 = add i32 %73, %50
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  store float %71, float addrspace(1)* %76, align 4, !tbaa !11
  %77 = add nuw nsw i32 %64, 1
  %78 = add i32 %65, 1
  %79 = icmp eq i32 %78, %28
  br i1 %79, label %80, label %63, !llvm.loop !13

80:                                               ; preds = %63, %61
  %81 = icmp sgt i32 %50, 0
  br i1 %81, label %136, label %82

82:                                               ; preds = %259, %80
  br i1 %41, label %331, label %354

83:                                               ; preds = %48, %83
  %84 = phi i32 [ %133, %83 ], [ 0, %48 ]
  %85 = phi i32 [ %134, %83 ], [ 0, %48 ]
  %86 = add nsw i32 %84, %20
  %87 = mul nsw i32 %86, %5
  %88 = add nsw i32 %87, %49
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11
  %92 = add i32 %84, %26
  %93 = mul i32 %92, 6
  %94 = add i32 %93, %50
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  store float %91, float addrspace(1)* %96, align 4, !tbaa !11
  %97 = or i32 %84, 1
  %98 = add nsw i32 %97, %20
  %99 = mul nsw i32 %98, %5
  %100 = add nsw i32 %99, %49
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !11
  %104 = add i32 %97, %26
  %105 = mul i32 %104, 6
  %106 = add i32 %105, %50
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %103, float addrspace(1)* %108, align 4, !tbaa !11
  %109 = or i32 %84, 2
  %110 = add nsw i32 %109, %20
  %111 = mul nsw i32 %110, %5
  %112 = add nsw i32 %111, %49
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11
  %116 = add i32 %109, %26
  %117 = mul i32 %116, 6
  %118 = add i32 %117, %50
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  store float %115, float addrspace(1)* %120, align 4, !tbaa !11
  %121 = or i32 %84, 3
  %122 = add nsw i32 %121, %20
  %123 = mul nsw i32 %122, %5
  %124 = add nsw i32 %123, %49
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !11
  %128 = add i32 %121, %26
  %129 = mul i32 %128, 6
  %130 = add i32 %129, %50
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  store float %127, float addrspace(1)* %132, align 4, !tbaa !11
  %133 = add nuw nsw i32 %84, 4
  %134 = add i32 %85, 4
  %135 = icmp eq i32 %134, %30
  br i1 %135, label %61, label %83, !llvm.loop !15

136:                                              ; preds = %80, %259
  %137 = phi i32 [ %260, %259 ], [ 0, %80 ]
  br i1 %33, label %208, label %138

138:                                              ; preds = %136, %138
  %139 = phi i32 [ %205, %138 ], [ 0, %136 ]
  %140 = phi double [ %204, %138 ], [ 0.000000e+00, %136 ]
  %141 = phi i32 [ %206, %138 ], [ 0, %136 ]
  %142 = add i32 %139, %26
  %143 = mul i32 %142, 6
  %144 = add i32 %143, %137
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !11
  %148 = add nsw i32 %139, %20
  %149 = mul nsw i32 %148, %5
  %150 = add nsw i32 %149, %49
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11
  %154 = fmul contract float %147, %153
  %155 = fpext float %154 to double
  %156 = fadd contract double %140, %155
  %157 = or i32 %139, 1
  %158 = add i32 %157, %26
  %159 = mul i32 %158, 6
  %160 = add i32 %159, %137
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !11
  %164 = add nsw i32 %157, %20
  %165 = mul nsw i32 %164, %5
  %166 = add nsw i32 %165, %49
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !11
  %170 = fmul contract float %163, %169
  %171 = fpext float %170 to double
  %172 = fadd contract double %156, %171
  %173 = or i32 %139, 2
  %174 = add i32 %173, %26
  %175 = mul i32 %174, 6
  %176 = add i32 %175, %137
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !11
  %180 = add nsw i32 %173, %20
  %181 = mul nsw i32 %180, %5
  %182 = add nsw i32 %181, %49
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !11
  %186 = fmul contract float %179, %185
  %187 = fpext float %186 to double
  %188 = fadd contract double %172, %187
  %189 = or i32 %139, 3
  %190 = add i32 %189, %26
  %191 = mul i32 %190, 6
  %192 = add i32 %191, %137
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %1, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !11
  %196 = add nsw i32 %189, %20
  %197 = mul nsw i32 %196, %5
  %198 = add nsw i32 %197, %49
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !11
  %202 = fmul contract float %195, %201
  %203 = fpext float %202 to double
  %204 = fadd contract double %188, %203
  %205 = add nuw nsw i32 %139, 4
  %206 = add i32 %141, 4
  %207 = icmp eq i32 %206, %34
  br i1 %207, label %208, label %138, !llvm.loop !17

208:                                              ; preds = %138, %136
  %209 = phi double [ undef, %136 ], [ %204, %138 ]
  %210 = phi i32 [ 0, %136 ], [ %205, %138 ]
  %211 = phi double [ 0.000000e+00, %136 ], [ %204, %138 ]
  br i1 %35, label %234, label %212

212:                                              ; preds = %208, %212
  %213 = phi i32 [ %231, %212 ], [ %210, %208 ]
  %214 = phi double [ %230, %212 ], [ %211, %208 ]
  %215 = phi i32 [ %232, %212 ], [ 0, %208 ]
  %216 = add i32 %213, %26
  %217 = mul i32 %216, 6
  %218 = add i32 %217, %137
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !11
  %222 = add nsw i32 %213, %20
  %223 = mul nsw i32 %222, %5
  %224 = add nsw i32 %223, %49
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %0, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !11
  %228 = fmul contract float %221, %227
  %229 = fpext float %228 to double
  %230 = fadd contract double %214, %229
  %231 = add nuw nsw i32 %213, 1
  %232 = add i32 %215, 1
  %233 = icmp eq i32 %232, %32
  br i1 %233, label %234, label %212, !llvm.loop !18

234:                                              ; preds = %212, %208
  %235 = phi double [ %209, %208 ], [ %230, %212 ]
  br i1 %37, label %236, label %262

236:                                              ; preds = %262, %234
  %237 = phi i32 [ 0, %234 ], [ %328, %262 ]
  br i1 %39, label %259, label %238

238:                                              ; preds = %236, %238
  %239 = phi i32 [ %256, %238 ], [ %237, %236 ]
  %240 = phi i32 [ %257, %238 ], [ 0, %236 ]
  %241 = add i32 %239, %26
  %242 = mul i32 %241, 6
  %243 = add nsw i32 %242, %50
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %1, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !11
  %247 = fpext float %246 to double
  %248 = add nsw i32 %242, %137
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %1, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !11
  %252 = fpext float %251 to double
  %253 = fmul contract double %235, %252
  %254 = fsub contract double %247, %253
  %255 = fptrunc double %254 to float
  store float %255, float addrspace(1)* %245, align 4, !tbaa !11
  %256 = add nuw nsw i32 %239, 1
  %257 = add i32 %240, 1
  %258 = icmp eq i32 %257, %36
  br i1 %258, label %259, label %238, !llvm.loop !19

259:                                              ; preds = %238, %236
  %260 = add nuw nsw i32 %137, 1
  %261 = icmp eq i32 %260, %50
  br i1 %261, label %82, label %136, !llvm.loop !20

262:                                              ; preds = %234, %262
  %263 = phi i32 [ %328, %262 ], [ 0, %234 ]
  %264 = phi i32 [ %329, %262 ], [ 0, %234 ]
  %265 = add i32 %263, %26
  %266 = mul i32 %265, 6
  %267 = add nsw i32 %266, %50
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %1, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !11
  %271 = fpext float %270 to double
  %272 = add nsw i32 %266, %137
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %1, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !11
  %276 = fpext float %275 to double
  %277 = fmul contract double %235, %276
  %278 = fsub contract double %271, %277
  %279 = fptrunc double %278 to float
  store float %279, float addrspace(1)* %269, align 4, !tbaa !11
  %280 = or i32 %263, 1
  %281 = add i32 %280, %26
  %282 = mul i32 %281, 6
  %283 = add nsw i32 %282, %50
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %1, i64 %284
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !11
  %287 = fpext float %286 to double
  %288 = add nsw i32 %282, %137
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !11
  %292 = fpext float %291 to double
  %293 = fmul contract double %235, %292
  %294 = fsub contract double %287, %293
  %295 = fptrunc double %294 to float
  store float %295, float addrspace(1)* %285, align 4, !tbaa !11
  %296 = or i32 %263, 2
  %297 = add i32 %296, %26
  %298 = mul i32 %297, 6
  %299 = add nsw i32 %298, %50
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %1, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !11
  %303 = fpext float %302 to double
  %304 = add nsw i32 %298, %137
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %1, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !11
  %308 = fpext float %307 to double
  %309 = fmul contract double %235, %308
  %310 = fsub contract double %303, %309
  %311 = fptrunc double %310 to float
  store float %311, float addrspace(1)* %301, align 4, !tbaa !11
  %312 = or i32 %263, 3
  %313 = add i32 %312, %26
  %314 = mul i32 %313, 6
  %315 = add nsw i32 %314, %50
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %1, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !11
  %319 = fpext float %318 to double
  %320 = add nsw i32 %314, %137
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %1, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !11
  %324 = fpext float %323 to double
  %325 = fmul contract double %235, %324
  %326 = fsub contract double %319, %325
  %327 = fptrunc double %326 to float
  store float %327, float addrspace(1)* %317, align 4, !tbaa !11
  %328 = add nuw nsw i32 %263, 4
  %329 = add i32 %264, 4
  %330 = icmp eq i32 %329, %38
  br i1 %330, label %236, label %262, !llvm.loop !21

331:                                              ; preds = %354, %82
  %332 = phi double [ undef, %82 ], [ %436, %354 ]
  %333 = phi i32 [ 0, %82 ], [ %437, %354 ]
  %334 = phi double [ 0.000000e+00, %82 ], [ %436, %354 ]
  br i1 %43, label %351, label %335

335:                                              ; preds = %331, %335
  %336 = phi i32 [ %348, %335 ], [ %333, %331 ]
  %337 = phi double [ %347, %335 ], [ %334, %331 ]
  %338 = phi i32 [ %349, %335 ], [ 0, %331 ]
  %339 = add i32 %336, %26
  %340 = mul i32 %339, 6
  %341 = add i32 %340, %50
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %1, i64 %342
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !11
  %345 = fmul contract float %344, %344
  %346 = fpext float %345 to double
  %347 = fadd contract double %337, %346
  %348 = add nuw nsw i32 %336, 1
  %349 = add i32 %338, 1
  %350 = icmp eq i32 %349, %40
  br i1 %350, label %351, label %335, !llvm.loop !22

351:                                              ; preds = %335, %331
  %352 = phi double [ %332, %331 ], [ %347, %335 ]
  %353 = fcmp contract olt double %352, 5.000000e-02
  br i1 %353, label %502, label %440

354:                                              ; preds = %82, %354
  %355 = phi i32 [ %437, %354 ], [ 0, %82 ]
  %356 = phi double [ %436, %354 ], [ 0.000000e+00, %82 ]
  %357 = phi i32 [ %438, %354 ], [ 0, %82 ]
  %358 = add i32 %355, %26
  %359 = mul i32 %358, 6
  %360 = add i32 %359, %50
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %1, i64 %361
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !11
  %364 = fmul contract float %363, %363
  %365 = fpext float %364 to double
  %366 = fadd contract double %356, %365
  %367 = or i32 %355, 1
  %368 = add i32 %367, %26
  %369 = mul i32 %368, 6
  %370 = add i32 %369, %50
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %1, i64 %371
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !11
  %374 = fmul contract float %373, %373
  %375 = fpext float %374 to double
  %376 = fadd contract double %366, %375
  %377 = or i32 %355, 2
  %378 = add i32 %377, %26
  %379 = mul i32 %378, 6
  %380 = add i32 %379, %50
  %381 = sext i32 %380 to i64
  %382 = getelementptr inbounds float, float addrspace(1)* %1, i64 %381
  %383 = load float, float addrspace(1)* %382, align 4, !tbaa !11
  %384 = fmul contract float %383, %383
  %385 = fpext float %384 to double
  %386 = fadd contract double %376, %385
  %387 = or i32 %355, 3
  %388 = add i32 %387, %26
  %389 = mul i32 %388, 6
  %390 = add i32 %389, %50
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %1, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !11
  %394 = fmul contract float %393, %393
  %395 = fpext float %394 to double
  %396 = fadd contract double %386, %395
  %397 = or i32 %355, 4
  %398 = add i32 %397, %26
  %399 = mul i32 %398, 6
  %400 = add i32 %399, %50
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %1, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !11
  %404 = fmul contract float %403, %403
  %405 = fpext float %404 to double
  %406 = fadd contract double %396, %405
  %407 = or i32 %355, 5
  %408 = add i32 %407, %26
  %409 = mul i32 %408, 6
  %410 = add i32 %409, %50
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds float, float addrspace(1)* %1, i64 %411
  %413 = load float, float addrspace(1)* %412, align 4, !tbaa !11
  %414 = fmul contract float %413, %413
  %415 = fpext float %414 to double
  %416 = fadd contract double %406, %415
  %417 = or i32 %355, 6
  %418 = add i32 %417, %26
  %419 = mul i32 %418, 6
  %420 = add i32 %419, %50
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %1, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !11
  %424 = fmul contract float %423, %423
  %425 = fpext float %424 to double
  %426 = fadd contract double %416, %425
  %427 = or i32 %355, 7
  %428 = add i32 %427, %26
  %429 = mul i32 %428, 6
  %430 = add i32 %429, %50
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %1, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !11
  %434 = fmul contract float %433, %433
  %435 = fpext float %434 to double
  %436 = fadd contract double %426, %435
  %437 = add nuw nsw i32 %355, 8
  %438 = add i32 %357, 8
  %439 = icmp eq i32 %438, %42
  br i1 %439, label %331, label %354, !llvm.loop !23

440:                                              ; preds = %351
  %441 = fcmp olt double %352, 0x1000000000000000
  %442 = select i1 %441, double 0x4FF0000000000000, double 1.000000e+00
  %443 = fmul double %352, %442
  %444 = tail call double @llvm.amdgcn.rsq.f64(double %443)
  %445 = fmul double %443, %444
  %446 = fmul double %444, 5.000000e-01
  %447 = fneg double %446
  %448 = tail call double @llvm.fma.f64(double %447, double %445, double 5.000000e-01)
  %449 = tail call double @llvm.fma.f64(double %446, double %448, double %446)
  %450 = tail call double @llvm.fma.f64(double %445, double %448, double %445)
  %451 = fneg double %450
  %452 = tail call double @llvm.fma.f64(double %451, double %450, double %443)
  %453 = tail call double @llvm.fma.f64(double %452, double %449, double %450)
  %454 = fneg double %453
  %455 = tail call double @llvm.fma.f64(double %454, double %453, double %443)
  %456 = tail call double @llvm.fma.f64(double %455, double %449, double %453)
  %457 = select i1 %441, double 0x37F0000000000000, double 1.000000e+00
  %458 = fmul double %457, %456
  %459 = fcmp oeq double %443, 0.000000e+00
  %460 = fcmp oeq double %443, 0x7FF0000000000000
  %461 = or i1 %459, %460
  %462 = select i1 %461, double %443, double %458
  br i1 %45, label %463, label %477

463:                                              ; preds = %477, %440
  %464 = phi i32 [ 0, %440 ], [ %499, %477 ]
  br i1 %47, label %475, label %465

465:                                              ; preds = %463
  %466 = add i32 %464, %26
  %467 = mul i32 %466, 6
  %468 = add i32 %467, %50
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds float, float addrspace(1)* %1, i64 %469
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !11
  %472 = fpext float %471 to double
  %473 = fdiv contract double %472, %462
  %474 = fptrunc double %473 to float
  store float %474, float addrspace(1)* %470, align 4, !tbaa !11
  br label %475

475:                                              ; preds = %463, %465
  %476 = add nsw i32 %50, 1
  br label %502

477:                                              ; preds = %440, %477
  %478 = phi i32 [ %499, %477 ], [ 0, %440 ]
  %479 = phi i32 [ %500, %477 ], [ 0, %440 ]
  %480 = add i32 %478, %26
  %481 = mul i32 %480, 6
  %482 = add i32 %481, %50
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds float, float addrspace(1)* %1, i64 %483
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !11
  %486 = fpext float %485 to double
  %487 = fdiv contract double %486, %462
  %488 = fptrunc double %487 to float
  store float %488, float addrspace(1)* %484, align 4, !tbaa !11
  %489 = or i32 %478, 1
  %490 = add i32 %489, %26
  %491 = mul i32 %490, 6
  %492 = add i32 %491, %50
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds float, float addrspace(1)* %1, i64 %493
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !11
  %496 = fpext float %495 to double
  %497 = fdiv contract double %496, %462
  %498 = fptrunc double %497 to float
  store float %498, float addrspace(1)* %494, align 4, !tbaa !11
  %499 = add nuw nsw i32 %478, 2
  %500 = add i32 %479, 2
  %501 = icmp eq i32 %500, %46
  br i1 %501, label %463, label %477, !llvm.loop !24

502:                                              ; preds = %351, %475
  %503 = phi i32 [ %476, %475 ], [ %50, %351 ]
  %504 = add nuw nsw i32 %49, 1
  %505 = icmp sge i32 %504, %18
  %506 = icmp eq i32 %503, %18
  %507 = select i1 %505, i1 true, i1 %506
  br i1 %507, label %51, label %48, !llvm.loop !25

508:                                              ; preds = %54, %532
  %509 = phi i32 [ 0, %54 ], [ %533, %532 ]
  br i1 %55, label %510, label %532

510:                                              ; preds = %508
  %511 = add nsw i32 %509, %21
  br i1 %58, label %513, label %535

512:                                              ; preds = %532, %51
  ret void

513:                                              ; preds = %535, %510
  %514 = phi i32 [ 0, %510 ], [ %585, %535 ]
  br i1 %60, label %532, label %515

515:                                              ; preds = %513, %515
  %516 = phi i32 [ %529, %515 ], [ %514, %513 ]
  %517 = phi i32 [ %530, %515 ], [ 0, %513 ]
  %518 = add i32 %516, %56
  %519 = mul i32 %518, 6
  %520 = add i32 %519, %509
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds float, float addrspace(1)* %1, i64 %521
  %523 = load float, float addrspace(1)* %522, align 4, !tbaa !11
  %524 = add nsw i32 %516, %21
  %525 = mul nsw i32 %524, %5
  %526 = add nsw i32 %511, %525
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %0, i64 %527
  store float %523, float addrspace(1)* %528, align 4, !tbaa !11
  %529 = add nuw nsw i32 %516, 1
  %530 = add i32 %517, 1
  %531 = icmp eq i32 %530, %57
  br i1 %531, label %532, label %515, !llvm.loop !26

532:                                              ; preds = %513, %515, %508
  %533 = add nuw nsw i32 %509, 1
  %534 = icmp eq i32 %533, %52
  br i1 %534, label %512, label %508, !llvm.loop !27

535:                                              ; preds = %510, %535
  %536 = phi i32 [ %585, %535 ], [ 0, %510 ]
  %537 = phi i32 [ %586, %535 ], [ 0, %510 ]
  %538 = add i32 %536, %56
  %539 = mul i32 %538, 6
  %540 = add i32 %539, %509
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds float, float addrspace(1)* %1, i64 %541
  %543 = load float, float addrspace(1)* %542, align 4, !tbaa !11
  %544 = add nsw i32 %536, %21
  %545 = mul nsw i32 %544, %5
  %546 = add nsw i32 %511, %545
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds float, float addrspace(1)* %0, i64 %547
  store float %543, float addrspace(1)* %548, align 4, !tbaa !11
  %549 = or i32 %536, 1
  %550 = add i32 %549, %56
  %551 = mul i32 %550, 6
  %552 = add i32 %551, %509
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %1, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !11
  %556 = add nsw i32 %549, %21
  %557 = mul nsw i32 %556, %5
  %558 = add nsw i32 %511, %557
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %0, i64 %559
  store float %555, float addrspace(1)* %560, align 4, !tbaa !11
  %561 = or i32 %536, 2
  %562 = add i32 %561, %56
  %563 = mul i32 %562, 6
  %564 = add i32 %563, %509
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %1, i64 %565
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !11
  %568 = add nsw i32 %561, %21
  %569 = mul nsw i32 %568, %5
  %570 = add nsw i32 %511, %569
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds float, float addrspace(1)* %0, i64 %571
  store float %567, float addrspace(1)* %572, align 4, !tbaa !11
  %573 = or i32 %536, 3
  %574 = add i32 %573, %56
  %575 = mul i32 %574, 6
  %576 = add i32 %575, %509
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %1, i64 %577
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !11
  %580 = add nsw i32 %573, %21
  %581 = mul nsw i32 %580, %5
  %582 = add nsw i32 %511, %581
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %0, i64 %583
  store float %579, float addrspace(1)* %584, align 4, !tbaa !11
  %585 = add nuw nsw i32 %536, 4
  %586 = add i32 %537, 4
  %587 = icmp eq i32 %586, %59
  br i1 %587, label %513, label %535, !llvm.loop !28
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !16}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !16}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !16}
!28 = distinct !{!28, !16}
