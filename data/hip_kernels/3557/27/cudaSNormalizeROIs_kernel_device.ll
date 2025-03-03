; ModuleID = '../data/hip_kernels/3557/27/main.cu'
source_filename = "../data/hip_kernels/3557/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25cudaSNormalizeROIs_kerneljjjjjjjjbbbffPKfS0_PKiS2_S0_S0_S0_S0_S0_S0_PfPiS3_S3_S3_f(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i1 %8, i1 %9, i1 %10, float %11, float %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, i32 addrspace(1)* nocapture readonly %15, i32 addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture readonly %18, float addrspace(1)* nocapture readonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22, float addrspace(1)* nocapture writeonly %23, i32 addrspace(1)* nocapture writeonly %24, float addrspace(1)* nocapture writeonly %25, float addrspace(1)* nocapture writeonly %26, float addrspace(1)* nocapture writeonly %27, float %28) local_unnamed_addr #0 {
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = mul i32 %30, %2
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %33 = and i32 %32, 31
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !5, !invariant.load !6
  %39 = zext i16 %38 to i32
  %40 = mul i32 %34, %39
  %41 = add i32 %40, %33
  %42 = icmp ult i32 %41, %2
  br i1 %42, label %43, label %598

43:                                               ; preds = %29
  br i1 %8, label %44, label %67

44:                                               ; preds = %43
  %45 = icmp ugt i32 %5, %4
  %46 = add i32 %41, %31
  br i1 %45, label %47, label %49

47:                                               ; preds = %44
  %48 = mul i32 %46, %5
  br label %54

49:                                               ; preds = %54, %44
  %50 = phi i32 [ %4, %44 ], [ %64, %54 ]
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %51
  store i32 %50, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = add i32 %50, 1
  br label %71

54:                                               ; preds = %47, %54
  %55 = phi i32 [ %4, %47 ], [ %64, %54 ]
  %56 = phi float [ 0.000000e+00, %47 ], [ %63, %54 ]
  %57 = phi i32 [ %4, %47 ], [ %65, %54 ]
  %58 = add i32 %57, %48
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %19, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !6
  %62 = fcmp contract ult float %61, %56
  %63 = select i1 %62, float %56, float %61
  %64 = select i1 %62, i32 %55, i32 %57
  %65 = add nuw i32 %57, 1
  %66 = icmp ult i32 %65, %5
  br i1 %66, label %54, label %49, !llvm.loop !13

67:                                               ; preds = %43
  %68 = add nsw i32 %41, %31
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %69
  store i32 -1, i32 addrspace(1)* %70, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %67, %49
  %72 = phi i32 [ %53, %49 ], [ %5, %67 ]
  %73 = phi i32 [ %50, %49 ], [ %4, %67 ]
  %74 = icmp ult i32 %73, %72
  br i1 %74, label %75, label %598

75:                                               ; preds = %71
  %76 = add i32 %41, %31
  %77 = shl i32 %76, 2
  %78 = mul i32 %77, %5
  %79 = add i32 %41, %31
  %80 = mul i32 %79, %5
  %81 = sub i32 %5, %4
  %82 = mul i32 %77, %81
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %17, i64 %83
  %85 = or i32 %77, 1
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %17, i64 %86
  %88 = or i32 %77, 2
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %17, i64 %89
  %91 = or i32 %77, 3
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %17, i64 %92
  %94 = getelementptr inbounds float, float addrspace(1)* %14, i64 1
  %95 = getelementptr inbounds float, float addrspace(1)* %13, i64 1
  %96 = getelementptr inbounds float, float addrspace(1)* %14, i64 2
  %97 = getelementptr inbounds float, float addrspace(1)* %13, i64 2
  %98 = getelementptr inbounds float, float addrspace(1)* %14, i64 3
  %99 = getelementptr inbounds float, float addrspace(1)* %13, i64 3
  %100 = fpext float %11 to double
  %101 = fpext float %12 to double
  %102 = shl i32 %79, 1
  %103 = mul i32 %102, %5
  %104 = mul i32 %79, 3
  %105 = mul i32 %104, %5
  %106 = add i32 %73, -1
  br label %107

107:                                              ; preds = %75, %594
  %108 = phi i32 [ 0, %75 ], [ %597, %594 ]
  %109 = phi i32 [ %73, %75 ], [ %595, %594 ]
  %110 = add i32 %106, %108
  %111 = add i32 %106, %108
  %112 = shl i32 %109, 2
  %113 = add i32 %112, %78
  %114 = add i32 %109, %80
  %115 = sub i32 %109, %4
  %116 = shl i32 %115, 2
  %117 = select i1 %8, i32 0, i32 %116
  %118 = add i32 %82, %117
  %119 = load float, float addrspace(1)* %84, align 4, !tbaa !11
  %120 = fmul contract float %119, %11
  %121 = load float, float addrspace(1)* %87, align 4, !tbaa !11
  %122 = fmul contract float %121, %12
  %123 = load float, float addrspace(1)* %90, align 4, !tbaa !11
  %124 = fmul contract float %123, %11
  %125 = load float, float addrspace(1)* %93, align 4, !tbaa !11
  %126 = fmul contract float %125, %12
  %127 = zext i32 %113 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %18, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !11
  %130 = load float, float addrspace(1)* %14, align 4, !tbaa !11
  %131 = fmul contract float %129, %130
  %132 = load float, float addrspace(1)* %13, align 4, !tbaa !11
  %133 = fadd contract float %131, %132
  %134 = or i32 %113, 1
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %18, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !11
  %138 = load float, float addrspace(1)* %94, align 4, !tbaa !11
  %139 = fmul contract float %137, %138
  %140 = load float, float addrspace(1)* %95, align 4, !tbaa !11
  %141 = fadd contract float %139, %140
  %142 = or i32 %113, 2
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %18, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11
  %146 = load float, float addrspace(1)* %96, align 4, !tbaa !11
  %147 = fmul contract float %145, %146
  %148 = load float, float addrspace(1)* %97, align 4, !tbaa !11
  %149 = fadd contract float %147, %148
  %150 = or i32 %113, 3
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %18, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11
  %154 = load float, float addrspace(1)* %98, align 4, !tbaa !11
  %155 = fmul contract float %153, %154
  %156 = load float, float addrspace(1)* %99, align 4, !tbaa !11
  %157 = fadd contract float %155, %156
  %158 = fmul contract float %124, %133
  %159 = fadd contract float %120, %158
  %160 = fpext float %159 to double
  %161 = fpext float %124 to double
  %162 = fmul contract double %161, 5.000000e-01
  %163 = fadd contract double %162, %160
  %164 = fmul float %149, 0x3FF7154760000000
  %165 = tail call float @llvm.rint.f32(float %164)
  %166 = fcmp ogt float %149, 0x40562E4300000000
  %167 = fcmp olt float %149, 0xC059D1DA00000000
  %168 = fneg float %164
  %169 = tail call float @llvm.fma.f32(float %149, float 0x3FF7154760000000, float %168)
  %170 = tail call float @llvm.fma.f32(float %149, float 0x3E54AE0BE0000000, float %169)
  %171 = fsub float %164, %165
  %172 = fadd float %170, %171
  %173 = tail call float @llvm.exp2.f32(float %172)
  %174 = fptosi float %165 to i32
  %175 = tail call float @llvm.amdgcn.ldexp.f32(float %173, i32 %174)
  %176 = select i1 %167, float 0.000000e+00, float %175
  %177 = select i1 %166, float 0x7FF0000000000000, float %176
  %178 = fpext float %177 to double
  %179 = fmul contract double %162, %178
  %180 = fsub contract double %163, %179
  %181 = fptrunc double %180 to float
  %182 = fmul contract float %126, %141
  %183 = fadd contract float %122, %182
  %184 = fpext float %183 to double
  %185 = fpext float %126 to double
  %186 = fmul contract double %185, 5.000000e-01
  %187 = fadd contract double %186, %184
  %188 = fmul float %157, 0x3FF7154760000000
  %189 = tail call float @llvm.rint.f32(float %188)
  %190 = fcmp ogt float %157, 0x40562E4300000000
  %191 = fcmp olt float %157, 0xC059D1DA00000000
  %192 = fneg float %188
  %193 = tail call float @llvm.fma.f32(float %157, float 0x3FF7154760000000, float %192)
  %194 = tail call float @llvm.fma.f32(float %157, float 0x3E54AE0BE0000000, float %193)
  %195 = fsub float %188, %189
  %196 = fadd float %194, %195
  %197 = tail call float @llvm.exp2.f32(float %196)
  %198 = fptosi float %189 to i32
  %199 = tail call float @llvm.amdgcn.ldexp.f32(float %197, i32 %198)
  %200 = select i1 %191, float 0.000000e+00, float %199
  %201 = select i1 %190, float 0x7FF0000000000000, float %200
  %202 = fpext float %201 to double
  %203 = fmul contract double %186, %202
  %204 = fsub contract double %187, %203
  %205 = fptrunc double %204 to float
  %206 = fmul contract float %124, %177
  %207 = fmul contract float %126, %201
  %208 = fcmp contract olt float %181, 0.000000e+00
  %209 = fcmp contract olt float %181, -0.000000e+00
  %210 = select i1 %209, float %181, float -0.000000e+00
  %211 = fadd contract float %206, %210
  %212 = select i1 %208, float 0.000000e+00, float %181
  %213 = fcmp contract olt float %205, 0.000000e+00
  %214 = fcmp contract olt float %205, -0.000000e+00
  %215 = select i1 %214, float %205, float -0.000000e+00
  %216 = fadd contract float %207, %215
  %217 = select i1 %213, float 0.000000e+00, float %205
  %218 = fadd contract float %212, %211
  %219 = fcmp contract ogt float %218, 1.000000e+00
  br i1 %219, label %220, label %224

220:                                              ; preds = %107
  %221 = fpext float %212 to double
  %222 = fsub contract double 1.000000e+00, %221
  %223 = fdiv contract double %222, %100
  br label %227

224:                                              ; preds = %107
  %225 = fdiv contract float %211, %11
  %226 = fpext float %225 to double
  br label %227

227:                                              ; preds = %224, %220
  %228 = phi contract double [ %223, %220 ], [ %226, %224 ]
  %229 = fptrunc double %228 to float
  %230 = fadd contract float %217, %216
  %231 = fcmp contract ogt float %230, 1.000000e+00
  br i1 %231, label %232, label %236

232:                                              ; preds = %227
  %233 = fpext float %217 to double
  %234 = fsub contract double 1.000000e+00, %233
  %235 = fdiv contract double %234, %101
  br label %239

236:                                              ; preds = %227
  %237 = fdiv contract float %216, %12
  %238 = fpext float %237 to double
  br label %239

239:                                              ; preds = %236, %232
  %240 = phi contract double [ %235, %232 ], [ %238, %236 ]
  %241 = zext i32 %114 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %19, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !11
  %244 = fcmp contract ult float %243, %28
  br i1 %244, label %582, label %245

245:                                              ; preds = %239
  %246 = fdiv contract float %217, %12
  %247 = fdiv contract float %212, %11
  %248 = fptrunc double %240 to float
  %249 = zext i32 %118 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %23, i64 %249
  store float %247, float addrspace(1)* %250, align 4, !tbaa !11
  %251 = or i32 %118, 1
  %252 = zext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %23, i64 %252
  store float %246, float addrspace(1)* %253, align 4, !tbaa !11
  %254 = or i32 %118, 2
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %23, i64 %255
  store float %229, float addrspace(1)* %256, align 4, !tbaa !11
  %257 = or i32 %118, 3
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %23, i64 %258
  store float %248, float addrspace(1)* %259, align 4, !tbaa !11
  br i1 %9, label %260, label %419

260:                                              ; preds = %245
  %261 = icmp eq i32 %109, 0
  br i1 %261, label %283, label %262

262:                                              ; preds = %260
  %263 = and i32 %109, 7
  %264 = icmp ult i32 %111, 7
  br i1 %264, label %267, label %265

265:                                              ; preds = %262
  %266 = and i32 %109, -8
  br label %286

267:                                              ; preds = %286, %262
  %268 = phi i32 [ undef, %262 ], [ %328, %286 ]
  %269 = phi i32 [ 0, %262 ], [ %329, %286 ]
  %270 = phi i32 [ 0, %262 ], [ %328, %286 ]
  %271 = icmp eq i32 %263, 0
  br i1 %271, label %283, label %272

272:                                              ; preds = %267, %272
  %273 = phi i32 [ %280, %272 ], [ %269, %267 ]
  %274 = phi i32 [ %279, %272 ], [ %270, %267 ]
  %275 = phi i32 [ %281, %272 ], [ 0, %267 ]
  %276 = zext i32 %273 to i64
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %276
  %278 = load i32, i32 addrspace(1)* %277, align 4, !tbaa !7
  %279 = add i32 %278, %274
  %280 = add nuw nsw i32 %273, 1
  %281 = add i32 %275, 1
  %282 = icmp eq i32 %281, %263
  br i1 %282, label %283, label %272, !llvm.loop !15

283:                                              ; preds = %267, %272, %260
  %284 = phi i32 [ 0, %260 ], [ %268, %267 ], [ %279, %272 ]
  %285 = icmp ult i32 %109, %5
  br i1 %285, label %351, label %332

286:                                              ; preds = %286, %265
  %287 = phi i32 [ 0, %265 ], [ %329, %286 ]
  %288 = phi i32 [ 0, %265 ], [ %328, %286 ]
  %289 = phi i32 [ 0, %265 ], [ %330, %286 ]
  %290 = zext i32 %287 to i64
  %291 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %290
  %292 = load i32, i32 addrspace(1)* %291, align 4, !tbaa !7
  %293 = add i32 %292, %288
  %294 = or i32 %287, 1
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %295
  %297 = load i32, i32 addrspace(1)* %296, align 4, !tbaa !7
  %298 = add i32 %297, %293
  %299 = or i32 %287, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %300
  %302 = load i32, i32 addrspace(1)* %301, align 4, !tbaa !7
  %303 = add i32 %302, %298
  %304 = or i32 %287, 3
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !7
  %308 = add i32 %307, %303
  %309 = or i32 %287, 4
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %310
  %312 = load i32, i32 addrspace(1)* %311, align 4, !tbaa !7
  %313 = add i32 %312, %308
  %314 = or i32 %287, 5
  %315 = zext i32 %314 to i64
  %316 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %315
  %317 = load i32, i32 addrspace(1)* %316, align 4, !tbaa !7
  %318 = add i32 %317, %313
  %319 = or i32 %287, 6
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %320
  %322 = load i32, i32 addrspace(1)* %321, align 4, !tbaa !7
  %323 = add i32 %322, %318
  %324 = or i32 %287, 7
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %325
  %327 = load i32, i32 addrspace(1)* %326, align 4, !tbaa !7
  %328 = add i32 %327, %323
  %329 = add nuw nsw i32 %287, 8
  %330 = add i32 %289, 8
  %331 = icmp eq i32 %330, %266
  br i1 %331, label %267, label %286, !llvm.loop !17

332:                                              ; preds = %351, %283
  %333 = phi i32 [ %284, %283 ], [ %357, %351 ]
  %334 = zext i32 %109 to i64
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %334
  %336 = load i32, i32 addrspace(1)* %335, align 4, !tbaa !7
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %419, label %338

338:                                              ; preds = %332
  %339 = mul i32 %333, %102
  %340 = shl i32 %284, 1
  %341 = add i32 %339, %340
  %342 = shl i32 %109, 1
  %343 = add i32 %342, %103
  %344 = mul i32 %343, %6
  %345 = fpext float %122 to double
  %346 = fpext float %120 to double
  %347 = mul i32 %333, %77
  %348 = shl i32 %284, 2
  %349 = add i32 %347, %348
  %350 = mul i32 %114, %6
  br label %360

351:                                              ; preds = %283, %351
  %352 = phi i32 [ %358, %351 ], [ %109, %283 ]
  %353 = phi i32 [ %357, %351 ], [ %284, %283 ]
  %354 = sext i32 %352 to i64
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %354
  %356 = load i32, i32 addrspace(1)* %355, align 4, !tbaa !7
  %357 = add i32 %356, %353
  %358 = add nuw nsw i32 %352, 1
  %359 = icmp ult i32 %358, %5
  br i1 %359, label %351, label %332, !llvm.loop !18

360:                                              ; preds = %338, %360
  %361 = phi i32 [ 0, %338 ], [ %417, %360 ]
  %362 = shl i32 %361, 1
  %363 = add i32 %341, %362
  %364 = add i32 %362, %344
  %365 = zext i32 %363 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %20, i64 %365
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !11
  %368 = or i32 %363, 1
  %369 = zext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %20, i64 %369
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !11
  %372 = fpext float %367 to double
  %373 = fadd contract double %372, 5.000000e-01
  %374 = fmul contract double %373, %185
  %375 = fadd contract double %374, %345
  %376 = fdiv contract double %375, %101
  %377 = fptrunc double %376 to float
  %378 = zext i32 %364 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %25, i64 %378
  store float %377, float addrspace(1)* %379, align 4, !tbaa !11
  %380 = fpext float %371 to double
  %381 = fadd contract double %380, 5.000000e-01
  %382 = fmul contract double %381, %161
  %383 = fadd contract double %382, %346
  %384 = fdiv contract double %383, %100
  %385 = fptrunc double %384 to float
  %386 = or i32 %364, 1
  %387 = zext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %25, i64 %387
  store float %385, float addrspace(1)* %388, align 4, !tbaa !11
  %389 = shl i32 %361, 2
  %390 = add i32 %349, %389
  %391 = zext i32 %390 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %21, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !11
  %394 = or i32 %390, 1
  %395 = zext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %21, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !11
  %398 = fcmp contract ogt float %397, %393
  %399 = select i1 %398, float 1.000000e+00, float 0.000000e+00
  %400 = select i1 %398, float %397, float %393
  %401 = or i32 %390, 2
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %21, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !11
  %405 = fcmp contract ogt float %404, %400
  %406 = select i1 %405, float 2.000000e+00, float %399
  %407 = select i1 %405, float %404, float %400
  %408 = or i32 %390, 3
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %21, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !11
  %412 = fcmp contract ogt float %411, %407
  %413 = select i1 %412, float 3.000000e+00, float %406
  %414 = add i32 %361, %350
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %26, i64 %415
  store float %413, float addrspace(1)* %416, align 4, !tbaa !11
  %417 = add nuw i32 %361, 1
  %418 = icmp eq i32 %417, %336
  br i1 %418, label %419, label %360, !llvm.loop !19

419:                                              ; preds = %360, %332, %245
  br i1 %10, label %420, label %594

420:                                              ; preds = %419
  %421 = icmp eq i32 %109, 0
  br i1 %421, label %443, label %422

422:                                              ; preds = %420
  %423 = and i32 %109, 7
  %424 = icmp ult i32 %110, 7
  br i1 %424, label %427, label %425

425:                                              ; preds = %422
  %426 = and i32 %109, -8
  br label %446

427:                                              ; preds = %446, %422
  %428 = phi i32 [ undef, %422 ], [ %488, %446 ]
  %429 = phi i32 [ 0, %422 ], [ %489, %446 ]
  %430 = phi i32 [ 0, %422 ], [ %488, %446 ]
  %431 = icmp eq i32 %423, 0
  br i1 %431, label %443, label %432

432:                                              ; preds = %427, %432
  %433 = phi i32 [ %440, %432 ], [ %429, %427 ]
  %434 = phi i32 [ %439, %432 ], [ %430, %427 ]
  %435 = phi i32 [ %441, %432 ], [ 0, %427 ]
  %436 = zext i32 %433 to i64
  %437 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %436
  %438 = load i32, i32 addrspace(1)* %437, align 4, !tbaa !7
  %439 = add i32 %438, %434
  %440 = add nuw nsw i32 %433, 1
  %441 = add i32 %435, 1
  %442 = icmp eq i32 %441, %423
  br i1 %442, label %443, label %432, !llvm.loop !20

443:                                              ; preds = %427, %432, %420
  %444 = phi i32 [ 0, %420 ], [ %428, %427 ], [ %439, %432 ]
  %445 = icmp ult i32 %109, %5
  br i1 %445, label %505, label %492

446:                                              ; preds = %446, %425
  %447 = phi i32 [ 0, %425 ], [ %489, %446 ]
  %448 = phi i32 [ 0, %425 ], [ %488, %446 ]
  %449 = phi i32 [ 0, %425 ], [ %490, %446 ]
  %450 = zext i32 %447 to i64
  %451 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %450
  %452 = load i32, i32 addrspace(1)* %451, align 4, !tbaa !7
  %453 = add i32 %452, %448
  %454 = or i32 %447, 1
  %455 = zext i32 %454 to i64
  %456 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %455
  %457 = load i32, i32 addrspace(1)* %456, align 4, !tbaa !7
  %458 = add i32 %457, %453
  %459 = or i32 %447, 2
  %460 = zext i32 %459 to i64
  %461 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %460
  %462 = load i32, i32 addrspace(1)* %461, align 4, !tbaa !7
  %463 = add i32 %462, %458
  %464 = or i32 %447, 3
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %465
  %467 = load i32, i32 addrspace(1)* %466, align 4, !tbaa !7
  %468 = add i32 %467, %463
  %469 = or i32 %447, 4
  %470 = zext i32 %469 to i64
  %471 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %470
  %472 = load i32, i32 addrspace(1)* %471, align 4, !tbaa !7
  %473 = add i32 %472, %468
  %474 = or i32 %447, 5
  %475 = zext i32 %474 to i64
  %476 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %475
  %477 = load i32, i32 addrspace(1)* %476, align 4, !tbaa !7
  %478 = add i32 %477, %473
  %479 = or i32 %447, 6
  %480 = zext i32 %479 to i64
  %481 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %480
  %482 = load i32, i32 addrspace(1)* %481, align 4, !tbaa !7
  %483 = add i32 %482, %478
  %484 = or i32 %447, 7
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %485
  %487 = load i32, i32 addrspace(1)* %486, align 4, !tbaa !7
  %488 = add i32 %487, %483
  %489 = add nuw nsw i32 %447, 8
  %490 = add i32 %449, 8
  %491 = icmp eq i32 %490, %426
  br i1 %491, label %427, label %446, !llvm.loop !21

492:                                              ; preds = %505, %443
  %493 = phi i32 [ %444, %443 ], [ %511, %505 ]
  %494 = zext i32 %109 to i64
  %495 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %494
  %496 = load i32, i32 addrspace(1)* %495, align 4, !tbaa !7
  %497 = icmp eq i32 %496, 0
  br i1 %497, label %594, label %498

498:                                              ; preds = %492
  %499 = mul i32 %493, %104
  %500 = mul i32 %444, 3
  %501 = add i32 %499, %500
  %502 = mul i32 %109, 3
  %503 = add i32 %502, %105
  %504 = mul i32 %503, %7
  br label %514

505:                                              ; preds = %443, %505
  %506 = phi i32 [ %512, %505 ], [ %109, %443 ]
  %507 = phi i32 [ %511, %505 ], [ %444, %443 ]
  %508 = sext i32 %506 to i64
  %509 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %508
  %510 = load i32, i32 addrspace(1)* %509, align 4, !tbaa !7
  %511 = add i32 %510, %507
  %512 = add nuw nsw i32 %506, 1
  %513 = icmp ult i32 %512, %5
  br i1 %513, label %505, label %492, !llvm.loop !22

514:                                              ; preds = %498, %514
  %515 = phi i32 [ 0, %498 ], [ %580, %514 ]
  %516 = mul i32 %515, 3
  %517 = add i32 %501, %516
  %518 = add i32 %516, %504
  %519 = zext i32 %517 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %22, i64 %519
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !11
  %522 = fmul float %521, 0x3FF7154760000000
  %523 = tail call float @llvm.rint.f32(float %522)
  %524 = fcmp ogt float %521, 0x40562E4300000000
  %525 = fcmp olt float %521, 0xC059D1DA00000000
  %526 = fneg float %522
  %527 = tail call float @llvm.fma.f32(float %521, float 0x3FF7154760000000, float %526)
  %528 = tail call float @llvm.fma.f32(float %521, float 0x3E54AE0BE0000000, float %527)
  %529 = fsub float %522, %523
  %530 = fadd float %528, %529
  %531 = tail call float @llvm.exp2.f32(float %530)
  %532 = fptosi float %523 to i32
  %533 = tail call float @llvm.amdgcn.ldexp.f32(float %531, i32 %532)
  %534 = select i1 %525, float 0.000000e+00, float %533
  %535 = select i1 %524, float 0x7FF0000000000000, float %534
  %536 = add i32 %517, 1
  %537 = zext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %22, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !11
  %540 = fmul float %539, 0x3FF7154760000000
  %541 = tail call float @llvm.rint.f32(float %540)
  %542 = fcmp ogt float %539, 0x40562E4300000000
  %543 = fcmp olt float %539, 0xC059D1DA00000000
  %544 = fneg float %540
  %545 = tail call float @llvm.fma.f32(float %539, float 0x3FF7154760000000, float %544)
  %546 = tail call float @llvm.fma.f32(float %539, float 0x3E54AE0BE0000000, float %545)
  %547 = fsub float %540, %541
  %548 = fadd float %546, %547
  %549 = tail call float @llvm.exp2.f32(float %548)
  %550 = fptosi float %541 to i32
  %551 = tail call float @llvm.amdgcn.ldexp.f32(float %549, i32 %550)
  %552 = select i1 %543, float 0.000000e+00, float %551
  %553 = select i1 %542, float 0x7FF0000000000000, float %552
  %554 = add i32 %517, 2
  %555 = zext i32 %554 to i64
  %556 = getelementptr inbounds float, float addrspace(1)* %22, i64 %555
  %557 = load float, float addrspace(1)* %556, align 4, !tbaa !11
  %558 = fmul float %557, 0x3FF7154760000000
  %559 = tail call float @llvm.rint.f32(float %558)
  %560 = fcmp ogt float %557, 0x40562E4300000000
  %561 = fcmp olt float %557, 0xC059D1DA00000000
  %562 = fneg float %558
  %563 = tail call float @llvm.fma.f32(float %557, float 0x3FF7154760000000, float %562)
  %564 = tail call float @llvm.fma.f32(float %557, float 0x3E54AE0BE0000000, float %563)
  %565 = fsub float %558, %559
  %566 = fadd float %564, %565
  %567 = tail call float @llvm.exp2.f32(float %566)
  %568 = fptosi float %559 to i32
  %569 = tail call float @llvm.amdgcn.ldexp.f32(float %567, i32 %568)
  %570 = select i1 %561, float 0.000000e+00, float %569
  %571 = select i1 %560, float 0x7FF0000000000000, float %570
  %572 = zext i32 %518 to i64
  %573 = getelementptr inbounds float, float addrspace(1)* %27, i64 %572
  store float %535, float addrspace(1)* %573, align 4, !tbaa !11
  %574 = add i32 %518, 1
  %575 = zext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %27, i64 %575
  store float %553, float addrspace(1)* %576, align 4, !tbaa !11
  %577 = add i32 %518, 2
  %578 = zext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %27, i64 %578
  store float %571, float addrspace(1)* %579, align 4, !tbaa !11
  %580 = add nuw i32 %515, 1
  %581 = icmp eq i32 %580, %496
  br i1 %581, label %594, label %514, !llvm.loop !23

582:                                              ; preds = %239
  %583 = zext i32 %118 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %23, i64 %583
  store float 0.000000e+00, float addrspace(1)* %584, align 4, !tbaa !11
  %585 = or i32 %118, 1
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, float addrspace(1)* %23, i64 %586
  store float 0.000000e+00, float addrspace(1)* %587, align 4, !tbaa !11
  %588 = or i32 %118, 2
  %589 = zext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %23, i64 %589
  store float 0.000000e+00, float addrspace(1)* %590, align 4, !tbaa !11
  %591 = or i32 %118, 3
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds float, float addrspace(1)* %23, i64 %592
  store float 0.000000e+00, float addrspace(1)* %593, align 4, !tbaa !11
  br label %594

594:                                              ; preds = %514, %492, %419, %582
  %595 = add nuw i32 %109, 1
  %596 = icmp ult i32 %595, %72
  %597 = add i32 %108, 1
  br i1 %596, label %107, label %598, !llvm.loop !24

598:                                              ; preds = %594, %71, %29
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
