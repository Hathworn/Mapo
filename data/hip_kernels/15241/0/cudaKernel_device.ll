; ModuleID = '../data/hip_kernels/15241/0/main.cu'
source_filename = "../data/hip_kernels/15241/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10cudaKerneliPdPiS0_S0_(i32 %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !16
  %26 = mul i32 %18, %22
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %0
  br i1 %29, label %30, label %149

30:                                               ; preds = %5
  %31 = icmp slt i32 %17, %0
  %32 = add nsw i32 %0, -2
  %33 = udiv i32 %25, %22
  %34 = mul i32 %33, %22
  %35 = icmp ugt i32 %25, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %22
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 2
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 3
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 4
  %43 = getelementptr inbounds double, double addrspace(1)* %1, i64 5
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 6
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 7
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 8
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 9
  %48 = getelementptr inbounds double, double addrspace(1)* %1, i64 10
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 11
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 13
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 14
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 15
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 16
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 17
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 18
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 19
  %57 = getelementptr inbounds double, double addrspace(1)* %1, i64 20
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 21
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 22
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 23
  %61 = getelementptr inbounds double, double addrspace(1)* %1, i64 24
  br label %62

62:                                               ; preds = %30, %367
  %63 = phi i32 [ %28, %30 ], [ %368, %367 ]
  br i1 %31, label %64, label %367

64:                                               ; preds = %62
  %65 = add i32 %32, %63
  %66 = mul nsw i32 %63, %0
  %67 = udiv i32 %14, %11
  %68 = mul i32 %67, %11
  %69 = icmp ugt i32 %14, %68
  %70 = zext i1 %69 to i32
  %71 = add i32 %67, %70
  %72 = mul i32 %71, %11
  %73 = add i32 %65, 1
  %74 = add i32 %63, %0
  %75 = add i32 %65, 3
  %76 = add i32 %65, 4
  %77 = srem i32 %65, %0
  %78 = mul nsw i32 %77, %0
  %79 = load double, double addrspace(1)* %1, align 8, !tbaa !17, !amdgpu.noclobber !5
  %80 = srem i32 %65, %0
  %81 = mul nsw i32 %80, %0
  %82 = load double, double addrspace(1)* %39, align 8, !tbaa !17, !amdgpu.noclobber !5
  %83 = srem i32 %65, %0
  %84 = mul nsw i32 %83, %0
  %85 = load double, double addrspace(1)* %40, align 8, !tbaa !17, !amdgpu.noclobber !5
  %86 = srem i32 %65, %0
  %87 = mul nsw i32 %86, %0
  %88 = load double, double addrspace(1)* %41, align 8, !tbaa !17, !amdgpu.noclobber !5
  %89 = srem i32 %65, %0
  %90 = mul nsw i32 %89, %0
  %91 = load double, double addrspace(1)* %42, align 8, !tbaa !17, !amdgpu.noclobber !5
  %92 = srem i32 %73, %0
  %93 = mul nsw i32 %92, %0
  %94 = load double, double addrspace(1)* %43, align 8, !tbaa !17, !amdgpu.noclobber !5
  %95 = srem i32 %73, %0
  %96 = mul nsw i32 %95, %0
  %97 = load double, double addrspace(1)* %44, align 8, !tbaa !17, !amdgpu.noclobber !5
  %98 = srem i32 %73, %0
  %99 = mul nsw i32 %98, %0
  %100 = load double, double addrspace(1)* %45, align 8, !tbaa !17, !amdgpu.noclobber !5
  %101 = srem i32 %73, %0
  %102 = mul nsw i32 %101, %0
  %103 = load double, double addrspace(1)* %46, align 8, !tbaa !17, !amdgpu.noclobber !5
  %104 = srem i32 %73, %0
  %105 = mul nsw i32 %104, %0
  %106 = load double, double addrspace(1)* %47, align 8, !tbaa !17, !amdgpu.noclobber !5
  %107 = srem i32 %74, %0
  %108 = mul nsw i32 %107, %0
  %109 = load double, double addrspace(1)* %48, align 8, !tbaa !17, !amdgpu.noclobber !5
  %110 = srem i32 %74, %0
  %111 = mul nsw i32 %110, %0
  %112 = load double, double addrspace(1)* %49, align 8, !tbaa !17, !amdgpu.noclobber !5
  %113 = srem i32 %74, %0
  %114 = mul nsw i32 %113, %0
  %115 = load double, double addrspace(1)* %50, align 8, !tbaa !17, !amdgpu.noclobber !5
  %116 = srem i32 %74, %0
  %117 = mul nsw i32 %116, %0
  %118 = load double, double addrspace(1)* %51, align 8, !tbaa !17, !amdgpu.noclobber !5
  %119 = srem i32 %75, %0
  %120 = mul nsw i32 %119, %0
  %121 = load double, double addrspace(1)* %52, align 8, !tbaa !17, !amdgpu.noclobber !5
  %122 = srem i32 %75, %0
  %123 = mul nsw i32 %122, %0
  %124 = load double, double addrspace(1)* %53, align 8, !tbaa !17, !amdgpu.noclobber !5
  %125 = srem i32 %75, %0
  %126 = mul nsw i32 %125, %0
  %127 = load double, double addrspace(1)* %54, align 8, !tbaa !17, !amdgpu.noclobber !5
  %128 = srem i32 %75, %0
  %129 = mul nsw i32 %128, %0
  %130 = load double, double addrspace(1)* %55, align 8, !tbaa !17, !amdgpu.noclobber !5
  %131 = srem i32 %75, %0
  %132 = mul nsw i32 %131, %0
  %133 = load double, double addrspace(1)* %56, align 8, !tbaa !17, !amdgpu.noclobber !5
  %134 = srem i32 %76, %0
  %135 = mul nsw i32 %134, %0
  %136 = load double, double addrspace(1)* %57, align 8, !tbaa !17, !amdgpu.noclobber !5
  %137 = srem i32 %76, %0
  %138 = mul nsw i32 %137, %0
  %139 = load double, double addrspace(1)* %58, align 8, !tbaa !17, !amdgpu.noclobber !5
  %140 = srem i32 %76, %0
  %141 = mul nsw i32 %140, %0
  %142 = load double, double addrspace(1)* %59, align 8, !tbaa !17, !amdgpu.noclobber !5
  %143 = srem i32 %76, %0
  %144 = mul nsw i32 %143, %0
  %145 = load double, double addrspace(1)* %60, align 8, !tbaa !17, !amdgpu.noclobber !5
  %146 = srem i32 %76, %0
  %147 = mul nsw i32 %146, %0
  %148 = load double, double addrspace(1)* %61, align 8, !tbaa !17, !amdgpu.noclobber !5
  br label %150

149:                                              ; preds = %367, %5
  ret void

150:                                              ; preds = %64, %390
  %151 = phi i32 [ %17, %64 ], [ %391, %390 ]
  %152 = add i32 %32, %151
  %153 = srem i32 %152, %0
  %154 = add nsw i32 %78, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !21
  %158 = sitofp i32 %157 to double
  %159 = fmul contract double %79, %158
  %160 = fadd contract double %159, 0.000000e+00
  %161 = add i32 %152, 1
  %162 = srem i32 %161, %0
  %163 = add nsw i32 %81, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !21
  %167 = sitofp i32 %166 to double
  %168 = fmul contract double %82, %167
  %169 = fadd contract double %160, %168
  %170 = add i32 %151, %0
  %171 = srem i32 %170, %0
  %172 = add nsw i32 %84, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %173
  %175 = load i32, i32 addrspace(1)* %174, align 4, !tbaa !21
  %176 = sitofp i32 %175 to double
  %177 = fmul contract double %85, %176
  %178 = fadd contract double %169, %177
  %179 = add i32 %152, 3
  %180 = srem i32 %179, %0
  %181 = add nsw i32 %87, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %182
  %184 = load i32, i32 addrspace(1)* %183, align 4, !tbaa !21
  %185 = sitofp i32 %184 to double
  %186 = fmul contract double %88, %185
  %187 = fadd contract double %178, %186
  %188 = add i32 %152, 4
  %189 = srem i32 %188, %0
  %190 = add nsw i32 %90, %189
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %191
  %193 = load i32, i32 addrspace(1)* %192, align 4, !tbaa !21
  %194 = sitofp i32 %193 to double
  %195 = fmul contract double %91, %194
  %196 = fadd contract double %187, %195
  %197 = srem i32 %152, %0
  %198 = add nsw i32 %93, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %199
  %201 = load i32, i32 addrspace(1)* %200, align 4, !tbaa !21
  %202 = sitofp i32 %201 to double
  %203 = fmul contract double %94, %202
  %204 = fadd contract double %196, %203
  %205 = add i32 %152, 1
  %206 = srem i32 %205, %0
  %207 = add nsw i32 %96, %206
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %208
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !21
  %211 = sitofp i32 %210 to double
  %212 = fmul contract double %97, %211
  %213 = fadd contract double %204, %212
  %214 = add i32 %151, %0
  %215 = srem i32 %214, %0
  %216 = add nsw i32 %99, %215
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %217
  %219 = load i32, i32 addrspace(1)* %218, align 4, !tbaa !21
  %220 = sitofp i32 %219 to double
  %221 = fmul contract double %100, %220
  %222 = fadd contract double %213, %221
  %223 = add i32 %152, 3
  %224 = srem i32 %223, %0
  %225 = add nsw i32 %102, %224
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %226
  %228 = load i32, i32 addrspace(1)* %227, align 4, !tbaa !21
  %229 = sitofp i32 %228 to double
  %230 = fmul contract double %103, %229
  %231 = fadd contract double %222, %230
  %232 = add i32 %152, 4
  %233 = srem i32 %232, %0
  %234 = add nsw i32 %105, %233
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %235
  %237 = load i32, i32 addrspace(1)* %236, align 4, !tbaa !21
  %238 = sitofp i32 %237 to double
  %239 = fmul contract double %106, %238
  %240 = fadd contract double %231, %239
  %241 = srem i32 %152, %0
  %242 = add nsw i32 %108, %241
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %243
  %245 = load i32, i32 addrspace(1)* %244, align 4, !tbaa !21
  %246 = sitofp i32 %245 to double
  %247 = fmul contract double %109, %246
  %248 = fadd contract double %240, %247
  %249 = add i32 %152, 1
  %250 = srem i32 %249, %0
  %251 = add nsw i32 %111, %250
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %252
  %254 = load i32, i32 addrspace(1)* %253, align 4, !tbaa !21
  %255 = sitofp i32 %254 to double
  %256 = fmul contract double %112, %255
  %257 = fadd contract double %248, %256
  %258 = add i32 %152, 3
  %259 = srem i32 %258, %0
  %260 = add nsw i32 %114, %259
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %261
  %263 = load i32, i32 addrspace(1)* %262, align 4, !tbaa !21
  %264 = sitofp i32 %263 to double
  %265 = fmul contract double %115, %264
  %266 = fadd contract double %257, %265
  %267 = add i32 %152, 4
  %268 = srem i32 %267, %0
  %269 = add nsw i32 %117, %268
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %270
  %272 = load i32, i32 addrspace(1)* %271, align 4, !tbaa !21
  %273 = sitofp i32 %272 to double
  %274 = fmul contract double %118, %273
  %275 = fadd contract double %266, %274
  %276 = srem i32 %152, %0
  %277 = add nsw i32 %120, %276
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %278
  %280 = load i32, i32 addrspace(1)* %279, align 4, !tbaa !21
  %281 = sitofp i32 %280 to double
  %282 = fmul contract double %121, %281
  %283 = fadd contract double %275, %282
  %284 = add i32 %152, 1
  %285 = srem i32 %284, %0
  %286 = add nsw i32 %123, %285
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %287
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !21
  %290 = sitofp i32 %289 to double
  %291 = fmul contract double %124, %290
  %292 = fadd contract double %283, %291
  %293 = add i32 %151, %0
  %294 = srem i32 %293, %0
  %295 = add nsw i32 %126, %294
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %296
  %298 = load i32, i32 addrspace(1)* %297, align 4, !tbaa !21
  %299 = sitofp i32 %298 to double
  %300 = fmul contract double %127, %299
  %301 = fadd contract double %292, %300
  %302 = add i32 %152, 3
  %303 = srem i32 %302, %0
  %304 = add nsw i32 %129, %303
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !21
  %308 = sitofp i32 %307 to double
  %309 = fmul contract double %130, %308
  %310 = fadd contract double %301, %309
  %311 = add i32 %152, 4
  %312 = srem i32 %311, %0
  %313 = add nsw i32 %132, %312
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %314
  %316 = load i32, i32 addrspace(1)* %315, align 4, !tbaa !21
  %317 = sitofp i32 %316 to double
  %318 = fmul contract double %133, %317
  %319 = fadd contract double %310, %318
  %320 = srem i32 %152, %0
  %321 = add nsw i32 %135, %320
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %322
  %324 = load i32, i32 addrspace(1)* %323, align 4, !tbaa !21
  %325 = sitofp i32 %324 to double
  %326 = fmul contract double %136, %325
  %327 = fadd contract double %319, %326
  %328 = add i32 %152, 1
  %329 = srem i32 %328, %0
  %330 = add nsw i32 %138, %329
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %331
  %333 = load i32, i32 addrspace(1)* %332, align 4, !tbaa !21
  %334 = sitofp i32 %333 to double
  %335 = fmul contract double %139, %334
  %336 = fadd contract double %327, %335
  %337 = add i32 %151, %0
  %338 = srem i32 %337, %0
  %339 = add nsw i32 %141, %338
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %340
  %342 = load i32, i32 addrspace(1)* %341, align 4, !tbaa !21
  %343 = sitofp i32 %342 to double
  %344 = fmul contract double %142, %343
  %345 = fadd contract double %336, %344
  %346 = add i32 %152, 3
  %347 = srem i32 %346, %0
  %348 = add nsw i32 %144, %347
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %349
  %351 = load i32, i32 addrspace(1)* %350, align 4, !tbaa !21
  %352 = sitofp i32 %351 to double
  %353 = fmul contract double %145, %352
  %354 = fadd contract double %345, %353
  %355 = add i32 %152, 4
  %356 = srem i32 %355, %0
  %357 = add nsw i32 %147, %356
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %358
  %360 = load i32, i32 addrspace(1)* %359, align 4, !tbaa !21
  %361 = sitofp i32 %360 to double
  %362 = fmul contract double %148, %361
  %363 = fadd contract double %354, %362
  %364 = fcmp contract olt double %363, 1.000000e-04
  %365 = fcmp contract ogt double %363, -1.000000e-04
  %366 = and i1 %364, %365
  br i1 %366, label %370, label %376

367:                                              ; preds = %390, %62
  %368 = add i32 %38, %63
  %369 = icmp slt i32 %368, %0
  br i1 %369, label %62, label %149, !llvm.loop !23

370:                                              ; preds = %150
  %371 = add nsw i32 %151, %66
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %372
  %374 = load i32, i32 addrspace(1)* %373, align 4, !tbaa !21
  %375 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %372
  store i32 %374, i32 addrspace(1)* %375, align 4, !tbaa !21
  br label %390

376:                                              ; preds = %150
  %377 = fcmp contract ogt double %363, 1.000000e-05
  %378 = add nsw i32 %151, %66
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %379
  %381 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %379
  br i1 %377, label %382, label %386

382:                                              ; preds = %376
  store i32 1, i32 addrspace(1)* %380, align 4, !tbaa !21
  %383 = load i32, i32 addrspace(1)* %381, align 4, !tbaa !21
  %384 = icmp eq i32 %383, -1
  br i1 %384, label %385, label %390

385:                                              ; preds = %382
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !21
  br label %390

386:                                              ; preds = %376
  store i32 -1, i32 addrspace(1)* %380, align 4, !tbaa !21
  %387 = load i32, i32 addrspace(1)* %381, align 4, !tbaa !21
  %388 = icmp eq i32 %387, -1
  br i1 %388, label %389, label %390

389:                                              ; preds = %386
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !21
  br label %390

390:                                              ; preds = %370, %386, %389, %382, %385
  %391 = add i32 %72, %151
  %392 = icmp slt i32 %391, %0
  br i1 %392, label %150, label %367, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
