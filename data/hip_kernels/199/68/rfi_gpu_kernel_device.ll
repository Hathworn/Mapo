; ModuleID = '../data/hip_kernels/199/68/main.cu'
source_filename = "../data/hip_kernels/199/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14rfi_gpu_kernelPtii(i16 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %2, 0
  %14 = mul nsw i32 %12, %2
  br i1 %13, label %15, label %61

15:                                               ; preds = %3
  %16 = and i32 %2, 7
  %17 = icmp ult i32 %2, 8
  br i1 %17, label %29, label %18

18:                                               ; preds = %15
  %19 = and i32 %2, -8
  br label %725

20:                                               ; preds = %694
  %21 = fadd contract float %698, %723
  %22 = fsub contract float %698, %723
  %23 = fptoui float %698 to i16
  %24 = and i32 %2, 1
  %25 = icmp eq i32 %2, 5
  br i1 %25, label %836, label %26

26:                                               ; preds = %20
  %27 = and i32 %2, -2
  %28 = add i32 %27, -6
  br label %806

29:                                               ; preds = %725, %15
  %30 = phi float [ undef, %15 ], [ %800, %725 ]
  %31 = phi float [ undef, %15 ], [ %801, %725 ]
  %32 = phi i32 [ undef, %15 ], [ %802, %725 ]
  %33 = phi i32 [ 0, %15 ], [ %802, %725 ]
  %34 = phi i32 [ 0, %15 ], [ %803, %725 ]
  %35 = phi float [ 0.000000e+00, %15 ], [ %801, %725 ]
  %36 = phi float [ 0.000000e+00, %15 ], [ %800, %725 ]
  %37 = icmp eq i32 %16, 0
  br i1 %37, label %56, label %38

38:                                               ; preds = %29, %38
  %39 = phi i32 [ %52, %38 ], [ %33, %29 ]
  %40 = phi i32 [ %53, %38 ], [ %34, %29 ]
  %41 = phi float [ %51, %38 ], [ %35, %29 ]
  %42 = phi float [ %50, %38 ], [ %36, %29 ]
  %43 = phi i32 [ %54, %38 ], [ 0, %29 ]
  %44 = add nsw i32 %40, %14
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %45
  %47 = load i16, i16 addrspace(1)* %46, align 2, !tbaa !7, !amdgpu.noclobber !5
  %48 = uitofp i16 %47 to float
  %49 = fmul contract float %48, %48
  %50 = fadd contract float %42, %48
  %51 = fadd contract float %41, %49
  %52 = add nuw nsw i32 %39, 1
  %53 = add nuw nsw i32 %40, 1
  %54 = add i32 %43, 1
  %55 = icmp eq i32 %54, %16
  br i1 %55, label %56, label %38, !llvm.loop !11

56:                                               ; preds = %38, %29
  %57 = phi float [ %30, %29 ], [ %50, %38 ]
  %58 = phi float [ %31, %29 ], [ %51, %38 ]
  %59 = phi i32 [ %32, %29 ], [ %52, %38 ]
  %60 = sitofp i32 %59 to float
  br label %61

61:                                               ; preds = %56, %3
  %62 = phi float [ 0.000000e+00, %3 ], [ %57, %56 ]
  %63 = phi float [ 0.000000e+00, %3 ], [ %58, %56 ]
  %64 = phi float [ 0.000000e+00, %3 ], [ %60, %56 ]
  %65 = fdiv contract float %62, %64
  %66 = fdiv contract float %63, %64
  %67 = fmul contract float %65, %65
  %68 = fsub contract float %66, %67
  %69 = fcmp olt float %68, 0x39F0000000000000
  %70 = select i1 %69, float 0x41F0000000000000, float 1.000000e+00
  %71 = fmul float %68, %70
  %72 = tail call float @llvm.sqrt.f32(float %71)
  %73 = bitcast float %72 to i32
  %74 = add nsw i32 %73, -1
  %75 = bitcast i32 %74 to float
  %76 = add nsw i32 %73, 1
  %77 = bitcast i32 %76 to float
  %78 = tail call i1 @llvm.amdgcn.class.f32(float %71, i32 608)
  %79 = select i1 %69, float 0x3EF0000000000000, float 1.000000e+00
  %80 = fneg float %77
  %81 = tail call float @llvm.fma.f32(float %80, float %72, float %71)
  %82 = fcmp ogt float %81, 0.000000e+00
  %83 = fneg float %75
  %84 = tail call float @llvm.fma.f32(float %83, float %72, float %71)
  %85 = fcmp ole float %84, 0.000000e+00
  %86 = select i1 %85, float %75, float %72
  %87 = select i1 %82, float %77, float %86
  %88 = fmul float %79, %87
  %89 = select i1 %78, float %71, float %88
  %90 = fmul contract float %89, 4.000000e+00
  br i1 %13, label %91, label %272

91:                                               ; preds = %61
  %92 = fadd contract float %65, %90
  %93 = fsub contract float %65, %90
  %94 = and i32 %2, 7
  %95 = icmp ult i32 %2, 8
  br i1 %95, label %234, label %96

96:                                               ; preds = %91
  %97 = and i32 %2, -8
  br label %98

98:                                               ; preds = %98, %96
  %99 = phi i32 [ 0, %96 ], [ %230, %98 ]
  %100 = phi i32 [ 0, %96 ], [ %231, %98 ]
  %101 = phi float [ 0.000000e+00, %96 ], [ %228, %98 ]
  %102 = phi float [ 0.000000e+00, %96 ], [ %226, %98 ]
  %103 = phi i32 [ 0, %96 ], [ %232, %98 ]
  %104 = add nsw i32 %100, %14
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %105
  %107 = load i16, i16 addrspace(1)* %106, align 2, !tbaa !7, !amdgpu.noclobber !5
  %108 = uitofp i16 %107 to float
  %109 = fcmp contract ogt float %92, %108
  %110 = fcmp contract olt float %93, %108
  %111 = and i1 %109, %110
  %112 = fmul contract float %108, %108
  %113 = select i1 %111, float %108, float -0.000000e+00
  %114 = fadd contract float %102, %113
  %115 = select i1 %111, float %112, float -0.000000e+00
  %116 = fadd contract float %101, %115
  %117 = zext i1 %111 to i32
  %118 = add nuw nsw i32 %99, %117
  %119 = or i32 %100, 1
  %120 = add nsw i32 %119, %14
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %121
  %123 = load i16, i16 addrspace(1)* %122, align 2, !tbaa !7, !amdgpu.noclobber !5
  %124 = uitofp i16 %123 to float
  %125 = fcmp contract ogt float %92, %124
  %126 = fcmp contract olt float %93, %124
  %127 = and i1 %125, %126
  %128 = fmul contract float %124, %124
  %129 = select i1 %127, float %124, float -0.000000e+00
  %130 = fadd contract float %114, %129
  %131 = select i1 %127, float %128, float -0.000000e+00
  %132 = fadd contract float %116, %131
  %133 = zext i1 %127 to i32
  %134 = add nuw nsw i32 %118, %133
  %135 = or i32 %100, 2
  %136 = add nsw i32 %135, %14
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %137
  %139 = load i16, i16 addrspace(1)* %138, align 2, !tbaa !7, !amdgpu.noclobber !5
  %140 = uitofp i16 %139 to float
  %141 = fcmp contract ogt float %92, %140
  %142 = fcmp contract olt float %93, %140
  %143 = and i1 %141, %142
  %144 = fmul contract float %140, %140
  %145 = select i1 %143, float %140, float -0.000000e+00
  %146 = fadd contract float %130, %145
  %147 = select i1 %143, float %144, float -0.000000e+00
  %148 = fadd contract float %132, %147
  %149 = zext i1 %143 to i32
  %150 = add nuw nsw i32 %134, %149
  %151 = or i32 %100, 3
  %152 = add nsw i32 %151, %14
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %153
  %155 = load i16, i16 addrspace(1)* %154, align 2, !tbaa !7, !amdgpu.noclobber !5
  %156 = uitofp i16 %155 to float
  %157 = fcmp contract ogt float %92, %156
  %158 = fcmp contract olt float %93, %156
  %159 = and i1 %157, %158
  %160 = fmul contract float %156, %156
  %161 = select i1 %159, float %156, float -0.000000e+00
  %162 = fadd contract float %146, %161
  %163 = select i1 %159, float %160, float -0.000000e+00
  %164 = fadd contract float %148, %163
  %165 = zext i1 %159 to i32
  %166 = add nuw nsw i32 %150, %165
  %167 = or i32 %100, 4
  %168 = add nsw i32 %167, %14
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %169
  %171 = load i16, i16 addrspace(1)* %170, align 2, !tbaa !7, !amdgpu.noclobber !5
  %172 = uitofp i16 %171 to float
  %173 = fcmp contract ogt float %92, %172
  %174 = fcmp contract olt float %93, %172
  %175 = and i1 %173, %174
  %176 = fmul contract float %172, %172
  %177 = select i1 %175, float %172, float -0.000000e+00
  %178 = fadd contract float %162, %177
  %179 = select i1 %175, float %176, float -0.000000e+00
  %180 = fadd contract float %164, %179
  %181 = zext i1 %175 to i32
  %182 = add nuw nsw i32 %166, %181
  %183 = or i32 %100, 5
  %184 = add nsw i32 %183, %14
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %185
  %187 = load i16, i16 addrspace(1)* %186, align 2, !tbaa !7, !amdgpu.noclobber !5
  %188 = uitofp i16 %187 to float
  %189 = fcmp contract ogt float %92, %188
  %190 = fcmp contract olt float %93, %188
  %191 = and i1 %189, %190
  %192 = fmul contract float %188, %188
  %193 = select i1 %191, float %188, float -0.000000e+00
  %194 = fadd contract float %178, %193
  %195 = select i1 %191, float %192, float -0.000000e+00
  %196 = fadd contract float %180, %195
  %197 = zext i1 %191 to i32
  %198 = add nuw nsw i32 %182, %197
  %199 = or i32 %100, 6
  %200 = add nsw i32 %199, %14
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %201
  %203 = load i16, i16 addrspace(1)* %202, align 2, !tbaa !7, !amdgpu.noclobber !5
  %204 = uitofp i16 %203 to float
  %205 = fcmp contract ogt float %92, %204
  %206 = fcmp contract olt float %93, %204
  %207 = and i1 %205, %206
  %208 = fmul contract float %204, %204
  %209 = select i1 %207, float %204, float -0.000000e+00
  %210 = fadd contract float %194, %209
  %211 = select i1 %207, float %208, float -0.000000e+00
  %212 = fadd contract float %196, %211
  %213 = zext i1 %207 to i32
  %214 = add nuw nsw i32 %198, %213
  %215 = or i32 %100, 7
  %216 = add nsw i32 %215, %14
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %217
  %219 = load i16, i16 addrspace(1)* %218, align 2, !tbaa !7, !amdgpu.noclobber !5
  %220 = uitofp i16 %219 to float
  %221 = fcmp contract ogt float %92, %220
  %222 = fcmp contract olt float %93, %220
  %223 = and i1 %221, %222
  %224 = fmul contract float %220, %220
  %225 = select i1 %223, float %220, float -0.000000e+00
  %226 = fadd contract float %210, %225
  %227 = select i1 %223, float %224, float -0.000000e+00
  %228 = fadd contract float %212, %227
  %229 = zext i1 %223 to i32
  %230 = add nuw nsw i32 %214, %229
  %231 = add nuw nsw i32 %100, 8
  %232 = add i32 %103, 8
  %233 = icmp eq i32 %232, %97
  br i1 %233, label %234, label %98, !llvm.loop !13

234:                                              ; preds = %98, %91
  %235 = phi float [ undef, %91 ], [ %226, %98 ]
  %236 = phi float [ undef, %91 ], [ %228, %98 ]
  %237 = phi i32 [ undef, %91 ], [ %230, %98 ]
  %238 = phi i32 [ 0, %91 ], [ %230, %98 ]
  %239 = phi i32 [ 0, %91 ], [ %231, %98 ]
  %240 = phi float [ 0.000000e+00, %91 ], [ %228, %98 ]
  %241 = phi float [ 0.000000e+00, %91 ], [ %226, %98 ]
  %242 = icmp eq i32 %94, 0
  br i1 %242, label %267, label %243

243:                                              ; preds = %234, %243
  %244 = phi i32 [ %263, %243 ], [ %238, %234 ]
  %245 = phi i32 [ %264, %243 ], [ %239, %234 ]
  %246 = phi float [ %261, %243 ], [ %240, %234 ]
  %247 = phi float [ %259, %243 ], [ %241, %234 ]
  %248 = phi i32 [ %265, %243 ], [ 0, %234 ]
  %249 = add nsw i32 %245, %14
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %250
  %252 = load i16, i16 addrspace(1)* %251, align 2, !tbaa !7, !amdgpu.noclobber !5
  %253 = uitofp i16 %252 to float
  %254 = fcmp contract ogt float %92, %253
  %255 = fcmp contract olt float %93, %253
  %256 = and i1 %254, %255
  %257 = fmul contract float %253, %253
  %258 = select i1 %256, float %253, float -0.000000e+00
  %259 = fadd contract float %247, %258
  %260 = select i1 %256, float %257, float -0.000000e+00
  %261 = fadd contract float %246, %260
  %262 = zext i1 %256 to i32
  %263 = add nuw nsw i32 %244, %262
  %264 = add nuw nsw i32 %245, 1
  %265 = add i32 %248, 1
  %266 = icmp eq i32 %265, %94
  br i1 %266, label %267, label %243, !llvm.loop !15

267:                                              ; preds = %243, %234
  %268 = phi float [ %235, %234 ], [ %259, %243 ]
  %269 = phi float [ %236, %234 ], [ %261, %243 ]
  %270 = phi i32 [ %237, %234 ], [ %263, %243 ]
  %271 = sitofp i32 %270 to float
  br label %272

272:                                              ; preds = %267, %61
  %273 = phi float [ 0.000000e+00, %61 ], [ %268, %267 ]
  %274 = phi float [ 0.000000e+00, %61 ], [ %269, %267 ]
  %275 = phi float [ 0.000000e+00, %61 ], [ %271, %267 ]
  %276 = fdiv contract float %273, %275
  %277 = fdiv contract float %274, %275
  %278 = fmul contract float %276, %276
  %279 = fsub contract float %277, %278
  %280 = fcmp olt float %279, 0x39F0000000000000
  %281 = select i1 %280, float 0x41F0000000000000, float 1.000000e+00
  %282 = fmul float %279, %281
  %283 = tail call float @llvm.sqrt.f32(float %282)
  %284 = bitcast float %283 to i32
  %285 = add nsw i32 %284, -1
  %286 = bitcast i32 %285 to float
  %287 = add nsw i32 %284, 1
  %288 = bitcast i32 %287 to float
  %289 = tail call i1 @llvm.amdgcn.class.f32(float %282, i32 608)
  %290 = select i1 %280, float 0x3EF0000000000000, float 1.000000e+00
  %291 = fneg float %288
  %292 = tail call float @llvm.fma.f32(float %291, float %283, float %282)
  %293 = fcmp ogt float %292, 0.000000e+00
  %294 = fneg float %286
  %295 = tail call float @llvm.fma.f32(float %294, float %283, float %282)
  %296 = fcmp ole float %295, 0.000000e+00
  %297 = select i1 %296, float %286, float %283
  %298 = select i1 %293, float %288, float %297
  %299 = fmul float %290, %298
  %300 = select i1 %289, float %282, float %299
  %301 = fmul contract float %300, 4.000000e+00
  br i1 %13, label %302, label %483

302:                                              ; preds = %272
  %303 = fadd contract float %276, %301
  %304 = fsub contract float %276, %301
  %305 = and i32 %2, 7
  %306 = icmp ult i32 %2, 8
  br i1 %306, label %445, label %307

307:                                              ; preds = %302
  %308 = and i32 %2, -8
  br label %309

309:                                              ; preds = %309, %307
  %310 = phi i32 [ 0, %307 ], [ %441, %309 ]
  %311 = phi i32 [ 0, %307 ], [ %442, %309 ]
  %312 = phi float [ 0.000000e+00, %307 ], [ %439, %309 ]
  %313 = phi float [ 0.000000e+00, %307 ], [ %437, %309 ]
  %314 = phi i32 [ 0, %307 ], [ %443, %309 ]
  %315 = add nsw i32 %311, %14
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %316
  %318 = load i16, i16 addrspace(1)* %317, align 2, !tbaa !7, !amdgpu.noclobber !5
  %319 = uitofp i16 %318 to float
  %320 = fcmp contract ogt float %303, %319
  %321 = fcmp contract olt float %304, %319
  %322 = and i1 %320, %321
  %323 = fmul contract float %319, %319
  %324 = select i1 %322, float %319, float -0.000000e+00
  %325 = fadd contract float %313, %324
  %326 = select i1 %322, float %323, float -0.000000e+00
  %327 = fadd contract float %312, %326
  %328 = zext i1 %322 to i32
  %329 = add nuw nsw i32 %310, %328
  %330 = or i32 %311, 1
  %331 = add nsw i32 %330, %14
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %332
  %334 = load i16, i16 addrspace(1)* %333, align 2, !tbaa !7, !amdgpu.noclobber !5
  %335 = uitofp i16 %334 to float
  %336 = fcmp contract ogt float %303, %335
  %337 = fcmp contract olt float %304, %335
  %338 = and i1 %336, %337
  %339 = fmul contract float %335, %335
  %340 = select i1 %338, float %335, float -0.000000e+00
  %341 = fadd contract float %325, %340
  %342 = select i1 %338, float %339, float -0.000000e+00
  %343 = fadd contract float %327, %342
  %344 = zext i1 %338 to i32
  %345 = add nuw nsw i32 %329, %344
  %346 = or i32 %311, 2
  %347 = add nsw i32 %346, %14
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %348
  %350 = load i16, i16 addrspace(1)* %349, align 2, !tbaa !7, !amdgpu.noclobber !5
  %351 = uitofp i16 %350 to float
  %352 = fcmp contract ogt float %303, %351
  %353 = fcmp contract olt float %304, %351
  %354 = and i1 %352, %353
  %355 = fmul contract float %351, %351
  %356 = select i1 %354, float %351, float -0.000000e+00
  %357 = fadd contract float %341, %356
  %358 = select i1 %354, float %355, float -0.000000e+00
  %359 = fadd contract float %343, %358
  %360 = zext i1 %354 to i32
  %361 = add nuw nsw i32 %345, %360
  %362 = or i32 %311, 3
  %363 = add nsw i32 %362, %14
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %364
  %366 = load i16, i16 addrspace(1)* %365, align 2, !tbaa !7, !amdgpu.noclobber !5
  %367 = uitofp i16 %366 to float
  %368 = fcmp contract ogt float %303, %367
  %369 = fcmp contract olt float %304, %367
  %370 = and i1 %368, %369
  %371 = fmul contract float %367, %367
  %372 = select i1 %370, float %367, float -0.000000e+00
  %373 = fadd contract float %357, %372
  %374 = select i1 %370, float %371, float -0.000000e+00
  %375 = fadd contract float %359, %374
  %376 = zext i1 %370 to i32
  %377 = add nuw nsw i32 %361, %376
  %378 = or i32 %311, 4
  %379 = add nsw i32 %378, %14
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %380
  %382 = load i16, i16 addrspace(1)* %381, align 2, !tbaa !7, !amdgpu.noclobber !5
  %383 = uitofp i16 %382 to float
  %384 = fcmp contract ogt float %303, %383
  %385 = fcmp contract olt float %304, %383
  %386 = and i1 %384, %385
  %387 = fmul contract float %383, %383
  %388 = select i1 %386, float %383, float -0.000000e+00
  %389 = fadd contract float %373, %388
  %390 = select i1 %386, float %387, float -0.000000e+00
  %391 = fadd contract float %375, %390
  %392 = zext i1 %386 to i32
  %393 = add nuw nsw i32 %377, %392
  %394 = or i32 %311, 5
  %395 = add nsw i32 %394, %14
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %396
  %398 = load i16, i16 addrspace(1)* %397, align 2, !tbaa !7, !amdgpu.noclobber !5
  %399 = uitofp i16 %398 to float
  %400 = fcmp contract ogt float %303, %399
  %401 = fcmp contract olt float %304, %399
  %402 = and i1 %400, %401
  %403 = fmul contract float %399, %399
  %404 = select i1 %402, float %399, float -0.000000e+00
  %405 = fadd contract float %389, %404
  %406 = select i1 %402, float %403, float -0.000000e+00
  %407 = fadd contract float %391, %406
  %408 = zext i1 %402 to i32
  %409 = add nuw nsw i32 %393, %408
  %410 = or i32 %311, 6
  %411 = add nsw i32 %410, %14
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %412
  %414 = load i16, i16 addrspace(1)* %413, align 2, !tbaa !7, !amdgpu.noclobber !5
  %415 = uitofp i16 %414 to float
  %416 = fcmp contract ogt float %303, %415
  %417 = fcmp contract olt float %304, %415
  %418 = and i1 %416, %417
  %419 = fmul contract float %415, %415
  %420 = select i1 %418, float %415, float -0.000000e+00
  %421 = fadd contract float %405, %420
  %422 = select i1 %418, float %419, float -0.000000e+00
  %423 = fadd contract float %407, %422
  %424 = zext i1 %418 to i32
  %425 = add nuw nsw i32 %409, %424
  %426 = or i32 %311, 7
  %427 = add nsw i32 %426, %14
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %428
  %430 = load i16, i16 addrspace(1)* %429, align 2, !tbaa !7, !amdgpu.noclobber !5
  %431 = uitofp i16 %430 to float
  %432 = fcmp contract ogt float %303, %431
  %433 = fcmp contract olt float %304, %431
  %434 = and i1 %432, %433
  %435 = fmul contract float %431, %431
  %436 = select i1 %434, float %431, float -0.000000e+00
  %437 = fadd contract float %421, %436
  %438 = select i1 %434, float %435, float -0.000000e+00
  %439 = fadd contract float %423, %438
  %440 = zext i1 %434 to i32
  %441 = add nuw nsw i32 %425, %440
  %442 = add nuw nsw i32 %311, 8
  %443 = add i32 %314, 8
  %444 = icmp eq i32 %443, %308
  br i1 %444, label %445, label %309, !llvm.loop !13

445:                                              ; preds = %309, %302
  %446 = phi float [ undef, %302 ], [ %437, %309 ]
  %447 = phi float [ undef, %302 ], [ %439, %309 ]
  %448 = phi i32 [ undef, %302 ], [ %441, %309 ]
  %449 = phi i32 [ 0, %302 ], [ %441, %309 ]
  %450 = phi i32 [ 0, %302 ], [ %442, %309 ]
  %451 = phi float [ 0.000000e+00, %302 ], [ %439, %309 ]
  %452 = phi float [ 0.000000e+00, %302 ], [ %437, %309 ]
  %453 = icmp eq i32 %305, 0
  br i1 %453, label %478, label %454

454:                                              ; preds = %445, %454
  %455 = phi i32 [ %474, %454 ], [ %449, %445 ]
  %456 = phi i32 [ %475, %454 ], [ %450, %445 ]
  %457 = phi float [ %472, %454 ], [ %451, %445 ]
  %458 = phi float [ %470, %454 ], [ %452, %445 ]
  %459 = phi i32 [ %476, %454 ], [ 0, %445 ]
  %460 = add nsw i32 %456, %14
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %461
  %463 = load i16, i16 addrspace(1)* %462, align 2, !tbaa !7, !amdgpu.noclobber !5
  %464 = uitofp i16 %463 to float
  %465 = fcmp contract ogt float %303, %464
  %466 = fcmp contract olt float %304, %464
  %467 = and i1 %465, %466
  %468 = fmul contract float %464, %464
  %469 = select i1 %467, float %464, float -0.000000e+00
  %470 = fadd contract float %458, %469
  %471 = select i1 %467, float %468, float -0.000000e+00
  %472 = fadd contract float %457, %471
  %473 = zext i1 %467 to i32
  %474 = add nuw nsw i32 %455, %473
  %475 = add nuw nsw i32 %456, 1
  %476 = add i32 %459, 1
  %477 = icmp eq i32 %476, %305
  br i1 %477, label %478, label %454, !llvm.loop !16

478:                                              ; preds = %454, %445
  %479 = phi float [ %446, %445 ], [ %470, %454 ]
  %480 = phi float [ %447, %445 ], [ %472, %454 ]
  %481 = phi i32 [ %448, %445 ], [ %474, %454 ]
  %482 = sitofp i32 %481 to float
  br label %483

483:                                              ; preds = %478, %272
  %484 = phi float [ 0.000000e+00, %272 ], [ %479, %478 ]
  %485 = phi float [ 0.000000e+00, %272 ], [ %480, %478 ]
  %486 = phi float [ 0.000000e+00, %272 ], [ %482, %478 ]
  %487 = fdiv contract float %484, %486
  %488 = fdiv contract float %485, %486
  %489 = fmul contract float %487, %487
  %490 = fsub contract float %488, %489
  %491 = fcmp olt float %490, 0x39F0000000000000
  %492 = select i1 %491, float 0x41F0000000000000, float 1.000000e+00
  %493 = fmul float %490, %492
  %494 = tail call float @llvm.sqrt.f32(float %493)
  %495 = bitcast float %494 to i32
  %496 = add nsw i32 %495, -1
  %497 = bitcast i32 %496 to float
  %498 = add nsw i32 %495, 1
  %499 = bitcast i32 %498 to float
  %500 = tail call i1 @llvm.amdgcn.class.f32(float %493, i32 608)
  %501 = select i1 %491, float 0x3EF0000000000000, float 1.000000e+00
  %502 = fneg float %499
  %503 = tail call float @llvm.fma.f32(float %502, float %494, float %493)
  %504 = fcmp ogt float %503, 0.000000e+00
  %505 = fneg float %497
  %506 = tail call float @llvm.fma.f32(float %505, float %494, float %493)
  %507 = fcmp ole float %506, 0.000000e+00
  %508 = select i1 %507, float %497, float %494
  %509 = select i1 %504, float %499, float %508
  %510 = fmul float %501, %509
  %511 = select i1 %500, float %493, float %510
  %512 = fmul contract float %511, 4.000000e+00
  br i1 %13, label %513, label %694

513:                                              ; preds = %483
  %514 = fadd contract float %487, %512
  %515 = fsub contract float %487, %512
  %516 = and i32 %2, 7
  %517 = icmp ult i32 %2, 8
  br i1 %517, label %656, label %518

518:                                              ; preds = %513
  %519 = and i32 %2, -8
  br label %520

520:                                              ; preds = %520, %518
  %521 = phi i32 [ 0, %518 ], [ %652, %520 ]
  %522 = phi i32 [ 0, %518 ], [ %653, %520 ]
  %523 = phi float [ 0.000000e+00, %518 ], [ %650, %520 ]
  %524 = phi float [ 0.000000e+00, %518 ], [ %648, %520 ]
  %525 = phi i32 [ 0, %518 ], [ %654, %520 ]
  %526 = add nsw i32 %522, %14
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %527
  %529 = load i16, i16 addrspace(1)* %528, align 2, !tbaa !7, !amdgpu.noclobber !5
  %530 = uitofp i16 %529 to float
  %531 = fcmp contract ogt float %514, %530
  %532 = fcmp contract olt float %515, %530
  %533 = and i1 %531, %532
  %534 = fmul contract float %530, %530
  %535 = select i1 %533, float %530, float -0.000000e+00
  %536 = fadd contract float %524, %535
  %537 = select i1 %533, float %534, float -0.000000e+00
  %538 = fadd contract float %523, %537
  %539 = zext i1 %533 to i32
  %540 = add nuw nsw i32 %521, %539
  %541 = or i32 %522, 1
  %542 = add nsw i32 %541, %14
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %543
  %545 = load i16, i16 addrspace(1)* %544, align 2, !tbaa !7, !amdgpu.noclobber !5
  %546 = uitofp i16 %545 to float
  %547 = fcmp contract ogt float %514, %546
  %548 = fcmp contract olt float %515, %546
  %549 = and i1 %547, %548
  %550 = fmul contract float %546, %546
  %551 = select i1 %549, float %546, float -0.000000e+00
  %552 = fadd contract float %536, %551
  %553 = select i1 %549, float %550, float -0.000000e+00
  %554 = fadd contract float %538, %553
  %555 = zext i1 %549 to i32
  %556 = add nuw nsw i32 %540, %555
  %557 = or i32 %522, 2
  %558 = add nsw i32 %557, %14
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %559
  %561 = load i16, i16 addrspace(1)* %560, align 2, !tbaa !7, !amdgpu.noclobber !5
  %562 = uitofp i16 %561 to float
  %563 = fcmp contract ogt float %514, %562
  %564 = fcmp contract olt float %515, %562
  %565 = and i1 %563, %564
  %566 = fmul contract float %562, %562
  %567 = select i1 %565, float %562, float -0.000000e+00
  %568 = fadd contract float %552, %567
  %569 = select i1 %565, float %566, float -0.000000e+00
  %570 = fadd contract float %554, %569
  %571 = zext i1 %565 to i32
  %572 = add nuw nsw i32 %556, %571
  %573 = or i32 %522, 3
  %574 = add nsw i32 %573, %14
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %575
  %577 = load i16, i16 addrspace(1)* %576, align 2, !tbaa !7, !amdgpu.noclobber !5
  %578 = uitofp i16 %577 to float
  %579 = fcmp contract ogt float %514, %578
  %580 = fcmp contract olt float %515, %578
  %581 = and i1 %579, %580
  %582 = fmul contract float %578, %578
  %583 = select i1 %581, float %578, float -0.000000e+00
  %584 = fadd contract float %568, %583
  %585 = select i1 %581, float %582, float -0.000000e+00
  %586 = fadd contract float %570, %585
  %587 = zext i1 %581 to i32
  %588 = add nuw nsw i32 %572, %587
  %589 = or i32 %522, 4
  %590 = add nsw i32 %589, %14
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %591
  %593 = load i16, i16 addrspace(1)* %592, align 2, !tbaa !7, !amdgpu.noclobber !5
  %594 = uitofp i16 %593 to float
  %595 = fcmp contract ogt float %514, %594
  %596 = fcmp contract olt float %515, %594
  %597 = and i1 %595, %596
  %598 = fmul contract float %594, %594
  %599 = select i1 %597, float %594, float -0.000000e+00
  %600 = fadd contract float %584, %599
  %601 = select i1 %597, float %598, float -0.000000e+00
  %602 = fadd contract float %586, %601
  %603 = zext i1 %597 to i32
  %604 = add nuw nsw i32 %588, %603
  %605 = or i32 %522, 5
  %606 = add nsw i32 %605, %14
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %607
  %609 = load i16, i16 addrspace(1)* %608, align 2, !tbaa !7, !amdgpu.noclobber !5
  %610 = uitofp i16 %609 to float
  %611 = fcmp contract ogt float %514, %610
  %612 = fcmp contract olt float %515, %610
  %613 = and i1 %611, %612
  %614 = fmul contract float %610, %610
  %615 = select i1 %613, float %610, float -0.000000e+00
  %616 = fadd contract float %600, %615
  %617 = select i1 %613, float %614, float -0.000000e+00
  %618 = fadd contract float %602, %617
  %619 = zext i1 %613 to i32
  %620 = add nuw nsw i32 %604, %619
  %621 = or i32 %522, 6
  %622 = add nsw i32 %621, %14
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %623
  %625 = load i16, i16 addrspace(1)* %624, align 2, !tbaa !7, !amdgpu.noclobber !5
  %626 = uitofp i16 %625 to float
  %627 = fcmp contract ogt float %514, %626
  %628 = fcmp contract olt float %515, %626
  %629 = and i1 %627, %628
  %630 = fmul contract float %626, %626
  %631 = select i1 %629, float %626, float -0.000000e+00
  %632 = fadd contract float %616, %631
  %633 = select i1 %629, float %630, float -0.000000e+00
  %634 = fadd contract float %618, %633
  %635 = zext i1 %629 to i32
  %636 = add nuw nsw i32 %620, %635
  %637 = or i32 %522, 7
  %638 = add nsw i32 %637, %14
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %639
  %641 = load i16, i16 addrspace(1)* %640, align 2, !tbaa !7, !amdgpu.noclobber !5
  %642 = uitofp i16 %641 to float
  %643 = fcmp contract ogt float %514, %642
  %644 = fcmp contract olt float %515, %642
  %645 = and i1 %643, %644
  %646 = fmul contract float %642, %642
  %647 = select i1 %645, float %642, float -0.000000e+00
  %648 = fadd contract float %632, %647
  %649 = select i1 %645, float %646, float -0.000000e+00
  %650 = fadd contract float %634, %649
  %651 = zext i1 %645 to i32
  %652 = add nuw nsw i32 %636, %651
  %653 = add nuw nsw i32 %522, 8
  %654 = add i32 %525, 8
  %655 = icmp eq i32 %654, %519
  br i1 %655, label %656, label %520, !llvm.loop !13

656:                                              ; preds = %520, %513
  %657 = phi float [ undef, %513 ], [ %648, %520 ]
  %658 = phi float [ undef, %513 ], [ %650, %520 ]
  %659 = phi i32 [ undef, %513 ], [ %652, %520 ]
  %660 = phi i32 [ 0, %513 ], [ %652, %520 ]
  %661 = phi i32 [ 0, %513 ], [ %653, %520 ]
  %662 = phi float [ 0.000000e+00, %513 ], [ %650, %520 ]
  %663 = phi float [ 0.000000e+00, %513 ], [ %648, %520 ]
  %664 = icmp eq i32 %516, 0
  br i1 %664, label %689, label %665

665:                                              ; preds = %656, %665
  %666 = phi i32 [ %685, %665 ], [ %660, %656 ]
  %667 = phi i32 [ %686, %665 ], [ %661, %656 ]
  %668 = phi float [ %683, %665 ], [ %662, %656 ]
  %669 = phi float [ %681, %665 ], [ %663, %656 ]
  %670 = phi i32 [ %687, %665 ], [ 0, %656 ]
  %671 = add nsw i32 %667, %14
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %672
  %674 = load i16, i16 addrspace(1)* %673, align 2, !tbaa !7, !amdgpu.noclobber !5
  %675 = uitofp i16 %674 to float
  %676 = fcmp contract ogt float %514, %675
  %677 = fcmp contract olt float %515, %675
  %678 = and i1 %676, %677
  %679 = fmul contract float %675, %675
  %680 = select i1 %678, float %675, float -0.000000e+00
  %681 = fadd contract float %669, %680
  %682 = select i1 %678, float %679, float -0.000000e+00
  %683 = fadd contract float %668, %682
  %684 = zext i1 %678 to i32
  %685 = add nuw nsw i32 %666, %684
  %686 = add nuw nsw i32 %667, 1
  %687 = add i32 %670, 1
  %688 = icmp eq i32 %687, %516
  br i1 %688, label %689, label %665, !llvm.loop !17

689:                                              ; preds = %665, %656
  %690 = phi float [ %657, %656 ], [ %681, %665 ]
  %691 = phi float [ %658, %656 ], [ %683, %665 ]
  %692 = phi i32 [ %659, %656 ], [ %685, %665 ]
  %693 = sitofp i32 %692 to float
  br label %694

694:                                              ; preds = %689, %483
  %695 = phi float [ 0.000000e+00, %483 ], [ %690, %689 ]
  %696 = phi float [ 0.000000e+00, %483 ], [ %691, %689 ]
  %697 = phi float [ 0.000000e+00, %483 ], [ %693, %689 ]
  %698 = fdiv contract float %695, %697
  %699 = fdiv contract float %696, %697
  %700 = fmul contract float %698, %698
  %701 = fsub contract float %699, %700
  %702 = fcmp olt float %701, 0x39F0000000000000
  %703 = select i1 %702, float 0x41F0000000000000, float 1.000000e+00
  %704 = fmul float %701, %703
  %705 = tail call float @llvm.sqrt.f32(float %704)
  %706 = bitcast float %705 to i32
  %707 = add nsw i32 %706, -1
  %708 = bitcast i32 %707 to float
  %709 = add nsw i32 %706, 1
  %710 = bitcast i32 %709 to float
  %711 = tail call i1 @llvm.amdgcn.class.f32(float %704, i32 608)
  %712 = select i1 %702, float 0x3EF0000000000000, float 1.000000e+00
  %713 = fneg float %710
  %714 = tail call float @llvm.fma.f32(float %713, float %705, float %704)
  %715 = fcmp ogt float %714, 0.000000e+00
  %716 = fneg float %708
  %717 = tail call float @llvm.fma.f32(float %716, float %705, float %704)
  %718 = fcmp ole float %717, 0.000000e+00
  %719 = select i1 %718, float %708, float %705
  %720 = select i1 %715, float %710, float %719
  %721 = fmul float %712, %720
  %722 = select i1 %711, float %704, float %721
  %723 = fmul contract float %722, 4.000000e+00
  %724 = icmp sgt i32 %2, 4
  br i1 %724, label %20, label %868

725:                                              ; preds = %725, %18
  %726 = phi i32 [ 0, %18 ], [ %802, %725 ]
  %727 = phi i32 [ 0, %18 ], [ %803, %725 ]
  %728 = phi float [ 0.000000e+00, %18 ], [ %801, %725 ]
  %729 = phi float [ 0.000000e+00, %18 ], [ %800, %725 ]
  %730 = phi i32 [ 0, %18 ], [ %804, %725 ]
  %731 = add nsw i32 %727, %14
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %732
  %734 = load i16, i16 addrspace(1)* %733, align 2, !tbaa !7, !amdgpu.noclobber !5
  %735 = uitofp i16 %734 to float
  %736 = fmul contract float %735, %735
  %737 = fadd contract float %729, %735
  %738 = fadd contract float %728, %736
  %739 = or i32 %727, 1
  %740 = add nsw i32 %739, %14
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %741
  %743 = load i16, i16 addrspace(1)* %742, align 2, !tbaa !7, !amdgpu.noclobber !5
  %744 = uitofp i16 %743 to float
  %745 = fmul contract float %744, %744
  %746 = fadd contract float %737, %744
  %747 = fadd contract float %738, %745
  %748 = or i32 %727, 2
  %749 = add nsw i32 %748, %14
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %750
  %752 = load i16, i16 addrspace(1)* %751, align 2, !tbaa !7, !amdgpu.noclobber !5
  %753 = uitofp i16 %752 to float
  %754 = fmul contract float %753, %753
  %755 = fadd contract float %746, %753
  %756 = fadd contract float %747, %754
  %757 = or i32 %727, 3
  %758 = add nsw i32 %757, %14
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %759
  %761 = load i16, i16 addrspace(1)* %760, align 2, !tbaa !7, !amdgpu.noclobber !5
  %762 = uitofp i16 %761 to float
  %763 = fmul contract float %762, %762
  %764 = fadd contract float %755, %762
  %765 = fadd contract float %756, %763
  %766 = or i32 %727, 4
  %767 = add nsw i32 %766, %14
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %768
  %770 = load i16, i16 addrspace(1)* %769, align 2, !tbaa !7, !amdgpu.noclobber !5
  %771 = uitofp i16 %770 to float
  %772 = fmul contract float %771, %771
  %773 = fadd contract float %764, %771
  %774 = fadd contract float %765, %772
  %775 = or i32 %727, 5
  %776 = add nsw i32 %775, %14
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %777
  %779 = load i16, i16 addrspace(1)* %778, align 2, !tbaa !7, !amdgpu.noclobber !5
  %780 = uitofp i16 %779 to float
  %781 = fmul contract float %780, %780
  %782 = fadd contract float %773, %780
  %783 = fadd contract float %774, %781
  %784 = or i32 %727, 6
  %785 = add nsw i32 %784, %14
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %786
  %788 = load i16, i16 addrspace(1)* %787, align 2, !tbaa !7, !amdgpu.noclobber !5
  %789 = uitofp i16 %788 to float
  %790 = fmul contract float %789, %789
  %791 = fadd contract float %782, %789
  %792 = fadd contract float %783, %790
  %793 = or i32 %727, 7
  %794 = add nsw i32 %793, %14
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %795
  %797 = load i16, i16 addrspace(1)* %796, align 2, !tbaa !7, !amdgpu.noclobber !5
  %798 = uitofp i16 %797 to float
  %799 = fmul contract float %798, %798
  %800 = fadd contract float %791, %798
  %801 = fadd contract float %792, %799
  %802 = add nuw nsw i32 %726, 8
  %803 = add nuw nsw i32 %727, 8
  %804 = add i32 %730, 8
  %805 = icmp eq i32 %804, %19
  br i1 %805, label %29, label %725, !llvm.loop !13

806:                                              ; preds = %900, %26
  %807 = phi i32 [ 0, %26 ], [ %901, %900 ]
  %808 = phi i32 [ 0, %26 ], [ %902, %900 ]
  %809 = add nsw i32 %807, %14
  %810 = sext i32 %809 to i64
  %811 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %810
  %812 = load i16, i16 addrspace(1)* %811, align 2, !tbaa !7
  %813 = uitofp i16 %812 to float
  %814 = add nsw i32 %809, 1
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %815
  %817 = load i16, i16 addrspace(1)* %816, align 2, !tbaa !7
  %818 = uitofp i16 %817 to float
  %819 = fadd contract float %813, %818
  %820 = add nsw i32 %809, 2
  %821 = sext i32 %820 to i64
  %822 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %821
  %823 = load i16, i16 addrspace(1)* %822, align 2, !tbaa !7
  %824 = uitofp i16 %823 to float
  %825 = fadd contract float %819, %824
  %826 = add nsw i32 %809, 3
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %827
  %829 = load i16, i16 addrspace(1)* %828, align 2, !tbaa !7
  %830 = uitofp i16 %829 to float
  %831 = fadd contract float %825, %830
  %832 = fmul contract float %831, 2.500000e-01
  %833 = fcmp contract ogt float %832, %21
  %834 = fcmp contract olt float %832, %22
  %835 = or i1 %833, %834
  br i1 %835, label %869, label %870

836:                                              ; preds = %900, %20
  %837 = phi i32 [ 0, %20 ], [ %901, %900 ]
  %838 = icmp eq i32 %24, 0
  br i1 %838, label %868, label %839

839:                                              ; preds = %836
  %840 = add nsw i32 %837, %14
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %841
  %843 = load i16, i16 addrspace(1)* %842, align 2, !tbaa !7
  %844 = uitofp i16 %843 to float
  %845 = add nsw i32 %840, 1
  %846 = sext i32 %845 to i64
  %847 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %846
  %848 = load i16, i16 addrspace(1)* %847, align 2, !tbaa !7
  %849 = uitofp i16 %848 to float
  %850 = fadd contract float %844, %849
  %851 = add nsw i32 %840, 2
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %852
  %854 = load i16, i16 addrspace(1)* %853, align 2, !tbaa !7
  %855 = uitofp i16 %854 to float
  %856 = fadd contract float %850, %855
  %857 = add nsw i32 %840, 3
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %858
  %860 = load i16, i16 addrspace(1)* %859, align 2, !tbaa !7
  %861 = uitofp i16 %860 to float
  %862 = fadd contract float %856, %861
  %863 = fmul contract float %862, 2.500000e-01
  %864 = fcmp contract ogt float %863, %21
  %865 = fcmp contract olt float %863, %22
  %866 = or i1 %864, %865
  br i1 %866, label %867, label %868

867:                                              ; preds = %839
  store i16 %23, i16 addrspace(1)* %842, align 2, !tbaa !7
  br label %868

868:                                              ; preds = %836, %867, %839, %694
  ret void

869:                                              ; preds = %806
  store i16 %23, i16 addrspace(1)* %811, align 2, !tbaa !7
  br label %870

870:                                              ; preds = %806, %869
  %871 = or i32 %807, 1
  %872 = add nsw i32 %871, %14
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %873
  %875 = load i16, i16 addrspace(1)* %874, align 2, !tbaa !7
  %876 = uitofp i16 %875 to float
  %877 = add nsw i32 %872, 1
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %878
  %880 = load i16, i16 addrspace(1)* %879, align 2, !tbaa !7
  %881 = uitofp i16 %880 to float
  %882 = fadd contract float %876, %881
  %883 = add nsw i32 %872, 2
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %884
  %886 = load i16, i16 addrspace(1)* %885, align 2, !tbaa !7
  %887 = uitofp i16 %886 to float
  %888 = fadd contract float %882, %887
  %889 = add nsw i32 %872, 3
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %890
  %892 = load i16, i16 addrspace(1)* %891, align 2, !tbaa !7
  %893 = uitofp i16 %892 to float
  %894 = fadd contract float %888, %893
  %895 = fmul contract float %894, 2.500000e-01
  %896 = fcmp contract ogt float %895, %21
  %897 = fcmp contract olt float %895, %22
  %898 = or i1 %896, %897
  br i1 %898, label %899, label %900

899:                                              ; preds = %870
  store i16 %23, i16 addrspace(1)* %874, align 2, !tbaa !7
  br label %900

900:                                              ; preds = %899, %870
  %901 = add nuw nsw i32 %807, 2
  %902 = add i32 %808, 2
  %903 = icmp eq i32 %808, %28
  br i1 %903, label %836, label %806, !llvm.loop !18
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
