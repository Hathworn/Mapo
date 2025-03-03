; ModuleID = '../data/hip_kernels/2890/2/main.cu'
source_filename = "../data/hip_kernels/2890/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31Compute_weightx_weighty1_KernelPfS_PKfS1_S1_S1_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %10, %16
  %18 = add i32 %17, %11
  %19 = icmp slt i32 %18, %6
  br i1 %19, label %20, label %468

20:                                               ; preds = %9
  %21 = fcmp contract oeq float %7, 2.000000e+00
  br i1 %21, label %22, label %29

22:                                               ; preds = %20
  %23 = sext i32 %18 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  store float %25, float addrspace(1)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 %23
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  br label %464

29:                                               ; preds = %20
  %30 = fcmp contract oeq float %7, 1.000000e+00
  br i1 %30, label %31, label %46

31:                                               ; preds = %29
  %32 = sext i32 %18 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds float, float addrspace(1)* %4, i64 %32
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fadd contract float %36, %8
  %38 = fdiv contract float %34, %37
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float %38, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fadd contract float %43, %8
  %45 = fdiv contract float %41, %44
  br label %464

46:                                               ; preds = %29
  %47 = fcmp contract oeq float %7, 0.000000e+00
  %48 = sext i32 %18 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  br i1 %47, label %53, label %65

53:                                               ; preds = %46
  %54 = fmul contract float %52, %52
  %55 = fadd contract float %54, %8
  %56 = fdiv contract float %50, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %56, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fmul contract float %61, %61
  %63 = fadd contract float %62, %8
  %64 = fdiv contract float %59, %63
  br label %464

65:                                               ; preds = %46
  %66 = fsub contract float 2.000000e+00, %7
  %67 = tail call float @llvm.fabs.f32(float %52)
  %68 = tail call float @llvm.amdgcn.frexp.mant.f32(float %67)
  %69 = fcmp olt float %68, 0x3FE5555560000000
  %70 = zext i1 %69 to i32
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 %70)
  %72 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %67)
  %73 = sub nsw i32 %72, %70
  %74 = fadd float %71, -1.000000e+00
  %75 = fadd float %71, 1.000000e+00
  %76 = fadd float %75, -1.000000e+00
  %77 = fsub float %71, %76
  %78 = tail call float @llvm.amdgcn.rcp.f32(float %75)
  %79 = fmul float %74, %78
  %80 = fmul float %75, %79
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %79, float %75, float %81)
  %83 = tail call float @llvm.fma.f32(float %79, float %77, float %82)
  %84 = fadd float %80, %83
  %85 = fsub float %84, %80
  %86 = fsub float %83, %85
  %87 = fsub float %74, %84
  %88 = fsub float %74, %87
  %89 = fsub float %88, %84
  %90 = fsub float %89, %86
  %91 = fadd float %87, %90
  %92 = fmul float %78, %91
  %93 = fadd float %79, %92
  %94 = fsub float %93, %79
  %95 = fsub float %92, %94
  %96 = fmul float %93, %93
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %93, float %93, float %97)
  %99 = fmul float %95, 2.000000e+00
  %100 = tail call float @llvm.fma.f32(float %93, float %99, float %98)
  %101 = fadd float %96, %100
  %102 = fsub float %101, %96
  %103 = fsub float %100, %102
  %104 = tail call float @llvm.fmuladd.f32(float %101, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %105 = tail call float @llvm.fmuladd.f32(float %101, float %104, float 0x3FD999BDE0000000)
  %106 = sitofp i32 %73 to float
  %107 = fmul float %106, 0x3FE62E4300000000
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %106, float 0x3FE62E4300000000, float %108)
  %110 = tail call float @llvm.fma.f32(float %106, float 0xBE205C6100000000, float %109)
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = tail call float @llvm.amdgcn.ldexp.f32(float %93, i32 1)
  %115 = fmul float %93, %101
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %101, float %93, float %116)
  %118 = tail call float @llvm.fma.f32(float %101, float %95, float %117)
  %119 = tail call float @llvm.fma.f32(float %103, float %93, float %118)
  %120 = fadd float %115, %119
  %121 = fsub float %120, %115
  %122 = fsub float %119, %121
  %123 = fmul float %101, %105
  %124 = fneg float %123
  %125 = tail call float @llvm.fma.f32(float %101, float %105, float %124)
  %126 = tail call float @llvm.fma.f32(float %103, float %105, float %125)
  %127 = fadd float %123, %126
  %128 = fsub float %127, %123
  %129 = fsub float %126, %128
  %130 = fadd float %127, 0x3FE5555540000000
  %131 = fadd float %130, 0xBFE5555540000000
  %132 = fsub float %127, %131
  %133 = fadd float %129, 0x3E2E720200000000
  %134 = fadd float %133, %132
  %135 = fadd float %130, %134
  %136 = fsub float %135, %130
  %137 = fsub float %134, %136
  %138 = fmul float %120, %135
  %139 = fneg float %138
  %140 = tail call float @llvm.fma.f32(float %120, float %135, float %139)
  %141 = tail call float @llvm.fma.f32(float %120, float %137, float %140)
  %142 = tail call float @llvm.fma.f32(float %122, float %135, float %141)
  %143 = tail call float @llvm.amdgcn.ldexp.f32(float %95, i32 1)
  %144 = fadd float %138, %142
  %145 = fsub float %144, %138
  %146 = fsub float %142, %145
  %147 = fadd float %114, %144
  %148 = fsub float %147, %114
  %149 = fsub float %144, %148
  %150 = fadd float %143, %146
  %151 = fadd float %150, %149
  %152 = fadd float %147, %151
  %153 = fsub float %152, %147
  %154 = fsub float %151, %153
  %155 = fadd float %111, %152
  %156 = fsub float %155, %111
  %157 = fsub float %155, %156
  %158 = fsub float %111, %157
  %159 = fsub float %152, %156
  %160 = fadd float %159, %158
  %161 = fadd float %113, %154
  %162 = fsub float %161, %113
  %163 = fsub float %161, %162
  %164 = fsub float %113, %163
  %165 = fsub float %154, %162
  %166 = fadd float %165, %164
  %167 = fadd float %161, %160
  %168 = fadd float %155, %167
  %169 = fsub float %168, %155
  %170 = fsub float %167, %169
  %171 = fadd float %166, %170
  %172 = fadd float %168, %171
  %173 = fsub float %172, %168
  %174 = fsub float %171, %173
  %175 = fmul float %66, %172
  %176 = fneg float %175
  %177 = tail call float @llvm.fma.f32(float %66, float %172, float %176)
  %178 = tail call float @llvm.fma.f32(float %66, float %174, float %177)
  %179 = fadd float %175, %178
  %180 = tail call float @llvm.fabs.f32(float %175) #3
  %181 = fcmp oeq float %180, 0x7FF0000000000000
  %182 = select i1 %181, float %175, float %179
  %183 = fcmp oeq float %182, 0x40562E4300000000
  %184 = select i1 %183, float 0x3EE0000000000000, float 0.000000e+00
  %185 = fsub float %182, %184
  %186 = fmul float %185, 0x3FF7154760000000
  %187 = tail call float @llvm.rint.f32(float %186)
  %188 = fcmp ogt float %185, 0x40562E4300000000
  %189 = fcmp olt float %185, 0xC059D1DA00000000
  %190 = fneg float %186
  %191 = tail call float @llvm.fma.f32(float %185, float 0x3FF7154760000000, float %190)
  %192 = tail call float @llvm.fma.f32(float %185, float 0x3E54AE0BE0000000, float %191)
  %193 = fsub float %186, %187
  %194 = fadd float %192, %193
  %195 = tail call float @llvm.exp2.f32(float %194)
  %196 = fptosi float %187 to i32
  %197 = tail call float @llvm.amdgcn.ldexp.f32(float %195, i32 %196)
  %198 = select i1 %189, float 0.000000e+00, float %197
  %199 = select i1 %188, float 0x7FF0000000000000, float %198
  %200 = tail call float @llvm.fabs.f32(float %66)
  %201 = tail call float @llvm.trunc.f32(float %200)
  %202 = fcmp oeq float %200, %201
  %203 = zext i1 %202 to i32
  %204 = fmul float %201, 5.000000e-01
  %205 = tail call float @llvm.amdgcn.fract.f32(float %204)
  %206 = tail call i1 @llvm.amdgcn.class.f32(float %204, i32 516)
  %207 = select i1 %206, float 0.000000e+00, float %205
  %208 = fcmp oeq float %207, 0.000000e+00
  %209 = and i1 %202, %208
  %210 = zext i1 %209 to i32
  %211 = add nuw nsw i32 %210, %203
  %212 = icmp eq i32 %211, 1
  %213 = icmp ne i32 %211, 0
  %214 = fcmp oeq float %200, 0x7FF0000000000000
  br i1 %214, label %215, label %253

215:                                              ; preds = %65
  %216 = fcmp oeq float %67, 1.000000e+00
  %217 = fadd float %67, -1.000000e+00
  %218 = bitcast float %66 to i32
  %219 = bitcast float %217 to i32
  %220 = xor i32 %219, %218
  %221 = icmp sgt i32 %220, -1
  %222 = select i1 %221, float 0x7FF0000000000000, float 0.000000e+00
  %223 = select i1 %216, float %67, float %222
  %224 = fcmp oeq float %67, 0x7FF0000000000000
  %225 = fcmp oeq float %52, 0.000000e+00
  %226 = or i1 %225, %224
  %227 = fcmp olt float %66, 0.000000e+00
  %228 = xor i1 %227, %225
  %229 = select i1 %228, float 0.000000e+00, float 0x7FF0000000000000
  %230 = select i1 %212, float %52, float 0.000000e+00
  %231 = tail call float @llvm.copysign.f32(float %229, float %230)
  %232 = select i1 %226, float %231, float %223
  %233 = fcmp uno float %52, %66
  %234 = select i1 %233, float 0x7FF8000000000000, float %232
  %235 = fcmp oeq float %52, 1.000000e+00
  %236 = fcmp oeq float %66, 0.000000e+00
  %237 = or i1 %236, %235
  %238 = select i1 %237, float 1.000000e+00, float %234
  %239 = fadd contract float %238, %8
  %240 = fdiv contract float %50, %239
  %241 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %240, float addrspace(1)* %241, align 4, !tbaa !7
  %242 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !7
  %244 = tail call float @llvm.fabs.f32(float %243)
  %245 = fcmp oeq float %244, 1.000000e+00
  %246 = fadd float %244, -1.000000e+00
  %247 = bitcast float %66 to i32
  %248 = bitcast float %246 to i32
  %249 = xor i32 %248, %247
  %250 = icmp sgt i32 %249, -1
  %251 = select i1 %250, float 0x7FF0000000000000, float 0.000000e+00
  %252 = select i1 %245, float %244, float %251
  br label %441

253:                                              ; preds = %65
  %254 = fcmp uge float %52, 0.000000e+00
  %255 = select i1 %254, i1 true, i1 %213
  %256 = tail call float @llvm.fabs.f32(float %199) #3
  %257 = fcmp oeq float %256, 0x7FF0000000000000
  %258 = tail call float @llvm.fabs.f32(float %182) #3
  %259 = fcmp oeq float %258, 0x7FF0000000000000
  %260 = fsub float %179, %175
  %261 = fsub float %178, %260
  %262 = select i1 %259, float 0.000000e+00, float %261
  %263 = fadd float %184, %262
  %264 = tail call float @llvm.fma.f32(float %199, float %263, float %199)
  %265 = select i1 %257, float %199, float %264
  %266 = fcmp olt float %52, 0.000000e+00
  %267 = and i1 %212, %266
  %268 = select i1 %267, float -0.000000e+00, float 0.000000e+00
  %269 = tail call float @llvm.copysign.f32(float %265, float %268)
  %270 = select i1 %255, float %269, float 0x7FF8000000000000
  %271 = fcmp oeq float %67, 0x7FF0000000000000
  %272 = fcmp oeq float %52, 0.000000e+00
  %273 = or i1 %272, %271
  %274 = fcmp olt float %66, 0.000000e+00
  %275 = xor i1 %274, %272
  %276 = select i1 %275, float 0.000000e+00, float 0x7FF0000000000000
  %277 = select i1 %212, float %52, float 0.000000e+00
  %278 = tail call float @llvm.copysign.f32(float %276, float %277)
  %279 = select i1 %273, float %278, float %270
  %280 = fcmp uno float %52, %66
  %281 = select i1 %280, float 0x7FF8000000000000, float %279
  %282 = fcmp oeq float %52, 1.000000e+00
  %283 = fcmp oeq float %66, 0.000000e+00
  %284 = or i1 %283, %282
  %285 = select i1 %284, float 1.000000e+00, float %281
  %286 = fadd contract float %285, %8
  %287 = fdiv contract float %50, %286
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %287, float addrspace(1)* %288, align 4, !tbaa !7
  %289 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !7
  %291 = tail call float @llvm.fabs.f32(float %290)
  %292 = tail call float @llvm.amdgcn.frexp.mant.f32(float %291)
  %293 = fcmp olt float %292, 0x3FE5555560000000
  %294 = zext i1 %293 to i32
  %295 = tail call float @llvm.amdgcn.ldexp.f32(float %292, i32 %294)
  %296 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %291)
  %297 = sub nsw i32 %296, %294
  %298 = fadd float %295, -1.000000e+00
  %299 = fadd float %295, 1.000000e+00
  %300 = fadd float %299, -1.000000e+00
  %301 = fsub float %295, %300
  %302 = tail call float @llvm.amdgcn.rcp.f32(float %299)
  %303 = fmul float %298, %302
  %304 = fmul float %299, %303
  %305 = fneg float %304
  %306 = tail call float @llvm.fma.f32(float %303, float %299, float %305)
  %307 = tail call float @llvm.fma.f32(float %303, float %301, float %306)
  %308 = fadd float %304, %307
  %309 = fsub float %308, %304
  %310 = fsub float %307, %309
  %311 = fsub float %298, %308
  %312 = fsub float %298, %311
  %313 = fsub float %312, %308
  %314 = fsub float %313, %310
  %315 = fadd float %311, %314
  %316 = fmul float %302, %315
  %317 = fadd float %303, %316
  %318 = fsub float %317, %303
  %319 = fsub float %316, %318
  %320 = fmul float %317, %317
  %321 = fneg float %320
  %322 = tail call float @llvm.fma.f32(float %317, float %317, float %321)
  %323 = fmul float %319, 2.000000e+00
  %324 = tail call float @llvm.fma.f32(float %317, float %323, float %322)
  %325 = fadd float %320, %324
  %326 = fsub float %325, %320
  %327 = fsub float %324, %326
  %328 = tail call float @llvm.fmuladd.f32(float %325, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %329 = tail call float @llvm.fmuladd.f32(float %325, float %328, float 0x3FD999BDE0000000)
  %330 = sitofp i32 %297 to float
  %331 = fmul float %330, 0x3FE62E4300000000
  %332 = fneg float %331
  %333 = tail call float @llvm.fma.f32(float %330, float 0x3FE62E4300000000, float %332)
  %334 = tail call float @llvm.fma.f32(float %330, float 0xBE205C6100000000, float %333)
  %335 = fadd float %331, %334
  %336 = fsub float %335, %331
  %337 = fsub float %334, %336
  %338 = tail call float @llvm.amdgcn.ldexp.f32(float %317, i32 1)
  %339 = fmul float %317, %325
  %340 = fneg float %339
  %341 = tail call float @llvm.fma.f32(float %325, float %317, float %340)
  %342 = tail call float @llvm.fma.f32(float %325, float %319, float %341)
  %343 = tail call float @llvm.fma.f32(float %327, float %317, float %342)
  %344 = fadd float %339, %343
  %345 = fsub float %344, %339
  %346 = fsub float %343, %345
  %347 = fmul float %325, %329
  %348 = fneg float %347
  %349 = tail call float @llvm.fma.f32(float %325, float %329, float %348)
  %350 = tail call float @llvm.fma.f32(float %327, float %329, float %349)
  %351 = fadd float %347, %350
  %352 = fsub float %351, %347
  %353 = fsub float %350, %352
  %354 = fadd float %351, 0x3FE5555540000000
  %355 = fadd float %354, 0xBFE5555540000000
  %356 = fsub float %351, %355
  %357 = fadd float %353, 0x3E2E720200000000
  %358 = fadd float %357, %356
  %359 = fadd float %354, %358
  %360 = fsub float %359, %354
  %361 = fsub float %358, %360
  %362 = fmul float %344, %359
  %363 = fneg float %362
  %364 = tail call float @llvm.fma.f32(float %344, float %359, float %363)
  %365 = tail call float @llvm.fma.f32(float %344, float %361, float %364)
  %366 = tail call float @llvm.fma.f32(float %346, float %359, float %365)
  %367 = tail call float @llvm.amdgcn.ldexp.f32(float %319, i32 1)
  %368 = fadd float %362, %366
  %369 = fsub float %368, %362
  %370 = fsub float %366, %369
  %371 = fadd float %338, %368
  %372 = fsub float %371, %338
  %373 = fsub float %368, %372
  %374 = fadd float %367, %370
  %375 = fadd float %374, %373
  %376 = fadd float %371, %375
  %377 = fsub float %376, %371
  %378 = fsub float %375, %377
  %379 = fadd float %335, %376
  %380 = fsub float %379, %335
  %381 = fsub float %379, %380
  %382 = fsub float %335, %381
  %383 = fsub float %376, %380
  %384 = fadd float %383, %382
  %385 = fadd float %337, %378
  %386 = fsub float %385, %337
  %387 = fsub float %385, %386
  %388 = fsub float %337, %387
  %389 = fsub float %378, %386
  %390 = fadd float %389, %388
  %391 = fadd float %385, %384
  %392 = fadd float %379, %391
  %393 = fsub float %392, %379
  %394 = fsub float %391, %393
  %395 = fadd float %390, %394
  %396 = fadd float %392, %395
  %397 = fsub float %396, %392
  %398 = fsub float %395, %397
  %399 = fmul float %66, %396
  %400 = fneg float %399
  %401 = tail call float @llvm.fma.f32(float %66, float %396, float %400)
  %402 = tail call float @llvm.fma.f32(float %66, float %398, float %401)
  %403 = fadd float %399, %402
  %404 = fsub float %403, %399
  %405 = fsub float %402, %404
  %406 = tail call float @llvm.fabs.f32(float %399) #3
  %407 = fcmp oeq float %406, 0x7FF0000000000000
  %408 = select i1 %407, float %399, float %403
  %409 = tail call float @llvm.fabs.f32(float %408) #3
  %410 = fcmp oeq float %409, 0x7FF0000000000000
  %411 = select i1 %410, float 0.000000e+00, float %405
  %412 = fcmp oeq float %408, 0x40562E4300000000
  %413 = select i1 %412, float 0x3EE0000000000000, float 0.000000e+00
  %414 = fsub float %408, %413
  %415 = fadd float %413, %411
  %416 = fmul float %414, 0x3FF7154760000000
  %417 = tail call float @llvm.rint.f32(float %416)
  %418 = fcmp ogt float %414, 0x40562E4300000000
  %419 = fcmp olt float %414, 0xC059D1DA00000000
  %420 = fneg float %416
  %421 = tail call float @llvm.fma.f32(float %414, float 0x3FF7154760000000, float %420)
  %422 = tail call float @llvm.fma.f32(float %414, float 0x3E54AE0BE0000000, float %421)
  %423 = fsub float %416, %417
  %424 = fadd float %422, %423
  %425 = tail call float @llvm.exp2.f32(float %424)
  %426 = fptosi float %417 to i32
  %427 = tail call float @llvm.amdgcn.ldexp.f32(float %425, i32 %426)
  %428 = select i1 %419, float 0.000000e+00, float %427
  %429 = select i1 %418, float 0x7FF0000000000000, float %428
  %430 = tail call float @llvm.fma.f32(float %429, float %415, float %429)
  %431 = tail call float @llvm.fabs.f32(float %429) #3
  %432 = fcmp oeq float %431, 0x7FF0000000000000
  %433 = select i1 %432, float %429, float %430
  %434 = fcmp olt float %290, 0.000000e+00
  %435 = and i1 %212, %434
  %436 = select i1 %435, float -0.000000e+00, float 0.000000e+00
  %437 = tail call float @llvm.copysign.f32(float %433, float %436)
  %438 = fcmp uge float %290, 0.000000e+00
  %439 = select i1 %438, i1 true, i1 %213
  %440 = select i1 %439, float %437, float 0x7FF8000000000000
  br label %441

441:                                              ; preds = %253, %215
  %442 = phi float [ %291, %253 ], [ %244, %215 ]
  %443 = phi float [ %290, %253 ], [ %243, %215 ]
  %444 = phi i1 [ %283, %253 ], [ %236, %215 ]
  %445 = phi i1 [ %274, %253 ], [ %227, %215 ]
  %446 = phi float [ %440, %253 ], [ %252, %215 ]
  %447 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !7
  %449 = fcmp oeq float %442, 0x7FF0000000000000
  %450 = fcmp oeq float %443, 0.000000e+00
  %451 = or i1 %450, %449
  %452 = xor i1 %445, %450
  %453 = select i1 %452, float 0.000000e+00, float 0x7FF0000000000000
  %454 = select i1 %212, float %443, float 0.000000e+00
  %455 = tail call float @llvm.copysign.f32(float %453, float %454)
  %456 = select i1 %451, float %455, float %446
  %457 = fcmp uno float %443, %66
  %458 = select i1 %457, float 0x7FF8000000000000, float %456
  %459 = fcmp oeq float %443, 1.000000e+00
  %460 = or i1 %444, %459
  %461 = select i1 %460, float 1.000000e+00, float %458
  %462 = fadd contract float %461, %8
  %463 = fdiv contract float %448, %462
  br label %464

464:                                              ; preds = %31, %441, %53, %22
  %465 = phi i64 [ %23, %22 ], [ %48, %53 ], [ %48, %441 ], [ %32, %31 ]
  %466 = phi float [ %28, %22 ], [ %64, %53 ], [ %463, %441 ], [ %45, %31 ]
  %467 = getelementptr inbounds float, float addrspace(1)* %1, i64 %465
  store float %466, float addrspace(1)* %467, align 4, !tbaa !7
  br label %468

468:                                              ; preds = %464, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
