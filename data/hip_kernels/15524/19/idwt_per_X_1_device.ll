; ModuleID = '../data/hip_kernels/15524/19/main.cu'
source_filename = "../data/hip_kernels/15524/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpr = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpr = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpr to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpr to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12idwt_per_X_1PfS_S_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, 3
  %11 = sub i32 %10, %7
  %12 = shl i32 %11, 5
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %15, 2
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = add i32 %16, %17
  %19 = mul i32 %9, 192
  %20 = shl nuw nsw i32 %13, 1
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %18, %3
  br i1 %22, label %23, label %580

23:                                               ; preds = %8
  %24 = mul nsw i32 %18, %4
  %25 = add nsw i32 %14, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %29 = mul nsw i32 %18, %5
  %30 = add nsw i32 %29, %21
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = sdiv i32 %6, 2
  %34 = icmp sgt i32 %7, 0
  br i1 %34, label %35, label %71

35:                                               ; preds = %23
  %36 = shl nuw nsw i32 %7, 1
  %37 = add nsw i32 %36, 3
  %38 = shl nuw nsw i32 %17, 5
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
  %53 = add nsw i32 %52, %14
  %54 = zext i32 %52 to i64
  %55 = add nsw i32 %52, %4
  %56 = sext i32 %55 to i64
  %57 = icmp slt i32 %53, 0
  %58 = select i1 %57, i64 %56, i64 %54
  %59 = getelementptr inbounds float, float addrspace(1)* %27, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = add nuw i32 %52, %13
  %62 = add i32 %61, %39
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %62
  store float %60, float addrspace(3)* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds float, float addrspace(1)* %28, i64 %58
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = add i32 %61, %41
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %66
  store float %65, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = add nuw nsw i32 %50, 1
  %69 = add nuw nsw i32 %51, 1
  %70 = icmp eq i32 %69, %42
  br i1 %70, label %71, label %49, !llvm.loop !10

71:                                               ; preds = %49, %46, %23
  %72 = shl i32 %7, 1
  %73 = add i32 %72, 3
  %74 = icmp sgt i32 %7, -3
  %75 = shl nsw i32 %7, 1
  %76 = add nsw i32 %75, 3
  %77 = shl nuw nsw i32 %17, 5
  %78 = mul i32 %77, %76
  %79 = add nuw nsw i32 %77, 128
  %80 = mul i32 %79, %76
  br i1 %74, label %167, label %154

81:                                               ; preds = %81, %44
  %82 = phi i32 [ 0, %44 ], [ %151, %81 ]
  %83 = phi i32 [ 0, %44 ], [ %152, %81 ]
  %84 = shl nsw i32 %82, 5
  %85 = add nsw i32 %84, %14
  %86 = zext i32 %84 to i64
  %87 = add nsw i32 %84, %4
  %88 = sext i32 %87 to i64
  %89 = icmp slt i32 %85, 0
  %90 = select i1 %89, i64 %88, i64 %86
  %91 = getelementptr inbounds float, float addrspace(1)* %27, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = add nuw i32 %84, %13
  %94 = add i32 %93, %39
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %94
  store float %92, float addrspace(3)* %95, align 4, !tbaa !5
  %96 = getelementptr inbounds float, float addrspace(1)* %28, i64 %90
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = add i32 %93, %41
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %98
  store float %97, float addrspace(3)* %99, align 4, !tbaa !5
  %100 = shl i32 %82, 5
  %101 = or i32 %100, 32
  %102 = add nsw i32 %101, %14
  %103 = zext i32 %101 to i64
  %104 = add nsw i32 %101, %4
  %105 = sext i32 %104 to i64
  %106 = icmp slt i32 %102, 0
  %107 = select i1 %106, i64 %105, i64 %103
  %108 = getelementptr inbounds float, float addrspace(1)* %27, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = add nuw i32 %101, %13
  %111 = add i32 %110, %39
  %112 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %111
  store float %109, float addrspace(3)* %112, align 4, !tbaa !5
  %113 = getelementptr inbounds float, float addrspace(1)* %28, i64 %107
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = add i32 %110, %41
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %115
  store float %114, float addrspace(3)* %116, align 4, !tbaa !5
  %117 = shl i32 %82, 5
  %118 = or i32 %117, 64
  %119 = add nsw i32 %118, %14
  %120 = zext i32 %118 to i64
  %121 = add nsw i32 %118, %4
  %122 = sext i32 %121 to i64
  %123 = icmp slt i32 %119, 0
  %124 = select i1 %123, i64 %122, i64 %120
  %125 = getelementptr inbounds float, float addrspace(1)* %27, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = add nuw i32 %118, %13
  %128 = add i32 %127, %39
  %129 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %128
  store float %126, float addrspace(3)* %129, align 4, !tbaa !5
  %130 = getelementptr inbounds float, float addrspace(1)* %28, i64 %124
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = add i32 %127, %41
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %132
  store float %131, float addrspace(3)* %133, align 4, !tbaa !5
  %134 = shl i32 %82, 5
  %135 = or i32 %134, 96
  %136 = add nsw i32 %135, %14
  %137 = zext i32 %135 to i64
  %138 = add nsw i32 %135, %4
  %139 = sext i32 %138 to i64
  %140 = icmp slt i32 %136, 0
  %141 = select i1 %140, i64 %139, i64 %137
  %142 = getelementptr inbounds float, float addrspace(1)* %27, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = add nuw i32 %135, %13
  %145 = add i32 %144, %39
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %145
  store float %143, float addrspace(3)* %146, align 4, !tbaa !5
  %147 = getelementptr inbounds float, float addrspace(1)* %28, i64 %141
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
  %155 = shl nsw i32 %4, 1
  %156 = add nsw i32 %155, -2
  %157 = add i32 %156, %6
  %158 = icmp sgt i32 %6, 1
  %159 = load float*, float* addrspace(4)* @c_lpr, align 8
  %160 = load float*, float* addrspace(4)* @c_hpr, align 8
  %161 = add nsw i32 %33, -1
  %162 = add i32 %161, %5
  %163 = sub nsw i32 1, %33
  %164 = sub nsw i32 2, %33
  %165 = or i32 %21, 1
  %166 = icmp slt i32 %165, %157
  br i1 %166, label %186, label %312

167:                                              ; preds = %71, %167
  %168 = phi i32 [ %184, %167 ], [ %7, %71 ]
  %169 = shl nsw i32 %168, 5
  %170 = add nsw i32 %169, %14
  %171 = icmp slt i32 %170, %4
  %172 = select i1 %171, i32 0, i32 %4
  %173 = sub nsw i32 %169, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %27, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5, !amdgpu.noclobber !9
  %177 = add i32 %169, %13
  %178 = add i32 %177, %78
  %179 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %178
  store float %176, float addrspace(3)* %179, align 4, !tbaa !5
  %180 = getelementptr inbounds float, float addrspace(1)* %28, i64 %174
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !5, !amdgpu.noclobber !9
  %182 = add i32 %177, %80
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %182
  store float %181, float addrspace(3)* %183, align 4, !tbaa !5
  %184 = add nsw i32 %168, 1
  %185 = icmp slt i32 %184, %73
  br i1 %185, label %167, label %154, !llvm.loop !14

186:                                              ; preds = %154
  br i1 %158, label %187, label %232

187:                                              ; preds = %186
  %188 = shl nsw i32 %7, 5
  %189 = add i32 %188, %13
  %190 = add i32 %189, %78
  %191 = add i32 %189, %80
  %192 = and i32 %33, 1
  %193 = and i32 %6, -2
  %194 = icmp eq i32 %193, 2
  br i1 %194, label %197, label %195

195:                                              ; preds = %187
  %196 = and i32 %33, -2
  br label %238

197:                                              ; preds = %238, %187
  %198 = phi float [ undef, %187 ], [ %287, %238 ]
  %199 = phi float [ undef, %187 ], [ %297, %238 ]
  %200 = phi i32 [ 0, %187 ], [ %299, %238 ]
  %201 = phi i32 [ 0, %187 ], [ %298, %238 ]
  %202 = phi float [ 0.000000e+00, %187 ], [ %297, %238 ]
  %203 = phi float [ 0.000000e+00, %187 ], [ %287, %238 ]
  %204 = icmp eq i32 %192, 0
  br i1 %204, label %232, label %205

205:                                              ; preds = %197
  %206 = shl nuw nsw i32 %201, 1
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds float, float* %159, i64 %207
  %209 = load float, float* %208, align 4, !tbaa !5
  %210 = add i32 %190, %200
  %211 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %213 = fmul contract float %209, %212
  %214 = getelementptr inbounds float, float* %160, i64 %207
  %215 = load float, float* %214, align 4, !tbaa !5
  %216 = add i32 %191, %200
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %216
  %218 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %219 = fmul contract float %215, %218
  %220 = fadd contract float %213, %219
  %221 = fadd contract float %203, %220
  %222 = add nuw nsw i32 %206, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, float* %159, i64 %223
  %225 = load float, float* %224, align 4, !tbaa !5
  %226 = fmul contract float %212, %225
  %227 = getelementptr inbounds float, float* %160, i64 %223
  %228 = load float, float* %227, align 4, !tbaa !5
  %229 = fmul contract float %218, %228
  %230 = fadd contract float %226, %229
  %231 = fadd contract float %202, %230
  br label %232

232:                                              ; preds = %205, %197, %186
  %233 = phi float [ 0.000000e+00, %186 ], [ %198, %197 ], [ %221, %205 ]
  %234 = phi float [ 0.000000e+00, %186 ], [ %199, %197 ], [ %231, %205 ]
  %235 = icmp sge i32 %21, %161
  %236 = icmp slt i32 %21, %162
  %237 = select i1 %235, i1 %236, i1 false
  br i1 %237, label %302, label %305

238:                                              ; preds = %238, %195
  %239 = phi i32 [ 0, %195 ], [ %299, %238 ]
  %240 = phi i32 [ 0, %195 ], [ %298, %238 ]
  %241 = phi float [ 0.000000e+00, %195 ], [ %297, %238 ]
  %242 = phi float [ 0.000000e+00, %195 ], [ %287, %238 ]
  %243 = phi i32 [ 0, %195 ], [ %300, %238 ]
  %244 = shl nuw nsw i32 %240, 1
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds float, float* %159, i64 %245
  %247 = load float, float* %246, align 4, !tbaa !5
  %248 = add i32 %190, %239
  %249 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %248
  %250 = load float, float addrspace(3)* %249, align 4, !tbaa !5
  %251 = fmul contract float %247, %250
  %252 = getelementptr inbounds float, float* %160, i64 %245
  %253 = load float, float* %252, align 4, !tbaa !5
  %254 = add i32 %191, %239
  %255 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %254
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  %257 = fmul contract float %253, %256
  %258 = fadd contract float %251, %257
  %259 = fadd contract float %242, %258
  %260 = add nuw nsw i32 %244, 1
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds float, float* %159, i64 %261
  %263 = load float, float* %262, align 4, !tbaa !5
  %264 = fmul contract float %250, %263
  %265 = getelementptr inbounds float, float* %160, i64 %261
  %266 = load float, float* %265, align 4, !tbaa !5
  %267 = fmul contract float %256, %266
  %268 = fadd contract float %264, %267
  %269 = fadd contract float %241, %268
  %270 = xor i32 %240, -1
  %271 = shl nuw i32 %240, 1
  %272 = or i32 %271, 2
  %273 = zext i32 %272 to i64
  %274 = getelementptr inbounds float, float* %159, i64 %273
  %275 = load float, float* %274, align 4, !tbaa !5
  %276 = add i32 %190, %270
  %277 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = fmul contract float %275, %278
  %280 = getelementptr inbounds float, float* %160, i64 %273
  %281 = load float, float* %280, align 4, !tbaa !5
  %282 = add i32 %191, %270
  %283 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %282
  %284 = load float, float addrspace(3)* %283, align 4, !tbaa !5
  %285 = fmul contract float %281, %284
  %286 = fadd contract float %279, %285
  %287 = fadd contract float %259, %286
  %288 = add nuw nsw i32 %271, 3
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds float, float* %159, i64 %289
  %291 = load float, float* %290, align 4, !tbaa !5
  %292 = fmul contract float %278, %291
  %293 = getelementptr inbounds float, float* %160, i64 %289
  %294 = load float, float* %293, align 4, !tbaa !5
  %295 = fmul contract float %284, %294
  %296 = fadd contract float %292, %295
  %297 = fadd contract float %269, %296
  %298 = add nuw nsw i32 %240, 2
  %299 = xor i32 %240, -2
  %300 = add nuw i32 %243, 2
  %301 = icmp eq i32 %300, %196
  br i1 %301, label %197, label %238, !llvm.loop !16

302:                                              ; preds = %232
  %303 = sext i32 %163 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %32, i64 %303
  store float %233, float addrspace(1)* %304, align 4, !tbaa !5
  br label %305

305:                                              ; preds = %302, %232
  %306 = icmp sge i32 %165, %161
  %307 = icmp slt i32 %165, %162
  %308 = select i1 %306, i1 %307, i1 false
  br i1 %308, label %309, label %312

309:                                              ; preds = %305
  %310 = sext i32 %164 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %32, i64 %310
  store float %234, float addrspace(1)* %311, align 4, !tbaa !5
  br label %312

312:                                              ; preds = %154, %309, %305
  %313 = add nsw i32 %21, 64
  %314 = or i32 %313, 1
  %315 = icmp slt i32 %314, %157
  br i1 %315, label %316, label %446

316:                                              ; preds = %312
  br i1 %158, label %317, label %428

317:                                              ; preds = %316
  %318 = shl i32 %7, 5
  %319 = add i32 %318, 32
  %320 = add i32 %319, %13
  %321 = add i32 %320, %78
  %322 = add i32 %320, %80
  %323 = and i32 %33, 1
  %324 = and i32 %6, -2
  %325 = icmp eq i32 %324, 2
  br i1 %325, label %394, label %326

326:                                              ; preds = %317
  %327 = and i32 %33, -2
  br label %328

328:                                              ; preds = %328, %326
  %329 = phi i32 [ 0, %326 ], [ %389, %328 ]
  %330 = phi i32 [ 0, %326 ], [ %388, %328 ]
  %331 = phi float [ 0.000000e+00, %326 ], [ %387, %328 ]
  %332 = phi float [ 0.000000e+00, %326 ], [ %377, %328 ]
  %333 = phi i32 [ 0, %326 ], [ %390, %328 ]
  %334 = shl nuw nsw i32 %330, 1
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds float, float* %159, i64 %335
  %337 = load float, float* %336, align 4, !tbaa !5
  %338 = add i32 %321, %329
  %339 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %338
  %340 = load float, float addrspace(3)* %339, align 4, !tbaa !5
  %341 = fmul contract float %337, %340
  %342 = getelementptr inbounds float, float* %160, i64 %335
  %343 = load float, float* %342, align 4, !tbaa !5
  %344 = add i32 %322, %329
  %345 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %344
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !5
  %347 = fmul contract float %343, %346
  %348 = fadd contract float %341, %347
  %349 = fadd contract float %332, %348
  %350 = add nuw nsw i32 %334, 1
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds float, float* %159, i64 %351
  %353 = load float, float* %352, align 4, !tbaa !5
  %354 = fmul contract float %340, %353
  %355 = getelementptr inbounds float, float* %160, i64 %351
  %356 = load float, float* %355, align 4, !tbaa !5
  %357 = fmul contract float %346, %356
  %358 = fadd contract float %354, %357
  %359 = fadd contract float %331, %358
  %360 = xor i32 %330, -1
  %361 = shl nuw i32 %330, 1
  %362 = or i32 %361, 2
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds float, float* %159, i64 %363
  %365 = load float, float* %364, align 4, !tbaa !5
  %366 = add i32 %321, %360
  %367 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %366
  %368 = load float, float addrspace(3)* %367, align 4, !tbaa !5
  %369 = fmul contract float %365, %368
  %370 = getelementptr inbounds float, float* %160, i64 %363
  %371 = load float, float* %370, align 4, !tbaa !5
  %372 = add i32 %322, %360
  %373 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %372
  %374 = load float, float addrspace(3)* %373, align 4, !tbaa !5
  %375 = fmul contract float %371, %374
  %376 = fadd contract float %369, %375
  %377 = fadd contract float %349, %376
  %378 = add nuw nsw i32 %361, 3
  %379 = zext i32 %378 to i64
  %380 = getelementptr inbounds float, float* %159, i64 %379
  %381 = load float, float* %380, align 4, !tbaa !5
  %382 = fmul contract float %368, %381
  %383 = getelementptr inbounds float, float* %160, i64 %379
  %384 = load float, float* %383, align 4, !tbaa !5
  %385 = fmul contract float %374, %384
  %386 = fadd contract float %382, %385
  %387 = fadd contract float %359, %386
  %388 = add nuw nsw i32 %330, 2
  %389 = xor i32 %330, -2
  %390 = add nuw i32 %333, 2
  %391 = icmp eq i32 %390, %327
  br i1 %391, label %392, label %328, !llvm.loop !16

392:                                              ; preds = %328
  %393 = shl nuw nsw i32 %388, 1
  br label %394

394:                                              ; preds = %392, %317
  %395 = phi float [ undef, %317 ], [ %377, %392 ]
  %396 = phi float [ undef, %317 ], [ %387, %392 ]
  %397 = phi i32 [ 0, %317 ], [ %389, %392 ]
  %398 = phi i32 [ 0, %317 ], [ %393, %392 ]
  %399 = phi float [ 0.000000e+00, %317 ], [ %387, %392 ]
  %400 = phi float [ 0.000000e+00, %317 ], [ %377, %392 ]
  %401 = icmp eq i32 %323, 0
  br i1 %401, label %428, label %402

402:                                              ; preds = %394
  %403 = zext i32 %398 to i64
  %404 = getelementptr inbounds float, float* %159, i64 %403
  %405 = load float, float* %404, align 4, !tbaa !5
  %406 = add i32 %321, %397
  %407 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %406
  %408 = load float, float addrspace(3)* %407, align 4, !tbaa !5
  %409 = fmul contract float %405, %408
  %410 = getelementptr inbounds float, float* %160, i64 %403
  %411 = load float, float* %410, align 4, !tbaa !5
  %412 = add i32 %322, %397
  %413 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %412
  %414 = load float, float addrspace(3)* %413, align 4, !tbaa !5
  %415 = fmul contract float %411, %414
  %416 = fadd contract float %409, %415
  %417 = fadd contract float %400, %416
  %418 = or i32 %398, 1
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, float* %159, i64 %419
  %421 = load float, float* %420, align 4, !tbaa !5
  %422 = fmul contract float %408, %421
  %423 = getelementptr inbounds float, float* %160, i64 %419
  %424 = load float, float* %423, align 4, !tbaa !5
  %425 = fmul contract float %414, %424
  %426 = fadd contract float %422, %425
  %427 = fadd contract float %399, %426
  br label %428

428:                                              ; preds = %402, %394, %316
  %429 = phi float [ 0.000000e+00, %316 ], [ %395, %394 ], [ %417, %402 ]
  %430 = phi float [ 0.000000e+00, %316 ], [ %396, %394 ], [ %427, %402 ]
  %431 = icmp sge i32 %313, %161
  %432 = icmp slt i32 %313, %162
  %433 = select i1 %431, i1 %432, i1 false
  br i1 %433, label %434, label %438

434:                                              ; preds = %428
  %435 = sub nsw i32 65, %33
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds float, float addrspace(1)* %32, i64 %436
  store float %429, float addrspace(1)* %437, align 4, !tbaa !5
  br label %438

438:                                              ; preds = %434, %428
  %439 = icmp sge i32 %314, %161
  %440 = icmp slt i32 %314, %162
  %441 = select i1 %439, i1 %440, i1 false
  br i1 %441, label %442, label %446

442:                                              ; preds = %438
  %443 = sub nsw i32 66, %33
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds float, float addrspace(1)* %32, i64 %444
  store float %430, float addrspace(1)* %445, align 4, !tbaa !5
  br label %446

446:                                              ; preds = %442, %438, %312
  %447 = add nsw i32 %21, 128
  %448 = or i32 %447, 1
  %449 = icmp slt i32 %448, %157
  br i1 %449, label %450, label %580

450:                                              ; preds = %446
  br i1 %158, label %451, label %562

451:                                              ; preds = %450
  %452 = shl i32 %7, 5
  %453 = add i32 %452, 64
  %454 = add i32 %453, %13
  %455 = add i32 %454, %78
  %456 = add i32 %454, %80
  %457 = and i32 %33, 1
  %458 = and i32 %6, -2
  %459 = icmp eq i32 %458, 2
  br i1 %459, label %528, label %460

460:                                              ; preds = %451
  %461 = and i32 %33, -2
  br label %462

462:                                              ; preds = %462, %460
  %463 = phi i32 [ 0, %460 ], [ %523, %462 ]
  %464 = phi i32 [ 0, %460 ], [ %522, %462 ]
  %465 = phi float [ 0.000000e+00, %460 ], [ %521, %462 ]
  %466 = phi float [ 0.000000e+00, %460 ], [ %511, %462 ]
  %467 = phi i32 [ 0, %460 ], [ %524, %462 ]
  %468 = shl nuw nsw i32 %464, 1
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, float* %159, i64 %469
  %471 = load float, float* %470, align 4, !tbaa !5
  %472 = add i32 %455, %463
  %473 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %472
  %474 = load float, float addrspace(3)* %473, align 4, !tbaa !5
  %475 = fmul contract float %471, %474
  %476 = getelementptr inbounds float, float* %160, i64 %469
  %477 = load float, float* %476, align 4, !tbaa !5
  %478 = add i32 %456, %463
  %479 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %478
  %480 = load float, float addrspace(3)* %479, align 4, !tbaa !5
  %481 = fmul contract float %477, %480
  %482 = fadd contract float %475, %481
  %483 = fadd contract float %466, %482
  %484 = add nuw nsw i32 %468, 1
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, float* %159, i64 %485
  %487 = load float, float* %486, align 4, !tbaa !5
  %488 = fmul contract float %474, %487
  %489 = getelementptr inbounds float, float* %160, i64 %485
  %490 = load float, float* %489, align 4, !tbaa !5
  %491 = fmul contract float %480, %490
  %492 = fadd contract float %488, %491
  %493 = fadd contract float %465, %492
  %494 = xor i32 %464, -1
  %495 = shl nuw i32 %464, 1
  %496 = or i32 %495, 2
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, float* %159, i64 %497
  %499 = load float, float* %498, align 4, !tbaa !5
  %500 = add i32 %455, %494
  %501 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %500
  %502 = load float, float addrspace(3)* %501, align 4, !tbaa !5
  %503 = fmul contract float %499, %502
  %504 = getelementptr inbounds float, float* %160, i64 %497
  %505 = load float, float* %504, align 4, !tbaa !5
  %506 = add i32 %456, %494
  %507 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %506
  %508 = load float, float addrspace(3)* %507, align 4, !tbaa !5
  %509 = fmul contract float %505, %508
  %510 = fadd contract float %503, %509
  %511 = fadd contract float %483, %510
  %512 = add nuw nsw i32 %495, 3
  %513 = zext i32 %512 to i64
  %514 = getelementptr inbounds float, float* %159, i64 %513
  %515 = load float, float* %514, align 4, !tbaa !5
  %516 = fmul contract float %502, %515
  %517 = getelementptr inbounds float, float* %160, i64 %513
  %518 = load float, float* %517, align 4, !tbaa !5
  %519 = fmul contract float %508, %518
  %520 = fadd contract float %516, %519
  %521 = fadd contract float %493, %520
  %522 = add nuw nsw i32 %464, 2
  %523 = xor i32 %464, -2
  %524 = add nuw i32 %467, 2
  %525 = icmp eq i32 %524, %461
  br i1 %525, label %526, label %462, !llvm.loop !16

526:                                              ; preds = %462
  %527 = shl nuw nsw i32 %522, 1
  br label %528

528:                                              ; preds = %526, %451
  %529 = phi float [ undef, %451 ], [ %511, %526 ]
  %530 = phi float [ undef, %451 ], [ %521, %526 ]
  %531 = phi i32 [ 0, %451 ], [ %523, %526 ]
  %532 = phi i32 [ 0, %451 ], [ %527, %526 ]
  %533 = phi float [ 0.000000e+00, %451 ], [ %521, %526 ]
  %534 = phi float [ 0.000000e+00, %451 ], [ %511, %526 ]
  %535 = icmp eq i32 %457, 0
  br i1 %535, label %562, label %536

536:                                              ; preds = %528
  %537 = zext i32 %532 to i64
  %538 = getelementptr inbounds float, float* %159, i64 %537
  %539 = load float, float* %538, align 4, !tbaa !5
  %540 = add i32 %455, %531
  %541 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %540
  %542 = load float, float addrspace(3)* %541, align 4, !tbaa !5
  %543 = fmul contract float %539, %542
  %544 = getelementptr inbounds float, float* %160, i64 %537
  %545 = load float, float* %544, align 4, !tbaa !5
  %546 = add i32 %456, %531
  %547 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %546
  %548 = load float, float addrspace(3)* %547, align 4, !tbaa !5
  %549 = fmul contract float %545, %548
  %550 = fadd contract float %543, %549
  %551 = fadd contract float %534, %550
  %552 = or i32 %532, 1
  %553 = zext i32 %552 to i64
  %554 = getelementptr inbounds float, float* %159, i64 %553
  %555 = load float, float* %554, align 4, !tbaa !5
  %556 = fmul contract float %542, %555
  %557 = getelementptr inbounds float, float* %160, i64 %553
  %558 = load float, float* %557, align 4, !tbaa !5
  %559 = fmul contract float %548, %558
  %560 = fadd contract float %556, %559
  %561 = fadd contract float %533, %560
  br label %562

562:                                              ; preds = %536, %528, %450
  %563 = phi float [ 0.000000e+00, %450 ], [ %529, %528 ], [ %551, %536 ]
  %564 = phi float [ 0.000000e+00, %450 ], [ %530, %528 ], [ %561, %536 ]
  %565 = icmp sge i32 %447, %161
  %566 = icmp slt i32 %447, %162
  %567 = select i1 %565, i1 %566, i1 false
  br i1 %567, label %568, label %572

568:                                              ; preds = %562
  %569 = sub nsw i32 129, %33
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds float, float addrspace(1)* %32, i64 %570
  store float %563, float addrspace(1)* %571, align 4, !tbaa !5
  br label %572

572:                                              ; preds = %568, %562
  %573 = icmp sge i32 %448, %161
  %574 = icmp slt i32 %448, %162
  %575 = select i1 %573, i1 %574, i1 false
  br i1 %575, label %576, label %580

576:                                              ; preds = %572
  %577 = sub nsw i32 130, %33
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %32, i64 %578
  store float %564, float addrspace(1)* %579, align 4, !tbaa !5
  br label %580

580:                                              ; preds = %576, %572, %446, %8
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
