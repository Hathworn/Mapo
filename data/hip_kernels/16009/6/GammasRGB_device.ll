; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/6/GammasRGB.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/6/GammasRGB.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9GammasRGBP15HIP_vector_typeIfLj3EEiii(%struct.HIP_vector_type addrspace(1)* noalias nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %1
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %524

25:                                               ; preds = %4
  %26 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %27 = mul nsw i32 %21, %3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 %28
  %30 = bitcast i8 addrspace(1)* %29 to %struct.HIP_vector_type addrspace(1)*
  %31 = sext i32 %13 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %30, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 0
  %33 = load float, float addrspace(1)* %32, align 4, !amdgpu.noclobber !5
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %30, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 1
  %35 = load float, float addrspace(1)* %34, align 4, !amdgpu.noclobber !5
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %30, i64 %31, i32 0, i32 0, i32 0, i32 0, i64 2
  %37 = load float, float addrspace(1)* %36, align 4, !amdgpu.noclobber !5
  %38 = fcmp ord float %33, 0.000000e+00
  %39 = select i1 %38, float %33, float 0.000000e+00
  %40 = fcmp ord float %35, 0.000000e+00
  %41 = select i1 %40, float %35, float 0.000000e+00
  %42 = fcmp ord float %37, 0.000000e+00
  %43 = select i1 %42, float %37, float 0.000000e+00
  %44 = tail call float @llvm.minnum.f32(float %39, float 1.000000e+00)
  %45 = tail call float @llvm.maxnum.f32(float %44, float 0.000000e+00)
  %46 = tail call float @llvm.minnum.f32(float %41, float 1.000000e+00)
  %47 = tail call float @llvm.maxnum.f32(float %46, float 0.000000e+00)
  %48 = tail call float @llvm.minnum.f32(float %43, float 1.000000e+00)
  %49 = tail call float @llvm.maxnum.f32(float %48, float 0.000000e+00)
  %50 = fcmp contract ugt float %45, 0x3F69A5C380000000
  br i1 %50, label %53, label %51

51:                                               ; preds = %25
  %52 = fmul contract float %45, 0x4029D70A40000000
  br label %206

53:                                               ; preds = %25
  %54 = tail call float @llvm.fabs.f32(float %45)
  %55 = tail call float @llvm.amdgcn.frexp.mant.f32(float %54)
  %56 = fcmp olt float %55, 0x3FE5555560000000
  %57 = zext i1 %56 to i32
  %58 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 %57)
  %59 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %54)
  %60 = sub nsw i32 %59, %57
  %61 = fadd float %58, -1.000000e+00
  %62 = fadd float %58, 1.000000e+00
  %63 = fadd float %62, -1.000000e+00
  %64 = fsub float %58, %63
  %65 = tail call float @llvm.amdgcn.rcp.f32(float %62)
  %66 = fmul float %61, %65
  %67 = fmul float %62, %66
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %66, float %62, float %68)
  %70 = tail call float @llvm.fma.f32(float %66, float %64, float %69)
  %71 = fadd float %67, %70
  %72 = fsub float %71, %67
  %73 = fsub float %70, %72
  %74 = fsub float %61, %71
  %75 = fsub float %61, %74
  %76 = fsub float %75, %71
  %77 = fsub float %76, %73
  %78 = fadd float %74, %77
  %79 = fmul float %65, %78
  %80 = fadd float %66, %79
  %81 = fsub float %80, %66
  %82 = fsub float %79, %81
  %83 = fmul float %80, %80
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %80, float %80, float %84)
  %86 = fmul float %82, 2.000000e+00
  %87 = tail call float @llvm.fma.f32(float %80, float %86, float %85)
  %88 = fadd float %83, %87
  %89 = fsub float %88, %83
  %90 = fsub float %87, %89
  %91 = tail call float @llvm.fmuladd.f32(float %88, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %92 = tail call float @llvm.fmuladd.f32(float %88, float %91, float 0x3FD999BDE0000000)
  %93 = sitofp i32 %60 to float
  %94 = fmul float %93, 0x3FE62E4300000000
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %93, float 0x3FE62E4300000000, float %95)
  %97 = tail call float @llvm.fma.f32(float %93, float 0xBE205C6100000000, float %96)
  %98 = fadd float %94, %97
  %99 = fsub float %98, %94
  %100 = fsub float %97, %99
  %101 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 1)
  %102 = fmul float %80, %88
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %88, float %80, float %103)
  %105 = tail call float @llvm.fma.f32(float %88, float %82, float %104)
  %106 = tail call float @llvm.fma.f32(float %90, float %80, float %105)
  %107 = fadd float %102, %106
  %108 = fsub float %107, %102
  %109 = fsub float %106, %108
  %110 = fmul float %88, %92
  %111 = fneg float %110
  %112 = tail call float @llvm.fma.f32(float %88, float %92, float %111)
  %113 = tail call float @llvm.fma.f32(float %90, float %92, float %112)
  %114 = fadd float %110, %113
  %115 = fsub float %114, %110
  %116 = fsub float %113, %115
  %117 = fadd float %114, 0x3FE5555540000000
  %118 = fadd float %117, 0xBFE5555540000000
  %119 = fsub float %114, %118
  %120 = fadd float %116, 0x3E2E720200000000
  %121 = fadd float %120, %119
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = fmul float %107, %122
  %126 = fneg float %125
  %127 = tail call float @llvm.fma.f32(float %107, float %122, float %126)
  %128 = tail call float @llvm.fma.f32(float %107, float %124, float %127)
  %129 = tail call float @llvm.fma.f32(float %109, float %122, float %128)
  %130 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 1)
  %131 = fadd float %125, %129
  %132 = fsub float %131, %125
  %133 = fsub float %129, %132
  %134 = fadd float %101, %131
  %135 = fsub float %134, %101
  %136 = fsub float %131, %135
  %137 = fadd float %130, %133
  %138 = fadd float %137, %136
  %139 = fadd float %134, %138
  %140 = fsub float %139, %134
  %141 = fsub float %138, %140
  %142 = fadd float %98, %139
  %143 = fsub float %142, %98
  %144 = fsub float %142, %143
  %145 = fsub float %98, %144
  %146 = fsub float %139, %143
  %147 = fadd float %146, %145
  %148 = fadd float %100, %141
  %149 = fsub float %148, %100
  %150 = fsub float %148, %149
  %151 = fsub float %100, %150
  %152 = fsub float %141, %149
  %153 = fadd float %152, %151
  %154 = fadd float %148, %147
  %155 = fadd float %142, %154
  %156 = fsub float %155, %142
  %157 = fsub float %154, %156
  %158 = fadd float %153, %157
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = fmul float %159, 0x3FDAAAAAA0000000
  %163 = fneg float %162
  %164 = tail call float @llvm.fma.f32(float %159, float 0x3FDAAAAAA0000000, float %163)
  %165 = tail call float @llvm.fma.f32(float %161, float 0x3FDAAAAAA0000000, float %164)
  %166 = fadd float %162, %165
  %167 = fsub float %166, %162
  %168 = fsub float %165, %167
  %169 = tail call float @llvm.fabs.f32(float %162) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float %162, float %166
  %172 = tail call float @llvm.fabs.f32(float %171) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float 0.000000e+00, float %168
  %175 = fcmp oeq float %171, 0x40562E4300000000
  %176 = select i1 %175, float 0x3EE0000000000000, float 0.000000e+00
  %177 = fsub float %171, %176
  %178 = fadd float %176, %174
  %179 = fmul float %177, 0x3FF7154760000000
  %180 = tail call float @llvm.rint.f32(float %179)
  %181 = fcmp ogt float %177, 0x40562E4300000000
  %182 = fcmp olt float %177, 0xC059D1DA00000000
  %183 = fneg float %179
  %184 = tail call float @llvm.fma.f32(float %177, float 0x3FF7154760000000, float %183)
  %185 = tail call float @llvm.fma.f32(float %177, float 0x3E54AE0BE0000000, float %184)
  %186 = fsub float %179, %180
  %187 = fadd float %185, %186
  %188 = tail call float @llvm.exp2.f32(float %187)
  %189 = fptosi float %180 to i32
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %188, i32 %189)
  %191 = select i1 %182, float 0.000000e+00, float %190
  %192 = select i1 %181, float 0x7FF0000000000000, float %191
  %193 = tail call float @llvm.fma.f32(float %192, float %178, float %192)
  %194 = tail call float @llvm.fabs.f32(float %192) #3
  %195 = fcmp oeq float %194, 0x7FF0000000000000
  %196 = select i1 %195, float %192, float %193
  %197 = tail call float @llvm.fabs.f32(float %196)
  %198 = fcmp oeq float %54, 0x7FF0000000000000
  %199 = fcmp oeq float %45, 0.000000e+00
  %200 = fcmp oeq float %45, 1.000000e+00
  %201 = fmul contract float %197, 0x3FF0E147A0000000
  %202 = fadd contract float %201, 0xBFAC28F5C0000000
  %203 = select i1 %198, float 0x7FF0000000000000, float %202
  %204 = select i1 %199, float 0xBFAC28F5C0000000, float %203
  %205 = select i1 %200, float 0x3FEFFFFFE0000000, float %204
  br label %206

206:                                              ; preds = %51, %53
  %207 = phi float [ %52, %51 ], [ %205, %53 ]
  %208 = fcmp contract ugt float %47, 0x3F69A5C380000000
  br i1 %208, label %211, label %209

209:                                              ; preds = %206
  %210 = fmul contract float %47, 0x4029D70A40000000
  br label %364

211:                                              ; preds = %206
  %212 = tail call float @llvm.fabs.f32(float %47)
  %213 = tail call float @llvm.amdgcn.frexp.mant.f32(float %212)
  %214 = fcmp olt float %213, 0x3FE5555560000000
  %215 = zext i1 %214 to i32
  %216 = tail call float @llvm.amdgcn.ldexp.f32(float %213, i32 %215)
  %217 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %212)
  %218 = sub nsw i32 %217, %215
  %219 = fadd float %216, -1.000000e+00
  %220 = fadd float %216, 1.000000e+00
  %221 = fadd float %220, -1.000000e+00
  %222 = fsub float %216, %221
  %223 = tail call float @llvm.amdgcn.rcp.f32(float %220)
  %224 = fmul float %219, %223
  %225 = fmul float %220, %224
  %226 = fneg float %225
  %227 = tail call float @llvm.fma.f32(float %224, float %220, float %226)
  %228 = tail call float @llvm.fma.f32(float %224, float %222, float %227)
  %229 = fadd float %225, %228
  %230 = fsub float %229, %225
  %231 = fsub float %228, %230
  %232 = fsub float %219, %229
  %233 = fsub float %219, %232
  %234 = fsub float %233, %229
  %235 = fsub float %234, %231
  %236 = fadd float %232, %235
  %237 = fmul float %223, %236
  %238 = fadd float %224, %237
  %239 = fsub float %238, %224
  %240 = fsub float %237, %239
  %241 = fmul float %238, %238
  %242 = fneg float %241
  %243 = tail call float @llvm.fma.f32(float %238, float %238, float %242)
  %244 = fmul float %240, 2.000000e+00
  %245 = tail call float @llvm.fma.f32(float %238, float %244, float %243)
  %246 = fadd float %241, %245
  %247 = fsub float %246, %241
  %248 = fsub float %245, %247
  %249 = tail call float @llvm.fmuladd.f32(float %246, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %250 = tail call float @llvm.fmuladd.f32(float %246, float %249, float 0x3FD999BDE0000000)
  %251 = sitofp i32 %218 to float
  %252 = fmul float %251, 0x3FE62E4300000000
  %253 = fneg float %252
  %254 = tail call float @llvm.fma.f32(float %251, float 0x3FE62E4300000000, float %253)
  %255 = tail call float @llvm.fma.f32(float %251, float 0xBE205C6100000000, float %254)
  %256 = fadd float %252, %255
  %257 = fsub float %256, %252
  %258 = fsub float %255, %257
  %259 = tail call float @llvm.amdgcn.ldexp.f32(float %238, i32 1)
  %260 = fmul float %238, %246
  %261 = fneg float %260
  %262 = tail call float @llvm.fma.f32(float %246, float %238, float %261)
  %263 = tail call float @llvm.fma.f32(float %246, float %240, float %262)
  %264 = tail call float @llvm.fma.f32(float %248, float %238, float %263)
  %265 = fadd float %260, %264
  %266 = fsub float %265, %260
  %267 = fsub float %264, %266
  %268 = fmul float %246, %250
  %269 = fneg float %268
  %270 = tail call float @llvm.fma.f32(float %246, float %250, float %269)
  %271 = tail call float @llvm.fma.f32(float %248, float %250, float %270)
  %272 = fadd float %268, %271
  %273 = fsub float %272, %268
  %274 = fsub float %271, %273
  %275 = fadd float %272, 0x3FE5555540000000
  %276 = fadd float %275, 0xBFE5555540000000
  %277 = fsub float %272, %276
  %278 = fadd float %274, 0x3E2E720200000000
  %279 = fadd float %278, %277
  %280 = fadd float %275, %279
  %281 = fsub float %280, %275
  %282 = fsub float %279, %281
  %283 = fmul float %265, %280
  %284 = fneg float %283
  %285 = tail call float @llvm.fma.f32(float %265, float %280, float %284)
  %286 = tail call float @llvm.fma.f32(float %265, float %282, float %285)
  %287 = tail call float @llvm.fma.f32(float %267, float %280, float %286)
  %288 = tail call float @llvm.amdgcn.ldexp.f32(float %240, i32 1)
  %289 = fadd float %283, %287
  %290 = fsub float %289, %283
  %291 = fsub float %287, %290
  %292 = fadd float %259, %289
  %293 = fsub float %292, %259
  %294 = fsub float %289, %293
  %295 = fadd float %288, %291
  %296 = fadd float %295, %294
  %297 = fadd float %292, %296
  %298 = fsub float %297, %292
  %299 = fsub float %296, %298
  %300 = fadd float %256, %297
  %301 = fsub float %300, %256
  %302 = fsub float %300, %301
  %303 = fsub float %256, %302
  %304 = fsub float %297, %301
  %305 = fadd float %304, %303
  %306 = fadd float %258, %299
  %307 = fsub float %306, %258
  %308 = fsub float %306, %307
  %309 = fsub float %258, %308
  %310 = fsub float %299, %307
  %311 = fadd float %310, %309
  %312 = fadd float %306, %305
  %313 = fadd float %300, %312
  %314 = fsub float %313, %300
  %315 = fsub float %312, %314
  %316 = fadd float %311, %315
  %317 = fadd float %313, %316
  %318 = fsub float %317, %313
  %319 = fsub float %316, %318
  %320 = fmul float %317, 0x3FDAAAAAA0000000
  %321 = fneg float %320
  %322 = tail call float @llvm.fma.f32(float %317, float 0x3FDAAAAAA0000000, float %321)
  %323 = tail call float @llvm.fma.f32(float %319, float 0x3FDAAAAAA0000000, float %322)
  %324 = fadd float %320, %323
  %325 = fsub float %324, %320
  %326 = fsub float %323, %325
  %327 = tail call float @llvm.fabs.f32(float %320) #3
  %328 = fcmp oeq float %327, 0x7FF0000000000000
  %329 = select i1 %328, float %320, float %324
  %330 = tail call float @llvm.fabs.f32(float %329) #3
  %331 = fcmp oeq float %330, 0x7FF0000000000000
  %332 = select i1 %331, float 0.000000e+00, float %326
  %333 = fcmp oeq float %329, 0x40562E4300000000
  %334 = select i1 %333, float 0x3EE0000000000000, float 0.000000e+00
  %335 = fsub float %329, %334
  %336 = fadd float %334, %332
  %337 = fmul float %335, 0x3FF7154760000000
  %338 = tail call float @llvm.rint.f32(float %337)
  %339 = fcmp ogt float %335, 0x40562E4300000000
  %340 = fcmp olt float %335, 0xC059D1DA00000000
  %341 = fneg float %337
  %342 = tail call float @llvm.fma.f32(float %335, float 0x3FF7154760000000, float %341)
  %343 = tail call float @llvm.fma.f32(float %335, float 0x3E54AE0BE0000000, float %342)
  %344 = fsub float %337, %338
  %345 = fadd float %343, %344
  %346 = tail call float @llvm.exp2.f32(float %345)
  %347 = fptosi float %338 to i32
  %348 = tail call float @llvm.amdgcn.ldexp.f32(float %346, i32 %347)
  %349 = select i1 %340, float 0.000000e+00, float %348
  %350 = select i1 %339, float 0x7FF0000000000000, float %349
  %351 = tail call float @llvm.fma.f32(float %350, float %336, float %350)
  %352 = tail call float @llvm.fabs.f32(float %350) #3
  %353 = fcmp oeq float %352, 0x7FF0000000000000
  %354 = select i1 %353, float %350, float %351
  %355 = tail call float @llvm.fabs.f32(float %354)
  %356 = fcmp oeq float %212, 0x7FF0000000000000
  %357 = fcmp oeq float %47, 0.000000e+00
  %358 = fcmp oeq float %47, 1.000000e+00
  %359 = fmul contract float %355, 0x3FF0E147A0000000
  %360 = fadd contract float %359, 0xBFAC28F5C0000000
  %361 = select i1 %356, float 0x7FF0000000000000, float %360
  %362 = select i1 %357, float 0xBFAC28F5C0000000, float %361
  %363 = select i1 %358, float 0x3FEFFFFFE0000000, float %362
  br label %364

364:                                              ; preds = %209, %211
  %365 = phi float [ %210, %209 ], [ %363, %211 ]
  %366 = fcmp contract ugt float %49, 0x3F69A5C380000000
  br i1 %366, label %369, label %367

367:                                              ; preds = %364
  %368 = fmul contract float %49, 0x4029D70A40000000
  br label %522

369:                                              ; preds = %364
  %370 = tail call float @llvm.fabs.f32(float %49)
  %371 = tail call float @llvm.amdgcn.frexp.mant.f32(float %370)
  %372 = fcmp olt float %371, 0x3FE5555560000000
  %373 = zext i1 %372 to i32
  %374 = tail call float @llvm.amdgcn.ldexp.f32(float %371, i32 %373)
  %375 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %370)
  %376 = sub nsw i32 %375, %373
  %377 = fadd float %374, -1.000000e+00
  %378 = fadd float %374, 1.000000e+00
  %379 = fadd float %378, -1.000000e+00
  %380 = fsub float %374, %379
  %381 = tail call float @llvm.amdgcn.rcp.f32(float %378)
  %382 = fmul float %377, %381
  %383 = fmul float %378, %382
  %384 = fneg float %383
  %385 = tail call float @llvm.fma.f32(float %382, float %378, float %384)
  %386 = tail call float @llvm.fma.f32(float %382, float %380, float %385)
  %387 = fadd float %383, %386
  %388 = fsub float %387, %383
  %389 = fsub float %386, %388
  %390 = fsub float %377, %387
  %391 = fsub float %377, %390
  %392 = fsub float %391, %387
  %393 = fsub float %392, %389
  %394 = fadd float %390, %393
  %395 = fmul float %381, %394
  %396 = fadd float %382, %395
  %397 = fsub float %396, %382
  %398 = fsub float %395, %397
  %399 = fmul float %396, %396
  %400 = fneg float %399
  %401 = tail call float @llvm.fma.f32(float %396, float %396, float %400)
  %402 = fmul float %398, 2.000000e+00
  %403 = tail call float @llvm.fma.f32(float %396, float %402, float %401)
  %404 = fadd float %399, %403
  %405 = fsub float %404, %399
  %406 = fsub float %403, %405
  %407 = tail call float @llvm.fmuladd.f32(float %404, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %408 = tail call float @llvm.fmuladd.f32(float %404, float %407, float 0x3FD999BDE0000000)
  %409 = sitofp i32 %376 to float
  %410 = fmul float %409, 0x3FE62E4300000000
  %411 = fneg float %410
  %412 = tail call float @llvm.fma.f32(float %409, float 0x3FE62E4300000000, float %411)
  %413 = tail call float @llvm.fma.f32(float %409, float 0xBE205C6100000000, float %412)
  %414 = fadd float %410, %413
  %415 = fsub float %414, %410
  %416 = fsub float %413, %415
  %417 = tail call float @llvm.amdgcn.ldexp.f32(float %396, i32 1)
  %418 = fmul float %396, %404
  %419 = fneg float %418
  %420 = tail call float @llvm.fma.f32(float %404, float %396, float %419)
  %421 = tail call float @llvm.fma.f32(float %404, float %398, float %420)
  %422 = tail call float @llvm.fma.f32(float %406, float %396, float %421)
  %423 = fadd float %418, %422
  %424 = fsub float %423, %418
  %425 = fsub float %422, %424
  %426 = fmul float %404, %408
  %427 = fneg float %426
  %428 = tail call float @llvm.fma.f32(float %404, float %408, float %427)
  %429 = tail call float @llvm.fma.f32(float %406, float %408, float %428)
  %430 = fadd float %426, %429
  %431 = fsub float %430, %426
  %432 = fsub float %429, %431
  %433 = fadd float %430, 0x3FE5555540000000
  %434 = fadd float %433, 0xBFE5555540000000
  %435 = fsub float %430, %434
  %436 = fadd float %432, 0x3E2E720200000000
  %437 = fadd float %436, %435
  %438 = fadd float %433, %437
  %439 = fsub float %438, %433
  %440 = fsub float %437, %439
  %441 = fmul float %423, %438
  %442 = fneg float %441
  %443 = tail call float @llvm.fma.f32(float %423, float %438, float %442)
  %444 = tail call float @llvm.fma.f32(float %423, float %440, float %443)
  %445 = tail call float @llvm.fma.f32(float %425, float %438, float %444)
  %446 = tail call float @llvm.amdgcn.ldexp.f32(float %398, i32 1)
  %447 = fadd float %441, %445
  %448 = fsub float %447, %441
  %449 = fsub float %445, %448
  %450 = fadd float %417, %447
  %451 = fsub float %450, %417
  %452 = fsub float %447, %451
  %453 = fadd float %446, %449
  %454 = fadd float %453, %452
  %455 = fadd float %450, %454
  %456 = fsub float %455, %450
  %457 = fsub float %454, %456
  %458 = fadd float %414, %455
  %459 = fsub float %458, %414
  %460 = fsub float %458, %459
  %461 = fsub float %414, %460
  %462 = fsub float %455, %459
  %463 = fadd float %462, %461
  %464 = fadd float %416, %457
  %465 = fsub float %464, %416
  %466 = fsub float %464, %465
  %467 = fsub float %416, %466
  %468 = fsub float %457, %465
  %469 = fadd float %468, %467
  %470 = fadd float %464, %463
  %471 = fadd float %458, %470
  %472 = fsub float %471, %458
  %473 = fsub float %470, %472
  %474 = fadd float %469, %473
  %475 = fadd float %471, %474
  %476 = fsub float %475, %471
  %477 = fsub float %474, %476
  %478 = fmul float %475, 0x3FDAAAAAA0000000
  %479 = fneg float %478
  %480 = tail call float @llvm.fma.f32(float %475, float 0x3FDAAAAAA0000000, float %479)
  %481 = tail call float @llvm.fma.f32(float %477, float 0x3FDAAAAAA0000000, float %480)
  %482 = fadd float %478, %481
  %483 = fsub float %482, %478
  %484 = fsub float %481, %483
  %485 = tail call float @llvm.fabs.f32(float %478) #3
  %486 = fcmp oeq float %485, 0x7FF0000000000000
  %487 = select i1 %486, float %478, float %482
  %488 = tail call float @llvm.fabs.f32(float %487) #3
  %489 = fcmp oeq float %488, 0x7FF0000000000000
  %490 = select i1 %489, float 0.000000e+00, float %484
  %491 = fcmp oeq float %487, 0x40562E4300000000
  %492 = select i1 %491, float 0x3EE0000000000000, float 0.000000e+00
  %493 = fsub float %487, %492
  %494 = fadd float %492, %490
  %495 = fmul float %493, 0x3FF7154760000000
  %496 = tail call float @llvm.rint.f32(float %495)
  %497 = fcmp ogt float %493, 0x40562E4300000000
  %498 = fcmp olt float %493, 0xC059D1DA00000000
  %499 = fneg float %495
  %500 = tail call float @llvm.fma.f32(float %493, float 0x3FF7154760000000, float %499)
  %501 = tail call float @llvm.fma.f32(float %493, float 0x3E54AE0BE0000000, float %500)
  %502 = fsub float %495, %496
  %503 = fadd float %501, %502
  %504 = tail call float @llvm.exp2.f32(float %503)
  %505 = fptosi float %496 to i32
  %506 = tail call float @llvm.amdgcn.ldexp.f32(float %504, i32 %505)
  %507 = select i1 %498, float 0.000000e+00, float %506
  %508 = select i1 %497, float 0x7FF0000000000000, float %507
  %509 = tail call float @llvm.fma.f32(float %508, float %494, float %508)
  %510 = tail call float @llvm.fabs.f32(float %508) #3
  %511 = fcmp oeq float %510, 0x7FF0000000000000
  %512 = select i1 %511, float %508, float %509
  %513 = tail call float @llvm.fabs.f32(float %512)
  %514 = fcmp oeq float %370, 0x7FF0000000000000
  %515 = fcmp oeq float %49, 0.000000e+00
  %516 = fcmp oeq float %49, 1.000000e+00
  %517 = fmul contract float %513, 0x3FF0E147A0000000
  %518 = fadd contract float %517, 0xBFAC28F5C0000000
  %519 = select i1 %514, float 0x7FF0000000000000, float %518
  %520 = select i1 %515, float 0xBFAC28F5C0000000, float %519
  %521 = select i1 %516, float 0x3FEFFFFFE0000000, float %520
  br label %522

522:                                              ; preds = %367, %369
  %523 = phi float [ %368, %367 ], [ %521, %369 ]
  store float %207, float addrspace(1)* %32, align 4
  store float %365, float addrspace(1)* %34, align 4
  store float %523, float addrspace(1)* %36, align 4
  br label %524

524:                                              ; preds = %4, %522
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
