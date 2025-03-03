; ModuleID = '../data/hip_kernels/10580/81/main.cu'
source_filename = "../data/hip_kernels/10580/81/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10__ADAGradmiiPfS_S_S_fS_ifS_iS_iS_iffiP12hiprandState(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float %6, float addrspace(1)* nocapture readonly %7, i32 %8, float %9, float addrspace(1)* nocapture readonly %10, i32 %11, float addrspace(1)* nocapture readonly %12, i32 %13, float addrspace(1)* nocapture readonly %14, i32 %15, float %16, float %17, i32 %18, %struct.hiprandState addrspace(1)* nocapture %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !7
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %31 = udiv i32 %29, %26
  %32 = mul i32 %31, %26
  %33 = icmp ugt i32 %29, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %37 = mul i32 %35, %36
  %38 = add i32 %37, %30
  %39 = mul i32 %38, %26
  %40 = add i32 %39, %21
  %41 = mul i32 %35, %26
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 16
  %43 = bitcast i8 addrspace(4)* %42 to i32 addrspace(4)*
  %44 = load i32, i32 addrspace(4)* %43, align 8, !tbaa !16
  %45 = getelementptr i8, i8 addrspace(4)* %22, i64 6
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 2, !range !5, !invariant.load !6
  %48 = zext i16 %47 to i32
  %49 = udiv i32 %44, %48
  %50 = mul i32 %49, %48
  %51 = icmp ugt i32 %44, %50
  %52 = zext i1 %51 to i32
  %53 = add i32 %49, %52
  %54 = mul i32 %41, %53
  %55 = fcmp olt float %9, 0x39F0000000000000
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %56, %9
  %58 = tail call float @llvm.sqrt.f32(float %57)
  %59 = bitcast float %58 to i32
  %60 = add nsw i32 %59, -1
  %61 = bitcast i32 %60 to float
  %62 = add nsw i32 %59, 1
  %63 = bitcast i32 %62 to float
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 608)
  %65 = select i1 %55, float 0x3EF0000000000000, float 1.000000e+00
  %66 = fneg float %63
  %67 = tail call float @llvm.fma.f32(float %66, float %58, float %57)
  %68 = fcmp ogt float %67, 0.000000e+00
  %69 = fneg float %61
  %70 = tail call float @llvm.fma.f32(float %69, float %58, float %57)
  %71 = fcmp ole float %70, 0.000000e+00
  %72 = select i1 %71, float %61, float %58
  %73 = select i1 %68, float %63, float %72
  %74 = fmul float %65, %73
  %75 = select i1 %64, float %57, float %74
  %76 = fsub contract float 1.000000e+00, %9
  %77 = fcmp olt float %76, 0x39F0000000000000
  %78 = select i1 %77, float 0x41F0000000000000, float 1.000000e+00
  %79 = fmul float %76, %78
  %80 = tail call float @llvm.sqrt.f32(float %79)
  %81 = bitcast float %80 to i32
  %82 = add nsw i32 %81, -1
  %83 = bitcast i32 %82 to float
  %84 = add nsw i32 %81, 1
  %85 = bitcast i32 %84 to float
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %79, i32 608)
  %87 = select i1 %77, float 0x3EF0000000000000, float 1.000000e+00
  %88 = fneg float %85
  %89 = tail call float @llvm.fma.f32(float %88, float %80, float %79)
  %90 = fcmp ogt float %89, 0.000000e+00
  %91 = fneg float %83
  %92 = tail call float @llvm.fma.f32(float %91, float %80, float %79)
  %93 = fcmp ole float %92, 0.000000e+00
  %94 = select i1 %93, float %83, float %80
  %95 = select i1 %90, float %85, float %94
  %96 = fmul float %87, %95
  %97 = select i1 %86, float %79, float %96
  %98 = fcmp olt float %17, 0x39F0000000000000
  %99 = select i1 %98, float 0x41F0000000000000, float 1.000000e+00
  %100 = fmul float %99, %17
  %101 = tail call float @llvm.sqrt.f32(float %100)
  %102 = bitcast float %101 to i32
  %103 = add nsw i32 %102, -1
  %104 = bitcast i32 %103 to float
  %105 = add nsw i32 %102, 1
  %106 = bitcast i32 %105 to float
  %107 = sext i32 %40 to i64
  %108 = mul nsw i32 %1, %0
  %109 = icmp slt i32 %40, %108
  br i1 %109, label %110, label %487

110:                                              ; preds = %20
  %111 = tail call i1 @llvm.amdgcn.class.f32(float %100, i32 608)
  %112 = select i1 %98, float 0x3EF0000000000000, float 1.000000e+00
  %113 = fneg float %106
  %114 = tail call float @llvm.fma.f32(float %113, float %101, float %100)
  %115 = fcmp ogt float %114, 0.000000e+00
  %116 = fneg float %104
  %117 = tail call float @llvm.fma.f32(float %116, float %101, float %100)
  %118 = fcmp ole float %117, 0.000000e+00
  %119 = select i1 %118, float %104, float %101
  %120 = select i1 %115, float %106, float %119
  %121 = fmul float %112, %120
  %122 = select i1 %111, float %100, float %121
  %123 = icmp eq i32 %18, 0
  %124 = icmp sgt i32 %11, 1
  %125 = icmp sgt i32 %13, 1
  %126 = icmp sgt i32 %15, 1
  %127 = tail call float @llvm.fabs.f32(float %122)
  %128 = fcmp contract ogt float %16, 0.000000e+00
  %129 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 1
  %130 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 3
  %131 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 5, i64 0
  %132 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 5, i64 1
  %133 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 5, i64 2
  %134 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 5, i64 3
  %135 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 5, i64 4
  %136 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %19, i64 %107, i32 0, i32 0, i32 0
  %137 = icmp sgt i32 %8, 0
  %138 = icmp eq i32 %8, 1
  br label %139

139:                                              ; preds = %110, %484
  %140 = phi i32 [ %40, %110 ], [ %485, %484 ]
  %141 = sdiv i32 %140, %0
  %142 = sext i32 %140 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !17
  %145 = getelementptr inbounds float, float addrspace(1)* %4, i64 %142
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !17
  %147 = fmul contract float %75, %144
  %148 = fmul contract float %97, %146
  %149 = tail call float @llvm.fabs.f32(float %147)
  %150 = tail call float @llvm.fabs.f32(float %148)
  %151 = tail call float @llvm.maxnum.f32(float %149, float %150)
  %152 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %151)
  %153 = sub nsw i32 0, %152
  %154 = tail call float @llvm.amdgcn.ldexp.f32(float %149, i32 %153)
  %155 = tail call float @llvm.amdgcn.ldexp.f32(float %150, i32 %153)
  %156 = fmul float %155, %155
  %157 = tail call float @llvm.fmuladd.f32(float %154, float %154, float %156)
  %158 = tail call float @llvm.sqrt.f32(float %157)
  %159 = tail call float @llvm.amdgcn.ldexp.f32(float %158, i32 %152)
  %160 = tail call float @llvm.fabs.f32(float %151) #3
  %161 = fcmp oeq float %160, 0x7FF0000000000000
  %162 = select i1 %161, float 0x7FF0000000000000, float %159
  store float %162, float addrspace(1)* %145, align 4, !tbaa !17
  br i1 %123, label %484, label %163

163:                                              ; preds = %139
  %164 = mul nsw i32 %141, %0
  %165 = sub nsw i32 %140, %164
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !17
  %168 = sext i32 %165 to i64
  %169 = select i1 %124, i64 %168, i64 0
  %170 = getelementptr float, float addrspace(1)* %10, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !17
  %172 = select i1 %125, i64 %168, i64 0
  %173 = getelementptr float, float addrspace(1)* %12, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !17
  %175 = select i1 %126, i64 %168, i64 0
  %176 = getelementptr float, float addrspace(1)* %14, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !17
  %178 = tail call float @llvm.fabs.f32(float %162)
  %179 = tail call float @llvm.maxnum.f32(float %178, float %127)
  %180 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %179)
  %181 = sub nsw i32 0, %180
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %178, i32 %181)
  %183 = tail call float @llvm.amdgcn.ldexp.f32(float %127, i32 %181)
  %184 = fmul float %183, %183
  %185 = tail call float @llvm.fmuladd.f32(float %182, float %182, float %184)
  %186 = tail call float @llvm.sqrt.f32(float %185)
  %187 = tail call float @llvm.amdgcn.ldexp.f32(float %186, i32 %180)
  %188 = tail call float @llvm.fabs.f32(float %179) #3
  %189 = fcmp oeq float %188, 0x7FF0000000000000
  %190 = select i1 %189, float 0x7FF0000000000000, float %187
  %191 = fcmp contract oeq float %171, 5.000000e-01
  br i1 %191, label %385, label %192

192:                                              ; preds = %163
  %193 = fmul contract float %171, 2.000000e+00
  %194 = tail call float @llvm.fabs.f32(float %190)
  %195 = tail call float @llvm.amdgcn.frexp.mant.f32(float %194)
  %196 = fcmp olt float %195, 0x3FE5555560000000
  %197 = zext i1 %196 to i32
  %198 = tail call float @llvm.amdgcn.ldexp.f32(float %195, i32 %197)
  %199 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %194)
  %200 = sub nsw i32 %199, %197
  %201 = fadd float %198, -1.000000e+00
  %202 = fadd float %198, 1.000000e+00
  %203 = fadd float %202, -1.000000e+00
  %204 = fsub float %198, %203
  %205 = tail call float @llvm.amdgcn.rcp.f32(float %202)
  %206 = fmul float %201, %205
  %207 = fmul float %202, %206
  %208 = fneg float %207
  %209 = tail call float @llvm.fma.f32(float %206, float %202, float %208)
  %210 = tail call float @llvm.fma.f32(float %206, float %204, float %209)
  %211 = fadd float %207, %210
  %212 = fsub float %211, %207
  %213 = fsub float %210, %212
  %214 = fsub float %201, %211
  %215 = fsub float %201, %214
  %216 = fsub float %215, %211
  %217 = fsub float %216, %213
  %218 = fadd float %214, %217
  %219 = fmul float %205, %218
  %220 = fadd float %206, %219
  %221 = fsub float %220, %206
  %222 = fsub float %219, %221
  %223 = fmul float %220, %220
  %224 = fneg float %223
  %225 = tail call float @llvm.fma.f32(float %220, float %220, float %224)
  %226 = fmul float %222, 2.000000e+00
  %227 = tail call float @llvm.fma.f32(float %220, float %226, float %225)
  %228 = fadd float %223, %227
  %229 = fsub float %228, %223
  %230 = fsub float %227, %229
  %231 = tail call float @llvm.fmuladd.f32(float %228, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %232 = tail call float @llvm.fmuladd.f32(float %228, float %231, float 0x3FD999BDE0000000)
  %233 = sitofp i32 %200 to float
  %234 = fmul float %233, 0x3FE62E4300000000
  %235 = fneg float %234
  %236 = tail call float @llvm.fma.f32(float %233, float 0x3FE62E4300000000, float %235)
  %237 = tail call float @llvm.fma.f32(float %233, float 0xBE205C6100000000, float %236)
  %238 = fadd float %234, %237
  %239 = fsub float %238, %234
  %240 = fsub float %237, %239
  %241 = tail call float @llvm.amdgcn.ldexp.f32(float %220, i32 1)
  %242 = fmul float %220, %228
  %243 = fneg float %242
  %244 = tail call float @llvm.fma.f32(float %228, float %220, float %243)
  %245 = tail call float @llvm.fma.f32(float %228, float %222, float %244)
  %246 = tail call float @llvm.fma.f32(float %230, float %220, float %245)
  %247 = fadd float %242, %246
  %248 = fsub float %247, %242
  %249 = fsub float %246, %248
  %250 = fmul float %228, %232
  %251 = fneg float %250
  %252 = tail call float @llvm.fma.f32(float %228, float %232, float %251)
  %253 = tail call float @llvm.fma.f32(float %230, float %232, float %252)
  %254 = fadd float %250, %253
  %255 = fsub float %254, %250
  %256 = fsub float %253, %255
  %257 = fadd float %254, 0x3FE5555540000000
  %258 = fadd float %257, 0xBFE5555540000000
  %259 = fsub float %254, %258
  %260 = fadd float %256, 0x3E2E720200000000
  %261 = fadd float %260, %259
  %262 = fadd float %257, %261
  %263 = fsub float %262, %257
  %264 = fsub float %261, %263
  %265 = fmul float %247, %262
  %266 = fneg float %265
  %267 = tail call float @llvm.fma.f32(float %247, float %262, float %266)
  %268 = tail call float @llvm.fma.f32(float %247, float %264, float %267)
  %269 = tail call float @llvm.fma.f32(float %249, float %262, float %268)
  %270 = tail call float @llvm.amdgcn.ldexp.f32(float %222, i32 1)
  %271 = fadd float %265, %269
  %272 = fsub float %271, %265
  %273 = fsub float %269, %272
  %274 = fadd float %241, %271
  %275 = fsub float %274, %241
  %276 = fsub float %271, %275
  %277 = fadd float %270, %273
  %278 = fadd float %277, %276
  %279 = fadd float %274, %278
  %280 = fsub float %279, %274
  %281 = fsub float %278, %280
  %282 = fadd float %238, %279
  %283 = fsub float %282, %238
  %284 = fsub float %282, %283
  %285 = fsub float %238, %284
  %286 = fsub float %279, %283
  %287 = fadd float %286, %285
  %288 = fadd float %240, %281
  %289 = fsub float %288, %240
  %290 = fsub float %288, %289
  %291 = fsub float %240, %290
  %292 = fsub float %281, %289
  %293 = fadd float %292, %291
  %294 = fadd float %288, %287
  %295 = fadd float %282, %294
  %296 = fsub float %295, %282
  %297 = fsub float %294, %296
  %298 = fadd float %293, %297
  %299 = fadd float %295, %298
  %300 = fsub float %299, %295
  %301 = fsub float %298, %300
  %302 = fmul float %299, %193
  %303 = fneg float %302
  %304 = tail call float @llvm.fma.f32(float %193, float %299, float %303)
  %305 = tail call float @llvm.fma.f32(float %193, float %301, float %304)
  %306 = fadd float %302, %305
  %307 = fsub float %306, %302
  %308 = fsub float %305, %307
  %309 = tail call float @llvm.fabs.f32(float %302) #3
  %310 = fcmp oeq float %309, 0x7FF0000000000000
  %311 = select i1 %310, float %302, float %306
  %312 = tail call float @llvm.fabs.f32(float %311) #3
  %313 = fcmp oeq float %312, 0x7FF0000000000000
  %314 = select i1 %313, float 0.000000e+00, float %308
  %315 = fcmp oeq float %311, 0x40562E4300000000
  %316 = select i1 %315, float 0x3EE0000000000000, float 0.000000e+00
  %317 = fsub float %311, %316
  %318 = fadd float %316, %314
  %319 = fmul float %317, 0x3FF7154760000000
  %320 = tail call float @llvm.rint.f32(float %319)
  %321 = fcmp ogt float %317, 0x40562E4300000000
  %322 = fcmp olt float %317, 0xC059D1DA00000000
  %323 = fneg float %319
  %324 = tail call float @llvm.fma.f32(float %317, float 0x3FF7154760000000, float %323)
  %325 = tail call float @llvm.fma.f32(float %317, float 0x3E54AE0BE0000000, float %324)
  %326 = fsub float %319, %320
  %327 = fadd float %325, %326
  %328 = tail call float @llvm.exp2.f32(float %327)
  %329 = fptosi float %320 to i32
  %330 = tail call float @llvm.amdgcn.ldexp.f32(float %328, i32 %329)
  %331 = select i1 %322, float 0.000000e+00, float %330
  %332 = select i1 %321, float 0x7FF0000000000000, float %331
  %333 = tail call float @llvm.fma.f32(float %332, float %318, float %332)
  %334 = tail call float @llvm.fabs.f32(float %332) #3
  %335 = fcmp oeq float %334, 0x7FF0000000000000
  %336 = select i1 %335, float %332, float %333
  %337 = tail call float @llvm.fabs.f32(float %193)
  %338 = tail call float @llvm.trunc.f32(float %337)
  %339 = fcmp oeq float %337, %338
  %340 = zext i1 %339 to i32
  %341 = fmul float %338, 5.000000e-01
  %342 = tail call float @llvm.amdgcn.fract.f32(float %341)
  %343 = tail call i1 @llvm.amdgcn.class.f32(float %341, i32 516)
  %344 = select i1 %343, float 0.000000e+00, float %342
  %345 = fcmp oeq float %344, 0.000000e+00
  %346 = and i1 %339, %345
  %347 = zext i1 %346 to i32
  %348 = add nuw nsw i32 %347, %340
  %349 = icmp eq i32 %348, 1
  %350 = fcmp olt float %190, 0.000000e+00
  %351 = and i1 %350, %349
  %352 = select i1 %351, float -0.000000e+00, float 0.000000e+00
  %353 = tail call float @llvm.copysign.f32(float %336, float %352)
  %354 = fcmp uge float %190, 0.000000e+00
  %355 = icmp ne i32 %348, 0
  %356 = select i1 %354, i1 true, i1 %355
  %357 = select i1 %356, float %353, float 0x7FF8000000000000
  %358 = fcmp oeq float %337, 0x7FF0000000000000
  br i1 %358, label %359, label %368

359:                                              ; preds = %192
  %360 = fcmp oeq float %194, 1.000000e+00
  %361 = fadd float %194, -1.000000e+00
  %362 = bitcast float %193 to i32
  %363 = bitcast float %361 to i32
  %364 = xor i32 %362, %363
  %365 = icmp sgt i32 %364, -1
  %366 = select i1 %365, float 0x7FF0000000000000, float 0.000000e+00
  %367 = select i1 %360, float %194, float %366
  br label %368

368:                                              ; preds = %192, %359
  %369 = phi float [ %357, %192 ], [ %367, %359 ]
  %370 = fcmp oeq float %194, 0x7FF0000000000000
  %371 = fcmp oeq float %190, 0.000000e+00
  %372 = or i1 %371, %370
  %373 = fcmp olt float %193, 0.000000e+00
  %374 = xor i1 %371, %373
  %375 = select i1 %374, float 0.000000e+00, float 0x7FF0000000000000
  %376 = select i1 %349, float %190, float 0.000000e+00
  %377 = tail call float @llvm.copysign.f32(float %375, float %376)
  %378 = select i1 %372, float %377, float %369
  %379 = fcmp uno float %190, %193
  %380 = select i1 %379, float 0x7FF8000000000000, float %378
  %381 = fcmp oeq float %190, 1.000000e+00
  %382 = fcmp oeq float %193, 0.000000e+00
  %383 = or i1 %381, %382
  %384 = select i1 %383, float 1.000000e+00, float %380
  br label %385

385:                                              ; preds = %163, %368
  %386 = phi contract float [ %384, %368 ], [ %190, %163 ]
  %387 = fdiv contract float %144, %386
  br i1 %128, label %388, label %467

388:                                              ; preds = %385
  %389 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !21
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %393, label %391

391:                                              ; preds = %388
  store i32 0, i32 addrspace(1)* %129, align 4, !tbaa !21
  %392 = load float, float addrspace(1)* %130, align 4, !tbaa !26
  br label %463

393:                                              ; preds = %388
  %394 = load i32, i32 addrspace(1)* %131, align 8, !tbaa !27
  %395 = lshr i32 %394, 2
  %396 = xor i32 %395, %394
  %397 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !27
  %398 = load i32, i32 addrspace(1)* %133, align 8, !tbaa !27
  %399 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !27
  %400 = load i32, i32 addrspace(1)* %135, align 8, !tbaa !27
  %401 = shl i32 %400, 4
  %402 = shl i32 %396, 1
  %403 = xor i32 %402, %401
  %404 = xor i32 %403, %396
  %405 = xor i32 %404, %400
  %406 = load i32, i32 addrspace(1)* %136, align 8, !tbaa !28
  %407 = add i32 %406, 362437
  %408 = add i32 %407, %405
  %409 = lshr i32 %397, 2
  %410 = xor i32 %409, %397
  store i32 %398, i32 addrspace(1)* %131, align 8, !tbaa !27
  store i32 %399, i32 addrspace(1)* %132, align 4, !tbaa !27
  store i32 %400, i32 addrspace(1)* %133, align 8, !tbaa !27
  store i32 %405, i32 addrspace(1)* %134, align 4, !tbaa !27
  %411 = shl i32 %405, 4
  %412 = shl i32 %410, 1
  %413 = xor i32 %412, %411
  %414 = xor i32 %413, %410
  %415 = xor i32 %414, %405
  store i32 %415, i32 addrspace(1)* %135, align 8, !tbaa !27
  %416 = add i32 %406, 724874
  store i32 %416, i32 addrspace(1)* %136, align 8, !tbaa !28
  %417 = add i32 %415, %416
  %418 = uitofp i32 %408 to float
  %419 = fmul contract float %418, 0x3DF0000000000000
  %420 = fadd contract float %419, 0x3DF0000000000000
  %421 = uitofp i32 %417 to float
  %422 = fmul contract float %421, 0x3E1921FB60000000
  %423 = fadd contract float %422, 0x3E1921FB60000000
  %424 = tail call i1 @llvm.amdgcn.class.f32(float %420, i32 144)
  %425 = select i1 %424, float 0x41F0000000000000, float 1.000000e+00
  %426 = fmul float %420, %425
  %427 = tail call float @llvm.log2.f32(float %426)
  %428 = fmul float %427, 0x3FE62E42E0000000
  %429 = tail call i1 @llvm.amdgcn.class.f32(float %427, i32 519)
  %430 = fneg float %428
  %431 = tail call float @llvm.fma.f32(float %427, float 0x3FE62E42E0000000, float %430)
  %432 = tail call float @llvm.fma.f32(float %427, float 0x3E6EFA39E0000000, float %431)
  %433 = fadd float %428, %432
  %434 = select i1 %429, float %427, float %433
  %435 = select i1 %424, float 0x40362E4300000000, float 0.000000e+00
  %436 = fsub float %434, %435
  %437 = fmul contract float %436, -2.000000e+00
  %438 = fcmp olt float %437, 0x39F0000000000000
  %439 = select i1 %438, float 0x41F0000000000000, float 1.000000e+00
  %440 = fmul float %437, %439
  %441 = tail call float @llvm.sqrt.f32(float %440)
  %442 = bitcast float %441 to i32
  %443 = add nsw i32 %442, -1
  %444 = bitcast i32 %443 to float
  %445 = add nsw i32 %442, 1
  %446 = bitcast i32 %445 to float
  %447 = tail call i1 @llvm.amdgcn.class.f32(float %440, i32 608)
  %448 = select i1 %438, float 0x3EF0000000000000, float 1.000000e+00
  %449 = fneg float %446
  %450 = tail call float @llvm.fma.f32(float %449, float %441, float %440)
  %451 = fcmp ogt float %450, 0.000000e+00
  %452 = fneg float %444
  %453 = tail call float @llvm.fma.f32(float %452, float %441, float %440)
  %454 = fcmp ole float %453, 0.000000e+00
  %455 = select i1 %454, float %444, float %441
  %456 = select i1 %451, float %446, float %455
  %457 = fmul float %448, %456
  %458 = select i1 %447, float %440, float %457
  %459 = tail call float @llvm.sin.f32(float %423)
  %460 = tail call float @llvm.cos.f32(float %423)
  %461 = fmul contract float %459, %458
  %462 = fmul contract float %460, %458
  store i32 1, i32 addrspace(1)* %129, align 4, !tbaa !21
  store float %462, float addrspace(1)* %130, align 4, !tbaa !26
  br label %463

463:                                              ; preds = %391, %393
  %464 = phi float [ %392, %391 ], [ %461, %393 ]
  %465 = fmul contract float %464, %16
  %466 = fadd contract float %387, %465
  br label %467

467:                                              ; preds = %463, %385
  %468 = phi float [ %466, %463 ], [ %387, %385 ]
  %469 = fmul contract float %177, %468
  %470 = fmul contract float %174, %469
  %471 = getelementptr inbounds float, float addrspace(1)* %5, i64 %142
  %472 = load float, float addrspace(1)* %471, align 4, !tbaa !17
  %473 = fmul contract float %472, %6
  %474 = fadd contract float %470, %473
  store float %474, float addrspace(1)* %471, align 4, !tbaa !17
  %475 = fadd contract float %167, %474
  br i1 %137, label %476, label %482

476:                                              ; preds = %467
  %477 = sext i32 %141 to i64
  %478 = select i1 %138, i64 %477, i64 %142
  %479 = getelementptr inbounds float, float addrspace(1)* %7, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !17
  %481 = fmul contract float %475, %480
  br label %482

482:                                              ; preds = %476, %467
  %483 = phi float [ %475, %467 ], [ %481, %476 ]
  store float %483, float addrspace(1)* %166, align 4, !tbaa !17
  br label %484

484:                                              ; preds = %139, %482
  %485 = add nsw i32 %140, %54
  %486 = icmp slt i32 %485, %108
  br i1 %486, label %139, label %487, !llvm.loop !29

487:                                              ; preds = %484, %20
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
