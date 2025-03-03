; ModuleID = '../data/hip_kernels/3007/192/main.cu'
source_filename = "../data/hip_kernels/3007/192/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_gammaiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %326

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %326

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp ogt float %44, 1.562500e-02
  br i1 %45, label %46, label %312

46:                                               ; preds = %37
  %47 = fcmp olt float %43, 1.000000e+00
  br i1 %47, label %48, label %52

48:                                               ; preds = %46
  %49 = fadd float %44, 3.000000e+00
  %50 = tail call float @llvm.fmuladd.f32(float %49, float %44, float 2.000000e+00)
  %51 = fmul float %44, %50
  br label %62

52:                                               ; preds = %46
  %53 = fcmp olt float %44, 2.000000e+00
  br i1 %53, label %54, label %57

54:                                               ; preds = %52
  %55 = tail call float @llvm.fmuladd.f32(float %43, float %43, float %44)
  %56 = fadd float %44, 2.000000e+00
  br label %62

57:                                               ; preds = %52
  %58 = fcmp olt float %44, 3.000000e+00
  %59 = fadd float %44, 1.000000e+00
  %60 = select i1 %58, float %44, float 1.000000e+00
  %61 = select i1 %58, float %59, float %44
  br label %62

62:                                               ; preds = %57, %54, %48
  %63 = phi float [ %51, %48 ], [ %55, %54 ], [ %60, %57 ]
  %64 = phi float [ %49, %48 ], [ %56, %54 ], [ %61, %57 ]
  %65 = tail call float @llvm.fmuladd.f32(float %64, float 5.000000e-01, float -2.500000e-01)
  %66 = tail call float @llvm.fabs.f32(float %64)
  %67 = tail call float @llvm.amdgcn.frexp.mant.f32(float %66)
  %68 = fcmp olt float %67, 0x3FE5555560000000
  %69 = zext i1 %68 to i32
  %70 = tail call float @llvm.amdgcn.ldexp.f32(float %67, i32 %69)
  %71 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %66)
  %72 = sub nsw i32 %71, %69
  %73 = fadd float %70, -1.000000e+00
  %74 = fadd float %70, 1.000000e+00
  %75 = fadd float %74, -1.000000e+00
  %76 = fsub float %70, %75
  %77 = tail call float @llvm.amdgcn.rcp.f32(float %74)
  %78 = fmul float %73, %77
  %79 = fmul float %74, %78
  %80 = fneg float %79
  %81 = tail call float @llvm.fma.f32(float %78, float %74, float %80)
  %82 = tail call float @llvm.fma.f32(float %78, float %76, float %81)
  %83 = fadd float %79, %82
  %84 = fsub float %83, %79
  %85 = fsub float %82, %84
  %86 = fsub float %73, %83
  %87 = fsub float %73, %86
  %88 = fsub float %87, %83
  %89 = fsub float %88, %85
  %90 = fadd float %86, %89
  %91 = fmul float %77, %90
  %92 = fadd float %78, %91
  %93 = fsub float %92, %78
  %94 = fsub float %91, %93
  %95 = fmul float %92, %92
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %92, float %92, float %96)
  %98 = fmul float %94, 2.000000e+00
  %99 = tail call float @llvm.fma.f32(float %92, float %98, float %97)
  %100 = fadd float %95, %99
  %101 = fsub float %100, %95
  %102 = fsub float %99, %101
  %103 = tail call float @llvm.fmuladd.f32(float %100, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %104 = tail call float @llvm.fmuladd.f32(float %100, float %103, float 0x3FD999BDE0000000)
  %105 = sitofp i32 %72 to float
  %106 = fmul float %105, 0x3FE62E4300000000
  %107 = fneg float %106
  %108 = tail call float @llvm.fma.f32(float %105, float 0x3FE62E4300000000, float %107)
  %109 = tail call float @llvm.fma.f32(float %105, float 0xBE205C6100000000, float %108)
  %110 = fadd float %106, %109
  %111 = fsub float %110, %106
  %112 = fsub float %109, %111
  %113 = tail call float @llvm.amdgcn.ldexp.f32(float %92, i32 1)
  %114 = fmul float %92, %100
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %100, float %92, float %115)
  %117 = tail call float @llvm.fma.f32(float %100, float %94, float %116)
  %118 = tail call float @llvm.fma.f32(float %102, float %92, float %117)
  %119 = fadd float %114, %118
  %120 = fsub float %119, %114
  %121 = fsub float %118, %120
  %122 = fmul float %100, %104
  %123 = fneg float %122
  %124 = tail call float @llvm.fma.f32(float %100, float %104, float %123)
  %125 = tail call float @llvm.fma.f32(float %102, float %104, float %124)
  %126 = fadd float %122, %125
  %127 = fsub float %126, %122
  %128 = fsub float %125, %127
  %129 = fadd float %126, 0x3FE5555540000000
  %130 = fadd float %129, 0xBFE5555540000000
  %131 = fsub float %126, %130
  %132 = fadd float %128, 0x3E2E720200000000
  %133 = fadd float %132, %131
  %134 = fadd float %129, %133
  %135 = fsub float %134, %129
  %136 = fsub float %133, %135
  %137 = fmul float %119, %134
  %138 = fneg float %137
  %139 = tail call float @llvm.fma.f32(float %119, float %134, float %138)
  %140 = tail call float @llvm.fma.f32(float %119, float %136, float %139)
  %141 = tail call float @llvm.fma.f32(float %121, float %134, float %140)
  %142 = tail call float @llvm.amdgcn.ldexp.f32(float %94, i32 1)
  %143 = fadd float %137, %141
  %144 = fsub float %143, %137
  %145 = fsub float %141, %144
  %146 = fadd float %113, %143
  %147 = fsub float %146, %113
  %148 = fsub float %143, %147
  %149 = fadd float %142, %145
  %150 = fadd float %149, %148
  %151 = fadd float %146, %150
  %152 = fsub float %151, %146
  %153 = fsub float %150, %152
  %154 = fadd float %110, %151
  %155 = fsub float %154, %110
  %156 = fsub float %154, %155
  %157 = fsub float %110, %156
  %158 = fsub float %151, %155
  %159 = fadd float %158, %157
  %160 = fadd float %112, %153
  %161 = fsub float %160, %112
  %162 = fsub float %160, %161
  %163 = fsub float %112, %162
  %164 = fsub float %153, %161
  %165 = fadd float %164, %163
  %166 = fadd float %160, %159
  %167 = fadd float %154, %166
  %168 = fsub float %167, %154
  %169 = fsub float %166, %168
  %170 = fadd float %165, %169
  %171 = fadd float %167, %170
  %172 = fsub float %171, %167
  %173 = fsub float %170, %172
  %174 = fmul float %65, %171
  %175 = fneg float %174
  %176 = tail call float @llvm.fma.f32(float %65, float %171, float %175)
  %177 = tail call float @llvm.fma.f32(float %65, float %173, float %176)
  %178 = fadd float %174, %177
  %179 = fsub float %178, %174
  %180 = fsub float %177, %179
  %181 = tail call float @llvm.fabs.f32(float %174) #3
  %182 = fcmp oeq float %181, 0x7FF0000000000000
  %183 = select i1 %182, float %174, float %178
  %184 = tail call float @llvm.fabs.f32(float %183) #3
  %185 = fcmp oeq float %184, 0x7FF0000000000000
  %186 = select i1 %185, float 0.000000e+00, float %180
  %187 = fcmp oeq float %183, 0x40562E4300000000
  %188 = select i1 %187, float 0x3EE0000000000000, float 0.000000e+00
  %189 = fsub float %183, %188
  %190 = fadd float %188, %186
  %191 = fmul float %189, 0x3FF7154760000000
  %192 = tail call float @llvm.rint.f32(float %191)
  %193 = fcmp ogt float %189, 0x40562E4300000000
  %194 = fcmp olt float %189, 0xC059D1DA00000000
  %195 = fneg float %191
  %196 = tail call float @llvm.fma.f32(float %189, float 0x3FF7154760000000, float %195)
  %197 = tail call float @llvm.fma.f32(float %189, float 0x3E54AE0BE0000000, float %196)
  %198 = fsub float %191, %192
  %199 = fadd float %197, %198
  %200 = tail call float @llvm.exp2.f32(float %199)
  %201 = fptosi float %192 to i32
  %202 = tail call float @llvm.amdgcn.ldexp.f32(float %200, i32 %201)
  %203 = select i1 %194, float 0.000000e+00, float %202
  %204 = select i1 %193, float 0x7FF0000000000000, float %203
  %205 = tail call float @llvm.fma.f32(float %204, float %190, float %204)
  %206 = tail call float @llvm.fabs.f32(float %204) #3
  %207 = fcmp oeq float %206, 0x7FF0000000000000
  %208 = select i1 %207, float %204, float %205
  %209 = tail call float @llvm.fabs.f32(float %65)
  %210 = tail call float @llvm.fabs.f32(float %208)
  %211 = fcmp olt float %65, 0.000000e+00
  %212 = select i1 %211, float 0x7FF0000000000000, float 0.000000e+00
  %213 = select i1 %211, float 0.000000e+00, float 0x7FF0000000000000
  %214 = fcmp oeq float %64, 0.000000e+00
  %215 = select i1 %214, float %212, float %210
  %216 = fcmp oeq float %66, 0x7FF0000000000000
  %217 = select i1 %216, float %213, float %215
  %218 = fcmp oeq float %209, 0x7FF0000000000000
  %219 = fcmp olt float %66, 1.000000e+00
  %220 = select i1 %219, float %212, float %213
  %221 = select i1 %218, float %220, float %217
  %222 = fcmp oeq float %65, 0.000000e+00
  %223 = select i1 %214, i1 true, i1 %216
  %224 = select i1 %223, float 0x7FF8000000000000, float 1.000000e+00
  %225 = select i1 %222, float %224, float %221
  %226 = fcmp oeq float %64, 1.000000e+00
  %227 = select i1 %218, float 0x7FF8000000000000, float 1.000000e+00
  %228 = select i1 %226, float %227, float %225
  %229 = fcmp ult float %64, 0.000000e+00
  %230 = fcmp uno float %65, 0.000000e+00
  %231 = or i1 %229, %230
  %232 = select i1 %231, float 0x7FF8000000000000, float %228
  %233 = fneg float %64
  %234 = fmul float %64, 0xBFF7154760000000
  %235 = tail call float @llvm.rint.f32(float %234)
  %236 = fcmp ogt float %64, 0x4059D1DA00000000
  %237 = fneg float %234
  %238 = tail call float @llvm.fma.f32(float %233, float 0x3FF7154760000000, float %237)
  %239 = tail call float @llvm.fma.f32(float %233, float 0x3E54AE0BE0000000, float %238)
  %240 = fsub float %234, %235
  %241 = fadd float %239, %240
  %242 = tail call float @llvm.exp2.f32(float %241)
  %243 = fptosi float %235 to i32
  %244 = tail call float @llvm.amdgcn.ldexp.f32(float %242, i32 %243)
  %245 = select i1 %236, float 0.000000e+00, float %244
  %246 = tail call float @llvm.amdgcn.rcp.f32(float %64)
  %247 = tail call float @llvm.fmuladd.f32(float %246, float 0xBF65F72680000000, float 0x3F6C71C720000000)
  %248 = tail call float @llvm.fmuladd.f32(float %246, float %247, float 0x3FB5555560000000)
  %249 = fmul float %246, %248
  %250 = fcmp ogt float %43, 0.000000e+00
  br i1 %250, label %251, label %260

251:                                              ; preds = %62
  %252 = fmul float %245, 0x40040D9320000000
  %253 = fmul float %252, %232
  %254 = fmul float %232, %253
  %255 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %256 = fmul float %255, %254
  %257 = tail call float @llvm.fmuladd.f32(float %256, float %249, float %256)
  %258 = fcmp ogt float %43, 0x40418521E0000000
  %259 = select i1 %258, float 0x7FF0000000000000, float %257
  br label %319

260:                                              ; preds = %62
  %261 = fmul float %44, 5.000000e-01
  %262 = tail call float @llvm.amdgcn.fract.f32(float %261)
  %263 = tail call i1 @llvm.amdgcn.class.f32(float %261, i32 516)
  %264 = fmul float %262, 2.000000e+00
  %265 = select i1 %263, float 0.000000e+00, float %264
  %266 = fcmp ogt float %44, 1.000000e+00
  %267 = select i1 %266, float %265, float %44
  %268 = fmul float %267, 2.000000e+00
  %269 = tail call float @llvm.rint.f32(float %268)
  %270 = tail call float @llvm.fmuladd.f32(float %269, float -5.000000e-01, float %267)
  %271 = fptosi float %269 to i32
  %272 = fmul float %270, %270
  %273 = tail call float @llvm.fmuladd.f32(float %272, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %274 = tail call float @llvm.fmuladd.f32(float %272, float %273, float 0x400468E6C0000000)
  %275 = tail call float @llvm.fmuladd.f32(float %272, float %274, float 0xC014ABC1C0000000)
  %276 = fmul float %270, %272
  %277 = fmul float %276, %275
  %278 = tail call float @llvm.fmuladd.f32(float %270, float 0x400921FB60000000, float %277)
  %279 = tail call float @llvm.fmuladd.f32(float %272, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %280 = tail call float @llvm.fmuladd.f32(float %272, float %279, float 0xBFF55A3B40000000)
  %281 = tail call float @llvm.fmuladd.f32(float %272, float %280, float 0x40103C1A60000000)
  %282 = tail call float @llvm.fmuladd.f32(float %272, float %281, float 0xC013BD3CC0000000)
  %283 = tail call float @llvm.fmuladd.f32(float %272, float %282, float 1.000000e+00)
  %284 = and i32 %271, 1
  %285 = icmp eq i32 %284, 0
  %286 = select i1 %285, float %278, float %283
  %287 = bitcast float %286 to i32
  %288 = shl i32 %271, 30
  %289 = and i32 %288, -2147483648
  %290 = bitcast float %43 to i32
  %291 = bitcast float %44 to i32
  %292 = xor i32 %291, %290
  %293 = xor i32 %292, %289
  %294 = xor i32 %293, %287
  %295 = bitcast i32 %294 to float
  %296 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 504)
  %297 = select i1 %296, float %295, float 0x7FF8000000000000
  %298 = fmul float %43, %297
  %299 = fmul float %298, %245
  %300 = fmul float %299, %232
  %301 = fmul float %232, %300
  %302 = fmul float %63, 0xBFF40D9320000000
  %303 = tail call float @llvm.fmuladd.f32(float %301, float %249, float %301)
  %304 = fdiv float %302, %303, !fpmath !11
  %305 = fcmp olt float %43, -4.200000e+01
  %306 = select i1 %305, float 0.000000e+00, float %304
  %307 = tail call float @llvm.amdgcn.fract.f32(float %43)
  %308 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 516)
  %309 = select i1 %308, float 0.000000e+00, float %307
  %310 = fcmp oeq float %309, 0.000000e+00
  %311 = select i1 %310, float 0x7FF8000000000000, float %306
  br label %319

312:                                              ; preds = %37
  %313 = tail call float @llvm.fmuladd.f32(float %43, float 0x3FEF6A5100000000, float 0xBFED0A1180000000)
  %314 = tail call float @llvm.fmuladd.f32(float %43, float %313, float 0x3FEFA658C0000000)
  %315 = tail call float @llvm.fmuladd.f32(float %43, float %314, float 0xBFE2788D00000000)
  %316 = fmul float %43, 4.000000e+00
  %317 = tail call float @llvm.amdgcn.rcp.f32(float %316)
  %318 = tail call float @llvm.fmuladd.f32(float %317, float 4.000000e+00, float %315)
  br label %319

319:                                              ; preds = %251, %260, %312
  %320 = phi float [ %318, %312 ], [ %259, %251 ], [ %311, %260 ]
  %321 = add nsw i32 %18, %7
  %322 = mul nsw i32 %26, %8
  %323 = add nsw i32 %321, %322
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds float, float addrspace(1)* %6, i64 %324
  store float %320, float addrspace(1)* %325, align 4, !tbaa !7
  br label %326

326:                                              ; preds = %9, %319, %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{float 2.500000e+00}
