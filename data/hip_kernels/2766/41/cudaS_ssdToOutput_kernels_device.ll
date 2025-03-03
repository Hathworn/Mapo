; ModuleID = '../data/hip_kernels/2766/41/main.cu'
source_filename = "../data/hip_kernels/2766/41/main.cu"
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
  br i1 %39, label %40, label %377

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
  br i1 %49, label %50, label %323

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
  br i1 %100, label %101, label %190

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
  %142 = shl i32 %117, 2
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %22, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11
  %146 = uitofp i32 %107 to float
  %147 = fmul contract float %146, %16
  %148 = fadd contract float %147, %145
  %149 = fptosi float %148 to i32
  %150 = add nuw nsw i32 %142, 1
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %22, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11
  %154 = uitofp i32 %112 to float
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
  %183 = fmul contract float %138, %182
  %184 = fadd contract float %183, %181
  %185 = fmul contract float %184, %19
  %186 = sitofp i32 %170 to float
  %187 = fmul contract float %141, %186
  %188 = fadd contract float %187, %176
  %189 = fmul contract float %188, %18
  br label %195

190:                                              ; preds = %97
  %191 = icmp ult i32 %38, %10
  %192 = select i1 %191, i1 %99, i1 false
  br i1 %192, label %193, label %211

193:                                              ; preds = %190
  %194 = shl nsw i32 %38, 1
  br label %195

195:                                              ; preds = %101, %193
  %196 = phi i32 [ %122, %101 ], [ %194, %193 ]
  %197 = phi float [ %185, %101 ], [ 0.000000e+00, %193 ]
  %198 = phi float [ %189, %101 ], [ 0.000000e+00, %193 ]
  %199 = shl i32 %10, 1
  %200 = add i32 %199, 6
  %201 = mul i32 %11, 3
  %202 = add i32 %200, %201
  %203 = mul i32 %48, %202
  %204 = add i32 %203, %196
  %205 = add i32 %204, 6
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %25, i64 %206
  store float %197, float addrspace(1)* %207, align 4, !tbaa !11
  %208 = add i32 %204, 7
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %25, i64 %209
  store float %198, float addrspace(1)* %210, align 4, !tbaa !11
  br label %211

211:                                              ; preds = %195, %190
  %212 = icmp ult i32 %38, %15
  %213 = icmp ne i32 %9, 0
  %214 = select i1 %212, i1 %213, i1 false
  br i1 %214, label %215, label %311

215:                                              ; preds = %211
  %216 = add i32 %37, %45
  %217 = mul i32 %216, 5
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %21, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !11
  %221 = fptoui float %220 to i32
  %222 = add i32 %217, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %21, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !11
  %226 = fptoui float %225 to i32
  %227 = add i32 %217, 2
  %228 = zext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %21, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !11
  %231 = fptoui float %230 to i32
  %232 = mul i32 %226, %3
  %233 = add i32 %232, %221
  %234 = mul i32 %15, 3
  %235 = mul i32 %234, %231
  %236 = mul nsw i32 %38, 3
  %237 = add i32 %236, %13
  %238 = add i32 %237, %235
  %239 = mul i32 %4, %3
  %240 = mul i32 %239, %238
  %241 = mul i32 %239, 3
  %242 = mul i32 %241, %27
  %243 = mul i32 %242, %2
  %244 = mul i32 %243, %9
  %245 = add i32 %233, %244
  %246 = add i32 %245, %240
  %247 = add i32 %238, 1
  %248 = mul i32 %239, %247
  %249 = add i32 %245, %248
  %250 = add i32 %238, 2
  %251 = mul i32 %239, %250
  %252 = add i32 %245, %251
  %253 = sext i32 %246 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %24, i64 %253
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !11
  %256 = fmul float %255, 0x3FF7154760000000
  %257 = tail call float @llvm.rint.f32(float %256)
  %258 = fcmp ogt float %255, 0x40562E4300000000
  %259 = fcmp olt float %255, 0xC059D1DA00000000
  %260 = fneg float %256
  %261 = tail call float @llvm.fma.f32(float %255, float 0x3FF7154760000000, float %260)
  %262 = tail call float @llvm.fma.f32(float %255, float 0x3E54AE0BE0000000, float %261)
  %263 = fsub float %256, %257
  %264 = fadd float %262, %263
  %265 = tail call float @llvm.exp2.f32(float %264)
  %266 = fptosi float %257 to i32
  %267 = tail call float @llvm.amdgcn.ldexp.f32(float %265, i32 %266)
  %268 = select i1 %259, float 0.000000e+00, float %267
  %269 = select i1 %258, float 0x7FF0000000000000, float %268
  %270 = sext i32 %249 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %24, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !11
  %273 = fmul float %272, 0x3FF7154760000000
  %274 = tail call float @llvm.rint.f32(float %273)
  %275 = fcmp ogt float %272, 0x40562E4300000000
  %276 = fcmp olt float %272, 0xC059D1DA00000000
  %277 = fneg float %273
  %278 = tail call float @llvm.fma.f32(float %272, float 0x3FF7154760000000, float %277)
  %279 = tail call float @llvm.fma.f32(float %272, float 0x3E54AE0BE0000000, float %278)
  %280 = fsub float %273, %274
  %281 = fadd float %279, %280
  %282 = tail call float @llvm.exp2.f32(float %281)
  %283 = fptosi float %274 to i32
  %284 = tail call float @llvm.amdgcn.ldexp.f32(float %282, i32 %283)
  %285 = select i1 %276, float 0.000000e+00, float %284
  %286 = select i1 %275, float 0x7FF0000000000000, float %285
  %287 = sext i32 %252 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %24, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !11
  %290 = fmul float %289, 0x3FF7154760000000
  %291 = tail call float @llvm.rint.f32(float %290)
  %292 = fcmp ogt float %289, 0x40562E4300000000
  %293 = fcmp olt float %289, 0xC059D1DA00000000
  %294 = fneg float %290
  %295 = tail call float @llvm.fma.f32(float %289, float 0x3FF7154760000000, float %294)
  %296 = tail call float @llvm.fma.f32(float %289, float 0x3E54AE0BE0000000, float %295)
  %297 = fsub float %290, %291
  %298 = fadd float %296, %297
  %299 = tail call float @llvm.exp2.f32(float %298)
  %300 = fptosi float %291 to i32
  %301 = tail call float @llvm.amdgcn.ldexp.f32(float %299, i32 %300)
  %302 = select i1 %293, float 0.000000e+00, float %301
  %303 = select i1 %292, float 0x7FF0000000000000, float %302
  %304 = shl i32 %10, 1
  %305 = add i32 %304, %236
  %306 = add i32 %304, 6
  %307 = mul i32 %11, 3
  %308 = add i32 %306, %307
  %309 = mul i32 %48, %308
  %310 = add i32 %309, %305
  br label %363

311:                                              ; preds = %211
  %312 = icmp ult i32 %38, %11
  %313 = select i1 %312, i1 %213, i1 false
  br i1 %313, label %314, label %377

314:                                              ; preds = %311
  %315 = mul nsw i32 %38, 3
  %316 = shl i32 %10, 1
  %317 = add i32 %316, %315
  %318 = add i32 %316, 6
  %319 = mul i32 %11, 3
  %320 = add i32 %318, %319
  %321 = mul i32 %48, %320
  %322 = add i32 %321, %317
  br label %363

323:                                              ; preds = %40
  %324 = shl i32 %10, 1
  %325 = add i32 %324, 6
  %326 = mul i32 %11, 3
  %327 = add i32 %325, %326
  %328 = mul i32 %48, %327
  %329 = zext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %25, i64 %329
  store float 0.000000e+00, float addrspace(1)* %330, align 4, !tbaa !11
  %331 = add i32 %328, 1
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %25, i64 %332
  store float 0.000000e+00, float addrspace(1)* %333, align 4, !tbaa !11
  %334 = add i32 %328, 2
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %25, i64 %335
  store float 0.000000e+00, float addrspace(1)* %336, align 4, !tbaa !11
  %337 = add i32 %328, 3
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds float, float addrspace(1)* %25, i64 %338
  store float 0.000000e+00, float addrspace(1)* %339, align 4, !tbaa !11
  %340 = add i32 %328, 4
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %25, i64 %341
  store float 0.000000e+00, float addrspace(1)* %342, align 4, !tbaa !11
  %343 = icmp ult i32 %38, %10
  %344 = icmp ne i32 %8, 0
  %345 = select i1 %343, i1 %344, i1 false
  br i1 %345, label %346, label %355

346:                                              ; preds = %323
  %347 = shl nsw i32 %38, 1
  %348 = add i32 %328, %347
  %349 = add i32 %348, 6
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %25, i64 %350
  store float 0.000000e+00, float addrspace(1)* %351, align 4, !tbaa !11
  %352 = add i32 %348, 7
  %353 = zext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %25, i64 %353
  store float 0.000000e+00, float addrspace(1)* %354, align 4, !tbaa !11
  br label %355

355:                                              ; preds = %346, %323
  %356 = icmp ult i32 %38, %11
  %357 = icmp ne i32 %9, 0
  %358 = select i1 %356, i1 %357, i1 false
  br i1 %358, label %359, label %377

359:                                              ; preds = %355
  %360 = mul nsw i32 %38, 3
  %361 = add i32 %324, %360
  %362 = add i32 %328, %361
  br label %363

363:                                              ; preds = %359, %215, %314
  %364 = phi i32 [ %322, %314 ], [ %310, %215 ], [ %362, %359 ]
  %365 = phi float [ 0.000000e+00, %314 ], [ %269, %215 ], [ 0.000000e+00, %359 ]
  %366 = phi float [ 0.000000e+00, %314 ], [ %286, %215 ], [ 0.000000e+00, %359 ]
  %367 = phi float [ 0.000000e+00, %314 ], [ %303, %215 ], [ 0.000000e+00, %359 ]
  %368 = add i32 %364, 6
  %369 = zext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %25, i64 %369
  store float %365, float addrspace(1)* %370, align 4, !tbaa !11
  %371 = add i32 %364, 7
  %372 = zext i32 %371 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %25, i64 %372
  store float %366, float addrspace(1)* %373, align 4, !tbaa !11
  %374 = add i32 %364, 8
  %375 = zext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %25, i64 %375
  store float %367, float addrspace(1)* %376, align 4, !tbaa !11
  br label %377

377:                                              ; preds = %363, %311, %355, %26
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
