; ModuleID = '../data/hip_kernels/10483/2/main.cu'
source_filename = "../data/hip_kernels/10483/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9expPVPathififfffffPKfS0_S0_Pf(i32 %0, float %1, i32 %2, float %3, float %4, float %5, float %6, float %7, float %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp ult i32 %22, %0
  br i1 %23, label %24, label %404

24:                                               ; preds = %13
  %25 = icmp sgt i32 %2, 0
  br i1 %25, label %26, label %257

26:                                               ; preds = %24
  %27 = fadd contract float %1, 1.000000e+00
  %28 = tail call float @llvm.fabs.f32(float %27)
  %29 = tail call float @llvm.amdgcn.frexp.mant.f32(float %28)
  %30 = fcmp olt float %29, 0x3FE5555560000000
  %31 = zext i1 %30 to i32
  %32 = tail call float @llvm.amdgcn.ldexp.f32(float %29, i32 %31)
  %33 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %28)
  %34 = sub nsw i32 %33, %31
  %35 = fadd float %32, -1.000000e+00
  %36 = fadd float %32, 1.000000e+00
  %37 = fadd float %36, -1.000000e+00
  %38 = fsub float %32, %37
  %39 = tail call float @llvm.amdgcn.rcp.f32(float %36)
  %40 = fmul float %35, %39
  %41 = fmul float %36, %40
  %42 = fneg float %41
  %43 = tail call float @llvm.fma.f32(float %40, float %36, float %42)
  %44 = tail call float @llvm.fma.f32(float %40, float %38, float %43)
  %45 = fadd float %41, %44
  %46 = fsub float %45, %41
  %47 = fsub float %44, %46
  %48 = fsub float %35, %45
  %49 = fsub float %35, %48
  %50 = fsub float %49, %45
  %51 = fsub float %50, %47
  %52 = fadd float %48, %51
  %53 = fmul float %39, %52
  %54 = fadd float %40, %53
  %55 = fsub float %54, %40
  %56 = fsub float %53, %55
  %57 = fmul float %54, %54
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %54, float %54, float %58)
  %60 = fmul float %56, 2.000000e+00
  %61 = tail call float @llvm.fma.f32(float %54, float %60, float %59)
  %62 = fadd float %57, %61
  %63 = fsub float %62, %57
  %64 = fsub float %61, %63
  %65 = tail call float @llvm.fmuladd.f32(float %62, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %66 = tail call float @llvm.fmuladd.f32(float %62, float %65, float 0x3FD999BDE0000000)
  %67 = sitofp i32 %34 to float
  %68 = fmul float %67, 0x3FE62E4300000000
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %67, float 0x3FE62E4300000000, float %69)
  %71 = tail call float @llvm.fma.f32(float %67, float 0xBE205C6100000000, float %70)
  %72 = fadd float %68, %71
  %73 = fsub float %72, %68
  %74 = fsub float %71, %73
  %75 = tail call float @llvm.amdgcn.ldexp.f32(float %54, i32 1)
  %76 = fmul float %54, %62
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %62, float %54, float %77)
  %79 = tail call float @llvm.fma.f32(float %62, float %56, float %78)
  %80 = tail call float @llvm.fma.f32(float %64, float %54, float %79)
  %81 = fadd float %76, %80
  %82 = fsub float %81, %76
  %83 = fsub float %80, %82
  %84 = fmul float %62, %66
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %62, float %66, float %85)
  %87 = tail call float @llvm.fma.f32(float %64, float %66, float %86)
  %88 = fadd float %84, %87
  %89 = fsub float %88, %84
  %90 = fsub float %87, %89
  %91 = fadd float %88, 0x3FE5555540000000
  %92 = fadd float %91, 0xBFE5555540000000
  %93 = fsub float %88, %92
  %94 = fadd float %90, 0x3E2E720200000000
  %95 = fadd float %94, %93
  %96 = fadd float %91, %95
  %97 = fsub float %96, %91
  %98 = fsub float %95, %97
  %99 = fmul float %81, %96
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %81, float %96, float %100)
  %102 = tail call float @llvm.fma.f32(float %81, float %98, float %101)
  %103 = tail call float @llvm.fma.f32(float %83, float %96, float %102)
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %56, i32 1)
  %105 = fadd float %99, %103
  %106 = fsub float %105, %99
  %107 = fsub float %103, %106
  %108 = fadd float %75, %105
  %109 = fsub float %108, %75
  %110 = fsub float %105, %109
  %111 = fadd float %104, %107
  %112 = fadd float %111, %110
  %113 = fadd float %108, %112
  %114 = fsub float %113, %108
  %115 = fsub float %112, %114
  %116 = fadd float %72, %113
  %117 = fsub float %116, %72
  %118 = fsub float %116, %117
  %119 = fsub float %72, %118
  %120 = fsub float %113, %117
  %121 = fadd float %120, %119
  %122 = fadd float %74, %115
  %123 = fsub float %122, %74
  %124 = fsub float %122, %123
  %125 = fsub float %74, %124
  %126 = fsub float %115, %123
  %127 = fadd float %126, %125
  %128 = fadd float %122, %121
  %129 = fadd float %116, %128
  %130 = fsub float %129, %116
  %131 = fsub float %128, %130
  %132 = fadd float %127, %131
  %133 = fadd float %129, %132
  %134 = fsub float %133, %129
  %135 = fsub float %132, %134
  %136 = fcmp uge float %27, 0.000000e+00
  %137 = fcmp oeq float %28, 0x7FF0000000000000
  %138 = fcmp oeq float %27, 0.000000e+00
  %139 = or i1 %138, %137
  %140 = select i1 %138, float 0.000000e+00, float 0x7FF0000000000000
  %141 = fcmp uno float %27, 0.000000e+00
  %142 = fadd contract float %5, 1.000000e+00
  %143 = tail call float @llvm.fabs.f32(float %142)
  %144 = tail call float @llvm.amdgcn.frexp.mant.f32(float %143)
  %145 = fcmp olt float %144, 0x3FE5555560000000
  %146 = zext i1 %145 to i32
  %147 = tail call float @llvm.amdgcn.ldexp.f32(float %144, i32 %146)
  %148 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %143)
  %149 = sub nsw i32 %148, %146
  %150 = fadd float %147, -1.000000e+00
  %151 = fadd float %147, 1.000000e+00
  %152 = fadd float %151, -1.000000e+00
  %153 = fsub float %147, %152
  %154 = tail call float @llvm.amdgcn.rcp.f32(float %151)
  %155 = fmul float %150, %154
  %156 = fmul float %151, %155
  %157 = fneg float %156
  %158 = tail call float @llvm.fma.f32(float %155, float %151, float %157)
  %159 = tail call float @llvm.fma.f32(float %155, float %153, float %158)
  %160 = fadd float %156, %159
  %161 = fsub float %160, %156
  %162 = fsub float %159, %161
  %163 = fsub float %150, %160
  %164 = fsub float %150, %163
  %165 = fsub float %164, %160
  %166 = fsub float %165, %162
  %167 = fadd float %163, %166
  %168 = fmul float %154, %167
  %169 = fadd float %155, %168
  %170 = fsub float %169, %155
  %171 = fsub float %168, %170
  %172 = fmul float %169, %169
  %173 = fneg float %172
  %174 = tail call float @llvm.fma.f32(float %169, float %169, float %173)
  %175 = fmul float %171, 2.000000e+00
  %176 = tail call float @llvm.fma.f32(float %169, float %175, float %174)
  %177 = fadd float %172, %176
  %178 = fsub float %177, %172
  %179 = fsub float %176, %178
  %180 = tail call float @llvm.fmuladd.f32(float %177, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %181 = tail call float @llvm.fmuladd.f32(float %177, float %180, float 0x3FD999BDE0000000)
  %182 = sitofp i32 %149 to float
  %183 = fmul float %182, 0x3FE62E4300000000
  %184 = fneg float %183
  %185 = tail call float @llvm.fma.f32(float %182, float 0x3FE62E4300000000, float %184)
  %186 = tail call float @llvm.fma.f32(float %182, float 0xBE205C6100000000, float %185)
  %187 = fadd float %183, %186
  %188 = fsub float %187, %183
  %189 = fsub float %186, %188
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %169, i32 1)
  %191 = fmul float %169, %177
  %192 = fneg float %191
  %193 = tail call float @llvm.fma.f32(float %177, float %169, float %192)
  %194 = tail call float @llvm.fma.f32(float %177, float %171, float %193)
  %195 = tail call float @llvm.fma.f32(float %179, float %169, float %194)
  %196 = fadd float %191, %195
  %197 = fsub float %196, %191
  %198 = fsub float %195, %197
  %199 = fmul float %177, %181
  %200 = fneg float %199
  %201 = tail call float @llvm.fma.f32(float %177, float %181, float %200)
  %202 = tail call float @llvm.fma.f32(float %179, float %181, float %201)
  %203 = fadd float %199, %202
  %204 = fsub float %203, %199
  %205 = fsub float %202, %204
  %206 = fadd float %203, 0x3FE5555540000000
  %207 = fadd float %206, 0xBFE5555540000000
  %208 = fsub float %203, %207
  %209 = fadd float %205, 0x3E2E720200000000
  %210 = fadd float %209, %208
  %211 = fadd float %206, %210
  %212 = fsub float %211, %206
  %213 = fsub float %210, %212
  %214 = fmul float %196, %211
  %215 = fneg float %214
  %216 = tail call float @llvm.fma.f32(float %196, float %211, float %215)
  %217 = tail call float @llvm.fma.f32(float %196, float %213, float %216)
  %218 = tail call float @llvm.fma.f32(float %198, float %211, float %217)
  %219 = tail call float @llvm.amdgcn.ldexp.f32(float %171, i32 1)
  %220 = fadd float %214, %218
  %221 = fsub float %220, %214
  %222 = fsub float %218, %221
  %223 = fadd float %190, %220
  %224 = fsub float %223, %190
  %225 = fsub float %220, %224
  %226 = fadd float %219, %222
  %227 = fadd float %226, %225
  %228 = fadd float %223, %227
  %229 = fsub float %228, %223
  %230 = fsub float %227, %229
  %231 = fadd float %187, %228
  %232 = fsub float %231, %187
  %233 = fsub float %231, %232
  %234 = fsub float %187, %233
  %235 = fsub float %228, %232
  %236 = fadd float %235, %234
  %237 = fadd float %189, %230
  %238 = fsub float %237, %189
  %239 = fsub float %237, %238
  %240 = fsub float %189, %239
  %241 = fsub float %230, %238
  %242 = fadd float %241, %240
  %243 = fadd float %237, %236
  %244 = fadd float %231, %243
  %245 = fsub float %244, %231
  %246 = fsub float %243, %245
  %247 = fadd float %242, %246
  %248 = fadd float %244, %247
  %249 = fsub float %248, %244
  %250 = fsub float %247, %249
  %251 = fcmp uge float %142, 0.000000e+00
  %252 = fcmp oeq float %143, 0x7FF0000000000000
  %253 = fcmp oeq float %142, 0.000000e+00
  %254 = or i1 %253, %252
  %255 = select i1 %253, float 0.000000e+00, float 0x7FF0000000000000
  %256 = fcmp uno float %142, 0.000000e+00
  br label %261

257:                                              ; preds = %261, %24
  %258 = phi float [ 0.000000e+00, %24 ], [ %401, %261 ]
  %259 = zext i32 %22 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %12, i64 %259
  store float %258, float addrspace(1)* %260, align 4, !tbaa !7
  br label %404

261:                                              ; preds = %26, %261
  %262 = phi float [ 0.000000e+00, %26 ], [ %401, %261 ]
  %263 = phi i32 [ 0, %26 ], [ %402, %261 ]
  %264 = phi float [ %6, %26 ], [ %298, %261 ]
  %265 = add i32 %263, %22
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %11, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !7, !amdgpu.noclobber !5
  %269 = fcmp contract olt float %268, %8
  %270 = select contract i1 %269, float 1.000000e+00, float 0.000000e+00
  %271 = fsub contract float %3, %264
  %272 = fmul contract float %271, %7
  %273 = fmul contract float %272, %4
  %274 = getelementptr inbounds float, float addrspace(1)* %9, i64 %266
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !7, !amdgpu.noclobber !5
  %276 = fmul contract float %264, %275
  %277 = fadd contract float %273, %276
  %278 = getelementptr inbounds float, float addrspace(1)* %10, i64 %266
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7, !amdgpu.noclobber !5
  %280 = fmul float %279, 0x3FF7154760000000
  %281 = tail call float @llvm.rint.f32(float %280)
  %282 = fcmp ogt float %279, 0x40562E4300000000
  %283 = fcmp olt float %279, 0xC059D1DA00000000
  %284 = fneg float %280
  %285 = tail call float @llvm.fma.f32(float %279, float 0x3FF7154760000000, float %284)
  %286 = tail call float @llvm.fma.f32(float %279, float 0x3E54AE0BE0000000, float %285)
  %287 = fsub float %280, %281
  %288 = fadd float %286, %287
  %289 = tail call float @llvm.exp2.f32(float %288)
  %290 = fptosi float %281 to i32
  %291 = tail call float @llvm.amdgcn.ldexp.f32(float %289, i32 %290)
  %292 = fadd contract float %291, -1.000000e+00
  %293 = select i1 %283, float -1.000000e+00, float %292
  %294 = select i1 %282, float 0x7FF0000000000000, float %293
  %295 = fmul contract float %264, %294
  %296 = fmul contract float %270, %295
  %297 = fadd contract float %277, %296
  %298 = fadd contract float %264, %297
  %299 = and i32 %263, 2147418112
  %300 = sitofp i32 %299 to float
  %301 = and i32 %263, 65535
  %302 = sitofp i32 %301 to float
  %303 = fadd float %300, %302
  %304 = fsub float %300, %303
  %305 = fadd float %304, %302
  %306 = fmul float %133, %303
  %307 = fneg float %306
  %308 = tail call float @llvm.fma.f32(float %303, float %133, float %307)
  %309 = fmul float %133, %305
  %310 = tail call float @llvm.fma.f32(float %303, float %135, float %309)
  %311 = fadd float %308, %310
  %312 = fadd float %306, %311
  %313 = fsub float %312, %306
  %314 = fsub float %311, %313
  %315 = tail call float @llvm.fabs.f32(float %306) #3
  %316 = fcmp oeq float %315, 0x7FF0000000000000
  %317 = select i1 %316, float %306, float %312
  %318 = tail call float @llvm.fabs.f32(float %317) #3
  %319 = fcmp oeq float %318, 0x7FF0000000000000
  %320 = select i1 %319, float 0.000000e+00, float %314
  %321 = fcmp oeq float %317, 0x40562E4300000000
  %322 = select i1 %321, float 0x3EE0000000000000, float 0.000000e+00
  %323 = fsub float %317, %322
  %324 = fadd float %322, %320
  %325 = fmul float %323, 0x3FF7154760000000
  %326 = tail call float @llvm.rint.f32(float %325)
  %327 = fcmp ogt float %323, 0x40562E4300000000
  %328 = fcmp olt float %323, 0xC059D1DA00000000
  %329 = fneg float %325
  %330 = tail call float @llvm.fma.f32(float %323, float 0x3FF7154760000000, float %329)
  %331 = tail call float @llvm.fma.f32(float %323, float 0x3E54AE0BE0000000, float %330)
  %332 = fsub float %325, %326
  %333 = fadd float %331, %332
  %334 = tail call float @llvm.exp2.f32(float %333)
  %335 = fptosi float %326 to i32
  %336 = tail call float @llvm.amdgcn.ldexp.f32(float %334, i32 %335)
  %337 = select i1 %328, float 0.000000e+00, float %336
  %338 = select i1 %327, float 0x7FF0000000000000, float %337
  %339 = tail call float @llvm.fma.f32(float %338, float %324, float %338)
  %340 = tail call float @llvm.fabs.f32(float %338) #3
  %341 = fcmp oeq float %340, 0x7FF0000000000000
  %342 = select i1 %341, float %338, float %339
  %343 = and i32 %263, 1
  %344 = icmp eq i32 %343, 0
  %345 = or i1 %136, %344
  %346 = select i1 %345, float 0.000000e+00, float -0.000000e+00
  %347 = tail call float @llvm.copysign.f32(float %342, float %346)
  %348 = select i1 %344, float 0.000000e+00, float %27
  %349 = tail call float @llvm.copysign.f32(float %140, float %348)
  %350 = select i1 %139, float %349, float %347
  %351 = select i1 %141, float 0x7FF8000000000000, float %350
  %352 = icmp eq i32 %263, 0
  %353 = select i1 %352, float 1.000000e+00, float %351
  %354 = fmul contract float %353, %298
  %355 = fmul float %248, %303
  %356 = fneg float %355
  %357 = tail call float @llvm.fma.f32(float %303, float %248, float %356)
  %358 = fmul float %248, %305
  %359 = tail call float @llvm.fma.f32(float %303, float %250, float %358)
  %360 = fadd float %357, %359
  %361 = fadd float %355, %360
  %362 = fsub float %361, %355
  %363 = fsub float %360, %362
  %364 = tail call float @llvm.fabs.f32(float %355) #3
  %365 = fcmp oeq float %364, 0x7FF0000000000000
  %366 = select i1 %365, float %355, float %361
  %367 = tail call float @llvm.fabs.f32(float %366) #3
  %368 = fcmp oeq float %367, 0x7FF0000000000000
  %369 = select i1 %368, float 0.000000e+00, float %363
  %370 = fcmp oeq float %366, 0x40562E4300000000
  %371 = select i1 %370, float 0x3EE0000000000000, float 0.000000e+00
  %372 = fsub float %366, %371
  %373 = fadd float %371, %369
  %374 = fmul float %372, 0x3FF7154760000000
  %375 = tail call float @llvm.rint.f32(float %374)
  %376 = fcmp ogt float %372, 0x40562E4300000000
  %377 = fcmp olt float %372, 0xC059D1DA00000000
  %378 = fneg float %374
  %379 = tail call float @llvm.fma.f32(float %372, float 0x3FF7154760000000, float %378)
  %380 = tail call float @llvm.fma.f32(float %372, float 0x3E54AE0BE0000000, float %379)
  %381 = fsub float %374, %375
  %382 = fadd float %380, %381
  %383 = tail call float @llvm.exp2.f32(float %382)
  %384 = fptosi float %375 to i32
  %385 = tail call float @llvm.amdgcn.ldexp.f32(float %383, i32 %384)
  %386 = select i1 %377, float 0.000000e+00, float %385
  %387 = select i1 %376, float 0x7FF0000000000000, float %386
  %388 = tail call float @llvm.fma.f32(float %387, float %373, float %387)
  %389 = tail call float @llvm.fabs.f32(float %387) #3
  %390 = fcmp oeq float %389, 0x7FF0000000000000
  %391 = select i1 %390, float %387, float %388
  %392 = or i1 %251, %344
  %393 = select i1 %392, float 0.000000e+00, float -0.000000e+00
  %394 = tail call float @llvm.copysign.f32(float %391, float %393)
  %395 = select i1 %344, float 0.000000e+00, float %142
  %396 = tail call float @llvm.copysign.f32(float %255, float %395)
  %397 = select i1 %254, float %396, float %394
  %398 = select i1 %256, float 0x7FF8000000000000, float %397
  %399 = select i1 %352, float 1.000000e+00, float %398
  %400 = fdiv contract float %354, %399
  %401 = fadd contract float %262, %400
  %402 = add nuw nsw i32 %263, 1
  %403 = icmp eq i32 %402, %2
  br i1 %403, label %257, label %261, !llvm.loop !11

404:                                              ; preds = %257, %13
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
