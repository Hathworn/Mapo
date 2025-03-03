; ModuleID = '../data/hip_kernels/199/20/main.cu'
source_filename = "../data/hip_kernels/199/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27zero_dm_outliers_kernel_twoPtii(i16 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %2, 1
  br i1 %13, label %3104, label %14

14:                                               ; preds = %3
  %15 = add i32 %2, -1
  %16 = and i32 %2, 7
  %17 = icmp ult i32 %15, 7
  br i1 %17, label %3076, label %18

18:                                               ; preds = %14
  %19 = and i32 %2, -8
  br label %3138

20:                                               ; preds = %3104
  br i1 %13, label %139, label %21

21:                                               ; preds = %20
  %22 = fadd contract float %3109, %3134
  %23 = fsub contract float %3109, %3134
  %24 = add i32 %2, -1
  %25 = and i32 %2, 3
  %26 = icmp ult i32 %24, 3
  br i1 %26, label %105, label %27

27:                                               ; preds = %21
  %28 = and i32 %2, -4
  br label %29

29:                                               ; preds = %29, %27
  %30 = phi i32 [ 0, %27 ], [ %101, %29 ]
  %31 = phi i32 [ 0, %27 ], [ %102, %29 ]
  %32 = phi float [ 0.000000e+00, %27 ], [ %99, %29 ]
  %33 = phi float [ 0.000000e+00, %27 ], [ %97, %29 ]
  %34 = phi i32 [ 0, %27 ], [ %103, %29 ]
  %35 = mul nsw i32 %31, %1
  %36 = add nsw i32 %35, %12
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %37
  %39 = load i16, i16 addrspace(1)* %38, align 2, !tbaa !7, !amdgpu.noclobber !5
  %40 = uitofp i16 %39 to float
  %41 = fcmp contract ogt float %22, %40
  %42 = fcmp contract olt float %23, %40
  %43 = and i1 %41, %42
  %44 = fmul contract float %40, %40
  %45 = select i1 %43, float %40, float -0.000000e+00
  %46 = fadd contract float %33, %45
  %47 = select i1 %43, float %44, float -0.000000e+00
  %48 = fadd contract float %32, %47
  %49 = zext i1 %43 to i32
  %50 = add nuw nsw i32 %30, %49
  %51 = or i32 %31, 1
  %52 = mul nsw i32 %51, %1
  %53 = add nsw i32 %52, %12
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %54
  %56 = load i16, i16 addrspace(1)* %55, align 2, !tbaa !7, !amdgpu.noclobber !5
  %57 = uitofp i16 %56 to float
  %58 = fcmp contract ogt float %22, %57
  %59 = fcmp contract olt float %23, %57
  %60 = and i1 %58, %59
  %61 = fmul contract float %57, %57
  %62 = select i1 %60, float %57, float -0.000000e+00
  %63 = fadd contract float %46, %62
  %64 = select i1 %60, float %61, float -0.000000e+00
  %65 = fadd contract float %48, %64
  %66 = zext i1 %60 to i32
  %67 = add nuw nsw i32 %50, %66
  %68 = or i32 %31, 2
  %69 = mul nsw i32 %68, %1
  %70 = add nsw i32 %69, %12
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %71
  %73 = load i16, i16 addrspace(1)* %72, align 2, !tbaa !7, !amdgpu.noclobber !5
  %74 = uitofp i16 %73 to float
  %75 = fcmp contract ogt float %22, %74
  %76 = fcmp contract olt float %23, %74
  %77 = and i1 %75, %76
  %78 = fmul contract float %74, %74
  %79 = select i1 %77, float %74, float -0.000000e+00
  %80 = fadd contract float %63, %79
  %81 = select i1 %77, float %78, float -0.000000e+00
  %82 = fadd contract float %65, %81
  %83 = zext i1 %77 to i32
  %84 = add nuw nsw i32 %67, %83
  %85 = or i32 %31, 3
  %86 = mul nsw i32 %85, %1
  %87 = add nsw i32 %86, %12
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %88
  %90 = load i16, i16 addrspace(1)* %89, align 2, !tbaa !7, !amdgpu.noclobber !5
  %91 = uitofp i16 %90 to float
  %92 = fcmp contract ogt float %22, %91
  %93 = fcmp contract olt float %23, %91
  %94 = and i1 %92, %93
  %95 = fmul contract float %91, %91
  %96 = select i1 %94, float %91, float -0.000000e+00
  %97 = fadd contract float %80, %96
  %98 = select i1 %94, float %95, float -0.000000e+00
  %99 = fadd contract float %82, %98
  %100 = zext i1 %94 to i32
  %101 = add nuw nsw i32 %84, %100
  %102 = add nuw nsw i32 %31, 4
  %103 = add i32 %34, 4
  %104 = icmp eq i32 %103, %28
  br i1 %104, label %105, label %29, !llvm.loop !11

105:                                              ; preds = %29, %21
  %106 = phi float [ undef, %21 ], [ %97, %29 ]
  %107 = phi float [ undef, %21 ], [ %99, %29 ]
  %108 = phi i32 [ undef, %21 ], [ %101, %29 ]
  %109 = phi i32 [ 0, %21 ], [ %101, %29 ]
  %110 = phi i32 [ 0, %21 ], [ %102, %29 ]
  %111 = phi float [ 0.000000e+00, %21 ], [ %99, %29 ]
  %112 = phi float [ 0.000000e+00, %21 ], [ %97, %29 ]
  %113 = icmp eq i32 %25, 0
  br i1 %113, label %139, label %114

114:                                              ; preds = %105, %114
  %115 = phi i32 [ %135, %114 ], [ %109, %105 ]
  %116 = phi i32 [ %136, %114 ], [ %110, %105 ]
  %117 = phi float [ %133, %114 ], [ %111, %105 ]
  %118 = phi float [ %131, %114 ], [ %112, %105 ]
  %119 = phi i32 [ %137, %114 ], [ 0, %105 ]
  %120 = mul nsw i32 %116, %1
  %121 = add nsw i32 %120, %12
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %122
  %124 = load i16, i16 addrspace(1)* %123, align 2, !tbaa !7, !amdgpu.noclobber !5
  %125 = uitofp i16 %124 to float
  %126 = fcmp contract ogt float %22, %125
  %127 = fcmp contract olt float %23, %125
  %128 = and i1 %126, %127
  %129 = fmul contract float %125, %125
  %130 = select i1 %128, float %125, float -0.000000e+00
  %131 = fadd contract float %118, %130
  %132 = select i1 %128, float %129, float -0.000000e+00
  %133 = fadd contract float %117, %132
  %134 = zext i1 %128 to i32
  %135 = add nuw nsw i32 %115, %134
  %136 = add nuw nsw i32 %116, 1
  %137 = add i32 %119, 1
  %138 = icmp eq i32 %137, %25
  br i1 %138, label %139, label %114, !llvm.loop !13

139:                                              ; preds = %105, %114, %20
  %140 = phi float [ 0.000000e+00, %20 ], [ %106, %105 ], [ %131, %114 ]
  %141 = phi float [ 0.000000e+00, %20 ], [ %107, %105 ], [ %133, %114 ]
  %142 = phi i32 [ 0, %20 ], [ %108, %105 ], [ %135, %114 ]
  %143 = sitofp i32 %142 to float
  %144 = fdiv contract float %140, %143
  %145 = fdiv contract float %141, %143
  %146 = fmul contract float %144, %144
  %147 = fsub contract float %145, %146
  %148 = fcmp olt float %147, 0x39F0000000000000
  %149 = select i1 %148, float 0x41F0000000000000, float 1.000000e+00
  %150 = fmul float %147, %149
  %151 = tail call float @llvm.sqrt.f32(float %150)
  %152 = bitcast float %151 to i32
  %153 = add nsw i32 %152, -1
  %154 = bitcast i32 %153 to float
  %155 = add nsw i32 %152, 1
  %156 = bitcast i32 %155 to float
  %157 = tail call i1 @llvm.amdgcn.class.f32(float %150, i32 608)
  %158 = select i1 %148, float 0x3EF0000000000000, float 1.000000e+00
  %159 = fneg float %156
  %160 = tail call float @llvm.fma.f32(float %159, float %151, float %150)
  %161 = fcmp ogt float %160, 0.000000e+00
  %162 = fneg float %154
  %163 = tail call float @llvm.fma.f32(float %162, float %151, float %150)
  %164 = fcmp ole float %163, 0.000000e+00
  %165 = select i1 %164, float %154, float %151
  %166 = select i1 %161, float %156, float %165
  %167 = fmul float %158, %166
  %168 = select i1 %157, float %150, float %167
  %169 = fmul contract float %168, 2.000000e+00
  %170 = fsub contract float %144, %3109
  %171 = tail call float @llvm.fabs.f32(float %170)
  %172 = fcmp contract ogt float %171, 0x3EB0C6F7A0000000
  br i1 %172, label %173, label %3227, !llvm.loop !15

173:                                              ; preds = %139
  br i1 %13, label %292, label %174

174:                                              ; preds = %173
  %175 = fadd contract float %144, %169
  %176 = fsub contract float %144, %169
  %177 = add i32 %2, -1
  %178 = and i32 %2, 3
  %179 = icmp ult i32 %177, 3
  br i1 %179, label %258, label %180

180:                                              ; preds = %174
  %181 = and i32 %2, -4
  br label %182

182:                                              ; preds = %182, %180
  %183 = phi i32 [ 0, %180 ], [ %254, %182 ]
  %184 = phi i32 [ 0, %180 ], [ %255, %182 ]
  %185 = phi float [ 0.000000e+00, %180 ], [ %252, %182 ]
  %186 = phi float [ 0.000000e+00, %180 ], [ %250, %182 ]
  %187 = phi i32 [ 0, %180 ], [ %256, %182 ]
  %188 = mul nsw i32 %184, %1
  %189 = add nsw i32 %188, %12
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %190
  %192 = load i16, i16 addrspace(1)* %191, align 2, !tbaa !7, !amdgpu.noclobber !5
  %193 = uitofp i16 %192 to float
  %194 = fcmp contract ogt float %175, %193
  %195 = fcmp contract olt float %176, %193
  %196 = and i1 %194, %195
  %197 = fmul contract float %193, %193
  %198 = select i1 %196, float %193, float -0.000000e+00
  %199 = fadd contract float %186, %198
  %200 = select i1 %196, float %197, float -0.000000e+00
  %201 = fadd contract float %185, %200
  %202 = zext i1 %196 to i32
  %203 = add nuw nsw i32 %183, %202
  %204 = or i32 %184, 1
  %205 = mul nsw i32 %204, %1
  %206 = add nsw i32 %205, %12
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %207
  %209 = load i16, i16 addrspace(1)* %208, align 2, !tbaa !7, !amdgpu.noclobber !5
  %210 = uitofp i16 %209 to float
  %211 = fcmp contract ogt float %175, %210
  %212 = fcmp contract olt float %176, %210
  %213 = and i1 %211, %212
  %214 = fmul contract float %210, %210
  %215 = select i1 %213, float %210, float -0.000000e+00
  %216 = fadd contract float %199, %215
  %217 = select i1 %213, float %214, float -0.000000e+00
  %218 = fadd contract float %201, %217
  %219 = zext i1 %213 to i32
  %220 = add nuw nsw i32 %203, %219
  %221 = or i32 %184, 2
  %222 = mul nsw i32 %221, %1
  %223 = add nsw i32 %222, %12
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %224
  %226 = load i16, i16 addrspace(1)* %225, align 2, !tbaa !7, !amdgpu.noclobber !5
  %227 = uitofp i16 %226 to float
  %228 = fcmp contract ogt float %175, %227
  %229 = fcmp contract olt float %176, %227
  %230 = and i1 %228, %229
  %231 = fmul contract float %227, %227
  %232 = select i1 %230, float %227, float -0.000000e+00
  %233 = fadd contract float %216, %232
  %234 = select i1 %230, float %231, float -0.000000e+00
  %235 = fadd contract float %218, %234
  %236 = zext i1 %230 to i32
  %237 = add nuw nsw i32 %220, %236
  %238 = or i32 %184, 3
  %239 = mul nsw i32 %238, %1
  %240 = add nsw i32 %239, %12
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %241
  %243 = load i16, i16 addrspace(1)* %242, align 2, !tbaa !7, !amdgpu.noclobber !5
  %244 = uitofp i16 %243 to float
  %245 = fcmp contract ogt float %175, %244
  %246 = fcmp contract olt float %176, %244
  %247 = and i1 %245, %246
  %248 = fmul contract float %244, %244
  %249 = select i1 %247, float %244, float -0.000000e+00
  %250 = fadd contract float %233, %249
  %251 = select i1 %247, float %248, float -0.000000e+00
  %252 = fadd contract float %235, %251
  %253 = zext i1 %247 to i32
  %254 = add nuw nsw i32 %237, %253
  %255 = add nuw nsw i32 %184, 4
  %256 = add i32 %187, 4
  %257 = icmp eq i32 %256, %181
  br i1 %257, label %258, label %182, !llvm.loop !11

258:                                              ; preds = %182, %174
  %259 = phi float [ undef, %174 ], [ %250, %182 ]
  %260 = phi float [ undef, %174 ], [ %252, %182 ]
  %261 = phi i32 [ undef, %174 ], [ %254, %182 ]
  %262 = phi i32 [ 0, %174 ], [ %254, %182 ]
  %263 = phi i32 [ 0, %174 ], [ %255, %182 ]
  %264 = phi float [ 0.000000e+00, %174 ], [ %252, %182 ]
  %265 = phi float [ 0.000000e+00, %174 ], [ %250, %182 ]
  %266 = icmp eq i32 %178, 0
  br i1 %266, label %292, label %267

267:                                              ; preds = %258, %267
  %268 = phi i32 [ %288, %267 ], [ %262, %258 ]
  %269 = phi i32 [ %289, %267 ], [ %263, %258 ]
  %270 = phi float [ %286, %267 ], [ %264, %258 ]
  %271 = phi float [ %284, %267 ], [ %265, %258 ]
  %272 = phi i32 [ %290, %267 ], [ 0, %258 ]
  %273 = mul nsw i32 %269, %1
  %274 = add nsw i32 %273, %12
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %275
  %277 = load i16, i16 addrspace(1)* %276, align 2, !tbaa !7, !amdgpu.noclobber !5
  %278 = uitofp i16 %277 to float
  %279 = fcmp contract ogt float %175, %278
  %280 = fcmp contract olt float %176, %278
  %281 = and i1 %279, %280
  %282 = fmul contract float %278, %278
  %283 = select i1 %281, float %278, float -0.000000e+00
  %284 = fadd contract float %271, %283
  %285 = select i1 %281, float %282, float -0.000000e+00
  %286 = fadd contract float %270, %285
  %287 = zext i1 %281 to i32
  %288 = add nuw nsw i32 %268, %287
  %289 = add nuw nsw i32 %269, 1
  %290 = add i32 %272, 1
  %291 = icmp eq i32 %290, %178
  br i1 %291, label %292, label %267, !llvm.loop !16

292:                                              ; preds = %258, %267, %173
  %293 = phi float [ 0.000000e+00, %173 ], [ %259, %258 ], [ %284, %267 ]
  %294 = phi float [ 0.000000e+00, %173 ], [ %260, %258 ], [ %286, %267 ]
  %295 = phi i32 [ 0, %173 ], [ %261, %258 ], [ %288, %267 ]
  %296 = sitofp i32 %295 to float
  %297 = fdiv contract float %293, %296
  %298 = fdiv contract float %294, %296
  %299 = fmul contract float %297, %297
  %300 = fsub contract float %298, %299
  %301 = fcmp olt float %300, 0x39F0000000000000
  %302 = select i1 %301, float 0x41F0000000000000, float 1.000000e+00
  %303 = fmul float %300, %302
  %304 = tail call float @llvm.sqrt.f32(float %303)
  %305 = bitcast float %304 to i32
  %306 = add nsw i32 %305, -1
  %307 = bitcast i32 %306 to float
  %308 = add nsw i32 %305, 1
  %309 = bitcast i32 %308 to float
  %310 = tail call i1 @llvm.amdgcn.class.f32(float %303, i32 608)
  %311 = select i1 %301, float 0x3EF0000000000000, float 1.000000e+00
  %312 = fneg float %309
  %313 = tail call float @llvm.fma.f32(float %312, float %304, float %303)
  %314 = fcmp ogt float %313, 0.000000e+00
  %315 = fneg float %307
  %316 = tail call float @llvm.fma.f32(float %315, float %304, float %303)
  %317 = fcmp ole float %316, 0.000000e+00
  %318 = select i1 %317, float %307, float %304
  %319 = select i1 %314, float %309, float %318
  %320 = fmul float %311, %319
  %321 = select i1 %310, float %303, float %320
  %322 = fmul contract float %321, 2.000000e+00
  %323 = fsub contract float %297, %144
  %324 = tail call float @llvm.fabs.f32(float %323)
  %325 = fcmp contract ogt float %324, 0x3EB0C6F7A0000000
  br i1 %325, label %326, label %3227, !llvm.loop !15

326:                                              ; preds = %292
  br i1 %13, label %445, label %327

327:                                              ; preds = %326
  %328 = fadd contract float %297, %322
  %329 = fsub contract float %297, %322
  %330 = add i32 %2, -1
  %331 = and i32 %2, 3
  %332 = icmp ult i32 %330, 3
  br i1 %332, label %411, label %333

333:                                              ; preds = %327
  %334 = and i32 %2, -4
  br label %335

335:                                              ; preds = %335, %333
  %336 = phi i32 [ 0, %333 ], [ %407, %335 ]
  %337 = phi i32 [ 0, %333 ], [ %408, %335 ]
  %338 = phi float [ 0.000000e+00, %333 ], [ %405, %335 ]
  %339 = phi float [ 0.000000e+00, %333 ], [ %403, %335 ]
  %340 = phi i32 [ 0, %333 ], [ %409, %335 ]
  %341 = mul nsw i32 %337, %1
  %342 = add nsw i32 %341, %12
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %343
  %345 = load i16, i16 addrspace(1)* %344, align 2, !tbaa !7, !amdgpu.noclobber !5
  %346 = uitofp i16 %345 to float
  %347 = fcmp contract ogt float %328, %346
  %348 = fcmp contract olt float %329, %346
  %349 = and i1 %347, %348
  %350 = fmul contract float %346, %346
  %351 = select i1 %349, float %346, float -0.000000e+00
  %352 = fadd contract float %339, %351
  %353 = select i1 %349, float %350, float -0.000000e+00
  %354 = fadd contract float %338, %353
  %355 = zext i1 %349 to i32
  %356 = add nuw nsw i32 %336, %355
  %357 = or i32 %337, 1
  %358 = mul nsw i32 %357, %1
  %359 = add nsw i32 %358, %12
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %360
  %362 = load i16, i16 addrspace(1)* %361, align 2, !tbaa !7, !amdgpu.noclobber !5
  %363 = uitofp i16 %362 to float
  %364 = fcmp contract ogt float %328, %363
  %365 = fcmp contract olt float %329, %363
  %366 = and i1 %364, %365
  %367 = fmul contract float %363, %363
  %368 = select i1 %366, float %363, float -0.000000e+00
  %369 = fadd contract float %352, %368
  %370 = select i1 %366, float %367, float -0.000000e+00
  %371 = fadd contract float %354, %370
  %372 = zext i1 %366 to i32
  %373 = add nuw nsw i32 %356, %372
  %374 = or i32 %337, 2
  %375 = mul nsw i32 %374, %1
  %376 = add nsw i32 %375, %12
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %377
  %379 = load i16, i16 addrspace(1)* %378, align 2, !tbaa !7, !amdgpu.noclobber !5
  %380 = uitofp i16 %379 to float
  %381 = fcmp contract ogt float %328, %380
  %382 = fcmp contract olt float %329, %380
  %383 = and i1 %381, %382
  %384 = fmul contract float %380, %380
  %385 = select i1 %383, float %380, float -0.000000e+00
  %386 = fadd contract float %369, %385
  %387 = select i1 %383, float %384, float -0.000000e+00
  %388 = fadd contract float %371, %387
  %389 = zext i1 %383 to i32
  %390 = add nuw nsw i32 %373, %389
  %391 = or i32 %337, 3
  %392 = mul nsw i32 %391, %1
  %393 = add nsw i32 %392, %12
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %394
  %396 = load i16, i16 addrspace(1)* %395, align 2, !tbaa !7, !amdgpu.noclobber !5
  %397 = uitofp i16 %396 to float
  %398 = fcmp contract ogt float %328, %397
  %399 = fcmp contract olt float %329, %397
  %400 = and i1 %398, %399
  %401 = fmul contract float %397, %397
  %402 = select i1 %400, float %397, float -0.000000e+00
  %403 = fadd contract float %386, %402
  %404 = select i1 %400, float %401, float -0.000000e+00
  %405 = fadd contract float %388, %404
  %406 = zext i1 %400 to i32
  %407 = add nuw nsw i32 %390, %406
  %408 = add nuw nsw i32 %337, 4
  %409 = add i32 %340, 4
  %410 = icmp eq i32 %409, %334
  br i1 %410, label %411, label %335, !llvm.loop !11

411:                                              ; preds = %335, %327
  %412 = phi float [ undef, %327 ], [ %403, %335 ]
  %413 = phi float [ undef, %327 ], [ %405, %335 ]
  %414 = phi i32 [ undef, %327 ], [ %407, %335 ]
  %415 = phi i32 [ 0, %327 ], [ %407, %335 ]
  %416 = phi i32 [ 0, %327 ], [ %408, %335 ]
  %417 = phi float [ 0.000000e+00, %327 ], [ %405, %335 ]
  %418 = phi float [ 0.000000e+00, %327 ], [ %403, %335 ]
  %419 = icmp eq i32 %331, 0
  br i1 %419, label %445, label %420

420:                                              ; preds = %411, %420
  %421 = phi i32 [ %441, %420 ], [ %415, %411 ]
  %422 = phi i32 [ %442, %420 ], [ %416, %411 ]
  %423 = phi float [ %439, %420 ], [ %417, %411 ]
  %424 = phi float [ %437, %420 ], [ %418, %411 ]
  %425 = phi i32 [ %443, %420 ], [ 0, %411 ]
  %426 = mul nsw i32 %422, %1
  %427 = add nsw i32 %426, %12
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %428
  %430 = load i16, i16 addrspace(1)* %429, align 2, !tbaa !7, !amdgpu.noclobber !5
  %431 = uitofp i16 %430 to float
  %432 = fcmp contract ogt float %328, %431
  %433 = fcmp contract olt float %329, %431
  %434 = and i1 %432, %433
  %435 = fmul contract float %431, %431
  %436 = select i1 %434, float %431, float -0.000000e+00
  %437 = fadd contract float %424, %436
  %438 = select i1 %434, float %435, float -0.000000e+00
  %439 = fadd contract float %423, %438
  %440 = zext i1 %434 to i32
  %441 = add nuw nsw i32 %421, %440
  %442 = add nuw nsw i32 %422, 1
  %443 = add i32 %425, 1
  %444 = icmp eq i32 %443, %331
  br i1 %444, label %445, label %420, !llvm.loop !17

445:                                              ; preds = %411, %420, %326
  %446 = phi float [ 0.000000e+00, %326 ], [ %412, %411 ], [ %437, %420 ]
  %447 = phi float [ 0.000000e+00, %326 ], [ %413, %411 ], [ %439, %420 ]
  %448 = phi i32 [ 0, %326 ], [ %414, %411 ], [ %441, %420 ]
  %449 = sitofp i32 %448 to float
  %450 = fdiv contract float %446, %449
  %451 = fdiv contract float %447, %449
  %452 = fmul contract float %450, %450
  %453 = fsub contract float %451, %452
  %454 = fcmp olt float %453, 0x39F0000000000000
  %455 = select i1 %454, float 0x41F0000000000000, float 1.000000e+00
  %456 = fmul float %453, %455
  %457 = tail call float @llvm.sqrt.f32(float %456)
  %458 = bitcast float %457 to i32
  %459 = add nsw i32 %458, -1
  %460 = bitcast i32 %459 to float
  %461 = add nsw i32 %458, 1
  %462 = bitcast i32 %461 to float
  %463 = tail call i1 @llvm.amdgcn.class.f32(float %456, i32 608)
  %464 = select i1 %454, float 0x3EF0000000000000, float 1.000000e+00
  %465 = fneg float %462
  %466 = tail call float @llvm.fma.f32(float %465, float %457, float %456)
  %467 = fcmp ogt float %466, 0.000000e+00
  %468 = fneg float %460
  %469 = tail call float @llvm.fma.f32(float %468, float %457, float %456)
  %470 = fcmp ole float %469, 0.000000e+00
  %471 = select i1 %470, float %460, float %457
  %472 = select i1 %467, float %462, float %471
  %473 = fmul float %464, %472
  %474 = select i1 %463, float %456, float %473
  %475 = fmul contract float %474, 2.000000e+00
  %476 = fsub contract float %450, %297
  %477 = tail call float @llvm.fabs.f32(float %476)
  %478 = fcmp contract ogt float %477, 0x3EB0C6F7A0000000
  br i1 %478, label %479, label %3227, !llvm.loop !15

479:                                              ; preds = %445
  br i1 %13, label %598, label %480

480:                                              ; preds = %479
  %481 = fadd contract float %450, %475
  %482 = fsub contract float %450, %475
  %483 = add i32 %2, -1
  %484 = and i32 %2, 3
  %485 = icmp ult i32 %483, 3
  br i1 %485, label %564, label %486

486:                                              ; preds = %480
  %487 = and i32 %2, -4
  br label %488

488:                                              ; preds = %488, %486
  %489 = phi i32 [ 0, %486 ], [ %560, %488 ]
  %490 = phi i32 [ 0, %486 ], [ %561, %488 ]
  %491 = phi float [ 0.000000e+00, %486 ], [ %558, %488 ]
  %492 = phi float [ 0.000000e+00, %486 ], [ %556, %488 ]
  %493 = phi i32 [ 0, %486 ], [ %562, %488 ]
  %494 = mul nsw i32 %490, %1
  %495 = add nsw i32 %494, %12
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %496
  %498 = load i16, i16 addrspace(1)* %497, align 2, !tbaa !7, !amdgpu.noclobber !5
  %499 = uitofp i16 %498 to float
  %500 = fcmp contract ogt float %481, %499
  %501 = fcmp contract olt float %482, %499
  %502 = and i1 %500, %501
  %503 = fmul contract float %499, %499
  %504 = select i1 %502, float %499, float -0.000000e+00
  %505 = fadd contract float %492, %504
  %506 = select i1 %502, float %503, float -0.000000e+00
  %507 = fadd contract float %491, %506
  %508 = zext i1 %502 to i32
  %509 = add nuw nsw i32 %489, %508
  %510 = or i32 %490, 1
  %511 = mul nsw i32 %510, %1
  %512 = add nsw i32 %511, %12
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %513
  %515 = load i16, i16 addrspace(1)* %514, align 2, !tbaa !7, !amdgpu.noclobber !5
  %516 = uitofp i16 %515 to float
  %517 = fcmp contract ogt float %481, %516
  %518 = fcmp contract olt float %482, %516
  %519 = and i1 %517, %518
  %520 = fmul contract float %516, %516
  %521 = select i1 %519, float %516, float -0.000000e+00
  %522 = fadd contract float %505, %521
  %523 = select i1 %519, float %520, float -0.000000e+00
  %524 = fadd contract float %507, %523
  %525 = zext i1 %519 to i32
  %526 = add nuw nsw i32 %509, %525
  %527 = or i32 %490, 2
  %528 = mul nsw i32 %527, %1
  %529 = add nsw i32 %528, %12
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %530
  %532 = load i16, i16 addrspace(1)* %531, align 2, !tbaa !7, !amdgpu.noclobber !5
  %533 = uitofp i16 %532 to float
  %534 = fcmp contract ogt float %481, %533
  %535 = fcmp contract olt float %482, %533
  %536 = and i1 %534, %535
  %537 = fmul contract float %533, %533
  %538 = select i1 %536, float %533, float -0.000000e+00
  %539 = fadd contract float %522, %538
  %540 = select i1 %536, float %537, float -0.000000e+00
  %541 = fadd contract float %524, %540
  %542 = zext i1 %536 to i32
  %543 = add nuw nsw i32 %526, %542
  %544 = or i32 %490, 3
  %545 = mul nsw i32 %544, %1
  %546 = add nsw i32 %545, %12
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %547
  %549 = load i16, i16 addrspace(1)* %548, align 2, !tbaa !7, !amdgpu.noclobber !5
  %550 = uitofp i16 %549 to float
  %551 = fcmp contract ogt float %481, %550
  %552 = fcmp contract olt float %482, %550
  %553 = and i1 %551, %552
  %554 = fmul contract float %550, %550
  %555 = select i1 %553, float %550, float -0.000000e+00
  %556 = fadd contract float %539, %555
  %557 = select i1 %553, float %554, float -0.000000e+00
  %558 = fadd contract float %541, %557
  %559 = zext i1 %553 to i32
  %560 = add nuw nsw i32 %543, %559
  %561 = add nuw nsw i32 %490, 4
  %562 = add i32 %493, 4
  %563 = icmp eq i32 %562, %487
  br i1 %563, label %564, label %488, !llvm.loop !11

564:                                              ; preds = %488, %480
  %565 = phi float [ undef, %480 ], [ %556, %488 ]
  %566 = phi float [ undef, %480 ], [ %558, %488 ]
  %567 = phi i32 [ undef, %480 ], [ %560, %488 ]
  %568 = phi i32 [ 0, %480 ], [ %560, %488 ]
  %569 = phi i32 [ 0, %480 ], [ %561, %488 ]
  %570 = phi float [ 0.000000e+00, %480 ], [ %558, %488 ]
  %571 = phi float [ 0.000000e+00, %480 ], [ %556, %488 ]
  %572 = icmp eq i32 %484, 0
  br i1 %572, label %598, label %573

573:                                              ; preds = %564, %573
  %574 = phi i32 [ %594, %573 ], [ %568, %564 ]
  %575 = phi i32 [ %595, %573 ], [ %569, %564 ]
  %576 = phi float [ %592, %573 ], [ %570, %564 ]
  %577 = phi float [ %590, %573 ], [ %571, %564 ]
  %578 = phi i32 [ %596, %573 ], [ 0, %564 ]
  %579 = mul nsw i32 %575, %1
  %580 = add nsw i32 %579, %12
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %581
  %583 = load i16, i16 addrspace(1)* %582, align 2, !tbaa !7, !amdgpu.noclobber !5
  %584 = uitofp i16 %583 to float
  %585 = fcmp contract ogt float %481, %584
  %586 = fcmp contract olt float %482, %584
  %587 = and i1 %585, %586
  %588 = fmul contract float %584, %584
  %589 = select i1 %587, float %584, float -0.000000e+00
  %590 = fadd contract float %577, %589
  %591 = select i1 %587, float %588, float -0.000000e+00
  %592 = fadd contract float %576, %591
  %593 = zext i1 %587 to i32
  %594 = add nuw nsw i32 %574, %593
  %595 = add nuw nsw i32 %575, 1
  %596 = add i32 %578, 1
  %597 = icmp eq i32 %596, %484
  br i1 %597, label %598, label %573, !llvm.loop !18

598:                                              ; preds = %564, %573, %479
  %599 = phi float [ 0.000000e+00, %479 ], [ %565, %564 ], [ %590, %573 ]
  %600 = phi float [ 0.000000e+00, %479 ], [ %566, %564 ], [ %592, %573 ]
  %601 = phi i32 [ 0, %479 ], [ %567, %564 ], [ %594, %573 ]
  %602 = sitofp i32 %601 to float
  %603 = fdiv contract float %599, %602
  %604 = fdiv contract float %600, %602
  %605 = fmul contract float %603, %603
  %606 = fsub contract float %604, %605
  %607 = fcmp olt float %606, 0x39F0000000000000
  %608 = select i1 %607, float 0x41F0000000000000, float 1.000000e+00
  %609 = fmul float %606, %608
  %610 = tail call float @llvm.sqrt.f32(float %609)
  %611 = bitcast float %610 to i32
  %612 = add nsw i32 %611, -1
  %613 = bitcast i32 %612 to float
  %614 = add nsw i32 %611, 1
  %615 = bitcast i32 %614 to float
  %616 = tail call i1 @llvm.amdgcn.class.f32(float %609, i32 608)
  %617 = select i1 %607, float 0x3EF0000000000000, float 1.000000e+00
  %618 = fneg float %615
  %619 = tail call float @llvm.fma.f32(float %618, float %610, float %609)
  %620 = fcmp ogt float %619, 0.000000e+00
  %621 = fneg float %613
  %622 = tail call float @llvm.fma.f32(float %621, float %610, float %609)
  %623 = fcmp ole float %622, 0.000000e+00
  %624 = select i1 %623, float %613, float %610
  %625 = select i1 %620, float %615, float %624
  %626 = fmul float %617, %625
  %627 = select i1 %616, float %609, float %626
  %628 = fmul contract float %627, 2.000000e+00
  %629 = fsub contract float %603, %450
  %630 = tail call float @llvm.fabs.f32(float %629)
  %631 = fcmp contract ogt float %630, 0x3EB0C6F7A0000000
  br i1 %631, label %632, label %3227, !llvm.loop !15

632:                                              ; preds = %598
  br i1 %13, label %751, label %633

633:                                              ; preds = %632
  %634 = fadd contract float %603, %628
  %635 = fsub contract float %603, %628
  %636 = add i32 %2, -1
  %637 = and i32 %2, 3
  %638 = icmp ult i32 %636, 3
  br i1 %638, label %717, label %639

639:                                              ; preds = %633
  %640 = and i32 %2, -4
  br label %641

641:                                              ; preds = %641, %639
  %642 = phi i32 [ 0, %639 ], [ %713, %641 ]
  %643 = phi i32 [ 0, %639 ], [ %714, %641 ]
  %644 = phi float [ 0.000000e+00, %639 ], [ %711, %641 ]
  %645 = phi float [ 0.000000e+00, %639 ], [ %709, %641 ]
  %646 = phi i32 [ 0, %639 ], [ %715, %641 ]
  %647 = mul nsw i32 %643, %1
  %648 = add nsw i32 %647, %12
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %649
  %651 = load i16, i16 addrspace(1)* %650, align 2, !tbaa !7, !amdgpu.noclobber !5
  %652 = uitofp i16 %651 to float
  %653 = fcmp contract ogt float %634, %652
  %654 = fcmp contract olt float %635, %652
  %655 = and i1 %653, %654
  %656 = fmul contract float %652, %652
  %657 = select i1 %655, float %652, float -0.000000e+00
  %658 = fadd contract float %645, %657
  %659 = select i1 %655, float %656, float -0.000000e+00
  %660 = fadd contract float %644, %659
  %661 = zext i1 %655 to i32
  %662 = add nuw nsw i32 %642, %661
  %663 = or i32 %643, 1
  %664 = mul nsw i32 %663, %1
  %665 = add nsw i32 %664, %12
  %666 = sext i32 %665 to i64
  %667 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %666
  %668 = load i16, i16 addrspace(1)* %667, align 2, !tbaa !7, !amdgpu.noclobber !5
  %669 = uitofp i16 %668 to float
  %670 = fcmp contract ogt float %634, %669
  %671 = fcmp contract olt float %635, %669
  %672 = and i1 %670, %671
  %673 = fmul contract float %669, %669
  %674 = select i1 %672, float %669, float -0.000000e+00
  %675 = fadd contract float %658, %674
  %676 = select i1 %672, float %673, float -0.000000e+00
  %677 = fadd contract float %660, %676
  %678 = zext i1 %672 to i32
  %679 = add nuw nsw i32 %662, %678
  %680 = or i32 %643, 2
  %681 = mul nsw i32 %680, %1
  %682 = add nsw i32 %681, %12
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %683
  %685 = load i16, i16 addrspace(1)* %684, align 2, !tbaa !7, !amdgpu.noclobber !5
  %686 = uitofp i16 %685 to float
  %687 = fcmp contract ogt float %634, %686
  %688 = fcmp contract olt float %635, %686
  %689 = and i1 %687, %688
  %690 = fmul contract float %686, %686
  %691 = select i1 %689, float %686, float -0.000000e+00
  %692 = fadd contract float %675, %691
  %693 = select i1 %689, float %690, float -0.000000e+00
  %694 = fadd contract float %677, %693
  %695 = zext i1 %689 to i32
  %696 = add nuw nsw i32 %679, %695
  %697 = or i32 %643, 3
  %698 = mul nsw i32 %697, %1
  %699 = add nsw i32 %698, %12
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %700
  %702 = load i16, i16 addrspace(1)* %701, align 2, !tbaa !7, !amdgpu.noclobber !5
  %703 = uitofp i16 %702 to float
  %704 = fcmp contract ogt float %634, %703
  %705 = fcmp contract olt float %635, %703
  %706 = and i1 %704, %705
  %707 = fmul contract float %703, %703
  %708 = select i1 %706, float %703, float -0.000000e+00
  %709 = fadd contract float %692, %708
  %710 = select i1 %706, float %707, float -0.000000e+00
  %711 = fadd contract float %694, %710
  %712 = zext i1 %706 to i32
  %713 = add nuw nsw i32 %696, %712
  %714 = add nuw nsw i32 %643, 4
  %715 = add i32 %646, 4
  %716 = icmp eq i32 %715, %640
  br i1 %716, label %717, label %641, !llvm.loop !11

717:                                              ; preds = %641, %633
  %718 = phi float [ undef, %633 ], [ %709, %641 ]
  %719 = phi float [ undef, %633 ], [ %711, %641 ]
  %720 = phi i32 [ undef, %633 ], [ %713, %641 ]
  %721 = phi i32 [ 0, %633 ], [ %713, %641 ]
  %722 = phi i32 [ 0, %633 ], [ %714, %641 ]
  %723 = phi float [ 0.000000e+00, %633 ], [ %711, %641 ]
  %724 = phi float [ 0.000000e+00, %633 ], [ %709, %641 ]
  %725 = icmp eq i32 %637, 0
  br i1 %725, label %751, label %726

726:                                              ; preds = %717, %726
  %727 = phi i32 [ %747, %726 ], [ %721, %717 ]
  %728 = phi i32 [ %748, %726 ], [ %722, %717 ]
  %729 = phi float [ %745, %726 ], [ %723, %717 ]
  %730 = phi float [ %743, %726 ], [ %724, %717 ]
  %731 = phi i32 [ %749, %726 ], [ 0, %717 ]
  %732 = mul nsw i32 %728, %1
  %733 = add nsw i32 %732, %12
  %734 = sext i32 %733 to i64
  %735 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %734
  %736 = load i16, i16 addrspace(1)* %735, align 2, !tbaa !7, !amdgpu.noclobber !5
  %737 = uitofp i16 %736 to float
  %738 = fcmp contract ogt float %634, %737
  %739 = fcmp contract olt float %635, %737
  %740 = and i1 %738, %739
  %741 = fmul contract float %737, %737
  %742 = select i1 %740, float %737, float -0.000000e+00
  %743 = fadd contract float %730, %742
  %744 = select i1 %740, float %741, float -0.000000e+00
  %745 = fadd contract float %729, %744
  %746 = zext i1 %740 to i32
  %747 = add nuw nsw i32 %727, %746
  %748 = add nuw nsw i32 %728, 1
  %749 = add i32 %731, 1
  %750 = icmp eq i32 %749, %637
  br i1 %750, label %751, label %726, !llvm.loop !19

751:                                              ; preds = %717, %726, %632
  %752 = phi float [ 0.000000e+00, %632 ], [ %718, %717 ], [ %743, %726 ]
  %753 = phi float [ 0.000000e+00, %632 ], [ %719, %717 ], [ %745, %726 ]
  %754 = phi i32 [ 0, %632 ], [ %720, %717 ], [ %747, %726 ]
  %755 = sitofp i32 %754 to float
  %756 = fdiv contract float %752, %755
  %757 = fdiv contract float %753, %755
  %758 = fmul contract float %756, %756
  %759 = fsub contract float %757, %758
  %760 = fcmp olt float %759, 0x39F0000000000000
  %761 = select i1 %760, float 0x41F0000000000000, float 1.000000e+00
  %762 = fmul float %759, %761
  %763 = tail call float @llvm.sqrt.f32(float %762)
  %764 = bitcast float %763 to i32
  %765 = add nsw i32 %764, -1
  %766 = bitcast i32 %765 to float
  %767 = add nsw i32 %764, 1
  %768 = bitcast i32 %767 to float
  %769 = tail call i1 @llvm.amdgcn.class.f32(float %762, i32 608)
  %770 = select i1 %760, float 0x3EF0000000000000, float 1.000000e+00
  %771 = fneg float %768
  %772 = tail call float @llvm.fma.f32(float %771, float %763, float %762)
  %773 = fcmp ogt float %772, 0.000000e+00
  %774 = fneg float %766
  %775 = tail call float @llvm.fma.f32(float %774, float %763, float %762)
  %776 = fcmp ole float %775, 0.000000e+00
  %777 = select i1 %776, float %766, float %763
  %778 = select i1 %773, float %768, float %777
  %779 = fmul float %770, %778
  %780 = select i1 %769, float %762, float %779
  %781 = fmul contract float %780, 2.000000e+00
  %782 = fsub contract float %756, %603
  %783 = tail call float @llvm.fabs.f32(float %782)
  %784 = fcmp contract ogt float %783, 0x3EB0C6F7A0000000
  br i1 %784, label %785, label %3227, !llvm.loop !15

785:                                              ; preds = %751
  br i1 %13, label %904, label %786

786:                                              ; preds = %785
  %787 = fadd contract float %756, %781
  %788 = fsub contract float %756, %781
  %789 = add i32 %2, -1
  %790 = and i32 %2, 3
  %791 = icmp ult i32 %789, 3
  br i1 %791, label %870, label %792

792:                                              ; preds = %786
  %793 = and i32 %2, -4
  br label %794

794:                                              ; preds = %794, %792
  %795 = phi i32 [ 0, %792 ], [ %866, %794 ]
  %796 = phi i32 [ 0, %792 ], [ %867, %794 ]
  %797 = phi float [ 0.000000e+00, %792 ], [ %864, %794 ]
  %798 = phi float [ 0.000000e+00, %792 ], [ %862, %794 ]
  %799 = phi i32 [ 0, %792 ], [ %868, %794 ]
  %800 = mul nsw i32 %796, %1
  %801 = add nsw i32 %800, %12
  %802 = sext i32 %801 to i64
  %803 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %802
  %804 = load i16, i16 addrspace(1)* %803, align 2, !tbaa !7, !amdgpu.noclobber !5
  %805 = uitofp i16 %804 to float
  %806 = fcmp contract ogt float %787, %805
  %807 = fcmp contract olt float %788, %805
  %808 = and i1 %806, %807
  %809 = fmul contract float %805, %805
  %810 = select i1 %808, float %805, float -0.000000e+00
  %811 = fadd contract float %798, %810
  %812 = select i1 %808, float %809, float -0.000000e+00
  %813 = fadd contract float %797, %812
  %814 = zext i1 %808 to i32
  %815 = add nuw nsw i32 %795, %814
  %816 = or i32 %796, 1
  %817 = mul nsw i32 %816, %1
  %818 = add nsw i32 %817, %12
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %819
  %821 = load i16, i16 addrspace(1)* %820, align 2, !tbaa !7, !amdgpu.noclobber !5
  %822 = uitofp i16 %821 to float
  %823 = fcmp contract ogt float %787, %822
  %824 = fcmp contract olt float %788, %822
  %825 = and i1 %823, %824
  %826 = fmul contract float %822, %822
  %827 = select i1 %825, float %822, float -0.000000e+00
  %828 = fadd contract float %811, %827
  %829 = select i1 %825, float %826, float -0.000000e+00
  %830 = fadd contract float %813, %829
  %831 = zext i1 %825 to i32
  %832 = add nuw nsw i32 %815, %831
  %833 = or i32 %796, 2
  %834 = mul nsw i32 %833, %1
  %835 = add nsw i32 %834, %12
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %836
  %838 = load i16, i16 addrspace(1)* %837, align 2, !tbaa !7, !amdgpu.noclobber !5
  %839 = uitofp i16 %838 to float
  %840 = fcmp contract ogt float %787, %839
  %841 = fcmp contract olt float %788, %839
  %842 = and i1 %840, %841
  %843 = fmul contract float %839, %839
  %844 = select i1 %842, float %839, float -0.000000e+00
  %845 = fadd contract float %828, %844
  %846 = select i1 %842, float %843, float -0.000000e+00
  %847 = fadd contract float %830, %846
  %848 = zext i1 %842 to i32
  %849 = add nuw nsw i32 %832, %848
  %850 = or i32 %796, 3
  %851 = mul nsw i32 %850, %1
  %852 = add nsw i32 %851, %12
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %853
  %855 = load i16, i16 addrspace(1)* %854, align 2, !tbaa !7, !amdgpu.noclobber !5
  %856 = uitofp i16 %855 to float
  %857 = fcmp contract ogt float %787, %856
  %858 = fcmp contract olt float %788, %856
  %859 = and i1 %857, %858
  %860 = fmul contract float %856, %856
  %861 = select i1 %859, float %856, float -0.000000e+00
  %862 = fadd contract float %845, %861
  %863 = select i1 %859, float %860, float -0.000000e+00
  %864 = fadd contract float %847, %863
  %865 = zext i1 %859 to i32
  %866 = add nuw nsw i32 %849, %865
  %867 = add nuw nsw i32 %796, 4
  %868 = add i32 %799, 4
  %869 = icmp eq i32 %868, %793
  br i1 %869, label %870, label %794, !llvm.loop !11

870:                                              ; preds = %794, %786
  %871 = phi float [ undef, %786 ], [ %862, %794 ]
  %872 = phi float [ undef, %786 ], [ %864, %794 ]
  %873 = phi i32 [ undef, %786 ], [ %866, %794 ]
  %874 = phi i32 [ 0, %786 ], [ %866, %794 ]
  %875 = phi i32 [ 0, %786 ], [ %867, %794 ]
  %876 = phi float [ 0.000000e+00, %786 ], [ %864, %794 ]
  %877 = phi float [ 0.000000e+00, %786 ], [ %862, %794 ]
  %878 = icmp eq i32 %790, 0
  br i1 %878, label %904, label %879

879:                                              ; preds = %870, %879
  %880 = phi i32 [ %900, %879 ], [ %874, %870 ]
  %881 = phi i32 [ %901, %879 ], [ %875, %870 ]
  %882 = phi float [ %898, %879 ], [ %876, %870 ]
  %883 = phi float [ %896, %879 ], [ %877, %870 ]
  %884 = phi i32 [ %902, %879 ], [ 0, %870 ]
  %885 = mul nsw i32 %881, %1
  %886 = add nsw i32 %885, %12
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %887
  %889 = load i16, i16 addrspace(1)* %888, align 2, !tbaa !7, !amdgpu.noclobber !5
  %890 = uitofp i16 %889 to float
  %891 = fcmp contract ogt float %787, %890
  %892 = fcmp contract olt float %788, %890
  %893 = and i1 %891, %892
  %894 = fmul contract float %890, %890
  %895 = select i1 %893, float %890, float -0.000000e+00
  %896 = fadd contract float %883, %895
  %897 = select i1 %893, float %894, float -0.000000e+00
  %898 = fadd contract float %882, %897
  %899 = zext i1 %893 to i32
  %900 = add nuw nsw i32 %880, %899
  %901 = add nuw nsw i32 %881, 1
  %902 = add i32 %884, 1
  %903 = icmp eq i32 %902, %790
  br i1 %903, label %904, label %879, !llvm.loop !20

904:                                              ; preds = %870, %879, %785
  %905 = phi float [ 0.000000e+00, %785 ], [ %871, %870 ], [ %896, %879 ]
  %906 = phi float [ 0.000000e+00, %785 ], [ %872, %870 ], [ %898, %879 ]
  %907 = phi i32 [ 0, %785 ], [ %873, %870 ], [ %900, %879 ]
  %908 = sitofp i32 %907 to float
  %909 = fdiv contract float %905, %908
  %910 = fdiv contract float %906, %908
  %911 = fmul contract float %909, %909
  %912 = fsub contract float %910, %911
  %913 = fcmp olt float %912, 0x39F0000000000000
  %914 = select i1 %913, float 0x41F0000000000000, float 1.000000e+00
  %915 = fmul float %912, %914
  %916 = tail call float @llvm.sqrt.f32(float %915)
  %917 = bitcast float %916 to i32
  %918 = add nsw i32 %917, -1
  %919 = bitcast i32 %918 to float
  %920 = add nsw i32 %917, 1
  %921 = bitcast i32 %920 to float
  %922 = tail call i1 @llvm.amdgcn.class.f32(float %915, i32 608)
  %923 = select i1 %913, float 0x3EF0000000000000, float 1.000000e+00
  %924 = fneg float %921
  %925 = tail call float @llvm.fma.f32(float %924, float %916, float %915)
  %926 = fcmp ogt float %925, 0.000000e+00
  %927 = fneg float %919
  %928 = tail call float @llvm.fma.f32(float %927, float %916, float %915)
  %929 = fcmp ole float %928, 0.000000e+00
  %930 = select i1 %929, float %919, float %916
  %931 = select i1 %926, float %921, float %930
  %932 = fmul float %923, %931
  %933 = select i1 %922, float %915, float %932
  %934 = fmul contract float %933, 2.000000e+00
  %935 = fsub contract float %909, %756
  %936 = tail call float @llvm.fabs.f32(float %935)
  %937 = fcmp contract ogt float %936, 0x3EB0C6F7A0000000
  br i1 %937, label %938, label %3227, !llvm.loop !15

938:                                              ; preds = %904
  br i1 %13, label %1057, label %939

939:                                              ; preds = %938
  %940 = fadd contract float %909, %934
  %941 = fsub contract float %909, %934
  %942 = add i32 %2, -1
  %943 = and i32 %2, 3
  %944 = icmp ult i32 %942, 3
  br i1 %944, label %1023, label %945

945:                                              ; preds = %939
  %946 = and i32 %2, -4
  br label %947

947:                                              ; preds = %947, %945
  %948 = phi i32 [ 0, %945 ], [ %1019, %947 ]
  %949 = phi i32 [ 0, %945 ], [ %1020, %947 ]
  %950 = phi float [ 0.000000e+00, %945 ], [ %1017, %947 ]
  %951 = phi float [ 0.000000e+00, %945 ], [ %1015, %947 ]
  %952 = phi i32 [ 0, %945 ], [ %1021, %947 ]
  %953 = mul nsw i32 %949, %1
  %954 = add nsw i32 %953, %12
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %955
  %957 = load i16, i16 addrspace(1)* %956, align 2, !tbaa !7, !amdgpu.noclobber !5
  %958 = uitofp i16 %957 to float
  %959 = fcmp contract ogt float %940, %958
  %960 = fcmp contract olt float %941, %958
  %961 = and i1 %959, %960
  %962 = fmul contract float %958, %958
  %963 = select i1 %961, float %958, float -0.000000e+00
  %964 = fadd contract float %951, %963
  %965 = select i1 %961, float %962, float -0.000000e+00
  %966 = fadd contract float %950, %965
  %967 = zext i1 %961 to i32
  %968 = add nuw nsw i32 %948, %967
  %969 = or i32 %949, 1
  %970 = mul nsw i32 %969, %1
  %971 = add nsw i32 %970, %12
  %972 = sext i32 %971 to i64
  %973 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %972
  %974 = load i16, i16 addrspace(1)* %973, align 2, !tbaa !7, !amdgpu.noclobber !5
  %975 = uitofp i16 %974 to float
  %976 = fcmp contract ogt float %940, %975
  %977 = fcmp contract olt float %941, %975
  %978 = and i1 %976, %977
  %979 = fmul contract float %975, %975
  %980 = select i1 %978, float %975, float -0.000000e+00
  %981 = fadd contract float %964, %980
  %982 = select i1 %978, float %979, float -0.000000e+00
  %983 = fadd contract float %966, %982
  %984 = zext i1 %978 to i32
  %985 = add nuw nsw i32 %968, %984
  %986 = or i32 %949, 2
  %987 = mul nsw i32 %986, %1
  %988 = add nsw i32 %987, %12
  %989 = sext i32 %988 to i64
  %990 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %989
  %991 = load i16, i16 addrspace(1)* %990, align 2, !tbaa !7, !amdgpu.noclobber !5
  %992 = uitofp i16 %991 to float
  %993 = fcmp contract ogt float %940, %992
  %994 = fcmp contract olt float %941, %992
  %995 = and i1 %993, %994
  %996 = fmul contract float %992, %992
  %997 = select i1 %995, float %992, float -0.000000e+00
  %998 = fadd contract float %981, %997
  %999 = select i1 %995, float %996, float -0.000000e+00
  %1000 = fadd contract float %983, %999
  %1001 = zext i1 %995 to i32
  %1002 = add nuw nsw i32 %985, %1001
  %1003 = or i32 %949, 3
  %1004 = mul nsw i32 %1003, %1
  %1005 = add nsw i32 %1004, %12
  %1006 = sext i32 %1005 to i64
  %1007 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1006
  %1008 = load i16, i16 addrspace(1)* %1007, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1009 = uitofp i16 %1008 to float
  %1010 = fcmp contract ogt float %940, %1009
  %1011 = fcmp contract olt float %941, %1009
  %1012 = and i1 %1010, %1011
  %1013 = fmul contract float %1009, %1009
  %1014 = select i1 %1012, float %1009, float -0.000000e+00
  %1015 = fadd contract float %998, %1014
  %1016 = select i1 %1012, float %1013, float -0.000000e+00
  %1017 = fadd contract float %1000, %1016
  %1018 = zext i1 %1012 to i32
  %1019 = add nuw nsw i32 %1002, %1018
  %1020 = add nuw nsw i32 %949, 4
  %1021 = add i32 %952, 4
  %1022 = icmp eq i32 %1021, %946
  br i1 %1022, label %1023, label %947, !llvm.loop !11

1023:                                             ; preds = %947, %939
  %1024 = phi float [ undef, %939 ], [ %1015, %947 ]
  %1025 = phi float [ undef, %939 ], [ %1017, %947 ]
  %1026 = phi i32 [ undef, %939 ], [ %1019, %947 ]
  %1027 = phi i32 [ 0, %939 ], [ %1019, %947 ]
  %1028 = phi i32 [ 0, %939 ], [ %1020, %947 ]
  %1029 = phi float [ 0.000000e+00, %939 ], [ %1017, %947 ]
  %1030 = phi float [ 0.000000e+00, %939 ], [ %1015, %947 ]
  %1031 = icmp eq i32 %943, 0
  br i1 %1031, label %1057, label %1032

1032:                                             ; preds = %1023, %1032
  %1033 = phi i32 [ %1053, %1032 ], [ %1027, %1023 ]
  %1034 = phi i32 [ %1054, %1032 ], [ %1028, %1023 ]
  %1035 = phi float [ %1051, %1032 ], [ %1029, %1023 ]
  %1036 = phi float [ %1049, %1032 ], [ %1030, %1023 ]
  %1037 = phi i32 [ %1055, %1032 ], [ 0, %1023 ]
  %1038 = mul nsw i32 %1034, %1
  %1039 = add nsw i32 %1038, %12
  %1040 = sext i32 %1039 to i64
  %1041 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1040
  %1042 = load i16, i16 addrspace(1)* %1041, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1043 = uitofp i16 %1042 to float
  %1044 = fcmp contract ogt float %940, %1043
  %1045 = fcmp contract olt float %941, %1043
  %1046 = and i1 %1044, %1045
  %1047 = fmul contract float %1043, %1043
  %1048 = select i1 %1046, float %1043, float -0.000000e+00
  %1049 = fadd contract float %1036, %1048
  %1050 = select i1 %1046, float %1047, float -0.000000e+00
  %1051 = fadd contract float %1035, %1050
  %1052 = zext i1 %1046 to i32
  %1053 = add nuw nsw i32 %1033, %1052
  %1054 = add nuw nsw i32 %1034, 1
  %1055 = add i32 %1037, 1
  %1056 = icmp eq i32 %1055, %943
  br i1 %1056, label %1057, label %1032, !llvm.loop !21

1057:                                             ; preds = %1023, %1032, %938
  %1058 = phi float [ 0.000000e+00, %938 ], [ %1024, %1023 ], [ %1049, %1032 ]
  %1059 = phi float [ 0.000000e+00, %938 ], [ %1025, %1023 ], [ %1051, %1032 ]
  %1060 = phi i32 [ 0, %938 ], [ %1026, %1023 ], [ %1053, %1032 ]
  %1061 = sitofp i32 %1060 to float
  %1062 = fdiv contract float %1058, %1061
  %1063 = fdiv contract float %1059, %1061
  %1064 = fmul contract float %1062, %1062
  %1065 = fsub contract float %1063, %1064
  %1066 = fcmp olt float %1065, 0x39F0000000000000
  %1067 = select i1 %1066, float 0x41F0000000000000, float 1.000000e+00
  %1068 = fmul float %1065, %1067
  %1069 = tail call float @llvm.sqrt.f32(float %1068)
  %1070 = bitcast float %1069 to i32
  %1071 = add nsw i32 %1070, -1
  %1072 = bitcast i32 %1071 to float
  %1073 = add nsw i32 %1070, 1
  %1074 = bitcast i32 %1073 to float
  %1075 = tail call i1 @llvm.amdgcn.class.f32(float %1068, i32 608)
  %1076 = select i1 %1066, float 0x3EF0000000000000, float 1.000000e+00
  %1077 = fneg float %1074
  %1078 = tail call float @llvm.fma.f32(float %1077, float %1069, float %1068)
  %1079 = fcmp ogt float %1078, 0.000000e+00
  %1080 = fneg float %1072
  %1081 = tail call float @llvm.fma.f32(float %1080, float %1069, float %1068)
  %1082 = fcmp ole float %1081, 0.000000e+00
  %1083 = select i1 %1082, float %1072, float %1069
  %1084 = select i1 %1079, float %1074, float %1083
  %1085 = fmul float %1076, %1084
  %1086 = select i1 %1075, float %1068, float %1085
  %1087 = fmul contract float %1086, 2.000000e+00
  %1088 = fsub contract float %1062, %909
  %1089 = tail call float @llvm.fabs.f32(float %1088)
  %1090 = fcmp contract ogt float %1089, 0x3EB0C6F7A0000000
  br i1 %1090, label %1091, label %3227, !llvm.loop !15

1091:                                             ; preds = %1057
  br i1 %13, label %1210, label %1092

1092:                                             ; preds = %1091
  %1093 = fadd contract float %1062, %1087
  %1094 = fsub contract float %1062, %1087
  %1095 = add i32 %2, -1
  %1096 = and i32 %2, 3
  %1097 = icmp ult i32 %1095, 3
  br i1 %1097, label %1176, label %1098

1098:                                             ; preds = %1092
  %1099 = and i32 %2, -4
  br label %1100

1100:                                             ; preds = %1100, %1098
  %1101 = phi i32 [ 0, %1098 ], [ %1172, %1100 ]
  %1102 = phi i32 [ 0, %1098 ], [ %1173, %1100 ]
  %1103 = phi float [ 0.000000e+00, %1098 ], [ %1170, %1100 ]
  %1104 = phi float [ 0.000000e+00, %1098 ], [ %1168, %1100 ]
  %1105 = phi i32 [ 0, %1098 ], [ %1174, %1100 ]
  %1106 = mul nsw i32 %1102, %1
  %1107 = add nsw i32 %1106, %12
  %1108 = sext i32 %1107 to i64
  %1109 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1108
  %1110 = load i16, i16 addrspace(1)* %1109, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1111 = uitofp i16 %1110 to float
  %1112 = fcmp contract ogt float %1093, %1111
  %1113 = fcmp contract olt float %1094, %1111
  %1114 = and i1 %1112, %1113
  %1115 = fmul contract float %1111, %1111
  %1116 = select i1 %1114, float %1111, float -0.000000e+00
  %1117 = fadd contract float %1104, %1116
  %1118 = select i1 %1114, float %1115, float -0.000000e+00
  %1119 = fadd contract float %1103, %1118
  %1120 = zext i1 %1114 to i32
  %1121 = add nuw nsw i32 %1101, %1120
  %1122 = or i32 %1102, 1
  %1123 = mul nsw i32 %1122, %1
  %1124 = add nsw i32 %1123, %12
  %1125 = sext i32 %1124 to i64
  %1126 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1125
  %1127 = load i16, i16 addrspace(1)* %1126, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1128 = uitofp i16 %1127 to float
  %1129 = fcmp contract ogt float %1093, %1128
  %1130 = fcmp contract olt float %1094, %1128
  %1131 = and i1 %1129, %1130
  %1132 = fmul contract float %1128, %1128
  %1133 = select i1 %1131, float %1128, float -0.000000e+00
  %1134 = fadd contract float %1117, %1133
  %1135 = select i1 %1131, float %1132, float -0.000000e+00
  %1136 = fadd contract float %1119, %1135
  %1137 = zext i1 %1131 to i32
  %1138 = add nuw nsw i32 %1121, %1137
  %1139 = or i32 %1102, 2
  %1140 = mul nsw i32 %1139, %1
  %1141 = add nsw i32 %1140, %12
  %1142 = sext i32 %1141 to i64
  %1143 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1142
  %1144 = load i16, i16 addrspace(1)* %1143, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1145 = uitofp i16 %1144 to float
  %1146 = fcmp contract ogt float %1093, %1145
  %1147 = fcmp contract olt float %1094, %1145
  %1148 = and i1 %1146, %1147
  %1149 = fmul contract float %1145, %1145
  %1150 = select i1 %1148, float %1145, float -0.000000e+00
  %1151 = fadd contract float %1134, %1150
  %1152 = select i1 %1148, float %1149, float -0.000000e+00
  %1153 = fadd contract float %1136, %1152
  %1154 = zext i1 %1148 to i32
  %1155 = add nuw nsw i32 %1138, %1154
  %1156 = or i32 %1102, 3
  %1157 = mul nsw i32 %1156, %1
  %1158 = add nsw i32 %1157, %12
  %1159 = sext i32 %1158 to i64
  %1160 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1159
  %1161 = load i16, i16 addrspace(1)* %1160, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1162 = uitofp i16 %1161 to float
  %1163 = fcmp contract ogt float %1093, %1162
  %1164 = fcmp contract olt float %1094, %1162
  %1165 = and i1 %1163, %1164
  %1166 = fmul contract float %1162, %1162
  %1167 = select i1 %1165, float %1162, float -0.000000e+00
  %1168 = fadd contract float %1151, %1167
  %1169 = select i1 %1165, float %1166, float -0.000000e+00
  %1170 = fadd contract float %1153, %1169
  %1171 = zext i1 %1165 to i32
  %1172 = add nuw nsw i32 %1155, %1171
  %1173 = add nuw nsw i32 %1102, 4
  %1174 = add i32 %1105, 4
  %1175 = icmp eq i32 %1174, %1099
  br i1 %1175, label %1176, label %1100, !llvm.loop !11

1176:                                             ; preds = %1100, %1092
  %1177 = phi float [ undef, %1092 ], [ %1168, %1100 ]
  %1178 = phi float [ undef, %1092 ], [ %1170, %1100 ]
  %1179 = phi i32 [ undef, %1092 ], [ %1172, %1100 ]
  %1180 = phi i32 [ 0, %1092 ], [ %1172, %1100 ]
  %1181 = phi i32 [ 0, %1092 ], [ %1173, %1100 ]
  %1182 = phi float [ 0.000000e+00, %1092 ], [ %1170, %1100 ]
  %1183 = phi float [ 0.000000e+00, %1092 ], [ %1168, %1100 ]
  %1184 = icmp eq i32 %1096, 0
  br i1 %1184, label %1210, label %1185

1185:                                             ; preds = %1176, %1185
  %1186 = phi i32 [ %1206, %1185 ], [ %1180, %1176 ]
  %1187 = phi i32 [ %1207, %1185 ], [ %1181, %1176 ]
  %1188 = phi float [ %1204, %1185 ], [ %1182, %1176 ]
  %1189 = phi float [ %1202, %1185 ], [ %1183, %1176 ]
  %1190 = phi i32 [ %1208, %1185 ], [ 0, %1176 ]
  %1191 = mul nsw i32 %1187, %1
  %1192 = add nsw i32 %1191, %12
  %1193 = sext i32 %1192 to i64
  %1194 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1193
  %1195 = load i16, i16 addrspace(1)* %1194, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1196 = uitofp i16 %1195 to float
  %1197 = fcmp contract ogt float %1093, %1196
  %1198 = fcmp contract olt float %1094, %1196
  %1199 = and i1 %1197, %1198
  %1200 = fmul contract float %1196, %1196
  %1201 = select i1 %1199, float %1196, float -0.000000e+00
  %1202 = fadd contract float %1189, %1201
  %1203 = select i1 %1199, float %1200, float -0.000000e+00
  %1204 = fadd contract float %1188, %1203
  %1205 = zext i1 %1199 to i32
  %1206 = add nuw nsw i32 %1186, %1205
  %1207 = add nuw nsw i32 %1187, 1
  %1208 = add i32 %1190, 1
  %1209 = icmp eq i32 %1208, %1096
  br i1 %1209, label %1210, label %1185, !llvm.loop !22

1210:                                             ; preds = %1176, %1185, %1091
  %1211 = phi float [ 0.000000e+00, %1091 ], [ %1177, %1176 ], [ %1202, %1185 ]
  %1212 = phi float [ 0.000000e+00, %1091 ], [ %1178, %1176 ], [ %1204, %1185 ]
  %1213 = phi i32 [ 0, %1091 ], [ %1179, %1176 ], [ %1206, %1185 ]
  %1214 = sitofp i32 %1213 to float
  %1215 = fdiv contract float %1211, %1214
  %1216 = fdiv contract float %1212, %1214
  %1217 = fmul contract float %1215, %1215
  %1218 = fsub contract float %1216, %1217
  %1219 = fcmp olt float %1218, 0x39F0000000000000
  %1220 = select i1 %1219, float 0x41F0000000000000, float 1.000000e+00
  %1221 = fmul float %1218, %1220
  %1222 = tail call float @llvm.sqrt.f32(float %1221)
  %1223 = bitcast float %1222 to i32
  %1224 = add nsw i32 %1223, -1
  %1225 = bitcast i32 %1224 to float
  %1226 = add nsw i32 %1223, 1
  %1227 = bitcast i32 %1226 to float
  %1228 = tail call i1 @llvm.amdgcn.class.f32(float %1221, i32 608)
  %1229 = select i1 %1219, float 0x3EF0000000000000, float 1.000000e+00
  %1230 = fneg float %1227
  %1231 = tail call float @llvm.fma.f32(float %1230, float %1222, float %1221)
  %1232 = fcmp ogt float %1231, 0.000000e+00
  %1233 = fneg float %1225
  %1234 = tail call float @llvm.fma.f32(float %1233, float %1222, float %1221)
  %1235 = fcmp ole float %1234, 0.000000e+00
  %1236 = select i1 %1235, float %1225, float %1222
  %1237 = select i1 %1232, float %1227, float %1236
  %1238 = fmul float %1229, %1237
  %1239 = select i1 %1228, float %1221, float %1238
  %1240 = fmul contract float %1239, 2.000000e+00
  %1241 = fsub contract float %1215, %1062
  %1242 = tail call float @llvm.fabs.f32(float %1241)
  %1243 = fcmp contract ogt float %1242, 0x3EB0C6F7A0000000
  br i1 %1243, label %1244, label %3227, !llvm.loop !15

1244:                                             ; preds = %1210
  br i1 %13, label %1363, label %1245

1245:                                             ; preds = %1244
  %1246 = fadd contract float %1215, %1240
  %1247 = fsub contract float %1215, %1240
  %1248 = add i32 %2, -1
  %1249 = and i32 %2, 3
  %1250 = icmp ult i32 %1248, 3
  br i1 %1250, label %1329, label %1251

1251:                                             ; preds = %1245
  %1252 = and i32 %2, -4
  br label %1253

1253:                                             ; preds = %1253, %1251
  %1254 = phi i32 [ 0, %1251 ], [ %1325, %1253 ]
  %1255 = phi i32 [ 0, %1251 ], [ %1326, %1253 ]
  %1256 = phi float [ 0.000000e+00, %1251 ], [ %1323, %1253 ]
  %1257 = phi float [ 0.000000e+00, %1251 ], [ %1321, %1253 ]
  %1258 = phi i32 [ 0, %1251 ], [ %1327, %1253 ]
  %1259 = mul nsw i32 %1255, %1
  %1260 = add nsw i32 %1259, %12
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1261
  %1263 = load i16, i16 addrspace(1)* %1262, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1264 = uitofp i16 %1263 to float
  %1265 = fcmp contract ogt float %1246, %1264
  %1266 = fcmp contract olt float %1247, %1264
  %1267 = and i1 %1265, %1266
  %1268 = fmul contract float %1264, %1264
  %1269 = select i1 %1267, float %1264, float -0.000000e+00
  %1270 = fadd contract float %1257, %1269
  %1271 = select i1 %1267, float %1268, float -0.000000e+00
  %1272 = fadd contract float %1256, %1271
  %1273 = zext i1 %1267 to i32
  %1274 = add nuw nsw i32 %1254, %1273
  %1275 = or i32 %1255, 1
  %1276 = mul nsw i32 %1275, %1
  %1277 = add nsw i32 %1276, %12
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1278
  %1280 = load i16, i16 addrspace(1)* %1279, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1281 = uitofp i16 %1280 to float
  %1282 = fcmp contract ogt float %1246, %1281
  %1283 = fcmp contract olt float %1247, %1281
  %1284 = and i1 %1282, %1283
  %1285 = fmul contract float %1281, %1281
  %1286 = select i1 %1284, float %1281, float -0.000000e+00
  %1287 = fadd contract float %1270, %1286
  %1288 = select i1 %1284, float %1285, float -0.000000e+00
  %1289 = fadd contract float %1272, %1288
  %1290 = zext i1 %1284 to i32
  %1291 = add nuw nsw i32 %1274, %1290
  %1292 = or i32 %1255, 2
  %1293 = mul nsw i32 %1292, %1
  %1294 = add nsw i32 %1293, %12
  %1295 = sext i32 %1294 to i64
  %1296 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1295
  %1297 = load i16, i16 addrspace(1)* %1296, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1298 = uitofp i16 %1297 to float
  %1299 = fcmp contract ogt float %1246, %1298
  %1300 = fcmp contract olt float %1247, %1298
  %1301 = and i1 %1299, %1300
  %1302 = fmul contract float %1298, %1298
  %1303 = select i1 %1301, float %1298, float -0.000000e+00
  %1304 = fadd contract float %1287, %1303
  %1305 = select i1 %1301, float %1302, float -0.000000e+00
  %1306 = fadd contract float %1289, %1305
  %1307 = zext i1 %1301 to i32
  %1308 = add nuw nsw i32 %1291, %1307
  %1309 = or i32 %1255, 3
  %1310 = mul nsw i32 %1309, %1
  %1311 = add nsw i32 %1310, %12
  %1312 = sext i32 %1311 to i64
  %1313 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1312
  %1314 = load i16, i16 addrspace(1)* %1313, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1315 = uitofp i16 %1314 to float
  %1316 = fcmp contract ogt float %1246, %1315
  %1317 = fcmp contract olt float %1247, %1315
  %1318 = and i1 %1316, %1317
  %1319 = fmul contract float %1315, %1315
  %1320 = select i1 %1318, float %1315, float -0.000000e+00
  %1321 = fadd contract float %1304, %1320
  %1322 = select i1 %1318, float %1319, float -0.000000e+00
  %1323 = fadd contract float %1306, %1322
  %1324 = zext i1 %1318 to i32
  %1325 = add nuw nsw i32 %1308, %1324
  %1326 = add nuw nsw i32 %1255, 4
  %1327 = add i32 %1258, 4
  %1328 = icmp eq i32 %1327, %1252
  br i1 %1328, label %1329, label %1253, !llvm.loop !11

1329:                                             ; preds = %1253, %1245
  %1330 = phi float [ undef, %1245 ], [ %1321, %1253 ]
  %1331 = phi float [ undef, %1245 ], [ %1323, %1253 ]
  %1332 = phi i32 [ undef, %1245 ], [ %1325, %1253 ]
  %1333 = phi i32 [ 0, %1245 ], [ %1325, %1253 ]
  %1334 = phi i32 [ 0, %1245 ], [ %1326, %1253 ]
  %1335 = phi float [ 0.000000e+00, %1245 ], [ %1323, %1253 ]
  %1336 = phi float [ 0.000000e+00, %1245 ], [ %1321, %1253 ]
  %1337 = icmp eq i32 %1249, 0
  br i1 %1337, label %1363, label %1338

1338:                                             ; preds = %1329, %1338
  %1339 = phi i32 [ %1359, %1338 ], [ %1333, %1329 ]
  %1340 = phi i32 [ %1360, %1338 ], [ %1334, %1329 ]
  %1341 = phi float [ %1357, %1338 ], [ %1335, %1329 ]
  %1342 = phi float [ %1355, %1338 ], [ %1336, %1329 ]
  %1343 = phi i32 [ %1361, %1338 ], [ 0, %1329 ]
  %1344 = mul nsw i32 %1340, %1
  %1345 = add nsw i32 %1344, %12
  %1346 = sext i32 %1345 to i64
  %1347 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1346
  %1348 = load i16, i16 addrspace(1)* %1347, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1349 = uitofp i16 %1348 to float
  %1350 = fcmp contract ogt float %1246, %1349
  %1351 = fcmp contract olt float %1247, %1349
  %1352 = and i1 %1350, %1351
  %1353 = fmul contract float %1349, %1349
  %1354 = select i1 %1352, float %1349, float -0.000000e+00
  %1355 = fadd contract float %1342, %1354
  %1356 = select i1 %1352, float %1353, float -0.000000e+00
  %1357 = fadd contract float %1341, %1356
  %1358 = zext i1 %1352 to i32
  %1359 = add nuw nsw i32 %1339, %1358
  %1360 = add nuw nsw i32 %1340, 1
  %1361 = add i32 %1343, 1
  %1362 = icmp eq i32 %1361, %1249
  br i1 %1362, label %1363, label %1338, !llvm.loop !23

1363:                                             ; preds = %1329, %1338, %1244
  %1364 = phi float [ 0.000000e+00, %1244 ], [ %1330, %1329 ], [ %1355, %1338 ]
  %1365 = phi float [ 0.000000e+00, %1244 ], [ %1331, %1329 ], [ %1357, %1338 ]
  %1366 = phi i32 [ 0, %1244 ], [ %1332, %1329 ], [ %1359, %1338 ]
  %1367 = sitofp i32 %1366 to float
  %1368 = fdiv contract float %1364, %1367
  %1369 = fdiv contract float %1365, %1367
  %1370 = fmul contract float %1368, %1368
  %1371 = fsub contract float %1369, %1370
  %1372 = fcmp olt float %1371, 0x39F0000000000000
  %1373 = select i1 %1372, float 0x41F0000000000000, float 1.000000e+00
  %1374 = fmul float %1371, %1373
  %1375 = tail call float @llvm.sqrt.f32(float %1374)
  %1376 = bitcast float %1375 to i32
  %1377 = add nsw i32 %1376, -1
  %1378 = bitcast i32 %1377 to float
  %1379 = add nsw i32 %1376, 1
  %1380 = bitcast i32 %1379 to float
  %1381 = tail call i1 @llvm.amdgcn.class.f32(float %1374, i32 608)
  %1382 = select i1 %1372, float 0x3EF0000000000000, float 1.000000e+00
  %1383 = fneg float %1380
  %1384 = tail call float @llvm.fma.f32(float %1383, float %1375, float %1374)
  %1385 = fcmp ogt float %1384, 0.000000e+00
  %1386 = fneg float %1378
  %1387 = tail call float @llvm.fma.f32(float %1386, float %1375, float %1374)
  %1388 = fcmp ole float %1387, 0.000000e+00
  %1389 = select i1 %1388, float %1378, float %1375
  %1390 = select i1 %1385, float %1380, float %1389
  %1391 = fmul float %1382, %1390
  %1392 = select i1 %1381, float %1374, float %1391
  %1393 = fmul contract float %1392, 2.000000e+00
  %1394 = fsub contract float %1368, %1215
  %1395 = tail call float @llvm.fabs.f32(float %1394)
  %1396 = fcmp contract ogt float %1395, 0x3EB0C6F7A0000000
  br i1 %1396, label %1397, label %3227, !llvm.loop !15

1397:                                             ; preds = %1363
  br i1 %13, label %1516, label %1398

1398:                                             ; preds = %1397
  %1399 = fadd contract float %1368, %1393
  %1400 = fsub contract float %1368, %1393
  %1401 = add i32 %2, -1
  %1402 = and i32 %2, 3
  %1403 = icmp ult i32 %1401, 3
  br i1 %1403, label %1482, label %1404

1404:                                             ; preds = %1398
  %1405 = and i32 %2, -4
  br label %1406

1406:                                             ; preds = %1406, %1404
  %1407 = phi i32 [ 0, %1404 ], [ %1478, %1406 ]
  %1408 = phi i32 [ 0, %1404 ], [ %1479, %1406 ]
  %1409 = phi float [ 0.000000e+00, %1404 ], [ %1476, %1406 ]
  %1410 = phi float [ 0.000000e+00, %1404 ], [ %1474, %1406 ]
  %1411 = phi i32 [ 0, %1404 ], [ %1480, %1406 ]
  %1412 = mul nsw i32 %1408, %1
  %1413 = add nsw i32 %1412, %12
  %1414 = sext i32 %1413 to i64
  %1415 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1414
  %1416 = load i16, i16 addrspace(1)* %1415, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1417 = uitofp i16 %1416 to float
  %1418 = fcmp contract ogt float %1399, %1417
  %1419 = fcmp contract olt float %1400, %1417
  %1420 = and i1 %1418, %1419
  %1421 = fmul contract float %1417, %1417
  %1422 = select i1 %1420, float %1417, float -0.000000e+00
  %1423 = fadd contract float %1410, %1422
  %1424 = select i1 %1420, float %1421, float -0.000000e+00
  %1425 = fadd contract float %1409, %1424
  %1426 = zext i1 %1420 to i32
  %1427 = add nuw nsw i32 %1407, %1426
  %1428 = or i32 %1408, 1
  %1429 = mul nsw i32 %1428, %1
  %1430 = add nsw i32 %1429, %12
  %1431 = sext i32 %1430 to i64
  %1432 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1431
  %1433 = load i16, i16 addrspace(1)* %1432, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1434 = uitofp i16 %1433 to float
  %1435 = fcmp contract ogt float %1399, %1434
  %1436 = fcmp contract olt float %1400, %1434
  %1437 = and i1 %1435, %1436
  %1438 = fmul contract float %1434, %1434
  %1439 = select i1 %1437, float %1434, float -0.000000e+00
  %1440 = fadd contract float %1423, %1439
  %1441 = select i1 %1437, float %1438, float -0.000000e+00
  %1442 = fadd contract float %1425, %1441
  %1443 = zext i1 %1437 to i32
  %1444 = add nuw nsw i32 %1427, %1443
  %1445 = or i32 %1408, 2
  %1446 = mul nsw i32 %1445, %1
  %1447 = add nsw i32 %1446, %12
  %1448 = sext i32 %1447 to i64
  %1449 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1448
  %1450 = load i16, i16 addrspace(1)* %1449, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1451 = uitofp i16 %1450 to float
  %1452 = fcmp contract ogt float %1399, %1451
  %1453 = fcmp contract olt float %1400, %1451
  %1454 = and i1 %1452, %1453
  %1455 = fmul contract float %1451, %1451
  %1456 = select i1 %1454, float %1451, float -0.000000e+00
  %1457 = fadd contract float %1440, %1456
  %1458 = select i1 %1454, float %1455, float -0.000000e+00
  %1459 = fadd contract float %1442, %1458
  %1460 = zext i1 %1454 to i32
  %1461 = add nuw nsw i32 %1444, %1460
  %1462 = or i32 %1408, 3
  %1463 = mul nsw i32 %1462, %1
  %1464 = add nsw i32 %1463, %12
  %1465 = sext i32 %1464 to i64
  %1466 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1465
  %1467 = load i16, i16 addrspace(1)* %1466, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1468 = uitofp i16 %1467 to float
  %1469 = fcmp contract ogt float %1399, %1468
  %1470 = fcmp contract olt float %1400, %1468
  %1471 = and i1 %1469, %1470
  %1472 = fmul contract float %1468, %1468
  %1473 = select i1 %1471, float %1468, float -0.000000e+00
  %1474 = fadd contract float %1457, %1473
  %1475 = select i1 %1471, float %1472, float -0.000000e+00
  %1476 = fadd contract float %1459, %1475
  %1477 = zext i1 %1471 to i32
  %1478 = add nuw nsw i32 %1461, %1477
  %1479 = add nuw nsw i32 %1408, 4
  %1480 = add i32 %1411, 4
  %1481 = icmp eq i32 %1480, %1405
  br i1 %1481, label %1482, label %1406, !llvm.loop !11

1482:                                             ; preds = %1406, %1398
  %1483 = phi float [ undef, %1398 ], [ %1474, %1406 ]
  %1484 = phi float [ undef, %1398 ], [ %1476, %1406 ]
  %1485 = phi i32 [ undef, %1398 ], [ %1478, %1406 ]
  %1486 = phi i32 [ 0, %1398 ], [ %1478, %1406 ]
  %1487 = phi i32 [ 0, %1398 ], [ %1479, %1406 ]
  %1488 = phi float [ 0.000000e+00, %1398 ], [ %1476, %1406 ]
  %1489 = phi float [ 0.000000e+00, %1398 ], [ %1474, %1406 ]
  %1490 = icmp eq i32 %1402, 0
  br i1 %1490, label %1516, label %1491

1491:                                             ; preds = %1482, %1491
  %1492 = phi i32 [ %1512, %1491 ], [ %1486, %1482 ]
  %1493 = phi i32 [ %1513, %1491 ], [ %1487, %1482 ]
  %1494 = phi float [ %1510, %1491 ], [ %1488, %1482 ]
  %1495 = phi float [ %1508, %1491 ], [ %1489, %1482 ]
  %1496 = phi i32 [ %1514, %1491 ], [ 0, %1482 ]
  %1497 = mul nsw i32 %1493, %1
  %1498 = add nsw i32 %1497, %12
  %1499 = sext i32 %1498 to i64
  %1500 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1499
  %1501 = load i16, i16 addrspace(1)* %1500, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1502 = uitofp i16 %1501 to float
  %1503 = fcmp contract ogt float %1399, %1502
  %1504 = fcmp contract olt float %1400, %1502
  %1505 = and i1 %1503, %1504
  %1506 = fmul contract float %1502, %1502
  %1507 = select i1 %1505, float %1502, float -0.000000e+00
  %1508 = fadd contract float %1495, %1507
  %1509 = select i1 %1505, float %1506, float -0.000000e+00
  %1510 = fadd contract float %1494, %1509
  %1511 = zext i1 %1505 to i32
  %1512 = add nuw nsw i32 %1492, %1511
  %1513 = add nuw nsw i32 %1493, 1
  %1514 = add i32 %1496, 1
  %1515 = icmp eq i32 %1514, %1402
  br i1 %1515, label %1516, label %1491, !llvm.loop !24

1516:                                             ; preds = %1482, %1491, %1397
  %1517 = phi float [ 0.000000e+00, %1397 ], [ %1483, %1482 ], [ %1508, %1491 ]
  %1518 = phi float [ 0.000000e+00, %1397 ], [ %1484, %1482 ], [ %1510, %1491 ]
  %1519 = phi i32 [ 0, %1397 ], [ %1485, %1482 ], [ %1512, %1491 ]
  %1520 = sitofp i32 %1519 to float
  %1521 = fdiv contract float %1517, %1520
  %1522 = fdiv contract float %1518, %1520
  %1523 = fmul contract float %1521, %1521
  %1524 = fsub contract float %1522, %1523
  %1525 = fcmp olt float %1524, 0x39F0000000000000
  %1526 = select i1 %1525, float 0x41F0000000000000, float 1.000000e+00
  %1527 = fmul float %1524, %1526
  %1528 = tail call float @llvm.sqrt.f32(float %1527)
  %1529 = bitcast float %1528 to i32
  %1530 = add nsw i32 %1529, -1
  %1531 = bitcast i32 %1530 to float
  %1532 = add nsw i32 %1529, 1
  %1533 = bitcast i32 %1532 to float
  %1534 = tail call i1 @llvm.amdgcn.class.f32(float %1527, i32 608)
  %1535 = select i1 %1525, float 0x3EF0000000000000, float 1.000000e+00
  %1536 = fneg float %1533
  %1537 = tail call float @llvm.fma.f32(float %1536, float %1528, float %1527)
  %1538 = fcmp ogt float %1537, 0.000000e+00
  %1539 = fneg float %1531
  %1540 = tail call float @llvm.fma.f32(float %1539, float %1528, float %1527)
  %1541 = fcmp ole float %1540, 0.000000e+00
  %1542 = select i1 %1541, float %1531, float %1528
  %1543 = select i1 %1538, float %1533, float %1542
  %1544 = fmul float %1535, %1543
  %1545 = select i1 %1534, float %1527, float %1544
  %1546 = fmul contract float %1545, 2.000000e+00
  %1547 = fsub contract float %1521, %1368
  %1548 = tail call float @llvm.fabs.f32(float %1547)
  %1549 = fcmp contract ogt float %1548, 0x3EB0C6F7A0000000
  br i1 %1549, label %1550, label %3227, !llvm.loop !15

1550:                                             ; preds = %1516
  br i1 %13, label %1669, label %1551

1551:                                             ; preds = %1550
  %1552 = fadd contract float %1521, %1546
  %1553 = fsub contract float %1521, %1546
  %1554 = add i32 %2, -1
  %1555 = and i32 %2, 3
  %1556 = icmp ult i32 %1554, 3
  br i1 %1556, label %1635, label %1557

1557:                                             ; preds = %1551
  %1558 = and i32 %2, -4
  br label %1559

1559:                                             ; preds = %1559, %1557
  %1560 = phi i32 [ 0, %1557 ], [ %1631, %1559 ]
  %1561 = phi i32 [ 0, %1557 ], [ %1632, %1559 ]
  %1562 = phi float [ 0.000000e+00, %1557 ], [ %1629, %1559 ]
  %1563 = phi float [ 0.000000e+00, %1557 ], [ %1627, %1559 ]
  %1564 = phi i32 [ 0, %1557 ], [ %1633, %1559 ]
  %1565 = mul nsw i32 %1561, %1
  %1566 = add nsw i32 %1565, %12
  %1567 = sext i32 %1566 to i64
  %1568 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1567
  %1569 = load i16, i16 addrspace(1)* %1568, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1570 = uitofp i16 %1569 to float
  %1571 = fcmp contract ogt float %1552, %1570
  %1572 = fcmp contract olt float %1553, %1570
  %1573 = and i1 %1571, %1572
  %1574 = fmul contract float %1570, %1570
  %1575 = select i1 %1573, float %1570, float -0.000000e+00
  %1576 = fadd contract float %1563, %1575
  %1577 = select i1 %1573, float %1574, float -0.000000e+00
  %1578 = fadd contract float %1562, %1577
  %1579 = zext i1 %1573 to i32
  %1580 = add nuw nsw i32 %1560, %1579
  %1581 = or i32 %1561, 1
  %1582 = mul nsw i32 %1581, %1
  %1583 = add nsw i32 %1582, %12
  %1584 = sext i32 %1583 to i64
  %1585 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1584
  %1586 = load i16, i16 addrspace(1)* %1585, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1587 = uitofp i16 %1586 to float
  %1588 = fcmp contract ogt float %1552, %1587
  %1589 = fcmp contract olt float %1553, %1587
  %1590 = and i1 %1588, %1589
  %1591 = fmul contract float %1587, %1587
  %1592 = select i1 %1590, float %1587, float -0.000000e+00
  %1593 = fadd contract float %1576, %1592
  %1594 = select i1 %1590, float %1591, float -0.000000e+00
  %1595 = fadd contract float %1578, %1594
  %1596 = zext i1 %1590 to i32
  %1597 = add nuw nsw i32 %1580, %1596
  %1598 = or i32 %1561, 2
  %1599 = mul nsw i32 %1598, %1
  %1600 = add nsw i32 %1599, %12
  %1601 = sext i32 %1600 to i64
  %1602 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1601
  %1603 = load i16, i16 addrspace(1)* %1602, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1604 = uitofp i16 %1603 to float
  %1605 = fcmp contract ogt float %1552, %1604
  %1606 = fcmp contract olt float %1553, %1604
  %1607 = and i1 %1605, %1606
  %1608 = fmul contract float %1604, %1604
  %1609 = select i1 %1607, float %1604, float -0.000000e+00
  %1610 = fadd contract float %1593, %1609
  %1611 = select i1 %1607, float %1608, float -0.000000e+00
  %1612 = fadd contract float %1595, %1611
  %1613 = zext i1 %1607 to i32
  %1614 = add nuw nsw i32 %1597, %1613
  %1615 = or i32 %1561, 3
  %1616 = mul nsw i32 %1615, %1
  %1617 = add nsw i32 %1616, %12
  %1618 = sext i32 %1617 to i64
  %1619 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1618
  %1620 = load i16, i16 addrspace(1)* %1619, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1621 = uitofp i16 %1620 to float
  %1622 = fcmp contract ogt float %1552, %1621
  %1623 = fcmp contract olt float %1553, %1621
  %1624 = and i1 %1622, %1623
  %1625 = fmul contract float %1621, %1621
  %1626 = select i1 %1624, float %1621, float -0.000000e+00
  %1627 = fadd contract float %1610, %1626
  %1628 = select i1 %1624, float %1625, float -0.000000e+00
  %1629 = fadd contract float %1612, %1628
  %1630 = zext i1 %1624 to i32
  %1631 = add nuw nsw i32 %1614, %1630
  %1632 = add nuw nsw i32 %1561, 4
  %1633 = add i32 %1564, 4
  %1634 = icmp eq i32 %1633, %1558
  br i1 %1634, label %1635, label %1559, !llvm.loop !11

1635:                                             ; preds = %1559, %1551
  %1636 = phi float [ undef, %1551 ], [ %1627, %1559 ]
  %1637 = phi float [ undef, %1551 ], [ %1629, %1559 ]
  %1638 = phi i32 [ undef, %1551 ], [ %1631, %1559 ]
  %1639 = phi i32 [ 0, %1551 ], [ %1631, %1559 ]
  %1640 = phi i32 [ 0, %1551 ], [ %1632, %1559 ]
  %1641 = phi float [ 0.000000e+00, %1551 ], [ %1629, %1559 ]
  %1642 = phi float [ 0.000000e+00, %1551 ], [ %1627, %1559 ]
  %1643 = icmp eq i32 %1555, 0
  br i1 %1643, label %1669, label %1644

1644:                                             ; preds = %1635, %1644
  %1645 = phi i32 [ %1665, %1644 ], [ %1639, %1635 ]
  %1646 = phi i32 [ %1666, %1644 ], [ %1640, %1635 ]
  %1647 = phi float [ %1663, %1644 ], [ %1641, %1635 ]
  %1648 = phi float [ %1661, %1644 ], [ %1642, %1635 ]
  %1649 = phi i32 [ %1667, %1644 ], [ 0, %1635 ]
  %1650 = mul nsw i32 %1646, %1
  %1651 = add nsw i32 %1650, %12
  %1652 = sext i32 %1651 to i64
  %1653 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1652
  %1654 = load i16, i16 addrspace(1)* %1653, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1655 = uitofp i16 %1654 to float
  %1656 = fcmp contract ogt float %1552, %1655
  %1657 = fcmp contract olt float %1553, %1655
  %1658 = and i1 %1656, %1657
  %1659 = fmul contract float %1655, %1655
  %1660 = select i1 %1658, float %1655, float -0.000000e+00
  %1661 = fadd contract float %1648, %1660
  %1662 = select i1 %1658, float %1659, float -0.000000e+00
  %1663 = fadd contract float %1647, %1662
  %1664 = zext i1 %1658 to i32
  %1665 = add nuw nsw i32 %1645, %1664
  %1666 = add nuw nsw i32 %1646, 1
  %1667 = add i32 %1649, 1
  %1668 = icmp eq i32 %1667, %1555
  br i1 %1668, label %1669, label %1644, !llvm.loop !25

1669:                                             ; preds = %1635, %1644, %1550
  %1670 = phi float [ 0.000000e+00, %1550 ], [ %1636, %1635 ], [ %1661, %1644 ]
  %1671 = phi float [ 0.000000e+00, %1550 ], [ %1637, %1635 ], [ %1663, %1644 ]
  %1672 = phi i32 [ 0, %1550 ], [ %1638, %1635 ], [ %1665, %1644 ]
  %1673 = sitofp i32 %1672 to float
  %1674 = fdiv contract float %1670, %1673
  %1675 = fdiv contract float %1671, %1673
  %1676 = fmul contract float %1674, %1674
  %1677 = fsub contract float %1675, %1676
  %1678 = fcmp olt float %1677, 0x39F0000000000000
  %1679 = select i1 %1678, float 0x41F0000000000000, float 1.000000e+00
  %1680 = fmul float %1677, %1679
  %1681 = tail call float @llvm.sqrt.f32(float %1680)
  %1682 = bitcast float %1681 to i32
  %1683 = add nsw i32 %1682, -1
  %1684 = bitcast i32 %1683 to float
  %1685 = add nsw i32 %1682, 1
  %1686 = bitcast i32 %1685 to float
  %1687 = tail call i1 @llvm.amdgcn.class.f32(float %1680, i32 608)
  %1688 = select i1 %1678, float 0x3EF0000000000000, float 1.000000e+00
  %1689 = fneg float %1686
  %1690 = tail call float @llvm.fma.f32(float %1689, float %1681, float %1680)
  %1691 = fcmp ogt float %1690, 0.000000e+00
  %1692 = fneg float %1684
  %1693 = tail call float @llvm.fma.f32(float %1692, float %1681, float %1680)
  %1694 = fcmp ole float %1693, 0.000000e+00
  %1695 = select i1 %1694, float %1684, float %1681
  %1696 = select i1 %1691, float %1686, float %1695
  %1697 = fmul float %1688, %1696
  %1698 = select i1 %1687, float %1680, float %1697
  %1699 = fmul contract float %1698, 2.000000e+00
  %1700 = fsub contract float %1674, %1521
  %1701 = tail call float @llvm.fabs.f32(float %1700)
  %1702 = fcmp contract ogt float %1701, 0x3EB0C6F7A0000000
  br i1 %1702, label %1703, label %3227, !llvm.loop !15

1703:                                             ; preds = %1669
  br i1 %13, label %1822, label %1704

1704:                                             ; preds = %1703
  %1705 = fadd contract float %1674, %1699
  %1706 = fsub contract float %1674, %1699
  %1707 = add i32 %2, -1
  %1708 = and i32 %2, 3
  %1709 = icmp ult i32 %1707, 3
  br i1 %1709, label %1788, label %1710

1710:                                             ; preds = %1704
  %1711 = and i32 %2, -4
  br label %1712

1712:                                             ; preds = %1712, %1710
  %1713 = phi i32 [ 0, %1710 ], [ %1784, %1712 ]
  %1714 = phi i32 [ 0, %1710 ], [ %1785, %1712 ]
  %1715 = phi float [ 0.000000e+00, %1710 ], [ %1782, %1712 ]
  %1716 = phi float [ 0.000000e+00, %1710 ], [ %1780, %1712 ]
  %1717 = phi i32 [ 0, %1710 ], [ %1786, %1712 ]
  %1718 = mul nsw i32 %1714, %1
  %1719 = add nsw i32 %1718, %12
  %1720 = sext i32 %1719 to i64
  %1721 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1720
  %1722 = load i16, i16 addrspace(1)* %1721, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1723 = uitofp i16 %1722 to float
  %1724 = fcmp contract ogt float %1705, %1723
  %1725 = fcmp contract olt float %1706, %1723
  %1726 = and i1 %1724, %1725
  %1727 = fmul contract float %1723, %1723
  %1728 = select i1 %1726, float %1723, float -0.000000e+00
  %1729 = fadd contract float %1716, %1728
  %1730 = select i1 %1726, float %1727, float -0.000000e+00
  %1731 = fadd contract float %1715, %1730
  %1732 = zext i1 %1726 to i32
  %1733 = add nuw nsw i32 %1713, %1732
  %1734 = or i32 %1714, 1
  %1735 = mul nsw i32 %1734, %1
  %1736 = add nsw i32 %1735, %12
  %1737 = sext i32 %1736 to i64
  %1738 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1737
  %1739 = load i16, i16 addrspace(1)* %1738, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1740 = uitofp i16 %1739 to float
  %1741 = fcmp contract ogt float %1705, %1740
  %1742 = fcmp contract olt float %1706, %1740
  %1743 = and i1 %1741, %1742
  %1744 = fmul contract float %1740, %1740
  %1745 = select i1 %1743, float %1740, float -0.000000e+00
  %1746 = fadd contract float %1729, %1745
  %1747 = select i1 %1743, float %1744, float -0.000000e+00
  %1748 = fadd contract float %1731, %1747
  %1749 = zext i1 %1743 to i32
  %1750 = add nuw nsw i32 %1733, %1749
  %1751 = or i32 %1714, 2
  %1752 = mul nsw i32 %1751, %1
  %1753 = add nsw i32 %1752, %12
  %1754 = sext i32 %1753 to i64
  %1755 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1754
  %1756 = load i16, i16 addrspace(1)* %1755, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1757 = uitofp i16 %1756 to float
  %1758 = fcmp contract ogt float %1705, %1757
  %1759 = fcmp contract olt float %1706, %1757
  %1760 = and i1 %1758, %1759
  %1761 = fmul contract float %1757, %1757
  %1762 = select i1 %1760, float %1757, float -0.000000e+00
  %1763 = fadd contract float %1746, %1762
  %1764 = select i1 %1760, float %1761, float -0.000000e+00
  %1765 = fadd contract float %1748, %1764
  %1766 = zext i1 %1760 to i32
  %1767 = add nuw nsw i32 %1750, %1766
  %1768 = or i32 %1714, 3
  %1769 = mul nsw i32 %1768, %1
  %1770 = add nsw i32 %1769, %12
  %1771 = sext i32 %1770 to i64
  %1772 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1771
  %1773 = load i16, i16 addrspace(1)* %1772, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1774 = uitofp i16 %1773 to float
  %1775 = fcmp contract ogt float %1705, %1774
  %1776 = fcmp contract olt float %1706, %1774
  %1777 = and i1 %1775, %1776
  %1778 = fmul contract float %1774, %1774
  %1779 = select i1 %1777, float %1774, float -0.000000e+00
  %1780 = fadd contract float %1763, %1779
  %1781 = select i1 %1777, float %1778, float -0.000000e+00
  %1782 = fadd contract float %1765, %1781
  %1783 = zext i1 %1777 to i32
  %1784 = add nuw nsw i32 %1767, %1783
  %1785 = add nuw nsw i32 %1714, 4
  %1786 = add i32 %1717, 4
  %1787 = icmp eq i32 %1786, %1711
  br i1 %1787, label %1788, label %1712, !llvm.loop !11

1788:                                             ; preds = %1712, %1704
  %1789 = phi float [ undef, %1704 ], [ %1780, %1712 ]
  %1790 = phi float [ undef, %1704 ], [ %1782, %1712 ]
  %1791 = phi i32 [ undef, %1704 ], [ %1784, %1712 ]
  %1792 = phi i32 [ 0, %1704 ], [ %1784, %1712 ]
  %1793 = phi i32 [ 0, %1704 ], [ %1785, %1712 ]
  %1794 = phi float [ 0.000000e+00, %1704 ], [ %1782, %1712 ]
  %1795 = phi float [ 0.000000e+00, %1704 ], [ %1780, %1712 ]
  %1796 = icmp eq i32 %1708, 0
  br i1 %1796, label %1822, label %1797

1797:                                             ; preds = %1788, %1797
  %1798 = phi i32 [ %1818, %1797 ], [ %1792, %1788 ]
  %1799 = phi i32 [ %1819, %1797 ], [ %1793, %1788 ]
  %1800 = phi float [ %1816, %1797 ], [ %1794, %1788 ]
  %1801 = phi float [ %1814, %1797 ], [ %1795, %1788 ]
  %1802 = phi i32 [ %1820, %1797 ], [ 0, %1788 ]
  %1803 = mul nsw i32 %1799, %1
  %1804 = add nsw i32 %1803, %12
  %1805 = sext i32 %1804 to i64
  %1806 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1805
  %1807 = load i16, i16 addrspace(1)* %1806, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1808 = uitofp i16 %1807 to float
  %1809 = fcmp contract ogt float %1705, %1808
  %1810 = fcmp contract olt float %1706, %1808
  %1811 = and i1 %1809, %1810
  %1812 = fmul contract float %1808, %1808
  %1813 = select i1 %1811, float %1808, float -0.000000e+00
  %1814 = fadd contract float %1801, %1813
  %1815 = select i1 %1811, float %1812, float -0.000000e+00
  %1816 = fadd contract float %1800, %1815
  %1817 = zext i1 %1811 to i32
  %1818 = add nuw nsw i32 %1798, %1817
  %1819 = add nuw nsw i32 %1799, 1
  %1820 = add i32 %1802, 1
  %1821 = icmp eq i32 %1820, %1708
  br i1 %1821, label %1822, label %1797, !llvm.loop !26

1822:                                             ; preds = %1788, %1797, %1703
  %1823 = phi float [ 0.000000e+00, %1703 ], [ %1789, %1788 ], [ %1814, %1797 ]
  %1824 = phi float [ 0.000000e+00, %1703 ], [ %1790, %1788 ], [ %1816, %1797 ]
  %1825 = phi i32 [ 0, %1703 ], [ %1791, %1788 ], [ %1818, %1797 ]
  %1826 = sitofp i32 %1825 to float
  %1827 = fdiv contract float %1823, %1826
  %1828 = fdiv contract float %1824, %1826
  %1829 = fmul contract float %1827, %1827
  %1830 = fsub contract float %1828, %1829
  %1831 = fcmp olt float %1830, 0x39F0000000000000
  %1832 = select i1 %1831, float 0x41F0000000000000, float 1.000000e+00
  %1833 = fmul float %1830, %1832
  %1834 = tail call float @llvm.sqrt.f32(float %1833)
  %1835 = bitcast float %1834 to i32
  %1836 = add nsw i32 %1835, -1
  %1837 = bitcast i32 %1836 to float
  %1838 = add nsw i32 %1835, 1
  %1839 = bitcast i32 %1838 to float
  %1840 = tail call i1 @llvm.amdgcn.class.f32(float %1833, i32 608)
  %1841 = select i1 %1831, float 0x3EF0000000000000, float 1.000000e+00
  %1842 = fneg float %1839
  %1843 = tail call float @llvm.fma.f32(float %1842, float %1834, float %1833)
  %1844 = fcmp ogt float %1843, 0.000000e+00
  %1845 = fneg float %1837
  %1846 = tail call float @llvm.fma.f32(float %1845, float %1834, float %1833)
  %1847 = fcmp ole float %1846, 0.000000e+00
  %1848 = select i1 %1847, float %1837, float %1834
  %1849 = select i1 %1844, float %1839, float %1848
  %1850 = fmul float %1841, %1849
  %1851 = select i1 %1840, float %1833, float %1850
  %1852 = fmul contract float %1851, 2.000000e+00
  %1853 = fsub contract float %1827, %1674
  %1854 = tail call float @llvm.fabs.f32(float %1853)
  %1855 = fcmp contract ogt float %1854, 0x3EB0C6F7A0000000
  br i1 %1855, label %1856, label %3227, !llvm.loop !15

1856:                                             ; preds = %1822
  br i1 %13, label %1975, label %1857

1857:                                             ; preds = %1856
  %1858 = fadd contract float %1827, %1852
  %1859 = fsub contract float %1827, %1852
  %1860 = add i32 %2, -1
  %1861 = and i32 %2, 3
  %1862 = icmp ult i32 %1860, 3
  br i1 %1862, label %1941, label %1863

1863:                                             ; preds = %1857
  %1864 = and i32 %2, -4
  br label %1865

1865:                                             ; preds = %1865, %1863
  %1866 = phi i32 [ 0, %1863 ], [ %1937, %1865 ]
  %1867 = phi i32 [ 0, %1863 ], [ %1938, %1865 ]
  %1868 = phi float [ 0.000000e+00, %1863 ], [ %1935, %1865 ]
  %1869 = phi float [ 0.000000e+00, %1863 ], [ %1933, %1865 ]
  %1870 = phi i32 [ 0, %1863 ], [ %1939, %1865 ]
  %1871 = mul nsw i32 %1867, %1
  %1872 = add nsw i32 %1871, %12
  %1873 = sext i32 %1872 to i64
  %1874 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1873
  %1875 = load i16, i16 addrspace(1)* %1874, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1876 = uitofp i16 %1875 to float
  %1877 = fcmp contract ogt float %1858, %1876
  %1878 = fcmp contract olt float %1859, %1876
  %1879 = and i1 %1877, %1878
  %1880 = fmul contract float %1876, %1876
  %1881 = select i1 %1879, float %1876, float -0.000000e+00
  %1882 = fadd contract float %1869, %1881
  %1883 = select i1 %1879, float %1880, float -0.000000e+00
  %1884 = fadd contract float %1868, %1883
  %1885 = zext i1 %1879 to i32
  %1886 = add nuw nsw i32 %1866, %1885
  %1887 = or i32 %1867, 1
  %1888 = mul nsw i32 %1887, %1
  %1889 = add nsw i32 %1888, %12
  %1890 = sext i32 %1889 to i64
  %1891 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1890
  %1892 = load i16, i16 addrspace(1)* %1891, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1893 = uitofp i16 %1892 to float
  %1894 = fcmp contract ogt float %1858, %1893
  %1895 = fcmp contract olt float %1859, %1893
  %1896 = and i1 %1894, %1895
  %1897 = fmul contract float %1893, %1893
  %1898 = select i1 %1896, float %1893, float -0.000000e+00
  %1899 = fadd contract float %1882, %1898
  %1900 = select i1 %1896, float %1897, float -0.000000e+00
  %1901 = fadd contract float %1884, %1900
  %1902 = zext i1 %1896 to i32
  %1903 = add nuw nsw i32 %1886, %1902
  %1904 = or i32 %1867, 2
  %1905 = mul nsw i32 %1904, %1
  %1906 = add nsw i32 %1905, %12
  %1907 = sext i32 %1906 to i64
  %1908 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1907
  %1909 = load i16, i16 addrspace(1)* %1908, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1910 = uitofp i16 %1909 to float
  %1911 = fcmp contract ogt float %1858, %1910
  %1912 = fcmp contract olt float %1859, %1910
  %1913 = and i1 %1911, %1912
  %1914 = fmul contract float %1910, %1910
  %1915 = select i1 %1913, float %1910, float -0.000000e+00
  %1916 = fadd contract float %1899, %1915
  %1917 = select i1 %1913, float %1914, float -0.000000e+00
  %1918 = fadd contract float %1901, %1917
  %1919 = zext i1 %1913 to i32
  %1920 = add nuw nsw i32 %1903, %1919
  %1921 = or i32 %1867, 3
  %1922 = mul nsw i32 %1921, %1
  %1923 = add nsw i32 %1922, %12
  %1924 = sext i32 %1923 to i64
  %1925 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1924
  %1926 = load i16, i16 addrspace(1)* %1925, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1927 = uitofp i16 %1926 to float
  %1928 = fcmp contract ogt float %1858, %1927
  %1929 = fcmp contract olt float %1859, %1927
  %1930 = and i1 %1928, %1929
  %1931 = fmul contract float %1927, %1927
  %1932 = select i1 %1930, float %1927, float -0.000000e+00
  %1933 = fadd contract float %1916, %1932
  %1934 = select i1 %1930, float %1931, float -0.000000e+00
  %1935 = fadd contract float %1918, %1934
  %1936 = zext i1 %1930 to i32
  %1937 = add nuw nsw i32 %1920, %1936
  %1938 = add nuw nsw i32 %1867, 4
  %1939 = add i32 %1870, 4
  %1940 = icmp eq i32 %1939, %1864
  br i1 %1940, label %1941, label %1865, !llvm.loop !11

1941:                                             ; preds = %1865, %1857
  %1942 = phi float [ undef, %1857 ], [ %1933, %1865 ]
  %1943 = phi float [ undef, %1857 ], [ %1935, %1865 ]
  %1944 = phi i32 [ undef, %1857 ], [ %1937, %1865 ]
  %1945 = phi i32 [ 0, %1857 ], [ %1937, %1865 ]
  %1946 = phi i32 [ 0, %1857 ], [ %1938, %1865 ]
  %1947 = phi float [ 0.000000e+00, %1857 ], [ %1935, %1865 ]
  %1948 = phi float [ 0.000000e+00, %1857 ], [ %1933, %1865 ]
  %1949 = icmp eq i32 %1861, 0
  br i1 %1949, label %1975, label %1950

1950:                                             ; preds = %1941, %1950
  %1951 = phi i32 [ %1971, %1950 ], [ %1945, %1941 ]
  %1952 = phi i32 [ %1972, %1950 ], [ %1946, %1941 ]
  %1953 = phi float [ %1969, %1950 ], [ %1947, %1941 ]
  %1954 = phi float [ %1967, %1950 ], [ %1948, %1941 ]
  %1955 = phi i32 [ %1973, %1950 ], [ 0, %1941 ]
  %1956 = mul nsw i32 %1952, %1
  %1957 = add nsw i32 %1956, %12
  %1958 = sext i32 %1957 to i64
  %1959 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %1958
  %1960 = load i16, i16 addrspace(1)* %1959, align 2, !tbaa !7, !amdgpu.noclobber !5
  %1961 = uitofp i16 %1960 to float
  %1962 = fcmp contract ogt float %1858, %1961
  %1963 = fcmp contract olt float %1859, %1961
  %1964 = and i1 %1962, %1963
  %1965 = fmul contract float %1961, %1961
  %1966 = select i1 %1964, float %1961, float -0.000000e+00
  %1967 = fadd contract float %1954, %1966
  %1968 = select i1 %1964, float %1965, float -0.000000e+00
  %1969 = fadd contract float %1953, %1968
  %1970 = zext i1 %1964 to i32
  %1971 = add nuw nsw i32 %1951, %1970
  %1972 = add nuw nsw i32 %1952, 1
  %1973 = add i32 %1955, 1
  %1974 = icmp eq i32 %1973, %1861
  br i1 %1974, label %1975, label %1950, !llvm.loop !27

1975:                                             ; preds = %1941, %1950, %1856
  %1976 = phi float [ 0.000000e+00, %1856 ], [ %1942, %1941 ], [ %1967, %1950 ]
  %1977 = phi float [ 0.000000e+00, %1856 ], [ %1943, %1941 ], [ %1969, %1950 ]
  %1978 = phi i32 [ 0, %1856 ], [ %1944, %1941 ], [ %1971, %1950 ]
  %1979 = sitofp i32 %1978 to float
  %1980 = fdiv contract float %1976, %1979
  %1981 = fdiv contract float %1977, %1979
  %1982 = fmul contract float %1980, %1980
  %1983 = fsub contract float %1981, %1982
  %1984 = fcmp olt float %1983, 0x39F0000000000000
  %1985 = select i1 %1984, float 0x41F0000000000000, float 1.000000e+00
  %1986 = fmul float %1983, %1985
  %1987 = tail call float @llvm.sqrt.f32(float %1986)
  %1988 = bitcast float %1987 to i32
  %1989 = add nsw i32 %1988, -1
  %1990 = bitcast i32 %1989 to float
  %1991 = add nsw i32 %1988, 1
  %1992 = bitcast i32 %1991 to float
  %1993 = tail call i1 @llvm.amdgcn.class.f32(float %1986, i32 608)
  %1994 = select i1 %1984, float 0x3EF0000000000000, float 1.000000e+00
  %1995 = fneg float %1992
  %1996 = tail call float @llvm.fma.f32(float %1995, float %1987, float %1986)
  %1997 = fcmp ogt float %1996, 0.000000e+00
  %1998 = fneg float %1990
  %1999 = tail call float @llvm.fma.f32(float %1998, float %1987, float %1986)
  %2000 = fcmp ole float %1999, 0.000000e+00
  %2001 = select i1 %2000, float %1990, float %1987
  %2002 = select i1 %1997, float %1992, float %2001
  %2003 = fmul float %1994, %2002
  %2004 = select i1 %1993, float %1986, float %2003
  %2005 = fmul contract float %2004, 2.000000e+00
  %2006 = fsub contract float %1980, %1827
  %2007 = tail call float @llvm.fabs.f32(float %2006)
  %2008 = fcmp contract ogt float %2007, 0x3EB0C6F7A0000000
  br i1 %2008, label %2009, label %3227, !llvm.loop !15

2009:                                             ; preds = %1975
  br i1 %13, label %2128, label %2010

2010:                                             ; preds = %2009
  %2011 = fadd contract float %1980, %2005
  %2012 = fsub contract float %1980, %2005
  %2013 = add i32 %2, -1
  %2014 = and i32 %2, 3
  %2015 = icmp ult i32 %2013, 3
  br i1 %2015, label %2094, label %2016

2016:                                             ; preds = %2010
  %2017 = and i32 %2, -4
  br label %2018

2018:                                             ; preds = %2018, %2016
  %2019 = phi i32 [ 0, %2016 ], [ %2090, %2018 ]
  %2020 = phi i32 [ 0, %2016 ], [ %2091, %2018 ]
  %2021 = phi float [ 0.000000e+00, %2016 ], [ %2088, %2018 ]
  %2022 = phi float [ 0.000000e+00, %2016 ], [ %2086, %2018 ]
  %2023 = phi i32 [ 0, %2016 ], [ %2092, %2018 ]
  %2024 = mul nsw i32 %2020, %1
  %2025 = add nsw i32 %2024, %12
  %2026 = sext i32 %2025 to i64
  %2027 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2026
  %2028 = load i16, i16 addrspace(1)* %2027, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2029 = uitofp i16 %2028 to float
  %2030 = fcmp contract ogt float %2011, %2029
  %2031 = fcmp contract olt float %2012, %2029
  %2032 = and i1 %2030, %2031
  %2033 = fmul contract float %2029, %2029
  %2034 = select i1 %2032, float %2029, float -0.000000e+00
  %2035 = fadd contract float %2022, %2034
  %2036 = select i1 %2032, float %2033, float -0.000000e+00
  %2037 = fadd contract float %2021, %2036
  %2038 = zext i1 %2032 to i32
  %2039 = add nuw nsw i32 %2019, %2038
  %2040 = or i32 %2020, 1
  %2041 = mul nsw i32 %2040, %1
  %2042 = add nsw i32 %2041, %12
  %2043 = sext i32 %2042 to i64
  %2044 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2043
  %2045 = load i16, i16 addrspace(1)* %2044, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2046 = uitofp i16 %2045 to float
  %2047 = fcmp contract ogt float %2011, %2046
  %2048 = fcmp contract olt float %2012, %2046
  %2049 = and i1 %2047, %2048
  %2050 = fmul contract float %2046, %2046
  %2051 = select i1 %2049, float %2046, float -0.000000e+00
  %2052 = fadd contract float %2035, %2051
  %2053 = select i1 %2049, float %2050, float -0.000000e+00
  %2054 = fadd contract float %2037, %2053
  %2055 = zext i1 %2049 to i32
  %2056 = add nuw nsw i32 %2039, %2055
  %2057 = or i32 %2020, 2
  %2058 = mul nsw i32 %2057, %1
  %2059 = add nsw i32 %2058, %12
  %2060 = sext i32 %2059 to i64
  %2061 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2060
  %2062 = load i16, i16 addrspace(1)* %2061, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2063 = uitofp i16 %2062 to float
  %2064 = fcmp contract ogt float %2011, %2063
  %2065 = fcmp contract olt float %2012, %2063
  %2066 = and i1 %2064, %2065
  %2067 = fmul contract float %2063, %2063
  %2068 = select i1 %2066, float %2063, float -0.000000e+00
  %2069 = fadd contract float %2052, %2068
  %2070 = select i1 %2066, float %2067, float -0.000000e+00
  %2071 = fadd contract float %2054, %2070
  %2072 = zext i1 %2066 to i32
  %2073 = add nuw nsw i32 %2056, %2072
  %2074 = or i32 %2020, 3
  %2075 = mul nsw i32 %2074, %1
  %2076 = add nsw i32 %2075, %12
  %2077 = sext i32 %2076 to i64
  %2078 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2077
  %2079 = load i16, i16 addrspace(1)* %2078, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2080 = uitofp i16 %2079 to float
  %2081 = fcmp contract ogt float %2011, %2080
  %2082 = fcmp contract olt float %2012, %2080
  %2083 = and i1 %2081, %2082
  %2084 = fmul contract float %2080, %2080
  %2085 = select i1 %2083, float %2080, float -0.000000e+00
  %2086 = fadd contract float %2069, %2085
  %2087 = select i1 %2083, float %2084, float -0.000000e+00
  %2088 = fadd contract float %2071, %2087
  %2089 = zext i1 %2083 to i32
  %2090 = add nuw nsw i32 %2073, %2089
  %2091 = add nuw nsw i32 %2020, 4
  %2092 = add i32 %2023, 4
  %2093 = icmp eq i32 %2092, %2017
  br i1 %2093, label %2094, label %2018, !llvm.loop !11

2094:                                             ; preds = %2018, %2010
  %2095 = phi float [ undef, %2010 ], [ %2086, %2018 ]
  %2096 = phi float [ undef, %2010 ], [ %2088, %2018 ]
  %2097 = phi i32 [ undef, %2010 ], [ %2090, %2018 ]
  %2098 = phi i32 [ 0, %2010 ], [ %2090, %2018 ]
  %2099 = phi i32 [ 0, %2010 ], [ %2091, %2018 ]
  %2100 = phi float [ 0.000000e+00, %2010 ], [ %2088, %2018 ]
  %2101 = phi float [ 0.000000e+00, %2010 ], [ %2086, %2018 ]
  %2102 = icmp eq i32 %2014, 0
  br i1 %2102, label %2128, label %2103

2103:                                             ; preds = %2094, %2103
  %2104 = phi i32 [ %2124, %2103 ], [ %2098, %2094 ]
  %2105 = phi i32 [ %2125, %2103 ], [ %2099, %2094 ]
  %2106 = phi float [ %2122, %2103 ], [ %2100, %2094 ]
  %2107 = phi float [ %2120, %2103 ], [ %2101, %2094 ]
  %2108 = phi i32 [ %2126, %2103 ], [ 0, %2094 ]
  %2109 = mul nsw i32 %2105, %1
  %2110 = add nsw i32 %2109, %12
  %2111 = sext i32 %2110 to i64
  %2112 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2111
  %2113 = load i16, i16 addrspace(1)* %2112, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2114 = uitofp i16 %2113 to float
  %2115 = fcmp contract ogt float %2011, %2114
  %2116 = fcmp contract olt float %2012, %2114
  %2117 = and i1 %2115, %2116
  %2118 = fmul contract float %2114, %2114
  %2119 = select i1 %2117, float %2114, float -0.000000e+00
  %2120 = fadd contract float %2107, %2119
  %2121 = select i1 %2117, float %2118, float -0.000000e+00
  %2122 = fadd contract float %2106, %2121
  %2123 = zext i1 %2117 to i32
  %2124 = add nuw nsw i32 %2104, %2123
  %2125 = add nuw nsw i32 %2105, 1
  %2126 = add i32 %2108, 1
  %2127 = icmp eq i32 %2126, %2014
  br i1 %2127, label %2128, label %2103, !llvm.loop !28

2128:                                             ; preds = %2094, %2103, %2009
  %2129 = phi float [ 0.000000e+00, %2009 ], [ %2095, %2094 ], [ %2120, %2103 ]
  %2130 = phi float [ 0.000000e+00, %2009 ], [ %2096, %2094 ], [ %2122, %2103 ]
  %2131 = phi i32 [ 0, %2009 ], [ %2097, %2094 ], [ %2124, %2103 ]
  %2132 = sitofp i32 %2131 to float
  %2133 = fdiv contract float %2129, %2132
  %2134 = fdiv contract float %2130, %2132
  %2135 = fmul contract float %2133, %2133
  %2136 = fsub contract float %2134, %2135
  %2137 = fcmp olt float %2136, 0x39F0000000000000
  %2138 = select i1 %2137, float 0x41F0000000000000, float 1.000000e+00
  %2139 = fmul float %2136, %2138
  %2140 = tail call float @llvm.sqrt.f32(float %2139)
  %2141 = bitcast float %2140 to i32
  %2142 = add nsw i32 %2141, -1
  %2143 = bitcast i32 %2142 to float
  %2144 = add nsw i32 %2141, 1
  %2145 = bitcast i32 %2144 to float
  %2146 = tail call i1 @llvm.amdgcn.class.f32(float %2139, i32 608)
  %2147 = select i1 %2137, float 0x3EF0000000000000, float 1.000000e+00
  %2148 = fneg float %2145
  %2149 = tail call float @llvm.fma.f32(float %2148, float %2140, float %2139)
  %2150 = fcmp ogt float %2149, 0.000000e+00
  %2151 = fneg float %2143
  %2152 = tail call float @llvm.fma.f32(float %2151, float %2140, float %2139)
  %2153 = fcmp ole float %2152, 0.000000e+00
  %2154 = select i1 %2153, float %2143, float %2140
  %2155 = select i1 %2150, float %2145, float %2154
  %2156 = fmul float %2147, %2155
  %2157 = select i1 %2146, float %2139, float %2156
  %2158 = fmul contract float %2157, 2.000000e+00
  %2159 = fsub contract float %2133, %1980
  %2160 = tail call float @llvm.fabs.f32(float %2159)
  %2161 = fcmp contract ogt float %2160, 0x3EB0C6F7A0000000
  br i1 %2161, label %2162, label %3227, !llvm.loop !15

2162:                                             ; preds = %2128
  br i1 %13, label %2281, label %2163

2163:                                             ; preds = %2162
  %2164 = fadd contract float %2133, %2158
  %2165 = fsub contract float %2133, %2158
  %2166 = add i32 %2, -1
  %2167 = and i32 %2, 3
  %2168 = icmp ult i32 %2166, 3
  br i1 %2168, label %2247, label %2169

2169:                                             ; preds = %2163
  %2170 = and i32 %2, -4
  br label %2171

2171:                                             ; preds = %2171, %2169
  %2172 = phi i32 [ 0, %2169 ], [ %2243, %2171 ]
  %2173 = phi i32 [ 0, %2169 ], [ %2244, %2171 ]
  %2174 = phi float [ 0.000000e+00, %2169 ], [ %2241, %2171 ]
  %2175 = phi float [ 0.000000e+00, %2169 ], [ %2239, %2171 ]
  %2176 = phi i32 [ 0, %2169 ], [ %2245, %2171 ]
  %2177 = mul nsw i32 %2173, %1
  %2178 = add nsw i32 %2177, %12
  %2179 = sext i32 %2178 to i64
  %2180 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2179
  %2181 = load i16, i16 addrspace(1)* %2180, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2182 = uitofp i16 %2181 to float
  %2183 = fcmp contract ogt float %2164, %2182
  %2184 = fcmp contract olt float %2165, %2182
  %2185 = and i1 %2183, %2184
  %2186 = fmul contract float %2182, %2182
  %2187 = select i1 %2185, float %2182, float -0.000000e+00
  %2188 = fadd contract float %2175, %2187
  %2189 = select i1 %2185, float %2186, float -0.000000e+00
  %2190 = fadd contract float %2174, %2189
  %2191 = zext i1 %2185 to i32
  %2192 = add nuw nsw i32 %2172, %2191
  %2193 = or i32 %2173, 1
  %2194 = mul nsw i32 %2193, %1
  %2195 = add nsw i32 %2194, %12
  %2196 = sext i32 %2195 to i64
  %2197 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2196
  %2198 = load i16, i16 addrspace(1)* %2197, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2199 = uitofp i16 %2198 to float
  %2200 = fcmp contract ogt float %2164, %2199
  %2201 = fcmp contract olt float %2165, %2199
  %2202 = and i1 %2200, %2201
  %2203 = fmul contract float %2199, %2199
  %2204 = select i1 %2202, float %2199, float -0.000000e+00
  %2205 = fadd contract float %2188, %2204
  %2206 = select i1 %2202, float %2203, float -0.000000e+00
  %2207 = fadd contract float %2190, %2206
  %2208 = zext i1 %2202 to i32
  %2209 = add nuw nsw i32 %2192, %2208
  %2210 = or i32 %2173, 2
  %2211 = mul nsw i32 %2210, %1
  %2212 = add nsw i32 %2211, %12
  %2213 = sext i32 %2212 to i64
  %2214 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2213
  %2215 = load i16, i16 addrspace(1)* %2214, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2216 = uitofp i16 %2215 to float
  %2217 = fcmp contract ogt float %2164, %2216
  %2218 = fcmp contract olt float %2165, %2216
  %2219 = and i1 %2217, %2218
  %2220 = fmul contract float %2216, %2216
  %2221 = select i1 %2219, float %2216, float -0.000000e+00
  %2222 = fadd contract float %2205, %2221
  %2223 = select i1 %2219, float %2220, float -0.000000e+00
  %2224 = fadd contract float %2207, %2223
  %2225 = zext i1 %2219 to i32
  %2226 = add nuw nsw i32 %2209, %2225
  %2227 = or i32 %2173, 3
  %2228 = mul nsw i32 %2227, %1
  %2229 = add nsw i32 %2228, %12
  %2230 = sext i32 %2229 to i64
  %2231 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2230
  %2232 = load i16, i16 addrspace(1)* %2231, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2233 = uitofp i16 %2232 to float
  %2234 = fcmp contract ogt float %2164, %2233
  %2235 = fcmp contract olt float %2165, %2233
  %2236 = and i1 %2234, %2235
  %2237 = fmul contract float %2233, %2233
  %2238 = select i1 %2236, float %2233, float -0.000000e+00
  %2239 = fadd contract float %2222, %2238
  %2240 = select i1 %2236, float %2237, float -0.000000e+00
  %2241 = fadd contract float %2224, %2240
  %2242 = zext i1 %2236 to i32
  %2243 = add nuw nsw i32 %2226, %2242
  %2244 = add nuw nsw i32 %2173, 4
  %2245 = add i32 %2176, 4
  %2246 = icmp eq i32 %2245, %2170
  br i1 %2246, label %2247, label %2171, !llvm.loop !11

2247:                                             ; preds = %2171, %2163
  %2248 = phi float [ undef, %2163 ], [ %2239, %2171 ]
  %2249 = phi float [ undef, %2163 ], [ %2241, %2171 ]
  %2250 = phi i32 [ undef, %2163 ], [ %2243, %2171 ]
  %2251 = phi i32 [ 0, %2163 ], [ %2243, %2171 ]
  %2252 = phi i32 [ 0, %2163 ], [ %2244, %2171 ]
  %2253 = phi float [ 0.000000e+00, %2163 ], [ %2241, %2171 ]
  %2254 = phi float [ 0.000000e+00, %2163 ], [ %2239, %2171 ]
  %2255 = icmp eq i32 %2167, 0
  br i1 %2255, label %2281, label %2256

2256:                                             ; preds = %2247, %2256
  %2257 = phi i32 [ %2277, %2256 ], [ %2251, %2247 ]
  %2258 = phi i32 [ %2278, %2256 ], [ %2252, %2247 ]
  %2259 = phi float [ %2275, %2256 ], [ %2253, %2247 ]
  %2260 = phi float [ %2273, %2256 ], [ %2254, %2247 ]
  %2261 = phi i32 [ %2279, %2256 ], [ 0, %2247 ]
  %2262 = mul nsw i32 %2258, %1
  %2263 = add nsw i32 %2262, %12
  %2264 = sext i32 %2263 to i64
  %2265 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2264
  %2266 = load i16, i16 addrspace(1)* %2265, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2267 = uitofp i16 %2266 to float
  %2268 = fcmp contract ogt float %2164, %2267
  %2269 = fcmp contract olt float %2165, %2267
  %2270 = and i1 %2268, %2269
  %2271 = fmul contract float %2267, %2267
  %2272 = select i1 %2270, float %2267, float -0.000000e+00
  %2273 = fadd contract float %2260, %2272
  %2274 = select i1 %2270, float %2271, float -0.000000e+00
  %2275 = fadd contract float %2259, %2274
  %2276 = zext i1 %2270 to i32
  %2277 = add nuw nsw i32 %2257, %2276
  %2278 = add nuw nsw i32 %2258, 1
  %2279 = add i32 %2261, 1
  %2280 = icmp eq i32 %2279, %2167
  br i1 %2280, label %2281, label %2256, !llvm.loop !29

2281:                                             ; preds = %2247, %2256, %2162
  %2282 = phi float [ 0.000000e+00, %2162 ], [ %2248, %2247 ], [ %2273, %2256 ]
  %2283 = phi float [ 0.000000e+00, %2162 ], [ %2249, %2247 ], [ %2275, %2256 ]
  %2284 = phi i32 [ 0, %2162 ], [ %2250, %2247 ], [ %2277, %2256 ]
  %2285 = sitofp i32 %2284 to float
  %2286 = fdiv contract float %2282, %2285
  %2287 = fdiv contract float %2283, %2285
  %2288 = fmul contract float %2286, %2286
  %2289 = fsub contract float %2287, %2288
  %2290 = fcmp olt float %2289, 0x39F0000000000000
  %2291 = select i1 %2290, float 0x41F0000000000000, float 1.000000e+00
  %2292 = fmul float %2289, %2291
  %2293 = tail call float @llvm.sqrt.f32(float %2292)
  %2294 = bitcast float %2293 to i32
  %2295 = add nsw i32 %2294, -1
  %2296 = bitcast i32 %2295 to float
  %2297 = add nsw i32 %2294, 1
  %2298 = bitcast i32 %2297 to float
  %2299 = tail call i1 @llvm.amdgcn.class.f32(float %2292, i32 608)
  %2300 = select i1 %2290, float 0x3EF0000000000000, float 1.000000e+00
  %2301 = fneg float %2298
  %2302 = tail call float @llvm.fma.f32(float %2301, float %2293, float %2292)
  %2303 = fcmp ogt float %2302, 0.000000e+00
  %2304 = fneg float %2296
  %2305 = tail call float @llvm.fma.f32(float %2304, float %2293, float %2292)
  %2306 = fcmp ole float %2305, 0.000000e+00
  %2307 = select i1 %2306, float %2296, float %2293
  %2308 = select i1 %2303, float %2298, float %2307
  %2309 = fmul float %2300, %2308
  %2310 = select i1 %2299, float %2292, float %2309
  %2311 = fmul contract float %2310, 2.000000e+00
  %2312 = fsub contract float %2286, %2133
  %2313 = tail call float @llvm.fabs.f32(float %2312)
  %2314 = fcmp contract ogt float %2313, 0x3EB0C6F7A0000000
  br i1 %2314, label %2315, label %3227, !llvm.loop !15

2315:                                             ; preds = %2281
  br i1 %13, label %2434, label %2316

2316:                                             ; preds = %2315
  %2317 = fadd contract float %2286, %2311
  %2318 = fsub contract float %2286, %2311
  %2319 = add i32 %2, -1
  %2320 = and i32 %2, 3
  %2321 = icmp ult i32 %2319, 3
  br i1 %2321, label %2400, label %2322

2322:                                             ; preds = %2316
  %2323 = and i32 %2, -4
  br label %2324

2324:                                             ; preds = %2324, %2322
  %2325 = phi i32 [ 0, %2322 ], [ %2396, %2324 ]
  %2326 = phi i32 [ 0, %2322 ], [ %2397, %2324 ]
  %2327 = phi float [ 0.000000e+00, %2322 ], [ %2394, %2324 ]
  %2328 = phi float [ 0.000000e+00, %2322 ], [ %2392, %2324 ]
  %2329 = phi i32 [ 0, %2322 ], [ %2398, %2324 ]
  %2330 = mul nsw i32 %2326, %1
  %2331 = add nsw i32 %2330, %12
  %2332 = sext i32 %2331 to i64
  %2333 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2332
  %2334 = load i16, i16 addrspace(1)* %2333, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2335 = uitofp i16 %2334 to float
  %2336 = fcmp contract ogt float %2317, %2335
  %2337 = fcmp contract olt float %2318, %2335
  %2338 = and i1 %2336, %2337
  %2339 = fmul contract float %2335, %2335
  %2340 = select i1 %2338, float %2335, float -0.000000e+00
  %2341 = fadd contract float %2328, %2340
  %2342 = select i1 %2338, float %2339, float -0.000000e+00
  %2343 = fadd contract float %2327, %2342
  %2344 = zext i1 %2338 to i32
  %2345 = add nuw nsw i32 %2325, %2344
  %2346 = or i32 %2326, 1
  %2347 = mul nsw i32 %2346, %1
  %2348 = add nsw i32 %2347, %12
  %2349 = sext i32 %2348 to i64
  %2350 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2349
  %2351 = load i16, i16 addrspace(1)* %2350, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2352 = uitofp i16 %2351 to float
  %2353 = fcmp contract ogt float %2317, %2352
  %2354 = fcmp contract olt float %2318, %2352
  %2355 = and i1 %2353, %2354
  %2356 = fmul contract float %2352, %2352
  %2357 = select i1 %2355, float %2352, float -0.000000e+00
  %2358 = fadd contract float %2341, %2357
  %2359 = select i1 %2355, float %2356, float -0.000000e+00
  %2360 = fadd contract float %2343, %2359
  %2361 = zext i1 %2355 to i32
  %2362 = add nuw nsw i32 %2345, %2361
  %2363 = or i32 %2326, 2
  %2364 = mul nsw i32 %2363, %1
  %2365 = add nsw i32 %2364, %12
  %2366 = sext i32 %2365 to i64
  %2367 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2366
  %2368 = load i16, i16 addrspace(1)* %2367, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2369 = uitofp i16 %2368 to float
  %2370 = fcmp contract ogt float %2317, %2369
  %2371 = fcmp contract olt float %2318, %2369
  %2372 = and i1 %2370, %2371
  %2373 = fmul contract float %2369, %2369
  %2374 = select i1 %2372, float %2369, float -0.000000e+00
  %2375 = fadd contract float %2358, %2374
  %2376 = select i1 %2372, float %2373, float -0.000000e+00
  %2377 = fadd contract float %2360, %2376
  %2378 = zext i1 %2372 to i32
  %2379 = add nuw nsw i32 %2362, %2378
  %2380 = or i32 %2326, 3
  %2381 = mul nsw i32 %2380, %1
  %2382 = add nsw i32 %2381, %12
  %2383 = sext i32 %2382 to i64
  %2384 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2383
  %2385 = load i16, i16 addrspace(1)* %2384, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2386 = uitofp i16 %2385 to float
  %2387 = fcmp contract ogt float %2317, %2386
  %2388 = fcmp contract olt float %2318, %2386
  %2389 = and i1 %2387, %2388
  %2390 = fmul contract float %2386, %2386
  %2391 = select i1 %2389, float %2386, float -0.000000e+00
  %2392 = fadd contract float %2375, %2391
  %2393 = select i1 %2389, float %2390, float -0.000000e+00
  %2394 = fadd contract float %2377, %2393
  %2395 = zext i1 %2389 to i32
  %2396 = add nuw nsw i32 %2379, %2395
  %2397 = add nuw nsw i32 %2326, 4
  %2398 = add i32 %2329, 4
  %2399 = icmp eq i32 %2398, %2323
  br i1 %2399, label %2400, label %2324, !llvm.loop !11

2400:                                             ; preds = %2324, %2316
  %2401 = phi float [ undef, %2316 ], [ %2392, %2324 ]
  %2402 = phi float [ undef, %2316 ], [ %2394, %2324 ]
  %2403 = phi i32 [ undef, %2316 ], [ %2396, %2324 ]
  %2404 = phi i32 [ 0, %2316 ], [ %2396, %2324 ]
  %2405 = phi i32 [ 0, %2316 ], [ %2397, %2324 ]
  %2406 = phi float [ 0.000000e+00, %2316 ], [ %2394, %2324 ]
  %2407 = phi float [ 0.000000e+00, %2316 ], [ %2392, %2324 ]
  %2408 = icmp eq i32 %2320, 0
  br i1 %2408, label %2434, label %2409

2409:                                             ; preds = %2400, %2409
  %2410 = phi i32 [ %2430, %2409 ], [ %2404, %2400 ]
  %2411 = phi i32 [ %2431, %2409 ], [ %2405, %2400 ]
  %2412 = phi float [ %2428, %2409 ], [ %2406, %2400 ]
  %2413 = phi float [ %2426, %2409 ], [ %2407, %2400 ]
  %2414 = phi i32 [ %2432, %2409 ], [ 0, %2400 ]
  %2415 = mul nsw i32 %2411, %1
  %2416 = add nsw i32 %2415, %12
  %2417 = sext i32 %2416 to i64
  %2418 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2417
  %2419 = load i16, i16 addrspace(1)* %2418, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2420 = uitofp i16 %2419 to float
  %2421 = fcmp contract ogt float %2317, %2420
  %2422 = fcmp contract olt float %2318, %2420
  %2423 = and i1 %2421, %2422
  %2424 = fmul contract float %2420, %2420
  %2425 = select i1 %2423, float %2420, float -0.000000e+00
  %2426 = fadd contract float %2413, %2425
  %2427 = select i1 %2423, float %2424, float -0.000000e+00
  %2428 = fadd contract float %2412, %2427
  %2429 = zext i1 %2423 to i32
  %2430 = add nuw nsw i32 %2410, %2429
  %2431 = add nuw nsw i32 %2411, 1
  %2432 = add i32 %2414, 1
  %2433 = icmp eq i32 %2432, %2320
  br i1 %2433, label %2434, label %2409, !llvm.loop !30

2434:                                             ; preds = %2400, %2409, %2315
  %2435 = phi float [ 0.000000e+00, %2315 ], [ %2401, %2400 ], [ %2426, %2409 ]
  %2436 = phi float [ 0.000000e+00, %2315 ], [ %2402, %2400 ], [ %2428, %2409 ]
  %2437 = phi i32 [ 0, %2315 ], [ %2403, %2400 ], [ %2430, %2409 ]
  %2438 = sitofp i32 %2437 to float
  %2439 = fdiv contract float %2435, %2438
  %2440 = fdiv contract float %2436, %2438
  %2441 = fmul contract float %2439, %2439
  %2442 = fsub contract float %2440, %2441
  %2443 = fcmp olt float %2442, 0x39F0000000000000
  %2444 = select i1 %2443, float 0x41F0000000000000, float 1.000000e+00
  %2445 = fmul float %2442, %2444
  %2446 = tail call float @llvm.sqrt.f32(float %2445)
  %2447 = bitcast float %2446 to i32
  %2448 = add nsw i32 %2447, -1
  %2449 = bitcast i32 %2448 to float
  %2450 = add nsw i32 %2447, 1
  %2451 = bitcast i32 %2450 to float
  %2452 = tail call i1 @llvm.amdgcn.class.f32(float %2445, i32 608)
  %2453 = select i1 %2443, float 0x3EF0000000000000, float 1.000000e+00
  %2454 = fneg float %2451
  %2455 = tail call float @llvm.fma.f32(float %2454, float %2446, float %2445)
  %2456 = fcmp ogt float %2455, 0.000000e+00
  %2457 = fneg float %2449
  %2458 = tail call float @llvm.fma.f32(float %2457, float %2446, float %2445)
  %2459 = fcmp ole float %2458, 0.000000e+00
  %2460 = select i1 %2459, float %2449, float %2446
  %2461 = select i1 %2456, float %2451, float %2460
  %2462 = fmul float %2453, %2461
  %2463 = select i1 %2452, float %2445, float %2462
  %2464 = fmul contract float %2463, 2.000000e+00
  %2465 = fsub contract float %2439, %2286
  %2466 = tail call float @llvm.fabs.f32(float %2465)
  %2467 = fcmp contract ogt float %2466, 0x3EB0C6F7A0000000
  br i1 %2467, label %2468, label %3227, !llvm.loop !15

2468:                                             ; preds = %2434
  br i1 %13, label %2587, label %2469

2469:                                             ; preds = %2468
  %2470 = fadd contract float %2439, %2464
  %2471 = fsub contract float %2439, %2464
  %2472 = add i32 %2, -1
  %2473 = and i32 %2, 3
  %2474 = icmp ult i32 %2472, 3
  br i1 %2474, label %2553, label %2475

2475:                                             ; preds = %2469
  %2476 = and i32 %2, -4
  br label %2477

2477:                                             ; preds = %2477, %2475
  %2478 = phi i32 [ 0, %2475 ], [ %2549, %2477 ]
  %2479 = phi i32 [ 0, %2475 ], [ %2550, %2477 ]
  %2480 = phi float [ 0.000000e+00, %2475 ], [ %2547, %2477 ]
  %2481 = phi float [ 0.000000e+00, %2475 ], [ %2545, %2477 ]
  %2482 = phi i32 [ 0, %2475 ], [ %2551, %2477 ]
  %2483 = mul nsw i32 %2479, %1
  %2484 = add nsw i32 %2483, %12
  %2485 = sext i32 %2484 to i64
  %2486 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2485
  %2487 = load i16, i16 addrspace(1)* %2486, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2488 = uitofp i16 %2487 to float
  %2489 = fcmp contract ogt float %2470, %2488
  %2490 = fcmp contract olt float %2471, %2488
  %2491 = and i1 %2489, %2490
  %2492 = fmul contract float %2488, %2488
  %2493 = select i1 %2491, float %2488, float -0.000000e+00
  %2494 = fadd contract float %2481, %2493
  %2495 = select i1 %2491, float %2492, float -0.000000e+00
  %2496 = fadd contract float %2480, %2495
  %2497 = zext i1 %2491 to i32
  %2498 = add nuw nsw i32 %2478, %2497
  %2499 = or i32 %2479, 1
  %2500 = mul nsw i32 %2499, %1
  %2501 = add nsw i32 %2500, %12
  %2502 = sext i32 %2501 to i64
  %2503 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2502
  %2504 = load i16, i16 addrspace(1)* %2503, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2505 = uitofp i16 %2504 to float
  %2506 = fcmp contract ogt float %2470, %2505
  %2507 = fcmp contract olt float %2471, %2505
  %2508 = and i1 %2506, %2507
  %2509 = fmul contract float %2505, %2505
  %2510 = select i1 %2508, float %2505, float -0.000000e+00
  %2511 = fadd contract float %2494, %2510
  %2512 = select i1 %2508, float %2509, float -0.000000e+00
  %2513 = fadd contract float %2496, %2512
  %2514 = zext i1 %2508 to i32
  %2515 = add nuw nsw i32 %2498, %2514
  %2516 = or i32 %2479, 2
  %2517 = mul nsw i32 %2516, %1
  %2518 = add nsw i32 %2517, %12
  %2519 = sext i32 %2518 to i64
  %2520 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2519
  %2521 = load i16, i16 addrspace(1)* %2520, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2522 = uitofp i16 %2521 to float
  %2523 = fcmp contract ogt float %2470, %2522
  %2524 = fcmp contract olt float %2471, %2522
  %2525 = and i1 %2523, %2524
  %2526 = fmul contract float %2522, %2522
  %2527 = select i1 %2525, float %2522, float -0.000000e+00
  %2528 = fadd contract float %2511, %2527
  %2529 = select i1 %2525, float %2526, float -0.000000e+00
  %2530 = fadd contract float %2513, %2529
  %2531 = zext i1 %2525 to i32
  %2532 = add nuw nsw i32 %2515, %2531
  %2533 = or i32 %2479, 3
  %2534 = mul nsw i32 %2533, %1
  %2535 = add nsw i32 %2534, %12
  %2536 = sext i32 %2535 to i64
  %2537 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2536
  %2538 = load i16, i16 addrspace(1)* %2537, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2539 = uitofp i16 %2538 to float
  %2540 = fcmp contract ogt float %2470, %2539
  %2541 = fcmp contract olt float %2471, %2539
  %2542 = and i1 %2540, %2541
  %2543 = fmul contract float %2539, %2539
  %2544 = select i1 %2542, float %2539, float -0.000000e+00
  %2545 = fadd contract float %2528, %2544
  %2546 = select i1 %2542, float %2543, float -0.000000e+00
  %2547 = fadd contract float %2530, %2546
  %2548 = zext i1 %2542 to i32
  %2549 = add nuw nsw i32 %2532, %2548
  %2550 = add nuw nsw i32 %2479, 4
  %2551 = add i32 %2482, 4
  %2552 = icmp eq i32 %2551, %2476
  br i1 %2552, label %2553, label %2477, !llvm.loop !11

2553:                                             ; preds = %2477, %2469
  %2554 = phi float [ undef, %2469 ], [ %2545, %2477 ]
  %2555 = phi float [ undef, %2469 ], [ %2547, %2477 ]
  %2556 = phi i32 [ undef, %2469 ], [ %2549, %2477 ]
  %2557 = phi i32 [ 0, %2469 ], [ %2549, %2477 ]
  %2558 = phi i32 [ 0, %2469 ], [ %2550, %2477 ]
  %2559 = phi float [ 0.000000e+00, %2469 ], [ %2547, %2477 ]
  %2560 = phi float [ 0.000000e+00, %2469 ], [ %2545, %2477 ]
  %2561 = icmp eq i32 %2473, 0
  br i1 %2561, label %2587, label %2562

2562:                                             ; preds = %2553, %2562
  %2563 = phi i32 [ %2583, %2562 ], [ %2557, %2553 ]
  %2564 = phi i32 [ %2584, %2562 ], [ %2558, %2553 ]
  %2565 = phi float [ %2581, %2562 ], [ %2559, %2553 ]
  %2566 = phi float [ %2579, %2562 ], [ %2560, %2553 ]
  %2567 = phi i32 [ %2585, %2562 ], [ 0, %2553 ]
  %2568 = mul nsw i32 %2564, %1
  %2569 = add nsw i32 %2568, %12
  %2570 = sext i32 %2569 to i64
  %2571 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2570
  %2572 = load i16, i16 addrspace(1)* %2571, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2573 = uitofp i16 %2572 to float
  %2574 = fcmp contract ogt float %2470, %2573
  %2575 = fcmp contract olt float %2471, %2573
  %2576 = and i1 %2574, %2575
  %2577 = fmul contract float %2573, %2573
  %2578 = select i1 %2576, float %2573, float -0.000000e+00
  %2579 = fadd contract float %2566, %2578
  %2580 = select i1 %2576, float %2577, float -0.000000e+00
  %2581 = fadd contract float %2565, %2580
  %2582 = zext i1 %2576 to i32
  %2583 = add nuw nsw i32 %2563, %2582
  %2584 = add nuw nsw i32 %2564, 1
  %2585 = add i32 %2567, 1
  %2586 = icmp eq i32 %2585, %2473
  br i1 %2586, label %2587, label %2562, !llvm.loop !31

2587:                                             ; preds = %2553, %2562, %2468
  %2588 = phi float [ 0.000000e+00, %2468 ], [ %2554, %2553 ], [ %2579, %2562 ]
  %2589 = phi float [ 0.000000e+00, %2468 ], [ %2555, %2553 ], [ %2581, %2562 ]
  %2590 = phi i32 [ 0, %2468 ], [ %2556, %2553 ], [ %2583, %2562 ]
  %2591 = sitofp i32 %2590 to float
  %2592 = fdiv contract float %2588, %2591
  %2593 = fdiv contract float %2589, %2591
  %2594 = fmul contract float %2592, %2592
  %2595 = fsub contract float %2593, %2594
  %2596 = fcmp olt float %2595, 0x39F0000000000000
  %2597 = select i1 %2596, float 0x41F0000000000000, float 1.000000e+00
  %2598 = fmul float %2595, %2597
  %2599 = tail call float @llvm.sqrt.f32(float %2598)
  %2600 = bitcast float %2599 to i32
  %2601 = add nsw i32 %2600, -1
  %2602 = bitcast i32 %2601 to float
  %2603 = add nsw i32 %2600, 1
  %2604 = bitcast i32 %2603 to float
  %2605 = tail call i1 @llvm.amdgcn.class.f32(float %2598, i32 608)
  %2606 = select i1 %2596, float 0x3EF0000000000000, float 1.000000e+00
  %2607 = fneg float %2604
  %2608 = tail call float @llvm.fma.f32(float %2607, float %2599, float %2598)
  %2609 = fcmp ogt float %2608, 0.000000e+00
  %2610 = fneg float %2602
  %2611 = tail call float @llvm.fma.f32(float %2610, float %2599, float %2598)
  %2612 = fcmp ole float %2611, 0.000000e+00
  %2613 = select i1 %2612, float %2602, float %2599
  %2614 = select i1 %2609, float %2604, float %2613
  %2615 = fmul float %2606, %2614
  %2616 = select i1 %2605, float %2598, float %2615
  %2617 = fmul contract float %2616, 2.000000e+00
  %2618 = fsub contract float %2592, %2439
  %2619 = tail call float @llvm.fabs.f32(float %2618)
  %2620 = fcmp contract ogt float %2619, 0x3EB0C6F7A0000000
  br i1 %2620, label %2621, label %3227, !llvm.loop !15

2621:                                             ; preds = %2587
  br i1 %13, label %2740, label %2622

2622:                                             ; preds = %2621
  %2623 = fadd contract float %2592, %2617
  %2624 = fsub contract float %2592, %2617
  %2625 = add i32 %2, -1
  %2626 = and i32 %2, 3
  %2627 = icmp ult i32 %2625, 3
  br i1 %2627, label %2706, label %2628

2628:                                             ; preds = %2622
  %2629 = and i32 %2, -4
  br label %2630

2630:                                             ; preds = %2630, %2628
  %2631 = phi i32 [ 0, %2628 ], [ %2702, %2630 ]
  %2632 = phi i32 [ 0, %2628 ], [ %2703, %2630 ]
  %2633 = phi float [ 0.000000e+00, %2628 ], [ %2700, %2630 ]
  %2634 = phi float [ 0.000000e+00, %2628 ], [ %2698, %2630 ]
  %2635 = phi i32 [ 0, %2628 ], [ %2704, %2630 ]
  %2636 = mul nsw i32 %2632, %1
  %2637 = add nsw i32 %2636, %12
  %2638 = sext i32 %2637 to i64
  %2639 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2638
  %2640 = load i16, i16 addrspace(1)* %2639, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2641 = uitofp i16 %2640 to float
  %2642 = fcmp contract ogt float %2623, %2641
  %2643 = fcmp contract olt float %2624, %2641
  %2644 = and i1 %2642, %2643
  %2645 = fmul contract float %2641, %2641
  %2646 = select i1 %2644, float %2641, float -0.000000e+00
  %2647 = fadd contract float %2634, %2646
  %2648 = select i1 %2644, float %2645, float -0.000000e+00
  %2649 = fadd contract float %2633, %2648
  %2650 = zext i1 %2644 to i32
  %2651 = add nuw nsw i32 %2631, %2650
  %2652 = or i32 %2632, 1
  %2653 = mul nsw i32 %2652, %1
  %2654 = add nsw i32 %2653, %12
  %2655 = sext i32 %2654 to i64
  %2656 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2655
  %2657 = load i16, i16 addrspace(1)* %2656, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2658 = uitofp i16 %2657 to float
  %2659 = fcmp contract ogt float %2623, %2658
  %2660 = fcmp contract olt float %2624, %2658
  %2661 = and i1 %2659, %2660
  %2662 = fmul contract float %2658, %2658
  %2663 = select i1 %2661, float %2658, float -0.000000e+00
  %2664 = fadd contract float %2647, %2663
  %2665 = select i1 %2661, float %2662, float -0.000000e+00
  %2666 = fadd contract float %2649, %2665
  %2667 = zext i1 %2661 to i32
  %2668 = add nuw nsw i32 %2651, %2667
  %2669 = or i32 %2632, 2
  %2670 = mul nsw i32 %2669, %1
  %2671 = add nsw i32 %2670, %12
  %2672 = sext i32 %2671 to i64
  %2673 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2672
  %2674 = load i16, i16 addrspace(1)* %2673, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2675 = uitofp i16 %2674 to float
  %2676 = fcmp contract ogt float %2623, %2675
  %2677 = fcmp contract olt float %2624, %2675
  %2678 = and i1 %2676, %2677
  %2679 = fmul contract float %2675, %2675
  %2680 = select i1 %2678, float %2675, float -0.000000e+00
  %2681 = fadd contract float %2664, %2680
  %2682 = select i1 %2678, float %2679, float -0.000000e+00
  %2683 = fadd contract float %2666, %2682
  %2684 = zext i1 %2678 to i32
  %2685 = add nuw nsw i32 %2668, %2684
  %2686 = or i32 %2632, 3
  %2687 = mul nsw i32 %2686, %1
  %2688 = add nsw i32 %2687, %12
  %2689 = sext i32 %2688 to i64
  %2690 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2689
  %2691 = load i16, i16 addrspace(1)* %2690, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2692 = uitofp i16 %2691 to float
  %2693 = fcmp contract ogt float %2623, %2692
  %2694 = fcmp contract olt float %2624, %2692
  %2695 = and i1 %2693, %2694
  %2696 = fmul contract float %2692, %2692
  %2697 = select i1 %2695, float %2692, float -0.000000e+00
  %2698 = fadd contract float %2681, %2697
  %2699 = select i1 %2695, float %2696, float -0.000000e+00
  %2700 = fadd contract float %2683, %2699
  %2701 = zext i1 %2695 to i32
  %2702 = add nuw nsw i32 %2685, %2701
  %2703 = add nuw nsw i32 %2632, 4
  %2704 = add i32 %2635, 4
  %2705 = icmp eq i32 %2704, %2629
  br i1 %2705, label %2706, label %2630, !llvm.loop !11

2706:                                             ; preds = %2630, %2622
  %2707 = phi float [ undef, %2622 ], [ %2698, %2630 ]
  %2708 = phi float [ undef, %2622 ], [ %2700, %2630 ]
  %2709 = phi i32 [ undef, %2622 ], [ %2702, %2630 ]
  %2710 = phi i32 [ 0, %2622 ], [ %2702, %2630 ]
  %2711 = phi i32 [ 0, %2622 ], [ %2703, %2630 ]
  %2712 = phi float [ 0.000000e+00, %2622 ], [ %2700, %2630 ]
  %2713 = phi float [ 0.000000e+00, %2622 ], [ %2698, %2630 ]
  %2714 = icmp eq i32 %2626, 0
  br i1 %2714, label %2740, label %2715

2715:                                             ; preds = %2706, %2715
  %2716 = phi i32 [ %2736, %2715 ], [ %2710, %2706 ]
  %2717 = phi i32 [ %2737, %2715 ], [ %2711, %2706 ]
  %2718 = phi float [ %2734, %2715 ], [ %2712, %2706 ]
  %2719 = phi float [ %2732, %2715 ], [ %2713, %2706 ]
  %2720 = phi i32 [ %2738, %2715 ], [ 0, %2706 ]
  %2721 = mul nsw i32 %2717, %1
  %2722 = add nsw i32 %2721, %12
  %2723 = sext i32 %2722 to i64
  %2724 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2723
  %2725 = load i16, i16 addrspace(1)* %2724, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2726 = uitofp i16 %2725 to float
  %2727 = fcmp contract ogt float %2623, %2726
  %2728 = fcmp contract olt float %2624, %2726
  %2729 = and i1 %2727, %2728
  %2730 = fmul contract float %2726, %2726
  %2731 = select i1 %2729, float %2726, float -0.000000e+00
  %2732 = fadd contract float %2719, %2731
  %2733 = select i1 %2729, float %2730, float -0.000000e+00
  %2734 = fadd contract float %2718, %2733
  %2735 = zext i1 %2729 to i32
  %2736 = add nuw nsw i32 %2716, %2735
  %2737 = add nuw nsw i32 %2717, 1
  %2738 = add i32 %2720, 1
  %2739 = icmp eq i32 %2738, %2626
  br i1 %2739, label %2740, label %2715, !llvm.loop !32

2740:                                             ; preds = %2706, %2715, %2621
  %2741 = phi float [ 0.000000e+00, %2621 ], [ %2707, %2706 ], [ %2732, %2715 ]
  %2742 = phi float [ 0.000000e+00, %2621 ], [ %2708, %2706 ], [ %2734, %2715 ]
  %2743 = phi i32 [ 0, %2621 ], [ %2709, %2706 ], [ %2736, %2715 ]
  %2744 = sitofp i32 %2743 to float
  %2745 = fdiv contract float %2741, %2744
  %2746 = fdiv contract float %2742, %2744
  %2747 = fmul contract float %2745, %2745
  %2748 = fsub contract float %2746, %2747
  %2749 = fcmp olt float %2748, 0x39F0000000000000
  %2750 = select i1 %2749, float 0x41F0000000000000, float 1.000000e+00
  %2751 = fmul float %2748, %2750
  %2752 = tail call float @llvm.sqrt.f32(float %2751)
  %2753 = bitcast float %2752 to i32
  %2754 = add nsw i32 %2753, -1
  %2755 = bitcast i32 %2754 to float
  %2756 = add nsw i32 %2753, 1
  %2757 = bitcast i32 %2756 to float
  %2758 = tail call i1 @llvm.amdgcn.class.f32(float %2751, i32 608)
  %2759 = select i1 %2749, float 0x3EF0000000000000, float 1.000000e+00
  %2760 = fneg float %2757
  %2761 = tail call float @llvm.fma.f32(float %2760, float %2752, float %2751)
  %2762 = fcmp ogt float %2761, 0.000000e+00
  %2763 = fneg float %2755
  %2764 = tail call float @llvm.fma.f32(float %2763, float %2752, float %2751)
  %2765 = fcmp ole float %2764, 0.000000e+00
  %2766 = select i1 %2765, float %2755, float %2752
  %2767 = select i1 %2762, float %2757, float %2766
  %2768 = fmul float %2759, %2767
  %2769 = select i1 %2758, float %2751, float %2768
  %2770 = fmul contract float %2769, 2.000000e+00
  %2771 = fsub contract float %2745, %2592
  %2772 = tail call float @llvm.fabs.f32(float %2771)
  %2773 = fcmp contract ogt float %2772, 0x3EB0C6F7A0000000
  br i1 %2773, label %2774, label %3227, !llvm.loop !15

2774:                                             ; preds = %2740
  br i1 %13, label %2893, label %2775

2775:                                             ; preds = %2774
  %2776 = fadd contract float %2745, %2770
  %2777 = fsub contract float %2745, %2770
  %2778 = add i32 %2, -1
  %2779 = and i32 %2, 3
  %2780 = icmp ult i32 %2778, 3
  br i1 %2780, label %2859, label %2781

2781:                                             ; preds = %2775
  %2782 = and i32 %2, -4
  br label %2783

2783:                                             ; preds = %2783, %2781
  %2784 = phi i32 [ 0, %2781 ], [ %2855, %2783 ]
  %2785 = phi i32 [ 0, %2781 ], [ %2856, %2783 ]
  %2786 = phi float [ 0.000000e+00, %2781 ], [ %2853, %2783 ]
  %2787 = phi float [ 0.000000e+00, %2781 ], [ %2851, %2783 ]
  %2788 = phi i32 [ 0, %2781 ], [ %2857, %2783 ]
  %2789 = mul nsw i32 %2785, %1
  %2790 = add nsw i32 %2789, %12
  %2791 = sext i32 %2790 to i64
  %2792 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2791
  %2793 = load i16, i16 addrspace(1)* %2792, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2794 = uitofp i16 %2793 to float
  %2795 = fcmp contract ogt float %2776, %2794
  %2796 = fcmp contract olt float %2777, %2794
  %2797 = and i1 %2795, %2796
  %2798 = fmul contract float %2794, %2794
  %2799 = select i1 %2797, float %2794, float -0.000000e+00
  %2800 = fadd contract float %2787, %2799
  %2801 = select i1 %2797, float %2798, float -0.000000e+00
  %2802 = fadd contract float %2786, %2801
  %2803 = zext i1 %2797 to i32
  %2804 = add nuw nsw i32 %2784, %2803
  %2805 = or i32 %2785, 1
  %2806 = mul nsw i32 %2805, %1
  %2807 = add nsw i32 %2806, %12
  %2808 = sext i32 %2807 to i64
  %2809 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2808
  %2810 = load i16, i16 addrspace(1)* %2809, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2811 = uitofp i16 %2810 to float
  %2812 = fcmp contract ogt float %2776, %2811
  %2813 = fcmp contract olt float %2777, %2811
  %2814 = and i1 %2812, %2813
  %2815 = fmul contract float %2811, %2811
  %2816 = select i1 %2814, float %2811, float -0.000000e+00
  %2817 = fadd contract float %2800, %2816
  %2818 = select i1 %2814, float %2815, float -0.000000e+00
  %2819 = fadd contract float %2802, %2818
  %2820 = zext i1 %2814 to i32
  %2821 = add nuw nsw i32 %2804, %2820
  %2822 = or i32 %2785, 2
  %2823 = mul nsw i32 %2822, %1
  %2824 = add nsw i32 %2823, %12
  %2825 = sext i32 %2824 to i64
  %2826 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2825
  %2827 = load i16, i16 addrspace(1)* %2826, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2828 = uitofp i16 %2827 to float
  %2829 = fcmp contract ogt float %2776, %2828
  %2830 = fcmp contract olt float %2777, %2828
  %2831 = and i1 %2829, %2830
  %2832 = fmul contract float %2828, %2828
  %2833 = select i1 %2831, float %2828, float -0.000000e+00
  %2834 = fadd contract float %2817, %2833
  %2835 = select i1 %2831, float %2832, float -0.000000e+00
  %2836 = fadd contract float %2819, %2835
  %2837 = zext i1 %2831 to i32
  %2838 = add nuw nsw i32 %2821, %2837
  %2839 = or i32 %2785, 3
  %2840 = mul nsw i32 %2839, %1
  %2841 = add nsw i32 %2840, %12
  %2842 = sext i32 %2841 to i64
  %2843 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2842
  %2844 = load i16, i16 addrspace(1)* %2843, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2845 = uitofp i16 %2844 to float
  %2846 = fcmp contract ogt float %2776, %2845
  %2847 = fcmp contract olt float %2777, %2845
  %2848 = and i1 %2846, %2847
  %2849 = fmul contract float %2845, %2845
  %2850 = select i1 %2848, float %2845, float -0.000000e+00
  %2851 = fadd contract float %2834, %2850
  %2852 = select i1 %2848, float %2849, float -0.000000e+00
  %2853 = fadd contract float %2836, %2852
  %2854 = zext i1 %2848 to i32
  %2855 = add nuw nsw i32 %2838, %2854
  %2856 = add nuw nsw i32 %2785, 4
  %2857 = add i32 %2788, 4
  %2858 = icmp eq i32 %2857, %2782
  br i1 %2858, label %2859, label %2783, !llvm.loop !11

2859:                                             ; preds = %2783, %2775
  %2860 = phi float [ undef, %2775 ], [ %2851, %2783 ]
  %2861 = phi float [ undef, %2775 ], [ %2853, %2783 ]
  %2862 = phi i32 [ undef, %2775 ], [ %2855, %2783 ]
  %2863 = phi i32 [ 0, %2775 ], [ %2855, %2783 ]
  %2864 = phi i32 [ 0, %2775 ], [ %2856, %2783 ]
  %2865 = phi float [ 0.000000e+00, %2775 ], [ %2853, %2783 ]
  %2866 = phi float [ 0.000000e+00, %2775 ], [ %2851, %2783 ]
  %2867 = icmp eq i32 %2779, 0
  br i1 %2867, label %2893, label %2868

2868:                                             ; preds = %2859, %2868
  %2869 = phi i32 [ %2889, %2868 ], [ %2863, %2859 ]
  %2870 = phi i32 [ %2890, %2868 ], [ %2864, %2859 ]
  %2871 = phi float [ %2887, %2868 ], [ %2865, %2859 ]
  %2872 = phi float [ %2885, %2868 ], [ %2866, %2859 ]
  %2873 = phi i32 [ %2891, %2868 ], [ 0, %2859 ]
  %2874 = mul nsw i32 %2870, %1
  %2875 = add nsw i32 %2874, %12
  %2876 = sext i32 %2875 to i64
  %2877 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2876
  %2878 = load i16, i16 addrspace(1)* %2877, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2879 = uitofp i16 %2878 to float
  %2880 = fcmp contract ogt float %2776, %2879
  %2881 = fcmp contract olt float %2777, %2879
  %2882 = and i1 %2880, %2881
  %2883 = fmul contract float %2879, %2879
  %2884 = select i1 %2882, float %2879, float -0.000000e+00
  %2885 = fadd contract float %2872, %2884
  %2886 = select i1 %2882, float %2883, float -0.000000e+00
  %2887 = fadd contract float %2871, %2886
  %2888 = zext i1 %2882 to i32
  %2889 = add nuw nsw i32 %2869, %2888
  %2890 = add nuw nsw i32 %2870, 1
  %2891 = add i32 %2873, 1
  %2892 = icmp eq i32 %2891, %2779
  br i1 %2892, label %2893, label %2868, !llvm.loop !33

2893:                                             ; preds = %2859, %2868, %2774
  %2894 = phi float [ 0.000000e+00, %2774 ], [ %2860, %2859 ], [ %2885, %2868 ]
  %2895 = phi float [ 0.000000e+00, %2774 ], [ %2861, %2859 ], [ %2887, %2868 ]
  %2896 = phi i32 [ 0, %2774 ], [ %2862, %2859 ], [ %2889, %2868 ]
  %2897 = sitofp i32 %2896 to float
  %2898 = fdiv contract float %2894, %2897
  %2899 = fdiv contract float %2895, %2897
  %2900 = fmul contract float %2898, %2898
  %2901 = fsub contract float %2899, %2900
  %2902 = fcmp olt float %2901, 0x39F0000000000000
  %2903 = select i1 %2902, float 0x41F0000000000000, float 1.000000e+00
  %2904 = fmul float %2901, %2903
  %2905 = tail call float @llvm.sqrt.f32(float %2904)
  %2906 = bitcast float %2905 to i32
  %2907 = add nsw i32 %2906, -1
  %2908 = bitcast i32 %2907 to float
  %2909 = add nsw i32 %2906, 1
  %2910 = bitcast i32 %2909 to float
  %2911 = tail call i1 @llvm.amdgcn.class.f32(float %2904, i32 608)
  %2912 = select i1 %2902, float 0x3EF0000000000000, float 1.000000e+00
  %2913 = fneg float %2910
  %2914 = tail call float @llvm.fma.f32(float %2913, float %2905, float %2904)
  %2915 = fcmp ogt float %2914, 0.000000e+00
  %2916 = fneg float %2908
  %2917 = tail call float @llvm.fma.f32(float %2916, float %2905, float %2904)
  %2918 = fcmp ole float %2917, 0.000000e+00
  %2919 = select i1 %2918, float %2908, float %2905
  %2920 = select i1 %2915, float %2910, float %2919
  %2921 = fmul float %2912, %2920
  %2922 = select i1 %2911, float %2904, float %2921
  %2923 = fmul contract float %2922, 2.000000e+00
  %2924 = fsub contract float %2898, %2745
  %2925 = tail call float @llvm.fabs.f32(float %2924)
  %2926 = fcmp contract ogt float %2925, 0x3EB0C6F7A0000000
  br i1 %2926, label %2927, label %3227, !llvm.loop !15

2927:                                             ; preds = %2893
  br i1 %13, label %3046, label %2928

2928:                                             ; preds = %2927
  %2929 = fadd contract float %2898, %2923
  %2930 = fsub contract float %2898, %2923
  %2931 = add i32 %2, -1
  %2932 = and i32 %2, 3
  %2933 = icmp ult i32 %2931, 3
  br i1 %2933, label %3012, label %2934

2934:                                             ; preds = %2928
  %2935 = and i32 %2, -4
  br label %2936

2936:                                             ; preds = %2936, %2934
  %2937 = phi i32 [ 0, %2934 ], [ %3008, %2936 ]
  %2938 = phi i32 [ 0, %2934 ], [ %3009, %2936 ]
  %2939 = phi float [ 0.000000e+00, %2934 ], [ %3006, %2936 ]
  %2940 = phi float [ 0.000000e+00, %2934 ], [ %3004, %2936 ]
  %2941 = phi i32 [ 0, %2934 ], [ %3010, %2936 ]
  %2942 = mul nsw i32 %2938, %1
  %2943 = add nsw i32 %2942, %12
  %2944 = sext i32 %2943 to i64
  %2945 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2944
  %2946 = load i16, i16 addrspace(1)* %2945, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2947 = uitofp i16 %2946 to float
  %2948 = fcmp contract ogt float %2929, %2947
  %2949 = fcmp contract olt float %2930, %2947
  %2950 = and i1 %2948, %2949
  %2951 = fmul contract float %2947, %2947
  %2952 = select i1 %2950, float %2947, float -0.000000e+00
  %2953 = fadd contract float %2940, %2952
  %2954 = select i1 %2950, float %2951, float -0.000000e+00
  %2955 = fadd contract float %2939, %2954
  %2956 = zext i1 %2950 to i32
  %2957 = add nuw nsw i32 %2937, %2956
  %2958 = or i32 %2938, 1
  %2959 = mul nsw i32 %2958, %1
  %2960 = add nsw i32 %2959, %12
  %2961 = sext i32 %2960 to i64
  %2962 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2961
  %2963 = load i16, i16 addrspace(1)* %2962, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2964 = uitofp i16 %2963 to float
  %2965 = fcmp contract ogt float %2929, %2964
  %2966 = fcmp contract olt float %2930, %2964
  %2967 = and i1 %2965, %2966
  %2968 = fmul contract float %2964, %2964
  %2969 = select i1 %2967, float %2964, float -0.000000e+00
  %2970 = fadd contract float %2953, %2969
  %2971 = select i1 %2967, float %2968, float -0.000000e+00
  %2972 = fadd contract float %2955, %2971
  %2973 = zext i1 %2967 to i32
  %2974 = add nuw nsw i32 %2957, %2973
  %2975 = or i32 %2938, 2
  %2976 = mul nsw i32 %2975, %1
  %2977 = add nsw i32 %2976, %12
  %2978 = sext i32 %2977 to i64
  %2979 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2978
  %2980 = load i16, i16 addrspace(1)* %2979, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2981 = uitofp i16 %2980 to float
  %2982 = fcmp contract ogt float %2929, %2981
  %2983 = fcmp contract olt float %2930, %2981
  %2984 = and i1 %2982, %2983
  %2985 = fmul contract float %2981, %2981
  %2986 = select i1 %2984, float %2981, float -0.000000e+00
  %2987 = fadd contract float %2970, %2986
  %2988 = select i1 %2984, float %2985, float -0.000000e+00
  %2989 = fadd contract float %2972, %2988
  %2990 = zext i1 %2984 to i32
  %2991 = add nuw nsw i32 %2974, %2990
  %2992 = or i32 %2938, 3
  %2993 = mul nsw i32 %2992, %1
  %2994 = add nsw i32 %2993, %12
  %2995 = sext i32 %2994 to i64
  %2996 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %2995
  %2997 = load i16, i16 addrspace(1)* %2996, align 2, !tbaa !7, !amdgpu.noclobber !5
  %2998 = uitofp i16 %2997 to float
  %2999 = fcmp contract ogt float %2929, %2998
  %3000 = fcmp contract olt float %2930, %2998
  %3001 = and i1 %2999, %3000
  %3002 = fmul contract float %2998, %2998
  %3003 = select i1 %3001, float %2998, float -0.000000e+00
  %3004 = fadd contract float %2987, %3003
  %3005 = select i1 %3001, float %3002, float -0.000000e+00
  %3006 = fadd contract float %2989, %3005
  %3007 = zext i1 %3001 to i32
  %3008 = add nuw nsw i32 %2991, %3007
  %3009 = add nuw nsw i32 %2938, 4
  %3010 = add i32 %2941, 4
  %3011 = icmp eq i32 %3010, %2935
  br i1 %3011, label %3012, label %2936, !llvm.loop !11

3012:                                             ; preds = %2936, %2928
  %3013 = phi float [ undef, %2928 ], [ %3004, %2936 ]
  %3014 = phi float [ undef, %2928 ], [ %3006, %2936 ]
  %3015 = phi i32 [ undef, %2928 ], [ %3008, %2936 ]
  %3016 = phi i32 [ 0, %2928 ], [ %3008, %2936 ]
  %3017 = phi i32 [ 0, %2928 ], [ %3009, %2936 ]
  %3018 = phi float [ 0.000000e+00, %2928 ], [ %3006, %2936 ]
  %3019 = phi float [ 0.000000e+00, %2928 ], [ %3004, %2936 ]
  %3020 = icmp eq i32 %2932, 0
  br i1 %3020, label %3046, label %3021

3021:                                             ; preds = %3012, %3021
  %3022 = phi i32 [ %3042, %3021 ], [ %3016, %3012 ]
  %3023 = phi i32 [ %3043, %3021 ], [ %3017, %3012 ]
  %3024 = phi float [ %3040, %3021 ], [ %3018, %3012 ]
  %3025 = phi float [ %3038, %3021 ], [ %3019, %3012 ]
  %3026 = phi i32 [ %3044, %3021 ], [ 0, %3012 ]
  %3027 = mul nsw i32 %3023, %1
  %3028 = add nsw i32 %3027, %12
  %3029 = sext i32 %3028 to i64
  %3030 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3029
  %3031 = load i16, i16 addrspace(1)* %3030, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3032 = uitofp i16 %3031 to float
  %3033 = fcmp contract ogt float %2929, %3032
  %3034 = fcmp contract olt float %2930, %3032
  %3035 = and i1 %3033, %3034
  %3036 = fmul contract float %3032, %3032
  %3037 = select i1 %3035, float %3032, float -0.000000e+00
  %3038 = fadd contract float %3025, %3037
  %3039 = select i1 %3035, float %3036, float -0.000000e+00
  %3040 = fadd contract float %3024, %3039
  %3041 = zext i1 %3035 to i32
  %3042 = add nuw nsw i32 %3022, %3041
  %3043 = add nuw nsw i32 %3023, 1
  %3044 = add i32 %3026, 1
  %3045 = icmp eq i32 %3044, %2932
  br i1 %3045, label %3046, label %3021, !llvm.loop !34

3046:                                             ; preds = %3012, %3021, %2927
  %3047 = phi float [ 0.000000e+00, %2927 ], [ %3013, %3012 ], [ %3038, %3021 ]
  %3048 = phi float [ 0.000000e+00, %2927 ], [ %3014, %3012 ], [ %3040, %3021 ]
  %3049 = phi i32 [ 0, %2927 ], [ %3015, %3012 ], [ %3042, %3021 ]
  %3050 = sitofp i32 %3049 to float
  %3051 = fdiv contract float %3047, %3050
  %3052 = fdiv contract float %3048, %3050
  %3053 = fmul contract float %3051, %3051
  %3054 = fsub contract float %3052, %3053
  %3055 = fcmp olt float %3054, 0x39F0000000000000
  %3056 = select i1 %3055, float 0x41F0000000000000, float 1.000000e+00
  %3057 = fmul float %3054, %3056
  %3058 = tail call float @llvm.sqrt.f32(float %3057)
  %3059 = bitcast float %3058 to i32
  %3060 = add nsw i32 %3059, -1
  %3061 = bitcast i32 %3060 to float
  %3062 = add nsw i32 %3059, 1
  %3063 = bitcast i32 %3062 to float
  %3064 = tail call i1 @llvm.amdgcn.class.f32(float %3057, i32 608)
  %3065 = select i1 %3055, float 0x3EF0000000000000, float 1.000000e+00
  %3066 = fneg float %3063
  %3067 = tail call float @llvm.fma.f32(float %3066, float %3058, float %3057)
  %3068 = fcmp ogt float %3067, 0.000000e+00
  %3069 = fneg float %3061
  %3070 = tail call float @llvm.fma.f32(float %3069, float %3058, float %3057)
  %3071 = fcmp ole float %3070, 0.000000e+00
  %3072 = select i1 %3071, float %3061, float %3058
  %3073 = select i1 %3068, float %3063, float %3072
  %3074 = fmul float %3065, %3073
  %3075 = select i1 %3064, float %3057, float %3074
  br label %3227, !llvm.loop !15

3076:                                             ; preds = %3138, %14
  %3077 = phi float [ undef, %14 ], [ %3221, %3138 ]
  %3078 = phi float [ undef, %14 ], [ %3222, %3138 ]
  %3079 = phi i32 [ undef, %14 ], [ %3223, %3138 ]
  %3080 = phi i32 [ 0, %14 ], [ %3223, %3138 ]
  %3081 = phi i32 [ 0, %14 ], [ %3224, %3138 ]
  %3082 = phi float [ 0.000000e+00, %14 ], [ %3222, %3138 ]
  %3083 = phi float [ 0.000000e+00, %14 ], [ %3221, %3138 ]
  %3084 = icmp eq i32 %16, 0
  br i1 %3084, label %3104, label %3085

3085:                                             ; preds = %3076, %3085
  %3086 = phi i32 [ %3100, %3085 ], [ %3080, %3076 ]
  %3087 = phi i32 [ %3101, %3085 ], [ %3081, %3076 ]
  %3088 = phi float [ %3099, %3085 ], [ %3082, %3076 ]
  %3089 = phi float [ %3098, %3085 ], [ %3083, %3076 ]
  %3090 = phi i32 [ %3102, %3085 ], [ 0, %3076 ]
  %3091 = mul nsw i32 %3087, %1
  %3092 = add nsw i32 %3091, %12
  %3093 = sext i32 %3092 to i64
  %3094 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3093
  %3095 = load i16, i16 addrspace(1)* %3094, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3096 = uitofp i16 %3095 to float
  %3097 = fmul contract float %3096, %3096
  %3098 = fadd contract float %3089, %3096
  %3099 = fadd contract float %3088, %3097
  %3100 = add nuw nsw i32 %3086, 1
  %3101 = add nuw nsw i32 %3087, 1
  %3102 = add i32 %3090, 1
  %3103 = icmp eq i32 %3102, %16
  br i1 %3103, label %3104, label %3085, !llvm.loop !35

3104:                                             ; preds = %3076, %3085, %3
  %3105 = phi float [ 0.000000e+00, %3 ], [ %3077, %3076 ], [ %3098, %3085 ]
  %3106 = phi float [ 0.000000e+00, %3 ], [ %3078, %3076 ], [ %3099, %3085 ]
  %3107 = phi i32 [ 0, %3 ], [ %3079, %3076 ], [ %3100, %3085 ]
  %3108 = sitofp i32 %3107 to float
  %3109 = fdiv contract float %3105, %3108
  %3110 = fdiv contract float %3106, %3108
  %3111 = fmul contract float %3109, %3109
  %3112 = fsub contract float %3110, %3111
  %3113 = fcmp olt float %3112, 0x39F0000000000000
  %3114 = select i1 %3113, float 0x41F0000000000000, float 1.000000e+00
  %3115 = fmul float %3112, %3114
  %3116 = tail call float @llvm.sqrt.f32(float %3115)
  %3117 = bitcast float %3116 to i32
  %3118 = add nsw i32 %3117, -1
  %3119 = bitcast i32 %3118 to float
  %3120 = add nsw i32 %3117, 1
  %3121 = bitcast i32 %3120 to float
  %3122 = tail call i1 @llvm.amdgcn.class.f32(float %3115, i32 608)
  %3123 = select i1 %3113, float 0x3EF0000000000000, float 1.000000e+00
  %3124 = fneg float %3121
  %3125 = tail call float @llvm.fma.f32(float %3124, float %3116, float %3115)
  %3126 = fcmp ogt float %3125, 0.000000e+00
  %3127 = fneg float %3119
  %3128 = tail call float @llvm.fma.f32(float %3127, float %3116, float %3115)
  %3129 = fcmp ole float %3128, 0.000000e+00
  %3130 = select i1 %3129, float %3119, float %3116
  %3131 = select i1 %3126, float %3121, float %3130
  %3132 = fmul float %3123, %3131
  %3133 = select i1 %3122, float %3115, float %3132
  %3134 = fmul contract float %3133, 2.000000e+00
  %3135 = fadd contract float %3109, -1.275000e+02
  %3136 = tail call float @llvm.fabs.f32(float %3135)
  %3137 = fcmp contract ogt float %3136, 0x3EB0C6F7A0000000
  br i1 %3137, label %20, label %3227, !llvm.loop !15

3138:                                             ; preds = %3138, %18
  %3139 = phi i32 [ 0, %18 ], [ %3223, %3138 ]
  %3140 = phi i32 [ 0, %18 ], [ %3224, %3138 ]
  %3141 = phi float [ 0.000000e+00, %18 ], [ %3222, %3138 ]
  %3142 = phi float [ 0.000000e+00, %18 ], [ %3221, %3138 ]
  %3143 = phi i32 [ 0, %18 ], [ %3225, %3138 ]
  %3144 = mul nsw i32 %3140, %1
  %3145 = add nsw i32 %3144, %12
  %3146 = sext i32 %3145 to i64
  %3147 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3146
  %3148 = load i16, i16 addrspace(1)* %3147, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3149 = uitofp i16 %3148 to float
  %3150 = fmul contract float %3149, %3149
  %3151 = fadd contract float %3142, %3149
  %3152 = fadd contract float %3141, %3150
  %3153 = or i32 %3140, 1
  %3154 = mul nsw i32 %3153, %1
  %3155 = add nsw i32 %3154, %12
  %3156 = sext i32 %3155 to i64
  %3157 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3156
  %3158 = load i16, i16 addrspace(1)* %3157, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3159 = uitofp i16 %3158 to float
  %3160 = fmul contract float %3159, %3159
  %3161 = fadd contract float %3151, %3159
  %3162 = fadd contract float %3152, %3160
  %3163 = or i32 %3140, 2
  %3164 = mul nsw i32 %3163, %1
  %3165 = add nsw i32 %3164, %12
  %3166 = sext i32 %3165 to i64
  %3167 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3166
  %3168 = load i16, i16 addrspace(1)* %3167, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3169 = uitofp i16 %3168 to float
  %3170 = fmul contract float %3169, %3169
  %3171 = fadd contract float %3161, %3169
  %3172 = fadd contract float %3162, %3170
  %3173 = or i32 %3140, 3
  %3174 = mul nsw i32 %3173, %1
  %3175 = add nsw i32 %3174, %12
  %3176 = sext i32 %3175 to i64
  %3177 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3176
  %3178 = load i16, i16 addrspace(1)* %3177, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3179 = uitofp i16 %3178 to float
  %3180 = fmul contract float %3179, %3179
  %3181 = fadd contract float %3171, %3179
  %3182 = fadd contract float %3172, %3180
  %3183 = or i32 %3140, 4
  %3184 = mul nsw i32 %3183, %1
  %3185 = add nsw i32 %3184, %12
  %3186 = sext i32 %3185 to i64
  %3187 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3186
  %3188 = load i16, i16 addrspace(1)* %3187, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3189 = uitofp i16 %3188 to float
  %3190 = fmul contract float %3189, %3189
  %3191 = fadd contract float %3181, %3189
  %3192 = fadd contract float %3182, %3190
  %3193 = or i32 %3140, 5
  %3194 = mul nsw i32 %3193, %1
  %3195 = add nsw i32 %3194, %12
  %3196 = sext i32 %3195 to i64
  %3197 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3196
  %3198 = load i16, i16 addrspace(1)* %3197, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3199 = uitofp i16 %3198 to float
  %3200 = fmul contract float %3199, %3199
  %3201 = fadd contract float %3191, %3199
  %3202 = fadd contract float %3192, %3200
  %3203 = or i32 %3140, 6
  %3204 = mul nsw i32 %3203, %1
  %3205 = add nsw i32 %3204, %12
  %3206 = sext i32 %3205 to i64
  %3207 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3206
  %3208 = load i16, i16 addrspace(1)* %3207, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3209 = uitofp i16 %3208 to float
  %3210 = fmul contract float %3209, %3209
  %3211 = fadd contract float %3201, %3209
  %3212 = fadd contract float %3202, %3210
  %3213 = or i32 %3140, 7
  %3214 = mul nsw i32 %3213, %1
  %3215 = add nsw i32 %3214, %12
  %3216 = sext i32 %3215 to i64
  %3217 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3216
  %3218 = load i16, i16 addrspace(1)* %3217, align 2, !tbaa !7, !amdgpu.noclobber !5
  %3219 = uitofp i16 %3218 to float
  %3220 = fmul contract float %3219, %3219
  %3221 = fadd contract float %3211, %3219
  %3222 = fadd contract float %3212, %3220
  %3223 = add nuw nsw i32 %3139, 8
  %3224 = add nuw nsw i32 %3140, 8
  %3225 = add i32 %3143, 8
  %3226 = icmp eq i32 %3225, %19
  br i1 %3226, label %3076, label %3138, !llvm.loop !11

3227:                                             ; preds = %3046, %2893, %2740, %2587, %2434, %2281, %2128, %1975, %1822, %1669, %1516, %1363, %1210, %1057, %904, %751, %598, %445, %292, %139, %3104
  %3228 = phi i32 [ %3107, %3104 ], [ %142, %139 ], [ %295, %292 ], [ %448, %445 ], [ %601, %598 ], [ %754, %751 ], [ %907, %904 ], [ %1060, %1057 ], [ %1213, %1210 ], [ %1366, %1363 ], [ %1519, %1516 ], [ %1672, %1669 ], [ %1825, %1822 ], [ %1978, %1975 ], [ %2131, %2128 ], [ %2284, %2281 ], [ %2437, %2434 ], [ %2590, %2587 ], [ %2743, %2740 ], [ %2896, %2893 ], [ %3049, %3046 ]
  %3229 = phi float [ %3109, %3104 ], [ %144, %139 ], [ %297, %292 ], [ %450, %445 ], [ %603, %598 ], [ %756, %751 ], [ %909, %904 ], [ %1062, %1057 ], [ %1215, %1210 ], [ %1368, %1363 ], [ %1521, %1516 ], [ %1674, %1669 ], [ %1827, %1822 ], [ %1980, %1975 ], [ %2133, %2128 ], [ %2286, %2281 ], [ %2439, %2434 ], [ %2592, %2587 ], [ %2745, %2740 ], [ %2898, %2893 ], [ %3051, %3046 ]
  %3230 = phi float [ %3133, %3104 ], [ %168, %139 ], [ %321, %292 ], [ %474, %445 ], [ %627, %598 ], [ %780, %751 ], [ %933, %904 ], [ %1086, %1057 ], [ %1239, %1210 ], [ %1392, %1363 ], [ %1545, %1516 ], [ %1698, %1669 ], [ %1851, %1822 ], [ %2004, %1975 ], [ %2157, %2128 ], [ %2310, %2281 ], [ %2463, %2434 ], [ %2616, %2587 ], [ %2769, %2740 ], [ %2922, %2893 ], [ %3075, %3046 ]
  %3231 = phi i1 [ false, %3104 ], [ false, %139 ], [ false, %292 ], [ false, %445 ], [ false, %598 ], [ false, %751 ], [ false, %904 ], [ false, %1057 ], [ false, %1210 ], [ false, %1363 ], [ false, %1516 ], [ false, %1669 ], [ false, %1822 ], [ false, %1975 ], [ false, %2128 ], [ false, %2281 ], [ false, %2434 ], [ false, %2587 ], [ false, %2740 ], [ false, %2893 ], [ true, %3046 ]
  %3232 = icmp eq i32 %3228, 0
  %3233 = or i1 %3232, %3231
  %3234 = fcmp contract une float %3229, 0.000000e+00
  %3235 = xor i1 %3233, true
  %3236 = select i1 %3235, i1 %3234, i1 false
  %3237 = fcmp contract une float %3230, 0.000000e+00
  %3238 = select i1 %3236, i1 %3237, i1 false
  %3239 = select i1 %3238, i1 true, i1 %13
  %3240 = select i1 %3238, float %3229, float 1.275000e+02
  %3241 = select i1 %3238, float %3230, float 0.000000e+00
  br i1 %3239, label %3356, label %3242

3242:                                             ; preds = %3227
  %3243 = icmp ult i32 %2, 4
  br i1 %3243, label %3346, label %3244

3244:                                             ; preds = %3242
  %3245 = icmp ne i32 %1, 1
  %3246 = add i32 %2, -1
  %3247 = add i32 %12, %3246
  %3248 = icmp slt i32 %3247, %12
  %3249 = or i1 %3245, %3248
  br i1 %3249, label %3346, label %3250

3250:                                             ; preds = %3244
  %3251 = and i32 %2, -4
  %3252 = add i32 %2, -4
  %3253 = lshr i32 %3252, 2
  %3254 = add nuw nsw i32 %3253, 1
  %3255 = and i32 %3254, 7
  %3256 = icmp ult i32 %3252, 28
  br i1 %3256, label %3328, label %3257

3257:                                             ; preds = %3250
  %3258 = and i32 %3254, -8
  br label %3259

3259:                                             ; preds = %3259, %3257
  %3260 = phi i32 [ 0, %3257 ], [ %3325, %3259 ]
  %3261 = phi i32 [ 0, %3257 ], [ %3326, %3259 ]
  %3262 = mul nsw i32 %3260, %1
  %3263 = add nsw i32 %3262, %12
  %3264 = sext i32 %3263 to i64
  %3265 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3264
  %3266 = bitcast i16 addrspace(1)* %3265 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3266, align 2, !tbaa !7
  %3267 = getelementptr inbounds i16, i16 addrspace(1)* %3265, i64 2
  %3268 = bitcast i16 addrspace(1)* %3267 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3268, align 2, !tbaa !7
  %3269 = or i32 %3260, 4
  %3270 = mul nsw i32 %3269, %1
  %3271 = add nsw i32 %3270, %12
  %3272 = sext i32 %3271 to i64
  %3273 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3272
  %3274 = bitcast i16 addrspace(1)* %3273 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3274, align 2, !tbaa !7
  %3275 = getelementptr inbounds i16, i16 addrspace(1)* %3273, i64 2
  %3276 = bitcast i16 addrspace(1)* %3275 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3276, align 2, !tbaa !7
  %3277 = or i32 %3260, 8
  %3278 = mul nsw i32 %3277, %1
  %3279 = add nsw i32 %3278, %12
  %3280 = sext i32 %3279 to i64
  %3281 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3280
  %3282 = bitcast i16 addrspace(1)* %3281 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3282, align 2, !tbaa !7
  %3283 = getelementptr inbounds i16, i16 addrspace(1)* %3281, i64 2
  %3284 = bitcast i16 addrspace(1)* %3283 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3284, align 2, !tbaa !7
  %3285 = or i32 %3260, 12
  %3286 = mul nsw i32 %3285, %1
  %3287 = add nsw i32 %3286, %12
  %3288 = sext i32 %3287 to i64
  %3289 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3288
  %3290 = bitcast i16 addrspace(1)* %3289 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3290, align 2, !tbaa !7
  %3291 = getelementptr inbounds i16, i16 addrspace(1)* %3289, i64 2
  %3292 = bitcast i16 addrspace(1)* %3291 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3292, align 2, !tbaa !7
  %3293 = or i32 %3260, 16
  %3294 = mul nsw i32 %3293, %1
  %3295 = add nsw i32 %3294, %12
  %3296 = sext i32 %3295 to i64
  %3297 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3296
  %3298 = bitcast i16 addrspace(1)* %3297 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3298, align 2, !tbaa !7
  %3299 = getelementptr inbounds i16, i16 addrspace(1)* %3297, i64 2
  %3300 = bitcast i16 addrspace(1)* %3299 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3300, align 2, !tbaa !7
  %3301 = or i32 %3260, 20
  %3302 = mul nsw i32 %3301, %1
  %3303 = add nsw i32 %3302, %12
  %3304 = sext i32 %3303 to i64
  %3305 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3304
  %3306 = bitcast i16 addrspace(1)* %3305 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3306, align 2, !tbaa !7
  %3307 = getelementptr inbounds i16, i16 addrspace(1)* %3305, i64 2
  %3308 = bitcast i16 addrspace(1)* %3307 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3308, align 2, !tbaa !7
  %3309 = or i32 %3260, 24
  %3310 = mul nsw i32 %3309, %1
  %3311 = add nsw i32 %3310, %12
  %3312 = sext i32 %3311 to i64
  %3313 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3312
  %3314 = bitcast i16 addrspace(1)* %3313 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3314, align 2, !tbaa !7
  %3315 = getelementptr inbounds i16, i16 addrspace(1)* %3313, i64 2
  %3316 = bitcast i16 addrspace(1)* %3315 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3316, align 2, !tbaa !7
  %3317 = or i32 %3260, 28
  %3318 = mul nsw i32 %3317, %1
  %3319 = add nsw i32 %3318, %12
  %3320 = sext i32 %3319 to i64
  %3321 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3320
  %3322 = bitcast i16 addrspace(1)* %3321 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3322, align 2, !tbaa !7
  %3323 = getelementptr inbounds i16, i16 addrspace(1)* %3321, i64 2
  %3324 = bitcast i16 addrspace(1)* %3323 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3324, align 2, !tbaa !7
  %3325 = add nuw i32 %3260, 32
  %3326 = add i32 %3261, 8
  %3327 = icmp eq i32 %3326, %3258
  br i1 %3327, label %3328, label %3259, !llvm.loop !36

3328:                                             ; preds = %3259, %3250
  %3329 = phi i32 [ 0, %3250 ], [ %3325, %3259 ]
  %3330 = icmp eq i32 %3255, 0
  br i1 %3330, label %3344, label %3331

3331:                                             ; preds = %3328, %3331
  %3332 = phi i32 [ %3341, %3331 ], [ %3329, %3328 ]
  %3333 = phi i32 [ %3342, %3331 ], [ 0, %3328 ]
  %3334 = mul nsw i32 %3332, %1
  %3335 = add nsw i32 %3334, %12
  %3336 = sext i32 %3335 to i64
  %3337 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3336
  %3338 = bitcast i16 addrspace(1)* %3337 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3338, align 2, !tbaa !7
  %3339 = getelementptr inbounds i16, i16 addrspace(1)* %3337, i64 2
  %3340 = bitcast i16 addrspace(1)* %3339 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3340, align 2, !tbaa !7
  %3341 = add nuw i32 %3332, 4
  %3342 = add i32 %3333, 1
  %3343 = icmp eq i32 %3342, %3255
  br i1 %3343, label %3344, label %3331, !llvm.loop !38

3344:                                             ; preds = %3331, %3328
  %3345 = icmp eq i32 %3251, %2
  br i1 %3345, label %3356, label %3346

3346:                                             ; preds = %3244, %3242, %3344
  %3347 = phi i32 [ 0, %3244 ], [ 0, %3242 ], [ %3251, %3344 ]
  br label %3348

3348:                                             ; preds = %3346, %3348
  %3349 = phi i32 [ %3354, %3348 ], [ %3347, %3346 ]
  %3350 = mul nsw i32 %3349, %1
  %3351 = add nsw i32 %3350, %12
  %3352 = sext i32 %3351 to i64
  %3353 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3352
  store i16 127, i16 addrspace(1)* %3353, align 2, !tbaa !7
  %3354 = add nuw nsw i32 %3349, 1
  %3355 = icmp eq i32 %3354, %2
  br i1 %3355, label %3356, label %3348, !llvm.loop !39

3356:                                             ; preds = %3348, %3344, %3227
  %3357 = phi float [ %3240, %3227 ], [ 1.275000e+02, %3344 ], [ 1.275000e+02, %3348 ]
  %3358 = phi float [ %3241, %3227 ], [ 0.000000e+00, %3344 ], [ 0.000000e+00, %3348 ]
  %3359 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %11
  store float %3357, float addrspace(3)* %3359, align 4, !tbaa !40
  %3360 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %11
  store float %3358, float addrspace(3)* %3360, align 4, !tbaa !40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %3361 = and i32 %9, 7
  %3362 = icmp ult i16 %8, 8
  br i1 %3362, label %3365, label %3363

3363:                                             ; preds = %3356
  %3364 = and i32 %9, 2040
  br label %3418

3365:                                             ; preds = %3418, %3356
  %3366 = phi float [ undef, %3356 ], [ %3467, %3418 ]
  %3367 = phi float [ undef, %3356 ], [ %3469, %3418 ]
  %3368 = phi i32 [ 0, %3356 ], [ %3470, %3418 ]
  %3369 = phi float [ 0.000000e+00, %3356 ], [ %3467, %3418 ]
  %3370 = phi float [ 0.000000e+00, %3356 ], [ %3469, %3418 ]
  %3371 = icmp eq i32 %3361, 0
  br i1 %3371, label %3385, label %3372

3372:                                             ; preds = %3365, %3372
  %3373 = phi i32 [ %3382, %3372 ], [ %3368, %3365 ]
  %3374 = phi float [ %3379, %3372 ], [ %3369, %3365 ]
  %3375 = phi float [ %3381, %3372 ], [ %3370, %3365 ]
  %3376 = phi i32 [ %3383, %3372 ], [ 0, %3365 ]
  %3377 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3373
  %3378 = load float, float addrspace(3)* %3377, align 4, !tbaa !40
  %3379 = fadd contract float %3374, %3378
  %3380 = fmul contract float %3378, %3378
  %3381 = fadd contract float %3375, %3380
  %3382 = add nuw nsw i32 %3373, 1
  %3383 = add i32 %3376, 1
  %3384 = icmp eq i32 %3383, %3361
  br i1 %3384, label %3385, label %3372, !llvm.loop !42

3385:                                             ; preds = %3372, %3365
  %3386 = phi float [ %3366, %3365 ], [ %3379, %3372 ]
  %3387 = phi float [ %3367, %3365 ], [ %3381, %3372 ]
  %3388 = uitofp i16 %8 to float
  %3389 = fdiv contract float %3386, %3388
  %3390 = fdiv contract float %3387, %3388
  %3391 = fmul contract float %3389, %3389
  %3392 = fsub contract float %3390, %3391
  %3393 = fcmp olt float %3392, 0x39F0000000000000
  %3394 = select i1 %3393, float 0x41F0000000000000, float 1.000000e+00
  %3395 = fmul float %3392, %3394
  %3396 = tail call float @llvm.sqrt.f32(float %3395)
  %3397 = bitcast float %3396 to i32
  %3398 = add nsw i32 %3397, -1
  %3399 = bitcast i32 %3398 to float
  %3400 = add nsw i32 %3397, 1
  %3401 = bitcast i32 %3400 to float
  %3402 = tail call i1 @llvm.amdgcn.class.f32(float %3395, i32 608)
  %3403 = select i1 %3393, float 0x3EF0000000000000, float 1.000000e+00
  %3404 = fneg float %3401
  %3405 = tail call float @llvm.fma.f32(float %3404, float %3396, float %3395)
  %3406 = fcmp ogt float %3405, 0.000000e+00
  %3407 = fneg float %3399
  %3408 = tail call float @llvm.fma.f32(float %3407, float %3396, float %3395)
  %3409 = fcmp ole float %3408, 0.000000e+00
  %3410 = select i1 %3409, float %3399, float %3396
  %3411 = select i1 %3406, float %3401, float %3410
  %3412 = fmul float %3403, %3411
  %3413 = select i1 %3402, float %3395, float %3412
  %3414 = and i32 %9, 7
  %3415 = icmp ult i16 %8, 8
  br i1 %3415, label %3473, label %3416

3416:                                             ; preds = %3385
  %3417 = and i32 %9, 2040
  br label %3637

3418:                                             ; preds = %3418, %3363
  %3419 = phi i32 [ 0, %3363 ], [ %3470, %3418 ]
  %3420 = phi float [ 0.000000e+00, %3363 ], [ %3467, %3418 ]
  %3421 = phi float [ 0.000000e+00, %3363 ], [ %3469, %3418 ]
  %3422 = phi i32 [ 0, %3363 ], [ %3471, %3418 ]
  %3423 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3419
  %3424 = load float, float addrspace(3)* %3423, align 16, !tbaa !40
  %3425 = fadd contract float %3420, %3424
  %3426 = fmul contract float %3424, %3424
  %3427 = fadd contract float %3421, %3426
  %3428 = or i32 %3419, 1
  %3429 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3428
  %3430 = load float, float addrspace(3)* %3429, align 4, !tbaa !40
  %3431 = fadd contract float %3425, %3430
  %3432 = fmul contract float %3430, %3430
  %3433 = fadd contract float %3427, %3432
  %3434 = or i32 %3419, 2
  %3435 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3434
  %3436 = load float, float addrspace(3)* %3435, align 8, !tbaa !40
  %3437 = fadd contract float %3431, %3436
  %3438 = fmul contract float %3436, %3436
  %3439 = fadd contract float %3433, %3438
  %3440 = or i32 %3419, 3
  %3441 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3440
  %3442 = load float, float addrspace(3)* %3441, align 4, !tbaa !40
  %3443 = fadd contract float %3437, %3442
  %3444 = fmul contract float %3442, %3442
  %3445 = fadd contract float %3439, %3444
  %3446 = or i32 %3419, 4
  %3447 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3446
  %3448 = load float, float addrspace(3)* %3447, align 16, !tbaa !40
  %3449 = fadd contract float %3443, %3448
  %3450 = fmul contract float %3448, %3448
  %3451 = fadd contract float %3445, %3450
  %3452 = or i32 %3419, 5
  %3453 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3452
  %3454 = load float, float addrspace(3)* %3453, align 4, !tbaa !40
  %3455 = fadd contract float %3449, %3454
  %3456 = fmul contract float %3454, %3454
  %3457 = fadd contract float %3451, %3456
  %3458 = or i32 %3419, 6
  %3459 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3458
  %3460 = load float, float addrspace(3)* %3459, align 8, !tbaa !40
  %3461 = fadd contract float %3455, %3460
  %3462 = fmul contract float %3460, %3460
  %3463 = fadd contract float %3457, %3462
  %3464 = or i32 %3419, 7
  %3465 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %3464
  %3466 = load float, float addrspace(3)* %3465, align 4, !tbaa !40
  %3467 = fadd contract float %3461, %3466
  %3468 = fmul contract float %3466, %3466
  %3469 = fadd contract float %3463, %3468
  %3470 = add nuw nsw i32 %3419, 8
  %3471 = add i32 %3422, 8
  %3472 = icmp eq i32 %3471, %3364
  br i1 %3472, label %3365, label %3418, !llvm.loop !43

3473:                                             ; preds = %3637, %3385
  %3474 = phi float [ undef, %3385 ], [ %3686, %3637 ]
  %3475 = phi float [ undef, %3385 ], [ %3688, %3637 ]
  %3476 = phi i32 [ 0, %3385 ], [ %3689, %3637 ]
  %3477 = phi float [ 0.000000e+00, %3385 ], [ %3686, %3637 ]
  %3478 = phi float [ 0.000000e+00, %3385 ], [ %3688, %3637 ]
  %3479 = icmp eq i32 %3414, 0
  br i1 %3479, label %3493, label %3480

3480:                                             ; preds = %3473, %3480
  %3481 = phi i32 [ %3490, %3480 ], [ %3476, %3473 ]
  %3482 = phi float [ %3487, %3480 ], [ %3477, %3473 ]
  %3483 = phi float [ %3489, %3480 ], [ %3478, %3473 ]
  %3484 = phi i32 [ %3491, %3480 ], [ 0, %3473 ]
  %3485 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3481
  %3486 = load float, float addrspace(3)* %3485, align 4, !tbaa !40
  %3487 = fadd contract float %3482, %3486
  %3488 = fmul contract float %3486, %3486
  %3489 = fadd contract float %3483, %3488
  %3490 = add nuw nsw i32 %3481, 1
  %3491 = add i32 %3484, 1
  %3492 = icmp eq i32 %3491, %3414
  br i1 %3492, label %3493, label %3480, !llvm.loop !44

3493:                                             ; preds = %3480, %3473
  %3494 = phi float [ %3474, %3473 ], [ %3487, %3480 ]
  %3495 = phi float [ %3475, %3473 ], [ %3489, %3480 ]
  %3496 = fmul contract float %3413, 3.000000e+00
  %3497 = fdiv contract float %3494, %3388
  %3498 = fdiv contract float %3495, %3388
  %3499 = fmul contract float %3497, %3497
  %3500 = fsub contract float %3498, %3499
  %3501 = fcmp olt float %3500, 0x39F0000000000000
  %3502 = select i1 %3501, float 0x41F0000000000000, float 1.000000e+00
  %3503 = fmul float %3500, %3502
  %3504 = tail call float @llvm.sqrt.f32(float %3503)
  %3505 = bitcast float %3504 to i32
  %3506 = add nsw i32 %3505, -1
  %3507 = bitcast i32 %3506 to float
  %3508 = add nsw i32 %3505, 1
  %3509 = bitcast i32 %3508 to float
  %3510 = tail call i1 @llvm.amdgcn.class.f32(float %3503, i32 608)
  %3511 = select i1 %3501, float 0x3EF0000000000000, float 1.000000e+00
  %3512 = fneg float %3509
  %3513 = tail call float @llvm.fma.f32(float %3512, float %3504, float %3503)
  %3514 = fcmp ogt float %3513, 0.000000e+00
  %3515 = fneg float %3507
  %3516 = tail call float @llvm.fma.f32(float %3515, float %3504, float %3503)
  %3517 = fcmp ole float %3516, 0.000000e+00
  %3518 = select i1 %3517, float %3507, float %3504
  %3519 = select i1 %3514, float %3509, float %3518
  %3520 = fmul float %3511, %3519
  %3521 = select i1 %3510, float %3503, float %3520
  %3522 = fmul contract float %3521, 3.000000e+00
  %3523 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE6g_mean, i32 0, i32 %11
  %3524 = load float, float addrspace(3)* %3523, align 4, !tbaa !40
  %3525 = fsub contract float %3524, %3389
  %3526 = fcmp contract ogt float %3525, %3496
  %3527 = fneg contract float %3496
  %3528 = fcmp contract olt float %3525, %3527
  %3529 = or i1 %3526, %3528
  br i1 %3529, label %3530, label %3700

3530:                                             ; preds = %3493
  br i1 %13, label %3963, label %3531

3531:                                             ; preds = %3530
  %3532 = icmp ult i32 %2, 4
  br i1 %3532, label %3635, label %3533

3533:                                             ; preds = %3531
  %3534 = icmp ne i32 %1, 1
  %3535 = add i32 %2, -1
  %3536 = add i32 %12, %3535
  %3537 = icmp slt i32 %3536, %12
  %3538 = or i1 %3534, %3537
  br i1 %3538, label %3635, label %3539

3539:                                             ; preds = %3533
  %3540 = and i32 %2, -4
  %3541 = add i32 %2, -4
  %3542 = lshr i32 %3541, 2
  %3543 = add nuw nsw i32 %3542, 1
  %3544 = and i32 %3543, 7
  %3545 = icmp ult i32 %3541, 28
  br i1 %3545, label %3617, label %3546

3546:                                             ; preds = %3539
  %3547 = and i32 %3543, -8
  br label %3548

3548:                                             ; preds = %3548, %3546
  %3549 = phi i32 [ 0, %3546 ], [ %3614, %3548 ]
  %3550 = phi i32 [ 0, %3546 ], [ %3615, %3548 ]
  %3551 = mul nsw i32 %3549, %1
  %3552 = add nsw i32 %3551, %12
  %3553 = sext i32 %3552 to i64
  %3554 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3553
  %3555 = bitcast i16 addrspace(1)* %3554 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3555, align 2, !tbaa !7
  %3556 = getelementptr inbounds i16, i16 addrspace(1)* %3554, i64 2
  %3557 = bitcast i16 addrspace(1)* %3556 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3557, align 2, !tbaa !7
  %3558 = or i32 %3549, 4
  %3559 = mul nsw i32 %3558, %1
  %3560 = add nsw i32 %3559, %12
  %3561 = sext i32 %3560 to i64
  %3562 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3561
  %3563 = bitcast i16 addrspace(1)* %3562 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3563, align 2, !tbaa !7
  %3564 = getelementptr inbounds i16, i16 addrspace(1)* %3562, i64 2
  %3565 = bitcast i16 addrspace(1)* %3564 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3565, align 2, !tbaa !7
  %3566 = or i32 %3549, 8
  %3567 = mul nsw i32 %3566, %1
  %3568 = add nsw i32 %3567, %12
  %3569 = sext i32 %3568 to i64
  %3570 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3569
  %3571 = bitcast i16 addrspace(1)* %3570 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3571, align 2, !tbaa !7
  %3572 = getelementptr inbounds i16, i16 addrspace(1)* %3570, i64 2
  %3573 = bitcast i16 addrspace(1)* %3572 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3573, align 2, !tbaa !7
  %3574 = or i32 %3549, 12
  %3575 = mul nsw i32 %3574, %1
  %3576 = add nsw i32 %3575, %12
  %3577 = sext i32 %3576 to i64
  %3578 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3577
  %3579 = bitcast i16 addrspace(1)* %3578 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3579, align 2, !tbaa !7
  %3580 = getelementptr inbounds i16, i16 addrspace(1)* %3578, i64 2
  %3581 = bitcast i16 addrspace(1)* %3580 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3581, align 2, !tbaa !7
  %3582 = or i32 %3549, 16
  %3583 = mul nsw i32 %3582, %1
  %3584 = add nsw i32 %3583, %12
  %3585 = sext i32 %3584 to i64
  %3586 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3585
  %3587 = bitcast i16 addrspace(1)* %3586 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3587, align 2, !tbaa !7
  %3588 = getelementptr inbounds i16, i16 addrspace(1)* %3586, i64 2
  %3589 = bitcast i16 addrspace(1)* %3588 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3589, align 2, !tbaa !7
  %3590 = or i32 %3549, 20
  %3591 = mul nsw i32 %3590, %1
  %3592 = add nsw i32 %3591, %12
  %3593 = sext i32 %3592 to i64
  %3594 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3593
  %3595 = bitcast i16 addrspace(1)* %3594 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3595, align 2, !tbaa !7
  %3596 = getelementptr inbounds i16, i16 addrspace(1)* %3594, i64 2
  %3597 = bitcast i16 addrspace(1)* %3596 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3597, align 2, !tbaa !7
  %3598 = or i32 %3549, 24
  %3599 = mul nsw i32 %3598, %1
  %3600 = add nsw i32 %3599, %12
  %3601 = sext i32 %3600 to i64
  %3602 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3601
  %3603 = bitcast i16 addrspace(1)* %3602 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3603, align 2, !tbaa !7
  %3604 = getelementptr inbounds i16, i16 addrspace(1)* %3602, i64 2
  %3605 = bitcast i16 addrspace(1)* %3604 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3605, align 2, !tbaa !7
  %3606 = or i32 %3549, 28
  %3607 = mul nsw i32 %3606, %1
  %3608 = add nsw i32 %3607, %12
  %3609 = sext i32 %3608 to i64
  %3610 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3609
  %3611 = bitcast i16 addrspace(1)* %3610 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3611, align 2, !tbaa !7
  %3612 = getelementptr inbounds i16, i16 addrspace(1)* %3610, i64 2
  %3613 = bitcast i16 addrspace(1)* %3612 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3613, align 2, !tbaa !7
  %3614 = add nuw i32 %3549, 32
  %3615 = add i32 %3550, 8
  %3616 = icmp eq i32 %3615, %3547
  br i1 %3616, label %3617, label %3548, !llvm.loop !45

3617:                                             ; preds = %3548, %3539
  %3618 = phi i32 [ 0, %3539 ], [ %3614, %3548 ]
  %3619 = icmp eq i32 %3544, 0
  br i1 %3619, label %3633, label %3620

3620:                                             ; preds = %3617, %3620
  %3621 = phi i32 [ %3630, %3620 ], [ %3618, %3617 ]
  %3622 = phi i32 [ %3631, %3620 ], [ 0, %3617 ]
  %3623 = mul nsw i32 %3621, %1
  %3624 = add nsw i32 %3623, %12
  %3625 = sext i32 %3624 to i64
  %3626 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3625
  %3627 = bitcast i16 addrspace(1)* %3626 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3627, align 2, !tbaa !7
  %3628 = getelementptr inbounds i16, i16 addrspace(1)* %3626, i64 2
  %3629 = bitcast i16 addrspace(1)* %3628 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3629, align 2, !tbaa !7
  %3630 = add nuw i32 %3621, 4
  %3631 = add i32 %3622, 1
  %3632 = icmp eq i32 %3631, %3544
  br i1 %3632, label %3633, label %3620, !llvm.loop !46

3633:                                             ; preds = %3620, %3617
  %3634 = icmp eq i32 %3540, %2
  br i1 %3634, label %3963, label %3635

3635:                                             ; preds = %3533, %3531, %3633
  %3636 = phi i32 [ 0, %3533 ], [ 0, %3531 ], [ %3540, %3633 ]
  br label %3692

3637:                                             ; preds = %3637, %3416
  %3638 = phi i32 [ 0, %3416 ], [ %3689, %3637 ]
  %3639 = phi float [ 0.000000e+00, %3416 ], [ %3686, %3637 ]
  %3640 = phi float [ 0.000000e+00, %3416 ], [ %3688, %3637 ]
  %3641 = phi i32 [ 0, %3416 ], [ %3690, %3637 ]
  %3642 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3638
  %3643 = load float, float addrspace(3)* %3642, align 16, !tbaa !40
  %3644 = fadd contract float %3639, %3643
  %3645 = fmul contract float %3643, %3643
  %3646 = fadd contract float %3640, %3645
  %3647 = or i32 %3638, 1
  %3648 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3647
  %3649 = load float, float addrspace(3)* %3648, align 4, !tbaa !40
  %3650 = fadd contract float %3644, %3649
  %3651 = fmul contract float %3649, %3649
  %3652 = fadd contract float %3646, %3651
  %3653 = or i32 %3638, 2
  %3654 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3653
  %3655 = load float, float addrspace(3)* %3654, align 8, !tbaa !40
  %3656 = fadd contract float %3650, %3655
  %3657 = fmul contract float %3655, %3655
  %3658 = fadd contract float %3652, %3657
  %3659 = or i32 %3638, 3
  %3660 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3659
  %3661 = load float, float addrspace(3)* %3660, align 4, !tbaa !40
  %3662 = fadd contract float %3656, %3661
  %3663 = fmul contract float %3661, %3661
  %3664 = fadd contract float %3658, %3663
  %3665 = or i32 %3638, 4
  %3666 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3665
  %3667 = load float, float addrspace(3)* %3666, align 16, !tbaa !40
  %3668 = fadd contract float %3662, %3667
  %3669 = fmul contract float %3667, %3667
  %3670 = fadd contract float %3664, %3669
  %3671 = or i32 %3638, 5
  %3672 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3671
  %3673 = load float, float addrspace(3)* %3672, align 4, !tbaa !40
  %3674 = fadd contract float %3668, %3673
  %3675 = fmul contract float %3673, %3673
  %3676 = fadd contract float %3670, %3675
  %3677 = or i32 %3638, 6
  %3678 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3677
  %3679 = load float, float addrspace(3)* %3678, align 8, !tbaa !40
  %3680 = fadd contract float %3674, %3679
  %3681 = fmul contract float %3679, %3679
  %3682 = fadd contract float %3676, %3681
  %3683 = or i32 %3638, 7
  %3684 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %3683
  %3685 = load float, float addrspace(3)* %3684, align 4, !tbaa !40
  %3686 = fadd contract float %3680, %3685
  %3687 = fmul contract float %3685, %3685
  %3688 = fadd contract float %3682, %3687
  %3689 = add nuw nsw i32 %3638, 8
  %3690 = add i32 %3641, 8
  %3691 = icmp eq i32 %3690, %3417
  br i1 %3691, label %3473, label %3637, !llvm.loop !47

3692:                                             ; preds = %3635, %3692
  %3693 = phi i32 [ %3698, %3692 ], [ %3636, %3635 ]
  %3694 = mul nsw i32 %3693, %1
  %3695 = add nsw i32 %3694, %12
  %3696 = sext i32 %3695 to i64
  %3697 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3696
  store i16 127, i16 addrspace(1)* %3697, align 2, !tbaa !7
  %3698 = add nuw nsw i32 %3693, 1
  %3699 = icmp eq i32 %3698, %2
  br i1 %3699, label %3963, label %3692, !llvm.loop !48

3700:                                             ; preds = %3493
  %3701 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ27zero_dm_outliers_kernel_twoPtiiE7g_stdev, i32 0, i32 %11
  %3702 = load float, float addrspace(3)* %3701, align 4, !tbaa !40
  %3703 = fsub contract float %3702, %3497
  %3704 = fcmp contract ogt float %3703, %3522
  %3705 = fneg contract float %3522
  %3706 = fcmp contract olt float %3703, %3705
  %3707 = or i1 %3704, %3706
  br i1 %3707, label %3831, label %3708

3708:                                             ; preds = %3700
  br i1 %13, label %3963, label %3709

3709:                                             ; preds = %3708
  %3710 = fmul contract float %3358, 4.000000e+00
  %3711 = fmul contract float %3358, -4.000000e+00
  %3712 = icmp ult i32 %2, 4
  br i1 %3712, label %3829, label %3713

3713:                                             ; preds = %3709
  %3714 = icmp ne i32 %1, 1
  %3715 = add i32 %2, -1
  %3716 = add i32 %12, %3715
  %3717 = icmp slt i32 %3716, %12
  %3718 = or i1 %3714, %3717
  br i1 %3718, label %3829, label %3719

3719:                                             ; preds = %3713
  %3720 = and i32 %2, -2
  %3721 = insertelement <2 x float> poison, float %3357, i64 0
  %3722 = shufflevector <2 x float> %3721, <2 x float> poison, <2 x i32> zeroinitializer
  %3723 = insertelement <2 x float> poison, float %3710, i64 0
  %3724 = shufflevector <2 x float> %3723, <2 x float> poison, <2 x i32> zeroinitializer
  %3725 = insertelement <2 x float> poison, float %3711, i64 0
  %3726 = shufflevector <2 x float> %3725, <2 x float> poison, <2 x i32> zeroinitializer
  %3727 = add i32 %2, -2
  %3728 = lshr i32 %3727, 1
  %3729 = add nuw i32 %3728, 1
  %3730 = and i32 %3729, 3
  %3731 = icmp ult i32 %3727, 6
  br i1 %3731, label %3803, label %3732

3732:                                             ; preds = %3719
  %3733 = and i32 %3729, -4
  br label %3734

3734:                                             ; preds = %3734, %3732
  %3735 = phi i32 [ 0, %3732 ], [ %3800, %3734 ]
  %3736 = phi i32 [ 0, %3732 ], [ %3801, %3734 ]
  %3737 = mul nsw i32 %3735, %1
  %3738 = add nsw i32 %3737, %12
  %3739 = sext i32 %3738 to i64
  %3740 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3739
  %3741 = bitcast i16 addrspace(1)* %3740 to <2 x i16> addrspace(1)*
  %3742 = load <2 x i16>, <2 x i16> addrspace(1)* %3741, align 2, !tbaa !7
  %3743 = uitofp <2 x i16> %3742 to <2 x float>
  %3744 = fsub contract <2 x float> %3743, %3722
  %3745 = fcmp contract olt <2 x float> %3744, %3724
  %3746 = fcmp contract ogt <2 x float> %3744, %3726
  %3747 = and <2 x i1> %3745, %3746
  %3748 = fadd contract <2 x float> %3744, <float 1.275000e+02, float 1.275000e+02>
  %3749 = fptoui <2 x float> %3748 to <2 x i16>
  %3750 = select <2 x i1> %3747, <2 x i16> %3749, <2 x i16> <i16 127, i16 127>
  %3751 = bitcast i16 addrspace(1)* %3740 to <2 x i16> addrspace(1)*
  store <2 x i16> %3750, <2 x i16> addrspace(1)* %3751, align 2, !tbaa !7
  %3752 = or i32 %3735, 2
  %3753 = mul nsw i32 %3752, %1
  %3754 = add nsw i32 %3753, %12
  %3755 = sext i32 %3754 to i64
  %3756 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3755
  %3757 = bitcast i16 addrspace(1)* %3756 to <2 x i16> addrspace(1)*
  %3758 = load <2 x i16>, <2 x i16> addrspace(1)* %3757, align 2, !tbaa !7
  %3759 = uitofp <2 x i16> %3758 to <2 x float>
  %3760 = fsub contract <2 x float> %3759, %3722
  %3761 = fcmp contract olt <2 x float> %3760, %3724
  %3762 = fcmp contract ogt <2 x float> %3760, %3726
  %3763 = and <2 x i1> %3761, %3762
  %3764 = fadd contract <2 x float> %3760, <float 1.275000e+02, float 1.275000e+02>
  %3765 = fptoui <2 x float> %3764 to <2 x i16>
  %3766 = select <2 x i1> %3763, <2 x i16> %3765, <2 x i16> <i16 127, i16 127>
  %3767 = bitcast i16 addrspace(1)* %3756 to <2 x i16> addrspace(1)*
  store <2 x i16> %3766, <2 x i16> addrspace(1)* %3767, align 2, !tbaa !7
  %3768 = or i32 %3735, 4
  %3769 = mul nsw i32 %3768, %1
  %3770 = add nsw i32 %3769, %12
  %3771 = sext i32 %3770 to i64
  %3772 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3771
  %3773 = bitcast i16 addrspace(1)* %3772 to <2 x i16> addrspace(1)*
  %3774 = load <2 x i16>, <2 x i16> addrspace(1)* %3773, align 2, !tbaa !7
  %3775 = uitofp <2 x i16> %3774 to <2 x float>
  %3776 = fsub contract <2 x float> %3775, %3722
  %3777 = fcmp contract olt <2 x float> %3776, %3724
  %3778 = fcmp contract ogt <2 x float> %3776, %3726
  %3779 = and <2 x i1> %3777, %3778
  %3780 = fadd contract <2 x float> %3776, <float 1.275000e+02, float 1.275000e+02>
  %3781 = fptoui <2 x float> %3780 to <2 x i16>
  %3782 = select <2 x i1> %3779, <2 x i16> %3781, <2 x i16> <i16 127, i16 127>
  %3783 = bitcast i16 addrspace(1)* %3772 to <2 x i16> addrspace(1)*
  store <2 x i16> %3782, <2 x i16> addrspace(1)* %3783, align 2, !tbaa !7
  %3784 = or i32 %3735, 6
  %3785 = mul nsw i32 %3784, %1
  %3786 = add nsw i32 %3785, %12
  %3787 = sext i32 %3786 to i64
  %3788 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3787
  %3789 = bitcast i16 addrspace(1)* %3788 to <2 x i16> addrspace(1)*
  %3790 = load <2 x i16>, <2 x i16> addrspace(1)* %3789, align 2, !tbaa !7
  %3791 = uitofp <2 x i16> %3790 to <2 x float>
  %3792 = fsub contract <2 x float> %3791, %3722
  %3793 = fcmp contract olt <2 x float> %3792, %3724
  %3794 = fcmp contract ogt <2 x float> %3792, %3726
  %3795 = and <2 x i1> %3793, %3794
  %3796 = fadd contract <2 x float> %3792, <float 1.275000e+02, float 1.275000e+02>
  %3797 = fptoui <2 x float> %3796 to <2 x i16>
  %3798 = select <2 x i1> %3795, <2 x i16> %3797, <2 x i16> <i16 127, i16 127>
  %3799 = bitcast i16 addrspace(1)* %3788 to <2 x i16> addrspace(1)*
  store <2 x i16> %3798, <2 x i16> addrspace(1)* %3799, align 2, !tbaa !7
  %3800 = add nuw i32 %3735, 8
  %3801 = add i32 %3736, 4
  %3802 = icmp eq i32 %3801, %3733
  br i1 %3802, label %3803, label %3734, !llvm.loop !49

3803:                                             ; preds = %3734, %3719
  %3804 = phi i32 [ 0, %3719 ], [ %3800, %3734 ]
  %3805 = icmp eq i32 %3730, 0
  br i1 %3805, label %3827, label %3806

3806:                                             ; preds = %3803, %3806
  %3807 = phi i32 [ %3824, %3806 ], [ %3804, %3803 ]
  %3808 = phi i32 [ %3825, %3806 ], [ 0, %3803 ]
  %3809 = mul nsw i32 %3807, %1
  %3810 = add nsw i32 %3809, %12
  %3811 = sext i32 %3810 to i64
  %3812 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3811
  %3813 = bitcast i16 addrspace(1)* %3812 to <2 x i16> addrspace(1)*
  %3814 = load <2 x i16>, <2 x i16> addrspace(1)* %3813, align 2, !tbaa !7
  %3815 = uitofp <2 x i16> %3814 to <2 x float>
  %3816 = fsub contract <2 x float> %3815, %3722
  %3817 = fcmp contract olt <2 x float> %3816, %3724
  %3818 = fcmp contract ogt <2 x float> %3816, %3726
  %3819 = and <2 x i1> %3817, %3818
  %3820 = fadd contract <2 x float> %3816, <float 1.275000e+02, float 1.275000e+02>
  %3821 = fptoui <2 x float> %3820 to <2 x i16>
  %3822 = select <2 x i1> %3819, <2 x i16> %3821, <2 x i16> <i16 127, i16 127>
  %3823 = bitcast i16 addrspace(1)* %3812 to <2 x i16> addrspace(1)*
  store <2 x i16> %3822, <2 x i16> addrspace(1)* %3823, align 2, !tbaa !7
  %3824 = add nuw i32 %3807, 2
  %3825 = add i32 %3808, 1
  %3826 = icmp eq i32 %3825, %3730
  br i1 %3826, label %3827, label %3806, !llvm.loop !50

3827:                                             ; preds = %3806, %3803
  %3828 = icmp eq i32 %3720, %2
  br i1 %3828, label %3963, label %3829

3829:                                             ; preds = %3713, %3709, %3827
  %3830 = phi i32 [ 0, %3713 ], [ 0, %3709 ], [ %3720, %3827 ]
  br label %3946

3831:                                             ; preds = %3700
  br i1 %13, label %3963, label %3832

3832:                                             ; preds = %3831
  %3833 = icmp ult i32 %2, 4
  br i1 %3833, label %3936, label %3834

3834:                                             ; preds = %3832
  %3835 = icmp ne i32 %1, 1
  %3836 = add i32 %2, -1
  %3837 = add i32 %12, %3836
  %3838 = icmp slt i32 %3837, %12
  %3839 = or i1 %3835, %3838
  br i1 %3839, label %3936, label %3840

3840:                                             ; preds = %3834
  %3841 = and i32 %2, -4
  %3842 = add i32 %2, -4
  %3843 = lshr i32 %3842, 2
  %3844 = add nuw nsw i32 %3843, 1
  %3845 = and i32 %3844, 7
  %3846 = icmp ult i32 %3842, 28
  br i1 %3846, label %3918, label %3847

3847:                                             ; preds = %3840
  %3848 = and i32 %3844, -8
  br label %3849

3849:                                             ; preds = %3849, %3847
  %3850 = phi i32 [ 0, %3847 ], [ %3915, %3849 ]
  %3851 = phi i32 [ 0, %3847 ], [ %3916, %3849 ]
  %3852 = mul nsw i32 %3850, %1
  %3853 = add nsw i32 %3852, %12
  %3854 = sext i32 %3853 to i64
  %3855 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3854
  %3856 = bitcast i16 addrspace(1)* %3855 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3856, align 2, !tbaa !7
  %3857 = getelementptr inbounds i16, i16 addrspace(1)* %3855, i64 2
  %3858 = bitcast i16 addrspace(1)* %3857 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3858, align 2, !tbaa !7
  %3859 = or i32 %3850, 4
  %3860 = mul nsw i32 %3859, %1
  %3861 = add nsw i32 %3860, %12
  %3862 = sext i32 %3861 to i64
  %3863 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3862
  %3864 = bitcast i16 addrspace(1)* %3863 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3864, align 2, !tbaa !7
  %3865 = getelementptr inbounds i16, i16 addrspace(1)* %3863, i64 2
  %3866 = bitcast i16 addrspace(1)* %3865 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3866, align 2, !tbaa !7
  %3867 = or i32 %3850, 8
  %3868 = mul nsw i32 %3867, %1
  %3869 = add nsw i32 %3868, %12
  %3870 = sext i32 %3869 to i64
  %3871 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3870
  %3872 = bitcast i16 addrspace(1)* %3871 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3872, align 2, !tbaa !7
  %3873 = getelementptr inbounds i16, i16 addrspace(1)* %3871, i64 2
  %3874 = bitcast i16 addrspace(1)* %3873 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3874, align 2, !tbaa !7
  %3875 = or i32 %3850, 12
  %3876 = mul nsw i32 %3875, %1
  %3877 = add nsw i32 %3876, %12
  %3878 = sext i32 %3877 to i64
  %3879 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3878
  %3880 = bitcast i16 addrspace(1)* %3879 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3880, align 2, !tbaa !7
  %3881 = getelementptr inbounds i16, i16 addrspace(1)* %3879, i64 2
  %3882 = bitcast i16 addrspace(1)* %3881 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3882, align 2, !tbaa !7
  %3883 = or i32 %3850, 16
  %3884 = mul nsw i32 %3883, %1
  %3885 = add nsw i32 %3884, %12
  %3886 = sext i32 %3885 to i64
  %3887 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3886
  %3888 = bitcast i16 addrspace(1)* %3887 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3888, align 2, !tbaa !7
  %3889 = getelementptr inbounds i16, i16 addrspace(1)* %3887, i64 2
  %3890 = bitcast i16 addrspace(1)* %3889 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3890, align 2, !tbaa !7
  %3891 = or i32 %3850, 20
  %3892 = mul nsw i32 %3891, %1
  %3893 = add nsw i32 %3892, %12
  %3894 = sext i32 %3893 to i64
  %3895 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3894
  %3896 = bitcast i16 addrspace(1)* %3895 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3896, align 2, !tbaa !7
  %3897 = getelementptr inbounds i16, i16 addrspace(1)* %3895, i64 2
  %3898 = bitcast i16 addrspace(1)* %3897 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3898, align 2, !tbaa !7
  %3899 = or i32 %3850, 24
  %3900 = mul nsw i32 %3899, %1
  %3901 = add nsw i32 %3900, %12
  %3902 = sext i32 %3901 to i64
  %3903 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3902
  %3904 = bitcast i16 addrspace(1)* %3903 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3904, align 2, !tbaa !7
  %3905 = getelementptr inbounds i16, i16 addrspace(1)* %3903, i64 2
  %3906 = bitcast i16 addrspace(1)* %3905 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3906, align 2, !tbaa !7
  %3907 = or i32 %3850, 28
  %3908 = mul nsw i32 %3907, %1
  %3909 = add nsw i32 %3908, %12
  %3910 = sext i32 %3909 to i64
  %3911 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3910
  %3912 = bitcast i16 addrspace(1)* %3911 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3912, align 2, !tbaa !7
  %3913 = getelementptr inbounds i16, i16 addrspace(1)* %3911, i64 2
  %3914 = bitcast i16 addrspace(1)* %3913 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3914, align 2, !tbaa !7
  %3915 = add nuw i32 %3850, 32
  %3916 = add i32 %3851, 8
  %3917 = icmp eq i32 %3916, %3848
  br i1 %3917, label %3918, label %3849, !llvm.loop !51

3918:                                             ; preds = %3849, %3840
  %3919 = phi i32 [ 0, %3840 ], [ %3915, %3849 ]
  %3920 = icmp eq i32 %3845, 0
  br i1 %3920, label %3934, label %3921

3921:                                             ; preds = %3918, %3921
  %3922 = phi i32 [ %3931, %3921 ], [ %3919, %3918 ]
  %3923 = phi i32 [ %3932, %3921 ], [ 0, %3918 ]
  %3924 = mul nsw i32 %3922, %1
  %3925 = add nsw i32 %3924, %12
  %3926 = sext i32 %3925 to i64
  %3927 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3926
  %3928 = bitcast i16 addrspace(1)* %3927 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3928, align 2, !tbaa !7
  %3929 = getelementptr inbounds i16, i16 addrspace(1)* %3927, i64 2
  %3930 = bitcast i16 addrspace(1)* %3929 to <2 x i16> addrspace(1)*
  store <2 x i16> <i16 127, i16 127>, <2 x i16> addrspace(1)* %3930, align 2, !tbaa !7
  %3931 = add nuw i32 %3922, 4
  %3932 = add i32 %3923, 1
  %3933 = icmp eq i32 %3932, %3845
  br i1 %3933, label %3934, label %3921, !llvm.loop !52

3934:                                             ; preds = %3921, %3918
  %3935 = icmp eq i32 %3841, %2
  br i1 %3935, label %3963, label %3936

3936:                                             ; preds = %3834, %3832, %3934
  %3937 = phi i32 [ 0, %3834 ], [ 0, %3832 ], [ %3841, %3934 ]
  br label %3938

3938:                                             ; preds = %3936, %3938
  %3939 = phi i32 [ %3944, %3938 ], [ %3937, %3936 ]
  %3940 = mul nsw i32 %3939, %1
  %3941 = add nsw i32 %3940, %12
  %3942 = sext i32 %3941 to i64
  %3943 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3942
  store i16 127, i16 addrspace(1)* %3943, align 2, !tbaa !7
  %3944 = add nuw nsw i32 %3939, 1
  %3945 = icmp eq i32 %3944, %2
  br i1 %3945, label %3963, label %3938, !llvm.loop !53

3946:                                             ; preds = %3829, %3946
  %3947 = phi i32 [ %3961, %3946 ], [ %3830, %3829 ]
  %3948 = mul nsw i32 %3947, %1
  %3949 = add nsw i32 %3948, %12
  %3950 = sext i32 %3949 to i64
  %3951 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %3950
  %3952 = load i16, i16 addrspace(1)* %3951, align 2, !tbaa !7
  %3953 = uitofp i16 %3952 to float
  %3954 = fsub contract float %3953, %3357
  %3955 = fcmp contract olt float %3954, %3710
  %3956 = fcmp contract ogt float %3954, %3711
  %3957 = and i1 %3955, %3956
  %3958 = fadd contract float %3954, 1.275000e+02
  %3959 = fptoui float %3958 to i16
  %3960 = select i1 %3957, i16 %3959, i16 127
  store i16 %3960, i16 addrspace(1)* %3951, align 2, !tbaa !7
  %3961 = add nuw nsw i32 %3947, 1
  %3962 = icmp eq i32 %3961, %2
  br i1 %3962, label %3963, label %3946, !llvm.loop !54

3963:                                             ; preds = %3946, %3938, %3692, %3827, %3934, %3633, %3708, %3831, %3530
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !14}
!28 = distinct !{!28, !14}
!29 = distinct !{!29, !14}
!30 = distinct !{!30, !14}
!31 = distinct !{!31, !14}
!32 = distinct !{!32, !14}
!33 = distinct !{!33, !14}
!34 = distinct !{!34, !14}
!35 = distinct !{!35, !14}
!36 = distinct !{!36, !12, !37}
!37 = !{!"llvm.loop.isvectorized", i32 1}
!38 = distinct !{!38, !14}
!39 = distinct !{!39, !12, !37}
!40 = !{!41, !41, i64 0}
!41 = !{!"float", !9, i64 0}
!42 = distinct !{!42, !14}
!43 = distinct !{!43, !12}
!44 = distinct !{!44, !14}
!45 = distinct !{!45, !12, !37}
!46 = distinct !{!46, !14}
!47 = distinct !{!47, !12}
!48 = distinct !{!48, !12, !37}
!49 = distinct !{!49, !12, !37}
!50 = distinct !{!50, !14}
!51 = distinct !{!51, !12, !37}
!52 = distinct !{!52, !14}
!53 = distinct !{!53, !12, !37}
!54 = distinct !{!54, !12, !37}
