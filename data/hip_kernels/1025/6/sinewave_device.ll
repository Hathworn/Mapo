; ModuleID = '../data/hip_kernels/1025/6/main.cu'
source_filename = "../data/hip_kernels/1025/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z8sinewavePfjjf(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %12
  %20 = mul i32 %17, %12
  %21 = zext i32 %20 to i64
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %19, %22
  %24 = mul i32 %2, %1
  %25 = zext i32 %24 to i64
  %26 = icmp ult i32 %23, %24
  br i1 %26, label %27, label %32

27:                                               ; preds = %4
  %28 = zext i32 %23 to i64
  %29 = zext i32 %1 to i64
  %30 = uitofp i32 %1 to float
  %31 = uitofp i32 %2 to float
  br label %33

32:                                               ; preds = %308, %4
  ret void

33:                                               ; preds = %27, %308
  %34 = phi i64 [ %28, %27 ], [ %333, %308 ]
  %35 = udiv i64 %34, %29
  %36 = mul i64 %35, %29
  %37 = sub nuw i64 %34, %36
  %38 = uitofp i64 %37 to float
  %39 = fmul contract float %38, 2.000000e+00
  %40 = fdiv contract float %39, %30
  %41 = fadd contract float %40, -1.000000e+00
  %42 = uitofp i64 %35 to float
  %43 = fmul contract float %42, 2.000000e+00
  %44 = fdiv contract float %43, %31
  %45 = fadd contract float %44, -1.000000e+00
  %46 = fmul contract float %41, 4.000000e+00
  %47 = fadd contract float %46, %3
  %48 = tail call float @llvm.fabs.f32(float %47)
  %49 = fcmp olt float %48, 1.310720e+05
  br i1 %49, label %50, label %58

50:                                               ; preds = %33
  %51 = fmul float %48, 0x3FE45F3060000000
  %52 = tail call float @llvm.rint.f32(float %51)
  %53 = tail call float @llvm.fma.f32(float %52, float 0xBFF921FB40000000, float %48)
  %54 = tail call float @llvm.fma.f32(float %52, float 0xBE74442D00000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %52, float 0xBCF8469880000000, float %54)
  %56 = fptosi float %52 to i32
  %57 = bitcast float %48 to i32
  br label %164

58:                                               ; preds = %33
  %59 = bitcast float %48 to i32
  %60 = lshr i32 %59, 23
  %61 = and i32 %59, 8388607
  %62 = or i32 %61, 8388608
  %63 = zext i32 %62 to i64
  %64 = mul nuw nsw i64 %63, 4266746795
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %63, 1011060801
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %63, 3680671129
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %63, 4113882560
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = mul nuw nsw i64 %63, 4230436817
  %80 = add nuw nsw i64 %78, %79
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = mul nuw nsw i64 %63, 1313084713
  %84 = add nuw nsw i64 %82, %83
  %85 = trunc i64 %84 to i32
  %86 = lshr i64 %84, 32
  %87 = mul nuw nsw i64 %63, 2734261102
  %88 = add nuw nsw i64 %86, %87
  %89 = trunc i64 %88 to i32
  %90 = lshr i64 %88, 32
  %91 = trunc i64 %90 to i32
  %92 = add nsw i32 %60, -120
  %93 = icmp ugt i32 %92, 63
  %94 = select i1 %93, i32 %85, i32 %91
  %95 = select i1 %93, i32 %81, i32 %89
  %96 = select i1 %93, i32 %77, i32 %85
  %97 = select i1 %93, i32 %73, i32 %81
  %98 = select i1 %93, i32 %69, i32 %77
  %99 = select i1 %93, i32 %65, i32 %73
  %100 = select i1 %93, i32 -64, i32 0
  %101 = add nsw i32 %100, %92
  %102 = icmp ugt i32 %101, 31
  %103 = select i1 %102, i32 %95, i32 %94
  %104 = select i1 %102, i32 %96, i32 %95
  %105 = select i1 %102, i32 %97, i32 %96
  %106 = select i1 %102, i32 %98, i32 %97
  %107 = select i1 %102, i32 %99, i32 %98
  %108 = select i1 %102, i32 -32, i32 0
  %109 = add nsw i32 %108, %101
  %110 = icmp ugt i32 %109, 31
  %111 = select i1 %110, i32 %104, i32 %103
  %112 = select i1 %110, i32 %105, i32 %104
  %113 = select i1 %110, i32 %106, i32 %105
  %114 = select i1 %110, i32 %107, i32 %106
  %115 = select i1 %110, i32 -32, i32 0
  %116 = add nsw i32 %115, %109
  %117 = icmp eq i32 %116, 0
  %118 = sub nsw i32 32, %116
  %119 = tail call i32 @llvm.fshr.i32(i32 %111, i32 %112, i32 %118)
  %120 = tail call i32 @llvm.fshr.i32(i32 %112, i32 %113, i32 %118)
  %121 = tail call i32 @llvm.fshr.i32(i32 %113, i32 %114, i32 %118)
  %122 = select i1 %117, i32 %111, i32 %119
  %123 = select i1 %117, i32 %112, i32 %120
  %124 = select i1 %117, i32 %113, i32 %121
  %125 = lshr i32 %122, 29
  %126 = tail call i32 @llvm.fshl.i32(i32 %122, i32 %123, i32 2)
  %127 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %124, i32 2)
  %128 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %114, i32 2)
  %129 = and i32 %125, 1
  %130 = sub nsw i32 0, %129
  %131 = shl i32 %125, 31
  %132 = xor i32 %126, %130
  %133 = xor i32 %127, %130
  %134 = xor i32 %128, %130
  %135 = tail call i32 @llvm.ctlz.i32(i32 %132, i1 false), !range !16
  %136 = sub nsw i32 31, %135
  %137 = tail call i32 @llvm.fshr.i32(i32 %132, i32 %133, i32 %136)
  %138 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %134, i32 %136)
  %139 = shl nuw nsw i32 %135, 23
  %140 = sub nuw nsw i32 1056964608, %139
  %141 = lshr i32 %137, 9
  %142 = or i32 %141, %140
  %143 = or i32 %142, %131
  %144 = bitcast i32 %143 to float
  %145 = tail call i32 @llvm.fshl.i32(i32 %137, i32 %138, i32 23)
  %146 = tail call i32 @llvm.ctlz.i32(i32 %145, i1 false), !range !16
  %147 = fmul float %144, 0x3FF921FB40000000
  %148 = add nuw nsw i32 %146, %135
  %149 = shl nuw nsw i32 %148, 23
  %150 = sub nuw nsw i32 855638016, %149
  %151 = sub nsw i32 31, %146
  %152 = tail call i32 @llvm.fshr.i32(i32 %145, i32 %138, i32 %151)
  %153 = lshr i32 %152, 9
  %154 = or i32 %150, %153
  %155 = or i32 %154, %131
  %156 = bitcast i32 %155 to float
  %157 = fneg float %147
  %158 = tail call float @llvm.fma.f32(float %144, float 0x3FF921FB40000000, float %157)
  %159 = tail call float @llvm.fma.f32(float %144, float 0x3E74442D00000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %156, float 0x3FF921FB40000000, float %159)
  %161 = fadd float %147, %160
  %162 = lshr i32 %122, 30
  %163 = add nuw nsw i32 %129, %162
  br label %164

164:                                              ; preds = %50, %58
  %165 = phi i32 [ %57, %50 ], [ %59, %58 ]
  %166 = phi float [ %55, %50 ], [ %161, %58 ]
  %167 = phi i32 [ %56, %50 ], [ %163, %58 ]
  %168 = fmul float %166, %166
  %169 = tail call float @llvm.fmuladd.f32(float %168, float 0xBF29833040000000, float 0x3F81103880000000)
  %170 = tail call float @llvm.fmuladd.f32(float %168, float %169, float 0xBFC55553A0000000)
  %171 = fmul float %168, %170
  %172 = tail call float @llvm.fmuladd.f32(float %166, float %171, float %166)
  %173 = tail call float @llvm.fmuladd.f32(float %168, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %174 = tail call float @llvm.fmuladd.f32(float %168, float %173, float 0x3FA5557EE0000000)
  %175 = tail call float @llvm.fmuladd.f32(float %168, float %174, float 0xBFE0000080000000)
  %176 = tail call float @llvm.fmuladd.f32(float %168, float %175, float 1.000000e+00)
  %177 = and i32 %167, 1
  %178 = icmp eq i32 %177, 0
  %179 = select i1 %178, float %172, float %176
  %180 = bitcast float %179 to i32
  %181 = shl i32 %167, 30
  %182 = and i32 %181, -2147483648
  %183 = bitcast float %47 to i32
  %184 = xor i32 %165, %183
  %185 = xor i32 %184, %182
  %186 = xor i32 %185, %180
  %187 = bitcast i32 %186 to float
  %188 = tail call i1 @llvm.amdgcn.class.f32(float %48, i32 504)
  %189 = fmul contract float %187, 5.000000e-01
  %190 = select i1 %188, float %189, float 0x7FF8000000000000
  %191 = fmul contract float %45, 4.000000e+00
  %192 = fadd contract float %191, %3
  %193 = tail call float @llvm.fabs.f32(float %192)
  %194 = fcmp olt float %193, 1.310720e+05
  br i1 %194, label %195, label %202

195:                                              ; preds = %164
  %196 = fmul float %193, 0x3FE45F3060000000
  %197 = tail call float @llvm.rint.f32(float %196)
  %198 = tail call float @llvm.fma.f32(float %197, float 0xBFF921FB40000000, float %193)
  %199 = tail call float @llvm.fma.f32(float %197, float 0xBE74442D00000000, float %198)
  %200 = tail call float @llvm.fma.f32(float %197, float 0xBCF8469880000000, float %199)
  %201 = fptosi float %197 to i32
  br label %308

202:                                              ; preds = %164
  %203 = bitcast float %193 to i32
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
  %279 = tail call i32 @llvm.ctlz.i32(i32 %276, i1 false), !range !16
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
  %290 = tail call i32 @llvm.ctlz.i32(i32 %289, i1 false), !range !16
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

308:                                              ; preds = %195, %202
  %309 = phi float [ %200, %195 ], [ %305, %202 ]
  %310 = phi i32 [ %201, %195 ], [ %307, %202 ]
  %311 = fmul float %309, %309
  %312 = tail call float @llvm.fmuladd.f32(float %311, float 0xBF29833040000000, float 0x3F81103880000000)
  %313 = tail call float @llvm.fmuladd.f32(float %311, float %312, float 0xBFC55553A0000000)
  %314 = fmul float %311, %313
  %315 = tail call float @llvm.fmuladd.f32(float %309, float %314, float %309)
  %316 = tail call float @llvm.fmuladd.f32(float %311, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %317 = tail call float @llvm.fmuladd.f32(float %311, float %316, float 0x3FA5557EE0000000)
  %318 = tail call float @llvm.fmuladd.f32(float %311, float %317, float 0xBFE0000080000000)
  %319 = tail call float @llvm.fmuladd.f32(float %311, float %318, float 1.000000e+00)
  %320 = fneg float %315
  %321 = and i32 %310, 1
  %322 = icmp eq i32 %321, 0
  %323 = select i1 %322, float %319, float %320
  %324 = bitcast float %323 to i32
  %325 = shl i32 %310, 30
  %326 = and i32 %325, -2147483648
  %327 = xor i32 %326, %324
  %328 = bitcast i32 %327 to float
  %329 = tail call i1 @llvm.amdgcn.class.f32(float %193, i32 504)
  %330 = select i1 %329, float %328, float 0x7FF8000000000000
  %331 = fmul contract float %190, %330
  %332 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  store float %331, float addrspace(1)* %332, align 4, !tbaa !17
  %333 = add i64 %34, %21
  %334 = icmp ult i64 %333, %25
  br i1 %334, label %33, label %32, !llvm.loop !21
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{i32 0, i32 1024}
!16 = !{i32 0, i32 33}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
