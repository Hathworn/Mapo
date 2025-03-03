; ModuleID = '../data/hip_kernels/4372/10/main.cu'
source_filename = "../data/hip_kernels/4372/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10randomWalkPdPiiiidd(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, double %5, double %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %4
  br i1 %17, label %18, label %327

18:                                               ; preds = %7
  %19 = uitofp i32 %9 to double
  %20 = fmul contract double %6, 1.000000e+03
  %21 = fmul contract double %20, %19
  %22 = uitofp i32 %8 to double
  %23 = fadd contract double %21, %22
  %24 = tail call i64 @llvm.amdgcn.s.memtime()
  %25 = sitofp i64 %24 to double
  %26 = fadd contract double %23, %25
  %27 = fptoui double %26 to i64
  %28 = trunc i64 %27 to i32
  %29 = xor i32 %28, 746559103
  %30 = lshr i64 %27, 32
  %31 = trunc i64 %30 to i32
  %32 = xor i32 %31, -1607034933
  %33 = mul i32 %29, 1228688033
  %34 = mul i32 %32, 2073658381
  %35 = mul i32 %16, %3
  %36 = sext i32 %16 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  store i32 0, i32 addrspace(1)* %37, align 4, !tbaa !7
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  store double 0.000000e+00, double addrspace(1)* %39, align 8, !tbaa !11
  %40 = add nsw i32 %35, %3
  %41 = icmp sgt i32 %3, 1
  br i1 %41, label %42, label %327

42:                                               ; preds = %18
  %43 = add nsw i32 %35, 1
  %44 = add i32 %33, 6615241
  %45 = add i32 %44, %34
  %46 = add i32 %33, 5783321
  %47 = xor i32 %34, 88675123
  %48 = add i32 %34, 521288629
  %49 = xor i32 %33, 362436069
  %50 = add i32 %33, 123456789
  %51 = sitofp i32 %2 to double
  %52 = sitofp i32 %3 to double
  %53 = fdiv contract double %51, %52
  %54 = fcmp olt double %53, 0x1000000000000000
  %55 = select i1 %54, double 0x4FF0000000000000, double 1.000000e+00
  %56 = fmul double %53, %55
  %57 = tail call double @llvm.amdgcn.rsq.f64(double %56)
  %58 = fmul double %56, %57
  %59 = fmul double %57, 5.000000e-01
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %60, double %58, double 5.000000e-01)
  %62 = tail call double @llvm.fma.f64(double %59, double %61, double %59)
  %63 = tail call double @llvm.fma.f64(double %58, double %61, double %58)
  %64 = fneg double %63
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double %56)
  %66 = tail call double @llvm.fma.f64(double %65, double %62, double %63)
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %67, double %66, double %56)
  %69 = tail call double @llvm.fma.f64(double %68, double %62, double %66)
  %70 = select i1 %54, double 0x37F0000000000000, double 1.000000e+00
  %71 = fmul double %70, %69
  %72 = fcmp oeq double %56, 0.000000e+00
  %73 = fcmp oeq double %56, 0x7FF0000000000000
  %74 = or i1 %72, %73
  %75 = select i1 %74, double %56, double %71
  br label %76

76:                                               ; preds = %42, %323
  %77 = phi double [ 0.000000e+00, %42 ], [ %316, %323 ]
  %78 = phi i32 [ %43, %42 ], [ %325, %323 ]
  %79 = phi i32 [ %35, %42 ], [ %78, %323 ]
  %80 = phi i1 [ false, %42 ], [ %324, %323 ]
  %81 = phi i32 [ %45, %42 ], [ %313, %323 ]
  %82 = phi i32 [ %46, %42 ], [ %312, %323 ]
  %83 = phi i32 [ 0, %42 ], [ %311, %323 ]
  %84 = phi i32 [ %47, %42 ], [ %310, %323 ]
  %85 = phi double [ undef, %42 ], [ %309, %323 ]
  %86 = phi i32 [ %50, %42 ], [ %308, %323 ]
  %87 = phi i32 [ %49, %42 ], [ %307, %323 ]
  %88 = phi i32 [ %48, %42 ], [ %306, %323 ]
  %89 = icmp eq i32 %83, 0
  br i1 %89, label %93, label %90

90:                                               ; preds = %76
  %91 = fptrunc double %85 to float
  %92 = fpext float %91 to double
  br label %304

93:                                               ; preds = %76
  %94 = lshr i32 %86, 2
  %95 = xor i32 %94, %86
  %96 = shl i32 %82, 4
  %97 = shl i32 %95, 1
  %98 = xor i32 %97, %96
  %99 = xor i32 %98, %95
  %100 = xor i32 %99, %82
  %101 = add i32 %81, 362437
  %102 = add i32 %101, %100
  %103 = lshr i32 %87, 2
  %104 = xor i32 %103, %87
  %105 = shl i32 %100, 4
  %106 = shl i32 %104, 1
  %107 = xor i32 %106, %105
  %108 = xor i32 %107, %104
  %109 = xor i32 %108, %100
  %110 = add i32 %81, 724874
  %111 = add i32 %110, %109
  %112 = lshr i32 %88, 2
  %113 = xor i32 %112, %88
  %114 = shl i32 %109, 4
  %115 = shl i32 %113, 1
  %116 = xor i32 %115, %114
  %117 = xor i32 %116, %113
  %118 = xor i32 %117, %109
  %119 = add i32 %81, 1087311
  %120 = add i32 %119, %118
  %121 = lshr i32 %84, 2
  %122 = xor i32 %121, %84
  %123 = shl i32 %118, 4
  %124 = shl i32 %122, 1
  %125 = xor i32 %124, %123
  %126 = xor i32 %125, %122
  %127 = xor i32 %126, %118
  %128 = add i32 %81, 1449748
  %129 = add i32 %127, %128
  %130 = zext i32 %102 to i64
  %131 = zext i32 %111 to i64
  %132 = shl nuw nsw i64 %131, 21
  %133 = xor i64 %132, %130
  %134 = uitofp i64 %133 to double
  %135 = fmul contract double %134, 0x3CA0000000000000
  %136 = fadd contract double %135, 0x3CA0000000000000
  %137 = zext i32 %120 to i64
  %138 = zext i32 %129 to i64
  %139 = shl nuw nsw i64 %138, 21
  %140 = xor i64 %139, %137
  %141 = uitofp i64 %140 to double
  %142 = fmul contract double %141, 0x3CB0000000000000
  %143 = fadd contract double %142, 0x3CB0000000000000
  %144 = tail call double @llvm.amdgcn.frexp.mant.f64(double %136)
  %145 = fcmp olt double %144, 0x3FE5555555555555
  %146 = zext i1 %145 to i32
  %147 = tail call double @llvm.amdgcn.ldexp.f64(double %144, i32 %146)
  %148 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %136)
  %149 = sub nsw i32 %148, %146
  %150 = fadd double %147, -1.000000e+00
  %151 = fadd double %147, 1.000000e+00
  %152 = fadd double %151, -1.000000e+00
  %153 = fsub double %147, %152
  %154 = tail call double @llvm.amdgcn.rcp.f64(double %151)
  %155 = fneg double %151
  %156 = tail call double @llvm.fma.f64(double %155, double %154, double 1.000000e+00)
  %157 = tail call double @llvm.fma.f64(double %156, double %154, double %154)
  %158 = tail call double @llvm.fma.f64(double %155, double %157, double 1.000000e+00)
  %159 = tail call double @llvm.fma.f64(double %158, double %157, double %157)
  %160 = fmul double %150, %159
  %161 = fmul double %151, %160
  %162 = fneg double %161
  %163 = tail call double @llvm.fma.f64(double %160, double %151, double %162)
  %164 = tail call double @llvm.fma.f64(double %160, double %153, double %163)
  %165 = fadd double %161, %164
  %166 = fsub double %165, %161
  %167 = fsub double %164, %166
  %168 = fsub double %150, %165
  %169 = fsub double %150, %168
  %170 = fsub double %169, %165
  %171 = fsub double %170, %167
  %172 = fadd double %168, %171
  %173 = fmul double %159, %172
  %174 = fadd double %160, %173
  %175 = fsub double %174, %160
  %176 = fsub double %173, %175
  %177 = fmul double %174, %174
  %178 = tail call double @llvm.fma.f64(double %177, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %179 = tail call double @llvm.fma.f64(double %177, double %178, double 0x3FC7474DD7F4DF2E)
  %180 = tail call double @llvm.fma.f64(double %177, double %179, double 0x3FCC71C016291751)
  %181 = tail call double @llvm.fma.f64(double %177, double %180, double 0x3FD249249B27ACF1)
  %182 = tail call double @llvm.fma.f64(double %177, double %181, double 0x3FD99999998EF7B6)
  %183 = tail call double @llvm.fma.f64(double %177, double %182, double 0x3FE5555555555780)
  %184 = tail call double @llvm.amdgcn.ldexp.f64(double %174, i32 1)
  %185 = tail call double @llvm.amdgcn.ldexp.f64(double %176, i32 1)
  %186 = fmul double %174, %177
  %187 = fmul double %186, %183
  %188 = fadd double %184, %187
  %189 = fsub double %188, %184
  %190 = fsub double %187, %189
  %191 = fadd double %185, %190
  %192 = fadd double %188, %191
  %193 = fsub double %192, %188
  %194 = fsub double %191, %193
  %195 = sitofp i32 %149 to double
  %196 = fmul double %195, 0x3FE62E42FEFA39EF
  %197 = fneg double %196
  %198 = tail call double @llvm.fma.f64(double %195, double 0x3FE62E42FEFA39EF, double %197)
  %199 = tail call double @llvm.fma.f64(double %195, double 0x3C7ABC9E3B39803F, double %198)
  %200 = fadd double %196, %199
  %201 = fsub double %200, %196
  %202 = fsub double %199, %201
  %203 = fadd double %200, %192
  %204 = fsub double %203, %200
  %205 = fsub double %203, %204
  %206 = fsub double %200, %205
  %207 = fsub double %192, %204
  %208 = fadd double %207, %206
  %209 = fadd double %202, %194
  %210 = fsub double %209, %202
  %211 = fsub double %209, %210
  %212 = fsub double %202, %211
  %213 = fsub double %194, %210
  %214 = fadd double %213, %212
  %215 = fadd double %209, %208
  %216 = fadd double %203, %215
  %217 = fsub double %216, %203
  %218 = fsub double %215, %217
  %219 = fadd double %214, %218
  %220 = fadd double %216, %219
  %221 = fcmp oeq double %136, 0x7FF0000000000000
  %222 = select i1 %221, double %136, double %220
  %223 = fcmp oeq double %136, 0.000000e+00
  %224 = fmul contract double %222, -2.000000e+00
  %225 = select i1 %223, double 0x7FF0000000000000, double %224
  %226 = fcmp olt double %225, 0x1000000000000000
  %227 = select i1 %226, double 0x4FF0000000000000, double 1.000000e+00
  %228 = fmul double %225, %227
  %229 = tail call double @llvm.amdgcn.rsq.f64(double %228)
  %230 = fmul double %228, %229
  %231 = fmul double %229, 5.000000e-01
  %232 = fneg double %231
  %233 = tail call double @llvm.fma.f64(double %232, double %230, double 5.000000e-01)
  %234 = tail call double @llvm.fma.f64(double %231, double %233, double %231)
  %235 = tail call double @llvm.fma.f64(double %230, double %233, double %230)
  %236 = fneg double %235
  %237 = tail call double @llvm.fma.f64(double %236, double %235, double %228)
  %238 = tail call double @llvm.fma.f64(double %237, double %234, double %235)
  %239 = fneg double %238
  %240 = tail call double @llvm.fma.f64(double %239, double %238, double %228)
  %241 = tail call double @llvm.fma.f64(double %240, double %234, double %238)
  %242 = select i1 %226, double 0x37F0000000000000, double 1.000000e+00
  %243 = fmul double %242, %241
  %244 = fcmp oeq double %228, 0.000000e+00
  %245 = fcmp oeq double %228, 0x7FF0000000000000
  %246 = or i1 %244, %245
  %247 = select i1 %246, double %228, double %243
  %248 = fmul double %143, 5.000000e-01
  %249 = tail call double @llvm.amdgcn.fract.f64(double %248)
  %250 = tail call i1 @llvm.amdgcn.class.f64(double %248, i32 516)
  %251 = fmul double %249, 2.000000e+00
  %252 = select i1 %250, double 0.000000e+00, double %251
  %253 = fcmp ogt double %143, 1.000000e+00
  %254 = select i1 %253, double %252, double %143
  %255 = fmul double %254, 2.000000e+00
  %256 = tail call double @llvm.rint.f64(double %255)
  %257 = tail call double @llvm.fma.f64(double %256, double -5.000000e-01, double %254)
  %258 = fptosi double %256 to i32
  %259 = fmul double %257, %257
  %260 = tail call double @llvm.fma.f64(double %259, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %261 = tail call double @llvm.fma.f64(double %259, double %260, double 0x3FB50782D5F14825)
  %262 = tail call double @llvm.fma.f64(double %259, double %261, double 0xBFE32D2CCDFE9424)
  %263 = tail call double @llvm.fma.f64(double %259, double %262, double 0x400466BC67754FFF)
  %264 = tail call double @llvm.fma.f64(double %259, double %263, double 0xC014ABBCE625BE09)
  %265 = fmul double %257, %259
  %266 = fmul double %265, %264
  %267 = tail call double @llvm.fma.f64(double %257, double 0x400921FB54442D18, double %266)
  %268 = tail call double @llvm.fma.f64(double %259, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %269 = tail call double @llvm.fma.f64(double %259, double %268, double 0xBF9A6D1E7294BFF9)
  %270 = tail call double @llvm.fma.f64(double %259, double %269, double 0x3FCE1F5067B90B37)
  %271 = tail call double @llvm.fma.f64(double %259, double %270, double 0xBFF55D3C7E3C325B)
  %272 = tail call double @llvm.fma.f64(double %259, double %271, double 0x40103C1F081B5A67)
  %273 = tail call double @llvm.fma.f64(double %259, double %272, double 0xC013BD3CC9BE45DE)
  %274 = tail call double @llvm.fma.f64(double %259, double %273, double 1.000000e+00)
  %275 = shl i32 %258, 30
  %276 = and i32 %275, -2147483648
  %277 = and i32 %258, 1
  %278 = icmp eq i32 %277, 0
  %279 = select i1 %278, double %267, double %274
  %280 = bitcast double %279 to <2 x i32>
  %281 = bitcast double %143 to <2 x i32>
  %282 = extractelement <2 x i32> %281, i64 1
  %283 = and i32 %282, -2147483648
  %284 = extractelement <2 x i32> %280, i64 1
  %285 = xor i32 %283, %284
  %286 = xor i32 %285, %276
  %287 = insertelement <2 x i32> %280, i32 %286, i64 1
  %288 = fneg double %267
  %289 = select i1 %278, double %274, double %288
  %290 = bitcast double %289 to <2 x i32>
  %291 = extractelement <2 x i32> %290, i64 1
  %292 = xor i32 %291, %276
  %293 = insertelement <2 x i32> %290, i32 %292, i64 1
  %294 = tail call i1 @llvm.amdgcn.class.f64(double %143, i32 516)
  %295 = select i1 %294, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %293
  %296 = select i1 %294, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %287
  %297 = bitcast <2 x i32> %296 to double
  %298 = bitcast <2 x i32> %295 to double
  %299 = fmul contract double %247, %297
  %300 = fmul contract double %247, %298
  %301 = sext i32 %79 to i64
  %302 = getelementptr inbounds double, double addrspace(1)* %0, i64 %301
  %303 = load double, double addrspace(1)* %302, align 8, !tbaa !11
  br label %304

304:                                              ; preds = %90, %93
  %305 = phi double [ %303, %93 ], [ %77, %90 ]
  %306 = phi i32 [ %109, %93 ], [ %88, %90 ]
  %307 = phi i32 [ %100, %93 ], [ %87, %90 ]
  %308 = phi i32 [ %82, %93 ], [ %86, %90 ]
  %309 = phi double [ %300, %93 ], [ %85, %90 ]
  %310 = phi i32 [ %118, %93 ], [ %84, %90 ]
  %311 = phi i32 [ 1, %93 ], [ 0, %90 ]
  %312 = phi i32 [ %127, %93 ], [ %82, %90 ]
  %313 = phi i32 [ %128, %93 ], [ %81, %90 ]
  %314 = phi double [ %299, %93 ], [ %92, %90 ]
  %315 = fmul contract double %75, %314
  %316 = fadd contract double %305, %315
  %317 = sext i32 %78 to i64
  %318 = getelementptr inbounds double, double addrspace(1)* %0, i64 %317
  store double %316, double addrspace(1)* %318, align 8, !tbaa !11
  %319 = fcmp contract ult double %316, %5
  %320 = select i1 %80, i1 true, i1 %319
  br i1 %320, label %323, label %321

321:                                              ; preds = %304
  %322 = sub nsw i32 %78, %35
  store i32 %322, i32 addrspace(1)* %37, align 4, !tbaa !7
  br label %323

323:                                              ; preds = %304, %321
  %324 = phi i1 [ %80, %304 ], [ true, %321 ]
  %325 = add nsw i32 %78, 1
  %326 = icmp slt i32 %325, %40
  br i1 %326, label %76, label %327, !llvm.loop !13

327:                                              ; preds = %323, %18, %7
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
