; ModuleID = '../data/hip_kernels/14036/1/main.cu'
source_filename = "../data/hip_kernels/14036/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @deltasBatch(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = add i32 %5, 1
  %17 = mul nsw i32 %15, %16
  %18 = mul i32 %15, %4
  %19 = mul i32 %18, %5
  %20 = icmp slt i32 %5, 0
  br i1 %20, label %38, label %21

21:                                               ; preds = %6
  %22 = and i32 %16, 7
  %23 = icmp ult i32 %5, 7
  br i1 %23, label %26, label %24

24:                                               ; preds = %21
  %25 = and i32 %16, -8
  br label %55

26:                                               ; preds = %55, %21
  %27 = phi i32 [ 0, %21 ], [ %89, %55 ]
  %28 = icmp eq i32 %22, 0
  br i1 %28, label %38, label %29

29:                                               ; preds = %26, %29
  %30 = phi i32 [ %35, %29 ], [ %27, %26 ]
  %31 = phi i32 [ %36, %29 ], [ 0, %26 ]
  %32 = add nsw i32 %30, %17
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  store float 0.000000e+00, float addrspace(1)* %34, align 4, !tbaa !7
  %35 = add nuw i32 %30, 1
  %36 = add i32 %31, 1
  %37 = icmp eq i32 %36, %22
  br i1 %37, label %38, label %29, !llvm.loop !11

38:                                               ; preds = %26, %29, %6
  %39 = icmp sgt i32 %4, 0
  br i1 %39, label %40, label %97

40:                                               ; preds = %38
  %41 = icmp sgt i32 %5, 0
  %42 = sext i32 %5 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = add nsw i32 %17, %5
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = and i32 %5, 7
  %48 = icmp ult i32 %5, 8
  %49 = and i32 %5, -8
  %50 = icmp eq i32 %47, 0
  %51 = and i32 %5, 7
  %52 = icmp ult i32 %5, 8
  %53 = and i32 %5, -8
  %54 = icmp eq i32 %51, 0
  br label %92

55:                                               ; preds = %55, %24
  %56 = phi i32 [ 0, %24 ], [ %89, %55 ]
  %57 = phi i32 [ 0, %24 ], [ %90, %55 ]
  %58 = add nsw i32 %56, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  store float 0.000000e+00, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = or i32 %56, 1
  %62 = add nsw i32 %61, %17
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  store float 0.000000e+00, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = or i32 %56, 2
  %66 = add nsw i32 %65, %17
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  store float 0.000000e+00, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i32 %56, 3
  %70 = add nsw i32 %69, %17
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %3, i64 %71
  store float 0.000000e+00, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %56, 4
  %74 = add nsw i32 %73, %17
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %75
  store float 0.000000e+00, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = or i32 %56, 5
  %78 = add nsw i32 %77, %17
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %3, i64 %79
  store float 0.000000e+00, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i32 %56, 6
  %82 = add nsw i32 %81, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %3, i64 %83
  store float 0.000000e+00, float addrspace(1)* %84, align 4, !tbaa !7
  %85 = or i32 %56, 7
  %86 = add nsw i32 %85, %17
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  store float 0.000000e+00, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = add nuw i32 %56, 8
  %90 = add i32 %57, 8
  %91 = icmp eq i32 %90, %25
  br i1 %91, label %26, label %55, !llvm.loop !13

92:                                               ; preds = %40, %334
  %93 = phi i32 [ 0, %40 ], [ %335, %334 ]
  br i1 %41, label %94, label %118

94:                                               ; preds = %92
  %95 = mul nsw i32 %93, %5
  %96 = add nsw i32 %95, %19
  br i1 %48, label %98, label %134

97:                                               ; preds = %334, %38
  ret void

98:                                               ; preds = %134, %94
  %99 = phi float [ undef, %94 ], [ %216, %134 ]
  %100 = phi i32 [ 0, %94 ], [ %217, %134 ]
  %101 = phi float [ 0.000000e+00, %94 ], [ %216, %134 ]
  br i1 %50, label %118, label %102

102:                                              ; preds = %98, %102
  %103 = phi i32 [ %115, %102 ], [ %100, %98 ]
  %104 = phi float [ %114, %102 ], [ %101, %98 ]
  %105 = phi i32 [ %116, %102 ], [ 0, %98 ]
  %106 = add nsw i32 %96, %103
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = zext i32 %103 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %109, %112
  %114 = fadd contract float %104, %113
  %115 = add nuw nsw i32 %103, 1
  %116 = add i32 %105, 1
  %117 = icmp eq i32 %116, %47
  br i1 %117, label %118, label %102, !llvm.loop !15

118:                                              ; preds = %98, %102, %92
  %119 = phi float [ 0.000000e+00, %92 ], [ %99, %98 ], [ %114, %102 ]
  %120 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %121 = fadd contract float %119, %120
  %122 = fcmp contract ogt float %121, 0.000000e+00
  %123 = select i1 %122, float 1.000000e+00, float 0.000000e+00
  %124 = add nsw i32 %93, %18
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fsub contract float %127, %123
  %129 = fcmp contract une float %128, 0.000000e+00
  br i1 %129, label %130, label %334

130:                                              ; preds = %118
  br i1 %41, label %131, label %238

131:                                              ; preds = %130
  %132 = mul nsw i32 %93, %5
  %133 = add nsw i32 %132, %19
  br i1 %52, label %220, label %241

134:                                              ; preds = %94, %134
  %135 = phi i32 [ %217, %134 ], [ 0, %94 ]
  %136 = phi float [ %216, %134 ], [ 0.000000e+00, %94 ]
  %137 = phi i32 [ %218, %134 ], [ 0, %94 ]
  %138 = add nsw i32 %96, %135
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = zext i32 %135 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fmul contract float %141, %144
  %146 = fadd contract float %136, %145
  %147 = or i32 %135, 1
  %148 = add nsw i32 %96, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = zext i32 %147 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %2, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = fmul contract float %151, %154
  %156 = fadd contract float %146, %155
  %157 = or i32 %135, 2
  %158 = add nsw i32 %96, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = zext i32 %157 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %2, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fmul contract float %161, %164
  %166 = fadd contract float %156, %165
  %167 = or i32 %135, 3
  %168 = add nsw i32 %96, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = zext i32 %167 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fmul contract float %171, %174
  %176 = fadd contract float %166, %175
  %177 = or i32 %135, 4
  %178 = add nsw i32 %96, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = zext i32 %177 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %2, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fmul contract float %181, %184
  %186 = fadd contract float %176, %185
  %187 = or i32 %135, 5
  %188 = add nsw i32 %96, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = zext i32 %187 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fmul contract float %191, %194
  %196 = fadd contract float %186, %195
  %197 = or i32 %135, 6
  %198 = add nsw i32 %96, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7
  %202 = zext i32 %197 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7
  %205 = fmul contract float %201, %204
  %206 = fadd contract float %196, %205
  %207 = or i32 %135, 7
  %208 = add nsw i32 %96, %207
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = zext i32 %207 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %2, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = fmul contract float %211, %214
  %216 = fadd contract float %206, %215
  %217 = add nuw nsw i32 %135, 8
  %218 = add i32 %137, 8
  %219 = icmp eq i32 %218, %49
  br i1 %219, label %98, label %134, !llvm.loop !16

220:                                              ; preds = %241, %131
  %221 = phi i32 [ 0, %131 ], [ %331, %241 ]
  br i1 %54, label %238, label %222

222:                                              ; preds = %220, %222
  %223 = phi i32 [ %235, %222 ], [ %221, %220 ]
  %224 = phi i32 [ %236, %222 ], [ 0, %220 ]
  %225 = add nsw i32 %133, %223
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(1)* %0, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !7
  %229 = fmul contract float %128, %228
  %230 = add nsw i32 %223, %17
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %3, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  %234 = fadd contract float %233, %229
  store float %234, float addrspace(1)* %232, align 4, !tbaa !7
  %235 = add nuw nsw i32 %223, 1
  %236 = add i32 %224, 1
  %237 = icmp eq i32 %236, %51
  br i1 %237, label %238, label %222, !llvm.loop !17

238:                                              ; preds = %220, %222, %130
  %239 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %240 = fadd contract float %128, %239
  store float %240, float addrspace(1)* %46, align 4, !tbaa !7
  br label %334

241:                                              ; preds = %131, %241
  %242 = phi i32 [ %331, %241 ], [ 0, %131 ]
  %243 = phi i32 [ %332, %241 ], [ 0, %131 ]
  %244 = add nsw i32 %133, %242
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = fmul contract float %128, %247
  %249 = add nsw i32 %242, %17
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %3, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !7
  %253 = fadd contract float %252, %248
  store float %253, float addrspace(1)* %251, align 4, !tbaa !7
  %254 = or i32 %242, 1
  %255 = add nsw i32 %133, %254
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %0, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !7
  %259 = fmul contract float %128, %258
  %260 = add nsw i32 %254, %17
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %3, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !7
  %264 = fadd contract float %263, %259
  store float %264, float addrspace(1)* %262, align 4, !tbaa !7
  %265 = or i32 %242, 2
  %266 = add nsw i32 %133, %265
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %0, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !7
  %270 = fmul contract float %128, %269
  %271 = add nsw i32 %265, %17
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %3, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7
  %275 = fadd contract float %274, %270
  store float %275, float addrspace(1)* %273, align 4, !tbaa !7
  %276 = or i32 %242, 3
  %277 = add nsw i32 %133, %276
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %0, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7
  %281 = fmul contract float %128, %280
  %282 = add nsw i32 %276, %17
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds float, float addrspace(1)* %3, i64 %283
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !7
  %286 = fadd contract float %285, %281
  store float %286, float addrspace(1)* %284, align 4, !tbaa !7
  %287 = or i32 %242, 4
  %288 = add nsw i32 %133, %287
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 %289
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7
  %292 = fmul contract float %128, %291
  %293 = add nsw i32 %287, %17
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %3, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !7
  %297 = fadd contract float %296, %292
  store float %297, float addrspace(1)* %295, align 4, !tbaa !7
  %298 = or i32 %242, 5
  %299 = add nsw i32 %133, %298
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %0, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !7
  %303 = fmul contract float %128, %302
  %304 = add nsw i32 %298, %17
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %3, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !7
  %308 = fadd contract float %307, %303
  store float %308, float addrspace(1)* %306, align 4, !tbaa !7
  %309 = or i32 %242, 6
  %310 = add nsw i32 %133, %309
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %0, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !7
  %314 = fmul contract float %128, %313
  %315 = add nsw i32 %309, %17
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %3, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !7
  %319 = fadd contract float %318, %314
  store float %319, float addrspace(1)* %317, align 4, !tbaa !7
  %320 = or i32 %242, 7
  %321 = add nsw i32 %133, %320
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds float, float addrspace(1)* %0, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !7
  %325 = fmul contract float %128, %324
  %326 = add nsw i32 %320, %17
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %3, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7
  %330 = fadd contract float %329, %325
  store float %330, float addrspace(1)* %328, align 4, !tbaa !7
  %331 = add nuw nsw i32 %242, 8
  %332 = add i32 %243, 8
  %333 = icmp eq i32 %332, %53
  br i1 %333, label %220, label %241, !llvm.loop !18

334:                                              ; preds = %118, %238
  %335 = add nuw nsw i32 %93, 1
  %336 = icmp eq i32 %335, %4
  br i1 %336, label %97, label %92, !llvm.loop !19
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
