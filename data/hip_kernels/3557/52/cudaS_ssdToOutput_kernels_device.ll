; ModuleID = '../data/hip_kernels/3557/52/main.cu'
source_filename = "../data/hip_kernels/3557/52/main.cu"
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
  br i1 %39, label %40, label %380

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
  br i1 %49, label %50, label %326

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
  %99 = icmp ne i32 %8, 0
  %100 = select i1 %98, i1 %99, i1 false
  br i1 %100, label %101, label %193

101:                                              ; preds = %97
  %102 = add i32 %37, %45
  %103 = mul i32 %102, 5
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %21, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !11
  %107 = fptoui float %106 to i32
  %108 = add i32 %103, 1
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %21, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11
  %112 = fptoui float %111 to i32
  %113 = add i32 %103, 2
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %21, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11
  %117 = fptoui float %116 to i32
  %118 = mul i32 %112, %3
  %119 = add i32 %118, %107
  %120 = shl i32 %14, 1
  %121 = mul i32 %120, %117
  %122 = shl nsw i32 %38, 1
  %123 = add i32 %122, %12
  %124 = add i32 %123, %121
  %125 = mul i32 %4, %3
  %126 = mul i32 %125, %124
  %127 = shl i32 %125, 1
  %128 = mul i32 %127, %27
  %129 = mul i32 %128, %2
  %130 = mul i32 %129, %8
  %131 = add i32 %119, %130
  %132 = add i32 %131, %126
  %133 = add i32 %124, 1
  %134 = mul i32 %125, %133
  %135 = add i32 %131, %134
  %136 = sext i32 %132 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %23, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11
  %139 = sext i32 %135 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %23, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !11
  %142 = shl i32 %2, 2
  %143 = mul i32 %142, %7
  %144 = shl i32 %117, 2
  %145 = add i32 %144, %143
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %22, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !11
  %149 = uitofp i32 %107 to float
  %150 = fmul contract float %149, %16
  %151 = fadd contract float %150, %148
  %152 = fptosi float %151 to i32
  %153 = or i32 %145, 1
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %22, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !11
  %157 = uitofp i32 %112 to float
  %158 = fmul contract float %157, %17
  %159 = fadd contract float %158, %156
  %160 = fptosi float %159 to i32
  %161 = or i32 %145, 2
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %22, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !11
  %165 = fadd contract float %150, %164
  %166 = fptosi float %165 to i32
  %167 = or i32 %145, 3
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %22, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !11
  %171 = fadd contract float %158, %170
  %172 = fptosi float %171 to i32
  %173 = sub nsw i32 %166, %152
  %174 = sub nsw i32 %172, %160
  %175 = sitofp i32 %152 to double
  %176 = sitofp i32 %173 to double
  %177 = fmul contract double %176, 5.000000e-01
  %178 = fadd contract double %177, %175
  %179 = fptrunc double %178 to float
  %180 = sitofp i32 %160 to double
  %181 = sitofp i32 %174 to double
  %182 = fmul contract double %181, 5.000000e-01
  %183 = fadd contract double %182, %180
  %184 = fptrunc double %183 to float
  %185 = sitofp i32 %174 to float
  %186 = fmul contract float %138, %185
  %187 = fadd contract float %186, %184
  %188 = fmul contract float %187, %19
  %189 = sitofp i32 %173 to float
  %190 = fmul contract float %141, %189
  %191 = fadd contract float %190, %179
  %192 = fmul contract float %191, %18
  br label %198

193:                                              ; preds = %97
  %194 = icmp ult i32 %38, %10
  %195 = select i1 %194, i1 %99, i1 false
  br i1 %195, label %196, label %214

196:                                              ; preds = %193
  %197 = shl nsw i32 %38, 1
  br label %198

198:                                              ; preds = %101, %196
  %199 = phi i32 [ %122, %101 ], [ %197, %196 ]
  %200 = phi float [ %188, %101 ], [ 0.000000e+00, %196 ]
  %201 = phi float [ %192, %101 ], [ 0.000000e+00, %196 ]
  %202 = shl i32 %10, 1
  %203 = add i32 %202, 6
  %204 = mul i32 %11, 3
  %205 = add i32 %203, %204
  %206 = mul i32 %48, %205
  %207 = add i32 %206, %199
  %208 = add i32 %207, 6
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %25, i64 %209
  store float %200, float addrspace(1)* %210, align 4, !tbaa !11
  %211 = add i32 %207, 7
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %25, i64 %212
  store float %201, float addrspace(1)* %213, align 4, !tbaa !11
  br label %214

214:                                              ; preds = %198, %193
  %215 = icmp ult i32 %38, %15
  %216 = icmp ne i32 %9, 0
  %217 = select i1 %215, i1 %216, i1 false
  br i1 %217, label %218, label %314

218:                                              ; preds = %214
  %219 = add i32 %37, %45
  %220 = mul i32 %219, 5
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %21, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !11
  %224 = fptoui float %223 to i32
  %225 = add i32 %220, 1
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %21, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !11
  %229 = fptoui float %228 to i32
  %230 = add i32 %220, 2
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %21, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !11
  %234 = fptoui float %233 to i32
  %235 = mul i32 %229, %3
  %236 = add i32 %235, %224
  %237 = mul i32 %15, 3
  %238 = mul i32 %237, %234
  %239 = mul nsw i32 %38, 3
  %240 = add i32 %239, %13
  %241 = add i32 %240, %238
  %242 = mul i32 %4, %3
  %243 = mul i32 %242, %241
  %244 = mul i32 %242, 3
  %245 = mul i32 %244, %27
  %246 = mul i32 %245, %2
  %247 = mul i32 %246, %9
  %248 = add i32 %236, %247
  %249 = add i32 %248, %243
  %250 = add i32 %241, 1
  %251 = mul i32 %242, %250
  %252 = add i32 %248, %251
  %253 = add i32 %241, 2
  %254 = mul i32 %242, %253
  %255 = add i32 %248, %254
  %256 = sext i32 %249 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %24, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !11
  %259 = fmul float %258, 0x3FF7154760000000
  %260 = tail call float @llvm.rint.f32(float %259)
  %261 = fcmp ogt float %258, 0x40562E4300000000
  %262 = fcmp olt float %258, 0xC059D1DA00000000
  %263 = fneg float %259
  %264 = tail call float @llvm.fma.f32(float %258, float 0x3FF7154760000000, float %263)
  %265 = tail call float @llvm.fma.f32(float %258, float 0x3E54AE0BE0000000, float %264)
  %266 = fsub float %259, %260
  %267 = fadd float %265, %266
  %268 = tail call float @llvm.exp2.f32(float %267)
  %269 = fptosi float %260 to i32
  %270 = tail call float @llvm.amdgcn.ldexp.f32(float %268, i32 %269)
  %271 = select i1 %262, float 0.000000e+00, float %270
  %272 = select i1 %261, float 0x7FF0000000000000, float %271
  %273 = sext i32 %252 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %24, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !11
  %276 = fmul float %275, 0x3FF7154760000000
  %277 = tail call float @llvm.rint.f32(float %276)
  %278 = fcmp ogt float %275, 0x40562E4300000000
  %279 = fcmp olt float %275, 0xC059D1DA00000000
  %280 = fneg float %276
  %281 = tail call float @llvm.fma.f32(float %275, float 0x3FF7154760000000, float %280)
  %282 = tail call float @llvm.fma.f32(float %275, float 0x3E54AE0BE0000000, float %281)
  %283 = fsub float %276, %277
  %284 = fadd float %282, %283
  %285 = tail call float @llvm.exp2.f32(float %284)
  %286 = fptosi float %277 to i32
  %287 = tail call float @llvm.amdgcn.ldexp.f32(float %285, i32 %286)
  %288 = select i1 %279, float 0.000000e+00, float %287
  %289 = select i1 %278, float 0x7FF0000000000000, float %288
  %290 = sext i32 %255 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %24, i64 %290
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !11
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = tail call float @llvm.rint.f32(float %293)
  %295 = fcmp ogt float %292, 0x40562E4300000000
  %296 = fcmp olt float %292, 0xC059D1DA00000000
  %297 = fneg float %293
  %298 = tail call float @llvm.fma.f32(float %292, float 0x3FF7154760000000, float %297)
  %299 = tail call float @llvm.fma.f32(float %292, float 0x3E54AE0BE0000000, float %298)
  %300 = fsub float %293, %294
  %301 = fadd float %299, %300
  %302 = tail call float @llvm.exp2.f32(float %301)
  %303 = fptosi float %294 to i32
  %304 = tail call float @llvm.amdgcn.ldexp.f32(float %302, i32 %303)
  %305 = select i1 %296, float 0.000000e+00, float %304
  %306 = select i1 %295, float 0x7FF0000000000000, float %305
  %307 = shl i32 %10, 1
  %308 = add i32 %307, %239
  %309 = add i32 %307, 6
  %310 = mul i32 %11, 3
  %311 = add i32 %309, %310
  %312 = mul i32 %48, %311
  %313 = add i32 %312, %308
  br label %366

314:                                              ; preds = %214
  %315 = icmp ult i32 %38, %11
  %316 = select i1 %315, i1 %216, i1 false
  br i1 %316, label %317, label %380

317:                                              ; preds = %314
  %318 = mul nsw i32 %38, 3
  %319 = shl i32 %10, 1
  %320 = add i32 %319, %318
  %321 = add i32 %319, 6
  %322 = mul i32 %11, 3
  %323 = add i32 %321, %322
  %324 = mul i32 %48, %323
  %325 = add i32 %324, %320
  br label %366

326:                                              ; preds = %40
  %327 = shl i32 %10, 1
  %328 = add i32 %327, 6
  %329 = mul i32 %11, 3
  %330 = add i32 %328, %329
  %331 = mul i32 %48, %330
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %25, i64 %332
  store float 0.000000e+00, float addrspace(1)* %333, align 4, !tbaa !11
  %334 = add i32 %331, 1
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %25, i64 %335
  store float 0.000000e+00, float addrspace(1)* %336, align 4, !tbaa !11
  %337 = add i32 %331, 2
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds float, float addrspace(1)* %25, i64 %338
  store float 0.000000e+00, float addrspace(1)* %339, align 4, !tbaa !11
  %340 = add i32 %331, 3
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %25, i64 %341
  store float 0.000000e+00, float addrspace(1)* %342, align 4, !tbaa !11
  %343 = add i32 %331, 4
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %25, i64 %344
  store float 0.000000e+00, float addrspace(1)* %345, align 4, !tbaa !11
  %346 = icmp ult i32 %38, %10
  %347 = icmp ne i32 %8, 0
  %348 = select i1 %346, i1 %347, i1 false
  br i1 %348, label %349, label %358

349:                                              ; preds = %326
  %350 = shl nsw i32 %38, 1
  %351 = add i32 %331, %350
  %352 = add i32 %351, 6
  %353 = zext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %25, i64 %353
  store float 0.000000e+00, float addrspace(1)* %354, align 4, !tbaa !11
  %355 = add i32 %351, 7
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %25, i64 %356
  store float 0.000000e+00, float addrspace(1)* %357, align 4, !tbaa !11
  br label %358

358:                                              ; preds = %349, %326
  %359 = icmp ult i32 %38, %11
  %360 = icmp ne i32 %9, 0
  %361 = select i1 %359, i1 %360, i1 false
  br i1 %361, label %362, label %380

362:                                              ; preds = %358
  %363 = mul nsw i32 %38, 3
  %364 = add i32 %327, %363
  %365 = add i32 %331, %364
  br label %366

366:                                              ; preds = %362, %218, %317
  %367 = phi i32 [ %325, %317 ], [ %313, %218 ], [ %365, %362 ]
  %368 = phi float [ 0.000000e+00, %317 ], [ %272, %218 ], [ 0.000000e+00, %362 ]
  %369 = phi float [ 0.000000e+00, %317 ], [ %289, %218 ], [ 0.000000e+00, %362 ]
  %370 = phi float [ 0.000000e+00, %317 ], [ %306, %218 ], [ 0.000000e+00, %362 ]
  %371 = add i32 %367, 6
  %372 = zext i32 %371 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %25, i64 %372
  store float %368, float addrspace(1)* %373, align 4, !tbaa !11
  %374 = add i32 %367, 7
  %375 = zext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %25, i64 %375
  store float %369, float addrspace(1)* %376, align 4, !tbaa !11
  %377 = add i32 %367, 8
  %378 = zext i32 %377 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %25, i64 %378
  store float %370, float addrspace(1)* %379, align 4, !tbaa !11
  br label %380

380:                                              ; preds = %366, %314, %358, %26
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
