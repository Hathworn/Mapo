; ModuleID = '../data/hip_kernels/12965/0/main.cu'
source_filename = "../data/hip_kernels/12965/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13findMatch_GPUPiS_iPfS0_S0_S_S_PhS1_S_iiiPbbS0_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i8 addrspace(1)* nocapture readonly %8, i8 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, i32 %11, i32 %12, i32 %13, i8 addrspace(1)* nocapture readonly %14, i1 %15, float addrspace(1)* nocapture writeonly %16) local_unnamed_addr #0 {
  %18 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !4, !amdgpu.noclobber !8
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !9, !invariant.load !8
  %23 = zext i16 %22 to i32
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = mul i32 %24, %23
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %27 = add i32 %25, %26
  %28 = icmp ult i32 %27, %2
  br i1 %28, label %29, label %572

29:                                               ; preds = %17
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4, !amdgpu.noclobber !8
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11, !amdgpu.noclobber !8
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !8
  %39 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !11, !amdgpu.noclobber !8
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %30
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !13, !range !15, !amdgpu.noclobber !8
  %43 = icmp eq i8 %42, 0
  %44 = mul nsw i32 %34, %12
  %45 = add nsw i32 %44, %32
  %46 = icmp ult i32 %32, 2
  br i1 %46, label %572, label %47

47:                                               ; preds = %29
  %48 = add nsw i32 %12, -2
  %49 = icmp ult i32 %32, %48
  br i1 %49, label %50, label %572

50:                                               ; preds = %47
  %51 = shl nsw i32 %12, 4
  %52 = sitofp i32 %51 to double
  %53 = add nsw i32 %13, -3
  %54 = uitofp i32 %34 to double
  %55 = sitofp i32 %53 to double
  %56 = tail call double @llvm.minnum.f64(double %54, double %55)
  %57 = tail call double @llvm.maxnum.f64(double %56, double 2.000000e+00)
  %58 = fmul contract double %57, %52
  %59 = fptosi double %58 to i32
  %60 = sext i32 %59 to i64
  %61 = select i1 %15, i8 addrspace(1)* %9, i8 addrspace(1)* %8
  %62 = select i1 %15, i8 addrspace(1)* %8, i8 addrspace(1)* %9
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %61, i64 %60
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %62, i64 %60
  %65 = shl i32 %32, 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %63, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !16
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 %69, -128
  %71 = tail call i32 @llvm.abs.i32(i32 %70, i1 true)
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 1
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !16
  %74 = zext i8 %73 to i32
  %75 = add nsw i32 %74, -128
  %76 = tail call i32 @llvm.abs.i32(i32 %75, i1 true)
  %77 = add nuw nsw i32 %76, %71
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 2
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !16
  %80 = zext i8 %79 to i32
  %81 = add nsw i32 %80, -128
  %82 = tail call i32 @llvm.abs.i32(i32 %81, i1 true)
  %83 = add nuw nsw i32 %82, %77
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 3
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !16
  %86 = zext i8 %85 to i32
  %87 = add nsw i32 %86, -128
  %88 = tail call i32 @llvm.abs.i32(i32 %87, i1 true)
  %89 = add nuw nsw i32 %88, %83
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 4
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  %92 = zext i8 %91 to i32
  %93 = add nsw i32 %92, -128
  %94 = tail call i32 @llvm.abs.i32(i32 %93, i1 true)
  %95 = add nuw nsw i32 %94, %89
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 5
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !16
  %98 = zext i8 %97 to i32
  %99 = add nsw i32 %98, -128
  %100 = tail call i32 @llvm.abs.i32(i32 %99, i1 true)
  %101 = add nuw nsw i32 %100, %95
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 6
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !16
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %104, -128
  %106 = tail call i32 @llvm.abs.i32(i32 %105, i1 true)
  %107 = add nuw nsw i32 %106, %101
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 7
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !16
  %110 = zext i8 %109 to i32
  %111 = add nsw i32 %110, -128
  %112 = tail call i32 @llvm.abs.i32(i32 %111, i1 true)
  %113 = add nuw nsw i32 %112, %107
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 8
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !16
  %116 = zext i8 %115 to i32
  %117 = add nsw i32 %116, -128
  %118 = tail call i32 @llvm.abs.i32(i32 %117, i1 true)
  %119 = add nuw nsw i32 %118, %113
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 9
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !16
  %122 = zext i8 %121 to i32
  %123 = add nsw i32 %122, -128
  %124 = tail call i32 @llvm.abs.i32(i32 %123, i1 true)
  %125 = add nuw nsw i32 %124, %119
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 10
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !16
  %128 = zext i8 %127 to i32
  %129 = add nsw i32 %128, -128
  %130 = tail call i32 @llvm.abs.i32(i32 %129, i1 true)
  %131 = add nuw nsw i32 %130, %125
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 11
  %133 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !16
  %134 = zext i8 %133 to i32
  %135 = add nsw i32 %134, -128
  %136 = tail call i32 @llvm.abs.i32(i32 %135, i1 true)
  %137 = add nuw nsw i32 %136, %131
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 12
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !16
  %140 = zext i8 %139 to i32
  %141 = add nsw i32 %140, -128
  %142 = tail call i32 @llvm.abs.i32(i32 %141, i1 true)
  %143 = add nuw nsw i32 %142, %137
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 13
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !16
  %146 = zext i8 %145 to i32
  %147 = add nsw i32 %146, -128
  %148 = tail call i32 @llvm.abs.i32(i32 %147, i1 true)
  %149 = add nuw nsw i32 %148, %143
  %150 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 14
  %151 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !16
  %152 = zext i8 %151 to i32
  %153 = add nsw i32 %152, -128
  %154 = tail call i32 @llvm.abs.i32(i32 %153, i1 true)
  %155 = add nuw nsw i32 %154, %149
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 15
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !16
  %158 = zext i8 %157 to i32
  %159 = add nsw i32 %158, -128
  %160 = tail call i32 @llvm.abs.i32(i32 %159, i1 true)
  %161 = sub nsw i32 0, %155
  %162 = icmp eq i32 %160, %161
  br i1 %162, label %572, label %163

163:                                              ; preds = %50
  %164 = uitofp i32 %32 to float
  %165 = fmul contract float %36, %164
  %166 = uitofp i32 %34 to float
  %167 = fmul contract float %38, %166
  %168 = fadd contract float %165, %167
  %169 = fadd contract float %40, %168
  %170 = fptosi float %169 to i32
  %171 = sub nsw i32 %170, %11
  %172 = tail call i32 @llvm.smax.i32(i32 %171, i32 0)
  %173 = add nsw i32 %170, %11
  %174 = add nsw i32 %18, -2
  %175 = tail call i32 @llvm.smin.i32(i32 %173, i32 %174)
  %176 = fdiv contract float %164, 2.000000e+01
  %177 = tail call float @llvm.floor.f32(float %176)
  %178 = fptosi float %177 to i32
  %179 = fdiv contract float %166, 2.000000e+01
  %180 = tail call float @llvm.floor.f32(float %179)
  %181 = fptosi float %180 to i32
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 1
  %183 = load i32, i32 addrspace(1)* %182, align 4, !tbaa !4, !amdgpu.noclobber !8
  %184 = mul nsw i32 %183, %181
  %185 = add nsw i32 %184, %178
  %186 = mul nsw i32 %185, %18
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !4, !amdgpu.noclobber !8
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %188, i64 1
  %191 = icmp sgt i32 %189, 0
  br i1 %191, label %192, label %194

192:                                              ; preds = %163
  %193 = select i1 %15, i32 2, i32 0
  br label %200

194:                                              ; preds = %372, %163
  %195 = phi i32 [ 10000, %163 ], [ %373, %372 ]
  %196 = phi i32 [ -1, %163 ], [ %374, %372 ]
  %197 = icmp sgt i32 %172, %175
  br i1 %197, label %566, label %198

198:                                              ; preds = %194
  %199 = select i1 %15, i32 2, i32 0
  br label %377

200:                                              ; preds = %192, %372
  %201 = phi i32 [ 0, %192 ], [ %375, %372 ]
  %202 = phi i32 [ -1, %192 ], [ %374, %372 ]
  %203 = phi i32 [ 10000, %192 ], [ %373, %372 ]
  %204 = zext i32 %201 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %190, i64 %204
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !4, !amdgpu.noclobber !8
  %207 = icmp slt i32 %206, %172
  %208 = icmp sgt i32 %206, %175
  %209 = select i1 %207, i1 true, i1 %208
  br i1 %209, label %210, label %372

210:                                              ; preds = %200
  %211 = sub i32 %32, %206
  %212 = mul nsw i32 %206, %193
  %213 = add i32 %211, %212
  %214 = icmp sgt i32 %213, 1
  %215 = icmp slt i32 %213, %48
  %216 = select i1 %214, i1 %215, i1 false
  br i1 %216, label %217, label %372

217:                                              ; preds = %210
  %218 = shl nsw i32 %213, 4
  %219 = sext i32 %218 to i64
  %220 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !16
  %221 = zext i8 %220 to i32
  %222 = getelementptr i8, i8 addrspace(1)* %64, i64 %219
  %223 = load i8, i8 addrspace(1)* %222, align 1, !tbaa !16
  %224 = zext i8 %223 to i32
  %225 = icmp ugt i8 %220, %223
  %226 = sub nsw i32 %221, %224
  %227 = sub nsw i32 %224, %221
  %228 = select i1 %225, i32 %226, i32 %227
  %229 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !16
  %230 = zext i8 %229 to i32
  %231 = getelementptr i8, i8 addrspace(1)* %222, i64 1
  %232 = load i8, i8 addrspace(1)* %231, align 1, !tbaa !16
  %233 = zext i8 %232 to i32
  %234 = icmp ugt i8 %229, %232
  %235 = sub nsw i32 %230, %233
  %236 = sub nsw i32 %233, %230
  %237 = select i1 %234, i32 %235, i32 %236
  %238 = add nsw i32 %237, %228
  %239 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !16
  %240 = zext i8 %239 to i32
  %241 = getelementptr i8, i8 addrspace(1)* %222, i64 2
  %242 = load i8, i8 addrspace(1)* %241, align 1, !tbaa !16
  %243 = zext i8 %242 to i32
  %244 = icmp ugt i8 %239, %242
  %245 = sub nsw i32 %240, %243
  %246 = sub nsw i32 %243, %240
  %247 = select i1 %244, i32 %245, i32 %246
  %248 = add nsw i32 %247, %238
  %249 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !16
  %250 = zext i8 %249 to i32
  %251 = getelementptr i8, i8 addrspace(1)* %222, i64 3
  %252 = load i8, i8 addrspace(1)* %251, align 1, !tbaa !16
  %253 = zext i8 %252 to i32
  %254 = icmp ugt i8 %249, %252
  %255 = sub nsw i32 %250, %253
  %256 = sub nsw i32 %253, %250
  %257 = select i1 %254, i32 %255, i32 %256
  %258 = add nsw i32 %257, %248
  %259 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  %260 = zext i8 %259 to i32
  %261 = getelementptr i8, i8 addrspace(1)* %222, i64 4
  %262 = load i8, i8 addrspace(1)* %261, align 1, !tbaa !16
  %263 = zext i8 %262 to i32
  %264 = icmp ugt i8 %259, %262
  %265 = sub nsw i32 %260, %263
  %266 = sub nsw i32 %263, %260
  %267 = select i1 %264, i32 %265, i32 %266
  %268 = add nsw i32 %267, %258
  %269 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !16
  %270 = zext i8 %269 to i32
  %271 = getelementptr i8, i8 addrspace(1)* %222, i64 5
  %272 = load i8, i8 addrspace(1)* %271, align 1, !tbaa !16
  %273 = zext i8 %272 to i32
  %274 = icmp ugt i8 %269, %272
  %275 = sub nsw i32 %270, %273
  %276 = sub nsw i32 %273, %270
  %277 = select i1 %274, i32 %275, i32 %276
  %278 = add nsw i32 %277, %268
  %279 = getelementptr i8, i8 addrspace(1)* %222, i64 6
  %280 = load i8, i8 addrspace(1)* %279, align 1, !tbaa !16
  %281 = zext i8 %280 to i32
  %282 = icmp ugt i8 %103, %280
  %283 = sub nsw i32 %104, %281
  %284 = sub nsw i32 %281, %104
  %285 = select i1 %282, i32 %283, i32 %284
  %286 = add i32 %285, %278
  %287 = getelementptr i8, i8 addrspace(1)* %222, i64 7
  %288 = load i8, i8 addrspace(1)* %287, align 1, !tbaa !16
  %289 = zext i8 %288 to i32
  %290 = icmp ugt i8 %109, %288
  %291 = sub nsw i32 %110, %289
  %292 = sub nsw i32 %289, %110
  %293 = select i1 %290, i32 %291, i32 %292
  %294 = add i32 %293, %286
  %295 = getelementptr i8, i8 addrspace(1)* %222, i64 8
  %296 = load i8, i8 addrspace(1)* %295, align 1, !tbaa !16
  %297 = zext i8 %296 to i32
  %298 = icmp ugt i8 %115, %296
  %299 = sub nsw i32 %116, %297
  %300 = sub nsw i32 %297, %116
  %301 = select i1 %298, i32 %299, i32 %300
  %302 = add i32 %301, %294
  %303 = getelementptr i8, i8 addrspace(1)* %222, i64 9
  %304 = load i8, i8 addrspace(1)* %303, align 1, !tbaa !16
  %305 = zext i8 %304 to i32
  %306 = icmp ugt i8 %121, %304
  %307 = sub nsw i32 %122, %305
  %308 = sub nsw i32 %305, %122
  %309 = select i1 %306, i32 %307, i32 %308
  %310 = add i32 %309, %302
  %311 = getelementptr i8, i8 addrspace(1)* %222, i64 10
  %312 = load i8, i8 addrspace(1)* %311, align 1, !tbaa !16
  %313 = zext i8 %312 to i32
  %314 = icmp ugt i8 %127, %312
  %315 = sub nsw i32 %128, %313
  %316 = sub nsw i32 %313, %128
  %317 = select i1 %314, i32 %315, i32 %316
  %318 = add i32 %317, %310
  %319 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !16
  %320 = zext i8 %319 to i32
  %321 = getelementptr i8, i8 addrspace(1)* %222, i64 11
  %322 = load i8, i8 addrspace(1)* %321, align 1, !tbaa !16
  %323 = zext i8 %322 to i32
  %324 = icmp ugt i8 %319, %322
  %325 = sub nsw i32 %320, %323
  %326 = sub nsw i32 %323, %320
  %327 = select i1 %324, i32 %325, i32 %326
  %328 = add i32 %327, %318
  %329 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !16
  %330 = zext i8 %329 to i32
  %331 = getelementptr i8, i8 addrspace(1)* %222, i64 12
  %332 = load i8, i8 addrspace(1)* %331, align 1, !tbaa !16
  %333 = zext i8 %332 to i32
  %334 = icmp ugt i8 %329, %332
  %335 = sub nsw i32 %330, %333
  %336 = sub nsw i32 %333, %330
  %337 = select i1 %334, i32 %335, i32 %336
  %338 = add i32 %337, %328
  %339 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !16
  %340 = zext i8 %339 to i32
  %341 = getelementptr i8, i8 addrspace(1)* %222, i64 13
  %342 = load i8, i8 addrspace(1)* %341, align 1, !tbaa !16
  %343 = zext i8 %342 to i32
  %344 = icmp ugt i8 %339, %342
  %345 = sub nsw i32 %340, %343
  %346 = sub nsw i32 %343, %340
  %347 = select i1 %344, i32 %345, i32 %346
  %348 = add i32 %347, %338
  %349 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !16
  %350 = zext i8 %349 to i32
  %351 = getelementptr i8, i8 addrspace(1)* %222, i64 14
  %352 = load i8, i8 addrspace(1)* %351, align 1, !tbaa !16
  %353 = zext i8 %352 to i32
  %354 = icmp ugt i8 %349, %352
  %355 = sub nsw i32 %350, %353
  %356 = sub nsw i32 %353, %350
  %357 = select i1 %354, i32 %355, i32 %356
  %358 = add i32 %357, %348
  %359 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !16
  %360 = zext i8 %359 to i32
  %361 = getelementptr i8, i8 addrspace(1)* %222, i64 15
  %362 = load i8, i8 addrspace(1)* %361, align 1, !tbaa !16
  %363 = zext i8 %362 to i32
  %364 = icmp ugt i8 %359, %362
  %365 = sub nsw i32 %360, %363
  %366 = sub nsw i32 %363, %360
  %367 = select i1 %364, i32 %365, i32 %366
  %368 = add i32 %367, %358
  %369 = icmp slt i32 %368, %203
  %370 = tail call i32 @llvm.smin.i32(i32 %368, i32 %203)
  %371 = select i1 %369, i32 %206, i32 %202
  br label %372

372:                                              ; preds = %217, %200, %210
  %373 = phi i32 [ %203, %210 ], [ %203, %200 ], [ %370, %217 ]
  %374 = phi i32 [ %202, %210 ], [ %202, %200 ], [ %371, %217 ]
  %375 = add nuw nsw i32 %201, 1
  %376 = icmp eq i32 %375, %189
  br i1 %376, label %194, label %200, !llvm.loop !17

377:                                              ; preds = %198, %561
  %378 = phi i32 [ %196, %198 ], [ %563, %561 ]
  %379 = phi i32 [ %195, %198 ], [ %562, %561 ]
  %380 = phi i32 [ %172, %198 ], [ %564, %561 ]
  %381 = sub i32 %32, %380
  %382 = mul nuw nsw i32 %380, %199
  %383 = add i32 %381, %382
  %384 = icmp sgt i32 %383, 1
  %385 = icmp slt i32 %383, %48
  %386 = select i1 %384, i1 %385, i1 false
  br i1 %386, label %387, label %561

387:                                              ; preds = %377
  %388 = shl nsw i32 %383, 4
  %389 = sext i32 %388 to i64
  %390 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !16
  %391 = zext i8 %390 to i32
  %392 = getelementptr i8, i8 addrspace(1)* %64, i64 %389
  %393 = load i8, i8 addrspace(1)* %392, align 1, !tbaa !16
  %394 = zext i8 %393 to i32
  %395 = icmp ugt i8 %390, %393
  %396 = sub nsw i32 %391, %394
  %397 = sub nsw i32 %394, %391
  %398 = select i1 %395, i32 %396, i32 %397
  %399 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !16
  %400 = zext i8 %399 to i32
  %401 = getelementptr i8, i8 addrspace(1)* %392, i64 1
  %402 = load i8, i8 addrspace(1)* %401, align 1, !tbaa !16
  %403 = zext i8 %402 to i32
  %404 = icmp ugt i8 %399, %402
  %405 = sub nsw i32 %400, %403
  %406 = sub nsw i32 %403, %400
  %407 = select i1 %404, i32 %405, i32 %406
  %408 = add nsw i32 %407, %398
  %409 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !16
  %410 = zext i8 %409 to i32
  %411 = getelementptr i8, i8 addrspace(1)* %392, i64 2
  %412 = load i8, i8 addrspace(1)* %411, align 1, !tbaa !16
  %413 = zext i8 %412 to i32
  %414 = icmp ugt i8 %409, %412
  %415 = sub nsw i32 %410, %413
  %416 = sub nsw i32 %413, %410
  %417 = select i1 %414, i32 %415, i32 %416
  %418 = add nsw i32 %417, %408
  %419 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !16
  %420 = zext i8 %419 to i32
  %421 = getelementptr i8, i8 addrspace(1)* %392, i64 3
  %422 = load i8, i8 addrspace(1)* %421, align 1, !tbaa !16
  %423 = zext i8 %422 to i32
  %424 = icmp ugt i8 %419, %422
  %425 = sub nsw i32 %420, %423
  %426 = sub nsw i32 %423, %420
  %427 = select i1 %424, i32 %425, i32 %426
  %428 = add nsw i32 %427, %418
  %429 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  %430 = zext i8 %429 to i32
  %431 = getelementptr i8, i8 addrspace(1)* %392, i64 4
  %432 = load i8, i8 addrspace(1)* %431, align 1, !tbaa !16
  %433 = zext i8 %432 to i32
  %434 = icmp ugt i8 %429, %432
  %435 = sub nsw i32 %430, %433
  %436 = sub nsw i32 %433, %430
  %437 = select i1 %434, i32 %435, i32 %436
  %438 = add nsw i32 %437, %428
  %439 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !16
  %440 = zext i8 %439 to i32
  %441 = getelementptr i8, i8 addrspace(1)* %392, i64 5
  %442 = load i8, i8 addrspace(1)* %441, align 1, !tbaa !16
  %443 = zext i8 %442 to i32
  %444 = icmp ugt i8 %439, %442
  %445 = sub nsw i32 %440, %443
  %446 = sub nsw i32 %443, %440
  %447 = select i1 %444, i32 %445, i32 %446
  %448 = add nsw i32 %447, %438
  %449 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !16
  %450 = zext i8 %449 to i32
  %451 = getelementptr i8, i8 addrspace(1)* %392, i64 6
  %452 = load i8, i8 addrspace(1)* %451, align 1, !tbaa !16
  %453 = zext i8 %452 to i32
  %454 = icmp ugt i8 %449, %452
  %455 = sub nsw i32 %450, %453
  %456 = sub nsw i32 %453, %450
  %457 = select i1 %454, i32 %455, i32 %456
  %458 = add nsw i32 %457, %448
  %459 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !16
  %460 = zext i8 %459 to i32
  %461 = getelementptr i8, i8 addrspace(1)* %392, i64 7
  %462 = load i8, i8 addrspace(1)* %461, align 1, !tbaa !16
  %463 = zext i8 %462 to i32
  %464 = icmp ugt i8 %459, %462
  %465 = sub nsw i32 %460, %463
  %466 = sub nsw i32 %463, %460
  %467 = select i1 %464, i32 %465, i32 %466
  %468 = add nsw i32 %467, %458
  %469 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !16
  %470 = zext i8 %469 to i32
  %471 = getelementptr i8, i8 addrspace(1)* %392, i64 8
  %472 = load i8, i8 addrspace(1)* %471, align 1, !tbaa !16
  %473 = zext i8 %472 to i32
  %474 = icmp ugt i8 %469, %472
  %475 = sub nsw i32 %470, %473
  %476 = sub nsw i32 %473, %470
  %477 = select i1 %474, i32 %475, i32 %476
  %478 = add nsw i32 %477, %468
  %479 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !16
  %480 = zext i8 %479 to i32
  %481 = getelementptr i8, i8 addrspace(1)* %392, i64 9
  %482 = load i8, i8 addrspace(1)* %481, align 1, !tbaa !16
  %483 = zext i8 %482 to i32
  %484 = icmp ugt i8 %479, %482
  %485 = sub nsw i32 %480, %483
  %486 = sub nsw i32 %483, %480
  %487 = select i1 %484, i32 %485, i32 %486
  %488 = add nsw i32 %487, %478
  %489 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !16
  %490 = zext i8 %489 to i32
  %491 = getelementptr i8, i8 addrspace(1)* %392, i64 10
  %492 = load i8, i8 addrspace(1)* %491, align 1, !tbaa !16
  %493 = zext i8 %492 to i32
  %494 = icmp ugt i8 %489, %492
  %495 = sub nsw i32 %490, %493
  %496 = sub nsw i32 %493, %490
  %497 = select i1 %494, i32 %495, i32 %496
  %498 = add nsw i32 %497, %488
  %499 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !16
  %500 = zext i8 %499 to i32
  %501 = getelementptr i8, i8 addrspace(1)* %392, i64 11
  %502 = load i8, i8 addrspace(1)* %501, align 1, !tbaa !16
  %503 = zext i8 %502 to i32
  %504 = icmp ugt i8 %499, %502
  %505 = sub nsw i32 %500, %503
  %506 = sub nsw i32 %503, %500
  %507 = select i1 %504, i32 %505, i32 %506
  %508 = add nsw i32 %507, %498
  %509 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !16
  %510 = zext i8 %509 to i32
  %511 = getelementptr i8, i8 addrspace(1)* %392, i64 12
  %512 = load i8, i8 addrspace(1)* %511, align 1, !tbaa !16
  %513 = zext i8 %512 to i32
  %514 = icmp ugt i8 %509, %512
  %515 = sub nsw i32 %510, %513
  %516 = sub nsw i32 %513, %510
  %517 = select i1 %514, i32 %515, i32 %516
  %518 = add nsw i32 %517, %508
  %519 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !16
  %520 = zext i8 %519 to i32
  %521 = getelementptr i8, i8 addrspace(1)* %392, i64 13
  %522 = load i8, i8 addrspace(1)* %521, align 1, !tbaa !16
  %523 = zext i8 %522 to i32
  %524 = icmp ugt i8 %519, %522
  %525 = sub nsw i32 %520, %523
  %526 = sub nsw i32 %523, %520
  %527 = select i1 %524, i32 %525, i32 %526
  %528 = add nsw i32 %527, %518
  %529 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !16
  %530 = zext i8 %529 to i32
  %531 = getelementptr i8, i8 addrspace(1)* %392, i64 14
  %532 = load i8, i8 addrspace(1)* %531, align 1, !tbaa !16
  %533 = zext i8 %532 to i32
  %534 = icmp ugt i8 %529, %532
  %535 = sub nsw i32 %530, %533
  %536 = sub nsw i32 %533, %530
  %537 = select i1 %534, i32 %535, i32 %536
  %538 = add nsw i32 %537, %528
  %539 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !16
  %540 = zext i8 %539 to i32
  %541 = getelementptr i8, i8 addrspace(1)* %392, i64 15
  %542 = load i8, i8 addrspace(1)* %541, align 1, !tbaa !16
  %543 = zext i8 %542 to i32
  %544 = icmp ugt i8 %539, %542
  %545 = sub nsw i32 %540, %543
  %546 = sub nsw i32 %543, %540
  %547 = select i1 %544, i32 %545, i32 %546
  %548 = add nsw i32 %547, %538
  br i1 %43, label %555, label %549

549:                                              ; preds = %387
  %550 = sub nsw i32 %380, %170
  %551 = tail call i32 @llvm.abs.i32(i32 %550, i1 true)
  %552 = zext i32 %551 to i64
  %553 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %552
  %554 = load i32, i32 addrspace(1)* %553, align 4, !tbaa !4, !amdgpu.noclobber !8
  br label %555

555:                                              ; preds = %387, %549
  %556 = phi i32 [ %554, %549 ], [ 0, %387 ]
  %557 = add nsw i32 %556, %548
  %558 = icmp slt i32 %557, %379
  %559 = tail call i32 @llvm.smin.i32(i32 %557, i32 %379)
  %560 = select i1 %558, i32 %380, i32 %378
  br label %561

561:                                              ; preds = %555, %377
  %562 = phi i32 [ %379, %377 ], [ %559, %555 ]
  %563 = phi i32 [ %378, %377 ], [ %560, %555 ]
  %564 = add nuw nsw i32 %380, 1
  %565 = icmp slt i32 %380, %175
  br i1 %565, label %377, label %566, !llvm.loop !19

566:                                              ; preds = %561, %194
  %567 = phi i32 [ %196, %194 ], [ %563, %561 ]
  %568 = tail call i32 @llvm.smax.i32(i32 %567, i32 -1)
  %569 = sitofp i32 %568 to float
  %570 = zext i32 %45 to i64
  %571 = getelementptr inbounds float, float addrspace(1)* %16, i64 %570
  store float %569, float addrspace(1)* %571, align 4, !tbaa !11
  br label %572

572:                                              ; preds = %566, %47, %29, %50, %17
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"bool", !6, i64 0}
!15 = !{i8 0, i8 2}
!16 = !{!6, !6, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
