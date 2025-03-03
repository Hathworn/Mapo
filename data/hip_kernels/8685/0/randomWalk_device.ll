; ModuleID = '../data/hip_kernels/8685/0/main.cu'
source_filename = "../data/hip_kernels/8685/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdPiiididdd(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, double %4, i32 %5, double %6, double %7, double %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = icmp slt i32 %18, %5
  br i1 %19, label %20, label %338

20:                                               ; preds = %9
  %21 = uitofp i32 %11 to double
  %22 = fmul contract double %8, 1.000000e+03
  %23 = fmul contract double %22, %21
  %24 = uitofp i32 %10 to double
  %25 = fadd contract double %23, %24
  %26 = tail call i64 @llvm.amdgcn.s.memtime()
  %27 = sitofp i64 %26 to double
  %28 = fadd contract double %25, %27
  %29 = fptoui double %28 to i64
  %30 = trunc i64 %29 to i32
  %31 = xor i32 %30, 746559103
  %32 = lshr i64 %29, 32
  %33 = trunc i64 %32 to i32
  %34 = xor i32 %33, -1607034933
  %35 = mul i32 %31, 1228688033
  %36 = mul i32 %34, 2073658381
  %37 = mul i32 %18, %3
  %38 = sext i32 %18 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  store double 0.000000e+00, double addrspace(1)* %41, align 8, !tbaa !11
  %42 = add nsw i32 %37, %3
  %43 = icmp sgt i32 %3, 1
  br i1 %43, label %44, label %338

44:                                               ; preds = %20
  %45 = add nsw i32 %37, 1
  %46 = add i32 %35, 6615241
  %47 = add i32 %46, %36
  %48 = add i32 %35, 5783321
  %49 = xor i32 %36, 88675123
  %50 = add i32 %36, 521288629
  %51 = xor i32 %35, 362436069
  %52 = add i32 %35, 123456789
  %53 = sitofp i32 %2 to double
  %54 = sitofp i32 %3 to double
  %55 = fdiv contract double %53, %54
  %56 = fmul contract double %55, %4
  %57 = fcmp olt double %55, 0x1000000000000000
  %58 = select i1 %57, double 0x4FF0000000000000, double 1.000000e+00
  %59 = fmul double %55, %58
  %60 = tail call double @llvm.amdgcn.rsq.f64(double %59)
  %61 = fmul double %59, %60
  %62 = fmul double %60, 5.000000e-01
  %63 = fneg double %62
  %64 = tail call double @llvm.fma.f64(double %63, double %61, double 5.000000e-01)
  %65 = tail call double @llvm.fma.f64(double %62, double %64, double %62)
  %66 = tail call double @llvm.fma.f64(double %61, double %64, double %61)
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %67, double %66, double %59)
  %69 = tail call double @llvm.fma.f64(double %68, double %65, double %66)
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double %59)
  %72 = tail call double @llvm.fma.f64(double %71, double %65, double %69)
  %73 = select i1 %57, double 0x37F0000000000000, double 1.000000e+00
  %74 = fmul double %73, %72
  %75 = fcmp oeq double %59, 0.000000e+00
  %76 = fcmp oeq double %59, 0x7FF0000000000000
  %77 = or i1 %75, %76
  %78 = select i1 %77, double %59, double %74
  br label %79

79:                                               ; preds = %44, %334
  %80 = phi double [ 0.000000e+00, %44 ], [ %320, %334 ]
  %81 = phi i32 [ %45, %44 ], [ %336, %334 ]
  %82 = phi i32 [ %37, %44 ], [ %81, %334 ]
  %83 = phi i1 [ false, %44 ], [ %335, %334 ]
  %84 = phi i32 [ %47, %44 ], [ %316, %334 ]
  %85 = phi i32 [ %48, %44 ], [ %315, %334 ]
  %86 = phi i32 [ 0, %44 ], [ %314, %334 ]
  %87 = phi i32 [ %49, %44 ], [ %313, %334 ]
  %88 = phi double [ undef, %44 ], [ %312, %334 ]
  %89 = phi i32 [ %52, %44 ], [ %311, %334 ]
  %90 = phi i32 [ %51, %44 ], [ %310, %334 ]
  %91 = phi i32 [ %50, %44 ], [ %309, %334 ]
  %92 = icmp eq i32 %86, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %79
  %94 = fptrunc double %88 to float
  %95 = fpext float %94 to double
  br label %307

96:                                               ; preds = %79
  %97 = lshr i32 %89, 2
  %98 = xor i32 %97, %89
  %99 = shl i32 %85, 4
  %100 = shl i32 %98, 1
  %101 = xor i32 %100, %99
  %102 = xor i32 %101, %98
  %103 = xor i32 %102, %85
  %104 = add i32 %84, 362437
  %105 = add i32 %104, %103
  %106 = lshr i32 %90, 2
  %107 = xor i32 %106, %90
  %108 = shl i32 %103, 4
  %109 = shl i32 %107, 1
  %110 = xor i32 %109, %108
  %111 = xor i32 %110, %107
  %112 = xor i32 %111, %103
  %113 = add i32 %84, 724874
  %114 = add i32 %113, %112
  %115 = lshr i32 %91, 2
  %116 = xor i32 %115, %91
  %117 = shl i32 %112, 4
  %118 = shl i32 %116, 1
  %119 = xor i32 %118, %117
  %120 = xor i32 %119, %116
  %121 = xor i32 %120, %112
  %122 = add i32 %84, 1087311
  %123 = add i32 %122, %121
  %124 = lshr i32 %87, 2
  %125 = xor i32 %124, %87
  %126 = shl i32 %121, 4
  %127 = shl i32 %125, 1
  %128 = xor i32 %127, %126
  %129 = xor i32 %128, %125
  %130 = xor i32 %129, %121
  %131 = add i32 %84, 1449748
  %132 = add i32 %130, %131
  %133 = zext i32 %105 to i64
  %134 = zext i32 %114 to i64
  %135 = shl nuw nsw i64 %134, 21
  %136 = xor i64 %135, %133
  %137 = uitofp i64 %136 to double
  %138 = fmul contract double %137, 0x3CA0000000000000
  %139 = fadd contract double %138, 0x3CA0000000000000
  %140 = zext i32 %123 to i64
  %141 = zext i32 %132 to i64
  %142 = shl nuw nsw i64 %141, 21
  %143 = xor i64 %142, %140
  %144 = uitofp i64 %143 to double
  %145 = fmul contract double %144, 0x3CB0000000000000
  %146 = fadd contract double %145, 0x3CB0000000000000
  %147 = tail call double @llvm.amdgcn.frexp.mant.f64(double %139)
  %148 = fcmp olt double %147, 0x3FE5555555555555
  %149 = zext i1 %148 to i32
  %150 = tail call double @llvm.amdgcn.ldexp.f64(double %147, i32 %149)
  %151 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %139)
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
  %224 = fcmp oeq double %139, 0x7FF0000000000000
  %225 = select i1 %224, double %139, double %223
  %226 = fcmp oeq double %139, 0.000000e+00
  %227 = fmul contract double %225, -2.000000e+00
  %228 = select i1 %226, double 0x7FF0000000000000, double %227
  %229 = fcmp olt double %228, 0x1000000000000000
  %230 = select i1 %229, double 0x4FF0000000000000, double 1.000000e+00
  %231 = fmul double %228, %230
  %232 = tail call double @llvm.amdgcn.rsq.f64(double %231)
  %233 = fmul double %231, %232
  %234 = fmul double %232, 5.000000e-01
  %235 = fneg double %234
  %236 = tail call double @llvm.fma.f64(double %235, double %233, double 5.000000e-01)
  %237 = tail call double @llvm.fma.f64(double %234, double %236, double %234)
  %238 = tail call double @llvm.fma.f64(double %233, double %236, double %233)
  %239 = fneg double %238
  %240 = tail call double @llvm.fma.f64(double %239, double %238, double %231)
  %241 = tail call double @llvm.fma.f64(double %240, double %237, double %238)
  %242 = fneg double %241
  %243 = tail call double @llvm.fma.f64(double %242, double %241, double %231)
  %244 = tail call double @llvm.fma.f64(double %243, double %237, double %241)
  %245 = select i1 %229, double 0x37F0000000000000, double 1.000000e+00
  %246 = fmul double %245, %244
  %247 = fcmp oeq double %231, 0.000000e+00
  %248 = fcmp oeq double %231, 0x7FF0000000000000
  %249 = or i1 %247, %248
  %250 = select i1 %249, double %231, double %246
  %251 = fmul double %146, 5.000000e-01
  %252 = tail call double @llvm.amdgcn.fract.f64(double %251)
  %253 = tail call i1 @llvm.amdgcn.class.f64(double %251, i32 516)
  %254 = fmul double %252, 2.000000e+00
  %255 = select i1 %253, double 0.000000e+00, double %254
  %256 = fcmp ogt double %146, 1.000000e+00
  %257 = select i1 %256, double %255, double %146
  %258 = fmul double %257, 2.000000e+00
  %259 = tail call double @llvm.rint.f64(double %258)
  %260 = tail call double @llvm.fma.f64(double %259, double -5.000000e-01, double %257)
  %261 = fptosi double %259 to i32
  %262 = fmul double %260, %260
  %263 = tail call double @llvm.fma.f64(double %262, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %264 = tail call double @llvm.fma.f64(double %262, double %263, double 0x3FB50782D5F14825)
  %265 = tail call double @llvm.fma.f64(double %262, double %264, double 0xBFE32D2CCDFE9424)
  %266 = tail call double @llvm.fma.f64(double %262, double %265, double 0x400466BC67754FFF)
  %267 = tail call double @llvm.fma.f64(double %262, double %266, double 0xC014ABBCE625BE09)
  %268 = fmul double %260, %262
  %269 = fmul double %268, %267
  %270 = tail call double @llvm.fma.f64(double %260, double 0x400921FB54442D18, double %269)
  %271 = tail call double @llvm.fma.f64(double %262, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %272 = tail call double @llvm.fma.f64(double %262, double %271, double 0xBF9A6D1E7294BFF9)
  %273 = tail call double @llvm.fma.f64(double %262, double %272, double 0x3FCE1F5067B90B37)
  %274 = tail call double @llvm.fma.f64(double %262, double %273, double 0xBFF55D3C7E3C325B)
  %275 = tail call double @llvm.fma.f64(double %262, double %274, double 0x40103C1F081B5A67)
  %276 = tail call double @llvm.fma.f64(double %262, double %275, double 0xC013BD3CC9BE45DE)
  %277 = tail call double @llvm.fma.f64(double %262, double %276, double 1.000000e+00)
  %278 = shl i32 %261, 30
  %279 = and i32 %278, -2147483648
  %280 = and i32 %261, 1
  %281 = icmp eq i32 %280, 0
  %282 = select i1 %281, double %270, double %277
  %283 = bitcast double %282 to <2 x i32>
  %284 = bitcast double %146 to <2 x i32>
  %285 = extractelement <2 x i32> %284, i64 1
  %286 = and i32 %285, -2147483648
  %287 = extractelement <2 x i32> %283, i64 1
  %288 = xor i32 %286, %287
  %289 = xor i32 %288, %279
  %290 = insertelement <2 x i32> %283, i32 %289, i64 1
  %291 = fneg double %270
  %292 = select i1 %281, double %277, double %291
  %293 = bitcast double %292 to <2 x i32>
  %294 = extractelement <2 x i32> %293, i64 1
  %295 = xor i32 %294, %279
  %296 = insertelement <2 x i32> %293, i32 %295, i64 1
  %297 = tail call i1 @llvm.amdgcn.class.f64(double %146, i32 516)
  %298 = select i1 %297, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %296
  %299 = select i1 %297, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %290
  %300 = bitcast <2 x i32> %299 to double
  %301 = bitcast <2 x i32> %298 to double
  %302 = fmul contract double %250, %300
  %303 = fmul contract double %250, %301
  %304 = sext i32 %82 to i64
  %305 = getelementptr inbounds double, double addrspace(1)* %0, i64 %304
  %306 = load double, double addrspace(1)* %305, align 8, !tbaa !11
  br label %307

307:                                              ; preds = %93, %96
  %308 = phi double [ %306, %96 ], [ %80, %93 ]
  %309 = phi i32 [ %112, %96 ], [ %91, %93 ]
  %310 = phi i32 [ %103, %96 ], [ %90, %93 ]
  %311 = phi i32 [ %85, %96 ], [ %89, %93 ]
  %312 = phi double [ %303, %96 ], [ %88, %93 ]
  %313 = phi i32 [ %121, %96 ], [ %87, %93 ]
  %314 = phi i32 [ 1, %96 ], [ 0, %93 ]
  %315 = phi i32 [ %130, %96 ], [ %85, %93 ]
  %316 = phi i32 [ %131, %96 ], [ %84, %93 ]
  %317 = phi double [ %302, %96 ], [ %95, %93 ]
  %318 = fadd contract double %56, %308
  %319 = fmul contract double %78, %317
  %320 = fadd contract double %319, %318
  %321 = sext i32 %81 to i64
  %322 = getelementptr inbounds double, double addrspace(1)* %0, i64 %321
  store double %320, double addrspace(1)* %322, align 8, !tbaa !11
  %323 = fcmp contract ult double %320, %7
  %324 = select i1 %83, i1 true, i1 %323
  br i1 %324, label %327, label %325

325:                                              ; preds = %307
  %326 = sub nsw i32 %81, %37
  br label %332

327:                                              ; preds = %307
  br i1 %83, label %334, label %328

328:                                              ; preds = %327
  %329 = fcmp contract ugt double %320, %6
  br i1 %329, label %334, label %330

330:                                              ; preds = %328
  %331 = sub i32 %37, %81
  br label %332

332:                                              ; preds = %330, %325
  %333 = phi i32 [ %326, %325 ], [ %331, %330 ]
  store i32 %333, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %334

334:                                              ; preds = %332, %328, %327
  %335 = phi i1 [ true, %327 ], [ false, %328 ], [ true, %332 ]
  %336 = add nsw i32 %81, 1
  %337 = icmp slt i32 %336, %42
  br i1 %337, label %79, label %338, !llvm.loop !13

338:                                              ; preds = %334, %20, %9
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
