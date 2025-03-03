; ModuleID = '../data/hip_kernels/15524/5/main.cu'
source_filename = "../data/hip_kernels/15524/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27convolutionColumnsKernel_v1PfS_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 2
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 6
  %14 = shl i32 %6, 4
  %15 = sub i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = add i32 %15, %16
  %18 = mul nsw i32 %17, %4
  %19 = add nsw i32 %11, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %23 = icmp sgt i32 %6, 0
  br i1 %23, label %24, label %55

24:                                               ; preds = %7
  %25 = shl i32 %4, 4
  %26 = shl nuw nsw i32 %6, 1
  %27 = add nsw i32 %26, 4
  %28 = mul i32 %27, %10
  %29 = and i32 %6, 3
  %30 = icmp ult i32 %6, 4
  br i1 %30, label %33, label %31

31:                                               ; preds = %24
  %32 = and i32 %6, -4
  br label %64

33:                                               ; preds = %116, %24
  %34 = phi i32 [ 0, %24 ], [ %122, %116 ]
  %35 = icmp eq i32 %29, 0
  br i1 %35, label %55, label %36

36:                                               ; preds = %33, %46
  %37 = phi i32 [ %52, %46 ], [ %34, %33 ]
  %38 = phi i32 [ %53, %46 ], [ 0, %33 ]
  %39 = mul i32 %37, -16
  %40 = icmp slt i32 %17, %39
  br i1 %40, label %46, label %41

41:                                               ; preds = %36
  %42 = mul i32 %25, %37
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %21, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %46

46:                                               ; preds = %41, %36
  %47 = phi contract float [ %45, %41 ], [ 0.000000e+00, %36 ]
  %48 = add i32 %37, %28
  %49 = shl i32 %48, 4
  %50 = add i32 %49, %16
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %50
  store float %47, float addrspace(3)* %51, align 4, !tbaa !5
  %52 = add nuw nsw i32 %37, 1
  %53 = add nuw nsw i32 %38, 1
  %54 = icmp eq i32 %53, %29
  br i1 %54, label %55, label %36, !llvm.loop !10

55:                                               ; preds = %46, %33, %7
  %56 = shl i32 %6, 1
  %57 = add i32 %56, 4
  %58 = icmp sgt i32 %6, -4
  %59 = shl nsw i32 %6, 1
  %60 = add nsw i32 %59, 4
  %61 = shl nuw nsw i32 %10, 4
  %62 = mul i32 %61, %60
  %63 = add i32 %62, %16
  br i1 %58, label %137, label %125

64:                                               ; preds = %116, %31
  %65 = phi i32 [ 0, %31 ], [ %122, %116 ]
  %66 = phi i32 [ 0, %31 ], [ %123, %116 ]
  %67 = mul i32 %65, -16
  %68 = icmp slt i32 %17, %67
  br i1 %68, label %74, label %69

69:                                               ; preds = %64
  %70 = mul i32 %25, %65
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %21, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %74

74:                                               ; preds = %64, %69
  %75 = phi contract float [ %73, %69 ], [ 0.000000e+00, %64 ]
  %76 = add i32 %65, %28
  %77 = shl i32 %76, 4
  %78 = add i32 %77, %16
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %78
  store float %75, float addrspace(3)* %79, align 4, !tbaa !5
  %80 = or i32 %65, 1
  %81 = mul i32 %80, -16
  %82 = icmp slt i32 %17, %81
  br i1 %82, label %88, label %83

83:                                               ; preds = %74
  %84 = mul i32 %25, %80
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %21, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %88

88:                                               ; preds = %83, %74
  %89 = phi contract float [ %87, %83 ], [ 0.000000e+00, %74 ]
  %90 = add i32 %80, %28
  %91 = shl i32 %90, 4
  %92 = add i32 %91, %16
  %93 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %92
  store float %89, float addrspace(3)* %93, align 4, !tbaa !5
  %94 = or i32 %65, 2
  %95 = mul i32 %94, -16
  %96 = icmp slt i32 %17, %95
  br i1 %96, label %102, label %97

97:                                               ; preds = %88
  %98 = mul i32 %25, %94
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %21, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %102

102:                                              ; preds = %97, %88
  %103 = phi contract float [ %101, %97 ], [ 0.000000e+00, %88 ]
  %104 = add i32 %94, %28
  %105 = shl i32 %104, 4
  %106 = add i32 %105, %16
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %106
  store float %103, float addrspace(3)* %107, align 4, !tbaa !5
  %108 = or i32 %65, 3
  %109 = mul i32 %108, -16
  %110 = icmp slt i32 %17, %109
  br i1 %110, label %116, label %111

111:                                              ; preds = %102
  %112 = mul i32 %25, %108
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %21, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %116

116:                                              ; preds = %111, %102
  %117 = phi contract float [ %115, %111 ], [ 0.000000e+00, %102 ]
  %118 = add i32 %108, %28
  %119 = shl i32 %118, 4
  %120 = add i32 %119, %16
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %120
  store float %117, float addrspace(3)* %121, align 4, !tbaa !5
  %122 = add nuw nsw i32 %65, 4
  %123 = add i32 %66, 4
  %124 = icmp eq i32 %123, %32
  br i1 %124, label %33, label %64, !llvm.loop !12

125:                                              ; preds = %147, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %126 = sub i32 0, %5
  %127 = icmp slt i32 %5, 0
  %128 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %129 = tail call i32 @llvm.abs.i32(i32 %5, i1 false)
  %130 = add nuw i32 %129, 1
  %131 = add i32 %129, %5
  %132 = add i32 %131, 1
  %133 = and i32 %132, 7
  %134 = sub i32 %133, %5
  %135 = add i32 %13, %16
  %136 = icmp slt i32 %135, %3
  br i1 %136, label %153, label %268

137:                                              ; preds = %55, %147
  %138 = phi i32 [ %151, %147 ], [ %6, %55 ]
  %139 = shl nsw i32 %138, 4
  %140 = add nsw i32 %139, %17
  %141 = icmp slt i32 %140, %3
  br i1 %141, label %142, label %147

142:                                              ; preds = %137
  %143 = mul nsw i32 %139, %4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %21, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %147

147:                                              ; preds = %137, %142
  %148 = phi contract float [ %146, %142 ], [ 0.000000e+00, %137 ]
  %149 = add i32 %63, %139
  %150 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %149
  store float %148, float addrspace(3)* %150, align 4, !tbaa !5
  %151 = add nsw i32 %138, 1
  %152 = icmp slt i32 %151, %57
  br i1 %152, label %137, label %125, !llvm.loop !14

153:                                              ; preds = %125
  br i1 %127, label %179, label %154

154:                                              ; preds = %153
  %155 = add i32 %63, %14
  %156 = and i32 %132, 7
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %174, label %158

158:                                              ; preds = %154, %158
  %159 = phi i32 [ %171, %158 ], [ %126, %154 ]
  %160 = phi float [ %170, %158 ], [ 0.000000e+00, %154 ]
  %161 = phi i32 [ %172, %158 ], [ 0, %154 ]
  %162 = sub nsw i32 %5, %159
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float* %128, i64 %163
  %165 = load float, float* %164, align 4, !tbaa !5
  %166 = add i32 %155, %159
  %167 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %166
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %169 = fmul contract float %165, %168
  %170 = fadd contract float %160, %169
  %171 = add i32 %159, 1
  %172 = add nuw nsw i32 %161, 1
  %173 = icmp eq i32 %172, %156
  br i1 %173, label %174, label %158, !llvm.loop !16

174:                                              ; preds = %158, %154
  %175 = phi i32 [ %126, %154 ], [ %134, %158 ]
  %176 = phi float [ 0.000000e+00, %154 ], [ %170, %158 ]
  %177 = phi float [ undef, %154 ], [ %170, %158 ]
  %178 = icmp ult i32 %131, 7
  br i1 %178, label %179, label %184

179:                                              ; preds = %184, %174, %153
  %180 = phi float [ 0.000000e+00, %153 ], [ %177, %174 ], [ %265, %184 ]
  %181 = mul nsw i32 %14, %4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %22, i64 %182
  store float %180, float addrspace(1)* %183, align 4, !tbaa !5
  br label %268

184:                                              ; preds = %174, %184
  %185 = phi i32 [ %266, %184 ], [ %175, %174 ]
  %186 = phi float [ %265, %184 ], [ %176, %174 ]
  %187 = sub nsw i32 %5, %185
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float* %128, i64 %188
  %190 = load float, float* %189, align 4, !tbaa !5
  %191 = add i32 %155, %185
  %192 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = fmul contract float %190, %193
  %195 = fadd contract float %186, %194
  %196 = add i32 %185, 1
  %197 = sub nsw i32 %5, %196
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float* %128, i64 %198
  %200 = load float, float* %199, align 4, !tbaa !5
  %201 = add i32 %155, %196
  %202 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %201
  %203 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %204 = fmul contract float %200, %203
  %205 = fadd contract float %195, %204
  %206 = add i32 %185, 2
  %207 = sub nsw i32 %5, %206
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float* %128, i64 %208
  %210 = load float, float* %209, align 4, !tbaa !5
  %211 = add i32 %155, %206
  %212 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %211
  %213 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %214 = fmul contract float %210, %213
  %215 = fadd contract float %205, %214
  %216 = add i32 %185, 3
  %217 = sub nsw i32 %5, %216
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float* %128, i64 %218
  %220 = load float, float* %219, align 4, !tbaa !5
  %221 = add i32 %155, %216
  %222 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %221
  %223 = load float, float addrspace(3)* %222, align 4, !tbaa !5
  %224 = fmul contract float %220, %223
  %225 = fadd contract float %215, %224
  %226 = add i32 %185, 4
  %227 = sub nsw i32 %5, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float* %128, i64 %228
  %230 = load float, float* %229, align 4, !tbaa !5
  %231 = add i32 %155, %226
  %232 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %234 = fmul contract float %230, %233
  %235 = fadd contract float %225, %234
  %236 = add i32 %185, 5
  %237 = sub nsw i32 %5, %236
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float* %128, i64 %238
  %240 = load float, float* %239, align 4, !tbaa !5
  %241 = add i32 %155, %236
  %242 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %241
  %243 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %244 = fmul contract float %240, %243
  %245 = fadd contract float %235, %244
  %246 = add i32 %185, 6
  %247 = sub nsw i32 %5, %246
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float* %128, i64 %248
  %250 = load float, float* %249, align 4, !tbaa !5
  %251 = add i32 %155, %246
  %252 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %251
  %253 = load float, float addrspace(3)* %252, align 4, !tbaa !5
  %254 = fmul contract float %250, %253
  %255 = fadd contract float %245, %254
  %256 = add i32 %185, 7
  %257 = sub nsw i32 %5, %256
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float* %128, i64 %258
  %260 = load float, float* %259, align 4, !tbaa !5
  %261 = add i32 %155, %256
  %262 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %261
  %263 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %264 = fmul contract float %260, %263
  %265 = fadd contract float %255, %264
  %266 = add i32 %185, 8
  %267 = icmp eq i32 %266, %130
  br i1 %267, label %179, label %184, !llvm.loop !17

268:                                              ; preds = %125, %179
  %269 = shl i32 %6, 4
  %270 = add i32 %269, 16
  %271 = add nsw i32 %270, %17
  %272 = icmp slt i32 %271, %3
  br i1 %272, label %273, label %388

273:                                              ; preds = %268
  br i1 %127, label %383, label %274

274:                                              ; preds = %273
  %275 = add i32 %63, %270
  %276 = and i32 %132, 7
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %294, label %278

278:                                              ; preds = %274, %278
  %279 = phi i32 [ %291, %278 ], [ %126, %274 ]
  %280 = phi float [ %290, %278 ], [ 0.000000e+00, %274 ]
  %281 = phi i32 [ %292, %278 ], [ 0, %274 ]
  %282 = sub nsw i32 %5, %279
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float* %128, i64 %283
  %285 = load float, float* %284, align 4, !tbaa !5
  %286 = add i32 %275, %279
  %287 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %286
  %288 = load float, float addrspace(3)* %287, align 4, !tbaa !5
  %289 = fmul contract float %285, %288
  %290 = fadd contract float %280, %289
  %291 = add i32 %279, 1
  %292 = add nuw nsw i32 %281, 1
  %293 = icmp eq i32 %292, %276
  br i1 %293, label %294, label %278, !llvm.loop !16

294:                                              ; preds = %278, %274
  %295 = phi i32 [ %126, %274 ], [ %134, %278 ]
  %296 = phi float [ 0.000000e+00, %274 ], [ %290, %278 ]
  %297 = phi float [ undef, %274 ], [ %290, %278 ]
  %298 = icmp ult i32 %131, 7
  br i1 %298, label %383, label %299

299:                                              ; preds = %294, %299
  %300 = phi i32 [ %381, %299 ], [ %295, %294 ]
  %301 = phi float [ %380, %299 ], [ %296, %294 ]
  %302 = sub nsw i32 %5, %300
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float* %128, i64 %303
  %305 = load float, float* %304, align 4, !tbaa !5
  %306 = add i32 %275, %300
  %307 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %306
  %308 = load float, float addrspace(3)* %307, align 4, !tbaa !5
  %309 = fmul contract float %305, %308
  %310 = fadd contract float %301, %309
  %311 = add i32 %300, 1
  %312 = sub nsw i32 %5, %311
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds float, float* %128, i64 %313
  %315 = load float, float* %314, align 4, !tbaa !5
  %316 = add i32 %275, %311
  %317 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %316
  %318 = load float, float addrspace(3)* %317, align 4, !tbaa !5
  %319 = fmul contract float %315, %318
  %320 = fadd contract float %310, %319
  %321 = add i32 %300, 2
  %322 = sub nsw i32 %5, %321
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float* %128, i64 %323
  %325 = load float, float* %324, align 4, !tbaa !5
  %326 = add i32 %275, %321
  %327 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %326
  %328 = load float, float addrspace(3)* %327, align 4, !tbaa !5
  %329 = fmul contract float %325, %328
  %330 = fadd contract float %320, %329
  %331 = add i32 %300, 3
  %332 = sub nsw i32 %5, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float* %128, i64 %333
  %335 = load float, float* %334, align 4, !tbaa !5
  %336 = add i32 %275, %331
  %337 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %336
  %338 = load float, float addrspace(3)* %337, align 4, !tbaa !5
  %339 = fmul contract float %335, %338
  %340 = fadd contract float %330, %339
  %341 = add i32 %300, 4
  %342 = sub nsw i32 %5, %341
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float* %128, i64 %343
  %345 = load float, float* %344, align 4, !tbaa !5
  %346 = add i32 %275, %341
  %347 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %346
  %348 = load float, float addrspace(3)* %347, align 4, !tbaa !5
  %349 = fmul contract float %345, %348
  %350 = fadd contract float %340, %349
  %351 = add i32 %300, 5
  %352 = sub nsw i32 %5, %351
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds float, float* %128, i64 %353
  %355 = load float, float* %354, align 4, !tbaa !5
  %356 = add i32 %275, %351
  %357 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %356
  %358 = load float, float addrspace(3)* %357, align 4, !tbaa !5
  %359 = fmul contract float %355, %358
  %360 = fadd contract float %350, %359
  %361 = add i32 %300, 6
  %362 = sub nsw i32 %5, %361
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float* %128, i64 %363
  %365 = load float, float* %364, align 4, !tbaa !5
  %366 = add i32 %275, %361
  %367 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %366
  %368 = load float, float addrspace(3)* %367, align 4, !tbaa !5
  %369 = fmul contract float %365, %368
  %370 = fadd contract float %360, %369
  %371 = add i32 %300, 7
  %372 = sub nsw i32 %5, %371
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds float, float* %128, i64 %373
  %375 = load float, float* %374, align 4, !tbaa !5
  %376 = add i32 %275, %371
  %377 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %376
  %378 = load float, float addrspace(3)* %377, align 4, !tbaa !5
  %379 = fmul contract float %375, %378
  %380 = fadd contract float %370, %379
  %381 = add i32 %300, 8
  %382 = icmp eq i32 %381, %130
  br i1 %382, label %383, label %299, !llvm.loop !17

383:                                              ; preds = %299, %294, %273
  %384 = phi float [ 0.000000e+00, %273 ], [ %297, %294 ], [ %380, %299 ]
  %385 = mul nsw i32 %270, %4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %22, i64 %386
  store float %384, float addrspace(1)* %387, align 4, !tbaa !5
  br label %388

388:                                              ; preds = %383, %268
  %389 = shl i32 %6, 4
  %390 = add i32 %389, 32
  %391 = add nsw i32 %390, %17
  %392 = icmp slt i32 %391, %3
  br i1 %392, label %393, label %508

393:                                              ; preds = %388
  br i1 %127, label %503, label %394

394:                                              ; preds = %393
  %395 = add i32 %63, %390
  %396 = and i32 %132, 7
  %397 = icmp eq i32 %396, 0
  br i1 %397, label %414, label %398

398:                                              ; preds = %394, %398
  %399 = phi i32 [ %411, %398 ], [ %126, %394 ]
  %400 = phi float [ %410, %398 ], [ 0.000000e+00, %394 ]
  %401 = phi i32 [ %412, %398 ], [ 0, %394 ]
  %402 = sub nsw i32 %5, %399
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds float, float* %128, i64 %403
  %405 = load float, float* %404, align 4, !tbaa !5
  %406 = add i32 %395, %399
  %407 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %406
  %408 = load float, float addrspace(3)* %407, align 4, !tbaa !5
  %409 = fmul contract float %405, %408
  %410 = fadd contract float %400, %409
  %411 = add i32 %399, 1
  %412 = add nuw nsw i32 %401, 1
  %413 = icmp eq i32 %412, %396
  br i1 %413, label %414, label %398, !llvm.loop !16

414:                                              ; preds = %398, %394
  %415 = phi i32 [ %126, %394 ], [ %134, %398 ]
  %416 = phi float [ 0.000000e+00, %394 ], [ %410, %398 ]
  %417 = phi float [ undef, %394 ], [ %410, %398 ]
  %418 = icmp ult i32 %131, 7
  br i1 %418, label %503, label %419

419:                                              ; preds = %414, %419
  %420 = phi i32 [ %501, %419 ], [ %415, %414 ]
  %421 = phi float [ %500, %419 ], [ %416, %414 ]
  %422 = sub nsw i32 %5, %420
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds float, float* %128, i64 %423
  %425 = load float, float* %424, align 4, !tbaa !5
  %426 = add i32 %395, %420
  %427 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %426
  %428 = load float, float addrspace(3)* %427, align 4, !tbaa !5
  %429 = fmul contract float %425, %428
  %430 = fadd contract float %421, %429
  %431 = add i32 %420, 1
  %432 = sub nsw i32 %5, %431
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds float, float* %128, i64 %433
  %435 = load float, float* %434, align 4, !tbaa !5
  %436 = add i32 %395, %431
  %437 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %436
  %438 = load float, float addrspace(3)* %437, align 4, !tbaa !5
  %439 = fmul contract float %435, %438
  %440 = fadd contract float %430, %439
  %441 = add i32 %420, 2
  %442 = sub nsw i32 %5, %441
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds float, float* %128, i64 %443
  %445 = load float, float* %444, align 4, !tbaa !5
  %446 = add i32 %395, %441
  %447 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %446
  %448 = load float, float addrspace(3)* %447, align 4, !tbaa !5
  %449 = fmul contract float %445, %448
  %450 = fadd contract float %440, %449
  %451 = add i32 %420, 3
  %452 = sub nsw i32 %5, %451
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds float, float* %128, i64 %453
  %455 = load float, float* %454, align 4, !tbaa !5
  %456 = add i32 %395, %451
  %457 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %456
  %458 = load float, float addrspace(3)* %457, align 4, !tbaa !5
  %459 = fmul contract float %455, %458
  %460 = fadd contract float %450, %459
  %461 = add i32 %420, 4
  %462 = sub nsw i32 %5, %461
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds float, float* %128, i64 %463
  %465 = load float, float* %464, align 4, !tbaa !5
  %466 = add i32 %395, %461
  %467 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %466
  %468 = load float, float addrspace(3)* %467, align 4, !tbaa !5
  %469 = fmul contract float %465, %468
  %470 = fadd contract float %460, %469
  %471 = add i32 %420, 5
  %472 = sub nsw i32 %5, %471
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds float, float* %128, i64 %473
  %475 = load float, float* %474, align 4, !tbaa !5
  %476 = add i32 %395, %471
  %477 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %476
  %478 = load float, float addrspace(3)* %477, align 4, !tbaa !5
  %479 = fmul contract float %475, %478
  %480 = fadd contract float %470, %479
  %481 = add i32 %420, 6
  %482 = sub nsw i32 %5, %481
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds float, float* %128, i64 %483
  %485 = load float, float* %484, align 4, !tbaa !5
  %486 = add i32 %395, %481
  %487 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %486
  %488 = load float, float addrspace(3)* %487, align 4, !tbaa !5
  %489 = fmul contract float %485, %488
  %490 = fadd contract float %480, %489
  %491 = add i32 %420, 7
  %492 = sub nsw i32 %5, %491
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds float, float* %128, i64 %493
  %495 = load float, float* %494, align 4, !tbaa !5
  %496 = add i32 %395, %491
  %497 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %496
  %498 = load float, float addrspace(3)* %497, align 4, !tbaa !5
  %499 = fmul contract float %495, %498
  %500 = fadd contract float %490, %499
  %501 = add i32 %420, 8
  %502 = icmp eq i32 %501, %130
  br i1 %502, label %503, label %419, !llvm.loop !17

503:                                              ; preds = %419, %414, %393
  %504 = phi float [ 0.000000e+00, %393 ], [ %417, %414 ], [ %500, %419 ]
  %505 = mul nsw i32 %390, %4
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds float, float addrspace(1)* %22, i64 %506
  store float %504, float addrspace(1)* %507, align 4, !tbaa !5
  br label %508

508:                                              ; preds = %503, %388
  %509 = shl i32 %6, 4
  %510 = add i32 %509, 48
  %511 = add nsw i32 %510, %17
  %512 = icmp slt i32 %511, %3
  br i1 %512, label %513, label %628

513:                                              ; preds = %508
  br i1 %127, label %623, label %514

514:                                              ; preds = %513
  %515 = add i32 %63, %510
  %516 = and i32 %132, 7
  %517 = icmp eq i32 %516, 0
  br i1 %517, label %534, label %518

518:                                              ; preds = %514, %518
  %519 = phi i32 [ %531, %518 ], [ %126, %514 ]
  %520 = phi float [ %530, %518 ], [ 0.000000e+00, %514 ]
  %521 = phi i32 [ %532, %518 ], [ 0, %514 ]
  %522 = sub nsw i32 %5, %519
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds float, float* %128, i64 %523
  %525 = load float, float* %524, align 4, !tbaa !5
  %526 = add i32 %515, %519
  %527 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %526
  %528 = load float, float addrspace(3)* %527, align 4, !tbaa !5
  %529 = fmul contract float %525, %528
  %530 = fadd contract float %520, %529
  %531 = add i32 %519, 1
  %532 = add nuw nsw i32 %521, 1
  %533 = icmp eq i32 %532, %516
  br i1 %533, label %534, label %518, !llvm.loop !16

534:                                              ; preds = %518, %514
  %535 = phi i32 [ %126, %514 ], [ %134, %518 ]
  %536 = phi float [ 0.000000e+00, %514 ], [ %530, %518 ]
  %537 = phi float [ undef, %514 ], [ %530, %518 ]
  %538 = icmp ult i32 %131, 7
  br i1 %538, label %623, label %539

539:                                              ; preds = %534, %539
  %540 = phi i32 [ %621, %539 ], [ %535, %534 ]
  %541 = phi float [ %620, %539 ], [ %536, %534 ]
  %542 = sub nsw i32 %5, %540
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds float, float* %128, i64 %543
  %545 = load float, float* %544, align 4, !tbaa !5
  %546 = add i32 %515, %540
  %547 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %546
  %548 = load float, float addrspace(3)* %547, align 4, !tbaa !5
  %549 = fmul contract float %545, %548
  %550 = fadd contract float %541, %549
  %551 = add i32 %540, 1
  %552 = sub nsw i32 %5, %551
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds float, float* %128, i64 %553
  %555 = load float, float* %554, align 4, !tbaa !5
  %556 = add i32 %515, %551
  %557 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %556
  %558 = load float, float addrspace(3)* %557, align 4, !tbaa !5
  %559 = fmul contract float %555, %558
  %560 = fadd contract float %550, %559
  %561 = add i32 %540, 2
  %562 = sub nsw i32 %5, %561
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float* %128, i64 %563
  %565 = load float, float* %564, align 4, !tbaa !5
  %566 = add i32 %515, %561
  %567 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %566
  %568 = load float, float addrspace(3)* %567, align 4, !tbaa !5
  %569 = fmul contract float %565, %568
  %570 = fadd contract float %560, %569
  %571 = add i32 %540, 3
  %572 = sub nsw i32 %5, %571
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float* %128, i64 %573
  %575 = load float, float* %574, align 4, !tbaa !5
  %576 = add i32 %515, %571
  %577 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %576
  %578 = load float, float addrspace(3)* %577, align 4, !tbaa !5
  %579 = fmul contract float %575, %578
  %580 = fadd contract float %570, %579
  %581 = add i32 %540, 4
  %582 = sub nsw i32 %5, %581
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float* %128, i64 %583
  %585 = load float, float* %584, align 4, !tbaa !5
  %586 = add i32 %515, %581
  %587 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %586
  %588 = load float, float addrspace(3)* %587, align 4, !tbaa !5
  %589 = fmul contract float %585, %588
  %590 = fadd contract float %580, %589
  %591 = add i32 %540, 5
  %592 = sub nsw i32 %5, %591
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds float, float* %128, i64 %593
  %595 = load float, float* %594, align 4, !tbaa !5
  %596 = add i32 %515, %591
  %597 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %596
  %598 = load float, float addrspace(3)* %597, align 4, !tbaa !5
  %599 = fmul contract float %595, %598
  %600 = fadd contract float %590, %599
  %601 = add i32 %540, 6
  %602 = sub nsw i32 %5, %601
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds float, float* %128, i64 %603
  %605 = load float, float* %604, align 4, !tbaa !5
  %606 = add i32 %515, %601
  %607 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %606
  %608 = load float, float addrspace(3)* %607, align 4, !tbaa !5
  %609 = fmul contract float %605, %608
  %610 = fadd contract float %600, %609
  %611 = add i32 %540, 7
  %612 = sub nsw i32 %5, %611
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float* %128, i64 %613
  %615 = load float, float* %614, align 4, !tbaa !5
  %616 = add i32 %515, %611
  %617 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %616
  %618 = load float, float addrspace(3)* %617, align 4, !tbaa !5
  %619 = fmul contract float %615, %618
  %620 = fadd contract float %610, %619
  %621 = add i32 %540, 8
  %622 = icmp eq i32 %621, %130
  br i1 %622, label %623, label %539, !llvm.loop !17

623:                                              ; preds = %539, %534, %513
  %624 = phi float [ 0.000000e+00, %513 ], [ %537, %534 ], [ %620, %539 ]
  %625 = mul nsw i32 %510, %4
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds float, float addrspace(1)* %22, i64 %626
  store float %624, float addrspace(1)* %627, align 4, !tbaa !5
  br label %628

628:                                              ; preds = %623, %508
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
!12 = distinct !{!12, !13, !11}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13, !15}
!15 = !{!"llvm.loop.unroll.enable"}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13, !11}
