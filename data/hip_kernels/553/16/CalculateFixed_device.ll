; ModuleID = '../data/hip_kernels/553/16/main.cu'
source_filename = "../data/hip_kernels/553/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14CalculateFixedPKfS0_PKiPfiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %19, %6
  %29 = icmp slt i32 %19, %7
  %30 = icmp slt i32 %27, %6
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %1199

32:                                               ; preds = %10
  %33 = add nsw i32 %28, %27
  %34 = mul nsw i32 %33, 3
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = add nsw i32 %34, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = add nsw i32 %34, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = add nsw i32 %4, -1
  %44 = add nsw i32 %5, -1
  %45 = add nsw i32 %27, -2
  %46 = add nsw i32 %19, -2
  %47 = mul nsw i32 %46, %6
  %48 = add nsw i32 %47, %45
  %49 = add nsw i32 %45, %9
  %50 = add nsw i32 %46, %8
  %51 = icmp sgt i32 %27, 1
  br i1 %51, label %52, label %68

52:                                               ; preds = %32
  %53 = icmp slt i32 %45, %6
  %54 = icmp sgt i32 %19, 1
  %55 = select i1 %53, i1 %54, i1 false
  %56 = icmp slt i32 %46, %7
  %57 = select i1 %55, i1 %56, i1 false
  br i1 %57, label %58, label %68

58:                                               ; preds = %52
  %59 = mul nsw i32 %48, 3
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = add nsw i32 %59, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = add nsw i32 %59, 2
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  br label %68

68:                                               ; preds = %32, %52, %58
  %69 = phi float addrspace(1)* [ %67, %58 ], [ %42, %52 ], [ %42, %32 ]
  %70 = phi float addrspace(1)* [ %64, %58 ], [ %39, %52 ], [ %39, %32 ]
  %71 = phi float addrspace(1)* [ %61, %58 ], [ %36, %52 ], [ %36, %32 ]
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %74 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %75 = fadd contract float %72, 0.000000e+00
  %76 = fadd contract float %73, 0.000000e+00
  %77 = fadd contract float %74, 0.000000e+00
  %78 = icmp slt i32 %27, 2
  br i1 %78, label %90, label %79

79:                                               ; preds = %68
  %80 = icmp slt i32 %45, %6
  %81 = icmp sgt i32 %19, 1
  %82 = select i1 %80, i1 %81, i1 false
  %83 = icmp slt i32 %46, %7
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %90

85:                                               ; preds = %79
  %86 = sext i32 %48 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !11, !amdgpu.noclobber !5
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %116

90:                                               ; preds = %85, %79, %68
  %91 = icmp slt i32 %49, 0
  %92 = icmp slt i32 %49, %4
  %93 = select i1 %92, i32 %49, i32 %43
  %94 = select i1 %91, i32 0, i32 %93
  %95 = icmp slt i32 %50, 0
  %96 = icmp slt i32 %50, %5
  %97 = select i1 %96, i32 %50, i32 %44
  %98 = select i1 %95, i32 0, i32 %97
  %99 = mul nsw i32 %98, %4
  %100 = add nsw i32 %99, %94
  %101 = mul nsw i32 %100, 3
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fadd contract float %104, 0.000000e+00
  %106 = add nsw i32 %101, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fadd contract float %109, 0.000000e+00
  %111 = add nsw i32 %101, 2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fadd contract float %114, 0.000000e+00
  br label %116

116:                                              ; preds = %90, %85
  %117 = phi float [ %110, %90 ], [ 0.000000e+00, %85 ]
  %118 = phi float [ %115, %90 ], [ 0.000000e+00, %85 ]
  %119 = phi float [ %105, %90 ], [ 0.000000e+00, %85 ]
  %120 = add nsw i32 %47, %27
  %121 = add nsw i32 %27, %9
  %122 = icmp sgt i32 %27, -1
  br i1 %122, label %123, label %137

123:                                              ; preds = %116
  %124 = icmp sgt i32 %19, 1
  %125 = icmp slt i32 %46, %7
  %126 = select i1 %124, i1 %125, i1 false
  br i1 %126, label %127, label %137

127:                                              ; preds = %123
  %128 = mul nsw i32 %120, 3
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = add nsw i32 %128, 1
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = add nsw i32 %128, 2
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  br label %137

137:                                              ; preds = %116, %123, %127
  %138 = phi float addrspace(1)* [ %136, %127 ], [ %42, %123 ], [ %42, %116 ]
  %139 = phi float addrspace(1)* [ %133, %127 ], [ %39, %123 ], [ %39, %116 ]
  %140 = phi float addrspace(1)* [ %130, %127 ], [ %36, %123 ], [ %36, %116 ]
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %143 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %144 = fadd contract float %75, %141
  %145 = fadd contract float %76, %142
  %146 = fadd contract float %77, %143
  %147 = icmp slt i32 %27, 0
  br i1 %147, label %157, label %148

148:                                              ; preds = %137
  %149 = icmp sgt i32 %19, 1
  %150 = icmp slt i32 %46, %7
  %151 = select i1 %149, i1 %150, i1 false
  br i1 %151, label %152, label %157

152:                                              ; preds = %148
  %153 = sext i32 %120 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !11, !amdgpu.noclobber !5
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %183

157:                                              ; preds = %152, %148, %137
  %158 = icmp slt i32 %121, 0
  %159 = icmp slt i32 %121, %4
  %160 = select i1 %159, i32 %121, i32 %43
  %161 = select i1 %158, i32 0, i32 %160
  %162 = icmp slt i32 %50, 0
  %163 = icmp slt i32 %50, %5
  %164 = select i1 %163, i32 %50, i32 %44
  %165 = select i1 %162, i32 0, i32 %164
  %166 = mul nsw i32 %165, %4
  %167 = add nsw i32 %166, %161
  %168 = mul nsw i32 %167, 3
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7, !amdgpu.noclobber !5
  %172 = fadd contract float %119, %171
  %173 = add nsw i32 %168, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7, !amdgpu.noclobber !5
  %177 = fadd contract float %117, %176
  %178 = add nsw i32 %168, 2
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !5
  %182 = fadd contract float %118, %181
  br label %183

183:                                              ; preds = %157, %152
  %184 = phi float [ %177, %157 ], [ %117, %152 ]
  %185 = phi float [ %182, %157 ], [ %118, %152 ]
  %186 = phi float [ %172, %157 ], [ %119, %152 ]
  %187 = add nsw i32 %27, 2
  %188 = add nsw i32 %47, %187
  %189 = add nsw i32 %187, %9
  %190 = icmp sgt i32 %27, -3
  br i1 %190, label %191, label %207

191:                                              ; preds = %183
  %192 = icmp slt i32 %187, %6
  %193 = icmp sgt i32 %19, 1
  %194 = select i1 %192, i1 %193, i1 false
  %195 = icmp slt i32 %46, %7
  %196 = select i1 %194, i1 %195, i1 false
  br i1 %196, label %197, label %207

197:                                              ; preds = %191
  %198 = mul nsw i32 %188, 3
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %1, i64 %199
  %201 = add nsw i32 %198, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %1, i64 %202
  %204 = add nsw i32 %198, 2
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %205
  br label %207

207:                                              ; preds = %183, %191, %197
  %208 = phi float addrspace(1)* [ %206, %197 ], [ %42, %191 ], [ %42, %183 ]
  %209 = phi float addrspace(1)* [ %203, %197 ], [ %39, %191 ], [ %39, %183 ]
  %210 = phi float addrspace(1)* [ %200, %197 ], [ %36, %191 ], [ %36, %183 ]
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %213 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %214 = fadd contract float %144, %211
  %215 = fadd contract float %145, %212
  %216 = fadd contract float %146, %213
  %217 = icmp slt i32 %27, -2
  br i1 %217, label %229, label %218

218:                                              ; preds = %207
  %219 = icmp slt i32 %187, %6
  %220 = icmp sgt i32 %19, 1
  %221 = select i1 %219, i1 %220, i1 false
  %222 = icmp slt i32 %46, %7
  %223 = select i1 %221, i1 %222, i1 false
  br i1 %223, label %224, label %229

224:                                              ; preds = %218
  %225 = sext i32 %188 to i64
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %225
  %227 = load i32, i32 addrspace(1)* %226, align 4, !tbaa !11, !amdgpu.noclobber !5
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %229, label %255

229:                                              ; preds = %224, %218, %207
  %230 = icmp slt i32 %189, 0
  %231 = icmp slt i32 %189, %4
  %232 = select i1 %231, i32 %189, i32 %43
  %233 = select i1 %230, i32 0, i32 %232
  %234 = icmp slt i32 %50, 0
  %235 = icmp slt i32 %50, %5
  %236 = select i1 %235, i32 %50, i32 %44
  %237 = select i1 %234, i32 0, i32 %236
  %238 = mul nsw i32 %237, %4
  %239 = add nsw i32 %238, %233
  %240 = mul nsw i32 %239, 3
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !7, !amdgpu.noclobber !5
  %244 = fadd contract float %186, %243
  %245 = add nsw i32 %240, 1
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7, !amdgpu.noclobber !5
  %249 = fadd contract float %184, %248
  %250 = add nsw i32 %240, 2
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !5
  %254 = fadd contract float %185, %253
  br label %255

255:                                              ; preds = %229, %224
  %256 = phi float [ %249, %229 ], [ %184, %224 ]
  %257 = phi float [ %254, %229 ], [ %185, %224 ]
  %258 = phi float [ %244, %229 ], [ %186, %224 ]
  %259 = add nsw i32 %27, -1
  %260 = add nsw i32 %19, -1
  %261 = mul nsw i32 %260, %6
  %262 = add nsw i32 %261, %259
  %263 = add nsw i32 %259, %9
  %264 = add nsw i32 %260, %8
  %265 = icmp sgt i32 %27, 0
  br i1 %265, label %266, label %282

266:                                              ; preds = %255
  %267 = icmp sle i32 %27, %6
  %268 = icmp sgt i32 %19, 0
  %269 = select i1 %267, i1 %268, i1 false
  %270 = icmp sle i32 %19, %7
  %271 = select i1 %269, i1 %270, i1 false
  br i1 %271, label %272, label %282

272:                                              ; preds = %266
  %273 = mul nsw i32 %262, 3
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %1, i64 %274
  %276 = add nsw i32 %273, 1
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %1, i64 %277
  %279 = add nsw i32 %273, 2
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %1, i64 %280
  br label %282

282:                                              ; preds = %255, %266, %272
  %283 = phi float addrspace(1)* [ %281, %272 ], [ %42, %266 ], [ %42, %255 ]
  %284 = phi float addrspace(1)* [ %278, %272 ], [ %39, %266 ], [ %39, %255 ]
  %285 = phi float addrspace(1)* [ %275, %272 ], [ %36, %266 ], [ %36, %255 ]
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !7
  %287 = fmul contract float %286, 2.000000e+00
  %288 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %289 = fmul contract float %288, 2.000000e+00
  %290 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %291 = fmul contract float %290, 2.000000e+00
  %292 = fadd contract float %214, %287
  %293 = fadd contract float %215, %289
  %294 = fadd contract float %216, %291
  %295 = icmp slt i32 %27, 1
  br i1 %295, label %307, label %296

296:                                              ; preds = %282
  %297 = icmp sle i32 %27, %6
  %298 = icmp sgt i32 %19, 0
  %299 = select i1 %297, i1 %298, i1 false
  %300 = icmp sle i32 %19, %7
  %301 = select i1 %299, i1 %300, i1 false
  br i1 %301, label %302, label %307

302:                                              ; preds = %296
  %303 = sext i32 %262 to i64
  %304 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %303
  %305 = load i32, i32 addrspace(1)* %304, align 4, !tbaa !11, !amdgpu.noclobber !5
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %307, label %336

307:                                              ; preds = %302, %296, %282
  %308 = icmp slt i32 %263, 0
  %309 = icmp slt i32 %263, %4
  %310 = select i1 %309, i32 %263, i32 %43
  %311 = select i1 %308, i32 0, i32 %310
  %312 = icmp slt i32 %264, 0
  %313 = icmp slt i32 %264, %5
  %314 = select i1 %313, i32 %264, i32 %44
  %315 = select i1 %312, i32 0, i32 %314
  %316 = mul nsw i32 %315, %4
  %317 = add nsw i32 %316, %311
  %318 = mul nsw i32 %317, 3
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %0, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7, !amdgpu.noclobber !5
  %322 = fmul contract float %321, 2.000000e+00
  %323 = fadd contract float %258, %322
  %324 = add nsw i32 %318, 1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %0, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !7, !amdgpu.noclobber !5
  %328 = fmul contract float %327, 2.000000e+00
  %329 = fadd contract float %256, %328
  %330 = add nsw i32 %318, 2
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %0, i64 %331
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !7, !amdgpu.noclobber !5
  %334 = fmul contract float %333, 2.000000e+00
  %335 = fadd contract float %257, %334
  br label %336

336:                                              ; preds = %307, %302
  %337 = phi float [ %329, %307 ], [ %256, %302 ]
  %338 = phi float [ %335, %307 ], [ %257, %302 ]
  %339 = phi float [ %323, %307 ], [ %258, %302 ]
  %340 = add nsw i32 %261, %27
  br i1 %122, label %341, label %355

341:                                              ; preds = %336
  %342 = icmp sgt i32 %19, 0
  %343 = icmp sle i32 %19, %7
  %344 = select i1 %342, i1 %343, i1 false
  br i1 %344, label %345, label %355

345:                                              ; preds = %341
  %346 = mul nsw i32 %340, 3
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %1, i64 %347
  %349 = add nsw i32 %346, 1
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %1, i64 %350
  %352 = add nsw i32 %346, 2
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float addrspace(1)* %1, i64 %353
  br label %355

355:                                              ; preds = %336, %341, %345
  %356 = phi float addrspace(1)* [ %354, %345 ], [ %42, %341 ], [ %42, %336 ]
  %357 = phi float addrspace(1)* [ %351, %345 ], [ %39, %341 ], [ %39, %336 ]
  %358 = phi float addrspace(1)* [ %348, %345 ], [ %36, %341 ], [ %36, %336 ]
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !7
  %360 = fmul contract float %359, 2.000000e+00
  %361 = load float, float addrspace(1)* %357, align 4, !tbaa !7
  %362 = fmul contract float %361, 2.000000e+00
  %363 = load float, float addrspace(1)* %356, align 4, !tbaa !7
  %364 = fmul contract float %363, 2.000000e+00
  %365 = fadd contract float %292, %360
  %366 = fadd contract float %293, %362
  %367 = fadd contract float %294, %364
  br i1 %147, label %377, label %368

368:                                              ; preds = %355
  %369 = icmp sgt i32 %19, 0
  %370 = icmp sle i32 %19, %7
  %371 = select i1 %369, i1 %370, i1 false
  br i1 %371, label %372, label %377

372:                                              ; preds = %368
  %373 = sext i32 %340 to i64
  %374 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %373
  %375 = load i32, i32 addrspace(1)* %374, align 4, !tbaa !11, !amdgpu.noclobber !5
  %376 = icmp eq i32 %375, 0
  br i1 %376, label %377, label %406

377:                                              ; preds = %372, %368, %355
  %378 = icmp slt i32 %121, 0
  %379 = icmp slt i32 %121, %4
  %380 = select i1 %379, i32 %121, i32 %43
  %381 = select i1 %378, i32 0, i32 %380
  %382 = icmp slt i32 %264, 0
  %383 = icmp slt i32 %264, %5
  %384 = select i1 %383, i32 %264, i32 %44
  %385 = select i1 %382, i32 0, i32 %384
  %386 = mul nsw i32 %385, %4
  %387 = add nsw i32 %386, %381
  %388 = mul nsw i32 %387, 3
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %0, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !7, !amdgpu.noclobber !5
  %392 = fmul contract float %391, 2.000000e+00
  %393 = fadd contract float %339, %392
  %394 = add nsw i32 %388, 1
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %0, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !7, !amdgpu.noclobber !5
  %398 = fmul contract float %397, 2.000000e+00
  %399 = fadd contract float %337, %398
  %400 = add nsw i32 %388, 2
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %0, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !7, !amdgpu.noclobber !5
  %404 = fmul contract float %403, 2.000000e+00
  %405 = fadd contract float %338, %404
  br label %406

406:                                              ; preds = %377, %372
  %407 = phi float [ %399, %377 ], [ %337, %372 ]
  %408 = phi float [ %405, %377 ], [ %338, %372 ]
  %409 = phi float [ %393, %377 ], [ %339, %372 ]
  %410 = add nsw i32 %27, 1
  %411 = add nsw i32 %261, %410
  %412 = add nsw i32 %410, %9
  %413 = icmp sgt i32 %27, -2
  br i1 %413, label %414, label %430

414:                                              ; preds = %406
  %415 = icmp slt i32 %410, %6
  %416 = icmp sgt i32 %19, 0
  %417 = select i1 %415, i1 %416, i1 false
  %418 = icmp sle i32 %19, %7
  %419 = select i1 %417, i1 %418, i1 false
  br i1 %419, label %420, label %430

420:                                              ; preds = %414
  %421 = mul nsw i32 %411, 3
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds float, float addrspace(1)* %1, i64 %422
  %424 = add nsw i32 %421, 1
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %1, i64 %425
  %427 = add nsw i32 %421, 2
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds float, float addrspace(1)* %1, i64 %428
  br label %430

430:                                              ; preds = %406, %414, %420
  %431 = phi float addrspace(1)* [ %429, %420 ], [ %42, %414 ], [ %42, %406 ]
  %432 = phi float addrspace(1)* [ %426, %420 ], [ %39, %414 ], [ %39, %406 ]
  %433 = phi float addrspace(1)* [ %423, %420 ], [ %36, %414 ], [ %36, %406 ]
  %434 = load float, float addrspace(1)* %433, align 4, !tbaa !7
  %435 = fmul contract float %434, 2.000000e+00
  %436 = load float, float addrspace(1)* %432, align 4, !tbaa !7
  %437 = fmul contract float %436, 2.000000e+00
  %438 = load float, float addrspace(1)* %431, align 4, !tbaa !7
  %439 = fmul contract float %438, 2.000000e+00
  %440 = fadd contract float %365, %435
  %441 = fadd contract float %366, %437
  %442 = fadd contract float %367, %439
  %443 = icmp slt i32 %27, -1
  br i1 %443, label %455, label %444

444:                                              ; preds = %430
  %445 = icmp slt i32 %410, %6
  %446 = icmp sgt i32 %19, 0
  %447 = select i1 %445, i1 %446, i1 false
  %448 = icmp sle i32 %19, %7
  %449 = select i1 %447, i1 %448, i1 false
  br i1 %449, label %450, label %455

450:                                              ; preds = %444
  %451 = sext i32 %411 to i64
  %452 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %451
  %453 = load i32, i32 addrspace(1)* %452, align 4, !tbaa !11, !amdgpu.noclobber !5
  %454 = icmp eq i32 %453, 0
  br i1 %454, label %455, label %484

455:                                              ; preds = %450, %444, %430
  %456 = icmp slt i32 %412, 0
  %457 = icmp slt i32 %412, %4
  %458 = select i1 %457, i32 %412, i32 %43
  %459 = select i1 %456, i32 0, i32 %458
  %460 = icmp slt i32 %264, 0
  %461 = icmp slt i32 %264, %5
  %462 = select i1 %461, i32 %264, i32 %44
  %463 = select i1 %460, i32 0, i32 %462
  %464 = mul nsw i32 %463, %4
  %465 = add nsw i32 %464, %459
  %466 = mul nsw i32 %465, 3
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds float, float addrspace(1)* %0, i64 %467
  %469 = load float, float addrspace(1)* %468, align 4, !tbaa !7, !amdgpu.noclobber !5
  %470 = fmul contract float %469, 2.000000e+00
  %471 = fadd contract float %409, %470
  %472 = add nsw i32 %466, 1
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds float, float addrspace(1)* %0, i64 %473
  %475 = load float, float addrspace(1)* %474, align 4, !tbaa !7, !amdgpu.noclobber !5
  %476 = fmul contract float %475, 2.000000e+00
  %477 = fadd contract float %407, %476
  %478 = add nsw i32 %466, 2
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds float, float addrspace(1)* %0, i64 %479
  %481 = load float, float addrspace(1)* %480, align 4, !tbaa !7, !amdgpu.noclobber !5
  %482 = fmul contract float %481, 2.000000e+00
  %483 = fadd contract float %408, %482
  br label %484

484:                                              ; preds = %455, %450
  %485 = phi float [ %477, %455 ], [ %407, %450 ]
  %486 = phi float [ %483, %455 ], [ %408, %450 ]
  %487 = phi float [ %471, %455 ], [ %409, %450 ]
  %488 = add nsw i32 %28, %45
  %489 = add nsw i32 %19, %8
  br i1 %51, label %490, label %504

490:                                              ; preds = %484
  %491 = icmp slt i32 %45, %6
  %492 = icmp sgt i32 %19, -1
  %493 = select i1 %491, i1 %492, i1 false
  br i1 %493, label %494, label %504

494:                                              ; preds = %490
  %495 = mul nsw i32 %488, 3
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds float, float addrspace(1)* %1, i64 %496
  %498 = add nsw i32 %495, 1
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %1, i64 %499
  %501 = add nsw i32 %495, 2
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds float, float addrspace(1)* %1, i64 %502
  br label %504

504:                                              ; preds = %484, %490, %494
  %505 = phi float addrspace(1)* [ %503, %494 ], [ %42, %490 ], [ %42, %484 ]
  %506 = phi float addrspace(1)* [ %500, %494 ], [ %39, %490 ], [ %39, %484 ]
  %507 = phi float addrspace(1)* [ %497, %494 ], [ %36, %490 ], [ %36, %484 ]
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %509 = load float, float addrspace(1)* %506, align 4, !tbaa !7
  %510 = load float, float addrspace(1)* %505, align 4, !tbaa !7
  %511 = fadd contract float %440, %508
  %512 = fadd contract float %441, %509
  %513 = fadd contract float %442, %510
  br i1 %78, label %523, label %514

514:                                              ; preds = %504
  %515 = icmp slt i32 %45, %6
  %516 = icmp sgt i32 %19, -1
  %517 = select i1 %515, i1 %516, i1 false
  br i1 %517, label %518, label %523

518:                                              ; preds = %514
  %519 = sext i32 %488 to i64
  %520 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %519
  %521 = load i32, i32 addrspace(1)* %520, align 4, !tbaa !11, !amdgpu.noclobber !5
  %522 = icmp eq i32 %521, 0
  br i1 %522, label %523, label %549

523:                                              ; preds = %518, %514, %504
  %524 = icmp slt i32 %49, 0
  %525 = icmp slt i32 %49, %4
  %526 = select i1 %525, i32 %49, i32 %43
  %527 = select i1 %524, i32 0, i32 %526
  %528 = icmp slt i32 %489, 0
  %529 = icmp slt i32 %489, %5
  %530 = select i1 %529, i32 %489, i32 %44
  %531 = select i1 %528, i32 0, i32 %530
  %532 = mul nsw i32 %531, %4
  %533 = add nsw i32 %532, %527
  %534 = mul nsw i32 %533, 3
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds float, float addrspace(1)* %0, i64 %535
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !7, !amdgpu.noclobber !5
  %538 = fadd contract float %487, %537
  %539 = add nsw i32 %534, 1
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %0, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !7, !amdgpu.noclobber !5
  %543 = fadd contract float %485, %542
  %544 = add nsw i32 %534, 2
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %0, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !7, !amdgpu.noclobber !5
  %548 = fadd contract float %486, %547
  br label %549

549:                                              ; preds = %523, %518
  %550 = phi float [ %543, %523 ], [ %485, %518 ]
  %551 = phi float [ %548, %523 ], [ %486, %518 ]
  %552 = phi float [ %538, %523 ], [ %487, %518 ]
  %553 = add nsw i32 %28, %259
  br i1 %265, label %554, label %568

554:                                              ; preds = %549
  %555 = icmp sle i32 %27, %6
  %556 = icmp sgt i32 %19, -1
  %557 = select i1 %555, i1 %556, i1 false
  br i1 %557, label %558, label %568

558:                                              ; preds = %554
  %559 = mul nsw i32 %553, 3
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds float, float addrspace(1)* %1, i64 %560
  %562 = add nsw i32 %559, 1
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %1, i64 %563
  %565 = add nsw i32 %559, 2
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds float, float addrspace(1)* %1, i64 %566
  br label %568

568:                                              ; preds = %549, %554, %558
  %569 = phi float addrspace(1)* [ %567, %558 ], [ %42, %554 ], [ %42, %549 ]
  %570 = phi float addrspace(1)* [ %564, %558 ], [ %39, %554 ], [ %39, %549 ]
  %571 = phi float addrspace(1)* [ %561, %558 ], [ %36, %554 ], [ %36, %549 ]
  %572 = load float, float addrspace(1)* %571, align 4, !tbaa !7
  %573 = fmul contract float %572, 2.000000e+00
  %574 = load float, float addrspace(1)* %570, align 4, !tbaa !7
  %575 = fmul contract float %574, 2.000000e+00
  %576 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %577 = fmul contract float %576, 2.000000e+00
  %578 = fadd contract float %511, %573
  %579 = fadd contract float %512, %575
  %580 = fadd contract float %513, %577
  br i1 %295, label %590, label %581

581:                                              ; preds = %568
  %582 = icmp sle i32 %27, %6
  %583 = icmp sgt i32 %19, -1
  %584 = select i1 %582, i1 %583, i1 false
  br i1 %584, label %585, label %590

585:                                              ; preds = %581
  %586 = sext i32 %553 to i64
  %587 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %586
  %588 = load i32, i32 addrspace(1)* %587, align 4, !tbaa !11, !amdgpu.noclobber !5
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %590, label %619

590:                                              ; preds = %585, %581, %568
  %591 = icmp slt i32 %263, 0
  %592 = icmp slt i32 %263, %4
  %593 = select i1 %592, i32 %263, i32 %43
  %594 = select i1 %591, i32 0, i32 %593
  %595 = icmp slt i32 %489, 0
  %596 = icmp slt i32 %489, %5
  %597 = select i1 %596, i32 %489, i32 %44
  %598 = select i1 %595, i32 0, i32 %597
  %599 = mul nsw i32 %598, %4
  %600 = add nsw i32 %599, %594
  %601 = mul nsw i32 %600, 3
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds float, float addrspace(1)* %0, i64 %602
  %604 = load float, float addrspace(1)* %603, align 4, !tbaa !7, !amdgpu.noclobber !5
  %605 = fmul contract float %604, 2.000000e+00
  %606 = fadd contract float %552, %605
  %607 = add nsw i32 %601, 1
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds float, float addrspace(1)* %0, i64 %608
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !7, !amdgpu.noclobber !5
  %611 = fmul contract float %610, 2.000000e+00
  %612 = fadd contract float %550, %611
  %613 = add nsw i32 %601, 2
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %0, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !7, !amdgpu.noclobber !5
  %617 = fmul contract float %616, 2.000000e+00
  %618 = fadd contract float %551, %617
  br label %619

619:                                              ; preds = %590, %585
  %620 = phi float [ %612, %590 ], [ %550, %585 ]
  %621 = phi float [ %618, %590 ], [ %551, %585 ]
  %622 = phi float [ %606, %590 ], [ %552, %585 ]
  %623 = add nsw i32 %28, %410
  br i1 %413, label %624, label %638

624:                                              ; preds = %619
  %625 = icmp slt i32 %410, %6
  %626 = icmp sgt i32 %19, -1
  %627 = select i1 %625, i1 %626, i1 false
  br i1 %627, label %628, label %638

628:                                              ; preds = %624
  %629 = mul nsw i32 %623, 3
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds float, float addrspace(1)* %1, i64 %630
  %632 = add nsw i32 %629, 1
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds float, float addrspace(1)* %1, i64 %633
  %635 = add nsw i32 %629, 2
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds float, float addrspace(1)* %1, i64 %636
  br label %638

638:                                              ; preds = %619, %624, %628
  %639 = phi float addrspace(1)* [ %637, %628 ], [ %42, %624 ], [ %42, %619 ]
  %640 = phi float addrspace(1)* [ %634, %628 ], [ %39, %624 ], [ %39, %619 ]
  %641 = phi float addrspace(1)* [ %631, %628 ], [ %36, %624 ], [ %36, %619 ]
  %642 = load float, float addrspace(1)* %641, align 4, !tbaa !7
  %643 = fmul contract float %642, 2.000000e+00
  %644 = load float, float addrspace(1)* %640, align 4, !tbaa !7
  %645 = fmul contract float %644, 2.000000e+00
  %646 = load float, float addrspace(1)* %639, align 4, !tbaa !7
  %647 = fmul contract float %646, 2.000000e+00
  %648 = fadd contract float %578, %643
  %649 = fadd contract float %579, %645
  %650 = fadd contract float %580, %647
  br i1 %443, label %660, label %651

651:                                              ; preds = %638
  %652 = icmp slt i32 %410, %6
  %653 = icmp sgt i32 %19, -1
  %654 = select i1 %652, i1 %653, i1 false
  br i1 %654, label %655, label %660

655:                                              ; preds = %651
  %656 = sext i32 %623 to i64
  %657 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %656
  %658 = load i32, i32 addrspace(1)* %657, align 4, !tbaa !11, !amdgpu.noclobber !5
  %659 = icmp eq i32 %658, 0
  br i1 %659, label %660, label %689

660:                                              ; preds = %655, %651, %638
  %661 = icmp slt i32 %412, 0
  %662 = icmp slt i32 %412, %4
  %663 = select i1 %662, i32 %412, i32 %43
  %664 = select i1 %661, i32 0, i32 %663
  %665 = icmp slt i32 %489, 0
  %666 = icmp slt i32 %489, %5
  %667 = select i1 %666, i32 %489, i32 %44
  %668 = select i1 %665, i32 0, i32 %667
  %669 = mul nsw i32 %668, %4
  %670 = add nsw i32 %669, %664
  %671 = mul nsw i32 %670, 3
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds float, float addrspace(1)* %0, i64 %672
  %674 = load float, float addrspace(1)* %673, align 4, !tbaa !7, !amdgpu.noclobber !5
  %675 = fmul contract float %674, 2.000000e+00
  %676 = fadd contract float %622, %675
  %677 = add nsw i32 %671, 1
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds float, float addrspace(1)* %0, i64 %678
  %680 = load float, float addrspace(1)* %679, align 4, !tbaa !7, !amdgpu.noclobber !5
  %681 = fmul contract float %680, 2.000000e+00
  %682 = fadd contract float %620, %681
  %683 = add nsw i32 %671, 2
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds float, float addrspace(1)* %0, i64 %684
  %686 = load float, float addrspace(1)* %685, align 4, !tbaa !7, !amdgpu.noclobber !5
  %687 = fmul contract float %686, 2.000000e+00
  %688 = fadd contract float %621, %687
  br label %689

689:                                              ; preds = %660, %655
  %690 = phi float [ %682, %660 ], [ %620, %655 ]
  %691 = phi float [ %688, %660 ], [ %621, %655 ]
  %692 = phi float [ %676, %660 ], [ %622, %655 ]
  %693 = add nsw i32 %28, %187
  br i1 %190, label %694, label %708

694:                                              ; preds = %689
  %695 = icmp slt i32 %187, %6
  %696 = icmp sgt i32 %19, -1
  %697 = select i1 %695, i1 %696, i1 false
  br i1 %697, label %698, label %708

698:                                              ; preds = %694
  %699 = mul nsw i32 %693, 3
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds float, float addrspace(1)* %1, i64 %700
  %702 = add nsw i32 %699, 1
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds float, float addrspace(1)* %1, i64 %703
  %705 = add nsw i32 %699, 2
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds float, float addrspace(1)* %1, i64 %706
  br label %708

708:                                              ; preds = %689, %694, %698
  %709 = phi float addrspace(1)* [ %707, %698 ], [ %42, %694 ], [ %42, %689 ]
  %710 = phi float addrspace(1)* [ %704, %698 ], [ %39, %694 ], [ %39, %689 ]
  %711 = phi float addrspace(1)* [ %701, %698 ], [ %36, %694 ], [ %36, %689 ]
  %712 = load float, float addrspace(1)* %711, align 4, !tbaa !7
  %713 = load float, float addrspace(1)* %710, align 4, !tbaa !7
  %714 = load float, float addrspace(1)* %709, align 4, !tbaa !7
  %715 = fadd contract float %648, %712
  %716 = fadd contract float %649, %713
  %717 = fadd contract float %650, %714
  br i1 %217, label %727, label %718

718:                                              ; preds = %708
  %719 = icmp slt i32 %187, %6
  %720 = icmp sgt i32 %19, -1
  %721 = select i1 %719, i1 %720, i1 false
  br i1 %721, label %722, label %727

722:                                              ; preds = %718
  %723 = sext i32 %693 to i64
  %724 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %723
  %725 = load i32, i32 addrspace(1)* %724, align 4, !tbaa !11, !amdgpu.noclobber !5
  %726 = icmp eq i32 %725, 0
  br i1 %726, label %727, label %753

727:                                              ; preds = %722, %718, %708
  %728 = icmp slt i32 %189, 0
  %729 = icmp slt i32 %189, %4
  %730 = select i1 %729, i32 %189, i32 %43
  %731 = select i1 %728, i32 0, i32 %730
  %732 = icmp slt i32 %489, 0
  %733 = icmp slt i32 %489, %5
  %734 = select i1 %733, i32 %489, i32 %44
  %735 = select i1 %732, i32 0, i32 %734
  %736 = mul nsw i32 %735, %4
  %737 = add nsw i32 %736, %731
  %738 = mul nsw i32 %737, 3
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds float, float addrspace(1)* %0, i64 %739
  %741 = load float, float addrspace(1)* %740, align 4, !tbaa !7, !amdgpu.noclobber !5
  %742 = fadd contract float %692, %741
  %743 = add nsw i32 %738, 1
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds float, float addrspace(1)* %0, i64 %744
  %746 = load float, float addrspace(1)* %745, align 4, !tbaa !7, !amdgpu.noclobber !5
  %747 = fadd contract float %690, %746
  %748 = add nsw i32 %738, 2
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %0, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !7, !amdgpu.noclobber !5
  %752 = fadd contract float %691, %751
  br label %753

753:                                              ; preds = %727, %722
  %754 = phi float [ %747, %727 ], [ %690, %722 ]
  %755 = phi float [ %752, %727 ], [ %691, %722 ]
  %756 = phi float [ %742, %727 ], [ %692, %722 ]
  %757 = add nsw i32 %19, 1
  %758 = mul nsw i32 %757, %6
  %759 = add nsw i32 %758, %259
  %760 = add nsw i32 %757, %8
  br i1 %265, label %761, label %777

761:                                              ; preds = %753
  %762 = icmp sle i32 %27, %6
  %763 = icmp sgt i32 %19, -2
  %764 = select i1 %762, i1 %763, i1 false
  %765 = icmp slt i32 %757, %7
  %766 = select i1 %764, i1 %765, i1 false
  br i1 %766, label %767, label %777

767:                                              ; preds = %761
  %768 = mul nsw i32 %759, 3
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds float, float addrspace(1)* %1, i64 %769
  %771 = add nsw i32 %768, 1
  %772 = sext i32 %771 to i64
  %773 = getelementptr inbounds float, float addrspace(1)* %1, i64 %772
  %774 = add nsw i32 %768, 2
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %1, i64 %775
  br label %777

777:                                              ; preds = %753, %761, %767
  %778 = phi float addrspace(1)* [ %776, %767 ], [ %42, %761 ], [ %42, %753 ]
  %779 = phi float addrspace(1)* [ %773, %767 ], [ %39, %761 ], [ %39, %753 ]
  %780 = phi float addrspace(1)* [ %770, %767 ], [ %36, %761 ], [ %36, %753 ]
  %781 = load float, float addrspace(1)* %780, align 4, !tbaa !7
  %782 = fmul contract float %781, 2.000000e+00
  %783 = load float, float addrspace(1)* %779, align 4, !tbaa !7
  %784 = fmul contract float %783, 2.000000e+00
  %785 = load float, float addrspace(1)* %778, align 4, !tbaa !7
  %786 = fmul contract float %785, 2.000000e+00
  %787 = fadd contract float %715, %782
  %788 = fadd contract float %716, %784
  %789 = fadd contract float %717, %786
  br i1 %295, label %801, label %790

790:                                              ; preds = %777
  %791 = icmp sle i32 %27, %6
  %792 = icmp sgt i32 %19, -2
  %793 = select i1 %791, i1 %792, i1 false
  %794 = icmp slt i32 %757, %7
  %795 = select i1 %793, i1 %794, i1 false
  br i1 %795, label %796, label %801

796:                                              ; preds = %790
  %797 = sext i32 %759 to i64
  %798 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %797
  %799 = load i32, i32 addrspace(1)* %798, align 4, !tbaa !11, !amdgpu.noclobber !5
  %800 = icmp eq i32 %799, 0
  br i1 %800, label %801, label %830

801:                                              ; preds = %796, %790, %777
  %802 = icmp slt i32 %263, 0
  %803 = icmp slt i32 %263, %4
  %804 = select i1 %803, i32 %263, i32 %43
  %805 = select i1 %802, i32 0, i32 %804
  %806 = icmp slt i32 %760, 0
  %807 = icmp slt i32 %760, %5
  %808 = select i1 %807, i32 %760, i32 %44
  %809 = select i1 %806, i32 0, i32 %808
  %810 = mul nsw i32 %809, %4
  %811 = add nsw i32 %810, %805
  %812 = mul nsw i32 %811, 3
  %813 = sext i32 %812 to i64
  %814 = getelementptr inbounds float, float addrspace(1)* %0, i64 %813
  %815 = load float, float addrspace(1)* %814, align 4, !tbaa !7, !amdgpu.noclobber !5
  %816 = fmul contract float %815, 2.000000e+00
  %817 = fadd contract float %756, %816
  %818 = add nsw i32 %812, 1
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds float, float addrspace(1)* %0, i64 %819
  %821 = load float, float addrspace(1)* %820, align 4, !tbaa !7, !amdgpu.noclobber !5
  %822 = fmul contract float %821, 2.000000e+00
  %823 = fadd contract float %754, %822
  %824 = add nsw i32 %812, 2
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds float, float addrspace(1)* %0, i64 %825
  %827 = load float, float addrspace(1)* %826, align 4, !tbaa !7, !amdgpu.noclobber !5
  %828 = fmul contract float %827, 2.000000e+00
  %829 = fadd contract float %755, %828
  br label %830

830:                                              ; preds = %801, %796
  %831 = phi float [ %823, %801 ], [ %754, %796 ]
  %832 = phi float [ %829, %801 ], [ %755, %796 ]
  %833 = phi float [ %817, %801 ], [ %756, %796 ]
  %834 = add nsw i32 %758, %27
  br i1 %122, label %835, label %849

835:                                              ; preds = %830
  %836 = icmp sgt i32 %19, -2
  %837 = icmp slt i32 %757, %7
  %838 = select i1 %836, i1 %837, i1 false
  br i1 %838, label %839, label %849

839:                                              ; preds = %835
  %840 = mul nsw i32 %834, 3
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds float, float addrspace(1)* %1, i64 %841
  %843 = add nsw i32 %840, 1
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds float, float addrspace(1)* %1, i64 %844
  %846 = add nsw i32 %840, 2
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds float, float addrspace(1)* %1, i64 %847
  br label %849

849:                                              ; preds = %830, %835, %839
  %850 = phi float addrspace(1)* [ %848, %839 ], [ %42, %835 ], [ %42, %830 ]
  %851 = phi float addrspace(1)* [ %845, %839 ], [ %39, %835 ], [ %39, %830 ]
  %852 = phi float addrspace(1)* [ %842, %839 ], [ %36, %835 ], [ %36, %830 ]
  %853 = load float, float addrspace(1)* %852, align 4, !tbaa !7
  %854 = fmul contract float %853, 2.000000e+00
  %855 = load float, float addrspace(1)* %851, align 4, !tbaa !7
  %856 = fmul contract float %855, 2.000000e+00
  %857 = load float, float addrspace(1)* %850, align 4, !tbaa !7
  %858 = fmul contract float %857, 2.000000e+00
  %859 = fadd contract float %787, %854
  %860 = fadd contract float %788, %856
  %861 = fadd contract float %789, %858
  br i1 %147, label %871, label %862

862:                                              ; preds = %849
  %863 = icmp sgt i32 %19, -2
  %864 = icmp slt i32 %757, %7
  %865 = select i1 %863, i1 %864, i1 false
  br i1 %865, label %866, label %871

866:                                              ; preds = %862
  %867 = sext i32 %834 to i64
  %868 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %867
  %869 = load i32, i32 addrspace(1)* %868, align 4, !tbaa !11, !amdgpu.noclobber !5
  %870 = icmp eq i32 %869, 0
  br i1 %870, label %871, label %900

871:                                              ; preds = %866, %862, %849
  %872 = icmp slt i32 %121, 0
  %873 = icmp slt i32 %121, %4
  %874 = select i1 %873, i32 %121, i32 %43
  %875 = select i1 %872, i32 0, i32 %874
  %876 = icmp slt i32 %760, 0
  %877 = icmp slt i32 %760, %5
  %878 = select i1 %877, i32 %760, i32 %44
  %879 = select i1 %876, i32 0, i32 %878
  %880 = mul nsw i32 %879, %4
  %881 = add nsw i32 %880, %875
  %882 = mul nsw i32 %881, 3
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds float, float addrspace(1)* %0, i64 %883
  %885 = load float, float addrspace(1)* %884, align 4, !tbaa !7, !amdgpu.noclobber !5
  %886 = fmul contract float %885, 2.000000e+00
  %887 = fadd contract float %833, %886
  %888 = add nsw i32 %882, 1
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds float, float addrspace(1)* %0, i64 %889
  %891 = load float, float addrspace(1)* %890, align 4, !tbaa !7, !amdgpu.noclobber !5
  %892 = fmul contract float %891, 2.000000e+00
  %893 = fadd contract float %831, %892
  %894 = add nsw i32 %882, 2
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds float, float addrspace(1)* %0, i64 %895
  %897 = load float, float addrspace(1)* %896, align 4, !tbaa !7, !amdgpu.noclobber !5
  %898 = fmul contract float %897, 2.000000e+00
  %899 = fadd contract float %832, %898
  br label %900

900:                                              ; preds = %871, %866
  %901 = phi float [ %893, %871 ], [ %831, %866 ]
  %902 = phi float [ %899, %871 ], [ %832, %866 ]
  %903 = phi float [ %887, %871 ], [ %833, %866 ]
  %904 = add nsw i32 %758, %410
  br i1 %413, label %905, label %921

905:                                              ; preds = %900
  %906 = icmp slt i32 %410, %6
  %907 = icmp sgt i32 %19, -2
  %908 = select i1 %906, i1 %907, i1 false
  %909 = icmp slt i32 %757, %7
  %910 = select i1 %908, i1 %909, i1 false
  br i1 %910, label %911, label %921

911:                                              ; preds = %905
  %912 = mul nsw i32 %904, 3
  %913 = sext i32 %912 to i64
  %914 = getelementptr inbounds float, float addrspace(1)* %1, i64 %913
  %915 = add nsw i32 %912, 1
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds float, float addrspace(1)* %1, i64 %916
  %918 = add nsw i32 %912, 2
  %919 = sext i32 %918 to i64
  %920 = getelementptr inbounds float, float addrspace(1)* %1, i64 %919
  br label %921

921:                                              ; preds = %900, %905, %911
  %922 = phi float addrspace(1)* [ %920, %911 ], [ %42, %905 ], [ %42, %900 ]
  %923 = phi float addrspace(1)* [ %917, %911 ], [ %39, %905 ], [ %39, %900 ]
  %924 = phi float addrspace(1)* [ %914, %911 ], [ %36, %905 ], [ %36, %900 ]
  %925 = load float, float addrspace(1)* %924, align 4, !tbaa !7
  %926 = fmul contract float %925, 2.000000e+00
  %927 = load float, float addrspace(1)* %923, align 4, !tbaa !7
  %928 = fmul contract float %927, 2.000000e+00
  %929 = load float, float addrspace(1)* %922, align 4, !tbaa !7
  %930 = fmul contract float %929, 2.000000e+00
  %931 = fadd contract float %859, %926
  %932 = fadd contract float %860, %928
  %933 = fadd contract float %861, %930
  br i1 %443, label %945, label %934

934:                                              ; preds = %921
  %935 = icmp slt i32 %410, %6
  %936 = icmp sgt i32 %19, -2
  %937 = select i1 %935, i1 %936, i1 false
  %938 = icmp slt i32 %757, %7
  %939 = select i1 %937, i1 %938, i1 false
  br i1 %939, label %940, label %945

940:                                              ; preds = %934
  %941 = sext i32 %904 to i64
  %942 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %941
  %943 = load i32, i32 addrspace(1)* %942, align 4, !tbaa !11, !amdgpu.noclobber !5
  %944 = icmp eq i32 %943, 0
  br i1 %944, label %945, label %974

945:                                              ; preds = %940, %934, %921
  %946 = icmp slt i32 %412, 0
  %947 = icmp slt i32 %412, %4
  %948 = select i1 %947, i32 %412, i32 %43
  %949 = select i1 %946, i32 0, i32 %948
  %950 = icmp slt i32 %760, 0
  %951 = icmp slt i32 %760, %5
  %952 = select i1 %951, i32 %760, i32 %44
  %953 = select i1 %950, i32 0, i32 %952
  %954 = mul nsw i32 %953, %4
  %955 = add nsw i32 %954, %949
  %956 = mul nsw i32 %955, 3
  %957 = sext i32 %956 to i64
  %958 = getelementptr inbounds float, float addrspace(1)* %0, i64 %957
  %959 = load float, float addrspace(1)* %958, align 4, !tbaa !7, !amdgpu.noclobber !5
  %960 = fmul contract float %959, 2.000000e+00
  %961 = fadd contract float %903, %960
  %962 = add nsw i32 %956, 1
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds float, float addrspace(1)* %0, i64 %963
  %965 = load float, float addrspace(1)* %964, align 4, !tbaa !7, !amdgpu.noclobber !5
  %966 = fmul contract float %965, 2.000000e+00
  %967 = fadd contract float %901, %966
  %968 = add nsw i32 %956, 2
  %969 = sext i32 %968 to i64
  %970 = getelementptr inbounds float, float addrspace(1)* %0, i64 %969
  %971 = load float, float addrspace(1)* %970, align 4, !tbaa !7, !amdgpu.noclobber !5
  %972 = fmul contract float %971, 2.000000e+00
  %973 = fadd contract float %902, %972
  br label %974

974:                                              ; preds = %945, %940
  %975 = phi float [ %967, %945 ], [ %901, %940 ]
  %976 = phi float [ %973, %945 ], [ %902, %940 ]
  %977 = phi float [ %961, %945 ], [ %903, %940 ]
  %978 = add nsw i32 %19, 2
  %979 = mul nsw i32 %978, %6
  %980 = add nsw i32 %979, %45
  %981 = add nsw i32 %978, %8
  br i1 %51, label %982, label %998

982:                                              ; preds = %974
  %983 = icmp slt i32 %45, %6
  %984 = icmp sgt i32 %19, -3
  %985 = select i1 %983, i1 %984, i1 false
  %986 = icmp slt i32 %978, %7
  %987 = select i1 %985, i1 %986, i1 false
  br i1 %987, label %988, label %998

988:                                              ; preds = %982
  %989 = mul nsw i32 %980, 3
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds float, float addrspace(1)* %1, i64 %990
  %992 = add nsw i32 %989, 1
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds float, float addrspace(1)* %1, i64 %993
  %995 = add nsw i32 %989, 2
  %996 = sext i32 %995 to i64
  %997 = getelementptr inbounds float, float addrspace(1)* %1, i64 %996
  br label %998

998:                                              ; preds = %974, %982, %988
  %999 = phi float addrspace(1)* [ %997, %988 ], [ %42, %982 ], [ %42, %974 ]
  %1000 = phi float addrspace(1)* [ %994, %988 ], [ %39, %982 ], [ %39, %974 ]
  %1001 = phi float addrspace(1)* [ %991, %988 ], [ %36, %982 ], [ %36, %974 ]
  %1002 = load float, float addrspace(1)* %1001, align 4, !tbaa !7
  %1003 = load float, float addrspace(1)* %1000, align 4, !tbaa !7
  %1004 = load float, float addrspace(1)* %999, align 4, !tbaa !7
  %1005 = fadd contract float %931, %1002
  %1006 = fadd contract float %932, %1003
  %1007 = fadd contract float %933, %1004
  br i1 %78, label %1019, label %1008

1008:                                             ; preds = %998
  %1009 = icmp slt i32 %45, %6
  %1010 = icmp sgt i32 %19, -3
  %1011 = select i1 %1009, i1 %1010, i1 false
  %1012 = icmp slt i32 %978, %7
  %1013 = select i1 %1011, i1 %1012, i1 false
  br i1 %1013, label %1014, label %1019

1014:                                             ; preds = %1008
  %1015 = sext i32 %980 to i64
  %1016 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %1015
  %1017 = load i32, i32 addrspace(1)* %1016, align 4, !tbaa !11, !amdgpu.noclobber !5
  %1018 = icmp eq i32 %1017, 0
  br i1 %1018, label %1019, label %1045

1019:                                             ; preds = %1014, %1008, %998
  %1020 = icmp slt i32 %49, 0
  %1021 = icmp slt i32 %49, %4
  %1022 = select i1 %1021, i32 %49, i32 %43
  %1023 = select i1 %1020, i32 0, i32 %1022
  %1024 = icmp slt i32 %981, 0
  %1025 = icmp slt i32 %981, %5
  %1026 = select i1 %1025, i32 %981, i32 %44
  %1027 = select i1 %1024, i32 0, i32 %1026
  %1028 = mul nsw i32 %1027, %4
  %1029 = add nsw i32 %1028, %1023
  %1030 = mul nsw i32 %1029, 3
  %1031 = sext i32 %1030 to i64
  %1032 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1031
  %1033 = load float, float addrspace(1)* %1032, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1034 = fadd contract float %977, %1033
  %1035 = add nsw i32 %1030, 1
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1036
  %1038 = load float, float addrspace(1)* %1037, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1039 = fadd contract float %975, %1038
  %1040 = add nsw i32 %1030, 2
  %1041 = sext i32 %1040 to i64
  %1042 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1041
  %1043 = load float, float addrspace(1)* %1042, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1044 = fadd contract float %976, %1043
  br label %1045

1045:                                             ; preds = %1019, %1014
  %1046 = phi float [ %1039, %1019 ], [ %975, %1014 ]
  %1047 = phi float [ %1044, %1019 ], [ %976, %1014 ]
  %1048 = phi float [ %1034, %1019 ], [ %977, %1014 ]
  %1049 = add nsw i32 %979, %27
  br i1 %122, label %1050, label %1064

1050:                                             ; preds = %1045
  %1051 = icmp sgt i32 %19, -3
  %1052 = icmp slt i32 %978, %7
  %1053 = select i1 %1051, i1 %1052, i1 false
  br i1 %1053, label %1054, label %1064

1054:                                             ; preds = %1050
  %1055 = mul nsw i32 %1049, 3
  %1056 = sext i32 %1055 to i64
  %1057 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1056
  %1058 = add nsw i32 %1055, 1
  %1059 = sext i32 %1058 to i64
  %1060 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1059
  %1061 = add nsw i32 %1055, 2
  %1062 = sext i32 %1061 to i64
  %1063 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1062
  br label %1064

1064:                                             ; preds = %1045, %1050, %1054
  %1065 = phi float addrspace(1)* [ %1063, %1054 ], [ %42, %1050 ], [ %42, %1045 ]
  %1066 = phi float addrspace(1)* [ %1060, %1054 ], [ %39, %1050 ], [ %39, %1045 ]
  %1067 = phi float addrspace(1)* [ %1057, %1054 ], [ %36, %1050 ], [ %36, %1045 ]
  %1068 = load float, float addrspace(1)* %1067, align 4, !tbaa !7
  %1069 = load float, float addrspace(1)* %1066, align 4, !tbaa !7
  %1070 = load float, float addrspace(1)* %1065, align 4, !tbaa !7
  %1071 = fadd contract float %1005, %1068
  %1072 = fadd contract float %1006, %1069
  %1073 = fadd contract float %1007, %1070
  br i1 %147, label %1083, label %1074

1074:                                             ; preds = %1064
  %1075 = icmp sgt i32 %19, -3
  %1076 = icmp slt i32 %978, %7
  %1077 = select i1 %1075, i1 %1076, i1 false
  br i1 %1077, label %1078, label %1083

1078:                                             ; preds = %1074
  %1079 = sext i32 %1049 to i64
  %1080 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %1079
  %1081 = load i32, i32 addrspace(1)* %1080, align 4, !tbaa !11, !amdgpu.noclobber !5
  %1082 = icmp eq i32 %1081, 0
  br i1 %1082, label %1083, label %1109

1083:                                             ; preds = %1078, %1074, %1064
  %1084 = icmp slt i32 %121, 0
  %1085 = icmp slt i32 %121, %4
  %1086 = select i1 %1085, i32 %121, i32 %43
  %1087 = select i1 %1084, i32 0, i32 %1086
  %1088 = icmp slt i32 %981, 0
  %1089 = icmp slt i32 %981, %5
  %1090 = select i1 %1089, i32 %981, i32 %44
  %1091 = select i1 %1088, i32 0, i32 %1090
  %1092 = mul nsw i32 %1091, %4
  %1093 = add nsw i32 %1092, %1087
  %1094 = mul nsw i32 %1093, 3
  %1095 = sext i32 %1094 to i64
  %1096 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1095
  %1097 = load float, float addrspace(1)* %1096, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1098 = fadd contract float %1048, %1097
  %1099 = add nsw i32 %1094, 1
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1100
  %1102 = load float, float addrspace(1)* %1101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1103 = fadd contract float %1046, %1102
  %1104 = add nsw i32 %1094, 2
  %1105 = sext i32 %1104 to i64
  %1106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1105
  %1107 = load float, float addrspace(1)* %1106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1108 = fadd contract float %1047, %1107
  br label %1109

1109:                                             ; preds = %1083, %1078
  %1110 = phi float [ %1103, %1083 ], [ %1046, %1078 ]
  %1111 = phi float [ %1108, %1083 ], [ %1047, %1078 ]
  %1112 = phi float [ %1098, %1083 ], [ %1048, %1078 ]
  %1113 = add nsw i32 %979, %187
  br i1 %190, label %1114, label %1130

1114:                                             ; preds = %1109
  %1115 = icmp slt i32 %187, %6
  %1116 = icmp sgt i32 %19, -3
  %1117 = select i1 %1115, i1 %1116, i1 false
  %1118 = icmp slt i32 %978, %7
  %1119 = select i1 %1117, i1 %1118, i1 false
  br i1 %1119, label %1120, label %1130

1120:                                             ; preds = %1114
  %1121 = mul nsw i32 %1113, 3
  %1122 = sext i32 %1121 to i64
  %1123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1122
  %1124 = add nsw i32 %1121, 1
  %1125 = sext i32 %1124 to i64
  %1126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1125
  %1127 = add nsw i32 %1121, 2
  %1128 = sext i32 %1127 to i64
  %1129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1128
  br label %1130

1130:                                             ; preds = %1109, %1114, %1120
  %1131 = phi float addrspace(1)* [ %1129, %1120 ], [ %42, %1114 ], [ %42, %1109 ]
  %1132 = phi float addrspace(1)* [ %1126, %1120 ], [ %39, %1114 ], [ %39, %1109 ]
  %1133 = phi float addrspace(1)* [ %1123, %1120 ], [ %36, %1114 ], [ %36, %1109 ]
  %1134 = load float, float addrspace(1)* %1133, align 4, !tbaa !7
  %1135 = load float, float addrspace(1)* %1132, align 4, !tbaa !7
  %1136 = load float, float addrspace(1)* %1131, align 4, !tbaa !7
  %1137 = fadd contract float %1071, %1134
  %1138 = fadd contract float %1072, %1135
  %1139 = fadd contract float %1073, %1136
  br i1 %217, label %1151, label %1140

1140:                                             ; preds = %1130
  %1141 = icmp slt i32 %187, %6
  %1142 = icmp sgt i32 %19, -3
  %1143 = select i1 %1141, i1 %1142, i1 false
  %1144 = icmp slt i32 %978, %7
  %1145 = select i1 %1143, i1 %1144, i1 false
  br i1 %1145, label %1146, label %1151

1146:                                             ; preds = %1140
  %1147 = sext i32 %1113 to i64
  %1148 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %1147
  %1149 = load i32, i32 addrspace(1)* %1148, align 4, !tbaa !11, !amdgpu.noclobber !5
  %1150 = icmp eq i32 %1149, 0
  br i1 %1150, label %1151, label %1177

1151:                                             ; preds = %1146, %1140, %1130
  %1152 = icmp slt i32 %189, 0
  %1153 = icmp slt i32 %189, %4
  %1154 = select i1 %1153, i32 %189, i32 %43
  %1155 = select i1 %1152, i32 0, i32 %1154
  %1156 = icmp slt i32 %981, 0
  %1157 = icmp slt i32 %981, %5
  %1158 = select i1 %1157, i32 %981, i32 %44
  %1159 = select i1 %1156, i32 0, i32 %1158
  %1160 = mul nsw i32 %1159, %4
  %1161 = add nsw i32 %1160, %1155
  %1162 = mul nsw i32 %1161, 3
  %1163 = sext i32 %1162 to i64
  %1164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1163
  %1165 = load float, float addrspace(1)* %1164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1166 = fadd contract float %1112, %1165
  %1167 = add nsw i32 %1162, 1
  %1168 = sext i32 %1167 to i64
  %1169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1168
  %1170 = load float, float addrspace(1)* %1169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1171 = fadd contract float %1110, %1170
  %1172 = add nsw i32 %1162, 2
  %1173 = sext i32 %1172 to i64
  %1174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1173
  %1175 = load float, float addrspace(1)* %1174, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1176 = fadd contract float %1111, %1175
  br label %1177

1177:                                             ; preds = %1151, %1146
  %1178 = phi float [ %1171, %1151 ], [ %1110, %1146 ]
  %1179 = phi float [ %1176, %1151 ], [ %1111, %1146 ]
  %1180 = phi float [ %1166, %1151 ], [ %1112, %1146 ]
  %1181 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1182 = fdiv contract float %1137, 2.400000e+01
  %1183 = fsub contract float %1181, %1182
  %1184 = fdiv contract float %1180, 2.400000e+01
  %1185 = fadd contract float %1184, %1183
  %1186 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  store float %1185, float addrspace(1)* %1186, align 4, !tbaa !7
  %1187 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %1188 = fdiv contract float %1138, 2.400000e+01
  %1189 = fsub contract float %1187, %1188
  %1190 = fdiv contract float %1178, 2.400000e+01
  %1191 = fadd contract float %1190, %1189
  %1192 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  store float %1191, float addrspace(1)* %1192, align 4, !tbaa !7
  %1193 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %1194 = fdiv contract float %1139, 2.400000e+01
  %1195 = fsub contract float %1193, %1194
  %1196 = fdiv contract float %1179, 2.400000e+01
  %1197 = fadd contract float %1196, %1195
  %1198 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  store float %1197, float addrspace(1)* %1198, align 4, !tbaa !7
  br label %1199

1199:                                             ; preds = %1177, %10
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
