; ModuleID = '../data/hip_kernels/7222/8/main.cu'
source_filename = "../data/hip_kernels/7222/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4backPdS_S_S_S_S_S_S_S_S_S_iiiiS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readnone %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, i32 %11, i32 %12, i32 %13, i32 %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, i32 %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = add i32 %20, %17
  %22 = mul i32 %21, %11
  %23 = mul i32 %22, %14
  %24 = mul nsw i32 %21, %13
  %25 = add nsw i32 %14, -1
  %26 = mul i32 %25, %11
  %27 = mul i32 %26, %11
  %28 = mul i32 %27, %21
  %29 = mul nsw i32 %21, %12
  %30 = mul nsw i32 %29, %11
  %31 = icmp slt i32 %19, %13
  br i1 %31, label %32, label %154

32:                                               ; preds = %18
  %33 = add nsw i32 %24, %19
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !5, !amdgpu.noclobber !9
  %37 = sext i32 %21 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %16, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !5, !amdgpu.noclobber !9
  %40 = fsub contract double %36, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %7, i64 %34
  store double %40, double addrspace(1)* %41, align 8, !tbaa !5
  %42 = icmp sgt i32 %11, 0
  br i1 %42, label %43, label %154

43:                                               ; preds = %32
  %44 = add nsw i32 %23, %26
  %45 = mul i32 %33, %11
  %46 = add i32 %11, -1
  %47 = and i32 %11, 7
  %48 = icmp ult i32 %46, 7
  br i1 %48, label %136, label %49

49:                                               ; preds = %43
  %50 = and i32 %11, -8
  br label %51

51:                                               ; preds = %51, %49
  %52 = phi i32 [ 0, %49 ], [ %133, %51 ]
  %53 = phi i32 [ 0, %49 ], [ %134, %51 ]
  %54 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %55 = add nsw i32 %44, %52
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !5
  %59 = fmul contract double %54, %58
  %60 = add nsw i32 %52, %45
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %9, i64 %61
  store double %59, double addrspace(1)* %62, align 8, !tbaa !5
  %63 = or i32 %52, 1
  %64 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %65 = add nsw i32 %44, %63
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !5
  %69 = fmul contract double %64, %68
  %70 = add nsw i32 %63, %45
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %9, i64 %71
  store double %69, double addrspace(1)* %72, align 8, !tbaa !5
  %73 = or i32 %52, 2
  %74 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %75 = add nsw i32 %44, %73
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !5
  %79 = fmul contract double %74, %78
  %80 = add nsw i32 %73, %45
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %9, i64 %81
  store double %79, double addrspace(1)* %82, align 8, !tbaa !5
  %83 = or i32 %52, 3
  %84 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %85 = add nsw i32 %44, %83
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !5
  %89 = fmul contract double %84, %88
  %90 = add nsw i32 %83, %45
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %9, i64 %91
  store double %89, double addrspace(1)* %92, align 8, !tbaa !5
  %93 = or i32 %52, 4
  %94 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %95 = add nsw i32 %44, %93
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !5
  %99 = fmul contract double %94, %98
  %100 = add nsw i32 %93, %45
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %9, i64 %101
  store double %99, double addrspace(1)* %102, align 8, !tbaa !5
  %103 = or i32 %52, 5
  %104 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %105 = add nsw i32 %44, %103
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %0, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !5
  %109 = fmul contract double %104, %108
  %110 = add nsw i32 %103, %45
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %9, i64 %111
  store double %109, double addrspace(1)* %112, align 8, !tbaa !5
  %113 = or i32 %52, 6
  %114 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %115 = add nsw i32 %44, %113
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %0, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !5
  %119 = fmul contract double %114, %118
  %120 = add nsw i32 %113, %45
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %9, i64 %121
  store double %119, double addrspace(1)* %122, align 8, !tbaa !5
  %123 = or i32 %52, 7
  %124 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %125 = add nsw i32 %44, %123
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %0, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !5
  %129 = fmul contract double %124, %128
  %130 = add nsw i32 %123, %45
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %9, i64 %131
  store double %129, double addrspace(1)* %132, align 8, !tbaa !5
  %133 = add nuw nsw i32 %52, 8
  %134 = add i32 %53, 8
  %135 = icmp eq i32 %134, %50
  br i1 %135, label %136, label %51, !llvm.loop !10

136:                                              ; preds = %51, %43
  %137 = phi i32 [ 0, %43 ], [ %133, %51 ]
  %138 = icmp eq i32 %47, 0
  br i1 %138, label %154, label %139

139:                                              ; preds = %136, %139
  %140 = phi i32 [ %151, %139 ], [ %137, %136 ]
  %141 = phi i32 [ %152, %139 ], [ 0, %136 ]
  %142 = load double, double addrspace(1)* %41, align 8, !tbaa !5
  %143 = add nsw i32 %44, %140
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double addrspace(1)* %0, i64 %144
  %146 = load double, double addrspace(1)* %145, align 8, !tbaa !5
  %147 = fmul contract double %142, %146
  %148 = add nsw i32 %140, %45
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %9, i64 %149
  store double %147, double addrspace(1)* %150, align 8, !tbaa !5
  %151 = add nuw nsw i32 %140, 1
  %152 = add i32 %141, 1
  %153 = icmp eq i32 %152, %47
  br i1 %153, label %154, label %139, !llvm.loop !12

154:                                              ; preds = %136, %139, %32, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = icmp sgt i32 %13, 0
  br i1 %155, label %156, label %286

156:                                              ; preds = %154
  %157 = and i32 %13, 7
  %158 = icmp ult i32 %13, 8
  br i1 %158, label %263, label %159

159:                                              ; preds = %156
  %160 = and i32 %13, -8
  br label %161

161:                                              ; preds = %161, %159
  %162 = phi double [ 0.000000e+00, %159 ], [ %259, %161 ]
  %163 = phi i32 [ 0, %159 ], [ %260, %161 ]
  %164 = phi i32 [ 0, %159 ], [ %261, %161 ]
  %165 = mul nsw i32 %163, %11
  %166 = add nsw i32 %165, %19
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds double, double addrspace(1)* %1, i64 %167
  %169 = load double, double addrspace(1)* %168, align 8, !tbaa !5
  %170 = add nsw i32 %163, %24
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds double, double addrspace(1)* %7, i64 %171
  %173 = load double, double addrspace(1)* %172, align 8, !tbaa !5
  %174 = fmul contract double %169, %173
  %175 = fadd contract double %162, %174
  %176 = or i32 %163, 1
  %177 = mul nsw i32 %176, %11
  %178 = add nsw i32 %177, %19
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds double, double addrspace(1)* %1, i64 %179
  %181 = load double, double addrspace(1)* %180, align 8, !tbaa !5
  %182 = add nsw i32 %176, %24
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds double, double addrspace(1)* %7, i64 %183
  %185 = load double, double addrspace(1)* %184, align 8, !tbaa !5
  %186 = fmul contract double %181, %185
  %187 = fadd contract double %175, %186
  %188 = or i32 %163, 2
  %189 = mul nsw i32 %188, %11
  %190 = add nsw i32 %189, %19
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds double, double addrspace(1)* %1, i64 %191
  %193 = load double, double addrspace(1)* %192, align 8, !tbaa !5
  %194 = add nsw i32 %188, %24
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds double, double addrspace(1)* %7, i64 %195
  %197 = load double, double addrspace(1)* %196, align 8, !tbaa !5
  %198 = fmul contract double %193, %197
  %199 = fadd contract double %187, %198
  %200 = or i32 %163, 3
  %201 = mul nsw i32 %200, %11
  %202 = add nsw i32 %201, %19
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds double, double addrspace(1)* %1, i64 %203
  %205 = load double, double addrspace(1)* %204, align 8, !tbaa !5
  %206 = add nsw i32 %200, %24
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds double, double addrspace(1)* %7, i64 %207
  %209 = load double, double addrspace(1)* %208, align 8, !tbaa !5
  %210 = fmul contract double %205, %209
  %211 = fadd contract double %199, %210
  %212 = or i32 %163, 4
  %213 = mul nsw i32 %212, %11
  %214 = add nsw i32 %213, %19
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds double, double addrspace(1)* %1, i64 %215
  %217 = load double, double addrspace(1)* %216, align 8, !tbaa !5
  %218 = add nsw i32 %212, %24
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds double, double addrspace(1)* %7, i64 %219
  %221 = load double, double addrspace(1)* %220, align 8, !tbaa !5
  %222 = fmul contract double %217, %221
  %223 = fadd contract double %211, %222
  %224 = or i32 %163, 5
  %225 = mul nsw i32 %224, %11
  %226 = add nsw i32 %225, %19
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds double, double addrspace(1)* %1, i64 %227
  %229 = load double, double addrspace(1)* %228, align 8, !tbaa !5
  %230 = add nsw i32 %224, %24
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds double, double addrspace(1)* %7, i64 %231
  %233 = load double, double addrspace(1)* %232, align 8, !tbaa !5
  %234 = fmul contract double %229, %233
  %235 = fadd contract double %223, %234
  %236 = or i32 %163, 6
  %237 = mul nsw i32 %236, %11
  %238 = add nsw i32 %237, %19
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds double, double addrspace(1)* %1, i64 %239
  %241 = load double, double addrspace(1)* %240, align 8, !tbaa !5
  %242 = add nsw i32 %236, %24
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds double, double addrspace(1)* %7, i64 %243
  %245 = load double, double addrspace(1)* %244, align 8, !tbaa !5
  %246 = fmul contract double %241, %245
  %247 = fadd contract double %235, %246
  %248 = or i32 %163, 7
  %249 = mul nsw i32 %248, %11
  %250 = add nsw i32 %249, %19
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds double, double addrspace(1)* %1, i64 %251
  %253 = load double, double addrspace(1)* %252, align 8, !tbaa !5
  %254 = add nsw i32 %248, %24
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds double, double addrspace(1)* %7, i64 %255
  %257 = load double, double addrspace(1)* %256, align 8, !tbaa !5
  %258 = fmul contract double %253, %257
  %259 = fadd contract double %247, %258
  %260 = add nuw nsw i32 %163, 8
  %261 = add i32 %164, 8
  %262 = icmp eq i32 %261, %160
  br i1 %262, label %263, label %161, !llvm.loop !14

263:                                              ; preds = %161, %156
  %264 = phi double [ undef, %156 ], [ %259, %161 ]
  %265 = phi double [ 0.000000e+00, %156 ], [ %259, %161 ]
  %266 = phi i32 [ 0, %156 ], [ %260, %161 ]
  %267 = icmp eq i32 %157, 0
  br i1 %267, label %286, label %268

268:                                              ; preds = %263, %268
  %269 = phi double [ %282, %268 ], [ %265, %263 ]
  %270 = phi i32 [ %283, %268 ], [ %266, %263 ]
  %271 = phi i32 [ %284, %268 ], [ 0, %263 ]
  %272 = mul nsw i32 %270, %11
  %273 = add nsw i32 %272, %19
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds double, double addrspace(1)* %1, i64 %274
  %276 = load double, double addrspace(1)* %275, align 8, !tbaa !5
  %277 = add nsw i32 %270, %24
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds double, double addrspace(1)* %7, i64 %278
  %280 = load double, double addrspace(1)* %279, align 8, !tbaa !5
  %281 = fmul contract double %276, %280
  %282 = fadd contract double %269, %281
  %283 = add nuw nsw i32 %270, 1
  %284 = add i32 %271, 1
  %285 = icmp eq i32 %284, %157
  br i1 %285, label %286, label %268, !llvm.loop !15

286:                                              ; preds = %263, %268, %154
  %287 = phi double [ 0.000000e+00, %154 ], [ %264, %263 ], [ %282, %268 ]
  %288 = add i32 %23, %19
  %289 = add i32 %288, %26
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds double, double addrspace(1)* %0, i64 %290
  %292 = load double, double addrspace(1)* %291, align 8, !tbaa !5
  %293 = fsub contract double 1.000000e+00, %292
  %294 = fmul contract double %292, %293
  %295 = fmul contract double %287, %294
  %296 = add nsw i32 %22, %19
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds double, double addrspace(1)* %5, i64 %297
  store double %295, double addrspace(1)* %298, align 8, !tbaa !5
  %299 = icmp sgt i32 %11, 0
  br i1 %299, label %300, label %415

300:                                              ; preds = %286
  %301 = add nsw i32 %14, -2
  %302 = mul nsw i32 %301, %11
  %303 = add nsw i32 %23, %302
  %304 = add i32 %302, %19
  %305 = mul i32 %304, %11
  %306 = add i32 %28, %305
  %307 = add i32 %11, -1
  %308 = and i32 %11, 7
  %309 = icmp ult i32 %307, 7
  br i1 %309, label %397, label %310

310:                                              ; preds = %300
  %311 = and i32 %11, -8
  br label %312

312:                                              ; preds = %312, %310
  %313 = phi i32 [ 0, %310 ], [ %394, %312 ]
  %314 = phi i32 [ 0, %310 ], [ %395, %312 ]
  %315 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %316 = add nsw i32 %303, %313
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds double, double addrspace(1)* %0, i64 %317
  %319 = load double, double addrspace(1)* %318, align 8, !tbaa !5
  %320 = fmul contract double %315, %319
  %321 = add i32 %306, %313
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds double, double addrspace(1)* %10, i64 %322
  store double %320, double addrspace(1)* %323, align 8, !tbaa !5
  %324 = or i32 %313, 1
  %325 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %326 = add nsw i32 %303, %324
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds double, double addrspace(1)* %0, i64 %327
  %329 = load double, double addrspace(1)* %328, align 8, !tbaa !5
  %330 = fmul contract double %325, %329
  %331 = add i32 %306, %324
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds double, double addrspace(1)* %10, i64 %332
  store double %330, double addrspace(1)* %333, align 8, !tbaa !5
  %334 = or i32 %313, 2
  %335 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %336 = add nsw i32 %303, %334
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds double, double addrspace(1)* %0, i64 %337
  %339 = load double, double addrspace(1)* %338, align 8, !tbaa !5
  %340 = fmul contract double %335, %339
  %341 = add i32 %306, %334
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds double, double addrspace(1)* %10, i64 %342
  store double %340, double addrspace(1)* %343, align 8, !tbaa !5
  %344 = or i32 %313, 3
  %345 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %346 = add nsw i32 %303, %344
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds double, double addrspace(1)* %0, i64 %347
  %349 = load double, double addrspace(1)* %348, align 8, !tbaa !5
  %350 = fmul contract double %345, %349
  %351 = add i32 %306, %344
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds double, double addrspace(1)* %10, i64 %352
  store double %350, double addrspace(1)* %353, align 8, !tbaa !5
  %354 = or i32 %313, 4
  %355 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %356 = add nsw i32 %303, %354
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds double, double addrspace(1)* %0, i64 %357
  %359 = load double, double addrspace(1)* %358, align 8, !tbaa !5
  %360 = fmul contract double %355, %359
  %361 = add i32 %306, %354
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds double, double addrspace(1)* %10, i64 %362
  store double %360, double addrspace(1)* %363, align 8, !tbaa !5
  %364 = or i32 %313, 5
  %365 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %366 = add nsw i32 %303, %364
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds double, double addrspace(1)* %0, i64 %367
  %369 = load double, double addrspace(1)* %368, align 8, !tbaa !5
  %370 = fmul contract double %365, %369
  %371 = add i32 %306, %364
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds double, double addrspace(1)* %10, i64 %372
  store double %370, double addrspace(1)* %373, align 8, !tbaa !5
  %374 = or i32 %313, 6
  %375 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %376 = add nsw i32 %303, %374
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds double, double addrspace(1)* %0, i64 %377
  %379 = load double, double addrspace(1)* %378, align 8, !tbaa !5
  %380 = fmul contract double %375, %379
  %381 = add i32 %306, %374
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds double, double addrspace(1)* %10, i64 %382
  store double %380, double addrspace(1)* %383, align 8, !tbaa !5
  %384 = or i32 %313, 7
  %385 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %386 = add nsw i32 %303, %384
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds double, double addrspace(1)* %0, i64 %387
  %389 = load double, double addrspace(1)* %388, align 8, !tbaa !5
  %390 = fmul contract double %385, %389
  %391 = add i32 %306, %384
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds double, double addrspace(1)* %10, i64 %392
  store double %390, double addrspace(1)* %393, align 8, !tbaa !5
  %394 = add nuw nsw i32 %313, 8
  %395 = add i32 %314, 8
  %396 = icmp eq i32 %395, %311
  br i1 %396, label %397, label %312, !llvm.loop !16

397:                                              ; preds = %312, %300
  %398 = phi i32 [ 0, %300 ], [ %394, %312 ]
  %399 = icmp eq i32 %308, 0
  br i1 %399, label %415, label %400

400:                                              ; preds = %397, %400
  %401 = phi i32 [ %412, %400 ], [ %398, %397 ]
  %402 = phi i32 [ %413, %400 ], [ 0, %397 ]
  %403 = load double, double addrspace(1)* %298, align 8, !tbaa !5
  %404 = add nsw i32 %303, %401
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds double, double addrspace(1)* %0, i64 %405
  %407 = load double, double addrspace(1)* %406, align 8, !tbaa !5
  %408 = fmul contract double %403, %407
  %409 = add i32 %306, %401
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds double, double addrspace(1)* %10, i64 %410
  store double %408, double addrspace(1)* %411, align 8, !tbaa !5
  %412 = add nuw nsw i32 %401, 1
  %413 = add i32 %402, 1
  %414 = icmp eq i32 %413, %308
  br i1 %414, label %415, label %400, !llvm.loop !17

415:                                              ; preds = %397, %400, %286
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %416 = icmp sgt i32 %14, 2
  br i1 %416, label %417, label %433

417:                                              ; preds = %415
  %418 = add nsw i32 %14, -2
  %419 = getelementptr inbounds double, double addrspace(1)* %6, i64 %297
  %420 = add i32 %11, -1
  %421 = and i32 %11, 7
  %422 = icmp ult i32 %420, 7
  %423 = and i32 %11, -8
  %424 = icmp eq i32 %421, 0
  %425 = and i32 %11, 7
  %426 = icmp ult i32 %420, 7
  %427 = and i32 %11, -8
  %428 = icmp eq i32 %425, 0
  br label %429

429:                                              ; preds = %417, %691
  %430 = phi i32 [ %418, %417 ], [ %582, %691 ]
  %431 = mul nsw i32 %430, %11
  br i1 %299, label %432, label %573

432:                                              ; preds = %429
  br i1 %422, label %550, label %440

433:                                              ; preds = %691, %415
  br i1 %299, label %434, label %819

434:                                              ; preds = %433
  %435 = add i32 %11, -1
  %436 = and i32 %11, 7
  %437 = icmp ult i32 %435, 7
  br i1 %437, label %796, label %438

438:                                              ; preds = %434
  %439 = and i32 %11, -8
  br label %694

440:                                              ; preds = %432, %440
  %441 = phi double [ %546, %440 ], [ 0.000000e+00, %432 ]
  %442 = phi i32 [ %547, %440 ], [ 0, %432 ]
  %443 = phi i32 [ %548, %440 ], [ 0, %432 ]
  %444 = add i32 %442, %431
  %445 = mul i32 %444, %11
  %446 = add nsw i32 %445, %19
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds double, double addrspace(1)* %2, i64 %447
  %449 = load double, double addrspace(1)* %448, align 8, !tbaa !5
  %450 = add nsw i32 %442, %22
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds double, double addrspace(1)* %5, i64 %451
  %453 = load double, double addrspace(1)* %452, align 8, !tbaa !5
  %454 = fmul contract double %449, %453
  %455 = fadd contract double %441, %454
  %456 = or i32 %442, 1
  %457 = add i32 %456, %431
  %458 = mul i32 %457, %11
  %459 = add nsw i32 %458, %19
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds double, double addrspace(1)* %2, i64 %460
  %462 = load double, double addrspace(1)* %461, align 8, !tbaa !5
  %463 = add nsw i32 %456, %22
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds double, double addrspace(1)* %5, i64 %464
  %466 = load double, double addrspace(1)* %465, align 8, !tbaa !5
  %467 = fmul contract double %462, %466
  %468 = fadd contract double %455, %467
  %469 = or i32 %442, 2
  %470 = add i32 %469, %431
  %471 = mul i32 %470, %11
  %472 = add nsw i32 %471, %19
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds double, double addrspace(1)* %2, i64 %473
  %475 = load double, double addrspace(1)* %474, align 8, !tbaa !5
  %476 = add nsw i32 %469, %22
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds double, double addrspace(1)* %5, i64 %477
  %479 = load double, double addrspace(1)* %478, align 8, !tbaa !5
  %480 = fmul contract double %475, %479
  %481 = fadd contract double %468, %480
  %482 = or i32 %442, 3
  %483 = add i32 %482, %431
  %484 = mul i32 %483, %11
  %485 = add nsw i32 %484, %19
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds double, double addrspace(1)* %2, i64 %486
  %488 = load double, double addrspace(1)* %487, align 8, !tbaa !5
  %489 = add nsw i32 %482, %22
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds double, double addrspace(1)* %5, i64 %490
  %492 = load double, double addrspace(1)* %491, align 8, !tbaa !5
  %493 = fmul contract double %488, %492
  %494 = fadd contract double %481, %493
  %495 = or i32 %442, 4
  %496 = add i32 %495, %431
  %497 = mul i32 %496, %11
  %498 = add nsw i32 %497, %19
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds double, double addrspace(1)* %2, i64 %499
  %501 = load double, double addrspace(1)* %500, align 8, !tbaa !5
  %502 = add nsw i32 %495, %22
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds double, double addrspace(1)* %5, i64 %503
  %505 = load double, double addrspace(1)* %504, align 8, !tbaa !5
  %506 = fmul contract double %501, %505
  %507 = fadd contract double %494, %506
  %508 = or i32 %442, 5
  %509 = add i32 %508, %431
  %510 = mul i32 %509, %11
  %511 = add nsw i32 %510, %19
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds double, double addrspace(1)* %2, i64 %512
  %514 = load double, double addrspace(1)* %513, align 8, !tbaa !5
  %515 = add nsw i32 %508, %22
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds double, double addrspace(1)* %5, i64 %516
  %518 = load double, double addrspace(1)* %517, align 8, !tbaa !5
  %519 = fmul contract double %514, %518
  %520 = fadd contract double %507, %519
  %521 = or i32 %442, 6
  %522 = add i32 %521, %431
  %523 = mul i32 %522, %11
  %524 = add nsw i32 %523, %19
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds double, double addrspace(1)* %2, i64 %525
  %527 = load double, double addrspace(1)* %526, align 8, !tbaa !5
  %528 = add nsw i32 %521, %22
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds double, double addrspace(1)* %5, i64 %529
  %531 = load double, double addrspace(1)* %530, align 8, !tbaa !5
  %532 = fmul contract double %527, %531
  %533 = fadd contract double %520, %532
  %534 = or i32 %442, 7
  %535 = add i32 %534, %431
  %536 = mul i32 %535, %11
  %537 = add nsw i32 %536, %19
  %538 = sext i32 %537 to i64
  %539 = getelementptr inbounds double, double addrspace(1)* %2, i64 %538
  %540 = load double, double addrspace(1)* %539, align 8, !tbaa !5
  %541 = add nsw i32 %534, %22
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds double, double addrspace(1)* %5, i64 %542
  %544 = load double, double addrspace(1)* %543, align 8, !tbaa !5
  %545 = fmul contract double %540, %544
  %546 = fadd contract double %533, %545
  %547 = add nuw nsw i32 %442, 8
  %548 = add i32 %443, 8
  %549 = icmp eq i32 %548, %423
  br i1 %549, label %550, label %440, !llvm.loop !18

550:                                              ; preds = %440, %432
  %551 = phi double [ undef, %432 ], [ %546, %440 ]
  %552 = phi double [ 0.000000e+00, %432 ], [ %546, %440 ]
  %553 = phi i32 [ 0, %432 ], [ %547, %440 ]
  br i1 %424, label %573, label %554

554:                                              ; preds = %550, %554
  %555 = phi double [ %569, %554 ], [ %552, %550 ]
  %556 = phi i32 [ %570, %554 ], [ %553, %550 ]
  %557 = phi i32 [ %571, %554 ], [ 0, %550 ]
  %558 = add i32 %556, %431
  %559 = mul i32 %558, %11
  %560 = add nsw i32 %559, %19
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds double, double addrspace(1)* %2, i64 %561
  %563 = load double, double addrspace(1)* %562, align 8, !tbaa !5
  %564 = add nsw i32 %556, %22
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds double, double addrspace(1)* %5, i64 %565
  %567 = load double, double addrspace(1)* %566, align 8, !tbaa !5
  %568 = fmul contract double %563, %567
  %569 = fadd contract double %555, %568
  %570 = add nuw nsw i32 %556, 1
  %571 = add i32 %557, 1
  %572 = icmp eq i32 %571, %421
  br i1 %572, label %573, label %554, !llvm.loop !19

573:                                              ; preds = %550, %554, %429
  %574 = phi double [ 0.000000e+00, %429 ], [ %551, %550 ], [ %569, %554 ]
  %575 = add i32 %288, %431
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds double, double addrspace(1)* %0, i64 %576
  %578 = load double, double addrspace(1)* %577, align 8, !tbaa !5
  %579 = fsub contract double 1.000000e+00, %578
  %580 = fmul contract double %578, %579
  %581 = fmul contract double %574, %580
  store double %581, double addrspace(1)* %419, align 8, !tbaa !5
  %582 = add nsw i32 %430, -1
  br i1 %299, label %583, label %691

583:                                              ; preds = %573
  %584 = mul nsw i32 %582, %11
  %585 = add nsw i32 %584, %23
  %586 = add i32 %584, %19
  %587 = mul i32 %586, %11
  %588 = add i32 %587, %28
  br i1 %426, label %674, label %589

589:                                              ; preds = %583, %589
  %590 = phi i32 [ %671, %589 ], [ 0, %583 ]
  %591 = phi i32 [ %672, %589 ], [ 0, %583 ]
  %592 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %593 = add nsw i32 %585, %590
  %594 = sext i32 %593 to i64
  %595 = getelementptr inbounds double, double addrspace(1)* %0, i64 %594
  %596 = load double, double addrspace(1)* %595, align 8, !tbaa !5
  %597 = fmul contract double %592, %596
  %598 = add i32 %588, %590
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds double, double addrspace(1)* %10, i64 %599
  store double %597, double addrspace(1)* %600, align 8, !tbaa !5
  %601 = or i32 %590, 1
  %602 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %603 = add nsw i32 %585, %601
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds double, double addrspace(1)* %0, i64 %604
  %606 = load double, double addrspace(1)* %605, align 8, !tbaa !5
  %607 = fmul contract double %602, %606
  %608 = add i32 %588, %601
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds double, double addrspace(1)* %10, i64 %609
  store double %607, double addrspace(1)* %610, align 8, !tbaa !5
  %611 = or i32 %590, 2
  %612 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %613 = add nsw i32 %585, %611
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds double, double addrspace(1)* %0, i64 %614
  %616 = load double, double addrspace(1)* %615, align 8, !tbaa !5
  %617 = fmul contract double %612, %616
  %618 = add i32 %588, %611
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds double, double addrspace(1)* %10, i64 %619
  store double %617, double addrspace(1)* %620, align 8, !tbaa !5
  %621 = or i32 %590, 3
  %622 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %623 = add nsw i32 %585, %621
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds double, double addrspace(1)* %0, i64 %624
  %626 = load double, double addrspace(1)* %625, align 8, !tbaa !5
  %627 = fmul contract double %622, %626
  %628 = add i32 %588, %621
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds double, double addrspace(1)* %10, i64 %629
  store double %627, double addrspace(1)* %630, align 8, !tbaa !5
  %631 = or i32 %590, 4
  %632 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %633 = add nsw i32 %585, %631
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds double, double addrspace(1)* %0, i64 %634
  %636 = load double, double addrspace(1)* %635, align 8, !tbaa !5
  %637 = fmul contract double %632, %636
  %638 = add i32 %588, %631
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds double, double addrspace(1)* %10, i64 %639
  store double %637, double addrspace(1)* %640, align 8, !tbaa !5
  %641 = or i32 %590, 5
  %642 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %643 = add nsw i32 %585, %641
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds double, double addrspace(1)* %0, i64 %644
  %646 = load double, double addrspace(1)* %645, align 8, !tbaa !5
  %647 = fmul contract double %642, %646
  %648 = add i32 %588, %641
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds double, double addrspace(1)* %10, i64 %649
  store double %647, double addrspace(1)* %650, align 8, !tbaa !5
  %651 = or i32 %590, 6
  %652 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %653 = add nsw i32 %585, %651
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds double, double addrspace(1)* %0, i64 %654
  %656 = load double, double addrspace(1)* %655, align 8, !tbaa !5
  %657 = fmul contract double %652, %656
  %658 = add i32 %588, %651
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds double, double addrspace(1)* %10, i64 %659
  store double %657, double addrspace(1)* %660, align 8, !tbaa !5
  %661 = or i32 %590, 7
  %662 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %663 = add nsw i32 %585, %661
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds double, double addrspace(1)* %0, i64 %664
  %666 = load double, double addrspace(1)* %665, align 8, !tbaa !5
  %667 = fmul contract double %662, %666
  %668 = add i32 %588, %661
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds double, double addrspace(1)* %10, i64 %669
  store double %667, double addrspace(1)* %670, align 8, !tbaa !5
  %671 = add nuw nsw i32 %590, 8
  %672 = add i32 %591, 8
  %673 = icmp eq i32 %672, %427
  br i1 %673, label %674, label %589, !llvm.loop !20

674:                                              ; preds = %589, %583
  %675 = phi i32 [ 0, %583 ], [ %671, %589 ]
  br i1 %428, label %691, label %676

676:                                              ; preds = %674, %676
  %677 = phi i32 [ %688, %676 ], [ %675, %674 ]
  %678 = phi i32 [ %689, %676 ], [ 0, %674 ]
  %679 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  %680 = add nsw i32 %585, %677
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds double, double addrspace(1)* %0, i64 %681
  %683 = load double, double addrspace(1)* %682, align 8, !tbaa !5
  %684 = fmul contract double %679, %683
  %685 = add i32 %588, %677
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds double, double addrspace(1)* %10, i64 %686
  store double %684, double addrspace(1)* %687, align 8, !tbaa !5
  %688 = add nuw nsw i32 %677, 1
  %689 = add i32 %678, 1
  %690 = icmp eq i32 %689, %425
  br i1 %690, label %691, label %676, !llvm.loop !21

691:                                              ; preds = %674, %676, %573
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %692 = load double, double addrspace(1)* %419, align 8, !tbaa !5
  store double %692, double addrspace(1)* %298, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %693 = icmp sgt i32 %430, 1
  br i1 %693, label %429, label %433, !llvm.loop !22

694:                                              ; preds = %694, %438
  %695 = phi double [ 0.000000e+00, %438 ], [ %792, %694 ]
  %696 = phi i32 [ 0, %438 ], [ %793, %694 ]
  %697 = phi i32 [ 0, %438 ], [ %794, %694 ]
  %698 = mul nsw i32 %696, %11
  %699 = add nsw i32 %698, %19
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds double, double addrspace(1)* %2, i64 %700
  %702 = load double, double addrspace(1)* %701, align 8, !tbaa !5
  %703 = add nsw i32 %696, %22
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds double, double addrspace(1)* %5, i64 %704
  %706 = load double, double addrspace(1)* %705, align 8, !tbaa !5
  %707 = fmul contract double %702, %706
  %708 = fadd contract double %695, %707
  %709 = or i32 %696, 1
  %710 = mul nsw i32 %709, %11
  %711 = add nsw i32 %710, %19
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds double, double addrspace(1)* %2, i64 %712
  %714 = load double, double addrspace(1)* %713, align 8, !tbaa !5
  %715 = add nsw i32 %709, %22
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds double, double addrspace(1)* %5, i64 %716
  %718 = load double, double addrspace(1)* %717, align 8, !tbaa !5
  %719 = fmul contract double %714, %718
  %720 = fadd contract double %708, %719
  %721 = or i32 %696, 2
  %722 = mul nsw i32 %721, %11
  %723 = add nsw i32 %722, %19
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds double, double addrspace(1)* %2, i64 %724
  %726 = load double, double addrspace(1)* %725, align 8, !tbaa !5
  %727 = add nsw i32 %721, %22
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds double, double addrspace(1)* %5, i64 %728
  %730 = load double, double addrspace(1)* %729, align 8, !tbaa !5
  %731 = fmul contract double %726, %730
  %732 = fadd contract double %720, %731
  %733 = or i32 %696, 3
  %734 = mul nsw i32 %733, %11
  %735 = add nsw i32 %734, %19
  %736 = sext i32 %735 to i64
  %737 = getelementptr inbounds double, double addrspace(1)* %2, i64 %736
  %738 = load double, double addrspace(1)* %737, align 8, !tbaa !5
  %739 = add nsw i32 %733, %22
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds double, double addrspace(1)* %5, i64 %740
  %742 = load double, double addrspace(1)* %741, align 8, !tbaa !5
  %743 = fmul contract double %738, %742
  %744 = fadd contract double %732, %743
  %745 = or i32 %696, 4
  %746 = mul nsw i32 %745, %11
  %747 = add nsw i32 %746, %19
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds double, double addrspace(1)* %2, i64 %748
  %750 = load double, double addrspace(1)* %749, align 8, !tbaa !5
  %751 = add nsw i32 %745, %22
  %752 = sext i32 %751 to i64
  %753 = getelementptr inbounds double, double addrspace(1)* %5, i64 %752
  %754 = load double, double addrspace(1)* %753, align 8, !tbaa !5
  %755 = fmul contract double %750, %754
  %756 = fadd contract double %744, %755
  %757 = or i32 %696, 5
  %758 = mul nsw i32 %757, %11
  %759 = add nsw i32 %758, %19
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds double, double addrspace(1)* %2, i64 %760
  %762 = load double, double addrspace(1)* %761, align 8, !tbaa !5
  %763 = add nsw i32 %757, %22
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds double, double addrspace(1)* %5, i64 %764
  %766 = load double, double addrspace(1)* %765, align 8, !tbaa !5
  %767 = fmul contract double %762, %766
  %768 = fadd contract double %756, %767
  %769 = or i32 %696, 6
  %770 = mul nsw i32 %769, %11
  %771 = add nsw i32 %770, %19
  %772 = sext i32 %771 to i64
  %773 = getelementptr inbounds double, double addrspace(1)* %2, i64 %772
  %774 = load double, double addrspace(1)* %773, align 8, !tbaa !5
  %775 = add nsw i32 %769, %22
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds double, double addrspace(1)* %5, i64 %776
  %778 = load double, double addrspace(1)* %777, align 8, !tbaa !5
  %779 = fmul contract double %774, %778
  %780 = fadd contract double %768, %779
  %781 = or i32 %696, 7
  %782 = mul nsw i32 %781, %11
  %783 = add nsw i32 %782, %19
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds double, double addrspace(1)* %2, i64 %784
  %786 = load double, double addrspace(1)* %785, align 8, !tbaa !5
  %787 = add nsw i32 %781, %22
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds double, double addrspace(1)* %5, i64 %788
  %790 = load double, double addrspace(1)* %789, align 8, !tbaa !5
  %791 = fmul contract double %786, %790
  %792 = fadd contract double %780, %791
  %793 = add nuw nsw i32 %696, 8
  %794 = add i32 %697, 8
  %795 = icmp eq i32 %794, %439
  br i1 %795, label %796, label %694, !llvm.loop !23

796:                                              ; preds = %694, %434
  %797 = phi double [ undef, %434 ], [ %792, %694 ]
  %798 = phi double [ 0.000000e+00, %434 ], [ %792, %694 ]
  %799 = phi i32 [ 0, %434 ], [ %793, %694 ]
  %800 = icmp eq i32 %436, 0
  br i1 %800, label %819, label %801

801:                                              ; preds = %796, %801
  %802 = phi double [ %815, %801 ], [ %798, %796 ]
  %803 = phi i32 [ %816, %801 ], [ %799, %796 ]
  %804 = phi i32 [ %817, %801 ], [ 0, %796 ]
  %805 = mul nsw i32 %803, %11
  %806 = add nsw i32 %805, %19
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds double, double addrspace(1)* %2, i64 %807
  %809 = load double, double addrspace(1)* %808, align 8, !tbaa !5
  %810 = add nsw i32 %803, %22
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds double, double addrspace(1)* %5, i64 %811
  %813 = load double, double addrspace(1)* %812, align 8, !tbaa !5
  %814 = fmul contract double %809, %813
  %815 = fadd contract double %802, %814
  %816 = add nuw nsw i32 %803, 1
  %817 = add i32 %804, 1
  %818 = icmp eq i32 %817, %436
  br i1 %818, label %819, label %801, !llvm.loop !24

819:                                              ; preds = %796, %801, %433
  %820 = phi double [ 0.000000e+00, %433 ], [ %797, %796 ], [ %815, %801 ]
  %821 = sext i32 %288 to i64
  %822 = getelementptr inbounds double, double addrspace(1)* %0, i64 %821
  %823 = load double, double addrspace(1)* %822, align 8, !tbaa !5
  %824 = fsub contract double 1.000000e+00, %823
  %825 = fmul contract double %823, %824
  %826 = fmul contract double %820, %825
  %827 = getelementptr inbounds double, double addrspace(1)* %6, i64 %297
  store double %826, double addrspace(1)* %827, align 8, !tbaa !5
  %828 = icmp sgt i32 %12, 0
  br i1 %828, label %829, label %939

829:                                              ; preds = %819
  %830 = mul nsw i32 %19, %12
  %831 = add nsw i32 %30, %830
  %832 = and i32 %12, 7
  %833 = icmp ult i32 %12, 8
  br i1 %833, label %921, label %834

834:                                              ; preds = %829
  %835 = and i32 %12, -8
  br label %836

836:                                              ; preds = %836, %834
  %837 = phi i32 [ 0, %834 ], [ %918, %836 ]
  %838 = phi i32 [ 0, %834 ], [ %919, %836 ]
  %839 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %840 = add nsw i32 %837, %29
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds double, double addrspace(1)* %15, i64 %841
  %843 = load double, double addrspace(1)* %842, align 8, !tbaa !5
  %844 = fmul contract double %839, %843
  %845 = add nsw i32 %831, %837
  %846 = sext i32 %845 to i64
  %847 = getelementptr inbounds double, double addrspace(1)* %8, i64 %846
  store double %844, double addrspace(1)* %847, align 8, !tbaa !5
  %848 = or i32 %837, 1
  %849 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %850 = add nsw i32 %848, %29
  %851 = sext i32 %850 to i64
  %852 = getelementptr inbounds double, double addrspace(1)* %15, i64 %851
  %853 = load double, double addrspace(1)* %852, align 8, !tbaa !5
  %854 = fmul contract double %849, %853
  %855 = add nsw i32 %831, %848
  %856 = sext i32 %855 to i64
  %857 = getelementptr inbounds double, double addrspace(1)* %8, i64 %856
  store double %854, double addrspace(1)* %857, align 8, !tbaa !5
  %858 = or i32 %837, 2
  %859 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %860 = add nsw i32 %858, %29
  %861 = sext i32 %860 to i64
  %862 = getelementptr inbounds double, double addrspace(1)* %15, i64 %861
  %863 = load double, double addrspace(1)* %862, align 8, !tbaa !5
  %864 = fmul contract double %859, %863
  %865 = add nsw i32 %831, %858
  %866 = sext i32 %865 to i64
  %867 = getelementptr inbounds double, double addrspace(1)* %8, i64 %866
  store double %864, double addrspace(1)* %867, align 8, !tbaa !5
  %868 = or i32 %837, 3
  %869 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %870 = add nsw i32 %868, %29
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds double, double addrspace(1)* %15, i64 %871
  %873 = load double, double addrspace(1)* %872, align 8, !tbaa !5
  %874 = fmul contract double %869, %873
  %875 = add nsw i32 %831, %868
  %876 = sext i32 %875 to i64
  %877 = getelementptr inbounds double, double addrspace(1)* %8, i64 %876
  store double %874, double addrspace(1)* %877, align 8, !tbaa !5
  %878 = or i32 %837, 4
  %879 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %880 = add nsw i32 %878, %29
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds double, double addrspace(1)* %15, i64 %881
  %883 = load double, double addrspace(1)* %882, align 8, !tbaa !5
  %884 = fmul contract double %879, %883
  %885 = add nsw i32 %831, %878
  %886 = sext i32 %885 to i64
  %887 = getelementptr inbounds double, double addrspace(1)* %8, i64 %886
  store double %884, double addrspace(1)* %887, align 8, !tbaa !5
  %888 = or i32 %837, 5
  %889 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %890 = add nsw i32 %888, %29
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds double, double addrspace(1)* %15, i64 %891
  %893 = load double, double addrspace(1)* %892, align 8, !tbaa !5
  %894 = fmul contract double %889, %893
  %895 = add nsw i32 %831, %888
  %896 = sext i32 %895 to i64
  %897 = getelementptr inbounds double, double addrspace(1)* %8, i64 %896
  store double %894, double addrspace(1)* %897, align 8, !tbaa !5
  %898 = or i32 %837, 6
  %899 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %900 = add nsw i32 %898, %29
  %901 = sext i32 %900 to i64
  %902 = getelementptr inbounds double, double addrspace(1)* %15, i64 %901
  %903 = load double, double addrspace(1)* %902, align 8, !tbaa !5
  %904 = fmul contract double %899, %903
  %905 = add nsw i32 %831, %898
  %906 = sext i32 %905 to i64
  %907 = getelementptr inbounds double, double addrspace(1)* %8, i64 %906
  store double %904, double addrspace(1)* %907, align 8, !tbaa !5
  %908 = or i32 %837, 7
  %909 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %910 = add nsw i32 %908, %29
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds double, double addrspace(1)* %15, i64 %911
  %913 = load double, double addrspace(1)* %912, align 8, !tbaa !5
  %914 = fmul contract double %909, %913
  %915 = add nsw i32 %831, %908
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds double, double addrspace(1)* %8, i64 %916
  store double %914, double addrspace(1)* %917, align 8, !tbaa !5
  %918 = add nuw nsw i32 %837, 8
  %919 = add i32 %838, 8
  %920 = icmp eq i32 %919, %835
  br i1 %920, label %921, label %836, !llvm.loop !25

921:                                              ; preds = %836, %829
  %922 = phi i32 [ 0, %829 ], [ %918, %836 ]
  %923 = icmp eq i32 %832, 0
  br i1 %923, label %939, label %924

924:                                              ; preds = %921, %924
  %925 = phi i32 [ %936, %924 ], [ %922, %921 ]
  %926 = phi i32 [ %937, %924 ], [ 0, %921 ]
  %927 = load double, double addrspace(1)* %827, align 8, !tbaa !5
  %928 = add nsw i32 %925, %29
  %929 = sext i32 %928 to i64
  %930 = getelementptr inbounds double, double addrspace(1)* %15, i64 %929
  %931 = load double, double addrspace(1)* %930, align 8, !tbaa !5
  %932 = fmul contract double %927, %931
  %933 = add nsw i32 %831, %925
  %934 = sext i32 %933 to i64
  %935 = getelementptr inbounds double, double addrspace(1)* %8, i64 %934
  store double %932, double addrspace(1)* %935, align 8, !tbaa !5
  %936 = add nuw nsw i32 %925, 1
  %937 = add i32 %926, 1
  %938 = icmp eq i32 %937, %832
  br i1 %938, label %939, label %924, !llvm.loop !26

939:                                              ; preds = %921, %924, %819
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !11}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !11}
!26 = distinct !{!26, !13}
