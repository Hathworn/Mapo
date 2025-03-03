; ModuleID = '../data/hip_kernels/14074/3/main.cu'
source_filename = "../data/hip_kernels/14074/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26THCudaTensor_kernel_renormPfflfE6buffer = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26THCudaTensor_kernel_renormPfflf(float addrspace(1)* nocapture %0, float %1, i64 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = zext i16 %12 to i64
  %15 = mul nsw i64 %8, %2
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ26THCudaTensor_kernel_renormPfflfE6buffer, i32 0, i32 %5
  store float 0.000000e+00, float addrspace(3)* %17, align 4, !tbaa !7
  %18 = icmp slt i64 %6, %2
  br i1 %18, label %19, label %27

19:                                               ; preds = %4
  %20 = tail call float @llvm.fabs.f32(float %1)
  %21 = fcmp oeq float %20, 0x7FF0000000000000
  %22 = bitcast float %1 to i32
  %23 = fcmp olt float %1, 0.000000e+00
  %24 = fcmp oeq float %1, 0.000000e+00
  br i1 %21, label %192, label %29

25:                                               ; preds = %29, %192
  %26 = phi float [ %216, %192 ], [ %189, %29 ]
  store float %26, float addrspace(3)* %17, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %25, %4
  %28 = icmp ult i16 %12, 2
  br i1 %28, label %219, label %414

29:                                               ; preds = %19, %29
  %30 = phi float [ %189, %29 ], [ 0.000000e+00, %19 ]
  %31 = phi i64 [ %190, %29 ], [ %6, %19 ]
  %32 = getelementptr inbounds float, float addrspace(1)* %16, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = tail call float @llvm.fabs.f32(float %33)
  %35 = tail call float @llvm.amdgcn.frexp.mant.f32(float %34)
  %36 = fcmp olt float %35, 0x3FE5555560000000
  %37 = zext i1 %36 to i32
  %38 = tail call float @llvm.amdgcn.ldexp.f32(float %35, i32 %37)
  %39 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %34)
  %40 = sub nsw i32 %39, %37
  %41 = fadd float %38, -1.000000e+00
  %42 = fadd float %38, 1.000000e+00
  %43 = fadd float %42, -1.000000e+00
  %44 = fsub float %38, %43
  %45 = tail call float @llvm.amdgcn.rcp.f32(float %42)
  %46 = fmul float %41, %45
  %47 = fmul float %42, %46
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %46, float %42, float %48)
  %50 = tail call float @llvm.fma.f32(float %46, float %44, float %49)
  %51 = fadd float %47, %50
  %52 = fsub float %51, %47
  %53 = fsub float %50, %52
  %54 = fsub float %41, %51
  %55 = fsub float %41, %54
  %56 = fsub float %55, %51
  %57 = fsub float %56, %53
  %58 = fadd float %54, %57
  %59 = fmul float %45, %58
  %60 = fadd float %46, %59
  %61 = fsub float %60, %46
  %62 = fsub float %59, %61
  %63 = fmul float %60, %60
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %60, float %60, float %64)
  %66 = fmul float %62, 2.000000e+00
  %67 = tail call float @llvm.fma.f32(float %60, float %66, float %65)
  %68 = fadd float %63, %67
  %69 = fsub float %68, %63
  %70 = fsub float %67, %69
  %71 = tail call float @llvm.fmuladd.f32(float %68, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %72 = tail call float @llvm.fmuladd.f32(float %68, float %71, float 0x3FD999BDE0000000)
  %73 = sitofp i32 %40 to float
  %74 = fmul float %73, 0x3FE62E4300000000
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %73, float 0x3FE62E4300000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %73, float 0xBE205C6100000000, float %76)
  %78 = fadd float %74, %77
  %79 = fsub float %78, %74
  %80 = fsub float %77, %79
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 1)
  %82 = fmul float %60, %68
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %68, float %60, float %83)
  %85 = tail call float @llvm.fma.f32(float %68, float %62, float %84)
  %86 = tail call float @llvm.fma.f32(float %70, float %60, float %85)
  %87 = fadd float %82, %86
  %88 = fsub float %87, %82
  %89 = fsub float %86, %88
  %90 = fmul float %68, %72
  %91 = fneg float %90
  %92 = tail call float @llvm.fma.f32(float %68, float %72, float %91)
  %93 = tail call float @llvm.fma.f32(float %70, float %72, float %92)
  %94 = fadd float %90, %93
  %95 = fsub float %94, %90
  %96 = fsub float %93, %95
  %97 = fadd float %94, 0x3FE5555540000000
  %98 = fadd float %97, 0xBFE5555540000000
  %99 = fsub float %94, %98
  %100 = fadd float %96, 0x3E2E720200000000
  %101 = fadd float %100, %99
  %102 = fadd float %97, %101
  %103 = fsub float %102, %97
  %104 = fsub float %101, %103
  %105 = fmul float %87, %102
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %87, float %102, float %106)
  %108 = tail call float @llvm.fma.f32(float %87, float %104, float %107)
  %109 = tail call float @llvm.fma.f32(float %89, float %102, float %108)
  %110 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 1)
  %111 = fadd float %105, %109
  %112 = fsub float %111, %105
  %113 = fsub float %109, %112
  %114 = fadd float %81, %111
  %115 = fsub float %114, %81
  %116 = fsub float %111, %115
  %117 = fadd float %110, %113
  %118 = fadd float %117, %116
  %119 = fadd float %114, %118
  %120 = fsub float %119, %114
  %121 = fsub float %118, %120
  %122 = fadd float %78, %119
  %123 = fsub float %122, %78
  %124 = fsub float %122, %123
  %125 = fsub float %78, %124
  %126 = fsub float %119, %123
  %127 = fadd float %126, %125
  %128 = fadd float %80, %121
  %129 = fsub float %128, %80
  %130 = fsub float %128, %129
  %131 = fsub float %80, %130
  %132 = fsub float %121, %129
  %133 = fadd float %132, %131
  %134 = fadd float %128, %127
  %135 = fadd float %122, %134
  %136 = fsub float %135, %122
  %137 = fsub float %134, %136
  %138 = fadd float %133, %137
  %139 = fadd float %135, %138
  %140 = fsub float %139, %135
  %141 = fsub float %138, %140
  %142 = fmul float %139, %1
  %143 = fneg float %142
  %144 = tail call float @llvm.fma.f32(float %1, float %139, float %143)
  %145 = tail call float @llvm.fma.f32(float %1, float %141, float %144)
  %146 = fadd float %142, %145
  %147 = fsub float %146, %142
  %148 = fsub float %145, %147
  %149 = tail call float @llvm.fabs.f32(float %142) #4
  %150 = fcmp oeq float %149, 0x7FF0000000000000
  %151 = select i1 %150, float %142, float %146
  %152 = tail call float @llvm.fabs.f32(float %151) #4
  %153 = fcmp oeq float %152, 0x7FF0000000000000
  %154 = select i1 %153, float 0.000000e+00, float %148
  %155 = fcmp oeq float %151, 0x40562E4300000000
  %156 = select i1 %155, float 0x3EE0000000000000, float 0.000000e+00
  %157 = fsub float %151, %156
  %158 = fadd float %156, %154
  %159 = fmul float %157, 0x3FF7154760000000
  %160 = tail call float @llvm.rint.f32(float %159)
  %161 = fcmp ogt float %157, 0x40562E4300000000
  %162 = fcmp olt float %157, 0xC059D1DA00000000
  %163 = fneg float %159
  %164 = tail call float @llvm.fma.f32(float %157, float 0x3FF7154760000000, float %163)
  %165 = tail call float @llvm.fma.f32(float %157, float 0x3E54AE0BE0000000, float %164)
  %166 = fsub float %159, %160
  %167 = fadd float %165, %166
  %168 = tail call float @llvm.exp2.f32(float %167)
  %169 = fptosi float %160 to i32
  %170 = tail call float @llvm.amdgcn.ldexp.f32(float %168, i32 %169)
  %171 = select i1 %162, float 0.000000e+00, float %170
  %172 = select i1 %161, float 0x7FF0000000000000, float %171
  %173 = tail call float @llvm.fma.f32(float %172, float %158, float %172)
  %174 = tail call float @llvm.fabs.f32(float %172) #4
  %175 = fcmp oeq float %174, 0x7FF0000000000000
  %176 = select i1 %175, float %172, float %173
  %177 = tail call float @llvm.fabs.f32(float %176)
  %178 = fcmp oeq float %34, 0x7FF0000000000000
  %179 = fcmp oeq float %33, 0.000000e+00
  %180 = or i1 %179, %178
  %181 = xor i1 %23, %179
  %182 = select i1 %181, float 0.000000e+00, float 0x7FF0000000000000
  %183 = select i1 %180, float %182, float %177
  %184 = fcmp uno float %34, %1
  %185 = select i1 %184, float 0x7FF8000000000000, float %183
  %186 = fcmp oeq float %34, 1.000000e+00
  %187 = or i1 %24, %186
  %188 = select i1 %187, float 1.000000e+00, float %185
  %189 = fadd contract float %30, %188
  %190 = add nuw nsw i64 %31, %14
  %191 = icmp slt i64 %190, %2
  br i1 %191, label %29, label %25, !llvm.loop !11

192:                                              ; preds = %19, %192
  %193 = phi float [ %216, %192 ], [ 0.000000e+00, %19 ]
  %194 = phi i64 [ %217, %192 ], [ %6, %19 ]
  %195 = getelementptr inbounds float, float addrspace(1)* %16, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !6
  %197 = tail call float @llvm.fabs.f32(float %196)
  %198 = fcmp oeq float %197, 1.000000e+00
  %199 = fadd float %197, -1.000000e+00
  %200 = bitcast float %199 to i32
  %201 = xor i32 %200, %22
  %202 = icmp sgt i32 %201, -1
  %203 = select i1 %202, float 0x7FF0000000000000, float 0.000000e+00
  %204 = select i1 %198, float %197, float %203
  %205 = fcmp oeq float %197, 0x7FF0000000000000
  %206 = fcmp oeq float %196, 0.000000e+00
  %207 = or i1 %206, %205
  %208 = xor i1 %23, %206
  %209 = select i1 %208, float 0.000000e+00, float 0x7FF0000000000000
  %210 = select i1 %207, float %209, float %204
  %211 = fcmp uno float %197, %1
  %212 = select i1 %211, float 0x7FF8000000000000, float %210
  %213 = fcmp oeq float %197, 1.000000e+00
  %214 = or i1 %24, %213
  %215 = select i1 %214, float 1.000000e+00, float %212
  %216 = fadd contract float %193, %215
  %217 = add nuw nsw i64 %194, %14
  %218 = icmp slt i64 %217, %2
  br i1 %218, label %192, label %25, !llvm.loop !11

219:                                              ; preds = %424, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %220 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ26THCudaTensor_kernel_renormPfflfE6buffer, i32 0, i32 0), align 16, !tbaa !7
  %221 = fdiv contract float 1.000000e+00, %1
  %222 = tail call float @llvm.fabs.f32(float %220)
  %223 = tail call float @llvm.amdgcn.frexp.mant.f32(float %222)
  %224 = fcmp olt float %223, 0x3FE5555560000000
  %225 = zext i1 %224 to i32
  %226 = tail call float @llvm.amdgcn.ldexp.f32(float %223, i32 %225)
  %227 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %222)
  %228 = sub nsw i32 %227, %225
  %229 = fadd float %226, -1.000000e+00
  %230 = fadd float %226, 1.000000e+00
  %231 = fadd float %230, -1.000000e+00
  %232 = fsub float %226, %231
  %233 = tail call float @llvm.amdgcn.rcp.f32(float %230)
  %234 = fmul float %229, %233
  %235 = fmul float %230, %234
  %236 = fneg float %235
  %237 = tail call float @llvm.fma.f32(float %234, float %230, float %236)
  %238 = tail call float @llvm.fma.f32(float %234, float %232, float %237)
  %239 = fadd float %235, %238
  %240 = fsub float %239, %235
  %241 = fsub float %238, %240
  %242 = fsub float %229, %239
  %243 = fsub float %229, %242
  %244 = fsub float %243, %239
  %245 = fsub float %244, %241
  %246 = fadd float %242, %245
  %247 = fmul float %233, %246
  %248 = fadd float %234, %247
  %249 = fsub float %248, %234
  %250 = fsub float %247, %249
  %251 = fmul float %248, %248
  %252 = fneg float %251
  %253 = tail call float @llvm.fma.f32(float %248, float %248, float %252)
  %254 = fmul float %250, 2.000000e+00
  %255 = tail call float @llvm.fma.f32(float %248, float %254, float %253)
  %256 = fadd float %251, %255
  %257 = fsub float %256, %251
  %258 = fsub float %255, %257
  %259 = tail call float @llvm.fmuladd.f32(float %256, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %260 = tail call float @llvm.fmuladd.f32(float %256, float %259, float 0x3FD999BDE0000000)
  %261 = sitofp i32 %228 to float
  %262 = fmul float %261, 0x3FE62E4300000000
  %263 = fneg float %262
  %264 = tail call float @llvm.fma.f32(float %261, float 0x3FE62E4300000000, float %263)
  %265 = tail call float @llvm.fma.f32(float %261, float 0xBE205C6100000000, float %264)
  %266 = fadd float %262, %265
  %267 = fsub float %266, %262
  %268 = fsub float %265, %267
  %269 = tail call float @llvm.amdgcn.ldexp.f32(float %248, i32 1)
  %270 = fmul float %248, %256
  %271 = fneg float %270
  %272 = tail call float @llvm.fma.f32(float %256, float %248, float %271)
  %273 = tail call float @llvm.fma.f32(float %256, float %250, float %272)
  %274 = tail call float @llvm.fma.f32(float %258, float %248, float %273)
  %275 = fadd float %270, %274
  %276 = fsub float %275, %270
  %277 = fsub float %274, %276
  %278 = fmul float %256, %260
  %279 = fneg float %278
  %280 = tail call float @llvm.fma.f32(float %256, float %260, float %279)
  %281 = tail call float @llvm.fma.f32(float %258, float %260, float %280)
  %282 = fadd float %278, %281
  %283 = fsub float %282, %278
  %284 = fsub float %281, %283
  %285 = fadd float %282, 0x3FE5555540000000
  %286 = fadd float %285, 0xBFE5555540000000
  %287 = fsub float %282, %286
  %288 = fadd float %284, 0x3E2E720200000000
  %289 = fadd float %288, %287
  %290 = fadd float %285, %289
  %291 = fsub float %290, %285
  %292 = fsub float %289, %291
  %293 = fmul float %275, %290
  %294 = fneg float %293
  %295 = tail call float @llvm.fma.f32(float %275, float %290, float %294)
  %296 = tail call float @llvm.fma.f32(float %275, float %292, float %295)
  %297 = tail call float @llvm.fma.f32(float %277, float %290, float %296)
  %298 = tail call float @llvm.amdgcn.ldexp.f32(float %250, i32 1)
  %299 = fadd float %293, %297
  %300 = fsub float %299, %293
  %301 = fsub float %297, %300
  %302 = fadd float %269, %299
  %303 = fsub float %302, %269
  %304 = fsub float %299, %303
  %305 = fadd float %298, %301
  %306 = fadd float %305, %304
  %307 = fadd float %302, %306
  %308 = fsub float %307, %302
  %309 = fsub float %306, %308
  %310 = fadd float %266, %307
  %311 = fsub float %310, %266
  %312 = fsub float %310, %311
  %313 = fsub float %266, %312
  %314 = fsub float %307, %311
  %315 = fadd float %314, %313
  %316 = fadd float %268, %309
  %317 = fsub float %316, %268
  %318 = fsub float %316, %317
  %319 = fsub float %268, %318
  %320 = fsub float %309, %317
  %321 = fadd float %320, %319
  %322 = fadd float %316, %315
  %323 = fadd float %310, %322
  %324 = fsub float %323, %310
  %325 = fsub float %322, %324
  %326 = fadd float %321, %325
  %327 = fadd float %323, %326
  %328 = fsub float %327, %323
  %329 = fsub float %326, %328
  %330 = fmul float %221, %327
  %331 = fneg float %330
  %332 = tail call float @llvm.fma.f32(float %221, float %327, float %331)
  %333 = tail call float @llvm.fma.f32(float %221, float %329, float %332)
  %334 = fadd float %330, %333
  %335 = fsub float %334, %330
  %336 = fsub float %333, %335
  %337 = tail call float @llvm.fabs.f32(float %330) #4
  %338 = fcmp oeq float %337, 0x7FF0000000000000
  %339 = select i1 %338, float %330, float %334
  %340 = tail call float @llvm.fabs.f32(float %339) #4
  %341 = fcmp oeq float %340, 0x7FF0000000000000
  %342 = select i1 %341, float 0.000000e+00, float %336
  %343 = fcmp oeq float %339, 0x40562E4300000000
  %344 = select i1 %343, float 0x3EE0000000000000, float 0.000000e+00
  %345 = fsub float %339, %344
  %346 = fadd float %344, %342
  %347 = fmul float %345, 0x3FF7154760000000
  %348 = tail call float @llvm.rint.f32(float %347)
  %349 = fcmp ogt float %345, 0x40562E4300000000
  %350 = fcmp olt float %345, 0xC059D1DA00000000
  %351 = fneg float %347
  %352 = tail call float @llvm.fma.f32(float %345, float 0x3FF7154760000000, float %351)
  %353 = tail call float @llvm.fma.f32(float %345, float 0x3E54AE0BE0000000, float %352)
  %354 = fsub float %347, %348
  %355 = fadd float %353, %354
  %356 = tail call float @llvm.exp2.f32(float %355)
  %357 = fptosi float %348 to i32
  %358 = tail call float @llvm.amdgcn.ldexp.f32(float %356, i32 %357)
  %359 = select i1 %350, float 0.000000e+00, float %358
  %360 = select i1 %349, float 0x7FF0000000000000, float %359
  %361 = tail call float @llvm.fma.f32(float %360, float %346, float %360)
  %362 = tail call float @llvm.fabs.f32(float %360) #4
  %363 = fcmp oeq float %362, 0x7FF0000000000000
  %364 = select i1 %363, float %360, float %361
  %365 = tail call float @llvm.fabs.f32(float %221)
  %366 = tail call float @llvm.trunc.f32(float %365)
  %367 = fcmp oeq float %365, %366
  %368 = zext i1 %367 to i32
  %369 = fmul float %366, 5.000000e-01
  %370 = tail call float @llvm.amdgcn.fract.f32(float %369)
  %371 = tail call i1 @llvm.amdgcn.class.f32(float %369, i32 516)
  %372 = select i1 %371, float 0.000000e+00, float %370
  %373 = fcmp oeq float %372, 0.000000e+00
  %374 = and i1 %367, %373
  %375 = zext i1 %374 to i32
  %376 = add nuw nsw i32 %375, %368
  %377 = icmp eq i32 %376, 1
  %378 = fcmp olt float %220, 0.000000e+00
  %379 = and i1 %377, %378
  %380 = select i1 %379, float -0.000000e+00, float 0.000000e+00
  %381 = tail call float @llvm.copysign.f32(float %364, float %380)
  %382 = fcmp uge float %220, 0.000000e+00
  %383 = icmp ne i32 %376, 0
  %384 = select i1 %382, i1 true, i1 %383
  %385 = select i1 %384, float %381, float 0x7FF8000000000000
  %386 = fcmp oeq float %365, 0x7FF0000000000000
  br i1 %386, label %387, label %396

387:                                              ; preds = %219
  %388 = fcmp oeq float %222, 1.000000e+00
  %389 = fadd float %222, -1.000000e+00
  %390 = bitcast float %221 to i32
  %391 = bitcast float %389 to i32
  %392 = xor i32 %391, %390
  %393 = icmp sgt i32 %392, -1
  %394 = select i1 %393, float 0x7FF0000000000000, float 0.000000e+00
  %395 = select i1 %388, float %222, float %394
  br label %396

396:                                              ; preds = %219, %387
  %397 = phi float [ %385, %219 ], [ %395, %387 ]
  %398 = fcmp oeq float %222, 0x7FF0000000000000
  %399 = fcmp oeq float %220, 0.000000e+00
  %400 = or i1 %399, %398
  %401 = fcmp olt float %221, 0.000000e+00
  %402 = xor i1 %401, %399
  %403 = select i1 %402, float 0.000000e+00, float 0x7FF0000000000000
  %404 = select i1 %377, float %220, float 0.000000e+00
  %405 = tail call float @llvm.copysign.f32(float %403, float %404)
  %406 = select i1 %400, float %405, float %397
  %407 = fcmp uno float %220, %221
  %408 = select i1 %407, float 0x7FF8000000000000, float %406
  %409 = fcmp oeq float %220, 1.000000e+00
  %410 = fcmp oeq float %221, 0.000000e+00
  %411 = or i1 %410, %409
  %412 = select i1 %411, float 1.000000e+00, float %408
  %413 = fcmp contract ogt float %412, %3
  br i1 %413, label %426, label %439

414:                                              ; preds = %27, %424
  %415 = phi i32 [ %416, %424 ], [ %13, %27 ]
  %416 = lshr i32 %415, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %417 = icmp ult i32 %5, %416
  br i1 %417, label %418, label %424

418:                                              ; preds = %414
  %419 = add nuw nsw i32 %416, %5
  %420 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ26THCudaTensor_kernel_renormPfflfE6buffer, i32 0, i32 %419
  %421 = load float, float addrspace(3)* %420, align 4, !tbaa !7
  %422 = load float, float addrspace(3)* %17, align 4, !tbaa !7
  %423 = fadd contract float %421, %422
  store float %423, float addrspace(3)* %17, align 4, !tbaa !7
  br label %424

424:                                              ; preds = %414, %418
  %425 = icmp ult i32 %415, 4
  br i1 %425, label %219, label %414, !llvm.loop !13

426:                                              ; preds = %396
  %427 = fpext float %3 to double
  %428 = fpext float %412 to double
  %429 = fadd contract double %428, 0x3E7AD7F29ABCAF48
  %430 = fdiv contract double %427, %429
  %431 = fptrunc double %430 to float
  br i1 %18, label %432, label %439

432:                                              ; preds = %426, %432
  %433 = phi i64 [ %437, %432 ], [ %6, %426 ]
  %434 = getelementptr inbounds float, float addrspace(1)* %16, i64 %433
  %435 = load float, float addrspace(1)* %434, align 4, !tbaa !7
  %436 = fmul contract float %435, %431
  store float %436, float addrspace(1)* %434, align 4, !tbaa !7
  %437 = add nuw nsw i64 %433, %14
  %438 = icmp slt i64 %437, %2
  br i1 %438, label %432, label %439, !llvm.loop !14

439:                                              ; preds = %432, %426, %396
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
