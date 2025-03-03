; ModuleID = '../data/hip_kernels/7525/2/main.cu'
source_filename = "../data/hip_kernels/7525/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL13averageKernelPhS_ii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL13averageKernelPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 comdat {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %3, %2
  %23 = add nsw i32 %21, -8
  %24 = icmp slt i32 %21, 8
  %25 = icmp sgt i32 %23, %2
  %26 = select i1 %24, i1 true, i1 %25
  %27 = add nsw i32 %21, -7
  %28 = icmp slt i32 %21, 7
  %29 = icmp sgt i32 %27, %2
  %30 = select i1 %28, i1 true, i1 %29
  %31 = add nsw i32 %21, -6
  %32 = icmp slt i32 %21, 6
  %33 = icmp sgt i32 %31, %2
  %34 = select i1 %32, i1 true, i1 %33
  %35 = add nsw i32 %21, -5
  %36 = icmp slt i32 %21, 5
  %37 = icmp sgt i32 %35, %2
  %38 = select i1 %36, i1 true, i1 %37
  %39 = add nsw i32 %21, -4
  %40 = icmp slt i32 %21, 4
  %41 = icmp sgt i32 %39, %2
  %42 = select i1 %40, i1 true, i1 %41
  %43 = add nsw i32 %21, -3
  %44 = icmp slt i32 %21, 3
  %45 = icmp sgt i32 %43, %2
  %46 = select i1 %44, i1 true, i1 %45
  %47 = add nsw i32 %21, -2
  %48 = icmp slt i32 %21, 2
  %49 = icmp sgt i32 %47, %2
  %50 = select i1 %48, i1 true, i1 %49
  %51 = add nsw i32 %21, -1
  %52 = icmp slt i32 %21, 1
  %53 = icmp sgt i32 %51, %2
  %54 = select i1 %52, i1 true, i1 %53
  %55 = icmp slt i32 %21, 0
  %56 = icmp sgt i32 %21, %2
  %57 = select i1 %55, i1 true, i1 %56
  %58 = icmp slt i32 %21, -1
  %59 = icmp sge i32 %21, %2
  %60 = select i1 %58, i1 true, i1 %59
  %61 = add nsw i32 %21, 1
  %62 = add nsw i32 %21, 2
  %63 = icmp slt i32 %21, -2
  %64 = icmp sgt i32 %62, %2
  %65 = select i1 %63, i1 true, i1 %64
  %66 = add nsw i32 %21, 3
  %67 = icmp slt i32 %21, -3
  %68 = icmp sgt i32 %66, %2
  %69 = select i1 %67, i1 true, i1 %68
  %70 = add nsw i32 %21, 4
  %71 = icmp slt i32 %21, -4
  %72 = icmp sgt i32 %70, %2
  %73 = select i1 %71, i1 true, i1 %72
  %74 = add nsw i32 %21, 5
  %75 = icmp slt i32 %21, -5
  %76 = icmp sgt i32 %74, %2
  %77 = select i1 %75, i1 true, i1 %76
  %78 = add nsw i32 %21, 6
  %79 = icmp slt i32 %21, -6
  %80 = icmp sgt i32 %78, %2
  %81 = select i1 %79, i1 true, i1 %80
  %82 = add nsw i32 %21, 7
  %83 = icmp slt i32 %21, -7
  %84 = icmp sgt i32 %82, %2
  %85 = select i1 %83, i1 true, i1 %84
  %86 = add nsw i32 %21, 8
  %87 = icmp slt i32 %21, -8
  %88 = icmp sgt i32 %86, %2
  %89 = select i1 %87, i1 true, i1 %88
  br label %97

90:                                               ; preds = %325
  %91 = udiv i32 %326, 289
  %92 = trunc i32 %91 to i8
  %93 = mul nsw i32 %13, %2
  %94 = add nsw i32 %93, %21
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %95
  store i8 %92, i8 addrspace(1)* %96, align 1, !tbaa !7
  ret void

97:                                               ; preds = %4, %325
  %98 = phi i32 [ 0, %4 ], [ %326, %325 ]
  %99 = phi i32 [ -8, %4 ], [ %327, %325 ]
  %100 = add nsw i32 %99, %13
  %101 = icmp slt i32 %100, 0
  %102 = icmp sgt i32 %100, %3
  %103 = select i1 %101, i1 true, i1 %102
  br i1 %103, label %325, label %104

104:                                              ; preds = %97
  %105 = mul nsw i32 %100, %2
  br i1 %26, label %117, label %106

106:                                              ; preds = %104
  %107 = add nsw i32 %23, %105
  %108 = icmp sgt i32 %107, -1
  %109 = icmp slt i32 %107, %22
  %110 = select i1 %108, i1 %109, i1 false
  br i1 %110, label %111, label %117

111:                                              ; preds = %106
  %112 = zext i32 %107 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %112
  %114 = load i8, i8 addrspace(1)* %113, align 1, !tbaa !7, !amdgpu.noclobber !5
  %115 = zext i8 %114 to i32
  %116 = add i32 %98, %115
  br label %117

117:                                              ; preds = %106, %111, %104
  %118 = phi i32 [ %98, %104 ], [ %116, %111 ], [ %98, %106 ]
  br i1 %30, label %130, label %119

119:                                              ; preds = %117
  %120 = add nsw i32 %27, %105
  %121 = icmp sgt i32 %120, -1
  %122 = icmp slt i32 %120, %22
  %123 = select i1 %121, i1 %122, i1 false
  br i1 %123, label %124, label %130

124:                                              ; preds = %119
  %125 = zext i32 %120 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !7, !amdgpu.noclobber !5
  %128 = zext i8 %127 to i32
  %129 = add i32 %118, %128
  br label %130

130:                                              ; preds = %124, %119, %117
  %131 = phi i32 [ %118, %117 ], [ %129, %124 ], [ %118, %119 ]
  br i1 %34, label %143, label %132

132:                                              ; preds = %130
  %133 = add nsw i32 %31, %105
  %134 = icmp sgt i32 %133, -1
  %135 = icmp slt i32 %133, %22
  %136 = select i1 %134, i1 %135, i1 false
  br i1 %136, label %137, label %143

137:                                              ; preds = %132
  %138 = zext i32 %133 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %138
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7, !amdgpu.noclobber !5
  %141 = zext i8 %140 to i32
  %142 = add i32 %131, %141
  br label %143

143:                                              ; preds = %137, %132, %130
  %144 = phi i32 [ %131, %130 ], [ %142, %137 ], [ %131, %132 ]
  br i1 %38, label %156, label %145

145:                                              ; preds = %143
  %146 = add nsw i32 %35, %105
  %147 = icmp sgt i32 %146, -1
  %148 = icmp slt i32 %146, %22
  %149 = select i1 %147, i1 %148, i1 false
  br i1 %149, label %150, label %156

150:                                              ; preds = %145
  %151 = zext i32 %146 to i64
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %151
  %153 = load i8, i8 addrspace(1)* %152, align 1, !tbaa !7, !amdgpu.noclobber !5
  %154 = zext i8 %153 to i32
  %155 = add i32 %144, %154
  br label %156

156:                                              ; preds = %150, %145, %143
  %157 = phi i32 [ %144, %143 ], [ %155, %150 ], [ %144, %145 ]
  br i1 %42, label %169, label %158

158:                                              ; preds = %156
  %159 = add nsw i32 %39, %105
  %160 = icmp sgt i32 %159, -1
  %161 = icmp slt i32 %159, %22
  %162 = select i1 %160, i1 %161, i1 false
  br i1 %162, label %163, label %169

163:                                              ; preds = %158
  %164 = zext i32 %159 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %164
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa !7, !amdgpu.noclobber !5
  %167 = zext i8 %166 to i32
  %168 = add i32 %157, %167
  br label %169

169:                                              ; preds = %163, %158, %156
  %170 = phi i32 [ %157, %156 ], [ %168, %163 ], [ %157, %158 ]
  br i1 %46, label %182, label %171

171:                                              ; preds = %169
  %172 = add nsw i32 %43, %105
  %173 = icmp sgt i32 %172, -1
  %174 = icmp slt i32 %172, %22
  %175 = select i1 %173, i1 %174, i1 false
  br i1 %175, label %176, label %182

176:                                              ; preds = %171
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %177
  %179 = load i8, i8 addrspace(1)* %178, align 1, !tbaa !7, !amdgpu.noclobber !5
  %180 = zext i8 %179 to i32
  %181 = add i32 %170, %180
  br label %182

182:                                              ; preds = %176, %171, %169
  %183 = phi i32 [ %170, %169 ], [ %181, %176 ], [ %170, %171 ]
  br i1 %50, label %195, label %184

184:                                              ; preds = %182
  %185 = add nsw i32 %47, %105
  %186 = icmp sgt i32 %185, -1
  %187 = icmp slt i32 %185, %22
  %188 = select i1 %186, i1 %187, i1 false
  br i1 %188, label %189, label %195

189:                                              ; preds = %184
  %190 = zext i32 %185 to i64
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %190
  %192 = load i8, i8 addrspace(1)* %191, align 1, !tbaa !7, !amdgpu.noclobber !5
  %193 = zext i8 %192 to i32
  %194 = add i32 %183, %193
  br label %195

195:                                              ; preds = %189, %184, %182
  %196 = phi i32 [ %183, %182 ], [ %194, %189 ], [ %183, %184 ]
  br i1 %54, label %208, label %197

197:                                              ; preds = %195
  %198 = add nsw i32 %51, %105
  %199 = icmp sgt i32 %198, -1
  %200 = icmp slt i32 %198, %22
  %201 = select i1 %199, i1 %200, i1 false
  br i1 %201, label %202, label %208

202:                                              ; preds = %197
  %203 = zext i32 %198 to i64
  %204 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %203
  %205 = load i8, i8 addrspace(1)* %204, align 1, !tbaa !7, !amdgpu.noclobber !5
  %206 = zext i8 %205 to i32
  %207 = add i32 %196, %206
  br label %208

208:                                              ; preds = %202, %197, %195
  %209 = phi i32 [ %196, %195 ], [ %207, %202 ], [ %196, %197 ]
  br i1 %57, label %221, label %210

210:                                              ; preds = %208
  %211 = add nsw i32 %21, %105
  %212 = icmp sgt i32 %211, -1
  %213 = icmp slt i32 %211, %22
  %214 = select i1 %212, i1 %213, i1 false
  br i1 %214, label %215, label %221

215:                                              ; preds = %210
  %216 = zext i32 %211 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %216
  %218 = load i8, i8 addrspace(1)* %217, align 1, !tbaa !7, !amdgpu.noclobber !5
  %219 = zext i8 %218 to i32
  %220 = add i32 %209, %219
  br label %221

221:                                              ; preds = %215, %210, %208
  %222 = phi i32 [ %209, %208 ], [ %220, %215 ], [ %209, %210 ]
  br i1 %60, label %234, label %223

223:                                              ; preds = %221
  %224 = add nsw i32 %61, %105
  %225 = icmp sgt i32 %224, -1
  %226 = icmp slt i32 %224, %22
  %227 = select i1 %225, i1 %226, i1 false
  br i1 %227, label %228, label %234

228:                                              ; preds = %223
  %229 = zext i32 %224 to i64
  %230 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %229
  %231 = load i8, i8 addrspace(1)* %230, align 1, !tbaa !7, !amdgpu.noclobber !5
  %232 = zext i8 %231 to i32
  %233 = add i32 %222, %232
  br label %234

234:                                              ; preds = %228, %223, %221
  %235 = phi i32 [ %222, %221 ], [ %233, %228 ], [ %222, %223 ]
  br i1 %65, label %247, label %236

236:                                              ; preds = %234
  %237 = add nsw i32 %62, %105
  %238 = icmp sgt i32 %237, -1
  %239 = icmp slt i32 %237, %22
  %240 = select i1 %238, i1 %239, i1 false
  br i1 %240, label %241, label %247

241:                                              ; preds = %236
  %242 = zext i32 %237 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %242
  %244 = load i8, i8 addrspace(1)* %243, align 1, !tbaa !7, !amdgpu.noclobber !5
  %245 = zext i8 %244 to i32
  %246 = add i32 %235, %245
  br label %247

247:                                              ; preds = %241, %236, %234
  %248 = phi i32 [ %235, %234 ], [ %246, %241 ], [ %235, %236 ]
  br i1 %69, label %260, label %249

249:                                              ; preds = %247
  %250 = add nsw i32 %66, %105
  %251 = icmp sgt i32 %250, -1
  %252 = icmp slt i32 %250, %22
  %253 = select i1 %251, i1 %252, i1 false
  br i1 %253, label %254, label %260

254:                                              ; preds = %249
  %255 = zext i32 %250 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %255
  %257 = load i8, i8 addrspace(1)* %256, align 1, !tbaa !7, !amdgpu.noclobber !5
  %258 = zext i8 %257 to i32
  %259 = add i32 %248, %258
  br label %260

260:                                              ; preds = %254, %249, %247
  %261 = phi i32 [ %248, %247 ], [ %259, %254 ], [ %248, %249 ]
  br i1 %73, label %273, label %262

262:                                              ; preds = %260
  %263 = add nsw i32 %70, %105
  %264 = icmp sgt i32 %263, -1
  %265 = icmp slt i32 %263, %22
  %266 = select i1 %264, i1 %265, i1 false
  br i1 %266, label %267, label %273

267:                                              ; preds = %262
  %268 = zext i32 %263 to i64
  %269 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %268
  %270 = load i8, i8 addrspace(1)* %269, align 1, !tbaa !7, !amdgpu.noclobber !5
  %271 = zext i8 %270 to i32
  %272 = add i32 %261, %271
  br label %273

273:                                              ; preds = %267, %262, %260
  %274 = phi i32 [ %261, %260 ], [ %272, %267 ], [ %261, %262 ]
  br i1 %77, label %286, label %275

275:                                              ; preds = %273
  %276 = add nsw i32 %74, %105
  %277 = icmp sgt i32 %276, -1
  %278 = icmp slt i32 %276, %22
  %279 = select i1 %277, i1 %278, i1 false
  br i1 %279, label %280, label %286

280:                                              ; preds = %275
  %281 = zext i32 %276 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %281
  %283 = load i8, i8 addrspace(1)* %282, align 1, !tbaa !7, !amdgpu.noclobber !5
  %284 = zext i8 %283 to i32
  %285 = add i32 %274, %284
  br label %286

286:                                              ; preds = %280, %275, %273
  %287 = phi i32 [ %274, %273 ], [ %285, %280 ], [ %274, %275 ]
  br i1 %81, label %299, label %288

288:                                              ; preds = %286
  %289 = add nsw i32 %78, %105
  %290 = icmp sgt i32 %289, -1
  %291 = icmp slt i32 %289, %22
  %292 = select i1 %290, i1 %291, i1 false
  br i1 %292, label %293, label %299

293:                                              ; preds = %288
  %294 = zext i32 %289 to i64
  %295 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %294
  %296 = load i8, i8 addrspace(1)* %295, align 1, !tbaa !7, !amdgpu.noclobber !5
  %297 = zext i8 %296 to i32
  %298 = add i32 %287, %297
  br label %299

299:                                              ; preds = %293, %288, %286
  %300 = phi i32 [ %287, %286 ], [ %298, %293 ], [ %287, %288 ]
  br i1 %85, label %312, label %301

301:                                              ; preds = %299
  %302 = add nsw i32 %82, %105
  %303 = icmp sgt i32 %302, -1
  %304 = icmp slt i32 %302, %22
  %305 = select i1 %303, i1 %304, i1 false
  br i1 %305, label %306, label %312

306:                                              ; preds = %301
  %307 = zext i32 %302 to i64
  %308 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %307
  %309 = load i8, i8 addrspace(1)* %308, align 1, !tbaa !7, !amdgpu.noclobber !5
  %310 = zext i8 %309 to i32
  %311 = add i32 %300, %310
  br label %312

312:                                              ; preds = %306, %301, %299
  %313 = phi i32 [ %300, %299 ], [ %311, %306 ], [ %300, %301 ]
  br i1 %89, label %325, label %314

314:                                              ; preds = %312
  %315 = add nsw i32 %86, %105
  %316 = icmp sgt i32 %315, -1
  %317 = icmp slt i32 %315, %22
  %318 = select i1 %316, i1 %317, i1 false
  br i1 %318, label %319, label %325

319:                                              ; preds = %314
  %320 = zext i32 %315 to i64
  %321 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %320
  %322 = load i8, i8 addrspace(1)* %321, align 1, !tbaa !7, !amdgpu.noclobber !5
  %323 = zext i8 %322 to i32
  %324 = add i32 %313, %323
  br label %325

325:                                              ; preds = %312, %314, %319, %97
  %326 = phi i32 [ %98, %97 ], [ %313, %312 ], [ %324, %319 ], [ %313, %314 ]
  %327 = add nsw i32 %99, 1
  %328 = icmp eq i32 %327, 9
  br i1 %328, label %90, label %97, !llvm.loop !10
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
