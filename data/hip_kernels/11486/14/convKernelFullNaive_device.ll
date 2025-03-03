; ModuleID = '../data/hip_kernels/11486/14/main.cu'
source_filename = "../data/hip_kernels/11486/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19convKernelFullNaivePfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %15, %3
  %25 = add nsw i32 %24, %23
  %26 = add nsw i32 %23, -8
  %27 = icmp slt i32 %23, 8
  %28 = icmp sge i32 %26, %3
  %29 = add nsw i32 %23, -7
  %30 = icmp slt i32 %23, 7
  %31 = icmp sge i32 %29, %3
  %32 = add nsw i32 %23, -6
  %33 = icmp slt i32 %23, 6
  %34 = icmp sge i32 %32, %3
  %35 = add nsw i32 %23, -5
  %36 = icmp slt i32 %23, 5
  %37 = icmp sge i32 %35, %3
  %38 = add nsw i32 %23, -4
  %39 = icmp slt i32 %23, 4
  %40 = icmp sge i32 %38, %3
  %41 = add nsw i32 %23, -3
  %42 = icmp slt i32 %23, 3
  %43 = icmp sge i32 %41, %3
  %44 = add nsw i32 %23, -2
  %45 = icmp slt i32 %23, 2
  %46 = icmp sge i32 %44, %3
  %47 = icmp slt i32 %23, 1
  %48 = icmp sgt i32 %23, %3
  %49 = icmp slt i32 %23, 0
  %50 = icmp sge i32 %23, %3
  %51 = add nsw i32 %23, 1
  %52 = icmp slt i32 %23, -1
  %53 = icmp sge i32 %51, %3
  %54 = add nsw i32 %23, 2
  %55 = icmp slt i32 %23, -2
  %56 = icmp sge i32 %54, %3
  %57 = add nsw i32 %23, 3
  %58 = icmp slt i32 %23, -3
  %59 = icmp sge i32 %57, %3
  %60 = add nsw i32 %23, 4
  %61 = icmp slt i32 %23, -4
  %62 = icmp sge i32 %60, %3
  %63 = add nsw i32 %23, 5
  %64 = icmp slt i32 %23, -5
  %65 = icmp sge i32 %63, %3
  %66 = add nsw i32 %23, 6
  %67 = icmp slt i32 %23, -6
  %68 = icmp sge i32 %66, %3
  %69 = add nsw i32 %23, 7
  %70 = icmp slt i32 %23, -7
  %71 = icmp sge i32 %69, %3
  %72 = add nsw i32 %23, 8
  %73 = icmp slt i32 %23, -8
  %74 = icmp sge i32 %72, %3
  br label %75

75:                                               ; preds = %6, %335
  %76 = phi i32 [ -8, %6 ], [ %342, %335 ]
  %77 = phi float [ 0.000000e+00, %6 ], [ %341, %335 ]
  %78 = add nsw i32 %76, %15
  %79 = icmp slt i32 %78, 0
  %80 = icmp sge i32 %78, %4
  %81 = select i1 %79, i1 true, i1 %80
  %82 = sub nsw i32 8, %76
  %83 = mul nuw nsw i32 %82, 17
  %84 = mul nsw i32 %76, %3
  %85 = add nsw i32 %84, %25
  %86 = select i1 %81, i1 true, i1 %27
  %87 = select i1 %86, i1 true, i1 %28
  br i1 %87, label %96, label %91

88:                                               ; preds = %335
  %89 = sext i32 %25 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  store float %341, float addrspace(1)* %90, align 4, !tbaa !7
  ret void

91:                                               ; preds = %75
  %92 = add nsw i32 %85, -8
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %96

96:                                               ; preds = %75, %91
  %97 = phi float [ %95, %91 ], [ 0.000000e+00, %75 ]
  %98 = add nsw i32 %83, 16
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract float %97, %101
  %103 = fadd contract float %77, %102
  %104 = select i1 %81, i1 true, i1 %30
  %105 = select i1 %104, i1 true, i1 %31
  br i1 %105, label %111, label %106

106:                                              ; preds = %96
  %107 = add nsw i32 %85, -7
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %111

111:                                              ; preds = %96, %106
  %112 = phi float [ %110, %106 ], [ 0.000000e+00, %96 ]
  %113 = add nsw i32 %83, 15
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %103, %117
  %119 = select i1 %81, i1 true, i1 %33
  %120 = select i1 %119, i1 true, i1 %34
  br i1 %120, label %126, label %121

121:                                              ; preds = %111
  %122 = add nsw i32 %85, -6
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %126

126:                                              ; preds = %111, %121
  %127 = phi float [ %125, %121 ], [ 0.000000e+00, %111 ]
  %128 = add nsw i32 %83, 14
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %118, %132
  %134 = select i1 %81, i1 true, i1 %36
  %135 = select i1 %134, i1 true, i1 %37
  br i1 %135, label %141, label %136

136:                                              ; preds = %126
  %137 = add nsw i32 %85, -5
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %141

141:                                              ; preds = %126, %136
  %142 = phi float [ %140, %136 ], [ 0.000000e+00, %126 ]
  %143 = add nsw i32 %83, 13
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = fmul contract float %142, %146
  %148 = fadd contract float %133, %147
  %149 = select i1 %81, i1 true, i1 %39
  %150 = select i1 %149, i1 true, i1 %40
  br i1 %150, label %156, label %151

151:                                              ; preds = %141
  %152 = add nsw i32 %85, -4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %156

156:                                              ; preds = %141, %151
  %157 = phi float [ %155, %151 ], [ 0.000000e+00, %141 ]
  %158 = add nsw i32 %83, 12
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = fmul contract float %157, %161
  %163 = fadd contract float %148, %162
  %164 = select i1 %81, i1 true, i1 %42
  %165 = select i1 %164, i1 true, i1 %43
  br i1 %165, label %171, label %166

166:                                              ; preds = %156
  %167 = add nsw i32 %85, -3
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %171

171:                                              ; preds = %156, %166
  %172 = phi float [ %170, %166 ], [ 0.000000e+00, %156 ]
  %173 = add nsw i32 %83, 11
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %2, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7, !amdgpu.noclobber !5
  %177 = fmul contract float %172, %176
  %178 = fadd contract float %163, %177
  %179 = select i1 %81, i1 true, i1 %45
  %180 = select i1 %179, i1 true, i1 %46
  br i1 %180, label %186, label %181

181:                                              ; preds = %171
  %182 = add nsw i32 %85, -2
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %186

186:                                              ; preds = %171, %181
  %187 = phi float [ %185, %181 ], [ 0.000000e+00, %171 ]
  %188 = add nsw i32 %83, 10
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %2, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !5
  %192 = fmul contract float %187, %191
  %193 = fadd contract float %178, %192
  %194 = select i1 %81, i1 true, i1 %47
  %195 = select i1 %194, i1 true, i1 %48
  br i1 %195, label %201, label %196

196:                                              ; preds = %186
  %197 = add nsw i32 %85, -1
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %201

201:                                              ; preds = %186, %196
  %202 = phi float [ %200, %196 ], [ 0.000000e+00, %186 ]
  %203 = add nsw i32 %83, 9
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %2, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !5
  %207 = fmul contract float %202, %206
  %208 = fadd contract float %193, %207
  %209 = select i1 %81, i1 true, i1 %49
  %210 = select i1 %209, i1 true, i1 %50
  br i1 %210, label %215, label %211

211:                                              ; preds = %201
  %212 = sext i32 %85 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %215

215:                                              ; preds = %201, %211
  %216 = phi float [ %214, %211 ], [ 0.000000e+00, %201 ]
  %217 = add nuw nsw i32 %83, 8
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %2, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7, !amdgpu.noclobber !5
  %221 = fmul contract float %216, %220
  %222 = fadd contract float %208, %221
  %223 = select i1 %81, i1 true, i1 %52
  %224 = select i1 %223, i1 true, i1 %53
  br i1 %224, label %230, label %225

225:                                              ; preds = %215
  %226 = add nsw i32 %85, 1
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %230

230:                                              ; preds = %215, %225
  %231 = phi float [ %229, %225 ], [ 0.000000e+00, %215 ]
  %232 = add nsw i32 %83, 7
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %2, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7, !amdgpu.noclobber !5
  %236 = fmul contract float %231, %235
  %237 = fadd contract float %222, %236
  %238 = select i1 %81, i1 true, i1 %55
  %239 = select i1 %238, i1 true, i1 %56
  br i1 %239, label %245, label %240

240:                                              ; preds = %230
  %241 = add nsw i32 %85, 2
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %0, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %245

245:                                              ; preds = %230, %240
  %246 = phi float [ %244, %240 ], [ 0.000000e+00, %230 ]
  %247 = add nsw i32 %83, 6
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %2, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7, !amdgpu.noclobber !5
  %251 = fmul contract float %246, %250
  %252 = fadd contract float %237, %251
  %253 = select i1 %81, i1 true, i1 %58
  %254 = select i1 %253, i1 true, i1 %59
  br i1 %254, label %260, label %255

255:                                              ; preds = %245
  %256 = add nsw i32 %85, 3
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %0, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %260

260:                                              ; preds = %245, %255
  %261 = phi float [ %259, %255 ], [ 0.000000e+00, %245 ]
  %262 = add nsw i32 %83, 5
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %2, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !7, !amdgpu.noclobber !5
  %266 = fmul contract float %261, %265
  %267 = fadd contract float %252, %266
  %268 = select i1 %81, i1 true, i1 %61
  %269 = select i1 %268, i1 true, i1 %62
  br i1 %269, label %275, label %270

270:                                              ; preds = %260
  %271 = add nsw i32 %85, 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %0, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %275

275:                                              ; preds = %260, %270
  %276 = phi float [ %274, %270 ], [ 0.000000e+00, %260 ]
  %277 = add nsw i32 %83, 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %2, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7, !amdgpu.noclobber !5
  %281 = fmul contract float %276, %280
  %282 = fadd contract float %267, %281
  %283 = select i1 %81, i1 true, i1 %64
  %284 = select i1 %283, i1 true, i1 %65
  br i1 %284, label %290, label %285

285:                                              ; preds = %275
  %286 = add nsw i32 %85, 5
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %290

290:                                              ; preds = %275, %285
  %291 = phi float [ %289, %285 ], [ 0.000000e+00, %275 ]
  %292 = add nsw i32 %83, 3
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %2, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !5
  %296 = fmul contract float %291, %295
  %297 = fadd contract float %282, %296
  %298 = select i1 %81, i1 true, i1 %67
  %299 = select i1 %298, i1 true, i1 %68
  br i1 %299, label %305, label %300

300:                                              ; preds = %290
  %301 = add nsw i32 %85, 6
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %0, i64 %302
  %304 = load float, float addrspace(1)* %303, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %305

305:                                              ; preds = %290, %300
  %306 = phi float [ %304, %300 ], [ 0.000000e+00, %290 ]
  %307 = add nsw i32 %83, 2
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %2, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7, !amdgpu.noclobber !5
  %311 = fmul contract float %306, %310
  %312 = fadd contract float %297, %311
  %313 = select i1 %81, i1 true, i1 %70
  %314 = select i1 %313, i1 true, i1 %71
  br i1 %314, label %320, label %315

315:                                              ; preds = %305
  %316 = add nsw i32 %85, 7
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %0, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %320

320:                                              ; preds = %305, %315
  %321 = phi float [ %319, %315 ], [ 0.000000e+00, %305 ]
  %322 = add nsw i32 %83, 1
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %2, i64 %323
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !7, !amdgpu.noclobber !5
  %326 = fmul contract float %321, %325
  %327 = fadd contract float %312, %326
  %328 = select i1 %81, i1 true, i1 %73
  %329 = select i1 %328, i1 true, i1 %74
  br i1 %329, label %335, label %330

330:                                              ; preds = %320
  %331 = add nsw i32 %85, 8
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %0, i64 %332
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %335

335:                                              ; preds = %320, %330
  %336 = phi float [ %334, %330 ], [ 0.000000e+00, %320 ]
  %337 = sext i32 %83 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %2, i64 %337
  %339 = load float, float addrspace(1)* %338, align 4, !tbaa !7, !amdgpu.noclobber !5
  %340 = fmul contract float %336, %339
  %341 = fadd contract float %327, %340
  %342 = add nsw i32 %76, 1
  %343 = icmp eq i32 %342, 9
  br i1 %343, label %88, label %75, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
