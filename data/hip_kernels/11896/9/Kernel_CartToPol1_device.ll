; ModuleID = '../data/hip_kernels/11896/9/main.cu'
source_filename = "../data/hip_kernels/11896/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17Kernel_CartToPol1PdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %431

25:                                               ; preds = %4
  %26 = sdiv i32 %2, -2
  %27 = add i32 %13, %26
  %28 = sitofp i32 %27 to float
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = tail call float @llvm.amdgcn.frexp.mant.f32(float %29)
  %31 = fcmp olt float %30, 0x3FE5555560000000
  %32 = zext i1 %31 to i32
  %33 = tail call float @llvm.amdgcn.ldexp.f32(float %30, i32 %32)
  %34 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %29)
  %35 = sub nsw i32 %34, %32
  %36 = fadd float %33, -1.000000e+00
  %37 = fadd float %33, 1.000000e+00
  %38 = fadd float %37, -1.000000e+00
  %39 = fsub float %33, %38
  %40 = tail call float @llvm.amdgcn.rcp.f32(float %37)
  %41 = fmul float %36, %40
  %42 = fmul float %37, %41
  %43 = fneg float %42
  %44 = tail call float @llvm.fma.f32(float %41, float %37, float %43)
  %45 = tail call float @llvm.fma.f32(float %41, float %39, float %44)
  %46 = fadd float %42, %45
  %47 = fsub float %46, %42
  %48 = fsub float %45, %47
  %49 = fsub float %36, %46
  %50 = fsub float %36, %49
  %51 = fsub float %50, %46
  %52 = fsub float %51, %48
  %53 = fadd float %49, %52
  %54 = fmul float %40, %53
  %55 = fadd float %41, %54
  %56 = fsub float %55, %41
  %57 = fsub float %54, %56
  %58 = fmul float %55, %55
  %59 = fneg float %58
  %60 = tail call float @llvm.fma.f32(float %55, float %55, float %59)
  %61 = fmul float %57, 2.000000e+00
  %62 = tail call float @llvm.fma.f32(float %55, float %61, float %60)
  %63 = fadd float %58, %62
  %64 = fsub float %63, %58
  %65 = fsub float %62, %64
  %66 = tail call float @llvm.fmuladd.f32(float %63, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %67 = tail call float @llvm.fmuladd.f32(float %63, float %66, float 0x3FD999BDE0000000)
  %68 = sitofp i32 %35 to float
  %69 = fmul float %68, 0x3FE62E4300000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %68, float 0x3FE62E4300000000, float %70)
  %72 = tail call float @llvm.fma.f32(float %68, float 0xBE205C6100000000, float %71)
  %73 = fadd float %69, %72
  %74 = fsub float %73, %69
  %75 = fsub float %72, %74
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 1)
  %77 = fmul float %55, %63
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %63, float %55, float %78)
  %80 = tail call float @llvm.fma.f32(float %63, float %57, float %79)
  %81 = tail call float @llvm.fma.f32(float %65, float %55, float %80)
  %82 = fadd float %77, %81
  %83 = fsub float %82, %77
  %84 = fsub float %81, %83
  %85 = fmul float %63, %67
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %63, float %67, float %86)
  %88 = tail call float @llvm.fma.f32(float %65, float %67, float %87)
  %89 = fadd float %85, %88
  %90 = fsub float %89, %85
  %91 = fsub float %88, %90
  %92 = fadd float %89, 0x3FE5555540000000
  %93 = fadd float %92, 0xBFE5555540000000
  %94 = fsub float %89, %93
  %95 = fadd float %91, 0x3E2E720200000000
  %96 = fadd float %95, %94
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %82, %97
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %82, float %97, float %101)
  %103 = tail call float @llvm.fma.f32(float %82, float %99, float %102)
  %104 = tail call float @llvm.fma.f32(float %84, float %97, float %103)
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 1)
  %106 = fadd float %100, %104
  %107 = fsub float %106, %100
  %108 = fsub float %104, %107
  %109 = fadd float %76, %106
  %110 = fsub float %109, %76
  %111 = fsub float %106, %110
  %112 = fadd float %105, %108
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fadd float %73, %114
  %118 = fsub float %117, %73
  %119 = fsub float %117, %118
  %120 = fsub float %73, %119
  %121 = fsub float %114, %118
  %122 = fadd float %121, %120
  %123 = fadd float %75, %116
  %124 = fsub float %123, %75
  %125 = fsub float %123, %124
  %126 = fsub float %75, %125
  %127 = fsub float %116, %124
  %128 = fadd float %127, %126
  %129 = fadd float %123, %122
  %130 = fadd float %117, %129
  %131 = fsub float %130, %117
  %132 = fsub float %129, %131
  %133 = fadd float %128, %132
  %134 = fadd float %130, %133
  %135 = fsub float %134, %130
  %136 = fsub float %133, %135
  %137 = fmul float %134, 2.000000e+00
  %138 = fneg float %137
  %139 = tail call float @llvm.fma.f32(float %134, float 2.000000e+00, float %138)
  %140 = tail call float @llvm.fma.f32(float %136, float 2.000000e+00, float %139)
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = tail call float @llvm.fabs.f32(float %137) #3
  %145 = fcmp oeq float %144, 0x7FF0000000000000
  %146 = select i1 %145, float %137, float %141
  %147 = tail call float @llvm.fabs.f32(float %146) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float 0.000000e+00, float %143
  %150 = fcmp oeq float %146, 0x40562E4300000000
  %151 = select i1 %150, float 0x3EE0000000000000, float 0.000000e+00
  %152 = fsub float %146, %151
  %153 = fadd float %151, %149
  %154 = fmul float %152, 0x3FF7154760000000
  %155 = tail call float @llvm.rint.f32(float %154)
  %156 = fcmp ogt float %152, 0x40562E4300000000
  %157 = fcmp olt float %152, 0xC059D1DA00000000
  %158 = fneg float %154
  %159 = tail call float @llvm.fma.f32(float %152, float 0x3FF7154760000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %152, float 0x3E54AE0BE0000000, float %159)
  %161 = fsub float %154, %155
  %162 = fadd float %160, %161
  %163 = tail call float @llvm.exp2.f32(float %162)
  %164 = fptosi float %155 to i32
  %165 = tail call float @llvm.amdgcn.ldexp.f32(float %163, i32 %164)
  %166 = select i1 %157, float 0.000000e+00, float %165
  %167 = select i1 %156, float 0x7FF0000000000000, float %166
  %168 = tail call float @llvm.fma.f32(float %167, float %153, float %167)
  %169 = tail call float @llvm.fabs.f32(float %167) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float %167, float %168
  %172 = tail call float @llvm.fabs.f32(float %171)
  %173 = fcmp oeq float %29, 0x7FF0000000000000
  %174 = icmp eq i32 %27, 0
  %175 = select i1 %173, float 0x7FF0000000000000, float %172
  %176 = select i1 %174, float 0.000000e+00, float %175
  %177 = icmp eq i32 %27, 1
  %178 = select i1 %177, float 1.000000e+00, float %176
  %179 = sdiv i32 %3, -2
  %180 = add i32 %21, %179
  %181 = sitofp i32 %180 to float
  %182 = tail call float @llvm.fabs.f32(float %181)
  %183 = tail call float @llvm.amdgcn.frexp.mant.f32(float %182)
  %184 = fcmp olt float %183, 0x3FE5555560000000
  %185 = zext i1 %184 to i32
  %186 = tail call float @llvm.amdgcn.ldexp.f32(float %183, i32 %185)
  %187 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %182)
  %188 = sub nsw i32 %187, %185
  %189 = fadd float %186, -1.000000e+00
  %190 = fadd float %186, 1.000000e+00
  %191 = fadd float %190, -1.000000e+00
  %192 = fsub float %186, %191
  %193 = tail call float @llvm.amdgcn.rcp.f32(float %190)
  %194 = fmul float %189, %193
  %195 = fmul float %190, %194
  %196 = fneg float %195
  %197 = tail call float @llvm.fma.f32(float %194, float %190, float %196)
  %198 = tail call float @llvm.fma.f32(float %194, float %192, float %197)
  %199 = fadd float %195, %198
  %200 = fsub float %199, %195
  %201 = fsub float %198, %200
  %202 = fsub float %189, %199
  %203 = fsub float %189, %202
  %204 = fsub float %203, %199
  %205 = fsub float %204, %201
  %206 = fadd float %202, %205
  %207 = fmul float %193, %206
  %208 = fadd float %194, %207
  %209 = fsub float %208, %194
  %210 = fsub float %207, %209
  %211 = fmul float %208, %208
  %212 = fneg float %211
  %213 = tail call float @llvm.fma.f32(float %208, float %208, float %212)
  %214 = fmul float %210, 2.000000e+00
  %215 = tail call float @llvm.fma.f32(float %208, float %214, float %213)
  %216 = fadd float %211, %215
  %217 = fsub float %216, %211
  %218 = fsub float %215, %217
  %219 = tail call float @llvm.fmuladd.f32(float %216, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %220 = tail call float @llvm.fmuladd.f32(float %216, float %219, float 0x3FD999BDE0000000)
  %221 = sitofp i32 %188 to float
  %222 = fmul float %221, 0x3FE62E4300000000
  %223 = fneg float %222
  %224 = tail call float @llvm.fma.f32(float %221, float 0x3FE62E4300000000, float %223)
  %225 = tail call float @llvm.fma.f32(float %221, float 0xBE205C6100000000, float %224)
  %226 = fadd float %222, %225
  %227 = fsub float %226, %222
  %228 = fsub float %225, %227
  %229 = tail call float @llvm.amdgcn.ldexp.f32(float %208, i32 1)
  %230 = fmul float %208, %216
  %231 = fneg float %230
  %232 = tail call float @llvm.fma.f32(float %216, float %208, float %231)
  %233 = tail call float @llvm.fma.f32(float %216, float %210, float %232)
  %234 = tail call float @llvm.fma.f32(float %218, float %208, float %233)
  %235 = fadd float %230, %234
  %236 = fsub float %235, %230
  %237 = fsub float %234, %236
  %238 = fmul float %216, %220
  %239 = fneg float %238
  %240 = tail call float @llvm.fma.f32(float %216, float %220, float %239)
  %241 = tail call float @llvm.fma.f32(float %218, float %220, float %240)
  %242 = fadd float %238, %241
  %243 = fsub float %242, %238
  %244 = fsub float %241, %243
  %245 = fadd float %242, 0x3FE5555540000000
  %246 = fadd float %245, 0xBFE5555540000000
  %247 = fsub float %242, %246
  %248 = fadd float %244, 0x3E2E720200000000
  %249 = fadd float %248, %247
  %250 = fadd float %245, %249
  %251 = fsub float %250, %245
  %252 = fsub float %249, %251
  %253 = fmul float %235, %250
  %254 = fneg float %253
  %255 = tail call float @llvm.fma.f32(float %235, float %250, float %254)
  %256 = tail call float @llvm.fma.f32(float %235, float %252, float %255)
  %257 = tail call float @llvm.fma.f32(float %237, float %250, float %256)
  %258 = tail call float @llvm.amdgcn.ldexp.f32(float %210, i32 1)
  %259 = fadd float %253, %257
  %260 = fsub float %259, %253
  %261 = fsub float %257, %260
  %262 = fadd float %229, %259
  %263 = fsub float %262, %229
  %264 = fsub float %259, %263
  %265 = fadd float %258, %261
  %266 = fadd float %265, %264
  %267 = fadd float %262, %266
  %268 = fsub float %267, %262
  %269 = fsub float %266, %268
  %270 = fadd float %226, %267
  %271 = fsub float %270, %226
  %272 = fsub float %270, %271
  %273 = fsub float %226, %272
  %274 = fsub float %267, %271
  %275 = fadd float %274, %273
  %276 = fadd float %228, %269
  %277 = fsub float %276, %228
  %278 = fsub float %276, %277
  %279 = fsub float %228, %278
  %280 = fsub float %269, %277
  %281 = fadd float %280, %279
  %282 = fadd float %276, %275
  %283 = fadd float %270, %282
  %284 = fsub float %283, %270
  %285 = fsub float %282, %284
  %286 = fadd float %281, %285
  %287 = fadd float %283, %286
  %288 = fsub float %287, %283
  %289 = fsub float %286, %288
  %290 = fmul float %287, 2.000000e+00
  %291 = fneg float %290
  %292 = tail call float @llvm.fma.f32(float %287, float 2.000000e+00, float %291)
  %293 = tail call float @llvm.fma.f32(float %289, float 2.000000e+00, float %292)
  %294 = fadd float %290, %293
  %295 = fsub float %294, %290
  %296 = fsub float %293, %295
  %297 = tail call float @llvm.fabs.f32(float %290) #3
  %298 = fcmp oeq float %297, 0x7FF0000000000000
  %299 = select i1 %298, float %290, float %294
  %300 = tail call float @llvm.fabs.f32(float %299) #3
  %301 = fcmp oeq float %300, 0x7FF0000000000000
  %302 = select i1 %301, float 0.000000e+00, float %296
  %303 = fcmp oeq float %299, 0x40562E4300000000
  %304 = select i1 %303, float 0x3EE0000000000000, float 0.000000e+00
  %305 = fsub float %299, %304
  %306 = fadd float %304, %302
  %307 = fmul float %305, 0x3FF7154760000000
  %308 = tail call float @llvm.rint.f32(float %307)
  %309 = fcmp ogt float %305, 0x40562E4300000000
  %310 = fcmp olt float %305, 0xC059D1DA00000000
  %311 = fneg float %307
  %312 = tail call float @llvm.fma.f32(float %305, float 0x3FF7154760000000, float %311)
  %313 = tail call float @llvm.fma.f32(float %305, float 0x3E54AE0BE0000000, float %312)
  %314 = fsub float %307, %308
  %315 = fadd float %313, %314
  %316 = tail call float @llvm.exp2.f32(float %315)
  %317 = fptosi float %308 to i32
  %318 = tail call float @llvm.amdgcn.ldexp.f32(float %316, i32 %317)
  %319 = select i1 %310, float 0.000000e+00, float %318
  %320 = select i1 %309, float 0x7FF0000000000000, float %319
  %321 = tail call float @llvm.fma.f32(float %320, float %306, float %320)
  %322 = tail call float @llvm.fabs.f32(float %320) #3
  %323 = fcmp oeq float %322, 0x7FF0000000000000
  %324 = select i1 %323, float %320, float %321
  %325 = tail call float @llvm.fabs.f32(float %324)
  %326 = fcmp oeq float %182, 0x7FF0000000000000
  %327 = icmp eq i32 %180, 0
  %328 = select i1 %326, float 0x7FF0000000000000, float %325
  %329 = select i1 %327, float 0.000000e+00, float %328
  %330 = icmp eq i32 %180, 1
  %331 = select i1 %330, float 1.000000e+00, float %329
  %332 = fadd contract float %178, %331
  %333 = fcmp olt float %332, 0x39F0000000000000
  %334 = select i1 %333, float 0x41F0000000000000, float 1.000000e+00
  %335 = fmul float %332, %334
  %336 = tail call float @llvm.sqrt.f32(float %335)
  %337 = bitcast float %336 to i32
  %338 = add nsw i32 %337, -1
  %339 = bitcast i32 %338 to float
  %340 = add nsw i32 %337, 1
  %341 = bitcast i32 %340 to float
  %342 = tail call i1 @llvm.amdgcn.class.f32(float %335, i32 608)
  %343 = select i1 %333, float 0x3EF0000000000000, float 1.000000e+00
  %344 = fneg float %341
  %345 = tail call float @llvm.fma.f32(float %344, float %336, float %335)
  %346 = fcmp ogt float %345, 0.000000e+00
  %347 = fneg float %339
  %348 = tail call float @llvm.fma.f32(float %347, float %336, float %335)
  %349 = fcmp ole float %348, 0.000000e+00
  %350 = select i1 %349, float %339, float %336
  %351 = select i1 %346, float %341, float %350
  %352 = fmul float %343, %351
  %353 = select i1 %342, float %335, float %352
  %354 = fmul contract float %353, 2.000000e+00
  %355 = fpext float %354 to double
  %356 = tail call float @llvm.minnum.f32(float %29, float %182)
  %357 = tail call float @llvm.maxnum.f32(float %29, float %182)
  %358 = fdiv float %356, %357, !fpmath !7
  %359 = fmul float %358, %358
  %360 = tail call float @llvm.fmuladd.f32(float %359, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %361 = tail call float @llvm.fmuladd.f32(float %359, float %360, float 0x3FA53F67E0000000)
  %362 = tail call float @llvm.fmuladd.f32(float %359, float %361, float 0xBFB2FA9AE0000000)
  %363 = tail call float @llvm.fmuladd.f32(float %359, float %362, float 0x3FBB263640000000)
  %364 = tail call float @llvm.fmuladd.f32(float %359, float %363, float 0xBFC22C1CC0000000)
  %365 = tail call float @llvm.fmuladd.f32(float %359, float %364, float 0x3FC99717E0000000)
  %366 = tail call float @llvm.fmuladd.f32(float %359, float %365, float 0xBFD5554C40000000)
  %367 = fmul float %359, %366
  %368 = tail call float @llvm.fmuladd.f32(float %358, float %367, float %358)
  %369 = fsub float 0x3FF921FB60000000, %368
  %370 = fcmp ogt float %182, %29
  %371 = select i1 %370, float %369, float %368
  %372 = fsub float 0x400921FB60000000, %371
  %373 = icmp slt i32 %27, 0
  %374 = select i1 %373, float %372, float %371
  %375 = select i1 %373, float 0x400921FB60000000, float 0.000000e+00
  %376 = select i1 %327, float %375, float %374
  %377 = select i1 %373, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %378 = and i1 %173, %326
  %379 = select i1 %378, float %377, float %376
  %380 = tail call float @llvm.copysign.f32(float %379, float %181)
  %381 = fadd contract float %380, 0x400921FB60000000
  %382 = sitofp i32 %3 to float
  %383 = fmul contract float %381, %382
  %384 = fdiv contract float %383, 0x401921FB60000000
  %385 = fpext float %384 to double
  %386 = fptosi float %354 to i32
  %387 = srem i32 %386, %2
  %388 = fptosi float %384 to i32
  %389 = srem i32 %388, %3
  %390 = add nsw i32 %387, 1
  %391 = srem i32 %390, %2
  %392 = add nsw i32 %389, 1
  %393 = srem i32 %392, %3
  %394 = mul nsw i32 %389, %2
  %395 = add nsw i32 %394, %387
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds double, double addrspace(1)* %0, i64 %396
  %398 = load double, double addrspace(1)* %397, align 8, !tbaa !8, !amdgpu.noclobber !5
  %399 = mul nsw i32 %393, %2
  %400 = add nsw i32 %399, %387
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds double, double addrspace(1)* %0, i64 %401
  %403 = load double, double addrspace(1)* %402, align 8, !tbaa !8, !amdgpu.noclobber !5
  %404 = add nsw i32 %399, %391
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds double, double addrspace(1)* %0, i64 %405
  %407 = load double, double addrspace(1)* %406, align 8, !tbaa !8, !amdgpu.noclobber !5
  %408 = add nsw i32 %394, %391
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds double, double addrspace(1)* %0, i64 %409
  %411 = load double, double addrspace(1)* %410, align 8, !tbaa !8, !amdgpu.noclobber !5
  %412 = tail call float @llvm.floor.f32(float %384)
  %413 = fpext float %412 to double
  %414 = fsub contract double %385, %413
  %415 = tail call float @llvm.floor.f32(float %354)
  %416 = fpext float %415 to double
  %417 = fsub contract double %355, %416
  %418 = fsub contract double %403, %398
  %419 = fmul contract double %417, %418
  %420 = fadd contract double %398, %419
  %421 = fsub contract double %407, %411
  %422 = fmul contract double %417, %421
  %423 = fadd contract double %411, %422
  %424 = fsub contract double %423, %420
  %425 = fmul contract double %414, %424
  %426 = fadd contract double %420, %425
  %427 = mul nsw i32 %21, %2
  %428 = add nsw i32 %427, %13
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds double, double addrspace(1)* %1, i64 %429
  store double %426, double addrspace(1)* %430, align 8, !tbaa !8
  br label %431

431:                                              ; preds = %4, %25
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

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
!7 = !{float 2.500000e+00}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
