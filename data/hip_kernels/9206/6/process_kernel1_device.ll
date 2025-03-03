; ModuleID = '../data/hip_kernels/9206/6/main.cu'
source_filename = "../data/hip_kernels/9206/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15process_kernel1PKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !15
  %22 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %5
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %34 = add i32 %31, %32
  %35 = mul i32 %34, %18
  %36 = add i32 %35, %33
  %37 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %38 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %39 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %40 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 4, !range !13, !invariant.load !14
  %43 = zext i16 %42 to i32
  %44 = mul i32 %36, %43
  %45 = add i32 %44, %37
  %46 = mul i32 %45, %25
  %47 = add i32 %46, %38
  %48 = mul i32 %47, %13
  %49 = add i32 %48, %39
  %50 = icmp slt i32 %49, %3
  br i1 %50, label %51, label %339

51:                                               ; preds = %4
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !17, !amdgpu.noclobber !14
  %55 = tail call float @llvm.fabs.f32(float %54)
  %56 = fcmp olt float %55, 1.310720e+05
  br i1 %56, label %57, label %65

57:                                               ; preds = %51
  %58 = fmul float %55, 0x3FE45F3060000000
  %59 = tail call float @llvm.rint.f32(float %58)
  %60 = tail call float @llvm.fma.f32(float %59, float 0xBFF921FB40000000, float %55)
  %61 = tail call float @llvm.fma.f32(float %59, float 0xBE74442D00000000, float %60)
  %62 = tail call float @llvm.fma.f32(float %59, float 0xBCF8469880000000, float %61)
  %63 = fptosi float %59 to i32
  %64 = bitcast float %55 to i32
  br label %171

65:                                               ; preds = %51
  %66 = bitcast float %55 to i32
  %67 = lshr i32 %66, 23
  %68 = and i32 %66, 8388607
  %69 = or i32 %68, 8388608
  %70 = zext i32 %69 to i64
  %71 = mul nuw nsw i64 %70, 4266746795
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %70, 1011060801
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = mul nuw nsw i64 %70, 3680671129
  %79 = add nuw nsw i64 %77, %78
  %80 = trunc i64 %79 to i32
  %81 = lshr i64 %79, 32
  %82 = mul nuw nsw i64 %70, 4113882560
  %83 = add nuw nsw i64 %81, %82
  %84 = trunc i64 %83 to i32
  %85 = lshr i64 %83, 32
  %86 = mul nuw nsw i64 %70, 4230436817
  %87 = add nuw nsw i64 %85, %86
  %88 = trunc i64 %87 to i32
  %89 = lshr i64 %87, 32
  %90 = mul nuw nsw i64 %70, 1313084713
  %91 = add nuw nsw i64 %89, %90
  %92 = trunc i64 %91 to i32
  %93 = lshr i64 %91, 32
  %94 = mul nuw nsw i64 %70, 2734261102
  %95 = add nuw nsw i64 %93, %94
  %96 = trunc i64 %95 to i32
  %97 = lshr i64 %95, 32
  %98 = trunc i64 %97 to i32
  %99 = add nsw i32 %67, -120
  %100 = icmp ugt i32 %99, 63
  %101 = select i1 %100, i32 %92, i32 %98
  %102 = select i1 %100, i32 %88, i32 %96
  %103 = select i1 %100, i32 %84, i32 %92
  %104 = select i1 %100, i32 %80, i32 %88
  %105 = select i1 %100, i32 %76, i32 %84
  %106 = select i1 %100, i32 %72, i32 %80
  %107 = select i1 %100, i32 -64, i32 0
  %108 = add nsw i32 %107, %99
  %109 = icmp ugt i32 %108, 31
  %110 = select i1 %109, i32 %102, i32 %101
  %111 = select i1 %109, i32 %103, i32 %102
  %112 = select i1 %109, i32 %104, i32 %103
  %113 = select i1 %109, i32 %105, i32 %104
  %114 = select i1 %109, i32 %106, i32 %105
  %115 = select i1 %109, i32 -32, i32 0
  %116 = add nsw i32 %115, %108
  %117 = icmp ugt i32 %116, 31
  %118 = select i1 %117, i32 %111, i32 %110
  %119 = select i1 %117, i32 %112, i32 %111
  %120 = select i1 %117, i32 %113, i32 %112
  %121 = select i1 %117, i32 %114, i32 %113
  %122 = select i1 %117, i32 -32, i32 0
  %123 = add nsw i32 %122, %116
  %124 = icmp eq i32 %123, 0
  %125 = sub nsw i32 32, %123
  %126 = tail call i32 @llvm.fshr.i32(i32 %118, i32 %119, i32 %125)
  %127 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %125)
  %128 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %125)
  %129 = select i1 %124, i32 %118, i32 %126
  %130 = select i1 %124, i32 %119, i32 %127
  %131 = select i1 %124, i32 %120, i32 %128
  %132 = lshr i32 %129, 29
  %133 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %130, i32 2)
  %134 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %131, i32 2)
  %135 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %121, i32 2)
  %136 = and i32 %132, 1
  %137 = sub nsw i32 0, %136
  %138 = shl i32 %132, 31
  %139 = xor i32 %133, %137
  %140 = xor i32 %134, %137
  %141 = xor i32 %135, %137
  %142 = tail call i32 @llvm.ctlz.i32(i32 %139, i1 false), !range !21
  %143 = sub nsw i32 31, %142
  %144 = tail call i32 @llvm.fshr.i32(i32 %139, i32 %140, i32 %143)
  %145 = tail call i32 @llvm.fshr.i32(i32 %140, i32 %141, i32 %143)
  %146 = shl nuw nsw i32 %142, 23
  %147 = sub nuw nsw i32 1056964608, %146
  %148 = lshr i32 %144, 9
  %149 = or i32 %148, %147
  %150 = or i32 %149, %138
  %151 = bitcast i32 %150 to float
  %152 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %145, i32 23)
  %153 = tail call i32 @llvm.ctlz.i32(i32 %152, i1 false), !range !21
  %154 = fmul float %151, 0x3FF921FB40000000
  %155 = add nuw nsw i32 %153, %142
  %156 = shl nuw nsw i32 %155, 23
  %157 = sub nuw nsw i32 855638016, %156
  %158 = sub nsw i32 31, %153
  %159 = tail call i32 @llvm.fshr.i32(i32 %152, i32 %145, i32 %158)
  %160 = lshr i32 %159, 9
  %161 = or i32 %157, %160
  %162 = or i32 %161, %138
  %163 = bitcast i32 %162 to float
  %164 = fneg float %154
  %165 = tail call float @llvm.fma.f32(float %151, float 0x3FF921FB40000000, float %164)
  %166 = tail call float @llvm.fma.f32(float %151, float 0x3E74442D00000000, float %165)
  %167 = tail call float @llvm.fma.f32(float %163, float 0x3FF921FB40000000, float %166)
  %168 = fadd float %154, %167
  %169 = lshr i32 %129, 30
  %170 = add nuw nsw i32 %136, %169
  br label %171

171:                                              ; preds = %57, %65
  %172 = phi i32 [ %64, %57 ], [ %66, %65 ]
  %173 = phi float [ %62, %57 ], [ %168, %65 ]
  %174 = phi i32 [ %63, %57 ], [ %170, %65 ]
  %175 = fmul float %173, %173
  %176 = tail call float @llvm.fmuladd.f32(float %175, float 0xBF29833040000000, float 0x3F81103880000000)
  %177 = tail call float @llvm.fmuladd.f32(float %175, float %176, float 0xBFC55553A0000000)
  %178 = fmul float %175, %177
  %179 = tail call float @llvm.fmuladd.f32(float %173, float %178, float %173)
  %180 = tail call float @llvm.fmuladd.f32(float %175, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %181 = tail call float @llvm.fmuladd.f32(float %175, float %180, float 0x3FA5557EE0000000)
  %182 = tail call float @llvm.fmuladd.f32(float %175, float %181, float 0xBFE0000080000000)
  %183 = tail call float @llvm.fmuladd.f32(float %175, float %182, float 1.000000e+00)
  %184 = and i32 %174, 1
  %185 = icmp eq i32 %184, 0
  %186 = select i1 %185, float %179, float %183
  %187 = bitcast float %186 to i32
  %188 = shl i32 %174, 30
  %189 = and i32 %188, -2147483648
  %190 = bitcast float %54 to i32
  %191 = xor i32 %172, %190
  %192 = xor i32 %191, %189
  %193 = xor i32 %192, %187
  %194 = bitcast i32 %193 to float
  %195 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 504)
  %196 = select i1 %195, float %194, float 0x7FF8000000000000
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !17, !amdgpu.noclobber !14
  %199 = tail call float @llvm.fabs.f32(float %198)
  %200 = fcmp olt float %199, 1.310720e+05
  br i1 %200, label %201, label %208

201:                                              ; preds = %171
  %202 = fmul float %199, 0x3FE45F3060000000
  %203 = tail call float @llvm.rint.f32(float %202)
  %204 = tail call float @llvm.fma.f32(float %203, float 0xBFF921FB40000000, float %199)
  %205 = tail call float @llvm.fma.f32(float %203, float 0xBE74442D00000000, float %204)
  %206 = tail call float @llvm.fma.f32(float %203, float 0xBCF8469880000000, float %205)
  %207 = fptosi float %203 to i32
  br label %314

208:                                              ; preds = %171
  %209 = bitcast float %199 to i32
  %210 = lshr i32 %209, 23
  %211 = and i32 %209, 8388607
  %212 = or i32 %211, 8388608
  %213 = zext i32 %212 to i64
  %214 = mul nuw nsw i64 %213, 4266746795
  %215 = trunc i64 %214 to i32
  %216 = lshr i64 %214, 32
  %217 = mul nuw nsw i64 %213, 1011060801
  %218 = add nuw nsw i64 %216, %217
  %219 = trunc i64 %218 to i32
  %220 = lshr i64 %218, 32
  %221 = mul nuw nsw i64 %213, 3680671129
  %222 = add nuw nsw i64 %220, %221
  %223 = trunc i64 %222 to i32
  %224 = lshr i64 %222, 32
  %225 = mul nuw nsw i64 %213, 4113882560
  %226 = add nuw nsw i64 %224, %225
  %227 = trunc i64 %226 to i32
  %228 = lshr i64 %226, 32
  %229 = mul nuw nsw i64 %213, 4230436817
  %230 = add nuw nsw i64 %228, %229
  %231 = trunc i64 %230 to i32
  %232 = lshr i64 %230, 32
  %233 = mul nuw nsw i64 %213, 1313084713
  %234 = add nuw nsw i64 %232, %233
  %235 = trunc i64 %234 to i32
  %236 = lshr i64 %234, 32
  %237 = mul nuw nsw i64 %213, 2734261102
  %238 = add nuw nsw i64 %236, %237
  %239 = trunc i64 %238 to i32
  %240 = lshr i64 %238, 32
  %241 = trunc i64 %240 to i32
  %242 = add nsw i32 %210, -120
  %243 = icmp ugt i32 %242, 63
  %244 = select i1 %243, i32 %235, i32 %241
  %245 = select i1 %243, i32 %231, i32 %239
  %246 = select i1 %243, i32 %227, i32 %235
  %247 = select i1 %243, i32 %223, i32 %231
  %248 = select i1 %243, i32 %219, i32 %227
  %249 = select i1 %243, i32 %215, i32 %223
  %250 = select i1 %243, i32 -64, i32 0
  %251 = add nsw i32 %250, %242
  %252 = icmp ugt i32 %251, 31
  %253 = select i1 %252, i32 %245, i32 %244
  %254 = select i1 %252, i32 %246, i32 %245
  %255 = select i1 %252, i32 %247, i32 %246
  %256 = select i1 %252, i32 %248, i32 %247
  %257 = select i1 %252, i32 %249, i32 %248
  %258 = select i1 %252, i32 -32, i32 0
  %259 = add nsw i32 %258, %251
  %260 = icmp ugt i32 %259, 31
  %261 = select i1 %260, i32 %254, i32 %253
  %262 = select i1 %260, i32 %255, i32 %254
  %263 = select i1 %260, i32 %256, i32 %255
  %264 = select i1 %260, i32 %257, i32 %256
  %265 = select i1 %260, i32 -32, i32 0
  %266 = add nsw i32 %265, %259
  %267 = icmp eq i32 %266, 0
  %268 = sub nsw i32 32, %266
  %269 = tail call i32 @llvm.fshr.i32(i32 %261, i32 %262, i32 %268)
  %270 = tail call i32 @llvm.fshr.i32(i32 %262, i32 %263, i32 %268)
  %271 = tail call i32 @llvm.fshr.i32(i32 %263, i32 %264, i32 %268)
  %272 = select i1 %267, i32 %261, i32 %269
  %273 = select i1 %267, i32 %262, i32 %270
  %274 = select i1 %267, i32 %263, i32 %271
  %275 = lshr i32 %272, 29
  %276 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %273, i32 2)
  %277 = tail call i32 @llvm.fshl.i32(i32 %273, i32 %274, i32 2)
  %278 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %264, i32 2)
  %279 = and i32 %275, 1
  %280 = sub nsw i32 0, %279
  %281 = shl i32 %275, 31
  %282 = xor i32 %276, %280
  %283 = xor i32 %277, %280
  %284 = xor i32 %278, %280
  %285 = tail call i32 @llvm.ctlz.i32(i32 %282, i1 false), !range !21
  %286 = sub nsw i32 31, %285
  %287 = tail call i32 @llvm.fshr.i32(i32 %282, i32 %283, i32 %286)
  %288 = tail call i32 @llvm.fshr.i32(i32 %283, i32 %284, i32 %286)
  %289 = shl nuw nsw i32 %285, 23
  %290 = sub nuw nsw i32 1056964608, %289
  %291 = lshr i32 %287, 9
  %292 = or i32 %291, %290
  %293 = or i32 %292, %281
  %294 = bitcast i32 %293 to float
  %295 = tail call i32 @llvm.fshl.i32(i32 %287, i32 %288, i32 23)
  %296 = tail call i32 @llvm.ctlz.i32(i32 %295, i1 false), !range !21
  %297 = fmul float %294, 0x3FF921FB40000000
  %298 = add nuw nsw i32 %296, %285
  %299 = shl nuw nsw i32 %298, 23
  %300 = sub nuw nsw i32 855638016, %299
  %301 = sub nsw i32 31, %296
  %302 = tail call i32 @llvm.fshr.i32(i32 %295, i32 %288, i32 %301)
  %303 = lshr i32 %302, 9
  %304 = or i32 %300, %303
  %305 = or i32 %304, %281
  %306 = bitcast i32 %305 to float
  %307 = fneg float %297
  %308 = tail call float @llvm.fma.f32(float %294, float 0x3FF921FB40000000, float %307)
  %309 = tail call float @llvm.fma.f32(float %294, float 0x3E74442D00000000, float %308)
  %310 = tail call float @llvm.fma.f32(float %306, float 0x3FF921FB40000000, float %309)
  %311 = fadd float %297, %310
  %312 = lshr i32 %272, 30
  %313 = add nuw nsw i32 %279, %312
  br label %314

314:                                              ; preds = %201, %208
  %315 = phi float [ %206, %201 ], [ %311, %208 ]
  %316 = phi i32 [ %207, %201 ], [ %313, %208 ]
  %317 = fmul float %315, %315
  %318 = tail call float @llvm.fmuladd.f32(float %317, float 0xBF29833040000000, float 0x3F81103880000000)
  %319 = tail call float @llvm.fmuladd.f32(float %317, float %318, float 0xBFC55553A0000000)
  %320 = fmul float %317, %319
  %321 = tail call float @llvm.fmuladd.f32(float %315, float %320, float %315)
  %322 = tail call float @llvm.fmuladd.f32(float %317, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %323 = tail call float @llvm.fmuladd.f32(float %317, float %322, float 0x3FA5557EE0000000)
  %324 = tail call float @llvm.fmuladd.f32(float %317, float %323, float 0xBFE0000080000000)
  %325 = tail call float @llvm.fmuladd.f32(float %317, float %324, float 1.000000e+00)
  %326 = fneg float %321
  %327 = and i32 %316, 1
  %328 = icmp eq i32 %327, 0
  %329 = select i1 %328, float %325, float %326
  %330 = bitcast float %329 to i32
  %331 = shl i32 %316, 30
  %332 = and i32 %331, -2147483648
  %333 = xor i32 %332, %330
  %334 = bitcast i32 %333 to float
  %335 = tail call i1 @llvm.amdgcn.class.f32(float %199, i32 504)
  %336 = select i1 %335, float %334, float 0x7FF8000000000000
  %337 = fadd contract float %196, %336
  %338 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  store float %337, float addrspace(1)* %338, align 4, !tbaa !17
  br label %339

339:                                              ; preds = %314, %4
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
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{i32 0, i32 33}
