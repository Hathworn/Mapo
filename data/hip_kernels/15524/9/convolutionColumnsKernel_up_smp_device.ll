; ModuleID = '../data/hip_kernels/15524/9/main.cu'
source_filename = "../data/hip_kernels/15524/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z31convolutionColumnsKernel_up_smpPfS_iiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 2
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 6
  %15 = shl i32 %7, 4
  %16 = sub i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %12, %2
  br i1 %19, label %20, label %1047

20:                                               ; preds = %8
  %21 = mul nsw i32 %18, %5
  %22 = add nsw i32 %21, %12
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = shl nsw i32 %18, 1
  %26 = mul nsw i32 %25, %5
  %27 = add nsw i32 %26, %12
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = icmp sgt i32 %7, 0
  br i1 %30, label %31, label %62

31:                                               ; preds = %20
  %32 = shl nuw nsw i32 %7, 1
  %33 = add nsw i32 %32, 4
  %34 = shl nuw nsw i32 %11, 4
  %35 = mul i32 %34, %33
  %36 = add i32 %35, %17
  %37 = and i32 %7, 3
  %38 = icmp ult i32 %7, 4
  br i1 %38, label %41, label %39

39:                                               ; preds = %31
  %40 = and i32 %7, -4
  br label %72

41:                                               ; preds = %122, %31
  %42 = phi i32 [ 0, %31 ], [ %126, %122 ]
  %43 = icmp eq i32 %37, 0
  br i1 %43, label %62, label %44

44:                                               ; preds = %41, %55
  %45 = phi i32 [ %59, %55 ], [ %42, %41 ]
  %46 = phi i32 [ %60, %55 ], [ 0, %41 ]
  %47 = shl nsw i32 %45, 4
  %48 = add nsw i32 %47, %18
  %49 = icmp sgt i32 %48, -1
  br i1 %49, label %50, label %55

50:                                               ; preds = %44
  %51 = mul nsw i32 %47, %5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %24, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %55

55:                                               ; preds = %50, %44
  %56 = phi contract float [ %54, %50 ], [ 0.000000e+00, %44 ]
  %57 = add i32 %36, %47
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %57
  store float %56, float addrspace(3)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i32 %45, 1
  %60 = add i32 %46, 1
  %61 = icmp eq i32 %60, %37
  br i1 %61, label %62, label %44, !llvm.loop !10

62:                                               ; preds = %41, %55, %20
  %63 = shl i32 %7, 1
  %64 = add i32 %63, 4
  %65 = icmp sgt i32 %7, -4
  %66 = shl nsw i32 %7, 1
  %67 = add nsw i32 %66, 4
  br i1 %65, label %68, label %129

68:                                               ; preds = %62
  %69 = shl nuw nsw i32 %11, 4
  %70 = mul i32 %69, %67
  %71 = add i32 %70, %17
  br label %144

72:                                               ; preds = %122, %39
  %73 = phi i32 [ 0, %39 ], [ %126, %122 ]
  %74 = phi i32 [ 0, %39 ], [ %127, %122 ]
  %75 = shl nsw i32 %73, 4
  %76 = add nsw i32 %75, %18
  %77 = icmp sgt i32 %76, -1
  br i1 %77, label %78, label %83

78:                                               ; preds = %72
  %79 = mul nsw i32 %75, %5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %24, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %72, %78
  %84 = phi contract float [ %82, %78 ], [ 0.000000e+00, %72 ]
  %85 = add i32 %36, %75
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %85
  store float %84, float addrspace(3)* %86, align 4, !tbaa !5
  %87 = shl i32 %73, 4
  %88 = or i32 %87, 16
  %89 = add nsw i32 %88, %18
  %90 = icmp sgt i32 %89, -1
  br i1 %90, label %91, label %96

91:                                               ; preds = %83
  %92 = mul nsw i32 %88, %5
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %24, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %96

96:                                               ; preds = %91, %83
  %97 = phi contract float [ %95, %91 ], [ 0.000000e+00, %83 ]
  %98 = add i32 %36, %88
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %98
  store float %97, float addrspace(3)* %99, align 4, !tbaa !5
  %100 = shl i32 %73, 4
  %101 = or i32 %100, 32
  %102 = add nsw i32 %101, %18
  %103 = icmp sgt i32 %102, -1
  br i1 %103, label %104, label %109

104:                                              ; preds = %96
  %105 = mul nsw i32 %101, %5
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %24, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %109

109:                                              ; preds = %104, %96
  %110 = phi contract float [ %108, %104 ], [ 0.000000e+00, %96 ]
  %111 = add i32 %36, %101
  %112 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %111
  store float %110, float addrspace(3)* %112, align 4, !tbaa !5
  %113 = shl i32 %73, 4
  %114 = or i32 %113, 48
  %115 = add nsw i32 %114, %18
  %116 = icmp sgt i32 %115, -1
  br i1 %116, label %117, label %122

117:                                              ; preds = %109
  %118 = mul nsw i32 %114, %5
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %24, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %122

122:                                              ; preds = %117, %109
  %123 = phi contract float [ %121, %117 ], [ 0.000000e+00, %109 ]
  %124 = add i32 %36, %114
  %125 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %124
  store float %123, float addrspace(3)* %125, align 4, !tbaa !5
  %126 = add nuw nsw i32 %73, 4
  %127 = add i32 %74, 4
  %128 = icmp eq i32 %127, %40
  br i1 %128, label %41, label %72, !llvm.loop !12

129:                                              ; preds = %154, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = sdiv i32 %6, 2
  %131 = sub nsw i32 0, %130
  %132 = icmp slt i32 %6, -1
  %133 = mul i32 %67, %11
  %134 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %135 = shl nsw i32 %6, 1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float* %134, i64 %136
  %138 = add nuw nsw i32 %17, 1
  %139 = add nsw i32 %138, %130
  %140 = tail call i32 @llvm.abs.i32(i32 %130, i1 true)
  %141 = shl nsw i32 %7, 5
  %142 = add nsw i32 %141, %25
  %143 = icmp slt i32 %142, %4
  br i1 %143, label %160, label %378

144:                                              ; preds = %68, %154
  %145 = phi i32 [ %7, %68 ], [ %158, %154 ]
  %146 = shl nsw i32 %145, 4
  %147 = add nsw i32 %146, %18
  %148 = icmp slt i32 %147, %3
  br i1 %148, label %149, label %154

149:                                              ; preds = %144
  %150 = mul nsw i32 %146, %5
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %24, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %154

154:                                              ; preds = %144, %149
  %155 = phi contract float [ %153, %149 ], [ 0.000000e+00, %144 ]
  %156 = add i32 %71, %146
  %157 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %156
  store float %155, float addrspace(3)* %157, align 4, !tbaa !5
  %158 = add nsw i32 %145, 1
  %159 = icmp slt i32 %158, %64
  br i1 %159, label %144, label %129, !llvm.loop !14

160:                                              ; preds = %129
  %161 = add i32 %133, %7
  %162 = shl i32 %161, 4
  br i1 %132, label %202, label %163

163:                                              ; preds = %160
  %164 = add i32 %162, %17
  %165 = add i32 %130, %140
  %166 = add i32 %165, 1
  %167 = and i32 %166, 7
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %195, label %169

169:                                              ; preds = %163, %169
  %170 = phi i32 [ %192, %169 ], [ %131, %163 ]
  %171 = phi float [ %191, %169 ], [ 0.000000e+00, %163 ]
  %172 = phi float [ %184, %169 ], [ 0.000000e+00, %163 ]
  %173 = phi i32 [ %193, %169 ], [ 0, %163 ]
  %174 = shl nsw i32 %170, 1
  %175 = add i32 %164, %170
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %178 = add nsw i32 %174, %6
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float* %134, i64 %179
  %181 = load float, float* %180, align 4, !tbaa !5
  %182 = fmul contract float %177, %181
  %183 = fmul contract float %182, 2.000000e+00
  %184 = fadd contract float %172, %183
  %185 = add nsw i32 %178, -1
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float* %134, i64 %186
  %188 = load float, float* %187, align 4, !tbaa !5
  %189 = fmul contract float %177, %188
  %190 = fmul contract float %189, 2.000000e+00
  %191 = fadd contract float %171, %190
  %192 = add i32 %170, 1
  %193 = add i32 %173, 1
  %194 = icmp eq i32 %193, %167
  br i1 %194, label %195, label %169, !llvm.loop !15

195:                                              ; preds = %169, %163
  %196 = phi float [ undef, %163 ], [ %184, %169 ]
  %197 = phi float [ undef, %163 ], [ %191, %169 ]
  %198 = phi i32 [ %131, %163 ], [ %192, %169 ]
  %199 = phi float [ 0.000000e+00, %163 ], [ %191, %169 ]
  %200 = phi float [ 0.000000e+00, %163 ], [ %184, %169 ]
  %201 = icmp ult i32 %165, 7
  br i1 %201, label %202, label %214

202:                                              ; preds = %195, %214, %160
  %203 = phi float [ 0.000000e+00, %160 ], [ %196, %195 ], [ %361, %214 ]
  %204 = phi float [ 0.000000e+00, %160 ], [ %197, %195 ], [ %368, %214 ]
  %205 = load float, float* %137, align 4, !tbaa !5
  %206 = add i32 %139, %162
  %207 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !5
  %209 = mul nsw i32 %141, %5
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %29, i64 %210
  store float %203, float addrspace(1)* %211, align 4, !tbaa !5
  %212 = or i32 %142, 1
  %213 = icmp slt i32 %212, %4
  br i1 %213, label %371, label %378

214:                                              ; preds = %195, %214
  %215 = phi i32 [ %369, %214 ], [ %198, %195 ]
  %216 = phi float [ %368, %214 ], [ %199, %195 ]
  %217 = phi float [ %361, %214 ], [ %200, %195 ]
  %218 = shl nsw i32 %215, 1
  %219 = add i32 %164, %215
  %220 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %219
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %222 = add nsw i32 %218, %6
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float* %134, i64 %223
  %225 = load float, float* %224, align 4, !tbaa !5
  %226 = fmul contract float %221, %225
  %227 = fmul contract float %226, 2.000000e+00
  %228 = fadd contract float %217, %227
  %229 = add nsw i32 %222, -1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float* %134, i64 %230
  %232 = load float, float* %231, align 4, !tbaa !5
  %233 = fmul contract float %221, %232
  %234 = fmul contract float %233, 2.000000e+00
  %235 = fadd contract float %216, %234
  %236 = add i32 %215, 1
  %237 = shl nsw i32 %236, 1
  %238 = add i32 %164, %236
  %239 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %238
  %240 = load float, float addrspace(3)* %239, align 4, !tbaa !5
  %241 = add nsw i32 %237, %6
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float* %134, i64 %242
  %244 = load float, float* %243, align 4, !tbaa !5
  %245 = fmul contract float %240, %244
  %246 = fmul contract float %245, 2.000000e+00
  %247 = fadd contract float %228, %246
  %248 = add nsw i32 %241, -1
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float* %134, i64 %249
  %251 = load float, float* %250, align 4, !tbaa !5
  %252 = fmul contract float %240, %251
  %253 = fmul contract float %252, 2.000000e+00
  %254 = fadd contract float %235, %253
  %255 = add i32 %215, 2
  %256 = shl nsw i32 %255, 1
  %257 = add i32 %164, %255
  %258 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %257
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %260 = add nsw i32 %256, %6
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float* %134, i64 %261
  %263 = load float, float* %262, align 4, !tbaa !5
  %264 = fmul contract float %259, %263
  %265 = fmul contract float %264, 2.000000e+00
  %266 = fadd contract float %247, %265
  %267 = add nsw i32 %260, -1
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float* %134, i64 %268
  %270 = load float, float* %269, align 4, !tbaa !5
  %271 = fmul contract float %259, %270
  %272 = fmul contract float %271, 2.000000e+00
  %273 = fadd contract float %254, %272
  %274 = add i32 %215, 3
  %275 = shl nsw i32 %274, 1
  %276 = add i32 %164, %274
  %277 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = add nsw i32 %275, %6
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float* %134, i64 %280
  %282 = load float, float* %281, align 4, !tbaa !5
  %283 = fmul contract float %278, %282
  %284 = fmul contract float %283, 2.000000e+00
  %285 = fadd contract float %266, %284
  %286 = add nsw i32 %279, -1
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float* %134, i64 %287
  %289 = load float, float* %288, align 4, !tbaa !5
  %290 = fmul contract float %278, %289
  %291 = fmul contract float %290, 2.000000e+00
  %292 = fadd contract float %273, %291
  %293 = add i32 %215, 4
  %294 = shl nsw i32 %293, 1
  %295 = add i32 %164, %293
  %296 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %295
  %297 = load float, float addrspace(3)* %296, align 4, !tbaa !5
  %298 = add nsw i32 %294, %6
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float* %134, i64 %299
  %301 = load float, float* %300, align 4, !tbaa !5
  %302 = fmul contract float %297, %301
  %303 = fmul contract float %302, 2.000000e+00
  %304 = fadd contract float %285, %303
  %305 = add nsw i32 %298, -1
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float* %134, i64 %306
  %308 = load float, float* %307, align 4, !tbaa !5
  %309 = fmul contract float %297, %308
  %310 = fmul contract float %309, 2.000000e+00
  %311 = fadd contract float %292, %310
  %312 = add i32 %215, 5
  %313 = shl nsw i32 %312, 1
  %314 = add i32 %164, %312
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !5
  %317 = add nsw i32 %313, %6
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float* %134, i64 %318
  %320 = load float, float* %319, align 4, !tbaa !5
  %321 = fmul contract float %316, %320
  %322 = fmul contract float %321, 2.000000e+00
  %323 = fadd contract float %304, %322
  %324 = add nsw i32 %317, -1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float* %134, i64 %325
  %327 = load float, float* %326, align 4, !tbaa !5
  %328 = fmul contract float %316, %327
  %329 = fmul contract float %328, 2.000000e+00
  %330 = fadd contract float %311, %329
  %331 = add i32 %215, 6
  %332 = shl nsw i32 %331, 1
  %333 = add i32 %164, %331
  %334 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %333
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !5
  %336 = add nsw i32 %332, %6
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds float, float* %134, i64 %337
  %339 = load float, float* %338, align 4, !tbaa !5
  %340 = fmul contract float %335, %339
  %341 = fmul contract float %340, 2.000000e+00
  %342 = fadd contract float %323, %341
  %343 = add nsw i32 %336, -1
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float* %134, i64 %344
  %346 = load float, float* %345, align 4, !tbaa !5
  %347 = fmul contract float %335, %346
  %348 = fmul contract float %347, 2.000000e+00
  %349 = fadd contract float %330, %348
  %350 = add i32 %215, 7
  %351 = shl nsw i32 %350, 1
  %352 = add i32 %164, %350
  %353 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %352
  %354 = load float, float addrspace(3)* %353, align 4, !tbaa !5
  %355 = add nsw i32 %351, %6
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds float, float* %134, i64 %356
  %358 = load float, float* %357, align 4, !tbaa !5
  %359 = fmul contract float %354, %358
  %360 = fmul contract float %359, 2.000000e+00
  %361 = fadd contract float %342, %360
  %362 = add nsw i32 %355, -1
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float* %134, i64 %363
  %365 = load float, float* %364, align 4, !tbaa !5
  %366 = fmul contract float %354, %365
  %367 = fmul contract float %366, 2.000000e+00
  %368 = fadd contract float %349, %367
  %369 = add i32 %215, 8
  %370 = icmp eq i32 %350, %140
  br i1 %370, label %202, label %214, !llvm.loop !16

371:                                              ; preds = %202
  %372 = fmul contract float %205, 2.000000e+00
  %373 = fmul contract float %372, %208
  %374 = fadd contract float %204, %373
  %375 = add nsw i32 %209, %5
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %29, i64 %376
  store float %374, float addrspace(1)* %377, align 4, !tbaa !5
  br label %378

378:                                              ; preds = %202, %371, %129
  %379 = add nsw i32 %7, 1
  %380 = shl nsw i32 %379, 5
  %381 = add nsw i32 %380, %25
  %382 = icmp slt i32 %381, %4
  br i1 %382, label %383, label %601

383:                                              ; preds = %378
  %384 = add i32 %379, %133
  %385 = shl i32 %384, 4
  br i1 %132, label %582, label %386

386:                                              ; preds = %383
  %387 = add i32 %385, %17
  %388 = add i32 %130, %140
  %389 = add i32 %388, 1
  %390 = and i32 %389, 7
  %391 = icmp eq i32 %390, 0
  br i1 %391, label %418, label %392

392:                                              ; preds = %386, %392
  %393 = phi i32 [ %415, %392 ], [ %131, %386 ]
  %394 = phi float [ %414, %392 ], [ 0.000000e+00, %386 ]
  %395 = phi float [ %407, %392 ], [ 0.000000e+00, %386 ]
  %396 = phi i32 [ %416, %392 ], [ 0, %386 ]
  %397 = shl nsw i32 %393, 1
  %398 = add i32 %387, %393
  %399 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %398
  %400 = load float, float addrspace(3)* %399, align 4, !tbaa !5
  %401 = add nsw i32 %397, %6
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds float, float* %134, i64 %402
  %404 = load float, float* %403, align 4, !tbaa !5
  %405 = fmul contract float %400, %404
  %406 = fmul contract float %405, 2.000000e+00
  %407 = fadd contract float %395, %406
  %408 = add nsw i32 %401, -1
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds float, float* %134, i64 %409
  %411 = load float, float* %410, align 4, !tbaa !5
  %412 = fmul contract float %400, %411
  %413 = fmul contract float %412, 2.000000e+00
  %414 = fadd contract float %394, %413
  %415 = add i32 %393, 1
  %416 = add i32 %396, 1
  %417 = icmp eq i32 %416, %390
  br i1 %417, label %418, label %392, !llvm.loop !17

418:                                              ; preds = %392, %386
  %419 = phi float [ undef, %386 ], [ %407, %392 ]
  %420 = phi float [ undef, %386 ], [ %414, %392 ]
  %421 = phi i32 [ %131, %386 ], [ %415, %392 ]
  %422 = phi float [ 0.000000e+00, %386 ], [ %414, %392 ]
  %423 = phi float [ 0.000000e+00, %386 ], [ %407, %392 ]
  %424 = icmp ult i32 %388, 7
  br i1 %424, label %582, label %425

425:                                              ; preds = %418, %425
  %426 = phi i32 [ %580, %425 ], [ %421, %418 ]
  %427 = phi float [ %579, %425 ], [ %422, %418 ]
  %428 = phi float [ %572, %425 ], [ %423, %418 ]
  %429 = shl nsw i32 %426, 1
  %430 = add i32 %387, %426
  %431 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %430
  %432 = load float, float addrspace(3)* %431, align 4, !tbaa !5
  %433 = add nsw i32 %429, %6
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float* %134, i64 %434
  %436 = load float, float* %435, align 4, !tbaa !5
  %437 = fmul contract float %432, %436
  %438 = fmul contract float %437, 2.000000e+00
  %439 = fadd contract float %428, %438
  %440 = add nsw i32 %433, -1
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds float, float* %134, i64 %441
  %443 = load float, float* %442, align 4, !tbaa !5
  %444 = fmul contract float %432, %443
  %445 = fmul contract float %444, 2.000000e+00
  %446 = fadd contract float %427, %445
  %447 = add i32 %426, 1
  %448 = shl nsw i32 %447, 1
  %449 = add i32 %387, %447
  %450 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %449
  %451 = load float, float addrspace(3)* %450, align 4, !tbaa !5
  %452 = add nsw i32 %448, %6
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds float, float* %134, i64 %453
  %455 = load float, float* %454, align 4, !tbaa !5
  %456 = fmul contract float %451, %455
  %457 = fmul contract float %456, 2.000000e+00
  %458 = fadd contract float %439, %457
  %459 = add nsw i32 %452, -1
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds float, float* %134, i64 %460
  %462 = load float, float* %461, align 4, !tbaa !5
  %463 = fmul contract float %451, %462
  %464 = fmul contract float %463, 2.000000e+00
  %465 = fadd contract float %446, %464
  %466 = add i32 %426, 2
  %467 = shl nsw i32 %466, 1
  %468 = add i32 %387, %466
  %469 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %468
  %470 = load float, float addrspace(3)* %469, align 4, !tbaa !5
  %471 = add nsw i32 %467, %6
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds float, float* %134, i64 %472
  %474 = load float, float* %473, align 4, !tbaa !5
  %475 = fmul contract float %470, %474
  %476 = fmul contract float %475, 2.000000e+00
  %477 = fadd contract float %458, %476
  %478 = add nsw i32 %471, -1
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds float, float* %134, i64 %479
  %481 = load float, float* %480, align 4, !tbaa !5
  %482 = fmul contract float %470, %481
  %483 = fmul contract float %482, 2.000000e+00
  %484 = fadd contract float %465, %483
  %485 = add i32 %426, 3
  %486 = shl nsw i32 %485, 1
  %487 = add i32 %387, %485
  %488 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %487
  %489 = load float, float addrspace(3)* %488, align 4, !tbaa !5
  %490 = add nsw i32 %486, %6
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds float, float* %134, i64 %491
  %493 = load float, float* %492, align 4, !tbaa !5
  %494 = fmul contract float %489, %493
  %495 = fmul contract float %494, 2.000000e+00
  %496 = fadd contract float %477, %495
  %497 = add nsw i32 %490, -1
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds float, float* %134, i64 %498
  %500 = load float, float* %499, align 4, !tbaa !5
  %501 = fmul contract float %489, %500
  %502 = fmul contract float %501, 2.000000e+00
  %503 = fadd contract float %484, %502
  %504 = add i32 %426, 4
  %505 = shl nsw i32 %504, 1
  %506 = add i32 %387, %504
  %507 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %506
  %508 = load float, float addrspace(3)* %507, align 4, !tbaa !5
  %509 = add nsw i32 %505, %6
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds float, float* %134, i64 %510
  %512 = load float, float* %511, align 4, !tbaa !5
  %513 = fmul contract float %508, %512
  %514 = fmul contract float %513, 2.000000e+00
  %515 = fadd contract float %496, %514
  %516 = add nsw i32 %509, -1
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float* %134, i64 %517
  %519 = load float, float* %518, align 4, !tbaa !5
  %520 = fmul contract float %508, %519
  %521 = fmul contract float %520, 2.000000e+00
  %522 = fadd contract float %503, %521
  %523 = add i32 %426, 5
  %524 = shl nsw i32 %523, 1
  %525 = add i32 %387, %523
  %526 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %525
  %527 = load float, float addrspace(3)* %526, align 4, !tbaa !5
  %528 = add nsw i32 %524, %6
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float* %134, i64 %529
  %531 = load float, float* %530, align 4, !tbaa !5
  %532 = fmul contract float %527, %531
  %533 = fmul contract float %532, 2.000000e+00
  %534 = fadd contract float %515, %533
  %535 = add nsw i32 %528, -1
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds float, float* %134, i64 %536
  %538 = load float, float* %537, align 4, !tbaa !5
  %539 = fmul contract float %527, %538
  %540 = fmul contract float %539, 2.000000e+00
  %541 = fadd contract float %522, %540
  %542 = add i32 %426, 6
  %543 = shl nsw i32 %542, 1
  %544 = add i32 %387, %542
  %545 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %544
  %546 = load float, float addrspace(3)* %545, align 4, !tbaa !5
  %547 = add nsw i32 %543, %6
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float* %134, i64 %548
  %550 = load float, float* %549, align 4, !tbaa !5
  %551 = fmul contract float %546, %550
  %552 = fmul contract float %551, 2.000000e+00
  %553 = fadd contract float %534, %552
  %554 = add nsw i32 %547, -1
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds float, float* %134, i64 %555
  %557 = load float, float* %556, align 4, !tbaa !5
  %558 = fmul contract float %546, %557
  %559 = fmul contract float %558, 2.000000e+00
  %560 = fadd contract float %541, %559
  %561 = add i32 %426, 7
  %562 = shl nsw i32 %561, 1
  %563 = add i32 %387, %561
  %564 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %563
  %565 = load float, float addrspace(3)* %564, align 4, !tbaa !5
  %566 = add nsw i32 %562, %6
  %567 = sext i32 %566 to i64
  %568 = getelementptr inbounds float, float* %134, i64 %567
  %569 = load float, float* %568, align 4, !tbaa !5
  %570 = fmul contract float %565, %569
  %571 = fmul contract float %570, 2.000000e+00
  %572 = fadd contract float %553, %571
  %573 = add nsw i32 %566, -1
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds float, float* %134, i64 %574
  %576 = load float, float* %575, align 4, !tbaa !5
  %577 = fmul contract float %565, %576
  %578 = fmul contract float %577, 2.000000e+00
  %579 = fadd contract float %560, %578
  %580 = add i32 %426, 8
  %581 = icmp eq i32 %561, %140
  br i1 %581, label %582, label %425, !llvm.loop !16

582:                                              ; preds = %418, %425, %383
  %583 = phi float [ 0.000000e+00, %383 ], [ %419, %418 ], [ %572, %425 ]
  %584 = phi float [ 0.000000e+00, %383 ], [ %420, %418 ], [ %579, %425 ]
  %585 = load float, float* %137, align 4, !tbaa !5
  %586 = add i32 %139, %385
  %587 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %586
  %588 = load float, float addrspace(3)* %587, align 4, !tbaa !5
  %589 = mul nsw i32 %380, %5
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds float, float addrspace(1)* %29, i64 %590
  store float %583, float addrspace(1)* %591, align 4, !tbaa !5
  %592 = or i32 %381, 1
  %593 = icmp slt i32 %592, %4
  br i1 %593, label %594, label %601

594:                                              ; preds = %582
  %595 = fmul contract float %585, 2.000000e+00
  %596 = fmul contract float %595, %588
  %597 = fadd contract float %584, %596
  %598 = add nsw i32 %589, %5
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %29, i64 %599
  store float %597, float addrspace(1)* %600, align 4, !tbaa !5
  br label %601

601:                                              ; preds = %594, %582, %378
  %602 = add nsw i32 %7, 2
  %603 = shl nsw i32 %602, 5
  %604 = add nsw i32 %603, %25
  %605 = icmp slt i32 %604, %4
  br i1 %605, label %606, label %824

606:                                              ; preds = %601
  %607 = add i32 %602, %133
  %608 = shl i32 %607, 4
  br i1 %132, label %805, label %609

609:                                              ; preds = %606
  %610 = add i32 %608, %17
  %611 = add i32 %130, %140
  %612 = add i32 %611, 1
  %613 = and i32 %612, 7
  %614 = icmp eq i32 %613, 0
  br i1 %614, label %641, label %615

615:                                              ; preds = %609, %615
  %616 = phi i32 [ %638, %615 ], [ %131, %609 ]
  %617 = phi float [ %637, %615 ], [ 0.000000e+00, %609 ]
  %618 = phi float [ %630, %615 ], [ 0.000000e+00, %609 ]
  %619 = phi i32 [ %639, %615 ], [ 0, %609 ]
  %620 = shl nsw i32 %616, 1
  %621 = add i32 %610, %616
  %622 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %621
  %623 = load float, float addrspace(3)* %622, align 4, !tbaa !5
  %624 = add nsw i32 %620, %6
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float* %134, i64 %625
  %627 = load float, float* %626, align 4, !tbaa !5
  %628 = fmul contract float %623, %627
  %629 = fmul contract float %628, 2.000000e+00
  %630 = fadd contract float %618, %629
  %631 = add nsw i32 %624, -1
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds float, float* %134, i64 %632
  %634 = load float, float* %633, align 4, !tbaa !5
  %635 = fmul contract float %623, %634
  %636 = fmul contract float %635, 2.000000e+00
  %637 = fadd contract float %617, %636
  %638 = add i32 %616, 1
  %639 = add i32 %619, 1
  %640 = icmp eq i32 %639, %613
  br i1 %640, label %641, label %615, !llvm.loop !18

641:                                              ; preds = %615, %609
  %642 = phi float [ undef, %609 ], [ %630, %615 ]
  %643 = phi float [ undef, %609 ], [ %637, %615 ]
  %644 = phi i32 [ %131, %609 ], [ %638, %615 ]
  %645 = phi float [ 0.000000e+00, %609 ], [ %637, %615 ]
  %646 = phi float [ 0.000000e+00, %609 ], [ %630, %615 ]
  %647 = icmp ult i32 %611, 7
  br i1 %647, label %805, label %648

648:                                              ; preds = %641, %648
  %649 = phi i32 [ %803, %648 ], [ %644, %641 ]
  %650 = phi float [ %802, %648 ], [ %645, %641 ]
  %651 = phi float [ %795, %648 ], [ %646, %641 ]
  %652 = shl nsw i32 %649, 1
  %653 = add i32 %610, %649
  %654 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %653
  %655 = load float, float addrspace(3)* %654, align 4, !tbaa !5
  %656 = add nsw i32 %652, %6
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds float, float* %134, i64 %657
  %659 = load float, float* %658, align 4, !tbaa !5
  %660 = fmul contract float %655, %659
  %661 = fmul contract float %660, 2.000000e+00
  %662 = fadd contract float %651, %661
  %663 = add nsw i32 %656, -1
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds float, float* %134, i64 %664
  %666 = load float, float* %665, align 4, !tbaa !5
  %667 = fmul contract float %655, %666
  %668 = fmul contract float %667, 2.000000e+00
  %669 = fadd contract float %650, %668
  %670 = add i32 %649, 1
  %671 = shl nsw i32 %670, 1
  %672 = add i32 %610, %670
  %673 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %672
  %674 = load float, float addrspace(3)* %673, align 4, !tbaa !5
  %675 = add nsw i32 %671, %6
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds float, float* %134, i64 %676
  %678 = load float, float* %677, align 4, !tbaa !5
  %679 = fmul contract float %674, %678
  %680 = fmul contract float %679, 2.000000e+00
  %681 = fadd contract float %662, %680
  %682 = add nsw i32 %675, -1
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds float, float* %134, i64 %683
  %685 = load float, float* %684, align 4, !tbaa !5
  %686 = fmul contract float %674, %685
  %687 = fmul contract float %686, 2.000000e+00
  %688 = fadd contract float %669, %687
  %689 = add i32 %649, 2
  %690 = shl nsw i32 %689, 1
  %691 = add i32 %610, %689
  %692 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %691
  %693 = load float, float addrspace(3)* %692, align 4, !tbaa !5
  %694 = add nsw i32 %690, %6
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds float, float* %134, i64 %695
  %697 = load float, float* %696, align 4, !tbaa !5
  %698 = fmul contract float %693, %697
  %699 = fmul contract float %698, 2.000000e+00
  %700 = fadd contract float %681, %699
  %701 = add nsw i32 %694, -1
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds float, float* %134, i64 %702
  %704 = load float, float* %703, align 4, !tbaa !5
  %705 = fmul contract float %693, %704
  %706 = fmul contract float %705, 2.000000e+00
  %707 = fadd contract float %688, %706
  %708 = add i32 %649, 3
  %709 = shl nsw i32 %708, 1
  %710 = add i32 %610, %708
  %711 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %710
  %712 = load float, float addrspace(3)* %711, align 4, !tbaa !5
  %713 = add nsw i32 %709, %6
  %714 = sext i32 %713 to i64
  %715 = getelementptr inbounds float, float* %134, i64 %714
  %716 = load float, float* %715, align 4, !tbaa !5
  %717 = fmul contract float %712, %716
  %718 = fmul contract float %717, 2.000000e+00
  %719 = fadd contract float %700, %718
  %720 = add nsw i32 %713, -1
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds float, float* %134, i64 %721
  %723 = load float, float* %722, align 4, !tbaa !5
  %724 = fmul contract float %712, %723
  %725 = fmul contract float %724, 2.000000e+00
  %726 = fadd contract float %707, %725
  %727 = add i32 %649, 4
  %728 = shl nsw i32 %727, 1
  %729 = add i32 %610, %727
  %730 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %729
  %731 = load float, float addrspace(3)* %730, align 4, !tbaa !5
  %732 = add nsw i32 %728, %6
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds float, float* %134, i64 %733
  %735 = load float, float* %734, align 4, !tbaa !5
  %736 = fmul contract float %731, %735
  %737 = fmul contract float %736, 2.000000e+00
  %738 = fadd contract float %719, %737
  %739 = add nsw i32 %732, -1
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds float, float* %134, i64 %740
  %742 = load float, float* %741, align 4, !tbaa !5
  %743 = fmul contract float %731, %742
  %744 = fmul contract float %743, 2.000000e+00
  %745 = fadd contract float %726, %744
  %746 = add i32 %649, 5
  %747 = shl nsw i32 %746, 1
  %748 = add i32 %610, %746
  %749 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %748
  %750 = load float, float addrspace(3)* %749, align 4, !tbaa !5
  %751 = add nsw i32 %747, %6
  %752 = sext i32 %751 to i64
  %753 = getelementptr inbounds float, float* %134, i64 %752
  %754 = load float, float* %753, align 4, !tbaa !5
  %755 = fmul contract float %750, %754
  %756 = fmul contract float %755, 2.000000e+00
  %757 = fadd contract float %738, %756
  %758 = add nsw i32 %751, -1
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds float, float* %134, i64 %759
  %761 = load float, float* %760, align 4, !tbaa !5
  %762 = fmul contract float %750, %761
  %763 = fmul contract float %762, 2.000000e+00
  %764 = fadd contract float %745, %763
  %765 = add i32 %649, 6
  %766 = shl nsw i32 %765, 1
  %767 = add i32 %610, %765
  %768 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %767
  %769 = load float, float addrspace(3)* %768, align 4, !tbaa !5
  %770 = add nsw i32 %766, %6
  %771 = sext i32 %770 to i64
  %772 = getelementptr inbounds float, float* %134, i64 %771
  %773 = load float, float* %772, align 4, !tbaa !5
  %774 = fmul contract float %769, %773
  %775 = fmul contract float %774, 2.000000e+00
  %776 = fadd contract float %757, %775
  %777 = add nsw i32 %770, -1
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds float, float* %134, i64 %778
  %780 = load float, float* %779, align 4, !tbaa !5
  %781 = fmul contract float %769, %780
  %782 = fmul contract float %781, 2.000000e+00
  %783 = fadd contract float %764, %782
  %784 = add i32 %649, 7
  %785 = shl nsw i32 %784, 1
  %786 = add i32 %610, %784
  %787 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %786
  %788 = load float, float addrspace(3)* %787, align 4, !tbaa !5
  %789 = add nsw i32 %785, %6
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds float, float* %134, i64 %790
  %792 = load float, float* %791, align 4, !tbaa !5
  %793 = fmul contract float %788, %792
  %794 = fmul contract float %793, 2.000000e+00
  %795 = fadd contract float %776, %794
  %796 = add nsw i32 %789, -1
  %797 = sext i32 %796 to i64
  %798 = getelementptr inbounds float, float* %134, i64 %797
  %799 = load float, float* %798, align 4, !tbaa !5
  %800 = fmul contract float %788, %799
  %801 = fmul contract float %800, 2.000000e+00
  %802 = fadd contract float %783, %801
  %803 = add i32 %649, 8
  %804 = icmp eq i32 %784, %140
  br i1 %804, label %805, label %648, !llvm.loop !16

805:                                              ; preds = %641, %648, %606
  %806 = phi float [ 0.000000e+00, %606 ], [ %642, %641 ], [ %795, %648 ]
  %807 = phi float [ 0.000000e+00, %606 ], [ %643, %641 ], [ %802, %648 ]
  %808 = load float, float* %137, align 4, !tbaa !5
  %809 = add i32 %139, %608
  %810 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %809
  %811 = load float, float addrspace(3)* %810, align 4, !tbaa !5
  %812 = mul nsw i32 %603, %5
  %813 = sext i32 %812 to i64
  %814 = getelementptr inbounds float, float addrspace(1)* %29, i64 %813
  store float %806, float addrspace(1)* %814, align 4, !tbaa !5
  %815 = or i32 %604, 1
  %816 = icmp slt i32 %815, %4
  br i1 %816, label %817, label %824

817:                                              ; preds = %805
  %818 = fmul contract float %808, 2.000000e+00
  %819 = fmul contract float %818, %811
  %820 = fadd contract float %807, %819
  %821 = add nsw i32 %812, %5
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds float, float addrspace(1)* %29, i64 %822
  store float %820, float addrspace(1)* %823, align 4, !tbaa !5
  br label %824

824:                                              ; preds = %817, %805, %601
  %825 = add nsw i32 %7, 3
  %826 = shl nsw i32 %825, 5
  %827 = add nsw i32 %826, %25
  %828 = icmp slt i32 %827, %4
  br i1 %828, label %829, label %1047

829:                                              ; preds = %824
  %830 = add i32 %825, %133
  %831 = shl i32 %830, 4
  br i1 %132, label %1028, label %832

832:                                              ; preds = %829
  %833 = add i32 %831, %17
  %834 = add i32 %130, %140
  %835 = add i32 %834, 1
  %836 = and i32 %835, 7
  %837 = icmp eq i32 %836, 0
  br i1 %837, label %864, label %838

838:                                              ; preds = %832, %838
  %839 = phi i32 [ %861, %838 ], [ %131, %832 ]
  %840 = phi float [ %860, %838 ], [ 0.000000e+00, %832 ]
  %841 = phi float [ %853, %838 ], [ 0.000000e+00, %832 ]
  %842 = phi i32 [ %862, %838 ], [ 0, %832 ]
  %843 = shl nsw i32 %839, 1
  %844 = add i32 %833, %839
  %845 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %844
  %846 = load float, float addrspace(3)* %845, align 4, !tbaa !5
  %847 = add nsw i32 %843, %6
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds float, float* %134, i64 %848
  %850 = load float, float* %849, align 4, !tbaa !5
  %851 = fmul contract float %846, %850
  %852 = fmul contract float %851, 2.000000e+00
  %853 = fadd contract float %841, %852
  %854 = add nsw i32 %847, -1
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds float, float* %134, i64 %855
  %857 = load float, float* %856, align 4, !tbaa !5
  %858 = fmul contract float %846, %857
  %859 = fmul contract float %858, 2.000000e+00
  %860 = fadd contract float %840, %859
  %861 = add i32 %839, 1
  %862 = add i32 %842, 1
  %863 = icmp eq i32 %862, %836
  br i1 %863, label %864, label %838, !llvm.loop !19

864:                                              ; preds = %838, %832
  %865 = phi float [ undef, %832 ], [ %853, %838 ]
  %866 = phi float [ undef, %832 ], [ %860, %838 ]
  %867 = phi i32 [ %131, %832 ], [ %861, %838 ]
  %868 = phi float [ 0.000000e+00, %832 ], [ %860, %838 ]
  %869 = phi float [ 0.000000e+00, %832 ], [ %853, %838 ]
  %870 = icmp ult i32 %834, 7
  br i1 %870, label %1028, label %871

871:                                              ; preds = %864, %871
  %872 = phi i32 [ %1026, %871 ], [ %867, %864 ]
  %873 = phi float [ %1025, %871 ], [ %868, %864 ]
  %874 = phi float [ %1018, %871 ], [ %869, %864 ]
  %875 = shl nsw i32 %872, 1
  %876 = add i32 %833, %872
  %877 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %876
  %878 = load float, float addrspace(3)* %877, align 4, !tbaa !5
  %879 = add nsw i32 %875, %6
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds float, float* %134, i64 %880
  %882 = load float, float* %881, align 4, !tbaa !5
  %883 = fmul contract float %878, %882
  %884 = fmul contract float %883, 2.000000e+00
  %885 = fadd contract float %874, %884
  %886 = add nsw i32 %879, -1
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds float, float* %134, i64 %887
  %889 = load float, float* %888, align 4, !tbaa !5
  %890 = fmul contract float %878, %889
  %891 = fmul contract float %890, 2.000000e+00
  %892 = fadd contract float %873, %891
  %893 = add i32 %872, 1
  %894 = shl nsw i32 %893, 1
  %895 = add i32 %833, %893
  %896 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %895
  %897 = load float, float addrspace(3)* %896, align 4, !tbaa !5
  %898 = add nsw i32 %894, %6
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds float, float* %134, i64 %899
  %901 = load float, float* %900, align 4, !tbaa !5
  %902 = fmul contract float %897, %901
  %903 = fmul contract float %902, 2.000000e+00
  %904 = fadd contract float %885, %903
  %905 = add nsw i32 %898, -1
  %906 = sext i32 %905 to i64
  %907 = getelementptr inbounds float, float* %134, i64 %906
  %908 = load float, float* %907, align 4, !tbaa !5
  %909 = fmul contract float %897, %908
  %910 = fmul contract float %909, 2.000000e+00
  %911 = fadd contract float %892, %910
  %912 = add i32 %872, 2
  %913 = shl nsw i32 %912, 1
  %914 = add i32 %833, %912
  %915 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %914
  %916 = load float, float addrspace(3)* %915, align 4, !tbaa !5
  %917 = add nsw i32 %913, %6
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds float, float* %134, i64 %918
  %920 = load float, float* %919, align 4, !tbaa !5
  %921 = fmul contract float %916, %920
  %922 = fmul contract float %921, 2.000000e+00
  %923 = fadd contract float %904, %922
  %924 = add nsw i32 %917, -1
  %925 = sext i32 %924 to i64
  %926 = getelementptr inbounds float, float* %134, i64 %925
  %927 = load float, float* %926, align 4, !tbaa !5
  %928 = fmul contract float %916, %927
  %929 = fmul contract float %928, 2.000000e+00
  %930 = fadd contract float %911, %929
  %931 = add i32 %872, 3
  %932 = shl nsw i32 %931, 1
  %933 = add i32 %833, %931
  %934 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %933
  %935 = load float, float addrspace(3)* %934, align 4, !tbaa !5
  %936 = add nsw i32 %932, %6
  %937 = sext i32 %936 to i64
  %938 = getelementptr inbounds float, float* %134, i64 %937
  %939 = load float, float* %938, align 4, !tbaa !5
  %940 = fmul contract float %935, %939
  %941 = fmul contract float %940, 2.000000e+00
  %942 = fadd contract float %923, %941
  %943 = add nsw i32 %936, -1
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds float, float* %134, i64 %944
  %946 = load float, float* %945, align 4, !tbaa !5
  %947 = fmul contract float %935, %946
  %948 = fmul contract float %947, 2.000000e+00
  %949 = fadd contract float %930, %948
  %950 = add i32 %872, 4
  %951 = shl nsw i32 %950, 1
  %952 = add i32 %833, %950
  %953 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %952
  %954 = load float, float addrspace(3)* %953, align 4, !tbaa !5
  %955 = add nsw i32 %951, %6
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds float, float* %134, i64 %956
  %958 = load float, float* %957, align 4, !tbaa !5
  %959 = fmul contract float %954, %958
  %960 = fmul contract float %959, 2.000000e+00
  %961 = fadd contract float %942, %960
  %962 = add nsw i32 %955, -1
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds float, float* %134, i64 %963
  %965 = load float, float* %964, align 4, !tbaa !5
  %966 = fmul contract float %954, %965
  %967 = fmul contract float %966, 2.000000e+00
  %968 = fadd contract float %949, %967
  %969 = add i32 %872, 5
  %970 = shl nsw i32 %969, 1
  %971 = add i32 %833, %969
  %972 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %971
  %973 = load float, float addrspace(3)* %972, align 4, !tbaa !5
  %974 = add nsw i32 %970, %6
  %975 = sext i32 %974 to i64
  %976 = getelementptr inbounds float, float* %134, i64 %975
  %977 = load float, float* %976, align 4, !tbaa !5
  %978 = fmul contract float %973, %977
  %979 = fmul contract float %978, 2.000000e+00
  %980 = fadd contract float %961, %979
  %981 = add nsw i32 %974, -1
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds float, float* %134, i64 %982
  %984 = load float, float* %983, align 4, !tbaa !5
  %985 = fmul contract float %973, %984
  %986 = fmul contract float %985, 2.000000e+00
  %987 = fadd contract float %968, %986
  %988 = add i32 %872, 6
  %989 = shl nsw i32 %988, 1
  %990 = add i32 %833, %988
  %991 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %990
  %992 = load float, float addrspace(3)* %991, align 4, !tbaa !5
  %993 = add nsw i32 %989, %6
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds float, float* %134, i64 %994
  %996 = load float, float* %995, align 4, !tbaa !5
  %997 = fmul contract float %992, %996
  %998 = fmul contract float %997, 2.000000e+00
  %999 = fadd contract float %980, %998
  %1000 = add nsw i32 %993, -1
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds float, float* %134, i64 %1001
  %1003 = load float, float* %1002, align 4, !tbaa !5
  %1004 = fmul contract float %992, %1003
  %1005 = fmul contract float %1004, 2.000000e+00
  %1006 = fadd contract float %987, %1005
  %1007 = add i32 %872, 7
  %1008 = shl nsw i32 %1007, 1
  %1009 = add i32 %833, %1007
  %1010 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1009
  %1011 = load float, float addrspace(3)* %1010, align 4, !tbaa !5
  %1012 = add nsw i32 %1008, %6
  %1013 = sext i32 %1012 to i64
  %1014 = getelementptr inbounds float, float* %134, i64 %1013
  %1015 = load float, float* %1014, align 4, !tbaa !5
  %1016 = fmul contract float %1011, %1015
  %1017 = fmul contract float %1016, 2.000000e+00
  %1018 = fadd contract float %999, %1017
  %1019 = add nsw i32 %1012, -1
  %1020 = sext i32 %1019 to i64
  %1021 = getelementptr inbounds float, float* %134, i64 %1020
  %1022 = load float, float* %1021, align 4, !tbaa !5
  %1023 = fmul contract float %1011, %1022
  %1024 = fmul contract float %1023, 2.000000e+00
  %1025 = fadd contract float %1006, %1024
  %1026 = add i32 %872, 8
  %1027 = icmp eq i32 %1007, %140
  br i1 %1027, label %1028, label %871, !llvm.loop !16

1028:                                             ; preds = %864, %871, %829
  %1029 = phi float [ 0.000000e+00, %829 ], [ %865, %864 ], [ %1018, %871 ]
  %1030 = phi float [ 0.000000e+00, %829 ], [ %866, %864 ], [ %1025, %871 ]
  %1031 = load float, float* %137, align 4, !tbaa !5
  %1032 = add i32 %139, %831
  %1033 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1032
  %1034 = load float, float addrspace(3)* %1033, align 4, !tbaa !5
  %1035 = mul nsw i32 %826, %5
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds float, float addrspace(1)* %29, i64 %1036
  store float %1029, float addrspace(1)* %1037, align 4, !tbaa !5
  %1038 = or i32 %827, 1
  %1039 = icmp slt i32 %1038, %4
  br i1 %1039, label %1040, label %1047

1040:                                             ; preds = %1028
  %1041 = fmul contract float %1031, 2.000000e+00
  %1042 = fmul contract float %1041, %1034
  %1043 = fadd contract float %1030, %1042
  %1044 = add nsw i32 %1035, %5
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds float, float addrspace(1)* %29, i64 %1045
  store float %1043, float addrspace(1)* %1046, align 4, !tbaa !5
  br label %1047

1047:                                             ; preds = %1040, %1028, %824, %8
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
