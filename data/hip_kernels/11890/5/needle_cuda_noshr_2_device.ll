; ModuleID = '../data/hip_kernels/11890/5/main.cu'
source_filename = "../data/hip_kernels/11890/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19needle_cuda_noshr_2PiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = sub i32 %7, %4
  %10 = add i32 %9, %5
  %11 = xor i32 %7, -1
  %12 = add i32 %11, %5
  %13 = mul i32 %12, %2
  %14 = add nsw i32 %2, 1
  %15 = add i32 %10, %13
  %16 = shl i32 %15, 4
  %17 = add i32 %14, %16
  %18 = add i32 %17, %8
  %19 = icmp eq i32 %8, 0
  br i1 %19, label %20, label %44

20:                                               ; preds = %6
  %21 = mul nuw nsw i32 %8, %2
  %22 = sub nuw nsw i32 %18, %21
  %23 = sub nsw i32 %22, %2
  %24 = add nsw i32 %23, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5
  %28 = sext i32 %22 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5
  %31 = add nsw i32 %30, %27
  %32 = add nsw i32 %22, -1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5
  %36 = sub nsw i32 %35, %3
  %37 = sext i32 %23 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5
  %40 = sub nsw i32 %39, %3
  %41 = tail call i32 @llvm.smax.i32(i32 %31, i32 %36)
  %42 = tail call i32 @llvm.smax.i32(i32 %41, i32 %40)
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  store i32 %42, i32 addrspace(1)* %43, align 4, !tbaa !5
  br label %44

44:                                               ; preds = %6, %20
  %45 = icmp ugt i32 %8, 1
  br i1 %45, label %71, label %46

46:                                               ; preds = %44
  %47 = sub nuw nsw i32 1, %8
  %48 = mul nuw nsw i32 %47, %2
  %49 = add i32 %18, %48
  %50 = sub nsw i32 %49, %2
  %51 = add nsw i32 %50, -1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !5
  %55 = sext i32 %49 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5
  %58 = add nsw i32 %57, %54
  %59 = add nsw i32 %49, -1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %63 = sub nsw i32 %62, %3
  %64 = sext i32 %50 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !5
  %67 = sub nsw i32 %66, %3
  %68 = tail call i32 @llvm.smax.i32(i32 %58, i32 %63)
  %69 = tail call i32 @llvm.smax.i32(i32 %68, i32 %67)
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %46, %44
  %72 = icmp ugt i32 %8, 2
  br i1 %72, label %98, label %73

73:                                               ; preds = %71
  %74 = sub nuw nsw i32 2, %8
  %75 = mul nsw i32 %74, %2
  %76 = add i32 %18, %75
  %77 = sub nsw i32 %76, %2
  %78 = add nsw i32 %77, -1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5
  %82 = sext i32 %76 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5
  %85 = add nsw i32 %84, %81
  %86 = add nsw i32 %76, -1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !5
  %90 = sub nsw i32 %89, %3
  %91 = sext i32 %77 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5
  %94 = sub nsw i32 %93, %3
  %95 = tail call i32 @llvm.smax.i32(i32 %85, i32 %90)
  %96 = tail call i32 @llvm.smax.i32(i32 %95, i32 %94)
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  store i32 %96, i32 addrspace(1)* %97, align 4, !tbaa !5
  br label %98

98:                                               ; preds = %73, %71
  %99 = icmp ugt i32 %8, 3
  br i1 %99, label %125, label %100

100:                                              ; preds = %98
  %101 = sub nuw nsw i32 3, %8
  %102 = mul nsw i32 %101, %2
  %103 = add i32 %18, %102
  %104 = sub nsw i32 %103, %2
  %105 = add nsw i32 %104, -1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !5
  %109 = sext i32 %103 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !5
  %112 = add nsw i32 %111, %108
  %113 = add nsw i32 %103, -1
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !5
  %117 = sub nsw i32 %116, %3
  %118 = sext i32 %104 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !5
  %121 = sub nsw i32 %120, %3
  %122 = tail call i32 @llvm.smax.i32(i32 %112, i32 %117)
  %123 = tail call i32 @llvm.smax.i32(i32 %122, i32 %121)
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 %123, i32 addrspace(1)* %124, align 4, !tbaa !5
  br label %125

125:                                              ; preds = %100, %98
  %126 = icmp ugt i32 %8, 4
  br i1 %126, label %152, label %127

127:                                              ; preds = %125
  %128 = sub nuw nsw i32 4, %8
  %129 = mul nsw i32 %128, %2
  %130 = add i32 %18, %129
  %131 = sub nsw i32 %130, %2
  %132 = add nsw i32 %131, -1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !5
  %136 = sext i32 %130 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !5
  %139 = add nsw i32 %138, %135
  %140 = add nsw i32 %130, -1
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !5
  %144 = sub nsw i32 %143, %3
  %145 = sext i32 %131 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !5
  %148 = sub nsw i32 %147, %3
  %149 = tail call i32 @llvm.smax.i32(i32 %139, i32 %144)
  %150 = tail call i32 @llvm.smax.i32(i32 %149, i32 %148)
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  store i32 %150, i32 addrspace(1)* %151, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %127, %125
  %153 = icmp ugt i32 %8, 5
  br i1 %153, label %179, label %154

154:                                              ; preds = %152
  %155 = sub nuw nsw i32 5, %8
  %156 = mul nsw i32 %155, %2
  %157 = add i32 %18, %156
  %158 = sub nsw i32 %157, %2
  %159 = add nsw i32 %158, -1
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !5
  %163 = sext i32 %157 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !5
  %166 = add nsw i32 %165, %162
  %167 = add nsw i32 %157, -1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %168
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !5
  %171 = sub nsw i32 %170, %3
  %172 = sext i32 %158 to i64
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %172
  %174 = load i32, i32 addrspace(1)* %173, align 4, !tbaa !5
  %175 = sub nsw i32 %174, %3
  %176 = tail call i32 @llvm.smax.i32(i32 %166, i32 %171)
  %177 = tail call i32 @llvm.smax.i32(i32 %176, i32 %175)
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %163
  store i32 %177, i32 addrspace(1)* %178, align 4, !tbaa !5
  br label %179

179:                                              ; preds = %154, %152
  %180 = icmp ugt i32 %8, 6
  br i1 %180, label %206, label %181

181:                                              ; preds = %179
  %182 = sub nuw nsw i32 6, %8
  %183 = mul nsw i32 %182, %2
  %184 = add i32 %18, %183
  %185 = sub nsw i32 %184, %2
  %186 = add nsw i32 %185, -1
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %187
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !5
  %190 = sext i32 %184 to i64
  %191 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %190
  %192 = load i32, i32 addrspace(1)* %191, align 4, !tbaa !5
  %193 = add nsw i32 %192, %189
  %194 = add nsw i32 %184, -1
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !5
  %198 = sub nsw i32 %197, %3
  %199 = sext i32 %185 to i64
  %200 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %199
  %201 = load i32, i32 addrspace(1)* %200, align 4, !tbaa !5
  %202 = sub nsw i32 %201, %3
  %203 = tail call i32 @llvm.smax.i32(i32 %193, i32 %198)
  %204 = tail call i32 @llvm.smax.i32(i32 %203, i32 %202)
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %190
  store i32 %204, i32 addrspace(1)* %205, align 4, !tbaa !5
  br label %206

206:                                              ; preds = %181, %179
  %207 = icmp ugt i32 %8, 7
  br i1 %207, label %233, label %208

208:                                              ; preds = %206
  %209 = sub nuw nsw i32 7, %8
  %210 = mul nsw i32 %209, %2
  %211 = add i32 %18, %210
  %212 = sub nsw i32 %211, %2
  %213 = add nsw i32 %212, -1
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !5
  %217 = sext i32 %211 to i64
  %218 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %217
  %219 = load i32, i32 addrspace(1)* %218, align 4, !tbaa !5
  %220 = add nsw i32 %219, %216
  %221 = add nsw i32 %211, -1
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %222
  %224 = load i32, i32 addrspace(1)* %223, align 4, !tbaa !5
  %225 = sub nsw i32 %224, %3
  %226 = sext i32 %212 to i64
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %226
  %228 = load i32, i32 addrspace(1)* %227, align 4, !tbaa !5
  %229 = sub nsw i32 %228, %3
  %230 = tail call i32 @llvm.smax.i32(i32 %220, i32 %225)
  %231 = tail call i32 @llvm.smax.i32(i32 %230, i32 %229)
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %217
  store i32 %231, i32 addrspace(1)* %232, align 4, !tbaa !5
  br label %233

233:                                              ; preds = %208, %206
  %234 = icmp ugt i32 %8, 8
  br i1 %234, label %260, label %235

235:                                              ; preds = %233
  %236 = sub nuw nsw i32 8, %8
  %237 = mul nsw i32 %236, %2
  %238 = add i32 %18, %237
  %239 = sub nsw i32 %238, %2
  %240 = add nsw i32 %239, -1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %241
  %243 = load i32, i32 addrspace(1)* %242, align 4, !tbaa !5
  %244 = sext i32 %238 to i64
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %244
  %246 = load i32, i32 addrspace(1)* %245, align 4, !tbaa !5
  %247 = add nsw i32 %246, %243
  %248 = add nsw i32 %238, -1
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %249
  %251 = load i32, i32 addrspace(1)* %250, align 4, !tbaa !5
  %252 = sub nsw i32 %251, %3
  %253 = sext i32 %239 to i64
  %254 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %253
  %255 = load i32, i32 addrspace(1)* %254, align 4, !tbaa !5
  %256 = sub nsw i32 %255, %3
  %257 = tail call i32 @llvm.smax.i32(i32 %247, i32 %252)
  %258 = tail call i32 @llvm.smax.i32(i32 %257, i32 %256)
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %244
  store i32 %258, i32 addrspace(1)* %259, align 4, !tbaa !5
  br label %260

260:                                              ; preds = %235, %233
  %261 = icmp ugt i32 %8, 9
  br i1 %261, label %287, label %262

262:                                              ; preds = %260
  %263 = sub nuw nsw i32 9, %8
  %264 = mul nsw i32 %263, %2
  %265 = add i32 %18, %264
  %266 = sub nsw i32 %265, %2
  %267 = add nsw i32 %266, -1
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %268
  %270 = load i32, i32 addrspace(1)* %269, align 4, !tbaa !5
  %271 = sext i32 %265 to i64
  %272 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %271
  %273 = load i32, i32 addrspace(1)* %272, align 4, !tbaa !5
  %274 = add nsw i32 %273, %270
  %275 = add nsw i32 %265, -1
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %276
  %278 = load i32, i32 addrspace(1)* %277, align 4, !tbaa !5
  %279 = sub nsw i32 %278, %3
  %280 = sext i32 %266 to i64
  %281 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %280
  %282 = load i32, i32 addrspace(1)* %281, align 4, !tbaa !5
  %283 = sub nsw i32 %282, %3
  %284 = tail call i32 @llvm.smax.i32(i32 %274, i32 %279)
  %285 = tail call i32 @llvm.smax.i32(i32 %284, i32 %283)
  %286 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %271
  store i32 %285, i32 addrspace(1)* %286, align 4, !tbaa !5
  br label %287

287:                                              ; preds = %262, %260
  %288 = icmp ugt i32 %8, 10
  br i1 %288, label %314, label %289

289:                                              ; preds = %287
  %290 = sub nuw nsw i32 10, %8
  %291 = mul nsw i32 %290, %2
  %292 = add i32 %18, %291
  %293 = sub nsw i32 %292, %2
  %294 = add nsw i32 %293, -1
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %295
  %297 = load i32, i32 addrspace(1)* %296, align 4, !tbaa !5
  %298 = sext i32 %292 to i64
  %299 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %298
  %300 = load i32, i32 addrspace(1)* %299, align 4, !tbaa !5
  %301 = add nsw i32 %300, %297
  %302 = add nsw i32 %292, -1
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %303
  %305 = load i32, i32 addrspace(1)* %304, align 4, !tbaa !5
  %306 = sub nsw i32 %305, %3
  %307 = sext i32 %293 to i64
  %308 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %307
  %309 = load i32, i32 addrspace(1)* %308, align 4, !tbaa !5
  %310 = sub nsw i32 %309, %3
  %311 = tail call i32 @llvm.smax.i32(i32 %301, i32 %306)
  %312 = tail call i32 @llvm.smax.i32(i32 %311, i32 %310)
  %313 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %298
  store i32 %312, i32 addrspace(1)* %313, align 4, !tbaa !5
  br label %314

314:                                              ; preds = %289, %287
  %315 = icmp ugt i32 %8, 11
  br i1 %315, label %341, label %316

316:                                              ; preds = %314
  %317 = sub nuw nsw i32 11, %8
  %318 = mul nsw i32 %317, %2
  %319 = add i32 %18, %318
  %320 = sub nsw i32 %319, %2
  %321 = add nsw i32 %320, -1
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %322
  %324 = load i32, i32 addrspace(1)* %323, align 4, !tbaa !5
  %325 = sext i32 %319 to i64
  %326 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %325
  %327 = load i32, i32 addrspace(1)* %326, align 4, !tbaa !5
  %328 = add nsw i32 %327, %324
  %329 = add nsw i32 %319, -1
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %330
  %332 = load i32, i32 addrspace(1)* %331, align 4, !tbaa !5
  %333 = sub nsw i32 %332, %3
  %334 = sext i32 %320 to i64
  %335 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %334
  %336 = load i32, i32 addrspace(1)* %335, align 4, !tbaa !5
  %337 = sub nsw i32 %336, %3
  %338 = tail call i32 @llvm.smax.i32(i32 %328, i32 %333)
  %339 = tail call i32 @llvm.smax.i32(i32 %338, i32 %337)
  %340 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %325
  store i32 %339, i32 addrspace(1)* %340, align 4, !tbaa !5
  br label %341

341:                                              ; preds = %316, %314
  %342 = icmp ugt i32 %8, 12
  br i1 %342, label %368, label %343

343:                                              ; preds = %341
  %344 = sub nuw nsw i32 12, %8
  %345 = mul nsw i32 %344, %2
  %346 = add i32 %18, %345
  %347 = sub nsw i32 %346, %2
  %348 = add nsw i32 %347, -1
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %349
  %351 = load i32, i32 addrspace(1)* %350, align 4, !tbaa !5
  %352 = sext i32 %346 to i64
  %353 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %352
  %354 = load i32, i32 addrspace(1)* %353, align 4, !tbaa !5
  %355 = add nsw i32 %354, %351
  %356 = add nsw i32 %346, -1
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %357
  %359 = load i32, i32 addrspace(1)* %358, align 4, !tbaa !5
  %360 = sub nsw i32 %359, %3
  %361 = sext i32 %347 to i64
  %362 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %361
  %363 = load i32, i32 addrspace(1)* %362, align 4, !tbaa !5
  %364 = sub nsw i32 %363, %3
  %365 = tail call i32 @llvm.smax.i32(i32 %355, i32 %360)
  %366 = tail call i32 @llvm.smax.i32(i32 %365, i32 %364)
  %367 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %352
  store i32 %366, i32 addrspace(1)* %367, align 4, !tbaa !5
  br label %368

368:                                              ; preds = %343, %341
  %369 = icmp ugt i32 %8, 13
  br i1 %369, label %395, label %370

370:                                              ; preds = %368
  %371 = sub nuw nsw i32 13, %8
  %372 = mul nsw i32 %371, %2
  %373 = add i32 %18, %372
  %374 = sub nsw i32 %373, %2
  %375 = add nsw i32 %374, -1
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %376
  %378 = load i32, i32 addrspace(1)* %377, align 4, !tbaa !5
  %379 = sext i32 %373 to i64
  %380 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %379
  %381 = load i32, i32 addrspace(1)* %380, align 4, !tbaa !5
  %382 = add nsw i32 %381, %378
  %383 = add nsw i32 %373, -1
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %384
  %386 = load i32, i32 addrspace(1)* %385, align 4, !tbaa !5
  %387 = sub nsw i32 %386, %3
  %388 = sext i32 %374 to i64
  %389 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %388
  %390 = load i32, i32 addrspace(1)* %389, align 4, !tbaa !5
  %391 = sub nsw i32 %390, %3
  %392 = tail call i32 @llvm.smax.i32(i32 %382, i32 %387)
  %393 = tail call i32 @llvm.smax.i32(i32 %392, i32 %391)
  %394 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %379
  store i32 %393, i32 addrspace(1)* %394, align 4, !tbaa !5
  br label %395

395:                                              ; preds = %370, %368
  %396 = icmp ugt i32 %8, 14
  br i1 %396, label %422, label %397

397:                                              ; preds = %395
  %398 = sub nuw nsw i32 14, %8
  %399 = mul nsw i32 %398, %2
  %400 = add i32 %18, %399
  %401 = sub nsw i32 %400, %2
  %402 = add nsw i32 %401, -1
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %403
  %405 = load i32, i32 addrspace(1)* %404, align 4, !tbaa !5
  %406 = sext i32 %400 to i64
  %407 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %406
  %408 = load i32, i32 addrspace(1)* %407, align 4, !tbaa !5
  %409 = add nsw i32 %408, %405
  %410 = add nsw i32 %400, -1
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %411
  %413 = load i32, i32 addrspace(1)* %412, align 4, !tbaa !5
  %414 = sub nsw i32 %413, %3
  %415 = sext i32 %401 to i64
  %416 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %415
  %417 = load i32, i32 addrspace(1)* %416, align 4, !tbaa !5
  %418 = sub nsw i32 %417, %3
  %419 = tail call i32 @llvm.smax.i32(i32 %409, i32 %414)
  %420 = tail call i32 @llvm.smax.i32(i32 %419, i32 %418)
  %421 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %406
  store i32 %420, i32 addrspace(1)* %421, align 4, !tbaa !5
  br label %422

422:                                              ; preds = %397, %395
  %423 = icmp ugt i32 %8, 15
  %424 = sub nsw i32 15, %8
  %425 = mul nsw i32 %424, %2
  br i1 %423, label %449, label %426

426:                                              ; preds = %422
  %427 = add i32 %18, %425
  %428 = sub nsw i32 %427, %2
  %429 = add nsw i32 %428, -1
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %430
  %432 = load i32, i32 addrspace(1)* %431, align 4, !tbaa !5
  %433 = sext i32 %427 to i64
  %434 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %433
  %435 = load i32, i32 addrspace(1)* %434, align 4, !tbaa !5
  %436 = add nsw i32 %435, %432
  %437 = add nsw i32 %427, -1
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %438
  %440 = load i32, i32 addrspace(1)* %439, align 4, !tbaa !5
  %441 = sub nsw i32 %440, %3
  %442 = sext i32 %428 to i64
  %443 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %442
  %444 = load i32, i32 addrspace(1)* %443, align 4, !tbaa !5
  %445 = sub nsw i32 %444, %3
  %446 = tail call i32 @llvm.smax.i32(i32 %436, i32 %441)
  %447 = tail call i32 @llvm.smax.i32(i32 %446, i32 %445)
  %448 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %433
  store i32 %447, i32 addrspace(1)* %448, align 4, !tbaa !5
  br label %449

449:                                              ; preds = %422, %426
  %450 = add nuw nsw i32 %8, 15
  %451 = add i32 %450, %425
  %452 = add i32 %451, %17
  br i1 %396, label %476, label %453

453:                                              ; preds = %449
  %454 = add i32 %452, -14
  %455 = sub nsw i32 %454, %2
  %456 = add nsw i32 %455, -1
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %457
  %459 = load i32, i32 addrspace(1)* %458, align 4, !tbaa !5
  %460 = sext i32 %454 to i64
  %461 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %460
  %462 = load i32, i32 addrspace(1)* %461, align 4, !tbaa !5
  %463 = add nsw i32 %462, %459
  %464 = add i32 %452, -15
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %465
  %467 = load i32, i32 addrspace(1)* %466, align 4, !tbaa !5
  %468 = sub nsw i32 %467, %3
  %469 = sext i32 %455 to i64
  %470 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %469
  %471 = load i32, i32 addrspace(1)* %470, align 4, !tbaa !5
  %472 = sub nsw i32 %471, %3
  %473 = tail call i32 @llvm.smax.i32(i32 %463, i32 %468)
  %474 = tail call i32 @llvm.smax.i32(i32 %473, i32 %472)
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %460
  store i32 %474, i32 addrspace(1)* %475, align 4, !tbaa !5
  br label %476

476:                                              ; preds = %449, %453
  br i1 %369, label %500, label %477

477:                                              ; preds = %476
  %478 = add i32 %452, -13
  %479 = sub nsw i32 %478, %2
  %480 = add nsw i32 %479, -1
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %481
  %483 = load i32, i32 addrspace(1)* %482, align 4, !tbaa !5
  %484 = sext i32 %478 to i64
  %485 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %484
  %486 = load i32, i32 addrspace(1)* %485, align 4, !tbaa !5
  %487 = add nsw i32 %486, %483
  %488 = add i32 %452, -14
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %489
  %491 = load i32, i32 addrspace(1)* %490, align 4, !tbaa !5
  %492 = sub nsw i32 %491, %3
  %493 = sext i32 %479 to i64
  %494 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %493
  %495 = load i32, i32 addrspace(1)* %494, align 4, !tbaa !5
  %496 = sub nsw i32 %495, %3
  %497 = tail call i32 @llvm.smax.i32(i32 %487, i32 %492)
  %498 = tail call i32 @llvm.smax.i32(i32 %497, i32 %496)
  %499 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %484
  store i32 %498, i32 addrspace(1)* %499, align 4, !tbaa !5
  br label %500

500:                                              ; preds = %477, %476
  br i1 %342, label %524, label %501

501:                                              ; preds = %500
  %502 = add i32 %452, -12
  %503 = sub nsw i32 %502, %2
  %504 = add nsw i32 %503, -1
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %505
  %507 = load i32, i32 addrspace(1)* %506, align 4, !tbaa !5
  %508 = sext i32 %502 to i64
  %509 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %508
  %510 = load i32, i32 addrspace(1)* %509, align 4, !tbaa !5
  %511 = add nsw i32 %510, %507
  %512 = add i32 %452, -13
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %513
  %515 = load i32, i32 addrspace(1)* %514, align 4, !tbaa !5
  %516 = sub nsw i32 %515, %3
  %517 = sext i32 %503 to i64
  %518 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %517
  %519 = load i32, i32 addrspace(1)* %518, align 4, !tbaa !5
  %520 = sub nsw i32 %519, %3
  %521 = tail call i32 @llvm.smax.i32(i32 %511, i32 %516)
  %522 = tail call i32 @llvm.smax.i32(i32 %521, i32 %520)
  %523 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %508
  store i32 %522, i32 addrspace(1)* %523, align 4, !tbaa !5
  br label %524

524:                                              ; preds = %501, %500
  br i1 %315, label %548, label %525

525:                                              ; preds = %524
  %526 = add i32 %452, -11
  %527 = sub nsw i32 %526, %2
  %528 = add nsw i32 %527, -1
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %529
  %531 = load i32, i32 addrspace(1)* %530, align 4, !tbaa !5
  %532 = sext i32 %526 to i64
  %533 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %532
  %534 = load i32, i32 addrspace(1)* %533, align 4, !tbaa !5
  %535 = add nsw i32 %534, %531
  %536 = add i32 %452, -12
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %537
  %539 = load i32, i32 addrspace(1)* %538, align 4, !tbaa !5
  %540 = sub nsw i32 %539, %3
  %541 = sext i32 %527 to i64
  %542 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %541
  %543 = load i32, i32 addrspace(1)* %542, align 4, !tbaa !5
  %544 = sub nsw i32 %543, %3
  %545 = tail call i32 @llvm.smax.i32(i32 %535, i32 %540)
  %546 = tail call i32 @llvm.smax.i32(i32 %545, i32 %544)
  %547 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %532
  store i32 %546, i32 addrspace(1)* %547, align 4, !tbaa !5
  br label %548

548:                                              ; preds = %525, %524
  br i1 %288, label %572, label %549

549:                                              ; preds = %548
  %550 = add i32 %452, -10
  %551 = sub nsw i32 %550, %2
  %552 = add nsw i32 %551, -1
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %553
  %555 = load i32, i32 addrspace(1)* %554, align 4, !tbaa !5
  %556 = sext i32 %550 to i64
  %557 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %556
  %558 = load i32, i32 addrspace(1)* %557, align 4, !tbaa !5
  %559 = add nsw i32 %558, %555
  %560 = add i32 %452, -11
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %561
  %563 = load i32, i32 addrspace(1)* %562, align 4, !tbaa !5
  %564 = sub nsw i32 %563, %3
  %565 = sext i32 %551 to i64
  %566 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %565
  %567 = load i32, i32 addrspace(1)* %566, align 4, !tbaa !5
  %568 = sub nsw i32 %567, %3
  %569 = tail call i32 @llvm.smax.i32(i32 %559, i32 %564)
  %570 = tail call i32 @llvm.smax.i32(i32 %569, i32 %568)
  %571 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %556
  store i32 %570, i32 addrspace(1)* %571, align 4, !tbaa !5
  br label %572

572:                                              ; preds = %549, %548
  br i1 %261, label %596, label %573

573:                                              ; preds = %572
  %574 = add i32 %452, -9
  %575 = sub nsw i32 %574, %2
  %576 = add nsw i32 %575, -1
  %577 = sext i32 %576 to i64
  %578 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %577
  %579 = load i32, i32 addrspace(1)* %578, align 4, !tbaa !5
  %580 = sext i32 %574 to i64
  %581 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %580
  %582 = load i32, i32 addrspace(1)* %581, align 4, !tbaa !5
  %583 = add nsw i32 %582, %579
  %584 = add i32 %452, -10
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %585
  %587 = load i32, i32 addrspace(1)* %586, align 4, !tbaa !5
  %588 = sub nsw i32 %587, %3
  %589 = sext i32 %575 to i64
  %590 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %589
  %591 = load i32, i32 addrspace(1)* %590, align 4, !tbaa !5
  %592 = sub nsw i32 %591, %3
  %593 = tail call i32 @llvm.smax.i32(i32 %583, i32 %588)
  %594 = tail call i32 @llvm.smax.i32(i32 %593, i32 %592)
  %595 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %580
  store i32 %594, i32 addrspace(1)* %595, align 4, !tbaa !5
  br label %596

596:                                              ; preds = %573, %572
  br i1 %234, label %620, label %597

597:                                              ; preds = %596
  %598 = add i32 %452, -8
  %599 = sub nsw i32 %598, %2
  %600 = add nsw i32 %599, -1
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %601
  %603 = load i32, i32 addrspace(1)* %602, align 4, !tbaa !5
  %604 = sext i32 %598 to i64
  %605 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %604
  %606 = load i32, i32 addrspace(1)* %605, align 4, !tbaa !5
  %607 = add nsw i32 %606, %603
  %608 = add i32 %452, -9
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %609
  %611 = load i32, i32 addrspace(1)* %610, align 4, !tbaa !5
  %612 = sub nsw i32 %611, %3
  %613 = sext i32 %599 to i64
  %614 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %613
  %615 = load i32, i32 addrspace(1)* %614, align 4, !tbaa !5
  %616 = sub nsw i32 %615, %3
  %617 = tail call i32 @llvm.smax.i32(i32 %607, i32 %612)
  %618 = tail call i32 @llvm.smax.i32(i32 %617, i32 %616)
  %619 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %604
  store i32 %618, i32 addrspace(1)* %619, align 4, !tbaa !5
  br label %620

620:                                              ; preds = %597, %596
  br i1 %207, label %644, label %621

621:                                              ; preds = %620
  %622 = add i32 %452, -7
  %623 = sub nsw i32 %622, %2
  %624 = add nsw i32 %623, -1
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %625
  %627 = load i32, i32 addrspace(1)* %626, align 4, !tbaa !5
  %628 = sext i32 %622 to i64
  %629 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %628
  %630 = load i32, i32 addrspace(1)* %629, align 4, !tbaa !5
  %631 = add nsw i32 %630, %627
  %632 = add i32 %452, -8
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %633
  %635 = load i32, i32 addrspace(1)* %634, align 4, !tbaa !5
  %636 = sub nsw i32 %635, %3
  %637 = sext i32 %623 to i64
  %638 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %637
  %639 = load i32, i32 addrspace(1)* %638, align 4, !tbaa !5
  %640 = sub nsw i32 %639, %3
  %641 = tail call i32 @llvm.smax.i32(i32 %631, i32 %636)
  %642 = tail call i32 @llvm.smax.i32(i32 %641, i32 %640)
  %643 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %628
  store i32 %642, i32 addrspace(1)* %643, align 4, !tbaa !5
  br label %644

644:                                              ; preds = %621, %620
  br i1 %180, label %668, label %645

645:                                              ; preds = %644
  %646 = add i32 %452, -6
  %647 = sub nsw i32 %646, %2
  %648 = add nsw i32 %647, -1
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %649
  %651 = load i32, i32 addrspace(1)* %650, align 4, !tbaa !5
  %652 = sext i32 %646 to i64
  %653 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %652
  %654 = load i32, i32 addrspace(1)* %653, align 4, !tbaa !5
  %655 = add nsw i32 %654, %651
  %656 = add i32 %452, -7
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %657
  %659 = load i32, i32 addrspace(1)* %658, align 4, !tbaa !5
  %660 = sub nsw i32 %659, %3
  %661 = sext i32 %647 to i64
  %662 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %661
  %663 = load i32, i32 addrspace(1)* %662, align 4, !tbaa !5
  %664 = sub nsw i32 %663, %3
  %665 = tail call i32 @llvm.smax.i32(i32 %655, i32 %660)
  %666 = tail call i32 @llvm.smax.i32(i32 %665, i32 %664)
  %667 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %652
  store i32 %666, i32 addrspace(1)* %667, align 4, !tbaa !5
  br label %668

668:                                              ; preds = %645, %644
  br i1 %153, label %692, label %669

669:                                              ; preds = %668
  %670 = add i32 %452, -5
  %671 = sub nsw i32 %670, %2
  %672 = add nsw i32 %671, -1
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %673
  %675 = load i32, i32 addrspace(1)* %674, align 4, !tbaa !5
  %676 = sext i32 %670 to i64
  %677 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %676
  %678 = load i32, i32 addrspace(1)* %677, align 4, !tbaa !5
  %679 = add nsw i32 %678, %675
  %680 = add i32 %452, -6
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %681
  %683 = load i32, i32 addrspace(1)* %682, align 4, !tbaa !5
  %684 = sub nsw i32 %683, %3
  %685 = sext i32 %671 to i64
  %686 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %685
  %687 = load i32, i32 addrspace(1)* %686, align 4, !tbaa !5
  %688 = sub nsw i32 %687, %3
  %689 = tail call i32 @llvm.smax.i32(i32 %679, i32 %684)
  %690 = tail call i32 @llvm.smax.i32(i32 %689, i32 %688)
  %691 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %676
  store i32 %690, i32 addrspace(1)* %691, align 4, !tbaa !5
  br label %692

692:                                              ; preds = %669, %668
  br i1 %126, label %716, label %693

693:                                              ; preds = %692
  %694 = add i32 %452, -4
  %695 = sub nsw i32 %694, %2
  %696 = add nsw i32 %695, -1
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %697
  %699 = load i32, i32 addrspace(1)* %698, align 4, !tbaa !5
  %700 = sext i32 %694 to i64
  %701 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %700
  %702 = load i32, i32 addrspace(1)* %701, align 4, !tbaa !5
  %703 = add nsw i32 %702, %699
  %704 = add i32 %452, -5
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %705
  %707 = load i32, i32 addrspace(1)* %706, align 4, !tbaa !5
  %708 = sub nsw i32 %707, %3
  %709 = sext i32 %695 to i64
  %710 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %709
  %711 = load i32, i32 addrspace(1)* %710, align 4, !tbaa !5
  %712 = sub nsw i32 %711, %3
  %713 = tail call i32 @llvm.smax.i32(i32 %703, i32 %708)
  %714 = tail call i32 @llvm.smax.i32(i32 %713, i32 %712)
  %715 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %700
  store i32 %714, i32 addrspace(1)* %715, align 4, !tbaa !5
  br label %716

716:                                              ; preds = %693, %692
  br i1 %99, label %740, label %717

717:                                              ; preds = %716
  %718 = add i32 %452, -3
  %719 = sub nsw i32 %718, %2
  %720 = add nsw i32 %719, -1
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %721
  %723 = load i32, i32 addrspace(1)* %722, align 4, !tbaa !5
  %724 = sext i32 %718 to i64
  %725 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %724
  %726 = load i32, i32 addrspace(1)* %725, align 4, !tbaa !5
  %727 = add nsw i32 %726, %723
  %728 = add i32 %452, -4
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %729
  %731 = load i32, i32 addrspace(1)* %730, align 4, !tbaa !5
  %732 = sub nsw i32 %731, %3
  %733 = sext i32 %719 to i64
  %734 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %733
  %735 = load i32, i32 addrspace(1)* %734, align 4, !tbaa !5
  %736 = sub nsw i32 %735, %3
  %737 = tail call i32 @llvm.smax.i32(i32 %727, i32 %732)
  %738 = tail call i32 @llvm.smax.i32(i32 %737, i32 %736)
  %739 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %724
  store i32 %738, i32 addrspace(1)* %739, align 4, !tbaa !5
  br label %740

740:                                              ; preds = %717, %716
  br i1 %72, label %764, label %741

741:                                              ; preds = %740
  %742 = add i32 %452, -2
  %743 = sub nsw i32 %742, %2
  %744 = add nsw i32 %743, -1
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %745
  %747 = load i32, i32 addrspace(1)* %746, align 4, !tbaa !5
  %748 = sext i32 %742 to i64
  %749 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %748
  %750 = load i32, i32 addrspace(1)* %749, align 4, !tbaa !5
  %751 = add nsw i32 %750, %747
  %752 = add i32 %452, -3
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %753
  %755 = load i32, i32 addrspace(1)* %754, align 4, !tbaa !5
  %756 = sub nsw i32 %755, %3
  %757 = sext i32 %743 to i64
  %758 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %757
  %759 = load i32, i32 addrspace(1)* %758, align 4, !tbaa !5
  %760 = sub nsw i32 %759, %3
  %761 = tail call i32 @llvm.smax.i32(i32 %751, i32 %756)
  %762 = tail call i32 @llvm.smax.i32(i32 %761, i32 %760)
  %763 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %748
  store i32 %762, i32 addrspace(1)* %763, align 4, !tbaa !5
  br label %764

764:                                              ; preds = %741, %740
  br i1 %45, label %788, label %765

765:                                              ; preds = %764
  %766 = add i32 %452, -1
  %767 = sub nsw i32 %766, %2
  %768 = add nsw i32 %767, -1
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %769
  %771 = load i32, i32 addrspace(1)* %770, align 4, !tbaa !5
  %772 = sext i32 %766 to i64
  %773 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %772
  %774 = load i32, i32 addrspace(1)* %773, align 4, !tbaa !5
  %775 = add nsw i32 %774, %771
  %776 = add i32 %452, -2
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %777
  %779 = load i32, i32 addrspace(1)* %778, align 4, !tbaa !5
  %780 = sub nsw i32 %779, %3
  %781 = sext i32 %767 to i64
  %782 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %781
  %783 = load i32, i32 addrspace(1)* %782, align 4, !tbaa !5
  %784 = sub nsw i32 %783, %3
  %785 = tail call i32 @llvm.smax.i32(i32 %775, i32 %780)
  %786 = tail call i32 @llvm.smax.i32(i32 %785, i32 %784)
  %787 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %772
  store i32 %786, i32 addrspace(1)* %787, align 4, !tbaa !5
  br label %788

788:                                              ; preds = %765, %764
  br i1 %19, label %789, label %811

789:                                              ; preds = %788
  %790 = sub nsw i32 %452, %2
  %791 = add nsw i32 %790, -1
  %792 = sext i32 %791 to i64
  %793 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %792
  %794 = load i32, i32 addrspace(1)* %793, align 4, !tbaa !5
  %795 = sext i32 %452 to i64
  %796 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %795
  %797 = load i32, i32 addrspace(1)* %796, align 4, !tbaa !5
  %798 = add nsw i32 %797, %794
  %799 = add nsw i32 %452, -1
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %800
  %802 = load i32, i32 addrspace(1)* %801, align 4, !tbaa !5
  %803 = sub nsw i32 %802, %3
  %804 = sext i32 %790 to i64
  %805 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %804
  %806 = load i32, i32 addrspace(1)* %805, align 4, !tbaa !5
  %807 = sub nsw i32 %806, %3
  %808 = tail call i32 @llvm.smax.i32(i32 %798, i32 %803)
  %809 = tail call i32 @llvm.smax.i32(i32 %808, i32 %807)
  %810 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %795
  store i32 %809, i32 addrspace(1)* %810, align 4, !tbaa !5
  br label %811

811:                                              ; preds = %789, %788
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
