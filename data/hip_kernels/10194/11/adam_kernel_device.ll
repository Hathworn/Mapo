; ModuleID = '../data/hip_kernels/10194/11/main.cu'
source_filename = "../data/hip_kernels/10194/11/main.cu"
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
  br i1 %30, label %31, label %430

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !14
  %35 = fpext float %34 to double
  %36 = fpext float %6 to double
  %37 = tail call float @llvm.fabs.f32(float %5)
  %38 = and i32 %8, -65536
  %39 = sitofp i32 %38 to float
  %40 = and i32 %8, 65535
  %41 = sitofp i32 %40 to float
  %42 = fadd float %39, %41
  %43 = fsub float %39, %42
  %44 = fadd float %43, %41
  %45 = tail call float @llvm.amdgcn.frexp.mant.f32(float %37)
  %46 = fcmp olt float %45, 0x3FE5555560000000
  %47 = zext i1 %46 to i32
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 %47)
  %49 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %37)
  %50 = sub nsw i32 %49, %47
  %51 = fadd float %48, -1.000000e+00
  %52 = fadd float %48, 1.000000e+00
  %53 = fadd float %52, -1.000000e+00
  %54 = fsub float %48, %53
  %55 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %56 = fmul float %51, %55
  %57 = fmul float %52, %56
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %56, float %52, float %58)
  %60 = tail call float @llvm.fma.f32(float %56, float %54, float %59)
  %61 = fadd float %57, %60
  %62 = fsub float %61, %57
  %63 = fsub float %60, %62
  %64 = fsub float %51, %61
  %65 = fsub float %51, %64
  %66 = fsub float %65, %61
  %67 = fsub float %66, %63
  %68 = fadd float %64, %67
  %69 = fmul float %55, %68
  %70 = fadd float %56, %69
  %71 = fsub float %70, %56
  %72 = fsub float %69, %71
  %73 = fmul float %70, %70
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %70, float %70, float %74)
  %76 = fmul float %72, 2.000000e+00
  %77 = tail call float @llvm.fma.f32(float %70, float %76, float %75)
  %78 = fadd float %73, %77
  %79 = fsub float %78, %73
  %80 = fsub float %77, %79
  %81 = tail call float @llvm.fmuladd.f32(float %78, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %82 = tail call float @llvm.fmuladd.f32(float %78, float %81, float 0x3FD999BDE0000000)
  %83 = sitofp i32 %50 to float
  %84 = fmul float %83, 0x3FE62E4300000000
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %83, float 0x3FE62E4300000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %83, float 0xBE205C6100000000, float %86)
  %88 = fadd float %84, %87
  %89 = fsub float %88, %84
  %90 = fsub float %87, %89
  %91 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 1)
  %92 = fmul float %70, %78
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %78, float %70, float %93)
  %95 = tail call float @llvm.fma.f32(float %78, float %72, float %94)
  %96 = tail call float @llvm.fma.f32(float %80, float %70, float %95)
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %78, %82
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %78, float %82, float %101)
  %103 = tail call float @llvm.fma.f32(float %80, float %82, float %102)
  %104 = fadd float %100, %103
  %105 = fsub float %104, %100
  %106 = fsub float %103, %105
  %107 = fadd float %104, 0x3FE5555540000000
  %108 = fadd float %107, 0xBFE5555540000000
  %109 = fsub float %104, %108
  %110 = fadd float %106, 0x3E2E720200000000
  %111 = fadd float %110, %109
  %112 = fadd float %107, %111
  %113 = fsub float %112, %107
  %114 = fsub float %111, %113
  %115 = fmul float %97, %112
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %97, float %112, float %116)
  %118 = tail call float @llvm.fma.f32(float %97, float %114, float %117)
  %119 = tail call float @llvm.fma.f32(float %99, float %112, float %118)
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %121 = fadd float %115, %119
  %122 = fsub float %121, %115
  %123 = fsub float %119, %122
  %124 = fadd float %91, %121
  %125 = fsub float %124, %91
  %126 = fsub float %121, %125
  %127 = fadd float %120, %123
  %128 = fadd float %127, %126
  %129 = fadd float %124, %128
  %130 = fsub float %129, %124
  %131 = fsub float %128, %130
  %132 = fadd float %88, %129
  %133 = fsub float %132, %88
  %134 = fsub float %132, %133
  %135 = fsub float %88, %134
  %136 = fsub float %129, %133
  %137 = fadd float %136, %135
  %138 = fadd float %90, %131
  %139 = fsub float %138, %90
  %140 = fsub float %138, %139
  %141 = fsub float %90, %140
  %142 = fsub float %131, %139
  %143 = fadd float %142, %141
  %144 = fadd float %138, %137
  %145 = fadd float %132, %144
  %146 = fsub float %145, %132
  %147 = fsub float %144, %146
  %148 = fadd float %143, %147
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = fmul float %42, %149
  %153 = fneg float %152
  %154 = tail call float @llvm.fma.f32(float %42, float %149, float %153)
  %155 = fmul float %44, %149
  %156 = tail call float @llvm.fma.f32(float %42, float %151, float %155)
  %157 = fadd float %154, %156
  %158 = fadd float %152, %157
  %159 = fsub float %158, %152
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %152) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %152, float %158
  %164 = tail call float @llvm.fabs.f32(float %163) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float 0.000000e+00, float %160
  %167 = fcmp oeq float %163, 0x40562E4300000000
  %168 = select i1 %167, float 0x3EE0000000000000, float 0.000000e+00
  %169 = fsub float %163, %168
  %170 = fadd float %168, %166
  %171 = fmul float %169, 0x3FF7154760000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = fcmp ogt float %169, 0x40562E4300000000
  %174 = fcmp olt float %169, 0xC059D1DA00000000
  %175 = fneg float %171
  %176 = tail call float @llvm.fma.f32(float %169, float 0x3FF7154760000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %169, float 0x3E54AE0BE0000000, float %176)
  %178 = fsub float %171, %172
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.exp2.f32(float %179)
  %181 = fptosi float %172 to i32
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %180, i32 %181)
  %183 = select i1 %174, float 0.000000e+00, float %182
  %184 = select i1 %173, float 0x7FF0000000000000, float %183
  %185 = tail call float @llvm.fma.f32(float %184, float %170, float %184)
  %186 = tail call float @llvm.fabs.f32(float %184) #3
  %187 = fcmp oeq float %186, 0x7FF0000000000000
  %188 = select i1 %187, float %184, float %185
  %189 = fcmp uge float %5, 0.000000e+00
  %190 = and i32 %8, 1
  %191 = icmp eq i32 %190, 0
  %192 = or i1 %189, %191
  %193 = select i1 %192, float 0.000000e+00, float -0.000000e+00
  %194 = tail call float @llvm.copysign.f32(float %188, float %193)
  %195 = fcmp oeq float %37, 0x7FF0000000000000
  %196 = fcmp oeq float %5, 0.000000e+00
  %197 = or i1 %196, %195
  %198 = zext i1 %196 to i32
  %199 = lshr i32 %8, 31
  %200 = icmp eq i32 %199, %198
  %201 = select i1 %200, float 0x7FF0000000000000, float 0.000000e+00
  %202 = select i1 %191, float 0.000000e+00, float %5
  %203 = tail call float @llvm.copysign.f32(float %201, float %202)
  %204 = select i1 %197, float %203, float %194
  %205 = fcmp uno float %5, 0.000000e+00
  %206 = select i1 %205, float 0x7FF8000000000000, float %204
  %207 = icmp eq i32 %8, 0
  %208 = fpext float %206 to double
  %209 = fsub contract double 1.000000e+00, %208
  %210 = select i1 %207, double 0.000000e+00, double %209
  %211 = fcmp olt double %210, 0x1000000000000000
  %212 = select i1 %211, double 0x4FF0000000000000, double 1.000000e+00
  %213 = fmul double %210, %212
  %214 = tail call double @llvm.amdgcn.rsq.f64(double %213)
  %215 = fmul double %213, %214
  %216 = fmul double %214, 5.000000e-01
  %217 = fneg double %216
  %218 = tail call double @llvm.fma.f64(double %217, double %215, double 5.000000e-01)
  %219 = tail call double @llvm.fma.f64(double %216, double %218, double %216)
  %220 = tail call double @llvm.fma.f64(double %215, double %218, double %215)
  %221 = fneg double %220
  %222 = tail call double @llvm.fma.f64(double %221, double %220, double %213)
  %223 = tail call double @llvm.fma.f64(double %222, double %219, double %220)
  %224 = fneg double %223
  %225 = tail call double @llvm.fma.f64(double %224, double %223, double %213)
  %226 = tail call double @llvm.fma.f64(double %225, double %219, double %223)
  %227 = select i1 %211, double 0x37F0000000000000, double 1.000000e+00
  %228 = fmul double %227, %226
  %229 = fcmp oeq double %213, 0.000000e+00
  %230 = fcmp oeq double %213, 0x7FF0000000000000
  %231 = or i1 %229, %230
  %232 = select i1 %231, double %213, double %228
  %233 = fmul contract double %232, %36
  %234 = tail call float @llvm.fabs.f32(float %4)
  %235 = tail call float @llvm.amdgcn.frexp.mant.f32(float %234)
  %236 = fcmp olt float %235, 0x3FE5555560000000
  %237 = zext i1 %236 to i32
  %238 = tail call float @llvm.amdgcn.ldexp.f32(float %235, i32 %237)
  %239 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %234)
  %240 = sub nsw i32 %239, %237
  %241 = fadd float %238, -1.000000e+00
  %242 = fadd float %238, 1.000000e+00
  %243 = fadd float %242, -1.000000e+00
  %244 = fsub float %238, %243
  %245 = tail call float @llvm.amdgcn.rcp.f32(float %242)
  %246 = fmul float %241, %245
  %247 = fmul float %242, %246
  %248 = fneg float %247
  %249 = tail call float @llvm.fma.f32(float %246, float %242, float %248)
  %250 = tail call float @llvm.fma.f32(float %246, float %244, float %249)
  %251 = fadd float %247, %250
  %252 = fsub float %251, %247
  %253 = fsub float %250, %252
  %254 = fsub float %241, %251
  %255 = fsub float %241, %254
  %256 = fsub float %255, %251
  %257 = fsub float %256, %253
  %258 = fadd float %254, %257
  %259 = fmul float %245, %258
  %260 = fadd float %246, %259
  %261 = fsub float %260, %246
  %262 = fsub float %259, %261
  %263 = fmul float %260, %260
  %264 = fneg float %263
  %265 = tail call float @llvm.fma.f32(float %260, float %260, float %264)
  %266 = fmul float %262, 2.000000e+00
  %267 = tail call float @llvm.fma.f32(float %260, float %266, float %265)
  %268 = fadd float %263, %267
  %269 = fsub float %268, %263
  %270 = fsub float %267, %269
  %271 = tail call float @llvm.fmuladd.f32(float %268, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %272 = tail call float @llvm.fmuladd.f32(float %268, float %271, float 0x3FD999BDE0000000)
  %273 = sitofp i32 %240 to float
  %274 = fmul float %273, 0x3FE62E4300000000
  %275 = fneg float %274
  %276 = tail call float @llvm.fma.f32(float %273, float 0x3FE62E4300000000, float %275)
  %277 = tail call float @llvm.fma.f32(float %273, float 0xBE205C6100000000, float %276)
  %278 = fadd float %274, %277
  %279 = fsub float %278, %274
  %280 = fsub float %277, %279
  %281 = tail call float @llvm.amdgcn.ldexp.f32(float %260, i32 1)
  %282 = fmul float %260, %268
  %283 = fneg float %282
  %284 = tail call float @llvm.fma.f32(float %268, float %260, float %283)
  %285 = tail call float @llvm.fma.f32(float %268, float %262, float %284)
  %286 = tail call float @llvm.fma.f32(float %270, float %260, float %285)
  %287 = fadd float %282, %286
  %288 = fsub float %287, %282
  %289 = fsub float %286, %288
  %290 = fmul float %268, %272
  %291 = fneg float %290
  %292 = tail call float @llvm.fma.f32(float %268, float %272, float %291)
  %293 = tail call float @llvm.fma.f32(float %270, float %272, float %292)
  %294 = fadd float %290, %293
  %295 = fsub float %294, %290
  %296 = fsub float %293, %295
  %297 = fadd float %294, 0x3FE5555540000000
  %298 = fadd float %297, 0xBFE5555540000000
  %299 = fsub float %294, %298
  %300 = fadd float %296, 0x3E2E720200000000
  %301 = fadd float %300, %299
  %302 = fadd float %297, %301
  %303 = fsub float %302, %297
  %304 = fsub float %301, %303
  %305 = fmul float %287, %302
  %306 = fneg float %305
  %307 = tail call float @llvm.fma.f32(float %287, float %302, float %306)
  %308 = tail call float @llvm.fma.f32(float %287, float %304, float %307)
  %309 = tail call float @llvm.fma.f32(float %289, float %302, float %308)
  %310 = tail call float @llvm.amdgcn.ldexp.f32(float %262, i32 1)
  %311 = fadd float %305, %309
  %312 = fsub float %311, %305
  %313 = fsub float %309, %312
  %314 = fadd float %281, %311
  %315 = fsub float %314, %281
  %316 = fsub float %311, %315
  %317 = fadd float %310, %313
  %318 = fadd float %317, %316
  %319 = fadd float %314, %318
  %320 = fsub float %319, %314
  %321 = fsub float %318, %320
  %322 = fadd float %278, %319
  %323 = fsub float %322, %278
  %324 = fsub float %322, %323
  %325 = fsub float %278, %324
  %326 = fsub float %319, %323
  %327 = fadd float %326, %325
  %328 = fadd float %280, %321
  %329 = fsub float %328, %280
  %330 = fsub float %328, %329
  %331 = fsub float %280, %330
  %332 = fsub float %321, %329
  %333 = fadd float %332, %331
  %334 = fadd float %328, %327
  %335 = fadd float %322, %334
  %336 = fsub float %335, %322
  %337 = fsub float %334, %336
  %338 = fadd float %333, %337
  %339 = fadd float %335, %338
  %340 = fsub float %339, %335
  %341 = fsub float %338, %340
  %342 = fmul float %42, %339
  %343 = fneg float %342
  %344 = tail call float @llvm.fma.f32(float %42, float %339, float %343)
  %345 = fmul float %44, %339
  %346 = tail call float @llvm.fma.f32(float %42, float %341, float %345)
  %347 = fadd float %344, %346
  %348 = fadd float %342, %347
  %349 = fsub float %348, %342
  %350 = fsub float %347, %349
  %351 = tail call float @llvm.fabs.f32(float %342) #3
  %352 = fcmp oeq float %351, 0x7FF0000000000000
  %353 = select i1 %352, float %342, float %348
  %354 = tail call float @llvm.fabs.f32(float %353) #3
  %355 = fcmp oeq float %354, 0x7FF0000000000000
  %356 = select i1 %355, float 0.000000e+00, float %350
  %357 = fcmp oeq float %353, 0x40562E4300000000
  %358 = select i1 %357, float 0x3EE0000000000000, float 0.000000e+00
  %359 = fsub float %353, %358
  %360 = fadd float %358, %356
  %361 = fmul float %359, 0x3FF7154760000000
  %362 = tail call float @llvm.rint.f32(float %361)
  %363 = fcmp ogt float %359, 0x40562E4300000000
  %364 = fcmp olt float %359, 0xC059D1DA00000000
  %365 = fneg float %361
  %366 = tail call float @llvm.fma.f32(float %359, float 0x3FF7154760000000, float %365)
  %367 = tail call float @llvm.fma.f32(float %359, float 0x3E54AE0BE0000000, float %366)
  %368 = fsub float %361, %362
  %369 = fadd float %367, %368
  %370 = tail call float @llvm.exp2.f32(float %369)
  %371 = fptosi float %362 to i32
  %372 = tail call float @llvm.amdgcn.ldexp.f32(float %370, i32 %371)
  %373 = select i1 %364, float 0.000000e+00, float %372
  %374 = select i1 %363, float 0x7FF0000000000000, float %373
  %375 = tail call float @llvm.fma.f32(float %374, float %360, float %374)
  %376 = tail call float @llvm.fabs.f32(float %374) #3
  %377 = fcmp oeq float %376, 0x7FF0000000000000
  %378 = select i1 %377, float %374, float %375
  %379 = fcmp uge float %4, 0.000000e+00
  %380 = or i1 %379, %191
  %381 = select i1 %380, float 0.000000e+00, float -0.000000e+00
  %382 = tail call float @llvm.copysign.f32(float %378, float %381)
  %383 = fcmp oeq float %234, 0x7FF0000000000000
  %384 = fcmp oeq float %4, 0.000000e+00
  %385 = or i1 %384, %383
  %386 = zext i1 %384 to i32
  %387 = icmp eq i32 %199, %386
  %388 = select i1 %387, float 0x7FF0000000000000, float 0.000000e+00
  %389 = select i1 %191, float 0.000000e+00, float %4
  %390 = tail call float @llvm.copysign.f32(float %388, float %389)
  %391 = select i1 %385, float %390, float %382
  %392 = fcmp uno float %4, 0.000000e+00
  %393 = select i1 %392, float 0x7FF8000000000000, float %391
  %394 = fpext float %393 to double
  %395 = fsub contract double 1.000000e+00, %394
  %396 = select i1 %207, double 0.000000e+00, double %395
  %397 = fdiv contract double %233, %396
  %398 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !16, !amdgpu.noclobber !14
  %400 = fpext float %399 to double
  %401 = fmul contract double %397, %400
  %402 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !16, !amdgpu.noclobber !14
  %404 = fcmp olt float %403, 0x39F0000000000000
  %405 = select i1 %404, float 0x41F0000000000000, float 1.000000e+00
  %406 = fmul float %403, %405
  %407 = tail call float @llvm.sqrt.f32(float %406)
  %408 = bitcast float %407 to i32
  %409 = add nsw i32 %408, -1
  %410 = bitcast i32 %409 to float
  %411 = add nsw i32 %408, 1
  %412 = bitcast i32 %411 to float
  %413 = tail call i1 @llvm.amdgcn.class.f32(float %406, i32 608)
  %414 = select i1 %404, float 0x3EF0000000000000, float 1.000000e+00
  %415 = fneg float %412
  %416 = tail call float @llvm.fma.f32(float %415, float %407, float %406)
  %417 = fcmp ogt float %416, 0.000000e+00
  %418 = fneg float %410
  %419 = tail call float @llvm.fma.f32(float %418, float %407, float %406)
  %420 = fcmp ole float %419, 0.000000e+00
  %421 = select i1 %420, float %410, float %407
  %422 = select i1 %417, float %412, float %421
  %423 = fmul float %414, %422
  %424 = select i1 %413, float %406, float %423
  %425 = fadd contract float %424, %7
  %426 = fpext float %425 to double
  %427 = fdiv contract double %401, %426
  %428 = fsub contract double %35, %427
  %429 = fptrunc double %428 to float
  store float %429, float addrspace(1)* %33, align 4, !tbaa !16
  br label %430

430:                                              ; preds = %9, %31
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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
