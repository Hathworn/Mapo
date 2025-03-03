; ModuleID = '../data/hip_kernels/7/9/main.cu'
source_filename = "../data/hip_kernels/7/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12geometricDOFPfP15HIP_vector_typeIfLj4EES_PiS3_iS_S_(float addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = add nsw i32 %20, -3
  %22 = icmp sgt i32 %20, 3
  br i1 %22, label %23, label %27

23:                                               ; preds = %8
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = mul nsw i32 %17, %5
  br label %35

27:                                               ; preds = %35, %8
  %28 = icmp sgt i32 %20, 0
  br i1 %28, label %29, label %146

29:                                               ; preds = %27
  %30 = mul nsw i32 %17, %5
  %31 = and i32 %20, 7
  %32 = icmp ult i32 %20, 8
  br i1 %32, label %126, label %33

33:                                               ; preds = %29
  %34 = and i32 %20, -8
  br label %176

35:                                               ; preds = %23, %35
  %36 = phi i32 [ 0, %23 ], [ %124, %35 ]
  %37 = add nsw i32 %25, %36
  %38 = sdiv i32 %37, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = fcmp olt float %41, 0x39F0000000000000
  %43 = select i1 %42, float 0x41F0000000000000, float 1.000000e+00
  %44 = fmul float %41, %43
  %45 = tail call float @llvm.sqrt.f32(float %44)
  %46 = bitcast float %45 to i32
  %47 = add nsw i32 %46, -1
  %48 = bitcast i32 %47 to float
  %49 = add nsw i32 %46, 1
  %50 = bitcast i32 %49 to float
  %51 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 608)
  %52 = select i1 %42, float 0x3EF0000000000000, float 1.000000e+00
  %53 = fneg float %50
  %54 = tail call float @llvm.fma.f32(float %53, float %45, float %44)
  %55 = fcmp ogt float %54, 0.000000e+00
  %56 = fneg float %48
  %57 = tail call float @llvm.fma.f32(float %56, float %45, float %44)
  %58 = fcmp ole float %57, 0.000000e+00
  %59 = select i1 %58, float %48, float %45
  %60 = select i1 %55, float %50, float %59
  %61 = fmul float %52, %60
  %62 = select i1 %51, float %44, float %61
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %39
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11
  %65 = fdiv contract float %62, %64
  %66 = add i32 %36, %26
  %67 = mul i32 %66, 6
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !11
  %70 = add i32 %67, 6
  %71 = or i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %65, float addrspace(1)* %73, align 4, !tbaa !11
  %74 = add i32 %67, 14
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %65, float addrspace(1)* %76, align 4, !tbaa !11
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %39, i32 0, i32 0, i32 0, i64 0
  %78 = load float, float addrspace(1)* %77, align 16, !tbaa !13
  %79 = mul nsw i32 %38, 3
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %7, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = fsub contract float %78, %82
  %84 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %39, i32 0, i32 0, i32 0, i64 1
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !13
  %86 = add nsw i32 %79, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %7, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11
  %90 = fsub contract float %85, %89
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %39, i32 0, i32 0, i32 0, i64 2
  %92 = load float, float addrspace(1)* %91, align 8, !tbaa !13
  %93 = add nsw i32 %79, 2
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %7, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11
  %97 = fsub contract float %92, %96
  %98 = fmul contract float %97, %65
  %99 = add i32 %67, 9
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !11
  %102 = fneg contract float %90
  %103 = fmul contract float %65, %102
  %104 = add i32 %67, 15
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  store float %103, float addrspace(1)* %106, align 4, !tbaa !11
  %107 = fneg contract float %97
  %108 = fmul contract float %65, %107
  %109 = add nsw i32 %67, 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %108, float addrspace(1)* %111, align 4, !tbaa !11
  %112 = fneg contract float %83
  %113 = fmul contract float %65, %112
  %114 = add i32 %67, 16
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  store float %113, float addrspace(1)* %116, align 4, !tbaa !11
  %117 = fmul contract float %90, %65
  %118 = add nsw i32 %67, 5
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  store float %117, float addrspace(1)* %120, align 4, !tbaa !11
  %121 = add i32 %67, 11
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  store float %113, float addrspace(1)* %123, align 4, !tbaa !11
  %124 = add nuw nsw i32 %36, 3
  %125 = icmp slt i32 %124, %21
  br i1 %125, label %35, label %27, !llvm.loop !14

126:                                              ; preds = %176, %29
  %127 = phi float [ undef, %29 ], [ %250, %176 ]
  %128 = phi i32 [ 0, %29 ], [ %251, %176 ]
  %129 = phi float [ 0.000000e+00, %29 ], [ %250, %176 ]
  %130 = icmp eq i32 %31, 0
  br i1 %130, label %146, label %131

131:                                              ; preds = %126, %131
  %132 = phi i32 [ %143, %131 ], [ %128, %126 ]
  %133 = phi float [ %142, %131 ], [ %129, %126 ]
  %134 = phi i32 [ %144, %131 ], [ 0, %126 ]
  %135 = add i32 %132, %30
  %136 = mul i32 %135, 6
  %137 = add nsw i32 %136, 3
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !11
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %133, %141
  %143 = add nuw nsw i32 %132, 1
  %144 = add i32 %134, 1
  %145 = icmp eq i32 %144, %31
  br i1 %145, label %146, label %131, !llvm.loop !16

146:                                              ; preds = %126, %131, %27
  %147 = phi float [ 0.000000e+00, %27 ], [ %127, %126 ], [ %142, %131 ]
  %148 = fcmp olt float %147, 0x39F0000000000000
  %149 = select i1 %148, float 0x41F0000000000000, float 1.000000e+00
  %150 = fmul float %147, %149
  %151 = tail call float @llvm.sqrt.f32(float %150)
  %152 = bitcast float %151 to i32
  %153 = add nsw i32 %152, -1
  %154 = bitcast i32 %153 to float
  %155 = add nsw i32 %152, 1
  %156 = bitcast i32 %155 to float
  %157 = tail call i1 @llvm.amdgcn.class.f32(float %150, i32 608)
  %158 = select i1 %148, float 0x3EF0000000000000, float 1.000000e+00
  %159 = fneg float %156
  %160 = tail call float @llvm.fma.f32(float %159, float %151, float %150)
  %161 = fcmp ogt float %160, 0.000000e+00
  %162 = fneg float %154
  %163 = tail call float @llvm.fma.f32(float %162, float %151, float %150)
  %164 = fcmp ole float %163, 0.000000e+00
  %165 = select i1 %164, float %154, float %151
  %166 = select i1 %161, float %156, float %165
  %167 = fmul float %158, %166
  %168 = select i1 %157, float %150, float %167
  %169 = fdiv contract float 1.000000e+00, %168
  br i1 %28, label %170, label %270

170:                                              ; preds = %146
  %171 = mul nsw i32 %17, %5
  %172 = and i32 %20, 7
  %173 = icmp ult i32 %20, 8
  br i1 %173, label %254, label %174

174:                                              ; preds = %170
  %175 = and i32 %20, -8
  br label %271

176:                                              ; preds = %176, %33
  %177 = phi i32 [ 0, %33 ], [ %251, %176 ]
  %178 = phi float [ 0.000000e+00, %33 ], [ %250, %176 ]
  %179 = phi i32 [ 0, %33 ], [ %252, %176 ]
  %180 = add i32 %177, %30
  %181 = mul i32 %180, 6
  %182 = add nsw i32 %181, 3
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !11
  %186 = fmul contract float %185, %185
  %187 = fadd contract float %178, %186
  %188 = or i32 %177, 1
  %189 = add i32 %188, %30
  %190 = mul i32 %189, 6
  %191 = add nsw i32 %190, 3
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !11
  %195 = fmul contract float %194, %194
  %196 = fadd contract float %187, %195
  %197 = or i32 %177, 2
  %198 = add i32 %197, %30
  %199 = mul i32 %198, 6
  %200 = add nsw i32 %199, 3
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !11
  %204 = fmul contract float %203, %203
  %205 = fadd contract float %196, %204
  %206 = or i32 %177, 3
  %207 = add i32 %206, %30
  %208 = mul i32 %207, 6
  %209 = add nsw i32 %208, 3
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !11
  %213 = fmul contract float %212, %212
  %214 = fadd contract float %205, %213
  %215 = or i32 %177, 4
  %216 = add i32 %215, %30
  %217 = mul i32 %216, 6
  %218 = add nsw i32 %217, 3
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %0, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !11
  %222 = fmul contract float %221, %221
  %223 = fadd contract float %214, %222
  %224 = or i32 %177, 5
  %225 = add i32 %224, %30
  %226 = mul i32 %225, 6
  %227 = add nsw i32 %226, 3
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !11
  %231 = fmul contract float %230, %230
  %232 = fadd contract float %223, %231
  %233 = or i32 %177, 6
  %234 = add i32 %233, %30
  %235 = mul i32 %234, 6
  %236 = add nsw i32 %235, 3
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %0, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !11
  %240 = fmul contract float %239, %239
  %241 = fadd contract float %232, %240
  %242 = or i32 %177, 7
  %243 = add i32 %242, %30
  %244 = mul i32 %243, 6
  %245 = add nsw i32 %244, 3
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !11
  %249 = fmul contract float %248, %248
  %250 = fadd contract float %241, %249
  %251 = add nuw nsw i32 %177, 8
  %252 = add i32 %179, 8
  %253 = icmp eq i32 %252, %34
  br i1 %253, label %126, label %176, !llvm.loop !18

254:                                              ; preds = %271, %170
  %255 = phi i32 [ 0, %170 ], [ %337, %271 ]
  %256 = icmp eq i32 %172, 0
  br i1 %256, label %270, label %257

257:                                              ; preds = %254, %257
  %258 = phi i32 [ %267, %257 ], [ %255, %254 ]
  %259 = phi i32 [ %268, %257 ], [ 0, %254 ]
  %260 = add i32 %258, %171
  %261 = mul i32 %260, 6
  %262 = add nsw i32 %261, 3
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !11
  %266 = fmul contract float %169, %265
  store float %266, float addrspace(1)* %264, align 4, !tbaa !11
  %267 = add nuw nsw i32 %258, 1
  %268 = add i32 %259, 1
  %269 = icmp eq i32 %268, %172
  br i1 %269, label %270, label %257, !llvm.loop !19

270:                                              ; preds = %254, %257, %146
  ret void

271:                                              ; preds = %271, %174
  %272 = phi i32 [ 0, %174 ], [ %337, %271 ]
  %273 = phi i32 [ 0, %174 ], [ %338, %271 ]
  %274 = add i32 %272, %171
  %275 = mul i32 %274, 6
  %276 = add nsw i32 %275, 3
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !11
  %280 = fmul contract float %169, %279
  store float %280, float addrspace(1)* %278, align 4, !tbaa !11
  %281 = or i32 %272, 1
  %282 = add i32 %281, %171
  %283 = mul i32 %282, 6
  %284 = add nsw i32 %283, 3
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !11
  %288 = fmul contract float %169, %287
  store float %288, float addrspace(1)* %286, align 4, !tbaa !11
  %289 = or i32 %272, 2
  %290 = add i32 %289, %171
  %291 = mul i32 %290, 6
  %292 = add nsw i32 %291, 3
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %0, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !11
  %296 = fmul contract float %169, %295
  store float %296, float addrspace(1)* %294, align 4, !tbaa !11
  %297 = or i32 %272, 3
  %298 = add i32 %297, %171
  %299 = mul i32 %298, 6
  %300 = add nsw i32 %299, 3
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !11
  %304 = fmul contract float %169, %303
  store float %304, float addrspace(1)* %302, align 4, !tbaa !11
  %305 = or i32 %272, 4
  %306 = add i32 %305, %171
  %307 = mul i32 %306, 6
  %308 = add nsw i32 %307, 3
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %0, i64 %309
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !11
  %312 = fmul contract float %169, %311
  store float %312, float addrspace(1)* %310, align 4, !tbaa !11
  %313 = or i32 %272, 5
  %314 = add i32 %313, %171
  %315 = mul i32 %314, 6
  %316 = add nsw i32 %315, 3
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds float, float addrspace(1)* %0, i64 %317
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !11
  %320 = fmul contract float %169, %319
  store float %320, float addrspace(1)* %318, align 4, !tbaa !11
  %321 = or i32 %272, 6
  %322 = add i32 %321, %171
  %323 = mul i32 %322, 6
  %324 = add nsw i32 %323, 3
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(1)* %0, i64 %325
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !11
  %328 = fmul contract float %169, %327
  store float %328, float addrspace(1)* %326, align 4, !tbaa !11
  %329 = or i32 %272, 7
  %330 = add i32 %329, %171
  %331 = mul i32 %330, 6
  %332 = add nsw i32 %331, 3
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float addrspace(1)* %0, i64 %333
  %335 = load float, float addrspace(1)* %334, align 4, !tbaa !11
  %336 = fmul contract float %169, %335
  store float %336, float addrspace(1)* %334, align 4, !tbaa !11
  %337 = add nuw nsw i32 %272, 8
  %338 = add i32 %273, 8
  %339 = icmp eq i32 %338, %175
  br i1 %339, label %254, label %271, !llvm.loop !20
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = !{!9, !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !15}
