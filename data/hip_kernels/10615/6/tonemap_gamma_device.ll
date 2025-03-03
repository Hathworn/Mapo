; ModuleID = '../data/hip_kernels/10615/6/main.cu'
source_filename = "../data/hip_kernels/10615/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13tonemap_gammaPfS_iiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %3
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %678

29:                                               ; preds = %8
  %30 = mul nsw i32 %17, %2
  %31 = add nsw i32 %30, %25
  %32 = mul nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fmul float %6, 0x3FE62E4300000000
  %37 = fneg float %36
  %38 = tail call float @llvm.fma.f32(float %6, float 0x3FE62E4300000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %6, float 0xBE205C6100000000, float %38)
  %40 = fadd float %36, %39
  %41 = fsub float %40, %36
  %42 = fsub float %39, %41
  %43 = tail call float @llvm.fabs.f32(float %36) #3
  %44 = fcmp oeq float %43, 0x7FF0000000000000
  %45 = select i1 %44, float %36, float %40
  %46 = tail call float @llvm.fabs.f32(float %45) #3
  %47 = fcmp oeq float %46, 0x7FF0000000000000
  %48 = select i1 %47, float 0.000000e+00, float %42
  %49 = fcmp oeq float %45, 0x40562E4300000000
  %50 = select i1 %49, float 0x3EE0000000000000, float 0.000000e+00
  %51 = fsub float %45, %50
  %52 = fadd float %50, %48
  %53 = fmul float %51, 0x3FF7154760000000
  %54 = tail call float @llvm.rint.f32(float %53)
  %55 = fcmp ogt float %51, 0x40562E4300000000
  %56 = fcmp olt float %51, 0xC059D1DA00000000
  %57 = fneg float %53
  %58 = tail call float @llvm.fma.f32(float %51, float 0x3FF7154760000000, float %57)
  %59 = tail call float @llvm.fma.f32(float %51, float 0x3E54AE0BE0000000, float %58)
  %60 = fsub float %53, %54
  %61 = fadd float %59, %60
  %62 = tail call float @llvm.exp2.f32(float %61)
  %63 = fptosi float %54 to i32
  %64 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 %63)
  %65 = select i1 %56, float 0.000000e+00, float %64
  %66 = select i1 %55, float 0x7FF0000000000000, float %65
  %67 = tail call float @llvm.fma.f32(float %66, float %52, float %66)
  %68 = tail call float @llvm.fabs.f32(float %66) #3
  %69 = fcmp oeq float %68, 0x7FF0000000000000
  %70 = select i1 %69, float %66, float %67
  %71 = tail call float @llvm.fabs.f32(float %6)
  %72 = tail call float @llvm.fabs.f32(float %70)
  %73 = fcmp oeq float %71, 0x7FF0000000000000
  %74 = bitcast float %6 to i32
  %75 = icmp sgt i32 %74, -1
  %76 = select i1 %75, float 0x7FF0000000000000, float 0.000000e+00
  %77 = select i1 %73, float %76, float %72
  %78 = fcmp uno float %6, 0.000000e+00
  %79 = select i1 %78, float 0x7FF8000000000000, float %77
  %80 = fcmp oeq float %6, 0.000000e+00
  %81 = select i1 %80, float 1.000000e+00, float %79
  %82 = fmul contract float %81, %35
  %83 = fdiv contract float 1.000000e+00, %7
  %84 = tail call float @llvm.fabs.f32(float %82)
  %85 = tail call float @llvm.amdgcn.frexp.mant.f32(float %84)
  %86 = fcmp olt float %85, 0x3FE5555560000000
  %87 = zext i1 %86 to i32
  %88 = tail call float @llvm.amdgcn.ldexp.f32(float %85, i32 %87)
  %89 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %84)
  %90 = sub nsw i32 %89, %87
  %91 = fadd float %88, -1.000000e+00
  %92 = fadd float %88, 1.000000e+00
  %93 = fadd float %92, -1.000000e+00
  %94 = fsub float %88, %93
  %95 = tail call float @llvm.amdgcn.rcp.f32(float %92)
  %96 = fmul float %91, %95
  %97 = fmul float %92, %96
  %98 = fneg float %97
  %99 = tail call float @llvm.fma.f32(float %96, float %92, float %98)
  %100 = tail call float @llvm.fma.f32(float %96, float %94, float %99)
  %101 = fadd float %97, %100
  %102 = fsub float %101, %97
  %103 = fsub float %100, %102
  %104 = fsub float %91, %101
  %105 = fsub float %91, %104
  %106 = fsub float %105, %101
  %107 = fsub float %106, %103
  %108 = fadd float %104, %107
  %109 = fmul float %95, %108
  %110 = fadd float %96, %109
  %111 = fsub float %110, %96
  %112 = fsub float %109, %111
  %113 = fmul float %110, %110
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %110, float %110, float %114)
  %116 = fmul float %112, 2.000000e+00
  %117 = tail call float @llvm.fma.f32(float %110, float %116, float %115)
  %118 = fadd float %113, %117
  %119 = fsub float %118, %113
  %120 = fsub float %117, %119
  %121 = tail call float @llvm.fmuladd.f32(float %118, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %122 = tail call float @llvm.fmuladd.f32(float %118, float %121, float 0x3FD999BDE0000000)
  %123 = sitofp i32 %90 to float
  %124 = fmul float %123, 0x3FE62E4300000000
  %125 = fneg float %124
  %126 = tail call float @llvm.fma.f32(float %123, float 0x3FE62E4300000000, float %125)
  %127 = tail call float @llvm.fma.f32(float %123, float 0xBE205C6100000000, float %126)
  %128 = fadd float %124, %127
  %129 = fsub float %128, %124
  %130 = fsub float %127, %129
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %110, i32 1)
  %132 = fmul float %110, %118
  %133 = fneg float %132
  %134 = tail call float @llvm.fma.f32(float %118, float %110, float %133)
  %135 = tail call float @llvm.fma.f32(float %118, float %112, float %134)
  %136 = tail call float @llvm.fma.f32(float %120, float %110, float %135)
  %137 = fadd float %132, %136
  %138 = fsub float %137, %132
  %139 = fsub float %136, %138
  %140 = fmul float %118, %122
  %141 = fneg float %140
  %142 = tail call float @llvm.fma.f32(float %118, float %122, float %141)
  %143 = tail call float @llvm.fma.f32(float %120, float %122, float %142)
  %144 = fadd float %140, %143
  %145 = fsub float %144, %140
  %146 = fsub float %143, %145
  %147 = fadd float %144, 0x3FE5555540000000
  %148 = fadd float %147, 0xBFE5555540000000
  %149 = fsub float %144, %148
  %150 = fadd float %146, 0x3E2E720200000000
  %151 = fadd float %150, %149
  %152 = fadd float %147, %151
  %153 = fsub float %152, %147
  %154 = fsub float %151, %153
  %155 = fmul float %137, %152
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %137, float %152, float %156)
  %158 = tail call float @llvm.fma.f32(float %137, float %154, float %157)
  %159 = tail call float @llvm.fma.f32(float %139, float %152, float %158)
  %160 = tail call float @llvm.amdgcn.ldexp.f32(float %112, i32 1)
  %161 = fadd float %155, %159
  %162 = fsub float %161, %155
  %163 = fsub float %159, %162
  %164 = fadd float %131, %161
  %165 = fsub float %164, %131
  %166 = fsub float %161, %165
  %167 = fadd float %160, %163
  %168 = fadd float %167, %166
  %169 = fadd float %164, %168
  %170 = fsub float %169, %164
  %171 = fsub float %168, %170
  %172 = fadd float %128, %169
  %173 = fsub float %172, %128
  %174 = fsub float %172, %173
  %175 = fsub float %128, %174
  %176 = fsub float %169, %173
  %177 = fadd float %176, %175
  %178 = fadd float %130, %171
  %179 = fsub float %178, %130
  %180 = fsub float %178, %179
  %181 = fsub float %130, %180
  %182 = fsub float %171, %179
  %183 = fadd float %182, %181
  %184 = fadd float %178, %177
  %185 = fadd float %172, %184
  %186 = fsub float %185, %172
  %187 = fsub float %184, %186
  %188 = fadd float %183, %187
  %189 = fadd float %185, %188
  %190 = fsub float %189, %185
  %191 = fsub float %188, %190
  %192 = fmul float %83, %189
  %193 = fneg float %192
  %194 = tail call float @llvm.fma.f32(float %83, float %189, float %193)
  %195 = tail call float @llvm.fma.f32(float %83, float %191, float %194)
  %196 = fadd float %192, %195
  %197 = tail call float @llvm.fabs.f32(float %192) #3
  %198 = fcmp oeq float %197, 0x7FF0000000000000
  %199 = select i1 %198, float %192, float %196
  %200 = fcmp oeq float %199, 0x40562E4300000000
  %201 = select i1 %200, float 0x3EE0000000000000, float 0.000000e+00
  %202 = fsub float %199, %201
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = tail call float @llvm.rint.f32(float %203)
  %205 = fcmp ogt float %202, 0x40562E4300000000
  %206 = fcmp olt float %202, 0xC059D1DA00000000
  %207 = fneg float %203
  %208 = tail call float @llvm.fma.f32(float %202, float 0x3FF7154760000000, float %207)
  %209 = tail call float @llvm.fma.f32(float %202, float 0x3E54AE0BE0000000, float %208)
  %210 = fsub float %203, %204
  %211 = fadd float %209, %210
  %212 = tail call float @llvm.exp2.f32(float %211)
  %213 = fptosi float %204 to i32
  %214 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 %213)
  %215 = select i1 %206, float 0.000000e+00, float %214
  %216 = select i1 %205, float 0x7FF0000000000000, float %215
  %217 = tail call float @llvm.fabs.f32(float %83)
  %218 = tail call float @llvm.trunc.f32(float %217)
  %219 = fcmp oeq float %217, %218
  %220 = zext i1 %219 to i32
  %221 = fmul float %218, 5.000000e-01
  %222 = tail call float @llvm.amdgcn.fract.f32(float %221)
  %223 = tail call i1 @llvm.amdgcn.class.f32(float %221, i32 516)
  %224 = select i1 %223, float 0.000000e+00, float %222
  %225 = fcmp oeq float %224, 0.000000e+00
  %226 = and i1 %219, %225
  %227 = zext i1 %226 to i32
  %228 = add nuw nsw i32 %227, %220
  %229 = icmp eq i32 %228, 1
  %230 = icmp ne i32 %228, 0
  %231 = fcmp oeq float %217, 0x7FF0000000000000
  br i1 %231, label %232, label %299

232:                                              ; preds = %29
  %233 = fcmp oeq float %84, 1.000000e+00
  %234 = fadd float %84, -1.000000e+00
  %235 = bitcast float %83 to i32
  %236 = bitcast float %234 to i32
  %237 = xor i32 %236, %235
  %238 = icmp sgt i32 %237, -1
  %239 = select i1 %238, float 0x7FF0000000000000, float 0.000000e+00
  %240 = select i1 %233, float %84, float %239
  %241 = fcmp oeq float %84, 0x7FF0000000000000
  %242 = fcmp oeq float %82, 0.000000e+00
  %243 = or i1 %242, %241
  %244 = fcmp olt float %83, 0.000000e+00
  %245 = xor i1 %244, %242
  %246 = select i1 %245, float 0.000000e+00, float 0x7FF0000000000000
  %247 = select i1 %229, float %82, float 0.000000e+00
  %248 = tail call float @llvm.copysign.f32(float %246, float %247)
  %249 = select i1 %243, float %248, float %240
  %250 = fcmp uno float %82, %83
  %251 = select i1 %250, float 0x7FF8000000000000, float %249
  %252 = fcmp oeq float %82, 1.000000e+00
  %253 = fcmp oeq float %83, 0.000000e+00
  %254 = or i1 %253, %252
  %255 = select i1 %254, float 1.000000e+00, float %251
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %255, float addrspace(1)* %256, align 4, !tbaa !7
  %257 = add nsw i32 %32, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %0, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !7
  %261 = fmul contract float %81, %260
  %262 = tail call float @llvm.fabs.f32(float %261)
  %263 = fcmp oeq float %262, 1.000000e+00
  %264 = fadd float %262, -1.000000e+00
  %265 = bitcast float %83 to i32
  %266 = bitcast float %264 to i32
  %267 = xor i32 %266, %265
  %268 = icmp sgt i32 %267, -1
  %269 = select i1 %268, float 0x7FF0000000000000, float 0.000000e+00
  %270 = select i1 %263, float %262, float %269
  %271 = fcmp oeq float %262, 0x7FF0000000000000
  %272 = fcmp oeq float %261, 0.000000e+00
  %273 = or i1 %272, %271
  %274 = xor i1 %244, %272
  %275 = select i1 %274, float 0.000000e+00, float 0x7FF0000000000000
  %276 = select i1 %229, float %261, float 0.000000e+00
  %277 = tail call float @llvm.copysign.f32(float %275, float %276)
  %278 = select i1 %273, float %277, float %270
  %279 = fcmp uno float %261, %83
  %280 = select i1 %279, float 0x7FF8000000000000, float %278
  %281 = fcmp oeq float %261, 1.000000e+00
  %282 = or i1 %253, %281
  %283 = select i1 %282, float 1.000000e+00, float %280
  %284 = getelementptr inbounds float, float addrspace(1)* %1, i64 %258
  store float %283, float addrspace(1)* %284, align 4, !tbaa !7
  %285 = add nsw i32 %32, 2
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %0, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7
  %289 = fmul contract float %81, %288
  %290 = tail call float @llvm.fabs.f32(float %289)
  %291 = fcmp oeq float %290, 1.000000e+00
  %292 = fadd float %290, -1.000000e+00
  %293 = bitcast float %83 to i32
  %294 = bitcast float %292 to i32
  %295 = xor i32 %294, %293
  %296 = icmp sgt i32 %295, -1
  %297 = select i1 %296, float 0x7FF0000000000000, float 0.000000e+00
  %298 = select i1 %291, float %290, float %297
  br label %657

299:                                              ; preds = %29
  %300 = fcmp uge float %82, 0.000000e+00
  %301 = select i1 %300, i1 true, i1 %230
  %302 = tail call float @llvm.fabs.f32(float %216) #3
  %303 = fcmp oeq float %302, 0x7FF0000000000000
  %304 = tail call float @llvm.fabs.f32(float %199) #3
  %305 = fcmp oeq float %304, 0x7FF0000000000000
  %306 = fsub float %196, %192
  %307 = fsub float %195, %306
  %308 = select i1 %305, float 0.000000e+00, float %307
  %309 = fadd float %201, %308
  %310 = tail call float @llvm.fma.f32(float %216, float %309, float %216)
  %311 = select i1 %303, float %216, float %310
  %312 = fcmp olt float %82, 0.000000e+00
  %313 = and i1 %229, %312
  %314 = select i1 %313, float -0.000000e+00, float 0.000000e+00
  %315 = tail call float @llvm.copysign.f32(float %311, float %314)
  %316 = select i1 %301, float %315, float 0x7FF8000000000000
  %317 = fcmp oeq float %84, 0x7FF0000000000000
  %318 = fcmp oeq float %82, 0.000000e+00
  %319 = or i1 %318, %317
  %320 = fcmp olt float %83, 0.000000e+00
  %321 = xor i1 %320, %318
  %322 = select i1 %321, float 0.000000e+00, float 0x7FF0000000000000
  %323 = select i1 %229, float %82, float 0.000000e+00
  %324 = tail call float @llvm.copysign.f32(float %322, float %323)
  %325 = select i1 %319, float %324, float %316
  %326 = fcmp uno float %82, %83
  %327 = select i1 %326, float 0x7FF8000000000000, float %325
  %328 = fcmp oeq float %82, 1.000000e+00
  %329 = fcmp oeq float %83, 0.000000e+00
  %330 = or i1 %329, %328
  %331 = select i1 %330, float 1.000000e+00, float %327
  %332 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %331, float addrspace(1)* %332, align 4, !tbaa !7
  %333 = add nsw i32 %32, 1
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %0, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !7
  %337 = fmul contract float %81, %336
  %338 = tail call float @llvm.fabs.f32(float %337)
  %339 = tail call float @llvm.amdgcn.frexp.mant.f32(float %338)
  %340 = fcmp olt float %339, 0x3FE5555560000000
  %341 = zext i1 %340 to i32
  %342 = tail call float @llvm.amdgcn.ldexp.f32(float %339, i32 %341)
  %343 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %338)
  %344 = sub nsw i32 %343, %341
  %345 = fadd float %342, -1.000000e+00
  %346 = fadd float %342, 1.000000e+00
  %347 = fadd float %346, -1.000000e+00
  %348 = fsub float %342, %347
  %349 = tail call float @llvm.amdgcn.rcp.f32(float %346)
  %350 = fmul float %345, %349
  %351 = fmul float %346, %350
  %352 = fneg float %351
  %353 = tail call float @llvm.fma.f32(float %350, float %346, float %352)
  %354 = tail call float @llvm.fma.f32(float %350, float %348, float %353)
  %355 = fadd float %351, %354
  %356 = fsub float %355, %351
  %357 = fsub float %354, %356
  %358 = fsub float %345, %355
  %359 = fsub float %345, %358
  %360 = fsub float %359, %355
  %361 = fsub float %360, %357
  %362 = fadd float %358, %361
  %363 = fmul float %349, %362
  %364 = fadd float %350, %363
  %365 = fsub float %364, %350
  %366 = fsub float %363, %365
  %367 = fmul float %364, %364
  %368 = fneg float %367
  %369 = tail call float @llvm.fma.f32(float %364, float %364, float %368)
  %370 = fmul float %366, 2.000000e+00
  %371 = tail call float @llvm.fma.f32(float %364, float %370, float %369)
  %372 = fadd float %367, %371
  %373 = fsub float %372, %367
  %374 = fsub float %371, %373
  %375 = tail call float @llvm.fmuladd.f32(float %372, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %376 = tail call float @llvm.fmuladd.f32(float %372, float %375, float 0x3FD999BDE0000000)
  %377 = sitofp i32 %344 to float
  %378 = fmul float %377, 0x3FE62E4300000000
  %379 = fneg float %378
  %380 = tail call float @llvm.fma.f32(float %377, float 0x3FE62E4300000000, float %379)
  %381 = tail call float @llvm.fma.f32(float %377, float 0xBE205C6100000000, float %380)
  %382 = fadd float %378, %381
  %383 = fsub float %382, %378
  %384 = fsub float %381, %383
  %385 = tail call float @llvm.amdgcn.ldexp.f32(float %364, i32 1)
  %386 = fmul float %364, %372
  %387 = fneg float %386
  %388 = tail call float @llvm.fma.f32(float %372, float %364, float %387)
  %389 = tail call float @llvm.fma.f32(float %372, float %366, float %388)
  %390 = tail call float @llvm.fma.f32(float %374, float %364, float %389)
  %391 = fadd float %386, %390
  %392 = fsub float %391, %386
  %393 = fsub float %390, %392
  %394 = fmul float %372, %376
  %395 = fneg float %394
  %396 = tail call float @llvm.fma.f32(float %372, float %376, float %395)
  %397 = tail call float @llvm.fma.f32(float %374, float %376, float %396)
  %398 = fadd float %394, %397
  %399 = fsub float %398, %394
  %400 = fsub float %397, %399
  %401 = fadd float %398, 0x3FE5555540000000
  %402 = fadd float %401, 0xBFE5555540000000
  %403 = fsub float %398, %402
  %404 = fadd float %400, 0x3E2E720200000000
  %405 = fadd float %404, %403
  %406 = fadd float %401, %405
  %407 = fsub float %406, %401
  %408 = fsub float %405, %407
  %409 = fmul float %391, %406
  %410 = fneg float %409
  %411 = tail call float @llvm.fma.f32(float %391, float %406, float %410)
  %412 = tail call float @llvm.fma.f32(float %391, float %408, float %411)
  %413 = tail call float @llvm.fma.f32(float %393, float %406, float %412)
  %414 = tail call float @llvm.amdgcn.ldexp.f32(float %366, i32 1)
  %415 = fadd float %409, %413
  %416 = fsub float %415, %409
  %417 = fsub float %413, %416
  %418 = fadd float %385, %415
  %419 = fsub float %418, %385
  %420 = fsub float %415, %419
  %421 = fadd float %414, %417
  %422 = fadd float %421, %420
  %423 = fadd float %418, %422
  %424 = fsub float %423, %418
  %425 = fsub float %422, %424
  %426 = fadd float %382, %423
  %427 = fsub float %426, %382
  %428 = fsub float %426, %427
  %429 = fsub float %382, %428
  %430 = fsub float %423, %427
  %431 = fadd float %430, %429
  %432 = fadd float %384, %425
  %433 = fsub float %432, %384
  %434 = fsub float %432, %433
  %435 = fsub float %384, %434
  %436 = fsub float %425, %433
  %437 = fadd float %436, %435
  %438 = fadd float %432, %431
  %439 = fadd float %426, %438
  %440 = fsub float %439, %426
  %441 = fsub float %438, %440
  %442 = fadd float %437, %441
  %443 = fadd float %439, %442
  %444 = fsub float %443, %439
  %445 = fsub float %442, %444
  %446 = fmul float %83, %443
  %447 = fneg float %446
  %448 = tail call float @llvm.fma.f32(float %83, float %443, float %447)
  %449 = tail call float @llvm.fma.f32(float %83, float %445, float %448)
  %450 = fadd float %446, %449
  %451 = fsub float %450, %446
  %452 = fsub float %449, %451
  %453 = tail call float @llvm.fabs.f32(float %446) #3
  %454 = fcmp oeq float %453, 0x7FF0000000000000
  %455 = select i1 %454, float %446, float %450
  %456 = tail call float @llvm.fabs.f32(float %455) #3
  %457 = fcmp oeq float %456, 0x7FF0000000000000
  %458 = select i1 %457, float 0.000000e+00, float %452
  %459 = fcmp oeq float %455, 0x40562E4300000000
  %460 = select i1 %459, float 0x3EE0000000000000, float 0.000000e+00
  %461 = fsub float %455, %460
  %462 = fadd float %460, %458
  %463 = fmul float %461, 0x3FF7154760000000
  %464 = tail call float @llvm.rint.f32(float %463)
  %465 = fcmp ogt float %461, 0x40562E4300000000
  %466 = fcmp olt float %461, 0xC059D1DA00000000
  %467 = fneg float %463
  %468 = tail call float @llvm.fma.f32(float %461, float 0x3FF7154760000000, float %467)
  %469 = tail call float @llvm.fma.f32(float %461, float 0x3E54AE0BE0000000, float %468)
  %470 = fsub float %463, %464
  %471 = fadd float %469, %470
  %472 = tail call float @llvm.exp2.f32(float %471)
  %473 = fptosi float %464 to i32
  %474 = tail call float @llvm.amdgcn.ldexp.f32(float %472, i32 %473)
  %475 = select i1 %466, float 0.000000e+00, float %474
  %476 = select i1 %465, float 0x7FF0000000000000, float %475
  %477 = tail call float @llvm.fma.f32(float %476, float %462, float %476)
  %478 = tail call float @llvm.fabs.f32(float %476) #3
  %479 = fcmp oeq float %478, 0x7FF0000000000000
  %480 = select i1 %479, float %476, float %477
  %481 = fcmp olt float %337, 0.000000e+00
  %482 = and i1 %229, %481
  %483 = select i1 %482, float -0.000000e+00, float 0.000000e+00
  %484 = tail call float @llvm.copysign.f32(float %480, float %483)
  %485 = fcmp uge float %337, 0.000000e+00
  %486 = select i1 %485, i1 true, i1 %230
  %487 = select i1 %486, float %484, float 0x7FF8000000000000
  %488 = fcmp oeq float %338, 0x7FF0000000000000
  %489 = fcmp oeq float %337, 0.000000e+00
  %490 = or i1 %489, %488
  %491 = xor i1 %320, %489
  %492 = select i1 %491, float 0.000000e+00, float 0x7FF0000000000000
  %493 = select i1 %229, float %337, float 0.000000e+00
  %494 = tail call float @llvm.copysign.f32(float %492, float %493)
  %495 = select i1 %490, float %494, float %487
  %496 = fcmp uno float %337, %83
  %497 = select i1 %496, float 0x7FF8000000000000, float %495
  %498 = fcmp oeq float %337, 1.000000e+00
  %499 = or i1 %329, %498
  %500 = select i1 %499, float 1.000000e+00, float %497
  %501 = getelementptr inbounds float, float addrspace(1)* %1, i64 %334
  store float %500, float addrspace(1)* %501, align 4, !tbaa !7
  %502 = add nsw i32 %32, 2
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds float, float addrspace(1)* %0, i64 %503
  %505 = load float, float addrspace(1)* %504, align 4, !tbaa !7
  %506 = fmul contract float %81, %505
  %507 = tail call float @llvm.fabs.f32(float %506)
  %508 = tail call float @llvm.amdgcn.frexp.mant.f32(float %507)
  %509 = fcmp olt float %508, 0x3FE5555560000000
  %510 = zext i1 %509 to i32
  %511 = tail call float @llvm.amdgcn.ldexp.f32(float %508, i32 %510)
  %512 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %507)
  %513 = sub nsw i32 %512, %510
  %514 = fadd float %511, -1.000000e+00
  %515 = fadd float %511, 1.000000e+00
  %516 = fadd float %515, -1.000000e+00
  %517 = fsub float %511, %516
  %518 = tail call float @llvm.amdgcn.rcp.f32(float %515)
  %519 = fmul float %514, %518
  %520 = fmul float %515, %519
  %521 = fneg float %520
  %522 = tail call float @llvm.fma.f32(float %519, float %515, float %521)
  %523 = tail call float @llvm.fma.f32(float %519, float %517, float %522)
  %524 = fadd float %520, %523
  %525 = fsub float %524, %520
  %526 = fsub float %523, %525
  %527 = fsub float %514, %524
  %528 = fsub float %514, %527
  %529 = fsub float %528, %524
  %530 = fsub float %529, %526
  %531 = fadd float %527, %530
  %532 = fmul float %518, %531
  %533 = fadd float %519, %532
  %534 = fsub float %533, %519
  %535 = fsub float %532, %534
  %536 = fmul float %533, %533
  %537 = fneg float %536
  %538 = tail call float @llvm.fma.f32(float %533, float %533, float %537)
  %539 = fmul float %535, 2.000000e+00
  %540 = tail call float @llvm.fma.f32(float %533, float %539, float %538)
  %541 = fadd float %536, %540
  %542 = fsub float %541, %536
  %543 = fsub float %540, %542
  %544 = tail call float @llvm.fmuladd.f32(float %541, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %545 = tail call float @llvm.fmuladd.f32(float %541, float %544, float 0x3FD999BDE0000000)
  %546 = sitofp i32 %513 to float
  %547 = fmul float %546, 0x3FE62E4300000000
  %548 = fneg float %547
  %549 = tail call float @llvm.fma.f32(float %546, float 0x3FE62E4300000000, float %548)
  %550 = tail call float @llvm.fma.f32(float %546, float 0xBE205C6100000000, float %549)
  %551 = fadd float %547, %550
  %552 = fsub float %551, %547
  %553 = fsub float %550, %552
  %554 = tail call float @llvm.amdgcn.ldexp.f32(float %533, i32 1)
  %555 = fmul float %533, %541
  %556 = fneg float %555
  %557 = tail call float @llvm.fma.f32(float %541, float %533, float %556)
  %558 = tail call float @llvm.fma.f32(float %541, float %535, float %557)
  %559 = tail call float @llvm.fma.f32(float %543, float %533, float %558)
  %560 = fadd float %555, %559
  %561 = fsub float %560, %555
  %562 = fsub float %559, %561
  %563 = fmul float %541, %545
  %564 = fneg float %563
  %565 = tail call float @llvm.fma.f32(float %541, float %545, float %564)
  %566 = tail call float @llvm.fma.f32(float %543, float %545, float %565)
  %567 = fadd float %563, %566
  %568 = fsub float %567, %563
  %569 = fsub float %566, %568
  %570 = fadd float %567, 0x3FE5555540000000
  %571 = fadd float %570, 0xBFE5555540000000
  %572 = fsub float %567, %571
  %573 = fadd float %569, 0x3E2E720200000000
  %574 = fadd float %573, %572
  %575 = fadd float %570, %574
  %576 = fsub float %575, %570
  %577 = fsub float %574, %576
  %578 = fmul float %560, %575
  %579 = fneg float %578
  %580 = tail call float @llvm.fma.f32(float %560, float %575, float %579)
  %581 = tail call float @llvm.fma.f32(float %560, float %577, float %580)
  %582 = tail call float @llvm.fma.f32(float %562, float %575, float %581)
  %583 = tail call float @llvm.amdgcn.ldexp.f32(float %535, i32 1)
  %584 = fadd float %578, %582
  %585 = fsub float %584, %578
  %586 = fsub float %582, %585
  %587 = fadd float %554, %584
  %588 = fsub float %587, %554
  %589 = fsub float %584, %588
  %590 = fadd float %583, %586
  %591 = fadd float %590, %589
  %592 = fadd float %587, %591
  %593 = fsub float %592, %587
  %594 = fsub float %591, %593
  %595 = fadd float %551, %592
  %596 = fsub float %595, %551
  %597 = fsub float %595, %596
  %598 = fsub float %551, %597
  %599 = fsub float %592, %596
  %600 = fadd float %599, %598
  %601 = fadd float %553, %594
  %602 = fsub float %601, %553
  %603 = fsub float %601, %602
  %604 = fsub float %553, %603
  %605 = fsub float %594, %602
  %606 = fadd float %605, %604
  %607 = fadd float %601, %600
  %608 = fadd float %595, %607
  %609 = fsub float %608, %595
  %610 = fsub float %607, %609
  %611 = fadd float %606, %610
  %612 = fadd float %608, %611
  %613 = fsub float %612, %608
  %614 = fsub float %611, %613
  %615 = fmul float %83, %612
  %616 = fneg float %615
  %617 = tail call float @llvm.fma.f32(float %83, float %612, float %616)
  %618 = tail call float @llvm.fma.f32(float %83, float %614, float %617)
  %619 = fadd float %615, %618
  %620 = fsub float %619, %615
  %621 = fsub float %618, %620
  %622 = tail call float @llvm.fabs.f32(float %615) #3
  %623 = fcmp oeq float %622, 0x7FF0000000000000
  %624 = select i1 %623, float %615, float %619
  %625 = tail call float @llvm.fabs.f32(float %624) #3
  %626 = fcmp oeq float %625, 0x7FF0000000000000
  %627 = select i1 %626, float 0.000000e+00, float %621
  %628 = fcmp oeq float %624, 0x40562E4300000000
  %629 = select i1 %628, float 0x3EE0000000000000, float 0.000000e+00
  %630 = fsub float %624, %629
  %631 = fadd float %629, %627
  %632 = fmul float %630, 0x3FF7154760000000
  %633 = tail call float @llvm.rint.f32(float %632)
  %634 = fcmp ogt float %630, 0x40562E4300000000
  %635 = fcmp olt float %630, 0xC059D1DA00000000
  %636 = fneg float %632
  %637 = tail call float @llvm.fma.f32(float %630, float 0x3FF7154760000000, float %636)
  %638 = tail call float @llvm.fma.f32(float %630, float 0x3E54AE0BE0000000, float %637)
  %639 = fsub float %632, %633
  %640 = fadd float %638, %639
  %641 = tail call float @llvm.exp2.f32(float %640)
  %642 = fptosi float %633 to i32
  %643 = tail call float @llvm.amdgcn.ldexp.f32(float %641, i32 %642)
  %644 = select i1 %635, float 0.000000e+00, float %643
  %645 = select i1 %634, float 0x7FF0000000000000, float %644
  %646 = tail call float @llvm.fma.f32(float %645, float %631, float %645)
  %647 = tail call float @llvm.fabs.f32(float %645) #3
  %648 = fcmp oeq float %647, 0x7FF0000000000000
  %649 = select i1 %648, float %645, float %646
  %650 = fcmp olt float %506, 0.000000e+00
  %651 = and i1 %229, %650
  %652 = select i1 %651, float -0.000000e+00, float 0.000000e+00
  %653 = tail call float @llvm.copysign.f32(float %649, float %652)
  %654 = fcmp uge float %506, 0.000000e+00
  %655 = select i1 %654, i1 true, i1 %230
  %656 = select i1 %655, float %653, float 0x7FF8000000000000
  br label %657

657:                                              ; preds = %299, %232
  %658 = phi i1 [ %329, %299 ], [ %253, %232 ]
  %659 = phi i1 [ %320, %299 ], [ %244, %232 ]
  %660 = phi float [ %507, %299 ], [ %290, %232 ]
  %661 = phi float [ %506, %299 ], [ %289, %232 ]
  %662 = phi i64 [ %503, %299 ], [ %286, %232 ]
  %663 = phi float [ %656, %299 ], [ %298, %232 ]
  %664 = fcmp oeq float %660, 0x7FF0000000000000
  %665 = fcmp oeq float %661, 0.000000e+00
  %666 = or i1 %665, %664
  %667 = xor i1 %659, %665
  %668 = select i1 %667, float 0.000000e+00, float 0x7FF0000000000000
  %669 = select i1 %229, float %661, float 0.000000e+00
  %670 = tail call float @llvm.copysign.f32(float %668, float %669)
  %671 = select i1 %666, float %670, float %663
  %672 = fcmp uno float %661, %83
  %673 = select i1 %672, float 0x7FF8000000000000, float %671
  %674 = fcmp oeq float %661, 1.000000e+00
  %675 = or i1 %658, %674
  %676 = select i1 %675, float 1.000000e+00, float %673
  %677 = getelementptr inbounds float, float addrspace(1)* %1, i64 %662
  store float %676, float addrspace(1)* %677, align 4, !tbaa !7
  br label %678

678:                                              ; preds = %657, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
