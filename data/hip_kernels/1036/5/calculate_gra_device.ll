; ModuleID = '../data/hip_kernels/1036/5/main.cu'
source_filename = "../data/hip_kernels/1036/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [23 x i8] c"gra %d %d %d %f %f %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13calculate_graPdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %24

17:                                               ; preds = %3
  %18 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 24
  %20 = bitcast i8 addrspace(4)* %19 to i64 addrspace(4)*
  %21 = load i64, i64 addrspace(4)* %20, align 8, !tbaa !16
  %22 = inttoptr i64 %21 to i8 addrspace(1)*
  %23 = addrspacecast i8 addrspace(1)* %22 to i8*
  br label %25

24:                                               ; preds = %931, %3
  ret void

25:                                               ; preds = %17, %931
  %26 = phi i32 [ %15, %17 ], [ %968, %931 ]
  %27 = add nsw i32 %26, -1
  %28 = icmp sgt i32 %26, 0
  %29 = select i1 %28, i32 0, i32 %2
  %30 = add nsw i32 %27, %29
  %31 = add nsw i32 %26, 1
  %32 = icmp slt i32 %31, %2
  %33 = select i1 %32, i32 0, i32 %2
  %34 = sub nsw i32 %31, %33
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !17
  %38 = sext i32 %26 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !17
  %41 = fmul contract double %40, 2.000000e+00
  %42 = fmul contract double %37, %41
  %43 = tail call double @llvm.fabs.f64(double %42)
  %44 = fcmp olt double %43, 0x41D0000000000000
  br i1 %44, label %45, label %64

45:                                               ; preds = %25
  %46 = fmul double %43, 0x3FE45F306DC9C883
  %47 = tail call double @llvm.rint.f64(double %46)
  %48 = tail call double @llvm.fma.f64(double %47, double 0xBFF921FB54442D18, double %43)
  %49 = tail call double @llvm.fma.f64(double %47, double 0xBC91A62633145C00, double %48)
  %50 = fmul double %47, 0x3C91A62633145C00
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %47, double 0x3C91A62633145C00, double %51)
  %53 = fsub double %48, %50
  %54 = fsub double %48, %53
  %55 = fsub double %54, %50
  %56 = fsub double %53, %49
  %57 = fadd double %56, %55
  %58 = fsub double %57, %52
  %59 = tail call double @llvm.fma.f64(double %47, double 0xB97B839A252049C0, double %58)
  %60 = fadd double %49, %59
  %61 = fsub double %60, %49
  %62 = fsub double %59, %61
  %63 = fptosi double %47 to i32
  br label %140

64:                                               ; preds = %25
  %65 = tail call double @llvm.amdgcn.trig.preop.f64(double %43, i32 0)
  %66 = tail call double @llvm.amdgcn.trig.preop.f64(double %43, i32 1)
  %67 = tail call double @llvm.amdgcn.trig.preop.f64(double %43, i32 2)
  %68 = fcmp oge double %43, 0x7B00000000000000
  %69 = tail call double @llvm.amdgcn.ldexp.f64(double %43, i32 -128)
  %70 = select i1 %68, double %69, double %43
  %71 = fmul double %67, %70
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %67, double %70, double %72)
  %74 = fmul double %66, %70
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %66, double %70, double %75)
  %77 = fmul double %65, %70
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %65, double %70, double %78)
  %80 = fadd double %74, %79
  %81 = fsub double %80, %74
  %82 = fsub double %80, %81
  %83 = fsub double %79, %81
  %84 = fsub double %74, %82
  %85 = fadd double %83, %84
  %86 = fadd double %71, %76
  %87 = fsub double %86, %71
  %88 = fsub double %86, %87
  %89 = fsub double %76, %87
  %90 = fsub double %71, %88
  %91 = fadd double %89, %90
  %92 = fadd double %86, %85
  %93 = fsub double %92, %86
  %94 = fsub double %92, %93
  %95 = fsub double %85, %93
  %96 = fsub double %86, %94
  %97 = fadd double %95, %96
  %98 = fadd double %91, %97
  %99 = fadd double %73, %98
  %100 = fadd double %77, %80
  %101 = fsub double %100, %77
  %102 = fsub double %80, %101
  %103 = fadd double %102, %92
  %104 = fsub double %103, %102
  %105 = fsub double %92, %104
  %106 = fadd double %105, %99
  %107 = tail call double @llvm.amdgcn.ldexp.f64(double %100, i32 -2)
  %108 = tail call double @llvm.amdgcn.fract.f64(double %107)
  %109 = tail call i1 @llvm.amdgcn.class.f64(double %107, i32 516)
  %110 = select i1 %109, double 0.000000e+00, double %108
  %111 = tail call double @llvm.amdgcn.ldexp.f64(double %110, i32 2)
  %112 = fadd double %111, %103
  %113 = fcmp olt double %112, 0.000000e+00
  %114 = select i1 %113, double 4.000000e+00, double 0.000000e+00
  %115 = fadd double %111, %114
  %116 = fadd double %103, %115
  %117 = fptosi double %116 to i32
  %118 = sitofp i32 %117 to double
  %119 = fsub double %115, %118
  %120 = fadd double %103, %119
  %121 = fsub double %120, %119
  %122 = fsub double %103, %121
  %123 = fadd double %106, %122
  %124 = fcmp oge double %120, 5.000000e-01
  %125 = zext i1 %124 to i32
  %126 = add nsw i32 %125, %117
  %127 = select i1 %124, double 1.000000e+00, double 0.000000e+00
  %128 = fsub double %120, %127
  %129 = fadd double %128, %123
  %130 = fsub double %129, %128
  %131 = fsub double %123, %130
  %132 = fmul double %129, 0x3FF921FB54442D18
  %133 = fneg double %132
  %134 = tail call double @llvm.fma.f64(double %129, double 0x3FF921FB54442D18, double %133)
  %135 = tail call double @llvm.fma.f64(double %129, double 0x3C91A62633145C07, double %134)
  %136 = tail call double @llvm.fma.f64(double %131, double 0x3FF921FB54442D18, double %135)
  %137 = fadd double %132, %136
  %138 = fsub double %137, %132
  %139 = fsub double %136, %138
  br label %140

140:                                              ; preds = %45, %64
  %141 = phi double [ %62, %45 ], [ %139, %64 ]
  %142 = phi double [ %60, %45 ], [ %137, %64 ]
  %143 = phi i32 [ %63, %45 ], [ %126, %64 ]
  %144 = fmul double %142, %142
  %145 = fmul double %144, 5.000000e-01
  %146 = fsub double 1.000000e+00, %145
  %147 = fsub double 1.000000e+00, %146
  %148 = fsub double %147, %145
  %149 = fmul double %144, %144
  %150 = tail call double @llvm.fma.f64(double %144, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %151 = tail call double @llvm.fma.f64(double %144, double %150, double 0xBE927E4FA17F65F6)
  %152 = tail call double @llvm.fma.f64(double %144, double %151, double 0x3EFA01A019F4EC90)
  %153 = tail call double @llvm.fma.f64(double %144, double %152, double 0xBF56C16C16C16967)
  %154 = tail call double @llvm.fma.f64(double %144, double %153, double 0x3FA5555555555555)
  %155 = fneg double %141
  %156 = tail call double @llvm.fma.f64(double %142, double %155, double %148)
  %157 = tail call double @llvm.fma.f64(double %149, double %154, double %156)
  %158 = fadd double %146, %157
  %159 = tail call double @llvm.fma.f64(double %144, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %160 = tail call double @llvm.fma.f64(double %144, double %159, double 0x3EC71DE3796CDE01)
  %161 = tail call double @llvm.fma.f64(double %144, double %160, double 0xBF2A01A019E83E5C)
  %162 = tail call double @llvm.fma.f64(double %144, double %161, double 0x3F81111111110BB3)
  %163 = fneg double %144
  %164 = fmul double %142, %163
  %165 = fmul double %141, 5.000000e-01
  %166 = tail call double @llvm.fma.f64(double %164, double %162, double %165)
  %167 = tail call double @llvm.fma.f64(double %144, double %166, double %155)
  %168 = tail call double @llvm.fma.f64(double %164, double 0xBFC5555555555555, double %167)
  %169 = fsub double %142, %168
  %170 = and i32 %143, 1
  %171 = icmp eq i32 %170, 0
  %172 = select i1 %171, double %169, double %158
  %173 = bitcast double %172 to <2 x i32>
  %174 = shl i32 %143, 30
  %175 = bitcast double %42 to <2 x i32>
  %176 = extractelement <2 x i32> %175, i64 1
  %177 = xor i32 %174, %176
  %178 = and i32 %177, -2147483648
  %179 = extractelement <2 x i32> %173, i64 1
  %180 = xor i32 %179, %178
  %181 = insertelement <2 x i32> %173, i32 %180, i64 1
  %182 = tail call i1 @llvm.amdgcn.class.f64(double %43, i32 504)
  %183 = select i1 %182, <2 x i32> %181, <2 x i32> <i32 0, i32 2146959360>
  %184 = bitcast <2 x i32> %183 to double
  %185 = fmul contract double %37, %184
  %186 = sext i32 %34 to i64
  %187 = getelementptr inbounds double, double addrspace(1)* %0, i64 %186
  %188 = load double, double addrspace(1)* %187, align 8, !tbaa !17
  %189 = fmul contract double %41, %188
  %190 = tail call double @llvm.fabs.f64(double %189)
  %191 = fcmp olt double %190, 0x41D0000000000000
  br i1 %191, label %192, label %211

192:                                              ; preds = %140
  %193 = fmul double %190, 0x3FE45F306DC9C883
  %194 = tail call double @llvm.rint.f64(double %193)
  %195 = tail call double @llvm.fma.f64(double %194, double 0xBFF921FB54442D18, double %190)
  %196 = tail call double @llvm.fma.f64(double %194, double 0xBC91A62633145C00, double %195)
  %197 = fmul double %194, 0x3C91A62633145C00
  %198 = fneg double %197
  %199 = tail call double @llvm.fma.f64(double %194, double 0x3C91A62633145C00, double %198)
  %200 = fsub double %195, %197
  %201 = fsub double %195, %200
  %202 = fsub double %201, %197
  %203 = fsub double %200, %196
  %204 = fadd double %203, %202
  %205 = fsub double %204, %199
  %206 = tail call double @llvm.fma.f64(double %194, double 0xB97B839A252049C0, double %205)
  %207 = fadd double %196, %206
  %208 = fsub double %207, %196
  %209 = fsub double %206, %208
  %210 = fptosi double %194 to i32
  br label %287

211:                                              ; preds = %140
  %212 = tail call double @llvm.amdgcn.trig.preop.f64(double %190, i32 0)
  %213 = tail call double @llvm.amdgcn.trig.preop.f64(double %190, i32 1)
  %214 = tail call double @llvm.amdgcn.trig.preop.f64(double %190, i32 2)
  %215 = fcmp oge double %190, 0x7B00000000000000
  %216 = tail call double @llvm.amdgcn.ldexp.f64(double %190, i32 -128)
  %217 = select i1 %215, double %216, double %190
  %218 = fmul double %214, %217
  %219 = fneg double %218
  %220 = tail call double @llvm.fma.f64(double %214, double %217, double %219)
  %221 = fmul double %213, %217
  %222 = fneg double %221
  %223 = tail call double @llvm.fma.f64(double %213, double %217, double %222)
  %224 = fmul double %212, %217
  %225 = fneg double %224
  %226 = tail call double @llvm.fma.f64(double %212, double %217, double %225)
  %227 = fadd double %221, %226
  %228 = fsub double %227, %221
  %229 = fsub double %227, %228
  %230 = fsub double %226, %228
  %231 = fsub double %221, %229
  %232 = fadd double %230, %231
  %233 = fadd double %218, %223
  %234 = fsub double %233, %218
  %235 = fsub double %233, %234
  %236 = fsub double %223, %234
  %237 = fsub double %218, %235
  %238 = fadd double %236, %237
  %239 = fadd double %233, %232
  %240 = fsub double %239, %233
  %241 = fsub double %239, %240
  %242 = fsub double %232, %240
  %243 = fsub double %233, %241
  %244 = fadd double %242, %243
  %245 = fadd double %238, %244
  %246 = fadd double %220, %245
  %247 = fadd double %224, %227
  %248 = fsub double %247, %224
  %249 = fsub double %227, %248
  %250 = fadd double %249, %239
  %251 = fsub double %250, %249
  %252 = fsub double %239, %251
  %253 = fadd double %252, %246
  %254 = tail call double @llvm.amdgcn.ldexp.f64(double %247, i32 -2)
  %255 = tail call double @llvm.amdgcn.fract.f64(double %254)
  %256 = tail call i1 @llvm.amdgcn.class.f64(double %254, i32 516)
  %257 = select i1 %256, double 0.000000e+00, double %255
  %258 = tail call double @llvm.amdgcn.ldexp.f64(double %257, i32 2)
  %259 = fadd double %258, %250
  %260 = fcmp olt double %259, 0.000000e+00
  %261 = select i1 %260, double 4.000000e+00, double 0.000000e+00
  %262 = fadd double %258, %261
  %263 = fadd double %250, %262
  %264 = fptosi double %263 to i32
  %265 = sitofp i32 %264 to double
  %266 = fsub double %262, %265
  %267 = fadd double %250, %266
  %268 = fsub double %267, %266
  %269 = fsub double %250, %268
  %270 = fadd double %253, %269
  %271 = fcmp oge double %267, 5.000000e-01
  %272 = zext i1 %271 to i32
  %273 = add nsw i32 %272, %264
  %274 = select i1 %271, double 1.000000e+00, double 0.000000e+00
  %275 = fsub double %267, %274
  %276 = fadd double %275, %270
  %277 = fsub double %276, %275
  %278 = fsub double %270, %277
  %279 = fmul double %276, 0x3FF921FB54442D18
  %280 = fneg double %279
  %281 = tail call double @llvm.fma.f64(double %276, double 0x3FF921FB54442D18, double %280)
  %282 = tail call double @llvm.fma.f64(double %276, double 0x3C91A62633145C07, double %281)
  %283 = tail call double @llvm.fma.f64(double %278, double 0x3FF921FB54442D18, double %282)
  %284 = fadd double %279, %283
  %285 = fsub double %284, %279
  %286 = fsub double %283, %285
  br label %287

287:                                              ; preds = %192, %211
  %288 = phi double [ %209, %192 ], [ %286, %211 ]
  %289 = phi double [ %207, %192 ], [ %284, %211 ]
  %290 = phi i32 [ %210, %192 ], [ %273, %211 ]
  %291 = fmul double %289, %289
  %292 = fmul double %291, 5.000000e-01
  %293 = fsub double 1.000000e+00, %292
  %294 = fsub double 1.000000e+00, %293
  %295 = fsub double %294, %292
  %296 = fmul double %291, %291
  %297 = tail call double @llvm.fma.f64(double %291, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %298 = tail call double @llvm.fma.f64(double %291, double %297, double 0xBE927E4FA17F65F6)
  %299 = tail call double @llvm.fma.f64(double %291, double %298, double 0x3EFA01A019F4EC90)
  %300 = tail call double @llvm.fma.f64(double %291, double %299, double 0xBF56C16C16C16967)
  %301 = tail call double @llvm.fma.f64(double %291, double %300, double 0x3FA5555555555555)
  %302 = fneg double %288
  %303 = tail call double @llvm.fma.f64(double %289, double %302, double %295)
  %304 = tail call double @llvm.fma.f64(double %296, double %301, double %303)
  %305 = fadd double %293, %304
  %306 = tail call double @llvm.fma.f64(double %291, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %307 = tail call double @llvm.fma.f64(double %291, double %306, double 0x3EC71DE3796CDE01)
  %308 = tail call double @llvm.fma.f64(double %291, double %307, double 0xBF2A01A019E83E5C)
  %309 = tail call double @llvm.fma.f64(double %291, double %308, double 0x3F81111111110BB3)
  %310 = fneg double %291
  %311 = fmul double %289, %310
  %312 = fmul double %288, 5.000000e-01
  %313 = tail call double @llvm.fma.f64(double %311, double %309, double %312)
  %314 = tail call double @llvm.fma.f64(double %291, double %313, double %302)
  %315 = tail call double @llvm.fma.f64(double %311, double 0xBFC5555555555555, double %314)
  %316 = fsub double %289, %315
  %317 = and i32 %290, 1
  %318 = icmp eq i32 %317, 0
  %319 = select i1 %318, double %316, double %305
  %320 = bitcast double %319 to <2 x i32>
  %321 = shl i32 %290, 30
  %322 = bitcast double %189 to <2 x i32>
  %323 = extractelement <2 x i32> %322, i64 1
  %324 = xor i32 %321, %323
  %325 = and i32 %324, -2147483648
  %326 = extractelement <2 x i32> %320, i64 1
  %327 = xor i32 %326, %325
  %328 = insertelement <2 x i32> %320, i32 %327, i64 1
  %329 = tail call i1 @llvm.amdgcn.class.f64(double %190, i32 504)
  %330 = select i1 %329, <2 x i32> %328, <2 x i32> <i32 0, i32 2146959360>
  %331 = bitcast <2 x i32> %330 to double
  %332 = fmul contract double %188, %331
  %333 = fadd contract double %185, %332
  %334 = getelementptr inbounds double, double addrspace(1)* %1, i64 %38
  store double %333, double addrspace(1)* %334, align 8, !tbaa !17
  %335 = load double, double addrspace(1)* %39, align 8, !tbaa !17
  %336 = fmul contract double %335, %335
  %337 = load double, double addrspace(1)* %36, align 8, !tbaa !17
  %338 = fmul contract double %335, 2.000000e+00
  %339 = fmul contract double %338, %337
  %340 = tail call double @llvm.fabs.f64(double %339)
  %341 = fcmp olt double %340, 0x41D0000000000000
  %342 = bitcast double %333 to i64
  br i1 %341, label %343, label %362

343:                                              ; preds = %287
  %344 = fmul double %340, 0x3FE45F306DC9C883
  %345 = tail call double @llvm.rint.f64(double %344)
  %346 = tail call double @llvm.fma.f64(double %345, double 0xBFF921FB54442D18, double %340)
  %347 = tail call double @llvm.fma.f64(double %345, double 0xBC91A62633145C00, double %346)
  %348 = fmul double %345, 0x3C91A62633145C00
  %349 = fneg double %348
  %350 = tail call double @llvm.fma.f64(double %345, double 0x3C91A62633145C00, double %349)
  %351 = fsub double %346, %348
  %352 = fsub double %346, %351
  %353 = fsub double %352, %348
  %354 = fsub double %351, %347
  %355 = fadd double %354, %353
  %356 = fsub double %355, %350
  %357 = tail call double @llvm.fma.f64(double %345, double 0xB97B839A252049C0, double %356)
  %358 = fadd double %347, %357
  %359 = fsub double %358, %347
  %360 = fsub double %357, %359
  %361 = fptosi double %345 to i32
  br label %438

362:                                              ; preds = %287
  %363 = tail call double @llvm.amdgcn.trig.preop.f64(double %340, i32 0)
  %364 = tail call double @llvm.amdgcn.trig.preop.f64(double %340, i32 1)
  %365 = tail call double @llvm.amdgcn.trig.preop.f64(double %340, i32 2)
  %366 = fcmp oge double %340, 0x7B00000000000000
  %367 = tail call double @llvm.amdgcn.ldexp.f64(double %340, i32 -128)
  %368 = select i1 %366, double %367, double %340
  %369 = fmul double %365, %368
  %370 = fneg double %369
  %371 = tail call double @llvm.fma.f64(double %365, double %368, double %370)
  %372 = fmul double %364, %368
  %373 = fneg double %372
  %374 = tail call double @llvm.fma.f64(double %364, double %368, double %373)
  %375 = fmul double %363, %368
  %376 = fneg double %375
  %377 = tail call double @llvm.fma.f64(double %363, double %368, double %376)
  %378 = fadd double %372, %377
  %379 = fsub double %378, %372
  %380 = fsub double %378, %379
  %381 = fsub double %377, %379
  %382 = fsub double %372, %380
  %383 = fadd double %381, %382
  %384 = fadd double %369, %374
  %385 = fsub double %384, %369
  %386 = fsub double %384, %385
  %387 = fsub double %374, %385
  %388 = fsub double %369, %386
  %389 = fadd double %387, %388
  %390 = fadd double %384, %383
  %391 = fsub double %390, %384
  %392 = fsub double %390, %391
  %393 = fsub double %383, %391
  %394 = fsub double %384, %392
  %395 = fadd double %393, %394
  %396 = fadd double %389, %395
  %397 = fadd double %371, %396
  %398 = fadd double %375, %378
  %399 = fsub double %398, %375
  %400 = fsub double %378, %399
  %401 = fadd double %400, %390
  %402 = fsub double %401, %400
  %403 = fsub double %390, %402
  %404 = fadd double %403, %397
  %405 = tail call double @llvm.amdgcn.ldexp.f64(double %398, i32 -2)
  %406 = tail call double @llvm.amdgcn.fract.f64(double %405)
  %407 = tail call i1 @llvm.amdgcn.class.f64(double %405, i32 516)
  %408 = select i1 %407, double 0.000000e+00, double %406
  %409 = tail call double @llvm.amdgcn.ldexp.f64(double %408, i32 2)
  %410 = fadd double %409, %401
  %411 = fcmp olt double %410, 0.000000e+00
  %412 = select i1 %411, double 4.000000e+00, double 0.000000e+00
  %413 = fadd double %409, %412
  %414 = fadd double %401, %413
  %415 = fptosi double %414 to i32
  %416 = sitofp i32 %415 to double
  %417 = fsub double %413, %416
  %418 = fadd double %401, %417
  %419 = fsub double %418, %417
  %420 = fsub double %401, %419
  %421 = fadd double %404, %420
  %422 = fcmp oge double %418, 5.000000e-01
  %423 = zext i1 %422 to i32
  %424 = add nsw i32 %423, %415
  %425 = select i1 %422, double 1.000000e+00, double 0.000000e+00
  %426 = fsub double %418, %425
  %427 = fadd double %426, %421
  %428 = fsub double %427, %426
  %429 = fsub double %421, %428
  %430 = fmul double %427, 0x3FF921FB54442D18
  %431 = fneg double %430
  %432 = tail call double @llvm.fma.f64(double %427, double 0x3FF921FB54442D18, double %431)
  %433 = tail call double @llvm.fma.f64(double %427, double 0x3C91A62633145C07, double %432)
  %434 = tail call double @llvm.fma.f64(double %429, double 0x3FF921FB54442D18, double %433)
  %435 = fadd double %430, %434
  %436 = fsub double %435, %430
  %437 = fsub double %434, %436
  br label %438

438:                                              ; preds = %343, %362
  %439 = phi double [ %360, %343 ], [ %437, %362 ]
  %440 = phi double [ %358, %343 ], [ %435, %362 ]
  %441 = phi i32 [ %361, %343 ], [ %424, %362 ]
  %442 = fmul double %440, %440
  %443 = fmul double %442, 5.000000e-01
  %444 = fsub double 1.000000e+00, %443
  %445 = fsub double 1.000000e+00, %444
  %446 = fsub double %445, %443
  %447 = fmul double %442, %442
  %448 = tail call double @llvm.fma.f64(double %442, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %449 = tail call double @llvm.fma.f64(double %442, double %448, double 0xBE927E4FA17F65F6)
  %450 = tail call double @llvm.fma.f64(double %442, double %449, double 0x3EFA01A019F4EC90)
  %451 = tail call double @llvm.fma.f64(double %442, double %450, double 0xBF56C16C16C16967)
  %452 = tail call double @llvm.fma.f64(double %442, double %451, double 0x3FA5555555555555)
  %453 = fneg double %439
  %454 = tail call double @llvm.fma.f64(double %440, double %453, double %446)
  %455 = tail call double @llvm.fma.f64(double %447, double %452, double %454)
  %456 = fadd double %444, %455
  %457 = tail call double @llvm.fma.f64(double %442, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %458 = tail call double @llvm.fma.f64(double %442, double %457, double 0x3EC71DE3796CDE01)
  %459 = tail call double @llvm.fma.f64(double %442, double %458, double 0xBF2A01A019E83E5C)
  %460 = tail call double @llvm.fma.f64(double %442, double %459, double 0x3F81111111110BB3)
  %461 = fneg double %442
  %462 = fmul double %440, %461
  %463 = fmul double %439, 5.000000e-01
  %464 = tail call double @llvm.fma.f64(double %462, double %460, double %463)
  %465 = tail call double @llvm.fma.f64(double %442, double %464, double %453)
  %466 = tail call double @llvm.fma.f64(double %462, double 0xBFC5555555555555, double %465)
  %467 = fsub double %440, %466
  %468 = and i32 %441, 1
  %469 = icmp eq i32 %468, 0
  %470 = select i1 %469, double %467, double %456
  %471 = bitcast double %470 to <2 x i32>
  %472 = shl i32 %441, 30
  %473 = bitcast double %339 to <2 x i32>
  %474 = extractelement <2 x i32> %473, i64 1
  %475 = xor i32 %472, %474
  %476 = and i32 %475, -2147483648
  %477 = extractelement <2 x i32> %471, i64 1
  %478 = xor i32 %477, %476
  %479 = insertelement <2 x i32> %471, i32 %478, i64 1
  %480 = tail call i1 @llvm.amdgcn.class.f64(double %340, i32 504)
  %481 = select i1 %480, <2 x i32> %479, <2 x i32> <i32 0, i32 2146959360>
  %482 = bitcast <2 x i32> %481 to double
  %483 = fmul contract double %337, %482
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %485 = extractelement <2 x i64> %484, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %486, label %490

486:                                              ; preds = %438
  %487 = and i64 %485, -225
  %488 = or i64 %487, 32
  %489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %488, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %931

490:                                              ; preds = %438
  %491 = and i64 %485, 2
  %492 = and i64 %485, -3
  %493 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %492, i64 0
  br label %494

494:                                              ; preds = %920, %490
  %495 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str to [23 x i8]*) to i64)), i64 1))), %490 ], [ %928, %920 ]
  %496 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0), %490 ], [ %929, %920 ]
  %497 = phi <2 x i64> [ %493, %490 ], [ %927, %920 ]
  %498 = icmp ugt i64 %495, 56
  %499 = extractelement <2 x i64> %497, i64 0
  %500 = or i64 %499, %491
  %501 = insertelement <2 x i64> poison, i64 %500, i64 0
  %502 = select i1 %498, <2 x i64> %497, <2 x i64> %501
  %503 = tail call i64 @llvm.umin.i64(i64 %495, i64 56)
  %504 = trunc i64 %503 to i32
  %505 = extractelement <2 x i64> %502, i64 0
  %506 = icmp ugt i32 %504, 7
  br i1 %506, label %509, label %507

507:                                              ; preds = %494
  %508 = icmp eq i32 %504, 0
  br i1 %508, label %562, label %549

509:                                              ; preds = %494
  %510 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !21
  %511 = zext i8 %510 to i64
  %512 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 1
  %513 = load i8, i8 addrspace(4)* %512, align 1, !tbaa !21
  %514 = zext i8 %513 to i64
  %515 = shl nuw nsw i64 %514, 8
  %516 = or i64 %515, %511
  %517 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 2
  %518 = load i8, i8 addrspace(4)* %517, align 1, !tbaa !21
  %519 = zext i8 %518 to i64
  %520 = shl nuw nsw i64 %519, 16
  %521 = or i64 %516, %520
  %522 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 3
  %523 = load i8, i8 addrspace(4)* %522, align 1, !tbaa !21
  %524 = zext i8 %523 to i64
  %525 = shl nuw nsw i64 %524, 24
  %526 = or i64 %521, %525
  %527 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 4
  %528 = load i8, i8 addrspace(4)* %527, align 1, !tbaa !21
  %529 = zext i8 %528 to i64
  %530 = shl nuw nsw i64 %529, 32
  %531 = or i64 %526, %530
  %532 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 5
  %533 = load i8, i8 addrspace(4)* %532, align 1, !tbaa !21
  %534 = zext i8 %533 to i64
  %535 = shl nuw nsw i64 %534, 40
  %536 = or i64 %531, %535
  %537 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 6
  %538 = load i8, i8 addrspace(4)* %537, align 1, !tbaa !21
  %539 = zext i8 %538 to i64
  %540 = shl nuw nsw i64 %539, 48
  %541 = or i64 %536, %540
  %542 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 7
  %543 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !21
  %544 = zext i8 %543 to i64
  %545 = shl nuw i64 %544, 56
  %546 = or i64 %541, %545
  %547 = add nsw i32 %504, -8
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 8
  br label %562

549:                                              ; preds = %507, %549
  %550 = phi i32 [ %560, %549 ], [ 0, %507 ]
  %551 = phi i64 [ %559, %549 ], [ 0, %507 ]
  %552 = zext i32 %550 to i64
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 %552
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !21
  %555 = zext i8 %554 to i64
  %556 = shl i32 %550, 3
  %557 = zext i32 %556 to i64
  %558 = shl nuw i64 %555, %557
  %559 = or i64 %558, %551
  %560 = add nuw nsw i32 %550, 1
  %561 = icmp eq i32 %560, %504
  br i1 %561, label %562, label %549, !llvm.loop !22

562:                                              ; preds = %549, %509, %507
  %563 = phi i8 addrspace(4)* [ %548, %509 ], [ %496, %507 ], [ %496, %549 ]
  %564 = phi i32 [ %547, %509 ], [ 0, %507 ], [ 0, %549 ]
  %565 = phi i64 [ %546, %509 ], [ 0, %507 ], [ %559, %549 ]
  %566 = icmp ugt i32 %564, 7
  br i1 %566, label %569, label %567

567:                                              ; preds = %562
  %568 = icmp eq i32 %564, 0
  br i1 %568, label %622, label %609

569:                                              ; preds = %562
  %570 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !21
  %571 = zext i8 %570 to i64
  %572 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 1
  %573 = load i8, i8 addrspace(4)* %572, align 1, !tbaa !21
  %574 = zext i8 %573 to i64
  %575 = shl nuw nsw i64 %574, 8
  %576 = or i64 %575, %571
  %577 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 2
  %578 = load i8, i8 addrspace(4)* %577, align 1, !tbaa !21
  %579 = zext i8 %578 to i64
  %580 = shl nuw nsw i64 %579, 16
  %581 = or i64 %576, %580
  %582 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 3
  %583 = load i8, i8 addrspace(4)* %582, align 1, !tbaa !21
  %584 = zext i8 %583 to i64
  %585 = shl nuw nsw i64 %584, 24
  %586 = or i64 %581, %585
  %587 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 4
  %588 = load i8, i8 addrspace(4)* %587, align 1, !tbaa !21
  %589 = zext i8 %588 to i64
  %590 = shl nuw nsw i64 %589, 32
  %591 = or i64 %586, %590
  %592 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 5
  %593 = load i8, i8 addrspace(4)* %592, align 1, !tbaa !21
  %594 = zext i8 %593 to i64
  %595 = shl nuw nsw i64 %594, 40
  %596 = or i64 %591, %595
  %597 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 6
  %598 = load i8, i8 addrspace(4)* %597, align 1, !tbaa !21
  %599 = zext i8 %598 to i64
  %600 = shl nuw nsw i64 %599, 48
  %601 = or i64 %596, %600
  %602 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 7
  %603 = load i8, i8 addrspace(4)* %602, align 1, !tbaa !21
  %604 = zext i8 %603 to i64
  %605 = shl nuw i64 %604, 56
  %606 = or i64 %601, %605
  %607 = add nsw i32 %564, -8
  %608 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 8
  br label %622

609:                                              ; preds = %567, %609
  %610 = phi i32 [ %620, %609 ], [ 0, %567 ]
  %611 = phi i64 [ %619, %609 ], [ 0, %567 ]
  %612 = zext i32 %610 to i64
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %563, i64 %612
  %614 = load i8, i8 addrspace(4)* %613, align 1, !tbaa !21
  %615 = zext i8 %614 to i64
  %616 = shl i32 %610, 3
  %617 = zext i32 %616 to i64
  %618 = shl nuw i64 %615, %617
  %619 = or i64 %618, %611
  %620 = add nuw nsw i32 %610, 1
  %621 = icmp eq i32 %620, %564
  br i1 %621, label %622, label %609

622:                                              ; preds = %609, %569, %567
  %623 = phi i8 addrspace(4)* [ %608, %569 ], [ %563, %567 ], [ %563, %609 ]
  %624 = phi i32 [ %607, %569 ], [ 0, %567 ], [ 0, %609 ]
  %625 = phi i64 [ %606, %569 ], [ 0, %567 ], [ %619, %609 ]
  %626 = icmp ugt i32 %624, 7
  br i1 %626, label %629, label %627

627:                                              ; preds = %622
  %628 = icmp eq i32 %624, 0
  br i1 %628, label %682, label %669

629:                                              ; preds = %622
  %630 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !21
  %631 = zext i8 %630 to i64
  %632 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 1
  %633 = load i8, i8 addrspace(4)* %632, align 1, !tbaa !21
  %634 = zext i8 %633 to i64
  %635 = shl nuw nsw i64 %634, 8
  %636 = or i64 %635, %631
  %637 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 2
  %638 = load i8, i8 addrspace(4)* %637, align 1, !tbaa !21
  %639 = zext i8 %638 to i64
  %640 = shl nuw nsw i64 %639, 16
  %641 = or i64 %636, %640
  %642 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 3
  %643 = load i8, i8 addrspace(4)* %642, align 1, !tbaa !21
  %644 = zext i8 %643 to i64
  %645 = shl nuw nsw i64 %644, 24
  %646 = or i64 %641, %645
  %647 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 4
  %648 = load i8, i8 addrspace(4)* %647, align 1, !tbaa !21
  %649 = zext i8 %648 to i64
  %650 = shl nuw nsw i64 %649, 32
  %651 = or i64 %646, %650
  %652 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 5
  %653 = load i8, i8 addrspace(4)* %652, align 1, !tbaa !21
  %654 = zext i8 %653 to i64
  %655 = shl nuw nsw i64 %654, 40
  %656 = or i64 %651, %655
  %657 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 6
  %658 = load i8, i8 addrspace(4)* %657, align 1, !tbaa !21
  %659 = zext i8 %658 to i64
  %660 = shl nuw nsw i64 %659, 48
  %661 = or i64 %656, %660
  %662 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 7
  %663 = load i8, i8 addrspace(4)* %662, align 1, !tbaa !21
  %664 = zext i8 %663 to i64
  %665 = shl nuw i64 %664, 56
  %666 = or i64 %661, %665
  %667 = add nsw i32 %624, -8
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 8
  br label %682

669:                                              ; preds = %627, %669
  %670 = phi i32 [ %680, %669 ], [ 0, %627 ]
  %671 = phi i64 [ %679, %669 ], [ 0, %627 ]
  %672 = zext i32 %670 to i64
  %673 = getelementptr inbounds i8, i8 addrspace(4)* %623, i64 %672
  %674 = load i8, i8 addrspace(4)* %673, align 1, !tbaa !21
  %675 = zext i8 %674 to i64
  %676 = shl i32 %670, 3
  %677 = zext i32 %676 to i64
  %678 = shl nuw i64 %675, %677
  %679 = or i64 %678, %671
  %680 = add nuw nsw i32 %670, 1
  %681 = icmp eq i32 %680, %624
  br i1 %681, label %682, label %669

682:                                              ; preds = %669, %629, %627
  %683 = phi i8 addrspace(4)* [ %668, %629 ], [ %623, %627 ], [ %623, %669 ]
  %684 = phi i32 [ %667, %629 ], [ 0, %627 ], [ 0, %669 ]
  %685 = phi i64 [ %666, %629 ], [ 0, %627 ], [ %679, %669 ]
  %686 = icmp ugt i32 %684, 7
  br i1 %686, label %689, label %687

687:                                              ; preds = %682
  %688 = icmp eq i32 %684, 0
  br i1 %688, label %742, label %729

689:                                              ; preds = %682
  %690 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !21
  %691 = zext i8 %690 to i64
  %692 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 1
  %693 = load i8, i8 addrspace(4)* %692, align 1, !tbaa !21
  %694 = zext i8 %693 to i64
  %695 = shl nuw nsw i64 %694, 8
  %696 = or i64 %695, %691
  %697 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 2
  %698 = load i8, i8 addrspace(4)* %697, align 1, !tbaa !21
  %699 = zext i8 %698 to i64
  %700 = shl nuw nsw i64 %699, 16
  %701 = or i64 %696, %700
  %702 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 3
  %703 = load i8, i8 addrspace(4)* %702, align 1, !tbaa !21
  %704 = zext i8 %703 to i64
  %705 = shl nuw nsw i64 %704, 24
  %706 = or i64 %701, %705
  %707 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 4
  %708 = load i8, i8 addrspace(4)* %707, align 1, !tbaa !21
  %709 = zext i8 %708 to i64
  %710 = shl nuw nsw i64 %709, 32
  %711 = or i64 %706, %710
  %712 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 5
  %713 = load i8, i8 addrspace(4)* %712, align 1, !tbaa !21
  %714 = zext i8 %713 to i64
  %715 = shl nuw nsw i64 %714, 40
  %716 = or i64 %711, %715
  %717 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 6
  %718 = load i8, i8 addrspace(4)* %717, align 1, !tbaa !21
  %719 = zext i8 %718 to i64
  %720 = shl nuw nsw i64 %719, 48
  %721 = or i64 %716, %720
  %722 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 7
  %723 = load i8, i8 addrspace(4)* %722, align 1, !tbaa !21
  %724 = zext i8 %723 to i64
  %725 = shl nuw i64 %724, 56
  %726 = or i64 %721, %725
  %727 = add nsw i32 %684, -8
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 8
  br label %742

729:                                              ; preds = %687, %729
  %730 = phi i32 [ %740, %729 ], [ 0, %687 ]
  %731 = phi i64 [ %739, %729 ], [ 0, %687 ]
  %732 = zext i32 %730 to i64
  %733 = getelementptr inbounds i8, i8 addrspace(4)* %683, i64 %732
  %734 = load i8, i8 addrspace(4)* %733, align 1, !tbaa !21
  %735 = zext i8 %734 to i64
  %736 = shl i32 %730, 3
  %737 = zext i32 %736 to i64
  %738 = shl nuw i64 %735, %737
  %739 = or i64 %738, %731
  %740 = add nuw nsw i32 %730, 1
  %741 = icmp eq i32 %740, %684
  br i1 %741, label %742, label %729

742:                                              ; preds = %729, %689, %687
  %743 = phi i8 addrspace(4)* [ %728, %689 ], [ %683, %687 ], [ %683, %729 ]
  %744 = phi i32 [ %727, %689 ], [ 0, %687 ], [ 0, %729 ]
  %745 = phi i64 [ %726, %689 ], [ 0, %687 ], [ %739, %729 ]
  %746 = icmp ugt i32 %744, 7
  br i1 %746, label %749, label %747

747:                                              ; preds = %742
  %748 = icmp eq i32 %744, 0
  br i1 %748, label %802, label %789

749:                                              ; preds = %742
  %750 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !21
  %751 = zext i8 %750 to i64
  %752 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 1
  %753 = load i8, i8 addrspace(4)* %752, align 1, !tbaa !21
  %754 = zext i8 %753 to i64
  %755 = shl nuw nsw i64 %754, 8
  %756 = or i64 %755, %751
  %757 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 2
  %758 = load i8, i8 addrspace(4)* %757, align 1, !tbaa !21
  %759 = zext i8 %758 to i64
  %760 = shl nuw nsw i64 %759, 16
  %761 = or i64 %756, %760
  %762 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 3
  %763 = load i8, i8 addrspace(4)* %762, align 1, !tbaa !21
  %764 = zext i8 %763 to i64
  %765 = shl nuw nsw i64 %764, 24
  %766 = or i64 %761, %765
  %767 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 4
  %768 = load i8, i8 addrspace(4)* %767, align 1, !tbaa !21
  %769 = zext i8 %768 to i64
  %770 = shl nuw nsw i64 %769, 32
  %771 = or i64 %766, %770
  %772 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 5
  %773 = load i8, i8 addrspace(4)* %772, align 1, !tbaa !21
  %774 = zext i8 %773 to i64
  %775 = shl nuw nsw i64 %774, 40
  %776 = or i64 %771, %775
  %777 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 6
  %778 = load i8, i8 addrspace(4)* %777, align 1, !tbaa !21
  %779 = zext i8 %778 to i64
  %780 = shl nuw nsw i64 %779, 48
  %781 = or i64 %776, %780
  %782 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 7
  %783 = load i8, i8 addrspace(4)* %782, align 1, !tbaa !21
  %784 = zext i8 %783 to i64
  %785 = shl nuw i64 %784, 56
  %786 = or i64 %781, %785
  %787 = add nsw i32 %744, -8
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 8
  br label %802

789:                                              ; preds = %747, %789
  %790 = phi i32 [ %800, %789 ], [ 0, %747 ]
  %791 = phi i64 [ %799, %789 ], [ 0, %747 ]
  %792 = zext i32 %790 to i64
  %793 = getelementptr inbounds i8, i8 addrspace(4)* %743, i64 %792
  %794 = load i8, i8 addrspace(4)* %793, align 1, !tbaa !21
  %795 = zext i8 %794 to i64
  %796 = shl i32 %790, 3
  %797 = zext i32 %796 to i64
  %798 = shl nuw i64 %795, %797
  %799 = or i64 %798, %791
  %800 = add nuw nsw i32 %790, 1
  %801 = icmp eq i32 %800, %744
  br i1 %801, label %802, label %789

802:                                              ; preds = %789, %749, %747
  %803 = phi i8 addrspace(4)* [ %788, %749 ], [ %743, %747 ], [ %743, %789 ]
  %804 = phi i32 [ %787, %749 ], [ 0, %747 ], [ 0, %789 ]
  %805 = phi i64 [ %786, %749 ], [ 0, %747 ], [ %799, %789 ]
  %806 = icmp ugt i32 %804, 7
  br i1 %806, label %809, label %807

807:                                              ; preds = %802
  %808 = icmp eq i32 %804, 0
  br i1 %808, label %862, label %849

809:                                              ; preds = %802
  %810 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !21
  %811 = zext i8 %810 to i64
  %812 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 1
  %813 = load i8, i8 addrspace(4)* %812, align 1, !tbaa !21
  %814 = zext i8 %813 to i64
  %815 = shl nuw nsw i64 %814, 8
  %816 = or i64 %815, %811
  %817 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 2
  %818 = load i8, i8 addrspace(4)* %817, align 1, !tbaa !21
  %819 = zext i8 %818 to i64
  %820 = shl nuw nsw i64 %819, 16
  %821 = or i64 %816, %820
  %822 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 3
  %823 = load i8, i8 addrspace(4)* %822, align 1, !tbaa !21
  %824 = zext i8 %823 to i64
  %825 = shl nuw nsw i64 %824, 24
  %826 = or i64 %821, %825
  %827 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 4
  %828 = load i8, i8 addrspace(4)* %827, align 1, !tbaa !21
  %829 = zext i8 %828 to i64
  %830 = shl nuw nsw i64 %829, 32
  %831 = or i64 %826, %830
  %832 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 5
  %833 = load i8, i8 addrspace(4)* %832, align 1, !tbaa !21
  %834 = zext i8 %833 to i64
  %835 = shl nuw nsw i64 %834, 40
  %836 = or i64 %831, %835
  %837 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 6
  %838 = load i8, i8 addrspace(4)* %837, align 1, !tbaa !21
  %839 = zext i8 %838 to i64
  %840 = shl nuw nsw i64 %839, 48
  %841 = or i64 %836, %840
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 7
  %843 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !21
  %844 = zext i8 %843 to i64
  %845 = shl nuw i64 %844, 56
  %846 = or i64 %841, %845
  %847 = add nsw i32 %804, -8
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 8
  br label %862

849:                                              ; preds = %807, %849
  %850 = phi i32 [ %860, %849 ], [ 0, %807 ]
  %851 = phi i64 [ %859, %849 ], [ 0, %807 ]
  %852 = zext i32 %850 to i64
  %853 = getelementptr inbounds i8, i8 addrspace(4)* %803, i64 %852
  %854 = load i8, i8 addrspace(4)* %853, align 1, !tbaa !21
  %855 = zext i8 %854 to i64
  %856 = shl i32 %850, 3
  %857 = zext i32 %856 to i64
  %858 = shl nuw i64 %855, %857
  %859 = or i64 %858, %851
  %860 = add nuw nsw i32 %850, 1
  %861 = icmp eq i32 %860, %804
  br i1 %861, label %862, label %849

862:                                              ; preds = %849, %809, %807
  %863 = phi i8 addrspace(4)* [ %848, %809 ], [ %803, %807 ], [ %803, %849 ]
  %864 = phi i32 [ %847, %809 ], [ 0, %807 ], [ 0, %849 ]
  %865 = phi i64 [ %846, %809 ], [ 0, %807 ], [ %859, %849 ]
  %866 = icmp ugt i32 %864, 7
  br i1 %866, label %869, label %867

867:                                              ; preds = %862
  %868 = icmp eq i32 %864, 0
  br i1 %868, label %920, label %907

869:                                              ; preds = %862
  %870 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !21
  %871 = zext i8 %870 to i64
  %872 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 1
  %873 = load i8, i8 addrspace(4)* %872, align 1, !tbaa !21
  %874 = zext i8 %873 to i64
  %875 = shl nuw nsw i64 %874, 8
  %876 = or i64 %875, %871
  %877 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 2
  %878 = load i8, i8 addrspace(4)* %877, align 1, !tbaa !21
  %879 = zext i8 %878 to i64
  %880 = shl nuw nsw i64 %879, 16
  %881 = or i64 %876, %880
  %882 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 3
  %883 = load i8, i8 addrspace(4)* %882, align 1, !tbaa !21
  %884 = zext i8 %883 to i64
  %885 = shl nuw nsw i64 %884, 24
  %886 = or i64 %881, %885
  %887 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 4
  %888 = load i8, i8 addrspace(4)* %887, align 1, !tbaa !21
  %889 = zext i8 %888 to i64
  %890 = shl nuw nsw i64 %889, 32
  %891 = or i64 %886, %890
  %892 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 5
  %893 = load i8, i8 addrspace(4)* %892, align 1, !tbaa !21
  %894 = zext i8 %893 to i64
  %895 = shl nuw nsw i64 %894, 40
  %896 = or i64 %891, %895
  %897 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 6
  %898 = load i8, i8 addrspace(4)* %897, align 1, !tbaa !21
  %899 = zext i8 %898 to i64
  %900 = shl nuw nsw i64 %899, 48
  %901 = or i64 %896, %900
  %902 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 7
  %903 = load i8, i8 addrspace(4)* %902, align 1, !tbaa !21
  %904 = zext i8 %903 to i64
  %905 = shl nuw i64 %904, 56
  %906 = or i64 %901, %905
  br label %920

907:                                              ; preds = %867, %907
  %908 = phi i32 [ %918, %907 ], [ 0, %867 ]
  %909 = phi i64 [ %917, %907 ], [ 0, %867 ]
  %910 = zext i32 %908 to i64
  %911 = getelementptr inbounds i8, i8 addrspace(4)* %863, i64 %910
  %912 = load i8, i8 addrspace(4)* %911, align 1, !tbaa !21
  %913 = zext i8 %912 to i64
  %914 = shl i32 %908, 3
  %915 = zext i32 %914 to i64
  %916 = shl nuw i64 %913, %915
  %917 = or i64 %916, %909
  %918 = add nuw nsw i32 %908, 1
  %919 = icmp eq i32 %918, %864
  br i1 %919, label %920, label %907

920:                                              ; preds = %907, %869, %867
  %921 = phi i64 [ %906, %869 ], [ 0, %867 ], [ %917, %907 ]
  %922 = shl nuw nsw i64 %503, 2
  %923 = add nuw nsw i64 %922, 28
  %924 = and i64 %923, 480
  %925 = and i64 %505, -225
  %926 = or i64 %925, %924
  %927 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %926, i64 noundef %565, i64 noundef %625, i64 noundef %685, i64 noundef %745, i64 noundef %805, i64 noundef %865, i64 noundef %921) #10
  %928 = sub i64 %495, %503
  %929 = getelementptr inbounds i8, i8 addrspace(4)* %496, i64 %503
  %930 = icmp eq i64 %928, 0
  br i1 %930, label %931, label %494

931:                                              ; preds = %920, %486
  %932 = phi <2 x i64> [ %489, %486 ], [ %927, %920 ]
  %933 = extractelement <2 x i64> %932, i64 0
  %934 = zext i32 %30 to i64
  %935 = and i64 %933, -225
  %936 = or i64 %935, 32
  %937 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %936, i64 noundef %934, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %938 = extractelement <2 x i64> %937, i64 0
  %939 = zext i32 %26 to i64
  %940 = and i64 %938, -225
  %941 = or i64 %940, 32
  %942 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %941, i64 noundef %939, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %943 = extractelement <2 x i64> %942, i64 0
  %944 = zext i32 %34 to i64
  %945 = and i64 %943, -225
  %946 = or i64 %945, 32
  %947 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %946, i64 noundef %944, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %948 = extractelement <2 x i64> %947, i64 0
  %949 = bitcast double %336 to i64
  %950 = and i64 %948, -225
  %951 = or i64 %950, 32
  %952 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %951, i64 noundef %949, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %953 = extractelement <2 x i64> %952, i64 0
  %954 = bitcast double %483 to i64
  %955 = and i64 %953, -225
  %956 = or i64 %955, 32
  %957 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %956, i64 noundef %954, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %958 = extractelement <2 x i64> %957, i64 0
  %959 = and i64 %958, -227
  %960 = or i64 %959, 34
  %961 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %960, i64 noundef %342, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %962 = udiv i32 %12, %9
  %963 = mul i32 %962, %9
  %964 = icmp ugt i32 %12, %963
  %965 = zext i1 %964 to i32
  %966 = add i32 %962, %965
  %967 = mul i32 %966, %9
  %968 = add i32 %967, %26
  %969 = icmp slt i32 %968, %2
  br i1 %969, label %25, label %24, !llvm.loop !24
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !26
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !27
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !16
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !16
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !16
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !16
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !16
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !16
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !16
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !16
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !27
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !28
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !27
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !27
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !26
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !29
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !31
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !29
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !31
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !16
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !29
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !31
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !32
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !31
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !27
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !16
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !16
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !16
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !16
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !16
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !16
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !16
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %110 = call i64 @llvm.read_register.i64(metadata !33) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !34
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !36
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !37
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !16
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !16
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !16
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !16
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !16
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !16
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !16
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !16
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !29
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !31
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !38
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !38
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !39
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !41
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !16
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !16
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !31
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !29
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !38
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !38
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!12, !12, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!9, !9, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!13, !13, i64 0}
!27 = !{!11, !11, i64 0}
!28 = !{i64 2662}
!29 = !{!30, !13, i64 0}
!30 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!31 = !{!30, !12, i64 40}
!32 = !{!30, !13, i64 8}
!33 = !{!"exec"}
!34 = !{!35, !11, i64 16}
!35 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!36 = !{!35, !12, i64 8}
!37 = !{!35, !11, i64 20}
!38 = !{!35, !12, i64 0}
!39 = !{!40, !12, i64 16}
!40 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!41 = !{!40, !11, i64 24}
