; ModuleID = '../data/hip_kernels/16034/91/main.cu'
source_filename = "../data/hip_kernels/16034/91/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phaseNwithOil(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double %9, double %10, double %11, double %12, i32 addrspace(1)* nocapture readonly %13, i32 addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !7
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = add i32 %33, %27
  %35 = udiv i32 %26, %23
  %36 = mul i32 %35, %23
  %37 = icmp ugt i32 %26, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %34
  %41 = add i32 %40, %18
  %42 = mul i32 %41, %23
  %43 = add i32 %42, %17
  %44 = icmp slt i32 %43, %0
  br i1 %44, label %45, label %368

45:                                               ; preds = %16
  %46 = sext i32 %43 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !16, !amdgpu.noclobber !6
  %49 = fmul contract double %48, %9
  %50 = getelementptr inbounds double, double addrspace(1)* %2, i64 %46
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !16, !amdgpu.noclobber !6
  %52 = fmul contract double %51, %10
  %53 = fadd contract double %49, %52
  %54 = getelementptr inbounds double, double addrspace(1)* %8, i64 %46
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !16, !amdgpu.noclobber !6
  %56 = fadd contract double %55, %53
  %57 = getelementptr inbounds double, double addrspace(1)* %3, i64 %46
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16, !amdgpu.noclobber !6
  %59 = fmul contract double %58, %11
  %60 = fadd contract double %56, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %5, i64 %46
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !16, !amdgpu.noclobber !6
  %63 = fmul contract double %62, %12
  %64 = fsub contract double %60, %63
  %65 = getelementptr inbounds double, double addrspace(1)* %4, i64 %46
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !16, !amdgpu.noclobber !6
  %67 = fmul contract double %59, %66
  %68 = fadd contract double %56, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %6, i64 %46
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !16, !amdgpu.noclobber !6
  %71 = fmul contract double %63, %70
  %72 = fsub contract double %68, %71
  %73 = getelementptr inbounds double, double addrspace(1)* %7, i64 %46
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !16, !amdgpu.noclobber !6
  %75 = tail call double @llvm.fabs.f64(double %64)
  %76 = fcmp olt double %75, 0x41D0000000000000
  br i1 %76, label %77, label %96

77:                                               ; preds = %45
  %78 = fmul double %75, 0x3FE45F306DC9C883
  %79 = tail call double @llvm.rint.f64(double %78)
  %80 = tail call double @llvm.fma.f64(double %79, double 0xBFF921FB54442D18, double %75)
  %81 = tail call double @llvm.fma.f64(double %79, double 0xBC91A62633145C00, double %80)
  %82 = fmul double %79, 0x3C91A62633145C00
  %83 = fneg double %82
  %84 = tail call double @llvm.fma.f64(double %79, double 0x3C91A62633145C00, double %83)
  %85 = fsub double %80, %82
  %86 = fsub double %80, %85
  %87 = fsub double %86, %82
  %88 = fsub double %85, %81
  %89 = fadd double %88, %87
  %90 = fsub double %89, %84
  %91 = tail call double @llvm.fma.f64(double %79, double 0xB97B839A252049C0, double %90)
  %92 = fadd double %81, %91
  %93 = fsub double %92, %81
  %94 = fsub double %91, %93
  %95 = fptosi double %79 to i32
  br label %172

96:                                               ; preds = %45
  %97 = tail call double @llvm.amdgcn.trig.preop.f64(double %75, i32 0)
  %98 = tail call double @llvm.amdgcn.trig.preop.f64(double %75, i32 1)
  %99 = tail call double @llvm.amdgcn.trig.preop.f64(double %75, i32 2)
  %100 = fcmp oge double %75, 0x7B00000000000000
  %101 = tail call double @llvm.amdgcn.ldexp.f64(double %75, i32 -128)
  %102 = select i1 %100, double %101, double %75
  %103 = fmul double %99, %102
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %99, double %102, double %104)
  %106 = fmul double %98, %102
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %98, double %102, double %107)
  %109 = fmul double %97, %102
  %110 = fneg double %109
  %111 = tail call double @llvm.fma.f64(double %97, double %102, double %110)
  %112 = fadd double %106, %111
  %113 = fsub double %112, %106
  %114 = fsub double %112, %113
  %115 = fsub double %111, %113
  %116 = fsub double %106, %114
  %117 = fadd double %115, %116
  %118 = fadd double %103, %108
  %119 = fsub double %118, %103
  %120 = fsub double %118, %119
  %121 = fsub double %108, %119
  %122 = fsub double %103, %120
  %123 = fadd double %121, %122
  %124 = fadd double %118, %117
  %125 = fsub double %124, %118
  %126 = fsub double %124, %125
  %127 = fsub double %117, %125
  %128 = fsub double %118, %126
  %129 = fadd double %127, %128
  %130 = fadd double %123, %129
  %131 = fadd double %105, %130
  %132 = fadd double %109, %112
  %133 = fsub double %132, %109
  %134 = fsub double %112, %133
  %135 = fadd double %134, %124
  %136 = fsub double %135, %134
  %137 = fsub double %124, %136
  %138 = fadd double %137, %131
  %139 = tail call double @llvm.amdgcn.ldexp.f64(double %132, i32 -2)
  %140 = tail call double @llvm.amdgcn.fract.f64(double %139)
  %141 = tail call i1 @llvm.amdgcn.class.f64(double %139, i32 516)
  %142 = select i1 %141, double 0.000000e+00, double %140
  %143 = tail call double @llvm.amdgcn.ldexp.f64(double %142, i32 2)
  %144 = fadd double %143, %135
  %145 = fcmp olt double %144, 0.000000e+00
  %146 = select i1 %145, double 4.000000e+00, double 0.000000e+00
  %147 = fadd double %143, %146
  %148 = fadd double %135, %147
  %149 = fptosi double %148 to i32
  %150 = sitofp i32 %149 to double
  %151 = fsub double %147, %150
  %152 = fadd double %135, %151
  %153 = fsub double %152, %151
  %154 = fsub double %135, %153
  %155 = fadd double %138, %154
  %156 = fcmp oge double %152, 5.000000e-01
  %157 = zext i1 %156 to i32
  %158 = add nsw i32 %157, %149
  %159 = select i1 %156, double 1.000000e+00, double 0.000000e+00
  %160 = fsub double %152, %159
  %161 = fadd double %160, %155
  %162 = fsub double %161, %160
  %163 = fsub double %155, %162
  %164 = fmul double %161, 0x3FF921FB54442D18
  %165 = fneg double %164
  %166 = tail call double @llvm.fma.f64(double %161, double 0x3FF921FB54442D18, double %165)
  %167 = tail call double @llvm.fma.f64(double %161, double 0x3C91A62633145C07, double %166)
  %168 = tail call double @llvm.fma.f64(double %163, double 0x3FF921FB54442D18, double %167)
  %169 = fadd double %164, %168
  %170 = fsub double %169, %164
  %171 = fsub double %168, %170
  br label %172

172:                                              ; preds = %77, %96
  %173 = phi double [ %94, %77 ], [ %171, %96 ]
  %174 = phi double [ %92, %77 ], [ %169, %96 ]
  %175 = phi i32 [ %95, %77 ], [ %158, %96 ]
  %176 = fmul double %174, %174
  %177 = fmul double %176, 5.000000e-01
  %178 = fsub double 1.000000e+00, %177
  %179 = fsub double 1.000000e+00, %178
  %180 = fsub double %179, %177
  %181 = fmul double %176, %176
  %182 = tail call double @llvm.fma.f64(double %176, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %183 = tail call double @llvm.fma.f64(double %176, double %182, double 0xBE927E4FA17F65F6)
  %184 = tail call double @llvm.fma.f64(double %176, double %183, double 0x3EFA01A019F4EC90)
  %185 = tail call double @llvm.fma.f64(double %176, double %184, double 0xBF56C16C16C16967)
  %186 = tail call double @llvm.fma.f64(double %176, double %185, double 0x3FA5555555555555)
  %187 = fneg double %173
  %188 = tail call double @llvm.fma.f64(double %174, double %187, double %180)
  %189 = tail call double @llvm.fma.f64(double %181, double %186, double %188)
  %190 = fadd double %178, %189
  %191 = tail call double @llvm.fma.f64(double %176, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %192 = tail call double @llvm.fma.f64(double %176, double %191, double 0x3EC71DE3796CDE01)
  %193 = tail call double @llvm.fma.f64(double %176, double %192, double 0xBF2A01A019E83E5C)
  %194 = tail call double @llvm.fma.f64(double %176, double %193, double 0x3F81111111110BB3)
  %195 = fneg double %176
  %196 = fmul double %174, %195
  %197 = fmul double %173, 5.000000e-01
  %198 = tail call double @llvm.fma.f64(double %196, double %194, double %197)
  %199 = tail call double @llvm.fma.f64(double %176, double %198, double %187)
  %200 = tail call double @llvm.fma.f64(double %196, double 0xBFC5555555555555, double %199)
  %201 = fsub double %174, %200
  %202 = fneg double %201
  %203 = and i32 %175, 1
  %204 = icmp eq i32 %203, 0
  %205 = select i1 %204, double %190, double %202
  %206 = bitcast double %205 to <2 x i32>
  %207 = shl i32 %175, 30
  %208 = and i32 %207, -2147483648
  %209 = extractelement <2 x i32> %206, i64 1
  %210 = xor i32 %209, %208
  %211 = insertelement <2 x i32> %206, i32 %210, i64 1
  %212 = tail call i1 @llvm.amdgcn.class.f64(double %75, i32 504)
  %213 = select i1 %212, <2 x i32> %211, <2 x i32> <i32 0, i32 2146959360>
  %214 = bitcast <2 x i32> %213 to double
  %215 = fmul contract double %74, %214
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %46
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !20, !amdgpu.noclobber !6
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds double, double addrspace(1)* %15, i64 %218
  store double %215, double addrspace(1)* %219, align 8, !tbaa !16
  %220 = load double, double addrspace(1)* %73, align 8, !tbaa !16
  %221 = tail call double @llvm.fabs.f64(double %72)
  %222 = fcmp olt double %221, 0x41D0000000000000
  br i1 %222, label %223, label %242

223:                                              ; preds = %172
  %224 = fmul double %221, 0x3FE45F306DC9C883
  %225 = tail call double @llvm.rint.f64(double %224)
  %226 = tail call double @llvm.fma.f64(double %225, double 0xBFF921FB54442D18, double %221)
  %227 = tail call double @llvm.fma.f64(double %225, double 0xBC91A62633145C00, double %226)
  %228 = fmul double %225, 0x3C91A62633145C00
  %229 = fneg double %228
  %230 = tail call double @llvm.fma.f64(double %225, double 0x3C91A62633145C00, double %229)
  %231 = fsub double %226, %228
  %232 = fsub double %226, %231
  %233 = fsub double %232, %228
  %234 = fsub double %231, %227
  %235 = fadd double %234, %233
  %236 = fsub double %235, %230
  %237 = tail call double @llvm.fma.f64(double %225, double 0xB97B839A252049C0, double %236)
  %238 = fadd double %227, %237
  %239 = fsub double %238, %227
  %240 = fsub double %237, %239
  %241 = fptosi double %225 to i32
  br label %318

242:                                              ; preds = %172
  %243 = tail call double @llvm.amdgcn.trig.preop.f64(double %221, i32 0)
  %244 = tail call double @llvm.amdgcn.trig.preop.f64(double %221, i32 1)
  %245 = tail call double @llvm.amdgcn.trig.preop.f64(double %221, i32 2)
  %246 = fcmp oge double %221, 0x7B00000000000000
  %247 = tail call double @llvm.amdgcn.ldexp.f64(double %221, i32 -128)
  %248 = select i1 %246, double %247, double %221
  %249 = fmul double %245, %248
  %250 = fneg double %249
  %251 = tail call double @llvm.fma.f64(double %245, double %248, double %250)
  %252 = fmul double %244, %248
  %253 = fneg double %252
  %254 = tail call double @llvm.fma.f64(double %244, double %248, double %253)
  %255 = fmul double %243, %248
  %256 = fneg double %255
  %257 = tail call double @llvm.fma.f64(double %243, double %248, double %256)
  %258 = fadd double %252, %257
  %259 = fsub double %258, %252
  %260 = fsub double %258, %259
  %261 = fsub double %257, %259
  %262 = fsub double %252, %260
  %263 = fadd double %261, %262
  %264 = fadd double %249, %254
  %265 = fsub double %264, %249
  %266 = fsub double %264, %265
  %267 = fsub double %254, %265
  %268 = fsub double %249, %266
  %269 = fadd double %267, %268
  %270 = fadd double %264, %263
  %271 = fsub double %270, %264
  %272 = fsub double %270, %271
  %273 = fsub double %263, %271
  %274 = fsub double %264, %272
  %275 = fadd double %273, %274
  %276 = fadd double %269, %275
  %277 = fadd double %251, %276
  %278 = fadd double %255, %258
  %279 = fsub double %278, %255
  %280 = fsub double %258, %279
  %281 = fadd double %280, %270
  %282 = fsub double %281, %280
  %283 = fsub double %270, %282
  %284 = fadd double %283, %277
  %285 = tail call double @llvm.amdgcn.ldexp.f64(double %278, i32 -2)
  %286 = tail call double @llvm.amdgcn.fract.f64(double %285)
  %287 = tail call i1 @llvm.amdgcn.class.f64(double %285, i32 516)
  %288 = select i1 %287, double 0.000000e+00, double %286
  %289 = tail call double @llvm.amdgcn.ldexp.f64(double %288, i32 2)
  %290 = fadd double %289, %281
  %291 = fcmp olt double %290, 0.000000e+00
  %292 = select i1 %291, double 4.000000e+00, double 0.000000e+00
  %293 = fadd double %289, %292
  %294 = fadd double %281, %293
  %295 = fptosi double %294 to i32
  %296 = sitofp i32 %295 to double
  %297 = fsub double %293, %296
  %298 = fadd double %281, %297
  %299 = fsub double %298, %297
  %300 = fsub double %281, %299
  %301 = fadd double %284, %300
  %302 = fcmp oge double %298, 5.000000e-01
  %303 = zext i1 %302 to i32
  %304 = add nsw i32 %303, %295
  %305 = select i1 %302, double 1.000000e+00, double 0.000000e+00
  %306 = fsub double %298, %305
  %307 = fadd double %306, %301
  %308 = fsub double %307, %306
  %309 = fsub double %301, %308
  %310 = fmul double %307, 0x3FF921FB54442D18
  %311 = fneg double %310
  %312 = tail call double @llvm.fma.f64(double %307, double 0x3FF921FB54442D18, double %311)
  %313 = tail call double @llvm.fma.f64(double %307, double 0x3C91A62633145C07, double %312)
  %314 = tail call double @llvm.fma.f64(double %309, double 0x3FF921FB54442D18, double %313)
  %315 = fadd double %310, %314
  %316 = fsub double %315, %310
  %317 = fsub double %314, %316
  br label %318

318:                                              ; preds = %223, %242
  %319 = phi double [ %240, %223 ], [ %317, %242 ]
  %320 = phi double [ %238, %223 ], [ %315, %242 ]
  %321 = phi i32 [ %241, %223 ], [ %304, %242 ]
  %322 = fmul double %320, %320
  %323 = fmul double %322, 5.000000e-01
  %324 = fsub double 1.000000e+00, %323
  %325 = fsub double 1.000000e+00, %324
  %326 = fsub double %325, %323
  %327 = fmul double %322, %322
  %328 = tail call double @llvm.fma.f64(double %322, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %329 = tail call double @llvm.fma.f64(double %322, double %328, double 0xBE927E4FA17F65F6)
  %330 = tail call double @llvm.fma.f64(double %322, double %329, double 0x3EFA01A019F4EC90)
  %331 = tail call double @llvm.fma.f64(double %322, double %330, double 0xBF56C16C16C16967)
  %332 = tail call double @llvm.fma.f64(double %322, double %331, double 0x3FA5555555555555)
  %333 = fneg double %319
  %334 = tail call double @llvm.fma.f64(double %320, double %333, double %326)
  %335 = tail call double @llvm.fma.f64(double %327, double %332, double %334)
  %336 = fadd double %324, %335
  %337 = tail call double @llvm.fma.f64(double %322, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %338 = tail call double @llvm.fma.f64(double %322, double %337, double 0x3EC71DE3796CDE01)
  %339 = tail call double @llvm.fma.f64(double %322, double %338, double 0xBF2A01A019E83E5C)
  %340 = tail call double @llvm.fma.f64(double %322, double %339, double 0x3F81111111110BB3)
  %341 = fneg double %322
  %342 = fmul double %320, %341
  %343 = fmul double %319, 5.000000e-01
  %344 = tail call double @llvm.fma.f64(double %342, double %340, double %343)
  %345 = tail call double @llvm.fma.f64(double %322, double %344, double %333)
  %346 = tail call double @llvm.fma.f64(double %342, double 0xBFC5555555555555, double %345)
  %347 = fsub double %320, %346
  %348 = and i32 %321, 1
  %349 = icmp eq i32 %348, 0
  %350 = select i1 %349, double %347, double %336
  %351 = bitcast double %350 to <2 x i32>
  %352 = shl i32 %321, 30
  %353 = bitcast double %72 to <2 x i32>
  %354 = extractelement <2 x i32> %353, i64 1
  %355 = xor i32 %352, %354
  %356 = and i32 %355, -2147483648
  %357 = extractelement <2 x i32> %351, i64 1
  %358 = xor i32 %357, %356
  %359 = insertelement <2 x i32> %351, i32 %358, i64 1
  %360 = tail call i1 @llvm.amdgcn.class.f64(double %221, i32 504)
  %361 = select i1 %360, <2 x i32> %359, <2 x i32> <i32 0, i32 2146959360>
  %362 = bitcast <2 x i32> %361 to double
  %363 = fmul contract double %220, %362
  %364 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %46
  %365 = load i32, i32 addrspace(1)* %364, align 4, !tbaa !20, !amdgpu.noclobber !6
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds double, double addrspace(1)* %15, i64 %366
  store double %363, double addrspace(1)* %367, align 8, !tbaa !16
  br label %368

368:                                              ; preds = %318, %16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
