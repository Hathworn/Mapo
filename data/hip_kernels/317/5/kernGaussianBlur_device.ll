; ModuleID = '../data/hip_kernels/317/5/main.cu'
source_filename = "../data/hip_kernels/317/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16kernGaussianBluriiPhS_(i32 %0, i32 %1, i8 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %0
  %23 = icmp slt i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %831

25:                                               ; preds = %4
  %26 = add nsw i32 %13, -2
  %27 = icmp sgt i32 %13, 1
  %28 = icmp slt i32 %26, %0
  %29 = add nsw i32 %21, -2
  %30 = icmp sgt i32 %21, 1
  %31 = select i1 %27, i1 %30, i1 false
  %32 = select i1 %31, i1 %28, i1 false
  %33 = icmp slt i32 %29, %1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %59

35:                                               ; preds = %25
  %36 = mul nsw i32 %29, %0
  %37 = add nsw i32 %36, %26
  %38 = mul nsw i32 %37, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !5
  %42 = uitofp i8 %41 to float
  %43 = fmul contract float %42, 0x3F6ED7C700000000
  %44 = fadd contract float %43, 0.000000e+00
  %45 = add nsw i32 %38, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = uitofp i8 %48 to float
  %50 = fmul contract float %49, 0x3F6ED7C700000000
  %51 = fadd contract float %50, 0.000000e+00
  %52 = add nsw i32 %38, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = uitofp i8 %55 to float
  %57 = fmul contract float %56, 0x3F6ED7C700000000
  %58 = fadd contract float %57, 0.000000e+00
  br label %59

59:                                               ; preds = %35, %25
  %60 = phi float [ %58, %35 ], [ 0.000000e+00, %25 ]
  %61 = phi float [ %51, %35 ], [ 0.000000e+00, %25 ]
  %62 = phi float [ %44, %35 ], [ 0.000000e+00, %25 ]
  %63 = add nsw i32 %21, -1
  %64 = icmp sgt i32 %21, 0
  %65 = select i1 %27, i1 %64, i1 false
  %66 = select i1 %65, i1 %28, i1 false
  %67 = icmp sle i32 %21, %1
  %68 = select i1 %66, i1 %67, i1 false
  br i1 %68, label %69, label %93

69:                                               ; preds = %59
  %70 = mul nsw i32 %63, %0
  %71 = add nsw i32 %70, %26
  %72 = mul nsw i32 %71, 3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7, !amdgpu.noclobber !5
  %76 = uitofp i8 %75 to float
  %77 = fmul contract float %76, 0x3F8EC24800000000
  %78 = fadd contract float %62, %77
  %79 = add nsw i32 %72, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = uitofp i8 %82 to float
  %84 = fmul contract float %83, 0x3F8EC24800000000
  %85 = fadd contract float %61, %84
  %86 = add nsw i32 %72, 2
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !7, !amdgpu.noclobber !5
  %90 = uitofp i8 %89 to float
  %91 = fmul contract float %90, 0x3F8EC24800000000
  %92 = fadd contract float %60, %91
  br label %93

93:                                               ; preds = %69, %59
  %94 = phi float [ %92, %69 ], [ %60, %59 ]
  %95 = phi float [ %85, %69 ], [ %61, %59 ]
  %96 = phi float [ %78, %69 ], [ %62, %59 ]
  %97 = icmp sgt i32 %21, -1
  %98 = select i1 %27, i1 %97, i1 false
  %99 = select i1 %98, i1 %28, i1 false
  br i1 %99, label %100, label %124

100:                                              ; preds = %93
  %101 = mul nsw i32 %21, %0
  %102 = add nsw i32 %101, %26
  %103 = mul nsw i32 %102, 3
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %104
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7, !amdgpu.noclobber !5
  %107 = uitofp i8 %106 to float
  %108 = fmul contract float %107, 0x3F985CEE20000000
  %109 = fadd contract float %96, %108
  %110 = add nsw i32 %103, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %111
  %113 = load i8, i8 addrspace(1)* %112, align 1, !tbaa !7, !amdgpu.noclobber !5
  %114 = uitofp i8 %113 to float
  %115 = fmul contract float %114, 0x3F985CEE20000000
  %116 = fadd contract float %95, %115
  %117 = add nsw i32 %103, 2
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %118
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !7, !amdgpu.noclobber !5
  %121 = uitofp i8 %120 to float
  %122 = fmul contract float %121, 0x3F985CEE20000000
  %123 = fadd contract float %94, %122
  br label %124

124:                                              ; preds = %100, %93
  %125 = phi float [ %123, %100 ], [ %94, %93 ]
  %126 = phi float [ %116, %100 ], [ %95, %93 ]
  %127 = phi float [ %109, %100 ], [ %96, %93 ]
  %128 = add nsw i32 %21, 1
  %129 = icmp sgt i32 %21, -2
  %130 = select i1 %27, i1 %129, i1 false
  %131 = select i1 %130, i1 %28, i1 false
  %132 = icmp slt i32 %128, %1
  %133 = select i1 %131, i1 %132, i1 false
  br i1 %133, label %134, label %158

134:                                              ; preds = %124
  %135 = mul nsw i32 %128, %0
  %136 = add nsw i32 %135, %26
  %137 = mul nsw i32 %136, 3
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %138
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7, !amdgpu.noclobber !5
  %141 = uitofp i8 %140 to float
  %142 = fmul contract float %141, 0x3F8EC24800000000
  %143 = fadd contract float %127, %142
  %144 = add nsw i32 %137, 1
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %145
  %147 = load i8, i8 addrspace(1)* %146, align 1, !tbaa !7, !amdgpu.noclobber !5
  %148 = uitofp i8 %147 to float
  %149 = fmul contract float %148, 0x3F8EC24800000000
  %150 = fadd contract float %126, %149
  %151 = add nsw i32 %137, 2
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7, !amdgpu.noclobber !5
  %155 = uitofp i8 %154 to float
  %156 = fmul contract float %155, 0x3F8EC24800000000
  %157 = fadd contract float %125, %156
  br label %158

158:                                              ; preds = %134, %124
  %159 = phi float [ %157, %134 ], [ %125, %124 ]
  %160 = phi float [ %150, %134 ], [ %126, %124 ]
  %161 = phi float [ %143, %134 ], [ %127, %124 ]
  %162 = add nsw i32 %21, 2
  %163 = icmp sgt i32 %21, -3
  %164 = select i1 %27, i1 %163, i1 false
  %165 = select i1 %164, i1 %28, i1 false
  %166 = icmp slt i32 %162, %1
  %167 = select i1 %165, i1 %166, i1 false
  br i1 %167, label %168, label %192

168:                                              ; preds = %158
  %169 = mul nsw i32 %162, %0
  %170 = add nsw i32 %169, %26
  %171 = mul nsw i32 %170, 3
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %172
  %174 = load i8, i8 addrspace(1)* %173, align 1, !tbaa !7, !amdgpu.noclobber !5
  %175 = uitofp i8 %174 to float
  %176 = fmul contract float %175, 0x3F6ED7C700000000
  %177 = fadd contract float %161, %176
  %178 = add nsw i32 %171, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %179
  %181 = load i8, i8 addrspace(1)* %180, align 1, !tbaa !7, !amdgpu.noclobber !5
  %182 = uitofp i8 %181 to float
  %183 = fmul contract float %182, 0x3F6ED7C700000000
  %184 = fadd contract float %160, %183
  %185 = add nsw i32 %171, 2
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %186
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !7, !amdgpu.noclobber !5
  %189 = uitofp i8 %188 to float
  %190 = fmul contract float %189, 0x3F6ED7C700000000
  %191 = fadd contract float %159, %190
  br label %192

192:                                              ; preds = %168, %158
  %193 = phi float [ %191, %168 ], [ %159, %158 ]
  %194 = phi float [ %184, %168 ], [ %160, %158 ]
  %195 = phi float [ %177, %168 ], [ %161, %158 ]
  %196 = add nsw i32 %13, -1
  %197 = icmp sgt i32 %13, 0
  %198 = icmp sle i32 %13, %0
  %199 = select i1 %197, i1 %30, i1 false
  %200 = select i1 %199, i1 %198, i1 false
  %201 = select i1 %200, i1 %33, i1 false
  br i1 %201, label %202, label %226

202:                                              ; preds = %192
  %203 = mul nsw i32 %29, %0
  %204 = add nsw i32 %203, %196
  %205 = mul nsw i32 %204, 3
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %206
  %208 = load i8, i8 addrspace(1)* %207, align 1, !tbaa !7, !amdgpu.noclobber !5
  %209 = uitofp i8 %208 to float
  %210 = fmul contract float %209, 0x3F8EC24800000000
  %211 = fadd contract float %195, %210
  %212 = add nsw i32 %205, 1
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %213
  %215 = load i8, i8 addrspace(1)* %214, align 1, !tbaa !7, !amdgpu.noclobber !5
  %216 = uitofp i8 %215 to float
  %217 = fmul contract float %216, 0x3F8EC24800000000
  %218 = fadd contract float %194, %217
  %219 = add nsw i32 %205, 2
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %220
  %222 = load i8, i8 addrspace(1)* %221, align 1, !tbaa !7, !amdgpu.noclobber !5
  %223 = uitofp i8 %222 to float
  %224 = fmul contract float %223, 0x3F8EC24800000000
  %225 = fadd contract float %193, %224
  br label %226

226:                                              ; preds = %202, %192
  %227 = phi float [ %225, %202 ], [ %193, %192 ]
  %228 = phi float [ %218, %202 ], [ %194, %192 ]
  %229 = phi float [ %211, %202 ], [ %195, %192 ]
  %230 = select i1 %197, i1 %64, i1 false
  %231 = select i1 %230, i1 %198, i1 false
  %232 = select i1 %231, i1 %67, i1 false
  br i1 %232, label %233, label %257

233:                                              ; preds = %226
  %234 = mul nsw i32 %63, %0
  %235 = add nsw i32 %234, %196
  %236 = mul nsw i32 %235, 3
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %237
  %239 = load i8, i8 addrspace(1)* %238, align 1, !tbaa !7, !amdgpu.noclobber !5
  %240 = uitofp i8 %239 to float
  %241 = fmul contract float %240, 0x3FAEACC920000000
  %242 = fadd contract float %229, %241
  %243 = add nsw i32 %236, 1
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %244
  %246 = load i8, i8 addrspace(1)* %245, align 1, !tbaa !7, !amdgpu.noclobber !5
  %247 = uitofp i8 %246 to float
  %248 = fmul contract float %247, 0x3FAEACC920000000
  %249 = fadd contract float %228, %248
  %250 = add nsw i32 %236, 2
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %251
  %253 = load i8, i8 addrspace(1)* %252, align 1, !tbaa !7, !amdgpu.noclobber !5
  %254 = uitofp i8 %253 to float
  %255 = fmul contract float %254, 0x3FAEACC920000000
  %256 = fadd contract float %227, %255
  br label %257

257:                                              ; preds = %233, %226
  %258 = phi float [ %256, %233 ], [ %227, %226 ]
  %259 = phi float [ %249, %233 ], [ %228, %226 ]
  %260 = phi float [ %242, %233 ], [ %229, %226 ]
  %261 = select i1 %197, i1 %97, i1 false
  %262 = select i1 %261, i1 %198, i1 false
  br i1 %262, label %263, label %287

263:                                              ; preds = %257
  %264 = mul nsw i32 %21, %0
  %265 = add nsw i32 %264, %196
  %266 = mul nsw i32 %265, 3
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %267
  %269 = load i8, i8 addrspace(1)* %268, align 1, !tbaa !7, !amdgpu.noclobber !5
  %270 = uitofp i8 %269 to float
  %271 = fmul contract float %270, 0x3FB84BD340000000
  %272 = fadd contract float %260, %271
  %273 = add nsw i32 %266, 1
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %274
  %276 = load i8, i8 addrspace(1)* %275, align 1, !tbaa !7, !amdgpu.noclobber !5
  %277 = uitofp i8 %276 to float
  %278 = fmul contract float %277, 0x3FB84BD340000000
  %279 = fadd contract float %259, %278
  %280 = add nsw i32 %266, 2
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %281
  %283 = load i8, i8 addrspace(1)* %282, align 1, !tbaa !7, !amdgpu.noclobber !5
  %284 = uitofp i8 %283 to float
  %285 = fmul contract float %284, 0x3FB84BD340000000
  %286 = fadd contract float %258, %285
  br label %287

287:                                              ; preds = %263, %257
  %288 = phi float [ %286, %263 ], [ %258, %257 ]
  %289 = phi float [ %279, %263 ], [ %259, %257 ]
  %290 = phi float [ %272, %263 ], [ %260, %257 ]
  %291 = select i1 %197, i1 %129, i1 false
  %292 = select i1 %291, i1 %198, i1 false
  %293 = select i1 %292, i1 %132, i1 false
  br i1 %293, label %294, label %318

294:                                              ; preds = %287
  %295 = mul nsw i32 %128, %0
  %296 = add nsw i32 %295, %196
  %297 = mul nsw i32 %296, 3
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %298
  %300 = load i8, i8 addrspace(1)* %299, align 1, !tbaa !7, !amdgpu.noclobber !5
  %301 = uitofp i8 %300 to float
  %302 = fmul contract float %301, 0x3FAEACC920000000
  %303 = fadd contract float %290, %302
  %304 = add nsw i32 %297, 1
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %305
  %307 = load i8, i8 addrspace(1)* %306, align 1, !tbaa !7, !amdgpu.noclobber !5
  %308 = uitofp i8 %307 to float
  %309 = fmul contract float %308, 0x3FAEACC920000000
  %310 = fadd contract float %289, %309
  %311 = add nsw i32 %297, 2
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %312
  %314 = load i8, i8 addrspace(1)* %313, align 1, !tbaa !7, !amdgpu.noclobber !5
  %315 = uitofp i8 %314 to float
  %316 = fmul contract float %315, 0x3FAEACC920000000
  %317 = fadd contract float %288, %316
  br label %318

318:                                              ; preds = %294, %287
  %319 = phi float [ %317, %294 ], [ %288, %287 ]
  %320 = phi float [ %310, %294 ], [ %289, %287 ]
  %321 = phi float [ %303, %294 ], [ %290, %287 ]
  %322 = select i1 %197, i1 %163, i1 false
  %323 = select i1 %322, i1 %198, i1 false
  %324 = select i1 %323, i1 %166, i1 false
  br i1 %324, label %325, label %349

325:                                              ; preds = %318
  %326 = mul nsw i32 %162, %0
  %327 = add nsw i32 %326, %196
  %328 = mul nsw i32 %327, 3
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %329
  %331 = load i8, i8 addrspace(1)* %330, align 1, !tbaa !7, !amdgpu.noclobber !5
  %332 = uitofp i8 %331 to float
  %333 = fmul contract float %332, 0x3F8EC24800000000
  %334 = fadd contract float %321, %333
  %335 = add nsw i32 %328, 1
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %336
  %338 = load i8, i8 addrspace(1)* %337, align 1, !tbaa !7, !amdgpu.noclobber !5
  %339 = uitofp i8 %338 to float
  %340 = fmul contract float %339, 0x3F8EC24800000000
  %341 = fadd contract float %320, %340
  %342 = add nsw i32 %328, 2
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %343
  %345 = load i8, i8 addrspace(1)* %344, align 1, !tbaa !7, !amdgpu.noclobber !5
  %346 = uitofp i8 %345 to float
  %347 = fmul contract float %346, 0x3F8EC24800000000
  %348 = fadd contract float %319, %347
  br label %349

349:                                              ; preds = %325, %318
  %350 = phi float [ %348, %325 ], [ %319, %318 ]
  %351 = phi float [ %341, %325 ], [ %320, %318 ]
  %352 = phi float [ %334, %325 ], [ %321, %318 ]
  %353 = icmp sgt i32 %13, -1
  %354 = select i1 %353, i1 %30, i1 false
  %355 = select i1 %354, i1 %33, i1 false
  br i1 %355, label %356, label %380

356:                                              ; preds = %349
  %357 = mul nsw i32 %29, %0
  %358 = add nsw i32 %357, %13
  %359 = mul nsw i32 %358, 3
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %360
  %362 = load i8, i8 addrspace(1)* %361, align 1, !tbaa !7, !amdgpu.noclobber !5
  %363 = uitofp i8 %362 to float
  %364 = fmul contract float %363, 0x3F985CEE20000000
  %365 = fadd contract float %352, %364
  %366 = add nsw i32 %359, 1
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %367
  %369 = load i8, i8 addrspace(1)* %368, align 1, !tbaa !7, !amdgpu.noclobber !5
  %370 = uitofp i8 %369 to float
  %371 = fmul contract float %370, 0x3F985CEE20000000
  %372 = fadd contract float %351, %371
  %373 = add nsw i32 %359, 2
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %374
  %376 = load i8, i8 addrspace(1)* %375, align 1, !tbaa !7, !amdgpu.noclobber !5
  %377 = uitofp i8 %376 to float
  %378 = fmul contract float %377, 0x3F985CEE20000000
  %379 = fadd contract float %350, %378
  br label %380

380:                                              ; preds = %356, %349
  %381 = phi float [ %379, %356 ], [ %350, %349 ]
  %382 = phi float [ %372, %356 ], [ %351, %349 ]
  %383 = phi float [ %365, %356 ], [ %352, %349 ]
  %384 = select i1 %353, i1 %64, i1 false
  %385 = select i1 %384, i1 %67, i1 false
  br i1 %385, label %386, label %410

386:                                              ; preds = %380
  %387 = mul nsw i32 %63, %0
  %388 = add nsw i32 %387, %13
  %389 = mul nsw i32 %388, 3
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %390
  %392 = load i8, i8 addrspace(1)* %391, align 1, !tbaa !7, !amdgpu.noclobber !5
  %393 = uitofp i8 %392 to float
  %394 = fmul contract float %393, 0x3FB84BD340000000
  %395 = fadd contract float %383, %394
  %396 = add nsw i32 %389, 1
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %397
  %399 = load i8, i8 addrspace(1)* %398, align 1, !tbaa !7, !amdgpu.noclobber !5
  %400 = uitofp i8 %399 to float
  %401 = fmul contract float %400, 0x3FB84BD340000000
  %402 = fadd contract float %382, %401
  %403 = add nsw i32 %389, 2
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %404
  %406 = load i8, i8 addrspace(1)* %405, align 1, !tbaa !7, !amdgpu.noclobber !5
  %407 = uitofp i8 %406 to float
  %408 = fmul contract float %407, 0x3FB84BD340000000
  %409 = fadd contract float %381, %408
  br label %410

410:                                              ; preds = %386, %380
  %411 = phi float [ %409, %386 ], [ %381, %380 ]
  %412 = phi float [ %402, %386 ], [ %382, %380 ]
  %413 = phi float [ %395, %386 ], [ %383, %380 ]
  %414 = select i1 %353, i1 %97, i1 false
  br i1 %414, label %415, label %439

415:                                              ; preds = %410
  %416 = mul nsw i32 %21, %0
  %417 = add nsw i32 %416, %13
  %418 = mul nsw i32 %417, 3
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %419
  %421 = load i8, i8 addrspace(1)* %420, align 1, !tbaa !7, !amdgpu.noclobber !5
  %422 = uitofp i8 %421 to float
  %423 = fmul contract float %422, 0x3FC33E6820000000
  %424 = fadd contract float %413, %423
  %425 = add nsw i32 %418, 1
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %426
  %428 = load i8, i8 addrspace(1)* %427, align 1, !tbaa !7, !amdgpu.noclobber !5
  %429 = uitofp i8 %428 to float
  %430 = fmul contract float %429, 0x3FC33E6820000000
  %431 = fadd contract float %412, %430
  %432 = add nsw i32 %418, 2
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %433
  %435 = load i8, i8 addrspace(1)* %434, align 1, !tbaa !7, !amdgpu.noclobber !5
  %436 = uitofp i8 %435 to float
  %437 = fmul contract float %436, 0x3FC33E6820000000
  %438 = fadd contract float %411, %437
  br label %439

439:                                              ; preds = %415, %410
  %440 = phi float [ %438, %415 ], [ %411, %410 ]
  %441 = phi float [ %431, %415 ], [ %412, %410 ]
  %442 = phi float [ %424, %415 ], [ %413, %410 ]
  %443 = select i1 %353, i1 %129, i1 false
  %444 = select i1 %443, i1 %132, i1 false
  br i1 %444, label %445, label %469

445:                                              ; preds = %439
  %446 = mul nsw i32 %128, %0
  %447 = add nsw i32 %446, %13
  %448 = mul nsw i32 %447, 3
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %449
  %451 = load i8, i8 addrspace(1)* %450, align 1, !tbaa !7, !amdgpu.noclobber !5
  %452 = uitofp i8 %451 to float
  %453 = fmul contract float %452, 0x3FB84BD340000000
  %454 = fadd contract float %442, %453
  %455 = add nsw i32 %448, 1
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %456
  %458 = load i8, i8 addrspace(1)* %457, align 1, !tbaa !7, !amdgpu.noclobber !5
  %459 = uitofp i8 %458 to float
  %460 = fmul contract float %459, 0x3FB84BD340000000
  %461 = fadd contract float %441, %460
  %462 = add nsw i32 %448, 2
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %463
  %465 = load i8, i8 addrspace(1)* %464, align 1, !tbaa !7, !amdgpu.noclobber !5
  %466 = uitofp i8 %465 to float
  %467 = fmul contract float %466, 0x3FB84BD340000000
  %468 = fadd contract float %440, %467
  br label %469

469:                                              ; preds = %445, %439
  %470 = phi float [ %468, %445 ], [ %440, %439 ]
  %471 = phi float [ %461, %445 ], [ %441, %439 ]
  %472 = phi float [ %454, %445 ], [ %442, %439 ]
  %473 = select i1 %353, i1 %163, i1 false
  %474 = select i1 %473, i1 %166, i1 false
  br i1 %474, label %475, label %499

475:                                              ; preds = %469
  %476 = mul nsw i32 %162, %0
  %477 = add nsw i32 %476, %13
  %478 = mul nsw i32 %477, 3
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %479
  %481 = load i8, i8 addrspace(1)* %480, align 1, !tbaa !7, !amdgpu.noclobber !5
  %482 = uitofp i8 %481 to float
  %483 = fmul contract float %482, 0x3F985CEE20000000
  %484 = fadd contract float %472, %483
  %485 = add nsw i32 %478, 1
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %486
  %488 = load i8, i8 addrspace(1)* %487, align 1, !tbaa !7, !amdgpu.noclobber !5
  %489 = uitofp i8 %488 to float
  %490 = fmul contract float %489, 0x3F985CEE20000000
  %491 = fadd contract float %471, %490
  %492 = add nsw i32 %478, 2
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %493
  %495 = load i8, i8 addrspace(1)* %494, align 1, !tbaa !7, !amdgpu.noclobber !5
  %496 = uitofp i8 %495 to float
  %497 = fmul contract float %496, 0x3F985CEE20000000
  %498 = fadd contract float %470, %497
  br label %499

499:                                              ; preds = %475, %469
  %500 = phi float [ %498, %475 ], [ %470, %469 ]
  %501 = phi float [ %491, %475 ], [ %471, %469 ]
  %502 = phi float [ %484, %475 ], [ %472, %469 ]
  %503 = add nsw i32 %13, 1
  %504 = icmp sgt i32 %13, -2
  %505 = icmp slt i32 %503, %0
  %506 = select i1 %504, i1 %30, i1 false
  %507 = select i1 %506, i1 %505, i1 false
  %508 = select i1 %507, i1 %33, i1 false
  br i1 %508, label %509, label %533

509:                                              ; preds = %499
  %510 = mul nsw i32 %29, %0
  %511 = add nsw i32 %510, %503
  %512 = mul nsw i32 %511, 3
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %513
  %515 = load i8, i8 addrspace(1)* %514, align 1, !tbaa !7, !amdgpu.noclobber !5
  %516 = uitofp i8 %515 to float
  %517 = fmul contract float %516, 0x3F8EC24800000000
  %518 = fadd contract float %502, %517
  %519 = add nsw i32 %512, 1
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %520
  %522 = load i8, i8 addrspace(1)* %521, align 1, !tbaa !7, !amdgpu.noclobber !5
  %523 = uitofp i8 %522 to float
  %524 = fmul contract float %523, 0x3F8EC24800000000
  %525 = fadd contract float %501, %524
  %526 = add nsw i32 %512, 2
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %527
  %529 = load i8, i8 addrspace(1)* %528, align 1, !tbaa !7, !amdgpu.noclobber !5
  %530 = uitofp i8 %529 to float
  %531 = fmul contract float %530, 0x3F8EC24800000000
  %532 = fadd contract float %500, %531
  br label %533

533:                                              ; preds = %509, %499
  %534 = phi float [ %532, %509 ], [ %500, %499 ]
  %535 = phi float [ %525, %509 ], [ %501, %499 ]
  %536 = phi float [ %518, %509 ], [ %502, %499 ]
  %537 = select i1 %504, i1 %64, i1 false
  %538 = select i1 %537, i1 %505, i1 false
  %539 = select i1 %538, i1 %67, i1 false
  br i1 %539, label %540, label %564

540:                                              ; preds = %533
  %541 = mul nsw i32 %63, %0
  %542 = add nsw i32 %541, %503
  %543 = mul nsw i32 %542, 3
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %544
  %546 = load i8, i8 addrspace(1)* %545, align 1, !tbaa !7, !amdgpu.noclobber !5
  %547 = uitofp i8 %546 to float
  %548 = fmul contract float %547, 0x3FAEACC920000000
  %549 = fadd contract float %536, %548
  %550 = add nsw i32 %543, 1
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %551
  %553 = load i8, i8 addrspace(1)* %552, align 1, !tbaa !7, !amdgpu.noclobber !5
  %554 = uitofp i8 %553 to float
  %555 = fmul contract float %554, 0x3FAEACC920000000
  %556 = fadd contract float %535, %555
  %557 = add nsw i32 %543, 2
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %558
  %560 = load i8, i8 addrspace(1)* %559, align 1, !tbaa !7, !amdgpu.noclobber !5
  %561 = uitofp i8 %560 to float
  %562 = fmul contract float %561, 0x3FAEACC920000000
  %563 = fadd contract float %534, %562
  br label %564

564:                                              ; preds = %540, %533
  %565 = phi float [ %563, %540 ], [ %534, %533 ]
  %566 = phi float [ %556, %540 ], [ %535, %533 ]
  %567 = phi float [ %549, %540 ], [ %536, %533 ]
  %568 = select i1 %504, i1 %97, i1 false
  %569 = select i1 %568, i1 %505, i1 false
  br i1 %569, label %570, label %594

570:                                              ; preds = %564
  %571 = mul nsw i32 %21, %0
  %572 = add nsw i32 %571, %503
  %573 = mul nsw i32 %572, 3
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %574
  %576 = load i8, i8 addrspace(1)* %575, align 1, !tbaa !7, !amdgpu.noclobber !5
  %577 = uitofp i8 %576 to float
  %578 = fmul contract float %577, 0x3FB84BD340000000
  %579 = fadd contract float %567, %578
  %580 = add nsw i32 %573, 1
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %581
  %583 = load i8, i8 addrspace(1)* %582, align 1, !tbaa !7, !amdgpu.noclobber !5
  %584 = uitofp i8 %583 to float
  %585 = fmul contract float %584, 0x3FB84BD340000000
  %586 = fadd contract float %566, %585
  %587 = add nsw i32 %573, 2
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %588
  %590 = load i8, i8 addrspace(1)* %589, align 1, !tbaa !7, !amdgpu.noclobber !5
  %591 = uitofp i8 %590 to float
  %592 = fmul contract float %591, 0x3FB84BD340000000
  %593 = fadd contract float %565, %592
  br label %594

594:                                              ; preds = %570, %564
  %595 = phi float [ %593, %570 ], [ %565, %564 ]
  %596 = phi float [ %586, %570 ], [ %566, %564 ]
  %597 = phi float [ %579, %570 ], [ %567, %564 ]
  %598 = select i1 %504, i1 %129, i1 false
  %599 = select i1 %598, i1 %505, i1 false
  %600 = select i1 %599, i1 %132, i1 false
  br i1 %600, label %601, label %625

601:                                              ; preds = %594
  %602 = mul nsw i32 %128, %0
  %603 = add nsw i32 %602, %503
  %604 = mul nsw i32 %603, 3
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %605
  %607 = load i8, i8 addrspace(1)* %606, align 1, !tbaa !7, !amdgpu.noclobber !5
  %608 = uitofp i8 %607 to float
  %609 = fmul contract float %608, 0x3FAEACC920000000
  %610 = fadd contract float %597, %609
  %611 = add nsw i32 %604, 1
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %612
  %614 = load i8, i8 addrspace(1)* %613, align 1, !tbaa !7, !amdgpu.noclobber !5
  %615 = uitofp i8 %614 to float
  %616 = fmul contract float %615, 0x3FAEACC920000000
  %617 = fadd contract float %596, %616
  %618 = add nsw i32 %604, 2
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %619
  %621 = load i8, i8 addrspace(1)* %620, align 1, !tbaa !7, !amdgpu.noclobber !5
  %622 = uitofp i8 %621 to float
  %623 = fmul contract float %622, 0x3FAEACC920000000
  %624 = fadd contract float %595, %623
  br label %625

625:                                              ; preds = %601, %594
  %626 = phi float [ %624, %601 ], [ %595, %594 ]
  %627 = phi float [ %617, %601 ], [ %596, %594 ]
  %628 = phi float [ %610, %601 ], [ %597, %594 ]
  %629 = select i1 %504, i1 %163, i1 false
  %630 = select i1 %629, i1 %505, i1 false
  %631 = select i1 %630, i1 %166, i1 false
  br i1 %631, label %632, label %656

632:                                              ; preds = %625
  %633 = mul nsw i32 %162, %0
  %634 = add nsw i32 %633, %503
  %635 = mul nsw i32 %634, 3
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %636
  %638 = load i8, i8 addrspace(1)* %637, align 1, !tbaa !7, !amdgpu.noclobber !5
  %639 = uitofp i8 %638 to float
  %640 = fmul contract float %639, 0x3F8EC24800000000
  %641 = fadd contract float %628, %640
  %642 = add nsw i32 %635, 1
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %643
  %645 = load i8, i8 addrspace(1)* %644, align 1, !tbaa !7, !amdgpu.noclobber !5
  %646 = uitofp i8 %645 to float
  %647 = fmul contract float %646, 0x3F8EC24800000000
  %648 = fadd contract float %627, %647
  %649 = add nsw i32 %635, 2
  %650 = sext i32 %649 to i64
  %651 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %650
  %652 = load i8, i8 addrspace(1)* %651, align 1, !tbaa !7, !amdgpu.noclobber !5
  %653 = uitofp i8 %652 to float
  %654 = fmul contract float %653, 0x3F8EC24800000000
  %655 = fadd contract float %626, %654
  br label %656

656:                                              ; preds = %632, %625
  %657 = phi float [ %655, %632 ], [ %626, %625 ]
  %658 = phi float [ %648, %632 ], [ %627, %625 ]
  %659 = phi float [ %641, %632 ], [ %628, %625 ]
  %660 = add nsw i32 %13, 2
  %661 = icmp sgt i32 %13, -3
  %662 = icmp slt i32 %660, %0
  %663 = select i1 %661, i1 %30, i1 false
  %664 = select i1 %663, i1 %662, i1 false
  %665 = select i1 %664, i1 %33, i1 false
  br i1 %665, label %666, label %690

666:                                              ; preds = %656
  %667 = mul nsw i32 %29, %0
  %668 = add nsw i32 %667, %660
  %669 = mul nsw i32 %668, 3
  %670 = sext i32 %669 to i64
  %671 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %670
  %672 = load i8, i8 addrspace(1)* %671, align 1, !tbaa !7, !amdgpu.noclobber !5
  %673 = uitofp i8 %672 to float
  %674 = fmul contract float %673, 0x3F6ED7C700000000
  %675 = fadd contract float %659, %674
  %676 = add nsw i32 %669, 1
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %677
  %679 = load i8, i8 addrspace(1)* %678, align 1, !tbaa !7, !amdgpu.noclobber !5
  %680 = uitofp i8 %679 to float
  %681 = fmul contract float %680, 0x3F6ED7C700000000
  %682 = fadd contract float %658, %681
  %683 = add nsw i32 %669, 2
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %684
  %686 = load i8, i8 addrspace(1)* %685, align 1, !tbaa !7, !amdgpu.noclobber !5
  %687 = uitofp i8 %686 to float
  %688 = fmul contract float %687, 0x3F6ED7C700000000
  %689 = fadd contract float %657, %688
  br label %690

690:                                              ; preds = %666, %656
  %691 = phi float [ %689, %666 ], [ %657, %656 ]
  %692 = phi float [ %682, %666 ], [ %658, %656 ]
  %693 = phi float [ %675, %666 ], [ %659, %656 ]
  %694 = select i1 %661, i1 %64, i1 false
  %695 = select i1 %694, i1 %662, i1 false
  %696 = select i1 %695, i1 %67, i1 false
  br i1 %696, label %697, label %721

697:                                              ; preds = %690
  %698 = mul nsw i32 %63, %0
  %699 = add nsw i32 %698, %660
  %700 = mul nsw i32 %699, 3
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %701
  %703 = load i8, i8 addrspace(1)* %702, align 1, !tbaa !7, !amdgpu.noclobber !5
  %704 = uitofp i8 %703 to float
  %705 = fmul contract float %704, 0x3F8EC24800000000
  %706 = fadd contract float %693, %705
  %707 = add nsw i32 %700, 1
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %708
  %710 = load i8, i8 addrspace(1)* %709, align 1, !tbaa !7, !amdgpu.noclobber !5
  %711 = uitofp i8 %710 to float
  %712 = fmul contract float %711, 0x3F8EC24800000000
  %713 = fadd contract float %692, %712
  %714 = add nsw i32 %700, 2
  %715 = sext i32 %714 to i64
  %716 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %715
  %717 = load i8, i8 addrspace(1)* %716, align 1, !tbaa !7, !amdgpu.noclobber !5
  %718 = uitofp i8 %717 to float
  %719 = fmul contract float %718, 0x3F8EC24800000000
  %720 = fadd contract float %691, %719
  br label %721

721:                                              ; preds = %697, %690
  %722 = phi float [ %720, %697 ], [ %691, %690 ]
  %723 = phi float [ %713, %697 ], [ %692, %690 ]
  %724 = phi float [ %706, %697 ], [ %693, %690 ]
  %725 = select i1 %661, i1 %97, i1 false
  %726 = select i1 %725, i1 %662, i1 false
  br i1 %726, label %727, label %751

727:                                              ; preds = %721
  %728 = mul nsw i32 %21, %0
  %729 = add nsw i32 %728, %660
  %730 = mul nsw i32 %729, 3
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %731
  %733 = load i8, i8 addrspace(1)* %732, align 1, !tbaa !7, !amdgpu.noclobber !5
  %734 = uitofp i8 %733 to float
  %735 = fmul contract float %734, 0x3F985CEE20000000
  %736 = fadd contract float %724, %735
  %737 = add nsw i32 %730, 1
  %738 = sext i32 %737 to i64
  %739 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %738
  %740 = load i8, i8 addrspace(1)* %739, align 1, !tbaa !7, !amdgpu.noclobber !5
  %741 = uitofp i8 %740 to float
  %742 = fmul contract float %741, 0x3F985CEE20000000
  %743 = fadd contract float %723, %742
  %744 = add nsw i32 %730, 2
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %745
  %747 = load i8, i8 addrspace(1)* %746, align 1, !tbaa !7, !amdgpu.noclobber !5
  %748 = uitofp i8 %747 to float
  %749 = fmul contract float %748, 0x3F985CEE20000000
  %750 = fadd contract float %722, %749
  br label %751

751:                                              ; preds = %727, %721
  %752 = phi float [ %750, %727 ], [ %722, %721 ]
  %753 = phi float [ %743, %727 ], [ %723, %721 ]
  %754 = phi float [ %736, %727 ], [ %724, %721 ]
  %755 = select i1 %661, i1 %129, i1 false
  %756 = select i1 %755, i1 %662, i1 false
  %757 = select i1 %756, i1 %132, i1 false
  br i1 %757, label %758, label %782

758:                                              ; preds = %751
  %759 = mul nsw i32 %128, %0
  %760 = add nsw i32 %759, %660
  %761 = mul nsw i32 %760, 3
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %762
  %764 = load i8, i8 addrspace(1)* %763, align 1, !tbaa !7, !amdgpu.noclobber !5
  %765 = uitofp i8 %764 to float
  %766 = fmul contract float %765, 0x3F8EC24800000000
  %767 = fadd contract float %754, %766
  %768 = add nsw i32 %761, 1
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %769
  %771 = load i8, i8 addrspace(1)* %770, align 1, !tbaa !7, !amdgpu.noclobber !5
  %772 = uitofp i8 %771 to float
  %773 = fmul contract float %772, 0x3F8EC24800000000
  %774 = fadd contract float %753, %773
  %775 = add nsw i32 %761, 2
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %776
  %778 = load i8, i8 addrspace(1)* %777, align 1, !tbaa !7, !amdgpu.noclobber !5
  %779 = uitofp i8 %778 to float
  %780 = fmul contract float %779, 0x3F8EC24800000000
  %781 = fadd contract float %752, %780
  br label %782

782:                                              ; preds = %758, %751
  %783 = phi float [ %781, %758 ], [ %752, %751 ]
  %784 = phi float [ %774, %758 ], [ %753, %751 ]
  %785 = phi float [ %767, %758 ], [ %754, %751 ]
  %786 = select i1 %661, i1 %163, i1 false
  %787 = select i1 %786, i1 %662, i1 false
  %788 = select i1 %787, i1 %166, i1 false
  br i1 %788, label %789, label %813

789:                                              ; preds = %782
  %790 = mul nsw i32 %162, %0
  %791 = add nsw i32 %790, %660
  %792 = mul nsw i32 %791, 3
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %793
  %795 = load i8, i8 addrspace(1)* %794, align 1, !tbaa !7, !amdgpu.noclobber !5
  %796 = uitofp i8 %795 to float
  %797 = fmul contract float %796, 0x3F6ED7C700000000
  %798 = fadd contract float %785, %797
  %799 = add nsw i32 %792, 1
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %800
  %802 = load i8, i8 addrspace(1)* %801, align 1, !tbaa !7, !amdgpu.noclobber !5
  %803 = uitofp i8 %802 to float
  %804 = fmul contract float %803, 0x3F6ED7C700000000
  %805 = fadd contract float %784, %804
  %806 = add nsw i32 %792, 2
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %807
  %809 = load i8, i8 addrspace(1)* %808, align 1, !tbaa !7, !amdgpu.noclobber !5
  %810 = uitofp i8 %809 to float
  %811 = fmul contract float %810, 0x3F6ED7C700000000
  %812 = fadd contract float %783, %811
  br label %813

813:                                              ; preds = %789, %782
  %814 = phi float [ %812, %789 ], [ %783, %782 ]
  %815 = phi float [ %805, %789 ], [ %784, %782 ]
  %816 = phi float [ %798, %789 ], [ %785, %782 ]
  %817 = mul nsw i32 %21, %0
  %818 = add nsw i32 %817, %13
  %819 = mul nsw i32 %818, 3
  %820 = fptoui float %816 to i8
  %821 = sext i32 %819 to i64
  %822 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %821
  store i8 %820, i8 addrspace(1)* %822, align 1, !tbaa !7
  %823 = fptoui float %815 to i8
  %824 = add nsw i32 %819, 1
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %825
  store i8 %823, i8 addrspace(1)* %826, align 1, !tbaa !7
  %827 = fptoui float %814 to i8
  %828 = add nsw i32 %819, 2
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %829
  store i8 %827, i8 addrspace(1)* %830, align 1, !tbaa !7
  br label %831

831:                                              ; preds = %4, %813
  ret void
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
