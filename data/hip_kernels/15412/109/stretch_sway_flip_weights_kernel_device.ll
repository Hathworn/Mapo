; ModuleID = '../data/hip_kernels/15412/109/main.cu'
source_filename = "../data/hip_kernels/15412/109/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32stretch_sway_flip_weights_kernelPKfPfiiifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %4, %4
  %18 = mul nsw i32 %16, %17
  %19 = sdiv i32 %2, %17
  %20 = sdiv i32 %19, 8
  %21 = sdiv i32 %16, %20
  %22 = icmp slt i32 %18, %2
  br i1 %22, label %23, label %928

23:                                               ; preds = %7
  %24 = icmp eq i32 %21, 0
  br i1 %24, label %25, label %114

25:                                               ; preds = %23
  %26 = icmp sgt i32 %4, 0
  br i1 %26, label %27, label %928

27:                                               ; preds = %25
  %28 = add i32 %4, -1
  %29 = and i32 %4, 7
  %30 = icmp ult i32 %28, 7
  %31 = and i32 %4, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %27, %50
  %34 = phi i32 [ %51, %50 ], [ 0, %27 ]
  %35 = add i32 %34, %18
  br i1 %30, label %36, label %53

36:                                               ; preds = %53, %33
  %37 = phi i32 [ 0, %33 ], [ %111, %53 ]
  br i1 %32, label %50, label %38

38:                                               ; preds = %36, %38
  %39 = phi i32 [ %47, %38 ], [ %37, %36 ]
  %40 = phi i32 [ %48, %38 ], [ 0, %36 ]
  %41 = mul nsw i32 %39, %4
  %42 = add i32 %35, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %45, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = add nuw nsw i32 %39, 1
  %48 = add i32 %40, 1
  %49 = icmp eq i32 %48, %29
  br i1 %49, label %50, label %38, !llvm.loop !11

50:                                               ; preds = %38, %36
  %51 = add nuw nsw i32 %34, 1
  %52 = icmp eq i32 %51, %4
  br i1 %52, label %928, label %33, !llvm.loop !13

53:                                               ; preds = %33, %53
  %54 = phi i32 [ %111, %53 ], [ 0, %33 ]
  %55 = phi i32 [ %112, %53 ], [ 0, %33 ]
  %56 = mul nsw i32 %54, %4
  %57 = add i32 %35, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %54, 1
  %63 = mul nsw i32 %62, %4
  %64 = add i32 %35, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  store float %67, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i32 %54, 2
  %70 = mul nsw i32 %69, %4
  %71 = add i32 %35, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %74, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = or i32 %54, 3
  %77 = mul nsw i32 %76, %4
  %78 = add i32 %35, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  store float %81, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = or i32 %54, 4
  %84 = mul nsw i32 %83, %4
  %85 = add i32 %35, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  store float %88, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = or i32 %54, 5
  %91 = mul nsw i32 %90, %4
  %92 = add i32 %35, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  store float %95, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %54, 6
  %98 = mul nsw i32 %97, %4
  %99 = add i32 %35, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %102, float addrspace(1)* %103, align 4, !tbaa !7
  %104 = or i32 %54, 7
  %105 = mul nsw i32 %104, %4
  %106 = add i32 %35, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %109, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = add nuw nsw i32 %54, 8
  %112 = add i32 %55, 8
  %113 = icmp eq i32 %112, %31
  br i1 %113, label %36, label %53, !llvm.loop !15

114:                                              ; preds = %23
  %115 = icmp ult i32 %21, 5
  br i1 %115, label %116, label %306

116:                                              ; preds = %114
  switch i32 %21, label %120 [
    i32 1, label %121
    i32 2, label %117
    i32 3, label %118
    i32 4, label %119
  ]

117:                                              ; preds = %116
  br label %121

118:                                              ; preds = %116
  br label %121

119:                                              ; preds = %116
  br label %121

120:                                              ; preds = %116
  br label %121

121:                                              ; preds = %116, %120, %117, %119, %118
  %122 = phi float [ 0x3FE99999A0000000, %117 ], [ 0x3FF3333340000000, %118 ], [ 0x3FF6666660000000, %119 ], [ 0x3FE4CCCCC0000000, %116 ], [ 5.000000e-01, %120 ]
  %123 = icmp eq i32 %6, 0
  %124 = fdiv contract float 1.000000e+00, %122
  %125 = select i1 %123, float %122, float %124
  %126 = sdiv i32 %4, 2
  %127 = icmp sgt i32 %4, 0
  br i1 %127, label %128, label %928

128:                                              ; preds = %121
  %129 = sitofp i32 %126 to float
  br label %130

130:                                              ; preds = %128, %163
  %131 = phi i32 [ 0, %128 ], [ %164, %163 ]
  %132 = sub nsw i32 %131, %126
  %133 = sitofp i32 %132 to float
  %134 = fdiv contract float %133, %125
  %135 = fadd contract float %134, %129
  %136 = tail call float @llvm.floor.f32(float %135)
  %137 = fptosi float %136 to i32
  %138 = tail call float @llvm.ceil.f32(float %135)
  %139 = fptosi float %138 to i32
  %140 = icmp eq i32 %137, %139
  %141 = add nsw i32 %137, 1
  %142 = select i1 %140, i32 %141, i32 %139
  %143 = sitofp i32 %142 to float
  %144 = fsub contract float %143, %135
  %145 = sitofp i32 %137 to float
  %146 = fsub contract float %135, %145
  %147 = icmp sgt i32 %137, -1
  %148 = icmp slt i32 %137, %4
  %149 = mul nsw i32 %137, %4
  %150 = icmp sgt i32 %142, -1
  %151 = icmp slt i32 %142, %4
  %152 = mul nsw i32 %142, %4
  %153 = mul nsw i32 %131, %4
  %154 = add i32 %153, %18
  br label %166

155:                                              ; preds = %163
  br i1 %127, label %156, label %928

156:                                              ; preds = %155
  %157 = fcmp contract ogt float %125, 1.000000e+00
  %158 = add i32 %4, -1
  %159 = and i32 %4, 3
  %160 = icmp ult i32 %158, 3
  %161 = and i32 %4, -4
  %162 = icmp eq i32 %159, 0
  br label %250

163:                                              ; preds = %243
  %164 = add nuw nsw i32 %131, 1
  %165 = icmp eq i32 %164, %4
  br i1 %165, label %155, label %130, !llvm.loop !16

166:                                              ; preds = %130, %243
  %167 = phi i32 [ 0, %130 ], [ %248, %243 ]
  %168 = sub nsw i32 %167, %126
  %169 = sitofp i32 %168 to float
  %170 = fdiv contract float %169, %125
  %171 = fadd contract float %170, %129
  %172 = tail call float @llvm.floor.f32(float %171)
  %173 = fptosi float %172 to i32
  %174 = tail call float @llvm.ceil.f32(float %171)
  %175 = fptosi float %174 to i32
  %176 = icmp eq i32 %173, %175
  %177 = add nsw i32 %173, 1
  %178 = select i1 %176, i32 %177, i32 %175
  %179 = sitofp i32 %178 to float
  %180 = fsub contract float %179, %171
  %181 = sitofp i32 %173 to float
  %182 = fsub contract float %171, %181
  %183 = icmp sgt i32 %173, -1
  br i1 %183, label %184, label %197

184:                                              ; preds = %166
  %185 = icmp slt i32 %173, %4
  %186 = select i1 %185, i1 %147, i1 false
  %187 = select i1 %186, i1 %148, i1 false
  br i1 %187, label %188, label %197

188:                                              ; preds = %184
  %189 = add i32 %18, %173
  %190 = add i32 %189, %149
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !7
  %194 = fmul contract float %180, %193
  %195 = fmul contract float %144, %194
  %196 = fadd contract float %195, 0.000000e+00
  br label %197

197:                                              ; preds = %166, %184, %188
  %198 = phi float [ %196, %188 ], [ 0.000000e+00, %184 ], [ 0.000000e+00, %166 ]
  %199 = icmp sgt i32 %178, -1
  br i1 %199, label %200, label %213

200:                                              ; preds = %197
  %201 = icmp slt i32 %178, %4
  %202 = select i1 %201, i1 %147, i1 false
  %203 = select i1 %202, i1 %148, i1 false
  br i1 %203, label %204, label %213

204:                                              ; preds = %200
  %205 = add i32 %178, %18
  %206 = add i32 %205, %149
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %0, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %210 = fmul contract float %182, %209
  %211 = fmul contract float %144, %210
  %212 = fadd contract float %198, %211
  br label %213

213:                                              ; preds = %197, %200, %204
  %214 = phi float [ %212, %204 ], [ %198, %200 ], [ %198, %197 ]
  br i1 %183, label %215, label %228

215:                                              ; preds = %213
  %216 = icmp slt i32 %173, %4
  %217 = select i1 %216, i1 %150, i1 false
  %218 = select i1 %217, i1 %151, i1 false
  br i1 %218, label %219, label %228

219:                                              ; preds = %215
  %220 = add i32 %18, %173
  %221 = add i32 %220, %152
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %0, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !7
  %225 = fmul contract float %180, %224
  %226 = fmul contract float %146, %225
  %227 = fadd contract float %214, %226
  br label %228

228:                                              ; preds = %213, %215, %219
  %229 = phi float [ %227, %219 ], [ %214, %215 ], [ %214, %213 ]
  br i1 %199, label %230, label %243

230:                                              ; preds = %228
  %231 = icmp slt i32 %178, %4
  %232 = select i1 %231, i1 %150, i1 false
  %233 = select i1 %232, i1 %151, i1 false
  br i1 %233, label %234, label %243

234:                                              ; preds = %230
  %235 = add i32 %178, %18
  %236 = add i32 %235, %152
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %0, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7
  %240 = fmul contract float %182, %239
  %241 = fmul contract float %146, %240
  %242 = fadd contract float %229, %241
  br label %243

243:                                              ; preds = %228, %230, %234
  %244 = phi float [ %242, %234 ], [ %229, %230 ], [ %229, %228 ]
  %245 = add i32 %154, %167
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  store float %244, float addrspace(1)* %247, align 4, !tbaa !7
  %248 = add nuw nsw i32 %167, 1
  %249 = icmp eq i32 %248, %4
  br i1 %249, label %163, label %166, !llvm.loop !17

250:                                              ; preds = %156, %269
  %251 = phi i32 [ 0, %156 ], [ %270, %269 ]
  %252 = mul nsw i32 %251, %4
  %253 = add i32 %252, %18
  br i1 %160, label %254, label %272

254:                                              ; preds = %301, %250
  %255 = phi i32 [ 0, %250 ], [ %303, %301 ]
  br i1 %162, label %269, label %256

256:                                              ; preds = %254, %265
  %257 = phi i32 [ %266, %265 ], [ %255, %254 ]
  %258 = phi i32 [ %267, %265 ], [ 0, %254 ]
  br i1 %157, label %259, label %265

259:                                              ; preds = %256
  %260 = add i32 %253, %257
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %1, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !7
  %264 = fdiv contract float %263, %125
  store float %264, float addrspace(1)* %262, align 4, !tbaa !7
  br label %265

265:                                              ; preds = %259, %256
  %266 = add nuw nsw i32 %257, 1
  %267 = add i32 %258, 1
  %268 = icmp eq i32 %267, %159
  br i1 %268, label %269, label %256, !llvm.loop !18

269:                                              ; preds = %265, %254
  %270 = add nuw nsw i32 %251, 1
  %271 = icmp eq i32 %270, %4
  br i1 %271, label %928, label %250, !llvm.loop !19

272:                                              ; preds = %250, %301
  %273 = phi i32 [ %303, %301 ], [ 0, %250 ]
  %274 = phi i32 [ %304, %301 ], [ 0, %250 ]
  br i1 %157, label %275, label %299

275:                                              ; preds = %272
  %276 = add i32 %253, %273
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %1, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !7
  %280 = fdiv contract float %279, %125
  store float %280, float addrspace(1)* %278, align 4, !tbaa !7
  %281 = add nuw nsw i32 %273, 1
  %282 = add i32 %253, %281
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %1, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %286 = fdiv contract float %285, %125
  store float %286, float addrspace(1)* %284, align 4, !tbaa !7
  %287 = add nuw nsw i32 %273, 2
  %288 = add i32 %253, %287
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7
  %292 = fdiv contract float %291, %125
  store float %292, float addrspace(1)* %290, align 4, !tbaa !7
  %293 = add nuw nsw i32 %273, 3
  %294 = add i32 %253, %293
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %1, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7
  %298 = fdiv contract float %297, %125
  store float %298, float addrspace(1)* %296, align 4, !tbaa !7
  br label %301

299:                                              ; preds = %272
  %300 = add nuw nsw i32 %273, 3
  br label %301

301:                                              ; preds = %299, %275
  %302 = phi i32 [ %300, %299 ], [ %293, %275 ]
  %303 = add nuw nsw i32 %302, 1
  %304 = add i32 %274, 4
  %305 = icmp eq i32 %304, %161
  br i1 %305, label %254, label %272, !llvm.loop !20

306:                                              ; preds = %114
  %307 = add i32 %21, -5
  %308 = icmp ult i32 %307, 2
  br i1 %308, label %309, label %825

309:                                              ; preds = %306
  %310 = icmp eq i32 %21, 6
  %311 = fneg contract float %5
  %312 = select i1 %310, float %311, float %5
  %313 = icmp eq i32 %6, 0
  %314 = fneg contract float %312
  %315 = select i1 %313, float %312, float %314
  %316 = fpext float %315 to double
  %317 = fmul contract double %316, 0x400921FB53C8D4F1
  %318 = fdiv contract double %317, 1.800000e+02
  %319 = fptrunc double %318 to float
  %320 = tail call float @llvm.fabs.f32(float %319)
  %321 = fcmp olt float %320, 1.310720e+05
  br i1 %321, label %322, label %329

322:                                              ; preds = %309
  %323 = fmul float %320, 0x3FE45F3060000000
  %324 = tail call float @llvm.rint.f32(float %323)
  %325 = tail call float @llvm.fma.f32(float %324, float 0xBFF921FB40000000, float %320)
  %326 = tail call float @llvm.fma.f32(float %324, float 0xBE74442D00000000, float %325)
  %327 = tail call float @llvm.fma.f32(float %324, float 0xBCF8469880000000, float %326)
  %328 = fptosi float %324 to i32
  br label %435

329:                                              ; preds = %309
  %330 = bitcast float %320 to i32
  %331 = lshr i32 %330, 23
  %332 = and i32 %330, 8388607
  %333 = or i32 %332, 8388608
  %334 = zext i32 %333 to i64
  %335 = mul nuw nsw i64 %334, 4266746795
  %336 = trunc i64 %335 to i32
  %337 = lshr i64 %335, 32
  %338 = mul nuw nsw i64 %334, 1011060801
  %339 = add nuw nsw i64 %337, %338
  %340 = trunc i64 %339 to i32
  %341 = lshr i64 %339, 32
  %342 = mul nuw nsw i64 %334, 3680671129
  %343 = add nuw nsw i64 %341, %342
  %344 = trunc i64 %343 to i32
  %345 = lshr i64 %343, 32
  %346 = mul nuw nsw i64 %334, 4113882560
  %347 = add nuw nsw i64 %345, %346
  %348 = trunc i64 %347 to i32
  %349 = lshr i64 %347, 32
  %350 = mul nuw nsw i64 %334, 4230436817
  %351 = add nuw nsw i64 %349, %350
  %352 = trunc i64 %351 to i32
  %353 = lshr i64 %351, 32
  %354 = mul nuw nsw i64 %334, 1313084713
  %355 = add nuw nsw i64 %353, %354
  %356 = trunc i64 %355 to i32
  %357 = lshr i64 %355, 32
  %358 = mul nuw nsw i64 %334, 2734261102
  %359 = add nuw nsw i64 %357, %358
  %360 = trunc i64 %359 to i32
  %361 = lshr i64 %359, 32
  %362 = trunc i64 %361 to i32
  %363 = add nsw i32 %331, -120
  %364 = icmp ugt i32 %363, 63
  %365 = select i1 %364, i32 %356, i32 %362
  %366 = select i1 %364, i32 %352, i32 %360
  %367 = select i1 %364, i32 %348, i32 %356
  %368 = select i1 %364, i32 %344, i32 %352
  %369 = select i1 %364, i32 %340, i32 %348
  %370 = select i1 %364, i32 %336, i32 %344
  %371 = select i1 %364, i32 -64, i32 0
  %372 = add nsw i32 %371, %363
  %373 = icmp ugt i32 %372, 31
  %374 = select i1 %373, i32 %366, i32 %365
  %375 = select i1 %373, i32 %367, i32 %366
  %376 = select i1 %373, i32 %368, i32 %367
  %377 = select i1 %373, i32 %369, i32 %368
  %378 = select i1 %373, i32 %370, i32 %369
  %379 = select i1 %373, i32 -32, i32 0
  %380 = add nsw i32 %379, %372
  %381 = icmp ugt i32 %380, 31
  %382 = select i1 %381, i32 %375, i32 %374
  %383 = select i1 %381, i32 %376, i32 %375
  %384 = select i1 %381, i32 %377, i32 %376
  %385 = select i1 %381, i32 %378, i32 %377
  %386 = select i1 %381, i32 -32, i32 0
  %387 = add nsw i32 %386, %380
  %388 = icmp eq i32 %387, 0
  %389 = sub nsw i32 32, %387
  %390 = tail call i32 @llvm.fshr.i32(i32 %382, i32 %383, i32 %389)
  %391 = tail call i32 @llvm.fshr.i32(i32 %383, i32 %384, i32 %389)
  %392 = tail call i32 @llvm.fshr.i32(i32 %384, i32 %385, i32 %389)
  %393 = select i1 %388, i32 %382, i32 %390
  %394 = select i1 %388, i32 %383, i32 %391
  %395 = select i1 %388, i32 %384, i32 %392
  %396 = lshr i32 %393, 29
  %397 = tail call i32 @llvm.fshl.i32(i32 %393, i32 %394, i32 2)
  %398 = tail call i32 @llvm.fshl.i32(i32 %394, i32 %395, i32 2)
  %399 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %385, i32 2)
  %400 = and i32 %396, 1
  %401 = sub nsw i32 0, %400
  %402 = shl i32 %396, 31
  %403 = xor i32 %397, %401
  %404 = xor i32 %398, %401
  %405 = xor i32 %399, %401
  %406 = tail call i32 @llvm.ctlz.i32(i32 %403, i1 false), !range !21
  %407 = sub nsw i32 31, %406
  %408 = tail call i32 @llvm.fshr.i32(i32 %403, i32 %404, i32 %407)
  %409 = tail call i32 @llvm.fshr.i32(i32 %404, i32 %405, i32 %407)
  %410 = shl nuw nsw i32 %406, 23
  %411 = sub nuw nsw i32 1056964608, %410
  %412 = lshr i32 %408, 9
  %413 = or i32 %412, %411
  %414 = or i32 %413, %402
  %415 = bitcast i32 %414 to float
  %416 = tail call i32 @llvm.fshl.i32(i32 %408, i32 %409, i32 23)
  %417 = tail call i32 @llvm.ctlz.i32(i32 %416, i1 false), !range !21
  %418 = fmul float %415, 0x3FF921FB40000000
  %419 = add nuw nsw i32 %417, %406
  %420 = shl nuw nsw i32 %419, 23
  %421 = sub nuw nsw i32 855638016, %420
  %422 = sub nsw i32 31, %417
  %423 = tail call i32 @llvm.fshr.i32(i32 %416, i32 %409, i32 %422)
  %424 = lshr i32 %423, 9
  %425 = or i32 %421, %424
  %426 = or i32 %425, %402
  %427 = bitcast i32 %426 to float
  %428 = fneg float %418
  %429 = tail call float @llvm.fma.f32(float %415, float 0x3FF921FB40000000, float %428)
  %430 = tail call float @llvm.fma.f32(float %415, float 0x3E74442D00000000, float %429)
  %431 = tail call float @llvm.fma.f32(float %427, float 0x3FF921FB40000000, float %430)
  %432 = fadd float %418, %431
  %433 = lshr i32 %393, 30
  %434 = add nuw nsw i32 %400, %433
  br label %435

435:                                              ; preds = %322, %329
  %436 = phi float [ %327, %322 ], [ %432, %329 ]
  %437 = phi i32 [ %328, %322 ], [ %434, %329 ]
  %438 = fmul float %436, %436
  %439 = tail call float @llvm.fmuladd.f32(float %438, float 0xBF29833040000000, float 0x3F81103880000000)
  %440 = tail call float @llvm.fmuladd.f32(float %438, float %439, float 0xBFC55553A0000000)
  %441 = fmul float %438, %440
  %442 = tail call float @llvm.fmuladd.f32(float %436, float %441, float %436)
  %443 = tail call float @llvm.fmuladd.f32(float %438, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %444 = tail call float @llvm.fmuladd.f32(float %438, float %443, float 0x3FA5557EE0000000)
  %445 = tail call float @llvm.fmuladd.f32(float %438, float %444, float 0xBFE0000080000000)
  %446 = tail call float @llvm.fmuladd.f32(float %438, float %445, float 1.000000e+00)
  %447 = fneg float %442
  %448 = and i32 %437, 1
  %449 = icmp eq i32 %448, 0
  %450 = select i1 %449, float %446, float %447
  %451 = bitcast float %450 to i32
  %452 = shl i32 %437, 30
  %453 = and i32 %452, -2147483648
  %454 = xor i32 %453, %451
  %455 = bitcast i32 %454 to float
  %456 = tail call i1 @llvm.amdgcn.class.f32(float %320, i32 504)
  %457 = select i1 %456, float %455, float 0x7FF8000000000000
  br i1 %321, label %458, label %466

458:                                              ; preds = %435
  %459 = fmul float %320, 0x3FE45F3060000000
  %460 = tail call float @llvm.rint.f32(float %459)
  %461 = tail call float @llvm.fma.f32(float %460, float 0xBFF921FB40000000, float %320)
  %462 = tail call float @llvm.fma.f32(float %460, float 0xBE74442D00000000, float %461)
  %463 = tail call float @llvm.fma.f32(float %460, float 0xBCF8469880000000, float %462)
  %464 = fptosi float %460 to i32
  %465 = bitcast float %320 to i32
  br label %572

466:                                              ; preds = %435
  %467 = bitcast float %320 to i32
  %468 = lshr i32 %467, 23
  %469 = and i32 %467, 8388607
  %470 = or i32 %469, 8388608
  %471 = zext i32 %470 to i64
  %472 = mul nuw nsw i64 %471, 4266746795
  %473 = trunc i64 %472 to i32
  %474 = lshr i64 %472, 32
  %475 = mul nuw nsw i64 %471, 1011060801
  %476 = add nuw nsw i64 %474, %475
  %477 = trunc i64 %476 to i32
  %478 = lshr i64 %476, 32
  %479 = mul nuw nsw i64 %471, 3680671129
  %480 = add nuw nsw i64 %478, %479
  %481 = trunc i64 %480 to i32
  %482 = lshr i64 %480, 32
  %483 = mul nuw nsw i64 %471, 4113882560
  %484 = add nuw nsw i64 %482, %483
  %485 = trunc i64 %484 to i32
  %486 = lshr i64 %484, 32
  %487 = mul nuw nsw i64 %471, 4230436817
  %488 = add nuw nsw i64 %486, %487
  %489 = trunc i64 %488 to i32
  %490 = lshr i64 %488, 32
  %491 = mul nuw nsw i64 %471, 1313084713
  %492 = add nuw nsw i64 %490, %491
  %493 = trunc i64 %492 to i32
  %494 = lshr i64 %492, 32
  %495 = mul nuw nsw i64 %471, 2734261102
  %496 = add nuw nsw i64 %494, %495
  %497 = trunc i64 %496 to i32
  %498 = lshr i64 %496, 32
  %499 = trunc i64 %498 to i32
  %500 = add nsw i32 %468, -120
  %501 = icmp ugt i32 %500, 63
  %502 = select i1 %501, i32 %493, i32 %499
  %503 = select i1 %501, i32 %489, i32 %497
  %504 = select i1 %501, i32 %485, i32 %493
  %505 = select i1 %501, i32 %481, i32 %489
  %506 = select i1 %501, i32 %477, i32 %485
  %507 = select i1 %501, i32 %473, i32 %481
  %508 = select i1 %501, i32 -64, i32 0
  %509 = add nsw i32 %508, %500
  %510 = icmp ugt i32 %509, 31
  %511 = select i1 %510, i32 %503, i32 %502
  %512 = select i1 %510, i32 %504, i32 %503
  %513 = select i1 %510, i32 %505, i32 %504
  %514 = select i1 %510, i32 %506, i32 %505
  %515 = select i1 %510, i32 %507, i32 %506
  %516 = select i1 %510, i32 -32, i32 0
  %517 = add nsw i32 %516, %509
  %518 = icmp ugt i32 %517, 31
  %519 = select i1 %518, i32 %512, i32 %511
  %520 = select i1 %518, i32 %513, i32 %512
  %521 = select i1 %518, i32 %514, i32 %513
  %522 = select i1 %518, i32 %515, i32 %514
  %523 = select i1 %518, i32 -32, i32 0
  %524 = add nsw i32 %523, %517
  %525 = icmp eq i32 %524, 0
  %526 = sub nsw i32 32, %524
  %527 = tail call i32 @llvm.fshr.i32(i32 %519, i32 %520, i32 %526)
  %528 = tail call i32 @llvm.fshr.i32(i32 %520, i32 %521, i32 %526)
  %529 = tail call i32 @llvm.fshr.i32(i32 %521, i32 %522, i32 %526)
  %530 = select i1 %525, i32 %519, i32 %527
  %531 = select i1 %525, i32 %520, i32 %528
  %532 = select i1 %525, i32 %521, i32 %529
  %533 = lshr i32 %530, 29
  %534 = tail call i32 @llvm.fshl.i32(i32 %530, i32 %531, i32 2)
  %535 = tail call i32 @llvm.fshl.i32(i32 %531, i32 %532, i32 2)
  %536 = tail call i32 @llvm.fshl.i32(i32 %532, i32 %522, i32 2)
  %537 = and i32 %533, 1
  %538 = sub nsw i32 0, %537
  %539 = shl i32 %533, 31
  %540 = xor i32 %534, %538
  %541 = xor i32 %535, %538
  %542 = xor i32 %536, %538
  %543 = tail call i32 @llvm.ctlz.i32(i32 %540, i1 false), !range !21
  %544 = sub nsw i32 31, %543
  %545 = tail call i32 @llvm.fshr.i32(i32 %540, i32 %541, i32 %544)
  %546 = tail call i32 @llvm.fshr.i32(i32 %541, i32 %542, i32 %544)
  %547 = shl nuw nsw i32 %543, 23
  %548 = sub nuw nsw i32 1056964608, %547
  %549 = lshr i32 %545, 9
  %550 = or i32 %549, %548
  %551 = or i32 %550, %539
  %552 = bitcast i32 %551 to float
  %553 = tail call i32 @llvm.fshl.i32(i32 %545, i32 %546, i32 23)
  %554 = tail call i32 @llvm.ctlz.i32(i32 %553, i1 false), !range !21
  %555 = fmul float %552, 0x3FF921FB40000000
  %556 = add nuw nsw i32 %554, %543
  %557 = shl nuw nsw i32 %556, 23
  %558 = sub nuw nsw i32 855638016, %557
  %559 = sub nsw i32 31, %554
  %560 = tail call i32 @llvm.fshr.i32(i32 %553, i32 %546, i32 %559)
  %561 = lshr i32 %560, 9
  %562 = or i32 %558, %561
  %563 = or i32 %562, %539
  %564 = bitcast i32 %563 to float
  %565 = fneg float %555
  %566 = tail call float @llvm.fma.f32(float %552, float 0x3FF921FB40000000, float %565)
  %567 = tail call float @llvm.fma.f32(float %552, float 0x3E74442D00000000, float %566)
  %568 = tail call float @llvm.fma.f32(float %564, float 0x3FF921FB40000000, float %567)
  %569 = fadd float %555, %568
  %570 = lshr i32 %530, 30
  %571 = add nuw nsw i32 %537, %570
  br label %572

572:                                              ; preds = %458, %466
  %573 = phi i32 [ %465, %458 ], [ %467, %466 ]
  %574 = phi float [ %463, %458 ], [ %569, %466 ]
  %575 = phi i32 [ %464, %458 ], [ %571, %466 ]
  %576 = fmul float %574, %574
  %577 = tail call float @llvm.fmuladd.f32(float %576, float 0xBF29833040000000, float 0x3F81103880000000)
  %578 = tail call float @llvm.fmuladd.f32(float %576, float %577, float 0xBFC55553A0000000)
  %579 = fmul float %576, %578
  %580 = tail call float @llvm.fmuladd.f32(float %574, float %579, float %574)
  %581 = tail call float @llvm.fmuladd.f32(float %576, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %582 = tail call float @llvm.fmuladd.f32(float %576, float %581, float 0x3FA5557EE0000000)
  %583 = tail call float @llvm.fmuladd.f32(float %576, float %582, float 0xBFE0000080000000)
  %584 = tail call float @llvm.fmuladd.f32(float %576, float %583, float 1.000000e+00)
  %585 = and i32 %575, 1
  %586 = icmp eq i32 %585, 0
  %587 = select i1 %586, float %580, float %584
  %588 = bitcast float %587 to i32
  %589 = shl i32 %575, 30
  %590 = and i32 %589, -2147483648
  %591 = bitcast float %319 to i32
  %592 = xor i32 %573, %591
  %593 = xor i32 %592, %590
  %594 = xor i32 %593, %588
  %595 = bitcast i32 %594 to float
  %596 = select i1 %456, float %595, float 0x7FF8000000000000
  %597 = sdiv i32 %4, 2
  %598 = icmp sgt i32 %4, 0
  br i1 %598, label %599, label %610

599:                                              ; preds = %572
  %600 = sitofp i32 %597 to float
  br label %601

601:                                              ; preds = %599, %621
  %602 = phi i32 [ 0, %599 ], [ %622, %621 ]
  %603 = phi float [ 0.000000e+00, %599 ], [ %745, %621 ]
  %604 = sub nsw i32 %602, %597
  %605 = sitofp i32 %604 to float
  %606 = fmul contract float %596, %605
  %607 = fmul contract float %457, %605
  %608 = mul nsw i32 %602, %4
  %609 = add i32 %608, %18
  br label %624

610:                                              ; preds = %621, %572
  %611 = phi float [ 0.000000e+00, %572 ], [ %745, %621 ]
  %612 = sitofp i32 %17 to float
  %613 = fsub contract float %612, %611
  %614 = fdiv contract float %612, %613
  br i1 %598, label %615, label %928

615:                                              ; preds = %610
  %616 = add i32 %4, -1
  %617 = and i32 %4, 7
  %618 = icmp ult i32 %616, 7
  %619 = and i32 %4, -8
  %620 = icmp eq i32 %617, 0
  br label %752

621:                                              ; preds = %744
  %622 = add nuw nsw i32 %602, 1
  %623 = icmp eq i32 %622, %4
  br i1 %623, label %610, label %601, !llvm.loop !22

624:                                              ; preds = %601, %744
  %625 = phi i32 [ 0, %601 ], [ %750, %744 ]
  %626 = phi float [ %603, %601 ], [ %745, %744 ]
  %627 = sub nsw i32 %625, %597
  %628 = sitofp i32 %627 to float
  %629 = fmul contract float %457, %628
  %630 = fadd contract float %629, %600
  %631 = fadd contract float %606, %630
  %632 = fmul contract float %596, %628
  %633 = fsub contract float %600, %632
  %634 = fadd contract float %607, %633
  %635 = tail call float @llvm.floor.f32(float %631)
  %636 = fptosi float %635 to i32
  %637 = tail call float @llvm.ceil.f32(float %631)
  %638 = fptosi float %637 to i32
  %639 = icmp eq i32 %636, %638
  %640 = add nsw i32 %636, 1
  %641 = select i1 %639, i32 %640, i32 %638
  %642 = tail call float @llvm.floor.f32(float %634)
  %643 = fptosi float %642 to i32
  %644 = tail call float @llvm.ceil.f32(float %634)
  %645 = fptosi float %644 to i32
  %646 = icmp eq i32 %643, %645
  %647 = add nsw i32 %643, 1
  %648 = select i1 %646, i32 %647, i32 %645
  %649 = sitofp i32 %641 to float
  %650 = fsub contract float %649, %631
  %651 = sitofp i32 %636 to float
  %652 = fsub contract float %631, %651
  %653 = sitofp i32 %648 to float
  %654 = fsub contract float %653, %634
  %655 = sitofp i32 %643 to float
  %656 = fsub contract float %634, %655
  %657 = icmp sgt i32 %636, -1
  br i1 %657, label %658, label %674

658:                                              ; preds = %624
  %659 = icmp slt i32 %636, %4
  %660 = icmp sgt i32 %643, -1
  %661 = select i1 %659, i1 %660, i1 false
  %662 = icmp slt i32 %643, %4
  %663 = select i1 %661, i1 %662, i1 false
  br i1 %663, label %664, label %674

664:                                              ; preds = %658
  %665 = mul nsw i32 %643, %4
  %666 = add i32 %18, %636
  %667 = add i32 %666, %665
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds float, float addrspace(1)* %0, i64 %668
  %670 = load float, float addrspace(1)* %669, align 4, !tbaa !7
  %671 = fmul contract float %650, %670
  %672 = fmul contract float %654, %671
  %673 = fadd contract float %672, 0.000000e+00
  br label %677

674:                                              ; preds = %658, %624
  %675 = fmul contract float %650, %654
  %676 = fadd contract float %626, %675
  br label %677

677:                                              ; preds = %674, %664
  %678 = phi float [ %626, %664 ], [ %676, %674 ]
  %679 = phi float [ %673, %664 ], [ 0.000000e+00, %674 ]
  %680 = icmp sgt i32 %641, -1
  br i1 %680, label %681, label %697

681:                                              ; preds = %677
  %682 = icmp slt i32 %641, %4
  %683 = icmp sgt i32 %643, -1
  %684 = select i1 %682, i1 %683, i1 false
  %685 = icmp slt i32 %643, %4
  %686 = select i1 %684, i1 %685, i1 false
  br i1 %686, label %687, label %697

687:                                              ; preds = %681
  %688 = mul nsw i32 %643, %4
  %689 = add i32 %641, %18
  %690 = add i32 %689, %688
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds float, float addrspace(1)* %0, i64 %691
  %693 = load float, float addrspace(1)* %692, align 4, !tbaa !7
  %694 = fmul contract float %652, %693
  %695 = fmul contract float %654, %694
  %696 = fadd contract float %679, %695
  br label %700

697:                                              ; preds = %681, %677
  %698 = fmul contract float %652, %654
  %699 = fadd contract float %698, %678
  br label %700

700:                                              ; preds = %697, %687
  %701 = phi float [ %678, %687 ], [ %699, %697 ]
  %702 = phi float [ %696, %687 ], [ %679, %697 ]
  br i1 %657, label %703, label %719

703:                                              ; preds = %700
  %704 = icmp slt i32 %636, %4
  %705 = icmp sgt i32 %648, -1
  %706 = select i1 %704, i1 %705, i1 false
  %707 = icmp slt i32 %648, %4
  %708 = select i1 %706, i1 %707, i1 false
  br i1 %708, label %709, label %719

709:                                              ; preds = %703
  %710 = mul nsw i32 %648, %4
  %711 = add i32 %18, %636
  %712 = add i32 %711, %710
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds float, float addrspace(1)* %0, i64 %713
  %715 = load float, float addrspace(1)* %714, align 4, !tbaa !7
  %716 = fmul contract float %650, %715
  %717 = fmul contract float %656, %716
  %718 = fadd contract float %702, %717
  br label %722

719:                                              ; preds = %703, %700
  %720 = fmul contract float %656, %650
  %721 = fadd contract float %720, %701
  br label %722

722:                                              ; preds = %719, %709
  %723 = phi float [ %701, %709 ], [ %721, %719 ]
  %724 = phi float [ %718, %709 ], [ %702, %719 ]
  br i1 %680, label %725, label %741

725:                                              ; preds = %722
  %726 = icmp slt i32 %641, %4
  %727 = icmp sgt i32 %648, -1
  %728 = select i1 %726, i1 %727, i1 false
  %729 = icmp slt i32 %648, %4
  %730 = select i1 %728, i1 %729, i1 false
  br i1 %730, label %731, label %741

731:                                              ; preds = %725
  %732 = mul nsw i32 %648, %4
  %733 = add i32 %641, %18
  %734 = add i32 %733, %732
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !7
  %738 = fmul contract float %652, %737
  %739 = fmul contract float %656, %738
  %740 = fadd contract float %724, %739
  br label %744

741:                                              ; preds = %725, %722
  %742 = fmul contract float %652, %656
  %743 = fadd contract float %742, %723
  br label %744

744:                                              ; preds = %741, %731
  %745 = phi float [ %723, %731 ], [ %743, %741 ]
  %746 = phi float [ %740, %731 ], [ %724, %741 ]
  %747 = add i32 %609, %625
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds float, float addrspace(1)* %1, i64 %748
  store float %746, float addrspace(1)* %749, align 4, !tbaa !7
  %750 = add nuw nsw i32 %625, 1
  %751 = icmp eq i32 %750, %4
  br i1 %751, label %621, label %624, !llvm.loop !23

752:                                              ; preds = %615, %769
  %753 = phi i32 [ %770, %769 ], [ 0, %615 ]
  %754 = mul nsw i32 %753, %4
  %755 = add i32 %754, %18
  br i1 %618, label %756, label %772

756:                                              ; preds = %772, %752
  %757 = phi i32 [ 0, %752 ], [ %822, %772 ]
  br i1 %620, label %769, label %758

758:                                              ; preds = %756, %758
  %759 = phi i32 [ %766, %758 ], [ %757, %756 ]
  %760 = phi i32 [ %767, %758 ], [ 0, %756 ]
  %761 = add i32 %755, %759
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds float, float addrspace(1)* %1, i64 %762
  %764 = load float, float addrspace(1)* %763, align 4, !tbaa !7
  %765 = fmul contract float %614, %764
  store float %765, float addrspace(1)* %763, align 4, !tbaa !7
  %766 = add nuw nsw i32 %759, 1
  %767 = add i32 %760, 1
  %768 = icmp eq i32 %767, %617
  br i1 %768, label %769, label %758, !llvm.loop !24

769:                                              ; preds = %758, %756
  %770 = add nuw nsw i32 %753, 1
  %771 = icmp eq i32 %770, %4
  br i1 %771, label %928, label %752, !llvm.loop !25

772:                                              ; preds = %752, %772
  %773 = phi i32 [ %822, %772 ], [ 0, %752 ]
  %774 = phi i32 [ %823, %772 ], [ 0, %752 ]
  %775 = add i32 %755, %773
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds float, float addrspace(1)* %1, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %779 = fmul contract float %614, %778
  store float %779, float addrspace(1)* %777, align 4, !tbaa !7
  %780 = or i32 %773, 1
  %781 = add i32 %755, %780
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds float, float addrspace(1)* %1, i64 %782
  %784 = load float, float addrspace(1)* %783, align 4, !tbaa !7
  %785 = fmul contract float %614, %784
  store float %785, float addrspace(1)* %783, align 4, !tbaa !7
  %786 = or i32 %773, 2
  %787 = add i32 %755, %786
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds float, float addrspace(1)* %1, i64 %788
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !7
  %791 = fmul contract float %614, %790
  store float %791, float addrspace(1)* %789, align 4, !tbaa !7
  %792 = or i32 %773, 3
  %793 = add i32 %755, %792
  %794 = sext i32 %793 to i64
  %795 = getelementptr inbounds float, float addrspace(1)* %1, i64 %794
  %796 = load float, float addrspace(1)* %795, align 4, !tbaa !7
  %797 = fmul contract float %614, %796
  store float %797, float addrspace(1)* %795, align 4, !tbaa !7
  %798 = or i32 %773, 4
  %799 = add i32 %755, %798
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %1, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !7
  %803 = fmul contract float %614, %802
  store float %803, float addrspace(1)* %801, align 4, !tbaa !7
  %804 = or i32 %773, 5
  %805 = add i32 %755, %804
  %806 = sext i32 %805 to i64
  %807 = getelementptr inbounds float, float addrspace(1)* %1, i64 %806
  %808 = load float, float addrspace(1)* %807, align 4, !tbaa !7
  %809 = fmul contract float %614, %808
  store float %809, float addrspace(1)* %807, align 4, !tbaa !7
  %810 = or i32 %773, 6
  %811 = add i32 %755, %810
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds float, float addrspace(1)* %1, i64 %812
  %814 = load float, float addrspace(1)* %813, align 4, !tbaa !7
  %815 = fmul contract float %614, %814
  store float %815, float addrspace(1)* %813, align 4, !tbaa !7
  %816 = or i32 %773, 7
  %817 = add i32 %755, %816
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds float, float addrspace(1)* %1, i64 %818
  %820 = load float, float addrspace(1)* %819, align 4, !tbaa !7
  %821 = fmul contract float %614, %820
  store float %821, float addrspace(1)* %819, align 4, !tbaa !7
  %822 = add nuw nsw i32 %773, 8
  %823 = add i32 %774, 8
  %824 = icmp eq i32 %823, %619
  br i1 %824, label %756, label %772, !llvm.loop !26

825:                                              ; preds = %306
  %826 = icmp eq i32 %21, 7
  %827 = icmp sgt i32 %4, 0
  %828 = select i1 %826, i1 %827, i1 false
  br i1 %828, label %829, label %928

829:                                              ; preds = %825
  %830 = add i32 %4, -1
  %831 = and i32 %4, 7
  %832 = icmp ult i32 %830, 7
  %833 = and i32 %4, -8
  %834 = icmp eq i32 %831, 0
  br label %835

835:                                              ; preds = %829, %856
  %836 = phi i32 [ %857, %856 ], [ 0, %829 ]
  %837 = mul nsw i32 %836, %4
  %838 = add i32 %837, %18
  %839 = add nsw i32 %838, -1
  %840 = add i32 %839, %4
  br i1 %832, label %841, label %859

841:                                              ; preds = %859, %835
  %842 = phi i32 [ 0, %835 ], [ %925, %859 ]
  br i1 %834, label %856, label %843

843:                                              ; preds = %841, %843
  %844 = phi i32 [ %853, %843 ], [ %842, %841 ]
  %845 = phi i32 [ %854, %843 ], [ 0, %841 ]
  %846 = add i32 %838, %844
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds float, float addrspace(1)* %0, i64 %847
  %849 = load float, float addrspace(1)* %848, align 4, !tbaa !7
  %850 = sub i32 %840, %844
  %851 = sext i32 %850 to i64
  %852 = getelementptr inbounds float, float addrspace(1)* %1, i64 %851
  store float %849, float addrspace(1)* %852, align 4, !tbaa !7
  %853 = add nuw nsw i32 %844, 1
  %854 = add i32 %845, 1
  %855 = icmp eq i32 %854, %831
  br i1 %855, label %856, label %843, !llvm.loop !27

856:                                              ; preds = %843, %841
  %857 = add nuw nsw i32 %836, 1
  %858 = icmp eq i32 %857, %4
  br i1 %858, label %928, label %835, !llvm.loop !28

859:                                              ; preds = %835, %859
  %860 = phi i32 [ %925, %859 ], [ 0, %835 ]
  %861 = phi i32 [ %926, %859 ], [ 0, %835 ]
  %862 = add i32 %838, %860
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds float, float addrspace(1)* %0, i64 %863
  %865 = load float, float addrspace(1)* %864, align 4, !tbaa !7
  %866 = sub i32 %840, %860
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds float, float addrspace(1)* %1, i64 %867
  store float %865, float addrspace(1)* %868, align 4, !tbaa !7
  %869 = or i32 %860, 1
  %870 = add i32 %838, %869
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds float, float addrspace(1)* %0, i64 %871
  %873 = load float, float addrspace(1)* %872, align 4, !tbaa !7
  %874 = sub i32 %840, %869
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds float, float addrspace(1)* %1, i64 %875
  store float %873, float addrspace(1)* %876, align 4, !tbaa !7
  %877 = or i32 %860, 2
  %878 = add i32 %838, %877
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds float, float addrspace(1)* %0, i64 %879
  %881 = load float, float addrspace(1)* %880, align 4, !tbaa !7
  %882 = sub i32 %840, %877
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds float, float addrspace(1)* %1, i64 %883
  store float %881, float addrspace(1)* %884, align 4, !tbaa !7
  %885 = or i32 %860, 3
  %886 = add i32 %838, %885
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds float, float addrspace(1)* %0, i64 %887
  %889 = load float, float addrspace(1)* %888, align 4, !tbaa !7
  %890 = sub i32 %840, %885
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds float, float addrspace(1)* %1, i64 %891
  store float %889, float addrspace(1)* %892, align 4, !tbaa !7
  %893 = or i32 %860, 4
  %894 = add i32 %838, %893
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds float, float addrspace(1)* %0, i64 %895
  %897 = load float, float addrspace(1)* %896, align 4, !tbaa !7
  %898 = sub i32 %840, %893
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds float, float addrspace(1)* %1, i64 %899
  store float %897, float addrspace(1)* %900, align 4, !tbaa !7
  %901 = or i32 %860, 5
  %902 = add i32 %838, %901
  %903 = sext i32 %902 to i64
  %904 = getelementptr inbounds float, float addrspace(1)* %0, i64 %903
  %905 = load float, float addrspace(1)* %904, align 4, !tbaa !7
  %906 = sub i32 %840, %901
  %907 = sext i32 %906 to i64
  %908 = getelementptr inbounds float, float addrspace(1)* %1, i64 %907
  store float %905, float addrspace(1)* %908, align 4, !tbaa !7
  %909 = or i32 %860, 6
  %910 = add i32 %838, %909
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds float, float addrspace(1)* %0, i64 %911
  %913 = load float, float addrspace(1)* %912, align 4, !tbaa !7
  %914 = sub i32 %840, %909
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds float, float addrspace(1)* %1, i64 %915
  store float %913, float addrspace(1)* %916, align 4, !tbaa !7
  %917 = or i32 %860, 7
  %918 = add i32 %838, %917
  %919 = sext i32 %918 to i64
  %920 = getelementptr inbounds float, float addrspace(1)* %0, i64 %919
  %921 = load float, float addrspace(1)* %920, align 4, !tbaa !7
  %922 = sub i32 %840, %917
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds float, float addrspace(1)* %1, i64 %923
  store float %921, float addrspace(1)* %924, align 4, !tbaa !7
  %925 = add nuw nsw i32 %860, 8
  %926 = add i32 %861, 8
  %927 = icmp eq i32 %926, %833
  br i1 %927, label %841, label %859, !llvm.loop !29

928:                                              ; preds = %856, %769, %269, %50, %121, %610, %155, %25, %825, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
!21 = !{i32 0, i32 33}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !12}
!28 = distinct !{!28, !14}
!29 = distinct !{!29, !14}
