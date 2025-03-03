; ModuleID = '../data/hip_kernels/3557/7/main.cu'
source_filename = "../data/hip_kernels/3557/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cudaSToOutput_kerneljjjjjjbbPKjS0_PKiPKfS2_S4_S4_S4_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i1 %6, i1 %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture writeonly %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %19 = mul i32 %18, %0
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = and i32 %20, 31
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %22, %27
  %29 = add i32 %28, %21
  %30 = icmp ult i32 %29, %0
  br i1 %30, label %31, label %598

31:                                               ; preds = %17
  %32 = sub i32 %2, %1
  %33 = add i32 %29, %19
  %34 = shl i32 %33, 2
  %35 = mul i32 %34, %32
  switch i32 %3, label %38 [
    i32 4, label %55
    i32 5, label %36
  ]

36:                                               ; preds = %31
  %37 = mul i32 %33, 5
  br label %55

38:                                               ; preds = %31
  %39 = select i1 %6, i1 %7, i1 false
  br i1 %39, label %40, label %45

40:                                               ; preds = %38
  %41 = add i32 %5, %4
  %42 = mul i32 %41, 3
  %43 = add i32 %42, 5
  %44 = mul i32 %33, %43
  br label %55

45:                                               ; preds = %38
  br i1 %7, label %46, label %50

46:                                               ; preds = %45
  %47 = mul i32 %5, 3
  %48 = add i32 %47, 5
  %49 = mul i32 %33, %48
  br label %55

50:                                               ; preds = %45
  br i1 %6, label %51, label %55

51:                                               ; preds = %50
  %52 = mul i32 %4, 3
  %53 = add i32 %52, 5
  %54 = mul i32 %33, %53
  br label %55

55:                                               ; preds = %31, %36, %46, %51, %50, %40
  %56 = phi i32 [ %37, %36 ], [ %44, %40 ], [ %49, %46 ], [ %54, %51 ], [ 0, %50 ], [ %34, %31 ]
  %57 = zext i32 %35 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %11, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = zext i32 %56 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %16, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %35, 1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %11, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = add i32 %56, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %16, i64 %67
  store float %65, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i32 %35, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %11, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = add i32 %56, 2
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %16, i64 %74
  store float %72, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = or i32 %35, 3
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %11, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = add i32 %56, 3
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %16, i64 %81
  store float %79, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = icmp ugt i32 %3, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %55
  %85 = sext i32 %33 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !11, !amdgpu.noclobber !6
  %88 = icmp sgt i32 %87, -1
  %89 = sitofp i32 %87 to float
  %90 = select i1 %88, float %89, float 0.000000e+00
  %91 = add i32 %56, 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %16, i64 %92
  store float %90, float addrspace(1)* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %84, %55
  %95 = phi i32 [ 5, %84 ], [ 4, %55 ]
  br i1 %6, label %96, label %416

96:                                               ; preds = %94
  %97 = shl nsw i32 %33, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !6
  %101 = add nuw nsw i32 %97, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !11, !amdgpu.noclobber !6
  %105 = icmp sgt i32 %104, -1
  br i1 %105, label %106, label %299

106:                                              ; preds = %96
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !11, !amdgpu.noclobber !6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %147, label %111

111:                                              ; preds = %106
  %112 = add i32 %100, %19
  %113 = mul i32 %112, %2
  %114 = add i32 %113, %104
  %115 = shl i32 %4, 1
  %116 = mul i32 %115, %114
  %117 = add i32 %95, %56
  %118 = add i32 %66, %95
  %119 = and i32 %109, 7
  %120 = icmp ult i32 %109, 8
  br i1 %120, label %123, label %121

121:                                              ; preds = %111
  %122 = and i32 %109, -8
  br label %155

123:                                              ; preds = %155, %111
  %124 = phi i32 [ 0, %111 ], [ %285, %155 ]
  %125 = icmp eq i32 %119, 0
  br i1 %125, label %147, label %126

126:                                              ; preds = %123, %126
  %127 = phi i32 [ %144, %126 ], [ %124, %123 ]
  %128 = phi i32 [ %145, %126 ], [ 0, %123 ]
  %129 = shl i32 %127, 1
  %130 = add i32 %129, %116
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %13, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = add i32 %117, %129
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %16, i64 %135
  store float %133, float addrspace(1)* %136, align 4, !tbaa !7
  %137 = or i32 %130, 1
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %13, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = add i32 %118, %129
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %16, i64 %142
  store float %140, float addrspace(1)* %143, align 4, !tbaa !7
  %144 = add nuw i32 %127, 1
  %145 = add i32 %128, 1
  %146 = icmp eq i32 %145, %119
  br i1 %146, label %147, label %126, !llvm.loop !13

147:                                              ; preds = %123, %126, %106
  %148 = icmp ult i32 %109, %4
  br i1 %148, label %149, label %299

149:                                              ; preds = %147
  %150 = shl i32 %109, 1
  %151 = add i32 %95, %56
  %152 = add i32 %151, %150
  %153 = add i32 %66, %95
  %154 = add i32 %153, %150
  br label %288

155:                                              ; preds = %155, %121
  %156 = phi i32 [ 0, %121 ], [ %285, %155 ]
  %157 = phi i32 [ 0, %121 ], [ %286, %155 ]
  %158 = shl i32 %156, 1
  %159 = add i32 %158, %116
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %13, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = add i32 %117, %158
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %16, i64 %164
  store float %162, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = or i32 %159, 1
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %13, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7
  %170 = add i32 %118, %158
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %16, i64 %171
  store float %169, float addrspace(1)* %172, align 4, !tbaa !7
  %173 = shl i32 %156, 1
  %174 = or i32 %173, 2
  %175 = add i32 %174, %116
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %13, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %179 = add i32 %117, %174
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %16, i64 %180
  store float %178, float addrspace(1)* %181, align 4, !tbaa !7
  %182 = or i32 %175, 1
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %13, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = add i32 %118, %174
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %16, i64 %187
  store float %185, float addrspace(1)* %188, align 4, !tbaa !7
  %189 = shl i32 %156, 1
  %190 = or i32 %189, 4
  %191 = add i32 %190, %116
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %13, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = add i32 %117, %190
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %16, i64 %196
  store float %194, float addrspace(1)* %197, align 4, !tbaa !7
  %198 = or i32 %191, 1
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %13, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7
  %202 = add i32 %118, %190
  %203 = zext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %16, i64 %203
  store float %201, float addrspace(1)* %204, align 4, !tbaa !7
  %205 = shl i32 %156, 1
  %206 = or i32 %205, 6
  %207 = add i32 %206, %116
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %13, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %211 = add i32 %117, %206
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %16, i64 %212
  store float %210, float addrspace(1)* %213, align 4, !tbaa !7
  %214 = or i32 %207, 1
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %13, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = add i32 %118, %206
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %16, i64 %219
  store float %217, float addrspace(1)* %220, align 4, !tbaa !7
  %221 = shl i32 %156, 1
  %222 = or i32 %221, 8
  %223 = add i32 %222, %116
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %13, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = add i32 %117, %222
  %228 = zext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %16, i64 %228
  store float %226, float addrspace(1)* %229, align 4, !tbaa !7
  %230 = or i32 %223, 1
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %13, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  %234 = add i32 %118, %222
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %16, i64 %235
  store float %233, float addrspace(1)* %236, align 4, !tbaa !7
  %237 = shl i32 %156, 1
  %238 = or i32 %237, 10
  %239 = add i32 %238, %116
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %13, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = add i32 %117, %238
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %16, i64 %244
  store float %242, float addrspace(1)* %245, align 4, !tbaa !7
  %246 = or i32 %239, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %13, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !7
  %250 = add i32 %118, %238
  %251 = zext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %16, i64 %251
  store float %249, float addrspace(1)* %252, align 4, !tbaa !7
  %253 = shl i32 %156, 1
  %254 = or i32 %253, 12
  %255 = add i32 %254, %116
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %13, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = add i32 %117, %254
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %16, i64 %260
  store float %258, float addrspace(1)* %261, align 4, !tbaa !7
  %262 = or i32 %255, 1
  %263 = zext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %13, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !7
  %266 = add i32 %118, %254
  %267 = zext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %16, i64 %267
  store float %265, float addrspace(1)* %268, align 4, !tbaa !7
  %269 = shl i32 %156, 1
  %270 = or i32 %269, 14
  %271 = add i32 %270, %116
  %272 = zext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %13, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = add i32 %117, %270
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %16, i64 %276
  store float %274, float addrspace(1)* %277, align 4, !tbaa !7
  %278 = or i32 %271, 1
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %13, i64 %279
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !7
  %282 = add i32 %118, %270
  %283 = zext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %16, i64 %283
  store float %281, float addrspace(1)* %284, align 4, !tbaa !7
  %285 = add nuw i32 %156, 8
  %286 = add i32 %157, 8
  %287 = icmp eq i32 %286, %122
  br i1 %287, label %123, label %155, !llvm.loop !15

288:                                              ; preds = %149, %288
  %289 = phi i32 [ %109, %149 ], [ %297, %288 ]
  %290 = shl nsw i32 %289, 1
  %291 = add i32 %152, %290
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %16, i64 %292
  store float 0.000000e+00, float addrspace(1)* %293, align 4, !tbaa !7
  %294 = add i32 %154, %290
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %16, i64 %295
  store float 0.000000e+00, float addrspace(1)* %296, align 4, !tbaa !7
  %297 = add nuw nsw i32 %289, 1
  %298 = icmp ult i32 %297, %4
  br i1 %298, label %288, label %299, !llvm.loop !17

299:                                              ; preds = %288, %147, %96
  %300 = shl i32 %4, 1
  %301 = add i32 %95, %300
  br i1 %105, label %302, label %414

302:                                              ; preds = %299
  %303 = zext i32 %104 to i64
  %304 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %303
  %305 = load i32, i32 addrspace(1)* %304, align 4, !tbaa !11, !amdgpu.noclobber !6
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %333, label %307

307:                                              ; preds = %302
  %308 = add i32 %100, %19
  %309 = mul i32 %308, %2
  %310 = add i32 %309, %104
  %311 = mul i32 %310, %4
  %312 = add i32 %301, %56
  %313 = and i32 %305, 7
  %314 = icmp ult i32 %305, 8
  br i1 %314, label %317, label %315

315:                                              ; preds = %307
  %316 = and i32 %305, -8
  br label %338

317:                                              ; preds = %338, %307
  %318 = phi i32 [ 0, %307 ], [ %404, %338 ]
  %319 = icmp eq i32 %313, 0
  br i1 %319, label %333, label %320

320:                                              ; preds = %317, %320
  %321 = phi i32 [ %330, %320 ], [ %318, %317 ]
  %322 = phi i32 [ %331, %320 ], [ 0, %317 ]
  %323 = add i32 %321, %311
  %324 = zext i32 %323 to i64
  %325 = getelementptr inbounds float, float addrspace(1)* %14, i64 %324
  %326 = load float, float addrspace(1)* %325, align 4, !tbaa !7
  %327 = add i32 %312, %321
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %16, i64 %328
  store float %326, float addrspace(1)* %329, align 4, !tbaa !7
  %330 = add nuw i32 %321, 1
  %331 = add i32 %322, 1
  %332 = icmp eq i32 %331, %313
  br i1 %332, label %333, label %320, !llvm.loop !18

333:                                              ; preds = %317, %320, %302
  %334 = icmp ult i32 %305, %4
  br i1 %334, label %335, label %414

335:                                              ; preds = %333
  %336 = add i32 %301, %56
  %337 = add i32 %336, %305
  br label %407

338:                                              ; preds = %338, %315
  %339 = phi i32 [ 0, %315 ], [ %404, %338 ]
  %340 = phi i32 [ 0, %315 ], [ %405, %338 ]
  %341 = add i32 %339, %311
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %14, i64 %342
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !7
  %345 = add i32 %312, %339
  %346 = zext i32 %345 to i64
  %347 = getelementptr inbounds float, float addrspace(1)* %16, i64 %346
  store float %344, float addrspace(1)* %347, align 4, !tbaa !7
  %348 = or i32 %339, 1
  %349 = add i32 %348, %311
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %14, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !7
  %353 = add i32 %312, %348
  %354 = zext i32 %353 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %16, i64 %354
  store float %352, float addrspace(1)* %355, align 4, !tbaa !7
  %356 = or i32 %339, 2
  %357 = add i32 %356, %311
  %358 = zext i32 %357 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %14, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7
  %361 = add i32 %312, %356
  %362 = zext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %16, i64 %362
  store float %360, float addrspace(1)* %363, align 4, !tbaa !7
  %364 = or i32 %339, 3
  %365 = add i32 %364, %311
  %366 = zext i32 %365 to i64
  %367 = getelementptr inbounds float, float addrspace(1)* %14, i64 %366
  %368 = load float, float addrspace(1)* %367, align 4, !tbaa !7
  %369 = add i32 %312, %364
  %370 = zext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %16, i64 %370
  store float %368, float addrspace(1)* %371, align 4, !tbaa !7
  %372 = or i32 %339, 4
  %373 = add i32 %372, %311
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds float, float addrspace(1)* %14, i64 %374
  %376 = load float, float addrspace(1)* %375, align 4, !tbaa !7
  %377 = add i32 %312, %372
  %378 = zext i32 %377 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %16, i64 %378
  store float %376, float addrspace(1)* %379, align 4, !tbaa !7
  %380 = or i32 %339, 5
  %381 = add i32 %380, %311
  %382 = zext i32 %381 to i64
  %383 = getelementptr inbounds float, float addrspace(1)* %14, i64 %382
  %384 = load float, float addrspace(1)* %383, align 4, !tbaa !7
  %385 = add i32 %312, %380
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %16, i64 %386
  store float %384, float addrspace(1)* %387, align 4, !tbaa !7
  %388 = or i32 %339, 6
  %389 = add i32 %388, %311
  %390 = zext i32 %389 to i64
  %391 = getelementptr inbounds float, float addrspace(1)* %14, i64 %390
  %392 = load float, float addrspace(1)* %391, align 4, !tbaa !7
  %393 = add i32 %312, %388
  %394 = zext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %16, i64 %394
  store float %392, float addrspace(1)* %395, align 4, !tbaa !7
  %396 = or i32 %339, 7
  %397 = add i32 %396, %311
  %398 = zext i32 %397 to i64
  %399 = getelementptr inbounds float, float addrspace(1)* %14, i64 %398
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !7
  %401 = add i32 %312, %396
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %16, i64 %402
  store float %400, float addrspace(1)* %403, align 4, !tbaa !7
  %404 = add nuw i32 %339, 8
  %405 = add i32 %340, 8
  %406 = icmp eq i32 %405, %316
  br i1 %406, label %317, label %338, !llvm.loop !19

407:                                              ; preds = %335, %407
  %408 = phi i32 [ %305, %335 ], [ %412, %407 ]
  %409 = add i32 %337, %408
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %16, i64 %410
  store float -1.000000e+00, float addrspace(1)* %411, align 4, !tbaa !7
  %412 = add nuw nsw i32 %408, 1
  %413 = icmp ult i32 %412, %4
  br i1 %413, label %407, label %414, !llvm.loop !20

414:                                              ; preds = %407, %333, %299
  %415 = add i32 %301, %4
  br label %416

416:                                              ; preds = %414, %94
  %417 = phi i32 [ %415, %414 ], [ %95, %94 ]
  br i1 %7, label %418, label %598

418:                                              ; preds = %416
  %419 = shl nsw i32 %33, 1
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %420
  %422 = load i32, i32 addrspace(1)* %421, align 4, !tbaa !11, !amdgpu.noclobber !6
  %423 = add nuw nsw i32 %419, 1
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %424
  %426 = load i32, i32 addrspace(1)* %425, align 4, !tbaa !11, !amdgpu.noclobber !6
  %427 = icmp sgt i32 %426, -1
  br i1 %427, label %428, label %598

428:                                              ; preds = %418
  %429 = zext i32 %426 to i64
  %430 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %429
  %431 = load i32, i32 addrspace(1)* %430, align 4, !tbaa !11, !amdgpu.noclobber !6
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %477, label %433

433:                                              ; preds = %428
  %434 = add i32 %422, %19
  %435 = mul i32 %434, %2
  %436 = add i32 %435, %426
  %437 = mul i32 %5, 3
  %438 = mul i32 %437, %436
  %439 = add i32 %417, %56
  %440 = add i32 %439, 1
  %441 = add i32 %439, 2
  %442 = and i32 %431, 3
  %443 = icmp ult i32 %431, 4
  br i1 %443, label %446, label %444

444:                                              ; preds = %433
  %445 = and i32 %431, -4
  br label %487

446:                                              ; preds = %487, %433
  %447 = phi i32 [ 0, %433 ], [ %581, %487 ]
  %448 = icmp eq i32 %442, 0
  br i1 %448, label %477, label %449

449:                                              ; preds = %446, %449
  %450 = phi i32 [ %474, %449 ], [ %447, %446 ]
  %451 = phi i32 [ %475, %449 ], [ 0, %446 ]
  %452 = mul i32 %450, 3
  %453 = add i32 %452, %438
  %454 = zext i32 %453 to i64
  %455 = getelementptr inbounds float, float addrspace(1)* %15, i64 %454
  %456 = load float, float addrspace(1)* %455, align 4, !tbaa !7
  %457 = add i32 %439, %452
  %458 = zext i32 %457 to i64
  %459 = getelementptr inbounds float, float addrspace(1)* %16, i64 %458
  store float %456, float addrspace(1)* %459, align 4, !tbaa !7
  %460 = add i32 %453, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, float addrspace(1)* %15, i64 %461
  %463 = load float, float addrspace(1)* %462, align 4, !tbaa !7
  %464 = add i32 %440, %452
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, float addrspace(1)* %16, i64 %465
  store float %463, float addrspace(1)* %466, align 4, !tbaa !7
  %467 = add i32 %453, 2
  %468 = zext i32 %467 to i64
  %469 = getelementptr inbounds float, float addrspace(1)* %15, i64 %468
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7
  %471 = add i32 %441, %452
  %472 = zext i32 %471 to i64
  %473 = getelementptr inbounds float, float addrspace(1)* %16, i64 %472
  store float %470, float addrspace(1)* %473, align 4, !tbaa !7
  %474 = add nuw i32 %450, 1
  %475 = add i32 %451, 1
  %476 = icmp eq i32 %475, %442
  br i1 %476, label %477, label %449, !llvm.loop !21

477:                                              ; preds = %446, %449, %428
  %478 = icmp ult i32 %431, %4
  br i1 %478, label %479, label %598

479:                                              ; preds = %477
  %480 = mul i32 %431, 3
  %481 = add i32 %417, %56
  %482 = add i32 %481, %480
  %483 = add i32 %481, 1
  %484 = add i32 %483, %480
  %485 = add i32 %481, 2
  %486 = add i32 %485, %480
  br label %584

487:                                              ; preds = %487, %444
  %488 = phi i32 [ 0, %444 ], [ %581, %487 ]
  %489 = phi i32 [ 0, %444 ], [ %582, %487 ]
  %490 = mul i32 %488, 3
  %491 = add i32 %490, %438
  %492 = zext i32 %491 to i64
  %493 = getelementptr inbounds float, float addrspace(1)* %15, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !7
  %495 = add i32 %439, %490
  %496 = zext i32 %495 to i64
  %497 = getelementptr inbounds float, float addrspace(1)* %16, i64 %496
  store float %494, float addrspace(1)* %497, align 4, !tbaa !7
  %498 = add i32 %491, 1
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %15, i64 %499
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !7
  %502 = add i32 %440, %490
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %16, i64 %503
  store float %501, float addrspace(1)* %504, align 4, !tbaa !7
  %505 = add i32 %491, 2
  %506 = zext i32 %505 to i64
  %507 = getelementptr inbounds float, float addrspace(1)* %15, i64 %506
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !7
  %509 = add i32 %441, %490
  %510 = zext i32 %509 to i64
  %511 = getelementptr inbounds float, float addrspace(1)* %16, i64 %510
  store float %508, float addrspace(1)* %511, align 4, !tbaa !7
  %512 = mul i32 %488, 3
  %513 = or i32 %512, 3
  %514 = add i32 %513, %438
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %15, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7
  %518 = add i32 %439, %513
  %519 = zext i32 %518 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %16, i64 %519
  store float %517, float addrspace(1)* %520, align 4, !tbaa !7
  %521 = add i32 %514, 1
  %522 = zext i32 %521 to i64
  %523 = getelementptr inbounds float, float addrspace(1)* %15, i64 %522
  %524 = load float, float addrspace(1)* %523, align 4, !tbaa !7
  %525 = add i32 %440, %513
  %526 = zext i32 %525 to i64
  %527 = getelementptr inbounds float, float addrspace(1)* %16, i64 %526
  store float %524, float addrspace(1)* %527, align 4, !tbaa !7
  %528 = add i32 %514, 2
  %529 = zext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %15, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !7
  %532 = add i32 %441, %513
  %533 = zext i32 %532 to i64
  %534 = getelementptr inbounds float, float addrspace(1)* %16, i64 %533
  store float %531, float addrspace(1)* %534, align 4, !tbaa !7
  %535 = mul i32 %488, 3
  %536 = add i32 %535, 6
  %537 = add i32 %536, %438
  %538 = zext i32 %537 to i64
  %539 = getelementptr inbounds float, float addrspace(1)* %15, i64 %538
  %540 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %541 = add i32 %439, %536
  %542 = zext i32 %541 to i64
  %543 = getelementptr inbounds float, float addrspace(1)* %16, i64 %542
  store float %540, float addrspace(1)* %543, align 4, !tbaa !7
  %544 = add i32 %537, 1
  %545 = zext i32 %544 to i64
  %546 = getelementptr inbounds float, float addrspace(1)* %15, i64 %545
  %547 = load float, float addrspace(1)* %546, align 4, !tbaa !7
  %548 = add i32 %440, %536
  %549 = zext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %16, i64 %549
  store float %547, float addrspace(1)* %550, align 4, !tbaa !7
  %551 = add i32 %537, 2
  %552 = zext i32 %551 to i64
  %553 = getelementptr inbounds float, float addrspace(1)* %15, i64 %552
  %554 = load float, float addrspace(1)* %553, align 4, !tbaa !7
  %555 = add i32 %441, %536
  %556 = zext i32 %555 to i64
  %557 = getelementptr inbounds float, float addrspace(1)* %16, i64 %556
  store float %554, float addrspace(1)* %557, align 4, !tbaa !7
  %558 = mul i32 %488, 3
  %559 = add i32 %558, 9
  %560 = add i32 %559, %438
  %561 = zext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %15, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !7
  %564 = add i32 %439, %559
  %565 = zext i32 %564 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %16, i64 %565
  store float %563, float addrspace(1)* %566, align 4, !tbaa !7
  %567 = add i32 %560, 1
  %568 = zext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %15, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !7
  %571 = add i32 %440, %559
  %572 = zext i32 %571 to i64
  %573 = getelementptr inbounds float, float addrspace(1)* %16, i64 %572
  store float %570, float addrspace(1)* %573, align 4, !tbaa !7
  %574 = add i32 %560, 2
  %575 = zext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %15, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !7
  %578 = add i32 %441, %559
  %579 = zext i32 %578 to i64
  %580 = getelementptr inbounds float, float addrspace(1)* %16, i64 %579
  store float %577, float addrspace(1)* %580, align 4, !tbaa !7
  %581 = add nuw i32 %488, 4
  %582 = add i32 %489, 4
  %583 = icmp eq i32 %582, %445
  br i1 %583, label %446, label %487, !llvm.loop !22

584:                                              ; preds = %479, %584
  %585 = phi i32 [ %431, %479 ], [ %596, %584 ]
  %586 = mul nsw i32 %585, 3
  %587 = add i32 %482, %586
  %588 = zext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %16, i64 %588
  store float 0.000000e+00, float addrspace(1)* %589, align 4, !tbaa !7
  %590 = add i32 %484, %586
  %591 = zext i32 %590 to i64
  %592 = getelementptr inbounds float, float addrspace(1)* %16, i64 %591
  store float 0.000000e+00, float addrspace(1)* %592, align 4, !tbaa !7
  %593 = add i32 %486, %586
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, float addrspace(1)* %16, i64 %594
  store float 0.000000e+00, float addrspace(1)* %595, align 4, !tbaa !7
  %596 = add nuw nsw i32 %585, 1
  %597 = icmp ult i32 %596, %4
  br i1 %597, label %584, label %598, !llvm.loop !23

598:                                              ; preds = %584, %477, %416, %418, %17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !16}
!23 = distinct !{!23, !16}
