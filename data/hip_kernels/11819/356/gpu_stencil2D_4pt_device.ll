; ModuleID = '../data/hip_kernels/11819/356/main.cu'
source_filename = "../data/hip_kernels/11819/356/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_mem = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17gpu_stencil2D_4ptPdS_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = mul nuw nsw i32 %10, 84
  %13 = or i32 %12, 2
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = mul nuw nsw i32 %21, 84
  %23 = add i32 %19, %20
  %24 = mul i32 %23, %3
  %25 = add i32 %24, %11
  %26 = mul i32 %25, 84
  %27 = add i32 %3, 1
  %28 = add i32 %27, %22
  %29 = add i32 %28, %26
  %30 = mul nuw nsw i32 %20, 84
  %31 = or i32 %22, 1
  %32 = add nuw nsw i32 %31, %13
  %33 = or i32 %22, 2
  %34 = add nuw nsw i32 %33, %13
  %35 = or i32 %22, 3
  %36 = add nuw nsw i32 %35, %13
  %37 = add nuw nsw i32 %22, 4
  %38 = add nuw nsw i32 %37, %13
  %39 = add nuw nsw i32 %22, 5
  %40 = add nuw nsw i32 %39, %13
  %41 = add nuw nsw i32 %22, 6
  %42 = add nuw nsw i32 %41, %13
  %43 = add nuw nsw i32 %22, 7
  %44 = add nuw nsw i32 %43, %13
  %45 = add nuw nsw i32 %22, 8
  %46 = add nuw nsw i32 %45, %13
  %47 = add nuw nsw i32 %22, 9
  %48 = add nuw nsw i32 %47, %13
  %49 = add nuw nsw i32 %22, 10
  %50 = add nuw nsw i32 %49, %13
  %51 = add nuw nsw i32 %22, 11
  %52 = add nuw nsw i32 %51, %13
  %53 = add nuw nsw i32 %22, 12
  %54 = add nuw nsw i32 %53, %13
  %55 = add nuw nsw i32 %22, 13
  %56 = add nuw nsw i32 %55, %13
  %57 = add nuw nsw i32 %22, 14
  %58 = add nuw nsw i32 %57, %13
  %59 = add nuw nsw i32 %22, 15
  %60 = add nuw nsw i32 %59, %13
  %61 = add nuw nsw i32 %22, 16
  %62 = add nuw nsw i32 %61, %13
  %63 = add nuw nsw i32 %22, 17
  %64 = add nuw nsw i32 %63, %13
  %65 = add nuw nsw i32 %22, 18
  %66 = add nuw nsw i32 %65, %13
  %67 = add nuw nsw i32 %22, 19
  %68 = add nuw nsw i32 %67, %13
  %69 = add nuw nsw i32 %22, 20
  %70 = add nuw nsw i32 %69, %13
  %71 = add nuw nsw i32 %22, 21
  %72 = add nuw nsw i32 %71, %13
  %73 = add nuw nsw i32 %22, 22
  %74 = add nuw nsw i32 %73, %13
  %75 = add nuw nsw i32 %22, 23
  %76 = add nuw nsw i32 %75, %13
  %77 = add nuw nsw i32 %22, 24
  %78 = add nuw nsw i32 %77, %13
  %79 = add nuw nsw i32 %22, 25
  %80 = add nuw nsw i32 %79, %13
  %81 = add nuw nsw i32 %22, 26
  %82 = add nuw nsw i32 %81, %13
  %83 = add nuw nsw i32 %22, 27
  %84 = add nuw nsw i32 %83, %13
  %85 = add nuw nsw i32 %22, 28
  %86 = add nuw nsw i32 %85, %13
  %87 = add nuw nsw i32 %22, 29
  %88 = add nuw nsw i32 %87, %13
  %89 = add nuw nsw i32 %22, 30
  %90 = add nuw nsw i32 %89, %13
  %91 = add nuw nsw i32 %22, 31
  %92 = add nuw nsw i32 %91, %13
  %93 = add nuw nsw i32 %22, 32
  %94 = add nuw nsw i32 %93, %13
  %95 = add nuw nsw i32 %22, 33
  %96 = add nuw nsw i32 %95, %13
  %97 = add nuw nsw i32 %22, 34
  %98 = add nuw nsw i32 %97, %13
  %99 = add nuw nsw i32 %22, 35
  %100 = add nuw nsw i32 %99, %13
  %101 = add nuw nsw i32 %22, 36
  %102 = add nuw nsw i32 %101, %13
  %103 = add nuw nsw i32 %22, 37
  %104 = add nuw nsw i32 %103, %13
  %105 = add nuw nsw i32 %22, 38
  %106 = add nuw nsw i32 %105, %13
  %107 = add nuw nsw i32 %22, 39
  %108 = add nuw nsw i32 %107, %13
  %109 = add nuw nsw i32 %22, 40
  %110 = add nuw nsw i32 %109, %13
  %111 = add nuw nsw i32 %22, 41
  %112 = add nuw nsw i32 %111, %13
  %113 = add nuw nsw i32 %22, 42
  %114 = add nuw nsw i32 %113, %13
  %115 = add nuw nsw i32 %22, 43
  %116 = add nuw nsw i32 %115, %13
  %117 = add nuw nsw i32 %22, 44
  %118 = add nuw nsw i32 %117, %13
  %119 = add nuw nsw i32 %22, 45
  %120 = add nuw nsw i32 %119, %13
  %121 = add nuw nsw i32 %22, 46
  %122 = add nuw nsw i32 %121, %13
  %123 = add nuw nsw i32 %22, 47
  %124 = add nuw nsw i32 %123, %13
  %125 = add nuw nsw i32 %22, 48
  %126 = add nuw nsw i32 %125, %13
  %127 = add nuw nsw i32 %22, 49
  %128 = add nuw nsw i32 %127, %13
  %129 = add nuw nsw i32 %22, 50
  %130 = add nuw nsw i32 %129, %13
  %131 = add nuw nsw i32 %22, 51
  %132 = add nuw nsw i32 %131, %13
  %133 = add nuw nsw i32 %22, 52
  %134 = add nuw nsw i32 %133, %13
  %135 = add nuw nsw i32 %22, 53
  %136 = add nuw nsw i32 %135, %13
  %137 = add nuw nsw i32 %22, 54
  %138 = add nuw nsw i32 %137, %13
  %139 = add nuw nsw i32 %22, 55
  %140 = add nuw nsw i32 %139, %13
  %141 = add nuw nsw i32 %22, 56
  %142 = add nuw nsw i32 %141, %13
  %143 = add nuw nsw i32 %22, 57
  %144 = add nuw nsw i32 %143, %13
  %145 = add nuw nsw i32 %22, 58
  %146 = add nuw nsw i32 %145, %13
  %147 = add nuw nsw i32 %22, 59
  %148 = add nuw nsw i32 %147, %13
  %149 = add nuw nsw i32 %22, 60
  %150 = add nuw nsw i32 %149, %13
  %151 = add nuw nsw i32 %22, 61
  %152 = add nuw nsw i32 %151, %13
  %153 = add nuw nsw i32 %22, 62
  %154 = add nuw nsw i32 %153, %13
  %155 = add nuw nsw i32 %22, 63
  %156 = add nuw nsw i32 %155, %13
  %157 = add nuw nsw i32 %22, 64
  %158 = add nuw nsw i32 %157, %13
  %159 = add nuw nsw i32 %22, 65
  %160 = add nuw nsw i32 %159, %13
  %161 = add nuw nsw i32 %22, 66
  %162 = add nuw nsw i32 %161, %13
  %163 = add nuw nsw i32 %22, 67
  %164 = add nuw nsw i32 %163, %13
  %165 = add nuw nsw i32 %22, 68
  %166 = add nuw nsw i32 %165, %13
  %167 = add nuw nsw i32 %22, 69
  %168 = add nuw nsw i32 %167, %13
  %169 = add nuw nsw i32 %22, 70
  %170 = add nuw nsw i32 %169, %13
  %171 = add nuw nsw i32 %22, 71
  %172 = add nuw nsw i32 %171, %13
  %173 = add nuw nsw i32 %22, 72
  %174 = add nuw nsw i32 %173, %13
  %175 = add nuw nsw i32 %22, 73
  %176 = add nuw nsw i32 %175, %13
  %177 = add nuw nsw i32 %22, 74
  %178 = add nuw nsw i32 %177, %13
  %179 = add nuw nsw i32 %22, 75
  %180 = add nuw nsw i32 %179, %13
  %181 = add nuw nsw i32 %22, 76
  %182 = add nuw nsw i32 %181, %13
  %183 = add nuw nsw i32 %22, 77
  %184 = add nuw nsw i32 %183, %13
  %185 = add nuw nsw i32 %22, 78
  %186 = add nuw nsw i32 %185, %13
  %187 = add nuw nsw i32 %22, 79
  %188 = add nuw nsw i32 %187, %13
  %189 = add nuw nsw i32 %22, 80
  %190 = add nuw nsw i32 %189, %13
  %191 = add nuw nsw i32 %22, 81
  %192 = add nuw nsw i32 %191, %13
  %193 = add nuw nsw i32 %22, 82
  %194 = add nuw nsw i32 %193, %13
  %195 = add nuw nsw i32 %22, 83
  %196 = add nuw nsw i32 %195, %13
  %197 = add nuw nsw i32 %22, 84
  %198 = add nuw nsw i32 %197, %13
  br label %199

199:                                              ; preds = %4, %199
  %200 = phi i32 [ 0, %4 ], [ %708, %199 ]
  %201 = mul nsw i32 %200, %3
  %202 = add i32 %29, %201
  %203 = add nuw nsw i32 %200, %30
  %204 = mul i32 %203, %13
  %205 = add i32 %32, %204
  %206 = sext i32 %202 to i64
  %207 = getelementptr inbounds double, double addrspace(1)* %1, i64 %206
  %208 = load double, double addrspace(1)* %207, align 8, !tbaa !7, !amdgpu.noclobber !5
  %209 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %205
  store double %208, double addrspace(3)* %209, align 8, !tbaa !7
  %210 = add i32 %202, 1
  %211 = add i32 %34, %204
  %212 = sext i32 %210 to i64
  %213 = getelementptr inbounds double, double addrspace(1)* %1, i64 %212
  %214 = load double, double addrspace(1)* %213, align 8, !tbaa !7, !amdgpu.noclobber !5
  %215 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %211
  store double %214, double addrspace(3)* %215, align 8, !tbaa !7
  %216 = add i32 %202, 2
  %217 = add i32 %36, %204
  %218 = sext i32 %216 to i64
  %219 = getelementptr inbounds double, double addrspace(1)* %1, i64 %218
  %220 = load double, double addrspace(1)* %219, align 8, !tbaa !7, !amdgpu.noclobber !5
  %221 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %217
  store double %220, double addrspace(3)* %221, align 8, !tbaa !7
  %222 = add i32 %202, 3
  %223 = add i32 %38, %204
  %224 = sext i32 %222 to i64
  %225 = getelementptr inbounds double, double addrspace(1)* %1, i64 %224
  %226 = load double, double addrspace(1)* %225, align 8, !tbaa !7, !amdgpu.noclobber !5
  %227 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %223
  store double %226, double addrspace(3)* %227, align 8, !tbaa !7
  %228 = add i32 %202, 4
  %229 = add i32 %40, %204
  %230 = sext i32 %228 to i64
  %231 = getelementptr inbounds double, double addrspace(1)* %1, i64 %230
  %232 = load double, double addrspace(1)* %231, align 8, !tbaa !7, !amdgpu.noclobber !5
  %233 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %229
  store double %232, double addrspace(3)* %233, align 8, !tbaa !7
  %234 = add i32 %202, 5
  %235 = add i32 %42, %204
  %236 = sext i32 %234 to i64
  %237 = getelementptr inbounds double, double addrspace(1)* %1, i64 %236
  %238 = load double, double addrspace(1)* %237, align 8, !tbaa !7, !amdgpu.noclobber !5
  %239 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %235
  store double %238, double addrspace(3)* %239, align 8, !tbaa !7
  %240 = add i32 %202, 6
  %241 = add i32 %44, %204
  %242 = sext i32 %240 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %1, i64 %242
  %244 = load double, double addrspace(1)* %243, align 8, !tbaa !7, !amdgpu.noclobber !5
  %245 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %241
  store double %244, double addrspace(3)* %245, align 8, !tbaa !7
  %246 = add i32 %202, 7
  %247 = add i32 %46, %204
  %248 = sext i32 %246 to i64
  %249 = getelementptr inbounds double, double addrspace(1)* %1, i64 %248
  %250 = load double, double addrspace(1)* %249, align 8, !tbaa !7, !amdgpu.noclobber !5
  %251 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %247
  store double %250, double addrspace(3)* %251, align 8, !tbaa !7
  %252 = add i32 %202, 8
  %253 = add i32 %48, %204
  %254 = sext i32 %252 to i64
  %255 = getelementptr inbounds double, double addrspace(1)* %1, i64 %254
  %256 = load double, double addrspace(1)* %255, align 8, !tbaa !7, !amdgpu.noclobber !5
  %257 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %253
  store double %256, double addrspace(3)* %257, align 8, !tbaa !7
  %258 = add i32 %202, 9
  %259 = add i32 %50, %204
  %260 = sext i32 %258 to i64
  %261 = getelementptr inbounds double, double addrspace(1)* %1, i64 %260
  %262 = load double, double addrspace(1)* %261, align 8, !tbaa !7, !amdgpu.noclobber !5
  %263 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %259
  store double %262, double addrspace(3)* %263, align 8, !tbaa !7
  %264 = add i32 %202, 10
  %265 = add i32 %52, %204
  %266 = sext i32 %264 to i64
  %267 = getelementptr inbounds double, double addrspace(1)* %1, i64 %266
  %268 = load double, double addrspace(1)* %267, align 8, !tbaa !7, !amdgpu.noclobber !5
  %269 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %265
  store double %268, double addrspace(3)* %269, align 8, !tbaa !7
  %270 = add i32 %202, 11
  %271 = add i32 %54, %204
  %272 = sext i32 %270 to i64
  %273 = getelementptr inbounds double, double addrspace(1)* %1, i64 %272
  %274 = load double, double addrspace(1)* %273, align 8, !tbaa !7, !amdgpu.noclobber !5
  %275 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %271
  store double %274, double addrspace(3)* %275, align 8, !tbaa !7
  %276 = add i32 %202, 12
  %277 = add i32 %56, %204
  %278 = sext i32 %276 to i64
  %279 = getelementptr inbounds double, double addrspace(1)* %1, i64 %278
  %280 = load double, double addrspace(1)* %279, align 8, !tbaa !7, !amdgpu.noclobber !5
  %281 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %277
  store double %280, double addrspace(3)* %281, align 8, !tbaa !7
  %282 = add i32 %202, 13
  %283 = add i32 %58, %204
  %284 = sext i32 %282 to i64
  %285 = getelementptr inbounds double, double addrspace(1)* %1, i64 %284
  %286 = load double, double addrspace(1)* %285, align 8, !tbaa !7, !amdgpu.noclobber !5
  %287 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %283
  store double %286, double addrspace(3)* %287, align 8, !tbaa !7
  %288 = add i32 %202, 14
  %289 = add i32 %60, %204
  %290 = sext i32 %288 to i64
  %291 = getelementptr inbounds double, double addrspace(1)* %1, i64 %290
  %292 = load double, double addrspace(1)* %291, align 8, !tbaa !7, !amdgpu.noclobber !5
  %293 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %289
  store double %292, double addrspace(3)* %293, align 8, !tbaa !7
  %294 = add i32 %202, 15
  %295 = add i32 %62, %204
  %296 = sext i32 %294 to i64
  %297 = getelementptr inbounds double, double addrspace(1)* %1, i64 %296
  %298 = load double, double addrspace(1)* %297, align 8, !tbaa !7, !amdgpu.noclobber !5
  %299 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %295
  store double %298, double addrspace(3)* %299, align 8, !tbaa !7
  %300 = add i32 %202, 16
  %301 = add i32 %64, %204
  %302 = sext i32 %300 to i64
  %303 = getelementptr inbounds double, double addrspace(1)* %1, i64 %302
  %304 = load double, double addrspace(1)* %303, align 8, !tbaa !7, !amdgpu.noclobber !5
  %305 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %301
  store double %304, double addrspace(3)* %305, align 8, !tbaa !7
  %306 = add i32 %202, 17
  %307 = add i32 %66, %204
  %308 = sext i32 %306 to i64
  %309 = getelementptr inbounds double, double addrspace(1)* %1, i64 %308
  %310 = load double, double addrspace(1)* %309, align 8, !tbaa !7, !amdgpu.noclobber !5
  %311 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %307
  store double %310, double addrspace(3)* %311, align 8, !tbaa !7
  %312 = add i32 %202, 18
  %313 = add i32 %68, %204
  %314 = sext i32 %312 to i64
  %315 = getelementptr inbounds double, double addrspace(1)* %1, i64 %314
  %316 = load double, double addrspace(1)* %315, align 8, !tbaa !7, !amdgpu.noclobber !5
  %317 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %313
  store double %316, double addrspace(3)* %317, align 8, !tbaa !7
  %318 = add i32 %202, 19
  %319 = add i32 %70, %204
  %320 = sext i32 %318 to i64
  %321 = getelementptr inbounds double, double addrspace(1)* %1, i64 %320
  %322 = load double, double addrspace(1)* %321, align 8, !tbaa !7, !amdgpu.noclobber !5
  %323 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %319
  store double %322, double addrspace(3)* %323, align 8, !tbaa !7
  %324 = add i32 %202, 20
  %325 = add i32 %72, %204
  %326 = sext i32 %324 to i64
  %327 = getelementptr inbounds double, double addrspace(1)* %1, i64 %326
  %328 = load double, double addrspace(1)* %327, align 8, !tbaa !7, !amdgpu.noclobber !5
  %329 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %325
  store double %328, double addrspace(3)* %329, align 8, !tbaa !7
  %330 = add i32 %202, 21
  %331 = add i32 %74, %204
  %332 = sext i32 %330 to i64
  %333 = getelementptr inbounds double, double addrspace(1)* %1, i64 %332
  %334 = load double, double addrspace(1)* %333, align 8, !tbaa !7, !amdgpu.noclobber !5
  %335 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %331
  store double %334, double addrspace(3)* %335, align 8, !tbaa !7
  %336 = add i32 %202, 22
  %337 = add i32 %76, %204
  %338 = sext i32 %336 to i64
  %339 = getelementptr inbounds double, double addrspace(1)* %1, i64 %338
  %340 = load double, double addrspace(1)* %339, align 8, !tbaa !7, !amdgpu.noclobber !5
  %341 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %337
  store double %340, double addrspace(3)* %341, align 8, !tbaa !7
  %342 = add i32 %202, 23
  %343 = add i32 %78, %204
  %344 = sext i32 %342 to i64
  %345 = getelementptr inbounds double, double addrspace(1)* %1, i64 %344
  %346 = load double, double addrspace(1)* %345, align 8, !tbaa !7, !amdgpu.noclobber !5
  %347 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %343
  store double %346, double addrspace(3)* %347, align 8, !tbaa !7
  %348 = add i32 %202, 24
  %349 = add i32 %80, %204
  %350 = sext i32 %348 to i64
  %351 = getelementptr inbounds double, double addrspace(1)* %1, i64 %350
  %352 = load double, double addrspace(1)* %351, align 8, !tbaa !7, !amdgpu.noclobber !5
  %353 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %349
  store double %352, double addrspace(3)* %353, align 8, !tbaa !7
  %354 = add i32 %202, 25
  %355 = add i32 %82, %204
  %356 = sext i32 %354 to i64
  %357 = getelementptr inbounds double, double addrspace(1)* %1, i64 %356
  %358 = load double, double addrspace(1)* %357, align 8, !tbaa !7, !amdgpu.noclobber !5
  %359 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %355
  store double %358, double addrspace(3)* %359, align 8, !tbaa !7
  %360 = add i32 %202, 26
  %361 = add i32 %84, %204
  %362 = sext i32 %360 to i64
  %363 = getelementptr inbounds double, double addrspace(1)* %1, i64 %362
  %364 = load double, double addrspace(1)* %363, align 8, !tbaa !7, !amdgpu.noclobber !5
  %365 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %361
  store double %364, double addrspace(3)* %365, align 8, !tbaa !7
  %366 = add i32 %202, 27
  %367 = add i32 %86, %204
  %368 = sext i32 %366 to i64
  %369 = getelementptr inbounds double, double addrspace(1)* %1, i64 %368
  %370 = load double, double addrspace(1)* %369, align 8, !tbaa !7, !amdgpu.noclobber !5
  %371 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %367
  store double %370, double addrspace(3)* %371, align 8, !tbaa !7
  %372 = add i32 %202, 28
  %373 = add i32 %88, %204
  %374 = sext i32 %372 to i64
  %375 = getelementptr inbounds double, double addrspace(1)* %1, i64 %374
  %376 = load double, double addrspace(1)* %375, align 8, !tbaa !7, !amdgpu.noclobber !5
  %377 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %373
  store double %376, double addrspace(3)* %377, align 8, !tbaa !7
  %378 = add i32 %202, 29
  %379 = add i32 %90, %204
  %380 = sext i32 %378 to i64
  %381 = getelementptr inbounds double, double addrspace(1)* %1, i64 %380
  %382 = load double, double addrspace(1)* %381, align 8, !tbaa !7, !amdgpu.noclobber !5
  %383 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %379
  store double %382, double addrspace(3)* %383, align 8, !tbaa !7
  %384 = add i32 %202, 30
  %385 = add i32 %92, %204
  %386 = sext i32 %384 to i64
  %387 = getelementptr inbounds double, double addrspace(1)* %1, i64 %386
  %388 = load double, double addrspace(1)* %387, align 8, !tbaa !7, !amdgpu.noclobber !5
  %389 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %385
  store double %388, double addrspace(3)* %389, align 8, !tbaa !7
  %390 = add i32 %202, 31
  %391 = add i32 %94, %204
  %392 = sext i32 %390 to i64
  %393 = getelementptr inbounds double, double addrspace(1)* %1, i64 %392
  %394 = load double, double addrspace(1)* %393, align 8, !tbaa !7, !amdgpu.noclobber !5
  %395 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %391
  store double %394, double addrspace(3)* %395, align 8, !tbaa !7
  %396 = add i32 %202, 32
  %397 = add i32 %96, %204
  %398 = sext i32 %396 to i64
  %399 = getelementptr inbounds double, double addrspace(1)* %1, i64 %398
  %400 = load double, double addrspace(1)* %399, align 8, !tbaa !7, !amdgpu.noclobber !5
  %401 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %397
  store double %400, double addrspace(3)* %401, align 8, !tbaa !7
  %402 = add i32 %202, 33
  %403 = add i32 %98, %204
  %404 = sext i32 %402 to i64
  %405 = getelementptr inbounds double, double addrspace(1)* %1, i64 %404
  %406 = load double, double addrspace(1)* %405, align 8, !tbaa !7, !amdgpu.noclobber !5
  %407 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %403
  store double %406, double addrspace(3)* %407, align 8, !tbaa !7
  %408 = add i32 %202, 34
  %409 = add i32 %100, %204
  %410 = sext i32 %408 to i64
  %411 = getelementptr inbounds double, double addrspace(1)* %1, i64 %410
  %412 = load double, double addrspace(1)* %411, align 8, !tbaa !7, !amdgpu.noclobber !5
  %413 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %409
  store double %412, double addrspace(3)* %413, align 8, !tbaa !7
  %414 = add i32 %202, 35
  %415 = add i32 %102, %204
  %416 = sext i32 %414 to i64
  %417 = getelementptr inbounds double, double addrspace(1)* %1, i64 %416
  %418 = load double, double addrspace(1)* %417, align 8, !tbaa !7, !amdgpu.noclobber !5
  %419 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %415
  store double %418, double addrspace(3)* %419, align 8, !tbaa !7
  %420 = add i32 %202, 36
  %421 = add i32 %104, %204
  %422 = sext i32 %420 to i64
  %423 = getelementptr inbounds double, double addrspace(1)* %1, i64 %422
  %424 = load double, double addrspace(1)* %423, align 8, !tbaa !7, !amdgpu.noclobber !5
  %425 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %421
  store double %424, double addrspace(3)* %425, align 8, !tbaa !7
  %426 = add i32 %202, 37
  %427 = add i32 %106, %204
  %428 = sext i32 %426 to i64
  %429 = getelementptr inbounds double, double addrspace(1)* %1, i64 %428
  %430 = load double, double addrspace(1)* %429, align 8, !tbaa !7, !amdgpu.noclobber !5
  %431 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %427
  store double %430, double addrspace(3)* %431, align 8, !tbaa !7
  %432 = add i32 %202, 38
  %433 = add i32 %108, %204
  %434 = sext i32 %432 to i64
  %435 = getelementptr inbounds double, double addrspace(1)* %1, i64 %434
  %436 = load double, double addrspace(1)* %435, align 8, !tbaa !7, !amdgpu.noclobber !5
  %437 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %433
  store double %436, double addrspace(3)* %437, align 8, !tbaa !7
  %438 = add i32 %202, 39
  %439 = add i32 %110, %204
  %440 = sext i32 %438 to i64
  %441 = getelementptr inbounds double, double addrspace(1)* %1, i64 %440
  %442 = load double, double addrspace(1)* %441, align 8, !tbaa !7, !amdgpu.noclobber !5
  %443 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %439
  store double %442, double addrspace(3)* %443, align 8, !tbaa !7
  %444 = add i32 %202, 40
  %445 = add i32 %112, %204
  %446 = sext i32 %444 to i64
  %447 = getelementptr inbounds double, double addrspace(1)* %1, i64 %446
  %448 = load double, double addrspace(1)* %447, align 8, !tbaa !7, !amdgpu.noclobber !5
  %449 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %445
  store double %448, double addrspace(3)* %449, align 8, !tbaa !7
  %450 = add i32 %202, 41
  %451 = add i32 %114, %204
  %452 = sext i32 %450 to i64
  %453 = getelementptr inbounds double, double addrspace(1)* %1, i64 %452
  %454 = load double, double addrspace(1)* %453, align 8, !tbaa !7, !amdgpu.noclobber !5
  %455 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %451
  store double %454, double addrspace(3)* %455, align 8, !tbaa !7
  %456 = add i32 %202, 42
  %457 = add i32 %116, %204
  %458 = sext i32 %456 to i64
  %459 = getelementptr inbounds double, double addrspace(1)* %1, i64 %458
  %460 = load double, double addrspace(1)* %459, align 8, !tbaa !7, !amdgpu.noclobber !5
  %461 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %457
  store double %460, double addrspace(3)* %461, align 8, !tbaa !7
  %462 = add i32 %202, 43
  %463 = add i32 %118, %204
  %464 = sext i32 %462 to i64
  %465 = getelementptr inbounds double, double addrspace(1)* %1, i64 %464
  %466 = load double, double addrspace(1)* %465, align 8, !tbaa !7, !amdgpu.noclobber !5
  %467 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %463
  store double %466, double addrspace(3)* %467, align 8, !tbaa !7
  %468 = add i32 %202, 44
  %469 = add i32 %120, %204
  %470 = sext i32 %468 to i64
  %471 = getelementptr inbounds double, double addrspace(1)* %1, i64 %470
  %472 = load double, double addrspace(1)* %471, align 8, !tbaa !7, !amdgpu.noclobber !5
  %473 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %469
  store double %472, double addrspace(3)* %473, align 8, !tbaa !7
  %474 = add i32 %202, 45
  %475 = add i32 %122, %204
  %476 = sext i32 %474 to i64
  %477 = getelementptr inbounds double, double addrspace(1)* %1, i64 %476
  %478 = load double, double addrspace(1)* %477, align 8, !tbaa !7, !amdgpu.noclobber !5
  %479 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %475
  store double %478, double addrspace(3)* %479, align 8, !tbaa !7
  %480 = add i32 %202, 46
  %481 = add i32 %124, %204
  %482 = sext i32 %480 to i64
  %483 = getelementptr inbounds double, double addrspace(1)* %1, i64 %482
  %484 = load double, double addrspace(1)* %483, align 8, !tbaa !7, !amdgpu.noclobber !5
  %485 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %481
  store double %484, double addrspace(3)* %485, align 8, !tbaa !7
  %486 = add i32 %202, 47
  %487 = add i32 %126, %204
  %488 = sext i32 %486 to i64
  %489 = getelementptr inbounds double, double addrspace(1)* %1, i64 %488
  %490 = load double, double addrspace(1)* %489, align 8, !tbaa !7, !amdgpu.noclobber !5
  %491 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %487
  store double %490, double addrspace(3)* %491, align 8, !tbaa !7
  %492 = add i32 %202, 48
  %493 = add i32 %128, %204
  %494 = sext i32 %492 to i64
  %495 = getelementptr inbounds double, double addrspace(1)* %1, i64 %494
  %496 = load double, double addrspace(1)* %495, align 8, !tbaa !7, !amdgpu.noclobber !5
  %497 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %493
  store double %496, double addrspace(3)* %497, align 8, !tbaa !7
  %498 = add i32 %202, 49
  %499 = add i32 %130, %204
  %500 = sext i32 %498 to i64
  %501 = getelementptr inbounds double, double addrspace(1)* %1, i64 %500
  %502 = load double, double addrspace(1)* %501, align 8, !tbaa !7, !amdgpu.noclobber !5
  %503 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %499
  store double %502, double addrspace(3)* %503, align 8, !tbaa !7
  %504 = add i32 %202, 50
  %505 = add i32 %132, %204
  %506 = sext i32 %504 to i64
  %507 = getelementptr inbounds double, double addrspace(1)* %1, i64 %506
  %508 = load double, double addrspace(1)* %507, align 8, !tbaa !7, !amdgpu.noclobber !5
  %509 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %505
  store double %508, double addrspace(3)* %509, align 8, !tbaa !7
  %510 = add i32 %202, 51
  %511 = add i32 %134, %204
  %512 = sext i32 %510 to i64
  %513 = getelementptr inbounds double, double addrspace(1)* %1, i64 %512
  %514 = load double, double addrspace(1)* %513, align 8, !tbaa !7, !amdgpu.noclobber !5
  %515 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %511
  store double %514, double addrspace(3)* %515, align 8, !tbaa !7
  %516 = add i32 %202, 52
  %517 = add i32 %136, %204
  %518 = sext i32 %516 to i64
  %519 = getelementptr inbounds double, double addrspace(1)* %1, i64 %518
  %520 = load double, double addrspace(1)* %519, align 8, !tbaa !7, !amdgpu.noclobber !5
  %521 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %517
  store double %520, double addrspace(3)* %521, align 8, !tbaa !7
  %522 = add i32 %202, 53
  %523 = add i32 %138, %204
  %524 = sext i32 %522 to i64
  %525 = getelementptr inbounds double, double addrspace(1)* %1, i64 %524
  %526 = load double, double addrspace(1)* %525, align 8, !tbaa !7, !amdgpu.noclobber !5
  %527 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %523
  store double %526, double addrspace(3)* %527, align 8, !tbaa !7
  %528 = add i32 %202, 54
  %529 = add i32 %140, %204
  %530 = sext i32 %528 to i64
  %531 = getelementptr inbounds double, double addrspace(1)* %1, i64 %530
  %532 = load double, double addrspace(1)* %531, align 8, !tbaa !7, !amdgpu.noclobber !5
  %533 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %529
  store double %532, double addrspace(3)* %533, align 8, !tbaa !7
  %534 = add i32 %202, 55
  %535 = add i32 %142, %204
  %536 = sext i32 %534 to i64
  %537 = getelementptr inbounds double, double addrspace(1)* %1, i64 %536
  %538 = load double, double addrspace(1)* %537, align 8, !tbaa !7, !amdgpu.noclobber !5
  %539 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %535
  store double %538, double addrspace(3)* %539, align 8, !tbaa !7
  %540 = add i32 %202, 56
  %541 = add i32 %144, %204
  %542 = sext i32 %540 to i64
  %543 = getelementptr inbounds double, double addrspace(1)* %1, i64 %542
  %544 = load double, double addrspace(1)* %543, align 8, !tbaa !7, !amdgpu.noclobber !5
  %545 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %541
  store double %544, double addrspace(3)* %545, align 8, !tbaa !7
  %546 = add i32 %202, 57
  %547 = add i32 %146, %204
  %548 = sext i32 %546 to i64
  %549 = getelementptr inbounds double, double addrspace(1)* %1, i64 %548
  %550 = load double, double addrspace(1)* %549, align 8, !tbaa !7, !amdgpu.noclobber !5
  %551 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %547
  store double %550, double addrspace(3)* %551, align 8, !tbaa !7
  %552 = add i32 %202, 58
  %553 = add i32 %148, %204
  %554 = sext i32 %552 to i64
  %555 = getelementptr inbounds double, double addrspace(1)* %1, i64 %554
  %556 = load double, double addrspace(1)* %555, align 8, !tbaa !7, !amdgpu.noclobber !5
  %557 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %553
  store double %556, double addrspace(3)* %557, align 8, !tbaa !7
  %558 = add i32 %202, 59
  %559 = add i32 %150, %204
  %560 = sext i32 %558 to i64
  %561 = getelementptr inbounds double, double addrspace(1)* %1, i64 %560
  %562 = load double, double addrspace(1)* %561, align 8, !tbaa !7, !amdgpu.noclobber !5
  %563 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %559
  store double %562, double addrspace(3)* %563, align 8, !tbaa !7
  %564 = add i32 %202, 60
  %565 = add i32 %152, %204
  %566 = sext i32 %564 to i64
  %567 = getelementptr inbounds double, double addrspace(1)* %1, i64 %566
  %568 = load double, double addrspace(1)* %567, align 8, !tbaa !7, !amdgpu.noclobber !5
  %569 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %565
  store double %568, double addrspace(3)* %569, align 8, !tbaa !7
  %570 = add i32 %202, 61
  %571 = add i32 %154, %204
  %572 = sext i32 %570 to i64
  %573 = getelementptr inbounds double, double addrspace(1)* %1, i64 %572
  %574 = load double, double addrspace(1)* %573, align 8, !tbaa !7, !amdgpu.noclobber !5
  %575 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %571
  store double %574, double addrspace(3)* %575, align 8, !tbaa !7
  %576 = add i32 %202, 62
  %577 = add i32 %156, %204
  %578 = sext i32 %576 to i64
  %579 = getelementptr inbounds double, double addrspace(1)* %1, i64 %578
  %580 = load double, double addrspace(1)* %579, align 8, !tbaa !7, !amdgpu.noclobber !5
  %581 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %577
  store double %580, double addrspace(3)* %581, align 8, !tbaa !7
  %582 = add i32 %202, 63
  %583 = add i32 %158, %204
  %584 = sext i32 %582 to i64
  %585 = getelementptr inbounds double, double addrspace(1)* %1, i64 %584
  %586 = load double, double addrspace(1)* %585, align 8, !tbaa !7, !amdgpu.noclobber !5
  %587 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %583
  store double %586, double addrspace(3)* %587, align 8, !tbaa !7
  %588 = add i32 %202, 64
  %589 = add i32 %160, %204
  %590 = sext i32 %588 to i64
  %591 = getelementptr inbounds double, double addrspace(1)* %1, i64 %590
  %592 = load double, double addrspace(1)* %591, align 8, !tbaa !7, !amdgpu.noclobber !5
  %593 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %589
  store double %592, double addrspace(3)* %593, align 8, !tbaa !7
  %594 = add i32 %202, 65
  %595 = add i32 %162, %204
  %596 = sext i32 %594 to i64
  %597 = getelementptr inbounds double, double addrspace(1)* %1, i64 %596
  %598 = load double, double addrspace(1)* %597, align 8, !tbaa !7, !amdgpu.noclobber !5
  %599 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %595
  store double %598, double addrspace(3)* %599, align 8, !tbaa !7
  %600 = add i32 %202, 66
  %601 = add i32 %164, %204
  %602 = sext i32 %600 to i64
  %603 = getelementptr inbounds double, double addrspace(1)* %1, i64 %602
  %604 = load double, double addrspace(1)* %603, align 8, !tbaa !7, !amdgpu.noclobber !5
  %605 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %601
  store double %604, double addrspace(3)* %605, align 8, !tbaa !7
  %606 = add i32 %202, 67
  %607 = add i32 %166, %204
  %608 = sext i32 %606 to i64
  %609 = getelementptr inbounds double, double addrspace(1)* %1, i64 %608
  %610 = load double, double addrspace(1)* %609, align 8, !tbaa !7, !amdgpu.noclobber !5
  %611 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %607
  store double %610, double addrspace(3)* %611, align 8, !tbaa !7
  %612 = add i32 %202, 68
  %613 = add i32 %168, %204
  %614 = sext i32 %612 to i64
  %615 = getelementptr inbounds double, double addrspace(1)* %1, i64 %614
  %616 = load double, double addrspace(1)* %615, align 8, !tbaa !7, !amdgpu.noclobber !5
  %617 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %613
  store double %616, double addrspace(3)* %617, align 8, !tbaa !7
  %618 = add i32 %202, 69
  %619 = add i32 %170, %204
  %620 = sext i32 %618 to i64
  %621 = getelementptr inbounds double, double addrspace(1)* %1, i64 %620
  %622 = load double, double addrspace(1)* %621, align 8, !tbaa !7, !amdgpu.noclobber !5
  %623 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %619
  store double %622, double addrspace(3)* %623, align 8, !tbaa !7
  %624 = add i32 %202, 70
  %625 = add i32 %172, %204
  %626 = sext i32 %624 to i64
  %627 = getelementptr inbounds double, double addrspace(1)* %1, i64 %626
  %628 = load double, double addrspace(1)* %627, align 8, !tbaa !7, !amdgpu.noclobber !5
  %629 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %625
  store double %628, double addrspace(3)* %629, align 8, !tbaa !7
  %630 = add i32 %202, 71
  %631 = add i32 %174, %204
  %632 = sext i32 %630 to i64
  %633 = getelementptr inbounds double, double addrspace(1)* %1, i64 %632
  %634 = load double, double addrspace(1)* %633, align 8, !tbaa !7, !amdgpu.noclobber !5
  %635 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %631
  store double %634, double addrspace(3)* %635, align 8, !tbaa !7
  %636 = add i32 %202, 72
  %637 = add i32 %176, %204
  %638 = sext i32 %636 to i64
  %639 = getelementptr inbounds double, double addrspace(1)* %1, i64 %638
  %640 = load double, double addrspace(1)* %639, align 8, !tbaa !7, !amdgpu.noclobber !5
  %641 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %637
  store double %640, double addrspace(3)* %641, align 8, !tbaa !7
  %642 = add i32 %202, 73
  %643 = add i32 %178, %204
  %644 = sext i32 %642 to i64
  %645 = getelementptr inbounds double, double addrspace(1)* %1, i64 %644
  %646 = load double, double addrspace(1)* %645, align 8, !tbaa !7, !amdgpu.noclobber !5
  %647 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %643
  store double %646, double addrspace(3)* %647, align 8, !tbaa !7
  %648 = add i32 %202, 74
  %649 = add i32 %180, %204
  %650 = sext i32 %648 to i64
  %651 = getelementptr inbounds double, double addrspace(1)* %1, i64 %650
  %652 = load double, double addrspace(1)* %651, align 8, !tbaa !7, !amdgpu.noclobber !5
  %653 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %649
  store double %652, double addrspace(3)* %653, align 8, !tbaa !7
  %654 = add i32 %202, 75
  %655 = add i32 %182, %204
  %656 = sext i32 %654 to i64
  %657 = getelementptr inbounds double, double addrspace(1)* %1, i64 %656
  %658 = load double, double addrspace(1)* %657, align 8, !tbaa !7, !amdgpu.noclobber !5
  %659 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %655
  store double %658, double addrspace(3)* %659, align 8, !tbaa !7
  %660 = add i32 %202, 76
  %661 = add i32 %184, %204
  %662 = sext i32 %660 to i64
  %663 = getelementptr inbounds double, double addrspace(1)* %1, i64 %662
  %664 = load double, double addrspace(1)* %663, align 8, !tbaa !7, !amdgpu.noclobber !5
  %665 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %661
  store double %664, double addrspace(3)* %665, align 8, !tbaa !7
  %666 = add i32 %202, 77
  %667 = add i32 %186, %204
  %668 = sext i32 %666 to i64
  %669 = getelementptr inbounds double, double addrspace(1)* %1, i64 %668
  %670 = load double, double addrspace(1)* %669, align 8, !tbaa !7, !amdgpu.noclobber !5
  %671 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %667
  store double %670, double addrspace(3)* %671, align 8, !tbaa !7
  %672 = add i32 %202, 78
  %673 = add i32 %188, %204
  %674 = sext i32 %672 to i64
  %675 = getelementptr inbounds double, double addrspace(1)* %1, i64 %674
  %676 = load double, double addrspace(1)* %675, align 8, !tbaa !7, !amdgpu.noclobber !5
  %677 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %673
  store double %676, double addrspace(3)* %677, align 8, !tbaa !7
  %678 = add i32 %202, 79
  %679 = add i32 %190, %204
  %680 = sext i32 %678 to i64
  %681 = getelementptr inbounds double, double addrspace(1)* %1, i64 %680
  %682 = load double, double addrspace(1)* %681, align 8, !tbaa !7, !amdgpu.noclobber !5
  %683 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %679
  store double %682, double addrspace(3)* %683, align 8, !tbaa !7
  %684 = add i32 %202, 80
  %685 = add i32 %192, %204
  %686 = sext i32 %684 to i64
  %687 = getelementptr inbounds double, double addrspace(1)* %1, i64 %686
  %688 = load double, double addrspace(1)* %687, align 8, !tbaa !7, !amdgpu.noclobber !5
  %689 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %685
  store double %688, double addrspace(3)* %689, align 8, !tbaa !7
  %690 = add i32 %202, 81
  %691 = add i32 %194, %204
  %692 = sext i32 %690 to i64
  %693 = getelementptr inbounds double, double addrspace(1)* %1, i64 %692
  %694 = load double, double addrspace(1)* %693, align 8, !tbaa !7, !amdgpu.noclobber !5
  %695 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %691
  store double %694, double addrspace(3)* %695, align 8, !tbaa !7
  %696 = add i32 %202, 82
  %697 = add i32 %196, %204
  %698 = sext i32 %696 to i64
  %699 = getelementptr inbounds double, double addrspace(1)* %1, i64 %698
  %700 = load double, double addrspace(1)* %699, align 8, !tbaa !7, !amdgpu.noclobber !5
  %701 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %697
  store double %700, double addrspace(3)* %701, align 8, !tbaa !7
  %702 = add i32 %202, 83
  %703 = add i32 %198, %204
  %704 = sext i32 %702 to i64
  %705 = getelementptr inbounds double, double addrspace(1)* %1, i64 %704
  %706 = load double, double addrspace(1)* %705, align 8, !tbaa !7, !amdgpu.noclobber !5
  %707 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %703
  store double %706, double addrspace(3)* %707, align 8, !tbaa !7
  %708 = add nuw nsw i32 %200, 1
  %709 = icmp eq i32 %708, 84
  br i1 %709, label %710, label %199, !llvm.loop !11

710:                                              ; preds = %199
  %711 = mul nuw nsw i32 %18, 84
  %712 = icmp eq i32 %20, 0
  %713 = icmp eq i32 %21, 0
  %714 = select i1 %712, i1 %713, i1 false
  br i1 %714, label %715, label %936

715:                                              ; preds = %710
  %716 = mul i32 %3, 84
  %717 = mul i32 %716, %19
  %718 = mul i32 %11, 84
  %719 = add i32 %14, 1
  %720 = mul i32 %711, %719
  %721 = or i32 %720, 1
  %722 = mul i32 %721, %3
  %723 = or i32 %711, 1
  %724 = mul i32 %723, %13
  %725 = or i32 %12, 1
  %726 = and i32 %13, 6
  %727 = icmp ult i32 %725, 7
  br i1 %727, label %730, label %728

728:                                              ; preds = %715
  %729 = and i32 %12, 262136
  br label %756

730:                                              ; preds = %715, %756
  %731 = phi i32 [ 0, %715 ], [ %862, %756 ]
  br label %732

732:                                              ; preds = %732, %730
  %733 = phi i32 [ %731, %730 ], [ %747, %732 ]
  %734 = phi i32 [ 0, %730 ], [ %748, %732 ]
  %735 = add i32 %733, %718
  %736 = add i32 %735, %717
  %737 = add i32 %735, %722
  %738 = sext i32 %736 to i64
  %739 = getelementptr inbounds double, double addrspace(1)* %1, i64 %738
  %740 = load double, double addrspace(1)* %739, align 8, !tbaa !7, !amdgpu.noclobber !5
  %741 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %733
  store double %740, double addrspace(3)* %741, align 8, !tbaa !7
  %742 = sext i32 %737 to i64
  %743 = getelementptr inbounds double, double addrspace(1)* %1, i64 %742
  %744 = load double, double addrspace(1)* %743, align 8, !tbaa !7, !amdgpu.noclobber !5
  %745 = add i32 %733, %724
  %746 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %745
  store double %744, double addrspace(3)* %746, align 8, !tbaa !7
  %747 = add nuw nsw i32 %733, 1
  %748 = add i32 %734, 1
  %749 = icmp eq i32 %748, %726
  br i1 %749, label %750, label %732, !llvm.loop !13

750:                                              ; preds = %732
  %751 = mul i32 %19, 84
  %752 = or i32 %751, 1
  %753 = add i32 %6, 1
  %754 = mul i32 %12, %753
  %755 = or i32 %754, 1
  br label %865

756:                                              ; preds = %756, %728
  %757 = phi i32 [ 0, %728 ], [ %862, %756 ]
  %758 = phi i32 [ 0, %728 ], [ %863, %756 ]
  %759 = add i32 %757, %718
  %760 = add i32 %759, %717
  %761 = add i32 %759, %722
  %762 = sext i32 %760 to i64
  %763 = getelementptr inbounds double, double addrspace(1)* %1, i64 %762
  %764 = load double, double addrspace(1)* %763, align 8, !tbaa !7, !amdgpu.noclobber !5
  %765 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %757
  store double %764, double addrspace(3)* %765, align 8, !tbaa !7
  %766 = sext i32 %761 to i64
  %767 = getelementptr inbounds double, double addrspace(1)* %1, i64 %766
  %768 = load double, double addrspace(1)* %767, align 8, !tbaa !7, !amdgpu.noclobber !5
  %769 = add i32 %757, %724
  %770 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %769
  store double %768, double addrspace(3)* %770, align 8, !tbaa !7
  %771 = or i32 %757, 1
  %772 = add i32 %771, %718
  %773 = add i32 %772, %717
  %774 = add i32 %772, %722
  %775 = sext i32 %773 to i64
  %776 = getelementptr inbounds double, double addrspace(1)* %1, i64 %775
  %777 = load double, double addrspace(1)* %776, align 8, !tbaa !7, !amdgpu.noclobber !5
  %778 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %771
  store double %777, double addrspace(3)* %778, align 8, !tbaa !7
  %779 = sext i32 %774 to i64
  %780 = getelementptr inbounds double, double addrspace(1)* %1, i64 %779
  %781 = load double, double addrspace(1)* %780, align 8, !tbaa !7, !amdgpu.noclobber !5
  %782 = add i32 %771, %724
  %783 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %782
  store double %781, double addrspace(3)* %783, align 8, !tbaa !7
  %784 = or i32 %757, 2
  %785 = add i32 %784, %718
  %786 = add i32 %785, %717
  %787 = add i32 %785, %722
  %788 = sext i32 %786 to i64
  %789 = getelementptr inbounds double, double addrspace(1)* %1, i64 %788
  %790 = load double, double addrspace(1)* %789, align 8, !tbaa !7, !amdgpu.noclobber !5
  %791 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %784
  store double %790, double addrspace(3)* %791, align 8, !tbaa !7
  %792 = sext i32 %787 to i64
  %793 = getelementptr inbounds double, double addrspace(1)* %1, i64 %792
  %794 = load double, double addrspace(1)* %793, align 8, !tbaa !7, !amdgpu.noclobber !5
  %795 = add i32 %784, %724
  %796 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %795
  store double %794, double addrspace(3)* %796, align 8, !tbaa !7
  %797 = or i32 %757, 3
  %798 = add i32 %797, %718
  %799 = add i32 %798, %717
  %800 = add i32 %798, %722
  %801 = sext i32 %799 to i64
  %802 = getelementptr inbounds double, double addrspace(1)* %1, i64 %801
  %803 = load double, double addrspace(1)* %802, align 8, !tbaa !7, !amdgpu.noclobber !5
  %804 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %797
  store double %803, double addrspace(3)* %804, align 8, !tbaa !7
  %805 = sext i32 %800 to i64
  %806 = getelementptr inbounds double, double addrspace(1)* %1, i64 %805
  %807 = load double, double addrspace(1)* %806, align 8, !tbaa !7, !amdgpu.noclobber !5
  %808 = add i32 %797, %724
  %809 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %808
  store double %807, double addrspace(3)* %809, align 8, !tbaa !7
  %810 = or i32 %757, 4
  %811 = add i32 %810, %718
  %812 = add i32 %811, %717
  %813 = add i32 %811, %722
  %814 = sext i32 %812 to i64
  %815 = getelementptr inbounds double, double addrspace(1)* %1, i64 %814
  %816 = load double, double addrspace(1)* %815, align 8, !tbaa !7, !amdgpu.noclobber !5
  %817 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %810
  store double %816, double addrspace(3)* %817, align 8, !tbaa !7
  %818 = sext i32 %813 to i64
  %819 = getelementptr inbounds double, double addrspace(1)* %1, i64 %818
  %820 = load double, double addrspace(1)* %819, align 8, !tbaa !7, !amdgpu.noclobber !5
  %821 = add i32 %810, %724
  %822 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %821
  store double %820, double addrspace(3)* %822, align 8, !tbaa !7
  %823 = or i32 %757, 5
  %824 = add i32 %823, %718
  %825 = add i32 %824, %717
  %826 = add i32 %824, %722
  %827 = sext i32 %825 to i64
  %828 = getelementptr inbounds double, double addrspace(1)* %1, i64 %827
  %829 = load double, double addrspace(1)* %828, align 8, !tbaa !7, !amdgpu.noclobber !5
  %830 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %823
  store double %829, double addrspace(3)* %830, align 8, !tbaa !7
  %831 = sext i32 %826 to i64
  %832 = getelementptr inbounds double, double addrspace(1)* %1, i64 %831
  %833 = load double, double addrspace(1)* %832, align 8, !tbaa !7, !amdgpu.noclobber !5
  %834 = add i32 %823, %724
  %835 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %834
  store double %833, double addrspace(3)* %835, align 8, !tbaa !7
  %836 = or i32 %757, 6
  %837 = add i32 %836, %718
  %838 = add i32 %837, %717
  %839 = add i32 %837, %722
  %840 = sext i32 %838 to i64
  %841 = getelementptr inbounds double, double addrspace(1)* %1, i64 %840
  %842 = load double, double addrspace(1)* %841, align 8, !tbaa !7, !amdgpu.noclobber !5
  %843 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %836
  store double %842, double addrspace(3)* %843, align 8, !tbaa !7
  %844 = sext i32 %839 to i64
  %845 = getelementptr inbounds double, double addrspace(1)* %1, i64 %844
  %846 = load double, double addrspace(1)* %845, align 8, !tbaa !7, !amdgpu.noclobber !5
  %847 = add i32 %836, %724
  %848 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %847
  store double %846, double addrspace(3)* %848, align 8, !tbaa !7
  %849 = or i32 %757, 7
  %850 = add i32 %849, %718
  %851 = add i32 %850, %717
  %852 = add i32 %850, %722
  %853 = sext i32 %851 to i64
  %854 = getelementptr inbounds double, double addrspace(1)* %1, i64 %853
  %855 = load double, double addrspace(1)* %854, align 8, !tbaa !7, !amdgpu.noclobber !5
  %856 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %849
  store double %855, double addrspace(3)* %856, align 8, !tbaa !7
  %857 = sext i32 %852 to i64
  %858 = getelementptr inbounds double, double addrspace(1)* %1, i64 %857
  %859 = load double, double addrspace(1)* %858, align 8, !tbaa !7, !amdgpu.noclobber !5
  %860 = add i32 %849, %724
  %861 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %860
  store double %859, double addrspace(3)* %861, align 8, !tbaa !7
  %862 = add nuw nsw i32 %757, 8
  %863 = add nuw i32 %758, 8
  %864 = icmp eq i32 %863, %729
  br i1 %864, label %730, label %756, !llvm.loop !15

865:                                              ; preds = %865, %750
  %866 = phi i32 [ 0, %750 ], [ %925, %865 ]
  %867 = add i32 %752, %866
  %868 = mul i32 %867, %3
  %869 = add i32 %868, %718
  %870 = add i32 %755, %868
  %871 = sext i32 %869 to i64
  %872 = getelementptr inbounds double, double addrspace(1)* %1, i64 %871
  %873 = load double, double addrspace(1)* %872, align 8, !tbaa !7, !amdgpu.noclobber !5
  %874 = or i32 %866, 1
  %875 = mul nuw nsw i32 %874, %13
  %876 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %875
  store double %873, double addrspace(3)* %876, align 8, !tbaa !7
  %877 = sext i32 %870 to i64
  %878 = getelementptr inbounds double, double addrspace(1)* %1, i64 %877
  %879 = load double, double addrspace(1)* %878, align 8, !tbaa !7, !amdgpu.noclobber !5
  %880 = or i32 %866, 2
  %881 = mul nuw nsw i32 %880, %13
  %882 = add nsw i32 %881, -1
  %883 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %882
  store double %879, double addrspace(3)* %883, align 8, !tbaa !7
  %884 = add i32 %752, %874
  %885 = mul i32 %884, %3
  %886 = add i32 %885, %718
  %887 = add i32 %755, %885
  %888 = sext i32 %886 to i64
  %889 = getelementptr inbounds double, double addrspace(1)* %1, i64 %888
  %890 = load double, double addrspace(1)* %889, align 8, !tbaa !7, !amdgpu.noclobber !5
  %891 = or i32 %866, 2
  %892 = mul nuw nsw i32 %891, %13
  %893 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %892
  store double %890, double addrspace(3)* %893, align 8, !tbaa !7
  %894 = sext i32 %887 to i64
  %895 = getelementptr inbounds double, double addrspace(1)* %1, i64 %894
  %896 = load double, double addrspace(1)* %895, align 8, !tbaa !7, !amdgpu.noclobber !5
  %897 = or i32 %866, 3
  %898 = mul nuw nsw i32 %897, %13
  %899 = add nsw i32 %898, -1
  %900 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %899
  store double %896, double addrspace(3)* %900, align 8, !tbaa !7
  %901 = add i32 %752, %891
  %902 = mul i32 %901, %3
  %903 = add i32 %902, %718
  %904 = add i32 %755, %902
  %905 = sext i32 %903 to i64
  %906 = getelementptr inbounds double, double addrspace(1)* %1, i64 %905
  %907 = load double, double addrspace(1)* %906, align 8, !tbaa !7, !amdgpu.noclobber !5
  %908 = or i32 %866, 3
  %909 = mul nuw nsw i32 %908, %13
  %910 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %909
  store double %907, double addrspace(3)* %910, align 8, !tbaa !7
  %911 = sext i32 %904 to i64
  %912 = getelementptr inbounds double, double addrspace(1)* %1, i64 %911
  %913 = load double, double addrspace(1)* %912, align 8, !tbaa !7, !amdgpu.noclobber !5
  %914 = add nuw nsw i32 %866, 4
  %915 = mul nuw nsw i32 %914, %13
  %916 = add nsw i32 %915, -1
  %917 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %916
  store double %913, double addrspace(3)* %917, align 8, !tbaa !7
  %918 = add i32 %752, %908
  %919 = mul i32 %918, %3
  %920 = add i32 %919, %718
  %921 = add i32 %755, %919
  %922 = sext i32 %920 to i64
  %923 = getelementptr inbounds double, double addrspace(1)* %1, i64 %922
  %924 = load double, double addrspace(1)* %923, align 8, !tbaa !7, !amdgpu.noclobber !5
  %925 = add nuw nsw i32 %866, 4
  %926 = mul nuw nsw i32 %925, %13
  %927 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %926
  store double %924, double addrspace(3)* %927, align 8, !tbaa !7
  %928 = sext i32 %921 to i64
  %929 = getelementptr inbounds double, double addrspace(1)* %1, i64 %928
  %930 = load double, double addrspace(1)* %929, align 8, !tbaa !7, !amdgpu.noclobber !5
  %931 = add nuw i32 %866, 5
  %932 = mul nuw nsw i32 %931, %13
  %933 = add nsw i32 %932, -1
  %934 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %933
  store double %930, double addrspace(3)* %934, align 8, !tbaa !7
  %935 = icmp eq i32 %925, %711
  br i1 %935, label %936, label %865, !llvm.loop !16

936:                                              ; preds = %865, %710
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %937

937:                                              ; preds = %936, %994
  %938 = phi i32 [ 0, %936 ], [ %995, %994 ]
  %939 = mul nsw i32 %938, %3
  %940 = add i32 %29, %939
  %941 = add nuw nsw i32 %938, %30
  %942 = mul i32 %941, %13
  br label %943

943:                                              ; preds = %943, %937
  %944 = phi i32 [ 0, %937 ], [ %992, %943 ]
  %945 = add i32 %940, %944
  %946 = add nuw nsw i32 %944, %22
  %947 = or i32 %946, 1
  %948 = add nuw i32 %947, %13
  %949 = add i32 %948, %942
  %950 = sub nsw i32 %949, %13
  %951 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %950
  %952 = load double, double addrspace(3)* %951, align 8, !tbaa !7
  %953 = add nsw i32 %949, %13
  %954 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %953
  %955 = load double, double addrspace(3)* %954, align 8, !tbaa !7
  %956 = add nsw i32 %949, 1
  %957 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %956
  %958 = load double, double addrspace(3)* %957, align 8, !tbaa !7
  %959 = add nsw i32 %949, -1
  %960 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %959
  %961 = load double, double addrspace(3)* %960, align 8, !tbaa !7
  %962 = fadd contract double %952, %955
  %963 = fadd contract double %962, %958
  %964 = fadd contract double %963, %961
  %965 = fdiv contract double %964, 5.500000e+00
  %966 = sext i32 %945 to i64
  %967 = getelementptr inbounds double, double addrspace(1)* %0, i64 %966
  store double %965, double addrspace(1)* %967, align 8, !tbaa !7
  %968 = or i32 %944, 1
  %969 = add i32 %940, %968
  %970 = add nuw nsw i32 %968, %22
  %971 = add nuw nsw i32 %970, 1
  %972 = add nuw i32 %971, %13
  %973 = add i32 %972, %942
  %974 = sub nsw i32 %973, %13
  %975 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %974
  %976 = load double, double addrspace(3)* %975, align 8, !tbaa !7
  %977 = add nsw i32 %973, %13
  %978 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %977
  %979 = load double, double addrspace(3)* %978, align 8, !tbaa !7
  %980 = or i32 %973, 1
  %981 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %980
  %982 = load double, double addrspace(3)* %981, align 8, !tbaa !7
  %983 = add nsw i32 %973, -1
  %984 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @shared_mem, i32 0, i32 %983
  %985 = load double, double addrspace(3)* %984, align 8, !tbaa !7
  %986 = fadd contract double %976, %979
  %987 = fadd contract double %986, %982
  %988 = fadd contract double %987, %985
  %989 = fdiv contract double %988, 5.500000e+00
  %990 = sext i32 %969 to i64
  %991 = getelementptr inbounds double, double addrspace(1)* %0, i64 %990
  store double %989, double addrspace(1)* %991, align 8, !tbaa !7
  %992 = add nuw nsw i32 %944, 2
  %993 = icmp eq i32 %992, 84
  br i1 %993, label %994, label %943, !llvm.loop !17

994:                                              ; preds = %943
  %995 = add nuw nsw i32 %938, 1
  %996 = icmp eq i32 %995, 84
  br i1 %996, label %997, label %937, !llvm.loop !18

997:                                              ; preds = %994
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
