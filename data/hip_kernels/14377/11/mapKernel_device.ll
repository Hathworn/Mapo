; ModuleID = '../data/hip_kernels/14377/11/main.cu'
source_filename = "../data/hip_kernels/14377/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z9mapKernelPfiff(float addrspace(1)* nocapture writeonly %0, i32 %1, float %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sitofp i32 %13 to float
  %15 = fmul contract float %14, %3
  %16 = fadd contract float %15, %2
  switch i32 %1, label %297 [
    i32 0, label %17
    i32 1, label %153
  ]

17:                                               ; preds = %4
  %18 = tail call float @llvm.fabs.f32(float %16)
  %19 = fcmp olt float %18, 1.310720e+05
  br i1 %19, label %20, label %27

20:                                               ; preds = %17
  %21 = fmul float %18, 0x3FE45F3060000000
  %22 = tail call float @llvm.rint.f32(float %21)
  %23 = tail call float @llvm.fma.f32(float %22, float 0xBFF921FB40000000, float %18)
  %24 = tail call float @llvm.fma.f32(float %22, float 0xBE74442D00000000, float %23)
  %25 = tail call float @llvm.fma.f32(float %22, float 0xBCF8469880000000, float %24)
  %26 = fptosi float %22 to i32
  br label %133

27:                                               ; preds = %17
  %28 = bitcast float %18 to i32
  %29 = lshr i32 %28, 23
  %30 = and i32 %28, 8388607
  %31 = or i32 %30, 8388608
  %32 = zext i32 %31 to i64
  %33 = mul nuw nsw i64 %32, 4266746795
  %34 = trunc i64 %33 to i32
  %35 = lshr i64 %33, 32
  %36 = mul nuw nsw i64 %32, 1011060801
  %37 = add nuw nsw i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %37, 32
  %40 = mul nuw nsw i64 %32, 3680671129
  %41 = add nuw nsw i64 %39, %40
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %41, 32
  %44 = mul nuw nsw i64 %32, 4113882560
  %45 = add nuw nsw i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %32, 4230436817
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %32, 1313084713
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %32, 2734261102
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = trunc i64 %59 to i32
  %61 = add nsw i32 %29, -120
  %62 = icmp ugt i32 %61, 63
  %63 = select i1 %62, i32 %54, i32 %60
  %64 = select i1 %62, i32 %50, i32 %58
  %65 = select i1 %62, i32 %46, i32 %54
  %66 = select i1 %62, i32 %42, i32 %50
  %67 = select i1 %62, i32 %38, i32 %46
  %68 = select i1 %62, i32 %34, i32 %42
  %69 = select i1 %62, i32 -64, i32 0
  %70 = add nsw i32 %69, %61
  %71 = icmp ugt i32 %70, 31
  %72 = select i1 %71, i32 %64, i32 %63
  %73 = select i1 %71, i32 %65, i32 %64
  %74 = select i1 %71, i32 %66, i32 %65
  %75 = select i1 %71, i32 %67, i32 %66
  %76 = select i1 %71, i32 %68, i32 %67
  %77 = select i1 %71, i32 -32, i32 0
  %78 = add nsw i32 %77, %70
  %79 = icmp ugt i32 %78, 31
  %80 = select i1 %79, i32 %73, i32 %72
  %81 = select i1 %79, i32 %74, i32 %73
  %82 = select i1 %79, i32 %75, i32 %74
  %83 = select i1 %79, i32 %76, i32 %75
  %84 = select i1 %79, i32 -32, i32 0
  %85 = add nsw i32 %84, %78
  %86 = icmp eq i32 %85, 0
  %87 = sub nsw i32 32, %85
  %88 = tail call i32 @llvm.fshr.i32(i32 %80, i32 %81, i32 %87)
  %89 = tail call i32 @llvm.fshr.i32(i32 %81, i32 %82, i32 %87)
  %90 = tail call i32 @llvm.fshr.i32(i32 %82, i32 %83, i32 %87)
  %91 = select i1 %86, i32 %80, i32 %88
  %92 = select i1 %86, i32 %81, i32 %89
  %93 = select i1 %86, i32 %82, i32 %90
  %94 = lshr i32 %91, 29
  %95 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %92, i32 2)
  %96 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %93, i32 2)
  %97 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %83, i32 2)
  %98 = and i32 %94, 1
  %99 = sub nsw i32 0, %98
  %100 = shl i32 %94, 31
  %101 = xor i32 %95, %99
  %102 = xor i32 %96, %99
  %103 = xor i32 %97, %99
  %104 = tail call i32 @llvm.ctlz.i32(i32 %101, i1 false), !range !7
  %105 = sub nsw i32 31, %104
  %106 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %105)
  %107 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %105)
  %108 = shl nuw nsw i32 %104, 23
  %109 = sub nuw nsw i32 1056964608, %108
  %110 = lshr i32 %106, 9
  %111 = or i32 %110, %109
  %112 = or i32 %111, %100
  %113 = bitcast i32 %112 to float
  %114 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 23)
  %115 = tail call i32 @llvm.ctlz.i32(i32 %114, i1 false), !range !7
  %116 = fmul float %113, 0x3FF921FB40000000
  %117 = add nuw nsw i32 %115, %104
  %118 = shl nuw nsw i32 %117, 23
  %119 = sub nuw nsw i32 855638016, %118
  %120 = sub nsw i32 31, %115
  %121 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %107, i32 %120)
  %122 = lshr i32 %121, 9
  %123 = or i32 %119, %122
  %124 = or i32 %123, %100
  %125 = bitcast i32 %124 to float
  %126 = fneg float %116
  %127 = tail call float @llvm.fma.f32(float %113, float 0x3FF921FB40000000, float %126)
  %128 = tail call float @llvm.fma.f32(float %113, float 0x3E74442D00000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %125, float 0x3FF921FB40000000, float %128)
  %130 = fadd float %116, %129
  %131 = lshr i32 %91, 30
  %132 = add nuw nsw i32 %98, %131
  br label %133

133:                                              ; preds = %20, %27
  %134 = phi float [ %25, %20 ], [ %130, %27 ]
  %135 = phi i32 [ %26, %20 ], [ %132, %27 ]
  %136 = fmul float %134, %134
  %137 = tail call float @llvm.fmuladd.f32(float %136, float 0xBF29833040000000, float 0x3F81103880000000)
  %138 = tail call float @llvm.fmuladd.f32(float %136, float %137, float 0xBFC55553A0000000)
  %139 = fmul float %136, %138
  %140 = tail call float @llvm.fmuladd.f32(float %134, float %139, float %134)
  %141 = tail call float @llvm.fmuladd.f32(float %136, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %142 = tail call float @llvm.fmuladd.f32(float %136, float %141, float 0x3FA5557EE0000000)
  %143 = tail call float @llvm.fmuladd.f32(float %136, float %142, float 0xBFE0000080000000)
  %144 = tail call float @llvm.fmuladd.f32(float %136, float %143, float 1.000000e+00)
  %145 = fneg float %140
  %146 = and i32 %135, 1
  %147 = icmp eq i32 %146, 0
  %148 = select i1 %147, float %144, float %145
  %149 = bitcast float %148 to i32
  %150 = shl i32 %135, 30
  %151 = and i32 %150, -2147483648
  %152 = xor i32 %151, %149
  br label %437

153:                                              ; preds = %4
  %154 = tail call float @llvm.fabs.f32(float %16)
  %155 = fcmp olt float %154, 1.310720e+05
  br i1 %155, label %156, label %164

156:                                              ; preds = %153
  %157 = fmul float %154, 0x3FE45F3060000000
  %158 = tail call float @llvm.rint.f32(float %157)
  %159 = tail call float @llvm.fma.f32(float %158, float 0xBFF921FB40000000, float %154)
  %160 = tail call float @llvm.fma.f32(float %158, float 0xBE74442D00000000, float %159)
  %161 = tail call float @llvm.fma.f32(float %158, float 0xBCF8469880000000, float %160)
  %162 = fptosi float %158 to i32
  %163 = bitcast float %154 to i32
  br label %270

164:                                              ; preds = %153
  %165 = bitcast float %154 to i32
  %166 = lshr i32 %165, 23
  %167 = and i32 %165, 8388607
  %168 = or i32 %167, 8388608
  %169 = zext i32 %168 to i64
  %170 = mul nuw nsw i64 %169, 4266746795
  %171 = trunc i64 %170 to i32
  %172 = lshr i64 %170, 32
  %173 = mul nuw nsw i64 %169, 1011060801
  %174 = add nuw nsw i64 %172, %173
  %175 = trunc i64 %174 to i32
  %176 = lshr i64 %174, 32
  %177 = mul nuw nsw i64 %169, 3680671129
  %178 = add nuw nsw i64 %176, %177
  %179 = trunc i64 %178 to i32
  %180 = lshr i64 %178, 32
  %181 = mul nuw nsw i64 %169, 4113882560
  %182 = add nuw nsw i64 %180, %181
  %183 = trunc i64 %182 to i32
  %184 = lshr i64 %182, 32
  %185 = mul nuw nsw i64 %169, 4230436817
  %186 = add nuw nsw i64 %184, %185
  %187 = trunc i64 %186 to i32
  %188 = lshr i64 %186, 32
  %189 = mul nuw nsw i64 %169, 1313084713
  %190 = add nuw nsw i64 %188, %189
  %191 = trunc i64 %190 to i32
  %192 = lshr i64 %190, 32
  %193 = mul nuw nsw i64 %169, 2734261102
  %194 = add nuw nsw i64 %192, %193
  %195 = trunc i64 %194 to i32
  %196 = lshr i64 %194, 32
  %197 = trunc i64 %196 to i32
  %198 = add nsw i32 %166, -120
  %199 = icmp ugt i32 %198, 63
  %200 = select i1 %199, i32 %191, i32 %197
  %201 = select i1 %199, i32 %187, i32 %195
  %202 = select i1 %199, i32 %183, i32 %191
  %203 = select i1 %199, i32 %179, i32 %187
  %204 = select i1 %199, i32 %175, i32 %183
  %205 = select i1 %199, i32 %171, i32 %179
  %206 = select i1 %199, i32 -64, i32 0
  %207 = add nsw i32 %206, %198
  %208 = icmp ugt i32 %207, 31
  %209 = select i1 %208, i32 %201, i32 %200
  %210 = select i1 %208, i32 %202, i32 %201
  %211 = select i1 %208, i32 %203, i32 %202
  %212 = select i1 %208, i32 %204, i32 %203
  %213 = select i1 %208, i32 %205, i32 %204
  %214 = select i1 %208, i32 -32, i32 0
  %215 = add nsw i32 %214, %207
  %216 = icmp ugt i32 %215, 31
  %217 = select i1 %216, i32 %210, i32 %209
  %218 = select i1 %216, i32 %211, i32 %210
  %219 = select i1 %216, i32 %212, i32 %211
  %220 = select i1 %216, i32 %213, i32 %212
  %221 = select i1 %216, i32 -32, i32 0
  %222 = add nsw i32 %221, %215
  %223 = icmp eq i32 %222, 0
  %224 = sub nsw i32 32, %222
  %225 = tail call i32 @llvm.fshr.i32(i32 %217, i32 %218, i32 %224)
  %226 = tail call i32 @llvm.fshr.i32(i32 %218, i32 %219, i32 %224)
  %227 = tail call i32 @llvm.fshr.i32(i32 %219, i32 %220, i32 %224)
  %228 = select i1 %223, i32 %217, i32 %225
  %229 = select i1 %223, i32 %218, i32 %226
  %230 = select i1 %223, i32 %219, i32 %227
  %231 = lshr i32 %228, 29
  %232 = tail call i32 @llvm.fshl.i32(i32 %228, i32 %229, i32 2)
  %233 = tail call i32 @llvm.fshl.i32(i32 %229, i32 %230, i32 2)
  %234 = tail call i32 @llvm.fshl.i32(i32 %230, i32 %220, i32 2)
  %235 = and i32 %231, 1
  %236 = sub nsw i32 0, %235
  %237 = shl i32 %231, 31
  %238 = xor i32 %232, %236
  %239 = xor i32 %233, %236
  %240 = xor i32 %234, %236
  %241 = tail call i32 @llvm.ctlz.i32(i32 %238, i1 false), !range !7
  %242 = sub nsw i32 31, %241
  %243 = tail call i32 @llvm.fshr.i32(i32 %238, i32 %239, i32 %242)
  %244 = tail call i32 @llvm.fshr.i32(i32 %239, i32 %240, i32 %242)
  %245 = shl nuw nsw i32 %241, 23
  %246 = sub nuw nsw i32 1056964608, %245
  %247 = lshr i32 %243, 9
  %248 = or i32 %247, %246
  %249 = or i32 %248, %237
  %250 = bitcast i32 %249 to float
  %251 = tail call i32 @llvm.fshl.i32(i32 %243, i32 %244, i32 23)
  %252 = tail call i32 @llvm.ctlz.i32(i32 %251, i1 false), !range !7
  %253 = fmul float %250, 0x3FF921FB40000000
  %254 = add nuw nsw i32 %252, %241
  %255 = shl nuw nsw i32 %254, 23
  %256 = sub nuw nsw i32 855638016, %255
  %257 = sub nsw i32 31, %252
  %258 = tail call i32 @llvm.fshr.i32(i32 %251, i32 %244, i32 %257)
  %259 = lshr i32 %258, 9
  %260 = or i32 %256, %259
  %261 = or i32 %260, %237
  %262 = bitcast i32 %261 to float
  %263 = fneg float %253
  %264 = tail call float @llvm.fma.f32(float %250, float 0x3FF921FB40000000, float %263)
  %265 = tail call float @llvm.fma.f32(float %250, float 0x3E74442D00000000, float %264)
  %266 = tail call float @llvm.fma.f32(float %262, float 0x3FF921FB40000000, float %265)
  %267 = fadd float %253, %266
  %268 = lshr i32 %228, 30
  %269 = add nuw nsw i32 %235, %268
  br label %270

270:                                              ; preds = %156, %164
  %271 = phi i32 [ %163, %156 ], [ %165, %164 ]
  %272 = phi float [ %161, %156 ], [ %267, %164 ]
  %273 = phi i32 [ %162, %156 ], [ %269, %164 ]
  %274 = and i32 %273, 1
  %275 = fmul float %272, %272
  %276 = tail call float @llvm.fmuladd.f32(float %275, float 0xBF919DBA60000000, float 0x3FD8A8B0E0000000)
  %277 = tail call float @llvm.fmuladd.f32(float %275, float 0x3F92E29000000000, float 0xBFE07266E0000000)
  %278 = tail call float @llvm.fmuladd.f32(float %275, float %277, float 0x3FF27E84A0000000)
  %279 = tail call float @llvm.amdgcn.rcp.f32(float %278)
  %280 = fmul float %276, %279
  %281 = fmul float %275, %280
  %282 = tail call float @llvm.fma.f32(float %281, float %272, float %272)
  %283 = fsub float %282, %272
  %284 = fneg float %283
  %285 = tail call float @llvm.fma.f32(float %281, float %272, float %284)
  %286 = tail call float @llvm.amdgcn.rcp.f32(float %282)
  %287 = fneg float %286
  %288 = tail call float @llvm.fma.f32(float %282, float %287, float 1.000000e+00)
  %289 = tail call float @llvm.fma.f32(float %285, float %287, float %288)
  %290 = tail call float @llvm.fma.f32(float %289, float %287, float %287)
  %291 = icmp eq i32 %274, 0
  %292 = select i1 %291, float %282, float %290
  %293 = bitcast float %292 to i32
  %294 = bitcast float %16 to i32
  %295 = xor i32 %271, %294
  %296 = xor i32 %295, %293
  br label %437

297:                                              ; preds = %4
  %298 = tail call float @llvm.fabs.f32(float %16)
  %299 = fcmp olt float %298, 1.310720e+05
  br i1 %299, label %300, label %308

300:                                              ; preds = %297
  %301 = fmul float %298, 0x3FE45F3060000000
  %302 = tail call float @llvm.rint.f32(float %301)
  %303 = tail call float @llvm.fma.f32(float %302, float 0xBFF921FB40000000, float %298)
  %304 = tail call float @llvm.fma.f32(float %302, float 0xBE74442D00000000, float %303)
  %305 = tail call float @llvm.fma.f32(float %302, float 0xBCF8469880000000, float %304)
  %306 = fptosi float %302 to i32
  %307 = bitcast float %298 to i32
  br label %414

308:                                              ; preds = %297
  %309 = bitcast float %298 to i32
  %310 = lshr i32 %309, 23
  %311 = and i32 %309, 8388607
  %312 = or i32 %311, 8388608
  %313 = zext i32 %312 to i64
  %314 = mul nuw nsw i64 %313, 4266746795
  %315 = trunc i64 %314 to i32
  %316 = lshr i64 %314, 32
  %317 = mul nuw nsw i64 %313, 1011060801
  %318 = add nuw nsw i64 %316, %317
  %319 = trunc i64 %318 to i32
  %320 = lshr i64 %318, 32
  %321 = mul nuw nsw i64 %313, 3680671129
  %322 = add nuw nsw i64 %320, %321
  %323 = trunc i64 %322 to i32
  %324 = lshr i64 %322, 32
  %325 = mul nuw nsw i64 %313, 4113882560
  %326 = add nuw nsw i64 %324, %325
  %327 = trunc i64 %326 to i32
  %328 = lshr i64 %326, 32
  %329 = mul nuw nsw i64 %313, 4230436817
  %330 = add nuw nsw i64 %328, %329
  %331 = trunc i64 %330 to i32
  %332 = lshr i64 %330, 32
  %333 = mul nuw nsw i64 %313, 1313084713
  %334 = add nuw nsw i64 %332, %333
  %335 = trunc i64 %334 to i32
  %336 = lshr i64 %334, 32
  %337 = mul nuw nsw i64 %313, 2734261102
  %338 = add nuw nsw i64 %336, %337
  %339 = trunc i64 %338 to i32
  %340 = lshr i64 %338, 32
  %341 = trunc i64 %340 to i32
  %342 = add nsw i32 %310, -120
  %343 = icmp ugt i32 %342, 63
  %344 = select i1 %343, i32 %335, i32 %341
  %345 = select i1 %343, i32 %331, i32 %339
  %346 = select i1 %343, i32 %327, i32 %335
  %347 = select i1 %343, i32 %323, i32 %331
  %348 = select i1 %343, i32 %319, i32 %327
  %349 = select i1 %343, i32 %315, i32 %323
  %350 = select i1 %343, i32 -64, i32 0
  %351 = add nsw i32 %350, %342
  %352 = icmp ugt i32 %351, 31
  %353 = select i1 %352, i32 %345, i32 %344
  %354 = select i1 %352, i32 %346, i32 %345
  %355 = select i1 %352, i32 %347, i32 %346
  %356 = select i1 %352, i32 %348, i32 %347
  %357 = select i1 %352, i32 %349, i32 %348
  %358 = select i1 %352, i32 -32, i32 0
  %359 = add nsw i32 %358, %351
  %360 = icmp ugt i32 %359, 31
  %361 = select i1 %360, i32 %354, i32 %353
  %362 = select i1 %360, i32 %355, i32 %354
  %363 = select i1 %360, i32 %356, i32 %355
  %364 = select i1 %360, i32 %357, i32 %356
  %365 = select i1 %360, i32 -32, i32 0
  %366 = add nsw i32 %365, %359
  %367 = icmp eq i32 %366, 0
  %368 = sub nsw i32 32, %366
  %369 = tail call i32 @llvm.fshr.i32(i32 %361, i32 %362, i32 %368)
  %370 = tail call i32 @llvm.fshr.i32(i32 %362, i32 %363, i32 %368)
  %371 = tail call i32 @llvm.fshr.i32(i32 %363, i32 %364, i32 %368)
  %372 = select i1 %367, i32 %361, i32 %369
  %373 = select i1 %367, i32 %362, i32 %370
  %374 = select i1 %367, i32 %363, i32 %371
  %375 = lshr i32 %372, 29
  %376 = tail call i32 @llvm.fshl.i32(i32 %372, i32 %373, i32 2)
  %377 = tail call i32 @llvm.fshl.i32(i32 %373, i32 %374, i32 2)
  %378 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %364, i32 2)
  %379 = and i32 %375, 1
  %380 = sub nsw i32 0, %379
  %381 = shl i32 %375, 31
  %382 = xor i32 %376, %380
  %383 = xor i32 %377, %380
  %384 = xor i32 %378, %380
  %385 = tail call i32 @llvm.ctlz.i32(i32 %382, i1 false), !range !7
  %386 = sub nsw i32 31, %385
  %387 = tail call i32 @llvm.fshr.i32(i32 %382, i32 %383, i32 %386)
  %388 = tail call i32 @llvm.fshr.i32(i32 %383, i32 %384, i32 %386)
  %389 = shl nuw nsw i32 %385, 23
  %390 = sub nuw nsw i32 1056964608, %389
  %391 = lshr i32 %387, 9
  %392 = or i32 %391, %390
  %393 = or i32 %392, %381
  %394 = bitcast i32 %393 to float
  %395 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %388, i32 23)
  %396 = tail call i32 @llvm.ctlz.i32(i32 %395, i1 false), !range !7
  %397 = fmul float %394, 0x3FF921FB40000000
  %398 = add nuw nsw i32 %396, %385
  %399 = shl nuw nsw i32 %398, 23
  %400 = sub nuw nsw i32 855638016, %399
  %401 = sub nsw i32 31, %396
  %402 = tail call i32 @llvm.fshr.i32(i32 %395, i32 %388, i32 %401)
  %403 = lshr i32 %402, 9
  %404 = or i32 %400, %403
  %405 = or i32 %404, %381
  %406 = bitcast i32 %405 to float
  %407 = fneg float %397
  %408 = tail call float @llvm.fma.f32(float %394, float 0x3FF921FB40000000, float %407)
  %409 = tail call float @llvm.fma.f32(float %394, float 0x3E74442D00000000, float %408)
  %410 = tail call float @llvm.fma.f32(float %406, float 0x3FF921FB40000000, float %409)
  %411 = fadd float %397, %410
  %412 = lshr i32 %372, 30
  %413 = add nuw nsw i32 %379, %412
  br label %414

414:                                              ; preds = %300, %308
  %415 = phi i32 [ %307, %300 ], [ %309, %308 ]
  %416 = phi float [ %305, %300 ], [ %411, %308 ]
  %417 = phi i32 [ %306, %300 ], [ %413, %308 ]
  %418 = fmul float %416, %416
  %419 = tail call float @llvm.fmuladd.f32(float %418, float 0xBF29833040000000, float 0x3F81103880000000)
  %420 = tail call float @llvm.fmuladd.f32(float %418, float %419, float 0xBFC55553A0000000)
  %421 = fmul float %418, %420
  %422 = tail call float @llvm.fmuladd.f32(float %416, float %421, float %416)
  %423 = tail call float @llvm.fmuladd.f32(float %418, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %424 = tail call float @llvm.fmuladd.f32(float %418, float %423, float 0x3FA5557EE0000000)
  %425 = tail call float @llvm.fmuladd.f32(float %418, float %424, float 0xBFE0000080000000)
  %426 = tail call float @llvm.fmuladd.f32(float %418, float %425, float 1.000000e+00)
  %427 = and i32 %417, 1
  %428 = icmp eq i32 %427, 0
  %429 = select i1 %428, float %422, float %426
  %430 = bitcast float %429 to i32
  %431 = shl i32 %417, 30
  %432 = and i32 %431, -2147483648
  %433 = bitcast float %16 to i32
  %434 = xor i32 %415, %433
  %435 = xor i32 %434, %432
  %436 = xor i32 %435, %430
  br label %437

437:                                              ; preds = %414, %270, %133
  %438 = phi i32 [ %436, %414 ], [ %296, %270 ], [ %152, %133 ]
  %439 = phi float [ %298, %414 ], [ %154, %270 ], [ %18, %133 ]
  %440 = bitcast i32 %438 to float
  %441 = tail call i1 @llvm.amdgcn.class.f32(float %439, i32 504)
  %442 = select i1 %441, float %440, float 0x7FF8000000000000
  %443 = shl nsw i32 %13, 1
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds float, float addrspace(1)* %0, i64 %444
  store float %16, float addrspace(1)* %445, align 4, !tbaa !8
  %446 = add nuw nsw i32 %443, 1
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float addrspace(1)* %0, i64 %447
  store float %442, float addrspace(1)* %448, align 4, !tbaa !8
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
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
