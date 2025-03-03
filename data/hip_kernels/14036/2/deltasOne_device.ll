; ModuleID = '../data/hip_kernels/14036/2/main.cu'
source_filename = "../data/hip_kernels/14036/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @deltasOne(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %18 = add nsw i32 %15, %4
  %19 = mul nsw i32 %18, %5
  %20 = icmp slt i32 %5, 0
  br i1 %20, label %38, label %21

21:                                               ; preds = %6
  %22 = and i32 %16, 7
  %23 = icmp ult i32 %5, 7
  br i1 %23, label %26, label %24

24:                                               ; preds = %21
  %25 = and i32 %16, -8
  br label %45

26:                                               ; preds = %45, %21
  %27 = phi i32 [ 0, %21 ], [ %79, %45 ]
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
  %39 = icmp sgt i32 %5, 0
  br i1 %39, label %40, label %103

40:                                               ; preds = %38
  %41 = and i32 %5, 7
  %42 = icmp ult i32 %5, 8
  br i1 %42, label %82, label %43

43:                                               ; preds = %40
  %44 = and i32 %5, -8
  br label %122

45:                                               ; preds = %45, %24
  %46 = phi i32 [ 0, %24 ], [ %79, %45 ]
  %47 = phi i32 [ 0, %24 ], [ %80, %45 ]
  %48 = add nsw i32 %46, %17
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  store float 0.000000e+00, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = or i32 %46, 1
  %52 = add nsw i32 %51, %17
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  store float 0.000000e+00, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = or i32 %46, 2
  %56 = add nsw i32 %55, %17
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  store float 0.000000e+00, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %46, 3
  %60 = add nsw i32 %59, %17
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %3, i64 %61
  store float 0.000000e+00, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %46, 4
  %64 = add nsw i32 %63, %17
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  store float 0.000000e+00, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i32 %46, 5
  %68 = add nsw i32 %67, %17
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  store float 0.000000e+00, float addrspace(1)* %70, align 4, !tbaa !7
  %71 = or i32 %46, 6
  %72 = add nsw i32 %71, %17
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %3, i64 %73
  store float 0.000000e+00, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = or i32 %46, 7
  %76 = add nsw i32 %75, %17
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  store float 0.000000e+00, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = add nuw i32 %46, 8
  %80 = add i32 %47, 8
  %81 = icmp eq i32 %80, %25
  br i1 %81, label %26, label %45, !llvm.loop !13

82:                                               ; preds = %122, %40
  %83 = phi float [ undef, %40 ], [ %204, %122 ]
  %84 = phi i32 [ 0, %40 ], [ %205, %122 ]
  %85 = phi float [ 0.000000e+00, %40 ], [ %204, %122 ]
  %86 = icmp eq i32 %41, 0
  br i1 %86, label %103, label %87

87:                                               ; preds = %82, %87
  %88 = phi i32 [ %100, %87 ], [ %84, %82 ]
  %89 = phi float [ %99, %87 ], [ %85, %82 ]
  %90 = phi i32 [ %101, %87 ], [ 0, %82 ]
  %91 = add nsw i32 %88, %19
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = zext i32 %88 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fmul contract float %94, %97
  %99 = fadd contract float %89, %98
  %100 = add nuw nsw i32 %88, 1
  %101 = add i32 %90, 1
  %102 = icmp eq i32 %101, %41
  br i1 %102, label %103, label %87, !llvm.loop !15

103:                                              ; preds = %82, %87, %38
  %104 = phi float [ 0.000000e+00, %38 ], [ %83, %82 ], [ %99, %87 ]
  %105 = sext i32 %5 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fadd contract float %104, %107
  %109 = fcmp contract ogt float %108, 0.000000e+00
  %110 = select i1 %109, float 1.000000e+00, float 0.000000e+00
  %111 = sext i32 %18 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fsub contract float %113, %110
  %115 = fcmp contract une float %114, 0.000000e+00
  br i1 %115, label %116, label %326

116:                                              ; preds = %103
  br i1 %39, label %117, label %227

117:                                              ; preds = %116
  %118 = and i32 %5, 7
  %119 = icmp ult i32 %5, 8
  br i1 %119, label %208, label %120

120:                                              ; preds = %117
  %121 = and i32 %5, -8
  br label %233

122:                                              ; preds = %122, %43
  %123 = phi i32 [ 0, %43 ], [ %205, %122 ]
  %124 = phi float [ 0.000000e+00, %43 ], [ %204, %122 ]
  %125 = phi i32 [ 0, %43 ], [ %206, %122 ]
  %126 = add nsw i32 %123, %19
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = zext i32 %123 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %129, %132
  %134 = fadd contract float %124, %133
  %135 = or i32 %123, 1
  %136 = add nsw i32 %135, %19
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = zext i32 %135 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7
  %143 = fmul contract float %139, %142
  %144 = fadd contract float %134, %143
  %145 = or i32 %123, 2
  %146 = add nsw i32 %145, %19
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = zext i32 %145 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = fmul contract float %149, %152
  %154 = fadd contract float %144, %153
  %155 = or i32 %123, 3
  %156 = add nsw i32 %155, %19
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = zext i32 %155 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = fmul contract float %159, %162
  %164 = fadd contract float %154, %163
  %165 = or i32 %123, 4
  %166 = add nsw i32 %165, %19
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7
  %170 = zext i32 %165 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %173 = fmul contract float %169, %172
  %174 = fadd contract float %164, %173
  %175 = or i32 %123, 5
  %176 = add nsw i32 %175, %19
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = zext i32 %175 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %2, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = fmul contract float %179, %182
  %184 = fadd contract float %174, %183
  %185 = or i32 %123, 6
  %186 = add nsw i32 %185, %19
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = zext i32 %185 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %2, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = fmul contract float %189, %192
  %194 = fadd contract float %184, %193
  %195 = or i32 %123, 7
  %196 = add nsw i32 %195, %19
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = zext i32 %195 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %2, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7
  %203 = fmul contract float %199, %202
  %204 = fadd contract float %194, %203
  %205 = add nuw nsw i32 %123, 8
  %206 = add i32 %125, 8
  %207 = icmp eq i32 %206, %44
  br i1 %207, label %82, label %122, !llvm.loop !16

208:                                              ; preds = %233, %117
  %209 = phi i32 [ 0, %117 ], [ %323, %233 ]
  %210 = icmp eq i32 %118, 0
  br i1 %210, label %227, label %211

211:                                              ; preds = %208, %211
  %212 = phi i32 [ %224, %211 ], [ %209, %208 ]
  %213 = phi i32 [ %225, %211 ], [ 0, %208 ]
  %214 = add nsw i32 %212, %19
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = fmul contract float %114, %217
  %219 = add nsw i32 %212, %17
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %3, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7
  %223 = fadd contract float %222, %218
  store float %223, float addrspace(1)* %221, align 4, !tbaa !7
  %224 = add nuw nsw i32 %212, 1
  %225 = add i32 %213, 1
  %226 = icmp eq i32 %225, %118
  br i1 %226, label %227, label %211, !llvm.loop !17

227:                                              ; preds = %208, %211, %116
  %228 = add nsw i32 %17, %5
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %3, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = fadd contract float %114, %231
  store float %232, float addrspace(1)* %230, align 4, !tbaa !7
  br label %326

233:                                              ; preds = %233, %120
  %234 = phi i32 [ 0, %120 ], [ %323, %233 ]
  %235 = phi i32 [ 0, %120 ], [ %324, %233 ]
  %236 = add nsw i32 %234, %19
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %0, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7
  %240 = fmul contract float %114, %239
  %241 = add nsw i32 %234, %17
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %3, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = fadd contract float %244, %240
  store float %245, float addrspace(1)* %243, align 4, !tbaa !7
  %246 = or i32 %234, 1
  %247 = add nsw i32 %246, %19
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %0, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7
  %251 = fmul contract float %114, %250
  %252 = add nsw i32 %246, %17
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds float, float addrspace(1)* %3, i64 %253
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !7
  %256 = fadd contract float %255, %251
  store float %256, float addrspace(1)* %254, align 4, !tbaa !7
  %257 = or i32 %234, 2
  %258 = add nsw i32 %257, %19
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7
  %262 = fmul contract float %114, %261
  %263 = add nsw i32 %257, %17
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %3, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = fadd contract float %266, %262
  store float %267, float addrspace(1)* %265, align 4, !tbaa !7
  %268 = or i32 %234, 3
  %269 = add nsw i32 %268, %19
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %0, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !7
  %273 = fmul contract float %114, %272
  %274 = add nsw i32 %268, %17
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %3, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !7
  %278 = fadd contract float %277, %273
  store float %278, float addrspace(1)* %276, align 4, !tbaa !7
  %279 = or i32 %234, 4
  %280 = add nsw i32 %279, %19
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %0, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !7
  %284 = fmul contract float %114, %283
  %285 = add nsw i32 %279, %17
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %3, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7
  %289 = fadd contract float %288, %284
  store float %289, float addrspace(1)* %287, align 4, !tbaa !7
  %290 = or i32 %234, 5
  %291 = add nsw i32 %290, %19
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %0, i64 %292
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !7
  %295 = fmul contract float %114, %294
  %296 = add nsw i32 %290, %17
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds float, float addrspace(1)* %3, i64 %297
  %299 = load float, float addrspace(1)* %298, align 4, !tbaa !7
  %300 = fadd contract float %299, %295
  store float %300, float addrspace(1)* %298, align 4, !tbaa !7
  %301 = or i32 %234, 6
  %302 = add nsw i32 %301, %19
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %0, i64 %303
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !7
  %306 = fmul contract float %114, %305
  %307 = add nsw i32 %301, %17
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %3, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !7
  %311 = fadd contract float %310, %306
  store float %311, float addrspace(1)* %309, align 4, !tbaa !7
  %312 = or i32 %234, 7
  %313 = add nsw i32 %312, %19
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %0, i64 %314
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !7
  %317 = fmul contract float %114, %316
  %318 = add nsw i32 %312, %17
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %3, i64 %319
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !7
  %322 = fadd contract float %321, %317
  store float %322, float addrspace(1)* %320, align 4, !tbaa !7
  %323 = add nuw nsw i32 %234, 8
  %324 = add i32 %235, 8
  %325 = icmp eq i32 %324, %121
  br i1 %325, label %208, label %233, !llvm.loop !18

326:                                              ; preds = %227, %103
  ret void
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
