; ModuleID = '../data/hip_kernels/10483/17/main.cu'
source_filename = "../data/hip_kernels/10483/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17computePathStatesiiiiiffPiiPfS0_S0_iS_iS0_S0_S0_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float %5, float %6, i32 addrspace(1)* nocapture readonly %7, i32 %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 %12, i32 addrspace(1)* nocapture readonly %13, i32 %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture writeonly %17, i32 addrspace(1)* nocapture writeonly %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %20, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %0
  br i1 %29, label %30, label %410

30:                                               ; preds = %19
  %31 = add i32 %1, -1
  %32 = icmp sgt i32 %1, 1
  br i1 %32, label %33, label %67

33:                                               ; preds = %30
  %34 = add nsw i32 %2, 1
  %35 = mul i32 %28, %34
  %36 = add i32 %35, %4
  %37 = mul i32 %36, %31
  %38 = add nsw i32 %3, -1
  %39 = mul nsw i32 %28, %1
  %40 = add i32 %1, -2
  %41 = and i32 %31, 3
  %42 = icmp ult i32 %40, 3
  br i1 %42, label %45, label %43

43:                                               ; preds = %33
  %44 = and i32 %31, -4
  br label %78

45:                                               ; preds = %78, %33
  %46 = phi i32 [ 0, %33 ], [ %136, %78 ]
  %47 = icmp eq i32 %41, 0
  br i1 %47, label %67, label %48

48:                                               ; preds = %45, %48
  %49 = phi i32 [ %64, %48 ], [ %46, %45 ]
  %50 = phi i32 [ %65, %48 ], [ 0, %45 ]
  %51 = add i32 %49, %37
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %16, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = mul i32 %51, %3
  %56 = add i32 %38, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %15, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %54, %59
  %61 = add nsw i32 %49, %39
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %17, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nuw nsw i32 %49, 1
  %65 = add i32 %50, 1
  %66 = icmp eq i32 %65, %41
  br i1 %66, label %67, label %48, !llvm.loop !11

67:                                               ; preds = %45, %48, %30
  %68 = icmp sgt i32 %8, 0
  br i1 %68, label %69, label %162

69:                                               ; preds = %67
  %70 = add nsw i32 %2, 1
  %71 = mul nsw i32 %28, %70
  %72 = add i32 %71, %4
  %73 = mul i32 %72, %12
  %74 = and i32 %8, 7
  %75 = icmp ult i32 %8, 8
  br i1 %75, label %139, label %76

76:                                               ; preds = %69
  %77 = and i32 %8, -8
  br label %178

78:                                               ; preds = %78, %43
  %79 = phi i32 [ 0, %43 ], [ %136, %78 ]
  %80 = phi i32 [ 0, %43 ], [ %137, %78 ]
  %81 = add i32 %79, %37
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %16, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = mul i32 %81, %3
  %86 = add i32 %38, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %15, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = fmul contract float %84, %89
  %91 = add nsw i32 %79, %39
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %17, i64 %92
  store float %90, float addrspace(1)* %93, align 4, !tbaa !7
  %94 = or i32 %79, 1
  %95 = add i32 %94, %37
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %16, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = mul i32 %95, %3
  %100 = add i32 %38, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %15, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = fmul contract float %98, %103
  %105 = add nsw i32 %94, %39
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %17, i64 %106
  store float %104, float addrspace(1)* %107, align 4, !tbaa !7
  %108 = or i32 %79, 2
  %109 = add i32 %108, %37
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %16, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = mul i32 %109, %3
  %114 = add i32 %38, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %15, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fmul contract float %112, %117
  %119 = add nsw i32 %108, %39
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %17, i64 %120
  store float %118, float addrspace(1)* %121, align 4, !tbaa !7
  %122 = or i32 %79, 3
  %123 = add i32 %122, %37
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %16, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = mul i32 %123, %3
  %128 = add i32 %38, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %15, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %126, %131
  %133 = add nsw i32 %122, %39
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %17, i64 %134
  store float %132, float addrspace(1)* %135, align 4, !tbaa !7
  %136 = add nuw nsw i32 %79, 4
  %137 = add i32 %80, 4
  %138 = icmp eq i32 %137, %44
  br i1 %138, label %45, label %78, !llvm.loop !13

139:                                              ; preds = %178, %69
  %140 = phi float [ undef, %69 ], [ %276, %178 ]
  %141 = phi i32 [ 0, %69 ], [ %277, %178 ]
  %142 = phi float [ 0.000000e+00, %69 ], [ %276, %178 ]
  %143 = icmp eq i32 %74, 0
  br i1 %143, label %162, label %144

144:                                              ; preds = %139, %144
  %145 = phi i32 [ %159, %144 ], [ %141, %139 ]
  %146 = phi float [ %158, %144 ], [ %142, %139 ]
  %147 = phi i32 [ %160, %144 ], [ 0, %139 ]
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %9, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %148
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !15, !amdgpu.noclobber !5
  %153 = add nsw i32 %152, %73
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %10, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fmul contract float %150, %156
  %158 = fadd contract float %146, %157
  %159 = add nuw nsw i32 %145, 1
  %160 = add i32 %147, 1
  %161 = icmp eq i32 %160, %74
  br i1 %161, label %162, label %144, !llvm.loop !17

162:                                              ; preds = %139, %144, %67
  %163 = phi float [ 0.000000e+00, %67 ], [ %140, %139 ], [ %158, %144 ]
  %164 = icmp sgt i32 %14, 0
  %165 = mul nsw i32 %28, %2
  %166 = add i32 %165, %4
  br i1 %164, label %167, label %302

167:                                              ; preds = %162
  %168 = mul i32 %166, %14
  %169 = add nsw i32 %2, 1
  %170 = mul nsw i32 %28, %169
  %171 = add i32 %170, %4
  %172 = mul i32 %171, %12
  %173 = add nsw i32 %172, %8
  %174 = and i32 %14, 7
  %175 = icmp ult i32 %14, 8
  br i1 %175, label %280, label %176

176:                                              ; preds = %167
  %177 = and i32 %14, -8
  br label %316

178:                                              ; preds = %178, %76
  %179 = phi i32 [ 0, %76 ], [ %277, %178 ]
  %180 = phi float [ 0.000000e+00, %76 ], [ %276, %178 ]
  %181 = phi i32 [ 0, %76 ], [ %278, %178 ]
  %182 = zext i32 %179 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %9, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %182
  %186 = load i32, i32 addrspace(1)* %185, align 4, !tbaa !15, !amdgpu.noclobber !5
  %187 = add nsw i32 %186, %73
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %10, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7
  %191 = fmul contract float %184, %190
  %192 = fadd contract float %180, %191
  %193 = or i32 %179, 1
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %9, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %194
  %198 = load i32, i32 addrspace(1)* %197, align 4, !tbaa !15, !amdgpu.noclobber !5
  %199 = add nsw i32 %198, %73
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %10, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7
  %203 = fmul contract float %196, %202
  %204 = fadd contract float %192, %203
  %205 = or i32 %179, 2
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %9, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %206
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !15, !amdgpu.noclobber !5
  %211 = add nsw i32 %210, %73
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %10, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = fmul contract float %208, %214
  %216 = fadd contract float %204, %215
  %217 = or i32 %179, 3
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %9, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %218
  %222 = load i32, i32 addrspace(1)* %221, align 4, !tbaa !15, !amdgpu.noclobber !5
  %223 = add nsw i32 %222, %73
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %10, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %220, %226
  %228 = fadd contract float %216, %227
  %229 = or i32 %179, 4
  %230 = zext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %9, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7
  %233 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %230
  %234 = load i32, i32 addrspace(1)* %233, align 4, !tbaa !15, !amdgpu.noclobber !5
  %235 = add nsw i32 %234, %73
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %10, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = fmul contract float %232, %238
  %240 = fadd contract float %228, %239
  %241 = or i32 %179, 5
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %9, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %242
  %246 = load i32, i32 addrspace(1)* %245, align 4, !tbaa !15, !amdgpu.noclobber !5
  %247 = add nsw i32 %246, %73
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %10, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = fmul contract float %244, %250
  %252 = fadd contract float %240, %251
  %253 = or i32 %179, 6
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %9, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !7
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %254
  %258 = load i32, i32 addrspace(1)* %257, align 4, !tbaa !15, !amdgpu.noclobber !5
  %259 = add nsw i32 %258, %73
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %10, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = fmul contract float %256, %262
  %264 = fadd contract float %252, %263
  %265 = or i32 %179, 7
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %9, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !7
  %269 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %266
  %270 = load i32, i32 addrspace(1)* %269, align 4, !tbaa !15, !amdgpu.noclobber !5
  %271 = add nsw i32 %270, %73
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %10, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = fmul contract float %268, %274
  %276 = fadd contract float %264, %275
  %277 = add nuw nsw i32 %179, 8
  %278 = add i32 %181, 8
  %279 = icmp eq i32 %278, %77
  br i1 %279, label %139, label %178, !llvm.loop !18

280:                                              ; preds = %316, %167
  %281 = phi float [ undef, %167 ], [ %406, %316 ]
  %282 = phi i32 [ 0, %167 ], [ %407, %316 ]
  %283 = phi float [ 0.000000e+00, %167 ], [ %406, %316 ]
  %284 = icmp eq i32 %174, 0
  br i1 %284, label %302, label %285

285:                                              ; preds = %280, %285
  %286 = phi i32 [ %299, %285 ], [ %282, %280 ]
  %287 = phi float [ %298, %285 ], [ %283, %280 ]
  %288 = phi i32 [ %300, %285 ], [ 0, %280 ]
  %289 = add nsw i32 %286, %168
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %11, i64 %290
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !7
  %293 = add nsw i32 %173, %286
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %10, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !7
  %297 = fmul contract float %292, %296
  %298 = fadd contract float %287, %297
  %299 = add nuw nsw i32 %286, 1
  %300 = add i32 %288, 1
  %301 = icmp eq i32 %300, %174
  br i1 %301, label %302, label %285, !llvm.loop !19

302:                                              ; preds = %280, %285, %162
  %303 = phi float [ 0.000000e+00, %162 ], [ %281, %280 ], [ %298, %285 ]
  %304 = fadd contract float %163, %5
  %305 = fmul contract float %303, %6
  %306 = fsub contract float %304, %305
  %307 = mul nsw i32 %28, %1
  %308 = add i32 %31, %307
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %17, i64 %309
  store float %306, float addrspace(1)* %310, align 4, !tbaa !7
  %311 = sext i32 %166 to i64
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %311
  %313 = load i32, i32 addrspace(1)* %312, align 4, !tbaa !15, !amdgpu.noclobber !5
  %314 = sext i32 %28 to i64
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %314
  store i32 %313, i32 addrspace(1)* %315, align 4, !tbaa !15
  br label %410

316:                                              ; preds = %316, %176
  %317 = phi i32 [ 0, %176 ], [ %407, %316 ]
  %318 = phi float [ 0.000000e+00, %176 ], [ %406, %316 ]
  %319 = phi i32 [ 0, %176 ], [ %408, %316 ]
  %320 = add nsw i32 %317, %168
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %11, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !7
  %324 = add nsw i32 %173, %317
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %10, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !7
  %328 = fmul contract float %323, %327
  %329 = fadd contract float %318, %328
  %330 = or i32 %317, 1
  %331 = add nsw i32 %330, %168
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %11, i64 %332
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7
  %335 = add nsw i32 %173, %330
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %10, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7
  %339 = fmul contract float %334, %338
  %340 = fadd contract float %329, %339
  %341 = or i32 %317, 2
  %342 = add nsw i32 %341, %168
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %11, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7
  %346 = add nsw i32 %173, %341
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %10, i64 %347
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !7
  %350 = fmul contract float %345, %349
  %351 = fadd contract float %340, %350
  %352 = or i32 %317, 3
  %353 = add nsw i32 %352, %168
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %11, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7
  %357 = add nsw i32 %173, %352
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %10, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7
  %361 = fmul contract float %356, %360
  %362 = fadd contract float %351, %361
  %363 = or i32 %317, 4
  %364 = add nsw i32 %363, %168
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %11, i64 %365
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !7
  %368 = add nsw i32 %173, %363
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %10, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7
  %372 = fmul contract float %367, %371
  %373 = fadd contract float %362, %372
  %374 = or i32 %317, 5
  %375 = add nsw i32 %374, %168
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %11, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = add nsw i32 %173, %374
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds float, float addrspace(1)* %10, i64 %380
  %382 = load float, float addrspace(1)* %381, align 4, !tbaa !7
  %383 = fmul contract float %378, %382
  %384 = fadd contract float %373, %383
  %385 = or i32 %317, 6
  %386 = add nsw i32 %385, %168
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %11, i64 %387
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !7
  %390 = add nsw i32 %173, %385
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %10, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !7
  %394 = fmul contract float %389, %393
  %395 = fadd contract float %384, %394
  %396 = or i32 %317, 7
  %397 = add nsw i32 %396, %168
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %11, i64 %398
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !7
  %401 = add nsw i32 %173, %396
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %10, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7
  %405 = fmul contract float %400, %404
  %406 = fadd contract float %395, %405
  %407 = add nuw nsw i32 %317, 8
  %408 = add i32 %319, 8
  %409 = icmp eq i32 %408, %177
  br i1 %409, label %280, label %316, !llvm.loop !20

410:                                              ; preds = %302, %19
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
