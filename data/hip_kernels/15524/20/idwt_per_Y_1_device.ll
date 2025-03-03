; ModuleID = '../data/hip_kernels/15524/20/main.cu'
source_filename = "../data/hip_kernels/15524/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpr = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpr = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpr to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpr to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12idwt_per_Y_1PfS_S_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 2
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = mul i32 %13, 3
  %15 = sub i32 %14, %7
  %16 = shl i32 %15, 5
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = sdiv i32 %6, 2
  %20 = icmp slt i32 %12, %4
  br i1 %20, label %21, label %588

21:                                               ; preds = %8
  %22 = mul nsw i32 %18, %4
  %23 = add nsw i32 %22, %12
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %27 = shl nsw i32 %18, 1
  %28 = sub nsw i32 1, %19
  %29 = add i32 %28, %27
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %30, %12
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = icmp sgt i32 %7, 0
  br i1 %34, label %35, label %71

35:                                               ; preds = %21
  %36 = shl nuw nsw i32 %7, 1
  %37 = add nsw i32 %36, 3
  %38 = shl nuw nsw i32 %11, 5
  %39 = mul i32 %38, %37
  %40 = add nuw nsw i32 %38, 128
  %41 = mul i32 %40, %37
  %42 = and i32 %7, 3
  %43 = icmp ult i32 %7, 4
  br i1 %43, label %46, label %44

44:                                               ; preds = %35
  %45 = and i32 %7, -4
  br label %81

46:                                               ; preds = %81, %35
  %47 = phi i32 [ 0, %35 ], [ %151, %81 ]
  %48 = icmp eq i32 %42, 0
  br i1 %48, label %71, label %49

49:                                               ; preds = %46, %49
  %50 = phi i32 [ %68, %49 ], [ %47, %46 ]
  %51 = phi i32 [ %69, %49 ], [ 0, %46 ]
  %52 = shl nsw i32 %50, 5
  %53 = add nsw i32 %52, %18
  %54 = icmp slt i32 %53, 0
  %55 = select i1 %54, i32 %3, i32 0
  %56 = add i32 %55, %52
  %57 = mul i32 %56, %4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %25, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = add nuw i32 %52, %17
  %62 = add i32 %61, %39
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %62
  store float %60, float addrspace(3)* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds float, float addrspace(1)* %26, i64 %58
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = add i32 %61, %41
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %66
  store float %65, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = add nuw nsw i32 %50, 1
  %69 = add nuw nsw i32 %51, 1
  %70 = icmp eq i32 %69, %42
  br i1 %70, label %71, label %49, !llvm.loop !10

71:                                               ; preds = %49, %46, %21
  %72 = shl i32 %7, 1
  %73 = add i32 %72, 3
  %74 = icmp sgt i32 %7, -3
  %75 = shl nsw i32 %7, 1
  %76 = add nsw i32 %75, 3
  %77 = shl nuw nsw i32 %11, 5
  %78 = mul i32 %77, %76
  %79 = add nuw nsw i32 %77, 128
  %80 = mul i32 %79, %76
  br i1 %74, label %167, label %154

81:                                               ; preds = %81, %44
  %82 = phi i32 [ 0, %44 ], [ %151, %81 ]
  %83 = phi i32 [ 0, %44 ], [ %152, %81 ]
  %84 = shl nsw i32 %82, 5
  %85 = add nsw i32 %84, %18
  %86 = icmp slt i32 %85, 0
  %87 = select i1 %86, i32 %3, i32 0
  %88 = add i32 %87, %84
  %89 = mul i32 %88, %4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %25, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = add nuw i32 %84, %17
  %94 = add i32 %93, %39
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %94
  store float %92, float addrspace(3)* %95, align 4, !tbaa !5
  %96 = getelementptr inbounds float, float addrspace(1)* %26, i64 %90
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = add i32 %93, %41
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %98
  store float %97, float addrspace(3)* %99, align 4, !tbaa !5
  %100 = shl i32 %82, 5
  %101 = or i32 %100, 32
  %102 = add nsw i32 %101, %18
  %103 = icmp slt i32 %102, 0
  %104 = select i1 %103, i32 %3, i32 0
  %105 = add i32 %104, %101
  %106 = mul i32 %105, %4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %25, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = add nuw i32 %101, %17
  %111 = add i32 %110, %39
  %112 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %111
  store float %109, float addrspace(3)* %112, align 4, !tbaa !5
  %113 = getelementptr inbounds float, float addrspace(1)* %26, i64 %107
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = add i32 %110, %41
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %115
  store float %114, float addrspace(3)* %116, align 4, !tbaa !5
  %117 = shl i32 %82, 5
  %118 = or i32 %117, 64
  %119 = add nsw i32 %118, %18
  %120 = icmp slt i32 %119, 0
  %121 = select i1 %120, i32 %3, i32 0
  %122 = add i32 %121, %118
  %123 = mul i32 %122, %4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %25, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = add nuw i32 %118, %17
  %128 = add i32 %127, %39
  %129 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %128
  store float %126, float addrspace(3)* %129, align 4, !tbaa !5
  %130 = getelementptr inbounds float, float addrspace(1)* %26, i64 %124
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = add i32 %127, %41
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %132
  store float %131, float addrspace(3)* %133, align 4, !tbaa !5
  %134 = shl i32 %82, 5
  %135 = or i32 %134, 96
  %136 = add nsw i32 %135, %18
  %137 = icmp slt i32 %136, 0
  %138 = select i1 %137, i32 %3, i32 0
  %139 = add i32 %138, %135
  %140 = mul i32 %139, %4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %25, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = add nuw i32 %135, %17
  %145 = add i32 %144, %39
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %145
  store float %143, float addrspace(3)* %146, align 4, !tbaa !5
  %147 = getelementptr inbounds float, float addrspace(1)* %26, i64 %141
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = add i32 %144, %41
  %150 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %149
  store float %148, float addrspace(3)* %150, align 4, !tbaa !5
  %151 = add nuw nsw i32 %82, 4
  %152 = add i32 %83, 4
  %153 = icmp eq i32 %152, %45
  br i1 %153, label %46, label %81, !llvm.loop !12

154:                                              ; preds = %167, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = shl nsw i32 %3, 1
  %156 = add nsw i32 %155, -2
  %157 = add i32 %156, %6
  %158 = icmp sgt i32 %6, 1
  %159 = load float*, float* addrspace(4)* @c_lpr, align 8
  %160 = load float*, float* addrspace(4)* @c_hpr, align 8
  %161 = add nsw i32 %19, -1
  %162 = add i32 %161, %5
  %163 = shl nsw i32 %7, 6
  %164 = add nsw i32 %163, %27
  %165 = or i32 %164, 1
  %166 = icmp slt i32 %165, %157
  br i1 %166, label %187, label %316

167:                                              ; preds = %71, %167
  %168 = phi i32 [ %185, %167 ], [ %7, %71 ]
  %169 = shl nsw i32 %168, 5
  %170 = add nsw i32 %169, %18
  %171 = icmp slt i32 %170, %3
  %172 = select i1 %171, i32 0, i32 %3
  %173 = sub i32 %169, %172
  %174 = mul i32 %173, %4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %25, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !5, !amdgpu.noclobber !9
  %178 = add i32 %169, %17
  %179 = add i32 %178, %78
  %180 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %179
  store float %177, float addrspace(3)* %180, align 4, !tbaa !5
  %181 = getelementptr inbounds float, float addrspace(1)* %26, i64 %175
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  %183 = add i32 %178, %80
  %184 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %183
  store float %182, float addrspace(3)* %184, align 4, !tbaa !5
  %185 = add nsw i32 %168, 1
  %186 = icmp slt i32 %185, %73
  br i1 %186, label %167, label %154, !llvm.loop !14

187:                                              ; preds = %154
  br i1 %158, label %188, label %233

188:                                              ; preds = %187
  %189 = shl nsw i32 %7, 5
  %190 = add i32 %189, %17
  %191 = add i32 %190, %78
  %192 = add i32 %190, %80
  %193 = and i32 %19, 1
  %194 = and i32 %6, -2
  %195 = icmp eq i32 %194, 2
  br i1 %195, label %198, label %196

196:                                              ; preds = %188
  %197 = and i32 %19, -2
  br label %239

198:                                              ; preds = %239, %188
  %199 = phi float [ undef, %188 ], [ %288, %239 ]
  %200 = phi float [ undef, %188 ], [ %298, %239 ]
  %201 = phi i32 [ 0, %188 ], [ %300, %239 ]
  %202 = phi i32 [ 0, %188 ], [ %299, %239 ]
  %203 = phi float [ 0.000000e+00, %188 ], [ %298, %239 ]
  %204 = phi float [ 0.000000e+00, %188 ], [ %288, %239 ]
  %205 = icmp eq i32 %193, 0
  br i1 %205, label %233, label %206

206:                                              ; preds = %198
  %207 = shl nuw nsw i32 %202, 1
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, float* %159, i64 %208
  %210 = load float, float* %209, align 4, !tbaa !5
  %211 = add i32 %191, %201
  %212 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %211
  %213 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %214 = fmul contract float %210, %213
  %215 = getelementptr inbounds float, float* %160, i64 %208
  %216 = load float, float* %215, align 4, !tbaa !5
  %217 = add i32 %192, %201
  %218 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %220 = fmul contract float %216, %219
  %221 = fadd contract float %214, %220
  %222 = fadd contract float %204, %221
  %223 = add nuw nsw i32 %207, 1
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds float, float* %159, i64 %224
  %226 = load float, float* %225, align 4, !tbaa !5
  %227 = fmul contract float %213, %226
  %228 = getelementptr inbounds float, float* %160, i64 %224
  %229 = load float, float* %228, align 4, !tbaa !5
  %230 = fmul contract float %219, %229
  %231 = fadd contract float %227, %230
  %232 = fadd contract float %203, %231
  br label %233

233:                                              ; preds = %206, %198, %187
  %234 = phi float [ 0.000000e+00, %187 ], [ %199, %198 ], [ %222, %206 ]
  %235 = phi float [ 0.000000e+00, %187 ], [ %200, %198 ], [ %232, %206 ]
  %236 = icmp sge i32 %164, %161
  %237 = icmp slt i32 %164, %162
  %238 = select i1 %236, i1 %237, i1 false
  br i1 %238, label %303, label %307

239:                                              ; preds = %239, %196
  %240 = phi i32 [ 0, %196 ], [ %300, %239 ]
  %241 = phi i32 [ 0, %196 ], [ %299, %239 ]
  %242 = phi float [ 0.000000e+00, %196 ], [ %298, %239 ]
  %243 = phi float [ 0.000000e+00, %196 ], [ %288, %239 ]
  %244 = phi i32 [ 0, %196 ], [ %301, %239 ]
  %245 = shl nuw nsw i32 %241, 1
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, float* %159, i64 %246
  %248 = load float, float* %247, align 4, !tbaa !5
  %249 = add i32 %191, %240
  %250 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %249
  %251 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %252 = fmul contract float %248, %251
  %253 = getelementptr inbounds float, float* %160, i64 %246
  %254 = load float, float* %253, align 4, !tbaa !5
  %255 = add i32 %192, %240
  %256 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %255
  %257 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %258 = fmul contract float %254, %257
  %259 = fadd contract float %252, %258
  %260 = fadd contract float %243, %259
  %261 = add nuw nsw i32 %245, 1
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, float* %159, i64 %262
  %264 = load float, float* %263, align 4, !tbaa !5
  %265 = fmul contract float %251, %264
  %266 = getelementptr inbounds float, float* %160, i64 %262
  %267 = load float, float* %266, align 4, !tbaa !5
  %268 = fmul contract float %257, %267
  %269 = fadd contract float %265, %268
  %270 = fadd contract float %242, %269
  %271 = xor i32 %241, -1
  %272 = shl nuw i32 %241, 1
  %273 = or i32 %272, 2
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds float, float* %159, i64 %274
  %276 = load float, float* %275, align 4, !tbaa !5
  %277 = add i32 %191, %271
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %277
  %279 = load float, float addrspace(3)* %278, align 4, !tbaa !5
  %280 = fmul contract float %276, %279
  %281 = getelementptr inbounds float, float* %160, i64 %274
  %282 = load float, float* %281, align 4, !tbaa !5
  %283 = add i32 %192, %271
  %284 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %283
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !5
  %286 = fmul contract float %282, %285
  %287 = fadd contract float %280, %286
  %288 = fadd contract float %260, %287
  %289 = add nuw nsw i32 %272, 3
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds float, float* %159, i64 %290
  %292 = load float, float* %291, align 4, !tbaa !5
  %293 = fmul contract float %279, %292
  %294 = getelementptr inbounds float, float* %160, i64 %290
  %295 = load float, float* %294, align 4, !tbaa !5
  %296 = fmul contract float %285, %295
  %297 = fadd contract float %293, %296
  %298 = fadd contract float %270, %297
  %299 = add nuw nsw i32 %241, 2
  %300 = xor i32 %241, -2
  %301 = add nuw i32 %244, 2
  %302 = icmp eq i32 %301, %197
  br i1 %302, label %198, label %239, !llvm.loop !16

303:                                              ; preds = %233
  %304 = mul nsw i32 %163, %4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %33, i64 %305
  store float %234, float addrspace(1)* %306, align 4, !tbaa !5
  br label %307

307:                                              ; preds = %303, %233
  %308 = icmp sge i32 %165, %161
  %309 = icmp slt i32 %165, %162
  %310 = select i1 %308, i1 %309, i1 false
  br i1 %310, label %311, label %316

311:                                              ; preds = %307
  %312 = add nuw nsw i32 %163, 1
  %313 = mul nsw i32 %312, %4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %33, i64 %314
  store float %235, float addrspace(1)* %315, align 4, !tbaa !5
  br label %316

316:                                              ; preds = %307, %311, %154
  %317 = add nsw i32 %7, 1
  %318 = shl nsw i32 %317, 6
  %319 = add nsw i32 %318, %27
  %320 = or i32 %319, 1
  %321 = icmp slt i32 %320, %157
  br i1 %321, label %322, label %452

322:                                              ; preds = %316
  br i1 %158, label %323, label %433

323:                                              ; preds = %322
  %324 = shl nsw i32 %317, 5
  %325 = add i32 %324, %17
  %326 = add i32 %325, %78
  %327 = add i32 %325, %80
  %328 = and i32 %19, 1
  %329 = and i32 %6, -2
  %330 = icmp eq i32 %329, 2
  br i1 %330, label %399, label %331

331:                                              ; preds = %323
  %332 = and i32 %19, -2
  br label %333

333:                                              ; preds = %333, %331
  %334 = phi i32 [ 0, %331 ], [ %394, %333 ]
  %335 = phi i32 [ 0, %331 ], [ %393, %333 ]
  %336 = phi float [ 0.000000e+00, %331 ], [ %392, %333 ]
  %337 = phi float [ 0.000000e+00, %331 ], [ %382, %333 ]
  %338 = phi i32 [ 0, %331 ], [ %395, %333 ]
  %339 = shl nuw nsw i32 %335, 1
  %340 = zext i32 %339 to i64
  %341 = getelementptr inbounds float, float* %159, i64 %340
  %342 = load float, float* %341, align 4, !tbaa !5
  %343 = add i32 %326, %334
  %344 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %343
  %345 = load float, float addrspace(3)* %344, align 4, !tbaa !5
  %346 = fmul contract float %342, %345
  %347 = getelementptr inbounds float, float* %160, i64 %340
  %348 = load float, float* %347, align 4, !tbaa !5
  %349 = add i32 %327, %334
  %350 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %349
  %351 = load float, float addrspace(3)* %350, align 4, !tbaa !5
  %352 = fmul contract float %348, %351
  %353 = fadd contract float %346, %352
  %354 = fadd contract float %337, %353
  %355 = add nuw nsw i32 %339, 1
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds float, float* %159, i64 %356
  %358 = load float, float* %357, align 4, !tbaa !5
  %359 = fmul contract float %345, %358
  %360 = getelementptr inbounds float, float* %160, i64 %356
  %361 = load float, float* %360, align 4, !tbaa !5
  %362 = fmul contract float %351, %361
  %363 = fadd contract float %359, %362
  %364 = fadd contract float %336, %363
  %365 = xor i32 %335, -1
  %366 = shl nuw i32 %335, 1
  %367 = or i32 %366, 2
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds float, float* %159, i64 %368
  %370 = load float, float* %369, align 4, !tbaa !5
  %371 = add i32 %326, %365
  %372 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %371
  %373 = load float, float addrspace(3)* %372, align 4, !tbaa !5
  %374 = fmul contract float %370, %373
  %375 = getelementptr inbounds float, float* %160, i64 %368
  %376 = load float, float* %375, align 4, !tbaa !5
  %377 = add i32 %327, %365
  %378 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %377
  %379 = load float, float addrspace(3)* %378, align 4, !tbaa !5
  %380 = fmul contract float %376, %379
  %381 = fadd contract float %374, %380
  %382 = fadd contract float %354, %381
  %383 = add nuw nsw i32 %366, 3
  %384 = zext i32 %383 to i64
  %385 = getelementptr inbounds float, float* %159, i64 %384
  %386 = load float, float* %385, align 4, !tbaa !5
  %387 = fmul contract float %373, %386
  %388 = getelementptr inbounds float, float* %160, i64 %384
  %389 = load float, float* %388, align 4, !tbaa !5
  %390 = fmul contract float %379, %389
  %391 = fadd contract float %387, %390
  %392 = fadd contract float %364, %391
  %393 = add nuw nsw i32 %335, 2
  %394 = xor i32 %335, -2
  %395 = add nuw i32 %338, 2
  %396 = icmp eq i32 %395, %332
  br i1 %396, label %397, label %333, !llvm.loop !16

397:                                              ; preds = %333
  %398 = shl nuw nsw i32 %393, 1
  br label %399

399:                                              ; preds = %397, %323
  %400 = phi float [ undef, %323 ], [ %382, %397 ]
  %401 = phi float [ undef, %323 ], [ %392, %397 ]
  %402 = phi i32 [ 0, %323 ], [ %394, %397 ]
  %403 = phi i32 [ 0, %323 ], [ %398, %397 ]
  %404 = phi float [ 0.000000e+00, %323 ], [ %392, %397 ]
  %405 = phi float [ 0.000000e+00, %323 ], [ %382, %397 ]
  %406 = icmp eq i32 %328, 0
  br i1 %406, label %433, label %407

407:                                              ; preds = %399
  %408 = zext i32 %403 to i64
  %409 = getelementptr inbounds float, float* %159, i64 %408
  %410 = load float, float* %409, align 4, !tbaa !5
  %411 = add i32 %326, %402
  %412 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %411
  %413 = load float, float addrspace(3)* %412, align 4, !tbaa !5
  %414 = fmul contract float %410, %413
  %415 = getelementptr inbounds float, float* %160, i64 %408
  %416 = load float, float* %415, align 4, !tbaa !5
  %417 = add i32 %327, %402
  %418 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %417
  %419 = load float, float addrspace(3)* %418, align 4, !tbaa !5
  %420 = fmul contract float %416, %419
  %421 = fadd contract float %414, %420
  %422 = fadd contract float %405, %421
  %423 = or i32 %403, 1
  %424 = zext i32 %423 to i64
  %425 = getelementptr inbounds float, float* %159, i64 %424
  %426 = load float, float* %425, align 4, !tbaa !5
  %427 = fmul contract float %413, %426
  %428 = getelementptr inbounds float, float* %160, i64 %424
  %429 = load float, float* %428, align 4, !tbaa !5
  %430 = fmul contract float %419, %429
  %431 = fadd contract float %427, %430
  %432 = fadd contract float %404, %431
  br label %433

433:                                              ; preds = %407, %399, %322
  %434 = phi float [ 0.000000e+00, %322 ], [ %400, %399 ], [ %422, %407 ]
  %435 = phi float [ 0.000000e+00, %322 ], [ %401, %399 ], [ %432, %407 ]
  %436 = icmp sge i32 %319, %161
  %437 = icmp slt i32 %319, %162
  %438 = select i1 %436, i1 %437, i1 false
  br i1 %438, label %439, label %443

439:                                              ; preds = %433
  %440 = mul nsw i32 %318, %4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds float, float addrspace(1)* %33, i64 %441
  store float %434, float addrspace(1)* %442, align 4, !tbaa !5
  br label %443

443:                                              ; preds = %439, %433
  %444 = icmp sge i32 %320, %161
  %445 = icmp slt i32 %320, %162
  %446 = select i1 %444, i1 %445, i1 false
  br i1 %446, label %447, label %452

447:                                              ; preds = %443
  %448 = add nuw nsw i32 %318, 1
  %449 = mul nsw i32 %448, %4
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds float, float addrspace(1)* %33, i64 %450
  store float %435, float addrspace(1)* %451, align 4, !tbaa !5
  br label %452

452:                                              ; preds = %447, %443, %316
  %453 = add nsw i32 %7, 2
  %454 = shl nsw i32 %453, 6
  %455 = add nsw i32 %454, %27
  %456 = or i32 %455, 1
  %457 = icmp slt i32 %456, %157
  br i1 %457, label %458, label %588

458:                                              ; preds = %452
  br i1 %158, label %459, label %569

459:                                              ; preds = %458
  %460 = shl nsw i32 %453, 5
  %461 = add i32 %460, %17
  %462 = add i32 %461, %78
  %463 = add i32 %461, %80
  %464 = and i32 %19, 1
  %465 = and i32 %6, -2
  %466 = icmp eq i32 %465, 2
  br i1 %466, label %535, label %467

467:                                              ; preds = %459
  %468 = and i32 %19, -2
  br label %469

469:                                              ; preds = %469, %467
  %470 = phi i32 [ 0, %467 ], [ %530, %469 ]
  %471 = phi i32 [ 0, %467 ], [ %529, %469 ]
  %472 = phi float [ 0.000000e+00, %467 ], [ %528, %469 ]
  %473 = phi float [ 0.000000e+00, %467 ], [ %518, %469 ]
  %474 = phi i32 [ 0, %467 ], [ %531, %469 ]
  %475 = shl nuw nsw i32 %471, 1
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds float, float* %159, i64 %476
  %478 = load float, float* %477, align 4, !tbaa !5
  %479 = add i32 %462, %470
  %480 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %479
  %481 = load float, float addrspace(3)* %480, align 4, !tbaa !5
  %482 = fmul contract float %478, %481
  %483 = getelementptr inbounds float, float* %160, i64 %476
  %484 = load float, float* %483, align 4, !tbaa !5
  %485 = add i32 %463, %470
  %486 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %485
  %487 = load float, float addrspace(3)* %486, align 4, !tbaa !5
  %488 = fmul contract float %484, %487
  %489 = fadd contract float %482, %488
  %490 = fadd contract float %473, %489
  %491 = add nuw nsw i32 %475, 1
  %492 = zext i32 %491 to i64
  %493 = getelementptr inbounds float, float* %159, i64 %492
  %494 = load float, float* %493, align 4, !tbaa !5
  %495 = fmul contract float %481, %494
  %496 = getelementptr inbounds float, float* %160, i64 %492
  %497 = load float, float* %496, align 4, !tbaa !5
  %498 = fmul contract float %487, %497
  %499 = fadd contract float %495, %498
  %500 = fadd contract float %472, %499
  %501 = xor i32 %471, -1
  %502 = shl nuw i32 %471, 1
  %503 = or i32 %502, 2
  %504 = zext i32 %503 to i64
  %505 = getelementptr inbounds float, float* %159, i64 %504
  %506 = load float, float* %505, align 4, !tbaa !5
  %507 = add i32 %462, %501
  %508 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %507
  %509 = load float, float addrspace(3)* %508, align 4, !tbaa !5
  %510 = fmul contract float %506, %509
  %511 = getelementptr inbounds float, float* %160, i64 %504
  %512 = load float, float* %511, align 4, !tbaa !5
  %513 = add i32 %463, %501
  %514 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %513
  %515 = load float, float addrspace(3)* %514, align 4, !tbaa !5
  %516 = fmul contract float %512, %515
  %517 = fadd contract float %510, %516
  %518 = fadd contract float %490, %517
  %519 = add nuw nsw i32 %502, 3
  %520 = zext i32 %519 to i64
  %521 = getelementptr inbounds float, float* %159, i64 %520
  %522 = load float, float* %521, align 4, !tbaa !5
  %523 = fmul contract float %509, %522
  %524 = getelementptr inbounds float, float* %160, i64 %520
  %525 = load float, float* %524, align 4, !tbaa !5
  %526 = fmul contract float %515, %525
  %527 = fadd contract float %523, %526
  %528 = fadd contract float %500, %527
  %529 = add nuw nsw i32 %471, 2
  %530 = xor i32 %471, -2
  %531 = add nuw i32 %474, 2
  %532 = icmp eq i32 %531, %468
  br i1 %532, label %533, label %469, !llvm.loop !16

533:                                              ; preds = %469
  %534 = shl nuw nsw i32 %529, 1
  br label %535

535:                                              ; preds = %533, %459
  %536 = phi float [ undef, %459 ], [ %518, %533 ]
  %537 = phi float [ undef, %459 ], [ %528, %533 ]
  %538 = phi i32 [ 0, %459 ], [ %530, %533 ]
  %539 = phi i32 [ 0, %459 ], [ %534, %533 ]
  %540 = phi float [ 0.000000e+00, %459 ], [ %528, %533 ]
  %541 = phi float [ 0.000000e+00, %459 ], [ %518, %533 ]
  %542 = icmp eq i32 %464, 0
  br i1 %542, label %569, label %543

543:                                              ; preds = %535
  %544 = zext i32 %539 to i64
  %545 = getelementptr inbounds float, float* %159, i64 %544
  %546 = load float, float* %545, align 4, !tbaa !5
  %547 = add i32 %462, %538
  %548 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %547
  %549 = load float, float addrspace(3)* %548, align 4, !tbaa !5
  %550 = fmul contract float %546, %549
  %551 = getelementptr inbounds float, float* %160, i64 %544
  %552 = load float, float* %551, align 4, !tbaa !5
  %553 = add i32 %463, %538
  %554 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %553
  %555 = load float, float addrspace(3)* %554, align 4, !tbaa !5
  %556 = fmul contract float %552, %555
  %557 = fadd contract float %550, %556
  %558 = fadd contract float %541, %557
  %559 = or i32 %539, 1
  %560 = zext i32 %559 to i64
  %561 = getelementptr inbounds float, float* %159, i64 %560
  %562 = load float, float* %561, align 4, !tbaa !5
  %563 = fmul contract float %549, %562
  %564 = getelementptr inbounds float, float* %160, i64 %560
  %565 = load float, float* %564, align 4, !tbaa !5
  %566 = fmul contract float %555, %565
  %567 = fadd contract float %563, %566
  %568 = fadd contract float %540, %567
  br label %569

569:                                              ; preds = %543, %535, %458
  %570 = phi float [ 0.000000e+00, %458 ], [ %536, %535 ], [ %558, %543 ]
  %571 = phi float [ 0.000000e+00, %458 ], [ %537, %535 ], [ %568, %543 ]
  %572 = icmp sge i32 %455, %161
  %573 = icmp slt i32 %455, %162
  %574 = select i1 %572, i1 %573, i1 false
  br i1 %574, label %575, label %579

575:                                              ; preds = %569
  %576 = mul nsw i32 %454, %4
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %33, i64 %577
  store float %570, float addrspace(1)* %578, align 4, !tbaa !5
  br label %579

579:                                              ; preds = %575, %569
  %580 = icmp sge i32 %456, %161
  %581 = icmp slt i32 %456, %162
  %582 = select i1 %580, i1 %581, i1 false
  br i1 %582, label %583, label %588

583:                                              ; preds = %579
  %584 = add nuw nsw i32 %454, 1
  %585 = mul nsw i32 %584, %4
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds float, float addrspace(1)* %33, i64 %586
  store float %571, float addrspace(1)* %587, align 4, !tbaa !5
  br label %588

588:                                              ; preds = %583, %579, %452, %8
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
!12 = distinct !{!12, !13, !11}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13, !15}
!15 = !{!"llvm.loop.unroll.enable"}
!16 = distinct !{!16, !13}
