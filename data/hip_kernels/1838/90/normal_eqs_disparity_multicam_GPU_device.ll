; ModuleID = '../data/hip_kernels/1838/90/main.cu'
source_filename = "../data/hip_kernels/1838/90/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z33normal_eqs_disparity_multicam_GPUPfS_P15HIP_vector_typeIfLj4EEPiPKfS5_S5_S5_PKiS7_S7_S7_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
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
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %30
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !15, !amdgpu.noclobber !14
  %48 = mul i32 %27, %37
  %49 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %50 = add i32 %48, %49
  %51 = add i32 %26, 1
  %52 = mul i32 %51, %20
  %53 = mul i32 %52, %37
  %54 = icmp ult i32 %50, %53
  br i1 %54, label %55, label %63

55:                                               ; preds = %12
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %30
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !15, !amdgpu.noclobber !14
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %30
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !19, !amdgpu.noclobber !14
  %60 = sitofp i32 %57 to float
  %61 = fneg contract float %41
  %62 = fmul contract float %59, %61
  br label %200

63:                                               ; preds = %509, %12
  %64 = phi float [ 0.000000e+00, %12 ], [ %510, %509 ]
  %65 = phi float [ 0.000000e+00, %12 ], [ %511, %509 ]
  %66 = phi float [ 0.000000e+00, %12 ], [ %512, %509 ]
  %67 = phi float [ 0.000000e+00, %12 ], [ %513, %509 ]
  %68 = phi float [ 0.000000e+00, %12 ], [ %514, %509 ]
  %69 = phi float [ 0.000000e+00, %12 ], [ %515, %509 ]
  %70 = phi float [ 0.000000e+00, %12 ], [ %516, %509 ]
  %71 = phi float [ 0.000000e+00, %12 ], [ %517, %509 ]
  %72 = phi float [ 0.000000e+00, %12 ], [ %518, %509 ]
  %73 = phi float [ 0.000000e+00, %12 ], [ %519, %509 ]
  %74 = phi float [ 0.000000e+00, %12 ], [ %520, %509 ]
  %75 = phi float [ 0.000000e+00, %12 ], [ %521, %509 ]
  %76 = phi float [ 0.000000e+00, %12 ], [ %522, %509 ]
  %77 = phi float [ 0.000000e+00, %12 ], [ %523, %509 ]
  %78 = phi float [ 0.000000e+00, %12 ], [ %524, %509 ]
  %79 = phi float [ 0.000000e+00, %12 ], [ %525, %509 ]
  %80 = phi float [ 0.000000e+00, %12 ], [ %526, %509 ]
  %81 = phi float [ 0.000000e+00, %12 ], [ %527, %509 ]
  %82 = phi float [ 0.000000e+00, %12 ], [ %528, %509 ]
  %83 = phi float [ 0.000000e+00, %12 ], [ %529, %509 ]
  %84 = phi float [ 0.000000e+00, %12 ], [ %530, %509 ]
  %85 = phi float [ 0.000000e+00, %12 ], [ %531, %509 ]
  %86 = phi float [ 0.000000e+00, %12 ], [ %532, %509 ]
  %87 = phi float [ 0.000000e+00, %12 ], [ %533, %509 ]
  %88 = phi float [ 0.000000e+00, %12 ], [ %534, %509 ]
  %89 = phi float [ 0.000000e+00, %12 ], [ %535, %509 ]
  %90 = phi float [ 0.000000e+00, %12 ], [ %536, %509 ]
  %91 = mul i32 %29, 27
  %92 = mul i32 %91, %28
  %93 = add i32 %27, %49
  %94 = add i32 %93, %92
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  store float %90, float addrspace(1)* %96, align 4, !tbaa !19
  %97 = add nsw i32 %94, %28
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float %89, float addrspace(1)* %99, align 4, !tbaa !19
  %100 = shl nsw i32 %28, 1
  %101 = add nsw i32 %94, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  store float %88, float addrspace(1)* %103, align 4, !tbaa !19
  %104 = mul nsw i32 %28, 3
  %105 = add nsw i32 %94, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  store float %87, float addrspace(1)* %107, align 4, !tbaa !19
  %108 = shl nsw i32 %28, 2
  %109 = add nsw i32 %94, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %86, float addrspace(1)* %111, align 4, !tbaa !19
  %112 = mul nsw i32 %28, 5
  %113 = add nsw i32 %94, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %85, float addrspace(1)* %115, align 4, !tbaa !19
  %116 = mul nsw i32 %28, 6
  %117 = add nsw i32 %94, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  store float %84, float addrspace(1)* %119, align 4, !tbaa !19
  %120 = mul nsw i32 %28, 7
  %121 = add nsw i32 %94, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  store float %83, float addrspace(1)* %123, align 4, !tbaa !19
  %124 = shl nsw i32 %28, 3
  %125 = add nsw i32 %94, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %82, float addrspace(1)* %127, align 4, !tbaa !19
  %128 = mul nsw i32 %28, 9
  %129 = add nsw i32 %94, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  store float %81, float addrspace(1)* %131, align 4, !tbaa !19
  %132 = mul nsw i32 %28, 10
  %133 = add nsw i32 %94, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  store float %80, float addrspace(1)* %135, align 4, !tbaa !19
  %136 = mul nsw i32 %28, 11
  %137 = add nsw i32 %94, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  store float %79, float addrspace(1)* %139, align 4, !tbaa !19
  %140 = mul nsw i32 %28, 12
  %141 = add nsw i32 %94, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  store float %78, float addrspace(1)* %143, align 4, !tbaa !19
  %144 = mul nsw i32 %28, 13
  %145 = add nsw i32 %94, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  store float %77, float addrspace(1)* %147, align 4, !tbaa !19
  %148 = mul nsw i32 %28, 14
  %149 = add nsw i32 %94, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %76, float addrspace(1)* %151, align 4, !tbaa !19
  %152 = mul nsw i32 %28, 15
  %153 = add nsw i32 %94, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  store float %75, float addrspace(1)* %155, align 4, !tbaa !19
  %156 = shl nsw i32 %28, 4
  %157 = add nsw i32 %94, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  store float %74, float addrspace(1)* %159, align 4, !tbaa !19
  %160 = mul nsw i32 %28, 17
  %161 = add nsw i32 %94, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  store float %73, float addrspace(1)* %163, align 4, !tbaa !19
  %164 = mul nsw i32 %28, 18
  %165 = add nsw i32 %94, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  store float %72, float addrspace(1)* %167, align 4, !tbaa !19
  %168 = mul nsw i32 %28, 19
  %169 = add nsw i32 %94, %168
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  store float %64, float addrspace(1)* %171, align 4, !tbaa !19
  %172 = mul nsw i32 %28, 20
  %173 = add nsw i32 %94, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  store float %65, float addrspace(1)* %175, align 4, !tbaa !19
  %176 = mul nsw i32 %28, 21
  %177 = add nsw i32 %94, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  store float %66, float addrspace(1)* %179, align 4, !tbaa !19
  %180 = mul nsw i32 %28, 22
  %181 = add nsw i32 %94, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %0, i64 %182
  store float %67, float addrspace(1)* %183, align 4, !tbaa !19
  %184 = mul nsw i32 %28, 23
  %185 = add nsw i32 %94, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  store float %68, float addrspace(1)* %187, align 4, !tbaa !19
  %188 = mul nsw i32 %28, 24
  %189 = add nsw i32 %94, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  store float %69, float addrspace(1)* %191, align 4, !tbaa !19
  %192 = mul nsw i32 %28, 25
  %193 = add nsw i32 %94, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %0, i64 %194
  store float %70, float addrspace(1)* %195, align 4, !tbaa !19
  %196 = mul nsw i32 %28, 26
  %197 = add nsw i32 %94, %196
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  store float %71, float addrspace(1)* %199, align 4, !tbaa !19
  ret void

200:                                              ; preds = %55, %509
  %201 = phi float [ 0.000000e+00, %55 ], [ %536, %509 ]
  %202 = phi float [ 0.000000e+00, %55 ], [ %535, %509 ]
  %203 = phi float [ 0.000000e+00, %55 ], [ %534, %509 ]
  %204 = phi float [ 0.000000e+00, %55 ], [ %533, %509 ]
  %205 = phi float [ 0.000000e+00, %55 ], [ %532, %509 ]
  %206 = phi float [ 0.000000e+00, %55 ], [ %531, %509 ]
  %207 = phi float [ 0.000000e+00, %55 ], [ %530, %509 ]
  %208 = phi float [ 0.000000e+00, %55 ], [ %529, %509 ]
  %209 = phi float [ 0.000000e+00, %55 ], [ %528, %509 ]
  %210 = phi float [ 0.000000e+00, %55 ], [ %527, %509 ]
  %211 = phi float [ 0.000000e+00, %55 ], [ %526, %509 ]
  %212 = phi float [ 0.000000e+00, %55 ], [ %525, %509 ]
  %213 = phi float [ 0.000000e+00, %55 ], [ %524, %509 ]
  %214 = phi float [ 0.000000e+00, %55 ], [ %523, %509 ]
  %215 = phi float [ 0.000000e+00, %55 ], [ %522, %509 ]
  %216 = phi float [ 0.000000e+00, %55 ], [ %521, %509 ]
  %217 = phi float [ 0.000000e+00, %55 ], [ %520, %509 ]
  %218 = phi float [ 0.000000e+00, %55 ], [ %519, %509 ]
  %219 = phi float [ 0.000000e+00, %55 ], [ %518, %509 ]
  %220 = phi i32 [ %50, %55 ], [ %537, %509 ]
  %221 = phi float [ 0.000000e+00, %55 ], [ %517, %509 ]
  %222 = phi float [ 0.000000e+00, %55 ], [ %516, %509 ]
  %223 = phi float [ 0.000000e+00, %55 ], [ %515, %509 ]
  %224 = phi float [ 0.000000e+00, %55 ], [ %514, %509 ]
  %225 = phi float [ 0.000000e+00, %55 ], [ %513, %509 ]
  %226 = phi float [ 0.000000e+00, %55 ], [ %512, %509 ]
  %227 = phi float [ 0.000000e+00, %55 ], [ %511, %509 ]
  %228 = phi float [ 0.000000e+00, %55 ], [ %510, %509 ]
  %229 = icmp slt i32 %220, %32
  br i1 %229, label %230, label %509

230:                                              ; preds = %200
  %231 = add nsw i32 %220, %39
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %1, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !19, !amdgpu.noclobber !14
  %235 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %232, i32 0, i32 0, i32 0, i64 0
  %236 = bitcast float addrspace(1)* %235 to <2 x float> addrspace(1)*
  %237 = load <2 x float>, <2 x float> addrspace(1)* %236, align 16
  %238 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %232, i32 0, i32 0, i32 0, i64 2
  %239 = bitcast float addrspace(1)* %238 to <2 x float> addrspace(1)*
  %240 = load <2 x float>, <2 x float> addrspace(1)* %239, align 8
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %232
  %242 = load i32, i32 addrspace(1)* %241, align 4, !tbaa !15, !amdgpu.noclobber !14
  %243 = sub nsw i32 %242, %47
  %244 = sitofp i32 %243 to float
  %245 = fdiv contract float %244, %60
  %246 = tail call float @llvm.floor.f32(float %245)
  %247 = fmul contract float %246, %60
  %248 = fsub contract float %244, %247
  %249 = fsub contract float %248, %43
  %250 = fdiv contract float %249, %41
  %251 = fsub contract float %246, %45
  %252 = fneg contract float %251
  %253 = fdiv contract float %252, %41
  %254 = fdiv contract float %62, %234
  %255 = fmul contract float %254, %250
  %256 = fmul contract float %254, %253
  %257 = extractelement <2 x float> %237, i64 0
  %258 = fmul contract float %257, %250
  %259 = fmul contract float %257, %253
  %260 = extractelement <2 x float> %237, i64 1
  %261 = fmul contract float %260, %260
  %262 = fadd contract float %201, %261
  %263 = extractelement <2 x float> %240, i64 0
  %264 = fmul contract float %260, %263
  %265 = fadd contract float %202, %264
  %266 = extractelement <2 x float> %240, i64 1
  %267 = fmul contract float %260, %266
  %268 = fadd contract float %203, %267
  %269 = fmul contract float %260, %259
  %270 = fmul contract float %266, %269
  %271 = fmul contract float %257, %260
  %272 = fmul contract float %271, %263
  %273 = fsub contract float %270, %272
  %274 = fadd contract float %204, %273
  %275 = fmul contract float %257, %261
  %276 = fmul contract float %260, %258
  %277 = fmul contract float %266, %276
  %278 = fsub contract float %275, %277
  %279 = fadd contract float %205, %278
  %280 = fneg contract float %259
  %281 = fmul contract float %263, %276
  %282 = fmul contract float %261, %259
  %283 = fsub contract float %281, %282
  %284 = fadd contract float %206, %283
  %285 = fmul contract float %263, %263
  %286 = fadd contract float %207, %285
  %287 = fmul contract float %263, %266
  %288 = fadd contract float %208, %287
  %289 = fmul contract float %263, %259
  %290 = fmul contract float %266, %289
  %291 = fmul contract float %257, %285
  %292 = fsub contract float %290, %291
  %293 = fadd contract float %209, %292
  %294 = fneg contract float %258
  %295 = fmul contract float %263, %294
  %296 = fmul contract float %266, %295
  %297 = fadd contract float %272, %296
  %298 = fadd contract float %210, %297
  %299 = fmul contract float %285, %258
  %300 = fmul contract float %263, %269
  %301 = fsub contract float %299, %300
  %302 = fadd contract float %211, %301
  %303 = fmul contract float %266, %266
  %304 = fadd contract float %212, %303
  %305 = fmul contract float %303, %259
  %306 = fmul contract float %257, %263
  %307 = fmul contract float %306, %266
  %308 = fsub contract float %305, %307
  %309 = fadd contract float %213, %308
  %310 = fmul contract float %271, %266
  %311 = fmul contract float %303, %258
  %312 = fsub contract float %310, %311
  %313 = fadd contract float %214, %312
  %314 = fmul contract float %263, %258
  %315 = fmul contract float %266, %314
  %316 = fsub contract float %315, %270
  %317 = fadd contract float %215, %316
  %318 = fmul contract float %259, %259
  %319 = fmul contract float %303, %318
  %320 = fmul contract float %257, %257
  %321 = fmul contract float %320, %285
  %322 = fadd contract float %321, %319
  %323 = fmul contract float %257, %259
  %324 = fmul contract float %263, %323
  %325 = fmul contract float %266, %324
  %326 = fmul contract float %325, 2.000000e+00
  %327 = fsub contract float %322, %326
  %328 = fadd contract float %216, %327
  %329 = fmul contract float %259, %294
  %330 = fmul contract float %303, %329
  %331 = fmul contract float %320, %260
  %332 = fmul contract float %331, %263
  %333 = fsub contract float %330, %332
  %334 = fmul contract float %257, %258
  %335 = fmul contract float %263, %334
  %336 = fmul contract float %266, %335
  %337 = fadd contract float %333, %336
  %338 = fmul contract float %260, %323
  %339 = fmul contract float %266, %338
  %340 = fadd contract float %339, %337
  %341 = fadd contract float %217, %340
  %342 = fmul contract float %257, %294
  %343 = fmul contract float %285, %342
  %344 = fmul contract float %260, %318
  %345 = fmul contract float %266, %344
  %346 = fsub contract float %343, %345
  %347 = fmul contract float %259, %258
  %348 = fmul contract float %263, %347
  %349 = fmul contract float %266, %348
  %350 = fadd contract float %346, %349
  %351 = fmul contract float %263, %338
  %352 = fadd contract float %351, %350
  %353 = fadd contract float %218, %352
  %354 = fmul contract float %258, %258
  %355 = fmul contract float %303, %354
  %356 = fmul contract float %320, %261
  %357 = fadd contract float %356, %355
  %358 = fmul contract float %260, %334
  %359 = fmul contract float %266, %358
  %360 = fmul contract float %359, 2.000000e+00
  %361 = fsub contract float %357, %360
  %362 = fadd contract float %219, %361
  %363 = fmul contract float %257, %280
  %364 = fmul contract float %261, %363
  %365 = fmul contract float %263, %354
  %366 = fmul contract float %266, %365
  %367 = fsub contract float %364, %366
  %368 = fmul contract float %260, %347
  %369 = fmul contract float %266, %368
  %370 = fadd contract float %369, %367
  %371 = fmul contract float %263, %358
  %372 = fadd contract float %371, %370
  %373 = fadd contract float %228, %372
  %374 = fmul contract float %285, %354
  %375 = fmul contract float %261, %318
  %376 = fadd contract float %375, %374
  %377 = fmul contract float %263, %368
  %378 = fmul contract float %377, 2.000000e+00
  %379 = fsub contract float %376, %378
  %380 = fadd contract float %227, %379
  %381 = fmul contract float %261, %255
  %382 = fmul contract float %261, %258
  %383 = fsub contract float %381, %382
  %384 = fmul contract float %260, %256
  %385 = fmul contract float %263, %384
  %386 = fadd contract float %385, %383
  %387 = fsub contract float %386, %300
  %388 = fmul contract float %254, %260
  %389 = fmul contract float %388, %266
  %390 = fadd contract float %389, %387
  %391 = fsub contract float %390, %310
  %392 = fadd contract float %226, %391
  %393 = fmul contract float %285, %256
  %394 = fmul contract float %285, %259
  %395 = fsub contract float %393, %394
  %396 = fmul contract float %260, %255
  %397 = fmul contract float %263, %396
  %398 = fadd contract float %395, %397
  %399 = fsub contract float %398, %281
  %400 = fmul contract float %254, %263
  %401 = fmul contract float %400, %266
  %402 = fadd contract float %401, %399
  %403 = fsub contract float %402, %307
  %404 = fadd contract float %225, %403
  %405 = fmul contract float %254, %303
  %406 = fmul contract float %257, %303
  %407 = fsub contract float %405, %406
  %408 = fmul contract float %266, %396
  %409 = fadd contract float %407, %408
  %410 = fsub contract float %409, %277
  %411 = fmul contract float %263, %256
  %412 = fmul contract float %266, %411
  %413 = fadd contract float %412, %410
  %414 = fsub contract float %413, %290
  %415 = fadd contract float %224, %414
  %416 = fneg contract float %256
  %417 = fmul contract float %257, %416
  %418 = fmul contract float %285, %417
  %419 = fmul contract float %254, %259
  %420 = fmul contract float %303, %419
  %421 = fadd contract float %418, %420
  %422 = fmul contract float %285, %323
  %423 = fadd contract float %422, %421
  %424 = fmul contract float %303, %323
  %425 = fsub contract float %423, %424
  %426 = fmul contract float %263, %318
  %427 = fmul contract float %266, %426
  %428 = fsub contract float %425, %427
  %429 = fmul contract float %320, %263
  %430 = fmul contract float %429, %266
  %431 = fadd contract float %430, %428
  %432 = fmul contract float %259, %255
  %433 = fmul contract float %260, %432
  %434 = fmul contract float %266, %433
  %435 = fadd contract float %434, %431
  %436 = fsub contract float %435, %369
  %437 = fmul contract float %257, %255
  %438 = fmul contract float %260, %437
  %439 = fmul contract float %263, %438
  %440 = fsub contract float %436, %439
  %441 = fmul contract float %256, %259
  %442 = fmul contract float %263, %441
  %443 = fmul contract float %266, %442
  %444 = fadd contract float %443, %440
  %445 = fadd contract float %371, %444
  %446 = fmul contract float %254, %257
  %447 = fmul contract float %446, %263
  %448 = fmul contract float %447, %266
  %449 = fsub contract float %445, %448
  %450 = fadd contract float %223, %449
  %451 = fmul contract float %261, %437
  %452 = fmul contract float %254, %258
  %453 = fmul contract float %303, %452
  %454 = fsub contract float %451, %453
  %455 = fmul contract float %261, %334
  %456 = fsub contract float %454, %455
  %457 = fmul contract float %303, %334
  %458 = fadd contract float %457, %456
  %459 = fmul contract float %260, %354
  %460 = fmul contract float %266, %459
  %461 = fadd contract float %460, %458
  %462 = fmul contract float %331, %266
  %463 = fsub contract float %461, %462
  %464 = fmul contract float %255, %258
  %465 = fmul contract float %260, %464
  %466 = fmul contract float %266, %465
  %467 = fsub contract float %463, %466
  %468 = fmul contract float %256, %258
  %469 = fmul contract float %263, %468
  %470 = fmul contract float %266, %469
  %471 = fsub contract float %467, %470
  %472 = fadd contract float %349, %471
  %473 = fmul contract float %257, %256
  %474 = fmul contract float %260, %473
  %475 = fmul contract float %263, %474
  %476 = fadd contract float %475, %472
  %477 = fsub contract float %476, %351
  %478 = fmul contract float %446, %260
  %479 = fmul contract float %478, %266
  %480 = fadd contract float %479, %477
  %481 = fadd contract float %222, %480
  %482 = fneg contract float %255
  %483 = fmul contract float %259, %482
  %484 = fmul contract float %261, %483
  %485 = fmul contract float %285, %468
  %486 = fadd contract float %484, %485
  %487 = fmul contract float %261, %347
  %488 = fadd contract float %487, %486
  %489 = fmul contract float %285, %347
  %490 = fsub contract float %488, %489
  %491 = fmul contract float %263, %459
  %492 = fsub contract float %490, %491
  %493 = fmul contract float %263, %344
  %494 = fadd contract float %493, %492
  %495 = fmul contract float %263, %465
  %496 = fadd contract float %495, %494
  %497 = fmul contract float %260, %441
  %498 = fmul contract float %263, %497
  %499 = fsub contract float %496, %498
  %500 = fmul contract float %263, %452
  %501 = fmul contract float %266, %500
  %502 = fadd contract float %501, %499
  %503 = fsub contract float %502, %336
  %504 = fmul contract float %260, %419
  %505 = fmul contract float %266, %504
  %506 = fsub contract float %503, %505
  %507 = fadd contract float %339, %506
  %508 = fadd contract float %221, %507
  br label %509

509:                                              ; preds = %200, %230
  %510 = phi float [ %373, %230 ], [ %228, %200 ]
  %511 = phi float [ %380, %230 ], [ %227, %200 ]
  %512 = phi float [ %392, %230 ], [ %226, %200 ]
  %513 = phi float [ %404, %230 ], [ %225, %200 ]
  %514 = phi float [ %415, %230 ], [ %224, %200 ]
  %515 = phi float [ %450, %230 ], [ %223, %200 ]
  %516 = phi float [ %481, %230 ], [ %222, %200 ]
  %517 = phi float [ %508, %230 ], [ %221, %200 ]
  %518 = phi float [ %362, %230 ], [ %219, %200 ]
  %519 = phi float [ %353, %230 ], [ %218, %200 ]
  %520 = phi float [ %341, %230 ], [ %217, %200 ]
  %521 = phi float [ %328, %230 ], [ %216, %200 ]
  %522 = phi float [ %317, %230 ], [ %215, %200 ]
  %523 = phi float [ %313, %230 ], [ %214, %200 ]
  %524 = phi float [ %309, %230 ], [ %213, %200 ]
  %525 = phi float [ %304, %230 ], [ %212, %200 ]
  %526 = phi float [ %302, %230 ], [ %211, %200 ]
  %527 = phi float [ %298, %230 ], [ %210, %200 ]
  %528 = phi float [ %293, %230 ], [ %209, %200 ]
  %529 = phi float [ %288, %230 ], [ %208, %200 ]
  %530 = phi float [ %286, %230 ], [ %207, %200 ]
  %531 = phi float [ %284, %230 ], [ %206, %200 ]
  %532 = phi float [ %279, %230 ], [ %205, %200 ]
  %533 = phi float [ %274, %230 ], [ %204, %200 ]
  %534 = phi float [ %268, %230 ], [ %203, %200 ]
  %535 = phi float [ %265, %230 ], [ %202, %200 ]
  %536 = phi float [ %262, %230 ], [ %201, %200 ]
  %537 = add i32 %220, %20
  %538 = icmp ult i32 %537, %53
  br i1 %538, label %200, label %63, !llvm.loop !22
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
