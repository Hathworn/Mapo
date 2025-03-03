; ModuleID = '../data/hip_kernels/11810/2/main.cu'
source_filename = "../data/hip_kernels/11810/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15Substep3Kernel2PdS_S_S_S_S_S_iiS_iS_dS_S_S_S_dS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readnone %3, double addrspace(1)* nocapture readnone %4, double addrspace(1)* nocapture readnone %5, double addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, double addrspace(1)* nocapture readonly %9, i32 %10, double addrspace(1)* nocapture writeonly %11, double %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, double %17, double addrspace(1)* nocapture readonly %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %20
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %31 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 2, !range !5, !invariant.load !6
  %34 = zext i16 %33 to i32
  %35 = mul i32 %30, %34
  %36 = add i32 %35, %29
  %37 = icmp eq i32 %36, 0
  %38 = icmp slt i32 %28, %8
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %40, label %346

40:                                               ; preds = %19
  %41 = add nsw i32 %7, -1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %2, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !6
  %45 = fcmp contract une double %44, 0.000000e+00
  br i1 %45, label %46, label %342

46:                                               ; preds = %40
  %47 = add nsw i32 %28, %8
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !6
  %51 = shl nsw i32 %8, 1
  %52 = add nsw i32 %28, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = fdiv contract double %50, %55
  %57 = tail call double @llvm.amdgcn.frexp.mant.f64(double %56)
  %58 = fcmp olt double %57, 0x3FE5555555555555
  %59 = zext i1 %58 to i32
  %60 = tail call double @llvm.amdgcn.ldexp.f64(double %57, i32 %59)
  %61 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %56)
  %62 = sub nsw i32 %61, %59
  %63 = fadd double %60, -1.000000e+00
  %64 = fadd double %60, 1.000000e+00
  %65 = fadd double %64, -1.000000e+00
  %66 = fsub double %60, %65
  %67 = tail call double @llvm.amdgcn.rcp.f64(double %64)
  %68 = fneg double %64
  %69 = tail call double @llvm.fma.f64(double %68, double %67, double 1.000000e+00)
  %70 = tail call double @llvm.fma.f64(double %69, double %67, double %67)
  %71 = tail call double @llvm.fma.f64(double %68, double %70, double 1.000000e+00)
  %72 = tail call double @llvm.fma.f64(double %71, double %70, double %70)
  %73 = fmul double %63, %72
  %74 = fmul double %64, %73
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %73, double %64, double %75)
  %77 = tail call double @llvm.fma.f64(double %73, double %66, double %76)
  %78 = fadd double %74, %77
  %79 = fsub double %78, %74
  %80 = fsub double %77, %79
  %81 = fsub double %63, %78
  %82 = fsub double %63, %81
  %83 = fsub double %82, %78
  %84 = fsub double %83, %80
  %85 = fadd double %81, %84
  %86 = fmul double %72, %85
  %87 = fadd double %73, %86
  %88 = fsub double %87, %73
  %89 = fsub double %86, %88
  %90 = fmul double %87, %87
  %91 = tail call double @llvm.fma.f64(double %90, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %92 = tail call double @llvm.fma.f64(double %90, double %91, double 0x3FC7474DD7F4DF2E)
  %93 = tail call double @llvm.fma.f64(double %90, double %92, double 0x3FCC71C016291751)
  %94 = tail call double @llvm.fma.f64(double %90, double %93, double 0x3FD249249B27ACF1)
  %95 = tail call double @llvm.fma.f64(double %90, double %94, double 0x3FD99999998EF7B6)
  %96 = tail call double @llvm.fma.f64(double %90, double %95, double 0x3FE5555555555780)
  %97 = tail call double @llvm.amdgcn.ldexp.f64(double %87, i32 1)
  %98 = tail call double @llvm.amdgcn.ldexp.f64(double %89, i32 1)
  %99 = fmul double %87, %90
  %100 = fmul double %99, %96
  %101 = fadd double %97, %100
  %102 = fsub double %101, %97
  %103 = fsub double %100, %102
  %104 = fadd double %98, %103
  %105 = fadd double %101, %104
  %106 = fsub double %105, %101
  %107 = fsub double %104, %106
  %108 = sitofp i32 %62 to double
  %109 = fmul double %108, 0x3FE62E42FEFA39EF
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %108, double 0x3FE62E42FEFA39EF, double %110)
  %112 = tail call double @llvm.fma.f64(double %108, double 0x3C7ABC9E3B39803F, double %111)
  %113 = fadd double %109, %112
  %114 = fsub double %113, %109
  %115 = fsub double %112, %114
  %116 = fadd double %113, %105
  %117 = fsub double %116, %113
  %118 = fsub double %116, %117
  %119 = fsub double %113, %118
  %120 = fsub double %105, %117
  %121 = fadd double %120, %119
  %122 = fadd double %115, %107
  %123 = fsub double %122, %115
  %124 = fsub double %122, %123
  %125 = fsub double %115, %124
  %126 = fsub double %107, %123
  %127 = fadd double %126, %125
  %128 = fadd double %122, %121
  %129 = fadd double %116, %128
  %130 = fsub double %129, %116
  %131 = fsub double %128, %130
  %132 = fadd double %127, %131
  %133 = fadd double %129, %132
  %134 = tail call double @llvm.fabs.f64(double %56) #3
  %135 = fcmp oeq double %134, 0x7FF0000000000000
  %136 = select i1 %135, double %56, double %133
  %137 = fcmp olt double %56, 0.000000e+00
  %138 = select i1 %137, double 0x7FF8000000000000, double %136
  %139 = fcmp oeq double %56, 0.000000e+00
  %140 = select i1 %139, double 0xFFF0000000000000, double %138
  %141 = load double, double addrspace(1)* %9, align 8, !tbaa !7, !amdgpu.noclobber !6
  %142 = getelementptr inbounds double, double addrspace(1)* %9, i64 1
  %143 = bitcast double addrspace(1)* %142 to <2 x double> addrspace(1)*
  %144 = load <2 x double>, <2 x double> addrspace(1)* %143, align 8, !tbaa !7
  %145 = extractelement <2 x double> %144, i64 0
  %146 = fdiv contract double %141, %145
  %147 = tail call double @llvm.amdgcn.frexp.mant.f64(double %146)
  %148 = fcmp olt double %147, 0x3FE5555555555555
  %149 = zext i1 %148 to i32
  %150 = tail call double @llvm.amdgcn.ldexp.f64(double %147, i32 %149)
  %151 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %146)
  %152 = sub nsw i32 %151, %149
  %153 = fadd double %150, -1.000000e+00
  %154 = fadd double %150, 1.000000e+00
  %155 = fadd double %154, -1.000000e+00
  %156 = fsub double %150, %155
  %157 = tail call double @llvm.amdgcn.rcp.f64(double %154)
  %158 = fneg double %154
  %159 = tail call double @llvm.fma.f64(double %158, double %157, double 1.000000e+00)
  %160 = tail call double @llvm.fma.f64(double %159, double %157, double %157)
  %161 = tail call double @llvm.fma.f64(double %158, double %160, double 1.000000e+00)
  %162 = tail call double @llvm.fma.f64(double %161, double %160, double %160)
  %163 = fmul double %153, %162
  %164 = fmul double %154, %163
  %165 = fneg double %164
  %166 = tail call double @llvm.fma.f64(double %163, double %154, double %165)
  %167 = tail call double @llvm.fma.f64(double %163, double %156, double %166)
  %168 = fadd double %164, %167
  %169 = fsub double %168, %164
  %170 = fsub double %167, %169
  %171 = fsub double %153, %168
  %172 = fsub double %153, %171
  %173 = fsub double %172, %168
  %174 = fsub double %173, %170
  %175 = fadd double %171, %174
  %176 = fmul double %162, %175
  %177 = fadd double %163, %176
  %178 = fsub double %177, %163
  %179 = fsub double %176, %178
  %180 = fmul double %177, %177
  %181 = tail call double @llvm.fma.f64(double %180, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %182 = tail call double @llvm.fma.f64(double %180, double %181, double 0x3FC7474DD7F4DF2E)
  %183 = tail call double @llvm.fma.f64(double %180, double %182, double 0x3FCC71C016291751)
  %184 = tail call double @llvm.fma.f64(double %180, double %183, double 0x3FD249249B27ACF1)
  %185 = tail call double @llvm.fma.f64(double %180, double %184, double 0x3FD99999998EF7B6)
  %186 = tail call double @llvm.fma.f64(double %180, double %185, double 0x3FE5555555555780)
  %187 = tail call double @llvm.amdgcn.ldexp.f64(double %177, i32 1)
  %188 = tail call double @llvm.amdgcn.ldexp.f64(double %179, i32 1)
  %189 = fmul double %177, %180
  %190 = fmul double %189, %186
  %191 = fadd double %187, %190
  %192 = fsub double %191, %187
  %193 = fsub double %190, %192
  %194 = fadd double %188, %193
  %195 = fadd double %191, %194
  %196 = fsub double %195, %191
  %197 = fsub double %194, %196
  %198 = sitofp i32 %152 to double
  %199 = fmul double %198, 0x3FE62E42FEFA39EF
  %200 = fneg double %199
  %201 = tail call double @llvm.fma.f64(double %198, double 0x3FE62E42FEFA39EF, double %200)
  %202 = tail call double @llvm.fma.f64(double %198, double 0x3C7ABC9E3B39803F, double %201)
  %203 = fadd double %199, %202
  %204 = fsub double %203, %199
  %205 = fsub double %202, %204
  %206 = fadd double %203, %195
  %207 = fsub double %206, %203
  %208 = fsub double %206, %207
  %209 = fsub double %203, %208
  %210 = fsub double %195, %207
  %211 = fadd double %210, %209
  %212 = fadd double %205, %197
  %213 = fsub double %212, %205
  %214 = fsub double %212, %213
  %215 = fsub double %205, %214
  %216 = fsub double %197, %213
  %217 = fadd double %216, %215
  %218 = fadd double %212, %211
  %219 = fadd double %206, %218
  %220 = fsub double %219, %206
  %221 = fsub double %218, %220
  %222 = fadd double %217, %221
  %223 = fadd double %219, %222
  %224 = tail call double @llvm.fabs.f64(double %146) #3
  %225 = fcmp oeq double %224, 0x7FF0000000000000
  %226 = select i1 %225, double %146, double %223
  %227 = fcmp olt double %146, 0.000000e+00
  %228 = select i1 %227, double 0x7FF8000000000000, double %226
  %229 = fcmp oeq double %146, 0.000000e+00
  %230 = select i1 %229, double 0xFFF0000000000000, double %228
  %231 = fmul contract double %140, %230
  %232 = extractelement <2 x double> %144, i64 1
  %233 = fdiv contract double %145, %232
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
  %268 = tail call double @llvm.fma.f64(double %267, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %269 = tail call double @llvm.fma.f64(double %267, double %268, double 0x3FC7474DD7F4DF2E)
  %270 = tail call double @llvm.fma.f64(double %267, double %269, double 0x3FCC71C016291751)
  %271 = tail call double @llvm.fma.f64(double %267, double %270, double 0x3FD249249B27ACF1)
  %272 = tail call double @llvm.fma.f64(double %267, double %271, double 0x3FD99999998EF7B6)
  %273 = tail call double @llvm.fma.f64(double %267, double %272, double 0x3FE5555555555780)
  %274 = tail call double @llvm.amdgcn.ldexp.f64(double %264, i32 1)
  %275 = tail call double @llvm.amdgcn.ldexp.f64(double %266, i32 1)
  %276 = fmul double %264, %267
  %277 = fmul double %276, %273
  %278 = fadd double %274, %277
  %279 = fsub double %278, %274
  %280 = fsub double %277, %279
  %281 = fadd double %275, %280
  %282 = fadd double %278, %281
  %283 = fsub double %282, %278
  %284 = fsub double %281, %283
  %285 = sitofp i32 %239 to double
  %286 = fmul double %285, 0x3FE62E42FEFA39EF
  %287 = fneg double %286
  %288 = tail call double @llvm.fma.f64(double %285, double 0x3FE62E42FEFA39EF, double %287)
  %289 = tail call double @llvm.fma.f64(double %285, double 0x3C7ABC9E3B39803F, double %288)
  %290 = fadd double %286, %289
  %291 = fsub double %290, %286
  %292 = fsub double %289, %291
  %293 = fadd double %290, %282
  %294 = fsub double %293, %290
  %295 = fsub double %293, %294
  %296 = fsub double %290, %295
  %297 = fsub double %282, %294
  %298 = fadd double %297, %296
  %299 = fadd double %292, %284
  %300 = fsub double %299, %292
  %301 = fsub double %299, %300
  %302 = fsub double %292, %301
  %303 = fsub double %284, %300
  %304 = fadd double %303, %302
  %305 = fadd double %299, %298
  %306 = fadd double %293, %305
  %307 = fsub double %306, %293
  %308 = fsub double %305, %307
  %309 = fadd double %304, %308
  %310 = fadd double %306, %309
  %311 = tail call double @llvm.fabs.f64(double %233) #3
  %312 = fcmp oeq double %311, 0x7FF0000000000000
  %313 = select i1 %312, double %233, double %310
  %314 = fcmp olt double %233, 0.000000e+00
  %315 = select i1 %314, double 0x7FF8000000000000, double %313
  %316 = fcmp oeq double %233, 0.000000e+00
  %317 = select i1 %316, double 0xFFF0000000000000, double %315
  %318 = fdiv contract double %231, %317
  %319 = fmul double %318, 0x3FF71547652B82FE
  %320 = tail call double @llvm.rint.f64(double %319)
  %321 = fneg double %320
  %322 = tail call double @llvm.fma.f64(double %321, double 0x3FE62E42FEFA39EF, double %318)
  %323 = tail call double @llvm.fma.f64(double %321, double 0x3C7ABC9E3B39803F, double %322)
  %324 = tail call double @llvm.fma.f64(double %323, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %325 = tail call double @llvm.fma.f64(double %323, double %324, double 0x3EC71DEE623FDE64)
  %326 = tail call double @llvm.fma.f64(double %323, double %325, double 0x3EFA01997C89E6B0)
  %327 = tail call double @llvm.fma.f64(double %323, double %326, double 0x3F2A01A014761F6E)
  %328 = tail call double @llvm.fma.f64(double %323, double %327, double 0x3F56C16C1852B7B0)
  %329 = tail call double @llvm.fma.f64(double %323, double %328, double 0x3F81111111122322)
  %330 = tail call double @llvm.fma.f64(double %323, double %329, double 0x3FA55555555502A1)
  %331 = tail call double @llvm.fma.f64(double %323, double %330, double 0x3FC5555555555511)
  %332 = tail call double @llvm.fma.f64(double %323, double %331, double 0x3FE000000000000B)
  %333 = tail call double @llvm.fma.f64(double %323, double %332, double 1.000000e+00)
  %334 = tail call double @llvm.fma.f64(double %323, double %333, double 1.000000e+00)
  %335 = fptosi double %320 to i32
  %336 = tail call double @llvm.amdgcn.ldexp.f64(double %334, i32 %335)
  %337 = fcmp ogt double %318, 1.024000e+03
  %338 = select i1 %337, double 0x7FF0000000000000, double %336
  %339 = fcmp olt double %318, -1.075000e+03
  %340 = select i1 %339, double 0.000000e+00, double %338
  %341 = fmul contract double %50, %340
  br label %342

342:                                              ; preds = %40, %46
  %343 = phi double [ %341, %46 ], [ 0.000000e+00, %40 ]
  %344 = sext i32 %28 to i64
  %345 = getelementptr inbounds double, double addrspace(1)* %1, i64 %344
  store double %343, double addrspace(1)* %345, align 8, !tbaa !7
  br label %346

346:                                              ; preds = %342, %19
  %347 = icmp slt i32 %36, %7
  %348 = select i1 %347, i1 %38, i1 false
  br i1 %348, label %349, label %411

349:                                              ; preds = %346
  %350 = icmp eq i32 %10, 0
  br i1 %350, label %351, label %366

351:                                              ; preds = %349
  %352 = mul nsw i32 %36, %8
  %353 = add nsw i32 %352, %28
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds double, double addrspace(1)* %1, i64 %354
  %356 = load double, double addrspace(1)* %355, align 8, !tbaa !7
  %357 = fmul contract double %356, %12
  %358 = getelementptr inbounds double, double addrspace(1)* %16, i64 %354
  %359 = load double, double addrspace(1)* %358, align 8, !tbaa !7
  %360 = fadd contract double %357, %359
  %361 = fadd contract double %17, -1.000000e+00
  %362 = fmul contract double %361, %12
  %363 = getelementptr inbounds double, double addrspace(1)* %6, i64 %354
  %364 = load double, double addrspace(1)* %363, align 8, !tbaa !7
  %365 = fmul contract double %362, %364
  br label %403

366:                                              ; preds = %349
  %367 = sext i32 %36 to i64
  %368 = getelementptr inbounds double, double addrspace(1)* %13, i64 %367
  %369 = load double, double addrspace(1)* %368, align 8, !tbaa !7
  %370 = fmul contract double %369, %12
  %371 = mul nsw i32 %36, %8
  %372 = add nsw i32 %371, %28
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds double, double addrspace(1)* %0, i64 %373
  %375 = load double, double addrspace(1)* %374, align 8, !tbaa !7
  %376 = fmul contract double %370, %375
  %377 = getelementptr inbounds double, double addrspace(1)* %14, i64 %367
  %378 = load double, double addrspace(1)* %377, align 8, !tbaa !7
  %379 = fdiv contract double %376, %378
  %380 = getelementptr inbounds double, double addrspace(1)* %15, i64 %367
  %381 = load double, double addrspace(1)* %380, align 8, !tbaa !7
  %382 = getelementptr inbounds double, double addrspace(1)* %16, i64 %373
  %383 = load double, double addrspace(1)* %382, align 8, !tbaa !7
  %384 = fmul contract double %381, %383
  %385 = fadd contract double %379, %384
  %386 = fmul contract double %381, %12
  %387 = getelementptr inbounds double, double addrspace(1)* %1, i64 %373
  %388 = load double, double addrspace(1)* %387, align 8, !tbaa !7
  %389 = getelementptr inbounds double, double addrspace(1)* %18, i64 %367
  %390 = load double, double addrspace(1)* %389, align 8, !tbaa !7
  %391 = fmul contract double %375, %390
  %392 = fdiv contract double %391, %378
  %393 = fsub contract double %388, %392
  %394 = fmul contract double %386, %393
  %395 = fadd contract double %385, %394
  %396 = fadd contract double %381, %12
  %397 = fadd contract double %17, -1.000000e+00
  %398 = fmul contract double %397, %12
  %399 = fmul contract double %398, %381
  %400 = getelementptr inbounds double, double addrspace(1)* %6, i64 %373
  %401 = load double, double addrspace(1)* %400, align 8, !tbaa !7
  %402 = fmul contract double %399, %401
  br label %403

403:                                              ; preds = %366, %351
  %404 = phi double [ 1.000000e+00, %351 ], [ %402, %366 ]
  %405 = phi double [ %365, %351 ], [ %396, %366 ]
  %406 = phi double [ %360, %351 ], [ %395, %366 ]
  %407 = phi i64 [ %354, %351 ], [ %373, %366 ]
  %408 = fadd contract double %405, %404
  %409 = fdiv contract double %406, %408
  %410 = getelementptr inbounds double, double addrspace(1)* %11, i64 %407
  store double %409, double addrspace(1)* %410, align 8, !tbaa !7
  br label %411

411:                                              ; preds = %403, %346
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

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
