; ModuleID = '../data/hip_kernels/15412/107/main.cu'
source_filename = "../data/hip_kernels/15412/107/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28sway_and_flip_weights_kernelPKfPfiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %4, %4
  %18 = mul nsw i32 %16, %17
  %19 = sdiv i32 %2, %17
  %20 = sdiv i32 %19, 4
  %21 = sdiv i32 %16, %20
  %22 = icmp slt i32 %18, %2
  br i1 %22, label %23, label %735

23:                                               ; preds = %7
  %24 = icmp eq i32 %21, 0
  br i1 %24, label %25, label %114

25:                                               ; preds = %23
  %26 = icmp sgt i32 %4, 0
  br i1 %26, label %27, label %735

27:                                               ; preds = %25
  %28 = add i32 %4, -1
  %29 = and i32 %4, 7
  %30 = icmp ult i32 %28, 7
  %31 = and i32 %4, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %27, %50
  %34 = phi i32 [ %51, %50 ], [ 0, %27 ]
  %35 = add i32 %34, %18
  br i1 %30, label %36, label %53

36:                                               ; preds = %53, %33
  %37 = phi i32 [ 0, %33 ], [ %111, %53 ]
  br i1 %32, label %50, label %38

38:                                               ; preds = %36, %38
  %39 = phi i32 [ %47, %38 ], [ %37, %36 ]
  %40 = phi i32 [ %48, %38 ], [ 0, %36 ]
  %41 = mul nsw i32 %39, %4
  %42 = add i32 %35, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %45, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = add nuw nsw i32 %39, 1
  %48 = add i32 %40, 1
  %49 = icmp eq i32 %48, %29
  br i1 %49, label %50, label %38, !llvm.loop !11

50:                                               ; preds = %38, %36
  %51 = add nuw nsw i32 %34, 1
  %52 = icmp eq i32 %51, %4
  br i1 %52, label %735, label %33, !llvm.loop !13

53:                                               ; preds = %33, %53
  %54 = phi i32 [ %111, %53 ], [ 0, %33 ]
  %55 = phi i32 [ %112, %53 ], [ 0, %33 ]
  %56 = mul nsw i32 %54, %4
  %57 = add i32 %35, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %54, 1
  %63 = mul nsw i32 %62, %4
  %64 = add i32 %35, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  store float %67, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i32 %54, 2
  %70 = mul nsw i32 %69, %4
  %71 = add i32 %35, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %74, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = or i32 %54, 3
  %77 = mul nsw i32 %76, %4
  %78 = add i32 %35, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  store float %81, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = or i32 %54, 4
  %84 = mul nsw i32 %83, %4
  %85 = add i32 %35, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  store float %88, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = or i32 %54, 5
  %91 = mul nsw i32 %90, %4
  %92 = add i32 %35, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  store float %95, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = or i32 %54, 6
  %98 = mul nsw i32 %97, %4
  %99 = add i32 %35, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %102, float addrspace(1)* %103, align 4, !tbaa !7
  %104 = or i32 %54, 7
  %105 = mul nsw i32 %104, %4
  %106 = add i32 %35, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %109, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = add nuw nsw i32 %54, 8
  %112 = add i32 %55, 8
  %113 = icmp eq i32 %112, %31
  br i1 %113, label %36, label %53, !llvm.loop !15

114:                                              ; preds = %23
  %115 = icmp ult i32 %21, 3
  br i1 %115, label %116, label %632

116:                                              ; preds = %114
  %117 = icmp eq i32 %21, 2
  %118 = sub nsw i32 0, %5
  %119 = select i1 %117, i32 %118, i32 %5
  %120 = icmp eq i32 %6, 0
  %121 = sub nsw i32 0, %119
  %122 = select i1 %120, i32 %119, i32 %121
  %123 = sitofp i32 %122 to double
  %124 = fmul contract double %123, 0x400921FB53C8D4F1
  %125 = fdiv contract double %124, 1.800000e+02
  %126 = fptrunc double %125 to float
  %127 = tail call float @llvm.fabs.f32(float %126)
  %128 = fcmp olt float %127, 1.310720e+05
  br i1 %128, label %129, label %136

129:                                              ; preds = %116
  %130 = fmul float %127, 0x3FE45F3060000000
  %131 = tail call float @llvm.rint.f32(float %130)
  %132 = tail call float @llvm.fma.f32(float %131, float 0xBFF921FB40000000, float %127)
  %133 = tail call float @llvm.fma.f32(float %131, float 0xBE74442D00000000, float %132)
  %134 = tail call float @llvm.fma.f32(float %131, float 0xBCF8469880000000, float %133)
  %135 = fptosi float %131 to i32
  br label %242

136:                                              ; preds = %116
  %137 = bitcast float %127 to i32
  %138 = lshr i32 %137, 23
  %139 = and i32 %137, 8388607
  %140 = or i32 %139, 8388608
  %141 = zext i32 %140 to i64
  %142 = mul nuw nsw i64 %141, 4266746795
  %143 = trunc i64 %142 to i32
  %144 = lshr i64 %142, 32
  %145 = mul nuw nsw i64 %141, 1011060801
  %146 = add nuw nsw i64 %144, %145
  %147 = trunc i64 %146 to i32
  %148 = lshr i64 %146, 32
  %149 = mul nuw nsw i64 %141, 3680671129
  %150 = add nuw nsw i64 %148, %149
  %151 = trunc i64 %150 to i32
  %152 = lshr i64 %150, 32
  %153 = mul nuw nsw i64 %141, 4113882560
  %154 = add nuw nsw i64 %152, %153
  %155 = trunc i64 %154 to i32
  %156 = lshr i64 %154, 32
  %157 = mul nuw nsw i64 %141, 4230436817
  %158 = add nuw nsw i64 %156, %157
  %159 = trunc i64 %158 to i32
  %160 = lshr i64 %158, 32
  %161 = mul nuw nsw i64 %141, 1313084713
  %162 = add nuw nsw i64 %160, %161
  %163 = trunc i64 %162 to i32
  %164 = lshr i64 %162, 32
  %165 = mul nuw nsw i64 %141, 2734261102
  %166 = add nuw nsw i64 %164, %165
  %167 = trunc i64 %166 to i32
  %168 = lshr i64 %166, 32
  %169 = trunc i64 %168 to i32
  %170 = add nsw i32 %138, -120
  %171 = icmp ugt i32 %170, 63
  %172 = select i1 %171, i32 %163, i32 %169
  %173 = select i1 %171, i32 %159, i32 %167
  %174 = select i1 %171, i32 %155, i32 %163
  %175 = select i1 %171, i32 %151, i32 %159
  %176 = select i1 %171, i32 %147, i32 %155
  %177 = select i1 %171, i32 %143, i32 %151
  %178 = select i1 %171, i32 -64, i32 0
  %179 = add nsw i32 %178, %170
  %180 = icmp ugt i32 %179, 31
  %181 = select i1 %180, i32 %173, i32 %172
  %182 = select i1 %180, i32 %174, i32 %173
  %183 = select i1 %180, i32 %175, i32 %174
  %184 = select i1 %180, i32 %176, i32 %175
  %185 = select i1 %180, i32 %177, i32 %176
  %186 = select i1 %180, i32 -32, i32 0
  %187 = add nsw i32 %186, %179
  %188 = icmp ugt i32 %187, 31
  %189 = select i1 %188, i32 %182, i32 %181
  %190 = select i1 %188, i32 %183, i32 %182
  %191 = select i1 %188, i32 %184, i32 %183
  %192 = select i1 %188, i32 %185, i32 %184
  %193 = select i1 %188, i32 -32, i32 0
  %194 = add nsw i32 %193, %187
  %195 = icmp eq i32 %194, 0
  %196 = sub nsw i32 32, %194
  %197 = tail call i32 @llvm.fshr.i32(i32 %189, i32 %190, i32 %196)
  %198 = tail call i32 @llvm.fshr.i32(i32 %190, i32 %191, i32 %196)
  %199 = tail call i32 @llvm.fshr.i32(i32 %191, i32 %192, i32 %196)
  %200 = select i1 %195, i32 %189, i32 %197
  %201 = select i1 %195, i32 %190, i32 %198
  %202 = select i1 %195, i32 %191, i32 %199
  %203 = lshr i32 %200, 29
  %204 = tail call i32 @llvm.fshl.i32(i32 %200, i32 %201, i32 2)
  %205 = tail call i32 @llvm.fshl.i32(i32 %201, i32 %202, i32 2)
  %206 = tail call i32 @llvm.fshl.i32(i32 %202, i32 %192, i32 2)
  %207 = and i32 %203, 1
  %208 = sub nsw i32 0, %207
  %209 = shl i32 %203, 31
  %210 = xor i32 %204, %208
  %211 = xor i32 %205, %208
  %212 = xor i32 %206, %208
  %213 = tail call i32 @llvm.ctlz.i32(i32 %210, i1 false), !range !16
  %214 = sub nsw i32 31, %213
  %215 = tail call i32 @llvm.fshr.i32(i32 %210, i32 %211, i32 %214)
  %216 = tail call i32 @llvm.fshr.i32(i32 %211, i32 %212, i32 %214)
  %217 = shl nuw nsw i32 %213, 23
  %218 = sub nuw nsw i32 1056964608, %217
  %219 = lshr i32 %215, 9
  %220 = or i32 %219, %218
  %221 = or i32 %220, %209
  %222 = bitcast i32 %221 to float
  %223 = tail call i32 @llvm.fshl.i32(i32 %215, i32 %216, i32 23)
  %224 = tail call i32 @llvm.ctlz.i32(i32 %223, i1 false), !range !16
  %225 = fmul float %222, 0x3FF921FB40000000
  %226 = add nuw nsw i32 %224, %213
  %227 = shl nuw nsw i32 %226, 23
  %228 = sub nuw nsw i32 855638016, %227
  %229 = sub nsw i32 31, %224
  %230 = tail call i32 @llvm.fshr.i32(i32 %223, i32 %216, i32 %229)
  %231 = lshr i32 %230, 9
  %232 = or i32 %228, %231
  %233 = or i32 %232, %209
  %234 = bitcast i32 %233 to float
  %235 = fneg float %225
  %236 = tail call float @llvm.fma.f32(float %222, float 0x3FF921FB40000000, float %235)
  %237 = tail call float @llvm.fma.f32(float %222, float 0x3E74442D00000000, float %236)
  %238 = tail call float @llvm.fma.f32(float %234, float 0x3FF921FB40000000, float %237)
  %239 = fadd float %225, %238
  %240 = lshr i32 %200, 30
  %241 = add nuw nsw i32 %207, %240
  br label %242

242:                                              ; preds = %129, %136
  %243 = phi float [ %134, %129 ], [ %239, %136 ]
  %244 = phi i32 [ %135, %129 ], [ %241, %136 ]
  %245 = fmul float %243, %243
  %246 = tail call float @llvm.fmuladd.f32(float %245, float 0xBF29833040000000, float 0x3F81103880000000)
  %247 = tail call float @llvm.fmuladd.f32(float %245, float %246, float 0xBFC55553A0000000)
  %248 = fmul float %245, %247
  %249 = tail call float @llvm.fmuladd.f32(float %243, float %248, float %243)
  %250 = tail call float @llvm.fmuladd.f32(float %245, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %251 = tail call float @llvm.fmuladd.f32(float %245, float %250, float 0x3FA5557EE0000000)
  %252 = tail call float @llvm.fmuladd.f32(float %245, float %251, float 0xBFE0000080000000)
  %253 = tail call float @llvm.fmuladd.f32(float %245, float %252, float 1.000000e+00)
  %254 = fneg float %249
  %255 = and i32 %244, 1
  %256 = icmp eq i32 %255, 0
  %257 = select i1 %256, float %253, float %254
  %258 = bitcast float %257 to i32
  %259 = shl i32 %244, 30
  %260 = and i32 %259, -2147483648
  %261 = xor i32 %260, %258
  %262 = bitcast i32 %261 to float
  %263 = tail call i1 @llvm.amdgcn.class.f32(float %127, i32 504)
  %264 = select i1 %263, float %262, float 0x7FF8000000000000
  br i1 %128, label %265, label %273

265:                                              ; preds = %242
  %266 = fmul float %127, 0x3FE45F3060000000
  %267 = tail call float @llvm.rint.f32(float %266)
  %268 = tail call float @llvm.fma.f32(float %267, float 0xBFF921FB40000000, float %127)
  %269 = tail call float @llvm.fma.f32(float %267, float 0xBE74442D00000000, float %268)
  %270 = tail call float @llvm.fma.f32(float %267, float 0xBCF8469880000000, float %269)
  %271 = fptosi float %267 to i32
  %272 = bitcast float %127 to i32
  br label %379

273:                                              ; preds = %242
  %274 = bitcast float %127 to i32
  %275 = lshr i32 %274, 23
  %276 = and i32 %274, 8388607
  %277 = or i32 %276, 8388608
  %278 = zext i32 %277 to i64
  %279 = mul nuw nsw i64 %278, 4266746795
  %280 = trunc i64 %279 to i32
  %281 = lshr i64 %279, 32
  %282 = mul nuw nsw i64 %278, 1011060801
  %283 = add nuw nsw i64 %281, %282
  %284 = trunc i64 %283 to i32
  %285 = lshr i64 %283, 32
  %286 = mul nuw nsw i64 %278, 3680671129
  %287 = add nuw nsw i64 %285, %286
  %288 = trunc i64 %287 to i32
  %289 = lshr i64 %287, 32
  %290 = mul nuw nsw i64 %278, 4113882560
  %291 = add nuw nsw i64 %289, %290
  %292 = trunc i64 %291 to i32
  %293 = lshr i64 %291, 32
  %294 = mul nuw nsw i64 %278, 4230436817
  %295 = add nuw nsw i64 %293, %294
  %296 = trunc i64 %295 to i32
  %297 = lshr i64 %295, 32
  %298 = mul nuw nsw i64 %278, 1313084713
  %299 = add nuw nsw i64 %297, %298
  %300 = trunc i64 %299 to i32
  %301 = lshr i64 %299, 32
  %302 = mul nuw nsw i64 %278, 2734261102
  %303 = add nuw nsw i64 %301, %302
  %304 = trunc i64 %303 to i32
  %305 = lshr i64 %303, 32
  %306 = trunc i64 %305 to i32
  %307 = add nsw i32 %275, -120
  %308 = icmp ugt i32 %307, 63
  %309 = select i1 %308, i32 %300, i32 %306
  %310 = select i1 %308, i32 %296, i32 %304
  %311 = select i1 %308, i32 %292, i32 %300
  %312 = select i1 %308, i32 %288, i32 %296
  %313 = select i1 %308, i32 %284, i32 %292
  %314 = select i1 %308, i32 %280, i32 %288
  %315 = select i1 %308, i32 -64, i32 0
  %316 = add nsw i32 %315, %307
  %317 = icmp ugt i32 %316, 31
  %318 = select i1 %317, i32 %310, i32 %309
  %319 = select i1 %317, i32 %311, i32 %310
  %320 = select i1 %317, i32 %312, i32 %311
  %321 = select i1 %317, i32 %313, i32 %312
  %322 = select i1 %317, i32 %314, i32 %313
  %323 = select i1 %317, i32 -32, i32 0
  %324 = add nsw i32 %323, %316
  %325 = icmp ugt i32 %324, 31
  %326 = select i1 %325, i32 %319, i32 %318
  %327 = select i1 %325, i32 %320, i32 %319
  %328 = select i1 %325, i32 %321, i32 %320
  %329 = select i1 %325, i32 %322, i32 %321
  %330 = select i1 %325, i32 -32, i32 0
  %331 = add nsw i32 %330, %324
  %332 = icmp eq i32 %331, 0
  %333 = sub nsw i32 32, %331
  %334 = tail call i32 @llvm.fshr.i32(i32 %326, i32 %327, i32 %333)
  %335 = tail call i32 @llvm.fshr.i32(i32 %327, i32 %328, i32 %333)
  %336 = tail call i32 @llvm.fshr.i32(i32 %328, i32 %329, i32 %333)
  %337 = select i1 %332, i32 %326, i32 %334
  %338 = select i1 %332, i32 %327, i32 %335
  %339 = select i1 %332, i32 %328, i32 %336
  %340 = lshr i32 %337, 29
  %341 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %338, i32 2)
  %342 = tail call i32 @llvm.fshl.i32(i32 %338, i32 %339, i32 2)
  %343 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %329, i32 2)
  %344 = and i32 %340, 1
  %345 = sub nsw i32 0, %344
  %346 = shl i32 %340, 31
  %347 = xor i32 %341, %345
  %348 = xor i32 %342, %345
  %349 = xor i32 %343, %345
  %350 = tail call i32 @llvm.ctlz.i32(i32 %347, i1 false), !range !16
  %351 = sub nsw i32 31, %350
  %352 = tail call i32 @llvm.fshr.i32(i32 %347, i32 %348, i32 %351)
  %353 = tail call i32 @llvm.fshr.i32(i32 %348, i32 %349, i32 %351)
  %354 = shl nuw nsw i32 %350, 23
  %355 = sub nuw nsw i32 1056964608, %354
  %356 = lshr i32 %352, 9
  %357 = or i32 %356, %355
  %358 = or i32 %357, %346
  %359 = bitcast i32 %358 to float
  %360 = tail call i32 @llvm.fshl.i32(i32 %352, i32 %353, i32 23)
  %361 = tail call i32 @llvm.ctlz.i32(i32 %360, i1 false), !range !16
  %362 = fmul float %359, 0x3FF921FB40000000
  %363 = add nuw nsw i32 %361, %350
  %364 = shl nuw nsw i32 %363, 23
  %365 = sub nuw nsw i32 855638016, %364
  %366 = sub nsw i32 31, %361
  %367 = tail call i32 @llvm.fshr.i32(i32 %360, i32 %353, i32 %366)
  %368 = lshr i32 %367, 9
  %369 = or i32 %365, %368
  %370 = or i32 %369, %346
  %371 = bitcast i32 %370 to float
  %372 = fneg float %362
  %373 = tail call float @llvm.fma.f32(float %359, float 0x3FF921FB40000000, float %372)
  %374 = tail call float @llvm.fma.f32(float %359, float 0x3E74442D00000000, float %373)
  %375 = tail call float @llvm.fma.f32(float %371, float 0x3FF921FB40000000, float %374)
  %376 = fadd float %362, %375
  %377 = lshr i32 %337, 30
  %378 = add nuw nsw i32 %344, %377
  br label %379

379:                                              ; preds = %265, %273
  %380 = phi i32 [ %272, %265 ], [ %274, %273 ]
  %381 = phi float [ %270, %265 ], [ %376, %273 ]
  %382 = phi i32 [ %271, %265 ], [ %378, %273 ]
  %383 = fmul float %381, %381
  %384 = tail call float @llvm.fmuladd.f32(float %383, float 0xBF29833040000000, float 0x3F81103880000000)
  %385 = tail call float @llvm.fmuladd.f32(float %383, float %384, float 0xBFC55553A0000000)
  %386 = fmul float %383, %385
  %387 = tail call float @llvm.fmuladd.f32(float %381, float %386, float %381)
  %388 = tail call float @llvm.fmuladd.f32(float %383, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %389 = tail call float @llvm.fmuladd.f32(float %383, float %388, float 0x3FA5557EE0000000)
  %390 = tail call float @llvm.fmuladd.f32(float %383, float %389, float 0xBFE0000080000000)
  %391 = tail call float @llvm.fmuladd.f32(float %383, float %390, float 1.000000e+00)
  %392 = and i32 %382, 1
  %393 = icmp eq i32 %392, 0
  %394 = select i1 %393, float %387, float %391
  %395 = bitcast float %394 to i32
  %396 = shl i32 %382, 30
  %397 = and i32 %396, -2147483648
  %398 = bitcast float %126 to i32
  %399 = xor i32 %380, %398
  %400 = xor i32 %399, %397
  %401 = xor i32 %400, %395
  %402 = bitcast i32 %401 to float
  %403 = select i1 %263, float %402, float 0x7FF8000000000000
  %404 = sdiv i32 %4, 2
  %405 = icmp sgt i32 %4, 0
  br i1 %405, label %406, label %417

406:                                              ; preds = %379
  %407 = sitofp i32 %404 to float
  br label %408

408:                                              ; preds = %406, %428
  %409 = phi float [ 0.000000e+00, %406 ], [ %552, %428 ]
  %410 = phi i32 [ 0, %406 ], [ %429, %428 ]
  %411 = sub nsw i32 %410, %404
  %412 = sitofp i32 %411 to float
  %413 = fmul contract float %403, %412
  %414 = fmul contract float %264, %412
  %415 = mul nsw i32 %410, %4
  %416 = add i32 %415, %18
  br label %431

417:                                              ; preds = %428, %379
  %418 = phi float [ 0.000000e+00, %379 ], [ %552, %428 ]
  %419 = sitofp i32 %17 to float
  %420 = fsub contract float %419, %418
  %421 = fdiv contract float %419, %420
  br i1 %405, label %422, label %735

422:                                              ; preds = %417
  %423 = add i32 %4, -1
  %424 = and i32 %4, 7
  %425 = icmp ult i32 %423, 7
  %426 = and i32 %4, -8
  %427 = icmp eq i32 %424, 0
  br label %559

428:                                              ; preds = %551
  %429 = add nuw nsw i32 %410, 1
  %430 = icmp eq i32 %429, %4
  br i1 %430, label %417, label %408, !llvm.loop !17

431:                                              ; preds = %408, %551
  %432 = phi float [ %409, %408 ], [ %552, %551 ]
  %433 = phi i32 [ 0, %408 ], [ %557, %551 ]
  %434 = sub nsw i32 %433, %404
  %435 = sitofp i32 %434 to float
  %436 = fmul contract float %264, %435
  %437 = fadd contract float %436, %407
  %438 = fadd contract float %413, %437
  %439 = fmul contract float %403, %435
  %440 = fsub contract float %407, %439
  %441 = fadd contract float %414, %440
  %442 = tail call float @llvm.floor.f32(float %438)
  %443 = fptosi float %442 to i32
  %444 = tail call float @llvm.ceil.f32(float %438)
  %445 = fptosi float %444 to i32
  %446 = icmp eq i32 %443, %445
  %447 = add nsw i32 %443, 1
  %448 = select i1 %446, i32 %447, i32 %445
  %449 = tail call float @llvm.floor.f32(float %441)
  %450 = fptosi float %449 to i32
  %451 = tail call float @llvm.ceil.f32(float %441)
  %452 = fptosi float %451 to i32
  %453 = icmp eq i32 %450, %452
  %454 = add nsw i32 %450, 1
  %455 = select i1 %453, i32 %454, i32 %452
  %456 = sitofp i32 %448 to float
  %457 = fsub contract float %456, %438
  %458 = sitofp i32 %443 to float
  %459 = fsub contract float %438, %458
  %460 = sitofp i32 %455 to float
  %461 = fsub contract float %460, %441
  %462 = sitofp i32 %450 to float
  %463 = fsub contract float %441, %462
  %464 = icmp sgt i32 %443, -1
  br i1 %464, label %465, label %481

465:                                              ; preds = %431
  %466 = icmp slt i32 %443, %4
  %467 = icmp sgt i32 %450, -1
  %468 = select i1 %466, i1 %467, i1 false
  %469 = icmp slt i32 %450, %4
  %470 = select i1 %468, i1 %469, i1 false
  br i1 %470, label %471, label %481

471:                                              ; preds = %465
  %472 = mul nsw i32 %450, %4
  %473 = add i32 %18, %443
  %474 = add i32 %473, %472
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !7
  %478 = fmul contract float %457, %477
  %479 = fmul contract float %461, %478
  %480 = fadd contract float %479, 0.000000e+00
  br label %484

481:                                              ; preds = %465, %431
  %482 = fmul contract float %457, %461
  %483 = fadd contract float %432, %482
  br label %484

484:                                              ; preds = %481, %471
  %485 = phi float [ %432, %471 ], [ %483, %481 ]
  %486 = phi float [ %480, %471 ], [ 0.000000e+00, %481 ]
  %487 = icmp sgt i32 %448, -1
  br i1 %487, label %488, label %504

488:                                              ; preds = %484
  %489 = icmp slt i32 %448, %4
  %490 = icmp sgt i32 %450, -1
  %491 = select i1 %489, i1 %490, i1 false
  %492 = icmp slt i32 %450, %4
  %493 = select i1 %491, i1 %492, i1 false
  br i1 %493, label %494, label %504

494:                                              ; preds = %488
  %495 = mul nsw i32 %450, %4
  %496 = add i32 %448, %18
  %497 = add i32 %496, %495
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds float, float addrspace(1)* %0, i64 %498
  %500 = load float, float addrspace(1)* %499, align 4, !tbaa !7
  %501 = fmul contract float %459, %500
  %502 = fmul contract float %461, %501
  %503 = fadd contract float %486, %502
  br label %507

504:                                              ; preds = %488, %484
  %505 = fmul contract float %459, %461
  %506 = fadd contract float %505, %485
  br label %507

507:                                              ; preds = %504, %494
  %508 = phi float [ %485, %494 ], [ %506, %504 ]
  %509 = phi float [ %503, %494 ], [ %486, %504 ]
  br i1 %464, label %510, label %526

510:                                              ; preds = %507
  %511 = icmp slt i32 %443, %4
  %512 = icmp sgt i32 %455, -1
  %513 = select i1 %511, i1 %512, i1 false
  %514 = icmp slt i32 %455, %4
  %515 = select i1 %513, i1 %514, i1 false
  br i1 %515, label %516, label %526

516:                                              ; preds = %510
  %517 = mul nsw i32 %455, %4
  %518 = add i32 %18, %443
  %519 = add i32 %518, %517
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds float, float addrspace(1)* %0, i64 %520
  %522 = load float, float addrspace(1)* %521, align 4, !tbaa !7
  %523 = fmul contract float %457, %522
  %524 = fmul contract float %463, %523
  %525 = fadd contract float %509, %524
  br label %529

526:                                              ; preds = %510, %507
  %527 = fmul contract float %463, %457
  %528 = fadd contract float %527, %508
  br label %529

529:                                              ; preds = %526, %516
  %530 = phi float [ %508, %516 ], [ %528, %526 ]
  %531 = phi float [ %525, %516 ], [ %509, %526 ]
  br i1 %487, label %532, label %548

532:                                              ; preds = %529
  %533 = icmp slt i32 %448, %4
  %534 = icmp sgt i32 %455, -1
  %535 = select i1 %533, i1 %534, i1 false
  %536 = icmp slt i32 %455, %4
  %537 = select i1 %535, i1 %536, i1 false
  br i1 %537, label %538, label %548

538:                                              ; preds = %532
  %539 = mul nsw i32 %455, %4
  %540 = add i32 %448, %18
  %541 = add i32 %540, %539
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds float, float addrspace(1)* %0, i64 %542
  %544 = load float, float addrspace(1)* %543, align 4, !tbaa !7
  %545 = fmul contract float %459, %544
  %546 = fmul contract float %463, %545
  %547 = fadd contract float %531, %546
  br label %551

548:                                              ; preds = %532, %529
  %549 = fmul contract float %459, %463
  %550 = fadd contract float %549, %530
  br label %551

551:                                              ; preds = %548, %538
  %552 = phi float [ %530, %538 ], [ %550, %548 ]
  %553 = phi float [ %547, %538 ], [ %531, %548 ]
  %554 = add i32 %416, %433
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds float, float addrspace(1)* %1, i64 %555
  store float %553, float addrspace(1)* %556, align 4, !tbaa !7
  %557 = add nuw nsw i32 %433, 1
  %558 = icmp eq i32 %557, %4
  br i1 %558, label %428, label %431, !llvm.loop !18

559:                                              ; preds = %422, %576
  %560 = phi i32 [ %577, %576 ], [ 0, %422 ]
  %561 = mul nsw i32 %560, %4
  %562 = add i32 %561, %18
  br i1 %425, label %563, label %579

563:                                              ; preds = %579, %559
  %564 = phi i32 [ 0, %559 ], [ %629, %579 ]
  br i1 %427, label %576, label %565

565:                                              ; preds = %563, %565
  %566 = phi i32 [ %573, %565 ], [ %564, %563 ]
  %567 = phi i32 [ %574, %565 ], [ 0, %563 ]
  %568 = add i32 %562, %566
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds float, float addrspace(1)* %1, i64 %569
  %571 = load float, float addrspace(1)* %570, align 4, !tbaa !7
  %572 = fmul contract float %421, %571
  store float %572, float addrspace(1)* %570, align 4, !tbaa !7
  %573 = add nuw nsw i32 %566, 1
  %574 = add i32 %567, 1
  %575 = icmp eq i32 %574, %424
  br i1 %575, label %576, label %565, !llvm.loop !19

576:                                              ; preds = %565, %563
  %577 = add nuw nsw i32 %560, 1
  %578 = icmp eq i32 %577, %4
  br i1 %578, label %735, label %559, !llvm.loop !20

579:                                              ; preds = %559, %579
  %580 = phi i32 [ %629, %579 ], [ 0, %559 ]
  %581 = phi i32 [ %630, %579 ], [ 0, %559 ]
  %582 = add i32 %562, %580
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %1, i64 %583
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !7
  %586 = fmul contract float %421, %585
  store float %586, float addrspace(1)* %584, align 4, !tbaa !7
  %587 = or i32 %580, 1
  %588 = add i32 %562, %587
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %1, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !7
  %592 = fmul contract float %421, %591
  store float %592, float addrspace(1)* %590, align 4, !tbaa !7
  %593 = or i32 %580, 2
  %594 = add i32 %562, %593
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds float, float addrspace(1)* %1, i64 %595
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !7
  %598 = fmul contract float %421, %597
  store float %598, float addrspace(1)* %596, align 4, !tbaa !7
  %599 = or i32 %580, 3
  %600 = add i32 %562, %599
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds float, float addrspace(1)* %1, i64 %601
  %603 = load float, float addrspace(1)* %602, align 4, !tbaa !7
  %604 = fmul contract float %421, %603
  store float %604, float addrspace(1)* %602, align 4, !tbaa !7
  %605 = or i32 %580, 4
  %606 = add i32 %562, %605
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds float, float addrspace(1)* %1, i64 %607
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !7
  %610 = fmul contract float %421, %609
  store float %610, float addrspace(1)* %608, align 4, !tbaa !7
  %611 = or i32 %580, 5
  %612 = add i32 %562, %611
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %1, i64 %613
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !7
  %616 = fmul contract float %421, %615
  store float %616, float addrspace(1)* %614, align 4, !tbaa !7
  %617 = or i32 %580, 6
  %618 = add i32 %562, %617
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds float, float addrspace(1)* %1, i64 %619
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !7
  %622 = fmul contract float %421, %621
  store float %622, float addrspace(1)* %620, align 4, !tbaa !7
  %623 = or i32 %580, 7
  %624 = add i32 %562, %623
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %1, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !7
  %628 = fmul contract float %421, %627
  store float %628, float addrspace(1)* %626, align 4, !tbaa !7
  %629 = add nuw nsw i32 %580, 8
  %630 = add i32 %581, 8
  %631 = icmp eq i32 %630, %426
  br i1 %631, label %563, label %579, !llvm.loop !21

632:                                              ; preds = %114
  %633 = icmp eq i32 %21, 3
  %634 = icmp sgt i32 %4, 0
  %635 = select i1 %633, i1 %634, i1 false
  br i1 %635, label %636, label %735

636:                                              ; preds = %632
  %637 = add i32 %4, -1
  %638 = and i32 %4, 7
  %639 = icmp ult i32 %637, 7
  %640 = and i32 %4, -8
  %641 = icmp eq i32 %638, 0
  br label %642

642:                                              ; preds = %636, %663
  %643 = phi i32 [ %664, %663 ], [ 0, %636 ]
  %644 = mul nsw i32 %643, %4
  %645 = add i32 %644, %18
  %646 = add nsw i32 %645, -1
  %647 = add i32 %646, %4
  br i1 %639, label %648, label %666

648:                                              ; preds = %666, %642
  %649 = phi i32 [ 0, %642 ], [ %732, %666 ]
  br i1 %641, label %663, label %650

650:                                              ; preds = %648, %650
  %651 = phi i32 [ %660, %650 ], [ %649, %648 ]
  %652 = phi i32 [ %661, %650 ], [ 0, %648 ]
  %653 = add i32 %645, %651
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds float, float addrspace(1)* %0, i64 %654
  %656 = load float, float addrspace(1)* %655, align 4, !tbaa !7
  %657 = sub i32 %647, %651
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %1, i64 %658
  store float %656, float addrspace(1)* %659, align 4, !tbaa !7
  %660 = add nuw nsw i32 %651, 1
  %661 = add i32 %652, 1
  %662 = icmp eq i32 %661, %638
  br i1 %662, label %663, label %650, !llvm.loop !22

663:                                              ; preds = %650, %648
  %664 = add nuw nsw i32 %643, 1
  %665 = icmp eq i32 %664, %4
  br i1 %665, label %735, label %642, !llvm.loop !23

666:                                              ; preds = %642, %666
  %667 = phi i32 [ %732, %666 ], [ 0, %642 ]
  %668 = phi i32 [ %733, %666 ], [ 0, %642 ]
  %669 = add i32 %645, %667
  %670 = sext i32 %669 to i64
  %671 = getelementptr inbounds float, float addrspace(1)* %0, i64 %670
  %672 = load float, float addrspace(1)* %671, align 4, !tbaa !7
  %673 = sub i32 %647, %667
  %674 = sext i32 %673 to i64
  %675 = getelementptr inbounds float, float addrspace(1)* %1, i64 %674
  store float %672, float addrspace(1)* %675, align 4, !tbaa !7
  %676 = or i32 %667, 1
  %677 = add i32 %645, %676
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds float, float addrspace(1)* %0, i64 %678
  %680 = load float, float addrspace(1)* %679, align 4, !tbaa !7
  %681 = sub i32 %647, %676
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds float, float addrspace(1)* %1, i64 %682
  store float %680, float addrspace(1)* %683, align 4, !tbaa !7
  %684 = or i32 %667, 2
  %685 = add i32 %645, %684
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds float, float addrspace(1)* %0, i64 %686
  %688 = load float, float addrspace(1)* %687, align 4, !tbaa !7
  %689 = sub i32 %647, %684
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds float, float addrspace(1)* %1, i64 %690
  store float %688, float addrspace(1)* %691, align 4, !tbaa !7
  %692 = or i32 %667, 3
  %693 = add i32 %645, %692
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds float, float addrspace(1)* %0, i64 %694
  %696 = load float, float addrspace(1)* %695, align 4, !tbaa !7
  %697 = sub i32 %647, %692
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds float, float addrspace(1)* %1, i64 %698
  store float %696, float addrspace(1)* %699, align 4, !tbaa !7
  %700 = or i32 %667, 4
  %701 = add i32 %645, %700
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds float, float addrspace(1)* %0, i64 %702
  %704 = load float, float addrspace(1)* %703, align 4, !tbaa !7
  %705 = sub i32 %647, %700
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds float, float addrspace(1)* %1, i64 %706
  store float %704, float addrspace(1)* %707, align 4, !tbaa !7
  %708 = or i32 %667, 5
  %709 = add i32 %645, %708
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds float, float addrspace(1)* %0, i64 %710
  %712 = load float, float addrspace(1)* %711, align 4, !tbaa !7
  %713 = sub i32 %647, %708
  %714 = sext i32 %713 to i64
  %715 = getelementptr inbounds float, float addrspace(1)* %1, i64 %714
  store float %712, float addrspace(1)* %715, align 4, !tbaa !7
  %716 = or i32 %667, 6
  %717 = add i32 %645, %716
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds float, float addrspace(1)* %0, i64 %718
  %720 = load float, float addrspace(1)* %719, align 4, !tbaa !7
  %721 = sub i32 %647, %716
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds float, float addrspace(1)* %1, i64 %722
  store float %720, float addrspace(1)* %723, align 4, !tbaa !7
  %724 = or i32 %667, 7
  %725 = add i32 %645, %724
  %726 = sext i32 %725 to i64
  %727 = getelementptr inbounds float, float addrspace(1)* %0, i64 %726
  %728 = load float, float addrspace(1)* %727, align 4, !tbaa !7
  %729 = sub i32 %647, %724
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds float, float addrspace(1)* %1, i64 %730
  store float %728, float addrspace(1)* %731, align 4, !tbaa !7
  %732 = add nuw nsw i32 %667, 8
  %733 = add i32 %668, 8
  %734 = icmp eq i32 %733, %640
  br i1 %734, label %648, label %666, !llvm.loop !24

735:                                              ; preds = %663, %576, %50, %417, %25, %632, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = !{i32 0, i32 33}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
