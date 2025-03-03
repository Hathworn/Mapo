; ModuleID = '../data/hip_kernels/15524/17/main.cu'
source_filename = "../data/hip_kernels/15524/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11dwt_per_Y_EPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 3
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 7
  %15 = shl i32 %5, 4
  %16 = sub i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = shl i32 %13, 6
  %20 = add i32 %19, %17
  %21 = icmp slt i32 %12, %2
  br i1 %21, label %22, label %889

22:                                               ; preds = %8
  %23 = mul nsw i32 %18, %2
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = mul nsw i32 %20, %2
  %28 = add nsw i32 %27, %12
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %6, i64 %29
  %31 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %32 = icmp sgt i32 %5, 0
  %33 = shl i32 %5, 1
  %34 = add i32 %33, 8
  br i1 %32, label %35, label %63

35:                                               ; preds = %22
  %36 = shl nuw nsw i32 %11, 4
  %37 = mul i32 %36, %34
  %38 = add i32 %37, %17
  %39 = and i32 %5, 3
  %40 = icmp ult i32 %5, 4
  br i1 %40, label %43, label %41

41:                                               ; preds = %35
  %42 = and i32 %5, -4
  br label %91

43:                                               ; preds = %91, %35
  %44 = phi i32 [ 0, %35 ], [ %141, %91 ]
  %45 = icmp eq i32 %39, 0
  br i1 %45, label %63, label %46

46:                                               ; preds = %43, %46
  %47 = phi i32 [ %60, %46 ], [ %44, %43 ]
  %48 = phi i32 [ %61, %46 ], [ 0, %43 ]
  %49 = shl nsw i32 %47, 4
  %50 = add nsw i32 %49, %18
  %51 = icmp slt i32 %50, 0
  %52 = select i1 %51, i32 %1, i32 0
  %53 = add i32 %52, %49
  %54 = mul i32 %53, %2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %26, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = add i32 %38, %49
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %58
  store float %57, float addrspace(3)* %59, align 4, !tbaa !5
  %60 = add nuw nsw i32 %47, 1
  %61 = add nuw nsw i32 %48, 1
  %62 = icmp eq i32 %61, %39
  br i1 %62, label %63, label %46, !llvm.loop !10

63:                                               ; preds = %46, %43, %22
  %64 = icmp sgt i32 %34, %5
  %65 = mul i32 %34, %11
  %66 = shl i32 %65, 4
  br i1 %64, label %67, label %144

67:                                               ; preds = %63
  %68 = add i32 %66, %17
  %69 = and i32 %5, 7
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %88, label %71

71:                                               ; preds = %67, %71
  %72 = phi i32 [ %85, %71 ], [ %5, %67 ]
  %73 = phi i32 [ %86, %71 ], [ 0, %67 ]
  %74 = shl nsw i32 %72, 4
  %75 = add nsw i32 %74, %18
  %76 = icmp slt i32 %75, %1
  %77 = select i1 %76, i32 0, i32 %1
  %78 = sub i32 %74, %77
  %79 = mul i32 %78, %2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %26, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = add i32 %68, %74
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %83
  store float %82, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = add nsw i32 %72, 1
  %86 = add nuw nsw i32 %73, 1
  %87 = icmp eq i32 %86, %69
  br i1 %87, label %88, label %71, !llvm.loop !12

88:                                               ; preds = %71, %67
  %89 = phi i32 [ %5, %67 ], [ %85, %71 ]
  %90 = icmp ugt i32 %5, -8
  br i1 %90, label %144, label %154

91:                                               ; preds = %91, %41
  %92 = phi i32 [ 0, %41 ], [ %141, %91 ]
  %93 = phi i32 [ 0, %41 ], [ %142, %91 ]
  %94 = shl nsw i32 %92, 4
  %95 = add nsw i32 %94, %18
  %96 = icmp slt i32 %95, 0
  %97 = select i1 %96, i32 %1, i32 0
  %98 = add i32 %97, %94
  %99 = mul i32 %98, %2
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %26, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = add i32 %38, %94
  %104 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %103
  store float %102, float addrspace(3)* %104, align 4, !tbaa !5
  %105 = shl i32 %92, 4
  %106 = or i32 %105, 16
  %107 = add nsw i32 %106, %18
  %108 = icmp slt i32 %107, 0
  %109 = select i1 %108, i32 %1, i32 0
  %110 = add i32 %109, %106
  %111 = mul i32 %110, %2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %26, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = add i32 %38, %106
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %115
  store float %114, float addrspace(3)* %116, align 4, !tbaa !5
  %117 = shl i32 %92, 4
  %118 = or i32 %117, 32
  %119 = add nsw i32 %118, %18
  %120 = icmp slt i32 %119, 0
  %121 = select i1 %120, i32 %1, i32 0
  %122 = add i32 %121, %118
  %123 = mul i32 %122, %2
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %26, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = add i32 %38, %118
  %128 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %127
  store float %126, float addrspace(3)* %128, align 4, !tbaa !5
  %129 = shl i32 %92, 4
  %130 = or i32 %129, 48
  %131 = add nsw i32 %130, %18
  %132 = icmp slt i32 %131, 0
  %133 = select i1 %132, i32 %1, i32 0
  %134 = add i32 %133, %130
  %135 = mul i32 %134, %2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %26, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = add i32 %38, %130
  %140 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %139
  store float %138, float addrspace(3)* %140, align 4, !tbaa !5
  %141 = add nuw nsw i32 %92, 4
  %142 = add i32 %93, 4
  %143 = icmp eq i32 %142, %42
  br i1 %143, label %43, label %91, !llvm.loop !13

144:                                              ; preds = %154, %88, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %145 = sdiv i32 %4, 2
  %146 = icmp sgt i32 %4, 0
  %147 = load float*, float* addrspace(4)* @c_lpd, align 8
  %148 = shl nuw nsw i32 %17, 1
  %149 = add nsw i32 %145, %148
  %150 = add i32 %149, %15
  %151 = add i32 %150, %66
  %152 = load float*, float* addrspace(4)* @c_hpd, align 8
  %153 = icmp slt i32 %20, %3
  br i1 %153, label %253, label %400

154:                                              ; preds = %88, %154
  %155 = phi i32 [ %251, %154 ], [ %89, %88 ]
  %156 = shl nsw i32 %155, 4
  %157 = add nsw i32 %156, %18
  %158 = icmp slt i32 %157, %1
  %159 = select i1 %158, i32 0, i32 %1
  %160 = sub i32 %156, %159
  %161 = mul i32 %160, %2
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %26, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !5, !amdgpu.noclobber !9
  %165 = add i32 %68, %156
  %166 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %165
  store float %164, float addrspace(3)* %166, align 4, !tbaa !5
  %167 = shl i32 %155, 4
  %168 = add i32 %167, 16
  %169 = add nsw i32 %168, %18
  %170 = icmp slt i32 %169, %1
  %171 = select i1 %170, i32 0, i32 %1
  %172 = sub i32 %168, %171
  %173 = mul i32 %172, %2
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %26, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5, !amdgpu.noclobber !9
  %177 = add i32 %68, %168
  %178 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %177
  store float %176, float addrspace(3)* %178, align 4, !tbaa !5
  %179 = shl i32 %155, 4
  %180 = add i32 %179, 32
  %181 = add nsw i32 %180, %18
  %182 = icmp slt i32 %181, %1
  %183 = select i1 %182, i32 0, i32 %1
  %184 = sub i32 %180, %183
  %185 = mul i32 %184, %2
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %26, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !5, !amdgpu.noclobber !9
  %189 = add i32 %68, %180
  %190 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %189
  store float %188, float addrspace(3)* %190, align 4, !tbaa !5
  %191 = shl i32 %155, 4
  %192 = add i32 %191, 48
  %193 = add nsw i32 %192, %18
  %194 = icmp slt i32 %193, %1
  %195 = select i1 %194, i32 0, i32 %1
  %196 = sub i32 %192, %195
  %197 = mul i32 %196, %2
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %26, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !5, !amdgpu.noclobber !9
  %201 = add i32 %68, %192
  %202 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %201
  store float %200, float addrspace(3)* %202, align 4, !tbaa !5
  %203 = shl i32 %155, 4
  %204 = add i32 %203, 64
  %205 = add nsw i32 %204, %18
  %206 = icmp slt i32 %205, %1
  %207 = select i1 %206, i32 0, i32 %1
  %208 = sub i32 %204, %207
  %209 = mul i32 %208, %2
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %26, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !5, !amdgpu.noclobber !9
  %213 = add i32 %68, %204
  %214 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %213
  store float %212, float addrspace(3)* %214, align 4, !tbaa !5
  %215 = shl i32 %155, 4
  %216 = add i32 %215, 80
  %217 = add nsw i32 %216, %18
  %218 = icmp slt i32 %217, %1
  %219 = select i1 %218, i32 0, i32 %1
  %220 = sub i32 %216, %219
  %221 = mul i32 %220, %2
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %26, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !5, !amdgpu.noclobber !9
  %225 = add i32 %68, %216
  %226 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %225
  store float %224, float addrspace(3)* %226, align 4, !tbaa !5
  %227 = shl i32 %155, 4
  %228 = add i32 %227, 96
  %229 = add nsw i32 %228, %18
  %230 = icmp slt i32 %229, %1
  %231 = select i1 %230, i32 0, i32 %1
  %232 = sub i32 %228, %231
  %233 = mul i32 %232, %2
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %26, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !5, !amdgpu.noclobber !9
  %237 = add i32 %68, %228
  %238 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %237
  store float %236, float addrspace(3)* %238, align 4, !tbaa !5
  %239 = shl i32 %155, 4
  %240 = add i32 %239, 112
  %241 = add nsw i32 %240, %18
  %242 = icmp slt i32 %241, %1
  %243 = select i1 %242, i32 0, i32 %1
  %244 = sub i32 %240, %243
  %245 = mul i32 %244, %2
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %26, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !5, !amdgpu.noclobber !9
  %249 = add i32 %68, %240
  %250 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %249
  store float %248, float addrspace(3)* %250, align 4, !tbaa !5
  %251 = add nsw i32 %155, 8
  %252 = icmp eq i32 %155, %33
  br i1 %252, label %144, label %154, !llvm.loop !15

253:                                              ; preds = %144
  br i1 %146, label %254, label %286

254:                                              ; preds = %253
  %255 = and i32 %4, 7
  %256 = icmp ult i32 %4, 8
  br i1 %256, label %259, label %257

257:                                              ; preds = %254
  %258 = and i32 %4, -8
  br label %289

259:                                              ; preds = %289, %254
  %260 = phi float [ undef, %254 ], [ %392, %289 ]
  %261 = phi float [ undef, %254 ], [ %396, %289 ]
  %262 = phi i32 [ 0, %254 ], [ %397, %289 ]
  %263 = phi float [ 0.000000e+00, %254 ], [ %396, %289 ]
  %264 = phi float [ 0.000000e+00, %254 ], [ %392, %289 ]
  %265 = icmp eq i32 %255, 0
  br i1 %265, label %286, label %266

266:                                              ; preds = %259, %266
  %267 = phi i32 [ %283, %266 ], [ %262, %259 ]
  %268 = phi float [ %282, %266 ], [ %263, %259 ]
  %269 = phi float [ %278, %266 ], [ %264, %259 ]
  %270 = phi i32 [ %284, %266 ], [ 0, %259 ]
  %271 = zext i32 %267 to i64
  %272 = getelementptr inbounds float, float* %147, i64 %271
  %273 = load float, float* %272, align 4, !tbaa !5
  %274 = sub i32 %151, %267
  %275 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %274
  %276 = load float, float addrspace(3)* %275, align 4, !tbaa !5
  %277 = fmul contract float %273, %276
  %278 = fadd contract float %269, %277
  %279 = getelementptr inbounds float, float* %152, i64 %271
  %280 = load float, float* %279, align 4, !tbaa !5
  %281 = fmul contract float %276, %280
  %282 = fadd contract float %268, %281
  %283 = add nuw nsw i32 %267, 1
  %284 = add i32 %270, 1
  %285 = icmp eq i32 %284, %255
  br i1 %285, label %286, label %266, !llvm.loop !16

286:                                              ; preds = %259, %266, %253
  %287 = phi float [ 0.000000e+00, %253 ], [ %260, %259 ], [ %278, %266 ]
  %288 = phi float [ 0.000000e+00, %253 ], [ %261, %259 ], [ %282, %266 ]
  store float %287, float addrspace(1)* %30, align 4, !tbaa !5
  store float %288, float addrspace(1)* %31, align 4, !tbaa !5
  br label %400

289:                                              ; preds = %289, %257
  %290 = phi i32 [ 0, %257 ], [ %397, %289 ]
  %291 = phi float [ 0.000000e+00, %257 ], [ %396, %289 ]
  %292 = phi float [ 0.000000e+00, %257 ], [ %392, %289 ]
  %293 = phi i32 [ 0, %257 ], [ %398, %289 ]
  %294 = zext i32 %290 to i64
  %295 = getelementptr inbounds float, float* %147, i64 %294
  %296 = load float, float* %295, align 4, !tbaa !5
  %297 = sub i32 %151, %290
  %298 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %297
  %299 = load float, float addrspace(3)* %298, align 4, !tbaa !5
  %300 = fmul contract float %296, %299
  %301 = fadd contract float %292, %300
  %302 = getelementptr inbounds float, float* %152, i64 %294
  %303 = load float, float* %302, align 4, !tbaa !5
  %304 = fmul contract float %299, %303
  %305 = fadd contract float %291, %304
  %306 = or i32 %290, 1
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds float, float* %147, i64 %307
  %309 = load float, float* %308, align 4, !tbaa !5
  %310 = sub i32 %151, %306
  %311 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %310
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !5
  %313 = fmul contract float %309, %312
  %314 = fadd contract float %301, %313
  %315 = getelementptr inbounds float, float* %152, i64 %307
  %316 = load float, float* %315, align 4, !tbaa !5
  %317 = fmul contract float %312, %316
  %318 = fadd contract float %305, %317
  %319 = or i32 %290, 2
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, float* %147, i64 %320
  %322 = load float, float* %321, align 4, !tbaa !5
  %323 = sub i32 %151, %319
  %324 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %323
  %325 = load float, float addrspace(3)* %324, align 4, !tbaa !5
  %326 = fmul contract float %322, %325
  %327 = fadd contract float %314, %326
  %328 = getelementptr inbounds float, float* %152, i64 %320
  %329 = load float, float* %328, align 4, !tbaa !5
  %330 = fmul contract float %325, %329
  %331 = fadd contract float %318, %330
  %332 = or i32 %290, 3
  %333 = zext i32 %332 to i64
  %334 = getelementptr inbounds float, float* %147, i64 %333
  %335 = load float, float* %334, align 4, !tbaa !5
  %336 = sub i32 %151, %332
  %337 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %336
  %338 = load float, float addrspace(3)* %337, align 4, !tbaa !5
  %339 = fmul contract float %335, %338
  %340 = fadd contract float %327, %339
  %341 = getelementptr inbounds float, float* %152, i64 %333
  %342 = load float, float* %341, align 4, !tbaa !5
  %343 = fmul contract float %338, %342
  %344 = fadd contract float %331, %343
  %345 = or i32 %290, 4
  %346 = zext i32 %345 to i64
  %347 = getelementptr inbounds float, float* %147, i64 %346
  %348 = load float, float* %347, align 4, !tbaa !5
  %349 = sub i32 %151, %345
  %350 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %349
  %351 = load float, float addrspace(3)* %350, align 4, !tbaa !5
  %352 = fmul contract float %348, %351
  %353 = fadd contract float %340, %352
  %354 = getelementptr inbounds float, float* %152, i64 %346
  %355 = load float, float* %354, align 4, !tbaa !5
  %356 = fmul contract float %351, %355
  %357 = fadd contract float %344, %356
  %358 = or i32 %290, 5
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds float, float* %147, i64 %359
  %361 = load float, float* %360, align 4, !tbaa !5
  %362 = sub i32 %151, %358
  %363 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %362
  %364 = load float, float addrspace(3)* %363, align 4, !tbaa !5
  %365 = fmul contract float %361, %364
  %366 = fadd contract float %353, %365
  %367 = getelementptr inbounds float, float* %152, i64 %359
  %368 = load float, float* %367, align 4, !tbaa !5
  %369 = fmul contract float %364, %368
  %370 = fadd contract float %357, %369
  %371 = or i32 %290, 6
  %372 = zext i32 %371 to i64
  %373 = getelementptr inbounds float, float* %147, i64 %372
  %374 = load float, float* %373, align 4, !tbaa !5
  %375 = sub i32 %151, %371
  %376 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %375
  %377 = load float, float addrspace(3)* %376, align 4, !tbaa !5
  %378 = fmul contract float %374, %377
  %379 = fadd contract float %366, %378
  %380 = getelementptr inbounds float, float* %152, i64 %372
  %381 = load float, float* %380, align 4, !tbaa !5
  %382 = fmul contract float %377, %381
  %383 = fadd contract float %370, %382
  %384 = or i32 %290, 7
  %385 = zext i32 %384 to i64
  %386 = getelementptr inbounds float, float* %147, i64 %385
  %387 = load float, float* %386, align 4, !tbaa !5
  %388 = sub i32 %151, %384
  %389 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %388
  %390 = load float, float addrspace(3)* %389, align 4, !tbaa !5
  %391 = fmul contract float %387, %390
  %392 = fadd contract float %379, %391
  %393 = getelementptr inbounds float, float* %152, i64 %385
  %394 = load float, float* %393, align 4, !tbaa !5
  %395 = fmul contract float %390, %394
  %396 = fadd contract float %383, %395
  %397 = add nuw nsw i32 %290, 8
  %398 = add i32 %293, 8
  %399 = icmp eq i32 %398, %258
  br i1 %399, label %259, label %289, !llvm.loop !17

400:                                              ; preds = %144, %286
  %401 = add nsw i32 %20, 16
  %402 = icmp slt i32 %401, %3
  br i1 %402, label %403, label %563

403:                                              ; preds = %400
  br i1 %146, label %404, label %556

404:                                              ; preds = %403
  %405 = and i32 %4, 7
  %406 = icmp ult i32 %4, 8
  br i1 %406, label %528, label %407

407:                                              ; preds = %404
  %408 = and i32 %4, -8
  br label %409

409:                                              ; preds = %409, %407
  %410 = phi i32 [ 0, %407 ], [ %525, %409 ]
  %411 = phi float [ 0.000000e+00, %407 ], [ %524, %409 ]
  %412 = phi float [ 0.000000e+00, %407 ], [ %520, %409 ]
  %413 = phi i32 [ 0, %407 ], [ %526, %409 ]
  %414 = zext i32 %410 to i64
  %415 = getelementptr inbounds float, float* %147, i64 %414
  %416 = load float, float* %415, align 4, !tbaa !5
  %417 = sub i32 %151, %410
  %418 = add i32 %417, 32
  %419 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %418
  %420 = load float, float addrspace(3)* %419, align 4, !tbaa !5
  %421 = fmul contract float %416, %420
  %422 = fadd contract float %412, %421
  %423 = getelementptr inbounds float, float* %152, i64 %414
  %424 = load float, float* %423, align 4, !tbaa !5
  %425 = fmul contract float %420, %424
  %426 = fadd contract float %411, %425
  %427 = or i32 %410, 1
  %428 = zext i32 %427 to i64
  %429 = getelementptr inbounds float, float* %147, i64 %428
  %430 = load float, float* %429, align 4, !tbaa !5
  %431 = sub i32 %151, %427
  %432 = add i32 %431, 32
  %433 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %432
  %434 = load float, float addrspace(3)* %433, align 4, !tbaa !5
  %435 = fmul contract float %430, %434
  %436 = fadd contract float %422, %435
  %437 = getelementptr inbounds float, float* %152, i64 %428
  %438 = load float, float* %437, align 4, !tbaa !5
  %439 = fmul contract float %434, %438
  %440 = fadd contract float %426, %439
  %441 = or i32 %410, 2
  %442 = zext i32 %441 to i64
  %443 = getelementptr inbounds float, float* %147, i64 %442
  %444 = load float, float* %443, align 4, !tbaa !5
  %445 = sub i32 %151, %441
  %446 = add i32 %445, 32
  %447 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %446
  %448 = load float, float addrspace(3)* %447, align 4, !tbaa !5
  %449 = fmul contract float %444, %448
  %450 = fadd contract float %436, %449
  %451 = getelementptr inbounds float, float* %152, i64 %442
  %452 = load float, float* %451, align 4, !tbaa !5
  %453 = fmul contract float %448, %452
  %454 = fadd contract float %440, %453
  %455 = or i32 %410, 3
  %456 = zext i32 %455 to i64
  %457 = getelementptr inbounds float, float* %147, i64 %456
  %458 = load float, float* %457, align 4, !tbaa !5
  %459 = sub i32 %151, %455
  %460 = add i32 %459, 32
  %461 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %460
  %462 = load float, float addrspace(3)* %461, align 4, !tbaa !5
  %463 = fmul contract float %458, %462
  %464 = fadd contract float %450, %463
  %465 = getelementptr inbounds float, float* %152, i64 %456
  %466 = load float, float* %465, align 4, !tbaa !5
  %467 = fmul contract float %462, %466
  %468 = fadd contract float %454, %467
  %469 = or i32 %410, 4
  %470 = zext i32 %469 to i64
  %471 = getelementptr inbounds float, float* %147, i64 %470
  %472 = load float, float* %471, align 4, !tbaa !5
  %473 = sub i32 %151, %469
  %474 = add i32 %473, 32
  %475 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %474
  %476 = load float, float addrspace(3)* %475, align 4, !tbaa !5
  %477 = fmul contract float %472, %476
  %478 = fadd contract float %464, %477
  %479 = getelementptr inbounds float, float* %152, i64 %470
  %480 = load float, float* %479, align 4, !tbaa !5
  %481 = fmul contract float %476, %480
  %482 = fadd contract float %468, %481
  %483 = or i32 %410, 5
  %484 = zext i32 %483 to i64
  %485 = getelementptr inbounds float, float* %147, i64 %484
  %486 = load float, float* %485, align 4, !tbaa !5
  %487 = sub i32 %151, %483
  %488 = add i32 %487, 32
  %489 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %488
  %490 = load float, float addrspace(3)* %489, align 4, !tbaa !5
  %491 = fmul contract float %486, %490
  %492 = fadd contract float %478, %491
  %493 = getelementptr inbounds float, float* %152, i64 %484
  %494 = load float, float* %493, align 4, !tbaa !5
  %495 = fmul contract float %490, %494
  %496 = fadd contract float %482, %495
  %497 = or i32 %410, 6
  %498 = zext i32 %497 to i64
  %499 = getelementptr inbounds float, float* %147, i64 %498
  %500 = load float, float* %499, align 4, !tbaa !5
  %501 = sub i32 %151, %497
  %502 = add i32 %501, 32
  %503 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %502
  %504 = load float, float addrspace(3)* %503, align 4, !tbaa !5
  %505 = fmul contract float %500, %504
  %506 = fadd contract float %492, %505
  %507 = getelementptr inbounds float, float* %152, i64 %498
  %508 = load float, float* %507, align 4, !tbaa !5
  %509 = fmul contract float %504, %508
  %510 = fadd contract float %496, %509
  %511 = or i32 %410, 7
  %512 = zext i32 %511 to i64
  %513 = getelementptr inbounds float, float* %147, i64 %512
  %514 = load float, float* %513, align 4, !tbaa !5
  %515 = sub i32 %151, %511
  %516 = add i32 %515, 32
  %517 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %516
  %518 = load float, float addrspace(3)* %517, align 4, !tbaa !5
  %519 = fmul contract float %514, %518
  %520 = fadd contract float %506, %519
  %521 = getelementptr inbounds float, float* %152, i64 %512
  %522 = load float, float* %521, align 4, !tbaa !5
  %523 = fmul contract float %518, %522
  %524 = fadd contract float %510, %523
  %525 = add nuw nsw i32 %410, 8
  %526 = add i32 %413, 8
  %527 = icmp eq i32 %526, %408
  br i1 %527, label %528, label %409, !llvm.loop !17

528:                                              ; preds = %409, %404
  %529 = phi float [ undef, %404 ], [ %520, %409 ]
  %530 = phi float [ undef, %404 ], [ %524, %409 ]
  %531 = phi i32 [ 0, %404 ], [ %525, %409 ]
  %532 = phi float [ 0.000000e+00, %404 ], [ %524, %409 ]
  %533 = phi float [ 0.000000e+00, %404 ], [ %520, %409 ]
  %534 = icmp eq i32 %405, 0
  br i1 %534, label %556, label %535

535:                                              ; preds = %528, %535
  %536 = phi i32 [ %553, %535 ], [ %531, %528 ]
  %537 = phi float [ %552, %535 ], [ %532, %528 ]
  %538 = phi float [ %548, %535 ], [ %533, %528 ]
  %539 = phi i32 [ %554, %535 ], [ 0, %528 ]
  %540 = zext i32 %536 to i64
  %541 = getelementptr inbounds float, float* %147, i64 %540
  %542 = load float, float* %541, align 4, !tbaa !5
  %543 = sub i32 %151, %536
  %544 = add i32 %543, 32
  %545 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %544
  %546 = load float, float addrspace(3)* %545, align 4, !tbaa !5
  %547 = fmul contract float %542, %546
  %548 = fadd contract float %538, %547
  %549 = getelementptr inbounds float, float* %152, i64 %540
  %550 = load float, float* %549, align 4, !tbaa !5
  %551 = fmul contract float %546, %550
  %552 = fadd contract float %537, %551
  %553 = add nuw nsw i32 %536, 1
  %554 = add i32 %539, 1
  %555 = icmp eq i32 %554, %405
  br i1 %555, label %556, label %535, !llvm.loop !18

556:                                              ; preds = %528, %535, %403
  %557 = phi float [ 0.000000e+00, %403 ], [ %529, %528 ], [ %548, %535 ]
  %558 = phi float [ 0.000000e+00, %403 ], [ %530, %528 ], [ %552, %535 ]
  %559 = shl nsw i32 %2, 4
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds float, float addrspace(1)* %30, i64 %560
  store float %557, float addrspace(1)* %561, align 4, !tbaa !5
  %562 = getelementptr inbounds float, float addrspace(1)* %31, i64 %560
  store float %558, float addrspace(1)* %562, align 4, !tbaa !5
  br label %563

563:                                              ; preds = %556, %400
  %564 = add nsw i32 %20, 32
  %565 = icmp slt i32 %564, %3
  br i1 %565, label %566, label %726

566:                                              ; preds = %563
  br i1 %146, label %567, label %719

567:                                              ; preds = %566
  %568 = and i32 %4, 7
  %569 = icmp ult i32 %4, 8
  br i1 %569, label %691, label %570

570:                                              ; preds = %567
  %571 = and i32 %4, -8
  br label %572

572:                                              ; preds = %572, %570
  %573 = phi i32 [ 0, %570 ], [ %688, %572 ]
  %574 = phi float [ 0.000000e+00, %570 ], [ %687, %572 ]
  %575 = phi float [ 0.000000e+00, %570 ], [ %683, %572 ]
  %576 = phi i32 [ 0, %570 ], [ %689, %572 ]
  %577 = zext i32 %573 to i64
  %578 = getelementptr inbounds float, float* %147, i64 %577
  %579 = load float, float* %578, align 4, !tbaa !5
  %580 = sub i32 %151, %573
  %581 = add i32 %580, 64
  %582 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %581
  %583 = load float, float addrspace(3)* %582, align 4, !tbaa !5
  %584 = fmul contract float %579, %583
  %585 = fadd contract float %575, %584
  %586 = getelementptr inbounds float, float* %152, i64 %577
  %587 = load float, float* %586, align 4, !tbaa !5
  %588 = fmul contract float %583, %587
  %589 = fadd contract float %574, %588
  %590 = or i32 %573, 1
  %591 = zext i32 %590 to i64
  %592 = getelementptr inbounds float, float* %147, i64 %591
  %593 = load float, float* %592, align 4, !tbaa !5
  %594 = sub i32 %151, %590
  %595 = add i32 %594, 64
  %596 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %595
  %597 = load float, float addrspace(3)* %596, align 4, !tbaa !5
  %598 = fmul contract float %593, %597
  %599 = fadd contract float %585, %598
  %600 = getelementptr inbounds float, float* %152, i64 %591
  %601 = load float, float* %600, align 4, !tbaa !5
  %602 = fmul contract float %597, %601
  %603 = fadd contract float %589, %602
  %604 = or i32 %573, 2
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds float, float* %147, i64 %605
  %607 = load float, float* %606, align 4, !tbaa !5
  %608 = sub i32 %151, %604
  %609 = add i32 %608, 64
  %610 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %609
  %611 = load float, float addrspace(3)* %610, align 4, !tbaa !5
  %612 = fmul contract float %607, %611
  %613 = fadd contract float %599, %612
  %614 = getelementptr inbounds float, float* %152, i64 %605
  %615 = load float, float* %614, align 4, !tbaa !5
  %616 = fmul contract float %611, %615
  %617 = fadd contract float %603, %616
  %618 = or i32 %573, 3
  %619 = zext i32 %618 to i64
  %620 = getelementptr inbounds float, float* %147, i64 %619
  %621 = load float, float* %620, align 4, !tbaa !5
  %622 = sub i32 %151, %618
  %623 = add i32 %622, 64
  %624 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %623
  %625 = load float, float addrspace(3)* %624, align 4, !tbaa !5
  %626 = fmul contract float %621, %625
  %627 = fadd contract float %613, %626
  %628 = getelementptr inbounds float, float* %152, i64 %619
  %629 = load float, float* %628, align 4, !tbaa !5
  %630 = fmul contract float %625, %629
  %631 = fadd contract float %617, %630
  %632 = or i32 %573, 4
  %633 = zext i32 %632 to i64
  %634 = getelementptr inbounds float, float* %147, i64 %633
  %635 = load float, float* %634, align 4, !tbaa !5
  %636 = sub i32 %151, %632
  %637 = add i32 %636, 64
  %638 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %637
  %639 = load float, float addrspace(3)* %638, align 4, !tbaa !5
  %640 = fmul contract float %635, %639
  %641 = fadd contract float %627, %640
  %642 = getelementptr inbounds float, float* %152, i64 %633
  %643 = load float, float* %642, align 4, !tbaa !5
  %644 = fmul contract float %639, %643
  %645 = fadd contract float %631, %644
  %646 = or i32 %573, 5
  %647 = zext i32 %646 to i64
  %648 = getelementptr inbounds float, float* %147, i64 %647
  %649 = load float, float* %648, align 4, !tbaa !5
  %650 = sub i32 %151, %646
  %651 = add i32 %650, 64
  %652 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %651
  %653 = load float, float addrspace(3)* %652, align 4, !tbaa !5
  %654 = fmul contract float %649, %653
  %655 = fadd contract float %641, %654
  %656 = getelementptr inbounds float, float* %152, i64 %647
  %657 = load float, float* %656, align 4, !tbaa !5
  %658 = fmul contract float %653, %657
  %659 = fadd contract float %645, %658
  %660 = or i32 %573, 6
  %661 = zext i32 %660 to i64
  %662 = getelementptr inbounds float, float* %147, i64 %661
  %663 = load float, float* %662, align 4, !tbaa !5
  %664 = sub i32 %151, %660
  %665 = add i32 %664, 64
  %666 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %665
  %667 = load float, float addrspace(3)* %666, align 4, !tbaa !5
  %668 = fmul contract float %663, %667
  %669 = fadd contract float %655, %668
  %670 = getelementptr inbounds float, float* %152, i64 %661
  %671 = load float, float* %670, align 4, !tbaa !5
  %672 = fmul contract float %667, %671
  %673 = fadd contract float %659, %672
  %674 = or i32 %573, 7
  %675 = zext i32 %674 to i64
  %676 = getelementptr inbounds float, float* %147, i64 %675
  %677 = load float, float* %676, align 4, !tbaa !5
  %678 = sub i32 %151, %674
  %679 = add i32 %678, 64
  %680 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %679
  %681 = load float, float addrspace(3)* %680, align 4, !tbaa !5
  %682 = fmul contract float %677, %681
  %683 = fadd contract float %669, %682
  %684 = getelementptr inbounds float, float* %152, i64 %675
  %685 = load float, float* %684, align 4, !tbaa !5
  %686 = fmul contract float %681, %685
  %687 = fadd contract float %673, %686
  %688 = add nuw nsw i32 %573, 8
  %689 = add i32 %576, 8
  %690 = icmp eq i32 %689, %571
  br i1 %690, label %691, label %572, !llvm.loop !17

691:                                              ; preds = %572, %567
  %692 = phi float [ undef, %567 ], [ %683, %572 ]
  %693 = phi float [ undef, %567 ], [ %687, %572 ]
  %694 = phi i32 [ 0, %567 ], [ %688, %572 ]
  %695 = phi float [ 0.000000e+00, %567 ], [ %687, %572 ]
  %696 = phi float [ 0.000000e+00, %567 ], [ %683, %572 ]
  %697 = icmp eq i32 %568, 0
  br i1 %697, label %719, label %698

698:                                              ; preds = %691, %698
  %699 = phi i32 [ %716, %698 ], [ %694, %691 ]
  %700 = phi float [ %715, %698 ], [ %695, %691 ]
  %701 = phi float [ %711, %698 ], [ %696, %691 ]
  %702 = phi i32 [ %717, %698 ], [ 0, %691 ]
  %703 = zext i32 %699 to i64
  %704 = getelementptr inbounds float, float* %147, i64 %703
  %705 = load float, float* %704, align 4, !tbaa !5
  %706 = sub i32 %151, %699
  %707 = add i32 %706, 64
  %708 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %707
  %709 = load float, float addrspace(3)* %708, align 4, !tbaa !5
  %710 = fmul contract float %705, %709
  %711 = fadd contract float %701, %710
  %712 = getelementptr inbounds float, float* %152, i64 %703
  %713 = load float, float* %712, align 4, !tbaa !5
  %714 = fmul contract float %709, %713
  %715 = fadd contract float %700, %714
  %716 = add nuw nsw i32 %699, 1
  %717 = add i32 %702, 1
  %718 = icmp eq i32 %717, %568
  br i1 %718, label %719, label %698, !llvm.loop !19

719:                                              ; preds = %691, %698, %566
  %720 = phi float [ 0.000000e+00, %566 ], [ %692, %691 ], [ %711, %698 ]
  %721 = phi float [ 0.000000e+00, %566 ], [ %693, %691 ], [ %715, %698 ]
  %722 = shl nsw i32 %2, 5
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds float, float addrspace(1)* %30, i64 %723
  store float %720, float addrspace(1)* %724, align 4, !tbaa !5
  %725 = getelementptr inbounds float, float addrspace(1)* %31, i64 %723
  store float %721, float addrspace(1)* %725, align 4, !tbaa !5
  br label %726

726:                                              ; preds = %719, %563
  %727 = add nsw i32 %20, 48
  %728 = icmp slt i32 %727, %3
  br i1 %728, label %729, label %889

729:                                              ; preds = %726
  br i1 %146, label %730, label %882

730:                                              ; preds = %729
  %731 = and i32 %4, 7
  %732 = icmp ult i32 %4, 8
  br i1 %732, label %854, label %733

733:                                              ; preds = %730
  %734 = and i32 %4, -8
  br label %735

735:                                              ; preds = %735, %733
  %736 = phi i32 [ 0, %733 ], [ %851, %735 ]
  %737 = phi float [ 0.000000e+00, %733 ], [ %850, %735 ]
  %738 = phi float [ 0.000000e+00, %733 ], [ %846, %735 ]
  %739 = phi i32 [ 0, %733 ], [ %852, %735 ]
  %740 = zext i32 %736 to i64
  %741 = getelementptr inbounds float, float* %147, i64 %740
  %742 = load float, float* %741, align 4, !tbaa !5
  %743 = sub i32 %151, %736
  %744 = add i32 %743, 96
  %745 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %744
  %746 = load float, float addrspace(3)* %745, align 4, !tbaa !5
  %747 = fmul contract float %742, %746
  %748 = fadd contract float %738, %747
  %749 = getelementptr inbounds float, float* %152, i64 %740
  %750 = load float, float* %749, align 4, !tbaa !5
  %751 = fmul contract float %746, %750
  %752 = fadd contract float %737, %751
  %753 = or i32 %736, 1
  %754 = zext i32 %753 to i64
  %755 = getelementptr inbounds float, float* %147, i64 %754
  %756 = load float, float* %755, align 4, !tbaa !5
  %757 = sub i32 %151, %753
  %758 = add i32 %757, 96
  %759 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %758
  %760 = load float, float addrspace(3)* %759, align 4, !tbaa !5
  %761 = fmul contract float %756, %760
  %762 = fadd contract float %748, %761
  %763 = getelementptr inbounds float, float* %152, i64 %754
  %764 = load float, float* %763, align 4, !tbaa !5
  %765 = fmul contract float %760, %764
  %766 = fadd contract float %752, %765
  %767 = or i32 %736, 2
  %768 = zext i32 %767 to i64
  %769 = getelementptr inbounds float, float* %147, i64 %768
  %770 = load float, float* %769, align 4, !tbaa !5
  %771 = sub i32 %151, %767
  %772 = add i32 %771, 96
  %773 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %772
  %774 = load float, float addrspace(3)* %773, align 4, !tbaa !5
  %775 = fmul contract float %770, %774
  %776 = fadd contract float %762, %775
  %777 = getelementptr inbounds float, float* %152, i64 %768
  %778 = load float, float* %777, align 4, !tbaa !5
  %779 = fmul contract float %774, %778
  %780 = fadd contract float %766, %779
  %781 = or i32 %736, 3
  %782 = zext i32 %781 to i64
  %783 = getelementptr inbounds float, float* %147, i64 %782
  %784 = load float, float* %783, align 4, !tbaa !5
  %785 = sub i32 %151, %781
  %786 = add i32 %785, 96
  %787 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %786
  %788 = load float, float addrspace(3)* %787, align 4, !tbaa !5
  %789 = fmul contract float %784, %788
  %790 = fadd contract float %776, %789
  %791 = getelementptr inbounds float, float* %152, i64 %782
  %792 = load float, float* %791, align 4, !tbaa !5
  %793 = fmul contract float %788, %792
  %794 = fadd contract float %780, %793
  %795 = or i32 %736, 4
  %796 = zext i32 %795 to i64
  %797 = getelementptr inbounds float, float* %147, i64 %796
  %798 = load float, float* %797, align 4, !tbaa !5
  %799 = sub i32 %151, %795
  %800 = add i32 %799, 96
  %801 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %800
  %802 = load float, float addrspace(3)* %801, align 4, !tbaa !5
  %803 = fmul contract float %798, %802
  %804 = fadd contract float %790, %803
  %805 = getelementptr inbounds float, float* %152, i64 %796
  %806 = load float, float* %805, align 4, !tbaa !5
  %807 = fmul contract float %802, %806
  %808 = fadd contract float %794, %807
  %809 = or i32 %736, 5
  %810 = zext i32 %809 to i64
  %811 = getelementptr inbounds float, float* %147, i64 %810
  %812 = load float, float* %811, align 4, !tbaa !5
  %813 = sub i32 %151, %809
  %814 = add i32 %813, 96
  %815 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %814
  %816 = load float, float addrspace(3)* %815, align 4, !tbaa !5
  %817 = fmul contract float %812, %816
  %818 = fadd contract float %804, %817
  %819 = getelementptr inbounds float, float* %152, i64 %810
  %820 = load float, float* %819, align 4, !tbaa !5
  %821 = fmul contract float %816, %820
  %822 = fadd contract float %808, %821
  %823 = or i32 %736, 6
  %824 = zext i32 %823 to i64
  %825 = getelementptr inbounds float, float* %147, i64 %824
  %826 = load float, float* %825, align 4, !tbaa !5
  %827 = sub i32 %151, %823
  %828 = add i32 %827, 96
  %829 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %828
  %830 = load float, float addrspace(3)* %829, align 4, !tbaa !5
  %831 = fmul contract float %826, %830
  %832 = fadd contract float %818, %831
  %833 = getelementptr inbounds float, float* %152, i64 %824
  %834 = load float, float* %833, align 4, !tbaa !5
  %835 = fmul contract float %830, %834
  %836 = fadd contract float %822, %835
  %837 = or i32 %736, 7
  %838 = zext i32 %837 to i64
  %839 = getelementptr inbounds float, float* %147, i64 %838
  %840 = load float, float* %839, align 4, !tbaa !5
  %841 = sub i32 %151, %837
  %842 = add i32 %841, 96
  %843 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %842
  %844 = load float, float addrspace(3)* %843, align 4, !tbaa !5
  %845 = fmul contract float %840, %844
  %846 = fadd contract float %832, %845
  %847 = getelementptr inbounds float, float* %152, i64 %838
  %848 = load float, float* %847, align 4, !tbaa !5
  %849 = fmul contract float %844, %848
  %850 = fadd contract float %836, %849
  %851 = add nuw nsw i32 %736, 8
  %852 = add i32 %739, 8
  %853 = icmp eq i32 %852, %734
  br i1 %853, label %854, label %735, !llvm.loop !17

854:                                              ; preds = %735, %730
  %855 = phi float [ undef, %730 ], [ %846, %735 ]
  %856 = phi float [ undef, %730 ], [ %850, %735 ]
  %857 = phi i32 [ 0, %730 ], [ %851, %735 ]
  %858 = phi float [ 0.000000e+00, %730 ], [ %850, %735 ]
  %859 = phi float [ 0.000000e+00, %730 ], [ %846, %735 ]
  %860 = icmp eq i32 %731, 0
  br i1 %860, label %882, label %861

861:                                              ; preds = %854, %861
  %862 = phi i32 [ %879, %861 ], [ %857, %854 ]
  %863 = phi float [ %878, %861 ], [ %858, %854 ]
  %864 = phi float [ %874, %861 ], [ %859, %854 ]
  %865 = phi i32 [ %880, %861 ], [ 0, %854 ]
  %866 = zext i32 %862 to i64
  %867 = getelementptr inbounds float, float* %147, i64 %866
  %868 = load float, float* %867, align 4, !tbaa !5
  %869 = sub i32 %151, %862
  %870 = add i32 %869, 96
  %871 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %870
  %872 = load float, float addrspace(3)* %871, align 4, !tbaa !5
  %873 = fmul contract float %868, %872
  %874 = fadd contract float %864, %873
  %875 = getelementptr inbounds float, float* %152, i64 %866
  %876 = load float, float* %875, align 4, !tbaa !5
  %877 = fmul contract float %872, %876
  %878 = fadd contract float %863, %877
  %879 = add nuw nsw i32 %862, 1
  %880 = add i32 %865, 1
  %881 = icmp eq i32 %880, %731
  br i1 %881, label %882, label %861, !llvm.loop !20

882:                                              ; preds = %854, %861, %729
  %883 = phi float [ 0.000000e+00, %729 ], [ %855, %854 ], [ %874, %861 ]
  %884 = phi float [ 0.000000e+00, %729 ], [ %856, %854 ], [ %878, %861 ]
  %885 = mul nsw i32 %2, 48
  %886 = sext i32 %885 to i64
  %887 = getelementptr inbounds float, float addrspace(1)* %30, i64 %886
  store float %883, float addrspace(1)* %887, align 4, !tbaa !5
  %888 = getelementptr inbounds float, float addrspace(1)* %31, i64 %886
  store float %884, float addrspace(1)* %888, align 4, !tbaa !5
  br label %889

889:                                              ; preds = %726, %882, %8
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
