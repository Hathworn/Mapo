; ModuleID = '../data/hip_kernels/1/21/main.cu'
source_filename = "../data/hip_kernels/1/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15getUnrestrictediiiiPfiS_iS_iS_iS_i(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, float addrspace(1)* nocapture %8, i32 %9, float addrspace(1)* nocapture %10, i32 %11, float addrspace(1)* nocapture %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = shl i32 %15, 4
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = shl i32 %19, 4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %1
  %24 = icmp slt i32 %18, %0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %890

26:                                               ; preds = %14
  %27 = mul nsw i32 %22, %0
  %28 = add nsw i32 %27, %18
  %29 = mul nsw i32 %28, %5
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %32 = icmp sgt i32 %2, 0
  br i1 %32, label %33, label %79

33:                                               ; preds = %26
  %34 = add i32 %2, -1
  %35 = and i32 %2, 7
  %36 = icmp ult i32 %34, 7
  br i1 %36, label %68, label %37

37:                                               ; preds = %33
  %38 = and i32 %2, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %65, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %66, %39 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %31, i64 %42
  store float 1.000000e+00, float addrspace(1)* %43, align 4, !tbaa !5
  %44 = or i32 %40, 1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %31, i64 %45
  store float 1.000000e+00, float addrspace(1)* %46, align 4, !tbaa !5
  %47 = or i32 %40, 2
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %31, i64 %48
  store float 1.000000e+00, float addrspace(1)* %49, align 4, !tbaa !5
  %50 = or i32 %40, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %31, i64 %51
  store float 1.000000e+00, float addrspace(1)* %52, align 4, !tbaa !5
  %53 = or i32 %40, 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %31, i64 %54
  store float 1.000000e+00, float addrspace(1)* %55, align 4, !tbaa !5
  %56 = or i32 %40, 5
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %31, i64 %57
  store float 1.000000e+00, float addrspace(1)* %58, align 4, !tbaa !5
  %59 = or i32 %40, 6
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %31, i64 %60
  store float 1.000000e+00, float addrspace(1)* %61, align 4, !tbaa !5
  %62 = or i32 %40, 7
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %31, i64 %63
  store float 1.000000e+00, float addrspace(1)* %64, align 4, !tbaa !5
  %65 = add nuw nsw i32 %40, 8
  %66 = add i32 %41, 8
  %67 = icmp eq i32 %66, %38
  br i1 %67, label %68, label %39, !llvm.loop !9

68:                                               ; preds = %39, %33
  %69 = phi i32 [ 0, %33 ], [ %65, %39 ]
  %70 = icmp eq i32 %35, 0
  br i1 %70, label %79, label %71

71:                                               ; preds = %68, %71
  %72 = phi i32 [ %76, %71 ], [ %69, %68 ]
  %73 = phi i32 [ %77, %71 ], [ 0, %68 ]
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %31, i64 %74
  store float 1.000000e+00, float addrspace(1)* %75, align 4, !tbaa !5
  %76 = add nuw nsw i32 %72, 1
  %77 = add i32 %73, 1
  %78 = icmp eq i32 %77, %35
  br i1 %78, label %79, label %71, !llvm.loop !11

79:                                               ; preds = %68, %71, %26
  %80 = mul nsw i32 %28, %7
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %6, i64 %81
  %83 = mul nsw i32 %28, %13
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %12, i64 %84
  %86 = mul nsw i32 %28, %9
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %8, i64 %87
  %89 = mul nsw i32 %28, %11
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %10, i64 %90
  br i1 %32, label %92, label %101

92:                                               ; preds = %79
  %93 = icmp sgt i32 %3, 0
  %94 = and i32 %3, 7
  %95 = icmp ult i32 %3, 8
  %96 = and i32 %3, -8
  %97 = icmp eq i32 %94, 0
  br label %98

98:                                               ; preds = %92, %196
  %99 = phi i32 [ 0, %92 ], [ %197, %196 ]
  br i1 %93, label %100, label %196

100:                                              ; preds = %98
  br i1 %95, label %182, label %121

101:                                              ; preds = %196, %79
  %102 = icmp sgt i32 %3, 0
  br i1 %102, label %103, label %546

103:                                              ; preds = %101
  %104 = add i32 %2, -1
  %105 = and i32 %2, 7
  %106 = icmp ult i32 %104, 7
  %107 = and i32 %2, -8
  %108 = icmp eq i32 %105, 0
  %109 = and i32 %2, 7
  %110 = icmp ult i32 %104, 7
  %111 = and i32 %2, -8
  %112 = icmp eq i32 %109, 0
  %113 = and i32 %2, 7
  %114 = icmp ult i32 %104, 7
  %115 = and i32 %2, -8
  %116 = icmp eq i32 %113, 0
  %117 = and i32 %2, 7
  %118 = icmp ult i32 %104, 7
  %119 = and i32 %2, -8
  %120 = icmp eq i32 %117, 0
  br label %199

121:                                              ; preds = %100, %121
  %122 = phi i32 [ %179, %121 ], [ 0, %100 ]
  %123 = phi i32 [ %180, %121 ], [ 0, %100 ]
  %124 = mul nsw i32 %122, %2
  %125 = add nsw i32 %124, %99
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %31, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5
  %129 = getelementptr inbounds float, float addrspace(1)* %88, i64 %126
  store float %128, float addrspace(1)* %129, align 4, !tbaa !5
  %130 = or i32 %122, 1
  %131 = mul nsw i32 %130, %2
  %132 = add nsw i32 %131, %99
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %31, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5
  %136 = getelementptr inbounds float, float addrspace(1)* %88, i64 %133
  store float %135, float addrspace(1)* %136, align 4, !tbaa !5
  %137 = or i32 %122, 2
  %138 = mul nsw i32 %137, %2
  %139 = add nsw i32 %138, %99
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %31, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5
  %143 = getelementptr inbounds float, float addrspace(1)* %88, i64 %140
  store float %142, float addrspace(1)* %143, align 4, !tbaa !5
  %144 = or i32 %122, 3
  %145 = mul nsw i32 %144, %2
  %146 = add nsw i32 %145, %99
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %31, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5
  %150 = getelementptr inbounds float, float addrspace(1)* %88, i64 %147
  store float %149, float addrspace(1)* %150, align 4, !tbaa !5
  %151 = or i32 %122, 4
  %152 = mul nsw i32 %151, %2
  %153 = add nsw i32 %152, %99
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %31, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5
  %157 = getelementptr inbounds float, float addrspace(1)* %88, i64 %154
  store float %156, float addrspace(1)* %157, align 4, !tbaa !5
  %158 = or i32 %122, 5
  %159 = mul nsw i32 %158, %2
  %160 = add nsw i32 %159, %99
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %31, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5
  %164 = getelementptr inbounds float, float addrspace(1)* %88, i64 %161
  store float %163, float addrspace(1)* %164, align 4, !tbaa !5
  %165 = or i32 %122, 6
  %166 = mul nsw i32 %165, %2
  %167 = add nsw i32 %166, %99
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %31, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5
  %171 = getelementptr inbounds float, float addrspace(1)* %88, i64 %168
  store float %170, float addrspace(1)* %171, align 4, !tbaa !5
  %172 = or i32 %122, 7
  %173 = mul nsw i32 %172, %2
  %174 = add nsw i32 %173, %99
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %31, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !5
  %178 = getelementptr inbounds float, float addrspace(1)* %88, i64 %175
  store float %177, float addrspace(1)* %178, align 4, !tbaa !5
  %179 = add nuw nsw i32 %122, 8
  %180 = add i32 %123, 8
  %181 = icmp eq i32 %180, %96
  br i1 %181, label %182, label %121, !llvm.loop !13

182:                                              ; preds = %121, %100
  %183 = phi i32 [ 0, %100 ], [ %179, %121 ]
  br i1 %97, label %196, label %184

184:                                              ; preds = %182, %184
  %185 = phi i32 [ %193, %184 ], [ %183, %182 ]
  %186 = phi i32 [ %194, %184 ], [ 0, %182 ]
  %187 = mul nsw i32 %185, %2
  %188 = add nsw i32 %187, %99
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %31, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !5
  %192 = getelementptr inbounds float, float addrspace(1)* %88, i64 %189
  store float %191, float addrspace(1)* %192, align 4, !tbaa !5
  %193 = add nuw nsw i32 %185, 1
  %194 = add i32 %186, 1
  %195 = icmp eq i32 %194, %94
  br i1 %195, label %196, label %184, !llvm.loop !14

196:                                              ; preds = %182, %184, %98
  %197 = add nuw nsw i32 %99, 1
  %198 = icmp eq i32 %197, %2
  br i1 %198, label %101, label %98, !llvm.loop !15

199:                                              ; preds = %103, %543
  %200 = phi i32 [ %544, %543 ], [ 0, %103 ]
  %201 = mul nsw i32 %200, %2
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %88, i64 %202
  %204 = icmp eq i32 %200, 0
  br i1 %204, label %205, label %207

205:                                              ; preds = %388, %199
  br i1 %32, label %206, label %461

206:                                              ; preds = %205
  br i1 %114, label %445, label %391

207:                                              ; preds = %199, %388
  %208 = phi i32 [ %389, %388 ], [ 0, %199 ]
  %209 = mul nsw i32 %208, %2
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %88, i64 %210
  br i1 %32, label %212, label %231

212:                                              ; preds = %207
  br i1 %106, label %213, label %234

213:                                              ; preds = %234, %212
  %214 = phi float [ undef, %212 ], [ %300, %234 ]
  %215 = phi i32 [ 0, %212 ], [ %301, %234 ]
  %216 = phi float [ 0.000000e+00, %212 ], [ %300, %234 ]
  br i1 %108, label %231, label %217

217:                                              ; preds = %213, %217
  %218 = phi i32 [ %228, %217 ], [ %215, %213 ]
  %219 = phi float [ %227, %217 ], [ %216, %213 ]
  %220 = phi i32 [ %229, %217 ], [ 0, %213 ]
  %221 = zext i32 %218 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %211, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !5
  %224 = getelementptr inbounds float, float addrspace(1)* %203, i64 %221
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !5
  %226 = fmul contract float %223, %225
  %227 = fadd contract float %219, %226
  %228 = add nuw nsw i32 %218, 1
  %229 = add i32 %220, 1
  %230 = icmp eq i32 %229, %105
  br i1 %230, label %231, label %217, !llvm.loop !16

231:                                              ; preds = %213, %217, %207
  %232 = phi float [ 0.000000e+00, %207 ], [ %214, %213 ], [ %227, %217 ]
  br i1 %32, label %233, label %388

233:                                              ; preds = %231
  br i1 %110, label %373, label %304

234:                                              ; preds = %212, %234
  %235 = phi i32 [ %301, %234 ], [ 0, %212 ]
  %236 = phi float [ %300, %234 ], [ 0.000000e+00, %212 ]
  %237 = phi i32 [ %302, %234 ], [ 0, %212 ]
  %238 = zext i32 %235 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %211, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !5
  %241 = getelementptr inbounds float, float addrspace(1)* %203, i64 %238
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !5
  %243 = fmul contract float %240, %242
  %244 = fadd contract float %236, %243
  %245 = or i32 %235, 1
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %211, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !5
  %249 = getelementptr inbounds float, float addrspace(1)* %203, i64 %246
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !5
  %251 = fmul contract float %248, %250
  %252 = fadd contract float %244, %251
  %253 = or i32 %235, 2
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %211, i64 %254
  %256 = load float, float addrspace(1)* %255, align 4, !tbaa !5
  %257 = getelementptr inbounds float, float addrspace(1)* %203, i64 %254
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !5
  %259 = fmul contract float %256, %258
  %260 = fadd contract float %252, %259
  %261 = or i32 %235, 3
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %211, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !5
  %265 = getelementptr inbounds float, float addrspace(1)* %203, i64 %262
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !5
  %267 = fmul contract float %264, %266
  %268 = fadd contract float %260, %267
  %269 = or i32 %235, 4
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %211, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !5
  %273 = getelementptr inbounds float, float addrspace(1)* %203, i64 %270
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !5
  %275 = fmul contract float %272, %274
  %276 = fadd contract float %268, %275
  %277 = or i32 %235, 5
  %278 = zext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %211, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !5
  %281 = getelementptr inbounds float, float addrspace(1)* %203, i64 %278
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !5
  %283 = fmul contract float %280, %282
  %284 = fadd contract float %276, %283
  %285 = or i32 %235, 6
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %211, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !5
  %289 = getelementptr inbounds float, float addrspace(1)* %203, i64 %286
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !5
  %291 = fmul contract float %288, %290
  %292 = fadd contract float %284, %291
  %293 = or i32 %235, 7
  %294 = zext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %211, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !5
  %297 = getelementptr inbounds float, float addrspace(1)* %203, i64 %294
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !5
  %299 = fmul contract float %296, %298
  %300 = fadd contract float %292, %299
  %301 = add nuw nsw i32 %235, 8
  %302 = add i32 %237, 8
  %303 = icmp eq i32 %302, %107
  br i1 %303, label %213, label %234, !llvm.loop !17

304:                                              ; preds = %233, %304
  %305 = phi i32 [ %370, %304 ], [ 0, %233 ]
  %306 = phi i32 [ %371, %304 ], [ 0, %233 ]
  %307 = zext i32 %305 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %211, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !5
  %310 = fmul contract float %232, %309
  %311 = getelementptr inbounds float, float addrspace(1)* %203, i64 %307
  %312 = load float, float addrspace(1)* %311, align 4, !tbaa !5
  %313 = fsub contract float %312, %310
  store float %313, float addrspace(1)* %311, align 4, !tbaa !5
  %314 = or i32 %305, 1
  %315 = zext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(1)* %211, i64 %315
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !5
  %318 = fmul contract float %232, %317
  %319 = getelementptr inbounds float, float addrspace(1)* %203, i64 %315
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !5
  %321 = fsub contract float %320, %318
  store float %321, float addrspace(1)* %319, align 4, !tbaa !5
  %322 = or i32 %305, 2
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %211, i64 %323
  %325 = load float, float addrspace(1)* %324, align 4, !tbaa !5
  %326 = fmul contract float %232, %325
  %327 = getelementptr inbounds float, float addrspace(1)* %203, i64 %323
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !5
  %329 = fsub contract float %328, %326
  store float %329, float addrspace(1)* %327, align 4, !tbaa !5
  %330 = or i32 %305, 3
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %211, i64 %331
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !5
  %334 = fmul contract float %232, %333
  %335 = getelementptr inbounds float, float addrspace(1)* %203, i64 %331
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !5
  %337 = fsub contract float %336, %334
  store float %337, float addrspace(1)* %335, align 4, !tbaa !5
  %338 = or i32 %305, 4
  %339 = zext i32 %338 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %211, i64 %339
  %341 = load float, float addrspace(1)* %340, align 4, !tbaa !5
  %342 = fmul contract float %232, %341
  %343 = getelementptr inbounds float, float addrspace(1)* %203, i64 %339
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !5
  %345 = fsub contract float %344, %342
  store float %345, float addrspace(1)* %343, align 4, !tbaa !5
  %346 = or i32 %305, 5
  %347 = zext i32 %346 to i64
  %348 = getelementptr inbounds float, float addrspace(1)* %211, i64 %347
  %349 = load float, float addrspace(1)* %348, align 4, !tbaa !5
  %350 = fmul contract float %232, %349
  %351 = getelementptr inbounds float, float addrspace(1)* %203, i64 %347
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !5
  %353 = fsub contract float %352, %350
  store float %353, float addrspace(1)* %351, align 4, !tbaa !5
  %354 = or i32 %305, 6
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds float, float addrspace(1)* %211, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !5
  %358 = fmul contract float %232, %357
  %359 = getelementptr inbounds float, float addrspace(1)* %203, i64 %355
  %360 = load float, float addrspace(1)* %359, align 4, !tbaa !5
  %361 = fsub contract float %360, %358
  store float %361, float addrspace(1)* %359, align 4, !tbaa !5
  %362 = or i32 %305, 7
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds float, float addrspace(1)* %211, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !5
  %366 = fmul contract float %232, %365
  %367 = getelementptr inbounds float, float addrspace(1)* %203, i64 %363
  %368 = load float, float addrspace(1)* %367, align 4, !tbaa !5
  %369 = fsub contract float %368, %366
  store float %369, float addrspace(1)* %367, align 4, !tbaa !5
  %370 = add nuw nsw i32 %305, 8
  %371 = add i32 %306, 8
  %372 = icmp eq i32 %371, %111
  br i1 %372, label %373, label %304, !llvm.loop !18

373:                                              ; preds = %304, %233
  %374 = phi i32 [ 0, %233 ], [ %370, %304 ]
  br i1 %112, label %388, label %375

375:                                              ; preds = %373, %375
  %376 = phi i32 [ %385, %375 ], [ %374, %373 ]
  %377 = phi i32 [ %386, %375 ], [ 0, %373 ]
  %378 = zext i32 %376 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %211, i64 %378
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !5
  %381 = fmul contract float %232, %380
  %382 = getelementptr inbounds float, float addrspace(1)* %203, i64 %378
  %383 = load float, float addrspace(1)* %382, align 4, !tbaa !5
  %384 = fsub contract float %383, %381
  store float %384, float addrspace(1)* %382, align 4, !tbaa !5
  %385 = add nuw nsw i32 %376, 1
  %386 = add i32 %377, 1
  %387 = icmp eq i32 %386, %109
  br i1 %387, label %388, label %375, !llvm.loop !19

388:                                              ; preds = %373, %375, %231
  %389 = add nuw nsw i32 %208, 1
  %390 = icmp ult i32 %389, %200
  br i1 %390, label %207, label %205, !llvm.loop !20

391:                                              ; preds = %206, %391
  %392 = phi i32 [ %442, %391 ], [ 0, %206 ]
  %393 = phi float [ %441, %391 ], [ 0.000000e+00, %206 ]
  %394 = phi i32 [ %443, %391 ], [ 0, %206 ]
  %395 = zext i32 %392 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %203, i64 %395
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !5
  %398 = fmul contract float %397, %397
  %399 = fadd contract float %393, %398
  %400 = or i32 %392, 1
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %203, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !5
  %404 = fmul contract float %403, %403
  %405 = fadd contract float %399, %404
  %406 = or i32 %392, 2
  %407 = zext i32 %406 to i64
  %408 = getelementptr inbounds float, float addrspace(1)* %203, i64 %407
  %409 = load float, float addrspace(1)* %408, align 4, !tbaa !5
  %410 = fmul contract float %409, %409
  %411 = fadd contract float %405, %410
  %412 = or i32 %392, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, float addrspace(1)* %203, i64 %413
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !5
  %416 = fmul contract float %415, %415
  %417 = fadd contract float %411, %416
  %418 = or i32 %392, 4
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %203, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !5
  %422 = fmul contract float %421, %421
  %423 = fadd contract float %417, %422
  %424 = or i32 %392, 5
  %425 = zext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %203, i64 %425
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !5
  %428 = fmul contract float %427, %427
  %429 = fadd contract float %423, %428
  %430 = or i32 %392, 6
  %431 = zext i32 %430 to i64
  %432 = getelementptr inbounds float, float addrspace(1)* %203, i64 %431
  %433 = load float, float addrspace(1)* %432, align 4, !tbaa !5
  %434 = fmul contract float %433, %433
  %435 = fadd contract float %429, %434
  %436 = or i32 %392, 7
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, float addrspace(1)* %203, i64 %437
  %439 = load float, float addrspace(1)* %438, align 4, !tbaa !5
  %440 = fmul contract float %439, %439
  %441 = fadd contract float %435, %440
  %442 = add nuw nsw i32 %392, 8
  %443 = add i32 %394, 8
  %444 = icmp eq i32 %443, %115
  br i1 %444, label %445, label %391, !llvm.loop !21

445:                                              ; preds = %391, %206
  %446 = phi float [ undef, %206 ], [ %441, %391 ]
  %447 = phi i32 [ 0, %206 ], [ %442, %391 ]
  %448 = phi float [ 0.000000e+00, %206 ], [ %441, %391 ]
  br i1 %116, label %461, label %449

449:                                              ; preds = %445, %449
  %450 = phi i32 [ %458, %449 ], [ %447, %445 ]
  %451 = phi float [ %457, %449 ], [ %448, %445 ]
  %452 = phi i32 [ %459, %449 ], [ 0, %445 ]
  %453 = zext i32 %450 to i64
  %454 = getelementptr inbounds float, float addrspace(1)* %203, i64 %453
  %455 = load float, float addrspace(1)* %454, align 4, !tbaa !5
  %456 = fmul contract float %455, %455
  %457 = fadd contract float %451, %456
  %458 = add nuw nsw i32 %450, 1
  %459 = add i32 %452, 1
  %460 = icmp eq i32 %459, %113
  br i1 %460, label %461, label %449, !llvm.loop !22

461:                                              ; preds = %445, %449, %205
  %462 = phi float [ 0.000000e+00, %205 ], [ %446, %445 ], [ %457, %449 ]
  %463 = fcmp olt float %462, 0x39F0000000000000
  %464 = select i1 %463, float 0x41F0000000000000, float 1.000000e+00
  %465 = fmul float %462, %464
  %466 = tail call float @llvm.sqrt.f32(float %465)
  %467 = bitcast float %466 to i32
  %468 = add nsw i32 %467, -1
  %469 = bitcast i32 %468 to float
  %470 = add nsw i32 %467, 1
  %471 = bitcast i32 %470 to float
  %472 = tail call i1 @llvm.amdgcn.class.f32(float %465, i32 608)
  %473 = select i1 %463, float 0x3EF0000000000000, float 1.000000e+00
  %474 = fneg float %471
  %475 = tail call float @llvm.fma.f32(float %474, float %466, float %465)
  %476 = fcmp ogt float %475, 0.000000e+00
  %477 = fneg float %469
  %478 = tail call float @llvm.fma.f32(float %477, float %466, float %465)
  %479 = fcmp ole float %478, 0.000000e+00
  %480 = select i1 %479, float %469, float %466
  %481 = select i1 %476, float %471, float %480
  %482 = fmul float %473, %481
  %483 = select i1 %472, float %465, float %482
  %484 = fdiv contract float 1.000000e+00, %483
  br i1 %32, label %485, label %543

485:                                              ; preds = %461
  br i1 %118, label %531, label %486

486:                                              ; preds = %485, %486
  %487 = phi i32 [ %528, %486 ], [ 0, %485 ]
  %488 = phi i32 [ %529, %486 ], [ 0, %485 ]
  %489 = zext i32 %487 to i64
  %490 = getelementptr inbounds float, float addrspace(1)* %203, i64 %489
  %491 = load float, float addrspace(1)* %490, align 4, !tbaa !5
  %492 = fmul contract float %484, %491
  store float %492, float addrspace(1)* %490, align 4, !tbaa !5
  %493 = or i32 %487, 1
  %494 = zext i32 %493 to i64
  %495 = getelementptr inbounds float, float addrspace(1)* %203, i64 %494
  %496 = load float, float addrspace(1)* %495, align 4, !tbaa !5
  %497 = fmul contract float %484, %496
  store float %497, float addrspace(1)* %495, align 4, !tbaa !5
  %498 = or i32 %487, 2
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %203, i64 %499
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !5
  %502 = fmul contract float %484, %501
  store float %502, float addrspace(1)* %500, align 4, !tbaa !5
  %503 = or i32 %487, 3
  %504 = zext i32 %503 to i64
  %505 = getelementptr inbounds float, float addrspace(1)* %203, i64 %504
  %506 = load float, float addrspace(1)* %505, align 4, !tbaa !5
  %507 = fmul contract float %484, %506
  store float %507, float addrspace(1)* %505, align 4, !tbaa !5
  %508 = or i32 %487, 4
  %509 = zext i32 %508 to i64
  %510 = getelementptr inbounds float, float addrspace(1)* %203, i64 %509
  %511 = load float, float addrspace(1)* %510, align 4, !tbaa !5
  %512 = fmul contract float %484, %511
  store float %512, float addrspace(1)* %510, align 4, !tbaa !5
  %513 = or i32 %487, 5
  %514 = zext i32 %513 to i64
  %515 = getelementptr inbounds float, float addrspace(1)* %203, i64 %514
  %516 = load float, float addrspace(1)* %515, align 4, !tbaa !5
  %517 = fmul contract float %484, %516
  store float %517, float addrspace(1)* %515, align 4, !tbaa !5
  %518 = or i32 %487, 6
  %519 = zext i32 %518 to i64
  %520 = getelementptr inbounds float, float addrspace(1)* %203, i64 %519
  %521 = load float, float addrspace(1)* %520, align 4, !tbaa !5
  %522 = fmul contract float %484, %521
  store float %522, float addrspace(1)* %520, align 4, !tbaa !5
  %523 = or i32 %487, 7
  %524 = zext i32 %523 to i64
  %525 = getelementptr inbounds float, float addrspace(1)* %203, i64 %524
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !5
  %527 = fmul contract float %484, %526
  store float %527, float addrspace(1)* %525, align 4, !tbaa !5
  %528 = add nuw nsw i32 %487, 8
  %529 = add i32 %488, 8
  %530 = icmp eq i32 %529, %119
  br i1 %530, label %531, label %486, !llvm.loop !23

531:                                              ; preds = %486, %485
  %532 = phi i32 [ 0, %485 ], [ %528, %486 ]
  br i1 %120, label %543, label %533

533:                                              ; preds = %531, %533
  %534 = phi i32 [ %540, %533 ], [ %532, %531 ]
  %535 = phi i32 [ %541, %533 ], [ 0, %531 ]
  %536 = zext i32 %534 to i64
  %537 = getelementptr inbounds float, float addrspace(1)* %203, i64 %536
  %538 = load float, float addrspace(1)* %537, align 4, !tbaa !5
  %539 = fmul contract float %484, %538
  store float %539, float addrspace(1)* %537, align 4, !tbaa !5
  %540 = add nuw nsw i32 %534, 1
  %541 = add i32 %535, 1
  %542 = icmp eq i32 %541, %117
  br i1 %542, label %543, label %533, !llvm.loop !24

543:                                              ; preds = %531, %533, %461
  %544 = add nuw nsw i32 %200, 1
  %545 = icmp eq i32 %544, %3
  br i1 %545, label %546, label %199, !llvm.loop !25

546:                                              ; preds = %543, %101
  %547 = add nsw i32 %3, -1
  br i1 %102, label %548, label %890

548:                                              ; preds = %546
  %549 = add i32 %2, -1
  %550 = and i32 %2, 7
  %551 = icmp ult i32 %549, 7
  %552 = and i32 %2, -8
  %553 = icmp eq i32 %550, 0
  %554 = and i32 %2, 7
  %555 = icmp ult i32 %549, 7
  %556 = and i32 %2, -8
  %557 = icmp eq i32 %554, 0
  br label %558

558:                                              ; preds = %548, %877
  %559 = phi i32 [ 0, %548 ], [ %889, %877 ]
  %560 = phi i32 [ %547, %548 ], [ %887, %877 ]
  %561 = add i32 %559, -1
  %562 = mul nsw i32 %560, %2
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %88, i64 %563
  br label %567

565:                                              ; preds = %661
  br i1 %32, label %566, label %687

566:                                              ; preds = %565
  br i1 %555, label %669, label %715

567:                                              ; preds = %558, %661
  %568 = phi i32 [ %667, %661 ], [ 0, %558 ]
  %569 = mul nsw i32 %568, %2
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds float, float addrspace(1)* %31, i64 %570
  br i1 %32, label %572, label %661

572:                                              ; preds = %567
  br i1 %551, label %643, label %573

573:                                              ; preds = %572, %573
  %574 = phi i32 [ %640, %573 ], [ 0, %572 ]
  %575 = phi float [ %639, %573 ], [ 0.000000e+00, %572 ]
  %576 = phi i32 [ %641, %573 ], [ 0, %572 ]
  %577 = zext i32 %574 to i64
  %578 = getelementptr inbounds float, float addrspace(1)* %564, i64 %577
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !5
  %580 = getelementptr inbounds float, float addrspace(1)* %571, i64 %577
  %581 = load float, float addrspace(1)* %580, align 4, !tbaa !5
  %582 = fmul contract float %579, %581
  %583 = fadd contract float %575, %582
  %584 = or i32 %574, 1
  %585 = zext i32 %584 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %564, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !5
  %588 = getelementptr inbounds float, float addrspace(1)* %571, i64 %585
  %589 = load float, float addrspace(1)* %588, align 4, !tbaa !5
  %590 = fmul contract float %587, %589
  %591 = fadd contract float %583, %590
  %592 = or i32 %574, 2
  %593 = zext i32 %592 to i64
  %594 = getelementptr inbounds float, float addrspace(1)* %564, i64 %593
  %595 = load float, float addrspace(1)* %594, align 4, !tbaa !5
  %596 = getelementptr inbounds float, float addrspace(1)* %571, i64 %593
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !5
  %598 = fmul contract float %595, %597
  %599 = fadd contract float %591, %598
  %600 = or i32 %574, 3
  %601 = zext i32 %600 to i64
  %602 = getelementptr inbounds float, float addrspace(1)* %564, i64 %601
  %603 = load float, float addrspace(1)* %602, align 4, !tbaa !5
  %604 = getelementptr inbounds float, float addrspace(1)* %571, i64 %601
  %605 = load float, float addrspace(1)* %604, align 4, !tbaa !5
  %606 = fmul contract float %603, %605
  %607 = fadd contract float %599, %606
  %608 = or i32 %574, 4
  %609 = zext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %564, i64 %609
  %611 = load float, float addrspace(1)* %610, align 4, !tbaa !5
  %612 = getelementptr inbounds float, float addrspace(1)* %571, i64 %609
  %613 = load float, float addrspace(1)* %612, align 4, !tbaa !5
  %614 = fmul contract float %611, %613
  %615 = fadd contract float %607, %614
  %616 = or i32 %574, 5
  %617 = zext i32 %616 to i64
  %618 = getelementptr inbounds float, float addrspace(1)* %564, i64 %617
  %619 = load float, float addrspace(1)* %618, align 4, !tbaa !5
  %620 = getelementptr inbounds float, float addrspace(1)* %571, i64 %617
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !5
  %622 = fmul contract float %619, %621
  %623 = fadd contract float %615, %622
  %624 = or i32 %574, 6
  %625 = zext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(1)* %564, i64 %625
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !5
  %628 = getelementptr inbounds float, float addrspace(1)* %571, i64 %625
  %629 = load float, float addrspace(1)* %628, align 4, !tbaa !5
  %630 = fmul contract float %627, %629
  %631 = fadd contract float %623, %630
  %632 = or i32 %574, 7
  %633 = zext i32 %632 to i64
  %634 = getelementptr inbounds float, float addrspace(1)* %564, i64 %633
  %635 = load float, float addrspace(1)* %634, align 4, !tbaa !5
  %636 = getelementptr inbounds float, float addrspace(1)* %571, i64 %633
  %637 = load float, float addrspace(1)* %636, align 4, !tbaa !5
  %638 = fmul contract float %635, %637
  %639 = fadd contract float %631, %638
  %640 = add nuw nsw i32 %574, 8
  %641 = add i32 %576, 8
  %642 = icmp eq i32 %641, %552
  br i1 %642, label %643, label %573, !llvm.loop !26

643:                                              ; preds = %573, %572
  %644 = phi float [ undef, %572 ], [ %639, %573 ]
  %645 = phi i32 [ 0, %572 ], [ %640, %573 ]
  %646 = phi float [ 0.000000e+00, %572 ], [ %639, %573 ]
  br i1 %553, label %661, label %647

647:                                              ; preds = %643, %647
  %648 = phi i32 [ %658, %647 ], [ %645, %643 ]
  %649 = phi float [ %657, %647 ], [ %646, %643 ]
  %650 = phi i32 [ %659, %647 ], [ 0, %643 ]
  %651 = zext i32 %648 to i64
  %652 = getelementptr inbounds float, float addrspace(1)* %564, i64 %651
  %653 = load float, float addrspace(1)* %652, align 4, !tbaa !5
  %654 = getelementptr inbounds float, float addrspace(1)* %571, i64 %651
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !5
  %656 = fmul contract float %653, %655
  %657 = fadd contract float %649, %656
  %658 = add nuw nsw i32 %648, 1
  %659 = add i32 %650, 1
  %660 = icmp eq i32 %659, %550
  br i1 %660, label %661, label %647, !llvm.loop !27

661:                                              ; preds = %643, %647, %567
  %662 = phi float [ 0.000000e+00, %567 ], [ %644, %643 ], [ %657, %647 ]
  %663 = mul nsw i32 %568, %3
  %664 = add nsw i32 %663, %560
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %91, i64 %665
  store float %662, float addrspace(1)* %666, align 4, !tbaa !5
  %667 = add nuw nsw i32 %568, 1
  %668 = icmp eq i32 %667, %3
  br i1 %668, label %565, label %567, !llvm.loop !28

669:                                              ; preds = %715, %566
  %670 = phi float [ undef, %566 ], [ %781, %715 ]
  %671 = phi i32 [ 0, %566 ], [ %782, %715 ]
  %672 = phi float [ 0.000000e+00, %566 ], [ %781, %715 ]
  br i1 %557, label %687, label %673

673:                                              ; preds = %669, %673
  %674 = phi i32 [ %684, %673 ], [ %671, %669 ]
  %675 = phi float [ %683, %673 ], [ %672, %669 ]
  %676 = phi i32 [ %685, %673 ], [ 0, %669 ]
  %677 = zext i32 %674 to i64
  %678 = getelementptr inbounds float, float addrspace(1)* %564, i64 %677
  %679 = load float, float addrspace(1)* %678, align 4, !tbaa !5
  %680 = getelementptr inbounds float, float addrspace(1)* %82, i64 %677
  %681 = load float, float addrspace(1)* %680, align 4, !tbaa !5
  %682 = fmul contract float %679, %681
  %683 = fadd contract float %675, %682
  %684 = add nuw nsw i32 %674, 1
  %685 = add i32 %676, 1
  %686 = icmp eq i32 %685, %554
  br i1 %686, label %687, label %673, !llvm.loop !29

687:                                              ; preds = %669, %673, %565
  %688 = phi float [ 0.000000e+00, %565 ], [ %670, %669 ], [ %683, %673 ]
  %689 = icmp sgt i32 %547, %560
  br i1 %689, label %690, label %877

690:                                              ; preds = %687
  %691 = and i32 %559, 7
  %692 = icmp eq i32 %691, 0
  br i1 %692, label %710, label %693

693:                                              ; preds = %690, %693
  %694 = phi i32 [ %707, %693 ], [ %547, %690 ]
  %695 = phi float [ %706, %693 ], [ %688, %690 ]
  %696 = phi i32 [ %708, %693 ], [ 0, %690 ]
  %697 = mul nsw i32 %694, %3
  %698 = add nsw i32 %697, %560
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds float, float addrspace(1)* %91, i64 %699
  %701 = load float, float addrspace(1)* %700, align 4, !tbaa !5
  %702 = zext i32 %694 to i64
  %703 = getelementptr inbounds float, float addrspace(1)* %85, i64 %702
  %704 = load float, float addrspace(1)* %703, align 4, !tbaa !5
  %705 = fmul contract float %701, %704
  %706 = fsub contract float %695, %705
  %707 = add nsw i32 %694, -1
  %708 = add i32 %696, 1
  %709 = icmp eq i32 %708, %691
  br i1 %709, label %710, label %693, !llvm.loop !30

710:                                              ; preds = %693, %690
  %711 = phi i32 [ %547, %690 ], [ %707, %693 ]
  %712 = phi float [ %688, %690 ], [ %706, %693 ]
  %713 = phi float [ undef, %690 ], [ %706, %693 ]
  %714 = icmp ult i32 %561, 7
  br i1 %714, label %877, label %785

715:                                              ; preds = %566, %715
  %716 = phi i32 [ %782, %715 ], [ 0, %566 ]
  %717 = phi float [ %781, %715 ], [ 0.000000e+00, %566 ]
  %718 = phi i32 [ %783, %715 ], [ 0, %566 ]
  %719 = zext i32 %716 to i64
  %720 = getelementptr inbounds float, float addrspace(1)* %564, i64 %719
  %721 = load float, float addrspace(1)* %720, align 4, !tbaa !5
  %722 = getelementptr inbounds float, float addrspace(1)* %82, i64 %719
  %723 = load float, float addrspace(1)* %722, align 4, !tbaa !5
  %724 = fmul contract float %721, %723
  %725 = fadd contract float %717, %724
  %726 = or i32 %716, 1
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, float addrspace(1)* %564, i64 %727
  %729 = load float, float addrspace(1)* %728, align 4, !tbaa !5
  %730 = getelementptr inbounds float, float addrspace(1)* %82, i64 %727
  %731 = load float, float addrspace(1)* %730, align 4, !tbaa !5
  %732 = fmul contract float %729, %731
  %733 = fadd contract float %725, %732
  %734 = or i32 %716, 2
  %735 = zext i32 %734 to i64
  %736 = getelementptr inbounds float, float addrspace(1)* %564, i64 %735
  %737 = load float, float addrspace(1)* %736, align 4, !tbaa !5
  %738 = getelementptr inbounds float, float addrspace(1)* %82, i64 %735
  %739 = load float, float addrspace(1)* %738, align 4, !tbaa !5
  %740 = fmul contract float %737, %739
  %741 = fadd contract float %733, %740
  %742 = or i32 %716, 3
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, float addrspace(1)* %564, i64 %743
  %745 = load float, float addrspace(1)* %744, align 4, !tbaa !5
  %746 = getelementptr inbounds float, float addrspace(1)* %82, i64 %743
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !5
  %748 = fmul contract float %745, %747
  %749 = fadd contract float %741, %748
  %750 = or i32 %716, 4
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, float addrspace(1)* %564, i64 %751
  %753 = load float, float addrspace(1)* %752, align 4, !tbaa !5
  %754 = getelementptr inbounds float, float addrspace(1)* %82, i64 %751
  %755 = load float, float addrspace(1)* %754, align 4, !tbaa !5
  %756 = fmul contract float %753, %755
  %757 = fadd contract float %749, %756
  %758 = or i32 %716, 5
  %759 = zext i32 %758 to i64
  %760 = getelementptr inbounds float, float addrspace(1)* %564, i64 %759
  %761 = load float, float addrspace(1)* %760, align 4, !tbaa !5
  %762 = getelementptr inbounds float, float addrspace(1)* %82, i64 %759
  %763 = load float, float addrspace(1)* %762, align 4, !tbaa !5
  %764 = fmul contract float %761, %763
  %765 = fadd contract float %757, %764
  %766 = or i32 %716, 6
  %767 = zext i32 %766 to i64
  %768 = getelementptr inbounds float, float addrspace(1)* %564, i64 %767
  %769 = load float, float addrspace(1)* %768, align 4, !tbaa !5
  %770 = getelementptr inbounds float, float addrspace(1)* %82, i64 %767
  %771 = load float, float addrspace(1)* %770, align 4, !tbaa !5
  %772 = fmul contract float %769, %771
  %773 = fadd contract float %765, %772
  %774 = or i32 %716, 7
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %564, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !5
  %778 = getelementptr inbounds float, float addrspace(1)* %82, i64 %775
  %779 = load float, float addrspace(1)* %778, align 4, !tbaa !5
  %780 = fmul contract float %777, %779
  %781 = fadd contract float %773, %780
  %782 = add nuw nsw i32 %716, 8
  %783 = add i32 %718, 8
  %784 = icmp eq i32 %783, %556
  br i1 %784, label %669, label %715, !llvm.loop !31

785:                                              ; preds = %710, %785
  %786 = phi i32 [ %875, %785 ], [ %711, %710 ]
  %787 = phi float [ %874, %785 ], [ %712, %710 ]
  %788 = mul nsw i32 %786, %3
  %789 = add nsw i32 %788, %560
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds float, float addrspace(1)* %91, i64 %790
  %792 = load float, float addrspace(1)* %791, align 4, !tbaa !5
  %793 = zext i32 %786 to i64
  %794 = getelementptr inbounds float, float addrspace(1)* %85, i64 %793
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !5
  %796 = fmul contract float %792, %795
  %797 = fsub contract float %787, %796
  %798 = add nsw i32 %786, -1
  %799 = mul nsw i32 %798, %3
  %800 = add nsw i32 %799, %560
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds float, float addrspace(1)* %91, i64 %801
  %803 = load float, float addrspace(1)* %802, align 4, !tbaa !5
  %804 = zext i32 %798 to i64
  %805 = getelementptr inbounds float, float addrspace(1)* %85, i64 %804
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !5
  %807 = fmul contract float %803, %806
  %808 = fsub contract float %797, %807
  %809 = add nsw i32 %786, -2
  %810 = mul nsw i32 %809, %3
  %811 = add nsw i32 %810, %560
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds float, float addrspace(1)* %91, i64 %812
  %814 = load float, float addrspace(1)* %813, align 4, !tbaa !5
  %815 = zext i32 %809 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %85, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !5
  %818 = fmul contract float %814, %817
  %819 = fsub contract float %808, %818
  %820 = add nsw i32 %786, -3
  %821 = mul nsw i32 %820, %3
  %822 = add nsw i32 %821, %560
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds float, float addrspace(1)* %91, i64 %823
  %825 = load float, float addrspace(1)* %824, align 4, !tbaa !5
  %826 = zext i32 %820 to i64
  %827 = getelementptr inbounds float, float addrspace(1)* %85, i64 %826
  %828 = load float, float addrspace(1)* %827, align 4, !tbaa !5
  %829 = fmul contract float %825, %828
  %830 = fsub contract float %819, %829
  %831 = add nsw i32 %786, -4
  %832 = mul nsw i32 %831, %3
  %833 = add nsw i32 %832, %560
  %834 = sext i32 %833 to i64
  %835 = getelementptr inbounds float, float addrspace(1)* %91, i64 %834
  %836 = load float, float addrspace(1)* %835, align 4, !tbaa !5
  %837 = zext i32 %831 to i64
  %838 = getelementptr inbounds float, float addrspace(1)* %85, i64 %837
  %839 = load float, float addrspace(1)* %838, align 4, !tbaa !5
  %840 = fmul contract float %836, %839
  %841 = fsub contract float %830, %840
  %842 = add nsw i32 %786, -5
  %843 = mul nsw i32 %842, %3
  %844 = add nsw i32 %843, %560
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds float, float addrspace(1)* %91, i64 %845
  %847 = load float, float addrspace(1)* %846, align 4, !tbaa !5
  %848 = zext i32 %842 to i64
  %849 = getelementptr inbounds float, float addrspace(1)* %85, i64 %848
  %850 = load float, float addrspace(1)* %849, align 4, !tbaa !5
  %851 = fmul contract float %847, %850
  %852 = fsub contract float %841, %851
  %853 = add nsw i32 %786, -6
  %854 = mul nsw i32 %853, %3
  %855 = add nsw i32 %854, %560
  %856 = sext i32 %855 to i64
  %857 = getelementptr inbounds float, float addrspace(1)* %91, i64 %856
  %858 = load float, float addrspace(1)* %857, align 4, !tbaa !5
  %859 = zext i32 %853 to i64
  %860 = getelementptr inbounds float, float addrspace(1)* %85, i64 %859
  %861 = load float, float addrspace(1)* %860, align 4, !tbaa !5
  %862 = fmul contract float %858, %861
  %863 = fsub contract float %852, %862
  %864 = add nsw i32 %786, -7
  %865 = mul nsw i32 %864, %3
  %866 = add nsw i32 %865, %560
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds float, float addrspace(1)* %91, i64 %867
  %869 = load float, float addrspace(1)* %868, align 4, !tbaa !5
  %870 = zext i32 %864 to i64
  %871 = getelementptr inbounds float, float addrspace(1)* %85, i64 %870
  %872 = load float, float addrspace(1)* %871, align 4, !tbaa !5
  %873 = fmul contract float %869, %872
  %874 = fsub contract float %863, %873
  %875 = add nsw i32 %786, -8
  %876 = icmp sgt i32 %875, %560
  br i1 %876, label %785, label %877, !llvm.loop !32

877:                                              ; preds = %710, %785, %687
  %878 = phi float [ %688, %687 ], [ %713, %710 ], [ %874, %785 ]
  %879 = mul nsw i32 %560, %3
  %880 = add nsw i32 %879, %560
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds float, float addrspace(1)* %91, i64 %881
  %883 = load float, float addrspace(1)* %882, align 4, !tbaa !5
  %884 = fdiv contract float %878, %883
  %885 = zext i32 %560 to i64
  %886 = getelementptr inbounds float, float addrspace(1)* %85, i64 %885
  store float %884, float addrspace(1)* %886, align 4, !tbaa !5
  %887 = add nsw i32 %560, -1
  %888 = icmp sgt i32 %560, 0
  %889 = add i32 %559, 1
  br i1 %888, label %558, label %890, !llvm.loop !33

890:                                              ; preds = %877, %546, %14
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
