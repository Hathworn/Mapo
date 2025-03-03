; ModuleID = '../data/hip_kernels/2890/0/main.cu'
source_filename = "../data/hip_kernels/2890/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22Compute_psi_phi_KernelPfS_PKfS1_S1_S1_ifff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, float %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %11, %17
  %19 = add i32 %18, %12
  %20 = icmp slt i32 %19, %6
  br i1 %20, label %21, label %782

21:                                               ; preds = %10
  %22 = fcmp contract oeq float %7, 0.000000e+00
  br i1 %22, label %406, label %23

23:                                               ; preds = %21
  %24 = fcmp contract oeq float %7, 1.000000e+00
  br i1 %24, label %25, label %31

25:                                               ; preds = %23
  %26 = sext i32 %19 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %406

31:                                               ; preds = %23
  %32 = fcmp contract oeq float %7, 2.000000e+00
  %33 = sext i32 %19 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  br i1 %32, label %36, label %41

36:                                               ; preds = %31
  %37 = fmul contract float %35, %35
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = fmul contract float %39, %39
  br label %406

41:                                               ; preds = %31
  %42 = tail call float @llvm.fabs.f32(float %35)
  %43 = tail call float @llvm.amdgcn.frexp.mant.f32(float %42)
  %44 = fcmp olt float %43, 0x3FE5555560000000
  %45 = zext i1 %44 to i32
  %46 = tail call float @llvm.amdgcn.ldexp.f32(float %43, i32 %45)
  %47 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %42)
  %48 = sub nsw i32 %47, %45
  %49 = fadd float %46, -1.000000e+00
  %50 = fadd float %46, 1.000000e+00
  %51 = fadd float %50, -1.000000e+00
  %52 = fsub float %46, %51
  %53 = tail call float @llvm.amdgcn.rcp.f32(float %50)
  %54 = fmul float %49, %53
  %55 = fmul float %50, %54
  %56 = fneg float %55
  %57 = tail call float @llvm.fma.f32(float %54, float %50, float %56)
  %58 = tail call float @llvm.fma.f32(float %54, float %52, float %57)
  %59 = fadd float %55, %58
  %60 = fsub float %59, %55
  %61 = fsub float %58, %60
  %62 = fsub float %49, %59
  %63 = fsub float %49, %62
  %64 = fsub float %63, %59
  %65 = fsub float %64, %61
  %66 = fadd float %62, %65
  %67 = fmul float %53, %66
  %68 = fadd float %54, %67
  %69 = fsub float %68, %54
  %70 = fsub float %67, %69
  %71 = fmul float %68, %68
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %68, float %68, float %72)
  %74 = fmul float %70, 2.000000e+00
  %75 = tail call float @llvm.fma.f32(float %68, float %74, float %73)
  %76 = fadd float %71, %75
  %77 = fsub float %76, %71
  %78 = fsub float %75, %77
  %79 = tail call float @llvm.fmuladd.f32(float %76, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %80 = tail call float @llvm.fmuladd.f32(float %76, float %79, float 0x3FD999BDE0000000)
  %81 = sitofp i32 %48 to float
  %82 = fmul float %81, 0x3FE62E4300000000
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %81, float 0x3FE62E4300000000, float %83)
  %85 = tail call float @llvm.fma.f32(float %81, float 0xBE205C6100000000, float %84)
  %86 = fadd float %82, %85
  %87 = fsub float %86, %82
  %88 = fsub float %85, %87
  %89 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 1)
  %90 = fmul float %68, %76
  %91 = fneg float %90
  %92 = tail call float @llvm.fma.f32(float %76, float %68, float %91)
  %93 = tail call float @llvm.fma.f32(float %76, float %70, float %92)
  %94 = tail call float @llvm.fma.f32(float %78, float %68, float %93)
  %95 = fadd float %90, %94
  %96 = fsub float %95, %90
  %97 = fsub float %94, %96
  %98 = fmul float %76, %80
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %76, float %80, float %99)
  %101 = tail call float @llvm.fma.f32(float %78, float %80, float %100)
  %102 = fadd float %98, %101
  %103 = fsub float %102, %98
  %104 = fsub float %101, %103
  %105 = fadd float %102, 0x3FE5555540000000
  %106 = fadd float %105, 0xBFE5555540000000
  %107 = fsub float %102, %106
  %108 = fadd float %104, 0x3E2E720200000000
  %109 = fadd float %108, %107
  %110 = fadd float %105, %109
  %111 = fsub float %110, %105
  %112 = fsub float %109, %111
  %113 = fmul float %95, %110
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %95, float %110, float %114)
  %116 = tail call float @llvm.fma.f32(float %95, float %112, float %115)
  %117 = tail call float @llvm.fma.f32(float %97, float %110, float %116)
  %118 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 1)
  %119 = fadd float %113, %117
  %120 = fsub float %119, %113
  %121 = fsub float %117, %120
  %122 = fadd float %89, %119
  %123 = fsub float %122, %89
  %124 = fsub float %119, %123
  %125 = fadd float %118, %121
  %126 = fadd float %125, %124
  %127 = fadd float %122, %126
  %128 = fsub float %127, %122
  %129 = fsub float %126, %128
  %130 = fadd float %86, %127
  %131 = fsub float %130, %86
  %132 = fsub float %130, %131
  %133 = fsub float %86, %132
  %134 = fsub float %127, %131
  %135 = fadd float %134, %133
  %136 = fadd float %88, %129
  %137 = fsub float %136, %88
  %138 = fsub float %136, %137
  %139 = fsub float %88, %138
  %140 = fsub float %129, %137
  %141 = fadd float %140, %139
  %142 = fadd float %136, %135
  %143 = fadd float %130, %142
  %144 = fsub float %143, %130
  %145 = fsub float %142, %144
  %146 = fadd float %141, %145
  %147 = fadd float %143, %146
  %148 = fsub float %147, %143
  %149 = fsub float %146, %148
  %150 = fmul float %147, %7
  %151 = fneg float %150
  %152 = tail call float @llvm.fma.f32(float %7, float %147, float %151)
  %153 = tail call float @llvm.fma.f32(float %7, float %149, float %152)
  %154 = fadd float %150, %153
  %155 = fsub float %154, %150
  %156 = fsub float %153, %155
  %157 = tail call float @llvm.fabs.f32(float %150) #3
  %158 = fcmp oeq float %157, 0x7FF0000000000000
  %159 = select i1 %158, float %150, float %154
  %160 = tail call float @llvm.fabs.f32(float %159) #3
  %161 = fcmp oeq float %160, 0x7FF0000000000000
  %162 = select i1 %161, float 0.000000e+00, float %156
  %163 = fcmp oeq float %159, 0x40562E4300000000
  %164 = select i1 %163, float 0x3EE0000000000000, float 0.000000e+00
  %165 = fsub float %159, %164
  %166 = fadd float %164, %162
  %167 = fmul float %165, 0x3FF7154760000000
  %168 = tail call float @llvm.rint.f32(float %167)
  %169 = fcmp ogt float %165, 0x40562E4300000000
  %170 = fcmp olt float %165, 0xC059D1DA00000000
  %171 = fneg float %167
  %172 = tail call float @llvm.fma.f32(float %165, float 0x3FF7154760000000, float %171)
  %173 = tail call float @llvm.fma.f32(float %165, float 0x3E54AE0BE0000000, float %172)
  %174 = fsub float %167, %168
  %175 = fadd float %173, %174
  %176 = tail call float @llvm.exp2.f32(float %175)
  %177 = fptosi float %168 to i32
  %178 = tail call float @llvm.amdgcn.ldexp.f32(float %176, i32 %177)
  %179 = select i1 %170, float 0.000000e+00, float %178
  %180 = select i1 %169, float 0x7FF0000000000000, float %179
  %181 = tail call float @llvm.fma.f32(float %180, float %166, float %180)
  %182 = tail call float @llvm.fabs.f32(float %180) #3
  %183 = fcmp oeq float %182, 0x7FF0000000000000
  %184 = select i1 %183, float %180, float %181
  %185 = tail call float @llvm.fabs.f32(float %7)
  %186 = tail call float @llvm.trunc.f32(float %185)
  %187 = fcmp oeq float %185, %186
  %188 = zext i1 %187 to i32
  %189 = fmul float %186, 5.000000e-01
  %190 = tail call float @llvm.amdgcn.fract.f32(float %189)
  %191 = tail call i1 @llvm.amdgcn.class.f32(float %189, i32 516)
  %192 = select i1 %191, float 0.000000e+00, float %190
  %193 = fcmp oeq float %192, 0.000000e+00
  %194 = and i1 %187, %193
  %195 = zext i1 %194 to i32
  %196 = add nuw nsw i32 %195, %188
  %197 = icmp eq i32 %196, 1
  %198 = fcmp olt float %35, 0.000000e+00
  %199 = and i1 %197, %198
  %200 = select i1 %199, float -0.000000e+00, float 0.000000e+00
  %201 = tail call float @llvm.copysign.f32(float %184, float %200)
  %202 = fcmp uge float %35, 0.000000e+00
  %203 = icmp ne i32 %196, 0
  %204 = select i1 %202, i1 true, i1 %203
  %205 = select i1 %204, float %201, float 0x7FF8000000000000
  %206 = fcmp oeq float %185, 0x7FF0000000000000
  br i1 %206, label %207, label %216

207:                                              ; preds = %41
  %208 = fcmp oeq float %42, 1.000000e+00
  %209 = fadd float %42, -1.000000e+00
  %210 = bitcast float %7 to i32
  %211 = bitcast float %209 to i32
  %212 = xor i32 %211, %210
  %213 = icmp sgt i32 %212, -1
  %214 = select i1 %213, float 0x7FF0000000000000, float 0.000000e+00
  %215 = select i1 %208, float %42, float %214
  br label %216

216:                                              ; preds = %41, %207
  %217 = phi float [ %205, %41 ], [ %215, %207 ]
  %218 = fcmp oeq float %42, 0x7FF0000000000000
  %219 = fcmp oeq float %35, 0.000000e+00
  %220 = or i1 %219, %218
  %221 = fcmp olt float %7, 0.000000e+00
  %222 = xor i1 %221, %219
  %223 = select i1 %222, float 0.000000e+00, float 0x7FF0000000000000
  %224 = select i1 %197, float %35, float 0.000000e+00
  %225 = tail call float @llvm.copysign.f32(float %223, float %224)
  %226 = select i1 %220, float %225, float %217
  %227 = fcmp uno float %35, %7
  %228 = select i1 %227, float 0x7FF8000000000000, float %226
  %229 = fcmp oeq float %35, 1.000000e+00
  %230 = select i1 %229, float 1.000000e+00, float %228
  %231 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !6
  %233 = tail call float @llvm.fabs.f32(float %232)
  %234 = tail call float @llvm.amdgcn.frexp.mant.f32(float %233)
  %235 = fcmp olt float %234, 0x3FE5555560000000
  %236 = zext i1 %235 to i32
  %237 = tail call float @llvm.amdgcn.ldexp.f32(float %234, i32 %236)
  %238 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %233)
  %239 = sub nsw i32 %238, %236
  %240 = fadd float %237, -1.000000e+00
  %241 = fadd float %237, 1.000000e+00
  %242 = fadd float %241, -1.000000e+00
  %243 = fsub float %237, %242
  %244 = tail call float @llvm.amdgcn.rcp.f32(float %241)
  %245 = fmul float %240, %244
  %246 = fmul float %241, %245
  %247 = fneg float %246
  %248 = tail call float @llvm.fma.f32(float %245, float %241, float %247)
  %249 = tail call float @llvm.fma.f32(float %245, float %243, float %248)
  %250 = fadd float %246, %249
  %251 = fsub float %250, %246
  %252 = fsub float %249, %251
  %253 = fsub float %240, %250
  %254 = fsub float %240, %253
  %255 = fsub float %254, %250
  %256 = fsub float %255, %252
  %257 = fadd float %253, %256
  %258 = fmul float %244, %257
  %259 = fadd float %245, %258
  %260 = fsub float %259, %245
  %261 = fsub float %258, %260
  %262 = fmul float %259, %259
  %263 = fneg float %262
  %264 = tail call float @llvm.fma.f32(float %259, float %259, float %263)
  %265 = fmul float %261, 2.000000e+00
  %266 = tail call float @llvm.fma.f32(float %259, float %265, float %264)
  %267 = fadd float %262, %266
  %268 = fsub float %267, %262
  %269 = fsub float %266, %268
  %270 = tail call float @llvm.fmuladd.f32(float %267, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %271 = tail call float @llvm.fmuladd.f32(float %267, float %270, float 0x3FD999BDE0000000)
  %272 = sitofp i32 %239 to float
  %273 = fmul float %272, 0x3FE62E4300000000
  %274 = fneg float %273
  %275 = tail call float @llvm.fma.f32(float %272, float 0x3FE62E4300000000, float %274)
  %276 = tail call float @llvm.fma.f32(float %272, float 0xBE205C6100000000, float %275)
  %277 = fadd float %273, %276
  %278 = fsub float %277, %273
  %279 = fsub float %276, %278
  %280 = tail call float @llvm.amdgcn.ldexp.f32(float %259, i32 1)
  %281 = fmul float %259, %267
  %282 = fneg float %281
  %283 = tail call float @llvm.fma.f32(float %267, float %259, float %282)
  %284 = tail call float @llvm.fma.f32(float %267, float %261, float %283)
  %285 = tail call float @llvm.fma.f32(float %269, float %259, float %284)
  %286 = fadd float %281, %285
  %287 = fsub float %286, %281
  %288 = fsub float %285, %287
  %289 = fmul float %267, %271
  %290 = fneg float %289
  %291 = tail call float @llvm.fma.f32(float %267, float %271, float %290)
  %292 = tail call float @llvm.fma.f32(float %269, float %271, float %291)
  %293 = fadd float %289, %292
  %294 = fsub float %293, %289
  %295 = fsub float %292, %294
  %296 = fadd float %293, 0x3FE5555540000000
  %297 = fadd float %296, 0xBFE5555540000000
  %298 = fsub float %293, %297
  %299 = fadd float %295, 0x3E2E720200000000
  %300 = fadd float %299, %298
  %301 = fadd float %296, %300
  %302 = fsub float %301, %296
  %303 = fsub float %300, %302
  %304 = fmul float %286, %301
  %305 = fneg float %304
  %306 = tail call float @llvm.fma.f32(float %286, float %301, float %305)
  %307 = tail call float @llvm.fma.f32(float %286, float %303, float %306)
  %308 = tail call float @llvm.fma.f32(float %288, float %301, float %307)
  %309 = tail call float @llvm.amdgcn.ldexp.f32(float %261, i32 1)
  %310 = fadd float %304, %308
  %311 = fsub float %310, %304
  %312 = fsub float %308, %311
  %313 = fadd float %280, %310
  %314 = fsub float %313, %280
  %315 = fsub float %310, %314
  %316 = fadd float %309, %312
  %317 = fadd float %316, %315
  %318 = fadd float %313, %317
  %319 = fsub float %318, %313
  %320 = fsub float %317, %319
  %321 = fadd float %277, %318
  %322 = fsub float %321, %277
  %323 = fsub float %321, %322
  %324 = fsub float %277, %323
  %325 = fsub float %318, %322
  %326 = fadd float %325, %324
  %327 = fadd float %279, %320
  %328 = fsub float %327, %279
  %329 = fsub float %327, %328
  %330 = fsub float %279, %329
  %331 = fsub float %320, %328
  %332 = fadd float %331, %330
  %333 = fadd float %327, %326
  %334 = fadd float %321, %333
  %335 = fsub float %334, %321
  %336 = fsub float %333, %335
  %337 = fadd float %332, %336
  %338 = fadd float %334, %337
  %339 = fsub float %338, %334
  %340 = fsub float %337, %339
  %341 = fmul float %338, %7
  %342 = fneg float %341
  %343 = tail call float @llvm.fma.f32(float %7, float %338, float %342)
  %344 = tail call float @llvm.fma.f32(float %7, float %340, float %343)
  %345 = fadd float %341, %344
  %346 = fsub float %345, %341
  %347 = fsub float %344, %346
  %348 = tail call float @llvm.fabs.f32(float %341) #3
  %349 = fcmp oeq float %348, 0x7FF0000000000000
  %350 = select i1 %349, float %341, float %345
  %351 = tail call float @llvm.fabs.f32(float %350) #3
  %352 = fcmp oeq float %351, 0x7FF0000000000000
  %353 = select i1 %352, float 0.000000e+00, float %347
  %354 = fcmp oeq float %350, 0x40562E4300000000
  %355 = select i1 %354, float 0x3EE0000000000000, float 0.000000e+00
  %356 = fsub float %350, %355
  %357 = fadd float %355, %353
  %358 = fmul float %356, 0x3FF7154760000000
  %359 = tail call float @llvm.rint.f32(float %358)
  %360 = fcmp ogt float %356, 0x40562E4300000000
  %361 = fcmp olt float %356, 0xC059D1DA00000000
  %362 = fneg float %358
  %363 = tail call float @llvm.fma.f32(float %356, float 0x3FF7154760000000, float %362)
  %364 = tail call float @llvm.fma.f32(float %356, float 0x3E54AE0BE0000000, float %363)
  %365 = fsub float %358, %359
  %366 = fadd float %364, %365
  %367 = tail call float @llvm.exp2.f32(float %366)
  %368 = fptosi float %359 to i32
  %369 = tail call float @llvm.amdgcn.ldexp.f32(float %367, i32 %368)
  %370 = select i1 %361, float 0.000000e+00, float %369
  %371 = select i1 %360, float 0x7FF0000000000000, float %370
  %372 = tail call float @llvm.fma.f32(float %371, float %357, float %371)
  %373 = tail call float @llvm.fabs.f32(float %371) #3
  %374 = fcmp oeq float %373, 0x7FF0000000000000
  %375 = select i1 %374, float %371, float %372
  %376 = fcmp olt float %232, 0.000000e+00
  %377 = and i1 %197, %376
  %378 = select i1 %377, float -0.000000e+00, float 0.000000e+00
  %379 = tail call float @llvm.copysign.f32(float %375, float %378)
  %380 = fcmp uge float %232, 0.000000e+00
  %381 = select i1 %380, i1 true, i1 %203
  %382 = select i1 %381, float %379, float 0x7FF8000000000000
  br i1 %206, label %383, label %392

383:                                              ; preds = %216
  %384 = fcmp oeq float %233, 1.000000e+00
  %385 = fadd float %233, -1.000000e+00
  %386 = bitcast float %7 to i32
  %387 = bitcast float %385 to i32
  %388 = xor i32 %387, %386
  %389 = icmp sgt i32 %388, -1
  %390 = select i1 %389, float 0x7FF0000000000000, float 0.000000e+00
  %391 = select i1 %384, float %233, float %390
  br label %392

392:                                              ; preds = %216, %383
  %393 = phi float [ %382, %216 ], [ %391, %383 ]
  %394 = fcmp oeq float %233, 0x7FF0000000000000
  %395 = fcmp oeq float %232, 0.000000e+00
  %396 = or i1 %395, %394
  %397 = xor i1 %221, %395
  %398 = select i1 %397, float 0.000000e+00, float 0x7FF0000000000000
  %399 = select i1 %197, float %232, float 0.000000e+00
  %400 = tail call float @llvm.copysign.f32(float %398, float %399)
  %401 = select i1 %396, float %400, float %393
  %402 = fcmp uno float %232, %7
  %403 = select i1 %402, float 0x7FF8000000000000, float %401
  %404 = fcmp oeq float %232, 1.000000e+00
  %405 = select i1 %404, float 1.000000e+00, float %403
  br label %406

406:                                              ; preds = %21, %25, %392, %36
  %407 = phi float [ %28, %25 ], [ %37, %36 ], [ %230, %392 ], [ 1.000000e+00, %21 ]
  %408 = phi float [ %30, %25 ], [ %40, %36 ], [ %405, %392 ], [ 1.000000e+00, %21 ]
  %409 = fcmp contract oeq float %8, 0.000000e+00
  br i1 %409, label %410, label %412

410:                                              ; preds = %406
  %411 = sext i32 %19 to i64
  br label %774

412:                                              ; preds = %406
  %413 = fcmp contract oeq float %8, 1.000000e+00
  br i1 %413, label %414, label %424

414:                                              ; preds = %412
  %415 = sext i32 %19 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %4, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !7, !amdgpu.noclobber !6
  %418 = tail call float @llvm.fabs.f32(float %417)
  %419 = fadd contract float %418, %9
  %420 = getelementptr inbounds float, float addrspace(1)* %5, i64 %415
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !7, !amdgpu.noclobber !6
  %422 = tail call float @llvm.fabs.f32(float %421)
  %423 = fadd contract float %422, %9
  br label %774

424:                                              ; preds = %412
  %425 = fcmp contract oeq float %8, 2.000000e+00
  %426 = sext i32 %19 to i64
  %427 = getelementptr inbounds float, float addrspace(1)* %4, i64 %426
  %428 = load float, float addrspace(1)* %427, align 4, !tbaa !7
  br i1 %425, label %429, label %436

429:                                              ; preds = %424
  %430 = fmul contract float %428, %428
  %431 = fadd contract float %430, %9
  %432 = getelementptr inbounds float, float addrspace(1)* %5, i64 %426
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !7, !amdgpu.noclobber !6
  %434 = fmul contract float %433, %433
  %435 = fadd contract float %434, %9
  br label %774

436:                                              ; preds = %424
  %437 = tail call float @llvm.fabs.f32(float %428)
  %438 = tail call float @llvm.amdgcn.frexp.mant.f32(float %437)
  %439 = fcmp olt float %438, 0x3FE5555560000000
  %440 = zext i1 %439 to i32
  %441 = tail call float @llvm.amdgcn.ldexp.f32(float %438, i32 %440)
  %442 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %437)
  %443 = sub nsw i32 %442, %440
  %444 = fadd float %441, -1.000000e+00
  %445 = fadd float %441, 1.000000e+00
  %446 = fadd float %445, -1.000000e+00
  %447 = fsub float %441, %446
  %448 = tail call float @llvm.amdgcn.rcp.f32(float %445)
  %449 = fmul float %444, %448
  %450 = fmul float %445, %449
  %451 = fneg float %450
  %452 = tail call float @llvm.fma.f32(float %449, float %445, float %451)
  %453 = tail call float @llvm.fma.f32(float %449, float %447, float %452)
  %454 = fadd float %450, %453
  %455 = fsub float %454, %450
  %456 = fsub float %453, %455
  %457 = fsub float %444, %454
  %458 = fsub float %444, %457
  %459 = fsub float %458, %454
  %460 = fsub float %459, %456
  %461 = fadd float %457, %460
  %462 = fmul float %448, %461
  %463 = fadd float %449, %462
  %464 = fsub float %463, %449
  %465 = fsub float %462, %464
  %466 = fmul float %463, %463
  %467 = fneg float %466
  %468 = tail call float @llvm.fma.f32(float %463, float %463, float %467)
  %469 = fmul float %465, 2.000000e+00
  %470 = tail call float @llvm.fma.f32(float %463, float %469, float %468)
  %471 = fadd float %466, %470
  %472 = fsub float %471, %466
  %473 = fsub float %470, %472
  %474 = tail call float @llvm.fmuladd.f32(float %471, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %475 = tail call float @llvm.fmuladd.f32(float %471, float %474, float 0x3FD999BDE0000000)
  %476 = sitofp i32 %443 to float
  %477 = fmul float %476, 0x3FE62E4300000000
  %478 = fneg float %477
  %479 = tail call float @llvm.fma.f32(float %476, float 0x3FE62E4300000000, float %478)
  %480 = tail call float @llvm.fma.f32(float %476, float 0xBE205C6100000000, float %479)
  %481 = fadd float %477, %480
  %482 = fsub float %481, %477
  %483 = fsub float %480, %482
  %484 = tail call float @llvm.amdgcn.ldexp.f32(float %463, i32 1)
  %485 = fmul float %463, %471
  %486 = fneg float %485
  %487 = tail call float @llvm.fma.f32(float %471, float %463, float %486)
  %488 = tail call float @llvm.fma.f32(float %471, float %465, float %487)
  %489 = tail call float @llvm.fma.f32(float %473, float %463, float %488)
  %490 = fadd float %485, %489
  %491 = fsub float %490, %485
  %492 = fsub float %489, %491
  %493 = fmul float %471, %475
  %494 = fneg float %493
  %495 = tail call float @llvm.fma.f32(float %471, float %475, float %494)
  %496 = tail call float @llvm.fma.f32(float %473, float %475, float %495)
  %497 = fadd float %493, %496
  %498 = fsub float %497, %493
  %499 = fsub float %496, %498
  %500 = fadd float %497, 0x3FE5555540000000
  %501 = fadd float %500, 0xBFE5555540000000
  %502 = fsub float %497, %501
  %503 = fadd float %499, 0x3E2E720200000000
  %504 = fadd float %503, %502
  %505 = fadd float %500, %504
  %506 = fsub float %505, %500
  %507 = fsub float %504, %506
  %508 = fmul float %490, %505
  %509 = fneg float %508
  %510 = tail call float @llvm.fma.f32(float %490, float %505, float %509)
  %511 = tail call float @llvm.fma.f32(float %490, float %507, float %510)
  %512 = tail call float @llvm.fma.f32(float %492, float %505, float %511)
  %513 = tail call float @llvm.amdgcn.ldexp.f32(float %465, i32 1)
  %514 = fadd float %508, %512
  %515 = fsub float %514, %508
  %516 = fsub float %512, %515
  %517 = fadd float %484, %514
  %518 = fsub float %517, %484
  %519 = fsub float %514, %518
  %520 = fadd float %513, %516
  %521 = fadd float %520, %519
  %522 = fadd float %517, %521
  %523 = fsub float %522, %517
  %524 = fsub float %521, %523
  %525 = fadd float %481, %522
  %526 = fsub float %525, %481
  %527 = fsub float %525, %526
  %528 = fsub float %481, %527
  %529 = fsub float %522, %526
  %530 = fadd float %529, %528
  %531 = fadd float %483, %524
  %532 = fsub float %531, %483
  %533 = fsub float %531, %532
  %534 = fsub float %483, %533
  %535 = fsub float %524, %532
  %536 = fadd float %535, %534
  %537 = fadd float %531, %530
  %538 = fadd float %525, %537
  %539 = fsub float %538, %525
  %540 = fsub float %537, %539
  %541 = fadd float %536, %540
  %542 = fadd float %538, %541
  %543 = fsub float %542, %538
  %544 = fsub float %541, %543
  %545 = fmul float %542, %8
  %546 = fneg float %545
  %547 = tail call float @llvm.fma.f32(float %8, float %542, float %546)
  %548 = tail call float @llvm.fma.f32(float %8, float %544, float %547)
  %549 = fadd float %545, %548
  %550 = fsub float %549, %545
  %551 = fsub float %548, %550
  %552 = tail call float @llvm.fabs.f32(float %545) #3
  %553 = fcmp oeq float %552, 0x7FF0000000000000
  %554 = select i1 %553, float %545, float %549
  %555 = tail call float @llvm.fabs.f32(float %554) #3
  %556 = fcmp oeq float %555, 0x7FF0000000000000
  %557 = select i1 %556, float 0.000000e+00, float %551
  %558 = fcmp oeq float %554, 0x40562E4300000000
  %559 = select i1 %558, float 0x3EE0000000000000, float 0.000000e+00
  %560 = fsub float %554, %559
  %561 = fadd float %559, %557
  %562 = fmul float %560, 0x3FF7154760000000
  %563 = tail call float @llvm.rint.f32(float %562)
  %564 = fcmp ogt float %560, 0x40562E4300000000
  %565 = fcmp olt float %560, 0xC059D1DA00000000
  %566 = fneg float %562
  %567 = tail call float @llvm.fma.f32(float %560, float 0x3FF7154760000000, float %566)
  %568 = tail call float @llvm.fma.f32(float %560, float 0x3E54AE0BE0000000, float %567)
  %569 = fsub float %562, %563
  %570 = fadd float %568, %569
  %571 = tail call float @llvm.exp2.f32(float %570)
  %572 = fptosi float %563 to i32
  %573 = tail call float @llvm.amdgcn.ldexp.f32(float %571, i32 %572)
  %574 = select i1 %565, float 0.000000e+00, float %573
  %575 = select i1 %564, float 0x7FF0000000000000, float %574
  %576 = tail call float @llvm.fma.f32(float %575, float %561, float %575)
  %577 = tail call float @llvm.fabs.f32(float %575) #3
  %578 = fcmp oeq float %577, 0x7FF0000000000000
  %579 = select i1 %578, float %575, float %576
  %580 = tail call float @llvm.fabs.f32(float %8)
  %581 = tail call float @llvm.fabs.f32(float %579)
  %582 = fcmp oeq float %580, 0x7FF0000000000000
  br i1 %582, label %583, label %592

583:                                              ; preds = %436
  %584 = fcmp oeq float %437, 1.000000e+00
  %585 = fadd float %437, -1.000000e+00
  %586 = bitcast float %8 to i32
  %587 = bitcast float %585 to i32
  %588 = xor i32 %587, %586
  %589 = icmp sgt i32 %588, -1
  %590 = select i1 %589, float 0x7FF0000000000000, float 0.000000e+00
  %591 = select i1 %584, float %437, float %590
  br label %592

592:                                              ; preds = %436, %583
  %593 = phi float [ %581, %436 ], [ %591, %583 ]
  %594 = fcmp oeq float %437, 0x7FF0000000000000
  %595 = fcmp oeq float %428, 0.000000e+00
  %596 = or i1 %595, %594
  %597 = fcmp olt float %8, 0.000000e+00
  %598 = xor i1 %597, %595
  %599 = select i1 %598, float 0.000000e+00, float 0x7FF0000000000000
  %600 = select i1 %596, float %599, float %593
  %601 = fcmp uno float %437, %8
  %602 = select i1 %601, float 0x7FF8000000000000, float %600
  %603 = fcmp oeq float %437, 1.000000e+00
  %604 = select i1 %603, float 1.000000e+00, float %602
  %605 = fadd contract float %604, %9
  %606 = getelementptr inbounds float, float addrspace(1)* %5, i64 %426
  %607 = load float, float addrspace(1)* %606, align 4, !tbaa !7, !amdgpu.noclobber !6
  %608 = tail call float @llvm.fabs.f32(float %607)
  %609 = tail call float @llvm.amdgcn.frexp.mant.f32(float %608)
  %610 = fcmp olt float %609, 0x3FE5555560000000
  %611 = zext i1 %610 to i32
  %612 = tail call float @llvm.amdgcn.ldexp.f32(float %609, i32 %611)
  %613 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %608)
  %614 = sub nsw i32 %613, %611
  %615 = fadd float %612, -1.000000e+00
  %616 = fadd float %612, 1.000000e+00
  %617 = fadd float %616, -1.000000e+00
  %618 = fsub float %612, %617
  %619 = tail call float @llvm.amdgcn.rcp.f32(float %616)
  %620 = fmul float %615, %619
  %621 = fmul float %616, %620
  %622 = fneg float %621
  %623 = tail call float @llvm.fma.f32(float %620, float %616, float %622)
  %624 = tail call float @llvm.fma.f32(float %620, float %618, float %623)
  %625 = fadd float %621, %624
  %626 = fsub float %625, %621
  %627 = fsub float %624, %626
  %628 = fsub float %615, %625
  %629 = fsub float %615, %628
  %630 = fsub float %629, %625
  %631 = fsub float %630, %627
  %632 = fadd float %628, %631
  %633 = fmul float %619, %632
  %634 = fadd float %620, %633
  %635 = fsub float %634, %620
  %636 = fsub float %633, %635
  %637 = fmul float %634, %634
  %638 = fneg float %637
  %639 = tail call float @llvm.fma.f32(float %634, float %634, float %638)
  %640 = fmul float %636, 2.000000e+00
  %641 = tail call float @llvm.fma.f32(float %634, float %640, float %639)
  %642 = fadd float %637, %641
  %643 = fsub float %642, %637
  %644 = fsub float %641, %643
  %645 = tail call float @llvm.fmuladd.f32(float %642, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %646 = tail call float @llvm.fmuladd.f32(float %642, float %645, float 0x3FD999BDE0000000)
  %647 = sitofp i32 %614 to float
  %648 = fmul float %647, 0x3FE62E4300000000
  %649 = fneg float %648
  %650 = tail call float @llvm.fma.f32(float %647, float 0x3FE62E4300000000, float %649)
  %651 = tail call float @llvm.fma.f32(float %647, float 0xBE205C6100000000, float %650)
  %652 = fadd float %648, %651
  %653 = fsub float %652, %648
  %654 = fsub float %651, %653
  %655 = tail call float @llvm.amdgcn.ldexp.f32(float %634, i32 1)
  %656 = fmul float %634, %642
  %657 = fneg float %656
  %658 = tail call float @llvm.fma.f32(float %642, float %634, float %657)
  %659 = tail call float @llvm.fma.f32(float %642, float %636, float %658)
  %660 = tail call float @llvm.fma.f32(float %644, float %634, float %659)
  %661 = fadd float %656, %660
  %662 = fsub float %661, %656
  %663 = fsub float %660, %662
  %664 = fmul float %642, %646
  %665 = fneg float %664
  %666 = tail call float @llvm.fma.f32(float %642, float %646, float %665)
  %667 = tail call float @llvm.fma.f32(float %644, float %646, float %666)
  %668 = fadd float %664, %667
  %669 = fsub float %668, %664
  %670 = fsub float %667, %669
  %671 = fadd float %668, 0x3FE5555540000000
  %672 = fadd float %671, 0xBFE5555540000000
  %673 = fsub float %668, %672
  %674 = fadd float %670, 0x3E2E720200000000
  %675 = fadd float %674, %673
  %676 = fadd float %671, %675
  %677 = fsub float %676, %671
  %678 = fsub float %675, %677
  %679 = fmul float %661, %676
  %680 = fneg float %679
  %681 = tail call float @llvm.fma.f32(float %661, float %676, float %680)
  %682 = tail call float @llvm.fma.f32(float %661, float %678, float %681)
  %683 = tail call float @llvm.fma.f32(float %663, float %676, float %682)
  %684 = tail call float @llvm.amdgcn.ldexp.f32(float %636, i32 1)
  %685 = fadd float %679, %683
  %686 = fsub float %685, %679
  %687 = fsub float %683, %686
  %688 = fadd float %655, %685
  %689 = fsub float %688, %655
  %690 = fsub float %685, %689
  %691 = fadd float %684, %687
  %692 = fadd float %691, %690
  %693 = fadd float %688, %692
  %694 = fsub float %693, %688
  %695 = fsub float %692, %694
  %696 = fadd float %652, %693
  %697 = fsub float %696, %652
  %698 = fsub float %696, %697
  %699 = fsub float %652, %698
  %700 = fsub float %693, %697
  %701 = fadd float %700, %699
  %702 = fadd float %654, %695
  %703 = fsub float %702, %654
  %704 = fsub float %702, %703
  %705 = fsub float %654, %704
  %706 = fsub float %695, %703
  %707 = fadd float %706, %705
  %708 = fadd float %702, %701
  %709 = fadd float %696, %708
  %710 = fsub float %709, %696
  %711 = fsub float %708, %710
  %712 = fadd float %707, %711
  %713 = fadd float %709, %712
  %714 = fsub float %713, %709
  %715 = fsub float %712, %714
  %716 = fmul float %713, %8
  %717 = fneg float %716
  %718 = tail call float @llvm.fma.f32(float %8, float %713, float %717)
  %719 = tail call float @llvm.fma.f32(float %8, float %715, float %718)
  %720 = fadd float %716, %719
  %721 = fsub float %720, %716
  %722 = fsub float %719, %721
  %723 = tail call float @llvm.fabs.f32(float %716) #3
  %724 = fcmp oeq float %723, 0x7FF0000000000000
  %725 = select i1 %724, float %716, float %720
  %726 = tail call float @llvm.fabs.f32(float %725) #3
  %727 = fcmp oeq float %726, 0x7FF0000000000000
  %728 = select i1 %727, float 0.000000e+00, float %722
  %729 = fcmp oeq float %725, 0x40562E4300000000
  %730 = select i1 %729, float 0x3EE0000000000000, float 0.000000e+00
  %731 = fsub float %725, %730
  %732 = fadd float %730, %728
  %733 = fmul float %731, 0x3FF7154760000000
  %734 = tail call float @llvm.rint.f32(float %733)
  %735 = fcmp ogt float %731, 0x40562E4300000000
  %736 = fcmp olt float %731, 0xC059D1DA00000000
  %737 = fneg float %733
  %738 = tail call float @llvm.fma.f32(float %731, float 0x3FF7154760000000, float %737)
  %739 = tail call float @llvm.fma.f32(float %731, float 0x3E54AE0BE0000000, float %738)
  %740 = fsub float %733, %734
  %741 = fadd float %739, %740
  %742 = tail call float @llvm.exp2.f32(float %741)
  %743 = fptosi float %734 to i32
  %744 = tail call float @llvm.amdgcn.ldexp.f32(float %742, i32 %743)
  %745 = select i1 %736, float 0.000000e+00, float %744
  %746 = select i1 %735, float 0x7FF0000000000000, float %745
  %747 = tail call float @llvm.fma.f32(float %746, float %732, float %746)
  %748 = tail call float @llvm.fabs.f32(float %746) #3
  %749 = fcmp oeq float %748, 0x7FF0000000000000
  %750 = select i1 %749, float %746, float %747
  %751 = tail call float @llvm.fabs.f32(float %750)
  br i1 %582, label %752, label %761

752:                                              ; preds = %592
  %753 = fcmp oeq float %608, 1.000000e+00
  %754 = fadd float %608, -1.000000e+00
  %755 = bitcast float %8 to i32
  %756 = bitcast float %754 to i32
  %757 = xor i32 %756, %755
  %758 = icmp sgt i32 %757, -1
  %759 = select i1 %758, float 0x7FF0000000000000, float 0.000000e+00
  %760 = select i1 %753, float %608, float %759
  br label %761

761:                                              ; preds = %592, %752
  %762 = phi float [ %751, %592 ], [ %760, %752 ]
  %763 = fcmp oeq float %608, 0x7FF0000000000000
  %764 = fcmp oeq float %607, 0.000000e+00
  %765 = or i1 %764, %763
  %766 = xor i1 %597, %764
  %767 = select i1 %766, float 0.000000e+00, float 0x7FF0000000000000
  %768 = select i1 %765, float %767, float %762
  %769 = fcmp uno float %608, %8
  %770 = select i1 %769, float 0x7FF8000000000000, float %768
  %771 = fcmp oeq float %608, 1.000000e+00
  %772 = select i1 %771, float 1.000000e+00, float %770
  %773 = fadd contract float %772, %9
  br label %774

774:                                              ; preds = %410, %414, %761, %429
  %775 = phi i64 [ %411, %410 ], [ %415, %414 ], [ %426, %761 ], [ %426, %429 ]
  %776 = phi float [ 1.000000e+00, %410 ], [ %419, %414 ], [ %605, %761 ], [ %431, %429 ]
  %777 = phi float [ 1.000000e+00, %410 ], [ %423, %414 ], [ %773, %761 ], [ %435, %429 ]
  %778 = fdiv contract float %407, %776
  %779 = getelementptr inbounds float, float addrspace(1)* %0, i64 %775
  store float %778, float addrspace(1)* %779, align 4, !tbaa !7
  %780 = fdiv contract float %408, %777
  %781 = getelementptr inbounds float, float addrspace(1)* %1, i64 %775
  store float %780, float addrspace(1)* %781, align 4, !tbaa !7
  br label %782

782:                                              ; preds = %10, %774
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
