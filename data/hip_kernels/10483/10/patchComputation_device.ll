; ModuleID = '../data/hip_kernels/10483/10/main.cu'
source_filename = "../data/hip_kernels/10483/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16patchComputationiiiiiiiffffiPKiPKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9, float %10, i32 %11, i32 addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture writeonly %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %0
  br i1 %25, label %26, label %353

26:                                               ; preds = %15
  %27 = mul nsw i32 %11, %5
  %28 = sdiv i32 %24, %27
  %29 = mul nsw i32 %28, %27
  %30 = sub nsw i32 %24, %29
  %31 = sdiv i32 %30, %11
  %32 = mul nsw i32 %31, %11
  %33 = sub nsw i32 %30, %32
  %34 = add nsw i32 %33, 1
  %35 = add nsw i32 %31, 1
  %36 = mul nsw i32 %35, %3
  %37 = icmp sgt i32 %36, %2
  %38 = mul nsw i32 %31, %3
  %39 = sub nsw i32 %2, %38
  %40 = select i1 %37, i32 %39, i32 %3
  %41 = add nsw i32 %28, 1
  %42 = mul i32 %41, %4
  %43 = icmp sgt i32 %42, %1
  %44 = mul i32 %28, %4
  %45 = sub nsw i32 %1, %44
  %46 = select i1 %43, i32 %45, i32 %4
  %47 = icmp sgt i32 %40, 0
  br i1 %47, label %48, label %62

48:                                               ; preds = %26
  %49 = icmp sgt i32 %46, 0
  %50 = tail call i32 @llvm.smin.i32(i32 %1, i32 %42)
  %51 = xor i32 %44, -1
  %52 = add i32 %50, %51
  %53 = and i32 %46, 7
  %54 = icmp ult i32 %52, 7
  %55 = and i32 %46, -8
  %56 = icmp eq i32 %53, 0
  br label %57

57:                                               ; preds = %48, %95
  %58 = phi float [ 0.000000e+00, %48 ], [ %96, %95 ]
  %59 = phi i32 [ 0, %48 ], [ %97, %95 ]
  br i1 %49, label %60, label %95

60:                                               ; preds = %57
  %61 = add nsw i32 %59, %38
  br i1 %54, label %75, label %99

62:                                               ; preds = %95, %26
  %63 = phi float [ 0.000000e+00, %26 ], [ %96, %95 ]
  %64 = fcmp contract ogt float %63, 0.000000e+00
  br i1 %64, label %65, label %332

65:                                               ; preds = %62
  br i1 %47, label %66, label %193

66:                                               ; preds = %65
  %67 = icmp sgt i32 %46, 0
  %68 = tail call i32 @llvm.smin.i32(i32 %1, i32 %42)
  %69 = xor i32 %44, -1
  %70 = add i32 %68, %69
  %71 = and i32 %46, 3
  %72 = icmp ult i32 %70, 3
  %73 = and i32 %46, -4
  %74 = icmp eq i32 %71, 0
  br label %185

75:                                               ; preds = %99, %60
  %76 = phi float [ undef, %60 ], [ %181, %99 ]
  %77 = phi float [ %58, %60 ], [ %181, %99 ]
  %78 = phi i32 [ 0, %60 ], [ %182, %99 ]
  br i1 %56, label %95, label %79

79:                                               ; preds = %75, %79
  %80 = phi float [ %91, %79 ], [ %77, %75 ]
  %81 = phi i32 [ %92, %79 ], [ %78, %75 ]
  %82 = phi i32 [ %93, %79 ], [ 0, %75 ]
  %83 = add nsw i32 %81, %44
  %84 = mul nsw i32 %83, %1
  %85 = add nsw i32 %61, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = icmp eq i32 %88, %34
  %90 = uitofp i1 %89 to float
  %91 = fadd contract float %80, %90
  %92 = add nuw nsw i32 %81, 1
  %93 = add i32 %82, 1
  %94 = icmp eq i32 %93, %53
  br i1 %94, label %95, label %79, !llvm.loop !11

95:                                               ; preds = %75, %79, %57
  %96 = phi float [ %58, %57 ], [ %76, %75 ], [ %91, %79 ]
  %97 = add nuw nsw i32 %59, 1
  %98 = icmp slt i32 %97, %40
  br i1 %98, label %57, label %62, !llvm.loop !13

99:                                               ; preds = %60, %99
  %100 = phi float [ %181, %99 ], [ %58, %60 ]
  %101 = phi i32 [ %182, %99 ], [ 0, %60 ]
  %102 = phi i32 [ %183, %99 ], [ 0, %60 ]
  %103 = add nsw i32 %101, %44
  %104 = mul nsw i32 %103, %1
  %105 = add nsw i32 %61, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = icmp eq i32 %108, %34
  %110 = uitofp i1 %109 to float
  %111 = fadd contract float %100, %110
  %112 = or i32 %101, 1
  %113 = add nsw i32 %112, %44
  %114 = mul nsw i32 %113, %1
  %115 = add nsw i32 %61, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = icmp eq i32 %118, %34
  %120 = uitofp i1 %119 to float
  %121 = fadd contract float %111, %120
  %122 = or i32 %101, 2
  %123 = add nsw i32 %122, %44
  %124 = mul nsw i32 %123, %1
  %125 = add nsw i32 %61, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = icmp eq i32 %128, %34
  %130 = uitofp i1 %129 to float
  %131 = fadd contract float %121, %130
  %132 = or i32 %101, 3
  %133 = add nsw i32 %132, %44
  %134 = mul nsw i32 %133, %1
  %135 = add nsw i32 %61, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = icmp eq i32 %138, %34
  %140 = uitofp i1 %139 to float
  %141 = fadd contract float %131, %140
  %142 = or i32 %101, 4
  %143 = add nsw i32 %142, %44
  %144 = mul nsw i32 %143, %1
  %145 = add nsw i32 %61, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = icmp eq i32 %148, %34
  %150 = uitofp i1 %149 to float
  %151 = fadd contract float %141, %150
  %152 = or i32 %101, 5
  %153 = add nsw i32 %152, %44
  %154 = mul nsw i32 %153, %1
  %155 = add nsw i32 %61, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %156
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = icmp eq i32 %158, %34
  %160 = uitofp i1 %159 to float
  %161 = fadd contract float %151, %160
  %162 = or i32 %101, 6
  %163 = add nsw i32 %162, %44
  %164 = mul nsw i32 %163, %1
  %165 = add nsw i32 %61, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !5
  %169 = icmp eq i32 %168, %34
  %170 = uitofp i1 %169 to float
  %171 = fadd contract float %161, %170
  %172 = or i32 %101, 7
  %173 = add nsw i32 %172, %44
  %174 = mul nsw i32 %173, %1
  %175 = add nsw i32 %61, %174
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %176
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !5
  %179 = icmp eq i32 %178, %34
  %180 = uitofp i1 %179 to float
  %181 = fadd contract float %171, %180
  %182 = add nuw nsw i32 %101, 8
  %183 = add i32 %102, 8
  %184 = icmp eq i32 %183, %55
  br i1 %184, label %75, label %99, !llvm.loop !15

185:                                              ; preds = %66, %242
  %186 = phi i32 [ 0, %66 ], [ %246, %242 ]
  %187 = phi float [ 0.000000e+00, %66 ], [ %245, %242 ]
  %188 = phi float [ 0.000000e+00, %66 ], [ %244, %242 ]
  %189 = phi float [ 0.000000e+00, %66 ], [ %243, %242 ]
  br i1 %67, label %190, label %242

190:                                              ; preds = %185
  %191 = add nsw i32 %186, %38
  %192 = sitofp i32 %186 to float
  br i1 %72, label %207, label %248

193:                                              ; preds = %242, %65
  %194 = phi float [ 0.000000e+00, %65 ], [ %243, %242 ]
  %195 = phi float [ 0.000000e+00, %65 ], [ %244, %242 ]
  %196 = phi float [ 0.000000e+00, %65 ], [ %245, %242 ]
  %197 = fdiv contract float %195, %63
  %198 = sitofp i32 %38 to float
  %199 = fadd contract float %197, %198
  %200 = fmul contract float %199, %8
  %201 = fdiv contract float %196, %63
  %202 = sitofp i32 %44 to float
  %203 = fadd contract float %201, %202
  %204 = fmul contract float %203, %9
  %205 = fmul contract float %63, %7
  %206 = fmul contract float %205, %10
  br label %332

207:                                              ; preds = %325, %190
  %208 = phi float [ undef, %190 ], [ %326, %325 ]
  %209 = phi float [ undef, %190 ], [ %327, %325 ]
  %210 = phi float [ undef, %190 ], [ %328, %325 ]
  %211 = phi i32 [ 0, %190 ], [ %329, %325 ]
  %212 = phi float [ %187, %190 ], [ %328, %325 ]
  %213 = phi float [ %188, %190 ], [ %327, %325 ]
  %214 = phi float [ %189, %190 ], [ %326, %325 ]
  br i1 %74, label %242, label %215

215:                                              ; preds = %207, %235
  %216 = phi i32 [ %239, %235 ], [ %211, %207 ]
  %217 = phi float [ %238, %235 ], [ %212, %207 ]
  %218 = phi float [ %237, %235 ], [ %213, %207 ]
  %219 = phi float [ %236, %235 ], [ %214, %207 ]
  %220 = phi i32 [ %240, %235 ], [ 0, %207 ]
  %221 = add nsw i32 %216, %44
  %222 = mul nsw i32 %221, %1
  %223 = add nsw i32 %191, %222
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %224
  %226 = load i32, i32 addrspace(1)* %225, align 4, !tbaa !7, !amdgpu.noclobber !5
  %227 = icmp eq i32 %226, %34
  br i1 %227, label %228, label %235

228:                                              ; preds = %215
  %229 = getelementptr inbounds float, float addrspace(1)* %13, i64 %224
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !16, !amdgpu.noclobber !5
  %231 = fadd contract float %219, %230
  %232 = fadd contract float %218, %192
  %233 = sitofp i32 %216 to float
  %234 = fadd contract float %217, %233
  br label %235

235:                                              ; preds = %228, %215
  %236 = phi float [ %231, %228 ], [ %219, %215 ]
  %237 = phi float [ %232, %228 ], [ %218, %215 ]
  %238 = phi float [ %234, %228 ], [ %217, %215 ]
  %239 = add nuw nsw i32 %216, 1
  %240 = add i32 %220, 1
  %241 = icmp eq i32 %240, %71
  br i1 %241, label %242, label %215, !llvm.loop !18

242:                                              ; preds = %207, %235, %185
  %243 = phi float [ %189, %185 ], [ %208, %207 ], [ %236, %235 ]
  %244 = phi float [ %188, %185 ], [ %209, %207 ], [ %237, %235 ]
  %245 = phi float [ %187, %185 ], [ %210, %207 ], [ %238, %235 ]
  %246 = add nuw nsw i32 %186, 1
  %247 = icmp slt i32 %246, %40
  br i1 %247, label %185, label %193, !llvm.loop !19

248:                                              ; preds = %190, %325
  %249 = phi i32 [ %329, %325 ], [ 0, %190 ]
  %250 = phi float [ %328, %325 ], [ %187, %190 ]
  %251 = phi float [ %327, %325 ], [ %188, %190 ]
  %252 = phi float [ %326, %325 ], [ %189, %190 ]
  %253 = phi i32 [ %330, %325 ], [ 0, %190 ]
  %254 = add nsw i32 %249, %44
  %255 = mul nsw i32 %254, %1
  %256 = add nsw i32 %191, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %257
  %259 = load i32, i32 addrspace(1)* %258, align 4, !tbaa !7, !amdgpu.noclobber !5
  %260 = icmp eq i32 %259, %34
  br i1 %260, label %261, label %268

261:                                              ; preds = %248
  %262 = getelementptr inbounds float, float addrspace(1)* %13, i64 %257
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !16, !amdgpu.noclobber !5
  %264 = fadd contract float %252, %263
  %265 = fadd contract float %251, %192
  %266 = sitofp i32 %249 to float
  %267 = fadd contract float %250, %266
  br label %268

268:                                              ; preds = %261, %248
  %269 = phi float [ %264, %261 ], [ %252, %248 ]
  %270 = phi float [ %265, %261 ], [ %251, %248 ]
  %271 = phi float [ %267, %261 ], [ %250, %248 ]
  %272 = or i32 %249, 1
  %273 = add nsw i32 %272, %44
  %274 = mul nsw i32 %273, %1
  %275 = add nsw i32 %191, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %276
  %278 = load i32, i32 addrspace(1)* %277, align 4, !tbaa !7, !amdgpu.noclobber !5
  %279 = icmp eq i32 %278, %34
  br i1 %279, label %280, label %287

280:                                              ; preds = %268
  %281 = getelementptr inbounds float, float addrspace(1)* %13, i64 %276
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !16, !amdgpu.noclobber !5
  %283 = fadd contract float %269, %282
  %284 = fadd contract float %270, %192
  %285 = sitofp i32 %272 to float
  %286 = fadd contract float %271, %285
  br label %287

287:                                              ; preds = %280, %268
  %288 = phi float [ %283, %280 ], [ %269, %268 ]
  %289 = phi float [ %284, %280 ], [ %270, %268 ]
  %290 = phi float [ %286, %280 ], [ %271, %268 ]
  %291 = or i32 %249, 2
  %292 = add nsw i32 %291, %44
  %293 = mul nsw i32 %292, %1
  %294 = add nsw i32 %191, %293
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %295
  %297 = load i32, i32 addrspace(1)* %296, align 4, !tbaa !7, !amdgpu.noclobber !5
  %298 = icmp eq i32 %297, %34
  br i1 %298, label %299, label %306

299:                                              ; preds = %287
  %300 = getelementptr inbounds float, float addrspace(1)* %13, i64 %295
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !16, !amdgpu.noclobber !5
  %302 = fadd contract float %288, %301
  %303 = fadd contract float %289, %192
  %304 = sitofp i32 %291 to float
  %305 = fadd contract float %290, %304
  br label %306

306:                                              ; preds = %299, %287
  %307 = phi float [ %302, %299 ], [ %288, %287 ]
  %308 = phi float [ %303, %299 ], [ %289, %287 ]
  %309 = phi float [ %305, %299 ], [ %290, %287 ]
  %310 = or i32 %249, 3
  %311 = add nsw i32 %310, %44
  %312 = mul nsw i32 %311, %1
  %313 = add nsw i32 %191, %312
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %314
  %316 = load i32, i32 addrspace(1)* %315, align 4, !tbaa !7, !amdgpu.noclobber !5
  %317 = icmp eq i32 %316, %34
  br i1 %317, label %318, label %325

318:                                              ; preds = %306
  %319 = getelementptr inbounds float, float addrspace(1)* %13, i64 %314
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !16, !amdgpu.noclobber !5
  %321 = fadd contract float %307, %320
  %322 = fadd contract float %308, %192
  %323 = sitofp i32 %310 to float
  %324 = fadd contract float %309, %323
  br label %325

325:                                              ; preds = %318, %306
  %326 = phi float [ %321, %318 ], [ %307, %306 ]
  %327 = phi float [ %322, %318 ], [ %308, %306 ]
  %328 = phi float [ %324, %318 ], [ %309, %306 ]
  %329 = add nuw nsw i32 %249, 4
  %330 = add i32 %253, 4
  %331 = icmp eq i32 %330, %73
  br i1 %331, label %207, label %248, !llvm.loop !20

332:                                              ; preds = %193, %62
  %333 = phi float [ %194, %193 ], [ 0.000000e+00, %62 ]
  %334 = phi float [ %200, %193 ], [ 0.000000e+00, %62 ]
  %335 = phi float [ %204, %193 ], [ 0.000000e+00, %62 ]
  %336 = phi float [ %206, %193 ], [ 0.000000e+00, %62 ]
  %337 = phi float [ %205, %193 ], [ %63, %62 ]
  %338 = mul nsw i32 %24, 5
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %14, i64 %339
  store float %337, float addrspace(1)* %340, align 4, !tbaa !16
  %341 = add nsw i32 %338, 1
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %14, i64 %342
  store float %336, float addrspace(1)* %343, align 4, !tbaa !16
  %344 = add nsw i32 %338, 2
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds float, float addrspace(1)* %14, i64 %345
  store float %333, float addrspace(1)* %346, align 4, !tbaa !16
  %347 = add nsw i32 %338, 3
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float addrspace(1)* %14, i64 %348
  store float %334, float addrspace(1)* %349, align 4, !tbaa !16
  %350 = add nsw i32 %338, 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %14, i64 %351
  store float %335, float addrspace(1)* %352, align 4, !tbaa !16
  br label %353

353:                                              ; preds = %332, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !9, i64 0}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
