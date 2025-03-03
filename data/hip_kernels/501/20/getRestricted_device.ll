; ModuleID = '../data/hip_kernels/501/20/main.cu'
source_filename = "../data/hip_kernels/501/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13getRestrictediiiiPfiS_iS_iS_iS_i(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, float addrspace(1)* nocapture %8, i32 %9, float addrspace(1)* nocapture %10, i32 %11, float addrspace(1)* nocapture %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = shl i32 %15, 4
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %1
  br i1 %19, label %20, label %886

20:                                               ; preds = %14
  %21 = icmp ne i32 %18, 1
  %22 = zext i1 %21 to i32
  %23 = mul nsw i32 %18, %5
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %4, i64 %24
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %27, label %73

27:                                               ; preds = %20
  %28 = add i32 %2, -1
  %29 = and i32 %2, 7
  %30 = icmp ult i32 %28, 7
  br i1 %30, label %62, label %31

31:                                               ; preds = %27
  %32 = and i32 %2, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i32 [ 0, %31 ], [ %59, %33 ]
  %35 = phi i32 [ 0, %31 ], [ %60, %33 ]
  %36 = zext i32 %34 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %25, i64 %36
  store float 1.000000e+00, float addrspace(1)* %37, align 4, !tbaa !5
  %38 = or i32 %34, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %25, i64 %39
  store float 1.000000e+00, float addrspace(1)* %40, align 4, !tbaa !5
  %41 = or i32 %34, 2
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %25, i64 %42
  store float 1.000000e+00, float addrspace(1)* %43, align 4, !tbaa !5
  %44 = or i32 %34, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %25, i64 %45
  store float 1.000000e+00, float addrspace(1)* %46, align 4, !tbaa !5
  %47 = or i32 %34, 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %25, i64 %48
  store float 1.000000e+00, float addrspace(1)* %49, align 4, !tbaa !5
  %50 = or i32 %34, 5
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %25, i64 %51
  store float 1.000000e+00, float addrspace(1)* %52, align 4, !tbaa !5
  %53 = or i32 %34, 6
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %25, i64 %54
  store float 1.000000e+00, float addrspace(1)* %55, align 4, !tbaa !5
  %56 = or i32 %34, 7
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %25, i64 %57
  store float 1.000000e+00, float addrspace(1)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i32 %34, 8
  %60 = add i32 %35, 8
  %61 = icmp eq i32 %60, %32
  br i1 %61, label %62, label %33, !llvm.loop !9

62:                                               ; preds = %33, %27
  %63 = phi i32 [ 0, %27 ], [ %59, %33 ]
  %64 = icmp eq i32 %29, 0
  br i1 %64, label %73, label %65

65:                                               ; preds = %62, %65
  %66 = phi i32 [ %70, %65 ], [ %63, %62 ]
  %67 = phi i32 [ %71, %65 ], [ 0, %62 ]
  %68 = zext i32 %66 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %25, i64 %68
  store float 1.000000e+00, float addrspace(1)* %69, align 4, !tbaa !5
  %70 = add nuw nsw i32 %66, 1
  %71 = add i32 %67, 1
  %72 = icmp eq i32 %71, %29
  br i1 %72, label %73, label %65, !llvm.loop !11

73:                                               ; preds = %62, %65, %20
  %74 = mul nsw i32 %18, %0
  %75 = add nsw i32 %74, %22
  %76 = mul nsw i32 %75, %7
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %6, i64 %77
  %79 = mul nsw i32 %18, %13
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %12, i64 %80
  %82 = mul nsw i32 %18, %9
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %8, i64 %83
  %85 = mul nsw i32 %18, %11
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %10, i64 %86
  br i1 %26, label %88, label %97

88:                                               ; preds = %73
  %89 = icmp sgt i32 %3, 0
  %90 = and i32 %3, 7
  %91 = icmp ult i32 %3, 8
  %92 = and i32 %3, -8
  %93 = icmp eq i32 %90, 0
  br label %94

94:                                               ; preds = %88, %192
  %95 = phi i32 [ 0, %88 ], [ %193, %192 ]
  br i1 %89, label %96, label %192

96:                                               ; preds = %94
  br i1 %91, label %178, label %117

97:                                               ; preds = %192, %73
  %98 = icmp sgt i32 %3, 0
  br i1 %98, label %99, label %542

99:                                               ; preds = %97
  %100 = add i32 %2, -1
  %101 = and i32 %2, 7
  %102 = icmp ult i32 %100, 7
  %103 = and i32 %2, -8
  %104 = icmp eq i32 %101, 0
  %105 = and i32 %2, 7
  %106 = icmp ult i32 %100, 7
  %107 = and i32 %2, -8
  %108 = icmp eq i32 %105, 0
  %109 = and i32 %2, 7
  %110 = icmp ult i32 %100, 7
  %111 = and i32 %2, -8
  %112 = icmp eq i32 %109, 0
  %113 = and i32 %2, 7
  %114 = icmp ult i32 %100, 7
  %115 = and i32 %2, -8
  %116 = icmp eq i32 %113, 0
  br label %195

117:                                              ; preds = %96, %117
  %118 = phi i32 [ %175, %117 ], [ 0, %96 ]
  %119 = phi i32 [ %176, %117 ], [ 0, %96 ]
  %120 = mul nsw i32 %118, %2
  %121 = add nsw i32 %120, %95
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %25, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5
  %125 = getelementptr inbounds float, float addrspace(1)* %84, i64 %122
  store float %124, float addrspace(1)* %125, align 4, !tbaa !5
  %126 = or i32 %118, 1
  %127 = mul nsw i32 %126, %2
  %128 = add nsw i32 %127, %95
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %25, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5
  %132 = getelementptr inbounds float, float addrspace(1)* %84, i64 %129
  store float %131, float addrspace(1)* %132, align 4, !tbaa !5
  %133 = or i32 %118, 2
  %134 = mul nsw i32 %133, %2
  %135 = add nsw i32 %134, %95
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %25, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5
  %139 = getelementptr inbounds float, float addrspace(1)* %84, i64 %136
  store float %138, float addrspace(1)* %139, align 4, !tbaa !5
  %140 = or i32 %118, 3
  %141 = mul nsw i32 %140, %2
  %142 = add nsw i32 %141, %95
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %25, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !5
  %146 = getelementptr inbounds float, float addrspace(1)* %84, i64 %143
  store float %145, float addrspace(1)* %146, align 4, !tbaa !5
  %147 = or i32 %118, 4
  %148 = mul nsw i32 %147, %2
  %149 = add nsw i32 %148, %95
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %25, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !5
  %153 = getelementptr inbounds float, float addrspace(1)* %84, i64 %150
  store float %152, float addrspace(1)* %153, align 4, !tbaa !5
  %154 = or i32 %118, 5
  %155 = mul nsw i32 %154, %2
  %156 = add nsw i32 %155, %95
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %25, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !5
  %160 = getelementptr inbounds float, float addrspace(1)* %84, i64 %157
  store float %159, float addrspace(1)* %160, align 4, !tbaa !5
  %161 = or i32 %118, 6
  %162 = mul nsw i32 %161, %2
  %163 = add nsw i32 %162, %95
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %25, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5
  %167 = getelementptr inbounds float, float addrspace(1)* %84, i64 %164
  store float %166, float addrspace(1)* %167, align 4, !tbaa !5
  %168 = or i32 %118, 7
  %169 = mul nsw i32 %168, %2
  %170 = add nsw i32 %169, %95
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %25, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !5
  %174 = getelementptr inbounds float, float addrspace(1)* %84, i64 %171
  store float %173, float addrspace(1)* %174, align 4, !tbaa !5
  %175 = add nuw nsw i32 %118, 8
  %176 = add i32 %119, 8
  %177 = icmp eq i32 %176, %92
  br i1 %177, label %178, label %117, !llvm.loop !13

178:                                              ; preds = %117, %96
  %179 = phi i32 [ 0, %96 ], [ %175, %117 ]
  br i1 %93, label %192, label %180

180:                                              ; preds = %178, %180
  %181 = phi i32 [ %189, %180 ], [ %179, %178 ]
  %182 = phi i32 [ %190, %180 ], [ 0, %178 ]
  %183 = mul nsw i32 %181, %2
  %184 = add nsw i32 %183, %95
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %25, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !5
  %188 = getelementptr inbounds float, float addrspace(1)* %84, i64 %185
  store float %187, float addrspace(1)* %188, align 4, !tbaa !5
  %189 = add nuw nsw i32 %181, 1
  %190 = add i32 %182, 1
  %191 = icmp eq i32 %190, %90
  br i1 %191, label %192, label %180, !llvm.loop !14

192:                                              ; preds = %178, %180, %94
  %193 = add nuw nsw i32 %95, 1
  %194 = icmp eq i32 %193, %2
  br i1 %194, label %97, label %94, !llvm.loop !15

195:                                              ; preds = %99, %539
  %196 = phi i32 [ %540, %539 ], [ 0, %99 ]
  %197 = mul nsw i32 %196, %2
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %84, i64 %198
  %200 = icmp eq i32 %196, 0
  br i1 %200, label %201, label %203

201:                                              ; preds = %384, %195
  br i1 %26, label %202, label %457

202:                                              ; preds = %201
  br i1 %110, label %441, label %387

203:                                              ; preds = %195, %384
  %204 = phi i32 [ %385, %384 ], [ 0, %195 ]
  %205 = mul nsw i32 %204, %2
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %84, i64 %206
  br i1 %26, label %208, label %227

208:                                              ; preds = %203
  br i1 %102, label %209, label %230

209:                                              ; preds = %230, %208
  %210 = phi float [ undef, %208 ], [ %296, %230 ]
  %211 = phi i32 [ 0, %208 ], [ %297, %230 ]
  %212 = phi float [ 0.000000e+00, %208 ], [ %296, %230 ]
  br i1 %104, label %227, label %213

213:                                              ; preds = %209, %213
  %214 = phi i32 [ %224, %213 ], [ %211, %209 ]
  %215 = phi float [ %223, %213 ], [ %212, %209 ]
  %216 = phi i32 [ %225, %213 ], [ 0, %209 ]
  %217 = zext i32 %214 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %207, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !5
  %220 = getelementptr inbounds float, float addrspace(1)* %199, i64 %217
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !5
  %222 = fmul contract float %219, %221
  %223 = fadd contract float %215, %222
  %224 = add nuw nsw i32 %214, 1
  %225 = add i32 %216, 1
  %226 = icmp eq i32 %225, %101
  br i1 %226, label %227, label %213, !llvm.loop !16

227:                                              ; preds = %209, %213, %203
  %228 = phi float [ 0.000000e+00, %203 ], [ %210, %209 ], [ %223, %213 ]
  br i1 %26, label %229, label %384

229:                                              ; preds = %227
  br i1 %106, label %369, label %300

230:                                              ; preds = %208, %230
  %231 = phi i32 [ %297, %230 ], [ 0, %208 ]
  %232 = phi float [ %296, %230 ], [ 0.000000e+00, %208 ]
  %233 = phi i32 [ %298, %230 ], [ 0, %208 ]
  %234 = zext i32 %231 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %207, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !5
  %237 = getelementptr inbounds float, float addrspace(1)* %199, i64 %234
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !5
  %239 = fmul contract float %236, %238
  %240 = fadd contract float %232, %239
  %241 = or i32 %231, 1
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %207, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !5
  %245 = getelementptr inbounds float, float addrspace(1)* %199, i64 %242
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !5
  %247 = fmul contract float %244, %246
  %248 = fadd contract float %240, %247
  %249 = or i32 %231, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %207, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !5
  %253 = getelementptr inbounds float, float addrspace(1)* %199, i64 %250
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !5
  %255 = fmul contract float %252, %254
  %256 = fadd contract float %248, %255
  %257 = or i32 %231, 3
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %207, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !5
  %261 = getelementptr inbounds float, float addrspace(1)* %199, i64 %258
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !5
  %263 = fmul contract float %260, %262
  %264 = fadd contract float %256, %263
  %265 = or i32 %231, 4
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %207, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !5
  %269 = getelementptr inbounds float, float addrspace(1)* %199, i64 %266
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !5
  %271 = fmul contract float %268, %270
  %272 = fadd contract float %264, %271
  %273 = or i32 %231, 5
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %207, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !5
  %277 = getelementptr inbounds float, float addrspace(1)* %199, i64 %274
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !5
  %279 = fmul contract float %276, %278
  %280 = fadd contract float %272, %279
  %281 = or i32 %231, 6
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %207, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !5
  %285 = getelementptr inbounds float, float addrspace(1)* %199, i64 %282
  %286 = load float, float addrspace(1)* %285, align 4, !tbaa !5
  %287 = fmul contract float %284, %286
  %288 = fadd contract float %280, %287
  %289 = or i32 %231, 7
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(1)* %207, i64 %290
  %292 = load float, float addrspace(1)* %291, align 4, !tbaa !5
  %293 = getelementptr inbounds float, float addrspace(1)* %199, i64 %290
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !5
  %295 = fmul contract float %292, %294
  %296 = fadd contract float %288, %295
  %297 = add nuw nsw i32 %231, 8
  %298 = add i32 %233, 8
  %299 = icmp eq i32 %298, %103
  br i1 %299, label %209, label %230, !llvm.loop !17

300:                                              ; preds = %229, %300
  %301 = phi i32 [ %366, %300 ], [ 0, %229 ]
  %302 = phi i32 [ %367, %300 ], [ 0, %229 ]
  %303 = zext i32 %301 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %207, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !5
  %306 = fmul contract float %228, %305
  %307 = getelementptr inbounds float, float addrspace(1)* %199, i64 %303
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !5
  %309 = fsub contract float %308, %306
  store float %309, float addrspace(1)* %307, align 4, !tbaa !5
  %310 = or i32 %301, 1
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %207, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !5
  %314 = fmul contract float %228, %313
  %315 = getelementptr inbounds float, float addrspace(1)* %199, i64 %311
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !5
  %317 = fsub contract float %316, %314
  store float %317, float addrspace(1)* %315, align 4, !tbaa !5
  %318 = or i32 %301, 2
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %207, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !5
  %322 = fmul contract float %228, %321
  %323 = getelementptr inbounds float, float addrspace(1)* %199, i64 %319
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !5
  %325 = fsub contract float %324, %322
  store float %325, float addrspace(1)* %323, align 4, !tbaa !5
  %326 = or i32 %301, 3
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %207, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !5
  %330 = fmul contract float %228, %329
  %331 = getelementptr inbounds float, float addrspace(1)* %199, i64 %327
  %332 = load float, float addrspace(1)* %331, align 4, !tbaa !5
  %333 = fsub contract float %332, %330
  store float %333, float addrspace(1)* %331, align 4, !tbaa !5
  %334 = or i32 %301, 4
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(1)* %207, i64 %335
  %337 = load float, float addrspace(1)* %336, align 4, !tbaa !5
  %338 = fmul contract float %228, %337
  %339 = getelementptr inbounds float, float addrspace(1)* %199, i64 %335
  %340 = load float, float addrspace(1)* %339, align 4, !tbaa !5
  %341 = fsub contract float %340, %338
  store float %341, float addrspace(1)* %339, align 4, !tbaa !5
  %342 = or i32 %301, 5
  %343 = zext i32 %342 to i64
  %344 = getelementptr inbounds float, float addrspace(1)* %207, i64 %343
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !5
  %346 = fmul contract float %228, %345
  %347 = getelementptr inbounds float, float addrspace(1)* %199, i64 %343
  %348 = load float, float addrspace(1)* %347, align 4, !tbaa !5
  %349 = fsub contract float %348, %346
  store float %349, float addrspace(1)* %347, align 4, !tbaa !5
  %350 = or i32 %301, 6
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %207, i64 %351
  %353 = load float, float addrspace(1)* %352, align 4, !tbaa !5
  %354 = fmul contract float %228, %353
  %355 = getelementptr inbounds float, float addrspace(1)* %199, i64 %351
  %356 = load float, float addrspace(1)* %355, align 4, !tbaa !5
  %357 = fsub contract float %356, %354
  store float %357, float addrspace(1)* %355, align 4, !tbaa !5
  %358 = or i32 %301, 7
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds float, float addrspace(1)* %207, i64 %359
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !5
  %362 = fmul contract float %228, %361
  %363 = getelementptr inbounds float, float addrspace(1)* %199, i64 %359
  %364 = load float, float addrspace(1)* %363, align 4, !tbaa !5
  %365 = fsub contract float %364, %362
  store float %365, float addrspace(1)* %363, align 4, !tbaa !5
  %366 = add nuw nsw i32 %301, 8
  %367 = add i32 %302, 8
  %368 = icmp eq i32 %367, %107
  br i1 %368, label %369, label %300, !llvm.loop !18

369:                                              ; preds = %300, %229
  %370 = phi i32 [ 0, %229 ], [ %366, %300 ]
  br i1 %108, label %384, label %371

371:                                              ; preds = %369, %371
  %372 = phi i32 [ %381, %371 ], [ %370, %369 ]
  %373 = phi i32 [ %382, %371 ], [ 0, %369 ]
  %374 = zext i32 %372 to i64
  %375 = getelementptr inbounds float, float addrspace(1)* %207, i64 %374
  %376 = load float, float addrspace(1)* %375, align 4, !tbaa !5
  %377 = fmul contract float %228, %376
  %378 = getelementptr inbounds float, float addrspace(1)* %199, i64 %374
  %379 = load float, float addrspace(1)* %378, align 4, !tbaa !5
  %380 = fsub contract float %379, %377
  store float %380, float addrspace(1)* %378, align 4, !tbaa !5
  %381 = add nuw nsw i32 %372, 1
  %382 = add i32 %373, 1
  %383 = icmp eq i32 %382, %105
  br i1 %383, label %384, label %371, !llvm.loop !19

384:                                              ; preds = %369, %371, %227
  %385 = add nuw nsw i32 %204, 1
  %386 = icmp ult i32 %385, %196
  br i1 %386, label %203, label %201, !llvm.loop !20

387:                                              ; preds = %202, %387
  %388 = phi i32 [ %438, %387 ], [ 0, %202 ]
  %389 = phi float [ %437, %387 ], [ 0.000000e+00, %202 ]
  %390 = phi i32 [ %439, %387 ], [ 0, %202 ]
  %391 = zext i32 %388 to i64
  %392 = getelementptr inbounds float, float addrspace(1)* %199, i64 %391
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !5
  %394 = fmul contract float %393, %393
  %395 = fadd contract float %389, %394
  %396 = or i32 %388, 1
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds float, float addrspace(1)* %199, i64 %397
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !5
  %400 = fmul contract float %399, %399
  %401 = fadd contract float %395, %400
  %402 = or i32 %388, 2
  %403 = zext i32 %402 to i64
  %404 = getelementptr inbounds float, float addrspace(1)* %199, i64 %403
  %405 = load float, float addrspace(1)* %404, align 4, !tbaa !5
  %406 = fmul contract float %405, %405
  %407 = fadd contract float %401, %406
  %408 = or i32 %388, 3
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %199, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !5
  %412 = fmul contract float %411, %411
  %413 = fadd contract float %407, %412
  %414 = or i32 %388, 4
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(1)* %199, i64 %415
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !5
  %418 = fmul contract float %417, %417
  %419 = fadd contract float %413, %418
  %420 = or i32 %388, 5
  %421 = zext i32 %420 to i64
  %422 = getelementptr inbounds float, float addrspace(1)* %199, i64 %421
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !5
  %424 = fmul contract float %423, %423
  %425 = fadd contract float %419, %424
  %426 = or i32 %388, 6
  %427 = zext i32 %426 to i64
  %428 = getelementptr inbounds float, float addrspace(1)* %199, i64 %427
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !5
  %430 = fmul contract float %429, %429
  %431 = fadd contract float %425, %430
  %432 = or i32 %388, 7
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, float addrspace(1)* %199, i64 %433
  %435 = load float, float addrspace(1)* %434, align 4, !tbaa !5
  %436 = fmul contract float %435, %435
  %437 = fadd contract float %431, %436
  %438 = add nuw nsw i32 %388, 8
  %439 = add i32 %390, 8
  %440 = icmp eq i32 %439, %111
  br i1 %440, label %441, label %387, !llvm.loop !21

441:                                              ; preds = %387, %202
  %442 = phi float [ undef, %202 ], [ %437, %387 ]
  %443 = phi i32 [ 0, %202 ], [ %438, %387 ]
  %444 = phi float [ 0.000000e+00, %202 ], [ %437, %387 ]
  br i1 %112, label %457, label %445

445:                                              ; preds = %441, %445
  %446 = phi i32 [ %454, %445 ], [ %443, %441 ]
  %447 = phi float [ %453, %445 ], [ %444, %441 ]
  %448 = phi i32 [ %455, %445 ], [ 0, %441 ]
  %449 = zext i32 %446 to i64
  %450 = getelementptr inbounds float, float addrspace(1)* %199, i64 %449
  %451 = load float, float addrspace(1)* %450, align 4, !tbaa !5
  %452 = fmul contract float %451, %451
  %453 = fadd contract float %447, %452
  %454 = add nuw nsw i32 %446, 1
  %455 = add i32 %448, 1
  %456 = icmp eq i32 %455, %109
  br i1 %456, label %457, label %445, !llvm.loop !22

457:                                              ; preds = %441, %445, %201
  %458 = phi float [ 0.000000e+00, %201 ], [ %442, %441 ], [ %453, %445 ]
  %459 = fcmp olt float %458, 0x39F0000000000000
  %460 = select i1 %459, float 0x41F0000000000000, float 1.000000e+00
  %461 = fmul float %458, %460
  %462 = tail call float @llvm.sqrt.f32(float %461)
  %463 = bitcast float %462 to i32
  %464 = add nsw i32 %463, -1
  %465 = bitcast i32 %464 to float
  %466 = add nsw i32 %463, 1
  %467 = bitcast i32 %466 to float
  %468 = tail call i1 @llvm.amdgcn.class.f32(float %461, i32 608)
  %469 = select i1 %459, float 0x3EF0000000000000, float 1.000000e+00
  %470 = fneg float %467
  %471 = tail call float @llvm.fma.f32(float %470, float %462, float %461)
  %472 = fcmp ogt float %471, 0.000000e+00
  %473 = fneg float %465
  %474 = tail call float @llvm.fma.f32(float %473, float %462, float %461)
  %475 = fcmp ole float %474, 0.000000e+00
  %476 = select i1 %475, float %465, float %462
  %477 = select i1 %472, float %467, float %476
  %478 = fmul float %469, %477
  %479 = select i1 %468, float %461, float %478
  %480 = fdiv contract float 1.000000e+00, %479
  br i1 %26, label %481, label %539

481:                                              ; preds = %457
  br i1 %114, label %527, label %482

482:                                              ; preds = %481, %482
  %483 = phi i32 [ %524, %482 ], [ 0, %481 ]
  %484 = phi i32 [ %525, %482 ], [ 0, %481 ]
  %485 = zext i32 %483 to i64
  %486 = getelementptr inbounds float, float addrspace(1)* %199, i64 %485
  %487 = load float, float addrspace(1)* %486, align 4, !tbaa !5
  %488 = fmul contract float %480, %487
  store float %488, float addrspace(1)* %486, align 4, !tbaa !5
  %489 = or i32 %483, 1
  %490 = zext i32 %489 to i64
  %491 = getelementptr inbounds float, float addrspace(1)* %199, i64 %490
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !5
  %493 = fmul contract float %480, %492
  store float %493, float addrspace(1)* %491, align 4, !tbaa !5
  %494 = or i32 %483, 2
  %495 = zext i32 %494 to i64
  %496 = getelementptr inbounds float, float addrspace(1)* %199, i64 %495
  %497 = load float, float addrspace(1)* %496, align 4, !tbaa !5
  %498 = fmul contract float %480, %497
  store float %498, float addrspace(1)* %496, align 4, !tbaa !5
  %499 = or i32 %483, 3
  %500 = zext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %199, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !5
  %503 = fmul contract float %480, %502
  store float %503, float addrspace(1)* %501, align 4, !tbaa !5
  %504 = or i32 %483, 4
  %505 = zext i32 %504 to i64
  %506 = getelementptr inbounds float, float addrspace(1)* %199, i64 %505
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !5
  %508 = fmul contract float %480, %507
  store float %508, float addrspace(1)* %506, align 4, !tbaa !5
  %509 = or i32 %483, 5
  %510 = zext i32 %509 to i64
  %511 = getelementptr inbounds float, float addrspace(1)* %199, i64 %510
  %512 = load float, float addrspace(1)* %511, align 4, !tbaa !5
  %513 = fmul contract float %480, %512
  store float %513, float addrspace(1)* %511, align 4, !tbaa !5
  %514 = or i32 %483, 6
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, float addrspace(1)* %199, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !5
  %518 = fmul contract float %480, %517
  store float %518, float addrspace(1)* %516, align 4, !tbaa !5
  %519 = or i32 %483, 7
  %520 = zext i32 %519 to i64
  %521 = getelementptr inbounds float, float addrspace(1)* %199, i64 %520
  %522 = load float, float addrspace(1)* %521, align 4, !tbaa !5
  %523 = fmul contract float %480, %522
  store float %523, float addrspace(1)* %521, align 4, !tbaa !5
  %524 = add nuw nsw i32 %483, 8
  %525 = add i32 %484, 8
  %526 = icmp eq i32 %525, %115
  br i1 %526, label %527, label %482, !llvm.loop !23

527:                                              ; preds = %482, %481
  %528 = phi i32 [ 0, %481 ], [ %524, %482 ]
  br i1 %116, label %539, label %529

529:                                              ; preds = %527, %529
  %530 = phi i32 [ %536, %529 ], [ %528, %527 ]
  %531 = phi i32 [ %537, %529 ], [ 0, %527 ]
  %532 = zext i32 %530 to i64
  %533 = getelementptr inbounds float, float addrspace(1)* %199, i64 %532
  %534 = load float, float addrspace(1)* %533, align 4, !tbaa !5
  %535 = fmul contract float %480, %534
  store float %535, float addrspace(1)* %533, align 4, !tbaa !5
  %536 = add nuw nsw i32 %530, 1
  %537 = add i32 %531, 1
  %538 = icmp eq i32 %537, %113
  br i1 %538, label %539, label %529, !llvm.loop !24

539:                                              ; preds = %527, %529, %457
  %540 = add nuw nsw i32 %196, 1
  %541 = icmp eq i32 %540, %3
  br i1 %541, label %542, label %195, !llvm.loop !25

542:                                              ; preds = %539, %97
  %543 = add nsw i32 %3, -1
  br i1 %98, label %544, label %886

544:                                              ; preds = %542
  %545 = add i32 %2, -1
  %546 = and i32 %2, 7
  %547 = icmp ult i32 %545, 7
  %548 = and i32 %2, -8
  %549 = icmp eq i32 %546, 0
  %550 = and i32 %2, 7
  %551 = icmp ult i32 %545, 7
  %552 = and i32 %2, -8
  %553 = icmp eq i32 %550, 0
  br label %554

554:                                              ; preds = %544, %873
  %555 = phi i32 [ 0, %544 ], [ %885, %873 ]
  %556 = phi i32 [ %543, %544 ], [ %883, %873 ]
  %557 = add i32 %555, -1
  %558 = mul nsw i32 %556, %2
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds float, float addrspace(1)* %84, i64 %559
  br label %563

561:                                              ; preds = %657
  br i1 %26, label %562, label %683

562:                                              ; preds = %561
  br i1 %551, label %665, label %711

563:                                              ; preds = %554, %657
  %564 = phi i32 [ %663, %657 ], [ 0, %554 ]
  %565 = mul nsw i32 %564, %2
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds float, float addrspace(1)* %25, i64 %566
  br i1 %26, label %568, label %657

568:                                              ; preds = %563
  br i1 %547, label %639, label %569

569:                                              ; preds = %568, %569
  %570 = phi i32 [ %636, %569 ], [ 0, %568 ]
  %571 = phi float [ %635, %569 ], [ 0.000000e+00, %568 ]
  %572 = phi i32 [ %637, %569 ], [ 0, %568 ]
  %573 = zext i32 %570 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %560, i64 %573
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !5
  %576 = getelementptr inbounds float, float addrspace(1)* %567, i64 %573
  %577 = load float, float addrspace(1)* %576, align 4, !tbaa !5
  %578 = fmul contract float %575, %577
  %579 = fadd contract float %571, %578
  %580 = or i32 %570, 1
  %581 = zext i32 %580 to i64
  %582 = getelementptr inbounds float, float addrspace(1)* %560, i64 %581
  %583 = load float, float addrspace(1)* %582, align 4, !tbaa !5
  %584 = getelementptr inbounds float, float addrspace(1)* %567, i64 %581
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !5
  %586 = fmul contract float %583, %585
  %587 = fadd contract float %579, %586
  %588 = or i32 %570, 2
  %589 = zext i32 %588 to i64
  %590 = getelementptr inbounds float, float addrspace(1)* %560, i64 %589
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !5
  %592 = getelementptr inbounds float, float addrspace(1)* %567, i64 %589
  %593 = load float, float addrspace(1)* %592, align 4, !tbaa !5
  %594 = fmul contract float %591, %593
  %595 = fadd contract float %587, %594
  %596 = or i32 %570, 3
  %597 = zext i32 %596 to i64
  %598 = getelementptr inbounds float, float addrspace(1)* %560, i64 %597
  %599 = load float, float addrspace(1)* %598, align 4, !tbaa !5
  %600 = getelementptr inbounds float, float addrspace(1)* %567, i64 %597
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !5
  %602 = fmul contract float %599, %601
  %603 = fadd contract float %595, %602
  %604 = or i32 %570, 4
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds float, float addrspace(1)* %560, i64 %605
  %607 = load float, float addrspace(1)* %606, align 4, !tbaa !5
  %608 = getelementptr inbounds float, float addrspace(1)* %567, i64 %605
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !5
  %610 = fmul contract float %607, %609
  %611 = fadd contract float %603, %610
  %612 = or i32 %570, 5
  %613 = zext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %560, i64 %613
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !5
  %616 = getelementptr inbounds float, float addrspace(1)* %567, i64 %613
  %617 = load float, float addrspace(1)* %616, align 4, !tbaa !5
  %618 = fmul contract float %615, %617
  %619 = fadd contract float %611, %618
  %620 = or i32 %570, 6
  %621 = zext i32 %620 to i64
  %622 = getelementptr inbounds float, float addrspace(1)* %560, i64 %621
  %623 = load float, float addrspace(1)* %622, align 4, !tbaa !5
  %624 = getelementptr inbounds float, float addrspace(1)* %567, i64 %621
  %625 = load float, float addrspace(1)* %624, align 4, !tbaa !5
  %626 = fmul contract float %623, %625
  %627 = fadd contract float %619, %626
  %628 = or i32 %570, 7
  %629 = zext i32 %628 to i64
  %630 = getelementptr inbounds float, float addrspace(1)* %560, i64 %629
  %631 = load float, float addrspace(1)* %630, align 4, !tbaa !5
  %632 = getelementptr inbounds float, float addrspace(1)* %567, i64 %629
  %633 = load float, float addrspace(1)* %632, align 4, !tbaa !5
  %634 = fmul contract float %631, %633
  %635 = fadd contract float %627, %634
  %636 = add nuw nsw i32 %570, 8
  %637 = add i32 %572, 8
  %638 = icmp eq i32 %637, %548
  br i1 %638, label %639, label %569, !llvm.loop !26

639:                                              ; preds = %569, %568
  %640 = phi float [ undef, %568 ], [ %635, %569 ]
  %641 = phi i32 [ 0, %568 ], [ %636, %569 ]
  %642 = phi float [ 0.000000e+00, %568 ], [ %635, %569 ]
  br i1 %549, label %657, label %643

643:                                              ; preds = %639, %643
  %644 = phi i32 [ %654, %643 ], [ %641, %639 ]
  %645 = phi float [ %653, %643 ], [ %642, %639 ]
  %646 = phi i32 [ %655, %643 ], [ 0, %639 ]
  %647 = zext i32 %644 to i64
  %648 = getelementptr inbounds float, float addrspace(1)* %560, i64 %647
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !5
  %650 = getelementptr inbounds float, float addrspace(1)* %567, i64 %647
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !5
  %652 = fmul contract float %649, %651
  %653 = fadd contract float %645, %652
  %654 = add nuw nsw i32 %644, 1
  %655 = add i32 %646, 1
  %656 = icmp eq i32 %655, %546
  br i1 %656, label %657, label %643, !llvm.loop !27

657:                                              ; preds = %639, %643, %563
  %658 = phi float [ 0.000000e+00, %563 ], [ %640, %639 ], [ %653, %643 ]
  %659 = mul nsw i32 %564, %3
  %660 = add nsw i32 %659, %556
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds float, float addrspace(1)* %87, i64 %661
  store float %658, float addrspace(1)* %662, align 4, !tbaa !5
  %663 = add nuw nsw i32 %564, 1
  %664 = icmp eq i32 %663, %3
  br i1 %664, label %561, label %563, !llvm.loop !28

665:                                              ; preds = %711, %562
  %666 = phi float [ undef, %562 ], [ %777, %711 ]
  %667 = phi i32 [ 0, %562 ], [ %778, %711 ]
  %668 = phi float [ 0.000000e+00, %562 ], [ %777, %711 ]
  br i1 %553, label %683, label %669

669:                                              ; preds = %665, %669
  %670 = phi i32 [ %680, %669 ], [ %667, %665 ]
  %671 = phi float [ %679, %669 ], [ %668, %665 ]
  %672 = phi i32 [ %681, %669 ], [ 0, %665 ]
  %673 = zext i32 %670 to i64
  %674 = getelementptr inbounds float, float addrspace(1)* %560, i64 %673
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !5
  %676 = getelementptr inbounds float, float addrspace(1)* %78, i64 %673
  %677 = load float, float addrspace(1)* %676, align 4, !tbaa !5
  %678 = fmul contract float %675, %677
  %679 = fadd contract float %671, %678
  %680 = add nuw nsw i32 %670, 1
  %681 = add i32 %672, 1
  %682 = icmp eq i32 %681, %550
  br i1 %682, label %683, label %669, !llvm.loop !29

683:                                              ; preds = %665, %669, %561
  %684 = phi float [ 0.000000e+00, %561 ], [ %666, %665 ], [ %679, %669 ]
  %685 = icmp sgt i32 %543, %556
  br i1 %685, label %686, label %873

686:                                              ; preds = %683
  %687 = and i32 %555, 7
  %688 = icmp eq i32 %687, 0
  br i1 %688, label %706, label %689

689:                                              ; preds = %686, %689
  %690 = phi i32 [ %703, %689 ], [ %543, %686 ]
  %691 = phi float [ %702, %689 ], [ %684, %686 ]
  %692 = phi i32 [ %704, %689 ], [ 0, %686 ]
  %693 = mul nsw i32 %690, %3
  %694 = add nsw i32 %693, %556
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds float, float addrspace(1)* %87, i64 %695
  %697 = load float, float addrspace(1)* %696, align 4, !tbaa !5
  %698 = zext i32 %690 to i64
  %699 = getelementptr inbounds float, float addrspace(1)* %81, i64 %698
  %700 = load float, float addrspace(1)* %699, align 4, !tbaa !5
  %701 = fmul contract float %697, %700
  %702 = fsub contract float %691, %701
  %703 = add nsw i32 %690, -1
  %704 = add i32 %692, 1
  %705 = icmp eq i32 %704, %687
  br i1 %705, label %706, label %689, !llvm.loop !30

706:                                              ; preds = %689, %686
  %707 = phi i32 [ %543, %686 ], [ %703, %689 ]
  %708 = phi float [ %684, %686 ], [ %702, %689 ]
  %709 = phi float [ undef, %686 ], [ %702, %689 ]
  %710 = icmp ult i32 %557, 7
  br i1 %710, label %873, label %781

711:                                              ; preds = %562, %711
  %712 = phi i32 [ %778, %711 ], [ 0, %562 ]
  %713 = phi float [ %777, %711 ], [ 0.000000e+00, %562 ]
  %714 = phi i32 [ %779, %711 ], [ 0, %562 ]
  %715 = zext i32 %712 to i64
  %716 = getelementptr inbounds float, float addrspace(1)* %560, i64 %715
  %717 = load float, float addrspace(1)* %716, align 4, !tbaa !5
  %718 = getelementptr inbounds float, float addrspace(1)* %78, i64 %715
  %719 = load float, float addrspace(1)* %718, align 4, !tbaa !5
  %720 = fmul contract float %717, %719
  %721 = fadd contract float %713, %720
  %722 = or i32 %712, 1
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, float addrspace(1)* %560, i64 %723
  %725 = load float, float addrspace(1)* %724, align 4, !tbaa !5
  %726 = getelementptr inbounds float, float addrspace(1)* %78, i64 %723
  %727 = load float, float addrspace(1)* %726, align 4, !tbaa !5
  %728 = fmul contract float %725, %727
  %729 = fadd contract float %721, %728
  %730 = or i32 %712, 2
  %731 = zext i32 %730 to i64
  %732 = getelementptr inbounds float, float addrspace(1)* %560, i64 %731
  %733 = load float, float addrspace(1)* %732, align 4, !tbaa !5
  %734 = getelementptr inbounds float, float addrspace(1)* %78, i64 %731
  %735 = load float, float addrspace(1)* %734, align 4, !tbaa !5
  %736 = fmul contract float %733, %735
  %737 = fadd contract float %729, %736
  %738 = or i32 %712, 3
  %739 = zext i32 %738 to i64
  %740 = getelementptr inbounds float, float addrspace(1)* %560, i64 %739
  %741 = load float, float addrspace(1)* %740, align 4, !tbaa !5
  %742 = getelementptr inbounds float, float addrspace(1)* %78, i64 %739
  %743 = load float, float addrspace(1)* %742, align 4, !tbaa !5
  %744 = fmul contract float %741, %743
  %745 = fadd contract float %737, %744
  %746 = or i32 %712, 4
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, float addrspace(1)* %560, i64 %747
  %749 = load float, float addrspace(1)* %748, align 4, !tbaa !5
  %750 = getelementptr inbounds float, float addrspace(1)* %78, i64 %747
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !5
  %752 = fmul contract float %749, %751
  %753 = fadd contract float %745, %752
  %754 = or i32 %712, 5
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, float addrspace(1)* %560, i64 %755
  %757 = load float, float addrspace(1)* %756, align 4, !tbaa !5
  %758 = getelementptr inbounds float, float addrspace(1)* %78, i64 %755
  %759 = load float, float addrspace(1)* %758, align 4, !tbaa !5
  %760 = fmul contract float %757, %759
  %761 = fadd contract float %753, %760
  %762 = or i32 %712, 6
  %763 = zext i32 %762 to i64
  %764 = getelementptr inbounds float, float addrspace(1)* %560, i64 %763
  %765 = load float, float addrspace(1)* %764, align 4, !tbaa !5
  %766 = getelementptr inbounds float, float addrspace(1)* %78, i64 %763
  %767 = load float, float addrspace(1)* %766, align 4, !tbaa !5
  %768 = fmul contract float %765, %767
  %769 = fadd contract float %761, %768
  %770 = or i32 %712, 7
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, float addrspace(1)* %560, i64 %771
  %773 = load float, float addrspace(1)* %772, align 4, !tbaa !5
  %774 = getelementptr inbounds float, float addrspace(1)* %78, i64 %771
  %775 = load float, float addrspace(1)* %774, align 4, !tbaa !5
  %776 = fmul contract float %773, %775
  %777 = fadd contract float %769, %776
  %778 = add nuw nsw i32 %712, 8
  %779 = add i32 %714, 8
  %780 = icmp eq i32 %779, %552
  br i1 %780, label %665, label %711, !llvm.loop !31

781:                                              ; preds = %706, %781
  %782 = phi i32 [ %871, %781 ], [ %707, %706 ]
  %783 = phi float [ %870, %781 ], [ %708, %706 ]
  %784 = mul nsw i32 %782, %3
  %785 = add nsw i32 %784, %556
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds float, float addrspace(1)* %87, i64 %786
  %788 = load float, float addrspace(1)* %787, align 4, !tbaa !5
  %789 = zext i32 %782 to i64
  %790 = getelementptr inbounds float, float addrspace(1)* %81, i64 %789
  %791 = load float, float addrspace(1)* %790, align 4, !tbaa !5
  %792 = fmul contract float %788, %791
  %793 = fsub contract float %783, %792
  %794 = add nsw i32 %782, -1
  %795 = mul nsw i32 %794, %3
  %796 = add nsw i32 %795, %556
  %797 = sext i32 %796 to i64
  %798 = getelementptr inbounds float, float addrspace(1)* %87, i64 %797
  %799 = load float, float addrspace(1)* %798, align 4, !tbaa !5
  %800 = zext i32 %794 to i64
  %801 = getelementptr inbounds float, float addrspace(1)* %81, i64 %800
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !5
  %803 = fmul contract float %799, %802
  %804 = fsub contract float %793, %803
  %805 = add nsw i32 %782, -2
  %806 = mul nsw i32 %805, %3
  %807 = add nsw i32 %806, %556
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds float, float addrspace(1)* %87, i64 %808
  %810 = load float, float addrspace(1)* %809, align 4, !tbaa !5
  %811 = zext i32 %805 to i64
  %812 = getelementptr inbounds float, float addrspace(1)* %81, i64 %811
  %813 = load float, float addrspace(1)* %812, align 4, !tbaa !5
  %814 = fmul contract float %810, %813
  %815 = fsub contract float %804, %814
  %816 = add nsw i32 %782, -3
  %817 = mul nsw i32 %816, %3
  %818 = add nsw i32 %817, %556
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds float, float addrspace(1)* %87, i64 %819
  %821 = load float, float addrspace(1)* %820, align 4, !tbaa !5
  %822 = zext i32 %816 to i64
  %823 = getelementptr inbounds float, float addrspace(1)* %81, i64 %822
  %824 = load float, float addrspace(1)* %823, align 4, !tbaa !5
  %825 = fmul contract float %821, %824
  %826 = fsub contract float %815, %825
  %827 = add nsw i32 %782, -4
  %828 = mul nsw i32 %827, %3
  %829 = add nsw i32 %828, %556
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds float, float addrspace(1)* %87, i64 %830
  %832 = load float, float addrspace(1)* %831, align 4, !tbaa !5
  %833 = zext i32 %827 to i64
  %834 = getelementptr inbounds float, float addrspace(1)* %81, i64 %833
  %835 = load float, float addrspace(1)* %834, align 4, !tbaa !5
  %836 = fmul contract float %832, %835
  %837 = fsub contract float %826, %836
  %838 = add nsw i32 %782, -5
  %839 = mul nsw i32 %838, %3
  %840 = add nsw i32 %839, %556
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds float, float addrspace(1)* %87, i64 %841
  %843 = load float, float addrspace(1)* %842, align 4, !tbaa !5
  %844 = zext i32 %838 to i64
  %845 = getelementptr inbounds float, float addrspace(1)* %81, i64 %844
  %846 = load float, float addrspace(1)* %845, align 4, !tbaa !5
  %847 = fmul contract float %843, %846
  %848 = fsub contract float %837, %847
  %849 = add nsw i32 %782, -6
  %850 = mul nsw i32 %849, %3
  %851 = add nsw i32 %850, %556
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds float, float addrspace(1)* %87, i64 %852
  %854 = load float, float addrspace(1)* %853, align 4, !tbaa !5
  %855 = zext i32 %849 to i64
  %856 = getelementptr inbounds float, float addrspace(1)* %81, i64 %855
  %857 = load float, float addrspace(1)* %856, align 4, !tbaa !5
  %858 = fmul contract float %854, %857
  %859 = fsub contract float %848, %858
  %860 = add nsw i32 %782, -7
  %861 = mul nsw i32 %860, %3
  %862 = add nsw i32 %861, %556
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds float, float addrspace(1)* %87, i64 %863
  %865 = load float, float addrspace(1)* %864, align 4, !tbaa !5
  %866 = zext i32 %860 to i64
  %867 = getelementptr inbounds float, float addrspace(1)* %81, i64 %866
  %868 = load float, float addrspace(1)* %867, align 4, !tbaa !5
  %869 = fmul contract float %865, %868
  %870 = fsub contract float %859, %869
  %871 = add nsw i32 %782, -8
  %872 = icmp sgt i32 %871, %556
  br i1 %872, label %781, label %873, !llvm.loop !32

873:                                              ; preds = %706, %781, %683
  %874 = phi float [ %684, %683 ], [ %709, %706 ], [ %870, %781 ]
  %875 = mul nsw i32 %556, %3
  %876 = add nsw i32 %875, %556
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds float, float addrspace(1)* %87, i64 %877
  %879 = load float, float addrspace(1)* %878, align 4, !tbaa !5
  %880 = fdiv contract float %874, %879
  %881 = zext i32 %556 to i64
  %882 = getelementptr inbounds float, float addrspace(1)* %81, i64 %881
  store float %880, float addrspace(1)* %882, align 4, !tbaa !5
  %883 = add nsw i32 %556, -1
  %884 = icmp sgt i32 %556, 0
  %885 = add i32 %555, 1
  br i1 %884, label %554, label %886, !llvm.loop !33

886:                                              ; preds = %873, %542, %14
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !10}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !10}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !10}
!26 = distinct !{!26, !10}
!27 = distinct !{!27, !12}
!28 = distinct !{!28, !10}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !12}
!31 = distinct !{!31, !10}
!32 = distinct !{!32, !10}
!33 = distinct !{!33, !10}
