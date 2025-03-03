; ModuleID = '../data/hip_kernels/10499/2/main.cu'
source_filename = "../data/hip_kernels/10499/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @wavee(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, float %4, float %5, float %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = freeze i32 %18
  %20 = freeze i32 %1
  %21 = udiv i32 %19, %20
  %22 = mul i32 %21, %20
  %23 = sub i32 %19, %22
  %24 = mul i32 %21, %1
  %25 = add i32 %24, %23
  %26 = icmp ult i32 %25, %8
  br i1 %26, label %27, label %507

27:                                               ; preds = %9
  %28 = icmp ult i32 %21, %2
  %29 = sub i32 %2, %21
  %30 = sub i32 %21, %2
  %31 = select i1 %28, i32 %29, i32 %30
  %32 = uitofp i32 %31 to float
  %33 = icmp ult i32 %23, %3
  %34 = sub i32 %3, %23
  %35 = sub i32 %23, %3
  %36 = select i1 %33, i32 %34, i32 %35
  %37 = uitofp i32 %36 to float
  %38 = tail call float @llvm.amdgcn.frexp.mant.f32(float %32)
  %39 = fcmp olt float %38, 0x3FE5555560000000
  %40 = zext i1 %39 to i32
  %41 = tail call float @llvm.amdgcn.ldexp.f32(float %38, i32 %40)
  %42 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %32)
  %43 = sub nsw i32 %42, %40
  %44 = fadd float %41, -1.000000e+00
  %45 = fadd float %41, 1.000000e+00
  %46 = fadd float %45, -1.000000e+00
  %47 = fsub float %41, %46
  %48 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %49 = fmul float %44, %48
  %50 = fmul float %45, %49
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %49, float %45, float %51)
  %53 = tail call float @llvm.fma.f32(float %49, float %47, float %52)
  %54 = fadd float %50, %53
  %55 = fsub float %54, %50
  %56 = fsub float %53, %55
  %57 = fsub float %44, %54
  %58 = fsub float %44, %57
  %59 = fsub float %58, %54
  %60 = fsub float %59, %56
  %61 = fadd float %57, %60
  %62 = fmul float %48, %61
  %63 = fadd float %49, %62
  %64 = fsub float %63, %49
  %65 = fsub float %62, %64
  %66 = fmul float %63, %63
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %63, float %63, float %67)
  %69 = fmul float %65, 2.000000e+00
  %70 = tail call float @llvm.fma.f32(float %63, float %69, float %68)
  %71 = fadd float %66, %70
  %72 = fsub float %71, %66
  %73 = fsub float %70, %72
  %74 = tail call float @llvm.fmuladd.f32(float %71, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %75 = tail call float @llvm.fmuladd.f32(float %71, float %74, float 0x3FD999BDE0000000)
  %76 = sitofp i32 %43 to float
  %77 = fmul float %76, 0x3FE62E4300000000
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %76, float 0x3FE62E4300000000, float %78)
  %80 = tail call float @llvm.fma.f32(float %76, float 0xBE205C6100000000, float %79)
  %81 = fadd float %77, %80
  %82 = fsub float %81, %77
  %83 = fsub float %80, %82
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %63, i32 1)
  %85 = fmul float %63, %71
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %71, float %63, float %86)
  %88 = tail call float @llvm.fma.f32(float %71, float %65, float %87)
  %89 = tail call float @llvm.fma.f32(float %73, float %63, float %88)
  %90 = fadd float %85, %89
  %91 = fsub float %90, %85
  %92 = fsub float %89, %91
  %93 = fmul float %71, %75
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %71, float %75, float %94)
  %96 = tail call float @llvm.fma.f32(float %73, float %75, float %95)
  %97 = fadd float %93, %96
  %98 = fsub float %97, %93
  %99 = fsub float %96, %98
  %100 = fadd float %97, 0x3FE5555540000000
  %101 = fadd float %100, 0xBFE5555540000000
  %102 = fsub float %97, %101
  %103 = fadd float %99, 0x3E2E720200000000
  %104 = fadd float %103, %102
  %105 = fadd float %100, %104
  %106 = fsub float %105, %100
  %107 = fsub float %104, %106
  %108 = fmul float %90, %105
  %109 = fneg float %108
  %110 = tail call float @llvm.fma.f32(float %90, float %105, float %109)
  %111 = tail call float @llvm.fma.f32(float %90, float %107, float %110)
  %112 = tail call float @llvm.fma.f32(float %92, float %105, float %111)
  %113 = tail call float @llvm.amdgcn.ldexp.f32(float %65, i32 1)
  %114 = fadd float %108, %112
  %115 = fsub float %114, %108
  %116 = fsub float %112, %115
  %117 = fadd float %84, %114
  %118 = fsub float %117, %84
  %119 = fsub float %114, %118
  %120 = fadd float %113, %116
  %121 = fadd float %120, %119
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = fadd float %81, %122
  %126 = fsub float %125, %81
  %127 = fsub float %125, %126
  %128 = fsub float %81, %127
  %129 = fsub float %122, %126
  %130 = fadd float %129, %128
  %131 = fadd float %83, %124
  %132 = fsub float %131, %83
  %133 = fsub float %131, %132
  %134 = fsub float %83, %133
  %135 = fsub float %124, %132
  %136 = fadd float %135, %134
  %137 = fadd float %131, %130
  %138 = fadd float %125, %137
  %139 = fsub float %138, %125
  %140 = fsub float %137, %139
  %141 = fadd float %136, %140
  %142 = fadd float %138, %141
  %143 = fsub float %142, %138
  %144 = fsub float %141, %143
  %145 = fmul float %142, 2.000000e+00
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %142, float 2.000000e+00, float %146)
  %148 = fmul float %142, 0.000000e+00
  %149 = tail call float @llvm.fma.f32(float %144, float 2.000000e+00, float %148)
  %150 = fadd float %147, %149
  %151 = fadd float %145, %150
  %152 = fsub float %151, %145
  %153 = fsub float %150, %152
  %154 = tail call float @llvm.fabs.f32(float %145) #3
  %155 = fcmp oeq float %154, 0x7FF0000000000000
  %156 = select i1 %155, float %145, float %151
  %157 = tail call float @llvm.fabs.f32(float %156) #3
  %158 = fcmp oeq float %157, 0x7FF0000000000000
  %159 = select i1 %158, float 0.000000e+00, float %153
  %160 = fcmp oeq float %156, 0x40562E4300000000
  %161 = select i1 %160, float 0x3EE0000000000000, float 0.000000e+00
  %162 = fsub float %156, %161
  %163 = fadd float %161, %159
  %164 = fmul float %162, 0x3FF7154760000000
  %165 = tail call float @llvm.rint.f32(float %164)
  %166 = fcmp ogt float %162, 0x40562E4300000000
  %167 = fcmp olt float %162, 0xC059D1DA00000000
  %168 = fneg float %164
  %169 = tail call float @llvm.fma.f32(float %162, float 0x3FF7154760000000, float %168)
  %170 = tail call float @llvm.fma.f32(float %162, float 0x3E54AE0BE0000000, float %169)
  %171 = fsub float %164, %165
  %172 = fadd float %170, %171
  %173 = tail call float @llvm.exp2.f32(float %172)
  %174 = fptosi float %165 to i32
  %175 = tail call float @llvm.amdgcn.ldexp.f32(float %173, i32 %174)
  %176 = select i1 %167, float 0.000000e+00, float %175
  %177 = select i1 %166, float 0x7FF0000000000000, float %176
  %178 = tail call float @llvm.fma.f32(float %177, float %163, float %177)
  %179 = tail call float @llvm.fabs.f32(float %177) #3
  %180 = fcmp oeq float %179, 0x7FF0000000000000
  %181 = select i1 %180, float %177, float %178
  %182 = tail call float @llvm.fabs.f32(float %181)
  %183 = icmp eq i32 %31, 0
  %184 = select i1 %183, float 0.000000e+00, float %182
  %185 = tail call float @llvm.amdgcn.frexp.mant.f32(float %37)
  %186 = fcmp olt float %185, 0x3FE5555560000000
  %187 = zext i1 %186 to i32
  %188 = tail call float @llvm.amdgcn.ldexp.f32(float %185, i32 %187)
  %189 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %37)
  %190 = sub nsw i32 %189, %187
  %191 = fadd float %188, -1.000000e+00
  %192 = fadd float %188, 1.000000e+00
  %193 = fadd float %192, -1.000000e+00
  %194 = fsub float %188, %193
  %195 = tail call float @llvm.amdgcn.rcp.f32(float %192)
  %196 = fmul float %191, %195
  %197 = fmul float %192, %196
  %198 = fneg float %197
  %199 = tail call float @llvm.fma.f32(float %196, float %192, float %198)
  %200 = tail call float @llvm.fma.f32(float %196, float %194, float %199)
  %201 = fadd float %197, %200
  %202 = fsub float %201, %197
  %203 = fsub float %200, %202
  %204 = fsub float %191, %201
  %205 = fsub float %191, %204
  %206 = fsub float %205, %201
  %207 = fsub float %206, %203
  %208 = fadd float %204, %207
  %209 = fmul float %195, %208
  %210 = fadd float %196, %209
  %211 = fsub float %210, %196
  %212 = fsub float %209, %211
  %213 = fmul float %210, %210
  %214 = fneg float %213
  %215 = tail call float @llvm.fma.f32(float %210, float %210, float %214)
  %216 = fmul float %212, 2.000000e+00
  %217 = tail call float @llvm.fma.f32(float %210, float %216, float %215)
  %218 = fadd float %213, %217
  %219 = fsub float %218, %213
  %220 = fsub float %217, %219
  %221 = tail call float @llvm.fmuladd.f32(float %218, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %222 = tail call float @llvm.fmuladd.f32(float %218, float %221, float 0x3FD999BDE0000000)
  %223 = sitofp i32 %190 to float
  %224 = fmul float %223, 0x3FE62E4300000000
  %225 = fneg float %224
  %226 = tail call float @llvm.fma.f32(float %223, float 0x3FE62E4300000000, float %225)
  %227 = tail call float @llvm.fma.f32(float %223, float 0xBE205C6100000000, float %226)
  %228 = fadd float %224, %227
  %229 = fsub float %228, %224
  %230 = fsub float %227, %229
  %231 = tail call float @llvm.amdgcn.ldexp.f32(float %210, i32 1)
  %232 = fmul float %210, %218
  %233 = fneg float %232
  %234 = tail call float @llvm.fma.f32(float %218, float %210, float %233)
  %235 = tail call float @llvm.fma.f32(float %218, float %212, float %234)
  %236 = tail call float @llvm.fma.f32(float %220, float %210, float %235)
  %237 = fadd float %232, %236
  %238 = fsub float %237, %232
  %239 = fsub float %236, %238
  %240 = fmul float %218, %222
  %241 = fneg float %240
  %242 = tail call float @llvm.fma.f32(float %218, float %222, float %241)
  %243 = tail call float @llvm.fma.f32(float %220, float %222, float %242)
  %244 = fadd float %240, %243
  %245 = fsub float %244, %240
  %246 = fsub float %243, %245
  %247 = fadd float %244, 0x3FE5555540000000
  %248 = fadd float %247, 0xBFE5555540000000
  %249 = fsub float %244, %248
  %250 = fadd float %246, 0x3E2E720200000000
  %251 = fadd float %250, %249
  %252 = fadd float %247, %251
  %253 = fsub float %252, %247
  %254 = fsub float %251, %253
  %255 = fmul float %237, %252
  %256 = fneg float %255
  %257 = tail call float @llvm.fma.f32(float %237, float %252, float %256)
  %258 = tail call float @llvm.fma.f32(float %237, float %254, float %257)
  %259 = tail call float @llvm.fma.f32(float %239, float %252, float %258)
  %260 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 1)
  %261 = fadd float %255, %259
  %262 = fsub float %261, %255
  %263 = fsub float %259, %262
  %264 = fadd float %231, %261
  %265 = fsub float %264, %231
  %266 = fsub float %261, %265
  %267 = fadd float %260, %263
  %268 = fadd float %267, %266
  %269 = fadd float %264, %268
  %270 = fsub float %269, %264
  %271 = fsub float %268, %270
  %272 = fadd float %228, %269
  %273 = fsub float %272, %228
  %274 = fsub float %272, %273
  %275 = fsub float %228, %274
  %276 = fsub float %269, %273
  %277 = fadd float %276, %275
  %278 = fadd float %230, %271
  %279 = fsub float %278, %230
  %280 = fsub float %278, %279
  %281 = fsub float %230, %280
  %282 = fsub float %271, %279
  %283 = fadd float %282, %281
  %284 = fadd float %278, %277
  %285 = fadd float %272, %284
  %286 = fsub float %285, %272
  %287 = fsub float %284, %286
  %288 = fadd float %283, %287
  %289 = fadd float %285, %288
  %290 = fsub float %289, %285
  %291 = fsub float %288, %290
  %292 = fmul float %289, 2.000000e+00
  %293 = fneg float %292
  %294 = tail call float @llvm.fma.f32(float %289, float 2.000000e+00, float %293)
  %295 = fmul float %289, 0.000000e+00
  %296 = tail call float @llvm.fma.f32(float %291, float 2.000000e+00, float %295)
  %297 = fadd float %294, %296
  %298 = fadd float %292, %297
  %299 = fsub float %298, %292
  %300 = fsub float %297, %299
  %301 = tail call float @llvm.fabs.f32(float %292) #3
  %302 = fcmp oeq float %301, 0x7FF0000000000000
  %303 = select i1 %302, float %292, float %298
  %304 = tail call float @llvm.fabs.f32(float %303) #3
  %305 = fcmp oeq float %304, 0x7FF0000000000000
  %306 = select i1 %305, float 0.000000e+00, float %300
  %307 = fcmp oeq float %303, 0x40562E4300000000
  %308 = select i1 %307, float 0x3EE0000000000000, float 0.000000e+00
  %309 = fsub float %303, %308
  %310 = fadd float %308, %306
  %311 = fmul float %309, 0x3FF7154760000000
  %312 = tail call float @llvm.rint.f32(float %311)
  %313 = fcmp ogt float %309, 0x40562E4300000000
  %314 = fcmp olt float %309, 0xC059D1DA00000000
  %315 = fneg float %311
  %316 = tail call float @llvm.fma.f32(float %309, float 0x3FF7154760000000, float %315)
  %317 = tail call float @llvm.fma.f32(float %309, float 0x3E54AE0BE0000000, float %316)
  %318 = fsub float %311, %312
  %319 = fadd float %317, %318
  %320 = tail call float @llvm.exp2.f32(float %319)
  %321 = fptosi float %312 to i32
  %322 = tail call float @llvm.amdgcn.ldexp.f32(float %320, i32 %321)
  %323 = select i1 %314, float 0.000000e+00, float %322
  %324 = select i1 %313, float 0x7FF0000000000000, float %323
  %325 = tail call float @llvm.fma.f32(float %324, float %310, float %324)
  %326 = tail call float @llvm.fabs.f32(float %324) #3
  %327 = fcmp oeq float %326, 0x7FF0000000000000
  %328 = select i1 %327, float %324, float %325
  %329 = tail call float @llvm.fabs.f32(float %328)
  %330 = icmp eq i32 %36, 0
  %331 = select i1 %330, float 0.000000e+00, float %329
  %332 = fadd contract float %184, %331
  %333 = fcmp olt float %332, 0x39F0000000000000
  %334 = select i1 %333, float 0x41F0000000000000, float 1.000000e+00
  %335 = fmul float %332, %334
  %336 = tail call float @llvm.sqrt.f32(float %335)
  %337 = bitcast float %336 to i32
  %338 = add nsw i32 %337, -1
  %339 = bitcast i32 %338 to float
  %340 = add nsw i32 %337, 1
  %341 = bitcast i32 %340 to float
  %342 = tail call i1 @llvm.amdgcn.class.f32(float %335, i32 608)
  %343 = select i1 %333, float 0x3EF0000000000000, float 1.000000e+00
  %344 = fneg float %341
  %345 = tail call float @llvm.fma.f32(float %344, float %336, float %335)
  %346 = fcmp ogt float %345, 0.000000e+00
  %347 = fneg float %339
  %348 = tail call float @llvm.fma.f32(float %347, float %336, float %335)
  %349 = fcmp ole float %348, 0.000000e+00
  %350 = select i1 %349, float %339, float %336
  %351 = select i1 %346, float %341, float %350
  %352 = fmul float %343, %351
  %353 = select i1 %342, float %335, float %352
  %354 = fdiv contract float 0x401921CAC0000000, %5
  %355 = fmul contract float %354, %6
  %356 = fmul contract float %354, %353
  %357 = fsub contract float %355, %356
  %358 = fadd contract float %357, %7
  %359 = tail call float @llvm.fabs.f32(float %358)
  %360 = fcmp olt float %359, 1.310720e+05
  br i1 %360, label %361, label %369

361:                                              ; preds = %27
  %362 = fmul float %359, 0x3FE45F3060000000
  %363 = tail call float @llvm.rint.f32(float %362)
  %364 = tail call float @llvm.fma.f32(float %363, float 0xBFF921FB40000000, float %359)
  %365 = tail call float @llvm.fma.f32(float %363, float 0xBE74442D00000000, float %364)
  %366 = tail call float @llvm.fma.f32(float %363, float 0xBCF8469880000000, float %365)
  %367 = fptosi float %363 to i32
  %368 = bitcast float %359 to i32
  br label %475

369:                                              ; preds = %27
  %370 = bitcast float %359 to i32
  %371 = lshr i32 %370, 23
  %372 = and i32 %370, 8388607
  %373 = or i32 %372, 8388608
  %374 = zext i32 %373 to i64
  %375 = mul nuw nsw i64 %374, 4266746795
  %376 = trunc i64 %375 to i32
  %377 = lshr i64 %375, 32
  %378 = mul nuw nsw i64 %374, 1011060801
  %379 = add nuw nsw i64 %377, %378
  %380 = trunc i64 %379 to i32
  %381 = lshr i64 %379, 32
  %382 = mul nuw nsw i64 %374, 3680671129
  %383 = add nuw nsw i64 %381, %382
  %384 = trunc i64 %383 to i32
  %385 = lshr i64 %383, 32
  %386 = mul nuw nsw i64 %374, 4113882560
  %387 = add nuw nsw i64 %385, %386
  %388 = trunc i64 %387 to i32
  %389 = lshr i64 %387, 32
  %390 = mul nuw nsw i64 %374, 4230436817
  %391 = add nuw nsw i64 %389, %390
  %392 = trunc i64 %391 to i32
  %393 = lshr i64 %391, 32
  %394 = mul nuw nsw i64 %374, 1313084713
  %395 = add nuw nsw i64 %393, %394
  %396 = trunc i64 %395 to i32
  %397 = lshr i64 %395, 32
  %398 = mul nuw nsw i64 %374, 2734261102
  %399 = add nuw nsw i64 %397, %398
  %400 = trunc i64 %399 to i32
  %401 = lshr i64 %399, 32
  %402 = trunc i64 %401 to i32
  %403 = add nsw i32 %371, -120
  %404 = icmp ugt i32 %403, 63
  %405 = select i1 %404, i32 %396, i32 %402
  %406 = select i1 %404, i32 %392, i32 %400
  %407 = select i1 %404, i32 %388, i32 %396
  %408 = select i1 %404, i32 %384, i32 %392
  %409 = select i1 %404, i32 %380, i32 %388
  %410 = select i1 %404, i32 %376, i32 %384
  %411 = select i1 %404, i32 -64, i32 0
  %412 = add nsw i32 %411, %403
  %413 = icmp ugt i32 %412, 31
  %414 = select i1 %413, i32 %406, i32 %405
  %415 = select i1 %413, i32 %407, i32 %406
  %416 = select i1 %413, i32 %408, i32 %407
  %417 = select i1 %413, i32 %409, i32 %408
  %418 = select i1 %413, i32 %410, i32 %409
  %419 = select i1 %413, i32 -32, i32 0
  %420 = add nsw i32 %419, %412
  %421 = icmp ugt i32 %420, 31
  %422 = select i1 %421, i32 %415, i32 %414
  %423 = select i1 %421, i32 %416, i32 %415
  %424 = select i1 %421, i32 %417, i32 %416
  %425 = select i1 %421, i32 %418, i32 %417
  %426 = select i1 %421, i32 -32, i32 0
  %427 = add nsw i32 %426, %420
  %428 = icmp eq i32 %427, 0
  %429 = sub nsw i32 32, %427
  %430 = tail call i32 @llvm.fshr.i32(i32 %422, i32 %423, i32 %429)
  %431 = tail call i32 @llvm.fshr.i32(i32 %423, i32 %424, i32 %429)
  %432 = tail call i32 @llvm.fshr.i32(i32 %424, i32 %425, i32 %429)
  %433 = select i1 %428, i32 %422, i32 %430
  %434 = select i1 %428, i32 %423, i32 %431
  %435 = select i1 %428, i32 %424, i32 %432
  %436 = lshr i32 %433, 29
  %437 = tail call i32 @llvm.fshl.i32(i32 %433, i32 %434, i32 2)
  %438 = tail call i32 @llvm.fshl.i32(i32 %434, i32 %435, i32 2)
  %439 = tail call i32 @llvm.fshl.i32(i32 %435, i32 %425, i32 2)
  %440 = and i32 %436, 1
  %441 = sub nsw i32 0, %440
  %442 = shl i32 %436, 31
  %443 = xor i32 %437, %441
  %444 = xor i32 %438, %441
  %445 = xor i32 %439, %441
  %446 = tail call i32 @llvm.ctlz.i32(i32 %443, i1 false), !range !7
  %447 = sub nsw i32 31, %446
  %448 = tail call i32 @llvm.fshr.i32(i32 %443, i32 %444, i32 %447)
  %449 = tail call i32 @llvm.fshr.i32(i32 %444, i32 %445, i32 %447)
  %450 = shl nuw nsw i32 %446, 23
  %451 = sub nuw nsw i32 1056964608, %450
  %452 = lshr i32 %448, 9
  %453 = or i32 %452, %451
  %454 = or i32 %453, %442
  %455 = bitcast i32 %454 to float
  %456 = tail call i32 @llvm.fshl.i32(i32 %448, i32 %449, i32 23)
  %457 = tail call i32 @llvm.ctlz.i32(i32 %456, i1 false), !range !7
  %458 = fmul float %455, 0x3FF921FB40000000
  %459 = add nuw nsw i32 %457, %446
  %460 = shl nuw nsw i32 %459, 23
  %461 = sub nuw nsw i32 855638016, %460
  %462 = sub nsw i32 31, %457
  %463 = tail call i32 @llvm.fshr.i32(i32 %456, i32 %449, i32 %462)
  %464 = lshr i32 %463, 9
  %465 = or i32 %461, %464
  %466 = or i32 %465, %442
  %467 = bitcast i32 %466 to float
  %468 = fneg float %458
  %469 = tail call float @llvm.fma.f32(float %455, float 0x3FF921FB40000000, float %468)
  %470 = tail call float @llvm.fma.f32(float %455, float 0x3E74442D00000000, float %469)
  %471 = tail call float @llvm.fma.f32(float %467, float 0x3FF921FB40000000, float %470)
  %472 = fadd float %458, %471
  %473 = lshr i32 %433, 30
  %474 = add nuw nsw i32 %440, %473
  br label %475

475:                                              ; preds = %361, %369
  %476 = phi i32 [ %368, %361 ], [ %370, %369 ]
  %477 = phi float [ %366, %361 ], [ %472, %369 ]
  %478 = phi i32 [ %367, %361 ], [ %474, %369 ]
  %479 = fmul float %477, %477
  %480 = tail call float @llvm.fmuladd.f32(float %479, float 0xBF29833040000000, float 0x3F81103880000000)
  %481 = tail call float @llvm.fmuladd.f32(float %479, float %480, float 0xBFC55553A0000000)
  %482 = fmul float %479, %481
  %483 = tail call float @llvm.fmuladd.f32(float %477, float %482, float %477)
  %484 = tail call float @llvm.fmuladd.f32(float %479, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %485 = tail call float @llvm.fmuladd.f32(float %479, float %484, float 0x3FA5557EE0000000)
  %486 = tail call float @llvm.fmuladd.f32(float %479, float %485, float 0xBFE0000080000000)
  %487 = tail call float @llvm.fmuladd.f32(float %479, float %486, float 1.000000e+00)
  %488 = and i32 %478, 1
  %489 = icmp eq i32 %488, 0
  %490 = select i1 %489, float %483, float %487
  %491 = bitcast float %490 to i32
  %492 = shl i32 %478, 30
  %493 = and i32 %492, -2147483648
  %494 = bitcast float %358 to i32
  %495 = xor i32 %476, %494
  %496 = xor i32 %495, %493
  %497 = xor i32 %496, %491
  %498 = bitcast i32 %497 to float
  %499 = tail call i1 @llvm.amdgcn.class.f32(float %359, i32 504)
  %500 = select i1 %499, float %498, float 0x7FF8000000000000
  %501 = fmul contract float %500, %4
  %502 = fmul contract float %501, 1.270000e+02
  %503 = fadd contract float %502, 1.270000e+02
  %504 = fptosi float %503 to i32
  %505 = sext i32 %18 to i64
  %506 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %505
  store i32 %504, i32 addrspace(1)* %506, align 4, !tbaa !8
  br label %507

507:                                              ; preds = %475, %9
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
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
