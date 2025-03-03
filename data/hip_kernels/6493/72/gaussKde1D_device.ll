; ModuleID = '../data/hip_kernels/6493/72/main.cu'
source_filename = "../data/hip_kernels/6493/72/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10gaussKde1DiiiiPKfS0_S0_Pf(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %17, %2
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %374

29:                                               ; preds = %8
  %30 = mul nsw i32 %25, %2
  %31 = add nsw i32 %30, %17
  %32 = sext i32 %3 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %4, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = mul nsw i32 %25, %0
  %36 = add nsw i32 %35, %3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = mul nsw i32 %17, %0
  %41 = add nsw i32 %40, %3
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %6, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = fsub contract float %39, %44
  %46 = tail call float @llvm.fabs.f32(float %45)
  %47 = tail call float @llvm.amdgcn.frexp.mant.f32(float %46)
  %48 = fcmp olt float %47, 0x3FE5555560000000
  %49 = zext i1 %48 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %49)
  %51 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %46)
  %52 = sub nsw i32 %51, %49
  %53 = fadd float %50, -1.000000e+00
  %54 = fadd float %50, 1.000000e+00
  %55 = fadd float %54, -1.000000e+00
  %56 = fsub float %50, %55
  %57 = tail call float @llvm.amdgcn.rcp.f32(float %54)
  %58 = fmul float %53, %57
  %59 = fmul float %54, %58
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %58, float %54, float %60)
  %62 = tail call float @llvm.fma.f32(float %58, float %56, float %61)
  %63 = fadd float %59, %62
  %64 = fsub float %63, %59
  %65 = fsub float %62, %64
  %66 = fsub float %53, %63
  %67 = fsub float %53, %66
  %68 = fsub float %67, %63
  %69 = fsub float %68, %65
  %70 = fadd float %66, %69
  %71 = fmul float %57, %70
  %72 = fadd float %58, %71
  %73 = fsub float %72, %58
  %74 = fsub float %71, %73
  %75 = fmul float %72, %72
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %72, float %72, float %76)
  %78 = fmul float %74, 2.000000e+00
  %79 = tail call float @llvm.fma.f32(float %72, float %78, float %77)
  %80 = fadd float %75, %79
  %81 = fsub float %80, %75
  %82 = fsub float %79, %81
  %83 = tail call float @llvm.fmuladd.f32(float %80, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %84 = tail call float @llvm.fmuladd.f32(float %80, float %83, float 0x3FD999BDE0000000)
  %85 = sitofp i32 %52 to float
  %86 = fmul float %85, 0x3FE62E4300000000
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %85, float 0x3FE62E4300000000, float %87)
  %89 = tail call float @llvm.fma.f32(float %85, float 0xBE205C6100000000, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %94 = fmul float %72, %80
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %80, float %72, float %95)
  %97 = tail call float @llvm.fma.f32(float %80, float %74, float %96)
  %98 = tail call float @llvm.fma.f32(float %82, float %72, float %97)
  %99 = fadd float %94, %98
  %100 = fsub float %99, %94
  %101 = fsub float %98, %100
  %102 = fmul float %80, %84
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %80, float %84, float %103)
  %105 = tail call float @llvm.fma.f32(float %82, float %84, float %104)
  %106 = fadd float %102, %105
  %107 = fsub float %106, %102
  %108 = fsub float %105, %107
  %109 = fadd float %106, 0x3FE5555540000000
  %110 = fadd float %109, 0xBFE5555540000000
  %111 = fsub float %106, %110
  %112 = fadd float %108, 0x3E2E720200000000
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fmul float %99, %114
  %118 = fneg float %117
  %119 = tail call float @llvm.fma.f32(float %99, float %114, float %118)
  %120 = tail call float @llvm.fma.f32(float %99, float %116, float %119)
  %121 = tail call float @llvm.fma.f32(float %101, float %114, float %120)
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 1)
  %123 = fadd float %117, %121
  %124 = fsub float %123, %117
  %125 = fsub float %121, %124
  %126 = fadd float %93, %123
  %127 = fsub float %126, %93
  %128 = fsub float %123, %127
  %129 = fadd float %122, %125
  %130 = fadd float %129, %128
  %131 = fadd float %126, %130
  %132 = fsub float %131, %126
  %133 = fsub float %130, %132
  %134 = fadd float %90, %131
  %135 = fsub float %134, %90
  %136 = fsub float %134, %135
  %137 = fsub float %90, %136
  %138 = fsub float %131, %135
  %139 = fadd float %138, %137
  %140 = fadd float %92, %133
  %141 = fsub float %140, %92
  %142 = fsub float %140, %141
  %143 = fsub float %92, %142
  %144 = fsub float %133, %141
  %145 = fadd float %144, %143
  %146 = fadd float %140, %139
  %147 = fadd float %134, %146
  %148 = fsub float %147, %134
  %149 = fsub float %146, %148
  %150 = fadd float %145, %149
  %151 = fadd float %147, %150
  %152 = fsub float %151, %147
  %153 = fsub float %150, %152
  %154 = fmul float %151, 2.000000e+00
  %155 = fneg float %154
  %156 = tail call float @llvm.fma.f32(float %151, float 2.000000e+00, float %155)
  %157 = tail call float @llvm.fma.f32(float %153, float 2.000000e+00, float %156)
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %154) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %154, float %158
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
  %189 = tail call float @llvm.fabs.f32(float %188)
  %190 = fcmp oeq float %46, 0x7FF0000000000000
  %191 = fcmp oeq float %45, 0.000000e+00
  %192 = select i1 %190, float 0x7FF0000000000000, float %189
  %193 = select i1 %191, float 0.000000e+00, float %192
  %194 = fcmp uno float %45, 0.000000e+00
  %195 = select i1 %194, float 0x7FF8000000000000, float %193
  %196 = fcmp oeq float %45, 1.000000e+00
  %197 = select i1 %196, float 1.000000e+00, float %195
  %198 = fneg contract float %197
  %199 = fpext float %198 to double
  %200 = fmul contract double %199, 5.000000e-01
  %201 = tail call float @llvm.fabs.f32(float %34)
  %202 = tail call float @llvm.amdgcn.frexp.mant.f32(float %201)
  %203 = fcmp olt float %202, 0x3FE5555560000000
  %204 = zext i1 %203 to i32
  %205 = tail call float @llvm.amdgcn.ldexp.f32(float %202, i32 %204)
  %206 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %201)
  %207 = sub nsw i32 %206, %204
  %208 = fadd float %205, -1.000000e+00
  %209 = fadd float %205, 1.000000e+00
  %210 = fadd float %209, -1.000000e+00
  %211 = fsub float %205, %210
  %212 = tail call float @llvm.amdgcn.rcp.f32(float %209)
  %213 = fmul float %208, %212
  %214 = fmul float %209, %213
  %215 = fneg float %214
  %216 = tail call float @llvm.fma.f32(float %213, float %209, float %215)
  %217 = tail call float @llvm.fma.f32(float %213, float %211, float %216)
  %218 = fadd float %214, %217
  %219 = fsub float %218, %214
  %220 = fsub float %217, %219
  %221 = fsub float %208, %218
  %222 = fsub float %208, %221
  %223 = fsub float %222, %218
  %224 = fsub float %223, %220
  %225 = fadd float %221, %224
  %226 = fmul float %212, %225
  %227 = fadd float %213, %226
  %228 = fsub float %227, %213
  %229 = fsub float %226, %228
  %230 = fmul float %227, %227
  %231 = fneg float %230
  %232 = tail call float @llvm.fma.f32(float %227, float %227, float %231)
  %233 = fmul float %229, 2.000000e+00
  %234 = tail call float @llvm.fma.f32(float %227, float %233, float %232)
  %235 = fadd float %230, %234
  %236 = fsub float %235, %230
  %237 = fsub float %234, %236
  %238 = tail call float @llvm.fmuladd.f32(float %235, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %239 = tail call float @llvm.fmuladd.f32(float %235, float %238, float 0x3FD999BDE0000000)
  %240 = sitofp i32 %207 to float
  %241 = fmul float %240, 0x3FE62E4300000000
  %242 = fneg float %241
  %243 = tail call float @llvm.fma.f32(float %240, float 0x3FE62E4300000000, float %242)
  %244 = tail call float @llvm.fma.f32(float %240, float 0xBE205C6100000000, float %243)
  %245 = fadd float %241, %244
  %246 = fsub float %245, %241
  %247 = fsub float %244, %246
  %248 = tail call float @llvm.amdgcn.ldexp.f32(float %227, i32 1)
  %249 = fmul float %227, %235
  %250 = fneg float %249
  %251 = tail call float @llvm.fma.f32(float %235, float %227, float %250)
  %252 = tail call float @llvm.fma.f32(float %235, float %229, float %251)
  %253 = tail call float @llvm.fma.f32(float %237, float %227, float %252)
  %254 = fadd float %249, %253
  %255 = fsub float %254, %249
  %256 = fsub float %253, %255
  %257 = fmul float %235, %239
  %258 = fneg float %257
  %259 = tail call float @llvm.fma.f32(float %235, float %239, float %258)
  %260 = tail call float @llvm.fma.f32(float %237, float %239, float %259)
  %261 = fadd float %257, %260
  %262 = fsub float %261, %257
  %263 = fsub float %260, %262
  %264 = fadd float %261, 0x3FE5555540000000
  %265 = fadd float %264, 0xBFE5555540000000
  %266 = fsub float %261, %265
  %267 = fadd float %263, 0x3E2E720200000000
  %268 = fadd float %267, %266
  %269 = fadd float %264, %268
  %270 = fsub float %269, %264
  %271 = fsub float %268, %270
  %272 = fmul float %254, %269
  %273 = fneg float %272
  %274 = tail call float @llvm.fma.f32(float %254, float %269, float %273)
  %275 = tail call float @llvm.fma.f32(float %254, float %271, float %274)
  %276 = tail call float @llvm.fma.f32(float %256, float %269, float %275)
  %277 = tail call float @llvm.amdgcn.ldexp.f32(float %229, i32 1)
  %278 = fadd float %272, %276
  %279 = fsub float %278, %272
  %280 = fsub float %276, %279
  %281 = fadd float %248, %278
  %282 = fsub float %281, %248
  %283 = fsub float %278, %282
  %284 = fadd float %277, %280
  %285 = fadd float %284, %283
  %286 = fadd float %281, %285
  %287 = fsub float %286, %281
  %288 = fsub float %285, %287
  %289 = fadd float %245, %286
  %290 = fsub float %289, %245
  %291 = fsub float %289, %290
  %292 = fsub float %245, %291
  %293 = fsub float %286, %290
  %294 = fadd float %293, %292
  %295 = fadd float %247, %288
  %296 = fsub float %295, %247
  %297 = fsub float %295, %296
  %298 = fsub float %247, %297
  %299 = fsub float %288, %296
  %300 = fadd float %299, %298
  %301 = fadd float %295, %294
  %302 = fadd float %289, %301
  %303 = fsub float %302, %289
  %304 = fsub float %301, %303
  %305 = fadd float %300, %304
  %306 = fadd float %302, %305
  %307 = fsub float %306, %302
  %308 = fsub float %305, %307
  %309 = fmul float %306, 2.000000e+00
  %310 = fneg float %309
  %311 = tail call float @llvm.fma.f32(float %306, float 2.000000e+00, float %310)
  %312 = tail call float @llvm.fma.f32(float %308, float 2.000000e+00, float %311)
  %313 = fadd float %309, %312
  %314 = fsub float %313, %309
  %315 = fsub float %312, %314
  %316 = tail call float @llvm.fabs.f32(float %309) #3
  %317 = fcmp oeq float %316, 0x7FF0000000000000
  %318 = select i1 %317, float %309, float %313
  %319 = tail call float @llvm.fabs.f32(float %318) #3
  %320 = fcmp oeq float %319, 0x7FF0000000000000
  %321 = select i1 %320, float 0.000000e+00, float %315
  %322 = fcmp oeq float %318, 0x40562E4300000000
  %323 = select i1 %322, float 0x3EE0000000000000, float 0.000000e+00
  %324 = fsub float %318, %323
  %325 = fadd float %323, %321
  %326 = fmul float %324, 0x3FF7154760000000
  %327 = tail call float @llvm.rint.f32(float %326)
  %328 = fcmp ogt float %324, 0x40562E4300000000
  %329 = fcmp olt float %324, 0xC059D1DA00000000
  %330 = fneg float %326
  %331 = tail call float @llvm.fma.f32(float %324, float 0x3FF7154760000000, float %330)
  %332 = tail call float @llvm.fma.f32(float %324, float 0x3E54AE0BE0000000, float %331)
  %333 = fsub float %326, %327
  %334 = fadd float %332, %333
  %335 = tail call float @llvm.exp2.f32(float %334)
  %336 = fptosi float %327 to i32
  %337 = tail call float @llvm.amdgcn.ldexp.f32(float %335, i32 %336)
  %338 = select i1 %329, float 0.000000e+00, float %337
  %339 = select i1 %328, float 0x7FF0000000000000, float %338
  %340 = tail call float @llvm.fma.f32(float %339, float %325, float %339)
  %341 = tail call float @llvm.fabs.f32(float %339) #3
  %342 = fcmp oeq float %341, 0x7FF0000000000000
  %343 = select i1 %342, float %339, float %340
  %344 = tail call float @llvm.fabs.f32(float %343)
  %345 = fcmp oeq float %201, 0x7FF0000000000000
  %346 = fcmp oeq float %34, 0.000000e+00
  %347 = select i1 %345, float 0x7FF0000000000000, float %344
  %348 = select i1 %346, float 0.000000e+00, float %347
  %349 = fcmp uno float %34, 0.000000e+00
  %350 = select i1 %349, float 0x7FF8000000000000, float %348
  %351 = fcmp oeq float %34, 1.000000e+00
  %352 = select i1 %351, float 1.000000e+00, float %350
  %353 = fpext float %352 to double
  %354 = fdiv contract double %200, %353
  %355 = fptrunc double %354 to float
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = tail call float @llvm.rint.f32(float %356)
  %358 = fcmp ogt float %355, 0x40562E4300000000
  %359 = fcmp olt float %355, 0xC059D1DA00000000
  %360 = fneg float %356
  %361 = tail call float @llvm.fma.f32(float %355, float 0x3FF7154760000000, float %360)
  %362 = tail call float @llvm.fma.f32(float %355, float 0x3E54AE0BE0000000, float %361)
  %363 = fsub float %356, %357
  %364 = fadd float %362, %363
  %365 = tail call float @llvm.exp2.f32(float %364)
  %366 = fptosi float %357 to i32
  %367 = tail call float @llvm.amdgcn.ldexp.f32(float %365, i32 %366)
  %368 = select i1 %359, float 0.000000e+00, float %367
  %369 = select i1 %358, float 0x7FF0000000000000, float %368
  %370 = fdiv contract float %369, %34
  %371 = fdiv contract float %370, 0x40040D9320000000
  %372 = sext i32 %31 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %7, i64 %372
  store float %371, float addrspace(1)* %373, align 4, !tbaa !7
  br label %374

374:                                              ; preds = %29, %8
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
