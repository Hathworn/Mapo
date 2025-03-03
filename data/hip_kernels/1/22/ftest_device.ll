; ModuleID = '../data/hip_kernels/1/22/main.cu'
source_filename = "../data/hip_kernels/1/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5ftestiiiiiiiPfiS_iS_iS_iS_iS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, i32 %8, float addrspace(1)* nocapture readonly %9, i32 %10, float addrspace(1)* nocapture readonly %11, i32 %12, float addrspace(1)* nocapture readonly %13, i32 %14, float addrspace(1)* nocapture readonly %15, i32 %16, float addrspace(1)* nocapture writeonly %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = shl i32 %19, 4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = shl i32 %23, 4
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %26 = add i32 %24, %25
  %27 = mul nsw i32 %26, %3
  %28 = add nsw i32 %27, %22
  %29 = sitofp i32 %1 to float
  %30 = sitofp i32 %2 to float
  %31 = icmp slt i32 %26, %4
  %32 = icmp slt i32 %22, %3
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %333

34:                                               ; preds = %18
  %35 = icmp eq i32 %0, 0
  %36 = icmp eq i32 %26, %22
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %329, label %38

38:                                               ; preds = %34
  %39 = mul nsw i32 %28, %8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %7, i64 %40
  %42 = mul nsw i32 %26, %10
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %9, i64 %43
  %45 = mul nsw i32 %26, %14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %13, i64 %46
  %48 = mul nsw i32 %28, %12
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %11, i64 %49
  %51 = mul nsw i32 %28, %16
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %15, i64 %52
  %54 = icmp sgt i32 %2, 0
  br i1 %54, label %55, label %317

55:                                               ; preds = %38
  %56 = icmp sgt i32 %5, 0
  %57 = icmp sgt i32 %6, 0
  %58 = and i32 %5, 7
  %59 = icmp ult i32 %5, 8
  %60 = and i32 %5, -8
  %61 = icmp eq i32 %58, 0
  %62 = and i32 %6, 7
  %63 = icmp ult i32 %6, 8
  %64 = and i32 %6, -8
  %65 = icmp eq i32 %62, 0
  br label %66

66:                                               ; preds = %55, %307
  %67 = phi i32 [ 0, %55 ], [ %315, %307 ]
  %68 = phi float [ 0.000000e+00, %55 ], [ %311, %307 ]
  %69 = phi float [ 0.000000e+00, %55 ], [ %314, %307 ]
  %70 = zext i32 %67 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %41, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  br i1 %56, label %73, label %95

73:                                               ; preds = %66
  br i1 %59, label %74, label %98

74:                                               ; preds = %98, %73
  %75 = phi float [ undef, %73 ], [ %188, %98 ]
  %76 = phi i32 [ 0, %73 ], [ %189, %98 ]
  %77 = phi float [ 0.000000e+00, %73 ], [ %188, %98 ]
  br i1 %61, label %95, label %78

78:                                               ; preds = %74, %78
  %79 = phi i32 [ %92, %78 ], [ %76, %74 ]
  %80 = phi float [ %91, %78 ], [ %77, %74 ]
  %81 = phi i32 [ %93, %78 ], [ 0, %74 ]
  %82 = zext i32 %79 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %44, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = mul nsw i32 %79, %2
  %86 = add nsw i32 %85, %67
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %47, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %80, %90
  %92 = add nuw nsw i32 %79, 1
  %93 = add i32 %81, 1
  %94 = icmp eq i32 %93, %58
  br i1 %94, label %95, label %78, !llvm.loop !10

95:                                               ; preds = %74, %78, %66
  %96 = phi float [ 0.000000e+00, %66 ], [ %75, %74 ], [ %91, %78 ]
  br i1 %57, label %97, label %307

97:                                               ; preds = %95
  br i1 %63, label %286, label %192

98:                                               ; preds = %73, %98
  %99 = phi i32 [ %189, %98 ], [ 0, %73 ]
  %100 = phi float [ %188, %98 ], [ 0.000000e+00, %73 ]
  %101 = phi i32 [ %190, %98 ], [ 0, %73 ]
  %102 = zext i32 %99 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %44, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = mul nsw i32 %99, %2
  %106 = add nsw i32 %105, %67
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %47, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %100, %110
  %112 = or i32 %99, 1
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %44, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = mul nsw i32 %112, %2
  %117 = add nsw i32 %116, %67
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %47, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %111, %121
  %123 = or i32 %99, 2
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %44, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = mul nsw i32 %123, %2
  %128 = add nsw i32 %127, %67
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %47, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %122, %132
  %134 = or i32 %99, 3
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %44, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = mul nsw i32 %134, %2
  %139 = add nsw i32 %138, %67
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %47, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %133, %143
  %145 = or i32 %99, 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %44, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  %149 = mul nsw i32 %145, %2
  %150 = add nsw i32 %149, %67
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %47, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5, !amdgpu.noclobber !9
  %154 = fmul contract float %148, %153
  %155 = fadd contract float %144, %154
  %156 = or i32 %99, 5
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %44, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !5, !amdgpu.noclobber !9
  %160 = mul nsw i32 %156, %2
  %161 = add nsw i32 %160, %67
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %47, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !5, !amdgpu.noclobber !9
  %165 = fmul contract float %159, %164
  %166 = fadd contract float %155, %165
  %167 = or i32 %99, 6
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %44, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5, !amdgpu.noclobber !9
  %171 = mul nsw i32 %167, %2
  %172 = add nsw i32 %171, %67
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %47, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !5, !amdgpu.noclobber !9
  %176 = fmul contract float %170, %175
  %177 = fadd contract float %166, %176
  %178 = or i32 %99, 7
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %44, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !5, !amdgpu.noclobber !9
  %182 = mul nsw i32 %178, %2
  %183 = add nsw i32 %182, %67
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %47, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !5, !amdgpu.noclobber !9
  %187 = fmul contract float %181, %186
  %188 = fadd contract float %177, %187
  %189 = add nuw nsw i32 %99, 8
  %190 = add i32 %101, 8
  %191 = icmp eq i32 %190, %60
  br i1 %191, label %74, label %98, !llvm.loop !12

192:                                              ; preds = %97, %192
  %193 = phi i32 [ %283, %192 ], [ 0, %97 ]
  %194 = phi float [ %282, %192 ], [ 0.000000e+00, %97 ]
  %195 = phi i32 [ %284, %192 ], [ 0, %97 ]
  %196 = zext i32 %193 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %50, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !5, !amdgpu.noclobber !9
  %199 = mul nsw i32 %193, %2
  %200 = add nsw i32 %199, %67
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %53, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !5, !amdgpu.noclobber !9
  %204 = fmul contract float %198, %203
  %205 = fadd contract float %194, %204
  %206 = or i32 %193, 1
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %50, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !5, !amdgpu.noclobber !9
  %210 = mul nsw i32 %206, %2
  %211 = add nsw i32 %210, %67
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %53, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !5, !amdgpu.noclobber !9
  %215 = fmul contract float %209, %214
  %216 = fadd contract float %205, %215
  %217 = or i32 %193, 2
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %50, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !5, !amdgpu.noclobber !9
  %221 = mul nsw i32 %217, %2
  %222 = add nsw i32 %221, %67
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %53, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !5, !amdgpu.noclobber !9
  %226 = fmul contract float %220, %225
  %227 = fadd contract float %216, %226
  %228 = or i32 %193, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %50, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !5, !amdgpu.noclobber !9
  %232 = mul nsw i32 %228, %2
  %233 = add nsw i32 %232, %67
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %53, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !5, !amdgpu.noclobber !9
  %237 = fmul contract float %231, %236
  %238 = fadd contract float %227, %237
  %239 = or i32 %193, 4
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %50, i64 %240
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !5, !amdgpu.noclobber !9
  %243 = mul nsw i32 %239, %2
  %244 = add nsw i32 %243, %67
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %53, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !5, !amdgpu.noclobber !9
  %248 = fmul contract float %242, %247
  %249 = fadd contract float %238, %248
  %250 = or i32 %193, 5
  %251 = zext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %50, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !5, !amdgpu.noclobber !9
  %254 = mul nsw i32 %250, %2
  %255 = add nsw i32 %254, %67
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %53, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !5, !amdgpu.noclobber !9
  %259 = fmul contract float %253, %258
  %260 = fadd contract float %249, %259
  %261 = or i32 %193, 6
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %50, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !5, !amdgpu.noclobber !9
  %265 = mul nsw i32 %261, %2
  %266 = add nsw i32 %265, %67
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %53, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !5, !amdgpu.noclobber !9
  %270 = fmul contract float %264, %269
  %271 = fadd contract float %260, %270
  %272 = or i32 %193, 7
  %273 = zext i32 %272 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %50, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !5, !amdgpu.noclobber !9
  %276 = mul nsw i32 %272, %2
  %277 = add nsw i32 %276, %67
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, float addrspace(1)* %53, i64 %278
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !5, !amdgpu.noclobber !9
  %281 = fmul contract float %275, %280
  %282 = fadd contract float %271, %281
  %283 = add nuw nsw i32 %193, 8
  %284 = add i32 %195, 8
  %285 = icmp eq i32 %284, %64
  br i1 %285, label %286, label %192, !llvm.loop !14

286:                                              ; preds = %192, %97
  %287 = phi float [ undef, %97 ], [ %282, %192 ]
  %288 = phi i32 [ 0, %97 ], [ %283, %192 ]
  %289 = phi float [ 0.000000e+00, %97 ], [ %282, %192 ]
  br i1 %65, label %307, label %290

290:                                              ; preds = %286, %290
  %291 = phi i32 [ %304, %290 ], [ %288, %286 ]
  %292 = phi float [ %303, %290 ], [ %289, %286 ]
  %293 = phi i32 [ %305, %290 ], [ 0, %286 ]
  %294 = zext i32 %291 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %50, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !5, !amdgpu.noclobber !9
  %297 = mul nsw i32 %291, %2
  %298 = add nsw i32 %297, %67
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %53, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !5, !amdgpu.noclobber !9
  %302 = fmul contract float %296, %301
  %303 = fadd contract float %292, %302
  %304 = add nuw nsw i32 %291, 1
  %305 = add i32 %293, 1
  %306 = icmp eq i32 %305, %62
  br i1 %306, label %307, label %290, !llvm.loop !15

307:                                              ; preds = %286, %290, %95
  %308 = phi float [ 0.000000e+00, %95 ], [ %287, %286 ], [ %303, %290 ]
  %309 = fsub contract float %72, %96
  %310 = fmul contract float %309, %309
  %311 = fadd contract float %68, %310
  %312 = fsub contract float %72, %308
  %313 = fmul contract float %312, %312
  %314 = fadd contract float %69, %313
  %315 = add nuw nsw i32 %67, 1
  %316 = icmp eq i32 %315, %2
  br i1 %316, label %317, label %66, !llvm.loop !16

317:                                              ; preds = %307, %38
  %318 = phi float [ 0.000000e+00, %38 ], [ %314, %307 ]
  %319 = phi float [ 0.000000e+00, %38 ], [ %311, %307 ]
  %320 = fsub contract float %319, %318
  %321 = fmul contract float %29, 2.000000e+00
  %322 = fsub contract float %30, %321
  %323 = fadd contract float %322, -1.000000e+00
  %324 = fmul contract float %323, %320
  %325 = fmul contract float %318, %29
  %326 = fdiv contract float %324, %325
  %327 = tail call i1 @llvm.amdgcn.class.f32(float %326, i32 504)
  %328 = select i1 %327, float %326, float 0.000000e+00
  br label %329

329:                                              ; preds = %34, %317
  %330 = phi float [ %328, %317 ], [ 0.000000e+00, %34 ]
  %331 = sext i32 %28 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %17, i64 %331
  store float %330, float addrspace(1)* %332, align 4, !tbaa !5
  br label %333

333:                                              ; preds = %329, %18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13}
