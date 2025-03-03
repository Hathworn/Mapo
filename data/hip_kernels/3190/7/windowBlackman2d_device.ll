; ModuleID = '../data/hip_kernels/3190/7/main.cu'
source_filename = "../data/hip_kernels/3190/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z16windowBlackman2dPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = icmp slt i32 %12, %1
  %22 = icmp slt i32 %20, %2
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %615

24:                                               ; preds = %3
  %25 = sitofp i32 %20 to float
  %26 = fmul contract float %25, 0x401921FA00000000
  %27 = add nsw i32 %2, -1
  %28 = sitofp i32 %27 to float
  %29 = fdiv contract float %26, %28
  %30 = tail call float @llvm.fabs.f32(float %29)
  %31 = fcmp olt float %30, 1.310720e+05
  br i1 %31, label %32, label %39

32:                                               ; preds = %24
  %33 = fmul float %30, 0x3FE45F3060000000
  %34 = tail call float @llvm.rint.f32(float %33)
  %35 = tail call float @llvm.fma.f32(float %34, float 0xBFF921FB40000000, float %30)
  %36 = tail call float @llvm.fma.f32(float %34, float 0xBE74442D00000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %34, float 0xBCF8469880000000, float %36)
  %38 = fptosi float %34 to i32
  br label %145

39:                                               ; preds = %24
  %40 = bitcast float %30 to i32
  %41 = lshr i32 %40, 23
  %42 = and i32 %40, 8388607
  %43 = or i32 %42, 8388608
  %44 = zext i32 %43 to i64
  %45 = mul nuw nsw i64 %44, 4266746795
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %44, 1011060801
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %44, 3680671129
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %44, 4113882560
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %44, 4230436817
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %44, 1313084713
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = mul nuw nsw i64 %44, 2734261102
  %69 = add nuw nsw i64 %67, %68
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = add nsw i32 %41, -120
  %74 = icmp ugt i32 %73, 63
  %75 = select i1 %74, i32 %66, i32 %72
  %76 = select i1 %74, i32 %62, i32 %70
  %77 = select i1 %74, i32 %58, i32 %66
  %78 = select i1 %74, i32 %54, i32 %62
  %79 = select i1 %74, i32 %50, i32 %58
  %80 = select i1 %74, i32 %46, i32 %54
  %81 = select i1 %74, i32 -64, i32 0
  %82 = add nsw i32 %81, %73
  %83 = icmp ugt i32 %82, 31
  %84 = select i1 %83, i32 %76, i32 %75
  %85 = select i1 %83, i32 %77, i32 %76
  %86 = select i1 %83, i32 %78, i32 %77
  %87 = select i1 %83, i32 %79, i32 %78
  %88 = select i1 %83, i32 %80, i32 %79
  %89 = select i1 %83, i32 -32, i32 0
  %90 = add nsw i32 %89, %82
  %91 = icmp ugt i32 %90, 31
  %92 = select i1 %91, i32 %85, i32 %84
  %93 = select i1 %91, i32 %86, i32 %85
  %94 = select i1 %91, i32 %87, i32 %86
  %95 = select i1 %91, i32 %88, i32 %87
  %96 = select i1 %91, i32 -32, i32 0
  %97 = add nsw i32 %96, %90
  %98 = icmp eq i32 %97, 0
  %99 = sub nsw i32 32, %97
  %100 = tail call i32 @llvm.fshr.i32(i32 %92, i32 %93, i32 %99)
  %101 = tail call i32 @llvm.fshr.i32(i32 %93, i32 %94, i32 %99)
  %102 = tail call i32 @llvm.fshr.i32(i32 %94, i32 %95, i32 %99)
  %103 = select i1 %98, i32 %92, i32 %100
  %104 = select i1 %98, i32 %93, i32 %101
  %105 = select i1 %98, i32 %94, i32 %102
  %106 = lshr i32 %103, 29
  %107 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %104, i32 2)
  %108 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %105, i32 2)
  %109 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %95, i32 2)
  %110 = and i32 %106, 1
  %111 = sub nsw i32 0, %110
  %112 = shl i32 %106, 31
  %113 = xor i32 %107, %111
  %114 = xor i32 %108, %111
  %115 = xor i32 %109, %111
  %116 = tail call i32 @llvm.ctlz.i32(i32 %113, i1 false), !range !7
  %117 = sub nsw i32 31, %116
  %118 = tail call i32 @llvm.fshr.i32(i32 %113, i32 %114, i32 %117)
  %119 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %115, i32 %117)
  %120 = shl nuw nsw i32 %116, 23
  %121 = sub nuw nsw i32 1056964608, %120
  %122 = lshr i32 %118, 9
  %123 = or i32 %122, %121
  %124 = or i32 %123, %112
  %125 = bitcast i32 %124 to float
  %126 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %119, i32 23)
  %127 = tail call i32 @llvm.ctlz.i32(i32 %126, i1 false), !range !7
  %128 = fmul float %125, 0x3FF921FB40000000
  %129 = add nuw nsw i32 %127, %116
  %130 = shl nuw nsw i32 %129, 23
  %131 = sub nuw nsw i32 855638016, %130
  %132 = sub nsw i32 31, %127
  %133 = tail call i32 @llvm.fshr.i32(i32 %126, i32 %119, i32 %132)
  %134 = lshr i32 %133, 9
  %135 = or i32 %131, %134
  %136 = or i32 %135, %112
  %137 = bitcast i32 %136 to float
  %138 = fneg float %128
  %139 = tail call float @llvm.fma.f32(float %125, float 0x3FF921FB40000000, float %138)
  %140 = tail call float @llvm.fma.f32(float %125, float 0x3E74442D00000000, float %139)
  %141 = tail call float @llvm.fma.f32(float %137, float 0x3FF921FB40000000, float %140)
  %142 = fadd float %128, %141
  %143 = lshr i32 %103, 30
  %144 = add nuw nsw i32 %110, %143
  br label %145

145:                                              ; preds = %32, %39
  %146 = phi float [ %37, %32 ], [ %142, %39 ]
  %147 = phi i32 [ %38, %32 ], [ %144, %39 ]
  %148 = fmul float %146, %146
  %149 = tail call float @llvm.fmuladd.f32(float %148, float 0xBF29833040000000, float 0x3F81103880000000)
  %150 = tail call float @llvm.fmuladd.f32(float %148, float %149, float 0xBFC55553A0000000)
  %151 = fmul float %148, %150
  %152 = tail call float @llvm.fmuladd.f32(float %146, float %151, float %146)
  %153 = tail call float @llvm.fmuladd.f32(float %148, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %154 = tail call float @llvm.fmuladd.f32(float %148, float %153, float 0x3FA5557EE0000000)
  %155 = tail call float @llvm.fmuladd.f32(float %148, float %154, float 0xBFE0000080000000)
  %156 = tail call float @llvm.fmuladd.f32(float %148, float %155, float 1.000000e+00)
  %157 = fneg float %152
  %158 = and i32 %147, 1
  %159 = icmp eq i32 %158, 0
  %160 = select i1 %159, float %156, float %157
  %161 = bitcast float %160 to i32
  %162 = shl i32 %147, 30
  %163 = and i32 %162, -2147483648
  %164 = xor i32 %163, %161
  %165 = bitcast i32 %164 to float
  %166 = tail call i1 @llvm.amdgcn.class.f32(float %30, i32 504)
  %167 = fpext float %165 to double
  %168 = fmul contract double %167, -1.850000e-01
  %169 = select i1 %166, double %168, double 0x7FF8000000000000
  %170 = fmul contract float %25, 0x402921FA00000000
  %171 = fdiv contract float %170, %28
  %172 = tail call float @llvm.fabs.f32(float %171)
  %173 = fcmp olt float %172, 1.310720e+05
  br i1 %173, label %174, label %182

174:                                              ; preds = %145
  %175 = fmul float %172, 0x3FE45F3060000000
  %176 = tail call float @llvm.rint.f32(float %175)
  %177 = tail call float @llvm.fma.f32(float %176, float 0xBFF921FB40000000, float %172)
  %178 = tail call float @llvm.fma.f32(float %176, float 0xBE74442D00000000, float %177)
  %179 = tail call float @llvm.fma.f32(float %176, float 0xBCF8469880000000, float %178)
  %180 = fptosi float %176 to i32
  %181 = bitcast float %172 to i32
  br label %288

182:                                              ; preds = %145
  %183 = bitcast float %172 to i32
  %184 = lshr i32 %183, 23
  %185 = and i32 %183, 8388607
  %186 = or i32 %185, 8388608
  %187 = zext i32 %186 to i64
  %188 = mul nuw nsw i64 %187, 4266746795
  %189 = trunc i64 %188 to i32
  %190 = lshr i64 %188, 32
  %191 = mul nuw nsw i64 %187, 1011060801
  %192 = add nuw nsw i64 %190, %191
  %193 = trunc i64 %192 to i32
  %194 = lshr i64 %192, 32
  %195 = mul nuw nsw i64 %187, 3680671129
  %196 = add nuw nsw i64 %194, %195
  %197 = trunc i64 %196 to i32
  %198 = lshr i64 %196, 32
  %199 = mul nuw nsw i64 %187, 4113882560
  %200 = add nuw nsw i64 %198, %199
  %201 = trunc i64 %200 to i32
  %202 = lshr i64 %200, 32
  %203 = mul nuw nsw i64 %187, 4230436817
  %204 = add nuw nsw i64 %202, %203
  %205 = trunc i64 %204 to i32
  %206 = lshr i64 %204, 32
  %207 = mul nuw nsw i64 %187, 1313084713
  %208 = add nuw nsw i64 %206, %207
  %209 = trunc i64 %208 to i32
  %210 = lshr i64 %208, 32
  %211 = mul nuw nsw i64 %187, 2734261102
  %212 = add nuw nsw i64 %210, %211
  %213 = trunc i64 %212 to i32
  %214 = lshr i64 %212, 32
  %215 = trunc i64 %214 to i32
  %216 = add nsw i32 %184, -120
  %217 = icmp ugt i32 %216, 63
  %218 = select i1 %217, i32 %209, i32 %215
  %219 = select i1 %217, i32 %205, i32 %213
  %220 = select i1 %217, i32 %201, i32 %209
  %221 = select i1 %217, i32 %197, i32 %205
  %222 = select i1 %217, i32 %193, i32 %201
  %223 = select i1 %217, i32 %189, i32 %197
  %224 = select i1 %217, i32 -64, i32 0
  %225 = add nsw i32 %224, %216
  %226 = icmp ugt i32 %225, 31
  %227 = select i1 %226, i32 %219, i32 %218
  %228 = select i1 %226, i32 %220, i32 %219
  %229 = select i1 %226, i32 %221, i32 %220
  %230 = select i1 %226, i32 %222, i32 %221
  %231 = select i1 %226, i32 %223, i32 %222
  %232 = select i1 %226, i32 -32, i32 0
  %233 = add nsw i32 %232, %225
  %234 = icmp ugt i32 %233, 31
  %235 = select i1 %234, i32 %228, i32 %227
  %236 = select i1 %234, i32 %229, i32 %228
  %237 = select i1 %234, i32 %230, i32 %229
  %238 = select i1 %234, i32 %231, i32 %230
  %239 = select i1 %234, i32 -32, i32 0
  %240 = add nsw i32 %239, %233
  %241 = icmp eq i32 %240, 0
  %242 = sub nsw i32 32, %240
  %243 = tail call i32 @llvm.fshr.i32(i32 %235, i32 %236, i32 %242)
  %244 = tail call i32 @llvm.fshr.i32(i32 %236, i32 %237, i32 %242)
  %245 = tail call i32 @llvm.fshr.i32(i32 %237, i32 %238, i32 %242)
  %246 = select i1 %241, i32 %235, i32 %243
  %247 = select i1 %241, i32 %236, i32 %244
  %248 = select i1 %241, i32 %237, i32 %245
  %249 = lshr i32 %246, 29
  %250 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %247, i32 2)
  %251 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %248, i32 2)
  %252 = tail call i32 @llvm.fshl.i32(i32 %248, i32 %238, i32 2)
  %253 = and i32 %249, 1
  %254 = sub nsw i32 0, %253
  %255 = shl i32 %249, 31
  %256 = xor i32 %250, %254
  %257 = xor i32 %251, %254
  %258 = xor i32 %252, %254
  %259 = tail call i32 @llvm.ctlz.i32(i32 %256, i1 false), !range !7
  %260 = sub nsw i32 31, %259
  %261 = tail call i32 @llvm.fshr.i32(i32 %256, i32 %257, i32 %260)
  %262 = tail call i32 @llvm.fshr.i32(i32 %257, i32 %258, i32 %260)
  %263 = shl nuw nsw i32 %259, 23
  %264 = sub nuw nsw i32 1056964608, %263
  %265 = lshr i32 %261, 9
  %266 = or i32 %265, %264
  %267 = or i32 %266, %255
  %268 = bitcast i32 %267 to float
  %269 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %262, i32 23)
  %270 = tail call i32 @llvm.ctlz.i32(i32 %269, i1 false), !range !7
  %271 = fmul float %268, 0x3FF921FB40000000
  %272 = add nuw nsw i32 %270, %259
  %273 = shl nuw nsw i32 %272, 23
  %274 = sub nuw nsw i32 855638016, %273
  %275 = sub nsw i32 31, %270
  %276 = tail call i32 @llvm.fshr.i32(i32 %269, i32 %262, i32 %275)
  %277 = lshr i32 %276, 9
  %278 = or i32 %274, %277
  %279 = or i32 %278, %255
  %280 = bitcast i32 %279 to float
  %281 = fneg float %271
  %282 = tail call float @llvm.fma.f32(float %268, float 0x3FF921FB40000000, float %281)
  %283 = tail call float @llvm.fma.f32(float %268, float 0x3E74442D00000000, float %282)
  %284 = tail call float @llvm.fma.f32(float %280, float 0x3FF921FB40000000, float %283)
  %285 = fadd float %271, %284
  %286 = lshr i32 %246, 30
  %287 = add nuw nsw i32 %253, %286
  br label %288

288:                                              ; preds = %174, %182
  %289 = phi i32 [ %181, %174 ], [ %183, %182 ]
  %290 = phi float [ %179, %174 ], [ %285, %182 ]
  %291 = phi i32 [ %180, %174 ], [ %287, %182 ]
  %292 = fmul float %290, %290
  %293 = tail call float @llvm.fmuladd.f32(float %292, float 0xBF29833040000000, float 0x3F81103880000000)
  %294 = tail call float @llvm.fmuladd.f32(float %292, float %293, float 0xBFC55553A0000000)
  %295 = fmul float %292, %294
  %296 = tail call float @llvm.fmuladd.f32(float %290, float %295, float %290)
  %297 = tail call float @llvm.fmuladd.f32(float %292, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %298 = tail call float @llvm.fmuladd.f32(float %292, float %297, float 0x3FA5557EE0000000)
  %299 = tail call float @llvm.fmuladd.f32(float %292, float %298, float 0xBFE0000080000000)
  %300 = tail call float @llvm.fmuladd.f32(float %292, float %299, float 1.000000e+00)
  %301 = and i32 %291, 1
  %302 = icmp eq i32 %301, 0
  %303 = select i1 %302, float %296, float %300
  %304 = bitcast float %303 to i32
  %305 = shl i32 %291, 30
  %306 = and i32 %305, -2147483648
  %307 = bitcast float %171 to i32
  %308 = xor i32 %289, %307
  %309 = xor i32 %308, %306
  %310 = xor i32 %309, %304
  %311 = bitcast i32 %310 to float
  %312 = tail call i1 @llvm.amdgcn.class.f32(float %172, i32 504)
  %313 = fpext float %311 to double
  %314 = fmul contract double %313, 8.000000e-02
  %315 = select i1 %312, double %314, double 0x7FF8000000000000
  %316 = fadd contract double %169, %315
  %317 = sitofp i32 %12 to float
  %318 = fmul contract float %317, 0x401921FA00000000
  %319 = add nsw i32 %1, -1
  %320 = sitofp i32 %319 to float
  %321 = fdiv contract float %318, %320
  %322 = tail call float @llvm.fabs.f32(float %321)
  %323 = fcmp olt float %322, 1.310720e+05
  br i1 %323, label %324, label %331

324:                                              ; preds = %288
  %325 = fmul float %322, 0x3FE45F3060000000
  %326 = tail call float @llvm.rint.f32(float %325)
  %327 = tail call float @llvm.fma.f32(float %326, float 0xBFF921FB40000000, float %322)
  %328 = tail call float @llvm.fma.f32(float %326, float 0xBE74442D00000000, float %327)
  %329 = tail call float @llvm.fma.f32(float %326, float 0xBCF8469880000000, float %328)
  %330 = fptosi float %326 to i32
  br label %437

331:                                              ; preds = %288
  %332 = bitcast float %322 to i32
  %333 = lshr i32 %332, 23
  %334 = and i32 %332, 8388607
  %335 = or i32 %334, 8388608
  %336 = zext i32 %335 to i64
  %337 = mul nuw nsw i64 %336, 4266746795
  %338 = trunc i64 %337 to i32
  %339 = lshr i64 %337, 32
  %340 = mul nuw nsw i64 %336, 1011060801
  %341 = add nuw nsw i64 %339, %340
  %342 = trunc i64 %341 to i32
  %343 = lshr i64 %341, 32
  %344 = mul nuw nsw i64 %336, 3680671129
  %345 = add nuw nsw i64 %343, %344
  %346 = trunc i64 %345 to i32
  %347 = lshr i64 %345, 32
  %348 = mul nuw nsw i64 %336, 4113882560
  %349 = add nuw nsw i64 %347, %348
  %350 = trunc i64 %349 to i32
  %351 = lshr i64 %349, 32
  %352 = mul nuw nsw i64 %336, 4230436817
  %353 = add nuw nsw i64 %351, %352
  %354 = trunc i64 %353 to i32
  %355 = lshr i64 %353, 32
  %356 = mul nuw nsw i64 %336, 1313084713
  %357 = add nuw nsw i64 %355, %356
  %358 = trunc i64 %357 to i32
  %359 = lshr i64 %357, 32
  %360 = mul nuw nsw i64 %336, 2734261102
  %361 = add nuw nsw i64 %359, %360
  %362 = trunc i64 %361 to i32
  %363 = lshr i64 %361, 32
  %364 = trunc i64 %363 to i32
  %365 = add nsw i32 %333, -120
  %366 = icmp ugt i32 %365, 63
  %367 = select i1 %366, i32 %358, i32 %364
  %368 = select i1 %366, i32 %354, i32 %362
  %369 = select i1 %366, i32 %350, i32 %358
  %370 = select i1 %366, i32 %346, i32 %354
  %371 = select i1 %366, i32 %342, i32 %350
  %372 = select i1 %366, i32 %338, i32 %346
  %373 = select i1 %366, i32 -64, i32 0
  %374 = add nsw i32 %373, %365
  %375 = icmp ugt i32 %374, 31
  %376 = select i1 %375, i32 %368, i32 %367
  %377 = select i1 %375, i32 %369, i32 %368
  %378 = select i1 %375, i32 %370, i32 %369
  %379 = select i1 %375, i32 %371, i32 %370
  %380 = select i1 %375, i32 %372, i32 %371
  %381 = select i1 %375, i32 -32, i32 0
  %382 = add nsw i32 %381, %374
  %383 = icmp ugt i32 %382, 31
  %384 = select i1 %383, i32 %377, i32 %376
  %385 = select i1 %383, i32 %378, i32 %377
  %386 = select i1 %383, i32 %379, i32 %378
  %387 = select i1 %383, i32 %380, i32 %379
  %388 = select i1 %383, i32 -32, i32 0
  %389 = add nsw i32 %388, %382
  %390 = icmp eq i32 %389, 0
  %391 = sub nsw i32 32, %389
  %392 = tail call i32 @llvm.fshr.i32(i32 %384, i32 %385, i32 %391)
  %393 = tail call i32 @llvm.fshr.i32(i32 %385, i32 %386, i32 %391)
  %394 = tail call i32 @llvm.fshr.i32(i32 %386, i32 %387, i32 %391)
  %395 = select i1 %390, i32 %384, i32 %392
  %396 = select i1 %390, i32 %385, i32 %393
  %397 = select i1 %390, i32 %386, i32 %394
  %398 = lshr i32 %395, 29
  %399 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %396, i32 2)
  %400 = tail call i32 @llvm.fshl.i32(i32 %396, i32 %397, i32 2)
  %401 = tail call i32 @llvm.fshl.i32(i32 %397, i32 %387, i32 2)
  %402 = and i32 %398, 1
  %403 = sub nsw i32 0, %402
  %404 = shl i32 %398, 31
  %405 = xor i32 %399, %403
  %406 = xor i32 %400, %403
  %407 = xor i32 %401, %403
  %408 = tail call i32 @llvm.ctlz.i32(i32 %405, i1 false), !range !7
  %409 = sub nsw i32 31, %408
  %410 = tail call i32 @llvm.fshr.i32(i32 %405, i32 %406, i32 %409)
  %411 = tail call i32 @llvm.fshr.i32(i32 %406, i32 %407, i32 %409)
  %412 = shl nuw nsw i32 %408, 23
  %413 = sub nuw nsw i32 1056964608, %412
  %414 = lshr i32 %410, 9
  %415 = or i32 %414, %413
  %416 = or i32 %415, %404
  %417 = bitcast i32 %416 to float
  %418 = tail call i32 @llvm.fshl.i32(i32 %410, i32 %411, i32 23)
  %419 = tail call i32 @llvm.ctlz.i32(i32 %418, i1 false), !range !7
  %420 = fmul float %417, 0x3FF921FB40000000
  %421 = add nuw nsw i32 %419, %408
  %422 = shl nuw nsw i32 %421, 23
  %423 = sub nuw nsw i32 855638016, %422
  %424 = sub nsw i32 31, %419
  %425 = tail call i32 @llvm.fshr.i32(i32 %418, i32 %411, i32 %424)
  %426 = lshr i32 %425, 9
  %427 = or i32 %423, %426
  %428 = or i32 %427, %404
  %429 = bitcast i32 %428 to float
  %430 = fneg float %420
  %431 = tail call float @llvm.fma.f32(float %417, float 0x3FF921FB40000000, float %430)
  %432 = tail call float @llvm.fma.f32(float %417, float 0x3E74442D00000000, float %431)
  %433 = tail call float @llvm.fma.f32(float %429, float 0x3FF921FB40000000, float %432)
  %434 = fadd float %420, %433
  %435 = lshr i32 %395, 30
  %436 = add nuw nsw i32 %402, %435
  br label %437

437:                                              ; preds = %324, %331
  %438 = phi float [ %329, %324 ], [ %434, %331 ]
  %439 = phi i32 [ %330, %324 ], [ %436, %331 ]
  %440 = fmul float %438, %438
  %441 = tail call float @llvm.fmuladd.f32(float %440, float 0xBF29833040000000, float 0x3F81103880000000)
  %442 = tail call float @llvm.fmuladd.f32(float %440, float %441, float 0xBFC55553A0000000)
  %443 = fmul float %440, %442
  %444 = tail call float @llvm.fmuladd.f32(float %438, float %443, float %438)
  %445 = tail call float @llvm.fmuladd.f32(float %440, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %446 = tail call float @llvm.fmuladd.f32(float %440, float %445, float 0x3FA5557EE0000000)
  %447 = tail call float @llvm.fmuladd.f32(float %440, float %446, float 0xBFE0000080000000)
  %448 = tail call float @llvm.fmuladd.f32(float %440, float %447, float 1.000000e+00)
  %449 = fneg float %444
  %450 = and i32 %439, 1
  %451 = icmp eq i32 %450, 0
  %452 = select i1 %451, float %448, float %449
  %453 = bitcast float %452 to i32
  %454 = shl i32 %439, 30
  %455 = and i32 %454, -2147483648
  %456 = xor i32 %455, %453
  %457 = bitcast i32 %456 to float
  %458 = tail call i1 @llvm.amdgcn.class.f32(float %322, i32 504)
  %459 = fpext float %457 to double
  %460 = fmul contract double %459, -1.850000e-01
  %461 = select i1 %458, double %460, double 0x7FF8000000000000
  %462 = fmul contract float %317, 0x402921FA00000000
  %463 = fdiv contract float %462, %320
  %464 = tail call float @llvm.fabs.f32(float %463)
  %465 = fcmp olt float %464, 1.310720e+05
  br i1 %465, label %466, label %474

466:                                              ; preds = %437
  %467 = fmul float %464, 0x3FE45F3060000000
  %468 = tail call float @llvm.rint.f32(float %467)
  %469 = tail call float @llvm.fma.f32(float %468, float 0xBFF921FB40000000, float %464)
  %470 = tail call float @llvm.fma.f32(float %468, float 0xBE74442D00000000, float %469)
  %471 = tail call float @llvm.fma.f32(float %468, float 0xBCF8469880000000, float %470)
  %472 = fptosi float %468 to i32
  %473 = bitcast float %464 to i32
  br label %580

474:                                              ; preds = %437
  %475 = bitcast float %464 to i32
  %476 = lshr i32 %475, 23
  %477 = and i32 %475, 8388607
  %478 = or i32 %477, 8388608
  %479 = zext i32 %478 to i64
  %480 = mul nuw nsw i64 %479, 4266746795
  %481 = trunc i64 %480 to i32
  %482 = lshr i64 %480, 32
  %483 = mul nuw nsw i64 %479, 1011060801
  %484 = add nuw nsw i64 %482, %483
  %485 = trunc i64 %484 to i32
  %486 = lshr i64 %484, 32
  %487 = mul nuw nsw i64 %479, 3680671129
  %488 = add nuw nsw i64 %486, %487
  %489 = trunc i64 %488 to i32
  %490 = lshr i64 %488, 32
  %491 = mul nuw nsw i64 %479, 4113882560
  %492 = add nuw nsw i64 %490, %491
  %493 = trunc i64 %492 to i32
  %494 = lshr i64 %492, 32
  %495 = mul nuw nsw i64 %479, 4230436817
  %496 = add nuw nsw i64 %494, %495
  %497 = trunc i64 %496 to i32
  %498 = lshr i64 %496, 32
  %499 = mul nuw nsw i64 %479, 1313084713
  %500 = add nuw nsw i64 %498, %499
  %501 = trunc i64 %500 to i32
  %502 = lshr i64 %500, 32
  %503 = mul nuw nsw i64 %479, 2734261102
  %504 = add nuw nsw i64 %502, %503
  %505 = trunc i64 %504 to i32
  %506 = lshr i64 %504, 32
  %507 = trunc i64 %506 to i32
  %508 = add nsw i32 %476, -120
  %509 = icmp ugt i32 %508, 63
  %510 = select i1 %509, i32 %501, i32 %507
  %511 = select i1 %509, i32 %497, i32 %505
  %512 = select i1 %509, i32 %493, i32 %501
  %513 = select i1 %509, i32 %489, i32 %497
  %514 = select i1 %509, i32 %485, i32 %493
  %515 = select i1 %509, i32 %481, i32 %489
  %516 = select i1 %509, i32 -64, i32 0
  %517 = add nsw i32 %516, %508
  %518 = icmp ugt i32 %517, 31
  %519 = select i1 %518, i32 %511, i32 %510
  %520 = select i1 %518, i32 %512, i32 %511
  %521 = select i1 %518, i32 %513, i32 %512
  %522 = select i1 %518, i32 %514, i32 %513
  %523 = select i1 %518, i32 %515, i32 %514
  %524 = select i1 %518, i32 -32, i32 0
  %525 = add nsw i32 %524, %517
  %526 = icmp ugt i32 %525, 31
  %527 = select i1 %526, i32 %520, i32 %519
  %528 = select i1 %526, i32 %521, i32 %520
  %529 = select i1 %526, i32 %522, i32 %521
  %530 = select i1 %526, i32 %523, i32 %522
  %531 = select i1 %526, i32 -32, i32 0
  %532 = add nsw i32 %531, %525
  %533 = icmp eq i32 %532, 0
  %534 = sub nsw i32 32, %532
  %535 = tail call i32 @llvm.fshr.i32(i32 %527, i32 %528, i32 %534)
  %536 = tail call i32 @llvm.fshr.i32(i32 %528, i32 %529, i32 %534)
  %537 = tail call i32 @llvm.fshr.i32(i32 %529, i32 %530, i32 %534)
  %538 = select i1 %533, i32 %527, i32 %535
  %539 = select i1 %533, i32 %528, i32 %536
  %540 = select i1 %533, i32 %529, i32 %537
  %541 = lshr i32 %538, 29
  %542 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %539, i32 2)
  %543 = tail call i32 @llvm.fshl.i32(i32 %539, i32 %540, i32 2)
  %544 = tail call i32 @llvm.fshl.i32(i32 %540, i32 %530, i32 2)
  %545 = and i32 %541, 1
  %546 = sub nsw i32 0, %545
  %547 = shl i32 %541, 31
  %548 = xor i32 %542, %546
  %549 = xor i32 %543, %546
  %550 = xor i32 %544, %546
  %551 = tail call i32 @llvm.ctlz.i32(i32 %548, i1 false), !range !7
  %552 = sub nsw i32 31, %551
  %553 = tail call i32 @llvm.fshr.i32(i32 %548, i32 %549, i32 %552)
  %554 = tail call i32 @llvm.fshr.i32(i32 %549, i32 %550, i32 %552)
  %555 = shl nuw nsw i32 %551, 23
  %556 = sub nuw nsw i32 1056964608, %555
  %557 = lshr i32 %553, 9
  %558 = or i32 %557, %556
  %559 = or i32 %558, %547
  %560 = bitcast i32 %559 to float
  %561 = tail call i32 @llvm.fshl.i32(i32 %553, i32 %554, i32 23)
  %562 = tail call i32 @llvm.ctlz.i32(i32 %561, i1 false), !range !7
  %563 = fmul float %560, 0x3FF921FB40000000
  %564 = add nuw nsw i32 %562, %551
  %565 = shl nuw nsw i32 %564, 23
  %566 = sub nuw nsw i32 855638016, %565
  %567 = sub nsw i32 31, %562
  %568 = tail call i32 @llvm.fshr.i32(i32 %561, i32 %554, i32 %567)
  %569 = lshr i32 %568, 9
  %570 = or i32 %566, %569
  %571 = or i32 %570, %547
  %572 = bitcast i32 %571 to float
  %573 = fneg float %563
  %574 = tail call float @llvm.fma.f32(float %560, float 0x3FF921FB40000000, float %573)
  %575 = tail call float @llvm.fma.f32(float %560, float 0x3E74442D00000000, float %574)
  %576 = tail call float @llvm.fma.f32(float %572, float 0x3FF921FB40000000, float %575)
  %577 = fadd float %563, %576
  %578 = lshr i32 %538, 30
  %579 = add nuw nsw i32 %545, %578
  br label %580

580:                                              ; preds = %466, %474
  %581 = phi i32 [ %473, %466 ], [ %475, %474 ]
  %582 = phi float [ %471, %466 ], [ %577, %474 ]
  %583 = phi i32 [ %472, %466 ], [ %579, %474 ]
  %584 = fmul float %582, %582
  %585 = tail call float @llvm.fmuladd.f32(float %584, float 0xBF29833040000000, float 0x3F81103880000000)
  %586 = tail call float @llvm.fmuladd.f32(float %584, float %585, float 0xBFC55553A0000000)
  %587 = fmul float %584, %586
  %588 = tail call float @llvm.fmuladd.f32(float %582, float %587, float %582)
  %589 = tail call float @llvm.fmuladd.f32(float %584, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %590 = tail call float @llvm.fmuladd.f32(float %584, float %589, float 0x3FA5557EE0000000)
  %591 = tail call float @llvm.fmuladd.f32(float %584, float %590, float 0xBFE0000080000000)
  %592 = tail call float @llvm.fmuladd.f32(float %584, float %591, float 1.000000e+00)
  %593 = and i32 %583, 1
  %594 = icmp eq i32 %593, 0
  %595 = select i1 %594, float %588, float %592
  %596 = bitcast float %595 to i32
  %597 = shl i32 %583, 30
  %598 = and i32 %597, -2147483648
  %599 = bitcast float %463 to i32
  %600 = xor i32 %581, %599
  %601 = xor i32 %600, %598
  %602 = xor i32 %601, %596
  %603 = bitcast i32 %602 to float
  %604 = tail call i1 @llvm.amdgcn.class.f32(float %464, i32 504)
  %605 = fpext float %603 to double
  %606 = fmul contract double %605, 8.000000e-02
  %607 = select i1 %604, double %606, double 0x7FF8000000000000
  %608 = fadd contract double %461, %607
  %609 = fmul contract double %316, %608
  %610 = fptrunc double %609 to float
  %611 = mul nsw i32 %20, %1
  %612 = add nsw i32 %611, %12
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %0, i64 %613
  store float %610, float addrspace(1)* %614, align 4, !tbaa !8
  br label %615

615:                                              ; preds = %580, %3
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
