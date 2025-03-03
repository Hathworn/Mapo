; ModuleID = '../data/hip_kernels/1/11/main.cu'
source_filename = "../data/hip_kernels/1/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21minkowski_kernel_samePKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21minkowski_kernel_samePKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %11, %13
  %16 = icmp ult i64 %12, %2
  %17 = select i1 %15, i1 %16, i1 false
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %21, label %25

21:                                               ; preds = %10
  %22 = mul i64 %14, %8
  %23 = add i64 %22, %12
  %24 = getelementptr inbounds float, float addrspace(1)* %7, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !4
  br label %25

25:                                               ; preds = %21, %10
  %26 = icmp ult i64 %14, %2
  %27 = icmp ult i32 %11, %13
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %473

29:                                               ; preds = %25
  %30 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21minkowski_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !4
  %31 = zext i32 %18 to i64
  %32 = icmp ult i64 %31, %6
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %50

35:                                               ; preds = %29
  %36 = mul i64 %12, %1
  %37 = mul i64 %14, %1
  %38 = tail call float @llvm.fabs.f32(float %9)
  %39 = fcmp oeq float %38, 0x7FF0000000000000
  %40 = bitcast float %9 to i32
  %41 = fcmp olt float %9, 0.000000e+00
  %42 = fcmp oeq float %9, 0.000000e+00
  %43 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr i8, i8 addrspace(4)* %43, i64 4
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 4, !range !8, !invariant.load !9
  %47 = zext i16 %46 to i64
  br i1 %39, label %227, label %59

48:                                               ; preds = %59, %227
  %49 = phi float [ %256, %227 ], [ %224, %59 ]
  store float %49, float addrspace(3)* %30, align 4, !tbaa !4
  br label %50

50:                                               ; preds = %33, %48
  %51 = phi i8 addrspace(4)* [ %34, %33 ], [ %43, %48 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = getelementptr i8, i8 addrspace(4)* %51, i64 4
  %53 = bitcast i8 addrspace(4)* %52 to i16 addrspace(4)*
  %54 = load i16, i16 addrspace(4)* %53, align 4, !range !8, !invariant.load !9
  %55 = icmp ult i16 %54, 2
  br i1 %55, label %259, label %56

56:                                               ; preds = %50
  %57 = lshr i16 %54, 1
  %58 = zext i16 %57 to i64
  br label %260

59:                                               ; preds = %35, %59
  %60 = phi float [ %224, %59 ], [ 0.000000e+00, %35 ]
  %61 = phi i64 [ %225, %59 ], [ %31, %35 ]
  %62 = add i64 %61, %36
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4
  %65 = add i64 %61, %37
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !4
  %68 = fsub contract float %64, %67
  %69 = tail call float @llvm.fabs.f32(float %68)
  %70 = tail call float @llvm.amdgcn.frexp.mant.f32(float %69)
  %71 = fcmp olt float %70, 0x3FE5555560000000
  %72 = zext i1 %71 to i32
  %73 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 %72)
  %74 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %69)
  %75 = sub nsw i32 %74, %72
  %76 = fadd float %73, -1.000000e+00
  %77 = fadd float %73, 1.000000e+00
  %78 = fadd float %77, -1.000000e+00
  %79 = fsub float %73, %78
  %80 = tail call float @llvm.amdgcn.rcp.f32(float %77)
  %81 = fmul float %76, %80
  %82 = fmul float %77, %81
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %81, float %77, float %83)
  %85 = tail call float @llvm.fma.f32(float %81, float %79, float %84)
  %86 = fadd float %82, %85
  %87 = fsub float %86, %82
  %88 = fsub float %85, %87
  %89 = fsub float %76, %86
  %90 = fsub float %76, %89
  %91 = fsub float %90, %86
  %92 = fsub float %91, %88
  %93 = fadd float %89, %92
  %94 = fmul float %80, %93
  %95 = fadd float %81, %94
  %96 = fsub float %95, %81
  %97 = fsub float %94, %96
  %98 = fmul float %95, %95
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %95, float %95, float %99)
  %101 = fmul float %97, 2.000000e+00
  %102 = tail call float @llvm.fma.f32(float %95, float %101, float %100)
  %103 = fadd float %98, %102
  %104 = fsub float %103, %98
  %105 = fsub float %102, %104
  %106 = tail call float @llvm.fmuladd.f32(float %103, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %107 = tail call float @llvm.fmuladd.f32(float %103, float %106, float 0x3FD999BDE0000000)
  %108 = sitofp i32 %75 to float
  %109 = fmul float %108, 0x3FE62E4300000000
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %108, float 0x3FE62E4300000000, float %110)
  %112 = tail call float @llvm.fma.f32(float %108, float 0xBE205C6100000000, float %111)
  %113 = fadd float %109, %112
  %114 = fsub float %113, %109
  %115 = fsub float %112, %114
  %116 = tail call float @llvm.amdgcn.ldexp.f32(float %95, i32 1)
  %117 = fmul float %95, %103
  %118 = fneg float %117
  %119 = tail call float @llvm.fma.f32(float %103, float %95, float %118)
  %120 = tail call float @llvm.fma.f32(float %103, float %97, float %119)
  %121 = tail call float @llvm.fma.f32(float %105, float %95, float %120)
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = fmul float %103, %107
  %126 = fneg float %125
  %127 = tail call float @llvm.fma.f32(float %103, float %107, float %126)
  %128 = tail call float @llvm.fma.f32(float %105, float %107, float %127)
  %129 = fadd float %125, %128
  %130 = fsub float %129, %125
  %131 = fsub float %128, %130
  %132 = fadd float %129, 0x3FE5555540000000
  %133 = fadd float %132, 0xBFE5555540000000
  %134 = fsub float %129, %133
  %135 = fadd float %131, 0x3E2E720200000000
  %136 = fadd float %135, %134
  %137 = fadd float %132, %136
  %138 = fsub float %137, %132
  %139 = fsub float %136, %138
  %140 = fmul float %122, %137
  %141 = fneg float %140
  %142 = tail call float @llvm.fma.f32(float %122, float %137, float %141)
  %143 = tail call float @llvm.fma.f32(float %122, float %139, float %142)
  %144 = tail call float @llvm.fma.f32(float %124, float %137, float %143)
  %145 = tail call float @llvm.amdgcn.ldexp.f32(float %97, i32 1)
  %146 = fadd float %140, %144
  %147 = fsub float %146, %140
  %148 = fsub float %144, %147
  %149 = fadd float %116, %146
  %150 = fsub float %149, %116
  %151 = fsub float %146, %150
  %152 = fadd float %145, %148
  %153 = fadd float %152, %151
  %154 = fadd float %149, %153
  %155 = fsub float %154, %149
  %156 = fsub float %153, %155
  %157 = fadd float %113, %154
  %158 = fsub float %157, %113
  %159 = fsub float %157, %158
  %160 = fsub float %113, %159
  %161 = fsub float %154, %158
  %162 = fadd float %161, %160
  %163 = fadd float %115, %156
  %164 = fsub float %163, %115
  %165 = fsub float %163, %164
  %166 = fsub float %115, %165
  %167 = fsub float %156, %164
  %168 = fadd float %167, %166
  %169 = fadd float %163, %162
  %170 = fadd float %157, %169
  %171 = fsub float %170, %157
  %172 = fsub float %169, %171
  %173 = fadd float %168, %172
  %174 = fadd float %170, %173
  %175 = fsub float %174, %170
  %176 = fsub float %173, %175
  %177 = fmul float %174, %9
  %178 = fneg float %177
  %179 = tail call float @llvm.fma.f32(float %9, float %174, float %178)
  %180 = tail call float @llvm.fma.f32(float %9, float %176, float %179)
  %181 = fadd float %177, %180
  %182 = fsub float %181, %177
  %183 = fsub float %180, %182
  %184 = tail call float @llvm.fabs.f32(float %177) #4
  %185 = fcmp oeq float %184, 0x7FF0000000000000
  %186 = select i1 %185, float %177, float %181
  %187 = tail call float @llvm.fabs.f32(float %186) #4
  %188 = fcmp oeq float %187, 0x7FF0000000000000
  %189 = select i1 %188, float 0.000000e+00, float %183
  %190 = fcmp oeq float %186, 0x40562E4300000000
  %191 = select i1 %190, float 0x3EE0000000000000, float 0.000000e+00
  %192 = fsub float %186, %191
  %193 = fadd float %191, %189
  %194 = fmul float %192, 0x3FF7154760000000
  %195 = tail call float @llvm.rint.f32(float %194)
  %196 = fcmp ogt float %192, 0x40562E4300000000
  %197 = fcmp olt float %192, 0xC059D1DA00000000
  %198 = fneg float %194
  %199 = tail call float @llvm.fma.f32(float %192, float 0x3FF7154760000000, float %198)
  %200 = tail call float @llvm.fma.f32(float %192, float 0x3E54AE0BE0000000, float %199)
  %201 = fsub float %194, %195
  %202 = fadd float %200, %201
  %203 = tail call float @llvm.exp2.f32(float %202)
  %204 = fptosi float %195 to i32
  %205 = tail call float @llvm.amdgcn.ldexp.f32(float %203, i32 %204)
  %206 = select i1 %197, float 0.000000e+00, float %205
  %207 = select i1 %196, float 0x7FF0000000000000, float %206
  %208 = tail call float @llvm.fma.f32(float %207, float %193, float %207)
  %209 = tail call float @llvm.fabs.f32(float %207) #4
  %210 = fcmp oeq float %209, 0x7FF0000000000000
  %211 = select i1 %210, float %207, float %208
  %212 = tail call float @llvm.fabs.f32(float %211)
  %213 = fcmp oeq float %69, 0x7FF0000000000000
  %214 = fcmp oeq float %68, 0.000000e+00
  %215 = or i1 %214, %213
  %216 = xor i1 %41, %214
  %217 = select i1 %216, float 0.000000e+00, float 0x7FF0000000000000
  %218 = select i1 %215, float %217, float %212
  %219 = fcmp uno float %69, %9
  %220 = select i1 %219, float 0x7FF8000000000000, float %218
  %221 = fcmp oeq float %69, 1.000000e+00
  %222 = or i1 %42, %221
  %223 = select i1 %222, float 1.000000e+00, float %220
  %224 = fadd contract float %60, %223
  %225 = add i64 %61, %47
  %226 = icmp ult i64 %225, %6
  br i1 %226, label %59, label %48, !llvm.loop !10

227:                                              ; preds = %35, %227
  %228 = phi float [ %256, %227 ], [ 0.000000e+00, %35 ]
  %229 = phi i64 [ %257, %227 ], [ %31, %35 ]
  %230 = add i64 %229, %36
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !4
  %233 = add i64 %229, %37
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !4
  %236 = fsub contract float %232, %235
  %237 = tail call float @llvm.fabs.f32(float %236)
  %238 = fcmp oeq float %237, 1.000000e+00
  %239 = fadd float %237, -1.000000e+00
  %240 = bitcast float %239 to i32
  %241 = xor i32 %240, %40
  %242 = icmp sgt i32 %241, -1
  %243 = select i1 %242, float 0x7FF0000000000000, float 0.000000e+00
  %244 = select i1 %238, float %237, float %243
  %245 = fcmp oeq float %237, 0x7FF0000000000000
  %246 = fcmp oeq float %236, 0.000000e+00
  %247 = or i1 %246, %245
  %248 = xor i1 %41, %246
  %249 = select i1 %248, float 0.000000e+00, float 0x7FF0000000000000
  %250 = select i1 %247, float %249, float %244
  %251 = fcmp uno float %237, %9
  %252 = select i1 %251, float 0x7FF8000000000000, float %250
  %253 = fcmp oeq float %237, 1.000000e+00
  %254 = or i1 %42, %253
  %255 = select i1 %254, float 1.000000e+00, float %252
  %256 = fadd contract float %228, %255
  %257 = add i64 %229, %47
  %258 = icmp ult i64 %257, %6
  br i1 %258, label %227, label %48, !llvm.loop !10

259:                                              ; preds = %270, %50
  br i1 %19, label %273, label %473

260:                                              ; preds = %56, %270
  %261 = phi i64 [ %271, %270 ], [ %58, %56 ]
  %262 = icmp ugt i64 %261, %31
  br i1 %262, label %263, label %270

263:                                              ; preds = %260
  %264 = trunc i64 %261 to i32
  %265 = add nuw nsw i32 %18, %264
  %266 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21minkowski_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %265
  %267 = load float, float addrspace(3)* %266, align 4, !tbaa !4
  %268 = load float, float addrspace(3)* %30, align 4, !tbaa !4
  %269 = fadd contract float %267, %268
  store float %269, float addrspace(3)* %30, align 4, !tbaa !4
  br label %270

270:                                              ; preds = %263, %260
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %271 = lshr i64 %261, 1
  %272 = icmp ult i64 %261, 2
  br i1 %272, label %259, label %260, !llvm.loop !12

273:                                              ; preds = %259
  %274 = fdiv contract float 1.000000e+00, %9
  %275 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ21minkowski_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !4
  %276 = tail call float @llvm.fabs.f32(float %275)
  %277 = tail call float @llvm.amdgcn.frexp.mant.f32(float %276)
  %278 = fcmp olt float %277, 0x3FE5555560000000
  %279 = zext i1 %278 to i32
  %280 = tail call float @llvm.amdgcn.ldexp.f32(float %277, i32 %279)
  %281 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %276)
  %282 = sub nsw i32 %281, %279
  %283 = fadd float %280, -1.000000e+00
  %284 = fadd float %280, 1.000000e+00
  %285 = fadd float %284, -1.000000e+00
  %286 = fsub float %280, %285
  %287 = tail call float @llvm.amdgcn.rcp.f32(float %284)
  %288 = fmul float %283, %287
  %289 = fmul float %284, %288
  %290 = fneg float %289
  %291 = tail call float @llvm.fma.f32(float %288, float %284, float %290)
  %292 = tail call float @llvm.fma.f32(float %288, float %286, float %291)
  %293 = fadd float %289, %292
  %294 = fsub float %293, %289
  %295 = fsub float %292, %294
  %296 = fsub float %283, %293
  %297 = fsub float %283, %296
  %298 = fsub float %297, %293
  %299 = fsub float %298, %295
  %300 = fadd float %296, %299
  %301 = fmul float %287, %300
  %302 = fadd float %288, %301
  %303 = fsub float %302, %288
  %304 = fsub float %301, %303
  %305 = fmul float %302, %302
  %306 = fneg float %305
  %307 = tail call float @llvm.fma.f32(float %302, float %302, float %306)
  %308 = fmul float %304, 2.000000e+00
  %309 = tail call float @llvm.fma.f32(float %302, float %308, float %307)
  %310 = fadd float %305, %309
  %311 = fsub float %310, %305
  %312 = fsub float %309, %311
  %313 = tail call float @llvm.fmuladd.f32(float %310, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %314 = tail call float @llvm.fmuladd.f32(float %310, float %313, float 0x3FD999BDE0000000)
  %315 = sitofp i32 %282 to float
  %316 = fmul float %315, 0x3FE62E4300000000
  %317 = fneg float %316
  %318 = tail call float @llvm.fma.f32(float %315, float 0x3FE62E4300000000, float %317)
  %319 = tail call float @llvm.fma.f32(float %315, float 0xBE205C6100000000, float %318)
  %320 = fadd float %316, %319
  %321 = fsub float %320, %316
  %322 = fsub float %319, %321
  %323 = tail call float @llvm.amdgcn.ldexp.f32(float %302, i32 1)
  %324 = fmul float %302, %310
  %325 = fneg float %324
  %326 = tail call float @llvm.fma.f32(float %310, float %302, float %325)
  %327 = tail call float @llvm.fma.f32(float %310, float %304, float %326)
  %328 = tail call float @llvm.fma.f32(float %312, float %302, float %327)
  %329 = fadd float %324, %328
  %330 = fsub float %329, %324
  %331 = fsub float %328, %330
  %332 = fmul float %310, %314
  %333 = fneg float %332
  %334 = tail call float @llvm.fma.f32(float %310, float %314, float %333)
  %335 = tail call float @llvm.fma.f32(float %312, float %314, float %334)
  %336 = fadd float %332, %335
  %337 = fsub float %336, %332
  %338 = fsub float %335, %337
  %339 = fadd float %336, 0x3FE5555540000000
  %340 = fadd float %339, 0xBFE5555540000000
  %341 = fsub float %336, %340
  %342 = fadd float %338, 0x3E2E720200000000
  %343 = fadd float %342, %341
  %344 = fadd float %339, %343
  %345 = fsub float %344, %339
  %346 = fsub float %343, %345
  %347 = fmul float %329, %344
  %348 = fneg float %347
  %349 = tail call float @llvm.fma.f32(float %329, float %344, float %348)
  %350 = tail call float @llvm.fma.f32(float %329, float %346, float %349)
  %351 = tail call float @llvm.fma.f32(float %331, float %344, float %350)
  %352 = tail call float @llvm.amdgcn.ldexp.f32(float %304, i32 1)
  %353 = fadd float %347, %351
  %354 = fsub float %353, %347
  %355 = fsub float %351, %354
  %356 = fadd float %323, %353
  %357 = fsub float %356, %323
  %358 = fsub float %353, %357
  %359 = fadd float %352, %355
  %360 = fadd float %359, %358
  %361 = fadd float %356, %360
  %362 = fsub float %361, %356
  %363 = fsub float %360, %362
  %364 = fadd float %320, %361
  %365 = fsub float %364, %320
  %366 = fsub float %364, %365
  %367 = fsub float %320, %366
  %368 = fsub float %361, %365
  %369 = fadd float %368, %367
  %370 = fadd float %322, %363
  %371 = fsub float %370, %322
  %372 = fsub float %370, %371
  %373 = fsub float %322, %372
  %374 = fsub float %363, %371
  %375 = fadd float %374, %373
  %376 = fadd float %370, %369
  %377 = fadd float %364, %376
  %378 = fsub float %377, %364
  %379 = fsub float %376, %378
  %380 = fadd float %375, %379
  %381 = fadd float %377, %380
  %382 = fsub float %381, %377
  %383 = fsub float %380, %382
  %384 = fmul float %274, %381
  %385 = fneg float %384
  %386 = tail call float @llvm.fma.f32(float %274, float %381, float %385)
  %387 = tail call float @llvm.fma.f32(float %274, float %383, float %386)
  %388 = fadd float %384, %387
  %389 = fsub float %388, %384
  %390 = fsub float %387, %389
  %391 = tail call float @llvm.fabs.f32(float %384) #4
  %392 = fcmp oeq float %391, 0x7FF0000000000000
  %393 = select i1 %392, float %384, float %388
  %394 = tail call float @llvm.fabs.f32(float %393) #4
  %395 = fcmp oeq float %394, 0x7FF0000000000000
  %396 = select i1 %395, float 0.000000e+00, float %390
  %397 = fcmp oeq float %393, 0x40562E4300000000
  %398 = select i1 %397, float 0x3EE0000000000000, float 0.000000e+00
  %399 = fsub float %393, %398
  %400 = fadd float %398, %396
  %401 = fmul float %399, 0x3FF7154760000000
  %402 = tail call float @llvm.rint.f32(float %401)
  %403 = fcmp ogt float %399, 0x40562E4300000000
  %404 = fcmp olt float %399, 0xC059D1DA00000000
  %405 = fneg float %401
  %406 = tail call float @llvm.fma.f32(float %399, float 0x3FF7154760000000, float %405)
  %407 = tail call float @llvm.fma.f32(float %399, float 0x3E54AE0BE0000000, float %406)
  %408 = fsub float %401, %402
  %409 = fadd float %407, %408
  %410 = tail call float @llvm.exp2.f32(float %409)
  %411 = fptosi float %402 to i32
  %412 = tail call float @llvm.amdgcn.ldexp.f32(float %410, i32 %411)
  %413 = select i1 %404, float 0.000000e+00, float %412
  %414 = select i1 %403, float 0x7FF0000000000000, float %413
  %415 = tail call float @llvm.fma.f32(float %414, float %400, float %414)
  %416 = tail call float @llvm.fabs.f32(float %414) #4
  %417 = fcmp oeq float %416, 0x7FF0000000000000
  %418 = select i1 %417, float %414, float %415
  %419 = tail call float @llvm.fabs.f32(float %274)
  %420 = tail call float @llvm.trunc.f32(float %419)
  %421 = fcmp oeq float %419, %420
  %422 = zext i1 %421 to i32
  %423 = fmul float %420, 5.000000e-01
  %424 = tail call float @llvm.amdgcn.fract.f32(float %423)
  %425 = tail call i1 @llvm.amdgcn.class.f32(float %423, i32 516)
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp oeq float %426, 0.000000e+00
  %428 = and i1 %421, %427
  %429 = zext i1 %428 to i32
  %430 = add nuw nsw i32 %429, %422
  %431 = icmp eq i32 %430, 1
  %432 = fcmp olt float %275, 0.000000e+00
  %433 = and i1 %431, %432
  %434 = select i1 %433, float -0.000000e+00, float 0.000000e+00
  %435 = tail call float @llvm.copysign.f32(float %418, float %434)
  %436 = fcmp uge float %275, 0.000000e+00
  %437 = icmp ne i32 %430, 0
  %438 = select i1 %436, i1 true, i1 %437
  %439 = select i1 %438, float %435, float 0x7FF8000000000000
  %440 = fcmp oeq float %419, 0x7FF0000000000000
  br i1 %440, label %441, label %450

441:                                              ; preds = %273
  %442 = fcmp oeq float %276, 1.000000e+00
  %443 = fadd float %276, -1.000000e+00
  %444 = bitcast float %274 to i32
  %445 = bitcast float %443 to i32
  %446 = xor i32 %445, %444
  %447 = icmp sgt i32 %446, -1
  %448 = select i1 %447, float 0x7FF0000000000000, float 0.000000e+00
  %449 = select i1 %442, float %276, float %448
  br label %450

450:                                              ; preds = %273, %441
  %451 = phi float [ %439, %273 ], [ %449, %441 ]
  %452 = fcmp oeq float %276, 0x7FF0000000000000
  %453 = fcmp oeq float %275, 0.000000e+00
  %454 = or i1 %453, %452
  %455 = fcmp olt float %274, 0.000000e+00
  %456 = xor i1 %455, %453
  %457 = select i1 %456, float 0.000000e+00, float 0x7FF0000000000000
  %458 = select i1 %431, float %275, float 0.000000e+00
  %459 = tail call float @llvm.copysign.f32(float %457, float %458)
  %460 = select i1 %454, float %459, float %451
  %461 = fcmp uno float %275, %274
  %462 = select i1 %461, float 0x7FF8000000000000, float %460
  %463 = fcmp oeq float %275, 1.000000e+00
  %464 = fcmp oeq float %274, 0.000000e+00
  %465 = or i1 %464, %463
  %466 = select i1 %465, float 1.000000e+00, float %462
  %467 = mul i64 %14, %8
  %468 = add i64 %467, %12
  %469 = getelementptr inbounds float, float addrspace(1)* %7, i64 %468
  store float %466, float addrspace(1)* %469, align 4, !tbaa !4
  %470 = mul i64 %12, %8
  %471 = add i64 %470, %14
  %472 = getelementptr inbounds float, float addrspace(1)* %7, i64 %471
  store float %466, float addrspace(1)* %472, align 4, !tbaa !4
  br label %473

473:                                              ; preds = %259, %450, %25
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
