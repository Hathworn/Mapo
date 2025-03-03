; ModuleID = '../data/hip_kernels/7452/4/main.cu'
source_filename = "../data/hip_kernels/7452/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26calculateFeatureDifferencePfiiS_S_S_S_iiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = sub nsw i32 %1, %7
  %12 = add nsw i32 %11, 1
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = add i32 %20, %13
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = icmp sgt i32 %21, %11
  %31 = sub nsw i32 %2, %8
  %32 = icmp sgt i32 %29, %31
  %33 = select i1 %30, i1 true, i1 %32
  br i1 %33, label %396, label %34

34:                                               ; preds = %10
  %35 = add nsw i32 %21, -1
  %36 = add nsw i32 %29, -1
  %37 = add nsw i32 %35, %7
  %38 = add nsw i32 %36, %8
  %39 = mul nsw i32 %38, %1
  %40 = add nsw i32 %39, %37
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = icmp slt i32 %21, 1
  br i1 %44, label %50, label %45

45:                                               ; preds = %34
  %46 = add nsw i32 %39, %35
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %50

50:                                               ; preds = %45, %34
  %51 = phi contract float [ %49, %45 ], [ 0.000000e+00, %34 ]
  %52 = icmp slt i32 %29, 1
  br i1 %52, label %59, label %53

53:                                               ; preds = %50
  %54 = mul nsw i32 %36, %1
  %55 = add nsw i32 %54, %37
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %59

59:                                               ; preds = %53, %50
  %60 = phi contract float [ %58, %53 ], [ 0.000000e+00, %50 ]
  %61 = select i1 %44, i1 true, i1 %52
  br i1 %61, label %68, label %62

62:                                               ; preds = %59
  %63 = mul nsw i32 %36, %1
  %64 = add nsw i32 %63, %35
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %68

68:                                               ; preds = %59, %62
  %69 = phi contract float [ %67, %62 ], [ 0.000000e+00, %59 ]
  %70 = fsub contract float %43, %51
  %71 = fsub contract float %70, %60
  %72 = fadd contract float %71, %69
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  br i1 %44, label %80, label %75

75:                                               ; preds = %68
  %76 = add nsw i32 %39, %35
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %80

80:                                               ; preds = %75, %68
  %81 = phi contract float [ %79, %75 ], [ 0.000000e+00, %68 ]
  br i1 %52, label %88, label %82

82:                                               ; preds = %80
  %83 = mul nsw i32 %36, %1
  %84 = add nsw i32 %83, %37
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %88

88:                                               ; preds = %82, %80
  %89 = phi contract float [ %87, %82 ], [ 0.000000e+00, %80 ]
  br i1 %61, label %96, label %90

90:                                               ; preds = %88
  %91 = mul nsw i32 %36, %1
  %92 = add nsw i32 %91, %35
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %96

96:                                               ; preds = %88, %90
  %97 = phi contract float [ %95, %90 ], [ 0.000000e+00, %88 ]
  %98 = fsub contract float %74, %81
  %99 = fsub contract float %98, %89
  %100 = fadd contract float %99, %97
  %101 = mul i32 %8, %7
  %102 = sitofp i32 %101 to float
  %103 = fdiv contract float %72, %102
  %104 = fdiv contract float %100, %102
  %105 = tail call float @llvm.fabs.f32(float %103)
  %106 = tail call float @llvm.amdgcn.frexp.mant.f32(float %105)
  %107 = fcmp olt float %106, 0x3FE5555560000000
  %108 = zext i1 %107 to i32
  %109 = tail call float @llvm.amdgcn.ldexp.f32(float %106, i32 %108)
  %110 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %105)
  %111 = sub nsw i32 %110, %108
  %112 = fadd float %109, -1.000000e+00
  %113 = fadd float %109, 1.000000e+00
  %114 = fadd float %113, -1.000000e+00
  %115 = fsub float %109, %114
  %116 = tail call float @llvm.amdgcn.rcp.f32(float %113)
  %117 = fmul float %112, %116
  %118 = fmul float %113, %117
  %119 = fneg float %118
  %120 = tail call float @llvm.fma.f32(float %117, float %113, float %119)
  %121 = tail call float @llvm.fma.f32(float %117, float %115, float %120)
  %122 = fadd float %118, %121
  %123 = fsub float %122, %118
  %124 = fsub float %121, %123
  %125 = fsub float %112, %122
  %126 = fsub float %112, %125
  %127 = fsub float %126, %122
  %128 = fsub float %127, %124
  %129 = fadd float %125, %128
  %130 = fmul float %116, %129
  %131 = fadd float %117, %130
  %132 = fsub float %131, %117
  %133 = fsub float %130, %132
  %134 = fmul float %131, %131
  %135 = fneg float %134
  %136 = tail call float @llvm.fma.f32(float %131, float %131, float %135)
  %137 = fmul float %133, 2.000000e+00
  %138 = tail call float @llvm.fma.f32(float %131, float %137, float %136)
  %139 = fadd float %134, %138
  %140 = fsub float %139, %134
  %141 = fsub float %138, %140
  %142 = tail call float @llvm.fmuladd.f32(float %139, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %143 = tail call float @llvm.fmuladd.f32(float %139, float %142, float 0x3FD999BDE0000000)
  %144 = sitofp i32 %111 to float
  %145 = fmul float %144, 0x3FE62E4300000000
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %144, float 0x3FE62E4300000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %144, float 0xBE205C6100000000, float %147)
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = tail call float @llvm.amdgcn.ldexp.f32(float %131, i32 1)
  %153 = fmul float %131, %139
  %154 = fneg float %153
  %155 = tail call float @llvm.fma.f32(float %139, float %131, float %154)
  %156 = tail call float @llvm.fma.f32(float %139, float %133, float %155)
  %157 = tail call float @llvm.fma.f32(float %141, float %131, float %156)
  %158 = fadd float %153, %157
  %159 = fsub float %158, %153
  %160 = fsub float %157, %159
  %161 = fmul float %139, %143
  %162 = fneg float %161
  %163 = tail call float @llvm.fma.f32(float %139, float %143, float %162)
  %164 = tail call float @llvm.fma.f32(float %141, float %143, float %163)
  %165 = fadd float %161, %164
  %166 = fsub float %165, %161
  %167 = fsub float %164, %166
  %168 = fadd float %165, 0x3FE5555540000000
  %169 = fadd float %168, 0xBFE5555540000000
  %170 = fsub float %165, %169
  %171 = fadd float %167, 0x3E2E720200000000
  %172 = fadd float %171, %170
  %173 = fadd float %168, %172
  %174 = fsub float %173, %168
  %175 = fsub float %172, %174
  %176 = fmul float %158, %173
  %177 = fneg float %176
  %178 = tail call float @llvm.fma.f32(float %158, float %173, float %177)
  %179 = tail call float @llvm.fma.f32(float %158, float %175, float %178)
  %180 = tail call float @llvm.fma.f32(float %160, float %173, float %179)
  %181 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 1)
  %182 = fadd float %176, %180
  %183 = fsub float %182, %176
  %184 = fsub float %180, %183
  %185 = fadd float %152, %182
  %186 = fsub float %185, %152
  %187 = fsub float %182, %186
  %188 = fadd float %181, %184
  %189 = fadd float %188, %187
  %190 = fadd float %185, %189
  %191 = fsub float %190, %185
  %192 = fsub float %189, %191
  %193 = fadd float %149, %190
  %194 = fsub float %193, %149
  %195 = fsub float %193, %194
  %196 = fsub float %149, %195
  %197 = fsub float %190, %194
  %198 = fadd float %197, %196
  %199 = fadd float %151, %192
  %200 = fsub float %199, %151
  %201 = fsub float %199, %200
  %202 = fsub float %151, %201
  %203 = fsub float %192, %200
  %204 = fadd float %203, %202
  %205 = fadd float %199, %198
  %206 = fadd float %193, %205
  %207 = fsub float %206, %193
  %208 = fsub float %205, %207
  %209 = fadd float %204, %208
  %210 = fadd float %206, %209
  %211 = fsub float %210, %206
  %212 = fsub float %209, %211
  %213 = fmul float %210, 2.000000e+00
  %214 = fneg float %213
  %215 = tail call float @llvm.fma.f32(float %210, float 2.000000e+00, float %214)
  %216 = tail call float @llvm.fma.f32(float %212, float 2.000000e+00, float %215)
  %217 = fadd float %213, %216
  %218 = fsub float %217, %213
  %219 = fsub float %216, %218
  %220 = tail call float @llvm.fabs.f32(float %213) #3
  %221 = fcmp oeq float %220, 0x7FF0000000000000
  %222 = select i1 %221, float %213, float %217
  %223 = tail call float @llvm.fabs.f32(float %222) #3
  %224 = fcmp oeq float %223, 0x7FF0000000000000
  %225 = select i1 %224, float 0.000000e+00, float %219
  %226 = fcmp oeq float %222, 0x40562E4300000000
  %227 = select i1 %226, float 0x3EE0000000000000, float 0.000000e+00
  %228 = fsub float %222, %227
  %229 = fadd float %227, %225
  %230 = fmul float %228, 0x3FF7154760000000
  %231 = tail call float @llvm.rint.f32(float %230)
  %232 = fcmp ogt float %228, 0x40562E4300000000
  %233 = fcmp olt float %228, 0xC059D1DA00000000
  %234 = fneg float %230
  %235 = tail call float @llvm.fma.f32(float %228, float 0x3FF7154760000000, float %234)
  %236 = tail call float @llvm.fma.f32(float %228, float 0x3E54AE0BE0000000, float %235)
  %237 = fsub float %230, %231
  %238 = fadd float %236, %237
  %239 = tail call float @llvm.exp2.f32(float %238)
  %240 = fptosi float %231 to i32
  %241 = tail call float @llvm.amdgcn.ldexp.f32(float %239, i32 %240)
  %242 = select i1 %233, float 0.000000e+00, float %241
  %243 = select i1 %232, float 0x7FF0000000000000, float %242
  %244 = tail call float @llvm.fma.f32(float %243, float %229, float %243)
  %245 = tail call float @llvm.fabs.f32(float %243) #3
  %246 = fcmp oeq float %245, 0x7FF0000000000000
  %247 = select i1 %246, float %243, float %244
  %248 = tail call float @llvm.fabs.f32(float %247)
  %249 = fcmp oeq float %105, 0x7FF0000000000000
  %250 = fcmp oeq float %103, 0.000000e+00
  %251 = select i1 %249, float 0x7FF0000000000000, float %248
  %252 = select i1 %250, float 0.000000e+00, float %251
  %253 = fcmp uno float %103, 0.000000e+00
  %254 = select i1 %253, float 0x7FF8000000000000, float %252
  %255 = fcmp oeq float %103, 1.000000e+00
  %256 = select i1 %255, float 1.000000e+00, float %254
  %257 = fsub contract float %104, %256
  %258 = getelementptr inbounds float, float addrspace(1)* %5, i64 %41
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !7, !amdgpu.noclobber !6
  br i1 %44, label %265, label %260

260:                                              ; preds = %96
  %261 = add nsw i32 %39, %35
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %5, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %265

265:                                              ; preds = %260, %96
  %266 = phi contract float [ %264, %260 ], [ 0.000000e+00, %96 ]
  br i1 %52, label %273, label %267

267:                                              ; preds = %265
  %268 = mul nsw i32 %36, %1
  %269 = add nsw i32 %268, %37
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %5, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %273

273:                                              ; preds = %267, %265
  %274 = phi contract float [ %272, %267 ], [ 0.000000e+00, %265 ]
  br i1 %61, label %281, label %275

275:                                              ; preds = %273
  %276 = mul nsw i32 %36, %1
  %277 = add nsw i32 %276, %35
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %5, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %281

281:                                              ; preds = %273, %275
  %282 = phi contract float [ %280, %275 ], [ 0.000000e+00, %273 ]
  %283 = fsub contract float %259, %266
  %284 = fsub contract float %283, %274
  %285 = fadd contract float %284, %282
  %286 = fpext float %285 to double
  %287 = sitofp i32 %21 to double
  %288 = sitofp i32 %7 to double
  %289 = fmul contract double %288, 5.000000e-01
  %290 = fadd contract double %289, %287
  %291 = fpext float %72 to double
  %292 = fmul contract double %290, %291
  %293 = fsub contract double %286, %292
  %294 = fmul contract double %293, 4.000000e+00
  %295 = mul i32 %101, %7
  %296 = sitofp i32 %295 to double
  %297 = fdiv contract double %294, %296
  %298 = fptrunc double %297 to float
  %299 = getelementptr inbounds float, float addrspace(1)* %6, i64 %41
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !7, !amdgpu.noclobber !6
  br i1 %44, label %306, label %301

301:                                              ; preds = %281
  %302 = add nsw i32 %39, %35
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %6, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %306

306:                                              ; preds = %301, %281
  %307 = phi contract float [ %305, %301 ], [ 0.000000e+00, %281 ]
  br i1 %52, label %314, label %308

308:                                              ; preds = %306
  %309 = mul nsw i32 %36, %1
  %310 = add nsw i32 %309, %37
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %6, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %314

314:                                              ; preds = %308, %306
  %315 = phi contract float [ %313, %308 ], [ 0.000000e+00, %306 ]
  br i1 %61, label %322, label %316

316:                                              ; preds = %314
  %317 = mul nsw i32 %36, %1
  %318 = add nsw i32 %317, %35
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %6, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %322

322:                                              ; preds = %314, %316
  %323 = phi contract float [ %321, %316 ], [ 0.000000e+00, %314 ]
  %324 = fsub contract float %300, %307
  %325 = fsub contract float %324, %315
  %326 = fadd contract float %325, %323
  %327 = fpext float %326 to double
  %328 = sitofp i32 %29 to double
  %329 = sitofp i32 %8 to double
  %330 = fmul contract double %329, 5.000000e-01
  %331 = fadd contract double %330, %328
  %332 = fmul contract double %331, %291
  %333 = fsub contract double %327, %332
  %334 = fmul contract double %333, 4.000000e+00
  %335 = mul i32 %101, %8
  %336 = sitofp i32 %335 to double
  %337 = fdiv contract double %334, %336
  %338 = fptrunc double %337 to float
  %339 = load float, float addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !6
  %340 = fsub contract float %339, %103
  %341 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %342 = load float, float addrspace(1)* %341, align 4, !tbaa !7, !amdgpu.noclobber !6
  %343 = fsub contract float %342, %257
  %344 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !7, !amdgpu.noclobber !6
  %346 = fsub contract float %345, %298
  %347 = getelementptr inbounds float, float addrspace(1)* %0, i64 3
  %348 = load float, float addrspace(1)* %347, align 4, !tbaa !7, !amdgpu.noclobber !6
  %349 = fsub contract float %348, %338
  %350 = tail call float @llvm.fabs.f32(float %340)
  %351 = tail call float @llvm.fabs.f32(float %343)
  %352 = tail call float @llvm.fabs.f32(float %346)
  %353 = tail call float @llvm.fabs.f32(float %349)
  %354 = bitcast float %350 to i32
  %355 = bitcast float %351 to i32
  %356 = tail call i32 @llvm.umax.i32(i32 %354, i32 %355)
  %357 = tail call i32 @llvm.umin.i32(i32 %354, i32 %355)
  %358 = bitcast float %352 to i32
  %359 = bitcast float %353 to i32
  %360 = tail call i32 @llvm.umax.i32(i32 %358, i32 %359)
  %361 = tail call i32 @llvm.umin.i32(i32 %358, i32 %359)
  %362 = tail call i32 @llvm.umax.i32(i32 %356, i32 %360)
  %363 = bitcast i32 %362 to float
  %364 = tail call i32 @llvm.umin.i32(i32 %356, i32 %360)
  %365 = tail call i32 @llvm.umax.i32(i32 %357, i32 %361)
  %366 = tail call i32 @llvm.umin.i32(i32 %357, i32 %361)
  %367 = bitcast i32 %366 to float
  %368 = tail call i32 @llvm.umax.i32(i32 %365, i32 %364)
  %369 = bitcast i32 %368 to float
  %370 = tail call i32 @llvm.umin.i32(i32 %365, i32 %364)
  %371 = bitcast i32 %370 to float
  %372 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %363)
  %373 = sub nsw i32 0, %372
  %374 = tail call float @llvm.amdgcn.ldexp.f32(float %363, i32 %373)
  %375 = tail call float @llvm.amdgcn.ldexp.f32(float %369, i32 %373)
  %376 = tail call float @llvm.amdgcn.ldexp.f32(float %371, i32 %373)
  %377 = tail call float @llvm.amdgcn.ldexp.f32(float %367, i32 %373)
  %378 = fmul float %377, %377
  %379 = tail call float @llvm.fmuladd.f32(float %376, float %376, float %378)
  %380 = tail call float @llvm.fmuladd.f32(float %375, float %375, float %379)
  %381 = tail call float @llvm.fmuladd.f32(float %374, float %374, float %380)
  %382 = fcmp oeq float %350, 0x7FF0000000000000
  %383 = fcmp oeq float %351, 0x7FF0000000000000
  %384 = or i1 %382, %383
  %385 = fcmp oeq float %352, 0x7FF0000000000000
  %386 = or i1 %384, %385
  %387 = fcmp oeq float %353, 0x7FF0000000000000
  %388 = or i1 %386, %387
  %389 = tail call float @llvm.sqrt.f32(float %381)
  %390 = tail call float @llvm.amdgcn.ldexp.f32(float %389, i32 %372)
  %391 = select i1 %388, float 0x7FF0000000000000, float %390
  %392 = mul nsw i32 %29, %12
  %393 = add nsw i32 %392, %21
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %9, i64 %394
  store float %391, float addrspace(1)* %395, align 4, !tbaa !7
  br label %396

396:                                              ; preds = %10, %322
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
