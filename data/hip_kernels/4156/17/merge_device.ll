; ModuleID = '../data/hip_kernels/4156/17/main.cu'
source_filename = "../data/hip_kernels/4156/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5mergePhS_Pfii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 5
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 5
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !5
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = shl i32 %26, 5
  %28 = icmp sgt i32 %3, 0
  %29 = mul i32 %4, 3
  br i1 %28, label %30, label %56

30:                                               ; preds = %5
  %31 = mul nsw i32 %13, %27
  %32 = add nsw i32 %31, %9
  %33 = add i32 %3, -1
  %34 = and i32 %3, 7
  %35 = icmp ult i32 %33, 7
  br i1 %35, label %38, label %36

36:                                               ; preds = %30
  %37 = and i32 %3, -8
  br label %70

38:                                               ; preds = %70, %30
  %39 = phi float [ undef, %30 ], [ %128, %70 ]
  %40 = phi float [ 0.000000e+00, %30 ], [ %128, %70 ]
  %41 = phi i32 [ 0, %30 ], [ %129, %70 ]
  %42 = icmp eq i32 %34, 0
  br i1 %42, label %56, label %43

43:                                               ; preds = %38, %43
  %44 = phi float [ %52, %43 ], [ %40, %38 ]
  %45 = phi i32 [ %53, %43 ], [ %41, %38 ]
  %46 = phi i32 [ %54, %43 ], [ 0, %38 ]
  %47 = mul nsw i32 %45, %4
  %48 = add nsw i32 %32, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fadd contract float %44, %51
  %53 = add nuw nsw i32 %45, 1
  %54 = add i32 %46, 1
  %55 = icmp eq i32 %54, %34
  br i1 %55, label %56, label %43, !llvm.loop !20

56:                                               ; preds = %38, %43, %5
  %57 = phi float [ 0.000000e+00, %5 ], [ %39, %38 ], [ %52, %43 ]
  br i1 %28, label %61, label %58

58:                                               ; preds = %56
  %59 = mul nsw i32 %13, %27
  %60 = add nsw i32 %59, %9
  br label %167

61:                                               ; preds = %56
  %62 = fpext float %57 to double
  %63 = fadd contract double %62, 1.000000e-05
  %64 = mul nsw i32 %13, %27
  %65 = add nsw i32 %64, %9
  %66 = and i32 %3, 1
  %67 = icmp eq i32 %3, 1
  br i1 %67, label %155, label %68

68:                                               ; preds = %61
  %69 = and i32 %3, -2
  br label %132

70:                                               ; preds = %70, %36
  %71 = phi float [ 0.000000e+00, %36 ], [ %128, %70 ]
  %72 = phi i32 [ 0, %36 ], [ %129, %70 ]
  %73 = phi i32 [ 0, %36 ], [ %130, %70 ]
  %74 = mul nsw i32 %72, %4
  %75 = add nsw i32 %32, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fadd contract float %71, %78
  %80 = or i32 %72, 1
  %81 = mul nsw i32 %80, %4
  %82 = add nsw i32 %32, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %79, %85
  %87 = or i32 %72, 2
  %88 = mul nsw i32 %87, %4
  %89 = add nsw i32 %32, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fadd contract float %86, %92
  %94 = or i32 %72, 3
  %95 = mul nsw i32 %94, %4
  %96 = add nsw i32 %32, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fadd contract float %93, %99
  %101 = or i32 %72, 4
  %102 = mul nsw i32 %101, %4
  %103 = add nsw i32 %32, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fadd contract float %100, %106
  %108 = or i32 %72, 5
  %109 = mul nsw i32 %108, %4
  %110 = add nsw i32 %32, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = fadd contract float %107, %113
  %115 = or i32 %72, 6
  %116 = mul nsw i32 %115, %4
  %117 = add nsw i32 %32, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fadd contract float %114, %120
  %122 = or i32 %72, 7
  %123 = mul nsw i32 %122, %4
  %124 = add nsw i32 %32, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fadd contract float %121, %127
  %129 = add nuw nsw i32 %72, 8
  %130 = add i32 %73, 8
  %131 = icmp eq i32 %130, %37
  br i1 %131, label %38, label %70, !llvm.loop !22

132:                                              ; preds = %132, %68
  %133 = phi i32 [ 0, %68 ], [ %152, %132 ]
  %134 = phi i32 [ 0, %68 ], [ %153, %132 ]
  %135 = mul nsw i32 %133, %4
  %136 = add nsw i32 %65, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %2, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fpext float %139 to double
  %141 = fdiv contract double %140, %63
  %142 = fptrunc double %141 to float
  store float %142, float addrspace(1)* %138, align 4, !tbaa !16
  %143 = or i32 %133, 1
  %144 = mul nsw i32 %143, %4
  %145 = add nsw i32 %65, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fpext float %148 to double
  %150 = fdiv contract double %149, %63
  %151 = fptrunc double %150 to float
  store float %151, float addrspace(1)* %147, align 4, !tbaa !16
  %152 = add nuw nsw i32 %133, 2
  %153 = add i32 %134, 2
  %154 = icmp eq i32 %153, %69
  br i1 %154, label %155, label %132, !llvm.loop !24

155:                                              ; preds = %132, %61
  %156 = phi i32 [ 0, %61 ], [ %152, %132 ]
  %157 = icmp eq i32 %66, 0
  br i1 %157, label %167, label %158

158:                                              ; preds = %155
  %159 = mul nsw i32 %156, %4
  %160 = add nsw i32 %65, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = fpext float %163 to double
  %165 = fdiv contract double %164, %63
  %166 = fptrunc double %165 to float
  store float %166, float addrspace(1)* %162, align 4, !tbaa !16
  br label %167

167:                                              ; preds = %158, %155, %58
  %168 = phi i32 [ %60, %58 ], [ %65, %155 ], [ %65, %158 ]
  %169 = mul nsw i32 %168, 3
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %170
  store i8 0, i8 addrspace(1)* %171, align 1, !tbaa !25
  %172 = add nsw i32 %169, 1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %173
  store i8 0, i8 addrspace(1)* %174, align 1, !tbaa !25
  %175 = add nsw i32 %169, 2
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %176
  store i8 0, i8 addrspace(1)* %177, align 1, !tbaa !25
  br i1 %28, label %178, label %365

178:                                              ; preds = %167
  %179 = add i32 %3, -1
  %180 = and i32 %3, 1
  %181 = icmp eq i32 %179, 0
  br i1 %181, label %244, label %182

182:                                              ; preds = %178
  %183 = and i32 %3, -2
  br label %184

184:                                              ; preds = %184, %182
  %185 = phi i8 [ 0, %182 ], [ %240, %184 ]
  %186 = phi i8 [ 0, %182 ], [ %232, %184 ]
  %187 = phi i8 [ 0, %182 ], [ %224, %184 ]
  %188 = phi i32 [ 0, %182 ], [ %241, %184 ]
  %189 = phi i32 [ 0, %182 ], [ %242, %184 ]
  %190 = mul i32 %29, %188
  %191 = add nsw i32 %190, %169
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %192
  %194 = load i8, i8 addrspace(1)* %193, align 1, !tbaa !25
  %195 = uitofp i8 %194 to float
  %196 = fmul contract float %195, 2.500000e-01
  %197 = fptoui float %196 to i8
  %198 = add i8 %187, %197
  store i8 %198, i8 addrspace(1)* %171, align 1, !tbaa !25
  %199 = add nsw i32 %191, 1
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %200
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !25
  %203 = uitofp i8 %202 to float
  %204 = fmul contract float %203, 2.500000e-01
  %205 = fptoui float %204 to i8
  %206 = add i8 %186, %205
  store i8 %206, i8 addrspace(1)* %174, align 1, !tbaa !25
  %207 = add nsw i32 %191, 2
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %208
  %210 = load i8, i8 addrspace(1)* %209, align 1, !tbaa !25
  %211 = uitofp i8 %210 to float
  %212 = fmul contract float %211, 2.500000e-01
  %213 = fptoui float %212 to i8
  %214 = add i8 %185, %213
  store i8 %214, i8 addrspace(1)* %177, align 1, !tbaa !25
  %215 = or i32 %188, 1
  %216 = mul i32 %29, %215
  %217 = add nsw i32 %216, %169
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %218
  %220 = load i8, i8 addrspace(1)* %219, align 1, !tbaa !25
  %221 = uitofp i8 %220 to float
  %222 = fmul contract float %221, 2.500000e-01
  %223 = fptoui float %222 to i8
  %224 = add i8 %198, %223
  store i8 %224, i8 addrspace(1)* %171, align 1, !tbaa !25
  %225 = add nsw i32 %217, 1
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %226
  %228 = load i8, i8 addrspace(1)* %227, align 1, !tbaa !25
  %229 = uitofp i8 %228 to float
  %230 = fmul contract float %229, 2.500000e-01
  %231 = fptoui float %230 to i8
  %232 = add i8 %206, %231
  store i8 %232, i8 addrspace(1)* %174, align 1, !tbaa !25
  %233 = add nsw i32 %217, 2
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %234
  %236 = load i8, i8 addrspace(1)* %235, align 1, !tbaa !25
  %237 = uitofp i8 %236 to float
  %238 = fmul contract float %237, 2.500000e-01
  %239 = fptoui float %238 to i8
  %240 = add i8 %214, %239
  store i8 %240, i8 addrspace(1)* %177, align 1, !tbaa !25
  %241 = add nuw nsw i32 %188, 2
  %242 = add i32 %189, 2
  %243 = icmp eq i32 %242, %183
  br i1 %243, label %244, label %184, !llvm.loop !26

244:                                              ; preds = %184, %178
  %245 = phi i8 [ 0, %178 ], [ %240, %184 ]
  %246 = phi i8 [ 0, %178 ], [ %232, %184 ]
  %247 = phi i8 [ 0, %178 ], [ %224, %184 ]
  %248 = phi i32 [ 0, %178 ], [ %241, %184 ]
  %249 = icmp eq i32 %180, 0
  br i1 %249, label %276, label %250

250:                                              ; preds = %244
  %251 = mul i32 %29, %248
  %252 = add nsw i32 %251, %169
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %253
  %255 = load i8, i8 addrspace(1)* %254, align 1, !tbaa !25
  %256 = uitofp i8 %255 to float
  %257 = fmul contract float %256, 2.500000e-01
  %258 = fptoui float %257 to i8
  %259 = add i8 %247, %258
  store i8 %259, i8 addrspace(1)* %171, align 1, !tbaa !25
  %260 = add nsw i32 %252, 1
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %261
  %263 = load i8, i8 addrspace(1)* %262, align 1, !tbaa !25
  %264 = uitofp i8 %263 to float
  %265 = fmul contract float %264, 2.500000e-01
  %266 = fptoui float %265 to i8
  %267 = add i8 %246, %266
  store i8 %267, i8 addrspace(1)* %174, align 1, !tbaa !25
  %268 = add nsw i32 %252, 2
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %269
  %271 = load i8, i8 addrspace(1)* %270, align 1, !tbaa !25
  %272 = uitofp i8 %271 to float
  %273 = fmul contract float %272, 2.500000e-01
  %274 = fptoui float %273 to i8
  %275 = add i8 %245, %274
  store i8 %275, i8 addrspace(1)* %177, align 1, !tbaa !25
  br label %276

276:                                              ; preds = %244, %250
  br i1 %28, label %277, label %365

277:                                              ; preds = %276
  %278 = add nsw i32 %13, 8
  %279 = mul nsw i32 %278, %27
  %280 = add nsw i32 %279, %9
  %281 = and i32 %3, 7
  %282 = icmp ult i32 %179, 7
  br i1 %282, label %347, label %283

283:                                              ; preds = %277
  %284 = and i32 %3, -8
  br label %285

285:                                              ; preds = %285, %283
  %286 = phi float [ 0.000000e+00, %283 ], [ %343, %285 ]
  %287 = phi i32 [ 0, %283 ], [ %344, %285 ]
  %288 = phi i32 [ 0, %283 ], [ %345, %285 ]
  %289 = mul nsw i32 %287, %4
  %290 = add nsw i32 %280, %289
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds float, float addrspace(1)* %2, i64 %291
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !16
  %294 = fadd contract float %286, %293
  %295 = or i32 %287, 1
  %296 = mul nsw i32 %295, %4
  %297 = add nsw i32 %280, %296
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %2, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !16
  %301 = fadd contract float %294, %300
  %302 = or i32 %287, 2
  %303 = mul nsw i32 %302, %4
  %304 = add nsw i32 %280, %303
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %2, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !16
  %308 = fadd contract float %301, %307
  %309 = or i32 %287, 3
  %310 = mul nsw i32 %309, %4
  %311 = add nsw i32 %280, %310
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %2, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !16
  %315 = fadd contract float %308, %314
  %316 = or i32 %287, 4
  %317 = mul nsw i32 %316, %4
  %318 = add nsw i32 %280, %317
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %2, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !16
  %322 = fadd contract float %315, %321
  %323 = or i32 %287, 5
  %324 = mul nsw i32 %323, %4
  %325 = add nsw i32 %280, %324
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %2, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !16
  %329 = fadd contract float %322, %328
  %330 = or i32 %287, 6
  %331 = mul nsw i32 %330, %4
  %332 = add nsw i32 %280, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %2, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !16
  %336 = fadd contract float %329, %335
  %337 = or i32 %287, 7
  %338 = mul nsw i32 %337, %4
  %339 = add nsw i32 %280, %338
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %2, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !16
  %343 = fadd contract float %336, %342
  %344 = add nuw nsw i32 %287, 8
  %345 = add i32 %288, 8
  %346 = icmp eq i32 %345, %284
  br i1 %346, label %347, label %285, !llvm.loop !22

347:                                              ; preds = %285, %277
  %348 = phi float [ undef, %277 ], [ %343, %285 ]
  %349 = phi float [ 0.000000e+00, %277 ], [ %343, %285 ]
  %350 = phi i32 [ 0, %277 ], [ %344, %285 ]
  %351 = icmp eq i32 %281, 0
  br i1 %351, label %365, label %352

352:                                              ; preds = %347, %352
  %353 = phi float [ %361, %352 ], [ %349, %347 ]
  %354 = phi i32 [ %362, %352 ], [ %350, %347 ]
  %355 = phi i32 [ %363, %352 ], [ 0, %347 ]
  %356 = mul nsw i32 %354, %4
  %357 = add nsw i32 %280, %356
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %2, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !16
  %361 = fadd contract float %353, %360
  %362 = add nuw nsw i32 %354, 1
  %363 = add i32 %355, 1
  %364 = icmp eq i32 %363, %281
  br i1 %364, label %365, label %352, !llvm.loop !27

365:                                              ; preds = %347, %352, %167, %276
  %366 = phi float [ 0.000000e+00, %276 ], [ 0.000000e+00, %167 ], [ %348, %347 ], [ %361, %352 ]
  br i1 %28, label %371, label %367

367:                                              ; preds = %365
  %368 = add nsw i32 %13, 8
  %369 = mul nsw i32 %368, %27
  %370 = add nsw i32 %369, %9
  br label %416

371:                                              ; preds = %365
  %372 = fpext float %366 to double
  %373 = fadd contract double %372, 1.000000e-05
  %374 = add nsw i32 %13, 8
  %375 = mul nsw i32 %374, %27
  %376 = add nsw i32 %375, %9
  %377 = and i32 %3, 1
  %378 = icmp eq i32 %3, 1
  br i1 %378, label %404, label %379

379:                                              ; preds = %371
  %380 = and i32 %3, -2
  br label %381

381:                                              ; preds = %381, %379
  %382 = phi i32 [ 0, %379 ], [ %401, %381 ]
  %383 = phi i32 [ 0, %379 ], [ %402, %381 ]
  %384 = mul nsw i32 %382, %4
  %385 = add nsw i32 %376, %384
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %2, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !16
  %389 = fpext float %388 to double
  %390 = fdiv contract double %389, %373
  %391 = fptrunc double %390 to float
  store float %391, float addrspace(1)* %387, align 4, !tbaa !16
  %392 = or i32 %382, 1
  %393 = mul nsw i32 %392, %4
  %394 = add nsw i32 %376, %393
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %2, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !16
  %398 = fpext float %397 to double
  %399 = fdiv contract double %398, %373
  %400 = fptrunc double %399 to float
  store float %400, float addrspace(1)* %396, align 4, !tbaa !16
  %401 = add nuw nsw i32 %382, 2
  %402 = add i32 %383, 2
  %403 = icmp eq i32 %402, %380
  br i1 %403, label %404, label %381, !llvm.loop !24

404:                                              ; preds = %381, %371
  %405 = phi i32 [ 0, %371 ], [ %401, %381 ]
  %406 = icmp eq i32 %377, 0
  br i1 %406, label %416, label %407

407:                                              ; preds = %404
  %408 = mul nsw i32 %405, %4
  %409 = add nsw i32 %376, %408
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %2, i64 %410
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !16
  %413 = fpext float %412 to double
  %414 = fdiv contract double %413, %373
  %415 = fptrunc double %414 to float
  store float %415, float addrspace(1)* %411, align 4, !tbaa !16
  br label %416

416:                                              ; preds = %407, %404, %367
  %417 = phi i32 [ %370, %367 ], [ %376, %404 ], [ %376, %407 ]
  %418 = mul nsw i32 %417, 3
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %419
  store i8 0, i8 addrspace(1)* %420, align 1, !tbaa !25
  %421 = add nsw i32 %418, 1
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %422
  store i8 0, i8 addrspace(1)* %423, align 1, !tbaa !25
  %424 = add nsw i32 %418, 2
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %425
  store i8 0, i8 addrspace(1)* %426, align 1, !tbaa !25
  br i1 %28, label %427, label %618

427:                                              ; preds = %416
  %428 = add i32 %3, -1
  %429 = and i32 %3, 1
  %430 = icmp eq i32 %428, 0
  br i1 %430, label %493, label %431

431:                                              ; preds = %427
  %432 = and i32 %3, -2
  br label %433

433:                                              ; preds = %433, %431
  %434 = phi i8 [ 0, %431 ], [ %489, %433 ]
  %435 = phi i8 [ 0, %431 ], [ %481, %433 ]
  %436 = phi i8 [ 0, %431 ], [ %473, %433 ]
  %437 = phi i32 [ 0, %431 ], [ %490, %433 ]
  %438 = phi i32 [ 0, %431 ], [ %491, %433 ]
  %439 = mul i32 %29, %437
  %440 = add nsw i32 %439, %418
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %441
  %443 = load i8, i8 addrspace(1)* %442, align 1, !tbaa !25
  %444 = uitofp i8 %443 to float
  %445 = fmul contract float %444, 2.500000e-01
  %446 = fptoui float %445 to i8
  %447 = add i8 %436, %446
  store i8 %447, i8 addrspace(1)* %420, align 1, !tbaa !25
  %448 = add nsw i32 %440, 1
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %449
  %451 = load i8, i8 addrspace(1)* %450, align 1, !tbaa !25
  %452 = uitofp i8 %451 to float
  %453 = fmul contract float %452, 2.500000e-01
  %454 = fptoui float %453 to i8
  %455 = add i8 %435, %454
  store i8 %455, i8 addrspace(1)* %423, align 1, !tbaa !25
  %456 = add nsw i32 %440, 2
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %457
  %459 = load i8, i8 addrspace(1)* %458, align 1, !tbaa !25
  %460 = uitofp i8 %459 to float
  %461 = fmul contract float %460, 2.500000e-01
  %462 = fptoui float %461 to i8
  %463 = add i8 %434, %462
  store i8 %463, i8 addrspace(1)* %426, align 1, !tbaa !25
  %464 = or i32 %437, 1
  %465 = mul i32 %29, %464
  %466 = add nsw i32 %465, %418
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %467
  %469 = load i8, i8 addrspace(1)* %468, align 1, !tbaa !25
  %470 = uitofp i8 %469 to float
  %471 = fmul contract float %470, 2.500000e-01
  %472 = fptoui float %471 to i8
  %473 = add i8 %447, %472
  store i8 %473, i8 addrspace(1)* %420, align 1, !tbaa !25
  %474 = add nsw i32 %466, 1
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %475
  %477 = load i8, i8 addrspace(1)* %476, align 1, !tbaa !25
  %478 = uitofp i8 %477 to float
  %479 = fmul contract float %478, 2.500000e-01
  %480 = fptoui float %479 to i8
  %481 = add i8 %455, %480
  store i8 %481, i8 addrspace(1)* %423, align 1, !tbaa !25
  %482 = add nsw i32 %466, 2
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %483
  %485 = load i8, i8 addrspace(1)* %484, align 1, !tbaa !25
  %486 = uitofp i8 %485 to float
  %487 = fmul contract float %486, 2.500000e-01
  %488 = fptoui float %487 to i8
  %489 = add i8 %463, %488
  store i8 %489, i8 addrspace(1)* %426, align 1, !tbaa !25
  %490 = add nuw nsw i32 %437, 2
  %491 = add i32 %438, 2
  %492 = icmp eq i32 %491, %432
  br i1 %492, label %493, label %433, !llvm.loop !26

493:                                              ; preds = %433, %427
  %494 = phi i8 [ 0, %427 ], [ %489, %433 ]
  %495 = phi i8 [ 0, %427 ], [ %481, %433 ]
  %496 = phi i8 [ 0, %427 ], [ %473, %433 ]
  %497 = phi i32 [ 0, %427 ], [ %490, %433 ]
  %498 = icmp eq i32 %429, 0
  br i1 %498, label %525, label %499

499:                                              ; preds = %493
  %500 = mul i32 %29, %497
  %501 = add nsw i32 %500, %418
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %502
  %504 = load i8, i8 addrspace(1)* %503, align 1, !tbaa !25
  %505 = uitofp i8 %504 to float
  %506 = fmul contract float %505, 2.500000e-01
  %507 = fptoui float %506 to i8
  %508 = add i8 %496, %507
  store i8 %508, i8 addrspace(1)* %420, align 1, !tbaa !25
  %509 = add nsw i32 %501, 1
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %510
  %512 = load i8, i8 addrspace(1)* %511, align 1, !tbaa !25
  %513 = uitofp i8 %512 to float
  %514 = fmul contract float %513, 2.500000e-01
  %515 = fptoui float %514 to i8
  %516 = add i8 %495, %515
  store i8 %516, i8 addrspace(1)* %423, align 1, !tbaa !25
  %517 = add nsw i32 %501, 2
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %518
  %520 = load i8, i8 addrspace(1)* %519, align 1, !tbaa !25
  %521 = uitofp i8 %520 to float
  %522 = fmul contract float %521, 2.500000e-01
  %523 = fptoui float %522 to i8
  %524 = add i8 %494, %523
  store i8 %524, i8 addrspace(1)* %426, align 1, !tbaa !25
  br label %525

525:                                              ; preds = %493, %499
  br i1 %28, label %526, label %618

526:                                              ; preds = %525
  %527 = add nsw i32 %13, 16
  %528 = mul nsw i32 %527, %27
  %529 = add nsw i32 %528, %9
  %530 = and i32 %3, 7
  %531 = icmp ult i32 %428, 7
  br i1 %531, label %596, label %532

532:                                              ; preds = %526
  %533 = and i32 %3, -8
  br label %534

534:                                              ; preds = %534, %532
  %535 = phi float [ 0.000000e+00, %532 ], [ %592, %534 ]
  %536 = phi i32 [ 0, %532 ], [ %593, %534 ]
  %537 = phi i32 [ 0, %532 ], [ %594, %534 ]
  %538 = mul nsw i32 %536, %4
  %539 = add nsw i32 %529, %538
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %2, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !16
  %543 = fadd contract float %535, %542
  %544 = or i32 %536, 1
  %545 = mul nsw i32 %544, %4
  %546 = add nsw i32 %529, %545
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds float, float addrspace(1)* %2, i64 %547
  %549 = load float, float addrspace(1)* %548, align 4, !tbaa !16
  %550 = fadd contract float %543, %549
  %551 = or i32 %536, 2
  %552 = mul nsw i32 %551, %4
  %553 = add nsw i32 %529, %552
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %2, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !16
  %557 = fadd contract float %550, %556
  %558 = or i32 %536, 3
  %559 = mul nsw i32 %558, %4
  %560 = add nsw i32 %529, %559
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %2, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !16
  %564 = fadd contract float %557, %563
  %565 = or i32 %536, 4
  %566 = mul nsw i32 %565, %4
  %567 = add nsw i32 %529, %566
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %2, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !16
  %571 = fadd contract float %564, %570
  %572 = or i32 %536, 5
  %573 = mul nsw i32 %572, %4
  %574 = add nsw i32 %529, %573
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %2, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !16
  %578 = fadd contract float %571, %577
  %579 = or i32 %536, 6
  %580 = mul nsw i32 %579, %4
  %581 = add nsw i32 %529, %580
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %2, i64 %582
  %584 = load float, float addrspace(1)* %583, align 4, !tbaa !16
  %585 = fadd contract float %578, %584
  %586 = or i32 %536, 7
  %587 = mul nsw i32 %586, %4
  %588 = add nsw i32 %529, %587
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %2, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !16
  %592 = fadd contract float %585, %591
  %593 = add nuw nsw i32 %536, 8
  %594 = add i32 %537, 8
  %595 = icmp eq i32 %594, %533
  br i1 %595, label %596, label %534, !llvm.loop !22

596:                                              ; preds = %534, %526
  %597 = phi float [ undef, %526 ], [ %592, %534 ]
  %598 = phi float [ 0.000000e+00, %526 ], [ %592, %534 ]
  %599 = phi i32 [ 0, %526 ], [ %593, %534 ]
  %600 = icmp eq i32 %530, 0
  br i1 %600, label %614, label %601

601:                                              ; preds = %596, %601
  %602 = phi float [ %610, %601 ], [ %598, %596 ]
  %603 = phi i32 [ %611, %601 ], [ %599, %596 ]
  %604 = phi i32 [ %612, %601 ], [ 0, %596 ]
  %605 = mul nsw i32 %603, %4
  %606 = add nsw i32 %529, %605
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds float, float addrspace(1)* %2, i64 %607
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !16
  %610 = fadd contract float %602, %609
  %611 = add nuw nsw i32 %603, 1
  %612 = add i32 %604, 1
  %613 = icmp eq i32 %612, %530
  br i1 %613, label %614, label %601, !llvm.loop !28

614:                                              ; preds = %601, %596
  %615 = phi float [ %597, %596 ], [ %610, %601 ]
  %616 = fpext float %615 to double
  %617 = fadd contract double %616, 1.000000e-05
  br label %618

618:                                              ; preds = %416, %614, %525
  %619 = phi double [ 1.000000e-05, %525 ], [ %617, %614 ], [ 1.000000e-05, %416 ]
  %620 = add nsw i32 %13, 16
  %621 = mul nsw i32 %620, %27
  %622 = add nsw i32 %621, %9
  br i1 %28, label %623, label %663

623:                                              ; preds = %618
  %624 = and i32 %3, 1
  %625 = icmp eq i32 %3, 1
  br i1 %625, label %651, label %626

626:                                              ; preds = %623
  %627 = and i32 %3, -2
  br label %628

628:                                              ; preds = %628, %626
  %629 = phi i32 [ 0, %626 ], [ %648, %628 ]
  %630 = phi i32 [ 0, %626 ], [ %649, %628 ]
  %631 = mul nsw i32 %629, %4
  %632 = add nsw i32 %622, %631
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds float, float addrspace(1)* %2, i64 %633
  %635 = load float, float addrspace(1)* %634, align 4, !tbaa !16
  %636 = fpext float %635 to double
  %637 = fdiv contract double %636, %619
  %638 = fptrunc double %637 to float
  store float %638, float addrspace(1)* %634, align 4, !tbaa !16
  %639 = or i32 %629, 1
  %640 = mul nsw i32 %639, %4
  %641 = add nsw i32 %622, %640
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds float, float addrspace(1)* %2, i64 %642
  %644 = load float, float addrspace(1)* %643, align 4, !tbaa !16
  %645 = fpext float %644 to double
  %646 = fdiv contract double %645, %619
  %647 = fptrunc double %646 to float
  store float %647, float addrspace(1)* %643, align 4, !tbaa !16
  %648 = add nuw nsw i32 %629, 2
  %649 = add i32 %630, 2
  %650 = icmp eq i32 %649, %627
  br i1 %650, label %651, label %628, !llvm.loop !24

651:                                              ; preds = %628, %623
  %652 = phi i32 [ 0, %623 ], [ %648, %628 ]
  %653 = icmp eq i32 %624, 0
  br i1 %653, label %663, label %654

654:                                              ; preds = %651
  %655 = mul nsw i32 %652, %4
  %656 = add nsw i32 %622, %655
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds float, float addrspace(1)* %2, i64 %657
  %659 = load float, float addrspace(1)* %658, align 4, !tbaa !16
  %660 = fpext float %659 to double
  %661 = fdiv contract double %660, %619
  %662 = fptrunc double %661 to float
  store float %662, float addrspace(1)* %658, align 4, !tbaa !16
  br label %663

663:                                              ; preds = %654, %651, %618
  %664 = mul nsw i32 %622, 3
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %665
  store i8 0, i8 addrspace(1)* %666, align 1, !tbaa !25
  %667 = add nsw i32 %664, 1
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %668
  store i8 0, i8 addrspace(1)* %669, align 1, !tbaa !25
  %670 = add nsw i32 %664, 2
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %671
  store i8 0, i8 addrspace(1)* %672, align 1, !tbaa !25
  br i1 %28, label %673, label %864

673:                                              ; preds = %663
  %674 = add i32 %3, -1
  %675 = and i32 %3, 1
  %676 = icmp eq i32 %674, 0
  br i1 %676, label %739, label %677

677:                                              ; preds = %673
  %678 = and i32 %3, -2
  br label %679

679:                                              ; preds = %679, %677
  %680 = phi i8 [ 0, %677 ], [ %735, %679 ]
  %681 = phi i8 [ 0, %677 ], [ %727, %679 ]
  %682 = phi i8 [ 0, %677 ], [ %719, %679 ]
  %683 = phi i32 [ 0, %677 ], [ %736, %679 ]
  %684 = phi i32 [ 0, %677 ], [ %737, %679 ]
  %685 = mul i32 %29, %683
  %686 = add nsw i32 %685, %664
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %687
  %689 = load i8, i8 addrspace(1)* %688, align 1, !tbaa !25
  %690 = uitofp i8 %689 to float
  %691 = fmul contract float %690, 2.500000e-01
  %692 = fptoui float %691 to i8
  %693 = add i8 %682, %692
  store i8 %693, i8 addrspace(1)* %666, align 1, !tbaa !25
  %694 = add nsw i32 %686, 1
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %695
  %697 = load i8, i8 addrspace(1)* %696, align 1, !tbaa !25
  %698 = uitofp i8 %697 to float
  %699 = fmul contract float %698, 2.500000e-01
  %700 = fptoui float %699 to i8
  %701 = add i8 %681, %700
  store i8 %701, i8 addrspace(1)* %669, align 1, !tbaa !25
  %702 = add nsw i32 %686, 2
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %703
  %705 = load i8, i8 addrspace(1)* %704, align 1, !tbaa !25
  %706 = uitofp i8 %705 to float
  %707 = fmul contract float %706, 2.500000e-01
  %708 = fptoui float %707 to i8
  %709 = add i8 %680, %708
  store i8 %709, i8 addrspace(1)* %672, align 1, !tbaa !25
  %710 = or i32 %683, 1
  %711 = mul i32 %29, %710
  %712 = add nsw i32 %711, %664
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %713
  %715 = load i8, i8 addrspace(1)* %714, align 1, !tbaa !25
  %716 = uitofp i8 %715 to float
  %717 = fmul contract float %716, 2.500000e-01
  %718 = fptoui float %717 to i8
  %719 = add i8 %693, %718
  store i8 %719, i8 addrspace(1)* %666, align 1, !tbaa !25
  %720 = add nsw i32 %712, 1
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %721
  %723 = load i8, i8 addrspace(1)* %722, align 1, !tbaa !25
  %724 = uitofp i8 %723 to float
  %725 = fmul contract float %724, 2.500000e-01
  %726 = fptoui float %725 to i8
  %727 = add i8 %701, %726
  store i8 %727, i8 addrspace(1)* %669, align 1, !tbaa !25
  %728 = add nsw i32 %712, 2
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %729
  %731 = load i8, i8 addrspace(1)* %730, align 1, !tbaa !25
  %732 = uitofp i8 %731 to float
  %733 = fmul contract float %732, 2.500000e-01
  %734 = fptoui float %733 to i8
  %735 = add i8 %709, %734
  store i8 %735, i8 addrspace(1)* %672, align 1, !tbaa !25
  %736 = add nuw nsw i32 %683, 2
  %737 = add i32 %684, 2
  %738 = icmp eq i32 %737, %678
  br i1 %738, label %739, label %679, !llvm.loop !26

739:                                              ; preds = %679, %673
  %740 = phi i8 [ 0, %673 ], [ %735, %679 ]
  %741 = phi i8 [ 0, %673 ], [ %727, %679 ]
  %742 = phi i8 [ 0, %673 ], [ %719, %679 ]
  %743 = phi i32 [ 0, %673 ], [ %736, %679 ]
  %744 = icmp eq i32 %675, 0
  br i1 %744, label %771, label %745

745:                                              ; preds = %739
  %746 = mul i32 %29, %743
  %747 = add nsw i32 %746, %664
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %748
  %750 = load i8, i8 addrspace(1)* %749, align 1, !tbaa !25
  %751 = uitofp i8 %750 to float
  %752 = fmul contract float %751, 2.500000e-01
  %753 = fptoui float %752 to i8
  %754 = add i8 %742, %753
  store i8 %754, i8 addrspace(1)* %666, align 1, !tbaa !25
  %755 = add nsw i32 %747, 1
  %756 = sext i32 %755 to i64
  %757 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %756
  %758 = load i8, i8 addrspace(1)* %757, align 1, !tbaa !25
  %759 = uitofp i8 %758 to float
  %760 = fmul contract float %759, 2.500000e-01
  %761 = fptoui float %760 to i8
  %762 = add i8 %741, %761
  store i8 %762, i8 addrspace(1)* %669, align 1, !tbaa !25
  %763 = add nsw i32 %747, 2
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %764
  %766 = load i8, i8 addrspace(1)* %765, align 1, !tbaa !25
  %767 = uitofp i8 %766 to float
  %768 = fmul contract float %767, 2.500000e-01
  %769 = fptoui float %768 to i8
  %770 = add i8 %740, %769
  store i8 %770, i8 addrspace(1)* %672, align 1, !tbaa !25
  br label %771

771:                                              ; preds = %739, %745
  br i1 %28, label %772, label %864

772:                                              ; preds = %771
  %773 = add nsw i32 %13, 24
  %774 = mul nsw i32 %773, %27
  %775 = add nsw i32 %774, %9
  %776 = and i32 %3, 7
  %777 = icmp ult i32 %674, 7
  br i1 %777, label %842, label %778

778:                                              ; preds = %772
  %779 = and i32 %3, -8
  br label %780

780:                                              ; preds = %780, %778
  %781 = phi float [ 0.000000e+00, %778 ], [ %838, %780 ]
  %782 = phi i32 [ 0, %778 ], [ %839, %780 ]
  %783 = phi i32 [ 0, %778 ], [ %840, %780 ]
  %784 = mul nsw i32 %782, %4
  %785 = add nsw i32 %775, %784
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds float, float addrspace(1)* %2, i64 %786
  %788 = load float, float addrspace(1)* %787, align 4, !tbaa !16
  %789 = fadd contract float %781, %788
  %790 = or i32 %782, 1
  %791 = mul nsw i32 %790, %4
  %792 = add nsw i32 %775, %791
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds float, float addrspace(1)* %2, i64 %793
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !16
  %796 = fadd contract float %789, %795
  %797 = or i32 %782, 2
  %798 = mul nsw i32 %797, %4
  %799 = add nsw i32 %775, %798
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %2, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !16
  %803 = fadd contract float %796, %802
  %804 = or i32 %782, 3
  %805 = mul nsw i32 %804, %4
  %806 = add nsw i32 %775, %805
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds float, float addrspace(1)* %2, i64 %807
  %809 = load float, float addrspace(1)* %808, align 4, !tbaa !16
  %810 = fadd contract float %803, %809
  %811 = or i32 %782, 4
  %812 = mul nsw i32 %811, %4
  %813 = add nsw i32 %775, %812
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds float, float addrspace(1)* %2, i64 %814
  %816 = load float, float addrspace(1)* %815, align 4, !tbaa !16
  %817 = fadd contract float %810, %816
  %818 = or i32 %782, 5
  %819 = mul nsw i32 %818, %4
  %820 = add nsw i32 %775, %819
  %821 = sext i32 %820 to i64
  %822 = getelementptr inbounds float, float addrspace(1)* %2, i64 %821
  %823 = load float, float addrspace(1)* %822, align 4, !tbaa !16
  %824 = fadd contract float %817, %823
  %825 = or i32 %782, 6
  %826 = mul nsw i32 %825, %4
  %827 = add nsw i32 %775, %826
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds float, float addrspace(1)* %2, i64 %828
  %830 = load float, float addrspace(1)* %829, align 4, !tbaa !16
  %831 = fadd contract float %824, %830
  %832 = or i32 %782, 7
  %833 = mul nsw i32 %832, %4
  %834 = add nsw i32 %775, %833
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds float, float addrspace(1)* %2, i64 %835
  %837 = load float, float addrspace(1)* %836, align 4, !tbaa !16
  %838 = fadd contract float %831, %837
  %839 = add nuw nsw i32 %782, 8
  %840 = add i32 %783, 8
  %841 = icmp eq i32 %840, %779
  br i1 %841, label %842, label %780, !llvm.loop !22

842:                                              ; preds = %780, %772
  %843 = phi float [ undef, %772 ], [ %838, %780 ]
  %844 = phi float [ 0.000000e+00, %772 ], [ %838, %780 ]
  %845 = phi i32 [ 0, %772 ], [ %839, %780 ]
  %846 = icmp eq i32 %776, 0
  br i1 %846, label %860, label %847

847:                                              ; preds = %842, %847
  %848 = phi float [ %856, %847 ], [ %844, %842 ]
  %849 = phi i32 [ %857, %847 ], [ %845, %842 ]
  %850 = phi i32 [ %858, %847 ], [ 0, %842 ]
  %851 = mul nsw i32 %849, %4
  %852 = add nsw i32 %775, %851
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds float, float addrspace(1)* %2, i64 %853
  %855 = load float, float addrspace(1)* %854, align 4, !tbaa !16
  %856 = fadd contract float %848, %855
  %857 = add nuw nsw i32 %849, 1
  %858 = add i32 %850, 1
  %859 = icmp eq i32 %858, %776
  br i1 %859, label %860, label %847, !llvm.loop !29

860:                                              ; preds = %847, %842
  %861 = phi float [ %843, %842 ], [ %856, %847 ]
  %862 = fpext float %861 to double
  %863 = fadd contract double %862, 1.000000e-05
  br label %864

864:                                              ; preds = %663, %860, %771
  %865 = phi double [ 1.000000e-05, %771 ], [ %863, %860 ], [ 1.000000e-05, %663 ]
  %866 = add nsw i32 %13, 24
  %867 = mul nsw i32 %866, %27
  %868 = add nsw i32 %867, %9
  br i1 %28, label %869, label %909

869:                                              ; preds = %864
  %870 = and i32 %3, 1
  %871 = icmp eq i32 %3, 1
  br i1 %871, label %897, label %872

872:                                              ; preds = %869
  %873 = and i32 %3, -2
  br label %874

874:                                              ; preds = %874, %872
  %875 = phi i32 [ 0, %872 ], [ %894, %874 ]
  %876 = phi i32 [ 0, %872 ], [ %895, %874 ]
  %877 = mul nsw i32 %875, %4
  %878 = add nsw i32 %868, %877
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds float, float addrspace(1)* %2, i64 %879
  %881 = load float, float addrspace(1)* %880, align 4, !tbaa !16
  %882 = fpext float %881 to double
  %883 = fdiv contract double %882, %865
  %884 = fptrunc double %883 to float
  store float %884, float addrspace(1)* %880, align 4, !tbaa !16
  %885 = or i32 %875, 1
  %886 = mul nsw i32 %885, %4
  %887 = add nsw i32 %868, %886
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds float, float addrspace(1)* %2, i64 %888
  %890 = load float, float addrspace(1)* %889, align 4, !tbaa !16
  %891 = fpext float %890 to double
  %892 = fdiv contract double %891, %865
  %893 = fptrunc double %892 to float
  store float %893, float addrspace(1)* %889, align 4, !tbaa !16
  %894 = add nuw nsw i32 %875, 2
  %895 = add i32 %876, 2
  %896 = icmp eq i32 %895, %873
  br i1 %896, label %897, label %874, !llvm.loop !24

897:                                              ; preds = %874, %869
  %898 = phi i32 [ 0, %869 ], [ %894, %874 ]
  %899 = icmp eq i32 %870, 0
  br i1 %899, label %909, label %900

900:                                              ; preds = %897
  %901 = mul nsw i32 %898, %4
  %902 = add nsw i32 %868, %901
  %903 = sext i32 %902 to i64
  %904 = getelementptr inbounds float, float addrspace(1)* %2, i64 %903
  %905 = load float, float addrspace(1)* %904, align 4, !tbaa !16
  %906 = fpext float %905 to double
  %907 = fdiv contract double %906, %865
  %908 = fptrunc double %907 to float
  store float %908, float addrspace(1)* %904, align 4, !tbaa !16
  br label %909

909:                                              ; preds = %900, %897, %864
  %910 = mul nsw i32 %868, 3
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %911
  store i8 0, i8 addrspace(1)* %912, align 1, !tbaa !25
  %913 = add nsw i32 %910, 1
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %914
  store i8 0, i8 addrspace(1)* %915, align 1, !tbaa !25
  %916 = add nsw i32 %910, 2
  %917 = sext i32 %916 to i64
  %918 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %917
  store i8 0, i8 addrspace(1)* %918, align 1, !tbaa !25
  br i1 %28, label %919, label %1016

919:                                              ; preds = %909
  %920 = and i32 %3, 1
  %921 = icmp eq i32 %3, 1
  br i1 %921, label %984, label %922

922:                                              ; preds = %919
  %923 = and i32 %3, -2
  br label %924

924:                                              ; preds = %924, %922
  %925 = phi i8 [ 0, %922 ], [ %980, %924 ]
  %926 = phi i8 [ 0, %922 ], [ %972, %924 ]
  %927 = phi i8 [ 0, %922 ], [ %964, %924 ]
  %928 = phi i32 [ 0, %922 ], [ %981, %924 ]
  %929 = phi i32 [ 0, %922 ], [ %982, %924 ]
  %930 = mul i32 %29, %928
  %931 = add nsw i32 %930, %910
  %932 = sext i32 %931 to i64
  %933 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %932
  %934 = load i8, i8 addrspace(1)* %933, align 1, !tbaa !25
  %935 = uitofp i8 %934 to float
  %936 = fmul contract float %935, 2.500000e-01
  %937 = fptoui float %936 to i8
  %938 = add i8 %927, %937
  store i8 %938, i8 addrspace(1)* %912, align 1, !tbaa !25
  %939 = add nsw i32 %931, 1
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %940
  %942 = load i8, i8 addrspace(1)* %941, align 1, !tbaa !25
  %943 = uitofp i8 %942 to float
  %944 = fmul contract float %943, 2.500000e-01
  %945 = fptoui float %944 to i8
  %946 = add i8 %926, %945
  store i8 %946, i8 addrspace(1)* %915, align 1, !tbaa !25
  %947 = add nsw i32 %931, 2
  %948 = sext i32 %947 to i64
  %949 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %948
  %950 = load i8, i8 addrspace(1)* %949, align 1, !tbaa !25
  %951 = uitofp i8 %950 to float
  %952 = fmul contract float %951, 2.500000e-01
  %953 = fptoui float %952 to i8
  %954 = add i8 %925, %953
  store i8 %954, i8 addrspace(1)* %918, align 1, !tbaa !25
  %955 = or i32 %928, 1
  %956 = mul i32 %29, %955
  %957 = add nsw i32 %956, %910
  %958 = sext i32 %957 to i64
  %959 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %958
  %960 = load i8, i8 addrspace(1)* %959, align 1, !tbaa !25
  %961 = uitofp i8 %960 to float
  %962 = fmul contract float %961, 2.500000e-01
  %963 = fptoui float %962 to i8
  %964 = add i8 %938, %963
  store i8 %964, i8 addrspace(1)* %912, align 1, !tbaa !25
  %965 = add nsw i32 %957, 1
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %966
  %968 = load i8, i8 addrspace(1)* %967, align 1, !tbaa !25
  %969 = uitofp i8 %968 to float
  %970 = fmul contract float %969, 2.500000e-01
  %971 = fptoui float %970 to i8
  %972 = add i8 %946, %971
  store i8 %972, i8 addrspace(1)* %915, align 1, !tbaa !25
  %973 = add nsw i32 %957, 2
  %974 = sext i32 %973 to i64
  %975 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %974
  %976 = load i8, i8 addrspace(1)* %975, align 1, !tbaa !25
  %977 = uitofp i8 %976 to float
  %978 = fmul contract float %977, 2.500000e-01
  %979 = fptoui float %978 to i8
  %980 = add i8 %954, %979
  store i8 %980, i8 addrspace(1)* %918, align 1, !tbaa !25
  %981 = add nuw nsw i32 %928, 2
  %982 = add i32 %929, 2
  %983 = icmp eq i32 %982, %923
  br i1 %983, label %984, label %924, !llvm.loop !26

984:                                              ; preds = %924, %919
  %985 = phi i8 [ 0, %919 ], [ %980, %924 ]
  %986 = phi i8 [ 0, %919 ], [ %972, %924 ]
  %987 = phi i8 [ 0, %919 ], [ %964, %924 ]
  %988 = phi i32 [ 0, %919 ], [ %981, %924 ]
  %989 = icmp eq i32 %920, 0
  br i1 %989, label %1016, label %990

990:                                              ; preds = %984
  %991 = mul i32 %29, %988
  %992 = add nsw i32 %991, %910
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %993
  %995 = load i8, i8 addrspace(1)* %994, align 1, !tbaa !25
  %996 = uitofp i8 %995 to float
  %997 = fmul contract float %996, 2.500000e-01
  %998 = fptoui float %997 to i8
  %999 = add i8 %987, %998
  store i8 %999, i8 addrspace(1)* %912, align 1, !tbaa !25
  %1000 = add nsw i32 %992, 1
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %1001
  %1003 = load i8, i8 addrspace(1)* %1002, align 1, !tbaa !25
  %1004 = uitofp i8 %1003 to float
  %1005 = fmul contract float %1004, 2.500000e-01
  %1006 = fptoui float %1005 to i8
  %1007 = add i8 %986, %1006
  store i8 %1007, i8 addrspace(1)* %915, align 1, !tbaa !25
  %1008 = add nsw i32 %992, 2
  %1009 = sext i32 %1008 to i64
  %1010 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %1009
  %1011 = load i8, i8 addrspace(1)* %1010, align 1, !tbaa !25
  %1012 = uitofp i8 %1011 to float
  %1013 = fmul contract float %1012, 2.500000e-01
  %1014 = fptoui float %1013 to i8
  %1015 = add i8 %985, %1014
  store i8 %1015, i8 addrspace(1)* %918, align 1, !tbaa !25
  br label %1016

1016:                                             ; preds = %990, %984, %909
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = !{!18, !18, i64 0}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
!29 = distinct !{!29, !21}
