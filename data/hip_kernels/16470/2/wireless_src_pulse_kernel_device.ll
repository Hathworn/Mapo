; ModuleID = '../data/hip_kernels/16470/2/main.cu'
source_filename = "../data/hip_kernels/16470/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z25wireless_src_pulse_kernelidddiiiiPdS_S_(i32 %0, double %1, double %2, double %3, i32 %4, i32 %5, i32 %6, i32 %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = mul i32 %25, %19
  %27 = mul i32 %24, %19
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %34
  %36 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %37 = add i32 %26, %36
  %38 = shl nsw i32 %35, 5
  %39 = shl nsw i32 %37, 5
  %40 = mul i32 %35, 33
  %41 = mul i32 %37, 33
  %42 = fdiv contract double %2, %3
  %43 = fptosi double %42 to i32
  %44 = sdiv i32 %43, 2
  %45 = icmp sgt i32 %44, %0
  br i1 %45, label %46, label %538

46:                                               ; preds = %11
  %47 = icmp slt i32 %38, %40
  br i1 %47, label %48, label %890

48:                                               ; preds = %46
  %49 = icmp slt i32 %39, %41
  %50 = sitofp i32 %4 to float
  %51 = sitofp i32 %0 to double
  %52 = fmul contract double %51, 0x400921FB54442D18
  %53 = fmul contract double %52, 2.500000e-01
  %54 = tail call double @llvm.fabs.f64(double %53)
  %55 = fcmp olt double %54, 0x41D0000000000000
  %56 = tail call double @llvm.amdgcn.trig.preop.f64(double %54, i32 0)
  %57 = tail call double @llvm.amdgcn.trig.preop.f64(double %54, i32 1)
  %58 = tail call double @llvm.amdgcn.trig.preop.f64(double %54, i32 2)
  %59 = fcmp oge double %54, 0x7B00000000000000
  %60 = tail call double @llvm.amdgcn.ldexp.f64(double %54, i32 -128)
  %61 = select i1 %59, double %60, double %54
  %62 = fmul double %58, %61
  %63 = fneg double %62
  %64 = tail call double @llvm.fma.f64(double %58, double %61, double %63)
  %65 = fmul double %57, %61
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %57, double %61, double %66)
  %68 = fmul double %56, %61
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %56, double %61, double %69)
  %71 = fadd double %65, %70
  %72 = fsub double %71, %65
  %73 = fsub double %71, %72
  %74 = fsub double %70, %72
  %75 = fsub double %65, %73
  %76 = fadd double %74, %75
  %77 = fadd double %62, %67
  %78 = fsub double %77, %62
  %79 = fsub double %77, %78
  %80 = fsub double %67, %78
  %81 = fsub double %62, %79
  %82 = fadd double %80, %81
  %83 = fadd double %77, %76
  %84 = fsub double %83, %77
  %85 = fsub double %83, %84
  %86 = fsub double %76, %84
  %87 = fsub double %77, %85
  %88 = fadd double %86, %87
  %89 = fadd double %82, %88
  %90 = fadd double %64, %89
  %91 = fadd double %68, %71
  %92 = fsub double %91, %68
  %93 = fsub double %71, %92
  %94 = fadd double %93, %83
  %95 = fsub double %94, %93
  %96 = fsub double %83, %95
  %97 = fadd double %96, %90
  %98 = tail call double @llvm.amdgcn.ldexp.f64(double %91, i32 -2)
  %99 = tail call double @llvm.amdgcn.fract.f64(double %98)
  %100 = tail call i1 @llvm.amdgcn.class.f64(double %98, i32 516)
  %101 = select i1 %100, double 0.000000e+00, double %99
  %102 = tail call double @llvm.amdgcn.ldexp.f64(double %101, i32 2)
  %103 = fadd double %102, %94
  %104 = fcmp olt double %103, 0.000000e+00
  %105 = select i1 %104, double 4.000000e+00, double 0.000000e+00
  %106 = fadd double %102, %105
  %107 = fadd double %94, %106
  %108 = fptosi double %107 to i32
  %109 = sitofp i32 %108 to double
  %110 = fsub double %106, %109
  %111 = fadd double %94, %110
  %112 = fsub double %111, %110
  %113 = fsub double %94, %112
  %114 = fadd double %97, %113
  %115 = fcmp oge double %111, 5.000000e-01
  %116 = zext i1 %115 to i32
  %117 = add nsw i32 %116, %108
  %118 = select i1 %115, double 1.000000e+00, double 0.000000e+00
  %119 = fsub double %111, %118
  %120 = fadd double %119, %114
  %121 = fsub double %120, %119
  %122 = fsub double %114, %121
  %123 = fmul double %120, 0x3FF921FB54442D18
  %124 = fneg double %123
  %125 = tail call double @llvm.fma.f64(double %120, double 0x3FF921FB54442D18, double %124)
  %126 = tail call double @llvm.fma.f64(double %120, double 0x3C91A62633145C07, double %125)
  %127 = tail call double @llvm.fma.f64(double %122, double 0x3FF921FB54442D18, double %126)
  %128 = fadd double %123, %127
  %129 = fsub double %128, %123
  %130 = fsub double %127, %129
  %131 = fmul double %54, 0x3FE45F306DC9C883
  %132 = tail call double @llvm.rint.f64(double %131)
  %133 = tail call double @llvm.fma.f64(double %132, double 0xBFF921FB54442D18, double %54)
  %134 = tail call double @llvm.fma.f64(double %132, double 0xBC91A62633145C00, double %133)
  %135 = fmul double %132, 0x3C91A62633145C00
  %136 = fneg double %135
  %137 = tail call double @llvm.fma.f64(double %132, double 0x3C91A62633145C00, double %136)
  %138 = fsub double %133, %135
  %139 = fsub double %133, %138
  %140 = fsub double %139, %135
  %141 = fsub double %138, %134
  %142 = fadd double %141, %140
  %143 = fsub double %142, %137
  %144 = tail call double @llvm.fma.f64(double %132, double 0xB97B839A252049C0, double %143)
  %145 = fadd double %134, %144
  %146 = fsub double %145, %134
  %147 = fsub double %144, %146
  %148 = fptosi double %132 to i32
  %149 = bitcast double %53 to <2 x i32>
  %150 = extractelement <2 x i32> %149, i64 1
  %151 = tail call i1 @llvm.amdgcn.class.f64(double %54, i32 504)
  %152 = select i1 %55, double %147, double %130
  %153 = select i1 %55, double %145, double %128
  %154 = select i1 %55, i32 %148, i32 %117
  %155 = fmul double %153, %153
  %156 = fmul double %155, 5.000000e-01
  %157 = fsub double 1.000000e+00, %156
  %158 = fsub double 1.000000e+00, %157
  %159 = fsub double %158, %156
  %160 = fmul double %155, %155
  %161 = tail call double @llvm.fma.f64(double %155, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %162 = tail call double @llvm.fma.f64(double %155, double %161, double 0xBE927E4FA17F65F6)
  %163 = tail call double @llvm.fma.f64(double %155, double %162, double 0x3EFA01A019F4EC90)
  %164 = tail call double @llvm.fma.f64(double %155, double %163, double 0xBF56C16C16C16967)
  %165 = tail call double @llvm.fma.f64(double %155, double %164, double 0x3FA5555555555555)
  %166 = fneg double %152
  %167 = tail call double @llvm.fma.f64(double %153, double %166, double %159)
  %168 = tail call double @llvm.fma.f64(double %160, double %165, double %167)
  %169 = fadd double %157, %168
  %170 = tail call double @llvm.fma.f64(double %155, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %171 = tail call double @llvm.fma.f64(double %155, double %170, double 0x3EC71DE3796CDE01)
  %172 = tail call double @llvm.fma.f64(double %155, double %171, double 0xBF2A01A019E83E5C)
  %173 = tail call double @llvm.fma.f64(double %155, double %172, double 0x3F81111111110BB3)
  %174 = fneg double %155
  %175 = fmul double %153, %174
  %176 = fmul double %152, 5.000000e-01
  %177 = tail call double @llvm.fma.f64(double %175, double %173, double %176)
  %178 = tail call double @llvm.fma.f64(double %155, double %177, double %166)
  %179 = tail call double @llvm.fma.f64(double %175, double 0xBFC5555555555555, double %178)
  %180 = fsub double %153, %179
  %181 = and i32 %154, 1
  %182 = icmp eq i32 %181, 0
  %183 = select i1 %182, double %180, double %169
  %184 = bitcast double %183 to <2 x i32>
  %185 = shl i32 %154, 30
  %186 = xor i32 %185, %150
  %187 = and i32 %186, -2147483648
  %188 = extractelement <2 x i32> %184, i64 1
  %189 = xor i32 %188, %187
  %190 = insertelement <2 x i32> %184, i32 %189, i64 1
  %191 = select i1 %151, <2 x i32> %190, <2 x i32> <i32 0, i32 2146959360>
  %192 = bitcast <2 x i32> %191 to double
  %193 = tail call double @llvm.fabs.f64(double %192)
  %194 = fmul contract double %193, %1
  br label %195

195:                                              ; preds = %48, %535
  %196 = phi i32 [ %38, %48 ], [ %536, %535 ]
  br i1 %49, label %197, label %535

197:                                              ; preds = %195
  %198 = sub nsw i32 %6, %196
  %199 = sitofp i32 %198 to float
  %200 = tail call float @llvm.fabs.f32(float %199)
  %201 = tail call float @llvm.amdgcn.frexp.mant.f32(float %200)
  %202 = fcmp olt float %201, 0x3FE5555560000000
  %203 = zext i1 %202 to i32
  %204 = tail call float @llvm.amdgcn.ldexp.f32(float %201, i32 %203)
  %205 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %200)
  %206 = sub nsw i32 %205, %203
  %207 = fadd float %204, -1.000000e+00
  %208 = fadd float %204, 1.000000e+00
  %209 = fadd float %208, -1.000000e+00
  %210 = fsub float %204, %209
  %211 = tail call float @llvm.amdgcn.rcp.f32(float %208)
  %212 = fmul float %207, %211
  %213 = fmul float %208, %212
  %214 = fneg float %213
  %215 = tail call float @llvm.fma.f32(float %212, float %208, float %214)
  %216 = tail call float @llvm.fma.f32(float %212, float %210, float %215)
  %217 = fadd float %213, %216
  %218 = fsub float %217, %213
  %219 = fsub float %216, %218
  %220 = fsub float %207, %217
  %221 = fsub float %207, %220
  %222 = fsub float %221, %217
  %223 = fsub float %222, %219
  %224 = fadd float %220, %223
  %225 = fmul float %211, %224
  %226 = fadd float %212, %225
  %227 = fsub float %226, %212
  %228 = fsub float %225, %227
  %229 = fmul float %226, %226
  %230 = fneg float %229
  %231 = tail call float @llvm.fma.f32(float %226, float %226, float %230)
  %232 = fmul float %228, 2.000000e+00
  %233 = tail call float @llvm.fma.f32(float %226, float %232, float %231)
  %234 = fadd float %229, %233
  %235 = fsub float %234, %229
  %236 = fsub float %233, %235
  %237 = tail call float @llvm.fmuladd.f32(float %234, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %238 = tail call float @llvm.fmuladd.f32(float %234, float %237, float 0x3FD999BDE0000000)
  %239 = sitofp i32 %206 to float
  %240 = fmul float %239, 0x3FE62E4300000000
  %241 = fneg float %240
  %242 = tail call float @llvm.fma.f32(float %239, float 0x3FE62E4300000000, float %241)
  %243 = tail call float @llvm.fma.f32(float %239, float 0xBE205C6100000000, float %242)
  %244 = fadd float %240, %243
  %245 = fsub float %244, %240
  %246 = fsub float %243, %245
  %247 = tail call float @llvm.amdgcn.ldexp.f32(float %226, i32 1)
  %248 = fmul float %226, %234
  %249 = fneg float %248
  %250 = tail call float @llvm.fma.f32(float %234, float %226, float %249)
  %251 = tail call float @llvm.fma.f32(float %234, float %228, float %250)
  %252 = tail call float @llvm.fma.f32(float %236, float %226, float %251)
  %253 = fadd float %248, %252
  %254 = fsub float %253, %248
  %255 = fsub float %252, %254
  %256 = fmul float %234, %238
  %257 = fneg float %256
  %258 = tail call float @llvm.fma.f32(float %234, float %238, float %257)
  %259 = tail call float @llvm.fma.f32(float %236, float %238, float %258)
  %260 = fadd float %256, %259
  %261 = fsub float %260, %256
  %262 = fsub float %259, %261
  %263 = fadd float %260, 0x3FE5555540000000
  %264 = fadd float %263, 0xBFE5555540000000
  %265 = fsub float %260, %264
  %266 = fadd float %262, 0x3E2E720200000000
  %267 = fadd float %266, %265
  %268 = fadd float %263, %267
  %269 = fsub float %268, %263
  %270 = fsub float %267, %269
  %271 = fmul float %253, %268
  %272 = fneg float %271
  %273 = tail call float @llvm.fma.f32(float %253, float %268, float %272)
  %274 = tail call float @llvm.fma.f32(float %253, float %270, float %273)
  %275 = tail call float @llvm.fma.f32(float %255, float %268, float %274)
  %276 = tail call float @llvm.amdgcn.ldexp.f32(float %228, i32 1)
  %277 = fadd float %271, %275
  %278 = fsub float %277, %271
  %279 = fsub float %275, %278
  %280 = fadd float %247, %277
  %281 = fsub float %280, %247
  %282 = fsub float %277, %281
  %283 = fadd float %276, %279
  %284 = fadd float %283, %282
  %285 = fadd float %280, %284
  %286 = fsub float %285, %280
  %287 = fsub float %284, %286
  %288 = fadd float %244, %285
  %289 = fsub float %288, %244
  %290 = fsub float %288, %289
  %291 = fsub float %244, %290
  %292 = fsub float %285, %289
  %293 = fadd float %292, %291
  %294 = fadd float %246, %287
  %295 = fsub float %294, %246
  %296 = fsub float %294, %295
  %297 = fsub float %246, %296
  %298 = fsub float %287, %295
  %299 = fadd float %298, %297
  %300 = fadd float %294, %293
  %301 = fadd float %288, %300
  %302 = fsub float %301, %288
  %303 = fsub float %300, %302
  %304 = fadd float %299, %303
  %305 = fadd float %301, %304
  %306 = fsub float %305, %301
  %307 = fsub float %304, %306
  %308 = fmul float %305, 2.000000e+00
  %309 = fneg float %308
  %310 = tail call float @llvm.fma.f32(float %305, float 2.000000e+00, float %309)
  %311 = fmul float %305, 0.000000e+00
  %312 = tail call float @llvm.fma.f32(float %307, float 2.000000e+00, float %311)
  %313 = fadd float %310, %312
  %314 = fadd float %308, %313
  %315 = fsub float %314, %308
  %316 = fsub float %313, %315
  %317 = tail call float @llvm.fabs.f32(float %308) #3
  %318 = fcmp oeq float %317, 0x7FF0000000000000
  %319 = select i1 %318, float %308, float %314
  %320 = tail call float @llvm.fabs.f32(float %319) #3
  %321 = fcmp oeq float %320, 0x7FF0000000000000
  %322 = select i1 %321, float 0.000000e+00, float %316
  %323 = fcmp oeq float %319, 0x40562E4300000000
  %324 = select i1 %323, float 0x3EE0000000000000, float 0.000000e+00
  %325 = fsub float %319, %324
  %326 = fadd float %324, %322
  %327 = fmul float %325, 0x3FF7154760000000
  %328 = tail call float @llvm.rint.f32(float %327)
  %329 = fcmp ogt float %325, 0x40562E4300000000
  %330 = fcmp olt float %325, 0xC059D1DA00000000
  %331 = fneg float %327
  %332 = tail call float @llvm.fma.f32(float %325, float 0x3FF7154760000000, float %331)
  %333 = tail call float @llvm.fma.f32(float %325, float 0x3E54AE0BE0000000, float %332)
  %334 = fsub float %327, %328
  %335 = fadd float %333, %334
  %336 = tail call float @llvm.exp2.f32(float %335)
  %337 = fptosi float %328 to i32
  %338 = tail call float @llvm.amdgcn.ldexp.f32(float %336, i32 %337)
  %339 = select i1 %330, float 0.000000e+00, float %338
  %340 = select i1 %329, float 0x7FF0000000000000, float %339
  %341 = tail call float @llvm.fma.f32(float %340, float %326, float %340)
  %342 = tail call float @llvm.fabs.f32(float %340) #3
  %343 = fcmp oeq float %342, 0x7FF0000000000000
  %344 = select i1 %343, float %340, float %341
  %345 = tail call float @llvm.fabs.f32(float %344)
  %346 = fcmp oeq float %200, 0x7FF0000000000000
  %347 = icmp eq i32 %196, %6
  %348 = select i1 %346, float 0x7FF0000000000000, float %345
  %349 = select i1 %347, float 0.000000e+00, float %348
  %350 = mul nsw i32 %196, %27
  br label %351

351:                                              ; preds = %197, %532
  %352 = phi i32 [ %39, %197 ], [ %533, %532 ]
  %353 = sub nsw i32 %7, %352
  %354 = sitofp i32 %353 to float
  %355 = tail call float @llvm.fabs.f32(float %354)
  %356 = tail call float @llvm.amdgcn.frexp.mant.f32(float %355)
  %357 = fcmp olt float %356, 0x3FE5555560000000
  %358 = zext i1 %357 to i32
  %359 = tail call float @llvm.amdgcn.ldexp.f32(float %356, i32 %358)
  %360 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %355)
  %361 = sub nsw i32 %360, %358
  %362 = fadd float %359, -1.000000e+00
  %363 = fadd float %359, 1.000000e+00
  %364 = fadd float %363, -1.000000e+00
  %365 = fsub float %359, %364
  %366 = tail call float @llvm.amdgcn.rcp.f32(float %363)
  %367 = fmul float %362, %366
  %368 = fmul float %363, %367
  %369 = fneg float %368
  %370 = tail call float @llvm.fma.f32(float %367, float %363, float %369)
  %371 = tail call float @llvm.fma.f32(float %367, float %365, float %370)
  %372 = fadd float %368, %371
  %373 = fsub float %372, %368
  %374 = fsub float %371, %373
  %375 = fsub float %362, %372
  %376 = fsub float %362, %375
  %377 = fsub float %376, %372
  %378 = fsub float %377, %374
  %379 = fadd float %375, %378
  %380 = fmul float %366, %379
  %381 = fadd float %367, %380
  %382 = fsub float %381, %367
  %383 = fsub float %380, %382
  %384 = fmul float %381, %381
  %385 = fneg float %384
  %386 = tail call float @llvm.fma.f32(float %381, float %381, float %385)
  %387 = fmul float %383, 2.000000e+00
  %388 = tail call float @llvm.fma.f32(float %381, float %387, float %386)
  %389 = fadd float %384, %388
  %390 = fsub float %389, %384
  %391 = fsub float %388, %390
  %392 = tail call float @llvm.fmuladd.f32(float %389, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %393 = tail call float @llvm.fmuladd.f32(float %389, float %392, float 0x3FD999BDE0000000)
  %394 = sitofp i32 %361 to float
  %395 = fmul float %394, 0x3FE62E4300000000
  %396 = fneg float %395
  %397 = tail call float @llvm.fma.f32(float %394, float 0x3FE62E4300000000, float %396)
  %398 = tail call float @llvm.fma.f32(float %394, float 0xBE205C6100000000, float %397)
  %399 = fadd float %395, %398
  %400 = fsub float %399, %395
  %401 = fsub float %398, %400
  %402 = tail call float @llvm.amdgcn.ldexp.f32(float %381, i32 1)
  %403 = fmul float %381, %389
  %404 = fneg float %403
  %405 = tail call float @llvm.fma.f32(float %389, float %381, float %404)
  %406 = tail call float @llvm.fma.f32(float %389, float %383, float %405)
  %407 = tail call float @llvm.fma.f32(float %391, float %381, float %406)
  %408 = fadd float %403, %407
  %409 = fsub float %408, %403
  %410 = fsub float %407, %409
  %411 = fmul float %389, %393
  %412 = fneg float %411
  %413 = tail call float @llvm.fma.f32(float %389, float %393, float %412)
  %414 = tail call float @llvm.fma.f32(float %391, float %393, float %413)
  %415 = fadd float %411, %414
  %416 = fsub float %415, %411
  %417 = fsub float %414, %416
  %418 = fadd float %415, 0x3FE5555540000000
  %419 = fadd float %418, 0xBFE5555540000000
  %420 = fsub float %415, %419
  %421 = fadd float %417, 0x3E2E720200000000
  %422 = fadd float %421, %420
  %423 = fadd float %418, %422
  %424 = fsub float %423, %418
  %425 = fsub float %422, %424
  %426 = fmul float %408, %423
  %427 = fneg float %426
  %428 = tail call float @llvm.fma.f32(float %408, float %423, float %427)
  %429 = tail call float @llvm.fma.f32(float %408, float %425, float %428)
  %430 = tail call float @llvm.fma.f32(float %410, float %423, float %429)
  %431 = tail call float @llvm.amdgcn.ldexp.f32(float %383, i32 1)
  %432 = fadd float %426, %430
  %433 = fsub float %432, %426
  %434 = fsub float %430, %433
  %435 = fadd float %402, %432
  %436 = fsub float %435, %402
  %437 = fsub float %432, %436
  %438 = fadd float %431, %434
  %439 = fadd float %438, %437
  %440 = fadd float %435, %439
  %441 = fsub float %440, %435
  %442 = fsub float %439, %441
  %443 = fadd float %399, %440
  %444 = fsub float %443, %399
  %445 = fsub float %443, %444
  %446 = fsub float %399, %445
  %447 = fsub float %440, %444
  %448 = fadd float %447, %446
  %449 = fadd float %401, %442
  %450 = fsub float %449, %401
  %451 = fsub float %449, %450
  %452 = fsub float %401, %451
  %453 = fsub float %442, %450
  %454 = fadd float %453, %452
  %455 = fadd float %449, %448
  %456 = fadd float %443, %455
  %457 = fsub float %456, %443
  %458 = fsub float %455, %457
  %459 = fadd float %454, %458
  %460 = fadd float %456, %459
  %461 = fsub float %460, %456
  %462 = fsub float %459, %461
  %463 = fmul float %460, 2.000000e+00
  %464 = fneg float %463
  %465 = tail call float @llvm.fma.f32(float %460, float 2.000000e+00, float %464)
  %466 = fmul float %460, 0.000000e+00
  %467 = tail call float @llvm.fma.f32(float %462, float 2.000000e+00, float %466)
  %468 = fadd float %465, %467
  %469 = fadd float %463, %468
  %470 = fsub float %469, %463
  %471 = fsub float %468, %470
  %472 = tail call float @llvm.fabs.f32(float %463) #3
  %473 = fcmp oeq float %472, 0x7FF0000000000000
  %474 = select i1 %473, float %463, float %469
  %475 = tail call float @llvm.fabs.f32(float %474) #3
  %476 = fcmp oeq float %475, 0x7FF0000000000000
  %477 = select i1 %476, float 0.000000e+00, float %471
  %478 = fcmp oeq float %474, 0x40562E4300000000
  %479 = select i1 %478, float 0x3EE0000000000000, float 0.000000e+00
  %480 = fsub float %474, %479
  %481 = fadd float %479, %477
  %482 = fmul float %480, 0x3FF7154760000000
  %483 = tail call float @llvm.rint.f32(float %482)
  %484 = fcmp ogt float %480, 0x40562E4300000000
  %485 = fcmp olt float %480, 0xC059D1DA00000000
  %486 = fneg float %482
  %487 = tail call float @llvm.fma.f32(float %480, float 0x3FF7154760000000, float %486)
  %488 = tail call float @llvm.fma.f32(float %480, float 0x3E54AE0BE0000000, float %487)
  %489 = fsub float %482, %483
  %490 = fadd float %488, %489
  %491 = tail call float @llvm.exp2.f32(float %490)
  %492 = fptosi float %483 to i32
  %493 = tail call float @llvm.amdgcn.ldexp.f32(float %491, i32 %492)
  %494 = select i1 %485, float 0.000000e+00, float %493
  %495 = select i1 %484, float 0x7FF0000000000000, float %494
  %496 = tail call float @llvm.fma.f32(float %495, float %481, float %495)
  %497 = tail call float @llvm.fabs.f32(float %495) #3
  %498 = fcmp oeq float %497, 0x7FF0000000000000
  %499 = select i1 %498, float %495, float %496
  %500 = tail call float @llvm.fabs.f32(float %499)
  %501 = fcmp oeq float %355, 0x7FF0000000000000
  %502 = icmp eq i32 %352, %7
  %503 = select i1 %501, float 0x7FF0000000000000, float %500
  %504 = select i1 %502, float 0.000000e+00, float %503
  %505 = fadd contract float %349, %504
  %506 = fcmp olt float %505, 0x39F0000000000000
  %507 = select i1 %506, float 0x41F0000000000000, float 1.000000e+00
  %508 = fmul float %505, %507
  %509 = tail call float @llvm.sqrt.f32(float %508)
  %510 = bitcast float %509 to i32
  %511 = add nsw i32 %510, -1
  %512 = bitcast i32 %511 to float
  %513 = add nsw i32 %510, 1
  %514 = bitcast i32 %513 to float
  %515 = tail call i1 @llvm.amdgcn.class.f32(float %508, i32 608)
  %516 = select i1 %506, float 0x3EF0000000000000, float 1.000000e+00
  %517 = fneg float %514
  %518 = tail call float @llvm.fma.f32(float %517, float %509, float %508)
  %519 = fcmp ogt float %518, 0.000000e+00
  %520 = fneg float %512
  %521 = tail call float @llvm.fma.f32(float %520, float %509, float %508)
  %522 = fcmp ole float %521, 0.000000e+00
  %523 = select i1 %522, float %512, float %509
  %524 = select i1 %519, float %514, float %523
  %525 = fmul float %516, %524
  %526 = select i1 %515, float %508, float %525
  %527 = fcmp contract ugt float %526, %50
  br i1 %527, label %532, label %528

528:                                              ; preds = %351
  %529 = add nsw i32 %352, %350
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds double, double addrspace(1)* %10, i64 %530
  store double %194, double addrspace(1)* %531, align 8, !tbaa !16
  br label %532

532:                                              ; preds = %351, %528
  %533 = add nsw i32 %352, 1
  %534 = icmp eq i32 %533, %41
  br i1 %534, label %535, label %351, !llvm.loop !20

535:                                              ; preds = %532, %195
  %536 = add nsw i32 %196, 1
  %537 = icmp eq i32 %536, %40
  br i1 %537, label %890, label %195, !llvm.loop !22

538:                                              ; preds = %11
  %539 = icmp ne i32 %5, 0
  %540 = icmp slt i32 %38, %40
  %541 = select i1 %539, i1 %540, i1 false
  br i1 %541, label %542, label %890

542:                                              ; preds = %538
  %543 = icmp slt i32 %39, %41
  %544 = sitofp i32 %4 to float
  br label %545

545:                                              ; preds = %542, %887
  %546 = phi i32 [ %38, %542 ], [ %888, %887 ]
  br i1 %543, label %547, label %887

547:                                              ; preds = %545
  %548 = sub nsw i32 %6, %546
  %549 = sitofp i32 %548 to float
  %550 = tail call float @llvm.fabs.f32(float %549)
  %551 = tail call float @llvm.amdgcn.frexp.mant.f32(float %550)
  %552 = fcmp olt float %551, 0x3FE5555560000000
  %553 = zext i1 %552 to i32
  %554 = tail call float @llvm.amdgcn.ldexp.f32(float %551, i32 %553)
  %555 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %550)
  %556 = sub nsw i32 %555, %553
  %557 = fadd float %554, -1.000000e+00
  %558 = fadd float %554, 1.000000e+00
  %559 = fadd float %558, -1.000000e+00
  %560 = fsub float %554, %559
  %561 = tail call float @llvm.amdgcn.rcp.f32(float %558)
  %562 = fmul float %557, %561
  %563 = fmul float %558, %562
  %564 = fneg float %563
  %565 = tail call float @llvm.fma.f32(float %562, float %558, float %564)
  %566 = tail call float @llvm.fma.f32(float %562, float %560, float %565)
  %567 = fadd float %563, %566
  %568 = fsub float %567, %563
  %569 = fsub float %566, %568
  %570 = fsub float %557, %567
  %571 = fsub float %557, %570
  %572 = fsub float %571, %567
  %573 = fsub float %572, %569
  %574 = fadd float %570, %573
  %575 = fmul float %561, %574
  %576 = fadd float %562, %575
  %577 = fsub float %576, %562
  %578 = fsub float %575, %577
  %579 = fmul float %576, %576
  %580 = fneg float %579
  %581 = tail call float @llvm.fma.f32(float %576, float %576, float %580)
  %582 = fmul float %578, 2.000000e+00
  %583 = tail call float @llvm.fma.f32(float %576, float %582, float %581)
  %584 = fadd float %579, %583
  %585 = fsub float %584, %579
  %586 = fsub float %583, %585
  %587 = tail call float @llvm.fmuladd.f32(float %584, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %588 = tail call float @llvm.fmuladd.f32(float %584, float %587, float 0x3FD999BDE0000000)
  %589 = sitofp i32 %556 to float
  %590 = fmul float %589, 0x3FE62E4300000000
  %591 = fneg float %590
  %592 = tail call float @llvm.fma.f32(float %589, float 0x3FE62E4300000000, float %591)
  %593 = tail call float @llvm.fma.f32(float %589, float 0xBE205C6100000000, float %592)
  %594 = fadd float %590, %593
  %595 = fsub float %594, %590
  %596 = fsub float %593, %595
  %597 = tail call float @llvm.amdgcn.ldexp.f32(float %576, i32 1)
  %598 = fmul float %576, %584
  %599 = fneg float %598
  %600 = tail call float @llvm.fma.f32(float %584, float %576, float %599)
  %601 = tail call float @llvm.fma.f32(float %584, float %578, float %600)
  %602 = tail call float @llvm.fma.f32(float %586, float %576, float %601)
  %603 = fadd float %598, %602
  %604 = fsub float %603, %598
  %605 = fsub float %602, %604
  %606 = fmul float %584, %588
  %607 = fneg float %606
  %608 = tail call float @llvm.fma.f32(float %584, float %588, float %607)
  %609 = tail call float @llvm.fma.f32(float %586, float %588, float %608)
  %610 = fadd float %606, %609
  %611 = fsub float %610, %606
  %612 = fsub float %609, %611
  %613 = fadd float %610, 0x3FE5555540000000
  %614 = fadd float %613, 0xBFE5555540000000
  %615 = fsub float %610, %614
  %616 = fadd float %612, 0x3E2E720200000000
  %617 = fadd float %616, %615
  %618 = fadd float %613, %617
  %619 = fsub float %618, %613
  %620 = fsub float %617, %619
  %621 = fmul float %603, %618
  %622 = fneg float %621
  %623 = tail call float @llvm.fma.f32(float %603, float %618, float %622)
  %624 = tail call float @llvm.fma.f32(float %603, float %620, float %623)
  %625 = tail call float @llvm.fma.f32(float %605, float %618, float %624)
  %626 = tail call float @llvm.amdgcn.ldexp.f32(float %578, i32 1)
  %627 = fadd float %621, %625
  %628 = fsub float %627, %621
  %629 = fsub float %625, %628
  %630 = fadd float %597, %627
  %631 = fsub float %630, %597
  %632 = fsub float %627, %631
  %633 = fadd float %626, %629
  %634 = fadd float %633, %632
  %635 = fadd float %630, %634
  %636 = fsub float %635, %630
  %637 = fsub float %634, %636
  %638 = fadd float %594, %635
  %639 = fsub float %638, %594
  %640 = fsub float %638, %639
  %641 = fsub float %594, %640
  %642 = fsub float %635, %639
  %643 = fadd float %642, %641
  %644 = fadd float %596, %637
  %645 = fsub float %644, %596
  %646 = fsub float %644, %645
  %647 = fsub float %596, %646
  %648 = fsub float %637, %645
  %649 = fadd float %648, %647
  %650 = fadd float %644, %643
  %651 = fadd float %638, %650
  %652 = fsub float %651, %638
  %653 = fsub float %650, %652
  %654 = fadd float %649, %653
  %655 = fadd float %651, %654
  %656 = fsub float %655, %651
  %657 = fsub float %654, %656
  %658 = fmul float %655, 2.000000e+00
  %659 = fneg float %658
  %660 = tail call float @llvm.fma.f32(float %655, float 2.000000e+00, float %659)
  %661 = fmul float %655, 0.000000e+00
  %662 = tail call float @llvm.fma.f32(float %657, float 2.000000e+00, float %661)
  %663 = fadd float %660, %662
  %664 = fadd float %658, %663
  %665 = fsub float %664, %658
  %666 = fsub float %663, %665
  %667 = tail call float @llvm.fabs.f32(float %658) #3
  %668 = fcmp oeq float %667, 0x7FF0000000000000
  %669 = select i1 %668, float %658, float %664
  %670 = tail call float @llvm.fabs.f32(float %669) #3
  %671 = fcmp oeq float %670, 0x7FF0000000000000
  %672 = select i1 %671, float 0.000000e+00, float %666
  %673 = fcmp oeq float %669, 0x40562E4300000000
  %674 = select i1 %673, float 0x3EE0000000000000, float 0.000000e+00
  %675 = fsub float %669, %674
  %676 = fadd float %674, %672
  %677 = fmul float %675, 0x3FF7154760000000
  %678 = tail call float @llvm.rint.f32(float %677)
  %679 = fcmp ogt float %675, 0x40562E4300000000
  %680 = fcmp olt float %675, 0xC059D1DA00000000
  %681 = fneg float %677
  %682 = tail call float @llvm.fma.f32(float %675, float 0x3FF7154760000000, float %681)
  %683 = tail call float @llvm.fma.f32(float %675, float 0x3E54AE0BE0000000, float %682)
  %684 = fsub float %677, %678
  %685 = fadd float %683, %684
  %686 = tail call float @llvm.exp2.f32(float %685)
  %687 = fptosi float %678 to i32
  %688 = tail call float @llvm.amdgcn.ldexp.f32(float %686, i32 %687)
  %689 = select i1 %680, float 0.000000e+00, float %688
  %690 = select i1 %679, float 0x7FF0000000000000, float %689
  %691 = tail call float @llvm.fma.f32(float %690, float %676, float %690)
  %692 = tail call float @llvm.fabs.f32(float %690) #3
  %693 = fcmp oeq float %692, 0x7FF0000000000000
  %694 = select i1 %693, float %690, float %691
  %695 = tail call float @llvm.fabs.f32(float %694)
  %696 = fcmp oeq float %550, 0x7FF0000000000000
  %697 = icmp eq i32 %546, %6
  %698 = select i1 %696, float 0x7FF0000000000000, float %695
  %699 = select i1 %697, float 0.000000e+00, float %698
  %700 = mul nsw i32 %546, %27
  br label %701

701:                                              ; preds = %547, %884
  %702 = phi i32 [ %39, %547 ], [ %885, %884 ]
  %703 = sub nsw i32 %7, %702
  %704 = sitofp i32 %703 to float
  %705 = tail call float @llvm.fabs.f32(float %704)
  %706 = tail call float @llvm.amdgcn.frexp.mant.f32(float %705)
  %707 = fcmp olt float %706, 0x3FE5555560000000
  %708 = zext i1 %707 to i32
  %709 = tail call float @llvm.amdgcn.ldexp.f32(float %706, i32 %708)
  %710 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %705)
  %711 = sub nsw i32 %710, %708
  %712 = fadd float %709, -1.000000e+00
  %713 = fadd float %709, 1.000000e+00
  %714 = fadd float %713, -1.000000e+00
  %715 = fsub float %709, %714
  %716 = tail call float @llvm.amdgcn.rcp.f32(float %713)
  %717 = fmul float %712, %716
  %718 = fmul float %713, %717
  %719 = fneg float %718
  %720 = tail call float @llvm.fma.f32(float %717, float %713, float %719)
  %721 = tail call float @llvm.fma.f32(float %717, float %715, float %720)
  %722 = fadd float %718, %721
  %723 = fsub float %722, %718
  %724 = fsub float %721, %723
  %725 = fsub float %712, %722
  %726 = fsub float %712, %725
  %727 = fsub float %726, %722
  %728 = fsub float %727, %724
  %729 = fadd float %725, %728
  %730 = fmul float %716, %729
  %731 = fadd float %717, %730
  %732 = fsub float %731, %717
  %733 = fsub float %730, %732
  %734 = fmul float %731, %731
  %735 = fneg float %734
  %736 = tail call float @llvm.fma.f32(float %731, float %731, float %735)
  %737 = fmul float %733, 2.000000e+00
  %738 = tail call float @llvm.fma.f32(float %731, float %737, float %736)
  %739 = fadd float %734, %738
  %740 = fsub float %739, %734
  %741 = fsub float %738, %740
  %742 = tail call float @llvm.fmuladd.f32(float %739, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %743 = tail call float @llvm.fmuladd.f32(float %739, float %742, float 0x3FD999BDE0000000)
  %744 = sitofp i32 %711 to float
  %745 = fmul float %744, 0x3FE62E4300000000
  %746 = fneg float %745
  %747 = tail call float @llvm.fma.f32(float %744, float 0x3FE62E4300000000, float %746)
  %748 = tail call float @llvm.fma.f32(float %744, float 0xBE205C6100000000, float %747)
  %749 = fadd float %745, %748
  %750 = fsub float %749, %745
  %751 = fsub float %748, %750
  %752 = tail call float @llvm.amdgcn.ldexp.f32(float %731, i32 1)
  %753 = fmul float %731, %739
  %754 = fneg float %753
  %755 = tail call float @llvm.fma.f32(float %739, float %731, float %754)
  %756 = tail call float @llvm.fma.f32(float %739, float %733, float %755)
  %757 = tail call float @llvm.fma.f32(float %741, float %731, float %756)
  %758 = fadd float %753, %757
  %759 = fsub float %758, %753
  %760 = fsub float %757, %759
  %761 = fmul float %739, %743
  %762 = fneg float %761
  %763 = tail call float @llvm.fma.f32(float %739, float %743, float %762)
  %764 = tail call float @llvm.fma.f32(float %741, float %743, float %763)
  %765 = fadd float %761, %764
  %766 = fsub float %765, %761
  %767 = fsub float %764, %766
  %768 = fadd float %765, 0x3FE5555540000000
  %769 = fadd float %768, 0xBFE5555540000000
  %770 = fsub float %765, %769
  %771 = fadd float %767, 0x3E2E720200000000
  %772 = fadd float %771, %770
  %773 = fadd float %768, %772
  %774 = fsub float %773, %768
  %775 = fsub float %772, %774
  %776 = fmul float %758, %773
  %777 = fneg float %776
  %778 = tail call float @llvm.fma.f32(float %758, float %773, float %777)
  %779 = tail call float @llvm.fma.f32(float %758, float %775, float %778)
  %780 = tail call float @llvm.fma.f32(float %760, float %773, float %779)
  %781 = tail call float @llvm.amdgcn.ldexp.f32(float %733, i32 1)
  %782 = fadd float %776, %780
  %783 = fsub float %782, %776
  %784 = fsub float %780, %783
  %785 = fadd float %752, %782
  %786 = fsub float %785, %752
  %787 = fsub float %782, %786
  %788 = fadd float %781, %784
  %789 = fadd float %788, %787
  %790 = fadd float %785, %789
  %791 = fsub float %790, %785
  %792 = fsub float %789, %791
  %793 = fadd float %749, %790
  %794 = fsub float %793, %749
  %795 = fsub float %793, %794
  %796 = fsub float %749, %795
  %797 = fsub float %790, %794
  %798 = fadd float %797, %796
  %799 = fadd float %751, %792
  %800 = fsub float %799, %751
  %801 = fsub float %799, %800
  %802 = fsub float %751, %801
  %803 = fsub float %792, %800
  %804 = fadd float %803, %802
  %805 = fadd float %799, %798
  %806 = fadd float %793, %805
  %807 = fsub float %806, %793
  %808 = fsub float %805, %807
  %809 = fadd float %804, %808
  %810 = fadd float %806, %809
  %811 = fsub float %810, %806
  %812 = fsub float %809, %811
  %813 = fmul float %810, 2.000000e+00
  %814 = fneg float %813
  %815 = tail call float @llvm.fma.f32(float %810, float 2.000000e+00, float %814)
  %816 = fmul float %810, 0.000000e+00
  %817 = tail call float @llvm.fma.f32(float %812, float 2.000000e+00, float %816)
  %818 = fadd float %815, %817
  %819 = fadd float %813, %818
  %820 = fsub float %819, %813
  %821 = fsub float %818, %820
  %822 = tail call float @llvm.fabs.f32(float %813) #3
  %823 = fcmp oeq float %822, 0x7FF0000000000000
  %824 = select i1 %823, float %813, float %819
  %825 = tail call float @llvm.fabs.f32(float %824) #3
  %826 = fcmp oeq float %825, 0x7FF0000000000000
  %827 = select i1 %826, float 0.000000e+00, float %821
  %828 = fcmp oeq float %824, 0x40562E4300000000
  %829 = select i1 %828, float 0x3EE0000000000000, float 0.000000e+00
  %830 = fsub float %824, %829
  %831 = fadd float %829, %827
  %832 = fmul float %830, 0x3FF7154760000000
  %833 = tail call float @llvm.rint.f32(float %832)
  %834 = fcmp ogt float %830, 0x40562E4300000000
  %835 = fcmp olt float %830, 0xC059D1DA00000000
  %836 = fneg float %832
  %837 = tail call float @llvm.fma.f32(float %830, float 0x3FF7154760000000, float %836)
  %838 = tail call float @llvm.fma.f32(float %830, float 0x3E54AE0BE0000000, float %837)
  %839 = fsub float %832, %833
  %840 = fadd float %838, %839
  %841 = tail call float @llvm.exp2.f32(float %840)
  %842 = fptosi float %833 to i32
  %843 = tail call float @llvm.amdgcn.ldexp.f32(float %841, i32 %842)
  %844 = select i1 %835, float 0.000000e+00, float %843
  %845 = select i1 %834, float 0x7FF0000000000000, float %844
  %846 = tail call float @llvm.fma.f32(float %845, float %831, float %845)
  %847 = tail call float @llvm.fabs.f32(float %845) #3
  %848 = fcmp oeq float %847, 0x7FF0000000000000
  %849 = select i1 %848, float %845, float %846
  %850 = tail call float @llvm.fabs.f32(float %849)
  %851 = fcmp oeq float %705, 0x7FF0000000000000
  %852 = icmp eq i32 %702, %7
  %853 = select i1 %851, float 0x7FF0000000000000, float %850
  %854 = select i1 %852, float 0.000000e+00, float %853
  %855 = fadd contract float %699, %854
  %856 = fcmp olt float %855, 0x39F0000000000000
  %857 = select i1 %856, float 0x41F0000000000000, float 1.000000e+00
  %858 = fmul float %855, %857
  %859 = tail call float @llvm.sqrt.f32(float %858)
  %860 = bitcast float %859 to i32
  %861 = add nsw i32 %860, -1
  %862 = bitcast i32 %861 to float
  %863 = add nsw i32 %860, 1
  %864 = bitcast i32 %863 to float
  %865 = tail call i1 @llvm.amdgcn.class.f32(float %858, i32 608)
  %866 = select i1 %856, float 0x3EF0000000000000, float 1.000000e+00
  %867 = fneg float %864
  %868 = tail call float @llvm.fma.f32(float %867, float %859, float %858)
  %869 = fcmp ogt float %868, 0.000000e+00
  %870 = fneg float %862
  %871 = tail call float @llvm.fma.f32(float %870, float %859, float %858)
  %872 = fcmp ole float %871, 0.000000e+00
  %873 = select i1 %872, float %862, float %859
  %874 = select i1 %869, float %864, float %873
  %875 = fmul float %866, %874
  %876 = select i1 %865, float %858, float %875
  %877 = fcmp contract ugt float %876, %544
  br i1 %877, label %884, label %878

878:                                              ; preds = %701
  %879 = add nsw i32 %702, %700
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds double, double addrspace(1)* %8, i64 %880
  store double 0.000000e+00, double addrspace(1)* %881, align 8, !tbaa !16
  %882 = getelementptr inbounds double, double addrspace(1)* %9, i64 %880
  store double 0.000000e+00, double addrspace(1)* %882, align 8, !tbaa !16
  %883 = getelementptr inbounds double, double addrspace(1)* %10, i64 %880
  store double 0.000000e+00, double addrspace(1)* %883, align 8, !tbaa !16
  br label %884

884:                                              ; preds = %701, %878
  %885 = add nsw i32 %702, 1
  %886 = icmp eq i32 %885, %41
  br i1 %886, label %887, label %701, !llvm.loop !23

887:                                              ; preds = %884, %545
  %888 = add nsw i32 %546, 1
  %889 = icmp eq i32 %888, %40
  br i1 %889, label %890, label %545, !llvm.loop !24

890:                                              ; preds = %887, %535, %46, %538
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

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
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{!5, !9, i64 16}
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
