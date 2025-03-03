; ModuleID = '../data/hip_kernels/5473/13/main.cu'
source_filename = "../data/hip_kernels/5473/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11adam_kerneliPfS_S_ffffi(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, float %5, float %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %10
  %27 = mul i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %0
  br i1 %30, label %31, label %453

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !14
  %35 = sitofp i32 %8 to float
  %36 = tail call float @llvm.fabs.f32(float %4)
  %37 = tail call float @llvm.amdgcn.frexp.mant.f32(float %36)
  %38 = fcmp olt float %37, 0x3FE5555560000000
  %39 = zext i1 %38 to i32
  %40 = tail call float @llvm.amdgcn.ldexp.f32(float %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %36)
  %42 = sub nsw i32 %41, %39
  %43 = fadd float %40, -1.000000e+00
  %44 = fadd float %40, 1.000000e+00
  %45 = fadd float %44, -1.000000e+00
  %46 = fsub float %40, %45
  %47 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %48 = fmul float %43, %47
  %49 = fmul float %44, %48
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %48, float %44, float %50)
  %52 = tail call float @llvm.fma.f32(float %48, float %46, float %51)
  %53 = fadd float %49, %52
  %54 = fsub float %53, %49
  %55 = fsub float %52, %54
  %56 = fsub float %43, %53
  %57 = fsub float %43, %56
  %58 = fsub float %57, %53
  %59 = fsub float %58, %55
  %60 = fadd float %56, %59
  %61 = fmul float %47, %60
  %62 = fadd float %48, %61
  %63 = fsub float %62, %48
  %64 = fsub float %61, %63
  %65 = fmul float %62, %62
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %62, float %62, float %66)
  %68 = fmul float %64, 2.000000e+00
  %69 = tail call float @llvm.fma.f32(float %62, float %68, float %67)
  %70 = fadd float %65, %69
  %71 = fsub float %70, %65
  %72 = fsub float %69, %71
  %73 = tail call float @llvm.fmuladd.f32(float %70, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %74 = tail call float @llvm.fmuladd.f32(float %70, float %73, float 0x3FD999BDE0000000)
  %75 = sitofp i32 %42 to float
  %76 = fmul float %75, 0x3FE62E4300000000
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %75, float 0x3FE62E4300000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %75, float 0xBE205C6100000000, float %78)
  %80 = fadd float %76, %79
  %81 = fsub float %80, %76
  %82 = fsub float %79, %81
  %83 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 1)
  %84 = fmul float %62, %70
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %70, float %62, float %85)
  %87 = tail call float @llvm.fma.f32(float %70, float %64, float %86)
  %88 = tail call float @llvm.fma.f32(float %72, float %62, float %87)
  %89 = fadd float %84, %88
  %90 = fsub float %89, %84
  %91 = fsub float %88, %90
  %92 = fmul float %70, %74
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %70, float %74, float %93)
  %95 = tail call float @llvm.fma.f32(float %72, float %74, float %94)
  %96 = fadd float %92, %95
  %97 = fsub float %96, %92
  %98 = fsub float %95, %97
  %99 = fadd float %96, 0x3FE5555540000000
  %100 = fadd float %99, 0xBFE5555540000000
  %101 = fsub float %96, %100
  %102 = fadd float %98, 0x3E2E720200000000
  %103 = fadd float %102, %101
  %104 = fadd float %99, %103
  %105 = fsub float %104, %99
  %106 = fsub float %103, %105
  %107 = fmul float %89, %104
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %89, float %104, float %108)
  %110 = tail call float @llvm.fma.f32(float %89, float %106, float %109)
  %111 = tail call float @llvm.fma.f32(float %91, float %104, float %110)
  %112 = tail call float @llvm.amdgcn.ldexp.f32(float %64, i32 1)
  %113 = fadd float %107, %111
  %114 = fsub float %113, %107
  %115 = fsub float %111, %114
  %116 = fadd float %83, %113
  %117 = fsub float %116, %83
  %118 = fsub float %113, %117
  %119 = fadd float %112, %115
  %120 = fadd float %119, %118
  %121 = fadd float %116, %120
  %122 = fsub float %121, %116
  %123 = fsub float %120, %122
  %124 = fadd float %80, %121
  %125 = fsub float %124, %80
  %126 = fsub float %124, %125
  %127 = fsub float %80, %126
  %128 = fsub float %121, %125
  %129 = fadd float %128, %127
  %130 = fadd float %82, %123
  %131 = fsub float %130, %82
  %132 = fsub float %130, %131
  %133 = fsub float %82, %132
  %134 = fsub float %123, %131
  %135 = fadd float %134, %133
  %136 = fadd float %130, %129
  %137 = fadd float %124, %136
  %138 = fsub float %137, %124
  %139 = fsub float %136, %138
  %140 = fadd float %135, %139
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = fmul float %141, %35
  %145 = fneg float %144
  %146 = tail call float @llvm.fma.f32(float %35, float %141, float %145)
  %147 = tail call float @llvm.fma.f32(float %35, float %143, float %146)
  %148 = fadd float %144, %147
  %149 = tail call float @llvm.fabs.f32(float %144) #3
  %150 = fcmp oeq float %149, 0x7FF0000000000000
  %151 = select i1 %150, float %144, float %148
  %152 = fcmp oeq float %151, 0x40562E4300000000
  %153 = select i1 %152, float 0x3EE0000000000000, float 0.000000e+00
  %154 = fsub float %151, %153
  %155 = fmul float %154, 0x3FF7154760000000
  %156 = tail call float @llvm.rint.f32(float %155)
  %157 = fcmp ogt float %154, 0x40562E4300000000
  %158 = fcmp olt float %154, 0xC059D1DA00000000
  %159 = fneg float %155
  %160 = tail call float @llvm.fma.f32(float %154, float 0x3FF7154760000000, float %159)
  %161 = tail call float @llvm.fma.f32(float %154, float 0x3E54AE0BE0000000, float %160)
  %162 = fsub float %155, %156
  %163 = fadd float %161, %162
  %164 = tail call float @llvm.exp2.f32(float %163)
  %165 = fptosi float %156 to i32
  %166 = tail call float @llvm.amdgcn.ldexp.f32(float %164, i32 %165)
  %167 = select i1 %158, float 0.000000e+00, float %166
  %168 = select i1 %157, float 0x7FF0000000000000, float %167
  %169 = tail call float @llvm.fabs.f32(float %35)
  %170 = tail call float @llvm.trunc.f32(float %169)
  %171 = fcmp oeq float %169, %170
  %172 = zext i1 %171 to i32
  %173 = fmul float %170, 5.000000e-01
  %174 = tail call float @llvm.amdgcn.fract.f32(float %173)
  %175 = tail call i1 @llvm.amdgcn.class.f32(float %173, i32 516)
  %176 = select i1 %175, float 0.000000e+00, float %174
  %177 = fcmp oeq float %176, 0.000000e+00
  %178 = and i1 %171, %177
  %179 = zext i1 %178 to i32
  %180 = add nuw nsw i32 %179, %172
  %181 = icmp eq i32 %180, 1
  %182 = icmp ne i32 %180, 0
  %183 = fcmp oeq float %169, 0x7FF0000000000000
  br i1 %183, label %184, label %218

184:                                              ; preds = %31
  %185 = fcmp oeq float %36, 1.000000e+00
  %186 = fadd float %36, -1.000000e+00
  %187 = bitcast float %35 to i32
  %188 = bitcast float %186 to i32
  %189 = xor i32 %187, %188
  %190 = icmp sgt i32 %189, -1
  %191 = select i1 %190, float 0x7FF0000000000000, float 0.000000e+00
  %192 = select i1 %185, float %36, float %191
  %193 = fcmp oeq float %36, 0x7FF0000000000000
  %194 = fcmp oeq float %4, 0.000000e+00
  %195 = or i1 %194, %193
  %196 = icmp slt i32 %8, 0
  %197 = xor i1 %194, %196
  %198 = select i1 %197, float 0.000000e+00, float 0x7FF0000000000000
  %199 = select i1 %181, float %4, float 0.000000e+00
  %200 = tail call float @llvm.copysign.f32(float %198, float %199)
  %201 = select i1 %195, float %200, float %192
  %202 = fcmp uno float %4, 0.000000e+00
  %203 = fcmp oeq float %4, 1.000000e+00
  %204 = icmp eq i32 %8, 0
  %205 = or i1 %203, %204
  %206 = fsub contract float 1.000000e+00, %201
  %207 = select i1 %202, float 0x7FF8000000000000, float %206
  %208 = select i1 %205, float 0.000000e+00, float %207
  %209 = tail call float @llvm.fabs.f32(float %5)
  %210 = fcmp oeq float %209, 1.000000e+00
  %211 = fadd float %209, -1.000000e+00
  %212 = bitcast float %35 to i32
  %213 = bitcast float %211 to i32
  %214 = xor i32 %212, %213
  %215 = icmp sgt i32 %214, -1
  %216 = select i1 %215, float 0x7FF0000000000000, float 0.000000e+00
  %217 = select i1 %210, float %209, float %216
  br label %402

218:                                              ; preds = %31
  %219 = fcmp uge float %4, 0.000000e+00
  %220 = select i1 %219, i1 true, i1 %182
  %221 = tail call float @llvm.fabs.f32(float %168) #3
  %222 = fcmp oeq float %221, 0x7FF0000000000000
  %223 = tail call float @llvm.fabs.f32(float %151) #3
  %224 = fcmp oeq float %223, 0x7FF0000000000000
  %225 = fsub float %148, %144
  %226 = fsub float %147, %225
  %227 = select i1 %224, float 0.000000e+00, float %226
  %228 = fadd float %153, %227
  %229 = tail call float @llvm.fma.f32(float %168, float %228, float %168)
  %230 = select i1 %222, float %168, float %229
  %231 = fcmp olt float %4, 0.000000e+00
  %232 = and i1 %231, %181
  %233 = select i1 %232, float -0.000000e+00, float 0.000000e+00
  %234 = tail call float @llvm.copysign.f32(float %230, float %233)
  %235 = select i1 %220, float %234, float 0x7FF8000000000000
  %236 = fcmp oeq float %36, 0x7FF0000000000000
  %237 = fcmp oeq float %4, 0.000000e+00
  %238 = or i1 %237, %236
  %239 = icmp slt i32 %8, 0
  %240 = xor i1 %237, %239
  %241 = select i1 %240, float 0.000000e+00, float 0x7FF0000000000000
  %242 = select i1 %181, float %4, float 0.000000e+00
  %243 = tail call float @llvm.copysign.f32(float %241, float %242)
  %244 = select i1 %238, float %243, float %235
  %245 = fcmp uno float %4, 0.000000e+00
  %246 = fcmp oeq float %4, 1.000000e+00
  %247 = icmp eq i32 %8, 0
  %248 = or i1 %246, %247
  %249 = fsub contract float 1.000000e+00, %244
  %250 = select i1 %245, float 0x7FF8000000000000, float %249
  %251 = select i1 %248, float 0.000000e+00, float %250
  %252 = tail call float @llvm.fabs.f32(float %5)
  %253 = tail call float @llvm.amdgcn.frexp.mant.f32(float %252)
  %254 = fcmp olt float %253, 0x3FE5555560000000
  %255 = zext i1 %254 to i32
  %256 = tail call float @llvm.amdgcn.ldexp.f32(float %253, i32 %255)
  %257 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %252)
  %258 = sub nsw i32 %257, %255
  %259 = fadd float %256, -1.000000e+00
  %260 = fadd float %256, 1.000000e+00
  %261 = fadd float %260, -1.000000e+00
  %262 = fsub float %256, %261
  %263 = tail call float @llvm.amdgcn.rcp.f32(float %260)
  %264 = fmul float %259, %263
  %265 = fmul float %260, %264
  %266 = fneg float %265
  %267 = tail call float @llvm.fma.f32(float %264, float %260, float %266)
  %268 = tail call float @llvm.fma.f32(float %264, float %262, float %267)
  %269 = fadd float %265, %268
  %270 = fsub float %269, %265
  %271 = fsub float %268, %270
  %272 = fsub float %259, %269
  %273 = fsub float %259, %272
  %274 = fsub float %273, %269
  %275 = fsub float %274, %271
  %276 = fadd float %272, %275
  %277 = fmul float %263, %276
  %278 = fadd float %264, %277
  %279 = fsub float %278, %264
  %280 = fsub float %277, %279
  %281 = fmul float %278, %278
  %282 = fneg float %281
  %283 = tail call float @llvm.fma.f32(float %278, float %278, float %282)
  %284 = fmul float %280, 2.000000e+00
  %285 = tail call float @llvm.fma.f32(float %278, float %284, float %283)
  %286 = fadd float %281, %285
  %287 = fsub float %286, %281
  %288 = fsub float %285, %287
  %289 = tail call float @llvm.fmuladd.f32(float %286, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %290 = tail call float @llvm.fmuladd.f32(float %286, float %289, float 0x3FD999BDE0000000)
  %291 = sitofp i32 %258 to float
  %292 = fmul float %291, 0x3FE62E4300000000
  %293 = fneg float %292
  %294 = tail call float @llvm.fma.f32(float %291, float 0x3FE62E4300000000, float %293)
  %295 = tail call float @llvm.fma.f32(float %291, float 0xBE205C6100000000, float %294)
  %296 = fadd float %292, %295
  %297 = fsub float %296, %292
  %298 = fsub float %295, %297
  %299 = tail call float @llvm.amdgcn.ldexp.f32(float %278, i32 1)
  %300 = fmul float %278, %286
  %301 = fneg float %300
  %302 = tail call float @llvm.fma.f32(float %286, float %278, float %301)
  %303 = tail call float @llvm.fma.f32(float %286, float %280, float %302)
  %304 = tail call float @llvm.fma.f32(float %288, float %278, float %303)
  %305 = fadd float %300, %304
  %306 = fsub float %305, %300
  %307 = fsub float %304, %306
  %308 = fmul float %286, %290
  %309 = fneg float %308
  %310 = tail call float @llvm.fma.f32(float %286, float %290, float %309)
  %311 = tail call float @llvm.fma.f32(float %288, float %290, float %310)
  %312 = fadd float %308, %311
  %313 = fsub float %312, %308
  %314 = fsub float %311, %313
  %315 = fadd float %312, 0x3FE5555540000000
  %316 = fadd float %315, 0xBFE5555540000000
  %317 = fsub float %312, %316
  %318 = fadd float %314, 0x3E2E720200000000
  %319 = fadd float %318, %317
  %320 = fadd float %315, %319
  %321 = fsub float %320, %315
  %322 = fsub float %319, %321
  %323 = fmul float %305, %320
  %324 = fneg float %323
  %325 = tail call float @llvm.fma.f32(float %305, float %320, float %324)
  %326 = tail call float @llvm.fma.f32(float %305, float %322, float %325)
  %327 = tail call float @llvm.fma.f32(float %307, float %320, float %326)
  %328 = tail call float @llvm.amdgcn.ldexp.f32(float %280, i32 1)
  %329 = fadd float %323, %327
  %330 = fsub float %329, %323
  %331 = fsub float %327, %330
  %332 = fadd float %299, %329
  %333 = fsub float %332, %299
  %334 = fsub float %329, %333
  %335 = fadd float %328, %331
  %336 = fadd float %335, %334
  %337 = fadd float %332, %336
  %338 = fsub float %337, %332
  %339 = fsub float %336, %338
  %340 = fadd float %296, %337
  %341 = fsub float %340, %296
  %342 = fsub float %340, %341
  %343 = fsub float %296, %342
  %344 = fsub float %337, %341
  %345 = fadd float %344, %343
  %346 = fadd float %298, %339
  %347 = fsub float %346, %298
  %348 = fsub float %346, %347
  %349 = fsub float %298, %348
  %350 = fsub float %339, %347
  %351 = fadd float %350, %349
  %352 = fadd float %346, %345
  %353 = fadd float %340, %352
  %354 = fsub float %353, %340
  %355 = fsub float %352, %354
  %356 = fadd float %351, %355
  %357 = fadd float %353, %356
  %358 = fsub float %357, %353
  %359 = fsub float %356, %358
  %360 = fmul float %357, %35
  %361 = fneg float %360
  %362 = tail call float @llvm.fma.f32(float %35, float %357, float %361)
  %363 = tail call float @llvm.fma.f32(float %35, float %359, float %362)
  %364 = fadd float %360, %363
  %365 = fsub float %364, %360
  %366 = fsub float %363, %365
  %367 = tail call float @llvm.fabs.f32(float %360) #3
  %368 = fcmp oeq float %367, 0x7FF0000000000000
  %369 = select i1 %368, float %360, float %364
  %370 = tail call float @llvm.fabs.f32(float %369) #3
  %371 = fcmp oeq float %370, 0x7FF0000000000000
  %372 = select i1 %371, float 0.000000e+00, float %366
  %373 = fcmp oeq float %369, 0x40562E4300000000
  %374 = select i1 %373, float 0x3EE0000000000000, float 0.000000e+00
  %375 = fsub float %369, %374
  %376 = fadd float %374, %372
  %377 = fmul float %375, 0x3FF7154760000000
  %378 = tail call float @llvm.rint.f32(float %377)
  %379 = fcmp ogt float %375, 0x40562E4300000000
  %380 = fcmp olt float %375, 0xC059D1DA00000000
  %381 = fneg float %377
  %382 = tail call float @llvm.fma.f32(float %375, float 0x3FF7154760000000, float %381)
  %383 = tail call float @llvm.fma.f32(float %375, float 0x3E54AE0BE0000000, float %382)
  %384 = fsub float %377, %378
  %385 = fadd float %383, %384
  %386 = tail call float @llvm.exp2.f32(float %385)
  %387 = fptosi float %378 to i32
  %388 = tail call float @llvm.amdgcn.ldexp.f32(float %386, i32 %387)
  %389 = select i1 %380, float 0.000000e+00, float %388
  %390 = select i1 %379, float 0x7FF0000000000000, float %389
  %391 = tail call float @llvm.fma.f32(float %390, float %376, float %390)
  %392 = tail call float @llvm.fabs.f32(float %390) #3
  %393 = fcmp oeq float %392, 0x7FF0000000000000
  %394 = select i1 %393, float %390, float %391
  %395 = fcmp olt float %5, 0.000000e+00
  %396 = and i1 %395, %181
  %397 = select i1 %396, float -0.000000e+00, float 0.000000e+00
  %398 = tail call float @llvm.copysign.f32(float %394, float %397)
  %399 = fcmp uge float %5, 0.000000e+00
  %400 = select i1 %399, i1 true, i1 %182
  %401 = select i1 %400, float %398, float 0x7FF8000000000000
  br label %402

402:                                              ; preds = %218, %184
  %403 = phi float [ %252, %218 ], [ %209, %184 ]
  %404 = phi float [ %251, %218 ], [ %208, %184 ]
  %405 = phi i1 [ %247, %218 ], [ %204, %184 ]
  %406 = phi i1 [ %239, %218 ], [ %196, %184 ]
  %407 = phi float [ %401, %218 ], [ %217, %184 ]
  %408 = fdiv contract float %34, %404
  %409 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !16
  %411 = fcmp oeq float %403, 0x7FF0000000000000
  %412 = fcmp oeq float %5, 0.000000e+00
  %413 = or i1 %412, %411
  %414 = xor i1 %412, %406
  %415 = select i1 %414, float 0.000000e+00, float 0x7FF0000000000000
  %416 = select i1 %181, float %5, float 0.000000e+00
  %417 = tail call float @llvm.copysign.f32(float %415, float %416)
  %418 = select i1 %413, float %417, float %407
  %419 = fcmp uno float %5, 0.000000e+00
  %420 = fcmp oeq float %5, 1.000000e+00
  %421 = or i1 %420, %405
  %422 = fsub contract float 1.000000e+00, %418
  %423 = select i1 %419, float 0x7FF8000000000000, float %422
  %424 = select i1 %421, float 0.000000e+00, float %423
  %425 = fdiv contract float %410, %424
  %426 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !16, !amdgpu.noclobber !14
  %428 = fmul contract float %408, %6
  %429 = fcmp olt float %425, 0x39F0000000000000
  %430 = select i1 %429, float 0x41F0000000000000, float 1.000000e+00
  %431 = fmul float %425, %430
  %432 = tail call float @llvm.sqrt.f32(float %431)
  %433 = bitcast float %432 to i32
  %434 = add nsw i32 %433, -1
  %435 = bitcast i32 %434 to float
  %436 = add nsw i32 %433, 1
  %437 = bitcast i32 %436 to float
  %438 = tail call i1 @llvm.amdgcn.class.f32(float %431, i32 608)
  %439 = select i1 %429, float 0x3EF0000000000000, float 1.000000e+00
  %440 = fneg float %437
  %441 = tail call float @llvm.fma.f32(float %440, float %432, float %431)
  %442 = fcmp ogt float %441, 0.000000e+00
  %443 = fneg float %435
  %444 = tail call float @llvm.fma.f32(float %443, float %432, float %431)
  %445 = fcmp ole float %444, 0.000000e+00
  %446 = select i1 %445, float %435, float %432
  %447 = select i1 %442, float %437, float %446
  %448 = fmul float %439, %447
  %449 = select i1 %438, float %431, float %448
  %450 = fadd contract float %449, %7
  %451 = fdiv contract float %428, %450
  %452 = fadd contract float %427, %451
  store float %452, float addrspace(1)* %426, align 4, !tbaa !16
  br label %453

453:                                              ; preds = %9, %402
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
