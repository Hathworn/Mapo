; ModuleID = '../data/hip_kernels/2107/11/main.cu'
source_filename = "../data/hip_kernels/2107/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30SolveSmoothMedianGlobalKernel3PfS_S_S_iiiS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = mul nsw i32 %28, %6
  %30 = add nsw i32 %29, %20
  %31 = icmp slt i32 %20, %4
  %32 = icmp slt i32 %28, %5
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %603

34:                                               ; preds = %11
  %35 = add nsw i32 %4, -1
  %36 = add nsw i32 %5, -1
  %37 = mul nsw i32 %36, %6
  %38 = add nsw i32 %28, -1
  %39 = icmp slt i32 %28, 1
  %40 = mul nsw i32 %38, %6
  %41 = icmp sgt i32 %28, 0
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %45 = add nsw i32 %35, %40
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %49 = icmp sgt i32 %38, %5
  %50 = add nsw i32 %20, -1
  %51 = icmp sgt i32 %20, 0
  %52 = xor i1 %51, true
  %53 = select i1 %52, i1 true, i1 %39
  br i1 %53, label %59, label %54

54:                                               ; preds = %34
  %55 = add nsw i32 %50, %40
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  br label %80

59:                                               ; preds = %34
  %60 = icmp slt i32 %20, 1
  %61 = select i1 %60, i1 %41, i1 false
  br i1 %61, label %80, label %62

62:                                               ; preds = %59
  %63 = icmp sgt i32 %50, %4
  %64 = select i1 %63, i1 %41, i1 false
  br i1 %64, label %80, label %65

65:                                               ; preds = %62
  br i1 %51, label %66, label %85

66:                                               ; preds = %65
  %67 = icmp sle i32 %20, %4
  %68 = select i1 %67, i1 %39, i1 false
  br i1 %68, label %69, label %73

69:                                               ; preds = %66
  %70 = zext i32 %50 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  br label %80

73:                                               ; preds = %66
  %74 = select i1 %67, i1 %49, i1 false
  br i1 %74, label %75, label %85

75:                                               ; preds = %73
  %76 = add nsw i32 %50, %37
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  br label %80

80:                                               ; preds = %62, %59, %54, %75, %69
  %81 = phi float addrspace(1)* [ %72, %69 ], [ %79, %75 ], [ %58, %54 ], [ %44, %59 ], [ %48, %62 ]
  %82 = phi float addrspace(1)* [ %71, %69 ], [ %78, %75 ], [ %57, %54 ], [ %43, %59 ], [ %47, %62 ]
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %80, %65, %73
  %86 = phi float [ 0.000000e+00, %73 ], [ 0.000000e+00, %65 ], [ %83, %80 ]
  %87 = phi float [ 0.000000e+00, %73 ], [ 0.000000e+00, %65 ], [ %84, %80 ]
  %88 = icmp sgt i32 %20, -1
  %89 = xor i1 %88, true
  %90 = icmp sge i32 %20, %4
  %91 = select i1 %89, i1 true, i1 %90
  %92 = select i1 %91, i1 true, i1 %39
  br i1 %92, label %98, label %93

93:                                               ; preds = %85
  %94 = add nsw i32 %20, %40
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  br label %119

98:                                               ; preds = %85
  %99 = icmp slt i32 %20, 0
  %100 = select i1 %99, i1 %41, i1 false
  br i1 %100, label %119, label %101

101:                                              ; preds = %98
  %102 = icmp sgt i32 %20, %4
  %103 = select i1 %102, i1 %41, i1 false
  br i1 %103, label %119, label %104

104:                                              ; preds = %101
  br i1 %88, label %105, label %124

105:                                              ; preds = %104
  %106 = icmp slt i32 %20, %4
  %107 = select i1 %106, i1 %39, i1 false
  br i1 %107, label %115, label %108

108:                                              ; preds = %105
  %109 = select i1 %106, i1 %49, i1 false
  br i1 %109, label %110, label %124

110:                                              ; preds = %108
  %111 = add nsw i32 %20, %37
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  br label %119

115:                                              ; preds = %105
  %116 = zext i32 %20 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  br label %119

119:                                              ; preds = %101, %98, %93, %110, %115
  %120 = phi float addrspace(1)* [ %118, %115 ], [ %114, %110 ], [ %97, %93 ], [ %44, %98 ], [ %48, %101 ]
  %121 = phi float addrspace(1)* [ %117, %115 ], [ %113, %110 ], [ %96, %93 ], [ %43, %98 ], [ %47, %101 ]
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %119, %108, %104
  %125 = phi float [ 0.000000e+00, %108 ], [ 0.000000e+00, %104 ], [ %122, %119 ]
  %126 = phi float [ 0.000000e+00, %108 ], [ 0.000000e+00, %104 ], [ %123, %119 ]
  %127 = add nsw i32 %20, 2
  %128 = add nsw i32 %20, 1
  %129 = icmp sgt i32 %20, -2
  %130 = xor i1 %129, true
  %131 = icmp sgt i32 %127, %4
  %132 = select i1 %130, i1 true, i1 %131
  %133 = select i1 %132, i1 true, i1 %39
  br i1 %133, label %139, label %134

134:                                              ; preds = %124
  %135 = add nsw i32 %128, %40
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  br label %160

139:                                              ; preds = %124
  %140 = icmp slt i32 %20, -1
  %141 = select i1 %140, i1 %41, i1 false
  br i1 %141, label %160, label %142

142:                                              ; preds = %139
  %143 = icmp sge i32 %20, %4
  %144 = select i1 %143, i1 %41, i1 false
  br i1 %144, label %160, label %145

145:                                              ; preds = %142
  br i1 %129, label %146, label %165

146:                                              ; preds = %145
  %147 = icmp sle i32 %127, %4
  %148 = select i1 %147, i1 %39, i1 false
  br i1 %148, label %156, label %149

149:                                              ; preds = %146
  %150 = select i1 %147, i1 %49, i1 false
  br i1 %150, label %151, label %165

151:                                              ; preds = %149
  %152 = add nsw i32 %128, %37
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  br label %160

156:                                              ; preds = %146
  %157 = zext i32 %128 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  br label %160

160:                                              ; preds = %142, %139, %134, %151, %156
  %161 = phi float addrspace(1)* [ %159, %156 ], [ %155, %151 ], [ %138, %134 ], [ %44, %139 ], [ %48, %142 ]
  %162 = phi float addrspace(1)* [ %158, %156 ], [ %154, %151 ], [ %137, %134 ], [ %43, %139 ], [ %47, %142 ]
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  br label %165

165:                                              ; preds = %160, %149, %145
  %166 = phi float [ 0.000000e+00, %149 ], [ 0.000000e+00, %145 ], [ %163, %160 ]
  %167 = phi float [ 0.000000e+00, %149 ], [ 0.000000e+00, %145 ], [ %164, %160 ]
  %168 = icmp slt i32 %28, 0
  %169 = icmp sge i32 %28, %5
  %170 = icmp sgt i32 %28, -1
  %171 = sext i32 %29 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %174 = add nsw i32 %35, %29
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = getelementptr inbounds float, float addrspace(1)* %1, i64 %175
  br i1 %51, label %178, label %187

178:                                              ; preds = %165
  %179 = icmp sgt i32 %20, %4
  %180 = select i1 %179, i1 true, i1 %168
  %181 = select i1 %180, i1 true, i1 %169
  br i1 %181, label %187, label %182

182:                                              ; preds = %178
  %183 = add nsw i32 %50, %29
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  br label %205

187:                                              ; preds = %178, %165
  %188 = icmp slt i32 %20, 1
  %189 = select i1 %188, i1 %170, i1 false
  %190 = xor i1 %189, true
  %191 = select i1 %190, i1 true, i1 %169
  br i1 %191, label %192, label %205

192:                                              ; preds = %187
  %193 = icmp sgt i32 %50, %4
  %194 = select i1 %193, i1 %170, i1 false
  %195 = xor i1 %194, true
  %196 = select i1 %195, i1 true, i1 %169
  br i1 %196, label %197, label %205

197:                                              ; preds = %192
  %198 = icmp sle i32 %20, %4
  %199 = select i1 %51, i1 %198, i1 false
  %200 = select i1 %199, i1 %168, i1 false
  br i1 %200, label %201, label %210

201:                                              ; preds = %197
  %202 = zext i32 %50 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %0, i64 %202
  %204 = getelementptr inbounds float, float addrspace(1)* %1, i64 %202
  br label %205

205:                                              ; preds = %192, %187, %182, %201
  %206 = phi float addrspace(1)* [ %204, %201 ], [ %186, %182 ], [ %173, %187 ], [ %177, %192 ]
  %207 = phi float addrspace(1)* [ %203, %201 ], [ %185, %182 ], [ %172, %187 ], [ %176, %192 ]
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  %209 = load float, float addrspace(1)* %206, align 4, !tbaa !7
  br label %210

210:                                              ; preds = %205, %197
  %211 = phi float [ 0.000000e+00, %197 ], [ %208, %205 ]
  %212 = phi float [ 0.000000e+00, %197 ], [ %209, %205 ]
  br i1 %88, label %213, label %221

213:                                              ; preds = %210
  %214 = icmp sge i32 %20, %4
  %215 = select i1 %214, i1 true, i1 %168
  %216 = select i1 %215, i1 true, i1 %169
  br i1 %216, label %221, label %217

217:                                              ; preds = %213
  %218 = sext i32 %30 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %218
  br label %239

221:                                              ; preds = %213, %210
  %222 = icmp slt i32 %20, 0
  %223 = select i1 %222, i1 %170, i1 false
  %224 = xor i1 %223, true
  %225 = select i1 %224, i1 true, i1 %169
  br i1 %225, label %226, label %239

226:                                              ; preds = %221
  %227 = icmp sgt i32 %20, %4
  %228 = select i1 %227, i1 %170, i1 false
  %229 = xor i1 %228, true
  %230 = select i1 %229, i1 true, i1 %169
  br i1 %230, label %231, label %239

231:                                              ; preds = %226
  %232 = icmp slt i32 %20, %4
  %233 = select i1 %88, i1 %232, i1 false
  %234 = select i1 %233, i1 %168, i1 false
  br i1 %234, label %235, label %244

235:                                              ; preds = %231
  %236 = zext i32 %20 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %0, i64 %236
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %236
  br label %239

239:                                              ; preds = %226, %221, %217, %235
  %240 = phi float addrspace(1)* [ %238, %235 ], [ %220, %217 ], [ %173, %221 ], [ %177, %226 ]
  %241 = phi float addrspace(1)* [ %237, %235 ], [ %219, %217 ], [ %172, %221 ], [ %176, %226 ]
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !7
  %243 = load float, float addrspace(1)* %240, align 4, !tbaa !7
  br label %244

244:                                              ; preds = %239, %231
  %245 = phi float [ 0.000000e+00, %231 ], [ %242, %239 ]
  %246 = phi float [ 0.000000e+00, %231 ], [ %243, %239 ]
  br i1 %129, label %247, label %256

247:                                              ; preds = %244
  %248 = icmp sgt i32 %127, %4
  %249 = select i1 %248, i1 true, i1 %168
  %250 = select i1 %249, i1 true, i1 %169
  br i1 %250, label %256, label %251

251:                                              ; preds = %247
  %252 = add nsw i32 %128, %29
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %0, i64 %253
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %253
  br label %274

256:                                              ; preds = %247, %244
  %257 = icmp slt i32 %20, -1
  %258 = select i1 %257, i1 %170, i1 false
  %259 = xor i1 %258, true
  %260 = select i1 %259, i1 true, i1 %169
  br i1 %260, label %261, label %274

261:                                              ; preds = %256
  %262 = icmp sge i32 %20, %4
  %263 = select i1 %262, i1 %170, i1 false
  %264 = xor i1 %263, true
  %265 = select i1 %264, i1 true, i1 %169
  br i1 %265, label %266, label %274

266:                                              ; preds = %261
  %267 = icmp sle i32 %127, %4
  %268 = select i1 %129, i1 %267, i1 false
  %269 = select i1 %268, i1 %168, i1 false
  br i1 %269, label %270, label %279

270:                                              ; preds = %266
  %271 = zext i32 %128 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %0, i64 %271
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %271
  br label %274

274:                                              ; preds = %261, %256, %251, %270
  %275 = phi float addrspace(1)* [ %273, %270 ], [ %255, %251 ], [ %173, %256 ], [ %177, %261 ]
  %276 = phi float addrspace(1)* [ %272, %270 ], [ %254, %251 ], [ %172, %256 ], [ %176, %261 ]
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !7
  %278 = load float, float addrspace(1)* %275, align 4, !tbaa !7
  br label %279

279:                                              ; preds = %274, %266
  %280 = phi float [ 0.000000e+00, %266 ], [ %277, %274 ]
  %281 = phi float [ 0.000000e+00, %266 ], [ %278, %274 ]
  %282 = add nsw i32 %28, 2
  %283 = add nsw i32 %28, 1
  %284 = icmp slt i32 %28, -1
  %285 = icmp sgt i32 %282, %5
  %286 = mul nsw i32 %283, %6
  %287 = icmp sgt i32 %28, -2
  %288 = sext i32 %286 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %0, i64 %288
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %288
  %291 = add nsw i32 %35, %286
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %0, i64 %292
  %294 = getelementptr inbounds float, float addrspace(1)* %1, i64 %292
  %295 = icmp sge i32 %28, %5
  br i1 %51, label %296, label %305

296:                                              ; preds = %279
  %297 = icmp sgt i32 %20, %4
  %298 = select i1 %297, i1 true, i1 %284
  %299 = select i1 %298, i1 true, i1 %285
  br i1 %299, label %305, label %300

300:                                              ; preds = %296
  %301 = add nsw i32 %50, %286
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %0, i64 %302
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %302
  br label %330

305:                                              ; preds = %296, %279
  %306 = icmp slt i32 %20, 1
  %307 = select i1 %306, i1 %287, i1 false
  %308 = xor i1 %307, true
  %309 = select i1 %308, i1 true, i1 %285
  br i1 %309, label %310, label %330

310:                                              ; preds = %305
  %311 = icmp sgt i32 %50, %4
  %312 = select i1 %311, i1 %287, i1 false
  %313 = xor i1 %312, true
  %314 = select i1 %313, i1 true, i1 %285
  br i1 %314, label %315, label %330

315:                                              ; preds = %310
  br i1 %51, label %316, label %335

316:                                              ; preds = %315
  %317 = icmp sle i32 %20, %4
  %318 = select i1 %317, i1 %284, i1 false
  br i1 %318, label %326, label %319

319:                                              ; preds = %316
  %320 = select i1 %317, i1 %295, i1 false
  br i1 %320, label %321, label %335

321:                                              ; preds = %319
  %322 = add nsw i32 %50, %37
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  %325 = getelementptr inbounds float, float addrspace(1)* %1, i64 %323
  br label %330

326:                                              ; preds = %316
  %327 = zext i32 %50 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %0, i64 %327
  %329 = getelementptr inbounds float, float addrspace(1)* %1, i64 %327
  br label %330

330:                                              ; preds = %310, %305, %300, %321, %326
  %331 = phi float addrspace(1)* [ %329, %326 ], [ %325, %321 ], [ %304, %300 ], [ %290, %305 ], [ %294, %310 ]
  %332 = phi float addrspace(1)* [ %328, %326 ], [ %324, %321 ], [ %303, %300 ], [ %289, %305 ], [ %293, %310 ]
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !7
  %334 = load float, float addrspace(1)* %331, align 4, !tbaa !7
  br label %335

335:                                              ; preds = %330, %319, %315
  %336 = phi float [ 0.000000e+00, %319 ], [ 0.000000e+00, %315 ], [ %333, %330 ]
  %337 = phi float [ 0.000000e+00, %319 ], [ 0.000000e+00, %315 ], [ %334, %330 ]
  br i1 %88, label %338, label %347

338:                                              ; preds = %335
  %339 = icmp sge i32 %20, %4
  %340 = select i1 %339, i1 true, i1 %284
  %341 = select i1 %340, i1 true, i1 %285
  br i1 %341, label %347, label %342

342:                                              ; preds = %338
  %343 = add nsw i32 %20, %286
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  %346 = getelementptr inbounds float, float addrspace(1)* %1, i64 %344
  br label %372

347:                                              ; preds = %338, %335
  %348 = icmp slt i32 %20, 0
  %349 = select i1 %348, i1 %287, i1 false
  %350 = xor i1 %349, true
  %351 = select i1 %350, i1 true, i1 %285
  br i1 %351, label %352, label %372

352:                                              ; preds = %347
  %353 = icmp sgt i32 %20, %4
  %354 = select i1 %353, i1 %287, i1 false
  %355 = xor i1 %354, true
  %356 = select i1 %355, i1 true, i1 %285
  br i1 %356, label %357, label %372

357:                                              ; preds = %352
  br i1 %88, label %358, label %377

358:                                              ; preds = %357
  %359 = icmp slt i32 %20, %4
  %360 = select i1 %359, i1 %284, i1 false
  br i1 %360, label %368, label %361

361:                                              ; preds = %358
  %362 = select i1 %359, i1 %295, i1 false
  br i1 %362, label %363, label %377

363:                                              ; preds = %361
  %364 = add nsw i32 %20, %37
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  %367 = getelementptr inbounds float, float addrspace(1)* %1, i64 %365
  br label %372

368:                                              ; preds = %358
  %369 = zext i32 %20 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %0, i64 %369
  %371 = getelementptr inbounds float, float addrspace(1)* %1, i64 %369
  br label %372

372:                                              ; preds = %352, %347, %342, %363, %368
  %373 = phi float addrspace(1)* [ %371, %368 ], [ %367, %363 ], [ %346, %342 ], [ %290, %347 ], [ %294, %352 ]
  %374 = phi float addrspace(1)* [ %370, %368 ], [ %366, %363 ], [ %345, %342 ], [ %289, %347 ], [ %293, %352 ]
  %375 = load float, float addrspace(1)* %374, align 4, !tbaa !7
  %376 = load float, float addrspace(1)* %373, align 4, !tbaa !7
  br label %377

377:                                              ; preds = %372, %361, %357
  %378 = phi float [ 0.000000e+00, %361 ], [ 0.000000e+00, %357 ], [ %375, %372 ]
  %379 = phi float [ 0.000000e+00, %361 ], [ 0.000000e+00, %357 ], [ %376, %372 ]
  br i1 %129, label %380, label %389

380:                                              ; preds = %377
  %381 = icmp sgt i32 %127, %4
  %382 = select i1 %381, i1 true, i1 %284
  %383 = select i1 %382, i1 true, i1 %285
  br i1 %383, label %389, label %384

384:                                              ; preds = %380
  %385 = add nsw i32 %128, %286
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %0, i64 %386
  %388 = getelementptr inbounds float, float addrspace(1)* %1, i64 %386
  br label %414

389:                                              ; preds = %380, %377
  %390 = icmp slt i32 %20, -1
  %391 = select i1 %390, i1 %287, i1 false
  %392 = xor i1 %391, true
  %393 = select i1 %392, i1 true, i1 %285
  br i1 %393, label %394, label %414

394:                                              ; preds = %389
  %395 = icmp sge i32 %20, %4
  %396 = select i1 %395, i1 %287, i1 false
  %397 = xor i1 %396, true
  %398 = select i1 %397, i1 true, i1 %285
  br i1 %398, label %399, label %414

399:                                              ; preds = %394
  br i1 %129, label %400, label %419

400:                                              ; preds = %399
  %401 = icmp sle i32 %127, %4
  %402 = select i1 %401, i1 %284, i1 false
  br i1 %402, label %410, label %403

403:                                              ; preds = %400
  %404 = select i1 %401, i1 %295, i1 false
  br i1 %404, label %405, label %419

405:                                              ; preds = %403
  %406 = add nsw i32 %128, %37
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %0, i64 %407
  %409 = getelementptr inbounds float, float addrspace(1)* %1, i64 %407
  br label %414

410:                                              ; preds = %400
  %411 = zext i32 %128 to i64
  %412 = getelementptr inbounds float, float addrspace(1)* %0, i64 %411
  %413 = getelementptr inbounds float, float addrspace(1)* %1, i64 %411
  br label %414

414:                                              ; preds = %394, %389, %384, %405, %410
  %415 = phi float addrspace(1)* [ %413, %410 ], [ %409, %405 ], [ %388, %384 ], [ %290, %389 ], [ %294, %394 ]
  %416 = phi float addrspace(1)* [ %412, %410 ], [ %408, %405 ], [ %387, %384 ], [ %289, %389 ], [ %293, %394 ]
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !7
  %418 = load float, float addrspace(1)* %415, align 4, !tbaa !7
  br label %419

419:                                              ; preds = %414, %403, %399
  %420 = phi float [ 0.000000e+00, %403 ], [ 0.000000e+00, %399 ], [ %417, %414 ]
  %421 = phi float [ 0.000000e+00, %403 ], [ 0.000000e+00, %399 ], [ %418, %414 ]
  %422 = fcmp contract ogt float %86, %125
  %423 = select i1 %422, float %125, float %86
  %424 = select i1 %422, float %86, float %125
  %425 = fcmp contract ogt float %87, %126
  %426 = select i1 %425, float %126, float %87
  %427 = select i1 %425, float %87, float %126
  %428 = fcmp contract ogt float %423, %166
  %429 = select i1 %428, float %166, float %423
  %430 = select i1 %428, float %423, float %166
  %431 = fcmp contract ogt float %426, %167
  %432 = select i1 %431, float %167, float %426
  %433 = select i1 %431, float %426, float %167
  %434 = fcmp contract ogt float %429, %211
  %435 = select i1 %434, float %211, float %429
  %436 = select i1 %434, float %429, float %211
  %437 = fcmp contract ogt float %432, %212
  %438 = select i1 %437, float %212, float %432
  %439 = select i1 %437, float %432, float %212
  %440 = fcmp contract ogt float %435, %245
  %441 = select i1 %440, float %245, float %435
  %442 = select i1 %440, float %435, float %245
  %443 = fcmp contract ogt float %438, %246
  %444 = select i1 %443, float %246, float %438
  %445 = select i1 %443, float %438, float %246
  %446 = fcmp contract ogt float %441, %280
  %447 = select i1 %446, float %280, float %441
  %448 = select i1 %446, float %441, float %280
  %449 = fcmp contract ogt float %444, %281
  %450 = select i1 %449, float %281, float %444
  %451 = select i1 %449, float %444, float %281
  %452 = fcmp contract ogt float %447, %336
  %453 = select i1 %452, float %336, float %447
  %454 = select i1 %452, float %447, float %336
  %455 = fcmp contract ogt float %450, %337
  %456 = select i1 %455, float %337, float %450
  %457 = select i1 %455, float %450, float %337
  %458 = fcmp contract ogt float %453, %378
  %459 = select i1 %458, float %378, float %453
  %460 = select i1 %458, float %453, float %378
  %461 = fcmp contract ogt float %456, %379
  %462 = select i1 %461, float %379, float %456
  %463 = select i1 %461, float %456, float %379
  %464 = fcmp contract ogt float %459, %420
  %465 = select i1 %464, float %459, float %420
  %466 = fcmp contract ogt float %462, %421
  %467 = select i1 %466, float %462, float %421
  %468 = fcmp contract ogt float %424, %430
  %469 = select i1 %468, float %430, float %424
  %470 = select i1 %468, float %424, float %430
  %471 = fcmp contract ogt float %427, %433
  %472 = select i1 %471, float %433, float %427
  %473 = select i1 %471, float %427, float %433
  %474 = fcmp contract ogt float %469, %436
  %475 = select i1 %474, float %436, float %469
  %476 = select i1 %474, float %469, float %436
  %477 = fcmp contract ogt float %472, %439
  %478 = select i1 %477, float %439, float %472
  %479 = select i1 %477, float %472, float %439
  %480 = fcmp contract ogt float %475, %442
  %481 = select i1 %480, float %442, float %475
  %482 = select i1 %480, float %475, float %442
  %483 = fcmp contract ogt float %478, %445
  %484 = select i1 %483, float %445, float %478
  %485 = select i1 %483, float %478, float %445
  %486 = fcmp contract ogt float %481, %448
  %487 = select i1 %486, float %448, float %481
  %488 = select i1 %486, float %481, float %448
  %489 = fcmp contract ogt float %484, %451
  %490 = select i1 %489, float %451, float %484
  %491 = select i1 %489, float %484, float %451
  %492 = fcmp contract ogt float %487, %454
  %493 = select i1 %492, float %454, float %487
  %494 = select i1 %492, float %487, float %454
  %495 = fcmp contract ogt float %490, %457
  %496 = select i1 %495, float %457, float %490
  %497 = select i1 %495, float %490, float %457
  %498 = fcmp contract ogt float %493, %460
  %499 = select i1 %498, float %460, float %493
  %500 = select i1 %498, float %493, float %460
  %501 = fcmp contract ogt float %496, %463
  %502 = select i1 %501, float %463, float %496
  %503 = select i1 %501, float %496, float %463
  %504 = fcmp contract ogt float %499, %465
  %505 = select i1 %504, float %499, float %465
  %506 = fcmp contract ogt float %502, %467
  %507 = select i1 %506, float %502, float %467
  %508 = fcmp contract ogt float %470, %476
  %509 = select i1 %508, float %476, float %470
  %510 = select i1 %508, float %470, float %476
  %511 = fcmp contract ogt float %473, %479
  %512 = select i1 %511, float %479, float %473
  %513 = select i1 %511, float %473, float %479
  %514 = fcmp contract ogt float %509, %482
  %515 = select i1 %514, float %482, float %509
  %516 = select i1 %514, float %509, float %482
  %517 = fcmp contract ogt float %512, %485
  %518 = select i1 %517, float %485, float %512
  %519 = select i1 %517, float %512, float %485
  %520 = fcmp contract ogt float %515, %488
  %521 = select i1 %520, float %488, float %515
  %522 = select i1 %520, float %515, float %488
  %523 = fcmp contract ogt float %518, %491
  %524 = select i1 %523, float %491, float %518
  %525 = select i1 %523, float %518, float %491
  %526 = fcmp contract ogt float %521, %494
  %527 = select i1 %526, float %494, float %521
  %528 = select i1 %526, float %521, float %494
  %529 = fcmp contract ogt float %524, %497
  %530 = select i1 %529, float %497, float %524
  %531 = select i1 %529, float %524, float %497
  %532 = fcmp contract ogt float %527, %500
  %533 = select i1 %532, float %500, float %527
  %534 = select i1 %532, float %527, float %500
  %535 = fcmp contract ogt float %530, %503
  %536 = select i1 %535, float %503, float %530
  %537 = select i1 %535, float %530, float %503
  %538 = fcmp contract ogt float %533, %505
  %539 = select i1 %538, float %533, float %505
  %540 = fcmp contract ogt float %536, %507
  %541 = select i1 %540, float %536, float %507
  %542 = fcmp contract ogt float %510, %516
  %543 = select i1 %542, float %516, float %510
  %544 = select i1 %542, float %510, float %516
  %545 = fcmp contract ogt float %513, %519
  %546 = select i1 %545, float %519, float %513
  %547 = select i1 %545, float %513, float %519
  %548 = fcmp contract ogt float %543, %522
  %549 = select i1 %548, float %522, float %543
  %550 = select i1 %548, float %543, float %522
  %551 = fcmp contract ogt float %546, %525
  %552 = select i1 %551, float %525, float %546
  %553 = select i1 %551, float %546, float %525
  %554 = fcmp contract ogt float %549, %528
  %555 = select i1 %554, float %528, float %549
  %556 = select i1 %554, float %549, float %528
  %557 = fcmp contract ogt float %552, %531
  %558 = select i1 %557, float %531, float %552
  %559 = select i1 %557, float %552, float %531
  %560 = fcmp contract ogt float %555, %534
  %561 = select i1 %560, float %534, float %555
  %562 = select i1 %560, float %555, float %534
  %563 = fcmp contract ogt float %558, %537
  %564 = select i1 %563, float %537, float %558
  %565 = select i1 %563, float %558, float %537
  %566 = fcmp contract ogt float %561, %539
  %567 = select i1 %566, float %561, float %539
  %568 = fcmp contract ogt float %564, %541
  %569 = select i1 %568, float %564, float %541
  %570 = fcmp contract ogt float %544, %550
  %571 = select i1 %570, float %550, float %544
  %572 = fcmp contract ogt float %547, %553
  %573 = select i1 %572, float %553, float %547
  %574 = fcmp contract ogt float %571, %556
  %575 = select i1 %574, float %556, float %571
  %576 = fcmp contract ogt float %573, %559
  %577 = select i1 %576, float %559, float %573
  %578 = fcmp contract ogt float %575, %562
  %579 = select i1 %578, float %562, float %575
  %580 = fcmp contract ogt float %577, %565
  %581 = select i1 %580, float %565, float %577
  %582 = fcmp contract ogt float %579, %567
  %583 = select i1 %582, float %567, float %579
  %584 = fcmp contract ogt float %581, %569
  %585 = select i1 %584, float %569, float %581
  %586 = sext i32 %30 to i64
  %587 = getelementptr inbounds float, float addrspace(1)* %7, i64 %586
  store float %583, float addrspace(1)* %587, align 4, !tbaa !7
  %588 = getelementptr inbounds float, float addrspace(1)* %8, i64 %586
  store float %585, float addrspace(1)* %588, align 4, !tbaa !7
  %589 = getelementptr inbounds float, float addrspace(1)* %2, i64 %586
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !7
  %591 = getelementptr inbounds float, float addrspace(1)* %0, i64 %586
  %592 = load float, float addrspace(1)* %591, align 4, !tbaa !7
  %593 = fadd contract float %590, %592
  %594 = fsub contract float %593, %583
  %595 = getelementptr inbounds float, float addrspace(1)* %9, i64 %586
  store float %594, float addrspace(1)* %595, align 4, !tbaa !7
  %596 = getelementptr inbounds float, float addrspace(1)* %3, i64 %586
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !7
  %598 = getelementptr inbounds float, float addrspace(1)* %1, i64 %586
  %599 = load float, float addrspace(1)* %598, align 4, !tbaa !7
  %600 = fadd contract float %597, %599
  %601 = fsub contract float %600, %585
  %602 = getelementptr inbounds float, float addrspace(1)* %10, i64 %586
  store float %601, float addrspace(1)* %602, align 4, !tbaa !7
  br label %603

603:                                              ; preds = %11, %419
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
