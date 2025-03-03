; ModuleID = '../data/hip_kernels/18395/2/main.cu'
source_filename = "../data/hip_kernels/18395/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10meanFilterPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %2
  %23 = icmp slt i32 %13, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %454

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %3
  %27 = add i32 %13, -2
  %28 = icmp sgt i32 %27, -1
  %29 = icmp slt i32 %27, %3
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %43

31:                                               ; preds = %25
  %32 = add nsw i32 %21, -2
  %33 = icmp sgt i32 %21, 1
  %34 = icmp slt i32 %32, %2
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %43

36:                                               ; preds = %31
  %37 = mul nsw i32 %32, %3
  %38 = add i32 %27, %37
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !5
  %42 = zext i8 %41 to i32
  br label %43

43:                                               ; preds = %25, %31, %36
  %44 = phi i32 [ 1, %36 ], [ 0, %31 ], [ 0, %25 ]
  %45 = phi i32 [ %42, %36 ], [ 0, %31 ], [ 0, %25 ]
  br i1 %30, label %46, label %60

46:                                               ; preds = %43
  %47 = icmp sgt i32 %21, 0
  %48 = icmp sle i32 %21, %2
  %49 = select i1 %47, i1 %48, i1 false
  br i1 %49, label %50, label %60

50:                                               ; preds = %46
  %51 = add nsw i32 %21, -1
  %52 = mul nsw i32 %51, %3
  %53 = add i32 %27, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !5
  %57 = zext i8 %56 to i32
  %58 = add nuw nsw i32 %45, %57
  %59 = add nuw nsw i32 %44, 1
  br label %60

60:                                               ; preds = %50, %46, %43
  %61 = phi i32 [ %59, %50 ], [ %44, %46 ], [ %44, %43 ]
  %62 = phi i32 [ %58, %50 ], [ %45, %46 ], [ %45, %43 ]
  %63 = icmp sgt i32 %21, -1
  %64 = select i1 %30, i1 %63, i1 false
  br i1 %64, label %65, label %73

65:                                               ; preds = %60
  %66 = add i32 %27, %26
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i8 %69 to i32
  %71 = add nuw nsw i32 %62, %70
  %72 = add nuw nsw i32 %61, 1
  br label %73

73:                                               ; preds = %65, %60
  %74 = phi i32 [ %72, %65 ], [ %61, %60 ]
  %75 = phi i32 [ %71, %65 ], [ %62, %60 ]
  br i1 %30, label %76, label %90

76:                                               ; preds = %73
  %77 = add nsw i32 %21, 1
  %78 = icmp sgt i32 %21, -2
  %79 = icmp slt i32 %77, %2
  %80 = select i1 %78, i1 %79, i1 false
  br i1 %80, label %81, label %90

81:                                               ; preds = %76
  %82 = mul nsw i32 %77, %3
  %83 = add i32 %27, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !amdgpu.noclobber !5
  %87 = zext i8 %86 to i32
  %88 = add nuw nsw i32 %75, %87
  %89 = add nuw nsw i32 %74, 1
  br label %90

90:                                               ; preds = %81, %76, %73
  %91 = phi i32 [ %89, %81 ], [ %74, %76 ], [ %74, %73 ]
  %92 = phi i32 [ %88, %81 ], [ %75, %76 ], [ %75, %73 ]
  br i1 %30, label %93, label %107

93:                                               ; preds = %90
  %94 = add nsw i32 %21, 2
  %95 = icmp sgt i32 %21, -3
  %96 = icmp slt i32 %94, %2
  %97 = select i1 %95, i1 %96, i1 false
  br i1 %97, label %98, label %107

98:                                               ; preds = %93
  %99 = mul nsw i32 %94, %3
  %100 = add i32 %27, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7, !amdgpu.noclobber !5
  %104 = zext i8 %103 to i32
  %105 = add nuw nsw i32 %92, %104
  %106 = add nuw nsw i32 %91, 1
  br label %107

107:                                              ; preds = %98, %93, %90
  %108 = phi i32 [ %106, %98 ], [ %91, %93 ], [ %91, %90 ]
  %109 = phi i32 [ %105, %98 ], [ %92, %93 ], [ %92, %90 ]
  %110 = add i32 %13, -1
  %111 = icmp sgt i32 %110, -1
  %112 = icmp slt i32 %110, %3
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %128

114:                                              ; preds = %107
  %115 = add nsw i32 %21, -2
  %116 = icmp sgt i32 %21, 1
  %117 = icmp slt i32 %115, %2
  %118 = select i1 %116, i1 %117, i1 false
  br i1 %118, label %119, label %128

119:                                              ; preds = %114
  %120 = mul nsw i32 %115, %3
  %121 = add i32 %110, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !7, !amdgpu.noclobber !5
  %125 = zext i8 %124 to i32
  %126 = add nuw nsw i32 %109, %125
  %127 = add nuw nsw i32 %108, 1
  br label %128

128:                                              ; preds = %119, %114, %107
  %129 = phi i32 [ %127, %119 ], [ %108, %114 ], [ %108, %107 ]
  %130 = phi i32 [ %126, %119 ], [ %109, %114 ], [ %109, %107 ]
  br i1 %113, label %131, label %145

131:                                              ; preds = %128
  %132 = icmp sgt i32 %21, 0
  %133 = icmp sle i32 %21, %2
  %134 = select i1 %132, i1 %133, i1 false
  br i1 %134, label %135, label %145

135:                                              ; preds = %131
  %136 = add nsw i32 %21, -1
  %137 = mul nsw i32 %136, %3
  %138 = add i32 %110, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !7, !amdgpu.noclobber !5
  %142 = zext i8 %141 to i32
  %143 = add nuw nsw i32 %130, %142
  %144 = add nuw nsw i32 %129, 1
  br label %145

145:                                              ; preds = %135, %131, %128
  %146 = phi i32 [ %144, %135 ], [ %129, %131 ], [ %129, %128 ]
  %147 = phi i32 [ %143, %135 ], [ %130, %131 ], [ %130, %128 ]
  %148 = icmp sgt i32 %21, -1
  %149 = select i1 %113, i1 %148, i1 false
  br i1 %149, label %150, label %158

150:                                              ; preds = %145
  %151 = add i32 %110, %26
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7, !amdgpu.noclobber !5
  %155 = zext i8 %154 to i32
  %156 = add nuw nsw i32 %147, %155
  %157 = add nuw nsw i32 %146, 1
  br label %158

158:                                              ; preds = %150, %145
  %159 = phi i32 [ %157, %150 ], [ %146, %145 ]
  %160 = phi i32 [ %156, %150 ], [ %147, %145 ]
  br i1 %113, label %161, label %175

161:                                              ; preds = %158
  %162 = add nsw i32 %21, 1
  %163 = icmp sgt i32 %21, -2
  %164 = icmp slt i32 %162, %2
  %165 = select i1 %163, i1 %164, i1 false
  br i1 %165, label %166, label %175

166:                                              ; preds = %161
  %167 = mul nsw i32 %162, %3
  %168 = add i32 %110, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !7, !amdgpu.noclobber !5
  %172 = zext i8 %171 to i32
  %173 = add nuw nsw i32 %160, %172
  %174 = add nuw nsw i32 %159, 1
  br label %175

175:                                              ; preds = %166, %161, %158
  %176 = phi i32 [ %174, %166 ], [ %159, %161 ], [ %159, %158 ]
  %177 = phi i32 [ %173, %166 ], [ %160, %161 ], [ %160, %158 ]
  br i1 %113, label %178, label %192

178:                                              ; preds = %175
  %179 = add nsw i32 %21, 2
  %180 = icmp sgt i32 %21, -3
  %181 = icmp slt i32 %179, %2
  %182 = select i1 %180, i1 %181, i1 false
  br i1 %182, label %183, label %192

183:                                              ; preds = %178
  %184 = mul nsw i32 %179, %3
  %185 = add i32 %110, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %186
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !7, !amdgpu.noclobber !5
  %189 = zext i8 %188 to i32
  %190 = add nuw nsw i32 %177, %189
  %191 = add nuw nsw i32 %176, 1
  br label %192

192:                                              ; preds = %183, %178, %175
  %193 = phi i32 [ %191, %183 ], [ %176, %178 ], [ %176, %175 ]
  %194 = phi i32 [ %190, %183 ], [ %177, %178 ], [ %177, %175 ]
  %195 = icmp sgt i32 %13, -1
  br i1 %195, label %196, label %210

196:                                              ; preds = %192
  %197 = add nsw i32 %21, -2
  %198 = icmp sgt i32 %21, 1
  %199 = icmp slt i32 %197, %2
  %200 = select i1 %198, i1 %199, i1 false
  br i1 %200, label %201, label %210

201:                                              ; preds = %196
  %202 = mul nsw i32 %197, %3
  %203 = add i32 %13, %202
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %204
  %206 = load i8, i8 addrspace(1)* %205, align 1, !tbaa !7, !amdgpu.noclobber !5
  %207 = zext i8 %206 to i32
  %208 = add nuw nsw i32 %194, %207
  %209 = add nuw nsw i32 %193, 1
  br label %210

210:                                              ; preds = %201, %196, %192
  %211 = phi i32 [ %209, %201 ], [ %193, %196 ], [ %193, %192 ]
  %212 = phi i32 [ %208, %201 ], [ %194, %196 ], [ %194, %192 ]
  br i1 %195, label %213, label %227

213:                                              ; preds = %210
  %214 = icmp sgt i32 %21, 0
  %215 = icmp sle i32 %21, %2
  %216 = select i1 %214, i1 %215, i1 false
  br i1 %216, label %217, label %227

217:                                              ; preds = %213
  %218 = add nsw i32 %21, -1
  %219 = mul nsw i32 %218, %3
  %220 = add i32 %13, %219
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %221
  %223 = load i8, i8 addrspace(1)* %222, align 1, !tbaa !7, !amdgpu.noclobber !5
  %224 = zext i8 %223 to i32
  %225 = add nuw nsw i32 %212, %224
  %226 = add nuw nsw i32 %211, 1
  br label %227

227:                                              ; preds = %217, %213, %210
  %228 = phi i32 [ %226, %217 ], [ %211, %213 ], [ %211, %210 ]
  %229 = phi i32 [ %225, %217 ], [ %212, %213 ], [ %212, %210 ]
  %230 = icmp sgt i32 %21, -1
  %231 = select i1 %195, i1 %230, i1 false
  br i1 %231, label %232, label %240

232:                                              ; preds = %227
  %233 = add i32 %13, %26
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %234
  %236 = load i8, i8 addrspace(1)* %235, align 1, !tbaa !7, !amdgpu.noclobber !5
  %237 = zext i8 %236 to i32
  %238 = add nuw nsw i32 %229, %237
  %239 = add nuw nsw i32 %228, 1
  br label %240

240:                                              ; preds = %232, %227
  %241 = phi i32 [ %239, %232 ], [ %228, %227 ]
  %242 = phi i32 [ %238, %232 ], [ %229, %227 ]
  br i1 %195, label %243, label %257

243:                                              ; preds = %240
  %244 = add nsw i32 %21, 1
  %245 = icmp sgt i32 %21, -2
  %246 = icmp slt i32 %244, %2
  %247 = select i1 %245, i1 %246, i1 false
  br i1 %247, label %248, label %257

248:                                              ; preds = %243
  %249 = mul nsw i32 %244, %3
  %250 = add i32 %13, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %251
  %253 = load i8, i8 addrspace(1)* %252, align 1, !tbaa !7, !amdgpu.noclobber !5
  %254 = zext i8 %253 to i32
  %255 = add nuw nsw i32 %242, %254
  %256 = add nuw nsw i32 %241, 1
  br label %257

257:                                              ; preds = %248, %243, %240
  %258 = phi i32 [ %256, %248 ], [ %241, %243 ], [ %241, %240 ]
  %259 = phi i32 [ %255, %248 ], [ %242, %243 ], [ %242, %240 ]
  br i1 %195, label %260, label %274

260:                                              ; preds = %257
  %261 = add nsw i32 %21, 2
  %262 = icmp sgt i32 %21, -3
  %263 = icmp slt i32 %261, %2
  %264 = select i1 %262, i1 %263, i1 false
  br i1 %264, label %265, label %274

265:                                              ; preds = %260
  %266 = mul nsw i32 %261, %3
  %267 = add i32 %13, %266
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %268
  %270 = load i8, i8 addrspace(1)* %269, align 1, !tbaa !7, !amdgpu.noclobber !5
  %271 = zext i8 %270 to i32
  %272 = add nuw nsw i32 %259, %271
  %273 = add nuw nsw i32 %258, 1
  br label %274

274:                                              ; preds = %265, %260, %257
  %275 = phi i32 [ %273, %265 ], [ %258, %260 ], [ %258, %257 ]
  %276 = phi i32 [ %272, %265 ], [ %259, %260 ], [ %259, %257 ]
  %277 = add i32 %13, 1
  %278 = icmp sgt i32 %277, -1
  %279 = icmp slt i32 %277, %3
  %280 = select i1 %278, i1 %279, i1 false
  br i1 %280, label %281, label %295

281:                                              ; preds = %274
  %282 = add nsw i32 %21, -2
  %283 = icmp sgt i32 %21, 1
  %284 = icmp slt i32 %282, %2
  %285 = select i1 %283, i1 %284, i1 false
  br i1 %285, label %286, label %295

286:                                              ; preds = %281
  %287 = mul nsw i32 %282, %3
  %288 = add i32 %277, %287
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %289
  %291 = load i8, i8 addrspace(1)* %290, align 1, !tbaa !7, !amdgpu.noclobber !5
  %292 = zext i8 %291 to i32
  %293 = add nuw nsw i32 %276, %292
  %294 = add nuw nsw i32 %275, 1
  br label %295

295:                                              ; preds = %286, %281, %274
  %296 = phi i32 [ %294, %286 ], [ %275, %281 ], [ %275, %274 ]
  %297 = phi i32 [ %293, %286 ], [ %276, %281 ], [ %276, %274 ]
  br i1 %280, label %298, label %312

298:                                              ; preds = %295
  %299 = icmp sgt i32 %21, 0
  %300 = icmp sle i32 %21, %2
  %301 = select i1 %299, i1 %300, i1 false
  br i1 %301, label %302, label %312

302:                                              ; preds = %298
  %303 = add nsw i32 %21, -1
  %304 = mul nsw i32 %303, %3
  %305 = add i32 %277, %304
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %306
  %308 = load i8, i8 addrspace(1)* %307, align 1, !tbaa !7, !amdgpu.noclobber !5
  %309 = zext i8 %308 to i32
  %310 = add nuw nsw i32 %297, %309
  %311 = add nuw nsw i32 %296, 1
  br label %312

312:                                              ; preds = %302, %298, %295
  %313 = phi i32 [ %311, %302 ], [ %296, %298 ], [ %296, %295 ]
  %314 = phi i32 [ %310, %302 ], [ %297, %298 ], [ %297, %295 ]
  %315 = icmp sgt i32 %21, -1
  %316 = select i1 %280, i1 %315, i1 false
  br i1 %316, label %317, label %325

317:                                              ; preds = %312
  %318 = add i32 %277, %26
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %319
  %321 = load i8, i8 addrspace(1)* %320, align 1, !tbaa !7, !amdgpu.noclobber !5
  %322 = zext i8 %321 to i32
  %323 = add nuw nsw i32 %314, %322
  %324 = add nuw nsw i32 %313, 1
  br label %325

325:                                              ; preds = %317, %312
  %326 = phi i32 [ %324, %317 ], [ %313, %312 ]
  %327 = phi i32 [ %323, %317 ], [ %314, %312 ]
  br i1 %280, label %328, label %342

328:                                              ; preds = %325
  %329 = add nsw i32 %21, 1
  %330 = icmp sgt i32 %21, -2
  %331 = icmp slt i32 %329, %2
  %332 = select i1 %330, i1 %331, i1 false
  br i1 %332, label %333, label %342

333:                                              ; preds = %328
  %334 = mul nsw i32 %329, %3
  %335 = add i32 %277, %334
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %336
  %338 = load i8, i8 addrspace(1)* %337, align 1, !tbaa !7, !amdgpu.noclobber !5
  %339 = zext i8 %338 to i32
  %340 = add nuw nsw i32 %327, %339
  %341 = add nuw nsw i32 %326, 1
  br label %342

342:                                              ; preds = %333, %328, %325
  %343 = phi i32 [ %341, %333 ], [ %326, %328 ], [ %326, %325 ]
  %344 = phi i32 [ %340, %333 ], [ %327, %328 ], [ %327, %325 ]
  br i1 %280, label %345, label %359

345:                                              ; preds = %342
  %346 = add nsw i32 %21, 2
  %347 = icmp sgt i32 %21, -3
  %348 = icmp slt i32 %346, %2
  %349 = select i1 %347, i1 %348, i1 false
  br i1 %349, label %350, label %359

350:                                              ; preds = %345
  %351 = mul nsw i32 %346, %3
  %352 = add i32 %277, %351
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %353
  %355 = load i8, i8 addrspace(1)* %354, align 1, !tbaa !7, !amdgpu.noclobber !5
  %356 = zext i8 %355 to i32
  %357 = add nuw nsw i32 %344, %356
  %358 = add nuw nsw i32 %343, 1
  br label %359

359:                                              ; preds = %350, %345, %342
  %360 = phi i32 [ %358, %350 ], [ %343, %345 ], [ %343, %342 ]
  %361 = phi i32 [ %357, %350 ], [ %344, %345 ], [ %344, %342 ]
  %362 = add i32 %13, 2
  %363 = icmp sgt i32 %362, -1
  %364 = icmp slt i32 %362, %3
  %365 = select i1 %363, i1 %364, i1 false
  br i1 %365, label %366, label %380

366:                                              ; preds = %359
  %367 = add nsw i32 %21, -2
  %368 = icmp sgt i32 %21, 1
  %369 = icmp slt i32 %367, %2
  %370 = select i1 %368, i1 %369, i1 false
  br i1 %370, label %371, label %380

371:                                              ; preds = %366
  %372 = mul nsw i32 %367, %3
  %373 = add i32 %362, %372
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %374
  %376 = load i8, i8 addrspace(1)* %375, align 1, !tbaa !7, !amdgpu.noclobber !5
  %377 = zext i8 %376 to i32
  %378 = add nuw nsw i32 %361, %377
  %379 = add nuw nsw i32 %360, 1
  br label %380

380:                                              ; preds = %371, %366, %359
  %381 = phi i32 [ %379, %371 ], [ %360, %366 ], [ %360, %359 ]
  %382 = phi i32 [ %378, %371 ], [ %361, %366 ], [ %361, %359 ]
  br i1 %365, label %383, label %397

383:                                              ; preds = %380
  %384 = icmp sgt i32 %21, 0
  %385 = icmp sle i32 %21, %2
  %386 = select i1 %384, i1 %385, i1 false
  br i1 %386, label %387, label %397

387:                                              ; preds = %383
  %388 = add nsw i32 %21, -1
  %389 = mul nsw i32 %388, %3
  %390 = add i32 %362, %389
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %391
  %393 = load i8, i8 addrspace(1)* %392, align 1, !tbaa !7, !amdgpu.noclobber !5
  %394 = zext i8 %393 to i32
  %395 = add nuw nsw i32 %382, %394
  %396 = add nuw nsw i32 %381, 1
  br label %397

397:                                              ; preds = %387, %383, %380
  %398 = phi i32 [ %396, %387 ], [ %381, %383 ], [ %381, %380 ]
  %399 = phi i32 [ %395, %387 ], [ %382, %383 ], [ %382, %380 ]
  %400 = icmp sgt i32 %21, -1
  %401 = select i1 %365, i1 %400, i1 false
  br i1 %401, label %402, label %410

402:                                              ; preds = %397
  %403 = add i32 %362, %26
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %404
  %406 = load i8, i8 addrspace(1)* %405, align 1, !tbaa !7, !amdgpu.noclobber !5
  %407 = zext i8 %406 to i32
  %408 = add nuw nsw i32 %399, %407
  %409 = add nuw nsw i32 %398, 1
  br label %410

410:                                              ; preds = %402, %397
  %411 = phi i32 [ %409, %402 ], [ %398, %397 ]
  %412 = phi i32 [ %408, %402 ], [ %399, %397 ]
  br i1 %365, label %413, label %427

413:                                              ; preds = %410
  %414 = add nsw i32 %21, 1
  %415 = icmp sgt i32 %21, -2
  %416 = icmp slt i32 %414, %2
  %417 = select i1 %415, i1 %416, i1 false
  br i1 %417, label %418, label %427

418:                                              ; preds = %413
  %419 = mul nsw i32 %414, %3
  %420 = add i32 %362, %419
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %421
  %423 = load i8, i8 addrspace(1)* %422, align 1, !tbaa !7, !amdgpu.noclobber !5
  %424 = zext i8 %423 to i32
  %425 = add nuw nsw i32 %412, %424
  %426 = add nuw nsw i32 %411, 1
  br label %427

427:                                              ; preds = %418, %413, %410
  %428 = phi i32 [ %426, %418 ], [ %411, %413 ], [ %411, %410 ]
  %429 = phi i32 [ %425, %418 ], [ %412, %413 ], [ %412, %410 ]
  br i1 %365, label %430, label %444

430:                                              ; preds = %427
  %431 = add nsw i32 %21, 2
  %432 = icmp sgt i32 %21, -3
  %433 = icmp slt i32 %431, %2
  %434 = select i1 %432, i1 %433, i1 false
  br i1 %434, label %435, label %444

435:                                              ; preds = %430
  %436 = mul nsw i32 %431, %3
  %437 = add i32 %362, %436
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %438
  %440 = load i8, i8 addrspace(1)* %439, align 1, !tbaa !7, !amdgpu.noclobber !5
  %441 = zext i8 %440 to i32
  %442 = add nuw nsw i32 %429, %441
  %443 = add nuw nsw i32 %428, 1
  br label %444

444:                                              ; preds = %435, %430, %427
  %445 = phi i32 [ %443, %435 ], [ %428, %430 ], [ %428, %427 ]
  %446 = phi i32 [ %442, %435 ], [ %429, %430 ], [ %429, %427 ]
  %447 = add nsw i32 %26, %13
  %448 = trunc i32 %446 to i16
  %449 = trunc i32 %445 to i16
  %450 = udiv i16 %448, %449
  %451 = trunc i16 %450 to i8
  %452 = sext i32 %447 to i64
  %453 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %452
  store i8 %451, i8 addrspace(1)* %453, align 1, !tbaa !7
  br label %454

454:                                              ; preds = %444, %4
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
