; ModuleID = '../data/hip_kernels/11486/13/main.cu'
source_filename = "../data/hip_kernels/11486/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28convKernelFullNaiveSepKernelPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 16
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = add nsw i32 %23, -7
  %32 = icmp slt i32 %23, 7
  %33 = icmp sge i32 %31, %3
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 15
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %23, -6
  %37 = icmp slt i32 %23, 6
  %38 = icmp sge i32 %36, %3
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 14
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = add nsw i32 %23, -5
  %42 = icmp slt i32 %23, 5
  %43 = icmp sge i32 %41, %3
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 13
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nsw i32 %23, -4
  %47 = icmp slt i32 %23, 4
  %48 = icmp sge i32 %46, %3
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 12
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = add nsw i32 %23, -3
  %52 = icmp slt i32 %23, 3
  %53 = icmp sge i32 %51, %3
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 11
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = add nsw i32 %23, -2
  %57 = icmp slt i32 %23, 2
  %58 = icmp sge i32 %56, %3
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 10
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = icmp slt i32 %23, 1
  %62 = icmp sgt i32 %23, %3
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 9
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = icmp slt i32 %23, 0
  %66 = icmp sge i32 %23, %3
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = add nsw i32 %23, 1
  %70 = icmp slt i32 %23, -1
  %71 = icmp sge i32 %69, %3
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 7
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %23, 2
  %75 = icmp slt i32 %23, -2
  %76 = icmp sge i32 %74, %3
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = add nsw i32 %23, 3
  %80 = icmp slt i32 %23, -3
  %81 = icmp sge i32 %79, %3
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 5
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = add nsw i32 %23, 4
  %85 = icmp slt i32 %23, -4
  %86 = icmp sge i32 %84, %3
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = add nsw i32 %23, 5
  %90 = icmp slt i32 %23, -5
  %91 = icmp sge i32 %89, %3
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = add nsw i32 %23, 6
  %95 = icmp slt i32 %23, -6
  %96 = icmp sge i32 %94, %3
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = add nsw i32 %23, 7
  %100 = icmp slt i32 %23, -7
  %101 = icmp sge i32 %99, %3
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = add nsw i32 %23, 8
  %105 = icmp slt i32 %23, -8
  %106 = icmp sge i32 %104, %3
  %107 = load float, float addrspace(1)* %2, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %108

108:                                              ; preds = %6, %322
  %109 = phi i32 [ -8, %6 ], [ %327, %322 ]
  %110 = phi float [ 0.000000e+00, %6 ], [ %326, %322 ]
  %111 = add nsw i32 %109, %15
  %112 = icmp slt i32 %111, 0
  %113 = icmp sge i32 %111, %4
  %114 = select i1 %112, i1 true, i1 %113
  %115 = sub nsw i32 8, %109
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = mul nsw i32 %109, %3
  %120 = add nsw i32 %119, %25
  %121 = select i1 %114, i1 true, i1 %27
  %122 = select i1 %121, i1 true, i1 %28
  br i1 %122, label %131, label %126

123:                                              ; preds = %322
  %124 = sext i32 %25 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  store float %326, float addrspace(1)* %125, align 4, !tbaa !7
  ret void

126:                                              ; preds = %108
  %127 = add nsw i32 %120, -8
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %131

131:                                              ; preds = %108, %126
  %132 = phi float [ %130, %126 ], [ 0.000000e+00, %108 ]
  %133 = fmul contract float %132, %118
  %134 = fmul contract float %133, %30
  %135 = fadd contract float %110, %134
  %136 = select i1 %114, i1 true, i1 %32
  %137 = select i1 %136, i1 true, i1 %33
  br i1 %137, label %143, label %138

138:                                              ; preds = %131
  %139 = add nsw i32 %120, -7
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %143

143:                                              ; preds = %131, %138
  %144 = phi float [ %142, %138 ], [ 0.000000e+00, %131 ]
  %145 = fmul contract float %144, %118
  %146 = fmul contract float %145, %35
  %147 = fadd contract float %135, %146
  %148 = select i1 %114, i1 true, i1 %37
  %149 = select i1 %148, i1 true, i1 %38
  br i1 %149, label %155, label %150

150:                                              ; preds = %143
  %151 = add nsw i32 %120, -6
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %155

155:                                              ; preds = %143, %150
  %156 = phi float [ %154, %150 ], [ 0.000000e+00, %143 ]
  %157 = fmul contract float %156, %118
  %158 = fmul contract float %157, %40
  %159 = fadd contract float %147, %158
  %160 = select i1 %114, i1 true, i1 %42
  %161 = select i1 %160, i1 true, i1 %43
  br i1 %161, label %167, label %162

162:                                              ; preds = %155
  %163 = add nsw i32 %120, -5
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %167

167:                                              ; preds = %155, %162
  %168 = phi float [ %166, %162 ], [ 0.000000e+00, %155 ]
  %169 = fmul contract float %168, %118
  %170 = fmul contract float %169, %45
  %171 = fadd contract float %159, %170
  %172 = select i1 %114, i1 true, i1 %47
  %173 = select i1 %172, i1 true, i1 %48
  br i1 %173, label %179, label %174

174:                                              ; preds = %167
  %175 = add nsw i32 %120, -4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %179

179:                                              ; preds = %167, %174
  %180 = phi float [ %178, %174 ], [ 0.000000e+00, %167 ]
  %181 = fmul contract float %180, %118
  %182 = fmul contract float %181, %50
  %183 = fadd contract float %171, %182
  %184 = select i1 %114, i1 true, i1 %52
  %185 = select i1 %184, i1 true, i1 %53
  br i1 %185, label %191, label %186

186:                                              ; preds = %179
  %187 = add nsw i32 %120, -3
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %191

191:                                              ; preds = %179, %186
  %192 = phi float [ %190, %186 ], [ 0.000000e+00, %179 ]
  %193 = fmul contract float %192, %118
  %194 = fmul contract float %193, %55
  %195 = fadd contract float %183, %194
  %196 = select i1 %114, i1 true, i1 %57
  %197 = select i1 %196, i1 true, i1 %58
  br i1 %197, label %203, label %198

198:                                              ; preds = %191
  %199 = add nsw i32 %120, -2
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %203

203:                                              ; preds = %191, %198
  %204 = phi float [ %202, %198 ], [ 0.000000e+00, %191 ]
  %205 = fmul contract float %204, %118
  %206 = fmul contract float %205, %60
  %207 = fadd contract float %195, %206
  %208 = select i1 %114, i1 true, i1 %61
  %209 = select i1 %208, i1 true, i1 %62
  br i1 %209, label %215, label %210

210:                                              ; preds = %203
  %211 = add nsw i32 %120, -1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %215

215:                                              ; preds = %203, %210
  %216 = phi float [ %214, %210 ], [ 0.000000e+00, %203 ]
  %217 = fmul contract float %216, %118
  %218 = fmul contract float %217, %64
  %219 = fadd contract float %207, %218
  %220 = select i1 %114, i1 true, i1 %65
  %221 = select i1 %220, i1 true, i1 %66
  br i1 %221, label %226, label %222

222:                                              ; preds = %215
  %223 = sext i32 %120 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %226

226:                                              ; preds = %215, %222
  %227 = phi float [ %225, %222 ], [ 0.000000e+00, %215 ]
  %228 = fmul contract float %227, %118
  %229 = fmul contract float %228, %68
  %230 = fadd contract float %219, %229
  %231 = select i1 %114, i1 true, i1 %70
  %232 = select i1 %231, i1 true, i1 %71
  br i1 %232, label %238, label %233

233:                                              ; preds = %226
  %234 = add nsw i32 %120, 1
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %238

238:                                              ; preds = %226, %233
  %239 = phi float [ %237, %233 ], [ 0.000000e+00, %226 ]
  %240 = fmul contract float %239, %118
  %241 = fmul contract float %240, %73
  %242 = fadd contract float %230, %241
  %243 = select i1 %114, i1 true, i1 %75
  %244 = select i1 %243, i1 true, i1 %76
  br i1 %244, label %250, label %245

245:                                              ; preds = %238
  %246 = add nsw i32 %120, 2
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %0, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %250

250:                                              ; preds = %238, %245
  %251 = phi float [ %249, %245 ], [ 0.000000e+00, %238 ]
  %252 = fmul contract float %251, %118
  %253 = fmul contract float %252, %78
  %254 = fadd contract float %242, %253
  %255 = select i1 %114, i1 true, i1 %80
  %256 = select i1 %255, i1 true, i1 %81
  br i1 %256, label %262, label %257

257:                                              ; preds = %250
  %258 = add nsw i32 %120, 3
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %262

262:                                              ; preds = %250, %257
  %263 = phi float [ %261, %257 ], [ 0.000000e+00, %250 ]
  %264 = fmul contract float %263, %118
  %265 = fmul contract float %264, %83
  %266 = fadd contract float %254, %265
  %267 = select i1 %114, i1 true, i1 %85
  %268 = select i1 %267, i1 true, i1 %86
  br i1 %268, label %274, label %269

269:                                              ; preds = %262
  %270 = add nsw i32 %120, 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %0, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %274

274:                                              ; preds = %262, %269
  %275 = phi float [ %273, %269 ], [ 0.000000e+00, %262 ]
  %276 = fmul contract float %275, %118
  %277 = fmul contract float %276, %88
  %278 = fadd contract float %266, %277
  %279 = select i1 %114, i1 true, i1 %90
  %280 = select i1 %279, i1 true, i1 %91
  br i1 %280, label %286, label %281

281:                                              ; preds = %274
  %282 = add nsw i32 %120, 5
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %0, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %286

286:                                              ; preds = %274, %281
  %287 = phi float [ %285, %281 ], [ 0.000000e+00, %274 ]
  %288 = fmul contract float %287, %118
  %289 = fmul contract float %288, %93
  %290 = fadd contract float %278, %289
  %291 = select i1 %114, i1 true, i1 %95
  %292 = select i1 %291, i1 true, i1 %96
  br i1 %292, label %298, label %293

293:                                              ; preds = %286
  %294 = add nsw i32 %120, 6
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %0, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %298

298:                                              ; preds = %286, %293
  %299 = phi float [ %297, %293 ], [ 0.000000e+00, %286 ]
  %300 = fmul contract float %299, %118
  %301 = fmul contract float %300, %98
  %302 = fadd contract float %290, %301
  %303 = select i1 %114, i1 true, i1 %100
  %304 = select i1 %303, i1 true, i1 %101
  br i1 %304, label %310, label %305

305:                                              ; preds = %298
  %306 = add nsw i32 %120, 7
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %310

310:                                              ; preds = %298, %305
  %311 = phi float [ %309, %305 ], [ 0.000000e+00, %298 ]
  %312 = fmul contract float %311, %118
  %313 = fmul contract float %312, %103
  %314 = fadd contract float %302, %313
  %315 = select i1 %114, i1 true, i1 %105
  %316 = select i1 %315, i1 true, i1 %106
  br i1 %316, label %322, label %317

317:                                              ; preds = %310
  %318 = add nsw i32 %120, 8
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %0, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %322

322:                                              ; preds = %310, %317
  %323 = phi float [ %321, %317 ], [ 0.000000e+00, %310 ]
  %324 = fmul contract float %323, %118
  %325 = fmul contract float %324, %107
  %326 = fadd contract float %314, %325
  %327 = add nsw i32 %109, 1
  %328 = icmp eq i32 %327, 9
  br i1 %328, label %123, label %108, !llvm.loop !11
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
