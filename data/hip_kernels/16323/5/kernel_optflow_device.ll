; ModuleID = '../data/hip_kernels/16323/5/main.cu'
source_filename = "../data/hip_kernels/16323/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14kernel_optflowPfS_S_S_S_P15HIP_vector_typeIfLj4EES2_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture readnone %3, float addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type addrspace(1)* nocapture %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = add i32 %17, %10
  %19 = zext i32 %18 to i64
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = zext i32 %27 to i64
  %29 = sext i32 %8 to i64
  %30 = mul nsw i64 %19, %29
  %31 = add nsw i64 %30, %28
  %32 = add nsw i32 %7, -2
  %33 = sext i32 %32 to i64
  %34 = icmp uge i64 %19, %33
  %35 = icmp ult i32 %18, 3
  %36 = or i1 %35, %34
  br i1 %36, label %537, label %37

37:                                               ; preds = %9
  %38 = add nsw i32 %8, -2
  %39 = sext i32 %38 to i64
  %40 = icmp uge i64 %28, %39
  %41 = icmp ult i32 %27, 3
  %42 = or i1 %41, %40
  br i1 %42, label %537, label %43

43:                                               ; preds = %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add nsw i64 %19, -2
  %45 = mul nsw i64 %44, %29
  %46 = add nsw i64 %45, %28
  %47 = add nsw i64 %46, -2
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fmul contract float %49, %49
  %51 = fadd contract float %50, 0.000000e+00
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fmul contract float %53, %53
  %55 = fadd contract float %54, 0.000000e+00
  %56 = fmul contract float %49, %53
  %57 = fadd contract float %56, 0.000000e+00
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fmul contract float %49, %59
  %61 = fadd contract float %60, 0.000000e+00
  %62 = fmul contract float %53, %59
  %63 = fadd contract float %62, 0.000000e+00
  %64 = add nsw i64 %46, -1
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %51, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = fmul contract float %70, %70
  %72 = fadd contract float %55, %71
  %73 = fmul contract float %66, %70
  %74 = fadd contract float %57, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %64
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fmul contract float %66, %76
  %78 = fadd contract float %61, %77
  %79 = fmul contract float %70, %76
  %80 = fadd contract float %63, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fmul contract float %82, %82
  %84 = fadd contract float %68, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fmul contract float %86, %86
  %88 = fadd contract float %72, %87
  %89 = fmul contract float %82, %86
  %90 = fadd contract float %74, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = fmul contract float %82, %92
  %94 = fadd contract float %78, %93
  %95 = fmul contract float %86, %92
  %96 = fadd contract float %80, %95
  %97 = add nsw i64 %46, 1
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = fmul contract float %99, %99
  %101 = fadd contract float %84, %100
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %88, %104
  %106 = fmul contract float %99, %103
  %107 = fadd contract float %90, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %4, i64 %97
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fmul contract float %99, %109
  %111 = fadd contract float %94, %110
  %112 = fmul contract float %103, %109
  %113 = fadd contract float %96, %112
  %114 = add nsw i64 %46, 2
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !6
  %117 = fmul contract float %116, %116
  %118 = fadd contract float %101, %117
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !6
  %121 = fmul contract float %120, %120
  %122 = fadd contract float %105, %121
  %123 = fmul contract float %116, %120
  %124 = fadd contract float %107, %123
  %125 = getelementptr inbounds float, float addrspace(1)* %4, i64 %114
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fmul contract float %116, %126
  %128 = fadd contract float %111, %127
  %129 = fmul contract float %120, %126
  %130 = fadd contract float %113, %129
  %131 = add nsw i64 %19, -1
  %132 = mul nsw i64 %131, %29
  %133 = add nsw i64 %132, %28
  %134 = add nsw i64 %133, -2
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !6
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %118, %137
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %122, %141
  %143 = fmul contract float %136, %140
  %144 = fadd contract float %124, %143
  %145 = getelementptr inbounds float, float addrspace(1)* %4, i64 %134
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !6
  %147 = fmul contract float %136, %146
  %148 = fadd contract float %128, %147
  %149 = fmul contract float %140, %146
  %150 = fadd contract float %130, %149
  %151 = add nsw i64 %133, -1
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !6
  %154 = fmul contract float %153, %153
  %155 = fadd contract float %138, %154
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !6
  %158 = fmul contract float %157, %157
  %159 = fadd contract float %142, %158
  %160 = fmul contract float %153, %157
  %161 = fadd contract float %144, %160
  %162 = getelementptr inbounds float, float addrspace(1)* %4, i64 %151
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !6
  %164 = fmul contract float %153, %163
  %165 = fadd contract float %148, %164
  %166 = fmul contract float %157, %163
  %167 = fadd contract float %150, %166
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  %170 = fmul contract float %169, %169
  %171 = fadd contract float %155, %170
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !6
  %174 = fmul contract float %173, %173
  %175 = fadd contract float %159, %174
  %176 = fmul contract float %169, %173
  %177 = fadd contract float %161, %176
  %178 = getelementptr inbounds float, float addrspace(1)* %4, i64 %133
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7, !amdgpu.noclobber !6
  %180 = fmul contract float %169, %179
  %181 = fadd contract float %165, %180
  %182 = fmul contract float %173, %179
  %183 = fadd contract float %167, %182
  %184 = add nsw i64 %133, 1
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !6
  %187 = fmul contract float %186, %186
  %188 = fadd contract float %171, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !7, !amdgpu.noclobber !6
  %191 = fmul contract float %190, %190
  %192 = fadd contract float %175, %191
  %193 = fmul contract float %186, %190
  %194 = fadd contract float %177, %193
  %195 = getelementptr inbounds float, float addrspace(1)* %4, i64 %184
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !6
  %197 = fmul contract float %186, %196
  %198 = fadd contract float %181, %197
  %199 = fmul contract float %190, %196
  %200 = fadd contract float %183, %199
  %201 = add nsw i64 %133, 2
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7, !amdgpu.noclobber !6
  %204 = fmul contract float %203, %203
  %205 = fadd contract float %188, %204
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %201
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7, !amdgpu.noclobber !6
  %208 = fmul contract float %207, %207
  %209 = fadd contract float %192, %208
  %210 = fmul contract float %203, %207
  %211 = fadd contract float %194, %210
  %212 = getelementptr inbounds float, float addrspace(1)* %4, i64 %201
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !6
  %214 = fmul contract float %203, %213
  %215 = fadd contract float %198, %214
  %216 = fmul contract float %207, %213
  %217 = fadd contract float %200, %216
  %218 = add nsw i64 %31, -2
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7, !amdgpu.noclobber !6
  %221 = fmul contract float %220, %220
  %222 = fadd contract float %205, %221
  %223 = getelementptr inbounds float, float addrspace(1)* %1, i64 %218
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !7, !amdgpu.noclobber !6
  %225 = fmul contract float %224, %224
  %226 = fadd contract float %209, %225
  %227 = fmul contract float %220, %224
  %228 = fadd contract float %211, %227
  %229 = getelementptr inbounds float, float addrspace(1)* %4, i64 %218
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !7, !amdgpu.noclobber !6
  %231 = fmul contract float %220, %230
  %232 = fadd contract float %215, %231
  %233 = fmul contract float %224, %230
  %234 = fadd contract float %217, %233
  %235 = add nsw i64 %31, -1
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7, !amdgpu.noclobber !6
  %238 = fmul contract float %237, %237
  %239 = fadd contract float %222, %238
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %235
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !7, !amdgpu.noclobber !6
  %242 = fmul contract float %241, %241
  %243 = fadd contract float %226, %242
  %244 = fmul contract float %237, %241
  %245 = fadd contract float %228, %244
  %246 = getelementptr inbounds float, float addrspace(1)* %4, i64 %235
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7, !amdgpu.noclobber !6
  %248 = fmul contract float %237, %247
  %249 = fadd contract float %232, %248
  %250 = fmul contract float %241, %247
  %251 = fadd contract float %234, %250
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !7, !amdgpu.noclobber !6
  %254 = fmul contract float %253, %253
  %255 = fadd contract float %239, %254
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7, !amdgpu.noclobber !6
  %258 = fmul contract float %257, %257
  %259 = fadd contract float %243, %258
  %260 = fmul contract float %253, %257
  %261 = fadd contract float %245, %260
  %262 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !7, !amdgpu.noclobber !6
  %264 = fmul contract float %253, %263
  %265 = fadd contract float %249, %264
  %266 = fmul contract float %257, %263
  %267 = fadd contract float %251, %266
  %268 = add nsw i64 %31, 1
  %269 = getelementptr inbounds float, float addrspace(1)* %0, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !7, !amdgpu.noclobber !6
  %271 = fmul contract float %270, %270
  %272 = fadd contract float %255, %271
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %268
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !7, !amdgpu.noclobber !6
  %275 = fmul contract float %274, %274
  %276 = fadd contract float %259, %275
  %277 = fmul contract float %270, %274
  %278 = fadd contract float %261, %277
  %279 = getelementptr inbounds float, float addrspace(1)* %4, i64 %268
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !7, !amdgpu.noclobber !6
  %281 = fmul contract float %270, %280
  %282 = fadd contract float %265, %281
  %283 = fmul contract float %274, %280
  %284 = fadd contract float %267, %283
  %285 = add nsw i64 %31, 2
  %286 = getelementptr inbounds float, float addrspace(1)* %0, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !7, !amdgpu.noclobber !6
  %288 = fmul contract float %287, %287
  %289 = fadd contract float %272, %288
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %285
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !7, !amdgpu.noclobber !6
  %292 = fmul contract float %291, %291
  %293 = fadd contract float %276, %292
  %294 = fmul contract float %287, %291
  %295 = fadd contract float %278, %294
  %296 = getelementptr inbounds float, float addrspace(1)* %4, i64 %285
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !7, !amdgpu.noclobber !6
  %298 = fmul contract float %287, %297
  %299 = fadd contract float %282, %298
  %300 = fmul contract float %291, %297
  %301 = fadd contract float %284, %300
  %302 = add nuw nsw i64 %19, 1
  %303 = mul nsw i64 %302, %29
  %304 = add nsw i64 %303, %28
  %305 = add i64 %304, -2
  %306 = getelementptr inbounds float, float addrspace(1)* %0, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !7, !amdgpu.noclobber !6
  %308 = fmul contract float %307, %307
  %309 = fadd contract float %289, %308
  %310 = getelementptr inbounds float, float addrspace(1)* %1, i64 %305
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !7, !amdgpu.noclobber !6
  %312 = fmul contract float %311, %311
  %313 = fadd contract float %293, %312
  %314 = fmul contract float %307, %311
  %315 = fadd contract float %295, %314
  %316 = getelementptr inbounds float, float addrspace(1)* %4, i64 %305
  %317 = load float, float addrspace(1)* %316, align 4, !tbaa !7, !amdgpu.noclobber !6
  %318 = fmul contract float %307, %317
  %319 = fadd contract float %299, %318
  %320 = fmul contract float %311, %317
  %321 = fadd contract float %301, %320
  %322 = add i64 %304, -1
  %323 = getelementptr inbounds float, float addrspace(1)* %0, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !7, !amdgpu.noclobber !6
  %325 = fmul contract float %324, %324
  %326 = fadd contract float %309, %325
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %322
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !7, !amdgpu.noclobber !6
  %329 = fmul contract float %328, %328
  %330 = fadd contract float %313, %329
  %331 = fmul contract float %324, %328
  %332 = fadd contract float %315, %331
  %333 = getelementptr inbounds float, float addrspace(1)* %4, i64 %322
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !6
  %335 = fmul contract float %324, %334
  %336 = fadd contract float %319, %335
  %337 = fmul contract float %328, %334
  %338 = fadd contract float %321, %337
  %339 = getelementptr inbounds float, float addrspace(1)* %0, i64 %304
  %340 = load float, float addrspace(1)* %339, align 4, !tbaa !7, !amdgpu.noclobber !6
  %341 = fmul contract float %340, %340
  %342 = fadd contract float %326, %341
  %343 = getelementptr inbounds float, float addrspace(1)* %1, i64 %304
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !7, !amdgpu.noclobber !6
  %345 = fmul contract float %344, %344
  %346 = fadd contract float %330, %345
  %347 = fmul contract float %340, %344
  %348 = fadd contract float %332, %347
  %349 = getelementptr inbounds float, float addrspace(1)* %4, i64 %304
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7, !amdgpu.noclobber !6
  %351 = fmul contract float %340, %350
  %352 = fadd contract float %336, %351
  %353 = fmul contract float %344, %350
  %354 = fadd contract float %338, %353
  %355 = add i64 %304, 1
  %356 = getelementptr inbounds float, float addrspace(1)* %0, i64 %355
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !7, !amdgpu.noclobber !6
  %358 = fmul contract float %357, %357
  %359 = fadd contract float %342, %358
  %360 = getelementptr inbounds float, float addrspace(1)* %1, i64 %355
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !7, !amdgpu.noclobber !6
  %362 = fmul contract float %361, %361
  %363 = fadd contract float %346, %362
  %364 = fmul contract float %357, %361
  %365 = fadd contract float %348, %364
  %366 = getelementptr inbounds float, float addrspace(1)* %4, i64 %355
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !7, !amdgpu.noclobber !6
  %368 = fmul contract float %357, %367
  %369 = fadd contract float %352, %368
  %370 = fmul contract float %361, %367
  %371 = fadd contract float %354, %370
  %372 = add i64 %304, 2
  %373 = getelementptr inbounds float, float addrspace(1)* %0, i64 %372
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !7, !amdgpu.noclobber !6
  %375 = fmul contract float %374, %374
  %376 = fadd contract float %359, %375
  %377 = getelementptr inbounds float, float addrspace(1)* %1, i64 %372
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !7, !amdgpu.noclobber !6
  %379 = fmul contract float %378, %378
  %380 = fadd contract float %363, %379
  %381 = fmul contract float %374, %378
  %382 = fadd contract float %365, %381
  %383 = getelementptr inbounds float, float addrspace(1)* %4, i64 %372
  %384 = load float, float addrspace(1)* %383, align 4, !tbaa !7, !amdgpu.noclobber !6
  %385 = fmul contract float %374, %384
  %386 = fadd contract float %369, %385
  %387 = fmul contract float %378, %384
  %388 = fadd contract float %371, %387
  %389 = add nuw nsw i64 %19, 2
  %390 = mul i64 %389, %29
  %391 = add i64 %390, %28
  %392 = add i64 %391, -2
  %393 = getelementptr inbounds float, float addrspace(1)* %0, i64 %392
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !7, !amdgpu.noclobber !6
  %395 = fmul contract float %394, %394
  %396 = fadd contract float %376, %395
  %397 = getelementptr inbounds float, float addrspace(1)* %1, i64 %392
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !7, !amdgpu.noclobber !6
  %399 = fmul contract float %398, %398
  %400 = fadd contract float %380, %399
  %401 = fmul contract float %394, %398
  %402 = fadd contract float %382, %401
  %403 = getelementptr inbounds float, float addrspace(1)* %4, i64 %392
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7, !amdgpu.noclobber !6
  %405 = fmul contract float %394, %404
  %406 = fadd contract float %386, %405
  %407 = fmul contract float %398, %404
  %408 = fadd contract float %388, %407
  %409 = add i64 %391, -1
  %410 = getelementptr inbounds float, float addrspace(1)* %0, i64 %409
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !7, !amdgpu.noclobber !6
  %412 = fmul contract float %411, %411
  %413 = fadd contract float %396, %412
  %414 = getelementptr inbounds float, float addrspace(1)* %1, i64 %409
  %415 = load float, float addrspace(1)* %414, align 4, !tbaa !7, !amdgpu.noclobber !6
  %416 = fmul contract float %415, %415
  %417 = fadd contract float %400, %416
  %418 = fmul contract float %411, %415
  %419 = fadd contract float %402, %418
  %420 = getelementptr inbounds float, float addrspace(1)* %4, i64 %409
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !7, !amdgpu.noclobber !6
  %422 = fmul contract float %411, %421
  %423 = fadd contract float %406, %422
  %424 = fmul contract float %415, %421
  %425 = fadd contract float %408, %424
  %426 = getelementptr inbounds float, float addrspace(1)* %0, i64 %391
  %427 = load float, float addrspace(1)* %426, align 4, !tbaa !7, !amdgpu.noclobber !6
  %428 = fmul contract float %427, %427
  %429 = fadd contract float %413, %428
  %430 = getelementptr inbounds float, float addrspace(1)* %1, i64 %391
  %431 = load float, float addrspace(1)* %430, align 4, !tbaa !7, !amdgpu.noclobber !6
  %432 = fmul contract float %431, %431
  %433 = fadd contract float %417, %432
  %434 = fmul contract float %427, %431
  %435 = fadd contract float %419, %434
  %436 = getelementptr inbounds float, float addrspace(1)* %4, i64 %391
  %437 = load float, float addrspace(1)* %436, align 4, !tbaa !7, !amdgpu.noclobber !6
  %438 = fmul contract float %427, %437
  %439 = fadd contract float %423, %438
  %440 = fmul contract float %431, %437
  %441 = fadd contract float %425, %440
  %442 = add i64 %391, 1
  %443 = getelementptr inbounds float, float addrspace(1)* %0, i64 %442
  %444 = load float, float addrspace(1)* %443, align 4, !tbaa !7, !amdgpu.noclobber !6
  %445 = fmul contract float %444, %444
  %446 = fadd contract float %429, %445
  %447 = getelementptr inbounds float, float addrspace(1)* %1, i64 %442
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !7, !amdgpu.noclobber !6
  %449 = fmul contract float %448, %448
  %450 = fadd contract float %433, %449
  %451 = fmul contract float %444, %448
  %452 = fadd contract float %435, %451
  %453 = getelementptr inbounds float, float addrspace(1)* %4, i64 %442
  %454 = load float, float addrspace(1)* %453, align 4, !tbaa !7, !amdgpu.noclobber !6
  %455 = fmul contract float %444, %454
  %456 = fadd contract float %439, %455
  %457 = fmul contract float %448, %454
  %458 = fadd contract float %441, %457
  %459 = add i64 %391, 2
  %460 = getelementptr inbounds float, float addrspace(1)* %0, i64 %459
  %461 = load float, float addrspace(1)* %460, align 4, !tbaa !7, !amdgpu.noclobber !6
  %462 = fmul contract float %461, %461
  %463 = fadd contract float %446, %462
  %464 = getelementptr inbounds float, float addrspace(1)* %1, i64 %459
  %465 = load float, float addrspace(1)* %464, align 4, !tbaa !7, !amdgpu.noclobber !6
  %466 = fmul contract float %465, %465
  %467 = fadd contract float %450, %466
  %468 = fmul contract float %461, %465
  %469 = fadd contract float %452, %468
  %470 = getelementptr inbounds float, float addrspace(1)* %4, i64 %459
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !7, !amdgpu.noclobber !6
  %472 = fmul contract float %461, %471
  %473 = fadd contract float %456, %472
  %474 = fmul contract float %465, %471
  %475 = fadd contract float %458, %474
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %476 = fmul contract float %467, %463
  %477 = fmul contract float %469, %469
  %478 = fsub contract float %476, %477
  %479 = tail call float @llvm.fabs.f32(float %478)
  %480 = fpext float %479 to double
  %481 = fcmp contract ugt double %480, 1.500000e-08
  br i1 %481, label %485, label %482

482:                                              ; preds = %43
  %483 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31
  %484 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %483, i64 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %484, align 16, !tbaa !11
  br label %530

485:                                              ; preds = %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %486 = fadd contract float %467, %463
  %487 = fmul contract float %486, %486
  %488 = fmul contract float %478, 4.000000e+00
  %489 = fsub contract float %487, %488
  %490 = fcmp olt float %489, 0x39F0000000000000
  %491 = select i1 %490, float 0x41F0000000000000, float 1.000000e+00
  %492 = fmul float %489, %491
  %493 = tail call float @llvm.sqrt.f32(float %492)
  %494 = bitcast float %493 to i32
  %495 = add nsw i32 %494, -1
  %496 = bitcast i32 %495 to float
  %497 = add nsw i32 %494, 1
  %498 = bitcast i32 %497 to float
  %499 = tail call i1 @llvm.amdgcn.class.f32(float %492, i32 608)
  %500 = select i1 %490, float 0x3EF0000000000000, float 1.000000e+00
  %501 = fneg float %498
  %502 = tail call float @llvm.fma.f32(float %501, float %493, float %492)
  %503 = fcmp ogt float %502, 0.000000e+00
  %504 = fneg float %496
  %505 = tail call float @llvm.fma.f32(float %504, float %493, float %492)
  %506 = fcmp ole float %505, 0.000000e+00
  %507 = select i1 %506, float %496, float %493
  %508 = select i1 %503, float %498, float %507
  %509 = fmul float %500, %508
  %510 = select i1 %499, float %492, float %509
  %511 = fcmp uno float %510, 0.000000e+00
  br i1 %511, label %516, label %512

512:                                              ; preds = %485
  %513 = fsub contract float %486, %510
  %514 = fpext float %513 to double
  %515 = fcmp contract ugt double %514, 2.000000e-04
  br i1 %515, label %519, label %516

516:                                              ; preds = %512, %485
  %517 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31
  %518 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %517, i64 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %518, align 16, !tbaa !11
  br label %530

519:                                              ; preds = %512
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %520 = fmul contract float %469, %475
  %521 = fmul contract float %473, %467
  %522 = fsub contract float %520, %521
  %523 = fdiv contract float %522, %478
  %524 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31
  %525 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %524, i64 0, i32 0, i32 0, i32 0, i64 0
  store float %523, float addrspace(1)* %525, align 16, !tbaa !11
  %526 = fmul contract float %469, %473
  %527 = fmul contract float %475, %463
  %528 = fsub contract float %526, %527
  %529 = fdiv contract float %528, %478
  br label %530

530:                                              ; preds = %516, %519, %482
  %531 = phi float [ 0.000000e+00, %482 ], [ %529, %519 ], [ 0.000000e+00, %516 ]
  %532 = phi %struct.HIP_vector_type addrspace(1)* [ %483, %482 ], [ %524, %519 ], [ %517, %516 ]
  %533 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %31, i32 0, i32 0, i32 0, i64 1
  store float %531, float addrspace(1)* %533, align 4, !tbaa !11
  %534 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %31
  %535 = bitcast %struct.HIP_vector_type addrspace(1)* %534 to i8 addrspace(1)*
  %536 = bitcast %struct.HIP_vector_type addrspace(1)* %532 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %535, i8 addrspace(1)* noundef align 16 dereferenceable(16) %536, i64 16, i1 false)
  br label %537

537:                                              ; preds = %530, %9, %37
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
