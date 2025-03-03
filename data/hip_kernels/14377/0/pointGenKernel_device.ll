; ModuleID = '../data/hip_kernels/14377/0/main.cu'
source_filename = "../data/hip_kernels/14377/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z14pointGenKernelPfS_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %335

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = sitofp i32 %14 to float
  %30 = fmul contract float %29, %4
  %31 = fadd contract float %30, %3
  %32 = sitofp i32 %22 to float
  %33 = fmul contract float %32, %4
  %34 = fadd contract float %33, %3
  %35 = shl nsw i32 %28, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  store float %31, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %35, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %34, float addrspace(1)* %40, align 4, !tbaa !7
  %41 = fpext float %31 to double
  %42 = fmul contract double %41, 0x401921FB54442EEA
  %43 = fdiv contract double %42, 1.000000e+01
  %44 = fptrunc double %43 to float
  %45 = tail call float @llvm.fabs.f32(float %44)
  %46 = fcmp olt float %45, 1.310720e+05
  br i1 %46, label %47, label %55

47:                                               ; preds = %26
  %48 = fmul float %45, 0x3FE45F3060000000
  %49 = tail call float @llvm.rint.f32(float %48)
  %50 = tail call float @llvm.fma.f32(float %49, float 0xBFF921FB40000000, float %45)
  %51 = tail call float @llvm.fma.f32(float %49, float 0xBE74442D00000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %49, float 0xBCF8469880000000, float %51)
  %53 = fptosi float %49 to i32
  %54 = bitcast float %45 to i32
  br label %161

55:                                               ; preds = %26
  %56 = bitcast float %45 to i32
  %57 = lshr i32 %56, 23
  %58 = and i32 %56, 8388607
  %59 = or i32 %58, 8388608
  %60 = zext i32 %59 to i64
  %61 = mul nuw nsw i64 %60, 4266746795
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %60, 1011060801
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = mul nuw nsw i64 %60, 3680671129
  %69 = add nuw nsw i64 %67, %68
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = mul nuw nsw i64 %60, 4113882560
  %73 = add nuw nsw i64 %71, %72
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %60, 4230436817
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = mul nuw nsw i64 %60, 1313084713
  %81 = add nuw nsw i64 %79, %80
  %82 = trunc i64 %81 to i32
  %83 = lshr i64 %81, 32
  %84 = mul nuw nsw i64 %60, 2734261102
  %85 = add nuw nsw i64 %83, %84
  %86 = trunc i64 %85 to i32
  %87 = lshr i64 %85, 32
  %88 = trunc i64 %87 to i32
  %89 = add nsw i32 %57, -120
  %90 = icmp ugt i32 %89, 63
  %91 = select i1 %90, i32 %82, i32 %88
  %92 = select i1 %90, i32 %78, i32 %86
  %93 = select i1 %90, i32 %74, i32 %82
  %94 = select i1 %90, i32 %70, i32 %78
  %95 = select i1 %90, i32 %66, i32 %74
  %96 = select i1 %90, i32 %62, i32 %70
  %97 = select i1 %90, i32 -64, i32 0
  %98 = add nsw i32 %97, %89
  %99 = icmp ugt i32 %98, 31
  %100 = select i1 %99, i32 %92, i32 %91
  %101 = select i1 %99, i32 %93, i32 %92
  %102 = select i1 %99, i32 %94, i32 %93
  %103 = select i1 %99, i32 %95, i32 %94
  %104 = select i1 %99, i32 %96, i32 %95
  %105 = select i1 %99, i32 -32, i32 0
  %106 = add nsw i32 %105, %98
  %107 = icmp ugt i32 %106, 31
  %108 = select i1 %107, i32 %101, i32 %100
  %109 = select i1 %107, i32 %102, i32 %101
  %110 = select i1 %107, i32 %103, i32 %102
  %111 = select i1 %107, i32 %104, i32 %103
  %112 = select i1 %107, i32 -32, i32 0
  %113 = add nsw i32 %112, %106
  %114 = icmp eq i32 %113, 0
  %115 = sub nsw i32 32, %113
  %116 = tail call i32 @llvm.fshr.i32(i32 %108, i32 %109, i32 %115)
  %117 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %115)
  %118 = tail call i32 @llvm.fshr.i32(i32 %110, i32 %111, i32 %115)
  %119 = select i1 %114, i32 %108, i32 %116
  %120 = select i1 %114, i32 %109, i32 %117
  %121 = select i1 %114, i32 %110, i32 %118
  %122 = lshr i32 %119, 29
  %123 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %120, i32 2)
  %124 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %121, i32 2)
  %125 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %111, i32 2)
  %126 = and i32 %122, 1
  %127 = sub nsw i32 0, %126
  %128 = shl i32 %122, 31
  %129 = xor i32 %123, %127
  %130 = xor i32 %124, %127
  %131 = xor i32 %125, %127
  %132 = tail call i32 @llvm.ctlz.i32(i32 %129, i1 false), !range !11
  %133 = sub nsw i32 31, %132
  %134 = tail call i32 @llvm.fshr.i32(i32 %129, i32 %130, i32 %133)
  %135 = tail call i32 @llvm.fshr.i32(i32 %130, i32 %131, i32 %133)
  %136 = shl nuw nsw i32 %132, 23
  %137 = sub nuw nsw i32 1056964608, %136
  %138 = lshr i32 %134, 9
  %139 = or i32 %138, %137
  %140 = or i32 %139, %128
  %141 = bitcast i32 %140 to float
  %142 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %135, i32 23)
  %143 = tail call i32 @llvm.ctlz.i32(i32 %142, i1 false), !range !11
  %144 = fmul float %141, 0x3FF921FB40000000
  %145 = add nuw nsw i32 %143, %132
  %146 = shl nuw nsw i32 %145, 23
  %147 = sub nuw nsw i32 855638016, %146
  %148 = sub nsw i32 31, %143
  %149 = tail call i32 @llvm.fshr.i32(i32 %142, i32 %135, i32 %148)
  %150 = lshr i32 %149, 9
  %151 = or i32 %147, %150
  %152 = or i32 %151, %128
  %153 = bitcast i32 %152 to float
  %154 = fneg float %144
  %155 = tail call float @llvm.fma.f32(float %141, float 0x3FF921FB40000000, float %154)
  %156 = tail call float @llvm.fma.f32(float %141, float 0x3E74442D00000000, float %155)
  %157 = tail call float @llvm.fma.f32(float %153, float 0x3FF921FB40000000, float %156)
  %158 = fadd float %144, %157
  %159 = lshr i32 %119, 30
  %160 = add nuw nsw i32 %126, %159
  br label %161

161:                                              ; preds = %47, %55
  %162 = phi i32 [ %54, %47 ], [ %56, %55 ]
  %163 = phi float [ %52, %47 ], [ %158, %55 ]
  %164 = phi i32 [ %53, %47 ], [ %160, %55 ]
  %165 = fmul float %163, %163
  %166 = tail call float @llvm.fmuladd.f32(float %165, float 0xBF29833040000000, float 0x3F81103880000000)
  %167 = tail call float @llvm.fmuladd.f32(float %165, float %166, float 0xBFC55553A0000000)
  %168 = fmul float %165, %167
  %169 = tail call float @llvm.fmuladd.f32(float %163, float %168, float %163)
  %170 = tail call float @llvm.fmuladd.f32(float %165, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %171 = tail call float @llvm.fmuladd.f32(float %165, float %170, float 0x3FA5557EE0000000)
  %172 = tail call float @llvm.fmuladd.f32(float %165, float %171, float 0xBFE0000080000000)
  %173 = tail call float @llvm.fmuladd.f32(float %165, float %172, float 1.000000e+00)
  %174 = and i32 %164, 1
  %175 = icmp eq i32 %174, 0
  %176 = select i1 %175, float %169, float %173
  %177 = bitcast float %176 to i32
  %178 = shl i32 %164, 30
  %179 = and i32 %178, -2147483648
  %180 = bitcast float %44 to i32
  %181 = xor i32 %162, %180
  %182 = xor i32 %181, %179
  %183 = xor i32 %182, %177
  %184 = bitcast i32 %183 to float
  %185 = tail call i1 @llvm.amdgcn.class.f32(float %45, i32 504)
  %186 = select i1 %185, float %184, float 0x7FF8000000000000
  %187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %186, float addrspace(1)* %187, align 4, !tbaa !7
  %188 = fpext float %34 to double
  %189 = fmul contract double %188, 0x401921FB54442EEA
  %190 = fdiv contract double %189, 1.000000e+01
  %191 = fptrunc double %190 to float
  %192 = tail call float @llvm.fabs.f32(float %191)
  %193 = fcmp olt float %192, 1.310720e+05
  br i1 %193, label %194, label %202

194:                                              ; preds = %161
  %195 = fmul float %192, 0x3FE45F3060000000
  %196 = tail call float @llvm.rint.f32(float %195)
  %197 = tail call float @llvm.fma.f32(float %196, float 0xBFF921FB40000000, float %192)
  %198 = tail call float @llvm.fma.f32(float %196, float 0xBE74442D00000000, float %197)
  %199 = tail call float @llvm.fma.f32(float %196, float 0xBCF8469880000000, float %198)
  %200 = fptosi float %196 to i32
  %201 = bitcast float %192 to i32
  br label %308

202:                                              ; preds = %161
  %203 = bitcast float %192 to i32
  %204 = lshr i32 %203, 23
  %205 = and i32 %203, 8388607
  %206 = or i32 %205, 8388608
  %207 = zext i32 %206 to i64
  %208 = mul nuw nsw i64 %207, 4266746795
  %209 = trunc i64 %208 to i32
  %210 = lshr i64 %208, 32
  %211 = mul nuw nsw i64 %207, 1011060801
  %212 = add nuw nsw i64 %210, %211
  %213 = trunc i64 %212 to i32
  %214 = lshr i64 %212, 32
  %215 = mul nuw nsw i64 %207, 3680671129
  %216 = add nuw nsw i64 %214, %215
  %217 = trunc i64 %216 to i32
  %218 = lshr i64 %216, 32
  %219 = mul nuw nsw i64 %207, 4113882560
  %220 = add nuw nsw i64 %218, %219
  %221 = trunc i64 %220 to i32
  %222 = lshr i64 %220, 32
  %223 = mul nuw nsw i64 %207, 4230436817
  %224 = add nuw nsw i64 %222, %223
  %225 = trunc i64 %224 to i32
  %226 = lshr i64 %224, 32
  %227 = mul nuw nsw i64 %207, 1313084713
  %228 = add nuw nsw i64 %226, %227
  %229 = trunc i64 %228 to i32
  %230 = lshr i64 %228, 32
  %231 = mul nuw nsw i64 %207, 2734261102
  %232 = add nuw nsw i64 %230, %231
  %233 = trunc i64 %232 to i32
  %234 = lshr i64 %232, 32
  %235 = trunc i64 %234 to i32
  %236 = add nsw i32 %204, -120
  %237 = icmp ugt i32 %236, 63
  %238 = select i1 %237, i32 %229, i32 %235
  %239 = select i1 %237, i32 %225, i32 %233
  %240 = select i1 %237, i32 %221, i32 %229
  %241 = select i1 %237, i32 %217, i32 %225
  %242 = select i1 %237, i32 %213, i32 %221
  %243 = select i1 %237, i32 %209, i32 %217
  %244 = select i1 %237, i32 -64, i32 0
  %245 = add nsw i32 %244, %236
  %246 = icmp ugt i32 %245, 31
  %247 = select i1 %246, i32 %239, i32 %238
  %248 = select i1 %246, i32 %240, i32 %239
  %249 = select i1 %246, i32 %241, i32 %240
  %250 = select i1 %246, i32 %242, i32 %241
  %251 = select i1 %246, i32 %243, i32 %242
  %252 = select i1 %246, i32 -32, i32 0
  %253 = add nsw i32 %252, %245
  %254 = icmp ugt i32 %253, 31
  %255 = select i1 %254, i32 %248, i32 %247
  %256 = select i1 %254, i32 %249, i32 %248
  %257 = select i1 %254, i32 %250, i32 %249
  %258 = select i1 %254, i32 %251, i32 %250
  %259 = select i1 %254, i32 -32, i32 0
  %260 = add nsw i32 %259, %253
  %261 = icmp eq i32 %260, 0
  %262 = sub nsw i32 32, %260
  %263 = tail call i32 @llvm.fshr.i32(i32 %255, i32 %256, i32 %262)
  %264 = tail call i32 @llvm.fshr.i32(i32 %256, i32 %257, i32 %262)
  %265 = tail call i32 @llvm.fshr.i32(i32 %257, i32 %258, i32 %262)
  %266 = select i1 %261, i32 %255, i32 %263
  %267 = select i1 %261, i32 %256, i32 %264
  %268 = select i1 %261, i32 %257, i32 %265
  %269 = lshr i32 %266, 29
  %270 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %267, i32 2)
  %271 = tail call i32 @llvm.fshl.i32(i32 %267, i32 %268, i32 2)
  %272 = tail call i32 @llvm.fshl.i32(i32 %268, i32 %258, i32 2)
  %273 = and i32 %269, 1
  %274 = sub nsw i32 0, %273
  %275 = shl i32 %269, 31
  %276 = xor i32 %270, %274
  %277 = xor i32 %271, %274
  %278 = xor i32 %272, %274
  %279 = tail call i32 @llvm.ctlz.i32(i32 %276, i1 false), !range !11
  %280 = sub nsw i32 31, %279
  %281 = tail call i32 @llvm.fshr.i32(i32 %276, i32 %277, i32 %280)
  %282 = tail call i32 @llvm.fshr.i32(i32 %277, i32 %278, i32 %280)
  %283 = shl nuw nsw i32 %279, 23
  %284 = sub nuw nsw i32 1056964608, %283
  %285 = lshr i32 %281, 9
  %286 = or i32 %285, %284
  %287 = or i32 %286, %275
  %288 = bitcast i32 %287 to float
  %289 = tail call i32 @llvm.fshl.i32(i32 %281, i32 %282, i32 23)
  %290 = tail call i32 @llvm.ctlz.i32(i32 %289, i1 false), !range !11
  %291 = fmul float %288, 0x3FF921FB40000000
  %292 = add nuw nsw i32 %290, %279
  %293 = shl nuw nsw i32 %292, 23
  %294 = sub nuw nsw i32 855638016, %293
  %295 = sub nsw i32 31, %290
  %296 = tail call i32 @llvm.fshr.i32(i32 %289, i32 %282, i32 %295)
  %297 = lshr i32 %296, 9
  %298 = or i32 %294, %297
  %299 = or i32 %298, %275
  %300 = bitcast i32 %299 to float
  %301 = fneg float %291
  %302 = tail call float @llvm.fma.f32(float %288, float 0x3FF921FB40000000, float %301)
  %303 = tail call float @llvm.fma.f32(float %288, float 0x3E74442D00000000, float %302)
  %304 = tail call float @llvm.fma.f32(float %300, float 0x3FF921FB40000000, float %303)
  %305 = fadd float %291, %304
  %306 = lshr i32 %266, 30
  %307 = add nuw nsw i32 %273, %306
  br label %308

308:                                              ; preds = %194, %202
  %309 = phi i32 [ %201, %194 ], [ %203, %202 ]
  %310 = phi float [ %199, %194 ], [ %305, %202 ]
  %311 = phi i32 [ %200, %194 ], [ %307, %202 ]
  %312 = fmul float %310, %310
  %313 = tail call float @llvm.fmuladd.f32(float %312, float 0xBF29833040000000, float 0x3F81103880000000)
  %314 = tail call float @llvm.fmuladd.f32(float %312, float %313, float 0xBFC55553A0000000)
  %315 = fmul float %312, %314
  %316 = tail call float @llvm.fmuladd.f32(float %310, float %315, float %310)
  %317 = tail call float @llvm.fmuladd.f32(float %312, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %318 = tail call float @llvm.fmuladd.f32(float %312, float %317, float 0x3FA5557EE0000000)
  %319 = tail call float @llvm.fmuladd.f32(float %312, float %318, float 0xBFE0000080000000)
  %320 = tail call float @llvm.fmuladd.f32(float %312, float %319, float 1.000000e+00)
  %321 = and i32 %311, 1
  %322 = icmp eq i32 %321, 0
  %323 = select i1 %322, float %316, float %320
  %324 = bitcast float %323 to i32
  %325 = shl i32 %311, 30
  %326 = and i32 %325, -2147483648
  %327 = bitcast float %191 to i32
  %328 = xor i32 %309, %327
  %329 = xor i32 %328, %326
  %330 = xor i32 %329, %324
  %331 = bitcast i32 %330 to float
  %332 = tail call i1 @llvm.amdgcn.class.f32(float %192, i32 504)
  %333 = select i1 %332, float %331, float 0x7FF8000000000000
  %334 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %333, float addrspace(1)* %334, align 4, !tbaa !7
  br label %335

335:                                              ; preds = %308, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
