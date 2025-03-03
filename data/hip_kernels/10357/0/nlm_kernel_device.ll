; ModuleID = '../data/hip_kernels/10357/0/main.cu'
source_filename = "../data/hip_kernels/10357/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@gaussian_matrix = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10nlm_kernelPKfPfiifPif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4, i32 addrspace(1)* nocapture readonly %5, float %6) local_unnamed_addr #0 {
  %8 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !4, !amdgpu.noclobber !8
  %9 = add nsw i32 %8, -1
  %10 = sdiv i32 %9, 2
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 1
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %13 = add nsw i32 %12, -1
  %14 = sdiv i32 %13, 2
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %16 = icmp ult i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %18 = icmp ult i32 %17, %12
  %19 = select i1 %16, i1 %18, i1 false
  br i1 %19, label %20, label %48

20:                                               ; preds = %7
  %21 = sub nsw i32 %15, %14
  %22 = mul nsw i32 %21, %21
  %23 = sub nsw i32 %17, %10
  %24 = mul nsw i32 %23, %23
  %25 = add nuw nsw i32 %24, %22
  %26 = sub nsw i32 0, %25
  %27 = sitofp i32 %26 to float
  %28 = fmul contract float %4, %4
  %29 = fmul contract float %28, 2.000000e+00
  %30 = fdiv contract float %27, %29
  %31 = fmul float %30, 0x3FF7154760000000
  %32 = tail call float @llvm.rint.f32(float %31)
  %33 = fcmp ogt float %30, 0x40562E4300000000
  %34 = fcmp olt float %30, 0xC059D1DA00000000
  %35 = fneg float %31
  %36 = tail call float @llvm.fma.f32(float %30, float 0x3FF7154760000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %30, float 0x3E54AE0BE0000000, float %36)
  %38 = fsub float %31, %32
  %39 = fadd float %37, %38
  %40 = tail call float @llvm.exp2.f32(float %39)
  %41 = fptosi float %32 to i32
  %42 = tail call float @llvm.amdgcn.ldexp.f32(float %40, i32 %41)
  %43 = select i1 %34, float 0.000000e+00, float %42
  %44 = select i1 %33, float 0x7FF0000000000000, float %43
  %45 = mul i32 %12, %15
  %46 = add i32 %45, %17
  %47 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gaussian_matrix, i32 0, i32 %46
  store float %44, float addrspace(3)* %47, align 4, !tbaa !10
  br label %48

48:                                               ; preds = %7, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %50 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %51 = getelementptr i8, i8 addrspace(4)* %50, i64 4
  %52 = bitcast i8 addrspace(4)* %51 to i16 addrspace(4)*
  %53 = load i16, i16 addrspace(4)* %52, align 4, !range !12, !invariant.load !8
  %54 = zext i16 %53 to i32
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 12
  %56 = bitcast i8 addrspace(4)* %55 to i32 addrspace(4)*
  %57 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !13
  %58 = mul i32 %49, %54
  %59 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %60 = getelementptr i8, i8 addrspace(4)* %50, i64 6
  %61 = bitcast i8 addrspace(4)* %60 to i16 addrspace(4)*
  %62 = load i16, i16 addrspace(4)* %61, align 2, !range !12, !invariant.load !8
  %63 = zext i16 %62 to i32
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 16
  %65 = bitcast i8 addrspace(4)* %64 to i32 addrspace(4)*
  %66 = load i32, i32 addrspace(4)* %65, align 8, !tbaa !22
  %67 = mul i32 %59, %63
  %68 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !4, !amdgpu.noclobber !8
  %69 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %70 = mul nsw i32 %69, %68
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gaussian_matrix, i32 0, i32 %70
  %72 = shl nsw i32 %10, 1
  %73 = add i32 %72, %54
  %74 = shl nsw i32 %14, 1
  %75 = add i32 %74, %63
  %76 = mul i32 %75, %73
  %77 = getelementptr inbounds float, float addrspace(3)* %71, i32 %76
  %78 = add i32 %58, %15
  %79 = add i32 %67, %17
  %80 = add nsw i32 %68, -1
  %81 = sdiv i32 %80, 2
  %82 = add nsw i32 %69, -1
  %83 = sdiv i32 %82, 2
  %84 = add nsw i32 %81, %78
  %85 = shl nsw i32 %83, 1
  %86 = add nsw i32 %85, %3
  %87 = mul nsw i32 %86, %84
  %88 = add nsw i32 %83, %79
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !10, !amdgpu.noclobber !8
  %93 = add nsw i32 %83, %15
  %94 = add i32 %85, %63
  %95 = mul i32 %94, %93
  %96 = add nsw i32 %81, %17
  %97 = add i32 %95, %96
  %98 = getelementptr inbounds float, float addrspace(3)* %77, i32 %97
  store float %92, float addrspace(3)* %98, align 4, !tbaa !10
  %99 = icmp ult i32 %15, %81
  br i1 %99, label %100, label %129

100:                                              ; preds = %48
  %101 = shl nuw nsw i32 %15, 1
  %102 = sub i32 %78, %101
  %103 = add i32 %102, -1
  %104 = add i32 %103, %81
  %105 = mul i32 %104, %86
  %106 = add i32 %105, %88
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !10, !amdgpu.noclobber !8
  %110 = xor i32 %15, -1
  %111 = add nsw i32 %83, %110
  %112 = mul i32 %94, %111
  %113 = add i32 %112, %96
  %114 = getelementptr inbounds float, float addrspace(3)* %77, i32 %113
  store float %109, float addrspace(3)* %114, align 4, !tbaa !10
  %115 = icmp ult i32 %17, %83
  br i1 %115, label %116, label %129

116:                                              ; preds = %100
  %117 = shl nuw nsw i32 %17, 1
  %118 = sub i32 %79, %117
  %119 = add i32 %118, -1
  %120 = add i32 %119, %83
  %121 = add i32 %120, %105
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !10, !amdgpu.noclobber !8
  %125 = xor i32 %17, -1
  %126 = add nsw i32 %81, %125
  %127 = add i32 %126, %112
  %128 = getelementptr inbounds float, float addrspace(3)* %77, i32 %127
  store float %124, float addrspace(3)* %128, align 4, !tbaa !10
  br label %129

129:                                              ; preds = %116, %100, %48
  %130 = icmp ult i32 %17, %83
  br i1 %130, label %131, label %144

131:                                              ; preds = %129
  %132 = shl nuw nsw i32 %17, 1
  %133 = sub i32 %79, %132
  %134 = add i32 %133, -1
  %135 = add i32 %134, %83
  %136 = add i32 %135, %87
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !10, !amdgpu.noclobber !8
  %140 = xor i32 %17, -1
  %141 = add nsw i32 %81, %140
  %142 = add i32 %141, %95
  %143 = getelementptr inbounds float, float addrspace(3)* %77, i32 %142
  store float %139, float addrspace(3)* %143, align 4, !tbaa !10
  br label %144

144:                                              ; preds = %131, %129
  %145 = sub nsw i32 %54, %81
  %146 = icmp ult i32 %15, %145
  br i1 %146, label %178, label %147

147:                                              ; preds = %144
  %148 = sub nsw i32 %54, %15
  %149 = shl nsw i32 %148, 1
  %150 = add i32 %78, -1
  %151 = add i32 %150, %149
  %152 = add i32 %151, %81
  %153 = mul i32 %152, %86
  %154 = add i32 %153, %88
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !10, !amdgpu.noclobber !8
  %158 = shl nuw nsw i32 %54, 1
  %159 = xor i32 %15, -1
  %160 = add nsw i32 %158, %159
  %161 = add nsw i32 %160, %83
  %162 = mul i32 %94, %161
  %163 = add i32 %162, %96
  %164 = getelementptr inbounds float, float addrspace(3)* %77, i32 %163
  store float %157, float addrspace(3)* %164, align 4, !tbaa !10
  br i1 %130, label %165, label %178

165:                                              ; preds = %147
  %166 = shl nuw nsw i32 %17, 1
  %167 = sub i32 %79, %166
  %168 = add i32 %167, -1
  %169 = add i32 %168, %83
  %170 = add i32 %169, %153
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !10, !amdgpu.noclobber !8
  %174 = xor i32 %17, -1
  %175 = add nsw i32 %81, %174
  %176 = add i32 %175, %162
  %177 = getelementptr inbounds float, float addrspace(3)* %77, i32 %176
  store float %173, float addrspace(3)* %177, align 4, !tbaa !10
  br label %178

178:                                              ; preds = %165, %147, %144
  %179 = sub nsw i32 %63, %83
  %180 = icmp ult i32 %17, %179
  br i1 %180, label %212, label %181

181:                                              ; preds = %178
  %182 = sub nsw i32 %63, %17
  %183 = shl nsw i32 %182, 1
  %184 = add i32 %79, -1
  %185 = add i32 %184, %183
  %186 = add i32 %185, %83
  %187 = add i32 %186, %87
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !10, !amdgpu.noclobber !8
  %191 = shl nuw nsw i32 %63, 1
  %192 = xor i32 %17, -1
  %193 = add nsw i32 %191, %192
  %194 = add nsw i32 %193, %81
  %195 = add i32 %95, %194
  %196 = getelementptr inbounds float, float addrspace(3)* %77, i32 %195
  store float %190, float addrspace(3)* %196, align 4, !tbaa !10
  br i1 %99, label %197, label %212

197:                                              ; preds = %181
  %198 = shl nuw nsw i32 %15, 1
  %199 = sub i32 %78, %198
  %200 = add i32 %199, -1
  %201 = add i32 %200, %81
  %202 = mul i32 %201, %86
  %203 = add i32 %186, %202
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !10, !amdgpu.noclobber !8
  %207 = xor i32 %15, -1
  %208 = add nsw i32 %83, %207
  %209 = mul i32 %94, %208
  %210 = add i32 %209, %194
  %211 = getelementptr inbounds float, float addrspace(3)* %77, i32 %210
  store float %206, float addrspace(3)* %211, align 4, !tbaa !10
  br label %212

212:                                              ; preds = %197, %181, %178
  %213 = select i1 %146, i1 true, i1 %180
  br i1 %213, label %241, label %214

214:                                              ; preds = %212
  %215 = sub nsw i32 %54, %15
  %216 = shl nsw i32 %215, 1
  %217 = add i32 %78, -1
  %218 = add i32 %217, %216
  %219 = add i32 %218, %81
  %220 = mul i32 %219, %86
  %221 = sub nsw i32 %63, %17
  %222 = shl nsw i32 %221, 1
  %223 = add i32 %79, -1
  %224 = add i32 %223, %222
  %225 = add i32 %224, %83
  %226 = add i32 %225, %220
  %227 = zext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !10, !amdgpu.noclobber !8
  %230 = shl nuw nsw i32 %54, 1
  %231 = xor i32 %15, -1
  %232 = add nsw i32 %230, %231
  %233 = add nsw i32 %232, %83
  %234 = mul i32 %94, %233
  %235 = shl nuw nsw i32 %63, 1
  %236 = xor i32 %17, -1
  %237 = add nsw i32 %235, %236
  %238 = add nsw i32 %237, %81
  %239 = add i32 %238, %234
  %240 = getelementptr inbounds float, float addrspace(3)* %77, i32 %239
  store float %229, float addrspace(3)* %240, align 4, !tbaa !10
  br label %241

241:                                              ; preds = %212, %214
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %242 = udiv i32 %57, %54
  %243 = mul i32 %242, %54
  %244 = icmp ugt i32 %57, %243
  %245 = zext i1 %244 to i32
  %246 = add i32 %242, %245
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %685, label %248

248:                                              ; preds = %241
  %249 = udiv i32 %66, %63
  %250 = mul i32 %249, %63
  %251 = icmp ugt i32 %66, %250
  %252 = zext i1 %251 to i32
  %253 = add i32 %249, %252
  %254 = icmp eq i32 %253, 0
  %255 = xor i32 %15, -1
  %256 = xor i32 %17, -1
  %257 = sub nsw i32 %54, %15
  %258 = shl nsw i32 %257, 1
  %259 = shl nuw nsw i32 %54, 1
  %260 = add nsw i32 %259, %255
  %261 = sub nsw i32 %63, %17
  %262 = shl nsw i32 %261, 1
  %263 = shl nuw nsw i32 %63, 1
  %264 = add nsw i32 %263, %256
  %265 = shl nuw nsw i32 %15, 1
  %266 = shl nuw nsw i32 %17, 1
  %267 = shl nuw nsw i32 %17, 1
  %268 = shl nuw nsw i32 %17, 1
  %269 = load i16, i16 addrspace(4)* %61, align 2
  %270 = zext i16 %269 to i32
  %271 = bitcast i32 addrspace(1)* %5 to <2 x i32> addrspace(1)*
  br label %272

272:                                              ; preds = %248, %677
  %273 = phi float addrspace(3)* [ %71, %248 ], [ %680, %677 ]
  %274 = phi float [ 0.000000e+00, %248 ], [ %679, %677 ]
  %275 = phi float [ 0.000000e+00, %248 ], [ %678, %677 ]
  %276 = phi i32 [ 0, %248 ], [ %681, %677 ]
  br i1 %254, label %677, label %277

277:                                              ; preds = %272
  %278 = icmp eq i32 %276, %49
  %279 = mul i32 %276, %54
  %280 = add i32 %279, %15
  %281 = sub i32 %280, %265
  %282 = add i32 %281, -1
  %283 = add i32 %280, -1
  %284 = add i32 %283, %258
  br label %285

285:                                              ; preds = %277, %673
  %286 = phi float addrspace(3)* [ %273, %277 ], [ %674, %673 ]
  %287 = phi float [ %274, %277 ], [ %660, %673 ]
  %288 = phi float [ %275, %277 ], [ %655, %673 ]
  %289 = phi i32 [ 0, %277 ], [ %675, %673 ]
  %290 = icmp eq i32 %289, %59
  %291 = select i1 %278, i1 %290, i1 false
  br i1 %291, label %421, label %292

292:                                              ; preds = %285
  %293 = mul i32 %289, %63
  %294 = add i32 %293, %17
  %295 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !4, !amdgpu.noclobber !8
  %296 = add nsw i32 %295, -1
  %297 = sdiv i32 %296, 2
  %298 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %299 = add nsw i32 %298, -1
  %300 = sdiv i32 %299, 2
  %301 = add nsw i32 %297, %280
  %302 = shl nsw i32 %300, 1
  %303 = add nsw i32 %302, %3
  %304 = mul nsw i32 %303, %301
  %305 = add nsw i32 %300, %294
  %306 = add nsw i32 %304, %305
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !10
  %310 = add nsw i32 %300, %15
  %311 = add i32 %302, %63
  %312 = mul i32 %311, %310
  %313 = add nsw i32 %297, %17
  %314 = add i32 %312, %313
  %315 = getelementptr inbounds float, float addrspace(3)* %286, i32 %314
  store float %309, float addrspace(3)* %315, align 4, !tbaa !10
  %316 = icmp ult i32 %15, %297
  br i1 %316, label %317, label %340

317:                                              ; preds = %292
  %318 = add i32 %282, %297
  %319 = mul i32 %318, %303
  %320 = add i32 %319, %305
  %321 = zext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %0, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !10
  %324 = add nsw i32 %300, %255
  %325 = mul i32 %311, %324
  %326 = add i32 %325, %313
  %327 = getelementptr inbounds float, float addrspace(3)* %286, i32 %326
  store float %323, float addrspace(3)* %327, align 4, !tbaa !10
  %328 = icmp ult i32 %17, %300
  br i1 %328, label %329, label %340

329:                                              ; preds = %317
  %330 = sub i32 %294, %266
  %331 = add i32 %330, -1
  %332 = add i32 %331, %300
  %333 = add i32 %332, %319
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %0, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !10
  %337 = add nsw i32 %297, %256
  %338 = add i32 %337, %325
  %339 = getelementptr inbounds float, float addrspace(3)* %286, i32 %338
  store float %336, float addrspace(3)* %339, align 4, !tbaa !10
  br label %340

340:                                              ; preds = %329, %317, %292
  %341 = icmp ult i32 %17, %300
  br i1 %341, label %342, label %353

342:                                              ; preds = %340
  %343 = sub i32 %294, %267
  %344 = add i32 %343, -1
  %345 = add i32 %344, %300
  %346 = add i32 %345, %304
  %347 = zext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %0, i64 %347
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !10
  %350 = add nsw i32 %297, %256
  %351 = add i32 %350, %312
  %352 = getelementptr inbounds float, float addrspace(3)* %286, i32 %351
  store float %349, float addrspace(3)* %352, align 4, !tbaa !10
  br label %353

353:                                              ; preds = %342, %340
  %354 = sub nsw i32 %54, %297
  %355 = icmp ult i32 %15, %354
  br i1 %355, label %378, label %356

356:                                              ; preds = %353
  %357 = add i32 %284, %297
  %358 = mul i32 %357, %303
  %359 = add i32 %358, %305
  %360 = zext i32 %359 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %0, i64 %360
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !10
  %363 = add nsw i32 %260, %300
  %364 = mul i32 %311, %363
  %365 = add i32 %364, %313
  %366 = getelementptr inbounds float, float addrspace(3)* %286, i32 %365
  store float %362, float addrspace(3)* %366, align 4, !tbaa !10
  br i1 %341, label %367, label %378

367:                                              ; preds = %356
  %368 = sub i32 %294, %268
  %369 = add i32 %368, -1
  %370 = add i32 %369, %300
  %371 = add i32 %370, %358
  %372 = zext i32 %371 to i64
  %373 = getelementptr inbounds float, float addrspace(1)* %0, i64 %372
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !10
  %375 = add nsw i32 %297, %256
  %376 = add i32 %375, %364
  %377 = getelementptr inbounds float, float addrspace(3)* %286, i32 %376
  store float %374, float addrspace(3)* %377, align 4, !tbaa !10
  br label %378

378:                                              ; preds = %367, %356, %353
  %379 = sub nsw i32 %63, %300
  %380 = icmp ult i32 %17, %379
  br i1 %380, label %403, label %381

381:                                              ; preds = %378
  %382 = add i32 %294, -1
  %383 = add i32 %382, %262
  %384 = add i32 %383, %300
  %385 = add i32 %384, %304
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !10
  %389 = add nsw i32 %264, %297
  %390 = add i32 %312, %389
  %391 = getelementptr inbounds float, float addrspace(3)* %286, i32 %390
  store float %388, float addrspace(3)* %391, align 4, !tbaa !10
  br i1 %316, label %392, label %403

392:                                              ; preds = %381
  %393 = add i32 %282, %297
  %394 = mul i32 %393, %303
  %395 = add i32 %384, %394
  %396 = zext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %0, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !10
  %399 = add nsw i32 %300, %255
  %400 = mul i32 %311, %399
  %401 = add i32 %400, %389
  %402 = getelementptr inbounds float, float addrspace(3)* %286, i32 %401
  store float %398, float addrspace(3)* %402, align 4, !tbaa !10
  br label %403

403:                                              ; preds = %392, %381, %378
  %404 = select i1 %355, i1 true, i1 %380
  br i1 %404, label %420, label %405

405:                                              ; preds = %403
  %406 = add i32 %284, %297
  %407 = mul i32 %406, %303
  %408 = add i32 %294, -1
  %409 = add i32 %408, %262
  %410 = add i32 %409, %300
  %411 = add i32 %410, %407
  %412 = zext i32 %411 to i64
  %413 = getelementptr inbounds float, float addrspace(1)* %0, i64 %412
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !10
  %415 = add nsw i32 %260, %300
  %416 = mul i32 %311, %415
  %417 = add nsw i32 %264, %297
  %418 = add i32 %417, %416
  %419 = getelementptr inbounds float, float addrspace(3)* %286, i32 %418
  store float %414, float addrspace(3)* %419, align 4, !tbaa !10
  br label %420

420:                                              ; preds = %403, %405
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %421

421:                                              ; preds = %285, %420
  %422 = phi float addrspace(3)* [ %286, %420 ], [ %77, %285 ]
  %423 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !4, !amdgpu.noclobber !8
  %424 = add nsw i32 %423, -1
  %425 = sdiv i32 %424, 2
  %426 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !4, !amdgpu.noclobber !8
  %427 = add nsw i32 %426, -1
  %428 = sdiv i32 %427, 2
  %429 = icmp slt i32 %423, 0
  %430 = sub nsw i32 0, %425
  %431 = sub nsw i32 0, %428
  %432 = icmp slt i32 %426, 0
  %433 = shl nsw i32 %428, 1
  %434 = tail call i32 @llvm.abs.i32(i32 %428, i1 true)
  %435 = tail call i32 @llvm.abs.i32(i32 %425, i1 true)
  %436 = add i32 %433, %270
  br label %437

437:                                              ; preds = %421, %663
  %438 = phi float [ %287, %421 ], [ %660, %663 ]
  %439 = phi float [ %288, %421 ], [ %655, %663 ]
  %440 = phi i32 [ 0, %421 ], [ %664, %663 ]
  %441 = add nsw i32 %440, %14
  %442 = mul i32 %441, %75
  %443 = add i32 %442, %10
  br label %444

444:                                              ; preds = %437, %637
  %445 = phi float [ %438, %437 ], [ %660, %637 ]
  %446 = phi float [ %439, %437 ], [ %655, %637 ]
  %447 = phi i32 [ 0, %437 ], [ %661, %637 ]
  br i1 %429, label %637, label %448

448:                                              ; preds = %444, %633
  %449 = phi i32 [ %635, %633 ], [ %430, %444 ]
  %450 = phi float [ %634, %633 ], [ 0.000000e+00, %444 ]
  br i1 %432, label %633, label %451

451:                                              ; preds = %448
  %452 = add nsw i32 %449, %425
  %453 = mul nsw i32 %452, %426
  %454 = add i32 %453, %428
  %455 = add i32 %449, %428
  %456 = add i32 %455, %15
  %457 = mul i32 %436, %456
  %458 = add i32 %455, %440
  %459 = mul i32 %436, %458
  %460 = add i32 %457, %17
  %461 = add i32 %459, %447
  br label %462

462:                                              ; preds = %462, %451
  %463 = phi float [ %450, %451 ], [ %630, %462 ]
  %464 = phi i32 [ %431, %451 ], [ %631, %462 ]
  %465 = add i32 %454, %464
  %466 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gaussian_matrix, i32 0, i32 %465
  %467 = load float, float addrspace(3)* %466, align 4, !tbaa !10
  %468 = fmul contract float %467, %467
  %469 = add i32 %464, %425
  %470 = add i32 %460, %469
  %471 = getelementptr inbounds float, float addrspace(3)* %77, i32 %470
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !10
  %473 = add i32 %461, %469
  %474 = getelementptr inbounds float, float addrspace(3)* %422, i32 %473
  %475 = load float, float addrspace(3)* %474, align 4, !tbaa !10
  %476 = fsub contract float %472, %475
  %477 = tail call float @llvm.fabs.f32(float %476)
  %478 = tail call float @llvm.amdgcn.frexp.mant.f32(float %477)
  %479 = fcmp olt float %478, 0x3FE5555560000000
  %480 = zext i1 %479 to i32
  %481 = tail call float @llvm.amdgcn.ldexp.f32(float %478, i32 %480)
  %482 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %477)
  %483 = sub nsw i32 %482, %480
  %484 = fadd float %481, -1.000000e+00
  %485 = fadd float %481, 1.000000e+00
  %486 = fadd float %485, -1.000000e+00
  %487 = fsub float %481, %486
  %488 = tail call float @llvm.amdgcn.rcp.f32(float %485)
  %489 = fmul float %484, %488
  %490 = fmul float %485, %489
  %491 = fneg float %490
  %492 = tail call float @llvm.fma.f32(float %489, float %485, float %491)
  %493 = tail call float @llvm.fma.f32(float %489, float %487, float %492)
  %494 = fadd float %490, %493
  %495 = fsub float %494, %490
  %496 = fsub float %493, %495
  %497 = fsub float %484, %494
  %498 = fsub float %484, %497
  %499 = fsub float %498, %494
  %500 = fsub float %499, %496
  %501 = fadd float %497, %500
  %502 = fmul float %488, %501
  %503 = fadd float %489, %502
  %504 = fsub float %503, %489
  %505 = fsub float %502, %504
  %506 = fmul float %503, %503
  %507 = fneg float %506
  %508 = tail call float @llvm.fma.f32(float %503, float %503, float %507)
  %509 = fmul float %505, 2.000000e+00
  %510 = tail call float @llvm.fma.f32(float %503, float %509, float %508)
  %511 = fadd float %506, %510
  %512 = fsub float %511, %506
  %513 = fsub float %510, %512
  %514 = tail call float @llvm.fmuladd.f32(float %511, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %515 = tail call float @llvm.fmuladd.f32(float %511, float %514, float 0x3FD999BDE0000000)
  %516 = sitofp i32 %483 to float
  %517 = fmul float %516, 0x3FE62E4300000000
  %518 = fneg float %517
  %519 = tail call float @llvm.fma.f32(float %516, float 0x3FE62E4300000000, float %518)
  %520 = tail call float @llvm.fma.f32(float %516, float 0xBE205C6100000000, float %519)
  %521 = fadd float %517, %520
  %522 = fsub float %521, %517
  %523 = fsub float %520, %522
  %524 = tail call float @llvm.amdgcn.ldexp.f32(float %503, i32 1)
  %525 = fmul float %503, %511
  %526 = fneg float %525
  %527 = tail call float @llvm.fma.f32(float %511, float %503, float %526)
  %528 = tail call float @llvm.fma.f32(float %511, float %505, float %527)
  %529 = tail call float @llvm.fma.f32(float %513, float %503, float %528)
  %530 = fadd float %525, %529
  %531 = fsub float %530, %525
  %532 = fsub float %529, %531
  %533 = fmul float %511, %515
  %534 = fneg float %533
  %535 = tail call float @llvm.fma.f32(float %511, float %515, float %534)
  %536 = tail call float @llvm.fma.f32(float %513, float %515, float %535)
  %537 = fadd float %533, %536
  %538 = fsub float %537, %533
  %539 = fsub float %536, %538
  %540 = fadd float %537, 0x3FE5555540000000
  %541 = fadd float %540, 0xBFE5555540000000
  %542 = fsub float %537, %541
  %543 = fadd float %539, 0x3E2E720200000000
  %544 = fadd float %543, %542
  %545 = fadd float %540, %544
  %546 = fsub float %545, %540
  %547 = fsub float %544, %546
  %548 = fmul float %530, %545
  %549 = fneg float %548
  %550 = tail call float @llvm.fma.f32(float %530, float %545, float %549)
  %551 = tail call float @llvm.fma.f32(float %530, float %547, float %550)
  %552 = tail call float @llvm.fma.f32(float %532, float %545, float %551)
  %553 = tail call float @llvm.amdgcn.ldexp.f32(float %505, i32 1)
  %554 = fadd float %548, %552
  %555 = fsub float %554, %548
  %556 = fsub float %552, %555
  %557 = fadd float %524, %554
  %558 = fsub float %557, %524
  %559 = fsub float %554, %558
  %560 = fadd float %553, %556
  %561 = fadd float %560, %559
  %562 = fadd float %557, %561
  %563 = fsub float %562, %557
  %564 = fsub float %561, %563
  %565 = fadd float %521, %562
  %566 = fsub float %565, %521
  %567 = fsub float %565, %566
  %568 = fsub float %521, %567
  %569 = fsub float %562, %566
  %570 = fadd float %569, %568
  %571 = fadd float %523, %564
  %572 = fsub float %571, %523
  %573 = fsub float %571, %572
  %574 = fsub float %523, %573
  %575 = fsub float %564, %572
  %576 = fadd float %575, %574
  %577 = fadd float %571, %570
  %578 = fadd float %565, %577
  %579 = fsub float %578, %565
  %580 = fsub float %577, %579
  %581 = fadd float %576, %580
  %582 = fadd float %578, %581
  %583 = fsub float %582, %578
  %584 = fsub float %581, %583
  %585 = fmul float %582, 2.000000e+00
  %586 = fneg float %585
  %587 = tail call float @llvm.fma.f32(float %582, float 2.000000e+00, float %586)
  %588 = tail call float @llvm.fma.f32(float %584, float 2.000000e+00, float %587)
  %589 = fadd float %585, %588
  %590 = fsub float %589, %585
  %591 = fsub float %588, %590
  %592 = tail call float @llvm.fabs.f32(float %585) #5
  %593 = fcmp oeq float %592, 0x7FF0000000000000
  %594 = select i1 %593, float %585, float %589
  %595 = tail call float @llvm.fabs.f32(float %594) #5
  %596 = fcmp oeq float %595, 0x7FF0000000000000
  %597 = select i1 %596, float 0.000000e+00, float %591
  %598 = fcmp oeq float %594, 0x40562E4300000000
  %599 = select i1 %598, float 0x3EE0000000000000, float 0.000000e+00
  %600 = fsub float %594, %599
  %601 = fadd float %599, %597
  %602 = fmul float %600, 0x3FF7154760000000
  %603 = tail call float @llvm.rint.f32(float %602)
  %604 = fcmp ogt float %600, 0x40562E4300000000
  %605 = fcmp olt float %600, 0xC059D1DA00000000
  %606 = fneg float %602
  %607 = tail call float @llvm.fma.f32(float %600, float 0x3FF7154760000000, float %606)
  %608 = tail call float @llvm.fma.f32(float %600, float 0x3E54AE0BE0000000, float %607)
  %609 = fsub float %602, %603
  %610 = fadd float %608, %609
  %611 = tail call float @llvm.exp2.f32(float %610)
  %612 = fptosi float %603 to i32
  %613 = tail call float @llvm.amdgcn.ldexp.f32(float %611, i32 %612)
  %614 = select i1 %605, float 0.000000e+00, float %613
  %615 = select i1 %604, float 0x7FF0000000000000, float %614
  %616 = tail call float @llvm.fma.f32(float %615, float %601, float %615)
  %617 = tail call float @llvm.fabs.f32(float %615) #5
  %618 = fcmp oeq float %617, 0x7FF0000000000000
  %619 = select i1 %618, float %615, float %616
  %620 = tail call float @llvm.fabs.f32(float %619)
  %621 = fcmp oeq float %477, 0x7FF0000000000000
  %622 = fcmp oeq float %476, 0.000000e+00
  %623 = select i1 %621, float 0x7FF0000000000000, float %620
  %624 = select i1 %622, float 0.000000e+00, float %623
  %625 = fcmp uno float %476, 0.000000e+00
  %626 = select i1 %625, float 0x7FF8000000000000, float %624
  %627 = fcmp oeq float %476, 1.000000e+00
  %628 = select i1 %627, float 1.000000e+00, float %626
  %629 = fmul contract float %468, %628
  %630 = fadd contract float %463, %629
  %631 = add i32 %464, 1
  %632 = icmp eq i32 %464, %434
  br i1 %632, label %633, label %462, !llvm.loop !23

633:                                              ; preds = %462, %448
  %634 = phi float [ %450, %448 ], [ %630, %462 ]
  %635 = add i32 %449, 1
  %636 = icmp eq i32 %449, %435
  br i1 %636, label %637, label %448, !llvm.loop !25

637:                                              ; preds = %633, %444
  %638 = phi float [ 0.000000e+00, %444 ], [ %634, %633 ]
  %639 = fneg contract float %638
  %640 = fdiv contract float %639, %6
  %641 = fmul float %640, 0x3FF7154760000000
  %642 = tail call float @llvm.rint.f32(float %641)
  %643 = fcmp ogt float %640, 0x40562E4300000000
  %644 = fcmp olt float %640, 0xC059D1DA00000000
  %645 = fneg float %641
  %646 = tail call float @llvm.fma.f32(float %640, float 0x3FF7154760000000, float %645)
  %647 = tail call float @llvm.fma.f32(float %640, float 0x3E54AE0BE0000000, float %646)
  %648 = fsub float %641, %642
  %649 = fadd float %647, %648
  %650 = tail call float @llvm.exp2.f32(float %649)
  %651 = fptosi float %642 to i32
  %652 = tail call float @llvm.amdgcn.ldexp.f32(float %650, i32 %651)
  %653 = select i1 %644, float 0.000000e+00, float %652
  %654 = select i1 %643, float 0x7FF0000000000000, float %653
  %655 = fadd contract float %446, %654
  %656 = add i32 %443, %447
  %657 = getelementptr inbounds float, float addrspace(3)* %422, i32 %656
  %658 = load float, float addrspace(3)* %657, align 4, !tbaa !10
  %659 = fmul contract float %658, %654
  %660 = fadd contract float %445, %659
  %661 = add nuw nsw i32 %447, 1
  %662 = icmp eq i32 %661, %63
  br i1 %662, label %663, label %444, !llvm.loop !26

663:                                              ; preds = %637
  %664 = add nuw nsw i32 %440, 1
  %665 = icmp eq i32 %664, %54
  br i1 %665, label %666, label %437, !llvm.loop !27

666:                                              ; preds = %663
  br i1 %291, label %667, label %673

667:                                              ; preds = %666
  %668 = load <2 x i32>, <2 x i32> addrspace(1)* %271, align 4, !tbaa !4
  %669 = extractelement <2 x i32> %668, i64 0
  %670 = extractelement <2 x i32> %668, i64 1
  %671 = mul nsw i32 %670, %669
  %672 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gaussian_matrix, i32 0, i32 %671
  br label %673

673:                                              ; preds = %667, %666
  %674 = phi float addrspace(3)* [ %672, %667 ], [ %422, %666 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %675 = add nuw nsw i32 %289, 1
  %676 = icmp eq i32 %675, %253
  br i1 %676, label %677, label %285, !llvm.loop !28

677:                                              ; preds = %673, %272
  %678 = phi float [ %275, %272 ], [ %655, %673 ]
  %679 = phi float [ %274, %272 ], [ %660, %673 ]
  %680 = phi float addrspace(3)* [ %273, %272 ], [ %674, %673 ]
  %681 = add nuw nsw i32 %276, 1
  %682 = icmp eq i32 %681, %246
  br i1 %682, label %683, label %272, !llvm.loop !29

683:                                              ; preds = %677
  %684 = fdiv contract float %679, %678
  br label %685

685:                                              ; preds = %683, %241
  %686 = phi float [ %684, %683 ], [ 0x7FF8000000000000, %241 ]
  %687 = mul nsw i32 %78, %3
  %688 = add nsw i32 %79, %687
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds float, float addrspace(1)* %1, i64 %689
  store float %686, float addrspace(1)* %690, align 4, !tbaa !10
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !6, i64 0}
!12 = !{i16 1, i16 1025}
!13 = !{!14, !18, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !19, i64 32, !20, i64 40, !19, i64 48, !21, i64 56}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !{!"int", !16, i64 0}
!19 = !{!"long", !16, i64 0}
!20 = !{!"any pointer", !16, i64 0}
!21 = !{!"hsa_signal_s", !19, i64 0}
!22 = !{!14, !18, i64 16}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24}
!29 = distinct !{!29, !24}
