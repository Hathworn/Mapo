; ModuleID = '../data/hip_kernels/15524/15/main.cu'
source_filename = "../data/hip_kernels/15524/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_lpd = protected addrspace(4) externally_initialized global float* null, align 8
@c_hpd = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_hpd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_lpd to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11dwt_per_X_EPfiiiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 7
  %11 = shl i32 %5, 4
  %12 = sub i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = shl i32 %9, 6
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = shl i32 %17, 2
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %1
  br i1 %21, label %22, label %890

22:                                               ; preds = %8
  %23 = mul nsw i32 %20, %2
  %24 = add nsw i32 %14, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = mul nsw i32 %20, %3
  %28 = add nsw i32 %27, %16
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %6, i64 %29
  %31 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %32 = icmp sgt i32 %5, 0
  %33 = shl i32 %5, 1
  %34 = add i32 %33, 8
  br i1 %32, label %35, label %63

35:                                               ; preds = %22
  %36 = shl nuw nsw i32 %19, 4
  %37 = mul i32 %36, %34
  %38 = add i32 %37, %13
  %39 = and i32 %5, 7
  %40 = icmp ult i32 %5, 8
  br i1 %40, label %43, label %41

41:                                               ; preds = %35
  %42 = and i32 %5, -8
  br label %90

43:                                               ; preds = %90, %35
  %44 = phi i32 [ 0, %35 ], [ %188, %90 ]
  %45 = icmp eq i32 %39, 0
  br i1 %45, label %63, label %46

46:                                               ; preds = %43, %46
  %47 = phi i32 [ %60, %46 ], [ %44, %43 ]
  %48 = phi i32 [ %61, %46 ], [ 0, %43 ]
  %49 = shl nsw i32 %47, 4
  %50 = add nsw i32 %49, %14
  %51 = zext i32 %49 to i64
  %52 = add nsw i32 %49, %2
  %53 = sext i32 %52 to i64
  %54 = icmp slt i32 %50, 0
  %55 = select i1 %54, i64 %53, i64 %51
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
  %65 = mul i32 %34, %19
  %66 = shl i32 %65, 4
  br i1 %64, label %67, label %191

67:                                               ; preds = %63
  %68 = add i32 %66, %13
  %69 = and i32 %5, 7
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %87, label %71

71:                                               ; preds = %67, %71
  %72 = phi i32 [ %84, %71 ], [ %5, %67 ]
  %73 = phi i32 [ %85, %71 ], [ 0, %67 ]
  %74 = shl nsw i32 %72, 4
  %75 = add nsw i32 %74, %14
  %76 = icmp slt i32 %75, %2
  %77 = select i1 %76, i32 0, i32 %2
  %78 = sub nsw i32 %74, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %26, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = add i32 %68, %74
  %83 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %82
  store float %81, float addrspace(3)* %83, align 4, !tbaa !5
  %84 = add nsw i32 %72, 1
  %85 = add nuw nsw i32 %73, 1
  %86 = icmp eq i32 %85, %69
  br i1 %86, label %87, label %71, !llvm.loop !12

87:                                               ; preds = %71, %67
  %88 = phi i32 [ %5, %67 ], [ %84, %71 ]
  %89 = icmp ugt i32 %5, -8
  br i1 %89, label %191, label %201

90:                                               ; preds = %90, %41
  %91 = phi i32 [ 0, %41 ], [ %188, %90 ]
  %92 = phi i32 [ 0, %41 ], [ %189, %90 ]
  %93 = shl nsw i32 %91, 4
  %94 = add nsw i32 %93, %14
  %95 = zext i32 %93 to i64
  %96 = add nsw i32 %93, %2
  %97 = sext i32 %96 to i64
  %98 = icmp slt i32 %94, 0
  %99 = select i1 %98, i64 %97, i64 %95
  %100 = getelementptr inbounds float, float addrspace(1)* %26, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = add i32 %38, %93
  %103 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %102
  store float %101, float addrspace(3)* %103, align 4, !tbaa !5
  %104 = shl i32 %91, 4
  %105 = or i32 %104, 16
  %106 = add nsw i32 %105, %14
  %107 = zext i32 %105 to i64
  %108 = add nsw i32 %105, %2
  %109 = sext i32 %108 to i64
  %110 = icmp slt i32 %106, 0
  %111 = select i1 %110, i64 %109, i64 %107
  %112 = getelementptr inbounds float, float addrspace(1)* %26, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = add i32 %38, %105
  %115 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %114
  store float %113, float addrspace(3)* %115, align 4, !tbaa !5
  %116 = shl i32 %91, 4
  %117 = or i32 %116, 32
  %118 = add nsw i32 %117, %14
  %119 = zext i32 %117 to i64
  %120 = add nsw i32 %117, %2
  %121 = sext i32 %120 to i64
  %122 = icmp slt i32 %118, 0
  %123 = select i1 %122, i64 %121, i64 %119
  %124 = getelementptr inbounds float, float addrspace(1)* %26, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !5, !amdgpu.noclobber !9
  %126 = add i32 %38, %117
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %126
  store float %125, float addrspace(3)* %127, align 4, !tbaa !5
  %128 = shl i32 %91, 4
  %129 = or i32 %128, 48
  %130 = add nsw i32 %129, %14
  %131 = zext i32 %129 to i64
  %132 = add nsw i32 %129, %2
  %133 = sext i32 %132 to i64
  %134 = icmp slt i32 %130, 0
  %135 = select i1 %134, i64 %133, i64 %131
  %136 = getelementptr inbounds float, float addrspace(1)* %26, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = add i32 %38, %129
  %139 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %138
  store float %137, float addrspace(3)* %139, align 4, !tbaa !5
  %140 = shl i32 %91, 4
  %141 = or i32 %140, 64
  %142 = add nsw i32 %141, %14
  %143 = zext i32 %141 to i64
  %144 = add nsw i32 %141, %2
  %145 = sext i32 %144 to i64
  %146 = icmp slt i32 %142, 0
  %147 = select i1 %146, i64 %145, i64 %143
  %148 = getelementptr inbounds float, float addrspace(1)* %26, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5, !amdgpu.noclobber !9
  %150 = add i32 %38, %141
  %151 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %150
  store float %149, float addrspace(3)* %151, align 4, !tbaa !5
  %152 = shl i32 %91, 4
  %153 = or i32 %152, 80
  %154 = add nsw i32 %153, %14
  %155 = zext i32 %153 to i64
  %156 = add nsw i32 %153, %2
  %157 = sext i32 %156 to i64
  %158 = icmp slt i32 %154, 0
  %159 = select i1 %158, i64 %157, i64 %155
  %160 = getelementptr inbounds float, float addrspace(1)* %26, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  %162 = add i32 %38, %153
  %163 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %162
  store float %161, float addrspace(3)* %163, align 4, !tbaa !5
  %164 = shl i32 %91, 4
  %165 = or i32 %164, 96
  %166 = add nsw i32 %165, %14
  %167 = zext i32 %165 to i64
  %168 = add nsw i32 %165, %2
  %169 = sext i32 %168 to i64
  %170 = icmp slt i32 %166, 0
  %171 = select i1 %170, i64 %169, i64 %167
  %172 = getelementptr inbounds float, float addrspace(1)* %26, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !5, !amdgpu.noclobber !9
  %174 = add i32 %38, %165
  %175 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %174
  store float %173, float addrspace(3)* %175, align 4, !tbaa !5
  %176 = shl i32 %91, 4
  %177 = or i32 %176, 112
  %178 = add nsw i32 %177, %14
  %179 = zext i32 %177 to i64
  %180 = add nsw i32 %177, %2
  %181 = sext i32 %180 to i64
  %182 = icmp slt i32 %178, 0
  %183 = select i1 %182, i64 %181, i64 %179
  %184 = getelementptr inbounds float, float addrspace(1)* %26, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !5, !amdgpu.noclobber !9
  %186 = add i32 %38, %177
  %187 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %186
  store float %185, float addrspace(3)* %187, align 4, !tbaa !5
  %188 = add nuw nsw i32 %91, 8
  %189 = add i32 %92, 8
  %190 = icmp eq i32 %189, %42
  br i1 %190, label %43, label %90, !llvm.loop !13

191:                                              ; preds = %201, %87, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = sdiv i32 %4, 2
  %193 = icmp sgt i32 %4, 0
  %194 = load float*, float* addrspace(4)* @c_lpd, align 8
  %195 = shl nuw nsw i32 %13, 1
  %196 = add nsw i32 %192, %195
  %197 = add i32 %196, %11
  %198 = add i32 %197, %66
  %199 = load float*, float* addrspace(4)* @c_hpd, align 8
  %200 = icmp slt i32 %16, %3
  br i1 %200, label %292, label %437

201:                                              ; preds = %87, %201
  %202 = phi i32 [ %290, %201 ], [ %88, %87 ]
  %203 = shl nsw i32 %202, 4
  %204 = add nsw i32 %203, %14
  %205 = icmp slt i32 %204, %2
  %206 = select i1 %205, i32 0, i32 %2
  %207 = sub nsw i32 %203, %206
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %26, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !5, !amdgpu.noclobber !9
  %211 = add i32 %68, %203
  %212 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %211
  store float %210, float addrspace(3)* %212, align 4, !tbaa !5
  %213 = shl i32 %202, 4
  %214 = add i32 %213, 16
  %215 = add nsw i32 %214, %14
  %216 = icmp slt i32 %215, %2
  %217 = select i1 %216, i32 0, i32 %2
  %218 = sub nsw i32 %214, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %26, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !5, !amdgpu.noclobber !9
  %222 = add i32 %68, %214
  %223 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %222
  store float %221, float addrspace(3)* %223, align 4, !tbaa !5
  %224 = shl i32 %202, 4
  %225 = add i32 %224, 32
  %226 = add nsw i32 %225, %14
  %227 = icmp slt i32 %226, %2
  %228 = select i1 %227, i32 0, i32 %2
  %229 = sub nsw i32 %225, %228
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %26, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !5, !amdgpu.noclobber !9
  %233 = add i32 %68, %225
  %234 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %233
  store float %232, float addrspace(3)* %234, align 4, !tbaa !5
  %235 = shl i32 %202, 4
  %236 = add i32 %235, 48
  %237 = add nsw i32 %236, %14
  %238 = icmp slt i32 %237, %2
  %239 = select i1 %238, i32 0, i32 %2
  %240 = sub nsw i32 %236, %239
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %26, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !5, !amdgpu.noclobber !9
  %244 = add i32 %68, %236
  %245 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %244
  store float %243, float addrspace(3)* %245, align 4, !tbaa !5
  %246 = shl i32 %202, 4
  %247 = add i32 %246, 64
  %248 = add nsw i32 %247, %14
  %249 = icmp slt i32 %248, %2
  %250 = select i1 %249, i32 0, i32 %2
  %251 = sub nsw i32 %247, %250
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %26, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !5, !amdgpu.noclobber !9
  %255 = add i32 %68, %247
  %256 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %255
  store float %254, float addrspace(3)* %256, align 4, !tbaa !5
  %257 = shl i32 %202, 4
  %258 = add i32 %257, 80
  %259 = add nsw i32 %258, %14
  %260 = icmp slt i32 %259, %2
  %261 = select i1 %260, i32 0, i32 %2
  %262 = sub nsw i32 %258, %261
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %26, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !5, !amdgpu.noclobber !9
  %266 = add i32 %68, %258
  %267 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %266
  store float %265, float addrspace(3)* %267, align 4, !tbaa !5
  %268 = shl i32 %202, 4
  %269 = add i32 %268, 96
  %270 = add nsw i32 %269, %14
  %271 = icmp slt i32 %270, %2
  %272 = select i1 %271, i32 0, i32 %2
  %273 = sub nsw i32 %269, %272
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %26, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !5, !amdgpu.noclobber !9
  %277 = add i32 %68, %269
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %277
  store float %276, float addrspace(3)* %278, align 4, !tbaa !5
  %279 = shl i32 %202, 4
  %280 = add i32 %279, 112
  %281 = add nsw i32 %280, %14
  %282 = icmp slt i32 %281, %2
  %283 = select i1 %282, i32 0, i32 %2
  %284 = sub nsw i32 %280, %283
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %26, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !5, !amdgpu.noclobber !9
  %288 = add i32 %68, %280
  %289 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %288
  store float %287, float addrspace(3)* %289, align 4, !tbaa !5
  %290 = add nsw i32 %202, 8
  %291 = icmp eq i32 %202, %33
  br i1 %291, label %191, label %201, !llvm.loop !15

292:                                              ; preds = %191
  br i1 %193, label %293, label %325

293:                                              ; preds = %292
  %294 = and i32 %4, 7
  %295 = icmp ult i32 %4, 8
  br i1 %295, label %298, label %296

296:                                              ; preds = %293
  %297 = and i32 %4, -8
  br label %328

298:                                              ; preds = %328, %293
  %299 = phi float [ undef, %293 ], [ %430, %328 ]
  %300 = phi float [ undef, %293 ], [ %434, %328 ]
  %301 = phi i32 [ 0, %293 ], [ %297, %328 ]
  %302 = phi float [ 0.000000e+00, %293 ], [ %434, %328 ]
  %303 = phi float [ 0.000000e+00, %293 ], [ %430, %328 ]
  %304 = icmp eq i32 %294, 0
  br i1 %304, label %325, label %305

305:                                              ; preds = %298, %305
  %306 = phi i32 [ %322, %305 ], [ %301, %298 ]
  %307 = phi float [ %321, %305 ], [ %302, %298 ]
  %308 = phi float [ %317, %305 ], [ %303, %298 ]
  %309 = phi i32 [ %323, %305 ], [ 0, %298 ]
  %310 = zext i32 %306 to i64
  %311 = getelementptr inbounds float, float* %194, i64 %310
  %312 = load float, float* %311, align 4, !tbaa !5
  %313 = sub i32 %198, %306
  %314 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %313
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = fmul contract float %312, %315
  %317 = fadd contract float %308, %316
  %318 = getelementptr inbounds float, float* %199, i64 %310
  %319 = load float, float* %318, align 4, !tbaa !5
  %320 = fmul contract float %315, %319
  %321 = fadd contract float %307, %320
  %322 = add nuw nsw i32 %306, 1
  %323 = add nuw nsw i32 %309, 1
  %324 = icmp eq i32 %323, %294
  br i1 %324, label %325, label %305, !llvm.loop !16

325:                                              ; preds = %305, %298, %292
  %326 = phi float [ 0.000000e+00, %292 ], [ %299, %298 ], [ %317, %305 ]
  %327 = phi float [ 0.000000e+00, %292 ], [ %300, %298 ], [ %321, %305 ]
  store float %326, float addrspace(1)* %30, align 4, !tbaa !5
  store float %327, float addrspace(1)* %31, align 4, !tbaa !5
  br label %437

328:                                              ; preds = %328, %296
  %329 = phi i32 [ 0, %296 ], [ %435, %328 ]
  %330 = phi float [ 0.000000e+00, %296 ], [ %434, %328 ]
  %331 = phi float [ 0.000000e+00, %296 ], [ %430, %328 ]
  %332 = zext i32 %329 to i64
  %333 = getelementptr inbounds float, float* %194, i64 %332
  %334 = load float, float* %333, align 4, !tbaa !5
  %335 = sub i32 %198, %329
  %336 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %335
  %337 = load float, float addrspace(3)* %336, align 4, !tbaa !5
  %338 = fmul contract float %334, %337
  %339 = fadd contract float %331, %338
  %340 = getelementptr inbounds float, float* %199, i64 %332
  %341 = load float, float* %340, align 4, !tbaa !5
  %342 = fmul contract float %337, %341
  %343 = fadd contract float %330, %342
  %344 = or i32 %329, 1
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds float, float* %194, i64 %345
  %347 = load float, float* %346, align 4, !tbaa !5
  %348 = sub i32 %198, %344
  %349 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %348
  %350 = load float, float addrspace(3)* %349, align 4, !tbaa !5
  %351 = fmul contract float %347, %350
  %352 = fadd contract float %339, %351
  %353 = getelementptr inbounds float, float* %199, i64 %345
  %354 = load float, float* %353, align 4, !tbaa !5
  %355 = fmul contract float %350, %354
  %356 = fadd contract float %343, %355
  %357 = or i32 %329, 2
  %358 = zext i32 %357 to i64
  %359 = getelementptr inbounds float, float* %194, i64 %358
  %360 = load float, float* %359, align 4, !tbaa !5
  %361 = sub i32 %198, %357
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %361
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !5
  %364 = fmul contract float %360, %363
  %365 = fadd contract float %352, %364
  %366 = getelementptr inbounds float, float* %199, i64 %358
  %367 = load float, float* %366, align 4, !tbaa !5
  %368 = fmul contract float %363, %367
  %369 = fadd contract float %356, %368
  %370 = or i32 %329, 3
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds float, float* %194, i64 %371
  %373 = load float, float* %372, align 4, !tbaa !5
  %374 = sub i32 %198, %370
  %375 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %374
  %376 = load float, float addrspace(3)* %375, align 4, !tbaa !5
  %377 = fmul contract float %373, %376
  %378 = fadd contract float %365, %377
  %379 = getelementptr inbounds float, float* %199, i64 %371
  %380 = load float, float* %379, align 4, !tbaa !5
  %381 = fmul contract float %376, %380
  %382 = fadd contract float %369, %381
  %383 = or i32 %329, 4
  %384 = zext i32 %383 to i64
  %385 = getelementptr inbounds float, float* %194, i64 %384
  %386 = load float, float* %385, align 4, !tbaa !5
  %387 = sub i32 %198, %383
  %388 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %387
  %389 = load float, float addrspace(3)* %388, align 4, !tbaa !5
  %390 = fmul contract float %386, %389
  %391 = fadd contract float %378, %390
  %392 = getelementptr inbounds float, float* %199, i64 %384
  %393 = load float, float* %392, align 4, !tbaa !5
  %394 = fmul contract float %389, %393
  %395 = fadd contract float %382, %394
  %396 = or i32 %329, 5
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds float, float* %194, i64 %397
  %399 = load float, float* %398, align 4, !tbaa !5
  %400 = sub i32 %198, %396
  %401 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %400
  %402 = load float, float addrspace(3)* %401, align 4, !tbaa !5
  %403 = fmul contract float %399, %402
  %404 = fadd contract float %391, %403
  %405 = getelementptr inbounds float, float* %199, i64 %397
  %406 = load float, float* %405, align 4, !tbaa !5
  %407 = fmul contract float %402, %406
  %408 = fadd contract float %395, %407
  %409 = or i32 %329, 6
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds float, float* %194, i64 %410
  %412 = load float, float* %411, align 4, !tbaa !5
  %413 = sub i32 %198, %409
  %414 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %413
  %415 = load float, float addrspace(3)* %414, align 4, !tbaa !5
  %416 = fmul contract float %412, %415
  %417 = fadd contract float %404, %416
  %418 = getelementptr inbounds float, float* %199, i64 %410
  %419 = load float, float* %418, align 4, !tbaa !5
  %420 = fmul contract float %415, %419
  %421 = fadd contract float %408, %420
  %422 = or i32 %329, 7
  %423 = zext i32 %422 to i64
  %424 = getelementptr inbounds float, float* %194, i64 %423
  %425 = load float, float* %424, align 4, !tbaa !5
  %426 = sub i32 %198, %422
  %427 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %426
  %428 = load float, float addrspace(3)* %427, align 4, !tbaa !5
  %429 = fmul contract float %425, %428
  %430 = fadd contract float %417, %429
  %431 = getelementptr inbounds float, float* %199, i64 %423
  %432 = load float, float* %431, align 4, !tbaa !5
  %433 = fmul contract float %428, %432
  %434 = fadd contract float %421, %433
  %435 = add nuw nsw i32 %329, 8
  %436 = icmp eq i32 %435, %297
  br i1 %436, label %298, label %328, !llvm.loop !17

437:                                              ; preds = %191, %325
  %438 = add nsw i32 %16, 16
  %439 = icmp slt i32 %438, %3
  br i1 %439, label %440, label %588

440:                                              ; preds = %437
  br i1 %193, label %441, label %583

441:                                              ; preds = %440
  %442 = add i32 %198, 32
  %443 = and i32 %4, 7
  %444 = icmp ult i32 %4, 8
  br i1 %444, label %556, label %445

445:                                              ; preds = %441
  %446 = and i32 %4, -8
  br label %447

447:                                              ; preds = %447, %445
  %448 = phi i32 [ 0, %445 ], [ %554, %447 ]
  %449 = phi float [ 0.000000e+00, %445 ], [ %553, %447 ]
  %450 = phi float [ 0.000000e+00, %445 ], [ %549, %447 ]
  %451 = zext i32 %448 to i64
  %452 = getelementptr inbounds float, float* %194, i64 %451
  %453 = load float, float* %452, align 4, !tbaa !5
  %454 = sub i32 %442, %448
  %455 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %454
  %456 = load float, float addrspace(3)* %455, align 4, !tbaa !5
  %457 = fmul contract float %453, %456
  %458 = fadd contract float %450, %457
  %459 = getelementptr inbounds float, float* %199, i64 %451
  %460 = load float, float* %459, align 4, !tbaa !5
  %461 = fmul contract float %456, %460
  %462 = fadd contract float %449, %461
  %463 = or i32 %448, 1
  %464 = zext i32 %463 to i64
  %465 = getelementptr inbounds float, float* %194, i64 %464
  %466 = load float, float* %465, align 4, !tbaa !5
  %467 = sub i32 %442, %463
  %468 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %467
  %469 = load float, float addrspace(3)* %468, align 4, !tbaa !5
  %470 = fmul contract float %466, %469
  %471 = fadd contract float %458, %470
  %472 = getelementptr inbounds float, float* %199, i64 %464
  %473 = load float, float* %472, align 4, !tbaa !5
  %474 = fmul contract float %469, %473
  %475 = fadd contract float %462, %474
  %476 = or i32 %448, 2
  %477 = zext i32 %476 to i64
  %478 = getelementptr inbounds float, float* %194, i64 %477
  %479 = load float, float* %478, align 4, !tbaa !5
  %480 = sub i32 %442, %476
  %481 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %480
  %482 = load float, float addrspace(3)* %481, align 4, !tbaa !5
  %483 = fmul contract float %479, %482
  %484 = fadd contract float %471, %483
  %485 = getelementptr inbounds float, float* %199, i64 %477
  %486 = load float, float* %485, align 4, !tbaa !5
  %487 = fmul contract float %482, %486
  %488 = fadd contract float %475, %487
  %489 = or i32 %448, 3
  %490 = zext i32 %489 to i64
  %491 = getelementptr inbounds float, float* %194, i64 %490
  %492 = load float, float* %491, align 4, !tbaa !5
  %493 = sub i32 %442, %489
  %494 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %493
  %495 = load float, float addrspace(3)* %494, align 4, !tbaa !5
  %496 = fmul contract float %492, %495
  %497 = fadd contract float %484, %496
  %498 = getelementptr inbounds float, float* %199, i64 %490
  %499 = load float, float* %498, align 4, !tbaa !5
  %500 = fmul contract float %495, %499
  %501 = fadd contract float %488, %500
  %502 = or i32 %448, 4
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds float, float* %194, i64 %503
  %505 = load float, float* %504, align 4, !tbaa !5
  %506 = sub i32 %442, %502
  %507 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %506
  %508 = load float, float addrspace(3)* %507, align 4, !tbaa !5
  %509 = fmul contract float %505, %508
  %510 = fadd contract float %497, %509
  %511 = getelementptr inbounds float, float* %199, i64 %503
  %512 = load float, float* %511, align 4, !tbaa !5
  %513 = fmul contract float %508, %512
  %514 = fadd contract float %501, %513
  %515 = or i32 %448, 5
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds float, float* %194, i64 %516
  %518 = load float, float* %517, align 4, !tbaa !5
  %519 = sub i32 %442, %515
  %520 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %519
  %521 = load float, float addrspace(3)* %520, align 4, !tbaa !5
  %522 = fmul contract float %518, %521
  %523 = fadd contract float %510, %522
  %524 = getelementptr inbounds float, float* %199, i64 %516
  %525 = load float, float* %524, align 4, !tbaa !5
  %526 = fmul contract float %521, %525
  %527 = fadd contract float %514, %526
  %528 = or i32 %448, 6
  %529 = zext i32 %528 to i64
  %530 = getelementptr inbounds float, float* %194, i64 %529
  %531 = load float, float* %530, align 4, !tbaa !5
  %532 = sub i32 %442, %528
  %533 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %532
  %534 = load float, float addrspace(3)* %533, align 4, !tbaa !5
  %535 = fmul contract float %531, %534
  %536 = fadd contract float %523, %535
  %537 = getelementptr inbounds float, float* %199, i64 %529
  %538 = load float, float* %537, align 4, !tbaa !5
  %539 = fmul contract float %534, %538
  %540 = fadd contract float %527, %539
  %541 = or i32 %448, 7
  %542 = zext i32 %541 to i64
  %543 = getelementptr inbounds float, float* %194, i64 %542
  %544 = load float, float* %543, align 4, !tbaa !5
  %545 = sub i32 %442, %541
  %546 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %545
  %547 = load float, float addrspace(3)* %546, align 4, !tbaa !5
  %548 = fmul contract float %544, %547
  %549 = fadd contract float %536, %548
  %550 = getelementptr inbounds float, float* %199, i64 %542
  %551 = load float, float* %550, align 4, !tbaa !5
  %552 = fmul contract float %547, %551
  %553 = fadd contract float %540, %552
  %554 = add nuw nsw i32 %448, 8
  %555 = icmp eq i32 %554, %446
  br i1 %555, label %556, label %447, !llvm.loop !17

556:                                              ; preds = %447, %441
  %557 = phi float [ undef, %441 ], [ %549, %447 ]
  %558 = phi float [ undef, %441 ], [ %553, %447 ]
  %559 = phi i32 [ 0, %441 ], [ %446, %447 ]
  %560 = phi float [ 0.000000e+00, %441 ], [ %553, %447 ]
  %561 = phi float [ 0.000000e+00, %441 ], [ %549, %447 ]
  %562 = icmp eq i32 %443, 0
  br i1 %562, label %583, label %563

563:                                              ; preds = %556, %563
  %564 = phi i32 [ %580, %563 ], [ %559, %556 ]
  %565 = phi float [ %579, %563 ], [ %560, %556 ]
  %566 = phi float [ %575, %563 ], [ %561, %556 ]
  %567 = phi i32 [ %581, %563 ], [ 0, %556 ]
  %568 = zext i32 %564 to i64
  %569 = getelementptr inbounds float, float* %194, i64 %568
  %570 = load float, float* %569, align 4, !tbaa !5
  %571 = sub i32 %442, %564
  %572 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %571
  %573 = load float, float addrspace(3)* %572, align 4, !tbaa !5
  %574 = fmul contract float %570, %573
  %575 = fadd contract float %566, %574
  %576 = getelementptr inbounds float, float* %199, i64 %568
  %577 = load float, float* %576, align 4, !tbaa !5
  %578 = fmul contract float %573, %577
  %579 = fadd contract float %565, %578
  %580 = add nuw nsw i32 %564, 1
  %581 = add nuw nsw i32 %567, 1
  %582 = icmp eq i32 %581, %443
  br i1 %582, label %583, label %563, !llvm.loop !16

583:                                              ; preds = %563, %556, %440
  %584 = phi float [ 0.000000e+00, %440 ], [ %557, %556 ], [ %575, %563 ]
  %585 = phi float [ 0.000000e+00, %440 ], [ %558, %556 ], [ %579, %563 ]
  %586 = getelementptr inbounds float, float addrspace(1)* %30, i64 16
  store float %584, float addrspace(1)* %586, align 4, !tbaa !5
  %587 = getelementptr inbounds float, float addrspace(1)* %31, i64 16
  store float %585, float addrspace(1)* %587, align 4, !tbaa !5
  br label %588

588:                                              ; preds = %583, %437
  %589 = add nsw i32 %16, 32
  %590 = icmp slt i32 %589, %3
  br i1 %590, label %591, label %739

591:                                              ; preds = %588
  br i1 %193, label %592, label %734

592:                                              ; preds = %591
  %593 = add i32 %198, 64
  %594 = and i32 %4, 7
  %595 = icmp ult i32 %4, 8
  br i1 %595, label %707, label %596

596:                                              ; preds = %592
  %597 = and i32 %4, -8
  br label %598

598:                                              ; preds = %598, %596
  %599 = phi i32 [ 0, %596 ], [ %705, %598 ]
  %600 = phi float [ 0.000000e+00, %596 ], [ %704, %598 ]
  %601 = phi float [ 0.000000e+00, %596 ], [ %700, %598 ]
  %602 = zext i32 %599 to i64
  %603 = getelementptr inbounds float, float* %194, i64 %602
  %604 = load float, float* %603, align 4, !tbaa !5
  %605 = sub i32 %593, %599
  %606 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %605
  %607 = load float, float addrspace(3)* %606, align 4, !tbaa !5
  %608 = fmul contract float %604, %607
  %609 = fadd contract float %601, %608
  %610 = getelementptr inbounds float, float* %199, i64 %602
  %611 = load float, float* %610, align 4, !tbaa !5
  %612 = fmul contract float %607, %611
  %613 = fadd contract float %600, %612
  %614 = or i32 %599, 1
  %615 = zext i32 %614 to i64
  %616 = getelementptr inbounds float, float* %194, i64 %615
  %617 = load float, float* %616, align 4, !tbaa !5
  %618 = sub i32 %593, %614
  %619 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %618
  %620 = load float, float addrspace(3)* %619, align 4, !tbaa !5
  %621 = fmul contract float %617, %620
  %622 = fadd contract float %609, %621
  %623 = getelementptr inbounds float, float* %199, i64 %615
  %624 = load float, float* %623, align 4, !tbaa !5
  %625 = fmul contract float %620, %624
  %626 = fadd contract float %613, %625
  %627 = or i32 %599, 2
  %628 = zext i32 %627 to i64
  %629 = getelementptr inbounds float, float* %194, i64 %628
  %630 = load float, float* %629, align 4, !tbaa !5
  %631 = sub i32 %593, %627
  %632 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %631
  %633 = load float, float addrspace(3)* %632, align 4, !tbaa !5
  %634 = fmul contract float %630, %633
  %635 = fadd contract float %622, %634
  %636 = getelementptr inbounds float, float* %199, i64 %628
  %637 = load float, float* %636, align 4, !tbaa !5
  %638 = fmul contract float %633, %637
  %639 = fadd contract float %626, %638
  %640 = or i32 %599, 3
  %641 = zext i32 %640 to i64
  %642 = getelementptr inbounds float, float* %194, i64 %641
  %643 = load float, float* %642, align 4, !tbaa !5
  %644 = sub i32 %593, %640
  %645 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %644
  %646 = load float, float addrspace(3)* %645, align 4, !tbaa !5
  %647 = fmul contract float %643, %646
  %648 = fadd contract float %635, %647
  %649 = getelementptr inbounds float, float* %199, i64 %641
  %650 = load float, float* %649, align 4, !tbaa !5
  %651 = fmul contract float %646, %650
  %652 = fadd contract float %639, %651
  %653 = or i32 %599, 4
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, float* %194, i64 %654
  %656 = load float, float* %655, align 4, !tbaa !5
  %657 = sub i32 %593, %653
  %658 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %657
  %659 = load float, float addrspace(3)* %658, align 4, !tbaa !5
  %660 = fmul contract float %656, %659
  %661 = fadd contract float %648, %660
  %662 = getelementptr inbounds float, float* %199, i64 %654
  %663 = load float, float* %662, align 4, !tbaa !5
  %664 = fmul contract float %659, %663
  %665 = fadd contract float %652, %664
  %666 = or i32 %599, 5
  %667 = zext i32 %666 to i64
  %668 = getelementptr inbounds float, float* %194, i64 %667
  %669 = load float, float* %668, align 4, !tbaa !5
  %670 = sub i32 %593, %666
  %671 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %670
  %672 = load float, float addrspace(3)* %671, align 4, !tbaa !5
  %673 = fmul contract float %669, %672
  %674 = fadd contract float %661, %673
  %675 = getelementptr inbounds float, float* %199, i64 %667
  %676 = load float, float* %675, align 4, !tbaa !5
  %677 = fmul contract float %672, %676
  %678 = fadd contract float %665, %677
  %679 = or i32 %599, 6
  %680 = zext i32 %679 to i64
  %681 = getelementptr inbounds float, float* %194, i64 %680
  %682 = load float, float* %681, align 4, !tbaa !5
  %683 = sub i32 %593, %679
  %684 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %683
  %685 = load float, float addrspace(3)* %684, align 4, !tbaa !5
  %686 = fmul contract float %682, %685
  %687 = fadd contract float %674, %686
  %688 = getelementptr inbounds float, float* %199, i64 %680
  %689 = load float, float* %688, align 4, !tbaa !5
  %690 = fmul contract float %685, %689
  %691 = fadd contract float %678, %690
  %692 = or i32 %599, 7
  %693 = zext i32 %692 to i64
  %694 = getelementptr inbounds float, float* %194, i64 %693
  %695 = load float, float* %694, align 4, !tbaa !5
  %696 = sub i32 %593, %692
  %697 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %696
  %698 = load float, float addrspace(3)* %697, align 4, !tbaa !5
  %699 = fmul contract float %695, %698
  %700 = fadd contract float %687, %699
  %701 = getelementptr inbounds float, float* %199, i64 %693
  %702 = load float, float* %701, align 4, !tbaa !5
  %703 = fmul contract float %698, %702
  %704 = fadd contract float %691, %703
  %705 = add nuw nsw i32 %599, 8
  %706 = icmp eq i32 %705, %597
  br i1 %706, label %707, label %598, !llvm.loop !17

707:                                              ; preds = %598, %592
  %708 = phi float [ undef, %592 ], [ %700, %598 ]
  %709 = phi float [ undef, %592 ], [ %704, %598 ]
  %710 = phi i32 [ 0, %592 ], [ %597, %598 ]
  %711 = phi float [ 0.000000e+00, %592 ], [ %704, %598 ]
  %712 = phi float [ 0.000000e+00, %592 ], [ %700, %598 ]
  %713 = icmp eq i32 %594, 0
  br i1 %713, label %734, label %714

714:                                              ; preds = %707, %714
  %715 = phi i32 [ %731, %714 ], [ %710, %707 ]
  %716 = phi float [ %730, %714 ], [ %711, %707 ]
  %717 = phi float [ %726, %714 ], [ %712, %707 ]
  %718 = phi i32 [ %732, %714 ], [ 0, %707 ]
  %719 = zext i32 %715 to i64
  %720 = getelementptr inbounds float, float* %194, i64 %719
  %721 = load float, float* %720, align 4, !tbaa !5
  %722 = sub i32 %593, %715
  %723 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %722
  %724 = load float, float addrspace(3)* %723, align 4, !tbaa !5
  %725 = fmul contract float %721, %724
  %726 = fadd contract float %717, %725
  %727 = getelementptr inbounds float, float* %199, i64 %719
  %728 = load float, float* %727, align 4, !tbaa !5
  %729 = fmul contract float %724, %728
  %730 = fadd contract float %716, %729
  %731 = add nuw nsw i32 %715, 1
  %732 = add nuw nsw i32 %718, 1
  %733 = icmp eq i32 %732, %594
  br i1 %733, label %734, label %714, !llvm.loop !16

734:                                              ; preds = %714, %707, %591
  %735 = phi float [ 0.000000e+00, %591 ], [ %708, %707 ], [ %726, %714 ]
  %736 = phi float [ 0.000000e+00, %591 ], [ %709, %707 ], [ %730, %714 ]
  %737 = getelementptr inbounds float, float addrspace(1)* %30, i64 32
  store float %735, float addrspace(1)* %737, align 4, !tbaa !5
  %738 = getelementptr inbounds float, float addrspace(1)* %31, i64 32
  store float %736, float addrspace(1)* %738, align 4, !tbaa !5
  br label %739

739:                                              ; preds = %734, %588
  %740 = add nsw i32 %16, 48
  %741 = icmp slt i32 %740, %3
  br i1 %741, label %742, label %890

742:                                              ; preds = %739
  br i1 %193, label %743, label %885

743:                                              ; preds = %742
  %744 = add i32 %198, 96
  %745 = and i32 %4, 7
  %746 = icmp ult i32 %4, 8
  br i1 %746, label %858, label %747

747:                                              ; preds = %743
  %748 = and i32 %4, -8
  br label %749

749:                                              ; preds = %749, %747
  %750 = phi i32 [ 0, %747 ], [ %856, %749 ]
  %751 = phi float [ 0.000000e+00, %747 ], [ %855, %749 ]
  %752 = phi float [ 0.000000e+00, %747 ], [ %851, %749 ]
  %753 = zext i32 %750 to i64
  %754 = getelementptr inbounds float, float* %194, i64 %753
  %755 = load float, float* %754, align 4, !tbaa !5
  %756 = sub i32 %744, %750
  %757 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %756
  %758 = load float, float addrspace(3)* %757, align 4, !tbaa !5
  %759 = fmul contract float %755, %758
  %760 = fadd contract float %752, %759
  %761 = getelementptr inbounds float, float* %199, i64 %753
  %762 = load float, float* %761, align 4, !tbaa !5
  %763 = fmul contract float %758, %762
  %764 = fadd contract float %751, %763
  %765 = or i32 %750, 1
  %766 = zext i32 %765 to i64
  %767 = getelementptr inbounds float, float* %194, i64 %766
  %768 = load float, float* %767, align 4, !tbaa !5
  %769 = sub i32 %744, %765
  %770 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %769
  %771 = load float, float addrspace(3)* %770, align 4, !tbaa !5
  %772 = fmul contract float %768, %771
  %773 = fadd contract float %760, %772
  %774 = getelementptr inbounds float, float* %199, i64 %766
  %775 = load float, float* %774, align 4, !tbaa !5
  %776 = fmul contract float %771, %775
  %777 = fadd contract float %764, %776
  %778 = or i32 %750, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, float* %194, i64 %779
  %781 = load float, float* %780, align 4, !tbaa !5
  %782 = sub i32 %744, %778
  %783 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %782
  %784 = load float, float addrspace(3)* %783, align 4, !tbaa !5
  %785 = fmul contract float %781, %784
  %786 = fadd contract float %773, %785
  %787 = getelementptr inbounds float, float* %199, i64 %779
  %788 = load float, float* %787, align 4, !tbaa !5
  %789 = fmul contract float %784, %788
  %790 = fadd contract float %777, %789
  %791 = or i32 %750, 3
  %792 = zext i32 %791 to i64
  %793 = getelementptr inbounds float, float* %194, i64 %792
  %794 = load float, float* %793, align 4, !tbaa !5
  %795 = sub i32 %744, %791
  %796 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %795
  %797 = load float, float addrspace(3)* %796, align 4, !tbaa !5
  %798 = fmul contract float %794, %797
  %799 = fadd contract float %786, %798
  %800 = getelementptr inbounds float, float* %199, i64 %792
  %801 = load float, float* %800, align 4, !tbaa !5
  %802 = fmul contract float %797, %801
  %803 = fadd contract float %790, %802
  %804 = or i32 %750, 4
  %805 = zext i32 %804 to i64
  %806 = getelementptr inbounds float, float* %194, i64 %805
  %807 = load float, float* %806, align 4, !tbaa !5
  %808 = sub i32 %744, %804
  %809 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %808
  %810 = load float, float addrspace(3)* %809, align 4, !tbaa !5
  %811 = fmul contract float %807, %810
  %812 = fadd contract float %799, %811
  %813 = getelementptr inbounds float, float* %199, i64 %805
  %814 = load float, float* %813, align 4, !tbaa !5
  %815 = fmul contract float %810, %814
  %816 = fadd contract float %803, %815
  %817 = or i32 %750, 5
  %818 = zext i32 %817 to i64
  %819 = getelementptr inbounds float, float* %194, i64 %818
  %820 = load float, float* %819, align 4, !tbaa !5
  %821 = sub i32 %744, %817
  %822 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %821
  %823 = load float, float addrspace(3)* %822, align 4, !tbaa !5
  %824 = fmul contract float %820, %823
  %825 = fadd contract float %812, %824
  %826 = getelementptr inbounds float, float* %199, i64 %818
  %827 = load float, float* %826, align 4, !tbaa !5
  %828 = fmul contract float %823, %827
  %829 = fadd contract float %816, %828
  %830 = or i32 %750, 6
  %831 = zext i32 %830 to i64
  %832 = getelementptr inbounds float, float* %194, i64 %831
  %833 = load float, float* %832, align 4, !tbaa !5
  %834 = sub i32 %744, %830
  %835 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %834
  %836 = load float, float addrspace(3)* %835, align 4, !tbaa !5
  %837 = fmul contract float %833, %836
  %838 = fadd contract float %825, %837
  %839 = getelementptr inbounds float, float* %199, i64 %831
  %840 = load float, float* %839, align 4, !tbaa !5
  %841 = fmul contract float %836, %840
  %842 = fadd contract float %829, %841
  %843 = or i32 %750, 7
  %844 = zext i32 %843 to i64
  %845 = getelementptr inbounds float, float* %194, i64 %844
  %846 = load float, float* %845, align 4, !tbaa !5
  %847 = sub i32 %744, %843
  %848 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %847
  %849 = load float, float addrspace(3)* %848, align 4, !tbaa !5
  %850 = fmul contract float %846, %849
  %851 = fadd contract float %838, %850
  %852 = getelementptr inbounds float, float* %199, i64 %844
  %853 = load float, float* %852, align 4, !tbaa !5
  %854 = fmul contract float %849, %853
  %855 = fadd contract float %842, %854
  %856 = add nuw nsw i32 %750, 8
  %857 = icmp eq i32 %856, %748
  br i1 %857, label %858, label %749, !llvm.loop !17

858:                                              ; preds = %749, %743
  %859 = phi float [ undef, %743 ], [ %851, %749 ]
  %860 = phi float [ undef, %743 ], [ %855, %749 ]
  %861 = phi i32 [ 0, %743 ], [ %748, %749 ]
  %862 = phi float [ 0.000000e+00, %743 ], [ %855, %749 ]
  %863 = phi float [ 0.000000e+00, %743 ], [ %851, %749 ]
  %864 = icmp eq i32 %745, 0
  br i1 %864, label %885, label %865

865:                                              ; preds = %858, %865
  %866 = phi i32 [ %882, %865 ], [ %861, %858 ]
  %867 = phi float [ %881, %865 ], [ %862, %858 ]
  %868 = phi float [ %877, %865 ], [ %863, %858 ]
  %869 = phi i32 [ %883, %865 ], [ 0, %858 ]
  %870 = zext i32 %866 to i64
  %871 = getelementptr inbounds float, float* %194, i64 %870
  %872 = load float, float* %871, align 4, !tbaa !5
  %873 = sub i32 %744, %866
  %874 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %873
  %875 = load float, float addrspace(3)* %874, align 4, !tbaa !5
  %876 = fmul contract float %872, %875
  %877 = fadd contract float %868, %876
  %878 = getelementptr inbounds float, float* %199, i64 %870
  %879 = load float, float* %878, align 4, !tbaa !5
  %880 = fmul contract float %875, %879
  %881 = fadd contract float %867, %880
  %882 = add nuw nsw i32 %866, 1
  %883 = add nuw nsw i32 %869, 1
  %884 = icmp eq i32 %883, %745
  br i1 %884, label %885, label %865, !llvm.loop !16

885:                                              ; preds = %865, %858, %742
  %886 = phi float [ 0.000000e+00, %742 ], [ %859, %858 ], [ %877, %865 ]
  %887 = phi float [ 0.000000e+00, %742 ], [ %860, %858 ], [ %881, %865 ]
  %888 = getelementptr inbounds float, float addrspace(1)* %30, i64 48
  store float %886, float addrspace(1)* %888, align 4, !tbaa !5
  %889 = getelementptr inbounds float, float addrspace(1)* %31, i64 48
  store float %887, float addrspace(1)* %889, align 4, !tbaa !5
  br label %890

890:                                              ; preds = %739, %885, %8
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
!17 = distinct !{!17, !14, !11}
