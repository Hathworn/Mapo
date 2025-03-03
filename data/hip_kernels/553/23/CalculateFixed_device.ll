; ModuleID = '../data/hip_kernels/553/23/main.cu'
source_filename = "../data/hip_kernels/553/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14CalculateFixedPKfS0_S0_Pfiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %19, %6
  %29 = add nsw i32 %28, %27
  %30 = icmp slt i32 %19, %7
  %31 = icmp slt i32 %27, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %334

33:                                               ; preds = %10
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fcmp contract ogt float %36, 1.270000e+02
  br i1 %37, label %38, label %334

38:                                               ; preds = %33
  %39 = add nsw i32 %4, -1
  %40 = add nsw i32 %5, -1
  %41 = add nsw i32 %19, -1
  %42 = mul nsw i32 %41, %6
  %43 = add nsw i32 %42, %27
  %44 = add nsw i32 %27, %9
  %45 = add nsw i32 %41, %8
  %46 = icmp sgt i32 %27, -1
  br i1 %46, label %47, label %51

47:                                               ; preds = %38
  %48 = icmp sgt i32 %19, 0
  %49 = icmp sle i32 %19, %7
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %52, label %51

51:                                               ; preds = %47, %38
  br label %52

52:                                               ; preds = %47, %51
  %53 = phi i32 [ %29, %51 ], [ %43, %47 ]
  %54 = mul nsw i32 %53, 3
  %55 = add nsw i32 %54, 2
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = add nsw i32 %54, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = sext i32 %54 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fadd contract float %63, 0.000000e+00
  %65 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %65, 0.000000e+00
  %67 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fadd contract float %67, 0.000000e+00
  %69 = icmp slt i32 %27, 0
  br i1 %69, label %79, label %70

70:                                               ; preds = %52
  %71 = icmp sgt i32 %19, 0
  %72 = icmp sle i32 %19, %7
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %79

74:                                               ; preds = %70
  %75 = sext i32 %43 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fcmp contract olt float %77, 1.270000e+02
  br i1 %78, label %79, label %105

79:                                               ; preds = %74, %70, %52
  %80 = icmp slt i32 %44, 0
  %81 = icmp slt i32 %44, %4
  %82 = select i1 %81, i32 %44, i32 %39
  %83 = select i1 %80, i32 0, i32 %82
  %84 = icmp slt i32 %45, 0
  %85 = icmp slt i32 %45, %5
  %86 = select i1 %85, i32 %45, i32 %40
  %87 = select i1 %84, i32 0, i32 %86
  %88 = mul nsw i32 %87, %4
  %89 = add nsw i32 %88, %83
  %90 = mul nsw i32 %89, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract float %93, 0.000000e+00
  %95 = add nsw i32 %90, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fadd contract float %98, 0.000000e+00
  %100 = add nsw i32 %90, 2
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %103, 0.000000e+00
  br label %105

105:                                              ; preds = %79, %74
  %106 = phi float [ %99, %79 ], [ 0.000000e+00, %74 ]
  %107 = phi float [ %104, %79 ], [ 0.000000e+00, %74 ]
  %108 = phi float [ %94, %79 ], [ 0.000000e+00, %74 ]
  %109 = add nsw i32 %27, 1
  %110 = add nsw i32 %28, %109
  %111 = add nsw i32 %109, %9
  %112 = add nsw i32 %19, %8
  %113 = icmp sgt i32 %27, -2
  br i1 %113, label %114, label %118

114:                                              ; preds = %105
  %115 = icmp slt i32 %109, %6
  %116 = icmp sgt i32 %19, -1
  %117 = select i1 %115, i1 %116, i1 false
  br i1 %117, label %119, label %118

118:                                              ; preds = %114, %105
  br label %119

119:                                              ; preds = %118, %114
  %120 = phi i32 [ %29, %118 ], [ %110, %114 ]
  %121 = mul nsw i32 %120, 3
  %122 = add nsw i32 %121, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = add nsw i32 %121, 1
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = sext i32 %121 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fadd contract float %64, %130
  %132 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fadd contract float %66, %132
  %134 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fadd contract float %68, %134
  %136 = icmp slt i32 %27, -1
  br i1 %136, label %146, label %137

137:                                              ; preds = %119
  %138 = icmp slt i32 %109, %6
  %139 = icmp sgt i32 %19, -1
  %140 = select i1 %138, i1 %139, i1 false
  br i1 %140, label %141, label %146

141:                                              ; preds = %137
  %142 = sext i32 %110 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fcmp contract olt float %144, 1.270000e+02
  br i1 %145, label %146, label %172

146:                                              ; preds = %141, %137, %119
  %147 = icmp slt i32 %111, 0
  %148 = icmp slt i32 %111, %4
  %149 = select i1 %148, i32 %111, i32 %39
  %150 = select i1 %147, i32 0, i32 %149
  %151 = icmp slt i32 %112, 0
  %152 = icmp slt i32 %112, %5
  %153 = select i1 %152, i32 %112, i32 %40
  %154 = select i1 %151, i32 0, i32 %153
  %155 = mul nsw i32 %154, %4
  %156 = add nsw i32 %155, %150
  %157 = mul nsw i32 %156, 3
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = fadd contract float %108, %160
  %162 = add nsw i32 %157, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = fadd contract float %106, %165
  %167 = add nsw i32 %157, 2
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %171 = fadd contract float %107, %170
  br label %172

172:                                              ; preds = %146, %141
  %173 = phi float [ %166, %146 ], [ %106, %141 ]
  %174 = phi float [ %171, %146 ], [ %107, %141 ]
  %175 = phi float [ %161, %146 ], [ %108, %141 ]
  %176 = add nsw i32 %19, 1
  %177 = mul nsw i32 %176, %6
  %178 = add nsw i32 %177, %27
  %179 = add nsw i32 %176, %8
  br i1 %46, label %180, label %184

180:                                              ; preds = %172
  %181 = icmp sgt i32 %19, -2
  %182 = icmp slt i32 %176, %7
  %183 = select i1 %181, i1 %182, i1 false
  br i1 %183, label %185, label %184

184:                                              ; preds = %180, %172
  br label %185

185:                                              ; preds = %184, %180
  %186 = phi i32 [ %29, %184 ], [ %178, %180 ]
  %187 = mul nsw i32 %186, 3
  %188 = add nsw i32 %187, 2
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %191 = add nsw i32 %187, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %192
  %194 = sext i32 %187 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = fadd contract float %131, %196
  %198 = load float, float addrspace(1)* %193, align 4, !tbaa !7, !amdgpu.noclobber !5
  %199 = fadd contract float %133, %198
  %200 = load float, float addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !5
  %201 = fadd contract float %135, %200
  br i1 %69, label %211, label %202

202:                                              ; preds = %185
  %203 = icmp sgt i32 %19, -2
  %204 = icmp slt i32 %176, %7
  %205 = select i1 %203, i1 %204, i1 false
  br i1 %205, label %206, label %211

206:                                              ; preds = %202
  %207 = sext i32 %178 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %2, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7, !amdgpu.noclobber !5
  %210 = fcmp contract olt float %209, 1.270000e+02
  br i1 %210, label %211, label %237

211:                                              ; preds = %206, %202, %185
  %212 = icmp slt i32 %44, 0
  %213 = icmp slt i32 %44, %4
  %214 = select i1 %213, i32 %44, i32 %39
  %215 = select i1 %212, i32 0, i32 %214
  %216 = icmp slt i32 %179, 0
  %217 = icmp slt i32 %179, %5
  %218 = select i1 %217, i32 %179, i32 %40
  %219 = select i1 %216, i32 0, i32 %218
  %220 = mul nsw i32 %219, %4
  %221 = add nsw i32 %220, %215
  %222 = mul nsw i32 %221, 3
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7, !amdgpu.noclobber !5
  %226 = fadd contract float %175, %225
  %227 = add nsw i32 %222, 1
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7, !amdgpu.noclobber !5
  %231 = fadd contract float %173, %230
  %232 = add nsw i32 %222, 2
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7, !amdgpu.noclobber !5
  %236 = fadd contract float %174, %235
  br label %237

237:                                              ; preds = %211, %206
  %238 = phi float [ %231, %211 ], [ %173, %206 ]
  %239 = phi float [ %236, %211 ], [ %174, %206 ]
  %240 = phi float [ %226, %211 ], [ %175, %206 ]
  %241 = add nsw i32 %27, -1
  %242 = add nsw i32 %28, %241
  %243 = add nsw i32 %241, %9
  %244 = icmp sgt i32 %27, 0
  br i1 %244, label %245, label %249

245:                                              ; preds = %237
  %246 = icmp sle i32 %27, %6
  %247 = icmp sgt i32 %19, -1
  %248 = select i1 %246, i1 %247, i1 false
  br i1 %248, label %250, label %249

249:                                              ; preds = %245, %237
  br label %250

250:                                              ; preds = %249, %245
  %251 = phi i32 [ %29, %249 ], [ %242, %245 ]
  %252 = mul nsw i32 %251, 3
  %253 = add nsw i32 %252, 2
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  %256 = add nsw i32 %252, 1
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %1, i64 %257
  %259 = sext i32 %252 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %1, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7, !amdgpu.noclobber !5
  %262 = fadd contract float %197, %261
  %263 = load float, float addrspace(1)* %258, align 4, !tbaa !7, !amdgpu.noclobber !5
  %264 = fadd contract float %199, %263
  %265 = load float, float addrspace(1)* %255, align 4, !tbaa !7, !amdgpu.noclobber !5
  %266 = fadd contract float %201, %265
  %267 = icmp slt i32 %27, 1
  br i1 %267, label %277, label %268

268:                                              ; preds = %250
  %269 = icmp sle i32 %27, %6
  %270 = icmp sgt i32 %19, -1
  %271 = select i1 %269, i1 %270, i1 false
  br i1 %271, label %272, label %277

272:                                              ; preds = %268
  %273 = sext i32 %242 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %2, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !7, !amdgpu.noclobber !5
  %276 = fcmp contract olt float %275, 1.270000e+02
  br i1 %276, label %277, label %303

277:                                              ; preds = %272, %268, %250
  %278 = icmp slt i32 %243, 0
  %279 = icmp slt i32 %243, %4
  %280 = select i1 %279, i32 %243, i32 %39
  %281 = select i1 %278, i32 0, i32 %280
  %282 = icmp slt i32 %112, 0
  %283 = icmp slt i32 %112, %5
  %284 = select i1 %283, i32 %112, i32 %40
  %285 = select i1 %282, i32 0, i32 %284
  %286 = mul nsw i32 %285, %4
  %287 = add nsw i32 %286, %281
  %288 = mul nsw i32 %287, 3
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7, !amdgpu.noclobber !5
  %292 = fadd contract float %240, %291
  %293 = add nsw i32 %288, 1
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %0, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !7, !amdgpu.noclobber !5
  %297 = fadd contract float %238, %296
  %298 = add nsw i32 %288, 2
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %0, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !7, !amdgpu.noclobber !5
  %302 = fadd contract float %239, %301
  br label %303

303:                                              ; preds = %277, %272
  %304 = phi float [ %297, %277 ], [ %238, %272 ]
  %305 = phi float [ %302, %277 ], [ %239, %272 ]
  %306 = phi float [ %292, %277 ], [ %240, %272 ]
  %307 = mul nsw i32 %29, 3
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %1, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7, !amdgpu.noclobber !5
  %311 = fmul contract float %262, 2.500000e-01
  %312 = fsub contract float %310, %311
  %313 = fmul contract float %306, 2.500000e-01
  %314 = fadd contract float %313, %312
  %315 = getelementptr inbounds float, float addrspace(1)* %3, i64 %308
  store float %314, float addrspace(1)* %315, align 4, !tbaa !7
  %316 = add nsw i32 %307, 1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %1, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !7
  %320 = fmul contract float %264, 2.500000e-01
  %321 = fsub contract float %319, %320
  %322 = fmul contract float %304, 2.500000e-01
  %323 = fadd contract float %322, %321
  %324 = getelementptr inbounds float, float addrspace(1)* %3, i64 %317
  store float %323, float addrspace(1)* %324, align 4, !tbaa !7
  %325 = add nsw i32 %307, 2
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !7
  %329 = fmul contract float %266, 2.500000e-01
  %330 = fsub contract float %328, %329
  %331 = fmul contract float %305, 2.500000e-01
  %332 = fadd contract float %331, %330
  %333 = getelementptr inbounds float, float addrspace(1)* %3, i64 %326
  store float %332, float addrspace(1)* %333, align 4, !tbaa !7
  br label %334

334:                                              ; preds = %303, %33, %10
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
