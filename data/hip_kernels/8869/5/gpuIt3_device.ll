; ModuleID = '../data/hip_kernels/8869/5/main.cu'
source_filename = "../data/hip_kernels/8869/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6gpuIt3PfS_S_iiiff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = mul nsw i32 %4, %3
  %19 = mul nsw i32 %18, %5
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %821

21:                                               ; preds = %8
  %22 = icmp eq i32 %17, 0
  br i1 %22, label %23, label %42

23:                                               ; preds = %21
  %24 = load float, float addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = sext i32 %18 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = fadd contract float %24, %27
  %29 = fadd contract float %24, %28
  %30 = sext i32 %3 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fadd contract float %32, %29
  %34 = fadd contract float %24, %33
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fadd contract float %36, %34
  %38 = fmul contract float %24, 6.000000e+00
  %39 = fsub contract float %37, %38
  %40 = fmul contract float %39, %6
  %41 = fadd contract float %24, %40
  store float %41, float addrspace(1)* %0, align 4, !tbaa !7
  br label %814

42:                                               ; preds = %21
  %43 = add nsw i32 %3, -1
  %44 = icmp eq i32 %17, %43
  br i1 %44, label %45, label %71

45:                                               ; preds = %42
  %46 = sext i32 %17 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = add nsw i32 %17, %18
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = fadd contract float %48, %52
  %54 = fadd contract float %48, %53
  %55 = add nsw i32 %17, %3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = fadd contract float %58, %54
  %60 = add nsw i32 %17, -1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  %64 = fadd contract float %63, %59
  %65 = fadd contract float %48, %64
  %66 = fmul contract float %48, 6.000000e+00
  %67 = fsub contract float %65, %66
  %68 = fmul contract float %67, %6
  %69 = fadd contract float %48, %68
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float %69, float addrspace(1)* %70, align 4, !tbaa !7
  br label %814

71:                                               ; preds = %42
  %72 = add nsw i32 %18, -1
  %73 = icmp eq i32 %17, %72
  br i1 %73, label %74, label %100

74:                                               ; preds = %71
  %75 = sext i32 %17 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = add nsw i32 %17, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = fadd contract float %77, %81
  %83 = sub nsw i32 %17, %3
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fadd contract float %82, %86
  %88 = fadd contract float %77, %87
  %89 = add nsw i32 %17, -1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = fadd contract float %92, %88
  %94 = fadd contract float %77, %93
  %95 = fmul contract float %77, 6.000000e+00
  %96 = fsub contract float %94, %95
  %97 = fmul contract float %96, %6
  %98 = fadd contract float %77, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %98, float addrspace(1)* %99, align 4, !tbaa !7
  br label %814

100:                                              ; preds = %71
  %101 = sub nsw i32 %18, %3
  %102 = icmp eq i32 %17, %101
  br i1 %102, label %103, label %129

103:                                              ; preds = %100
  %104 = sext i32 %17 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = add nsw i32 %17, %18
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = fadd contract float %106, %110
  %112 = sub nsw i32 %17, %3
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = fadd contract float %111, %115
  %117 = fadd contract float %106, %116
  %118 = fadd contract float %106, %117
  %119 = add nsw i32 %17, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = fadd contract float %122, %118
  %124 = fmul contract float %106, 6.000000e+00
  %125 = fsub contract float %123, %124
  %126 = fmul contract float %125, %6
  %127 = fadd contract float %106, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  store float %127, float addrspace(1)* %128, align 4, !tbaa !7
  br label %814

129:                                              ; preds = %100
  %130 = add nsw i32 %5, -1
  %131 = mul nsw i32 %130, %18
  %132 = icmp eq i32 %17, %131
  br i1 %132, label %133, label %159

133:                                              ; preds = %129
  %134 = sext i32 %17 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !6
  %137 = sub nsw i32 %17, %18
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = fadd contract float %136, %140
  %142 = fadd contract float %136, %141
  %143 = add nsw i32 %17, %3
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !6
  %147 = fadd contract float %146, %142
  %148 = fadd contract float %136, %147
  %149 = add nsw i32 %17, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = fadd contract float %152, %148
  %154 = fmul contract float %136, 6.000000e+00
  %155 = fsub contract float %153, %154
  %156 = fmul contract float %155, %6
  %157 = fadd contract float %136, %156
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  store float %157, float addrspace(1)* %158, align 4, !tbaa !7
  br label %814

159:                                              ; preds = %129
  %160 = add i32 %43, %131
  %161 = icmp eq i32 %17, %160
  br i1 %161, label %162, label %188

162:                                              ; preds = %159
  %163 = sext i32 %17 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !6
  %166 = sub nsw i32 %17, %18
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  %170 = fadd contract float %165, %169
  %171 = fadd contract float %165, %170
  %172 = add nsw i32 %17, %3
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !6
  %176 = fadd contract float %175, %171
  %177 = add nsw i32 %17, -1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7, !amdgpu.noclobber !6
  %181 = fadd contract float %180, %176
  %182 = fadd contract float %165, %181
  %183 = fmul contract float %165, 6.000000e+00
  %184 = fsub contract float %182, %183
  %185 = fmul contract float %184, %6
  %186 = fadd contract float %165, %185
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  store float %186, float addrspace(1)* %187, align 4, !tbaa !7
  br label %814

188:                                              ; preds = %159
  %189 = add nsw i32 %19, -1
  %190 = icmp eq i32 %17, %189
  br i1 %190, label %191, label %217

191:                                              ; preds = %188
  %192 = sext i32 %17 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7, !amdgpu.noclobber !6
  %195 = sub nsw i32 %17, %18
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7, !amdgpu.noclobber !6
  %199 = fadd contract float %194, %198
  %200 = sub nsw i32 %17, %3
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %1, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7, !amdgpu.noclobber !6
  %204 = fadd contract float %199, %203
  %205 = fadd contract float %194, %204
  %206 = add nsw i32 %17, -1
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7, !amdgpu.noclobber !6
  %210 = fadd contract float %209, %205
  %211 = fadd contract float %194, %210
  %212 = fmul contract float %194, 6.000000e+00
  %213 = fsub contract float %211, %212
  %214 = fmul contract float %213, %6
  %215 = fadd contract float %194, %214
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  store float %215, float addrspace(1)* %216, align 4, !tbaa !7
  br label %814

217:                                              ; preds = %188
  %218 = sub nsw i32 %19, %3
  %219 = icmp eq i32 %17, %218
  br i1 %219, label %220, label %246

220:                                              ; preds = %217
  %221 = sext i32 %17 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %1, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !7, !amdgpu.noclobber !6
  %224 = sub nsw i32 %17, %18
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %1, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !7, !amdgpu.noclobber !6
  %228 = fadd contract float %223, %227
  %229 = sub nsw i32 %17, %3
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %1, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !6
  %233 = fadd contract float %228, %232
  %234 = fadd contract float %223, %233
  %235 = fadd contract float %223, %234
  %236 = add nsw i32 %17, 1
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7, !amdgpu.noclobber !6
  %240 = fadd contract float %239, %235
  %241 = fmul contract float %223, 6.000000e+00
  %242 = fsub contract float %240, %241
  %243 = fmul contract float %242, %6
  %244 = fadd contract float %223, %243
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  store float %244, float addrspace(1)* %245, align 4, !tbaa !7
  br label %814

246:                                              ; preds = %217
  %247 = sub nsw i32 %17, %3
  %248 = icmp slt i32 %247, 0
  br i1 %248, label %249, label %279

249:                                              ; preds = %246
  %250 = sext i32 %17 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %1, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !7, !amdgpu.noclobber !6
  %253 = add nsw i32 %17, %18
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !7, !amdgpu.noclobber !6
  %257 = fadd contract float %252, %256
  %258 = fadd contract float %252, %257
  %259 = add nsw i32 %17, %3
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %1, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !7, !amdgpu.noclobber !6
  %263 = fadd contract float %262, %258
  %264 = add nsw i32 %17, -1
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %1, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !7, !amdgpu.noclobber !6
  %268 = fadd contract float %267, %263
  %269 = add nsw i32 %17, 1
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %1, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7, !amdgpu.noclobber !6
  %273 = fadd contract float %272, %268
  %274 = fmul contract float %252, 6.000000e+00
  %275 = fsub contract float %273, %274
  %276 = fmul contract float %275, %6
  %277 = fadd contract float %252, %276
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 %250
  store float %277, float addrspace(1)* %278, align 4, !tbaa !7
  br label %814

279:                                              ; preds = %246
  %280 = srem i32 %17, %3
  %281 = icmp eq i32 %280, %43
  %282 = icmp slt i32 %17, %18
  %283 = select i1 %281, i1 %282, i1 false
  br i1 %283, label %284, label %313

284:                                              ; preds = %279
  %285 = sext i32 %17 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %1, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !7, !amdgpu.noclobber !6
  %288 = add nsw i32 %17, %18
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7, !amdgpu.noclobber !6
  %292 = fadd contract float %287, %291
  %293 = zext i32 %247 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %1, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !6
  %296 = fadd contract float %292, %295
  %297 = add nsw i32 %17, %3
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %1, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !7, !amdgpu.noclobber !6
  %301 = fadd contract float %296, %300
  %302 = add nsw i32 %17, -1
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7, !amdgpu.noclobber !6
  %306 = fadd contract float %301, %305
  %307 = fadd contract float %287, %306
  %308 = fmul contract float %287, 6.000000e+00
  %309 = fsub contract float %307, %308
  %310 = fmul contract float %309, %6
  %311 = fadd contract float %287, %310
  %312 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  store float %311, float addrspace(1)* %312, align 4, !tbaa !7
  br label %814

313:                                              ; preds = %279
  %314 = add nsw i32 %17, %3
  %315 = icmp sgt i32 %314, %18
  %316 = and i1 %282, %315
  br i1 %316, label %317, label %346

317:                                              ; preds = %313
  %318 = sext i32 %17 to i64
  %319 = getelementptr inbounds float, float addrspace(1)* %1, i64 %318
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !7, !amdgpu.noclobber !6
  %321 = add nsw i32 %17, %18
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds float, float addrspace(1)* %1, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !7, !amdgpu.noclobber !6
  %325 = fadd contract float %320, %324
  %326 = zext i32 %247 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !7, !amdgpu.noclobber !6
  %329 = fadd contract float %325, %328
  %330 = fadd contract float %320, %329
  %331 = add nsw i32 %17, -1
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %1, i64 %332
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !6
  %335 = fadd contract float %334, %330
  %336 = add nsw i32 %17, 1
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %1, i64 %337
  %339 = load float, float addrspace(1)* %338, align 4, !tbaa !7, !amdgpu.noclobber !6
  %340 = fadd contract float %339, %335
  %341 = fmul contract float %320, 6.000000e+00
  %342 = fsub contract float %340, %341
  %343 = fmul contract float %342, %6
  %344 = fadd contract float %320, %343
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %318
  store float %344, float addrspace(1)* %345, align 4, !tbaa !7
  br label %814

346:                                              ; preds = %313
  %347 = icmp eq i32 %280, 0
  %348 = select i1 %347, i1 %282, i1 false
  br i1 %348, label %349, label %377

349:                                              ; preds = %346
  %350 = sext i32 %17 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %1, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !7, !amdgpu.noclobber !6
  %353 = add nsw i32 %17, %18
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds float, float addrspace(1)* %1, i64 %354
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !7, !amdgpu.noclobber !6
  %357 = fadd contract float %352, %356
  %358 = zext i32 %247 to i64
  %359 = getelementptr inbounds float, float addrspace(1)* %1, i64 %358
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !7, !amdgpu.noclobber !6
  %361 = fadd contract float %357, %360
  %362 = sext i32 %314 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %362
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !7, !amdgpu.noclobber !6
  %365 = fadd contract float %361, %364
  %366 = fadd contract float %352, %365
  %367 = add nsw i32 %17, 1
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds float, float addrspace(1)* %1, i64 %368
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !7, !amdgpu.noclobber !6
  %371 = fadd contract float %370, %366
  %372 = fmul contract float %352, 6.000000e+00
  %373 = fsub contract float %371, %372
  %374 = fmul contract float %373, %6
  %375 = fadd contract float %352, %374
  %376 = getelementptr inbounds float, float addrspace(1)* %0, i64 %350
  store float %375, float addrspace(1)* %376, align 4, !tbaa !7
  br label %814

377:                                              ; preds = %346
  %378 = sub nsw i32 %19, %18
  %379 = icmp sgt i32 %17, %378
  br i1 %379, label %380, label %413

380:                                              ; preds = %377
  %381 = mul nsw i32 %43, %4
  %382 = sub nsw i32 %19, %381
  %383 = icmp slt i32 %17, %382
  br i1 %383, label %384, label %413

384:                                              ; preds = %380
  %385 = sext i32 %17 to i64
  %386 = getelementptr inbounds float, float addrspace(1)* %1, i64 %385
  %387 = load float, float addrspace(1)* %386, align 4, !tbaa !7, !amdgpu.noclobber !6
  %388 = sub nsw i32 %17, %18
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %1, i64 %389
  %391 = load float, float addrspace(1)* %390, align 4, !tbaa !7, !amdgpu.noclobber !6
  %392 = fadd contract float %387, %391
  %393 = fadd contract float %387, %392
  %394 = sext i32 %314 to i64
  %395 = getelementptr inbounds float, float addrspace(1)* %1, i64 %394
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !7, !amdgpu.noclobber !6
  %397 = fadd contract float %396, %393
  %398 = add nsw i32 %17, -1
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds float, float addrspace(1)* %1, i64 %399
  %401 = load float, float addrspace(1)* %400, align 4, !tbaa !7, !amdgpu.noclobber !6
  %402 = fadd contract float %401, %397
  %403 = add nsw i32 %17, 1
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float addrspace(1)* %1, i64 %404
  %406 = load float, float addrspace(1)* %405, align 4, !tbaa !7, !amdgpu.noclobber !6
  %407 = fadd contract float %406, %402
  %408 = fmul contract float %387, 6.000000e+00
  %409 = fsub contract float %407, %408
  %410 = fmul contract float %409, %6
  %411 = fadd contract float %387, %410
  %412 = getelementptr inbounds float, float addrspace(1)* %0, i64 %385
  store float %411, float addrspace(1)* %412, align 4, !tbaa !7
  br label %814

413:                                              ; preds = %380, %377
  %414 = icmp sgt i32 %17, %131
  %415 = select i1 %281, i1 %414, i1 false
  br i1 %415, label %416, label %444

416:                                              ; preds = %413
  %417 = sext i32 %17 to i64
  %418 = getelementptr inbounds float, float addrspace(1)* %1, i64 %417
  %419 = load float, float addrspace(1)* %418, align 4, !tbaa !7, !amdgpu.noclobber !6
  %420 = sub nsw i32 %17, %18
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %1, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !7, !amdgpu.noclobber !6
  %424 = fadd contract float %419, %423
  %425 = zext i32 %247 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %1, i64 %425
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !7, !amdgpu.noclobber !6
  %428 = fadd contract float %424, %427
  %429 = sext i32 %314 to i64
  %430 = getelementptr inbounds float, float addrspace(1)* %1, i64 %429
  %431 = load float, float addrspace(1)* %430, align 4, !tbaa !7, !amdgpu.noclobber !6
  %432 = fadd contract float %428, %431
  %433 = add nsw i32 %17, -1
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(1)* %1, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !7, !amdgpu.noclobber !6
  %437 = fadd contract float %432, %436
  %438 = fadd contract float %419, %437
  %439 = fmul contract float %419, 6.000000e+00
  %440 = fsub contract float %438, %439
  %441 = fmul contract float %440, %6
  %442 = fadd contract float %419, %441
  %443 = getelementptr inbounds float, float addrspace(1)* %0, i64 %417
  store float %442, float addrspace(1)* %443, align 4, !tbaa !7
  br label %814

444:                                              ; preds = %413
  %445 = icmp sgt i32 %314, %19
  br i1 %445, label %446, label %475

446:                                              ; preds = %444
  %447 = sext i32 %17 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %1, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !7, !amdgpu.noclobber !6
  %450 = sub nsw i32 %17, %18
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds float, float addrspace(1)* %1, i64 %451
  %453 = load float, float addrspace(1)* %452, align 4, !tbaa !7, !amdgpu.noclobber !6
  %454 = fadd contract float %449, %453
  %455 = zext i32 %247 to i64
  %456 = getelementptr inbounds float, float addrspace(1)* %1, i64 %455
  %457 = load float, float addrspace(1)* %456, align 4, !tbaa !7, !amdgpu.noclobber !6
  %458 = fadd contract float %454, %457
  %459 = fadd contract float %449, %458
  %460 = add nsw i32 %17, -1
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds float, float addrspace(1)* %1, i64 %461
  %463 = load float, float addrspace(1)* %462, align 4, !tbaa !7, !amdgpu.noclobber !6
  %464 = fadd contract float %463, %459
  %465 = add nsw i32 %17, 1
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds float, float addrspace(1)* %1, i64 %466
  %468 = load float, float addrspace(1)* %467, align 4, !tbaa !7, !amdgpu.noclobber !6
  %469 = fadd contract float %468, %464
  %470 = fmul contract float %449, 6.000000e+00
  %471 = fsub contract float %469, %470
  %472 = fmul contract float %471, %6
  %473 = fadd contract float %449, %472
  %474 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  store float %473, float addrspace(1)* %474, align 4, !tbaa !7
  br label %814

475:                                              ; preds = %444
  %476 = select i1 %347, i1 %414, i1 false
  br i1 %476, label %477, label %505

477:                                              ; preds = %475
  %478 = sext i32 %17 to i64
  %479 = getelementptr inbounds float, float addrspace(1)* %1, i64 %478
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !7, !amdgpu.noclobber !6
  %481 = sub nsw i32 %17, %18
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds float, float addrspace(1)* %1, i64 %482
  %484 = load float, float addrspace(1)* %483, align 4, !tbaa !7, !amdgpu.noclobber !6
  %485 = fadd contract float %480, %484
  %486 = zext i32 %247 to i64
  %487 = getelementptr inbounds float, float addrspace(1)* %1, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !7, !amdgpu.noclobber !6
  %489 = fadd contract float %485, %488
  %490 = sext i32 %314 to i64
  %491 = getelementptr inbounds float, float addrspace(1)* %1, i64 %490
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !7, !amdgpu.noclobber !6
  %493 = fadd contract float %489, %492
  %494 = fadd contract float %480, %493
  %495 = add nsw i32 %17, 1
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds float, float addrspace(1)* %1, i64 %496
  %498 = load float, float addrspace(1)* %497, align 4, !tbaa !7, !amdgpu.noclobber !6
  %499 = fadd contract float %498, %494
  %500 = fmul contract float %480, 6.000000e+00
  %501 = fsub contract float %499, %500
  %502 = fmul contract float %501, %6
  %503 = fadd contract float %480, %502
  %504 = getelementptr inbounds float, float addrspace(1)* %0, i64 %478
  store float %503, float addrspace(1)* %504, align 4, !tbaa !7
  br label %814

505:                                              ; preds = %475
  %506 = srem i32 %17, %18
  %507 = icmp eq i32 %506, 0
  br i1 %507, label %508, label %537

508:                                              ; preds = %505
  %509 = sext i32 %17 to i64
  %510 = getelementptr inbounds float, float addrspace(1)* %1, i64 %509
  %511 = load float, float addrspace(1)* %510, align 4, !tbaa !7, !amdgpu.noclobber !6
  %512 = sub nsw i32 %17, %18
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds float, float addrspace(1)* %1, i64 %513
  %515 = load float, float addrspace(1)* %514, align 4, !tbaa !7, !amdgpu.noclobber !6
  %516 = add nsw i32 %17, %18
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(1)* %1, i64 %517
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !7, !amdgpu.noclobber !6
  %520 = fadd contract float %515, %519
  %521 = fadd contract float %511, %520
  %522 = sext i32 %314 to i64
  %523 = getelementptr inbounds float, float addrspace(1)* %1, i64 %522
  %524 = load float, float addrspace(1)* %523, align 4, !tbaa !7, !amdgpu.noclobber !6
  %525 = fadd contract float %524, %521
  %526 = fadd contract float %511, %525
  %527 = add nsw i32 %17, 1
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds float, float addrspace(1)* %1, i64 %528
  %530 = load float, float addrspace(1)* %529, align 4, !tbaa !7, !amdgpu.noclobber !6
  %531 = fadd contract float %530, %526
  %532 = fmul contract float %511, 6.000000e+00
  %533 = fsub contract float %531, %532
  %534 = fmul contract float %533, %6
  %535 = fadd contract float %511, %534
  %536 = getelementptr inbounds float, float addrspace(1)* %0, i64 %509
  store float %535, float addrspace(1)* %536, align 4, !tbaa !7
  br label %814

537:                                              ; preds = %505
  %538 = icmp eq i32 %506, %43
  br i1 %538, label %539, label %568

539:                                              ; preds = %537
  %540 = sext i32 %17 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %1, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !7, !amdgpu.noclobber !6
  %543 = sub nsw i32 %17, %18
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds float, float addrspace(1)* %1, i64 %544
  %546 = load float, float addrspace(1)* %545, align 4, !tbaa !7, !amdgpu.noclobber !6
  %547 = add nsw i32 %17, %18
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float addrspace(1)* %1, i64 %548
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !7, !amdgpu.noclobber !6
  %551 = fadd contract float %546, %550
  %552 = fadd contract float %542, %551
  %553 = sext i32 %314 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %1, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !7, !amdgpu.noclobber !6
  %556 = fadd contract float %555, %552
  %557 = add nsw i32 %17, -1
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds float, float addrspace(1)* %1, i64 %558
  %560 = load float, float addrspace(1)* %559, align 4, !tbaa !7, !amdgpu.noclobber !6
  %561 = fadd contract float %560, %556
  %562 = fadd contract float %542, %561
  %563 = fmul contract float %542, 6.000000e+00
  %564 = fsub contract float %562, %563
  %565 = fmul contract float %564, %6
  %566 = fadd contract float %542, %565
  %567 = getelementptr inbounds float, float addrspace(1)* %0, i64 %540
  store float %566, float addrspace(1)* %567, align 4, !tbaa !7
  br label %814

568:                                              ; preds = %537
  %569 = icmp eq i32 %506, %72
  br i1 %569, label %570, label %599

570:                                              ; preds = %568
  %571 = sext i32 %17 to i64
  %572 = getelementptr inbounds float, float addrspace(1)* %1, i64 %571
  %573 = load float, float addrspace(1)* %572, align 4, !tbaa !7, !amdgpu.noclobber !6
  %574 = sub nsw i32 %17, %18
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %1, i64 %575
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !7, !amdgpu.noclobber !6
  %578 = add nsw i32 %17, %18
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds float, float addrspace(1)* %1, i64 %579
  %581 = load float, float addrspace(1)* %580, align 4, !tbaa !7, !amdgpu.noclobber !6
  %582 = fadd contract float %577, %581
  %583 = zext i32 %247 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %1, i64 %583
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !7, !amdgpu.noclobber !6
  %586 = fadd contract float %582, %585
  %587 = fadd contract float %573, %586
  %588 = add nsw i32 %17, -1
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %1, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !7, !amdgpu.noclobber !6
  %592 = fadd contract float %591, %587
  %593 = fadd contract float %573, %592
  %594 = fmul contract float %573, 6.000000e+00
  %595 = fsub contract float %593, %594
  %596 = fmul contract float %595, %6
  %597 = fadd contract float %573, %596
  %598 = getelementptr inbounds float, float addrspace(1)* %0, i64 %571
  store float %597, float addrspace(1)* %598, align 4, !tbaa !7
  br label %814

599:                                              ; preds = %568
  %600 = icmp eq i32 %506, %101
  br i1 %600, label %601, label %630

601:                                              ; preds = %599
  %602 = sext i32 %17 to i64
  %603 = getelementptr inbounds float, float addrspace(1)* %1, i64 %602
  %604 = load float, float addrspace(1)* %603, align 4, !tbaa !7, !amdgpu.noclobber !6
  %605 = sub nsw i32 %17, %18
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds float, float addrspace(1)* %1, i64 %606
  %608 = load float, float addrspace(1)* %607, align 4, !tbaa !7, !amdgpu.noclobber !6
  %609 = add nsw i32 %17, %18
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds float, float addrspace(1)* %1, i64 %610
  %612 = load float, float addrspace(1)* %611, align 4, !tbaa !7, !amdgpu.noclobber !6
  %613 = fadd contract float %608, %612
  %614 = zext i32 %247 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %1, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !7, !amdgpu.noclobber !6
  %617 = fadd contract float %613, %616
  %618 = fadd contract float %604, %617
  %619 = fadd contract float %604, %618
  %620 = add nsw i32 %17, 1
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds float, float addrspace(1)* %1, i64 %621
  %623 = load float, float addrspace(1)* %622, align 4, !tbaa !7, !amdgpu.noclobber !6
  %624 = fadd contract float %623, %619
  %625 = fmul contract float %604, 6.000000e+00
  %626 = fsub contract float %624, %625
  %627 = fmul contract float %626, %6
  %628 = fadd contract float %604, %627
  %629 = getelementptr inbounds float, float addrspace(1)* %0, i64 %602
  store float %628, float addrspace(1)* %629, align 4, !tbaa !7
  br label %814

630:                                              ; preds = %599
  br i1 %282, label %631, label %663

631:                                              ; preds = %630
  %632 = sext i32 %17 to i64
  %633 = getelementptr inbounds float, float addrspace(1)* %1, i64 %632
  %634 = load float, float addrspace(1)* %633, align 4, !tbaa !7, !amdgpu.noclobber !6
  %635 = add nsw i32 %17, %18
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds float, float addrspace(1)* %1, i64 %636
  %638 = load float, float addrspace(1)* %637, align 4, !tbaa !7, !amdgpu.noclobber !6
  %639 = fadd contract float %634, %638
  %640 = zext i32 %247 to i64
  %641 = getelementptr inbounds float, float addrspace(1)* %1, i64 %640
  %642 = load float, float addrspace(1)* %641, align 4, !tbaa !7, !amdgpu.noclobber !6
  %643 = fadd contract float %639, %642
  %644 = sext i32 %314 to i64
  %645 = getelementptr inbounds float, float addrspace(1)* %1, i64 %644
  %646 = load float, float addrspace(1)* %645, align 4, !tbaa !7, !amdgpu.noclobber !6
  %647 = fadd contract float %643, %646
  %648 = add nsw i32 %17, -1
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds float, float addrspace(1)* %1, i64 %649
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !7, !amdgpu.noclobber !6
  %652 = fadd contract float %647, %651
  %653 = add nsw i32 %17, 1
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds float, float addrspace(1)* %1, i64 %654
  %656 = load float, float addrspace(1)* %655, align 4, !tbaa !7, !amdgpu.noclobber !6
  %657 = fadd contract float %652, %656
  %658 = fmul contract float %634, 6.000000e+00
  %659 = fsub contract float %657, %658
  %660 = fmul contract float %659, %6
  %661 = fadd contract float %634, %660
  %662 = getelementptr inbounds float, float addrspace(1)* %0, i64 %632
  store float %661, float addrspace(1)* %662, align 4, !tbaa !7
  br label %814

663:                                              ; preds = %630
  br i1 %414, label %664, label %696

664:                                              ; preds = %663
  %665 = sext i32 %17 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %1, i64 %665
  %667 = load float, float addrspace(1)* %666, align 4, !tbaa !7, !amdgpu.noclobber !6
  %668 = sub nsw i32 %17, %18
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds float, float addrspace(1)* %1, i64 %669
  %671 = load float, float addrspace(1)* %670, align 4, !tbaa !7, !amdgpu.noclobber !6
  %672 = fadd contract float %667, %671
  %673 = zext i32 %247 to i64
  %674 = getelementptr inbounds float, float addrspace(1)* %1, i64 %673
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !7, !amdgpu.noclobber !6
  %676 = fadd contract float %672, %675
  %677 = sext i32 %314 to i64
  %678 = getelementptr inbounds float, float addrspace(1)* %1, i64 %677
  %679 = load float, float addrspace(1)* %678, align 4, !tbaa !7, !amdgpu.noclobber !6
  %680 = fadd contract float %676, %679
  %681 = add nsw i32 %17, -1
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds float, float addrspace(1)* %1, i64 %682
  %684 = load float, float addrspace(1)* %683, align 4, !tbaa !7, !amdgpu.noclobber !6
  %685 = fadd contract float %680, %684
  %686 = add nsw i32 %17, 1
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds float, float addrspace(1)* %1, i64 %687
  %689 = load float, float addrspace(1)* %688, align 4, !tbaa !7, !amdgpu.noclobber !6
  %690 = fadd contract float %685, %689
  %691 = fmul contract float %667, 6.000000e+00
  %692 = fsub contract float %690, %691
  %693 = fmul contract float %692, %6
  %694 = fadd contract float %667, %693
  %695 = getelementptr inbounds float, float addrspace(1)* %0, i64 %665
  store float %694, float addrspace(1)* %695, align 4, !tbaa !7
  br label %814

696:                                              ; preds = %663
  %697 = icmp slt i32 %506, %3
  br i1 %697, label %698, label %731

698:                                              ; preds = %696
  %699 = sext i32 %17 to i64
  %700 = getelementptr inbounds float, float addrspace(1)* %1, i64 %699
  %701 = load float, float addrspace(1)* %700, align 4, !tbaa !7, !amdgpu.noclobber !6
  %702 = sub nsw i32 %17, %18
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds float, float addrspace(1)* %1, i64 %703
  %705 = load float, float addrspace(1)* %704, align 4, !tbaa !7, !amdgpu.noclobber !6
  %706 = add nsw i32 %17, %18
  %707 = sext i32 %706 to i64
  %708 = getelementptr inbounds float, float addrspace(1)* %1, i64 %707
  %709 = load float, float addrspace(1)* %708, align 4, !tbaa !7, !amdgpu.noclobber !6
  %710 = fadd contract float %705, %709
  %711 = fadd contract float %701, %710
  %712 = sext i32 %314 to i64
  %713 = getelementptr inbounds float, float addrspace(1)* %1, i64 %712
  %714 = load float, float addrspace(1)* %713, align 4, !tbaa !7, !amdgpu.noclobber !6
  %715 = fadd contract float %714, %711
  %716 = add nsw i32 %17, -1
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds float, float addrspace(1)* %1, i64 %717
  %719 = load float, float addrspace(1)* %718, align 4, !tbaa !7, !amdgpu.noclobber !6
  %720 = fadd contract float %719, %715
  %721 = add nsw i32 %17, 1
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds float, float addrspace(1)* %1, i64 %722
  %724 = load float, float addrspace(1)* %723, align 4, !tbaa !7, !amdgpu.noclobber !6
  %725 = fadd contract float %724, %720
  %726 = fmul contract float %701, 6.000000e+00
  %727 = fsub contract float %725, %726
  %728 = fmul contract float %727, %6
  %729 = fadd contract float %701, %728
  %730 = getelementptr inbounds float, float addrspace(1)* %0, i64 %699
  store float %729, float addrspace(1)* %730, align 4, !tbaa !7
  br label %814

731:                                              ; preds = %696
  %732 = add nsw i32 %4, -1
  %733 = mul nsw i32 %732, %3
  %734 = icmp sgt i32 %506, %733
  %735 = sext i32 %17 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %1, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !7
  %738 = sub nsw i32 %17, %18
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds float, float addrspace(1)* %1, i64 %739
  %741 = load float, float addrspace(1)* %740, align 4, !tbaa !7
  %742 = add nsw i32 %17, %18
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds float, float addrspace(1)* %1, i64 %743
  %745 = load float, float addrspace(1)* %744, align 4, !tbaa !7
  %746 = fadd contract float %741, %745
  %747 = zext i32 %247 to i64
  %748 = getelementptr inbounds float, float addrspace(1)* %1, i64 %747
  %749 = load float, float addrspace(1)* %748, align 4, !tbaa !7
  %750 = fadd contract float %746, %749
  br i1 %734, label %751, label %768

751:                                              ; preds = %731
  %752 = fadd contract float %737, %750
  %753 = add nsw i32 %17, -1
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds float, float addrspace(1)* %1, i64 %754
  %756 = load float, float addrspace(1)* %755, align 4, !tbaa !7, !amdgpu.noclobber !6
  %757 = fadd contract float %756, %752
  %758 = add nsw i32 %17, 1
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds float, float addrspace(1)* %1, i64 %759
  %761 = load float, float addrspace(1)* %760, align 4, !tbaa !7, !amdgpu.noclobber !6
  %762 = fadd contract float %761, %757
  %763 = fmul contract float %737, 6.000000e+00
  %764 = fsub contract float %762, %763
  %765 = fmul contract float %764, %6
  %766 = fadd contract float %737, %765
  %767 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  store float %766, float addrspace(1)* %767, align 4, !tbaa !7
  br label %814

768:                                              ; preds = %731
  %769 = sext i32 %314 to i64
  %770 = getelementptr inbounds float, float addrspace(1)* %1, i64 %769
  %771 = load float, float addrspace(1)* %770, align 4, !tbaa !7
  %772 = fadd contract float %750, %771
  br i1 %281, label %773, label %785

773:                                              ; preds = %768
  %774 = add nsw i32 %17, -1
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %1, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !7, !amdgpu.noclobber !6
  %778 = fadd contract float %772, %777
  %779 = fadd contract float %737, %778
  %780 = fmul contract float %737, 6.000000e+00
  %781 = fsub contract float %779, %780
  %782 = fmul contract float %781, %6
  %783 = fadd contract float %737, %782
  %784 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  store float %783, float addrspace(1)* %784, align 4, !tbaa !7
  br label %814

785:                                              ; preds = %768
  br i1 %347, label %786, label %798

786:                                              ; preds = %785
  %787 = fadd contract float %737, %772
  %788 = add nsw i32 %17, 1
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds float, float addrspace(1)* %1, i64 %789
  %791 = load float, float addrspace(1)* %790, align 4, !tbaa !7, !amdgpu.noclobber !6
  %792 = fadd contract float %791, %787
  %793 = fmul contract float %737, 6.000000e+00
  %794 = fsub contract float %792, %793
  %795 = fmul contract float %794, %6
  %796 = fadd contract float %737, %795
  %797 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  store float %796, float addrspace(1)* %797, align 4, !tbaa !7
  br label %814

798:                                              ; preds = %785
  %799 = add nsw i32 %17, -1
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %1, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !7, !amdgpu.noclobber !6
  %803 = fadd contract float %772, %802
  %804 = add nsw i32 %17, 1
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds float, float addrspace(1)* %1, i64 %805
  %807 = load float, float addrspace(1)* %806, align 4, !tbaa !7, !amdgpu.noclobber !6
  %808 = fadd contract float %803, %807
  %809 = fmul contract float %737, 6.000000e+00
  %810 = fsub contract float %808, %809
  %811 = fmul contract float %810, %6
  %812 = fadd contract float %737, %811
  %813 = getelementptr inbounds float, float addrspace(1)* %0, i64 %735
  store float %812, float addrspace(1)* %813, align 4, !tbaa !7
  br label %814

814:                                              ; preds = %45, %103, %162, %220, %284, %349, %416, %477, %539, %601, %664, %751, %786, %798, %773, %698, %631, %570, %508, %446, %384, %317, %249, %191, %133, %74, %23
  %815 = phi i64 [ %46, %45 ], [ %104, %103 ], [ %163, %162 ], [ %221, %220 ], [ %285, %284 ], [ %350, %349 ], [ %417, %416 ], [ %478, %477 ], [ %540, %539 ], [ %602, %601 ], [ %665, %664 ], [ %735, %751 ], [ %735, %786 ], [ %735, %798 ], [ %735, %773 ], [ %699, %698 ], [ %632, %631 ], [ %571, %570 ], [ %509, %508 ], [ %447, %446 ], [ %385, %384 ], [ %318, %317 ], [ %250, %249 ], [ %192, %191 ], [ %134, %133 ], [ %75, %74 ], [ 0, %23 ]
  %816 = getelementptr inbounds float, float addrspace(1)* %2, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = fcmp contract une float %817, %7
  br i1 %818, label %819, label %821

819:                                              ; preds = %814
  %820 = getelementptr inbounds float, float addrspace(1)* %0, i64 %815
  store float %817, float addrspace(1)* %820, align 4, !tbaa !7
  br label %821

821:                                              ; preds = %814, %819, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
