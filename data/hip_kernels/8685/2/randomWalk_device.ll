; ModuleID = '../data/hip_kernels/8685/2/main.cu'
source_filename = "../data/hip_kernels/8685/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdPiiiiddS0_d(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, double %5, double %6, i32 addrspace(1)* nocapture %7, double %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = icmp slt i32 %18, %4
  br i1 %19, label %20, label %335

20:                                               ; preds = %9
  %21 = mul i32 %11, 1000
  %22 = add i32 %21, %10
  %23 = uitofp i32 %22 to double
  %24 = fadd contract double %23, %8
  %25 = fptoui double %24 to i64
  %26 = trunc i64 %25 to i32
  %27 = xor i32 %26, 746559103
  %28 = lshr i64 %25, 32
  %29 = trunc i64 %28 to i32
  %30 = xor i32 %29, -1607034933
  %31 = mul i32 %27, 1228688033
  %32 = mul i32 %30, 2073658381
  %33 = mul i32 %18, %3
  %34 = sext i32 %18 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  store i32 0, i32 addrspace(1)* %35, align 4, !tbaa !7
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  store double 0.000000e+00, double addrspace(1)* %37, align 8, !tbaa !11
  %38 = add nsw i32 %33, %3
  %39 = icmp sgt i32 %3, 1
  br i1 %39, label %40, label %333

40:                                               ; preds = %20
  %41 = add nsw i32 %33, 1
  %42 = add i32 %31, 6615241
  %43 = add i32 %42, %32
  %44 = add i32 %31, 5783321
  %45 = xor i32 %32, 88675123
  %46 = add i32 %32, 521288629
  %47 = xor i32 %31, 362436069
  %48 = add i32 %31, 123456789
  %49 = sitofp i32 %2 to double
  %50 = sitofp i32 %3 to double
  %51 = fdiv contract double %49, %50
  %52 = fcmp olt double %51, 0x1000000000000000
  %53 = select i1 %52, double 0x4FF0000000000000, double 1.000000e+00
  %54 = fmul double %51, %53
  %55 = tail call double @llvm.amdgcn.rsq.f64(double %54)
  %56 = fmul double %54, %55
  %57 = fmul double %55, 5.000000e-01
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %58, double %56, double 5.000000e-01)
  %60 = tail call double @llvm.fma.f64(double %57, double %59, double %57)
  %61 = tail call double @llvm.fma.f64(double %56, double %59, double %56)
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double %54)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double %61)
  %65 = fneg double %64
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double %54)
  %67 = tail call double @llvm.fma.f64(double %66, double %60, double %64)
  %68 = select i1 %52, double 0x37F0000000000000, double 1.000000e+00
  %69 = fmul double %68, %67
  %70 = fcmp oeq double %54, 0.000000e+00
  %71 = fcmp oeq double %54, 0x7FF0000000000000
  %72 = or i1 %70, %71
  %73 = select i1 %72, double %54, double %69
  br label %75

74:                                               ; preds = %329
  br i1 %330, label %335, label %333

75:                                               ; preds = %40, %329
  %76 = phi double [ 0.000000e+00, %40 ], [ %315, %329 ]
  %77 = phi i32 [ %41, %40 ], [ %331, %329 ]
  %78 = phi i32 [ %33, %40 ], [ %77, %329 ]
  %79 = phi i1 [ false, %40 ], [ %330, %329 ]
  %80 = phi i32 [ %43, %40 ], [ %312, %329 ]
  %81 = phi i32 [ %44, %40 ], [ %311, %329 ]
  %82 = phi i32 [ 0, %40 ], [ %310, %329 ]
  %83 = phi i32 [ %45, %40 ], [ %309, %329 ]
  %84 = phi double [ undef, %40 ], [ %308, %329 ]
  %85 = phi i32 [ %48, %40 ], [ %307, %329 ]
  %86 = phi i32 [ %47, %40 ], [ %306, %329 ]
  %87 = phi i32 [ %46, %40 ], [ %305, %329 ]
  %88 = icmp eq i32 %82, 0
  br i1 %88, label %92, label %89

89:                                               ; preds = %75
  %90 = fptrunc double %84 to float
  %91 = fpext float %90 to double
  br label %303

92:                                               ; preds = %75
  %93 = lshr i32 %85, 2
  %94 = xor i32 %93, %85
  %95 = shl i32 %81, 4
  %96 = shl i32 %94, 1
  %97 = xor i32 %96, %95
  %98 = xor i32 %97, %94
  %99 = xor i32 %98, %81
  %100 = add i32 %80, 362437
  %101 = add i32 %100, %99
  %102 = lshr i32 %86, 2
  %103 = xor i32 %102, %86
  %104 = shl i32 %99, 4
  %105 = shl i32 %103, 1
  %106 = xor i32 %105, %104
  %107 = xor i32 %106, %103
  %108 = xor i32 %107, %99
  %109 = add i32 %80, 724874
  %110 = add i32 %109, %108
  %111 = lshr i32 %87, 2
  %112 = xor i32 %111, %87
  %113 = shl i32 %108, 4
  %114 = shl i32 %112, 1
  %115 = xor i32 %114, %113
  %116 = xor i32 %115, %112
  %117 = xor i32 %116, %108
  %118 = add i32 %80, 1087311
  %119 = add i32 %118, %117
  %120 = lshr i32 %83, 2
  %121 = xor i32 %120, %83
  %122 = shl i32 %117, 4
  %123 = shl i32 %121, 1
  %124 = xor i32 %123, %122
  %125 = xor i32 %124, %121
  %126 = xor i32 %125, %117
  %127 = add i32 %80, 1449748
  %128 = add i32 %126, %127
  %129 = zext i32 %101 to i64
  %130 = zext i32 %110 to i64
  %131 = shl nuw nsw i64 %130, 21
  %132 = xor i64 %131, %129
  %133 = uitofp i64 %132 to double
  %134 = fmul contract double %133, 0x3CA0000000000000
  %135 = fadd contract double %134, 0x3CA0000000000000
  %136 = zext i32 %119 to i64
  %137 = zext i32 %128 to i64
  %138 = shl nuw nsw i64 %137, 21
  %139 = xor i64 %138, %136
  %140 = uitofp i64 %139 to double
  %141 = fmul contract double %140, 0x3CB0000000000000
  %142 = fadd contract double %141, 0x3CB0000000000000
  %143 = tail call double @llvm.amdgcn.frexp.mant.f64(double %135)
  %144 = fcmp olt double %143, 0x3FE5555555555555
  %145 = zext i1 %144 to i32
  %146 = tail call double @llvm.amdgcn.ldexp.f64(double %143, i32 %145)
  %147 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %135)
  %148 = sub nsw i32 %147, %145
  %149 = fadd double %146, -1.000000e+00
  %150 = fadd double %146, 1.000000e+00
  %151 = fadd double %150, -1.000000e+00
  %152 = fsub double %146, %151
  %153 = tail call double @llvm.amdgcn.rcp.f64(double %150)
  %154 = fneg double %150
  %155 = tail call double @llvm.fma.f64(double %154, double %153, double 1.000000e+00)
  %156 = tail call double @llvm.fma.f64(double %155, double %153, double %153)
  %157 = tail call double @llvm.fma.f64(double %154, double %156, double 1.000000e+00)
  %158 = tail call double @llvm.fma.f64(double %157, double %156, double %156)
  %159 = fmul double %149, %158
  %160 = fmul double %150, %159
  %161 = fneg double %160
  %162 = tail call double @llvm.fma.f64(double %159, double %150, double %161)
  %163 = tail call double @llvm.fma.f64(double %159, double %152, double %162)
  %164 = fadd double %160, %163
  %165 = fsub double %164, %160
  %166 = fsub double %163, %165
  %167 = fsub double %149, %164
  %168 = fsub double %149, %167
  %169 = fsub double %168, %164
  %170 = fsub double %169, %166
  %171 = fadd double %167, %170
  %172 = fmul double %158, %171
  %173 = fadd double %159, %172
  %174 = fsub double %173, %159
  %175 = fsub double %172, %174
  %176 = fmul double %173, %173
  %177 = tail call double @llvm.fma.f64(double %176, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %178 = tail call double @llvm.fma.f64(double %176, double %177, double 0x3FC7474DD7F4DF2E)
  %179 = tail call double @llvm.fma.f64(double %176, double %178, double 0x3FCC71C016291751)
  %180 = tail call double @llvm.fma.f64(double %176, double %179, double 0x3FD249249B27ACF1)
  %181 = tail call double @llvm.fma.f64(double %176, double %180, double 0x3FD99999998EF7B6)
  %182 = tail call double @llvm.fma.f64(double %176, double %181, double 0x3FE5555555555780)
  %183 = tail call double @llvm.amdgcn.ldexp.f64(double %173, i32 1)
  %184 = tail call double @llvm.amdgcn.ldexp.f64(double %175, i32 1)
  %185 = fmul double %173, %176
  %186 = fmul double %185, %182
  %187 = fadd double %183, %186
  %188 = fsub double %187, %183
  %189 = fsub double %186, %188
  %190 = fadd double %184, %189
  %191 = fadd double %187, %190
  %192 = fsub double %191, %187
  %193 = fsub double %190, %192
  %194 = sitofp i32 %148 to double
  %195 = fmul double %194, 0x3FE62E42FEFA39EF
  %196 = fneg double %195
  %197 = tail call double @llvm.fma.f64(double %194, double 0x3FE62E42FEFA39EF, double %196)
  %198 = tail call double @llvm.fma.f64(double %194, double 0x3C7ABC9E3B39803F, double %197)
  %199 = fadd double %195, %198
  %200 = fsub double %199, %195
  %201 = fsub double %198, %200
  %202 = fadd double %199, %191
  %203 = fsub double %202, %199
  %204 = fsub double %202, %203
  %205 = fsub double %199, %204
  %206 = fsub double %191, %203
  %207 = fadd double %206, %205
  %208 = fadd double %201, %193
  %209 = fsub double %208, %201
  %210 = fsub double %208, %209
  %211 = fsub double %201, %210
  %212 = fsub double %193, %209
  %213 = fadd double %212, %211
  %214 = fadd double %208, %207
  %215 = fadd double %202, %214
  %216 = fsub double %215, %202
  %217 = fsub double %214, %216
  %218 = fadd double %213, %217
  %219 = fadd double %215, %218
  %220 = fcmp oeq double %135, 0x7FF0000000000000
  %221 = select i1 %220, double %135, double %219
  %222 = fcmp oeq double %135, 0.000000e+00
  %223 = fmul contract double %221, -2.000000e+00
  %224 = select i1 %222, double 0x7FF0000000000000, double %223
  %225 = fcmp olt double %224, 0x1000000000000000
  %226 = select i1 %225, double 0x4FF0000000000000, double 1.000000e+00
  %227 = fmul double %224, %226
  %228 = tail call double @llvm.amdgcn.rsq.f64(double %227)
  %229 = fmul double %227, %228
  %230 = fmul double %228, 5.000000e-01
  %231 = fneg double %230
  %232 = tail call double @llvm.fma.f64(double %231, double %229, double 5.000000e-01)
  %233 = tail call double @llvm.fma.f64(double %230, double %232, double %230)
  %234 = tail call double @llvm.fma.f64(double %229, double %232, double %229)
  %235 = fneg double %234
  %236 = tail call double @llvm.fma.f64(double %235, double %234, double %227)
  %237 = tail call double @llvm.fma.f64(double %236, double %233, double %234)
  %238 = fneg double %237
  %239 = tail call double @llvm.fma.f64(double %238, double %237, double %227)
  %240 = tail call double @llvm.fma.f64(double %239, double %233, double %237)
  %241 = select i1 %225, double 0x37F0000000000000, double 1.000000e+00
  %242 = fmul double %241, %240
  %243 = fcmp oeq double %227, 0.000000e+00
  %244 = fcmp oeq double %227, 0x7FF0000000000000
  %245 = or i1 %243, %244
  %246 = select i1 %245, double %227, double %242
  %247 = fmul double %142, 5.000000e-01
  %248 = tail call double @llvm.amdgcn.fract.f64(double %247)
  %249 = tail call i1 @llvm.amdgcn.class.f64(double %247, i32 516)
  %250 = fmul double %248, 2.000000e+00
  %251 = select i1 %249, double 0.000000e+00, double %250
  %252 = fcmp ogt double %142, 1.000000e+00
  %253 = select i1 %252, double %251, double %142
  %254 = fmul double %253, 2.000000e+00
  %255 = tail call double @llvm.rint.f64(double %254)
  %256 = tail call double @llvm.fma.f64(double %255, double -5.000000e-01, double %253)
  %257 = fptosi double %255 to i32
  %258 = fmul double %256, %256
  %259 = tail call double @llvm.fma.f64(double %258, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %260 = tail call double @llvm.fma.f64(double %258, double %259, double 0x3FB50782D5F14825)
  %261 = tail call double @llvm.fma.f64(double %258, double %260, double 0xBFE32D2CCDFE9424)
  %262 = tail call double @llvm.fma.f64(double %258, double %261, double 0x400466BC67754FFF)
  %263 = tail call double @llvm.fma.f64(double %258, double %262, double 0xC014ABBCE625BE09)
  %264 = fmul double %256, %258
  %265 = fmul double %264, %263
  %266 = tail call double @llvm.fma.f64(double %256, double 0x400921FB54442D18, double %265)
  %267 = tail call double @llvm.fma.f64(double %258, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %268 = tail call double @llvm.fma.f64(double %258, double %267, double 0xBF9A6D1E7294BFF9)
  %269 = tail call double @llvm.fma.f64(double %258, double %268, double 0x3FCE1F5067B90B37)
  %270 = tail call double @llvm.fma.f64(double %258, double %269, double 0xBFF55D3C7E3C325B)
  %271 = tail call double @llvm.fma.f64(double %258, double %270, double 0x40103C1F081B5A67)
  %272 = tail call double @llvm.fma.f64(double %258, double %271, double 0xC013BD3CC9BE45DE)
  %273 = tail call double @llvm.fma.f64(double %258, double %272, double 1.000000e+00)
  %274 = shl i32 %257, 30
  %275 = and i32 %274, -2147483648
  %276 = and i32 %257, 1
  %277 = icmp eq i32 %276, 0
  %278 = select i1 %277, double %266, double %273
  %279 = bitcast double %278 to <2 x i32>
  %280 = bitcast double %142 to <2 x i32>
  %281 = extractelement <2 x i32> %280, i64 1
  %282 = and i32 %281, -2147483648
  %283 = extractelement <2 x i32> %279, i64 1
  %284 = xor i32 %282, %283
  %285 = xor i32 %284, %275
  %286 = insertelement <2 x i32> %279, i32 %285, i64 1
  %287 = fneg double %266
  %288 = select i1 %277, double %273, double %287
  %289 = bitcast double %288 to <2 x i32>
  %290 = extractelement <2 x i32> %289, i64 1
  %291 = xor i32 %290, %275
  %292 = insertelement <2 x i32> %289, i32 %291, i64 1
  %293 = tail call i1 @llvm.amdgcn.class.f64(double %142, i32 516)
  %294 = select i1 %293, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %292
  %295 = select i1 %293, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %286
  %296 = bitcast <2 x i32> %295 to double
  %297 = bitcast <2 x i32> %294 to double
  %298 = fmul contract double %246, %296
  %299 = fmul contract double %246, %297
  %300 = sext i32 %78 to i64
  %301 = getelementptr inbounds double, double addrspace(1)* %0, i64 %300
  %302 = load double, double addrspace(1)* %301, align 8, !tbaa !11
  br label %303

303:                                              ; preds = %89, %92
  %304 = phi double [ %302, %92 ], [ %76, %89 ]
  %305 = phi i32 [ %108, %92 ], [ %87, %89 ]
  %306 = phi i32 [ %99, %92 ], [ %86, %89 ]
  %307 = phi i32 [ %81, %92 ], [ %85, %89 ]
  %308 = phi double [ %299, %92 ], [ %84, %89 ]
  %309 = phi i32 [ %117, %92 ], [ %83, %89 ]
  %310 = phi i32 [ 1, %92 ], [ 0, %89 ]
  %311 = phi i32 [ %126, %92 ], [ %81, %89 ]
  %312 = phi i32 [ %127, %92 ], [ %80, %89 ]
  %313 = phi double [ %298, %92 ], [ %91, %89 ]
  %314 = fmul contract double %73, %313
  %315 = fadd contract double %304, %314
  %316 = sext i32 %77 to i64
  %317 = getelementptr inbounds double, double addrspace(1)* %0, i64 %316
  store double %315, double addrspace(1)* %317, align 8, !tbaa !11
  %318 = fcmp contract ult double %315, %6
  %319 = select i1 %79, i1 true, i1 %318
  br i1 %319, label %322, label %320

320:                                              ; preds = %303
  %321 = sub nsw i32 %77, %33
  br label %327

322:                                              ; preds = %303
  br i1 %79, label %329, label %323

323:                                              ; preds = %322
  %324 = fcmp contract ugt double %315, %5
  br i1 %324, label %329, label %325

325:                                              ; preds = %323
  %326 = sub i32 %33, %77
  br label %327

327:                                              ; preds = %325, %320
  %328 = phi i32 [ %321, %320 ], [ %326, %325 ]
  store i32 %328, i32 addrspace(1)* %35, align 4, !tbaa !7
  br label %329

329:                                              ; preds = %327, %323, %322
  %330 = phi i1 [ true, %322 ], [ false, %323 ], [ true, %327 ]
  %331 = add nsw i32 %77, 1
  %332 = icmp slt i32 %331, %38
  br i1 %332, label %75, label %74, !llvm.loop !13

333:                                              ; preds = %20, %74
  %334 = atomicrmw add i32 addrspace(1)* %7, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %335

335:                                              ; preds = %74, %333, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
