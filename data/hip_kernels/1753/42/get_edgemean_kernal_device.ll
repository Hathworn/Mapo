; ModuleID = '../data/hip_kernels/1753/42/main.cu'
source_filename = "../data/hip_kernels/1753/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19get_edgemean_kernalPKfPfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = mul i32 %3, %2
  %7 = sext i32 %6 to i64
  %8 = icmp eq i32 %4, 1
  br i1 %8, label %9, label %151

9:                                                ; preds = %5
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %41

11:                                               ; preds = %9
  %12 = add nsw i32 %3, -1
  %13 = mul nsw i32 %12, %2
  %14 = and i32 %2, 7
  %15 = icmp ult i32 %2, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %11
  %17 = and i32 %2, -8
  br label %48

18:                                               ; preds = %48, %11
  %19 = phi float [ undef, %11 ], [ %130, %48 ]
  %20 = phi float [ 0.000000e+00, %11 ], [ %130, %48 ]
  %21 = phi i32 [ 0, %11 ], [ %131, %48 ]
  %22 = phi i32 [ %13, %11 ], [ %132, %48 ]
  %23 = icmp eq i32 %14, 0
  br i1 %23, label %41, label %24

24:                                               ; preds = %18, %24
  %25 = phi float [ %36, %24 ], [ %20, %18 ]
  %26 = phi i32 [ %37, %24 ], [ %21, %18 ]
  %27 = phi i32 [ %38, %24 ], [ %22, %18 ]
  %28 = phi i32 [ %39, %24 ], [ 0, %18 ]
  %29 = zext i32 %26 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !4, !amdgpu.noclobber !8
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = fadd contract float %31, %34
  %36 = fadd contract float %25, %35
  %37 = add nuw nsw i32 %26, 1
  %38 = add nsw i32 %27, 1
  %39 = add i32 %28, 1
  %40 = icmp eq i32 %39, %14
  br i1 %40, label %41, label %24, !llvm.loop !9

41:                                               ; preds = %18, %24, %9
  %42 = phi float [ 0.000000e+00, %9 ], [ %19, %18 ], [ %36, %24 ]
  %43 = icmp eq i32 %6, 0
  br i1 %43, label %135, label %44

44:                                               ; preds = %41
  %45 = add nsw i32 %2, -1
  %46 = sext i32 %45 to i64
  %47 = sext i32 %2 to i64
  br label %138

48:                                               ; preds = %48, %16
  %49 = phi float [ 0.000000e+00, %16 ], [ %130, %48 ]
  %50 = phi i32 [ 0, %16 ], [ %131, %48 ]
  %51 = phi i32 [ %13, %16 ], [ %132, %48 ]
  %52 = phi i32 [ 0, %16 ], [ %133, %48 ]
  %53 = zext i32 %50 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !4, !amdgpu.noclobber !8
  %56 = sext i32 %51 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !4, !amdgpu.noclobber !8
  %59 = fadd contract float %55, %58
  %60 = fadd contract float %49, %59
  %61 = or i32 %50, 1
  %62 = add nsw i32 %51, 1
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !4, !amdgpu.noclobber !8
  %66 = sext i32 %62 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !4, !amdgpu.noclobber !8
  %69 = fadd contract float %65, %68
  %70 = fadd contract float %60, %69
  %71 = or i32 %50, 2
  %72 = add nsw i32 %51, 2
  %73 = zext i32 %71 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !4, !amdgpu.noclobber !8
  %76 = sext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !4, !amdgpu.noclobber !8
  %79 = fadd contract float %75, %78
  %80 = fadd contract float %70, %79
  %81 = or i32 %50, 3
  %82 = add nsw i32 %51, 3
  %83 = zext i32 %81 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !4, !amdgpu.noclobber !8
  %86 = sext i32 %82 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !4, !amdgpu.noclobber !8
  %89 = fadd contract float %85, %88
  %90 = fadd contract float %80, %89
  %91 = or i32 %50, 4
  %92 = add nsw i32 %51, 4
  %93 = zext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !4, !amdgpu.noclobber !8
  %96 = sext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !4, !amdgpu.noclobber !8
  %99 = fadd contract float %95, %98
  %100 = fadd contract float %90, %99
  %101 = or i32 %50, 5
  %102 = add nsw i32 %51, 5
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !4, !amdgpu.noclobber !8
  %106 = sext i32 %102 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !4, !amdgpu.noclobber !8
  %109 = fadd contract float %105, %108
  %110 = fadd contract float %100, %109
  %111 = or i32 %50, 6
  %112 = add nsw i32 %51, 6
  %113 = zext i32 %111 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !4, !amdgpu.noclobber !8
  %116 = sext i32 %112 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !4, !amdgpu.noclobber !8
  %119 = fadd contract float %115, %118
  %120 = fadd contract float %110, %119
  %121 = or i32 %50, 7
  %122 = add nsw i32 %51, 7
  %123 = zext i32 %121 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !4, !amdgpu.noclobber !8
  %126 = sext i32 %122 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !4, !amdgpu.noclobber !8
  %129 = fadd contract float %125, %128
  %130 = fadd contract float %120, %129
  %131 = add nuw nsw i32 %50, 8
  %132 = add nsw i32 %51, 8
  %133 = add i32 %52, 8
  %134 = icmp eq i32 %133, %17
  br i1 %134, label %18, label %48, !llvm.loop !11

135:                                              ; preds = %138, %41
  %136 = phi float [ %42, %41 ], [ %147, %138 ]
  %137 = add i32 %3, %2
  br label %557

138:                                              ; preds = %44, %138
  %139 = phi float [ %42, %44 ], [ %147, %138 ]
  %140 = phi i64 [ %46, %44 ], [ %149, %138 ]
  %141 = phi i64 [ 0, %44 ], [ %148, %138 ]
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !4, !amdgpu.noclobber !8
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !4, !amdgpu.noclobber !8
  %146 = fadd contract float %143, %145
  %147 = fadd contract float %139, %146
  %148 = add i64 %141, %47
  %149 = add i64 %140, %47
  %150 = icmp ult i64 %148, %7
  br i1 %150, label %138, label %135, !llvm.loop !13

151:                                              ; preds = %5
  %152 = icmp eq i32 %2, %3
  br i1 %152, label %153, label %172

153:                                              ; preds = %151
  %154 = shl nsw i32 %4, 1
  %155 = add nsw i32 %154, -1
  %156 = icmp eq i32 %155, %3
  br i1 %156, label %157, label %172

157:                                              ; preds = %153
  %158 = add i32 %4, -1
  %159 = sext i32 %158 to i64
  %160 = mul nsw i64 %159, %7
  %161 = sext i32 %4 to i64
  %162 = mul nsw i64 %7, %161
  %163 = icmp ult i64 %160, %162
  br i1 %163, label %164, label %279

164:                                              ; preds = %157, %164
  %165 = phi float [ %169, %164 ], [ 0.000000e+00, %157 ]
  %166 = phi i64 [ %170, %164 ], [ %160, %157 ]
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !4, !amdgpu.noclobber !8
  %169 = fadd contract float %165, %168
  %170 = add nuw i64 %166, 1
  %171 = icmp ult i64 %170, %162
  br i1 %171, label %164, label %279, !llvm.loop !14

172:                                              ; preds = %153, %151
  %173 = add i32 %4, -1
  %174 = icmp eq i32 %6, 0
  br i1 %174, label %279, label %175

175:                                              ; preds = %172
  %176 = sext i32 %173 to i64
  %177 = mul nsw i64 %176, %7
  %178 = tail call i64 @llvm.umax.i64(i64 %7, i64 1)
  %179 = add i64 %178, -1
  %180 = and i64 %178, 7
  %181 = icmp ult i64 %179, 7
  br i1 %181, label %255, label %182

182:                                              ; preds = %175
  %183 = and i64 %178, -8
  br label %184

184:                                              ; preds = %184, %182
  %185 = phi float [ 0.000000e+00, %182 ], [ %250, %184 ]
  %186 = phi i64 [ %177, %182 ], [ %252, %184 ]
  %187 = phi i64 [ 0, %182 ], [ %251, %184 ]
  %188 = phi i64 [ 0, %182 ], [ %253, %184 ]
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !4, !amdgpu.noclobber !8
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !4, !amdgpu.noclobber !8
  %193 = fadd contract float %190, %192
  %194 = fadd contract float %185, %193
  %195 = or i64 %187, 1
  %196 = add i64 %186, 1
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 %195
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !4, !amdgpu.noclobber !8
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %196
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !4, !amdgpu.noclobber !8
  %201 = fadd contract float %198, %200
  %202 = fadd contract float %194, %201
  %203 = or i64 %187, 2
  %204 = add i64 %186, 2
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !4, !amdgpu.noclobber !8
  %207 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !4, !amdgpu.noclobber !8
  %209 = fadd contract float %206, %208
  %210 = fadd contract float %202, %209
  %211 = or i64 %187, 3
  %212 = add i64 %186, 3
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %211
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !4, !amdgpu.noclobber !8
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !4, !amdgpu.noclobber !8
  %217 = fadd contract float %214, %216
  %218 = fadd contract float %210, %217
  %219 = or i64 %187, 4
  %220 = add i64 %186, 4
  %221 = getelementptr inbounds float, float addrspace(1)* %0, i64 %219
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !4, !amdgpu.noclobber !8
  %223 = getelementptr inbounds float, float addrspace(1)* %0, i64 %220
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !4, !amdgpu.noclobber !8
  %225 = fadd contract float %222, %224
  %226 = fadd contract float %218, %225
  %227 = or i64 %187, 5
  %228 = add i64 %186, 5
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !4, !amdgpu.noclobber !8
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %228
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !4, !amdgpu.noclobber !8
  %233 = fadd contract float %230, %232
  %234 = fadd contract float %226, %233
  %235 = or i64 %187, 6
  %236 = add i64 %186, 6
  %237 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !4, !amdgpu.noclobber !8
  %239 = getelementptr inbounds float, float addrspace(1)* %0, i64 %236
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !4, !amdgpu.noclobber !8
  %241 = fadd contract float %238, %240
  %242 = fadd contract float %234, %241
  %243 = or i64 %187, 7
  %244 = add i64 %186, 7
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 %243
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !4, !amdgpu.noclobber !8
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %244
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !4, !amdgpu.noclobber !8
  %249 = fadd contract float %246, %248
  %250 = fadd contract float %242, %249
  %251 = add nuw i64 %187, 8
  %252 = add i64 %186, 8
  %253 = add i64 %188, 8
  %254 = icmp eq i64 %253, %183
  br i1 %254, label %255, label %184, !llvm.loop !15

255:                                              ; preds = %184, %175
  %256 = phi float [ undef, %175 ], [ %250, %184 ]
  %257 = phi float [ 0.000000e+00, %175 ], [ %250, %184 ]
  %258 = phi i64 [ %177, %175 ], [ %252, %184 ]
  %259 = phi i64 [ 0, %175 ], [ %251, %184 ]
  %260 = icmp eq i64 %180, 0
  br i1 %260, label %276, label %261

261:                                              ; preds = %255, %261
  %262 = phi float [ %271, %261 ], [ %257, %255 ]
  %263 = phi i64 [ %273, %261 ], [ %258, %255 ]
  %264 = phi i64 [ %272, %261 ], [ %259, %255 ]
  %265 = phi i64 [ %274, %261 ], [ 0, %255 ]
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %264
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !4, !amdgpu.noclobber !8
  %268 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !4, !amdgpu.noclobber !8
  %270 = fadd contract float %267, %269
  %271 = fadd contract float %262, %270
  %272 = add nuw i64 %264, 1
  %273 = add i64 %263, 1
  %274 = add i64 %265, 1
  %275 = icmp eq i64 %274, %180
  br i1 %275, label %276, label %261, !llvm.loop !16

276:                                              ; preds = %261, %255
  %277 = phi float [ %256, %255 ], [ %271, %261 ]
  %278 = trunc i64 %178 to i32
  br label %279

279:                                              ; preds = %164, %276, %172, %157
  %280 = phi i32 [ %173, %276 ], [ %173, %172 ], [ %158, %157 ], [ %158, %164 ]
  %281 = phi float [ %277, %276 ], [ 0.000000e+00, %172 ], [ 0.000000e+00, %157 ], [ %169, %164 ]
  %282 = phi i32 [ %278, %276 ], [ 0, %172 ], [ 0, %157 ], [ %6, %164 ]
  %283 = icmp sgt i32 %4, 2
  br i1 %283, label %284, label %293

284:                                              ; preds = %279
  %285 = add i32 %3, -1
  %286 = mul nsw i32 %285, %2
  %287 = sext i32 %286 to i64
  %288 = icmp sgt i32 %2, 0
  %289 = and i32 %2, 7
  %290 = icmp ult i32 %2, 8
  %291 = and i32 %2, -8
  %292 = icmp eq i32 %289, 0
  br label %306

293:                                              ; preds = %336, %279
  %294 = phi float [ %281, %279 ], [ %337, %336 ]
  %295 = phi i32 [ %282, %279 ], [ %338, %336 ]
  br i1 %283, label %296, label %557

296:                                              ; preds = %293
  %297 = add nsw i32 %2, -1
  %298 = sext i32 %297 to i64
  %299 = icmp sgt i32 %3, 2
  %300 = add i32 %3, -2
  %301 = add i32 %3, -3
  %302 = and i32 %300, 7
  %303 = icmp ult i32 %301, 7
  %304 = and i32 %300, -8
  %305 = icmp eq i32 %302, 0
  br label %427

306:                                              ; preds = %284, %336
  %307 = phi i32 [ %282, %284 ], [ %338, %336 ]
  %308 = phi float [ %281, %284 ], [ %337, %336 ]
  %309 = phi i32 [ 1, %284 ], [ %339, %336 ]
  %310 = zext i32 %309 to i64
  %311 = mul nsw i64 %310, %7
  br i1 %288, label %312, label %336

312:                                              ; preds = %306
  br i1 %290, label %313, label %341

313:                                              ; preds = %341, %312
  %314 = phi float [ undef, %312 ], [ %423, %341 ]
  %315 = phi float [ %308, %312 ], [ %423, %341 ]
  %316 = phi i32 [ 0, %312 ], [ %424, %341 ]
  br i1 %292, label %333, label %317

317:                                              ; preds = %313, %317
  %318 = phi float [ %329, %317 ], [ %315, %313 ]
  %319 = phi i32 [ %330, %317 ], [ %316, %313 ]
  %320 = phi i32 [ %331, %317 ], [ 0, %313 ]
  %321 = zext i32 %319 to i64
  %322 = add i64 %311, %321
  %323 = getelementptr inbounds float, float addrspace(1)* %0, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !4, !amdgpu.noclobber !8
  %325 = add i64 %322, %287
  %326 = getelementptr inbounds float, float addrspace(1)* %0, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !4, !amdgpu.noclobber !8
  %328 = fadd contract float %324, %327
  %329 = fadd contract float %318, %328
  %330 = add nuw nsw i32 %319, 1
  %331 = add i32 %320, 1
  %332 = icmp eq i32 %331, %289
  br i1 %332, label %333, label %317, !llvm.loop !17

333:                                              ; preds = %317, %313
  %334 = phi float [ %314, %313 ], [ %329, %317 ]
  %335 = add i32 %307, %2
  br label %336

336:                                              ; preds = %333, %306
  %337 = phi float [ %308, %306 ], [ %334, %333 ]
  %338 = phi i32 [ %307, %306 ], [ %335, %333 ]
  %339 = add nuw nsw i32 %309, 1
  %340 = icmp eq i32 %339, %280
  br i1 %340, label %293, label %306, !llvm.loop !18

341:                                              ; preds = %312, %341
  %342 = phi float [ %423, %341 ], [ %308, %312 ]
  %343 = phi i32 [ %424, %341 ], [ 0, %312 ]
  %344 = phi i32 [ %425, %341 ], [ 0, %312 ]
  %345 = zext i32 %343 to i64
  %346 = add i64 %311, %345
  %347 = getelementptr inbounds float, float addrspace(1)* %0, i64 %346
  %348 = load float, float addrspace(1)* %347, align 4, !tbaa !4, !amdgpu.noclobber !8
  %349 = add i64 %346, %287
  %350 = getelementptr inbounds float, float addrspace(1)* %0, i64 %349
  %351 = load float, float addrspace(1)* %350, align 4, !tbaa !4, !amdgpu.noclobber !8
  %352 = fadd contract float %348, %351
  %353 = fadd contract float %342, %352
  %354 = or i32 %343, 1
  %355 = zext i32 %354 to i64
  %356 = add i64 %311, %355
  %357 = getelementptr inbounds float, float addrspace(1)* %0, i64 %356
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !4, !amdgpu.noclobber !8
  %359 = add i64 %356, %287
  %360 = getelementptr inbounds float, float addrspace(1)* %0, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !4, !amdgpu.noclobber !8
  %362 = fadd contract float %358, %361
  %363 = fadd contract float %353, %362
  %364 = or i32 %343, 2
  %365 = zext i32 %364 to i64
  %366 = add i64 %311, %365
  %367 = getelementptr inbounds float, float addrspace(1)* %0, i64 %366
  %368 = load float, float addrspace(1)* %367, align 4, !tbaa !4, !amdgpu.noclobber !8
  %369 = add i64 %366, %287
  %370 = getelementptr inbounds float, float addrspace(1)* %0, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !4, !amdgpu.noclobber !8
  %372 = fadd contract float %368, %371
  %373 = fadd contract float %363, %372
  %374 = or i32 %343, 3
  %375 = zext i32 %374 to i64
  %376 = add i64 %311, %375
  %377 = getelementptr inbounds float, float addrspace(1)* %0, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !4, !amdgpu.noclobber !8
  %379 = add i64 %376, %287
  %380 = getelementptr inbounds float, float addrspace(1)* %0, i64 %379
  %381 = load float, float addrspace(1)* %380, align 4, !tbaa !4, !amdgpu.noclobber !8
  %382 = fadd contract float %378, %381
  %383 = fadd contract float %373, %382
  %384 = or i32 %343, 4
  %385 = zext i32 %384 to i64
  %386 = add i64 %311, %385
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !4, !amdgpu.noclobber !8
  %389 = add i64 %386, %287
  %390 = getelementptr inbounds float, float addrspace(1)* %0, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !4, !amdgpu.noclobber !8
  %392 = fadd contract float %388, %391
  %393 = fadd contract float %383, %392
  %394 = or i32 %343, 5
  %395 = zext i32 %394 to i64
  %396 = add i64 %311, %395
  %397 = getelementptr inbounds float, float addrspace(1)* %0, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !4, !amdgpu.noclobber !8
  %399 = add i64 %396, %287
  %400 = getelementptr inbounds float, float addrspace(1)* %0, i64 %399
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !4, !amdgpu.noclobber !8
  %402 = fadd contract float %398, %401
  %403 = fadd contract float %393, %402
  %404 = or i32 %343, 6
  %405 = zext i32 %404 to i64
  %406 = add i64 %311, %405
  %407 = getelementptr inbounds float, float addrspace(1)* %0, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !4, !amdgpu.noclobber !8
  %409 = add i64 %406, %287
  %410 = getelementptr inbounds float, float addrspace(1)* %0, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !4, !amdgpu.noclobber !8
  %412 = fadd contract float %408, %411
  %413 = fadd contract float %403, %412
  %414 = or i32 %343, 7
  %415 = zext i32 %414 to i64
  %416 = add i64 %311, %415
  %417 = getelementptr inbounds float, float addrspace(1)* %0, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !4, !amdgpu.noclobber !8
  %419 = add i64 %416, %287
  %420 = getelementptr inbounds float, float addrspace(1)* %0, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !4, !amdgpu.noclobber !8
  %422 = fadd contract float %418, %421
  %423 = fadd contract float %413, %422
  %424 = add nuw nsw i32 %343, 8
  %425 = add i32 %344, 8
  %426 = icmp eq i32 %425, %291
  br i1 %426, label %313, label %341, !llvm.loop !19

427:                                              ; preds = %296, %458
  %428 = phi i32 [ %295, %296 ], [ %460, %458 ]
  %429 = phi float [ %294, %296 ], [ %459, %458 ]
  %430 = phi i32 [ 1, %296 ], [ %461, %458 ]
  %431 = zext i32 %430 to i64
  %432 = mul nsw i64 %431, %7
  br i1 %299, label %433, label %458

433:                                              ; preds = %427
  br i1 %303, label %434, label %463

434:                                              ; preds = %463, %433
  %435 = phi float [ undef, %433 ], [ %553, %463 ]
  %436 = phi i32 [ 1, %433 ], [ %554, %463 ]
  %437 = phi float [ %429, %433 ], [ %553, %463 ]
  br i1 %305, label %455, label %438

438:                                              ; preds = %434, %438
  %439 = phi i32 [ %452, %438 ], [ %436, %434 ]
  %440 = phi float [ %451, %438 ], [ %437, %434 ]
  %441 = phi i32 [ %453, %438 ], [ 0, %434 ]
  %442 = mul nsw i32 %439, %2
  %443 = sext i32 %442 to i64
  %444 = add i64 %432, %443
  %445 = getelementptr inbounds float, float addrspace(1)* %0, i64 %444
  %446 = load float, float addrspace(1)* %445, align 4, !tbaa !4, !amdgpu.noclobber !8
  %447 = add i64 %444, %298
  %448 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !4, !amdgpu.noclobber !8
  %450 = fadd contract float %446, %449
  %451 = fadd contract float %440, %450
  %452 = add nuw nsw i32 %439, 1
  %453 = add i32 %441, 1
  %454 = icmp eq i32 %453, %302
  br i1 %454, label %455, label %438, !llvm.loop !20

455:                                              ; preds = %438, %434
  %456 = phi float [ %435, %434 ], [ %451, %438 ]
  %457 = add i32 %300, %428
  br label %458

458:                                              ; preds = %455, %427
  %459 = phi float [ %429, %427 ], [ %456, %455 ]
  %460 = phi i32 [ %428, %427 ], [ %457, %455 ]
  %461 = add nuw nsw i32 %430, 1
  %462 = icmp eq i32 %461, %280
  br i1 %462, label %557, label %427, !llvm.loop !21

463:                                              ; preds = %433, %463
  %464 = phi i32 [ %554, %463 ], [ 1, %433 ]
  %465 = phi float [ %553, %463 ], [ %429, %433 ]
  %466 = phi i32 [ %555, %463 ], [ 0, %433 ]
  %467 = mul nsw i32 %464, %2
  %468 = sext i32 %467 to i64
  %469 = add i64 %432, %468
  %470 = getelementptr inbounds float, float addrspace(1)* %0, i64 %469
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !4, !amdgpu.noclobber !8
  %472 = add i64 %469, %298
  %473 = getelementptr inbounds float, float addrspace(1)* %0, i64 %472
  %474 = load float, float addrspace(1)* %473, align 4, !tbaa !4, !amdgpu.noclobber !8
  %475 = fadd contract float %471, %474
  %476 = fadd contract float %465, %475
  %477 = add nuw nsw i32 %464, 1
  %478 = mul nsw i32 %477, %2
  %479 = sext i32 %478 to i64
  %480 = add i64 %432, %479
  %481 = getelementptr inbounds float, float addrspace(1)* %0, i64 %480
  %482 = load float, float addrspace(1)* %481, align 4, !tbaa !4, !amdgpu.noclobber !8
  %483 = add i64 %480, %298
  %484 = getelementptr inbounds float, float addrspace(1)* %0, i64 %483
  %485 = load float, float addrspace(1)* %484, align 4, !tbaa !4, !amdgpu.noclobber !8
  %486 = fadd contract float %482, %485
  %487 = fadd contract float %476, %486
  %488 = add nuw nsw i32 %464, 2
  %489 = mul nsw i32 %488, %2
  %490 = sext i32 %489 to i64
  %491 = add i64 %432, %490
  %492 = getelementptr inbounds float, float addrspace(1)* %0, i64 %491
  %493 = load float, float addrspace(1)* %492, align 4, !tbaa !4, !amdgpu.noclobber !8
  %494 = add i64 %491, %298
  %495 = getelementptr inbounds float, float addrspace(1)* %0, i64 %494
  %496 = load float, float addrspace(1)* %495, align 4, !tbaa !4, !amdgpu.noclobber !8
  %497 = fadd contract float %493, %496
  %498 = fadd contract float %487, %497
  %499 = add nuw nsw i32 %464, 3
  %500 = mul nsw i32 %499, %2
  %501 = sext i32 %500 to i64
  %502 = add i64 %432, %501
  %503 = getelementptr inbounds float, float addrspace(1)* %0, i64 %502
  %504 = load float, float addrspace(1)* %503, align 4, !tbaa !4, !amdgpu.noclobber !8
  %505 = add i64 %502, %298
  %506 = getelementptr inbounds float, float addrspace(1)* %0, i64 %505
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !4, !amdgpu.noclobber !8
  %508 = fadd contract float %504, %507
  %509 = fadd contract float %498, %508
  %510 = add nuw nsw i32 %464, 4
  %511 = mul nsw i32 %510, %2
  %512 = sext i32 %511 to i64
  %513 = add i64 %432, %512
  %514 = getelementptr inbounds float, float addrspace(1)* %0, i64 %513
  %515 = load float, float addrspace(1)* %514, align 4, !tbaa !4, !amdgpu.noclobber !8
  %516 = add i64 %513, %298
  %517 = getelementptr inbounds float, float addrspace(1)* %0, i64 %516
  %518 = load float, float addrspace(1)* %517, align 4, !tbaa !4, !amdgpu.noclobber !8
  %519 = fadd contract float %515, %518
  %520 = fadd contract float %509, %519
  %521 = add nuw nsw i32 %464, 5
  %522 = mul nsw i32 %521, %2
  %523 = sext i32 %522 to i64
  %524 = add i64 %432, %523
  %525 = getelementptr inbounds float, float addrspace(1)* %0, i64 %524
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !4, !amdgpu.noclobber !8
  %527 = add i64 %524, %298
  %528 = getelementptr inbounds float, float addrspace(1)* %0, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !4, !amdgpu.noclobber !8
  %530 = fadd contract float %526, %529
  %531 = fadd contract float %520, %530
  %532 = add nuw nsw i32 %464, 6
  %533 = mul nsw i32 %532, %2
  %534 = sext i32 %533 to i64
  %535 = add i64 %432, %534
  %536 = getelementptr inbounds float, float addrspace(1)* %0, i64 %535
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !4, !amdgpu.noclobber !8
  %538 = add i64 %535, %298
  %539 = getelementptr inbounds float, float addrspace(1)* %0, i64 %538
  %540 = load float, float addrspace(1)* %539, align 4, !tbaa !4, !amdgpu.noclobber !8
  %541 = fadd contract float %537, %540
  %542 = fadd contract float %531, %541
  %543 = add nuw nsw i32 %464, 7
  %544 = mul nsw i32 %543, %2
  %545 = sext i32 %544 to i64
  %546 = add i64 %432, %545
  %547 = getelementptr inbounds float, float addrspace(1)* %0, i64 %546
  %548 = load float, float addrspace(1)* %547, align 4, !tbaa !4, !amdgpu.noclobber !8
  %549 = add i64 %546, %298
  %550 = getelementptr inbounds float, float addrspace(1)* %0, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !4, !amdgpu.noclobber !8
  %552 = fadd contract float %548, %551
  %553 = fadd contract float %542, %552
  %554 = add nuw nsw i32 %464, 8
  %555 = add i32 %466, 8
  %556 = icmp eq i32 %555, %304
  br i1 %556, label %434, label %463, !llvm.loop !22

557:                                              ; preds = %458, %293, %135
  %558 = phi i32 [ %137, %135 ], [ %295, %293 ], [ %460, %458 ]
  %559 = phi float [ %136, %135 ], [ %294, %293 ], [ %459, %458 ]
  %560 = shl i32 %558, 1
  %561 = sitofp i32 %560 to float
  %562 = fdiv contract float %559, %561
  store float %562, float addrspace(1)* %1, align 4, !tbaa !4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !12}
