; ModuleID = '../data/hip_kernels/1971/35/main.cu'
source_filename = "../data/hip_kernels/1971/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kernel_evaluatenuidPddd(i32 %0, double %1, double addrspace(1)* nocapture %2, double %3, double %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %0
  br i1 %15, label %16, label %419

16:                                               ; preds = %5
  %17 = uitofp i32 %14 to double
  %18 = fmul contract double %17, %3
  %19 = fadd contract double %18, %4
  %20 = fmul contract double %19, 5.000000e-01
  %21 = fadd contract double %20, 5.000000e-01
  %22 = fcmp contract olt double %21, 7.000000e+00
  br i1 %22, label %23, label %30

23:                                               ; preds = %16, %23
  %24 = phi double [ %28, %23 ], [ %21, %16 ]
  %25 = phi double [ %27, %23 ], [ 0.000000e+00, %16 ]
  %26 = fdiv contract double 1.000000e+00, %24
  %27 = fsub contract double %25, %26
  %28 = fadd contract double %24, 1.000000e+00
  %29 = fcmp contract olt double %28, 7.000000e+00
  br i1 %29, label %23, label %30, !llvm.loop !7

30:                                               ; preds = %23, %16
  %31 = phi double [ 0.000000e+00, %16 ], [ %27, %23 ]
  %32 = phi double [ %21, %16 ], [ %28, %23 ]
  %33 = fadd contract double %32, -5.000000e-01
  %34 = fdiv contract double 1.000000e+00, %33
  %35 = fmul contract double %34, %34
  %36 = fmul contract double %35, %35
  %37 = tail call double @llvm.amdgcn.frexp.mant.f64(double %33)
  %38 = fcmp olt double %37, 0x3FE5555555555555
  %39 = zext i1 %38 to i32
  %40 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %33)
  %42 = sub nsw i32 %41, %39
  %43 = fadd double %40, -1.000000e+00
  %44 = fadd double %40, 1.000000e+00
  %45 = fadd double %44, -1.000000e+00
  %46 = fsub double %40, %45
  %47 = tail call double @llvm.amdgcn.rcp.f64(double %44)
  %48 = fneg double %44
  %49 = tail call double @llvm.fma.f64(double %48, double %47, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %47, double %47)
  %51 = tail call double @llvm.fma.f64(double %48, double %50, double 1.000000e+00)
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double %50)
  %53 = fmul double %43, %52
  %54 = fmul double %44, %53
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %53, double %44, double %55)
  %57 = tail call double @llvm.fma.f64(double %53, double %46, double %56)
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fsub double %43, %58
  %62 = fsub double %43, %61
  %63 = fsub double %62, %58
  %64 = fsub double %63, %60
  %65 = fadd double %61, %64
  %66 = fmul double %52, %65
  %67 = fadd double %53, %66
  %68 = fsub double %67, %53
  %69 = fsub double %66, %68
  %70 = fmul double %67, %67
  %71 = tail call double @llvm.fma.f64(double %70, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %72 = tail call double @llvm.fma.f64(double %70, double %71, double 0x3FC7474DD7F4DF2E)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double 0x3FCC71C016291751)
  %74 = tail call double @llvm.fma.f64(double %70, double %73, double 0x3FD249249B27ACF1)
  %75 = tail call double @llvm.fma.f64(double %70, double %74, double 0x3FD99999998EF7B6)
  %76 = tail call double @llvm.fma.f64(double %70, double %75, double 0x3FE5555555555780)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %67, i32 1)
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %69, i32 1)
  %79 = fmul double %67, %70
  %80 = fmul double %79, %76
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %78, %83
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = sitofp i32 %42 to double
  %89 = fmul double %88, 0x3FE62E42FEFA39EF
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double 0x3FE62E42FEFA39EF, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double 0x3C7ABC9E3B39803F, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fadd double %93, %85
  %97 = fsub double %96, %93
  %98 = fsub double %96, %97
  %99 = fsub double %93, %98
  %100 = fsub double %85, %97
  %101 = fadd double %100, %99
  %102 = fadd double %95, %87
  %103 = fsub double %102, %95
  %104 = fsub double %102, %103
  %105 = fsub double %95, %104
  %106 = fsub double %87, %103
  %107 = fadd double %106, %105
  %108 = fadd double %102, %101
  %109 = fadd double %96, %108
  %110 = fsub double %109, %96
  %111 = fsub double %108, %110
  %112 = fadd double %107, %111
  %113 = fadd double %109, %112
  %114 = tail call double @llvm.fabs.f64(double %33) #3
  %115 = fcmp oeq double %114, 0x7FF0000000000000
  %116 = select i1 %115, double %33, double %113
  %117 = fcmp olt double %33, 0.000000e+00
  %118 = select i1 %117, double 0x7FF8000000000000, double %116
  %119 = fcmp oeq double %33, 0.000000e+00
  %120 = select i1 %119, double 0xFFF0000000000000, double %118
  %121 = fmul contract double %35, 0x3FA5555555555555
  %122 = fadd contract double %121, %120
  %123 = fmul contract double %36, 0x3F7DDDDDDDDDDDDE
  %124 = fsub contract double %122, %123
  %125 = fmul contract double %36, 0x3F6F7DF7DF7DF7DF
  %126 = fmul contract double %35, %125
  %127 = fadd contract double %126, %124
  %128 = fmul contract double %36, 0x3F70EEEEEEEEEEEF
  %129 = fmul contract double %36, %128
  %130 = fsub contract double %127, %129
  %131 = fadd contract double %31, %130
  %132 = fadd contract double %19, 1.000000e+00
  %133 = fmul contract double %132, 5.000000e-01
  %134 = tail call double @llvm.amdgcn.frexp.mant.f64(double %133)
  %135 = fcmp olt double %134, 0x3FE5555555555555
  %136 = zext i1 %135 to i32
  %137 = tail call double @llvm.amdgcn.ldexp.f64(double %134, i32 %136)
  %138 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %133)
  %139 = sub nsw i32 %138, %136
  %140 = fadd double %137, -1.000000e+00
  %141 = fadd double %137, 1.000000e+00
  %142 = fadd double %141, -1.000000e+00
  %143 = fsub double %137, %142
  %144 = tail call double @llvm.amdgcn.rcp.f64(double %141)
  %145 = fneg double %141
  %146 = tail call double @llvm.fma.f64(double %145, double %144, double 1.000000e+00)
  %147 = tail call double @llvm.fma.f64(double %146, double %144, double %144)
  %148 = tail call double @llvm.fma.f64(double %145, double %147, double 1.000000e+00)
  %149 = tail call double @llvm.fma.f64(double %148, double %147, double %147)
  %150 = fmul double %140, %149
  %151 = fmul double %141, %150
  %152 = fneg double %151
  %153 = tail call double @llvm.fma.f64(double %150, double %141, double %152)
  %154 = tail call double @llvm.fma.f64(double %150, double %143, double %153)
  %155 = fadd double %151, %154
  %156 = fsub double %155, %151
  %157 = fsub double %154, %156
  %158 = fsub double %140, %155
  %159 = fsub double %140, %158
  %160 = fsub double %159, %155
  %161 = fsub double %160, %157
  %162 = fadd double %158, %161
  %163 = fmul double %149, %162
  %164 = fadd double %150, %163
  %165 = fsub double %164, %150
  %166 = fsub double %163, %165
  %167 = fmul double %164, %164
  %168 = tail call double @llvm.fma.f64(double %167, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %169 = tail call double @llvm.fma.f64(double %167, double %168, double 0x3FC7474DD7F4DF2E)
  %170 = tail call double @llvm.fma.f64(double %167, double %169, double 0x3FCC71C016291751)
  %171 = tail call double @llvm.fma.f64(double %167, double %170, double 0x3FD249249B27ACF1)
  %172 = tail call double @llvm.fma.f64(double %167, double %171, double 0x3FD99999998EF7B6)
  %173 = tail call double @llvm.fma.f64(double %167, double %172, double 0x3FE5555555555780)
  %174 = tail call double @llvm.amdgcn.ldexp.f64(double %164, i32 1)
  %175 = tail call double @llvm.amdgcn.ldexp.f64(double %166, i32 1)
  %176 = fmul double %164, %167
  %177 = fmul double %176, %173
  %178 = fadd double %174, %177
  %179 = fsub double %178, %174
  %180 = fsub double %177, %179
  %181 = fadd double %175, %180
  %182 = fadd double %178, %181
  %183 = fsub double %182, %178
  %184 = fsub double %181, %183
  %185 = sitofp i32 %139 to double
  %186 = fmul double %185, 0x3FE62E42FEFA39EF
  %187 = fneg double %186
  %188 = tail call double @llvm.fma.f64(double %185, double 0x3FE62E42FEFA39EF, double %187)
  %189 = tail call double @llvm.fma.f64(double %185, double 0x3C7ABC9E3B39803F, double %188)
  %190 = fadd double %186, %189
  %191 = fsub double %190, %186
  %192 = fsub double %189, %191
  %193 = fadd double %190, %182
  %194 = fsub double %193, %190
  %195 = fsub double %193, %194
  %196 = fsub double %190, %195
  %197 = fsub double %182, %194
  %198 = fadd double %197, %196
  %199 = fadd double %192, %184
  %200 = fsub double %199, %192
  %201 = fsub double %199, %200
  %202 = fsub double %192, %201
  %203 = fsub double %184, %200
  %204 = fadd double %203, %202
  %205 = fadd double %199, %198
  %206 = fadd double %193, %205
  %207 = fsub double %206, %193
  %208 = fsub double %205, %207
  %209 = fadd double %204, %208
  %210 = fadd double %206, %209
  %211 = tail call double @llvm.fabs.f64(double %133) #3
  %212 = fcmp oeq double %211, 0x7FF0000000000000
  %213 = select i1 %212, double %133, double %210
  %214 = fcmp olt double %133, 0.000000e+00
  %215 = select i1 %214, double 0x7FF8000000000000, double %213
  %216 = fcmp oeq double %133, 0.000000e+00
  %217 = select i1 %216, double 0xFFF0000000000000, double %215
  %218 = fsub contract double %131, %217
  %219 = zext i32 %14 to i64
  %220 = getelementptr inbounds double, double addrspace(1)* %2, i64 %219
  store double %218, double addrspace(1)* %220, align 8, !tbaa !9
  %221 = fcmp contract olt double %20, 7.000000e+00
  br i1 %221, label %222, label %229

222:                                              ; preds = %30, %222
  %223 = phi double [ %227, %222 ], [ %20, %30 ]
  %224 = phi double [ %226, %222 ], [ 0.000000e+00, %30 ]
  %225 = fdiv contract double 1.000000e+00, %223
  %226 = fsub contract double %224, %225
  %227 = fadd contract double %223, 1.000000e+00
  %228 = fcmp contract olt double %227, 7.000000e+00
  br i1 %228, label %222, label %229, !llvm.loop !7

229:                                              ; preds = %222, %30
  %230 = phi double [ 0.000000e+00, %30 ], [ %226, %222 ]
  %231 = phi double [ %20, %30 ], [ %227, %222 ]
  %232 = fadd contract double %231, -5.000000e-01
  %233 = fdiv contract double 1.000000e+00, %232
  %234 = fmul contract double %233, %233
  %235 = fmul contract double %234, %234
  %236 = tail call double @llvm.amdgcn.frexp.mant.f64(double %232)
  %237 = fcmp olt double %236, 0x3FE5555555555555
  %238 = zext i1 %237 to i32
  %239 = tail call double @llvm.amdgcn.ldexp.f64(double %236, i32 %238)
  %240 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %232)
  %241 = sub nsw i32 %240, %238
  %242 = fadd double %239, -1.000000e+00
  %243 = fadd double %239, 1.000000e+00
  %244 = fadd double %243, -1.000000e+00
  %245 = fsub double %239, %244
  %246 = tail call double @llvm.amdgcn.rcp.f64(double %243)
  %247 = fneg double %243
  %248 = tail call double @llvm.fma.f64(double %247, double %246, double 1.000000e+00)
  %249 = tail call double @llvm.fma.f64(double %248, double %246, double %246)
  %250 = tail call double @llvm.fma.f64(double %247, double %249, double 1.000000e+00)
  %251 = tail call double @llvm.fma.f64(double %250, double %249, double %249)
  %252 = fmul double %242, %251
  %253 = fmul double %243, %252
  %254 = fneg double %253
  %255 = tail call double @llvm.fma.f64(double %252, double %243, double %254)
  %256 = tail call double @llvm.fma.f64(double %252, double %245, double %255)
  %257 = fadd double %253, %256
  %258 = fsub double %257, %253
  %259 = fsub double %256, %258
  %260 = fsub double %242, %257
  %261 = fsub double %242, %260
  %262 = fsub double %261, %257
  %263 = fsub double %262, %259
  %264 = fadd double %260, %263
  %265 = fmul double %251, %264
  %266 = fadd double %252, %265
  %267 = fsub double %266, %252
  %268 = fsub double %265, %267
  %269 = fmul double %266, %266
  %270 = tail call double @llvm.fma.f64(double %269, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %271 = tail call double @llvm.fma.f64(double %269, double %270, double 0x3FC7474DD7F4DF2E)
  %272 = tail call double @llvm.fma.f64(double %269, double %271, double 0x3FCC71C016291751)
  %273 = tail call double @llvm.fma.f64(double %269, double %272, double 0x3FD249249B27ACF1)
  %274 = tail call double @llvm.fma.f64(double %269, double %273, double 0x3FD99999998EF7B6)
  %275 = tail call double @llvm.fma.f64(double %269, double %274, double 0x3FE5555555555780)
  %276 = tail call double @llvm.amdgcn.ldexp.f64(double %266, i32 1)
  %277 = tail call double @llvm.amdgcn.ldexp.f64(double %268, i32 1)
  %278 = fmul double %266, %269
  %279 = fmul double %278, %275
  %280 = fadd double %276, %279
  %281 = fsub double %280, %276
  %282 = fsub double %279, %281
  %283 = fadd double %277, %282
  %284 = fadd double %280, %283
  %285 = fsub double %284, %280
  %286 = fsub double %283, %285
  %287 = sitofp i32 %241 to double
  %288 = fmul double %287, 0x3FE62E42FEFA39EF
  %289 = fneg double %288
  %290 = tail call double @llvm.fma.f64(double %287, double 0x3FE62E42FEFA39EF, double %289)
  %291 = tail call double @llvm.fma.f64(double %287, double 0x3C7ABC9E3B39803F, double %290)
  %292 = fadd double %288, %291
  %293 = fsub double %292, %288
  %294 = fsub double %291, %293
  %295 = fadd double %292, %284
  %296 = fsub double %295, %292
  %297 = fsub double %295, %296
  %298 = fsub double %292, %297
  %299 = fsub double %284, %296
  %300 = fadd double %299, %298
  %301 = fadd double %294, %286
  %302 = fsub double %301, %294
  %303 = fsub double %301, %302
  %304 = fsub double %294, %303
  %305 = fsub double %286, %302
  %306 = fadd double %305, %304
  %307 = fadd double %301, %300
  %308 = fadd double %295, %307
  %309 = fsub double %308, %295
  %310 = fsub double %307, %309
  %311 = fadd double %306, %310
  %312 = fadd double %308, %311
  %313 = tail call double @llvm.fabs.f64(double %232) #3
  %314 = fcmp oeq double %313, 0x7FF0000000000000
  %315 = select i1 %314, double %232, double %312
  %316 = fcmp olt double %232, 0.000000e+00
  %317 = select i1 %316, double 0x7FF8000000000000, double %315
  %318 = fcmp oeq double %232, 0.000000e+00
  %319 = select i1 %318, double 0xFFF0000000000000, double %317
  %320 = fmul contract double %234, 0x3FA5555555555555
  %321 = fadd contract double %320, %319
  %322 = fmul contract double %235, 0x3F7DDDDDDDDDDDDE
  %323 = fsub contract double %321, %322
  %324 = fmul contract double %235, 0x3F6F7DF7DF7DF7DF
  %325 = fmul contract double %234, %324
  %326 = fadd contract double %325, %323
  %327 = fmul contract double %235, 0x3F70EEEEEEEEEEEF
  %328 = fmul contract double %235, %327
  %329 = fsub contract double %326, %328
  %330 = fadd contract double %230, %329
  %331 = tail call double @llvm.amdgcn.frexp.mant.f64(double %20)
  %332 = fcmp olt double %331, 0x3FE5555555555555
  %333 = zext i1 %332 to i32
  %334 = tail call double @llvm.amdgcn.ldexp.f64(double %331, i32 %333)
  %335 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %20)
  %336 = sub nsw i32 %335, %333
  %337 = fadd double %334, -1.000000e+00
  %338 = fadd double %334, 1.000000e+00
  %339 = fadd double %338, -1.000000e+00
  %340 = fsub double %334, %339
  %341 = tail call double @llvm.amdgcn.rcp.f64(double %338)
  %342 = fneg double %338
  %343 = tail call double @llvm.fma.f64(double %342, double %341, double 1.000000e+00)
  %344 = tail call double @llvm.fma.f64(double %343, double %341, double %341)
  %345 = tail call double @llvm.fma.f64(double %342, double %344, double 1.000000e+00)
  %346 = tail call double @llvm.fma.f64(double %345, double %344, double %344)
  %347 = fmul double %337, %346
  %348 = fmul double %338, %347
  %349 = fneg double %348
  %350 = tail call double @llvm.fma.f64(double %347, double %338, double %349)
  %351 = tail call double @llvm.fma.f64(double %347, double %340, double %350)
  %352 = fadd double %348, %351
  %353 = fsub double %352, %348
  %354 = fsub double %351, %353
  %355 = fsub double %337, %352
  %356 = fsub double %337, %355
  %357 = fsub double %356, %352
  %358 = fsub double %357, %354
  %359 = fadd double %355, %358
  %360 = fmul double %346, %359
  %361 = fadd double %347, %360
  %362 = fsub double %361, %347
  %363 = fsub double %360, %362
  %364 = fmul double %361, %361
  %365 = tail call double @llvm.fma.f64(double %364, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %366 = tail call double @llvm.fma.f64(double %364, double %365, double 0x3FC7474DD7F4DF2E)
  %367 = tail call double @llvm.fma.f64(double %364, double %366, double 0x3FCC71C016291751)
  %368 = tail call double @llvm.fma.f64(double %364, double %367, double 0x3FD249249B27ACF1)
  %369 = tail call double @llvm.fma.f64(double %364, double %368, double 0x3FD99999998EF7B6)
  %370 = tail call double @llvm.fma.f64(double %364, double %369, double 0x3FE5555555555780)
  %371 = tail call double @llvm.amdgcn.ldexp.f64(double %361, i32 1)
  %372 = tail call double @llvm.amdgcn.ldexp.f64(double %363, i32 1)
  %373 = fmul double %361, %364
  %374 = fmul double %373, %370
  %375 = fadd double %371, %374
  %376 = fsub double %375, %371
  %377 = fsub double %374, %376
  %378 = fadd double %372, %377
  %379 = fadd double %375, %378
  %380 = fsub double %379, %375
  %381 = fsub double %378, %380
  %382 = sitofp i32 %336 to double
  %383 = fmul double %382, 0x3FE62E42FEFA39EF
  %384 = fneg double %383
  %385 = tail call double @llvm.fma.f64(double %382, double 0x3FE62E42FEFA39EF, double %384)
  %386 = tail call double @llvm.fma.f64(double %382, double 0x3C7ABC9E3B39803F, double %385)
  %387 = fadd double %383, %386
  %388 = fsub double %387, %383
  %389 = fsub double %386, %388
  %390 = fadd double %387, %379
  %391 = fsub double %390, %387
  %392 = fsub double %390, %391
  %393 = fsub double %387, %392
  %394 = fsub double %379, %391
  %395 = fadd double %394, %393
  %396 = fadd double %389, %381
  %397 = fsub double %396, %389
  %398 = fsub double %396, %397
  %399 = fsub double %389, %398
  %400 = fsub double %381, %397
  %401 = fadd double %400, %399
  %402 = fadd double %396, %395
  %403 = fadd double %390, %402
  %404 = fsub double %403, %390
  %405 = fsub double %402, %404
  %406 = fadd double %401, %405
  %407 = fadd double %403, %406
  %408 = tail call double @llvm.fabs.f64(double %20) #3
  %409 = fcmp oeq double %408, 0x7FF0000000000000
  %410 = select i1 %409, double %20, double %407
  %411 = fcmp olt double %20, 0.000000e+00
  %412 = select i1 %411, double 0x7FF8000000000000, double %410
  %413 = fcmp oeq double %20, 0.000000e+00
  %414 = select i1 %413, double 0xFFF0000000000000, double %412
  %415 = fsub contract double %414, %330
  %416 = fadd contract double %218, %415
  %417 = fsub contract double 1.000000e+00, %1
  %418 = fadd contract double %417, %416
  store double %418, double addrspace(1)* %220, align 8, !tbaa !9
  br label %419

419:                                              ; preds = %229, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
