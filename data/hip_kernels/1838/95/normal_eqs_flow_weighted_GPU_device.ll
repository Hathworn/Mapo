; ModuleID = '../data/hip_kernels/1838/95/main.cu'
source_filename = "../data/hip_kernels/1838/95/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28normal_eqs_flow_weighted_GPUPfPK15HIP_vector_typeIfLj2EEPKfPKiffffiiS7_S7_S5_ffS5_(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float %4, float %5, float %6, float %7, i32 %8, i32 %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float %13, float %14, float addrspace(1)* nocapture readonly %15) local_unnamed_addr #0 {
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !4
  %21 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %31 = mul i32 %30, %24
  %32 = mul i32 %29, %24
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !15, !amdgpu.noclobber !14
  %37 = sitofp i32 %36 to float
  %38 = sitofp i32 %32 to float
  %39 = fdiv contract float %37, %38
  %40 = tail call float @llvm.ceil.f32(float %39)
  %41 = fptosi float %40 to i32
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %34
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !15, !amdgpu.noclobber !14
  %44 = mul i32 %31, %41
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %46 = add i32 %44, %45
  %47 = add i32 %30, 1
  %48 = mul i32 %47, %24
  %49 = mul i32 %48, %41
  %50 = icmp ult i32 %46, %49
  br i1 %50, label %51, label %75

51:                                               ; preds = %16
  %52 = mul nsw i32 %9, %8
  %53 = sitofp i32 %9 to float
  %54 = mul i32 %33, 6
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %15, i64 %55
  %57 = or i32 %54, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %15, i64 %58
  %60 = add nsw i32 %54, 2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %15, i64 %61
  %63 = add nsw i32 %54, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %15, i64 %64
  %66 = add nsw i32 %54, 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %15, i64 %67
  %69 = add nsw i32 %54, 5
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %15, i64 %70
  %72 = getelementptr inbounds float, float addrspace(1)* %12, i64 %34
  %73 = fmul contract float %4, %4
  %74 = fmul contract float %5, %5
  br label %192

75:                                               ; preds = %475, %16
  %76 = phi float [ 0.000000e+00, %16 ], [ %476, %475 ]
  %77 = phi float [ 0.000000e+00, %16 ], [ %477, %475 ]
  %78 = phi float [ 0.000000e+00, %16 ], [ %478, %475 ]
  %79 = phi float [ 0.000000e+00, %16 ], [ %479, %475 ]
  %80 = phi float [ 0.000000e+00, %16 ], [ %480, %475 ]
  %81 = phi float [ 0.000000e+00, %16 ], [ %481, %475 ]
  %82 = phi float [ 0.000000e+00, %16 ], [ %482, %475 ]
  %83 = phi float [ 0.000000e+00, %16 ], [ %483, %475 ]
  %84 = phi float [ 0.000000e+00, %16 ], [ %484, %475 ]
  %85 = phi float [ 0.000000e+00, %16 ], [ %485, %475 ]
  %86 = phi float [ 0.000000e+00, %16 ], [ %486, %475 ]
  %87 = phi float [ 0.000000e+00, %16 ], [ %487, %475 ]
  %88 = phi float [ 0.000000e+00, %16 ], [ %488, %475 ]
  %89 = phi float [ 0.000000e+00, %16 ], [ %489, %475 ]
  %90 = phi float [ 0.000000e+00, %16 ], [ %490, %475 ]
  %91 = phi float [ 0.000000e+00, %16 ], [ %491, %475 ]
  %92 = phi float [ 0.000000e+00, %16 ], [ %492, %475 ]
  %93 = phi float [ 0.000000e+00, %16 ], [ %493, %475 ]
  %94 = phi float [ 0.000000e+00, %16 ], [ %494, %475 ]
  %95 = phi float [ 0.000000e+00, %16 ], [ %495, %475 ]
  %96 = phi float [ 0.000000e+00, %16 ], [ %496, %475 ]
  %97 = phi float [ 0.000000e+00, %16 ], [ %497, %475 ]
  %98 = phi float [ 0.000000e+00, %16 ], [ %498, %475 ]
  %99 = mul i32 %33, 23
  %100 = mul i32 %99, %32
  %101 = add i32 %31, %45
  %102 = add i32 %101, %100
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  store float %98, float addrspace(1)* %104, align 4, !tbaa !20
  %105 = add nsw i32 %102, %32
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  store float %97, float addrspace(1)* %107, align 4, !tbaa !20
  %108 = shl nsw i32 %32, 1
  %109 = add nsw i32 %102, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %96, float addrspace(1)* %111, align 4, !tbaa !20
  %112 = mul nsw i32 %32, 3
  %113 = add nsw i32 %102, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %95, float addrspace(1)* %115, align 4, !tbaa !20
  %116 = shl nsw i32 %32, 2
  %117 = add nsw i32 %102, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  store float %94, float addrspace(1)* %119, align 4, !tbaa !20
  %120 = mul nsw i32 %32, 5
  %121 = add nsw i32 %102, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  store float %93, float addrspace(1)* %123, align 4, !tbaa !20
  %124 = mul nsw i32 %32, 6
  %125 = add nsw i32 %102, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %92, float addrspace(1)* %127, align 4, !tbaa !20
  %128 = mul nsw i32 %32, 7
  %129 = add nsw i32 %102, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  store float %91, float addrspace(1)* %131, align 4, !tbaa !20
  %132 = shl nsw i32 %32, 3
  %133 = add nsw i32 %102, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  store float %76, float addrspace(1)* %135, align 4, !tbaa !20
  %136 = mul nsw i32 %32, 9
  %137 = add nsw i32 %102, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  store float %77, float addrspace(1)* %139, align 4, !tbaa !20
  %140 = mul nsw i32 %32, 10
  %141 = add nsw i32 %102, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  store float %78, float addrspace(1)* %143, align 4, !tbaa !20
  %144 = mul nsw i32 %32, 11
  %145 = add nsw i32 %102, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  store float %79, float addrspace(1)* %147, align 4, !tbaa !20
  %148 = mul nsw i32 %32, 12
  %149 = add nsw i32 %102, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %80, float addrspace(1)* %151, align 4, !tbaa !20
  %152 = mul nsw i32 %32, 13
  %153 = add nsw i32 %102, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  store float %81, float addrspace(1)* %155, align 4, !tbaa !20
  %156 = mul nsw i32 %32, 14
  %157 = add nsw i32 %102, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  store float %82, float addrspace(1)* %159, align 4, !tbaa !20
  %160 = mul nsw i32 %32, 15
  %161 = add nsw i32 %102, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  store float %83, float addrspace(1)* %163, align 4, !tbaa !20
  %164 = shl nsw i32 %32, 4
  %165 = add nsw i32 %102, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  store float %84, float addrspace(1)* %167, align 4, !tbaa !20
  %168 = mul nsw i32 %32, 17
  %169 = add nsw i32 %102, %168
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  store float %85, float addrspace(1)* %171, align 4, !tbaa !20
  %172 = mul nsw i32 %32, 18
  %173 = add nsw i32 %102, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  store float %86, float addrspace(1)* %175, align 4, !tbaa !20
  %176 = mul nsw i32 %32, 19
  %177 = add nsw i32 %102, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  store float %87, float addrspace(1)* %179, align 4, !tbaa !20
  %180 = mul nsw i32 %32, 20
  %181 = add nsw i32 %102, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %0, i64 %182
  store float %88, float addrspace(1)* %183, align 4, !tbaa !20
  %184 = mul nsw i32 %32, 21
  %185 = add nsw i32 %102, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  store float %89, float addrspace(1)* %187, align 4, !tbaa !20
  %188 = mul nsw i32 %32, 22
  %189 = add nsw i32 %102, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  store float %90, float addrspace(1)* %191, align 4, !tbaa !20
  ret void

192:                                              ; preds = %51, %475
  %193 = phi float [ 0.000000e+00, %51 ], [ %498, %475 ]
  %194 = phi float [ 0.000000e+00, %51 ], [ %497, %475 ]
  %195 = phi float [ 0.000000e+00, %51 ], [ %496, %475 ]
  %196 = phi float [ 0.000000e+00, %51 ], [ %495, %475 ]
  %197 = phi float [ 0.000000e+00, %51 ], [ %494, %475 ]
  %198 = phi float [ 0.000000e+00, %51 ], [ %493, %475 ]
  %199 = phi float [ 0.000000e+00, %51 ], [ %492, %475 ]
  %200 = phi float [ 0.000000e+00, %51 ], [ %491, %475 ]
  %201 = phi i32 [ %46, %51 ], [ %499, %475 ]
  %202 = phi float [ 0.000000e+00, %51 ], [ %490, %475 ]
  %203 = phi float [ 0.000000e+00, %51 ], [ %489, %475 ]
  %204 = phi float [ 0.000000e+00, %51 ], [ %488, %475 ]
  %205 = phi float [ 0.000000e+00, %51 ], [ %487, %475 ]
  %206 = phi float [ 0.000000e+00, %51 ], [ %486, %475 ]
  %207 = phi float [ 0.000000e+00, %51 ], [ %485, %475 ]
  %208 = phi float [ 0.000000e+00, %51 ], [ %484, %475 ]
  %209 = phi float [ 0.000000e+00, %51 ], [ %483, %475 ]
  %210 = phi float [ 0.000000e+00, %51 ], [ %482, %475 ]
  %211 = phi float [ 0.000000e+00, %51 ], [ %481, %475 ]
  %212 = phi float [ 0.000000e+00, %51 ], [ %480, %475 ]
  %213 = phi float [ 0.000000e+00, %51 ], [ %479, %475 ]
  %214 = phi float [ 0.000000e+00, %51 ], [ %478, %475 ]
  %215 = phi float [ 0.000000e+00, %51 ], [ %477, %475 ]
  %216 = phi float [ 0.000000e+00, %51 ], [ %476, %475 ]
  %217 = icmp slt i32 %201, %36
  br i1 %217, label %218, label %475

218:                                              ; preds = %192
  %219 = add nsw i32 %201, %43
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %220, i32 0, i32 0, i32 0, i64 0
  %222 = load float, float addrspace(1)* %221, align 8, !amdgpu.noclobber !14
  %223 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %220, i32 0, i32 0, i32 0, i64 1
  %224 = load float, float addrspace(1)* %223, align 4, !amdgpu.noclobber !14
  %225 = getelementptr inbounds float, float addrspace(1)* %2, i64 %220
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !20, !amdgpu.noclobber !14
  %227 = fdiv contract float 1.000000e+00, %226
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %220
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !15, !amdgpu.noclobber !14
  %230 = icmp slt i32 %229, %52
  %231 = select i1 %230, i32 0, i32 %8
  %232 = mul nsw i32 %231, %9
  %233 = sub nsw i32 %229, %232
  %234 = sitofp i32 %233 to float
  %235 = fdiv contract float %234, %53
  %236 = tail call float @llvm.floor.f32(float %235)
  %237 = fmul contract float %236, %53
  %238 = fsub contract float %234, %237
  %239 = fsub contract float %238, %6
  %240 = fsub contract float %236, %7
  %241 = select contract i1 %230, float %13, float %14
  %242 = load float, float addrspace(1)* %56, align 4, !tbaa !20, !amdgpu.noclobber !14
  %243 = load float, float addrspace(1)* %59, align 4, !tbaa !20, !amdgpu.noclobber !14
  %244 = load float, float addrspace(1)* %62, align 4, !tbaa !20, !amdgpu.noclobber !14
  %245 = load float, float addrspace(1)* %65, align 4, !tbaa !20, !amdgpu.noclobber !14
  %246 = load float, float addrspace(1)* %68, align 4, !tbaa !20, !amdgpu.noclobber !14
  %247 = load float, float addrspace(1)* %71, align 4, !tbaa !20, !amdgpu.noclobber !14
  %248 = fmul contract float %246, %4
  %249 = fsub contract float %248, %222
  %250 = fmul contract float %247, %240
  %251 = fsub contract float %249, %250
  %252 = fmul contract float %239, %239
  %253 = fmul contract float %246, %252
  %254 = fdiv contract float %253, %4
  %255 = fadd contract float %251, %254
  %256 = fmul contract float %227, %4
  %257 = fmul contract float %256, %242
  %258 = fadd contract float %257, %255
  %259 = fmul contract float %227, %239
  %260 = fmul contract float %244, %259
  %261 = fsub contract float %258, %260
  %262 = fmul contract float %240, %239
  %263 = fmul contract float %245, %262
  %264 = fdiv contract float %263, %4
  %265 = fsub contract float %261, %264
  %266 = fneg contract float %224
  %267 = fmul contract float %245, %5
  %268 = fsub contract float %266, %267
  %269 = fmul contract float %247, %239
  %270 = fadd contract float %268, %269
  %271 = fmul contract float %227, %240
  %272 = fmul contract float %244, %271
  %273 = fsub contract float %270, %272
  %274 = fmul contract float %240, %240
  %275 = fmul contract float %245, %274
  %276 = fdiv contract float %275, %5
  %277 = fsub contract float %273, %276
  %278 = fmul contract float %227, %5
  %279 = fmul contract float %278, %243
  %280 = fadd contract float %279, %277
  %281 = fmul contract float %246, %262
  %282 = fdiv contract float %281, %5
  %283 = fadd contract float %282, %280
  %284 = fmul contract float %265, %265
  %285 = fmul contract float %283, %283
  %286 = fadd contract float %285, %284
  %287 = fcmp olt float %286, 0x39F0000000000000
  %288 = select i1 %287, float 0x41F0000000000000, float 1.000000e+00
  %289 = fmul float %286, %288
  %290 = tail call float @llvm.sqrt.f32(float %289)
  %291 = bitcast float %290 to i32
  %292 = add nsw i32 %291, -1
  %293 = bitcast i32 %292 to float
  %294 = add nsw i32 %291, 1
  %295 = bitcast i32 %294 to float
  %296 = tail call i1 @llvm.amdgcn.class.f32(float %289, i32 608)
  %297 = select i1 %287, float 0x3EF0000000000000, float 1.000000e+00
  %298 = fneg float %295
  %299 = tail call float @llvm.fma.f32(float %298, float %290, float %289)
  %300 = fcmp ogt float %299, 0.000000e+00
  %301 = fneg float %293
  %302 = tail call float @llvm.fma.f32(float %301, float %290, float %289)
  %303 = fcmp ole float %302, 0.000000e+00
  %304 = select i1 %303, float %293, float %290
  %305 = select i1 %300, float %295, float %304
  %306 = fmul float %297, %305
  %307 = select i1 %296, float %289, float %306
  %308 = fmul contract float %241, %307
  %309 = load float, float addrspace(1)* %72, align 4, !tbaa !20, !amdgpu.noclobber !14
  %310 = fdiv contract float %308, %309
  %311 = fcmp contract ogt float %310, 1.000000e+00
  %312 = fmul contract float %310, 2.000000e+00
  %313 = fmul contract float %310, %312
  %314 = fsub contract float 1.000000e+00, %313
  %315 = fmul contract float %310, %310
  %316 = fmul contract float %310, %315
  %317 = fmul contract float %310, %316
  %318 = fadd contract float %314, %317
  %319 = select i1 %311, float 0.000000e+00, float %318
  %320 = fmul contract float %227, %227
  %321 = fmul contract float %320, %4
  %322 = fmul contract float %321, %4
  %323 = fmul contract float %322, %319
  %324 = fadd contract float %193, %323
  %325 = fneg contract float %227
  %326 = fmul contract float %227, %325
  %327 = fmul contract float %326, %239
  %328 = fmul contract float %327, %4
  %329 = fmul contract float %328, %319
  %330 = fadd contract float %194, %329
  %331 = fmul contract float %239, %325
  %332 = fmul contract float %240, %331
  %333 = fmul contract float %332, %319
  %334 = fadd contract float %195, %333
  %335 = fmul contract float %256, %4
  %336 = fmul contract float %239, %259
  %337 = fadd contract float %335, %336
  %338 = fmul contract float %337, %319
  %339 = fadd contract float %196, %338
  %340 = fmul contract float %240, %325
  %341 = fmul contract float %340, %4
  %342 = fmul contract float %341, %319
  %343 = fadd contract float %197, %342
  %344 = fmul contract float %326, %240
  %345 = fmul contract float %344, %5
  %346 = fmul contract float %345, %319
  %347 = fadd contract float %198, %346
  %348 = fmul contract float %325, %5
  %349 = fmul contract float %348, %5
  %350 = fmul contract float %240, %271
  %351 = fsub contract float %349, %350
  %352 = fmul contract float %351, %319
  %353 = fadd contract float %199, %352
  %354 = fmul contract float %259, %5
  %355 = fmul contract float %354, %319
  %356 = fadd contract float %200, %355
  %357 = fmul contract float %320, %239
  %358 = fmul contract float %239, %357
  %359 = fmul contract float %320, %240
  %360 = fmul contract float %240, %359
  %361 = fadd contract float %360, %358
  %362 = fmul contract float %361, %319
  %363 = fadd contract float %216, %362
  %364 = fmul contract float %240, %336
  %365 = fdiv contract float %364, %4
  %366 = fmul contract float %271, %5
  %367 = fadd contract float %366, %365
  %368 = fmul contract float %240, %350
  %369 = fdiv contract float %368, %5
  %370 = fadd contract float %369, %367
  %371 = fmul contract float %370, %319
  %372 = fadd contract float %215, %371
  %373 = fmul contract float %331, %4
  %374 = fmul contract float %239, %336
  %375 = fdiv contract float %374, %4
  %376 = fsub contract float %373, %375
  %377 = fmul contract float %240, %259
  %378 = fmul contract float %240, %377
  %379 = fdiv contract float %378, %5
  %380 = fsub contract float %376, %379
  %381 = fmul contract float %380, %319
  %382 = fadd contract float %214, %381
  %383 = fmul contract float %240, %252
  %384 = fmul contract float %240, %383
  %385 = fdiv contract float %384, %73
  %386 = fadd contract float %74, %385
  %387 = fmul contract float %240, 2.000000e+00
  %388 = fmul contract float %240, %387
  %389 = fadd contract float %388, %386
  %390 = fmul contract float %240, %274
  %391 = fmul contract float %240, %390
  %392 = fdiv contract float %391, %74
  %393 = fadd contract float %392, %389
  %394 = fmul contract float %393, %319
  %395 = fadd contract float %213, %394
  %396 = fmul contract float %239, -2.000000e+00
  %397 = fmul contract float %240, %396
  %398 = fmul contract float %239, %252
  %399 = fmul contract float %240, %398
  %400 = fdiv contract float %399, %73
  %401 = fsub contract float %397, %400
  %402 = fmul contract float %240, %262
  %403 = fmul contract float %240, %402
  %404 = fdiv contract float %403, %74
  %405 = fsub contract float %401, %404
  %406 = fmul contract float %405, %319
  %407 = fadd contract float %212, %406
  %408 = fdiv contract float %402, %4
  %409 = fmul contract float %239, %5
  %410 = fsub contract float %408, %409
  %411 = fdiv contract float %402, %5
  %412 = fsub contract float %410, %411
  %413 = fmul contract float %412, %319
  %414 = fadd contract float %211, %413
  %415 = fmul contract float %239, 2.000000e+00
  %416 = fmul contract float %239, %415
  %417 = fadd contract float %73, %416
  %418 = fmul contract float %239, %398
  %419 = fdiv contract float %418, %73
  %420 = fadd contract float %417, %419
  %421 = fdiv contract float %384, %74
  %422 = fadd contract float %421, %420
  %423 = fmul contract float %422, %319
  %424 = fadd contract float %210, %423
  %425 = fneg contract float %240
  %426 = fmul contract float %425, %4
  %427 = fdiv contract float %383, %4
  %428 = fsub contract float %426, %427
  %429 = fdiv contract float %383, %5
  %430 = fadd contract float %429, %428
  %431 = fmul contract float %430, %319
  %432 = fadd contract float %209, %431
  %433 = fadd contract float %274, %252
  %434 = fmul contract float %433, %319
  %435 = fadd contract float %208, %434
  %436 = fmul contract float %222, %227
  %437 = fmul contract float %436, %4
  %438 = fmul contract float %437, %319
  %439 = fadd contract float %207, %438
  %440 = fmul contract float %224, %227
  %441 = fmul contract float %440, %5
  %442 = fmul contract float %441, %319
  %443 = fadd contract float %206, %442
  %444 = fmul contract float %222, %331
  %445 = fmul contract float %224, %271
  %446 = fsub contract float %444, %445
  %447 = fmul contract float %446, %319
  %448 = fadd contract float %205, %447
  %449 = fneg contract float %239
  %450 = fmul contract float %240, %449
  %451 = fmul contract float %222, %450
  %452 = fdiv contract float %451, %4
  %453 = fmul contract float %224, %5
  %454 = fsub contract float %452, %453
  %455 = fmul contract float %224, %240
  %456 = fmul contract float %240, %455
  %457 = fdiv contract float %456, %5
  %458 = fsub contract float %454, %457
  %459 = fmul contract float %458, %319
  %460 = fadd contract float %204, %459
  %461 = fmul contract float %222, %4
  %462 = fmul contract float %222, %252
  %463 = fdiv contract float %462, %4
  %464 = fadd contract float %461, %463
  %465 = fmul contract float %224, %262
  %466 = fdiv contract float %465, %5
  %467 = fadd contract float %466, %464
  %468 = fmul contract float %467, %319
  %469 = fadd contract float %203, %468
  %470 = fmul contract float %224, %239
  %471 = fmul contract float %222, %240
  %472 = fsub contract float %470, %471
  %473 = fmul contract float %472, %319
  %474 = fadd contract float %202, %473
  br label %475

475:                                              ; preds = %192, %218
  %476 = phi float [ %363, %218 ], [ %216, %192 ]
  %477 = phi float [ %372, %218 ], [ %215, %192 ]
  %478 = phi float [ %382, %218 ], [ %214, %192 ]
  %479 = phi float [ %395, %218 ], [ %213, %192 ]
  %480 = phi float [ %407, %218 ], [ %212, %192 ]
  %481 = phi float [ %414, %218 ], [ %211, %192 ]
  %482 = phi float [ %424, %218 ], [ %210, %192 ]
  %483 = phi float [ %432, %218 ], [ %209, %192 ]
  %484 = phi float [ %435, %218 ], [ %208, %192 ]
  %485 = phi float [ %439, %218 ], [ %207, %192 ]
  %486 = phi float [ %443, %218 ], [ %206, %192 ]
  %487 = phi float [ %448, %218 ], [ %205, %192 ]
  %488 = phi float [ %460, %218 ], [ %204, %192 ]
  %489 = phi float [ %469, %218 ], [ %203, %192 ]
  %490 = phi float [ %474, %218 ], [ %202, %192 ]
  %491 = phi float [ %356, %218 ], [ %200, %192 ]
  %492 = phi float [ %353, %218 ], [ %199, %192 ]
  %493 = phi float [ %347, %218 ], [ %198, %192 ]
  %494 = phi float [ %343, %218 ], [ %197, %192 ]
  %495 = phi float [ %339, %218 ], [ %196, %192 ]
  %496 = phi float [ %334, %218 ], [ %195, %192 ]
  %497 = phi float [ %330, %218 ], [ %194, %192 ]
  %498 = phi float [ %324, %218 ], [ %193, %192 ]
  %499 = add i32 %201, %24
  %500 = icmp ult i32 %499, %49
  br i1 %500, label %192, label %75, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !17, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
