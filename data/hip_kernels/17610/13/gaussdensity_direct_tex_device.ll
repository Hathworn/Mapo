; ModuleID = '../data/hip_kernels/17610/13/main.cu'
source_filename = "../data/hip_kernels/17610/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

$_ZL23gaussdensity_direct_texiPK15HIP_vector_typeIfLj4EES2_fjPfPS_IfLj3EEf = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL23gaussdensity_direct_texiPK15HIP_vector_typeIfLj4EES2_fjPfPS_IfLj3EEf(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, float %3, i32 %4, float addrspace(1)* nocapture %5, %struct.HIP_vector_type.0 addrspace(1)* nocapture %6, float %7) local_unnamed_addr #0 comdat {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = shl i32 %9, 3
  %19 = mul i32 %18, %14
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 16
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 8, !tbaa !16
  %30 = mul i32 %22, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = add i32 %30, %31
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %34 = getelementptr i8, i8 addrspace(4)* %10, i64 8
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 4, !range !4, !invariant.load !5
  %37 = zext i16 %36 to i32
  %38 = mul i32 %33, %37
  %39 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %40 = add i32 %38, %39
  %41 = udiv i32 %17, %14
  %42 = mul i32 %41, %14
  %43 = icmp ugt i32 %17, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = shl nuw nsw i32 %14, 3
  %47 = mul i32 %46, %45
  %48 = udiv i32 %29, %26
  %49 = mul i32 %48, %26
  %50 = icmp ugt i32 %29, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = mul i32 %40, %26
  %54 = mul i32 %53, %52
  %55 = add i32 %54, %32
  %56 = mul i32 %47, %55
  %57 = add i32 %56, %21
  %58 = add i32 %40, %4
  %59 = uitofp i32 %21 to float
  %60 = fmul contract float %59, %3
  %61 = uitofp i32 %32 to float
  %62 = fmul contract float %61, %3
  %63 = uitofp i32 %58 to float
  %64 = fmul contract float %63, %3
  %65 = fmul contract float %3, 8.000000e+00
  %66 = icmp sgt i32 %0, 0
  br i1 %66, label %67, label %275

67:                                               ; preds = %8, %67
  %68 = phi float [ %132, %67 ], [ 0.000000e+00, %8 ]
  %69 = phi float [ %151, %67 ], [ 0.000000e+00, %8 ]
  %70 = phi float [ %139, %67 ], [ 0.000000e+00, %8 ]
  %71 = phi float [ %137, %67 ], [ 0.000000e+00, %8 ]
  %72 = phi float [ %135, %67 ], [ 0.000000e+00, %8 ]
  %73 = phi float [ %158, %67 ], [ 0.000000e+00, %8 ]
  %74 = phi float [ %156, %67 ], [ 0.000000e+00, %8 ]
  %75 = phi float [ %154, %67 ], [ 0.000000e+00, %8 ]
  %76 = phi float [ %170, %67 ], [ 0.000000e+00, %8 ]
  %77 = phi float [ %189, %67 ], [ 0.000000e+00, %8 ]
  %78 = phi float [ %177, %67 ], [ 0.000000e+00, %8 ]
  %79 = phi float [ %175, %67 ], [ 0.000000e+00, %8 ]
  %80 = phi float [ %173, %67 ], [ 0.000000e+00, %8 ]
  %81 = phi float [ %196, %67 ], [ 0.000000e+00, %8 ]
  %82 = phi float [ %194, %67 ], [ 0.000000e+00, %8 ]
  %83 = phi float [ %192, %67 ], [ 0.000000e+00, %8 ]
  %84 = phi float [ %208, %67 ], [ 0.000000e+00, %8 ]
  %85 = phi float [ %227, %67 ], [ 0.000000e+00, %8 ]
  %86 = phi float [ %246, %67 ], [ 0.000000e+00, %8 ]
  %87 = phi float [ %265, %67 ], [ 0.000000e+00, %8 ]
  %88 = phi float [ %215, %67 ], [ 0.000000e+00, %8 ]
  %89 = phi float [ %213, %67 ], [ 0.000000e+00, %8 ]
  %90 = phi float [ %211, %67 ], [ 0.000000e+00, %8 ]
  %91 = phi float [ %234, %67 ], [ 0.000000e+00, %8 ]
  %92 = phi float [ %232, %67 ], [ 0.000000e+00, %8 ]
  %93 = phi float [ %230, %67 ], [ 0.000000e+00, %8 ]
  %94 = phi float [ %253, %67 ], [ 0.000000e+00, %8 ]
  %95 = phi float [ %251, %67 ], [ 0.000000e+00, %8 ]
  %96 = phi float [ %249, %67 ], [ 0.000000e+00, %8 ]
  %97 = phi float [ %272, %67 ], [ 0.000000e+00, %8 ]
  %98 = phi float [ %270, %67 ], [ 0.000000e+00, %8 ]
  %99 = phi float [ %268, %67 ], [ 0.000000e+00, %8 ]
  %100 = phi i32 [ %273, %67 ], [ 0, %8 ]
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %101, i32 0, i32 0, i32 0, i64 0
  %103 = load float, float addrspace(1)* %102, align 16, !amdgpu.noclobber !5
  %104 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %101, i32 0, i32 0, i32 0, i64 1
  %105 = load float, float addrspace(1)* %104, align 4, !amdgpu.noclobber !5
  %106 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %101, i32 0, i32 0, i32 0, i64 2
  %107 = load float, float addrspace(1)* %106, align 8, !amdgpu.noclobber !5
  %108 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %101, i32 0, i32 0, i32 0, i64 3
  %109 = load float, float addrspace(1)* %108, align 4, !amdgpu.noclobber !5
  %110 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %101, i32 0, i32 0, i32 0, i64 0
  %111 = load float, float addrspace(1)* %110, align 16, !amdgpu.noclobber !5
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %101, i32 0, i32 0, i32 0, i64 1
  %113 = load float, float addrspace(1)* %112, align 4, !amdgpu.noclobber !5
  %114 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %101, i32 0, i32 0, i32 0, i64 2
  %115 = load float, float addrspace(1)* %114, align 8, !amdgpu.noclobber !5
  %116 = fsub contract float %62, %105
  %117 = fsub contract float %64, %107
  %118 = fmul contract float %116, %116
  %119 = fmul contract float %117, %117
  %120 = fadd contract float %118, %119
  %121 = fsub contract float %60, %103
  %122 = fmul contract float %121, %121
  %123 = fadd contract float %122, %120
  %124 = fneg contract float %123
  %125 = fmul contract float %109, %124
  %126 = fcmp olt float %125, -1.260000e+02
  %127 = select i1 %126, float 0x3BF0000000000000, float 1.000000e+00
  %128 = select i1 %126, float 6.400000e+01, float 0.000000e+00
  %129 = fadd float %125, %128
  %130 = tail call float @llvm.exp2.f32(float %129)
  %131 = fmul float %127, %130
  %132 = fadd contract float %68, %131
  %133 = fmul contract float %131, %7
  %134 = fmul contract float %111, %133
  %135 = fadd contract float %72, %134
  %136 = fmul contract float %113, %133
  %137 = fadd contract float %71, %136
  %138 = fmul contract float %115, %133
  %139 = fadd contract float %70, %138
  %140 = fadd contract float %65, %121
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %141, %120
  %143 = fneg contract float %142
  %144 = fmul contract float %109, %143
  %145 = fcmp olt float %144, -1.260000e+02
  %146 = select i1 %145, float 0x3BF0000000000000, float 1.000000e+00
  %147 = select i1 %145, float 6.400000e+01, float 0.000000e+00
  %148 = fadd float %144, %147
  %149 = tail call float @llvm.exp2.f32(float %148)
  %150 = fmul float %146, %149
  %151 = fadd contract float %69, %150
  %152 = fmul contract float %150, %7
  %153 = fmul contract float %111, %152
  %154 = fadd contract float %75, %153
  %155 = fmul contract float %113, %152
  %156 = fadd contract float %74, %155
  %157 = fmul contract float %115, %152
  %158 = fadd contract float %73, %157
  %159 = fadd contract float %65, %140
  %160 = fmul contract float %159, %159
  %161 = fadd contract float %160, %120
  %162 = fneg contract float %161
  %163 = fmul contract float %109, %162
  %164 = fcmp olt float %163, -1.260000e+02
  %165 = select i1 %164, float 0x3BF0000000000000, float 1.000000e+00
  %166 = select i1 %164, float 6.400000e+01, float 0.000000e+00
  %167 = fadd float %163, %166
  %168 = tail call float @llvm.exp2.f32(float %167)
  %169 = fmul float %165, %168
  %170 = fadd contract float %76, %169
  %171 = fmul contract float %169, %7
  %172 = fmul contract float %111, %171
  %173 = fadd contract float %80, %172
  %174 = fmul contract float %113, %171
  %175 = fadd contract float %79, %174
  %176 = fmul contract float %115, %171
  %177 = fadd contract float %78, %176
  %178 = fadd contract float %65, %159
  %179 = fmul contract float %178, %178
  %180 = fadd contract float %179, %120
  %181 = fneg contract float %180
  %182 = fmul contract float %109, %181
  %183 = fcmp olt float %182, -1.260000e+02
  %184 = select i1 %183, float 0x3BF0000000000000, float 1.000000e+00
  %185 = select i1 %183, float 6.400000e+01, float 0.000000e+00
  %186 = fadd float %182, %185
  %187 = tail call float @llvm.exp2.f32(float %186)
  %188 = fmul float %184, %187
  %189 = fadd contract float %77, %188
  %190 = fmul contract float %188, %7
  %191 = fmul contract float %111, %190
  %192 = fadd contract float %83, %191
  %193 = fmul contract float %113, %190
  %194 = fadd contract float %82, %193
  %195 = fmul contract float %115, %190
  %196 = fadd contract float %81, %195
  %197 = fadd contract float %65, %178
  %198 = fmul contract float %197, %197
  %199 = fadd contract float %120, %198
  %200 = fneg contract float %199
  %201 = fmul contract float %109, %200
  %202 = fcmp olt float %201, -1.260000e+02
  %203 = select i1 %202, float 0x3BF0000000000000, float 1.000000e+00
  %204 = select i1 %202, float 6.400000e+01, float 0.000000e+00
  %205 = fadd float %201, %204
  %206 = tail call float @llvm.exp2.f32(float %205)
  %207 = fmul float %203, %206
  %208 = fadd contract float %84, %207
  %209 = fmul contract float %207, %7
  %210 = fmul contract float %111, %209
  %211 = fadd contract float %90, %210
  %212 = fmul contract float %113, %209
  %213 = fadd contract float %89, %212
  %214 = fmul contract float %115, %209
  %215 = fadd contract float %88, %214
  %216 = fadd contract float %65, %197
  %217 = fmul contract float %216, %216
  %218 = fadd contract float %120, %217
  %219 = fneg contract float %218
  %220 = fmul contract float %109, %219
  %221 = fcmp olt float %220, -1.260000e+02
  %222 = select i1 %221, float 0x3BF0000000000000, float 1.000000e+00
  %223 = select i1 %221, float 6.400000e+01, float 0.000000e+00
  %224 = fadd float %220, %223
  %225 = tail call float @llvm.exp2.f32(float %224)
  %226 = fmul float %222, %225
  %227 = fadd contract float %85, %226
  %228 = fmul contract float %226, %7
  %229 = fmul contract float %111, %228
  %230 = fadd contract float %93, %229
  %231 = fmul contract float %113, %228
  %232 = fadd contract float %92, %231
  %233 = fmul contract float %115, %228
  %234 = fadd contract float %91, %233
  %235 = fadd contract float %65, %216
  %236 = fmul contract float %235, %235
  %237 = fadd contract float %120, %236
  %238 = fneg contract float %237
  %239 = fmul contract float %109, %238
  %240 = fcmp olt float %239, -1.260000e+02
  %241 = select i1 %240, float 0x3BF0000000000000, float 1.000000e+00
  %242 = select i1 %240, float 6.400000e+01, float 0.000000e+00
  %243 = fadd float %239, %242
  %244 = tail call float @llvm.exp2.f32(float %243)
  %245 = fmul float %241, %244
  %246 = fadd contract float %86, %245
  %247 = fmul contract float %245, %7
  %248 = fmul contract float %111, %247
  %249 = fadd contract float %96, %248
  %250 = fmul contract float %113, %247
  %251 = fadd contract float %95, %250
  %252 = fmul contract float %115, %247
  %253 = fadd contract float %94, %252
  %254 = fadd contract float %65, %235
  %255 = fmul contract float %254, %254
  %256 = fadd contract float %120, %255
  %257 = fneg contract float %256
  %258 = fmul contract float %109, %257
  %259 = fcmp olt float %258, -1.260000e+02
  %260 = select i1 %259, float 0x3BF0000000000000, float 1.000000e+00
  %261 = select i1 %259, float 6.400000e+01, float 0.000000e+00
  %262 = fadd float %258, %261
  %263 = tail call float @llvm.exp2.f32(float %262)
  %264 = fmul float %260, %263
  %265 = fadd contract float %87, %264
  %266 = fmul contract float %264, %7
  %267 = fmul contract float %111, %266
  %268 = fadd contract float %99, %267
  %269 = fmul contract float %113, %266
  %270 = fadd contract float %98, %269
  %271 = fmul contract float %115, %266
  %272 = fadd contract float %97, %271
  %273 = add nuw nsw i32 %100, 1
  %274 = icmp eq i32 %273, %0
  br i1 %274, label %275, label %67, !llvm.loop !17

275:                                              ; preds = %67, %8
  %276 = phi float [ 0.000000e+00, %8 ], [ %268, %67 ]
  %277 = phi float [ 0.000000e+00, %8 ], [ %270, %67 ]
  %278 = phi float [ 0.000000e+00, %8 ], [ %272, %67 ]
  %279 = phi float [ 0.000000e+00, %8 ], [ %249, %67 ]
  %280 = phi float [ 0.000000e+00, %8 ], [ %251, %67 ]
  %281 = phi float [ 0.000000e+00, %8 ], [ %253, %67 ]
  %282 = phi float [ 0.000000e+00, %8 ], [ %230, %67 ]
  %283 = phi float [ 0.000000e+00, %8 ], [ %232, %67 ]
  %284 = phi float [ 0.000000e+00, %8 ], [ %234, %67 ]
  %285 = phi float [ 0.000000e+00, %8 ], [ %211, %67 ]
  %286 = phi float [ 0.000000e+00, %8 ], [ %213, %67 ]
  %287 = phi float [ 0.000000e+00, %8 ], [ %215, %67 ]
  %288 = phi float [ 0.000000e+00, %8 ], [ %265, %67 ]
  %289 = phi float [ 0.000000e+00, %8 ], [ %246, %67 ]
  %290 = phi float [ 0.000000e+00, %8 ], [ %227, %67 ]
  %291 = phi float [ 0.000000e+00, %8 ], [ %208, %67 ]
  %292 = phi float [ 0.000000e+00, %8 ], [ %192, %67 ]
  %293 = phi float [ 0.000000e+00, %8 ], [ %194, %67 ]
  %294 = phi float [ 0.000000e+00, %8 ], [ %196, %67 ]
  %295 = phi float [ 0.000000e+00, %8 ], [ %173, %67 ]
  %296 = phi float [ 0.000000e+00, %8 ], [ %175, %67 ]
  %297 = phi float [ 0.000000e+00, %8 ], [ %177, %67 ]
  %298 = phi float [ 0.000000e+00, %8 ], [ %189, %67 ]
  %299 = phi float [ 0.000000e+00, %8 ], [ %170, %67 ]
  %300 = phi float [ 0.000000e+00, %8 ], [ %154, %67 ]
  %301 = phi float [ 0.000000e+00, %8 ], [ %156, %67 ]
  %302 = phi float [ 0.000000e+00, %8 ], [ %158, %67 ]
  %303 = phi float [ 0.000000e+00, %8 ], [ %135, %67 ]
  %304 = phi float [ 0.000000e+00, %8 ], [ %137, %67 ]
  %305 = phi float [ 0.000000e+00, %8 ], [ %139, %67 ]
  %306 = phi float [ 0.000000e+00, %8 ], [ %151, %67 ]
  %307 = phi float [ 0.000000e+00, %8 ], [ %132, %67 ]
  %308 = zext i32 %57 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %5, i64 %308
  %310 = load float, float addrspace(1)* %309, align 4, !tbaa !19, !amdgpu.noclobber !5
  %311 = fadd contract float %307, %310
  store float %311, float addrspace(1)* %309, align 4, !tbaa !19
  %312 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 0
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !23
  %314 = fadd contract float %303, %313
  store float %314, float addrspace(1)* %312, align 4, !tbaa !23
  %315 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 1
  %316 = load float, float addrspace(1)* %315, align 4, !tbaa !23
  %317 = fadd contract float %304, %316
  store float %317, float addrspace(1)* %315, align 4, !tbaa !23
  %318 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 2
  %319 = load float, float addrspace(1)* %318, align 4, !tbaa !23
  %320 = fadd contract float %305, %319
  store float %320, float addrspace(1)* %318, align 4, !tbaa !23
  %321 = add i32 %57, 8
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds float, float addrspace(1)* %5, i64 %322
  %324 = load float, float addrspace(1)* %323, align 4, !tbaa !19
  %325 = fadd contract float %306, %324
  store float %325, float addrspace(1)* %323, align 4, !tbaa !19
  %326 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %322, i32 0, i32 0, i32 0, i32 0, i64 0
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !23
  %328 = fadd contract float %300, %327
  store float %328, float addrspace(1)* %326, align 4, !tbaa !23
  %329 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %322, i32 0, i32 0, i32 0, i32 0, i64 1
  %330 = load float, float addrspace(1)* %329, align 4, !tbaa !23
  %331 = fadd contract float %301, %330
  store float %331, float addrspace(1)* %329, align 4, !tbaa !23
  %332 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %322, i32 0, i32 0, i32 0, i32 0, i64 2
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !23
  %334 = fadd contract float %302, %333
  store float %334, float addrspace(1)* %332, align 4, !tbaa !23
  %335 = add i32 %57, 16
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %5, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !19
  %339 = fadd contract float %299, %338
  store float %339, float addrspace(1)* %337, align 4, !tbaa !19
  %340 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %336, i32 0, i32 0, i32 0, i32 0, i64 0
  %341 = load float, float addrspace(1)* %340, align 4, !tbaa !23
  %342 = fadd contract float %295, %341
  store float %342, float addrspace(1)* %340, align 4, !tbaa !23
  %343 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %336, i32 0, i32 0, i32 0, i32 0, i64 1
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !23
  %345 = fadd contract float %296, %344
  store float %345, float addrspace(1)* %343, align 4, !tbaa !23
  %346 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %336, i32 0, i32 0, i32 0, i32 0, i64 2
  %347 = load float, float addrspace(1)* %346, align 4, !tbaa !23
  %348 = fadd contract float %297, %347
  store float %348, float addrspace(1)* %346, align 4, !tbaa !23
  %349 = add i32 %57, 24
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds float, float addrspace(1)* %5, i64 %350
  %352 = load float, float addrspace(1)* %351, align 4, !tbaa !19
  %353 = fadd contract float %298, %352
  store float %353, float addrspace(1)* %351, align 4, !tbaa !19
  %354 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %350, i32 0, i32 0, i32 0, i32 0, i64 0
  %355 = load float, float addrspace(1)* %354, align 4, !tbaa !23
  %356 = fadd contract float %292, %355
  store float %356, float addrspace(1)* %354, align 4, !tbaa !23
  %357 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %350, i32 0, i32 0, i32 0, i32 0, i64 1
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !23
  %359 = fadd contract float %293, %358
  store float %359, float addrspace(1)* %357, align 4, !tbaa !23
  %360 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %350, i32 0, i32 0, i32 0, i32 0, i64 2
  %361 = load float, float addrspace(1)* %360, align 4, !tbaa !23
  %362 = fadd contract float %294, %361
  store float %362, float addrspace(1)* %360, align 4, !tbaa !23
  %363 = add i32 %57, 32
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds float, float addrspace(1)* %5, i64 %364
  %366 = load float, float addrspace(1)* %365, align 4, !tbaa !19
  %367 = fadd contract float %291, %366
  store float %367, float addrspace(1)* %365, align 4, !tbaa !19
  %368 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %364, i32 0, i32 0, i32 0, i32 0, i64 0
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !23
  %370 = fadd contract float %285, %369
  store float %370, float addrspace(1)* %368, align 4, !tbaa !23
  %371 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %364, i32 0, i32 0, i32 0, i32 0, i64 1
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !23
  %373 = fadd contract float %286, %372
  store float %373, float addrspace(1)* %371, align 4, !tbaa !23
  %374 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %364, i32 0, i32 0, i32 0, i32 0, i64 2
  %375 = load float, float addrspace(1)* %374, align 4, !tbaa !23
  %376 = fadd contract float %287, %375
  store float %376, float addrspace(1)* %374, align 4, !tbaa !23
  %377 = add i32 %57, 40
  %378 = zext i32 %377 to i64
  %379 = getelementptr inbounds float, float addrspace(1)* %5, i64 %378
  %380 = load float, float addrspace(1)* %379, align 4, !tbaa !19
  %381 = fadd contract float %290, %380
  store float %381, float addrspace(1)* %379, align 4, !tbaa !19
  %382 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %378, i32 0, i32 0, i32 0, i32 0, i64 0
  %383 = load float, float addrspace(1)* %382, align 4, !tbaa !23
  %384 = fadd contract float %282, %383
  store float %384, float addrspace(1)* %382, align 4, !tbaa !23
  %385 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %378, i32 0, i32 0, i32 0, i32 0, i64 1
  %386 = load float, float addrspace(1)* %385, align 4, !tbaa !23
  %387 = fadd contract float %283, %386
  store float %387, float addrspace(1)* %385, align 4, !tbaa !23
  %388 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %378, i32 0, i32 0, i32 0, i32 0, i64 2
  %389 = load float, float addrspace(1)* %388, align 4, !tbaa !23
  %390 = fadd contract float %284, %389
  store float %390, float addrspace(1)* %388, align 4, !tbaa !23
  %391 = add i32 %57, 48
  %392 = zext i32 %391 to i64
  %393 = getelementptr inbounds float, float addrspace(1)* %5, i64 %392
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !19
  %395 = fadd contract float %289, %394
  store float %395, float addrspace(1)* %393, align 4, !tbaa !19
  %396 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %392, i32 0, i32 0, i32 0, i32 0, i64 0
  %397 = load float, float addrspace(1)* %396, align 4, !tbaa !23
  %398 = fadd contract float %279, %397
  store float %398, float addrspace(1)* %396, align 4, !tbaa !23
  %399 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %392, i32 0, i32 0, i32 0, i32 0, i64 1
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !23
  %401 = fadd contract float %280, %400
  store float %401, float addrspace(1)* %399, align 4, !tbaa !23
  %402 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %392, i32 0, i32 0, i32 0, i32 0, i64 2
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !23
  %404 = fadd contract float %281, %403
  store float %404, float addrspace(1)* %402, align 4, !tbaa !23
  %405 = add i32 %57, 56
  %406 = zext i32 %405 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %5, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !19
  %409 = fadd contract float %288, %408
  store float %409, float addrspace(1)* %407, align 4, !tbaa !19
  %410 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %406, i32 0, i32 0, i32 0, i32 0, i64 0
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !23
  %412 = fadd contract float %276, %411
  store float %412, float addrspace(1)* %410, align 4, !tbaa !23
  %413 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %406, i32 0, i32 0, i32 0, i32 0, i64 1
  %414 = load float, float addrspace(1)* %413, align 4, !tbaa !23
  %415 = fadd contract float %277, %414
  store float %415, float addrspace(1)* %413, align 4, !tbaa !23
  %416 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %6, i64 %406, i32 0, i32 0, i32 0, i32 0, i64 2
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !23
  %418 = fadd contract float %278, %417
  store float %418, float addrspace(1)* %416, align 4, !tbaa !23
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!21, !21, i64 0}
