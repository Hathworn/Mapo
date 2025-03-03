; ModuleID = '../data/hip_kernels/2890/11/main.cu'
source_filename = "../data/hip_kernels/2890/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z41Compute_weightx_weighty2_normother_KernelPfS_PKfS1_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %8, %14
  %16 = add i32 %15, %9
  %17 = icmp slt i32 %16, %4
  br i1 %17, label %18, label %419

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  %22 = fsub contract float 2.000000e+00, %5
  %23 = tail call float @llvm.fabs.f32(float %21)
  %24 = tail call float @llvm.amdgcn.frexp.mant.f32(float %23)
  %25 = fcmp olt float %24, 0x3FE5555560000000
  %26 = zext i1 %25 to i32
  %27 = tail call float @llvm.amdgcn.ldexp.f32(float %24, i32 %26)
  %28 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %23)
  %29 = sub nsw i32 %28, %26
  %30 = fadd float %27, -1.000000e+00
  %31 = fadd float %27, 1.000000e+00
  %32 = fadd float %31, -1.000000e+00
  %33 = fsub float %27, %32
  %34 = tail call float @llvm.amdgcn.rcp.f32(float %31)
  %35 = fmul float %30, %34
  %36 = fmul float %31, %35
  %37 = fneg float %36
  %38 = tail call float @llvm.fma.f32(float %35, float %31, float %37)
  %39 = tail call float @llvm.fma.f32(float %35, float %33, float %38)
  %40 = fadd float %36, %39
  %41 = fsub float %40, %36
  %42 = fsub float %39, %41
  %43 = fsub float %30, %40
  %44 = fsub float %30, %43
  %45 = fsub float %44, %40
  %46 = fsub float %45, %42
  %47 = fadd float %43, %46
  %48 = fmul float %34, %47
  %49 = fadd float %35, %48
  %50 = fsub float %49, %35
  %51 = fsub float %48, %50
  %52 = fmul float %49, %49
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %49, float %49, float %53)
  %55 = fmul float %51, 2.000000e+00
  %56 = tail call float @llvm.fma.f32(float %49, float %55, float %54)
  %57 = fadd float %52, %56
  %58 = fsub float %57, %52
  %59 = fsub float %56, %58
  %60 = tail call float @llvm.fmuladd.f32(float %57, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %61 = tail call float @llvm.fmuladd.f32(float %57, float %60, float 0x3FD999BDE0000000)
  %62 = sitofp i32 %29 to float
  %63 = fmul float %62, 0x3FE62E4300000000
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %62, float 0x3FE62E4300000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %62, float 0xBE205C6100000000, float %65)
  %67 = fadd float %63, %66
  %68 = fsub float %67, %63
  %69 = fsub float %66, %68
  %70 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 1)
  %71 = fmul float %49, %57
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %57, float %49, float %72)
  %74 = tail call float @llvm.fma.f32(float %57, float %51, float %73)
  %75 = tail call float @llvm.fma.f32(float %59, float %49, float %74)
  %76 = fadd float %71, %75
  %77 = fsub float %76, %71
  %78 = fsub float %75, %77
  %79 = fmul float %57, %61
  %80 = fneg float %79
  %81 = tail call float @llvm.fma.f32(float %57, float %61, float %80)
  %82 = tail call float @llvm.fma.f32(float %59, float %61, float %81)
  %83 = fadd float %79, %82
  %84 = fsub float %83, %79
  %85 = fsub float %82, %84
  %86 = fadd float %83, 0x3FE5555540000000
  %87 = fadd float %86, 0xBFE5555540000000
  %88 = fsub float %83, %87
  %89 = fadd float %85, 0x3E2E720200000000
  %90 = fadd float %89, %88
  %91 = fadd float %86, %90
  %92 = fsub float %91, %86
  %93 = fsub float %90, %92
  %94 = fmul float %76, %91
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %76, float %91, float %95)
  %97 = tail call float @llvm.fma.f32(float %76, float %93, float %96)
  %98 = tail call float @llvm.fma.f32(float %78, float %91, float %97)
  %99 = tail call float @llvm.amdgcn.ldexp.f32(float %51, i32 1)
  %100 = fadd float %94, %98
  %101 = fsub float %100, %94
  %102 = fsub float %98, %101
  %103 = fadd float %70, %100
  %104 = fsub float %103, %70
  %105 = fsub float %100, %104
  %106 = fadd float %99, %102
  %107 = fadd float %106, %105
  %108 = fadd float %103, %107
  %109 = fsub float %108, %103
  %110 = fsub float %107, %109
  %111 = fadd float %67, %108
  %112 = fsub float %111, %67
  %113 = fsub float %111, %112
  %114 = fsub float %67, %113
  %115 = fsub float %108, %112
  %116 = fadd float %115, %114
  %117 = fadd float %69, %110
  %118 = fsub float %117, %69
  %119 = fsub float %117, %118
  %120 = fsub float %69, %119
  %121 = fsub float %110, %118
  %122 = fadd float %121, %120
  %123 = fadd float %117, %116
  %124 = fadd float %111, %123
  %125 = fsub float %124, %111
  %126 = fsub float %123, %125
  %127 = fadd float %122, %126
  %128 = fadd float %124, %127
  %129 = fsub float %128, %124
  %130 = fsub float %127, %129
  %131 = fmul float %22, %128
  %132 = fneg float %131
  %133 = tail call float @llvm.fma.f32(float %22, float %128, float %132)
  %134 = tail call float @llvm.fma.f32(float %22, float %130, float %133)
  %135 = fadd float %131, %134
  %136 = tail call float @llvm.fabs.f32(float %131) #3
  %137 = fcmp oeq float %136, 0x7FF0000000000000
  %138 = select i1 %137, float %131, float %135
  %139 = fcmp oeq float %138, 0x40562E4300000000
  %140 = select i1 %139, float 0x3EE0000000000000, float 0.000000e+00
  %141 = fsub float %138, %140
  %142 = fmul float %141, 0x3FF7154760000000
  %143 = tail call float @llvm.rint.f32(float %142)
  %144 = fcmp ogt float %141, 0x40562E4300000000
  %145 = fcmp olt float %141, 0xC059D1DA00000000
  %146 = fneg float %142
  %147 = tail call float @llvm.fma.f32(float %141, float 0x3FF7154760000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %141, float 0x3E54AE0BE0000000, float %147)
  %149 = fsub float %142, %143
  %150 = fadd float %148, %149
  %151 = tail call float @llvm.exp2.f32(float %150)
  %152 = fptosi float %143 to i32
  %153 = tail call float @llvm.amdgcn.ldexp.f32(float %151, i32 %152)
  %154 = select i1 %145, float 0.000000e+00, float %153
  %155 = select i1 %144, float 0x7FF0000000000000, float %154
  %156 = tail call float @llvm.fabs.f32(float %22)
  %157 = tail call float @llvm.trunc.f32(float %156)
  %158 = fcmp oeq float %156, %157
  %159 = zext i1 %158 to i32
  %160 = fmul float %157, 5.000000e-01
  %161 = tail call float @llvm.amdgcn.fract.f32(float %160)
  %162 = tail call i1 @llvm.amdgcn.class.f32(float %160, i32 516)
  %163 = select i1 %162, float 0.000000e+00, float %161
  %164 = fcmp oeq float %163, 0.000000e+00
  %165 = and i1 %158, %164
  %166 = zext i1 %165 to i32
  %167 = add nuw nsw i32 %166, %159
  %168 = icmp eq i32 %167, 1
  %169 = icmp ne i32 %167, 0
  %170 = fcmp oeq float %156, 0x7FF0000000000000
  br i1 %170, label %171, label %209

171:                                              ; preds = %18
  %172 = fcmp oeq float %23, 1.000000e+00
  %173 = fadd float %23, -1.000000e+00
  %174 = bitcast float %22 to i32
  %175 = bitcast float %173 to i32
  %176 = xor i32 %175, %174
  %177 = icmp sgt i32 %176, -1
  %178 = select i1 %177, float 0x7FF0000000000000, float 0.000000e+00
  %179 = select i1 %172, float %23, float %178
  %180 = fcmp oeq float %23, 0x7FF0000000000000
  %181 = fcmp oeq float %21, 0.000000e+00
  %182 = or i1 %181, %180
  %183 = fcmp olt float %22, 0.000000e+00
  %184 = xor i1 %183, %181
  %185 = select i1 %184, float 0.000000e+00, float 0x7FF0000000000000
  %186 = select i1 %168, float %21, float 0.000000e+00
  %187 = tail call float @llvm.copysign.f32(float %185, float %186)
  %188 = select i1 %182, float %187, float %179
  %189 = fcmp uno float %21, %22
  %190 = select i1 %189, float 0x7FF8000000000000, float %188
  %191 = fcmp oeq float %21, 1.000000e+00
  %192 = fcmp oeq float %22, 0.000000e+00
  %193 = or i1 %192, %191
  %194 = select i1 %193, float 1.000000e+00, float %190
  %195 = fadd contract float %194, %6
  %196 = fdiv contract float 1.000000e+00, %195
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  store float %196, float addrspace(1)* %197, align 4, !tbaa !7
  %198 = getelementptr inbounds float, float addrspace(1)* %3, i64 %19
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = tail call float @llvm.fabs.f32(float %199)
  %201 = fcmp oeq float %200, 1.000000e+00
  %202 = fadd float %200, -1.000000e+00
  %203 = bitcast float %22 to i32
  %204 = bitcast float %202 to i32
  %205 = xor i32 %204, %203
  %206 = icmp sgt i32 %205, -1
  %207 = select i1 %206, float 0x7FF0000000000000, float 0.000000e+00
  %208 = select i1 %201, float %200, float %207
  br label %397

209:                                              ; preds = %18
  %210 = fcmp uge float %21, 0.000000e+00
  %211 = select i1 %210, i1 true, i1 %169
  %212 = tail call float @llvm.fabs.f32(float %155) #3
  %213 = fcmp oeq float %212, 0x7FF0000000000000
  %214 = tail call float @llvm.fabs.f32(float %138) #3
  %215 = fcmp oeq float %214, 0x7FF0000000000000
  %216 = fsub float %135, %131
  %217 = fsub float %134, %216
  %218 = select i1 %215, float 0.000000e+00, float %217
  %219 = fadd float %140, %218
  %220 = tail call float @llvm.fma.f32(float %155, float %219, float %155)
  %221 = select i1 %213, float %155, float %220
  %222 = fcmp olt float %21, 0.000000e+00
  %223 = and i1 %168, %222
  %224 = select i1 %223, float -0.000000e+00, float 0.000000e+00
  %225 = tail call float @llvm.copysign.f32(float %221, float %224)
  %226 = select i1 %211, float %225, float 0x7FF8000000000000
  %227 = fcmp oeq float %23, 0x7FF0000000000000
  %228 = fcmp oeq float %21, 0.000000e+00
  %229 = or i1 %228, %227
  %230 = fcmp olt float %22, 0.000000e+00
  %231 = xor i1 %230, %228
  %232 = select i1 %231, float 0.000000e+00, float 0x7FF0000000000000
  %233 = select i1 %168, float %21, float 0.000000e+00
  %234 = tail call float @llvm.copysign.f32(float %232, float %233)
  %235 = select i1 %229, float %234, float %226
  %236 = fcmp uno float %21, %22
  %237 = select i1 %236, float 0x7FF8000000000000, float %235
  %238 = fcmp oeq float %21, 1.000000e+00
  %239 = fcmp oeq float %22, 0.000000e+00
  %240 = or i1 %239, %238
  %241 = select i1 %240, float 1.000000e+00, float %237
  %242 = fadd contract float %241, %6
  %243 = fdiv contract float 1.000000e+00, %242
  %244 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  store float %243, float addrspace(1)* %244, align 4, !tbaa !7
  %245 = getelementptr inbounds float, float addrspace(1)* %3, i64 %19
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7
  %247 = tail call float @llvm.fabs.f32(float %246)
  %248 = tail call float @llvm.amdgcn.frexp.mant.f32(float %247)
  %249 = fcmp olt float %248, 0x3FE5555560000000
  %250 = zext i1 %249 to i32
  %251 = tail call float @llvm.amdgcn.ldexp.f32(float %248, i32 %250)
  %252 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %247)
  %253 = sub nsw i32 %252, %250
  %254 = fadd float %251, -1.000000e+00
  %255 = fadd float %251, 1.000000e+00
  %256 = fadd float %255, -1.000000e+00
  %257 = fsub float %251, %256
  %258 = tail call float @llvm.amdgcn.rcp.f32(float %255)
  %259 = fmul float %254, %258
  %260 = fmul float %255, %259
  %261 = fneg float %260
  %262 = tail call float @llvm.fma.f32(float %259, float %255, float %261)
  %263 = tail call float @llvm.fma.f32(float %259, float %257, float %262)
  %264 = fadd float %260, %263
  %265 = fsub float %264, %260
  %266 = fsub float %263, %265
  %267 = fsub float %254, %264
  %268 = fsub float %254, %267
  %269 = fsub float %268, %264
  %270 = fsub float %269, %266
  %271 = fadd float %267, %270
  %272 = fmul float %258, %271
  %273 = fadd float %259, %272
  %274 = fsub float %273, %259
  %275 = fsub float %272, %274
  %276 = fmul float %273, %273
  %277 = fneg float %276
  %278 = tail call float @llvm.fma.f32(float %273, float %273, float %277)
  %279 = fmul float %275, 2.000000e+00
  %280 = tail call float @llvm.fma.f32(float %273, float %279, float %278)
  %281 = fadd float %276, %280
  %282 = fsub float %281, %276
  %283 = fsub float %280, %282
  %284 = tail call float @llvm.fmuladd.f32(float %281, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %285 = tail call float @llvm.fmuladd.f32(float %281, float %284, float 0x3FD999BDE0000000)
  %286 = sitofp i32 %253 to float
  %287 = fmul float %286, 0x3FE62E4300000000
  %288 = fneg float %287
  %289 = tail call float @llvm.fma.f32(float %286, float 0x3FE62E4300000000, float %288)
  %290 = tail call float @llvm.fma.f32(float %286, float 0xBE205C6100000000, float %289)
  %291 = fadd float %287, %290
  %292 = fsub float %291, %287
  %293 = fsub float %290, %292
  %294 = tail call float @llvm.amdgcn.ldexp.f32(float %273, i32 1)
  %295 = fmul float %273, %281
  %296 = fneg float %295
  %297 = tail call float @llvm.fma.f32(float %281, float %273, float %296)
  %298 = tail call float @llvm.fma.f32(float %281, float %275, float %297)
  %299 = tail call float @llvm.fma.f32(float %283, float %273, float %298)
  %300 = fadd float %295, %299
  %301 = fsub float %300, %295
  %302 = fsub float %299, %301
  %303 = fmul float %281, %285
  %304 = fneg float %303
  %305 = tail call float @llvm.fma.f32(float %281, float %285, float %304)
  %306 = tail call float @llvm.fma.f32(float %283, float %285, float %305)
  %307 = fadd float %303, %306
  %308 = fsub float %307, %303
  %309 = fsub float %306, %308
  %310 = fadd float %307, 0x3FE5555540000000
  %311 = fadd float %310, 0xBFE5555540000000
  %312 = fsub float %307, %311
  %313 = fadd float %309, 0x3E2E720200000000
  %314 = fadd float %313, %312
  %315 = fadd float %310, %314
  %316 = fsub float %315, %310
  %317 = fsub float %314, %316
  %318 = fmul float %300, %315
  %319 = fneg float %318
  %320 = tail call float @llvm.fma.f32(float %300, float %315, float %319)
  %321 = tail call float @llvm.fma.f32(float %300, float %317, float %320)
  %322 = tail call float @llvm.fma.f32(float %302, float %315, float %321)
  %323 = tail call float @llvm.amdgcn.ldexp.f32(float %275, i32 1)
  %324 = fadd float %318, %322
  %325 = fsub float %324, %318
  %326 = fsub float %322, %325
  %327 = fadd float %294, %324
  %328 = fsub float %327, %294
  %329 = fsub float %324, %328
  %330 = fadd float %323, %326
  %331 = fadd float %330, %329
  %332 = fadd float %327, %331
  %333 = fsub float %332, %327
  %334 = fsub float %331, %333
  %335 = fadd float %291, %332
  %336 = fsub float %335, %291
  %337 = fsub float %335, %336
  %338 = fsub float %291, %337
  %339 = fsub float %332, %336
  %340 = fadd float %339, %338
  %341 = fadd float %293, %334
  %342 = fsub float %341, %293
  %343 = fsub float %341, %342
  %344 = fsub float %293, %343
  %345 = fsub float %334, %342
  %346 = fadd float %345, %344
  %347 = fadd float %341, %340
  %348 = fadd float %335, %347
  %349 = fsub float %348, %335
  %350 = fsub float %347, %349
  %351 = fadd float %346, %350
  %352 = fadd float %348, %351
  %353 = fsub float %352, %348
  %354 = fsub float %351, %353
  %355 = fmul float %22, %352
  %356 = fneg float %355
  %357 = tail call float @llvm.fma.f32(float %22, float %352, float %356)
  %358 = tail call float @llvm.fma.f32(float %22, float %354, float %357)
  %359 = fadd float %355, %358
  %360 = fsub float %359, %355
  %361 = fsub float %358, %360
  %362 = tail call float @llvm.fabs.f32(float %355) #3
  %363 = fcmp oeq float %362, 0x7FF0000000000000
  %364 = select i1 %363, float %355, float %359
  %365 = tail call float @llvm.fabs.f32(float %364) #3
  %366 = fcmp oeq float %365, 0x7FF0000000000000
  %367 = select i1 %366, float 0.000000e+00, float %361
  %368 = fcmp oeq float %364, 0x40562E4300000000
  %369 = select i1 %368, float 0x3EE0000000000000, float 0.000000e+00
  %370 = fsub float %364, %369
  %371 = fadd float %369, %367
  %372 = fmul float %370, 0x3FF7154760000000
  %373 = tail call float @llvm.rint.f32(float %372)
  %374 = fcmp ogt float %370, 0x40562E4300000000
  %375 = fcmp olt float %370, 0xC059D1DA00000000
  %376 = fneg float %372
  %377 = tail call float @llvm.fma.f32(float %370, float 0x3FF7154760000000, float %376)
  %378 = tail call float @llvm.fma.f32(float %370, float 0x3E54AE0BE0000000, float %377)
  %379 = fsub float %372, %373
  %380 = fadd float %378, %379
  %381 = tail call float @llvm.exp2.f32(float %380)
  %382 = fptosi float %373 to i32
  %383 = tail call float @llvm.amdgcn.ldexp.f32(float %381, i32 %382)
  %384 = select i1 %375, float 0.000000e+00, float %383
  %385 = select i1 %374, float 0x7FF0000000000000, float %384
  %386 = tail call float @llvm.fma.f32(float %385, float %371, float %385)
  %387 = tail call float @llvm.fabs.f32(float %385) #3
  %388 = fcmp oeq float %387, 0x7FF0000000000000
  %389 = select i1 %388, float %385, float %386
  %390 = fcmp olt float %246, 0.000000e+00
  %391 = and i1 %168, %390
  %392 = select i1 %391, float -0.000000e+00, float 0.000000e+00
  %393 = tail call float @llvm.copysign.f32(float %389, float %392)
  %394 = fcmp uge float %246, 0.000000e+00
  %395 = select i1 %394, i1 true, i1 %169
  %396 = select i1 %395, float %393, float 0x7FF8000000000000
  br label %397

397:                                              ; preds = %209, %171
  %398 = phi float [ %247, %209 ], [ %200, %171 ]
  %399 = phi float [ %246, %209 ], [ %199, %171 ]
  %400 = phi i1 [ %239, %209 ], [ %192, %171 ]
  %401 = phi i1 [ %230, %209 ], [ %183, %171 ]
  %402 = phi float [ %396, %209 ], [ %208, %171 ]
  %403 = fcmp oeq float %398, 0x7FF0000000000000
  %404 = fcmp oeq float %399, 0.000000e+00
  %405 = or i1 %404, %403
  %406 = xor i1 %401, %404
  %407 = select i1 %406, float 0.000000e+00, float 0x7FF0000000000000
  %408 = select i1 %168, float %399, float 0.000000e+00
  %409 = tail call float @llvm.copysign.f32(float %407, float %408)
  %410 = select i1 %405, float %409, float %402
  %411 = fcmp uno float %399, %22
  %412 = select i1 %411, float 0x7FF8000000000000, float %410
  %413 = fcmp oeq float %399, 1.000000e+00
  %414 = or i1 %400, %413
  %415 = select i1 %414, float 1.000000e+00, float %412
  %416 = fadd contract float %415, %6
  %417 = fdiv contract float 1.000000e+00, %416
  %418 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  store float %417, float addrspace(1)* %418, align 4, !tbaa !7
  br label %419

419:                                              ; preds = %7, %397
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
