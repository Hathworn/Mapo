; ModuleID = '../data/hip_kernels/11810/0/main.cu'
source_filename = "../data/hip_kernels/11810/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14Substep1KernelPdS_S_S_S_S_S_S_S_S_S_diididd(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double %11, i32 %12, i32 %13, double %14, i32 %15, double %16, double %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 2, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i32
  %34 = mul i32 %29, %33
  %35 = add i32 %34, %28
  %36 = icmp sgt i32 %35, 0
  %37 = icmp slt i32 %35, %12
  %38 = select i1 %36, i1 %37, i1 false
  %39 = icmp slt i32 %27, %13
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %104

41:                                               ; preds = %18
  %42 = mul nsw i32 %35, %13
  %43 = add nsw i32 %42, %27
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  %47 = add nsw i32 %35, -1
  %48 = mul nsw i32 %47, %13
  %49 = add nsw i32 %48, %27
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !6
  %53 = fsub contract double %46, %52
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !6
  %58 = fadd contract double %55, %57
  %59 = zext i32 %35 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7, !amdgpu.noclobber !6
  %62 = getelementptr inbounds double, double addrspace(1)* %4, i64 %44
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !6
  %64 = getelementptr inbounds double, double addrspace(1)* %4, i64 %50
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !6
  %66 = fsub contract double %63, %65
  %67 = fmul contract double %61, %66
  %68 = getelementptr inbounds double, double addrspace(1)* %9, i64 %44
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !6
  %70 = add nsw i32 %27, 1
  %71 = srem i32 %70, %13
  %72 = add nsw i32 %71, %42
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %9, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !6
  %76 = fadd contract double %69, %75
  %77 = getelementptr inbounds double, double addrspace(1)* %9, i64 %50
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7, !amdgpu.noclobber !6
  %79 = fadd contract double %76, %78
  %80 = add nsw i32 %71, %48
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %9, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7, !amdgpu.noclobber !6
  %84 = fadd contract double %79, %83
  %85 = fmul contract double %84, 2.500000e-01
  %86 = getelementptr inbounds double, double addrspace(1)* %5, i64 %59
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7, !amdgpu.noclobber !6
  %88 = fmul contract double %87, %14
  %89 = fadd contract double %85, %88
  %90 = fmul contract double %89, %89
  %91 = fmul contract double %53, -2.000000e+00
  %92 = fdiv contract double %91, %58
  %93 = fmul contract double %61, %92
  %94 = fsub contract double %93, %67
  %95 = getelementptr inbounds double, double addrspace(1)* %6, i64 %59
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !6
  %97 = fmul contract double %96, %90
  %98 = fadd contract double %94, %97
  %99 = getelementptr inbounds double, double addrspace(1)* %7, i64 %44
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !6
  %101 = fmul contract double %98, %11
  %102 = fadd contract double %100, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  store double %102, double addrspace(1)* %103, align 8, !tbaa !7
  br label %104

104:                                              ; preds = %41, %18
  %105 = select i1 %37, i1 %39, i1 false
  br i1 %105, label %106, label %358

106:                                              ; preds = %104
  %107 = fmul contract double %16, 5.000000e-01
  %108 = sext i32 %35 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %10, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !7
  %111 = fadd contract double %17, -2.500000e+00
  %112 = tail call double @llvm.fabs.f64(double %110)
  %113 = tail call double @llvm.amdgcn.frexp.mant.f64(double %112)
  %114 = fcmp olt double %113, 0x3FE5555555555555
  %115 = zext i1 %114 to i32
  %116 = tail call double @llvm.amdgcn.ldexp.f64(double %113, i32 %115)
  %117 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %112)
  %118 = sub nsw i32 %117, %115
  %119 = fadd double %116, -1.000000e+00
  %120 = fadd double %116, 1.000000e+00
  %121 = fadd double %120, -1.000000e+00
  %122 = fsub double %116, %121
  %123 = tail call double @llvm.amdgcn.rcp.f64(double %120)
  %124 = fneg double %120
  %125 = tail call double @llvm.fma.f64(double %124, double %123, double 1.000000e+00)
  %126 = tail call double @llvm.fma.f64(double %125, double %123, double %123)
  %127 = tail call double @llvm.fma.f64(double %124, double %126, double 1.000000e+00)
  %128 = tail call double @llvm.fma.f64(double %127, double %126, double %126)
  %129 = fmul double %119, %128
  %130 = fmul double %120, %129
  %131 = fneg double %130
  %132 = tail call double @llvm.fma.f64(double %129, double %120, double %131)
  %133 = tail call double @llvm.fma.f64(double %129, double %122, double %132)
  %134 = fadd double %130, %133
  %135 = fsub double %134, %130
  %136 = fsub double %133, %135
  %137 = fsub double %119, %134
  %138 = fsub double %119, %137
  %139 = fsub double %138, %134
  %140 = fsub double %139, %136
  %141 = fadd double %137, %140
  %142 = fmul double %128, %141
  %143 = fadd double %129, %142
  %144 = fsub double %143, %129
  %145 = fsub double %142, %144
  %146 = fmul double %143, %143
  %147 = fneg double %146
  %148 = tail call double @llvm.fma.f64(double %143, double %143, double %147)
  %149 = fmul double %145, 2.000000e+00
  %150 = tail call double @llvm.fma.f64(double %143, double %149, double %148)
  %151 = fadd double %146, %150
  %152 = fsub double %151, %146
  %153 = fsub double %150, %152
  %154 = tail call double @llvm.fma.f64(double %151, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %155 = tail call double @llvm.fma.f64(double %151, double %154, double 0x3FBE25E43ABE935A)
  %156 = tail call double @llvm.fma.f64(double %151, double %155, double 0x3FC110EF47E6C9C2)
  %157 = tail call double @llvm.fma.f64(double %151, double %156, double 0x3FC3B13BCFA74449)
  %158 = tail call double @llvm.fma.f64(double %151, double %157, double 0x3FC745D171BF3C30)
  %159 = tail call double @llvm.fma.f64(double %151, double %158, double 0x3FCC71C71C7792CE)
  %160 = tail call double @llvm.fma.f64(double %151, double %159, double 0x3FD24924924920DA)
  %161 = tail call double @llvm.fma.f64(double %151, double %160, double 0x3FD999999999999C)
  %162 = sitofp i32 %118 to double
  %163 = fmul double %162, 0x3FE62E42FEFA39EF
  %164 = fneg double %163
  %165 = tail call double @llvm.fma.f64(double %162, double 0x3FE62E42FEFA39EF, double %164)
  %166 = tail call double @llvm.fma.f64(double %162, double 0x3C7ABC9E3B39803F, double %165)
  %167 = fadd double %163, %166
  %168 = fsub double %167, %163
  %169 = fsub double %166, %168
  %170 = tail call double @llvm.amdgcn.ldexp.f64(double %143, i32 1)
  %171 = tail call double @llvm.amdgcn.ldexp.f64(double %145, i32 1)
  %172 = fmul double %143, %151
  %173 = fneg double %172
  %174 = tail call double @llvm.fma.f64(double %151, double %143, double %173)
  %175 = tail call double @llvm.fma.f64(double %151, double %145, double %174)
  %176 = tail call double @llvm.fma.f64(double %153, double %143, double %175)
  %177 = fadd double %172, %176
  %178 = fsub double %177, %172
  %179 = fsub double %176, %178
  %180 = fmul double %151, %161
  %181 = fneg double %180
  %182 = tail call double @llvm.fma.f64(double %151, double %161, double %181)
  %183 = tail call double @llvm.fma.f64(double %153, double %161, double %182)
  %184 = fadd double %180, %183
  %185 = fsub double %184, %180
  %186 = fsub double %183, %185
  %187 = fadd double %184, 0x3FE5555555555555
  %188 = fadd double %187, 0xBFE5555555555555
  %189 = fsub double %184, %188
  %190 = fadd double %186, 0x3C8543B0D5DF274D
  %191 = fadd double %190, %189
  %192 = fadd double %187, %191
  %193 = fsub double %192, %187
  %194 = fsub double %191, %193
  %195 = fmul double %177, %192
  %196 = fneg double %195
  %197 = tail call double @llvm.fma.f64(double %177, double %192, double %196)
  %198 = tail call double @llvm.fma.f64(double %177, double %194, double %197)
  %199 = tail call double @llvm.fma.f64(double %179, double %192, double %198)
  %200 = fadd double %195, %199
  %201 = fsub double %200, %195
  %202 = fsub double %199, %201
  %203 = fadd double %170, %200
  %204 = fsub double %203, %170
  %205 = fsub double %200, %204
  %206 = fadd double %171, %202
  %207 = fadd double %206, %205
  %208 = fadd double %203, %207
  %209 = fsub double %208, %203
  %210 = fsub double %207, %209
  %211 = fadd double %167, %208
  %212 = fsub double %211, %167
  %213 = fsub double %211, %212
  %214 = fsub double %167, %213
  %215 = fsub double %208, %212
  %216 = fadd double %215, %214
  %217 = fadd double %169, %210
  %218 = fsub double %217, %169
  %219 = fsub double %217, %218
  %220 = fsub double %169, %219
  %221 = fsub double %210, %218
  %222 = fadd double %221, %220
  %223 = fadd double %217, %216
  %224 = fadd double %211, %223
  %225 = fsub double %224, %211
  %226 = fsub double %223, %225
  %227 = fadd double %222, %226
  %228 = fadd double %224, %227
  %229 = fsub double %228, %224
  %230 = fsub double %227, %229
  %231 = fmul double %111, %228
  %232 = fneg double %231
  %233 = tail call double @llvm.fma.f64(double %111, double %228, double %232)
  %234 = tail call double @llvm.fma.f64(double %111, double %230, double %233)
  %235 = fadd double %231, %234
  %236 = fsub double %235, %231
  %237 = fsub double %234, %236
  %238 = tail call double @llvm.fabs.f64(double %231) #3
  %239 = fcmp oeq double %238, 0x7FF0000000000000
  %240 = select i1 %239, double %231, double %235
  %241 = tail call double @llvm.fabs.f64(double %240) #3
  %242 = fcmp oeq double %241, 0x7FF0000000000000
  %243 = select i1 %242, double 0.000000e+00, double %237
  %244 = fmul double %240, 0x3FF71547652B82FE
  %245 = tail call double @llvm.rint.f64(double %244)
  %246 = fneg double %245
  %247 = tail call double @llvm.fma.f64(double %246, double 0x3FE62E42FEFA39EF, double %240)
  %248 = tail call double @llvm.fma.f64(double %246, double 0x3C7ABC9E3B39803F, double %247)
  %249 = tail call double @llvm.fma.f64(double %248, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %250 = tail call double @llvm.fma.f64(double %248, double %249, double 0x3EC71DEE623FDE64)
  %251 = tail call double @llvm.fma.f64(double %248, double %250, double 0x3EFA01997C89E6B0)
  %252 = tail call double @llvm.fma.f64(double %248, double %251, double 0x3F2A01A014761F6E)
  %253 = tail call double @llvm.fma.f64(double %248, double %252, double 0x3F56C16C1852B7B0)
  %254 = tail call double @llvm.fma.f64(double %248, double %253, double 0x3F81111111122322)
  %255 = tail call double @llvm.fma.f64(double %248, double %254, double 0x3FA55555555502A1)
  %256 = tail call double @llvm.fma.f64(double %248, double %255, double 0x3FC5555555555511)
  %257 = tail call double @llvm.fma.f64(double %248, double %256, double 0x3FE000000000000B)
  %258 = tail call double @llvm.fma.f64(double %248, double %257, double 1.000000e+00)
  %259 = tail call double @llvm.fma.f64(double %248, double %258, double 1.000000e+00)
  %260 = fptosi double %245 to i32
  %261 = tail call double @llvm.amdgcn.ldexp.f64(double %259, i32 %260)
  %262 = fcmp ogt double %240, 1.024000e+03
  %263 = select i1 %262, double 0x7FF0000000000000, double %261
  %264 = fcmp olt double %240, -1.075000e+03
  %265 = select i1 %264, double 0.000000e+00, double %263
  %266 = tail call double @llvm.fma.f64(double %265, double %243, double %265)
  %267 = tail call double @llvm.fabs.f64(double %265) #3
  %268 = fcmp oeq double %267, 0x7FF0000000000000
  %269 = select i1 %268, double %265, double %266
  %270 = tail call double @llvm.fabs.f64(double %111)
  %271 = tail call double @llvm.trunc.f64(double %270)
  %272 = fcmp oeq double %270, %271
  %273 = zext i1 %272 to i32
  %274 = fmul double %271, 5.000000e-01
  %275 = tail call double @llvm.amdgcn.fract.f64(double %274)
  %276 = tail call i1 @llvm.amdgcn.class.f64(double %274, i32 516)
  %277 = select i1 %276, double 0.000000e+00, double %275
  %278 = fcmp oeq double %277, 0.000000e+00
  %279 = and i1 %272, %278
  %280 = zext i1 %279 to i32
  %281 = add nuw nsw i32 %280, %273
  %282 = icmp eq i32 %281, 1
  %283 = fcmp olt double %110, 0.000000e+00
  %284 = and i1 %282, %283
  %285 = select i1 %284, double -0.000000e+00, double 0.000000e+00
  %286 = tail call double @llvm.copysign.f64(double %269, double %285)
  %287 = fcmp uge double %110, 0.000000e+00
  %288 = icmp ne i32 %281, 0
  %289 = select i1 %287, i1 true, i1 %288
  %290 = select i1 %289, double %286, double 0x7FF8000000000000
  %291 = fcmp oeq double %270, 0x7FF0000000000000
  %292 = fcmp oeq double %112, 1.000000e+00
  %293 = fadd double %112, -1.000000e+00
  %294 = bitcast double %111 to <2 x i32>
  %295 = extractelement <2 x i32> %294, i64 1
  %296 = bitcast double %293 to <2 x i32>
  %297 = extractelement <2 x i32> %296, i64 1
  %298 = xor i32 %297, %295
  %299 = icmp sgt i32 %298, -1
  %300 = select i1 %299, double 0x7FF0000000000000, double 0.000000e+00
  %301 = select i1 %292, double %112, double %300
  %302 = select i1 %291, double %301, double %290
  %303 = fcmp oeq double %112, 0x7FF0000000000000
  %304 = fcmp oeq double %110, 0.000000e+00
  %305 = or i1 %304, %303
  %306 = fcmp olt double %111, 0.000000e+00
  %307 = xor i1 %306, %304
  %308 = select i1 %307, double 0.000000e+00, double 0x7FF0000000000000
  %309 = select i1 %282, double %110, double 0.000000e+00
  %310 = tail call double @llvm.copysign.f64(double %308, double %309)
  %311 = select i1 %305, double %310, double %302
  %312 = fcmp uno double %110, %111
  %313 = select i1 %312, double 0x7FF8000000000000, double %311
  %314 = fcmp oeq double %110, 1.000000e+00
  %315 = fcmp oeq double %111, 0.000000e+00
  %316 = or i1 %315, %314
  %317 = select i1 %316, double 1.000000e+00, double %313
  %318 = fmul contract double %107, %317
  %319 = sitofp i32 %13 to double
  %320 = fdiv contract double 0x401921FB54442D18, %319
  %321 = fmul contract double %320, %110
  %322 = fdiv contract double 1.000000e+00, %321
  %323 = mul nsw i32 %35, %13
  %324 = add nsw i32 %323, %27
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds double, double addrspace(1)* %0, i64 %325
  %327 = load double, double addrspace(1)* %326, align 8, !tbaa !7
  %328 = add nsw i32 %13, -1
  %329 = add i32 %328, %27
  %330 = srem i32 %329, %13
  %331 = add nsw i32 %330, %323
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds double, double addrspace(1)* %0, i64 %332
  %334 = load double, double addrspace(1)* %333, align 8, !tbaa !7
  %335 = fsub contract double %327, %334
  %336 = fmul contract double %335, 2.000000e+00
  %337 = getelementptr inbounds double, double addrspace(1)* %1, i64 %325
  %338 = load double, double addrspace(1)* %337, align 8, !tbaa !7
  %339 = getelementptr inbounds double, double addrspace(1)* %1, i64 %332
  %340 = load double, double addrspace(1)* %339, align 8, !tbaa !7
  %341 = fadd contract double %338, %340
  %342 = fdiv contract double %336, %341
  %343 = fmul contract double %322, %342
  %344 = getelementptr inbounds double, double addrspace(1)* %4, i64 %325
  %345 = load double, double addrspace(1)* %344, align 8, !tbaa !7
  %346 = getelementptr inbounds double, double addrspace(1)* %4, i64 %332
  %347 = load double, double addrspace(1)* %346, align 8, !tbaa !7
  %348 = fsub contract double %345, %347
  %349 = fmul contract double %322, %348
  %350 = getelementptr inbounds double, double addrspace(1)* %9, i64 %325
  %351 = load double, double addrspace(1)* %350, align 8, !tbaa !7
  %352 = fadd contract double %343, %349
  %353 = fmul contract double %352, %11
  %354 = fsub contract double %351, %353
  %355 = getelementptr inbounds double, double addrspace(1)* %8, i64 %325
  %356 = fmul contract double %318, %11
  %357 = fadd contract double %354, %356
  store double %357, double addrspace(1)* %355, align 8, !tbaa !7
  br label %358

358:                                              ; preds = %106, %104
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
