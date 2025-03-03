; ModuleID = '../data/hip_kernels/553/13/main.cu'
source_filename = "../data/hip_kernels/553/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14CalculateFixedPKfS0_S0_Pfiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
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
  %29 = add nsw i32 %28, %27
  %30 = icmp slt i32 %19, %7
  %31 = icmp slt i32 %27, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %1204

33:                                               ; preds = %10
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fcmp contract ogt float %36, 1.270000e+02
  br i1 %37, label %38, label %1204

38:                                               ; preds = %33
  %39 = mul nsw i32 %29, 3
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = add nsw i32 %39, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = add nsw i32 %39, 2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = add nsw i32 %4, -1
  %49 = add nsw i32 %5, -1
  %50 = add nsw i32 %27, -2
  %51 = add nsw i32 %19, -2
  %52 = mul nsw i32 %51, %6
  %53 = add nsw i32 %52, %50
  %54 = add nsw i32 %50, %9
  %55 = add nsw i32 %51, %8
  %56 = icmp sgt i32 %27, 1
  br i1 %56, label %57, label %73

57:                                               ; preds = %38
  %58 = icmp slt i32 %50, %6
  %59 = icmp sgt i32 %19, 1
  %60 = select i1 %58, i1 %59, i1 false
  %61 = icmp slt i32 %51, %7
  %62 = select i1 %60, i1 %61, i1 false
  br i1 %62, label %63, label %73

63:                                               ; preds = %57
  %64 = mul nsw i32 %53, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = add nsw i32 %64, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = add nsw i32 %64, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  br label %73

73:                                               ; preds = %38, %57, %63
  %74 = phi float addrspace(1)* [ %72, %63 ], [ %47, %57 ], [ %47, %38 ]
  %75 = phi float addrspace(1)* [ %69, %63 ], [ %44, %57 ], [ %44, %38 ]
  %76 = phi float addrspace(1)* [ %66, %63 ], [ %41, %57 ], [ %41, %38 ]
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %79 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %80 = fadd contract float %77, 0.000000e+00
  %81 = fadd contract float %78, 0.000000e+00
  %82 = fadd contract float %79, 0.000000e+00
  %83 = icmp slt i32 %27, 2
  br i1 %83, label %95, label %84

84:                                               ; preds = %73
  %85 = icmp slt i32 %50, %6
  %86 = icmp sgt i32 %19, 1
  %87 = select i1 %85, i1 %86, i1 false
  %88 = icmp slt i32 %51, %7
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %95

90:                                               ; preds = %84
  %91 = sext i32 %53 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fcmp contract olt float %93, 1.270000e+02
  br i1 %94, label %95, label %121

95:                                               ; preds = %90, %84, %73
  %96 = icmp slt i32 %54, 0
  %97 = icmp slt i32 %54, %4
  %98 = select i1 %97, i32 %54, i32 %48
  %99 = select i1 %96, i32 0, i32 %98
  %100 = icmp slt i32 %55, 0
  %101 = icmp slt i32 %55, %5
  %102 = select i1 %101, i32 %55, i32 %49
  %103 = select i1 %100, i32 0, i32 %102
  %104 = mul nsw i32 %103, %4
  %105 = add nsw i32 %104, %99
  %106 = mul nsw i32 %105, 3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fadd contract float %109, 0.000000e+00
  %111 = add nsw i32 %106, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fadd contract float %114, 0.000000e+00
  %116 = add nsw i32 %106, 2
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fadd contract float %119, 0.000000e+00
  br label %121

121:                                              ; preds = %95, %90
  %122 = phi float [ %115, %95 ], [ 0.000000e+00, %90 ]
  %123 = phi float [ %120, %95 ], [ 0.000000e+00, %90 ]
  %124 = phi float [ %110, %95 ], [ 0.000000e+00, %90 ]
  %125 = add nsw i32 %52, %27
  %126 = add nsw i32 %27, %9
  %127 = icmp sgt i32 %27, -1
  br i1 %127, label %128, label %142

128:                                              ; preds = %121
  %129 = icmp sgt i32 %19, 1
  %130 = icmp slt i32 %51, %7
  %131 = select i1 %129, i1 %130, i1 false
  br i1 %131, label %132, label %142

132:                                              ; preds = %128
  %133 = mul nsw i32 %125, 3
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = add nsw i32 %133, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = add nsw i32 %133, 2
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  br label %142

142:                                              ; preds = %121, %128, %132
  %143 = phi float addrspace(1)* [ %141, %132 ], [ %47, %128 ], [ %47, %121 ]
  %144 = phi float addrspace(1)* [ %138, %132 ], [ %44, %128 ], [ %44, %121 ]
  %145 = phi float addrspace(1)* [ %135, %132 ], [ %41, %128 ], [ %41, %121 ]
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %148 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %149 = fadd contract float %80, %146
  %150 = fadd contract float %81, %147
  %151 = fadd contract float %82, %148
  %152 = icmp slt i32 %27, 0
  br i1 %152, label %162, label %153

153:                                              ; preds = %142
  %154 = icmp sgt i32 %19, 1
  %155 = icmp slt i32 %51, %7
  %156 = select i1 %154, i1 %155, i1 false
  br i1 %156, label %157, label %162

157:                                              ; preds = %153
  %158 = sext i32 %125 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = fcmp contract olt float %160, 1.270000e+02
  br i1 %161, label %162, label %188

162:                                              ; preds = %157, %153, %142
  %163 = icmp slt i32 %126, 0
  %164 = icmp slt i32 %126, %4
  %165 = select i1 %164, i32 %126, i32 %48
  %166 = select i1 %163, i32 0, i32 %165
  %167 = icmp slt i32 %55, 0
  %168 = icmp slt i32 %55, %5
  %169 = select i1 %168, i32 %55, i32 %49
  %170 = select i1 %167, i32 0, i32 %169
  %171 = mul nsw i32 %170, %4
  %172 = add nsw i32 %171, %166
  %173 = mul nsw i32 %172, 3
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7, !amdgpu.noclobber !5
  %177 = fadd contract float %124, %176
  %178 = add nsw i32 %173, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !5
  %182 = fadd contract float %122, %181
  %183 = add nsw i32 %173, 2
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !5
  %187 = fadd contract float %123, %186
  br label %188

188:                                              ; preds = %162, %157
  %189 = phi float [ %182, %162 ], [ %122, %157 ]
  %190 = phi float [ %187, %162 ], [ %123, %157 ]
  %191 = phi float [ %177, %162 ], [ %124, %157 ]
  %192 = add nsw i32 %27, 2
  %193 = add nsw i32 %52, %192
  %194 = add nsw i32 %192, %9
  %195 = icmp sgt i32 %27, -3
  br i1 %195, label %196, label %212

196:                                              ; preds = %188
  %197 = icmp slt i32 %192, %6
  %198 = icmp sgt i32 %19, 1
  %199 = select i1 %197, i1 %198, i1 false
  %200 = icmp slt i32 %51, %7
  %201 = select i1 %199, i1 %200, i1 false
  br i1 %201, label %202, label %212

202:                                              ; preds = %196
  %203 = mul nsw i32 %193, 3
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  %206 = add nsw i32 %203, 1
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = add nsw i32 %203, 2
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %1, i64 %210
  br label %212

212:                                              ; preds = %188, %196, %202
  %213 = phi float addrspace(1)* [ %211, %202 ], [ %47, %196 ], [ %47, %188 ]
  %214 = phi float addrspace(1)* [ %208, %202 ], [ %44, %196 ], [ %44, %188 ]
  %215 = phi float addrspace(1)* [ %205, %202 ], [ %41, %196 ], [ %41, %188 ]
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %217 = load float, float addrspace(1)* %214, align 4, !tbaa !7
  %218 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %219 = fadd contract float %149, %216
  %220 = fadd contract float %150, %217
  %221 = fadd contract float %151, %218
  %222 = icmp slt i32 %27, -2
  br i1 %222, label %234, label %223

223:                                              ; preds = %212
  %224 = icmp slt i32 %192, %6
  %225 = icmp sgt i32 %19, 1
  %226 = select i1 %224, i1 %225, i1 false
  %227 = icmp slt i32 %51, %7
  %228 = select i1 %226, i1 %227, i1 false
  br i1 %228, label %229, label %234

229:                                              ; preds = %223
  %230 = sext i32 %193 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %2, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = fcmp contract olt float %232, 1.270000e+02
  br i1 %233, label %234, label %260

234:                                              ; preds = %229, %223, %212
  %235 = icmp slt i32 %194, 0
  %236 = icmp slt i32 %194, %4
  %237 = select i1 %236, i32 %194, i32 %48
  %238 = select i1 %235, i32 0, i32 %237
  %239 = icmp slt i32 %55, 0
  %240 = icmp slt i32 %55, %5
  %241 = select i1 %240, i32 %55, i32 %49
  %242 = select i1 %239, i32 0, i32 %241
  %243 = mul nsw i32 %242, %4
  %244 = add nsw i32 %243, %238
  %245 = mul nsw i32 %244, 3
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !7, !amdgpu.noclobber !5
  %249 = fadd contract float %191, %248
  %250 = add nsw i32 %245, 1
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !5
  %254 = fadd contract float %189, %253
  %255 = add nsw i32 %245, 2
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %0, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7, !amdgpu.noclobber !5
  %259 = fadd contract float %190, %258
  br label %260

260:                                              ; preds = %234, %229
  %261 = phi float [ %254, %234 ], [ %189, %229 ]
  %262 = phi float [ %259, %234 ], [ %190, %229 ]
  %263 = phi float [ %249, %234 ], [ %191, %229 ]
  %264 = add nsw i32 %27, -1
  %265 = add nsw i32 %19, -1
  %266 = mul nsw i32 %265, %6
  %267 = add nsw i32 %266, %264
  %268 = add nsw i32 %264, %9
  %269 = add nsw i32 %265, %8
  %270 = icmp sgt i32 %27, 0
  br i1 %270, label %271, label %287

271:                                              ; preds = %260
  %272 = icmp sle i32 %27, %6
  %273 = icmp sgt i32 %19, 0
  %274 = select i1 %272, i1 %273, i1 false
  %275 = icmp sle i32 %19, %7
  %276 = select i1 %274, i1 %275, i1 false
  br i1 %276, label %277, label %287

277:                                              ; preds = %271
  %278 = mul nsw i32 %267, 3
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %1, i64 %279
  %281 = add nsw i32 %278, 1
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  %284 = add nsw i32 %278, 2
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %1, i64 %285
  br label %287

287:                                              ; preds = %260, %271, %277
  %288 = phi float addrspace(1)* [ %286, %277 ], [ %47, %271 ], [ %47, %260 ]
  %289 = phi float addrspace(1)* [ %283, %277 ], [ %44, %271 ], [ %44, %260 ]
  %290 = phi float addrspace(1)* [ %280, %277 ], [ %41, %271 ], [ %41, %260 ]
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7
  %292 = fmul contract float %291, 2.000000e+00
  %293 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %294 = fmul contract float %293, 2.000000e+00
  %295 = load float, float addrspace(1)* %288, align 4, !tbaa !7
  %296 = fmul contract float %295, 2.000000e+00
  %297 = fadd contract float %219, %292
  %298 = fadd contract float %220, %294
  %299 = fadd contract float %221, %296
  %300 = icmp slt i32 %27, 1
  br i1 %300, label %312, label %301

301:                                              ; preds = %287
  %302 = icmp sle i32 %27, %6
  %303 = icmp sgt i32 %19, 0
  %304 = select i1 %302, i1 %303, i1 false
  %305 = icmp sle i32 %19, %7
  %306 = select i1 %304, i1 %305, i1 false
  br i1 %306, label %307, label %312

307:                                              ; preds = %301
  %308 = sext i32 %267 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %2, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7, !amdgpu.noclobber !5
  %311 = fcmp contract olt float %310, 1.270000e+02
  br i1 %311, label %312, label %341

312:                                              ; preds = %307, %301, %287
  %313 = icmp slt i32 %268, 0
  %314 = icmp slt i32 %268, %4
  %315 = select i1 %314, i32 %268, i32 %48
  %316 = select i1 %313, i32 0, i32 %315
  %317 = icmp slt i32 %269, 0
  %318 = icmp slt i32 %269, %5
  %319 = select i1 %318, i32 %269, i32 %49
  %320 = select i1 %317, i32 0, i32 %319
  %321 = mul nsw i32 %320, %4
  %322 = add nsw i32 %321, %316
  %323 = mul nsw i32 %322, 3
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds float, float addrspace(1)* %0, i64 %324
  %326 = load float, float addrspace(1)* %325, align 4, !tbaa !7, !amdgpu.noclobber !5
  %327 = fmul contract float %326, 2.000000e+00
  %328 = fadd contract float %263, %327
  %329 = add nsw i32 %323, 1
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %0, i64 %330
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !7, !amdgpu.noclobber !5
  %333 = fmul contract float %332, 2.000000e+00
  %334 = fadd contract float %261, %333
  %335 = add nsw i32 %323, 2
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %0, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7, !amdgpu.noclobber !5
  %339 = fmul contract float %338, 2.000000e+00
  %340 = fadd contract float %262, %339
  br label %341

341:                                              ; preds = %312, %307
  %342 = phi float [ %334, %312 ], [ %261, %307 ]
  %343 = phi float [ %340, %312 ], [ %262, %307 ]
  %344 = phi float [ %328, %312 ], [ %263, %307 ]
  %345 = add nsw i32 %266, %27
  br i1 %127, label %346, label %360

346:                                              ; preds = %341
  %347 = icmp sgt i32 %19, 0
  %348 = icmp sle i32 %19, %7
  %349 = select i1 %347, i1 %348, i1 false
  br i1 %349, label %350, label %360

350:                                              ; preds = %346
  %351 = mul nsw i32 %345, 3
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds float, float addrspace(1)* %1, i64 %352
  %354 = add nsw i32 %351, 1
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %1, i64 %355
  %357 = add nsw i32 %351, 2
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %1, i64 %358
  br label %360

360:                                              ; preds = %341, %346, %350
  %361 = phi float addrspace(1)* [ %359, %350 ], [ %47, %346 ], [ %47, %341 ]
  %362 = phi float addrspace(1)* [ %356, %350 ], [ %44, %346 ], [ %44, %341 ]
  %363 = phi float addrspace(1)* [ %353, %350 ], [ %41, %346 ], [ %41, %341 ]
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !7
  %365 = fmul contract float %364, 2.000000e+00
  %366 = load float, float addrspace(1)* %362, align 4, !tbaa !7
  %367 = fmul contract float %366, 2.000000e+00
  %368 = load float, float addrspace(1)* %361, align 4, !tbaa !7
  %369 = fmul contract float %368, 2.000000e+00
  %370 = fadd contract float %297, %365
  %371 = fadd contract float %298, %367
  %372 = fadd contract float %299, %369
  br i1 %152, label %382, label %373

373:                                              ; preds = %360
  %374 = icmp sgt i32 %19, 0
  %375 = icmp sle i32 %19, %7
  %376 = select i1 %374, i1 %375, i1 false
  br i1 %376, label %377, label %382

377:                                              ; preds = %373
  %378 = sext i32 %345 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %2, i64 %378
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !7, !amdgpu.noclobber !5
  %381 = fcmp contract olt float %380, 1.270000e+02
  br i1 %381, label %382, label %411

382:                                              ; preds = %377, %373, %360
  %383 = icmp slt i32 %126, 0
  %384 = icmp slt i32 %126, %4
  %385 = select i1 %384, i32 %126, i32 %48
  %386 = select i1 %383, i32 0, i32 %385
  %387 = icmp slt i32 %269, 0
  %388 = icmp slt i32 %269, %5
  %389 = select i1 %388, i32 %269, i32 %49
  %390 = select i1 %387, i32 0, i32 %389
  %391 = mul nsw i32 %390, %4
  %392 = add nsw i32 %391, %386
  %393 = mul nsw i32 %392, 3
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %0, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !7, !amdgpu.noclobber !5
  %397 = fmul contract float %396, 2.000000e+00
  %398 = fadd contract float %344, %397
  %399 = add nsw i32 %393, 1
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds float, float addrspace(1)* %0, i64 %400
  %402 = load float, float addrspace(1)* %401, align 4, !tbaa !7, !amdgpu.noclobber !5
  %403 = fmul contract float %402, 2.000000e+00
  %404 = fadd contract float %342, %403
  %405 = add nsw i32 %393, 2
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %0, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !7, !amdgpu.noclobber !5
  %409 = fmul contract float %408, 2.000000e+00
  %410 = fadd contract float %343, %409
  br label %411

411:                                              ; preds = %382, %377
  %412 = phi float [ %404, %382 ], [ %342, %377 ]
  %413 = phi float [ %410, %382 ], [ %343, %377 ]
  %414 = phi float [ %398, %382 ], [ %344, %377 ]
  %415 = add nsw i32 %27, 1
  %416 = add nsw i32 %266, %415
  %417 = add nsw i32 %415, %9
  %418 = icmp sgt i32 %27, -2
  br i1 %418, label %419, label %435

419:                                              ; preds = %411
  %420 = icmp slt i32 %415, %6
  %421 = icmp sgt i32 %19, 0
  %422 = select i1 %420, i1 %421, i1 false
  %423 = icmp sle i32 %19, %7
  %424 = select i1 %422, i1 %423, i1 false
  br i1 %424, label %425, label %435

425:                                              ; preds = %419
  %426 = mul nsw i32 %416, 3
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %1, i64 %427
  %429 = add nsw i32 %426, 1
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds float, float addrspace(1)* %1, i64 %430
  %432 = add nsw i32 %426, 2
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds float, float addrspace(1)* %1, i64 %433
  br label %435

435:                                              ; preds = %411, %419, %425
  %436 = phi float addrspace(1)* [ %434, %425 ], [ %47, %419 ], [ %47, %411 ]
  %437 = phi float addrspace(1)* [ %431, %425 ], [ %44, %419 ], [ %44, %411 ]
  %438 = phi float addrspace(1)* [ %428, %425 ], [ %41, %419 ], [ %41, %411 ]
  %439 = load float, float addrspace(1)* %438, align 4, !tbaa !7
  %440 = fmul contract float %439, 2.000000e+00
  %441 = load float, float addrspace(1)* %437, align 4, !tbaa !7
  %442 = fmul contract float %441, 2.000000e+00
  %443 = load float, float addrspace(1)* %436, align 4, !tbaa !7
  %444 = fmul contract float %443, 2.000000e+00
  %445 = fadd contract float %370, %440
  %446 = fadd contract float %371, %442
  %447 = fadd contract float %372, %444
  %448 = icmp slt i32 %27, -1
  br i1 %448, label %460, label %449

449:                                              ; preds = %435
  %450 = icmp slt i32 %415, %6
  %451 = icmp sgt i32 %19, 0
  %452 = select i1 %450, i1 %451, i1 false
  %453 = icmp sle i32 %19, %7
  %454 = select i1 %452, i1 %453, i1 false
  br i1 %454, label %455, label %460

455:                                              ; preds = %449
  %456 = sext i32 %416 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %2, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !7, !amdgpu.noclobber !5
  %459 = fcmp contract olt float %458, 1.270000e+02
  br i1 %459, label %460, label %489

460:                                              ; preds = %455, %449, %435
  %461 = icmp slt i32 %417, 0
  %462 = icmp slt i32 %417, %4
  %463 = select i1 %462, i32 %417, i32 %48
  %464 = select i1 %461, i32 0, i32 %463
  %465 = icmp slt i32 %269, 0
  %466 = icmp slt i32 %269, %5
  %467 = select i1 %466, i32 %269, i32 %49
  %468 = select i1 %465, i32 0, i32 %467
  %469 = mul nsw i32 %468, %4
  %470 = add nsw i32 %469, %464
  %471 = mul nsw i32 %470, 3
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds float, float addrspace(1)* %0, i64 %472
  %474 = load float, float addrspace(1)* %473, align 4, !tbaa !7, !amdgpu.noclobber !5
  %475 = fmul contract float %474, 2.000000e+00
  %476 = fadd contract float %414, %475
  %477 = add nsw i32 %471, 1
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds float, float addrspace(1)* %0, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !7, !amdgpu.noclobber !5
  %481 = fmul contract float %480, 2.000000e+00
  %482 = fadd contract float %412, %481
  %483 = add nsw i32 %471, 2
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds float, float addrspace(1)* %0, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !7, !amdgpu.noclobber !5
  %487 = fmul contract float %486, 2.000000e+00
  %488 = fadd contract float %413, %487
  br label %489

489:                                              ; preds = %460, %455
  %490 = phi float [ %482, %460 ], [ %412, %455 ]
  %491 = phi float [ %488, %460 ], [ %413, %455 ]
  %492 = phi float [ %476, %460 ], [ %414, %455 ]
  %493 = add nsw i32 %28, %50
  %494 = add nsw i32 %19, %8
  br i1 %56, label %495, label %509

495:                                              ; preds = %489
  %496 = icmp slt i32 %50, %6
  %497 = icmp sgt i32 %19, -1
  %498 = select i1 %496, i1 %497, i1 false
  br i1 %498, label %499, label %509

499:                                              ; preds = %495
  %500 = mul nsw i32 %493, 3
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds float, float addrspace(1)* %1, i64 %501
  %503 = add nsw i32 %500, 1
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds float, float addrspace(1)* %1, i64 %504
  %506 = add nsw i32 %500, 2
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float addrspace(1)* %1, i64 %507
  br label %509

509:                                              ; preds = %489, %495, %499
  %510 = phi float addrspace(1)* [ %508, %499 ], [ %47, %495 ], [ %47, %489 ]
  %511 = phi float addrspace(1)* [ %505, %499 ], [ %44, %495 ], [ %44, %489 ]
  %512 = phi float addrspace(1)* [ %502, %499 ], [ %41, %495 ], [ %41, %489 ]
  %513 = load float, float addrspace(1)* %512, align 4, !tbaa !7
  %514 = load float, float addrspace(1)* %511, align 4, !tbaa !7
  %515 = load float, float addrspace(1)* %510, align 4, !tbaa !7
  %516 = fadd contract float %445, %513
  %517 = fadd contract float %446, %514
  %518 = fadd contract float %447, %515
  br i1 %83, label %528, label %519

519:                                              ; preds = %509
  %520 = icmp slt i32 %50, %6
  %521 = icmp sgt i32 %19, -1
  %522 = select i1 %520, i1 %521, i1 false
  br i1 %522, label %523, label %528

523:                                              ; preds = %519
  %524 = sext i32 %493 to i64
  %525 = getelementptr inbounds float, float addrspace(1)* %2, i64 %524
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !7, !amdgpu.noclobber !5
  %527 = fcmp contract olt float %526, 1.270000e+02
  br i1 %527, label %528, label %554

528:                                              ; preds = %523, %519, %509
  %529 = icmp slt i32 %54, 0
  %530 = icmp slt i32 %54, %4
  %531 = select i1 %530, i32 %54, i32 %48
  %532 = select i1 %529, i32 0, i32 %531
  %533 = icmp slt i32 %494, 0
  %534 = icmp slt i32 %494, %5
  %535 = select i1 %534, i32 %494, i32 %49
  %536 = select i1 %533, i32 0, i32 %535
  %537 = mul nsw i32 %536, %4
  %538 = add nsw i32 %537, %532
  %539 = mul nsw i32 %538, 3
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %0, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !7, !amdgpu.noclobber !5
  %543 = fadd contract float %492, %542
  %544 = add nsw i32 %539, 1
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %0, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !7, !amdgpu.noclobber !5
  %548 = fadd contract float %490, %547
  %549 = add nsw i32 %539, 2
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds float, float addrspace(1)* %0, i64 %550
  %552 = load float, float addrspace(1)* %551, align 4, !tbaa !7, !amdgpu.noclobber !5
  %553 = fadd contract float %491, %552
  br label %554

554:                                              ; preds = %528, %523
  %555 = phi float [ %548, %528 ], [ %490, %523 ]
  %556 = phi float [ %553, %528 ], [ %491, %523 ]
  %557 = phi float [ %543, %528 ], [ %492, %523 ]
  %558 = add nsw i32 %28, %264
  br i1 %270, label %559, label %573

559:                                              ; preds = %554
  %560 = icmp sle i32 %27, %6
  %561 = icmp sgt i32 %19, -1
  %562 = select i1 %560, i1 %561, i1 false
  br i1 %562, label %563, label %573

563:                                              ; preds = %559
  %564 = mul nsw i32 %558, 3
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %1, i64 %565
  %567 = add nsw i32 %564, 1
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %1, i64 %568
  %570 = add nsw i32 %564, 2
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds float, float addrspace(1)* %1, i64 %571
  br label %573

573:                                              ; preds = %554, %559, %563
  %574 = phi float addrspace(1)* [ %572, %563 ], [ %47, %559 ], [ %47, %554 ]
  %575 = phi float addrspace(1)* [ %569, %563 ], [ %44, %559 ], [ %44, %554 ]
  %576 = phi float addrspace(1)* [ %566, %563 ], [ %41, %559 ], [ %41, %554 ]
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !7
  %578 = fmul contract float %577, 2.000000e+00
  %579 = load float, float addrspace(1)* %575, align 4, !tbaa !7
  %580 = fmul contract float %579, 2.000000e+00
  %581 = load float, float addrspace(1)* %574, align 4, !tbaa !7
  %582 = fmul contract float %581, 2.000000e+00
  %583 = fadd contract float %516, %578
  %584 = fadd contract float %517, %580
  %585 = fadd contract float %518, %582
  br i1 %300, label %595, label %586

586:                                              ; preds = %573
  %587 = icmp sle i32 %27, %6
  %588 = icmp sgt i32 %19, -1
  %589 = select i1 %587, i1 %588, i1 false
  br i1 %589, label %590, label %595

590:                                              ; preds = %586
  %591 = sext i32 %558 to i64
  %592 = getelementptr inbounds float, float addrspace(1)* %2, i64 %591
  %593 = load float, float addrspace(1)* %592, align 4, !tbaa !7, !amdgpu.noclobber !5
  %594 = fcmp contract olt float %593, 1.270000e+02
  br i1 %594, label %595, label %624

595:                                              ; preds = %590, %586, %573
  %596 = icmp slt i32 %268, 0
  %597 = icmp slt i32 %268, %4
  %598 = select i1 %597, i32 %268, i32 %48
  %599 = select i1 %596, i32 0, i32 %598
  %600 = icmp slt i32 %494, 0
  %601 = icmp slt i32 %494, %5
  %602 = select i1 %601, i32 %494, i32 %49
  %603 = select i1 %600, i32 0, i32 %602
  %604 = mul nsw i32 %603, %4
  %605 = add nsw i32 %604, %599
  %606 = mul nsw i32 %605, 3
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds float, float addrspace(1)* %0, i64 %607
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !7, !amdgpu.noclobber !5
  %610 = fmul contract float %609, 2.000000e+00
  %611 = fadd contract float %557, %610
  %612 = add nsw i32 %606, 1
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %0, i64 %613
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !7, !amdgpu.noclobber !5
  %616 = fmul contract float %615, 2.000000e+00
  %617 = fadd contract float %555, %616
  %618 = add nsw i32 %606, 2
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds float, float addrspace(1)* %0, i64 %619
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !7, !amdgpu.noclobber !5
  %622 = fmul contract float %621, 2.000000e+00
  %623 = fadd contract float %556, %622
  br label %624

624:                                              ; preds = %595, %590
  %625 = phi float [ %617, %595 ], [ %555, %590 ]
  %626 = phi float [ %623, %595 ], [ %556, %590 ]
  %627 = phi float [ %611, %595 ], [ %557, %590 ]
  %628 = add nsw i32 %28, %415
  br i1 %418, label %629, label %643

629:                                              ; preds = %624
  %630 = icmp slt i32 %415, %6
  %631 = icmp sgt i32 %19, -1
  %632 = select i1 %630, i1 %631, i1 false
  br i1 %632, label %633, label %643

633:                                              ; preds = %629
  %634 = mul nsw i32 %628, 3
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds float, float addrspace(1)* %1, i64 %635
  %637 = add nsw i32 %634, 1
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds float, float addrspace(1)* %1, i64 %638
  %640 = add nsw i32 %634, 2
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds float, float addrspace(1)* %1, i64 %641
  br label %643

643:                                              ; preds = %624, %629, %633
  %644 = phi float addrspace(1)* [ %642, %633 ], [ %47, %629 ], [ %47, %624 ]
  %645 = phi float addrspace(1)* [ %639, %633 ], [ %44, %629 ], [ %44, %624 ]
  %646 = phi float addrspace(1)* [ %636, %633 ], [ %41, %629 ], [ %41, %624 ]
  %647 = load float, float addrspace(1)* %646, align 4, !tbaa !7
  %648 = fmul contract float %647, 2.000000e+00
  %649 = load float, float addrspace(1)* %645, align 4, !tbaa !7
  %650 = fmul contract float %649, 2.000000e+00
  %651 = load float, float addrspace(1)* %644, align 4, !tbaa !7
  %652 = fmul contract float %651, 2.000000e+00
  %653 = fadd contract float %583, %648
  %654 = fadd contract float %584, %650
  %655 = fadd contract float %585, %652
  br i1 %448, label %665, label %656

656:                                              ; preds = %643
  %657 = icmp slt i32 %415, %6
  %658 = icmp sgt i32 %19, -1
  %659 = select i1 %657, i1 %658, i1 false
  br i1 %659, label %660, label %665

660:                                              ; preds = %656
  %661 = sext i32 %628 to i64
  %662 = getelementptr inbounds float, float addrspace(1)* %2, i64 %661
  %663 = load float, float addrspace(1)* %662, align 4, !tbaa !7, !amdgpu.noclobber !5
  %664 = fcmp contract olt float %663, 1.270000e+02
  br i1 %664, label %665, label %694

665:                                              ; preds = %660, %656, %643
  %666 = icmp slt i32 %417, 0
  %667 = icmp slt i32 %417, %4
  %668 = select i1 %667, i32 %417, i32 %48
  %669 = select i1 %666, i32 0, i32 %668
  %670 = icmp slt i32 %494, 0
  %671 = icmp slt i32 %494, %5
  %672 = select i1 %671, i32 %494, i32 %49
  %673 = select i1 %670, i32 0, i32 %672
  %674 = mul nsw i32 %673, %4
  %675 = add nsw i32 %674, %669
  %676 = mul nsw i32 %675, 3
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds float, float addrspace(1)* %0, i64 %677
  %679 = load float, float addrspace(1)* %678, align 4, !tbaa !7, !amdgpu.noclobber !5
  %680 = fmul contract float %679, 2.000000e+00
  %681 = fadd contract float %627, %680
  %682 = add nsw i32 %676, 1
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds float, float addrspace(1)* %0, i64 %683
  %685 = load float, float addrspace(1)* %684, align 4, !tbaa !7, !amdgpu.noclobber !5
  %686 = fmul contract float %685, 2.000000e+00
  %687 = fadd contract float %625, %686
  %688 = add nsw i32 %676, 2
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds float, float addrspace(1)* %0, i64 %689
  %691 = load float, float addrspace(1)* %690, align 4, !tbaa !7, !amdgpu.noclobber !5
  %692 = fmul contract float %691, 2.000000e+00
  %693 = fadd contract float %626, %692
  br label %694

694:                                              ; preds = %665, %660
  %695 = phi float [ %687, %665 ], [ %625, %660 ]
  %696 = phi float [ %693, %665 ], [ %626, %660 ]
  %697 = phi float [ %681, %665 ], [ %627, %660 ]
  %698 = add nsw i32 %28, %192
  br i1 %195, label %699, label %713

699:                                              ; preds = %694
  %700 = icmp slt i32 %192, %6
  %701 = icmp sgt i32 %19, -1
  %702 = select i1 %700, i1 %701, i1 false
  br i1 %702, label %703, label %713

703:                                              ; preds = %699
  %704 = mul nsw i32 %698, 3
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds float, float addrspace(1)* %1, i64 %705
  %707 = add nsw i32 %704, 1
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds float, float addrspace(1)* %1, i64 %708
  %710 = add nsw i32 %704, 2
  %711 = sext i32 %710 to i64
  %712 = getelementptr inbounds float, float addrspace(1)* %1, i64 %711
  br label %713

713:                                              ; preds = %694, %699, %703
  %714 = phi float addrspace(1)* [ %712, %703 ], [ %47, %699 ], [ %47, %694 ]
  %715 = phi float addrspace(1)* [ %709, %703 ], [ %44, %699 ], [ %44, %694 ]
  %716 = phi float addrspace(1)* [ %706, %703 ], [ %41, %699 ], [ %41, %694 ]
  %717 = load float, float addrspace(1)* %716, align 4, !tbaa !7
  %718 = load float, float addrspace(1)* %715, align 4, !tbaa !7
  %719 = load float, float addrspace(1)* %714, align 4, !tbaa !7
  %720 = fadd contract float %653, %717
  %721 = fadd contract float %654, %718
  %722 = fadd contract float %655, %719
  br i1 %222, label %732, label %723

723:                                              ; preds = %713
  %724 = icmp slt i32 %192, %6
  %725 = icmp sgt i32 %19, -1
  %726 = select i1 %724, i1 %725, i1 false
  br i1 %726, label %727, label %732

727:                                              ; preds = %723
  %728 = sext i32 %698 to i64
  %729 = getelementptr inbounds float, float addrspace(1)* %2, i64 %728
  %730 = load float, float addrspace(1)* %729, align 4, !tbaa !7, !amdgpu.noclobber !5
  %731 = fcmp contract olt float %730, 1.270000e+02
  br i1 %731, label %732, label %758

732:                                              ; preds = %727, %723, %713
  %733 = icmp slt i32 %194, 0
  %734 = icmp slt i32 %194, %4
  %735 = select i1 %734, i32 %194, i32 %48
  %736 = select i1 %733, i32 0, i32 %735
  %737 = icmp slt i32 %494, 0
  %738 = icmp slt i32 %494, %5
  %739 = select i1 %738, i32 %494, i32 %49
  %740 = select i1 %737, i32 0, i32 %739
  %741 = mul nsw i32 %740, %4
  %742 = add nsw i32 %741, %736
  %743 = mul nsw i32 %742, 3
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds float, float addrspace(1)* %0, i64 %744
  %746 = load float, float addrspace(1)* %745, align 4, !tbaa !7, !amdgpu.noclobber !5
  %747 = fadd contract float %697, %746
  %748 = add nsw i32 %743, 1
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float addrspace(1)* %0, i64 %749
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !7, !amdgpu.noclobber !5
  %752 = fadd contract float %695, %751
  %753 = add nsw i32 %743, 2
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds float, float addrspace(1)* %0, i64 %754
  %756 = load float, float addrspace(1)* %755, align 4, !tbaa !7, !amdgpu.noclobber !5
  %757 = fadd contract float %696, %756
  br label %758

758:                                              ; preds = %732, %727
  %759 = phi float [ %752, %732 ], [ %695, %727 ]
  %760 = phi float [ %757, %732 ], [ %696, %727 ]
  %761 = phi float [ %747, %732 ], [ %697, %727 ]
  %762 = add nsw i32 %19, 1
  %763 = mul nsw i32 %762, %6
  %764 = add nsw i32 %763, %264
  %765 = add nsw i32 %762, %8
  br i1 %270, label %766, label %782

766:                                              ; preds = %758
  %767 = icmp sle i32 %27, %6
  %768 = icmp sgt i32 %19, -2
  %769 = select i1 %767, i1 %768, i1 false
  %770 = icmp slt i32 %762, %7
  %771 = select i1 %769, i1 %770, i1 false
  br i1 %771, label %772, label %782

772:                                              ; preds = %766
  %773 = mul nsw i32 %764, 3
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds float, float addrspace(1)* %1, i64 %774
  %776 = add nsw i32 %773, 1
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds float, float addrspace(1)* %1, i64 %777
  %779 = add nsw i32 %773, 2
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds float, float addrspace(1)* %1, i64 %780
  br label %782

782:                                              ; preds = %758, %766, %772
  %783 = phi float addrspace(1)* [ %781, %772 ], [ %47, %766 ], [ %47, %758 ]
  %784 = phi float addrspace(1)* [ %778, %772 ], [ %44, %766 ], [ %44, %758 ]
  %785 = phi float addrspace(1)* [ %775, %772 ], [ %41, %766 ], [ %41, %758 ]
  %786 = load float, float addrspace(1)* %785, align 4, !tbaa !7
  %787 = fmul contract float %786, 2.000000e+00
  %788 = load float, float addrspace(1)* %784, align 4, !tbaa !7
  %789 = fmul contract float %788, 2.000000e+00
  %790 = load float, float addrspace(1)* %783, align 4, !tbaa !7
  %791 = fmul contract float %790, 2.000000e+00
  %792 = fadd contract float %720, %787
  %793 = fadd contract float %721, %789
  %794 = fadd contract float %722, %791
  br i1 %300, label %806, label %795

795:                                              ; preds = %782
  %796 = icmp sle i32 %27, %6
  %797 = icmp sgt i32 %19, -2
  %798 = select i1 %796, i1 %797, i1 false
  %799 = icmp slt i32 %762, %7
  %800 = select i1 %798, i1 %799, i1 false
  br i1 %800, label %801, label %806

801:                                              ; preds = %795
  %802 = sext i32 %764 to i64
  %803 = getelementptr inbounds float, float addrspace(1)* %2, i64 %802
  %804 = load float, float addrspace(1)* %803, align 4, !tbaa !7, !amdgpu.noclobber !5
  %805 = fcmp contract olt float %804, 1.270000e+02
  br i1 %805, label %806, label %835

806:                                              ; preds = %801, %795, %782
  %807 = icmp slt i32 %268, 0
  %808 = icmp slt i32 %268, %4
  %809 = select i1 %808, i32 %268, i32 %48
  %810 = select i1 %807, i32 0, i32 %809
  %811 = icmp slt i32 %765, 0
  %812 = icmp slt i32 %765, %5
  %813 = select i1 %812, i32 %765, i32 %49
  %814 = select i1 %811, i32 0, i32 %813
  %815 = mul nsw i32 %814, %4
  %816 = add nsw i32 %815, %810
  %817 = mul nsw i32 %816, 3
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds float, float addrspace(1)* %0, i64 %818
  %820 = load float, float addrspace(1)* %819, align 4, !tbaa !7, !amdgpu.noclobber !5
  %821 = fmul contract float %820, 2.000000e+00
  %822 = fadd contract float %761, %821
  %823 = add nsw i32 %817, 1
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds float, float addrspace(1)* %0, i64 %824
  %826 = load float, float addrspace(1)* %825, align 4, !tbaa !7, !amdgpu.noclobber !5
  %827 = fmul contract float %826, 2.000000e+00
  %828 = fadd contract float %759, %827
  %829 = add nsw i32 %817, 2
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds float, float addrspace(1)* %0, i64 %830
  %832 = load float, float addrspace(1)* %831, align 4, !tbaa !7, !amdgpu.noclobber !5
  %833 = fmul contract float %832, 2.000000e+00
  %834 = fadd contract float %760, %833
  br label %835

835:                                              ; preds = %806, %801
  %836 = phi float [ %828, %806 ], [ %759, %801 ]
  %837 = phi float [ %834, %806 ], [ %760, %801 ]
  %838 = phi float [ %822, %806 ], [ %761, %801 ]
  %839 = add nsw i32 %763, %27
  br i1 %127, label %840, label %854

840:                                              ; preds = %835
  %841 = icmp sgt i32 %19, -2
  %842 = icmp slt i32 %762, %7
  %843 = select i1 %841, i1 %842, i1 false
  br i1 %843, label %844, label %854

844:                                              ; preds = %840
  %845 = mul nsw i32 %839, 3
  %846 = sext i32 %845 to i64
  %847 = getelementptr inbounds float, float addrspace(1)* %1, i64 %846
  %848 = add nsw i32 %845, 1
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds float, float addrspace(1)* %1, i64 %849
  %851 = add nsw i32 %845, 2
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds float, float addrspace(1)* %1, i64 %852
  br label %854

854:                                              ; preds = %835, %840, %844
  %855 = phi float addrspace(1)* [ %853, %844 ], [ %47, %840 ], [ %47, %835 ]
  %856 = phi float addrspace(1)* [ %850, %844 ], [ %44, %840 ], [ %44, %835 ]
  %857 = phi float addrspace(1)* [ %847, %844 ], [ %41, %840 ], [ %41, %835 ]
  %858 = load float, float addrspace(1)* %857, align 4, !tbaa !7
  %859 = fmul contract float %858, 2.000000e+00
  %860 = load float, float addrspace(1)* %856, align 4, !tbaa !7
  %861 = fmul contract float %860, 2.000000e+00
  %862 = load float, float addrspace(1)* %855, align 4, !tbaa !7
  %863 = fmul contract float %862, 2.000000e+00
  %864 = fadd contract float %792, %859
  %865 = fadd contract float %793, %861
  %866 = fadd contract float %794, %863
  br i1 %152, label %876, label %867

867:                                              ; preds = %854
  %868 = icmp sgt i32 %19, -2
  %869 = icmp slt i32 %762, %7
  %870 = select i1 %868, i1 %869, i1 false
  br i1 %870, label %871, label %876

871:                                              ; preds = %867
  %872 = sext i32 %839 to i64
  %873 = getelementptr inbounds float, float addrspace(1)* %2, i64 %872
  %874 = load float, float addrspace(1)* %873, align 4, !tbaa !7, !amdgpu.noclobber !5
  %875 = fcmp contract olt float %874, 1.270000e+02
  br i1 %875, label %876, label %905

876:                                              ; preds = %871, %867, %854
  %877 = icmp slt i32 %126, 0
  %878 = icmp slt i32 %126, %4
  %879 = select i1 %878, i32 %126, i32 %48
  %880 = select i1 %877, i32 0, i32 %879
  %881 = icmp slt i32 %765, 0
  %882 = icmp slt i32 %765, %5
  %883 = select i1 %882, i32 %765, i32 %49
  %884 = select i1 %881, i32 0, i32 %883
  %885 = mul nsw i32 %884, %4
  %886 = add nsw i32 %885, %880
  %887 = mul nsw i32 %886, 3
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds float, float addrspace(1)* %0, i64 %888
  %890 = load float, float addrspace(1)* %889, align 4, !tbaa !7, !amdgpu.noclobber !5
  %891 = fmul contract float %890, 2.000000e+00
  %892 = fadd contract float %838, %891
  %893 = add nsw i32 %887, 1
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds float, float addrspace(1)* %0, i64 %894
  %896 = load float, float addrspace(1)* %895, align 4, !tbaa !7, !amdgpu.noclobber !5
  %897 = fmul contract float %896, 2.000000e+00
  %898 = fadd contract float %836, %897
  %899 = add nsw i32 %887, 2
  %900 = sext i32 %899 to i64
  %901 = getelementptr inbounds float, float addrspace(1)* %0, i64 %900
  %902 = load float, float addrspace(1)* %901, align 4, !tbaa !7, !amdgpu.noclobber !5
  %903 = fmul contract float %902, 2.000000e+00
  %904 = fadd contract float %837, %903
  br label %905

905:                                              ; preds = %876, %871
  %906 = phi float [ %898, %876 ], [ %836, %871 ]
  %907 = phi float [ %904, %876 ], [ %837, %871 ]
  %908 = phi float [ %892, %876 ], [ %838, %871 ]
  %909 = add nsw i32 %763, %415
  br i1 %418, label %910, label %926

910:                                              ; preds = %905
  %911 = icmp slt i32 %415, %6
  %912 = icmp sgt i32 %19, -2
  %913 = select i1 %911, i1 %912, i1 false
  %914 = icmp slt i32 %762, %7
  %915 = select i1 %913, i1 %914, i1 false
  br i1 %915, label %916, label %926

916:                                              ; preds = %910
  %917 = mul nsw i32 %909, 3
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds float, float addrspace(1)* %1, i64 %918
  %920 = add nsw i32 %917, 1
  %921 = sext i32 %920 to i64
  %922 = getelementptr inbounds float, float addrspace(1)* %1, i64 %921
  %923 = add nsw i32 %917, 2
  %924 = sext i32 %923 to i64
  %925 = getelementptr inbounds float, float addrspace(1)* %1, i64 %924
  br label %926

926:                                              ; preds = %905, %910, %916
  %927 = phi float addrspace(1)* [ %925, %916 ], [ %47, %910 ], [ %47, %905 ]
  %928 = phi float addrspace(1)* [ %922, %916 ], [ %44, %910 ], [ %44, %905 ]
  %929 = phi float addrspace(1)* [ %919, %916 ], [ %41, %910 ], [ %41, %905 ]
  %930 = load float, float addrspace(1)* %929, align 4, !tbaa !7
  %931 = fmul contract float %930, 2.000000e+00
  %932 = load float, float addrspace(1)* %928, align 4, !tbaa !7
  %933 = fmul contract float %932, 2.000000e+00
  %934 = load float, float addrspace(1)* %927, align 4, !tbaa !7
  %935 = fmul contract float %934, 2.000000e+00
  %936 = fadd contract float %864, %931
  %937 = fadd contract float %865, %933
  %938 = fadd contract float %866, %935
  br i1 %448, label %950, label %939

939:                                              ; preds = %926
  %940 = icmp slt i32 %415, %6
  %941 = icmp sgt i32 %19, -2
  %942 = select i1 %940, i1 %941, i1 false
  %943 = icmp slt i32 %762, %7
  %944 = select i1 %942, i1 %943, i1 false
  br i1 %944, label %945, label %950

945:                                              ; preds = %939
  %946 = sext i32 %909 to i64
  %947 = getelementptr inbounds float, float addrspace(1)* %2, i64 %946
  %948 = load float, float addrspace(1)* %947, align 4, !tbaa !7, !amdgpu.noclobber !5
  %949 = fcmp contract olt float %948, 1.270000e+02
  br i1 %949, label %950, label %979

950:                                              ; preds = %945, %939, %926
  %951 = icmp slt i32 %417, 0
  %952 = icmp slt i32 %417, %4
  %953 = select i1 %952, i32 %417, i32 %48
  %954 = select i1 %951, i32 0, i32 %953
  %955 = icmp slt i32 %765, 0
  %956 = icmp slt i32 %765, %5
  %957 = select i1 %956, i32 %765, i32 %49
  %958 = select i1 %955, i32 0, i32 %957
  %959 = mul nsw i32 %958, %4
  %960 = add nsw i32 %959, %954
  %961 = mul nsw i32 %960, 3
  %962 = sext i32 %961 to i64
  %963 = getelementptr inbounds float, float addrspace(1)* %0, i64 %962
  %964 = load float, float addrspace(1)* %963, align 4, !tbaa !7, !amdgpu.noclobber !5
  %965 = fmul contract float %964, 2.000000e+00
  %966 = fadd contract float %908, %965
  %967 = add nsw i32 %961, 1
  %968 = sext i32 %967 to i64
  %969 = getelementptr inbounds float, float addrspace(1)* %0, i64 %968
  %970 = load float, float addrspace(1)* %969, align 4, !tbaa !7, !amdgpu.noclobber !5
  %971 = fmul contract float %970, 2.000000e+00
  %972 = fadd contract float %906, %971
  %973 = add nsw i32 %961, 2
  %974 = sext i32 %973 to i64
  %975 = getelementptr inbounds float, float addrspace(1)* %0, i64 %974
  %976 = load float, float addrspace(1)* %975, align 4, !tbaa !7, !amdgpu.noclobber !5
  %977 = fmul contract float %976, 2.000000e+00
  %978 = fadd contract float %907, %977
  br label %979

979:                                              ; preds = %950, %945
  %980 = phi float [ %972, %950 ], [ %906, %945 ]
  %981 = phi float [ %978, %950 ], [ %907, %945 ]
  %982 = phi float [ %966, %950 ], [ %908, %945 ]
  %983 = add nsw i32 %19, 2
  %984 = mul nsw i32 %983, %6
  %985 = add nsw i32 %984, %50
  %986 = add nsw i32 %983, %8
  br i1 %56, label %987, label %1003

987:                                              ; preds = %979
  %988 = icmp slt i32 %50, %6
  %989 = icmp sgt i32 %19, -3
  %990 = select i1 %988, i1 %989, i1 false
  %991 = icmp slt i32 %983, %7
  %992 = select i1 %990, i1 %991, i1 false
  br i1 %992, label %993, label %1003

993:                                              ; preds = %987
  %994 = mul nsw i32 %985, 3
  %995 = sext i32 %994 to i64
  %996 = getelementptr inbounds float, float addrspace(1)* %1, i64 %995
  %997 = add nsw i32 %994, 1
  %998 = sext i32 %997 to i64
  %999 = getelementptr inbounds float, float addrspace(1)* %1, i64 %998
  %1000 = add nsw i32 %994, 2
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1001
  br label %1003

1003:                                             ; preds = %979, %987, %993
  %1004 = phi float addrspace(1)* [ %1002, %993 ], [ %47, %987 ], [ %47, %979 ]
  %1005 = phi float addrspace(1)* [ %999, %993 ], [ %44, %987 ], [ %44, %979 ]
  %1006 = phi float addrspace(1)* [ %996, %993 ], [ %41, %987 ], [ %41, %979 ]
  %1007 = load float, float addrspace(1)* %1006, align 4, !tbaa !7
  %1008 = load float, float addrspace(1)* %1005, align 4, !tbaa !7
  %1009 = load float, float addrspace(1)* %1004, align 4, !tbaa !7
  %1010 = fadd contract float %936, %1007
  %1011 = fadd contract float %937, %1008
  %1012 = fadd contract float %938, %1009
  br i1 %83, label %1024, label %1013

1013:                                             ; preds = %1003
  %1014 = icmp slt i32 %50, %6
  %1015 = icmp sgt i32 %19, -3
  %1016 = select i1 %1014, i1 %1015, i1 false
  %1017 = icmp slt i32 %983, %7
  %1018 = select i1 %1016, i1 %1017, i1 false
  br i1 %1018, label %1019, label %1024

1019:                                             ; preds = %1013
  %1020 = sext i32 %985 to i64
  %1021 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1020
  %1022 = load float, float addrspace(1)* %1021, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1023 = fcmp contract olt float %1022, 1.270000e+02
  br i1 %1023, label %1024, label %1050

1024:                                             ; preds = %1019, %1013, %1003
  %1025 = icmp slt i32 %54, 0
  %1026 = icmp slt i32 %54, %4
  %1027 = select i1 %1026, i32 %54, i32 %48
  %1028 = select i1 %1025, i32 0, i32 %1027
  %1029 = icmp slt i32 %986, 0
  %1030 = icmp slt i32 %986, %5
  %1031 = select i1 %1030, i32 %986, i32 %49
  %1032 = select i1 %1029, i32 0, i32 %1031
  %1033 = mul nsw i32 %1032, %4
  %1034 = add nsw i32 %1033, %1028
  %1035 = mul nsw i32 %1034, 3
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1036
  %1038 = load float, float addrspace(1)* %1037, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1039 = fadd contract float %982, %1038
  %1040 = add nsw i32 %1035, 1
  %1041 = sext i32 %1040 to i64
  %1042 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1041
  %1043 = load float, float addrspace(1)* %1042, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1044 = fadd contract float %980, %1043
  %1045 = add nsw i32 %1035, 2
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1046
  %1048 = load float, float addrspace(1)* %1047, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1049 = fadd contract float %981, %1048
  br label %1050

1050:                                             ; preds = %1024, %1019
  %1051 = phi float [ %1044, %1024 ], [ %980, %1019 ]
  %1052 = phi float [ %1049, %1024 ], [ %981, %1019 ]
  %1053 = phi float [ %1039, %1024 ], [ %982, %1019 ]
  %1054 = add nsw i32 %984, %27
  br i1 %127, label %1055, label %1069

1055:                                             ; preds = %1050
  %1056 = icmp sgt i32 %19, -3
  %1057 = icmp slt i32 %983, %7
  %1058 = select i1 %1056, i1 %1057, i1 false
  br i1 %1058, label %1059, label %1069

1059:                                             ; preds = %1055
  %1060 = mul nsw i32 %1054, 3
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1061
  %1063 = add nsw i32 %1060, 1
  %1064 = sext i32 %1063 to i64
  %1065 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1064
  %1066 = add nsw i32 %1060, 2
  %1067 = sext i32 %1066 to i64
  %1068 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1067
  br label %1069

1069:                                             ; preds = %1050, %1055, %1059
  %1070 = phi float addrspace(1)* [ %1068, %1059 ], [ %47, %1055 ], [ %47, %1050 ]
  %1071 = phi float addrspace(1)* [ %1065, %1059 ], [ %44, %1055 ], [ %44, %1050 ]
  %1072 = phi float addrspace(1)* [ %1062, %1059 ], [ %41, %1055 ], [ %41, %1050 ]
  %1073 = load float, float addrspace(1)* %1072, align 4, !tbaa !7
  %1074 = load float, float addrspace(1)* %1071, align 4, !tbaa !7
  %1075 = load float, float addrspace(1)* %1070, align 4, !tbaa !7
  %1076 = fadd contract float %1010, %1073
  %1077 = fadd contract float %1011, %1074
  %1078 = fadd contract float %1012, %1075
  br i1 %152, label %1088, label %1079

1079:                                             ; preds = %1069
  %1080 = icmp sgt i32 %19, -3
  %1081 = icmp slt i32 %983, %7
  %1082 = select i1 %1080, i1 %1081, i1 false
  br i1 %1082, label %1083, label %1088

1083:                                             ; preds = %1079
  %1084 = sext i32 %1054 to i64
  %1085 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1084
  %1086 = load float, float addrspace(1)* %1085, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1087 = fcmp contract olt float %1086, 1.270000e+02
  br i1 %1087, label %1088, label %1114

1088:                                             ; preds = %1083, %1079, %1069
  %1089 = icmp slt i32 %126, 0
  %1090 = icmp slt i32 %126, %4
  %1091 = select i1 %1090, i32 %126, i32 %48
  %1092 = select i1 %1089, i32 0, i32 %1091
  %1093 = icmp slt i32 %986, 0
  %1094 = icmp slt i32 %986, %5
  %1095 = select i1 %1094, i32 %986, i32 %49
  %1096 = select i1 %1093, i32 0, i32 %1095
  %1097 = mul nsw i32 %1096, %4
  %1098 = add nsw i32 %1097, %1092
  %1099 = mul nsw i32 %1098, 3
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1100
  %1102 = load float, float addrspace(1)* %1101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1103 = fadd contract float %1053, %1102
  %1104 = add nsw i32 %1099, 1
  %1105 = sext i32 %1104 to i64
  %1106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1105
  %1107 = load float, float addrspace(1)* %1106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1108 = fadd contract float %1051, %1107
  %1109 = add nsw i32 %1099, 2
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1110
  %1112 = load float, float addrspace(1)* %1111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1113 = fadd contract float %1052, %1112
  br label %1114

1114:                                             ; preds = %1088, %1083
  %1115 = phi float [ %1108, %1088 ], [ %1051, %1083 ]
  %1116 = phi float [ %1113, %1088 ], [ %1052, %1083 ]
  %1117 = phi float [ %1103, %1088 ], [ %1053, %1083 ]
  %1118 = add nsw i32 %984, %192
  br i1 %195, label %1119, label %1135

1119:                                             ; preds = %1114
  %1120 = icmp slt i32 %192, %6
  %1121 = icmp sgt i32 %19, -3
  %1122 = select i1 %1120, i1 %1121, i1 false
  %1123 = icmp slt i32 %983, %7
  %1124 = select i1 %1122, i1 %1123, i1 false
  br i1 %1124, label %1125, label %1135

1125:                                             ; preds = %1119
  %1126 = mul nsw i32 %1118, 3
  %1127 = sext i32 %1126 to i64
  %1128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1127
  %1129 = add nsw i32 %1126, 1
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1130
  %1132 = add nsw i32 %1126, 2
  %1133 = sext i32 %1132 to i64
  %1134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1133
  br label %1135

1135:                                             ; preds = %1114, %1119, %1125
  %1136 = phi float addrspace(1)* [ %1134, %1125 ], [ %47, %1119 ], [ %47, %1114 ]
  %1137 = phi float addrspace(1)* [ %1131, %1125 ], [ %44, %1119 ], [ %44, %1114 ]
  %1138 = phi float addrspace(1)* [ %1128, %1125 ], [ %41, %1119 ], [ %41, %1114 ]
  %1139 = load float, float addrspace(1)* %1138, align 4, !tbaa !7
  %1140 = load float, float addrspace(1)* %1137, align 4, !tbaa !7
  %1141 = load float, float addrspace(1)* %1136, align 4, !tbaa !7
  %1142 = fadd contract float %1076, %1139
  %1143 = fadd contract float %1077, %1140
  %1144 = fadd contract float %1078, %1141
  br i1 %222, label %1156, label %1145

1145:                                             ; preds = %1135
  %1146 = icmp slt i32 %192, %6
  %1147 = icmp sgt i32 %19, -3
  %1148 = select i1 %1146, i1 %1147, i1 false
  %1149 = icmp slt i32 %983, %7
  %1150 = select i1 %1148, i1 %1149, i1 false
  br i1 %1150, label %1151, label %1156

1151:                                             ; preds = %1145
  %1152 = sext i32 %1118 to i64
  %1153 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1152
  %1154 = load float, float addrspace(1)* %1153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1155 = fcmp contract olt float %1154, 1.270000e+02
  br i1 %1155, label %1156, label %1182

1156:                                             ; preds = %1151, %1145, %1135
  %1157 = icmp slt i32 %194, 0
  %1158 = icmp slt i32 %194, %4
  %1159 = select i1 %1158, i32 %194, i32 %48
  %1160 = select i1 %1157, i32 0, i32 %1159
  %1161 = icmp slt i32 %986, 0
  %1162 = icmp slt i32 %986, %5
  %1163 = select i1 %1162, i32 %986, i32 %49
  %1164 = select i1 %1161, i32 0, i32 %1163
  %1165 = mul nsw i32 %1164, %4
  %1166 = add nsw i32 %1165, %1160
  %1167 = mul nsw i32 %1166, 3
  %1168 = sext i32 %1167 to i64
  %1169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1168
  %1170 = load float, float addrspace(1)* %1169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1171 = fadd contract float %1117, %1170
  %1172 = add nsw i32 %1167, 1
  %1173 = sext i32 %1172 to i64
  %1174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1173
  %1175 = load float, float addrspace(1)* %1174, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1176 = fadd contract float %1115, %1175
  %1177 = add nsw i32 %1167, 2
  %1178 = sext i32 %1177 to i64
  %1179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1178
  %1180 = load float, float addrspace(1)* %1179, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1181 = fadd contract float %1116, %1180
  br label %1182

1182:                                             ; preds = %1156, %1151
  %1183 = phi float [ %1176, %1156 ], [ %1115, %1151 ]
  %1184 = phi float [ %1181, %1156 ], [ %1116, %1151 ]
  %1185 = phi float [ %1171, %1156 ], [ %1117, %1151 ]
  %1186 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %1187 = fdiv contract float %1142, 2.400000e+01
  %1188 = fsub contract float %1186, %1187
  %1189 = fdiv contract float %1185, 2.400000e+01
  %1190 = fadd contract float %1189, %1188
  %1191 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  store float %1190, float addrspace(1)* %1191, align 4, !tbaa !7
  %1192 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %1193 = fdiv contract float %1143, 2.400000e+01
  %1194 = fsub contract float %1192, %1193
  %1195 = fdiv contract float %1183, 2.400000e+01
  %1196 = fadd contract float %1195, %1194
  %1197 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  store float %1196, float addrspace(1)* %1197, align 4, !tbaa !7
  %1198 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %1199 = fdiv contract float %1144, 2.400000e+01
  %1200 = fsub contract float %1198, %1199
  %1201 = fdiv contract float %1184, 2.400000e+01
  %1202 = fadd contract float %1201, %1200
  %1203 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  store float %1202, float addrspace(1)* %1203, align 4, !tbaa !7
  br label %1204

1204:                                             ; preds = %1182, %33, %10
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
