; ModuleID = '../data/hip_kernels/16034/94/main.cu'
source_filename = "../data/hip_kernels/16034/94/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_phaseNManywithOil_f(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture readonly %12, i32 addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture writeonly %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !7
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = add i32 %33, %27
  %35 = udiv i32 %26, %23
  %36 = mul i32 %35, %23
  %37 = icmp ugt i32 %26, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %34
  %41 = add i32 %40, %18
  %42 = mul i32 %41, %23
  %43 = add i32 %42, %17
  %44 = icmp slt i32 %43, %0
  br i1 %44, label %45, label %391

45:                                               ; preds = %16
  %46 = freeze i32 %43
  %47 = freeze i32 %1
  %48 = sdiv i32 %46, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %46, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !6
  %54 = sext i32 %48 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %11, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !6
  %57 = fmul contract float %53, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !6
  %60 = add nsw i32 %48, %15
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %11, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !6
  %64 = fmul contract float %59, %63
  %65 = fadd contract float %57, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %10, i64 %51
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !6
  %68 = fadd contract float %67, %65
  %69 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !6
  %71 = shl nsw i32 %15, 1
  %72 = add nsw i32 %48, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %11, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !6
  %76 = fmul contract float %70, %75
  %77 = fadd contract float %68, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %7, i64 %51
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16, !amdgpu.noclobber !6
  %80 = mul nsw i32 %15, 3
  %81 = add nsw i32 %48, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %11, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !6
  %85 = fmul contract float %79, %84
  %86 = fsub contract float %77, %85
  %87 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !6
  %89 = fmul contract float %76, %88
  %90 = fadd contract float %68, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %8, i64 %51
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !6
  %93 = fmul contract float %85, %92
  %94 = fsub contract float %90, %93
  %95 = getelementptr inbounds float, float addrspace(1)* %9, i64 %51
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !6
  %97 = tail call float @llvm.fabs.f32(float %86)
  %98 = fcmp olt float %97, 1.310720e+05
  br i1 %98, label %99, label %106

99:                                               ; preds = %45
  %100 = fmul float %97, 0x3FE45F3060000000
  %101 = tail call float @llvm.rint.f32(float %100)
  %102 = tail call float @llvm.fma.f32(float %101, float 0xBFF921FB40000000, float %97)
  %103 = tail call float @llvm.fma.f32(float %101, float 0xBE74442D00000000, float %102)
  %104 = tail call float @llvm.fma.f32(float %101, float 0xBCF8469880000000, float %103)
  %105 = fptosi float %101 to i32
  br label %212

106:                                              ; preds = %45
  %107 = bitcast float %97 to i32
  %108 = lshr i32 %107, 23
  %109 = and i32 %107, 8388607
  %110 = or i32 %109, 8388608
  %111 = zext i32 %110 to i64
  %112 = mul nuw nsw i64 %111, 4266746795
  %113 = trunc i64 %112 to i32
  %114 = lshr i64 %112, 32
  %115 = mul nuw nsw i64 %111, 1011060801
  %116 = add nuw nsw i64 %114, %115
  %117 = trunc i64 %116 to i32
  %118 = lshr i64 %116, 32
  %119 = mul nuw nsw i64 %111, 3680671129
  %120 = add nuw nsw i64 %118, %119
  %121 = trunc i64 %120 to i32
  %122 = lshr i64 %120, 32
  %123 = mul nuw nsw i64 %111, 4113882560
  %124 = add nuw nsw i64 %122, %123
  %125 = trunc i64 %124 to i32
  %126 = lshr i64 %124, 32
  %127 = mul nuw nsw i64 %111, 4230436817
  %128 = add nuw nsw i64 %126, %127
  %129 = trunc i64 %128 to i32
  %130 = lshr i64 %128, 32
  %131 = mul nuw nsw i64 %111, 1313084713
  %132 = add nuw nsw i64 %130, %131
  %133 = trunc i64 %132 to i32
  %134 = lshr i64 %132, 32
  %135 = mul nuw nsw i64 %111, 2734261102
  %136 = add nuw nsw i64 %134, %135
  %137 = trunc i64 %136 to i32
  %138 = lshr i64 %136, 32
  %139 = trunc i64 %138 to i32
  %140 = add nsw i32 %108, -120
  %141 = icmp ugt i32 %140, 63
  %142 = select i1 %141, i32 %133, i32 %139
  %143 = select i1 %141, i32 %129, i32 %137
  %144 = select i1 %141, i32 %125, i32 %133
  %145 = select i1 %141, i32 %121, i32 %129
  %146 = select i1 %141, i32 %117, i32 %125
  %147 = select i1 %141, i32 %113, i32 %121
  %148 = select i1 %141, i32 -64, i32 0
  %149 = add nsw i32 %148, %140
  %150 = icmp ugt i32 %149, 31
  %151 = select i1 %150, i32 %143, i32 %142
  %152 = select i1 %150, i32 %144, i32 %143
  %153 = select i1 %150, i32 %145, i32 %144
  %154 = select i1 %150, i32 %146, i32 %145
  %155 = select i1 %150, i32 %147, i32 %146
  %156 = select i1 %150, i32 -32, i32 0
  %157 = add nsw i32 %156, %149
  %158 = icmp ugt i32 %157, 31
  %159 = select i1 %158, i32 %152, i32 %151
  %160 = select i1 %158, i32 %153, i32 %152
  %161 = select i1 %158, i32 %154, i32 %153
  %162 = select i1 %158, i32 %155, i32 %154
  %163 = select i1 %158, i32 -32, i32 0
  %164 = add nsw i32 %163, %157
  %165 = icmp eq i32 %164, 0
  %166 = sub nsw i32 32, %164
  %167 = tail call i32 @llvm.fshr.i32(i32 %159, i32 %160, i32 %166)
  %168 = tail call i32 @llvm.fshr.i32(i32 %160, i32 %161, i32 %166)
  %169 = tail call i32 @llvm.fshr.i32(i32 %161, i32 %162, i32 %166)
  %170 = select i1 %165, i32 %159, i32 %167
  %171 = select i1 %165, i32 %160, i32 %168
  %172 = select i1 %165, i32 %161, i32 %169
  %173 = lshr i32 %170, 29
  %174 = tail call i32 @llvm.fshl.i32(i32 %170, i32 %171, i32 2)
  %175 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %172, i32 2)
  %176 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %162, i32 2)
  %177 = and i32 %173, 1
  %178 = sub nsw i32 0, %177
  %179 = shl i32 %173, 31
  %180 = xor i32 %174, %178
  %181 = xor i32 %175, %178
  %182 = xor i32 %176, %178
  %183 = tail call i32 @llvm.ctlz.i32(i32 %180, i1 false), !range !20
  %184 = sub nsw i32 31, %183
  %185 = tail call i32 @llvm.fshr.i32(i32 %180, i32 %181, i32 %184)
  %186 = tail call i32 @llvm.fshr.i32(i32 %181, i32 %182, i32 %184)
  %187 = shl nuw nsw i32 %183, 23
  %188 = sub nuw nsw i32 1056964608, %187
  %189 = lshr i32 %185, 9
  %190 = or i32 %189, %188
  %191 = or i32 %190, %179
  %192 = bitcast i32 %191 to float
  %193 = tail call i32 @llvm.fshl.i32(i32 %185, i32 %186, i32 23)
  %194 = tail call i32 @llvm.ctlz.i32(i32 %193, i1 false), !range !20
  %195 = fmul float %192, 0x3FF921FB40000000
  %196 = add nuw nsw i32 %194, %183
  %197 = shl nuw nsw i32 %196, 23
  %198 = sub nuw nsw i32 855638016, %197
  %199 = sub nsw i32 31, %194
  %200 = tail call i32 @llvm.fshr.i32(i32 %193, i32 %186, i32 %199)
  %201 = lshr i32 %200, 9
  %202 = or i32 %198, %201
  %203 = or i32 %202, %179
  %204 = bitcast i32 %203 to float
  %205 = fneg float %195
  %206 = tail call float @llvm.fma.f32(float %192, float 0x3FF921FB40000000, float %205)
  %207 = tail call float @llvm.fma.f32(float %192, float 0x3E74442D00000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %204, float 0x3FF921FB40000000, float %207)
  %209 = fadd float %195, %208
  %210 = lshr i32 %170, 30
  %211 = add nuw nsw i32 %177, %210
  br label %212

212:                                              ; preds = %99, %106
  %213 = phi float [ %104, %99 ], [ %209, %106 ]
  %214 = phi i32 [ %105, %99 ], [ %211, %106 ]
  %215 = fmul float %213, %213
  %216 = tail call float @llvm.fmuladd.f32(float %215, float 0xBF29833040000000, float 0x3F81103880000000)
  %217 = tail call float @llvm.fmuladd.f32(float %215, float %216, float 0xBFC55553A0000000)
  %218 = fmul float %215, %217
  %219 = tail call float @llvm.fmuladd.f32(float %213, float %218, float %213)
  %220 = tail call float @llvm.fmuladd.f32(float %215, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %221 = tail call float @llvm.fmuladd.f32(float %215, float %220, float 0x3FA5557EE0000000)
  %222 = tail call float @llvm.fmuladd.f32(float %215, float %221, float 0xBFE0000080000000)
  %223 = tail call float @llvm.fmuladd.f32(float %215, float %222, float 1.000000e+00)
  %224 = fneg float %219
  %225 = and i32 %214, 1
  %226 = icmp eq i32 %225, 0
  %227 = select i1 %226, float %223, float %224
  %228 = bitcast float %227 to i32
  %229 = shl i32 %214, 30
  %230 = and i32 %229, -2147483648
  %231 = xor i32 %230, %228
  %232 = bitcast i32 %231 to float
  %233 = tail call i1 @llvm.amdgcn.class.f32(float %97, i32 504)
  %234 = select i1 %233, float %232, float 0x7FF8000000000000
  %235 = fmul contract float %96, %234
  %236 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %51
  %237 = load i32, i32 addrspace(1)* %236, align 4, !tbaa !21, !amdgpu.noclobber !6
  %238 = mul nsw i32 %48, %2
  %239 = add nsw i32 %237, %238
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %14, i64 %240
  store float %235, float addrspace(1)* %241, align 4, !tbaa !16
  %242 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %243 = tail call float @llvm.fabs.f32(float %94)
  %244 = fcmp olt float %243, 1.310720e+05
  br i1 %244, label %245, label %253

245:                                              ; preds = %212
  %246 = fmul float %243, 0x3FE45F3060000000
  %247 = tail call float @llvm.rint.f32(float %246)
  %248 = tail call float @llvm.fma.f32(float %247, float 0xBFF921FB40000000, float %243)
  %249 = tail call float @llvm.fma.f32(float %247, float 0xBE74442D00000000, float %248)
  %250 = tail call float @llvm.fma.f32(float %247, float 0xBCF8469880000000, float %249)
  %251 = fptosi float %247 to i32
  %252 = bitcast float %243 to i32
  br label %359

253:                                              ; preds = %212
  %254 = bitcast float %243 to i32
  %255 = lshr i32 %254, 23
  %256 = and i32 %254, 8388607
  %257 = or i32 %256, 8388608
  %258 = zext i32 %257 to i64
  %259 = mul nuw nsw i64 %258, 4266746795
  %260 = trunc i64 %259 to i32
  %261 = lshr i64 %259, 32
  %262 = mul nuw nsw i64 %258, 1011060801
  %263 = add nuw nsw i64 %261, %262
  %264 = trunc i64 %263 to i32
  %265 = lshr i64 %263, 32
  %266 = mul nuw nsw i64 %258, 3680671129
  %267 = add nuw nsw i64 %265, %266
  %268 = trunc i64 %267 to i32
  %269 = lshr i64 %267, 32
  %270 = mul nuw nsw i64 %258, 4113882560
  %271 = add nuw nsw i64 %269, %270
  %272 = trunc i64 %271 to i32
  %273 = lshr i64 %271, 32
  %274 = mul nuw nsw i64 %258, 4230436817
  %275 = add nuw nsw i64 %273, %274
  %276 = trunc i64 %275 to i32
  %277 = lshr i64 %275, 32
  %278 = mul nuw nsw i64 %258, 1313084713
  %279 = add nuw nsw i64 %277, %278
  %280 = trunc i64 %279 to i32
  %281 = lshr i64 %279, 32
  %282 = mul nuw nsw i64 %258, 2734261102
  %283 = add nuw nsw i64 %281, %282
  %284 = trunc i64 %283 to i32
  %285 = lshr i64 %283, 32
  %286 = trunc i64 %285 to i32
  %287 = add nsw i32 %255, -120
  %288 = icmp ugt i32 %287, 63
  %289 = select i1 %288, i32 %280, i32 %286
  %290 = select i1 %288, i32 %276, i32 %284
  %291 = select i1 %288, i32 %272, i32 %280
  %292 = select i1 %288, i32 %268, i32 %276
  %293 = select i1 %288, i32 %264, i32 %272
  %294 = select i1 %288, i32 %260, i32 %268
  %295 = select i1 %288, i32 -64, i32 0
  %296 = add nsw i32 %295, %287
  %297 = icmp ugt i32 %296, 31
  %298 = select i1 %297, i32 %290, i32 %289
  %299 = select i1 %297, i32 %291, i32 %290
  %300 = select i1 %297, i32 %292, i32 %291
  %301 = select i1 %297, i32 %293, i32 %292
  %302 = select i1 %297, i32 %294, i32 %293
  %303 = select i1 %297, i32 -32, i32 0
  %304 = add nsw i32 %303, %296
  %305 = icmp ugt i32 %304, 31
  %306 = select i1 %305, i32 %299, i32 %298
  %307 = select i1 %305, i32 %300, i32 %299
  %308 = select i1 %305, i32 %301, i32 %300
  %309 = select i1 %305, i32 %302, i32 %301
  %310 = select i1 %305, i32 -32, i32 0
  %311 = add nsw i32 %310, %304
  %312 = icmp eq i32 %311, 0
  %313 = sub nsw i32 32, %311
  %314 = tail call i32 @llvm.fshr.i32(i32 %306, i32 %307, i32 %313)
  %315 = tail call i32 @llvm.fshr.i32(i32 %307, i32 %308, i32 %313)
  %316 = tail call i32 @llvm.fshr.i32(i32 %308, i32 %309, i32 %313)
  %317 = select i1 %312, i32 %306, i32 %314
  %318 = select i1 %312, i32 %307, i32 %315
  %319 = select i1 %312, i32 %308, i32 %316
  %320 = lshr i32 %317, 29
  %321 = tail call i32 @llvm.fshl.i32(i32 %317, i32 %318, i32 2)
  %322 = tail call i32 @llvm.fshl.i32(i32 %318, i32 %319, i32 2)
  %323 = tail call i32 @llvm.fshl.i32(i32 %319, i32 %309, i32 2)
  %324 = and i32 %320, 1
  %325 = sub nsw i32 0, %324
  %326 = shl i32 %320, 31
  %327 = xor i32 %321, %325
  %328 = xor i32 %322, %325
  %329 = xor i32 %323, %325
  %330 = tail call i32 @llvm.ctlz.i32(i32 %327, i1 false), !range !20
  %331 = sub nsw i32 31, %330
  %332 = tail call i32 @llvm.fshr.i32(i32 %327, i32 %328, i32 %331)
  %333 = tail call i32 @llvm.fshr.i32(i32 %328, i32 %329, i32 %331)
  %334 = shl nuw nsw i32 %330, 23
  %335 = sub nuw nsw i32 1056964608, %334
  %336 = lshr i32 %332, 9
  %337 = or i32 %336, %335
  %338 = or i32 %337, %326
  %339 = bitcast i32 %338 to float
  %340 = tail call i32 @llvm.fshl.i32(i32 %332, i32 %333, i32 23)
  %341 = tail call i32 @llvm.ctlz.i32(i32 %340, i1 false), !range !20
  %342 = fmul float %339, 0x3FF921FB40000000
  %343 = add nuw nsw i32 %341, %330
  %344 = shl nuw nsw i32 %343, 23
  %345 = sub nuw nsw i32 855638016, %344
  %346 = sub nsw i32 31, %341
  %347 = tail call i32 @llvm.fshr.i32(i32 %340, i32 %333, i32 %346)
  %348 = lshr i32 %347, 9
  %349 = or i32 %345, %348
  %350 = or i32 %349, %326
  %351 = bitcast i32 %350 to float
  %352 = fneg float %342
  %353 = tail call float @llvm.fma.f32(float %339, float 0x3FF921FB40000000, float %352)
  %354 = tail call float @llvm.fma.f32(float %339, float 0x3E74442D00000000, float %353)
  %355 = tail call float @llvm.fma.f32(float %351, float 0x3FF921FB40000000, float %354)
  %356 = fadd float %342, %355
  %357 = lshr i32 %317, 30
  %358 = add nuw nsw i32 %324, %357
  br label %359

359:                                              ; preds = %245, %253
  %360 = phi i32 [ %252, %245 ], [ %254, %253 ]
  %361 = phi float [ %250, %245 ], [ %356, %253 ]
  %362 = phi i32 [ %251, %245 ], [ %358, %253 ]
  %363 = fmul float %361, %361
  %364 = tail call float @llvm.fmuladd.f32(float %363, float 0xBF29833040000000, float 0x3F81103880000000)
  %365 = tail call float @llvm.fmuladd.f32(float %363, float %364, float 0xBFC55553A0000000)
  %366 = fmul float %363, %365
  %367 = tail call float @llvm.fmuladd.f32(float %361, float %366, float %361)
  %368 = tail call float @llvm.fmuladd.f32(float %363, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %369 = tail call float @llvm.fmuladd.f32(float %363, float %368, float 0x3FA5557EE0000000)
  %370 = tail call float @llvm.fmuladd.f32(float %363, float %369, float 0xBFE0000080000000)
  %371 = tail call float @llvm.fmuladd.f32(float %363, float %370, float 1.000000e+00)
  %372 = and i32 %362, 1
  %373 = icmp eq i32 %372, 0
  %374 = select i1 %373, float %367, float %371
  %375 = bitcast float %374 to i32
  %376 = shl i32 %362, 30
  %377 = and i32 %376, -2147483648
  %378 = bitcast float %94 to i32
  %379 = xor i32 %360, %378
  %380 = xor i32 %379, %377
  %381 = xor i32 %380, %375
  %382 = bitcast i32 %381 to float
  %383 = tail call i1 @llvm.amdgcn.class.f32(float %243, i32 504)
  %384 = select i1 %383, float %382, float 0x7FF8000000000000
  %385 = fmul contract float %242, %384
  %386 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %51
  %387 = load i32, i32 addrspace(1)* %386, align 4, !tbaa !21, !amdgpu.noclobber !6
  %388 = add nsw i32 %387, %238
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds float, float addrspace(1)* %14, i64 %389
  store float %385, float addrspace(1)* %390, align 4, !tbaa !16
  br label %391

391:                                              ; preds = %359, %16
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i32 0, i32 33}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !18, i64 0}
