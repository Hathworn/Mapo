; ModuleID = '../data/hip_kernels/925/67/main.cu'
source_filename = "../data/hip_kernels/925/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8pow_testP15HIP_vector_typeIdLj2EEiS1_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  %5 = load <2 x double>, <2 x double> addrspace(1)* %4, align 16, !amdgpu.noclobber !4
  %6 = extractelement <2 x double> %5, i64 0
  %7 = fmul contract double %6, %6
  %8 = extractelement <2 x double> %5, i64 1
  %9 = fmul contract double %8, %8
  %10 = fadd contract double %7, %9
  %11 = fcmp olt double %10, 0x1000000000000000
  %12 = select i1 %11, double 0x4FF0000000000000, double 1.000000e+00
  %13 = fmul double %10, %12
  %14 = tail call double @llvm.amdgcn.rsq.f64(double %13)
  %15 = fmul double %13, %14
  %16 = fmul double %14, 5.000000e-01
  %17 = fneg double %16
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 5.000000e-01)
  %19 = tail call double @llvm.fma.f64(double %16, double %18, double %16)
  %20 = tail call double @llvm.fma.f64(double %15, double %18, double %15)
  %21 = fneg double %20
  %22 = tail call double @llvm.fma.f64(double %21, double %20, double %13)
  %23 = tail call double @llvm.fma.f64(double %22, double %19, double %20)
  %24 = fneg double %23
  %25 = tail call double @llvm.fma.f64(double %24, double %23, double %13)
  %26 = tail call double @llvm.fma.f64(double %25, double %19, double %23)
  %27 = select i1 %11, double 0x37F0000000000000, double 1.000000e+00
  %28 = fmul double %27, %26
  %29 = fcmp oeq double %13, 0.000000e+00
  %30 = fcmp oeq double %13, 0x7FF0000000000000
  %31 = or i1 %29, %30
  %32 = select i1 %31, double %13, double %28
  %33 = fdiv contract double %8, %6
  %34 = tail call double @llvm.fabs.f64(double %33)
  %35 = fcmp ogt double %34, 1.000000e+00
  %36 = fdiv double 1.000000e+00, %34
  %37 = select i1 %35, double %36, double %34
  %38 = fmul double %37, %37
  %39 = tail call double @llvm.fma.f64(double %38, double 0x3EEBA404B5E68A13, double 0xBF23E260BD3237F4)
  %40 = tail call double @llvm.fma.f64(double %38, double %39, double 0x3F4B2BB069EFB384)
  %41 = tail call double @llvm.fma.f64(double %38, double %40, double 0xBF67952DAF56DE9B)
  %42 = tail call double @llvm.fma.f64(double %38, double %41, double 0x3F7D6D43A595C56F)
  %43 = tail call double @llvm.fma.f64(double %38, double %42, double 0xBF8C6EA4A57D9582)
  %44 = tail call double @llvm.fma.f64(double %38, double %43, double 0x3F967E295F08B19F)
  %45 = tail call double @llvm.fma.f64(double %38, double %44, double 0xBF9E9AE6FC27006A)
  %46 = tail call double @llvm.fma.f64(double %38, double %45, double 0x3FA2C15B5711927A)
  %47 = tail call double @llvm.fma.f64(double %38, double %46, double 0xBFA59976E82D3FF0)
  %48 = tail call double @llvm.fma.f64(double %38, double %47, double 0x3FA82D5D6EF28734)
  %49 = tail call double @llvm.fma.f64(double %38, double %48, double 0xBFAAE5CE6A214619)
  %50 = tail call double @llvm.fma.f64(double %38, double %49, double 0x3FAE1BB48427B883)
  %51 = tail call double @llvm.fma.f64(double %38, double %50, double 0xBFB110E48B207F05)
  %52 = tail call double @llvm.fma.f64(double %38, double %51, double 0x3FB3B13657B87036)
  %53 = tail call double @llvm.fma.f64(double %38, double %52, double 0xBFB745D119378E4F)
  %54 = tail call double @llvm.fma.f64(double %38, double %53, double 0x3FBC71C717E1913C)
  %55 = tail call double @llvm.fma.f64(double %38, double %54, double 0xBFC2492492376B7D)
  %56 = tail call double @llvm.fma.f64(double %38, double %55, double 0x3FC99999999952CC)
  %57 = tail call double @llvm.fma.f64(double %38, double %56, double 0xBFD5555555555523)
  %58 = fmul double %38, %57
  %59 = tail call double @llvm.fma.f64(double %37, double %58, double %37)
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double 0x3FEDD9AD336A0500, double 0x3FFAF154EEB562D6, double %60)
  %62 = select i1 %35, double %61, double %59
  %63 = tail call double @llvm.copysign.f64(double %62, double %33)
  %64 = sitofp i32 %1 to double
  %65 = tail call double @llvm.fabs.f64(double %32)
  %66 = tail call double @llvm.amdgcn.frexp.mant.f64(double %65)
  %67 = fcmp olt double %66, 0x3FE5555555555555
  %68 = zext i1 %67 to i32
  %69 = tail call double @llvm.amdgcn.ldexp.f64(double %66, i32 %68)
  %70 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %65)
  %71 = sub nsw i32 %70, %68
  %72 = fadd double %69, -1.000000e+00
  %73 = fadd double %69, 1.000000e+00
  %74 = fadd double %73, -1.000000e+00
  %75 = fsub double %69, %74
  %76 = tail call double @llvm.amdgcn.rcp.f64(double %73)
  %77 = fneg double %73
  %78 = tail call double @llvm.fma.f64(double %77, double %76, double 1.000000e+00)
  %79 = tail call double @llvm.fma.f64(double %78, double %76, double %76)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double 1.000000e+00)
  %81 = tail call double @llvm.fma.f64(double %80, double %79, double %79)
  %82 = fmul double %72, %81
  %83 = fmul double %73, %82
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %82, double %73, double %84)
  %86 = tail call double @llvm.fma.f64(double %82, double %75, double %85)
  %87 = fadd double %83, %86
  %88 = fsub double %87, %83
  %89 = fsub double %86, %88
  %90 = fsub double %72, %87
  %91 = fsub double %72, %90
  %92 = fsub double %91, %87
  %93 = fsub double %92, %89
  %94 = fadd double %90, %93
  %95 = fmul double %81, %94
  %96 = fadd double %82, %95
  %97 = fsub double %96, %82
  %98 = fsub double %95, %97
  %99 = fmul double %96, %96
  %100 = fneg double %99
  %101 = tail call double @llvm.fma.f64(double %96, double %96, double %100)
  %102 = fmul double %98, 2.000000e+00
  %103 = tail call double @llvm.fma.f64(double %96, double %102, double %101)
  %104 = fadd double %99, %103
  %105 = fsub double %104, %99
  %106 = fsub double %103, %105
  %107 = tail call double @llvm.fma.f64(double %104, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %108 = tail call double @llvm.fma.f64(double %104, double %107, double 0x3FBE25E43ABE935A)
  %109 = tail call double @llvm.fma.f64(double %104, double %108, double 0x3FC110EF47E6C9C2)
  %110 = tail call double @llvm.fma.f64(double %104, double %109, double 0x3FC3B13BCFA74449)
  %111 = tail call double @llvm.fma.f64(double %104, double %110, double 0x3FC745D171BF3C30)
  %112 = tail call double @llvm.fma.f64(double %104, double %111, double 0x3FCC71C71C7792CE)
  %113 = tail call double @llvm.fma.f64(double %104, double %112, double 0x3FD24924924920DA)
  %114 = tail call double @llvm.fma.f64(double %104, double %113, double 0x3FD999999999999C)
  %115 = sitofp i32 %71 to double
  %116 = fmul double %115, 0x3FE62E42FEFA39EF
  %117 = fneg double %116
  %118 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %117)
  %119 = tail call double @llvm.fma.f64(double %115, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %116, %119
  %121 = fsub double %120, %116
  %122 = fsub double %119, %121
  %123 = tail call double @llvm.amdgcn.ldexp.f64(double %96, i32 1)
  %124 = tail call double @llvm.amdgcn.ldexp.f64(double %98, i32 1)
  %125 = fmul double %96, %104
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %104, double %96, double %126)
  %128 = tail call double @llvm.fma.f64(double %104, double %98, double %127)
  %129 = tail call double @llvm.fma.f64(double %106, double %96, double %128)
  %130 = fadd double %125, %129
  %131 = fsub double %130, %125
  %132 = fsub double %129, %131
  %133 = fmul double %104, %114
  %134 = fneg double %133
  %135 = tail call double @llvm.fma.f64(double %104, double %114, double %134)
  %136 = tail call double @llvm.fma.f64(double %106, double %114, double %135)
  %137 = fadd double %133, %136
  %138 = fsub double %137, %133
  %139 = fsub double %136, %138
  %140 = fadd double %137, 0x3FE5555555555555
  %141 = fadd double %140, 0xBFE5555555555555
  %142 = fsub double %137, %141
  %143 = fadd double %139, 0x3C8543B0D5DF274D
  %144 = fadd double %143, %142
  %145 = fadd double %140, %144
  %146 = fsub double %145, %140
  %147 = fsub double %144, %146
  %148 = fmul double %130, %145
  %149 = fneg double %148
  %150 = tail call double @llvm.fma.f64(double %130, double %145, double %149)
  %151 = tail call double @llvm.fma.f64(double %130, double %147, double %150)
  %152 = tail call double @llvm.fma.f64(double %132, double %145, double %151)
  %153 = fadd double %148, %152
  %154 = fsub double %153, %148
  %155 = fsub double %152, %154
  %156 = fadd double %123, %153
  %157 = fsub double %156, %123
  %158 = fsub double %153, %157
  %159 = fadd double %124, %155
  %160 = fadd double %159, %158
  %161 = fadd double %156, %160
  %162 = fsub double %161, %156
  %163 = fsub double %160, %162
  %164 = fadd double %120, %161
  %165 = fsub double %164, %120
  %166 = fsub double %164, %165
  %167 = fsub double %120, %166
  %168 = fsub double %161, %165
  %169 = fadd double %168, %167
  %170 = fadd double %122, %163
  %171 = fsub double %170, %122
  %172 = fsub double %170, %171
  %173 = fsub double %122, %172
  %174 = fsub double %163, %171
  %175 = fadd double %174, %173
  %176 = fadd double %170, %169
  %177 = fadd double %164, %176
  %178 = fsub double %177, %164
  %179 = fsub double %176, %178
  %180 = fadd double %175, %179
  %181 = fadd double %177, %180
  %182 = fsub double %181, %177
  %183 = fsub double %180, %182
  %184 = fmul double %181, %64
  %185 = fneg double %184
  %186 = tail call double @llvm.fma.f64(double %64, double %181, double %185)
  %187 = tail call double @llvm.fma.f64(double %64, double %183, double %186)
  %188 = fadd double %184, %187
  %189 = fsub double %188, %184
  %190 = fsub double %187, %189
  %191 = tail call double @llvm.fabs.f64(double %184) #3
  %192 = fcmp oeq double %191, 0x7FF0000000000000
  %193 = select i1 %192, double %184, double %188
  %194 = tail call double @llvm.fabs.f64(double %193) #3
  %195 = fcmp oeq double %194, 0x7FF0000000000000
  %196 = select i1 %195, double 0.000000e+00, double %190
  %197 = fmul double %193, 0x3FF71547652B82FE
  %198 = tail call double @llvm.rint.f64(double %197)
  %199 = fneg double %198
  %200 = tail call double @llvm.fma.f64(double %199, double 0x3FE62E42FEFA39EF, double %193)
  %201 = tail call double @llvm.fma.f64(double %199, double 0x3C7ABC9E3B39803F, double %200)
  %202 = tail call double @llvm.fma.f64(double %201, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %203 = tail call double @llvm.fma.f64(double %201, double %202, double 0x3EC71DEE623FDE64)
  %204 = tail call double @llvm.fma.f64(double %201, double %203, double 0x3EFA01997C89E6B0)
  %205 = tail call double @llvm.fma.f64(double %201, double %204, double 0x3F2A01A014761F6E)
  %206 = tail call double @llvm.fma.f64(double %201, double %205, double 0x3F56C16C1852B7B0)
  %207 = tail call double @llvm.fma.f64(double %201, double %206, double 0x3F81111111122322)
  %208 = tail call double @llvm.fma.f64(double %201, double %207, double 0x3FA55555555502A1)
  %209 = tail call double @llvm.fma.f64(double %201, double %208, double 0x3FC5555555555511)
  %210 = tail call double @llvm.fma.f64(double %201, double %209, double 0x3FE000000000000B)
  %211 = tail call double @llvm.fma.f64(double %201, double %210, double 1.000000e+00)
  %212 = tail call double @llvm.fma.f64(double %201, double %211, double 1.000000e+00)
  %213 = fptosi double %198 to i32
  %214 = tail call double @llvm.amdgcn.ldexp.f64(double %212, i32 %213)
  %215 = fcmp ogt double %193, 1.024000e+03
  %216 = select i1 %215, double 0x7FF0000000000000, double %214
  %217 = fcmp olt double %193, -1.075000e+03
  %218 = select i1 %217, double 0.000000e+00, double %216
  %219 = tail call double @llvm.fma.f64(double %218, double %196, double %218)
  %220 = tail call double @llvm.fabs.f64(double %218) #3
  %221 = fcmp oeq double %220, 0x7FF0000000000000
  %222 = select i1 %221, double %218, double %219
  %223 = fcmp uge double %32, 0.000000e+00
  %224 = and i32 %1, 1
  %225 = icmp eq i32 %224, 0
  %226 = or i1 %225, %223
  %227 = select i1 %226, double 0.000000e+00, double -0.000000e+00
  %228 = tail call double @llvm.copysign.f64(double %222, double %227)
  %229 = fcmp oeq double %65, 0x7FF0000000000000
  %230 = fcmp oeq double %32, 0.000000e+00
  %231 = or i1 %230, %229
  %232 = zext i1 %230 to i32
  %233 = lshr i32 %1, 31
  %234 = icmp eq i32 %233, %232
  %235 = select i1 %234, double 0x7FF0000000000000, double 0.000000e+00
  %236 = select i1 %225, double 0.000000e+00, double %32
  %237 = tail call double @llvm.copysign.f64(double %235, double %236)
  %238 = select i1 %231, double %237, double %228
  %239 = fcmp uno double %32, 0.000000e+00
  %240 = select i1 %239, double 0x7FF8000000000000, double %238
  %241 = icmp eq i32 %1, 0
  %242 = select i1 %241, double 1.000000e+00, double %240
  %243 = fmul contract double %63, %64
  %244 = tail call double @llvm.fabs.f64(double %243)
  %245 = fcmp olt double %244, 0x41D0000000000000
  br i1 %245, label %246, label %303

246:                                              ; preds = %3
  %247 = fmul double %244, 0x3FE45F306DC9C883
  %248 = tail call double @llvm.rint.f64(double %247)
  %249 = tail call double @llvm.fma.f64(double %248, double 0xBFF921FB54442D18, double %244)
  %250 = tail call double @llvm.fma.f64(double %248, double 0xBC91A62633145C00, double %249)
  %251 = fmul double %248, 0x3C91A62633145C00
  %252 = fneg double %251
  %253 = tail call double @llvm.fma.f64(double %248, double 0x3C91A62633145C00, double %252)
  %254 = fsub double %249, %251
  %255 = fsub double %249, %254
  %256 = fsub double %255, %251
  %257 = fsub double %254, %250
  %258 = fadd double %257, %256
  %259 = fsub double %258, %253
  %260 = tail call double @llvm.fma.f64(double %248, double 0xB97B839A252049C0, double %259)
  %261 = fadd double %250, %260
  %262 = fsub double %261, %250
  %263 = fsub double %260, %262
  %264 = fptosi double %248 to i32
  %265 = fmul double %261, %261
  %266 = fmul double %265, 5.000000e-01
  %267 = fsub double 1.000000e+00, %266
  %268 = fsub double 1.000000e+00, %267
  %269 = fsub double %268, %266
  %270 = fmul double %265, %265
  %271 = tail call double @llvm.fma.f64(double %265, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %272 = tail call double @llvm.fma.f64(double %265, double %271, double 0xBE927E4FA17F65F6)
  %273 = tail call double @llvm.fma.f64(double %265, double %272, double 0x3EFA01A019F4EC90)
  %274 = tail call double @llvm.fma.f64(double %265, double %273, double 0xBF56C16C16C16967)
  %275 = tail call double @llvm.fma.f64(double %265, double %274, double 0x3FA5555555555555)
  %276 = fneg double %263
  %277 = tail call double @llvm.fma.f64(double %261, double %276, double %269)
  %278 = tail call double @llvm.fma.f64(double %270, double %275, double %277)
  %279 = fadd double %267, %278
  %280 = tail call double @llvm.fma.f64(double %265, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %281 = tail call double @llvm.fma.f64(double %265, double %280, double 0x3EC71DE3796CDE01)
  %282 = tail call double @llvm.fma.f64(double %265, double %281, double 0xBF2A01A019E83E5C)
  %283 = tail call double @llvm.fma.f64(double %265, double %282, double 0x3F81111111110BB3)
  %284 = fneg double %265
  %285 = fmul double %261, %284
  %286 = fmul double %263, 5.000000e-01
  %287 = tail call double @llvm.fma.f64(double %285, double %283, double %286)
  %288 = tail call double @llvm.fma.f64(double %265, double %287, double %276)
  %289 = tail call double @llvm.fma.f64(double %285, double 0xBFC5555555555555, double %288)
  %290 = fsub double %261, %289
  %291 = fneg double %290
  %292 = and i32 %264, 1
  %293 = icmp eq i32 %292, 0
  %294 = select i1 %293, double %279, double %291
  %295 = bitcast double %294 to <2 x i32>
  %296 = shl i32 %264, 30
  %297 = and i32 %296, -2147483648
  %298 = extractelement <2 x i32> %295, i64 1
  %299 = xor i32 %298, %297
  %300 = insertelement <2 x i32> %295, i32 %299, i64 1
  %301 = tail call i1 @llvm.amdgcn.class.f64(double %244, i32 504)
  %302 = select i1 %301, <2 x i32> %300, <2 x i32> <i32 0, i32 2146959360>
  br label %417

303:                                              ; preds = %3
  %304 = tail call double @llvm.amdgcn.trig.preop.f64(double %244, i32 0)
  %305 = tail call double @llvm.amdgcn.trig.preop.f64(double %244, i32 1)
  %306 = tail call double @llvm.amdgcn.trig.preop.f64(double %244, i32 2)
  %307 = fcmp oge double %244, 0x7B00000000000000
  %308 = tail call double @llvm.amdgcn.ldexp.f64(double %244, i32 -128)
  %309 = select i1 %307, double %308, double %244
  %310 = fmul double %306, %309
  %311 = fneg double %310
  %312 = tail call double @llvm.fma.f64(double %306, double %309, double %311)
  %313 = fmul double %305, %309
  %314 = fneg double %313
  %315 = tail call double @llvm.fma.f64(double %305, double %309, double %314)
  %316 = fmul double %304, %309
  %317 = fneg double %316
  %318 = tail call double @llvm.fma.f64(double %304, double %309, double %317)
  %319 = fadd double %313, %318
  %320 = fsub double %319, %313
  %321 = fsub double %319, %320
  %322 = fsub double %318, %320
  %323 = fsub double %313, %321
  %324 = fadd double %322, %323
  %325 = fadd double %310, %315
  %326 = fsub double %325, %310
  %327 = fsub double %325, %326
  %328 = fsub double %315, %326
  %329 = fsub double %310, %327
  %330 = fadd double %328, %329
  %331 = fadd double %325, %324
  %332 = fsub double %331, %325
  %333 = fsub double %331, %332
  %334 = fsub double %324, %332
  %335 = fsub double %325, %333
  %336 = fadd double %334, %335
  %337 = fadd double %330, %336
  %338 = fadd double %312, %337
  %339 = fadd double %316, %319
  %340 = fsub double %339, %316
  %341 = fsub double %319, %340
  %342 = fadd double %341, %331
  %343 = fsub double %342, %341
  %344 = fsub double %331, %343
  %345 = fadd double %344, %338
  %346 = tail call double @llvm.amdgcn.ldexp.f64(double %339, i32 -2)
  %347 = tail call double @llvm.amdgcn.fract.f64(double %346)
  %348 = tail call i1 @llvm.amdgcn.class.f64(double %346, i32 516)
  %349 = select i1 %348, double 0.000000e+00, double %347
  %350 = tail call double @llvm.amdgcn.ldexp.f64(double %349, i32 2)
  %351 = fadd double %350, %342
  %352 = fcmp olt double %351, 0.000000e+00
  %353 = select i1 %352, double 4.000000e+00, double 0.000000e+00
  %354 = fadd double %350, %353
  %355 = fadd double %342, %354
  %356 = fptosi double %355 to i32
  %357 = sitofp i32 %356 to double
  %358 = fsub double %354, %357
  %359 = fadd double %342, %358
  %360 = fsub double %359, %358
  %361 = fsub double %342, %360
  %362 = fadd double %345, %361
  %363 = fcmp oge double %359, 5.000000e-01
  %364 = zext i1 %363 to i32
  %365 = add nsw i32 %364, %356
  %366 = select i1 %363, double 1.000000e+00, double 0.000000e+00
  %367 = fsub double %359, %366
  %368 = fadd double %367, %362
  %369 = fsub double %368, %367
  %370 = fsub double %362, %369
  %371 = fmul double %368, 0x3FF921FB54442D18
  %372 = fneg double %371
  %373 = tail call double @llvm.fma.f64(double %368, double 0x3FF921FB54442D18, double %372)
  %374 = tail call double @llvm.fma.f64(double %368, double 0x3C91A62633145C07, double %373)
  %375 = tail call double @llvm.fma.f64(double %370, double 0x3FF921FB54442D18, double %374)
  %376 = fadd double %371, %375
  %377 = fsub double %376, %371
  %378 = fsub double %375, %377
  %379 = fmul double %376, %376
  %380 = fmul double %379, 5.000000e-01
  %381 = fsub double 1.000000e+00, %380
  %382 = fsub double 1.000000e+00, %381
  %383 = fsub double %382, %380
  %384 = fmul double %379, %379
  %385 = tail call double @llvm.fma.f64(double %379, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %386 = tail call double @llvm.fma.f64(double %379, double %385, double 0xBE927E4FA17F65F6)
  %387 = tail call double @llvm.fma.f64(double %379, double %386, double 0x3EFA01A019F4EC90)
  %388 = tail call double @llvm.fma.f64(double %379, double %387, double 0xBF56C16C16C16967)
  %389 = tail call double @llvm.fma.f64(double %379, double %388, double 0x3FA5555555555555)
  %390 = fneg double %378
  %391 = tail call double @llvm.fma.f64(double %376, double %390, double %383)
  %392 = tail call double @llvm.fma.f64(double %384, double %389, double %391)
  %393 = fadd double %381, %392
  %394 = tail call double @llvm.fma.f64(double %379, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %395 = tail call double @llvm.fma.f64(double %379, double %394, double 0x3EC71DE3796CDE01)
  %396 = tail call double @llvm.fma.f64(double %379, double %395, double 0xBF2A01A019E83E5C)
  %397 = tail call double @llvm.fma.f64(double %379, double %396, double 0x3F81111111110BB3)
  %398 = fneg double %379
  %399 = fmul double %376, %398
  %400 = fmul double %378, 5.000000e-01
  %401 = tail call double @llvm.fma.f64(double %399, double %397, double %400)
  %402 = tail call double @llvm.fma.f64(double %379, double %401, double %390)
  %403 = tail call double @llvm.fma.f64(double %399, double 0xBFC5555555555555, double %402)
  %404 = fsub double %376, %403
  %405 = fneg double %404
  %406 = and i32 %365, 1
  %407 = icmp eq i32 %406, 0
  %408 = select i1 %407, double %393, double %405
  %409 = bitcast double %408 to <2 x i32>
  %410 = shl i32 %365, 30
  %411 = and i32 %410, -2147483648
  %412 = extractelement <2 x i32> %409, i64 1
  %413 = xor i32 %412, %411
  %414 = insertelement <2 x i32> %409, i32 %413, i64 1
  %415 = tail call i1 @llvm.amdgcn.class.f64(double %244, i32 504)
  %416 = select i1 %415, <2 x i32> %414, <2 x i32> <i32 0, i32 2146959360>
  br label %417

417:                                              ; preds = %246, %303
  %418 = phi i32 [ %296, %246 ], [ %410, %303 ]
  %419 = phi i32 [ %292, %246 ], [ %406, %303 ]
  %420 = phi double [ %290, %246 ], [ %404, %303 ]
  %421 = phi double [ %279, %246 ], [ %393, %303 ]
  %422 = phi <2 x i32> [ %302, %246 ], [ %416, %303 ]
  %423 = phi i1 [ %301, %246 ], [ %415, %303 ]
  %424 = bitcast <2 x i32> %422 to double
  %425 = fmul contract double %242, %424
  %426 = icmp eq i32 %419, 0
  %427 = select i1 %426, double %420, double %421
  %428 = bitcast double %427 to <2 x i32>
  %429 = bitcast double %243 to <2 x i32>
  %430 = extractelement <2 x i32> %429, i64 1
  %431 = xor i32 %418, %430
  %432 = and i32 %431, -2147483648
  %433 = extractelement <2 x i32> %428, i64 1
  %434 = xor i32 %433, %432
  %435 = insertelement <2 x i32> %428, i32 %434, i64 1
  %436 = select i1 %423, <2 x i32> %435, <2 x i32> <i32 0, i32 2146959360>
  %437 = bitcast <2 x i32> %436 to double
  %438 = fmul contract double %242, %437
  %439 = insertelement <2 x double> undef, double %425, i64 0
  %440 = insertelement <2 x double> %439, double %438, i64 1
  %441 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 0, i32 0, i32 0, i32 0
  store <2 x double> %440, <2 x double> addrspace(1)* %441, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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
!4 = !{}
