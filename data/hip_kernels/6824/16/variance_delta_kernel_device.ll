; ModuleID = '../data/hip_kernels/6824/16/main.cu'
source_filename = "../data/hip_kernels/6824/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21variance_delta_kernelPfS_S_S_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !4
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %18
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %5
  br i1 %29, label %30, label %328

30:                                               ; preds = %8
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %7, i64 %31
  store float 0.000000e+00, float addrspace(1)* %32, align 4, !tbaa !16
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %34, label %167

34:                                               ; preds = %30
  %35 = icmp sgt i32 %6, 0
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %37 = and i32 %6, 7
  %38 = icmp ult i32 %6, 8
  %39 = and i32 %6, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %34, %163
  %42 = phi float [ 0.000000e+00, %34 ], [ %164, %163 ]
  %43 = phi i32 [ 0, %34 ], [ %165, %163 ]
  br i1 %35, label %44, label %163

44:                                               ; preds = %41
  %45 = mul nsw i32 %43, %5
  %46 = add i32 %45, %28
  %47 = mul i32 %46, %6
  br i1 %38, label %142, label %48

48:                                               ; preds = %44, %48
  %49 = phi float [ %138, %48 ], [ %42, %44 ]
  %50 = phi i32 [ %139, %48 ], [ 0, %44 ]
  %51 = phi i32 [ %140, %48 ], [ 0, %44 ]
  %52 = add nsw i32 %50, %47
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %59 = fsub contract float %57, %58
  %60 = fmul contract float %55, %59
  %61 = fadd contract float %49, %60
  store float %61, float addrspace(1)* %32, align 4, !tbaa !16
  %62 = or i32 %50, 1
  %63 = add nsw i32 %62, %47
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %70 = fsub contract float %68, %69
  %71 = fmul contract float %66, %70
  %72 = fadd contract float %61, %71
  store float %72, float addrspace(1)* %32, align 4, !tbaa !16
  %73 = or i32 %50, 2
  %74 = add nsw i32 %73, %47
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %81 = fsub contract float %79, %80
  %82 = fmul contract float %77, %81
  %83 = fadd contract float %72, %82
  store float %83, float addrspace(1)* %32, align 4, !tbaa !16
  %84 = or i32 %50, 3
  %85 = add nsw i32 %84, %47
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %92 = fsub contract float %90, %91
  %93 = fmul contract float %88, %92
  %94 = fadd contract float %83, %93
  store float %94, float addrspace(1)* %32, align 4, !tbaa !16
  %95 = or i32 %50, 4
  %96 = add nsw i32 %95, %47
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16
  %102 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %103 = fsub contract float %101, %102
  %104 = fmul contract float %99, %103
  %105 = fadd contract float %94, %104
  store float %105, float addrspace(1)* %32, align 4, !tbaa !16
  %106 = or i32 %50, 5
  %107 = add nsw i32 %106, %47
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %114 = fsub contract float %112, %113
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %105, %115
  store float %116, float addrspace(1)* %32, align 4, !tbaa !16
  %117 = or i32 %50, 6
  %118 = add nsw i32 %117, %47
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %125 = fsub contract float %123, %124
  %126 = fmul contract float %121, %125
  %127 = fadd contract float %116, %126
  store float %127, float addrspace(1)* %32, align 4, !tbaa !16
  %128 = or i32 %50, 7
  %129 = add nsw i32 %128, %47
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %136 = fsub contract float %134, %135
  %137 = fmul contract float %132, %136
  %138 = fadd contract float %127, %137
  store float %138, float addrspace(1)* %32, align 4, !tbaa !16
  %139 = add nuw nsw i32 %50, 8
  %140 = add i32 %51, 8
  %141 = icmp eq i32 %140, %39
  br i1 %141, label %142, label %48, !llvm.loop !20

142:                                              ; preds = %48, %44
  %143 = phi float [ undef, %44 ], [ %138, %48 ]
  %144 = phi float [ %42, %44 ], [ %138, %48 ]
  %145 = phi i32 [ 0, %44 ], [ %139, %48 ]
  br i1 %40, label %163, label %146

146:                                              ; preds = %142, %146
  %147 = phi float [ %159, %146 ], [ %144, %142 ]
  %148 = phi i32 [ %160, %146 ], [ %145, %142 ]
  %149 = phi i32 [ %161, %146 ], [ 0, %142 ]
  %150 = add nsw i32 %148, %47
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !16
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %157 = fsub contract float %155, %156
  %158 = fmul contract float %153, %157
  %159 = fadd contract float %147, %158
  store float %159, float addrspace(1)* %32, align 4, !tbaa !16
  %160 = add nuw nsw i32 %148, 1
  %161 = add i32 %149, 1
  %162 = icmp eq i32 %161, %37
  br i1 %162, label %163, label %146, !llvm.loop !22

163:                                              ; preds = %142, %146, %41
  %164 = phi float [ %42, %41 ], [ %143, %142 ], [ %159, %146 ]
  %165 = add nuw nsw i32 %43, 1
  %166 = icmp eq i32 %165, %4
  br i1 %166, label %167, label %41, !llvm.loop !24

167:                                              ; preds = %163, %30
  %168 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16
  %170 = fadd contract float %169, 0x3EE4F8B580000000
  %171 = tail call float @llvm.fabs.f32(float %170)
  %172 = tail call float @llvm.amdgcn.frexp.mant.f32(float %171)
  %173 = fcmp olt float %172, 0x3FE5555560000000
  %174 = zext i1 %173 to i32
  %175 = tail call float @llvm.amdgcn.ldexp.f32(float %172, i32 %174)
  %176 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %171)
  %177 = sub nsw i32 %176, %174
  %178 = fadd float %175, -1.000000e+00
  %179 = fadd float %175, 1.000000e+00
  %180 = fadd float %179, -1.000000e+00
  %181 = fsub float %175, %180
  %182 = tail call float @llvm.amdgcn.rcp.f32(float %179)
  %183 = fmul float %178, %182
  %184 = fmul float %179, %183
  %185 = fneg float %184
  %186 = tail call float @llvm.fma.f32(float %183, float %179, float %185)
  %187 = tail call float @llvm.fma.f32(float %183, float %181, float %186)
  %188 = fadd float %184, %187
  %189 = fsub float %188, %184
  %190 = fsub float %187, %189
  %191 = fsub float %178, %188
  %192 = fsub float %178, %191
  %193 = fsub float %192, %188
  %194 = fsub float %193, %190
  %195 = fadd float %191, %194
  %196 = fmul float %182, %195
  %197 = fadd float %183, %196
  %198 = fsub float %197, %183
  %199 = fsub float %196, %198
  %200 = fmul float %197, %197
  %201 = fneg float %200
  %202 = tail call float @llvm.fma.f32(float %197, float %197, float %201)
  %203 = fmul float %199, 2.000000e+00
  %204 = tail call float @llvm.fma.f32(float %197, float %203, float %202)
  %205 = fadd float %200, %204
  %206 = fsub float %205, %200
  %207 = fsub float %204, %206
  %208 = tail call float @llvm.fmuladd.f32(float %205, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %209 = tail call float @llvm.fmuladd.f32(float %205, float %208, float 0x3FD999BDE0000000)
  %210 = sitofp i32 %177 to float
  %211 = fmul float %210, 0x3FE62E4300000000
  %212 = fneg float %211
  %213 = tail call float @llvm.fma.f32(float %210, float 0x3FE62E4300000000, float %212)
  %214 = tail call float @llvm.fma.f32(float %210, float 0xBE205C6100000000, float %213)
  %215 = fadd float %211, %214
  %216 = fsub float %215, %211
  %217 = fsub float %214, %216
  %218 = tail call float @llvm.amdgcn.ldexp.f32(float %197, i32 1)
  %219 = fmul float %197, %205
  %220 = fneg float %219
  %221 = tail call float @llvm.fma.f32(float %205, float %197, float %220)
  %222 = tail call float @llvm.fma.f32(float %205, float %199, float %221)
  %223 = tail call float @llvm.fma.f32(float %207, float %197, float %222)
  %224 = fadd float %219, %223
  %225 = fsub float %224, %219
  %226 = fsub float %223, %225
  %227 = fmul float %205, %209
  %228 = fneg float %227
  %229 = tail call float @llvm.fma.f32(float %205, float %209, float %228)
  %230 = tail call float @llvm.fma.f32(float %207, float %209, float %229)
  %231 = fadd float %227, %230
  %232 = fsub float %231, %227
  %233 = fsub float %230, %232
  %234 = fadd float %231, 0x3FE5555540000000
  %235 = fadd float %234, 0xBFE5555540000000
  %236 = fsub float %231, %235
  %237 = fadd float %233, 0x3E2E720200000000
  %238 = fadd float %237, %236
  %239 = fadd float %234, %238
  %240 = fsub float %239, %234
  %241 = fsub float %238, %240
  %242 = fmul float %224, %239
  %243 = fneg float %242
  %244 = tail call float @llvm.fma.f32(float %224, float %239, float %243)
  %245 = tail call float @llvm.fma.f32(float %224, float %241, float %244)
  %246 = tail call float @llvm.fma.f32(float %226, float %239, float %245)
  %247 = tail call float @llvm.amdgcn.ldexp.f32(float %199, i32 1)
  %248 = fadd float %242, %246
  %249 = fsub float %248, %242
  %250 = fsub float %246, %249
  %251 = fadd float %218, %248
  %252 = fsub float %251, %218
  %253 = fsub float %248, %252
  %254 = fadd float %247, %250
  %255 = fadd float %254, %253
  %256 = fadd float %251, %255
  %257 = fsub float %256, %251
  %258 = fsub float %255, %257
  %259 = fadd float %215, %256
  %260 = fsub float %259, %215
  %261 = fsub float %259, %260
  %262 = fsub float %215, %261
  %263 = fsub float %256, %260
  %264 = fadd float %263, %262
  %265 = fadd float %217, %258
  %266 = fsub float %265, %217
  %267 = fsub float %265, %266
  %268 = fsub float %217, %267
  %269 = fsub float %258, %266
  %270 = fadd float %269, %268
  %271 = fadd float %265, %264
  %272 = fadd float %259, %271
  %273 = fsub float %272, %259
  %274 = fsub float %271, %273
  %275 = fadd float %270, %274
  %276 = fadd float %272, %275
  %277 = fsub float %276, %272
  %278 = fsub float %275, %277
  %279 = fmul float %276, -1.500000e+00
  %280 = fneg float %279
  %281 = tail call float @llvm.fma.f32(float %276, float -1.500000e+00, float %280)
  %282 = tail call float @llvm.fma.f32(float %278, float -1.500000e+00, float %281)
  %283 = fadd float %279, %282
  %284 = fsub float %283, %279
  %285 = fsub float %282, %284
  %286 = tail call float @llvm.fabs.f32(float %279) #3
  %287 = fcmp oeq float %286, 0x7FF0000000000000
  %288 = select i1 %287, float %279, float %283
  %289 = tail call float @llvm.fabs.f32(float %288) #3
  %290 = fcmp oeq float %289, 0x7FF0000000000000
  %291 = select i1 %290, float 0.000000e+00, float %285
  %292 = fcmp oeq float %288, 0x40562E4300000000
  %293 = select i1 %292, float 0x3EE0000000000000, float 0.000000e+00
  %294 = fsub float %288, %293
  %295 = fadd float %293, %291
  %296 = fmul float %294, 0x3FF7154760000000
  %297 = tail call float @llvm.rint.f32(float %296)
  %298 = fcmp ogt float %294, 0x40562E4300000000
  %299 = fcmp olt float %294, 0xC059D1DA00000000
  %300 = fneg float %296
  %301 = tail call float @llvm.fma.f32(float %294, float 0x3FF7154760000000, float %300)
  %302 = tail call float @llvm.fma.f32(float %294, float 0x3E54AE0BE0000000, float %301)
  %303 = fsub float %296, %297
  %304 = fadd float %302, %303
  %305 = tail call float @llvm.exp2.f32(float %304)
  %306 = fptosi float %297 to i32
  %307 = tail call float @llvm.amdgcn.ldexp.f32(float %305, i32 %306)
  %308 = select i1 %299, float 0.000000e+00, float %307
  %309 = select i1 %298, float 0x7FF0000000000000, float %308
  %310 = tail call float @llvm.fma.f32(float %309, float %295, float %309)
  %311 = tail call float @llvm.fabs.f32(float %309) #3
  %312 = fcmp oeq float %311, 0x7FF0000000000000
  %313 = select i1 %312, float %309, float %310
  %314 = fcmp uge float %170, 0.000000e+00
  %315 = tail call float @llvm.fabs.f32(float %313)
  %316 = fcmp oeq float %171, 0x7FF0000000000000
  %317 = fcmp oeq float %170, 0.000000e+00
  %318 = fcmp uno float %170, 0.000000e+00
  %319 = fcmp oeq float %170, 1.000000e+00
  %320 = fmul contract float %315, -5.000000e-01
  %321 = select i1 %314, float %320, float 0x7FF8000000000000
  %322 = select i1 %316, float -0.000000e+00, float %321
  %323 = select i1 %317, float 0xFFF0000000000000, float %322
  %324 = select i1 %318, float 0x7FF8000000000000, float %323
  %325 = select i1 %319, float -5.000000e-01, float %324
  %326 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %327 = fmul contract float %326, %325
  store float %327, float addrspace(1)* %32, align 4, !tbaa !16
  br label %328

328:                                              ; preds = %8, %167
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
