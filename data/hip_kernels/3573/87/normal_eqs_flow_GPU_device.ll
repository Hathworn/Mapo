; ModuleID = '../data/hip_kernels/3573/87/main.cu'
source_filename = "../data/hip_kernels/3573/87/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19normal_eqs_flow_GPUPfPK15HIP_vector_typeIfLj2EEPKfPKiffffiiS7_S7_(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float %4, float %5, float %6, float %7, i32 %8, i32 %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = mul i32 %26, %20
  %28 = mul i32 %25, %20
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !15, !amdgpu.noclobber !14
  %33 = sitofp i32 %32 to float
  %34 = sitofp i32 %28 to float
  %35 = fdiv contract float %33, %34
  %36 = tail call float @llvm.ceil.f32(float %35)
  %37 = fptosi float %36 to i32
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %30
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !15, !amdgpu.noclobber !14
  %40 = mul i32 %27, %37
  %41 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %42 = add i32 %40, %41
  %43 = add i32 %26, 1
  %44 = mul i32 %43, %20
  %45 = mul i32 %44, %37
  %46 = icmp ult i32 %42, %45
  br i1 %46, label %47, label %52

47:                                               ; preds = %12
  %48 = mul nsw i32 %9, %8
  %49 = sitofp i32 %9 to float
  %50 = fmul contract float %4, %4
  %51 = fmul contract float %5, %5
  br label %169

52:                                               ; preds = %356, %12
  %53 = phi float [ 0.000000e+00, %12 ], [ %357, %356 ]
  %54 = phi float [ 0.000000e+00, %12 ], [ %358, %356 ]
  %55 = phi float [ 0.000000e+00, %12 ], [ %359, %356 ]
  %56 = phi float [ 0.000000e+00, %12 ], [ %360, %356 ]
  %57 = phi float [ 0.000000e+00, %12 ], [ %361, %356 ]
  %58 = phi float [ 0.000000e+00, %12 ], [ %362, %356 ]
  %59 = phi float [ 0.000000e+00, %12 ], [ %363, %356 ]
  %60 = phi float [ 0.000000e+00, %12 ], [ %364, %356 ]
  %61 = phi float [ 0.000000e+00, %12 ], [ %365, %356 ]
  %62 = phi float [ 0.000000e+00, %12 ], [ %366, %356 ]
  %63 = phi float [ 0.000000e+00, %12 ], [ %367, %356 ]
  %64 = phi float [ 0.000000e+00, %12 ], [ %368, %356 ]
  %65 = phi float [ 0.000000e+00, %12 ], [ %369, %356 ]
  %66 = phi float [ 0.000000e+00, %12 ], [ %370, %356 ]
  %67 = phi float [ 0.000000e+00, %12 ], [ %371, %356 ]
  %68 = phi float [ 0.000000e+00, %12 ], [ %372, %356 ]
  %69 = phi float [ 0.000000e+00, %12 ], [ %373, %356 ]
  %70 = phi float [ 0.000000e+00, %12 ], [ %374, %356 ]
  %71 = phi float [ 0.000000e+00, %12 ], [ %375, %356 ]
  %72 = phi float [ 0.000000e+00, %12 ], [ %376, %356 ]
  %73 = phi float [ 0.000000e+00, %12 ], [ %377, %356 ]
  %74 = phi float [ 0.000000e+00, %12 ], [ %378, %356 ]
  %75 = phi float [ 0.000000e+00, %12 ], [ %379, %356 ]
  %76 = mul i32 %29, 23
  %77 = mul i32 %76, %28
  %78 = add i32 %27, %41
  %79 = add i32 %78, %77
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  store float %75, float addrspace(1)* %81, align 4, !tbaa !20
  %82 = add nsw i32 %79, %28
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  store float %74, float addrspace(1)* %84, align 4, !tbaa !20
  %85 = shl nsw i32 %28, 1
  %86 = add nsw i32 %79, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %73, float addrspace(1)* %88, align 4, !tbaa !20
  %89 = mul nsw i32 %28, 3
  %90 = add nsw i32 %79, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  store float %72, float addrspace(1)* %92, align 4, !tbaa !20
  %93 = shl nsw i32 %28, 2
  %94 = add nsw i32 %79, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  store float %71, float addrspace(1)* %96, align 4, !tbaa !20
  %97 = mul nsw i32 %28, 5
  %98 = add nsw i32 %79, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float %70, float addrspace(1)* %100, align 4, !tbaa !20
  %101 = mul nsw i32 %28, 6
  %102 = add nsw i32 %79, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  store float %69, float addrspace(1)* %104, align 4, !tbaa !20
  %105 = mul nsw i32 %28, 7
  %106 = add nsw i32 %79, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  store float %68, float addrspace(1)* %108, align 4, !tbaa !20
  %109 = shl nsw i32 %28, 3
  %110 = add nsw i32 %79, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  store float %53, float addrspace(1)* %112, align 4, !tbaa !20
  %113 = mul nsw i32 %28, 9
  %114 = add nsw i32 %79, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  store float %54, float addrspace(1)* %116, align 4, !tbaa !20
  %117 = mul nsw i32 %28, 10
  %118 = add nsw i32 %79, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  store float %55, float addrspace(1)* %120, align 4, !tbaa !20
  %121 = mul nsw i32 %28, 11
  %122 = add nsw i32 %79, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  store float %56, float addrspace(1)* %124, align 4, !tbaa !20
  %125 = mul nsw i32 %28, 12
  %126 = add nsw i32 %79, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  store float %57, float addrspace(1)* %128, align 4, !tbaa !20
  %129 = mul nsw i32 %28, 13
  %130 = add nsw i32 %79, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  store float %58, float addrspace(1)* %132, align 4, !tbaa !20
  %133 = mul nsw i32 %28, 14
  %134 = add nsw i32 %79, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  store float %59, float addrspace(1)* %136, align 4, !tbaa !20
  %137 = mul nsw i32 %28, 15
  %138 = add nsw i32 %79, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  store float %60, float addrspace(1)* %140, align 4, !tbaa !20
  %141 = shl nsw i32 %28, 4
  %142 = add nsw i32 %79, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  store float %61, float addrspace(1)* %144, align 4, !tbaa !20
  %145 = mul nsw i32 %28, 17
  %146 = add nsw i32 %79, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  store float %62, float addrspace(1)* %148, align 4, !tbaa !20
  %149 = mul nsw i32 %28, 18
  %150 = add nsw i32 %79, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  store float %63, float addrspace(1)* %152, align 4, !tbaa !20
  %153 = mul nsw i32 %28, 19
  %154 = add nsw i32 %79, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  store float %64, float addrspace(1)* %156, align 4, !tbaa !20
  %157 = mul nsw i32 %28, 20
  %158 = add nsw i32 %79, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  store float %65, float addrspace(1)* %160, align 4, !tbaa !20
  %161 = mul nsw i32 %28, 21
  %162 = add nsw i32 %79, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  store float %66, float addrspace(1)* %164, align 4, !tbaa !20
  %165 = mul nsw i32 %28, 22
  %166 = add nsw i32 %79, %165
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  store float %67, float addrspace(1)* %168, align 4, !tbaa !20
  ret void

169:                                              ; preds = %47, %356
  %170 = phi float [ 0.000000e+00, %47 ], [ %379, %356 ]
  %171 = phi float [ 0.000000e+00, %47 ], [ %378, %356 ]
  %172 = phi float [ 0.000000e+00, %47 ], [ %377, %356 ]
  %173 = phi float [ 0.000000e+00, %47 ], [ %376, %356 ]
  %174 = phi float [ 0.000000e+00, %47 ], [ %375, %356 ]
  %175 = phi float [ 0.000000e+00, %47 ], [ %374, %356 ]
  %176 = phi float [ 0.000000e+00, %47 ], [ %373, %356 ]
  %177 = phi float [ 0.000000e+00, %47 ], [ %372, %356 ]
  %178 = phi i32 [ %42, %47 ], [ %380, %356 ]
  %179 = phi float [ 0.000000e+00, %47 ], [ %371, %356 ]
  %180 = phi float [ 0.000000e+00, %47 ], [ %370, %356 ]
  %181 = phi float [ 0.000000e+00, %47 ], [ %369, %356 ]
  %182 = phi float [ 0.000000e+00, %47 ], [ %368, %356 ]
  %183 = phi float [ 0.000000e+00, %47 ], [ %367, %356 ]
  %184 = phi float [ 0.000000e+00, %47 ], [ %366, %356 ]
  %185 = phi float [ 0.000000e+00, %47 ], [ %365, %356 ]
  %186 = phi float [ 0.000000e+00, %47 ], [ %364, %356 ]
  %187 = phi float [ 0.000000e+00, %47 ], [ %363, %356 ]
  %188 = phi float [ 0.000000e+00, %47 ], [ %362, %356 ]
  %189 = phi float [ 0.000000e+00, %47 ], [ %361, %356 ]
  %190 = phi float [ 0.000000e+00, %47 ], [ %360, %356 ]
  %191 = phi float [ 0.000000e+00, %47 ], [ %359, %356 ]
  %192 = phi float [ 0.000000e+00, %47 ], [ %358, %356 ]
  %193 = phi float [ 0.000000e+00, %47 ], [ %357, %356 ]
  %194 = icmp slt i32 %178, %32
  br i1 %194, label %195, label %356

195:                                              ; preds = %169
  %196 = add nsw i32 %178, %39
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %197, i32 0, i32 0, i32 0, i64 0
  %199 = load float, float addrspace(1)* %198, align 8, !amdgpu.noclobber !14
  %200 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %197, i32 0, i32 0, i32 0, i64 1
  %201 = load float, float addrspace(1)* %200, align 4, !amdgpu.noclobber !14
  %202 = getelementptr inbounds float, float addrspace(1)* %2, i64 %197
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !20, !amdgpu.noclobber !14
  %204 = fdiv contract float 1.000000e+00, %203
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %197
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !15, !amdgpu.noclobber !14
  %207 = icmp slt i32 %206, %48
  %208 = select i1 %207, i32 0, i32 %8
  %209 = mul nsw i32 %208, %9
  %210 = sub nsw i32 %206, %209
  %211 = sitofp i32 %210 to float
  %212 = fdiv contract float %211, %49
  %213 = tail call float @llvm.floor.f32(float %212)
  %214 = fmul contract float %213, %49
  %215 = fsub contract float %211, %214
  %216 = fsub contract float %215, %6
  %217 = fsub contract float %213, %7
  %218 = fmul contract float %204, %204
  %219 = fmul contract float %218, %4
  %220 = fmul contract float %219, %4
  %221 = fadd contract float %170, %220
  %222 = fneg contract float %204
  %223 = fmul contract float %204, %222
  %224 = fmul contract float %223, %216
  %225 = fmul contract float %224, %4
  %226 = fadd contract float %171, %225
  %227 = fmul contract float %216, %222
  %228 = fmul contract float %217, %227
  %229 = fadd contract float %172, %228
  %230 = fmul contract float %204, %4
  %231 = fmul contract float %230, %4
  %232 = fmul contract float %204, %216
  %233 = fmul contract float %216, %232
  %234 = fadd contract float %231, %233
  %235 = fadd contract float %173, %234
  %236 = fmul contract float %217, %222
  %237 = fmul contract float %236, %4
  %238 = fadd contract float %174, %237
  %239 = fmul contract float %223, %217
  %240 = fmul contract float %239, %5
  %241 = fadd contract float %175, %240
  %242 = fmul contract float %222, %5
  %243 = fmul contract float %242, %5
  %244 = fmul contract float %204, %217
  %245 = fmul contract float %217, %244
  %246 = fsub contract float %243, %245
  %247 = fadd contract float %176, %246
  %248 = fmul contract float %232, %5
  %249 = fadd contract float %177, %248
  %250 = fmul contract float %218, %216
  %251 = fmul contract float %216, %250
  %252 = fmul contract float %218, %217
  %253 = fmul contract float %217, %252
  %254 = fadd contract float %253, %251
  %255 = fadd contract float %193, %254
  %256 = fmul contract float %217, %233
  %257 = fdiv contract float %256, %4
  %258 = fmul contract float %244, %5
  %259 = fadd contract float %258, %257
  %260 = fmul contract float %217, %245
  %261 = fdiv contract float %260, %5
  %262 = fadd contract float %261, %259
  %263 = fadd contract float %192, %262
  %264 = fmul contract float %227, %4
  %265 = fmul contract float %216, %233
  %266 = fdiv contract float %265, %4
  %267 = fsub contract float %264, %266
  %268 = fmul contract float %217, %232
  %269 = fmul contract float %217, %268
  %270 = fdiv contract float %269, %5
  %271 = fsub contract float %267, %270
  %272 = fadd contract float %191, %271
  %273 = fmul contract float %216, %216
  %274 = fmul contract float %217, %273
  %275 = fmul contract float %217, %274
  %276 = fdiv contract float %275, %50
  %277 = fadd contract float %51, %276
  %278 = fmul contract float %217, 2.000000e+00
  %279 = fmul contract float %217, %278
  %280 = fadd contract float %279, %277
  %281 = fmul contract float %217, %217
  %282 = fmul contract float %217, %281
  %283 = fmul contract float %217, %282
  %284 = fdiv contract float %283, %51
  %285 = fadd contract float %284, %280
  %286 = fadd contract float %190, %285
  %287 = fmul contract float %216, -2.000000e+00
  %288 = fmul contract float %217, %287
  %289 = fmul contract float %216, %273
  %290 = fmul contract float %217, %289
  %291 = fdiv contract float %290, %50
  %292 = fsub contract float %288, %291
  %293 = fmul contract float %217, %216
  %294 = fmul contract float %217, %293
  %295 = fmul contract float %217, %294
  %296 = fdiv contract float %295, %51
  %297 = fsub contract float %292, %296
  %298 = fadd contract float %189, %297
  %299 = fdiv contract float %294, %4
  %300 = fmul contract float %216, %5
  %301 = fsub contract float %299, %300
  %302 = fdiv contract float %294, %5
  %303 = fsub contract float %301, %302
  %304 = fadd contract float %188, %303
  %305 = fmul contract float %216, 2.000000e+00
  %306 = fmul contract float %216, %305
  %307 = fadd contract float %50, %306
  %308 = fmul contract float %216, %289
  %309 = fdiv contract float %308, %50
  %310 = fadd contract float %307, %309
  %311 = fdiv contract float %275, %51
  %312 = fadd contract float %311, %310
  %313 = fadd contract float %187, %312
  %314 = fneg contract float %217
  %315 = fmul contract float %314, %4
  %316 = fdiv contract float %274, %4
  %317 = fsub contract float %315, %316
  %318 = fdiv contract float %274, %5
  %319 = fadd contract float %318, %317
  %320 = fadd contract float %186, %319
  %321 = fadd contract float %281, %273
  %322 = fadd contract float %185, %321
  %323 = fmul contract float %199, %204
  %324 = fmul contract float %323, %4
  %325 = fadd contract float %184, %324
  %326 = fmul contract float %201, %204
  %327 = fmul contract float %326, %5
  %328 = fadd contract float %183, %327
  %329 = fmul contract float %199, %227
  %330 = fmul contract float %201, %244
  %331 = fsub contract float %329, %330
  %332 = fadd contract float %182, %331
  %333 = fneg contract float %216
  %334 = fmul contract float %217, %333
  %335 = fmul contract float %199, %334
  %336 = fdiv contract float %335, %4
  %337 = fmul contract float %201, %5
  %338 = fsub contract float %336, %337
  %339 = fmul contract float %201, %217
  %340 = fmul contract float %217, %339
  %341 = fdiv contract float %340, %5
  %342 = fsub contract float %338, %341
  %343 = fadd contract float %181, %342
  %344 = fmul contract float %199, %4
  %345 = fmul contract float %199, %273
  %346 = fdiv contract float %345, %4
  %347 = fadd contract float %344, %346
  %348 = fmul contract float %201, %293
  %349 = fdiv contract float %348, %5
  %350 = fadd contract float %349, %347
  %351 = fadd contract float %180, %350
  %352 = fmul contract float %201, %216
  %353 = fmul contract float %199, %217
  %354 = fsub contract float %352, %353
  %355 = fadd contract float %179, %354
  br label %356

356:                                              ; preds = %169, %195
  %357 = phi float [ %255, %195 ], [ %193, %169 ]
  %358 = phi float [ %263, %195 ], [ %192, %169 ]
  %359 = phi float [ %272, %195 ], [ %191, %169 ]
  %360 = phi float [ %286, %195 ], [ %190, %169 ]
  %361 = phi float [ %298, %195 ], [ %189, %169 ]
  %362 = phi float [ %304, %195 ], [ %188, %169 ]
  %363 = phi float [ %313, %195 ], [ %187, %169 ]
  %364 = phi float [ %320, %195 ], [ %186, %169 ]
  %365 = phi float [ %322, %195 ], [ %185, %169 ]
  %366 = phi float [ %325, %195 ], [ %184, %169 ]
  %367 = phi float [ %328, %195 ], [ %183, %169 ]
  %368 = phi float [ %332, %195 ], [ %182, %169 ]
  %369 = phi float [ %343, %195 ], [ %181, %169 ]
  %370 = phi float [ %351, %195 ], [ %180, %169 ]
  %371 = phi float [ %355, %195 ], [ %179, %169 ]
  %372 = phi float [ %249, %195 ], [ %177, %169 ]
  %373 = phi float [ %247, %195 ], [ %176, %169 ]
  %374 = phi float [ %241, %195 ], [ %175, %169 ]
  %375 = phi float [ %238, %195 ], [ %174, %169 ]
  %376 = phi float [ %235, %195 ], [ %173, %169 ]
  %377 = phi float [ %229, %195 ], [ %172, %169 ]
  %378 = phi float [ %226, %195 ], [ %171, %169 ]
  %379 = phi float [ %221, %195 ], [ %170, %169 ]
  %380 = add i32 %178, %20
  %381 = icmp ult i32 %380, %45
  br i1 %381, label %169, label %52, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !17, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
