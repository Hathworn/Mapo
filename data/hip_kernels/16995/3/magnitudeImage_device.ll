; ModuleID = '../data/hip_kernels/16995/3/main.cu'
source_filename = "../data/hip_kernels/16995/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14magnitudeImagePfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %361

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %3
  %28 = add nsw i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = tail call float @llvm.fabs.f32(float %31)
  %33 = tail call float @llvm.amdgcn.frexp.mant.f32(float %32)
  %34 = fcmp olt float %33, 0x3FE5555560000000
  %35 = zext i1 %34 to i32
  %36 = tail call float @llvm.amdgcn.ldexp.f32(float %33, i32 %35)
  %37 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %32)
  %38 = sub nsw i32 %37, %35
  %39 = fadd float %36, -1.000000e+00
  %40 = fadd float %36, 1.000000e+00
  %41 = fadd float %40, -1.000000e+00
  %42 = fsub float %36, %41
  %43 = tail call float @llvm.amdgcn.rcp.f32(float %40)
  %44 = fmul float %39, %43
  %45 = fmul float %40, %44
  %46 = fneg float %45
  %47 = tail call float @llvm.fma.f32(float %44, float %40, float %46)
  %48 = tail call float @llvm.fma.f32(float %44, float %42, float %47)
  %49 = fadd float %45, %48
  %50 = fsub float %49, %45
  %51 = fsub float %48, %50
  %52 = fsub float %39, %49
  %53 = fsub float %39, %52
  %54 = fsub float %53, %49
  %55 = fsub float %54, %51
  %56 = fadd float %52, %55
  %57 = fmul float %43, %56
  %58 = fadd float %44, %57
  %59 = fsub float %58, %44
  %60 = fsub float %57, %59
  %61 = fmul float %58, %58
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %58, float %58, float %62)
  %64 = fmul float %60, 2.000000e+00
  %65 = tail call float @llvm.fma.f32(float %58, float %64, float %63)
  %66 = fadd float %61, %65
  %67 = fsub float %66, %61
  %68 = fsub float %65, %67
  %69 = tail call float @llvm.fmuladd.f32(float %66, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %70 = tail call float @llvm.fmuladd.f32(float %66, float %69, float 0x3FD999BDE0000000)
  %71 = sitofp i32 %38 to float
  %72 = fmul float %71, 0x3FE62E4300000000
  %73 = fneg float %72
  %74 = tail call float @llvm.fma.f32(float %71, float 0x3FE62E4300000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %71, float 0xBE205C6100000000, float %74)
  %76 = fadd float %72, %75
  %77 = fsub float %76, %72
  %78 = fsub float %75, %77
  %79 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 1)
  %80 = fmul float %58, %66
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %66, float %58, float %81)
  %83 = tail call float @llvm.fma.f32(float %66, float %60, float %82)
  %84 = tail call float @llvm.fma.f32(float %68, float %58, float %83)
  %85 = fadd float %80, %84
  %86 = fsub float %85, %80
  %87 = fsub float %84, %86
  %88 = fmul float %66, %70
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %66, float %70, float %89)
  %91 = tail call float @llvm.fma.f32(float %68, float %70, float %90)
  %92 = fadd float %88, %91
  %93 = fsub float %92, %88
  %94 = fsub float %91, %93
  %95 = fadd float %92, 0x3FE5555540000000
  %96 = fadd float %95, 0xBFE5555540000000
  %97 = fsub float %92, %96
  %98 = fadd float %94, 0x3E2E720200000000
  %99 = fadd float %98, %97
  %100 = fadd float %95, %99
  %101 = fsub float %100, %95
  %102 = fsub float %99, %101
  %103 = fmul float %85, %100
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %85, float %100, float %104)
  %106 = tail call float @llvm.fma.f32(float %85, float %102, float %105)
  %107 = tail call float @llvm.fma.f32(float %87, float %100, float %106)
  %108 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 1)
  %109 = fadd float %103, %107
  %110 = fsub float %109, %103
  %111 = fsub float %107, %110
  %112 = fadd float %79, %109
  %113 = fsub float %112, %79
  %114 = fsub float %109, %113
  %115 = fadd float %108, %111
  %116 = fadd float %115, %114
  %117 = fadd float %112, %116
  %118 = fsub float %117, %112
  %119 = fsub float %116, %118
  %120 = fadd float %76, %117
  %121 = fsub float %120, %76
  %122 = fsub float %120, %121
  %123 = fsub float %76, %122
  %124 = fsub float %117, %121
  %125 = fadd float %124, %123
  %126 = fadd float %78, %119
  %127 = fsub float %126, %78
  %128 = fsub float %126, %127
  %129 = fsub float %78, %128
  %130 = fsub float %119, %127
  %131 = fadd float %130, %129
  %132 = fadd float %126, %125
  %133 = fadd float %120, %132
  %134 = fsub float %133, %120
  %135 = fsub float %132, %134
  %136 = fadd float %131, %135
  %137 = fadd float %133, %136
  %138 = fsub float %137, %133
  %139 = fsub float %136, %138
  %140 = fmul float %137, 2.000000e+00
  %141 = fneg float %140
  %142 = tail call float @llvm.fma.f32(float %137, float 2.000000e+00, float %141)
  %143 = tail call float @llvm.fma.f32(float %139, float 2.000000e+00, float %142)
  %144 = fadd float %140, %143
  %145 = fsub float %144, %140
  %146 = fsub float %143, %145
  %147 = tail call float @llvm.fabs.f32(float %140) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float %140, float %144
  %150 = tail call float @llvm.fabs.f32(float %149) #3
  %151 = fcmp oeq float %150, 0x7FF0000000000000
  %152 = select i1 %151, float 0.000000e+00, float %146
  %153 = fcmp oeq float %149, 0x40562E4300000000
  %154 = select i1 %153, float 0x3EE0000000000000, float 0.000000e+00
  %155 = fsub float %149, %154
  %156 = fadd float %154, %152
  %157 = fmul float %155, 0x3FF7154760000000
  %158 = tail call float @llvm.rint.f32(float %157)
  %159 = fcmp ogt float %155, 0x40562E4300000000
  %160 = fcmp olt float %155, 0xC059D1DA00000000
  %161 = fneg float %157
  %162 = tail call float @llvm.fma.f32(float %155, float 0x3FF7154760000000, float %161)
  %163 = tail call float @llvm.fma.f32(float %155, float 0x3E54AE0BE0000000, float %162)
  %164 = fsub float %157, %158
  %165 = fadd float %163, %164
  %166 = tail call float @llvm.exp2.f32(float %165)
  %167 = fptosi float %158 to i32
  %168 = tail call float @llvm.amdgcn.ldexp.f32(float %166, i32 %167)
  %169 = select i1 %160, float 0.000000e+00, float %168
  %170 = select i1 %159, float 0x7FF0000000000000, float %169
  %171 = tail call float @llvm.fma.f32(float %170, float %156, float %170)
  %172 = tail call float @llvm.fabs.f32(float %170) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float %170, float %171
  %175 = tail call float @llvm.fabs.f32(float %174)
  %176 = fcmp oeq float %32, 0x7FF0000000000000
  %177 = fcmp oeq float %31, 0.000000e+00
  %178 = select i1 %176, float 0x7FF0000000000000, float %175
  %179 = select i1 %177, float 0.000000e+00, float %178
  %180 = fcmp uno float %31, 0.000000e+00
  %181 = select i1 %180, float 0x7FF8000000000000, float %179
  %182 = fcmp oeq float %31, 1.000000e+00
  %183 = select i1 %182, float 1.000000e+00, float %181
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7, !amdgpu.noclobber !6
  %186 = tail call float @llvm.fabs.f32(float %185)
  %187 = tail call float @llvm.amdgcn.frexp.mant.f32(float %186)
  %188 = fcmp olt float %187, 0x3FE5555560000000
  %189 = zext i1 %188 to i32
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %187, i32 %189)
  %191 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %186)
  %192 = sub nsw i32 %191, %189
  %193 = fadd float %190, -1.000000e+00
  %194 = fadd float %190, 1.000000e+00
  %195 = fadd float %194, -1.000000e+00
  %196 = fsub float %190, %195
  %197 = tail call float @llvm.amdgcn.rcp.f32(float %194)
  %198 = fmul float %193, %197
  %199 = fmul float %194, %198
  %200 = fneg float %199
  %201 = tail call float @llvm.fma.f32(float %198, float %194, float %200)
  %202 = tail call float @llvm.fma.f32(float %198, float %196, float %201)
  %203 = fadd float %199, %202
  %204 = fsub float %203, %199
  %205 = fsub float %202, %204
  %206 = fsub float %193, %203
  %207 = fsub float %193, %206
  %208 = fsub float %207, %203
  %209 = fsub float %208, %205
  %210 = fadd float %206, %209
  %211 = fmul float %197, %210
  %212 = fadd float %198, %211
  %213 = fsub float %212, %198
  %214 = fsub float %211, %213
  %215 = fmul float %212, %212
  %216 = fneg float %215
  %217 = tail call float @llvm.fma.f32(float %212, float %212, float %216)
  %218 = fmul float %214, 2.000000e+00
  %219 = tail call float @llvm.fma.f32(float %212, float %218, float %217)
  %220 = fadd float %215, %219
  %221 = fsub float %220, %215
  %222 = fsub float %219, %221
  %223 = tail call float @llvm.fmuladd.f32(float %220, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %224 = tail call float @llvm.fmuladd.f32(float %220, float %223, float 0x3FD999BDE0000000)
  %225 = sitofp i32 %192 to float
  %226 = fmul float %225, 0x3FE62E4300000000
  %227 = fneg float %226
  %228 = tail call float @llvm.fma.f32(float %225, float 0x3FE62E4300000000, float %227)
  %229 = tail call float @llvm.fma.f32(float %225, float 0xBE205C6100000000, float %228)
  %230 = fadd float %226, %229
  %231 = fsub float %230, %226
  %232 = fsub float %229, %231
  %233 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 1)
  %234 = fmul float %212, %220
  %235 = fneg float %234
  %236 = tail call float @llvm.fma.f32(float %220, float %212, float %235)
  %237 = tail call float @llvm.fma.f32(float %220, float %214, float %236)
  %238 = tail call float @llvm.fma.f32(float %222, float %212, float %237)
  %239 = fadd float %234, %238
  %240 = fsub float %239, %234
  %241 = fsub float %238, %240
  %242 = fmul float %220, %224
  %243 = fneg float %242
  %244 = tail call float @llvm.fma.f32(float %220, float %224, float %243)
  %245 = tail call float @llvm.fma.f32(float %222, float %224, float %244)
  %246 = fadd float %242, %245
  %247 = fsub float %246, %242
  %248 = fsub float %245, %247
  %249 = fadd float %246, 0x3FE5555540000000
  %250 = fadd float %249, 0xBFE5555540000000
  %251 = fsub float %246, %250
  %252 = fadd float %248, 0x3E2E720200000000
  %253 = fadd float %252, %251
  %254 = fadd float %249, %253
  %255 = fsub float %254, %249
  %256 = fsub float %253, %255
  %257 = fmul float %239, %254
  %258 = fneg float %257
  %259 = tail call float @llvm.fma.f32(float %239, float %254, float %258)
  %260 = tail call float @llvm.fma.f32(float %239, float %256, float %259)
  %261 = tail call float @llvm.fma.f32(float %241, float %254, float %260)
  %262 = tail call float @llvm.amdgcn.ldexp.f32(float %214, i32 1)
  %263 = fadd float %257, %261
  %264 = fsub float %263, %257
  %265 = fsub float %261, %264
  %266 = fadd float %233, %263
  %267 = fsub float %266, %233
  %268 = fsub float %263, %267
  %269 = fadd float %262, %265
  %270 = fadd float %269, %268
  %271 = fadd float %266, %270
  %272 = fsub float %271, %266
  %273 = fsub float %270, %272
  %274 = fadd float %230, %271
  %275 = fsub float %274, %230
  %276 = fsub float %274, %275
  %277 = fsub float %230, %276
  %278 = fsub float %271, %275
  %279 = fadd float %278, %277
  %280 = fadd float %232, %273
  %281 = fsub float %280, %232
  %282 = fsub float %280, %281
  %283 = fsub float %232, %282
  %284 = fsub float %273, %281
  %285 = fadd float %284, %283
  %286 = fadd float %280, %279
  %287 = fadd float %274, %286
  %288 = fsub float %287, %274
  %289 = fsub float %286, %288
  %290 = fadd float %285, %289
  %291 = fadd float %287, %290
  %292 = fsub float %291, %287
  %293 = fsub float %290, %292
  %294 = fmul float %291, 2.000000e+00
  %295 = fneg float %294
  %296 = tail call float @llvm.fma.f32(float %291, float 2.000000e+00, float %295)
  %297 = tail call float @llvm.fma.f32(float %293, float 2.000000e+00, float %296)
  %298 = fadd float %294, %297
  %299 = fsub float %298, %294
  %300 = fsub float %297, %299
  %301 = tail call float @llvm.fabs.f32(float %294) #3
  %302 = fcmp oeq float %301, 0x7FF0000000000000
  %303 = select i1 %302, float %294, float %298
  %304 = tail call float @llvm.fabs.f32(float %303) #3
  %305 = fcmp oeq float %304, 0x7FF0000000000000
  %306 = select i1 %305, float 0.000000e+00, float %300
  %307 = fcmp oeq float %303, 0x40562E4300000000
  %308 = select i1 %307, float 0x3EE0000000000000, float 0.000000e+00
  %309 = fsub float %303, %308
  %310 = fadd float %308, %306
  %311 = fmul float %309, 0x3FF7154760000000
  %312 = tail call float @llvm.rint.f32(float %311)
  %313 = fcmp ogt float %309, 0x40562E4300000000
  %314 = fcmp olt float %309, 0xC059D1DA00000000
  %315 = fneg float %311
  %316 = tail call float @llvm.fma.f32(float %309, float 0x3FF7154760000000, float %315)
  %317 = tail call float @llvm.fma.f32(float %309, float 0x3E54AE0BE0000000, float %316)
  %318 = fsub float %311, %312
  %319 = fadd float %317, %318
  %320 = tail call float @llvm.exp2.f32(float %319)
  %321 = fptosi float %312 to i32
  %322 = tail call float @llvm.amdgcn.ldexp.f32(float %320, i32 %321)
  %323 = select i1 %314, float 0.000000e+00, float %322
  %324 = select i1 %313, float 0x7FF0000000000000, float %323
  %325 = tail call float @llvm.fma.f32(float %324, float %310, float %324)
  %326 = tail call float @llvm.fabs.f32(float %324) #3
  %327 = fcmp oeq float %326, 0x7FF0000000000000
  %328 = select i1 %327, float %324, float %325
  %329 = tail call float @llvm.fabs.f32(float %328)
  %330 = fcmp oeq float %186, 0x7FF0000000000000
  %331 = fcmp oeq float %185, 0.000000e+00
  %332 = select i1 %330, float 0x7FF0000000000000, float %329
  %333 = select i1 %331, float 0.000000e+00, float %332
  %334 = fcmp uno float %185, 0.000000e+00
  %335 = select i1 %334, float 0x7FF8000000000000, float %333
  %336 = fcmp oeq float %185, 1.000000e+00
  %337 = select i1 %336, float 1.000000e+00, float %335
  %338 = fadd contract float %183, %337
  %339 = fcmp olt float %338, 0x39F0000000000000
  %340 = select i1 %339, float 0x41F0000000000000, float 1.000000e+00
  %341 = fmul float %338, %340
  %342 = tail call float @llvm.sqrt.f32(float %341)
  %343 = bitcast float %342 to i32
  %344 = add nsw i32 %343, -1
  %345 = bitcast i32 %344 to float
  %346 = add nsw i32 %343, 1
  %347 = bitcast i32 %346 to float
  %348 = tail call i1 @llvm.amdgcn.class.f32(float %341, i32 608)
  %349 = select i1 %339, float 0x3EF0000000000000, float 1.000000e+00
  %350 = fneg float %347
  %351 = tail call float @llvm.fma.f32(float %350, float %342, float %341)
  %352 = fcmp ogt float %351, 0.000000e+00
  %353 = fneg float %345
  %354 = tail call float @llvm.fma.f32(float %353, float %342, float %341)
  %355 = fcmp ole float %354, 0.000000e+00
  %356 = select i1 %355, float %345, float %342
  %357 = select i1 %352, float %347, float %356
  %358 = fmul float %349, %357
  %359 = select i1 %348, float %341, float %358
  %360 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  store float %359, float addrspace(1)* %360, align 4, !tbaa !7
  br label %361

361:                                              ; preds = %26, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
