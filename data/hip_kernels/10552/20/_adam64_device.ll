; ModuleID = '../data/hip_kernels/10552/20/main.cu'
source_filename = "../data/hip_kernels/10552/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7_adam64iidddPdS_S_(i32 %0, i32 %1, double %2, double %3, double %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = mul i32 %10, %15
  %20 = add i32 %19, %9
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %473

22:                                               ; preds = %8
  %23 = fsub contract double 1.000000e+00, %3
  %24 = fsub contract double 1.000000e+00, %4
  %25 = sitofp i32 %1 to double
  %26 = tail call double @llvm.fabs.f64(double %3)
  %27 = tail call double @llvm.amdgcn.frexp.mant.f64(double %26)
  %28 = fcmp olt double %27, 0x3FE5555555555555
  %29 = zext i1 %28 to i32
  %30 = tail call double @llvm.amdgcn.ldexp.f64(double %27, i32 %29)
  %31 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %26)
  %32 = sub nsw i32 %31, %29
  %33 = fadd double %30, -1.000000e+00
  %34 = fadd double %30, 1.000000e+00
  %35 = fadd double %34, -1.000000e+00
  %36 = fsub double %30, %35
  %37 = tail call double @llvm.amdgcn.rcp.f64(double %34)
  %38 = fneg double %34
  %39 = tail call double @llvm.fma.f64(double %38, double %37, double 1.000000e+00)
  %40 = tail call double @llvm.fma.f64(double %39, double %37, double %37)
  %41 = tail call double @llvm.fma.f64(double %38, double %40, double 1.000000e+00)
  %42 = tail call double @llvm.fma.f64(double %41, double %40, double %40)
  %43 = fmul double %33, %42
  %44 = fmul double %34, %43
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %43, double %34, double %45)
  %47 = tail call double @llvm.fma.f64(double %43, double %36, double %46)
  %48 = fadd double %44, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %49
  %51 = fsub double %33, %48
  %52 = fsub double %33, %51
  %53 = fsub double %52, %48
  %54 = fsub double %53, %50
  %55 = fadd double %51, %54
  %56 = fmul double %42, %55
  %57 = fadd double %43, %56
  %58 = fsub double %57, %43
  %59 = fsub double %56, %58
  %60 = fmul double %57, %57
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %57, double %57, double %61)
  %63 = fmul double %59, 2.000000e+00
  %64 = tail call double @llvm.fma.f64(double %57, double %63, double %62)
  %65 = fadd double %60, %64
  %66 = fsub double %65, %60
  %67 = fsub double %64, %66
  %68 = tail call double @llvm.fma.f64(double %65, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %69 = tail call double @llvm.fma.f64(double %65, double %68, double 0x3FBE25E43ABE935A)
  %70 = tail call double @llvm.fma.f64(double %65, double %69, double 0x3FC110EF47E6C9C2)
  %71 = tail call double @llvm.fma.f64(double %65, double %70, double 0x3FC3B13BCFA74449)
  %72 = tail call double @llvm.fma.f64(double %65, double %71, double 0x3FC745D171BF3C30)
  %73 = tail call double @llvm.fma.f64(double %65, double %72, double 0x3FCC71C71C7792CE)
  %74 = tail call double @llvm.fma.f64(double %65, double %73, double 0x3FD24924924920DA)
  %75 = tail call double @llvm.fma.f64(double %65, double %74, double 0x3FD999999999999C)
  %76 = sitofp i32 %32 to double
  %77 = fmul double %76, 0x3FE62E42FEFA39EF
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %76, double 0x3FE62E42FEFA39EF, double %78)
  %80 = tail call double @llvm.fma.f64(double %76, double 0x3C7ABC9E3B39803F, double %79)
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = tail call double @llvm.amdgcn.ldexp.f64(double %57, i32 1)
  %85 = tail call double @llvm.amdgcn.ldexp.f64(double %59, i32 1)
  %86 = fmul double %57, %65
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %65, double %57, double %87)
  %89 = tail call double @llvm.fma.f64(double %65, double %59, double %88)
  %90 = tail call double @llvm.fma.f64(double %67, double %57, double %89)
  %91 = fadd double %86, %90
  %92 = fsub double %91, %86
  %93 = fsub double %90, %92
  %94 = fmul double %65, %75
  %95 = fneg double %94
  %96 = tail call double @llvm.fma.f64(double %65, double %75, double %95)
  %97 = tail call double @llvm.fma.f64(double %67, double %75, double %96)
  %98 = fadd double %94, %97
  %99 = fsub double %98, %94
  %100 = fsub double %97, %99
  %101 = fadd double %98, 0x3FE5555555555555
  %102 = fadd double %101, 0xBFE5555555555555
  %103 = fsub double %98, %102
  %104 = fadd double %100, 0x3C8543B0D5DF274D
  %105 = fadd double %104, %103
  %106 = fadd double %101, %105
  %107 = fsub double %106, %101
  %108 = fsub double %105, %107
  %109 = fmul double %91, %106
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %91, double %106, double %110)
  %112 = tail call double @llvm.fma.f64(double %91, double %108, double %111)
  %113 = tail call double @llvm.fma.f64(double %93, double %106, double %112)
  %114 = fadd double %109, %113
  %115 = fsub double %114, %109
  %116 = fsub double %113, %115
  %117 = fadd double %84, %114
  %118 = fsub double %117, %84
  %119 = fsub double %114, %118
  %120 = fadd double %85, %116
  %121 = fadd double %120, %119
  %122 = fadd double %117, %121
  %123 = fsub double %122, %117
  %124 = fsub double %121, %123
  %125 = fadd double %81, %122
  %126 = fsub double %125, %81
  %127 = fsub double %125, %126
  %128 = fsub double %81, %127
  %129 = fsub double %122, %126
  %130 = fadd double %129, %128
  %131 = fadd double %83, %124
  %132 = fsub double %131, %83
  %133 = fsub double %131, %132
  %134 = fsub double %83, %133
  %135 = fsub double %124, %132
  %136 = fadd double %135, %134
  %137 = fadd double %131, %130
  %138 = fadd double %125, %137
  %139 = fsub double %138, %125
  %140 = fsub double %137, %139
  %141 = fadd double %136, %140
  %142 = fadd double %138, %141
  %143 = fsub double %142, %138
  %144 = fsub double %141, %143
  %145 = fmul double %142, %25
  %146 = fneg double %145
  %147 = tail call double @llvm.fma.f64(double %25, double %142, double %146)
  %148 = tail call double @llvm.fma.f64(double %25, double %144, double %147)
  %149 = fadd double %145, %148
  %150 = fsub double %149, %145
  %151 = fsub double %148, %150
  %152 = tail call double @llvm.fabs.f64(double %145) #3
  %153 = fcmp oeq double %152, 0x7FF0000000000000
  %154 = select i1 %153, double %145, double %149
  %155 = tail call double @llvm.fabs.f64(double %154) #3
  %156 = fcmp oeq double %155, 0x7FF0000000000000
  %157 = select i1 %156, double 0.000000e+00, double %151
  %158 = fmul double %154, 0x3FF71547652B82FE
  %159 = tail call double @llvm.rint.f64(double %158)
  %160 = fneg double %159
  %161 = tail call double @llvm.fma.f64(double %160, double 0x3FE62E42FEFA39EF, double %154)
  %162 = tail call double @llvm.fma.f64(double %160, double 0x3C7ABC9E3B39803F, double %161)
  %163 = tail call double @llvm.fma.f64(double %162, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %164 = tail call double @llvm.fma.f64(double %162, double %163, double 0x3EC71DEE623FDE64)
  %165 = tail call double @llvm.fma.f64(double %162, double %164, double 0x3EFA01997C89E6B0)
  %166 = tail call double @llvm.fma.f64(double %162, double %165, double 0x3F2A01A014761F6E)
  %167 = tail call double @llvm.fma.f64(double %162, double %166, double 0x3F56C16C1852B7B0)
  %168 = tail call double @llvm.fma.f64(double %162, double %167, double 0x3F81111111122322)
  %169 = tail call double @llvm.fma.f64(double %162, double %168, double 0x3FA55555555502A1)
  %170 = tail call double @llvm.fma.f64(double %162, double %169, double 0x3FC5555555555511)
  %171 = tail call double @llvm.fma.f64(double %162, double %170, double 0x3FE000000000000B)
  %172 = tail call double @llvm.fma.f64(double %162, double %171, double 1.000000e+00)
  %173 = tail call double @llvm.fma.f64(double %162, double %172, double 1.000000e+00)
  %174 = fptosi double %159 to i32
  %175 = tail call double @llvm.amdgcn.ldexp.f64(double %173, i32 %174)
  %176 = fcmp ogt double %154, 1.024000e+03
  %177 = select i1 %176, double 0x7FF0000000000000, double %175
  %178 = fcmp olt double %154, -1.075000e+03
  %179 = select i1 %178, double 0.000000e+00, double %177
  %180 = tail call double @llvm.fma.f64(double %179, double %157, double %179)
  %181 = tail call double @llvm.fabs.f64(double %179) #3
  %182 = fcmp oeq double %181, 0x7FF0000000000000
  %183 = select i1 %182, double %179, double %180
  %184 = tail call double @llvm.fabs.f64(double %25)
  %185 = tail call double @llvm.trunc.f64(double %184)
  %186 = fcmp oeq double %184, %185
  %187 = zext i1 %186 to i32
  %188 = fmul double %185, 5.000000e-01
  %189 = tail call double @llvm.amdgcn.fract.f64(double %188)
  %190 = tail call i1 @llvm.amdgcn.class.f64(double %188, i32 516)
  %191 = select i1 %190, double 0.000000e+00, double %189
  %192 = fcmp oeq double %191, 0.000000e+00
  %193 = and i1 %186, %192
  %194 = zext i1 %193 to i32
  %195 = add nuw nsw i32 %194, %187
  %196 = icmp eq i32 %195, 1
  %197 = fcmp olt double %3, 0.000000e+00
  %198 = and i1 %197, %196
  %199 = select i1 %198, double -0.000000e+00, double 0.000000e+00
  %200 = tail call double @llvm.copysign.f64(double %183, double %199)
  %201 = fcmp uge double %3, 0.000000e+00
  %202 = icmp ne i32 %195, 0
  %203 = select i1 %201, i1 true, i1 %202
  %204 = select i1 %203, double %200, double 0x7FF8000000000000
  %205 = fcmp oeq double %184, 0x7FF0000000000000
  %206 = fcmp oeq double %26, 1.000000e+00
  %207 = fadd double %26, -1.000000e+00
  %208 = bitcast double %25 to <2 x i32>
  %209 = extractelement <2 x i32> %208, i64 1
  %210 = bitcast double %207 to <2 x i32>
  %211 = extractelement <2 x i32> %210, i64 1
  %212 = xor i32 %211, %209
  %213 = icmp sgt i32 %212, -1
  %214 = select i1 %213, double 0x7FF0000000000000, double 0.000000e+00
  %215 = select i1 %206, double %26, double %214
  %216 = select i1 %205, double %215, double %204
  %217 = fcmp oeq double %26, 0x7FF0000000000000
  %218 = fcmp oeq double %3, 0.000000e+00
  %219 = or i1 %218, %217
  %220 = icmp slt i32 %1, 0
  %221 = xor i1 %220, %218
  %222 = select i1 %221, double 0.000000e+00, double 0x7FF0000000000000
  %223 = select i1 %196, double %3, double 0.000000e+00
  %224 = tail call double @llvm.copysign.f64(double %222, double %223)
  %225 = select i1 %219, double %224, double %216
  %226 = fcmp uno double %3, 0.000000e+00
  %227 = fcmp oeq double %3, 1.000000e+00
  %228 = icmp eq i32 %1, 0
  %229 = or i1 %228, %227
  %230 = fsub contract double 1.000000e+00, %225
  %231 = select i1 %226, double 0x7FF8000000000000, double %230
  %232 = select i1 %229, double 0.000000e+00, double %231
  %233 = tail call double @llvm.fabs.f64(double %4)
  %234 = tail call double @llvm.amdgcn.frexp.mant.f64(double %233)
  %235 = fcmp olt double %234, 0x3FE5555555555555
  %236 = zext i1 %235 to i32
  %237 = tail call double @llvm.amdgcn.ldexp.f64(double %234, i32 %236)
  %238 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %233)
  %239 = sub nsw i32 %238, %236
  %240 = fadd double %237, -1.000000e+00
  %241 = fadd double %237, 1.000000e+00
  %242 = fadd double %241, -1.000000e+00
  %243 = fsub double %237, %242
  %244 = tail call double @llvm.amdgcn.rcp.f64(double %241)
  %245 = fneg double %241
  %246 = tail call double @llvm.fma.f64(double %245, double %244, double 1.000000e+00)
  %247 = tail call double @llvm.fma.f64(double %246, double %244, double %244)
  %248 = tail call double @llvm.fma.f64(double %245, double %247, double 1.000000e+00)
  %249 = tail call double @llvm.fma.f64(double %248, double %247, double %247)
  %250 = fmul double %240, %249
  %251 = fmul double %241, %250
  %252 = fneg double %251
  %253 = tail call double @llvm.fma.f64(double %250, double %241, double %252)
  %254 = tail call double @llvm.fma.f64(double %250, double %243, double %253)
  %255 = fadd double %251, %254
  %256 = fsub double %255, %251
  %257 = fsub double %254, %256
  %258 = fsub double %240, %255
  %259 = fsub double %240, %258
  %260 = fsub double %259, %255
  %261 = fsub double %260, %257
  %262 = fadd double %258, %261
  %263 = fmul double %249, %262
  %264 = fadd double %250, %263
  %265 = fsub double %264, %250
  %266 = fsub double %263, %265
  %267 = fmul double %264, %264
  %268 = fneg double %267
  %269 = tail call double @llvm.fma.f64(double %264, double %264, double %268)
  %270 = fmul double %266, 2.000000e+00
  %271 = tail call double @llvm.fma.f64(double %264, double %270, double %269)
  %272 = fadd double %267, %271
  %273 = fsub double %272, %267
  %274 = fsub double %271, %273
  %275 = tail call double @llvm.fma.f64(double %272, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %276 = tail call double @llvm.fma.f64(double %272, double %275, double 0x3FBE25E43ABE935A)
  %277 = tail call double @llvm.fma.f64(double %272, double %276, double 0x3FC110EF47E6C9C2)
  %278 = tail call double @llvm.fma.f64(double %272, double %277, double 0x3FC3B13BCFA74449)
  %279 = tail call double @llvm.fma.f64(double %272, double %278, double 0x3FC745D171BF3C30)
  %280 = tail call double @llvm.fma.f64(double %272, double %279, double 0x3FCC71C71C7792CE)
  %281 = tail call double @llvm.fma.f64(double %272, double %280, double 0x3FD24924924920DA)
  %282 = tail call double @llvm.fma.f64(double %272, double %281, double 0x3FD999999999999C)
  %283 = sitofp i32 %239 to double
  %284 = fmul double %283, 0x3FE62E42FEFA39EF
  %285 = fneg double %284
  %286 = tail call double @llvm.fma.f64(double %283, double 0x3FE62E42FEFA39EF, double %285)
  %287 = tail call double @llvm.fma.f64(double %283, double 0x3C7ABC9E3B39803F, double %286)
  %288 = fadd double %284, %287
  %289 = fsub double %288, %284
  %290 = fsub double %287, %289
  %291 = tail call double @llvm.amdgcn.ldexp.f64(double %264, i32 1)
  %292 = tail call double @llvm.amdgcn.ldexp.f64(double %266, i32 1)
  %293 = fmul double %264, %272
  %294 = fneg double %293
  %295 = tail call double @llvm.fma.f64(double %272, double %264, double %294)
  %296 = tail call double @llvm.fma.f64(double %272, double %266, double %295)
  %297 = tail call double @llvm.fma.f64(double %274, double %264, double %296)
  %298 = fadd double %293, %297
  %299 = fsub double %298, %293
  %300 = fsub double %297, %299
  %301 = fmul double %272, %282
  %302 = fneg double %301
  %303 = tail call double @llvm.fma.f64(double %272, double %282, double %302)
  %304 = tail call double @llvm.fma.f64(double %274, double %282, double %303)
  %305 = fadd double %301, %304
  %306 = fsub double %305, %301
  %307 = fsub double %304, %306
  %308 = fadd double %305, 0x3FE5555555555555
  %309 = fadd double %308, 0xBFE5555555555555
  %310 = fsub double %305, %309
  %311 = fadd double %307, 0x3C8543B0D5DF274D
  %312 = fadd double %311, %310
  %313 = fadd double %308, %312
  %314 = fsub double %313, %308
  %315 = fsub double %312, %314
  %316 = fmul double %298, %313
  %317 = fneg double %316
  %318 = tail call double @llvm.fma.f64(double %298, double %313, double %317)
  %319 = tail call double @llvm.fma.f64(double %298, double %315, double %318)
  %320 = tail call double @llvm.fma.f64(double %300, double %313, double %319)
  %321 = fadd double %316, %320
  %322 = fsub double %321, %316
  %323 = fsub double %320, %322
  %324 = fadd double %291, %321
  %325 = fsub double %324, %291
  %326 = fsub double %321, %325
  %327 = fadd double %292, %323
  %328 = fadd double %327, %326
  %329 = fadd double %324, %328
  %330 = fsub double %329, %324
  %331 = fsub double %328, %330
  %332 = fadd double %288, %329
  %333 = fsub double %332, %288
  %334 = fsub double %332, %333
  %335 = fsub double %288, %334
  %336 = fsub double %329, %333
  %337 = fadd double %336, %335
  %338 = fadd double %290, %331
  %339 = fsub double %338, %290
  %340 = fsub double %338, %339
  %341 = fsub double %290, %340
  %342 = fsub double %331, %339
  %343 = fadd double %342, %341
  %344 = fadd double %338, %337
  %345 = fadd double %332, %344
  %346 = fsub double %345, %332
  %347 = fsub double %344, %346
  %348 = fadd double %343, %347
  %349 = fadd double %345, %348
  %350 = fsub double %349, %345
  %351 = fsub double %348, %350
  %352 = fmul double %349, %25
  %353 = fneg double %352
  %354 = tail call double @llvm.fma.f64(double %25, double %349, double %353)
  %355 = tail call double @llvm.fma.f64(double %25, double %351, double %354)
  %356 = fadd double %352, %355
  %357 = fsub double %356, %352
  %358 = fsub double %355, %357
  %359 = tail call double @llvm.fabs.f64(double %352) #3
  %360 = fcmp oeq double %359, 0x7FF0000000000000
  %361 = select i1 %360, double %352, double %356
  %362 = tail call double @llvm.fabs.f64(double %361) #3
  %363 = fcmp oeq double %362, 0x7FF0000000000000
  %364 = select i1 %363, double 0.000000e+00, double %358
  %365 = fmul double %361, 0x3FF71547652B82FE
  %366 = tail call double @llvm.rint.f64(double %365)
  %367 = fneg double %366
  %368 = tail call double @llvm.fma.f64(double %367, double 0x3FE62E42FEFA39EF, double %361)
  %369 = tail call double @llvm.fma.f64(double %367, double 0x3C7ABC9E3B39803F, double %368)
  %370 = tail call double @llvm.fma.f64(double %369, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %371 = tail call double @llvm.fma.f64(double %369, double %370, double 0x3EC71DEE623FDE64)
  %372 = tail call double @llvm.fma.f64(double %369, double %371, double 0x3EFA01997C89E6B0)
  %373 = tail call double @llvm.fma.f64(double %369, double %372, double 0x3F2A01A014761F6E)
  %374 = tail call double @llvm.fma.f64(double %369, double %373, double 0x3F56C16C1852B7B0)
  %375 = tail call double @llvm.fma.f64(double %369, double %374, double 0x3F81111111122322)
  %376 = tail call double @llvm.fma.f64(double %369, double %375, double 0x3FA55555555502A1)
  %377 = tail call double @llvm.fma.f64(double %369, double %376, double 0x3FC5555555555511)
  %378 = tail call double @llvm.fma.f64(double %369, double %377, double 0x3FE000000000000B)
  %379 = tail call double @llvm.fma.f64(double %369, double %378, double 1.000000e+00)
  %380 = tail call double @llvm.fma.f64(double %369, double %379, double 1.000000e+00)
  %381 = fptosi double %366 to i32
  %382 = tail call double @llvm.amdgcn.ldexp.f64(double %380, i32 %381)
  %383 = fcmp ogt double %361, 1.024000e+03
  %384 = select i1 %383, double 0x7FF0000000000000, double %382
  %385 = fcmp olt double %361, -1.075000e+03
  %386 = select i1 %385, double 0.000000e+00, double %384
  %387 = tail call double @llvm.fma.f64(double %386, double %364, double %386)
  %388 = tail call double @llvm.fabs.f64(double %386) #3
  %389 = fcmp oeq double %388, 0x7FF0000000000000
  %390 = select i1 %389, double %386, double %387
  %391 = fcmp olt double %4, 0.000000e+00
  %392 = and i1 %391, %196
  %393 = select i1 %392, double -0.000000e+00, double 0.000000e+00
  %394 = tail call double @llvm.copysign.f64(double %390, double %393)
  %395 = fcmp uge double %4, 0.000000e+00
  %396 = select i1 %395, i1 true, i1 %202
  %397 = select i1 %396, double %394, double 0x7FF8000000000000
  %398 = fcmp oeq double %233, 1.000000e+00
  %399 = fadd double %233, -1.000000e+00
  %400 = bitcast double %399 to <2 x i32>
  %401 = extractelement <2 x i32> %400, i64 1
  %402 = xor i32 %401, %209
  %403 = icmp sgt i32 %402, -1
  %404 = select i1 %403, double 0x7FF0000000000000, double 0.000000e+00
  %405 = select i1 %398, double %233, double %404
  %406 = select i1 %205, double %405, double %397
  %407 = fcmp oeq double %233, 0x7FF0000000000000
  %408 = fcmp oeq double %4, 0.000000e+00
  %409 = or i1 %408, %407
  %410 = xor i1 %220, %408
  %411 = select i1 %410, double 0.000000e+00, double 0x7FF0000000000000
  %412 = select i1 %196, double %4, double 0.000000e+00
  %413 = tail call double @llvm.copysign.f64(double %411, double %412)
  %414 = select i1 %409, double %413, double %406
  %415 = fcmp uno double %4, 0.000000e+00
  %416 = fcmp oeq double %4, 1.000000e+00
  %417 = or i1 %228, %416
  %418 = fsub contract double 1.000000e+00, %414
  %419 = select i1 %415, double 0x7FF8000000000000, double %418
  %420 = select i1 %417, double 0.000000e+00, double %419
  %421 = udiv i32 %18, %15
  %422 = mul i32 %421, %15
  %423 = icmp ugt i32 %18, %422
  %424 = zext i1 %423 to i32
  %425 = add i32 %421, %424
  %426 = mul i32 %425, %15
  br label %427

427:                                              ; preds = %22, %427
  %428 = phi i32 [ %20, %22 ], [ %471, %427 ]
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds double, double addrspace(1)* %5, i64 %429
  %431 = load double, double addrspace(1)* %430, align 8, !tbaa !16
  %432 = fmul contract double %431, %3
  %433 = getelementptr inbounds double, double addrspace(1)* %7, i64 %429
  %434 = load double, double addrspace(1)* %433, align 8, !tbaa !16
  %435 = fmul contract double %23, %434
  %436 = fadd contract double %432, %435
  store double %436, double addrspace(1)* %430, align 8, !tbaa !16
  %437 = getelementptr inbounds double, double addrspace(1)* %6, i64 %429
  %438 = load double, double addrspace(1)* %437, align 8, !tbaa !16
  %439 = fmul contract double %438, %4
  %440 = load double, double addrspace(1)* %433, align 8, !tbaa !16
  %441 = fmul contract double %440, %440
  %442 = fmul contract double %24, %441
  %443 = fadd contract double %439, %442
  store double %443, double addrspace(1)* %437, align 8, !tbaa !16
  %444 = load double, double addrspace(1)* %430, align 8, !tbaa !16
  %445 = fdiv contract double %444, %232
  %446 = fdiv contract double %443, %420
  %447 = fcmp olt double %446, 0x1000000000000000
  %448 = select i1 %447, double 0x4FF0000000000000, double 1.000000e+00
  %449 = fmul double %446, %448
  %450 = tail call double @llvm.amdgcn.rsq.f64(double %449)
  %451 = fmul double %449, %450
  %452 = fmul double %450, 5.000000e-01
  %453 = fneg double %452
  %454 = tail call double @llvm.fma.f64(double %453, double %451, double 5.000000e-01)
  %455 = tail call double @llvm.fma.f64(double %452, double %454, double %452)
  %456 = tail call double @llvm.fma.f64(double %451, double %454, double %451)
  %457 = fneg double %456
  %458 = tail call double @llvm.fma.f64(double %457, double %456, double %449)
  %459 = tail call double @llvm.fma.f64(double %458, double %455, double %456)
  %460 = fneg double %459
  %461 = tail call double @llvm.fma.f64(double %460, double %459, double %449)
  %462 = tail call double @llvm.fma.f64(double %461, double %455, double %459)
  %463 = select i1 %447, double 0x37F0000000000000, double 1.000000e+00
  %464 = fmul double %463, %462
  %465 = fcmp oeq double %449, 0.000000e+00
  %466 = fcmp oeq double %449, 0x7FF0000000000000
  %467 = or i1 %465, %466
  %468 = select i1 %467, double %449, double %464
  %469 = fadd contract double %468, %2
  %470 = fdiv contract double %445, %469
  store double %470, double addrspace(1)* %433, align 8, !tbaa !16
  %471 = add i32 %426, %428
  %472 = icmp slt i32 %471, %0
  br i1 %472, label %427, label %473, !llvm.loop !20

473:                                              ; preds = %427, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
