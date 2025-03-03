; ModuleID = '../data/hip_kernels/2890/7/main.cu'
source_filename = "../data/hip_kernels/2890/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31Compute_weightx_weighty2_KernelPfS_PKfS1_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %452

18:                                               ; preds = %7
  %19 = fcmp contract oeq float %5, 2.000000e+00
  br i1 %19, label %20, label %23

20:                                               ; preds = %18
  %21 = sext i32 %16 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float 1.000000e+00, float addrspace(1)* %22, align 4, !tbaa !7
  br label %448

23:                                               ; preds = %18
  %24 = fcmp contract oeq float %5, 1.000000e+00
  br i1 %24, label %25, label %36

25:                                               ; preds = %23
  %26 = sext i32 %16 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = fadd contract float %28, %6
  %30 = fdiv contract float 1.000000e+00, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float %30, float addrspace(1)* %31, align 4, !tbaa !7
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fadd contract float %33, %6
  %35 = fdiv contract float 1.000000e+00, %34
  br label %448

36:                                               ; preds = %23
  %37 = fcmp contract oeq float %5, 0.000000e+00
  %38 = sext i32 %16 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  br i1 %37, label %41, label %51

41:                                               ; preds = %36
  %42 = fmul contract float %40, %40
  %43 = fadd contract float %42, %6
  %44 = fdiv contract float 1.000000e+00, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float %44, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %48, %6
  %50 = fdiv contract float 1.000000e+00, %49
  br label %448

51:                                               ; preds = %36
  %52 = fsub contract float 2.000000e+00, %5
  %53 = tail call float @llvm.fabs.f32(float %40)
  %54 = tail call float @llvm.amdgcn.frexp.mant.f32(float %53)
  %55 = fcmp olt float %54, 0x3FE5555560000000
  %56 = zext i1 %55 to i32
  %57 = tail call float @llvm.amdgcn.ldexp.f32(float %54, i32 %56)
  %58 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %53)
  %59 = sub nsw i32 %58, %56
  %60 = fadd float %57, -1.000000e+00
  %61 = fadd float %57, 1.000000e+00
  %62 = fadd float %61, -1.000000e+00
  %63 = fsub float %57, %62
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %61)
  %65 = fmul float %60, %64
  %66 = fmul float %61, %65
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %65, float %61, float %67)
  %69 = tail call float @llvm.fma.f32(float %65, float %63, float %68)
  %70 = fadd float %66, %69
  %71 = fsub float %70, %66
  %72 = fsub float %69, %71
  %73 = fsub float %60, %70
  %74 = fsub float %60, %73
  %75 = fsub float %74, %70
  %76 = fsub float %75, %72
  %77 = fadd float %73, %76
  %78 = fmul float %64, %77
  %79 = fadd float %65, %78
  %80 = fsub float %79, %65
  %81 = fsub float %78, %80
  %82 = fmul float %79, %79
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %79, float %79, float %83)
  %85 = fmul float %81, 2.000000e+00
  %86 = tail call float @llvm.fma.f32(float %79, float %85, float %84)
  %87 = fadd float %82, %86
  %88 = fsub float %87, %82
  %89 = fsub float %86, %88
  %90 = tail call float @llvm.fmuladd.f32(float %87, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %91 = tail call float @llvm.fmuladd.f32(float %87, float %90, float 0x3FD999BDE0000000)
  %92 = sitofp i32 %59 to float
  %93 = fmul float %92, 0x3FE62E4300000000
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %92, float 0x3FE62E4300000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %92, float 0xBE205C6100000000, float %95)
  %97 = fadd float %93, %96
  %98 = fsub float %97, %93
  %99 = fsub float %96, %98
  %100 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 1)
  %101 = fmul float %79, %87
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %87, float %79, float %102)
  %104 = tail call float @llvm.fma.f32(float %87, float %81, float %103)
  %105 = tail call float @llvm.fma.f32(float %89, float %79, float %104)
  %106 = fadd float %101, %105
  %107 = fsub float %106, %101
  %108 = fsub float %105, %107
  %109 = fmul float %87, %91
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %87, float %91, float %110)
  %112 = tail call float @llvm.fma.f32(float %89, float %91, float %111)
  %113 = fadd float %109, %112
  %114 = fsub float %113, %109
  %115 = fsub float %112, %114
  %116 = fadd float %113, 0x3FE5555540000000
  %117 = fadd float %116, 0xBFE5555540000000
  %118 = fsub float %113, %117
  %119 = fadd float %115, 0x3E2E720200000000
  %120 = fadd float %119, %118
  %121 = fadd float %116, %120
  %122 = fsub float %121, %116
  %123 = fsub float %120, %122
  %124 = fmul float %106, %121
  %125 = fneg float %124
  %126 = tail call float @llvm.fma.f32(float %106, float %121, float %125)
  %127 = tail call float @llvm.fma.f32(float %106, float %123, float %126)
  %128 = tail call float @llvm.fma.f32(float %108, float %121, float %127)
  %129 = tail call float @llvm.amdgcn.ldexp.f32(float %81, i32 1)
  %130 = fadd float %124, %128
  %131 = fsub float %130, %124
  %132 = fsub float %128, %131
  %133 = fadd float %100, %130
  %134 = fsub float %133, %100
  %135 = fsub float %130, %134
  %136 = fadd float %129, %132
  %137 = fadd float %136, %135
  %138 = fadd float %133, %137
  %139 = fsub float %138, %133
  %140 = fsub float %137, %139
  %141 = fadd float %97, %138
  %142 = fsub float %141, %97
  %143 = fsub float %141, %142
  %144 = fsub float %97, %143
  %145 = fsub float %138, %142
  %146 = fadd float %145, %144
  %147 = fadd float %99, %140
  %148 = fsub float %147, %99
  %149 = fsub float %147, %148
  %150 = fsub float %99, %149
  %151 = fsub float %140, %148
  %152 = fadd float %151, %150
  %153 = fadd float %147, %146
  %154 = fadd float %141, %153
  %155 = fsub float %154, %141
  %156 = fsub float %153, %155
  %157 = fadd float %152, %156
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = fmul float %52, %158
  %162 = fneg float %161
  %163 = tail call float @llvm.fma.f32(float %52, float %158, float %162)
  %164 = tail call float @llvm.fma.f32(float %52, float %160, float %163)
  %165 = fadd float %161, %164
  %166 = tail call float @llvm.fabs.f32(float %161) #3
  %167 = fcmp oeq float %166, 0x7FF0000000000000
  %168 = select i1 %167, float %161, float %165
  %169 = fcmp oeq float %168, 0x40562E4300000000
  %170 = select i1 %169, float 0x3EE0000000000000, float 0.000000e+00
  %171 = fsub float %168, %170
  %172 = fmul float %171, 0x3FF7154760000000
  %173 = tail call float @llvm.rint.f32(float %172)
  %174 = fcmp ogt float %171, 0x40562E4300000000
  %175 = fcmp olt float %171, 0xC059D1DA00000000
  %176 = fneg float %172
  %177 = tail call float @llvm.fma.f32(float %171, float 0x3FF7154760000000, float %176)
  %178 = tail call float @llvm.fma.f32(float %171, float 0x3E54AE0BE0000000, float %177)
  %179 = fsub float %172, %173
  %180 = fadd float %178, %179
  %181 = tail call float @llvm.exp2.f32(float %180)
  %182 = fptosi float %173 to i32
  %183 = tail call float @llvm.amdgcn.ldexp.f32(float %181, i32 %182)
  %184 = select i1 %175, float 0.000000e+00, float %183
  %185 = select i1 %174, float 0x7FF0000000000000, float %184
  %186 = tail call float @llvm.fabs.f32(float %52)
  %187 = tail call float @llvm.trunc.f32(float %186)
  %188 = fcmp oeq float %186, %187
  %189 = zext i1 %188 to i32
  %190 = fmul float %187, 5.000000e-01
  %191 = tail call float @llvm.amdgcn.fract.f32(float %190)
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 516)
  %193 = select i1 %192, float 0.000000e+00, float %191
  %194 = fcmp oeq float %193, 0.000000e+00
  %195 = and i1 %188, %194
  %196 = zext i1 %195 to i32
  %197 = add nuw nsw i32 %196, %189
  %198 = icmp eq i32 %197, 1
  %199 = icmp ne i32 %197, 0
  %200 = fcmp oeq float %186, 0x7FF0000000000000
  br i1 %200, label %201, label %239

201:                                              ; preds = %51
  %202 = fcmp oeq float %53, 1.000000e+00
  %203 = fadd float %53, -1.000000e+00
  %204 = bitcast float %52 to i32
  %205 = bitcast float %203 to i32
  %206 = xor i32 %205, %204
  %207 = icmp sgt i32 %206, -1
  %208 = select i1 %207, float 0x7FF0000000000000, float 0.000000e+00
  %209 = select i1 %202, float %53, float %208
  %210 = fcmp oeq float %53, 0x7FF0000000000000
  %211 = fcmp oeq float %40, 0.000000e+00
  %212 = or i1 %211, %210
  %213 = fcmp olt float %52, 0.000000e+00
  %214 = xor i1 %213, %211
  %215 = select i1 %214, float 0.000000e+00, float 0x7FF0000000000000
  %216 = select i1 %198, float %40, float 0.000000e+00
  %217 = tail call float @llvm.copysign.f32(float %215, float %216)
  %218 = select i1 %212, float %217, float %209
  %219 = fcmp uno float %40, %52
  %220 = select i1 %219, float 0x7FF8000000000000, float %218
  %221 = fcmp oeq float %40, 1.000000e+00
  %222 = fcmp oeq float %52, 0.000000e+00
  %223 = or i1 %222, %221
  %224 = select i1 %223, float 1.000000e+00, float %220
  %225 = fadd contract float %224, %6
  %226 = fdiv contract float 1.000000e+00, %225
  %227 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float %226, float addrspace(1)* %227, align 4, !tbaa !7
  %228 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  %230 = tail call float @llvm.fabs.f32(float %229)
  %231 = fcmp oeq float %230, 1.000000e+00
  %232 = fadd float %230, -1.000000e+00
  %233 = bitcast float %52 to i32
  %234 = bitcast float %232 to i32
  %235 = xor i32 %234, %233
  %236 = icmp sgt i32 %235, -1
  %237 = select i1 %236, float 0x7FF0000000000000, float 0.000000e+00
  %238 = select i1 %231, float %230, float %237
  br label %427

239:                                              ; preds = %51
  %240 = fcmp uge float %40, 0.000000e+00
  %241 = select i1 %240, i1 true, i1 %199
  %242 = tail call float @llvm.fabs.f32(float %185) #3
  %243 = fcmp oeq float %242, 0x7FF0000000000000
  %244 = tail call float @llvm.fabs.f32(float %168) #3
  %245 = fcmp oeq float %244, 0x7FF0000000000000
  %246 = fsub float %165, %161
  %247 = fsub float %164, %246
  %248 = select i1 %245, float 0.000000e+00, float %247
  %249 = fadd float %170, %248
  %250 = tail call float @llvm.fma.f32(float %185, float %249, float %185)
  %251 = select i1 %243, float %185, float %250
  %252 = fcmp olt float %40, 0.000000e+00
  %253 = and i1 %198, %252
  %254 = select i1 %253, float -0.000000e+00, float 0.000000e+00
  %255 = tail call float @llvm.copysign.f32(float %251, float %254)
  %256 = select i1 %241, float %255, float 0x7FF8000000000000
  %257 = fcmp oeq float %53, 0x7FF0000000000000
  %258 = fcmp oeq float %40, 0.000000e+00
  %259 = or i1 %258, %257
  %260 = fcmp olt float %52, 0.000000e+00
  %261 = xor i1 %260, %258
  %262 = select i1 %261, float 0.000000e+00, float 0x7FF0000000000000
  %263 = select i1 %198, float %40, float 0.000000e+00
  %264 = tail call float @llvm.copysign.f32(float %262, float %263)
  %265 = select i1 %259, float %264, float %256
  %266 = fcmp uno float %40, %52
  %267 = select i1 %266, float 0x7FF8000000000000, float %265
  %268 = fcmp oeq float %40, 1.000000e+00
  %269 = fcmp oeq float %52, 0.000000e+00
  %270 = or i1 %269, %268
  %271 = select i1 %270, float 1.000000e+00, float %267
  %272 = fadd contract float %271, %6
  %273 = fdiv contract float 1.000000e+00, %272
  %274 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float %273, float addrspace(1)* %274, align 4, !tbaa !7
  %275 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  %277 = tail call float @llvm.fabs.f32(float %276)
  %278 = tail call float @llvm.amdgcn.frexp.mant.f32(float %277)
  %279 = fcmp olt float %278, 0x3FE5555560000000
  %280 = zext i1 %279 to i32
  %281 = tail call float @llvm.amdgcn.ldexp.f32(float %278, i32 %280)
  %282 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %277)
  %283 = sub nsw i32 %282, %280
  %284 = fadd float %281, -1.000000e+00
  %285 = fadd float %281, 1.000000e+00
  %286 = fadd float %285, -1.000000e+00
  %287 = fsub float %281, %286
  %288 = tail call float @llvm.amdgcn.rcp.f32(float %285)
  %289 = fmul float %284, %288
  %290 = fmul float %285, %289
  %291 = fneg float %290
  %292 = tail call float @llvm.fma.f32(float %289, float %285, float %291)
  %293 = tail call float @llvm.fma.f32(float %289, float %287, float %292)
  %294 = fadd float %290, %293
  %295 = fsub float %294, %290
  %296 = fsub float %293, %295
  %297 = fsub float %284, %294
  %298 = fsub float %284, %297
  %299 = fsub float %298, %294
  %300 = fsub float %299, %296
  %301 = fadd float %297, %300
  %302 = fmul float %288, %301
  %303 = fadd float %289, %302
  %304 = fsub float %303, %289
  %305 = fsub float %302, %304
  %306 = fmul float %303, %303
  %307 = fneg float %306
  %308 = tail call float @llvm.fma.f32(float %303, float %303, float %307)
  %309 = fmul float %305, 2.000000e+00
  %310 = tail call float @llvm.fma.f32(float %303, float %309, float %308)
  %311 = fadd float %306, %310
  %312 = fsub float %311, %306
  %313 = fsub float %310, %312
  %314 = tail call float @llvm.fmuladd.f32(float %311, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %315 = tail call float @llvm.fmuladd.f32(float %311, float %314, float 0x3FD999BDE0000000)
  %316 = sitofp i32 %283 to float
  %317 = fmul float %316, 0x3FE62E4300000000
  %318 = fneg float %317
  %319 = tail call float @llvm.fma.f32(float %316, float 0x3FE62E4300000000, float %318)
  %320 = tail call float @llvm.fma.f32(float %316, float 0xBE205C6100000000, float %319)
  %321 = fadd float %317, %320
  %322 = fsub float %321, %317
  %323 = fsub float %320, %322
  %324 = tail call float @llvm.amdgcn.ldexp.f32(float %303, i32 1)
  %325 = fmul float %303, %311
  %326 = fneg float %325
  %327 = tail call float @llvm.fma.f32(float %311, float %303, float %326)
  %328 = tail call float @llvm.fma.f32(float %311, float %305, float %327)
  %329 = tail call float @llvm.fma.f32(float %313, float %303, float %328)
  %330 = fadd float %325, %329
  %331 = fsub float %330, %325
  %332 = fsub float %329, %331
  %333 = fmul float %311, %315
  %334 = fneg float %333
  %335 = tail call float @llvm.fma.f32(float %311, float %315, float %334)
  %336 = tail call float @llvm.fma.f32(float %313, float %315, float %335)
  %337 = fadd float %333, %336
  %338 = fsub float %337, %333
  %339 = fsub float %336, %338
  %340 = fadd float %337, 0x3FE5555540000000
  %341 = fadd float %340, 0xBFE5555540000000
  %342 = fsub float %337, %341
  %343 = fadd float %339, 0x3E2E720200000000
  %344 = fadd float %343, %342
  %345 = fadd float %340, %344
  %346 = fsub float %345, %340
  %347 = fsub float %344, %346
  %348 = fmul float %330, %345
  %349 = fneg float %348
  %350 = tail call float @llvm.fma.f32(float %330, float %345, float %349)
  %351 = tail call float @llvm.fma.f32(float %330, float %347, float %350)
  %352 = tail call float @llvm.fma.f32(float %332, float %345, float %351)
  %353 = tail call float @llvm.amdgcn.ldexp.f32(float %305, i32 1)
  %354 = fadd float %348, %352
  %355 = fsub float %354, %348
  %356 = fsub float %352, %355
  %357 = fadd float %324, %354
  %358 = fsub float %357, %324
  %359 = fsub float %354, %358
  %360 = fadd float %353, %356
  %361 = fadd float %360, %359
  %362 = fadd float %357, %361
  %363 = fsub float %362, %357
  %364 = fsub float %361, %363
  %365 = fadd float %321, %362
  %366 = fsub float %365, %321
  %367 = fsub float %365, %366
  %368 = fsub float %321, %367
  %369 = fsub float %362, %366
  %370 = fadd float %369, %368
  %371 = fadd float %323, %364
  %372 = fsub float %371, %323
  %373 = fsub float %371, %372
  %374 = fsub float %323, %373
  %375 = fsub float %364, %372
  %376 = fadd float %375, %374
  %377 = fadd float %371, %370
  %378 = fadd float %365, %377
  %379 = fsub float %378, %365
  %380 = fsub float %377, %379
  %381 = fadd float %376, %380
  %382 = fadd float %378, %381
  %383 = fsub float %382, %378
  %384 = fsub float %381, %383
  %385 = fmul float %52, %382
  %386 = fneg float %385
  %387 = tail call float @llvm.fma.f32(float %52, float %382, float %386)
  %388 = tail call float @llvm.fma.f32(float %52, float %384, float %387)
  %389 = fadd float %385, %388
  %390 = fsub float %389, %385
  %391 = fsub float %388, %390
  %392 = tail call float @llvm.fabs.f32(float %385) #3
  %393 = fcmp oeq float %392, 0x7FF0000000000000
  %394 = select i1 %393, float %385, float %389
  %395 = tail call float @llvm.fabs.f32(float %394) #3
  %396 = fcmp oeq float %395, 0x7FF0000000000000
  %397 = select i1 %396, float 0.000000e+00, float %391
  %398 = fcmp oeq float %394, 0x40562E4300000000
  %399 = select i1 %398, float 0x3EE0000000000000, float 0.000000e+00
  %400 = fsub float %394, %399
  %401 = fadd float %399, %397
  %402 = fmul float %400, 0x3FF7154760000000
  %403 = tail call float @llvm.rint.f32(float %402)
  %404 = fcmp ogt float %400, 0x40562E4300000000
  %405 = fcmp olt float %400, 0xC059D1DA00000000
  %406 = fneg float %402
  %407 = tail call float @llvm.fma.f32(float %400, float 0x3FF7154760000000, float %406)
  %408 = tail call float @llvm.fma.f32(float %400, float 0x3E54AE0BE0000000, float %407)
  %409 = fsub float %402, %403
  %410 = fadd float %408, %409
  %411 = tail call float @llvm.exp2.f32(float %410)
  %412 = fptosi float %403 to i32
  %413 = tail call float @llvm.amdgcn.ldexp.f32(float %411, i32 %412)
  %414 = select i1 %405, float 0.000000e+00, float %413
  %415 = select i1 %404, float 0x7FF0000000000000, float %414
  %416 = tail call float @llvm.fma.f32(float %415, float %401, float %415)
  %417 = tail call float @llvm.fabs.f32(float %415) #3
  %418 = fcmp oeq float %417, 0x7FF0000000000000
  %419 = select i1 %418, float %415, float %416
  %420 = fcmp olt float %276, 0.000000e+00
  %421 = and i1 %198, %420
  %422 = select i1 %421, float -0.000000e+00, float 0.000000e+00
  %423 = tail call float @llvm.copysign.f32(float %419, float %422)
  %424 = fcmp uge float %276, 0.000000e+00
  %425 = select i1 %424, i1 true, i1 %199
  %426 = select i1 %425, float %423, float 0x7FF8000000000000
  br label %427

427:                                              ; preds = %239, %201
  %428 = phi float [ %277, %239 ], [ %230, %201 ]
  %429 = phi float [ %276, %239 ], [ %229, %201 ]
  %430 = phi i1 [ %269, %239 ], [ %222, %201 ]
  %431 = phi i1 [ %260, %239 ], [ %213, %201 ]
  %432 = phi float [ %426, %239 ], [ %238, %201 ]
  %433 = fcmp oeq float %428, 0x7FF0000000000000
  %434 = fcmp oeq float %429, 0.000000e+00
  %435 = or i1 %434, %433
  %436 = xor i1 %431, %434
  %437 = select i1 %436, float 0.000000e+00, float 0x7FF0000000000000
  %438 = select i1 %198, float %429, float 0.000000e+00
  %439 = tail call float @llvm.copysign.f32(float %437, float %438)
  %440 = select i1 %435, float %439, float %432
  %441 = fcmp uno float %429, %52
  %442 = select i1 %441, float 0x7FF8000000000000, float %440
  %443 = fcmp oeq float %429, 1.000000e+00
  %444 = or i1 %430, %443
  %445 = select i1 %444, float 1.000000e+00, float %442
  %446 = fadd contract float %445, %6
  %447 = fdiv contract float 1.000000e+00, %446
  br label %448

448:                                              ; preds = %25, %427, %41, %20
  %449 = phi i64 [ %21, %20 ], [ %38, %41 ], [ %38, %427 ], [ %26, %25 ]
  %450 = phi float [ 1.000000e+00, %20 ], [ %50, %41 ], [ %447, %427 ], [ %35, %25 ]
  %451 = getelementptr inbounds float, float addrspace(1)* %1, i64 %449
  store float %450, float addrspace(1)* %451, align 4, !tbaa !7
  br label %452

452:                                              ; preds = %448, %7
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
