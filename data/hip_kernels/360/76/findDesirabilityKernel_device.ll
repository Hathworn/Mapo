; ModuleID = '../data/hip_kernels/360/76/main.cu'
source_filename = "../data/hip_kernels/360/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22findDesirabilityKerneliiPiS_S_S_S_S_S_S_Pf(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, i32 addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %464

22:                                               ; preds = %11
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %23
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = sub nsw i32 %28, %1
  %32 = tail call i32 @llvm.abs.i32(i32 %31, i1 true)
  %33 = sitofp i32 %32 to float
  %34 = sitofp i32 %1 to float
  %35 = fdiv contract float %33, %34
  %36 = add i32 %30, %1
  %37 = sub i32 %28, %36
  %38 = tail call i32 @llvm.abs.i32(i32 %37, i1 true)
  %39 = sub nsw i32 %32, %38
  %40 = sitofp i32 %39 to float
  %41 = fmul contract float %35, %40
  %42 = fcmp contract ogt float %41, 0.000000e+00
  br i1 %42, label %43, label %457

43:                                               ; preds = %22
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %23
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nsw i32 %20, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = icmp slt i32 %45, %49
  br i1 %50, label %59, label %51

51:                                               ; preds = %222, %43
  %52 = phi <10 x i32> [ <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>, %43 ], [ %223, %222 ]
  %53 = phi <10 x i32> [ zeroinitializer, %43 ], [ %224, %222 ]
  %54 = phi i32 [ 0, %43 ], [ %225, %222 ]
  %55 = sub i32 %30, %1
  %56 = sitofp i32 %54 to float
  %57 = extractelement <10 x i32> %52, i64 1
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %249, label %228

59:                                               ; preds = %43, %222
  %60 = phi i32 [ %225, %222 ], [ 0, %43 ]
  %61 = phi i32 [ %226, %222 ], [ %45, %43 ]
  %62 = phi <10 x i32> [ %224, %222 ], [ zeroinitializer, %43 ]
  %63 = phi <10 x i32> [ %223, %222 ], [ <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>, %43 ]
  %64 = sext i32 %61 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = icmp eq i32 %69, %25
  br i1 %70, label %220, label %71

71:                                               ; preds = %59
  %72 = icmp ne i32 %69, -1
  %73 = extractelement <10 x i32> %63, i64 0
  %74 = icmp eq i32 %73, -1
  %75 = select i1 %72, i1 %74, i1 false
  %76 = insertelement <10 x i32> %63, i32 %69, i64 0
  %77 = insertelement <10 x i32> %62, i32 1, i64 0
  %78 = icmp eq i32 %73, %69
  %79 = extractelement <10 x i32> %62, i64 0
  %80 = add nsw i32 %79, 1
  %81 = insertelement <10 x i32> %62, i32 %80, i64 0
  %82 = select i1 %78, <10 x i32> %81, <10 x i32> %62
  %83 = select i1 %75, <10 x i32> %76, <10 x i32> %63
  %84 = select i1 %75, <10 x i32> %77, <10 x i32> %82
  %85 = select i1 %75, i1 true, i1 %78
  %86 = select i1 %85, i32 -1, i32 %69
  %87 = icmp ne i32 %86, -1
  %88 = extractelement <10 x i32> %83, i64 1
  %89 = icmp eq i32 %88, -1
  %90 = select i1 %87, i1 %89, i1 false
  %91 = insertelement <10 x i32> %83, i32 %86, i64 1
  %92 = insertelement <10 x i32> %84, i32 1, i64 1
  %93 = icmp eq i32 %88, %86
  %94 = extractelement <10 x i32> %84, i64 1
  %95 = add nsw i32 %94, 1
  %96 = insertelement <10 x i32> %84, i32 %95, i64 1
  %97 = select i1 %93, <10 x i32> %96, <10 x i32> %84
  %98 = select i1 %90, <10 x i32> %91, <10 x i32> %83
  %99 = select i1 %90, <10 x i32> %92, <10 x i32> %97
  %100 = select i1 %90, i1 true, i1 %93
  %101 = select i1 %100, i32 -1, i32 %86
  %102 = icmp ne i32 %101, -1
  %103 = extractelement <10 x i32> %98, i64 2
  %104 = icmp eq i32 %103, -1
  %105 = select i1 %102, i1 %104, i1 false
  %106 = insertelement <10 x i32> %98, i32 %101, i64 2
  %107 = insertelement <10 x i32> %99, i32 1, i64 2
  %108 = icmp eq i32 %103, %101
  %109 = extractelement <10 x i32> %99, i64 2
  %110 = add nsw i32 %109, 1
  %111 = insertelement <10 x i32> %99, i32 %110, i64 2
  %112 = select i1 %108, <10 x i32> %111, <10 x i32> %99
  %113 = select i1 %105, <10 x i32> %106, <10 x i32> %98
  %114 = select i1 %105, <10 x i32> %107, <10 x i32> %112
  %115 = select i1 %105, i1 true, i1 %108
  %116 = select i1 %115, i32 -1, i32 %101
  %117 = icmp ne i32 %116, -1
  %118 = extractelement <10 x i32> %113, i64 3
  %119 = icmp eq i32 %118, -1
  %120 = select i1 %117, i1 %119, i1 false
  %121 = insertelement <10 x i32> %113, i32 %116, i64 3
  %122 = insertelement <10 x i32> %114, i32 1, i64 3
  %123 = icmp eq i32 %118, %116
  %124 = extractelement <10 x i32> %114, i64 3
  %125 = add nsw i32 %124, 1
  %126 = insertelement <10 x i32> %114, i32 %125, i64 3
  %127 = select i1 %123, <10 x i32> %126, <10 x i32> %114
  %128 = select i1 %120, <10 x i32> %121, <10 x i32> %113
  %129 = select i1 %120, <10 x i32> %122, <10 x i32> %127
  %130 = select i1 %120, i1 true, i1 %123
  %131 = select i1 %130, i32 -1, i32 %116
  %132 = icmp ne i32 %131, -1
  %133 = extractelement <10 x i32> %128, i64 4
  %134 = icmp eq i32 %133, -1
  %135 = select i1 %132, i1 %134, i1 false
  %136 = insertelement <10 x i32> %128, i32 %131, i64 4
  %137 = insertelement <10 x i32> %129, i32 1, i64 4
  %138 = icmp eq i32 %133, %131
  %139 = extractelement <10 x i32> %129, i64 4
  %140 = add nsw i32 %139, 1
  %141 = insertelement <10 x i32> %129, i32 %140, i64 4
  %142 = select i1 %138, <10 x i32> %141, <10 x i32> %129
  %143 = select i1 %135, <10 x i32> %136, <10 x i32> %128
  %144 = select i1 %135, <10 x i32> %137, <10 x i32> %142
  %145 = select i1 %135, i1 true, i1 %138
  %146 = select i1 %145, i32 -1, i32 %131
  %147 = icmp ne i32 %146, -1
  %148 = extractelement <10 x i32> %143, i64 5
  %149 = icmp eq i32 %148, -1
  %150 = select i1 %147, i1 %149, i1 false
  %151 = insertelement <10 x i32> %143, i32 %146, i64 5
  %152 = insertelement <10 x i32> %144, i32 1, i64 5
  %153 = icmp eq i32 %148, %146
  %154 = extractelement <10 x i32> %144, i64 5
  %155 = add nsw i32 %154, 1
  %156 = insertelement <10 x i32> %144, i32 %155, i64 5
  %157 = select i1 %153, <10 x i32> %156, <10 x i32> %144
  %158 = select i1 %150, <10 x i32> %151, <10 x i32> %143
  %159 = select i1 %150, <10 x i32> %152, <10 x i32> %157
  %160 = select i1 %150, i1 true, i1 %153
  %161 = select i1 %160, i32 -1, i32 %146
  %162 = icmp ne i32 %161, -1
  %163 = extractelement <10 x i32> %158, i64 6
  %164 = icmp eq i32 %163, -1
  %165 = select i1 %162, i1 %164, i1 false
  %166 = insertelement <10 x i32> %158, i32 %161, i64 6
  %167 = insertelement <10 x i32> %159, i32 1, i64 6
  %168 = icmp eq i32 %163, %161
  %169 = extractelement <10 x i32> %159, i64 6
  %170 = add nsw i32 %169, 1
  %171 = insertelement <10 x i32> %159, i32 %170, i64 6
  %172 = select i1 %168, <10 x i32> %171, <10 x i32> %159
  %173 = select i1 %165, <10 x i32> %166, <10 x i32> %158
  %174 = select i1 %165, <10 x i32> %167, <10 x i32> %172
  %175 = select i1 %165, i1 true, i1 %168
  %176 = select i1 %175, i32 -1, i32 %161
  %177 = icmp ne i32 %176, -1
  %178 = extractelement <10 x i32> %173, i64 7
  %179 = icmp eq i32 %178, -1
  %180 = select i1 %177, i1 %179, i1 false
  %181 = insertelement <10 x i32> %173, i32 %176, i64 7
  %182 = insertelement <10 x i32> %174, i32 1, i64 7
  %183 = icmp eq i32 %178, %176
  %184 = extractelement <10 x i32> %174, i64 7
  %185 = add nsw i32 %184, 1
  %186 = insertelement <10 x i32> %174, i32 %185, i64 7
  %187 = select i1 %183, <10 x i32> %186, <10 x i32> %174
  %188 = select i1 %180, <10 x i32> %181, <10 x i32> %173
  %189 = select i1 %180, <10 x i32> %182, <10 x i32> %187
  %190 = select i1 %180, i1 true, i1 %183
  %191 = select i1 %190, i32 -1, i32 %176
  %192 = icmp ne i32 %191, -1
  %193 = extractelement <10 x i32> %188, i64 8
  %194 = icmp eq i32 %193, -1
  %195 = select i1 %192, i1 %194, i1 false
  %196 = insertelement <10 x i32> %188, i32 %191, i64 8
  %197 = insertelement <10 x i32> %189, i32 1, i64 8
  %198 = icmp eq i32 %193, %191
  %199 = extractelement <10 x i32> %189, i64 8
  %200 = add nsw i32 %199, 1
  %201 = insertelement <10 x i32> %189, i32 %200, i64 8
  %202 = select i1 %198, <10 x i32> %201, <10 x i32> %189
  %203 = select i1 %195, <10 x i32> %196, <10 x i32> %188
  %204 = select i1 %195, <10 x i32> %197, <10 x i32> %202
  %205 = select i1 %195, i1 true, i1 %198
  %206 = select i1 %205, i32 -1, i32 %191
  %207 = icmp ne i32 %206, -1
  %208 = extractelement <10 x i32> %203, i64 9
  %209 = icmp eq i32 %208, -1
  %210 = select i1 %207, i1 %209, i1 false
  %211 = insertelement <10 x i32> %203, i32 %206, i64 9
  %212 = insertelement <10 x i32> %204, i32 1, i64 9
  %213 = icmp eq i32 %208, %206
  %214 = extractelement <10 x i32> %204, i64 9
  %215 = add nsw i32 %214, 1
  %216 = insertelement <10 x i32> %204, i32 %215, i64 9
  %217 = select i1 %213, <10 x i32> %216, <10 x i32> %204
  %218 = select i1 %210, <10 x i32> %211, <10 x i32> %203
  %219 = select i1 %210, <10 x i32> %212, <10 x i32> %217
  br label %222

220:                                              ; preds = %59
  %221 = add nsw i32 %60, 1
  br label %222

222:                                              ; preds = %71, %220
  %223 = phi <10 x i32> [ %63, %220 ], [ %218, %71 ]
  %224 = phi <10 x i32> [ %62, %220 ], [ %219, %71 ]
  %225 = phi i32 [ %221, %220 ], [ %60, %71 ]
  %226 = add nsw i32 %61, 1
  %227 = icmp slt i32 %226, %49
  br i1 %227, label %59, label %51, !llvm.loop !11

228:                                              ; preds = %51
  %229 = sext i32 %57 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %229
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !7, !amdgpu.noclobber !5
  %232 = sub nsw i32 %231, %1
  %233 = tail call i32 @llvm.abs.i32(i32 %232, i1 true)
  %234 = sitofp i32 %233 to float
  %235 = fdiv contract float %234, %34
  %236 = add i32 %55, %231
  %237 = tail call i32 @llvm.abs.i32(i32 %236, i1 true)
  %238 = sub nsw i32 %233, %237
  %239 = sitofp i32 %238 to float
  %240 = fmul contract float %235, %239
  %241 = fadd contract float %41, %240
  %242 = extractelement <10 x i32> %53, i64 1
  %243 = sitofp i32 %242 to float
  %244 = fdiv contract float %243, %56
  %245 = fmul contract float %244, %241
  %246 = fcmp contract ogt float %245, 0.000000e+00
  %247 = select i1 %246, float %245, float 0.000000e+00
  %248 = select i1 %246, i32 %57, i32 -1
  br label %249

249:                                              ; preds = %51, %228
  %250 = phi float [ %247, %228 ], [ 0.000000e+00, %51 ]
  %251 = phi i32 [ %248, %228 ], [ -1, %51 ]
  %252 = extractelement <10 x i32> %52, i64 2
  %253 = icmp eq i32 %252, -1
  br i1 %253, label %275, label %254

254:                                              ; preds = %249
  %255 = sext i32 %252 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %255
  %257 = load i32, i32 addrspace(1)* %256, align 4, !tbaa !7, !amdgpu.noclobber !5
  %258 = sub nsw i32 %257, %1
  %259 = tail call i32 @llvm.abs.i32(i32 %258, i1 true)
  %260 = sitofp i32 %259 to float
  %261 = fdiv contract float %260, %34
  %262 = add i32 %55, %257
  %263 = tail call i32 @llvm.abs.i32(i32 %262, i1 true)
  %264 = sub nsw i32 %259, %263
  %265 = sitofp i32 %264 to float
  %266 = fmul contract float %261, %265
  %267 = fadd contract float %41, %266
  %268 = extractelement <10 x i32> %53, i64 2
  %269 = sitofp i32 %268 to float
  %270 = fdiv contract float %269, %56
  %271 = fmul contract float %270, %267
  %272 = fcmp contract ogt float %271, %250
  %273 = select i1 %272, float %271, float %250
  %274 = select i1 %272, i32 %252, i32 %251
  br label %275

275:                                              ; preds = %254, %249
  %276 = phi float [ %273, %254 ], [ %250, %249 ]
  %277 = phi i32 [ %274, %254 ], [ %251, %249 ]
  %278 = extractelement <10 x i32> %52, i64 3
  %279 = icmp eq i32 %278, -1
  br i1 %279, label %301, label %280

280:                                              ; preds = %275
  %281 = sext i32 %278 to i64
  %282 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %281
  %283 = load i32, i32 addrspace(1)* %282, align 4, !tbaa !7, !amdgpu.noclobber !5
  %284 = sub nsw i32 %283, %1
  %285 = tail call i32 @llvm.abs.i32(i32 %284, i1 true)
  %286 = sitofp i32 %285 to float
  %287 = fdiv contract float %286, %34
  %288 = add i32 %55, %283
  %289 = tail call i32 @llvm.abs.i32(i32 %288, i1 true)
  %290 = sub nsw i32 %285, %289
  %291 = sitofp i32 %290 to float
  %292 = fmul contract float %287, %291
  %293 = fadd contract float %41, %292
  %294 = extractelement <10 x i32> %53, i64 3
  %295 = sitofp i32 %294 to float
  %296 = fdiv contract float %295, %56
  %297 = fmul contract float %296, %293
  %298 = fcmp contract ogt float %297, %276
  %299 = select i1 %298, float %297, float %276
  %300 = select i1 %298, i32 %278, i32 %277
  br label %301

301:                                              ; preds = %280, %275
  %302 = phi float [ %299, %280 ], [ %276, %275 ]
  %303 = phi i32 [ %300, %280 ], [ %277, %275 ]
  %304 = extractelement <10 x i32> %52, i64 4
  %305 = icmp eq i32 %304, -1
  br i1 %305, label %327, label %306

306:                                              ; preds = %301
  %307 = sext i32 %304 to i64
  %308 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %307
  %309 = load i32, i32 addrspace(1)* %308, align 4, !tbaa !7, !amdgpu.noclobber !5
  %310 = sub nsw i32 %309, %1
  %311 = tail call i32 @llvm.abs.i32(i32 %310, i1 true)
  %312 = sitofp i32 %311 to float
  %313 = fdiv contract float %312, %34
  %314 = add i32 %55, %309
  %315 = tail call i32 @llvm.abs.i32(i32 %314, i1 true)
  %316 = sub nsw i32 %311, %315
  %317 = sitofp i32 %316 to float
  %318 = fmul contract float %313, %317
  %319 = fadd contract float %41, %318
  %320 = extractelement <10 x i32> %53, i64 4
  %321 = sitofp i32 %320 to float
  %322 = fdiv contract float %321, %56
  %323 = fmul contract float %322, %319
  %324 = fcmp contract ogt float %323, %302
  %325 = select i1 %324, float %323, float %302
  %326 = select i1 %324, i32 %304, i32 %303
  br label %327

327:                                              ; preds = %306, %301
  %328 = phi float [ %325, %306 ], [ %302, %301 ]
  %329 = phi i32 [ %326, %306 ], [ %303, %301 ]
  %330 = extractelement <10 x i32> %52, i64 5
  %331 = icmp eq i32 %330, -1
  br i1 %331, label %353, label %332

332:                                              ; preds = %327
  %333 = sext i32 %330 to i64
  %334 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %333
  %335 = load i32, i32 addrspace(1)* %334, align 4, !tbaa !7, !amdgpu.noclobber !5
  %336 = sub nsw i32 %335, %1
  %337 = tail call i32 @llvm.abs.i32(i32 %336, i1 true)
  %338 = sitofp i32 %337 to float
  %339 = fdiv contract float %338, %34
  %340 = add i32 %55, %335
  %341 = tail call i32 @llvm.abs.i32(i32 %340, i1 true)
  %342 = sub nsw i32 %337, %341
  %343 = sitofp i32 %342 to float
  %344 = fmul contract float %339, %343
  %345 = fadd contract float %41, %344
  %346 = extractelement <10 x i32> %53, i64 5
  %347 = sitofp i32 %346 to float
  %348 = fdiv contract float %347, %56
  %349 = fmul contract float %348, %345
  %350 = fcmp contract ogt float %349, %328
  %351 = select i1 %350, float %349, float %328
  %352 = select i1 %350, i32 %330, i32 %329
  br label %353

353:                                              ; preds = %332, %327
  %354 = phi float [ %351, %332 ], [ %328, %327 ]
  %355 = phi i32 [ %352, %332 ], [ %329, %327 ]
  %356 = extractelement <10 x i32> %52, i64 6
  %357 = icmp eq i32 %356, -1
  br i1 %357, label %379, label %358

358:                                              ; preds = %353
  %359 = sext i32 %356 to i64
  %360 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %359
  %361 = load i32, i32 addrspace(1)* %360, align 4, !tbaa !7, !amdgpu.noclobber !5
  %362 = sub nsw i32 %361, %1
  %363 = tail call i32 @llvm.abs.i32(i32 %362, i1 true)
  %364 = sitofp i32 %363 to float
  %365 = fdiv contract float %364, %34
  %366 = add i32 %55, %361
  %367 = tail call i32 @llvm.abs.i32(i32 %366, i1 true)
  %368 = sub nsw i32 %363, %367
  %369 = sitofp i32 %368 to float
  %370 = fmul contract float %365, %369
  %371 = fadd contract float %41, %370
  %372 = extractelement <10 x i32> %53, i64 6
  %373 = sitofp i32 %372 to float
  %374 = fdiv contract float %373, %56
  %375 = fmul contract float %374, %371
  %376 = fcmp contract ogt float %375, %354
  %377 = select i1 %376, float %375, float %354
  %378 = select i1 %376, i32 %356, i32 %355
  br label %379

379:                                              ; preds = %358, %353
  %380 = phi float [ %377, %358 ], [ %354, %353 ]
  %381 = phi i32 [ %378, %358 ], [ %355, %353 ]
  %382 = extractelement <10 x i32> %52, i64 7
  %383 = icmp eq i32 %382, -1
  br i1 %383, label %405, label %384

384:                                              ; preds = %379
  %385 = sext i32 %382 to i64
  %386 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %385
  %387 = load i32, i32 addrspace(1)* %386, align 4, !tbaa !7, !amdgpu.noclobber !5
  %388 = sub nsw i32 %387, %1
  %389 = tail call i32 @llvm.abs.i32(i32 %388, i1 true)
  %390 = sitofp i32 %389 to float
  %391 = fdiv contract float %390, %34
  %392 = add i32 %55, %387
  %393 = tail call i32 @llvm.abs.i32(i32 %392, i1 true)
  %394 = sub nsw i32 %389, %393
  %395 = sitofp i32 %394 to float
  %396 = fmul contract float %391, %395
  %397 = fadd contract float %41, %396
  %398 = extractelement <10 x i32> %53, i64 7
  %399 = sitofp i32 %398 to float
  %400 = fdiv contract float %399, %56
  %401 = fmul contract float %400, %397
  %402 = fcmp contract ogt float %401, %380
  %403 = select i1 %402, float %401, float %380
  %404 = select i1 %402, i32 %382, i32 %381
  br label %405

405:                                              ; preds = %384, %379
  %406 = phi float [ %403, %384 ], [ %380, %379 ]
  %407 = phi i32 [ %404, %384 ], [ %381, %379 ]
  %408 = extractelement <10 x i32> %52, i64 8
  %409 = icmp eq i32 %408, -1
  br i1 %409, label %431, label %410

410:                                              ; preds = %405
  %411 = sext i32 %408 to i64
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %411
  %413 = load i32, i32 addrspace(1)* %412, align 4, !tbaa !7, !amdgpu.noclobber !5
  %414 = sub nsw i32 %413, %1
  %415 = tail call i32 @llvm.abs.i32(i32 %414, i1 true)
  %416 = sitofp i32 %415 to float
  %417 = fdiv contract float %416, %34
  %418 = add i32 %55, %413
  %419 = tail call i32 @llvm.abs.i32(i32 %418, i1 true)
  %420 = sub nsw i32 %415, %419
  %421 = sitofp i32 %420 to float
  %422 = fmul contract float %417, %421
  %423 = fadd contract float %41, %422
  %424 = extractelement <10 x i32> %53, i64 8
  %425 = sitofp i32 %424 to float
  %426 = fdiv contract float %425, %56
  %427 = fmul contract float %426, %423
  %428 = fcmp contract ogt float %427, %406
  %429 = select i1 %428, float %427, float %406
  %430 = select i1 %428, i32 %408, i32 %407
  br label %431

431:                                              ; preds = %410, %405
  %432 = phi float [ %429, %410 ], [ %406, %405 ]
  %433 = phi i32 [ %430, %410 ], [ %407, %405 ]
  %434 = extractelement <10 x i32> %52, i64 9
  %435 = icmp eq i32 %434, -1
  br i1 %435, label %457, label %436

436:                                              ; preds = %431
  %437 = sext i32 %434 to i64
  %438 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %437
  %439 = load i32, i32 addrspace(1)* %438, align 4, !tbaa !7, !amdgpu.noclobber !5
  %440 = sub nsw i32 %439, %1
  %441 = tail call i32 @llvm.abs.i32(i32 %440, i1 true)
  %442 = sitofp i32 %441 to float
  %443 = fdiv contract float %442, %34
  %444 = add i32 %55, %439
  %445 = tail call i32 @llvm.abs.i32(i32 %444, i1 true)
  %446 = sub nsw i32 %441, %445
  %447 = sitofp i32 %446 to float
  %448 = fmul contract float %443, %447
  %449 = fadd contract float %41, %448
  %450 = extractelement <10 x i32> %53, i64 9
  %451 = sitofp i32 %450 to float
  %452 = fdiv contract float %451, %56
  %453 = fmul contract float %452, %449
  %454 = fcmp contract ogt float %453, %432
  %455 = select i1 %454, float %453, float %432
  %456 = select i1 %454, i32 %434, i32 %433
  br label %457

457:                                              ; preds = %431, %436, %22
  %458 = phi float [ 0.000000e+00, %22 ], [ %455, %436 ], [ %432, %431 ]
  %459 = phi i32 [ -1, %22 ], [ %456, %436 ], [ %433, %431 ]
  %460 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %23
  store i32 %25, i32 addrspace(1)* %460, align 4, !tbaa !7
  %461 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %23
  store i32 %20, i32 addrspace(1)* %461, align 4, !tbaa !7
  %462 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %23
  store i32 %459, i32 addrspace(1)* %462, align 4, !tbaa !7
  %463 = getelementptr inbounds float, float addrspace(1)* %10, i64 %23
  store float %458, float addrspace(1)* %463, align 4, !tbaa !13
  br label %464

464:                                              ; preds = %457, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
