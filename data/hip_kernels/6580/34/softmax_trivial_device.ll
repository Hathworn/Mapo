; ModuleID = '../data/hip_kernels/6580/34/main.cu'
source_filename = "../data/hip_kernels/6580/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15softmax_trivialPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %5, %3
  %8 = add nsw i32 %7, %6
  %9 = mul nsw i32 %3, %2
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %413

11:                                               ; preds = %4
  %12 = icmp sgt i32 %2, 0
  br i1 %12, label %13, label %36

13:                                               ; preds = %11
  %14 = and i32 %2, 7
  %15 = icmp ult i32 %2, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %2, -8
  br label %43

18:                                               ; preds = %43, %13
  %19 = phi float [ undef, %13 ], [ %101, %43 ]
  %20 = phi i32 [ 0, %13 ], [ %102, %43 ]
  %21 = phi float [ -1.000000e+08, %13 ], [ %101, %43 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %36, label %23

23:                                               ; preds = %18, %23
  %24 = phi i32 [ %33, %23 ], [ %20, %18 ]
  %25 = phi float [ %32, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %34, %23 ], [ 0, %18 ]
  %27 = mul nsw i32 %24, %3
  %28 = add nsw i32 %27, %6
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = tail call float @llvm.maxnum.f32(float %25, float %31)
  %33 = add nuw nsw i32 %24, 1
  %34 = add i32 %26, 1
  %35 = icmp eq i32 %34, %14
  br i1 %35, label %36, label %23, !llvm.loop !10

36:                                               ; preds = %18, %23, %11
  %37 = phi float [ -1.000000e+08, %11 ], [ %19, %18 ], [ %32, %23 ]
  br i1 %12, label %38, label %296

38:                                               ; preds = %36
  %39 = and i32 %2, 7
  %40 = icmp ult i32 %2, 8
  br i1 %40, label %105, label %41

41:                                               ; preds = %38
  %42 = and i32 %2, -8
  br label %127

43:                                               ; preds = %43, %16
  %44 = phi i32 [ 0, %16 ], [ %102, %43 ]
  %45 = phi float [ -1.000000e+08, %16 ], [ %101, %43 ]
  %46 = phi i32 [ 0, %16 ], [ %103, %43 ]
  %47 = mul nsw i32 %44, %3
  %48 = add nsw i32 %47, %6
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = tail call float @llvm.maxnum.f32(float %45, float %51)
  %53 = or i32 %44, 1
  %54 = mul nsw i32 %53, %3
  %55 = add nsw i32 %54, %6
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = tail call float @llvm.maxnum.f32(float %52, float %58)
  %60 = or i32 %44, 2
  %61 = mul nsw i32 %60, %3
  %62 = add nsw i32 %61, %6
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = tail call float @llvm.maxnum.f32(float %59, float %65)
  %67 = or i32 %44, 3
  %68 = mul nsw i32 %67, %3
  %69 = add nsw i32 %68, %6
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = tail call float @llvm.maxnum.f32(float %66, float %72)
  %74 = or i32 %44, 4
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %75, %6
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = tail call float @llvm.maxnum.f32(float %73, float %79)
  %81 = or i32 %44, 5
  %82 = mul nsw i32 %81, %3
  %83 = add nsw i32 %82, %6
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = tail call float @llvm.maxnum.f32(float %80, float %86)
  %88 = or i32 %44, 6
  %89 = mul nsw i32 %88, %3
  %90 = add nsw i32 %89, %6
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = tail call float @llvm.maxnum.f32(float %87, float %93)
  %95 = or i32 %44, 7
  %96 = mul nsw i32 %95, %3
  %97 = add nsw i32 %96, %6
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = tail call float @llvm.maxnum.f32(float %94, float %100)
  %102 = add nuw nsw i32 %44, 8
  %103 = add i32 %46, 8
  %104 = icmp eq i32 %103, %17
  br i1 %104, label %18, label %43, !llvm.loop !12

105:                                              ; preds = %127, %38
  %106 = phi i32 [ 0, %38 ], [ %193, %127 ]
  %107 = icmp eq i32 %39, 0
  br i1 %107, label %121, label %108

108:                                              ; preds = %105, %108
  %109 = phi i32 [ %118, %108 ], [ %106, %105 ]
  %110 = phi i32 [ %119, %108 ], [ 0, %105 ]
  %111 = mul nsw i32 %109, %3
  %112 = add nsw i32 %111, %6
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5
  %116 = fsub contract float %115, %37
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  store float %116, float addrspace(1)* %117, align 4, !tbaa !5
  %118 = add nuw nsw i32 %109, 1
  %119 = add i32 %110, 1
  %120 = icmp eq i32 %119, %39
  br i1 %120, label %121, label %108, !llvm.loop !14

121:                                              ; preds = %108, %105
  br i1 %12, label %122, label %296

122:                                              ; preds = %121
  %123 = and i32 %2, 7
  %124 = icmp ult i32 %2, 8
  br i1 %124, label %196, label %125

125:                                              ; preds = %122
  %126 = and i32 %2, -8
  br label %217

127:                                              ; preds = %127, %41
  %128 = phi i32 [ 0, %41 ], [ %193, %127 ]
  %129 = phi i32 [ 0, %41 ], [ %194, %127 ]
  %130 = mul nsw i32 %128, %3
  %131 = add nsw i32 %130, %6
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5
  %135 = fsub contract float %134, %37
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  store float %135, float addrspace(1)* %136, align 4, !tbaa !5
  %137 = or i32 %128, 1
  %138 = mul nsw i32 %137, %3
  %139 = add nsw i32 %138, %6
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5
  %143 = fsub contract float %142, %37
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  store float %143, float addrspace(1)* %144, align 4, !tbaa !5
  %145 = or i32 %128, 2
  %146 = mul nsw i32 %145, %3
  %147 = add nsw i32 %146, %6
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5
  %151 = fsub contract float %150, %37
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  store float %151, float addrspace(1)* %152, align 4, !tbaa !5
  %153 = or i32 %128, 3
  %154 = mul nsw i32 %153, %3
  %155 = add nsw i32 %154, %6
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5
  %159 = fsub contract float %158, %37
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  store float %159, float addrspace(1)* %160, align 4, !tbaa !5
  %161 = or i32 %128, 4
  %162 = mul nsw i32 %161, %3
  %163 = add nsw i32 %162, %6
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5
  %167 = fsub contract float %166, %37
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  store float %167, float addrspace(1)* %168, align 4, !tbaa !5
  %169 = or i32 %128, 5
  %170 = mul nsw i32 %169, %3
  %171 = add nsw i32 %170, %6
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !5
  %175 = fsub contract float %174, %37
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  store float %175, float addrspace(1)* %176, align 4, !tbaa !5
  %177 = or i32 %128, 6
  %178 = mul nsw i32 %177, %3
  %179 = add nsw i32 %178, %6
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %1, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5
  %183 = fsub contract float %182, %37
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  store float %183, float addrspace(1)* %184, align 4, !tbaa !5
  %185 = or i32 %128, 7
  %186 = mul nsw i32 %185, %3
  %187 = add nsw i32 %186, %6
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !5
  %191 = fsub contract float %190, %37
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  store float %191, float addrspace(1)* %192, align 4, !tbaa !5
  %193 = add nuw nsw i32 %128, 8
  %194 = add i32 %129, 8
  %195 = icmp eq i32 %194, %42
  br i1 %195, label %105, label %127, !llvm.loop !15

196:                                              ; preds = %217, %122
  %197 = phi i32 [ 0, %122 ], [ %275, %217 ]
  %198 = icmp eq i32 %123, 0
  br i1 %198, label %211, label %199

199:                                              ; preds = %196, %199
  %200 = phi i32 [ %208, %199 ], [ %197, %196 ]
  %201 = phi i32 [ %209, %199 ], [ 0, %196 ]
  %202 = mul nsw i32 %200, %3
  %203 = add nsw i32 %202, %6
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !5
  %207 = tail call float @llvm.exp.f32(float %206)
  store float %207, float addrspace(1)* %205, align 4, !tbaa !5
  %208 = add nuw nsw i32 %200, 1
  %209 = add i32 %201, 1
  %210 = icmp eq i32 %209, %123
  br i1 %210, label %211, label %199, !llvm.loop !16

211:                                              ; preds = %199, %196
  br i1 %12, label %212, label %296

212:                                              ; preds = %211
  %213 = and i32 %2, 7
  %214 = icmp ult i32 %2, 8
  br i1 %214, label %278, label %215

215:                                              ; preds = %212
  %216 = and i32 %2, -8
  br label %303

217:                                              ; preds = %217, %125
  %218 = phi i32 [ 0, %125 ], [ %275, %217 ]
  %219 = phi i32 [ 0, %125 ], [ %276, %217 ]
  %220 = mul nsw i32 %218, %3
  %221 = add nsw i32 %220, %6
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %0, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !5
  %225 = tail call float @llvm.exp.f32(float %224)
  store float %225, float addrspace(1)* %223, align 4, !tbaa !5
  %226 = or i32 %218, 1
  %227 = mul nsw i32 %226, %3
  %228 = add nsw i32 %227, %6
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %0, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !5
  %232 = tail call float @llvm.exp.f32(float %231)
  store float %232, float addrspace(1)* %230, align 4, !tbaa !5
  %233 = or i32 %218, 2
  %234 = mul nsw i32 %233, %3
  %235 = add nsw i32 %234, %6
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %0, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !5
  %239 = tail call float @llvm.exp.f32(float %238)
  store float %239, float addrspace(1)* %237, align 4, !tbaa !5
  %240 = or i32 %218, 3
  %241 = mul nsw i32 %240, %3
  %242 = add nsw i32 %241, %6
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %0, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !5
  %246 = tail call float @llvm.exp.f32(float %245)
  store float %246, float addrspace(1)* %244, align 4, !tbaa !5
  %247 = or i32 %218, 4
  %248 = mul nsw i32 %247, %3
  %249 = add nsw i32 %248, %6
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %0, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !5
  %253 = tail call float @llvm.exp.f32(float %252)
  store float %253, float addrspace(1)* %251, align 4, !tbaa !5
  %254 = or i32 %218, 5
  %255 = mul nsw i32 %254, %3
  %256 = add nsw i32 %255, %6
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %0, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !5
  %260 = tail call float @llvm.exp.f32(float %259)
  store float %260, float addrspace(1)* %258, align 4, !tbaa !5
  %261 = or i32 %218, 6
  %262 = mul nsw i32 %261, %3
  %263 = add nsw i32 %262, %6
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %0, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !5
  %267 = tail call float @llvm.exp.f32(float %266)
  store float %267, float addrspace(1)* %265, align 4, !tbaa !5
  %268 = or i32 %218, 7
  %269 = mul nsw i32 %268, %3
  %270 = add nsw i32 %269, %6
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %0, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !5
  %274 = tail call float @llvm.exp.f32(float %273)
  store float %274, float addrspace(1)* %272, align 4, !tbaa !5
  %275 = add nuw nsw i32 %218, 8
  %276 = add i32 %219, 8
  %277 = icmp eq i32 %276, %126
  br i1 %277, label %196, label %217, !llvm.loop !17

278:                                              ; preds = %303, %212
  %279 = phi float [ undef, %212 ], [ %361, %303 ]
  %280 = phi i32 [ 0, %212 ], [ %362, %303 ]
  %281 = phi float [ 0.000000e+00, %212 ], [ %361, %303 ]
  %282 = icmp eq i32 %213, 0
  br i1 %282, label %296, label %283

283:                                              ; preds = %278, %283
  %284 = phi i32 [ %293, %283 ], [ %280, %278 ]
  %285 = phi float [ %292, %283 ], [ %281, %278 ]
  %286 = phi i32 [ %294, %283 ], [ 0, %278 ]
  %287 = mul nsw i32 %284, %3
  %288 = add nsw i32 %287, %6
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !5
  %292 = fadd contract float %285, %291
  %293 = add nuw nsw i32 %284, 1
  %294 = add i32 %286, 1
  %295 = icmp eq i32 %294, %213
  br i1 %295, label %296, label %283, !llvm.loop !18

296:                                              ; preds = %278, %283, %36, %121, %211
  %297 = phi float [ 0.000000e+00, %211 ], [ 0.000000e+00, %121 ], [ 0.000000e+00, %36 ], [ %279, %278 ], [ %292, %283 ]
  br i1 %12, label %298, label %413

298:                                              ; preds = %296
  %299 = and i32 %2, 3
  %300 = icmp ult i32 %2, 4
  br i1 %300, label %398, label %301

301:                                              ; preds = %298
  %302 = and i32 %2, -4
  br label %365

303:                                              ; preds = %303, %215
  %304 = phi i32 [ 0, %215 ], [ %362, %303 ]
  %305 = phi float [ 0.000000e+00, %215 ], [ %361, %303 ]
  %306 = phi i32 [ 0, %215 ], [ %363, %303 ]
  %307 = mul nsw i32 %304, %3
  %308 = add nsw i32 %307, %6
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %0, i64 %309
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !5
  %312 = fadd contract float %305, %311
  %313 = or i32 %304, 1
  %314 = mul nsw i32 %313, %3
  %315 = add nsw i32 %314, %6
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !5
  %319 = fadd contract float %312, %318
  %320 = or i32 %304, 2
  %321 = mul nsw i32 %320, %3
  %322 = add nsw i32 %321, %6
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !5
  %326 = fadd contract float %319, %325
  %327 = or i32 %304, 3
  %328 = mul nsw i32 %327, %3
  %329 = add nsw i32 %328, %6
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %0, i64 %330
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !5
  %333 = fadd contract float %326, %332
  %334 = or i32 %304, 4
  %335 = mul nsw i32 %334, %3
  %336 = add nsw i32 %335, %6
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %0, i64 %337
  %339 = load float, float addrspace(1)* %338, align 4, !tbaa !5
  %340 = fadd contract float %333, %339
  %341 = or i32 %304, 5
  %342 = mul nsw i32 %341, %3
  %343 = add nsw i32 %342, %6
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !5
  %347 = fadd contract float %340, %346
  %348 = or i32 %304, 6
  %349 = mul nsw i32 %348, %3
  %350 = add nsw i32 %349, %6
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %0, i64 %351
  %353 = load float, float addrspace(1)* %352, align 4, !tbaa !5
  %354 = fadd contract float %347, %353
  %355 = or i32 %304, 7
  %356 = mul nsw i32 %355, %3
  %357 = add nsw i32 %356, %6
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %0, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !5
  %361 = fadd contract float %354, %360
  %362 = add nuw nsw i32 %304, 8
  %363 = add i32 %306, 8
  %364 = icmp eq i32 %363, %216
  br i1 %364, label %278, label %303, !llvm.loop !19

365:                                              ; preds = %365, %301
  %366 = phi i32 [ 0, %301 ], [ %395, %365 ]
  %367 = phi i32 [ 0, %301 ], [ %396, %365 ]
  %368 = mul nsw i32 %366, %3
  %369 = add nsw i32 %368, %6
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %0, i64 %370
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !5
  %373 = fdiv contract float %372, %297
  store float %373, float addrspace(1)* %371, align 4, !tbaa !5
  %374 = or i32 %366, 1
  %375 = mul nsw i32 %374, %3
  %376 = add nsw i32 %375, %6
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %0, i64 %377
  %379 = load float, float addrspace(1)* %378, align 4, !tbaa !5
  %380 = fdiv contract float %379, %297
  store float %380, float addrspace(1)* %378, align 4, !tbaa !5
  %381 = or i32 %366, 2
  %382 = mul nsw i32 %381, %3
  %383 = add nsw i32 %382, %6
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds float, float addrspace(1)* %0, i64 %384
  %386 = load float, float addrspace(1)* %385, align 4, !tbaa !5
  %387 = fdiv contract float %386, %297
  store float %387, float addrspace(1)* %385, align 4, !tbaa !5
  %388 = or i32 %366, 3
  %389 = mul nsw i32 %388, %3
  %390 = add nsw i32 %389, %6
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %0, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !5
  %394 = fdiv contract float %393, %297
  store float %394, float addrspace(1)* %392, align 4, !tbaa !5
  %395 = add nuw nsw i32 %366, 4
  %396 = add i32 %367, 4
  %397 = icmp eq i32 %396, %302
  br i1 %397, label %398, label %365, !llvm.loop !20

398:                                              ; preds = %365, %298
  %399 = phi i32 [ 0, %298 ], [ %395, %365 ]
  %400 = icmp eq i32 %299, 0
  br i1 %400, label %413, label %401

401:                                              ; preds = %398, %401
  %402 = phi i32 [ %410, %401 ], [ %399, %398 ]
  %403 = phi i32 [ %411, %401 ], [ 0, %398 ]
  %404 = mul nsw i32 %402, %3
  %405 = add nsw i32 %404, %6
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %0, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !5
  %409 = fdiv contract float %408, %297
  store float %409, float addrspace(1)* %407, align 4, !tbaa !5
  %410 = add nuw nsw i32 %402, 1
  %411 = add i32 %403, 1
  %412 = icmp eq i32 %411, %299
  br i1 %412, label %413, label %401, !llvm.loop !21

413:                                              ; preds = %398, %401, %296, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !11}
