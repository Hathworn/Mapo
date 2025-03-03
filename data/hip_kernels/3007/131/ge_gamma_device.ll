; ModuleID = '../data/hip_kernels/3007/131/main.cu'
source_filename = "../data/hip_kernels/3007/131/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_gammaiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %318

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp ogt float %36, 1.562500e-02
  br i1 %37, label %38, label %304

38:                                               ; preds = %29
  %39 = fcmp olt float %35, 1.000000e+00
  br i1 %39, label %40, label %44

40:                                               ; preds = %38
  %41 = fadd float %36, 3.000000e+00
  %42 = tail call float @llvm.fmuladd.f32(float %41, float %36, float 2.000000e+00)
  %43 = fmul float %36, %42
  br label %54

44:                                               ; preds = %38
  %45 = fcmp olt float %36, 2.000000e+00
  br i1 %45, label %46, label %49

46:                                               ; preds = %44
  %47 = tail call float @llvm.fmuladd.f32(float %35, float %35, float %36)
  %48 = fadd float %36, 2.000000e+00
  br label %54

49:                                               ; preds = %44
  %50 = fcmp olt float %36, 3.000000e+00
  %51 = fadd float %36, 1.000000e+00
  %52 = select i1 %50, float %36, float 1.000000e+00
  %53 = select i1 %50, float %51, float %36
  br label %54

54:                                               ; preds = %49, %46, %40
  %55 = phi float [ %43, %40 ], [ %47, %46 ], [ %52, %49 ]
  %56 = phi float [ %41, %40 ], [ %48, %46 ], [ %53, %49 ]
  %57 = tail call float @llvm.fmuladd.f32(float %56, float 5.000000e-01, float -2.500000e-01)
  %58 = tail call float @llvm.fabs.f32(float %56)
  %59 = tail call float @llvm.amdgcn.frexp.mant.f32(float %58)
  %60 = fcmp olt float %59, 0x3FE5555560000000
  %61 = zext i1 %60 to i32
  %62 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 %61)
  %63 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %58)
  %64 = sub nsw i32 %63, %61
  %65 = fadd float %62, -1.000000e+00
  %66 = fadd float %62, 1.000000e+00
  %67 = fadd float %66, -1.000000e+00
  %68 = fsub float %62, %67
  %69 = tail call float @llvm.amdgcn.rcp.f32(float %66)
  %70 = fmul float %65, %69
  %71 = fmul float %66, %70
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %70, float %66, float %72)
  %74 = tail call float @llvm.fma.f32(float %70, float %68, float %73)
  %75 = fadd float %71, %74
  %76 = fsub float %75, %71
  %77 = fsub float %74, %76
  %78 = fsub float %65, %75
  %79 = fsub float %65, %78
  %80 = fsub float %79, %75
  %81 = fsub float %80, %77
  %82 = fadd float %78, %81
  %83 = fmul float %69, %82
  %84 = fadd float %70, %83
  %85 = fsub float %84, %70
  %86 = fsub float %83, %85
  %87 = fmul float %84, %84
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %84, float %84, float %88)
  %90 = fmul float %86, 2.000000e+00
  %91 = tail call float @llvm.fma.f32(float %84, float %90, float %89)
  %92 = fadd float %87, %91
  %93 = fsub float %92, %87
  %94 = fsub float %91, %93
  %95 = tail call float @llvm.fmuladd.f32(float %92, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %96 = tail call float @llvm.fmuladd.f32(float %92, float %95, float 0x3FD999BDE0000000)
  %97 = sitofp i32 %64 to float
  %98 = fmul float %97, 0x3FE62E4300000000
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %97, float 0x3FE62E4300000000, float %99)
  %101 = tail call float @llvm.fma.f32(float %97, float 0xBE205C6100000000, float %100)
  %102 = fadd float %98, %101
  %103 = fsub float %102, %98
  %104 = fsub float %101, %103
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 1)
  %106 = fmul float %84, %92
  %107 = fneg float %106
  %108 = tail call float @llvm.fma.f32(float %92, float %84, float %107)
  %109 = tail call float @llvm.fma.f32(float %92, float %86, float %108)
  %110 = tail call float @llvm.fma.f32(float %94, float %84, float %109)
  %111 = fadd float %106, %110
  %112 = fsub float %111, %106
  %113 = fsub float %110, %112
  %114 = fmul float %92, %96
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %92, float %96, float %115)
  %117 = tail call float @llvm.fma.f32(float %94, float %96, float %116)
  %118 = fadd float %114, %117
  %119 = fsub float %118, %114
  %120 = fsub float %117, %119
  %121 = fadd float %118, 0x3FE5555540000000
  %122 = fadd float %121, 0xBFE5555540000000
  %123 = fsub float %118, %122
  %124 = fadd float %120, 0x3E2E720200000000
  %125 = fadd float %124, %123
  %126 = fadd float %121, %125
  %127 = fsub float %126, %121
  %128 = fsub float %125, %127
  %129 = fmul float %111, %126
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %111, float %126, float %130)
  %132 = tail call float @llvm.fma.f32(float %111, float %128, float %131)
  %133 = tail call float @llvm.fma.f32(float %113, float %126, float %132)
  %134 = tail call float @llvm.amdgcn.ldexp.f32(float %86, i32 1)
  %135 = fadd float %129, %133
  %136 = fsub float %135, %129
  %137 = fsub float %133, %136
  %138 = fadd float %105, %135
  %139 = fsub float %138, %105
  %140 = fsub float %135, %139
  %141 = fadd float %134, %137
  %142 = fadd float %141, %140
  %143 = fadd float %138, %142
  %144 = fsub float %143, %138
  %145 = fsub float %142, %144
  %146 = fadd float %102, %143
  %147 = fsub float %146, %102
  %148 = fsub float %146, %147
  %149 = fsub float %102, %148
  %150 = fsub float %143, %147
  %151 = fadd float %150, %149
  %152 = fadd float %104, %145
  %153 = fsub float %152, %104
  %154 = fsub float %152, %153
  %155 = fsub float %104, %154
  %156 = fsub float %145, %153
  %157 = fadd float %156, %155
  %158 = fadd float %152, %151
  %159 = fadd float %146, %158
  %160 = fsub float %159, %146
  %161 = fsub float %158, %160
  %162 = fadd float %157, %161
  %163 = fadd float %159, %162
  %164 = fsub float %163, %159
  %165 = fsub float %162, %164
  %166 = fmul float %57, %163
  %167 = fneg float %166
  %168 = tail call float @llvm.fma.f32(float %57, float %163, float %167)
  %169 = tail call float @llvm.fma.f32(float %57, float %165, float %168)
  %170 = fadd float %166, %169
  %171 = fsub float %170, %166
  %172 = fsub float %169, %171
  %173 = tail call float @llvm.fabs.f32(float %166) #3
  %174 = fcmp oeq float %173, 0x7FF0000000000000
  %175 = select i1 %174, float %166, float %170
  %176 = tail call float @llvm.fabs.f32(float %175) #3
  %177 = fcmp oeq float %176, 0x7FF0000000000000
  %178 = select i1 %177, float 0.000000e+00, float %172
  %179 = fcmp oeq float %175, 0x40562E4300000000
  %180 = select i1 %179, float 0x3EE0000000000000, float 0.000000e+00
  %181 = fsub float %175, %180
  %182 = fadd float %180, %178
  %183 = fmul float %181, 0x3FF7154760000000
  %184 = tail call float @llvm.rint.f32(float %183)
  %185 = fcmp ogt float %181, 0x40562E4300000000
  %186 = fcmp olt float %181, 0xC059D1DA00000000
  %187 = fneg float %183
  %188 = tail call float @llvm.fma.f32(float %181, float 0x3FF7154760000000, float %187)
  %189 = tail call float @llvm.fma.f32(float %181, float 0x3E54AE0BE0000000, float %188)
  %190 = fsub float %183, %184
  %191 = fadd float %189, %190
  %192 = tail call float @llvm.exp2.f32(float %191)
  %193 = fptosi float %184 to i32
  %194 = tail call float @llvm.amdgcn.ldexp.f32(float %192, i32 %193)
  %195 = select i1 %186, float 0.000000e+00, float %194
  %196 = select i1 %185, float 0x7FF0000000000000, float %195
  %197 = tail call float @llvm.fma.f32(float %196, float %182, float %196)
  %198 = tail call float @llvm.fabs.f32(float %196) #3
  %199 = fcmp oeq float %198, 0x7FF0000000000000
  %200 = select i1 %199, float %196, float %197
  %201 = tail call float @llvm.fabs.f32(float %57)
  %202 = tail call float @llvm.fabs.f32(float %200)
  %203 = fcmp olt float %57, 0.000000e+00
  %204 = select i1 %203, float 0x7FF0000000000000, float 0.000000e+00
  %205 = select i1 %203, float 0.000000e+00, float 0x7FF0000000000000
  %206 = fcmp oeq float %56, 0.000000e+00
  %207 = select i1 %206, float %204, float %202
  %208 = fcmp oeq float %58, 0x7FF0000000000000
  %209 = select i1 %208, float %205, float %207
  %210 = fcmp oeq float %201, 0x7FF0000000000000
  %211 = fcmp olt float %58, 1.000000e+00
  %212 = select i1 %211, float %204, float %205
  %213 = select i1 %210, float %212, float %209
  %214 = fcmp oeq float %57, 0.000000e+00
  %215 = select i1 %206, i1 true, i1 %208
  %216 = select i1 %215, float 0x7FF8000000000000, float 1.000000e+00
  %217 = select i1 %214, float %216, float %213
  %218 = fcmp oeq float %56, 1.000000e+00
  %219 = select i1 %210, float 0x7FF8000000000000, float 1.000000e+00
  %220 = select i1 %218, float %219, float %217
  %221 = fcmp ult float %56, 0.000000e+00
  %222 = fcmp uno float %57, 0.000000e+00
  %223 = or i1 %221, %222
  %224 = select i1 %223, float 0x7FF8000000000000, float %220
  %225 = fneg float %56
  %226 = fmul float %56, 0xBFF7154760000000
  %227 = tail call float @llvm.rint.f32(float %226)
  %228 = fcmp ogt float %56, 0x4059D1DA00000000
  %229 = fneg float %226
  %230 = tail call float @llvm.fma.f32(float %225, float 0x3FF7154760000000, float %229)
  %231 = tail call float @llvm.fma.f32(float %225, float 0x3E54AE0BE0000000, float %230)
  %232 = fsub float %226, %227
  %233 = fadd float %231, %232
  %234 = tail call float @llvm.exp2.f32(float %233)
  %235 = fptosi float %227 to i32
  %236 = tail call float @llvm.amdgcn.ldexp.f32(float %234, i32 %235)
  %237 = select i1 %228, float 0.000000e+00, float %236
  %238 = tail call float @llvm.amdgcn.rcp.f32(float %56)
  %239 = tail call float @llvm.fmuladd.f32(float %238, float 0xBF65F72680000000, float 0x3F6C71C720000000)
  %240 = tail call float @llvm.fmuladd.f32(float %238, float %239, float 0x3FB5555560000000)
  %241 = fmul float %238, %240
  %242 = fcmp ogt float %35, 0.000000e+00
  br i1 %242, label %243, label %252

243:                                              ; preds = %54
  %244 = fmul float %237, 0x40040D9320000000
  %245 = fmul float %244, %224
  %246 = fmul float %224, %245
  %247 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %248 = fmul float %247, %246
  %249 = tail call float @llvm.fmuladd.f32(float %248, float %241, float %248)
  %250 = fcmp ogt float %35, 0x40418521E0000000
  %251 = select i1 %250, float 0x7FF0000000000000, float %249
  br label %311

252:                                              ; preds = %54
  %253 = fmul float %36, 5.000000e-01
  %254 = tail call float @llvm.amdgcn.fract.f32(float %253)
  %255 = tail call i1 @llvm.amdgcn.class.f32(float %253, i32 516)
  %256 = fmul float %254, 2.000000e+00
  %257 = select i1 %255, float 0.000000e+00, float %256
  %258 = fcmp ogt float %36, 1.000000e+00
  %259 = select i1 %258, float %257, float %36
  %260 = fmul float %259, 2.000000e+00
  %261 = tail call float @llvm.rint.f32(float %260)
  %262 = tail call float @llvm.fmuladd.f32(float %261, float -5.000000e-01, float %259)
  %263 = fptosi float %261 to i32
  %264 = fmul float %262, %262
  %265 = tail call float @llvm.fmuladd.f32(float %264, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %266 = tail call float @llvm.fmuladd.f32(float %264, float %265, float 0x400468E6C0000000)
  %267 = tail call float @llvm.fmuladd.f32(float %264, float %266, float 0xC014ABC1C0000000)
  %268 = fmul float %262, %264
  %269 = fmul float %268, %267
  %270 = tail call float @llvm.fmuladd.f32(float %262, float 0x400921FB60000000, float %269)
  %271 = tail call float @llvm.fmuladd.f32(float %264, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %272 = tail call float @llvm.fmuladd.f32(float %264, float %271, float 0xBFF55A3B40000000)
  %273 = tail call float @llvm.fmuladd.f32(float %264, float %272, float 0x40103C1A60000000)
  %274 = tail call float @llvm.fmuladd.f32(float %264, float %273, float 0xC013BD3CC0000000)
  %275 = tail call float @llvm.fmuladd.f32(float %264, float %274, float 1.000000e+00)
  %276 = and i32 %263, 1
  %277 = icmp eq i32 %276, 0
  %278 = select i1 %277, float %270, float %275
  %279 = bitcast float %278 to i32
  %280 = shl i32 %263, 30
  %281 = and i32 %280, -2147483648
  %282 = bitcast float %35 to i32
  %283 = bitcast float %36 to i32
  %284 = xor i32 %283, %282
  %285 = xor i32 %284, %281
  %286 = xor i32 %285, %279
  %287 = bitcast i32 %286 to float
  %288 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 504)
  %289 = select i1 %288, float %287, float 0x7FF8000000000000
  %290 = fmul float %35, %289
  %291 = fmul float %290, %237
  %292 = fmul float %291, %224
  %293 = fmul float %224, %292
  %294 = fmul float %55, 0xBFF40D9320000000
  %295 = tail call float @llvm.fmuladd.f32(float %293, float %241, float %293)
  %296 = fdiv float %294, %295, !fpmath !11
  %297 = fcmp olt float %35, -4.200000e+01
  %298 = select i1 %297, float 0.000000e+00, float %296
  %299 = tail call float @llvm.amdgcn.fract.f32(float %35)
  %300 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 516)
  %301 = select i1 %300, float 0.000000e+00, float %299
  %302 = fcmp oeq float %301, 0.000000e+00
  %303 = select i1 %302, float 0x7FF8000000000000, float %298
  br label %311

304:                                              ; preds = %29
  %305 = tail call float @llvm.fmuladd.f32(float %35, float 0x3FEF6A5100000000, float 0xBFED0A1180000000)
  %306 = tail call float @llvm.fmuladd.f32(float %35, float %305, float 0x3FEFA658C0000000)
  %307 = tail call float @llvm.fmuladd.f32(float %35, float %306, float 0xBFE2788D00000000)
  %308 = fmul float %35, 4.000000e+00
  %309 = tail call float @llvm.amdgcn.rcp.f32(float %308)
  %310 = tail call float @llvm.fmuladd.f32(float %309, float 4.000000e+00, float %307)
  br label %311

311:                                              ; preds = %243, %252, %304
  %312 = phi float [ %310, %304 ], [ %251, %243 ], [ %303, %252 ]
  %313 = add nsw i32 %17, %6
  %314 = mul nsw i32 %25, %7
  %315 = add nsw i32 %313, %314
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %5, i64 %316
  store float %312, float addrspace(1)* %317, align 4, !tbaa !7
  br label %318

318:                                              ; preds = %311, %8
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
