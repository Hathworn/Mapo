; ModuleID = '../data/hip_kernels/11890/4/main.cu'
source_filename = "../data/hip_kernels/11890/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19needle_cuda_noshr_1PiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = xor i32 %7, -1
  %10 = add i32 %9, %4
  %11 = mul i32 %10, %2
  %12 = add nsw i32 %2, 1
  %13 = add i32 %11, %7
  %14 = shl i32 %13, 4
  %15 = add i32 %12, %14
  %16 = add i32 %15, %8
  %17 = icmp eq i32 %8, 0
  br i1 %17, label %18, label %42

18:                                               ; preds = %6
  %19 = mul nuw nsw i32 %8, %2
  %20 = sub nuw nsw i32 %16, %19
  %21 = sub nsw i32 %20, %2
  %22 = add nsw i32 %21, -1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !5
  %26 = sext i32 %20 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !5
  %29 = add nsw i32 %28, %25
  %30 = add nsw i32 %20, -1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %34 = sub nsw i32 %33, %3
  %35 = sext i32 %21 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %38 = sub nsw i32 %37, %3
  %39 = tail call i32 @llvm.smax.i32(i32 %29, i32 %34)
  %40 = tail call i32 @llvm.smax.i32(i32 %39, i32 %38)
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  store i32 %40, i32 addrspace(1)* %41, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %6, %18
  %43 = icmp ugt i32 %8, 1
  br i1 %43, label %69, label %44

44:                                               ; preds = %42
  %45 = sub nuw nsw i32 1, %8
  %46 = mul nuw nsw i32 %45, %2
  %47 = add i32 %16, %46
  %48 = sub nsw i32 %47, %2
  %49 = add nsw i32 %48, -1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5
  %53 = sext i32 %47 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %56 = add nsw i32 %55, %52
  %57 = add nsw i32 %47, -1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5
  %61 = sub nsw i32 %60, %3
  %62 = sext i32 %48 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !5
  %65 = sub nsw i32 %64, %3
  %66 = tail call i32 @llvm.smax.i32(i32 %56, i32 %61)
  %67 = tail call i32 @llvm.smax.i32(i32 %66, i32 %65)
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %67, i32 addrspace(1)* %68, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %44, %42
  %70 = icmp ugt i32 %8, 2
  br i1 %70, label %96, label %71

71:                                               ; preds = %69
  %72 = sub nuw nsw i32 2, %8
  %73 = mul nsw i32 %72, %2
  %74 = add i32 %16, %73
  %75 = sub nsw i32 %74, %2
  %76 = add nsw i32 %75, -1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5
  %80 = sext i32 %74 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5
  %83 = add nsw i32 %82, %79
  %84 = add nsw i32 %74, -1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5
  %88 = sub nsw i32 %87, %3
  %89 = sext i32 %75 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5
  %92 = sub nsw i32 %91, %3
  %93 = tail call i32 @llvm.smax.i32(i32 %83, i32 %88)
  %94 = tail call i32 @llvm.smax.i32(i32 %93, i32 %92)
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  store i32 %94, i32 addrspace(1)* %95, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %71, %69
  %97 = icmp ugt i32 %8, 3
  br i1 %97, label %123, label %98

98:                                               ; preds = %96
  %99 = sub nuw nsw i32 3, %8
  %100 = mul nsw i32 %99, %2
  %101 = add i32 %16, %100
  %102 = sub nsw i32 %101, %2
  %103 = add nsw i32 %102, -1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !5
  %107 = sext i32 %101 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !5
  %110 = add nsw i32 %109, %106
  %111 = add nsw i32 %101, -1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %112
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !5
  %115 = sub nsw i32 %114, %3
  %116 = sext i32 %102 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !5
  %119 = sub nsw i32 %118, %3
  %120 = tail call i32 @llvm.smax.i32(i32 %110, i32 %115)
  %121 = tail call i32 @llvm.smax.i32(i32 %120, i32 %119)
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %107
  store i32 %121, i32 addrspace(1)* %122, align 4, !tbaa !5
  br label %123

123:                                              ; preds = %98, %96
  %124 = icmp ugt i32 %8, 4
  br i1 %124, label %150, label %125

125:                                              ; preds = %123
  %126 = sub nuw nsw i32 4, %8
  %127 = mul nsw i32 %126, %2
  %128 = add i32 %16, %127
  %129 = sub nsw i32 %128, %2
  %130 = add nsw i32 %129, -1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !5
  %134 = sext i32 %128 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !5
  %137 = add nsw i32 %136, %133
  %138 = add nsw i32 %128, -1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !5
  %142 = sub nsw i32 %141, %3
  %143 = sext i32 %129 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !5
  %146 = sub nsw i32 %145, %3
  %147 = tail call i32 @llvm.smax.i32(i32 %137, i32 %142)
  %148 = tail call i32 @llvm.smax.i32(i32 %147, i32 %146)
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %134
  store i32 %148, i32 addrspace(1)* %149, align 4, !tbaa !5
  br label %150

150:                                              ; preds = %125, %123
  %151 = icmp ugt i32 %8, 5
  br i1 %151, label %177, label %152

152:                                              ; preds = %150
  %153 = sub nuw nsw i32 5, %8
  %154 = mul nsw i32 %153, %2
  %155 = add i32 %16, %154
  %156 = sub nsw i32 %155, %2
  %157 = add nsw i32 %156, -1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %158
  %160 = load i32, i32 addrspace(1)* %159, align 4, !tbaa !5
  %161 = sext i32 %155 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !5
  %164 = add nsw i32 %163, %160
  %165 = add nsw i32 %155, -1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !5
  %169 = sub nsw i32 %168, %3
  %170 = sext i32 %156 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %170
  %172 = load i32, i32 addrspace(1)* %171, align 4, !tbaa !5
  %173 = sub nsw i32 %172, %3
  %174 = tail call i32 @llvm.smax.i32(i32 %164, i32 %169)
  %175 = tail call i32 @llvm.smax.i32(i32 %174, i32 %173)
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %161
  store i32 %175, i32 addrspace(1)* %176, align 4, !tbaa !5
  br label %177

177:                                              ; preds = %152, %150
  %178 = icmp ugt i32 %8, 6
  br i1 %178, label %204, label %179

179:                                              ; preds = %177
  %180 = sub nuw nsw i32 6, %8
  %181 = mul nsw i32 %180, %2
  %182 = add i32 %16, %181
  %183 = sub nsw i32 %182, %2
  %184 = add nsw i32 %183, -1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !5
  %188 = sext i32 %182 to i64
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %188
  %190 = load i32, i32 addrspace(1)* %189, align 4, !tbaa !5
  %191 = add nsw i32 %190, %187
  %192 = add nsw i32 %182, -1
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %193
  %195 = load i32, i32 addrspace(1)* %194, align 4, !tbaa !5
  %196 = sub nsw i32 %195, %3
  %197 = sext i32 %183 to i64
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %197
  %199 = load i32, i32 addrspace(1)* %198, align 4, !tbaa !5
  %200 = sub nsw i32 %199, %3
  %201 = tail call i32 @llvm.smax.i32(i32 %191, i32 %196)
  %202 = tail call i32 @llvm.smax.i32(i32 %201, i32 %200)
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %188
  store i32 %202, i32 addrspace(1)* %203, align 4, !tbaa !5
  br label %204

204:                                              ; preds = %179, %177
  %205 = icmp ugt i32 %8, 7
  br i1 %205, label %231, label %206

206:                                              ; preds = %204
  %207 = sub nuw nsw i32 7, %8
  %208 = mul nsw i32 %207, %2
  %209 = add i32 %16, %208
  %210 = sub nsw i32 %209, %2
  %211 = add nsw i32 %210, -1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %212
  %214 = load i32, i32 addrspace(1)* %213, align 4, !tbaa !5
  %215 = sext i32 %209 to i64
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %215
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !5
  %218 = add nsw i32 %217, %214
  %219 = add nsw i32 %209, -1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %220
  %222 = load i32, i32 addrspace(1)* %221, align 4, !tbaa !5
  %223 = sub nsw i32 %222, %3
  %224 = sext i32 %210 to i64
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %224
  %226 = load i32, i32 addrspace(1)* %225, align 4, !tbaa !5
  %227 = sub nsw i32 %226, %3
  %228 = tail call i32 @llvm.smax.i32(i32 %218, i32 %223)
  %229 = tail call i32 @llvm.smax.i32(i32 %228, i32 %227)
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %215
  store i32 %229, i32 addrspace(1)* %230, align 4, !tbaa !5
  br label %231

231:                                              ; preds = %206, %204
  %232 = icmp ugt i32 %8, 8
  br i1 %232, label %258, label %233

233:                                              ; preds = %231
  %234 = sub nuw nsw i32 8, %8
  %235 = mul nsw i32 %234, %2
  %236 = add i32 %16, %235
  %237 = sub nsw i32 %236, %2
  %238 = add nsw i32 %237, -1
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %239
  %241 = load i32, i32 addrspace(1)* %240, align 4, !tbaa !5
  %242 = sext i32 %236 to i64
  %243 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %242
  %244 = load i32, i32 addrspace(1)* %243, align 4, !tbaa !5
  %245 = add nsw i32 %244, %241
  %246 = add nsw i32 %236, -1
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %247
  %249 = load i32, i32 addrspace(1)* %248, align 4, !tbaa !5
  %250 = sub nsw i32 %249, %3
  %251 = sext i32 %237 to i64
  %252 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %251
  %253 = load i32, i32 addrspace(1)* %252, align 4, !tbaa !5
  %254 = sub nsw i32 %253, %3
  %255 = tail call i32 @llvm.smax.i32(i32 %245, i32 %250)
  %256 = tail call i32 @llvm.smax.i32(i32 %255, i32 %254)
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %242
  store i32 %256, i32 addrspace(1)* %257, align 4, !tbaa !5
  br label %258

258:                                              ; preds = %233, %231
  %259 = icmp ugt i32 %8, 9
  br i1 %259, label %285, label %260

260:                                              ; preds = %258
  %261 = sub nuw nsw i32 9, %8
  %262 = mul nsw i32 %261, %2
  %263 = add i32 %16, %262
  %264 = sub nsw i32 %263, %2
  %265 = add nsw i32 %264, -1
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %266
  %268 = load i32, i32 addrspace(1)* %267, align 4, !tbaa !5
  %269 = sext i32 %263 to i64
  %270 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %269
  %271 = load i32, i32 addrspace(1)* %270, align 4, !tbaa !5
  %272 = add nsw i32 %271, %268
  %273 = add nsw i32 %263, -1
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %274
  %276 = load i32, i32 addrspace(1)* %275, align 4, !tbaa !5
  %277 = sub nsw i32 %276, %3
  %278 = sext i32 %264 to i64
  %279 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %278
  %280 = load i32, i32 addrspace(1)* %279, align 4, !tbaa !5
  %281 = sub nsw i32 %280, %3
  %282 = tail call i32 @llvm.smax.i32(i32 %272, i32 %277)
  %283 = tail call i32 @llvm.smax.i32(i32 %282, i32 %281)
  %284 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %269
  store i32 %283, i32 addrspace(1)* %284, align 4, !tbaa !5
  br label %285

285:                                              ; preds = %260, %258
  %286 = icmp ugt i32 %8, 10
  br i1 %286, label %312, label %287

287:                                              ; preds = %285
  %288 = sub nuw nsw i32 10, %8
  %289 = mul nsw i32 %288, %2
  %290 = add i32 %16, %289
  %291 = sub nsw i32 %290, %2
  %292 = add nsw i32 %291, -1
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !5
  %296 = sext i32 %290 to i64
  %297 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %296
  %298 = load i32, i32 addrspace(1)* %297, align 4, !tbaa !5
  %299 = add nsw i32 %298, %295
  %300 = add nsw i32 %290, -1
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %301
  %303 = load i32, i32 addrspace(1)* %302, align 4, !tbaa !5
  %304 = sub nsw i32 %303, %3
  %305 = sext i32 %291 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !5
  %308 = sub nsw i32 %307, %3
  %309 = tail call i32 @llvm.smax.i32(i32 %299, i32 %304)
  %310 = tail call i32 @llvm.smax.i32(i32 %309, i32 %308)
  %311 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %296
  store i32 %310, i32 addrspace(1)* %311, align 4, !tbaa !5
  br label %312

312:                                              ; preds = %287, %285
  %313 = icmp ugt i32 %8, 11
  br i1 %313, label %339, label %314

314:                                              ; preds = %312
  %315 = sub nuw nsw i32 11, %8
  %316 = mul nsw i32 %315, %2
  %317 = add i32 %16, %316
  %318 = sub nsw i32 %317, %2
  %319 = add nsw i32 %318, -1
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %320
  %322 = load i32, i32 addrspace(1)* %321, align 4, !tbaa !5
  %323 = sext i32 %317 to i64
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %323
  %325 = load i32, i32 addrspace(1)* %324, align 4, !tbaa !5
  %326 = add nsw i32 %325, %322
  %327 = add nsw i32 %317, -1
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %328
  %330 = load i32, i32 addrspace(1)* %329, align 4, !tbaa !5
  %331 = sub nsw i32 %330, %3
  %332 = sext i32 %318 to i64
  %333 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %332
  %334 = load i32, i32 addrspace(1)* %333, align 4, !tbaa !5
  %335 = sub nsw i32 %334, %3
  %336 = tail call i32 @llvm.smax.i32(i32 %326, i32 %331)
  %337 = tail call i32 @llvm.smax.i32(i32 %336, i32 %335)
  %338 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %323
  store i32 %337, i32 addrspace(1)* %338, align 4, !tbaa !5
  br label %339

339:                                              ; preds = %314, %312
  %340 = icmp ugt i32 %8, 12
  br i1 %340, label %366, label %341

341:                                              ; preds = %339
  %342 = sub nuw nsw i32 12, %8
  %343 = mul nsw i32 %342, %2
  %344 = add i32 %16, %343
  %345 = sub nsw i32 %344, %2
  %346 = add nsw i32 %345, -1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %347
  %349 = load i32, i32 addrspace(1)* %348, align 4, !tbaa !5
  %350 = sext i32 %344 to i64
  %351 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %350
  %352 = load i32, i32 addrspace(1)* %351, align 4, !tbaa !5
  %353 = add nsw i32 %352, %349
  %354 = add nsw i32 %344, -1
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %355
  %357 = load i32, i32 addrspace(1)* %356, align 4, !tbaa !5
  %358 = sub nsw i32 %357, %3
  %359 = sext i32 %345 to i64
  %360 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %359
  %361 = load i32, i32 addrspace(1)* %360, align 4, !tbaa !5
  %362 = sub nsw i32 %361, %3
  %363 = tail call i32 @llvm.smax.i32(i32 %353, i32 %358)
  %364 = tail call i32 @llvm.smax.i32(i32 %363, i32 %362)
  %365 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %350
  store i32 %364, i32 addrspace(1)* %365, align 4, !tbaa !5
  br label %366

366:                                              ; preds = %341, %339
  %367 = icmp ugt i32 %8, 13
  br i1 %367, label %393, label %368

368:                                              ; preds = %366
  %369 = sub nuw nsw i32 13, %8
  %370 = mul nsw i32 %369, %2
  %371 = add i32 %16, %370
  %372 = sub nsw i32 %371, %2
  %373 = add nsw i32 %372, -1
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %374
  %376 = load i32, i32 addrspace(1)* %375, align 4, !tbaa !5
  %377 = sext i32 %371 to i64
  %378 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %377
  %379 = load i32, i32 addrspace(1)* %378, align 4, !tbaa !5
  %380 = add nsw i32 %379, %376
  %381 = add nsw i32 %371, -1
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %382
  %384 = load i32, i32 addrspace(1)* %383, align 4, !tbaa !5
  %385 = sub nsw i32 %384, %3
  %386 = sext i32 %372 to i64
  %387 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %386
  %388 = load i32, i32 addrspace(1)* %387, align 4, !tbaa !5
  %389 = sub nsw i32 %388, %3
  %390 = tail call i32 @llvm.smax.i32(i32 %380, i32 %385)
  %391 = tail call i32 @llvm.smax.i32(i32 %390, i32 %389)
  %392 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %377
  store i32 %391, i32 addrspace(1)* %392, align 4, !tbaa !5
  br label %393

393:                                              ; preds = %368, %366
  %394 = icmp ugt i32 %8, 14
  br i1 %394, label %420, label %395

395:                                              ; preds = %393
  %396 = sub nuw nsw i32 14, %8
  %397 = mul nsw i32 %396, %2
  %398 = add i32 %16, %397
  %399 = sub nsw i32 %398, %2
  %400 = add nsw i32 %399, -1
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %401
  %403 = load i32, i32 addrspace(1)* %402, align 4, !tbaa !5
  %404 = sext i32 %398 to i64
  %405 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %404
  %406 = load i32, i32 addrspace(1)* %405, align 4, !tbaa !5
  %407 = add nsw i32 %406, %403
  %408 = add nsw i32 %398, -1
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %409
  %411 = load i32, i32 addrspace(1)* %410, align 4, !tbaa !5
  %412 = sub nsw i32 %411, %3
  %413 = sext i32 %399 to i64
  %414 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %413
  %415 = load i32, i32 addrspace(1)* %414, align 4, !tbaa !5
  %416 = sub nsw i32 %415, %3
  %417 = tail call i32 @llvm.smax.i32(i32 %407, i32 %412)
  %418 = tail call i32 @llvm.smax.i32(i32 %417, i32 %416)
  %419 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %404
  store i32 %418, i32 addrspace(1)* %419, align 4, !tbaa !5
  br label %420

420:                                              ; preds = %395, %393
  %421 = icmp ugt i32 %8, 15
  %422 = sub nsw i32 15, %8
  %423 = mul nsw i32 %422, %2
  br i1 %421, label %447, label %424

424:                                              ; preds = %420
  %425 = add i32 %16, %423
  %426 = sub nsw i32 %425, %2
  %427 = add nsw i32 %426, -1
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %428
  %430 = load i32, i32 addrspace(1)* %429, align 4, !tbaa !5
  %431 = sext i32 %425 to i64
  %432 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %431
  %433 = load i32, i32 addrspace(1)* %432, align 4, !tbaa !5
  %434 = add nsw i32 %433, %430
  %435 = add nsw i32 %425, -1
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %436
  %438 = load i32, i32 addrspace(1)* %437, align 4, !tbaa !5
  %439 = sub nsw i32 %438, %3
  %440 = sext i32 %426 to i64
  %441 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %440
  %442 = load i32, i32 addrspace(1)* %441, align 4, !tbaa !5
  %443 = sub nsw i32 %442, %3
  %444 = tail call i32 @llvm.smax.i32(i32 %434, i32 %439)
  %445 = tail call i32 @llvm.smax.i32(i32 %444, i32 %443)
  %446 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %431
  store i32 %445, i32 addrspace(1)* %446, align 4, !tbaa !5
  br label %447

447:                                              ; preds = %420, %424
  %448 = add nuw nsw i32 %8, 15
  %449 = add i32 %448, %423
  %450 = add i32 %449, %15
  br i1 %394, label %474, label %451

451:                                              ; preds = %447
  %452 = add i32 %450, -14
  %453 = sub nsw i32 %452, %2
  %454 = add nsw i32 %453, -1
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %455
  %457 = load i32, i32 addrspace(1)* %456, align 4, !tbaa !5
  %458 = sext i32 %452 to i64
  %459 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %458
  %460 = load i32, i32 addrspace(1)* %459, align 4, !tbaa !5
  %461 = add nsw i32 %460, %457
  %462 = add i32 %450, -15
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %463
  %465 = load i32, i32 addrspace(1)* %464, align 4, !tbaa !5
  %466 = sub nsw i32 %465, %3
  %467 = sext i32 %453 to i64
  %468 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %467
  %469 = load i32, i32 addrspace(1)* %468, align 4, !tbaa !5
  %470 = sub nsw i32 %469, %3
  %471 = tail call i32 @llvm.smax.i32(i32 %461, i32 %466)
  %472 = tail call i32 @llvm.smax.i32(i32 %471, i32 %470)
  %473 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %458
  store i32 %472, i32 addrspace(1)* %473, align 4, !tbaa !5
  br label %474

474:                                              ; preds = %447, %451
  br i1 %367, label %498, label %475

475:                                              ; preds = %474
  %476 = add i32 %450, -13
  %477 = sub nsw i32 %476, %2
  %478 = add nsw i32 %477, -1
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %479
  %481 = load i32, i32 addrspace(1)* %480, align 4, !tbaa !5
  %482 = sext i32 %476 to i64
  %483 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %482
  %484 = load i32, i32 addrspace(1)* %483, align 4, !tbaa !5
  %485 = add nsw i32 %484, %481
  %486 = add i32 %450, -14
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %487
  %489 = load i32, i32 addrspace(1)* %488, align 4, !tbaa !5
  %490 = sub nsw i32 %489, %3
  %491 = sext i32 %477 to i64
  %492 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %491
  %493 = load i32, i32 addrspace(1)* %492, align 4, !tbaa !5
  %494 = sub nsw i32 %493, %3
  %495 = tail call i32 @llvm.smax.i32(i32 %485, i32 %490)
  %496 = tail call i32 @llvm.smax.i32(i32 %495, i32 %494)
  %497 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %482
  store i32 %496, i32 addrspace(1)* %497, align 4, !tbaa !5
  br label %498

498:                                              ; preds = %475, %474
  br i1 %340, label %522, label %499

499:                                              ; preds = %498
  %500 = add i32 %450, -12
  %501 = sub nsw i32 %500, %2
  %502 = add nsw i32 %501, -1
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %503
  %505 = load i32, i32 addrspace(1)* %504, align 4, !tbaa !5
  %506 = sext i32 %500 to i64
  %507 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %506
  %508 = load i32, i32 addrspace(1)* %507, align 4, !tbaa !5
  %509 = add nsw i32 %508, %505
  %510 = add i32 %450, -13
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %511
  %513 = load i32, i32 addrspace(1)* %512, align 4, !tbaa !5
  %514 = sub nsw i32 %513, %3
  %515 = sext i32 %501 to i64
  %516 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %515
  %517 = load i32, i32 addrspace(1)* %516, align 4, !tbaa !5
  %518 = sub nsw i32 %517, %3
  %519 = tail call i32 @llvm.smax.i32(i32 %509, i32 %514)
  %520 = tail call i32 @llvm.smax.i32(i32 %519, i32 %518)
  %521 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %506
  store i32 %520, i32 addrspace(1)* %521, align 4, !tbaa !5
  br label %522

522:                                              ; preds = %499, %498
  br i1 %313, label %546, label %523

523:                                              ; preds = %522
  %524 = add i32 %450, -11
  %525 = sub nsw i32 %524, %2
  %526 = add nsw i32 %525, -1
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %527
  %529 = load i32, i32 addrspace(1)* %528, align 4, !tbaa !5
  %530 = sext i32 %524 to i64
  %531 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %530
  %532 = load i32, i32 addrspace(1)* %531, align 4, !tbaa !5
  %533 = add nsw i32 %532, %529
  %534 = add i32 %450, -12
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %535
  %537 = load i32, i32 addrspace(1)* %536, align 4, !tbaa !5
  %538 = sub nsw i32 %537, %3
  %539 = sext i32 %525 to i64
  %540 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %539
  %541 = load i32, i32 addrspace(1)* %540, align 4, !tbaa !5
  %542 = sub nsw i32 %541, %3
  %543 = tail call i32 @llvm.smax.i32(i32 %533, i32 %538)
  %544 = tail call i32 @llvm.smax.i32(i32 %543, i32 %542)
  %545 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %530
  store i32 %544, i32 addrspace(1)* %545, align 4, !tbaa !5
  br label %546

546:                                              ; preds = %523, %522
  br i1 %286, label %570, label %547

547:                                              ; preds = %546
  %548 = add i32 %450, -10
  %549 = sub nsw i32 %548, %2
  %550 = add nsw i32 %549, -1
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %551
  %553 = load i32, i32 addrspace(1)* %552, align 4, !tbaa !5
  %554 = sext i32 %548 to i64
  %555 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %554
  %556 = load i32, i32 addrspace(1)* %555, align 4, !tbaa !5
  %557 = add nsw i32 %556, %553
  %558 = add i32 %450, -11
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %559
  %561 = load i32, i32 addrspace(1)* %560, align 4, !tbaa !5
  %562 = sub nsw i32 %561, %3
  %563 = sext i32 %549 to i64
  %564 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %563
  %565 = load i32, i32 addrspace(1)* %564, align 4, !tbaa !5
  %566 = sub nsw i32 %565, %3
  %567 = tail call i32 @llvm.smax.i32(i32 %557, i32 %562)
  %568 = tail call i32 @llvm.smax.i32(i32 %567, i32 %566)
  %569 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %554
  store i32 %568, i32 addrspace(1)* %569, align 4, !tbaa !5
  br label %570

570:                                              ; preds = %547, %546
  br i1 %259, label %594, label %571

571:                                              ; preds = %570
  %572 = add i32 %450, -9
  %573 = sub nsw i32 %572, %2
  %574 = add nsw i32 %573, -1
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %575
  %577 = load i32, i32 addrspace(1)* %576, align 4, !tbaa !5
  %578 = sext i32 %572 to i64
  %579 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %578
  %580 = load i32, i32 addrspace(1)* %579, align 4, !tbaa !5
  %581 = add nsw i32 %580, %577
  %582 = add i32 %450, -10
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %583
  %585 = load i32, i32 addrspace(1)* %584, align 4, !tbaa !5
  %586 = sub nsw i32 %585, %3
  %587 = sext i32 %573 to i64
  %588 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %587
  %589 = load i32, i32 addrspace(1)* %588, align 4, !tbaa !5
  %590 = sub nsw i32 %589, %3
  %591 = tail call i32 @llvm.smax.i32(i32 %581, i32 %586)
  %592 = tail call i32 @llvm.smax.i32(i32 %591, i32 %590)
  %593 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %578
  store i32 %592, i32 addrspace(1)* %593, align 4, !tbaa !5
  br label %594

594:                                              ; preds = %571, %570
  br i1 %232, label %618, label %595

595:                                              ; preds = %594
  %596 = add i32 %450, -8
  %597 = sub nsw i32 %596, %2
  %598 = add nsw i32 %597, -1
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %599
  %601 = load i32, i32 addrspace(1)* %600, align 4, !tbaa !5
  %602 = sext i32 %596 to i64
  %603 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %602
  %604 = load i32, i32 addrspace(1)* %603, align 4, !tbaa !5
  %605 = add nsw i32 %604, %601
  %606 = add i32 %450, -9
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %607
  %609 = load i32, i32 addrspace(1)* %608, align 4, !tbaa !5
  %610 = sub nsw i32 %609, %3
  %611 = sext i32 %597 to i64
  %612 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %611
  %613 = load i32, i32 addrspace(1)* %612, align 4, !tbaa !5
  %614 = sub nsw i32 %613, %3
  %615 = tail call i32 @llvm.smax.i32(i32 %605, i32 %610)
  %616 = tail call i32 @llvm.smax.i32(i32 %615, i32 %614)
  %617 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %602
  store i32 %616, i32 addrspace(1)* %617, align 4, !tbaa !5
  br label %618

618:                                              ; preds = %595, %594
  br i1 %205, label %642, label %619

619:                                              ; preds = %618
  %620 = add i32 %450, -7
  %621 = sub nsw i32 %620, %2
  %622 = add nsw i32 %621, -1
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %623
  %625 = load i32, i32 addrspace(1)* %624, align 4, !tbaa !5
  %626 = sext i32 %620 to i64
  %627 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %626
  %628 = load i32, i32 addrspace(1)* %627, align 4, !tbaa !5
  %629 = add nsw i32 %628, %625
  %630 = add i32 %450, -8
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %631
  %633 = load i32, i32 addrspace(1)* %632, align 4, !tbaa !5
  %634 = sub nsw i32 %633, %3
  %635 = sext i32 %621 to i64
  %636 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %635
  %637 = load i32, i32 addrspace(1)* %636, align 4, !tbaa !5
  %638 = sub nsw i32 %637, %3
  %639 = tail call i32 @llvm.smax.i32(i32 %629, i32 %634)
  %640 = tail call i32 @llvm.smax.i32(i32 %639, i32 %638)
  %641 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %626
  store i32 %640, i32 addrspace(1)* %641, align 4, !tbaa !5
  br label %642

642:                                              ; preds = %619, %618
  br i1 %178, label %666, label %643

643:                                              ; preds = %642
  %644 = add i32 %450, -6
  %645 = sub nsw i32 %644, %2
  %646 = add nsw i32 %645, -1
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %647
  %649 = load i32, i32 addrspace(1)* %648, align 4, !tbaa !5
  %650 = sext i32 %644 to i64
  %651 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %650
  %652 = load i32, i32 addrspace(1)* %651, align 4, !tbaa !5
  %653 = add nsw i32 %652, %649
  %654 = add i32 %450, -7
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %655
  %657 = load i32, i32 addrspace(1)* %656, align 4, !tbaa !5
  %658 = sub nsw i32 %657, %3
  %659 = sext i32 %645 to i64
  %660 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %659
  %661 = load i32, i32 addrspace(1)* %660, align 4, !tbaa !5
  %662 = sub nsw i32 %661, %3
  %663 = tail call i32 @llvm.smax.i32(i32 %653, i32 %658)
  %664 = tail call i32 @llvm.smax.i32(i32 %663, i32 %662)
  %665 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %650
  store i32 %664, i32 addrspace(1)* %665, align 4, !tbaa !5
  br label %666

666:                                              ; preds = %643, %642
  br i1 %151, label %690, label %667

667:                                              ; preds = %666
  %668 = add i32 %450, -5
  %669 = sub nsw i32 %668, %2
  %670 = add nsw i32 %669, -1
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %671
  %673 = load i32, i32 addrspace(1)* %672, align 4, !tbaa !5
  %674 = sext i32 %668 to i64
  %675 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %674
  %676 = load i32, i32 addrspace(1)* %675, align 4, !tbaa !5
  %677 = add nsw i32 %676, %673
  %678 = add i32 %450, -6
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %679
  %681 = load i32, i32 addrspace(1)* %680, align 4, !tbaa !5
  %682 = sub nsw i32 %681, %3
  %683 = sext i32 %669 to i64
  %684 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %683
  %685 = load i32, i32 addrspace(1)* %684, align 4, !tbaa !5
  %686 = sub nsw i32 %685, %3
  %687 = tail call i32 @llvm.smax.i32(i32 %677, i32 %682)
  %688 = tail call i32 @llvm.smax.i32(i32 %687, i32 %686)
  %689 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %674
  store i32 %688, i32 addrspace(1)* %689, align 4, !tbaa !5
  br label %690

690:                                              ; preds = %667, %666
  br i1 %124, label %714, label %691

691:                                              ; preds = %690
  %692 = add i32 %450, -4
  %693 = sub nsw i32 %692, %2
  %694 = add nsw i32 %693, -1
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %695
  %697 = load i32, i32 addrspace(1)* %696, align 4, !tbaa !5
  %698 = sext i32 %692 to i64
  %699 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %698
  %700 = load i32, i32 addrspace(1)* %699, align 4, !tbaa !5
  %701 = add nsw i32 %700, %697
  %702 = add i32 %450, -5
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %703
  %705 = load i32, i32 addrspace(1)* %704, align 4, !tbaa !5
  %706 = sub nsw i32 %705, %3
  %707 = sext i32 %693 to i64
  %708 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %707
  %709 = load i32, i32 addrspace(1)* %708, align 4, !tbaa !5
  %710 = sub nsw i32 %709, %3
  %711 = tail call i32 @llvm.smax.i32(i32 %701, i32 %706)
  %712 = tail call i32 @llvm.smax.i32(i32 %711, i32 %710)
  %713 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %698
  store i32 %712, i32 addrspace(1)* %713, align 4, !tbaa !5
  br label %714

714:                                              ; preds = %691, %690
  br i1 %97, label %738, label %715

715:                                              ; preds = %714
  %716 = add i32 %450, -3
  %717 = sub nsw i32 %716, %2
  %718 = add nsw i32 %717, -1
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %719
  %721 = load i32, i32 addrspace(1)* %720, align 4, !tbaa !5
  %722 = sext i32 %716 to i64
  %723 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %722
  %724 = load i32, i32 addrspace(1)* %723, align 4, !tbaa !5
  %725 = add nsw i32 %724, %721
  %726 = add i32 %450, -4
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %727
  %729 = load i32, i32 addrspace(1)* %728, align 4, !tbaa !5
  %730 = sub nsw i32 %729, %3
  %731 = sext i32 %717 to i64
  %732 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %731
  %733 = load i32, i32 addrspace(1)* %732, align 4, !tbaa !5
  %734 = sub nsw i32 %733, %3
  %735 = tail call i32 @llvm.smax.i32(i32 %725, i32 %730)
  %736 = tail call i32 @llvm.smax.i32(i32 %735, i32 %734)
  %737 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %722
  store i32 %736, i32 addrspace(1)* %737, align 4, !tbaa !5
  br label %738

738:                                              ; preds = %715, %714
  br i1 %70, label %762, label %739

739:                                              ; preds = %738
  %740 = add i32 %450, -2
  %741 = sub nsw i32 %740, %2
  %742 = add nsw i32 %741, -1
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %743
  %745 = load i32, i32 addrspace(1)* %744, align 4, !tbaa !5
  %746 = sext i32 %740 to i64
  %747 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %746
  %748 = load i32, i32 addrspace(1)* %747, align 4, !tbaa !5
  %749 = add nsw i32 %748, %745
  %750 = add i32 %450, -3
  %751 = sext i32 %750 to i64
  %752 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %751
  %753 = load i32, i32 addrspace(1)* %752, align 4, !tbaa !5
  %754 = sub nsw i32 %753, %3
  %755 = sext i32 %741 to i64
  %756 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %755
  %757 = load i32, i32 addrspace(1)* %756, align 4, !tbaa !5
  %758 = sub nsw i32 %757, %3
  %759 = tail call i32 @llvm.smax.i32(i32 %749, i32 %754)
  %760 = tail call i32 @llvm.smax.i32(i32 %759, i32 %758)
  %761 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %746
  store i32 %760, i32 addrspace(1)* %761, align 4, !tbaa !5
  br label %762

762:                                              ; preds = %739, %738
  br i1 %43, label %786, label %763

763:                                              ; preds = %762
  %764 = add i32 %450, -1
  %765 = sub nsw i32 %764, %2
  %766 = add nsw i32 %765, -1
  %767 = sext i32 %766 to i64
  %768 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %767
  %769 = load i32, i32 addrspace(1)* %768, align 4, !tbaa !5
  %770 = sext i32 %764 to i64
  %771 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %770
  %772 = load i32, i32 addrspace(1)* %771, align 4, !tbaa !5
  %773 = add nsw i32 %772, %769
  %774 = add i32 %450, -2
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %775
  %777 = load i32, i32 addrspace(1)* %776, align 4, !tbaa !5
  %778 = sub nsw i32 %777, %3
  %779 = sext i32 %765 to i64
  %780 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %779
  %781 = load i32, i32 addrspace(1)* %780, align 4, !tbaa !5
  %782 = sub nsw i32 %781, %3
  %783 = tail call i32 @llvm.smax.i32(i32 %773, i32 %778)
  %784 = tail call i32 @llvm.smax.i32(i32 %783, i32 %782)
  %785 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %770
  store i32 %784, i32 addrspace(1)* %785, align 4, !tbaa !5
  br label %786

786:                                              ; preds = %763, %762
  br i1 %17, label %787, label %809

787:                                              ; preds = %786
  %788 = sub nsw i32 %450, %2
  %789 = add nsw i32 %788, -1
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %790
  %792 = load i32, i32 addrspace(1)* %791, align 4, !tbaa !5
  %793 = sext i32 %450 to i64
  %794 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %793
  %795 = load i32, i32 addrspace(1)* %794, align 4, !tbaa !5
  %796 = add nsw i32 %795, %792
  %797 = add nsw i32 %450, -1
  %798 = sext i32 %797 to i64
  %799 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %798
  %800 = load i32, i32 addrspace(1)* %799, align 4, !tbaa !5
  %801 = sub nsw i32 %800, %3
  %802 = sext i32 %788 to i64
  %803 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %802
  %804 = load i32, i32 addrspace(1)* %803, align 4, !tbaa !5
  %805 = sub nsw i32 %804, %3
  %806 = tail call i32 @llvm.smax.i32(i32 %796, i32 %801)
  %807 = tail call i32 @llvm.smax.i32(i32 %806, i32 %805)
  %808 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %793
  store i32 %807, i32 addrspace(1)* %808, align 4, !tbaa !5
  br label %809

809:                                              ; preds = %787, %786
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
