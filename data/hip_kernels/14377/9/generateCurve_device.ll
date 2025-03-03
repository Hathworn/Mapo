; ModuleID = '../data/hip_kernels/14377/9/main.cu'
source_filename = "../data/hip_kernels/14377/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z13generateCurveffPffm(float %0, float %1, float addrspace(1)* nocapture writeonly %2, float %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sitofp i32 %14 to float
  %16 = fmul contract float %15, %1
  %17 = fadd contract float %16, %3
  %18 = sext i32 %14 to i64
  %19 = icmp ult i64 %18, %4
  br i1 %19, label %20, label %458

20:                                               ; preds = %5
  %21 = fmul contract float %17, %0
  %22 = fadd contract float %21, %0
  %23 = tail call float @llvm.fabs.f32(float %22)
  %24 = fcmp olt float %23, 1.310720e+05
  br i1 %24, label %25, label %32

25:                                               ; preds = %20
  %26 = fmul float %23, 0x3FE45F3060000000
  %27 = tail call float @llvm.rint.f32(float %26)
  %28 = tail call float @llvm.fma.f32(float %27, float 0xBFF921FB40000000, float %23)
  %29 = tail call float @llvm.fma.f32(float %27, float 0xBE74442D00000000, float %28)
  %30 = tail call float @llvm.fma.f32(float %27, float 0xBCF8469880000000, float %29)
  %31 = fptosi float %27 to i32
  br label %138

32:                                               ; preds = %20
  %33 = bitcast float %23 to i32
  %34 = lshr i32 %33, 23
  %35 = and i32 %33, 8388607
  %36 = or i32 %35, 8388608
  %37 = zext i32 %36 to i64
  %38 = mul nuw nsw i64 %37, 4266746795
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = mul nuw nsw i64 %37, 1011060801
  %42 = add nuw nsw i64 %40, %41
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = mul nuw nsw i64 %37, 3680671129
  %46 = add nuw nsw i64 %44, %45
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %37, 4113882560
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %37, 4230436817
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %37, 1313084713
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %37, 2734261102
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = trunc i64 %64 to i32
  %66 = add nsw i32 %34, -120
  %67 = icmp ugt i32 %66, 63
  %68 = select i1 %67, i32 %59, i32 %65
  %69 = select i1 %67, i32 %55, i32 %63
  %70 = select i1 %67, i32 %51, i32 %59
  %71 = select i1 %67, i32 %47, i32 %55
  %72 = select i1 %67, i32 %43, i32 %51
  %73 = select i1 %67, i32 %39, i32 %47
  %74 = select i1 %67, i32 -64, i32 0
  %75 = add nsw i32 %74, %66
  %76 = icmp ugt i32 %75, 31
  %77 = select i1 %76, i32 %69, i32 %68
  %78 = select i1 %76, i32 %70, i32 %69
  %79 = select i1 %76, i32 %71, i32 %70
  %80 = select i1 %76, i32 %72, i32 %71
  %81 = select i1 %76, i32 %73, i32 %72
  %82 = select i1 %76, i32 -32, i32 0
  %83 = add nsw i32 %82, %75
  %84 = icmp ugt i32 %83, 31
  %85 = select i1 %84, i32 %78, i32 %77
  %86 = select i1 %84, i32 %79, i32 %78
  %87 = select i1 %84, i32 %80, i32 %79
  %88 = select i1 %84, i32 %81, i32 %80
  %89 = select i1 %84, i32 -32, i32 0
  %90 = add nsw i32 %89, %83
  %91 = icmp eq i32 %90, 0
  %92 = sub nsw i32 32, %90
  %93 = tail call i32 @llvm.fshr.i32(i32 %85, i32 %86, i32 %92)
  %94 = tail call i32 @llvm.fshr.i32(i32 %86, i32 %87, i32 %92)
  %95 = tail call i32 @llvm.fshr.i32(i32 %87, i32 %88, i32 %92)
  %96 = select i1 %91, i32 %85, i32 %93
  %97 = select i1 %91, i32 %86, i32 %94
  %98 = select i1 %91, i32 %87, i32 %95
  %99 = lshr i32 %96, 29
  %100 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %97, i32 2)
  %101 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %98, i32 2)
  %102 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %88, i32 2)
  %103 = and i32 %99, 1
  %104 = sub nsw i32 0, %103
  %105 = shl i32 %99, 31
  %106 = xor i32 %100, %104
  %107 = xor i32 %101, %104
  %108 = xor i32 %102, %104
  %109 = tail call i32 @llvm.ctlz.i32(i32 %106, i1 false), !range !7
  %110 = sub nsw i32 31, %109
  %111 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %107, i32 %110)
  %112 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %110)
  %113 = shl nuw nsw i32 %109, 23
  %114 = sub nuw nsw i32 1056964608, %113
  %115 = lshr i32 %111, 9
  %116 = or i32 %115, %114
  %117 = or i32 %116, %105
  %118 = bitcast i32 %117 to float
  %119 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 23)
  %120 = tail call i32 @llvm.ctlz.i32(i32 %119, i1 false), !range !7
  %121 = fmul float %118, 0x3FF921FB40000000
  %122 = add nuw nsw i32 %120, %109
  %123 = shl nuw nsw i32 %122, 23
  %124 = sub nuw nsw i32 855638016, %123
  %125 = sub nsw i32 31, %120
  %126 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %112, i32 %125)
  %127 = lshr i32 %126, 9
  %128 = or i32 %124, %127
  %129 = or i32 %128, %105
  %130 = bitcast i32 %129 to float
  %131 = fneg float %121
  %132 = tail call float @llvm.fma.f32(float %118, float 0x3FF921FB40000000, float %131)
  %133 = tail call float @llvm.fma.f32(float %118, float 0x3E74442D00000000, float %132)
  %134 = tail call float @llvm.fma.f32(float %130, float 0x3FF921FB40000000, float %133)
  %135 = fadd float %121, %134
  %136 = lshr i32 %96, 30
  %137 = add nuw nsw i32 %103, %136
  br label %138

138:                                              ; preds = %25, %32
  %139 = phi float [ %30, %25 ], [ %135, %32 ]
  %140 = phi i32 [ %31, %25 ], [ %137, %32 ]
  %141 = fmul float %139, %139
  %142 = tail call float @llvm.fmuladd.f32(float %141, float 0xBF29833040000000, float 0x3F81103880000000)
  %143 = tail call float @llvm.fmuladd.f32(float %141, float %142, float 0xBFC55553A0000000)
  %144 = fmul float %141, %143
  %145 = tail call float @llvm.fmuladd.f32(float %139, float %144, float %139)
  %146 = tail call float @llvm.fmuladd.f32(float %141, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %147 = tail call float @llvm.fmuladd.f32(float %141, float %146, float 0x3FA5557EE0000000)
  %148 = tail call float @llvm.fmuladd.f32(float %141, float %147, float 0xBFE0000080000000)
  %149 = tail call float @llvm.fmuladd.f32(float %141, float %148, float 1.000000e+00)
  %150 = fneg float %145
  %151 = and i32 %140, 1
  %152 = icmp eq i32 %151, 0
  %153 = select i1 %152, float %149, float %150
  %154 = bitcast float %153 to i32
  %155 = shl i32 %140, 30
  %156 = and i32 %155, -2147483648
  %157 = xor i32 %156, %154
  %158 = bitcast i32 %157 to float
  %159 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 504)
  %160 = select i1 %159, float %158, float 0x7FF8000000000000
  %161 = fdiv contract float %160, %17
  %162 = mul nsw i32 %14, 3
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  store float %161, float addrspace(1)* %164, align 4, !tbaa !8
  br i1 %24, label %165, label %173

165:                                              ; preds = %138
  %166 = fmul float %23, 0x3FE45F3060000000
  %167 = tail call float @llvm.rint.f32(float %166)
  %168 = tail call float @llvm.fma.f32(float %167, float 0xBFF921FB40000000, float %23)
  %169 = tail call float @llvm.fma.f32(float %167, float 0xBE74442D00000000, float %168)
  %170 = tail call float @llvm.fma.f32(float %167, float 0xBCF8469880000000, float %169)
  %171 = fptosi float %167 to i32
  %172 = bitcast float %23 to i32
  br label %279

173:                                              ; preds = %138
  %174 = bitcast float %23 to i32
  %175 = lshr i32 %174, 23
  %176 = and i32 %174, 8388607
  %177 = or i32 %176, 8388608
  %178 = zext i32 %177 to i64
  %179 = mul nuw nsw i64 %178, 4266746795
  %180 = trunc i64 %179 to i32
  %181 = lshr i64 %179, 32
  %182 = mul nuw nsw i64 %178, 1011060801
  %183 = add nuw nsw i64 %181, %182
  %184 = trunc i64 %183 to i32
  %185 = lshr i64 %183, 32
  %186 = mul nuw nsw i64 %178, 3680671129
  %187 = add nuw nsw i64 %185, %186
  %188 = trunc i64 %187 to i32
  %189 = lshr i64 %187, 32
  %190 = mul nuw nsw i64 %178, 4113882560
  %191 = add nuw nsw i64 %189, %190
  %192 = trunc i64 %191 to i32
  %193 = lshr i64 %191, 32
  %194 = mul nuw nsw i64 %178, 4230436817
  %195 = add nuw nsw i64 %193, %194
  %196 = trunc i64 %195 to i32
  %197 = lshr i64 %195, 32
  %198 = mul nuw nsw i64 %178, 1313084713
  %199 = add nuw nsw i64 %197, %198
  %200 = trunc i64 %199 to i32
  %201 = lshr i64 %199, 32
  %202 = mul nuw nsw i64 %178, 2734261102
  %203 = add nuw nsw i64 %201, %202
  %204 = trunc i64 %203 to i32
  %205 = lshr i64 %203, 32
  %206 = trunc i64 %205 to i32
  %207 = add nsw i32 %175, -120
  %208 = icmp ugt i32 %207, 63
  %209 = select i1 %208, i32 %200, i32 %206
  %210 = select i1 %208, i32 %196, i32 %204
  %211 = select i1 %208, i32 %192, i32 %200
  %212 = select i1 %208, i32 %188, i32 %196
  %213 = select i1 %208, i32 %184, i32 %192
  %214 = select i1 %208, i32 %180, i32 %188
  %215 = select i1 %208, i32 -64, i32 0
  %216 = add nsw i32 %215, %207
  %217 = icmp ugt i32 %216, 31
  %218 = select i1 %217, i32 %210, i32 %209
  %219 = select i1 %217, i32 %211, i32 %210
  %220 = select i1 %217, i32 %212, i32 %211
  %221 = select i1 %217, i32 %213, i32 %212
  %222 = select i1 %217, i32 %214, i32 %213
  %223 = select i1 %217, i32 -32, i32 0
  %224 = add nsw i32 %223, %216
  %225 = icmp ugt i32 %224, 31
  %226 = select i1 %225, i32 %219, i32 %218
  %227 = select i1 %225, i32 %220, i32 %219
  %228 = select i1 %225, i32 %221, i32 %220
  %229 = select i1 %225, i32 %222, i32 %221
  %230 = select i1 %225, i32 -32, i32 0
  %231 = add nsw i32 %230, %224
  %232 = icmp eq i32 %231, 0
  %233 = sub nsw i32 32, %231
  %234 = tail call i32 @llvm.fshr.i32(i32 %226, i32 %227, i32 %233)
  %235 = tail call i32 @llvm.fshr.i32(i32 %227, i32 %228, i32 %233)
  %236 = tail call i32 @llvm.fshr.i32(i32 %228, i32 %229, i32 %233)
  %237 = select i1 %232, i32 %226, i32 %234
  %238 = select i1 %232, i32 %227, i32 %235
  %239 = select i1 %232, i32 %228, i32 %236
  %240 = lshr i32 %237, 29
  %241 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %238, i32 2)
  %242 = tail call i32 @llvm.fshl.i32(i32 %238, i32 %239, i32 2)
  %243 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %229, i32 2)
  %244 = and i32 %240, 1
  %245 = sub nsw i32 0, %244
  %246 = shl i32 %240, 31
  %247 = xor i32 %241, %245
  %248 = xor i32 %242, %245
  %249 = xor i32 %243, %245
  %250 = tail call i32 @llvm.ctlz.i32(i32 %247, i1 false), !range !7
  %251 = sub nsw i32 31, %250
  %252 = tail call i32 @llvm.fshr.i32(i32 %247, i32 %248, i32 %251)
  %253 = tail call i32 @llvm.fshr.i32(i32 %248, i32 %249, i32 %251)
  %254 = shl nuw nsw i32 %250, 23
  %255 = sub nuw nsw i32 1056964608, %254
  %256 = lshr i32 %252, 9
  %257 = or i32 %256, %255
  %258 = or i32 %257, %246
  %259 = bitcast i32 %258 to float
  %260 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %253, i32 23)
  %261 = tail call i32 @llvm.ctlz.i32(i32 %260, i1 false), !range !7
  %262 = fmul float %259, 0x3FF921FB40000000
  %263 = add nuw nsw i32 %261, %250
  %264 = shl nuw nsw i32 %263, 23
  %265 = sub nuw nsw i32 855638016, %264
  %266 = sub nsw i32 31, %261
  %267 = tail call i32 @llvm.fshr.i32(i32 %260, i32 %253, i32 %266)
  %268 = lshr i32 %267, 9
  %269 = or i32 %265, %268
  %270 = or i32 %269, %246
  %271 = bitcast i32 %270 to float
  %272 = fneg float %262
  %273 = tail call float @llvm.fma.f32(float %259, float 0x3FF921FB40000000, float %272)
  %274 = tail call float @llvm.fma.f32(float %259, float 0x3E74442D00000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %271, float 0x3FF921FB40000000, float %274)
  %276 = fadd float %262, %275
  %277 = lshr i32 %237, 30
  %278 = add nuw nsw i32 %244, %277
  br label %279

279:                                              ; preds = %165, %173
  %280 = phi i32 [ %172, %165 ], [ %174, %173 ]
  %281 = phi float [ %170, %165 ], [ %276, %173 ]
  %282 = phi i32 [ %171, %165 ], [ %278, %173 ]
  %283 = fmul float %281, %281
  %284 = tail call float @llvm.fmuladd.f32(float %283, float 0xBF29833040000000, float 0x3F81103880000000)
  %285 = tail call float @llvm.fmuladd.f32(float %283, float %284, float 0xBFC55553A0000000)
  %286 = fmul float %283, %285
  %287 = tail call float @llvm.fmuladd.f32(float %281, float %286, float %281)
  %288 = tail call float @llvm.fmuladd.f32(float %283, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %289 = tail call float @llvm.fmuladd.f32(float %283, float %288, float 0x3FA5557EE0000000)
  %290 = tail call float @llvm.fmuladd.f32(float %283, float %289, float 0xBFE0000080000000)
  %291 = tail call float @llvm.fmuladd.f32(float %283, float %290, float 1.000000e+00)
  %292 = and i32 %282, 1
  %293 = icmp eq i32 %292, 0
  %294 = select i1 %293, float %287, float %291
  %295 = bitcast float %294 to i32
  %296 = shl i32 %282, 30
  %297 = and i32 %296, -2147483648
  %298 = bitcast float %22 to i32
  %299 = xor i32 %280, %298
  %300 = xor i32 %299, %297
  %301 = xor i32 %300, %295
  %302 = bitcast i32 %301 to float
  %303 = select i1 %159, float %302, float 0x7FF8000000000000
  %304 = fdiv contract float %303, %17
  %305 = add nsw i32 %162, 1
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %2, i64 %306
  store float %304, float addrspace(1)* %307, align 4, !tbaa !8
  %308 = fpext float %17 to double
  %309 = tail call float @llvm.fabs.f32(float %0)
  %310 = fcmp olt float %309, 1.310720e+05
  br i1 %310, label %311, label %319

311:                                              ; preds = %279
  %312 = fmul float %309, 0x3FE45F3060000000
  %313 = tail call float @llvm.rint.f32(float %312)
  %314 = tail call float @llvm.fma.f32(float %313, float 0xBFF921FB40000000, float %309)
  %315 = tail call float @llvm.fma.f32(float %313, float 0xBE74442D00000000, float %314)
  %316 = tail call float @llvm.fma.f32(float %313, float 0xBCF8469880000000, float %315)
  %317 = fptosi float %313 to i32
  %318 = bitcast float %309 to i32
  br label %425

319:                                              ; preds = %279
  %320 = bitcast float %309 to i32
  %321 = lshr i32 %320, 23
  %322 = and i32 %320, 8388607
  %323 = or i32 %322, 8388608
  %324 = zext i32 %323 to i64
  %325 = mul nuw nsw i64 %324, 4266746795
  %326 = trunc i64 %325 to i32
  %327 = lshr i64 %325, 32
  %328 = mul nuw nsw i64 %324, 1011060801
  %329 = add nuw nsw i64 %327, %328
  %330 = trunc i64 %329 to i32
  %331 = lshr i64 %329, 32
  %332 = mul nuw nsw i64 %324, 3680671129
  %333 = add nuw nsw i64 %331, %332
  %334 = trunc i64 %333 to i32
  %335 = lshr i64 %333, 32
  %336 = mul nuw nsw i64 %324, 4113882560
  %337 = add nuw nsw i64 %335, %336
  %338 = trunc i64 %337 to i32
  %339 = lshr i64 %337, 32
  %340 = mul nuw nsw i64 %324, 4230436817
  %341 = add nuw nsw i64 %339, %340
  %342 = trunc i64 %341 to i32
  %343 = lshr i64 %341, 32
  %344 = mul nuw nsw i64 %324, 1313084713
  %345 = add nuw nsw i64 %343, %344
  %346 = trunc i64 %345 to i32
  %347 = lshr i64 %345, 32
  %348 = mul nuw nsw i64 %324, 2734261102
  %349 = add nuw nsw i64 %347, %348
  %350 = trunc i64 %349 to i32
  %351 = lshr i64 %349, 32
  %352 = trunc i64 %351 to i32
  %353 = add nsw i32 %321, -120
  %354 = icmp ugt i32 %353, 63
  %355 = select i1 %354, i32 %346, i32 %352
  %356 = select i1 %354, i32 %342, i32 %350
  %357 = select i1 %354, i32 %338, i32 %346
  %358 = select i1 %354, i32 %334, i32 %342
  %359 = select i1 %354, i32 %330, i32 %338
  %360 = select i1 %354, i32 %326, i32 %334
  %361 = select i1 %354, i32 -64, i32 0
  %362 = add nsw i32 %361, %353
  %363 = icmp ugt i32 %362, 31
  %364 = select i1 %363, i32 %356, i32 %355
  %365 = select i1 %363, i32 %357, i32 %356
  %366 = select i1 %363, i32 %358, i32 %357
  %367 = select i1 %363, i32 %359, i32 %358
  %368 = select i1 %363, i32 %360, i32 %359
  %369 = select i1 %363, i32 -32, i32 0
  %370 = add nsw i32 %369, %362
  %371 = icmp ugt i32 %370, 31
  %372 = select i1 %371, i32 %365, i32 %364
  %373 = select i1 %371, i32 %366, i32 %365
  %374 = select i1 %371, i32 %367, i32 %366
  %375 = select i1 %371, i32 %368, i32 %367
  %376 = select i1 %371, i32 -32, i32 0
  %377 = add nsw i32 %376, %370
  %378 = icmp eq i32 %377, 0
  %379 = sub nsw i32 32, %377
  %380 = tail call i32 @llvm.fshr.i32(i32 %372, i32 %373, i32 %379)
  %381 = tail call i32 @llvm.fshr.i32(i32 %373, i32 %374, i32 %379)
  %382 = tail call i32 @llvm.fshr.i32(i32 %374, i32 %375, i32 %379)
  %383 = select i1 %378, i32 %372, i32 %380
  %384 = select i1 %378, i32 %373, i32 %381
  %385 = select i1 %378, i32 %374, i32 %382
  %386 = lshr i32 %383, 29
  %387 = tail call i32 @llvm.fshl.i32(i32 %383, i32 %384, i32 2)
  %388 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %385, i32 2)
  %389 = tail call i32 @llvm.fshl.i32(i32 %385, i32 %375, i32 2)
  %390 = and i32 %386, 1
  %391 = sub nsw i32 0, %390
  %392 = shl i32 %386, 31
  %393 = xor i32 %387, %391
  %394 = xor i32 %388, %391
  %395 = xor i32 %389, %391
  %396 = tail call i32 @llvm.ctlz.i32(i32 %393, i1 false), !range !7
  %397 = sub nsw i32 31, %396
  %398 = tail call i32 @llvm.fshr.i32(i32 %393, i32 %394, i32 %397)
  %399 = tail call i32 @llvm.fshr.i32(i32 %394, i32 %395, i32 %397)
  %400 = shl nuw nsw i32 %396, 23
  %401 = sub nuw nsw i32 1056964608, %400
  %402 = lshr i32 %398, 9
  %403 = or i32 %402, %401
  %404 = or i32 %403, %392
  %405 = bitcast i32 %404 to float
  %406 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %399, i32 23)
  %407 = tail call i32 @llvm.ctlz.i32(i32 %406, i1 false), !range !7
  %408 = fmul float %405, 0x3FF921FB40000000
  %409 = add nuw nsw i32 %407, %396
  %410 = shl nuw nsw i32 %409, 23
  %411 = sub nuw nsw i32 855638016, %410
  %412 = sub nsw i32 31, %407
  %413 = tail call i32 @llvm.fshr.i32(i32 %406, i32 %399, i32 %412)
  %414 = lshr i32 %413, 9
  %415 = or i32 %411, %414
  %416 = or i32 %415, %392
  %417 = bitcast i32 %416 to float
  %418 = fneg float %408
  %419 = tail call float @llvm.fma.f32(float %405, float 0x3FF921FB40000000, float %418)
  %420 = tail call float @llvm.fma.f32(float %405, float 0x3E74442D00000000, float %419)
  %421 = tail call float @llvm.fma.f32(float %417, float 0x3FF921FB40000000, float %420)
  %422 = fadd float %408, %421
  %423 = lshr i32 %383, 30
  %424 = add nuw nsw i32 %390, %423
  br label %425

425:                                              ; preds = %311, %319
  %426 = phi i32 [ %318, %311 ], [ %320, %319 ]
  %427 = phi float [ %316, %311 ], [ %422, %319 ]
  %428 = phi i32 [ %317, %311 ], [ %424, %319 ]
  %429 = fmul float %427, %427
  %430 = tail call float @llvm.fmuladd.f32(float %429, float 0xBF29833040000000, float 0x3F81103880000000)
  %431 = tail call float @llvm.fmuladd.f32(float %429, float %430, float 0xBFC55553A0000000)
  %432 = fmul float %429, %431
  %433 = tail call float @llvm.fmuladd.f32(float %427, float %432, float %427)
  %434 = tail call float @llvm.fmuladd.f32(float %429, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %435 = tail call float @llvm.fmuladd.f32(float %429, float %434, float 0x3FA5557EE0000000)
  %436 = tail call float @llvm.fmuladd.f32(float %429, float %435, float 0xBFE0000080000000)
  %437 = tail call float @llvm.fmuladd.f32(float %429, float %436, float 1.000000e+00)
  %438 = and i32 %428, 1
  %439 = icmp eq i32 %438, 0
  %440 = select i1 %439, float %433, float %437
  %441 = bitcast float %440 to i32
  %442 = shl i32 %428, 30
  %443 = and i32 %442, -2147483648
  %444 = bitcast float %0 to i32
  %445 = xor i32 %426, %444
  %446 = xor i32 %445, %443
  %447 = xor i32 %446, %441
  %448 = bitcast i32 %447 to float
  %449 = tail call i1 @llvm.amdgcn.class.f32(float %309, i32 504)
  %450 = fpext float %448 to double
  %451 = fmul contract double %450, 1.000000e-01
  %452 = select i1 %449, double %451, double 0x7FF8000000000000
  %453 = fadd contract double %452, %308
  %454 = fptrunc double %453 to float
  %455 = add nsw i32 %162, 2
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %2, i64 %456
  store float %454, float addrspace(1)* %457, align 4, !tbaa !8
  br label %458

458:                                              ; preds = %425, %5
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
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
