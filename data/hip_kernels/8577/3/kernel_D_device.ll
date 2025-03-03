; ModuleID = '../data/hip_kernels/8577/3/main.cu'
source_filename = "../data/hip_kernels/8577/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_DPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = bitcast float addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 0
  %16 = load float, float addrspace(1)* %15, align 16, !amdgpu.noclobber !5
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 1
  %18 = load float, float addrspace(1)* %17, align 4, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 2
  %20 = load float, float addrspace(1)* %19, align 8, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 3
  %22 = load float, float addrspace(1)* %21, align 4, !amdgpu.noclobber !5
  %23 = tail call float @llvm.fabs.f32(float %16)
  %24 = fcmp olt float %23, 1.310720e+05
  br i1 %24, label %25, label %32

25:                                               ; preds = %3
  %26 = fmul float %23, 0x3FE45F3060000000
  %27 = tail call float @llvm.rint.f32(float %26)
  %28 = tail call float @llvm.fma.f32(float %27, float 0xBFF921FB40000000, float %23)
  %29 = tail call float @llvm.fma.f32(float %27, float 0xBE74442D00000000, float %28)
  %30 = tail call float @llvm.fma.f32(float %27, float 0xBCF8469880000000, float %29)
  %31 = fptosi float %27 to i32
  br label %138

32:                                               ; preds = %3
  %33 = bitcast float %23 to i32
  %34 = lshr i32 %33, 23
  %35 = and i32 %33, 8388607
  %36 = or i32 %35, 8388608
  %37 = zext i32 %36 to i64
  %38 = mul nuw nsw i64 %37, 4266746795
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = mul nuw nsw i64 %37, 1011060801
  %42 = add nuw nsw i64 %40, %41
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = mul nuw nsw i64 %37, 3680671129
  %46 = add nuw nsw i64 %44, %45
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %37, 4113882560
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %37, 4230436817
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %37, 1313084713
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %37, 2734261102
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = trunc i64 %64 to i32
  %66 = add nsw i32 %34, -120
  %67 = icmp ugt i32 %66, 63
  %68 = select i1 %67, i32 %59, i32 %65
  %69 = select i1 %67, i32 %55, i32 %63
  %70 = select i1 %67, i32 %51, i32 %59
  %71 = select i1 %67, i32 %47, i32 %55
  %72 = select i1 %67, i32 %43, i32 %51
  %73 = select i1 %67, i32 %39, i32 %47
  %74 = select i1 %67, i32 -64, i32 0
  %75 = add nsw i32 %74, %66
  %76 = icmp ugt i32 %75, 31
  %77 = select i1 %76, i32 %69, i32 %68
  %78 = select i1 %76, i32 %70, i32 %69
  %79 = select i1 %76, i32 %71, i32 %70
  %80 = select i1 %76, i32 %72, i32 %71
  %81 = select i1 %76, i32 %73, i32 %72
  %82 = select i1 %76, i32 -32, i32 0
  %83 = add nsw i32 %82, %75
  %84 = icmp ugt i32 %83, 31
  %85 = select i1 %84, i32 %78, i32 %77
  %86 = select i1 %84, i32 %79, i32 %78
  %87 = select i1 %84, i32 %80, i32 %79
  %88 = select i1 %84, i32 %81, i32 %80
  %89 = select i1 %84, i32 -32, i32 0
  %90 = add nsw i32 %89, %83
  %91 = icmp eq i32 %90, 0
  %92 = sub nsw i32 32, %90
  %93 = tail call i32 @llvm.fshr.i32(i32 %85, i32 %86, i32 %92)
  %94 = tail call i32 @llvm.fshr.i32(i32 %86, i32 %87, i32 %92)
  %95 = tail call i32 @llvm.fshr.i32(i32 %87, i32 %88, i32 %92)
  %96 = select i1 %91, i32 %85, i32 %93
  %97 = select i1 %91, i32 %86, i32 %94
  %98 = select i1 %91, i32 %87, i32 %95
  %99 = lshr i32 %96, 29
  %100 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %97, i32 2)
  %101 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %98, i32 2)
  %102 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %88, i32 2)
  %103 = and i32 %99, 1
  %104 = sub nsw i32 0, %103
  %105 = shl i32 %99, 31
  %106 = xor i32 %100, %104
  %107 = xor i32 %101, %104
  %108 = xor i32 %102, %104
  %109 = tail call i32 @llvm.ctlz.i32(i32 %106, i1 false), !range !7
  %110 = sub nsw i32 31, %109
  %111 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %107, i32 %110)
  %112 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %110)
  %113 = shl nuw nsw i32 %109, 23
  %114 = sub nuw nsw i32 1056964608, %113
  %115 = lshr i32 %111, 9
  %116 = or i32 %115, %114
  %117 = or i32 %116, %105
  %118 = bitcast i32 %117 to float
  %119 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 23)
  %120 = tail call i32 @llvm.ctlz.i32(i32 %119, i1 false), !range !7
  %121 = fmul float %118, 0x3FF921FB40000000
  %122 = add nuw nsw i32 %120, %109
  %123 = shl nuw nsw i32 %122, 23
  %124 = sub nuw nsw i32 855638016, %123
  %125 = sub nsw i32 31, %120
  %126 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %112, i32 %125)
  %127 = lshr i32 %126, 9
  %128 = or i32 %124, %127
  %129 = or i32 %128, %105
  %130 = bitcast i32 %129 to float
  %131 = fneg float %121
  %132 = tail call float @llvm.fma.f32(float %118, float 0x3FF921FB40000000, float %131)
  %133 = tail call float @llvm.fma.f32(float %118, float 0x3E74442D00000000, float %132)
  %134 = tail call float @llvm.fma.f32(float %130, float 0x3FF921FB40000000, float %133)
  %135 = fadd float %121, %134
  %136 = lshr i32 %96, 30
  %137 = add nuw nsw i32 %103, %136
  br label %138

138:                                              ; preds = %25, %32
  %139 = phi float [ %30, %25 ], [ %135, %32 ]
  %140 = phi i32 [ %31, %25 ], [ %137, %32 ]
  %141 = fmul float %139, %139
  %142 = tail call float @llvm.fmuladd.f32(float %141, float 0xBF29833040000000, float 0x3F81103880000000)
  %143 = tail call float @llvm.fmuladd.f32(float %141, float %142, float 0xBFC55553A0000000)
  %144 = fmul float %141, %143
  %145 = tail call float @llvm.fmuladd.f32(float %139, float %144, float %139)
  %146 = tail call float @llvm.fmuladd.f32(float %141, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %147 = tail call float @llvm.fmuladd.f32(float %141, float %146, float 0x3FA5557EE0000000)
  %148 = tail call float @llvm.fmuladd.f32(float %141, float %147, float 0xBFE0000080000000)
  %149 = tail call float @llvm.fmuladd.f32(float %141, float %148, float 1.000000e+00)
  %150 = fneg float %145
  %151 = and i32 %140, 1
  %152 = icmp eq i32 %151, 0
  %153 = select i1 %152, float %149, float %150
  %154 = bitcast float %153 to i32
  %155 = shl i32 %140, 30
  %156 = and i32 %155, -2147483648
  %157 = xor i32 %156, %154
  %158 = bitcast i32 %157 to float
  %159 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 504)
  %160 = fadd contract float %158, 1.000000e+00
  %161 = select i1 %159, float %160, float 0x7FF8000000000000
  %162 = fcmp olt float %161, 0x39F0000000000000
  %163 = select i1 %162, float 0x41F0000000000000, float 1.000000e+00
  %164 = fmul float %161, %163
  %165 = tail call float @llvm.sqrt.f32(float %164)
  %166 = bitcast float %165 to i32
  %167 = add nsw i32 %166, -1
  %168 = bitcast i32 %167 to float
  %169 = add nsw i32 %166, 1
  %170 = bitcast i32 %169 to float
  %171 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %172 = select i1 %171, float 0x41F0000000000000, float 1.000000e+00
  %173 = fmul float %18, %172
  %174 = tail call float @llvm.log2.f32(float %173)
  %175 = fmul float %174, 0x3FE62E42E0000000
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %174, i32 519)
  %177 = fneg float %175
  %178 = tail call float @llvm.fma.f32(float %174, float 0x3FE62E42E0000000, float %177)
  %179 = tail call float @llvm.fma.f32(float %174, float 0x3E6EFA39E0000000, float %178)
  %180 = fadd float %175, %179
  %181 = select i1 %176, float %174, float %180
  %182 = select i1 %171, float 0x40362E4300000000, float 0.000000e+00
  %183 = fsub float %181, %182
  %184 = fadd contract float %183, 1.000000e+00
  %185 = fcmp olt float %184, 0x39F0000000000000
  %186 = select i1 %185, float 0x41F0000000000000, float 1.000000e+00
  %187 = fmul float %184, %186
  %188 = tail call float @llvm.sqrt.f32(float %187)
  %189 = bitcast float %188 to i32
  %190 = add nsw i32 %189, -1
  %191 = bitcast i32 %190 to float
  %192 = add nsw i32 %189, 1
  %193 = bitcast i32 %192 to float
  %194 = tail call float @llvm.fabs.f32(float %20)
  %195 = fcmp olt float %194, 1.310720e+05
  br i1 %195, label %196, label %203

196:                                              ; preds = %138
  %197 = fmul float %194, 0x3FE45F3060000000
  %198 = tail call float @llvm.rint.f32(float %197)
  %199 = tail call float @llvm.fma.f32(float %198, float 0xBFF921FB40000000, float %194)
  %200 = tail call float @llvm.fma.f32(float %198, float 0xBE74442D00000000, float %199)
  %201 = tail call float @llvm.fma.f32(float %198, float 0xBCF8469880000000, float %200)
  %202 = fptosi float %198 to i32
  br label %309

203:                                              ; preds = %138
  %204 = bitcast float %194 to i32
  %205 = lshr i32 %204, 23
  %206 = and i32 %204, 8388607
  %207 = or i32 %206, 8388608
  %208 = zext i32 %207 to i64
  %209 = mul nuw nsw i64 %208, 4266746795
  %210 = trunc i64 %209 to i32
  %211 = lshr i64 %209, 32
  %212 = mul nuw nsw i64 %208, 1011060801
  %213 = add nuw nsw i64 %211, %212
  %214 = trunc i64 %213 to i32
  %215 = lshr i64 %213, 32
  %216 = mul nuw nsw i64 %208, 3680671129
  %217 = add nuw nsw i64 %215, %216
  %218 = trunc i64 %217 to i32
  %219 = lshr i64 %217, 32
  %220 = mul nuw nsw i64 %208, 4113882560
  %221 = add nuw nsw i64 %219, %220
  %222 = trunc i64 %221 to i32
  %223 = lshr i64 %221, 32
  %224 = mul nuw nsw i64 %208, 4230436817
  %225 = add nuw nsw i64 %223, %224
  %226 = trunc i64 %225 to i32
  %227 = lshr i64 %225, 32
  %228 = mul nuw nsw i64 %208, 1313084713
  %229 = add nuw nsw i64 %227, %228
  %230 = trunc i64 %229 to i32
  %231 = lshr i64 %229, 32
  %232 = mul nuw nsw i64 %208, 2734261102
  %233 = add nuw nsw i64 %231, %232
  %234 = trunc i64 %233 to i32
  %235 = lshr i64 %233, 32
  %236 = trunc i64 %235 to i32
  %237 = add nsw i32 %205, -120
  %238 = icmp ugt i32 %237, 63
  %239 = select i1 %238, i32 %230, i32 %236
  %240 = select i1 %238, i32 %226, i32 %234
  %241 = select i1 %238, i32 %222, i32 %230
  %242 = select i1 %238, i32 %218, i32 %226
  %243 = select i1 %238, i32 %214, i32 %222
  %244 = select i1 %238, i32 %210, i32 %218
  %245 = select i1 %238, i32 -64, i32 0
  %246 = add nsw i32 %245, %237
  %247 = icmp ugt i32 %246, 31
  %248 = select i1 %247, i32 %240, i32 %239
  %249 = select i1 %247, i32 %241, i32 %240
  %250 = select i1 %247, i32 %242, i32 %241
  %251 = select i1 %247, i32 %243, i32 %242
  %252 = select i1 %247, i32 %244, i32 %243
  %253 = select i1 %247, i32 -32, i32 0
  %254 = add nsw i32 %253, %246
  %255 = icmp ugt i32 %254, 31
  %256 = select i1 %255, i32 %249, i32 %248
  %257 = select i1 %255, i32 %250, i32 %249
  %258 = select i1 %255, i32 %251, i32 %250
  %259 = select i1 %255, i32 %252, i32 %251
  %260 = select i1 %255, i32 -32, i32 0
  %261 = add nsw i32 %260, %254
  %262 = icmp eq i32 %261, 0
  %263 = sub nsw i32 32, %261
  %264 = tail call i32 @llvm.fshr.i32(i32 %256, i32 %257, i32 %263)
  %265 = tail call i32 @llvm.fshr.i32(i32 %257, i32 %258, i32 %263)
  %266 = tail call i32 @llvm.fshr.i32(i32 %258, i32 %259, i32 %263)
  %267 = select i1 %262, i32 %256, i32 %264
  %268 = select i1 %262, i32 %257, i32 %265
  %269 = select i1 %262, i32 %258, i32 %266
  %270 = lshr i32 %267, 29
  %271 = tail call i32 @llvm.fshl.i32(i32 %267, i32 %268, i32 2)
  %272 = tail call i32 @llvm.fshl.i32(i32 %268, i32 %269, i32 2)
  %273 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %259, i32 2)
  %274 = and i32 %270, 1
  %275 = sub nsw i32 0, %274
  %276 = shl i32 %270, 31
  %277 = xor i32 %271, %275
  %278 = xor i32 %272, %275
  %279 = xor i32 %273, %275
  %280 = tail call i32 @llvm.ctlz.i32(i32 %277, i1 false), !range !7
  %281 = sub nsw i32 31, %280
  %282 = tail call i32 @llvm.fshr.i32(i32 %277, i32 %278, i32 %281)
  %283 = tail call i32 @llvm.fshr.i32(i32 %278, i32 %279, i32 %281)
  %284 = shl nuw nsw i32 %280, 23
  %285 = sub nuw nsw i32 1056964608, %284
  %286 = lshr i32 %282, 9
  %287 = or i32 %286, %285
  %288 = or i32 %287, %276
  %289 = bitcast i32 %288 to float
  %290 = tail call i32 @llvm.fshl.i32(i32 %282, i32 %283, i32 23)
  %291 = tail call i32 @llvm.ctlz.i32(i32 %290, i1 false), !range !7
  %292 = fmul float %289, 0x3FF921FB40000000
  %293 = add nuw nsw i32 %291, %280
  %294 = shl nuw nsw i32 %293, 23
  %295 = sub nuw nsw i32 855638016, %294
  %296 = sub nsw i32 31, %291
  %297 = tail call i32 @llvm.fshr.i32(i32 %290, i32 %283, i32 %296)
  %298 = lshr i32 %297, 9
  %299 = or i32 %295, %298
  %300 = or i32 %299, %276
  %301 = bitcast i32 %300 to float
  %302 = fneg float %292
  %303 = tail call float @llvm.fma.f32(float %289, float 0x3FF921FB40000000, float %302)
  %304 = tail call float @llvm.fma.f32(float %289, float 0x3E74442D00000000, float %303)
  %305 = tail call float @llvm.fma.f32(float %301, float 0x3FF921FB40000000, float %304)
  %306 = fadd float %292, %305
  %307 = lshr i32 %267, 30
  %308 = add nuw nsw i32 %274, %307
  br label %309

309:                                              ; preds = %196, %203
  %310 = phi float [ %201, %196 ], [ %306, %203 ]
  %311 = phi i32 [ %202, %196 ], [ %308, %203 ]
  %312 = tail call i1 @llvm.amdgcn.class.f32(float %187, i32 608)
  %313 = select i1 %185, float 0x3EF0000000000000, float 1.000000e+00
  %314 = fneg float %193
  %315 = tail call float @llvm.fma.f32(float %314, float %188, float %187)
  %316 = fcmp ogt float %315, 0.000000e+00
  %317 = fneg float %191
  %318 = tail call float @llvm.fma.f32(float %317, float %188, float %187)
  %319 = fcmp ole float %318, 0.000000e+00
  %320 = select i1 %319, float %191, float %188
  %321 = select i1 %316, float %193, float %320
  %322 = fmul float %313, %321
  %323 = select i1 %312, float %187, float %322
  %324 = fadd contract float %18, %323
  %325 = tail call i1 @llvm.amdgcn.class.f32(float %164, i32 608)
  %326 = select i1 %162, float 0x3EF0000000000000, float 1.000000e+00
  %327 = fneg float %170
  %328 = tail call float @llvm.fma.f32(float %327, float %165, float %164)
  %329 = fcmp ogt float %328, 0.000000e+00
  %330 = fneg float %168
  %331 = tail call float @llvm.fma.f32(float %330, float %165, float %164)
  %332 = fcmp ole float %331, 0.000000e+00
  %333 = select i1 %332, float %168, float %165
  %334 = select i1 %329, float %170, float %333
  %335 = fmul float %326, %334
  %336 = select i1 %325, float %164, float %335
  %337 = fadd contract float %16, %336
  %338 = fmul float %310, %310
  %339 = tail call float @llvm.fmuladd.f32(float %338, float 0xBF29833040000000, float 0x3F81103880000000)
  %340 = tail call float @llvm.fmuladd.f32(float %338, float %339, float 0xBFC55553A0000000)
  %341 = fmul float %338, %340
  %342 = tail call float @llvm.fmuladd.f32(float %310, float %341, float %310)
  %343 = tail call float @llvm.fmuladd.f32(float %338, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %344 = tail call float @llvm.fmuladd.f32(float %338, float %343, float 0x3FA5557EE0000000)
  %345 = tail call float @llvm.fmuladd.f32(float %338, float %344, float 0xBFE0000080000000)
  %346 = tail call float @llvm.fmuladd.f32(float %338, float %345, float 1.000000e+00)
  %347 = fneg float %342
  %348 = and i32 %311, 1
  %349 = icmp eq i32 %348, 0
  %350 = select i1 %349, float %346, float %347
  %351 = bitcast float %350 to i32
  %352 = shl i32 %311, 30
  %353 = and i32 %352, -2147483648
  %354 = xor i32 %353, %351
  %355 = bitcast i32 %354 to float
  %356 = tail call i1 @llvm.amdgcn.class.f32(float %194, i32 504)
  %357 = fadd contract float %355, 1.000000e+00
  %358 = select i1 %356, float %357, float 0x7FF8000000000000
  %359 = fcmp olt float %358, 0x39F0000000000000
  %360 = select i1 %359, float 0x41F0000000000000, float 1.000000e+00
  %361 = fmul float %358, %360
  %362 = tail call float @llvm.sqrt.f32(float %361)
  %363 = bitcast float %362 to i32
  %364 = add nsw i32 %363, -1
  %365 = bitcast i32 %364 to float
  %366 = add nsw i32 %363, 1
  %367 = bitcast i32 %366 to float
  %368 = tail call i1 @llvm.amdgcn.class.f32(float %361, i32 608)
  %369 = select i1 %359, float 0x3EF0000000000000, float 1.000000e+00
  %370 = fneg float %367
  %371 = tail call float @llvm.fma.f32(float %370, float %362, float %361)
  %372 = fcmp ogt float %371, 0.000000e+00
  %373 = fneg float %365
  %374 = tail call float @llvm.fma.f32(float %373, float %362, float %361)
  %375 = fcmp ole float %374, 0.000000e+00
  %376 = select i1 %375, float %365, float %362
  %377 = select i1 %372, float %367, float %376
  %378 = fmul float %369, %377
  %379 = select i1 %368, float %361, float %378
  %380 = fadd contract float %20, %379
  %381 = tail call i1 @llvm.amdgcn.class.f32(float %22, i32 144)
  %382 = select i1 %381, float 0x41F0000000000000, float 1.000000e+00
  %383 = fmul float %22, %382
  %384 = tail call float @llvm.log2.f32(float %383)
  %385 = fmul float %384, 0x3FE62E42E0000000
  %386 = tail call i1 @llvm.amdgcn.class.f32(float %384, i32 519)
  %387 = fneg float %385
  %388 = tail call float @llvm.fma.f32(float %384, float 0x3FE62E42E0000000, float %387)
  %389 = tail call float @llvm.fma.f32(float %384, float 0x3E6EFA39E0000000, float %388)
  %390 = fadd float %385, %389
  %391 = select i1 %386, float %384, float %390
  %392 = select i1 %381, float 0x40362E4300000000, float 0.000000e+00
  %393 = fsub float %391, %392
  %394 = fadd contract float %393, 1.000000e+00
  %395 = fcmp olt float %394, 0x39F0000000000000
  %396 = select i1 %395, float 0x41F0000000000000, float 1.000000e+00
  %397 = fmul float %394, %396
  %398 = tail call float @llvm.sqrt.f32(float %397)
  %399 = bitcast float %398 to i32
  %400 = add nsw i32 %399, -1
  %401 = bitcast i32 %400 to float
  %402 = add nsw i32 %399, 1
  %403 = bitcast i32 %402 to float
  %404 = tail call i1 @llvm.amdgcn.class.f32(float %397, i32 608)
  %405 = select i1 %395, float 0x3EF0000000000000, float 1.000000e+00
  %406 = fneg float %403
  %407 = tail call float @llvm.fma.f32(float %406, float %398, float %397)
  %408 = fcmp ogt float %407, 0.000000e+00
  %409 = fneg float %401
  %410 = tail call float @llvm.fma.f32(float %409, float %398, float %397)
  %411 = fcmp ole float %410, 0.000000e+00
  %412 = select i1 %411, float %401, float %398
  %413 = select i1 %408, float %403, float %412
  %414 = fmul float %405, %413
  %415 = select i1 %404, float %397, float %414
  %416 = fadd contract float %22, %415
  store float %337, float addrspace(1)* %15, align 16
  store float %324, float addrspace(1)* %17, align 4
  store float %380, float addrspace(1)* %19, align 8
  store float %416, float addrspace(1)* %21, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{i32 0, i32 33}
