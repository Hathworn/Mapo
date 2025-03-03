; ModuleID = '../data/hip_kernels/161/10/main.cu'
source_filename = "../data/hip_kernels/161/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16minkowski_kernelPKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16minkowski_kernelPKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %2
  %16 = icmp ult i64 %14, %5
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %461

18:                                               ; preds = %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16minkowski_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = zext i32 %19 to i64
  %22 = icmp ult i64 %21, %6
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %40

25:                                               ; preds = %18
  %26 = mul i64 %12, %1
  %27 = mul i64 %14, %4
  %28 = tail call float @llvm.fabs.f32(float %9)
  %29 = fcmp oeq float %28, 0x7FF0000000000000
  %30 = bitcast float %9 to i32
  %31 = fcmp olt float %9, 0.000000e+00
  %32 = fcmp oeq float %9, 0.000000e+00
  %33 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %34 = getelementptr i8, i8 addrspace(4)* %33, i64 4
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 4, !range !9, !invariant.load !10
  %37 = zext i16 %36 to i64
  br i1 %29, label %217, label %49

38:                                               ; preds = %49, %217
  %39 = phi float [ %246, %217 ], [ %214, %49 ]
  store float %39, float addrspace(3)* %20, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %23, %38
  %41 = phi i8 addrspace(4)* [ %24, %23 ], [ %33, %38 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = getelementptr i8, i8 addrspace(4)* %41, i64 4
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !9, !invariant.load !10
  %45 = icmp ult i16 %44, 2
  br i1 %45, label %249, label %46

46:                                               ; preds = %40
  %47 = lshr i16 %44, 1
  %48 = zext i16 %47 to i64
  br label %251

49:                                               ; preds = %25, %49
  %50 = phi float [ %214, %49 ], [ 0.000000e+00, %25 ]
  %51 = phi i64 [ %215, %49 ], [ %21, %25 ]
  %52 = add i64 %51, %26
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !10
  %55 = add i64 %51, %27
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !10
  %58 = fsub contract float %54, %57
  %59 = tail call float @llvm.fabs.f32(float %58)
  %60 = tail call float @llvm.amdgcn.frexp.mant.f32(float %59)
  %61 = fcmp olt float %60, 0x3FE5555560000000
  %62 = zext i1 %61 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 %62)
  %64 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %59)
  %65 = sub nsw i32 %64, %62
  %66 = fadd float %63, -1.000000e+00
  %67 = fadd float %63, 1.000000e+00
  %68 = fadd float %67, -1.000000e+00
  %69 = fsub float %63, %68
  %70 = tail call float @llvm.amdgcn.rcp.f32(float %67)
  %71 = fmul float %66, %70
  %72 = fmul float %67, %71
  %73 = fneg float %72
  %74 = tail call float @llvm.fma.f32(float %71, float %67, float %73)
  %75 = tail call float @llvm.fma.f32(float %71, float %69, float %74)
  %76 = fadd float %72, %75
  %77 = fsub float %76, %72
  %78 = fsub float %75, %77
  %79 = fsub float %66, %76
  %80 = fsub float %66, %79
  %81 = fsub float %80, %76
  %82 = fsub float %81, %78
  %83 = fadd float %79, %82
  %84 = fmul float %70, %83
  %85 = fadd float %71, %84
  %86 = fsub float %85, %71
  %87 = fsub float %84, %86
  %88 = fmul float %85, %85
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %85, float %85, float %89)
  %91 = fmul float %87, 2.000000e+00
  %92 = tail call float @llvm.fma.f32(float %85, float %91, float %90)
  %93 = fadd float %88, %92
  %94 = fsub float %93, %88
  %95 = fsub float %92, %94
  %96 = tail call float @llvm.fmuladd.f32(float %93, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %97 = tail call float @llvm.fmuladd.f32(float %93, float %96, float 0x3FD999BDE0000000)
  %98 = sitofp i32 %65 to float
  %99 = fmul float %98, 0x3FE62E4300000000
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %98, float 0x3FE62E4300000000, float %100)
  %102 = tail call float @llvm.fma.f32(float %98, float 0xBE205C6100000000, float %101)
  %103 = fadd float %99, %102
  %104 = fsub float %103, %99
  %105 = fsub float %102, %104
  %106 = tail call float @llvm.amdgcn.ldexp.f32(float %85, i32 1)
  %107 = fmul float %85, %93
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %93, float %85, float %108)
  %110 = tail call float @llvm.fma.f32(float %93, float %87, float %109)
  %111 = tail call float @llvm.fma.f32(float %95, float %85, float %110)
  %112 = fadd float %107, %111
  %113 = fsub float %112, %107
  %114 = fsub float %111, %113
  %115 = fmul float %93, %97
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %93, float %97, float %116)
  %118 = tail call float @llvm.fma.f32(float %95, float %97, float %117)
  %119 = fadd float %115, %118
  %120 = fsub float %119, %115
  %121 = fsub float %118, %120
  %122 = fadd float %119, 0x3FE5555540000000
  %123 = fadd float %122, 0xBFE5555540000000
  %124 = fsub float %119, %123
  %125 = fadd float %121, 0x3E2E720200000000
  %126 = fadd float %125, %124
  %127 = fadd float %122, %126
  %128 = fsub float %127, %122
  %129 = fsub float %126, %128
  %130 = fmul float %112, %127
  %131 = fneg float %130
  %132 = tail call float @llvm.fma.f32(float %112, float %127, float %131)
  %133 = tail call float @llvm.fma.f32(float %112, float %129, float %132)
  %134 = tail call float @llvm.fma.f32(float %114, float %127, float %133)
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %87, i32 1)
  %136 = fadd float %130, %134
  %137 = fsub float %136, %130
  %138 = fsub float %134, %137
  %139 = fadd float %106, %136
  %140 = fsub float %139, %106
  %141 = fsub float %136, %140
  %142 = fadd float %135, %138
  %143 = fadd float %142, %141
  %144 = fadd float %139, %143
  %145 = fsub float %144, %139
  %146 = fsub float %143, %145
  %147 = fadd float %103, %144
  %148 = fsub float %147, %103
  %149 = fsub float %147, %148
  %150 = fsub float %103, %149
  %151 = fsub float %144, %148
  %152 = fadd float %151, %150
  %153 = fadd float %105, %146
  %154 = fsub float %153, %105
  %155 = fsub float %153, %154
  %156 = fsub float %105, %155
  %157 = fsub float %146, %154
  %158 = fadd float %157, %156
  %159 = fadd float %153, %152
  %160 = fadd float %147, %159
  %161 = fsub float %160, %147
  %162 = fsub float %159, %161
  %163 = fadd float %158, %162
  %164 = fadd float %160, %163
  %165 = fsub float %164, %160
  %166 = fsub float %163, %165
  %167 = fmul float %164, %9
  %168 = fneg float %167
  %169 = tail call float @llvm.fma.f32(float %9, float %164, float %168)
  %170 = tail call float @llvm.fma.f32(float %9, float %166, float %169)
  %171 = fadd float %167, %170
  %172 = fsub float %171, %167
  %173 = fsub float %170, %172
  %174 = tail call float @llvm.fabs.f32(float %167) #4
  %175 = fcmp oeq float %174, 0x7FF0000000000000
  %176 = select i1 %175, float %167, float %171
  %177 = tail call float @llvm.fabs.f32(float %176) #4
  %178 = fcmp oeq float %177, 0x7FF0000000000000
  %179 = select i1 %178, float 0.000000e+00, float %173
  %180 = fcmp oeq float %176, 0x40562E4300000000
  %181 = select i1 %180, float 0x3EE0000000000000, float 0.000000e+00
  %182 = fsub float %176, %181
  %183 = fadd float %181, %179
  %184 = fmul float %182, 0x3FF7154760000000
  %185 = tail call float @llvm.rint.f32(float %184)
  %186 = fcmp ogt float %182, 0x40562E4300000000
  %187 = fcmp olt float %182, 0xC059D1DA00000000
  %188 = fneg float %184
  %189 = tail call float @llvm.fma.f32(float %182, float 0x3FF7154760000000, float %188)
  %190 = tail call float @llvm.fma.f32(float %182, float 0x3E54AE0BE0000000, float %189)
  %191 = fsub float %184, %185
  %192 = fadd float %190, %191
  %193 = tail call float @llvm.exp2.f32(float %192)
  %194 = fptosi float %185 to i32
  %195 = tail call float @llvm.amdgcn.ldexp.f32(float %193, i32 %194)
  %196 = select i1 %187, float 0.000000e+00, float %195
  %197 = select i1 %186, float 0x7FF0000000000000, float %196
  %198 = tail call float @llvm.fma.f32(float %197, float %183, float %197)
  %199 = tail call float @llvm.fabs.f32(float %197) #4
  %200 = fcmp oeq float %199, 0x7FF0000000000000
  %201 = select i1 %200, float %197, float %198
  %202 = tail call float @llvm.fabs.f32(float %201)
  %203 = fcmp oeq float %59, 0x7FF0000000000000
  %204 = fcmp oeq float %58, 0.000000e+00
  %205 = or i1 %204, %203
  %206 = xor i1 %31, %204
  %207 = select i1 %206, float 0.000000e+00, float 0x7FF0000000000000
  %208 = select i1 %205, float %207, float %202
  %209 = fcmp uno float %59, %9
  %210 = select i1 %209, float 0x7FF8000000000000, float %208
  %211 = fcmp oeq float %59, 1.000000e+00
  %212 = or i1 %32, %211
  %213 = select i1 %212, float 1.000000e+00, float %210
  %214 = fadd contract float %50, %213
  %215 = add i64 %51, %37
  %216 = icmp ult i64 %215, %6
  br i1 %216, label %49, label %38, !llvm.loop !11

217:                                              ; preds = %25, %217
  %218 = phi float [ %246, %217 ], [ 0.000000e+00, %25 ]
  %219 = phi i64 [ %247, %217 ], [ %21, %25 ]
  %220 = add i64 %219, %26
  %221 = getelementptr inbounds float, float addrspace(1)* %0, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !5, !amdgpu.noclobber !10
  %223 = add i64 %219, %27
  %224 = getelementptr inbounds float, float addrspace(1)* %3, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !5, !amdgpu.noclobber !10
  %226 = fsub contract float %222, %225
  %227 = tail call float @llvm.fabs.f32(float %226)
  %228 = fcmp oeq float %227, 1.000000e+00
  %229 = fadd float %227, -1.000000e+00
  %230 = bitcast float %229 to i32
  %231 = xor i32 %230, %30
  %232 = icmp sgt i32 %231, -1
  %233 = select i1 %232, float 0x7FF0000000000000, float 0.000000e+00
  %234 = select i1 %228, float %227, float %233
  %235 = fcmp oeq float %227, 0x7FF0000000000000
  %236 = fcmp oeq float %226, 0.000000e+00
  %237 = or i1 %236, %235
  %238 = xor i1 %31, %236
  %239 = select i1 %238, float 0.000000e+00, float 0x7FF0000000000000
  %240 = select i1 %237, float %239, float %234
  %241 = fcmp uno float %227, %9
  %242 = select i1 %241, float 0x7FF8000000000000, float %240
  %243 = fcmp oeq float %227, 1.000000e+00
  %244 = or i1 %32, %243
  %245 = select i1 %244, float 1.000000e+00, float %242
  %246 = fadd contract float %218, %245
  %247 = add i64 %219, %37
  %248 = icmp ult i64 %247, %6
  br i1 %248, label %217, label %38, !llvm.loop !11

249:                                              ; preds = %261, %40
  %250 = icmp eq i32 %19, 0
  br i1 %250, label %264, label %461

251:                                              ; preds = %46, %261
  %252 = phi i64 [ %262, %261 ], [ %48, %46 ]
  %253 = icmp ugt i64 %252, %21
  br i1 %253, label %254, label %261

254:                                              ; preds = %251
  %255 = trunc i64 %252 to i32
  %256 = add nuw nsw i32 %19, %255
  %257 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16minkowski_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %256
  %258 = load float, float addrspace(3)* %257, align 4, !tbaa !5
  %259 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %260 = fadd contract float %258, %259
  store float %260, float addrspace(3)* %20, align 4, !tbaa !5
  br label %261

261:                                              ; preds = %254, %251
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %262 = lshr i64 %252, 1
  %263 = icmp ult i64 %252, 2
  br i1 %263, label %249, label %251, !llvm.loop !13

264:                                              ; preds = %249
  %265 = fdiv contract float 1.000000e+00, %9
  %266 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16minkowski_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !5
  %267 = tail call float @llvm.fabs.f32(float %266)
  %268 = tail call float @llvm.amdgcn.frexp.mant.f32(float %267)
  %269 = fcmp olt float %268, 0x3FE5555560000000
  %270 = zext i1 %269 to i32
  %271 = tail call float @llvm.amdgcn.ldexp.f32(float %268, i32 %270)
  %272 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %267)
  %273 = sub nsw i32 %272, %270
  %274 = fadd float %271, -1.000000e+00
  %275 = fadd float %271, 1.000000e+00
  %276 = fadd float %275, -1.000000e+00
  %277 = fsub float %271, %276
  %278 = tail call float @llvm.amdgcn.rcp.f32(float %275)
  %279 = fmul float %274, %278
  %280 = fmul float %275, %279
  %281 = fneg float %280
  %282 = tail call float @llvm.fma.f32(float %279, float %275, float %281)
  %283 = tail call float @llvm.fma.f32(float %279, float %277, float %282)
  %284 = fadd float %280, %283
  %285 = fsub float %284, %280
  %286 = fsub float %283, %285
  %287 = fsub float %274, %284
  %288 = fsub float %274, %287
  %289 = fsub float %288, %284
  %290 = fsub float %289, %286
  %291 = fadd float %287, %290
  %292 = fmul float %278, %291
  %293 = fadd float %279, %292
  %294 = fsub float %293, %279
  %295 = fsub float %292, %294
  %296 = fmul float %293, %293
  %297 = fneg float %296
  %298 = tail call float @llvm.fma.f32(float %293, float %293, float %297)
  %299 = fmul float %295, 2.000000e+00
  %300 = tail call float @llvm.fma.f32(float %293, float %299, float %298)
  %301 = fadd float %296, %300
  %302 = fsub float %301, %296
  %303 = fsub float %300, %302
  %304 = tail call float @llvm.fmuladd.f32(float %301, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %305 = tail call float @llvm.fmuladd.f32(float %301, float %304, float 0x3FD999BDE0000000)
  %306 = sitofp i32 %273 to float
  %307 = fmul float %306, 0x3FE62E4300000000
  %308 = fneg float %307
  %309 = tail call float @llvm.fma.f32(float %306, float 0x3FE62E4300000000, float %308)
  %310 = tail call float @llvm.fma.f32(float %306, float 0xBE205C6100000000, float %309)
  %311 = fadd float %307, %310
  %312 = fsub float %311, %307
  %313 = fsub float %310, %312
  %314 = tail call float @llvm.amdgcn.ldexp.f32(float %293, i32 1)
  %315 = fmul float %293, %301
  %316 = fneg float %315
  %317 = tail call float @llvm.fma.f32(float %301, float %293, float %316)
  %318 = tail call float @llvm.fma.f32(float %301, float %295, float %317)
  %319 = tail call float @llvm.fma.f32(float %303, float %293, float %318)
  %320 = fadd float %315, %319
  %321 = fsub float %320, %315
  %322 = fsub float %319, %321
  %323 = fmul float %301, %305
  %324 = fneg float %323
  %325 = tail call float @llvm.fma.f32(float %301, float %305, float %324)
  %326 = tail call float @llvm.fma.f32(float %303, float %305, float %325)
  %327 = fadd float %323, %326
  %328 = fsub float %327, %323
  %329 = fsub float %326, %328
  %330 = fadd float %327, 0x3FE5555540000000
  %331 = fadd float %330, 0xBFE5555540000000
  %332 = fsub float %327, %331
  %333 = fadd float %329, 0x3E2E720200000000
  %334 = fadd float %333, %332
  %335 = fadd float %330, %334
  %336 = fsub float %335, %330
  %337 = fsub float %334, %336
  %338 = fmul float %320, %335
  %339 = fneg float %338
  %340 = tail call float @llvm.fma.f32(float %320, float %335, float %339)
  %341 = tail call float @llvm.fma.f32(float %320, float %337, float %340)
  %342 = tail call float @llvm.fma.f32(float %322, float %335, float %341)
  %343 = tail call float @llvm.amdgcn.ldexp.f32(float %295, i32 1)
  %344 = fadd float %338, %342
  %345 = fsub float %344, %338
  %346 = fsub float %342, %345
  %347 = fadd float %314, %344
  %348 = fsub float %347, %314
  %349 = fsub float %344, %348
  %350 = fadd float %343, %346
  %351 = fadd float %350, %349
  %352 = fadd float %347, %351
  %353 = fsub float %352, %347
  %354 = fsub float %351, %353
  %355 = fadd float %311, %352
  %356 = fsub float %355, %311
  %357 = fsub float %355, %356
  %358 = fsub float %311, %357
  %359 = fsub float %352, %356
  %360 = fadd float %359, %358
  %361 = fadd float %313, %354
  %362 = fsub float %361, %313
  %363 = fsub float %361, %362
  %364 = fsub float %313, %363
  %365 = fsub float %354, %362
  %366 = fadd float %365, %364
  %367 = fadd float %361, %360
  %368 = fadd float %355, %367
  %369 = fsub float %368, %355
  %370 = fsub float %367, %369
  %371 = fadd float %366, %370
  %372 = fadd float %368, %371
  %373 = fsub float %372, %368
  %374 = fsub float %371, %373
  %375 = fmul float %265, %372
  %376 = fneg float %375
  %377 = tail call float @llvm.fma.f32(float %265, float %372, float %376)
  %378 = tail call float @llvm.fma.f32(float %265, float %374, float %377)
  %379 = fadd float %375, %378
  %380 = fsub float %379, %375
  %381 = fsub float %378, %380
  %382 = tail call float @llvm.fabs.f32(float %375) #4
  %383 = fcmp oeq float %382, 0x7FF0000000000000
  %384 = select i1 %383, float %375, float %379
  %385 = tail call float @llvm.fabs.f32(float %384) #4
  %386 = fcmp oeq float %385, 0x7FF0000000000000
  %387 = select i1 %386, float 0.000000e+00, float %381
  %388 = fcmp oeq float %384, 0x40562E4300000000
  %389 = select i1 %388, float 0x3EE0000000000000, float 0.000000e+00
  %390 = fsub float %384, %389
  %391 = fadd float %389, %387
  %392 = fmul float %390, 0x3FF7154760000000
  %393 = tail call float @llvm.rint.f32(float %392)
  %394 = fcmp ogt float %390, 0x40562E4300000000
  %395 = fcmp olt float %390, 0xC059D1DA00000000
  %396 = fneg float %392
  %397 = tail call float @llvm.fma.f32(float %390, float 0x3FF7154760000000, float %396)
  %398 = tail call float @llvm.fma.f32(float %390, float 0x3E54AE0BE0000000, float %397)
  %399 = fsub float %392, %393
  %400 = fadd float %398, %399
  %401 = tail call float @llvm.exp2.f32(float %400)
  %402 = fptosi float %393 to i32
  %403 = tail call float @llvm.amdgcn.ldexp.f32(float %401, i32 %402)
  %404 = select i1 %395, float 0.000000e+00, float %403
  %405 = select i1 %394, float 0x7FF0000000000000, float %404
  %406 = tail call float @llvm.fma.f32(float %405, float %391, float %405)
  %407 = tail call float @llvm.fabs.f32(float %405) #4
  %408 = fcmp oeq float %407, 0x7FF0000000000000
  %409 = select i1 %408, float %405, float %406
  %410 = tail call float @llvm.fabs.f32(float %265)
  %411 = tail call float @llvm.trunc.f32(float %410)
  %412 = fcmp oeq float %410, %411
  %413 = zext i1 %412 to i32
  %414 = fmul float %411, 5.000000e-01
  %415 = tail call float @llvm.amdgcn.fract.f32(float %414)
  %416 = tail call i1 @llvm.amdgcn.class.f32(float %414, i32 516)
  %417 = select i1 %416, float 0.000000e+00, float %415
  %418 = fcmp oeq float %417, 0.000000e+00
  %419 = and i1 %412, %418
  %420 = zext i1 %419 to i32
  %421 = add nuw nsw i32 %420, %413
  %422 = icmp eq i32 %421, 1
  %423 = fcmp olt float %266, 0.000000e+00
  %424 = and i1 %422, %423
  %425 = select i1 %424, float -0.000000e+00, float 0.000000e+00
  %426 = tail call float @llvm.copysign.f32(float %409, float %425)
  %427 = fcmp uge float %266, 0.000000e+00
  %428 = icmp ne i32 %421, 0
  %429 = select i1 %427, i1 true, i1 %428
  %430 = select i1 %429, float %426, float 0x7FF8000000000000
  %431 = fcmp oeq float %410, 0x7FF0000000000000
  br i1 %431, label %432, label %441

432:                                              ; preds = %264
  %433 = fcmp oeq float %267, 1.000000e+00
  %434 = fadd float %267, -1.000000e+00
  %435 = bitcast float %265 to i32
  %436 = bitcast float %434 to i32
  %437 = xor i32 %436, %435
  %438 = icmp sgt i32 %437, -1
  %439 = select i1 %438, float 0x7FF0000000000000, float 0.000000e+00
  %440 = select i1 %433, float %267, float %439
  br label %441

441:                                              ; preds = %264, %432
  %442 = phi float [ %430, %264 ], [ %440, %432 ]
  %443 = fcmp oeq float %267, 0x7FF0000000000000
  %444 = fcmp oeq float %266, 0.000000e+00
  %445 = or i1 %444, %443
  %446 = fcmp olt float %265, 0.000000e+00
  %447 = xor i1 %446, %444
  %448 = select i1 %447, float 0.000000e+00, float 0x7FF0000000000000
  %449 = select i1 %422, float %266, float 0.000000e+00
  %450 = tail call float @llvm.copysign.f32(float %448, float %449)
  %451 = select i1 %445, float %450, float %442
  %452 = fcmp uno float %266, %265
  %453 = select i1 %452, float 0x7FF8000000000000, float %451
  %454 = fcmp oeq float %266, 1.000000e+00
  %455 = fcmp oeq float %265, 0.000000e+00
  %456 = or i1 %455, %454
  %457 = select i1 %456, float 1.000000e+00, float %453
  %458 = mul i64 %14, %8
  %459 = add i64 %458, %12
  %460 = getelementptr inbounds float, float addrspace(1)* %7, i64 %459
  store float %457, float addrspace(1)* %460, align 4, !tbaa !5
  br label %461

461:                                              ; preds = %249, %441, %10
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
