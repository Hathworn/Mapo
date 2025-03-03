; ModuleID = '../data/hip_kernels/16079/27/main.cu'
source_filename = "../data/hip_kernels/16079/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24TgvMedianFilter3DKernel3PfS_S_iiiS_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = mul nsw i32 %26, %5
  %28 = add nsw i32 %27, %18
  %29 = icmp slt i32 %18, %3
  %30 = icmp slt i32 %26, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %727

32:                                               ; preds = %9
  %33 = add nsw i32 %3, -1
  %34 = add nsw i32 %4, -1
  %35 = mul nsw i32 %34, %5
  %36 = add nsw i32 %26, -1
  %37 = icmp slt i32 %26, 1
  %38 = mul nsw i32 %36, %5
  %39 = icmp sgt i32 %26, 0
  %40 = sext i32 %38 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %44 = add nsw i32 %33, %38
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %49 = icmp sgt i32 %36, %4
  %50 = add nsw i32 %18, -1
  %51 = icmp sgt i32 %18, 0
  %52 = xor i1 %51, true
  %53 = select i1 %52, i1 true, i1 %37
  br i1 %53, label %60, label %54

54:                                               ; preds = %32
  %55 = add nsw i32 %50, %38
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  br label %83

60:                                               ; preds = %32
  %61 = icmp slt i32 %18, 1
  %62 = select i1 %61, i1 %39, i1 false
  br i1 %62, label %83, label %63

63:                                               ; preds = %60
  %64 = icmp sgt i32 %50, %3
  %65 = select i1 %64, i1 %39, i1 false
  br i1 %65, label %83, label %66

66:                                               ; preds = %63
  br i1 %51, label %67, label %90

67:                                               ; preds = %66
  %68 = icmp sle i32 %18, %3
  %69 = select i1 %68, i1 %37, i1 false
  br i1 %69, label %70, label %75

70:                                               ; preds = %67
  %71 = zext i32 %50 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  br label %83

75:                                               ; preds = %67
  %76 = select i1 %68, i1 %49, i1 false
  br i1 %76, label %77, label %90

77:                                               ; preds = %75
  %78 = add nsw i32 %50, %35
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  br label %83

83:                                               ; preds = %63, %60, %54, %77, %70
  %84 = phi float addrspace(1)* [ %74, %70 ], [ %82, %77 ], [ %59, %54 ], [ %43, %60 ], [ %48, %63 ]
  %85 = phi float addrspace(1)* [ %72, %70 ], [ %80, %77 ], [ %57, %54 ], [ %41, %60 ], [ %46, %63 ]
  %86 = phi float addrspace(1)* [ %73, %70 ], [ %81, %77 ], [ %58, %54 ], [ %42, %60 ], [ %47, %63 ]
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %89 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %83, %66, %75
  %91 = phi float [ 0.000000e+00, %75 ], [ 0.000000e+00, %66 ], [ %88, %83 ]
  %92 = phi float [ 0.000000e+00, %75 ], [ 0.000000e+00, %66 ], [ %87, %83 ]
  %93 = phi float [ 0.000000e+00, %75 ], [ 0.000000e+00, %66 ], [ %89, %83 ]
  %94 = icmp sgt i32 %18, -1
  %95 = xor i1 %94, true
  %96 = icmp sge i32 %18, %3
  %97 = select i1 %95, i1 true, i1 %96
  %98 = select i1 %97, i1 true, i1 %37
  br i1 %98, label %105, label %99

99:                                               ; preds = %90
  %100 = add nsw i32 %18, %38
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  br label %128

105:                                              ; preds = %90
  %106 = icmp slt i32 %18, 0
  %107 = select i1 %106, i1 %39, i1 false
  br i1 %107, label %128, label %108

108:                                              ; preds = %105
  %109 = icmp sgt i32 %18, %3
  %110 = select i1 %109, i1 %39, i1 false
  br i1 %110, label %128, label %111

111:                                              ; preds = %108
  br i1 %94, label %112, label %135

112:                                              ; preds = %111
  %113 = icmp slt i32 %18, %3
  %114 = select i1 %113, i1 %37, i1 false
  br i1 %114, label %123, label %115

115:                                              ; preds = %112
  %116 = select i1 %113, i1 %49, i1 false
  br i1 %116, label %117, label %135

117:                                              ; preds = %115
  %118 = add nsw i32 %18, %35
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  br label %128

123:                                              ; preds = %112
  %124 = zext i32 %18 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %124
  br label %128

128:                                              ; preds = %108, %105, %99, %117, %123
  %129 = phi float addrspace(1)* [ %127, %123 ], [ %122, %117 ], [ %104, %99 ], [ %43, %105 ], [ %48, %108 ]
  %130 = phi float addrspace(1)* [ %125, %123 ], [ %120, %117 ], [ %102, %99 ], [ %41, %105 ], [ %46, %108 ]
  %131 = phi float addrspace(1)* [ %126, %123 ], [ %121, %117 ], [ %103, %99 ], [ %42, %105 ], [ %47, %108 ]
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %134 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %128, %115, %111
  %136 = phi float [ 0.000000e+00, %115 ], [ 0.000000e+00, %111 ], [ %133, %128 ]
  %137 = phi float [ 0.000000e+00, %115 ], [ 0.000000e+00, %111 ], [ %132, %128 ]
  %138 = phi float [ 0.000000e+00, %115 ], [ 0.000000e+00, %111 ], [ %134, %128 ]
  %139 = add nsw i32 %18, 2
  %140 = add nsw i32 %18, 1
  %141 = icmp sgt i32 %18, -2
  %142 = xor i1 %141, true
  %143 = icmp sgt i32 %139, %3
  %144 = select i1 %142, i1 true, i1 %143
  %145 = select i1 %144, i1 true, i1 %37
  br i1 %145, label %152, label %146

146:                                              ; preds = %135
  %147 = add nsw i32 %140, %38
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  br label %175

152:                                              ; preds = %135
  %153 = icmp slt i32 %18, -1
  %154 = select i1 %153, i1 %39, i1 false
  br i1 %154, label %175, label %155

155:                                              ; preds = %152
  %156 = icmp sge i32 %18, %3
  %157 = select i1 %156, i1 %39, i1 false
  br i1 %157, label %175, label %158

158:                                              ; preds = %155
  br i1 %141, label %159, label %182

159:                                              ; preds = %158
  %160 = icmp sle i32 %139, %3
  %161 = select i1 %160, i1 %37, i1 false
  br i1 %161, label %170, label %162

162:                                              ; preds = %159
  %163 = select i1 %160, i1 %49, i1 false
  br i1 %163, label %164, label %182

164:                                              ; preds = %162
  %165 = add nsw i32 %140, %35
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %166
  br label %175

170:                                              ; preds = %159
  %171 = zext i32 %140 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %174 = getelementptr inbounds float, float addrspace(1)* %2, i64 %171
  br label %175

175:                                              ; preds = %155, %152, %146, %164, %170
  %176 = phi float addrspace(1)* [ %174, %170 ], [ %169, %164 ], [ %151, %146 ], [ %43, %152 ], [ %48, %155 ]
  %177 = phi float addrspace(1)* [ %172, %170 ], [ %167, %164 ], [ %149, %146 ], [ %41, %152 ], [ %46, %155 ]
  %178 = phi float addrspace(1)* [ %173, %170 ], [ %168, %164 ], [ %150, %146 ], [ %42, %152 ], [ %47, %155 ]
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %181 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  br label %182

182:                                              ; preds = %175, %162, %158
  %183 = phi float [ 0.000000e+00, %162 ], [ 0.000000e+00, %158 ], [ %180, %175 ]
  %184 = phi float [ 0.000000e+00, %162 ], [ 0.000000e+00, %158 ], [ %179, %175 ]
  %185 = phi float [ 0.000000e+00, %162 ], [ 0.000000e+00, %158 ], [ %181, %175 ]
  %186 = icmp slt i32 %26, 0
  %187 = icmp sge i32 %26, %4
  %188 = icmp sgt i32 %26, -1
  %189 = sext i32 %27 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %192 = getelementptr inbounds float, float addrspace(1)* %2, i64 %189
  %193 = add nsw i32 %33, %27
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %0, i64 %194
  %196 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  %197 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  br i1 %51, label %198, label %208

198:                                              ; preds = %182
  %199 = icmp sgt i32 %18, %3
  %200 = select i1 %199, i1 true, i1 %186
  %201 = select i1 %200, i1 true, i1 %187
  br i1 %201, label %208, label %202

202:                                              ; preds = %198
  %203 = add nsw i32 %50, %27
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  %207 = getelementptr inbounds float, float addrspace(1)* %2, i64 %204
  br label %227

208:                                              ; preds = %198, %182
  %209 = icmp slt i32 %18, 1
  %210 = select i1 %209, i1 %188, i1 false
  %211 = xor i1 %210, true
  %212 = select i1 %211, i1 true, i1 %187
  br i1 %212, label %213, label %227

213:                                              ; preds = %208
  %214 = icmp sgt i32 %50, %3
  %215 = select i1 %214, i1 %188, i1 false
  %216 = xor i1 %215, true
  %217 = select i1 %216, i1 true, i1 %187
  br i1 %217, label %218, label %227

218:                                              ; preds = %213
  %219 = icmp sle i32 %18, %3
  %220 = select i1 %51, i1 %219, i1 false
  %221 = select i1 %220, i1 %186, i1 false
  br i1 %221, label %222, label %234

222:                                              ; preds = %218
  %223 = zext i32 %50 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %223
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  br label %227

227:                                              ; preds = %213, %208, %202, %222
  %228 = phi float addrspace(1)* [ %226, %222 ], [ %207, %202 ], [ %192, %208 ], [ %197, %213 ]
  %229 = phi float addrspace(1)* [ %224, %222 ], [ %205, %202 ], [ %190, %208 ], [ %195, %213 ]
  %230 = phi float addrspace(1)* [ %225, %222 ], [ %206, %202 ], [ %191, %208 ], [ %196, %213 ]
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = load float, float addrspace(1)* %229, align 4, !tbaa !7
  %233 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  br label %234

234:                                              ; preds = %227, %218
  %235 = phi float [ 0.000000e+00, %218 ], [ %232, %227 ]
  %236 = phi float [ 0.000000e+00, %218 ], [ %231, %227 ]
  %237 = phi float [ 0.000000e+00, %218 ], [ %233, %227 ]
  br i1 %94, label %238, label %247

238:                                              ; preds = %234
  %239 = icmp sge i32 %18, %3
  %240 = select i1 %239, i1 true, i1 %186
  %241 = select i1 %240, i1 true, i1 %187
  br i1 %241, label %247, label %242

242:                                              ; preds = %238
  %243 = sext i32 %28 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %0, i64 %243
  %245 = getelementptr inbounds float, float addrspace(1)* %1, i64 %243
  %246 = getelementptr inbounds float, float addrspace(1)* %2, i64 %243
  br label %266

247:                                              ; preds = %238, %234
  %248 = icmp slt i32 %18, 0
  %249 = select i1 %248, i1 %188, i1 false
  %250 = xor i1 %249, true
  %251 = select i1 %250, i1 true, i1 %187
  br i1 %251, label %252, label %266

252:                                              ; preds = %247
  %253 = icmp sgt i32 %18, %3
  %254 = select i1 %253, i1 %188, i1 false
  %255 = xor i1 %254, true
  %256 = select i1 %255, i1 true, i1 %187
  br i1 %256, label %257, label %266

257:                                              ; preds = %252
  %258 = icmp slt i32 %18, %3
  %259 = select i1 %94, i1 %258, i1 false
  %260 = select i1 %259, i1 %186, i1 false
  br i1 %260, label %261, label %273

261:                                              ; preds = %257
  %262 = zext i32 %18 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %0, i64 %262
  %264 = getelementptr inbounds float, float addrspace(1)* %1, i64 %262
  %265 = getelementptr inbounds float, float addrspace(1)* %2, i64 %262
  br label %266

266:                                              ; preds = %252, %247, %242, %261
  %267 = phi float addrspace(1)* [ %265, %261 ], [ %246, %242 ], [ %192, %247 ], [ %197, %252 ]
  %268 = phi float addrspace(1)* [ %263, %261 ], [ %244, %242 ], [ %190, %247 ], [ %195, %252 ]
  %269 = phi float addrspace(1)* [ %264, %261 ], [ %245, %242 ], [ %191, %247 ], [ %196, %252 ]
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7
  %271 = load float, float addrspace(1)* %268, align 4, !tbaa !7
  %272 = load float, float addrspace(1)* %267, align 4, !tbaa !7
  br label %273

273:                                              ; preds = %266, %257
  %274 = phi float [ 0.000000e+00, %257 ], [ %271, %266 ]
  %275 = phi float [ 0.000000e+00, %257 ], [ %270, %266 ]
  %276 = phi float [ 0.000000e+00, %257 ], [ %272, %266 ]
  br i1 %141, label %277, label %287

277:                                              ; preds = %273
  %278 = icmp sgt i32 %139, %3
  %279 = select i1 %278, i1 true, i1 %186
  %280 = select i1 %279, i1 true, i1 %187
  br i1 %280, label %287, label %281

281:                                              ; preds = %277
  %282 = add nsw i32 %140, %27
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %0, i64 %283
  %285 = getelementptr inbounds float, float addrspace(1)* %1, i64 %283
  %286 = getelementptr inbounds float, float addrspace(1)* %2, i64 %283
  br label %306

287:                                              ; preds = %277, %273
  %288 = icmp slt i32 %18, -1
  %289 = select i1 %288, i1 %188, i1 false
  %290 = xor i1 %289, true
  %291 = select i1 %290, i1 true, i1 %187
  br i1 %291, label %292, label %306

292:                                              ; preds = %287
  %293 = icmp sge i32 %18, %3
  %294 = select i1 %293, i1 %188, i1 false
  %295 = xor i1 %294, true
  %296 = select i1 %295, i1 true, i1 %187
  br i1 %296, label %297, label %306

297:                                              ; preds = %292
  %298 = icmp sle i32 %139, %3
  %299 = select i1 %141, i1 %298, i1 false
  %300 = select i1 %299, i1 %186, i1 false
  br i1 %300, label %301, label %313

301:                                              ; preds = %297
  %302 = zext i32 %140 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %0, i64 %302
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %302
  %305 = getelementptr inbounds float, float addrspace(1)* %2, i64 %302
  br label %306

306:                                              ; preds = %292, %287, %281, %301
  %307 = phi float addrspace(1)* [ %305, %301 ], [ %286, %281 ], [ %192, %287 ], [ %197, %292 ]
  %308 = phi float addrspace(1)* [ %303, %301 ], [ %284, %281 ], [ %190, %287 ], [ %195, %292 ]
  %309 = phi float addrspace(1)* [ %304, %301 ], [ %285, %281 ], [ %191, %287 ], [ %196, %292 ]
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7
  %311 = load float, float addrspace(1)* %308, align 4, !tbaa !7
  %312 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  br label %313

313:                                              ; preds = %306, %297
  %314 = phi float [ 0.000000e+00, %297 ], [ %311, %306 ]
  %315 = phi float [ 0.000000e+00, %297 ], [ %310, %306 ]
  %316 = phi float [ 0.000000e+00, %297 ], [ %312, %306 ]
  %317 = add nsw i32 %26, 2
  %318 = add nsw i32 %26, 1
  %319 = icmp slt i32 %26, -1
  %320 = icmp sgt i32 %317, %4
  %321 = mul nsw i32 %318, %5
  %322 = icmp sgt i32 %26, -2
  %323 = sext i32 %321 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  %325 = getelementptr inbounds float, float addrspace(1)* %1, i64 %323
  %326 = getelementptr inbounds float, float addrspace(1)* %2, i64 %323
  %327 = add nsw i32 %33, %321
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %0, i64 %328
  %330 = getelementptr inbounds float, float addrspace(1)* %1, i64 %328
  %331 = getelementptr inbounds float, float addrspace(1)* %2, i64 %328
  %332 = icmp sge i32 %26, %4
  br i1 %51, label %333, label %343

333:                                              ; preds = %313
  %334 = icmp sgt i32 %18, %3
  %335 = select i1 %334, i1 true, i1 %319
  %336 = select i1 %335, i1 true, i1 %320
  br i1 %336, label %343, label %337

337:                                              ; preds = %333
  %338 = add nsw i32 %50, %321
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %0, i64 %339
  %341 = getelementptr inbounds float, float addrspace(1)* %1, i64 %339
  %342 = getelementptr inbounds float, float addrspace(1)* %2, i64 %339
  br label %370

343:                                              ; preds = %333, %313
  %344 = icmp slt i32 %18, 1
  %345 = select i1 %344, i1 %322, i1 false
  %346 = xor i1 %345, true
  %347 = select i1 %346, i1 true, i1 %320
  br i1 %347, label %348, label %370

348:                                              ; preds = %343
  %349 = icmp sgt i32 %50, %3
  %350 = select i1 %349, i1 %322, i1 false
  %351 = xor i1 %350, true
  %352 = select i1 %351, i1 true, i1 %320
  br i1 %352, label %353, label %370

353:                                              ; preds = %348
  br i1 %51, label %354, label %377

354:                                              ; preds = %353
  %355 = icmp sle i32 %18, %3
  %356 = select i1 %355, i1 %319, i1 false
  br i1 %356, label %365, label %357

357:                                              ; preds = %354
  %358 = select i1 %355, i1 %332, i1 false
  br i1 %358, label %359, label %377

359:                                              ; preds = %357
  %360 = add nsw i32 %50, %35
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %0, i64 %361
  %363 = getelementptr inbounds float, float addrspace(1)* %1, i64 %361
  %364 = getelementptr inbounds float, float addrspace(1)* %2, i64 %361
  br label %370

365:                                              ; preds = %354
  %366 = zext i32 %50 to i64
  %367 = getelementptr inbounds float, float addrspace(1)* %0, i64 %366
  %368 = getelementptr inbounds float, float addrspace(1)* %1, i64 %366
  %369 = getelementptr inbounds float, float addrspace(1)* %2, i64 %366
  br label %370

370:                                              ; preds = %348, %343, %337, %359, %365
  %371 = phi float addrspace(1)* [ %369, %365 ], [ %364, %359 ], [ %342, %337 ], [ %326, %343 ], [ %331, %348 ]
  %372 = phi float addrspace(1)* [ %367, %365 ], [ %362, %359 ], [ %340, %337 ], [ %324, %343 ], [ %329, %348 ]
  %373 = phi float addrspace(1)* [ %368, %365 ], [ %363, %359 ], [ %341, %337 ], [ %325, %343 ], [ %330, %348 ]
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !7
  %375 = load float, float addrspace(1)* %372, align 4, !tbaa !7
  %376 = load float, float addrspace(1)* %371, align 4, !tbaa !7
  br label %377

377:                                              ; preds = %370, %357, %353
  %378 = phi float [ 0.000000e+00, %357 ], [ 0.000000e+00, %353 ], [ %375, %370 ]
  %379 = phi float [ 0.000000e+00, %357 ], [ 0.000000e+00, %353 ], [ %374, %370 ]
  %380 = phi float [ 0.000000e+00, %357 ], [ 0.000000e+00, %353 ], [ %376, %370 ]
  br i1 %94, label %381, label %391

381:                                              ; preds = %377
  %382 = icmp sge i32 %18, %3
  %383 = select i1 %382, i1 true, i1 %319
  %384 = select i1 %383, i1 true, i1 %320
  br i1 %384, label %391, label %385

385:                                              ; preds = %381
  %386 = add nsw i32 %18, %321
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds float, float addrspace(1)* %0, i64 %387
  %389 = getelementptr inbounds float, float addrspace(1)* %1, i64 %387
  %390 = getelementptr inbounds float, float addrspace(1)* %2, i64 %387
  br label %418

391:                                              ; preds = %381, %377
  %392 = icmp slt i32 %18, 0
  %393 = select i1 %392, i1 %322, i1 false
  %394 = xor i1 %393, true
  %395 = select i1 %394, i1 true, i1 %320
  br i1 %395, label %396, label %418

396:                                              ; preds = %391
  %397 = icmp sgt i32 %18, %3
  %398 = select i1 %397, i1 %322, i1 false
  %399 = xor i1 %398, true
  %400 = select i1 %399, i1 true, i1 %320
  br i1 %400, label %401, label %418

401:                                              ; preds = %396
  br i1 %94, label %402, label %425

402:                                              ; preds = %401
  %403 = icmp slt i32 %18, %3
  %404 = select i1 %403, i1 %319, i1 false
  br i1 %404, label %413, label %405

405:                                              ; preds = %402
  %406 = select i1 %403, i1 %332, i1 false
  br i1 %406, label %407, label %425

407:                                              ; preds = %405
  %408 = add nsw i32 %18, %35
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %0, i64 %409
  %411 = getelementptr inbounds float, float addrspace(1)* %1, i64 %409
  %412 = getelementptr inbounds float, float addrspace(1)* %2, i64 %409
  br label %418

413:                                              ; preds = %402
  %414 = zext i32 %18 to i64
  %415 = getelementptr inbounds float, float addrspace(1)* %0, i64 %414
  %416 = getelementptr inbounds float, float addrspace(1)* %1, i64 %414
  %417 = getelementptr inbounds float, float addrspace(1)* %2, i64 %414
  br label %418

418:                                              ; preds = %396, %391, %385, %407, %413
  %419 = phi float addrspace(1)* [ %417, %413 ], [ %412, %407 ], [ %390, %385 ], [ %326, %391 ], [ %331, %396 ]
  %420 = phi float addrspace(1)* [ %415, %413 ], [ %410, %407 ], [ %388, %385 ], [ %324, %391 ], [ %329, %396 ]
  %421 = phi float addrspace(1)* [ %416, %413 ], [ %411, %407 ], [ %389, %385 ], [ %325, %391 ], [ %330, %396 ]
  %422 = load float, float addrspace(1)* %421, align 4, !tbaa !7
  %423 = load float, float addrspace(1)* %420, align 4, !tbaa !7
  %424 = load float, float addrspace(1)* %419, align 4, !tbaa !7
  br label %425

425:                                              ; preds = %418, %405, %401
  %426 = phi float [ 0.000000e+00, %405 ], [ 0.000000e+00, %401 ], [ %423, %418 ]
  %427 = phi float [ 0.000000e+00, %405 ], [ 0.000000e+00, %401 ], [ %422, %418 ]
  %428 = phi float [ 0.000000e+00, %405 ], [ 0.000000e+00, %401 ], [ %424, %418 ]
  br i1 %141, label %429, label %439

429:                                              ; preds = %425
  %430 = icmp sgt i32 %139, %3
  %431 = select i1 %430, i1 true, i1 %319
  %432 = select i1 %431, i1 true, i1 %320
  br i1 %432, label %439, label %433

433:                                              ; preds = %429
  %434 = add nsw i32 %140, %321
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(1)* %0, i64 %435
  %437 = getelementptr inbounds float, float addrspace(1)* %1, i64 %435
  %438 = getelementptr inbounds float, float addrspace(1)* %2, i64 %435
  br label %466

439:                                              ; preds = %429, %425
  %440 = icmp slt i32 %18, -1
  %441 = select i1 %440, i1 %322, i1 false
  %442 = xor i1 %441, true
  %443 = select i1 %442, i1 true, i1 %320
  br i1 %443, label %444, label %466

444:                                              ; preds = %439
  %445 = icmp sge i32 %18, %3
  %446 = select i1 %445, i1 %322, i1 false
  %447 = xor i1 %446, true
  %448 = select i1 %447, i1 true, i1 %320
  br i1 %448, label %449, label %466

449:                                              ; preds = %444
  br i1 %141, label %450, label %473

450:                                              ; preds = %449
  %451 = icmp sle i32 %139, %3
  %452 = select i1 %451, i1 %319, i1 false
  br i1 %452, label %461, label %453

453:                                              ; preds = %450
  %454 = select i1 %451, i1 %332, i1 false
  br i1 %454, label %455, label %473

455:                                              ; preds = %453
  %456 = add nsw i32 %140, %35
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds float, float addrspace(1)* %0, i64 %457
  %459 = getelementptr inbounds float, float addrspace(1)* %1, i64 %457
  %460 = getelementptr inbounds float, float addrspace(1)* %2, i64 %457
  br label %466

461:                                              ; preds = %450
  %462 = zext i32 %140 to i64
  %463 = getelementptr inbounds float, float addrspace(1)* %0, i64 %462
  %464 = getelementptr inbounds float, float addrspace(1)* %1, i64 %462
  %465 = getelementptr inbounds float, float addrspace(1)* %2, i64 %462
  br label %466

466:                                              ; preds = %444, %439, %433, %455, %461
  %467 = phi float addrspace(1)* [ %465, %461 ], [ %460, %455 ], [ %438, %433 ], [ %326, %439 ], [ %331, %444 ]
  %468 = phi float addrspace(1)* [ %463, %461 ], [ %458, %455 ], [ %436, %433 ], [ %324, %439 ], [ %329, %444 ]
  %469 = phi float addrspace(1)* [ %464, %461 ], [ %459, %455 ], [ %437, %433 ], [ %325, %439 ], [ %330, %444 ]
  %470 = load float, float addrspace(1)* %469, align 4, !tbaa !7
  %471 = load float, float addrspace(1)* %468, align 4, !tbaa !7
  %472 = load float, float addrspace(1)* %467, align 4, !tbaa !7
  br label %473

473:                                              ; preds = %466, %453, %449
  %474 = phi float [ 0.000000e+00, %453 ], [ 0.000000e+00, %449 ], [ %471, %466 ]
  %475 = phi float [ 0.000000e+00, %453 ], [ 0.000000e+00, %449 ], [ %470, %466 ]
  %476 = phi float [ 0.000000e+00, %453 ], [ 0.000000e+00, %449 ], [ %472, %466 ]
  %477 = fcmp contract ogt float %91, %136
  %478 = select i1 %477, float %136, float %91
  %479 = select i1 %477, float %91, float %136
  %480 = fcmp contract ogt float %92, %137
  %481 = select i1 %480, float %137, float %92
  %482 = select i1 %480, float %92, float %137
  %483 = fcmp contract ogt float %93, %138
  %484 = select i1 %483, float %138, float %93
  %485 = select i1 %483, float %93, float %138
  %486 = fcmp contract ogt float %478, %183
  %487 = select i1 %486, float %183, float %478
  %488 = select i1 %486, float %478, float %183
  %489 = fcmp contract ogt float %481, %184
  %490 = select i1 %489, float %184, float %481
  %491 = select i1 %489, float %481, float %184
  %492 = fcmp contract ogt float %484, %185
  %493 = select i1 %492, float %185, float %484
  %494 = select i1 %492, float %484, float %185
  %495 = fcmp contract ogt float %487, %235
  %496 = select i1 %495, float %235, float %487
  %497 = select i1 %495, float %487, float %235
  %498 = fcmp contract ogt float %490, %236
  %499 = select i1 %498, float %236, float %490
  %500 = select i1 %498, float %490, float %236
  %501 = fcmp contract ogt float %493, %237
  %502 = select i1 %501, float %237, float %493
  %503 = select i1 %501, float %493, float %237
  %504 = fcmp contract ogt float %496, %274
  %505 = select i1 %504, float %274, float %496
  %506 = select i1 %504, float %496, float %274
  %507 = fcmp contract ogt float %499, %275
  %508 = select i1 %507, float %275, float %499
  %509 = select i1 %507, float %499, float %275
  %510 = fcmp contract ogt float %502, %276
  %511 = select i1 %510, float %276, float %502
  %512 = select i1 %510, float %502, float %276
  %513 = fcmp contract ogt float %505, %314
  %514 = select i1 %513, float %314, float %505
  %515 = select i1 %513, float %505, float %314
  %516 = fcmp contract ogt float %508, %315
  %517 = select i1 %516, float %315, float %508
  %518 = select i1 %516, float %508, float %315
  %519 = fcmp contract ogt float %511, %316
  %520 = select i1 %519, float %316, float %511
  %521 = select i1 %519, float %511, float %316
  %522 = fcmp contract ogt float %514, %378
  %523 = select i1 %522, float %378, float %514
  %524 = select i1 %522, float %514, float %378
  %525 = fcmp contract ogt float %517, %379
  %526 = select i1 %525, float %379, float %517
  %527 = select i1 %525, float %517, float %379
  %528 = fcmp contract ogt float %520, %380
  %529 = select i1 %528, float %380, float %520
  %530 = select i1 %528, float %520, float %380
  %531 = fcmp contract ogt float %523, %426
  %532 = select i1 %531, float %426, float %523
  %533 = select i1 %531, float %523, float %426
  %534 = fcmp contract ogt float %526, %427
  %535 = select i1 %534, float %427, float %526
  %536 = select i1 %534, float %526, float %427
  %537 = fcmp contract ogt float %529, %428
  %538 = select i1 %537, float %428, float %529
  %539 = select i1 %537, float %529, float %428
  %540 = fcmp contract ogt float %532, %474
  %541 = select i1 %540, float %532, float %474
  %542 = fcmp contract ogt float %535, %475
  %543 = select i1 %542, float %535, float %475
  %544 = fcmp contract ogt float %538, %476
  %545 = select i1 %544, float %538, float %476
  %546 = fcmp contract ogt float %479, %488
  %547 = select i1 %546, float %488, float %479
  %548 = select i1 %546, float %479, float %488
  %549 = fcmp contract ogt float %482, %491
  %550 = select i1 %549, float %491, float %482
  %551 = select i1 %549, float %482, float %491
  %552 = fcmp contract ogt float %485, %494
  %553 = select i1 %552, float %494, float %485
  %554 = select i1 %552, float %485, float %494
  %555 = fcmp contract ogt float %547, %497
  %556 = select i1 %555, float %497, float %547
  %557 = select i1 %555, float %547, float %497
  %558 = fcmp contract ogt float %550, %500
  %559 = select i1 %558, float %500, float %550
  %560 = select i1 %558, float %550, float %500
  %561 = fcmp contract ogt float %553, %503
  %562 = select i1 %561, float %503, float %553
  %563 = select i1 %561, float %553, float %503
  %564 = fcmp contract ogt float %556, %506
  %565 = select i1 %564, float %506, float %556
  %566 = select i1 %564, float %556, float %506
  %567 = fcmp contract ogt float %559, %509
  %568 = select i1 %567, float %509, float %559
  %569 = select i1 %567, float %559, float %509
  %570 = fcmp contract ogt float %562, %512
  %571 = select i1 %570, float %512, float %562
  %572 = select i1 %570, float %562, float %512
  %573 = fcmp contract ogt float %565, %515
  %574 = select i1 %573, float %515, float %565
  %575 = select i1 %573, float %565, float %515
  %576 = fcmp contract ogt float %568, %518
  %577 = select i1 %576, float %518, float %568
  %578 = select i1 %576, float %568, float %518
  %579 = fcmp contract ogt float %571, %521
  %580 = select i1 %579, float %521, float %571
  %581 = select i1 %579, float %571, float %521
  %582 = fcmp contract ogt float %574, %524
  %583 = select i1 %582, float %524, float %574
  %584 = select i1 %582, float %574, float %524
  %585 = fcmp contract ogt float %577, %527
  %586 = select i1 %585, float %527, float %577
  %587 = select i1 %585, float %577, float %527
  %588 = fcmp contract ogt float %580, %530
  %589 = select i1 %588, float %530, float %580
  %590 = select i1 %588, float %580, float %530
  %591 = fcmp contract ogt float %583, %533
  %592 = select i1 %591, float %533, float %583
  %593 = select i1 %591, float %583, float %533
  %594 = fcmp contract ogt float %586, %536
  %595 = select i1 %594, float %536, float %586
  %596 = select i1 %594, float %586, float %536
  %597 = fcmp contract ogt float %589, %539
  %598 = select i1 %597, float %539, float %589
  %599 = select i1 %597, float %589, float %539
  %600 = fcmp contract ogt float %592, %541
  %601 = select i1 %600, float %592, float %541
  %602 = fcmp contract ogt float %595, %543
  %603 = select i1 %602, float %595, float %543
  %604 = fcmp contract ogt float %598, %545
  %605 = select i1 %604, float %598, float %545
  %606 = fcmp contract ogt float %548, %557
  %607 = select i1 %606, float %557, float %548
  %608 = select i1 %606, float %548, float %557
  %609 = fcmp contract ogt float %551, %560
  %610 = select i1 %609, float %560, float %551
  %611 = select i1 %609, float %551, float %560
  %612 = fcmp contract ogt float %554, %563
  %613 = select i1 %612, float %563, float %554
  %614 = select i1 %612, float %554, float %563
  %615 = fcmp contract ogt float %607, %566
  %616 = select i1 %615, float %566, float %607
  %617 = select i1 %615, float %607, float %566
  %618 = fcmp contract ogt float %610, %569
  %619 = select i1 %618, float %569, float %610
  %620 = select i1 %618, float %610, float %569
  %621 = fcmp contract ogt float %613, %572
  %622 = select i1 %621, float %572, float %613
  %623 = select i1 %621, float %613, float %572
  %624 = fcmp contract ogt float %616, %575
  %625 = select i1 %624, float %575, float %616
  %626 = select i1 %624, float %616, float %575
  %627 = fcmp contract ogt float %619, %578
  %628 = select i1 %627, float %578, float %619
  %629 = select i1 %627, float %619, float %578
  %630 = fcmp contract ogt float %622, %581
  %631 = select i1 %630, float %581, float %622
  %632 = select i1 %630, float %622, float %581
  %633 = fcmp contract ogt float %625, %584
  %634 = select i1 %633, float %584, float %625
  %635 = select i1 %633, float %625, float %584
  %636 = fcmp contract ogt float %628, %587
  %637 = select i1 %636, float %587, float %628
  %638 = select i1 %636, float %628, float %587
  %639 = fcmp contract ogt float %631, %590
  %640 = select i1 %639, float %590, float %631
  %641 = select i1 %639, float %631, float %590
  %642 = fcmp contract ogt float %634, %593
  %643 = select i1 %642, float %593, float %634
  %644 = select i1 %642, float %634, float %593
  %645 = fcmp contract ogt float %637, %596
  %646 = select i1 %645, float %596, float %637
  %647 = select i1 %645, float %637, float %596
  %648 = fcmp contract ogt float %640, %599
  %649 = select i1 %648, float %599, float %640
  %650 = select i1 %648, float %640, float %599
  %651 = fcmp contract ogt float %643, %601
  %652 = select i1 %651, float %643, float %601
  %653 = fcmp contract ogt float %646, %603
  %654 = select i1 %653, float %646, float %603
  %655 = fcmp contract ogt float %649, %605
  %656 = select i1 %655, float %649, float %605
  %657 = fcmp contract ogt float %608, %617
  %658 = select i1 %657, float %617, float %608
  %659 = select i1 %657, float %608, float %617
  %660 = fcmp contract ogt float %611, %620
  %661 = select i1 %660, float %620, float %611
  %662 = select i1 %660, float %611, float %620
  %663 = fcmp contract ogt float %614, %623
  %664 = select i1 %663, float %623, float %614
  %665 = select i1 %663, float %614, float %623
  %666 = fcmp contract ogt float %658, %626
  %667 = select i1 %666, float %626, float %658
  %668 = select i1 %666, float %658, float %626
  %669 = fcmp contract ogt float %661, %629
  %670 = select i1 %669, float %629, float %661
  %671 = select i1 %669, float %661, float %629
  %672 = fcmp contract ogt float %664, %632
  %673 = select i1 %672, float %632, float %664
  %674 = select i1 %672, float %664, float %632
  %675 = fcmp contract ogt float %667, %635
  %676 = select i1 %675, float %635, float %667
  %677 = select i1 %675, float %667, float %635
  %678 = fcmp contract ogt float %670, %638
  %679 = select i1 %678, float %638, float %670
  %680 = select i1 %678, float %670, float %638
  %681 = fcmp contract ogt float %673, %641
  %682 = select i1 %681, float %641, float %673
  %683 = select i1 %681, float %673, float %641
  %684 = fcmp contract ogt float %676, %644
  %685 = select i1 %684, float %644, float %676
  %686 = select i1 %684, float %676, float %644
  %687 = fcmp contract ogt float %679, %647
  %688 = select i1 %687, float %647, float %679
  %689 = select i1 %687, float %679, float %647
  %690 = fcmp contract ogt float %682, %650
  %691 = select i1 %690, float %650, float %682
  %692 = select i1 %690, float %682, float %650
  %693 = fcmp contract ogt float %685, %652
  %694 = select i1 %693, float %685, float %652
  %695 = fcmp contract ogt float %688, %654
  %696 = select i1 %695, float %688, float %654
  %697 = fcmp contract ogt float %691, %656
  %698 = select i1 %697, float %691, float %656
  %699 = fcmp contract ogt float %659, %668
  %700 = select i1 %699, float %668, float %659
  %701 = fcmp contract ogt float %662, %671
  %702 = select i1 %701, float %671, float %662
  %703 = fcmp contract ogt float %665, %674
  %704 = select i1 %703, float %674, float %665
  %705 = fcmp contract ogt float %700, %677
  %706 = select i1 %705, float %677, float %700
  %707 = fcmp contract ogt float %702, %680
  %708 = select i1 %707, float %680, float %702
  %709 = fcmp contract ogt float %704, %683
  %710 = select i1 %709, float %683, float %704
  %711 = fcmp contract ogt float %706, %686
  %712 = select i1 %711, float %686, float %706
  %713 = fcmp contract ogt float %708, %689
  %714 = select i1 %713, float %689, float %708
  %715 = fcmp contract ogt float %710, %692
  %716 = select i1 %715, float %692, float %710
  %717 = fcmp contract ogt float %712, %694
  %718 = select i1 %717, float %694, float %712
  %719 = fcmp contract ogt float %714, %696
  %720 = select i1 %719, float %696, float %714
  %721 = fcmp contract ogt float %716, %698
  %722 = select i1 %721, float %698, float %716
  %723 = sext i32 %28 to i64
  %724 = getelementptr inbounds float, float addrspace(1)* %6, i64 %723
  store float %718, float addrspace(1)* %724, align 4, !tbaa !7
  %725 = getelementptr inbounds float, float addrspace(1)* %7, i64 %723
  store float %720, float addrspace(1)* %725, align 4, !tbaa !7
  %726 = getelementptr inbounds float, float addrspace(1)* %8, i64 %723
  store float %722, float addrspace(1)* %726, align 4, !tbaa !7
  br label %727

727:                                              ; preds = %9, %473
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
