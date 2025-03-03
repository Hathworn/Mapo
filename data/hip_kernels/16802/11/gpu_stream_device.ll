; ModuleID = '../data/hip_kernels/16802/11/main.cu'
source_filename = "../data/hip_kernels/16802/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10gpu_streamPdS_S_S_S_S_S_S_S_(double addrspace(1)* nocapture readnone %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readnone %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readnone %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = add i32 %20, 1
  %22 = urem i32 %21, 200
  %23 = add i32 %10, 1
  %24 = and i32 %23, 7
  %25 = add i32 %11, 1
  %26 = urem i32 %25, 101
  %27 = add i32 %20, 199
  %28 = urem i32 %27, 200
  %29 = add i32 %10, 7
  %30 = and i32 %29, 7
  %31 = add i32 %11, 100
  %32 = urem i32 %31, 101
  %33 = shl i32 %11, 3
  %34 = add i32 %33, %10
  %35 = mul i32 %34, 200
  %36 = add i32 %28, %35
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %2, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = add i32 %20, %35
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  store double %39, double addrspace(1)* %42, align 8, !tbaa !7
  %43 = add i32 %10, 808
  %44 = add i32 %43, %33
  %45 = mul i32 %44, 200
  %46 = add i32 %22, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %2, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = add i32 %20, %45
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  store double %49, double addrspace(1)* %52, align 8, !tbaa !7
  %53 = add i32 %33, 1616
  %54 = or i32 %53, %30
  %55 = mul i32 %54, 200
  %56 = add i32 %20, %55
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %2, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = add i32 %53, %10
  %61 = mul i32 %60, 200
  %62 = add i32 %20, %61
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  store double %59, double addrspace(1)* %64, align 8, !tbaa !7
  %65 = add i32 %33, 2424
  %66 = or i32 %65, %24
  %67 = mul i32 %66, 200
  %68 = add i32 %20, %67
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %2, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = add i32 %65, %10
  %73 = mul i32 %72, 200
  %74 = add i32 %20, %73
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  store double %71, double addrspace(1)* %76, align 8, !tbaa !7
  %77 = shl nuw nsw i32 %32, 3
  %78 = add i32 %10, 3232
  %79 = add i32 %78, %77
  %80 = mul i32 %79, 200
  %81 = add i32 %20, %80
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %2, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = add i32 %78, %33
  %86 = mul i32 %85, 200
  %87 = add i32 %20, %86
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  store double %84, double addrspace(1)* %89, align 8, !tbaa !7
  %90 = shl nuw nsw i32 %26, 3
  %91 = add i32 %10, 4040
  %92 = add i32 %91, %90
  %93 = mul i32 %92, 200
  %94 = add i32 %20, %93
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %2, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = add i32 %91, %33
  %99 = mul i32 %98, 200
  %100 = add i32 %20, %99
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %1, i64 %101
  store double %97, double addrspace(1)* %102, align 8, !tbaa !7
  %103 = add i32 %33, 4848
  %104 = or i32 %103, %30
  %105 = mul i32 %104, 200
  %106 = add i32 %28, %105
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %2, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7
  %110 = add i32 %103, %10
  %111 = mul i32 %110, 200
  %112 = add i32 %20, %111
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds double, double addrspace(1)* %1, i64 %113
  store double %109, double addrspace(1)* %114, align 8, !tbaa !7
  %115 = add i32 %33, 5656
  %116 = or i32 %115, %24
  %117 = mul i32 %116, 200
  %118 = add i32 %22, %117
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %2, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %122 = add i32 %115, %10
  %123 = mul i32 %122, 200
  %124 = add i32 %20, %123
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %1, i64 %125
  store double %121, double addrspace(1)* %126, align 8, !tbaa !7
  %127 = add i32 %10, 6464
  %128 = add i32 %127, %77
  %129 = mul i32 %128, 200
  %130 = add i32 %28, %129
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %2, i64 %131
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7
  %134 = add i32 %127, %33
  %135 = mul i32 %134, 200
  %136 = add i32 %20, %135
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %1, i64 %137
  store double %133, double addrspace(1)* %138, align 8, !tbaa !7
  %139 = add i32 %10, 7272
  %140 = add i32 %139, %90
  %141 = mul i32 %140, 200
  %142 = add i32 %22, %141
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %2, i64 %143
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7
  %146 = add i32 %139, %33
  %147 = mul i32 %146, 200
  %148 = add i32 %20, %147
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %1, i64 %149
  store double %145, double addrspace(1)* %150, align 8, !tbaa !7
  %151 = add nuw nsw i32 %77, 8080
  %152 = or i32 %151, %30
  %153 = mul nuw nsw i32 %152, 200
  %154 = add i32 %20, %153
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %2, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !7
  %158 = add i32 %10, 8080
  %159 = add i32 %158, %33
  %160 = mul i32 %159, 200
  %161 = add i32 %20, %160
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds double, double addrspace(1)* %1, i64 %162
  store double %157, double addrspace(1)* %163, align 8, !tbaa !7
  %164 = add nuw nsw i32 %90, 8888
  %165 = or i32 %164, %24
  %166 = mul nuw nsw i32 %165, 200
  %167 = add i32 %20, %166
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds double, double addrspace(1)* %2, i64 %168
  %170 = load double, double addrspace(1)* %169, align 8, !tbaa !7
  %171 = add i32 %10, 8888
  %172 = add i32 %171, %33
  %173 = mul i32 %172, 200
  %174 = add i32 %20, %173
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds double, double addrspace(1)* %1, i64 %175
  store double %170, double addrspace(1)* %176, align 8, !tbaa !7
  %177 = add i32 %33, 9696
  %178 = or i32 %177, %24
  %179 = mul i32 %178, 200
  %180 = add i32 %28, %179
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds double, double addrspace(1)* %2, i64 %181
  %183 = load double, double addrspace(1)* %182, align 8, !tbaa !7
  %184 = add i32 %177, %10
  %185 = mul i32 %184, 200
  %186 = add i32 %20, %185
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds double, double addrspace(1)* %1, i64 %187
  store double %183, double addrspace(1)* %188, align 8, !tbaa !7
  %189 = add i32 %33, 10504
  %190 = or i32 %189, %30
  %191 = mul i32 %190, 200
  %192 = add i32 %22, %191
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds double, double addrspace(1)* %2, i64 %193
  %195 = load double, double addrspace(1)* %194, align 8, !tbaa !7
  %196 = add i32 %189, %10
  %197 = mul i32 %196, 200
  %198 = add i32 %20, %197
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds double, double addrspace(1)* %1, i64 %199
  store double %195, double addrspace(1)* %200, align 8, !tbaa !7
  %201 = add i32 %10, 11312
  %202 = add i32 %201, %90
  %203 = mul i32 %202, 200
  %204 = add i32 %28, %203
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds double, double addrspace(1)* %2, i64 %205
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !7
  %208 = add i32 %201, %33
  %209 = mul i32 %208, 200
  %210 = add i32 %20, %209
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds double, double addrspace(1)* %1, i64 %211
  store double %207, double addrspace(1)* %212, align 8, !tbaa !7
  %213 = add i32 %10, 12120
  %214 = add i32 %213, %77
  %215 = mul i32 %214, 200
  %216 = add i32 %22, %215
  %217 = zext i32 %216 to i64
  %218 = getelementptr inbounds double, double addrspace(1)* %2, i64 %217
  %219 = load double, double addrspace(1)* %218, align 8, !tbaa !7
  %220 = add i32 %213, %33
  %221 = mul i32 %220, 200
  %222 = add i32 %20, %221
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds double, double addrspace(1)* %1, i64 %223
  store double %219, double addrspace(1)* %224, align 8, !tbaa !7
  %225 = add nuw nsw i32 %90, 12928
  %226 = or i32 %225, %30
  %227 = mul nuw nsw i32 %226, 200
  %228 = add i32 %20, %227
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds double, double addrspace(1)* %2, i64 %229
  %231 = load double, double addrspace(1)* %230, align 8, !tbaa !7
  %232 = add i32 %10, 12928
  %233 = add i32 %232, %33
  %234 = mul i32 %233, 200
  %235 = add i32 %20, %234
  %236 = zext i32 %235 to i64
  %237 = getelementptr inbounds double, double addrspace(1)* %1, i64 %236
  store double %231, double addrspace(1)* %237, align 8, !tbaa !7
  %238 = add nuw nsw i32 %77, 13736
  %239 = or i32 %238, %24
  %240 = mul nuw nsw i32 %239, 200
  %241 = add i32 %20, %240
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %2, i64 %242
  %244 = load double, double addrspace(1)* %243, align 8, !tbaa !7
  %245 = add i32 %10, 13736
  %246 = add i32 %245, %33
  %247 = mul i32 %246, 200
  %248 = add i32 %20, %247
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds double, double addrspace(1)* %1, i64 %249
  store double %244, double addrspace(1)* %250, align 8, !tbaa !7
  %251 = add nuw nsw i32 %77, 14544
  %252 = or i32 %251, %30
  %253 = mul nuw nsw i32 %252, 200
  %254 = add nuw nsw i32 %28, %253
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds double, double addrspace(1)* %2, i64 %255
  %257 = load double, double addrspace(1)* %256, align 8, !tbaa !7
  %258 = add i32 %10, 14544
  %259 = add i32 %258, %33
  %260 = mul i32 %259, 200
  %261 = add i32 %20, %260
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds double, double addrspace(1)* %1, i64 %262
  store double %257, double addrspace(1)* %263, align 8, !tbaa !7
  %264 = add nuw nsw i32 %90, 15352
  %265 = or i32 %264, %24
  %266 = mul nuw nsw i32 %265, 200
  %267 = add nuw nsw i32 %22, %266
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds double, double addrspace(1)* %2, i64 %268
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !7
  %271 = add i32 %10, 15352
  %272 = add i32 %271, %33
  %273 = mul i32 %272, 200
  %274 = add i32 %20, %273
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds double, double addrspace(1)* %1, i64 %275
  store double %270, double addrspace(1)* %276, align 8, !tbaa !7
  %277 = add nuw nsw i32 %90, 16160
  %278 = or i32 %277, %30
  %279 = mul nuw nsw i32 %278, 200
  %280 = add nuw nsw i32 %28, %279
  %281 = zext i32 %280 to i64
  %282 = getelementptr inbounds double, double addrspace(1)* %2, i64 %281
  %283 = load double, double addrspace(1)* %282, align 8, !tbaa !7
  %284 = add i32 %10, 16160
  %285 = add i32 %284, %33
  %286 = mul i32 %285, 200
  %287 = add i32 %20, %286
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds double, double addrspace(1)* %1, i64 %288
  store double %283, double addrspace(1)* %289, align 8, !tbaa !7
  %290 = add nuw nsw i32 %77, 16968
  %291 = or i32 %290, %24
  %292 = mul nuw nsw i32 %291, 200
  %293 = add nuw nsw i32 %22, %292
  %294 = zext i32 %293 to i64
  %295 = getelementptr inbounds double, double addrspace(1)* %2, i64 %294
  %296 = load double, double addrspace(1)* %295, align 8, !tbaa !7
  %297 = add i32 %10, 16968
  %298 = add i32 %297, %33
  %299 = mul i32 %298, 200
  %300 = add i32 %20, %299
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds double, double addrspace(1)* %1, i64 %301
  store double %296, double addrspace(1)* %302, align 8, !tbaa !7
  %303 = add nuw nsw i32 %77, 17776
  %304 = or i32 %303, %24
  %305 = mul nuw nsw i32 %304, 200
  %306 = add nuw nsw i32 %28, %305
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds double, double addrspace(1)* %2, i64 %307
  %309 = load double, double addrspace(1)* %308, align 8, !tbaa !7
  %310 = add i32 %10, 17776
  %311 = add i32 %310, %33
  %312 = mul i32 %311, 200
  %313 = add i32 %20, %312
  %314 = zext i32 %313 to i64
  %315 = getelementptr inbounds double, double addrspace(1)* %1, i64 %314
  store double %309, double addrspace(1)* %315, align 8, !tbaa !7
  %316 = add nuw nsw i32 %90, 18584
  %317 = or i32 %316, %30
  %318 = mul nuw nsw i32 %317, 200
  %319 = add nuw nsw i32 %22, %318
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds double, double addrspace(1)* %2, i64 %320
  %322 = load double, double addrspace(1)* %321, align 8, !tbaa !7
  %323 = add i32 %10, 18584
  %324 = add i32 %323, %33
  %325 = mul i32 %324, 200
  %326 = add i32 %20, %325
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds double, double addrspace(1)* %1, i64 %327
  store double %322, double addrspace(1)* %328, align 8, !tbaa !7
  %329 = add nuw nsw i32 %77, 19392
  %330 = or i32 %329, %30
  %331 = mul nuw nsw i32 %330, 200
  %332 = add nuw nsw i32 %22, %331
  %333 = zext i32 %332 to i64
  %334 = getelementptr inbounds double, double addrspace(1)* %2, i64 %333
  %335 = load double, double addrspace(1)* %334, align 8, !tbaa !7
  %336 = add i32 %10, 19392
  %337 = add i32 %336, %33
  %338 = mul i32 %337, 200
  %339 = add i32 %20, %338
  %340 = zext i32 %339 to i64
  %341 = getelementptr inbounds double, double addrspace(1)* %1, i64 %340
  store double %335, double addrspace(1)* %341, align 8, !tbaa !7
  %342 = add nuw nsw i32 %90, 20200
  %343 = or i32 %342, %24
  %344 = mul nuw nsw i32 %343, 200
  %345 = add nuw nsw i32 %28, %344
  %346 = zext i32 %345 to i64
  %347 = getelementptr inbounds double, double addrspace(1)* %2, i64 %346
  %348 = load double, double addrspace(1)* %347, align 8, !tbaa !7
  %349 = add i32 %10, 20200
  %350 = add i32 %349, %33
  %351 = mul i32 %350, 200
  %352 = add i32 %20, %351
  %353 = zext i32 %352 to i64
  %354 = getelementptr inbounds double, double addrspace(1)* %1, i64 %353
  store double %348, double addrspace(1)* %354, align 8, !tbaa !7
  %355 = getelementptr inbounds double, double addrspace(1)* %5, i64 %37
  %356 = load double, double addrspace(1)* %355, align 8, !tbaa !7
  %357 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  store double %356, double addrspace(1)* %357, align 8, !tbaa !7
  %358 = getelementptr inbounds double, double addrspace(1)* %5, i64 %47
  %359 = load double, double addrspace(1)* %358, align 8, !tbaa !7
  %360 = getelementptr inbounds double, double addrspace(1)* %4, i64 %51
  store double %359, double addrspace(1)* %360, align 8, !tbaa !7
  %361 = getelementptr inbounds double, double addrspace(1)* %5, i64 %57
  %362 = load double, double addrspace(1)* %361, align 8, !tbaa !7
  %363 = getelementptr inbounds double, double addrspace(1)* %4, i64 %63
  store double %362, double addrspace(1)* %363, align 8, !tbaa !7
  %364 = getelementptr inbounds double, double addrspace(1)* %5, i64 %69
  %365 = load double, double addrspace(1)* %364, align 8, !tbaa !7
  %366 = getelementptr inbounds double, double addrspace(1)* %4, i64 %75
  store double %365, double addrspace(1)* %366, align 8, !tbaa !7
  %367 = getelementptr inbounds double, double addrspace(1)* %5, i64 %82
  %368 = load double, double addrspace(1)* %367, align 8, !tbaa !7
  %369 = getelementptr inbounds double, double addrspace(1)* %4, i64 %88
  store double %368, double addrspace(1)* %369, align 8, !tbaa !7
  %370 = getelementptr inbounds double, double addrspace(1)* %5, i64 %95
  %371 = load double, double addrspace(1)* %370, align 8, !tbaa !7
  %372 = getelementptr inbounds double, double addrspace(1)* %4, i64 %101
  store double %371, double addrspace(1)* %372, align 8, !tbaa !7
  %373 = getelementptr inbounds double, double addrspace(1)* %5, i64 %107
  %374 = load double, double addrspace(1)* %373, align 8, !tbaa !7
  %375 = getelementptr inbounds double, double addrspace(1)* %4, i64 %113
  store double %374, double addrspace(1)* %375, align 8, !tbaa !7
  %376 = getelementptr inbounds double, double addrspace(1)* %5, i64 %119
  %377 = load double, double addrspace(1)* %376, align 8, !tbaa !7
  %378 = getelementptr inbounds double, double addrspace(1)* %4, i64 %125
  store double %377, double addrspace(1)* %378, align 8, !tbaa !7
  %379 = getelementptr inbounds double, double addrspace(1)* %5, i64 %131
  %380 = load double, double addrspace(1)* %379, align 8, !tbaa !7
  %381 = getelementptr inbounds double, double addrspace(1)* %4, i64 %137
  store double %380, double addrspace(1)* %381, align 8, !tbaa !7
  %382 = getelementptr inbounds double, double addrspace(1)* %5, i64 %143
  %383 = load double, double addrspace(1)* %382, align 8, !tbaa !7
  %384 = getelementptr inbounds double, double addrspace(1)* %4, i64 %149
  store double %383, double addrspace(1)* %384, align 8, !tbaa !7
  %385 = getelementptr inbounds double, double addrspace(1)* %5, i64 %155
  %386 = load double, double addrspace(1)* %385, align 8, !tbaa !7
  %387 = getelementptr inbounds double, double addrspace(1)* %4, i64 %162
  store double %386, double addrspace(1)* %387, align 8, !tbaa !7
  %388 = getelementptr inbounds double, double addrspace(1)* %5, i64 %168
  %389 = load double, double addrspace(1)* %388, align 8, !tbaa !7
  %390 = getelementptr inbounds double, double addrspace(1)* %4, i64 %175
  store double %389, double addrspace(1)* %390, align 8, !tbaa !7
  %391 = getelementptr inbounds double, double addrspace(1)* %5, i64 %181
  %392 = load double, double addrspace(1)* %391, align 8, !tbaa !7
  %393 = getelementptr inbounds double, double addrspace(1)* %4, i64 %187
  store double %392, double addrspace(1)* %393, align 8, !tbaa !7
  %394 = getelementptr inbounds double, double addrspace(1)* %5, i64 %193
  %395 = load double, double addrspace(1)* %394, align 8, !tbaa !7
  %396 = getelementptr inbounds double, double addrspace(1)* %4, i64 %199
  store double %395, double addrspace(1)* %396, align 8, !tbaa !7
  %397 = getelementptr inbounds double, double addrspace(1)* %5, i64 %205
  %398 = load double, double addrspace(1)* %397, align 8, !tbaa !7
  %399 = getelementptr inbounds double, double addrspace(1)* %4, i64 %211
  store double %398, double addrspace(1)* %399, align 8, !tbaa !7
  %400 = getelementptr inbounds double, double addrspace(1)* %5, i64 %217
  %401 = load double, double addrspace(1)* %400, align 8, !tbaa !7
  %402 = getelementptr inbounds double, double addrspace(1)* %4, i64 %223
  store double %401, double addrspace(1)* %402, align 8, !tbaa !7
  %403 = getelementptr inbounds double, double addrspace(1)* %5, i64 %229
  %404 = load double, double addrspace(1)* %403, align 8, !tbaa !7
  %405 = getelementptr inbounds double, double addrspace(1)* %4, i64 %236
  store double %404, double addrspace(1)* %405, align 8, !tbaa !7
  %406 = getelementptr inbounds double, double addrspace(1)* %5, i64 %242
  %407 = load double, double addrspace(1)* %406, align 8, !tbaa !7
  %408 = getelementptr inbounds double, double addrspace(1)* %4, i64 %249
  store double %407, double addrspace(1)* %408, align 8, !tbaa !7
  %409 = getelementptr inbounds double, double addrspace(1)* %5, i64 %255
  %410 = load double, double addrspace(1)* %409, align 8, !tbaa !7
  %411 = getelementptr inbounds double, double addrspace(1)* %4, i64 %262
  store double %410, double addrspace(1)* %411, align 8, !tbaa !7
  %412 = getelementptr inbounds double, double addrspace(1)* %5, i64 %268
  %413 = load double, double addrspace(1)* %412, align 8, !tbaa !7
  %414 = getelementptr inbounds double, double addrspace(1)* %4, i64 %275
  store double %413, double addrspace(1)* %414, align 8, !tbaa !7
  %415 = getelementptr inbounds double, double addrspace(1)* %5, i64 %281
  %416 = load double, double addrspace(1)* %415, align 8, !tbaa !7
  %417 = getelementptr inbounds double, double addrspace(1)* %4, i64 %288
  store double %416, double addrspace(1)* %417, align 8, !tbaa !7
  %418 = getelementptr inbounds double, double addrspace(1)* %5, i64 %294
  %419 = load double, double addrspace(1)* %418, align 8, !tbaa !7
  %420 = getelementptr inbounds double, double addrspace(1)* %4, i64 %301
  store double %419, double addrspace(1)* %420, align 8, !tbaa !7
  %421 = getelementptr inbounds double, double addrspace(1)* %5, i64 %307
  %422 = load double, double addrspace(1)* %421, align 8, !tbaa !7
  %423 = getelementptr inbounds double, double addrspace(1)* %4, i64 %314
  store double %422, double addrspace(1)* %423, align 8, !tbaa !7
  %424 = getelementptr inbounds double, double addrspace(1)* %5, i64 %320
  %425 = load double, double addrspace(1)* %424, align 8, !tbaa !7
  %426 = getelementptr inbounds double, double addrspace(1)* %4, i64 %327
  store double %425, double addrspace(1)* %426, align 8, !tbaa !7
  %427 = getelementptr inbounds double, double addrspace(1)* %5, i64 %333
  %428 = load double, double addrspace(1)* %427, align 8, !tbaa !7
  %429 = getelementptr inbounds double, double addrspace(1)* %4, i64 %340
  store double %428, double addrspace(1)* %429, align 8, !tbaa !7
  %430 = getelementptr inbounds double, double addrspace(1)* %5, i64 %346
  %431 = load double, double addrspace(1)* %430, align 8, !tbaa !7
  %432 = getelementptr inbounds double, double addrspace(1)* %4, i64 %353
  store double %431, double addrspace(1)* %432, align 8, !tbaa !7
  %433 = getelementptr inbounds double, double addrspace(1)* %8, i64 %37
  %434 = load double, double addrspace(1)* %433, align 8, !tbaa !7
  %435 = getelementptr inbounds double, double addrspace(1)* %7, i64 %41
  store double %434, double addrspace(1)* %435, align 8, !tbaa !7
  %436 = getelementptr inbounds double, double addrspace(1)* %8, i64 %47
  %437 = load double, double addrspace(1)* %436, align 8, !tbaa !7
  %438 = getelementptr inbounds double, double addrspace(1)* %7, i64 %51
  store double %437, double addrspace(1)* %438, align 8, !tbaa !7
  %439 = getelementptr inbounds double, double addrspace(1)* %8, i64 %57
  %440 = load double, double addrspace(1)* %439, align 8, !tbaa !7
  %441 = getelementptr inbounds double, double addrspace(1)* %7, i64 %63
  store double %440, double addrspace(1)* %441, align 8, !tbaa !7
  %442 = getelementptr inbounds double, double addrspace(1)* %8, i64 %69
  %443 = load double, double addrspace(1)* %442, align 8, !tbaa !7
  %444 = getelementptr inbounds double, double addrspace(1)* %7, i64 %75
  store double %443, double addrspace(1)* %444, align 8, !tbaa !7
  %445 = getelementptr inbounds double, double addrspace(1)* %8, i64 %82
  %446 = load double, double addrspace(1)* %445, align 8, !tbaa !7
  %447 = getelementptr inbounds double, double addrspace(1)* %7, i64 %88
  store double %446, double addrspace(1)* %447, align 8, !tbaa !7
  %448 = getelementptr inbounds double, double addrspace(1)* %8, i64 %95
  %449 = load double, double addrspace(1)* %448, align 8, !tbaa !7
  %450 = getelementptr inbounds double, double addrspace(1)* %7, i64 %101
  store double %449, double addrspace(1)* %450, align 8, !tbaa !7
  %451 = getelementptr inbounds double, double addrspace(1)* %8, i64 %107
  %452 = load double, double addrspace(1)* %451, align 8, !tbaa !7
  %453 = getelementptr inbounds double, double addrspace(1)* %7, i64 %113
  store double %452, double addrspace(1)* %453, align 8, !tbaa !7
  %454 = getelementptr inbounds double, double addrspace(1)* %8, i64 %119
  %455 = load double, double addrspace(1)* %454, align 8, !tbaa !7
  %456 = getelementptr inbounds double, double addrspace(1)* %7, i64 %125
  store double %455, double addrspace(1)* %456, align 8, !tbaa !7
  %457 = getelementptr inbounds double, double addrspace(1)* %8, i64 %131
  %458 = load double, double addrspace(1)* %457, align 8, !tbaa !7
  %459 = getelementptr inbounds double, double addrspace(1)* %7, i64 %137
  store double %458, double addrspace(1)* %459, align 8, !tbaa !7
  %460 = getelementptr inbounds double, double addrspace(1)* %8, i64 %143
  %461 = load double, double addrspace(1)* %460, align 8, !tbaa !7
  %462 = getelementptr inbounds double, double addrspace(1)* %7, i64 %149
  store double %461, double addrspace(1)* %462, align 8, !tbaa !7
  %463 = getelementptr inbounds double, double addrspace(1)* %8, i64 %155
  %464 = load double, double addrspace(1)* %463, align 8, !tbaa !7
  %465 = getelementptr inbounds double, double addrspace(1)* %7, i64 %162
  store double %464, double addrspace(1)* %465, align 8, !tbaa !7
  %466 = getelementptr inbounds double, double addrspace(1)* %8, i64 %168
  %467 = load double, double addrspace(1)* %466, align 8, !tbaa !7
  %468 = getelementptr inbounds double, double addrspace(1)* %7, i64 %175
  store double %467, double addrspace(1)* %468, align 8, !tbaa !7
  %469 = getelementptr inbounds double, double addrspace(1)* %8, i64 %181
  %470 = load double, double addrspace(1)* %469, align 8, !tbaa !7
  %471 = getelementptr inbounds double, double addrspace(1)* %7, i64 %187
  store double %470, double addrspace(1)* %471, align 8, !tbaa !7
  %472 = getelementptr inbounds double, double addrspace(1)* %8, i64 %193
  %473 = load double, double addrspace(1)* %472, align 8, !tbaa !7
  %474 = getelementptr inbounds double, double addrspace(1)* %7, i64 %199
  store double %473, double addrspace(1)* %474, align 8, !tbaa !7
  %475 = getelementptr inbounds double, double addrspace(1)* %8, i64 %205
  %476 = load double, double addrspace(1)* %475, align 8, !tbaa !7
  %477 = getelementptr inbounds double, double addrspace(1)* %7, i64 %211
  store double %476, double addrspace(1)* %477, align 8, !tbaa !7
  %478 = getelementptr inbounds double, double addrspace(1)* %8, i64 %217
  %479 = load double, double addrspace(1)* %478, align 8, !tbaa !7
  %480 = getelementptr inbounds double, double addrspace(1)* %7, i64 %223
  store double %479, double addrspace(1)* %480, align 8, !tbaa !7
  %481 = getelementptr inbounds double, double addrspace(1)* %8, i64 %229
  %482 = load double, double addrspace(1)* %481, align 8, !tbaa !7
  %483 = getelementptr inbounds double, double addrspace(1)* %7, i64 %236
  store double %482, double addrspace(1)* %483, align 8, !tbaa !7
  %484 = getelementptr inbounds double, double addrspace(1)* %8, i64 %242
  %485 = load double, double addrspace(1)* %484, align 8, !tbaa !7
  %486 = getelementptr inbounds double, double addrspace(1)* %7, i64 %249
  store double %485, double addrspace(1)* %486, align 8, !tbaa !7
  %487 = getelementptr inbounds double, double addrspace(1)* %8, i64 %255
  %488 = load double, double addrspace(1)* %487, align 8, !tbaa !7
  %489 = getelementptr inbounds double, double addrspace(1)* %7, i64 %262
  store double %488, double addrspace(1)* %489, align 8, !tbaa !7
  %490 = getelementptr inbounds double, double addrspace(1)* %8, i64 %268
  %491 = load double, double addrspace(1)* %490, align 8, !tbaa !7
  %492 = getelementptr inbounds double, double addrspace(1)* %7, i64 %275
  store double %491, double addrspace(1)* %492, align 8, !tbaa !7
  %493 = getelementptr inbounds double, double addrspace(1)* %8, i64 %281
  %494 = load double, double addrspace(1)* %493, align 8, !tbaa !7
  %495 = getelementptr inbounds double, double addrspace(1)* %7, i64 %288
  store double %494, double addrspace(1)* %495, align 8, !tbaa !7
  %496 = getelementptr inbounds double, double addrspace(1)* %8, i64 %294
  %497 = load double, double addrspace(1)* %496, align 8, !tbaa !7
  %498 = getelementptr inbounds double, double addrspace(1)* %7, i64 %301
  store double %497, double addrspace(1)* %498, align 8, !tbaa !7
  %499 = getelementptr inbounds double, double addrspace(1)* %8, i64 %307
  %500 = load double, double addrspace(1)* %499, align 8, !tbaa !7
  %501 = getelementptr inbounds double, double addrspace(1)* %7, i64 %314
  store double %500, double addrspace(1)* %501, align 8, !tbaa !7
  %502 = getelementptr inbounds double, double addrspace(1)* %8, i64 %320
  %503 = load double, double addrspace(1)* %502, align 8, !tbaa !7
  %504 = getelementptr inbounds double, double addrspace(1)* %7, i64 %327
  store double %503, double addrspace(1)* %504, align 8, !tbaa !7
  %505 = getelementptr inbounds double, double addrspace(1)* %8, i64 %333
  %506 = load double, double addrspace(1)* %505, align 8, !tbaa !7
  %507 = getelementptr inbounds double, double addrspace(1)* %7, i64 %340
  store double %506, double addrspace(1)* %507, align 8, !tbaa !7
  %508 = getelementptr inbounds double, double addrspace(1)* %8, i64 %346
  %509 = load double, double addrspace(1)* %508, align 8, !tbaa !7
  %510 = getelementptr inbounds double, double addrspace(1)* %7, i64 %353
  store double %509, double addrspace(1)* %510, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
