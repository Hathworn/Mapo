; ModuleID = '../data/hip_kernels/8685/6/main.cu'
source_filename = "../data/hip_kernels/8685/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdPidiiddS0_d(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, double %2, i32 %3, i32 %4, double %5, double %6, i32 addrspace(1)* nocapture %7, double %8) local_unnamed_addr #0 {
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
  br i1 %19, label %20, label %334

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
  br i1 %39, label %40, label %332

40:                                               ; preds = %20
  %41 = add nsw i32 %33, 1
  %42 = add i32 %31, 6615241
  %43 = add i32 %42, %32
  %44 = add i32 %31, 5783321
  %45 = xor i32 %32, 88675123
  %46 = add i32 %32, 521288629
  %47 = xor i32 %31, 362436069
  %48 = add i32 %31, 123456789
  %49 = sitofp i32 %3 to double
  %50 = fdiv contract double %2, %49
  %51 = fcmp olt double %50, 0x1000000000000000
  %52 = select i1 %51, double 0x4FF0000000000000, double 1.000000e+00
  %53 = fmul double %50, %52
  %54 = tail call double @llvm.amdgcn.rsq.f64(double %53)
  %55 = fmul double %53, %54
  %56 = fmul double %54, 5.000000e-01
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %57, double %55, double 5.000000e-01)
  %59 = tail call double @llvm.fma.f64(double %56, double %58, double %56)
  %60 = tail call double @llvm.fma.f64(double %55, double %58, double %55)
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double %53)
  %63 = tail call double @llvm.fma.f64(double %62, double %59, double %60)
  %64 = fneg double %63
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double %53)
  %66 = tail call double @llvm.fma.f64(double %65, double %59, double %63)
  %67 = select i1 %51, double 0x37F0000000000000, double 1.000000e+00
  %68 = fmul double %67, %66
  %69 = fcmp oeq double %53, 0.000000e+00
  %70 = fcmp oeq double %53, 0x7FF0000000000000
  %71 = or i1 %69, %70
  %72 = select i1 %71, double %53, double %68
  br label %74

73:                                               ; preds = %328
  br i1 %329, label %334, label %332

74:                                               ; preds = %40, %328
  %75 = phi double [ 0.000000e+00, %40 ], [ %314, %328 ]
  %76 = phi i32 [ %41, %40 ], [ %330, %328 ]
  %77 = phi i32 [ %33, %40 ], [ %76, %328 ]
  %78 = phi i1 [ false, %40 ], [ %329, %328 ]
  %79 = phi i32 [ %43, %40 ], [ %311, %328 ]
  %80 = phi i32 [ %44, %40 ], [ %310, %328 ]
  %81 = phi i32 [ 0, %40 ], [ %309, %328 ]
  %82 = phi i32 [ %45, %40 ], [ %308, %328 ]
  %83 = phi double [ undef, %40 ], [ %307, %328 ]
  %84 = phi i32 [ %48, %40 ], [ %306, %328 ]
  %85 = phi i32 [ %47, %40 ], [ %305, %328 ]
  %86 = phi i32 [ %46, %40 ], [ %304, %328 ]
  %87 = icmp eq i32 %81, 0
  br i1 %87, label %91, label %88

88:                                               ; preds = %74
  %89 = fptrunc double %83 to float
  %90 = fpext float %89 to double
  br label %302

91:                                               ; preds = %74
  %92 = lshr i32 %84, 2
  %93 = xor i32 %92, %84
  %94 = shl i32 %80, 4
  %95 = shl i32 %93, 1
  %96 = xor i32 %95, %94
  %97 = xor i32 %96, %93
  %98 = xor i32 %97, %80
  %99 = add i32 %79, 362437
  %100 = add i32 %99, %98
  %101 = lshr i32 %85, 2
  %102 = xor i32 %101, %85
  %103 = shl i32 %98, 4
  %104 = shl i32 %102, 1
  %105 = xor i32 %104, %103
  %106 = xor i32 %105, %102
  %107 = xor i32 %106, %98
  %108 = add i32 %79, 724874
  %109 = add i32 %108, %107
  %110 = lshr i32 %86, 2
  %111 = xor i32 %110, %86
  %112 = shl i32 %107, 4
  %113 = shl i32 %111, 1
  %114 = xor i32 %113, %112
  %115 = xor i32 %114, %111
  %116 = xor i32 %115, %107
  %117 = add i32 %79, 1087311
  %118 = add i32 %117, %116
  %119 = lshr i32 %82, 2
  %120 = xor i32 %119, %82
  %121 = shl i32 %116, 4
  %122 = shl i32 %120, 1
  %123 = xor i32 %122, %121
  %124 = xor i32 %123, %120
  %125 = xor i32 %124, %116
  %126 = add i32 %79, 1449748
  %127 = add i32 %125, %126
  %128 = zext i32 %100 to i64
  %129 = zext i32 %109 to i64
  %130 = shl nuw nsw i64 %129, 21
  %131 = xor i64 %130, %128
  %132 = uitofp i64 %131 to double
  %133 = fmul contract double %132, 0x3CA0000000000000
  %134 = fadd contract double %133, 0x3CA0000000000000
  %135 = zext i32 %118 to i64
  %136 = zext i32 %127 to i64
  %137 = shl nuw nsw i64 %136, 21
  %138 = xor i64 %137, %135
  %139 = uitofp i64 %138 to double
  %140 = fmul contract double %139, 0x3CB0000000000000
  %141 = fadd contract double %140, 0x3CB0000000000000
  %142 = tail call double @llvm.amdgcn.frexp.mant.f64(double %134)
  %143 = fcmp olt double %142, 0x3FE5555555555555
  %144 = zext i1 %143 to i32
  %145 = tail call double @llvm.amdgcn.ldexp.f64(double %142, i32 %144)
  %146 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %134)
  %147 = sub nsw i32 %146, %144
  %148 = fadd double %145, -1.000000e+00
  %149 = fadd double %145, 1.000000e+00
  %150 = fadd double %149, -1.000000e+00
  %151 = fsub double %145, %150
  %152 = tail call double @llvm.amdgcn.rcp.f64(double %149)
  %153 = fneg double %149
  %154 = tail call double @llvm.fma.f64(double %153, double %152, double 1.000000e+00)
  %155 = tail call double @llvm.fma.f64(double %154, double %152, double %152)
  %156 = tail call double @llvm.fma.f64(double %153, double %155, double 1.000000e+00)
  %157 = tail call double @llvm.fma.f64(double %156, double %155, double %155)
  %158 = fmul double %148, %157
  %159 = fmul double %149, %158
  %160 = fneg double %159
  %161 = tail call double @llvm.fma.f64(double %158, double %149, double %160)
  %162 = tail call double @llvm.fma.f64(double %158, double %151, double %161)
  %163 = fadd double %159, %162
  %164 = fsub double %163, %159
  %165 = fsub double %162, %164
  %166 = fsub double %148, %163
  %167 = fsub double %148, %166
  %168 = fsub double %167, %163
  %169 = fsub double %168, %165
  %170 = fadd double %166, %169
  %171 = fmul double %157, %170
  %172 = fadd double %158, %171
  %173 = fsub double %172, %158
  %174 = fsub double %171, %173
  %175 = fmul double %172, %172
  %176 = tail call double @llvm.fma.f64(double %175, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %177 = tail call double @llvm.fma.f64(double %175, double %176, double 0x3FC7474DD7F4DF2E)
  %178 = tail call double @llvm.fma.f64(double %175, double %177, double 0x3FCC71C016291751)
  %179 = tail call double @llvm.fma.f64(double %175, double %178, double 0x3FD249249B27ACF1)
  %180 = tail call double @llvm.fma.f64(double %175, double %179, double 0x3FD99999998EF7B6)
  %181 = tail call double @llvm.fma.f64(double %175, double %180, double 0x3FE5555555555780)
  %182 = tail call double @llvm.amdgcn.ldexp.f64(double %172, i32 1)
  %183 = tail call double @llvm.amdgcn.ldexp.f64(double %174, i32 1)
  %184 = fmul double %172, %175
  %185 = fmul double %184, %181
  %186 = fadd double %182, %185
  %187 = fsub double %186, %182
  %188 = fsub double %185, %187
  %189 = fadd double %183, %188
  %190 = fadd double %186, %189
  %191 = fsub double %190, %186
  %192 = fsub double %189, %191
  %193 = sitofp i32 %147 to double
  %194 = fmul double %193, 0x3FE62E42FEFA39EF
  %195 = fneg double %194
  %196 = tail call double @llvm.fma.f64(double %193, double 0x3FE62E42FEFA39EF, double %195)
  %197 = tail call double @llvm.fma.f64(double %193, double 0x3C7ABC9E3B39803F, double %196)
  %198 = fadd double %194, %197
  %199 = fsub double %198, %194
  %200 = fsub double %197, %199
  %201 = fadd double %198, %190
  %202 = fsub double %201, %198
  %203 = fsub double %201, %202
  %204 = fsub double %198, %203
  %205 = fsub double %190, %202
  %206 = fadd double %205, %204
  %207 = fadd double %200, %192
  %208 = fsub double %207, %200
  %209 = fsub double %207, %208
  %210 = fsub double %200, %209
  %211 = fsub double %192, %208
  %212 = fadd double %211, %210
  %213 = fadd double %207, %206
  %214 = fadd double %201, %213
  %215 = fsub double %214, %201
  %216 = fsub double %213, %215
  %217 = fadd double %212, %216
  %218 = fadd double %214, %217
  %219 = fcmp oeq double %134, 0x7FF0000000000000
  %220 = select i1 %219, double %134, double %218
  %221 = fcmp oeq double %134, 0.000000e+00
  %222 = fmul contract double %220, -2.000000e+00
  %223 = select i1 %221, double 0x7FF0000000000000, double %222
  %224 = fcmp olt double %223, 0x1000000000000000
  %225 = select i1 %224, double 0x4FF0000000000000, double 1.000000e+00
  %226 = fmul double %223, %225
  %227 = tail call double @llvm.amdgcn.rsq.f64(double %226)
  %228 = fmul double %226, %227
  %229 = fmul double %227, 5.000000e-01
  %230 = fneg double %229
  %231 = tail call double @llvm.fma.f64(double %230, double %228, double 5.000000e-01)
  %232 = tail call double @llvm.fma.f64(double %229, double %231, double %229)
  %233 = tail call double @llvm.fma.f64(double %228, double %231, double %228)
  %234 = fneg double %233
  %235 = tail call double @llvm.fma.f64(double %234, double %233, double %226)
  %236 = tail call double @llvm.fma.f64(double %235, double %232, double %233)
  %237 = fneg double %236
  %238 = tail call double @llvm.fma.f64(double %237, double %236, double %226)
  %239 = tail call double @llvm.fma.f64(double %238, double %232, double %236)
  %240 = select i1 %224, double 0x37F0000000000000, double 1.000000e+00
  %241 = fmul double %240, %239
  %242 = fcmp oeq double %226, 0.000000e+00
  %243 = fcmp oeq double %226, 0x7FF0000000000000
  %244 = or i1 %242, %243
  %245 = select i1 %244, double %226, double %241
  %246 = fmul double %141, 5.000000e-01
  %247 = tail call double @llvm.amdgcn.fract.f64(double %246)
  %248 = tail call i1 @llvm.amdgcn.class.f64(double %246, i32 516)
  %249 = fmul double %247, 2.000000e+00
  %250 = select i1 %248, double 0.000000e+00, double %249
  %251 = fcmp ogt double %141, 1.000000e+00
  %252 = select i1 %251, double %250, double %141
  %253 = fmul double %252, 2.000000e+00
  %254 = tail call double @llvm.rint.f64(double %253)
  %255 = tail call double @llvm.fma.f64(double %254, double -5.000000e-01, double %252)
  %256 = fptosi double %254 to i32
  %257 = fmul double %255, %255
  %258 = tail call double @llvm.fma.f64(double %257, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %259 = tail call double @llvm.fma.f64(double %257, double %258, double 0x3FB50782D5F14825)
  %260 = tail call double @llvm.fma.f64(double %257, double %259, double 0xBFE32D2CCDFE9424)
  %261 = tail call double @llvm.fma.f64(double %257, double %260, double 0x400466BC67754FFF)
  %262 = tail call double @llvm.fma.f64(double %257, double %261, double 0xC014ABBCE625BE09)
  %263 = fmul double %255, %257
  %264 = fmul double %263, %262
  %265 = tail call double @llvm.fma.f64(double %255, double 0x400921FB54442D18, double %264)
  %266 = tail call double @llvm.fma.f64(double %257, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %267 = tail call double @llvm.fma.f64(double %257, double %266, double 0xBF9A6D1E7294BFF9)
  %268 = tail call double @llvm.fma.f64(double %257, double %267, double 0x3FCE1F5067B90B37)
  %269 = tail call double @llvm.fma.f64(double %257, double %268, double 0xBFF55D3C7E3C325B)
  %270 = tail call double @llvm.fma.f64(double %257, double %269, double 0x40103C1F081B5A67)
  %271 = tail call double @llvm.fma.f64(double %257, double %270, double 0xC013BD3CC9BE45DE)
  %272 = tail call double @llvm.fma.f64(double %257, double %271, double 1.000000e+00)
  %273 = shl i32 %256, 30
  %274 = and i32 %273, -2147483648
  %275 = and i32 %256, 1
  %276 = icmp eq i32 %275, 0
  %277 = select i1 %276, double %265, double %272
  %278 = bitcast double %277 to <2 x i32>
  %279 = bitcast double %141 to <2 x i32>
  %280 = extractelement <2 x i32> %279, i64 1
  %281 = and i32 %280, -2147483648
  %282 = extractelement <2 x i32> %278, i64 1
  %283 = xor i32 %281, %282
  %284 = xor i32 %283, %274
  %285 = insertelement <2 x i32> %278, i32 %284, i64 1
  %286 = fneg double %265
  %287 = select i1 %276, double %272, double %286
  %288 = bitcast double %287 to <2 x i32>
  %289 = extractelement <2 x i32> %288, i64 1
  %290 = xor i32 %289, %274
  %291 = insertelement <2 x i32> %288, i32 %290, i64 1
  %292 = tail call i1 @llvm.amdgcn.class.f64(double %141, i32 516)
  %293 = select i1 %292, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %291
  %294 = select i1 %292, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %285
  %295 = bitcast <2 x i32> %294 to double
  %296 = bitcast <2 x i32> %293 to double
  %297 = fmul contract double %245, %295
  %298 = fmul contract double %245, %296
  %299 = sext i32 %77 to i64
  %300 = getelementptr inbounds double, double addrspace(1)* %0, i64 %299
  %301 = load double, double addrspace(1)* %300, align 8, !tbaa !11
  br label %302

302:                                              ; preds = %88, %91
  %303 = phi double [ %301, %91 ], [ %75, %88 ]
  %304 = phi i32 [ %107, %91 ], [ %86, %88 ]
  %305 = phi i32 [ %98, %91 ], [ %85, %88 ]
  %306 = phi i32 [ %80, %91 ], [ %84, %88 ]
  %307 = phi double [ %298, %91 ], [ %83, %88 ]
  %308 = phi i32 [ %116, %91 ], [ %82, %88 ]
  %309 = phi i32 [ 1, %91 ], [ 0, %88 ]
  %310 = phi i32 [ %125, %91 ], [ %80, %88 ]
  %311 = phi i32 [ %126, %91 ], [ %79, %88 ]
  %312 = phi double [ %297, %91 ], [ %90, %88 ]
  %313 = fmul contract double %72, %312
  %314 = fadd contract double %303, %313
  %315 = sext i32 %76 to i64
  %316 = getelementptr inbounds double, double addrspace(1)* %0, i64 %315
  store double %314, double addrspace(1)* %316, align 8, !tbaa !11
  %317 = fcmp contract ult double %314, %6
  %318 = select i1 %317, i1 true, i1 %78
  br i1 %318, label %321, label %319

319:                                              ; preds = %302
  %320 = sub nsw i32 %76, %33
  br label %326

321:                                              ; preds = %302
  %322 = fcmp contract ugt double %314, %5
  %323 = select i1 %322, i1 true, i1 %78
  br i1 %323, label %328, label %324

324:                                              ; preds = %321
  %325 = sub i32 %33, %76
  br label %326

326:                                              ; preds = %324, %319
  %327 = phi i32 [ %320, %319 ], [ %325, %324 ]
  store i32 %327, i32 addrspace(1)* %35, align 4, !tbaa !7
  br label %328

328:                                              ; preds = %326, %321
  %329 = phi i1 [ %78, %321 ], [ true, %326 ]
  %330 = add nsw i32 %76, 1
  %331 = icmp slt i32 %330, %38
  br i1 %331, label %74, label %73, !llvm.loop !13

332:                                              ; preds = %20, %73
  %333 = atomicrmw add i32 addrspace(1)* %7, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %334

334:                                              ; preds = %73, %332, %9
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
