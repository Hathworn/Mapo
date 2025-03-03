; ModuleID = '../data/hip_kernels/1905/0/main.cu'
source_filename = "../data/hip_kernels/1905/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14solvePDEKernelPfS_S_S_ffffififfiifiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture writeonly %3, float %4, float %5, float %6, float %7, i32 %8, float %9, i32 %10, float %11, float %12, i32 %13, i32 %14, float %15, i32 %16, float addrspace(1)* nocapture readonly %17) local_unnamed_addr #0 {
  %19 = fmul contract float %5, %12
  %20 = fmul contract float %6, %7
  %21 = fmul contract float %20, %11
  %22 = fmul contract float %21, %11
  %23 = fdiv contract float %19, %22
  %24 = fmul contract float %20, %9
  %25 = fmul contract float %24, %9
  %26 = fdiv contract float %19, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %30 = mul i32 %29, %10
  %31 = add i32 %30, %27
  %32 = mul i32 %31, %8
  %33 = add i32 %32, %28
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fcmp contract olt float %36, 0x4096C0A3E0000000
  %38 = select i1 %37, float 5.000000e+01, float %5
  %39 = fcmp contract ult float %36, 0x4096C0A3E0000000
  %40 = fcmp contract ugt float %36, 0x4097CAC280000000
  %41 = or i1 %39, %40
  br i1 %41, label %49, label %42

42:                                               ; preds = %18
  %43 = fsub contract float 0x4097CAC280000000, %36
  %44 = fdiv contract float %43, 0x4050A1EA00000000
  %45 = fmul contract float %44, 2.500000e+01
  %46 = fsub contract float 1.000000e+00, %44
  %47 = fmul contract float %46, 5.000000e+01
  %48 = fadd contract float %45, %47
  br label %49

49:                                               ; preds = %42, %18
  %50 = phi float [ %38, %18 ], [ %48, %42 ]
  %51 = fcmp contract ogt float %36, 0x4097CAC280000000
  %52 = select i1 %51, float 2.800000e+01, float %50
  %53 = sitofp i32 %14 to float
  %54 = fmul contract float %53, %12
  %55 = tail call float @llvm.fabs.f32(float %15)
  %56 = fmul contract float %54, %55
  %57 = icmp sgt i32 %16, 0
  br i1 %57, label %58, label %153

58:                                               ; preds = %49
  %59 = mul i32 %29, %16
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = and i32 %16, 3
  %63 = icmp ult i32 %16, 4
  br i1 %63, label %128, label %64

64:                                               ; preds = %58
  %65 = and i32 %16, -4
  br label %66

66:                                               ; preds = %123, %64
  %67 = phi i32 [ 0, %64 ], [ %125, %123 ]
  %68 = phi float [ 0.000000e+00, %64 ], [ %124, %123 ]
  %69 = phi i32 [ 0, %64 ], [ %126, %123 ]
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %17, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fcmp contract ult float %56, %72
  br i1 %73, label %81, label %74

74:                                               ; preds = %66
  %75 = getelementptr inbounds float, float addrspace(1)* %71, i64 1
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fcmp contract ugt float %56, %76
  br i1 %77, label %81, label %78

78:                                               ; preds = %74
  %79 = getelementptr inbounds float, float addrspace(1)* %61, i64 %70
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %81

81:                                               ; preds = %78, %74, %66
  %82 = phi float [ %80, %78 ], [ %68, %74 ], [ %68, %66 ]
  %83 = or i32 %67, 1
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %17, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fcmp contract ult float %56, %86
  br i1 %87, label %95, label %88

88:                                               ; preds = %81
  %89 = getelementptr inbounds float, float addrspace(1)* %85, i64 1
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  %91 = fcmp contract ugt float %56, %90
  br i1 %91, label %95, label %92

92:                                               ; preds = %88
  %93 = getelementptr inbounds float, float addrspace(1)* %61, i64 %84
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %95

95:                                               ; preds = %92, %88, %81
  %96 = phi float [ %94, %92 ], [ %82, %88 ], [ %82, %81 ]
  %97 = or i32 %67, 2
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %17, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = fcmp contract ult float %56, %100
  br i1 %101, label %109, label %102

102:                                              ; preds = %95
  %103 = getelementptr inbounds float, float addrspace(1)* %99, i64 1
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fcmp contract ugt float %56, %104
  br i1 %105, label %109, label %106

106:                                              ; preds = %102
  %107 = getelementptr inbounds float, float addrspace(1)* %61, i64 %98
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %109

109:                                              ; preds = %106, %102, %95
  %110 = phi float [ %108, %106 ], [ %96, %102 ], [ %96, %95 ]
  %111 = or i32 %67, 3
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %17, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = fcmp contract ult float %56, %114
  br i1 %115, label %123, label %116

116:                                              ; preds = %109
  %117 = getelementptr inbounds float, float addrspace(1)* %113, i64 1
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fcmp contract ugt float %56, %118
  br i1 %119, label %123, label %120

120:                                              ; preds = %116
  %121 = getelementptr inbounds float, float addrspace(1)* %61, i64 %112
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %123

123:                                              ; preds = %120, %116, %109
  %124 = phi float [ %122, %120 ], [ %110, %116 ], [ %110, %109 ]
  %125 = add nuw nsw i32 %67, 4
  %126 = add i32 %69, 4
  %127 = icmp eq i32 %126, %65
  br i1 %127, label %128, label %66, !llvm.loop !10

128:                                              ; preds = %123, %58
  %129 = phi float [ undef, %58 ], [ %124, %123 ]
  %130 = phi i32 [ 0, %58 ], [ %125, %123 ]
  %131 = phi float [ 0.000000e+00, %58 ], [ %124, %123 ]
  %132 = icmp eq i32 %62, 0
  br i1 %132, label %153, label %133

133:                                              ; preds = %128, %148
  %134 = phi i32 [ %150, %148 ], [ %130, %128 ]
  %135 = phi float [ %149, %148 ], [ %131, %128 ]
  %136 = phi i32 [ %151, %148 ], [ 0, %128 ]
  %137 = zext i32 %134 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %17, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = fcmp contract ult float %56, %139
  br i1 %140, label %148, label %141

141:                                              ; preds = %133
  %142 = getelementptr inbounds float, float addrspace(1)* %138, i64 1
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = fcmp contract ugt float %56, %143
  br i1 %144, label %148, label %145

145:                                              ; preds = %141
  %146 = getelementptr inbounds float, float addrspace(1)* %61, i64 %137
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %148

148:                                              ; preds = %145, %141, %133
  %149 = phi float [ %147, %145 ], [ %135, %141 ], [ %135, %133 ]
  %150 = add nuw nsw i32 %134, 1
  %151 = add i32 %136, 1
  %152 = icmp eq i32 %151, %62
  br i1 %152, label %153, label %133, !llvm.loop !12

153:                                              ; preds = %128, %148, %49
  %154 = phi float [ 0.000000e+00, %49 ], [ %129, %128 ], [ %149, %148 ]
  %155 = icmp eq i32 %27, 0
  br i1 %155, label %193, label %156

156:                                              ; preds = %153
  %157 = add nsw i32 %10, -1
  %158 = icmp eq i32 %27, %157
  %159 = icmp eq i32 %28, 0
  %160 = select i1 %158, i1 true, i1 %159
  %161 = add nsw i32 %8, -1
  %162 = icmp eq i32 %28, %161
  %163 = select i1 %160, i1 true, i1 %162
  br i1 %163, label %193, label %164

164:                                              ; preds = %156
  %165 = add nsw i32 %33, %8
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !5, !amdgpu.noclobber !9
  %169 = sub nsw i32 %33, %8
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !5, !amdgpu.noclobber !9
  %173 = add nsw i32 %33, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5, !amdgpu.noclobber !9
  %177 = add nsw i32 %33, -1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !5, !amdgpu.noclobber !9
  %181 = fmul contract float %23, %168
  %182 = fmul contract float %23, 2.000000e+00
  %183 = fmul contract float %26, 2.000000e+00
  %184 = fadd contract float %182, %183
  %185 = fadd contract float %184, -1.000000e+00
  %186 = fmul contract float %185, %36
  %187 = fsub contract float %181, %186
  %188 = fmul contract float %23, %172
  %189 = fadd contract float %187, %188
  %190 = fmul contract float %26, %176
  %191 = fadd contract float %189, %190
  %192 = fmul contract float %26, %180
  br label %460

193:                                              ; preds = %156, %153
  %194 = icmp eq i32 %28, 0
  %195 = select i1 %155, i1 %194, i1 false
  br i1 %195, label %196, label %224

196:                                              ; preds = %193
  %197 = add nsw i32 %33, 1
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %1, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !5, !amdgpu.noclobber !9
  %201 = fmul contract float %11, 2.000000e+00
  %202 = fmul contract float %201, %154
  %203 = fsub contract float %36, %4
  %204 = fmul contract float %203, %202
  %205 = fdiv contract float %204, %52
  %206 = fsub contract float %200, %205
  %207 = add nsw i32 %33, %8
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %1, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !5, !amdgpu.noclobber !9
  %211 = fsub contract float %210, %205
  %212 = fmul contract float %23, %210
  %213 = fmul contract float %23, 2.000000e+00
  %214 = fmul contract float %26, 2.000000e+00
  %215 = fadd contract float %213, %214
  %216 = fadd contract float %215, -1.000000e+00
  %217 = fmul contract float %216, %36
  %218 = fsub contract float %212, %217
  %219 = fmul contract float %23, %211
  %220 = fadd contract float %218, %219
  %221 = fmul contract float %26, %200
  %222 = fadd contract float %221, %220
  %223 = fmul contract float %26, %206
  br label %460

224:                                              ; preds = %193
  %225 = add nsw i32 %10, -1
  %226 = icmp eq i32 %27, %225
  %227 = select i1 %226, i1 %194, i1 false
  br i1 %227, label %228, label %256

228:                                              ; preds = %224
  %229 = add nsw i32 %33, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !5, !amdgpu.noclobber !9
  %233 = fmul contract float %11, 2.000000e+00
  %234 = fmul contract float %233, %154
  %235 = fsub contract float %36, %4
  %236 = fmul contract float %235, %234
  %237 = fdiv contract float %236, %52
  %238 = fsub contract float %232, %237
  %239 = sub nsw i32 %33, %8
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !5, !amdgpu.noclobber !9
  %243 = fsub contract float %242, %237
  %244 = fmul contract float %23, %243
  %245 = fmul contract float %23, 2.000000e+00
  %246 = fmul contract float %26, 2.000000e+00
  %247 = fadd contract float %245, %246
  %248 = fadd contract float %247, -1.000000e+00
  %249 = fmul contract float %248, %36
  %250 = fsub contract float %244, %249
  %251 = fmul contract float %23, %242
  %252 = fadd contract float %251, %250
  %253 = fmul contract float %26, %232
  %254 = fadd contract float %253, %252
  %255 = fmul contract float %26, %238
  br label %460

256:                                              ; preds = %224
  %257 = add nsw i32 %8, -1
  %258 = icmp eq i32 %28, %257
  %259 = select i1 %155, i1 %258, i1 false
  br i1 %259, label %260, label %288

260:                                              ; preds = %256
  %261 = add nsw i32 %33, -1
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %1, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !5, !amdgpu.noclobber !9
  %265 = fmul contract float %11, 2.000000e+00
  %266 = fmul contract float %265, %154
  %267 = fsub contract float %36, %4
  %268 = fmul contract float %267, %266
  %269 = fdiv contract float %268, %52
  %270 = fsub contract float %264, %269
  %271 = add nsw i32 %33, %8
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !5, !amdgpu.noclobber !9
  %275 = fsub contract float %274, %269
  %276 = fmul contract float %23, %274
  %277 = fmul contract float %23, 2.000000e+00
  %278 = fmul contract float %26, 2.000000e+00
  %279 = fadd contract float %277, %278
  %280 = fadd contract float %279, -1.000000e+00
  %281 = fmul contract float %280, %36
  %282 = fsub contract float %276, %281
  %283 = fmul contract float %23, %275
  %284 = fadd contract float %282, %283
  %285 = fmul contract float %26, %270
  %286 = fadd contract float %285, %284
  %287 = fmul contract float %26, %264
  br label %460

288:                                              ; preds = %256
  %289 = select i1 %226, i1 %258, i1 false
  br i1 %289, label %290, label %318

290:                                              ; preds = %288
  %291 = add nsw i32 %33, -1
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %1, i64 %292
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !5, !amdgpu.noclobber !9
  %295 = fmul contract float %11, 2.000000e+00
  %296 = fmul contract float %295, %154
  %297 = fsub contract float %36, %4
  %298 = fmul contract float %297, %296
  %299 = fdiv contract float %298, %52
  %300 = fsub contract float %294, %299
  %301 = sub nsw i32 %33, %8
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %1, i64 %302
  %304 = load float, float addrspace(1)* %303, align 4, !tbaa !5, !amdgpu.noclobber !9
  %305 = fsub contract float %304, %299
  %306 = fmul contract float %23, %305
  %307 = fmul contract float %23, 2.000000e+00
  %308 = fmul contract float %26, 2.000000e+00
  %309 = fadd contract float %307, %308
  %310 = fadd contract float %309, -1.000000e+00
  %311 = fmul contract float %310, %36
  %312 = fsub contract float %306, %311
  %313 = fmul contract float %23, %304
  %314 = fadd contract float %313, %312
  %315 = fmul contract float %26, %300
  %316 = fadd contract float %315, %314
  %317 = fmul contract float %26, %294
  br label %460

318:                                              ; preds = %288
  %319 = icmp ne i32 %28, 0
  %320 = select i1 %155, i1 %319, i1 false
  %321 = xor i1 %320, true
  %322 = select i1 %321, i1 true, i1 %258
  br i1 %322, label %354, label %323

323:                                              ; preds = %318
  %324 = add nsw i32 %33, 1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %1, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !5, !amdgpu.noclobber !9
  %328 = add nsw i32 %33, -1
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds float, float addrspace(1)* %1, i64 %329
  %331 = load float, float addrspace(1)* %330, align 4, !tbaa !5, !amdgpu.noclobber !9
  %332 = add nsw i32 %33, %8
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %1, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !5, !amdgpu.noclobber !9
  %336 = fmul contract float %11, 2.000000e+00
  %337 = fmul contract float %336, %154
  %338 = fsub contract float %36, %4
  %339 = fmul contract float %338, %337
  %340 = fdiv contract float %339, %52
  %341 = fsub contract float %335, %340
  %342 = fmul contract float %23, %335
  %343 = fmul contract float %23, 2.000000e+00
  %344 = fmul contract float %26, 2.000000e+00
  %345 = fadd contract float %343, %344
  %346 = fadd contract float %345, -1.000000e+00
  %347 = fmul contract float %346, %36
  %348 = fsub contract float %342, %347
  %349 = fmul contract float %23, %341
  %350 = fadd contract float %348, %349
  %351 = fmul contract float %26, %327
  %352 = fadd contract float %351, %350
  %353 = fmul contract float %26, %331
  br label %460

354:                                              ; preds = %318
  %355 = select i1 %226, i1 %319, i1 false
  %356 = xor i1 %355, true
  %357 = select i1 %356, i1 true, i1 %258
  br i1 %357, label %389, label %358

358:                                              ; preds = %354
  %359 = add nsw i32 %33, 1
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %1, i64 %360
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !5, !amdgpu.noclobber !9
  %363 = add nsw i32 %33, -1
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds float, float addrspace(1)* %1, i64 %364
  %366 = load float, float addrspace(1)* %365, align 4, !tbaa !5, !amdgpu.noclobber !9
  %367 = sub nsw i32 %33, %8
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds float, float addrspace(1)* %1, i64 %368
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !5, !amdgpu.noclobber !9
  %371 = fmul contract float %11, 2.000000e+00
  %372 = fmul contract float %371, %154
  %373 = fsub contract float %36, %4
  %374 = fmul contract float %373, %372
  %375 = fdiv contract float %374, %52
  %376 = fsub contract float %370, %375
  %377 = fmul contract float %23, %376
  %378 = fmul contract float %23, 2.000000e+00
  %379 = fmul contract float %26, 2.000000e+00
  %380 = fadd contract float %378, %379
  %381 = fadd contract float %380, -1.000000e+00
  %382 = fmul contract float %381, %36
  %383 = fsub contract float %377, %382
  %384 = fmul contract float %23, %370
  %385 = fadd contract float %384, %383
  %386 = fmul contract float %26, %362
  %387 = fadd contract float %386, %385
  %388 = fmul contract float %26, %366
  br label %460

389:                                              ; preds = %354
  %390 = xor i1 %155, true
  %391 = icmp ne i32 %27, %225
  %392 = select i1 %390, i1 %391, i1 false
  %393 = select i1 %392, i1 %194, i1 false
  br i1 %393, label %394, label %425

394:                                              ; preds = %389
  %395 = add nsw i32 %33, 1
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %1, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !5, !amdgpu.noclobber !9
  %399 = fmul contract float %11, 2.000000e+00
  %400 = fmul contract float %399, %154
  %401 = fsub contract float %36, %4
  %402 = fmul contract float %401, %400
  %403 = fdiv contract float %402, %52
  %404 = fsub contract float %398, %403
  %405 = add nsw i32 %33, %8
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %1, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !5, !amdgpu.noclobber !9
  %409 = sub nsw i32 %33, %8
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %1, i64 %410
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !5, !amdgpu.noclobber !9
  %413 = fmul contract float %23, %408
  %414 = fmul contract float %23, 2.000000e+00
  %415 = fmul contract float %26, 2.000000e+00
  %416 = fadd contract float %414, %415
  %417 = fadd contract float %416, -1.000000e+00
  %418 = fmul contract float %417, %36
  %419 = fsub contract float %413, %418
  %420 = fmul contract float %23, %412
  %421 = fadd contract float %419, %420
  %422 = fmul contract float %26, %398
  %423 = fadd contract float %422, %421
  %424 = fmul contract float %26, %404
  br label %460

425:                                              ; preds = %389
  %426 = select i1 %155, i1 true, i1 %226
  %427 = xor i1 %426, true
  %428 = select i1 %427, i1 %258, i1 false
  br i1 %428, label %429, label %465

429:                                              ; preds = %425
  %430 = add nsw i32 %33, -1
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %1, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !5, !amdgpu.noclobber !9
  %434 = fmul contract float %11, 2.000000e+00
  %435 = fmul contract float %434, %154
  %436 = fsub contract float %36, %4
  %437 = fmul contract float %436, %435
  %438 = fdiv contract float %437, %52
  %439 = fsub contract float %433, %438
  %440 = add nsw i32 %33, %8
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds float, float addrspace(1)* %1, i64 %441
  %443 = load float, float addrspace(1)* %442, align 4, !tbaa !5, !amdgpu.noclobber !9
  %444 = sub nsw i32 %33, %8
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds float, float addrspace(1)* %1, i64 %445
  %447 = load float, float addrspace(1)* %446, align 4, !tbaa !5, !amdgpu.noclobber !9
  %448 = fmul contract float %23, %443
  %449 = fmul contract float %23, 2.000000e+00
  %450 = fmul contract float %26, 2.000000e+00
  %451 = fadd contract float %449, %450
  %452 = fadd contract float %451, -1.000000e+00
  %453 = fmul contract float %452, %36
  %454 = fsub contract float %448, %453
  %455 = fmul contract float %23, %447
  %456 = fadd contract float %454, %455
  %457 = fmul contract float %26, %439
  %458 = fadd contract float %457, %456
  %459 = fmul contract float %26, %433
  br label %460

460:                                              ; preds = %164, %228, %290, %358, %429, %394, %323, %260, %196
  %461 = phi float [ %222, %196 ], [ %286, %260 ], [ %352, %323 ], [ %423, %394 ], [ %458, %429 ], [ %387, %358 ], [ %316, %290 ], [ %254, %228 ], [ %192, %164 ]
  %462 = phi float [ %223, %196 ], [ %287, %260 ], [ %353, %323 ], [ %424, %394 ], [ %459, %429 ], [ %388, %358 ], [ %317, %290 ], [ %255, %228 ], [ %191, %164 ]
  %463 = fadd contract float %462, %461
  %464 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  store float %463, float addrspace(1)* %464, align 4, !tbaa !5
  br label %465

465:                                              ; preds = %460, %425
  br i1 %155, label %466, label %477

466:                                              ; preds = %465
  %467 = add nsw i32 %8, -1
  %468 = sdiv i32 %467, 2
  %469 = icmp eq i32 %28, %468
  br i1 %469, label %470, label %477

470:                                              ; preds = %466
  %471 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %472 = load float, float addrspace(1)* %471, align 4, !tbaa !5
  %473 = mul i32 %29, %13
  %474 = add i32 %473, %14
  %475 = zext i32 %474 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %3, i64 %475
  store float %472, float addrspace(1)* %476, align 4, !tbaa !5
  br label %477

477:                                              ; preds = %470, %466, %465
  %478 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %479 = load float, float addrspace(1)* %478, align 4, !tbaa !5
  store float %479, float addrspace(1)* %35, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
