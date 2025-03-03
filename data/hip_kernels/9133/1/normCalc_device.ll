; ModuleID = '../data/hip_kernels/9133/1/main.cu'
source_filename = "../data/hip_kernels/9133/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8normCalcPfS_iE2mu = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ8normCalcPfS_iE5sigma = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8normCalcPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %463

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %115

16:                                               ; preds = %14
  %17 = mul nsw i32 %12, %2
  %18 = add i32 %2, -1
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %18, 7
  br i1 %20, label %93, label %21

21:                                               ; preds = %16
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %90, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %89, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %91, %23 ]
  %27 = add nsw i32 %24, %17
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = sitofp i32 %25 to float
  %32 = fadd contract float %30, %31
  %33 = fptosi float %32 to i32
  %34 = or i32 %24, 1
  %35 = add nsw i32 %34, %17
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = sitofp i32 %33 to float
  %40 = fadd contract float %38, %39
  %41 = fptosi float %40 to i32
  %42 = or i32 %24, 2
  %43 = add nsw i32 %42, %17
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = sitofp i32 %41 to float
  %48 = fadd contract float %46, %47
  %49 = fptosi float %48 to i32
  %50 = or i32 %24, 3
  %51 = add nsw i32 %50, %17
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = sitofp i32 %49 to float
  %56 = fadd contract float %54, %55
  %57 = fptosi float %56 to i32
  %58 = or i32 %24, 4
  %59 = add nsw i32 %58, %17
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = sitofp i32 %57 to float
  %64 = fadd contract float %62, %63
  %65 = fptosi float %64 to i32
  %66 = or i32 %24, 5
  %67 = add nsw i32 %66, %17
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = sitofp i32 %65 to float
  %72 = fadd contract float %70, %71
  %73 = fptosi float %72 to i32
  %74 = or i32 %24, 6
  %75 = add nsw i32 %74, %17
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = sitofp i32 %73 to float
  %80 = fadd contract float %78, %79
  %81 = fptosi float %80 to i32
  %82 = or i32 %24, 7
  %83 = add nsw i32 %82, %17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = sitofp i32 %81 to float
  %88 = fadd contract float %86, %87
  %89 = fptosi float %88 to i32
  %90 = add nuw nsw i32 %24, 8
  %91 = add i32 %26, 8
  %92 = icmp eq i32 %91, %22
  br i1 %92, label %93, label %23, !llvm.loop !11

93:                                               ; preds = %23, %16
  %94 = phi i32 [ undef, %16 ], [ %89, %23 ]
  %95 = phi i32 [ 0, %16 ], [ %90, %23 ]
  %96 = phi i32 [ 0, %16 ], [ %89, %23 ]
  %97 = icmp eq i32 %19, 0
  br i1 %97, label %112, label %98

98:                                               ; preds = %93, %98
  %99 = phi i32 [ %109, %98 ], [ %95, %93 ]
  %100 = phi i32 [ %108, %98 ], [ %96, %93 ]
  %101 = phi i32 [ %110, %98 ], [ 0, %93 ]
  %102 = add nsw i32 %99, %17
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = sitofp i32 %100 to float
  %107 = fadd contract float %105, %106
  %108 = fptosi float %107 to i32
  %109 = add nuw nsw i32 %99, 1
  %110 = add i32 %101, 1
  %111 = icmp eq i32 %110, %19
  br i1 %111, label %112, label %98, !llvm.loop !13

112:                                              ; preds = %98, %93
  %113 = phi i32 [ %94, %93 ], [ %108, %98 ]
  %114 = sitofp i32 %113 to float
  br label %115

115:                                              ; preds = %112, %14
  %116 = phi float [ %114, %112 ], [ 0.000000e+00, %14 ]
  %117 = sitofp i32 %2 to float
  %118 = fdiv contract float %116, %117
  %119 = fptosi float %118 to i32
  store i32 %119, i32 addrspace(3)* @_ZZ8normCalcPfS_iE2mu, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %120, label %291

120:                                              ; preds = %115
  %121 = mul nsw i32 %12, %2
  %122 = load i32, i32 addrspace(3)* @_ZZ8normCalcPfS_iE2mu, align 4, !tbaa !15
  %123 = sitofp i32 %122 to float
  br label %124

124:                                              ; preds = %120, %124
  %125 = phi i32 [ 0, %120 ], [ %287, %124 ]
  %126 = phi i32 [ 0, %120 ], [ %286, %124 ]
  %127 = add nsw i32 %125, %121
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fsub contract float %130, %123
  %132 = tail call float @llvm.fabs.f32(float %131)
  %133 = tail call float @llvm.amdgcn.frexp.mant.f32(float %132)
  %134 = fcmp olt float %133, 0x3FE5555560000000
  %135 = zext i1 %134 to i32
  %136 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 %135)
  %137 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %132)
  %138 = sub nsw i32 %137, %135
  %139 = fadd float %136, -1.000000e+00
  %140 = fadd float %136, 1.000000e+00
  %141 = fadd float %140, -1.000000e+00
  %142 = fsub float %136, %141
  %143 = tail call float @llvm.amdgcn.rcp.f32(float %140)
  %144 = fmul float %139, %143
  %145 = fmul float %140, %144
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %144, float %140, float %146)
  %148 = tail call float @llvm.fma.f32(float %144, float %142, float %147)
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = fsub float %139, %149
  %153 = fsub float %139, %152
  %154 = fsub float %153, %149
  %155 = fsub float %154, %151
  %156 = fadd float %152, %155
  %157 = fmul float %143, %156
  %158 = fadd float %144, %157
  %159 = fsub float %158, %144
  %160 = fsub float %157, %159
  %161 = fmul float %158, %158
  %162 = fneg float %161
  %163 = tail call float @llvm.fma.f32(float %158, float %158, float %162)
  %164 = fmul float %160, 2.000000e+00
  %165 = tail call float @llvm.fma.f32(float %158, float %164, float %163)
  %166 = fadd float %161, %165
  %167 = fsub float %166, %161
  %168 = fsub float %165, %167
  %169 = tail call float @llvm.fmuladd.f32(float %166, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %170 = tail call float @llvm.fmuladd.f32(float %166, float %169, float 0x3FD999BDE0000000)
  %171 = sitofp i32 %138 to float
  %172 = fmul float %171, 0x3FE62E4300000000
  %173 = fneg float %172
  %174 = tail call float @llvm.fma.f32(float %171, float 0x3FE62E4300000000, float %173)
  %175 = tail call float @llvm.fma.f32(float %171, float 0xBE205C6100000000, float %174)
  %176 = fadd float %172, %175
  %177 = fsub float %176, %172
  %178 = fsub float %175, %177
  %179 = tail call float @llvm.amdgcn.ldexp.f32(float %158, i32 1)
  %180 = fmul float %158, %166
  %181 = fneg float %180
  %182 = tail call float @llvm.fma.f32(float %166, float %158, float %181)
  %183 = tail call float @llvm.fma.f32(float %166, float %160, float %182)
  %184 = tail call float @llvm.fma.f32(float %168, float %158, float %183)
  %185 = fadd float %180, %184
  %186 = fsub float %185, %180
  %187 = fsub float %184, %186
  %188 = fmul float %166, %170
  %189 = fneg float %188
  %190 = tail call float @llvm.fma.f32(float %166, float %170, float %189)
  %191 = tail call float @llvm.fma.f32(float %168, float %170, float %190)
  %192 = fadd float %188, %191
  %193 = fsub float %192, %188
  %194 = fsub float %191, %193
  %195 = fadd float %192, 0x3FE5555540000000
  %196 = fadd float %195, 0xBFE5555540000000
  %197 = fsub float %192, %196
  %198 = fadd float %194, 0x3E2E720200000000
  %199 = fadd float %198, %197
  %200 = fadd float %195, %199
  %201 = fsub float %200, %195
  %202 = fsub float %199, %201
  %203 = fmul float %185, %200
  %204 = fneg float %203
  %205 = tail call float @llvm.fma.f32(float %185, float %200, float %204)
  %206 = tail call float @llvm.fma.f32(float %185, float %202, float %205)
  %207 = tail call float @llvm.fma.f32(float %187, float %200, float %206)
  %208 = tail call float @llvm.amdgcn.ldexp.f32(float %160, i32 1)
  %209 = fadd float %203, %207
  %210 = fsub float %209, %203
  %211 = fsub float %207, %210
  %212 = fadd float %179, %209
  %213 = fsub float %212, %179
  %214 = fsub float %209, %213
  %215 = fadd float %208, %211
  %216 = fadd float %215, %214
  %217 = fadd float %212, %216
  %218 = fsub float %217, %212
  %219 = fsub float %216, %218
  %220 = fadd float %176, %217
  %221 = fsub float %220, %176
  %222 = fsub float %220, %221
  %223 = fsub float %176, %222
  %224 = fsub float %217, %221
  %225 = fadd float %224, %223
  %226 = fadd float %178, %219
  %227 = fsub float %226, %178
  %228 = fsub float %226, %227
  %229 = fsub float %178, %228
  %230 = fsub float %219, %227
  %231 = fadd float %230, %229
  %232 = fadd float %226, %225
  %233 = fadd float %220, %232
  %234 = fsub float %233, %220
  %235 = fsub float %232, %234
  %236 = fadd float %231, %235
  %237 = fadd float %233, %236
  %238 = fsub float %237, %233
  %239 = fsub float %236, %238
  %240 = fmul float %237, 2.000000e+00
  %241 = fneg float %240
  %242 = tail call float @llvm.fma.f32(float %237, float 2.000000e+00, float %241)
  %243 = tail call float @llvm.fma.f32(float %239, float 2.000000e+00, float %242)
  %244 = fadd float %240, %243
  %245 = fsub float %244, %240
  %246 = fsub float %243, %245
  %247 = tail call float @llvm.fabs.f32(float %240) #4
  %248 = fcmp oeq float %247, 0x7FF0000000000000
  %249 = select i1 %248, float %240, float %244
  %250 = tail call float @llvm.fabs.f32(float %249) #4
  %251 = fcmp oeq float %250, 0x7FF0000000000000
  %252 = select i1 %251, float 0.000000e+00, float %246
  %253 = fcmp oeq float %249, 0x40562E4300000000
  %254 = select i1 %253, float 0x3EE0000000000000, float 0.000000e+00
  %255 = fsub float %249, %254
  %256 = fadd float %254, %252
  %257 = fmul float %255, 0x3FF7154760000000
  %258 = tail call float @llvm.rint.f32(float %257)
  %259 = fcmp ogt float %255, 0x40562E4300000000
  %260 = fcmp olt float %255, 0xC059D1DA00000000
  %261 = fneg float %257
  %262 = tail call float @llvm.fma.f32(float %255, float 0x3FF7154760000000, float %261)
  %263 = tail call float @llvm.fma.f32(float %255, float 0x3E54AE0BE0000000, float %262)
  %264 = fsub float %257, %258
  %265 = fadd float %263, %264
  %266 = tail call float @llvm.exp2.f32(float %265)
  %267 = fptosi float %258 to i32
  %268 = tail call float @llvm.amdgcn.ldexp.f32(float %266, i32 %267)
  %269 = select i1 %260, float 0.000000e+00, float %268
  %270 = select i1 %259, float 0x7FF0000000000000, float %269
  %271 = tail call float @llvm.fma.f32(float %270, float %256, float %270)
  %272 = tail call float @llvm.fabs.f32(float %270) #4
  %273 = fcmp oeq float %272, 0x7FF0000000000000
  %274 = select i1 %273, float %270, float %271
  %275 = tail call float @llvm.fabs.f32(float %274)
  %276 = fcmp oeq float %132, 0x7FF0000000000000
  %277 = fcmp oeq float %131, 0.000000e+00
  %278 = select i1 %276, float 0x7FF0000000000000, float %275
  %279 = select i1 %277, float 0.000000e+00, float %278
  %280 = fcmp uno float %131, 0.000000e+00
  %281 = select i1 %280, float 0x7FF8000000000000, float %279
  %282 = fcmp oeq float %131, 1.000000e+00
  %283 = select i1 %282, float 1.000000e+00, float %281
  %284 = sitofp i32 %126 to float
  %285 = fadd contract float %283, %284
  %286 = fptosi float %285 to i32
  %287 = add nuw nsw i32 %125, 1
  %288 = icmp eq i32 %287, %2
  br i1 %288, label %289, label %124, !llvm.loop !17

289:                                              ; preds = %124
  %290 = sitofp i32 %286 to float
  br label %291

291:                                              ; preds = %289, %115
  %292 = phi float [ %290, %289 ], [ 0.000000e+00, %115 ]
  %293 = fdiv contract float %292, %117
  %294 = fptosi float %293 to i32
  store i32 %294, i32 addrspace(3)* @_ZZ8normCalcPfS_iE5sigma, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %295 = load i32, i32 addrspace(3)* @_ZZ8normCalcPfS_iE5sigma, align 4, !tbaa !15
  %296 = sitofp i32 %295 to float
  %297 = icmp slt i32 %295, 1
  %298 = select i1 %297, float 0x41F0000000000000, float 1.000000e+00
  %299 = fmul float %298, %296
  %300 = tail call float @llvm.sqrt.f32(float %299)
  %301 = bitcast float %300 to i32
  %302 = add nsw i32 %301, -1
  %303 = bitcast i32 %302 to float
  %304 = add nsw i32 %301, 1
  %305 = bitcast i32 %304 to float
  %306 = tail call i1 @llvm.amdgcn.class.f32(float %299, i32 608)
  %307 = select i1 %297, float 0x3EF0000000000000, float 1.000000e+00
  %308 = fneg float %305
  %309 = tail call float @llvm.fma.f32(float %308, float %300, float %299)
  %310 = fcmp ogt float %309, 0.000000e+00
  %311 = fneg float %303
  %312 = tail call float @llvm.fma.f32(float %311, float %300, float %299)
  %313 = fcmp ole float %312, 0.000000e+00
  %314 = select i1 %313, float %303, float %300
  %315 = select i1 %310, float %305, float %314
  %316 = fmul float %307, %315
  %317 = select i1 %306, float %299, float %316
  %318 = fptosi float %317 to i32
  store i32 %318, i32 addrspace(3)* @_ZZ8normCalcPfS_iE5sigma, align 4, !tbaa !15
  br i1 %15, label %319, label %463

319:                                              ; preds = %291
  %320 = icmp eq i32 %318, 0
  %321 = sitofp i32 %318 to float
  %322 = mul nsw i32 %12, %2
  %323 = load i32, i32 addrspace(3)* @_ZZ8normCalcPfS_iE2mu, align 4
  %324 = sitofp i32 %323 to float
  br i1 %320, label %325, label %331

325:                                              ; preds = %319
  %326 = add i32 %2, -1
  %327 = and i32 %2, 7
  %328 = icmp ult i32 %326, 7
  br i1 %328, label %450, label %329

329:                                              ; preds = %325
  %330 = and i32 %2, -8
  br label %337

331:                                              ; preds = %319
  %332 = add i32 %2, -1
  %333 = and i32 %2, 3
  %334 = icmp ult i32 %332, 3
  br i1 %334, label %431, label %335

335:                                              ; preds = %331
  %336 = and i32 %2, -4
  br label %382

337:                                              ; preds = %337, %329
  %338 = phi i32 [ 0, %329 ], [ %379, %337 ]
  %339 = phi i32 [ 0, %329 ], [ %380, %337 ]
  %340 = mul nsw i32 %338, %2
  %341 = add nsw i32 %340, %12
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %1, i64 %342
  store float 0.000000e+00, float addrspace(1)* %343, align 4, !tbaa !7
  %344 = or i32 %338, 1
  %345 = mul nsw i32 %344, %2
  %346 = add nsw i32 %345, %12
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %1, i64 %347
  store float 0.000000e+00, float addrspace(1)* %348, align 4, !tbaa !7
  %349 = or i32 %338, 2
  %350 = mul nsw i32 %349, %2
  %351 = add nsw i32 %350, %12
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds float, float addrspace(1)* %1, i64 %352
  store float 0.000000e+00, float addrspace(1)* %353, align 4, !tbaa !7
  %354 = or i32 %338, 3
  %355 = mul nsw i32 %354, %2
  %356 = add nsw i32 %355, %12
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %1, i64 %357
  store float 0.000000e+00, float addrspace(1)* %358, align 4, !tbaa !7
  %359 = or i32 %338, 4
  %360 = mul nsw i32 %359, %2
  %361 = add nsw i32 %360, %12
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %362
  store float 0.000000e+00, float addrspace(1)* %363, align 4, !tbaa !7
  %364 = or i32 %338, 5
  %365 = mul nsw i32 %364, %2
  %366 = add nsw i32 %365, %12
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds float, float addrspace(1)* %1, i64 %367
  store float 0.000000e+00, float addrspace(1)* %368, align 4, !tbaa !7
  %369 = or i32 %338, 6
  %370 = mul nsw i32 %369, %2
  %371 = add nsw i32 %370, %12
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %1, i64 %372
  store float 0.000000e+00, float addrspace(1)* %373, align 4, !tbaa !7
  %374 = or i32 %338, 7
  %375 = mul nsw i32 %374, %2
  %376 = add nsw i32 %375, %12
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %1, i64 %377
  store float 0.000000e+00, float addrspace(1)* %378, align 4, !tbaa !7
  %379 = add nuw nsw i32 %338, 8
  %380 = add i32 %339, 8
  %381 = icmp eq i32 %380, %330
  br i1 %381, label %450, label %337, !llvm.loop !18

382:                                              ; preds = %382, %335
  %383 = phi i32 [ 0, %335 ], [ %428, %382 ]
  %384 = phi i32 [ 0, %335 ], [ %429, %382 ]
  %385 = add nsw i32 %383, %322
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !7
  %389 = fsub contract float %388, %324
  %390 = fdiv contract float %389, %321
  %391 = mul nsw i32 %383, %2
  %392 = add nsw i32 %391, %12
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds float, float addrspace(1)* %1, i64 %393
  store float %390, float addrspace(1)* %394, align 4, !tbaa !7
  %395 = or i32 %383, 1
  %396 = add nsw i32 %395, %322
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %0, i64 %397
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !7
  %400 = fsub contract float %399, %324
  %401 = fdiv contract float %400, %321
  %402 = mul nsw i32 %395, %2
  %403 = add nsw i32 %402, %12
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float addrspace(1)* %1, i64 %404
  store float %401, float addrspace(1)* %405, align 4, !tbaa !7
  %406 = or i32 %383, 2
  %407 = add nsw i32 %406, %322
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds float, float addrspace(1)* %0, i64 %408
  %410 = load float, float addrspace(1)* %409, align 4, !tbaa !7
  %411 = fsub contract float %410, %324
  %412 = fdiv contract float %411, %321
  %413 = mul nsw i32 %406, %2
  %414 = add nsw i32 %413, %12
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %1, i64 %415
  store float %412, float addrspace(1)* %416, align 4, !tbaa !7
  %417 = or i32 %383, 3
  %418 = add nsw i32 %417, %322
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %0, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !7
  %422 = fsub contract float %421, %324
  %423 = fdiv contract float %422, %321
  %424 = mul nsw i32 %417, %2
  %425 = add nsw i32 %424, %12
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds float, float addrspace(1)* %1, i64 %426
  store float %423, float addrspace(1)* %427, align 4, !tbaa !7
  %428 = add nuw nsw i32 %383, 4
  %429 = add i32 %384, 4
  %430 = icmp eq i32 %429, %336
  br i1 %430, label %431, label %382, !llvm.loop !18

431:                                              ; preds = %382, %331
  %432 = phi i32 [ 0, %331 ], [ %428, %382 ]
  %433 = icmp eq i32 %333, 0
  br i1 %433, label %463, label %434

434:                                              ; preds = %431, %434
  %435 = phi i32 [ %447, %434 ], [ %432, %431 ]
  %436 = phi i32 [ %448, %434 ], [ 0, %431 ]
  %437 = add nsw i32 %435, %322
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds float, float addrspace(1)* %0, i64 %438
  %440 = load float, float addrspace(1)* %439, align 4, !tbaa !7
  %441 = fsub contract float %440, %324
  %442 = fdiv contract float %441, %321
  %443 = mul nsw i32 %435, %2
  %444 = add nsw i32 %443, %12
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds float, float addrspace(1)* %1, i64 %445
  store float %442, float addrspace(1)* %446, align 4, !tbaa !7
  %447 = add nuw nsw i32 %435, 1
  %448 = add i32 %436, 1
  %449 = icmp eq i32 %448, %333
  br i1 %449, label %463, label %434, !llvm.loop !19

450:                                              ; preds = %337, %325
  %451 = phi i32 [ 0, %325 ], [ %379, %337 ]
  %452 = icmp eq i32 %327, 0
  br i1 %452, label %463, label %453

453:                                              ; preds = %450, %453
  %454 = phi i32 [ %460, %453 ], [ %451, %450 ]
  %455 = phi i32 [ %461, %453 ], [ 0, %450 ]
  %456 = mul nsw i32 %454, %2
  %457 = add nsw i32 %456, %12
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds float, float addrspace(1)* %1, i64 %458
  store float 0.000000e+00, float addrspace(1)* %459, align 4, !tbaa !7
  %460 = add nuw nsw i32 %454, 1
  %461 = add i32 %455, 1
  %462 = icmp eq i32 %461, %327
  br i1 %462, label %463, label %453, !llvm.loop !20

463:                                              ; preds = %434, %431, %453, %450, %291, %3
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
