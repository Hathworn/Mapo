; ModuleID = '../data/hip_kernels/1838/88/main.cu'
source_filename = "../data/hip_kernels/1838/88/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28normal_eqs_flow_multicam_GPUPfP15HIP_vector_typeIfLj2EES_PiPKfS5_S5_PKiS7_S7_S7_S7_(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = mul i32 %26, %20
  %28 = mul i32 %25, %20
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !15, !amdgpu.noclobber !14
  %33 = sitofp i32 %32 to float
  %34 = sitofp i32 %28 to float
  %35 = fdiv contract float %33, %34
  %36 = tail call float @llvm.ceil.f32(float %35)
  %37 = fptosi float %36 to i32
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %30
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !15, !amdgpu.noclobber !14
  %40 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !19, !amdgpu.noclobber !14
  %42 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !19, !amdgpu.noclobber !14
  %44 = getelementptr inbounds float, float addrspace(1)* %6, i64 %30
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !19, !amdgpu.noclobber !14
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %30
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !15, !amdgpu.noclobber !14
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %30
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !15, !amdgpu.noclobber !14
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %30
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !15, !amdgpu.noclobber !14
  %52 = mul i32 %27, %37
  %53 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %54 = add i32 %52, %53
  %55 = add i32 %26, 1
  %56 = mul i32 %55, %20
  %57 = mul i32 %56, %37
  %58 = icmp ult i32 %54, %57
  br i1 %58, label %59, label %63

59:                                               ; preds = %12
  %60 = mul nsw i32 %49, %47
  %61 = sitofp i32 %49 to float
  %62 = fmul contract float %41, %41
  br label %180

63:                                               ; preds = %359, %12
  %64 = phi float [ 0.000000e+00, %12 ], [ %360, %359 ]
  %65 = phi float [ 0.000000e+00, %12 ], [ %361, %359 ]
  %66 = phi float [ 0.000000e+00, %12 ], [ %362, %359 ]
  %67 = phi float [ 0.000000e+00, %12 ], [ %363, %359 ]
  %68 = phi float [ 0.000000e+00, %12 ], [ %364, %359 ]
  %69 = phi float [ 0.000000e+00, %12 ], [ %365, %359 ]
  %70 = phi float [ 0.000000e+00, %12 ], [ %366, %359 ]
  %71 = phi float [ 0.000000e+00, %12 ], [ %367, %359 ]
  %72 = phi float [ 0.000000e+00, %12 ], [ %368, %359 ]
  %73 = phi float [ 0.000000e+00, %12 ], [ %369, %359 ]
  %74 = phi float [ 0.000000e+00, %12 ], [ %370, %359 ]
  %75 = phi float [ 0.000000e+00, %12 ], [ %371, %359 ]
  %76 = phi float [ 0.000000e+00, %12 ], [ %372, %359 ]
  %77 = phi float [ 0.000000e+00, %12 ], [ %373, %359 ]
  %78 = phi float [ 0.000000e+00, %12 ], [ %374, %359 ]
  %79 = phi float [ 0.000000e+00, %12 ], [ %375, %359 ]
  %80 = phi float [ 0.000000e+00, %12 ], [ %376, %359 ]
  %81 = phi float [ 0.000000e+00, %12 ], [ %377, %359 ]
  %82 = phi float [ 0.000000e+00, %12 ], [ %378, %359 ]
  %83 = phi float [ 0.000000e+00, %12 ], [ %379, %359 ]
  %84 = phi float [ 0.000000e+00, %12 ], [ %380, %359 ]
  %85 = phi float [ 0.000000e+00, %12 ], [ %381, %359 ]
  %86 = phi float [ 0.000000e+00, %12 ], [ %382, %359 ]
  %87 = mul i32 %29, 23
  %88 = mul i32 %87, %28
  %89 = add i32 %27, %53
  %90 = add i32 %89, %88
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  store float %86, float addrspace(1)* %92, align 4, !tbaa !19
  %93 = add nsw i32 %90, %28
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  store float %85, float addrspace(1)* %95, align 4, !tbaa !19
  %96 = shl nsw i32 %28, 1
  %97 = add nsw i32 %90, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float %84, float addrspace(1)* %99, align 4, !tbaa !19
  %100 = mul nsw i32 %28, 3
  %101 = add nsw i32 %90, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  store float %83, float addrspace(1)* %103, align 4, !tbaa !19
  %104 = shl nsw i32 %28, 2
  %105 = add nsw i32 %90, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  store float %82, float addrspace(1)* %107, align 4, !tbaa !19
  %108 = mul nsw i32 %28, 5
  %109 = add nsw i32 %90, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %81, float addrspace(1)* %111, align 4, !tbaa !19
  %112 = mul nsw i32 %28, 6
  %113 = add nsw i32 %90, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %80, float addrspace(1)* %115, align 4, !tbaa !19
  %116 = mul nsw i32 %28, 7
  %117 = add nsw i32 %90, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  store float %79, float addrspace(1)* %119, align 4, !tbaa !19
  %120 = shl nsw i32 %28, 3
  %121 = add nsw i32 %90, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  store float %64, float addrspace(1)* %123, align 4, !tbaa !19
  %124 = mul nsw i32 %28, 9
  %125 = add nsw i32 %90, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %65, float addrspace(1)* %127, align 4, !tbaa !19
  %128 = mul nsw i32 %28, 10
  %129 = add nsw i32 %90, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  store float %66, float addrspace(1)* %131, align 4, !tbaa !19
  %132 = mul nsw i32 %28, 11
  %133 = add nsw i32 %90, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  store float %67, float addrspace(1)* %135, align 4, !tbaa !19
  %136 = mul nsw i32 %28, 12
  %137 = add nsw i32 %90, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  store float %68, float addrspace(1)* %139, align 4, !tbaa !19
  %140 = mul nsw i32 %28, 13
  %141 = add nsw i32 %90, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  store float %69, float addrspace(1)* %143, align 4, !tbaa !19
  %144 = mul nsw i32 %28, 14
  %145 = add nsw i32 %90, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  store float %70, float addrspace(1)* %147, align 4, !tbaa !19
  %148 = mul nsw i32 %28, 15
  %149 = add nsw i32 %90, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %71, float addrspace(1)* %151, align 4, !tbaa !19
  %152 = shl nsw i32 %28, 4
  %153 = add nsw i32 %90, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  store float %72, float addrspace(1)* %155, align 4, !tbaa !19
  %156 = mul nsw i32 %28, 17
  %157 = add nsw i32 %90, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  store float %73, float addrspace(1)* %159, align 4, !tbaa !19
  %160 = mul nsw i32 %28, 18
  %161 = add nsw i32 %90, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  store float %74, float addrspace(1)* %163, align 4, !tbaa !19
  %164 = mul nsw i32 %28, 19
  %165 = add nsw i32 %90, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  store float %75, float addrspace(1)* %167, align 4, !tbaa !19
  %168 = mul nsw i32 %28, 20
  %169 = add nsw i32 %90, %168
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  store float %76, float addrspace(1)* %171, align 4, !tbaa !19
  %172 = mul nsw i32 %28, 21
  %173 = add nsw i32 %90, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  store float %77, float addrspace(1)* %175, align 4, !tbaa !19
  %176 = mul nsw i32 %28, 22
  %177 = add nsw i32 %90, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  store float %78, float addrspace(1)* %179, align 4, !tbaa !19
  ret void

180:                                              ; preds = %59, %359
  %181 = phi float [ 0.000000e+00, %59 ], [ %382, %359 ]
  %182 = phi float [ 0.000000e+00, %59 ], [ %381, %359 ]
  %183 = phi float [ 0.000000e+00, %59 ], [ %380, %359 ]
  %184 = phi float [ 0.000000e+00, %59 ], [ %379, %359 ]
  %185 = phi float [ 0.000000e+00, %59 ], [ %378, %359 ]
  %186 = phi float [ 0.000000e+00, %59 ], [ %377, %359 ]
  %187 = phi float [ 0.000000e+00, %59 ], [ %376, %359 ]
  %188 = phi float [ 0.000000e+00, %59 ], [ %375, %359 ]
  %189 = phi i32 [ %54, %59 ], [ %383, %359 ]
  %190 = phi float [ 0.000000e+00, %59 ], [ %374, %359 ]
  %191 = phi float [ 0.000000e+00, %59 ], [ %373, %359 ]
  %192 = phi float [ 0.000000e+00, %59 ], [ %372, %359 ]
  %193 = phi float [ 0.000000e+00, %59 ], [ %371, %359 ]
  %194 = phi float [ 0.000000e+00, %59 ], [ %370, %359 ]
  %195 = phi float [ 0.000000e+00, %59 ], [ %369, %359 ]
  %196 = phi float [ 0.000000e+00, %59 ], [ %368, %359 ]
  %197 = phi float [ 0.000000e+00, %59 ], [ %367, %359 ]
  %198 = phi float [ 0.000000e+00, %59 ], [ %366, %359 ]
  %199 = phi float [ 0.000000e+00, %59 ], [ %365, %359 ]
  %200 = phi float [ 0.000000e+00, %59 ], [ %364, %359 ]
  %201 = phi float [ 0.000000e+00, %59 ], [ %363, %359 ]
  %202 = phi float [ 0.000000e+00, %59 ], [ %362, %359 ]
  %203 = phi float [ 0.000000e+00, %59 ], [ %361, %359 ]
  %204 = phi float [ 0.000000e+00, %59 ], [ %360, %359 ]
  %205 = icmp slt i32 %189, %32
  br i1 %205, label %206, label %359

206:                                              ; preds = %180
  %207 = add nsw i32 %189, %39
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %208, i32 0, i32 0, i32 0, i64 0
  %210 = load float, float addrspace(1)* %209, align 8, !amdgpu.noclobber !14
  %211 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %208, i32 0, i32 0, i32 0, i64 1
  %212 = load float, float addrspace(1)* %211, align 4, !amdgpu.noclobber !14
  %213 = getelementptr inbounds float, float addrspace(1)* %2, i64 %208
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !19, !amdgpu.noclobber !14
  %215 = fdiv contract float 1.000000e+00, %214
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %208
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !15, !amdgpu.noclobber !14
  %218 = sub nsw i32 %217, %51
  %219 = icmp slt i32 %218, %60
  %220 = select i1 %219, i32 0, i32 %47
  %221 = mul nsw i32 %220, %49
  %222 = sub nsw i32 %218, %221
  %223 = sitofp i32 %222 to float
  %224 = fdiv contract float %223, %61
  %225 = tail call float @llvm.floor.f32(float %224)
  %226 = fmul contract float %225, %61
  %227 = fsub contract float %223, %226
  %228 = fsub contract float %227, %43
  %229 = fsub contract float %225, %45
  %230 = fneg contract float %229
  %231 = fneg contract float %212
  %232 = fmul contract float %215, %215
  %233 = fmul contract float %41, %232
  %234 = fmul contract float %41, %233
  %235 = fadd contract float %181, %234
  %236 = fneg contract float %215
  %237 = fmul contract float %215, %236
  %238 = fmul contract float %237, %228
  %239 = fmul contract float %41, %238
  %240 = fadd contract float %182, %239
  %241 = fmul contract float %228, %236
  %242 = fmul contract float %229, %241
  %243 = fsub contract float %183, %242
  %244 = fmul contract float %41, %215
  %245 = fmul contract float %41, %244
  %246 = fmul contract float %215, %228
  %247 = fmul contract float %228, %246
  %248 = fadd contract float %245, %247
  %249 = fadd contract float %184, %248
  %250 = fmul contract float %215, %229
  %251 = fmul contract float %41, %250
  %252 = fadd contract float %185, %251
  %253 = fmul contract float %237, %230
  %254 = fmul contract float %41, %253
  %255 = fadd contract float %186, %254
  %256 = fmul contract float %41, %236
  %257 = fmul contract float %41, %256
  %258 = fmul contract float %215, %230
  %259 = fmul contract float %258, %230
  %260 = fsub contract float %257, %259
  %261 = fadd contract float %187, %260
  %262 = fmul contract float %41, %246
  %263 = fadd contract float %188, %262
  %264 = fmul contract float %232, %228
  %265 = fmul contract float %228, %264
  %266 = fmul contract float %232, %230
  %267 = fmul contract float %229, %266
  %268 = fsub contract float %265, %267
  %269 = fadd contract float %204, %268
  %270 = fmul contract float %247, %230
  %271 = fdiv contract float %270, %41
  %272 = fmul contract float %41, %258
  %273 = fadd contract float %272, %271
  %274 = fmul contract float %259, %230
  %275 = fdiv contract float %274, %41
  %276 = fadd contract float %275, %273
  %277 = fadd contract float %203, %276
  %278 = fmul contract float %41, %241
  %279 = fmul contract float %228, %247
  %280 = fdiv contract float %279, %41
  %281 = fsub contract float %278, %280
  %282 = fmul contract float %246, %230
  %283 = fmul contract float %282, %230
  %284 = fdiv contract float %283, %41
  %285 = fsub contract float %281, %284
  %286 = fadd contract float %202, %285
  %287 = fmul contract float %228, %228
  %288 = fmul contract float %287, %230
  %289 = fmul contract float %288, %230
  %290 = fdiv contract float %289, %62
  %291 = fadd contract float %62, %290
  %292 = fmul contract float %229, 2.000000e+00
  %293 = fmul contract float %229, %292
  %294 = fadd contract float %291, %293
  %295 = fmul contract float %229, %229
  %296 = fmul contract float %295, %230
  %297 = fmul contract float %296, %230
  %298 = fdiv contract float %297, %62
  %299 = fadd contract float %298, %294
  %300 = fadd contract float %201, %299
  %301 = fmul contract float %228, -2.000000e+00
  %302 = fmul contract float %301, %230
  %303 = fmul contract float %228, %287
  %304 = fmul contract float %303, %230
  %305 = fdiv contract float %304, %62
  %306 = fsub contract float %302, %305
  %307 = fmul contract float %228, %230
  %308 = fmul contract float %307, %230
  %309 = fmul contract float %308, %230
  %310 = fdiv contract float %309, %62
  %311 = fsub contract float %306, %310
  %312 = fadd contract float %200, %311
  %313 = fmul contract float %41, %228
  %314 = fsub contract float %199, %313
  %315 = fmul contract float %228, 2.000000e+00
  %316 = fmul contract float %228, %315
  %317 = fadd contract float %62, %316
  %318 = fmul contract float %228, %303
  %319 = fdiv contract float %318, %62
  %320 = fadd contract float %317, %319
  %321 = fadd contract float %290, %320
  %322 = fadd contract float %198, %321
  %323 = fmul contract float %41, %229
  %324 = fadd contract float %197, %323
  %325 = fadd contract float %295, %287
  %326 = fadd contract float %196, %325
  %327 = fmul contract float %210, %215
  %328 = fmul contract float %41, %327
  %329 = fadd contract float %195, %328
  %330 = fmul contract float %215, %231
  %331 = fmul contract float %41, %330
  %332 = fadd contract float %194, %331
  %333 = fmul contract float %210, %241
  %334 = fmul contract float %212, %258
  %335 = fadd contract float %334, %333
  %336 = fadd contract float %193, %335
  %337 = fmul contract float %229, %228
  %338 = fmul contract float %210, %337
  %339 = fdiv contract float %338, %41
  %340 = fmul contract float %41, %212
  %341 = fadd contract float %340, %339
  %342 = fmul contract float %212, %229
  %343 = fmul contract float %342, %230
  %344 = fdiv contract float %343, %41
  %345 = fsub contract float %341, %344
  %346 = fadd contract float %192, %345
  %347 = fmul contract float %41, %210
  %348 = fmul contract float %210, %287
  %349 = fdiv contract float %348, %41
  %350 = fadd contract float %347, %349
  %351 = fmul contract float %307, %231
  %352 = fdiv contract float %351, %41
  %353 = fadd contract float %352, %350
  %354 = fadd contract float %191, %353
  %355 = fmul contract float %210, %229
  %356 = fmul contract float %212, %228
  %357 = fsub contract float %355, %356
  %358 = fadd contract float %190, %357
  br label %359

359:                                              ; preds = %180, %206
  %360 = phi float [ %269, %206 ], [ %204, %180 ]
  %361 = phi float [ %277, %206 ], [ %203, %180 ]
  %362 = phi float [ %286, %206 ], [ %202, %180 ]
  %363 = phi float [ %300, %206 ], [ %201, %180 ]
  %364 = phi float [ %312, %206 ], [ %200, %180 ]
  %365 = phi float [ %314, %206 ], [ %199, %180 ]
  %366 = phi float [ %322, %206 ], [ %198, %180 ]
  %367 = phi float [ %324, %206 ], [ %197, %180 ]
  %368 = phi float [ %326, %206 ], [ %196, %180 ]
  %369 = phi float [ %329, %206 ], [ %195, %180 ]
  %370 = phi float [ %332, %206 ], [ %194, %180 ]
  %371 = phi float [ %336, %206 ], [ %193, %180 ]
  %372 = phi float [ %346, %206 ], [ %192, %180 ]
  %373 = phi float [ %354, %206 ], [ %191, %180 ]
  %374 = phi float [ %358, %206 ], [ %190, %180 ]
  %375 = phi float [ %263, %206 ], [ %188, %180 ]
  %376 = phi float [ %261, %206 ], [ %187, %180 ]
  %377 = phi float [ %255, %206 ], [ %186, %180 ]
  %378 = phi float [ %252, %206 ], [ %185, %180 ]
  %379 = phi float [ %249, %206 ], [ %184, %180 ]
  %380 = phi float [ %243, %206 ], [ %183, %180 ]
  %381 = phi float [ %240, %206 ], [ %182, %180 ]
  %382 = phi float [ %235, %206 ], [ %181, %180 ]
  %383 = add i32 %189, %20
  %384 = icmp ult i32 %383, %57
  br i1 %384, label %180, label %63, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !17, i64 0}
!21 = !{i32 0, i32 1024}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
