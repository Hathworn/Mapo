; ModuleID = '../data/hip_kernels/1251/2/main.cu'
source_filename = "../data/hip_kernels/1251/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19cuda_standarizationPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %8
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add nuw nsw i32 %20, 1
  %22 = add i32 %21, %13
  %23 = icmp slt i32 %22, %2
  br i1 %23, label %24, label %48

24:                                               ; preds = %3
  %25 = icmp sgt i32 %1, 0
  %26 = sitofp i32 %1 to float
  %27 = and i32 %1, 7
  %28 = icmp ult i32 %1, 8
  %29 = and i32 %1, -8
  %30 = icmp eq i32 %27, 0
  %31 = and i32 %1, 7
  %32 = icmp ult i32 %1, 8
  %33 = and i32 %1, -8
  %34 = icmp eq i32 %31, 0
  %35 = and i32 %1, 7
  %36 = icmp ult i32 %1, 8
  %37 = and i32 %1, -8
  %38 = icmp eq i32 %35, 0
  %39 = and i32 %1, 3
  %40 = icmp ult i32 %1, 4
  %41 = and i32 %1, -4
  %42 = icmp eq i32 %39, 0
  br label %43

43:                                               ; preds = %24, %363
  %44 = phi i32 [ %22, %24 ], [ %364, %363 ]
  br i1 %25, label %45, label %65

45:                                               ; preds = %43
  %46 = sext i32 %44 to i64
  %47 = getelementptr float, float addrspace(1)* %0, i64 %46
  br i1 %28, label %49, label %71

48:                                               ; preds = %363, %3
  ret void

49:                                               ; preds = %71, %45
  %50 = phi float [ undef, %45 ], [ %121, %71 ]
  %51 = phi float [ 0.000000e+00, %45 ], [ %121, %71 ]
  %52 = phi i32 [ 0, %45 ], [ %122, %71 ]
  br i1 %30, label %65, label %53

53:                                               ; preds = %49, %53
  %54 = phi float [ %61, %53 ], [ %51, %49 ]
  %55 = phi i32 [ %62, %53 ], [ %52, %49 ]
  %56 = phi i32 [ %63, %53 ], [ 0, %49 ]
  %57 = mul nsw i32 %55, %2
  %58 = sext i32 %57 to i64
  %59 = getelementptr float, float addrspace(1)* %47, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = fadd contract float %54, %60
  %62 = add nuw nsw i32 %55, 1
  %63 = add i32 %56, 1
  %64 = icmp eq i32 %63, %27
  br i1 %64, label %65, label %53, !llvm.loop !20

65:                                               ; preds = %49, %53, %43
  %66 = phi float [ 0.000000e+00, %43 ], [ %50, %49 ], [ %61, %53 ]
  %67 = fdiv contract float %66, %26
  br i1 %25, label %68, label %143

68:                                               ; preds = %65
  %69 = sext i32 %44 to i64
  %70 = getelementptr float, float addrspace(1)* %0, i64 %69
  br i1 %32, label %125, label %150

71:                                               ; preds = %45, %71
  %72 = phi float [ %121, %71 ], [ 0.000000e+00, %45 ]
  %73 = phi i32 [ %122, %71 ], [ 0, %45 ]
  %74 = phi i32 [ %123, %71 ], [ 0, %45 ]
  %75 = mul nsw i32 %73, %2
  %76 = sext i32 %75 to i64
  %77 = getelementptr float, float addrspace(1)* %47, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fadd contract float %72, %78
  %80 = or i32 %73, 1
  %81 = mul nsw i32 %80, %2
  %82 = sext i32 %81 to i64
  %83 = getelementptr float, float addrspace(1)* %47, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = fadd contract float %79, %84
  %86 = or i32 %73, 2
  %87 = mul nsw i32 %86, %2
  %88 = sext i32 %87 to i64
  %89 = getelementptr float, float addrspace(1)* %47, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fadd contract float %85, %90
  %92 = or i32 %73, 3
  %93 = mul nsw i32 %92, %2
  %94 = sext i32 %93 to i64
  %95 = getelementptr float, float addrspace(1)* %47, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fadd contract float %91, %96
  %98 = or i32 %73, 4
  %99 = mul nsw i32 %98, %2
  %100 = sext i32 %99 to i64
  %101 = getelementptr float, float addrspace(1)* %47, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = fadd contract float %97, %102
  %104 = or i32 %73, 5
  %105 = mul nsw i32 %104, %2
  %106 = sext i32 %105 to i64
  %107 = getelementptr float, float addrspace(1)* %47, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = fadd contract float %103, %108
  %110 = or i32 %73, 6
  %111 = mul nsw i32 %110, %2
  %112 = sext i32 %111 to i64
  %113 = getelementptr float, float addrspace(1)* %47, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fadd contract float %109, %114
  %116 = or i32 %73, 7
  %117 = mul nsw i32 %116, %2
  %118 = sext i32 %117 to i64
  %119 = getelementptr float, float addrspace(1)* %47, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fadd contract float %115, %120
  %122 = add nuw nsw i32 %73, 8
  %123 = add i32 %74, 8
  %124 = icmp eq i32 %123, %29
  br i1 %124, label %49, label %71, !llvm.loop !22

125:                                              ; preds = %150, %68
  %126 = phi float [ undef, %68 ], [ %216, %150 ]
  %127 = phi float [ 0.000000e+00, %68 ], [ %216, %150 ]
  %128 = phi i32 [ 0, %68 ], [ %217, %150 ]
  br i1 %34, label %143, label %129

129:                                              ; preds = %125, %129
  %130 = phi float [ %139, %129 ], [ %127, %125 ]
  %131 = phi i32 [ %140, %129 ], [ %128, %125 ]
  %132 = phi i32 [ %141, %129 ], [ 0, %125 ]
  %133 = mul nsw i32 %131, %2
  %134 = sext i32 %133 to i64
  %135 = getelementptr float, float addrspace(1)* %70, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fsub contract float %136, %67
  %138 = fmul contract float %137, %137
  %139 = fadd contract float %130, %138
  %140 = add nuw nsw i32 %131, 1
  %141 = add i32 %132, 1
  %142 = icmp eq i32 %141, %31
  br i1 %142, label %143, label %129, !llvm.loop !24

143:                                              ; preds = %125, %129, %65
  %144 = phi float [ 0.000000e+00, %65 ], [ %126, %125 ], [ %139, %129 ]
  %145 = fcmp contract oeq float %144, 0.000000e+00
  br i1 %145, label %146, label %249

146:                                              ; preds = %143
  br i1 %25, label %147, label %363

147:                                              ; preds = %146
  %148 = sext i32 %44 to i64
  %149 = getelementptr float, float addrspace(1)* %0, i64 %148
  br i1 %40, label %336, label %220

150:                                              ; preds = %68, %150
  %151 = phi float [ %216, %150 ], [ 0.000000e+00, %68 ]
  %152 = phi i32 [ %217, %150 ], [ 0, %68 ]
  %153 = phi i32 [ %218, %150 ], [ 0, %68 ]
  %154 = mul nsw i32 %152, %2
  %155 = sext i32 %154 to i64
  %156 = getelementptr float, float addrspace(1)* %70, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !16
  %158 = fsub contract float %157, %67
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %151, %159
  %161 = or i32 %152, 1
  %162 = mul nsw i32 %161, %2
  %163 = sext i32 %162 to i64
  %164 = getelementptr float, float addrspace(1)* %70, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16
  %166 = fsub contract float %165, %67
  %167 = fmul contract float %166, %166
  %168 = fadd contract float %160, %167
  %169 = or i32 %152, 2
  %170 = mul nsw i32 %169, %2
  %171 = sext i32 %170 to i64
  %172 = getelementptr float, float addrspace(1)* %70, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16
  %174 = fsub contract float %173, %67
  %175 = fmul contract float %174, %174
  %176 = fadd contract float %168, %175
  %177 = or i32 %152, 3
  %178 = mul nsw i32 %177, %2
  %179 = sext i32 %178 to i64
  %180 = getelementptr float, float addrspace(1)* %70, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !16
  %182 = fsub contract float %181, %67
  %183 = fmul contract float %182, %182
  %184 = fadd contract float %176, %183
  %185 = or i32 %152, 4
  %186 = mul nsw i32 %185, %2
  %187 = sext i32 %186 to i64
  %188 = getelementptr float, float addrspace(1)* %70, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !16
  %190 = fsub contract float %189, %67
  %191 = fmul contract float %190, %190
  %192 = fadd contract float %184, %191
  %193 = or i32 %152, 5
  %194 = mul nsw i32 %193, %2
  %195 = sext i32 %194 to i64
  %196 = getelementptr float, float addrspace(1)* %70, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !16
  %198 = fsub contract float %197, %67
  %199 = fmul contract float %198, %198
  %200 = fadd contract float %192, %199
  %201 = or i32 %152, 6
  %202 = mul nsw i32 %201, %2
  %203 = sext i32 %202 to i64
  %204 = getelementptr float, float addrspace(1)* %70, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !16
  %206 = fsub contract float %205, %67
  %207 = fmul contract float %206, %206
  %208 = fadd contract float %200, %207
  %209 = or i32 %152, 7
  %210 = mul nsw i32 %209, %2
  %211 = sext i32 %210 to i64
  %212 = getelementptr float, float addrspace(1)* %70, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !16
  %214 = fsub contract float %213, %67
  %215 = fmul contract float %214, %214
  %216 = fadd contract float %208, %215
  %217 = add nuw nsw i32 %152, 8
  %218 = add i32 %153, 8
  %219 = icmp eq i32 %218, %33
  br i1 %219, label %125, label %150, !llvm.loop !25

220:                                              ; preds = %147, %220
  %221 = phi i32 [ %246, %220 ], [ 0, %147 ]
  %222 = phi i32 [ %247, %220 ], [ 0, %147 ]
  %223 = mul nsw i32 %221, %2
  %224 = sext i32 %223 to i64
  %225 = getelementptr float, float addrspace(1)* %149, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !16
  %227 = fdiv contract float %226, 2.550000e+02
  store float %227, float addrspace(1)* %225, align 4, !tbaa !16
  %228 = or i32 %221, 1
  %229 = mul nsw i32 %228, %2
  %230 = sext i32 %229 to i64
  %231 = getelementptr float, float addrspace(1)* %149, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !16
  %233 = fdiv contract float %232, 2.550000e+02
  store float %233, float addrspace(1)* %231, align 4, !tbaa !16
  %234 = or i32 %221, 2
  %235 = mul nsw i32 %234, %2
  %236 = sext i32 %235 to i64
  %237 = getelementptr float, float addrspace(1)* %149, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !16
  %239 = fdiv contract float %238, 2.550000e+02
  store float %239, float addrspace(1)* %237, align 4, !tbaa !16
  %240 = or i32 %221, 3
  %241 = mul nsw i32 %240, %2
  %242 = sext i32 %241 to i64
  %243 = getelementptr float, float addrspace(1)* %149, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !16
  %245 = fdiv contract float %244, 2.550000e+02
  store float %245, float addrspace(1)* %243, align 4, !tbaa !16
  %246 = add nuw nsw i32 %221, 4
  %247 = add i32 %222, 4
  %248 = icmp eq i32 %247, %41
  br i1 %248, label %336, label %220, !llvm.loop !26

249:                                              ; preds = %143
  %250 = fcmp olt float %144, 0x39F0000000000000
  %251 = select i1 %250, float 0x41F0000000000000, float 1.000000e+00
  %252 = fmul float %144, %251
  %253 = tail call float @llvm.sqrt.f32(float %252)
  %254 = bitcast float %253 to i32
  %255 = add nsw i32 %254, -1
  %256 = bitcast i32 %255 to float
  %257 = add nsw i32 %254, 1
  %258 = bitcast i32 %257 to float
  %259 = tail call i1 @llvm.amdgcn.class.f32(float %252, i32 608)
  %260 = select i1 %250, float 0x3EF0000000000000, float 1.000000e+00
  %261 = fneg float %258
  %262 = tail call float @llvm.fma.f32(float %261, float %253, float %252)
  %263 = fcmp ogt float %262, 0.000000e+00
  %264 = fneg float %256
  %265 = tail call float @llvm.fma.f32(float %264, float %253, float %252)
  %266 = fcmp ole float %265, 0.000000e+00
  %267 = select i1 %266, float %256, float %253
  %268 = select i1 %263, float %258, float %267
  %269 = fmul float %260, %268
  %270 = select i1 %259, float %252, float %269
  %271 = fdiv contract float 1.000000e+00, %270
  br i1 %25, label %272, label %363

272:                                              ; preds = %249
  %273 = sext i32 %44 to i64
  %274 = getelementptr float, float addrspace(1)* %0, i64 %273
  br i1 %36, label %349, label %275

275:                                              ; preds = %272, %275
  %276 = phi i32 [ %333, %275 ], [ 0, %272 ]
  %277 = phi i32 [ %334, %275 ], [ 0, %272 ]
  %278 = mul nsw i32 %276, %2
  %279 = sext i32 %278 to i64
  %280 = getelementptr float, float addrspace(1)* %274, i64 %279
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !16
  %282 = fsub contract float %281, %67
  %283 = fmul contract float %271, %282
  store float %283, float addrspace(1)* %280, align 4, !tbaa !16
  %284 = or i32 %276, 1
  %285 = mul nsw i32 %284, %2
  %286 = sext i32 %285 to i64
  %287 = getelementptr float, float addrspace(1)* %274, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !16
  %289 = fsub contract float %288, %67
  %290 = fmul contract float %271, %289
  store float %290, float addrspace(1)* %287, align 4, !tbaa !16
  %291 = or i32 %276, 2
  %292 = mul nsw i32 %291, %2
  %293 = sext i32 %292 to i64
  %294 = getelementptr float, float addrspace(1)* %274, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !16
  %296 = fsub contract float %295, %67
  %297 = fmul contract float %271, %296
  store float %297, float addrspace(1)* %294, align 4, !tbaa !16
  %298 = or i32 %276, 3
  %299 = mul nsw i32 %298, %2
  %300 = sext i32 %299 to i64
  %301 = getelementptr float, float addrspace(1)* %274, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !16
  %303 = fsub contract float %302, %67
  %304 = fmul contract float %271, %303
  store float %304, float addrspace(1)* %301, align 4, !tbaa !16
  %305 = or i32 %276, 4
  %306 = mul nsw i32 %305, %2
  %307 = sext i32 %306 to i64
  %308 = getelementptr float, float addrspace(1)* %274, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !16
  %310 = fsub contract float %309, %67
  %311 = fmul contract float %271, %310
  store float %311, float addrspace(1)* %308, align 4, !tbaa !16
  %312 = or i32 %276, 5
  %313 = mul nsw i32 %312, %2
  %314 = sext i32 %313 to i64
  %315 = getelementptr float, float addrspace(1)* %274, i64 %314
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !16
  %317 = fsub contract float %316, %67
  %318 = fmul contract float %271, %317
  store float %318, float addrspace(1)* %315, align 4, !tbaa !16
  %319 = or i32 %276, 6
  %320 = mul nsw i32 %319, %2
  %321 = sext i32 %320 to i64
  %322 = getelementptr float, float addrspace(1)* %274, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !16
  %324 = fsub contract float %323, %67
  %325 = fmul contract float %271, %324
  store float %325, float addrspace(1)* %322, align 4, !tbaa !16
  %326 = or i32 %276, 7
  %327 = mul nsw i32 %326, %2
  %328 = sext i32 %327 to i64
  %329 = getelementptr float, float addrspace(1)* %274, i64 %328
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !16
  %331 = fsub contract float %330, %67
  %332 = fmul contract float %271, %331
  store float %332, float addrspace(1)* %329, align 4, !tbaa !16
  %333 = add nuw nsw i32 %276, 8
  %334 = add i32 %277, 8
  %335 = icmp eq i32 %334, %37
  br i1 %335, label %349, label %275, !llvm.loop !27

336:                                              ; preds = %220, %147
  %337 = phi i32 [ 0, %147 ], [ %246, %220 ]
  br i1 %42, label %363, label %338

338:                                              ; preds = %336, %338
  %339 = phi i32 [ %346, %338 ], [ %337, %336 ]
  %340 = phi i32 [ %347, %338 ], [ 0, %336 ]
  %341 = mul nsw i32 %339, %2
  %342 = sext i32 %341 to i64
  %343 = getelementptr float, float addrspace(1)* %149, i64 %342
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !16
  %345 = fdiv contract float %344, 2.550000e+02
  store float %345, float addrspace(1)* %343, align 4, !tbaa !16
  %346 = add nuw nsw i32 %339, 1
  %347 = add i32 %340, 1
  %348 = icmp eq i32 %347, %39
  br i1 %348, label %363, label %338, !llvm.loop !28

349:                                              ; preds = %275, %272
  %350 = phi i32 [ 0, %272 ], [ %333, %275 ]
  br i1 %38, label %363, label %351

351:                                              ; preds = %349, %351
  %352 = phi i32 [ %360, %351 ], [ %350, %349 ]
  %353 = phi i32 [ %361, %351 ], [ 0, %349 ]
  %354 = mul nsw i32 %352, %2
  %355 = sext i32 %354 to i64
  %356 = getelementptr float, float addrspace(1)* %274, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !16
  %358 = fsub contract float %357, %67
  %359 = fmul contract float %271, %358
  store float %359, float addrspace(1)* %356, align 4, !tbaa !16
  %360 = add nuw nsw i32 %352, 1
  %361 = add i32 %353, 1
  %362 = icmp eq i32 %361, %35
  br i1 %362, label %363, label %351, !llvm.loop !29

363:                                              ; preds = %349, %351, %336, %338, %249, %146
  %364 = add nsw i32 %44, %19
  %365 = icmp slt i32 %364, %2
  br i1 %365, label %43, label %48, !llvm.loop !30
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !23}
!28 = distinct !{!28, !21}
!29 = distinct !{!29, !21}
!30 = distinct !{!30, !23}
