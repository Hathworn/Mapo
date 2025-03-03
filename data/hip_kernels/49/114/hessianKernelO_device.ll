; ModuleID = '../data/hip_kernels/49/114/main.cu'
source_filename = "../data/hip_kernels/49/114/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14hessianKernelOPfS_S_PKfS1_S1_S1_S1_S1_fiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %10, %19
  %21 = udiv i32 %15, %20
  %22 = uitofp i32 %21 to float
  %23 = fptosi float %22 to i32
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %20, %23
  %33 = sub i32 %15, %32
  %34 = mul i32 %33, %19
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %36 = mul i32 %23, %11
  %37 = add i32 %31, %36
  %38 = mul i32 %37, %10
  %39 = add i32 %34, %35
  %40 = add i32 %39, %38
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fneg contract float %43
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = getelementptr inbounds float, float addrspace(1)* %5, i64 %41
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fneg contract float %48
  %50 = getelementptr inbounds float, float addrspace(1)* %6, i64 %41
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fneg contract float %51
  %53 = getelementptr inbounds float, float addrspace(1)* %7, i64 %41
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fneg contract float %54
  %56 = getelementptr inbounds float, float addrspace(1)* %8, i64 %41
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fneg contract float %57
  %59 = fsub contract float %52, %43
  %60 = fsub contract float %59, %57
  %61 = fdiv contract float %60, 3.000000e+00
  %62 = fsub contract float %44, %61
  %63 = fsub contract float %52, %61
  %64 = fsub contract float %58, %61
  %65 = fmul contract float %62, %63
  %66 = fmul contract float %64, %65
  %67 = fmul contract float %62, %55
  %68 = fmul contract float %54, %67
  %69 = fadd contract float %66, %68
  %70 = fmul contract float %46, %54
  %71 = fmul contract float %48, %70
  %72 = fsub contract float %69, %71
  %73 = fmul contract float %46, %46
  %74 = fmul contract float %73, %64
  %75 = fsub contract float %72, %74
  %76 = fmul contract float %46, %48
  %77 = fmul contract float %76, %54
  %78 = fsub contract float %75, %77
  %79 = fmul contract float %63, %49
  %80 = fmul contract float %48, %79
  %81 = fadd contract float %80, %78
  %82 = fmul contract float %81, 5.000000e-01
  %83 = fmul contract float %62, %62
  %84 = fadd contract float %73, %83
  %85 = fmul contract float %48, %48
  %86 = fadd contract float %85, %84
  %87 = fadd contract float %73, %86
  %88 = fmul contract float %63, %63
  %89 = fadd contract float %88, %87
  %90 = fmul contract float %54, %54
  %91 = fadd contract float %90, %89
  %92 = fadd contract float %85, %91
  %93 = fadd contract float %90, %92
  %94 = fmul contract float %64, %64
  %95 = fadd contract float %94, %93
  %96 = fdiv contract float %95, 6.000000e+00
  %97 = fmul contract float %96, %96
  %98 = fmul contract float %96, %97
  %99 = fmul contract float %82, %82
  %100 = fsub contract float %98, %99
  %101 = fcmp olt float %100, 0x39F0000000000000
  %102 = select i1 %101, float 0x41F0000000000000, float 1.000000e+00
  %103 = fmul float %100, %102
  %104 = tail call float @llvm.sqrt.f32(float %103)
  %105 = bitcast float %104 to i32
  %106 = add nsw i32 %105, -1
  %107 = bitcast i32 %106 to float
  %108 = add nsw i32 %105, 1
  %109 = bitcast i32 %108 to float
  %110 = tail call i1 @llvm.amdgcn.class.f32(float %103, i32 608)
  %111 = select i1 %101, float 0x3EF0000000000000, float 1.000000e+00
  %112 = fneg float %109
  %113 = tail call float @llvm.fma.f32(float %112, float %104, float %103)
  %114 = fcmp ogt float %113, 0.000000e+00
  %115 = fneg float %107
  %116 = tail call float @llvm.fma.f32(float %115, float %104, float %103)
  %117 = fcmp ole float %116, 0.000000e+00
  %118 = select i1 %117, float %107, float %104
  %119 = select i1 %114, float %109, float %118
  %120 = fmul float %111, %119
  %121 = select i1 %110, float %103, float %120
  %122 = fdiv contract float %121, %82
  %123 = tail call float @llvm.fabs.f32(float %122)
  %124 = fcmp ogt float %123, 1.000000e+00
  %125 = tail call float @llvm.amdgcn.rcp.f32(float %123)
  %126 = select i1 %124, float %125, float %123
  %127 = fmul float %126, %126
  %128 = tail call float @llvm.fmuladd.f32(float %127, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %129 = tail call float @llvm.fmuladd.f32(float %127, float %128, float 0x3FA53F67E0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %127, float %129, float 0xBFB2FA9AE0000000)
  %131 = tail call float @llvm.fmuladd.f32(float %127, float %130, float 0x3FBB263640000000)
  %132 = tail call float @llvm.fmuladd.f32(float %127, float %131, float 0xBFC22C1CC0000000)
  %133 = tail call float @llvm.fmuladd.f32(float %127, float %132, float 0x3FC99717E0000000)
  %134 = tail call float @llvm.fmuladd.f32(float %127, float %133, float 0xBFD5554C40000000)
  %135 = fmul float %127, %134
  %136 = tail call float @llvm.fmuladd.f32(float %126, float %135, float %126)
  %137 = fsub float 0x3FF921FB60000000, %136
  %138 = select i1 %124, float %137, float %136
  %139 = tail call float @llvm.copysign.f32(float %138, float %122)
  %140 = fmul contract float %139, 0x3FD5555560000000
  %141 = fcmp contract olt float %140, 0.000000e+00
  %142 = fadd contract float %140, 0x3FF0C15160000000
  %143 = select i1 %141, float %142, float %140
  %144 = fcmp olt float %96, 0x39F0000000000000
  %145 = select i1 %144, float 0x41F0000000000000, float 1.000000e+00
  %146 = fmul float %96, %145
  %147 = tail call float @llvm.sqrt.f32(float %146)
  %148 = bitcast float %147 to i32
  %149 = add nsw i32 %148, -1
  %150 = bitcast i32 %149 to float
  %151 = add nsw i32 %148, 1
  %152 = bitcast i32 %151 to float
  %153 = tail call i1 @llvm.amdgcn.class.f32(float %146, i32 608)
  %154 = select i1 %144, float 0x3EF0000000000000, float 1.000000e+00
  %155 = fneg float %152
  %156 = tail call float @llvm.fma.f32(float %155, float %147, float %146)
  %157 = fcmp ogt float %156, 0.000000e+00
  %158 = fneg float %150
  %159 = tail call float @llvm.fma.f32(float %158, float %147, float %146)
  %160 = fcmp ole float %159, 0.000000e+00
  %161 = select i1 %160, float %150, float %147
  %162 = select i1 %157, float %152, float %161
  %163 = fmul float %154, %162
  %164 = select i1 %153, float %146, float %163
  %165 = fmul contract float %164, 2.000000e+00
  %166 = tail call float @llvm.fabs.f32(float %143)
  %167 = fcmp olt float %166, 1.310720e+05
  br i1 %167, label %168, label %175

168:                                              ; preds = %13
  %169 = fmul float %166, 0x3FE45F3060000000
  %170 = tail call float @llvm.rint.f32(float %169)
  %171 = tail call float @llvm.fma.f32(float %170, float 0xBFF921FB40000000, float %166)
  %172 = tail call float @llvm.fma.f32(float %170, float 0xBE74442D00000000, float %171)
  %173 = tail call float @llvm.fma.f32(float %170, float 0xBCF8469880000000, float %172)
  %174 = fptosi float %170 to i32
  br label %281

175:                                              ; preds = %13
  %176 = bitcast float %166 to i32
  %177 = lshr i32 %176, 23
  %178 = and i32 %176, 8388607
  %179 = or i32 %178, 8388608
  %180 = zext i32 %179 to i64
  %181 = mul nuw nsw i64 %180, 4266746795
  %182 = trunc i64 %181 to i32
  %183 = lshr i64 %181, 32
  %184 = mul nuw nsw i64 %180, 1011060801
  %185 = add nuw nsw i64 %183, %184
  %186 = trunc i64 %185 to i32
  %187 = lshr i64 %185, 32
  %188 = mul nuw nsw i64 %180, 3680671129
  %189 = add nuw nsw i64 %187, %188
  %190 = trunc i64 %189 to i32
  %191 = lshr i64 %189, 32
  %192 = mul nuw nsw i64 %180, 4113882560
  %193 = add nuw nsw i64 %191, %192
  %194 = trunc i64 %193 to i32
  %195 = lshr i64 %193, 32
  %196 = mul nuw nsw i64 %180, 4230436817
  %197 = add nuw nsw i64 %195, %196
  %198 = trunc i64 %197 to i32
  %199 = lshr i64 %197, 32
  %200 = mul nuw nsw i64 %180, 1313084713
  %201 = add nuw nsw i64 %199, %200
  %202 = trunc i64 %201 to i32
  %203 = lshr i64 %201, 32
  %204 = mul nuw nsw i64 %180, 2734261102
  %205 = add nuw nsw i64 %203, %204
  %206 = trunc i64 %205 to i32
  %207 = lshr i64 %205, 32
  %208 = trunc i64 %207 to i32
  %209 = add nsw i32 %177, -120
  %210 = icmp ugt i32 %209, 63
  %211 = select i1 %210, i32 %202, i32 %208
  %212 = select i1 %210, i32 %198, i32 %206
  %213 = select i1 %210, i32 %194, i32 %202
  %214 = select i1 %210, i32 %190, i32 %198
  %215 = select i1 %210, i32 %186, i32 %194
  %216 = select i1 %210, i32 %182, i32 %190
  %217 = select i1 %210, i32 -64, i32 0
  %218 = add nsw i32 %217, %209
  %219 = icmp ugt i32 %218, 31
  %220 = select i1 %219, i32 %212, i32 %211
  %221 = select i1 %219, i32 %213, i32 %212
  %222 = select i1 %219, i32 %214, i32 %213
  %223 = select i1 %219, i32 %215, i32 %214
  %224 = select i1 %219, i32 %216, i32 %215
  %225 = select i1 %219, i32 -32, i32 0
  %226 = add nsw i32 %225, %218
  %227 = icmp ugt i32 %226, 31
  %228 = select i1 %227, i32 %221, i32 %220
  %229 = select i1 %227, i32 %222, i32 %221
  %230 = select i1 %227, i32 %223, i32 %222
  %231 = select i1 %227, i32 %224, i32 %223
  %232 = select i1 %227, i32 -32, i32 0
  %233 = add nsw i32 %232, %226
  %234 = icmp eq i32 %233, 0
  %235 = sub nsw i32 32, %233
  %236 = tail call i32 @llvm.fshr.i32(i32 %228, i32 %229, i32 %235)
  %237 = tail call i32 @llvm.fshr.i32(i32 %229, i32 %230, i32 %235)
  %238 = tail call i32 @llvm.fshr.i32(i32 %230, i32 %231, i32 %235)
  %239 = select i1 %234, i32 %228, i32 %236
  %240 = select i1 %234, i32 %229, i32 %237
  %241 = select i1 %234, i32 %230, i32 %238
  %242 = lshr i32 %239, 29
  %243 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %240, i32 2)
  %244 = tail call i32 @llvm.fshl.i32(i32 %240, i32 %241, i32 2)
  %245 = tail call i32 @llvm.fshl.i32(i32 %241, i32 %231, i32 2)
  %246 = and i32 %242, 1
  %247 = sub nsw i32 0, %246
  %248 = shl i32 %242, 31
  %249 = xor i32 %243, %247
  %250 = xor i32 %244, %247
  %251 = xor i32 %245, %247
  %252 = tail call i32 @llvm.ctlz.i32(i32 %249, i1 false), !range !11
  %253 = sub nsw i32 31, %252
  %254 = tail call i32 @llvm.fshr.i32(i32 %249, i32 %250, i32 %253)
  %255 = tail call i32 @llvm.fshr.i32(i32 %250, i32 %251, i32 %253)
  %256 = shl nuw nsw i32 %252, 23
  %257 = sub nuw nsw i32 1056964608, %256
  %258 = lshr i32 %254, 9
  %259 = or i32 %258, %257
  %260 = or i32 %259, %248
  %261 = bitcast i32 %260 to float
  %262 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %255, i32 23)
  %263 = tail call i32 @llvm.ctlz.i32(i32 %262, i1 false), !range !11
  %264 = fmul float %261, 0x3FF921FB40000000
  %265 = add nuw nsw i32 %263, %252
  %266 = shl nuw nsw i32 %265, 23
  %267 = sub nuw nsw i32 855638016, %266
  %268 = sub nsw i32 31, %263
  %269 = tail call i32 @llvm.fshr.i32(i32 %262, i32 %255, i32 %268)
  %270 = lshr i32 %269, 9
  %271 = or i32 %267, %270
  %272 = or i32 %271, %248
  %273 = bitcast i32 %272 to float
  %274 = fneg float %264
  %275 = tail call float @llvm.fma.f32(float %261, float 0x3FF921FB40000000, float %274)
  %276 = tail call float @llvm.fma.f32(float %261, float 0x3E74442D00000000, float %275)
  %277 = tail call float @llvm.fma.f32(float %273, float 0x3FF921FB40000000, float %276)
  %278 = fadd float %264, %277
  %279 = lshr i32 %239, 30
  %280 = add nuw nsw i32 %246, %279
  br label %281

281:                                              ; preds = %168, %175
  %282 = phi float [ %173, %168 ], [ %278, %175 ]
  %283 = phi i32 [ %174, %168 ], [ %280, %175 ]
  %284 = fmul float %282, %282
  %285 = tail call float @llvm.fmuladd.f32(float %284, float 0xBF29833040000000, float 0x3F81103880000000)
  %286 = tail call float @llvm.fmuladd.f32(float %284, float %285, float 0xBFC55553A0000000)
  %287 = fmul float %284, %286
  %288 = tail call float @llvm.fmuladd.f32(float %282, float %287, float %282)
  %289 = tail call float @llvm.fmuladd.f32(float %284, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %290 = tail call float @llvm.fmuladd.f32(float %284, float %289, float 0x3FA5557EE0000000)
  %291 = tail call float @llvm.fmuladd.f32(float %284, float %290, float 0xBFE0000080000000)
  %292 = tail call float @llvm.fmuladd.f32(float %284, float %291, float 1.000000e+00)
  %293 = fneg float %288
  %294 = and i32 %283, 1
  %295 = icmp eq i32 %294, 0
  %296 = select i1 %295, float %292, float %293
  %297 = bitcast float %296 to i32
  %298 = shl i32 %283, 30
  %299 = and i32 %298, -2147483648
  %300 = xor i32 %299, %297
  %301 = bitcast i32 %300 to float
  %302 = tail call i1 @llvm.amdgcn.class.f32(float %166, i32 504)
  %303 = select i1 %302, float %301, float 0x7FF8000000000000
  %304 = fmul contract float %165, %303
  %305 = fadd contract float %61, %304
  br i1 %167, label %306, label %313

306:                                              ; preds = %281
  %307 = fmul float %166, 0x3FE45F3060000000
  %308 = tail call float @llvm.rint.f32(float %307)
  %309 = tail call float @llvm.fma.f32(float %308, float 0xBFF921FB40000000, float %166)
  %310 = tail call float @llvm.fma.f32(float %308, float 0xBE74442D00000000, float %309)
  %311 = tail call float @llvm.fma.f32(float %308, float 0xBCF8469880000000, float %310)
  %312 = fptosi float %308 to i32
  br label %419

313:                                              ; preds = %281
  %314 = bitcast float %166 to i32
  %315 = lshr i32 %314, 23
  %316 = and i32 %314, 8388607
  %317 = or i32 %316, 8388608
  %318 = zext i32 %317 to i64
  %319 = mul nuw nsw i64 %318, 4266746795
  %320 = trunc i64 %319 to i32
  %321 = lshr i64 %319, 32
  %322 = mul nuw nsw i64 %318, 1011060801
  %323 = add nuw nsw i64 %321, %322
  %324 = trunc i64 %323 to i32
  %325 = lshr i64 %323, 32
  %326 = mul nuw nsw i64 %318, 3680671129
  %327 = add nuw nsw i64 %325, %326
  %328 = trunc i64 %327 to i32
  %329 = lshr i64 %327, 32
  %330 = mul nuw nsw i64 %318, 4113882560
  %331 = add nuw nsw i64 %329, %330
  %332 = trunc i64 %331 to i32
  %333 = lshr i64 %331, 32
  %334 = mul nuw nsw i64 %318, 4230436817
  %335 = add nuw nsw i64 %333, %334
  %336 = trunc i64 %335 to i32
  %337 = lshr i64 %335, 32
  %338 = mul nuw nsw i64 %318, 1313084713
  %339 = add nuw nsw i64 %337, %338
  %340 = trunc i64 %339 to i32
  %341 = lshr i64 %339, 32
  %342 = mul nuw nsw i64 %318, 2734261102
  %343 = add nuw nsw i64 %341, %342
  %344 = trunc i64 %343 to i32
  %345 = lshr i64 %343, 32
  %346 = trunc i64 %345 to i32
  %347 = add nsw i32 %315, -120
  %348 = icmp ugt i32 %347, 63
  %349 = select i1 %348, i32 %340, i32 %346
  %350 = select i1 %348, i32 %336, i32 %344
  %351 = select i1 %348, i32 %332, i32 %340
  %352 = select i1 %348, i32 %328, i32 %336
  %353 = select i1 %348, i32 %324, i32 %332
  %354 = select i1 %348, i32 %320, i32 %328
  %355 = select i1 %348, i32 -64, i32 0
  %356 = add nsw i32 %355, %347
  %357 = icmp ugt i32 %356, 31
  %358 = select i1 %357, i32 %350, i32 %349
  %359 = select i1 %357, i32 %351, i32 %350
  %360 = select i1 %357, i32 %352, i32 %351
  %361 = select i1 %357, i32 %353, i32 %352
  %362 = select i1 %357, i32 %354, i32 %353
  %363 = select i1 %357, i32 -32, i32 0
  %364 = add nsw i32 %363, %356
  %365 = icmp ugt i32 %364, 31
  %366 = select i1 %365, i32 %359, i32 %358
  %367 = select i1 %365, i32 %360, i32 %359
  %368 = select i1 %365, i32 %361, i32 %360
  %369 = select i1 %365, i32 %362, i32 %361
  %370 = select i1 %365, i32 -32, i32 0
  %371 = add nsw i32 %370, %364
  %372 = icmp eq i32 %371, 0
  %373 = sub nsw i32 32, %371
  %374 = tail call i32 @llvm.fshr.i32(i32 %366, i32 %367, i32 %373)
  %375 = tail call i32 @llvm.fshr.i32(i32 %367, i32 %368, i32 %373)
  %376 = tail call i32 @llvm.fshr.i32(i32 %368, i32 %369, i32 %373)
  %377 = select i1 %372, i32 %366, i32 %374
  %378 = select i1 %372, i32 %367, i32 %375
  %379 = select i1 %372, i32 %368, i32 %376
  %380 = lshr i32 %377, 29
  %381 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %378, i32 2)
  %382 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %379, i32 2)
  %383 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %369, i32 2)
  %384 = and i32 %380, 1
  %385 = sub nsw i32 0, %384
  %386 = shl i32 %380, 31
  %387 = xor i32 %381, %385
  %388 = xor i32 %382, %385
  %389 = xor i32 %383, %385
  %390 = tail call i32 @llvm.ctlz.i32(i32 %387, i1 false), !range !11
  %391 = sub nsw i32 31, %390
  %392 = tail call i32 @llvm.fshr.i32(i32 %387, i32 %388, i32 %391)
  %393 = tail call i32 @llvm.fshr.i32(i32 %388, i32 %389, i32 %391)
  %394 = shl nuw nsw i32 %390, 23
  %395 = sub nuw nsw i32 1056964608, %394
  %396 = lshr i32 %392, 9
  %397 = or i32 %396, %395
  %398 = or i32 %397, %386
  %399 = bitcast i32 %398 to float
  %400 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %393, i32 23)
  %401 = tail call i32 @llvm.ctlz.i32(i32 %400, i1 false), !range !11
  %402 = fmul float %399, 0x3FF921FB40000000
  %403 = add nuw nsw i32 %401, %390
  %404 = shl nuw nsw i32 %403, 23
  %405 = sub nuw nsw i32 855638016, %404
  %406 = sub nsw i32 31, %401
  %407 = tail call i32 @llvm.fshr.i32(i32 %400, i32 %393, i32 %406)
  %408 = lshr i32 %407, 9
  %409 = or i32 %405, %408
  %410 = or i32 %409, %386
  %411 = bitcast i32 %410 to float
  %412 = fneg float %402
  %413 = tail call float @llvm.fma.f32(float %399, float 0x3FF921FB40000000, float %412)
  %414 = tail call float @llvm.fma.f32(float %399, float 0x3E74442D00000000, float %413)
  %415 = tail call float @llvm.fma.f32(float %411, float 0x3FF921FB40000000, float %414)
  %416 = fadd float %402, %415
  %417 = lshr i32 %377, 30
  %418 = add nuw nsw i32 %384, %417
  br label %419

419:                                              ; preds = %306, %313
  %420 = phi float [ %311, %306 ], [ %416, %313 ]
  %421 = phi i32 [ %312, %306 ], [ %418, %313 ]
  %422 = fmul float %420, %420
  %423 = tail call float @llvm.fmuladd.f32(float %422, float 0xBF29833040000000, float 0x3F81103880000000)
  %424 = tail call float @llvm.fmuladd.f32(float %422, float %423, float 0xBFC55553A0000000)
  %425 = fmul float %422, %424
  %426 = tail call float @llvm.fmuladd.f32(float %420, float %425, float %420)
  %427 = tail call float @llvm.fmuladd.f32(float %422, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %428 = tail call float @llvm.fmuladd.f32(float %422, float %427, float 0x3FA5557EE0000000)
  %429 = tail call float @llvm.fmuladd.f32(float %422, float %428, float 0xBFE0000080000000)
  %430 = tail call float @llvm.fmuladd.f32(float %422, float %429, float 1.000000e+00)
  %431 = fneg float %426
  %432 = and i32 %421, 1
  %433 = icmp eq i32 %432, 0
  %434 = select i1 %433, float %430, float %431
  %435 = bitcast float %434 to i32
  %436 = shl i32 %421, 30
  %437 = and i32 %436, -2147483648
  %438 = xor i32 %437, %435
  %439 = bitcast i32 %438 to float
  br i1 %167, label %440, label %448

440:                                              ; preds = %419
  %441 = fmul float %166, 0x3FE45F3060000000
  %442 = tail call float @llvm.rint.f32(float %441)
  %443 = tail call float @llvm.fma.f32(float %442, float 0xBFF921FB40000000, float %166)
  %444 = tail call float @llvm.fma.f32(float %442, float 0xBE74442D00000000, float %443)
  %445 = tail call float @llvm.fma.f32(float %442, float 0xBCF8469880000000, float %444)
  %446 = fptosi float %442 to i32
  %447 = bitcast float %166 to i32
  br label %554

448:                                              ; preds = %419
  %449 = bitcast float %166 to i32
  %450 = lshr i32 %449, 23
  %451 = and i32 %449, 8388607
  %452 = or i32 %451, 8388608
  %453 = zext i32 %452 to i64
  %454 = mul nuw nsw i64 %453, 4266746795
  %455 = trunc i64 %454 to i32
  %456 = lshr i64 %454, 32
  %457 = mul nuw nsw i64 %453, 1011060801
  %458 = add nuw nsw i64 %456, %457
  %459 = trunc i64 %458 to i32
  %460 = lshr i64 %458, 32
  %461 = mul nuw nsw i64 %453, 3680671129
  %462 = add nuw nsw i64 %460, %461
  %463 = trunc i64 %462 to i32
  %464 = lshr i64 %462, 32
  %465 = mul nuw nsw i64 %453, 4113882560
  %466 = add nuw nsw i64 %464, %465
  %467 = trunc i64 %466 to i32
  %468 = lshr i64 %466, 32
  %469 = mul nuw nsw i64 %453, 4230436817
  %470 = add nuw nsw i64 %468, %469
  %471 = trunc i64 %470 to i32
  %472 = lshr i64 %470, 32
  %473 = mul nuw nsw i64 %453, 1313084713
  %474 = add nuw nsw i64 %472, %473
  %475 = trunc i64 %474 to i32
  %476 = lshr i64 %474, 32
  %477 = mul nuw nsw i64 %453, 2734261102
  %478 = add nuw nsw i64 %476, %477
  %479 = trunc i64 %478 to i32
  %480 = lshr i64 %478, 32
  %481 = trunc i64 %480 to i32
  %482 = add nsw i32 %450, -120
  %483 = icmp ugt i32 %482, 63
  %484 = select i1 %483, i32 %475, i32 %481
  %485 = select i1 %483, i32 %471, i32 %479
  %486 = select i1 %483, i32 %467, i32 %475
  %487 = select i1 %483, i32 %463, i32 %471
  %488 = select i1 %483, i32 %459, i32 %467
  %489 = select i1 %483, i32 %455, i32 %463
  %490 = select i1 %483, i32 -64, i32 0
  %491 = add nsw i32 %490, %482
  %492 = icmp ugt i32 %491, 31
  %493 = select i1 %492, i32 %485, i32 %484
  %494 = select i1 %492, i32 %486, i32 %485
  %495 = select i1 %492, i32 %487, i32 %486
  %496 = select i1 %492, i32 %488, i32 %487
  %497 = select i1 %492, i32 %489, i32 %488
  %498 = select i1 %492, i32 -32, i32 0
  %499 = add nsw i32 %498, %491
  %500 = icmp ugt i32 %499, 31
  %501 = select i1 %500, i32 %494, i32 %493
  %502 = select i1 %500, i32 %495, i32 %494
  %503 = select i1 %500, i32 %496, i32 %495
  %504 = select i1 %500, i32 %497, i32 %496
  %505 = select i1 %500, i32 -32, i32 0
  %506 = add nsw i32 %505, %499
  %507 = icmp eq i32 %506, 0
  %508 = sub nsw i32 32, %506
  %509 = tail call i32 @llvm.fshr.i32(i32 %501, i32 %502, i32 %508)
  %510 = tail call i32 @llvm.fshr.i32(i32 %502, i32 %503, i32 %508)
  %511 = tail call i32 @llvm.fshr.i32(i32 %503, i32 %504, i32 %508)
  %512 = select i1 %507, i32 %501, i32 %509
  %513 = select i1 %507, i32 %502, i32 %510
  %514 = select i1 %507, i32 %503, i32 %511
  %515 = lshr i32 %512, 29
  %516 = tail call i32 @llvm.fshl.i32(i32 %512, i32 %513, i32 2)
  %517 = tail call i32 @llvm.fshl.i32(i32 %513, i32 %514, i32 2)
  %518 = tail call i32 @llvm.fshl.i32(i32 %514, i32 %504, i32 2)
  %519 = and i32 %515, 1
  %520 = sub nsw i32 0, %519
  %521 = shl i32 %515, 31
  %522 = xor i32 %516, %520
  %523 = xor i32 %517, %520
  %524 = xor i32 %518, %520
  %525 = tail call i32 @llvm.ctlz.i32(i32 %522, i1 false), !range !11
  %526 = sub nsw i32 31, %525
  %527 = tail call i32 @llvm.fshr.i32(i32 %522, i32 %523, i32 %526)
  %528 = tail call i32 @llvm.fshr.i32(i32 %523, i32 %524, i32 %526)
  %529 = shl nuw nsw i32 %525, 23
  %530 = sub nuw nsw i32 1056964608, %529
  %531 = lshr i32 %527, 9
  %532 = or i32 %531, %530
  %533 = or i32 %532, %521
  %534 = bitcast i32 %533 to float
  %535 = tail call i32 @llvm.fshl.i32(i32 %527, i32 %528, i32 23)
  %536 = tail call i32 @llvm.ctlz.i32(i32 %535, i1 false), !range !11
  %537 = fmul float %534, 0x3FF921FB40000000
  %538 = add nuw nsw i32 %536, %525
  %539 = shl nuw nsw i32 %538, 23
  %540 = sub nuw nsw i32 855638016, %539
  %541 = sub nsw i32 31, %536
  %542 = tail call i32 @llvm.fshr.i32(i32 %535, i32 %528, i32 %541)
  %543 = lshr i32 %542, 9
  %544 = or i32 %540, %543
  %545 = or i32 %544, %521
  %546 = bitcast i32 %545 to float
  %547 = fneg float %537
  %548 = tail call float @llvm.fma.f32(float %534, float 0x3FF921FB40000000, float %547)
  %549 = tail call float @llvm.fma.f32(float %534, float 0x3E74442D00000000, float %548)
  %550 = tail call float @llvm.fma.f32(float %546, float 0x3FF921FB40000000, float %549)
  %551 = fadd float %537, %550
  %552 = lshr i32 %512, 30
  %553 = add nuw nsw i32 %519, %552
  br label %554

554:                                              ; preds = %440, %448
  %555 = phi i32 [ %447, %440 ], [ %449, %448 ]
  %556 = phi float [ %445, %440 ], [ %551, %448 ]
  %557 = phi i32 [ %446, %440 ], [ %553, %448 ]
  %558 = fmul float %556, %556
  %559 = tail call float @llvm.fmuladd.f32(float %558, float 0xBF29833040000000, float 0x3F81103880000000)
  %560 = tail call float @llvm.fmuladd.f32(float %558, float %559, float 0xBFC55553A0000000)
  %561 = fmul float %558, %560
  %562 = tail call float @llvm.fmuladd.f32(float %556, float %561, float %556)
  %563 = tail call float @llvm.fmuladd.f32(float %558, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %564 = tail call float @llvm.fmuladd.f32(float %558, float %563, float 0x3FA5557EE0000000)
  %565 = tail call float @llvm.fmuladd.f32(float %558, float %564, float 0xBFE0000080000000)
  %566 = tail call float @llvm.fmuladd.f32(float %558, float %565, float 1.000000e+00)
  %567 = and i32 %557, 1
  %568 = icmp eq i32 %567, 0
  %569 = select i1 %568, float %562, float %566
  %570 = bitcast float %569 to i32
  %571 = shl i32 %557, 30
  %572 = and i32 %571, -2147483648
  %573 = bitcast float %143 to i32
  %574 = xor i32 %555, %572
  %575 = xor i32 %574, %570
  %576 = xor i32 %575, %573
  %577 = bitcast i32 %576 to float
  %578 = fmul contract float %577, 0x3FFBB67AE0000000
  %579 = fadd contract float %578, %439
  %580 = select contract i1 %302, float %579, float 0x7FF8000000000000
  %581 = fmul contract float %164, %580
  %582 = fsub contract float %61, %581
  br i1 %167, label %583, label %610

583:                                              ; preds = %554
  %584 = fmul float %166, 0x3FE45F3060000000
  %585 = tail call float @llvm.rint.f32(float %584)
  %586 = tail call float @llvm.fma.f32(float %585, float 0xBFF921FB40000000, float %166)
  %587 = tail call float @llvm.fma.f32(float %585, float 0xBE74442D00000000, float %586)
  %588 = tail call float @llvm.fma.f32(float %585, float 0xBCF8469880000000, float %587)
  %589 = fptosi float %585 to i32
  %590 = fmul float %588, %588
  %591 = tail call float @llvm.fmuladd.f32(float %590, float 0xBF29833040000000, float 0x3F81103880000000)
  %592 = tail call float @llvm.fmuladd.f32(float %590, float %591, float 0xBFC55553A0000000)
  %593 = fmul float %590, %592
  %594 = tail call float @llvm.fmuladd.f32(float %588, float %593, float %588)
  %595 = tail call float @llvm.fmuladd.f32(float %590, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %596 = tail call float @llvm.fmuladd.f32(float %590, float %595, float 0x3FA5557EE0000000)
  %597 = tail call float @llvm.fmuladd.f32(float %590, float %596, float 0xBFE0000080000000)
  %598 = tail call float @llvm.fmuladd.f32(float %590, float %597, float 1.000000e+00)
  %599 = fneg float %594
  %600 = and i32 %589, 1
  %601 = icmp eq i32 %600, 0
  %602 = select i1 %601, float %598, float %599
  %603 = bitcast float %602 to i32
  %604 = shl i32 %589, 30
  %605 = and i32 %604, -2147483648
  %606 = xor i32 %605, %603
  %607 = bitcast i32 %606 to float
  %608 = select i1 %302, float %607, float 0x7FF8000000000000
  %609 = bitcast float %166 to i32
  br label %735

610:                                              ; preds = %554
  %611 = bitcast float %166 to i32
  %612 = lshr i32 %611, 23
  %613 = and i32 %611, 8388607
  %614 = or i32 %613, 8388608
  %615 = zext i32 %614 to i64
  %616 = mul nuw nsw i64 %615, 4266746795
  %617 = trunc i64 %616 to i32
  %618 = lshr i64 %616, 32
  %619 = mul nuw nsw i64 %615, 1011060801
  %620 = add nuw nsw i64 %618, %619
  %621 = trunc i64 %620 to i32
  %622 = lshr i64 %620, 32
  %623 = mul nuw nsw i64 %615, 3680671129
  %624 = add nuw nsw i64 %622, %623
  %625 = trunc i64 %624 to i32
  %626 = lshr i64 %624, 32
  %627 = mul nuw nsw i64 %615, 4113882560
  %628 = add nuw nsw i64 %626, %627
  %629 = trunc i64 %628 to i32
  %630 = lshr i64 %628, 32
  %631 = mul nuw nsw i64 %615, 4230436817
  %632 = add nuw nsw i64 %630, %631
  %633 = trunc i64 %632 to i32
  %634 = lshr i64 %632, 32
  %635 = mul nuw nsw i64 %615, 1313084713
  %636 = add nuw nsw i64 %634, %635
  %637 = trunc i64 %636 to i32
  %638 = lshr i64 %636, 32
  %639 = mul nuw nsw i64 %615, 2734261102
  %640 = add nuw nsw i64 %638, %639
  %641 = trunc i64 %640 to i32
  %642 = lshr i64 %640, 32
  %643 = trunc i64 %642 to i32
  %644 = add nsw i32 %612, -120
  %645 = icmp ugt i32 %644, 63
  %646 = select i1 %645, i32 %637, i32 %643
  %647 = select i1 %645, i32 %633, i32 %641
  %648 = select i1 %645, i32 %629, i32 %637
  %649 = select i1 %645, i32 %625, i32 %633
  %650 = select i1 %645, i32 %621, i32 %629
  %651 = select i1 %645, i32 %617, i32 %625
  %652 = select i1 %645, i32 -64, i32 0
  %653 = add nsw i32 %652, %644
  %654 = icmp ugt i32 %653, 31
  %655 = select i1 %654, i32 %647, i32 %646
  %656 = select i1 %654, i32 %648, i32 %647
  %657 = select i1 %654, i32 %649, i32 %648
  %658 = select i1 %654, i32 %650, i32 %649
  %659 = select i1 %654, i32 %651, i32 %650
  %660 = select i1 %654, i32 -32, i32 0
  %661 = add nsw i32 %660, %653
  %662 = icmp ugt i32 %661, 31
  %663 = select i1 %662, i32 %656, i32 %655
  %664 = select i1 %662, i32 %657, i32 %656
  %665 = select i1 %662, i32 %658, i32 %657
  %666 = select i1 %662, i32 %659, i32 %658
  %667 = select i1 %662, i32 -32, i32 0
  %668 = add nsw i32 %667, %661
  %669 = icmp eq i32 %668, 0
  %670 = sub nsw i32 32, %668
  %671 = tail call i32 @llvm.fshr.i32(i32 %663, i32 %664, i32 %670)
  %672 = tail call i32 @llvm.fshr.i32(i32 %664, i32 %665, i32 %670)
  %673 = tail call i32 @llvm.fshr.i32(i32 %665, i32 %666, i32 %670)
  %674 = select i1 %669, i32 %663, i32 %671
  %675 = select i1 %669, i32 %664, i32 %672
  %676 = select i1 %669, i32 %665, i32 %673
  %677 = lshr i32 %674, 29
  %678 = tail call i32 @llvm.fshl.i32(i32 %674, i32 %675, i32 2)
  %679 = tail call i32 @llvm.fshl.i32(i32 %675, i32 %676, i32 2)
  %680 = tail call i32 @llvm.fshl.i32(i32 %676, i32 %666, i32 2)
  %681 = and i32 %677, 1
  %682 = sub nsw i32 0, %681
  %683 = shl i32 %677, 31
  %684 = xor i32 %678, %682
  %685 = xor i32 %679, %682
  %686 = xor i32 %680, %682
  %687 = tail call i32 @llvm.ctlz.i32(i32 %684, i1 false), !range !11
  %688 = sub nsw i32 31, %687
  %689 = tail call i32 @llvm.fshr.i32(i32 %684, i32 %685, i32 %688)
  %690 = tail call i32 @llvm.fshr.i32(i32 %685, i32 %686, i32 %688)
  %691 = shl nuw nsw i32 %687, 23
  %692 = sub nuw nsw i32 1056964608, %691
  %693 = lshr i32 %689, 9
  %694 = or i32 %693, %692
  %695 = or i32 %694, %683
  %696 = bitcast i32 %695 to float
  %697 = tail call i32 @llvm.fshl.i32(i32 %689, i32 %690, i32 23)
  %698 = tail call i32 @llvm.ctlz.i32(i32 %697, i1 false), !range !11
  %699 = fmul float %696, 0x3FF921FB40000000
  %700 = add nuw nsw i32 %698, %687
  %701 = shl nuw nsw i32 %700, 23
  %702 = sub nuw nsw i32 855638016, %701
  %703 = sub nsw i32 31, %698
  %704 = tail call i32 @llvm.fshr.i32(i32 %697, i32 %690, i32 %703)
  %705 = lshr i32 %704, 9
  %706 = or i32 %702, %705
  %707 = or i32 %706, %683
  %708 = bitcast i32 %707 to float
  %709 = fneg float %699
  %710 = tail call float @llvm.fma.f32(float %696, float 0x3FF921FB40000000, float %709)
  %711 = tail call float @llvm.fma.f32(float %696, float 0x3E74442D00000000, float %710)
  %712 = tail call float @llvm.fma.f32(float %708, float 0x3FF921FB40000000, float %711)
  %713 = fadd float %699, %712
  %714 = lshr i32 %674, 30
  %715 = add nuw nsw i32 %681, %714
  %716 = fmul float %713, %713
  %717 = tail call float @llvm.fmuladd.f32(float %716, float 0xBF29833040000000, float 0x3F81103880000000)
  %718 = tail call float @llvm.fmuladd.f32(float %716, float %717, float 0xBFC55553A0000000)
  %719 = fmul float %716, %718
  %720 = tail call float @llvm.fmuladd.f32(float %713, float %719, float %713)
  %721 = tail call float @llvm.fmuladd.f32(float %716, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %722 = tail call float @llvm.fmuladd.f32(float %716, float %721, float 0x3FA5557EE0000000)
  %723 = tail call float @llvm.fmuladd.f32(float %716, float %722, float 0xBFE0000080000000)
  %724 = tail call float @llvm.fmuladd.f32(float %716, float %723, float 1.000000e+00)
  %725 = fneg float %720
  %726 = and i32 %715, 1
  %727 = icmp eq i32 %726, 0
  %728 = select i1 %727, float %724, float %725
  %729 = bitcast float %728 to i32
  %730 = shl i32 %715, 30
  %731 = and i32 %730, -2147483648
  %732 = xor i32 %731, %729
  %733 = bitcast i32 %732 to float
  %734 = select i1 %302, float %733, float 0x7FF8000000000000
  br label %735

735:                                              ; preds = %583, %610
  %736 = phi i32 [ %605, %583 ], [ %731, %610 ]
  %737 = phi i32 [ %600, %583 ], [ %726, %610 ]
  %738 = phi float [ %598, %583 ], [ %724, %610 ]
  %739 = phi float [ %594, %583 ], [ %720, %610 ]
  %740 = phi float [ %608, %583 ], [ %734, %610 ]
  %741 = phi i32 [ %609, %583 ], [ %611, %610 ]
  %742 = icmp eq i32 %737, 0
  %743 = select i1 %742, float %739, float %738
  %744 = bitcast float %743 to i32
  %745 = xor i32 %741, %736
  %746 = xor i32 %745, %744
  %747 = xor i32 %746, %573
  %748 = bitcast i32 %747 to float
  %749 = fmul contract float %748, 0x3FFBB67AE0000000
  %750 = select i1 %302, float %749, float 0x7FF8000000000000
  %751 = fsub contract float %740, %750
  %752 = fmul contract float %164, %751
  %753 = fsub contract float %61, %752
  %754 = fcmp contract ogt float %305, %582
  %755 = fcmp contract ogt float %305, %753
  %756 = and i1 %754, %755
  br i1 %756, label %757, label %761

757:                                              ; preds = %735
  %758 = fmul contract float %305, %9
  %759 = fmul contract float %758, %9
  %760 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %759, float addrspace(1)* %760, align 4, !tbaa !7
  br label %761

761:                                              ; preds = %757, %735
  %762 = fcmp contract ogt float %582, %305
  %763 = fcmp contract ogt float %582, %753
  %764 = and i1 %762, %763
  br i1 %764, label %765, label %769

765:                                              ; preds = %761
  %766 = fmul contract float %582, %9
  %767 = fmul contract float %766, %9
  %768 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %767, float addrspace(1)* %768, align 4, !tbaa !7
  br label %769

769:                                              ; preds = %765, %761
  %770 = fcmp contract ogt float %753, %582
  %771 = fcmp contract ogt float %753, %305
  %772 = and i1 %770, %771
  br i1 %772, label %776, label %773

773:                                              ; preds = %769
  %774 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %775 = load float, float addrspace(1)* %774, align 4, !tbaa !7
  br label %780

776:                                              ; preds = %769
  %777 = fmul contract float %753, %9
  %778 = fmul contract float %777, %9
  %779 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %778, float addrspace(1)* %779, align 4, !tbaa !7
  br label %780

780:                                              ; preds = %773, %776
  %781 = phi float [ %775, %773 ], [ %778, %776 ]
  %782 = fmul contract float %9, %9
  %783 = fdiv contract float %781, %782
  %784 = fsub contract float %44, %783
  %785 = fsub contract float %52, %783
  %786 = fmul contract float %48, %785
  %787 = fadd contract float %70, %786
  %788 = fmul contract float %784, %55
  %789 = fsub contract float %788, %76
  %790 = fmul contract float %785, %784
  %791 = fsub contract float %790, %73
  %792 = fmul contract float %787, %787
  %793 = fmul contract float %789, %789
  %794 = fadd contract float %792, %793
  %795 = fmul contract float %791, %791
  %796 = fadd contract float %795, %794
  %797 = fcmp olt float %796, 0x39F0000000000000
  %798 = select i1 %797, float 0x41F0000000000000, float 1.000000e+00
  %799 = fmul float %796, %798
  %800 = tail call float @llvm.sqrt.f32(float %799)
  %801 = bitcast float %800 to i32
  %802 = add nsw i32 %801, -1
  %803 = bitcast i32 %802 to float
  %804 = add nsw i32 %801, 1
  %805 = bitcast i32 %804 to float
  %806 = tail call i1 @llvm.amdgcn.class.f32(float %799, i32 608)
  %807 = select i1 %797, float 0x3EF0000000000000, float 1.000000e+00
  %808 = fneg float %805
  %809 = tail call float @llvm.fma.f32(float %808, float %800, float %799)
  %810 = fcmp ogt float %809, 0.000000e+00
  %811 = fneg float %803
  %812 = tail call float @llvm.fma.f32(float %811, float %800, float %799)
  %813 = fcmp ole float %812, 0.000000e+00
  %814 = select i1 %813, float %803, float %800
  %815 = select i1 %810, float %805, float %814
  %816 = fmul float %807, %815
  %817 = select i1 %806, float %799, float %816
  %818 = tail call float @llvm.fabs.f32(float %787)
  %819 = tail call float @llvm.fabs.f32(float %789)
  %820 = tail call float @llvm.minnum.f32(float %818, float %819)
  %821 = tail call float @llvm.maxnum.f32(float %818, float %819)
  %822 = fdiv float %820, %821, !fpmath !12
  %823 = fmul float %822, %822
  %824 = tail call float @llvm.fmuladd.f32(float %823, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %825 = tail call float @llvm.fmuladd.f32(float %823, float %824, float 0x3FA53F67E0000000)
  %826 = tail call float @llvm.fmuladd.f32(float %823, float %825, float 0xBFB2FA9AE0000000)
  %827 = tail call float @llvm.fmuladd.f32(float %823, float %826, float 0x3FBB263640000000)
  %828 = tail call float @llvm.fmuladd.f32(float %823, float %827, float 0xBFC22C1CC0000000)
  %829 = tail call float @llvm.fmuladd.f32(float %823, float %828, float 0x3FC99717E0000000)
  %830 = tail call float @llvm.fmuladd.f32(float %823, float %829, float 0xBFD5554C40000000)
  %831 = fmul float %823, %830
  %832 = tail call float @llvm.fmuladd.f32(float %822, float %831, float %822)
  %833 = fsub float 0x3FF921FB60000000, %832
  %834 = fcmp ogt float %819, %818
  %835 = select i1 %834, float %833, float %832
  %836 = fcmp olt float %787, 0.000000e+00
  %837 = fcmp contract ogt float %817, 0x3EB0C6F7A0000000
  br i1 %837, label %838, label %860

838:                                              ; preds = %780
  %839 = fdiv contract float %791, %817
  %840 = tail call float @llvm.fabs.f32(float %839)
  %841 = tail call float @llvm.fmuladd.f32(float %840, float -5.000000e-01, float 5.000000e-01)
  %842 = fmul float %839, %839
  %843 = fcmp ogt float %840, 5.000000e-01
  %844 = select i1 %843, float %841, float %842
  %845 = tail call float @llvm.fmuladd.f32(float %844, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %846 = tail call float @llvm.fmuladd.f32(float %844, float %845, float 0x3FA0698780000000)
  %847 = tail call float @llvm.fmuladd.f32(float %844, float %846, float 0x3FA6C83620000000)
  %848 = tail call float @llvm.fmuladd.f32(float %844, float %847, float 0x3FB3337900000000)
  %849 = tail call float @llvm.fmuladd.f32(float %844, float %848, float 0x3FC5555580000000)
  %850 = fmul float %844, %849
  %851 = tail call float @llvm.sqrt.f32(float %844)
  %852 = tail call float @llvm.fmuladd.f32(float %851, float %850, float %851)
  %853 = fmul float %852, 2.000000e+00
  %854 = fsub float 0x400921FB60000000, %853
  %855 = fcmp olt float %839, 0.000000e+00
  %856 = select i1 %855, float %854, float %853
  %857 = tail call float @llvm.fmuladd.f32(float %839, float %850, float %839)
  %858 = fsub float 0x3FF921FB60000000, %857
  %859 = select i1 %843, float %856, float %858
  br label %860

860:                                              ; preds = %838, %780
  %861 = phi float [ %859, %838 ], [ 0.000000e+00, %780 ]
  %862 = fcmp uno float %787, %789
  %863 = fcmp oeq float %819, 0x7FF0000000000000
  %864 = fcmp oeq float %818, 0x7FF0000000000000
  %865 = and i1 %863, %864
  %866 = select i1 %836, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %867 = fcmp oeq float %789, 0.000000e+00
  %868 = bitcast float %787 to i32
  %869 = icmp slt i32 %868, 0
  %870 = select i1 %869, float 0x400921FB60000000, float 0.000000e+00
  %871 = fsub float 0x400921FB60000000, %835
  %872 = select i1 %836, float %871, float %835
  %873 = select i1 %867, float %870, float %872
  %874 = select i1 %865, float %866, float %873
  %875 = select i1 %862, float 0x7FF8000000000000, float %874
  %876 = tail call float @llvm.copysign.f32(float %875, float %789)
  %877 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %876, float addrspace(1)* %877, align 4, !tbaa !7
  %878 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  store float %861, float addrspace(1)* %878, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = !{float 2.500000e+00}
