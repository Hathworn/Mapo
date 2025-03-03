; ModuleID = '../data/hip_kernels/14377/17/main.cu'
source_filename = "../data/hip_kernels/14377/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z11simple_sinfPfmiff(float addrspace(1)* nocapture writeonly %0, i64 %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %17, label %472

17:                                               ; preds = %5
  %18 = sitofp i32 %14 to float
  %19 = fmul contract float %18, %3
  %20 = fadd contract float %19, %4
  %21 = shl nsw i32 %14, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float %20, float addrspace(1)* %23, align 4, !tbaa !7
  switch i32 %2, label %472 [
    i32 0, label %24
    i32 1, label %167
    i32 2, label %306
    i32 3, label %453
  ]

24:                                               ; preds = %17
  %25 = tail call float @llvm.fabs.f32(float %20)
  %26 = fcmp olt float %25, 1.310720e+05
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = fmul float %25, 0x3FE45F3060000000
  %29 = tail call float @llvm.rint.f32(float %28)
  %30 = tail call float @llvm.fma.f32(float %29, float 0xBFF921FB40000000, float %25)
  %31 = tail call float @llvm.fma.f32(float %29, float 0xBE74442D00000000, float %30)
  %32 = tail call float @llvm.fma.f32(float %29, float 0xBCF8469880000000, float %31)
  %33 = fptosi float %29 to i32
  %34 = bitcast float %25 to i32
  br label %141

35:                                               ; preds = %24
  %36 = bitcast float %25 to i32
  %37 = lshr i32 %36, 23
  %38 = and i32 %36, 8388607
  %39 = or i32 %38, 8388608
  %40 = zext i32 %39 to i64
  %41 = mul nuw nsw i64 %40, 4266746795
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %41, 32
  %44 = mul nuw nsw i64 %40, 1011060801
  %45 = add nuw nsw i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %40, 3680671129
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %40, 4113882560
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %40, 4230436817
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %40, 1313084713
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %40, 2734261102
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = trunc i64 %67 to i32
  %69 = add nsw i32 %37, -120
  %70 = icmp ugt i32 %69, 63
  %71 = select i1 %70, i32 %62, i32 %68
  %72 = select i1 %70, i32 %58, i32 %66
  %73 = select i1 %70, i32 %54, i32 %62
  %74 = select i1 %70, i32 %50, i32 %58
  %75 = select i1 %70, i32 %46, i32 %54
  %76 = select i1 %70, i32 %42, i32 %50
  %77 = select i1 %70, i32 -64, i32 0
  %78 = add nsw i32 %77, %69
  %79 = icmp ugt i32 %78, 31
  %80 = select i1 %79, i32 %72, i32 %71
  %81 = select i1 %79, i32 %73, i32 %72
  %82 = select i1 %79, i32 %74, i32 %73
  %83 = select i1 %79, i32 %75, i32 %74
  %84 = select i1 %79, i32 %76, i32 %75
  %85 = select i1 %79, i32 -32, i32 0
  %86 = add nsw i32 %85, %78
  %87 = icmp ugt i32 %86, 31
  %88 = select i1 %87, i32 %81, i32 %80
  %89 = select i1 %87, i32 %82, i32 %81
  %90 = select i1 %87, i32 %83, i32 %82
  %91 = select i1 %87, i32 %84, i32 %83
  %92 = select i1 %87, i32 -32, i32 0
  %93 = add nsw i32 %92, %86
  %94 = icmp eq i32 %93, 0
  %95 = sub nsw i32 32, %93
  %96 = tail call i32 @llvm.fshr.i32(i32 %88, i32 %89, i32 %95)
  %97 = tail call i32 @llvm.fshr.i32(i32 %89, i32 %90, i32 %95)
  %98 = tail call i32 @llvm.fshr.i32(i32 %90, i32 %91, i32 %95)
  %99 = select i1 %94, i32 %88, i32 %96
  %100 = select i1 %94, i32 %89, i32 %97
  %101 = select i1 %94, i32 %90, i32 %98
  %102 = lshr i32 %99, 29
  %103 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %100, i32 2)
  %104 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %101, i32 2)
  %105 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %91, i32 2)
  %106 = and i32 %102, 1
  %107 = sub nsw i32 0, %106
  %108 = shl i32 %102, 31
  %109 = xor i32 %103, %107
  %110 = xor i32 %104, %107
  %111 = xor i32 %105, %107
  %112 = tail call i32 @llvm.ctlz.i32(i32 %109, i1 false), !range !11
  %113 = sub nsw i32 31, %112
  %114 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %113)
  %115 = tail call i32 @llvm.fshr.i32(i32 %110, i32 %111, i32 %113)
  %116 = shl nuw nsw i32 %112, 23
  %117 = sub nuw nsw i32 1056964608, %116
  %118 = lshr i32 %114, 9
  %119 = or i32 %118, %117
  %120 = or i32 %119, %108
  %121 = bitcast i32 %120 to float
  %122 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %115, i32 23)
  %123 = tail call i32 @llvm.ctlz.i32(i32 %122, i1 false), !range !11
  %124 = fmul float %121, 0x3FF921FB40000000
  %125 = add nuw nsw i32 %123, %112
  %126 = shl nuw nsw i32 %125, 23
  %127 = sub nuw nsw i32 855638016, %126
  %128 = sub nsw i32 31, %123
  %129 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %115, i32 %128)
  %130 = lshr i32 %129, 9
  %131 = or i32 %127, %130
  %132 = or i32 %131, %108
  %133 = bitcast i32 %132 to float
  %134 = fneg float %124
  %135 = tail call float @llvm.fma.f32(float %121, float 0x3FF921FB40000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %121, float 0x3E74442D00000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %133, float 0x3FF921FB40000000, float %136)
  %138 = fadd float %124, %137
  %139 = lshr i32 %99, 30
  %140 = add nuw nsw i32 %106, %139
  br label %141

141:                                              ; preds = %27, %35
  %142 = phi i32 [ %34, %27 ], [ %36, %35 ]
  %143 = phi float [ %32, %27 ], [ %138, %35 ]
  %144 = phi i32 [ %33, %27 ], [ %140, %35 ]
  %145 = fmul float %143, %143
  %146 = tail call float @llvm.fmuladd.f32(float %145, float 0xBF29833040000000, float 0x3F81103880000000)
  %147 = tail call float @llvm.fmuladd.f32(float %145, float %146, float 0xBFC55553A0000000)
  %148 = fmul float %145, %147
  %149 = tail call float @llvm.fmuladd.f32(float %143, float %148, float %143)
  %150 = tail call float @llvm.fmuladd.f32(float %145, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %151 = tail call float @llvm.fmuladd.f32(float %145, float %150, float 0x3FA5557EE0000000)
  %152 = tail call float @llvm.fmuladd.f32(float %145, float %151, float 0xBFE0000080000000)
  %153 = tail call float @llvm.fmuladd.f32(float %145, float %152, float 1.000000e+00)
  %154 = and i32 %144, 1
  %155 = icmp eq i32 %154, 0
  %156 = select i1 %155, float %149, float %153
  %157 = bitcast float %156 to i32
  %158 = shl i32 %144, 30
  %159 = and i32 %158, -2147483648
  %160 = bitcast float %20 to i32
  %161 = xor i32 %142, %160
  %162 = xor i32 %161, %159
  %163 = xor i32 %162, %157
  %164 = bitcast i32 %163 to float
  %165 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 504)
  %166 = select i1 %165, float %164, float 0x7FF8000000000000
  br label %467

167:                                              ; preds = %17
  %168 = tail call float @llvm.fabs.f32(float %20)
  %169 = fcmp olt float %168, 1.310720e+05
  br i1 %169, label %170, label %177

170:                                              ; preds = %167
  %171 = fmul float %168, 0x3FE45F3060000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = tail call float @llvm.fma.f32(float %172, float 0xBFF921FB40000000, float %168)
  %174 = tail call float @llvm.fma.f32(float %172, float 0xBE74442D00000000, float %173)
  %175 = tail call float @llvm.fma.f32(float %172, float 0xBCF8469880000000, float %174)
  %176 = fptosi float %172 to i32
  br label %283

177:                                              ; preds = %167
  %178 = bitcast float %168 to i32
  %179 = lshr i32 %178, 23
  %180 = and i32 %178, 8388607
  %181 = or i32 %180, 8388608
  %182 = zext i32 %181 to i64
  %183 = mul nuw nsw i64 %182, 4266746795
  %184 = trunc i64 %183 to i32
  %185 = lshr i64 %183, 32
  %186 = mul nuw nsw i64 %182, 1011060801
  %187 = add nuw nsw i64 %185, %186
  %188 = trunc i64 %187 to i32
  %189 = lshr i64 %187, 32
  %190 = mul nuw nsw i64 %182, 3680671129
  %191 = add nuw nsw i64 %189, %190
  %192 = trunc i64 %191 to i32
  %193 = lshr i64 %191, 32
  %194 = mul nuw nsw i64 %182, 4113882560
  %195 = add nuw nsw i64 %193, %194
  %196 = trunc i64 %195 to i32
  %197 = lshr i64 %195, 32
  %198 = mul nuw nsw i64 %182, 4230436817
  %199 = add nuw nsw i64 %197, %198
  %200 = trunc i64 %199 to i32
  %201 = lshr i64 %199, 32
  %202 = mul nuw nsw i64 %182, 1313084713
  %203 = add nuw nsw i64 %201, %202
  %204 = trunc i64 %203 to i32
  %205 = lshr i64 %203, 32
  %206 = mul nuw nsw i64 %182, 2734261102
  %207 = add nuw nsw i64 %205, %206
  %208 = trunc i64 %207 to i32
  %209 = lshr i64 %207, 32
  %210 = trunc i64 %209 to i32
  %211 = add nsw i32 %179, -120
  %212 = icmp ugt i32 %211, 63
  %213 = select i1 %212, i32 %204, i32 %210
  %214 = select i1 %212, i32 %200, i32 %208
  %215 = select i1 %212, i32 %196, i32 %204
  %216 = select i1 %212, i32 %192, i32 %200
  %217 = select i1 %212, i32 %188, i32 %196
  %218 = select i1 %212, i32 %184, i32 %192
  %219 = select i1 %212, i32 -64, i32 0
  %220 = add nsw i32 %219, %211
  %221 = icmp ugt i32 %220, 31
  %222 = select i1 %221, i32 %214, i32 %213
  %223 = select i1 %221, i32 %215, i32 %214
  %224 = select i1 %221, i32 %216, i32 %215
  %225 = select i1 %221, i32 %217, i32 %216
  %226 = select i1 %221, i32 %218, i32 %217
  %227 = select i1 %221, i32 -32, i32 0
  %228 = add nsw i32 %227, %220
  %229 = icmp ugt i32 %228, 31
  %230 = select i1 %229, i32 %223, i32 %222
  %231 = select i1 %229, i32 %224, i32 %223
  %232 = select i1 %229, i32 %225, i32 %224
  %233 = select i1 %229, i32 %226, i32 %225
  %234 = select i1 %229, i32 -32, i32 0
  %235 = add nsw i32 %234, %228
  %236 = icmp eq i32 %235, 0
  %237 = sub nsw i32 32, %235
  %238 = tail call i32 @llvm.fshr.i32(i32 %230, i32 %231, i32 %237)
  %239 = tail call i32 @llvm.fshr.i32(i32 %231, i32 %232, i32 %237)
  %240 = tail call i32 @llvm.fshr.i32(i32 %232, i32 %233, i32 %237)
  %241 = select i1 %236, i32 %230, i32 %238
  %242 = select i1 %236, i32 %231, i32 %239
  %243 = select i1 %236, i32 %232, i32 %240
  %244 = lshr i32 %241, 29
  %245 = tail call i32 @llvm.fshl.i32(i32 %241, i32 %242, i32 2)
  %246 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %243, i32 2)
  %247 = tail call i32 @llvm.fshl.i32(i32 %243, i32 %233, i32 2)
  %248 = and i32 %244, 1
  %249 = sub nsw i32 0, %248
  %250 = shl i32 %244, 31
  %251 = xor i32 %245, %249
  %252 = xor i32 %246, %249
  %253 = xor i32 %247, %249
  %254 = tail call i32 @llvm.ctlz.i32(i32 %251, i1 false), !range !11
  %255 = sub nsw i32 31, %254
  %256 = tail call i32 @llvm.fshr.i32(i32 %251, i32 %252, i32 %255)
  %257 = tail call i32 @llvm.fshr.i32(i32 %252, i32 %253, i32 %255)
  %258 = shl nuw nsw i32 %254, 23
  %259 = sub nuw nsw i32 1056964608, %258
  %260 = lshr i32 %256, 9
  %261 = or i32 %260, %259
  %262 = or i32 %261, %250
  %263 = bitcast i32 %262 to float
  %264 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %257, i32 23)
  %265 = tail call i32 @llvm.ctlz.i32(i32 %264, i1 false), !range !11
  %266 = fmul float %263, 0x3FF921FB40000000
  %267 = add nuw nsw i32 %265, %254
  %268 = shl nuw nsw i32 %267, 23
  %269 = sub nuw nsw i32 855638016, %268
  %270 = sub nsw i32 31, %265
  %271 = tail call i32 @llvm.fshr.i32(i32 %264, i32 %257, i32 %270)
  %272 = lshr i32 %271, 9
  %273 = or i32 %269, %272
  %274 = or i32 %273, %250
  %275 = bitcast i32 %274 to float
  %276 = fneg float %266
  %277 = tail call float @llvm.fma.f32(float %263, float 0x3FF921FB40000000, float %276)
  %278 = tail call float @llvm.fma.f32(float %263, float 0x3E74442D00000000, float %277)
  %279 = tail call float @llvm.fma.f32(float %275, float 0x3FF921FB40000000, float %278)
  %280 = fadd float %266, %279
  %281 = lshr i32 %241, 30
  %282 = add nuw nsw i32 %248, %281
  br label %283

283:                                              ; preds = %170, %177
  %284 = phi float [ %175, %170 ], [ %280, %177 ]
  %285 = phi i32 [ %176, %170 ], [ %282, %177 ]
  %286 = fmul float %284, %284
  %287 = tail call float @llvm.fmuladd.f32(float %286, float 0xBF29833040000000, float 0x3F81103880000000)
  %288 = tail call float @llvm.fmuladd.f32(float %286, float %287, float 0xBFC55553A0000000)
  %289 = fmul float %286, %288
  %290 = tail call float @llvm.fmuladd.f32(float %284, float %289, float %284)
  %291 = tail call float @llvm.fmuladd.f32(float %286, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %292 = tail call float @llvm.fmuladd.f32(float %286, float %291, float 0x3FA5557EE0000000)
  %293 = tail call float @llvm.fmuladd.f32(float %286, float %292, float 0xBFE0000080000000)
  %294 = tail call float @llvm.fmuladd.f32(float %286, float %293, float 1.000000e+00)
  %295 = fneg float %290
  %296 = and i32 %285, 1
  %297 = icmp eq i32 %296, 0
  %298 = select i1 %297, float %294, float %295
  %299 = bitcast float %298 to i32
  %300 = shl i32 %285, 30
  %301 = and i32 %300, -2147483648
  %302 = xor i32 %301, %299
  %303 = bitcast i32 %302 to float
  %304 = tail call i1 @llvm.amdgcn.class.f32(float %168, i32 504)
  %305 = select i1 %304, float %303, float 0x7FF8000000000000
  br label %467

306:                                              ; preds = %17
  %307 = tail call float @llvm.fabs.f32(float %20)
  %308 = fcmp olt float %307, 1.310720e+05
  br i1 %308, label %309, label %317

309:                                              ; preds = %306
  %310 = fmul float %307, 0x3FE45F3060000000
  %311 = tail call float @llvm.rint.f32(float %310)
  %312 = tail call float @llvm.fma.f32(float %311, float 0xBFF921FB40000000, float %307)
  %313 = tail call float @llvm.fma.f32(float %311, float 0xBE74442D00000000, float %312)
  %314 = tail call float @llvm.fma.f32(float %311, float 0xBCF8469880000000, float %313)
  %315 = fptosi float %311 to i32
  %316 = bitcast float %307 to i32
  br label %423

317:                                              ; preds = %306
  %318 = bitcast float %307 to i32
  %319 = lshr i32 %318, 23
  %320 = and i32 %318, 8388607
  %321 = or i32 %320, 8388608
  %322 = zext i32 %321 to i64
  %323 = mul nuw nsw i64 %322, 4266746795
  %324 = trunc i64 %323 to i32
  %325 = lshr i64 %323, 32
  %326 = mul nuw nsw i64 %322, 1011060801
  %327 = add nuw nsw i64 %325, %326
  %328 = trunc i64 %327 to i32
  %329 = lshr i64 %327, 32
  %330 = mul nuw nsw i64 %322, 3680671129
  %331 = add nuw nsw i64 %329, %330
  %332 = trunc i64 %331 to i32
  %333 = lshr i64 %331, 32
  %334 = mul nuw nsw i64 %322, 4113882560
  %335 = add nuw nsw i64 %333, %334
  %336 = trunc i64 %335 to i32
  %337 = lshr i64 %335, 32
  %338 = mul nuw nsw i64 %322, 4230436817
  %339 = add nuw nsw i64 %337, %338
  %340 = trunc i64 %339 to i32
  %341 = lshr i64 %339, 32
  %342 = mul nuw nsw i64 %322, 1313084713
  %343 = add nuw nsw i64 %341, %342
  %344 = trunc i64 %343 to i32
  %345 = lshr i64 %343, 32
  %346 = mul nuw nsw i64 %322, 2734261102
  %347 = add nuw nsw i64 %345, %346
  %348 = trunc i64 %347 to i32
  %349 = lshr i64 %347, 32
  %350 = trunc i64 %349 to i32
  %351 = add nsw i32 %319, -120
  %352 = icmp ugt i32 %351, 63
  %353 = select i1 %352, i32 %344, i32 %350
  %354 = select i1 %352, i32 %340, i32 %348
  %355 = select i1 %352, i32 %336, i32 %344
  %356 = select i1 %352, i32 %332, i32 %340
  %357 = select i1 %352, i32 %328, i32 %336
  %358 = select i1 %352, i32 %324, i32 %332
  %359 = select i1 %352, i32 -64, i32 0
  %360 = add nsw i32 %359, %351
  %361 = icmp ugt i32 %360, 31
  %362 = select i1 %361, i32 %354, i32 %353
  %363 = select i1 %361, i32 %355, i32 %354
  %364 = select i1 %361, i32 %356, i32 %355
  %365 = select i1 %361, i32 %357, i32 %356
  %366 = select i1 %361, i32 %358, i32 %357
  %367 = select i1 %361, i32 -32, i32 0
  %368 = add nsw i32 %367, %360
  %369 = icmp ugt i32 %368, 31
  %370 = select i1 %369, i32 %363, i32 %362
  %371 = select i1 %369, i32 %364, i32 %363
  %372 = select i1 %369, i32 %365, i32 %364
  %373 = select i1 %369, i32 %366, i32 %365
  %374 = select i1 %369, i32 -32, i32 0
  %375 = add nsw i32 %374, %368
  %376 = icmp eq i32 %375, 0
  %377 = sub nsw i32 32, %375
  %378 = tail call i32 @llvm.fshr.i32(i32 %370, i32 %371, i32 %377)
  %379 = tail call i32 @llvm.fshr.i32(i32 %371, i32 %372, i32 %377)
  %380 = tail call i32 @llvm.fshr.i32(i32 %372, i32 %373, i32 %377)
  %381 = select i1 %376, i32 %370, i32 %378
  %382 = select i1 %376, i32 %371, i32 %379
  %383 = select i1 %376, i32 %372, i32 %380
  %384 = lshr i32 %381, 29
  %385 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %382, i32 2)
  %386 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %383, i32 2)
  %387 = tail call i32 @llvm.fshl.i32(i32 %383, i32 %373, i32 2)
  %388 = and i32 %384, 1
  %389 = sub nsw i32 0, %388
  %390 = shl i32 %384, 31
  %391 = xor i32 %385, %389
  %392 = xor i32 %386, %389
  %393 = xor i32 %387, %389
  %394 = tail call i32 @llvm.ctlz.i32(i32 %391, i1 false), !range !11
  %395 = sub nsw i32 31, %394
  %396 = tail call i32 @llvm.fshr.i32(i32 %391, i32 %392, i32 %395)
  %397 = tail call i32 @llvm.fshr.i32(i32 %392, i32 %393, i32 %395)
  %398 = shl nuw nsw i32 %394, 23
  %399 = sub nuw nsw i32 1056964608, %398
  %400 = lshr i32 %396, 9
  %401 = or i32 %400, %399
  %402 = or i32 %401, %390
  %403 = bitcast i32 %402 to float
  %404 = tail call i32 @llvm.fshl.i32(i32 %396, i32 %397, i32 23)
  %405 = tail call i32 @llvm.ctlz.i32(i32 %404, i1 false), !range !11
  %406 = fmul float %403, 0x3FF921FB40000000
  %407 = add nuw nsw i32 %405, %394
  %408 = shl nuw nsw i32 %407, 23
  %409 = sub nuw nsw i32 855638016, %408
  %410 = sub nsw i32 31, %405
  %411 = tail call i32 @llvm.fshr.i32(i32 %404, i32 %397, i32 %410)
  %412 = lshr i32 %411, 9
  %413 = or i32 %409, %412
  %414 = or i32 %413, %390
  %415 = bitcast i32 %414 to float
  %416 = fneg float %406
  %417 = tail call float @llvm.fma.f32(float %403, float 0x3FF921FB40000000, float %416)
  %418 = tail call float @llvm.fma.f32(float %403, float 0x3E74442D00000000, float %417)
  %419 = tail call float @llvm.fma.f32(float %415, float 0x3FF921FB40000000, float %418)
  %420 = fadd float %406, %419
  %421 = lshr i32 %381, 30
  %422 = add nuw nsw i32 %388, %421
  br label %423

423:                                              ; preds = %309, %317
  %424 = phi i32 [ %316, %309 ], [ %318, %317 ]
  %425 = phi float [ %314, %309 ], [ %420, %317 ]
  %426 = phi i32 [ %315, %309 ], [ %422, %317 ]
  %427 = and i32 %426, 1
  %428 = fmul float %425, %425
  %429 = tail call float @llvm.fmuladd.f32(float %428, float 0xBF919DBA60000000, float 0x3FD8A8B0E0000000)
  %430 = tail call float @llvm.fmuladd.f32(float %428, float 0x3F92E29000000000, float 0xBFE07266E0000000)
  %431 = tail call float @llvm.fmuladd.f32(float %428, float %430, float 0x3FF27E84A0000000)
  %432 = tail call float @llvm.amdgcn.rcp.f32(float %431)
  %433 = fmul float %429, %432
  %434 = fmul float %428, %433
  %435 = tail call float @llvm.fma.f32(float %434, float %425, float %425)
  %436 = fsub float %435, %425
  %437 = fneg float %436
  %438 = tail call float @llvm.fma.f32(float %434, float %425, float %437)
  %439 = tail call float @llvm.amdgcn.rcp.f32(float %435)
  %440 = fneg float %439
  %441 = tail call float @llvm.fma.f32(float %435, float %440, float 1.000000e+00)
  %442 = tail call float @llvm.fma.f32(float %438, float %440, float %441)
  %443 = tail call float @llvm.fma.f32(float %442, float %440, float %440)
  %444 = icmp eq i32 %427, 0
  %445 = select i1 %444, float %435, float %443
  %446 = bitcast float %445 to i32
  %447 = bitcast float %20 to i32
  %448 = xor i32 %424, %447
  %449 = xor i32 %448, %446
  %450 = bitcast i32 %449 to float
  %451 = tail call i1 @llvm.amdgcn.class.f32(float %307, i32 504)
  %452 = select i1 %451, float %450, float 0x7FF8000000000000
  br label %467

453:                                              ; preds = %17
  %454 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 144)
  %455 = select i1 %454, float 0x41F0000000000000, float 1.000000e+00
  %456 = fmul float %20, %455
  %457 = tail call float @llvm.log2.f32(float %456)
  %458 = fmul float %457, 0x3FD3441340000000
  %459 = tail call i1 @llvm.amdgcn.class.f32(float %457, i32 519)
  %460 = fneg float %458
  %461 = tail call float @llvm.fma.f32(float %457, float 0x3FD3441340000000, float %460)
  %462 = tail call float @llvm.fma.f32(float %457, float 0x3E509F79E0000000, float %461)
  %463 = fadd float %458, %462
  %464 = select i1 %459, float %457, float %463
  %465 = select i1 %454, float 0x4023441360000000, float 0.000000e+00
  %466 = fsub float %464, %465
  br label %467

467:                                              ; preds = %453, %423, %283, %141
  %468 = phi float [ %166, %141 ], [ %305, %283 ], [ %452, %423 ], [ %466, %453 ]
  %469 = add nuw nsw i32 %21, 1
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds float, float addrspace(1)* %0, i64 %470
  store float %468, float addrspace(1)* %471, align 4, !tbaa !7
  br label %472

472:                                              ; preds = %467, %17, %5
  ret void
}

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
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{i32 0, i32 33}
