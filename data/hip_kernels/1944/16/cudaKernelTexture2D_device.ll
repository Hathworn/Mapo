; ModuleID = '../data/hip_kernels/1944/16/main.cu'
source_filename = "../data/hip_kernels/1944/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19cudaKernelTexture2DPhiimf(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i64 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %1
  %24 = icmp slt i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %799

26:                                               ; preds = %5
  %27 = sext i32 %22 to i64
  %28 = mul i64 %27, %3
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = shl nsw i32 %14, 2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %29, i64 %31
  %33 = sitofp i32 %14 to float
  %34 = fmul contract float %33, 2.000000e+00
  %35 = sitofp i32 %1 to float
  %36 = fdiv contract float %34, %35
  %37 = fadd contract float %36, -1.000000e+00
  %38 = fmul contract float %37, 1.000000e+01
  %39 = fadd contract float %38, %4
  %40 = tail call float @llvm.fabs.f32(float %39)
  %41 = fcmp olt float %40, 1.310720e+05
  br i1 %41, label %42, label %49

42:                                               ; preds = %26
  %43 = fmul float %40, 0x3FE45F3060000000
  %44 = tail call float @llvm.rint.f32(float %43)
  %45 = tail call float @llvm.fma.f32(float %44, float 0xBFF921FB40000000, float %40)
  %46 = tail call float @llvm.fma.f32(float %44, float 0xBE74442D00000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %44, float 0xBCF8469880000000, float %46)
  %48 = fptosi float %44 to i32
  br label %155

49:                                               ; preds = %26
  %50 = bitcast float %40 to i32
  %51 = lshr i32 %50, 23
  %52 = and i32 %50, 8388607
  %53 = or i32 %52, 8388608
  %54 = zext i32 %53 to i64
  %55 = mul nuw nsw i64 %54, 4266746795
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %54, 1011060801
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %54, 3680671129
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %54, 4113882560
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %54, 4230436817
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %54, 1313084713
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = mul nuw nsw i64 %54, 2734261102
  %79 = add nuw nsw i64 %77, %78
  %80 = trunc i64 %79 to i32
  %81 = lshr i64 %79, 32
  %82 = trunc i64 %81 to i32
  %83 = add nsw i32 %51, -120
  %84 = icmp ugt i32 %83, 63
  %85 = select i1 %84, i32 %76, i32 %82
  %86 = select i1 %84, i32 %72, i32 %80
  %87 = select i1 %84, i32 %68, i32 %76
  %88 = select i1 %84, i32 %64, i32 %72
  %89 = select i1 %84, i32 %60, i32 %68
  %90 = select i1 %84, i32 %56, i32 %64
  %91 = select i1 %84, i32 -64, i32 0
  %92 = add nsw i32 %91, %83
  %93 = icmp ugt i32 %92, 31
  %94 = select i1 %93, i32 %86, i32 %85
  %95 = select i1 %93, i32 %87, i32 %86
  %96 = select i1 %93, i32 %88, i32 %87
  %97 = select i1 %93, i32 %89, i32 %88
  %98 = select i1 %93, i32 %90, i32 %89
  %99 = select i1 %93, i32 -32, i32 0
  %100 = add nsw i32 %99, %92
  %101 = icmp ugt i32 %100, 31
  %102 = select i1 %101, i32 %95, i32 %94
  %103 = select i1 %101, i32 %96, i32 %95
  %104 = select i1 %101, i32 %97, i32 %96
  %105 = select i1 %101, i32 %98, i32 %97
  %106 = select i1 %101, i32 -32, i32 0
  %107 = add nsw i32 %106, %100
  %108 = icmp eq i32 %107, 0
  %109 = sub nsw i32 32, %107
  %110 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %109)
  %111 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %109)
  %112 = tail call i32 @llvm.fshr.i32(i32 %104, i32 %105, i32 %109)
  %113 = select i1 %108, i32 %102, i32 %110
  %114 = select i1 %108, i32 %103, i32 %111
  %115 = select i1 %108, i32 %104, i32 %112
  %116 = lshr i32 %113, 29
  %117 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %114, i32 2)
  %118 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %115, i32 2)
  %119 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %105, i32 2)
  %120 = and i32 %116, 1
  %121 = sub nsw i32 0, %120
  %122 = shl i32 %116, 31
  %123 = xor i32 %117, %121
  %124 = xor i32 %118, %121
  %125 = xor i32 %119, %121
  %126 = tail call i32 @llvm.ctlz.i32(i32 %123, i1 false), !range !7
  %127 = sub nsw i32 31, %126
  %128 = tail call i32 @llvm.fshr.i32(i32 %123, i32 %124, i32 %127)
  %129 = tail call i32 @llvm.fshr.i32(i32 %124, i32 %125, i32 %127)
  %130 = shl nuw nsw i32 %126, 23
  %131 = sub nuw nsw i32 1056964608, %130
  %132 = lshr i32 %128, 9
  %133 = or i32 %132, %131
  %134 = or i32 %133, %122
  %135 = bitcast i32 %134 to float
  %136 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %129, i32 23)
  %137 = tail call i32 @llvm.ctlz.i32(i32 %136, i1 false), !range !7
  %138 = fmul float %135, 0x3FF921FB40000000
  %139 = add nuw nsw i32 %137, %126
  %140 = shl nuw nsw i32 %139, 23
  %141 = sub nuw nsw i32 855638016, %140
  %142 = sub nsw i32 31, %137
  %143 = tail call i32 @llvm.fshr.i32(i32 %136, i32 %129, i32 %142)
  %144 = lshr i32 %143, 9
  %145 = or i32 %141, %144
  %146 = or i32 %145, %122
  %147 = bitcast i32 %146 to float
  %148 = fneg float %138
  %149 = tail call float @llvm.fma.f32(float %135, float 0x3FF921FB40000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %135, float 0x3E74442D00000000, float %149)
  %151 = tail call float @llvm.fma.f32(float %147, float 0x3FF921FB40000000, float %150)
  %152 = fadd float %138, %151
  %153 = lshr i32 %113, 30
  %154 = add nuw nsw i32 %120, %153
  br label %155

155:                                              ; preds = %42, %49
  %156 = phi float [ %47, %42 ], [ %152, %49 ]
  %157 = phi i32 [ %48, %42 ], [ %154, %49 ]
  %158 = fmul float %156, %156
  %159 = tail call float @llvm.fmuladd.f32(float %158, float 0xBF29833040000000, float 0x3F81103880000000)
  %160 = tail call float @llvm.fmuladd.f32(float %158, float %159, float 0xBFC55553A0000000)
  %161 = fmul float %158, %160
  %162 = tail call float @llvm.fmuladd.f32(float %156, float %161, float %156)
  %163 = tail call float @llvm.fmuladd.f32(float %158, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %164 = tail call float @llvm.fmuladd.f32(float %158, float %163, float 0x3FA5557EE0000000)
  %165 = tail call float @llvm.fmuladd.f32(float %158, float %164, float 0xBFE0000080000000)
  %166 = tail call float @llvm.fmuladd.f32(float %158, float %165, float 1.000000e+00)
  %167 = fneg float %162
  %168 = and i32 %157, 1
  %169 = icmp eq i32 %168, 0
  %170 = select i1 %169, float %166, float %167
  %171 = bitcast float %170 to i32
  %172 = shl i32 %157, 30
  %173 = and i32 %172, -2147483648
  %174 = xor i32 %173, %171
  %175 = bitcast i32 %174 to float
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 504)
  %177 = fmul contract float %175, 5.000000e-01
  %178 = fadd contract float %177, 5.000000e-01
  %179 = select i1 %176, float %178, float 0x7FF8000000000000
  %180 = sitofp i32 %22 to float
  %181 = fmul contract float %180, 2.000000e+00
  %182 = sitofp i32 %2 to float
  %183 = fdiv contract float %181, %182
  %184 = fadd contract float %183, -1.000000e+00
  %185 = fmul contract float %184, 1.000000e+01
  %186 = fadd contract float %185, %4
  %187 = tail call float @llvm.fabs.f32(float %186)
  %188 = fcmp olt float %187, 1.310720e+05
  br i1 %188, label %189, label %196

189:                                              ; preds = %155
  %190 = fmul float %187, 0x3FE45F3060000000
  %191 = tail call float @llvm.rint.f32(float %190)
  %192 = tail call float @llvm.fma.f32(float %191, float 0xBFF921FB40000000, float %187)
  %193 = tail call float @llvm.fma.f32(float %191, float 0xBE74442D00000000, float %192)
  %194 = tail call float @llvm.fma.f32(float %191, float 0xBCF8469880000000, float %193)
  %195 = fptosi float %191 to i32
  br label %302

196:                                              ; preds = %155
  %197 = bitcast float %187 to i32
  %198 = lshr i32 %197, 23
  %199 = and i32 %197, 8388607
  %200 = or i32 %199, 8388608
  %201 = zext i32 %200 to i64
  %202 = mul nuw nsw i64 %201, 4266746795
  %203 = trunc i64 %202 to i32
  %204 = lshr i64 %202, 32
  %205 = mul nuw nsw i64 %201, 1011060801
  %206 = add nuw nsw i64 %204, %205
  %207 = trunc i64 %206 to i32
  %208 = lshr i64 %206, 32
  %209 = mul nuw nsw i64 %201, 3680671129
  %210 = add nuw nsw i64 %208, %209
  %211 = trunc i64 %210 to i32
  %212 = lshr i64 %210, 32
  %213 = mul nuw nsw i64 %201, 4113882560
  %214 = add nuw nsw i64 %212, %213
  %215 = trunc i64 %214 to i32
  %216 = lshr i64 %214, 32
  %217 = mul nuw nsw i64 %201, 4230436817
  %218 = add nuw nsw i64 %216, %217
  %219 = trunc i64 %218 to i32
  %220 = lshr i64 %218, 32
  %221 = mul nuw nsw i64 %201, 1313084713
  %222 = add nuw nsw i64 %220, %221
  %223 = trunc i64 %222 to i32
  %224 = lshr i64 %222, 32
  %225 = mul nuw nsw i64 %201, 2734261102
  %226 = add nuw nsw i64 %224, %225
  %227 = trunc i64 %226 to i32
  %228 = lshr i64 %226, 32
  %229 = trunc i64 %228 to i32
  %230 = add nsw i32 %198, -120
  %231 = icmp ugt i32 %230, 63
  %232 = select i1 %231, i32 %223, i32 %229
  %233 = select i1 %231, i32 %219, i32 %227
  %234 = select i1 %231, i32 %215, i32 %223
  %235 = select i1 %231, i32 %211, i32 %219
  %236 = select i1 %231, i32 %207, i32 %215
  %237 = select i1 %231, i32 %203, i32 %211
  %238 = select i1 %231, i32 -64, i32 0
  %239 = add nsw i32 %238, %230
  %240 = icmp ugt i32 %239, 31
  %241 = select i1 %240, i32 %233, i32 %232
  %242 = select i1 %240, i32 %234, i32 %233
  %243 = select i1 %240, i32 %235, i32 %234
  %244 = select i1 %240, i32 %236, i32 %235
  %245 = select i1 %240, i32 %237, i32 %236
  %246 = select i1 %240, i32 -32, i32 0
  %247 = add nsw i32 %246, %239
  %248 = icmp ugt i32 %247, 31
  %249 = select i1 %248, i32 %242, i32 %241
  %250 = select i1 %248, i32 %243, i32 %242
  %251 = select i1 %248, i32 %244, i32 %243
  %252 = select i1 %248, i32 %245, i32 %244
  %253 = select i1 %248, i32 -32, i32 0
  %254 = add nsw i32 %253, %247
  %255 = icmp eq i32 %254, 0
  %256 = sub nsw i32 32, %254
  %257 = tail call i32 @llvm.fshr.i32(i32 %249, i32 %250, i32 %256)
  %258 = tail call i32 @llvm.fshr.i32(i32 %250, i32 %251, i32 %256)
  %259 = tail call i32 @llvm.fshr.i32(i32 %251, i32 %252, i32 %256)
  %260 = select i1 %255, i32 %249, i32 %257
  %261 = select i1 %255, i32 %250, i32 %258
  %262 = select i1 %255, i32 %251, i32 %259
  %263 = lshr i32 %260, 29
  %264 = tail call i32 @llvm.fshl.i32(i32 %260, i32 %261, i32 2)
  %265 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %262, i32 2)
  %266 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %252, i32 2)
  %267 = and i32 %263, 1
  %268 = sub nsw i32 0, %267
  %269 = shl i32 %263, 31
  %270 = xor i32 %264, %268
  %271 = xor i32 %265, %268
  %272 = xor i32 %266, %268
  %273 = tail call i32 @llvm.ctlz.i32(i32 %270, i1 false), !range !7
  %274 = sub nsw i32 31, %273
  %275 = tail call i32 @llvm.fshr.i32(i32 %270, i32 %271, i32 %274)
  %276 = tail call i32 @llvm.fshr.i32(i32 %271, i32 %272, i32 %274)
  %277 = shl nuw nsw i32 %273, 23
  %278 = sub nuw nsw i32 1056964608, %277
  %279 = lshr i32 %275, 9
  %280 = or i32 %279, %278
  %281 = or i32 %280, %269
  %282 = bitcast i32 %281 to float
  %283 = tail call i32 @llvm.fshl.i32(i32 %275, i32 %276, i32 23)
  %284 = tail call i32 @llvm.ctlz.i32(i32 %283, i1 false), !range !7
  %285 = fmul float %282, 0x3FF921FB40000000
  %286 = add nuw nsw i32 %284, %273
  %287 = shl nuw nsw i32 %286, 23
  %288 = sub nuw nsw i32 855638016, %287
  %289 = sub nsw i32 31, %284
  %290 = tail call i32 @llvm.fshr.i32(i32 %283, i32 %276, i32 %289)
  %291 = lshr i32 %290, 9
  %292 = or i32 %288, %291
  %293 = or i32 %292, %269
  %294 = bitcast i32 %293 to float
  %295 = fneg float %285
  %296 = tail call float @llvm.fma.f32(float %282, float 0x3FF921FB40000000, float %295)
  %297 = tail call float @llvm.fma.f32(float %282, float 0x3E74442D00000000, float %296)
  %298 = tail call float @llvm.fma.f32(float %294, float 0x3FF921FB40000000, float %297)
  %299 = fadd float %285, %298
  %300 = lshr i32 %260, 30
  %301 = add nuw nsw i32 %267, %300
  br label %302

302:                                              ; preds = %189, %196
  %303 = phi float [ %194, %189 ], [ %299, %196 ]
  %304 = phi i32 [ %195, %189 ], [ %301, %196 ]
  %305 = fmul float %303, %303
  %306 = tail call float @llvm.fmuladd.f32(float %305, float 0xBF29833040000000, float 0x3F81103880000000)
  %307 = tail call float @llvm.fmuladd.f32(float %305, float %306, float 0xBFC55553A0000000)
  %308 = fmul float %305, %307
  %309 = tail call float @llvm.fmuladd.f32(float %303, float %308, float %303)
  %310 = tail call float @llvm.fmuladd.f32(float %305, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %311 = tail call float @llvm.fmuladd.f32(float %305, float %310, float 0x3FA5557EE0000000)
  %312 = tail call float @llvm.fmuladd.f32(float %305, float %311, float 0xBFE0000080000000)
  %313 = tail call float @llvm.fmuladd.f32(float %305, float %312, float 1.000000e+00)
  %314 = fneg float %309
  %315 = and i32 %304, 1
  %316 = icmp eq i32 %315, 0
  %317 = select i1 %316, float %313, float %314
  %318 = bitcast float %317 to i32
  %319 = shl i32 %304, 30
  %320 = and i32 %319, -2147483648
  %321 = xor i32 %320, %318
  %322 = bitcast i32 %321 to float
  %323 = tail call i1 @llvm.amdgcn.class.f32(float %187, i32 504)
  %324 = fmul contract float %322, 5.000000e-01
  %325 = fadd contract float %324, 5.000000e-01
  %326 = select i1 %323, float %325, float 0x7FF8000000000000
  %327 = tail call float @llvm.fabs.f32(float %4)
  %328 = fcmp olt float %327, 1.310720e+05
  br i1 %328, label %329, label %336

329:                                              ; preds = %302
  %330 = fmul float %327, 0x3FE45F3060000000
  %331 = tail call float @llvm.rint.f32(float %330)
  %332 = tail call float @llvm.fma.f32(float %331, float 0xBFF921FB40000000, float %327)
  %333 = tail call float @llvm.fma.f32(float %331, float 0xBE74442D00000000, float %332)
  %334 = tail call float @llvm.fma.f32(float %331, float 0xBCF8469880000000, float %333)
  %335 = fptosi float %331 to i32
  br label %442

336:                                              ; preds = %302
  %337 = bitcast float %327 to i32
  %338 = lshr i32 %337, 23
  %339 = and i32 %337, 8388607
  %340 = or i32 %339, 8388608
  %341 = zext i32 %340 to i64
  %342 = mul nuw nsw i64 %341, 4266746795
  %343 = trunc i64 %342 to i32
  %344 = lshr i64 %342, 32
  %345 = mul nuw nsw i64 %341, 1011060801
  %346 = add nuw nsw i64 %344, %345
  %347 = trunc i64 %346 to i32
  %348 = lshr i64 %346, 32
  %349 = mul nuw nsw i64 %341, 3680671129
  %350 = add nuw nsw i64 %348, %349
  %351 = trunc i64 %350 to i32
  %352 = lshr i64 %350, 32
  %353 = mul nuw nsw i64 %341, 4113882560
  %354 = add nuw nsw i64 %352, %353
  %355 = trunc i64 %354 to i32
  %356 = lshr i64 %354, 32
  %357 = mul nuw nsw i64 %341, 4230436817
  %358 = add nuw nsw i64 %356, %357
  %359 = trunc i64 %358 to i32
  %360 = lshr i64 %358, 32
  %361 = mul nuw nsw i64 %341, 1313084713
  %362 = add nuw nsw i64 %360, %361
  %363 = trunc i64 %362 to i32
  %364 = lshr i64 %362, 32
  %365 = mul nuw nsw i64 %341, 2734261102
  %366 = add nuw nsw i64 %364, %365
  %367 = trunc i64 %366 to i32
  %368 = lshr i64 %366, 32
  %369 = trunc i64 %368 to i32
  %370 = add nsw i32 %338, -120
  %371 = icmp ugt i32 %370, 63
  %372 = select i1 %371, i32 %363, i32 %369
  %373 = select i1 %371, i32 %359, i32 %367
  %374 = select i1 %371, i32 %355, i32 %363
  %375 = select i1 %371, i32 %351, i32 %359
  %376 = select i1 %371, i32 %347, i32 %355
  %377 = select i1 %371, i32 %343, i32 %351
  %378 = select i1 %371, i32 -64, i32 0
  %379 = add nsw i32 %378, %370
  %380 = icmp ugt i32 %379, 31
  %381 = select i1 %380, i32 %373, i32 %372
  %382 = select i1 %380, i32 %374, i32 %373
  %383 = select i1 %380, i32 %375, i32 %374
  %384 = select i1 %380, i32 %376, i32 %375
  %385 = select i1 %380, i32 %377, i32 %376
  %386 = select i1 %380, i32 -32, i32 0
  %387 = add nsw i32 %386, %379
  %388 = icmp ugt i32 %387, 31
  %389 = select i1 %388, i32 %382, i32 %381
  %390 = select i1 %388, i32 %383, i32 %382
  %391 = select i1 %388, i32 %384, i32 %383
  %392 = select i1 %388, i32 %385, i32 %384
  %393 = select i1 %388, i32 -32, i32 0
  %394 = add nsw i32 %393, %387
  %395 = icmp eq i32 %394, 0
  %396 = sub nsw i32 32, %394
  %397 = tail call i32 @llvm.fshr.i32(i32 %389, i32 %390, i32 %396)
  %398 = tail call i32 @llvm.fshr.i32(i32 %390, i32 %391, i32 %396)
  %399 = tail call i32 @llvm.fshr.i32(i32 %391, i32 %392, i32 %396)
  %400 = select i1 %395, i32 %389, i32 %397
  %401 = select i1 %395, i32 %390, i32 %398
  %402 = select i1 %395, i32 %391, i32 %399
  %403 = lshr i32 %400, 29
  %404 = tail call i32 @llvm.fshl.i32(i32 %400, i32 %401, i32 2)
  %405 = tail call i32 @llvm.fshl.i32(i32 %401, i32 %402, i32 2)
  %406 = tail call i32 @llvm.fshl.i32(i32 %402, i32 %392, i32 2)
  %407 = and i32 %403, 1
  %408 = sub nsw i32 0, %407
  %409 = shl i32 %403, 31
  %410 = xor i32 %404, %408
  %411 = xor i32 %405, %408
  %412 = xor i32 %406, %408
  %413 = tail call i32 @llvm.ctlz.i32(i32 %410, i1 false), !range !7
  %414 = sub nsw i32 31, %413
  %415 = tail call i32 @llvm.fshr.i32(i32 %410, i32 %411, i32 %414)
  %416 = tail call i32 @llvm.fshr.i32(i32 %411, i32 %412, i32 %414)
  %417 = shl nuw nsw i32 %413, 23
  %418 = sub nuw nsw i32 1056964608, %417
  %419 = lshr i32 %415, 9
  %420 = or i32 %419, %418
  %421 = or i32 %420, %409
  %422 = bitcast i32 %421 to float
  %423 = tail call i32 @llvm.fshl.i32(i32 %415, i32 %416, i32 23)
  %424 = tail call i32 @llvm.ctlz.i32(i32 %423, i1 false), !range !7
  %425 = fmul float %422, 0x3FF921FB40000000
  %426 = add nuw nsw i32 %424, %413
  %427 = shl nuw nsw i32 %426, 23
  %428 = sub nuw nsw i32 855638016, %427
  %429 = sub nsw i32 31, %424
  %430 = tail call i32 @llvm.fshr.i32(i32 %423, i32 %416, i32 %429)
  %431 = lshr i32 %430, 9
  %432 = or i32 %428, %431
  %433 = or i32 %432, %409
  %434 = bitcast i32 %433 to float
  %435 = fneg float %425
  %436 = tail call float @llvm.fma.f32(float %422, float 0x3FF921FB40000000, float %435)
  %437 = tail call float @llvm.fma.f32(float %422, float 0x3E74442D00000000, float %436)
  %438 = tail call float @llvm.fma.f32(float %434, float 0x3FF921FB40000000, float %437)
  %439 = fadd float %425, %438
  %440 = lshr i32 %400, 30
  %441 = add nuw nsw i32 %407, %440
  br label %442

442:                                              ; preds = %329, %336
  %443 = phi float [ %334, %329 ], [ %439, %336 ]
  %444 = phi i32 [ %335, %329 ], [ %441, %336 ]
  %445 = fmul float %443, %443
  %446 = tail call float @llvm.fmuladd.f32(float %445, float 0xBF29833040000000, float 0x3F81103880000000)
  %447 = tail call float @llvm.fmuladd.f32(float %445, float %446, float 0xBFC55553A0000000)
  %448 = fmul float %445, %447
  %449 = tail call float @llvm.fmuladd.f32(float %443, float %448, float %443)
  %450 = tail call float @llvm.fmuladd.f32(float %445, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %451 = tail call float @llvm.fmuladd.f32(float %445, float %450, float 0x3FA5557EE0000000)
  %452 = tail call float @llvm.fmuladd.f32(float %445, float %451, float 0xBFE0000080000000)
  %453 = tail call float @llvm.fmuladd.f32(float %445, float %452, float 1.000000e+00)
  %454 = fneg float %449
  %455 = and i32 %444, 1
  %456 = icmp eq i32 %455, 0
  %457 = select i1 %456, float %453, float %454
  %458 = bitcast float %457 to i32
  %459 = shl i32 %444, 30
  %460 = and i32 %459, -2147483648
  %461 = xor i32 %460, %458
  %462 = bitcast i32 %461 to float
  %463 = fmul contract float %462, 5.000000e-01
  %464 = fadd contract float %463, 5.000000e-01
  %465 = fmul contract float %464, 2.550000e+02
  %466 = fptoui float %465 to i8
  store i8 %466, i8 addrspace(1)* %32, align 1, !tbaa !8
  %467 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 1
  %468 = load i8, i8 addrspace(1)* %467, align 1, !tbaa !8, !amdgpu.noclobber !5
  %469 = uitofp i8 %468 to double
  %470 = fmul contract double %469, 5.000000e-01
  %471 = fdiv contract double %470, 2.550000e+02
  %472 = tail call float @llvm.fabs.f32(float %326)
  %473 = tail call float @llvm.amdgcn.frexp.mant.f32(float %472)
  %474 = fcmp olt float %473, 0x3FE5555560000000
  %475 = zext i1 %474 to i32
  %476 = tail call float @llvm.amdgcn.ldexp.f32(float %473, i32 %475)
  %477 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %472)
  %478 = sub nsw i32 %477, %475
  %479 = fadd float %476, -1.000000e+00
  %480 = fadd float %476, 1.000000e+00
  %481 = fadd float %480, -1.000000e+00
  %482 = fsub float %476, %481
  %483 = tail call float @llvm.amdgcn.rcp.f32(float %480)
  %484 = fmul float %479, %483
  %485 = fmul float %480, %484
  %486 = fneg float %485
  %487 = tail call float @llvm.fma.f32(float %484, float %480, float %486)
  %488 = tail call float @llvm.fma.f32(float %484, float %482, float %487)
  %489 = fadd float %485, %488
  %490 = fsub float %489, %485
  %491 = fsub float %488, %490
  %492 = fsub float %479, %489
  %493 = fsub float %479, %492
  %494 = fsub float %493, %489
  %495 = fsub float %494, %491
  %496 = fadd float %492, %495
  %497 = fmul float %483, %496
  %498 = fadd float %484, %497
  %499 = fsub float %498, %484
  %500 = fsub float %497, %499
  %501 = fmul float %498, %498
  %502 = fneg float %501
  %503 = tail call float @llvm.fma.f32(float %498, float %498, float %502)
  %504 = fmul float %500, 2.000000e+00
  %505 = tail call float @llvm.fma.f32(float %498, float %504, float %503)
  %506 = fadd float %501, %505
  %507 = fsub float %506, %501
  %508 = fsub float %505, %507
  %509 = tail call float @llvm.fmuladd.f32(float %506, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %510 = tail call float @llvm.fmuladd.f32(float %506, float %509, float 0x3FD999BDE0000000)
  %511 = sitofp i32 %478 to float
  %512 = fmul float %511, 0x3FE62E4300000000
  %513 = fneg float %512
  %514 = tail call float @llvm.fma.f32(float %511, float 0x3FE62E4300000000, float %513)
  %515 = tail call float @llvm.fma.f32(float %511, float 0xBE205C6100000000, float %514)
  %516 = fadd float %512, %515
  %517 = fsub float %516, %512
  %518 = fsub float %515, %517
  %519 = tail call float @llvm.amdgcn.ldexp.f32(float %498, i32 1)
  %520 = fmul float %498, %506
  %521 = fneg float %520
  %522 = tail call float @llvm.fma.f32(float %506, float %498, float %521)
  %523 = tail call float @llvm.fma.f32(float %506, float %500, float %522)
  %524 = tail call float @llvm.fma.f32(float %508, float %498, float %523)
  %525 = fadd float %520, %524
  %526 = fsub float %525, %520
  %527 = fsub float %524, %526
  %528 = fmul float %506, %510
  %529 = fneg float %528
  %530 = tail call float @llvm.fma.f32(float %506, float %510, float %529)
  %531 = tail call float @llvm.fma.f32(float %508, float %510, float %530)
  %532 = fadd float %528, %531
  %533 = fsub float %532, %528
  %534 = fsub float %531, %533
  %535 = fadd float %532, 0x3FE5555540000000
  %536 = fadd float %535, 0xBFE5555540000000
  %537 = fsub float %532, %536
  %538 = fadd float %534, 0x3E2E720200000000
  %539 = fadd float %538, %537
  %540 = fadd float %535, %539
  %541 = fsub float %540, %535
  %542 = fsub float %539, %541
  %543 = fmul float %525, %540
  %544 = fneg float %543
  %545 = tail call float @llvm.fma.f32(float %525, float %540, float %544)
  %546 = tail call float @llvm.fma.f32(float %525, float %542, float %545)
  %547 = tail call float @llvm.fma.f32(float %527, float %540, float %546)
  %548 = tail call float @llvm.amdgcn.ldexp.f32(float %500, i32 1)
  %549 = fadd float %543, %547
  %550 = fsub float %549, %543
  %551 = fsub float %547, %550
  %552 = fadd float %519, %549
  %553 = fsub float %552, %519
  %554 = fsub float %549, %553
  %555 = fadd float %548, %551
  %556 = fadd float %555, %554
  %557 = fadd float %552, %556
  %558 = fsub float %557, %552
  %559 = fsub float %556, %558
  %560 = fadd float %516, %557
  %561 = fsub float %560, %516
  %562 = fsub float %560, %561
  %563 = fsub float %516, %562
  %564 = fsub float %557, %561
  %565 = fadd float %564, %563
  %566 = fadd float %518, %559
  %567 = fsub float %566, %518
  %568 = fsub float %566, %567
  %569 = fsub float %518, %568
  %570 = fsub float %559, %567
  %571 = fadd float %570, %569
  %572 = fadd float %566, %565
  %573 = fadd float %560, %572
  %574 = fsub float %573, %560
  %575 = fsub float %572, %574
  %576 = fadd float %571, %575
  %577 = fadd float %573, %576
  %578 = fsub float %577, %573
  %579 = fsub float %576, %578
  %580 = fmul float %577, 3.000000e+00
  %581 = fneg float %580
  %582 = tail call float @llvm.fma.f32(float %577, float 3.000000e+00, float %581)
  %583 = tail call float @llvm.fma.f32(float %579, float 3.000000e+00, float %582)
  %584 = fadd float %580, %583
  %585 = fsub float %584, %580
  %586 = fsub float %583, %585
  %587 = tail call float @llvm.fabs.f32(float %580) #3
  %588 = fcmp oeq float %587, 0x7FF0000000000000
  %589 = select i1 %588, float %580, float %584
  %590 = tail call float @llvm.fabs.f32(float %589) #3
  %591 = fcmp oeq float %590, 0x7FF0000000000000
  %592 = select i1 %591, float 0.000000e+00, float %586
  %593 = fcmp oeq float %589, 0x40562E4300000000
  %594 = select i1 %593, float 0x3EE0000000000000, float 0.000000e+00
  %595 = fsub float %589, %594
  %596 = fadd float %594, %592
  %597 = fmul float %595, 0x3FF7154760000000
  %598 = tail call float @llvm.rint.f32(float %597)
  %599 = fcmp ogt float %595, 0x40562E4300000000
  %600 = fcmp olt float %595, 0xC059D1DA00000000
  %601 = fneg float %597
  %602 = tail call float @llvm.fma.f32(float %595, float 0x3FF7154760000000, float %601)
  %603 = tail call float @llvm.fma.f32(float %595, float 0x3E54AE0BE0000000, float %602)
  %604 = fsub float %597, %598
  %605 = fadd float %603, %604
  %606 = tail call float @llvm.exp2.f32(float %605)
  %607 = fptosi float %598 to i32
  %608 = tail call float @llvm.amdgcn.ldexp.f32(float %606, i32 %607)
  %609 = select i1 %600, float 0.000000e+00, float %608
  %610 = select i1 %599, float 0x7FF0000000000000, float %609
  %611 = tail call float @llvm.fma.f32(float %610, float %596, float %610)
  %612 = tail call float @llvm.fabs.f32(float %610) #3
  %613 = fcmp oeq float %612, 0x7FF0000000000000
  %614 = select i1 %613, float %610, float %611
  %615 = fcmp olt float %326, 0.000000e+00
  %616 = select i1 %615, float -0.000000e+00, float 0.000000e+00
  %617 = tail call float @llvm.copysign.f32(float %614, float %616)
  %618 = fcmp oeq float %472, 0x7FF0000000000000
  %619 = fcmp oeq float %326, 0.000000e+00
  %620 = or i1 %619, %618
  %621 = select i1 %619, float 0.000000e+00, float 0x7FF0000000000000
  %622 = tail call float @llvm.copysign.f32(float %621, float %326)
  %623 = select i1 %620, float %622, float %617
  %624 = fcmp uno float %326, 0.000000e+00
  %625 = select i1 %624, float 0x7FF8000000000000, float %623
  %626 = fcmp oeq float %326, 1.000000e+00
  %627 = select i1 %626, float 1.000000e+00, float %625
  %628 = fpext float %627 to double
  %629 = fmul contract double %628, 5.000000e-01
  %630 = fadd contract double %629, %471
  %631 = fmul contract double %630, 2.550000e+02
  %632 = fptoui double %631 to i8
  store i8 %632, i8 addrspace(1)* %467, align 1, !tbaa !8
  %633 = uitofp i8 %466 to double
  %634 = fmul contract double %633, 5.000000e-01
  %635 = fdiv contract double %634, 2.550000e+02
  %636 = tail call float @llvm.fabs.f32(float %179)
  %637 = tail call float @llvm.amdgcn.frexp.mant.f32(float %636)
  %638 = fcmp olt float %637, 0x3FE5555560000000
  %639 = zext i1 %638 to i32
  %640 = tail call float @llvm.amdgcn.ldexp.f32(float %637, i32 %639)
  %641 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %636)
  %642 = sub nsw i32 %641, %639
  %643 = fadd float %640, -1.000000e+00
  %644 = fadd float %640, 1.000000e+00
  %645 = fadd float %644, -1.000000e+00
  %646 = fsub float %640, %645
  %647 = tail call float @llvm.amdgcn.rcp.f32(float %644)
  %648 = fmul float %643, %647
  %649 = fmul float %644, %648
  %650 = fneg float %649
  %651 = tail call float @llvm.fma.f32(float %648, float %644, float %650)
  %652 = tail call float @llvm.fma.f32(float %648, float %646, float %651)
  %653 = fadd float %649, %652
  %654 = fsub float %653, %649
  %655 = fsub float %652, %654
  %656 = fsub float %643, %653
  %657 = fsub float %643, %656
  %658 = fsub float %657, %653
  %659 = fsub float %658, %655
  %660 = fadd float %656, %659
  %661 = fmul float %647, %660
  %662 = fadd float %648, %661
  %663 = fsub float %662, %648
  %664 = fsub float %661, %663
  %665 = fmul float %662, %662
  %666 = fneg float %665
  %667 = tail call float @llvm.fma.f32(float %662, float %662, float %666)
  %668 = fmul float %664, 2.000000e+00
  %669 = tail call float @llvm.fma.f32(float %662, float %668, float %667)
  %670 = fadd float %665, %669
  %671 = fsub float %670, %665
  %672 = fsub float %669, %671
  %673 = tail call float @llvm.fmuladd.f32(float %670, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %674 = tail call float @llvm.fmuladd.f32(float %670, float %673, float 0x3FD999BDE0000000)
  %675 = sitofp i32 %642 to float
  %676 = fmul float %675, 0x3FE62E4300000000
  %677 = fneg float %676
  %678 = tail call float @llvm.fma.f32(float %675, float 0x3FE62E4300000000, float %677)
  %679 = tail call float @llvm.fma.f32(float %675, float 0xBE205C6100000000, float %678)
  %680 = fadd float %676, %679
  %681 = fsub float %680, %676
  %682 = fsub float %679, %681
  %683 = tail call float @llvm.amdgcn.ldexp.f32(float %662, i32 1)
  %684 = fmul float %662, %670
  %685 = fneg float %684
  %686 = tail call float @llvm.fma.f32(float %670, float %662, float %685)
  %687 = tail call float @llvm.fma.f32(float %670, float %664, float %686)
  %688 = tail call float @llvm.fma.f32(float %672, float %662, float %687)
  %689 = fadd float %684, %688
  %690 = fsub float %689, %684
  %691 = fsub float %688, %690
  %692 = fmul float %670, %674
  %693 = fneg float %692
  %694 = tail call float @llvm.fma.f32(float %670, float %674, float %693)
  %695 = tail call float @llvm.fma.f32(float %672, float %674, float %694)
  %696 = fadd float %692, %695
  %697 = fsub float %696, %692
  %698 = fsub float %695, %697
  %699 = fadd float %696, 0x3FE5555540000000
  %700 = fadd float %699, 0xBFE5555540000000
  %701 = fsub float %696, %700
  %702 = fadd float %698, 0x3E2E720200000000
  %703 = fadd float %702, %701
  %704 = fadd float %699, %703
  %705 = fsub float %704, %699
  %706 = fsub float %703, %705
  %707 = fmul float %689, %704
  %708 = fneg float %707
  %709 = tail call float @llvm.fma.f32(float %689, float %704, float %708)
  %710 = tail call float @llvm.fma.f32(float %689, float %706, float %709)
  %711 = tail call float @llvm.fma.f32(float %691, float %704, float %710)
  %712 = tail call float @llvm.amdgcn.ldexp.f32(float %664, i32 1)
  %713 = fadd float %707, %711
  %714 = fsub float %713, %707
  %715 = fsub float %711, %714
  %716 = fadd float %683, %713
  %717 = fsub float %716, %683
  %718 = fsub float %713, %717
  %719 = fadd float %712, %715
  %720 = fadd float %719, %718
  %721 = fadd float %716, %720
  %722 = fsub float %721, %716
  %723 = fsub float %720, %722
  %724 = fadd float %680, %721
  %725 = fsub float %724, %680
  %726 = fsub float %724, %725
  %727 = fsub float %680, %726
  %728 = fsub float %721, %725
  %729 = fadd float %728, %727
  %730 = fadd float %682, %723
  %731 = fsub float %730, %682
  %732 = fsub float %730, %731
  %733 = fsub float %682, %732
  %734 = fsub float %723, %731
  %735 = fadd float %734, %733
  %736 = fadd float %730, %729
  %737 = fadd float %724, %736
  %738 = fsub float %737, %724
  %739 = fsub float %736, %738
  %740 = fadd float %735, %739
  %741 = fadd float %737, %740
  %742 = fsub float %741, %737
  %743 = fsub float %740, %742
  %744 = fmul float %741, 3.000000e+00
  %745 = fneg float %744
  %746 = tail call float @llvm.fma.f32(float %741, float 3.000000e+00, float %745)
  %747 = tail call float @llvm.fma.f32(float %743, float 3.000000e+00, float %746)
  %748 = fadd float %744, %747
  %749 = fsub float %748, %744
  %750 = fsub float %747, %749
  %751 = tail call float @llvm.fabs.f32(float %744) #3
  %752 = fcmp oeq float %751, 0x7FF0000000000000
  %753 = select i1 %752, float %744, float %748
  %754 = tail call float @llvm.fabs.f32(float %753) #3
  %755 = fcmp oeq float %754, 0x7FF0000000000000
  %756 = select i1 %755, float 0.000000e+00, float %750
  %757 = fcmp oeq float %753, 0x40562E4300000000
  %758 = select i1 %757, float 0x3EE0000000000000, float 0.000000e+00
  %759 = fsub float %753, %758
  %760 = fadd float %758, %756
  %761 = fmul float %759, 0x3FF7154760000000
  %762 = tail call float @llvm.rint.f32(float %761)
  %763 = fcmp ogt float %759, 0x40562E4300000000
  %764 = fcmp olt float %759, 0xC059D1DA00000000
  %765 = fneg float %761
  %766 = tail call float @llvm.fma.f32(float %759, float 0x3FF7154760000000, float %765)
  %767 = tail call float @llvm.fma.f32(float %759, float 0x3E54AE0BE0000000, float %766)
  %768 = fsub float %761, %762
  %769 = fadd float %767, %768
  %770 = tail call float @llvm.exp2.f32(float %769)
  %771 = fptosi float %762 to i32
  %772 = tail call float @llvm.amdgcn.ldexp.f32(float %770, i32 %771)
  %773 = select i1 %764, float 0.000000e+00, float %772
  %774 = select i1 %763, float 0x7FF0000000000000, float %773
  %775 = tail call float @llvm.fma.f32(float %774, float %760, float %774)
  %776 = tail call float @llvm.fabs.f32(float %774) #3
  %777 = fcmp oeq float %776, 0x7FF0000000000000
  %778 = select i1 %777, float %774, float %775
  %779 = fcmp olt float %179, 0.000000e+00
  %780 = select i1 %779, float -0.000000e+00, float 0.000000e+00
  %781 = tail call float @llvm.copysign.f32(float %778, float %780)
  %782 = fcmp oeq float %636, 0x7FF0000000000000
  %783 = fcmp oeq float %179, 0.000000e+00
  %784 = or i1 %783, %782
  %785 = select i1 %783, float 0.000000e+00, float 0x7FF0000000000000
  %786 = tail call float @llvm.copysign.f32(float %785, float %179)
  %787 = select i1 %784, float %786, float %781
  %788 = fcmp uno float %179, 0.000000e+00
  %789 = select i1 %788, float 0x7FF8000000000000, float %787
  %790 = fcmp oeq float %179, 1.000000e+00
  %791 = select i1 %790, float 1.000000e+00, float %789
  %792 = fpext float %791 to double
  %793 = fmul contract double %792, 5.000000e-01
  %794 = fadd contract double %793, %635
  %795 = fmul contract double %794, 2.550000e+02
  %796 = fptoui double %795 to i8
  %797 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 2
  store i8 %796, i8 addrspace(1)* %797, align 1, !tbaa !8
  %798 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 3
  store i8 -1, i8 addrspace(1)* %798, align 1, !tbaa !8
  br label %799

799:                                              ; preds = %5, %442
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
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
