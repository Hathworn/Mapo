; ModuleID = '../data/hip_kernels/16079/26/main.cu'
source_filename = "../data/hip_kernels/16079/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22TgvMedianFilterKernel3PfS_iiiS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = mul nsw i32 %24, %4
  %26 = add nsw i32 %25, %16
  %27 = icmp slt i32 %16, %2
  %28 = icmp slt i32 %24, %3
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %585

30:                                               ; preds = %7
  %31 = add nsw i32 %2, -1
  %32 = add nsw i32 %3, -1
  %33 = mul nsw i32 %32, %4
  %34 = add nsw i32 %24, -1
  %35 = icmp slt i32 %24, 1
  %36 = mul nsw i32 %34, %4
  %37 = icmp sgt i32 %24, 0
  %38 = sext i32 %36 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %41 = add nsw i32 %31, %36
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %45 = icmp sgt i32 %34, %3
  %46 = add nsw i32 %16, -1
  %47 = icmp sgt i32 %16, 0
  %48 = xor i1 %47, true
  %49 = select i1 %48, i1 true, i1 %35
  br i1 %49, label %55, label %50

50:                                               ; preds = %30
  %51 = add nsw i32 %46, %36
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  br label %76

55:                                               ; preds = %30
  %56 = icmp slt i32 %16, 1
  %57 = select i1 %56, i1 %37, i1 false
  br i1 %57, label %76, label %58

58:                                               ; preds = %55
  %59 = icmp sgt i32 %46, %2
  %60 = select i1 %59, i1 %37, i1 false
  br i1 %60, label %76, label %61

61:                                               ; preds = %58
  br i1 %47, label %62, label %81

62:                                               ; preds = %61
  %63 = icmp sle i32 %16, %2
  %64 = select i1 %63, i1 %35, i1 false
  br i1 %64, label %65, label %69

65:                                               ; preds = %62
  %66 = zext i32 %46 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  br label %76

69:                                               ; preds = %62
  %70 = select i1 %63, i1 %45, i1 false
  br i1 %70, label %71, label %81

71:                                               ; preds = %69
  %72 = add nsw i32 %46, %33
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  br label %76

76:                                               ; preds = %58, %55, %50, %71, %65
  %77 = phi float addrspace(1)* [ %68, %65 ], [ %75, %71 ], [ %54, %50 ], [ %40, %55 ], [ %44, %58 ]
  %78 = phi float addrspace(1)* [ %67, %65 ], [ %74, %71 ], [ %53, %50 ], [ %39, %55 ], [ %43, %58 ]
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %76, %61, %69
  %82 = phi float [ 0.000000e+00, %69 ], [ 0.000000e+00, %61 ], [ %79, %76 ]
  %83 = phi float [ 0.000000e+00, %69 ], [ 0.000000e+00, %61 ], [ %80, %76 ]
  %84 = icmp sgt i32 %16, -1
  %85 = xor i1 %84, true
  %86 = icmp sge i32 %16, %2
  %87 = select i1 %85, i1 true, i1 %86
  %88 = select i1 %87, i1 true, i1 %35
  br i1 %88, label %94, label %89

89:                                               ; preds = %81
  %90 = add nsw i32 %16, %36
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  br label %115

94:                                               ; preds = %81
  %95 = icmp slt i32 %16, 0
  %96 = select i1 %95, i1 %37, i1 false
  br i1 %96, label %115, label %97

97:                                               ; preds = %94
  %98 = icmp sgt i32 %16, %2
  %99 = select i1 %98, i1 %37, i1 false
  br i1 %99, label %115, label %100

100:                                              ; preds = %97
  br i1 %84, label %101, label %120

101:                                              ; preds = %100
  %102 = icmp slt i32 %16, %2
  %103 = select i1 %102, i1 %35, i1 false
  br i1 %103, label %111, label %104

104:                                              ; preds = %101
  %105 = select i1 %102, i1 %45, i1 false
  br i1 %105, label %106, label %120

106:                                              ; preds = %104
  %107 = add nsw i32 %16, %33
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  br label %115

111:                                              ; preds = %101
  %112 = zext i32 %16 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  br label %115

115:                                              ; preds = %97, %94, %89, %106, %111
  %116 = phi float addrspace(1)* [ %114, %111 ], [ %110, %106 ], [ %93, %89 ], [ %40, %94 ], [ %44, %97 ]
  %117 = phi float addrspace(1)* [ %113, %111 ], [ %109, %106 ], [ %92, %89 ], [ %39, %94 ], [ %43, %97 ]
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  br label %120

120:                                              ; preds = %115, %104, %100
  %121 = phi float [ 0.000000e+00, %104 ], [ 0.000000e+00, %100 ], [ %118, %115 ]
  %122 = phi float [ 0.000000e+00, %104 ], [ 0.000000e+00, %100 ], [ %119, %115 ]
  %123 = add nsw i32 %16, 2
  %124 = add nsw i32 %16, 1
  %125 = icmp sgt i32 %16, -2
  %126 = xor i1 %125, true
  %127 = icmp sgt i32 %123, %2
  %128 = select i1 %126, i1 true, i1 %127
  %129 = select i1 %128, i1 true, i1 %35
  br i1 %129, label %135, label %130

130:                                              ; preds = %120
  %131 = add nsw i32 %124, %36
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  br label %156

135:                                              ; preds = %120
  %136 = icmp slt i32 %16, -1
  %137 = select i1 %136, i1 %37, i1 false
  br i1 %137, label %156, label %138

138:                                              ; preds = %135
  %139 = icmp sge i32 %16, %2
  %140 = select i1 %139, i1 %37, i1 false
  br i1 %140, label %156, label %141

141:                                              ; preds = %138
  br i1 %125, label %142, label %161

142:                                              ; preds = %141
  %143 = icmp sle i32 %123, %2
  %144 = select i1 %143, i1 %35, i1 false
  br i1 %144, label %152, label %145

145:                                              ; preds = %142
  %146 = select i1 %143, i1 %45, i1 false
  br i1 %146, label %147, label %161

147:                                              ; preds = %145
  %148 = add nsw i32 %124, %33
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  br label %156

152:                                              ; preds = %142
  %153 = zext i32 %124 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  br label %156

156:                                              ; preds = %138, %135, %130, %147, %152
  %157 = phi float addrspace(1)* [ %155, %152 ], [ %151, %147 ], [ %134, %130 ], [ %40, %135 ], [ %44, %138 ]
  %158 = phi float addrspace(1)* [ %154, %152 ], [ %150, %147 ], [ %133, %130 ], [ %39, %135 ], [ %43, %138 ]
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  br label %161

161:                                              ; preds = %156, %145, %141
  %162 = phi float [ 0.000000e+00, %145 ], [ 0.000000e+00, %141 ], [ %159, %156 ]
  %163 = phi float [ 0.000000e+00, %145 ], [ 0.000000e+00, %141 ], [ %160, %156 ]
  %164 = icmp slt i32 %24, 0
  %165 = icmp sge i32 %24, %3
  %166 = icmp sgt i32 %24, -1
  %167 = sext i32 %25 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %170 = add nsw i32 %31, %25
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  br i1 %47, label %174, label %183

174:                                              ; preds = %161
  %175 = icmp sgt i32 %16, %2
  %176 = select i1 %175, i1 true, i1 %164
  %177 = select i1 %176, i1 true, i1 %165
  br i1 %177, label %183, label %178

178:                                              ; preds = %174
  %179 = add nsw i32 %46, %25
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %180
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %180
  br label %201

183:                                              ; preds = %174, %161
  %184 = icmp slt i32 %16, 1
  %185 = select i1 %184, i1 %166, i1 false
  %186 = xor i1 %185, true
  %187 = select i1 %186, i1 true, i1 %165
  br i1 %187, label %188, label %201

188:                                              ; preds = %183
  %189 = icmp sgt i32 %46, %2
  %190 = select i1 %189, i1 %166, i1 false
  %191 = xor i1 %190, true
  %192 = select i1 %191, i1 true, i1 %165
  br i1 %192, label %193, label %201

193:                                              ; preds = %188
  %194 = icmp sle i32 %16, %2
  %195 = select i1 %47, i1 %194, i1 false
  %196 = select i1 %195, i1 %164, i1 false
  br i1 %196, label %197, label %206

197:                                              ; preds = %193
  %198 = zext i32 %46 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = getelementptr inbounds float, float addrspace(1)* %1, i64 %198
  br label %201

201:                                              ; preds = %188, %183, %178, %197
  %202 = phi float addrspace(1)* [ %200, %197 ], [ %182, %178 ], [ %169, %183 ], [ %173, %188 ]
  %203 = phi float addrspace(1)* [ %199, %197 ], [ %181, %178 ], [ %168, %183 ], [ %172, %188 ]
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7
  %205 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  br label %206

206:                                              ; preds = %201, %193
  %207 = phi float [ 0.000000e+00, %193 ], [ %204, %201 ]
  %208 = phi float [ 0.000000e+00, %193 ], [ %205, %201 ]
  br i1 %84, label %209, label %217

209:                                              ; preds = %206
  %210 = icmp sge i32 %16, %2
  %211 = select i1 %210, i1 true, i1 %164
  %212 = select i1 %211, i1 true, i1 %165
  br i1 %212, label %217, label %213

213:                                              ; preds = %209
  %214 = sext i32 %26 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %214
  %216 = getelementptr inbounds float, float addrspace(1)* %1, i64 %214
  br label %235

217:                                              ; preds = %209, %206
  %218 = icmp slt i32 %16, 0
  %219 = select i1 %218, i1 %166, i1 false
  %220 = xor i1 %219, true
  %221 = select i1 %220, i1 true, i1 %165
  br i1 %221, label %222, label %235

222:                                              ; preds = %217
  %223 = icmp sgt i32 %16, %2
  %224 = select i1 %223, i1 %166, i1 false
  %225 = xor i1 %224, true
  %226 = select i1 %225, i1 true, i1 %165
  br i1 %226, label %227, label %235

227:                                              ; preds = %222
  %228 = icmp slt i32 %16, %2
  %229 = select i1 %84, i1 %228, i1 false
  %230 = select i1 %229, i1 %164, i1 false
  br i1 %230, label %231, label %240

231:                                              ; preds = %227
  %232 = zext i32 %16 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %0, i64 %232
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %232
  br label %235

235:                                              ; preds = %222, %217, %213, %231
  %236 = phi float addrspace(1)* [ %234, %231 ], [ %216, %213 ], [ %169, %217 ], [ %173, %222 ]
  %237 = phi float addrspace(1)* [ %233, %231 ], [ %215, %213 ], [ %168, %217 ], [ %172, %222 ]
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = load float, float addrspace(1)* %236, align 4, !tbaa !7
  br label %240

240:                                              ; preds = %235, %227
  %241 = phi float [ 0.000000e+00, %227 ], [ %238, %235 ]
  %242 = phi float [ 0.000000e+00, %227 ], [ %239, %235 ]
  br i1 %125, label %243, label %252

243:                                              ; preds = %240
  %244 = icmp sgt i32 %123, %2
  %245 = select i1 %244, i1 true, i1 %164
  %246 = select i1 %245, i1 true, i1 %165
  br i1 %246, label %252, label %247

247:                                              ; preds = %243
  %248 = add nsw i32 %124, %25
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %0, i64 %249
  %251 = getelementptr inbounds float, float addrspace(1)* %1, i64 %249
  br label %270

252:                                              ; preds = %243, %240
  %253 = icmp slt i32 %16, -1
  %254 = select i1 %253, i1 %166, i1 false
  %255 = xor i1 %254, true
  %256 = select i1 %255, i1 true, i1 %165
  br i1 %256, label %257, label %270

257:                                              ; preds = %252
  %258 = icmp sge i32 %16, %2
  %259 = select i1 %258, i1 %166, i1 false
  %260 = xor i1 %259, true
  %261 = select i1 %260, i1 true, i1 %165
  br i1 %261, label %262, label %270

262:                                              ; preds = %257
  %263 = icmp sle i32 %123, %2
  %264 = select i1 %125, i1 %263, i1 false
  %265 = select i1 %264, i1 %164, i1 false
  br i1 %265, label %266, label %275

266:                                              ; preds = %262
  %267 = zext i32 %124 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %0, i64 %267
  %269 = getelementptr inbounds float, float addrspace(1)* %1, i64 %267
  br label %270

270:                                              ; preds = %257, %252, %247, %266
  %271 = phi float addrspace(1)* [ %269, %266 ], [ %251, %247 ], [ %169, %252 ], [ %173, %257 ]
  %272 = phi float addrspace(1)* [ %268, %266 ], [ %250, %247 ], [ %168, %252 ], [ %172, %257 ]
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !7
  %274 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  br label %275

275:                                              ; preds = %270, %262
  %276 = phi float [ 0.000000e+00, %262 ], [ %273, %270 ]
  %277 = phi float [ 0.000000e+00, %262 ], [ %274, %270 ]
  %278 = add nsw i32 %24, 2
  %279 = add nsw i32 %24, 1
  %280 = icmp slt i32 %24, -1
  %281 = icmp sgt i32 %278, %3
  %282 = mul nsw i32 %279, %4
  %283 = icmp sgt i32 %24, -2
  %284 = sext i32 %282 to i64
  %285 = getelementptr inbounds float, float addrspace(1)* %0, i64 %284
  %286 = getelementptr inbounds float, float addrspace(1)* %1, i64 %284
  %287 = add nsw i32 %31, %282
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %0, i64 %288
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %288
  %291 = icmp sge i32 %24, %3
  br i1 %47, label %292, label %301

292:                                              ; preds = %275
  %293 = icmp sgt i32 %16, %2
  %294 = select i1 %293, i1 true, i1 %280
  %295 = select i1 %294, i1 true, i1 %281
  br i1 %295, label %301, label %296

296:                                              ; preds = %292
  %297 = add nsw i32 %46, %282
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %0, i64 %298
  %300 = getelementptr inbounds float, float addrspace(1)* %1, i64 %298
  br label %326

301:                                              ; preds = %292, %275
  %302 = icmp slt i32 %16, 1
  %303 = select i1 %302, i1 %283, i1 false
  %304 = xor i1 %303, true
  %305 = select i1 %304, i1 true, i1 %281
  br i1 %305, label %306, label %326

306:                                              ; preds = %301
  %307 = icmp sgt i32 %46, %2
  %308 = select i1 %307, i1 %283, i1 false
  %309 = xor i1 %308, true
  %310 = select i1 %309, i1 true, i1 %281
  br i1 %310, label %311, label %326

311:                                              ; preds = %306
  br i1 %47, label %312, label %331

312:                                              ; preds = %311
  %313 = icmp sle i32 %16, %2
  %314 = select i1 %313, i1 %280, i1 false
  br i1 %314, label %322, label %315

315:                                              ; preds = %312
  %316 = select i1 %313, i1 %291, i1 false
  br i1 %316, label %317, label %331

317:                                              ; preds = %315
  %318 = add nsw i32 %46, %33
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %0, i64 %319
  %321 = getelementptr inbounds float, float addrspace(1)* %1, i64 %319
  br label %326

322:                                              ; preds = %312
  %323 = zext i32 %46 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  %325 = getelementptr inbounds float, float addrspace(1)* %1, i64 %323
  br label %326

326:                                              ; preds = %306, %301, %296, %317, %322
  %327 = phi float addrspace(1)* [ %325, %322 ], [ %321, %317 ], [ %300, %296 ], [ %286, %301 ], [ %290, %306 ]
  %328 = phi float addrspace(1)* [ %324, %322 ], [ %320, %317 ], [ %299, %296 ], [ %285, %301 ], [ %289, %306 ]
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7
  %330 = load float, float addrspace(1)* %327, align 4, !tbaa !7
  br label %331

331:                                              ; preds = %326, %315, %311
  %332 = phi float [ 0.000000e+00, %315 ], [ 0.000000e+00, %311 ], [ %329, %326 ]
  %333 = phi float [ 0.000000e+00, %315 ], [ 0.000000e+00, %311 ], [ %330, %326 ]
  br i1 %84, label %334, label %343

334:                                              ; preds = %331
  %335 = icmp sge i32 %16, %2
  %336 = select i1 %335, i1 true, i1 %280
  %337 = select i1 %336, i1 true, i1 %281
  br i1 %337, label %343, label %338

338:                                              ; preds = %334
  %339 = add nsw i32 %16, %282
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(1)* %0, i64 %340
  %342 = getelementptr inbounds float, float addrspace(1)* %1, i64 %340
  br label %368

343:                                              ; preds = %334, %331
  %344 = icmp slt i32 %16, 0
  %345 = select i1 %344, i1 %283, i1 false
  %346 = xor i1 %345, true
  %347 = select i1 %346, i1 true, i1 %281
  br i1 %347, label %348, label %368

348:                                              ; preds = %343
  %349 = icmp sgt i32 %16, %2
  %350 = select i1 %349, i1 %283, i1 false
  %351 = xor i1 %350, true
  %352 = select i1 %351, i1 true, i1 %281
  br i1 %352, label %353, label %368

353:                                              ; preds = %348
  br i1 %84, label %354, label %373

354:                                              ; preds = %353
  %355 = icmp slt i32 %16, %2
  %356 = select i1 %355, i1 %280, i1 false
  br i1 %356, label %364, label %357

357:                                              ; preds = %354
  %358 = select i1 %355, i1 %291, i1 false
  br i1 %358, label %359, label %373

359:                                              ; preds = %357
  %360 = add nsw i32 %16, %33
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %0, i64 %361
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %361
  br label %368

364:                                              ; preds = %354
  %365 = zext i32 %16 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  %367 = getelementptr inbounds float, float addrspace(1)* %1, i64 %365
  br label %368

368:                                              ; preds = %348, %343, %338, %359, %364
  %369 = phi float addrspace(1)* [ %367, %364 ], [ %363, %359 ], [ %342, %338 ], [ %286, %343 ], [ %290, %348 ]
  %370 = phi float addrspace(1)* [ %366, %364 ], [ %362, %359 ], [ %341, %338 ], [ %285, %343 ], [ %289, %348 ]
  %371 = load float, float addrspace(1)* %370, align 4, !tbaa !7
  %372 = load float, float addrspace(1)* %369, align 4, !tbaa !7
  br label %373

373:                                              ; preds = %368, %357, %353
  %374 = phi float [ 0.000000e+00, %357 ], [ 0.000000e+00, %353 ], [ %371, %368 ]
  %375 = phi float [ 0.000000e+00, %357 ], [ 0.000000e+00, %353 ], [ %372, %368 ]
  br i1 %125, label %376, label %385

376:                                              ; preds = %373
  %377 = icmp sgt i32 %123, %2
  %378 = select i1 %377, i1 true, i1 %280
  %379 = select i1 %378, i1 true, i1 %281
  br i1 %379, label %385, label %380

380:                                              ; preds = %376
  %381 = add nsw i32 %124, %282
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds float, float addrspace(1)* %0, i64 %382
  %384 = getelementptr inbounds float, float addrspace(1)* %1, i64 %382
  br label %410

385:                                              ; preds = %376, %373
  %386 = icmp slt i32 %16, -1
  %387 = select i1 %386, i1 %283, i1 false
  %388 = xor i1 %387, true
  %389 = select i1 %388, i1 true, i1 %281
  br i1 %389, label %390, label %410

390:                                              ; preds = %385
  %391 = icmp sge i32 %16, %2
  %392 = select i1 %391, i1 %283, i1 false
  %393 = xor i1 %392, true
  %394 = select i1 %393, i1 true, i1 %281
  br i1 %394, label %395, label %410

395:                                              ; preds = %390
  br i1 %125, label %396, label %415

396:                                              ; preds = %395
  %397 = icmp sle i32 %123, %2
  %398 = select i1 %397, i1 %280, i1 false
  br i1 %398, label %406, label %399

399:                                              ; preds = %396
  %400 = select i1 %397, i1 %291, i1 false
  br i1 %400, label %401, label %415

401:                                              ; preds = %399
  %402 = add nsw i32 %124, %33
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds float, float addrspace(1)* %0, i64 %403
  %405 = getelementptr inbounds float, float addrspace(1)* %1, i64 %403
  br label %410

406:                                              ; preds = %396
  %407 = zext i32 %124 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %0, i64 %407
  %409 = getelementptr inbounds float, float addrspace(1)* %1, i64 %407
  br label %410

410:                                              ; preds = %390, %385, %380, %401, %406
  %411 = phi float addrspace(1)* [ %409, %406 ], [ %405, %401 ], [ %384, %380 ], [ %286, %385 ], [ %290, %390 ]
  %412 = phi float addrspace(1)* [ %408, %406 ], [ %404, %401 ], [ %383, %380 ], [ %285, %385 ], [ %289, %390 ]
  %413 = load float, float addrspace(1)* %412, align 4, !tbaa !7
  %414 = load float, float addrspace(1)* %411, align 4, !tbaa !7
  br label %415

415:                                              ; preds = %410, %399, %395
  %416 = phi float [ 0.000000e+00, %399 ], [ 0.000000e+00, %395 ], [ %413, %410 ]
  %417 = phi float [ 0.000000e+00, %399 ], [ 0.000000e+00, %395 ], [ %414, %410 ]
  %418 = fcmp contract ogt float %82, %121
  %419 = select i1 %418, float %121, float %82
  %420 = select i1 %418, float %82, float %121
  %421 = fcmp contract ogt float %83, %122
  %422 = select i1 %421, float %122, float %83
  %423 = select i1 %421, float %83, float %122
  %424 = fcmp contract ogt float %419, %162
  %425 = select i1 %424, float %162, float %419
  %426 = select i1 %424, float %419, float %162
  %427 = fcmp contract ogt float %422, %163
  %428 = select i1 %427, float %163, float %422
  %429 = select i1 %427, float %422, float %163
  %430 = fcmp contract ogt float %425, %207
  %431 = select i1 %430, float %207, float %425
  %432 = select i1 %430, float %425, float %207
  %433 = fcmp contract ogt float %428, %208
  %434 = select i1 %433, float %208, float %428
  %435 = select i1 %433, float %428, float %208
  %436 = fcmp contract ogt float %431, %241
  %437 = select i1 %436, float %241, float %431
  %438 = select i1 %436, float %431, float %241
  %439 = fcmp contract ogt float %434, %242
  %440 = select i1 %439, float %242, float %434
  %441 = select i1 %439, float %434, float %242
  %442 = fcmp contract ogt float %437, %276
  %443 = select i1 %442, float %276, float %437
  %444 = select i1 %442, float %437, float %276
  %445 = fcmp contract ogt float %440, %277
  %446 = select i1 %445, float %277, float %440
  %447 = select i1 %445, float %440, float %277
  %448 = fcmp contract ogt float %443, %332
  %449 = select i1 %448, float %332, float %443
  %450 = select i1 %448, float %443, float %332
  %451 = fcmp contract ogt float %446, %333
  %452 = select i1 %451, float %333, float %446
  %453 = select i1 %451, float %446, float %333
  %454 = fcmp contract ogt float %449, %374
  %455 = select i1 %454, float %374, float %449
  %456 = select i1 %454, float %449, float %374
  %457 = fcmp contract ogt float %452, %375
  %458 = select i1 %457, float %375, float %452
  %459 = select i1 %457, float %452, float %375
  %460 = fcmp contract ogt float %455, %416
  %461 = select i1 %460, float %455, float %416
  %462 = fcmp contract ogt float %458, %417
  %463 = select i1 %462, float %458, float %417
  %464 = fcmp contract ogt float %420, %426
  %465 = select i1 %464, float %426, float %420
  %466 = select i1 %464, float %420, float %426
  %467 = fcmp contract ogt float %423, %429
  %468 = select i1 %467, float %429, float %423
  %469 = select i1 %467, float %423, float %429
  %470 = fcmp contract ogt float %465, %432
  %471 = select i1 %470, float %432, float %465
  %472 = select i1 %470, float %465, float %432
  %473 = fcmp contract ogt float %468, %435
  %474 = select i1 %473, float %435, float %468
  %475 = select i1 %473, float %468, float %435
  %476 = fcmp contract ogt float %471, %438
  %477 = select i1 %476, float %438, float %471
  %478 = select i1 %476, float %471, float %438
  %479 = fcmp contract ogt float %474, %441
  %480 = select i1 %479, float %441, float %474
  %481 = select i1 %479, float %474, float %441
  %482 = fcmp contract ogt float %477, %444
  %483 = select i1 %482, float %444, float %477
  %484 = select i1 %482, float %477, float %444
  %485 = fcmp contract ogt float %480, %447
  %486 = select i1 %485, float %447, float %480
  %487 = select i1 %485, float %480, float %447
  %488 = fcmp contract ogt float %483, %450
  %489 = select i1 %488, float %450, float %483
  %490 = select i1 %488, float %483, float %450
  %491 = fcmp contract ogt float %486, %453
  %492 = select i1 %491, float %453, float %486
  %493 = select i1 %491, float %486, float %453
  %494 = fcmp contract ogt float %489, %456
  %495 = select i1 %494, float %456, float %489
  %496 = select i1 %494, float %489, float %456
  %497 = fcmp contract ogt float %492, %459
  %498 = select i1 %497, float %459, float %492
  %499 = select i1 %497, float %492, float %459
  %500 = fcmp contract ogt float %495, %461
  %501 = select i1 %500, float %495, float %461
  %502 = fcmp contract ogt float %498, %463
  %503 = select i1 %502, float %498, float %463
  %504 = fcmp contract ogt float %466, %472
  %505 = select i1 %504, float %472, float %466
  %506 = select i1 %504, float %466, float %472
  %507 = fcmp contract ogt float %469, %475
  %508 = select i1 %507, float %475, float %469
  %509 = select i1 %507, float %469, float %475
  %510 = fcmp contract ogt float %505, %478
  %511 = select i1 %510, float %478, float %505
  %512 = select i1 %510, float %505, float %478
  %513 = fcmp contract ogt float %508, %481
  %514 = select i1 %513, float %481, float %508
  %515 = select i1 %513, float %508, float %481
  %516 = fcmp contract ogt float %511, %484
  %517 = select i1 %516, float %484, float %511
  %518 = select i1 %516, float %511, float %484
  %519 = fcmp contract ogt float %514, %487
  %520 = select i1 %519, float %487, float %514
  %521 = select i1 %519, float %514, float %487
  %522 = fcmp contract ogt float %517, %490
  %523 = select i1 %522, float %490, float %517
  %524 = select i1 %522, float %517, float %490
  %525 = fcmp contract ogt float %520, %493
  %526 = select i1 %525, float %493, float %520
  %527 = select i1 %525, float %520, float %493
  %528 = fcmp contract ogt float %523, %496
  %529 = select i1 %528, float %496, float %523
  %530 = select i1 %528, float %523, float %496
  %531 = fcmp contract ogt float %526, %499
  %532 = select i1 %531, float %499, float %526
  %533 = select i1 %531, float %526, float %499
  %534 = fcmp contract ogt float %529, %501
  %535 = select i1 %534, float %529, float %501
  %536 = fcmp contract ogt float %532, %503
  %537 = select i1 %536, float %532, float %503
  %538 = fcmp contract ogt float %506, %512
  %539 = select i1 %538, float %512, float %506
  %540 = select i1 %538, float %506, float %512
  %541 = fcmp contract ogt float %509, %515
  %542 = select i1 %541, float %515, float %509
  %543 = select i1 %541, float %509, float %515
  %544 = fcmp contract ogt float %539, %518
  %545 = select i1 %544, float %518, float %539
  %546 = select i1 %544, float %539, float %518
  %547 = fcmp contract ogt float %542, %521
  %548 = select i1 %547, float %521, float %542
  %549 = select i1 %547, float %542, float %521
  %550 = fcmp contract ogt float %545, %524
  %551 = select i1 %550, float %524, float %545
  %552 = select i1 %550, float %545, float %524
  %553 = fcmp contract ogt float %548, %527
  %554 = select i1 %553, float %527, float %548
  %555 = select i1 %553, float %548, float %527
  %556 = fcmp contract ogt float %551, %530
  %557 = select i1 %556, float %530, float %551
  %558 = select i1 %556, float %551, float %530
  %559 = fcmp contract ogt float %554, %533
  %560 = select i1 %559, float %533, float %554
  %561 = select i1 %559, float %554, float %533
  %562 = fcmp contract ogt float %557, %535
  %563 = select i1 %562, float %557, float %535
  %564 = fcmp contract ogt float %560, %537
  %565 = select i1 %564, float %560, float %537
  %566 = fcmp contract ogt float %540, %546
  %567 = select i1 %566, float %546, float %540
  %568 = fcmp contract ogt float %543, %549
  %569 = select i1 %568, float %549, float %543
  %570 = fcmp contract ogt float %567, %552
  %571 = select i1 %570, float %552, float %567
  %572 = fcmp contract ogt float %569, %555
  %573 = select i1 %572, float %555, float %569
  %574 = fcmp contract ogt float %571, %558
  %575 = select i1 %574, float %558, float %571
  %576 = fcmp contract ogt float %573, %561
  %577 = select i1 %576, float %561, float %573
  %578 = fcmp contract ogt float %575, %563
  %579 = select i1 %578, float %563, float %575
  %580 = fcmp contract ogt float %577, %565
  %581 = select i1 %580, float %565, float %577
  %582 = sext i32 %26 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %5, i64 %582
  store float %579, float addrspace(1)* %583, align 4, !tbaa !7
  %584 = getelementptr inbounds float, float addrspace(1)* %6, i64 %582
  store float %581, float addrspace(1)* %584, align 4, !tbaa !7
  br label %585

585:                                              ; preds = %7, %415
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
