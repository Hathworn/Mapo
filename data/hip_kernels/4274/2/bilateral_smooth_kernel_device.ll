; ModuleID = '../data/hip_kernels/4274/2/main.cu'
source_filename = "../data/hip_kernels/4274/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23bilateral_smooth_kernelPfS_S_iiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = mul nsw i32 %4, %3
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %324

20:                                               ; preds = %8
  %21 = freeze i32 %17
  %22 = freeze i32 %4
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = sub i32 0, %5
  %27 = icmp slt i32 %5, 0
  br i1 %27, label %63, label %28

28:                                               ; preds = %20
  %29 = mul nsw i32 %23, %4
  %30 = add nsw i32 %29, %25
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = add nsw i32 %30, %18
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = shl nsw i32 %18, 1
  %37 = add nsw i32 %30, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = fmul contract float %6, 2.000000e+00
  %41 = fmul contract float %40, %6
  %42 = fmul contract float %7, 2.000000e+00
  %43 = fmul contract float %42, %7
  br label %44

44:                                               ; preds = %28, %137
  %45 = phi double [ 0.000000e+00, %28 ], [ %309, %137 ]
  %46 = phi double [ 0.000000e+00, %28 ], [ %310, %137 ]
  %47 = phi double [ 0.000000e+00, %28 ], [ %311, %137 ]
  %48 = phi double [ 0.000000e+00, %28 ], [ %312, %137 ]
  %49 = phi double [ 0.000000e+00, %28 ], [ %313, %137 ]
  %50 = phi double [ 0.000000e+00, %28 ], [ %314, %137 ]
  %51 = phi double [ 0.000000e+00, %28 ], [ %315, %137 ]
  %52 = phi double [ 0.000000e+00, %28 ], [ %316, %137 ]
  %53 = phi double [ 0.000000e+00, %28 ], [ %317, %137 ]
  %54 = phi double [ 0.000000e+00, %28 ], [ %318, %137 ]
  %55 = phi double [ 0.000000e+00, %28 ], [ %319, %137 ]
  %56 = phi double [ 0.000000e+00, %28 ], [ %320, %137 ]
  %57 = phi double [ 0.000000e+00, %28 ], [ %321, %137 ]
  %58 = phi i32 [ %26, %28 ], [ %138, %137 ]
  %59 = add nsw i32 %58, %25
  %60 = icmp sgt i32 %59, -1
  %61 = icmp slt i32 %59, %4
  %62 = mul nsw i32 %58, %58
  br label %140

63:                                               ; preds = %137, %20
  %64 = phi double [ 0.000000e+00, %20 ], [ %309, %137 ]
  %65 = phi double [ 0.000000e+00, %20 ], [ %310, %137 ]
  %66 = phi double [ 0.000000e+00, %20 ], [ %311, %137 ]
  %67 = phi double [ 0.000000e+00, %20 ], [ %312, %137 ]
  %68 = phi double [ 0.000000e+00, %20 ], [ %313, %137 ]
  %69 = phi double [ 0.000000e+00, %20 ], [ %314, %137 ]
  %70 = phi double [ 0.000000e+00, %20 ], [ %315, %137 ]
  %71 = phi double [ 0.000000e+00, %20 ], [ %316, %137 ]
  %72 = phi double [ 0.000000e+00, %20 ], [ %317, %137 ]
  %73 = phi double [ 0.000000e+00, %20 ], [ %318, %137 ]
  %74 = phi double [ 0.000000e+00, %20 ], [ %319, %137 ]
  %75 = phi double [ 0.000000e+00, %20 ], [ %320, %137 ]
  %76 = phi double [ 0.000000e+00, %20 ], [ %321, %137 ]
  %77 = mul nsw i32 %17, 12
  %78 = fdiv contract double %64, %76
  %79 = fptrunc double %78 to float
  %80 = sext i32 %77 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %79, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = fdiv contract double %65, %76
  %83 = fptrunc double %82 to float
  %84 = or i32 %77, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %83, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = fdiv contract double %66, %76
  %88 = fptrunc double %87 to float
  %89 = or i32 %77, 2
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  store float %88, float addrspace(1)* %91, align 4, !tbaa !7
  %92 = fdiv contract double %67, %76
  %93 = fptrunc double %92 to float
  %94 = or i32 %77, 3
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !7
  %97 = fdiv contract double %68, %76
  %98 = fptrunc double %97 to float
  %99 = add nsw i32 %77, 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !7
  %102 = fdiv contract double %69, %76
  %103 = fptrunc double %102 to float
  %104 = add nsw i32 %77, 5
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %103, float addrspace(1)* %106, align 4, !tbaa !7
  %107 = fdiv contract double %70, %76
  %108 = fptrunc double %107 to float
  %109 = add nsw i32 %77, 6
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  store float %108, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = fdiv contract double %71, %76
  %113 = fptrunc double %112 to float
  %114 = add nsw i32 %77, 7
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  store float %113, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = fdiv contract double %72, %76
  %118 = fptrunc double %117 to float
  %119 = add nsw i32 %77, 8
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  store float %118, float addrspace(1)* %121, align 4, !tbaa !7
  %122 = fdiv contract double %73, %76
  %123 = fptrunc double %122 to float
  %124 = add nsw i32 %77, 9
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  store float %123, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = fdiv contract double %74, %76
  %128 = fptrunc double %127 to float
  %129 = add nsw i32 %77, 10
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  store float %128, float addrspace(1)* %131, align 4, !tbaa !7
  %132 = fdiv contract double %75, %76
  %133 = fptrunc double %132 to float
  %134 = add nsw i32 %77, 11
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  store float %133, float addrspace(1)* %136, align 4, !tbaa !7
  br label %324

137:                                              ; preds = %308
  %138 = add i32 %58, 1
  %139 = icmp eq i32 %58, %5
  br i1 %139, label %63, label %44, !llvm.loop !11

140:                                              ; preds = %44, %308
  %141 = phi double [ %45, %44 ], [ %309, %308 ]
  %142 = phi double [ %46, %44 ], [ %310, %308 ]
  %143 = phi double [ %47, %44 ], [ %311, %308 ]
  %144 = phi double [ %48, %44 ], [ %312, %308 ]
  %145 = phi double [ %49, %44 ], [ %313, %308 ]
  %146 = phi double [ %50, %44 ], [ %314, %308 ]
  %147 = phi double [ %51, %44 ], [ %315, %308 ]
  %148 = phi double [ %52, %44 ], [ %316, %308 ]
  %149 = phi double [ %53, %44 ], [ %317, %308 ]
  %150 = phi double [ %54, %44 ], [ %318, %308 ]
  %151 = phi double [ %55, %44 ], [ %319, %308 ]
  %152 = phi double [ %56, %44 ], [ %320, %308 ]
  %153 = phi double [ %57, %44 ], [ %321, %308 ]
  %154 = phi i32 [ %26, %44 ], [ %322, %308 ]
  %155 = add nsw i32 %154, %23
  %156 = mul nsw i32 %155, %4
  %157 = add nsw i32 %156, %59
  br i1 %60, label %158, label %308

158:                                              ; preds = %140
  %159 = icmp sgt i32 %155, -1
  %160 = select i1 %61, i1 %159, i1 false
  %161 = icmp slt i32 %155, %3
  %162 = select i1 %160, i1 %161, i1 false
  br i1 %162, label %163, label %308

163:                                              ; preds = %158
  %164 = sext i32 %157 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = fsub contract float %166, %167
  %169 = add nsw i32 %157, %18
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %174 = fsub contract float %172, %173
  %175 = add nsw i32 %157, %36
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %2, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !5
  %179 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %180 = fsub contract float %178, %179
  %181 = fmul contract float %168, %168
  %182 = fmul contract float %174, %174
  %183 = fadd contract float %181, %182
  %184 = fmul contract float %180, %180
  %185 = fadd contract float %183, %184
  %186 = mul nsw i32 %154, %154
  %187 = add nuw nsw i32 %62, %186
  %188 = sub nsw i32 0, %187
  %189 = sitofp i32 %188 to float
  %190 = fdiv contract float %189, %41
  %191 = fmul float %190, 0x3FF7154760000000
  %192 = tail call float @llvm.rint.f32(float %191)
  %193 = fcmp ogt float %190, 0x40562E4300000000
  %194 = fcmp olt float %190, 0xC059D1DA00000000
  %195 = fneg float %191
  %196 = tail call float @llvm.fma.f32(float %190, float 0x3FF7154760000000, float %195)
  %197 = tail call float @llvm.fma.f32(float %190, float 0x3E54AE0BE0000000, float %196)
  %198 = fsub float %191, %192
  %199 = fadd float %197, %198
  %200 = tail call float @llvm.exp2.f32(float %199)
  %201 = fptosi float %192 to i32
  %202 = tail call float @llvm.amdgcn.ldexp.f32(float %200, i32 %201)
  %203 = select i1 %194, float 0.000000e+00, float %202
  %204 = select i1 %193, float 0x7FF0000000000000, float %203
  %205 = fdiv contract float %185, -3.000000e+00
  %206 = fdiv contract float %205, %43
  %207 = fmul float %206, 0x3FF7154760000000
  %208 = tail call float @llvm.rint.f32(float %207)
  %209 = fcmp ogt float %206, 0x40562E4300000000
  %210 = fcmp olt float %206, 0xC059D1DA00000000
  %211 = fneg float %207
  %212 = tail call float @llvm.fma.f32(float %206, float 0x3FF7154760000000, float %211)
  %213 = tail call float @llvm.fma.f32(float %206, float 0x3E54AE0BE0000000, float %212)
  %214 = fsub float %207, %208
  %215 = fadd float %213, %214
  %216 = tail call float @llvm.exp2.f32(float %215)
  %217 = fptosi float %208 to i32
  %218 = tail call float @llvm.amdgcn.ldexp.f32(float %216, i32 %217)
  %219 = select i1 %210, float 0.000000e+00, float %218
  %220 = select i1 %209, float 0x7FF0000000000000, float %219
  %221 = fmul contract float %204, %220
  %222 = mul nsw i32 %157, 12
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7, !amdgpu.noclobber !5
  %226 = fmul contract float %221, %225
  %227 = fpext float %226 to double
  %228 = fadd contract double %141, %227
  %229 = or i32 %222, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %0, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !7, !amdgpu.noclobber !5
  %233 = fmul contract float %221, %232
  %234 = fpext float %233 to double
  %235 = fadd contract double %142, %234
  %236 = or i32 %222, 2
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %0, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7, !amdgpu.noclobber !5
  %240 = fmul contract float %221, %239
  %241 = fpext float %240 to double
  %242 = fadd contract double %143, %241
  %243 = or i32 %222, 3
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7, !amdgpu.noclobber !5
  %247 = fmul contract float %221, %246
  %248 = fpext float %247 to double
  %249 = fadd contract double %144, %248
  %250 = add nsw i32 %222, 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !5
  %254 = fmul contract float %221, %253
  %255 = fpext float %254 to double
  %256 = fadd contract double %145, %255
  %257 = add nsw i32 %222, 5
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %0, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !7, !amdgpu.noclobber !5
  %261 = fmul contract float %221, %260
  %262 = fpext float %261 to double
  %263 = fadd contract double %146, %262
  %264 = add nsw i32 %222, 6
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !7, !amdgpu.noclobber !5
  %268 = fmul contract float %221, %267
  %269 = fpext float %268 to double
  %270 = fadd contract double %147, %269
  %271 = add nsw i32 %222, 7
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %0, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7, !amdgpu.noclobber !5
  %275 = fmul contract float %221, %274
  %276 = fpext float %275 to double
  %277 = fadd contract double %148, %276
  %278 = add nsw i32 %222, 8
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds float, float addrspace(1)* %0, i64 %279
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !7, !amdgpu.noclobber !5
  %282 = fmul contract float %221, %281
  %283 = fpext float %282 to double
  %284 = fadd contract double %149, %283
  %285 = add nsw i32 %222, 9
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %0, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !7, !amdgpu.noclobber !5
  %289 = fmul contract float %221, %288
  %290 = fpext float %289 to double
  %291 = fadd contract double %150, %290
  %292 = add nsw i32 %222, 10
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %0, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !5
  %296 = fmul contract float %221, %295
  %297 = fpext float %296 to double
  %298 = fadd contract double %151, %297
  %299 = add nsw i32 %222, 11
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %0, i64 %300
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !7, !amdgpu.noclobber !5
  %303 = fmul contract float %221, %302
  %304 = fpext float %303 to double
  %305 = fadd contract double %152, %304
  %306 = fpext float %221 to double
  %307 = fadd contract double %153, %306
  br label %308

308:                                              ; preds = %163, %158, %140
  %309 = phi double [ %228, %163 ], [ %141, %158 ], [ %141, %140 ]
  %310 = phi double [ %235, %163 ], [ %142, %158 ], [ %142, %140 ]
  %311 = phi double [ %242, %163 ], [ %143, %158 ], [ %143, %140 ]
  %312 = phi double [ %249, %163 ], [ %144, %158 ], [ %144, %140 ]
  %313 = phi double [ %256, %163 ], [ %145, %158 ], [ %145, %140 ]
  %314 = phi double [ %263, %163 ], [ %146, %158 ], [ %146, %140 ]
  %315 = phi double [ %270, %163 ], [ %147, %158 ], [ %147, %140 ]
  %316 = phi double [ %277, %163 ], [ %148, %158 ], [ %148, %140 ]
  %317 = phi double [ %284, %163 ], [ %149, %158 ], [ %149, %140 ]
  %318 = phi double [ %291, %163 ], [ %150, %158 ], [ %150, %140 ]
  %319 = phi double [ %298, %163 ], [ %151, %158 ], [ %151, %140 ]
  %320 = phi double [ %305, %163 ], [ %152, %158 ], [ %152, %140 ]
  %321 = phi double [ %307, %163 ], [ %153, %158 ], [ %153, %140 ]
  %322 = add i32 %154, 1
  %323 = icmp eq i32 %154, %5
  br i1 %323, label %137, label %140, !llvm.loop !13

324:                                              ; preds = %63, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
