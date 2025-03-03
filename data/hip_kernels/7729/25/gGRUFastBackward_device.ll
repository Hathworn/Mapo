; ModuleID = '../data/hip_kernels/7729/25/main.cu'
source_filename = "../data/hip_kernels/7729/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16gGRUFastBackwardPfS_S_S_PKfS1_S1_S1_S1_S1_mmb(float addrspace(1)* %0, float addrspace(1)* %1, float addrspace(1)* %2, float addrspace(1)* %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* readonly %8, float addrspace(1)* nocapture readonly %9, i64 %10, i64 %11, i1 %12) local_unnamed_addr #0 {
  %14 = icmp eq i64 %10, 0
  br i1 %14, label %38, label %15

15:                                               ; preds = %13
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = icmp eq float addrspace(1)* %8, addrspacecast (float* null to float addrspace(1)*)
  %18 = icmp eq i64 %11, 0
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %20 = trunc i64 %11 to i32
  %21 = shl i32 %20, 1
  %22 = icmp eq float addrspace(1)* %0, addrspacecast (float* null to float addrspace(1)*)
  %23 = icmp eq float addrspace(1)* %1, addrspacecast (float* null to float addrspace(1)*)
  %24 = icmp eq float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  %25 = icmp eq float addrspace(1)* %3, addrspacecast (float* null to float addrspace(1)*)
  %26 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %27 = getelementptr i8, i8 addrspace(4)* %26, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 12
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !4
  %32 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %33 = zext i16 %32 to i32
  %34 = udiv i32 %31, %33
  %35 = mul i32 %34, %33
  %36 = icmp ugt i32 %31, %35
  %37 = zext i1 %36 to i32
  br label %39

38:                                               ; preds = %335, %13
  ret void

39:                                               ; preds = %15, %335
  %40 = phi i32 [ 0, %15 ], [ %337, %335 ]
  %41 = add i32 %40, %16
  %42 = sext i32 %41 to i64
  %43 = icmp ult i64 %42, %10
  br i1 %43, label %44, label %335

44:                                               ; preds = %39
  br i1 %17, label %49, label %45

45:                                               ; preds = %44
  %46 = getelementptr inbounds float, float addrspace(1)* %8, i64 %42
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !15
  %48 = fcmp contract une float %47, 0.000000e+00
  br label %49

49:                                               ; preds = %45, %44
  %50 = phi i1 [ true, %44 ], [ %48, %45 ]
  %51 = uitofp i1 %50 to float
  %52 = mul i64 %42, %11
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = mul i64 %52, 3
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %54
  %59 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %60 = getelementptr inbounds float, float addrspace(1)* %9, i64 %52
  br i1 %18, label %335, label %61

61:                                               ; preds = %49, %331
  %62 = phi i32 [ %332, %331 ], [ 0, %49 ]
  %63 = add i32 %62, %19
  %64 = sext i32 %63 to i64
  %65 = icmp ult i64 %64, %11
  br i1 %65, label %66, label %331

66:                                               ; preds = %61
  %67 = add i32 %63, %20
  %68 = add i32 %63, %21
  %69 = getelementptr inbounds float, float addrspace(1)* %58, i64 %64
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !15
  %71 = getelementptr inbounds float, float addrspace(1)* %59, i64 %64
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !15
  %73 = fadd contract float %70, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %7, i64 %64
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !15
  %76 = fadd contract float %73, %75
  %77 = fcmp contract ult float %76, 0.000000e+00
  br i1 %77, label %95, label %78

78:                                               ; preds = %66
  %79 = fneg contract float %76
  %80 = fmul float %76, 0xBFF7154760000000
  %81 = tail call float @llvm.rint.f32(float %80)
  %82 = fcmp olt float %76, 0xC0562E4300000000
  %83 = fcmp ogt float %76, 0x4059D1DA00000000
  %84 = fneg float %80
  %85 = tail call float @llvm.fma.f32(float %79, float 0x3FF7154760000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %79, float 0x3E54AE0BE0000000, float %85)
  %87 = fsub float %80, %81
  %88 = fadd float %86, %87
  %89 = tail call float @llvm.exp2.f32(float %88)
  %90 = fptosi float %81 to i32
  %91 = tail call float @llvm.amdgcn.ldexp.f32(float %89, i32 %90)
  %92 = select i1 %83, float 0.000000e+00, float %91
  %93 = select i1 %82, float 0x7FF0000000000000, float %92
  %94 = fpext float %93 to double
  br label %111

95:                                               ; preds = %66
  %96 = fmul float %76, 0x3FF7154760000000
  %97 = tail call float @llvm.rint.f32(float %96)
  %98 = fcmp ogt float %76, 0x40562E4300000000
  %99 = fcmp olt float %76, 0xC059D1DA00000000
  %100 = fneg float %96
  %101 = tail call float @llvm.fma.f32(float %76, float 0x3FF7154760000000, float %100)
  %102 = tail call float @llvm.fma.f32(float %76, float 0x3E54AE0BE0000000, float %101)
  %103 = fsub float %96, %97
  %104 = fadd float %102, %103
  %105 = tail call float @llvm.exp2.f32(float %104)
  %106 = fptosi float %97 to i32
  %107 = tail call float @llvm.amdgcn.ldexp.f32(float %105, i32 %106)
  %108 = select i1 %99, float 0.000000e+00, float %107
  %109 = select i1 %98, float 0x7FF0000000000000, float %108
  %110 = fpext float %109 to double
  br label %111

111:                                              ; preds = %78, %95
  %112 = phi double [ %110, %95 ], [ %94, %78 ]
  %113 = phi double [ %110, %95 ], [ 1.000000e+00, %78 ]
  %114 = fadd contract double %112, 1.000000e+00
  %115 = fdiv contract double %113, %114
  %116 = fptrunc double %115 to float
  %117 = sext i32 %67 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %58, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !15
  %120 = getelementptr inbounds float, float addrspace(1)* %59, i64 %117
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !15
  %122 = fadd contract float %119, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %7, i64 %117
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !15
  %125 = fadd contract float %122, %124
  %126 = fcmp contract ult float %125, 0.000000e+00
  br i1 %126, label %144, label %127

127:                                              ; preds = %111
  %128 = fneg contract float %125
  %129 = fmul float %125, 0xBFF7154760000000
  %130 = tail call float @llvm.rint.f32(float %129)
  %131 = fcmp olt float %125, 0xC0562E4300000000
  %132 = fcmp ogt float %125, 0x4059D1DA00000000
  %133 = fneg float %129
  %134 = tail call float @llvm.fma.f32(float %128, float 0x3FF7154760000000, float %133)
  %135 = tail call float @llvm.fma.f32(float %128, float 0x3E54AE0BE0000000, float %134)
  %136 = fsub float %129, %130
  %137 = fadd float %135, %136
  %138 = tail call float @llvm.exp2.f32(float %137)
  %139 = fptosi float %130 to i32
  %140 = tail call float @llvm.amdgcn.ldexp.f32(float %138, i32 %139)
  %141 = select i1 %132, float 0.000000e+00, float %140
  %142 = select i1 %131, float 0x7FF0000000000000, float %141
  %143 = fpext float %142 to double
  br label %160

144:                                              ; preds = %111
  %145 = fmul float %125, 0x3FF7154760000000
  %146 = tail call float @llvm.rint.f32(float %145)
  %147 = fcmp ogt float %125, 0x40562E4300000000
  %148 = fcmp olt float %125, 0xC059D1DA00000000
  %149 = fneg float %145
  %150 = tail call float @llvm.fma.f32(float %125, float 0x3FF7154760000000, float %149)
  %151 = tail call float @llvm.fma.f32(float %125, float 0x3E54AE0BE0000000, float %150)
  %152 = fsub float %145, %146
  %153 = fadd float %151, %152
  %154 = tail call float @llvm.exp2.f32(float %153)
  %155 = fptosi float %146 to i32
  %156 = tail call float @llvm.amdgcn.ldexp.f32(float %154, i32 %155)
  %157 = select i1 %148, float 0.000000e+00, float %156
  %158 = select i1 %147, float 0x7FF0000000000000, float %157
  %159 = fpext float %158 to double
  br label %160

160:                                              ; preds = %127, %144
  %161 = phi double [ %159, %144 ], [ %143, %127 ]
  %162 = phi double [ %159, %144 ], [ 1.000000e+00, %127 ]
  %163 = fadd contract double %161, 1.000000e+00
  %164 = fdiv contract double %162, %163
  %165 = fptrunc double %164 to float
  %166 = sext i32 %68 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %58, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !15
  %169 = getelementptr inbounds float, float addrspace(1)* %59, i64 %166
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !15
  br i1 %12, label %171, label %207

171:                                              ; preds = %160
  %172 = getelementptr inbounds float, float addrspace(1)* %7, i64 %166
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !15
  %174 = fadd contract float %170, %173
  %175 = fmul contract float %174, %116
  %176 = fadd contract float %168, %175
  %177 = tail call float @llvm.fabs.f32(float %176)
  %178 = fcmp olt float %177, 6.250000e-01
  br i1 %178, label %179, label %187

179:                                              ; preds = %171
  %180 = fmul float %176, %176
  %181 = tail call float @llvm.fmuladd.f32(float %180, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %182 = tail call float @llvm.fmuladd.f32(float %180, float %181, float 0xBFAB8389C0000000)
  %183 = tail call float @llvm.fmuladd.f32(float %180, float %182, float 0x3FC1107040000000)
  %184 = tail call float @llvm.fmuladd.f32(float %180, float %183, float 0xBFD5555320000000)
  %185 = fmul float %177, %184
  %186 = tail call float @llvm.fmuladd.f32(float %180, float %185, float %177)
  br label %204

187:                                              ; preds = %171
  %188 = fmul float %177, 2.000000e+00
  %189 = fmul float %188, 0x3FF7154760000000
  %190 = tail call float @llvm.rint.f32(float %189)
  %191 = fcmp ogt float %188, 0x40562E4300000000
  %192 = fneg float %189
  %193 = tail call float @llvm.fma.f32(float %188, float 0x3FF7154760000000, float %192)
  %194 = tail call float @llvm.fma.f32(float %188, float 0x3E54AE0BE0000000, float %193)
  %195 = fsub float %189, %190
  %196 = fadd float %194, %195
  %197 = tail call float @llvm.exp2.f32(float %196)
  %198 = fptosi float %190 to i32
  %199 = tail call float @llvm.amdgcn.ldexp.f32(float %197, i32 %198)
  %200 = fadd float %199, 1.000000e+00
  %201 = select i1 %191, float 0x7FF0000000000000, float %200
  %202 = tail call float @llvm.amdgcn.rcp.f32(float %201)
  %203 = tail call float @llvm.fmuladd.f32(float %202, float -2.000000e+00, float 1.000000e+00)
  br label %204

204:                                              ; preds = %179, %187
  %205 = phi float [ %186, %179 ], [ %203, %187 ]
  %206 = tail call float @llvm.copysign.f32(float %205, float %176)
  br label %243

207:                                              ; preds = %160
  %208 = fmul contract float %170, %116
  %209 = fadd contract float %168, %208
  %210 = getelementptr inbounds float, float addrspace(1)* %7, i64 %166
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !15
  %212 = fadd contract float %211, %209
  %213 = tail call float @llvm.fabs.f32(float %212)
  %214 = fcmp olt float %213, 6.250000e-01
  br i1 %214, label %215, label %223

215:                                              ; preds = %207
  %216 = fmul float %212, %212
  %217 = tail call float @llvm.fmuladd.f32(float %216, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %218 = tail call float @llvm.fmuladd.f32(float %216, float %217, float 0xBFAB8389C0000000)
  %219 = tail call float @llvm.fmuladd.f32(float %216, float %218, float 0x3FC1107040000000)
  %220 = tail call float @llvm.fmuladd.f32(float %216, float %219, float 0xBFD5555320000000)
  %221 = fmul float %213, %220
  %222 = tail call float @llvm.fmuladd.f32(float %216, float %221, float %213)
  br label %240

223:                                              ; preds = %207
  %224 = fmul float %213, 2.000000e+00
  %225 = fmul float %224, 0x3FF7154760000000
  %226 = tail call float @llvm.rint.f32(float %225)
  %227 = fcmp ogt float %224, 0x40562E4300000000
  %228 = fneg float %225
  %229 = tail call float @llvm.fma.f32(float %224, float 0x3FF7154760000000, float %228)
  %230 = tail call float @llvm.fma.f32(float %224, float 0x3E54AE0BE0000000, float %229)
  %231 = fsub float %225, %226
  %232 = fadd float %230, %231
  %233 = tail call float @llvm.exp2.f32(float %232)
  %234 = fptosi float %226 to i32
  %235 = tail call float @llvm.amdgcn.ldexp.f32(float %233, i32 %234)
  %236 = fadd float %235, 1.000000e+00
  %237 = select i1 %227, float 0x7FF0000000000000, float %236
  %238 = tail call float @llvm.amdgcn.rcp.f32(float %237)
  %239 = tail call float @llvm.fmuladd.f32(float %238, float -2.000000e+00, float 1.000000e+00)
  br label %240

240:                                              ; preds = %215, %223
  %241 = phi float [ %222, %215 ], [ %239, %223 ]
  %242 = tail call float @llvm.copysign.f32(float %241, float %212)
  br label %243

243:                                              ; preds = %240, %204
  %244 = phi float [ %206, %204 ], [ %242, %240 ]
  %245 = getelementptr inbounds float, float addrspace(1)* %60, i64 %64
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !15
  %247 = fsub contract float 1.000000e+00, %165
  %248 = fmul contract float %244, %244
  %249 = fsub contract float 1.000000e+00, %248
  %250 = fmul contract float %247, %249
  br i1 %22, label %259, label %251

251:                                              ; preds = %243
  %252 = fmul contract float %51, %165
  %253 = fsub contract float %252, %51
  %254 = fadd contract float %253, 1.000000e+00
  %255 = fmul contract float %254, %246
  %256 = getelementptr inbounds float, float addrspace(1)* %53, i64 %64
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !15
  %258 = fadd contract float %255, %257
  store float %258, float addrspace(1)* %256, align 4, !tbaa !15
  br label %259

259:                                              ; preds = %251, %243
  %260 = fmul contract float %51, %116
  %261 = fsub contract float 1.000000e+00, %116
  %262 = fmul contract float %260, %261
  %263 = fmul contract float %262, %250
  %264 = fmul contract float %246, %263
  %265 = sext i32 %68 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %59, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !15
  br i1 %12, label %268, label %272

268:                                              ; preds = %259
  %269 = getelementptr inbounds float, float addrspace(1)* %7, i64 %265
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !15
  %271 = fadd contract float %267, %270
  br label %272

272:                                              ; preds = %259, %268
  %273 = phi float [ %271, %268 ], [ %267, %259 ]
  %274 = fmul contract float %264, %273
  br i1 %23, label %279, label %275

275:                                              ; preds = %272
  %276 = getelementptr inbounds float, float addrspace(1)* %55, i64 %64
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !15
  %278 = fadd contract float %274, %277
  store float %278, float addrspace(1)* %276, align 4, !tbaa !15
  br label %279

279:                                              ; preds = %275, %272
  br i1 %24, label %284, label %280

280:                                              ; preds = %279
  %281 = getelementptr inbounds float, float addrspace(1)* %56, i64 %64
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !15
  %283 = fadd contract float %274, %282
  store float %283, float addrspace(1)* %281, align 4, !tbaa !15
  br label %284

284:                                              ; preds = %280, %279
  br i1 %25, label %288, label %285

285:                                              ; preds = %284
  %286 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %287 = atomicrmw fadd float addrspace(1)* %286, float %274 syncscope("agent-one-as") monotonic, align 4
  br label %288

288:                                              ; preds = %285, %284
  %289 = fmul contract float %247, %51
  %290 = fmul contract float %289, %165
  %291 = getelementptr inbounds float, float addrspace(1)* %57, i64 %64
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !15
  %293 = fsub contract float %292, %244
  %294 = fmul contract float %290, %293
  %295 = fmul contract float %246, %294
  br i1 %23, label %300, label %296

296:                                              ; preds = %288
  %297 = getelementptr inbounds float, float addrspace(1)* %55, i64 %117
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !15
  %299 = fadd contract float %295, %298
  store float %299, float addrspace(1)* %297, align 4, !tbaa !15
  br label %300

300:                                              ; preds = %296, %288
  br i1 %24, label %305, label %301

301:                                              ; preds = %300
  %302 = getelementptr inbounds float, float addrspace(1)* %56, i64 %117
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !15
  %304 = fadd contract float %295, %303
  store float %304, float addrspace(1)* %302, align 4, !tbaa !15
  br label %305

305:                                              ; preds = %301, %300
  br i1 %25, label %309, label %306

306:                                              ; preds = %305
  %307 = getelementptr inbounds float, float addrspace(1)* %3, i64 %117
  %308 = atomicrmw fadd float addrspace(1)* %307, float %295 syncscope("agent-one-as") monotonic, align 4
  br label %309

309:                                              ; preds = %306, %305
  %310 = fmul contract float %250, %51
  %311 = fmul contract float %246, %310
  br i1 %23, label %317, label %312

312:                                              ; preds = %309
  %313 = sext i32 %68 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %55, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !15
  %316 = fadd contract float %311, %315
  store float %316, float addrspace(1)* %314, align 4, !tbaa !15
  br label %317

317:                                              ; preds = %312, %309
  br i1 %24, label %324, label %318

318:                                              ; preds = %317
  %319 = fmul contract float %311, %116
  %320 = sext i32 %68 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %56, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !15
  %323 = fadd contract float %319, %322
  store float %323, float addrspace(1)* %321, align 4, !tbaa !15
  br label %324

324:                                              ; preds = %318, %317
  br i1 %25, label %331, label %325

325:                                              ; preds = %324
  %326 = sext i32 %68 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %3, i64 %326
  %328 = select i1 %12, float %116, float 1.000000e+00
  %329 = fmul contract float %311, %328
  %330 = atomicrmw fadd float addrspace(1)* %327, float %329 syncscope("agent-one-as") monotonic, align 4
  br label %331

331:                                              ; preds = %325, %324, %61
  %332 = add i32 %62, %33
  %333 = sext i32 %332 to i64
  %334 = icmp ult i64 %333, %11
  br i1 %334, label %61, label %335, !llvm.loop !19

335:                                              ; preds = %331, %49, %39
  %336 = add i32 %34, %40
  %337 = add i32 %336, %37
  %338 = sext i32 %337 to i64
  %339 = icmp ult i64 %338, %10
  br i1 %339, label %39, label %38, !llvm.loop !21
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
