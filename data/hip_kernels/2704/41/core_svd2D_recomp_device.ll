; ModuleID = '../data/hip_kernels/2704/41/main.cu'
source_filename = "../data/hip_kernels/2704/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17core_svd2D_recompPfS_S_m(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %13
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = zext i32 %24 to i64
  %26 = icmp ult i64 %25, %3
  br i1 %26, label %27, label %388

27:                                               ; preds = %4
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !14
  %30 = fpext float %29 to double
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !14
  %33 = fpext float %32 to double
  %34 = add i64 %25, %3
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !14
  %37 = fpext float %36 to double
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !14
  %40 = fpext float %39 to double
  %41 = tail call double @llvm.fabs.f64(double %33)
  %42 = tail call double @llvm.amdgcn.frexp.mant.f64(double %41)
  %43 = fcmp olt double %42, 0x3FE5555555555555
  %44 = zext i1 %43 to i32
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %42, i32 %44)
  %46 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %41)
  %47 = sub nsw i32 %46, %44
  %48 = fadd double %45, -1.000000e+00
  %49 = fadd double %45, 1.000000e+00
  %50 = fadd double %49, -1.000000e+00
  %51 = fsub double %45, %50
  %52 = tail call double @llvm.amdgcn.rcp.f64(double %49)
  %53 = fneg double %49
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double 1.000000e+00)
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double %52)
  %56 = tail call double @llvm.fma.f64(double %53, double %55, double 1.000000e+00)
  %57 = tail call double @llvm.fma.f64(double %56, double %55, double %55)
  %58 = fmul double %48, %57
  %59 = fmul double %49, %58
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %58, double %49, double %60)
  %62 = tail call double @llvm.fma.f64(double %58, double %51, double %61)
  %63 = fadd double %59, %62
  %64 = fsub double %63, %59
  %65 = fsub double %62, %64
  %66 = fsub double %48, %63
  %67 = fsub double %48, %66
  %68 = fsub double %67, %63
  %69 = fsub double %68, %65
  %70 = fadd double %66, %69
  %71 = fmul double %57, %70
  %72 = fadd double %58, %71
  %73 = fsub double %72, %58
  %74 = fsub double %71, %73
  %75 = fmul double %72, %72
  %76 = fneg double %75
  %77 = tail call double @llvm.fma.f64(double %72, double %72, double %76)
  %78 = fmul double %74, 2.000000e+00
  %79 = tail call double @llvm.fma.f64(double %72, double %78, double %77)
  %80 = fadd double %75, %79
  %81 = fsub double %80, %75
  %82 = fsub double %79, %81
  %83 = tail call double @llvm.fma.f64(double %80, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %84 = tail call double @llvm.fma.f64(double %80, double %83, double 0x3FBE25E43ABE935A)
  %85 = tail call double @llvm.fma.f64(double %80, double %84, double 0x3FC110EF47E6C9C2)
  %86 = tail call double @llvm.fma.f64(double %80, double %85, double 0x3FC3B13BCFA74449)
  %87 = tail call double @llvm.fma.f64(double %80, double %86, double 0x3FC745D171BF3C30)
  %88 = tail call double @llvm.fma.f64(double %80, double %87, double 0x3FCC71C71C7792CE)
  %89 = tail call double @llvm.fma.f64(double %80, double %88, double 0x3FD24924924920DA)
  %90 = tail call double @llvm.fma.f64(double %80, double %89, double 0x3FD999999999999C)
  %91 = sitofp i32 %47 to double
  %92 = fmul double %91, 0x3FE62E42FEFA39EF
  %93 = fneg double %92
  %94 = tail call double @llvm.fma.f64(double %91, double 0x3FE62E42FEFA39EF, double %93)
  %95 = tail call double @llvm.fma.f64(double %91, double 0x3C7ABC9E3B39803F, double %94)
  %96 = fadd double %92, %95
  %97 = fsub double %96, %92
  %98 = fsub double %95, %97
  %99 = tail call double @llvm.amdgcn.ldexp.f64(double %72, i32 1)
  %100 = tail call double @llvm.amdgcn.ldexp.f64(double %74, i32 1)
  %101 = fmul double %72, %80
  %102 = fneg double %101
  %103 = tail call double @llvm.fma.f64(double %80, double %72, double %102)
  %104 = tail call double @llvm.fma.f64(double %80, double %74, double %103)
  %105 = tail call double @llvm.fma.f64(double %82, double %72, double %104)
  %106 = fadd double %101, %105
  %107 = fsub double %106, %101
  %108 = fsub double %105, %107
  %109 = fmul double %80, %90
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %80, double %90, double %110)
  %112 = tail call double @llvm.fma.f64(double %82, double %90, double %111)
  %113 = fadd double %109, %112
  %114 = fsub double %113, %109
  %115 = fsub double %112, %114
  %116 = fadd double %113, 0x3FE5555555555555
  %117 = fadd double %116, 0xBFE5555555555555
  %118 = fsub double %113, %117
  %119 = fadd double %115, 0x3C8543B0D5DF274D
  %120 = fadd double %119, %118
  %121 = fadd double %116, %120
  %122 = fsub double %121, %116
  %123 = fsub double %120, %122
  %124 = fmul double %106, %121
  %125 = fneg double %124
  %126 = tail call double @llvm.fma.f64(double %106, double %121, double %125)
  %127 = tail call double @llvm.fma.f64(double %106, double %123, double %126)
  %128 = tail call double @llvm.fma.f64(double %108, double %121, double %127)
  %129 = fadd double %124, %128
  %130 = fsub double %129, %124
  %131 = fsub double %128, %130
  %132 = fadd double %99, %129
  %133 = fsub double %132, %99
  %134 = fsub double %129, %133
  %135 = fadd double %100, %131
  %136 = fadd double %135, %134
  %137 = fadd double %132, %136
  %138 = fsub double %137, %132
  %139 = fsub double %136, %138
  %140 = fadd double %96, %137
  %141 = fsub double %140, %96
  %142 = fsub double %140, %141
  %143 = fsub double %96, %142
  %144 = fsub double %137, %141
  %145 = fadd double %144, %143
  %146 = fadd double %98, %139
  %147 = fsub double %146, %98
  %148 = fsub double %146, %147
  %149 = fsub double %98, %148
  %150 = fsub double %139, %147
  %151 = fadd double %150, %149
  %152 = fadd double %146, %145
  %153 = fadd double %140, %152
  %154 = fsub double %153, %140
  %155 = fsub double %152, %154
  %156 = fadd double %151, %155
  %157 = fadd double %153, %156
  %158 = fsub double %157, %153
  %159 = fsub double %156, %158
  %160 = fmul double %157, 2.000000e+00
  %161 = fneg double %160
  %162 = tail call double @llvm.fma.f64(double %157, double 2.000000e+00, double %161)
  %163 = tail call double @llvm.fma.f64(double %159, double 2.000000e+00, double %162)
  %164 = fadd double %160, %163
  %165 = fsub double %164, %160
  %166 = fsub double %163, %165
  %167 = tail call double @llvm.fabs.f64(double %160) #3
  %168 = fcmp oeq double %167, 0x7FF0000000000000
  %169 = select i1 %168, double %160, double %164
  %170 = tail call double @llvm.fabs.f64(double %169) #3
  %171 = fcmp oeq double %170, 0x7FF0000000000000
  %172 = select i1 %171, double 0.000000e+00, double %166
  %173 = fmul double %169, 0x3FF71547652B82FE
  %174 = tail call double @llvm.rint.f64(double %173)
  %175 = fneg double %174
  %176 = tail call double @llvm.fma.f64(double %175, double 0x3FE62E42FEFA39EF, double %169)
  %177 = tail call double @llvm.fma.f64(double %175, double 0x3C7ABC9E3B39803F, double %176)
  %178 = tail call double @llvm.fma.f64(double %177, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %179 = tail call double @llvm.fma.f64(double %177, double %178, double 0x3EC71DEE623FDE64)
  %180 = tail call double @llvm.fma.f64(double %177, double %179, double 0x3EFA01997C89E6B0)
  %181 = tail call double @llvm.fma.f64(double %177, double %180, double 0x3F2A01A014761F6E)
  %182 = tail call double @llvm.fma.f64(double %177, double %181, double 0x3F56C16C1852B7B0)
  %183 = tail call double @llvm.fma.f64(double %177, double %182, double 0x3F81111111122322)
  %184 = tail call double @llvm.fma.f64(double %177, double %183, double 0x3FA55555555502A1)
  %185 = tail call double @llvm.fma.f64(double %177, double %184, double 0x3FC5555555555511)
  %186 = tail call double @llvm.fma.f64(double %177, double %185, double 0x3FE000000000000B)
  %187 = tail call double @llvm.fma.f64(double %177, double %186, double 1.000000e+00)
  %188 = tail call double @llvm.fma.f64(double %177, double %187, double 1.000000e+00)
  %189 = fptosi double %174 to i32
  %190 = tail call double @llvm.amdgcn.ldexp.f64(double %188, i32 %189)
  %191 = fcmp ogt double %169, 1.024000e+03
  %192 = select i1 %191, double 0x7FF0000000000000, double %190
  %193 = fcmp olt double %169, -1.075000e+03
  %194 = select i1 %193, double 0.000000e+00, double %192
  %195 = tail call double @llvm.fma.f64(double %194, double %172, double %194)
  %196 = tail call double @llvm.fabs.f64(double %194) #3
  %197 = fcmp oeq double %196, 0x7FF0000000000000
  %198 = select i1 %197, double %194, double %195
  %199 = tail call double @llvm.fabs.f64(double %198)
  %200 = fcmp oeq double %41, 0x7FF0000000000000
  %201 = fcmp oeq float %32, 0.000000e+00
  %202 = select i1 %200, double 0x7FF0000000000000, double %199
  %203 = select i1 %201, double 0.000000e+00, double %202
  %204 = fcmp uno float %32, 0.000000e+00
  %205 = select i1 %204, double 0x7FF8000000000000, double %203
  %206 = fmul contract double %205, %30
  %207 = tail call double @llvm.fabs.f64(double %40)
  %208 = tail call double @llvm.amdgcn.frexp.mant.f64(double %207)
  %209 = fcmp olt double %208, 0x3FE5555555555555
  %210 = zext i1 %209 to i32
  %211 = tail call double @llvm.amdgcn.ldexp.f64(double %208, i32 %210)
  %212 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %207)
  %213 = sub nsw i32 %212, %210
  %214 = fadd double %211, -1.000000e+00
  %215 = fadd double %211, 1.000000e+00
  %216 = fadd double %215, -1.000000e+00
  %217 = fsub double %211, %216
  %218 = tail call double @llvm.amdgcn.rcp.f64(double %215)
  %219 = fneg double %215
  %220 = tail call double @llvm.fma.f64(double %219, double %218, double 1.000000e+00)
  %221 = tail call double @llvm.fma.f64(double %220, double %218, double %218)
  %222 = tail call double @llvm.fma.f64(double %219, double %221, double 1.000000e+00)
  %223 = tail call double @llvm.fma.f64(double %222, double %221, double %221)
  %224 = fmul double %214, %223
  %225 = fmul double %215, %224
  %226 = fneg double %225
  %227 = tail call double @llvm.fma.f64(double %224, double %215, double %226)
  %228 = tail call double @llvm.fma.f64(double %224, double %217, double %227)
  %229 = fadd double %225, %228
  %230 = fsub double %229, %225
  %231 = fsub double %228, %230
  %232 = fsub double %214, %229
  %233 = fsub double %214, %232
  %234 = fsub double %233, %229
  %235 = fsub double %234, %231
  %236 = fadd double %232, %235
  %237 = fmul double %223, %236
  %238 = fadd double %224, %237
  %239 = fsub double %238, %224
  %240 = fsub double %237, %239
  %241 = fmul double %238, %238
  %242 = fneg double %241
  %243 = tail call double @llvm.fma.f64(double %238, double %238, double %242)
  %244 = fmul double %240, 2.000000e+00
  %245 = tail call double @llvm.fma.f64(double %238, double %244, double %243)
  %246 = fadd double %241, %245
  %247 = fsub double %246, %241
  %248 = fsub double %245, %247
  %249 = tail call double @llvm.fma.f64(double %246, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %250 = tail call double @llvm.fma.f64(double %246, double %249, double 0x3FBE25E43ABE935A)
  %251 = tail call double @llvm.fma.f64(double %246, double %250, double 0x3FC110EF47E6C9C2)
  %252 = tail call double @llvm.fma.f64(double %246, double %251, double 0x3FC3B13BCFA74449)
  %253 = tail call double @llvm.fma.f64(double %246, double %252, double 0x3FC745D171BF3C30)
  %254 = tail call double @llvm.fma.f64(double %246, double %253, double 0x3FCC71C71C7792CE)
  %255 = tail call double @llvm.fma.f64(double %246, double %254, double 0x3FD24924924920DA)
  %256 = tail call double @llvm.fma.f64(double %246, double %255, double 0x3FD999999999999C)
  %257 = sitofp i32 %213 to double
  %258 = fmul double %257, 0x3FE62E42FEFA39EF
  %259 = fneg double %258
  %260 = tail call double @llvm.fma.f64(double %257, double 0x3FE62E42FEFA39EF, double %259)
  %261 = tail call double @llvm.fma.f64(double %257, double 0x3C7ABC9E3B39803F, double %260)
  %262 = fadd double %258, %261
  %263 = fsub double %262, %258
  %264 = fsub double %261, %263
  %265 = tail call double @llvm.amdgcn.ldexp.f64(double %238, i32 1)
  %266 = tail call double @llvm.amdgcn.ldexp.f64(double %240, i32 1)
  %267 = fmul double %238, %246
  %268 = fneg double %267
  %269 = tail call double @llvm.fma.f64(double %246, double %238, double %268)
  %270 = tail call double @llvm.fma.f64(double %246, double %240, double %269)
  %271 = tail call double @llvm.fma.f64(double %248, double %238, double %270)
  %272 = fadd double %267, %271
  %273 = fsub double %272, %267
  %274 = fsub double %271, %273
  %275 = fmul double %246, %256
  %276 = fneg double %275
  %277 = tail call double @llvm.fma.f64(double %246, double %256, double %276)
  %278 = tail call double @llvm.fma.f64(double %248, double %256, double %277)
  %279 = fadd double %275, %278
  %280 = fsub double %279, %275
  %281 = fsub double %278, %280
  %282 = fadd double %279, 0x3FE5555555555555
  %283 = fadd double %282, 0xBFE5555555555555
  %284 = fsub double %279, %283
  %285 = fadd double %281, 0x3C8543B0D5DF274D
  %286 = fadd double %285, %284
  %287 = fadd double %282, %286
  %288 = fsub double %287, %282
  %289 = fsub double %286, %288
  %290 = fmul double %272, %287
  %291 = fneg double %290
  %292 = tail call double @llvm.fma.f64(double %272, double %287, double %291)
  %293 = tail call double @llvm.fma.f64(double %272, double %289, double %292)
  %294 = tail call double @llvm.fma.f64(double %274, double %287, double %293)
  %295 = fadd double %290, %294
  %296 = fsub double %295, %290
  %297 = fsub double %294, %296
  %298 = fadd double %265, %295
  %299 = fsub double %298, %265
  %300 = fsub double %295, %299
  %301 = fadd double %266, %297
  %302 = fadd double %301, %300
  %303 = fadd double %298, %302
  %304 = fsub double %303, %298
  %305 = fsub double %302, %304
  %306 = fadd double %262, %303
  %307 = fsub double %306, %262
  %308 = fsub double %306, %307
  %309 = fsub double %262, %308
  %310 = fsub double %303, %307
  %311 = fadd double %310, %309
  %312 = fadd double %264, %305
  %313 = fsub double %312, %264
  %314 = fsub double %312, %313
  %315 = fsub double %264, %314
  %316 = fsub double %305, %313
  %317 = fadd double %316, %315
  %318 = fadd double %312, %311
  %319 = fadd double %306, %318
  %320 = fsub double %319, %306
  %321 = fsub double %318, %320
  %322 = fadd double %317, %321
  %323 = fadd double %319, %322
  %324 = fsub double %323, %319
  %325 = fsub double %322, %324
  %326 = fmul double %323, 2.000000e+00
  %327 = fneg double %326
  %328 = tail call double @llvm.fma.f64(double %323, double 2.000000e+00, double %327)
  %329 = tail call double @llvm.fma.f64(double %325, double 2.000000e+00, double %328)
  %330 = fadd double %326, %329
  %331 = fsub double %330, %326
  %332 = fsub double %329, %331
  %333 = tail call double @llvm.fabs.f64(double %326) #3
  %334 = fcmp oeq double %333, 0x7FF0000000000000
  %335 = select i1 %334, double %326, double %330
  %336 = tail call double @llvm.fabs.f64(double %335) #3
  %337 = fcmp oeq double %336, 0x7FF0000000000000
  %338 = select i1 %337, double 0.000000e+00, double %332
  %339 = fmul double %335, 0x3FF71547652B82FE
  %340 = tail call double @llvm.rint.f64(double %339)
  %341 = fneg double %340
  %342 = tail call double @llvm.fma.f64(double %341, double 0x3FE62E42FEFA39EF, double %335)
  %343 = tail call double @llvm.fma.f64(double %341, double 0x3C7ABC9E3B39803F, double %342)
  %344 = tail call double @llvm.fma.f64(double %343, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %345 = tail call double @llvm.fma.f64(double %343, double %344, double 0x3EC71DEE623FDE64)
  %346 = tail call double @llvm.fma.f64(double %343, double %345, double 0x3EFA01997C89E6B0)
  %347 = tail call double @llvm.fma.f64(double %343, double %346, double 0x3F2A01A014761F6E)
  %348 = tail call double @llvm.fma.f64(double %343, double %347, double 0x3F56C16C1852B7B0)
  %349 = tail call double @llvm.fma.f64(double %343, double %348, double 0x3F81111111122322)
  %350 = tail call double @llvm.fma.f64(double %343, double %349, double 0x3FA55555555502A1)
  %351 = tail call double @llvm.fma.f64(double %343, double %350, double 0x3FC5555555555511)
  %352 = tail call double @llvm.fma.f64(double %343, double %351, double 0x3FE000000000000B)
  %353 = tail call double @llvm.fma.f64(double %343, double %352, double 1.000000e+00)
  %354 = tail call double @llvm.fma.f64(double %343, double %353, double 1.000000e+00)
  %355 = fptosi double %340 to i32
  %356 = tail call double @llvm.amdgcn.ldexp.f64(double %354, i32 %355)
  %357 = fcmp ogt double %335, 1.024000e+03
  %358 = select i1 %357, double 0x7FF0000000000000, double %356
  %359 = fcmp olt double %335, -1.075000e+03
  %360 = select i1 %359, double 0.000000e+00, double %358
  %361 = tail call double @llvm.fma.f64(double %360, double %338, double %360)
  %362 = tail call double @llvm.fabs.f64(double %360) #3
  %363 = fcmp oeq double %362, 0x7FF0000000000000
  %364 = select i1 %363, double %360, double %361
  %365 = tail call double @llvm.fabs.f64(double %364)
  %366 = fcmp oeq double %207, 0x7FF0000000000000
  %367 = fcmp oeq float %39, 0.000000e+00
  %368 = select i1 %366, double 0x7FF0000000000000, double %365
  %369 = select i1 %367, double 0.000000e+00, double %368
  %370 = fcmp uno float %39, 0.000000e+00
  %371 = select i1 %370, double 0x7FF8000000000000, double %369
  %372 = fmul contract double %371, %37
  %373 = fadd contract double %206, %372
  %374 = fmul contract double %33, %40
  %375 = fsub contract double %30, %37
  %376 = fmul contract double %375, %374
  %377 = fmul contract double %371, %30
  %378 = fmul contract double %205, %37
  %379 = fadd contract double %377, %378
  %380 = fptrunc double %373 to float
  %381 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  store float %380, float addrspace(1)* %381, align 4, !tbaa !16
  %382 = fptrunc double %376 to float
  %383 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  store float %382, float addrspace(1)* %383, align 4, !tbaa !16
  %384 = fptrunc double %379 to float
  %385 = shl i64 %3, 1
  %386 = add i64 %385, %25
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  store float %384, float addrspace(1)* %387, align 4, !tbaa !16
  br label %388

388:                                              ; preds = %27, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
