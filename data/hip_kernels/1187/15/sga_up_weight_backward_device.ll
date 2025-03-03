; ModuleID = '../data/hip_kernels/1187/15/main.cu'
source_filename = "../data/hip_kernels/1187/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22sga_up_weight_backwardiPKfS0_S0_iiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
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
  br i1 %20, label %21, label %631

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
  br label %62

39:                                               ; preds = %62, %31
  %40 = phi float [ %34, %31 ], [ %144, %62 ]
  %41 = phi i32 [ 0, %31 ], [ %145, %62 ]
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
  %60 = add nsw i32 %29, 1
  %61 = icmp slt i32 %60, %4
  br i1 %61, label %148, label %491

62:                                               ; preds = %62, %37
  %63 = phi float [ %34, %37 ], [ %144, %62 ]
  %64 = phi i32 [ 0, %37 ], [ %145, %62 ]
  %65 = phi i32 [ 0, %37 ], [ %146, %62 ]
  %66 = mul nsw i32 %64, %22
  %67 = add nsw i32 %66, %26
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fmul contract float %70, %72
  %74 = fadd contract float %63, %73
  store float %74, float addrspace(1)* %33, align 4, !tbaa !7
  %75 = or i32 %64, 1
  %76 = mul nsw i32 %75, %22
  %77 = add nsw i32 %76, %26
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %3, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %80, %82
  %84 = fadd contract float %74, %83
  store float %84, float addrspace(1)* %33, align 4, !tbaa !7
  %85 = or i32 %64, 2
  %86 = mul nsw i32 %85, %22
  %87 = add nsw i32 %86, %26
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %90, %92
  %94 = fadd contract float %84, %93
  store float %94, float addrspace(1)* %33, align 4, !tbaa !7
  %95 = or i32 %64, 3
  %96 = mul nsw i32 %95, %22
  %97 = add nsw i32 %96, %26
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fmul contract float %100, %102
  %104 = fadd contract float %94, %103
  store float %104, float addrspace(1)* %33, align 4, !tbaa !7
  %105 = or i32 %64, 4
  %106 = mul nsw i32 %105, %22
  %107 = add nsw i32 %106, %26
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %110, %112
  %114 = fadd contract float %104, %113
  store float %114, float addrspace(1)* %33, align 4, !tbaa !7
  %115 = or i32 %64, 5
  %116 = mul nsw i32 %115, %22
  %117 = add nsw i32 %116, %26
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %3, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %120, %122
  %124 = fadd contract float %114, %123
  store float %124, float addrspace(1)* %33, align 4, !tbaa !7
  %125 = or i32 %64, 6
  %126 = mul nsw i32 %125, %22
  %127 = add nsw i32 %126, %26
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %3, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %130, %132
  %134 = fadd contract float %124, %133
  store float %134, float addrspace(1)* %33, align 4, !tbaa !7
  %135 = or i32 %64, 7
  %136 = mul nsw i32 %135, %22
  %137 = add nsw i32 %136, %26
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7
  %143 = fmul contract float %140, %142
  %144 = fadd contract float %134, %143
  store float %144, float addrspace(1)* %33, align 4, !tbaa !7
  %145 = add nuw nsw i32 %64, 8
  %146 = add i32 %65, 8
  %147 = icmp eq i32 %146, %38
  br i1 %147, label %39, label %62, !llvm.loop !13

148:                                              ; preds = %59
  br i1 %30, label %180, label %149

149:                                              ; preds = %148
  %150 = add nsw i32 %28, %22
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %8, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = and i32 %6, 7
  %155 = icmp ult i32 %6, 8
  br i1 %155, label %158, label %156

156:                                              ; preds = %149
  %157 = and i32 %6, -8
  br label %202

158:                                              ; preds = %202, %149
  %159 = phi float [ %153, %149 ], [ %300, %202 ]
  %160 = phi i32 [ 0, %149 ], [ %301, %202 ]
  %161 = icmp eq i32 %154, 0
  br i1 %161, label %180, label %162

162:                                              ; preds = %158, %162
  %163 = phi float [ %176, %162 ], [ %159, %158 ]
  %164 = phi i32 [ %177, %162 ], [ %160, %158 ]
  %165 = phi i32 [ %178, %162 ], [ 0, %158 ]
  %166 = mul nsw i32 %164, %22
  %167 = add nsw i32 %166, %26
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = add nsw i32 %167, %5
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fmul contract float %170, %174
  %176 = fadd contract float %163, %175
  store float %176, float addrspace(1)* %152, align 4, !tbaa !7
  %177 = add nuw nsw i32 %164, 1
  %178 = add i32 %165, 1
  %179 = icmp eq i32 %178, %154
  br i1 %179, label %180, label %162, !llvm.loop !15

180:                                              ; preds = %158, %162, %148
  %181 = mul nsw i32 %22, 3
  %182 = add nsw i32 %28, %181
  %183 = sext i32 %26 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %3, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !7
  %188 = fmul contract float %185, %187
  %189 = sext i32 %182 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %8, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = fadd contract float %191, %188
  store float %192, float addrspace(1)* %190, align 4, !tbaa !7
  %193 = icmp sgt i32 %6, 1
  br i1 %193, label %194, label %328

194:                                              ; preds = %180
  %195 = add i32 %26, %5
  %196 = add i32 %6, -1
  %197 = add i32 %6, -2
  %198 = and i32 %196, 3
  %199 = icmp ult i32 %197, 3
  br i1 %199, label %304, label %200

200:                                              ; preds = %194
  %201 = and i32 %196, -4
  br label %351

202:                                              ; preds = %202, %156
  %203 = phi float [ %153, %156 ], [ %300, %202 ]
  %204 = phi i32 [ 0, %156 ], [ %301, %202 ]
  %205 = phi i32 [ 0, %156 ], [ %302, %202 ]
  %206 = mul nsw i32 %204, %22
  %207 = add nsw i32 %206, %26
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %3, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %211 = add nsw i32 %207, %5
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %2, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = fmul contract float %210, %214
  %216 = fadd contract float %203, %215
  store float %216, float addrspace(1)* %152, align 4, !tbaa !7
  %217 = or i32 %204, 1
  %218 = mul nsw i32 %217, %22
  %219 = add nsw i32 %218, %26
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %3, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7
  %223 = add nsw i32 %219, %5
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %2, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fmul contract float %222, %226
  %228 = fadd contract float %216, %227
  store float %228, float addrspace(1)* %152, align 4, !tbaa !7
  %229 = or i32 %204, 2
  %230 = mul nsw i32 %229, %22
  %231 = add nsw i32 %230, %26
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = add nsw i32 %231, %5
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %2, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = fmul contract float %234, %238
  %240 = fadd contract float %228, %239
  store float %240, float addrspace(1)* %152, align 4, !tbaa !7
  %241 = or i32 %204, 3
  %242 = mul nsw i32 %241, %22
  %243 = add nsw i32 %242, %26
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %3, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7
  %247 = add nsw i32 %243, %5
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %2, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = fmul contract float %246, %250
  %252 = fadd contract float %240, %251
  store float %252, float addrspace(1)* %152, align 4, !tbaa !7
  %253 = or i32 %204, 4
  %254 = mul nsw i32 %253, %22
  %255 = add nsw i32 %254, %26
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %3, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = add nsw i32 %255, %5
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %2, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7
  %263 = fmul contract float %258, %262
  %264 = fadd contract float %252, %263
  store float %264, float addrspace(1)* %152, align 4, !tbaa !7
  %265 = or i32 %204, 5
  %266 = mul nsw i32 %265, %22
  %267 = add nsw i32 %266, %26
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %3, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7
  %271 = add nsw i32 %267, %5
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %2, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = fmul contract float %270, %274
  %276 = fadd contract float %264, %275
  store float %276, float addrspace(1)* %152, align 4, !tbaa !7
  %277 = or i32 %204, 6
  %278 = mul nsw i32 %277, %22
  %279 = add nsw i32 %278, %26
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %3, i64 %280
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !7
  %283 = add nsw i32 %279, %5
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %2, i64 %284
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !7
  %287 = fmul contract float %282, %286
  %288 = fadd contract float %276, %287
  store float %288, float addrspace(1)* %152, align 4, !tbaa !7
  %289 = or i32 %204, 7
  %290 = mul nsw i32 %289, %22
  %291 = add nsw i32 %290, %26
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %3, i64 %292
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !7
  %295 = add nsw i32 %291, %5
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %2, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !7
  %299 = fmul contract float %294, %298
  %300 = fadd contract float %288, %299
  store float %300, float addrspace(1)* %152, align 4, !tbaa !7
  %301 = add nuw nsw i32 %204, 8
  %302 = add i32 %205, 8
  %303 = icmp eq i32 %302, %157
  br i1 %303, label %158, label %202, !llvm.loop !16

304:                                              ; preds = %351, %194
  %305 = phi float [ %192, %194 ], [ %406, %351 ]
  %306 = phi i32 [ 1, %194 ], [ %407, %351 ]
  %307 = icmp eq i32 %198, 0
  br i1 %307, label %328, label %308

308:                                              ; preds = %304, %308
  %309 = phi float [ %324, %308 ], [ %305, %304 ]
  %310 = phi i32 [ %325, %308 ], [ %306, %304 ]
  %311 = phi i32 [ %326, %308 ], [ 0, %304 ]
  %312 = mul nsw i32 %310, %22
  %313 = add nsw i32 %312, %26
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %3, i64 %314
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !7
  %317 = add nsw i32 %310, -1
  %318 = mul nsw i32 %317, %22
  %319 = add i32 %195, %318
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %2, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !7
  %323 = fmul contract float %316, %322
  %324 = fadd contract float %309, %323
  store float %324, float addrspace(1)* %190, align 4, !tbaa !7
  %325 = add nuw nsw i32 %310, 1
  %326 = add i32 %311, 1
  %327 = icmp eq i32 %326, %198
  br i1 %327, label %328, label %308, !llvm.loop !17

328:                                              ; preds = %304, %308, %180
  %329 = shl nsw i32 %22, 2
  %330 = add nsw i32 %28, %329
  %331 = add nsw i32 %6, -1
  %332 = mul nsw i32 %331, %22
  %333 = add nsw i32 %26, %332
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %3, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !7
  %337 = getelementptr inbounds float, float addrspace(1)* %1, i64 %334
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7
  %339 = fmul contract float %336, %338
  %340 = sext i32 %330 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %8, i64 %340
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7
  %343 = fadd contract float %342, %339
  store float %343, float addrspace(1)* %341, align 4, !tbaa !7
  br i1 %193, label %344, label %491

344:                                              ; preds = %328
  %345 = add i32 %26, %5
  %346 = add i32 %6, -2
  %347 = and i32 %331, 3
  %348 = icmp ult i32 %346, 3
  br i1 %348, label %468, label %349

349:                                              ; preds = %344
  %350 = and i32 %331, -4
  br label %410

351:                                              ; preds = %351, %200
  %352 = phi float [ %192, %200 ], [ %406, %351 ]
  %353 = phi i32 [ 1, %200 ], [ %407, %351 ]
  %354 = phi i32 [ 0, %200 ], [ %408, %351 ]
  %355 = mul nsw i32 %353, %22
  %356 = add nsw i32 %355, %26
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %3, i64 %357
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !7
  %360 = add nsw i32 %353, -1
  %361 = mul nsw i32 %360, %22
  %362 = add i32 %195, %361
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float addrspace(1)* %2, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !7
  %366 = fmul contract float %359, %365
  %367 = fadd contract float %352, %366
  store float %367, float addrspace(1)* %190, align 4, !tbaa !7
  %368 = add nuw nsw i32 %353, 1
  %369 = mul nsw i32 %368, %22
  %370 = add nsw i32 %369, %26
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %3, i64 %371
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !7
  %374 = mul nsw i32 %353, %22
  %375 = add i32 %195, %374
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %2, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7
  %379 = fmul contract float %373, %378
  %380 = fadd contract float %367, %379
  store float %380, float addrspace(1)* %190, align 4, !tbaa !7
  %381 = add nuw nsw i32 %353, 2
  %382 = mul nsw i32 %381, %22
  %383 = add nsw i32 %382, %26
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds float, float addrspace(1)* %3, i64 %384
  %386 = load float, float addrspace(1)* %385, align 4, !tbaa !7
  %387 = mul nsw i32 %368, %22
  %388 = add i32 %195, %387
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %2, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !7
  %392 = fmul contract float %386, %391
  %393 = fadd contract float %380, %392
  store float %393, float addrspace(1)* %190, align 4, !tbaa !7
  %394 = add nuw nsw i32 %353, 3
  %395 = mul nsw i32 %394, %22
  %396 = add nsw i32 %395, %26
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %3, i64 %397
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !7
  %400 = mul nsw i32 %381, %22
  %401 = add i32 %195, %400
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %2, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7
  %405 = fmul contract float %399, %404
  %406 = fadd contract float %393, %405
  store float %406, float addrspace(1)* %190, align 4, !tbaa !7
  %407 = add nuw nsw i32 %353, 4
  %408 = add i32 %354, 4
  %409 = icmp eq i32 %408, %201
  br i1 %409, label %304, label %351, !llvm.loop !18

410:                                              ; preds = %410, %349
  %411 = phi i32 [ 0, %349 ], [ %458, %410 ]
  %412 = phi float [ %343, %349 ], [ %465, %410 ]
  %413 = phi i32 [ 0, %349 ], [ %466, %410 ]
  %414 = mul nsw i32 %411, %22
  %415 = add nsw i32 %414, %26
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %3, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !7
  %419 = or i32 %411, 1
  %420 = mul nsw i32 %419, %22
  %421 = add i32 %345, %420
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds float, float addrspace(1)* %2, i64 %422
  %424 = load float, float addrspace(1)* %423, align 4, !tbaa !7
  %425 = fmul contract float %418, %424
  %426 = fadd contract float %412, %425
  store float %426, float addrspace(1)* %341, align 4, !tbaa !7
  %427 = mul nsw i32 %419, %22
  %428 = add nsw i32 %427, %26
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds float, float addrspace(1)* %3, i64 %429
  %431 = load float, float addrspace(1)* %430, align 4, !tbaa !7
  %432 = or i32 %411, 2
  %433 = mul nsw i32 %432, %22
  %434 = add i32 %345, %433
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %2, i64 %435
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !7
  %438 = fmul contract float %431, %437
  %439 = fadd contract float %426, %438
  store float %439, float addrspace(1)* %341, align 4, !tbaa !7
  %440 = mul nsw i32 %432, %22
  %441 = add nsw i32 %440, %26
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds float, float addrspace(1)* %3, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7
  %445 = or i32 %411, 3
  %446 = mul nsw i32 %445, %22
  %447 = add i32 %345, %446
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds float, float addrspace(1)* %2, i64 %448
  %450 = load float, float addrspace(1)* %449, align 4, !tbaa !7
  %451 = fmul contract float %444, %450
  %452 = fadd contract float %439, %451
  store float %452, float addrspace(1)* %341, align 4, !tbaa !7
  %453 = mul nsw i32 %445, %22
  %454 = add nsw i32 %453, %26
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds float, float addrspace(1)* %3, i64 %455
  %457 = load float, float addrspace(1)* %456, align 4, !tbaa !7
  %458 = add nuw nsw i32 %411, 4
  %459 = mul nsw i32 %458, %22
  %460 = add i32 %345, %459
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds float, float addrspace(1)* %2, i64 %461
  %463 = load float, float addrspace(1)* %462, align 4, !tbaa !7
  %464 = fmul contract float %457, %463
  %465 = fadd contract float %452, %464
  store float %465, float addrspace(1)* %341, align 4, !tbaa !7
  %466 = add i32 %413, 4
  %467 = icmp eq i32 %466, %350
  br i1 %467, label %468, label %410, !llvm.loop !19

468:                                              ; preds = %410, %344
  %469 = phi i32 [ 0, %344 ], [ %458, %410 ]
  %470 = phi float [ %343, %344 ], [ %465, %410 ]
  %471 = icmp eq i32 %347, 0
  br i1 %471, label %491, label %472

472:                                              ; preds = %468, %472
  %473 = phi i32 [ %481, %472 ], [ %469, %468 ]
  %474 = phi float [ %488, %472 ], [ %470, %468 ]
  %475 = phi i32 [ %489, %472 ], [ 0, %468 ]
  %476 = mul nsw i32 %473, %22
  %477 = add nsw i32 %476, %26
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds float, float addrspace(1)* %3, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !7
  %481 = add nuw nsw i32 %473, 1
  %482 = mul nsw i32 %481, %22
  %483 = add i32 %345, %482
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds float, float addrspace(1)* %2, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !7
  %487 = fmul contract float %480, %486
  %488 = fadd contract float %474, %487
  store float %488, float addrspace(1)* %341, align 4, !tbaa !7
  %489 = add i32 %475, 1
  %490 = icmp eq i32 %489, %347
  br i1 %490, label %491, label %472, !llvm.loop !20

491:                                              ; preds = %468, %472, %328, %59
  %492 = add nsw i32 %29, 2
  %493 = icmp sge i32 %492, %4
  %494 = select i1 %493, i1 true, i1 %30
  br i1 %494, label %631, label %495

495:                                              ; preds = %491
  %496 = shl nsw i32 %22, 1
  %497 = add nsw i32 %28, %496
  %498 = shl nsw i32 %5, 1
  %499 = sext i32 %497 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %8, i64 %499
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !7
  %502 = add i32 %6, -1
  %503 = and i32 %6, 7
  %504 = icmp ult i32 %502, 7
  br i1 %504, label %609, label %505

505:                                              ; preds = %495
  %506 = and i32 %6, -8
  br label %507

507:                                              ; preds = %507, %505
  %508 = phi float [ %501, %505 ], [ %605, %507 ]
  %509 = phi i32 [ 0, %505 ], [ %606, %507 ]
  %510 = phi i32 [ 0, %505 ], [ %607, %507 ]
  %511 = mul nsw i32 %509, %22
  %512 = add nsw i32 %511, %26
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds float, float addrspace(1)* %3, i64 %513
  %515 = load float, float addrspace(1)* %514, align 4, !tbaa !7
  %516 = add nsw i32 %512, %498
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %2, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !7
  %520 = fmul contract float %515, %519
  %521 = fadd contract float %508, %520
  store float %521, float addrspace(1)* %500, align 4, !tbaa !7
  %522 = or i32 %509, 1
  %523 = mul nsw i32 %522, %22
  %524 = add nsw i32 %523, %26
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds float, float addrspace(1)* %3, i64 %525
  %527 = load float, float addrspace(1)* %526, align 4, !tbaa !7
  %528 = add nsw i32 %524, %498
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %2, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !7
  %532 = fmul contract float %527, %531
  %533 = fadd contract float %521, %532
  store float %533, float addrspace(1)* %500, align 4, !tbaa !7
  %534 = or i32 %509, 2
  %535 = mul nsw i32 %534, %22
  %536 = add nsw i32 %535, %26
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %3, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !7
  %540 = add nsw i32 %536, %498
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds float, float addrspace(1)* %2, i64 %541
  %543 = load float, float addrspace(1)* %542, align 4, !tbaa !7
  %544 = fmul contract float %539, %543
  %545 = fadd contract float %533, %544
  store float %545, float addrspace(1)* %500, align 4, !tbaa !7
  %546 = or i32 %509, 3
  %547 = mul nsw i32 %546, %22
  %548 = add nsw i32 %547, %26
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %3, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !7
  %552 = add nsw i32 %548, %498
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %2, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !7
  %556 = fmul contract float %551, %555
  %557 = fadd contract float %545, %556
  store float %557, float addrspace(1)* %500, align 4, !tbaa !7
  %558 = or i32 %509, 4
  %559 = mul nsw i32 %558, %22
  %560 = add nsw i32 %559, %26
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %3, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !7
  %564 = add nsw i32 %560, %498
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %2, i64 %565
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !7
  %568 = fmul contract float %563, %567
  %569 = fadd contract float %557, %568
  store float %569, float addrspace(1)* %500, align 4, !tbaa !7
  %570 = or i32 %509, 5
  %571 = mul nsw i32 %570, %22
  %572 = add nsw i32 %571, %26
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %3, i64 %573
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !7
  %576 = add nsw i32 %572, %498
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %2, i64 %577
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !7
  %580 = fmul contract float %575, %579
  %581 = fadd contract float %569, %580
  store float %581, float addrspace(1)* %500, align 4, !tbaa !7
  %582 = or i32 %509, 6
  %583 = mul nsw i32 %582, %22
  %584 = add nsw i32 %583, %26
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %3, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !7
  %588 = add nsw i32 %584, %498
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %2, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !7
  %592 = fmul contract float %587, %591
  %593 = fadd contract float %581, %592
  store float %593, float addrspace(1)* %500, align 4, !tbaa !7
  %594 = or i32 %509, 7
  %595 = mul nsw i32 %594, %22
  %596 = add nsw i32 %595, %26
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds float, float addrspace(1)* %3, i64 %597
  %599 = load float, float addrspace(1)* %598, align 4, !tbaa !7
  %600 = add nsw i32 %596, %498
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds float, float addrspace(1)* %2, i64 %601
  %603 = load float, float addrspace(1)* %602, align 4, !tbaa !7
  %604 = fmul contract float %599, %603
  %605 = fadd contract float %593, %604
  store float %605, float addrspace(1)* %500, align 4, !tbaa !7
  %606 = add nuw nsw i32 %509, 8
  %607 = add i32 %510, 8
  %608 = icmp eq i32 %607, %506
  br i1 %608, label %609, label %507, !llvm.loop !21

609:                                              ; preds = %507, %495
  %610 = phi float [ %501, %495 ], [ %605, %507 ]
  %611 = phi i32 [ 0, %495 ], [ %606, %507 ]
  %612 = icmp eq i32 %503, 0
  br i1 %612, label %631, label %613

613:                                              ; preds = %609, %613
  %614 = phi float [ %627, %613 ], [ %610, %609 ]
  %615 = phi i32 [ %628, %613 ], [ %611, %609 ]
  %616 = phi i32 [ %629, %613 ], [ 0, %609 ]
  %617 = mul nsw i32 %615, %22
  %618 = add nsw i32 %617, %26
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds float, float addrspace(1)* %3, i64 %619
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !7
  %622 = add nsw i32 %618, %498
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds float, float addrspace(1)* %2, i64 %623
  %625 = load float, float addrspace(1)* %624, align 4, !tbaa !7
  %626 = fmul contract float %621, %625
  %627 = fadd contract float %614, %626
  store float %627, float addrspace(1)* %500, align 4, !tbaa !7
  %628 = add nuw nsw i32 %615, 1
  %629 = add i32 %616, 1
  %630 = icmp eq i32 %629, %503
  br i1 %630, label %631, label %613, !llvm.loop !22

631:                                              ; preds = %609, %613, %491, %9
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
