; ModuleID = '../data/hip_kernels/7355/4/main.cu'
source_filename = "../data/hip_kernels/7355/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4blurPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %476

25:                                               ; preds = %4
  %26 = add nsw i32 %13, -1
  %27 = add nsw i32 %21, -1
  %28 = mul nsw i32 %13, %3
  %29 = add nsw i32 %28, %21
  %30 = mul nsw i32 %29, 3
  %31 = icmp sgt i32 %13, 0
  %32 = mul nsw i32 %26, %3
  br i1 %31, label %432, label %443

33:                                               ; preds = %425
  %34 = icmp sgt i32 %21, 0
  %35 = icmp sle i32 %21, %3
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %45

37:                                               ; preds = %33
  %38 = add nsw i32 %27, %32
  %39 = mul nsw i32 %38, 3
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fadd contract float %43, 0.000000e+00
  br label %45

45:                                               ; preds = %425, %33, %37
  %46 = phi float [ %44, %37 ], [ 0.000000e+00, %33 ], [ 0.000000e+00, %425 ]
  %47 = phi i32 [ 1, %37 ], [ 0, %33 ], [ 0, %425 ]
  %48 = icmp sgt i32 %21, -1
  %49 = select i1 %31, i1 %48, i1 false
  br i1 %49, label %50, label %59

50:                                               ; preds = %45
  %51 = add nuw nsw i32 %47, 1
  %52 = add nsw i32 %21, %32
  %53 = mul nsw i32 %52, 3
  %54 = add nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fadd contract float %46, %57
  br label %59

59:                                               ; preds = %50, %45
  %60 = phi float [ %58, %50 ], [ %46, %45 ]
  %61 = phi i32 [ %51, %50 ], [ %47, %45 ]
  %62 = add nsw i32 %21, 1
  br i1 %31, label %63, label %76

63:                                               ; preds = %59
  %64 = icmp sgt i32 %21, -2
  %65 = icmp slt i32 %62, %3
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %76

67:                                               ; preds = %63
  %68 = add nuw nsw i32 %61, 1
  %69 = add nsw i32 %62, %32
  %70 = mul nsw i32 %69, 3
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fadd contract float %60, %74
  br label %76

76:                                               ; preds = %67, %63, %59
  %77 = phi float [ %75, %67 ], [ %60, %63 ], [ %60, %59 ]
  %78 = phi i32 [ %68, %67 ], [ %61, %63 ], [ %61, %59 ]
  %79 = icmp sgt i32 %13, -1
  br i1 %79, label %80, label %93

80:                                               ; preds = %76
  %81 = icmp sgt i32 %21, 0
  %82 = icmp sle i32 %21, %3
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %93

84:                                               ; preds = %80
  %85 = add nuw nsw i32 %78, 1
  %86 = add nsw i32 %27, %28
  %87 = mul nsw i32 %86, 3
  %88 = add nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fadd contract float %77, %91
  br label %93

93:                                               ; preds = %76, %80, %84
  %94 = phi float [ %92, %84 ], [ %77, %80 ], [ %77, %76 ]
  %95 = phi i32 [ %85, %84 ], [ %78, %80 ], [ %78, %76 ]
  %96 = icmp sgt i32 %21, -1
  %97 = select i1 %79, i1 %96, i1 false
  br i1 %97, label %98, label %105

98:                                               ; preds = %93
  %99 = add nuw nsw i32 %95, 1
  %100 = add nsw i32 %30, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = fadd contract float %94, %103
  br label %105

105:                                              ; preds = %98, %93
  %106 = phi float [ %104, %98 ], [ %94, %93 ]
  %107 = phi i32 [ %99, %98 ], [ %95, %93 ]
  %108 = add nsw i32 %21, 1
  br i1 %79, label %109, label %122

109:                                              ; preds = %105
  %110 = icmp sgt i32 %21, -2
  %111 = icmp slt i32 %108, %3
  %112 = select i1 %110, i1 %111, i1 false
  br i1 %112, label %113, label %122

113:                                              ; preds = %109
  %114 = add nuw nsw i32 %107, 1
  %115 = add nsw i32 %108, %28
  %116 = mul nsw i32 %115, 3
  %117 = add nsw i32 %116, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fadd contract float %106, %120
  br label %122

122:                                              ; preds = %105, %109, %113
  %123 = phi float [ %121, %113 ], [ %106, %109 ], [ %106, %105 ]
  %124 = phi i32 [ %114, %113 ], [ %107, %109 ], [ %107, %105 ]
  %125 = add nsw i32 %13, 1
  %126 = icmp sgt i32 %13, -2
  %127 = icmp slt i32 %125, %2
  %128 = mul nsw i32 %125, %3
  br i1 %126, label %129, label %143

129:                                              ; preds = %122
  %130 = icmp sgt i32 %21, 0
  %131 = select i1 %127, i1 %130, i1 false
  %132 = icmp sle i32 %21, %3
  %133 = select i1 %131, i1 %132, i1 false
  br i1 %133, label %134, label %143

134:                                              ; preds = %129
  %135 = add nuw nsw i32 %124, 1
  %136 = add nsw i32 %27, %128
  %137 = mul nsw i32 %136, 3
  %138 = add nsw i32 %137, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fadd contract float %123, %141
  br label %143

143:                                              ; preds = %122, %129, %134
  %144 = phi i1 [ false, %122 ], [ %127, %129 ], [ %127, %134 ]
  %145 = phi float [ %123, %122 ], [ %123, %129 ], [ %142, %134 ]
  %146 = phi i32 [ %124, %122 ], [ %124, %129 ], [ %135, %134 ]
  %147 = icmp sgt i32 %21, -1
  %148 = select i1 %144, i1 %147, i1 false
  br i1 %148, label %149, label %158

149:                                              ; preds = %143
  %150 = add nuw nsw i32 %146, 1
  %151 = add nsw i32 %21, %128
  %152 = mul nsw i32 %151, 3
  %153 = add nsw i32 %152, 1
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fadd contract float %145, %156
  br label %158

158:                                              ; preds = %149, %143
  %159 = phi float [ %157, %149 ], [ %145, %143 ]
  %160 = phi i32 [ %150, %149 ], [ %146, %143 ]
  %161 = add nsw i32 %21, 1
  br i1 %126, label %162, label %176

162:                                              ; preds = %158
  %163 = icmp sgt i32 %21, -2
  %164 = select i1 %127, i1 %163, i1 false
  %165 = icmp slt i32 %161, %3
  %166 = select i1 %164, i1 %165, i1 false
  br i1 %166, label %167, label %176

167:                                              ; preds = %162
  %168 = add nuw nsw i32 %160, 1
  %169 = add nsw i32 %161, %128
  %170 = mul nsw i32 %169, 3
  %171 = add nsw i32 %170, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fadd contract float %159, %174
  br label %176

176:                                              ; preds = %167, %162, %158
  %177 = phi float [ %175, %167 ], [ %159, %162 ], [ %159, %158 ]
  %178 = phi i32 [ %168, %167 ], [ %160, %162 ], [ %160, %158 ]
  %179 = sitofp i32 %178 to float
  %180 = fdiv contract float %177, %179
  %181 = add nsw i32 %30, 1
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %180, float addrspace(1)* %183, align 4, !tbaa !7
  br i1 %31, label %184, label %196

184:                                              ; preds = %176
  %185 = icmp sgt i32 %21, 0
  %186 = icmp sle i32 %21, %3
  %187 = select i1 %185, i1 %186, i1 false
  br i1 %187, label %188, label %196

188:                                              ; preds = %184
  %189 = add nsw i32 %27, %32
  %190 = mul nsw i32 %189, 3
  %191 = add nsw i32 %190, 2
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fadd contract float %194, 0.000000e+00
  br label %196

196:                                              ; preds = %176, %184, %188
  %197 = phi float [ %195, %188 ], [ 0.000000e+00, %184 ], [ 0.000000e+00, %176 ]
  %198 = phi i32 [ 1, %188 ], [ 0, %184 ], [ 0, %176 ]
  %199 = icmp sgt i32 %21, -1
  %200 = select i1 %31, i1 %199, i1 false
  br i1 %200, label %201, label %210

201:                                              ; preds = %196
  %202 = add nuw nsw i32 %198, 1
  %203 = add nsw i32 %21, %32
  %204 = mul nsw i32 %203, 3
  %205 = add nsw i32 %204, 2
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %0, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  %209 = fadd contract float %197, %208
  br label %210

210:                                              ; preds = %201, %196
  %211 = phi float [ %209, %201 ], [ %197, %196 ]
  %212 = phi i32 [ %202, %201 ], [ %198, %196 ]
  %213 = add nsw i32 %21, 1
  br i1 %31, label %214, label %227

214:                                              ; preds = %210
  %215 = icmp sgt i32 %21, -2
  %216 = icmp slt i32 %213, %3
  %217 = select i1 %215, i1 %216, i1 false
  br i1 %217, label %218, label %227

218:                                              ; preds = %214
  %219 = add nuw nsw i32 %212, 1
  %220 = add nsw i32 %213, %32
  %221 = mul nsw i32 %220, 3
  %222 = add nsw i32 %221, 2
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = fadd contract float %211, %225
  br label %227

227:                                              ; preds = %218, %214, %210
  %228 = phi float [ %226, %218 ], [ %211, %214 ], [ %211, %210 ]
  %229 = phi i32 [ %219, %218 ], [ %212, %214 ], [ %212, %210 ]
  %230 = icmp sgt i32 %13, -1
  br i1 %230, label %231, label %244

231:                                              ; preds = %227
  %232 = icmp sgt i32 %21, 0
  %233 = icmp sle i32 %21, %3
  %234 = select i1 %232, i1 %233, i1 false
  br i1 %234, label %235, label %244

235:                                              ; preds = %231
  %236 = add nuw nsw i32 %229, 1
  %237 = add nsw i32 %27, %28
  %238 = mul nsw i32 %237, 3
  %239 = add nsw i32 %238, 2
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %0, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = fadd contract float %228, %242
  br label %244

244:                                              ; preds = %227, %231, %235
  %245 = phi float [ %243, %235 ], [ %228, %231 ], [ %228, %227 ]
  %246 = phi i32 [ %236, %235 ], [ %229, %231 ], [ %229, %227 ]
  %247 = icmp sgt i32 %21, -1
  %248 = select i1 %230, i1 %247, i1 false
  br i1 %248, label %249, label %256

249:                                              ; preds = %244
  %250 = add nuw nsw i32 %246, 1
  %251 = add nsw i32 %30, 2
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = fadd contract float %245, %254
  br label %256

256:                                              ; preds = %249, %244
  %257 = phi float [ %255, %249 ], [ %245, %244 ]
  %258 = phi i32 [ %250, %249 ], [ %246, %244 ]
  %259 = add nsw i32 %21, 1
  br i1 %230, label %260, label %273

260:                                              ; preds = %256
  %261 = icmp sgt i32 %21, -2
  %262 = icmp slt i32 %259, %3
  %263 = select i1 %261, i1 %262, i1 false
  br i1 %263, label %264, label %273

264:                                              ; preds = %260
  %265 = add nuw nsw i32 %258, 1
  %266 = add nsw i32 %259, %28
  %267 = mul nsw i32 %266, 3
  %268 = add nsw i32 %267, 2
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %0, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %272 = fadd contract float %257, %271
  br label %273

273:                                              ; preds = %256, %260, %264
  %274 = phi float [ %272, %264 ], [ %257, %260 ], [ %257, %256 ]
  %275 = phi i32 [ %265, %264 ], [ %258, %260 ], [ %258, %256 ]
  %276 = add nsw i32 %13, 1
  %277 = icmp sgt i32 %13, -2
  %278 = icmp slt i32 %276, %2
  %279 = mul nsw i32 %276, %3
  br i1 %277, label %280, label %294

280:                                              ; preds = %273
  %281 = icmp sgt i32 %21, 0
  %282 = select i1 %278, i1 %281, i1 false
  %283 = icmp sle i32 %21, %3
  %284 = select i1 %282, i1 %283, i1 false
  br i1 %284, label %285, label %294

285:                                              ; preds = %280
  %286 = add nuw nsw i32 %275, 1
  %287 = add nsw i32 %27, %279
  %288 = mul nsw i32 %287, 3
  %289 = add nsw i32 %288, 2
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %0, i64 %290
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !7
  %293 = fadd contract float %274, %292
  br label %294

294:                                              ; preds = %273, %280, %285
  %295 = phi i1 [ false, %273 ], [ %278, %280 ], [ %278, %285 ]
  %296 = phi float [ %274, %273 ], [ %274, %280 ], [ %293, %285 ]
  %297 = phi i32 [ %275, %273 ], [ %275, %280 ], [ %286, %285 ]
  %298 = icmp sgt i32 %21, -1
  %299 = select i1 %295, i1 %298, i1 false
  br i1 %299, label %300, label %309

300:                                              ; preds = %294
  %301 = add nuw nsw i32 %297, 1
  %302 = add nsw i32 %21, %279
  %303 = mul nsw i32 %302, 3
  %304 = add nsw i32 %303, 2
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %0, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !7
  %308 = fadd contract float %296, %307
  br label %309

309:                                              ; preds = %300, %294
  %310 = phi float [ %308, %300 ], [ %296, %294 ]
  %311 = phi i32 [ %301, %300 ], [ %297, %294 ]
  %312 = add nsw i32 %21, 1
  br i1 %277, label %313, label %327

313:                                              ; preds = %309
  %314 = icmp sgt i32 %21, -2
  %315 = select i1 %278, i1 %314, i1 false
  %316 = icmp slt i32 %312, %3
  %317 = select i1 %315, i1 %316, i1 false
  br i1 %317, label %318, label %327

318:                                              ; preds = %313
  %319 = add nuw nsw i32 %311, 1
  %320 = add nsw i32 %312, %279
  %321 = mul nsw i32 %320, 3
  %322 = add nsw i32 %321, 2
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !7
  %326 = fadd contract float %310, %325
  br label %327

327:                                              ; preds = %318, %313, %309
  %328 = phi float [ %326, %318 ], [ %310, %313 ], [ %310, %309 ]
  %329 = phi i32 [ %319, %318 ], [ %311, %313 ], [ %311, %309 ]
  %330 = sitofp i32 %329 to float
  %331 = fdiv contract float %328, %330
  %332 = add nsw i32 %30, 2
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %1, i64 %333
  store float %331, float addrspace(1)* %334, align 4, !tbaa !7
  br label %476

335:                                              ; preds = %472
  %336 = icmp sgt i32 %21, 0
  %337 = icmp sle i32 %21, %3
  %338 = select i1 %336, i1 %337, i1 false
  br i1 %338, label %339, label %347

339:                                              ; preds = %335
  %340 = add nuw nsw i32 %474, 1
  %341 = add nsw i32 %27, %28
  %342 = mul nsw i32 %341, 3
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %0, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = fadd contract float %473, %345
  br label %347

347:                                              ; preds = %472, %335, %339
  %348 = phi float [ %346, %339 ], [ %473, %335 ], [ %473, %472 ]
  %349 = phi i32 [ %340, %339 ], [ %474, %335 ], [ %474, %472 ]
  %350 = icmp sgt i32 %21, -1
  %351 = select i1 %475, i1 %350, i1 false
  br i1 %351, label %352, label %358

352:                                              ; preds = %347
  %353 = add nuw nsw i32 %349, 1
  %354 = sext i32 %30 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %0, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7
  %357 = fadd contract float %348, %356
  br label %358

358:                                              ; preds = %352, %347
  %359 = phi float [ %357, %352 ], [ %348, %347 ]
  %360 = phi i32 [ %353, %352 ], [ %349, %347 ]
  %361 = add nsw i32 %21, 1
  br i1 %475, label %362, label %374

362:                                              ; preds = %358
  %363 = icmp sgt i32 %21, -2
  %364 = icmp slt i32 %361, %3
  %365 = select i1 %363, i1 %364, i1 false
  br i1 %365, label %366, label %374

366:                                              ; preds = %362
  %367 = add nuw nsw i32 %360, 1
  %368 = add nsw i32 %361, %28
  %369 = mul nsw i32 %368, 3
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %0, i64 %370
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !7
  %373 = fadd contract float %359, %372
  br label %374

374:                                              ; preds = %358, %362, %366
  %375 = phi float [ %373, %366 ], [ %359, %362 ], [ %359, %358 ]
  %376 = phi i32 [ %367, %366 ], [ %360, %362 ], [ %360, %358 ]
  %377 = add nsw i32 %13, 1
  %378 = icmp sgt i32 %13, -2
  %379 = icmp slt i32 %377, %2
  %380 = mul nsw i32 %377, %3
  br i1 %378, label %381, label %394

381:                                              ; preds = %374
  %382 = icmp sgt i32 %21, 0
  %383 = select i1 %379, i1 %382, i1 false
  %384 = icmp sle i32 %21, %3
  %385 = select i1 %383, i1 %384, i1 false
  br i1 %385, label %386, label %394

386:                                              ; preds = %381
  %387 = add nuw nsw i32 %376, 1
  %388 = add nsw i32 %27, %380
  %389 = mul nsw i32 %388, 3
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds float, float addrspace(1)* %0, i64 %390
  %392 = load float, float addrspace(1)* %391, align 4, !tbaa !7
  %393 = fadd contract float %375, %392
  br label %394

394:                                              ; preds = %374, %381, %386
  %395 = phi i1 [ false, %374 ], [ %379, %381 ], [ %379, %386 ]
  %396 = phi float [ %375, %374 ], [ %375, %381 ], [ %393, %386 ]
  %397 = phi i32 [ %376, %374 ], [ %376, %381 ], [ %387, %386 ]
  %398 = icmp sgt i32 %21, -1
  %399 = select i1 %395, i1 %398, i1 false
  br i1 %399, label %400, label %408

400:                                              ; preds = %394
  %401 = add nuw nsw i32 %397, 1
  %402 = add nsw i32 %21, %380
  %403 = mul nsw i32 %402, 3
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float addrspace(1)* %0, i64 %404
  %406 = load float, float addrspace(1)* %405, align 4, !tbaa !7
  %407 = fadd contract float %396, %406
  br label %408

408:                                              ; preds = %400, %394
  %409 = phi float [ %407, %400 ], [ %396, %394 ]
  %410 = phi i32 [ %401, %400 ], [ %397, %394 ]
  %411 = add nsw i32 %21, 1
  br i1 %378, label %412, label %425

412:                                              ; preds = %408
  %413 = icmp sgt i32 %21, -2
  %414 = select i1 %379, i1 %413, i1 false
  %415 = icmp slt i32 %411, %3
  %416 = select i1 %414, i1 %415, i1 false
  br i1 %416, label %417, label %425

417:                                              ; preds = %412
  %418 = add nuw nsw i32 %410, 1
  %419 = add nsw i32 %411, %380
  %420 = mul nsw i32 %419, 3
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %0, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !7
  %424 = fadd contract float %409, %423
  br label %425

425:                                              ; preds = %408, %412, %417
  %426 = phi float [ %424, %417 ], [ %409, %412 ], [ %409, %408 ]
  %427 = phi i32 [ %418, %417 ], [ %410, %412 ], [ %410, %408 ]
  %428 = sitofp i32 %427 to float
  %429 = fdiv contract float %426, %428
  %430 = sext i32 %30 to i64
  %431 = getelementptr inbounds float, float addrspace(1)* %1, i64 %430
  store float %429, float addrspace(1)* %431, align 4, !tbaa !7
  br i1 %31, label %33, label %45

432:                                              ; preds = %25
  %433 = icmp sgt i32 %21, 0
  %434 = icmp sle i32 %21, %3
  %435 = select i1 %433, i1 %434, i1 false
  br i1 %435, label %436, label %443

436:                                              ; preds = %432
  %437 = add nsw i32 %27, %32
  %438 = mul nsw i32 %437, 3
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds float, float addrspace(1)* %0, i64 %439
  %441 = load float, float addrspace(1)* %440, align 4, !tbaa !7
  %442 = fadd contract float %441, 0.000000e+00
  br label %443

443:                                              ; preds = %436, %432, %25
  %444 = phi float [ %442, %436 ], [ 0.000000e+00, %432 ], [ 0.000000e+00, %25 ]
  %445 = phi i32 [ 1, %436 ], [ 0, %432 ], [ 0, %25 ]
  %446 = icmp sgt i32 %21, -1
  %447 = select i1 %31, i1 %446, i1 false
  br i1 %447, label %448, label %456

448:                                              ; preds = %443
  %449 = add nuw nsw i32 %445, 1
  %450 = add nsw i32 %21, %32
  %451 = mul nsw i32 %450, 3
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds float, float addrspace(1)* %0, i64 %452
  %454 = load float, float addrspace(1)* %453, align 4, !tbaa !7
  %455 = fadd contract float %444, %454
  br label %456

456:                                              ; preds = %448, %443
  %457 = phi float [ %455, %448 ], [ %444, %443 ]
  %458 = phi i32 [ %449, %448 ], [ %445, %443 ]
  %459 = add nsw i32 %21, 1
  br i1 %31, label %460, label %472

460:                                              ; preds = %456
  %461 = icmp sgt i32 %21, -2
  %462 = icmp slt i32 %459, %3
  %463 = select i1 %461, i1 %462, i1 false
  br i1 %463, label %464, label %472

464:                                              ; preds = %460
  %465 = add nuw nsw i32 %458, 1
  %466 = add nsw i32 %459, %32
  %467 = mul nsw i32 %466, 3
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds float, float addrspace(1)* %0, i64 %468
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7
  %471 = fadd contract float %457, %470
  br label %472

472:                                              ; preds = %464, %460, %456
  %473 = phi float [ %471, %464 ], [ %457, %460 ], [ %457, %456 ]
  %474 = phi i32 [ %465, %464 ], [ %458, %460 ], [ %458, %456 ]
  %475 = icmp sgt i32 %13, -1
  br i1 %475, label %335, label %347

476:                                              ; preds = %327, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
