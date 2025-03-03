; ModuleID = '../data/hip_kernels/2890/6/main.cu'
source_filename = "../data/hip_kernels/2890/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z41Compute_weightx_weighty1_normother_KernelPfS_PKfS1_S1_S1_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %10, %16
  %18 = add i32 %17, %11
  %19 = icmp slt i32 %18, %6
  br i1 %19, label %20, label %425

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = getelementptr inbounds float, float addrspace(1)* %4, i64 %21
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = fsub contract float 2.000000e+00, %7
  %27 = tail call float @llvm.fabs.f32(float %25)
  %28 = tail call float @llvm.amdgcn.frexp.mant.f32(float %27)
  %29 = fcmp olt float %28, 0x3FE5555560000000
  %30 = zext i1 %29 to i32
  %31 = tail call float @llvm.amdgcn.ldexp.f32(float %28, i32 %30)
  %32 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %27)
  %33 = sub nsw i32 %32, %30
  %34 = fadd float %31, -1.000000e+00
  %35 = fadd float %31, 1.000000e+00
  %36 = fadd float %35, -1.000000e+00
  %37 = fsub float %31, %36
  %38 = tail call float @llvm.amdgcn.rcp.f32(float %35)
  %39 = fmul float %34, %38
  %40 = fmul float %35, %39
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %39, float %35, float %41)
  %43 = tail call float @llvm.fma.f32(float %39, float %37, float %42)
  %44 = fadd float %40, %43
  %45 = fsub float %44, %40
  %46 = fsub float %43, %45
  %47 = fsub float %34, %44
  %48 = fsub float %34, %47
  %49 = fsub float %48, %44
  %50 = fsub float %49, %46
  %51 = fadd float %47, %50
  %52 = fmul float %38, %51
  %53 = fadd float %39, %52
  %54 = fsub float %53, %39
  %55 = fsub float %52, %54
  %56 = fmul float %53, %53
  %57 = fneg float %56
  %58 = tail call float @llvm.fma.f32(float %53, float %53, float %57)
  %59 = fmul float %55, 2.000000e+00
  %60 = tail call float @llvm.fma.f32(float %53, float %59, float %58)
  %61 = fadd float %56, %60
  %62 = fsub float %61, %56
  %63 = fsub float %60, %62
  %64 = tail call float @llvm.fmuladd.f32(float %61, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %65 = tail call float @llvm.fmuladd.f32(float %61, float %64, float 0x3FD999BDE0000000)
  %66 = sitofp i32 %33 to float
  %67 = fmul float %66, 0x3FE62E4300000000
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %66, float 0x3FE62E4300000000, float %68)
  %70 = tail call float @llvm.fma.f32(float %66, float 0xBE205C6100000000, float %69)
  %71 = fadd float %67, %70
  %72 = fsub float %71, %67
  %73 = fsub float %70, %72
  %74 = tail call float @llvm.amdgcn.ldexp.f32(float %53, i32 1)
  %75 = fmul float %53, %61
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %61, float %53, float %76)
  %78 = tail call float @llvm.fma.f32(float %61, float %55, float %77)
  %79 = tail call float @llvm.fma.f32(float %63, float %53, float %78)
  %80 = fadd float %75, %79
  %81 = fsub float %80, %75
  %82 = fsub float %79, %81
  %83 = fmul float %61, %65
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %61, float %65, float %84)
  %86 = tail call float @llvm.fma.f32(float %63, float %65, float %85)
  %87 = fadd float %83, %86
  %88 = fsub float %87, %83
  %89 = fsub float %86, %88
  %90 = fadd float %87, 0x3FE5555540000000
  %91 = fadd float %90, 0xBFE5555540000000
  %92 = fsub float %87, %91
  %93 = fadd float %89, 0x3E2E720200000000
  %94 = fadd float %93, %92
  %95 = fadd float %90, %94
  %96 = fsub float %95, %90
  %97 = fsub float %94, %96
  %98 = fmul float %80, %95
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %80, float %95, float %99)
  %101 = tail call float @llvm.fma.f32(float %80, float %97, float %100)
  %102 = tail call float @llvm.fma.f32(float %82, float %95, float %101)
  %103 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 1)
  %104 = fadd float %98, %102
  %105 = fsub float %104, %98
  %106 = fsub float %102, %105
  %107 = fadd float %74, %104
  %108 = fsub float %107, %74
  %109 = fsub float %104, %108
  %110 = fadd float %103, %106
  %111 = fadd float %110, %109
  %112 = fadd float %107, %111
  %113 = fsub float %112, %107
  %114 = fsub float %111, %113
  %115 = fadd float %71, %112
  %116 = fsub float %115, %71
  %117 = fsub float %115, %116
  %118 = fsub float %71, %117
  %119 = fsub float %112, %116
  %120 = fadd float %119, %118
  %121 = fadd float %73, %114
  %122 = fsub float %121, %73
  %123 = fsub float %121, %122
  %124 = fsub float %73, %123
  %125 = fsub float %114, %122
  %126 = fadd float %125, %124
  %127 = fadd float %121, %120
  %128 = fadd float %115, %127
  %129 = fsub float %128, %115
  %130 = fsub float %127, %129
  %131 = fadd float %126, %130
  %132 = fadd float %128, %131
  %133 = fsub float %132, %128
  %134 = fsub float %131, %133
  %135 = fmul float %26, %132
  %136 = fneg float %135
  %137 = tail call float @llvm.fma.f32(float %26, float %132, float %136)
  %138 = tail call float @llvm.fma.f32(float %26, float %134, float %137)
  %139 = fadd float %135, %138
  %140 = tail call float @llvm.fabs.f32(float %135) #3
  %141 = fcmp oeq float %140, 0x7FF0000000000000
  %142 = select i1 %141, float %135, float %139
  %143 = fcmp oeq float %142, 0x40562E4300000000
  %144 = select i1 %143, float 0x3EE0000000000000, float 0.000000e+00
  %145 = fsub float %142, %144
  %146 = fmul float %145, 0x3FF7154760000000
  %147 = tail call float @llvm.rint.f32(float %146)
  %148 = fcmp ogt float %145, 0x40562E4300000000
  %149 = fcmp olt float %145, 0xC059D1DA00000000
  %150 = fneg float %146
  %151 = tail call float @llvm.fma.f32(float %145, float 0x3FF7154760000000, float %150)
  %152 = tail call float @llvm.fma.f32(float %145, float 0x3E54AE0BE0000000, float %151)
  %153 = fsub float %146, %147
  %154 = fadd float %152, %153
  %155 = tail call float @llvm.exp2.f32(float %154)
  %156 = fptosi float %147 to i32
  %157 = tail call float @llvm.amdgcn.ldexp.f32(float %155, i32 %156)
  %158 = select i1 %149, float 0.000000e+00, float %157
  %159 = select i1 %148, float 0x7FF0000000000000, float %158
  %160 = tail call float @llvm.fabs.f32(float %26)
  %161 = tail call float @llvm.trunc.f32(float %160)
  %162 = fcmp oeq float %160, %161
  %163 = zext i1 %162 to i32
  %164 = fmul float %161, 5.000000e-01
  %165 = tail call float @llvm.amdgcn.fract.f32(float %164)
  %166 = tail call i1 @llvm.amdgcn.class.f32(float %164, i32 516)
  %167 = select i1 %166, float 0.000000e+00, float %165
  %168 = fcmp oeq float %167, 0.000000e+00
  %169 = and i1 %162, %168
  %170 = zext i1 %169 to i32
  %171 = add nuw nsw i32 %170, %163
  %172 = icmp eq i32 %171, 1
  %173 = icmp ne i32 %171, 0
  %174 = fcmp oeq float %160, 0x7FF0000000000000
  br i1 %174, label %175, label %213

175:                                              ; preds = %20
  %176 = fcmp oeq float %27, 1.000000e+00
  %177 = fadd float %27, -1.000000e+00
  %178 = bitcast float %26 to i32
  %179 = bitcast float %177 to i32
  %180 = xor i32 %179, %178
  %181 = icmp sgt i32 %180, -1
  %182 = select i1 %181, float 0x7FF0000000000000, float 0.000000e+00
  %183 = select i1 %176, float %27, float %182
  %184 = fcmp oeq float %27, 0x7FF0000000000000
  %185 = fcmp oeq float %25, 0.000000e+00
  %186 = or i1 %185, %184
  %187 = fcmp olt float %26, 0.000000e+00
  %188 = xor i1 %187, %185
  %189 = select i1 %188, float 0.000000e+00, float 0x7FF0000000000000
  %190 = select i1 %172, float %25, float 0.000000e+00
  %191 = tail call float @llvm.copysign.f32(float %189, float %190)
  %192 = select i1 %186, float %191, float %183
  %193 = fcmp uno float %25, %26
  %194 = select i1 %193, float 0x7FF8000000000000, float %192
  %195 = fcmp oeq float %25, 1.000000e+00
  %196 = fcmp oeq float %26, 0.000000e+00
  %197 = or i1 %196, %195
  %198 = select i1 %197, float 1.000000e+00, float %194
  %199 = fadd contract float %198, %8
  %200 = fdiv contract float %23, %199
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float %200, float addrspace(1)* %201, align 4, !tbaa !7
  %202 = getelementptr inbounds float, float addrspace(1)* %5, i64 %21
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = tail call float @llvm.fabs.f32(float %203)
  %205 = fcmp oeq float %204, 1.000000e+00
  %206 = fadd float %204, -1.000000e+00
  %207 = bitcast float %26 to i32
  %208 = bitcast float %206 to i32
  %209 = xor i32 %208, %207
  %210 = icmp sgt i32 %209, -1
  %211 = select i1 %210, float 0x7FF0000000000000, float 0.000000e+00
  %212 = select i1 %205, float %204, float %211
  br label %401

213:                                              ; preds = %20
  %214 = fcmp uge float %25, 0.000000e+00
  %215 = select i1 %214, i1 true, i1 %173
  %216 = tail call float @llvm.fabs.f32(float %159) #3
  %217 = fcmp oeq float %216, 0x7FF0000000000000
  %218 = tail call float @llvm.fabs.f32(float %142) #3
  %219 = fcmp oeq float %218, 0x7FF0000000000000
  %220 = fsub float %139, %135
  %221 = fsub float %138, %220
  %222 = select i1 %219, float 0.000000e+00, float %221
  %223 = fadd float %144, %222
  %224 = tail call float @llvm.fma.f32(float %159, float %223, float %159)
  %225 = select i1 %217, float %159, float %224
  %226 = fcmp olt float %25, 0.000000e+00
  %227 = and i1 %172, %226
  %228 = select i1 %227, float -0.000000e+00, float 0.000000e+00
  %229 = tail call float @llvm.copysign.f32(float %225, float %228)
  %230 = select i1 %215, float %229, float 0x7FF8000000000000
  %231 = fcmp oeq float %27, 0x7FF0000000000000
  %232 = fcmp oeq float %25, 0.000000e+00
  %233 = or i1 %232, %231
  %234 = fcmp olt float %26, 0.000000e+00
  %235 = xor i1 %234, %232
  %236 = select i1 %235, float 0.000000e+00, float 0x7FF0000000000000
  %237 = select i1 %172, float %25, float 0.000000e+00
  %238 = tail call float @llvm.copysign.f32(float %236, float %237)
  %239 = select i1 %233, float %238, float %230
  %240 = fcmp uno float %25, %26
  %241 = select i1 %240, float 0x7FF8000000000000, float %239
  %242 = fcmp oeq float %25, 1.000000e+00
  %243 = fcmp oeq float %26, 0.000000e+00
  %244 = or i1 %243, %242
  %245 = select i1 %244, float 1.000000e+00, float %241
  %246 = fadd contract float %245, %8
  %247 = fdiv contract float %23, %246
  %248 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float %247, float addrspace(1)* %248, align 4, !tbaa !7
  %249 = getelementptr inbounds float, float addrspace(1)* %5, i64 %21
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = tail call float @llvm.fabs.f32(float %250)
  %252 = tail call float @llvm.amdgcn.frexp.mant.f32(float %251)
  %253 = fcmp olt float %252, 0x3FE5555560000000
  %254 = zext i1 %253 to i32
  %255 = tail call float @llvm.amdgcn.ldexp.f32(float %252, i32 %254)
  %256 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %251)
  %257 = sub nsw i32 %256, %254
  %258 = fadd float %255, -1.000000e+00
  %259 = fadd float %255, 1.000000e+00
  %260 = fadd float %259, -1.000000e+00
  %261 = fsub float %255, %260
  %262 = tail call float @llvm.amdgcn.rcp.f32(float %259)
  %263 = fmul float %258, %262
  %264 = fmul float %259, %263
  %265 = fneg float %264
  %266 = tail call float @llvm.fma.f32(float %263, float %259, float %265)
  %267 = tail call float @llvm.fma.f32(float %263, float %261, float %266)
  %268 = fadd float %264, %267
  %269 = fsub float %268, %264
  %270 = fsub float %267, %269
  %271 = fsub float %258, %268
  %272 = fsub float %258, %271
  %273 = fsub float %272, %268
  %274 = fsub float %273, %270
  %275 = fadd float %271, %274
  %276 = fmul float %262, %275
  %277 = fadd float %263, %276
  %278 = fsub float %277, %263
  %279 = fsub float %276, %278
  %280 = fmul float %277, %277
  %281 = fneg float %280
  %282 = tail call float @llvm.fma.f32(float %277, float %277, float %281)
  %283 = fmul float %279, 2.000000e+00
  %284 = tail call float @llvm.fma.f32(float %277, float %283, float %282)
  %285 = fadd float %280, %284
  %286 = fsub float %285, %280
  %287 = fsub float %284, %286
  %288 = tail call float @llvm.fmuladd.f32(float %285, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %289 = tail call float @llvm.fmuladd.f32(float %285, float %288, float 0x3FD999BDE0000000)
  %290 = sitofp i32 %257 to float
  %291 = fmul float %290, 0x3FE62E4300000000
  %292 = fneg float %291
  %293 = tail call float @llvm.fma.f32(float %290, float 0x3FE62E4300000000, float %292)
  %294 = tail call float @llvm.fma.f32(float %290, float 0xBE205C6100000000, float %293)
  %295 = fadd float %291, %294
  %296 = fsub float %295, %291
  %297 = fsub float %294, %296
  %298 = tail call float @llvm.amdgcn.ldexp.f32(float %277, i32 1)
  %299 = fmul float %277, %285
  %300 = fneg float %299
  %301 = tail call float @llvm.fma.f32(float %285, float %277, float %300)
  %302 = tail call float @llvm.fma.f32(float %285, float %279, float %301)
  %303 = tail call float @llvm.fma.f32(float %287, float %277, float %302)
  %304 = fadd float %299, %303
  %305 = fsub float %304, %299
  %306 = fsub float %303, %305
  %307 = fmul float %285, %289
  %308 = fneg float %307
  %309 = tail call float @llvm.fma.f32(float %285, float %289, float %308)
  %310 = tail call float @llvm.fma.f32(float %287, float %289, float %309)
  %311 = fadd float %307, %310
  %312 = fsub float %311, %307
  %313 = fsub float %310, %312
  %314 = fadd float %311, 0x3FE5555540000000
  %315 = fadd float %314, 0xBFE5555540000000
  %316 = fsub float %311, %315
  %317 = fadd float %313, 0x3E2E720200000000
  %318 = fadd float %317, %316
  %319 = fadd float %314, %318
  %320 = fsub float %319, %314
  %321 = fsub float %318, %320
  %322 = fmul float %304, %319
  %323 = fneg float %322
  %324 = tail call float @llvm.fma.f32(float %304, float %319, float %323)
  %325 = tail call float @llvm.fma.f32(float %304, float %321, float %324)
  %326 = tail call float @llvm.fma.f32(float %306, float %319, float %325)
  %327 = tail call float @llvm.amdgcn.ldexp.f32(float %279, i32 1)
  %328 = fadd float %322, %326
  %329 = fsub float %328, %322
  %330 = fsub float %326, %329
  %331 = fadd float %298, %328
  %332 = fsub float %331, %298
  %333 = fsub float %328, %332
  %334 = fadd float %327, %330
  %335 = fadd float %334, %333
  %336 = fadd float %331, %335
  %337 = fsub float %336, %331
  %338 = fsub float %335, %337
  %339 = fadd float %295, %336
  %340 = fsub float %339, %295
  %341 = fsub float %339, %340
  %342 = fsub float %295, %341
  %343 = fsub float %336, %340
  %344 = fadd float %343, %342
  %345 = fadd float %297, %338
  %346 = fsub float %345, %297
  %347 = fsub float %345, %346
  %348 = fsub float %297, %347
  %349 = fsub float %338, %346
  %350 = fadd float %349, %348
  %351 = fadd float %345, %344
  %352 = fadd float %339, %351
  %353 = fsub float %352, %339
  %354 = fsub float %351, %353
  %355 = fadd float %350, %354
  %356 = fadd float %352, %355
  %357 = fsub float %356, %352
  %358 = fsub float %355, %357
  %359 = fmul float %26, %356
  %360 = fneg float %359
  %361 = tail call float @llvm.fma.f32(float %26, float %356, float %360)
  %362 = tail call float @llvm.fma.f32(float %26, float %358, float %361)
  %363 = fadd float %359, %362
  %364 = fsub float %363, %359
  %365 = fsub float %362, %364
  %366 = tail call float @llvm.fabs.f32(float %359) #3
  %367 = fcmp oeq float %366, 0x7FF0000000000000
  %368 = select i1 %367, float %359, float %363
  %369 = tail call float @llvm.fabs.f32(float %368) #3
  %370 = fcmp oeq float %369, 0x7FF0000000000000
  %371 = select i1 %370, float 0.000000e+00, float %365
  %372 = fcmp oeq float %368, 0x40562E4300000000
  %373 = select i1 %372, float 0x3EE0000000000000, float 0.000000e+00
  %374 = fsub float %368, %373
  %375 = fadd float %373, %371
  %376 = fmul float %374, 0x3FF7154760000000
  %377 = tail call float @llvm.rint.f32(float %376)
  %378 = fcmp ogt float %374, 0x40562E4300000000
  %379 = fcmp olt float %374, 0xC059D1DA00000000
  %380 = fneg float %376
  %381 = tail call float @llvm.fma.f32(float %374, float 0x3FF7154760000000, float %380)
  %382 = tail call float @llvm.fma.f32(float %374, float 0x3E54AE0BE0000000, float %381)
  %383 = fsub float %376, %377
  %384 = fadd float %382, %383
  %385 = tail call float @llvm.exp2.f32(float %384)
  %386 = fptosi float %377 to i32
  %387 = tail call float @llvm.amdgcn.ldexp.f32(float %385, i32 %386)
  %388 = select i1 %379, float 0.000000e+00, float %387
  %389 = select i1 %378, float 0x7FF0000000000000, float %388
  %390 = tail call float @llvm.fma.f32(float %389, float %375, float %389)
  %391 = tail call float @llvm.fabs.f32(float %389) #3
  %392 = fcmp oeq float %391, 0x7FF0000000000000
  %393 = select i1 %392, float %389, float %390
  %394 = fcmp olt float %250, 0.000000e+00
  %395 = and i1 %172, %394
  %396 = select i1 %395, float -0.000000e+00, float 0.000000e+00
  %397 = tail call float @llvm.copysign.f32(float %393, float %396)
  %398 = fcmp uge float %250, 0.000000e+00
  %399 = select i1 %398, i1 true, i1 %173
  %400 = select i1 %399, float %397, float 0x7FF8000000000000
  br label %401

401:                                              ; preds = %213, %175
  %402 = phi float [ %251, %213 ], [ %204, %175 ]
  %403 = phi float [ %250, %213 ], [ %203, %175 ]
  %404 = phi i1 [ %243, %213 ], [ %196, %175 ]
  %405 = phi i1 [ %234, %213 ], [ %187, %175 ]
  %406 = phi float [ %400, %213 ], [ %212, %175 ]
  %407 = getelementptr inbounds float, float addrspace(1)* %3, i64 %21
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !7
  %409 = fcmp oeq float %402, 0x7FF0000000000000
  %410 = fcmp oeq float %403, 0.000000e+00
  %411 = or i1 %410, %409
  %412 = xor i1 %405, %410
  %413 = select i1 %412, float 0.000000e+00, float 0x7FF0000000000000
  %414 = select i1 %172, float %403, float 0.000000e+00
  %415 = tail call float @llvm.copysign.f32(float %413, float %414)
  %416 = select i1 %411, float %415, float %406
  %417 = fcmp uno float %403, %26
  %418 = select i1 %417, float 0x7FF8000000000000, float %416
  %419 = fcmp oeq float %403, 1.000000e+00
  %420 = or i1 %404, %419
  %421 = select i1 %420, float 1.000000e+00, float %418
  %422 = fadd contract float %421, %8
  %423 = fdiv contract float %408, %422
  %424 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  store float %423, float addrspace(1)* %424, align 4, !tbaa !7
  br label %425

425:                                              ; preds = %9, %401
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
