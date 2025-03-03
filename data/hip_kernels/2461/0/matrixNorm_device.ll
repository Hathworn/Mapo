; ModuleID = '../data/hip_kernels/2461/0/main.cu'
source_filename = "../data/hip_kernels/2461/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10matrixNormPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %424

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %102

16:                                               ; preds = %14
  %17 = add i32 %2, -1
  %18 = and i32 %2, 7
  %19 = icmp ult i32 %17, 7
  br i1 %19, label %84, label %20

20:                                               ; preds = %16
  %21 = and i32 %2, -8
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %81, %22 ]
  %24 = phi float [ 0.000000e+00, %20 ], [ %80, %22 ]
  %25 = phi i32 [ 0, %20 ], [ %82, %22 ]
  %26 = mul nsw i32 %23, %2
  %27 = add nsw i32 %26, %12
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fadd contract float %24, %30
  %32 = or i32 %23, 1
  %33 = mul nsw i32 %32, %2
  %34 = add nsw i32 %33, %12
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fadd contract float %31, %37
  %39 = or i32 %23, 2
  %40 = mul nsw i32 %39, %2
  %41 = add nsw i32 %40, %12
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fadd contract float %38, %44
  %46 = or i32 %23, 3
  %47 = mul nsw i32 %46, %2
  %48 = add nsw i32 %47, %12
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract float %45, %51
  %53 = or i32 %23, 4
  %54 = mul nsw i32 %53, %2
  %55 = add nsw i32 %54, %12
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fadd contract float %52, %58
  %60 = or i32 %23, 5
  %61 = mul nsw i32 %60, %2
  %62 = add nsw i32 %61, %12
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %59, %65
  %67 = or i32 %23, 6
  %68 = mul nsw i32 %67, %2
  %69 = add nsw i32 %68, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fadd contract float %66, %72
  %74 = or i32 %23, 7
  %75 = mul nsw i32 %74, %2
  %76 = add nsw i32 %75, %12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fadd contract float %73, %79
  %81 = add nuw nsw i32 %23, 8
  %82 = add i32 %25, 8
  %83 = icmp eq i32 %82, %21
  br i1 %83, label %84, label %22, !llvm.loop !11

84:                                               ; preds = %22, %16
  %85 = phi float [ undef, %16 ], [ %80, %22 ]
  %86 = phi i32 [ 0, %16 ], [ %81, %22 ]
  %87 = phi float [ 0.000000e+00, %16 ], [ %80, %22 ]
  %88 = icmp eq i32 %18, 0
  br i1 %88, label %102, label %89

89:                                               ; preds = %84, %89
  %90 = phi i32 [ %99, %89 ], [ %86, %84 ]
  %91 = phi float [ %98, %89 ], [ %87, %84 ]
  %92 = phi i32 [ %100, %89 ], [ 0, %84 ]
  %93 = mul nsw i32 %90, %2
  %94 = add nsw i32 %93, %12
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = fadd contract float %91, %97
  %99 = add nuw nsw i32 %90, 1
  %100 = add i32 %92, 1
  %101 = icmp eq i32 %100, %18
  br i1 %101, label %102, label %89, !llvm.loop !13

102:                                              ; preds = %84, %89, %14
  %103 = phi float [ 0.000000e+00, %14 ], [ %85, %84 ], [ %98, %89 ]
  %104 = sitofp i32 %2 to float
  %105 = fdiv contract float %103, %104
  br i1 %15, label %106, label %270

106:                                              ; preds = %102, %106
  %107 = phi i32 [ %268, %106 ], [ 0, %102 ]
  %108 = phi float [ %267, %106 ], [ 0.000000e+00, %102 ]
  %109 = mul nsw i32 %107, %2
  %110 = add nsw i32 %109, %12
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fsub contract float %113, %105
  %115 = tail call float @llvm.fabs.f32(float %114)
  %116 = tail call float @llvm.amdgcn.frexp.mant.f32(float %115)
  %117 = fcmp olt float %116, 0x3FE5555560000000
  %118 = zext i1 %117 to i32
  %119 = tail call float @llvm.amdgcn.ldexp.f32(float %116, i32 %118)
  %120 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %115)
  %121 = sub nsw i32 %120, %118
  %122 = fadd float %119, -1.000000e+00
  %123 = fadd float %119, 1.000000e+00
  %124 = fadd float %123, -1.000000e+00
  %125 = fsub float %119, %124
  %126 = tail call float @llvm.amdgcn.rcp.f32(float %123)
  %127 = fmul float %122, %126
  %128 = fmul float %123, %127
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %127, float %123, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float %125, float %130)
  %132 = fadd float %128, %131
  %133 = fsub float %132, %128
  %134 = fsub float %131, %133
  %135 = fsub float %122, %132
  %136 = fsub float %122, %135
  %137 = fsub float %136, %132
  %138 = fsub float %137, %134
  %139 = fadd float %135, %138
  %140 = fmul float %126, %139
  %141 = fadd float %127, %140
  %142 = fsub float %141, %127
  %143 = fsub float %140, %142
  %144 = fmul float %141, %141
  %145 = fneg float %144
  %146 = tail call float @llvm.fma.f32(float %141, float %141, float %145)
  %147 = fmul float %143, 2.000000e+00
  %148 = tail call float @llvm.fma.f32(float %141, float %147, float %146)
  %149 = fadd float %144, %148
  %150 = fsub float %149, %144
  %151 = fsub float %148, %150
  %152 = tail call float @llvm.fmuladd.f32(float %149, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %153 = tail call float @llvm.fmuladd.f32(float %149, float %152, float 0x3FD999BDE0000000)
  %154 = sitofp i32 %121 to float
  %155 = fmul float %154, 0x3FE62E4300000000
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %154, float 0x3FE62E4300000000, float %156)
  %158 = tail call float @llvm.fma.f32(float %154, float 0xBE205C6100000000, float %157)
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = tail call float @llvm.amdgcn.ldexp.f32(float %141, i32 1)
  %163 = fmul float %141, %149
  %164 = fneg float %163
  %165 = tail call float @llvm.fma.f32(float %149, float %141, float %164)
  %166 = tail call float @llvm.fma.f32(float %149, float %143, float %165)
  %167 = tail call float @llvm.fma.f32(float %151, float %141, float %166)
  %168 = fadd float %163, %167
  %169 = fsub float %168, %163
  %170 = fsub float %167, %169
  %171 = fmul float %149, %153
  %172 = fneg float %171
  %173 = tail call float @llvm.fma.f32(float %149, float %153, float %172)
  %174 = tail call float @llvm.fma.f32(float %151, float %153, float %173)
  %175 = fadd float %171, %174
  %176 = fsub float %175, %171
  %177 = fsub float %174, %176
  %178 = fadd float %175, 0x3FE5555540000000
  %179 = fadd float %178, 0xBFE5555540000000
  %180 = fsub float %175, %179
  %181 = fadd float %177, 0x3E2E720200000000
  %182 = fadd float %181, %180
  %183 = fadd float %178, %182
  %184 = fsub float %183, %178
  %185 = fsub float %182, %184
  %186 = fmul float %168, %183
  %187 = fneg float %186
  %188 = tail call float @llvm.fma.f32(float %168, float %183, float %187)
  %189 = tail call float @llvm.fma.f32(float %168, float %185, float %188)
  %190 = tail call float @llvm.fma.f32(float %170, float %183, float %189)
  %191 = tail call float @llvm.amdgcn.ldexp.f32(float %143, i32 1)
  %192 = fadd float %186, %190
  %193 = fsub float %192, %186
  %194 = fsub float %190, %193
  %195 = fadd float %162, %192
  %196 = fsub float %195, %162
  %197 = fsub float %192, %196
  %198 = fadd float %191, %194
  %199 = fadd float %198, %197
  %200 = fadd float %195, %199
  %201 = fsub float %200, %195
  %202 = fsub float %199, %201
  %203 = fadd float %159, %200
  %204 = fsub float %203, %159
  %205 = fsub float %203, %204
  %206 = fsub float %159, %205
  %207 = fsub float %200, %204
  %208 = fadd float %207, %206
  %209 = fadd float %161, %202
  %210 = fsub float %209, %161
  %211 = fsub float %209, %210
  %212 = fsub float %161, %211
  %213 = fsub float %202, %210
  %214 = fadd float %213, %212
  %215 = fadd float %209, %208
  %216 = fadd float %203, %215
  %217 = fsub float %216, %203
  %218 = fsub float %215, %217
  %219 = fadd float %214, %218
  %220 = fadd float %216, %219
  %221 = fsub float %220, %216
  %222 = fsub float %219, %221
  %223 = fmul float %220, 2.000000e+00
  %224 = fneg float %223
  %225 = tail call float @llvm.fma.f32(float %220, float 2.000000e+00, float %224)
  %226 = tail call float @llvm.fma.f32(float %222, float 2.000000e+00, float %225)
  %227 = fadd float %223, %226
  %228 = fsub float %227, %223
  %229 = fsub float %226, %228
  %230 = tail call float @llvm.fabs.f32(float %223) #3
  %231 = fcmp oeq float %230, 0x7FF0000000000000
  %232 = select i1 %231, float %223, float %227
  %233 = tail call float @llvm.fabs.f32(float %232) #3
  %234 = fcmp oeq float %233, 0x7FF0000000000000
  %235 = select i1 %234, float 0.000000e+00, float %229
  %236 = fcmp oeq float %232, 0x40562E4300000000
  %237 = select i1 %236, float 0x3EE0000000000000, float 0.000000e+00
  %238 = fsub float %232, %237
  %239 = fadd float %237, %235
  %240 = fmul float %238, 0x3FF7154760000000
  %241 = tail call float @llvm.rint.f32(float %240)
  %242 = fcmp ogt float %238, 0x40562E4300000000
  %243 = fcmp olt float %238, 0xC059D1DA00000000
  %244 = fneg float %240
  %245 = tail call float @llvm.fma.f32(float %238, float 0x3FF7154760000000, float %244)
  %246 = tail call float @llvm.fma.f32(float %238, float 0x3E54AE0BE0000000, float %245)
  %247 = fsub float %240, %241
  %248 = fadd float %246, %247
  %249 = tail call float @llvm.exp2.f32(float %248)
  %250 = fptosi float %241 to i32
  %251 = tail call float @llvm.amdgcn.ldexp.f32(float %249, i32 %250)
  %252 = select i1 %243, float 0.000000e+00, float %251
  %253 = select i1 %242, float 0x7FF0000000000000, float %252
  %254 = tail call float @llvm.fma.f32(float %253, float %239, float %253)
  %255 = tail call float @llvm.fabs.f32(float %253) #3
  %256 = fcmp oeq float %255, 0x7FF0000000000000
  %257 = select i1 %256, float %253, float %254
  %258 = tail call float @llvm.fabs.f32(float %257)
  %259 = fcmp oeq float %115, 0x7FF0000000000000
  %260 = fcmp oeq float %114, 0.000000e+00
  %261 = select i1 %259, float 0x7FF0000000000000, float %258
  %262 = select i1 %260, float 0.000000e+00, float %261
  %263 = fcmp uno float %114, 0.000000e+00
  %264 = select i1 %263, float 0x7FF8000000000000, float %262
  %265 = fcmp oeq float %114, 1.000000e+00
  %266 = select i1 %265, float 1.000000e+00, float %264
  %267 = fadd contract float %108, %266
  %268 = add nuw nsw i32 %107, 1
  %269 = icmp eq i32 %268, %2
  br i1 %269, label %270, label %106, !llvm.loop !15

270:                                              ; preds = %106, %102
  %271 = phi float [ 0.000000e+00, %102 ], [ %267, %106 ]
  %272 = fdiv contract float %271, %104
  %273 = fcmp olt float %272, 0x39F0000000000000
  %274 = select i1 %273, float 0x41F0000000000000, float 1.000000e+00
  %275 = fmul float %272, %274
  %276 = tail call float @llvm.sqrt.f32(float %275)
  %277 = bitcast float %276 to i32
  %278 = add nsw i32 %277, -1
  %279 = bitcast i32 %278 to float
  %280 = add nsw i32 %277, 1
  %281 = bitcast i32 %280 to float
  %282 = tail call i1 @llvm.amdgcn.class.f32(float %275, i32 608)
  %283 = select i1 %273, float 0x3EF0000000000000, float 1.000000e+00
  %284 = fneg float %281
  %285 = tail call float @llvm.fma.f32(float %284, float %276, float %275)
  %286 = fcmp ogt float %285, 0.000000e+00
  %287 = fneg float %279
  %288 = tail call float @llvm.fma.f32(float %287, float %276, float %275)
  %289 = fcmp ole float %288, 0.000000e+00
  %290 = select i1 %289, float %279, float %276
  %291 = select i1 %286, float %281, float %290
  %292 = fmul float %283, %291
  %293 = select i1 %282, float %275, float %292
  br i1 %15, label %294, label %424

294:                                              ; preds = %270
  %295 = fcmp contract oeq float %293, 0.000000e+00
  br i1 %295, label %296, label %302

296:                                              ; preds = %294
  %297 = add i32 %2, -1
  %298 = and i32 %2, 7
  %299 = icmp ult i32 %297, 7
  br i1 %299, label %411, label %300

300:                                              ; preds = %296
  %301 = and i32 %2, -8
  br label %308

302:                                              ; preds = %294
  %303 = add i32 %2, -1
  %304 = and i32 %2, 3
  %305 = icmp ult i32 %303, 3
  br i1 %305, label %394, label %306

306:                                              ; preds = %302
  %307 = and i32 %2, -4
  br label %353

308:                                              ; preds = %308, %300
  %309 = phi i32 [ 0, %300 ], [ %350, %308 ]
  %310 = phi i32 [ 0, %300 ], [ %351, %308 ]
  %311 = mul nsw i32 %309, %2
  %312 = add nsw i32 %311, %12
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %1, i64 %313
  store float 0.000000e+00, float addrspace(1)* %314, align 4, !tbaa !7
  %315 = or i32 %309, 1
  %316 = mul nsw i32 %315, %2
  %317 = add nsw i32 %316, %12
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %1, i64 %318
  store float 0.000000e+00, float addrspace(1)* %319, align 4, !tbaa !7
  %320 = or i32 %309, 2
  %321 = mul nsw i32 %320, %2
  %322 = add nsw i32 %321, %12
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %1, i64 %323
  store float 0.000000e+00, float addrspace(1)* %324, align 4, !tbaa !7
  %325 = or i32 %309, 3
  %326 = mul nsw i32 %325, %2
  %327 = add nsw i32 %326, %12
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %1, i64 %328
  store float 0.000000e+00, float addrspace(1)* %329, align 4, !tbaa !7
  %330 = or i32 %309, 4
  %331 = mul nsw i32 %330, %2
  %332 = add nsw i32 %331, %12
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %1, i64 %333
  store float 0.000000e+00, float addrspace(1)* %334, align 4, !tbaa !7
  %335 = or i32 %309, 5
  %336 = mul nsw i32 %335, %2
  %337 = add nsw i32 %336, %12
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds float, float addrspace(1)* %1, i64 %338
  store float 0.000000e+00, float addrspace(1)* %339, align 4, !tbaa !7
  %340 = or i32 %309, 6
  %341 = mul nsw i32 %340, %2
  %342 = add nsw i32 %341, %12
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %1, i64 %343
  store float 0.000000e+00, float addrspace(1)* %344, align 4, !tbaa !7
  %345 = or i32 %309, 7
  %346 = mul nsw i32 %345, %2
  %347 = add nsw i32 %346, %12
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %1, i64 %348
  store float 0.000000e+00, float addrspace(1)* %349, align 4, !tbaa !7
  %350 = add nuw nsw i32 %309, 8
  %351 = add i32 %310, 8
  %352 = icmp eq i32 %351, %301
  br i1 %352, label %411, label %308, !llvm.loop !16

353:                                              ; preds = %353, %306
  %354 = phi i32 [ 0, %306 ], [ %391, %353 ]
  %355 = phi i32 [ 0, %306 ], [ %392, %353 ]
  %356 = mul nsw i32 %354, %2
  %357 = add nsw i32 %356, %12
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %0, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7
  %361 = fsub contract float %360, %105
  %362 = fdiv contract float %361, %293
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %358
  store float %362, float addrspace(1)* %363, align 4, !tbaa !7
  %364 = or i32 %354, 1
  %365 = mul nsw i32 %364, %2
  %366 = add nsw i32 %365, %12
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds float, float addrspace(1)* %0, i64 %367
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !7
  %370 = fsub contract float %369, %105
  %371 = fdiv contract float %370, %293
  %372 = getelementptr inbounds float, float addrspace(1)* %1, i64 %367
  store float %371, float addrspace(1)* %372, align 4, !tbaa !7
  %373 = or i32 %354, 2
  %374 = mul nsw i32 %373, %2
  %375 = add nsw i32 %374, %12
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %0, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = fsub contract float %378, %105
  %380 = fdiv contract float %379, %293
  %381 = getelementptr inbounds float, float addrspace(1)* %1, i64 %376
  store float %380, float addrspace(1)* %381, align 4, !tbaa !7
  %382 = or i32 %354, 3
  %383 = mul nsw i32 %382, %2
  %384 = add nsw i32 %383, %12
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds float, float addrspace(1)* %0, i64 %385
  %387 = load float, float addrspace(1)* %386, align 4, !tbaa !7
  %388 = fsub contract float %387, %105
  %389 = fdiv contract float %388, %293
  %390 = getelementptr inbounds float, float addrspace(1)* %1, i64 %385
  store float %389, float addrspace(1)* %390, align 4, !tbaa !7
  %391 = add nuw nsw i32 %354, 4
  %392 = add i32 %355, 4
  %393 = icmp eq i32 %392, %307
  br i1 %393, label %394, label %353, !llvm.loop !16

394:                                              ; preds = %353, %302
  %395 = phi i32 [ 0, %302 ], [ %391, %353 ]
  %396 = icmp eq i32 %304, 0
  br i1 %396, label %424, label %397

397:                                              ; preds = %394, %397
  %398 = phi i32 [ %408, %397 ], [ %395, %394 ]
  %399 = phi i32 [ %409, %397 ], [ 0, %394 ]
  %400 = mul nsw i32 %398, %2
  %401 = add nsw i32 %400, %12
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %0, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7
  %405 = fsub contract float %404, %105
  %406 = fdiv contract float %405, %293
  %407 = getelementptr inbounds float, float addrspace(1)* %1, i64 %402
  store float %406, float addrspace(1)* %407, align 4, !tbaa !7
  %408 = add nuw nsw i32 %398, 1
  %409 = add i32 %399, 1
  %410 = icmp eq i32 %409, %304
  br i1 %410, label %424, label %397, !llvm.loop !17

411:                                              ; preds = %308, %296
  %412 = phi i32 [ 0, %296 ], [ %350, %308 ]
  %413 = icmp eq i32 %298, 0
  br i1 %413, label %424, label %414

414:                                              ; preds = %411, %414
  %415 = phi i32 [ %421, %414 ], [ %412, %411 ]
  %416 = phi i32 [ %422, %414 ], [ 0, %411 ]
  %417 = mul nsw i32 %415, %2
  %418 = add nsw i32 %417, %12
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %1, i64 %419
  store float 0.000000e+00, float addrspace(1)* %420, align 4, !tbaa !7
  %421 = add nuw nsw i32 %415, 1
  %422 = add i32 %416, 1
  %423 = icmp eq i32 %422, %298
  br i1 %423, label %424, label %414, !llvm.loop !18

424:                                              ; preds = %397, %394, %414, %411, %270, %3
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
