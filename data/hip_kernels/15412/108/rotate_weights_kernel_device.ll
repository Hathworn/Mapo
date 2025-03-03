; ModuleID = '../data/hip_kernels/15412/108/main.cu'
source_filename = "../data/hip_kernels/15412/108/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21rotate_weights_kernelPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %4, %4
  %17 = mul nsw i32 %15, %16
  %18 = icmp slt i32 %17, %2
  br i1 %18, label %19, label %450

19:                                               ; preds = %6
  %20 = sdiv i32 %2, %16
  %21 = sdiv i32 %20, 4
  %22 = sdiv i32 %15, %21
  switch i32 %22, label %450 [
    i32 0, label %52
    i32 1, label %42
    i32 2, label %32
    i32 3, label %23
  ]

23:                                               ; preds = %19
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %25, label %450

25:                                               ; preds = %23
  %26 = icmp eq i32 %5, 0
  %27 = add i32 %4, -1
  %28 = and i32 %4, 3
  %29 = icmp ult i32 %27, 3
  %30 = and i32 %4, -4
  %31 = icmp eq i32 %28, 0
  br label %365

32:                                               ; preds = %19
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %34, label %450

34:                                               ; preds = %32
  %35 = add i32 %4, -1
  %36 = add i32 %17, %35
  %37 = icmp eq i32 %5, 0
  %38 = and i32 %4, 7
  %39 = icmp ult i32 %35, 7
  %40 = and i32 %4, -8
  %41 = icmp eq i32 %38, 0
  br label %253

42:                                               ; preds = %19
  %43 = icmp sgt i32 %4, 0
  br i1 %43, label %44, label %450

44:                                               ; preds = %42
  %45 = add i32 %17, %4
  %46 = icmp eq i32 %5, 0
  %47 = add i32 %4, -1
  %48 = and i32 %4, 7
  %49 = icmp ult i32 %47, 7
  %50 = and i32 %4, -8
  %51 = icmp eq i32 %48, 0
  br label %133

52:                                               ; preds = %19
  %53 = icmp sgt i32 %4, 0
  br i1 %53, label %54, label %450

54:                                               ; preds = %52
  %55 = add i32 %4, -1
  %56 = and i32 %4, 7
  %57 = icmp ult i32 %55, 7
  %58 = and i32 %4, -8
  %59 = icmp eq i32 %56, 0
  br label %60

60:                                               ; preds = %54, %77
  %61 = phi i32 [ %78, %77 ], [ 0, %54 ]
  %62 = mul nsw i32 %61, %4
  %63 = add i32 %62, %17
  br i1 %57, label %64, label %80

64:                                               ; preds = %80, %60
  %65 = phi i32 [ 0, %60 ], [ %130, %80 ]
  br i1 %59, label %77, label %66

66:                                               ; preds = %64, %66
  %67 = phi i32 [ %74, %66 ], [ %65, %64 ]
  %68 = phi i32 [ %75, %66 ], [ 0, %64 ]
  %69 = add i32 %63, %67
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = add nuw nsw i32 %67, 1
  %75 = add i32 %68, 1
  %76 = icmp eq i32 %75, %56
  br i1 %76, label %77, label %66, !llvm.loop !11

77:                                               ; preds = %66, %64
  %78 = add nuw nsw i32 %61, 1
  %79 = icmp eq i32 %78, %4
  br i1 %79, label %450, label %60, !llvm.loop !13

80:                                               ; preds = %60, %80
  %81 = phi i32 [ %130, %80 ], [ 0, %60 ]
  %82 = phi i32 [ %131, %80 ], [ 0, %60 ]
  %83 = add i32 %63, %81
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = or i32 %81, 1
  %89 = add i32 %63, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  store float %92, float addrspace(1)* %93, align 4, !tbaa !7
  %94 = or i32 %81, 2
  %95 = add i32 %63, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  store float %98, float addrspace(1)* %99, align 4, !tbaa !7
  %100 = or i32 %81, 3
  %101 = add i32 %63, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  store float %104, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = or i32 %81, 4
  %107 = add i32 %63, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  store float %110, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = or i32 %81, 5
  %113 = add i32 %63, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  store float %116, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %81, 6
  %119 = add i32 %63, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  store float %122, float addrspace(1)* %123, align 4, !tbaa !7
  %124 = or i32 %81, 7
  %125 = add i32 %63, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  store float %128, float addrspace(1)* %129, align 4, !tbaa !7
  %130 = add nuw nsw i32 %81, 8
  %131 = add i32 %82, 8
  %132 = icmp eq i32 %131, %58
  br i1 %132, label %64, label %80, !llvm.loop !15

133:                                              ; preds = %44, %157
  %134 = phi i32 [ 0, %44 ], [ %158, %157 ]
  %135 = mul nsw i32 %134, %4
  %136 = add i32 %135, %17
  %137 = xor i32 %134, -1
  %138 = add i32 %45, %137
  br i1 %49, label %139, label %160

139:                                              ; preds = %160, %133
  %140 = phi i32 [ 0, %133 ], [ %250, %160 ]
  br i1 %51, label %157, label %141

141:                                              ; preds = %139, %141
  %142 = phi i32 [ %154, %141 ], [ %140, %139 ]
  %143 = phi i32 [ %155, %141 ], [ 0, %139 ]
  %144 = add i32 %136, %142
  %145 = mul nsw i32 %142, %4
  %146 = add i32 %138, %145
  %147 = select i1 %46, i32 %144, i32 %146
  %148 = select i1 %46, i32 %146, i32 %144
  %149 = sext i32 %147 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = sext i32 %148 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  store float %151, float addrspace(1)* %153, align 4, !tbaa !7
  %154 = add nuw nsw i32 %142, 1
  %155 = add i32 %143, 1
  %156 = icmp eq i32 %155, %48
  br i1 %156, label %157, label %141, !llvm.loop !16

157:                                              ; preds = %141, %139
  %158 = add nuw nsw i32 %134, 1
  %159 = icmp eq i32 %158, %4
  br i1 %159, label %450, label %133, !llvm.loop !17

160:                                              ; preds = %133, %160
  %161 = phi i32 [ %250, %160 ], [ 0, %133 ]
  %162 = phi i32 [ %251, %160 ], [ 0, %133 ]
  %163 = add i32 %136, %161
  %164 = mul nsw i32 %161, %4
  %165 = add i32 %138, %164
  %166 = select i1 %46, i32 %163, i32 %165
  %167 = select i1 %46, i32 %165, i32 %163
  %168 = sext i32 %166 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = sext i32 %167 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  store float %170, float addrspace(1)* %172, align 4, !tbaa !7
  %173 = or i32 %161, 1
  %174 = add i32 %136, %173
  %175 = mul nsw i32 %173, %4
  %176 = add i32 %138, %175
  %177 = select i1 %46, i32 %174, i32 %176
  %178 = select i1 %46, i32 %176, i32 %174
  %179 = sext i32 %177 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = sext i32 %178 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %181, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = or i32 %161, 2
  %185 = add i32 %136, %184
  %186 = mul nsw i32 %184, %4
  %187 = add i32 %138, %186
  %188 = select i1 %46, i32 %185, i32 %187
  %189 = select i1 %46, i32 %187, i32 %185
  %190 = sext i32 %188 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = sext i32 %189 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %1, i64 %193
  store float %192, float addrspace(1)* %194, align 4, !tbaa !7
  %195 = or i32 %161, 3
  %196 = add i32 %136, %195
  %197 = mul nsw i32 %195, %4
  %198 = add i32 %138, %197
  %199 = select i1 %46, i32 %196, i32 %198
  %200 = select i1 %46, i32 %198, i32 %196
  %201 = sext i32 %199 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = sext i32 %200 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  store float %203, float addrspace(1)* %205, align 4, !tbaa !7
  %206 = or i32 %161, 4
  %207 = add i32 %136, %206
  %208 = mul nsw i32 %206, %4
  %209 = add i32 %138, %208
  %210 = select i1 %46, i32 %207, i32 %209
  %211 = select i1 %46, i32 %209, i32 %207
  %212 = sext i32 %210 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = sext i32 %211 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %215
  store float %214, float addrspace(1)* %216, align 4, !tbaa !7
  %217 = or i32 %161, 5
  %218 = add i32 %136, %217
  %219 = mul nsw i32 %217, %4
  %220 = add i32 %138, %219
  %221 = select i1 %46, i32 %218, i32 %220
  %222 = select i1 %46, i32 %220, i32 %218
  %223 = sext i32 %221 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = sext i32 %222 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %1, i64 %226
  store float %225, float addrspace(1)* %227, align 4, !tbaa !7
  %228 = or i32 %161, 6
  %229 = add i32 %136, %228
  %230 = mul nsw i32 %228, %4
  %231 = add i32 %138, %230
  %232 = select i1 %46, i32 %229, i32 %231
  %233 = select i1 %46, i32 %231, i32 %229
  %234 = sext i32 %232 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %0, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !7
  %237 = sext i32 %233 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %237
  store float %236, float addrspace(1)* %238, align 4, !tbaa !7
  %239 = or i32 %161, 7
  %240 = add i32 %136, %239
  %241 = mul nsw i32 %239, %4
  %242 = add i32 %138, %241
  %243 = select i1 %46, i32 %240, i32 %242
  %244 = select i1 %46, i32 %242, i32 %240
  %245 = sext i32 %243 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = sext i32 %244 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %1, i64 %248
  store float %247, float addrspace(1)* %249, align 4, !tbaa !7
  %250 = add nuw nsw i32 %161, 8
  %251 = add i32 %162, 8
  %252 = icmp eq i32 %251, %50
  br i1 %252, label %139, label %160, !llvm.loop !18

253:                                              ; preds = %34, %277
  %254 = phi i32 [ 0, %34 ], [ %278, %277 ]
  %255 = mul nsw i32 %254, %4
  %256 = add i32 %255, %17
  %257 = sub nsw i32 %35, %254
  %258 = mul nsw i32 %257, %4
  %259 = add i32 %36, %258
  br i1 %39, label %260, label %280

260:                                              ; preds = %280, %253
  %261 = phi i32 [ 0, %253 ], [ %362, %280 ]
  br i1 %41, label %277, label %262

262:                                              ; preds = %260, %262
  %263 = phi i32 [ %274, %262 ], [ %261, %260 ]
  %264 = phi i32 [ %275, %262 ], [ 0, %260 ]
  %265 = add i32 %256, %263
  %266 = sub i32 %259, %263
  %267 = select i1 %37, i32 %265, i32 %266
  %268 = select i1 %37, i32 %266, i32 %265
  %269 = sext i32 %267 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %0, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !7
  %272 = sext i32 %268 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %272
  store float %271, float addrspace(1)* %273, align 4, !tbaa !7
  %274 = add nuw nsw i32 %263, 1
  %275 = add i32 %264, 1
  %276 = icmp eq i32 %275, %38
  br i1 %276, label %277, label %262, !llvm.loop !19

277:                                              ; preds = %262, %260
  %278 = add nuw nsw i32 %254, 1
  %279 = icmp eq i32 %278, %4
  br i1 %279, label %450, label %253, !llvm.loop !20

280:                                              ; preds = %253, %280
  %281 = phi i32 [ %362, %280 ], [ 0, %253 ]
  %282 = phi i32 [ %363, %280 ], [ 0, %253 ]
  %283 = add i32 %256, %281
  %284 = sub i32 %259, %281
  %285 = select i1 %37, i32 %283, i32 %284
  %286 = select i1 %37, i32 %284, i32 %283
  %287 = sext i32 %285 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !7
  %290 = sext i32 %286 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %1, i64 %290
  store float %289, float addrspace(1)* %291, align 4, !tbaa !7
  %292 = or i32 %281, 1
  %293 = add i32 %256, %292
  %294 = sub i32 %259, %292
  %295 = select i1 %37, i32 %293, i32 %294
  %296 = select i1 %37, i32 %294, i32 %293
  %297 = sext i32 %295 to i64
  %298 = getelementptr inbounds float, float addrspace(1)* %0, i64 %297
  %299 = load float, float addrspace(1)* %298, align 4, !tbaa !7
  %300 = sext i32 %296 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %1, i64 %300
  store float %299, float addrspace(1)* %301, align 4, !tbaa !7
  %302 = or i32 %281, 2
  %303 = add i32 %256, %302
  %304 = sub i32 %259, %302
  %305 = select i1 %37, i32 %303, i32 %304
  %306 = select i1 %37, i32 %304, i32 %303
  %307 = sext i32 %305 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !7
  %310 = sext i32 %306 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %1, i64 %310
  store float %309, float addrspace(1)* %311, align 4, !tbaa !7
  %312 = or i32 %281, 3
  %313 = add i32 %256, %312
  %314 = sub i32 %259, %312
  %315 = select i1 %37, i32 %313, i32 %314
  %316 = select i1 %37, i32 %314, i32 %313
  %317 = sext i32 %315 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %0, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !7
  %320 = sext i32 %316 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %1, i64 %320
  store float %319, float addrspace(1)* %321, align 4, !tbaa !7
  %322 = or i32 %281, 4
  %323 = add i32 %256, %322
  %324 = sub i32 %259, %322
  %325 = select i1 %37, i32 %323, i32 %324
  %326 = select i1 %37, i32 %324, i32 %323
  %327 = sext i32 %325 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %0, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7
  %330 = sext i32 %326 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %1, i64 %330
  store float %329, float addrspace(1)* %331, align 4, !tbaa !7
  %332 = or i32 %281, 5
  %333 = add i32 %256, %332
  %334 = sub i32 %259, %332
  %335 = select i1 %37, i32 %333, i32 %334
  %336 = select i1 %37, i32 %334, i32 %333
  %337 = sext i32 %335 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %0, i64 %337
  %339 = load float, float addrspace(1)* %338, align 4, !tbaa !7
  %340 = sext i32 %336 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %1, i64 %340
  store float %339, float addrspace(1)* %341, align 4, !tbaa !7
  %342 = or i32 %281, 6
  %343 = add i32 %256, %342
  %344 = sub i32 %259, %342
  %345 = select i1 %37, i32 %343, i32 %344
  %346 = select i1 %37, i32 %344, i32 %343
  %347 = sext i32 %345 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %0, i64 %347
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !7
  %350 = sext i32 %346 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %1, i64 %350
  store float %349, float addrspace(1)* %351, align 4, !tbaa !7
  %352 = or i32 %281, 7
  %353 = add i32 %256, %352
  %354 = sub i32 %259, %352
  %355 = select i1 %37, i32 %353, i32 %354
  %356 = select i1 %37, i32 %354, i32 %353
  %357 = sext i32 %355 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %0, i64 %357
  %359 = load float, float addrspace(1)* %358, align 4, !tbaa !7
  %360 = sext i32 %356 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %1, i64 %360
  store float %359, float addrspace(1)* %361, align 4, !tbaa !7
  %362 = add nuw nsw i32 %281, 8
  %363 = add i32 %282, 8
  %364 = icmp eq i32 %363, %40
  br i1 %364, label %260, label %280, !llvm.loop !21

365:                                              ; preds = %25, %390
  %366 = phi i32 [ 0, %25 ], [ %391, %390 ]
  %367 = mul nsw i32 %366, %4
  %368 = add i32 %367, %17
  %369 = add i32 %366, %17
  br i1 %29, label %370, label %393

370:                                              ; preds = %393, %365
  %371 = phi i32 [ 0, %365 ], [ %447, %393 ]
  br i1 %31, label %390, label %372

372:                                              ; preds = %370, %372
  %373 = phi i32 [ %387, %372 ], [ %371, %370 ]
  %374 = phi i32 [ %388, %372 ], [ 0, %370 ]
  %375 = add i32 %368, %373
  %376 = xor i32 %373, -1
  %377 = add i32 %376, %4
  %378 = mul nsw i32 %377, %4
  %379 = add i32 %369, %378
  %380 = select i1 %26, i32 %375, i32 %379
  %381 = select i1 %26, i32 %379, i32 %375
  %382 = sext i32 %380 to i64
  %383 = getelementptr inbounds float, float addrspace(1)* %0, i64 %382
  %384 = load float, float addrspace(1)* %383, align 4, !tbaa !7
  %385 = sext i32 %381 to i64
  %386 = getelementptr inbounds float, float addrspace(1)* %1, i64 %385
  store float %384, float addrspace(1)* %386, align 4, !tbaa !7
  %387 = add nuw nsw i32 %373, 1
  %388 = add i32 %374, 1
  %389 = icmp eq i32 %388, %28
  br i1 %389, label %390, label %372, !llvm.loop !22

390:                                              ; preds = %372, %370
  %391 = add nuw nsw i32 %366, 1
  %392 = icmp eq i32 %391, %4
  br i1 %392, label %450, label %365, !llvm.loop !23

393:                                              ; preds = %365, %393
  %394 = phi i32 [ %447, %393 ], [ 0, %365 ]
  %395 = phi i32 [ %448, %393 ], [ 0, %365 ]
  %396 = add i32 %368, %394
  %397 = xor i32 %394, -1
  %398 = add i32 %397, %4
  %399 = mul nsw i32 %398, %4
  %400 = add i32 %369, %399
  %401 = select i1 %26, i32 %396, i32 %400
  %402 = select i1 %26, i32 %400, i32 %396
  %403 = sext i32 %401 to i64
  %404 = getelementptr inbounds float, float addrspace(1)* %0, i64 %403
  %405 = load float, float addrspace(1)* %404, align 4, !tbaa !7
  %406 = sext i32 %402 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %1, i64 %406
  store float %405, float addrspace(1)* %407, align 4, !tbaa !7
  %408 = or i32 %394, 1
  %409 = add i32 %368, %408
  %410 = sub i32 %4, %394
  %411 = add i32 %410, -2
  %412 = mul nsw i32 %411, %4
  %413 = add i32 %369, %412
  %414 = select i1 %26, i32 %409, i32 %413
  %415 = select i1 %26, i32 %413, i32 %409
  %416 = sext i32 %414 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %0, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !7
  %419 = sext i32 %415 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %1, i64 %419
  store float %418, float addrspace(1)* %420, align 4, !tbaa !7
  %421 = or i32 %394, 2
  %422 = add i32 %368, %421
  %423 = sub i32 %4, %394
  %424 = add i32 %423, -3
  %425 = mul nsw i32 %424, %4
  %426 = add i32 %369, %425
  %427 = select i1 %26, i32 %422, i32 %426
  %428 = select i1 %26, i32 %426, i32 %422
  %429 = sext i32 %427 to i64
  %430 = getelementptr inbounds float, float addrspace(1)* %0, i64 %429
  %431 = load float, float addrspace(1)* %430, align 4, !tbaa !7
  %432 = sext i32 %428 to i64
  %433 = getelementptr inbounds float, float addrspace(1)* %1, i64 %432
  store float %431, float addrspace(1)* %433, align 4, !tbaa !7
  %434 = or i32 %394, 3
  %435 = add i32 %368, %434
  %436 = sub i32 %4, %394
  %437 = add i32 %436, -4
  %438 = mul nsw i32 %437, %4
  %439 = add i32 %369, %438
  %440 = select i1 %26, i32 %435, i32 %439
  %441 = select i1 %26, i32 %439, i32 %435
  %442 = sext i32 %440 to i64
  %443 = getelementptr inbounds float, float addrspace(1)* %0, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7
  %445 = sext i32 %441 to i64
  %446 = getelementptr inbounds float, float addrspace(1)* %1, i64 %445
  store float %444, float addrspace(1)* %446, align 4, !tbaa !7
  %447 = add nuw nsw i32 %394, 4
  %448 = add i32 %395, 4
  %449 = icmp eq i32 %448, %30
  br i1 %449, label %370, label %393, !llvm.loop !24

450:                                              ; preds = %390, %277, %157, %77, %23, %32, %42, %52, %19, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
