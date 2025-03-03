; ModuleID = '../data/hip_kernels/7510/8/main.cu'
source_filename = "../data/hip_kernels/7510/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10adamKerneliPiS_iPfS0_fffffffS0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, float %8, float %9, float %10, float %11, float %12, float addrspace(1)* nocapture %13, float addrspace(1)* nocapture %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !4, !amdgpu.noclobber !8
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4, !amdgpu.noclobber !8
  %22 = icmp ne i32 %19, -1
  %23 = icmp sgt i32 %21, 0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %461

25:                                               ; preds = %15
  %26 = sitofp i32 %21 to float
  %27 = fdiv contract float 1.000000e+00, %26
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !9, !invariant.load !8
  %33 = zext i16 %32 to i32
  %34 = mul i32 %28, %33
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %36 = add i32 %34, %35
  %37 = mul i32 %36, %0
  %38 = mul nsw i32 %19, %3
  %39 = add nsw i32 %37, %38
  %40 = add nsw i32 %39, %0
  %41 = add nsw i32 %38, %3
  %42 = tail call i32 @llvm.smin.i32(i32 %40, i32 %41)
  %43 = icmp slt i32 %39, %42
  br i1 %43, label %44, label %461

44:                                               ; preds = %25
  %45 = mul nsw i32 %16, %3
  %46 = add nsw i32 %37, %45
  %47 = tail call float @llvm.fabs.f32(float %7)
  %48 = tail call float @llvm.amdgcn.frexp.mant.f32(float %47)
  %49 = fcmp olt float %48, 0x3FE5555560000000
  %50 = zext i1 %49 to i32
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %50)
  %52 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %47)
  %53 = sub nsw i32 %52, %50
  %54 = fadd float %51, -1.000000e+00
  %55 = fadd float %51, 1.000000e+00
  %56 = fadd float %55, -1.000000e+00
  %57 = fsub float %51, %56
  %58 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %59 = fmul float %54, %58
  %60 = fmul float %55, %59
  %61 = fneg float %60
  %62 = tail call float @llvm.fma.f32(float %59, float %55, float %61)
  %63 = tail call float @llvm.fma.f32(float %59, float %57, float %62)
  %64 = fadd float %60, %63
  %65 = fsub float %64, %60
  %66 = fsub float %63, %65
  %67 = fsub float %54, %64
  %68 = fsub float %54, %67
  %69 = fsub float %68, %64
  %70 = fsub float %69, %66
  %71 = fadd float %67, %70
  %72 = fmul float %58, %71
  %73 = fadd float %59, %72
  %74 = fsub float %73, %59
  %75 = fsub float %72, %74
  %76 = fmul float %73, %73
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %73, float %73, float %77)
  %79 = fmul float %75, 2.000000e+00
  %80 = tail call float @llvm.fma.f32(float %73, float %79, float %78)
  %81 = fadd float %76, %80
  %82 = fsub float %81, %76
  %83 = fsub float %80, %82
  %84 = tail call float @llvm.fmuladd.f32(float %81, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %85 = tail call float @llvm.fmuladd.f32(float %81, float %84, float 0x3FD999BDE0000000)
  %86 = sitofp i32 %53 to float
  %87 = fmul float %86, 0x3FE62E4300000000
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %86, float 0x3FE62E4300000000, float %88)
  %90 = tail call float @llvm.fma.f32(float %86, float 0xBE205C6100000000, float %89)
  %91 = fadd float %87, %90
  %92 = fsub float %91, %87
  %93 = fsub float %90, %92
  %94 = tail call float @llvm.amdgcn.ldexp.f32(float %73, i32 1)
  %95 = fmul float %73, %81
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %81, float %73, float %96)
  %98 = tail call float @llvm.fma.f32(float %81, float %75, float %97)
  %99 = tail call float @llvm.fma.f32(float %83, float %73, float %98)
  %100 = fadd float %95, %99
  %101 = fsub float %100, %95
  %102 = fsub float %99, %101
  %103 = fmul float %81, %85
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %81, float %85, float %104)
  %106 = tail call float @llvm.fma.f32(float %83, float %85, float %105)
  %107 = fadd float %103, %106
  %108 = fsub float %107, %103
  %109 = fsub float %106, %108
  %110 = fadd float %107, 0x3FE5555540000000
  %111 = fadd float %110, 0xBFE5555540000000
  %112 = fsub float %107, %111
  %113 = fadd float %109, 0x3E2E720200000000
  %114 = fadd float %113, %112
  %115 = fadd float %110, %114
  %116 = fsub float %115, %110
  %117 = fsub float %114, %116
  %118 = fmul float %100, %115
  %119 = fneg float %118
  %120 = tail call float @llvm.fma.f32(float %100, float %115, float %119)
  %121 = tail call float @llvm.fma.f32(float %100, float %117, float %120)
  %122 = tail call float @llvm.fma.f32(float %102, float %115, float %121)
  %123 = tail call float @llvm.amdgcn.ldexp.f32(float %75, i32 1)
  %124 = fadd float %118, %122
  %125 = fsub float %124, %118
  %126 = fsub float %122, %125
  %127 = fadd float %94, %124
  %128 = fsub float %127, %94
  %129 = fsub float %124, %128
  %130 = fadd float %123, %126
  %131 = fadd float %130, %129
  %132 = fadd float %127, %131
  %133 = fsub float %132, %127
  %134 = fsub float %131, %133
  %135 = fadd float %91, %132
  %136 = fsub float %135, %91
  %137 = fsub float %135, %136
  %138 = fsub float %91, %137
  %139 = fsub float %132, %136
  %140 = fadd float %139, %138
  %141 = fadd float %93, %134
  %142 = fsub float %141, %93
  %143 = fsub float %141, %142
  %144 = fsub float %93, %143
  %145 = fsub float %134, %142
  %146 = fadd float %145, %144
  %147 = fadd float %141, %140
  %148 = fadd float %135, %147
  %149 = fsub float %148, %135
  %150 = fsub float %147, %149
  %151 = fadd float %146, %150
  %152 = fadd float %148, %151
  %153 = fsub float %152, %148
  %154 = fsub float %151, %153
  %155 = fmul float %152, %12
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %12, float %152, float %156)
  %158 = tail call float @llvm.fma.f32(float %12, float %154, float %157)
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = tail call float @llvm.fabs.f32(float %155) #4
  %163 = fcmp oeq float %162, 0x7FF0000000000000
  %164 = select i1 %163, float %155, float %159
  %165 = tail call float @llvm.fabs.f32(float %164) #4
  %166 = fcmp oeq float %165, 0x7FF0000000000000
  %167 = select i1 %166, float 0.000000e+00, float %161
  %168 = fcmp oeq float %164, 0x40562E4300000000
  %169 = select i1 %168, float 0x3EE0000000000000, float 0.000000e+00
  %170 = fsub float %164, %169
  %171 = fadd float %169, %167
  %172 = fmul float %170, 0x3FF7154760000000
  %173 = tail call float @llvm.rint.f32(float %172)
  %174 = fcmp ogt float %170, 0x40562E4300000000
  %175 = fcmp olt float %170, 0xC059D1DA00000000
  %176 = fneg float %172
  %177 = tail call float @llvm.fma.f32(float %170, float 0x3FF7154760000000, float %176)
  %178 = tail call float @llvm.fma.f32(float %170, float 0x3E54AE0BE0000000, float %177)
  %179 = fsub float %172, %173
  %180 = fadd float %178, %179
  %181 = tail call float @llvm.exp2.f32(float %180)
  %182 = fptosi float %173 to i32
  %183 = tail call float @llvm.amdgcn.ldexp.f32(float %181, i32 %182)
  %184 = select i1 %175, float 0.000000e+00, float %183
  %185 = select i1 %174, float 0x7FF0000000000000, float %184
  %186 = tail call float @llvm.fma.f32(float %185, float %171, float %185)
  %187 = tail call float @llvm.fabs.f32(float %185) #4
  %188 = fcmp oeq float %187, 0x7FF0000000000000
  %189 = select i1 %188, float %185, float %186
  %190 = tail call float @llvm.fabs.f32(float %12)
  %191 = tail call float @llvm.trunc.f32(float %190)
  %192 = fcmp oeq float %190, %191
  %193 = zext i1 %192 to i32
  %194 = fmul float %191, 5.000000e-01
  %195 = tail call float @llvm.amdgcn.fract.f32(float %194)
  %196 = tail call i1 @llvm.amdgcn.class.f32(float %194, i32 516)
  %197 = select i1 %196, float 0.000000e+00, float %195
  %198 = fcmp oeq float %197, 0.000000e+00
  %199 = and i1 %192, %198
  %200 = zext i1 %199 to i32
  %201 = add nuw nsw i32 %200, %193
  %202 = icmp eq i32 %201, 1
  %203 = fcmp olt float %7, 0.000000e+00
  %204 = and i1 %203, %202
  %205 = select i1 %204, float -0.000000e+00, float 0.000000e+00
  %206 = tail call float @llvm.copysign.f32(float %189, float %205)
  %207 = fcmp uge float %7, 0.000000e+00
  %208 = icmp ne i32 %201, 0
  %209 = select i1 %207, i1 true, i1 %208
  %210 = select i1 %209, float %206, float 0x7FF8000000000000
  %211 = fcmp oeq float %190, 0x7FF0000000000000
  %212 = fcmp oeq float %47, 1.000000e+00
  %213 = fadd float %47, -1.000000e+00
  %214 = bitcast float %12 to i32
  %215 = bitcast float %213 to i32
  %216 = xor i32 %214, %215
  %217 = icmp sgt i32 %216, -1
  %218 = select i1 %217, float 0x7FF0000000000000, float 0.000000e+00
  %219 = select i1 %212, float %47, float %218
  %220 = fcmp oeq float %47, 0x7FF0000000000000
  %221 = fcmp oeq float %7, 0.000000e+00
  %222 = or i1 %221, %220
  %223 = fcmp olt float %12, 0.000000e+00
  %224 = xor i1 %221, %223
  %225 = select i1 %224, float 0.000000e+00, float 0x7FF0000000000000
  %226 = select i1 %202, float %7, float 0.000000e+00
  %227 = tail call float @llvm.copysign.f32(float %225, float %226)
  %228 = fcmp uno float %7, %12
  %229 = fcmp oeq float %7, 1.000000e+00
  %230 = fcmp oeq float %12, 0.000000e+00
  %231 = or i1 %229, %230
  %232 = tail call float @llvm.fabs.f32(float %9)
  %233 = tail call float @llvm.amdgcn.frexp.mant.f32(float %232)
  %234 = fcmp olt float %233, 0x3FE5555560000000
  %235 = zext i1 %234 to i32
  %236 = tail call float @llvm.amdgcn.ldexp.f32(float %233, i32 %235)
  %237 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %232)
  %238 = sub nsw i32 %237, %235
  %239 = fadd float %236, -1.000000e+00
  %240 = fadd float %236, 1.000000e+00
  %241 = fadd float %240, -1.000000e+00
  %242 = fsub float %236, %241
  %243 = tail call float @llvm.amdgcn.rcp.f32(float %240)
  %244 = fmul float %239, %243
  %245 = fmul float %240, %244
  %246 = fneg float %245
  %247 = tail call float @llvm.fma.f32(float %244, float %240, float %246)
  %248 = tail call float @llvm.fma.f32(float %244, float %242, float %247)
  %249 = fadd float %245, %248
  %250 = fsub float %249, %245
  %251 = fsub float %248, %250
  %252 = fsub float %239, %249
  %253 = fsub float %239, %252
  %254 = fsub float %253, %249
  %255 = fsub float %254, %251
  %256 = fadd float %252, %255
  %257 = fmul float %243, %256
  %258 = fadd float %244, %257
  %259 = fsub float %258, %244
  %260 = fsub float %257, %259
  %261 = fmul float %258, %258
  %262 = fneg float %261
  %263 = tail call float @llvm.fma.f32(float %258, float %258, float %262)
  %264 = fmul float %260, 2.000000e+00
  %265 = tail call float @llvm.fma.f32(float %258, float %264, float %263)
  %266 = fadd float %261, %265
  %267 = fsub float %266, %261
  %268 = fsub float %265, %267
  %269 = tail call float @llvm.fmuladd.f32(float %266, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %270 = tail call float @llvm.fmuladd.f32(float %266, float %269, float 0x3FD999BDE0000000)
  %271 = sitofp i32 %238 to float
  %272 = fmul float %271, 0x3FE62E4300000000
  %273 = fneg float %272
  %274 = tail call float @llvm.fma.f32(float %271, float 0x3FE62E4300000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %271, float 0xBE205C6100000000, float %274)
  %276 = fadd float %272, %275
  %277 = fsub float %276, %272
  %278 = fsub float %275, %277
  %279 = tail call float @llvm.amdgcn.ldexp.f32(float %258, i32 1)
  %280 = fmul float %258, %266
  %281 = fneg float %280
  %282 = tail call float @llvm.fma.f32(float %266, float %258, float %281)
  %283 = tail call float @llvm.fma.f32(float %266, float %260, float %282)
  %284 = tail call float @llvm.fma.f32(float %268, float %258, float %283)
  %285 = fadd float %280, %284
  %286 = fsub float %285, %280
  %287 = fsub float %284, %286
  %288 = fmul float %266, %270
  %289 = fneg float %288
  %290 = tail call float @llvm.fma.f32(float %266, float %270, float %289)
  %291 = tail call float @llvm.fma.f32(float %268, float %270, float %290)
  %292 = fadd float %288, %291
  %293 = fsub float %292, %288
  %294 = fsub float %291, %293
  %295 = fadd float %292, 0x3FE5555540000000
  %296 = fadd float %295, 0xBFE5555540000000
  %297 = fsub float %292, %296
  %298 = fadd float %294, 0x3E2E720200000000
  %299 = fadd float %298, %297
  %300 = fadd float %295, %299
  %301 = fsub float %300, %295
  %302 = fsub float %299, %301
  %303 = fmul float %285, %300
  %304 = fneg float %303
  %305 = tail call float @llvm.fma.f32(float %285, float %300, float %304)
  %306 = tail call float @llvm.fma.f32(float %285, float %302, float %305)
  %307 = tail call float @llvm.fma.f32(float %287, float %300, float %306)
  %308 = tail call float @llvm.amdgcn.ldexp.f32(float %260, i32 1)
  %309 = fadd float %303, %307
  %310 = fsub float %309, %303
  %311 = fsub float %307, %310
  %312 = fadd float %279, %309
  %313 = fsub float %312, %279
  %314 = fsub float %309, %313
  %315 = fadd float %308, %311
  %316 = fadd float %315, %314
  %317 = fadd float %312, %316
  %318 = fsub float %317, %312
  %319 = fsub float %316, %318
  %320 = fadd float %276, %317
  %321 = fsub float %320, %276
  %322 = fsub float %320, %321
  %323 = fsub float %276, %322
  %324 = fsub float %317, %321
  %325 = fadd float %324, %323
  %326 = fadd float %278, %319
  %327 = fsub float %326, %278
  %328 = fsub float %326, %327
  %329 = fsub float %278, %328
  %330 = fsub float %319, %327
  %331 = fadd float %330, %329
  %332 = fadd float %326, %325
  %333 = fadd float %320, %332
  %334 = fsub float %333, %320
  %335 = fsub float %332, %334
  %336 = fadd float %331, %335
  %337 = fadd float %333, %336
  %338 = fsub float %337, %333
  %339 = fsub float %336, %338
  %340 = fmul float %337, %12
  %341 = fneg float %340
  %342 = tail call float @llvm.fma.f32(float %12, float %337, float %341)
  %343 = tail call float @llvm.fma.f32(float %12, float %339, float %342)
  %344 = fadd float %340, %343
  %345 = fsub float %344, %340
  %346 = fsub float %343, %345
  %347 = tail call float @llvm.fabs.f32(float %340) #4
  %348 = fcmp oeq float %347, 0x7FF0000000000000
  %349 = select i1 %348, float %340, float %344
  %350 = tail call float @llvm.fabs.f32(float %349) #4
  %351 = fcmp oeq float %350, 0x7FF0000000000000
  %352 = select i1 %351, float 0.000000e+00, float %346
  %353 = fcmp oeq float %349, 0x40562E4300000000
  %354 = select i1 %353, float 0x3EE0000000000000, float 0.000000e+00
  %355 = fsub float %349, %354
  %356 = fadd float %354, %352
  %357 = fmul float %355, 0x3FF7154760000000
  %358 = tail call float @llvm.rint.f32(float %357)
  %359 = fcmp ogt float %355, 0x40562E4300000000
  %360 = fcmp olt float %355, 0xC059D1DA00000000
  %361 = fneg float %357
  %362 = tail call float @llvm.fma.f32(float %355, float 0x3FF7154760000000, float %361)
  %363 = tail call float @llvm.fma.f32(float %355, float 0x3E54AE0BE0000000, float %362)
  %364 = fsub float %357, %358
  %365 = fadd float %363, %364
  %366 = tail call float @llvm.exp2.f32(float %365)
  %367 = fptosi float %358 to i32
  %368 = tail call float @llvm.amdgcn.ldexp.f32(float %366, i32 %367)
  %369 = select i1 %360, float 0.000000e+00, float %368
  %370 = select i1 %359, float 0x7FF0000000000000, float %369
  %371 = tail call float @llvm.fma.f32(float %370, float %356, float %370)
  %372 = tail call float @llvm.fabs.f32(float %370) #4
  %373 = fcmp oeq float %372, 0x7FF0000000000000
  %374 = select i1 %373, float %370, float %371
  %375 = fcmp olt float %9, 0.000000e+00
  %376 = and i1 %375, %202
  %377 = select i1 %376, float -0.000000e+00, float 0.000000e+00
  %378 = tail call float @llvm.copysign.f32(float %374, float %377)
  %379 = fcmp uge float %9, 0.000000e+00
  %380 = select i1 %379, i1 true, i1 %208
  %381 = select i1 %380, float %378, float 0x7FF8000000000000
  %382 = fcmp oeq float %232, 1.000000e+00
  %383 = fadd float %232, -1.000000e+00
  %384 = bitcast float %383 to i32
  %385 = xor i32 %214, %384
  %386 = icmp sgt i32 %385, -1
  %387 = select i1 %386, float 0x7FF0000000000000, float 0.000000e+00
  %388 = select i1 %382, float %232, float %387
  %389 = fcmp oeq float %232, 0x7FF0000000000000
  %390 = fcmp oeq float %9, 0.000000e+00
  %391 = or i1 %390, %389
  %392 = xor i1 %390, %223
  %393 = select i1 %392, float 0.000000e+00, float 0x7FF0000000000000
  %394 = select i1 %202, float %9, float 0.000000e+00
  %395 = tail call float @llvm.copysign.f32(float %393, float %394)
  %396 = fcmp uno float %9, %12
  %397 = fcmp oeq float %9, 1.000000e+00
  %398 = or i1 %397, %230
  %399 = select i1 %211, float %219, float %210
  %400 = select i1 %222, float %227, float %399
  %401 = fsub contract float 1.000000e+00, %400
  %402 = select i1 %228, float 0x7FF8000000000000, float %401
  %403 = select i1 %231, float 0.000000e+00, float %402
  %404 = select i1 %211, float %388, float %381
  %405 = select i1 %391, float %395, float %404
  %406 = fsub contract float 1.000000e+00, %405
  %407 = select i1 %396, float 0x7FF8000000000000, float %406
  %408 = select i1 %398, float 0.000000e+00, float %407
  br label %409

409:                                              ; preds = %44, %409
  %410 = phi i32 [ %39, %44 ], [ %458, %409 ]
  %411 = phi i32 [ %46, %44 ], [ %459, %409 ]
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds float, float addrspace(1)* %5, i64 %412
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !11
  %415 = fmul contract float %27, %414
  %416 = sext i32 %410 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %13, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !11
  %419 = fmul contract float %418, %7
  %420 = fmul contract float %415, %8
  %421 = fadd contract float %419, %420
  store float %421, float addrspace(1)* %417, align 4, !tbaa !11
  %422 = getelementptr inbounds float, float addrspace(1)* %14, i64 %416
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !11
  %424 = fmul contract float %423, %9
  %425 = fmul contract float %415, %10
  %426 = fmul contract float %415, %425
  %427 = fadd contract float %426, %424
  store float %427, float addrspace(1)* %422, align 4, !tbaa !11
  %428 = fdiv contract float %427, %408
  %429 = fcmp olt float %428, 0x39F0000000000000
  %430 = select i1 %429, float 0x41F0000000000000, float 1.000000e+00
  %431 = fmul float %428, %430
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
  %450 = fadd contract float %449, %11
  %451 = fdiv contract float %6, %450
  %452 = fneg contract float %421
  %453 = fdiv contract float %452, %403
  %454 = fmul contract float %453, %451
  %455 = getelementptr inbounds float, float addrspace(1)* %4, i64 %416
  %456 = load float, float addrspace(1)* %455, align 4, !tbaa !11
  %457 = fadd contract float %456, %454
  store float %457, float addrspace(1)* %455, align 4, !tbaa !11
  %458 = add nsw i32 %410, 1
  %459 = add nsw i32 %411, 1
  %460 = icmp slt i32 %458, %42
  br i1 %460, label %409, label %461, !llvm.loop !13

461:                                              ; preds = %409, %25, %15
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
