; ModuleID = '../data/hip_kernels/818/18/main.cu'
source_filename = "../data/hip_kernels/818/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8gpu_blurPhS_ii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %826

25:                                               ; preds = %4
  %26 = add nsw i32 %21, -3
  %27 = icmp sgt i32 %21, 2
  %28 = icmp slt i32 %26, %3
  %29 = mul nsw i32 %26, %2
  %30 = add nsw i32 %13, -3
  br i1 %27, label %31, label %42

31:                                               ; preds = %25
  %32 = icmp sgt i32 %13, 2
  %33 = select i1 %28, i1 %32, i1 false
  %34 = icmp slt i32 %30, %2
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %42

36:                                               ; preds = %31
  %37 = add nsw i32 %30, %29
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !6
  %41 = zext i8 %40 to i32
  br label %42

42:                                               ; preds = %36, %31, %25
  %43 = phi i32 [ 1, %36 ], [ 0, %31 ], [ 0, %25 ]
  %44 = phi i32 [ %41, %36 ], [ 0, %31 ], [ 0, %25 ]
  %45 = add nsw i32 %13, -2
  br i1 %27, label %46, label %59

46:                                               ; preds = %42
  %47 = icmp sgt i32 %13, 1
  %48 = select i1 %28, i1 %47, i1 false
  %49 = icmp slt i32 %45, %2
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %51, label %59

51:                                               ; preds = %46
  %52 = add nsw i32 %45, %29
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !6
  %56 = zext i8 %55 to i32
  %57 = add nuw nsw i32 %44, %56
  %58 = add nuw nsw i32 %43, 1
  br label %59

59:                                               ; preds = %51, %46, %42
  %60 = phi i32 [ %58, %51 ], [ %43, %46 ], [ %43, %42 ]
  %61 = phi i32 [ %57, %51 ], [ %44, %46 ], [ %44, %42 ]
  %62 = add nsw i32 %13, -1
  br i1 %27, label %63, label %76

63:                                               ; preds = %59
  %64 = icmp sgt i32 %13, 0
  %65 = select i1 %28, i1 %64, i1 false
  %66 = icmp sle i32 %13, %2
  %67 = select i1 %65, i1 %66, i1 false
  br i1 %67, label %68, label %76

68:                                               ; preds = %63
  %69 = add nsw i32 %62, %29
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !6
  %73 = zext i8 %72 to i32
  %74 = add nuw nsw i32 %61, %73
  %75 = add nuw nsw i32 %60, 1
  br label %76

76:                                               ; preds = %68, %63, %59
  %77 = phi i1 [ %28, %68 ], [ %28, %63 ], [ false, %59 ]
  %78 = phi i32 [ %75, %68 ], [ %60, %63 ], [ %60, %59 ]
  %79 = phi i32 [ %74, %68 ], [ %61, %63 ], [ %61, %59 ]
  %80 = icmp sgt i32 %13, -1
  %81 = select i1 %77, i1 %80, i1 false
  br i1 %81, label %82, label %90

82:                                               ; preds = %76
  %83 = add nsw i32 %13, %29
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !amdgpu.noclobber !6
  %87 = zext i8 %86 to i32
  %88 = add nuw nsw i32 %79, %87
  %89 = add nuw nsw i32 %78, 1
  br label %90

90:                                               ; preds = %82, %76
  %91 = phi i32 [ %89, %82 ], [ %78, %76 ]
  %92 = phi i32 [ %88, %82 ], [ %79, %76 ]
  %93 = add nsw i32 %13, 1
  br i1 %27, label %94, label %107

94:                                               ; preds = %90
  %95 = icmp sgt i32 %13, -2
  %96 = select i1 %28, i1 %95, i1 false
  %97 = icmp slt i32 %93, %2
  %98 = select i1 %96, i1 %97, i1 false
  br i1 %98, label %99, label %107

99:                                               ; preds = %94
  %100 = add nsw i32 %93, %29
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7, !amdgpu.noclobber !6
  %104 = zext i8 %103 to i32
  %105 = add nuw nsw i32 %92, %104
  %106 = add nuw nsw i32 %91, 1
  br label %107

107:                                              ; preds = %99, %94, %90
  %108 = phi i32 [ %106, %99 ], [ %91, %94 ], [ %91, %90 ]
  %109 = phi i32 [ %105, %99 ], [ %92, %94 ], [ %92, %90 ]
  %110 = add nsw i32 %13, 2
  br i1 %27, label %111, label %124

111:                                              ; preds = %107
  %112 = icmp sgt i32 %13, -3
  %113 = select i1 %28, i1 %112, i1 false
  %114 = icmp slt i32 %110, %2
  %115 = select i1 %113, i1 %114, i1 false
  br i1 %115, label %116, label %124

116:                                              ; preds = %111
  %117 = add nsw i32 %110, %29
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %118
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !7, !amdgpu.noclobber !6
  %121 = zext i8 %120 to i32
  %122 = add nuw nsw i32 %109, %121
  %123 = add nuw nsw i32 %108, 1
  br label %124

124:                                              ; preds = %116, %111, %107
  %125 = phi i32 [ %123, %116 ], [ %108, %111 ], [ %108, %107 ]
  %126 = phi i32 [ %122, %116 ], [ %109, %111 ], [ %109, %107 ]
  %127 = add nsw i32 %13, 3
  br i1 %27, label %128, label %141

128:                                              ; preds = %124
  %129 = icmp sgt i32 %13, -4
  %130 = select i1 %28, i1 %129, i1 false
  %131 = icmp slt i32 %127, %2
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %133, label %141

133:                                              ; preds = %128
  %134 = add nsw i32 %127, %29
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %135
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !7, !amdgpu.noclobber !6
  %138 = zext i8 %137 to i32
  %139 = add nuw nsw i32 %126, %138
  %140 = add nuw nsw i32 %125, 1
  br label %141

141:                                              ; preds = %133, %128, %124
  %142 = phi i32 [ %140, %133 ], [ %125, %128 ], [ %125, %124 ]
  %143 = phi i32 [ %139, %133 ], [ %126, %128 ], [ %126, %124 ]
  %144 = add nsw i32 %21, -2
  %145 = icmp sgt i32 %21, 1
  %146 = icmp slt i32 %144, %3
  %147 = mul nsw i32 %144, %2
  br i1 %145, label %148, label %161

148:                                              ; preds = %141
  %149 = icmp sgt i32 %13, 2
  %150 = select i1 %146, i1 %149, i1 false
  %151 = icmp slt i32 %30, %2
  %152 = select i1 %150, i1 %151, i1 false
  br i1 %152, label %153, label %161

153:                                              ; preds = %148
  %154 = add nsw i32 %30, %147
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !7, !amdgpu.noclobber !6
  %158 = zext i8 %157 to i32
  %159 = add nuw nsw i32 %143, %158
  %160 = add nuw nsw i32 %142, 1
  br label %161

161:                                              ; preds = %153, %148, %141
  %162 = phi i32 [ %160, %153 ], [ %142, %148 ], [ %142, %141 ]
  %163 = phi i32 [ %159, %153 ], [ %143, %148 ], [ %143, %141 ]
  br i1 %145, label %164, label %177

164:                                              ; preds = %161
  %165 = icmp sgt i32 %13, 1
  %166 = select i1 %146, i1 %165, i1 false
  %167 = icmp slt i32 %45, %2
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %177

169:                                              ; preds = %164
  %170 = add nsw i32 %45, %147
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %171
  %173 = load i8, i8 addrspace(1)* %172, align 1, !tbaa !7, !amdgpu.noclobber !6
  %174 = zext i8 %173 to i32
  %175 = add nuw nsw i32 %163, %174
  %176 = add nuw nsw i32 %162, 1
  br label %177

177:                                              ; preds = %169, %164, %161
  %178 = phi i32 [ %176, %169 ], [ %162, %164 ], [ %162, %161 ]
  %179 = phi i32 [ %175, %169 ], [ %163, %164 ], [ %163, %161 ]
  br i1 %145, label %180, label %193

180:                                              ; preds = %177
  %181 = icmp sgt i32 %13, 0
  %182 = select i1 %146, i1 %181, i1 false
  %183 = icmp sle i32 %13, %2
  %184 = select i1 %182, i1 %183, i1 false
  br i1 %184, label %185, label %193

185:                                              ; preds = %180
  %186 = add nsw i32 %62, %147
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %187
  %189 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !7, !amdgpu.noclobber !6
  %190 = zext i8 %189 to i32
  %191 = add nuw nsw i32 %179, %190
  %192 = add nuw nsw i32 %178, 1
  br label %193

193:                                              ; preds = %185, %180, %177
  %194 = phi i1 [ %146, %185 ], [ %146, %180 ], [ false, %177 ]
  %195 = phi i32 [ %192, %185 ], [ %178, %180 ], [ %178, %177 ]
  %196 = phi i32 [ %191, %185 ], [ %179, %180 ], [ %179, %177 ]
  %197 = icmp sgt i32 %13, -1
  %198 = select i1 %194, i1 %197, i1 false
  br i1 %198, label %199, label %207

199:                                              ; preds = %193
  %200 = add nsw i32 %13, %147
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %201
  %203 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !7, !amdgpu.noclobber !6
  %204 = zext i8 %203 to i32
  %205 = add nuw nsw i32 %196, %204
  %206 = add nuw nsw i32 %195, 1
  br label %207

207:                                              ; preds = %199, %193
  %208 = phi i32 [ %206, %199 ], [ %195, %193 ]
  %209 = phi i32 [ %205, %199 ], [ %196, %193 ]
  br i1 %145, label %210, label %223

210:                                              ; preds = %207
  %211 = icmp sgt i32 %13, -2
  %212 = select i1 %146, i1 %211, i1 false
  %213 = icmp slt i32 %93, %2
  %214 = select i1 %212, i1 %213, i1 false
  br i1 %214, label %215, label %223

215:                                              ; preds = %210
  %216 = add nsw i32 %93, %147
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %217
  %219 = load i8, i8 addrspace(1)* %218, align 1, !tbaa !7, !amdgpu.noclobber !6
  %220 = zext i8 %219 to i32
  %221 = add nuw nsw i32 %209, %220
  %222 = add nuw nsw i32 %208, 1
  br label %223

223:                                              ; preds = %215, %210, %207
  %224 = phi i32 [ %222, %215 ], [ %208, %210 ], [ %208, %207 ]
  %225 = phi i32 [ %221, %215 ], [ %209, %210 ], [ %209, %207 ]
  br i1 %145, label %226, label %239

226:                                              ; preds = %223
  %227 = icmp sgt i32 %13, -3
  %228 = select i1 %146, i1 %227, i1 false
  %229 = icmp slt i32 %110, %2
  %230 = select i1 %228, i1 %229, i1 false
  br i1 %230, label %231, label %239

231:                                              ; preds = %226
  %232 = add nsw i32 %110, %147
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %233
  %235 = load i8, i8 addrspace(1)* %234, align 1, !tbaa !7, !amdgpu.noclobber !6
  %236 = zext i8 %235 to i32
  %237 = add nuw nsw i32 %225, %236
  %238 = add nuw nsw i32 %224, 1
  br label %239

239:                                              ; preds = %231, %226, %223
  %240 = phi i32 [ %238, %231 ], [ %224, %226 ], [ %224, %223 ]
  %241 = phi i32 [ %237, %231 ], [ %225, %226 ], [ %225, %223 ]
  br i1 %145, label %242, label %255

242:                                              ; preds = %239
  %243 = icmp sgt i32 %13, -4
  %244 = select i1 %146, i1 %243, i1 false
  %245 = icmp slt i32 %127, %2
  %246 = select i1 %244, i1 %245, i1 false
  br i1 %246, label %247, label %255

247:                                              ; preds = %242
  %248 = add nsw i32 %127, %147
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %249
  %251 = load i8, i8 addrspace(1)* %250, align 1, !tbaa !7, !amdgpu.noclobber !6
  %252 = zext i8 %251 to i32
  %253 = add nuw nsw i32 %241, %252
  %254 = add nuw nsw i32 %240, 1
  br label %255

255:                                              ; preds = %247, %242, %239
  %256 = phi i32 [ %254, %247 ], [ %240, %242 ], [ %240, %239 ]
  %257 = phi i32 [ %253, %247 ], [ %241, %242 ], [ %241, %239 ]
  %258 = add nsw i32 %21, -1
  %259 = icmp sgt i32 %21, 0
  %260 = icmp sle i32 %21, %3
  %261 = mul nsw i32 %258, %2
  br i1 %259, label %262, label %275

262:                                              ; preds = %255
  %263 = icmp sgt i32 %13, 2
  %264 = select i1 %260, i1 %263, i1 false
  %265 = icmp slt i32 %30, %2
  %266 = select i1 %264, i1 %265, i1 false
  br i1 %266, label %267, label %275

267:                                              ; preds = %262
  %268 = add nsw i32 %30, %261
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %269
  %271 = load i8, i8 addrspace(1)* %270, align 1, !tbaa !7, !amdgpu.noclobber !6
  %272 = zext i8 %271 to i32
  %273 = add nuw nsw i32 %257, %272
  %274 = add nuw nsw i32 %256, 1
  br label %275

275:                                              ; preds = %267, %262, %255
  %276 = phi i32 [ %274, %267 ], [ %256, %262 ], [ %256, %255 ]
  %277 = phi i32 [ %273, %267 ], [ %257, %262 ], [ %257, %255 ]
  br i1 %259, label %278, label %291

278:                                              ; preds = %275
  %279 = icmp sgt i32 %13, 1
  %280 = select i1 %260, i1 %279, i1 false
  %281 = icmp slt i32 %45, %2
  %282 = select i1 %280, i1 %281, i1 false
  br i1 %282, label %283, label %291

283:                                              ; preds = %278
  %284 = add nsw i32 %45, %261
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %285
  %287 = load i8, i8 addrspace(1)* %286, align 1, !tbaa !7, !amdgpu.noclobber !6
  %288 = zext i8 %287 to i32
  %289 = add nuw nsw i32 %277, %288
  %290 = add nuw nsw i32 %276, 1
  br label %291

291:                                              ; preds = %283, %278, %275
  %292 = phi i32 [ %290, %283 ], [ %276, %278 ], [ %276, %275 ]
  %293 = phi i32 [ %289, %283 ], [ %277, %278 ], [ %277, %275 ]
  br i1 %259, label %294, label %307

294:                                              ; preds = %291
  %295 = icmp sgt i32 %13, 0
  %296 = select i1 %260, i1 %295, i1 false
  %297 = icmp sle i32 %13, %2
  %298 = select i1 %296, i1 %297, i1 false
  br i1 %298, label %299, label %307

299:                                              ; preds = %294
  %300 = add nsw i32 %62, %261
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %301
  %303 = load i8, i8 addrspace(1)* %302, align 1, !tbaa !7, !amdgpu.noclobber !6
  %304 = zext i8 %303 to i32
  %305 = add nuw nsw i32 %293, %304
  %306 = add nuw nsw i32 %292, 1
  br label %307

307:                                              ; preds = %299, %294, %291
  %308 = phi i1 [ %260, %299 ], [ %260, %294 ], [ false, %291 ]
  %309 = phi i32 [ %306, %299 ], [ %292, %294 ], [ %292, %291 ]
  %310 = phi i32 [ %305, %299 ], [ %293, %294 ], [ %293, %291 ]
  %311 = icmp sgt i32 %13, -1
  %312 = select i1 %308, i1 %311, i1 false
  br i1 %312, label %313, label %321

313:                                              ; preds = %307
  %314 = add nsw i32 %13, %261
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %315
  %317 = load i8, i8 addrspace(1)* %316, align 1, !tbaa !7, !amdgpu.noclobber !6
  %318 = zext i8 %317 to i32
  %319 = add nuw nsw i32 %310, %318
  %320 = add nuw nsw i32 %309, 1
  br label %321

321:                                              ; preds = %313, %307
  %322 = phi i32 [ %320, %313 ], [ %309, %307 ]
  %323 = phi i32 [ %319, %313 ], [ %310, %307 ]
  br i1 %259, label %324, label %337

324:                                              ; preds = %321
  %325 = icmp sgt i32 %13, -2
  %326 = select i1 %260, i1 %325, i1 false
  %327 = icmp slt i32 %93, %2
  %328 = select i1 %326, i1 %327, i1 false
  br i1 %328, label %329, label %337

329:                                              ; preds = %324
  %330 = add nsw i32 %93, %261
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %331
  %333 = load i8, i8 addrspace(1)* %332, align 1, !tbaa !7, !amdgpu.noclobber !6
  %334 = zext i8 %333 to i32
  %335 = add nuw nsw i32 %323, %334
  %336 = add nuw nsw i32 %322, 1
  br label %337

337:                                              ; preds = %329, %324, %321
  %338 = phi i32 [ %336, %329 ], [ %322, %324 ], [ %322, %321 ]
  %339 = phi i32 [ %335, %329 ], [ %323, %324 ], [ %323, %321 ]
  br i1 %259, label %340, label %353

340:                                              ; preds = %337
  %341 = icmp sgt i32 %13, -3
  %342 = select i1 %260, i1 %341, i1 false
  %343 = icmp slt i32 %110, %2
  %344 = select i1 %342, i1 %343, i1 false
  br i1 %344, label %345, label %353

345:                                              ; preds = %340
  %346 = add nsw i32 %110, %261
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %347
  %349 = load i8, i8 addrspace(1)* %348, align 1, !tbaa !7, !amdgpu.noclobber !6
  %350 = zext i8 %349 to i32
  %351 = add nuw nsw i32 %339, %350
  %352 = add nuw nsw i32 %338, 1
  br label %353

353:                                              ; preds = %345, %340, %337
  %354 = phi i32 [ %352, %345 ], [ %338, %340 ], [ %338, %337 ]
  %355 = phi i32 [ %351, %345 ], [ %339, %340 ], [ %339, %337 ]
  br i1 %259, label %356, label %369

356:                                              ; preds = %353
  %357 = icmp sgt i32 %13, -4
  %358 = select i1 %260, i1 %357, i1 false
  %359 = icmp slt i32 %127, %2
  %360 = select i1 %358, i1 %359, i1 false
  br i1 %360, label %361, label %369

361:                                              ; preds = %356
  %362 = add nsw i32 %127, %261
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %363
  %365 = load i8, i8 addrspace(1)* %364, align 1, !tbaa !7, !amdgpu.noclobber !6
  %366 = zext i8 %365 to i32
  %367 = add nuw nsw i32 %355, %366
  %368 = add nuw nsw i32 %354, 1
  br label %369

369:                                              ; preds = %361, %356, %353
  %370 = phi i32 [ %368, %361 ], [ %354, %356 ], [ %354, %353 ]
  %371 = phi i32 [ %367, %361 ], [ %355, %356 ], [ %355, %353 ]
  %372 = icmp sgt i32 %21, -1
  %373 = mul nsw i32 %21, %2
  br i1 %372, label %374, label %386

374:                                              ; preds = %369
  %375 = icmp sgt i32 %13, 2
  %376 = icmp slt i32 %30, %2
  %377 = select i1 %375, i1 %376, i1 false
  br i1 %377, label %378, label %386

378:                                              ; preds = %374
  %379 = add nsw i32 %30, %373
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %380
  %382 = load i8, i8 addrspace(1)* %381, align 1, !tbaa !7, !amdgpu.noclobber !6
  %383 = zext i8 %382 to i32
  %384 = add nuw nsw i32 %371, %383
  %385 = add nuw nsw i32 %370, 1
  br label %386

386:                                              ; preds = %378, %374, %369
  %387 = phi i32 [ %385, %378 ], [ %370, %374 ], [ %370, %369 ]
  %388 = phi i32 [ %384, %378 ], [ %371, %374 ], [ %371, %369 ]
  br i1 %372, label %389, label %401

389:                                              ; preds = %386
  %390 = icmp sgt i32 %13, 1
  %391 = icmp slt i32 %45, %2
  %392 = select i1 %390, i1 %391, i1 false
  br i1 %392, label %393, label %401

393:                                              ; preds = %389
  %394 = add nsw i32 %45, %373
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %395
  %397 = load i8, i8 addrspace(1)* %396, align 1, !tbaa !7, !amdgpu.noclobber !6
  %398 = zext i8 %397 to i32
  %399 = add nuw nsw i32 %388, %398
  %400 = add nuw nsw i32 %387, 1
  br label %401

401:                                              ; preds = %393, %389, %386
  %402 = phi i32 [ %400, %393 ], [ %387, %389 ], [ %387, %386 ]
  %403 = phi i32 [ %399, %393 ], [ %388, %389 ], [ %388, %386 ]
  br i1 %372, label %404, label %416

404:                                              ; preds = %401
  %405 = icmp sgt i32 %13, 0
  %406 = icmp sle i32 %13, %2
  %407 = select i1 %405, i1 %406, i1 false
  br i1 %407, label %408, label %416

408:                                              ; preds = %404
  %409 = add nsw i32 %62, %373
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %410
  %412 = load i8, i8 addrspace(1)* %411, align 1, !tbaa !7, !amdgpu.noclobber !6
  %413 = zext i8 %412 to i32
  %414 = add nuw nsw i32 %403, %413
  %415 = add nuw nsw i32 %402, 1
  br label %416

416:                                              ; preds = %408, %404, %401
  %417 = phi i32 [ %415, %408 ], [ %402, %404 ], [ %402, %401 ]
  %418 = phi i32 [ %414, %408 ], [ %403, %404 ], [ %403, %401 ]
  %419 = icmp sgt i32 %13, -1
  %420 = select i1 %372, i1 %419, i1 false
  br i1 %420, label %421, label %429

421:                                              ; preds = %416
  %422 = add nsw i32 %13, %373
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %423
  %425 = load i8, i8 addrspace(1)* %424, align 1, !tbaa !7, !amdgpu.noclobber !6
  %426 = zext i8 %425 to i32
  %427 = add nuw nsw i32 %418, %426
  %428 = add nuw nsw i32 %417, 1
  br label %429

429:                                              ; preds = %421, %416
  %430 = phi i32 [ %428, %421 ], [ %417, %416 ]
  %431 = phi i32 [ %427, %421 ], [ %418, %416 ]
  br i1 %372, label %432, label %444

432:                                              ; preds = %429
  %433 = icmp sgt i32 %13, -2
  %434 = icmp slt i32 %93, %2
  %435 = select i1 %433, i1 %434, i1 false
  br i1 %435, label %436, label %444

436:                                              ; preds = %432
  %437 = add nsw i32 %93, %373
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %438
  %440 = load i8, i8 addrspace(1)* %439, align 1, !tbaa !7, !amdgpu.noclobber !6
  %441 = zext i8 %440 to i32
  %442 = add nuw nsw i32 %431, %441
  %443 = add nuw nsw i32 %430, 1
  br label %444

444:                                              ; preds = %436, %432, %429
  %445 = phi i32 [ %443, %436 ], [ %430, %432 ], [ %430, %429 ]
  %446 = phi i32 [ %442, %436 ], [ %431, %432 ], [ %431, %429 ]
  br i1 %372, label %447, label %459

447:                                              ; preds = %444
  %448 = icmp sgt i32 %13, -3
  %449 = icmp slt i32 %110, %2
  %450 = select i1 %448, i1 %449, i1 false
  br i1 %450, label %451, label %459

451:                                              ; preds = %447
  %452 = add nsw i32 %110, %373
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %453
  %455 = load i8, i8 addrspace(1)* %454, align 1, !tbaa !7, !amdgpu.noclobber !6
  %456 = zext i8 %455 to i32
  %457 = add nuw nsw i32 %446, %456
  %458 = add nuw nsw i32 %445, 1
  br label %459

459:                                              ; preds = %451, %447, %444
  %460 = phi i32 [ %458, %451 ], [ %445, %447 ], [ %445, %444 ]
  %461 = phi i32 [ %457, %451 ], [ %446, %447 ], [ %446, %444 ]
  br i1 %372, label %462, label %474

462:                                              ; preds = %459
  %463 = icmp sgt i32 %13, -4
  %464 = icmp slt i32 %127, %2
  %465 = select i1 %463, i1 %464, i1 false
  br i1 %465, label %466, label %474

466:                                              ; preds = %462
  %467 = add nsw i32 %127, %373
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %468
  %470 = load i8, i8 addrspace(1)* %469, align 1, !tbaa !7, !amdgpu.noclobber !6
  %471 = zext i8 %470 to i32
  %472 = add nuw nsw i32 %461, %471
  %473 = add nuw nsw i32 %460, 1
  br label %474

474:                                              ; preds = %466, %462, %459
  %475 = phi i32 [ %473, %466 ], [ %460, %462 ], [ %460, %459 ]
  %476 = phi i32 [ %472, %466 ], [ %461, %462 ], [ %461, %459 ]
  %477 = add nsw i32 %21, 1
  %478 = icmp sgt i32 %21, -2
  %479 = icmp slt i32 %477, %3
  %480 = mul nsw i32 %477, %2
  br i1 %478, label %481, label %494

481:                                              ; preds = %474
  %482 = icmp sgt i32 %13, 2
  %483 = select i1 %479, i1 %482, i1 false
  %484 = icmp slt i32 %30, %2
  %485 = select i1 %483, i1 %484, i1 false
  br i1 %485, label %486, label %494

486:                                              ; preds = %481
  %487 = add nsw i32 %30, %480
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %488
  %490 = load i8, i8 addrspace(1)* %489, align 1, !tbaa !7, !amdgpu.noclobber !6
  %491 = zext i8 %490 to i32
  %492 = add nuw nsw i32 %476, %491
  %493 = add nuw nsw i32 %475, 1
  br label %494

494:                                              ; preds = %486, %481, %474
  %495 = phi i32 [ %493, %486 ], [ %475, %481 ], [ %475, %474 ]
  %496 = phi i32 [ %492, %486 ], [ %476, %481 ], [ %476, %474 ]
  br i1 %478, label %497, label %510

497:                                              ; preds = %494
  %498 = icmp sgt i32 %13, 1
  %499 = select i1 %479, i1 %498, i1 false
  %500 = icmp slt i32 %45, %2
  %501 = select i1 %499, i1 %500, i1 false
  br i1 %501, label %502, label %510

502:                                              ; preds = %497
  %503 = add nsw i32 %45, %480
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %504
  %506 = load i8, i8 addrspace(1)* %505, align 1, !tbaa !7, !amdgpu.noclobber !6
  %507 = zext i8 %506 to i32
  %508 = add nuw nsw i32 %496, %507
  %509 = add nuw nsw i32 %495, 1
  br label %510

510:                                              ; preds = %502, %497, %494
  %511 = phi i32 [ %509, %502 ], [ %495, %497 ], [ %495, %494 ]
  %512 = phi i32 [ %508, %502 ], [ %496, %497 ], [ %496, %494 ]
  br i1 %478, label %513, label %526

513:                                              ; preds = %510
  %514 = icmp sgt i32 %13, 0
  %515 = select i1 %479, i1 %514, i1 false
  %516 = icmp sle i32 %13, %2
  %517 = select i1 %515, i1 %516, i1 false
  br i1 %517, label %518, label %526

518:                                              ; preds = %513
  %519 = add nsw i32 %62, %480
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %520
  %522 = load i8, i8 addrspace(1)* %521, align 1, !tbaa !7, !amdgpu.noclobber !6
  %523 = zext i8 %522 to i32
  %524 = add nuw nsw i32 %512, %523
  %525 = add nuw nsw i32 %511, 1
  br label %526

526:                                              ; preds = %518, %513, %510
  %527 = phi i1 [ %479, %518 ], [ %479, %513 ], [ false, %510 ]
  %528 = phi i32 [ %525, %518 ], [ %511, %513 ], [ %511, %510 ]
  %529 = phi i32 [ %524, %518 ], [ %512, %513 ], [ %512, %510 ]
  %530 = icmp sgt i32 %13, -1
  %531 = select i1 %527, i1 %530, i1 false
  br i1 %531, label %532, label %540

532:                                              ; preds = %526
  %533 = add nsw i32 %13, %480
  %534 = sext i32 %533 to i64
  %535 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %534
  %536 = load i8, i8 addrspace(1)* %535, align 1, !tbaa !7, !amdgpu.noclobber !6
  %537 = zext i8 %536 to i32
  %538 = add nuw nsw i32 %529, %537
  %539 = add nuw nsw i32 %528, 1
  br label %540

540:                                              ; preds = %532, %526
  %541 = phi i32 [ %539, %532 ], [ %528, %526 ]
  %542 = phi i32 [ %538, %532 ], [ %529, %526 ]
  br i1 %478, label %543, label %556

543:                                              ; preds = %540
  %544 = icmp sgt i32 %13, -2
  %545 = select i1 %479, i1 %544, i1 false
  %546 = icmp slt i32 %93, %2
  %547 = select i1 %545, i1 %546, i1 false
  br i1 %547, label %548, label %556

548:                                              ; preds = %543
  %549 = add nsw i32 %93, %480
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %550
  %552 = load i8, i8 addrspace(1)* %551, align 1, !tbaa !7, !amdgpu.noclobber !6
  %553 = zext i8 %552 to i32
  %554 = add nuw nsw i32 %542, %553
  %555 = add nuw nsw i32 %541, 1
  br label %556

556:                                              ; preds = %548, %543, %540
  %557 = phi i32 [ %555, %548 ], [ %541, %543 ], [ %541, %540 ]
  %558 = phi i32 [ %554, %548 ], [ %542, %543 ], [ %542, %540 ]
  br i1 %478, label %559, label %572

559:                                              ; preds = %556
  %560 = icmp sgt i32 %13, -3
  %561 = select i1 %479, i1 %560, i1 false
  %562 = icmp slt i32 %110, %2
  %563 = select i1 %561, i1 %562, i1 false
  br i1 %563, label %564, label %572

564:                                              ; preds = %559
  %565 = add nsw i32 %110, %480
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %566
  %568 = load i8, i8 addrspace(1)* %567, align 1, !tbaa !7, !amdgpu.noclobber !6
  %569 = zext i8 %568 to i32
  %570 = add nuw nsw i32 %558, %569
  %571 = add nuw nsw i32 %557, 1
  br label %572

572:                                              ; preds = %564, %559, %556
  %573 = phi i32 [ %571, %564 ], [ %557, %559 ], [ %557, %556 ]
  %574 = phi i32 [ %570, %564 ], [ %558, %559 ], [ %558, %556 ]
  br i1 %478, label %575, label %588

575:                                              ; preds = %572
  %576 = icmp sgt i32 %13, -4
  %577 = select i1 %479, i1 %576, i1 false
  %578 = icmp slt i32 %127, %2
  %579 = select i1 %577, i1 %578, i1 false
  br i1 %579, label %580, label %588

580:                                              ; preds = %575
  %581 = add nsw i32 %127, %480
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %582
  %584 = load i8, i8 addrspace(1)* %583, align 1, !tbaa !7, !amdgpu.noclobber !6
  %585 = zext i8 %584 to i32
  %586 = add nuw nsw i32 %574, %585
  %587 = add nuw nsw i32 %573, 1
  br label %588

588:                                              ; preds = %580, %575, %572
  %589 = phi i32 [ %587, %580 ], [ %573, %575 ], [ %573, %572 ]
  %590 = phi i32 [ %586, %580 ], [ %574, %575 ], [ %574, %572 ]
  %591 = add nsw i32 %21, 2
  %592 = icmp sgt i32 %21, -3
  %593 = icmp slt i32 %591, %3
  %594 = mul nsw i32 %591, %2
  br i1 %592, label %595, label %608

595:                                              ; preds = %588
  %596 = icmp sgt i32 %13, 2
  %597 = select i1 %593, i1 %596, i1 false
  %598 = icmp slt i32 %30, %2
  %599 = select i1 %597, i1 %598, i1 false
  br i1 %599, label %600, label %608

600:                                              ; preds = %595
  %601 = add nsw i32 %30, %594
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %602
  %604 = load i8, i8 addrspace(1)* %603, align 1, !tbaa !7, !amdgpu.noclobber !6
  %605 = zext i8 %604 to i32
  %606 = add nuw nsw i32 %590, %605
  %607 = add nuw nsw i32 %589, 1
  br label %608

608:                                              ; preds = %600, %595, %588
  %609 = phi i32 [ %607, %600 ], [ %589, %595 ], [ %589, %588 ]
  %610 = phi i32 [ %606, %600 ], [ %590, %595 ], [ %590, %588 ]
  br i1 %592, label %611, label %624

611:                                              ; preds = %608
  %612 = icmp sgt i32 %13, 1
  %613 = select i1 %593, i1 %612, i1 false
  %614 = icmp slt i32 %45, %2
  %615 = select i1 %613, i1 %614, i1 false
  br i1 %615, label %616, label %624

616:                                              ; preds = %611
  %617 = add nsw i32 %45, %594
  %618 = sext i32 %617 to i64
  %619 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %618
  %620 = load i8, i8 addrspace(1)* %619, align 1, !tbaa !7, !amdgpu.noclobber !6
  %621 = zext i8 %620 to i32
  %622 = add nuw nsw i32 %610, %621
  %623 = add nuw nsw i32 %609, 1
  br label %624

624:                                              ; preds = %616, %611, %608
  %625 = phi i32 [ %623, %616 ], [ %609, %611 ], [ %609, %608 ]
  %626 = phi i32 [ %622, %616 ], [ %610, %611 ], [ %610, %608 ]
  br i1 %592, label %627, label %640

627:                                              ; preds = %624
  %628 = icmp sgt i32 %13, 0
  %629 = select i1 %593, i1 %628, i1 false
  %630 = icmp sle i32 %13, %2
  %631 = select i1 %629, i1 %630, i1 false
  br i1 %631, label %632, label %640

632:                                              ; preds = %627
  %633 = add nsw i32 %62, %594
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %634
  %636 = load i8, i8 addrspace(1)* %635, align 1, !tbaa !7, !amdgpu.noclobber !6
  %637 = zext i8 %636 to i32
  %638 = add nuw nsw i32 %626, %637
  %639 = add nuw nsw i32 %625, 1
  br label %640

640:                                              ; preds = %632, %627, %624
  %641 = phi i1 [ %593, %632 ], [ %593, %627 ], [ false, %624 ]
  %642 = phi i32 [ %639, %632 ], [ %625, %627 ], [ %625, %624 ]
  %643 = phi i32 [ %638, %632 ], [ %626, %627 ], [ %626, %624 ]
  %644 = icmp sgt i32 %13, -1
  %645 = select i1 %641, i1 %644, i1 false
  br i1 %645, label %646, label %654

646:                                              ; preds = %640
  %647 = add nsw i32 %13, %594
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %648
  %650 = load i8, i8 addrspace(1)* %649, align 1, !tbaa !7, !amdgpu.noclobber !6
  %651 = zext i8 %650 to i32
  %652 = add nuw nsw i32 %643, %651
  %653 = add nuw nsw i32 %642, 1
  br label %654

654:                                              ; preds = %646, %640
  %655 = phi i32 [ %653, %646 ], [ %642, %640 ]
  %656 = phi i32 [ %652, %646 ], [ %643, %640 ]
  br i1 %592, label %657, label %670

657:                                              ; preds = %654
  %658 = icmp sgt i32 %13, -2
  %659 = select i1 %593, i1 %658, i1 false
  %660 = icmp slt i32 %93, %2
  %661 = select i1 %659, i1 %660, i1 false
  br i1 %661, label %662, label %670

662:                                              ; preds = %657
  %663 = add nsw i32 %93, %594
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %664
  %666 = load i8, i8 addrspace(1)* %665, align 1, !tbaa !7, !amdgpu.noclobber !6
  %667 = zext i8 %666 to i32
  %668 = add nuw nsw i32 %656, %667
  %669 = add nuw nsw i32 %655, 1
  br label %670

670:                                              ; preds = %662, %657, %654
  %671 = phi i32 [ %669, %662 ], [ %655, %657 ], [ %655, %654 ]
  %672 = phi i32 [ %668, %662 ], [ %656, %657 ], [ %656, %654 ]
  br i1 %592, label %673, label %686

673:                                              ; preds = %670
  %674 = icmp sgt i32 %13, -3
  %675 = select i1 %593, i1 %674, i1 false
  %676 = icmp slt i32 %110, %2
  %677 = select i1 %675, i1 %676, i1 false
  br i1 %677, label %678, label %686

678:                                              ; preds = %673
  %679 = add nsw i32 %110, %594
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %680
  %682 = load i8, i8 addrspace(1)* %681, align 1, !tbaa !7, !amdgpu.noclobber !6
  %683 = zext i8 %682 to i32
  %684 = add nuw nsw i32 %672, %683
  %685 = add nuw nsw i32 %671, 1
  br label %686

686:                                              ; preds = %678, %673, %670
  %687 = phi i32 [ %685, %678 ], [ %671, %673 ], [ %671, %670 ]
  %688 = phi i32 [ %684, %678 ], [ %672, %673 ], [ %672, %670 ]
  br i1 %592, label %689, label %702

689:                                              ; preds = %686
  %690 = icmp sgt i32 %13, -4
  %691 = select i1 %593, i1 %690, i1 false
  %692 = icmp slt i32 %127, %2
  %693 = select i1 %691, i1 %692, i1 false
  br i1 %693, label %694, label %702

694:                                              ; preds = %689
  %695 = add nsw i32 %127, %594
  %696 = sext i32 %695 to i64
  %697 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %696
  %698 = load i8, i8 addrspace(1)* %697, align 1, !tbaa !7, !amdgpu.noclobber !6
  %699 = zext i8 %698 to i32
  %700 = add nuw nsw i32 %688, %699
  %701 = add nuw nsw i32 %687, 1
  br label %702

702:                                              ; preds = %694, %689, %686
  %703 = phi i32 [ %701, %694 ], [ %687, %689 ], [ %687, %686 ]
  %704 = phi i32 [ %700, %694 ], [ %688, %689 ], [ %688, %686 ]
  %705 = add nsw i32 %21, 3
  %706 = icmp sgt i32 %21, -4
  %707 = icmp slt i32 %705, %3
  %708 = mul nsw i32 %705, %2
  br i1 %706, label %709, label %722

709:                                              ; preds = %702
  %710 = icmp sgt i32 %13, 2
  %711 = select i1 %707, i1 %710, i1 false
  %712 = icmp slt i32 %30, %2
  %713 = select i1 %711, i1 %712, i1 false
  br i1 %713, label %714, label %722

714:                                              ; preds = %709
  %715 = add nsw i32 %30, %708
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %716
  %718 = load i8, i8 addrspace(1)* %717, align 1, !tbaa !7, !amdgpu.noclobber !6
  %719 = zext i8 %718 to i32
  %720 = add nuw nsw i32 %704, %719
  %721 = add nuw nsw i32 %703, 1
  br label %722

722:                                              ; preds = %714, %709, %702
  %723 = phi i32 [ %721, %714 ], [ %703, %709 ], [ %703, %702 ]
  %724 = phi i32 [ %720, %714 ], [ %704, %709 ], [ %704, %702 ]
  br i1 %706, label %725, label %738

725:                                              ; preds = %722
  %726 = icmp sgt i32 %13, 1
  %727 = select i1 %707, i1 %726, i1 false
  %728 = icmp slt i32 %45, %2
  %729 = select i1 %727, i1 %728, i1 false
  br i1 %729, label %730, label %738

730:                                              ; preds = %725
  %731 = add nsw i32 %45, %708
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %732
  %734 = load i8, i8 addrspace(1)* %733, align 1, !tbaa !7, !amdgpu.noclobber !6
  %735 = zext i8 %734 to i32
  %736 = add nuw nsw i32 %724, %735
  %737 = add nuw nsw i32 %723, 1
  br label %738

738:                                              ; preds = %730, %725, %722
  %739 = phi i32 [ %737, %730 ], [ %723, %725 ], [ %723, %722 ]
  %740 = phi i32 [ %736, %730 ], [ %724, %725 ], [ %724, %722 ]
  br i1 %706, label %741, label %754

741:                                              ; preds = %738
  %742 = icmp sgt i32 %13, 0
  %743 = select i1 %707, i1 %742, i1 false
  %744 = icmp sle i32 %13, %2
  %745 = select i1 %743, i1 %744, i1 false
  br i1 %745, label %746, label %754

746:                                              ; preds = %741
  %747 = add nsw i32 %62, %708
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %748
  %750 = load i8, i8 addrspace(1)* %749, align 1, !tbaa !7, !amdgpu.noclobber !6
  %751 = zext i8 %750 to i32
  %752 = add nuw nsw i32 %740, %751
  %753 = add nuw nsw i32 %739, 1
  br label %754

754:                                              ; preds = %746, %741, %738
  %755 = phi i1 [ %707, %746 ], [ %707, %741 ], [ false, %738 ]
  %756 = phi i32 [ %753, %746 ], [ %739, %741 ], [ %739, %738 ]
  %757 = phi i32 [ %752, %746 ], [ %740, %741 ], [ %740, %738 ]
  %758 = icmp sgt i32 %13, -1
  %759 = select i1 %755, i1 %758, i1 false
  br i1 %759, label %760, label %768

760:                                              ; preds = %754
  %761 = add nsw i32 %13, %708
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %762
  %764 = load i8, i8 addrspace(1)* %763, align 1, !tbaa !7, !amdgpu.noclobber !6
  %765 = zext i8 %764 to i32
  %766 = add nuw nsw i32 %757, %765
  %767 = add nuw nsw i32 %756, 1
  br label %768

768:                                              ; preds = %760, %754
  %769 = phi i32 [ %767, %760 ], [ %756, %754 ]
  %770 = phi i32 [ %766, %760 ], [ %757, %754 ]
  br i1 %706, label %771, label %784

771:                                              ; preds = %768
  %772 = icmp sgt i32 %13, -2
  %773 = select i1 %707, i1 %772, i1 false
  %774 = icmp slt i32 %93, %2
  %775 = select i1 %773, i1 %774, i1 false
  br i1 %775, label %776, label %784

776:                                              ; preds = %771
  %777 = add nsw i32 %93, %708
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %778
  %780 = load i8, i8 addrspace(1)* %779, align 1, !tbaa !7, !amdgpu.noclobber !6
  %781 = zext i8 %780 to i32
  %782 = add nuw nsw i32 %770, %781
  %783 = add nuw nsw i32 %769, 1
  br label %784

784:                                              ; preds = %776, %771, %768
  %785 = phi i32 [ %783, %776 ], [ %769, %771 ], [ %769, %768 ]
  %786 = phi i32 [ %782, %776 ], [ %770, %771 ], [ %770, %768 ]
  br i1 %706, label %787, label %800

787:                                              ; preds = %784
  %788 = icmp sgt i32 %13, -3
  %789 = select i1 %707, i1 %788, i1 false
  %790 = icmp slt i32 %110, %2
  %791 = select i1 %789, i1 %790, i1 false
  br i1 %791, label %792, label %800

792:                                              ; preds = %787
  %793 = add nsw i32 %110, %708
  %794 = sext i32 %793 to i64
  %795 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %794
  %796 = load i8, i8 addrspace(1)* %795, align 1, !tbaa !7, !amdgpu.noclobber !6
  %797 = zext i8 %796 to i32
  %798 = add nuw nsw i32 %786, %797
  %799 = add nuw nsw i32 %785, 1
  br label %800

800:                                              ; preds = %792, %787, %784
  %801 = phi i32 [ %799, %792 ], [ %785, %787 ], [ %785, %784 ]
  %802 = phi i32 [ %798, %792 ], [ %786, %787 ], [ %786, %784 ]
  br i1 %706, label %803, label %816

803:                                              ; preds = %800
  %804 = icmp sgt i32 %13, -4
  %805 = select i1 %707, i1 %804, i1 false
  %806 = icmp slt i32 %127, %2
  %807 = select i1 %805, i1 %806, i1 false
  br i1 %807, label %808, label %816

808:                                              ; preds = %803
  %809 = add nsw i32 %127, %708
  %810 = sext i32 %809 to i64
  %811 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %810
  %812 = load i8, i8 addrspace(1)* %811, align 1, !tbaa !7, !amdgpu.noclobber !6
  %813 = zext i8 %812 to i32
  %814 = add nuw nsw i32 %802, %813
  %815 = add nuw nsw i32 %801, 1
  br label %816

816:                                              ; preds = %808, %803, %800
  %817 = phi i32 [ %815, %808 ], [ %801, %803 ], [ %801, %800 ]
  %818 = phi i32 [ %814, %808 ], [ %802, %803 ], [ %802, %800 ]
  %819 = trunc i32 %818 to i16
  %820 = trunc i32 %817 to i16
  %821 = udiv i16 %819, %820
  %822 = trunc i16 %821 to i8
  %823 = add nsw i32 %373, %13
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %824
  store i8 %822, i8 addrspace(1)* %825, align 1, !tbaa !7
  br label %826

826:                                              ; preds = %816, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
