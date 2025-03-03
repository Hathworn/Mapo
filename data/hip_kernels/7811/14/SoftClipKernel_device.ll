; ModuleID = '../data/hip_kernels/7811/14/main.cu'
source_filename = "../data/hip_kernels/7811/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14SoftClipKernelPKfPfiiffffffiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4, float %5, float %6, float %7, float %8, float %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %22, %2
  %32 = icmp slt i32 %30, %3
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %1776

34:                                               ; preds = %13
  %35 = mul nsw i32 %30, %2
  %36 = add nsw i32 %35, %22
  %37 = shl nsw i32 %36, 2
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = add nuw nsw i32 %37, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nuw nsw i32 %37, 2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract float %40, 1.023000e+03
  %50 = fadd contract float %49, -6.850000e+02
  %51 = fdiv contract float %50, 3.000000e+02
  %52 = fmul float %51, 0x40026BB1C0000000
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %51, float 0x40026BB1C0000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %51, float 0xBE6129FAE0000000, float %54)
  %56 = fadd float %52, %55
  %57 = fsub float %56, %52
  %58 = fsub float %55, %57
  %59 = tail call float @llvm.fabs.f32(float %52) #3
  %60 = fcmp oeq float %59, 0x7FF0000000000000
  %61 = select i1 %60, float %52, float %56
  %62 = tail call float @llvm.fabs.f32(float %61) #3
  %63 = fcmp oeq float %62, 0x7FF0000000000000
  %64 = select i1 %63, float 0.000000e+00, float %58
  %65 = fcmp oeq float %61, 0x40562E4300000000
  %66 = select i1 %65, float 0x3EE0000000000000, float 0.000000e+00
  %67 = fsub float %61, %66
  %68 = fadd float %66, %64
  %69 = fmul float %67, 0x3FF7154760000000
  %70 = tail call float @llvm.rint.f32(float %69)
  %71 = fcmp ogt float %67, 0x40562E4300000000
  %72 = fcmp olt float %67, 0xC059D1DA00000000
  %73 = fneg float %69
  %74 = tail call float @llvm.fma.f32(float %67, float 0x3FF7154760000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %67, float 0x3E54AE0BE0000000, float %74)
  %76 = fsub float %69, %70
  %77 = fadd float %75, %76
  %78 = tail call float @llvm.exp2.f32(float %77)
  %79 = fptosi float %70 to i32
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %79)
  %81 = select i1 %72, float 0.000000e+00, float %80
  %82 = select i1 %71, float 0x7FF0000000000000, float %81
  %83 = tail call float @llvm.fma.f32(float %82, float %68, float %82)
  %84 = tail call float @llvm.fabs.f32(float %82) #3
  %85 = fcmp oeq float %84, 0x7FF0000000000000
  %86 = select i1 %85, float %82, float %83
  %87 = tail call float @llvm.fabs.f32(float %51)
  %88 = tail call float @llvm.fabs.f32(float %86)
  %89 = fcmp oeq float %87, 0x7FF0000000000000
  %90 = bitcast float %51 to i32
  %91 = icmp sgt i32 %90, -1
  %92 = select i1 %91, float 0x7FF0000000000000, float 0.000000e+00
  %93 = select i1 %89, float %92, float %88
  %94 = fcmp uno float %51, 0.000000e+00
  %95 = fcmp oeq float %51, 0.000000e+00
  %96 = fadd contract float %93, 0xBF861E4F80000000
  %97 = fdiv contract float %96, 0x3FEFA786C0000000
  %98 = select i1 %94, float 0x7FF8000000000000, float %97
  %99 = select i1 %95, float 1.000000e+00, float %98
  %100 = fmul contract float %44, 1.023000e+03
  %101 = fadd contract float %100, -6.850000e+02
  %102 = fdiv contract float %101, 3.000000e+02
  %103 = fmul float %102, 0x40026BB1C0000000
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %102, float 0x40026BB1C0000000, float %104)
  %106 = tail call float @llvm.fma.f32(float %102, float 0xBE6129FAE0000000, float %105)
  %107 = fadd float %103, %106
  %108 = fsub float %107, %103
  %109 = fsub float %106, %108
  %110 = tail call float @llvm.fabs.f32(float %103) #3
  %111 = fcmp oeq float %110, 0x7FF0000000000000
  %112 = select i1 %111, float %103, float %107
  %113 = tail call float @llvm.fabs.f32(float %112) #3
  %114 = fcmp oeq float %113, 0x7FF0000000000000
  %115 = select i1 %114, float 0.000000e+00, float %109
  %116 = fcmp oeq float %112, 0x40562E4300000000
  %117 = select i1 %116, float 0x3EE0000000000000, float 0.000000e+00
  %118 = fsub float %112, %117
  %119 = fadd float %117, %115
  %120 = fmul float %118, 0x3FF7154760000000
  %121 = tail call float @llvm.rint.f32(float %120)
  %122 = fcmp ogt float %118, 0x40562E4300000000
  %123 = fcmp olt float %118, 0xC059D1DA00000000
  %124 = fneg float %120
  %125 = tail call float @llvm.fma.f32(float %118, float 0x3FF7154760000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %118, float 0x3E54AE0BE0000000, float %125)
  %127 = fsub float %120, %121
  %128 = fadd float %126, %127
  %129 = tail call float @llvm.exp2.f32(float %128)
  %130 = fptosi float %121 to i32
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %129, i32 %130)
  %132 = select i1 %123, float 0.000000e+00, float %131
  %133 = select i1 %122, float 0x7FF0000000000000, float %132
  %134 = tail call float @llvm.fma.f32(float %133, float %119, float %133)
  %135 = tail call float @llvm.fabs.f32(float %133) #3
  %136 = fcmp oeq float %135, 0x7FF0000000000000
  %137 = select i1 %136, float %133, float %134
  %138 = tail call float @llvm.fabs.f32(float %102)
  %139 = tail call float @llvm.fabs.f32(float %137)
  %140 = fcmp oeq float %138, 0x7FF0000000000000
  %141 = bitcast float %102 to i32
  %142 = icmp sgt i32 %141, -1
  %143 = select i1 %142, float 0x7FF0000000000000, float 0.000000e+00
  %144 = select i1 %140, float %143, float %139
  %145 = fcmp uno float %102, 0.000000e+00
  %146 = fcmp oeq float %102, 0.000000e+00
  %147 = fadd contract float %144, 0xBF861E4F80000000
  %148 = fdiv contract float %147, 0x3FEFA786C0000000
  %149 = select i1 %145, float 0x7FF8000000000000, float %148
  %150 = select i1 %146, float 1.000000e+00, float %149
  %151 = fmul contract float %48, 1.023000e+03
  %152 = fadd contract float %151, -6.850000e+02
  %153 = fdiv contract float %152, 3.000000e+02
  %154 = fmul float %153, 0x40026BB1C0000000
  %155 = fneg float %154
  %156 = tail call float @llvm.fma.f32(float %153, float 0x40026BB1C0000000, float %155)
  %157 = tail call float @llvm.fma.f32(float %153, float 0xBE6129FAE0000000, float %156)
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %154) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %154, float %158
  %164 = tail call float @llvm.fabs.f32(float %163) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float 0.000000e+00, float %160
  %167 = fcmp oeq float %163, 0x40562E4300000000
  %168 = select i1 %167, float 0x3EE0000000000000, float 0.000000e+00
  %169 = fsub float %163, %168
  %170 = fadd float %168, %166
  %171 = fmul float %169, 0x3FF7154760000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = fcmp ogt float %169, 0x40562E4300000000
  %174 = fcmp olt float %169, 0xC059D1DA00000000
  %175 = fneg float %171
  %176 = tail call float @llvm.fma.f32(float %169, float 0x3FF7154760000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %169, float 0x3E54AE0BE0000000, float %176)
  %178 = fsub float %171, %172
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.exp2.f32(float %179)
  %181 = fptosi float %172 to i32
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %180, i32 %181)
  %183 = select i1 %174, float 0.000000e+00, float %182
  %184 = select i1 %173, float 0x7FF0000000000000, float %183
  %185 = tail call float @llvm.fma.f32(float %184, float %170, float %184)
  %186 = tail call float @llvm.fabs.f32(float %184) #3
  %187 = fcmp oeq float %186, 0x7FF0000000000000
  %188 = select i1 %187, float %184, float %185
  %189 = tail call float @llvm.fabs.f32(float %153)
  %190 = tail call float @llvm.fabs.f32(float %188)
  %191 = fcmp oeq float %189, 0x7FF0000000000000
  %192 = bitcast float %153 to i32
  %193 = icmp sgt i32 %192, -1
  %194 = select i1 %193, float 0x7FF0000000000000, float 0.000000e+00
  %195 = select i1 %191, float %194, float %190
  %196 = fcmp uno float %153, 0.000000e+00
  %197 = fcmp oeq float %153, 0.000000e+00
  %198 = fadd contract float %195, 0xBF861E4F80000000
  %199 = fdiv contract float %198, 0x3FEFA786C0000000
  %200 = select i1 %196, float 0x7FF8000000000000, float %199
  %201 = select i1 %197, float 1.000000e+00, float %200
  %202 = fcmp contract ogt float %40, 0x3FC3280000000000
  br i1 %202, label %203, label %254

203:                                              ; preds = %34
  %204 = fadd contract float %40, 0xBFD8ACA360000000
  %205 = fdiv contract float %204, 0x3FCFA3E8A0000000
  %206 = fmul float %205, 0x40026BB1C0000000
  %207 = fneg float %206
  %208 = tail call float @llvm.fma.f32(float %205, float 0x40026BB1C0000000, float %207)
  %209 = tail call float @llvm.fma.f32(float %205, float 0xBE6129FAE0000000, float %208)
  %210 = fadd float %206, %209
  %211 = fsub float %210, %206
  %212 = fsub float %209, %211
  %213 = tail call float @llvm.fabs.f32(float %206) #3
  %214 = fcmp oeq float %213, 0x7FF0000000000000
  %215 = select i1 %214, float %206, float %210
  %216 = tail call float @llvm.fabs.f32(float %215) #3
  %217 = fcmp oeq float %216, 0x7FF0000000000000
  %218 = select i1 %217, float 0.000000e+00, float %212
  %219 = fcmp oeq float %215, 0x40562E4300000000
  %220 = select i1 %219, float 0x3EE0000000000000, float 0.000000e+00
  %221 = fsub float %215, %220
  %222 = fadd float %220, %218
  %223 = fmul float %221, 0x3FF7154760000000
  %224 = tail call float @llvm.rint.f32(float %223)
  %225 = fcmp ogt float %221, 0x40562E4300000000
  %226 = fcmp olt float %221, 0xC059D1DA00000000
  %227 = fneg float %223
  %228 = tail call float @llvm.fma.f32(float %221, float 0x3FF7154760000000, float %227)
  %229 = tail call float @llvm.fma.f32(float %221, float 0x3E54AE0BE0000000, float %228)
  %230 = fsub float %223, %224
  %231 = fadd float %229, %230
  %232 = tail call float @llvm.exp2.f32(float %231)
  %233 = fptosi float %224 to i32
  %234 = tail call float @llvm.amdgcn.ldexp.f32(float %232, i32 %233)
  %235 = select i1 %226, float 0.000000e+00, float %234
  %236 = select i1 %225, float 0x7FF0000000000000, float %235
  %237 = tail call float @llvm.fma.f32(float %236, float %222, float %236)
  %238 = tail call float @llvm.fabs.f32(float %236) #3
  %239 = fcmp oeq float %238, 0x7FF0000000000000
  %240 = select i1 %239, float %236, float %237
  %241 = tail call float @llvm.fabs.f32(float %205)
  %242 = tail call float @llvm.fabs.f32(float %240)
  %243 = fcmp oeq float %241, 0x7FF0000000000000
  %244 = bitcast float %205 to i32
  %245 = icmp sgt i32 %244, -1
  %246 = select i1 %245, float 0x7FF0000000000000, float 0.000000e+00
  %247 = select i1 %243, float %246, float %242
  %248 = fcmp uno float %205, 0.000000e+00
  %249 = fcmp oeq float %205, 0.000000e+00
  %250 = fadd contract float %247, 0xBFAAC36540000000
  %251 = fdiv contract float %250, 0x401638E3A0000000
  %252 = select i1 %248, float 0x7FF8000000000000, float %251
  %253 = select i1 %249, float 0x3FC5D5ED40000000, float %252
  br label %257

254:                                              ; preds = %34
  %255 = fadd contract float %40, 0xBFB7C254A0000000
  %256 = fdiv contract float %255, 0x4015787A80000000
  br label %257

257:                                              ; preds = %254, %203
  %258 = phi contract float [ %253, %203 ], [ %256, %254 ]
  %259 = fcmp contract ogt float %44, 0x3FC3280000000000
  br i1 %259, label %260, label %311

260:                                              ; preds = %257
  %261 = fadd contract float %44, 0xBFD8ACA360000000
  %262 = fdiv contract float %261, 0x3FCFA3E8A0000000
  %263 = fmul float %262, 0x40026BB1C0000000
  %264 = fneg float %263
  %265 = tail call float @llvm.fma.f32(float %262, float 0x40026BB1C0000000, float %264)
  %266 = tail call float @llvm.fma.f32(float %262, float 0xBE6129FAE0000000, float %265)
  %267 = fadd float %263, %266
  %268 = fsub float %267, %263
  %269 = fsub float %266, %268
  %270 = tail call float @llvm.fabs.f32(float %263) #3
  %271 = fcmp oeq float %270, 0x7FF0000000000000
  %272 = select i1 %271, float %263, float %267
  %273 = tail call float @llvm.fabs.f32(float %272) #3
  %274 = fcmp oeq float %273, 0x7FF0000000000000
  %275 = select i1 %274, float 0.000000e+00, float %269
  %276 = fcmp oeq float %272, 0x40562E4300000000
  %277 = select i1 %276, float 0x3EE0000000000000, float 0.000000e+00
  %278 = fsub float %272, %277
  %279 = fadd float %277, %275
  %280 = fmul float %278, 0x3FF7154760000000
  %281 = tail call float @llvm.rint.f32(float %280)
  %282 = fcmp ogt float %278, 0x40562E4300000000
  %283 = fcmp olt float %278, 0xC059D1DA00000000
  %284 = fneg float %280
  %285 = tail call float @llvm.fma.f32(float %278, float 0x3FF7154760000000, float %284)
  %286 = tail call float @llvm.fma.f32(float %278, float 0x3E54AE0BE0000000, float %285)
  %287 = fsub float %280, %281
  %288 = fadd float %286, %287
  %289 = tail call float @llvm.exp2.f32(float %288)
  %290 = fptosi float %281 to i32
  %291 = tail call float @llvm.amdgcn.ldexp.f32(float %289, i32 %290)
  %292 = select i1 %283, float 0.000000e+00, float %291
  %293 = select i1 %282, float 0x7FF0000000000000, float %292
  %294 = tail call float @llvm.fma.f32(float %293, float %279, float %293)
  %295 = tail call float @llvm.fabs.f32(float %293) #3
  %296 = fcmp oeq float %295, 0x7FF0000000000000
  %297 = select i1 %296, float %293, float %294
  %298 = tail call float @llvm.fabs.f32(float %262)
  %299 = tail call float @llvm.fabs.f32(float %297)
  %300 = fcmp oeq float %298, 0x7FF0000000000000
  %301 = bitcast float %262 to i32
  %302 = icmp sgt i32 %301, -1
  %303 = select i1 %302, float 0x7FF0000000000000, float 0.000000e+00
  %304 = select i1 %300, float %303, float %299
  %305 = fcmp uno float %262, 0.000000e+00
  %306 = fcmp oeq float %262, 0.000000e+00
  %307 = fadd contract float %304, 0xBFAAC36540000000
  %308 = fdiv contract float %307, 0x401638E3A0000000
  %309 = select i1 %305, float 0x7FF8000000000000, float %308
  %310 = select i1 %306, float 0x3FC5D5ED40000000, float %309
  br label %314

311:                                              ; preds = %257
  %312 = fadd contract float %44, 0xBFB7C254A0000000
  %313 = fdiv contract float %312, 0x4015787A80000000
  br label %314

314:                                              ; preds = %311, %260
  %315 = phi contract float [ %310, %260 ], [ %313, %311 ]
  %316 = fcmp contract ogt float %48, 0x3FC3280000000000
  br i1 %316, label %317, label %368

317:                                              ; preds = %314
  %318 = fadd contract float %48, 0xBFD8ACA360000000
  %319 = fdiv contract float %318, 0x3FCFA3E8A0000000
  %320 = fmul float %319, 0x40026BB1C0000000
  %321 = fneg float %320
  %322 = tail call float @llvm.fma.f32(float %319, float 0x40026BB1C0000000, float %321)
  %323 = tail call float @llvm.fma.f32(float %319, float 0xBE6129FAE0000000, float %322)
  %324 = fadd float %320, %323
  %325 = fsub float %324, %320
  %326 = fsub float %323, %325
  %327 = tail call float @llvm.fabs.f32(float %320) #3
  %328 = fcmp oeq float %327, 0x7FF0000000000000
  %329 = select i1 %328, float %320, float %324
  %330 = tail call float @llvm.fabs.f32(float %329) #3
  %331 = fcmp oeq float %330, 0x7FF0000000000000
  %332 = select i1 %331, float 0.000000e+00, float %326
  %333 = fcmp oeq float %329, 0x40562E4300000000
  %334 = select i1 %333, float 0x3EE0000000000000, float 0.000000e+00
  %335 = fsub float %329, %334
  %336 = fadd float %334, %332
  %337 = fmul float %335, 0x3FF7154760000000
  %338 = tail call float @llvm.rint.f32(float %337)
  %339 = fcmp ogt float %335, 0x40562E4300000000
  %340 = fcmp olt float %335, 0xC059D1DA00000000
  %341 = fneg float %337
  %342 = tail call float @llvm.fma.f32(float %335, float 0x3FF7154760000000, float %341)
  %343 = tail call float @llvm.fma.f32(float %335, float 0x3E54AE0BE0000000, float %342)
  %344 = fsub float %337, %338
  %345 = fadd float %343, %344
  %346 = tail call float @llvm.exp2.f32(float %345)
  %347 = fptosi float %338 to i32
  %348 = tail call float @llvm.amdgcn.ldexp.f32(float %346, i32 %347)
  %349 = select i1 %340, float 0.000000e+00, float %348
  %350 = select i1 %339, float 0x7FF0000000000000, float %349
  %351 = tail call float @llvm.fma.f32(float %350, float %336, float %350)
  %352 = tail call float @llvm.fabs.f32(float %350) #3
  %353 = fcmp oeq float %352, 0x7FF0000000000000
  %354 = select i1 %353, float %350, float %351
  %355 = tail call float @llvm.fabs.f32(float %319)
  %356 = tail call float @llvm.fabs.f32(float %354)
  %357 = fcmp oeq float %355, 0x7FF0000000000000
  %358 = bitcast float %319 to i32
  %359 = icmp sgt i32 %358, -1
  %360 = select i1 %359, float 0x7FF0000000000000, float 0.000000e+00
  %361 = select i1 %357, float %360, float %356
  %362 = fcmp uno float %319, 0.000000e+00
  %363 = fcmp oeq float %319, 0.000000e+00
  %364 = fadd contract float %361, 0xBFAAC36540000000
  %365 = fdiv contract float %364, 0x401638E3A0000000
  %366 = select i1 %362, float 0x7FF8000000000000, float %365
  %367 = select i1 %363, float 0x3FC5D5ED40000000, float %366
  br label %371

368:                                              ; preds = %314
  %369 = fadd contract float %48, 0xBFB7C254A0000000
  %370 = fdiv contract float %369, 0x4015787A80000000
  br label %371

371:                                              ; preds = %368, %317
  %372 = phi contract float [ %367, %317 ], [ %370, %368 ]
  %373 = fmul contract float %258, 0x3FB2111280000000
  %374 = fmul contract float %315, 0x3FF55A9320000000
  %375 = fsub contract float %374, %373
  %376 = fmul contract float %372, 0x3FD0E60800000000
  %377 = fsub contract float %375, %376
  %378 = fmul contract float %258, 0xBF959BC340000000
  %379 = fmul contract float %315, 0x3FCD0CD420000000
  %380 = fsub contract float %378, %379
  %381 = fmul contract float %372, 0x3FF3F809A0000000
  %382 = fadd contract float %380, %381
  %383 = icmp eq i32 %12, 0
  %384 = fmul contract float %258, 0x3FF9E15FC0000000
  %385 = fmul contract float %315, 0x3FE1317480000000
  %386 = fsub contract float %384, %385
  %387 = fmul contract float %372, 0x3FB48A6980000000
  %388 = fsub contract float %386, %387
  %389 = icmp eq i32 %12, 1
  %390 = select contract i1 %389, float %99, float %388
  %391 = select contract i1 %383, float %40, float %390
  %392 = select contract i1 %389, float %150, float %377
  %393 = select contract i1 %383, float %44, float %392
  %394 = select contract i1 %389, float %201, float %382
  %395 = select contract i1 %383, float %48, float %394
  %396 = fcmp contract ogt float %391, 1.000000e+00
  %397 = select contract i1 %396, float 1.000000e+00, float %391
  %398 = fcmp contract ogt float %393, 1.000000e+00
  %399 = select contract i1 %398, float 1.000000e+00, float %393
  %400 = fcmp contract ogt float %395, 1.000000e+00
  %401 = select contract i1 %400, float 1.000000e+00, float %395
  %402 = fcmp contract olt float %391, 1.000000e+00
  %403 = select contract i1 %402, float 1.000000e+00, float %391
  %404 = fadd contract float %403, -1.000000e+00
  %405 = fcmp contract olt float %393, 1.000000e+00
  %406 = select contract i1 %405, float 1.000000e+00, float %393
  %407 = fadd contract float %406, -1.000000e+00
  %408 = fcmp contract olt float %395, 1.000000e+00
  %409 = select contract i1 %408, float 1.000000e+00, float %395
  %410 = fadd contract float %409, -1.000000e+00
  %411 = fdiv contract float %8, 1.000000e+01
  %412 = fsub contract float 1.000000e+00, %411
  %413 = fsub contract float 1.000000e+00, %9
  %414 = fmul float %4, 0x3FE62E4300000000
  %415 = fneg float %414
  %416 = tail call float @llvm.fma.f32(float %4, float 0x3FE62E4300000000, float %415)
  %417 = tail call float @llvm.fma.f32(float %4, float 0xBE205C6100000000, float %416)
  %418 = fadd float %414, %417
  %419 = fsub float %418, %414
  %420 = fsub float %417, %419
  %421 = tail call float @llvm.fabs.f32(float %414) #3
  %422 = fcmp oeq float %421, 0x7FF0000000000000
  %423 = select i1 %422, float %414, float %418
  %424 = tail call float @llvm.fabs.f32(float %423) #3
  %425 = fcmp oeq float %424, 0x7FF0000000000000
  %426 = select i1 %425, float 0.000000e+00, float %420
  %427 = fcmp oeq float %423, 0x40562E4300000000
  %428 = select i1 %427, float 0x3EE0000000000000, float 0.000000e+00
  %429 = fsub float %423, %428
  %430 = fadd float %428, %426
  %431 = fmul float %429, 0x3FF7154760000000
  %432 = tail call float @llvm.rint.f32(float %431)
  %433 = fcmp ogt float %429, 0x40562E4300000000
  %434 = fcmp olt float %429, 0xC059D1DA00000000
  %435 = fneg float %431
  %436 = tail call float @llvm.fma.f32(float %429, float 0x3FF7154760000000, float %435)
  %437 = tail call float @llvm.fma.f32(float %429, float 0x3E54AE0BE0000000, float %436)
  %438 = fsub float %431, %432
  %439 = fadd float %437, %438
  %440 = tail call float @llvm.exp2.f32(float %439)
  %441 = fptosi float %432 to i32
  %442 = tail call float @llvm.amdgcn.ldexp.f32(float %440, i32 %441)
  %443 = select i1 %434, float 0.000000e+00, float %442
  %444 = select i1 %433, float 0x7FF0000000000000, float %443
  %445 = tail call float @llvm.fma.f32(float %444, float %430, float %444)
  %446 = tail call float @llvm.fabs.f32(float %444) #3
  %447 = fcmp oeq float %446, 0x7FF0000000000000
  %448 = select i1 %447, float %444, float %445
  %449 = tail call float @llvm.fabs.f32(float %4)
  %450 = tail call float @llvm.fabs.f32(float %448)
  %451 = fcmp oeq float %449, 0x7FF0000000000000
  %452 = bitcast float %4 to i32
  %453 = icmp sgt i32 %452, -1
  %454 = select i1 %453, float 0x7FF0000000000000, float 0.000000e+00
  %455 = select i1 %451, float %454, float %450
  %456 = fcmp uno float %4, 0.000000e+00
  %457 = select i1 %456, float 0x7FF8000000000000, float %455
  %458 = fcmp oeq float %4, 0.000000e+00
  %459 = select i1 %458, float 1.000000e+00, float %457
  %460 = fmul contract float %459, %404
  %461 = fmul contract float %459, %407
  %462 = fmul contract float %459, %410
  %463 = fcmp contract ugt float %460, 1.000000e+00
  br i1 %463, label %658, label %464

464:                                              ; preds = %371
  %465 = fsub contract float 1.000000e+00, %460
  %466 = tail call float @llvm.fabs.f32(float %465)
  %467 = tail call float @llvm.amdgcn.frexp.mant.f32(float %466)
  %468 = fcmp olt float %467, 0x3FE5555560000000
  %469 = zext i1 %468 to i32
  %470 = tail call float @llvm.amdgcn.ldexp.f32(float %467, i32 %469)
  %471 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %466)
  %472 = sub nsw i32 %471, %469
  %473 = fadd float %470, -1.000000e+00
  %474 = fadd float %470, 1.000000e+00
  %475 = fadd float %474, -1.000000e+00
  %476 = fsub float %470, %475
  %477 = tail call float @llvm.amdgcn.rcp.f32(float %474)
  %478 = fmul float %473, %477
  %479 = fmul float %474, %478
  %480 = fneg float %479
  %481 = tail call float @llvm.fma.f32(float %478, float %474, float %480)
  %482 = tail call float @llvm.fma.f32(float %478, float %476, float %481)
  %483 = fadd float %479, %482
  %484 = fsub float %483, %479
  %485 = fsub float %482, %484
  %486 = fsub float %473, %483
  %487 = fsub float %473, %486
  %488 = fsub float %487, %483
  %489 = fsub float %488, %485
  %490 = fadd float %486, %489
  %491 = fmul float %477, %490
  %492 = fadd float %478, %491
  %493 = fsub float %492, %478
  %494 = fsub float %491, %493
  %495 = fmul float %492, %492
  %496 = fneg float %495
  %497 = tail call float @llvm.fma.f32(float %492, float %492, float %496)
  %498 = fmul float %494, 2.000000e+00
  %499 = tail call float @llvm.fma.f32(float %492, float %498, float %497)
  %500 = fadd float %495, %499
  %501 = fsub float %500, %495
  %502 = fsub float %499, %501
  %503 = tail call float @llvm.fmuladd.f32(float %500, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %504 = tail call float @llvm.fmuladd.f32(float %500, float %503, float 0x3FD999BDE0000000)
  %505 = sitofp i32 %472 to float
  %506 = fmul float %505, 0x3FE62E4300000000
  %507 = fneg float %506
  %508 = tail call float @llvm.fma.f32(float %505, float 0x3FE62E4300000000, float %507)
  %509 = tail call float @llvm.fma.f32(float %505, float 0xBE205C6100000000, float %508)
  %510 = fadd float %506, %509
  %511 = fsub float %510, %506
  %512 = fsub float %509, %511
  %513 = tail call float @llvm.amdgcn.ldexp.f32(float %492, i32 1)
  %514 = fmul float %492, %500
  %515 = fneg float %514
  %516 = tail call float @llvm.fma.f32(float %500, float %492, float %515)
  %517 = tail call float @llvm.fma.f32(float %500, float %494, float %516)
  %518 = tail call float @llvm.fma.f32(float %502, float %492, float %517)
  %519 = fadd float %514, %518
  %520 = fsub float %519, %514
  %521 = fsub float %518, %520
  %522 = fmul float %500, %504
  %523 = fneg float %522
  %524 = tail call float @llvm.fma.f32(float %500, float %504, float %523)
  %525 = tail call float @llvm.fma.f32(float %502, float %504, float %524)
  %526 = fadd float %522, %525
  %527 = fsub float %526, %522
  %528 = fsub float %525, %527
  %529 = fadd float %526, 0x3FE5555540000000
  %530 = fadd float %529, 0xBFE5555540000000
  %531 = fsub float %526, %530
  %532 = fadd float %528, 0x3E2E720200000000
  %533 = fadd float %532, %531
  %534 = fadd float %529, %533
  %535 = fsub float %534, %529
  %536 = fsub float %533, %535
  %537 = fmul float %519, %534
  %538 = fneg float %537
  %539 = tail call float @llvm.fma.f32(float %519, float %534, float %538)
  %540 = tail call float @llvm.fma.f32(float %519, float %536, float %539)
  %541 = tail call float @llvm.fma.f32(float %521, float %534, float %540)
  %542 = tail call float @llvm.amdgcn.ldexp.f32(float %494, i32 1)
  %543 = fadd float %537, %541
  %544 = fsub float %543, %537
  %545 = fsub float %541, %544
  %546 = fadd float %513, %543
  %547 = fsub float %546, %513
  %548 = fsub float %543, %547
  %549 = fadd float %542, %545
  %550 = fadd float %549, %548
  %551 = fadd float %546, %550
  %552 = fsub float %551, %546
  %553 = fsub float %550, %552
  %554 = fadd float %510, %551
  %555 = fsub float %554, %510
  %556 = fsub float %554, %555
  %557 = fsub float %510, %556
  %558 = fsub float %551, %555
  %559 = fadd float %558, %557
  %560 = fadd float %512, %553
  %561 = fsub float %560, %512
  %562 = fsub float %560, %561
  %563 = fsub float %512, %562
  %564 = fsub float %553, %561
  %565 = fadd float %564, %563
  %566 = fadd float %560, %559
  %567 = fadd float %554, %566
  %568 = fsub float %567, %554
  %569 = fsub float %566, %568
  %570 = fadd float %565, %569
  %571 = fadd float %567, %570
  %572 = fsub float %571, %567
  %573 = fsub float %570, %572
  %574 = fmul float %571, %5
  %575 = fneg float %574
  %576 = tail call float @llvm.fma.f32(float %5, float %571, float %575)
  %577 = tail call float @llvm.fma.f32(float %5, float %573, float %576)
  %578 = fadd float %574, %577
  %579 = fsub float %578, %574
  %580 = fsub float %577, %579
  %581 = tail call float @llvm.fabs.f32(float %574) #3
  %582 = fcmp oeq float %581, 0x7FF0000000000000
  %583 = select i1 %582, float %574, float %578
  %584 = tail call float @llvm.fabs.f32(float %583) #3
  %585 = fcmp oeq float %584, 0x7FF0000000000000
  %586 = select i1 %585, float 0.000000e+00, float %580
  %587 = fcmp oeq float %583, 0x40562E4300000000
  %588 = select i1 %587, float 0x3EE0000000000000, float 0.000000e+00
  %589 = fsub float %583, %588
  %590 = fadd float %588, %586
  %591 = fmul float %589, 0x3FF7154760000000
  %592 = tail call float @llvm.rint.f32(float %591)
  %593 = fcmp ogt float %589, 0x40562E4300000000
  %594 = fcmp olt float %589, 0xC059D1DA00000000
  %595 = fneg float %591
  %596 = tail call float @llvm.fma.f32(float %589, float 0x3FF7154760000000, float %595)
  %597 = tail call float @llvm.fma.f32(float %589, float 0x3E54AE0BE0000000, float %596)
  %598 = fsub float %591, %592
  %599 = fadd float %597, %598
  %600 = tail call float @llvm.exp2.f32(float %599)
  %601 = fptosi float %592 to i32
  %602 = tail call float @llvm.amdgcn.ldexp.f32(float %600, i32 %601)
  %603 = select i1 %594, float 0.000000e+00, float %602
  %604 = select i1 %593, float 0x7FF0000000000000, float %603
  %605 = tail call float @llvm.fma.f32(float %604, float %590, float %604)
  %606 = tail call float @llvm.fabs.f32(float %604) #3
  %607 = fcmp oeq float %606, 0x7FF0000000000000
  %608 = select i1 %607, float %604, float %605
  %609 = tail call float @llvm.fabs.f32(float %5)
  %610 = tail call float @llvm.trunc.f32(float %609)
  %611 = fcmp oeq float %609, %610
  %612 = zext i1 %611 to i32
  %613 = fmul float %610, 5.000000e-01
  %614 = tail call float @llvm.amdgcn.fract.f32(float %613)
  %615 = tail call i1 @llvm.amdgcn.class.f32(float %613, i32 516)
  %616 = select i1 %615, float 0.000000e+00, float %614
  %617 = fcmp oeq float %616, 0.000000e+00
  %618 = and i1 %611, %617
  %619 = zext i1 %618 to i32
  %620 = add nuw nsw i32 %619, %612
  %621 = icmp eq i32 %620, 1
  %622 = fcmp olt float %465, 0.000000e+00
  %623 = and i1 %621, %622
  %624 = select i1 %623, float -0.000000e+00, float 0.000000e+00
  %625 = tail call float @llvm.copysign.f32(float %608, float %624)
  %626 = fcmp uge float %465, 0.000000e+00
  %627 = icmp ne i32 %620, 0
  %628 = select i1 %626, i1 true, i1 %627
  %629 = select i1 %628, float %625, float 0x7FF8000000000000
  %630 = fcmp oeq float %609, 0x7FF0000000000000
  br i1 %630, label %631, label %640

631:                                              ; preds = %464
  %632 = fcmp oeq float %466, 1.000000e+00
  %633 = fadd float %466, -1.000000e+00
  %634 = bitcast float %5 to i32
  %635 = bitcast float %633 to i32
  %636 = xor i32 %635, %634
  %637 = icmp sgt i32 %636, -1
  %638 = select i1 %637, float 0x7FF0000000000000, float 0.000000e+00
  %639 = select i1 %632, float %466, float %638
  br label %640

640:                                              ; preds = %464, %631
  %641 = phi float [ %629, %464 ], [ %639, %631 ]
  %642 = fcmp oeq float %466, 0x7FF0000000000000
  %643 = fcmp oeq float %465, 0.000000e+00
  %644 = or i1 %643, %642
  %645 = fcmp olt float %5, 0.000000e+00
  %646 = xor i1 %645, %643
  %647 = select i1 %646, float 0.000000e+00, float 0x7FF0000000000000
  %648 = select i1 %621, float %465, float 0.000000e+00
  %649 = tail call float @llvm.copysign.f32(float %647, float %648)
  %650 = select i1 %644, float %649, float %641
  %651 = fcmp uno float %465, %5
  %652 = fcmp oeq float %465, 1.000000e+00
  %653 = fcmp oeq float %5, 0.000000e+00
  %654 = or i1 %653, %652
  %655 = fsub contract float 1.000000e+00, %650
  %656 = select i1 %651, float 0x7FF8000000000000, float %655
  %657 = select i1 %654, float 0.000000e+00, float %656
  br label %658

658:                                              ; preds = %371, %640
  %659 = phi contract float [ %657, %640 ], [ %460, %371 ]
  %660 = fcmp contract ugt float %461, 1.000000e+00
  br i1 %660, label %855, label %661

661:                                              ; preds = %658
  %662 = fsub contract float 1.000000e+00, %461
  %663 = tail call float @llvm.fabs.f32(float %662)
  %664 = tail call float @llvm.amdgcn.frexp.mant.f32(float %663)
  %665 = fcmp olt float %664, 0x3FE5555560000000
  %666 = zext i1 %665 to i32
  %667 = tail call float @llvm.amdgcn.ldexp.f32(float %664, i32 %666)
  %668 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %663)
  %669 = sub nsw i32 %668, %666
  %670 = fadd float %667, -1.000000e+00
  %671 = fadd float %667, 1.000000e+00
  %672 = fadd float %671, -1.000000e+00
  %673 = fsub float %667, %672
  %674 = tail call float @llvm.amdgcn.rcp.f32(float %671)
  %675 = fmul float %670, %674
  %676 = fmul float %671, %675
  %677 = fneg float %676
  %678 = tail call float @llvm.fma.f32(float %675, float %671, float %677)
  %679 = tail call float @llvm.fma.f32(float %675, float %673, float %678)
  %680 = fadd float %676, %679
  %681 = fsub float %680, %676
  %682 = fsub float %679, %681
  %683 = fsub float %670, %680
  %684 = fsub float %670, %683
  %685 = fsub float %684, %680
  %686 = fsub float %685, %682
  %687 = fadd float %683, %686
  %688 = fmul float %674, %687
  %689 = fadd float %675, %688
  %690 = fsub float %689, %675
  %691 = fsub float %688, %690
  %692 = fmul float %689, %689
  %693 = fneg float %692
  %694 = tail call float @llvm.fma.f32(float %689, float %689, float %693)
  %695 = fmul float %691, 2.000000e+00
  %696 = tail call float @llvm.fma.f32(float %689, float %695, float %694)
  %697 = fadd float %692, %696
  %698 = fsub float %697, %692
  %699 = fsub float %696, %698
  %700 = tail call float @llvm.fmuladd.f32(float %697, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %701 = tail call float @llvm.fmuladd.f32(float %697, float %700, float 0x3FD999BDE0000000)
  %702 = sitofp i32 %669 to float
  %703 = fmul float %702, 0x3FE62E4300000000
  %704 = fneg float %703
  %705 = tail call float @llvm.fma.f32(float %702, float 0x3FE62E4300000000, float %704)
  %706 = tail call float @llvm.fma.f32(float %702, float 0xBE205C6100000000, float %705)
  %707 = fadd float %703, %706
  %708 = fsub float %707, %703
  %709 = fsub float %706, %708
  %710 = tail call float @llvm.amdgcn.ldexp.f32(float %689, i32 1)
  %711 = fmul float %689, %697
  %712 = fneg float %711
  %713 = tail call float @llvm.fma.f32(float %697, float %689, float %712)
  %714 = tail call float @llvm.fma.f32(float %697, float %691, float %713)
  %715 = tail call float @llvm.fma.f32(float %699, float %689, float %714)
  %716 = fadd float %711, %715
  %717 = fsub float %716, %711
  %718 = fsub float %715, %717
  %719 = fmul float %697, %701
  %720 = fneg float %719
  %721 = tail call float @llvm.fma.f32(float %697, float %701, float %720)
  %722 = tail call float @llvm.fma.f32(float %699, float %701, float %721)
  %723 = fadd float %719, %722
  %724 = fsub float %723, %719
  %725 = fsub float %722, %724
  %726 = fadd float %723, 0x3FE5555540000000
  %727 = fadd float %726, 0xBFE5555540000000
  %728 = fsub float %723, %727
  %729 = fadd float %725, 0x3E2E720200000000
  %730 = fadd float %729, %728
  %731 = fadd float %726, %730
  %732 = fsub float %731, %726
  %733 = fsub float %730, %732
  %734 = fmul float %716, %731
  %735 = fneg float %734
  %736 = tail call float @llvm.fma.f32(float %716, float %731, float %735)
  %737 = tail call float @llvm.fma.f32(float %716, float %733, float %736)
  %738 = tail call float @llvm.fma.f32(float %718, float %731, float %737)
  %739 = tail call float @llvm.amdgcn.ldexp.f32(float %691, i32 1)
  %740 = fadd float %734, %738
  %741 = fsub float %740, %734
  %742 = fsub float %738, %741
  %743 = fadd float %710, %740
  %744 = fsub float %743, %710
  %745 = fsub float %740, %744
  %746 = fadd float %739, %742
  %747 = fadd float %746, %745
  %748 = fadd float %743, %747
  %749 = fsub float %748, %743
  %750 = fsub float %747, %749
  %751 = fadd float %707, %748
  %752 = fsub float %751, %707
  %753 = fsub float %751, %752
  %754 = fsub float %707, %753
  %755 = fsub float %748, %752
  %756 = fadd float %755, %754
  %757 = fadd float %709, %750
  %758 = fsub float %757, %709
  %759 = fsub float %757, %758
  %760 = fsub float %709, %759
  %761 = fsub float %750, %758
  %762 = fadd float %761, %760
  %763 = fadd float %757, %756
  %764 = fadd float %751, %763
  %765 = fsub float %764, %751
  %766 = fsub float %763, %765
  %767 = fadd float %762, %766
  %768 = fadd float %764, %767
  %769 = fsub float %768, %764
  %770 = fsub float %767, %769
  %771 = fmul float %768, %5
  %772 = fneg float %771
  %773 = tail call float @llvm.fma.f32(float %5, float %768, float %772)
  %774 = tail call float @llvm.fma.f32(float %5, float %770, float %773)
  %775 = fadd float %771, %774
  %776 = fsub float %775, %771
  %777 = fsub float %774, %776
  %778 = tail call float @llvm.fabs.f32(float %771) #3
  %779 = fcmp oeq float %778, 0x7FF0000000000000
  %780 = select i1 %779, float %771, float %775
  %781 = tail call float @llvm.fabs.f32(float %780) #3
  %782 = fcmp oeq float %781, 0x7FF0000000000000
  %783 = select i1 %782, float 0.000000e+00, float %777
  %784 = fcmp oeq float %780, 0x40562E4300000000
  %785 = select i1 %784, float 0x3EE0000000000000, float 0.000000e+00
  %786 = fsub float %780, %785
  %787 = fadd float %785, %783
  %788 = fmul float %786, 0x3FF7154760000000
  %789 = tail call float @llvm.rint.f32(float %788)
  %790 = fcmp ogt float %786, 0x40562E4300000000
  %791 = fcmp olt float %786, 0xC059D1DA00000000
  %792 = fneg float %788
  %793 = tail call float @llvm.fma.f32(float %786, float 0x3FF7154760000000, float %792)
  %794 = tail call float @llvm.fma.f32(float %786, float 0x3E54AE0BE0000000, float %793)
  %795 = fsub float %788, %789
  %796 = fadd float %794, %795
  %797 = tail call float @llvm.exp2.f32(float %796)
  %798 = fptosi float %789 to i32
  %799 = tail call float @llvm.amdgcn.ldexp.f32(float %797, i32 %798)
  %800 = select i1 %791, float 0.000000e+00, float %799
  %801 = select i1 %790, float 0x7FF0000000000000, float %800
  %802 = tail call float @llvm.fma.f32(float %801, float %787, float %801)
  %803 = tail call float @llvm.fabs.f32(float %801) #3
  %804 = fcmp oeq float %803, 0x7FF0000000000000
  %805 = select i1 %804, float %801, float %802
  %806 = tail call float @llvm.fabs.f32(float %5)
  %807 = tail call float @llvm.trunc.f32(float %806)
  %808 = fcmp oeq float %806, %807
  %809 = zext i1 %808 to i32
  %810 = fmul float %807, 5.000000e-01
  %811 = tail call float @llvm.amdgcn.fract.f32(float %810)
  %812 = tail call i1 @llvm.amdgcn.class.f32(float %810, i32 516)
  %813 = select i1 %812, float 0.000000e+00, float %811
  %814 = fcmp oeq float %813, 0.000000e+00
  %815 = and i1 %808, %814
  %816 = zext i1 %815 to i32
  %817 = add nuw nsw i32 %816, %809
  %818 = icmp eq i32 %817, 1
  %819 = fcmp olt float %662, 0.000000e+00
  %820 = and i1 %818, %819
  %821 = select i1 %820, float -0.000000e+00, float 0.000000e+00
  %822 = tail call float @llvm.copysign.f32(float %805, float %821)
  %823 = fcmp uge float %662, 0.000000e+00
  %824 = icmp ne i32 %817, 0
  %825 = select i1 %823, i1 true, i1 %824
  %826 = select i1 %825, float %822, float 0x7FF8000000000000
  %827 = fcmp oeq float %806, 0x7FF0000000000000
  br i1 %827, label %828, label %837

828:                                              ; preds = %661
  %829 = fcmp oeq float %663, 1.000000e+00
  %830 = fadd float %663, -1.000000e+00
  %831 = bitcast float %5 to i32
  %832 = bitcast float %830 to i32
  %833 = xor i32 %832, %831
  %834 = icmp sgt i32 %833, -1
  %835 = select i1 %834, float 0x7FF0000000000000, float 0.000000e+00
  %836 = select i1 %829, float %663, float %835
  br label %837

837:                                              ; preds = %661, %828
  %838 = phi float [ %826, %661 ], [ %836, %828 ]
  %839 = fcmp oeq float %663, 0x7FF0000000000000
  %840 = fcmp oeq float %662, 0.000000e+00
  %841 = or i1 %840, %839
  %842 = fcmp olt float %5, 0.000000e+00
  %843 = xor i1 %842, %840
  %844 = select i1 %843, float 0.000000e+00, float 0x7FF0000000000000
  %845 = select i1 %818, float %662, float 0.000000e+00
  %846 = tail call float @llvm.copysign.f32(float %844, float %845)
  %847 = select i1 %841, float %846, float %838
  %848 = fcmp uno float %662, %5
  %849 = fcmp oeq float %662, 1.000000e+00
  %850 = fcmp oeq float %5, 0.000000e+00
  %851 = or i1 %850, %849
  %852 = fsub contract float 1.000000e+00, %847
  %853 = select i1 %848, float 0x7FF8000000000000, float %852
  %854 = select i1 %851, float 0.000000e+00, float %853
  br label %855

855:                                              ; preds = %658, %837
  %856 = phi contract float [ %854, %837 ], [ %461, %658 ]
  %857 = fcmp contract ugt float %462, 1.000000e+00
  br i1 %857, label %1052, label %858

858:                                              ; preds = %855
  %859 = fsub contract float 1.000000e+00, %462
  %860 = tail call float @llvm.fabs.f32(float %859)
  %861 = tail call float @llvm.amdgcn.frexp.mant.f32(float %860)
  %862 = fcmp olt float %861, 0x3FE5555560000000
  %863 = zext i1 %862 to i32
  %864 = tail call float @llvm.amdgcn.ldexp.f32(float %861, i32 %863)
  %865 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %860)
  %866 = sub nsw i32 %865, %863
  %867 = fadd float %864, -1.000000e+00
  %868 = fadd float %864, 1.000000e+00
  %869 = fadd float %868, -1.000000e+00
  %870 = fsub float %864, %869
  %871 = tail call float @llvm.amdgcn.rcp.f32(float %868)
  %872 = fmul float %867, %871
  %873 = fmul float %868, %872
  %874 = fneg float %873
  %875 = tail call float @llvm.fma.f32(float %872, float %868, float %874)
  %876 = tail call float @llvm.fma.f32(float %872, float %870, float %875)
  %877 = fadd float %873, %876
  %878 = fsub float %877, %873
  %879 = fsub float %876, %878
  %880 = fsub float %867, %877
  %881 = fsub float %867, %880
  %882 = fsub float %881, %877
  %883 = fsub float %882, %879
  %884 = fadd float %880, %883
  %885 = fmul float %871, %884
  %886 = fadd float %872, %885
  %887 = fsub float %886, %872
  %888 = fsub float %885, %887
  %889 = fmul float %886, %886
  %890 = fneg float %889
  %891 = tail call float @llvm.fma.f32(float %886, float %886, float %890)
  %892 = fmul float %888, 2.000000e+00
  %893 = tail call float @llvm.fma.f32(float %886, float %892, float %891)
  %894 = fadd float %889, %893
  %895 = fsub float %894, %889
  %896 = fsub float %893, %895
  %897 = tail call float @llvm.fmuladd.f32(float %894, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %898 = tail call float @llvm.fmuladd.f32(float %894, float %897, float 0x3FD999BDE0000000)
  %899 = sitofp i32 %866 to float
  %900 = fmul float %899, 0x3FE62E4300000000
  %901 = fneg float %900
  %902 = tail call float @llvm.fma.f32(float %899, float 0x3FE62E4300000000, float %901)
  %903 = tail call float @llvm.fma.f32(float %899, float 0xBE205C6100000000, float %902)
  %904 = fadd float %900, %903
  %905 = fsub float %904, %900
  %906 = fsub float %903, %905
  %907 = tail call float @llvm.amdgcn.ldexp.f32(float %886, i32 1)
  %908 = fmul float %886, %894
  %909 = fneg float %908
  %910 = tail call float @llvm.fma.f32(float %894, float %886, float %909)
  %911 = tail call float @llvm.fma.f32(float %894, float %888, float %910)
  %912 = tail call float @llvm.fma.f32(float %896, float %886, float %911)
  %913 = fadd float %908, %912
  %914 = fsub float %913, %908
  %915 = fsub float %912, %914
  %916 = fmul float %894, %898
  %917 = fneg float %916
  %918 = tail call float @llvm.fma.f32(float %894, float %898, float %917)
  %919 = tail call float @llvm.fma.f32(float %896, float %898, float %918)
  %920 = fadd float %916, %919
  %921 = fsub float %920, %916
  %922 = fsub float %919, %921
  %923 = fadd float %920, 0x3FE5555540000000
  %924 = fadd float %923, 0xBFE5555540000000
  %925 = fsub float %920, %924
  %926 = fadd float %922, 0x3E2E720200000000
  %927 = fadd float %926, %925
  %928 = fadd float %923, %927
  %929 = fsub float %928, %923
  %930 = fsub float %927, %929
  %931 = fmul float %913, %928
  %932 = fneg float %931
  %933 = tail call float @llvm.fma.f32(float %913, float %928, float %932)
  %934 = tail call float @llvm.fma.f32(float %913, float %930, float %933)
  %935 = tail call float @llvm.fma.f32(float %915, float %928, float %934)
  %936 = tail call float @llvm.amdgcn.ldexp.f32(float %888, i32 1)
  %937 = fadd float %931, %935
  %938 = fsub float %937, %931
  %939 = fsub float %935, %938
  %940 = fadd float %907, %937
  %941 = fsub float %940, %907
  %942 = fsub float %937, %941
  %943 = fadd float %936, %939
  %944 = fadd float %943, %942
  %945 = fadd float %940, %944
  %946 = fsub float %945, %940
  %947 = fsub float %944, %946
  %948 = fadd float %904, %945
  %949 = fsub float %948, %904
  %950 = fsub float %948, %949
  %951 = fsub float %904, %950
  %952 = fsub float %945, %949
  %953 = fadd float %952, %951
  %954 = fadd float %906, %947
  %955 = fsub float %954, %906
  %956 = fsub float %954, %955
  %957 = fsub float %906, %956
  %958 = fsub float %947, %955
  %959 = fadd float %958, %957
  %960 = fadd float %954, %953
  %961 = fadd float %948, %960
  %962 = fsub float %961, %948
  %963 = fsub float %960, %962
  %964 = fadd float %959, %963
  %965 = fadd float %961, %964
  %966 = fsub float %965, %961
  %967 = fsub float %964, %966
  %968 = fmul float %965, %5
  %969 = fneg float %968
  %970 = tail call float @llvm.fma.f32(float %5, float %965, float %969)
  %971 = tail call float @llvm.fma.f32(float %5, float %967, float %970)
  %972 = fadd float %968, %971
  %973 = fsub float %972, %968
  %974 = fsub float %971, %973
  %975 = tail call float @llvm.fabs.f32(float %968) #3
  %976 = fcmp oeq float %975, 0x7FF0000000000000
  %977 = select i1 %976, float %968, float %972
  %978 = tail call float @llvm.fabs.f32(float %977) #3
  %979 = fcmp oeq float %978, 0x7FF0000000000000
  %980 = select i1 %979, float 0.000000e+00, float %974
  %981 = fcmp oeq float %977, 0x40562E4300000000
  %982 = select i1 %981, float 0x3EE0000000000000, float 0.000000e+00
  %983 = fsub float %977, %982
  %984 = fadd float %982, %980
  %985 = fmul float %983, 0x3FF7154760000000
  %986 = tail call float @llvm.rint.f32(float %985)
  %987 = fcmp ogt float %983, 0x40562E4300000000
  %988 = fcmp olt float %983, 0xC059D1DA00000000
  %989 = fneg float %985
  %990 = tail call float @llvm.fma.f32(float %983, float 0x3FF7154760000000, float %989)
  %991 = tail call float @llvm.fma.f32(float %983, float 0x3E54AE0BE0000000, float %990)
  %992 = fsub float %985, %986
  %993 = fadd float %991, %992
  %994 = tail call float @llvm.exp2.f32(float %993)
  %995 = fptosi float %986 to i32
  %996 = tail call float @llvm.amdgcn.ldexp.f32(float %994, i32 %995)
  %997 = select i1 %988, float 0.000000e+00, float %996
  %998 = select i1 %987, float 0x7FF0000000000000, float %997
  %999 = tail call float @llvm.fma.f32(float %998, float %984, float %998)
  %1000 = tail call float @llvm.fabs.f32(float %998) #3
  %1001 = fcmp oeq float %1000, 0x7FF0000000000000
  %1002 = select i1 %1001, float %998, float %999
  %1003 = tail call float @llvm.fabs.f32(float %5)
  %1004 = tail call float @llvm.trunc.f32(float %1003)
  %1005 = fcmp oeq float %1003, %1004
  %1006 = zext i1 %1005 to i32
  %1007 = fmul float %1004, 5.000000e-01
  %1008 = tail call float @llvm.amdgcn.fract.f32(float %1007)
  %1009 = tail call i1 @llvm.amdgcn.class.f32(float %1007, i32 516)
  %1010 = select i1 %1009, float 0.000000e+00, float %1008
  %1011 = fcmp oeq float %1010, 0.000000e+00
  %1012 = and i1 %1005, %1011
  %1013 = zext i1 %1012 to i32
  %1014 = add nuw nsw i32 %1013, %1006
  %1015 = icmp eq i32 %1014, 1
  %1016 = fcmp olt float %859, 0.000000e+00
  %1017 = and i1 %1015, %1016
  %1018 = select i1 %1017, float -0.000000e+00, float 0.000000e+00
  %1019 = tail call float @llvm.copysign.f32(float %1002, float %1018)
  %1020 = fcmp uge float %859, 0.000000e+00
  %1021 = icmp ne i32 %1014, 0
  %1022 = select i1 %1020, i1 true, i1 %1021
  %1023 = select i1 %1022, float %1019, float 0x7FF8000000000000
  %1024 = fcmp oeq float %1003, 0x7FF0000000000000
  br i1 %1024, label %1025, label %1034

1025:                                             ; preds = %858
  %1026 = fcmp oeq float %860, 1.000000e+00
  %1027 = fadd float %860, -1.000000e+00
  %1028 = bitcast float %5 to i32
  %1029 = bitcast float %1027 to i32
  %1030 = xor i32 %1029, %1028
  %1031 = icmp sgt i32 %1030, -1
  %1032 = select i1 %1031, float 0x7FF0000000000000, float 0.000000e+00
  %1033 = select i1 %1026, float %860, float %1032
  br label %1034

1034:                                             ; preds = %858, %1025
  %1035 = phi float [ %1023, %858 ], [ %1033, %1025 ]
  %1036 = fcmp oeq float %860, 0x7FF0000000000000
  %1037 = fcmp oeq float %859, 0.000000e+00
  %1038 = or i1 %1037, %1036
  %1039 = fcmp olt float %5, 0.000000e+00
  %1040 = xor i1 %1039, %1037
  %1041 = select i1 %1040, float 0.000000e+00, float 0x7FF0000000000000
  %1042 = select i1 %1015, float %859, float 0.000000e+00
  %1043 = tail call float @llvm.copysign.f32(float %1041, float %1042)
  %1044 = select i1 %1038, float %1043, float %1035
  %1045 = fcmp uno float %859, %5
  %1046 = fcmp oeq float %859, 1.000000e+00
  %1047 = fcmp oeq float %5, 0.000000e+00
  %1048 = or i1 %1047, %1046
  %1049 = fsub contract float 1.000000e+00, %1044
  %1050 = select i1 %1045, float 0x7FF8000000000000, float %1049
  %1051 = select i1 %1048, float 0.000000e+00, float %1050
  br label %1052

1052:                                             ; preds = %855, %1034
  %1053 = phi contract float [ %1051, %1034 ], [ %462, %855 ]
  %1054 = fadd contract float %397, %659
  %1055 = fadd contract float %399, %856
  %1056 = fadd contract float %401, %1053
  %1057 = fcmp contract une float %6, 1.000000e+00
  %1058 = fcmp contract ogt float %1054, %6
  %1059 = select i1 %1057, i1 %1058, i1 false
  br i1 %1059, label %1060, label %1069

1060:                                             ; preds = %1052
  %1061 = fsub contract float %1054, %6
  %1062 = fsub contract float %7, %6
  %1063 = fdiv contract float %1061, %1062
  %1064 = fadd contract float %1063, 1.000000e+00
  %1065 = fdiv contract float 1.000000e+00, %1064
  %1066 = fsub contract float 1.000000e+00, %1065
  %1067 = fmul contract float %1062, %1066
  %1068 = fadd contract float %1067, %6
  br label %1069

1069:                                             ; preds = %1052, %1060
  %1070 = phi contract float [ %1068, %1060 ], [ %1054, %1052 ]
  %1071 = fcmp contract oeq float %7, 1.000000e+00
  br i1 %1071, label %1085, label %1072

1072:                                             ; preds = %1069
  %1073 = fdiv contract float %7, 5.000000e+01
  %1074 = fsub contract float 1.000000e+00, %1073
  %1075 = fcmp contract ogt float %1070, %1074
  br i1 %1075, label %1076, label %1085

1076:                                             ; preds = %1072
  %1077 = fsub contract float %1070, %1074
  %1078 = fsub contract float 1.000000e+00, %1074
  %1079 = fdiv contract float %1077, %1078
  %1080 = fadd contract float %1079, 1.000000e+00
  %1081 = fdiv contract float 1.000000e+00, %1080
  %1082 = fsub contract float 1.000000e+00, %1081
  %1083 = fmul contract float %1078, %1082
  %1084 = fadd contract float %1074, %1083
  br label %1085

1085:                                             ; preds = %1072, %1069, %1076
  %1086 = phi contract float [ %1084, %1076 ], [ %1070, %1069 ], [ %1070, %1072 ]
  %1087 = fcmp contract ogt float %1055, %6
  %1088 = select i1 %1057, i1 %1087, i1 false
  br i1 %1088, label %1089, label %1098

1089:                                             ; preds = %1085
  %1090 = fsub contract float %1055, %6
  %1091 = fsub contract float %7, %6
  %1092 = fdiv contract float %1090, %1091
  %1093 = fadd contract float %1092, 1.000000e+00
  %1094 = fdiv contract float 1.000000e+00, %1093
  %1095 = fsub contract float 1.000000e+00, %1094
  %1096 = fmul contract float %1091, %1095
  %1097 = fadd contract float %1096, %6
  br label %1098

1098:                                             ; preds = %1085, %1089
  %1099 = phi contract float [ %1097, %1089 ], [ %1055, %1085 ]
  br i1 %1071, label %1113, label %1100

1100:                                             ; preds = %1098
  %1101 = fdiv contract float %7, 5.000000e+01
  %1102 = fsub contract float 1.000000e+00, %1101
  %1103 = fcmp contract ogt float %1099, %1102
  br i1 %1103, label %1104, label %1113

1104:                                             ; preds = %1100
  %1105 = fsub contract float %1099, %1102
  %1106 = fsub contract float 1.000000e+00, %1102
  %1107 = fdiv contract float %1105, %1106
  %1108 = fadd contract float %1107, 1.000000e+00
  %1109 = fdiv contract float 1.000000e+00, %1108
  %1110 = fsub contract float 1.000000e+00, %1109
  %1111 = fmul contract float %1106, %1110
  %1112 = fadd contract float %1102, %1111
  br label %1113

1113:                                             ; preds = %1100, %1098, %1104
  %1114 = phi contract float [ %1112, %1104 ], [ %1099, %1098 ], [ %1099, %1100 ]
  %1115 = fcmp contract ogt float %1056, %6
  %1116 = select i1 %1057, i1 %1115, i1 false
  br i1 %1116, label %1117, label %1126

1117:                                             ; preds = %1113
  %1118 = fsub contract float %1056, %6
  %1119 = fsub contract float %7, %6
  %1120 = fdiv contract float %1118, %1119
  %1121 = fadd contract float %1120, 1.000000e+00
  %1122 = fdiv contract float 1.000000e+00, %1121
  %1123 = fsub contract float 1.000000e+00, %1122
  %1124 = fmul contract float %1119, %1123
  %1125 = fadd contract float %1124, %6
  br label %1126

1126:                                             ; preds = %1113, %1117
  %1127 = phi contract float [ %1125, %1117 ], [ %1056, %1113 ]
  br i1 %1071, label %1141, label %1128

1128:                                             ; preds = %1126
  %1129 = fdiv contract float %7, 5.000000e+01
  %1130 = fsub contract float 1.000000e+00, %1129
  %1131 = fcmp contract ogt float %1127, %1130
  br i1 %1131, label %1132, label %1141

1132:                                             ; preds = %1128
  %1133 = fsub contract float %1127, %1130
  %1134 = fsub contract float 1.000000e+00, %1130
  %1135 = fdiv contract float %1133, %1134
  %1136 = fadd contract float %1135, 1.000000e+00
  %1137 = fdiv contract float 1.000000e+00, %1136
  %1138 = fsub contract float 1.000000e+00, %1137
  %1139 = fmul contract float %1134, %1138
  %1140 = fadd contract float %1130, %1139
  br label %1141

1141:                                             ; preds = %1128, %1126, %1132
  %1142 = phi contract float [ %1140, %1132 ], [ %1127, %1126 ], [ %1127, %1128 ]
  %1143 = fsub contract float 1.000000e+00, %1086
  %1144 = fsub contract float 1.000000e+00, %1114
  %1145 = fsub contract float 1.000000e+00, %1142
  %1146 = fcmp contract une float %412, 1.000000e+00
  %1147 = fcmp contract ogt float %1143, %412
  %1148 = select i1 %1146, i1 %1147, i1 false
  br i1 %1148, label %1149, label %1158

1149:                                             ; preds = %1141
  %1150 = fsub contract float %1143, %412
  %1151 = fsub contract float %413, %412
  %1152 = fdiv contract float %1150, %1151
  %1153 = fadd contract float %1152, 1.000000e+00
  %1154 = fdiv contract float 1.000000e+00, %1153
  %1155 = fsub contract float 1.000000e+00, %1154
  %1156 = fmul contract float %1151, %1155
  %1157 = fadd contract float %412, %1156
  br label %1158

1158:                                             ; preds = %1141, %1149
  %1159 = phi contract float [ %1157, %1149 ], [ %1143, %1141 ]
  %1160 = fcmp contract oeq float %413, 1.000000e+00
  br i1 %1160, label %1174, label %1161

1161:                                             ; preds = %1158
  %1162 = fdiv contract float %9, 5.000000e+01
  %1163 = fadd contract float %1162, 1.000000e+00
  %1164 = fcmp contract ogt float %1159, %1163
  br i1 %1164, label %1165, label %1174

1165:                                             ; preds = %1161
  %1166 = fsub contract float %1159, %1163
  %1167 = fsub contract float 1.000000e+00, %1163
  %1168 = fdiv contract float %1166, %1167
  %1169 = fadd contract float %1168, 1.000000e+00
  %1170 = fdiv contract float 1.000000e+00, %1169
  %1171 = fsub contract float 1.000000e+00, %1170
  %1172 = fmul contract float %1167, %1171
  %1173 = fadd contract float %1163, %1172
  br label %1174

1174:                                             ; preds = %1165, %1161, %1158
  %1175 = phi float [ %1159, %1158 ], [ %1173, %1165 ], [ %1159, %1161 ]
  %1176 = fadd contract float %1175, -1.000000e+00
  %1177 = fneg contract float %1176
  %1178 = fcmp contract ogt float %1144, %412
  %1179 = select i1 %1146, i1 %1178, i1 false
  br i1 %1179, label %1180, label %1189

1180:                                             ; preds = %1174
  %1181 = fsub contract float %1144, %412
  %1182 = fsub contract float %413, %412
  %1183 = fdiv contract float %1181, %1182
  %1184 = fadd contract float %1183, 1.000000e+00
  %1185 = fdiv contract float 1.000000e+00, %1184
  %1186 = fsub contract float 1.000000e+00, %1185
  %1187 = fmul contract float %1182, %1186
  %1188 = fadd contract float %412, %1187
  br label %1189

1189:                                             ; preds = %1174, %1180
  %1190 = phi contract float [ %1188, %1180 ], [ %1144, %1174 ]
  br i1 %1160, label %1204, label %1191

1191:                                             ; preds = %1189
  %1192 = fdiv contract float %9, 5.000000e+01
  %1193 = fadd contract float %1192, 1.000000e+00
  %1194 = fcmp contract ogt float %1190, %1193
  br i1 %1194, label %1195, label %1204

1195:                                             ; preds = %1191
  %1196 = fsub contract float %1190, %1193
  %1197 = fsub contract float 1.000000e+00, %1193
  %1198 = fdiv contract float %1196, %1197
  %1199 = fadd contract float %1198, 1.000000e+00
  %1200 = fdiv contract float 1.000000e+00, %1199
  %1201 = fsub contract float 1.000000e+00, %1200
  %1202 = fmul contract float %1197, %1201
  %1203 = fadd contract float %1193, %1202
  br label %1204

1204:                                             ; preds = %1195, %1191, %1189
  %1205 = phi float [ %1190, %1189 ], [ %1203, %1195 ], [ %1190, %1191 ]
  %1206 = fadd contract float %1205, -1.000000e+00
  %1207 = fneg contract float %1206
  %1208 = fcmp contract ogt float %1145, %412
  %1209 = select i1 %1146, i1 %1208, i1 false
  br i1 %1209, label %1210, label %1219

1210:                                             ; preds = %1204
  %1211 = fsub contract float %1145, %412
  %1212 = fsub contract float %413, %412
  %1213 = fdiv contract float %1211, %1212
  %1214 = fadd contract float %1213, 1.000000e+00
  %1215 = fdiv contract float 1.000000e+00, %1214
  %1216 = fsub contract float 1.000000e+00, %1215
  %1217 = fmul contract float %1212, %1216
  %1218 = fadd contract float %412, %1217
  br label %1219

1219:                                             ; preds = %1204, %1210
  %1220 = phi contract float [ %1218, %1210 ], [ %1145, %1204 ]
  br i1 %1160, label %1234, label %1221

1221:                                             ; preds = %1219
  %1222 = fdiv contract float %9, 5.000000e+01
  %1223 = fadd contract float %1222, 1.000000e+00
  %1224 = fcmp contract ogt float %1220, %1223
  br i1 %1224, label %1225, label %1234

1225:                                             ; preds = %1221
  %1226 = fsub contract float %1220, %1223
  %1227 = fsub contract float 1.000000e+00, %1223
  %1228 = fdiv contract float %1226, %1227
  %1229 = fadd contract float %1228, 1.000000e+00
  %1230 = fdiv contract float 1.000000e+00, %1229
  %1231 = fsub contract float 1.000000e+00, %1230
  %1232 = fmul contract float %1227, %1231
  %1233 = fadd contract float %1223, %1232
  br label %1234

1234:                                             ; preds = %1225, %1221, %1219
  %1235 = phi float [ %1220, %1219 ], [ %1233, %1225 ], [ %1220, %1221 ]
  %1236 = fadd contract float %1235, -1.000000e+00
  %1237 = fneg contract float %1236
  br i1 %383, label %1403, label %1238

1238:                                             ; preds = %1234
  %1239 = fcmp contract ole float %1176, 0.000000e+00
  %1240 = fcmp contract oge float %1176, -1.000000e+00
  %1241 = and i1 %1239, %1240
  br i1 %1241, label %1242, label %1403

1242:                                             ; preds = %1238
  %1243 = fcmp contract ogt float %1176, 0xBF9288CE80000000
  br i1 %1243, label %1244, label %1246

1244:                                             ; preds = %1242
  %1245 = fmul contract float %1176, -4.500000e+00
  br label %1403

1246:                                             ; preds = %1242
  %1247 = tail call float @llvm.fabs.f32(float %1177)
  %1248 = tail call float @llvm.amdgcn.frexp.mant.f32(float %1247)
  %1249 = fcmp olt float %1248, 0x3FE5555560000000
  %1250 = zext i1 %1249 to i32
  %1251 = tail call float @llvm.amdgcn.ldexp.f32(float %1248, i32 %1250)
  %1252 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %1247)
  %1253 = sub nsw i32 %1252, %1250
  %1254 = fadd float %1251, -1.000000e+00
  %1255 = fadd float %1251, 1.000000e+00
  %1256 = fadd float %1255, -1.000000e+00
  %1257 = fsub float %1251, %1256
  %1258 = tail call float @llvm.amdgcn.rcp.f32(float %1255)
  %1259 = fmul float %1254, %1258
  %1260 = fmul float %1255, %1259
  %1261 = fneg float %1260
  %1262 = tail call float @llvm.fma.f32(float %1259, float %1255, float %1261)
  %1263 = tail call float @llvm.fma.f32(float %1259, float %1257, float %1262)
  %1264 = fadd float %1260, %1263
  %1265 = fsub float %1264, %1260
  %1266 = fsub float %1263, %1265
  %1267 = fsub float %1254, %1264
  %1268 = fsub float %1254, %1267
  %1269 = fsub float %1268, %1264
  %1270 = fsub float %1269, %1266
  %1271 = fadd float %1267, %1270
  %1272 = fmul float %1258, %1271
  %1273 = fadd float %1259, %1272
  %1274 = fsub float %1273, %1259
  %1275 = fsub float %1272, %1274
  %1276 = fmul float %1273, %1273
  %1277 = fneg float %1276
  %1278 = tail call float @llvm.fma.f32(float %1273, float %1273, float %1277)
  %1279 = fmul float %1275, 2.000000e+00
  %1280 = tail call float @llvm.fma.f32(float %1273, float %1279, float %1278)
  %1281 = fadd float %1276, %1280
  %1282 = fsub float %1281, %1276
  %1283 = fsub float %1280, %1282
  %1284 = tail call float @llvm.fmuladd.f32(float %1281, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %1285 = tail call float @llvm.fmuladd.f32(float %1281, float %1284, float 0x3FD999BDE0000000)
  %1286 = sitofp i32 %1253 to float
  %1287 = fmul float %1286, 0x3FE62E4300000000
  %1288 = fneg float %1287
  %1289 = tail call float @llvm.fma.f32(float %1286, float 0x3FE62E4300000000, float %1288)
  %1290 = tail call float @llvm.fma.f32(float %1286, float 0xBE205C6100000000, float %1289)
  %1291 = fadd float %1287, %1290
  %1292 = fsub float %1291, %1287
  %1293 = fsub float %1290, %1292
  %1294 = tail call float @llvm.amdgcn.ldexp.f32(float %1273, i32 1)
  %1295 = fmul float %1273, %1281
  %1296 = fneg float %1295
  %1297 = tail call float @llvm.fma.f32(float %1281, float %1273, float %1296)
  %1298 = tail call float @llvm.fma.f32(float %1281, float %1275, float %1297)
  %1299 = tail call float @llvm.fma.f32(float %1283, float %1273, float %1298)
  %1300 = fadd float %1295, %1299
  %1301 = fsub float %1300, %1295
  %1302 = fsub float %1299, %1301
  %1303 = fmul float %1281, %1285
  %1304 = fneg float %1303
  %1305 = tail call float @llvm.fma.f32(float %1281, float %1285, float %1304)
  %1306 = tail call float @llvm.fma.f32(float %1283, float %1285, float %1305)
  %1307 = fadd float %1303, %1306
  %1308 = fsub float %1307, %1303
  %1309 = fsub float %1306, %1308
  %1310 = fadd float %1307, 0x3FE5555540000000
  %1311 = fadd float %1310, 0xBFE5555540000000
  %1312 = fsub float %1307, %1311
  %1313 = fadd float %1309, 0x3E2E720200000000
  %1314 = fadd float %1313, %1312
  %1315 = fadd float %1310, %1314
  %1316 = fsub float %1315, %1310
  %1317 = fsub float %1314, %1316
  %1318 = fmul float %1300, %1315
  %1319 = fneg float %1318
  %1320 = tail call float @llvm.fma.f32(float %1300, float %1315, float %1319)
  %1321 = tail call float @llvm.fma.f32(float %1300, float %1317, float %1320)
  %1322 = tail call float @llvm.fma.f32(float %1302, float %1315, float %1321)
  %1323 = tail call float @llvm.amdgcn.ldexp.f32(float %1275, i32 1)
  %1324 = fadd float %1318, %1322
  %1325 = fsub float %1324, %1318
  %1326 = fsub float %1322, %1325
  %1327 = fadd float %1294, %1324
  %1328 = fsub float %1327, %1294
  %1329 = fsub float %1324, %1328
  %1330 = fadd float %1323, %1326
  %1331 = fadd float %1330, %1329
  %1332 = fadd float %1327, %1331
  %1333 = fsub float %1332, %1327
  %1334 = fsub float %1331, %1333
  %1335 = fadd float %1291, %1332
  %1336 = fsub float %1335, %1291
  %1337 = fsub float %1335, %1336
  %1338 = fsub float %1291, %1337
  %1339 = fsub float %1332, %1336
  %1340 = fadd float %1339, %1338
  %1341 = fadd float %1293, %1334
  %1342 = fsub float %1341, %1293
  %1343 = fsub float %1341, %1342
  %1344 = fsub float %1293, %1343
  %1345 = fsub float %1334, %1342
  %1346 = fadd float %1345, %1344
  %1347 = fadd float %1341, %1340
  %1348 = fadd float %1335, %1347
  %1349 = fsub float %1348, %1335
  %1350 = fsub float %1347, %1349
  %1351 = fadd float %1346, %1350
  %1352 = fadd float %1348, %1351
  %1353 = fsub float %1352, %1348
  %1354 = fsub float %1351, %1353
  %1355 = fmul float %1352, 0x3FDCCCCCC0000000
  %1356 = fneg float %1355
  %1357 = tail call float @llvm.fma.f32(float %1352, float 0x3FDCCCCCC0000000, float %1356)
  %1358 = tail call float @llvm.fma.f32(float %1354, float 0x3FDCCCCCC0000000, float %1357)
  %1359 = fadd float %1355, %1358
  %1360 = fsub float %1359, %1355
  %1361 = fsub float %1358, %1360
  %1362 = tail call float @llvm.fabs.f32(float %1355) #3
  %1363 = fcmp oeq float %1362, 0x7FF0000000000000
  %1364 = select i1 %1363, float %1355, float %1359
  %1365 = tail call float @llvm.fabs.f32(float %1364) #3
  %1366 = fcmp oeq float %1365, 0x7FF0000000000000
  %1367 = select i1 %1366, float 0.000000e+00, float %1361
  %1368 = fcmp oeq float %1364, 0x40562E4300000000
  %1369 = select i1 %1368, float 0x3EE0000000000000, float 0.000000e+00
  %1370 = fsub float %1364, %1369
  %1371 = fadd float %1369, %1367
  %1372 = fmul float %1370, 0x3FF7154760000000
  %1373 = tail call float @llvm.rint.f32(float %1372)
  %1374 = fcmp ogt float %1370, 0x40562E4300000000
  %1375 = fcmp olt float %1370, 0xC059D1DA00000000
  %1376 = fneg float %1372
  %1377 = tail call float @llvm.fma.f32(float %1370, float 0x3FF7154760000000, float %1376)
  %1378 = tail call float @llvm.fma.f32(float %1370, float 0x3E54AE0BE0000000, float %1377)
  %1379 = fsub float %1372, %1373
  %1380 = fadd float %1378, %1379
  %1381 = tail call float @llvm.exp2.f32(float %1380)
  %1382 = fptosi float %1373 to i32
  %1383 = tail call float @llvm.amdgcn.ldexp.f32(float %1381, i32 %1382)
  %1384 = select i1 %1375, float 0.000000e+00, float %1383
  %1385 = select i1 %1374, float 0x7FF0000000000000, float %1384
  %1386 = tail call float @llvm.fma.f32(float %1385, float %1371, float %1385)
  %1387 = tail call float @llvm.fabs.f32(float %1385) #3
  %1388 = fcmp oeq float %1387, 0x7FF0000000000000
  %1389 = select i1 %1388, float %1385, float %1386
  %1390 = tail call float @llvm.fabs.f32(float %1389)
  %1391 = fcmp ule float %1176, 0.000000e+00
  %1392 = fcmp oeq float %1247, 0x7FF0000000000000
  %1393 = fcmp oeq float %1176, 0.000000e+00
  %1394 = fcmp uno float %1176, 0.000000e+00
  %1395 = fcmp oeq float %1176, -1.000000e+00
  %1396 = fmul contract float %1390, 0x3FF196BBA0000000
  %1397 = fadd contract float %1396, 0xBFB96BBA00000000
  %1398 = select i1 %1391, float %1397, float 0x7FF8000000000000
  %1399 = select i1 %1392, float 0x7FF0000000000000, float %1398
  %1400 = select i1 %1393, float 0xBFB96BBA00000000, float %1399
  %1401 = select i1 %1394, float 0x7FF8000000000000, float %1400
  %1402 = select i1 %1395, float 1.000000e+00, float %1401
  br label %1403

1403:                                             ; preds = %1238, %1234, %1246, %1244
  %1404 = phi contract float [ %1245, %1244 ], [ %1402, %1246 ], [ %1177, %1234 ], [ %1177, %1238 ]
  br i1 %383, label %1570, label %1405

1405:                                             ; preds = %1403
  %1406 = fcmp contract ole float %1206, 0.000000e+00
  %1407 = fcmp contract oge float %1206, -1.000000e+00
  %1408 = and i1 %1406, %1407
  br i1 %1408, label %1409, label %1570

1409:                                             ; preds = %1405
  %1410 = fcmp contract ogt float %1206, 0xBF9288CE80000000
  br i1 %1410, label %1411, label %1413

1411:                                             ; preds = %1409
  %1412 = fmul contract float %1206, -4.500000e+00
  br label %1570

1413:                                             ; preds = %1409
  %1414 = tail call float @llvm.fabs.f32(float %1207)
  %1415 = tail call float @llvm.amdgcn.frexp.mant.f32(float %1414)
  %1416 = fcmp olt float %1415, 0x3FE5555560000000
  %1417 = zext i1 %1416 to i32
  %1418 = tail call float @llvm.amdgcn.ldexp.f32(float %1415, i32 %1417)
  %1419 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %1414)
  %1420 = sub nsw i32 %1419, %1417
  %1421 = fadd float %1418, -1.000000e+00
  %1422 = fadd float %1418, 1.000000e+00
  %1423 = fadd float %1422, -1.000000e+00
  %1424 = fsub float %1418, %1423
  %1425 = tail call float @llvm.amdgcn.rcp.f32(float %1422)
  %1426 = fmul float %1421, %1425
  %1427 = fmul float %1422, %1426
  %1428 = fneg float %1427
  %1429 = tail call float @llvm.fma.f32(float %1426, float %1422, float %1428)
  %1430 = tail call float @llvm.fma.f32(float %1426, float %1424, float %1429)
  %1431 = fadd float %1427, %1430
  %1432 = fsub float %1431, %1427
  %1433 = fsub float %1430, %1432
  %1434 = fsub float %1421, %1431
  %1435 = fsub float %1421, %1434
  %1436 = fsub float %1435, %1431
  %1437 = fsub float %1436, %1433
  %1438 = fadd float %1434, %1437
  %1439 = fmul float %1425, %1438
  %1440 = fadd float %1426, %1439
  %1441 = fsub float %1440, %1426
  %1442 = fsub float %1439, %1441
  %1443 = fmul float %1440, %1440
  %1444 = fneg float %1443
  %1445 = tail call float @llvm.fma.f32(float %1440, float %1440, float %1444)
  %1446 = fmul float %1442, 2.000000e+00
  %1447 = tail call float @llvm.fma.f32(float %1440, float %1446, float %1445)
  %1448 = fadd float %1443, %1447
  %1449 = fsub float %1448, %1443
  %1450 = fsub float %1447, %1449
  %1451 = tail call float @llvm.fmuladd.f32(float %1448, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %1452 = tail call float @llvm.fmuladd.f32(float %1448, float %1451, float 0x3FD999BDE0000000)
  %1453 = sitofp i32 %1420 to float
  %1454 = fmul float %1453, 0x3FE62E4300000000
  %1455 = fneg float %1454
  %1456 = tail call float @llvm.fma.f32(float %1453, float 0x3FE62E4300000000, float %1455)
  %1457 = tail call float @llvm.fma.f32(float %1453, float 0xBE205C6100000000, float %1456)
  %1458 = fadd float %1454, %1457
  %1459 = fsub float %1458, %1454
  %1460 = fsub float %1457, %1459
  %1461 = tail call float @llvm.amdgcn.ldexp.f32(float %1440, i32 1)
  %1462 = fmul float %1440, %1448
  %1463 = fneg float %1462
  %1464 = tail call float @llvm.fma.f32(float %1448, float %1440, float %1463)
  %1465 = tail call float @llvm.fma.f32(float %1448, float %1442, float %1464)
  %1466 = tail call float @llvm.fma.f32(float %1450, float %1440, float %1465)
  %1467 = fadd float %1462, %1466
  %1468 = fsub float %1467, %1462
  %1469 = fsub float %1466, %1468
  %1470 = fmul float %1448, %1452
  %1471 = fneg float %1470
  %1472 = tail call float @llvm.fma.f32(float %1448, float %1452, float %1471)
  %1473 = tail call float @llvm.fma.f32(float %1450, float %1452, float %1472)
  %1474 = fadd float %1470, %1473
  %1475 = fsub float %1474, %1470
  %1476 = fsub float %1473, %1475
  %1477 = fadd float %1474, 0x3FE5555540000000
  %1478 = fadd float %1477, 0xBFE5555540000000
  %1479 = fsub float %1474, %1478
  %1480 = fadd float %1476, 0x3E2E720200000000
  %1481 = fadd float %1480, %1479
  %1482 = fadd float %1477, %1481
  %1483 = fsub float %1482, %1477
  %1484 = fsub float %1481, %1483
  %1485 = fmul float %1467, %1482
  %1486 = fneg float %1485
  %1487 = tail call float @llvm.fma.f32(float %1467, float %1482, float %1486)
  %1488 = tail call float @llvm.fma.f32(float %1467, float %1484, float %1487)
  %1489 = tail call float @llvm.fma.f32(float %1469, float %1482, float %1488)
  %1490 = tail call float @llvm.amdgcn.ldexp.f32(float %1442, i32 1)
  %1491 = fadd float %1485, %1489
  %1492 = fsub float %1491, %1485
  %1493 = fsub float %1489, %1492
  %1494 = fadd float %1461, %1491
  %1495 = fsub float %1494, %1461
  %1496 = fsub float %1491, %1495
  %1497 = fadd float %1490, %1493
  %1498 = fadd float %1497, %1496
  %1499 = fadd float %1494, %1498
  %1500 = fsub float %1499, %1494
  %1501 = fsub float %1498, %1500
  %1502 = fadd float %1458, %1499
  %1503 = fsub float %1502, %1458
  %1504 = fsub float %1502, %1503
  %1505 = fsub float %1458, %1504
  %1506 = fsub float %1499, %1503
  %1507 = fadd float %1506, %1505
  %1508 = fadd float %1460, %1501
  %1509 = fsub float %1508, %1460
  %1510 = fsub float %1508, %1509
  %1511 = fsub float %1460, %1510
  %1512 = fsub float %1501, %1509
  %1513 = fadd float %1512, %1511
  %1514 = fadd float %1508, %1507
  %1515 = fadd float %1502, %1514
  %1516 = fsub float %1515, %1502
  %1517 = fsub float %1514, %1516
  %1518 = fadd float %1513, %1517
  %1519 = fadd float %1515, %1518
  %1520 = fsub float %1519, %1515
  %1521 = fsub float %1518, %1520
  %1522 = fmul float %1519, 0x3FDCCCCCC0000000
  %1523 = fneg float %1522
  %1524 = tail call float @llvm.fma.f32(float %1519, float 0x3FDCCCCCC0000000, float %1523)
  %1525 = tail call float @llvm.fma.f32(float %1521, float 0x3FDCCCCCC0000000, float %1524)
  %1526 = fadd float %1522, %1525
  %1527 = fsub float %1526, %1522
  %1528 = fsub float %1525, %1527
  %1529 = tail call float @llvm.fabs.f32(float %1522) #3
  %1530 = fcmp oeq float %1529, 0x7FF0000000000000
  %1531 = select i1 %1530, float %1522, float %1526
  %1532 = tail call float @llvm.fabs.f32(float %1531) #3
  %1533 = fcmp oeq float %1532, 0x7FF0000000000000
  %1534 = select i1 %1533, float 0.000000e+00, float %1528
  %1535 = fcmp oeq float %1531, 0x40562E4300000000
  %1536 = select i1 %1535, float 0x3EE0000000000000, float 0.000000e+00
  %1537 = fsub float %1531, %1536
  %1538 = fadd float %1536, %1534
  %1539 = fmul float %1537, 0x3FF7154760000000
  %1540 = tail call float @llvm.rint.f32(float %1539)
  %1541 = fcmp ogt float %1537, 0x40562E4300000000
  %1542 = fcmp olt float %1537, 0xC059D1DA00000000
  %1543 = fneg float %1539
  %1544 = tail call float @llvm.fma.f32(float %1537, float 0x3FF7154760000000, float %1543)
  %1545 = tail call float @llvm.fma.f32(float %1537, float 0x3E54AE0BE0000000, float %1544)
  %1546 = fsub float %1539, %1540
  %1547 = fadd float %1545, %1546
  %1548 = tail call float @llvm.exp2.f32(float %1547)
  %1549 = fptosi float %1540 to i32
  %1550 = tail call float @llvm.amdgcn.ldexp.f32(float %1548, i32 %1549)
  %1551 = select i1 %1542, float 0.000000e+00, float %1550
  %1552 = select i1 %1541, float 0x7FF0000000000000, float %1551
  %1553 = tail call float @llvm.fma.f32(float %1552, float %1538, float %1552)
  %1554 = tail call float @llvm.fabs.f32(float %1552) #3
  %1555 = fcmp oeq float %1554, 0x7FF0000000000000
  %1556 = select i1 %1555, float %1552, float %1553
  %1557 = tail call float @llvm.fabs.f32(float %1556)
  %1558 = fcmp ule float %1206, 0.000000e+00
  %1559 = fcmp oeq float %1414, 0x7FF0000000000000
  %1560 = fcmp oeq float %1206, 0.000000e+00
  %1561 = fcmp uno float %1206, 0.000000e+00
  %1562 = fcmp oeq float %1206, -1.000000e+00
  %1563 = fmul contract float %1557, 0x3FF196BBA0000000
  %1564 = fadd contract float %1563, 0xBFB96BBA00000000
  %1565 = select i1 %1558, float %1564, float 0x7FF8000000000000
  %1566 = select i1 %1559, float 0x7FF0000000000000, float %1565
  %1567 = select i1 %1560, float 0xBFB96BBA00000000, float %1566
  %1568 = select i1 %1561, float 0x7FF8000000000000, float %1567
  %1569 = select i1 %1562, float 1.000000e+00, float %1568
  br label %1570

1570:                                             ; preds = %1405, %1403, %1413, %1411
  %1571 = phi contract float [ %1412, %1411 ], [ %1569, %1413 ], [ %1207, %1403 ], [ %1207, %1405 ]
  br i1 %383, label %1737, label %1572

1572:                                             ; preds = %1570
  %1573 = fcmp contract ole float %1236, 0.000000e+00
  %1574 = fcmp contract oge float %1236, -1.000000e+00
  %1575 = and i1 %1573, %1574
  br i1 %1575, label %1576, label %1737

1576:                                             ; preds = %1572
  %1577 = fcmp contract ogt float %1236, 0xBF9288CE80000000
  br i1 %1577, label %1578, label %1580

1578:                                             ; preds = %1576
  %1579 = fmul contract float %1236, -4.500000e+00
  br label %1737

1580:                                             ; preds = %1576
  %1581 = tail call float @llvm.fabs.f32(float %1237)
  %1582 = tail call float @llvm.amdgcn.frexp.mant.f32(float %1581)
  %1583 = fcmp olt float %1582, 0x3FE5555560000000
  %1584 = zext i1 %1583 to i32
  %1585 = tail call float @llvm.amdgcn.ldexp.f32(float %1582, i32 %1584)
  %1586 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %1581)
  %1587 = sub nsw i32 %1586, %1584
  %1588 = fadd float %1585, -1.000000e+00
  %1589 = fadd float %1585, 1.000000e+00
  %1590 = fadd float %1589, -1.000000e+00
  %1591 = fsub float %1585, %1590
  %1592 = tail call float @llvm.amdgcn.rcp.f32(float %1589)
  %1593 = fmul float %1588, %1592
  %1594 = fmul float %1589, %1593
  %1595 = fneg float %1594
  %1596 = tail call float @llvm.fma.f32(float %1593, float %1589, float %1595)
  %1597 = tail call float @llvm.fma.f32(float %1593, float %1591, float %1596)
  %1598 = fadd float %1594, %1597
  %1599 = fsub float %1598, %1594
  %1600 = fsub float %1597, %1599
  %1601 = fsub float %1588, %1598
  %1602 = fsub float %1588, %1601
  %1603 = fsub float %1602, %1598
  %1604 = fsub float %1603, %1600
  %1605 = fadd float %1601, %1604
  %1606 = fmul float %1592, %1605
  %1607 = fadd float %1593, %1606
  %1608 = fsub float %1607, %1593
  %1609 = fsub float %1606, %1608
  %1610 = fmul float %1607, %1607
  %1611 = fneg float %1610
  %1612 = tail call float @llvm.fma.f32(float %1607, float %1607, float %1611)
  %1613 = fmul float %1609, 2.000000e+00
  %1614 = tail call float @llvm.fma.f32(float %1607, float %1613, float %1612)
  %1615 = fadd float %1610, %1614
  %1616 = fsub float %1615, %1610
  %1617 = fsub float %1614, %1616
  %1618 = tail call float @llvm.fmuladd.f32(float %1615, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %1619 = tail call float @llvm.fmuladd.f32(float %1615, float %1618, float 0x3FD999BDE0000000)
  %1620 = sitofp i32 %1587 to float
  %1621 = fmul float %1620, 0x3FE62E4300000000
  %1622 = fneg float %1621
  %1623 = tail call float @llvm.fma.f32(float %1620, float 0x3FE62E4300000000, float %1622)
  %1624 = tail call float @llvm.fma.f32(float %1620, float 0xBE205C6100000000, float %1623)
  %1625 = fadd float %1621, %1624
  %1626 = fsub float %1625, %1621
  %1627 = fsub float %1624, %1626
  %1628 = tail call float @llvm.amdgcn.ldexp.f32(float %1607, i32 1)
  %1629 = fmul float %1607, %1615
  %1630 = fneg float %1629
  %1631 = tail call float @llvm.fma.f32(float %1615, float %1607, float %1630)
  %1632 = tail call float @llvm.fma.f32(float %1615, float %1609, float %1631)
  %1633 = tail call float @llvm.fma.f32(float %1617, float %1607, float %1632)
  %1634 = fadd float %1629, %1633
  %1635 = fsub float %1634, %1629
  %1636 = fsub float %1633, %1635
  %1637 = fmul float %1615, %1619
  %1638 = fneg float %1637
  %1639 = tail call float @llvm.fma.f32(float %1615, float %1619, float %1638)
  %1640 = tail call float @llvm.fma.f32(float %1617, float %1619, float %1639)
  %1641 = fadd float %1637, %1640
  %1642 = fsub float %1641, %1637
  %1643 = fsub float %1640, %1642
  %1644 = fadd float %1641, 0x3FE5555540000000
  %1645 = fadd float %1644, 0xBFE5555540000000
  %1646 = fsub float %1641, %1645
  %1647 = fadd float %1643, 0x3E2E720200000000
  %1648 = fadd float %1647, %1646
  %1649 = fadd float %1644, %1648
  %1650 = fsub float %1649, %1644
  %1651 = fsub float %1648, %1650
  %1652 = fmul float %1634, %1649
  %1653 = fneg float %1652
  %1654 = tail call float @llvm.fma.f32(float %1634, float %1649, float %1653)
  %1655 = tail call float @llvm.fma.f32(float %1634, float %1651, float %1654)
  %1656 = tail call float @llvm.fma.f32(float %1636, float %1649, float %1655)
  %1657 = tail call float @llvm.amdgcn.ldexp.f32(float %1609, i32 1)
  %1658 = fadd float %1652, %1656
  %1659 = fsub float %1658, %1652
  %1660 = fsub float %1656, %1659
  %1661 = fadd float %1628, %1658
  %1662 = fsub float %1661, %1628
  %1663 = fsub float %1658, %1662
  %1664 = fadd float %1657, %1660
  %1665 = fadd float %1664, %1663
  %1666 = fadd float %1661, %1665
  %1667 = fsub float %1666, %1661
  %1668 = fsub float %1665, %1667
  %1669 = fadd float %1625, %1666
  %1670 = fsub float %1669, %1625
  %1671 = fsub float %1669, %1670
  %1672 = fsub float %1625, %1671
  %1673 = fsub float %1666, %1670
  %1674 = fadd float %1673, %1672
  %1675 = fadd float %1627, %1668
  %1676 = fsub float %1675, %1627
  %1677 = fsub float %1675, %1676
  %1678 = fsub float %1627, %1677
  %1679 = fsub float %1668, %1676
  %1680 = fadd float %1679, %1678
  %1681 = fadd float %1675, %1674
  %1682 = fadd float %1669, %1681
  %1683 = fsub float %1682, %1669
  %1684 = fsub float %1681, %1683
  %1685 = fadd float %1680, %1684
  %1686 = fadd float %1682, %1685
  %1687 = fsub float %1686, %1682
  %1688 = fsub float %1685, %1687
  %1689 = fmul float %1686, 0x3FDCCCCCC0000000
  %1690 = fneg float %1689
  %1691 = tail call float @llvm.fma.f32(float %1686, float 0x3FDCCCCCC0000000, float %1690)
  %1692 = tail call float @llvm.fma.f32(float %1688, float 0x3FDCCCCCC0000000, float %1691)
  %1693 = fadd float %1689, %1692
  %1694 = fsub float %1693, %1689
  %1695 = fsub float %1692, %1694
  %1696 = tail call float @llvm.fabs.f32(float %1689) #3
  %1697 = fcmp oeq float %1696, 0x7FF0000000000000
  %1698 = select i1 %1697, float %1689, float %1693
  %1699 = tail call float @llvm.fabs.f32(float %1698) #3
  %1700 = fcmp oeq float %1699, 0x7FF0000000000000
  %1701 = select i1 %1700, float 0.000000e+00, float %1695
  %1702 = fcmp oeq float %1698, 0x40562E4300000000
  %1703 = select i1 %1702, float 0x3EE0000000000000, float 0.000000e+00
  %1704 = fsub float %1698, %1703
  %1705 = fadd float %1703, %1701
  %1706 = fmul float %1704, 0x3FF7154760000000
  %1707 = tail call float @llvm.rint.f32(float %1706)
  %1708 = fcmp ogt float %1704, 0x40562E4300000000
  %1709 = fcmp olt float %1704, 0xC059D1DA00000000
  %1710 = fneg float %1706
  %1711 = tail call float @llvm.fma.f32(float %1704, float 0x3FF7154760000000, float %1710)
  %1712 = tail call float @llvm.fma.f32(float %1704, float 0x3E54AE0BE0000000, float %1711)
  %1713 = fsub float %1706, %1707
  %1714 = fadd float %1712, %1713
  %1715 = tail call float @llvm.exp2.f32(float %1714)
  %1716 = fptosi float %1707 to i32
  %1717 = tail call float @llvm.amdgcn.ldexp.f32(float %1715, i32 %1716)
  %1718 = select i1 %1709, float 0.000000e+00, float %1717
  %1719 = select i1 %1708, float 0x7FF0000000000000, float %1718
  %1720 = tail call float @llvm.fma.f32(float %1719, float %1705, float %1719)
  %1721 = tail call float @llvm.fabs.f32(float %1719) #3
  %1722 = fcmp oeq float %1721, 0x7FF0000000000000
  %1723 = select i1 %1722, float %1719, float %1720
  %1724 = tail call float @llvm.fabs.f32(float %1723)
  %1725 = fcmp ule float %1236, 0.000000e+00
  %1726 = fcmp oeq float %1581, 0x7FF0000000000000
  %1727 = fcmp oeq float %1236, 0.000000e+00
  %1728 = fcmp uno float %1236, 0.000000e+00
  %1729 = fcmp oeq float %1236, -1.000000e+00
  %1730 = fmul contract float %1724, 0x3FF196BBA0000000
  %1731 = fadd contract float %1730, 0xBFB96BBA00000000
  %1732 = select i1 %1725, float %1731, float 0x7FF8000000000000
  %1733 = select i1 %1726, float 0x7FF0000000000000, float %1732
  %1734 = select i1 %1727, float 0xBFB96BBA00000000, float %1733
  %1735 = select i1 %1728, float 0x7FF8000000000000, float %1734
  %1736 = select i1 %1729, float 1.000000e+00, float %1735
  br label %1737

1737:                                             ; preds = %1572, %1570, %1580, %1578
  %1738 = phi contract float [ %1579, %1578 ], [ %1736, %1580 ], [ %1237, %1570 ], [ %1237, %1572 ]
  %1739 = icmp eq i32 %10, 1
  br i1 %1739, label %1740, label %1750

1740:                                             ; preds = %1737
  %1741 = fcmp contract olt float %1404, 1.000000e+00
  %1742 = select contract i1 %1741, float 1.000000e+00, float %1404
  %1743 = fadd contract float %1742, -1.000000e+00
  %1744 = fcmp contract olt float %1571, 1.000000e+00
  %1745 = select contract i1 %1744, float 1.000000e+00, float %1571
  %1746 = fadd contract float %1745, -1.000000e+00
  %1747 = fcmp contract olt float %1738, 1.000000e+00
  %1748 = select contract i1 %1747, float 1.000000e+00, float %1738
  %1749 = fadd contract float %1748, -1.000000e+00
  br label %1764

1750:                                             ; preds = %1737
  %1751 = icmp eq i32 %11, 1
  %1752 = fcmp contract oge float %1404, 0.000000e+00
  %1753 = fadd contract float %1404, 1.000000e+00
  %1754 = select contract i1 %1752, float 0.000000e+00, float %1753
  %1755 = select i1 %1751, float %1754, float %1404
  %1756 = fcmp contract oge float %1571, 0.000000e+00
  %1757 = fadd contract float %1571, 1.000000e+00
  %1758 = select contract i1 %1756, float 0.000000e+00, float %1757
  %1759 = select i1 %1751, float %1758, float %1571
  %1760 = fcmp contract oge float %1738, 0.000000e+00
  %1761 = fadd contract float %1738, 1.000000e+00
  %1762 = select contract i1 %1760, float 0.000000e+00, float %1761
  %1763 = select i1 %1751, float %1762, float %1738
  br label %1764

1764:                                             ; preds = %1750, %1740
  %1765 = phi float [ %1743, %1740 ], [ %1755, %1750 ]
  %1766 = phi float [ %1746, %1740 ], [ %1759, %1750 ]
  %1767 = phi contract float [ %1749, %1740 ], [ %1763, %1750 ]
  %1768 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  store float %1765, float addrspace(1)* %1768, align 4
  %1769 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %1766, float addrspace(1)* %1769, align 4
  %1770 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  store float %1767, float addrspace(1)* %1770, align 4, !tbaa !7
  %1771 = add nuw nsw i32 %37, 3
  %1772 = sext i32 %1771 to i64
  %1773 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1772
  %1774 = load float, float addrspace(1)* %1773, align 4, !tbaa !7
  %1775 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1772
  store float %1774, float addrspace(1)* %1775, align 4, !tbaa !7
  br label %1776

1776:                                             ; preds = %1764, %13
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
