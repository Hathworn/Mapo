; ModuleID = '../data/hip_kernels/1187/12/main.cu'
source_filename = "../data/hip_kernels/1187/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24sga_down_weight_backwardiPKfS0_S0_iiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = freeze i32 %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %629

21:                                               ; preds = %9
  %22 = mul nsw i32 %5, %4
  %23 = srem i32 %19, %22
  %24 = sub nsw i32 %19, %23
  %25 = mul nsw i32 %24, %6
  %26 = add nsw i32 %25, %23
  %27 = mul nsw i32 %24, %7
  %28 = add nsw i32 %27, %23
  %29 = sdiv i32 %23, %5
  %30 = icmp slt i32 %6, 1
  br i1 %30, label %59, label %31

31:                                               ; preds = %21
  %32 = sext i32 %28 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %8, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = and i32 %6, 7
  %36 = icmp ult i32 %6, 8
  br i1 %36, label %39, label %37

37:                                               ; preds = %31
  %38 = and i32 %6, -8
  br label %61

39:                                               ; preds = %61, %31
  %40 = phi float [ %34, %31 ], [ %143, %61 ]
  %41 = phi i32 [ 0, %31 ], [ %144, %61 ]
  %42 = icmp eq i32 %35, 0
  br i1 %42, label %59, label %43

43:                                               ; preds = %39, %43
  %44 = phi float [ %55, %43 ], [ %40, %39 ]
  %45 = phi i32 [ %56, %43 ], [ %41, %39 ]
  %46 = phi i32 [ %57, %43 ], [ 0, %39 ]
  %47 = mul nsw i32 %45, %22
  %48 = add nsw i32 %47, %26
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fmul contract float %51, %53
  %55 = fadd contract float %44, %54
  store float %55, float addrspace(1)* %33, align 4, !tbaa !7
  %56 = add nuw nsw i32 %45, 1
  %57 = add i32 %46, 1
  %58 = icmp eq i32 %57, %35
  br i1 %58, label %59, label %43, !llvm.loop !11

59:                                               ; preds = %39, %43, %21
  %60 = icmp sgt i32 %29, 0
  br i1 %60, label %147, label %490

61:                                               ; preds = %61, %37
  %62 = phi float [ %34, %37 ], [ %143, %61 ]
  %63 = phi i32 [ 0, %37 ], [ %144, %61 ]
  %64 = phi i32 [ 0, %37 ], [ %145, %61 ]
  %65 = mul nsw i32 %63, %22
  %66 = add nsw i32 %65, %26
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fmul contract float %69, %71
  %73 = fadd contract float %62, %72
  store float %73, float addrspace(1)* %33, align 4, !tbaa !7
  %74 = or i32 %63, 1
  %75 = mul nsw i32 %74, %22
  %76 = add nsw i32 %75, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %79, %81
  %83 = fadd contract float %73, %82
  store float %83, float addrspace(1)* %33, align 4, !tbaa !7
  %84 = or i32 %63, 2
  %85 = mul nsw i32 %84, %22
  %86 = add nsw i32 %85, %26
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fmul contract float %89, %91
  %93 = fadd contract float %83, %92
  store float %93, float addrspace(1)* %33, align 4, !tbaa !7
  %94 = or i32 %63, 3
  %95 = mul nsw i32 %94, %22
  %96 = add nsw i32 %95, %26
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fmul contract float %99, %101
  %103 = fadd contract float %93, %102
  store float %103, float addrspace(1)* %33, align 4, !tbaa !7
  %104 = or i32 %63, 4
  %105 = mul nsw i32 %104, %22
  %106 = add nsw i32 %105, %26
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %109, %111
  %113 = fadd contract float %103, %112
  store float %113, float addrspace(1)* %33, align 4, !tbaa !7
  %114 = or i32 %63, 5
  %115 = mul nsw i32 %114, %22
  %116 = add nsw i32 %115, %26
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %3, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %119, %121
  %123 = fadd contract float %113, %122
  store float %123, float addrspace(1)* %33, align 4, !tbaa !7
  %124 = or i32 %63, 6
  %125 = mul nsw i32 %124, %22
  %126 = add nsw i32 %125, %26
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %3, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %129, %131
  %133 = fadd contract float %123, %132
  store float %133, float addrspace(1)* %33, align 4, !tbaa !7
  %134 = or i32 %63, 7
  %135 = mul nsw i32 %134, %22
  %136 = add nsw i32 %135, %26
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %3, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fmul contract float %139, %141
  %143 = fadd contract float %133, %142
  store float %143, float addrspace(1)* %33, align 4, !tbaa !7
  %144 = add nuw nsw i32 %63, 8
  %145 = add i32 %64, 8
  %146 = icmp eq i32 %145, %38
  br i1 %146, label %39, label %61, !llvm.loop !13

147:                                              ; preds = %59
  br i1 %30, label %179, label %148

148:                                              ; preds = %147
  %149 = add nsw i32 %28, %22
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %8, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = and i32 %6, 7
  %154 = icmp ult i32 %6, 8
  br i1 %154, label %157, label %155

155:                                              ; preds = %148
  %156 = and i32 %6, -8
  br label %201

157:                                              ; preds = %201, %148
  %158 = phi float [ %152, %148 ], [ %299, %201 ]
  %159 = phi i32 [ 0, %148 ], [ %300, %201 ]
  %160 = icmp eq i32 %153, 0
  br i1 %160, label %179, label %161

161:                                              ; preds = %157, %161
  %162 = phi float [ %175, %161 ], [ %158, %157 ]
  %163 = phi i32 [ %176, %161 ], [ %159, %157 ]
  %164 = phi i32 [ %177, %161 ], [ 0, %157 ]
  %165 = mul nsw i32 %163, %22
  %166 = add nsw i32 %165, %26
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %3, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7
  %170 = sub nsw i32 %166, %5
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %2, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = fmul contract float %169, %173
  %175 = fadd contract float %162, %174
  store float %175, float addrspace(1)* %151, align 4, !tbaa !7
  %176 = add nuw nsw i32 %163, 1
  %177 = add i32 %164, 1
  %178 = icmp eq i32 %177, %153
  br i1 %178, label %179, label %161, !llvm.loop !15

179:                                              ; preds = %157, %161, %147
  %180 = mul nsw i32 %22, 3
  %181 = add nsw i32 %28, %180
  %182 = sext i32 %26 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %3, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7
  %187 = fmul contract float %184, %186
  %188 = sext i32 %181 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %8, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7
  %191 = fadd contract float %190, %187
  store float %191, float addrspace(1)* %189, align 4, !tbaa !7
  %192 = icmp sgt i32 %6, 1
  br i1 %192, label %193, label %327

193:                                              ; preds = %179
  %194 = sub i32 %26, %5
  %195 = add i32 %6, -1
  %196 = add i32 %6, -2
  %197 = and i32 %195, 3
  %198 = icmp ult i32 %196, 3
  br i1 %198, label %303, label %199

199:                                              ; preds = %193
  %200 = and i32 %195, -4
  br label %350

201:                                              ; preds = %201, %155
  %202 = phi float [ %152, %155 ], [ %299, %201 ]
  %203 = phi i32 [ 0, %155 ], [ %300, %201 ]
  %204 = phi i32 [ 0, %155 ], [ %301, %201 ]
  %205 = mul nsw i32 %203, %22
  %206 = add nsw i32 %205, %26
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %3, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %210 = sub nsw i32 %206, %5
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %2, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %214 = fmul contract float %209, %213
  %215 = fadd contract float %202, %214
  store float %215, float addrspace(1)* %151, align 4, !tbaa !7
  %216 = or i32 %203, 1
  %217 = mul nsw i32 %216, %22
  %218 = add nsw i32 %217, %26
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %3, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = sub nsw i32 %218, %5
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = fmul contract float %221, %225
  %227 = fadd contract float %215, %226
  store float %227, float addrspace(1)* %151, align 4, !tbaa !7
  %228 = or i32 %203, 2
  %229 = mul nsw i32 %228, %22
  %230 = add nsw i32 %229, %26
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %3, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  %234 = sub nsw i32 %230, %5
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %2, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7
  %238 = fmul contract float %233, %237
  %239 = fadd contract float %227, %238
  store float %239, float addrspace(1)* %151, align 4, !tbaa !7
  %240 = or i32 %203, 3
  %241 = mul nsw i32 %240, %22
  %242 = add nsw i32 %241, %26
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %3, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !7
  %246 = sub nsw i32 %242, %5
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %2, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !7
  %250 = fmul contract float %245, %249
  %251 = fadd contract float %239, %250
  store float %251, float addrspace(1)* %151, align 4, !tbaa !7
  %252 = or i32 %203, 4
  %253 = mul nsw i32 %252, %22
  %254 = add nsw i32 %253, %26
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %3, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7
  %258 = sub nsw i32 %254, %5
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %2, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7
  %262 = fmul contract float %257, %261
  %263 = fadd contract float %251, %262
  store float %263, float addrspace(1)* %151, align 4, !tbaa !7
  %264 = or i32 %203, 5
  %265 = mul nsw i32 %264, %22
  %266 = add nsw i32 %265, %26
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %3, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !7
  %270 = sub nsw i32 %266, %5
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %2, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %274 = fmul contract float %269, %273
  %275 = fadd contract float %263, %274
  store float %275, float addrspace(1)* %151, align 4, !tbaa !7
  %276 = or i32 %203, 6
  %277 = mul nsw i32 %276, %22
  %278 = add nsw i32 %277, %26
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %3, i64 %279
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !7
  %282 = sub nsw i32 %278, %5
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %2, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %286 = fmul contract float %281, %285
  %287 = fadd contract float %275, %286
  store float %287, float addrspace(1)* %151, align 4, !tbaa !7
  %288 = or i32 %203, 7
  %289 = mul nsw i32 %288, %22
  %290 = add nsw i32 %289, %26
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds float, float addrspace(1)* %3, i64 %291
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !7
  %294 = sub nsw i32 %290, %5
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %2, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7
  %298 = fmul contract float %293, %297
  %299 = fadd contract float %287, %298
  store float %299, float addrspace(1)* %151, align 4, !tbaa !7
  %300 = add nuw nsw i32 %203, 8
  %301 = add i32 %204, 8
  %302 = icmp eq i32 %301, %156
  br i1 %302, label %157, label %201, !llvm.loop !16

303:                                              ; preds = %350, %193
  %304 = phi float [ %191, %193 ], [ %405, %350 ]
  %305 = phi i32 [ 1, %193 ], [ %406, %350 ]
  %306 = icmp eq i32 %197, 0
  br i1 %306, label %327, label %307

307:                                              ; preds = %303, %307
  %308 = phi float [ %323, %307 ], [ %304, %303 ]
  %309 = phi i32 [ %324, %307 ], [ %305, %303 ]
  %310 = phi i32 [ %325, %307 ], [ 0, %303 ]
  %311 = mul nsw i32 %309, %22
  %312 = add nsw i32 %311, %26
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %3, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !7
  %316 = add nsw i32 %309, -1
  %317 = mul nsw i32 %316, %22
  %318 = add i32 %194, %317
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %2, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7
  %322 = fmul contract float %315, %321
  %323 = fadd contract float %308, %322
  store float %323, float addrspace(1)* %189, align 4, !tbaa !7
  %324 = add nuw nsw i32 %309, 1
  %325 = add i32 %310, 1
  %326 = icmp eq i32 %325, %197
  br i1 %326, label %327, label %307, !llvm.loop !17

327:                                              ; preds = %303, %307, %179
  %328 = shl nsw i32 %22, 2
  %329 = add nsw i32 %28, %328
  %330 = add nsw i32 %6, -1
  %331 = mul nsw i32 %330, %22
  %332 = add nsw i32 %26, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %3, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !7
  %336 = getelementptr inbounds float, float addrspace(1)* %1, i64 %333
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !7
  %338 = fmul contract float %335, %337
  %339 = sext i32 %329 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %8, i64 %339
  %341 = load float, float addrspace(1)* %340, align 4, !tbaa !7
  %342 = fadd contract float %341, %338
  store float %342, float addrspace(1)* %340, align 4, !tbaa !7
  br i1 %192, label %343, label %490

343:                                              ; preds = %327
  %344 = sub i32 %26, %5
  %345 = add i32 %6, -2
  %346 = and i32 %330, 3
  %347 = icmp ult i32 %345, 3
  br i1 %347, label %467, label %348

348:                                              ; preds = %343
  %349 = and i32 %330, -4
  br label %409

350:                                              ; preds = %350, %199
  %351 = phi float [ %191, %199 ], [ %405, %350 ]
  %352 = phi i32 [ 1, %199 ], [ %406, %350 ]
  %353 = phi i32 [ 0, %199 ], [ %407, %350 ]
  %354 = mul nsw i32 %352, %22
  %355 = add nsw i32 %354, %26
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %3, i64 %356
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !7
  %359 = add nsw i32 %352, -1
  %360 = mul nsw i32 %359, %22
  %361 = add i32 %194, %360
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %2, i64 %362
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !7
  %365 = fmul contract float %358, %364
  %366 = fadd contract float %351, %365
  store float %366, float addrspace(1)* %189, align 4, !tbaa !7
  %367 = add nuw nsw i32 %352, 1
  %368 = mul nsw i32 %367, %22
  %369 = add nsw i32 %368, %26
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %3, i64 %370
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !7
  %373 = mul nsw i32 %352, %22
  %374 = add i32 %194, %373
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %2, i64 %375
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !7
  %378 = fmul contract float %372, %377
  %379 = fadd contract float %366, %378
  store float %379, float addrspace(1)* %189, align 4, !tbaa !7
  %380 = add nuw nsw i32 %352, 2
  %381 = mul nsw i32 %380, %22
  %382 = add nsw i32 %381, %26
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %3, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !7
  %386 = mul nsw i32 %367, %22
  %387 = add i32 %194, %386
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float addrspace(1)* %2, i64 %388
  %390 = load float, float addrspace(1)* %389, align 4, !tbaa !7
  %391 = fmul contract float %385, %390
  %392 = fadd contract float %379, %391
  store float %392, float addrspace(1)* %189, align 4, !tbaa !7
  %393 = add nuw nsw i32 %352, 3
  %394 = mul nsw i32 %393, %22
  %395 = add nsw i32 %394, %26
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %3, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !7
  %399 = mul nsw i32 %380, %22
  %400 = add i32 %194, %399
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %2, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !7
  %404 = fmul contract float %398, %403
  %405 = fadd contract float %392, %404
  store float %405, float addrspace(1)* %189, align 4, !tbaa !7
  %406 = add nuw nsw i32 %352, 4
  %407 = add i32 %353, 4
  %408 = icmp eq i32 %407, %200
  br i1 %408, label %303, label %350, !llvm.loop !18

409:                                              ; preds = %409, %348
  %410 = phi i32 [ 0, %348 ], [ %457, %409 ]
  %411 = phi float [ %342, %348 ], [ %464, %409 ]
  %412 = phi i32 [ 0, %348 ], [ %465, %409 ]
  %413 = mul nsw i32 %410, %22
  %414 = add nsw i32 %413, %26
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %3, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !7
  %418 = or i32 %410, 1
  %419 = mul nsw i32 %418, %22
  %420 = add i32 %344, %419
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %2, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !7
  %424 = fmul contract float %417, %423
  %425 = fadd contract float %411, %424
  store float %425, float addrspace(1)* %340, align 4, !tbaa !7
  %426 = mul nsw i32 %418, %22
  %427 = add nsw i32 %426, %26
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds float, float addrspace(1)* %3, i64 %428
  %430 = load float, float addrspace(1)* %429, align 4, !tbaa !7
  %431 = or i32 %410, 2
  %432 = mul nsw i32 %431, %22
  %433 = add i32 %344, %432
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(1)* %2, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !7
  %437 = fmul contract float %430, %436
  %438 = fadd contract float %425, %437
  store float %438, float addrspace(1)* %340, align 4, !tbaa !7
  %439 = mul nsw i32 %431, %22
  %440 = add nsw i32 %439, %26
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds float, float addrspace(1)* %3, i64 %441
  %443 = load float, float addrspace(1)* %442, align 4, !tbaa !7
  %444 = or i32 %410, 3
  %445 = mul nsw i32 %444, %22
  %446 = add i32 %344, %445
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %2, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !7
  %450 = fmul contract float %443, %449
  %451 = fadd contract float %438, %450
  store float %451, float addrspace(1)* %340, align 4, !tbaa !7
  %452 = mul nsw i32 %444, %22
  %453 = add nsw i32 %452, %26
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds float, float addrspace(1)* %3, i64 %454
  %456 = load float, float addrspace(1)* %455, align 4, !tbaa !7
  %457 = add nuw nsw i32 %410, 4
  %458 = mul nsw i32 %457, %22
  %459 = add i32 %344, %458
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float addrspace(1)* %2, i64 %460
  %462 = load float, float addrspace(1)* %461, align 4, !tbaa !7
  %463 = fmul contract float %456, %462
  %464 = fadd contract float %451, %463
  store float %464, float addrspace(1)* %340, align 4, !tbaa !7
  %465 = add i32 %412, 4
  %466 = icmp eq i32 %465, %349
  br i1 %466, label %467, label %409, !llvm.loop !19

467:                                              ; preds = %409, %343
  %468 = phi i32 [ 0, %343 ], [ %457, %409 ]
  %469 = phi float [ %342, %343 ], [ %464, %409 ]
  %470 = icmp eq i32 %346, 0
  br i1 %470, label %490, label %471

471:                                              ; preds = %467, %471
  %472 = phi i32 [ %480, %471 ], [ %468, %467 ]
  %473 = phi float [ %487, %471 ], [ %469, %467 ]
  %474 = phi i32 [ %488, %471 ], [ 0, %467 ]
  %475 = mul nsw i32 %472, %22
  %476 = add nsw i32 %475, %26
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds float, float addrspace(1)* %3, i64 %477
  %479 = load float, float addrspace(1)* %478, align 4, !tbaa !7
  %480 = add nuw nsw i32 %472, 1
  %481 = mul nsw i32 %480, %22
  %482 = add i32 %344, %481
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds float, float addrspace(1)* %2, i64 %483
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !7
  %486 = fmul contract float %479, %485
  %487 = fadd contract float %473, %486
  store float %487, float addrspace(1)* %340, align 4, !tbaa !7
  %488 = add i32 %474, 1
  %489 = icmp eq i32 %488, %346
  br i1 %489, label %490, label %471, !llvm.loop !20

490:                                              ; preds = %467, %471, %327, %59
  %491 = icmp slt i32 %29, 2
  %492 = select i1 %491, i1 true, i1 %30
  br i1 %492, label %629, label %493

493:                                              ; preds = %490
  %494 = shl nsw i32 %22, 1
  %495 = add nsw i32 %28, %494
  %496 = shl nsw i32 %5, 1
  %497 = sext i32 %495 to i64
  %498 = getelementptr inbounds float, float addrspace(1)* %8, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7
  %500 = add i32 %6, -1
  %501 = and i32 %6, 7
  %502 = icmp ult i32 %500, 7
  br i1 %502, label %607, label %503

503:                                              ; preds = %493
  %504 = and i32 %6, -8
  br label %505

505:                                              ; preds = %505, %503
  %506 = phi float [ %499, %503 ], [ %603, %505 ]
  %507 = phi i32 [ 0, %503 ], [ %604, %505 ]
  %508 = phi i32 [ 0, %503 ], [ %605, %505 ]
  %509 = mul nsw i32 %507, %22
  %510 = add nsw i32 %509, %26
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds float, float addrspace(1)* %3, i64 %511
  %513 = load float, float addrspace(1)* %512, align 4, !tbaa !7
  %514 = sub nsw i32 %510, %496
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %2, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %518 = fmul contract float %513, %517
  %519 = fadd contract float %506, %518
  store float %519, float addrspace(1)* %498, align 4, !tbaa !7
  %520 = or i32 %507, 1
  %521 = mul nsw i32 %520, %22
  %522 = add nsw i32 %521, %26
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds float, float addrspace(1)* %3, i64 %523
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !7
  %526 = sub nsw i32 %522, %496
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %2, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %530 = fmul contract float %525, %529
  %531 = fadd contract float %519, %530
  store float %531, float addrspace(1)* %498, align 4, !tbaa !7
  %532 = or i32 %507, 2
  %533 = mul nsw i32 %532, %22
  %534 = add nsw i32 %533, %26
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds float, float addrspace(1)* %3, i64 %535
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !7
  %538 = sub nsw i32 %534, %496
  %539 = sext i32 %538 to i64
  %540 = getelementptr inbounds float, float addrspace(1)* %2, i64 %539
  %541 = load float, float addrspace(1)* %540, align 4, !tbaa !7
  %542 = fmul contract float %537, %541
  %543 = fadd contract float %531, %542
  store float %543, float addrspace(1)* %498, align 4, !tbaa !7
  %544 = or i32 %507, 3
  %545 = mul nsw i32 %544, %22
  %546 = add nsw i32 %545, %26
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds float, float addrspace(1)* %3, i64 %547
  %549 = load float, float addrspace(1)* %548, align 4, !tbaa !7
  %550 = sub nsw i32 %546, %496
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds float, float addrspace(1)* %2, i64 %551
  %553 = load float, float addrspace(1)* %552, align 4, !tbaa !7
  %554 = fmul contract float %549, %553
  %555 = fadd contract float %543, %554
  store float %555, float addrspace(1)* %498, align 4, !tbaa !7
  %556 = or i32 %507, 4
  %557 = mul nsw i32 %556, %22
  %558 = add nsw i32 %557, %26
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %3, i64 %559
  %561 = load float, float addrspace(1)* %560, align 4, !tbaa !7
  %562 = sub nsw i32 %558, %496
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %2, i64 %563
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %566 = fmul contract float %561, %565
  %567 = fadd contract float %555, %566
  store float %567, float addrspace(1)* %498, align 4, !tbaa !7
  %568 = or i32 %507, 5
  %569 = mul nsw i32 %568, %22
  %570 = add nsw i32 %569, %26
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds float, float addrspace(1)* %3, i64 %571
  %573 = load float, float addrspace(1)* %572, align 4, !tbaa !7
  %574 = sub nsw i32 %570, %496
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %2, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !7
  %578 = fmul contract float %573, %577
  %579 = fadd contract float %567, %578
  store float %579, float addrspace(1)* %498, align 4, !tbaa !7
  %580 = or i32 %507, 6
  %581 = mul nsw i32 %580, %22
  %582 = add nsw i32 %581, %26
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %3, i64 %583
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !7
  %586 = sub nsw i32 %582, %496
  %587 = sext i32 %586 to i64
  %588 = getelementptr inbounds float, float addrspace(1)* %2, i64 %587
  %589 = load float, float addrspace(1)* %588, align 4, !tbaa !7
  %590 = fmul contract float %585, %589
  %591 = fadd contract float %579, %590
  store float %591, float addrspace(1)* %498, align 4, !tbaa !7
  %592 = or i32 %507, 7
  %593 = mul nsw i32 %592, %22
  %594 = add nsw i32 %593, %26
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds float, float addrspace(1)* %3, i64 %595
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !7
  %598 = sub nsw i32 %594, %496
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %2, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !7
  %602 = fmul contract float %597, %601
  %603 = fadd contract float %591, %602
  store float %603, float addrspace(1)* %498, align 4, !tbaa !7
  %604 = add nuw nsw i32 %507, 8
  %605 = add i32 %508, 8
  %606 = icmp eq i32 %605, %504
  br i1 %606, label %607, label %505, !llvm.loop !21

607:                                              ; preds = %505, %493
  %608 = phi float [ %499, %493 ], [ %603, %505 ]
  %609 = phi i32 [ 0, %493 ], [ %604, %505 ]
  %610 = icmp eq i32 %501, 0
  br i1 %610, label %629, label %611

611:                                              ; preds = %607, %611
  %612 = phi float [ %625, %611 ], [ %608, %607 ]
  %613 = phi i32 [ %626, %611 ], [ %609, %607 ]
  %614 = phi i32 [ %627, %611 ], [ 0, %607 ]
  %615 = mul nsw i32 %613, %22
  %616 = add nsw i32 %615, %26
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds float, float addrspace(1)* %3, i64 %617
  %619 = load float, float addrspace(1)* %618, align 4, !tbaa !7
  %620 = sub nsw i32 %616, %496
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds float, float addrspace(1)* %2, i64 %621
  %623 = load float, float addrspace(1)* %622, align 4, !tbaa !7
  %624 = fmul contract float %619, %623
  %625 = fadd contract float %612, %624
  store float %625, float addrspace(1)* %498, align 4, !tbaa !7
  %626 = add nuw nsw i32 %613, 1
  %627 = add i32 %614, 1
  %628 = icmp eq i32 %627, %501
  br i1 %628, label %629, label %611, !llvm.loop !22

629:                                              ; preds = %607, %611, %490, %9
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
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !12}
