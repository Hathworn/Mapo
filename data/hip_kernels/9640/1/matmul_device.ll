; ModuleID = '../data/hip_kernels/9640/1/main.cu'
source_filename = "../data/hip_kernels/9640/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6matmulPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add i32 %15, %16
  %18 = icmp sgt i32 %4, 0
  br i1 %18, label %19, label %34

19:                                               ; preds = %9
  %20 = add nuw nsw i32 %4, 15
  %21 = lshr i32 %20, 4
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %17, %6
  %24 = mul nsw i32 %13, %4
  br label %25

25:                                               ; preds = %19, %351
  %26 = phi i32 [ 0, %19 ], [ %353, %351 ]
  %27 = phi float [ 0.000000e+00, %19 ], [ %352, %351 ]
  %28 = shl nsw i32 %26, 4
  %29 = icmp slt i32 %28, %4
  %30 = select i1 %29, i1 %22, i1 false
  %31 = icmp slt i32 %28, %5
  %32 = select i1 %30, i1 %31, i1 false
  %33 = select i1 %32, i1 %23, i1 false
  br i1 %33, label %39, label %51

34:                                               ; preds = %351, %9
  %35 = phi float [ 0.000000e+00, %9 ], [ %352, %351 ]
  %36 = icmp slt i32 %13, %7
  %37 = icmp slt i32 %17, %8
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %355, label %373

39:                                               ; preds = %25
  %40 = add i32 %28, %24
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = mul nsw i32 %28, %6
  %45 = add nsw i32 %44, %17
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fmul contract float %43, %48
  %50 = fadd contract float %27, %49
  br label %51

51:                                               ; preds = %25, %39
  %52 = phi float [ %50, %39 ], [ %27, %25 ]
  %53 = add nuw nsw i32 %28, 1
  %54 = icmp slt i32 %53, %4
  %55 = select i1 %54, i1 %22, i1 false
  %56 = icmp slt i32 %53, %5
  %57 = select i1 %55, i1 %56, i1 false
  %58 = select i1 %57, i1 %23, i1 false
  br i1 %58, label %59, label %71

59:                                               ; preds = %51
  %60 = add i32 %53, %24
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = mul nsw i32 %53, %6
  %65 = add nsw i32 %64, %17
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = fmul contract float %63, %68
  %70 = fadd contract float %52, %69
  br label %71

71:                                               ; preds = %59, %51
  %72 = phi float [ %70, %59 ], [ %52, %51 ]
  %73 = add nuw nsw i32 %28, 2
  %74 = icmp slt i32 %73, %4
  %75 = select i1 %74, i1 %22, i1 false
  %76 = icmp slt i32 %73, %5
  %77 = select i1 %75, i1 %76, i1 false
  %78 = select i1 %77, i1 %23, i1 false
  br i1 %78, label %79, label %91

79:                                               ; preds = %71
  %80 = add i32 %73, %24
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = mul nsw i32 %73, %6
  %85 = add nsw i32 %84, %17
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %72, %89
  br label %91

91:                                               ; preds = %79, %71
  %92 = phi float [ %90, %79 ], [ %72, %71 ]
  %93 = add nuw nsw i32 %28, 3
  %94 = icmp slt i32 %93, %4
  %95 = select i1 %94, i1 %22, i1 false
  %96 = icmp slt i32 %93, %5
  %97 = select i1 %95, i1 %96, i1 false
  %98 = select i1 %97, i1 %23, i1 false
  br i1 %98, label %99, label %111

99:                                               ; preds = %91
  %100 = add i32 %93, %24
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = mul nsw i32 %93, %6
  %105 = add nsw i32 %104, %17
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract float %103, %108
  %110 = fadd contract float %92, %109
  br label %111

111:                                              ; preds = %99, %91
  %112 = phi float [ %110, %99 ], [ %92, %91 ]
  %113 = add nuw nsw i32 %28, 4
  %114 = icmp slt i32 %113, %4
  %115 = select i1 %114, i1 %22, i1 false
  %116 = icmp slt i32 %113, %5
  %117 = select i1 %115, i1 %116, i1 false
  %118 = select i1 %117, i1 %23, i1 false
  br i1 %118, label %119, label %131

119:                                              ; preds = %111
  %120 = add i32 %113, %24
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = mul nsw i32 %113, %6
  %125 = add nsw i32 %124, %17
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  %129 = fmul contract float %123, %128
  %130 = fadd contract float %112, %129
  br label %131

131:                                              ; preds = %119, %111
  %132 = phi float [ %130, %119 ], [ %112, %111 ]
  %133 = add nuw nsw i32 %28, 5
  %134 = icmp slt i32 %133, %4
  %135 = select i1 %134, i1 %22, i1 false
  %136 = icmp slt i32 %133, %5
  %137 = select i1 %135, i1 %136, i1 false
  %138 = select i1 %137, i1 %23, i1 false
  br i1 %138, label %139, label %151

139:                                              ; preds = %131
  %140 = add i32 %133, %24
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = mul nsw i32 %133, %6
  %145 = add nsw i32 %144, %17
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %132, %149
  br label %151

151:                                              ; preds = %139, %131
  %152 = phi float [ %150, %139 ], [ %132, %131 ]
  %153 = add nuw nsw i32 %28, 6
  %154 = icmp slt i32 %153, %4
  %155 = select i1 %154, i1 %22, i1 false
  %156 = icmp slt i32 %153, %5
  %157 = select i1 %155, i1 %156, i1 false
  %158 = select i1 %157, i1 %23, i1 false
  br i1 %158, label %159, label %171

159:                                              ; preds = %151
  %160 = add i32 %153, %24
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5, !amdgpu.noclobber !9
  %164 = mul nsw i32 %153, %6
  %165 = add nsw i32 %164, %17
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !5, !amdgpu.noclobber !9
  %169 = fmul contract float %163, %168
  %170 = fadd contract float %152, %169
  br label %171

171:                                              ; preds = %159, %151
  %172 = phi float [ %170, %159 ], [ %152, %151 ]
  %173 = add nuw nsw i32 %28, 7
  %174 = icmp slt i32 %173, %4
  %175 = select i1 %174, i1 %22, i1 false
  %176 = icmp slt i32 %173, %5
  %177 = select i1 %175, i1 %176, i1 false
  %178 = select i1 %177, i1 %23, i1 false
  br i1 %178, label %179, label %191

179:                                              ; preds = %171
  %180 = add i32 %173, %24
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !5, !amdgpu.noclobber !9
  %184 = mul nsw i32 %173, %6
  %185 = add nsw i32 %184, %17
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !5, !amdgpu.noclobber !9
  %189 = fmul contract float %183, %188
  %190 = fadd contract float %172, %189
  br label %191

191:                                              ; preds = %179, %171
  %192 = phi float [ %190, %179 ], [ %172, %171 ]
  %193 = add nuw nsw i32 %28, 8
  %194 = icmp slt i32 %193, %4
  %195 = select i1 %194, i1 %22, i1 false
  %196 = icmp slt i32 %193, %5
  %197 = select i1 %195, i1 %196, i1 false
  %198 = select i1 %197, i1 %23, i1 false
  br i1 %198, label %199, label %211

199:                                              ; preds = %191
  %200 = add i32 %193, %24
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !5, !amdgpu.noclobber !9
  %204 = mul nsw i32 %193, %6
  %205 = add nsw i32 %204, %17
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !5, !amdgpu.noclobber !9
  %209 = fmul contract float %203, %208
  %210 = fadd contract float %192, %209
  br label %211

211:                                              ; preds = %199, %191
  %212 = phi float [ %210, %199 ], [ %192, %191 ]
  %213 = add nuw nsw i32 %28, 9
  %214 = icmp slt i32 %213, %4
  %215 = select i1 %214, i1 %22, i1 false
  %216 = icmp slt i32 %213, %5
  %217 = select i1 %215, i1 %216, i1 false
  %218 = select i1 %217, i1 %23, i1 false
  br i1 %218, label %219, label %231

219:                                              ; preds = %211
  %220 = add i32 %213, %24
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !5, !amdgpu.noclobber !9
  %224 = mul nsw i32 %213, %6
  %225 = add nsw i32 %224, %17
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %1, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !5, !amdgpu.noclobber !9
  %229 = fmul contract float %223, %228
  %230 = fadd contract float %212, %229
  br label %231

231:                                              ; preds = %219, %211
  %232 = phi float [ %230, %219 ], [ %212, %211 ]
  %233 = add nuw nsw i32 %28, 10
  %234 = icmp slt i32 %233, %4
  %235 = select i1 %234, i1 %22, i1 false
  %236 = icmp slt i32 %233, %5
  %237 = select i1 %235, i1 %236, i1 false
  %238 = select i1 %237, i1 %23, i1 false
  br i1 %238, label %239, label %251

239:                                              ; preds = %231
  %240 = add i32 %233, %24
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !5, !amdgpu.noclobber !9
  %244 = mul nsw i32 %233, %6
  %245 = add nsw i32 %244, %17
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !5, !amdgpu.noclobber !9
  %249 = fmul contract float %243, %248
  %250 = fadd contract float %232, %249
  br label %251

251:                                              ; preds = %239, %231
  %252 = phi float [ %250, %239 ], [ %232, %231 ]
  %253 = add nuw nsw i32 %28, 11
  %254 = icmp slt i32 %253, %4
  %255 = select i1 %254, i1 %22, i1 false
  %256 = icmp slt i32 %253, %5
  %257 = select i1 %255, i1 %256, i1 false
  %258 = select i1 %257, i1 %23, i1 false
  br i1 %258, label %259, label %271

259:                                              ; preds = %251
  %260 = add i32 %253, %24
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %0, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !5, !amdgpu.noclobber !9
  %264 = mul nsw i32 %253, %6
  %265 = add nsw i32 %264, %17
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %1, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !5, !amdgpu.noclobber !9
  %269 = fmul contract float %263, %268
  %270 = fadd contract float %252, %269
  br label %271

271:                                              ; preds = %259, %251
  %272 = phi float [ %270, %259 ], [ %252, %251 ]
  %273 = add nuw nsw i32 %28, 12
  %274 = icmp slt i32 %273, %4
  %275 = select i1 %274, i1 %22, i1 false
  %276 = icmp slt i32 %273, %5
  %277 = select i1 %275, i1 %276, i1 false
  %278 = select i1 %277, i1 %23, i1 false
  br i1 %278, label %279, label %291

279:                                              ; preds = %271
  %280 = add i32 %273, %24
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %0, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !5, !amdgpu.noclobber !9
  %284 = mul nsw i32 %273, %6
  %285 = add nsw i32 %284, %17
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %1, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !5, !amdgpu.noclobber !9
  %289 = fmul contract float %283, %288
  %290 = fadd contract float %272, %289
  br label %291

291:                                              ; preds = %279, %271
  %292 = phi float [ %290, %279 ], [ %272, %271 ]
  %293 = add nuw nsw i32 %28, 13
  %294 = icmp slt i32 %293, %4
  %295 = select i1 %294, i1 %22, i1 false
  %296 = icmp slt i32 %293, %5
  %297 = select i1 %295, i1 %296, i1 false
  %298 = select i1 %297, i1 %23, i1 false
  br i1 %298, label %299, label %311

299:                                              ; preds = %291
  %300 = add i32 %293, %24
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !5, !amdgpu.noclobber !9
  %304 = mul nsw i32 %293, %6
  %305 = add nsw i32 %304, %17
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %1, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !5, !amdgpu.noclobber !9
  %309 = fmul contract float %303, %308
  %310 = fadd contract float %292, %309
  br label %311

311:                                              ; preds = %299, %291
  %312 = phi float [ %310, %299 ], [ %292, %291 ]
  %313 = add nuw nsw i32 %28, 14
  %314 = icmp slt i32 %313, %4
  %315 = select i1 %314, i1 %22, i1 false
  %316 = icmp slt i32 %313, %5
  %317 = select i1 %315, i1 %316, i1 false
  %318 = select i1 %317, i1 %23, i1 false
  br i1 %318, label %319, label %331

319:                                              ; preds = %311
  %320 = add i32 %313, %24
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %0, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !5, !amdgpu.noclobber !9
  %324 = mul nsw i32 %313, %6
  %325 = add nsw i32 %324, %17
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !5, !amdgpu.noclobber !9
  %329 = fmul contract float %323, %328
  %330 = fadd contract float %312, %329
  br label %331

331:                                              ; preds = %319, %311
  %332 = phi float [ %330, %319 ], [ %312, %311 ]
  %333 = add nuw nsw i32 %28, 15
  %334 = icmp slt i32 %333, %4
  %335 = select i1 %334, i1 %22, i1 false
  %336 = icmp slt i32 %333, %5
  %337 = select i1 %335, i1 %336, i1 false
  %338 = select i1 %337, i1 %23, i1 false
  br i1 %338, label %339, label %351

339:                                              ; preds = %331
  %340 = add i32 %333, %24
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %0, i64 %341
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !5, !amdgpu.noclobber !9
  %344 = mul nsw i32 %333, %6
  %345 = add nsw i32 %344, %17
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds float, float addrspace(1)* %1, i64 %346
  %348 = load float, float addrspace(1)* %347, align 4, !tbaa !5, !amdgpu.noclobber !9
  %349 = fmul contract float %343, %348
  %350 = fadd contract float %332, %349
  br label %351

351:                                              ; preds = %339, %331
  %352 = phi float [ %350, %339 ], [ %332, %331 ]
  %353 = add nuw nsw i32 %26, 1
  %354 = icmp eq i32 %353, %21
  br i1 %354, label %34, label %25, !llvm.loop !10

355:                                              ; preds = %34
  %356 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %357 = getelementptr i8, i8 addrspace(4)* %356, i64 6
  %358 = bitcast i8 addrspace(4)* %357 to i16 addrspace(4)*
  %359 = load i16, i16 addrspace(4)* %358, align 2, !range !12, !invariant.load !9
  %360 = zext i16 %359 to i32
  %361 = mul i32 %10, %360
  %362 = add i32 %361, %12
  %363 = mul i32 %362, %8
  %364 = getelementptr i8, i8 addrspace(4)* %356, i64 4
  %365 = bitcast i8 addrspace(4)* %364 to i16 addrspace(4)*
  %366 = load i16, i16 addrspace(4)* %365, align 4, !range !12, !invariant.load !9
  %367 = zext i16 %366 to i32
  %368 = mul i32 %14, %367
  %369 = add i32 %368, %16
  %370 = add i32 %369, %363
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %2, i64 %371
  store float %35, float addrspace(1)* %372, align 4, !tbaa !5
  br label %373

373:                                              ; preds = %355, %34
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{i16 1, i16 1025}
