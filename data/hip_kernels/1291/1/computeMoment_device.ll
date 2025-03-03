; ModuleID = '../data/hip_kernels/1291/1/main.cu'
source_filename = "../data/hip_kernels/1291/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13computeMomentPiS_Pdi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, 517
  %23 = icmp slt i32 %21, 517
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %335

25:                                               ; preds = %4
  %26 = add i32 %13, %3
  %27 = add i32 %21, %3
  %28 = add i32 %27, -2
  %29 = add i32 %26, -2
  %30 = srem i32 %29, %3
  %31 = mul nsw i32 %30, %3
  %32 = srem i32 %28, %3
  %33 = getelementptr inbounds double, double addrspace(1)* %2, i64 -12
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %31, %32
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !5
  %39 = sitofp i32 %38 to double
  %40 = fmul contract double %34, %39
  %41 = fadd contract double %40, 0.000000e+00
  %42 = fptrunc double %41 to float
  %43 = add i32 %27, -1
  %44 = srem i32 %43, %3
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 -11
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %31, %44
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = sitofp i32 %50 to double
  %52 = fmul contract double %46, %51
  %53 = fpext float %42 to double
  %54 = fadd contract double %52, %53
  %55 = fptrunc double %54 to float
  %56 = srem i32 %27, %3
  %57 = getelementptr inbounds double, double addrspace(1)* %2, i64 -10
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = add nsw i32 %31, %56
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !11, !amdgpu.noclobber !5
  %63 = sitofp i32 %62 to double
  %64 = fmul contract double %58, %63
  %65 = fpext float %55 to double
  %66 = fadd contract double %64, %65
  %67 = fptrunc double %66 to float
  %68 = add i32 %27, 1
  %69 = srem i32 %68, %3
  %70 = getelementptr inbounds double, double addrspace(1)* %2, i64 -9
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !5
  %72 = add nsw i32 %31, %69
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !11, !amdgpu.noclobber !5
  %76 = sitofp i32 %75 to double
  %77 = fmul contract double %71, %76
  %78 = fpext float %67 to double
  %79 = fadd contract double %77, %78
  %80 = fptrunc double %79 to float
  %81 = add i32 %27, 2
  %82 = srem i32 %81, %3
  %83 = getelementptr inbounds double, double addrspace(1)* %2, i64 -8
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = add nsw i32 %31, %82
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !11, !amdgpu.noclobber !5
  %89 = sitofp i32 %88 to double
  %90 = fmul contract double %84, %89
  %91 = fpext float %80 to double
  %92 = fadd contract double %90, %91
  %93 = fptrunc double %92 to float
  %94 = add i32 %26, -1
  %95 = srem i32 %94, %3
  %96 = mul nsw i32 %95, %3
  %97 = getelementptr inbounds double, double addrspace(1)* %2, i64 -7
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !7, !amdgpu.noclobber !5
  %99 = add nsw i32 %96, %32
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !11, !amdgpu.noclobber !5
  %103 = sitofp i32 %102 to double
  %104 = fmul contract double %98, %103
  %105 = fpext float %93 to double
  %106 = fadd contract double %104, %105
  %107 = fptrunc double %106 to float
  %108 = getelementptr inbounds double, double addrspace(1)* %2, i64 -6
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7, !amdgpu.noclobber !5
  %110 = add nsw i32 %96, %44
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !5
  %114 = sitofp i32 %113 to double
  %115 = fmul contract double %109, %114
  %116 = fpext float %107 to double
  %117 = fadd contract double %115, %116
  %118 = fptrunc double %117 to float
  %119 = getelementptr inbounds double, double addrspace(1)* %2, i64 -5
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7, !amdgpu.noclobber !5
  %121 = add nsw i32 %96, %56
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !11, !amdgpu.noclobber !5
  %125 = sitofp i32 %124 to double
  %126 = fmul contract double %120, %125
  %127 = fpext float %118 to double
  %128 = fadd contract double %126, %127
  %129 = fptrunc double %128 to float
  %130 = getelementptr inbounds double, double addrspace(1)* %2, i64 -4
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !7, !amdgpu.noclobber !5
  %132 = add nsw i32 %96, %69
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !11, !amdgpu.noclobber !5
  %136 = sitofp i32 %135 to double
  %137 = fmul contract double %131, %136
  %138 = fpext float %129 to double
  %139 = fadd contract double %137, %138
  %140 = fptrunc double %139 to float
  %141 = getelementptr inbounds double, double addrspace(1)* %2, i64 -3
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !7, !amdgpu.noclobber !5
  %143 = add nsw i32 %96, %82
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %144
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !11, !amdgpu.noclobber !5
  %147 = sitofp i32 %146 to double
  %148 = fmul contract double %142, %147
  %149 = fpext float %140 to double
  %150 = fadd contract double %148, %149
  %151 = fptrunc double %150 to float
  %152 = srem i32 %26, %3
  %153 = mul nsw i32 %152, %3
  %154 = getelementptr inbounds double, double addrspace(1)* %2, i64 -2
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !7, !amdgpu.noclobber !5
  %156 = add nsw i32 %153, %32
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !11, !amdgpu.noclobber !5
  %160 = sitofp i32 %159 to double
  %161 = fmul contract double %155, %160
  %162 = fpext float %151 to double
  %163 = fadd contract double %161, %162
  %164 = fptrunc double %163 to float
  %165 = getelementptr inbounds double, double addrspace(1)* %2, i64 -1
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !7, !amdgpu.noclobber !5
  %167 = add nsw i32 %153, %44
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %168
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !11, !amdgpu.noclobber !5
  %171 = sitofp i32 %170 to double
  %172 = fmul contract double %166, %171
  %173 = fpext float %164 to double
  %174 = fadd contract double %172, %173
  %175 = fptrunc double %174 to float
  %176 = load double, double addrspace(1)* %2, align 8, !tbaa !7, !amdgpu.noclobber !5
  %177 = add nsw i32 %153, %56
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !11, !amdgpu.noclobber !5
  %181 = sitofp i32 %180 to double
  %182 = fmul contract double %176, %181
  %183 = fpext float %175 to double
  %184 = fadd contract double %182, %183
  %185 = fptrunc double %184 to float
  %186 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %187 = load double, double addrspace(1)* %186, align 8, !tbaa !7, !amdgpu.noclobber !5
  %188 = add nsw i32 %153, %69
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %189
  %191 = load i32, i32 addrspace(1)* %190, align 4, !tbaa !11, !amdgpu.noclobber !5
  %192 = sitofp i32 %191 to double
  %193 = fmul contract double %187, %192
  %194 = fpext float %185 to double
  %195 = fadd contract double %193, %194
  %196 = fptrunc double %195 to float
  %197 = getelementptr inbounds double, double addrspace(1)* %2, i64 2
  %198 = load double, double addrspace(1)* %197, align 8, !tbaa !7, !amdgpu.noclobber !5
  %199 = add nsw i32 %153, %82
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %200
  %202 = load i32, i32 addrspace(1)* %201, align 4, !tbaa !11, !amdgpu.noclobber !5
  %203 = sitofp i32 %202 to double
  %204 = fmul contract double %198, %203
  %205 = fpext float %196 to double
  %206 = fadd contract double %204, %205
  %207 = fptrunc double %206 to float
  %208 = add i32 %26, 1
  %209 = srem i32 %208, %3
  %210 = mul nsw i32 %209, %3
  %211 = getelementptr inbounds double, double addrspace(1)* %2, i64 3
  %212 = load double, double addrspace(1)* %211, align 8, !tbaa !7, !amdgpu.noclobber !5
  %213 = add nsw i32 %210, %32
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !11, !amdgpu.noclobber !5
  %217 = sitofp i32 %216 to double
  %218 = fmul contract double %212, %217
  %219 = fpext float %207 to double
  %220 = fadd contract double %218, %219
  %221 = fptrunc double %220 to float
  %222 = getelementptr inbounds double, double addrspace(1)* %2, i64 4
  %223 = load double, double addrspace(1)* %222, align 8, !tbaa !7, !amdgpu.noclobber !5
  %224 = add nsw i32 %210, %44
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %225
  %227 = load i32, i32 addrspace(1)* %226, align 4, !tbaa !11, !amdgpu.noclobber !5
  %228 = sitofp i32 %227 to double
  %229 = fmul contract double %223, %228
  %230 = fpext float %221 to double
  %231 = fadd contract double %229, %230
  %232 = fptrunc double %231 to float
  %233 = getelementptr inbounds double, double addrspace(1)* %2, i64 5
  %234 = load double, double addrspace(1)* %233, align 8, !tbaa !7, !amdgpu.noclobber !5
  %235 = add nsw i32 %210, %56
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %236
  %238 = load i32, i32 addrspace(1)* %237, align 4, !tbaa !11, !amdgpu.noclobber !5
  %239 = sitofp i32 %238 to double
  %240 = fmul contract double %234, %239
  %241 = fpext float %232 to double
  %242 = fadd contract double %240, %241
  %243 = fptrunc double %242 to float
  %244 = getelementptr inbounds double, double addrspace(1)* %2, i64 6
  %245 = load double, double addrspace(1)* %244, align 8, !tbaa !7, !amdgpu.noclobber !5
  %246 = add nsw i32 %210, %69
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %247
  %249 = load i32, i32 addrspace(1)* %248, align 4, !tbaa !11, !amdgpu.noclobber !5
  %250 = sitofp i32 %249 to double
  %251 = fmul contract double %245, %250
  %252 = fpext float %243 to double
  %253 = fadd contract double %251, %252
  %254 = fptrunc double %253 to float
  %255 = getelementptr inbounds double, double addrspace(1)* %2, i64 7
  %256 = load double, double addrspace(1)* %255, align 8, !tbaa !7, !amdgpu.noclobber !5
  %257 = add nsw i32 %210, %82
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %258
  %260 = load i32, i32 addrspace(1)* %259, align 4, !tbaa !11, !amdgpu.noclobber !5
  %261 = sitofp i32 %260 to double
  %262 = fmul contract double %256, %261
  %263 = fpext float %254 to double
  %264 = fadd contract double %262, %263
  %265 = fptrunc double %264 to float
  %266 = add i32 %26, 2
  %267 = srem i32 %266, %3
  %268 = mul nsw i32 %267, %3
  %269 = getelementptr inbounds double, double addrspace(1)* %2, i64 8
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !7, !amdgpu.noclobber !5
  %271 = add nsw i32 %268, %32
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %272
  %274 = load i32, i32 addrspace(1)* %273, align 4, !tbaa !11, !amdgpu.noclobber !5
  %275 = sitofp i32 %274 to double
  %276 = fmul contract double %270, %275
  %277 = fpext float %265 to double
  %278 = fadd contract double %276, %277
  %279 = fptrunc double %278 to float
  %280 = getelementptr inbounds double, double addrspace(1)* %2, i64 9
  %281 = load double, double addrspace(1)* %280, align 8, !tbaa !7, !amdgpu.noclobber !5
  %282 = add nsw i32 %268, %44
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %283
  %285 = load i32, i32 addrspace(1)* %284, align 4, !tbaa !11, !amdgpu.noclobber !5
  %286 = sitofp i32 %285 to double
  %287 = fmul contract double %281, %286
  %288 = fpext float %279 to double
  %289 = fadd contract double %287, %288
  %290 = fptrunc double %289 to float
  %291 = getelementptr inbounds double, double addrspace(1)* %2, i64 10
  %292 = load double, double addrspace(1)* %291, align 8, !tbaa !7, !amdgpu.noclobber !5
  %293 = add nsw i32 %268, %56
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %294
  %296 = load i32, i32 addrspace(1)* %295, align 4, !tbaa !11, !amdgpu.noclobber !5
  %297 = sitofp i32 %296 to double
  %298 = fmul contract double %292, %297
  %299 = fpext float %290 to double
  %300 = fadd contract double %298, %299
  %301 = fptrunc double %300 to float
  %302 = getelementptr inbounds double, double addrspace(1)* %2, i64 11
  %303 = load double, double addrspace(1)* %302, align 8, !tbaa !7, !amdgpu.noclobber !5
  %304 = add nsw i32 %268, %69
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !11, !amdgpu.noclobber !5
  %308 = sitofp i32 %307 to double
  %309 = fmul contract double %303, %308
  %310 = fpext float %301 to double
  %311 = fadd contract double %309, %310
  %312 = fptrunc double %311 to float
  %313 = getelementptr inbounds double, double addrspace(1)* %2, i64 12
  %314 = load double, double addrspace(1)* %313, align 8, !tbaa !7, !amdgpu.noclobber !5
  %315 = add nsw i32 %268, %82
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %316
  %318 = load i32, i32 addrspace(1)* %317, align 4, !tbaa !11, !amdgpu.noclobber !5
  %319 = sitofp i32 %318 to double
  %320 = fmul contract double %314, %319
  %321 = fpext float %312 to double
  %322 = fadd contract double %320, %321
  %323 = fptrunc double %322 to float
  %324 = mul nsw i32 %13, %3
  %325 = add nsw i32 %324, %21
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %326
  %328 = load i32, i32 addrspace(1)* %327, align 4, !tbaa !11, !amdgpu.noclobber !5
  %329 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %326
  store i32 %328, i32 addrspace(1)* %329, align 4, !tbaa !11
  %330 = fcmp contract olt float %323, 0xBEB0C6F7A0000000
  br i1 %330, label %333, label %331

331:                                              ; preds = %25
  %332 = fcmp contract ogt float %323, 0x3EB0C6F7A0000000
  br i1 %332, label %333, label %335

333:                                              ; preds = %331, %25
  %334 = phi i32 [ -1, %25 ], [ 1, %331 ]
  store i32 %334, i32 addrspace(1)* %329, align 4, !tbaa !11
  br label %335

335:                                              ; preds = %333, %331, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
