; ModuleID = '../data/hip_kernels/15524/7/main.cu'
source_filename = "../data/hip_kernels/15524/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33convolutionColumnsKernel_down_smpPfS_iiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 2
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 7
  %15 = shl i32 %7, 4
  %16 = sub i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = shl i32 %13, 6
  %20 = add i32 %19, %17
  %21 = icmp slt i32 %12, %2
  br i1 %21, label %22, label %684

22:                                               ; preds = %8
  %23 = mul nsw i32 %18, %5
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = mul nsw i32 %20, %5
  %28 = add nsw i32 %27, %12
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = icmp sgt i32 %7, 0
  %32 = shl i32 %7, 1
  %33 = add i32 %32, 8
  br i1 %31, label %34, label %63

34:                                               ; preds = %22
  %35 = shl nuw nsw i32 %11, 4
  %36 = mul i32 %35, %33
  %37 = add i32 %36, %17
  %38 = and i32 %7, 3
  %39 = icmp ult i32 %7, 4
  br i1 %39, label %42, label %40

40:                                               ; preds = %34
  %41 = and i32 %7, -4
  br label %93

42:                                               ; preds = %143, %34
  %43 = phi i32 [ 0, %34 ], [ %147, %143 ]
  %44 = icmp eq i32 %38, 0
  br i1 %44, label %63, label %45

45:                                               ; preds = %42, %56
  %46 = phi i32 [ %60, %56 ], [ %43, %42 ]
  %47 = phi i32 [ %61, %56 ], [ 0, %42 ]
  %48 = shl nsw i32 %46, 4
  %49 = add nsw i32 %48, %18
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %51, label %56

51:                                               ; preds = %45
  %52 = mul nsw i32 %48, %5
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %26, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %56

56:                                               ; preds = %51, %45
  %57 = phi contract float [ %55, %51 ], [ 0.000000e+00, %45 ]
  %58 = add i32 %37, %48
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %58
  store float %57, float addrspace(3)* %59, align 4, !tbaa !5
  %60 = add nuw nsw i32 %46, 1
  %61 = add nuw nsw i32 %47, 1
  %62 = icmp eq i32 %61, %38
  br i1 %62, label %63, label %45, !llvm.loop !10

63:                                               ; preds = %56, %42, %22
  %64 = icmp sgt i32 %33, %7
  %65 = mul i32 %33, %11
  %66 = shl i32 %65, 4
  br i1 %64, label %67, label %150

67:                                               ; preds = %63
  %68 = add i32 %66, %17
  %69 = add i32 %7, 7
  %70 = and i32 %7, 3
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %90, label %72

72:                                               ; preds = %67, %83
  %73 = phi i32 [ %87, %83 ], [ %7, %67 ]
  %74 = phi i32 [ %88, %83 ], [ 0, %67 ]
  %75 = shl nsw i32 %73, 4
  %76 = add nsw i32 %75, %18
  %77 = icmp slt i32 %76, %3
  br i1 %77, label %78, label %83

78:                                               ; preds = %72
  %79 = mul nsw i32 %75, %5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %26, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %78, %72
  %84 = phi contract float [ %82, %78 ], [ 0.000000e+00, %72 ]
  %85 = add i32 %68, %75
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %85
  store float %84, float addrspace(3)* %86, align 4, !tbaa !5
  %87 = add nsw i32 %73, 1
  %88 = add nuw nsw i32 %74, 1
  %89 = icmp eq i32 %88, %70
  br i1 %89, label %90, label %72, !llvm.loop !12

90:                                               ; preds = %83, %67
  %91 = phi i32 [ %7, %67 ], [ %87, %83 ]
  %92 = icmp ult i32 %69, 3
  br i1 %92, label %150, label %164

93:                                               ; preds = %143, %40
  %94 = phi i32 [ 0, %40 ], [ %147, %143 ]
  %95 = phi i32 [ 0, %40 ], [ %148, %143 ]
  %96 = shl nsw i32 %94, 4
  %97 = add nsw i32 %96, %18
  %98 = icmp sgt i32 %97, -1
  br i1 %98, label %99, label %104

99:                                               ; preds = %93
  %100 = mul nsw i32 %96, %5
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %26, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %104

104:                                              ; preds = %93, %99
  %105 = phi contract float [ %103, %99 ], [ 0.000000e+00, %93 ]
  %106 = add i32 %37, %96
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %106
  store float %105, float addrspace(3)* %107, align 4, !tbaa !5
  %108 = shl i32 %94, 4
  %109 = or i32 %108, 16
  %110 = add nsw i32 %109, %18
  %111 = icmp sgt i32 %110, -1
  br i1 %111, label %112, label %117

112:                                              ; preds = %104
  %113 = mul nsw i32 %109, %5
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %26, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %117

117:                                              ; preds = %112, %104
  %118 = phi contract float [ %116, %112 ], [ 0.000000e+00, %104 ]
  %119 = add i32 %37, %109
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %119
  store float %118, float addrspace(3)* %120, align 4, !tbaa !5
  %121 = shl i32 %94, 4
  %122 = or i32 %121, 32
  %123 = add nsw i32 %122, %18
  %124 = icmp sgt i32 %123, -1
  br i1 %124, label %125, label %130

125:                                              ; preds = %117
  %126 = mul nsw i32 %122, %5
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %26, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %130

130:                                              ; preds = %125, %117
  %131 = phi contract float [ %129, %125 ], [ 0.000000e+00, %117 ]
  %132 = add i32 %37, %122
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %132
  store float %131, float addrspace(3)* %133, align 4, !tbaa !5
  %134 = shl i32 %94, 4
  %135 = or i32 %134, 48
  %136 = add nsw i32 %135, %18
  %137 = icmp sgt i32 %136, -1
  br i1 %137, label %138, label %143

138:                                              ; preds = %130
  %139 = mul nsw i32 %135, %5
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %26, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %143

143:                                              ; preds = %138, %130
  %144 = phi contract float [ %142, %138 ], [ 0.000000e+00, %130 ]
  %145 = add i32 %37, %135
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %145
  store float %144, float addrspace(3)* %146, align 4, !tbaa !5
  %147 = add nuw nsw i32 %94, 4
  %148 = add i32 %95, 4
  %149 = icmp eq i32 %148, %41
  br i1 %149, label %42, label %93, !llvm.loop !13

150:                                              ; preds = %213, %90, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = sub i32 0, %6
  %152 = icmp slt i32 %6, 0
  %153 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %154 = shl nuw nsw i32 %17, 1
  %155 = add i32 %15, %154
  %156 = add i32 %155, %66
  %157 = tail call i32 @llvm.abs.i32(i32 %6, i1 false)
  %158 = add nuw i32 %157, 1
  %159 = add i32 %157, %6
  %160 = add i32 %159, 1
  %161 = and i32 %160, 7
  %162 = sub i32 %161, %6
  %163 = icmp slt i32 %20, %4
  br i1 %163, label %219, label %330

164:                                              ; preds = %90, %213
  %165 = phi i32 [ %217, %213 ], [ %91, %90 ]
  %166 = shl nsw i32 %165, 4
  %167 = add nsw i32 %166, %18
  %168 = icmp slt i32 %167, %3
  br i1 %168, label %169, label %174

169:                                              ; preds = %164
  %170 = mul nsw i32 %166, %5
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %26, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %174

174:                                              ; preds = %164, %169
  %175 = phi contract float [ %173, %169 ], [ 0.000000e+00, %164 ]
  %176 = add i32 %68, %166
  %177 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %176
  store float %175, float addrspace(3)* %177, align 4, !tbaa !5
  %178 = shl i32 %165, 4
  %179 = add i32 %178, 16
  %180 = add nsw i32 %179, %18
  %181 = icmp slt i32 %180, %3
  br i1 %181, label %182, label %187

182:                                              ; preds = %174
  %183 = mul nsw i32 %179, %5
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %26, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %187

187:                                              ; preds = %182, %174
  %188 = phi contract float [ %186, %182 ], [ 0.000000e+00, %174 ]
  %189 = add i32 %68, %179
  %190 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %189
  store float %188, float addrspace(3)* %190, align 4, !tbaa !5
  %191 = shl i32 %165, 4
  %192 = add i32 %191, 32
  %193 = add nsw i32 %192, %18
  %194 = icmp slt i32 %193, %3
  br i1 %194, label %195, label %200

195:                                              ; preds = %187
  %196 = mul nsw i32 %192, %5
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %26, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %200

200:                                              ; preds = %195, %187
  %201 = phi contract float [ %199, %195 ], [ 0.000000e+00, %187 ]
  %202 = add i32 %68, %192
  %203 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %202
  store float %201, float addrspace(3)* %203, align 4, !tbaa !5
  %204 = shl i32 %165, 4
  %205 = add i32 %204, 48
  %206 = add nsw i32 %205, %18
  %207 = icmp slt i32 %206, %3
  br i1 %207, label %208, label %213

208:                                              ; preds = %200
  %209 = mul nsw i32 %205, %5
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %26, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %213

213:                                              ; preds = %208, %200
  %214 = phi contract float [ %212, %208 ], [ 0.000000e+00, %200 ]
  %215 = add i32 %68, %205
  %216 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %215
  store float %214, float addrspace(3)* %216, align 4, !tbaa !5
  %217 = add nsw i32 %165, 4
  %218 = icmp eq i32 %217, %33
  br i1 %218, label %150, label %164, !llvm.loop !15

219:                                              ; preds = %150
  br i1 %152, label %244, label %220

220:                                              ; preds = %219
  %221 = and i32 %160, 7
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %239, label %223

223:                                              ; preds = %220, %223
  %224 = phi i32 [ %236, %223 ], [ %151, %220 ]
  %225 = phi float [ %235, %223 ], [ 0.000000e+00, %220 ]
  %226 = phi i32 [ %237, %223 ], [ 0, %220 ]
  %227 = sub nsw i32 %6, %224
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float* %153, i64 %228
  %230 = load float, float* %229, align 4, !tbaa !5
  %231 = add i32 %156, %224
  %232 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %234 = fmul contract float %230, %233
  %235 = fadd contract float %225, %234
  %236 = add i32 %224, 1
  %237 = add nuw nsw i32 %226, 1
  %238 = icmp eq i32 %237, %221
  br i1 %238, label %239, label %223, !llvm.loop !16

239:                                              ; preds = %223, %220
  %240 = phi i32 [ %151, %220 ], [ %162, %223 ]
  %241 = phi float [ 0.000000e+00, %220 ], [ %235, %223 ]
  %242 = phi float [ undef, %220 ], [ %235, %223 ]
  %243 = icmp ult i32 %159, 7
  br i1 %243, label %244, label %246

244:                                              ; preds = %246, %239, %219
  %245 = phi float [ 0.000000e+00, %219 ], [ %242, %239 ], [ %327, %246 ]
  store float %245, float addrspace(1)* %30, align 4, !tbaa !5
  br label %330

246:                                              ; preds = %239, %246
  %247 = phi i32 [ %328, %246 ], [ %240, %239 ]
  %248 = phi float [ %327, %246 ], [ %241, %239 ]
  %249 = sub nsw i32 %6, %247
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds float, float* %153, i64 %250
  %252 = load float, float* %251, align 4, !tbaa !5
  %253 = add i32 %156, %247
  %254 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !5
  %256 = fmul contract float %252, %255
  %257 = fadd contract float %248, %256
  %258 = add i32 %247, 1
  %259 = sub nsw i32 %6, %258
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float* %153, i64 %260
  %262 = load float, float* %261, align 4, !tbaa !5
  %263 = add i32 %156, %258
  %264 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %266 = fmul contract float %262, %265
  %267 = fadd contract float %257, %266
  %268 = add i32 %247, 2
  %269 = sub nsw i32 %6, %268
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float* %153, i64 %270
  %272 = load float, float* %271, align 4, !tbaa !5
  %273 = add i32 %156, %268
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %273
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %276 = fmul contract float %272, %275
  %277 = fadd contract float %267, %276
  %278 = add i32 %247, 3
  %279 = sub nsw i32 %6, %278
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float* %153, i64 %280
  %282 = load float, float* %281, align 4, !tbaa !5
  %283 = add i32 %156, %278
  %284 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %283
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !5
  %286 = fmul contract float %282, %285
  %287 = fadd contract float %277, %286
  %288 = add i32 %247, 4
  %289 = sub nsw i32 %6, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float* %153, i64 %290
  %292 = load float, float* %291, align 4, !tbaa !5
  %293 = add i32 %156, %288
  %294 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %293
  %295 = load float, float addrspace(3)* %294, align 4, !tbaa !5
  %296 = fmul contract float %292, %295
  %297 = fadd contract float %287, %296
  %298 = add i32 %247, 5
  %299 = sub nsw i32 %6, %298
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float* %153, i64 %300
  %302 = load float, float* %301, align 4, !tbaa !5
  %303 = add i32 %156, %298
  %304 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %303
  %305 = load float, float addrspace(3)* %304, align 4, !tbaa !5
  %306 = fmul contract float %302, %305
  %307 = fadd contract float %297, %306
  %308 = add i32 %247, 6
  %309 = sub nsw i32 %6, %308
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds float, float* %153, i64 %310
  %312 = load float, float* %311, align 4, !tbaa !5
  %313 = add i32 %156, %308
  %314 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %313
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = fmul contract float %312, %315
  %317 = fadd contract float %307, %316
  %318 = add i32 %247, 7
  %319 = sub nsw i32 %6, %318
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float* %153, i64 %320
  %322 = load float, float* %321, align 4, !tbaa !5
  %323 = add i32 %156, %318
  %324 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %323
  %325 = load float, float addrspace(3)* %324, align 4, !tbaa !5
  %326 = fmul contract float %322, %325
  %327 = fadd contract float %317, %326
  %328 = add i32 %247, 8
  %329 = icmp eq i32 %328, %158
  br i1 %329, label %244, label %246, !llvm.loop !17

330:                                              ; preds = %244, %150
  %331 = add nsw i32 %20, 16
  %332 = icmp slt i32 %331, %4
  br i1 %332, label %333, label %448

333:                                              ; preds = %330
  br i1 %152, label %443, label %334

334:                                              ; preds = %333
  %335 = add i32 %156, 32
  %336 = and i32 %160, 7
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %354, label %338

338:                                              ; preds = %334, %338
  %339 = phi i32 [ %351, %338 ], [ %151, %334 ]
  %340 = phi float [ %350, %338 ], [ 0.000000e+00, %334 ]
  %341 = phi i32 [ %352, %338 ], [ 0, %334 ]
  %342 = sub nsw i32 %6, %339
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds float, float* %153, i64 %343
  %345 = load float, float* %344, align 4, !tbaa !5
  %346 = add i32 %335, %339
  %347 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %346
  %348 = load float, float addrspace(3)* %347, align 4, !tbaa !5
  %349 = fmul contract float %345, %348
  %350 = fadd contract float %340, %349
  %351 = add i32 %339, 1
  %352 = add nuw nsw i32 %341, 1
  %353 = icmp eq i32 %352, %336
  br i1 %353, label %354, label %338, !llvm.loop !16

354:                                              ; preds = %338, %334
  %355 = phi i32 [ %151, %334 ], [ %162, %338 ]
  %356 = phi float [ 0.000000e+00, %334 ], [ %350, %338 ]
  %357 = phi float [ undef, %334 ], [ %350, %338 ]
  %358 = icmp ult i32 %159, 7
  br i1 %358, label %443, label %359

359:                                              ; preds = %354, %359
  %360 = phi i32 [ %441, %359 ], [ %355, %354 ]
  %361 = phi float [ %440, %359 ], [ %356, %354 ]
  %362 = sub nsw i32 %6, %360
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float* %153, i64 %363
  %365 = load float, float* %364, align 4, !tbaa !5
  %366 = add i32 %335, %360
  %367 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %366
  %368 = load float, float addrspace(3)* %367, align 4, !tbaa !5
  %369 = fmul contract float %365, %368
  %370 = fadd contract float %361, %369
  %371 = add i32 %360, 1
  %372 = sub nsw i32 %6, %371
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds float, float* %153, i64 %373
  %375 = load float, float* %374, align 4, !tbaa !5
  %376 = add i32 %335, %371
  %377 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %376
  %378 = load float, float addrspace(3)* %377, align 4, !tbaa !5
  %379 = fmul contract float %375, %378
  %380 = fadd contract float %370, %379
  %381 = add i32 %360, 2
  %382 = sub nsw i32 %6, %381
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds float, float* %153, i64 %383
  %385 = load float, float* %384, align 4, !tbaa !5
  %386 = add i32 %335, %381
  %387 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %386
  %388 = load float, float addrspace(3)* %387, align 4, !tbaa !5
  %389 = fmul contract float %385, %388
  %390 = fadd contract float %380, %389
  %391 = add i32 %360, 3
  %392 = sub nsw i32 %6, %391
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds float, float* %153, i64 %393
  %395 = load float, float* %394, align 4, !tbaa !5
  %396 = add i32 %335, %391
  %397 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %396
  %398 = load float, float addrspace(3)* %397, align 4, !tbaa !5
  %399 = fmul contract float %395, %398
  %400 = fadd contract float %390, %399
  %401 = add i32 %360, 4
  %402 = sub nsw i32 %6, %401
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds float, float* %153, i64 %403
  %405 = load float, float* %404, align 4, !tbaa !5
  %406 = add i32 %335, %401
  %407 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %406
  %408 = load float, float addrspace(3)* %407, align 4, !tbaa !5
  %409 = fmul contract float %405, %408
  %410 = fadd contract float %400, %409
  %411 = add i32 %360, 5
  %412 = sub nsw i32 %6, %411
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds float, float* %153, i64 %413
  %415 = load float, float* %414, align 4, !tbaa !5
  %416 = add i32 %335, %411
  %417 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %416
  %418 = load float, float addrspace(3)* %417, align 4, !tbaa !5
  %419 = fmul contract float %415, %418
  %420 = fadd contract float %410, %419
  %421 = add i32 %360, 6
  %422 = sub nsw i32 %6, %421
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds float, float* %153, i64 %423
  %425 = load float, float* %424, align 4, !tbaa !5
  %426 = add i32 %335, %421
  %427 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %426
  %428 = load float, float addrspace(3)* %427, align 4, !tbaa !5
  %429 = fmul contract float %425, %428
  %430 = fadd contract float %420, %429
  %431 = add i32 %360, 7
  %432 = sub nsw i32 %6, %431
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds float, float* %153, i64 %433
  %435 = load float, float* %434, align 4, !tbaa !5
  %436 = add i32 %335, %431
  %437 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %436
  %438 = load float, float addrspace(3)* %437, align 4, !tbaa !5
  %439 = fmul contract float %435, %438
  %440 = fadd contract float %430, %439
  %441 = add i32 %360, 8
  %442 = icmp eq i32 %441, %158
  br i1 %442, label %443, label %359, !llvm.loop !17

443:                                              ; preds = %359, %354, %333
  %444 = phi float [ 0.000000e+00, %333 ], [ %357, %354 ], [ %440, %359 ]
  %445 = shl nsw i32 %5, 4
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds float, float addrspace(1)* %30, i64 %446
  store float %444, float addrspace(1)* %447, align 4, !tbaa !5
  br label %448

448:                                              ; preds = %443, %330
  %449 = add nsw i32 %20, 32
  %450 = icmp slt i32 %449, %4
  br i1 %450, label %451, label %566

451:                                              ; preds = %448
  br i1 %152, label %561, label %452

452:                                              ; preds = %451
  %453 = add i32 %156, 64
  %454 = and i32 %160, 7
  %455 = icmp eq i32 %454, 0
  br i1 %455, label %472, label %456

456:                                              ; preds = %452, %456
  %457 = phi i32 [ %469, %456 ], [ %151, %452 ]
  %458 = phi float [ %468, %456 ], [ 0.000000e+00, %452 ]
  %459 = phi i32 [ %470, %456 ], [ 0, %452 ]
  %460 = sub nsw i32 %6, %457
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds float, float* %153, i64 %461
  %463 = load float, float* %462, align 4, !tbaa !5
  %464 = add i32 %453, %457
  %465 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %464
  %466 = load float, float addrspace(3)* %465, align 4, !tbaa !5
  %467 = fmul contract float %463, %466
  %468 = fadd contract float %458, %467
  %469 = add i32 %457, 1
  %470 = add nuw nsw i32 %459, 1
  %471 = icmp eq i32 %470, %454
  br i1 %471, label %472, label %456, !llvm.loop !16

472:                                              ; preds = %456, %452
  %473 = phi i32 [ %151, %452 ], [ %162, %456 ]
  %474 = phi float [ 0.000000e+00, %452 ], [ %468, %456 ]
  %475 = phi float [ undef, %452 ], [ %468, %456 ]
  %476 = icmp ult i32 %159, 7
  br i1 %476, label %561, label %477

477:                                              ; preds = %472, %477
  %478 = phi i32 [ %559, %477 ], [ %473, %472 ]
  %479 = phi float [ %558, %477 ], [ %474, %472 ]
  %480 = sub nsw i32 %6, %478
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds float, float* %153, i64 %481
  %483 = load float, float* %482, align 4, !tbaa !5
  %484 = add i32 %453, %478
  %485 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %484
  %486 = load float, float addrspace(3)* %485, align 4, !tbaa !5
  %487 = fmul contract float %483, %486
  %488 = fadd contract float %479, %487
  %489 = add i32 %478, 1
  %490 = sub nsw i32 %6, %489
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds float, float* %153, i64 %491
  %493 = load float, float* %492, align 4, !tbaa !5
  %494 = add i32 %453, %489
  %495 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %494
  %496 = load float, float addrspace(3)* %495, align 4, !tbaa !5
  %497 = fmul contract float %493, %496
  %498 = fadd contract float %488, %497
  %499 = add i32 %478, 2
  %500 = sub nsw i32 %6, %499
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds float, float* %153, i64 %501
  %503 = load float, float* %502, align 4, !tbaa !5
  %504 = add i32 %453, %499
  %505 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %504
  %506 = load float, float addrspace(3)* %505, align 4, !tbaa !5
  %507 = fmul contract float %503, %506
  %508 = fadd contract float %498, %507
  %509 = add i32 %478, 3
  %510 = sub nsw i32 %6, %509
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds float, float* %153, i64 %511
  %513 = load float, float* %512, align 4, !tbaa !5
  %514 = add i32 %453, %509
  %515 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %514
  %516 = load float, float addrspace(3)* %515, align 4, !tbaa !5
  %517 = fmul contract float %513, %516
  %518 = fadd contract float %508, %517
  %519 = add i32 %478, 4
  %520 = sub nsw i32 %6, %519
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds float, float* %153, i64 %521
  %523 = load float, float* %522, align 4, !tbaa !5
  %524 = add i32 %453, %519
  %525 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %524
  %526 = load float, float addrspace(3)* %525, align 4, !tbaa !5
  %527 = fmul contract float %523, %526
  %528 = fadd contract float %518, %527
  %529 = add i32 %478, 5
  %530 = sub nsw i32 %6, %529
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds float, float* %153, i64 %531
  %533 = load float, float* %532, align 4, !tbaa !5
  %534 = add i32 %453, %529
  %535 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %534
  %536 = load float, float addrspace(3)* %535, align 4, !tbaa !5
  %537 = fmul contract float %533, %536
  %538 = fadd contract float %528, %537
  %539 = add i32 %478, 6
  %540 = sub nsw i32 %6, %539
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds float, float* %153, i64 %541
  %543 = load float, float* %542, align 4, !tbaa !5
  %544 = add i32 %453, %539
  %545 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %544
  %546 = load float, float addrspace(3)* %545, align 4, !tbaa !5
  %547 = fmul contract float %543, %546
  %548 = fadd contract float %538, %547
  %549 = add i32 %478, 7
  %550 = sub nsw i32 %6, %549
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds float, float* %153, i64 %551
  %553 = load float, float* %552, align 4, !tbaa !5
  %554 = add i32 %453, %549
  %555 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %554
  %556 = load float, float addrspace(3)* %555, align 4, !tbaa !5
  %557 = fmul contract float %553, %556
  %558 = fadd contract float %548, %557
  %559 = add i32 %478, 8
  %560 = icmp eq i32 %559, %158
  br i1 %560, label %561, label %477, !llvm.loop !17

561:                                              ; preds = %477, %472, %451
  %562 = phi float [ 0.000000e+00, %451 ], [ %475, %472 ], [ %558, %477 ]
  %563 = shl nsw i32 %5, 5
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds float, float addrspace(1)* %30, i64 %564
  store float %562, float addrspace(1)* %565, align 4, !tbaa !5
  br label %566

566:                                              ; preds = %561, %448
  %567 = add nsw i32 %20, 48
  %568 = icmp slt i32 %567, %4
  br i1 %568, label %569, label %684

569:                                              ; preds = %566
  br i1 %152, label %679, label %570

570:                                              ; preds = %569
  %571 = add i32 %156, 96
  %572 = and i32 %160, 7
  %573 = icmp eq i32 %572, 0
  br i1 %573, label %590, label %574

574:                                              ; preds = %570, %574
  %575 = phi i32 [ %587, %574 ], [ %151, %570 ]
  %576 = phi float [ %586, %574 ], [ 0.000000e+00, %570 ]
  %577 = phi i32 [ %588, %574 ], [ 0, %570 ]
  %578 = sub nsw i32 %6, %575
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds float, float* %153, i64 %579
  %581 = load float, float* %580, align 4, !tbaa !5
  %582 = add i32 %571, %575
  %583 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %582
  %584 = load float, float addrspace(3)* %583, align 4, !tbaa !5
  %585 = fmul contract float %581, %584
  %586 = fadd contract float %576, %585
  %587 = add i32 %575, 1
  %588 = add nuw nsw i32 %577, 1
  %589 = icmp eq i32 %588, %572
  br i1 %589, label %590, label %574, !llvm.loop !16

590:                                              ; preds = %574, %570
  %591 = phi i32 [ %151, %570 ], [ %162, %574 ]
  %592 = phi float [ 0.000000e+00, %570 ], [ %586, %574 ]
  %593 = phi float [ undef, %570 ], [ %586, %574 ]
  %594 = icmp ult i32 %159, 7
  br i1 %594, label %679, label %595

595:                                              ; preds = %590, %595
  %596 = phi i32 [ %677, %595 ], [ %591, %590 ]
  %597 = phi float [ %676, %595 ], [ %592, %590 ]
  %598 = sub nsw i32 %6, %596
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float* %153, i64 %599
  %601 = load float, float* %600, align 4, !tbaa !5
  %602 = add i32 %571, %596
  %603 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %602
  %604 = load float, float addrspace(3)* %603, align 4, !tbaa !5
  %605 = fmul contract float %601, %604
  %606 = fadd contract float %597, %605
  %607 = add i32 %596, 1
  %608 = sub nsw i32 %6, %607
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float* %153, i64 %609
  %611 = load float, float* %610, align 4, !tbaa !5
  %612 = add i32 %571, %607
  %613 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %612
  %614 = load float, float addrspace(3)* %613, align 4, !tbaa !5
  %615 = fmul contract float %611, %614
  %616 = fadd contract float %606, %615
  %617 = add i32 %596, 2
  %618 = sub nsw i32 %6, %617
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds float, float* %153, i64 %619
  %621 = load float, float* %620, align 4, !tbaa !5
  %622 = add i32 %571, %617
  %623 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %622
  %624 = load float, float addrspace(3)* %623, align 4, !tbaa !5
  %625 = fmul contract float %621, %624
  %626 = fadd contract float %616, %625
  %627 = add i32 %596, 3
  %628 = sub nsw i32 %6, %627
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds float, float* %153, i64 %629
  %631 = load float, float* %630, align 4, !tbaa !5
  %632 = add i32 %571, %627
  %633 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %632
  %634 = load float, float addrspace(3)* %633, align 4, !tbaa !5
  %635 = fmul contract float %631, %634
  %636 = fadd contract float %626, %635
  %637 = add i32 %596, 4
  %638 = sub nsw i32 %6, %637
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds float, float* %153, i64 %639
  %641 = load float, float* %640, align 4, !tbaa !5
  %642 = add i32 %571, %637
  %643 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %642
  %644 = load float, float addrspace(3)* %643, align 4, !tbaa !5
  %645 = fmul contract float %641, %644
  %646 = fadd contract float %636, %645
  %647 = add i32 %596, 5
  %648 = sub nsw i32 %6, %647
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds float, float* %153, i64 %649
  %651 = load float, float* %650, align 4, !tbaa !5
  %652 = add i32 %571, %647
  %653 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %652
  %654 = load float, float addrspace(3)* %653, align 4, !tbaa !5
  %655 = fmul contract float %651, %654
  %656 = fadd contract float %646, %655
  %657 = add i32 %596, 6
  %658 = sub nsw i32 %6, %657
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds float, float* %153, i64 %659
  %661 = load float, float* %660, align 4, !tbaa !5
  %662 = add i32 %571, %657
  %663 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %662
  %664 = load float, float addrspace(3)* %663, align 4, !tbaa !5
  %665 = fmul contract float %661, %664
  %666 = fadd contract float %656, %665
  %667 = add i32 %596, 7
  %668 = sub nsw i32 %6, %667
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds float, float* %153, i64 %669
  %671 = load float, float* %670, align 4, !tbaa !5
  %672 = add i32 %571, %667
  %673 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %672
  %674 = load float, float addrspace(3)* %673, align 4, !tbaa !5
  %675 = fmul contract float %671, %674
  %676 = fadd contract float %666, %675
  %677 = add i32 %596, 8
  %678 = icmp eq i32 %677, %158
  br i1 %678, label %679, label %595, !llvm.loop !17

679:                                              ; preds = %595, %590, %569
  %680 = phi float [ 0.000000e+00, %569 ], [ %593, %590 ], [ %676, %595 ]
  %681 = mul nsw i32 %5, 48
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds float, float addrspace(1)* %30, i64 %682
  store float %680, float addrspace(1)* %683, align 4, !tbaa !5
  br label %684

684:                                              ; preds = %566, %679, %8
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
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14, !11}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !14, !11}
