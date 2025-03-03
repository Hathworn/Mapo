; ModuleID = '../data/hip_kernels/925/73/main.cu'
source_filename = "../data/hip_kernels/925/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19make_complex_kernelPdPiP15HIP_vector_typeIdLj2EE(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = load double, double addrspace(1)* %0, align 8, !tbaa !4
  %5 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !8
  switch i32 %5, label %230 [
    i32 0, label %6
    i32 1, label %8
    i32 2, label %33
  ]

6:                                                ; preds = %3
  %7 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %4, i64 0
  br label %230

8:                                                ; preds = %3
  %9 = fneg contract double %4
  %10 = fmul double %4, 0xBFF71547652B82FE
  %11 = tail call double @llvm.rint.f64(double %10)
  %12 = fneg double %11
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3FE62E42FEFA39EF, double %9)
  %14 = tail call double @llvm.fma.f64(double %12, double 0x3C7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %16 = tail call double @llvm.fma.f64(double %14, double %15, double 0x3EC71DEE623FDE64)
  %17 = tail call double @llvm.fma.f64(double %14, double %16, double 0x3EFA01997C89E6B0)
  %18 = tail call double @llvm.fma.f64(double %14, double %17, double 0x3F2A01A014761F6E)
  %19 = tail call double @llvm.fma.f64(double %14, double %18, double 0x3F56C16C1852B7B0)
  %20 = tail call double @llvm.fma.f64(double %14, double %19, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %14, double %20, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %14, double %21, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %14, double %22, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %14, double %23, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %14, double %24, double 1.000000e+00)
  %26 = fptosi double %11 to i32
  %27 = tail call double @llvm.amdgcn.ldexp.f64(double %25, i32 %26)
  %28 = fcmp olt double %4, -1.024000e+03
  %29 = select i1 %28, double 0x7FF0000000000000, double %27
  %30 = fcmp ogt double %4, 1.075000e+03
  %31 = select i1 %30, double 0.000000e+00, double %29
  %32 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %31, i64 0
  br label %230

33:                                               ; preds = %3
  %34 = fneg contract double %4
  %35 = tail call double @llvm.fabs.f64(double %34)
  %36 = fcmp olt double %35, 0x41D0000000000000
  br i1 %36, label %37, label %94

37:                                               ; preds = %33
  %38 = fmul double %35, 0x3FE45F306DC9C883
  %39 = tail call double @llvm.rint.f64(double %38)
  %40 = tail call double @llvm.fma.f64(double %39, double 0xBFF921FB54442D18, double %35)
  %41 = tail call double @llvm.fma.f64(double %39, double 0xBC91A62633145C00, double %40)
  %42 = fmul double %39, 0x3C91A62633145C00
  %43 = fneg double %42
  %44 = tail call double @llvm.fma.f64(double %39, double 0x3C91A62633145C00, double %43)
  %45 = fsub double %40, %42
  %46 = fsub double %40, %45
  %47 = fsub double %46, %42
  %48 = fsub double %45, %41
  %49 = fadd double %48, %47
  %50 = fsub double %49, %44
  %51 = tail call double @llvm.fma.f64(double %39, double 0xB97B839A252049C0, double %50)
  %52 = fadd double %41, %51
  %53 = fsub double %52, %41
  %54 = fsub double %51, %53
  %55 = fptosi double %39 to i32
  %56 = fmul double %52, %52
  %57 = fmul double %56, 5.000000e-01
  %58 = fsub double 1.000000e+00, %57
  %59 = fsub double 1.000000e+00, %58
  %60 = fsub double %59, %57
  %61 = fmul double %56, %56
  %62 = tail call double @llvm.fma.f64(double %56, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %63 = tail call double @llvm.fma.f64(double %56, double %62, double 0xBE927E4FA17F65F6)
  %64 = tail call double @llvm.fma.f64(double %56, double %63, double 0x3EFA01A019F4EC90)
  %65 = tail call double @llvm.fma.f64(double %56, double %64, double 0xBF56C16C16C16967)
  %66 = tail call double @llvm.fma.f64(double %56, double %65, double 0x3FA5555555555555)
  %67 = fneg double %54
  %68 = tail call double @llvm.fma.f64(double %52, double %67, double %60)
  %69 = tail call double @llvm.fma.f64(double %61, double %66, double %68)
  %70 = fadd double %58, %69
  %71 = tail call double @llvm.fma.f64(double %56, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %72 = tail call double @llvm.fma.f64(double %56, double %71, double 0x3EC71DE3796CDE01)
  %73 = tail call double @llvm.fma.f64(double %56, double %72, double 0xBF2A01A019E83E5C)
  %74 = tail call double @llvm.fma.f64(double %56, double %73, double 0x3F81111111110BB3)
  %75 = fneg double %56
  %76 = fmul double %52, %75
  %77 = fmul double %54, 5.000000e-01
  %78 = tail call double @llvm.fma.f64(double %76, double %74, double %77)
  %79 = tail call double @llvm.fma.f64(double %56, double %78, double %67)
  %80 = tail call double @llvm.fma.f64(double %76, double 0xBFC5555555555555, double %79)
  %81 = fsub double %52, %80
  %82 = fneg double %81
  %83 = and i32 %55, 1
  %84 = icmp eq i32 %83, 0
  %85 = select i1 %84, double %70, double %82
  %86 = bitcast double %85 to <2 x i32>
  %87 = shl i32 %55, 30
  %88 = and i32 %87, -2147483648
  %89 = extractelement <2 x i32> %86, i64 1
  %90 = xor i32 %89, %88
  %91 = insertelement <2 x i32> %86, i32 %90, i64 1
  %92 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 504)
  %93 = select i1 %92, <2 x i32> %91, <2 x i32> <i32 0, i32 2146959360>
  br label %208

94:                                               ; preds = %33
  %95 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 0)
  %96 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 1)
  %97 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 2)
  %98 = fcmp oge double %35, 0x7B00000000000000
  %99 = tail call double @llvm.amdgcn.ldexp.f64(double %35, i32 -128)
  %100 = select i1 %98, double %99, double %35
  %101 = fmul double %97, %100
  %102 = fneg double %101
  %103 = tail call double @llvm.fma.f64(double %97, double %100, double %102)
  %104 = fmul double %96, %100
  %105 = fneg double %104
  %106 = tail call double @llvm.fma.f64(double %96, double %100, double %105)
  %107 = fmul double %95, %100
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %95, double %100, double %108)
  %110 = fadd double %104, %109
  %111 = fsub double %110, %104
  %112 = fsub double %110, %111
  %113 = fsub double %109, %111
  %114 = fsub double %104, %112
  %115 = fadd double %113, %114
  %116 = fadd double %101, %106
  %117 = fsub double %116, %101
  %118 = fsub double %116, %117
  %119 = fsub double %106, %117
  %120 = fsub double %101, %118
  %121 = fadd double %119, %120
  %122 = fadd double %116, %115
  %123 = fsub double %122, %116
  %124 = fsub double %122, %123
  %125 = fsub double %115, %123
  %126 = fsub double %116, %124
  %127 = fadd double %125, %126
  %128 = fadd double %121, %127
  %129 = fadd double %103, %128
  %130 = fadd double %107, %110
  %131 = fsub double %130, %107
  %132 = fsub double %110, %131
  %133 = fadd double %132, %122
  %134 = fsub double %133, %132
  %135 = fsub double %122, %134
  %136 = fadd double %135, %129
  %137 = tail call double @llvm.amdgcn.ldexp.f64(double %130, i32 -2)
  %138 = tail call double @llvm.amdgcn.fract.f64(double %137)
  %139 = tail call i1 @llvm.amdgcn.class.f64(double %137, i32 516)
  %140 = select i1 %139, double 0.000000e+00, double %138
  %141 = tail call double @llvm.amdgcn.ldexp.f64(double %140, i32 2)
  %142 = fadd double %141, %133
  %143 = fcmp olt double %142, 0.000000e+00
  %144 = select i1 %143, double 4.000000e+00, double 0.000000e+00
  %145 = fadd double %141, %144
  %146 = fadd double %133, %145
  %147 = fptosi double %146 to i32
  %148 = sitofp i32 %147 to double
  %149 = fsub double %145, %148
  %150 = fadd double %133, %149
  %151 = fsub double %150, %149
  %152 = fsub double %133, %151
  %153 = fadd double %136, %152
  %154 = fcmp oge double %150, 5.000000e-01
  %155 = zext i1 %154 to i32
  %156 = add nsw i32 %155, %147
  %157 = select i1 %154, double 1.000000e+00, double 0.000000e+00
  %158 = fsub double %150, %157
  %159 = fadd double %158, %153
  %160 = fsub double %159, %158
  %161 = fsub double %153, %160
  %162 = fmul double %159, 0x3FF921FB54442D18
  %163 = fneg double %162
  %164 = tail call double @llvm.fma.f64(double %159, double 0x3FF921FB54442D18, double %163)
  %165 = tail call double @llvm.fma.f64(double %159, double 0x3C91A62633145C07, double %164)
  %166 = tail call double @llvm.fma.f64(double %161, double 0x3FF921FB54442D18, double %165)
  %167 = fadd double %162, %166
  %168 = fsub double %167, %162
  %169 = fsub double %166, %168
  %170 = fmul double %167, %167
  %171 = fmul double %170, 5.000000e-01
  %172 = fsub double 1.000000e+00, %171
  %173 = fsub double 1.000000e+00, %172
  %174 = fsub double %173, %171
  %175 = fmul double %170, %170
  %176 = tail call double @llvm.fma.f64(double %170, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %177 = tail call double @llvm.fma.f64(double %170, double %176, double 0xBE927E4FA17F65F6)
  %178 = tail call double @llvm.fma.f64(double %170, double %177, double 0x3EFA01A019F4EC90)
  %179 = tail call double @llvm.fma.f64(double %170, double %178, double 0xBF56C16C16C16967)
  %180 = tail call double @llvm.fma.f64(double %170, double %179, double 0x3FA5555555555555)
  %181 = fneg double %169
  %182 = tail call double @llvm.fma.f64(double %167, double %181, double %174)
  %183 = tail call double @llvm.fma.f64(double %175, double %180, double %182)
  %184 = fadd double %172, %183
  %185 = tail call double @llvm.fma.f64(double %170, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %186 = tail call double @llvm.fma.f64(double %170, double %185, double 0x3EC71DE3796CDE01)
  %187 = tail call double @llvm.fma.f64(double %170, double %186, double 0xBF2A01A019E83E5C)
  %188 = tail call double @llvm.fma.f64(double %170, double %187, double 0x3F81111111110BB3)
  %189 = fneg double %170
  %190 = fmul double %167, %189
  %191 = fmul double %169, 5.000000e-01
  %192 = tail call double @llvm.fma.f64(double %190, double %188, double %191)
  %193 = tail call double @llvm.fma.f64(double %170, double %192, double %181)
  %194 = tail call double @llvm.fma.f64(double %190, double 0xBFC5555555555555, double %193)
  %195 = fsub double %167, %194
  %196 = fneg double %195
  %197 = and i32 %156, 1
  %198 = icmp eq i32 %197, 0
  %199 = select i1 %198, double %184, double %196
  %200 = bitcast double %199 to <2 x i32>
  %201 = shl i32 %156, 30
  %202 = and i32 %201, -2147483648
  %203 = extractelement <2 x i32> %200, i64 1
  %204 = xor i32 %203, %202
  %205 = insertelement <2 x i32> %200, i32 %204, i64 1
  %206 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 504)
  %207 = select i1 %206, <2 x i32> %205, <2 x i32> <i32 0, i32 2146959360>
  br label %208

208:                                              ; preds = %94, %37
  %209 = phi <2 x i32> [ %93, %37 ], [ %207, %94 ]
  %210 = phi i32 [ %87, %37 ], [ %201, %94 ]
  %211 = phi i32 [ %83, %37 ], [ %197, %94 ]
  %212 = phi double [ %81, %37 ], [ %195, %94 ]
  %213 = phi double [ %70, %37 ], [ %184, %94 ]
  %214 = phi i1 [ %92, %37 ], [ %206, %94 ]
  %215 = bitcast <2 x i32> %209 to double
  %216 = insertelement <2 x double> undef, double %215, i64 0
  %217 = icmp eq i32 %211, 0
  %218 = select i1 %217, double %212, double %213
  %219 = bitcast double %218 to <2 x i32>
  %220 = bitcast double %34 to <2 x i32>
  %221 = extractelement <2 x i32> %220, i64 1
  %222 = xor i32 %210, %221
  %223 = and i32 %222, -2147483648
  %224 = extractelement <2 x i32> %219, i64 1
  %225 = xor i32 %224, %223
  %226 = insertelement <2 x i32> %219, i32 %225, i64 1
  %227 = select i1 %214, <2 x i32> %226, <2 x i32> <i32 0, i32 2146959360>
  %228 = bitcast <2 x i32> %227 to double
  %229 = insertelement <2 x double> %216, double %228, i64 1
  br label %230

230:                                              ; preds = %3, %6, %8, %208
  %231 = phi <2 x double> [ undef, %3 ], [ %229, %208 ], [ %32, %8 ], [ %7, %6 ]
  %232 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 0, i32 0, i32 0, i32 0
  store <2 x double> %231, <2 x double> addrspace(1)* %232, align 16
  %233 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %234 = load double, double addrspace(1)* %233, align 8, !tbaa !4
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %236 = load i32, i32 addrspace(1)* %235, align 4, !tbaa !8
  switch i32 %236, label %461 [
    i32 0, label %459
    i32 1, label %434
    i32 2, label %237
  ]

237:                                              ; preds = %230
  %238 = fneg contract double %234
  %239 = tail call double @llvm.fabs.f64(double %238)
  %240 = fcmp olt double %239, 0x41D0000000000000
  br i1 %240, label %355, label %241

241:                                              ; preds = %237
  %242 = tail call double @llvm.amdgcn.trig.preop.f64(double %239, i32 0)
  %243 = tail call double @llvm.amdgcn.trig.preop.f64(double %239, i32 1)
  %244 = tail call double @llvm.amdgcn.trig.preop.f64(double %239, i32 2)
  %245 = fcmp oge double %239, 0x7B00000000000000
  %246 = tail call double @llvm.amdgcn.ldexp.f64(double %239, i32 -128)
  %247 = select i1 %245, double %246, double %239
  %248 = fmul double %244, %247
  %249 = fneg double %248
  %250 = tail call double @llvm.fma.f64(double %244, double %247, double %249)
  %251 = fmul double %243, %247
  %252 = fneg double %251
  %253 = tail call double @llvm.fma.f64(double %243, double %247, double %252)
  %254 = fmul double %242, %247
  %255 = fneg double %254
  %256 = tail call double @llvm.fma.f64(double %242, double %247, double %255)
  %257 = fadd double %251, %256
  %258 = fsub double %257, %251
  %259 = fsub double %257, %258
  %260 = fsub double %256, %258
  %261 = fsub double %251, %259
  %262 = fadd double %260, %261
  %263 = fadd double %248, %253
  %264 = fsub double %263, %248
  %265 = fsub double %263, %264
  %266 = fsub double %253, %264
  %267 = fsub double %248, %265
  %268 = fadd double %266, %267
  %269 = fadd double %263, %262
  %270 = fsub double %269, %263
  %271 = fsub double %269, %270
  %272 = fsub double %262, %270
  %273 = fsub double %263, %271
  %274 = fadd double %272, %273
  %275 = fadd double %268, %274
  %276 = fadd double %250, %275
  %277 = fadd double %254, %257
  %278 = fsub double %277, %254
  %279 = fsub double %257, %278
  %280 = fadd double %279, %269
  %281 = fsub double %280, %279
  %282 = fsub double %269, %281
  %283 = fadd double %282, %276
  %284 = tail call double @llvm.amdgcn.ldexp.f64(double %277, i32 -2)
  %285 = tail call double @llvm.amdgcn.fract.f64(double %284)
  %286 = tail call i1 @llvm.amdgcn.class.f64(double %284, i32 516)
  %287 = select i1 %286, double 0.000000e+00, double %285
  %288 = tail call double @llvm.amdgcn.ldexp.f64(double %287, i32 2)
  %289 = fadd double %288, %280
  %290 = fcmp olt double %289, 0.000000e+00
  %291 = select i1 %290, double 4.000000e+00, double 0.000000e+00
  %292 = fadd double %288, %291
  %293 = fadd double %280, %292
  %294 = fptosi double %293 to i32
  %295 = sitofp i32 %294 to double
  %296 = fsub double %292, %295
  %297 = fadd double %280, %296
  %298 = fsub double %297, %296
  %299 = fsub double %280, %298
  %300 = fadd double %283, %299
  %301 = fcmp oge double %297, 5.000000e-01
  %302 = zext i1 %301 to i32
  %303 = add nsw i32 %302, %294
  %304 = select i1 %301, double 1.000000e+00, double 0.000000e+00
  %305 = fsub double %297, %304
  %306 = fadd double %305, %300
  %307 = fsub double %306, %305
  %308 = fsub double %300, %307
  %309 = fmul double %306, 0x3FF921FB54442D18
  %310 = fneg double %309
  %311 = tail call double @llvm.fma.f64(double %306, double 0x3FF921FB54442D18, double %310)
  %312 = tail call double @llvm.fma.f64(double %306, double 0x3C91A62633145C07, double %311)
  %313 = tail call double @llvm.fma.f64(double %308, double 0x3FF921FB54442D18, double %312)
  %314 = fadd double %309, %313
  %315 = fsub double %314, %309
  %316 = fsub double %313, %315
  %317 = fmul double %314, %314
  %318 = fmul double %317, 5.000000e-01
  %319 = fsub double 1.000000e+00, %318
  %320 = fsub double 1.000000e+00, %319
  %321 = fsub double %320, %318
  %322 = fmul double %317, %317
  %323 = tail call double @llvm.fma.f64(double %317, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %324 = tail call double @llvm.fma.f64(double %317, double %323, double 0xBE927E4FA17F65F6)
  %325 = tail call double @llvm.fma.f64(double %317, double %324, double 0x3EFA01A019F4EC90)
  %326 = tail call double @llvm.fma.f64(double %317, double %325, double 0xBF56C16C16C16967)
  %327 = tail call double @llvm.fma.f64(double %317, double %326, double 0x3FA5555555555555)
  %328 = fneg double %316
  %329 = tail call double @llvm.fma.f64(double %314, double %328, double %321)
  %330 = tail call double @llvm.fma.f64(double %322, double %327, double %329)
  %331 = fadd double %319, %330
  %332 = tail call double @llvm.fma.f64(double %317, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %333 = tail call double @llvm.fma.f64(double %317, double %332, double 0x3EC71DE3796CDE01)
  %334 = tail call double @llvm.fma.f64(double %317, double %333, double 0xBF2A01A019E83E5C)
  %335 = tail call double @llvm.fma.f64(double %317, double %334, double 0x3F81111111110BB3)
  %336 = fneg double %317
  %337 = fmul double %314, %336
  %338 = fmul double %316, 5.000000e-01
  %339 = tail call double @llvm.fma.f64(double %337, double %335, double %338)
  %340 = tail call double @llvm.fma.f64(double %317, double %339, double %328)
  %341 = tail call double @llvm.fma.f64(double %337, double 0xBFC5555555555555, double %340)
  %342 = fsub double %314, %341
  %343 = fneg double %342
  %344 = and i32 %303, 1
  %345 = icmp eq i32 %344, 0
  %346 = select i1 %345, double %331, double %343
  %347 = bitcast double %346 to <2 x i32>
  %348 = shl i32 %303, 30
  %349 = and i32 %348, -2147483648
  %350 = extractelement <2 x i32> %347, i64 1
  %351 = xor i32 %350, %349
  %352 = insertelement <2 x i32> %347, i32 %351, i64 1
  %353 = tail call i1 @llvm.amdgcn.class.f64(double %239, i32 504)
  %354 = select i1 %353, <2 x i32> %352, <2 x i32> <i32 0, i32 2146959360>
  br label %412

355:                                              ; preds = %237
  %356 = fmul double %239, 0x3FE45F306DC9C883
  %357 = tail call double @llvm.rint.f64(double %356)
  %358 = tail call double @llvm.fma.f64(double %357, double 0xBFF921FB54442D18, double %239)
  %359 = tail call double @llvm.fma.f64(double %357, double 0xBC91A62633145C00, double %358)
  %360 = fmul double %357, 0x3C91A62633145C00
  %361 = fneg double %360
  %362 = tail call double @llvm.fma.f64(double %357, double 0x3C91A62633145C00, double %361)
  %363 = fsub double %358, %360
  %364 = fsub double %358, %363
  %365 = fsub double %364, %360
  %366 = fsub double %363, %359
  %367 = fadd double %366, %365
  %368 = fsub double %367, %362
  %369 = tail call double @llvm.fma.f64(double %357, double 0xB97B839A252049C0, double %368)
  %370 = fadd double %359, %369
  %371 = fsub double %370, %359
  %372 = fsub double %369, %371
  %373 = fptosi double %357 to i32
  %374 = fmul double %370, %370
  %375 = fmul double %374, 5.000000e-01
  %376 = fsub double 1.000000e+00, %375
  %377 = fsub double 1.000000e+00, %376
  %378 = fsub double %377, %375
  %379 = fmul double %374, %374
  %380 = tail call double @llvm.fma.f64(double %374, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %381 = tail call double @llvm.fma.f64(double %374, double %380, double 0xBE927E4FA17F65F6)
  %382 = tail call double @llvm.fma.f64(double %374, double %381, double 0x3EFA01A019F4EC90)
  %383 = tail call double @llvm.fma.f64(double %374, double %382, double 0xBF56C16C16C16967)
  %384 = tail call double @llvm.fma.f64(double %374, double %383, double 0x3FA5555555555555)
  %385 = fneg double %372
  %386 = tail call double @llvm.fma.f64(double %370, double %385, double %378)
  %387 = tail call double @llvm.fma.f64(double %379, double %384, double %386)
  %388 = fadd double %376, %387
  %389 = tail call double @llvm.fma.f64(double %374, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %390 = tail call double @llvm.fma.f64(double %374, double %389, double 0x3EC71DE3796CDE01)
  %391 = tail call double @llvm.fma.f64(double %374, double %390, double 0xBF2A01A019E83E5C)
  %392 = tail call double @llvm.fma.f64(double %374, double %391, double 0x3F81111111110BB3)
  %393 = fneg double %374
  %394 = fmul double %370, %393
  %395 = fmul double %372, 5.000000e-01
  %396 = tail call double @llvm.fma.f64(double %394, double %392, double %395)
  %397 = tail call double @llvm.fma.f64(double %374, double %396, double %385)
  %398 = tail call double @llvm.fma.f64(double %394, double 0xBFC5555555555555, double %397)
  %399 = fsub double %370, %398
  %400 = fneg double %399
  %401 = and i32 %373, 1
  %402 = icmp eq i32 %401, 0
  %403 = select i1 %402, double %388, double %400
  %404 = bitcast double %403 to <2 x i32>
  %405 = shl i32 %373, 30
  %406 = and i32 %405, -2147483648
  %407 = extractelement <2 x i32> %404, i64 1
  %408 = xor i32 %407, %406
  %409 = insertelement <2 x i32> %404, i32 %408, i64 1
  %410 = tail call i1 @llvm.amdgcn.class.f64(double %239, i32 504)
  %411 = select i1 %410, <2 x i32> %409, <2 x i32> <i32 0, i32 2146959360>
  br label %412

412:                                              ; preds = %355, %241
  %413 = phi <2 x i32> [ %411, %355 ], [ %354, %241 ]
  %414 = phi i32 [ %405, %355 ], [ %348, %241 ]
  %415 = phi i32 [ %401, %355 ], [ %344, %241 ]
  %416 = phi double [ %399, %355 ], [ %342, %241 ]
  %417 = phi double [ %388, %355 ], [ %331, %241 ]
  %418 = phi i1 [ %410, %355 ], [ %353, %241 ]
  %419 = bitcast <2 x i32> %413 to double
  %420 = insertelement <2 x double> undef, double %419, i64 0
  %421 = icmp eq i32 %415, 0
  %422 = select i1 %421, double %416, double %417
  %423 = bitcast double %422 to <2 x i32>
  %424 = bitcast double %238 to <2 x i32>
  %425 = extractelement <2 x i32> %424, i64 1
  %426 = xor i32 %414, %425
  %427 = and i32 %426, -2147483648
  %428 = extractelement <2 x i32> %423, i64 1
  %429 = xor i32 %428, %427
  %430 = insertelement <2 x i32> %423, i32 %429, i64 1
  %431 = select i1 %418, <2 x i32> %430, <2 x i32> <i32 0, i32 2146959360>
  %432 = bitcast <2 x i32> %431 to double
  %433 = insertelement <2 x double> %420, double %432, i64 1
  br label %461

434:                                              ; preds = %230
  %435 = fneg contract double %234
  %436 = fmul double %234, 0xBFF71547652B82FE
  %437 = tail call double @llvm.rint.f64(double %436)
  %438 = fneg double %437
  %439 = tail call double @llvm.fma.f64(double %438, double 0x3FE62E42FEFA39EF, double %435)
  %440 = tail call double @llvm.fma.f64(double %438, double 0x3C7ABC9E3B39803F, double %439)
  %441 = tail call double @llvm.fma.f64(double %440, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %442 = tail call double @llvm.fma.f64(double %440, double %441, double 0x3EC71DEE623FDE64)
  %443 = tail call double @llvm.fma.f64(double %440, double %442, double 0x3EFA01997C89E6B0)
  %444 = tail call double @llvm.fma.f64(double %440, double %443, double 0x3F2A01A014761F6E)
  %445 = tail call double @llvm.fma.f64(double %440, double %444, double 0x3F56C16C1852B7B0)
  %446 = tail call double @llvm.fma.f64(double %440, double %445, double 0x3F81111111122322)
  %447 = tail call double @llvm.fma.f64(double %440, double %446, double 0x3FA55555555502A1)
  %448 = tail call double @llvm.fma.f64(double %440, double %447, double 0x3FC5555555555511)
  %449 = tail call double @llvm.fma.f64(double %440, double %448, double 0x3FE000000000000B)
  %450 = tail call double @llvm.fma.f64(double %440, double %449, double 1.000000e+00)
  %451 = tail call double @llvm.fma.f64(double %440, double %450, double 1.000000e+00)
  %452 = fptosi double %437 to i32
  %453 = tail call double @llvm.amdgcn.ldexp.f64(double %451, i32 %452)
  %454 = fcmp olt double %234, -1.024000e+03
  %455 = select i1 %454, double 0x7FF0000000000000, double %453
  %456 = fcmp ogt double %234, 1.075000e+03
  %457 = select i1 %456, double 0.000000e+00, double %455
  %458 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %457, i64 0
  br label %461

459:                                              ; preds = %230
  %460 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %234, i64 0
  br label %461

461:                                              ; preds = %459, %434, %412, %230
  %462 = phi <2 x double> [ undef, %230 ], [ %433, %412 ], [ %458, %434 ], [ %460, %459 ]
  %463 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 1, i32 0, i32 0, i32 0
  store <2 x double> %462, <2 x double> addrspace(1)* %463, align 16
  %464 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %465 = load double, double addrspace(1)* %464, align 8, !tbaa !4
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %467 = load i32, i32 addrspace(1)* %466, align 4, !tbaa !8
  switch i32 %467, label %692 [
    i32 0, label %690
    i32 1, label %665
    i32 2, label %468
  ]

468:                                              ; preds = %461
  %469 = fneg contract double %465
  %470 = tail call double @llvm.fabs.f64(double %469)
  %471 = fcmp olt double %470, 0x41D0000000000000
  br i1 %471, label %586, label %472

472:                                              ; preds = %468
  %473 = tail call double @llvm.amdgcn.trig.preop.f64(double %470, i32 0)
  %474 = tail call double @llvm.amdgcn.trig.preop.f64(double %470, i32 1)
  %475 = tail call double @llvm.amdgcn.trig.preop.f64(double %470, i32 2)
  %476 = fcmp oge double %470, 0x7B00000000000000
  %477 = tail call double @llvm.amdgcn.ldexp.f64(double %470, i32 -128)
  %478 = select i1 %476, double %477, double %470
  %479 = fmul double %475, %478
  %480 = fneg double %479
  %481 = tail call double @llvm.fma.f64(double %475, double %478, double %480)
  %482 = fmul double %474, %478
  %483 = fneg double %482
  %484 = tail call double @llvm.fma.f64(double %474, double %478, double %483)
  %485 = fmul double %473, %478
  %486 = fneg double %485
  %487 = tail call double @llvm.fma.f64(double %473, double %478, double %486)
  %488 = fadd double %482, %487
  %489 = fsub double %488, %482
  %490 = fsub double %488, %489
  %491 = fsub double %487, %489
  %492 = fsub double %482, %490
  %493 = fadd double %491, %492
  %494 = fadd double %479, %484
  %495 = fsub double %494, %479
  %496 = fsub double %494, %495
  %497 = fsub double %484, %495
  %498 = fsub double %479, %496
  %499 = fadd double %497, %498
  %500 = fadd double %494, %493
  %501 = fsub double %500, %494
  %502 = fsub double %500, %501
  %503 = fsub double %493, %501
  %504 = fsub double %494, %502
  %505 = fadd double %503, %504
  %506 = fadd double %499, %505
  %507 = fadd double %481, %506
  %508 = fadd double %485, %488
  %509 = fsub double %508, %485
  %510 = fsub double %488, %509
  %511 = fadd double %510, %500
  %512 = fsub double %511, %510
  %513 = fsub double %500, %512
  %514 = fadd double %513, %507
  %515 = tail call double @llvm.amdgcn.ldexp.f64(double %508, i32 -2)
  %516 = tail call double @llvm.amdgcn.fract.f64(double %515)
  %517 = tail call i1 @llvm.amdgcn.class.f64(double %515, i32 516)
  %518 = select i1 %517, double 0.000000e+00, double %516
  %519 = tail call double @llvm.amdgcn.ldexp.f64(double %518, i32 2)
  %520 = fadd double %519, %511
  %521 = fcmp olt double %520, 0.000000e+00
  %522 = select i1 %521, double 4.000000e+00, double 0.000000e+00
  %523 = fadd double %519, %522
  %524 = fadd double %511, %523
  %525 = fptosi double %524 to i32
  %526 = sitofp i32 %525 to double
  %527 = fsub double %523, %526
  %528 = fadd double %511, %527
  %529 = fsub double %528, %527
  %530 = fsub double %511, %529
  %531 = fadd double %514, %530
  %532 = fcmp oge double %528, 5.000000e-01
  %533 = zext i1 %532 to i32
  %534 = add nsw i32 %533, %525
  %535 = select i1 %532, double 1.000000e+00, double 0.000000e+00
  %536 = fsub double %528, %535
  %537 = fadd double %536, %531
  %538 = fsub double %537, %536
  %539 = fsub double %531, %538
  %540 = fmul double %537, 0x3FF921FB54442D18
  %541 = fneg double %540
  %542 = tail call double @llvm.fma.f64(double %537, double 0x3FF921FB54442D18, double %541)
  %543 = tail call double @llvm.fma.f64(double %537, double 0x3C91A62633145C07, double %542)
  %544 = tail call double @llvm.fma.f64(double %539, double 0x3FF921FB54442D18, double %543)
  %545 = fadd double %540, %544
  %546 = fsub double %545, %540
  %547 = fsub double %544, %546
  %548 = fmul double %545, %545
  %549 = fmul double %548, 5.000000e-01
  %550 = fsub double 1.000000e+00, %549
  %551 = fsub double 1.000000e+00, %550
  %552 = fsub double %551, %549
  %553 = fmul double %548, %548
  %554 = tail call double @llvm.fma.f64(double %548, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %555 = tail call double @llvm.fma.f64(double %548, double %554, double 0xBE927E4FA17F65F6)
  %556 = tail call double @llvm.fma.f64(double %548, double %555, double 0x3EFA01A019F4EC90)
  %557 = tail call double @llvm.fma.f64(double %548, double %556, double 0xBF56C16C16C16967)
  %558 = tail call double @llvm.fma.f64(double %548, double %557, double 0x3FA5555555555555)
  %559 = fneg double %547
  %560 = tail call double @llvm.fma.f64(double %545, double %559, double %552)
  %561 = tail call double @llvm.fma.f64(double %553, double %558, double %560)
  %562 = fadd double %550, %561
  %563 = tail call double @llvm.fma.f64(double %548, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %564 = tail call double @llvm.fma.f64(double %548, double %563, double 0x3EC71DE3796CDE01)
  %565 = tail call double @llvm.fma.f64(double %548, double %564, double 0xBF2A01A019E83E5C)
  %566 = tail call double @llvm.fma.f64(double %548, double %565, double 0x3F81111111110BB3)
  %567 = fneg double %548
  %568 = fmul double %545, %567
  %569 = fmul double %547, 5.000000e-01
  %570 = tail call double @llvm.fma.f64(double %568, double %566, double %569)
  %571 = tail call double @llvm.fma.f64(double %548, double %570, double %559)
  %572 = tail call double @llvm.fma.f64(double %568, double 0xBFC5555555555555, double %571)
  %573 = fsub double %545, %572
  %574 = fneg double %573
  %575 = and i32 %534, 1
  %576 = icmp eq i32 %575, 0
  %577 = select i1 %576, double %562, double %574
  %578 = bitcast double %577 to <2 x i32>
  %579 = shl i32 %534, 30
  %580 = and i32 %579, -2147483648
  %581 = extractelement <2 x i32> %578, i64 1
  %582 = xor i32 %581, %580
  %583 = insertelement <2 x i32> %578, i32 %582, i64 1
  %584 = tail call i1 @llvm.amdgcn.class.f64(double %470, i32 504)
  %585 = select i1 %584, <2 x i32> %583, <2 x i32> <i32 0, i32 2146959360>
  br label %643

586:                                              ; preds = %468
  %587 = fmul double %470, 0x3FE45F306DC9C883
  %588 = tail call double @llvm.rint.f64(double %587)
  %589 = tail call double @llvm.fma.f64(double %588, double 0xBFF921FB54442D18, double %470)
  %590 = tail call double @llvm.fma.f64(double %588, double 0xBC91A62633145C00, double %589)
  %591 = fmul double %588, 0x3C91A62633145C00
  %592 = fneg double %591
  %593 = tail call double @llvm.fma.f64(double %588, double 0x3C91A62633145C00, double %592)
  %594 = fsub double %589, %591
  %595 = fsub double %589, %594
  %596 = fsub double %595, %591
  %597 = fsub double %594, %590
  %598 = fadd double %597, %596
  %599 = fsub double %598, %593
  %600 = tail call double @llvm.fma.f64(double %588, double 0xB97B839A252049C0, double %599)
  %601 = fadd double %590, %600
  %602 = fsub double %601, %590
  %603 = fsub double %600, %602
  %604 = fptosi double %588 to i32
  %605 = fmul double %601, %601
  %606 = fmul double %605, 5.000000e-01
  %607 = fsub double 1.000000e+00, %606
  %608 = fsub double 1.000000e+00, %607
  %609 = fsub double %608, %606
  %610 = fmul double %605, %605
  %611 = tail call double @llvm.fma.f64(double %605, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %612 = tail call double @llvm.fma.f64(double %605, double %611, double 0xBE927E4FA17F65F6)
  %613 = tail call double @llvm.fma.f64(double %605, double %612, double 0x3EFA01A019F4EC90)
  %614 = tail call double @llvm.fma.f64(double %605, double %613, double 0xBF56C16C16C16967)
  %615 = tail call double @llvm.fma.f64(double %605, double %614, double 0x3FA5555555555555)
  %616 = fneg double %603
  %617 = tail call double @llvm.fma.f64(double %601, double %616, double %609)
  %618 = tail call double @llvm.fma.f64(double %610, double %615, double %617)
  %619 = fadd double %607, %618
  %620 = tail call double @llvm.fma.f64(double %605, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %621 = tail call double @llvm.fma.f64(double %605, double %620, double 0x3EC71DE3796CDE01)
  %622 = tail call double @llvm.fma.f64(double %605, double %621, double 0xBF2A01A019E83E5C)
  %623 = tail call double @llvm.fma.f64(double %605, double %622, double 0x3F81111111110BB3)
  %624 = fneg double %605
  %625 = fmul double %601, %624
  %626 = fmul double %603, 5.000000e-01
  %627 = tail call double @llvm.fma.f64(double %625, double %623, double %626)
  %628 = tail call double @llvm.fma.f64(double %605, double %627, double %616)
  %629 = tail call double @llvm.fma.f64(double %625, double 0xBFC5555555555555, double %628)
  %630 = fsub double %601, %629
  %631 = fneg double %630
  %632 = and i32 %604, 1
  %633 = icmp eq i32 %632, 0
  %634 = select i1 %633, double %619, double %631
  %635 = bitcast double %634 to <2 x i32>
  %636 = shl i32 %604, 30
  %637 = and i32 %636, -2147483648
  %638 = extractelement <2 x i32> %635, i64 1
  %639 = xor i32 %638, %637
  %640 = insertelement <2 x i32> %635, i32 %639, i64 1
  %641 = tail call i1 @llvm.amdgcn.class.f64(double %470, i32 504)
  %642 = select i1 %641, <2 x i32> %640, <2 x i32> <i32 0, i32 2146959360>
  br label %643

643:                                              ; preds = %586, %472
  %644 = phi <2 x i32> [ %642, %586 ], [ %585, %472 ]
  %645 = phi i32 [ %636, %586 ], [ %579, %472 ]
  %646 = phi i32 [ %632, %586 ], [ %575, %472 ]
  %647 = phi double [ %630, %586 ], [ %573, %472 ]
  %648 = phi double [ %619, %586 ], [ %562, %472 ]
  %649 = phi i1 [ %641, %586 ], [ %584, %472 ]
  %650 = bitcast <2 x i32> %644 to double
  %651 = insertelement <2 x double> undef, double %650, i64 0
  %652 = icmp eq i32 %646, 0
  %653 = select i1 %652, double %647, double %648
  %654 = bitcast double %653 to <2 x i32>
  %655 = bitcast double %469 to <2 x i32>
  %656 = extractelement <2 x i32> %655, i64 1
  %657 = xor i32 %645, %656
  %658 = and i32 %657, -2147483648
  %659 = extractelement <2 x i32> %654, i64 1
  %660 = xor i32 %659, %658
  %661 = insertelement <2 x i32> %654, i32 %660, i64 1
  %662 = select i1 %649, <2 x i32> %661, <2 x i32> <i32 0, i32 2146959360>
  %663 = bitcast <2 x i32> %662 to double
  %664 = insertelement <2 x double> %651, double %663, i64 1
  br label %692

665:                                              ; preds = %461
  %666 = fneg contract double %465
  %667 = fmul double %465, 0xBFF71547652B82FE
  %668 = tail call double @llvm.rint.f64(double %667)
  %669 = fneg double %668
  %670 = tail call double @llvm.fma.f64(double %669, double 0x3FE62E42FEFA39EF, double %666)
  %671 = tail call double @llvm.fma.f64(double %669, double 0x3C7ABC9E3B39803F, double %670)
  %672 = tail call double @llvm.fma.f64(double %671, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %673 = tail call double @llvm.fma.f64(double %671, double %672, double 0x3EC71DEE623FDE64)
  %674 = tail call double @llvm.fma.f64(double %671, double %673, double 0x3EFA01997C89E6B0)
  %675 = tail call double @llvm.fma.f64(double %671, double %674, double 0x3F2A01A014761F6E)
  %676 = tail call double @llvm.fma.f64(double %671, double %675, double 0x3F56C16C1852B7B0)
  %677 = tail call double @llvm.fma.f64(double %671, double %676, double 0x3F81111111122322)
  %678 = tail call double @llvm.fma.f64(double %671, double %677, double 0x3FA55555555502A1)
  %679 = tail call double @llvm.fma.f64(double %671, double %678, double 0x3FC5555555555511)
  %680 = tail call double @llvm.fma.f64(double %671, double %679, double 0x3FE000000000000B)
  %681 = tail call double @llvm.fma.f64(double %671, double %680, double 1.000000e+00)
  %682 = tail call double @llvm.fma.f64(double %671, double %681, double 1.000000e+00)
  %683 = fptosi double %668 to i32
  %684 = tail call double @llvm.amdgcn.ldexp.f64(double %682, i32 %683)
  %685 = fcmp olt double %465, -1.024000e+03
  %686 = select i1 %685, double 0x7FF0000000000000, double %684
  %687 = fcmp ogt double %465, 1.075000e+03
  %688 = select i1 %687, double 0.000000e+00, double %686
  %689 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %688, i64 0
  br label %692

690:                                              ; preds = %461
  %691 = insertelement <2 x double> <double poison, double 0.000000e+00>, double %465, i64 0
  br label %692

692:                                              ; preds = %690, %665, %643, %461
  %693 = phi <2 x double> [ undef, %461 ], [ %664, %643 ], [ %689, %665 ], [ %691, %690 ]
  %694 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 2, i32 0, i32 0, i32 0
  store <2 x double> %693, <2 x double> addrspace(1)* %694, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
