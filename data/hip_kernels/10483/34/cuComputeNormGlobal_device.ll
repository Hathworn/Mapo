; ModuleID = '../data/hip_kernels/10483/34/main.cu'
source_filename = "../data/hip_kernels/10483/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_A = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_B = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE5end_A = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19cuComputeNormGlobalPfiiS_iiiS_fb(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, float %8, i1 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = fcmp olt float %8, 0.000000e+00
  %14 = select i1 %9, i1 %13, i1 false
  %15 = select i1 %14, float 1.000000e+02, float 0.000000e+00
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = shl i32 %16, 4
  store i32 %17, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_A, align 4, !tbaa !5
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = shl i32 %18, 4
  store i32 %19, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_B, align 4, !tbaa !5
  %20 = shl nsw i32 %2, 4
  store i32 %20, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_A, align 4, !tbaa !5
  %21 = shl nsw i32 %5, 4
  store i32 %21, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_B, align 4, !tbaa !5
  %22 = add nsw i32 %6, -1
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %23, %17
  store i32 %24, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE5end_A, align 4, !tbaa !5
  %25 = add nsw i32 %17, %11
  %26 = icmp slt i32 %25, %1
  %27 = add nsw i32 %19, %11
  %28 = icmp slt i32 %27, %4
  %29 = add nsw i32 %17, %12
  %30 = icmp slt i32 %29, %1
  %31 = icmp slt i32 %23, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %10
  %33 = select i1 %30, i1 %28, i1 false
  br label %66

34:                                               ; preds = %10
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_A, i32 0, i32 %12, i32 %11
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_B, i32 0, i32 %12, i32 %11
  %37 = mul nsw i32 %12, %2
  %38 = add i32 %37, %11
  %39 = mul nsw i32 %12, %5
  %40 = add i32 %39, %11
  %41 = select i1 %30, i1 %28, i1 false
  %42 = tail call float @llvm.fabs.f32(float %8)
  %43 = fcmp oeq float %42, 0x7FF0000000000000
  %44 = bitcast float %8 to i32
  %45 = fcmp oeq float %8, 0.000000e+00
  %46 = fcmp contract ogt float %8, 0.000000e+00
  %47 = fdiv contract float 1.000000e+00, %8
  %48 = tail call float @llvm.fabs.f32(float %47)
  %49 = tail call float @llvm.trunc.f32(float %48)
  %50 = fcmp oeq float %48, %49
  %51 = zext i1 %50 to i32
  %52 = fmul float %49, 5.000000e-01
  %53 = tail call float @llvm.amdgcn.fract.f32(float %52)
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 516)
  %55 = select i1 %54, float 0.000000e+00, float %53
  %56 = fcmp oeq float %55, 0.000000e+00
  %57 = and i1 %50, %56
  %58 = zext i1 %57 to i32
  %59 = add nuw nsw i32 %58, %51
  %60 = icmp eq i32 %59, 1
  %61 = icmp ne i32 %59, 0
  %62 = fcmp oeq float %48, 0x7FF0000000000000
  %63 = bitcast float %47 to i32
  %64 = fcmp olt float %47, 0.000000e+00
  %65 = fcmp oeq float %47, 0.000000e+00
  br label %69

66:                                               ; preds = %451, %32
  %67 = phi i1 [ %33, %32 ], [ %41, %451 ]
  %68 = phi float [ %15, %32 ], [ %452, %451 ]
  br i1 %67, label %459, label %468

69:                                               ; preds = %34, %451
  %70 = phi i32 [ %19, %34 ], [ %456, %451 ]
  %71 = phi i32 [ %17, %34 ], [ %454, %451 ]
  %72 = phi float [ %15, %34 ], [ %452, %451 ]
  %73 = sdiv i32 %71, %2
  %74 = add nsw i32 %73, %12
  %75 = icmp slt i32 %74, %6
  br i1 %75, label %76, label %89

76:                                               ; preds = %69
  br i1 %26, label %77, label %82

77:                                               ; preds = %76
  %78 = add i32 %38, %71
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !9
  br label %82

82:                                               ; preds = %76, %77
  %83 = phi contract float [ %81, %77 ], [ 0.000000e+00, %76 ]
  store float %83, float addrspace(3)* %35, align 4, !tbaa !9
  br i1 %28, label %84, label %90

84:                                               ; preds = %82
  %85 = add i32 %40, %70
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !9
  br label %90

89:                                               ; preds = %69
  store float 0.000000e+00, float addrspace(3)* %35, align 4, !tbaa !9
  br label %90

90:                                               ; preds = %84, %82, %89
  %91 = phi float [ 0.000000e+00, %89 ], [ %88, %84 ], [ 0.000000e+00, %82 ]
  store float %91, float addrspace(3)* %36, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %41, label %93, label %451

92:                                               ; preds = %273
  br i1 %9, label %451, label %277

93:                                               ; preds = %90, %273
  %94 = phi i32 [ %275, %273 ], [ 0, %90 ]
  %95 = phi float [ %274, %273 ], [ %72, %90 ]
  %96 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_A, i32 0, i32 %94, i32 %12
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !9
  %98 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE8shared_B, i32 0, i32 %94, i32 %11
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !9
  %100 = fsub contract float %97, %99
  %101 = tail call float @llvm.fabs.f32(float %100)
  br i1 %9, label %102, label %107

102:                                              ; preds = %93
  br i1 %46, label %103, label %105

103:                                              ; preds = %102
  %104 = tail call float @llvm.maxnum.f32(float %95, float %101)
  br label %273

105:                                              ; preds = %102
  %106 = tail call float @llvm.minnum.f32(float %95, float %101)
  br label %273

107:                                              ; preds = %93
  %108 = tail call float @llvm.amdgcn.frexp.mant.f32(float %101)
  %109 = fcmp olt float %108, 0x3FE5555560000000
  %110 = zext i1 %109 to i32
  %111 = tail call float @llvm.amdgcn.ldexp.f32(float %108, i32 %110)
  %112 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %101)
  %113 = sub nsw i32 %112, %110
  %114 = fadd float %111, -1.000000e+00
  %115 = fadd float %111, 1.000000e+00
  %116 = fadd float %115, -1.000000e+00
  %117 = fsub float %111, %116
  %118 = tail call float @llvm.amdgcn.rcp.f32(float %115)
  %119 = fmul float %114, %118
  %120 = fmul float %115, %119
  %121 = fneg float %120
  %122 = tail call float @llvm.fma.f32(float %119, float %115, float %121)
  %123 = tail call float @llvm.fma.f32(float %119, float %117, float %122)
  %124 = fadd float %120, %123
  %125 = fsub float %124, %120
  %126 = fsub float %123, %125
  %127 = fsub float %114, %124
  %128 = fsub float %114, %127
  %129 = fsub float %128, %124
  %130 = fsub float %129, %126
  %131 = fadd float %127, %130
  %132 = fmul float %118, %131
  %133 = fadd float %119, %132
  %134 = fsub float %133, %119
  %135 = fsub float %132, %134
  %136 = fmul float %133, %133
  %137 = fneg float %136
  %138 = tail call float @llvm.fma.f32(float %133, float %133, float %137)
  %139 = fmul float %135, 2.000000e+00
  %140 = tail call float @llvm.fma.f32(float %133, float %139, float %138)
  %141 = fadd float %136, %140
  %142 = fsub float %141, %136
  %143 = fsub float %140, %142
  %144 = tail call float @llvm.fmuladd.f32(float %141, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %145 = tail call float @llvm.fmuladd.f32(float %141, float %144, float 0x3FD999BDE0000000)
  %146 = sitofp i32 %113 to float
  %147 = fmul float %146, 0x3FE62E4300000000
  %148 = fneg float %147
  %149 = tail call float @llvm.fma.f32(float %146, float 0x3FE62E4300000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %146, float 0xBE205C6100000000, float %149)
  %151 = fadd float %147, %150
  %152 = fsub float %151, %147
  %153 = fsub float %150, %152
  %154 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 1)
  %155 = fmul float %133, %141
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %141, float %133, float %156)
  %158 = tail call float @llvm.fma.f32(float %141, float %135, float %157)
  %159 = tail call float @llvm.fma.f32(float %143, float %133, float %158)
  %160 = fadd float %155, %159
  %161 = fsub float %160, %155
  %162 = fsub float %159, %161
  %163 = fmul float %141, %145
  %164 = fneg float %163
  %165 = tail call float @llvm.fma.f32(float %141, float %145, float %164)
  %166 = tail call float @llvm.fma.f32(float %143, float %145, float %165)
  %167 = fadd float %163, %166
  %168 = fsub float %167, %163
  %169 = fsub float %166, %168
  %170 = fadd float %167, 0x3FE5555540000000
  %171 = fadd float %170, 0xBFE5555540000000
  %172 = fsub float %167, %171
  %173 = fadd float %169, 0x3E2E720200000000
  %174 = fadd float %173, %172
  %175 = fadd float %170, %174
  %176 = fsub float %175, %170
  %177 = fsub float %174, %176
  %178 = fmul float %160, %175
  %179 = fneg float %178
  %180 = tail call float @llvm.fma.f32(float %160, float %175, float %179)
  %181 = tail call float @llvm.fma.f32(float %160, float %177, float %180)
  %182 = tail call float @llvm.fma.f32(float %162, float %175, float %181)
  %183 = tail call float @llvm.amdgcn.ldexp.f32(float %135, i32 1)
  %184 = fadd float %178, %182
  %185 = fsub float %184, %178
  %186 = fsub float %182, %185
  %187 = fadd float %154, %184
  %188 = fsub float %187, %154
  %189 = fsub float %184, %188
  %190 = fadd float %183, %186
  %191 = fadd float %190, %189
  %192 = fadd float %187, %191
  %193 = fsub float %192, %187
  %194 = fsub float %191, %193
  %195 = fadd float %151, %192
  %196 = fsub float %195, %151
  %197 = fsub float %195, %196
  %198 = fsub float %151, %197
  %199 = fsub float %192, %196
  %200 = fadd float %199, %198
  %201 = fadd float %153, %194
  %202 = fsub float %201, %153
  %203 = fsub float %201, %202
  %204 = fsub float %153, %203
  %205 = fsub float %194, %202
  %206 = fadd float %205, %204
  %207 = fadd float %201, %200
  %208 = fadd float %195, %207
  %209 = fsub float %208, %195
  %210 = fsub float %207, %209
  %211 = fadd float %206, %210
  %212 = fadd float %208, %211
  %213 = fsub float %212, %208
  %214 = fsub float %211, %213
  %215 = fmul float %212, %8
  %216 = fneg float %215
  %217 = tail call float @llvm.fma.f32(float %8, float %212, float %216)
  %218 = tail call float @llvm.fma.f32(float %8, float %214, float %217)
  %219 = fadd float %215, %218
  %220 = fsub float %219, %215
  %221 = fsub float %218, %220
  %222 = tail call float @llvm.fabs.f32(float %215) #4
  %223 = fcmp oeq float %222, 0x7FF0000000000000
  %224 = select i1 %223, float %215, float %219
  %225 = tail call float @llvm.fabs.f32(float %224) #4
  %226 = fcmp oeq float %225, 0x7FF0000000000000
  %227 = select i1 %226, float 0.000000e+00, float %221
  %228 = fcmp oeq float %224, 0x40562E4300000000
  %229 = select i1 %228, float 0x3EE0000000000000, float 0.000000e+00
  %230 = fsub float %224, %229
  %231 = fadd float %229, %227
  %232 = fmul float %230, 0x3FF7154760000000
  %233 = tail call float @llvm.rint.f32(float %232)
  %234 = fcmp ogt float %230, 0x40562E4300000000
  %235 = fcmp olt float %230, 0xC059D1DA00000000
  %236 = fneg float %232
  %237 = tail call float @llvm.fma.f32(float %230, float 0x3FF7154760000000, float %236)
  %238 = tail call float @llvm.fma.f32(float %230, float 0x3E54AE0BE0000000, float %237)
  %239 = fsub float %232, %233
  %240 = fadd float %238, %239
  %241 = tail call float @llvm.exp2.f32(float %240)
  %242 = fptosi float %233 to i32
  %243 = tail call float @llvm.amdgcn.ldexp.f32(float %241, i32 %242)
  %244 = select i1 %235, float 0.000000e+00, float %243
  %245 = select i1 %234, float 0x7FF0000000000000, float %244
  %246 = tail call float @llvm.fma.f32(float %245, float %231, float %245)
  %247 = tail call float @llvm.fabs.f32(float %245) #4
  %248 = fcmp oeq float %247, 0x7FF0000000000000
  %249 = select i1 %248, float %245, float %246
  %250 = tail call float @llvm.fabs.f32(float %249)
  br i1 %43, label %251, label %259

251:                                              ; preds = %107
  %252 = fcmp oeq float %101, 1.000000e+00
  %253 = fadd float %101, -1.000000e+00
  %254 = bitcast float %253 to i32
  %255 = xor i32 %254, %44
  %256 = icmp sgt i32 %255, -1
  %257 = select i1 %256, float 0x7FF0000000000000, float 0.000000e+00
  %258 = select i1 %252, float %101, float %257
  br label %259

259:                                              ; preds = %107, %251
  %260 = phi float [ %250, %107 ], [ %258, %251 ]
  %261 = fcmp oeq float %101, 0x7FF0000000000000
  %262 = fcmp oeq float %100, 0.000000e+00
  %263 = or i1 %262, %261
  %264 = xor i1 %13, %262
  %265 = select i1 %264, float 0.000000e+00, float 0x7FF0000000000000
  %266 = select i1 %263, float %265, float %260
  %267 = fcmp uno float %101, %8
  %268 = select i1 %267, float 0x7FF8000000000000, float %266
  %269 = fcmp oeq float %101, 1.000000e+00
  %270 = or i1 %45, %269
  %271 = select i1 %270, float 1.000000e+00, float %268
  %272 = fadd contract float %95, %271
  br label %273

273:                                              ; preds = %259, %105, %103
  %274 = phi float [ %104, %103 ], [ %106, %105 ], [ %272, %259 ]
  %275 = add nuw nsw i32 %94, 1
  %276 = icmp eq i32 %275, 16
  br i1 %276, label %92, label %93, !llvm.loop !11

277:                                              ; preds = %92
  %278 = tail call float @llvm.fabs.f32(float %274)
  %279 = tail call float @llvm.amdgcn.frexp.mant.f32(float %278)
  %280 = fcmp olt float %279, 0x3FE5555560000000
  %281 = zext i1 %280 to i32
  %282 = tail call float @llvm.amdgcn.ldexp.f32(float %279, i32 %281)
  %283 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %278)
  %284 = sub nsw i32 %283, %281
  %285 = fadd float %282, -1.000000e+00
  %286 = fadd float %282, 1.000000e+00
  %287 = fadd float %286, -1.000000e+00
  %288 = fsub float %282, %287
  %289 = tail call float @llvm.amdgcn.rcp.f32(float %286)
  %290 = fmul float %285, %289
  %291 = fmul float %286, %290
  %292 = fneg float %291
  %293 = tail call float @llvm.fma.f32(float %290, float %286, float %292)
  %294 = tail call float @llvm.fma.f32(float %290, float %288, float %293)
  %295 = fadd float %291, %294
  %296 = fsub float %295, %291
  %297 = fsub float %294, %296
  %298 = fsub float %285, %295
  %299 = fsub float %285, %298
  %300 = fsub float %299, %295
  %301 = fsub float %300, %297
  %302 = fadd float %298, %301
  %303 = fmul float %289, %302
  %304 = fadd float %290, %303
  %305 = fsub float %304, %290
  %306 = fsub float %303, %305
  %307 = fmul float %304, %304
  %308 = fneg float %307
  %309 = tail call float @llvm.fma.f32(float %304, float %304, float %308)
  %310 = fmul float %306, 2.000000e+00
  %311 = tail call float @llvm.fma.f32(float %304, float %310, float %309)
  %312 = fadd float %307, %311
  %313 = fsub float %312, %307
  %314 = fsub float %311, %313
  %315 = tail call float @llvm.fmuladd.f32(float %312, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %316 = tail call float @llvm.fmuladd.f32(float %312, float %315, float 0x3FD999BDE0000000)
  %317 = sitofp i32 %284 to float
  %318 = fmul float %317, 0x3FE62E4300000000
  %319 = fneg float %318
  %320 = tail call float @llvm.fma.f32(float %317, float 0x3FE62E4300000000, float %319)
  %321 = tail call float @llvm.fma.f32(float %317, float 0xBE205C6100000000, float %320)
  %322 = fadd float %318, %321
  %323 = fsub float %322, %318
  %324 = fsub float %321, %323
  %325 = tail call float @llvm.amdgcn.ldexp.f32(float %304, i32 1)
  %326 = fmul float %304, %312
  %327 = fneg float %326
  %328 = tail call float @llvm.fma.f32(float %312, float %304, float %327)
  %329 = tail call float @llvm.fma.f32(float %312, float %306, float %328)
  %330 = tail call float @llvm.fma.f32(float %314, float %304, float %329)
  %331 = fadd float %326, %330
  %332 = fsub float %331, %326
  %333 = fsub float %330, %332
  %334 = fmul float %312, %316
  %335 = fneg float %334
  %336 = tail call float @llvm.fma.f32(float %312, float %316, float %335)
  %337 = tail call float @llvm.fma.f32(float %314, float %316, float %336)
  %338 = fadd float %334, %337
  %339 = fsub float %338, %334
  %340 = fsub float %337, %339
  %341 = fadd float %338, 0x3FE5555540000000
  %342 = fadd float %341, 0xBFE5555540000000
  %343 = fsub float %338, %342
  %344 = fadd float %340, 0x3E2E720200000000
  %345 = fadd float %344, %343
  %346 = fadd float %341, %345
  %347 = fsub float %346, %341
  %348 = fsub float %345, %347
  %349 = fmul float %331, %346
  %350 = fneg float %349
  %351 = tail call float @llvm.fma.f32(float %331, float %346, float %350)
  %352 = tail call float @llvm.fma.f32(float %331, float %348, float %351)
  %353 = tail call float @llvm.fma.f32(float %333, float %346, float %352)
  %354 = tail call float @llvm.amdgcn.ldexp.f32(float %306, i32 1)
  %355 = fadd float %349, %353
  %356 = fsub float %355, %349
  %357 = fsub float %353, %356
  %358 = fadd float %325, %355
  %359 = fsub float %358, %325
  %360 = fsub float %355, %359
  %361 = fadd float %354, %357
  %362 = fadd float %361, %360
  %363 = fadd float %358, %362
  %364 = fsub float %363, %358
  %365 = fsub float %362, %364
  %366 = fadd float %322, %363
  %367 = fsub float %366, %322
  %368 = fsub float %366, %367
  %369 = fsub float %322, %368
  %370 = fsub float %363, %367
  %371 = fadd float %370, %369
  %372 = fadd float %324, %365
  %373 = fsub float %372, %324
  %374 = fsub float %372, %373
  %375 = fsub float %324, %374
  %376 = fsub float %365, %373
  %377 = fadd float %376, %375
  %378 = fadd float %372, %371
  %379 = fadd float %366, %378
  %380 = fsub float %379, %366
  %381 = fsub float %378, %380
  %382 = fadd float %377, %381
  %383 = fadd float %379, %382
  %384 = fsub float %383, %379
  %385 = fsub float %382, %384
  %386 = fmul float %47, %383
  %387 = fneg float %386
  %388 = tail call float @llvm.fma.f32(float %47, float %383, float %387)
  %389 = tail call float @llvm.fma.f32(float %47, float %385, float %388)
  %390 = fadd float %386, %389
  %391 = fsub float %390, %386
  %392 = fsub float %389, %391
  %393 = tail call float @llvm.fabs.f32(float %386) #4
  %394 = fcmp oeq float %393, 0x7FF0000000000000
  %395 = select i1 %394, float %386, float %390
  %396 = tail call float @llvm.fabs.f32(float %395) #4
  %397 = fcmp oeq float %396, 0x7FF0000000000000
  %398 = select i1 %397, float 0.000000e+00, float %392
  %399 = fcmp oeq float %395, 0x40562E4300000000
  %400 = select i1 %399, float 0x3EE0000000000000, float 0.000000e+00
  %401 = fsub float %395, %400
  %402 = fadd float %400, %398
  %403 = fmul float %401, 0x3FF7154760000000
  %404 = tail call float @llvm.rint.f32(float %403)
  %405 = fcmp ogt float %401, 0x40562E4300000000
  %406 = fcmp olt float %401, 0xC059D1DA00000000
  %407 = fneg float %403
  %408 = tail call float @llvm.fma.f32(float %401, float 0x3FF7154760000000, float %407)
  %409 = tail call float @llvm.fma.f32(float %401, float 0x3E54AE0BE0000000, float %408)
  %410 = fsub float %403, %404
  %411 = fadd float %409, %410
  %412 = tail call float @llvm.exp2.f32(float %411)
  %413 = fptosi float %404 to i32
  %414 = tail call float @llvm.amdgcn.ldexp.f32(float %412, i32 %413)
  %415 = select i1 %406, float 0.000000e+00, float %414
  %416 = select i1 %405, float 0x7FF0000000000000, float %415
  %417 = tail call float @llvm.fma.f32(float %416, float %402, float %416)
  %418 = tail call float @llvm.fabs.f32(float %416) #4
  %419 = fcmp oeq float %418, 0x7FF0000000000000
  %420 = select i1 %419, float %416, float %417
  %421 = fcmp olt float %274, 0.000000e+00
  %422 = and i1 %60, %421
  %423 = select i1 %422, float -0.000000e+00, float 0.000000e+00
  %424 = tail call float @llvm.copysign.f32(float %420, float %423)
  %425 = fcmp uge float %274, 0.000000e+00
  %426 = select i1 %425, i1 true, i1 %61
  %427 = select i1 %426, float %424, float 0x7FF8000000000000
  br i1 %62, label %428, label %436

428:                                              ; preds = %277
  %429 = fcmp oeq float %278, 1.000000e+00
  %430 = fadd float %278, -1.000000e+00
  %431 = bitcast float %430 to i32
  %432 = xor i32 %431, %63
  %433 = icmp sgt i32 %432, -1
  %434 = select i1 %433, float 0x7FF0000000000000, float 0.000000e+00
  %435 = select i1 %429, float %278, float %434
  br label %436

436:                                              ; preds = %277, %428
  %437 = phi float [ %427, %277 ], [ %435, %428 ]
  %438 = fcmp oeq float %278, 0x7FF0000000000000
  %439 = fcmp oeq float %274, 0.000000e+00
  %440 = or i1 %439, %438
  %441 = xor i1 %64, %439
  %442 = select i1 %441, float 0.000000e+00, float 0x7FF0000000000000
  %443 = select i1 %60, float %274, float 0.000000e+00
  %444 = tail call float @llvm.copysign.f32(float %442, float %443)
  %445 = select i1 %440, float %444, float %437
  %446 = fcmp uno float %274, %47
  %447 = select i1 %446, float 0x7FF8000000000000, float %445
  %448 = fcmp oeq float %274, 1.000000e+00
  %449 = or i1 %65, %448
  %450 = select i1 %449, float 1.000000e+00, float %447
  br label %451

451:                                              ; preds = %92, %436, %90
  %452 = phi float [ %274, %92 ], [ %450, %436 ], [ %72, %90 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %453 = load i32, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_A, align 4, !tbaa !5
  %454 = add nsw i32 %453, %71
  %455 = load i32, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE6step_B, align 4, !tbaa !5
  %456 = add nsw i32 %455, %70
  %457 = load i32, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE5end_A, align 4, !tbaa !5
  %458 = icmp sgt i32 %454, %457
  br i1 %458, label %66, label %69, !llvm.loop !13

459:                                              ; preds = %66
  %460 = load i32, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_A, align 4, !tbaa !5
  %461 = add nsw i32 %460, %12
  %462 = mul nsw i32 %461, %5
  %463 = load i32, i32 addrspace(3)* @_ZZ19cuComputeNormGlobalPfiiS_iiiS_fbE7begin_B, align 4, !tbaa !5
  %464 = add i32 %463, %11
  %465 = add i32 %464, %462
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds float, float addrspace(1)* %7, i64 %466
  store float %68, float addrspace(1)* %467, align 4, !tbaa !9
  br label %468

468:                                              ; preds = %459, %66
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
