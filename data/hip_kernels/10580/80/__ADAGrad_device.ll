; ModuleID = '../data/hip_kernels/10580/80/main.cu'
source_filename = "../data/hip_kernels/10580/80/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9__ADAGradiiPfS_S_S_ifS_iS_iS_iffiP12hiprandState(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, i32 %6, float %7, float addrspace(1)* nocapture readonly %8, i32 %9, float addrspace(1)* nocapture readonly %10, i32 %11, float addrspace(1)* nocapture readonly %12, i32 %13, float %14, float %15, i32 %16, %struct.hiprandState addrspace(1)* nocapture %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !7
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = udiv i32 %27, %24
  %30 = mul i32 %29, %24
  %31 = icmp ugt i32 %27, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %35 = mul i32 %33, %34
  %36 = add i32 %35, %28
  %37 = mul i32 %36, %24
  %38 = add i32 %37, %19
  %39 = mul i32 %33, %24
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 16
  %41 = bitcast i8 addrspace(4)* %40 to i32 addrspace(4)*
  %42 = load i32, i32 addrspace(4)* %41, align 8, !tbaa !16
  %43 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 2, !range !5, !invariant.load !6
  %46 = zext i16 %45 to i32
  %47 = udiv i32 %42, %46
  %48 = mul i32 %47, %46
  %49 = icmp ugt i32 %42, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = mul i32 %39, %51
  %53 = fcmp olt float %7, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %54, %7
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = fsub contract float 1.000000e+00, %7
  %75 = fcmp olt float %74, 0x39F0000000000000
  %76 = select i1 %75, float 0x41F0000000000000, float 1.000000e+00
  %77 = fmul float %74, %76
  %78 = tail call float @llvm.sqrt.f32(float %77)
  %79 = bitcast float %78 to i32
  %80 = add nsw i32 %79, -1
  %81 = bitcast i32 %80 to float
  %82 = add nsw i32 %79, 1
  %83 = bitcast i32 %82 to float
  %84 = tail call i1 @llvm.amdgcn.class.f32(float %77, i32 608)
  %85 = select i1 %75, float 0x3EF0000000000000, float 1.000000e+00
  %86 = fneg float %83
  %87 = tail call float @llvm.fma.f32(float %86, float %78, float %77)
  %88 = fcmp ogt float %87, 0.000000e+00
  %89 = fneg float %81
  %90 = tail call float @llvm.fma.f32(float %89, float %78, float %77)
  %91 = fcmp ole float %90, 0.000000e+00
  %92 = select i1 %91, float %81, float %78
  %93 = select i1 %88, float %83, float %92
  %94 = fmul float %85, %93
  %95 = select i1 %84, float %77, float %94
  %96 = fcmp olt float %15, 0x39F0000000000000
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %97, %15
  %99 = tail call float @llvm.sqrt.f32(float %98)
  %100 = bitcast float %99 to i32
  %101 = add nsw i32 %100, -1
  %102 = bitcast i32 %101 to float
  %103 = add nsw i32 %100, 1
  %104 = bitcast i32 %103 to float
  %105 = sext i32 %38 to i64
  %106 = mul nsw i32 %1, %0
  %107 = icmp slt i32 %38, %106
  br i1 %107, label %108, label %481

108:                                              ; preds = %18
  %109 = tail call i1 @llvm.amdgcn.class.f32(float %98, i32 608)
  %110 = select i1 %96, float 0x3EF0000000000000, float 1.000000e+00
  %111 = fneg float %104
  %112 = tail call float @llvm.fma.f32(float %111, float %99, float %98)
  %113 = fcmp ogt float %112, 0.000000e+00
  %114 = fneg float %102
  %115 = tail call float @llvm.fma.f32(float %114, float %99, float %98)
  %116 = fcmp ole float %115, 0.000000e+00
  %117 = select i1 %116, float %102, float %99
  %118 = select i1 %113, float %104, float %117
  %119 = fmul float %110, %118
  %120 = select i1 %109, float %98, float %119
  %121 = icmp eq i32 %16, 0
  %122 = icmp sgt i32 %9, 1
  %123 = icmp sgt i32 %11, 1
  %124 = icmp sgt i32 %13, 1
  %125 = tail call float @llvm.fabs.f32(float %120)
  %126 = fcmp contract ogt float %14, 0.000000e+00
  %127 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 1
  %128 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 3
  %129 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 5, i64 0
  %130 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 5, i64 1
  %131 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 5, i64 2
  %132 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 5, i64 3
  %133 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 5, i64 4
  %134 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %17, i64 %105, i32 0, i32 0, i32 0
  %135 = icmp sgt i32 %6, 0
  %136 = icmp eq i32 %6, 1
  br label %137

137:                                              ; preds = %108, %478
  %138 = phi i32 [ %38, %108 ], [ %479, %478 ]
  %139 = sdiv i32 %138, %0
  %140 = sext i32 %138 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !17
  %143 = getelementptr inbounds float, float addrspace(1)* %4, i64 %140
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !17
  %145 = fmul contract float %73, %142
  %146 = fmul contract float %95, %144
  %147 = tail call float @llvm.fabs.f32(float %145)
  %148 = tail call float @llvm.fabs.f32(float %146)
  %149 = tail call float @llvm.maxnum.f32(float %147, float %148)
  %150 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %149)
  %151 = sub nsw i32 0, %150
  %152 = tail call float @llvm.amdgcn.ldexp.f32(float %147, i32 %151)
  %153 = tail call float @llvm.amdgcn.ldexp.f32(float %148, i32 %151)
  %154 = fmul float %153, %153
  %155 = tail call float @llvm.fmuladd.f32(float %152, float %152, float %154)
  %156 = tail call float @llvm.sqrt.f32(float %155)
  %157 = tail call float @llvm.amdgcn.ldexp.f32(float %156, i32 %150)
  %158 = tail call float @llvm.fabs.f32(float %149) #3
  %159 = fcmp oeq float %158, 0x7FF0000000000000
  %160 = select i1 %159, float 0x7FF0000000000000, float %157
  store float %160, float addrspace(1)* %143, align 4, !tbaa !17
  br i1 %121, label %478, label %161

161:                                              ; preds = %137
  %162 = mul nsw i32 %139, %0
  %163 = sub nsw i32 %138, %162
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !17
  %166 = sext i32 %163 to i64
  %167 = select i1 %122, i64 %166, i64 0
  %168 = getelementptr float, float addrspace(1)* %8, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !17
  %170 = select i1 %123, i64 %166, i64 0
  %171 = getelementptr float, float addrspace(1)* %10, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !17
  %173 = select i1 %124, i64 %166, i64 0
  %174 = getelementptr float, float addrspace(1)* %12, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !17
  %176 = tail call float @llvm.fabs.f32(float %160)
  %177 = tail call float @llvm.maxnum.f32(float %176, float %125)
  %178 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %177)
  %179 = sub nsw i32 0, %178
  %180 = tail call float @llvm.amdgcn.ldexp.f32(float %176, i32 %179)
  %181 = tail call float @llvm.amdgcn.ldexp.f32(float %125, i32 %179)
  %182 = fmul float %181, %181
  %183 = tail call float @llvm.fmuladd.f32(float %180, float %180, float %182)
  %184 = tail call float @llvm.sqrt.f32(float %183)
  %185 = tail call float @llvm.amdgcn.ldexp.f32(float %184, i32 %178)
  %186 = tail call float @llvm.fabs.f32(float %177) #3
  %187 = fcmp oeq float %186, 0x7FF0000000000000
  %188 = select i1 %187, float 0x7FF0000000000000, float %185
  %189 = fcmp contract oeq float %169, 5.000000e-01
  br i1 %189, label %383, label %190

190:                                              ; preds = %161
  %191 = fmul contract float %169, 2.000000e+00
  %192 = tail call float @llvm.fabs.f32(float %188)
  %193 = tail call float @llvm.amdgcn.frexp.mant.f32(float %192)
  %194 = fcmp olt float %193, 0x3FE5555560000000
  %195 = zext i1 %194 to i32
  %196 = tail call float @llvm.amdgcn.ldexp.f32(float %193, i32 %195)
  %197 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %192)
  %198 = sub nsw i32 %197, %195
  %199 = fadd float %196, -1.000000e+00
  %200 = fadd float %196, 1.000000e+00
  %201 = fadd float %200, -1.000000e+00
  %202 = fsub float %196, %201
  %203 = tail call float @llvm.amdgcn.rcp.f32(float %200)
  %204 = fmul float %199, %203
  %205 = fmul float %200, %204
  %206 = fneg float %205
  %207 = tail call float @llvm.fma.f32(float %204, float %200, float %206)
  %208 = tail call float @llvm.fma.f32(float %204, float %202, float %207)
  %209 = fadd float %205, %208
  %210 = fsub float %209, %205
  %211 = fsub float %208, %210
  %212 = fsub float %199, %209
  %213 = fsub float %199, %212
  %214 = fsub float %213, %209
  %215 = fsub float %214, %211
  %216 = fadd float %212, %215
  %217 = fmul float %203, %216
  %218 = fadd float %204, %217
  %219 = fsub float %218, %204
  %220 = fsub float %217, %219
  %221 = fmul float %218, %218
  %222 = fneg float %221
  %223 = tail call float @llvm.fma.f32(float %218, float %218, float %222)
  %224 = fmul float %220, 2.000000e+00
  %225 = tail call float @llvm.fma.f32(float %218, float %224, float %223)
  %226 = fadd float %221, %225
  %227 = fsub float %226, %221
  %228 = fsub float %225, %227
  %229 = tail call float @llvm.fmuladd.f32(float %226, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %230 = tail call float @llvm.fmuladd.f32(float %226, float %229, float 0x3FD999BDE0000000)
  %231 = sitofp i32 %198 to float
  %232 = fmul float %231, 0x3FE62E4300000000
  %233 = fneg float %232
  %234 = tail call float @llvm.fma.f32(float %231, float 0x3FE62E4300000000, float %233)
  %235 = tail call float @llvm.fma.f32(float %231, float 0xBE205C6100000000, float %234)
  %236 = fadd float %232, %235
  %237 = fsub float %236, %232
  %238 = fsub float %235, %237
  %239 = tail call float @llvm.amdgcn.ldexp.f32(float %218, i32 1)
  %240 = fmul float %218, %226
  %241 = fneg float %240
  %242 = tail call float @llvm.fma.f32(float %226, float %218, float %241)
  %243 = tail call float @llvm.fma.f32(float %226, float %220, float %242)
  %244 = tail call float @llvm.fma.f32(float %228, float %218, float %243)
  %245 = fadd float %240, %244
  %246 = fsub float %245, %240
  %247 = fsub float %244, %246
  %248 = fmul float %226, %230
  %249 = fneg float %248
  %250 = tail call float @llvm.fma.f32(float %226, float %230, float %249)
  %251 = tail call float @llvm.fma.f32(float %228, float %230, float %250)
  %252 = fadd float %248, %251
  %253 = fsub float %252, %248
  %254 = fsub float %251, %253
  %255 = fadd float %252, 0x3FE5555540000000
  %256 = fadd float %255, 0xBFE5555540000000
  %257 = fsub float %252, %256
  %258 = fadd float %254, 0x3E2E720200000000
  %259 = fadd float %258, %257
  %260 = fadd float %255, %259
  %261 = fsub float %260, %255
  %262 = fsub float %259, %261
  %263 = fmul float %245, %260
  %264 = fneg float %263
  %265 = tail call float @llvm.fma.f32(float %245, float %260, float %264)
  %266 = tail call float @llvm.fma.f32(float %245, float %262, float %265)
  %267 = tail call float @llvm.fma.f32(float %247, float %260, float %266)
  %268 = tail call float @llvm.amdgcn.ldexp.f32(float %220, i32 1)
  %269 = fadd float %263, %267
  %270 = fsub float %269, %263
  %271 = fsub float %267, %270
  %272 = fadd float %239, %269
  %273 = fsub float %272, %239
  %274 = fsub float %269, %273
  %275 = fadd float %268, %271
  %276 = fadd float %275, %274
  %277 = fadd float %272, %276
  %278 = fsub float %277, %272
  %279 = fsub float %276, %278
  %280 = fadd float %236, %277
  %281 = fsub float %280, %236
  %282 = fsub float %280, %281
  %283 = fsub float %236, %282
  %284 = fsub float %277, %281
  %285 = fadd float %284, %283
  %286 = fadd float %238, %279
  %287 = fsub float %286, %238
  %288 = fsub float %286, %287
  %289 = fsub float %238, %288
  %290 = fsub float %279, %287
  %291 = fadd float %290, %289
  %292 = fadd float %286, %285
  %293 = fadd float %280, %292
  %294 = fsub float %293, %280
  %295 = fsub float %292, %294
  %296 = fadd float %291, %295
  %297 = fadd float %293, %296
  %298 = fsub float %297, %293
  %299 = fsub float %296, %298
  %300 = fmul float %297, %191
  %301 = fneg float %300
  %302 = tail call float @llvm.fma.f32(float %191, float %297, float %301)
  %303 = tail call float @llvm.fma.f32(float %191, float %299, float %302)
  %304 = fadd float %300, %303
  %305 = fsub float %304, %300
  %306 = fsub float %303, %305
  %307 = tail call float @llvm.fabs.f32(float %300) #3
  %308 = fcmp oeq float %307, 0x7FF0000000000000
  %309 = select i1 %308, float %300, float %304
  %310 = tail call float @llvm.fabs.f32(float %309) #3
  %311 = fcmp oeq float %310, 0x7FF0000000000000
  %312 = select i1 %311, float 0.000000e+00, float %306
  %313 = fcmp oeq float %309, 0x40562E4300000000
  %314 = select i1 %313, float 0x3EE0000000000000, float 0.000000e+00
  %315 = fsub float %309, %314
  %316 = fadd float %314, %312
  %317 = fmul float %315, 0x3FF7154760000000
  %318 = tail call float @llvm.rint.f32(float %317)
  %319 = fcmp ogt float %315, 0x40562E4300000000
  %320 = fcmp olt float %315, 0xC059D1DA00000000
  %321 = fneg float %317
  %322 = tail call float @llvm.fma.f32(float %315, float 0x3FF7154760000000, float %321)
  %323 = tail call float @llvm.fma.f32(float %315, float 0x3E54AE0BE0000000, float %322)
  %324 = fsub float %317, %318
  %325 = fadd float %323, %324
  %326 = tail call float @llvm.exp2.f32(float %325)
  %327 = fptosi float %318 to i32
  %328 = tail call float @llvm.amdgcn.ldexp.f32(float %326, i32 %327)
  %329 = select i1 %320, float 0.000000e+00, float %328
  %330 = select i1 %319, float 0x7FF0000000000000, float %329
  %331 = tail call float @llvm.fma.f32(float %330, float %316, float %330)
  %332 = tail call float @llvm.fabs.f32(float %330) #3
  %333 = fcmp oeq float %332, 0x7FF0000000000000
  %334 = select i1 %333, float %330, float %331
  %335 = tail call float @llvm.fabs.f32(float %191)
  %336 = tail call float @llvm.trunc.f32(float %335)
  %337 = fcmp oeq float %335, %336
  %338 = zext i1 %337 to i32
  %339 = fmul float %336, 5.000000e-01
  %340 = tail call float @llvm.amdgcn.fract.f32(float %339)
  %341 = tail call i1 @llvm.amdgcn.class.f32(float %339, i32 516)
  %342 = select i1 %341, float 0.000000e+00, float %340
  %343 = fcmp oeq float %342, 0.000000e+00
  %344 = and i1 %337, %343
  %345 = zext i1 %344 to i32
  %346 = add nuw nsw i32 %345, %338
  %347 = icmp eq i32 %346, 1
  %348 = fcmp olt float %188, 0.000000e+00
  %349 = and i1 %348, %347
  %350 = select i1 %349, float -0.000000e+00, float 0.000000e+00
  %351 = tail call float @llvm.copysign.f32(float %334, float %350)
  %352 = fcmp uge float %188, 0.000000e+00
  %353 = icmp ne i32 %346, 0
  %354 = select i1 %352, i1 true, i1 %353
  %355 = select i1 %354, float %351, float 0x7FF8000000000000
  %356 = fcmp oeq float %335, 0x7FF0000000000000
  br i1 %356, label %357, label %366

357:                                              ; preds = %190
  %358 = fcmp oeq float %192, 1.000000e+00
  %359 = fadd float %192, -1.000000e+00
  %360 = bitcast float %191 to i32
  %361 = bitcast float %359 to i32
  %362 = xor i32 %360, %361
  %363 = icmp sgt i32 %362, -1
  %364 = select i1 %363, float 0x7FF0000000000000, float 0.000000e+00
  %365 = select i1 %358, float %192, float %364
  br label %366

366:                                              ; preds = %190, %357
  %367 = phi float [ %355, %190 ], [ %365, %357 ]
  %368 = fcmp oeq float %192, 0x7FF0000000000000
  %369 = fcmp oeq float %188, 0.000000e+00
  %370 = or i1 %369, %368
  %371 = fcmp olt float %191, 0.000000e+00
  %372 = xor i1 %369, %371
  %373 = select i1 %372, float 0.000000e+00, float 0x7FF0000000000000
  %374 = select i1 %347, float %188, float 0.000000e+00
  %375 = tail call float @llvm.copysign.f32(float %373, float %374)
  %376 = select i1 %370, float %375, float %367
  %377 = fcmp uno float %188, %191
  %378 = select i1 %377, float 0x7FF8000000000000, float %376
  %379 = fcmp oeq float %188, 1.000000e+00
  %380 = fcmp oeq float %191, 0.000000e+00
  %381 = or i1 %379, %380
  %382 = select i1 %381, float 1.000000e+00, float %378
  br label %383

383:                                              ; preds = %161, %366
  %384 = phi contract float [ %382, %366 ], [ %188, %161 ]
  %385 = fdiv contract float %142, %384
  br i1 %126, label %386, label %465

386:                                              ; preds = %383
  %387 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !21
  %388 = icmp eq i32 %387, 0
  br i1 %388, label %391, label %389

389:                                              ; preds = %386
  store i32 0, i32 addrspace(1)* %127, align 4, !tbaa !21
  %390 = load float, float addrspace(1)* %128, align 4, !tbaa !26
  br label %461

391:                                              ; preds = %386
  %392 = load i32, i32 addrspace(1)* %129, align 8, !tbaa !27
  %393 = lshr i32 %392, 2
  %394 = xor i32 %393, %392
  %395 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !27
  %396 = load i32, i32 addrspace(1)* %131, align 8, !tbaa !27
  %397 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !27
  %398 = load i32, i32 addrspace(1)* %133, align 8, !tbaa !27
  %399 = shl i32 %398, 4
  %400 = shl i32 %394, 1
  %401 = xor i32 %400, %399
  %402 = xor i32 %401, %394
  %403 = xor i32 %402, %398
  %404 = load i32, i32 addrspace(1)* %134, align 8, !tbaa !28
  %405 = add i32 %404, 362437
  %406 = add i32 %405, %403
  %407 = lshr i32 %395, 2
  %408 = xor i32 %407, %395
  store i32 %396, i32 addrspace(1)* %129, align 8, !tbaa !27
  store i32 %397, i32 addrspace(1)* %130, align 4, !tbaa !27
  store i32 %398, i32 addrspace(1)* %131, align 8, !tbaa !27
  store i32 %403, i32 addrspace(1)* %132, align 4, !tbaa !27
  %409 = shl i32 %403, 4
  %410 = shl i32 %408, 1
  %411 = xor i32 %410, %409
  %412 = xor i32 %411, %408
  %413 = xor i32 %412, %403
  store i32 %413, i32 addrspace(1)* %133, align 8, !tbaa !27
  %414 = add i32 %404, 724874
  store i32 %414, i32 addrspace(1)* %134, align 8, !tbaa !28
  %415 = add i32 %413, %414
  %416 = uitofp i32 %406 to float
  %417 = fmul contract float %416, 0x3DF0000000000000
  %418 = fadd contract float %417, 0x3DF0000000000000
  %419 = uitofp i32 %415 to float
  %420 = fmul contract float %419, 0x3E1921FB60000000
  %421 = fadd contract float %420, 0x3E1921FB60000000
  %422 = tail call i1 @llvm.amdgcn.class.f32(float %418, i32 144)
  %423 = select i1 %422, float 0x41F0000000000000, float 1.000000e+00
  %424 = fmul float %418, %423
  %425 = tail call float @llvm.log2.f32(float %424)
  %426 = fmul float %425, 0x3FE62E42E0000000
  %427 = tail call i1 @llvm.amdgcn.class.f32(float %425, i32 519)
  %428 = fneg float %426
  %429 = tail call float @llvm.fma.f32(float %425, float 0x3FE62E42E0000000, float %428)
  %430 = tail call float @llvm.fma.f32(float %425, float 0x3E6EFA39E0000000, float %429)
  %431 = fadd float %426, %430
  %432 = select i1 %427, float %425, float %431
  %433 = select i1 %422, float 0x40362E4300000000, float 0.000000e+00
  %434 = fsub float %432, %433
  %435 = fmul contract float %434, -2.000000e+00
  %436 = fcmp olt float %435, 0x39F0000000000000
  %437 = select i1 %436, float 0x41F0000000000000, float 1.000000e+00
  %438 = fmul float %435, %437
  %439 = tail call float @llvm.sqrt.f32(float %438)
  %440 = bitcast float %439 to i32
  %441 = add nsw i32 %440, -1
  %442 = bitcast i32 %441 to float
  %443 = add nsw i32 %440, 1
  %444 = bitcast i32 %443 to float
  %445 = tail call i1 @llvm.amdgcn.class.f32(float %438, i32 608)
  %446 = select i1 %436, float 0x3EF0000000000000, float 1.000000e+00
  %447 = fneg float %444
  %448 = tail call float @llvm.fma.f32(float %447, float %439, float %438)
  %449 = fcmp ogt float %448, 0.000000e+00
  %450 = fneg float %442
  %451 = tail call float @llvm.fma.f32(float %450, float %439, float %438)
  %452 = fcmp ole float %451, 0.000000e+00
  %453 = select i1 %452, float %442, float %439
  %454 = select i1 %449, float %444, float %453
  %455 = fmul float %446, %454
  %456 = select i1 %445, float %438, float %455
  %457 = tail call float @llvm.sin.f32(float %421)
  %458 = tail call float @llvm.cos.f32(float %421)
  %459 = fmul contract float %457, %456
  %460 = fmul contract float %458, %456
  store i32 1, i32 addrspace(1)* %127, align 4, !tbaa !21
  store float %460, float addrspace(1)* %128, align 4, !tbaa !26
  br label %461

461:                                              ; preds = %389, %391
  %462 = phi float [ %390, %389 ], [ %459, %391 ]
  %463 = fmul contract float %462, %14
  %464 = fadd contract float %385, %463
  br label %465

465:                                              ; preds = %461, %383
  %466 = phi float [ %464, %461 ], [ %385, %383 ]
  %467 = fmul contract float %175, %466
  %468 = fmul contract float %172, %467
  %469 = fadd contract float %165, %468
  br i1 %135, label %470, label %476

470:                                              ; preds = %465
  %471 = sext i32 %139 to i64
  %472 = select i1 %136, i64 %471, i64 %140
  %473 = getelementptr inbounds float, float addrspace(1)* %5, i64 %472
  %474 = load float, float addrspace(1)* %473, align 4, !tbaa !17
  %475 = fmul contract float %469, %474
  br label %476

476:                                              ; preds = %470, %465
  %477 = phi float [ %469, %465 ], [ %475, %470 ]
  store float %477, float addrspace(1)* %164, align 4, !tbaa !17
  br label %478

478:                                              ; preds = %137, %476
  %479 = add nsw i32 %138, %52
  %480 = icmp slt i32 %479, %106
  br i1 %480, label %137, label %481, !llvm.loop !29

481:                                              ; preds = %478, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.cos.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !24, i64 4}
!22 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !23, i64 0}
!23 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !24, i64 0, !24, i64 4, !24, i64 8, !18, i64 12, !25, i64 16, !19, i64 24}
!24 = !{!"int", !19, i64 0}
!25 = !{!"double", !19, i64 0}
!26 = !{!22, !18, i64 12}
!27 = !{!24, !24, i64 0}
!28 = !{!22, !24, i64 0}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.mustprogress"}
