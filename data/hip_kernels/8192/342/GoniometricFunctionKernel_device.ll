; ModuleID = '../data/hip_kernels/8192/342/main.cu'
source_filename = "../data/hip_kernels/8192/342/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25GoniometricFunctionKernelPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %838

26:                                               ; preds = %4
  switch i32 %3, label %838 [
    i32 0, label %27
    i32 1, label %173
    i32 2, label %315
    i32 3, label %465
    i32 4, label %499
    i32 5, label %623
    i32 6, label %744
    i32 7, label %767
    i32 10, label %791
  ]

27:                                               ; preds = %26
  %28 = sext i32 %24 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = fcmp olt float %31, 1.310720e+05
  br i1 %32, label %33, label %41

33:                                               ; preds = %27
  %34 = fmul float %31, 0x3FE45F3060000000
  %35 = tail call float @llvm.rint.f32(float %34)
  %36 = tail call float @llvm.fma.f32(float %35, float 0xBFF921FB40000000, float %31)
  %37 = tail call float @llvm.fma.f32(float %35, float 0xBE74442D00000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %35, float 0xBCF8469880000000, float %37)
  %39 = fptosi float %35 to i32
  %40 = bitcast float %31 to i32
  br label %147

41:                                               ; preds = %27
  %42 = bitcast float %31 to i32
  %43 = lshr i32 %42, 23
  %44 = and i32 %42, 8388607
  %45 = or i32 %44, 8388608
  %46 = zext i32 %45 to i64
  %47 = mul nuw nsw i64 %46, 4266746795
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = mul nuw nsw i64 %46, 1011060801
  %51 = add nuw nsw i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %46, 3680671129
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %46, 4113882560
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %46, 4230436817
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %46, 1313084713
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %46, 2734261102
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = trunc i64 %73 to i32
  %75 = add nsw i32 %43, -120
  %76 = icmp ugt i32 %75, 63
  %77 = select i1 %76, i32 %68, i32 %74
  %78 = select i1 %76, i32 %64, i32 %72
  %79 = select i1 %76, i32 %60, i32 %68
  %80 = select i1 %76, i32 %56, i32 %64
  %81 = select i1 %76, i32 %52, i32 %60
  %82 = select i1 %76, i32 %48, i32 %56
  %83 = select i1 %76, i32 -64, i32 0
  %84 = add nsw i32 %83, %75
  %85 = icmp ugt i32 %84, 31
  %86 = select i1 %85, i32 %78, i32 %77
  %87 = select i1 %85, i32 %79, i32 %78
  %88 = select i1 %85, i32 %80, i32 %79
  %89 = select i1 %85, i32 %81, i32 %80
  %90 = select i1 %85, i32 %82, i32 %81
  %91 = select i1 %85, i32 -32, i32 0
  %92 = add nsw i32 %91, %84
  %93 = icmp ugt i32 %92, 31
  %94 = select i1 %93, i32 %87, i32 %86
  %95 = select i1 %93, i32 %88, i32 %87
  %96 = select i1 %93, i32 %89, i32 %88
  %97 = select i1 %93, i32 %90, i32 %89
  %98 = select i1 %93, i32 -32, i32 0
  %99 = add nsw i32 %98, %92
  %100 = icmp eq i32 %99, 0
  %101 = sub nsw i32 32, %99
  %102 = tail call i32 @llvm.fshr.i32(i32 %94, i32 %95, i32 %101)
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %101)
  %104 = tail call i32 @llvm.fshr.i32(i32 %96, i32 %97, i32 %101)
  %105 = select i1 %100, i32 %94, i32 %102
  %106 = select i1 %100, i32 %95, i32 %103
  %107 = select i1 %100, i32 %96, i32 %104
  %108 = lshr i32 %105, 29
  %109 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %106, i32 2)
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 2)
  %111 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %97, i32 2)
  %112 = and i32 %108, 1
  %113 = sub nsw i32 0, %112
  %114 = shl i32 %108, 31
  %115 = xor i32 %109, %113
  %116 = xor i32 %110, %113
  %117 = xor i32 %111, %113
  %118 = tail call i32 @llvm.ctlz.i32(i32 %115, i1 false), !range !20
  %119 = sub nsw i32 31, %118
  %120 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %116, i32 %119)
  %121 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %117, i32 %119)
  %122 = shl nuw nsw i32 %118, 23
  %123 = sub nuw nsw i32 1056964608, %122
  %124 = lshr i32 %120, 9
  %125 = or i32 %124, %123
  %126 = or i32 %125, %114
  %127 = bitcast i32 %126 to float
  %128 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %121, i32 23)
  %129 = tail call i32 @llvm.ctlz.i32(i32 %128, i1 false), !range !20
  %130 = fmul float %127, 0x3FF921FB40000000
  %131 = add nuw nsw i32 %129, %118
  %132 = shl nuw nsw i32 %131, 23
  %133 = sub nuw nsw i32 855638016, %132
  %134 = sub nsw i32 31, %129
  %135 = tail call i32 @llvm.fshr.i32(i32 %128, i32 %121, i32 %134)
  %136 = lshr i32 %135, 9
  %137 = or i32 %133, %136
  %138 = or i32 %137, %114
  %139 = bitcast i32 %138 to float
  %140 = fneg float %130
  %141 = tail call float @llvm.fma.f32(float %127, float 0x3FF921FB40000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %127, float 0x3E74442D00000000, float %141)
  %143 = tail call float @llvm.fma.f32(float %139, float 0x3FF921FB40000000, float %142)
  %144 = fadd float %130, %143
  %145 = lshr i32 %105, 30
  %146 = add nuw nsw i32 %112, %145
  br label %147

147:                                              ; preds = %33, %41
  %148 = phi i32 [ %40, %33 ], [ %42, %41 ]
  %149 = phi float [ %38, %33 ], [ %144, %41 ]
  %150 = phi i32 [ %39, %33 ], [ %146, %41 ]
  %151 = fmul float %149, %149
  %152 = tail call float @llvm.fmuladd.f32(float %151, float 0xBF29833040000000, float 0x3F81103880000000)
  %153 = tail call float @llvm.fmuladd.f32(float %151, float %152, float 0xBFC55553A0000000)
  %154 = fmul float %151, %153
  %155 = tail call float @llvm.fmuladd.f32(float %149, float %154, float %149)
  %156 = tail call float @llvm.fmuladd.f32(float %151, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %157 = tail call float @llvm.fmuladd.f32(float %151, float %156, float 0x3FA5557EE0000000)
  %158 = tail call float @llvm.fmuladd.f32(float %151, float %157, float 0xBFE0000080000000)
  %159 = tail call float @llvm.fmuladd.f32(float %151, float %158, float 1.000000e+00)
  %160 = and i32 %150, 1
  %161 = icmp eq i32 %160, 0
  %162 = select i1 %161, float %155, float %159
  %163 = bitcast float %162 to i32
  %164 = shl i32 %150, 30
  %165 = and i32 %164, -2147483648
  %166 = bitcast float %30 to i32
  %167 = xor i32 %148, %166
  %168 = xor i32 %167, %165
  %169 = xor i32 %168, %163
  %170 = bitcast i32 %169 to float
  %171 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 504)
  %172 = select i1 %171, float %170, float 0x7FF8000000000000
  br label %834

173:                                              ; preds = %26
  %174 = sext i32 %24 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !16, !amdgpu.noclobber !5
  %177 = tail call float @llvm.fabs.f32(float %176)
  %178 = fcmp olt float %177, 1.310720e+05
  br i1 %178, label %179, label %186

179:                                              ; preds = %173
  %180 = fmul float %177, 0x3FE45F3060000000
  %181 = tail call float @llvm.rint.f32(float %180)
  %182 = tail call float @llvm.fma.f32(float %181, float 0xBFF921FB40000000, float %177)
  %183 = tail call float @llvm.fma.f32(float %181, float 0xBE74442D00000000, float %182)
  %184 = tail call float @llvm.fma.f32(float %181, float 0xBCF8469880000000, float %183)
  %185 = fptosi float %181 to i32
  br label %292

186:                                              ; preds = %173
  %187 = bitcast float %177 to i32
  %188 = lshr i32 %187, 23
  %189 = and i32 %187, 8388607
  %190 = or i32 %189, 8388608
  %191 = zext i32 %190 to i64
  %192 = mul nuw nsw i64 %191, 4266746795
  %193 = trunc i64 %192 to i32
  %194 = lshr i64 %192, 32
  %195 = mul nuw nsw i64 %191, 1011060801
  %196 = add nuw nsw i64 %194, %195
  %197 = trunc i64 %196 to i32
  %198 = lshr i64 %196, 32
  %199 = mul nuw nsw i64 %191, 3680671129
  %200 = add nuw nsw i64 %198, %199
  %201 = trunc i64 %200 to i32
  %202 = lshr i64 %200, 32
  %203 = mul nuw nsw i64 %191, 4113882560
  %204 = add nuw nsw i64 %202, %203
  %205 = trunc i64 %204 to i32
  %206 = lshr i64 %204, 32
  %207 = mul nuw nsw i64 %191, 4230436817
  %208 = add nuw nsw i64 %206, %207
  %209 = trunc i64 %208 to i32
  %210 = lshr i64 %208, 32
  %211 = mul nuw nsw i64 %191, 1313084713
  %212 = add nuw nsw i64 %210, %211
  %213 = trunc i64 %212 to i32
  %214 = lshr i64 %212, 32
  %215 = mul nuw nsw i64 %191, 2734261102
  %216 = add nuw nsw i64 %214, %215
  %217 = trunc i64 %216 to i32
  %218 = lshr i64 %216, 32
  %219 = trunc i64 %218 to i32
  %220 = add nsw i32 %188, -120
  %221 = icmp ugt i32 %220, 63
  %222 = select i1 %221, i32 %213, i32 %219
  %223 = select i1 %221, i32 %209, i32 %217
  %224 = select i1 %221, i32 %205, i32 %213
  %225 = select i1 %221, i32 %201, i32 %209
  %226 = select i1 %221, i32 %197, i32 %205
  %227 = select i1 %221, i32 %193, i32 %201
  %228 = select i1 %221, i32 -64, i32 0
  %229 = add nsw i32 %228, %220
  %230 = icmp ugt i32 %229, 31
  %231 = select i1 %230, i32 %223, i32 %222
  %232 = select i1 %230, i32 %224, i32 %223
  %233 = select i1 %230, i32 %225, i32 %224
  %234 = select i1 %230, i32 %226, i32 %225
  %235 = select i1 %230, i32 %227, i32 %226
  %236 = select i1 %230, i32 -32, i32 0
  %237 = add nsw i32 %236, %229
  %238 = icmp ugt i32 %237, 31
  %239 = select i1 %238, i32 %232, i32 %231
  %240 = select i1 %238, i32 %233, i32 %232
  %241 = select i1 %238, i32 %234, i32 %233
  %242 = select i1 %238, i32 %235, i32 %234
  %243 = select i1 %238, i32 -32, i32 0
  %244 = add nsw i32 %243, %237
  %245 = icmp eq i32 %244, 0
  %246 = sub nsw i32 32, %244
  %247 = tail call i32 @llvm.fshr.i32(i32 %239, i32 %240, i32 %246)
  %248 = tail call i32 @llvm.fshr.i32(i32 %240, i32 %241, i32 %246)
  %249 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %246)
  %250 = select i1 %245, i32 %239, i32 %247
  %251 = select i1 %245, i32 %240, i32 %248
  %252 = select i1 %245, i32 %241, i32 %249
  %253 = lshr i32 %250, 29
  %254 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %251, i32 2)
  %255 = tail call i32 @llvm.fshl.i32(i32 %251, i32 %252, i32 2)
  %256 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %242, i32 2)
  %257 = and i32 %253, 1
  %258 = sub nsw i32 0, %257
  %259 = shl i32 %253, 31
  %260 = xor i32 %254, %258
  %261 = xor i32 %255, %258
  %262 = xor i32 %256, %258
  %263 = tail call i32 @llvm.ctlz.i32(i32 %260, i1 false), !range !20
  %264 = sub nsw i32 31, %263
  %265 = tail call i32 @llvm.fshr.i32(i32 %260, i32 %261, i32 %264)
  %266 = tail call i32 @llvm.fshr.i32(i32 %261, i32 %262, i32 %264)
  %267 = shl nuw nsw i32 %263, 23
  %268 = sub nuw nsw i32 1056964608, %267
  %269 = lshr i32 %265, 9
  %270 = or i32 %269, %268
  %271 = or i32 %270, %259
  %272 = bitcast i32 %271 to float
  %273 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %266, i32 23)
  %274 = tail call i32 @llvm.ctlz.i32(i32 %273, i1 false), !range !20
  %275 = fmul float %272, 0x3FF921FB40000000
  %276 = add nuw nsw i32 %274, %263
  %277 = shl nuw nsw i32 %276, 23
  %278 = sub nuw nsw i32 855638016, %277
  %279 = sub nsw i32 31, %274
  %280 = tail call i32 @llvm.fshr.i32(i32 %273, i32 %266, i32 %279)
  %281 = lshr i32 %280, 9
  %282 = or i32 %278, %281
  %283 = or i32 %282, %259
  %284 = bitcast i32 %283 to float
  %285 = fneg float %275
  %286 = tail call float @llvm.fma.f32(float %272, float 0x3FF921FB40000000, float %285)
  %287 = tail call float @llvm.fma.f32(float %272, float 0x3E74442D00000000, float %286)
  %288 = tail call float @llvm.fma.f32(float %284, float 0x3FF921FB40000000, float %287)
  %289 = fadd float %275, %288
  %290 = lshr i32 %250, 30
  %291 = add nuw nsw i32 %257, %290
  br label %292

292:                                              ; preds = %179, %186
  %293 = phi float [ %184, %179 ], [ %289, %186 ]
  %294 = phi i32 [ %185, %179 ], [ %291, %186 ]
  %295 = fmul float %293, %293
  %296 = tail call float @llvm.fmuladd.f32(float %295, float 0xBF29833040000000, float 0x3F81103880000000)
  %297 = tail call float @llvm.fmuladd.f32(float %295, float %296, float 0xBFC55553A0000000)
  %298 = fmul float %295, %297
  %299 = tail call float @llvm.fmuladd.f32(float %293, float %298, float %293)
  %300 = tail call float @llvm.fmuladd.f32(float %295, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %301 = tail call float @llvm.fmuladd.f32(float %295, float %300, float 0x3FA5557EE0000000)
  %302 = tail call float @llvm.fmuladd.f32(float %295, float %301, float 0xBFE0000080000000)
  %303 = tail call float @llvm.fmuladd.f32(float %295, float %302, float 1.000000e+00)
  %304 = fneg float %299
  %305 = and i32 %294, 1
  %306 = icmp eq i32 %305, 0
  %307 = select i1 %306, float %303, float %304
  %308 = bitcast float %307 to i32
  %309 = shl i32 %294, 30
  %310 = and i32 %309, -2147483648
  %311 = xor i32 %310, %308
  %312 = bitcast i32 %311 to float
  %313 = tail call i1 @llvm.amdgcn.class.f32(float %177, i32 504)
  %314 = select i1 %313, float %312, float 0x7FF8000000000000
  br label %834

315:                                              ; preds = %26
  %316 = sext i32 %24 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !16, !amdgpu.noclobber !5
  %319 = tail call float @llvm.fabs.f32(float %318)
  %320 = fcmp olt float %319, 1.310720e+05
  br i1 %320, label %321, label %329

321:                                              ; preds = %315
  %322 = fmul float %319, 0x3FE45F3060000000
  %323 = tail call float @llvm.rint.f32(float %322)
  %324 = tail call float @llvm.fma.f32(float %323, float 0xBFF921FB40000000, float %319)
  %325 = tail call float @llvm.fma.f32(float %323, float 0xBE74442D00000000, float %324)
  %326 = tail call float @llvm.fma.f32(float %323, float 0xBCF8469880000000, float %325)
  %327 = fptosi float %323 to i32
  %328 = bitcast float %319 to i32
  br label %435

329:                                              ; preds = %315
  %330 = bitcast float %319 to i32
  %331 = lshr i32 %330, 23
  %332 = and i32 %330, 8388607
  %333 = or i32 %332, 8388608
  %334 = zext i32 %333 to i64
  %335 = mul nuw nsw i64 %334, 4266746795
  %336 = trunc i64 %335 to i32
  %337 = lshr i64 %335, 32
  %338 = mul nuw nsw i64 %334, 1011060801
  %339 = add nuw nsw i64 %337, %338
  %340 = trunc i64 %339 to i32
  %341 = lshr i64 %339, 32
  %342 = mul nuw nsw i64 %334, 3680671129
  %343 = add nuw nsw i64 %341, %342
  %344 = trunc i64 %343 to i32
  %345 = lshr i64 %343, 32
  %346 = mul nuw nsw i64 %334, 4113882560
  %347 = add nuw nsw i64 %345, %346
  %348 = trunc i64 %347 to i32
  %349 = lshr i64 %347, 32
  %350 = mul nuw nsw i64 %334, 4230436817
  %351 = add nuw nsw i64 %349, %350
  %352 = trunc i64 %351 to i32
  %353 = lshr i64 %351, 32
  %354 = mul nuw nsw i64 %334, 1313084713
  %355 = add nuw nsw i64 %353, %354
  %356 = trunc i64 %355 to i32
  %357 = lshr i64 %355, 32
  %358 = mul nuw nsw i64 %334, 2734261102
  %359 = add nuw nsw i64 %357, %358
  %360 = trunc i64 %359 to i32
  %361 = lshr i64 %359, 32
  %362 = trunc i64 %361 to i32
  %363 = add nsw i32 %331, -120
  %364 = icmp ugt i32 %363, 63
  %365 = select i1 %364, i32 %356, i32 %362
  %366 = select i1 %364, i32 %352, i32 %360
  %367 = select i1 %364, i32 %348, i32 %356
  %368 = select i1 %364, i32 %344, i32 %352
  %369 = select i1 %364, i32 %340, i32 %348
  %370 = select i1 %364, i32 %336, i32 %344
  %371 = select i1 %364, i32 -64, i32 0
  %372 = add nsw i32 %371, %363
  %373 = icmp ugt i32 %372, 31
  %374 = select i1 %373, i32 %366, i32 %365
  %375 = select i1 %373, i32 %367, i32 %366
  %376 = select i1 %373, i32 %368, i32 %367
  %377 = select i1 %373, i32 %369, i32 %368
  %378 = select i1 %373, i32 %370, i32 %369
  %379 = select i1 %373, i32 -32, i32 0
  %380 = add nsw i32 %379, %372
  %381 = icmp ugt i32 %380, 31
  %382 = select i1 %381, i32 %375, i32 %374
  %383 = select i1 %381, i32 %376, i32 %375
  %384 = select i1 %381, i32 %377, i32 %376
  %385 = select i1 %381, i32 %378, i32 %377
  %386 = select i1 %381, i32 -32, i32 0
  %387 = add nsw i32 %386, %380
  %388 = icmp eq i32 %387, 0
  %389 = sub nsw i32 32, %387
  %390 = tail call i32 @llvm.fshr.i32(i32 %382, i32 %383, i32 %389)
  %391 = tail call i32 @llvm.fshr.i32(i32 %383, i32 %384, i32 %389)
  %392 = tail call i32 @llvm.fshr.i32(i32 %384, i32 %385, i32 %389)
  %393 = select i1 %388, i32 %382, i32 %390
  %394 = select i1 %388, i32 %383, i32 %391
  %395 = select i1 %388, i32 %384, i32 %392
  %396 = lshr i32 %393, 29
  %397 = tail call i32 @llvm.fshl.i32(i32 %393, i32 %394, i32 2)
  %398 = tail call i32 @llvm.fshl.i32(i32 %394, i32 %395, i32 2)
  %399 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %385, i32 2)
  %400 = and i32 %396, 1
  %401 = sub nsw i32 0, %400
  %402 = shl i32 %396, 31
  %403 = xor i32 %397, %401
  %404 = xor i32 %398, %401
  %405 = xor i32 %399, %401
  %406 = tail call i32 @llvm.ctlz.i32(i32 %403, i1 false), !range !20
  %407 = sub nsw i32 31, %406
  %408 = tail call i32 @llvm.fshr.i32(i32 %403, i32 %404, i32 %407)
  %409 = tail call i32 @llvm.fshr.i32(i32 %404, i32 %405, i32 %407)
  %410 = shl nuw nsw i32 %406, 23
  %411 = sub nuw nsw i32 1056964608, %410
  %412 = lshr i32 %408, 9
  %413 = or i32 %412, %411
  %414 = or i32 %413, %402
  %415 = bitcast i32 %414 to float
  %416 = tail call i32 @llvm.fshl.i32(i32 %408, i32 %409, i32 23)
  %417 = tail call i32 @llvm.ctlz.i32(i32 %416, i1 false), !range !20
  %418 = fmul float %415, 0x3FF921FB40000000
  %419 = add nuw nsw i32 %417, %406
  %420 = shl nuw nsw i32 %419, 23
  %421 = sub nuw nsw i32 855638016, %420
  %422 = sub nsw i32 31, %417
  %423 = tail call i32 @llvm.fshr.i32(i32 %416, i32 %409, i32 %422)
  %424 = lshr i32 %423, 9
  %425 = or i32 %421, %424
  %426 = or i32 %425, %402
  %427 = bitcast i32 %426 to float
  %428 = fneg float %418
  %429 = tail call float @llvm.fma.f32(float %415, float 0x3FF921FB40000000, float %428)
  %430 = tail call float @llvm.fma.f32(float %415, float 0x3E74442D00000000, float %429)
  %431 = tail call float @llvm.fma.f32(float %427, float 0x3FF921FB40000000, float %430)
  %432 = fadd float %418, %431
  %433 = lshr i32 %393, 30
  %434 = add nuw nsw i32 %400, %433
  br label %435

435:                                              ; preds = %321, %329
  %436 = phi i32 [ %328, %321 ], [ %330, %329 ]
  %437 = phi float [ %326, %321 ], [ %432, %329 ]
  %438 = phi i32 [ %327, %321 ], [ %434, %329 ]
  %439 = and i32 %438, 1
  %440 = fmul float %437, %437
  %441 = tail call float @llvm.fmuladd.f32(float %440, float 0xBF919DBA60000000, float 0x3FD8A8B0E0000000)
  %442 = tail call float @llvm.fmuladd.f32(float %440, float 0x3F92E29000000000, float 0xBFE07266E0000000)
  %443 = tail call float @llvm.fmuladd.f32(float %440, float %442, float 0x3FF27E84A0000000)
  %444 = tail call float @llvm.amdgcn.rcp.f32(float %443)
  %445 = fmul float %441, %444
  %446 = fmul float %440, %445
  %447 = tail call float @llvm.fma.f32(float %446, float %437, float %437)
  %448 = fsub float %447, %437
  %449 = fneg float %448
  %450 = tail call float @llvm.fma.f32(float %446, float %437, float %449)
  %451 = tail call float @llvm.amdgcn.rcp.f32(float %447)
  %452 = fneg float %451
  %453 = tail call float @llvm.fma.f32(float %447, float %452, float 1.000000e+00)
  %454 = tail call float @llvm.fma.f32(float %450, float %452, float %453)
  %455 = tail call float @llvm.fma.f32(float %454, float %452, float %452)
  %456 = icmp eq i32 %439, 0
  %457 = select i1 %456, float %447, float %455
  %458 = bitcast float %457 to i32
  %459 = bitcast float %318 to i32
  %460 = xor i32 %436, %459
  %461 = xor i32 %460, %458
  %462 = bitcast i32 %461 to float
  %463 = tail call i1 @llvm.amdgcn.class.f32(float %319, i32 504)
  %464 = select i1 %463, float %462, float 0x7FF8000000000000
  br label %834

465:                                              ; preds = %26
  %466 = sext i32 %24 to i64
  %467 = getelementptr inbounds float, float addrspace(1)* %0, i64 %466
  %468 = load float, float addrspace(1)* %467, align 4, !tbaa !16, !amdgpu.noclobber !5
  %469 = tail call float @llvm.fabs.f32(float %468)
  %470 = fcmp olt float %469, 6.250000e-01
  br i1 %470, label %471, label %479

471:                                              ; preds = %465
  %472 = fmul float %468, %468
  %473 = tail call float @llvm.fmuladd.f32(float %472, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %474 = tail call float @llvm.fmuladd.f32(float %472, float %473, float 0xBFAB8389C0000000)
  %475 = tail call float @llvm.fmuladd.f32(float %472, float %474, float 0x3FC1107040000000)
  %476 = tail call float @llvm.fmuladd.f32(float %472, float %475, float 0xBFD5555320000000)
  %477 = fmul float %469, %476
  %478 = tail call float @llvm.fmuladd.f32(float %472, float %477, float %469)
  br label %496

479:                                              ; preds = %465
  %480 = fmul float %469, 2.000000e+00
  %481 = fmul float %480, 0x3FF7154760000000
  %482 = tail call float @llvm.rint.f32(float %481)
  %483 = fcmp ogt float %480, 0x40562E4300000000
  %484 = fneg float %481
  %485 = tail call float @llvm.fma.f32(float %480, float 0x3FF7154760000000, float %484)
  %486 = tail call float @llvm.fma.f32(float %480, float 0x3E54AE0BE0000000, float %485)
  %487 = fsub float %481, %482
  %488 = fadd float %486, %487
  %489 = tail call float @llvm.exp2.f32(float %488)
  %490 = fptosi float %482 to i32
  %491 = tail call float @llvm.amdgcn.ldexp.f32(float %489, i32 %490)
  %492 = fadd float %491, 1.000000e+00
  %493 = select i1 %483, float 0x7FF0000000000000, float %492
  %494 = tail call float @llvm.amdgcn.rcp.f32(float %493)
  %495 = tail call float @llvm.fmuladd.f32(float %494, float -2.000000e+00, float 1.000000e+00)
  br label %496

496:                                              ; preds = %471, %479
  %497 = phi float [ %478, %471 ], [ %495, %479 ]
  %498 = tail call float @llvm.copysign.f32(float %497, float %468)
  br label %834

499:                                              ; preds = %26
  %500 = sext i32 %24 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %0, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !16, !amdgpu.noclobber !5
  %503 = tail call float @llvm.fabs.f32(float %502)
  %504 = fadd float %503, 0xBFE62E4300000000
  %505 = fsub float %504, %503
  %506 = fsub float %505, %504
  %507 = fadd float %503, %506
  %508 = fadd float %505, 0x3FE62E4300000000
  %509 = fsub float %507, %508
  %510 = fadd float %509, 0x3E205C6100000000
  %511 = fadd float %504, %510
  %512 = fsub float %511, %504
  %513 = fsub float %510, %512
  %514 = fmul float %511, 0x3FF7154760000000
  %515 = tail call float @llvm.rint.f32(float %514)
  %516 = tail call float @llvm.fmuladd.f32(float %515, float 0xBFE62E4000000000, float %511)
  %517 = fadd float %513, %516
  %518 = fsub float %517, %516
  %519 = fsub float %513, %518
  %520 = fmul float %515, 0x3EB7F78000000000
  %521 = fsub float %517, %520
  %522 = fsub float %517, %521
  %523 = fsub float %522, %520
  %524 = fadd float %519, %523
  %525 = fadd float %521, %524
  %526 = fsub float %525, %521
  %527 = fsub float %524, %526
  %528 = fmul float %515, 0x3DD473DE60000000
  %529 = fsub float %525, %528
  %530 = fsub float %525, %529
  %531 = fsub float %530, %528
  %532 = fadd float %527, %531
  %533 = fadd float %529, %532
  %534 = fsub float %533, %529
  %535 = fsub float %532, %534
  %536 = tail call float @llvm.fmuladd.f32(float %533, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %537 = tail call float @llvm.fmuladd.f32(float %533, float %536, float 0x3FA555B980000000)
  %538 = tail call float @llvm.fmuladd.f32(float %533, float %537, float 0x3FC55548E0000000)
  %539 = tail call float @llvm.fmuladd.f32(float %533, float %538, float 0x3FDFFFFF80000000)
  %540 = fmul float %533, %533
  %541 = fneg float %540
  %542 = tail call float @llvm.fma.f32(float %533, float %533, float %541)
  %543 = fmul float %535, 2.000000e+00
  %544 = tail call float @llvm.fma.f32(float %533, float %543, float %542)
  %545 = fadd float %540, %544
  %546 = fsub float %545, %540
  %547 = fsub float %544, %546
  %548 = fmul float %539, %545
  %549 = fneg float %548
  %550 = tail call float @llvm.fma.f32(float %545, float %539, float %549)
  %551 = tail call float @llvm.fma.f32(float %547, float %539, float %550)
  %552 = fadd float %548, %551
  %553 = fsub float %552, %548
  %554 = fsub float %551, %553
  %555 = fadd float %533, %552
  %556 = fsub float %555, %533
  %557 = fsub float %552, %556
  %558 = fadd float %535, %554
  %559 = fadd float %558, %557
  %560 = fadd float %555, %559
  %561 = fsub float %560, %555
  %562 = fsub float %559, %561
  %563 = fadd float %560, 1.000000e+00
  %564 = fadd float %563, -1.000000e+00
  %565 = fsub float %560, %564
  %566 = fadd float %562, %565
  %567 = fadd float %563, %566
  %568 = fsub float %567, %563
  %569 = fsub float %566, %568
  %570 = fptosi float %515 to i32
  %571 = tail call float @llvm.amdgcn.ldexp.f32(float %567, i32 %570)
  %572 = tail call float @llvm.amdgcn.ldexp.f32(float %569, i32 %570)
  %573 = tail call float @llvm.amdgcn.rcp.f32(float %571)
  %574 = fmul float %571, %573
  %575 = fneg float %574
  %576 = tail call float @llvm.fma.f32(float %573, float %571, float %575)
  %577 = tail call float @llvm.fma.f32(float %573, float %572, float %576)
  %578 = fadd float %574, %577
  %579 = fsub float %578, %574
  %580 = fsub float %577, %579
  %581 = fsub float 1.000000e+00, %578
  %582 = fsub float 1.000000e+00, %581
  %583 = fsub float %582, %578
  %584 = fsub float %583, %580
  %585 = fadd float %581, %584
  %586 = fmul float %573, %585
  %587 = fmul float %571, %586
  %588 = fneg float %587
  %589 = tail call float @llvm.fma.f32(float %586, float %571, float %588)
  %590 = tail call float @llvm.fma.f32(float %586, float %572, float %589)
  %591 = fsub float %585, %581
  %592 = fsub float %584, %591
  %593 = fadd float %587, %590
  %594 = fsub float %593, %587
  %595 = fsub float %590, %594
  %596 = fsub float %585, %593
  %597 = fsub float %585, %596
  %598 = fsub float %597, %593
  %599 = fadd float %592, %598
  %600 = fsub float %599, %595
  %601 = fadd float %596, %600
  %602 = fmul float %573, %601
  %603 = fadd float %573, %586
  %604 = fsub float %603, %573
  %605 = fsub float %586, %604
  %606 = fadd float %605, %602
  %607 = fadd float %603, %606
  %608 = fsub float %607, %603
  %609 = fsub float %606, %608
  %610 = tail call float @llvm.amdgcn.ldexp.f32(float %607, i32 -2)
  %611 = tail call float @llvm.amdgcn.ldexp.f32(float %609, i32 -2)
  %612 = fsub float %571, %610
  %613 = fsub float %571, %612
  %614 = fsub float %613, %610
  %615 = fadd float %572, %614
  %616 = fsub float %615, %611
  %617 = fadd float %612, %616
  %618 = fcmp ogt float %503, 0x40565A9F80000000
  %619 = select i1 %618, float 0x7FF0000000000000, float %617
  %620 = fcmp olt float %503, 0x3F30000000000000
  %621 = select i1 %620, float %503, float %619
  %622 = tail call float @llvm.copysign.f32(float %621, float %502)
  br label %834

623:                                              ; preds = %26
  %624 = sext i32 %24 to i64
  %625 = getelementptr inbounds float, float addrspace(1)* %0, i64 %624
  %626 = load float, float addrspace(1)* %625, align 4, !tbaa !16, !amdgpu.noclobber !5
  %627 = tail call float @llvm.fabs.f32(float %626)
  %628 = fadd float %627, 0xBFE62E4300000000
  %629 = fsub float %628, %627
  %630 = fsub float %629, %628
  %631 = fadd float %627, %630
  %632 = fadd float %629, 0x3FE62E4300000000
  %633 = fsub float %631, %632
  %634 = fadd float %633, 0x3E205C6100000000
  %635 = fadd float %628, %634
  %636 = fsub float %635, %628
  %637 = fsub float %634, %636
  %638 = fmul float %635, 0x3FF7154760000000
  %639 = tail call float @llvm.rint.f32(float %638)
  %640 = tail call float @llvm.fmuladd.f32(float %639, float 0xBFE62E4000000000, float %635)
  %641 = fadd float %637, %640
  %642 = fsub float %641, %640
  %643 = fsub float %637, %642
  %644 = fmul float %639, 0x3EB7F78000000000
  %645 = fsub float %641, %644
  %646 = fsub float %641, %645
  %647 = fsub float %646, %644
  %648 = fadd float %643, %647
  %649 = fadd float %645, %648
  %650 = fsub float %649, %645
  %651 = fsub float %648, %650
  %652 = fmul float %639, 0x3DD473DE60000000
  %653 = fsub float %649, %652
  %654 = fsub float %649, %653
  %655 = fsub float %654, %652
  %656 = fadd float %651, %655
  %657 = fadd float %653, %656
  %658 = fsub float %657, %653
  %659 = fsub float %656, %658
  %660 = tail call float @llvm.fmuladd.f32(float %657, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %661 = tail call float @llvm.fmuladd.f32(float %657, float %660, float 0x3FA555B980000000)
  %662 = tail call float @llvm.fmuladd.f32(float %657, float %661, float 0x3FC55548E0000000)
  %663 = tail call float @llvm.fmuladd.f32(float %657, float %662, float 0x3FDFFFFF80000000)
  %664 = fmul float %657, %657
  %665 = fneg float %664
  %666 = tail call float @llvm.fma.f32(float %657, float %657, float %665)
  %667 = fmul float %659, 2.000000e+00
  %668 = tail call float @llvm.fma.f32(float %657, float %667, float %666)
  %669 = fadd float %664, %668
  %670 = fsub float %669, %664
  %671 = fsub float %668, %670
  %672 = fmul float %663, %669
  %673 = fneg float %672
  %674 = tail call float @llvm.fma.f32(float %669, float %663, float %673)
  %675 = tail call float @llvm.fma.f32(float %671, float %663, float %674)
  %676 = fadd float %672, %675
  %677 = fsub float %676, %672
  %678 = fsub float %675, %677
  %679 = fadd float %657, %676
  %680 = fsub float %679, %657
  %681 = fsub float %676, %680
  %682 = fadd float %659, %678
  %683 = fadd float %682, %681
  %684 = fadd float %679, %683
  %685 = fsub float %684, %679
  %686 = fsub float %683, %685
  %687 = fadd float %684, 1.000000e+00
  %688 = fadd float %687, -1.000000e+00
  %689 = fsub float %684, %688
  %690 = fadd float %686, %689
  %691 = fadd float %687, %690
  %692 = fsub float %691, %687
  %693 = fsub float %690, %692
  %694 = fptosi float %639 to i32
  %695 = tail call float @llvm.amdgcn.ldexp.f32(float %691, i32 %694)
  %696 = tail call float @llvm.amdgcn.ldexp.f32(float %693, i32 %694)
  %697 = tail call float @llvm.amdgcn.rcp.f32(float %695)
  %698 = fmul float %695, %697
  %699 = fneg float %698
  %700 = tail call float @llvm.fma.f32(float %697, float %695, float %699)
  %701 = tail call float @llvm.fma.f32(float %697, float %696, float %700)
  %702 = fadd float %698, %701
  %703 = fsub float %702, %698
  %704 = fsub float %701, %703
  %705 = fsub float 1.000000e+00, %702
  %706 = fsub float 1.000000e+00, %705
  %707 = fsub float %706, %702
  %708 = fsub float %707, %704
  %709 = fadd float %705, %708
  %710 = fmul float %697, %709
  %711 = fmul float %695, %710
  %712 = fneg float %711
  %713 = tail call float @llvm.fma.f32(float %710, float %695, float %712)
  %714 = tail call float @llvm.fma.f32(float %710, float %696, float %713)
  %715 = fsub float %709, %705
  %716 = fsub float %708, %715
  %717 = fadd float %711, %714
  %718 = fsub float %717, %711
  %719 = fsub float %714, %718
  %720 = fsub float %709, %717
  %721 = fsub float %709, %720
  %722 = fsub float %721, %717
  %723 = fadd float %716, %722
  %724 = fsub float %723, %719
  %725 = fadd float %720, %724
  %726 = fmul float %697, %725
  %727 = fadd float %697, %710
  %728 = fsub float %727, %697
  %729 = fsub float %710, %728
  %730 = fadd float %729, %726
  %731 = fadd float %727, %730
  %732 = fsub float %731, %727
  %733 = fsub float %730, %732
  %734 = tail call float @llvm.amdgcn.ldexp.f32(float %731, i32 -2)
  %735 = tail call float @llvm.amdgcn.ldexp.f32(float %733, i32 -2)
  %736 = fadd float %695, %734
  %737 = fsub float %736, %695
  %738 = fsub float %734, %737
  %739 = fadd float %696, %735
  %740 = fadd float %739, %738
  %741 = fadd float %736, %740
  %742 = fcmp ogt float %627, 0x40565A9F80000000
  %743 = select i1 %742, float 0x7FF0000000000000, float %741
  br label %834

744:                                              ; preds = %26
  %745 = sext i32 %24 to i64
  %746 = getelementptr inbounds float, float addrspace(1)* %0, i64 %745
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !16, !amdgpu.noclobber !5
  %748 = tail call float @llvm.fabs.f32(float %747)
  %749 = tail call float @llvm.fmuladd.f32(float %748, float -5.000000e-01, float 5.000000e-01)
  %750 = fmul float %747, %747
  %751 = fcmp oge float %748, 5.000000e-01
  %752 = select i1 %751, float %749, float %750
  %753 = tail call float @llvm.fmuladd.f32(float %752, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %754 = tail call float @llvm.fmuladd.f32(float %752, float %753, float 0x3FA0698780000000)
  %755 = tail call float @llvm.fmuladd.f32(float %752, float %754, float 0x3FA6C83620000000)
  %756 = tail call float @llvm.fmuladd.f32(float %752, float %755, float 0x3FB3337900000000)
  %757 = tail call float @llvm.fmuladd.f32(float %752, float %756, float 0x3FC5555580000000)
  %758 = fmul float %752, %757
  %759 = tail call float @llvm.sqrt.f32(float %752)
  %760 = tail call float @llvm.fmuladd.f32(float %759, float %758, float %759)
  %761 = fmul float %760, 2.000000e+00
  %762 = fsub float 0x3FF921FB60000000, %761
  %763 = tail call float @llvm.fmuladd.f32(float %748, float %758, float %748)
  %764 = fcmp olt float %748, 5.000000e-01
  %765 = select i1 %764, float %763, float %762
  %766 = tail call float @llvm.copysign.f32(float %765, float %747)
  br label %834

767:                                              ; preds = %26
  %768 = sext i32 %24 to i64
  %769 = getelementptr inbounds float, float addrspace(1)* %0, i64 %768
  %770 = load float, float addrspace(1)* %769, align 4, !tbaa !16, !amdgpu.noclobber !5
  %771 = tail call float @llvm.fabs.f32(float %770)
  %772 = tail call float @llvm.fmuladd.f32(float %771, float -5.000000e-01, float 5.000000e-01)
  %773 = fmul float %770, %770
  %774 = fcmp ogt float %771, 5.000000e-01
  %775 = select i1 %774, float %772, float %773
  %776 = tail call float @llvm.fmuladd.f32(float %775, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %777 = tail call float @llvm.fmuladd.f32(float %775, float %776, float 0x3FA0698780000000)
  %778 = tail call float @llvm.fmuladd.f32(float %775, float %777, float 0x3FA6C83620000000)
  %779 = tail call float @llvm.fmuladd.f32(float %775, float %778, float 0x3FB3337900000000)
  %780 = tail call float @llvm.fmuladd.f32(float %775, float %779, float 0x3FC5555580000000)
  %781 = fmul float %775, %780
  %782 = tail call float @llvm.sqrt.f32(float %775)
  %783 = tail call float @llvm.fmuladd.f32(float %782, float %781, float %782)
  %784 = fmul float %783, 2.000000e+00
  %785 = fsub float 0x400921FB60000000, %784
  %786 = fcmp olt float %770, 0.000000e+00
  %787 = select i1 %786, float %785, float %784
  %788 = tail call float @llvm.fmuladd.f32(float %770, float %781, float %770)
  %789 = fsub float 0x3FF921FB60000000, %788
  %790 = select i1 %774, float %787, float %789
  br label %834

791:                                              ; preds = %26
  %792 = shl nsw i32 %24, 1
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds float, float addrspace(1)* %0, i64 %793
  %795 = bitcast float addrspace(1)* %794 to <2 x float> addrspace(1)*
  %796 = load <2 x float>, <2 x float> addrspace(1)* %795, align 4, !tbaa !16
  %797 = extractelement <2 x float> %796, i64 1
  %798 = tail call float @llvm.fabs.f32(float %797)
  %799 = extractelement <2 x float> %796, i64 0
  %800 = tail call float @llvm.fabs.f32(float %799)
  %801 = tail call float @llvm.minnum.f32(float %798, float %800)
  %802 = tail call float @llvm.maxnum.f32(float %798, float %800)
  %803 = fdiv float %801, %802, !fpmath !21
  %804 = fmul float %803, %803
  %805 = tail call float @llvm.fmuladd.f32(float %804, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %806 = tail call float @llvm.fmuladd.f32(float %804, float %805, float 0x3FA53F67E0000000)
  %807 = tail call float @llvm.fmuladd.f32(float %804, float %806, float 0xBFB2FA9AE0000000)
  %808 = tail call float @llvm.fmuladd.f32(float %804, float %807, float 0x3FBB263640000000)
  %809 = tail call float @llvm.fmuladd.f32(float %804, float %808, float 0xBFC22C1CC0000000)
  %810 = tail call float @llvm.fmuladd.f32(float %804, float %809, float 0x3FC99717E0000000)
  %811 = tail call float @llvm.fmuladd.f32(float %804, float %810, float 0xBFD5554C40000000)
  %812 = fmul float %804, %811
  %813 = tail call float @llvm.fmuladd.f32(float %803, float %812, float %803)
  %814 = fsub float 0x3FF921FB60000000, %813
  %815 = fcmp ogt float %800, %798
  %816 = select i1 %815, float %814, float %813
  %817 = fsub float 0x400921FB60000000, %816
  %818 = fcmp olt float %797, 0.000000e+00
  %819 = select i1 %818, float %817, float %816
  %820 = bitcast float %797 to i32
  %821 = icmp slt i32 %820, 0
  %822 = select i1 %821, float 0x400921FB60000000, float 0.000000e+00
  %823 = fcmp oeq float %799, 0.000000e+00
  %824 = select i1 %823, float %822, float %819
  %825 = select i1 %818, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %826 = fcmp oeq float %798, 0x7FF0000000000000
  %827 = fcmp oeq float %800, 0x7FF0000000000000
  %828 = and i1 %827, %826
  %829 = select i1 %828, float %825, float %824
  %830 = fcmp uno float %797, %799
  %831 = select i1 %830, float 0x7FF8000000000000, float %829
  %832 = tail call float @llvm.copysign.f32(float %831, float %799)
  %833 = sext i32 %24 to i64
  br label %834

834:                                              ; preds = %791, %767, %744, %623, %499, %496, %435, %292, %147
  %835 = phi i64 [ %28, %147 ], [ %174, %292 ], [ %316, %435 ], [ %466, %496 ], [ %500, %499 ], [ %624, %623 ], [ %745, %744 ], [ %768, %767 ], [ %833, %791 ]
  %836 = phi float [ %172, %147 ], [ %314, %292 ], [ %464, %435 ], [ %498, %496 ], [ %622, %499 ], [ %743, %623 ], [ %766, %744 ], [ %790, %767 ], [ %832, %791 ]
  %837 = getelementptr inbounds float, float addrspace(1)* %1, i64 %835
  store float %836, float addrspace(1)* %837, align 4, !tbaa !16
  br label %838

838:                                              ; preds = %834, %26, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

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
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i32 0, i32 33}
!21 = !{float 2.500000e+00}
