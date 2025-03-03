; ModuleID = '../data/hip_kernels/15241/2/main.cu'
source_filename = "../data/hip_kernels/15241/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10cudaKerneliPdPiS0_S0_(i32 %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %0
  %24 = icmp slt i32 %22, %0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %365

26:                                               ; preds = %5
  %27 = add nsw i32 %0, -2
  %28 = add i32 %27, %14
  %29 = add i32 %27, %22
  %30 = srem i32 %28, %0
  %31 = srem i32 %29, %0
  %32 = mul nsw i32 %30, %0
  %33 = add nsw i32 %32, %31
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sitofp i32 %36 to double
  %38 = load double, double addrspace(1)* %1, align 8, !tbaa !11, !amdgpu.noclobber !5
  %39 = fmul contract double %38, %37
  %40 = fadd contract double %39, 0.000000e+00
  %41 = srem i32 %28, %0
  %42 = add i32 %29, 1
  %43 = srem i32 %42, %0
  %44 = mul nsw i32 %41, %0
  %45 = add nsw i32 %44, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !11, !amdgpu.noclobber !5
  %52 = fmul contract double %51, %49
  %53 = fadd contract double %40, %52
  %54 = srem i32 %28, %0
  %55 = add i32 %22, %0
  %56 = srem i32 %55, %0
  %57 = mul nsw i32 %54, %0
  %58 = add nsw i32 %57, %56
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = sitofp i32 %61 to double
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 2
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !11, !amdgpu.noclobber !5
  %65 = fmul contract double %64, %62
  %66 = fadd contract double %53, %65
  %67 = srem i32 %28, %0
  %68 = add i32 %29, 3
  %69 = srem i32 %68, %0
  %70 = mul nsw i32 %67, %0
  %71 = add nsw i32 %70, %69
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = sitofp i32 %74 to double
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 3
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !11, !amdgpu.noclobber !5
  %78 = fmul contract double %77, %75
  %79 = fadd contract double %66, %78
  %80 = srem i32 %28, %0
  %81 = add i32 %29, 4
  %82 = srem i32 %81, %0
  %83 = mul nsw i32 %80, %0
  %84 = add nsw i32 %83, %82
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = sitofp i32 %87 to double
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 4
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !11, !amdgpu.noclobber !5
  %91 = fmul contract double %90, %88
  %92 = fadd contract double %79, %91
  %93 = add i32 %28, 1
  %94 = srem i32 %93, %0
  %95 = srem i32 %29, %0
  %96 = mul nsw i32 %94, %0
  %97 = add nsw i32 %96, %95
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = sitofp i32 %100 to double
  %102 = getelementptr inbounds double, double addrspace(1)* %1, i64 5
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !11, !amdgpu.noclobber !5
  %104 = fmul contract double %103, %101
  %105 = fadd contract double %92, %104
  %106 = srem i32 %93, %0
  %107 = add i32 %29, 1
  %108 = srem i32 %107, %0
  %109 = mul nsw i32 %106, %0
  %110 = add nsw i32 %109, %108
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = sitofp i32 %113 to double
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 6
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !11, !amdgpu.noclobber !5
  %117 = fmul contract double %116, %114
  %118 = fadd contract double %105, %117
  %119 = srem i32 %93, %0
  %120 = add i32 %22, %0
  %121 = srem i32 %120, %0
  %122 = mul nsw i32 %119, %0
  %123 = add nsw i32 %122, %121
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = sitofp i32 %126 to double
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 7
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !11, !amdgpu.noclobber !5
  %130 = fmul contract double %129, %127
  %131 = fadd contract double %118, %130
  %132 = srem i32 %93, %0
  %133 = add i32 %29, 3
  %134 = srem i32 %133, %0
  %135 = mul nsw i32 %132, %0
  %136 = add nsw i32 %135, %134
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = sitofp i32 %139 to double
  %141 = getelementptr inbounds double, double addrspace(1)* %1, i64 8
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !11, !amdgpu.noclobber !5
  %143 = fmul contract double %142, %140
  %144 = fadd contract double %131, %143
  %145 = srem i32 %93, %0
  %146 = add i32 %29, 4
  %147 = srem i32 %146, %0
  %148 = mul nsw i32 %145, %0
  %149 = add nsw i32 %148, %147
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = sitofp i32 %152 to double
  %154 = getelementptr inbounds double, double addrspace(1)* %1, i64 9
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !11, !amdgpu.noclobber !5
  %156 = fmul contract double %155, %153
  %157 = fadd contract double %144, %156
  %158 = add i32 %14, %0
  %159 = srem i32 %158, %0
  %160 = srem i32 %29, %0
  %161 = mul nsw i32 %159, %0
  %162 = add nsw i32 %161, %160
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = sitofp i32 %165 to double
  %167 = getelementptr inbounds double, double addrspace(1)* %1, i64 10
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !11, !amdgpu.noclobber !5
  %169 = fmul contract double %168, %166
  %170 = fadd contract double %157, %169
  %171 = srem i32 %158, %0
  %172 = add i32 %29, 1
  %173 = srem i32 %172, %0
  %174 = mul nsw i32 %171, %0
  %175 = add nsw i32 %174, %173
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %176
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !5
  %179 = sitofp i32 %178 to double
  %180 = getelementptr inbounds double, double addrspace(1)* %1, i64 11
  %181 = load double, double addrspace(1)* %180, align 8, !tbaa !11, !amdgpu.noclobber !5
  %182 = fmul contract double %181, %179
  %183 = fadd contract double %170, %182
  %184 = srem i32 %158, %0
  %185 = add i32 %29, 3
  %186 = srem i32 %185, %0
  %187 = mul nsw i32 %184, %0
  %188 = add nsw i32 %187, %186
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %189
  %191 = load i32, i32 addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !5
  %192 = sitofp i32 %191 to double
  %193 = getelementptr inbounds double, double addrspace(1)* %1, i64 13
  %194 = load double, double addrspace(1)* %193, align 8, !tbaa !11, !amdgpu.noclobber !5
  %195 = fmul contract double %194, %192
  %196 = fadd contract double %183, %195
  %197 = srem i32 %158, %0
  %198 = add i32 %29, 4
  %199 = srem i32 %198, %0
  %200 = mul nsw i32 %197, %0
  %201 = add nsw i32 %200, %199
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %202
  %204 = load i32, i32 addrspace(1)* %203, align 4, !tbaa !7, !amdgpu.noclobber !5
  %205 = sitofp i32 %204 to double
  %206 = getelementptr inbounds double, double addrspace(1)* %1, i64 14
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !11, !amdgpu.noclobber !5
  %208 = fmul contract double %207, %205
  %209 = fadd contract double %196, %208
  %210 = add i32 %28, 3
  %211 = srem i32 %210, %0
  %212 = srem i32 %29, %0
  %213 = mul nsw i32 %211, %0
  %214 = add nsw i32 %213, %212
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %215
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !7, !amdgpu.noclobber !5
  %218 = sitofp i32 %217 to double
  %219 = getelementptr inbounds double, double addrspace(1)* %1, i64 15
  %220 = load double, double addrspace(1)* %219, align 8, !tbaa !11, !amdgpu.noclobber !5
  %221 = fmul contract double %220, %218
  %222 = fadd contract double %209, %221
  %223 = srem i32 %210, %0
  %224 = add i32 %29, 1
  %225 = srem i32 %224, %0
  %226 = mul nsw i32 %223, %0
  %227 = add nsw i32 %226, %225
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %228
  %230 = load i32, i32 addrspace(1)* %229, align 4, !tbaa !7, !amdgpu.noclobber !5
  %231 = sitofp i32 %230 to double
  %232 = getelementptr inbounds double, double addrspace(1)* %1, i64 16
  %233 = load double, double addrspace(1)* %232, align 8, !tbaa !11, !amdgpu.noclobber !5
  %234 = fmul contract double %233, %231
  %235 = fadd contract double %222, %234
  %236 = srem i32 %210, %0
  %237 = add i32 %22, %0
  %238 = srem i32 %237, %0
  %239 = mul nsw i32 %236, %0
  %240 = add nsw i32 %239, %238
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %241
  %243 = load i32, i32 addrspace(1)* %242, align 4, !tbaa !7, !amdgpu.noclobber !5
  %244 = sitofp i32 %243 to double
  %245 = getelementptr inbounds double, double addrspace(1)* %1, i64 17
  %246 = load double, double addrspace(1)* %245, align 8, !tbaa !11, !amdgpu.noclobber !5
  %247 = fmul contract double %246, %244
  %248 = fadd contract double %235, %247
  %249 = srem i32 %210, %0
  %250 = add i32 %29, 3
  %251 = srem i32 %250, %0
  %252 = mul nsw i32 %249, %0
  %253 = add nsw i32 %252, %251
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %254
  %256 = load i32, i32 addrspace(1)* %255, align 4, !tbaa !7, !amdgpu.noclobber !5
  %257 = sitofp i32 %256 to double
  %258 = getelementptr inbounds double, double addrspace(1)* %1, i64 18
  %259 = load double, double addrspace(1)* %258, align 8, !tbaa !11, !amdgpu.noclobber !5
  %260 = fmul contract double %259, %257
  %261 = fadd contract double %248, %260
  %262 = srem i32 %210, %0
  %263 = add i32 %29, 4
  %264 = srem i32 %263, %0
  %265 = mul nsw i32 %262, %0
  %266 = add nsw i32 %265, %264
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %267
  %269 = load i32, i32 addrspace(1)* %268, align 4, !tbaa !7, !amdgpu.noclobber !5
  %270 = sitofp i32 %269 to double
  %271 = getelementptr inbounds double, double addrspace(1)* %1, i64 19
  %272 = load double, double addrspace(1)* %271, align 8, !tbaa !11, !amdgpu.noclobber !5
  %273 = fmul contract double %272, %270
  %274 = fadd contract double %261, %273
  %275 = add i32 %28, 4
  %276 = srem i32 %275, %0
  %277 = srem i32 %29, %0
  %278 = mul nsw i32 %276, %0
  %279 = add nsw i32 %278, %277
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %280
  %282 = load i32, i32 addrspace(1)* %281, align 4, !tbaa !7, !amdgpu.noclobber !5
  %283 = sitofp i32 %282 to double
  %284 = getelementptr inbounds double, double addrspace(1)* %1, i64 20
  %285 = load double, double addrspace(1)* %284, align 8, !tbaa !11, !amdgpu.noclobber !5
  %286 = fmul contract double %285, %283
  %287 = fadd contract double %274, %286
  %288 = srem i32 %275, %0
  %289 = add i32 %29, 1
  %290 = srem i32 %289, %0
  %291 = mul nsw i32 %288, %0
  %292 = add nsw i32 %291, %290
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !7, !amdgpu.noclobber !5
  %296 = sitofp i32 %295 to double
  %297 = getelementptr inbounds double, double addrspace(1)* %1, i64 21
  %298 = load double, double addrspace(1)* %297, align 8, !tbaa !11, !amdgpu.noclobber !5
  %299 = fmul contract double %298, %296
  %300 = fadd contract double %287, %299
  %301 = srem i32 %275, %0
  %302 = add i32 %22, %0
  %303 = srem i32 %302, %0
  %304 = mul nsw i32 %301, %0
  %305 = add nsw i32 %304, %303
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %306
  %308 = load i32, i32 addrspace(1)* %307, align 4, !tbaa !7, !amdgpu.noclobber !5
  %309 = sitofp i32 %308 to double
  %310 = getelementptr inbounds double, double addrspace(1)* %1, i64 22
  %311 = load double, double addrspace(1)* %310, align 8, !tbaa !11, !amdgpu.noclobber !5
  %312 = fmul contract double %311, %309
  %313 = fadd contract double %300, %312
  %314 = srem i32 %275, %0
  %315 = add i32 %29, 3
  %316 = srem i32 %315, %0
  %317 = mul nsw i32 %314, %0
  %318 = add nsw i32 %317, %316
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %319
  %321 = load i32, i32 addrspace(1)* %320, align 4, !tbaa !7, !amdgpu.noclobber !5
  %322 = sitofp i32 %321 to double
  %323 = getelementptr inbounds double, double addrspace(1)* %1, i64 23
  %324 = load double, double addrspace(1)* %323, align 8, !tbaa !11, !amdgpu.noclobber !5
  %325 = fmul contract double %324, %322
  %326 = fadd contract double %313, %325
  %327 = srem i32 %275, %0
  %328 = add i32 %29, 4
  %329 = srem i32 %328, %0
  %330 = mul nsw i32 %327, %0
  %331 = add nsw i32 %330, %329
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %332
  %334 = load i32, i32 addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !5
  %335 = sitofp i32 %334 to double
  %336 = getelementptr inbounds double, double addrspace(1)* %1, i64 24
  %337 = load double, double addrspace(1)* %336, align 8, !tbaa !11, !amdgpu.noclobber !5
  %338 = fmul contract double %337, %335
  %339 = fadd contract double %326, %338
  %340 = fcmp contract olt double %339, 1.000000e-04
  %341 = fcmp contract ogt double %339, -1.000000e-04
  %342 = and i1 %340, %341
  br i1 %342, label %343, label %350

343:                                              ; preds = %26
  %344 = mul nsw i32 %14, %0
  %345 = add nsw i32 %344, %22
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %346
  %348 = load i32, i32 addrspace(1)* %347, align 4, !tbaa !7, !amdgpu.noclobber !5
  %349 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %346
  store i32 %348, i32 addrspace(1)* %349, align 4, !tbaa !7
  br label %365

350:                                              ; preds = %26
  %351 = fcmp contract ogt double %339, 1.000000e-05
  %352 = mul nsw i32 %14, %0
  %353 = add nsw i32 %352, %22
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %354
  %356 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %354
  br i1 %351, label %357, label %361

357:                                              ; preds = %350
  store i32 1, i32 addrspace(1)* %355, align 4, !tbaa !7
  %358 = load i32, i32 addrspace(1)* %356, align 4, !tbaa !7
  %359 = icmp eq i32 %358, -1
  br i1 %359, label %360, label %365

360:                                              ; preds = %357
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !7
  br label %365

361:                                              ; preds = %350
  store i32 -1, i32 addrspace(1)* %355, align 4, !tbaa !7
  %362 = load i32, i32 addrspace(1)* %356, align 4, !tbaa !7
  %363 = icmp eq i32 %362, 1
  br i1 %363, label %364, label %365

364:                                              ; preds = %361
  store i32 1, i32 addrspace(1)* %4, align 4, !tbaa !7
  br label %365

365:                                              ; preds = %343, %361, %364, %357, %360, %5
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
