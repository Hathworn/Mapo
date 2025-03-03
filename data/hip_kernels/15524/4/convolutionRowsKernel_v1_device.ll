; ModuleID = '../data/hip_kernels/15524/4/main.cu'
source_filename = "../data/hip_kernels/15524/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24convolutionRowsKernel_v1PfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 6
  %8 = shl i32 %4, 4
  %9 = sub i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 2
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %15, %2
  %17 = add nsw i32 %11, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %21 = icmp sgt i32 %4, 0
  br i1 %21, label %22, label %52

22:                                               ; preds = %5
  %23 = shl nuw nsw i32 %4, 1
  %24 = add nsw i32 %23, 4
  %25 = shl nuw nsw i32 %14, 4
  %26 = mul i32 %25, %24
  %27 = add i32 %26, %10
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  br i1 %29, label %32, label %30

30:                                               ; preds = %22
  %31 = and i32 %4, -8
  br label %61

32:                                               ; preds = %155, %22
  %33 = phi i32 [ 0, %22 ], [ %159, %155 ]
  %34 = icmp eq i32 %28, 0
  br i1 %34, label %52, label %35

35:                                               ; preds = %32, %45
  %36 = phi i32 [ %49, %45 ], [ %33, %32 ]
  %37 = phi i32 [ %50, %45 ], [ 0, %32 ]
  %38 = shl nsw i32 %36, 4
  %39 = add nsw i32 %38, %11
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %41, label %45

41:                                               ; preds = %35
  %42 = zext i32 %38 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %19, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %45

45:                                               ; preds = %41, %35
  %46 = phi contract float [ %44, %41 ], [ 0.000000e+00, %35 ]
  %47 = add i32 %27, %38
  %48 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %47
  store float %46, float addrspace(3)* %48, align 4, !tbaa !5
  %49 = add nuw nsw i32 %36, 1
  %50 = add nuw nsw i32 %37, 1
  %51 = icmp eq i32 %50, %28
  br i1 %51, label %52, label %35, !llvm.loop !10

52:                                               ; preds = %45, %32, %5
  %53 = shl i32 %4, 1
  %54 = add i32 %53, 4
  %55 = icmp sgt i32 %4, -4
  %56 = shl nsw i32 %4, 1
  %57 = add nsw i32 %56, 4
  %58 = shl nuw nsw i32 %14, 4
  %59 = mul i32 %58, %57
  %60 = add i32 %59, %10
  br i1 %55, label %174, label %162

61:                                               ; preds = %155, %30
  %62 = phi i32 [ 0, %30 ], [ %159, %155 ]
  %63 = phi i32 [ 0, %30 ], [ %160, %155 ]
  %64 = shl nsw i32 %62, 4
  %65 = add nsw i32 %64, %11
  %66 = icmp sgt i32 %65, -1
  br i1 %66, label %67, label %71

67:                                               ; preds = %61
  %68 = zext i32 %64 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %19, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %71

71:                                               ; preds = %61, %67
  %72 = phi contract float [ %70, %67 ], [ 0.000000e+00, %61 ]
  %73 = add i32 %27, %64
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %73
  store float %72, float addrspace(3)* %74, align 4, !tbaa !5
  %75 = shl i32 %62, 4
  %76 = or i32 %75, 16
  %77 = add nsw i32 %76, %11
  %78 = icmp sgt i32 %77, -1
  br i1 %78, label %79, label %83

79:                                               ; preds = %71
  %80 = zext i32 %76 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %19, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %79, %71
  %84 = phi contract float [ %82, %79 ], [ 0.000000e+00, %71 ]
  %85 = add i32 %27, %76
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %85
  store float %84, float addrspace(3)* %86, align 4, !tbaa !5
  %87 = shl i32 %62, 4
  %88 = or i32 %87, 32
  %89 = add nsw i32 %88, %11
  %90 = icmp sgt i32 %89, -1
  br i1 %90, label %91, label %95

91:                                               ; preds = %83
  %92 = zext i32 %88 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %19, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %95

95:                                               ; preds = %91, %83
  %96 = phi contract float [ %94, %91 ], [ 0.000000e+00, %83 ]
  %97 = add i32 %27, %88
  %98 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %97
  store float %96, float addrspace(3)* %98, align 4, !tbaa !5
  %99 = shl i32 %62, 4
  %100 = or i32 %99, 48
  %101 = add nsw i32 %100, %11
  %102 = icmp sgt i32 %101, -1
  br i1 %102, label %103, label %107

103:                                              ; preds = %95
  %104 = zext i32 %100 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %19, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %107

107:                                              ; preds = %103, %95
  %108 = phi contract float [ %106, %103 ], [ 0.000000e+00, %95 ]
  %109 = add i32 %27, %100
  %110 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %109
  store float %108, float addrspace(3)* %110, align 4, !tbaa !5
  %111 = shl i32 %62, 4
  %112 = or i32 %111, 64
  %113 = add nsw i32 %112, %11
  %114 = icmp sgt i32 %113, -1
  br i1 %114, label %115, label %119

115:                                              ; preds = %107
  %116 = zext i32 %112 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %19, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %119

119:                                              ; preds = %115, %107
  %120 = phi contract float [ %118, %115 ], [ 0.000000e+00, %107 ]
  %121 = add i32 %27, %112
  %122 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %121
  store float %120, float addrspace(3)* %122, align 4, !tbaa !5
  %123 = shl i32 %62, 4
  %124 = or i32 %123, 80
  %125 = add nsw i32 %124, %11
  %126 = icmp sgt i32 %125, -1
  br i1 %126, label %127, label %131

127:                                              ; preds = %119
  %128 = zext i32 %124 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %19, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %131

131:                                              ; preds = %127, %119
  %132 = phi contract float [ %130, %127 ], [ 0.000000e+00, %119 ]
  %133 = add i32 %27, %124
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %133
  store float %132, float addrspace(3)* %134, align 4, !tbaa !5
  %135 = shl i32 %62, 4
  %136 = or i32 %135, 96
  %137 = add nsw i32 %136, %11
  %138 = icmp sgt i32 %137, -1
  br i1 %138, label %139, label %143

139:                                              ; preds = %131
  %140 = zext i32 %136 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %19, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %143

143:                                              ; preds = %139, %131
  %144 = phi contract float [ %142, %139 ], [ 0.000000e+00, %131 ]
  %145 = add i32 %27, %136
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %145
  store float %144, float addrspace(3)* %146, align 4, !tbaa !5
  %147 = shl i32 %62, 4
  %148 = or i32 %147, 112
  %149 = add nsw i32 %148, %11
  %150 = icmp sgt i32 %149, -1
  br i1 %150, label %151, label %155

151:                                              ; preds = %143
  %152 = zext i32 %148 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %19, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %155

155:                                              ; preds = %151, %143
  %156 = phi contract float [ %154, %151 ], [ 0.000000e+00, %143 ]
  %157 = add i32 %27, %148
  %158 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %157
  store float %156, float addrspace(3)* %158, align 4, !tbaa !5
  %159 = add nuw nsw i32 %62, 8
  %160 = add i32 %63, 8
  %161 = icmp eq i32 %160, %31
  br i1 %161, label %32, label %61, !llvm.loop !12

162:                                              ; preds = %183, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = sub i32 0, %3
  %164 = icmp slt i32 %3, 0
  %165 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %166 = tail call i32 @llvm.abs.i32(i32 %3, i1 false)
  %167 = add nuw i32 %166, 1
  %168 = add i32 %166, %3
  %169 = add i32 %168, 1
  %170 = and i32 %169, 7
  %171 = sub i32 %170, %3
  %172 = add i32 %7, %10
  %173 = icmp slt i32 %172, %2
  br i1 %173, label %189, label %303

174:                                              ; preds = %52, %183
  %175 = phi i32 [ %187, %183 ], [ %4, %52 ]
  %176 = shl nsw i32 %175, 4
  %177 = add nsw i32 %176, %11
  %178 = icmp slt i32 %177, %2
  br i1 %178, label %179, label %183

179:                                              ; preds = %174
  %180 = sext i32 %176 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %19, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %183

183:                                              ; preds = %174, %179
  %184 = phi contract float [ %182, %179 ], [ 0.000000e+00, %174 ]
  %185 = add i32 %60, %176
  %186 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %185
  store float %184, float addrspace(3)* %186, align 4, !tbaa !5
  %187 = add nsw i32 %175, 1
  %188 = icmp slt i32 %187, %54
  br i1 %188, label %174, label %162, !llvm.loop !14

189:                                              ; preds = %162
  br i1 %164, label %215, label %190

190:                                              ; preds = %189
  %191 = add i32 %60, %8
  %192 = and i32 %169, 7
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %210, label %194

194:                                              ; preds = %190, %194
  %195 = phi i32 [ %207, %194 ], [ %163, %190 ]
  %196 = phi float [ %206, %194 ], [ 0.000000e+00, %190 ]
  %197 = phi i32 [ %208, %194 ], [ 0, %190 ]
  %198 = sub nsw i32 %3, %195
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float* %165, i64 %199
  %201 = load float, float* %200, align 4, !tbaa !5
  %202 = add i32 %191, %195
  %203 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = fmul contract float %201, %204
  %206 = fadd contract float %196, %205
  %207 = add i32 %195, 1
  %208 = add nuw nsw i32 %197, 1
  %209 = icmp eq i32 %208, %192
  br i1 %209, label %210, label %194, !llvm.loop !16

210:                                              ; preds = %194, %190
  %211 = phi i32 [ %163, %190 ], [ %171, %194 ]
  %212 = phi float [ 0.000000e+00, %190 ], [ %206, %194 ]
  %213 = phi float [ undef, %190 ], [ %206, %194 ]
  %214 = icmp ult i32 %168, 7
  br i1 %214, label %215, label %219

215:                                              ; preds = %219, %210, %189
  %216 = phi float [ 0.000000e+00, %189 ], [ %213, %210 ], [ %300, %219 ]
  %217 = sext i32 %8 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %20, i64 %217
  store float %216, float addrspace(1)* %218, align 4, !tbaa !5
  br label %303

219:                                              ; preds = %210, %219
  %220 = phi i32 [ %301, %219 ], [ %211, %210 ]
  %221 = phi float [ %300, %219 ], [ %212, %210 ]
  %222 = sub nsw i32 %3, %220
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float* %165, i64 %223
  %225 = load float, float* %224, align 4, !tbaa !5
  %226 = add i32 %191, %220
  %227 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %226
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = fmul contract float %225, %228
  %230 = fadd contract float %221, %229
  %231 = add i32 %220, 1
  %232 = sub nsw i32 %3, %231
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float* %165, i64 %233
  %235 = load float, float* %234, align 4, !tbaa !5
  %236 = add i32 %191, %231
  %237 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %236
  %238 = load float, float addrspace(3)* %237, align 4, !tbaa !5
  %239 = fmul contract float %235, %238
  %240 = fadd contract float %230, %239
  %241 = add i32 %220, 2
  %242 = sub nsw i32 %3, %241
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds float, float* %165, i64 %243
  %245 = load float, float* %244, align 4, !tbaa !5
  %246 = add i32 %191, %241
  %247 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %246
  %248 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %249 = fmul contract float %245, %248
  %250 = fadd contract float %240, %249
  %251 = add i32 %220, 3
  %252 = sub nsw i32 %3, %251
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds float, float* %165, i64 %253
  %255 = load float, float* %254, align 4, !tbaa !5
  %256 = add i32 %191, %251
  %257 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %256
  %258 = load float, float addrspace(3)* %257, align 4, !tbaa !5
  %259 = fmul contract float %255, %258
  %260 = fadd contract float %250, %259
  %261 = add i32 %220, 4
  %262 = sub nsw i32 %3, %261
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float* %165, i64 %263
  %265 = load float, float* %264, align 4, !tbaa !5
  %266 = add i32 %191, %261
  %267 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %266
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %269 = fmul contract float %265, %268
  %270 = fadd contract float %260, %269
  %271 = add i32 %220, 5
  %272 = sub nsw i32 %3, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds float, float* %165, i64 %273
  %275 = load float, float* %274, align 4, !tbaa !5
  %276 = add i32 %191, %271
  %277 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = fmul contract float %275, %278
  %280 = fadd contract float %270, %279
  %281 = add i32 %220, 6
  %282 = sub nsw i32 %3, %281
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float* %165, i64 %283
  %285 = load float, float* %284, align 4, !tbaa !5
  %286 = add i32 %191, %281
  %287 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %286
  %288 = load float, float addrspace(3)* %287, align 4, !tbaa !5
  %289 = fmul contract float %285, %288
  %290 = fadd contract float %280, %289
  %291 = add i32 %220, 7
  %292 = sub nsw i32 %3, %291
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float* %165, i64 %293
  %295 = load float, float* %294, align 4, !tbaa !5
  %296 = add i32 %191, %291
  %297 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %296
  %298 = load float, float addrspace(3)* %297, align 4, !tbaa !5
  %299 = fmul contract float %295, %298
  %300 = fadd contract float %290, %299
  %301 = add i32 %220, 8
  %302 = icmp eq i32 %301, %167
  br i1 %302, label %215, label %219, !llvm.loop !17

303:                                              ; preds = %162, %215
  %304 = shl i32 %4, 4
  %305 = add i32 %304, 16
  %306 = add nsw i32 %305, %11
  %307 = icmp slt i32 %306, %2
  br i1 %307, label %308, label %422

308:                                              ; preds = %303
  br i1 %164, label %418, label %309

309:                                              ; preds = %308
  %310 = add i32 %60, %305
  %311 = and i32 %169, 7
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %329, label %313

313:                                              ; preds = %309, %313
  %314 = phi i32 [ %326, %313 ], [ %163, %309 ]
  %315 = phi float [ %325, %313 ], [ 0.000000e+00, %309 ]
  %316 = phi i32 [ %327, %313 ], [ 0, %309 ]
  %317 = sub nsw i32 %3, %314
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float* %165, i64 %318
  %320 = load float, float* %319, align 4, !tbaa !5
  %321 = add i32 %310, %314
  %322 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %321
  %323 = load float, float addrspace(3)* %322, align 4, !tbaa !5
  %324 = fmul contract float %320, %323
  %325 = fadd contract float %315, %324
  %326 = add i32 %314, 1
  %327 = add nuw nsw i32 %316, 1
  %328 = icmp eq i32 %327, %311
  br i1 %328, label %329, label %313, !llvm.loop !16

329:                                              ; preds = %313, %309
  %330 = phi i32 [ %163, %309 ], [ %171, %313 ]
  %331 = phi float [ 0.000000e+00, %309 ], [ %325, %313 ]
  %332 = phi float [ undef, %309 ], [ %325, %313 ]
  %333 = icmp ult i32 %168, 7
  br i1 %333, label %418, label %334

334:                                              ; preds = %329, %334
  %335 = phi i32 [ %416, %334 ], [ %330, %329 ]
  %336 = phi float [ %415, %334 ], [ %331, %329 ]
  %337 = sub nsw i32 %3, %335
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds float, float* %165, i64 %338
  %340 = load float, float* %339, align 4, !tbaa !5
  %341 = add i32 %310, %335
  %342 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %341
  %343 = load float, float addrspace(3)* %342, align 4, !tbaa !5
  %344 = fmul contract float %340, %343
  %345 = fadd contract float %336, %344
  %346 = add i32 %335, 1
  %347 = sub nsw i32 %3, %346
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float* %165, i64 %348
  %350 = load float, float* %349, align 4, !tbaa !5
  %351 = add i32 %310, %346
  %352 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %351
  %353 = load float, float addrspace(3)* %352, align 4, !tbaa !5
  %354 = fmul contract float %350, %353
  %355 = fadd contract float %345, %354
  %356 = add i32 %335, 2
  %357 = sub nsw i32 %3, %356
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float* %165, i64 %358
  %360 = load float, float* %359, align 4, !tbaa !5
  %361 = add i32 %310, %356
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %361
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !5
  %364 = fmul contract float %360, %363
  %365 = fadd contract float %355, %364
  %366 = add i32 %335, 3
  %367 = sub nsw i32 %3, %366
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds float, float* %165, i64 %368
  %370 = load float, float* %369, align 4, !tbaa !5
  %371 = add i32 %310, %366
  %372 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %371
  %373 = load float, float addrspace(3)* %372, align 4, !tbaa !5
  %374 = fmul contract float %370, %373
  %375 = fadd contract float %365, %374
  %376 = add i32 %335, 4
  %377 = sub nsw i32 %3, %376
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds float, float* %165, i64 %378
  %380 = load float, float* %379, align 4, !tbaa !5
  %381 = add i32 %310, %376
  %382 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %381
  %383 = load float, float addrspace(3)* %382, align 4, !tbaa !5
  %384 = fmul contract float %380, %383
  %385 = fadd contract float %375, %384
  %386 = add i32 %335, 5
  %387 = sub nsw i32 %3, %386
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds float, float* %165, i64 %388
  %390 = load float, float* %389, align 4, !tbaa !5
  %391 = add i32 %310, %386
  %392 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %391
  %393 = load float, float addrspace(3)* %392, align 4, !tbaa !5
  %394 = fmul contract float %390, %393
  %395 = fadd contract float %385, %394
  %396 = add i32 %335, 6
  %397 = sub nsw i32 %3, %396
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds float, float* %165, i64 %398
  %400 = load float, float* %399, align 4, !tbaa !5
  %401 = add i32 %310, %396
  %402 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %401
  %403 = load float, float addrspace(3)* %402, align 4, !tbaa !5
  %404 = fmul contract float %400, %403
  %405 = fadd contract float %395, %404
  %406 = add i32 %335, 7
  %407 = sub nsw i32 %3, %406
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds float, float* %165, i64 %408
  %410 = load float, float* %409, align 4, !tbaa !5
  %411 = add i32 %310, %406
  %412 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %411
  %413 = load float, float addrspace(3)* %412, align 4, !tbaa !5
  %414 = fmul contract float %410, %413
  %415 = fadd contract float %405, %414
  %416 = add i32 %335, 8
  %417 = icmp eq i32 %416, %167
  br i1 %417, label %418, label %334, !llvm.loop !17

418:                                              ; preds = %334, %329, %308
  %419 = phi float [ 0.000000e+00, %308 ], [ %332, %329 ], [ %415, %334 ]
  %420 = sext i32 %305 to i64
  %421 = getelementptr inbounds float, float addrspace(1)* %20, i64 %420
  store float %419, float addrspace(1)* %421, align 4, !tbaa !5
  br label %422

422:                                              ; preds = %418, %303
  %423 = shl i32 %4, 4
  %424 = add i32 %423, 32
  %425 = add nsw i32 %424, %11
  %426 = icmp slt i32 %425, %2
  br i1 %426, label %427, label %541

427:                                              ; preds = %422
  br i1 %164, label %537, label %428

428:                                              ; preds = %427
  %429 = add i32 %60, %424
  %430 = and i32 %169, 7
  %431 = icmp eq i32 %430, 0
  br i1 %431, label %448, label %432

432:                                              ; preds = %428, %432
  %433 = phi i32 [ %445, %432 ], [ %163, %428 ]
  %434 = phi float [ %444, %432 ], [ 0.000000e+00, %428 ]
  %435 = phi i32 [ %446, %432 ], [ 0, %428 ]
  %436 = sub nsw i32 %3, %433
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds float, float* %165, i64 %437
  %439 = load float, float* %438, align 4, !tbaa !5
  %440 = add i32 %429, %433
  %441 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %440
  %442 = load float, float addrspace(3)* %441, align 4, !tbaa !5
  %443 = fmul contract float %439, %442
  %444 = fadd contract float %434, %443
  %445 = add i32 %433, 1
  %446 = add nuw nsw i32 %435, 1
  %447 = icmp eq i32 %446, %430
  br i1 %447, label %448, label %432, !llvm.loop !16

448:                                              ; preds = %432, %428
  %449 = phi i32 [ %163, %428 ], [ %171, %432 ]
  %450 = phi float [ 0.000000e+00, %428 ], [ %444, %432 ]
  %451 = phi float [ undef, %428 ], [ %444, %432 ]
  %452 = icmp ult i32 %168, 7
  br i1 %452, label %537, label %453

453:                                              ; preds = %448, %453
  %454 = phi i32 [ %535, %453 ], [ %449, %448 ]
  %455 = phi float [ %534, %453 ], [ %450, %448 ]
  %456 = sub nsw i32 %3, %454
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds float, float* %165, i64 %457
  %459 = load float, float* %458, align 4, !tbaa !5
  %460 = add i32 %429, %454
  %461 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %460
  %462 = load float, float addrspace(3)* %461, align 4, !tbaa !5
  %463 = fmul contract float %459, %462
  %464 = fadd contract float %455, %463
  %465 = add i32 %454, 1
  %466 = sub nsw i32 %3, %465
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds float, float* %165, i64 %467
  %469 = load float, float* %468, align 4, !tbaa !5
  %470 = add i32 %429, %465
  %471 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %470
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !5
  %473 = fmul contract float %469, %472
  %474 = fadd contract float %464, %473
  %475 = add i32 %454, 2
  %476 = sub nsw i32 %3, %475
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds float, float* %165, i64 %477
  %479 = load float, float* %478, align 4, !tbaa !5
  %480 = add i32 %429, %475
  %481 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %480
  %482 = load float, float addrspace(3)* %481, align 4, !tbaa !5
  %483 = fmul contract float %479, %482
  %484 = fadd contract float %474, %483
  %485 = add i32 %454, 3
  %486 = sub nsw i32 %3, %485
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds float, float* %165, i64 %487
  %489 = load float, float* %488, align 4, !tbaa !5
  %490 = add i32 %429, %485
  %491 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %490
  %492 = load float, float addrspace(3)* %491, align 4, !tbaa !5
  %493 = fmul contract float %489, %492
  %494 = fadd contract float %484, %493
  %495 = add i32 %454, 4
  %496 = sub nsw i32 %3, %495
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float* %165, i64 %497
  %499 = load float, float* %498, align 4, !tbaa !5
  %500 = add i32 %429, %495
  %501 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %500
  %502 = load float, float addrspace(3)* %501, align 4, !tbaa !5
  %503 = fmul contract float %499, %502
  %504 = fadd contract float %494, %503
  %505 = add i32 %454, 5
  %506 = sub nsw i32 %3, %505
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float* %165, i64 %507
  %509 = load float, float* %508, align 4, !tbaa !5
  %510 = add i32 %429, %505
  %511 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %510
  %512 = load float, float addrspace(3)* %511, align 4, !tbaa !5
  %513 = fmul contract float %509, %512
  %514 = fadd contract float %504, %513
  %515 = add i32 %454, 6
  %516 = sub nsw i32 %3, %515
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float* %165, i64 %517
  %519 = load float, float* %518, align 4, !tbaa !5
  %520 = add i32 %429, %515
  %521 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %520
  %522 = load float, float addrspace(3)* %521, align 4, !tbaa !5
  %523 = fmul contract float %519, %522
  %524 = fadd contract float %514, %523
  %525 = add i32 %454, 7
  %526 = sub nsw i32 %3, %525
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float* %165, i64 %527
  %529 = load float, float* %528, align 4, !tbaa !5
  %530 = add i32 %429, %525
  %531 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %530
  %532 = load float, float addrspace(3)* %531, align 4, !tbaa !5
  %533 = fmul contract float %529, %532
  %534 = fadd contract float %524, %533
  %535 = add i32 %454, 8
  %536 = icmp eq i32 %535, %167
  br i1 %536, label %537, label %453, !llvm.loop !17

537:                                              ; preds = %453, %448, %427
  %538 = phi float [ 0.000000e+00, %427 ], [ %451, %448 ], [ %534, %453 ]
  %539 = sext i32 %424 to i64
  %540 = getelementptr inbounds float, float addrspace(1)* %20, i64 %539
  store float %538, float addrspace(1)* %540, align 4, !tbaa !5
  br label %541

541:                                              ; preds = %537, %422
  %542 = shl i32 %4, 4
  %543 = add i32 %542, 48
  %544 = add nsw i32 %543, %11
  %545 = icmp slt i32 %544, %2
  br i1 %545, label %546, label %660

546:                                              ; preds = %541
  br i1 %164, label %656, label %547

547:                                              ; preds = %546
  %548 = add i32 %60, %543
  %549 = and i32 %169, 7
  %550 = icmp eq i32 %549, 0
  br i1 %550, label %567, label %551

551:                                              ; preds = %547, %551
  %552 = phi i32 [ %564, %551 ], [ %163, %547 ]
  %553 = phi float [ %563, %551 ], [ 0.000000e+00, %547 ]
  %554 = phi i32 [ %565, %551 ], [ 0, %547 ]
  %555 = sub nsw i32 %3, %552
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds float, float* %165, i64 %556
  %558 = load float, float* %557, align 4, !tbaa !5
  %559 = add i32 %548, %552
  %560 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %559
  %561 = load float, float addrspace(3)* %560, align 4, !tbaa !5
  %562 = fmul contract float %558, %561
  %563 = fadd contract float %553, %562
  %564 = add i32 %552, 1
  %565 = add nuw nsw i32 %554, 1
  %566 = icmp eq i32 %565, %549
  br i1 %566, label %567, label %551, !llvm.loop !16

567:                                              ; preds = %551, %547
  %568 = phi i32 [ %163, %547 ], [ %171, %551 ]
  %569 = phi float [ 0.000000e+00, %547 ], [ %563, %551 ]
  %570 = phi float [ undef, %547 ], [ %563, %551 ]
  %571 = icmp ult i32 %168, 7
  br i1 %571, label %656, label %572

572:                                              ; preds = %567, %572
  %573 = phi i32 [ %654, %572 ], [ %568, %567 ]
  %574 = phi float [ %653, %572 ], [ %569, %567 ]
  %575 = sub nsw i32 %3, %573
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds float, float* %165, i64 %576
  %578 = load float, float* %577, align 4, !tbaa !5
  %579 = add i32 %548, %573
  %580 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %579
  %581 = load float, float addrspace(3)* %580, align 4, !tbaa !5
  %582 = fmul contract float %578, %581
  %583 = fadd contract float %574, %582
  %584 = add i32 %573, 1
  %585 = sub nsw i32 %3, %584
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds float, float* %165, i64 %586
  %588 = load float, float* %587, align 4, !tbaa !5
  %589 = add i32 %548, %584
  %590 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %589
  %591 = load float, float addrspace(3)* %590, align 4, !tbaa !5
  %592 = fmul contract float %588, %591
  %593 = fadd contract float %583, %592
  %594 = add i32 %573, 2
  %595 = sub nsw i32 %3, %594
  %596 = sext i32 %595 to i64
  %597 = getelementptr inbounds float, float* %165, i64 %596
  %598 = load float, float* %597, align 4, !tbaa !5
  %599 = add i32 %548, %594
  %600 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %599
  %601 = load float, float addrspace(3)* %600, align 4, !tbaa !5
  %602 = fmul contract float %598, %601
  %603 = fadd contract float %593, %602
  %604 = add i32 %573, 3
  %605 = sub nsw i32 %3, %604
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds float, float* %165, i64 %606
  %608 = load float, float* %607, align 4, !tbaa !5
  %609 = add i32 %548, %604
  %610 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %609
  %611 = load float, float addrspace(3)* %610, align 4, !tbaa !5
  %612 = fmul contract float %608, %611
  %613 = fadd contract float %603, %612
  %614 = add i32 %573, 4
  %615 = sub nsw i32 %3, %614
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds float, float* %165, i64 %616
  %618 = load float, float* %617, align 4, !tbaa !5
  %619 = add i32 %548, %614
  %620 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %619
  %621 = load float, float addrspace(3)* %620, align 4, !tbaa !5
  %622 = fmul contract float %618, %621
  %623 = fadd contract float %613, %622
  %624 = add i32 %573, 5
  %625 = sub nsw i32 %3, %624
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds float, float* %165, i64 %626
  %628 = load float, float* %627, align 4, !tbaa !5
  %629 = add i32 %548, %624
  %630 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %629
  %631 = load float, float addrspace(3)* %630, align 4, !tbaa !5
  %632 = fmul contract float %628, %631
  %633 = fadd contract float %623, %632
  %634 = add i32 %573, 6
  %635 = sub nsw i32 %3, %634
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds float, float* %165, i64 %636
  %638 = load float, float* %637, align 4, !tbaa !5
  %639 = add i32 %548, %634
  %640 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %639
  %641 = load float, float addrspace(3)* %640, align 4, !tbaa !5
  %642 = fmul contract float %638, %641
  %643 = fadd contract float %633, %642
  %644 = add i32 %573, 7
  %645 = sub nsw i32 %3, %644
  %646 = sext i32 %645 to i64
  %647 = getelementptr inbounds float, float* %165, i64 %646
  %648 = load float, float* %647, align 4, !tbaa !5
  %649 = add i32 %548, %644
  %650 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %649
  %651 = load float, float addrspace(3)* %650, align 4, !tbaa !5
  %652 = fmul contract float %648, %651
  %653 = fadd contract float %643, %652
  %654 = add i32 %573, 8
  %655 = icmp eq i32 %654, %167
  br i1 %655, label %656, label %572, !llvm.loop !17

656:                                              ; preds = %572, %567, %546
  %657 = phi float [ 0.000000e+00, %546 ], [ %570, %567 ], [ %653, %572 ]
  %658 = sext i32 %543 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %20, i64 %658
  store float %657, float addrspace(1)* %659, align 4, !tbaa !5
  br label %660

660:                                              ; preds = %656, %541
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
