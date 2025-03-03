; ModuleID = '../data/hip_kernels/14472/1/main.cu'
source_filename = "../data/hip_kernels/14472/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22cuda_kernel_texture_2dPhiimf(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i64 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %1
  %24 = icmp slt i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %797

26:                                               ; preds = %5
  %27 = sext i32 %22 to i64
  %28 = mul i64 %27, %3
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = bitcast i8 addrspace(1)* %29 to float addrspace(1)*
  %31 = shl nsw i32 %14, 2
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %30, i64 %32
  %34 = sitofp i32 %14 to float
  %35 = fmul contract float %34, 2.000000e+00
  %36 = sitofp i32 %1 to float
  %37 = fdiv contract float %35, %36
  %38 = fadd contract float %37, -1.000000e+00
  %39 = fmul contract float %38, 1.000000e+01
  %40 = fadd contract float %39, %4
  %41 = tail call float @llvm.fabs.f32(float %40)
  %42 = fcmp olt float %41, 1.310720e+05
  br i1 %42, label %43, label %50

43:                                               ; preds = %26
  %44 = fmul float %41, 0x3FE45F3060000000
  %45 = tail call float @llvm.rint.f32(float %44)
  %46 = tail call float @llvm.fma.f32(float %45, float 0xBFF921FB40000000, float %41)
  %47 = tail call float @llvm.fma.f32(float %45, float 0xBE74442D00000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %45, float 0xBCF8469880000000, float %47)
  %49 = fptosi float %45 to i32
  br label %156

50:                                               ; preds = %26
  %51 = bitcast float %41 to i32
  %52 = lshr i32 %51, 23
  %53 = and i32 %51, 8388607
  %54 = or i32 %53, 8388608
  %55 = zext i32 %54 to i64
  %56 = mul nuw nsw i64 %55, 4266746795
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %55, 1011060801
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %55, 3680671129
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %55, 4113882560
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %55, 4230436817
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %55, 1313084713
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = mul nuw nsw i64 %55, 2734261102
  %80 = add nuw nsw i64 %78, %79
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = trunc i64 %82 to i32
  %84 = add nsw i32 %52, -120
  %85 = icmp ugt i32 %84, 63
  %86 = select i1 %85, i32 %77, i32 %83
  %87 = select i1 %85, i32 %73, i32 %81
  %88 = select i1 %85, i32 %69, i32 %77
  %89 = select i1 %85, i32 %65, i32 %73
  %90 = select i1 %85, i32 %61, i32 %69
  %91 = select i1 %85, i32 %57, i32 %65
  %92 = select i1 %85, i32 -64, i32 0
  %93 = add nsw i32 %92, %84
  %94 = icmp ugt i32 %93, 31
  %95 = select i1 %94, i32 %87, i32 %86
  %96 = select i1 %94, i32 %88, i32 %87
  %97 = select i1 %94, i32 %89, i32 %88
  %98 = select i1 %94, i32 %90, i32 %89
  %99 = select i1 %94, i32 %91, i32 %90
  %100 = select i1 %94, i32 -32, i32 0
  %101 = add nsw i32 %100, %93
  %102 = icmp ugt i32 %101, 31
  %103 = select i1 %102, i32 %96, i32 %95
  %104 = select i1 %102, i32 %97, i32 %96
  %105 = select i1 %102, i32 %98, i32 %97
  %106 = select i1 %102, i32 %99, i32 %98
  %107 = select i1 %102, i32 -32, i32 0
  %108 = add nsw i32 %107, %101
  %109 = icmp eq i32 %108, 0
  %110 = sub nsw i32 32, %108
  %111 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %110)
  %112 = tail call i32 @llvm.fshr.i32(i32 %104, i32 %105, i32 %110)
  %113 = tail call i32 @llvm.fshr.i32(i32 %105, i32 %106, i32 %110)
  %114 = select i1 %109, i32 %103, i32 %111
  %115 = select i1 %109, i32 %104, i32 %112
  %116 = select i1 %109, i32 %105, i32 %113
  %117 = lshr i32 %114, 29
  %118 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %115, i32 2)
  %119 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %116, i32 2)
  %120 = tail call i32 @llvm.fshl.i32(i32 %116, i32 %106, i32 2)
  %121 = and i32 %117, 1
  %122 = sub nsw i32 0, %121
  %123 = shl i32 %117, 31
  %124 = xor i32 %118, %122
  %125 = xor i32 %119, %122
  %126 = xor i32 %120, %122
  %127 = tail call i32 @llvm.ctlz.i32(i32 %124, i1 false), !range !7
  %128 = sub nsw i32 31, %127
  %129 = tail call i32 @llvm.fshr.i32(i32 %124, i32 %125, i32 %128)
  %130 = tail call i32 @llvm.fshr.i32(i32 %125, i32 %126, i32 %128)
  %131 = shl nuw nsw i32 %127, 23
  %132 = sub nuw nsw i32 1056964608, %131
  %133 = lshr i32 %129, 9
  %134 = or i32 %133, %132
  %135 = or i32 %134, %123
  %136 = bitcast i32 %135 to float
  %137 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %130, i32 23)
  %138 = tail call i32 @llvm.ctlz.i32(i32 %137, i1 false), !range !7
  %139 = fmul float %136, 0x3FF921FB40000000
  %140 = add nuw nsw i32 %138, %127
  %141 = shl nuw nsw i32 %140, 23
  %142 = sub nuw nsw i32 855638016, %141
  %143 = sub nsw i32 31, %138
  %144 = tail call i32 @llvm.fshr.i32(i32 %137, i32 %130, i32 %143)
  %145 = lshr i32 %144, 9
  %146 = or i32 %142, %145
  %147 = or i32 %146, %123
  %148 = bitcast i32 %147 to float
  %149 = fneg float %139
  %150 = tail call float @llvm.fma.f32(float %136, float 0x3FF921FB40000000, float %149)
  %151 = tail call float @llvm.fma.f32(float %136, float 0x3E74442D00000000, float %150)
  %152 = tail call float @llvm.fma.f32(float %148, float 0x3FF921FB40000000, float %151)
  %153 = fadd float %139, %152
  %154 = lshr i32 %114, 30
  %155 = add nuw nsw i32 %121, %154
  br label %156

156:                                              ; preds = %43, %50
  %157 = phi float [ %48, %43 ], [ %153, %50 ]
  %158 = phi i32 [ %49, %43 ], [ %155, %50 ]
  %159 = fmul float %157, %157
  %160 = tail call float @llvm.fmuladd.f32(float %159, float 0xBF29833040000000, float 0x3F81103880000000)
  %161 = tail call float @llvm.fmuladd.f32(float %159, float %160, float 0xBFC55553A0000000)
  %162 = fmul float %159, %161
  %163 = tail call float @llvm.fmuladd.f32(float %157, float %162, float %157)
  %164 = tail call float @llvm.fmuladd.f32(float %159, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %165 = tail call float @llvm.fmuladd.f32(float %159, float %164, float 0x3FA5557EE0000000)
  %166 = tail call float @llvm.fmuladd.f32(float %159, float %165, float 0xBFE0000080000000)
  %167 = tail call float @llvm.fmuladd.f32(float %159, float %166, float 1.000000e+00)
  %168 = fneg float %163
  %169 = and i32 %158, 1
  %170 = icmp eq i32 %169, 0
  %171 = select i1 %170, float %167, float %168
  %172 = bitcast float %171 to i32
  %173 = shl i32 %158, 30
  %174 = and i32 %173, -2147483648
  %175 = xor i32 %174, %172
  %176 = bitcast i32 %175 to float
  %177 = tail call i1 @llvm.amdgcn.class.f32(float %41, i32 504)
  %178 = fmul contract float %176, 5.000000e-01
  %179 = fadd contract float %178, 5.000000e-01
  %180 = select i1 %177, float %179, float 0x7FF8000000000000
  %181 = sitofp i32 %22 to float
  %182 = fmul contract float %181, 2.000000e+00
  %183 = sitofp i32 %2 to float
  %184 = fdiv contract float %182, %183
  %185 = fadd contract float %184, -1.000000e+00
  %186 = fmul contract float %185, 1.000000e+01
  %187 = fadd contract float %186, %4
  %188 = tail call float @llvm.fabs.f32(float %187)
  %189 = fcmp olt float %188, 1.310720e+05
  br i1 %189, label %190, label %197

190:                                              ; preds = %156
  %191 = fmul float %188, 0x3FE45F3060000000
  %192 = tail call float @llvm.rint.f32(float %191)
  %193 = tail call float @llvm.fma.f32(float %192, float 0xBFF921FB40000000, float %188)
  %194 = tail call float @llvm.fma.f32(float %192, float 0xBE74442D00000000, float %193)
  %195 = tail call float @llvm.fma.f32(float %192, float 0xBCF8469880000000, float %194)
  %196 = fptosi float %192 to i32
  br label %303

197:                                              ; preds = %156
  %198 = bitcast float %188 to i32
  %199 = lshr i32 %198, 23
  %200 = and i32 %198, 8388607
  %201 = or i32 %200, 8388608
  %202 = zext i32 %201 to i64
  %203 = mul nuw nsw i64 %202, 4266746795
  %204 = trunc i64 %203 to i32
  %205 = lshr i64 %203, 32
  %206 = mul nuw nsw i64 %202, 1011060801
  %207 = add nuw nsw i64 %205, %206
  %208 = trunc i64 %207 to i32
  %209 = lshr i64 %207, 32
  %210 = mul nuw nsw i64 %202, 3680671129
  %211 = add nuw nsw i64 %209, %210
  %212 = trunc i64 %211 to i32
  %213 = lshr i64 %211, 32
  %214 = mul nuw nsw i64 %202, 4113882560
  %215 = add nuw nsw i64 %213, %214
  %216 = trunc i64 %215 to i32
  %217 = lshr i64 %215, 32
  %218 = mul nuw nsw i64 %202, 4230436817
  %219 = add nuw nsw i64 %217, %218
  %220 = trunc i64 %219 to i32
  %221 = lshr i64 %219, 32
  %222 = mul nuw nsw i64 %202, 1313084713
  %223 = add nuw nsw i64 %221, %222
  %224 = trunc i64 %223 to i32
  %225 = lshr i64 %223, 32
  %226 = mul nuw nsw i64 %202, 2734261102
  %227 = add nuw nsw i64 %225, %226
  %228 = trunc i64 %227 to i32
  %229 = lshr i64 %227, 32
  %230 = trunc i64 %229 to i32
  %231 = add nsw i32 %199, -120
  %232 = icmp ugt i32 %231, 63
  %233 = select i1 %232, i32 %224, i32 %230
  %234 = select i1 %232, i32 %220, i32 %228
  %235 = select i1 %232, i32 %216, i32 %224
  %236 = select i1 %232, i32 %212, i32 %220
  %237 = select i1 %232, i32 %208, i32 %216
  %238 = select i1 %232, i32 %204, i32 %212
  %239 = select i1 %232, i32 -64, i32 0
  %240 = add nsw i32 %239, %231
  %241 = icmp ugt i32 %240, 31
  %242 = select i1 %241, i32 %234, i32 %233
  %243 = select i1 %241, i32 %235, i32 %234
  %244 = select i1 %241, i32 %236, i32 %235
  %245 = select i1 %241, i32 %237, i32 %236
  %246 = select i1 %241, i32 %238, i32 %237
  %247 = select i1 %241, i32 -32, i32 0
  %248 = add nsw i32 %247, %240
  %249 = icmp ugt i32 %248, 31
  %250 = select i1 %249, i32 %243, i32 %242
  %251 = select i1 %249, i32 %244, i32 %243
  %252 = select i1 %249, i32 %245, i32 %244
  %253 = select i1 %249, i32 %246, i32 %245
  %254 = select i1 %249, i32 -32, i32 0
  %255 = add nsw i32 %254, %248
  %256 = icmp eq i32 %255, 0
  %257 = sub nsw i32 32, %255
  %258 = tail call i32 @llvm.fshr.i32(i32 %250, i32 %251, i32 %257)
  %259 = tail call i32 @llvm.fshr.i32(i32 %251, i32 %252, i32 %257)
  %260 = tail call i32 @llvm.fshr.i32(i32 %252, i32 %253, i32 %257)
  %261 = select i1 %256, i32 %250, i32 %258
  %262 = select i1 %256, i32 %251, i32 %259
  %263 = select i1 %256, i32 %252, i32 %260
  %264 = lshr i32 %261, 29
  %265 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %262, i32 2)
  %266 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %263, i32 2)
  %267 = tail call i32 @llvm.fshl.i32(i32 %263, i32 %253, i32 2)
  %268 = and i32 %264, 1
  %269 = sub nsw i32 0, %268
  %270 = shl i32 %264, 31
  %271 = xor i32 %265, %269
  %272 = xor i32 %266, %269
  %273 = xor i32 %267, %269
  %274 = tail call i32 @llvm.ctlz.i32(i32 %271, i1 false), !range !7
  %275 = sub nsw i32 31, %274
  %276 = tail call i32 @llvm.fshr.i32(i32 %271, i32 %272, i32 %275)
  %277 = tail call i32 @llvm.fshr.i32(i32 %272, i32 %273, i32 %275)
  %278 = shl nuw nsw i32 %274, 23
  %279 = sub nuw nsw i32 1056964608, %278
  %280 = lshr i32 %276, 9
  %281 = or i32 %280, %279
  %282 = or i32 %281, %270
  %283 = bitcast i32 %282 to float
  %284 = tail call i32 @llvm.fshl.i32(i32 %276, i32 %277, i32 23)
  %285 = tail call i32 @llvm.ctlz.i32(i32 %284, i1 false), !range !7
  %286 = fmul float %283, 0x3FF921FB40000000
  %287 = add nuw nsw i32 %285, %274
  %288 = shl nuw nsw i32 %287, 23
  %289 = sub nuw nsw i32 855638016, %288
  %290 = sub nsw i32 31, %285
  %291 = tail call i32 @llvm.fshr.i32(i32 %284, i32 %277, i32 %290)
  %292 = lshr i32 %291, 9
  %293 = or i32 %289, %292
  %294 = or i32 %293, %270
  %295 = bitcast i32 %294 to float
  %296 = fneg float %286
  %297 = tail call float @llvm.fma.f32(float %283, float 0x3FF921FB40000000, float %296)
  %298 = tail call float @llvm.fma.f32(float %283, float 0x3E74442D00000000, float %297)
  %299 = tail call float @llvm.fma.f32(float %295, float 0x3FF921FB40000000, float %298)
  %300 = fadd float %286, %299
  %301 = lshr i32 %261, 30
  %302 = add nuw nsw i32 %268, %301
  br label %303

303:                                              ; preds = %190, %197
  %304 = phi float [ %195, %190 ], [ %300, %197 ]
  %305 = phi i32 [ %196, %190 ], [ %302, %197 ]
  %306 = fmul float %304, %304
  %307 = tail call float @llvm.fmuladd.f32(float %306, float 0xBF29833040000000, float 0x3F81103880000000)
  %308 = tail call float @llvm.fmuladd.f32(float %306, float %307, float 0xBFC55553A0000000)
  %309 = fmul float %306, %308
  %310 = tail call float @llvm.fmuladd.f32(float %304, float %309, float %304)
  %311 = tail call float @llvm.fmuladd.f32(float %306, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %312 = tail call float @llvm.fmuladd.f32(float %306, float %311, float 0x3FA5557EE0000000)
  %313 = tail call float @llvm.fmuladd.f32(float %306, float %312, float 0xBFE0000080000000)
  %314 = tail call float @llvm.fmuladd.f32(float %306, float %313, float 1.000000e+00)
  %315 = fneg float %310
  %316 = and i32 %305, 1
  %317 = icmp eq i32 %316, 0
  %318 = select i1 %317, float %314, float %315
  %319 = bitcast float %318 to i32
  %320 = shl i32 %305, 30
  %321 = and i32 %320, -2147483648
  %322 = xor i32 %321, %319
  %323 = bitcast i32 %322 to float
  %324 = tail call i1 @llvm.amdgcn.class.f32(float %188, i32 504)
  %325 = fmul contract float %323, 5.000000e-01
  %326 = fadd contract float %325, 5.000000e-01
  %327 = select i1 %324, float %326, float 0x7FF8000000000000
  %328 = load float, float addrspace(1)* %33, align 4, !tbaa !8, !amdgpu.noclobber !5
  %329 = fpext float %328 to double
  %330 = fmul contract double %329, 5.000000e-01
  %331 = tail call float @llvm.fabs.f32(float %180)
  %332 = tail call float @llvm.amdgcn.frexp.mant.f32(float %331)
  %333 = fcmp olt float %332, 0x3FE5555560000000
  %334 = zext i1 %333 to i32
  %335 = tail call float @llvm.amdgcn.ldexp.f32(float %332, i32 %334)
  %336 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %331)
  %337 = sub nsw i32 %336, %334
  %338 = fadd float %335, -1.000000e+00
  %339 = fadd float %335, 1.000000e+00
  %340 = fadd float %339, -1.000000e+00
  %341 = fsub float %335, %340
  %342 = tail call float @llvm.amdgcn.rcp.f32(float %339)
  %343 = fmul float %338, %342
  %344 = fmul float %339, %343
  %345 = fneg float %344
  %346 = tail call float @llvm.fma.f32(float %343, float %339, float %345)
  %347 = tail call float @llvm.fma.f32(float %343, float %341, float %346)
  %348 = fadd float %344, %347
  %349 = fsub float %348, %344
  %350 = fsub float %347, %349
  %351 = fsub float %338, %348
  %352 = fsub float %338, %351
  %353 = fsub float %352, %348
  %354 = fsub float %353, %350
  %355 = fadd float %351, %354
  %356 = fmul float %342, %355
  %357 = fadd float %343, %356
  %358 = fsub float %357, %343
  %359 = fsub float %356, %358
  %360 = fmul float %357, %357
  %361 = fneg float %360
  %362 = tail call float @llvm.fma.f32(float %357, float %357, float %361)
  %363 = fmul float %359, 2.000000e+00
  %364 = tail call float @llvm.fma.f32(float %357, float %363, float %362)
  %365 = fadd float %360, %364
  %366 = fsub float %365, %360
  %367 = fsub float %364, %366
  %368 = tail call float @llvm.fmuladd.f32(float %365, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %369 = tail call float @llvm.fmuladd.f32(float %365, float %368, float 0x3FD999BDE0000000)
  %370 = sitofp i32 %337 to float
  %371 = fmul float %370, 0x3FE62E4300000000
  %372 = fneg float %371
  %373 = tail call float @llvm.fma.f32(float %370, float 0x3FE62E4300000000, float %372)
  %374 = tail call float @llvm.fma.f32(float %370, float 0xBE205C6100000000, float %373)
  %375 = fadd float %371, %374
  %376 = fsub float %375, %371
  %377 = fsub float %374, %376
  %378 = tail call float @llvm.amdgcn.ldexp.f32(float %357, i32 1)
  %379 = fmul float %357, %365
  %380 = fneg float %379
  %381 = tail call float @llvm.fma.f32(float %365, float %357, float %380)
  %382 = tail call float @llvm.fma.f32(float %365, float %359, float %381)
  %383 = tail call float @llvm.fma.f32(float %367, float %357, float %382)
  %384 = fadd float %379, %383
  %385 = fsub float %384, %379
  %386 = fsub float %383, %385
  %387 = fmul float %365, %369
  %388 = fneg float %387
  %389 = tail call float @llvm.fma.f32(float %365, float %369, float %388)
  %390 = tail call float @llvm.fma.f32(float %367, float %369, float %389)
  %391 = fadd float %387, %390
  %392 = fsub float %391, %387
  %393 = fsub float %390, %392
  %394 = fadd float %391, 0x3FE5555540000000
  %395 = fadd float %394, 0xBFE5555540000000
  %396 = fsub float %391, %395
  %397 = fadd float %393, 0x3E2E720200000000
  %398 = fadd float %397, %396
  %399 = fadd float %394, %398
  %400 = fsub float %399, %394
  %401 = fsub float %398, %400
  %402 = fmul float %384, %399
  %403 = fneg float %402
  %404 = tail call float @llvm.fma.f32(float %384, float %399, float %403)
  %405 = tail call float @llvm.fma.f32(float %384, float %401, float %404)
  %406 = tail call float @llvm.fma.f32(float %386, float %399, float %405)
  %407 = tail call float @llvm.amdgcn.ldexp.f32(float %359, i32 1)
  %408 = fadd float %402, %406
  %409 = fsub float %408, %402
  %410 = fsub float %406, %409
  %411 = fadd float %378, %408
  %412 = fsub float %411, %378
  %413 = fsub float %408, %412
  %414 = fadd float %407, %410
  %415 = fadd float %414, %413
  %416 = fadd float %411, %415
  %417 = fsub float %416, %411
  %418 = fsub float %415, %417
  %419 = fadd float %375, %416
  %420 = fsub float %419, %375
  %421 = fsub float %419, %420
  %422 = fsub float %375, %421
  %423 = fsub float %416, %420
  %424 = fadd float %423, %422
  %425 = fadd float %377, %418
  %426 = fsub float %425, %377
  %427 = fsub float %425, %426
  %428 = fsub float %377, %427
  %429 = fsub float %418, %426
  %430 = fadd float %429, %428
  %431 = fadd float %425, %424
  %432 = fadd float %419, %431
  %433 = fsub float %432, %419
  %434 = fsub float %431, %433
  %435 = fadd float %430, %434
  %436 = fadd float %432, %435
  %437 = fsub float %436, %432
  %438 = fsub float %435, %437
  %439 = fmul float %436, 3.000000e+00
  %440 = fneg float %439
  %441 = tail call float @llvm.fma.f32(float %436, float 3.000000e+00, float %440)
  %442 = tail call float @llvm.fma.f32(float %438, float 3.000000e+00, float %441)
  %443 = fadd float %439, %442
  %444 = fsub float %443, %439
  %445 = fsub float %442, %444
  %446 = tail call float @llvm.fabs.f32(float %439) #3
  %447 = fcmp oeq float %446, 0x7FF0000000000000
  %448 = select i1 %447, float %439, float %443
  %449 = tail call float @llvm.fabs.f32(float %448) #3
  %450 = fcmp oeq float %449, 0x7FF0000000000000
  %451 = select i1 %450, float 0.000000e+00, float %445
  %452 = fcmp oeq float %448, 0x40562E4300000000
  %453 = select i1 %452, float 0x3EE0000000000000, float 0.000000e+00
  %454 = fsub float %448, %453
  %455 = fadd float %453, %451
  %456 = fmul float %454, 0x3FF7154760000000
  %457 = tail call float @llvm.rint.f32(float %456)
  %458 = fcmp ogt float %454, 0x40562E4300000000
  %459 = fcmp olt float %454, 0xC059D1DA00000000
  %460 = fneg float %456
  %461 = tail call float @llvm.fma.f32(float %454, float 0x3FF7154760000000, float %460)
  %462 = tail call float @llvm.fma.f32(float %454, float 0x3E54AE0BE0000000, float %461)
  %463 = fsub float %456, %457
  %464 = fadd float %462, %463
  %465 = tail call float @llvm.exp2.f32(float %464)
  %466 = fptosi float %457 to i32
  %467 = tail call float @llvm.amdgcn.ldexp.f32(float %465, i32 %466)
  %468 = select i1 %459, float 0.000000e+00, float %467
  %469 = select i1 %458, float 0x7FF0000000000000, float %468
  %470 = tail call float @llvm.fma.f32(float %469, float %455, float %469)
  %471 = tail call float @llvm.fabs.f32(float %469) #3
  %472 = fcmp oeq float %471, 0x7FF0000000000000
  %473 = select i1 %472, float %469, float %470
  %474 = fcmp olt float %180, 0.000000e+00
  %475 = select i1 %474, float -0.000000e+00, float 0.000000e+00
  %476 = tail call float @llvm.copysign.f32(float %473, float %475)
  %477 = fcmp oeq float %331, 0x7FF0000000000000
  %478 = fcmp oeq float %180, 0.000000e+00
  %479 = or i1 %478, %477
  %480 = select i1 %478, float 0.000000e+00, float 0x7FF0000000000000
  %481 = tail call float @llvm.copysign.f32(float %480, float %180)
  %482 = select i1 %479, float %481, float %476
  %483 = fcmp uno float %180, 0.000000e+00
  %484 = select i1 %483, float 0x7FF8000000000000, float %482
  %485 = fcmp oeq float %180, 1.000000e+00
  %486 = select i1 %485, float 1.000000e+00, float %484
  %487 = fpext float %486 to double
  %488 = fmul contract double %487, 5.000000e-01
  %489 = fadd contract double %488, %330
  %490 = fptrunc double %489 to float
  store float %490, float addrspace(1)* %33, align 4, !tbaa !8
  %491 = getelementptr inbounds float, float addrspace(1)* %33, i64 1
  %492 = load float, float addrspace(1)* %491, align 4, !tbaa !8, !amdgpu.noclobber !5
  %493 = fpext float %492 to double
  %494 = fmul contract double %493, 5.000000e-01
  %495 = tail call float @llvm.fabs.f32(float %327)
  %496 = tail call float @llvm.amdgcn.frexp.mant.f32(float %495)
  %497 = fcmp olt float %496, 0x3FE5555560000000
  %498 = zext i1 %497 to i32
  %499 = tail call float @llvm.amdgcn.ldexp.f32(float %496, i32 %498)
  %500 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %495)
  %501 = sub nsw i32 %500, %498
  %502 = fadd float %499, -1.000000e+00
  %503 = fadd float %499, 1.000000e+00
  %504 = fadd float %503, -1.000000e+00
  %505 = fsub float %499, %504
  %506 = tail call float @llvm.amdgcn.rcp.f32(float %503)
  %507 = fmul float %502, %506
  %508 = fmul float %503, %507
  %509 = fneg float %508
  %510 = tail call float @llvm.fma.f32(float %507, float %503, float %509)
  %511 = tail call float @llvm.fma.f32(float %507, float %505, float %510)
  %512 = fadd float %508, %511
  %513 = fsub float %512, %508
  %514 = fsub float %511, %513
  %515 = fsub float %502, %512
  %516 = fsub float %502, %515
  %517 = fsub float %516, %512
  %518 = fsub float %517, %514
  %519 = fadd float %515, %518
  %520 = fmul float %506, %519
  %521 = fadd float %507, %520
  %522 = fsub float %521, %507
  %523 = fsub float %520, %522
  %524 = fmul float %521, %521
  %525 = fneg float %524
  %526 = tail call float @llvm.fma.f32(float %521, float %521, float %525)
  %527 = fmul float %523, 2.000000e+00
  %528 = tail call float @llvm.fma.f32(float %521, float %527, float %526)
  %529 = fadd float %524, %528
  %530 = fsub float %529, %524
  %531 = fsub float %528, %530
  %532 = tail call float @llvm.fmuladd.f32(float %529, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %533 = tail call float @llvm.fmuladd.f32(float %529, float %532, float 0x3FD999BDE0000000)
  %534 = sitofp i32 %501 to float
  %535 = fmul float %534, 0x3FE62E4300000000
  %536 = fneg float %535
  %537 = tail call float @llvm.fma.f32(float %534, float 0x3FE62E4300000000, float %536)
  %538 = tail call float @llvm.fma.f32(float %534, float 0xBE205C6100000000, float %537)
  %539 = fadd float %535, %538
  %540 = fsub float %539, %535
  %541 = fsub float %538, %540
  %542 = tail call float @llvm.amdgcn.ldexp.f32(float %521, i32 1)
  %543 = fmul float %521, %529
  %544 = fneg float %543
  %545 = tail call float @llvm.fma.f32(float %529, float %521, float %544)
  %546 = tail call float @llvm.fma.f32(float %529, float %523, float %545)
  %547 = tail call float @llvm.fma.f32(float %531, float %521, float %546)
  %548 = fadd float %543, %547
  %549 = fsub float %548, %543
  %550 = fsub float %547, %549
  %551 = fmul float %529, %533
  %552 = fneg float %551
  %553 = tail call float @llvm.fma.f32(float %529, float %533, float %552)
  %554 = tail call float @llvm.fma.f32(float %531, float %533, float %553)
  %555 = fadd float %551, %554
  %556 = fsub float %555, %551
  %557 = fsub float %554, %556
  %558 = fadd float %555, 0x3FE5555540000000
  %559 = fadd float %558, 0xBFE5555540000000
  %560 = fsub float %555, %559
  %561 = fadd float %557, 0x3E2E720200000000
  %562 = fadd float %561, %560
  %563 = fadd float %558, %562
  %564 = fsub float %563, %558
  %565 = fsub float %562, %564
  %566 = fmul float %548, %563
  %567 = fneg float %566
  %568 = tail call float @llvm.fma.f32(float %548, float %563, float %567)
  %569 = tail call float @llvm.fma.f32(float %548, float %565, float %568)
  %570 = tail call float @llvm.fma.f32(float %550, float %563, float %569)
  %571 = tail call float @llvm.amdgcn.ldexp.f32(float %523, i32 1)
  %572 = fadd float %566, %570
  %573 = fsub float %572, %566
  %574 = fsub float %570, %573
  %575 = fadd float %542, %572
  %576 = fsub float %575, %542
  %577 = fsub float %572, %576
  %578 = fadd float %571, %574
  %579 = fadd float %578, %577
  %580 = fadd float %575, %579
  %581 = fsub float %580, %575
  %582 = fsub float %579, %581
  %583 = fadd float %539, %580
  %584 = fsub float %583, %539
  %585 = fsub float %583, %584
  %586 = fsub float %539, %585
  %587 = fsub float %580, %584
  %588 = fadd float %587, %586
  %589 = fadd float %541, %582
  %590 = fsub float %589, %541
  %591 = fsub float %589, %590
  %592 = fsub float %541, %591
  %593 = fsub float %582, %590
  %594 = fadd float %593, %592
  %595 = fadd float %589, %588
  %596 = fadd float %583, %595
  %597 = fsub float %596, %583
  %598 = fsub float %595, %597
  %599 = fadd float %594, %598
  %600 = fadd float %596, %599
  %601 = fsub float %600, %596
  %602 = fsub float %599, %601
  %603 = fmul float %600, 3.000000e+00
  %604 = fneg float %603
  %605 = tail call float @llvm.fma.f32(float %600, float 3.000000e+00, float %604)
  %606 = tail call float @llvm.fma.f32(float %602, float 3.000000e+00, float %605)
  %607 = fadd float %603, %606
  %608 = fsub float %607, %603
  %609 = fsub float %606, %608
  %610 = tail call float @llvm.fabs.f32(float %603) #3
  %611 = fcmp oeq float %610, 0x7FF0000000000000
  %612 = select i1 %611, float %603, float %607
  %613 = tail call float @llvm.fabs.f32(float %612) #3
  %614 = fcmp oeq float %613, 0x7FF0000000000000
  %615 = select i1 %614, float 0.000000e+00, float %609
  %616 = fcmp oeq float %612, 0x40562E4300000000
  %617 = select i1 %616, float 0x3EE0000000000000, float 0.000000e+00
  %618 = fsub float %612, %617
  %619 = fadd float %617, %615
  %620 = fmul float %618, 0x3FF7154760000000
  %621 = tail call float @llvm.rint.f32(float %620)
  %622 = fcmp ogt float %618, 0x40562E4300000000
  %623 = fcmp olt float %618, 0xC059D1DA00000000
  %624 = fneg float %620
  %625 = tail call float @llvm.fma.f32(float %618, float 0x3FF7154760000000, float %624)
  %626 = tail call float @llvm.fma.f32(float %618, float 0x3E54AE0BE0000000, float %625)
  %627 = fsub float %620, %621
  %628 = fadd float %626, %627
  %629 = tail call float @llvm.exp2.f32(float %628)
  %630 = fptosi float %621 to i32
  %631 = tail call float @llvm.amdgcn.ldexp.f32(float %629, i32 %630)
  %632 = select i1 %623, float 0.000000e+00, float %631
  %633 = select i1 %622, float 0x7FF0000000000000, float %632
  %634 = tail call float @llvm.fma.f32(float %633, float %619, float %633)
  %635 = tail call float @llvm.fabs.f32(float %633) #3
  %636 = fcmp oeq float %635, 0x7FF0000000000000
  %637 = select i1 %636, float %633, float %634
  %638 = fcmp olt float %327, 0.000000e+00
  %639 = select i1 %638, float -0.000000e+00, float 0.000000e+00
  %640 = tail call float @llvm.copysign.f32(float %637, float %639)
  %641 = fcmp oeq float %495, 0x7FF0000000000000
  %642 = fcmp oeq float %327, 0.000000e+00
  %643 = or i1 %642, %641
  %644 = select i1 %642, float 0.000000e+00, float 0x7FF0000000000000
  %645 = tail call float @llvm.copysign.f32(float %644, float %327)
  %646 = select i1 %643, float %645, float %640
  %647 = fcmp uno float %327, 0.000000e+00
  %648 = select i1 %647, float 0x7FF8000000000000, float %646
  %649 = fcmp oeq float %327, 1.000000e+00
  %650 = select i1 %649, float 1.000000e+00, float %648
  %651 = fpext float %650 to double
  %652 = fmul contract double %651, 5.000000e-01
  %653 = fadd contract double %494, %652
  %654 = fptrunc double %653 to float
  store float %654, float addrspace(1)* %491, align 4, !tbaa !8
  %655 = tail call float @llvm.fabs.f32(float %4)
  %656 = fcmp olt float %655, 1.310720e+05
  br i1 %656, label %657, label %664

657:                                              ; preds = %303
  %658 = fmul float %655, 0x3FE45F3060000000
  %659 = tail call float @llvm.rint.f32(float %658)
  %660 = tail call float @llvm.fma.f32(float %659, float 0xBFF921FB40000000, float %655)
  %661 = tail call float @llvm.fma.f32(float %659, float 0xBE74442D00000000, float %660)
  %662 = tail call float @llvm.fma.f32(float %659, float 0xBCF8469880000000, float %661)
  %663 = fptosi float %659 to i32
  br label %770

664:                                              ; preds = %303
  %665 = bitcast float %655 to i32
  %666 = lshr i32 %665, 23
  %667 = and i32 %665, 8388607
  %668 = or i32 %667, 8388608
  %669 = zext i32 %668 to i64
  %670 = mul nuw nsw i64 %669, 4266746795
  %671 = trunc i64 %670 to i32
  %672 = lshr i64 %670, 32
  %673 = mul nuw nsw i64 %669, 1011060801
  %674 = add nuw nsw i64 %672, %673
  %675 = trunc i64 %674 to i32
  %676 = lshr i64 %674, 32
  %677 = mul nuw nsw i64 %669, 3680671129
  %678 = add nuw nsw i64 %676, %677
  %679 = trunc i64 %678 to i32
  %680 = lshr i64 %678, 32
  %681 = mul nuw nsw i64 %669, 4113882560
  %682 = add nuw nsw i64 %680, %681
  %683 = trunc i64 %682 to i32
  %684 = lshr i64 %682, 32
  %685 = mul nuw nsw i64 %669, 4230436817
  %686 = add nuw nsw i64 %684, %685
  %687 = trunc i64 %686 to i32
  %688 = lshr i64 %686, 32
  %689 = mul nuw nsw i64 %669, 1313084713
  %690 = add nuw nsw i64 %688, %689
  %691 = trunc i64 %690 to i32
  %692 = lshr i64 %690, 32
  %693 = mul nuw nsw i64 %669, 2734261102
  %694 = add nuw nsw i64 %692, %693
  %695 = trunc i64 %694 to i32
  %696 = lshr i64 %694, 32
  %697 = trunc i64 %696 to i32
  %698 = add nsw i32 %666, -120
  %699 = icmp ugt i32 %698, 63
  %700 = select i1 %699, i32 %691, i32 %697
  %701 = select i1 %699, i32 %687, i32 %695
  %702 = select i1 %699, i32 %683, i32 %691
  %703 = select i1 %699, i32 %679, i32 %687
  %704 = select i1 %699, i32 %675, i32 %683
  %705 = select i1 %699, i32 %671, i32 %679
  %706 = select i1 %699, i32 -64, i32 0
  %707 = add nsw i32 %706, %698
  %708 = icmp ugt i32 %707, 31
  %709 = select i1 %708, i32 %701, i32 %700
  %710 = select i1 %708, i32 %702, i32 %701
  %711 = select i1 %708, i32 %703, i32 %702
  %712 = select i1 %708, i32 %704, i32 %703
  %713 = select i1 %708, i32 %705, i32 %704
  %714 = select i1 %708, i32 -32, i32 0
  %715 = add nsw i32 %714, %707
  %716 = icmp ugt i32 %715, 31
  %717 = select i1 %716, i32 %710, i32 %709
  %718 = select i1 %716, i32 %711, i32 %710
  %719 = select i1 %716, i32 %712, i32 %711
  %720 = select i1 %716, i32 %713, i32 %712
  %721 = select i1 %716, i32 -32, i32 0
  %722 = add nsw i32 %721, %715
  %723 = icmp eq i32 %722, 0
  %724 = sub nsw i32 32, %722
  %725 = tail call i32 @llvm.fshr.i32(i32 %717, i32 %718, i32 %724)
  %726 = tail call i32 @llvm.fshr.i32(i32 %718, i32 %719, i32 %724)
  %727 = tail call i32 @llvm.fshr.i32(i32 %719, i32 %720, i32 %724)
  %728 = select i1 %723, i32 %717, i32 %725
  %729 = select i1 %723, i32 %718, i32 %726
  %730 = select i1 %723, i32 %719, i32 %727
  %731 = lshr i32 %728, 29
  %732 = tail call i32 @llvm.fshl.i32(i32 %728, i32 %729, i32 2)
  %733 = tail call i32 @llvm.fshl.i32(i32 %729, i32 %730, i32 2)
  %734 = tail call i32 @llvm.fshl.i32(i32 %730, i32 %720, i32 2)
  %735 = and i32 %731, 1
  %736 = sub nsw i32 0, %735
  %737 = shl i32 %731, 31
  %738 = xor i32 %732, %736
  %739 = xor i32 %733, %736
  %740 = xor i32 %734, %736
  %741 = tail call i32 @llvm.ctlz.i32(i32 %738, i1 false), !range !7
  %742 = sub nsw i32 31, %741
  %743 = tail call i32 @llvm.fshr.i32(i32 %738, i32 %739, i32 %742)
  %744 = tail call i32 @llvm.fshr.i32(i32 %739, i32 %740, i32 %742)
  %745 = shl nuw nsw i32 %741, 23
  %746 = sub nuw nsw i32 1056964608, %745
  %747 = lshr i32 %743, 9
  %748 = or i32 %747, %746
  %749 = or i32 %748, %737
  %750 = bitcast i32 %749 to float
  %751 = tail call i32 @llvm.fshl.i32(i32 %743, i32 %744, i32 23)
  %752 = tail call i32 @llvm.ctlz.i32(i32 %751, i1 false), !range !7
  %753 = fmul float %750, 0x3FF921FB40000000
  %754 = add nuw nsw i32 %752, %741
  %755 = shl nuw nsw i32 %754, 23
  %756 = sub nuw nsw i32 855638016, %755
  %757 = sub nsw i32 31, %752
  %758 = tail call i32 @llvm.fshr.i32(i32 %751, i32 %744, i32 %757)
  %759 = lshr i32 %758, 9
  %760 = or i32 %756, %759
  %761 = or i32 %760, %737
  %762 = bitcast i32 %761 to float
  %763 = fneg float %753
  %764 = tail call float @llvm.fma.f32(float %750, float 0x3FF921FB40000000, float %763)
  %765 = tail call float @llvm.fma.f32(float %750, float 0x3E74442D00000000, float %764)
  %766 = tail call float @llvm.fma.f32(float %762, float 0x3FF921FB40000000, float %765)
  %767 = fadd float %753, %766
  %768 = lshr i32 %728, 30
  %769 = add nuw nsw i32 %735, %768
  br label %770

770:                                              ; preds = %657, %664
  %771 = phi float [ %662, %657 ], [ %767, %664 ]
  %772 = phi i32 [ %663, %657 ], [ %769, %664 ]
  %773 = fmul float %771, %771
  %774 = tail call float @llvm.fmuladd.f32(float %773, float 0xBF29833040000000, float 0x3F81103880000000)
  %775 = tail call float @llvm.fmuladd.f32(float %773, float %774, float 0xBFC55553A0000000)
  %776 = fmul float %773, %775
  %777 = tail call float @llvm.fmuladd.f32(float %771, float %776, float %771)
  %778 = tail call float @llvm.fmuladd.f32(float %773, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %779 = tail call float @llvm.fmuladd.f32(float %773, float %778, float 0x3FA5557EE0000000)
  %780 = tail call float @llvm.fmuladd.f32(float %773, float %779, float 0xBFE0000080000000)
  %781 = tail call float @llvm.fmuladd.f32(float %773, float %780, float 1.000000e+00)
  %782 = fneg float %777
  %783 = and i32 %772, 1
  %784 = icmp eq i32 %783, 0
  %785 = select i1 %784, float %781, float %782
  %786 = bitcast float %785 to i32
  %787 = shl i32 %772, 30
  %788 = and i32 %787, -2147483648
  %789 = xor i32 %788, %786
  %790 = bitcast i32 %789 to float
  %791 = tail call i1 @llvm.amdgcn.class.f32(float %655, i32 504)
  %792 = fmul contract float %790, 5.000000e-01
  %793 = fadd contract float %792, 5.000000e-01
  %794 = select i1 %791, float %793, float 0x7FF8000000000000
  %795 = getelementptr inbounds float, float addrspace(1)* %33, i64 2
  store float %794, float addrspace(1)* %795, align 4, !tbaa !8
  %796 = getelementptr inbounds float, float addrspace(1)* %33, i64 3
  store float 1.000000e+00, float addrspace(1)* %796, align 4, !tbaa !8
  br label %797

797:                                              ; preds = %5, %770
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
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
