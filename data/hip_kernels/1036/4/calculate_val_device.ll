; ModuleID = '../data/hip_kernels/1036/4/main.cu'
source_filename = "../data/hip_kernels/1036/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13calculate_valPdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  %18 = udiv i32 %12, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %12, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  br label %25

24:                                               ; preds = %286, %3
  ret void

25:                                               ; preds = %17, %286
  %26 = phi i32 [ %15, %17 ], [ %334, %286 ]
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
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !16
  %38 = sext i32 %26 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16
  %41 = fmul contract double %37, %40
  %42 = tail call double @llvm.fabs.f64(double %41)
  %43 = fcmp olt double %42, 0x41D0000000000000
  br i1 %43, label %44, label %63

44:                                               ; preds = %25
  %45 = fmul double %42, 0x3FE45F306DC9C883
  %46 = tail call double @llvm.rint.f64(double %45)
  %47 = tail call double @llvm.fma.f64(double %46, double 0xBFF921FB54442D18, double %42)
  %48 = tail call double @llvm.fma.f64(double %46, double 0xBC91A62633145C00, double %47)
  %49 = fmul double %46, 0x3C91A62633145C00
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %46, double 0x3C91A62633145C00, double %50)
  %52 = fsub double %47, %49
  %53 = fsub double %47, %52
  %54 = fsub double %53, %49
  %55 = fsub double %52, %48
  %56 = fadd double %55, %54
  %57 = fsub double %56, %51
  %58 = tail call double @llvm.fma.f64(double %46, double 0xB97B839A252049C0, double %57)
  %59 = fadd double %48, %58
  %60 = fsub double %59, %48
  %61 = fsub double %58, %60
  %62 = fptosi double %46 to i32
  br label %139

63:                                               ; preds = %25
  %64 = tail call double @llvm.amdgcn.trig.preop.f64(double %42, i32 0)
  %65 = tail call double @llvm.amdgcn.trig.preop.f64(double %42, i32 1)
  %66 = tail call double @llvm.amdgcn.trig.preop.f64(double %42, i32 2)
  %67 = fcmp oge double %42, 0x7B00000000000000
  %68 = tail call double @llvm.amdgcn.ldexp.f64(double %42, i32 -128)
  %69 = select i1 %67, double %68, double %42
  %70 = fmul double %66, %69
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %66, double %69, double %71)
  %73 = fmul double %65, %69
  %74 = fneg double %73
  %75 = tail call double @llvm.fma.f64(double %65, double %69, double %74)
  %76 = fmul double %64, %69
  %77 = fneg double %76
  %78 = tail call double @llvm.fma.f64(double %64, double %69, double %77)
  %79 = fadd double %73, %78
  %80 = fsub double %79, %73
  %81 = fsub double %79, %80
  %82 = fsub double %78, %80
  %83 = fsub double %73, %81
  %84 = fadd double %82, %83
  %85 = fadd double %70, %75
  %86 = fsub double %85, %70
  %87 = fsub double %85, %86
  %88 = fsub double %75, %86
  %89 = fsub double %70, %87
  %90 = fadd double %88, %89
  %91 = fadd double %85, %84
  %92 = fsub double %91, %85
  %93 = fsub double %91, %92
  %94 = fsub double %84, %92
  %95 = fsub double %85, %93
  %96 = fadd double %94, %95
  %97 = fadd double %90, %96
  %98 = fadd double %72, %97
  %99 = fadd double %76, %79
  %100 = fsub double %99, %76
  %101 = fsub double %79, %100
  %102 = fadd double %101, %91
  %103 = fsub double %102, %101
  %104 = fsub double %91, %103
  %105 = fadd double %104, %98
  %106 = tail call double @llvm.amdgcn.ldexp.f64(double %99, i32 -2)
  %107 = tail call double @llvm.amdgcn.fract.f64(double %106)
  %108 = tail call i1 @llvm.amdgcn.class.f64(double %106, i32 516)
  %109 = select i1 %108, double 0.000000e+00, double %107
  %110 = tail call double @llvm.amdgcn.ldexp.f64(double %109, i32 2)
  %111 = fadd double %110, %102
  %112 = fcmp olt double %111, 0.000000e+00
  %113 = select i1 %112, double 4.000000e+00, double 0.000000e+00
  %114 = fadd double %110, %113
  %115 = fadd double %102, %114
  %116 = fptosi double %115 to i32
  %117 = sitofp i32 %116 to double
  %118 = fsub double %114, %117
  %119 = fadd double %102, %118
  %120 = fsub double %119, %118
  %121 = fsub double %102, %120
  %122 = fadd double %105, %121
  %123 = fcmp oge double %119, 5.000000e-01
  %124 = zext i1 %123 to i32
  %125 = add nsw i32 %124, %116
  %126 = select i1 %123, double 1.000000e+00, double 0.000000e+00
  %127 = fsub double %119, %126
  %128 = fadd double %127, %122
  %129 = fsub double %128, %127
  %130 = fsub double %122, %129
  %131 = fmul double %128, 0x3FF921FB54442D18
  %132 = fneg double %131
  %133 = tail call double @llvm.fma.f64(double %128, double 0x3FF921FB54442D18, double %132)
  %134 = tail call double @llvm.fma.f64(double %128, double 0x3C91A62633145C07, double %133)
  %135 = tail call double @llvm.fma.f64(double %130, double 0x3FF921FB54442D18, double %134)
  %136 = fadd double %131, %135
  %137 = fsub double %136, %131
  %138 = fsub double %135, %137
  br label %139

139:                                              ; preds = %44, %63
  %140 = phi double [ %61, %44 ], [ %138, %63 ]
  %141 = phi double [ %59, %44 ], [ %136, %63 ]
  %142 = phi i32 [ %62, %44 ], [ %125, %63 ]
  %143 = fmul double %141, %141
  %144 = fmul double %143, 5.000000e-01
  %145 = fsub double 1.000000e+00, %144
  %146 = fsub double 1.000000e+00, %145
  %147 = fsub double %146, %144
  %148 = fmul double %143, %143
  %149 = tail call double @llvm.fma.f64(double %143, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %150 = tail call double @llvm.fma.f64(double %143, double %149, double 0xBE927E4FA17F65F6)
  %151 = tail call double @llvm.fma.f64(double %143, double %150, double 0x3EFA01A019F4EC90)
  %152 = tail call double @llvm.fma.f64(double %143, double %151, double 0xBF56C16C16C16967)
  %153 = tail call double @llvm.fma.f64(double %143, double %152, double 0x3FA5555555555555)
  %154 = fneg double %140
  %155 = tail call double @llvm.fma.f64(double %141, double %154, double %147)
  %156 = tail call double @llvm.fma.f64(double %148, double %153, double %155)
  %157 = fadd double %145, %156
  %158 = tail call double @llvm.fma.f64(double %143, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %159 = tail call double @llvm.fma.f64(double %143, double %158, double 0x3EC71DE3796CDE01)
  %160 = tail call double @llvm.fma.f64(double %143, double %159, double 0xBF2A01A019E83E5C)
  %161 = tail call double @llvm.fma.f64(double %143, double %160, double 0x3F81111111110BB3)
  %162 = fneg double %143
  %163 = fmul double %141, %162
  %164 = fmul double %140, 5.000000e-01
  %165 = tail call double @llvm.fma.f64(double %163, double %161, double %164)
  %166 = tail call double @llvm.fma.f64(double %143, double %165, double %154)
  %167 = tail call double @llvm.fma.f64(double %163, double 0xBFC5555555555555, double %166)
  %168 = fsub double %141, %167
  %169 = and i32 %142, 1
  %170 = icmp eq i32 %169, 0
  %171 = select i1 %170, double %168, double %157
  %172 = bitcast double %171 to <2 x i32>
  %173 = shl i32 %142, 30
  %174 = bitcast double %41 to <2 x i32>
  %175 = extractelement <2 x i32> %174, i64 1
  %176 = xor i32 %173, %175
  %177 = and i32 %176, -2147483648
  %178 = extractelement <2 x i32> %172, i64 1
  %179 = xor i32 %178, %177
  %180 = insertelement <2 x i32> %172, i32 %179, i64 1
  %181 = tail call i1 @llvm.amdgcn.class.f64(double %42, i32 504)
  %182 = select i1 %181, <2 x i32> %180, <2 x i32> <i32 0, i32 2146959360>
  %183 = bitcast <2 x i32> %182 to double
  %184 = fmul contract double %183, %183
  %185 = sext i32 %34 to i64
  %186 = getelementptr inbounds double, double addrspace(1)* %0, i64 %185
  %187 = load double, double addrspace(1)* %186, align 8, !tbaa !16
  %188 = fmul contract double %40, %187
  %189 = tail call double @llvm.fabs.f64(double %188)
  %190 = fcmp olt double %189, 0x41D0000000000000
  br i1 %190, label %191, label %210

191:                                              ; preds = %139
  %192 = fmul double %189, 0x3FE45F306DC9C883
  %193 = tail call double @llvm.rint.f64(double %192)
  %194 = tail call double @llvm.fma.f64(double %193, double 0xBFF921FB54442D18, double %189)
  %195 = tail call double @llvm.fma.f64(double %193, double 0xBC91A62633145C00, double %194)
  %196 = fmul double %193, 0x3C91A62633145C00
  %197 = fneg double %196
  %198 = tail call double @llvm.fma.f64(double %193, double 0x3C91A62633145C00, double %197)
  %199 = fsub double %194, %196
  %200 = fsub double %194, %199
  %201 = fsub double %200, %196
  %202 = fsub double %199, %195
  %203 = fadd double %202, %201
  %204 = fsub double %203, %198
  %205 = tail call double @llvm.fma.f64(double %193, double 0xB97B839A252049C0, double %204)
  %206 = fadd double %195, %205
  %207 = fsub double %206, %195
  %208 = fsub double %205, %207
  %209 = fptosi double %193 to i32
  br label %286

210:                                              ; preds = %139
  %211 = tail call double @llvm.amdgcn.trig.preop.f64(double %189, i32 0)
  %212 = tail call double @llvm.amdgcn.trig.preop.f64(double %189, i32 1)
  %213 = tail call double @llvm.amdgcn.trig.preop.f64(double %189, i32 2)
  %214 = fcmp oge double %189, 0x7B00000000000000
  %215 = tail call double @llvm.amdgcn.ldexp.f64(double %189, i32 -128)
  %216 = select i1 %214, double %215, double %189
  %217 = fmul double %213, %216
  %218 = fneg double %217
  %219 = tail call double @llvm.fma.f64(double %213, double %216, double %218)
  %220 = fmul double %212, %216
  %221 = fneg double %220
  %222 = tail call double @llvm.fma.f64(double %212, double %216, double %221)
  %223 = fmul double %211, %216
  %224 = fneg double %223
  %225 = tail call double @llvm.fma.f64(double %211, double %216, double %224)
  %226 = fadd double %220, %225
  %227 = fsub double %226, %220
  %228 = fsub double %226, %227
  %229 = fsub double %225, %227
  %230 = fsub double %220, %228
  %231 = fadd double %229, %230
  %232 = fadd double %217, %222
  %233 = fsub double %232, %217
  %234 = fsub double %232, %233
  %235 = fsub double %222, %233
  %236 = fsub double %217, %234
  %237 = fadd double %235, %236
  %238 = fadd double %232, %231
  %239 = fsub double %238, %232
  %240 = fsub double %238, %239
  %241 = fsub double %231, %239
  %242 = fsub double %232, %240
  %243 = fadd double %241, %242
  %244 = fadd double %237, %243
  %245 = fadd double %219, %244
  %246 = fadd double %223, %226
  %247 = fsub double %246, %223
  %248 = fsub double %226, %247
  %249 = fadd double %248, %238
  %250 = fsub double %249, %248
  %251 = fsub double %238, %250
  %252 = fadd double %251, %245
  %253 = tail call double @llvm.amdgcn.ldexp.f64(double %246, i32 -2)
  %254 = tail call double @llvm.amdgcn.fract.f64(double %253)
  %255 = tail call i1 @llvm.amdgcn.class.f64(double %253, i32 516)
  %256 = select i1 %255, double 0.000000e+00, double %254
  %257 = tail call double @llvm.amdgcn.ldexp.f64(double %256, i32 2)
  %258 = fadd double %257, %249
  %259 = fcmp olt double %258, 0.000000e+00
  %260 = select i1 %259, double 4.000000e+00, double 0.000000e+00
  %261 = fadd double %257, %260
  %262 = fadd double %249, %261
  %263 = fptosi double %262 to i32
  %264 = sitofp i32 %263 to double
  %265 = fsub double %261, %264
  %266 = fadd double %249, %265
  %267 = fsub double %266, %265
  %268 = fsub double %249, %267
  %269 = fadd double %252, %268
  %270 = fcmp oge double %266, 5.000000e-01
  %271 = zext i1 %270 to i32
  %272 = add nsw i32 %271, %263
  %273 = select i1 %270, double 1.000000e+00, double 0.000000e+00
  %274 = fsub double %266, %273
  %275 = fadd double %274, %269
  %276 = fsub double %275, %274
  %277 = fsub double %269, %276
  %278 = fmul double %275, 0x3FF921FB54442D18
  %279 = fneg double %278
  %280 = tail call double @llvm.fma.f64(double %275, double 0x3FF921FB54442D18, double %279)
  %281 = tail call double @llvm.fma.f64(double %275, double 0x3C91A62633145C07, double %280)
  %282 = tail call double @llvm.fma.f64(double %277, double 0x3FF921FB54442D18, double %281)
  %283 = fadd double %278, %282
  %284 = fsub double %283, %278
  %285 = fsub double %282, %284
  br label %286

286:                                              ; preds = %191, %210
  %287 = phi double [ %208, %191 ], [ %285, %210 ]
  %288 = phi double [ %206, %191 ], [ %283, %210 ]
  %289 = phi i32 [ %209, %191 ], [ %272, %210 ]
  %290 = fmul double %288, %288
  %291 = fmul double %290, 5.000000e-01
  %292 = fsub double 1.000000e+00, %291
  %293 = fsub double 1.000000e+00, %292
  %294 = fsub double %293, %291
  %295 = fmul double %290, %290
  %296 = tail call double @llvm.fma.f64(double %290, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %297 = tail call double @llvm.fma.f64(double %290, double %296, double 0xBE927E4FA17F65F6)
  %298 = tail call double @llvm.fma.f64(double %290, double %297, double 0x3EFA01A019F4EC90)
  %299 = tail call double @llvm.fma.f64(double %290, double %298, double 0xBF56C16C16C16967)
  %300 = tail call double @llvm.fma.f64(double %290, double %299, double 0x3FA5555555555555)
  %301 = fneg double %287
  %302 = tail call double @llvm.fma.f64(double %288, double %301, double %294)
  %303 = tail call double @llvm.fma.f64(double %295, double %300, double %302)
  %304 = fadd double %292, %303
  %305 = tail call double @llvm.fma.f64(double %290, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %306 = tail call double @llvm.fma.f64(double %290, double %305, double 0x3EC71DE3796CDE01)
  %307 = tail call double @llvm.fma.f64(double %290, double %306, double 0xBF2A01A019E83E5C)
  %308 = tail call double @llvm.fma.f64(double %290, double %307, double 0x3F81111111110BB3)
  %309 = fneg double %290
  %310 = fmul double %288, %309
  %311 = fmul double %287, 5.000000e-01
  %312 = tail call double @llvm.fma.f64(double %310, double %308, double %311)
  %313 = tail call double @llvm.fma.f64(double %290, double %312, double %301)
  %314 = tail call double @llvm.fma.f64(double %310, double 0xBFC5555555555555, double %313)
  %315 = fsub double %288, %314
  %316 = and i32 %289, 1
  %317 = icmp eq i32 %316, 0
  %318 = select i1 %317, double %315, double %304
  %319 = bitcast double %318 to <2 x i32>
  %320 = shl i32 %289, 30
  %321 = bitcast double %188 to <2 x i32>
  %322 = extractelement <2 x i32> %321, i64 1
  %323 = xor i32 %320, %322
  %324 = and i32 %323, -2147483648
  %325 = extractelement <2 x i32> %319, i64 1
  %326 = xor i32 %325, %324
  %327 = insertelement <2 x i32> %319, i32 %326, i64 1
  %328 = tail call i1 @llvm.amdgcn.class.f64(double %189, i32 504)
  %329 = select i1 %328, <2 x i32> %327, <2 x i32> <i32 0, i32 2146959360>
  %330 = bitcast <2 x i32> %329 to double
  %331 = fmul contract double %330, %330
  %332 = fmul contract double %184, %331
  %333 = getelementptr inbounds double, double addrspace(1)* %1, i64 %38
  store double %332, double addrspace(1)* %333, align 8, !tbaa !16
  %334 = add i32 %23, %26
  %335 = icmp slt i32 %334, %2
  br i1 %335, label %25, label %24, !llvm.loop !20
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
