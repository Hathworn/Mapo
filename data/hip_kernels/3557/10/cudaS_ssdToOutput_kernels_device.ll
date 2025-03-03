; ModuleID = '../data/hip_kernels/3557/10/main.cu'
source_filename = "../data/hip_kernels/3557/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25cudaS_ssdToOutput_kernelsjjjjjjPjjjjjjjjjjffffPKfS1_S1_S1_S1_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, float %16, float %17, float %18, float %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22, float addrspace(1)* nocapture readonly %23, float addrspace(1)* nocapture readonly %24, float addrspace(1)* nocapture writeonly %25) local_unnamed_addr #0 {
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %29 = and i32 %28, 31
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %31 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %32 = getelementptr i8, i8 addrspace(4)* %31, i64 4
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 4, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = mul i32 %30, %35
  %37 = add i32 %36, %29
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %39 = icmp ult i32 %37, %5
  br i1 %39, label %40, label %369

40:                                               ; preds = %26
  %41 = sext i32 %27 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = mul i32 %7, %5
  %45 = mul i32 %27, %5
  %46 = mul i32 %45, %1
  %47 = add i32 %44, %46
  %48 = add i32 %47, %37
  %49 = icmp slt i32 %37, %43
  br i1 %49, label %50, label %319

50:                                               ; preds = %40
  %51 = icmp eq i32 %38, 0
  br i1 %51, label %52, label %97

52:                                               ; preds = %50
  %53 = add i32 %37, %45
  %54 = mul i32 %53, 5
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %20, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11, !amdgpu.noclobber !6
  %58 = shl i32 %10, 1
  %59 = add i32 %58, 6
  %60 = mul i32 %11, 3
  %61 = add i32 %59, %60
  %62 = mul i32 %48, %61
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %25, i64 %63
  store float %57, float addrspace(1)* %64, align 4, !tbaa !11
  %65 = add i32 %54, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %20, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !11
  %69 = add i32 %62, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %25, i64 %70
  store float %68, float addrspace(1)* %71, align 4, !tbaa !11
  %72 = add i32 %54, 2
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %20, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11
  %76 = add i32 %62, 2
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %25, i64 %77
  store float %75, float addrspace(1)* %78, align 4, !tbaa !11
  %79 = add i32 %54, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %20, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = add i32 %62, 3
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %25, i64 %84
  store float %82, float addrspace(1)* %85, align 4, !tbaa !11
  %86 = add i32 %54, 4
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %20, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11
  %90 = add i32 %62, 4
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %25, i64 %91
  store float %89, float addrspace(1)* %92, align 4, !tbaa !11
  %93 = uitofp i32 %7 to float
  %94 = add i32 %62, 5
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %25, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !11
  br label %97

97:                                               ; preds = %52, %50
  %98 = icmp ult i32 %38, %14
  br i1 %98, label %99, label %190

99:                                               ; preds = %97
  %100 = add i32 %37, %45
  %101 = mul i32 %100, 5
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %21, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !11
  %105 = fptoui float %104 to i32
  %106 = add i32 %101, 1
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %21, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11
  %110 = fptoui float %109 to i32
  %111 = add i32 %101, 2
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %21, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !11
  %115 = fptoui float %114 to i32
  %116 = mul i32 %110, %3
  %117 = add i32 %116, %105
  %118 = shl i32 %14, 1
  %119 = mul i32 %118, %115
  %120 = shl nsw i32 %38, 1
  %121 = add i32 %120, %12
  %122 = add i32 %121, %119
  %123 = mul i32 %4, %3
  %124 = mul i32 %123, %122
  %125 = shl i32 %123, 1
  %126 = mul i32 %125, %27
  %127 = mul i32 %126, %2
  %128 = mul i32 %127, %8
  %129 = add i32 %117, %128
  %130 = add i32 %129, %124
  %131 = add i32 %122, 1
  %132 = mul i32 %123, %131
  %133 = add i32 %129, %132
  %134 = sext i32 %130 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %23, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !11
  %137 = sext i32 %133 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %23, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !11
  %140 = mul i32 %7, %2
  %141 = add i32 %140, %115
  %142 = shl i32 %141, 2
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %22, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11
  %146 = uitofp i32 %105 to float
  %147 = fmul contract float %146, %16
  %148 = fadd contract float %147, %145
  %149 = fptosi float %148 to i32
  %150 = add nuw nsw i32 %142, 1
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %22, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11
  %154 = uitofp i32 %110 to float
  %155 = fmul contract float %154, %17
  %156 = fadd contract float %155, %153
  %157 = fptosi float %156 to i32
  %158 = add nuw nsw i32 %142, 2
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %22, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !11
  %162 = fadd contract float %147, %161
  %163 = fptosi float %162 to i32
  %164 = add nuw nsw i32 %142, 3
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %22, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !11
  %168 = fadd contract float %155, %167
  %169 = fptosi float %168 to i32
  %170 = sub nsw i32 %163, %149
  %171 = sub nsw i32 %169, %157
  %172 = sitofp i32 %149 to double
  %173 = sitofp i32 %170 to double
  %174 = fmul contract double %173, 5.000000e-01
  %175 = fadd contract double %174, %172
  %176 = fptrunc double %175 to float
  %177 = sitofp i32 %157 to double
  %178 = sitofp i32 %171 to double
  %179 = fmul contract double %178, 5.000000e-01
  %180 = fadd contract double %179, %177
  %181 = fptrunc double %180 to float
  %182 = sitofp i32 %171 to float
  %183 = fmul contract float %136, %182
  %184 = fadd contract float %183, %181
  %185 = fmul contract float %184, %19
  %186 = sitofp i32 %170 to float
  %187 = fmul contract float %139, %186
  %188 = fadd contract float %187, %176
  %189 = fmul contract float %188, %18
  br label %194

190:                                              ; preds = %97
  %191 = icmp ult i32 %38, %10
  br i1 %191, label %192, label %210

192:                                              ; preds = %190
  %193 = shl nsw i32 %38, 1
  br label %194

194:                                              ; preds = %99, %192
  %195 = phi i32 [ %120, %99 ], [ %193, %192 ]
  %196 = phi float [ %185, %99 ], [ 0.000000e+00, %192 ]
  %197 = phi float [ %189, %99 ], [ 0.000000e+00, %192 ]
  %198 = shl i32 %10, 1
  %199 = add i32 %198, 6
  %200 = mul i32 %11, 3
  %201 = add i32 %199, %200
  %202 = mul i32 %48, %201
  %203 = add i32 %202, %195
  %204 = add i32 %203, 6
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %25, i64 %205
  store float %196, float addrspace(1)* %206, align 4, !tbaa !11
  %207 = add i32 %203, 7
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %25, i64 %208
  store float %197, float addrspace(1)* %209, align 4, !tbaa !11
  br label %210

210:                                              ; preds = %194, %190
  %211 = icmp ult i32 %38, %15
  br i1 %211, label %212, label %308

212:                                              ; preds = %210
  %213 = add i32 %37, %45
  %214 = mul i32 %213, 5
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %21, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !11
  %218 = fptoui float %217 to i32
  %219 = add i32 %214, 1
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %21, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !11
  %223 = fptoui float %222 to i32
  %224 = add i32 %214, 2
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %21, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !11
  %228 = fptoui float %227 to i32
  %229 = mul i32 %223, %3
  %230 = add i32 %229, %218
  %231 = mul i32 %15, 3
  %232 = mul i32 %231, %228
  %233 = mul nsw i32 %38, 3
  %234 = add i32 %233, %13
  %235 = add i32 %234, %232
  %236 = mul i32 %4, %3
  %237 = mul i32 %236, %235
  %238 = mul i32 %236, 3
  %239 = mul i32 %238, %27
  %240 = mul i32 %239, %2
  %241 = mul i32 %240, %9
  %242 = add i32 %230, %241
  %243 = add i32 %242, %237
  %244 = add i32 %235, 1
  %245 = mul i32 %236, %244
  %246 = add i32 %242, %245
  %247 = add i32 %235, 2
  %248 = mul i32 %236, %247
  %249 = add i32 %242, %248
  %250 = sext i32 %243 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %24, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !11
  %253 = fmul float %252, 0x3FF7154760000000
  %254 = tail call float @llvm.rint.f32(float %253)
  %255 = fcmp ogt float %252, 0x40562E4300000000
  %256 = fcmp olt float %252, 0xC059D1DA00000000
  %257 = fneg float %253
  %258 = tail call float @llvm.fma.f32(float %252, float 0x3FF7154760000000, float %257)
  %259 = tail call float @llvm.fma.f32(float %252, float 0x3E54AE0BE0000000, float %258)
  %260 = fsub float %253, %254
  %261 = fadd float %259, %260
  %262 = tail call float @llvm.exp2.f32(float %261)
  %263 = fptosi float %254 to i32
  %264 = tail call float @llvm.amdgcn.ldexp.f32(float %262, i32 %263)
  %265 = select i1 %256, float 0.000000e+00, float %264
  %266 = select i1 %255, float 0x7FF0000000000000, float %265
  %267 = sext i32 %246 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %24, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !11
  %270 = fmul float %269, 0x3FF7154760000000
  %271 = tail call float @llvm.rint.f32(float %270)
  %272 = fcmp ogt float %269, 0x40562E4300000000
  %273 = fcmp olt float %269, 0xC059D1DA00000000
  %274 = fneg float %270
  %275 = tail call float @llvm.fma.f32(float %269, float 0x3FF7154760000000, float %274)
  %276 = tail call float @llvm.fma.f32(float %269, float 0x3E54AE0BE0000000, float %275)
  %277 = fsub float %270, %271
  %278 = fadd float %276, %277
  %279 = tail call float @llvm.exp2.f32(float %278)
  %280 = fptosi float %271 to i32
  %281 = tail call float @llvm.amdgcn.ldexp.f32(float %279, i32 %280)
  %282 = select i1 %273, float 0.000000e+00, float %281
  %283 = select i1 %272, float 0x7FF0000000000000, float %282
  %284 = sext i32 %249 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %24, i64 %284
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !11
  %287 = fmul float %286, 0x3FF7154760000000
  %288 = tail call float @llvm.rint.f32(float %287)
  %289 = fcmp ogt float %286, 0x40562E4300000000
  %290 = fcmp olt float %286, 0xC059D1DA00000000
  %291 = fneg float %287
  %292 = tail call float @llvm.fma.f32(float %286, float 0x3FF7154760000000, float %291)
  %293 = tail call float @llvm.fma.f32(float %286, float 0x3E54AE0BE0000000, float %292)
  %294 = fsub float %287, %288
  %295 = fadd float %293, %294
  %296 = tail call float @llvm.exp2.f32(float %295)
  %297 = fptosi float %288 to i32
  %298 = tail call float @llvm.amdgcn.ldexp.f32(float %296, i32 %297)
  %299 = select i1 %290, float 0.000000e+00, float %298
  %300 = select i1 %289, float 0x7FF0000000000000, float %299
  %301 = shl i32 %10, 1
  %302 = add i32 %301, %233
  %303 = add i32 %301, 6
  %304 = mul i32 %11, 3
  %305 = add i32 %303, %304
  %306 = mul i32 %48, %305
  %307 = add i32 %306, %302
  br label %355

308:                                              ; preds = %210
  %309 = icmp ult i32 %38, %11
  br i1 %309, label %310, label %369

310:                                              ; preds = %308
  %311 = mul nsw i32 %38, 3
  %312 = shl i32 %10, 1
  %313 = add i32 %312, %311
  %314 = add i32 %312, 6
  %315 = mul i32 %11, 3
  %316 = add i32 %314, %315
  %317 = mul i32 %48, %316
  %318 = add i32 %317, %313
  br label %355

319:                                              ; preds = %40
  %320 = shl i32 %10, 1
  %321 = add i32 %320, 6
  %322 = mul i32 %11, 3
  %323 = add i32 %321, %322
  %324 = mul i32 %48, %323
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %25, i64 %325
  store float 0.000000e+00, float addrspace(1)* %326, align 4, !tbaa !11
  %327 = add i32 %324, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %25, i64 %328
  store float 0.000000e+00, float addrspace(1)* %329, align 4, !tbaa !11
  %330 = add i32 %324, 2
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %25, i64 %331
  store float 0.000000e+00, float addrspace(1)* %332, align 4, !tbaa !11
  %333 = add i32 %324, 3
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %25, i64 %334
  store float 0.000000e+00, float addrspace(1)* %335, align 4, !tbaa !11
  %336 = add i32 %324, 4
  %337 = zext i32 %336 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %25, i64 %337
  store float 0.000000e+00, float addrspace(1)* %338, align 4, !tbaa !11
  %339 = icmp ult i32 %38, %10
  br i1 %339, label %340, label %349

340:                                              ; preds = %319
  %341 = shl nsw i32 %38, 1
  %342 = add i32 %324, %341
  %343 = add i32 %342, 6
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %25, i64 %344
  store float 0.000000e+00, float addrspace(1)* %345, align 4, !tbaa !11
  %346 = add i32 %342, 7
  %347 = zext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %25, i64 %347
  store float 0.000000e+00, float addrspace(1)* %348, align 4, !tbaa !11
  br label %349

349:                                              ; preds = %340, %319
  %350 = icmp ult i32 %38, %11
  br i1 %350, label %351, label %369

351:                                              ; preds = %349
  %352 = mul nsw i32 %38, 3
  %353 = add i32 %320, %352
  %354 = add i32 %324, %353
  br label %355

355:                                              ; preds = %351, %212, %310
  %356 = phi i32 [ %318, %310 ], [ %307, %212 ], [ %354, %351 ]
  %357 = phi float [ 0.000000e+00, %310 ], [ %266, %212 ], [ 0.000000e+00, %351 ]
  %358 = phi float [ 0.000000e+00, %310 ], [ %283, %212 ], [ 0.000000e+00, %351 ]
  %359 = phi float [ 0.000000e+00, %310 ], [ %300, %212 ], [ 0.000000e+00, %351 ]
  %360 = add i32 %356, 6
  %361 = zext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %25, i64 %361
  store float %357, float addrspace(1)* %362, align 4, !tbaa !11
  %363 = add i32 %356, 7
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds float, float addrspace(1)* %25, i64 %364
  store float %358, float addrspace(1)* %365, align 4, !tbaa !11
  %366 = add i32 %356, 8
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, float addrspace(1)* %25, i64 %367
  store float %359, float addrspace(1)* %368, align 4, !tbaa !11
  br label %369

369:                                              ; preds = %355, %308, %349, %26
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
