; ModuleID = '../data/hip_kernels/247/113/main.cu'
source_filename = "../data/hip_kernels/247/113/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13hessianKernelPfPKfS1_S1_S1_S1_S1_fiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %8, %17
  %19 = udiv i32 %13, %18
  %20 = uitofp i32 %19 to float
  %21 = fptosi float %20 to i32
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = mul nsw i32 %18, %21
  %31 = sub i32 %13, %30
  %32 = mul i32 %31, %17
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %34 = mul i32 %21, %9
  %35 = add i32 %29, %34
  %36 = mul i32 %35, %8
  %37 = add i32 %32, %33
  %38 = add i32 %37, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fneg contract float %41
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fneg contract float %46
  %48 = getelementptr inbounds float, float addrspace(1)* %4, i64 %39
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = fneg contract float %49
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %39
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fneg contract float %52
  %54 = getelementptr inbounds float, float addrspace(1)* %6, i64 %39
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fneg contract float %55
  %57 = fsub contract float %50, %41
  %58 = fsub contract float %57, %55
  %59 = fdiv contract float %58, 3.000000e+00
  %60 = fsub contract float %42, %59
  %61 = fsub contract float %50, %59
  %62 = fsub contract float %56, %59
  %63 = fmul contract float %60, %61
  %64 = fmul contract float %62, %63
  %65 = fmul contract float %60, %53
  %66 = fmul contract float %52, %65
  %67 = fadd contract float %64, %66
  %68 = fmul contract float %44, %52
  %69 = fmul contract float %46, %68
  %70 = fsub contract float %67, %69
  %71 = fmul contract float %44, %44
  %72 = fmul contract float %71, %62
  %73 = fsub contract float %70, %72
  %74 = fmul contract float %44, %46
  %75 = fmul contract float %74, %52
  %76 = fsub contract float %73, %75
  %77 = fmul contract float %61, %47
  %78 = fmul contract float %46, %77
  %79 = fadd contract float %78, %76
  %80 = fmul contract float %79, 5.000000e-01
  %81 = fmul contract float %60, %60
  %82 = fadd contract float %71, %81
  %83 = fmul contract float %46, %46
  %84 = fadd contract float %83, %82
  %85 = fadd contract float %71, %84
  %86 = fmul contract float %61, %61
  %87 = fadd contract float %86, %85
  %88 = fmul contract float %52, %52
  %89 = fadd contract float %88, %87
  %90 = fadd contract float %83, %89
  %91 = fadd contract float %88, %90
  %92 = fmul contract float %62, %62
  %93 = fadd contract float %92, %91
  %94 = fdiv contract float %93, 6.000000e+00
  %95 = fmul contract float %94, %94
  %96 = fmul contract float %94, %95
  %97 = fmul contract float %80, %80
  %98 = fsub contract float %96, %97
  %99 = fcmp olt float %98, 0x39F0000000000000
  %100 = select i1 %99, float 0x41F0000000000000, float 1.000000e+00
  %101 = fmul float %98, %100
  %102 = tail call float @llvm.sqrt.f32(float %101)
  %103 = bitcast float %102 to i32
  %104 = add nsw i32 %103, -1
  %105 = bitcast i32 %104 to float
  %106 = add nsw i32 %103, 1
  %107 = bitcast i32 %106 to float
  %108 = tail call i1 @llvm.amdgcn.class.f32(float %101, i32 608)
  %109 = select i1 %99, float 0x3EF0000000000000, float 1.000000e+00
  %110 = fneg float %107
  %111 = tail call float @llvm.fma.f32(float %110, float %102, float %101)
  %112 = fcmp ogt float %111, 0.000000e+00
  %113 = fneg float %105
  %114 = tail call float @llvm.fma.f32(float %113, float %102, float %101)
  %115 = fcmp ole float %114, 0.000000e+00
  %116 = select i1 %115, float %105, float %102
  %117 = select i1 %112, float %107, float %116
  %118 = fmul float %109, %117
  %119 = select i1 %108, float %101, float %118
  %120 = fdiv contract float %119, %80
  %121 = tail call float @llvm.fabs.f32(float %120)
  %122 = fcmp ogt float %121, 1.000000e+00
  %123 = tail call float @llvm.amdgcn.rcp.f32(float %121)
  %124 = select i1 %122, float %123, float %121
  %125 = fmul float %124, %124
  %126 = tail call float @llvm.fmuladd.f32(float %125, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %127 = tail call float @llvm.fmuladd.f32(float %125, float %126, float 0x3FA53F67E0000000)
  %128 = tail call float @llvm.fmuladd.f32(float %125, float %127, float 0xBFB2FA9AE0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %125, float %128, float 0x3FBB263640000000)
  %130 = tail call float @llvm.fmuladd.f32(float %125, float %129, float 0xBFC22C1CC0000000)
  %131 = tail call float @llvm.fmuladd.f32(float %125, float %130, float 0x3FC99717E0000000)
  %132 = tail call float @llvm.fmuladd.f32(float %125, float %131, float 0xBFD5554C40000000)
  %133 = fmul float %125, %132
  %134 = tail call float @llvm.fmuladd.f32(float %124, float %133, float %124)
  %135 = fsub float 0x3FF921FB60000000, %134
  %136 = select i1 %122, float %135, float %134
  %137 = tail call float @llvm.copysign.f32(float %136, float %120)
  %138 = fmul contract float %137, 0x3FD5555560000000
  %139 = fcmp contract olt float %138, 0.000000e+00
  %140 = fadd contract float %138, 0x3FF0C15160000000
  %141 = select i1 %139, float %140, float %138
  %142 = fcmp olt float %94, 0x39F0000000000000
  %143 = select i1 %142, float 0x41F0000000000000, float 1.000000e+00
  %144 = fmul float %94, %143
  %145 = tail call float @llvm.sqrt.f32(float %144)
  %146 = bitcast float %145 to i32
  %147 = add nsw i32 %146, -1
  %148 = bitcast i32 %147 to float
  %149 = add nsw i32 %146, 1
  %150 = bitcast i32 %149 to float
  %151 = tail call i1 @llvm.amdgcn.class.f32(float %144, i32 608)
  %152 = select i1 %142, float 0x3EF0000000000000, float 1.000000e+00
  %153 = fneg float %150
  %154 = tail call float @llvm.fma.f32(float %153, float %145, float %144)
  %155 = fcmp ogt float %154, 0.000000e+00
  %156 = fneg float %148
  %157 = tail call float @llvm.fma.f32(float %156, float %145, float %144)
  %158 = fcmp ole float %157, 0.000000e+00
  %159 = select i1 %158, float %148, float %145
  %160 = select i1 %155, float %150, float %159
  %161 = fmul float %152, %160
  %162 = select i1 %151, float %144, float %161
  %163 = fmul contract float %162, 2.000000e+00
  %164 = tail call float @llvm.fabs.f32(float %141)
  %165 = fcmp olt float %164, 1.310720e+05
  br i1 %165, label %166, label %173

166:                                              ; preds = %11
  %167 = fmul float %164, 0x3FE45F3060000000
  %168 = tail call float @llvm.rint.f32(float %167)
  %169 = tail call float @llvm.fma.f32(float %168, float 0xBFF921FB40000000, float %164)
  %170 = tail call float @llvm.fma.f32(float %168, float 0xBE74442D00000000, float %169)
  %171 = tail call float @llvm.fma.f32(float %168, float 0xBCF8469880000000, float %170)
  %172 = fptosi float %168 to i32
  br label %279

173:                                              ; preds = %11
  %174 = bitcast float %164 to i32
  %175 = lshr i32 %174, 23
  %176 = and i32 %174, 8388607
  %177 = or i32 %176, 8388608
  %178 = zext i32 %177 to i64
  %179 = mul nuw nsw i64 %178, 4266746795
  %180 = trunc i64 %179 to i32
  %181 = lshr i64 %179, 32
  %182 = mul nuw nsw i64 %178, 1011060801
  %183 = add nuw nsw i64 %181, %182
  %184 = trunc i64 %183 to i32
  %185 = lshr i64 %183, 32
  %186 = mul nuw nsw i64 %178, 3680671129
  %187 = add nuw nsw i64 %185, %186
  %188 = trunc i64 %187 to i32
  %189 = lshr i64 %187, 32
  %190 = mul nuw nsw i64 %178, 4113882560
  %191 = add nuw nsw i64 %189, %190
  %192 = trunc i64 %191 to i32
  %193 = lshr i64 %191, 32
  %194 = mul nuw nsw i64 %178, 4230436817
  %195 = add nuw nsw i64 %193, %194
  %196 = trunc i64 %195 to i32
  %197 = lshr i64 %195, 32
  %198 = mul nuw nsw i64 %178, 1313084713
  %199 = add nuw nsw i64 %197, %198
  %200 = trunc i64 %199 to i32
  %201 = lshr i64 %199, 32
  %202 = mul nuw nsw i64 %178, 2734261102
  %203 = add nuw nsw i64 %201, %202
  %204 = trunc i64 %203 to i32
  %205 = lshr i64 %203, 32
  %206 = trunc i64 %205 to i32
  %207 = add nsw i32 %175, -120
  %208 = icmp ugt i32 %207, 63
  %209 = select i1 %208, i32 %200, i32 %206
  %210 = select i1 %208, i32 %196, i32 %204
  %211 = select i1 %208, i32 %192, i32 %200
  %212 = select i1 %208, i32 %188, i32 %196
  %213 = select i1 %208, i32 %184, i32 %192
  %214 = select i1 %208, i32 %180, i32 %188
  %215 = select i1 %208, i32 -64, i32 0
  %216 = add nsw i32 %215, %207
  %217 = icmp ugt i32 %216, 31
  %218 = select i1 %217, i32 %210, i32 %209
  %219 = select i1 %217, i32 %211, i32 %210
  %220 = select i1 %217, i32 %212, i32 %211
  %221 = select i1 %217, i32 %213, i32 %212
  %222 = select i1 %217, i32 %214, i32 %213
  %223 = select i1 %217, i32 -32, i32 0
  %224 = add nsw i32 %223, %216
  %225 = icmp ugt i32 %224, 31
  %226 = select i1 %225, i32 %219, i32 %218
  %227 = select i1 %225, i32 %220, i32 %219
  %228 = select i1 %225, i32 %221, i32 %220
  %229 = select i1 %225, i32 %222, i32 %221
  %230 = select i1 %225, i32 -32, i32 0
  %231 = add nsw i32 %230, %224
  %232 = icmp eq i32 %231, 0
  %233 = sub nsw i32 32, %231
  %234 = tail call i32 @llvm.fshr.i32(i32 %226, i32 %227, i32 %233)
  %235 = tail call i32 @llvm.fshr.i32(i32 %227, i32 %228, i32 %233)
  %236 = tail call i32 @llvm.fshr.i32(i32 %228, i32 %229, i32 %233)
  %237 = select i1 %232, i32 %226, i32 %234
  %238 = select i1 %232, i32 %227, i32 %235
  %239 = select i1 %232, i32 %228, i32 %236
  %240 = lshr i32 %237, 29
  %241 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %238, i32 2)
  %242 = tail call i32 @llvm.fshl.i32(i32 %238, i32 %239, i32 2)
  %243 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %229, i32 2)
  %244 = and i32 %240, 1
  %245 = sub nsw i32 0, %244
  %246 = shl i32 %240, 31
  %247 = xor i32 %241, %245
  %248 = xor i32 %242, %245
  %249 = xor i32 %243, %245
  %250 = tail call i32 @llvm.ctlz.i32(i32 %247, i1 false), !range !11
  %251 = sub nsw i32 31, %250
  %252 = tail call i32 @llvm.fshr.i32(i32 %247, i32 %248, i32 %251)
  %253 = tail call i32 @llvm.fshr.i32(i32 %248, i32 %249, i32 %251)
  %254 = shl nuw nsw i32 %250, 23
  %255 = sub nuw nsw i32 1056964608, %254
  %256 = lshr i32 %252, 9
  %257 = or i32 %256, %255
  %258 = or i32 %257, %246
  %259 = bitcast i32 %258 to float
  %260 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %253, i32 23)
  %261 = tail call i32 @llvm.ctlz.i32(i32 %260, i1 false), !range !11
  %262 = fmul float %259, 0x3FF921FB40000000
  %263 = add nuw nsw i32 %261, %250
  %264 = shl nuw nsw i32 %263, 23
  %265 = sub nuw nsw i32 855638016, %264
  %266 = sub nsw i32 31, %261
  %267 = tail call i32 @llvm.fshr.i32(i32 %260, i32 %253, i32 %266)
  %268 = lshr i32 %267, 9
  %269 = or i32 %265, %268
  %270 = or i32 %269, %246
  %271 = bitcast i32 %270 to float
  %272 = fneg float %262
  %273 = tail call float @llvm.fma.f32(float %259, float 0x3FF921FB40000000, float %272)
  %274 = tail call float @llvm.fma.f32(float %259, float 0x3E74442D00000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %271, float 0x3FF921FB40000000, float %274)
  %276 = fadd float %262, %275
  %277 = lshr i32 %237, 30
  %278 = add nuw nsw i32 %244, %277
  br label %279

279:                                              ; preds = %166, %173
  %280 = phi float [ %171, %166 ], [ %276, %173 ]
  %281 = phi i32 [ %172, %166 ], [ %278, %173 ]
  %282 = fmul float %280, %280
  %283 = tail call float @llvm.fmuladd.f32(float %282, float 0xBF29833040000000, float 0x3F81103880000000)
  %284 = tail call float @llvm.fmuladd.f32(float %282, float %283, float 0xBFC55553A0000000)
  %285 = fmul float %282, %284
  %286 = tail call float @llvm.fmuladd.f32(float %280, float %285, float %280)
  %287 = tail call float @llvm.fmuladd.f32(float %282, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %288 = tail call float @llvm.fmuladd.f32(float %282, float %287, float 0x3FA5557EE0000000)
  %289 = tail call float @llvm.fmuladd.f32(float %282, float %288, float 0xBFE0000080000000)
  %290 = tail call float @llvm.fmuladd.f32(float %282, float %289, float 1.000000e+00)
  %291 = fneg float %286
  %292 = and i32 %281, 1
  %293 = icmp eq i32 %292, 0
  %294 = select i1 %293, float %290, float %291
  %295 = bitcast float %294 to i32
  %296 = shl i32 %281, 30
  %297 = and i32 %296, -2147483648
  %298 = xor i32 %297, %295
  %299 = bitcast i32 %298 to float
  %300 = tail call i1 @llvm.amdgcn.class.f32(float %164, i32 504)
  %301 = select i1 %300, float %299, float 0x7FF8000000000000
  %302 = fmul contract float %163, %301
  %303 = fadd contract float %59, %302
  br i1 %165, label %304, label %311

304:                                              ; preds = %279
  %305 = fmul float %164, 0x3FE45F3060000000
  %306 = tail call float @llvm.rint.f32(float %305)
  %307 = tail call float @llvm.fma.f32(float %306, float 0xBFF921FB40000000, float %164)
  %308 = tail call float @llvm.fma.f32(float %306, float 0xBE74442D00000000, float %307)
  %309 = tail call float @llvm.fma.f32(float %306, float 0xBCF8469880000000, float %308)
  %310 = fptosi float %306 to i32
  br label %417

311:                                              ; preds = %279
  %312 = bitcast float %164 to i32
  %313 = lshr i32 %312, 23
  %314 = and i32 %312, 8388607
  %315 = or i32 %314, 8388608
  %316 = zext i32 %315 to i64
  %317 = mul nuw nsw i64 %316, 4266746795
  %318 = trunc i64 %317 to i32
  %319 = lshr i64 %317, 32
  %320 = mul nuw nsw i64 %316, 1011060801
  %321 = add nuw nsw i64 %319, %320
  %322 = trunc i64 %321 to i32
  %323 = lshr i64 %321, 32
  %324 = mul nuw nsw i64 %316, 3680671129
  %325 = add nuw nsw i64 %323, %324
  %326 = trunc i64 %325 to i32
  %327 = lshr i64 %325, 32
  %328 = mul nuw nsw i64 %316, 4113882560
  %329 = add nuw nsw i64 %327, %328
  %330 = trunc i64 %329 to i32
  %331 = lshr i64 %329, 32
  %332 = mul nuw nsw i64 %316, 4230436817
  %333 = add nuw nsw i64 %331, %332
  %334 = trunc i64 %333 to i32
  %335 = lshr i64 %333, 32
  %336 = mul nuw nsw i64 %316, 1313084713
  %337 = add nuw nsw i64 %335, %336
  %338 = trunc i64 %337 to i32
  %339 = lshr i64 %337, 32
  %340 = mul nuw nsw i64 %316, 2734261102
  %341 = add nuw nsw i64 %339, %340
  %342 = trunc i64 %341 to i32
  %343 = lshr i64 %341, 32
  %344 = trunc i64 %343 to i32
  %345 = add nsw i32 %313, -120
  %346 = icmp ugt i32 %345, 63
  %347 = select i1 %346, i32 %338, i32 %344
  %348 = select i1 %346, i32 %334, i32 %342
  %349 = select i1 %346, i32 %330, i32 %338
  %350 = select i1 %346, i32 %326, i32 %334
  %351 = select i1 %346, i32 %322, i32 %330
  %352 = select i1 %346, i32 %318, i32 %326
  %353 = select i1 %346, i32 -64, i32 0
  %354 = add nsw i32 %353, %345
  %355 = icmp ugt i32 %354, 31
  %356 = select i1 %355, i32 %348, i32 %347
  %357 = select i1 %355, i32 %349, i32 %348
  %358 = select i1 %355, i32 %350, i32 %349
  %359 = select i1 %355, i32 %351, i32 %350
  %360 = select i1 %355, i32 %352, i32 %351
  %361 = select i1 %355, i32 -32, i32 0
  %362 = add nsw i32 %361, %354
  %363 = icmp ugt i32 %362, 31
  %364 = select i1 %363, i32 %357, i32 %356
  %365 = select i1 %363, i32 %358, i32 %357
  %366 = select i1 %363, i32 %359, i32 %358
  %367 = select i1 %363, i32 %360, i32 %359
  %368 = select i1 %363, i32 -32, i32 0
  %369 = add nsw i32 %368, %362
  %370 = icmp eq i32 %369, 0
  %371 = sub nsw i32 32, %369
  %372 = tail call i32 @llvm.fshr.i32(i32 %364, i32 %365, i32 %371)
  %373 = tail call i32 @llvm.fshr.i32(i32 %365, i32 %366, i32 %371)
  %374 = tail call i32 @llvm.fshr.i32(i32 %366, i32 %367, i32 %371)
  %375 = select i1 %370, i32 %364, i32 %372
  %376 = select i1 %370, i32 %365, i32 %373
  %377 = select i1 %370, i32 %366, i32 %374
  %378 = lshr i32 %375, 29
  %379 = tail call i32 @llvm.fshl.i32(i32 %375, i32 %376, i32 2)
  %380 = tail call i32 @llvm.fshl.i32(i32 %376, i32 %377, i32 2)
  %381 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %367, i32 2)
  %382 = and i32 %378, 1
  %383 = sub nsw i32 0, %382
  %384 = shl i32 %378, 31
  %385 = xor i32 %379, %383
  %386 = xor i32 %380, %383
  %387 = xor i32 %381, %383
  %388 = tail call i32 @llvm.ctlz.i32(i32 %385, i1 false), !range !11
  %389 = sub nsw i32 31, %388
  %390 = tail call i32 @llvm.fshr.i32(i32 %385, i32 %386, i32 %389)
  %391 = tail call i32 @llvm.fshr.i32(i32 %386, i32 %387, i32 %389)
  %392 = shl nuw nsw i32 %388, 23
  %393 = sub nuw nsw i32 1056964608, %392
  %394 = lshr i32 %390, 9
  %395 = or i32 %394, %393
  %396 = or i32 %395, %384
  %397 = bitcast i32 %396 to float
  %398 = tail call i32 @llvm.fshl.i32(i32 %390, i32 %391, i32 23)
  %399 = tail call i32 @llvm.ctlz.i32(i32 %398, i1 false), !range !11
  %400 = fmul float %397, 0x3FF921FB40000000
  %401 = add nuw nsw i32 %399, %388
  %402 = shl nuw nsw i32 %401, 23
  %403 = sub nuw nsw i32 855638016, %402
  %404 = sub nsw i32 31, %399
  %405 = tail call i32 @llvm.fshr.i32(i32 %398, i32 %391, i32 %404)
  %406 = lshr i32 %405, 9
  %407 = or i32 %403, %406
  %408 = or i32 %407, %384
  %409 = bitcast i32 %408 to float
  %410 = fneg float %400
  %411 = tail call float @llvm.fma.f32(float %397, float 0x3FF921FB40000000, float %410)
  %412 = tail call float @llvm.fma.f32(float %397, float 0x3E74442D00000000, float %411)
  %413 = tail call float @llvm.fma.f32(float %409, float 0x3FF921FB40000000, float %412)
  %414 = fadd float %400, %413
  %415 = lshr i32 %375, 30
  %416 = add nuw nsw i32 %382, %415
  br label %417

417:                                              ; preds = %304, %311
  %418 = phi float [ %309, %304 ], [ %414, %311 ]
  %419 = phi i32 [ %310, %304 ], [ %416, %311 ]
  %420 = fmul float %418, %418
  %421 = tail call float @llvm.fmuladd.f32(float %420, float 0xBF29833040000000, float 0x3F81103880000000)
  %422 = tail call float @llvm.fmuladd.f32(float %420, float %421, float 0xBFC55553A0000000)
  %423 = fmul float %420, %422
  %424 = tail call float @llvm.fmuladd.f32(float %418, float %423, float %418)
  %425 = tail call float @llvm.fmuladd.f32(float %420, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %426 = tail call float @llvm.fmuladd.f32(float %420, float %425, float 0x3FA5557EE0000000)
  %427 = tail call float @llvm.fmuladd.f32(float %420, float %426, float 0xBFE0000080000000)
  %428 = tail call float @llvm.fmuladd.f32(float %420, float %427, float 1.000000e+00)
  %429 = fneg float %424
  %430 = and i32 %419, 1
  %431 = icmp eq i32 %430, 0
  %432 = select i1 %431, float %428, float %429
  %433 = bitcast float %432 to i32
  %434 = shl i32 %419, 30
  %435 = and i32 %434, -2147483648
  %436 = xor i32 %435, %433
  %437 = bitcast i32 %436 to float
  br i1 %165, label %438, label %446

438:                                              ; preds = %417
  %439 = fmul float %164, 0x3FE45F3060000000
  %440 = tail call float @llvm.rint.f32(float %439)
  %441 = tail call float @llvm.fma.f32(float %440, float 0xBFF921FB40000000, float %164)
  %442 = tail call float @llvm.fma.f32(float %440, float 0xBE74442D00000000, float %441)
  %443 = tail call float @llvm.fma.f32(float %440, float 0xBCF8469880000000, float %442)
  %444 = fptosi float %440 to i32
  %445 = bitcast float %164 to i32
  br label %552

446:                                              ; preds = %417
  %447 = bitcast float %164 to i32
  %448 = lshr i32 %447, 23
  %449 = and i32 %447, 8388607
  %450 = or i32 %449, 8388608
  %451 = zext i32 %450 to i64
  %452 = mul nuw nsw i64 %451, 4266746795
  %453 = trunc i64 %452 to i32
  %454 = lshr i64 %452, 32
  %455 = mul nuw nsw i64 %451, 1011060801
  %456 = add nuw nsw i64 %454, %455
  %457 = trunc i64 %456 to i32
  %458 = lshr i64 %456, 32
  %459 = mul nuw nsw i64 %451, 3680671129
  %460 = add nuw nsw i64 %458, %459
  %461 = trunc i64 %460 to i32
  %462 = lshr i64 %460, 32
  %463 = mul nuw nsw i64 %451, 4113882560
  %464 = add nuw nsw i64 %462, %463
  %465 = trunc i64 %464 to i32
  %466 = lshr i64 %464, 32
  %467 = mul nuw nsw i64 %451, 4230436817
  %468 = add nuw nsw i64 %466, %467
  %469 = trunc i64 %468 to i32
  %470 = lshr i64 %468, 32
  %471 = mul nuw nsw i64 %451, 1313084713
  %472 = add nuw nsw i64 %470, %471
  %473 = trunc i64 %472 to i32
  %474 = lshr i64 %472, 32
  %475 = mul nuw nsw i64 %451, 2734261102
  %476 = add nuw nsw i64 %474, %475
  %477 = trunc i64 %476 to i32
  %478 = lshr i64 %476, 32
  %479 = trunc i64 %478 to i32
  %480 = add nsw i32 %448, -120
  %481 = icmp ugt i32 %480, 63
  %482 = select i1 %481, i32 %473, i32 %479
  %483 = select i1 %481, i32 %469, i32 %477
  %484 = select i1 %481, i32 %465, i32 %473
  %485 = select i1 %481, i32 %461, i32 %469
  %486 = select i1 %481, i32 %457, i32 %465
  %487 = select i1 %481, i32 %453, i32 %461
  %488 = select i1 %481, i32 -64, i32 0
  %489 = add nsw i32 %488, %480
  %490 = icmp ugt i32 %489, 31
  %491 = select i1 %490, i32 %483, i32 %482
  %492 = select i1 %490, i32 %484, i32 %483
  %493 = select i1 %490, i32 %485, i32 %484
  %494 = select i1 %490, i32 %486, i32 %485
  %495 = select i1 %490, i32 %487, i32 %486
  %496 = select i1 %490, i32 -32, i32 0
  %497 = add nsw i32 %496, %489
  %498 = icmp ugt i32 %497, 31
  %499 = select i1 %498, i32 %492, i32 %491
  %500 = select i1 %498, i32 %493, i32 %492
  %501 = select i1 %498, i32 %494, i32 %493
  %502 = select i1 %498, i32 %495, i32 %494
  %503 = select i1 %498, i32 -32, i32 0
  %504 = add nsw i32 %503, %497
  %505 = icmp eq i32 %504, 0
  %506 = sub nsw i32 32, %504
  %507 = tail call i32 @llvm.fshr.i32(i32 %499, i32 %500, i32 %506)
  %508 = tail call i32 @llvm.fshr.i32(i32 %500, i32 %501, i32 %506)
  %509 = tail call i32 @llvm.fshr.i32(i32 %501, i32 %502, i32 %506)
  %510 = select i1 %505, i32 %499, i32 %507
  %511 = select i1 %505, i32 %500, i32 %508
  %512 = select i1 %505, i32 %501, i32 %509
  %513 = lshr i32 %510, 29
  %514 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %511, i32 2)
  %515 = tail call i32 @llvm.fshl.i32(i32 %511, i32 %512, i32 2)
  %516 = tail call i32 @llvm.fshl.i32(i32 %512, i32 %502, i32 2)
  %517 = and i32 %513, 1
  %518 = sub nsw i32 0, %517
  %519 = shl i32 %513, 31
  %520 = xor i32 %514, %518
  %521 = xor i32 %515, %518
  %522 = xor i32 %516, %518
  %523 = tail call i32 @llvm.ctlz.i32(i32 %520, i1 false), !range !11
  %524 = sub nsw i32 31, %523
  %525 = tail call i32 @llvm.fshr.i32(i32 %520, i32 %521, i32 %524)
  %526 = tail call i32 @llvm.fshr.i32(i32 %521, i32 %522, i32 %524)
  %527 = shl nuw nsw i32 %523, 23
  %528 = sub nuw nsw i32 1056964608, %527
  %529 = lshr i32 %525, 9
  %530 = or i32 %529, %528
  %531 = or i32 %530, %519
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.fshl.i32(i32 %525, i32 %526, i32 23)
  %534 = tail call i32 @llvm.ctlz.i32(i32 %533, i1 false), !range !11
  %535 = fmul float %532, 0x3FF921FB40000000
  %536 = add nuw nsw i32 %534, %523
  %537 = shl nuw nsw i32 %536, 23
  %538 = sub nuw nsw i32 855638016, %537
  %539 = sub nsw i32 31, %534
  %540 = tail call i32 @llvm.fshr.i32(i32 %533, i32 %526, i32 %539)
  %541 = lshr i32 %540, 9
  %542 = or i32 %538, %541
  %543 = or i32 %542, %519
  %544 = bitcast i32 %543 to float
  %545 = fneg float %535
  %546 = tail call float @llvm.fma.f32(float %532, float 0x3FF921FB40000000, float %545)
  %547 = tail call float @llvm.fma.f32(float %532, float 0x3E74442D00000000, float %546)
  %548 = tail call float @llvm.fma.f32(float %544, float 0x3FF921FB40000000, float %547)
  %549 = fadd float %535, %548
  %550 = lshr i32 %510, 30
  %551 = add nuw nsw i32 %517, %550
  br label %552

552:                                              ; preds = %438, %446
  %553 = phi i32 [ %445, %438 ], [ %447, %446 ]
  %554 = phi float [ %443, %438 ], [ %549, %446 ]
  %555 = phi i32 [ %444, %438 ], [ %551, %446 ]
  %556 = fmul float %554, %554
  %557 = tail call float @llvm.fmuladd.f32(float %556, float 0xBF29833040000000, float 0x3F81103880000000)
  %558 = tail call float @llvm.fmuladd.f32(float %556, float %557, float 0xBFC55553A0000000)
  %559 = fmul float %556, %558
  %560 = tail call float @llvm.fmuladd.f32(float %554, float %559, float %554)
  %561 = tail call float @llvm.fmuladd.f32(float %556, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %562 = tail call float @llvm.fmuladd.f32(float %556, float %561, float 0x3FA5557EE0000000)
  %563 = tail call float @llvm.fmuladd.f32(float %556, float %562, float 0xBFE0000080000000)
  %564 = tail call float @llvm.fmuladd.f32(float %556, float %563, float 1.000000e+00)
  %565 = and i32 %555, 1
  %566 = icmp eq i32 %565, 0
  %567 = select i1 %566, float %560, float %564
  %568 = bitcast float %567 to i32
  %569 = shl i32 %555, 30
  %570 = and i32 %569, -2147483648
  %571 = bitcast float %141 to i32
  %572 = xor i32 %553, %570
  %573 = xor i32 %572, %568
  %574 = xor i32 %573, %571
  %575 = bitcast i32 %574 to float
  %576 = fmul contract float %575, 0x3FFBB67AE0000000
  %577 = fadd contract float %576, %437
  %578 = select contract i1 %300, float %577, float 0x7FF8000000000000
  %579 = fmul contract float %162, %578
  %580 = fsub contract float %59, %579
  br i1 %165, label %581, label %608

581:                                              ; preds = %552
  %582 = fmul float %164, 0x3FE45F3060000000
  %583 = tail call float @llvm.rint.f32(float %582)
  %584 = tail call float @llvm.fma.f32(float %583, float 0xBFF921FB40000000, float %164)
  %585 = tail call float @llvm.fma.f32(float %583, float 0xBE74442D00000000, float %584)
  %586 = tail call float @llvm.fma.f32(float %583, float 0xBCF8469880000000, float %585)
  %587 = fptosi float %583 to i32
  %588 = fmul float %586, %586
  %589 = tail call float @llvm.fmuladd.f32(float %588, float 0xBF29833040000000, float 0x3F81103880000000)
  %590 = tail call float @llvm.fmuladd.f32(float %588, float %589, float 0xBFC55553A0000000)
  %591 = fmul float %588, %590
  %592 = tail call float @llvm.fmuladd.f32(float %586, float %591, float %586)
  %593 = tail call float @llvm.fmuladd.f32(float %588, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %594 = tail call float @llvm.fmuladd.f32(float %588, float %593, float 0x3FA5557EE0000000)
  %595 = tail call float @llvm.fmuladd.f32(float %588, float %594, float 0xBFE0000080000000)
  %596 = tail call float @llvm.fmuladd.f32(float %588, float %595, float 1.000000e+00)
  %597 = fneg float %592
  %598 = and i32 %587, 1
  %599 = icmp eq i32 %598, 0
  %600 = select i1 %599, float %596, float %597
  %601 = bitcast float %600 to i32
  %602 = shl i32 %587, 30
  %603 = and i32 %602, -2147483648
  %604 = xor i32 %603, %601
  %605 = bitcast i32 %604 to float
  %606 = select i1 %300, float %605, float 0x7FF8000000000000
  %607 = bitcast float %164 to i32
  br label %733

608:                                              ; preds = %552
  %609 = bitcast float %164 to i32
  %610 = lshr i32 %609, 23
  %611 = and i32 %609, 8388607
  %612 = or i32 %611, 8388608
  %613 = zext i32 %612 to i64
  %614 = mul nuw nsw i64 %613, 4266746795
  %615 = trunc i64 %614 to i32
  %616 = lshr i64 %614, 32
  %617 = mul nuw nsw i64 %613, 1011060801
  %618 = add nuw nsw i64 %616, %617
  %619 = trunc i64 %618 to i32
  %620 = lshr i64 %618, 32
  %621 = mul nuw nsw i64 %613, 3680671129
  %622 = add nuw nsw i64 %620, %621
  %623 = trunc i64 %622 to i32
  %624 = lshr i64 %622, 32
  %625 = mul nuw nsw i64 %613, 4113882560
  %626 = add nuw nsw i64 %624, %625
  %627 = trunc i64 %626 to i32
  %628 = lshr i64 %626, 32
  %629 = mul nuw nsw i64 %613, 4230436817
  %630 = add nuw nsw i64 %628, %629
  %631 = trunc i64 %630 to i32
  %632 = lshr i64 %630, 32
  %633 = mul nuw nsw i64 %613, 1313084713
  %634 = add nuw nsw i64 %632, %633
  %635 = trunc i64 %634 to i32
  %636 = lshr i64 %634, 32
  %637 = mul nuw nsw i64 %613, 2734261102
  %638 = add nuw nsw i64 %636, %637
  %639 = trunc i64 %638 to i32
  %640 = lshr i64 %638, 32
  %641 = trunc i64 %640 to i32
  %642 = add nsw i32 %610, -120
  %643 = icmp ugt i32 %642, 63
  %644 = select i1 %643, i32 %635, i32 %641
  %645 = select i1 %643, i32 %631, i32 %639
  %646 = select i1 %643, i32 %627, i32 %635
  %647 = select i1 %643, i32 %623, i32 %631
  %648 = select i1 %643, i32 %619, i32 %627
  %649 = select i1 %643, i32 %615, i32 %623
  %650 = select i1 %643, i32 -64, i32 0
  %651 = add nsw i32 %650, %642
  %652 = icmp ugt i32 %651, 31
  %653 = select i1 %652, i32 %645, i32 %644
  %654 = select i1 %652, i32 %646, i32 %645
  %655 = select i1 %652, i32 %647, i32 %646
  %656 = select i1 %652, i32 %648, i32 %647
  %657 = select i1 %652, i32 %649, i32 %648
  %658 = select i1 %652, i32 -32, i32 0
  %659 = add nsw i32 %658, %651
  %660 = icmp ugt i32 %659, 31
  %661 = select i1 %660, i32 %654, i32 %653
  %662 = select i1 %660, i32 %655, i32 %654
  %663 = select i1 %660, i32 %656, i32 %655
  %664 = select i1 %660, i32 %657, i32 %656
  %665 = select i1 %660, i32 -32, i32 0
  %666 = add nsw i32 %665, %659
  %667 = icmp eq i32 %666, 0
  %668 = sub nsw i32 32, %666
  %669 = tail call i32 @llvm.fshr.i32(i32 %661, i32 %662, i32 %668)
  %670 = tail call i32 @llvm.fshr.i32(i32 %662, i32 %663, i32 %668)
  %671 = tail call i32 @llvm.fshr.i32(i32 %663, i32 %664, i32 %668)
  %672 = select i1 %667, i32 %661, i32 %669
  %673 = select i1 %667, i32 %662, i32 %670
  %674 = select i1 %667, i32 %663, i32 %671
  %675 = lshr i32 %672, 29
  %676 = tail call i32 @llvm.fshl.i32(i32 %672, i32 %673, i32 2)
  %677 = tail call i32 @llvm.fshl.i32(i32 %673, i32 %674, i32 2)
  %678 = tail call i32 @llvm.fshl.i32(i32 %674, i32 %664, i32 2)
  %679 = and i32 %675, 1
  %680 = sub nsw i32 0, %679
  %681 = shl i32 %675, 31
  %682 = xor i32 %676, %680
  %683 = xor i32 %677, %680
  %684 = xor i32 %678, %680
  %685 = tail call i32 @llvm.ctlz.i32(i32 %682, i1 false), !range !11
  %686 = sub nsw i32 31, %685
  %687 = tail call i32 @llvm.fshr.i32(i32 %682, i32 %683, i32 %686)
  %688 = tail call i32 @llvm.fshr.i32(i32 %683, i32 %684, i32 %686)
  %689 = shl nuw nsw i32 %685, 23
  %690 = sub nuw nsw i32 1056964608, %689
  %691 = lshr i32 %687, 9
  %692 = or i32 %691, %690
  %693 = or i32 %692, %681
  %694 = bitcast i32 %693 to float
  %695 = tail call i32 @llvm.fshl.i32(i32 %687, i32 %688, i32 23)
  %696 = tail call i32 @llvm.ctlz.i32(i32 %695, i1 false), !range !11
  %697 = fmul float %694, 0x3FF921FB40000000
  %698 = add nuw nsw i32 %696, %685
  %699 = shl nuw nsw i32 %698, 23
  %700 = sub nuw nsw i32 855638016, %699
  %701 = sub nsw i32 31, %696
  %702 = tail call i32 @llvm.fshr.i32(i32 %695, i32 %688, i32 %701)
  %703 = lshr i32 %702, 9
  %704 = or i32 %700, %703
  %705 = or i32 %704, %681
  %706 = bitcast i32 %705 to float
  %707 = fneg float %697
  %708 = tail call float @llvm.fma.f32(float %694, float 0x3FF921FB40000000, float %707)
  %709 = tail call float @llvm.fma.f32(float %694, float 0x3E74442D00000000, float %708)
  %710 = tail call float @llvm.fma.f32(float %706, float 0x3FF921FB40000000, float %709)
  %711 = fadd float %697, %710
  %712 = lshr i32 %672, 30
  %713 = add nuw nsw i32 %679, %712
  %714 = fmul float %711, %711
  %715 = tail call float @llvm.fmuladd.f32(float %714, float 0xBF29833040000000, float 0x3F81103880000000)
  %716 = tail call float @llvm.fmuladd.f32(float %714, float %715, float 0xBFC55553A0000000)
  %717 = fmul float %714, %716
  %718 = tail call float @llvm.fmuladd.f32(float %711, float %717, float %711)
  %719 = tail call float @llvm.fmuladd.f32(float %714, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %720 = tail call float @llvm.fmuladd.f32(float %714, float %719, float 0x3FA5557EE0000000)
  %721 = tail call float @llvm.fmuladd.f32(float %714, float %720, float 0xBFE0000080000000)
  %722 = tail call float @llvm.fmuladd.f32(float %714, float %721, float 1.000000e+00)
  %723 = fneg float %718
  %724 = and i32 %713, 1
  %725 = icmp eq i32 %724, 0
  %726 = select i1 %725, float %722, float %723
  %727 = bitcast float %726 to i32
  %728 = shl i32 %713, 30
  %729 = and i32 %728, -2147483648
  %730 = xor i32 %729, %727
  %731 = bitcast i32 %730 to float
  %732 = select i1 %300, float %731, float 0x7FF8000000000000
  br label %733

733:                                              ; preds = %581, %608
  %734 = phi i32 [ %603, %581 ], [ %729, %608 ]
  %735 = phi i32 [ %598, %581 ], [ %724, %608 ]
  %736 = phi float [ %596, %581 ], [ %722, %608 ]
  %737 = phi float [ %592, %581 ], [ %718, %608 ]
  %738 = phi float [ %606, %581 ], [ %732, %608 ]
  %739 = phi i32 [ %607, %581 ], [ %609, %608 ]
  %740 = icmp eq i32 %735, 0
  %741 = select i1 %740, float %737, float %736
  %742 = bitcast float %741 to i32
  %743 = xor i32 %739, %734
  %744 = xor i32 %743, %742
  %745 = xor i32 %744, %571
  %746 = bitcast i32 %745 to float
  %747 = fmul contract float %746, 0x3FFBB67AE0000000
  %748 = select i1 %300, float %747, float 0x7FF8000000000000
  %749 = fsub contract float %738, %748
  %750 = fmul contract float %162, %749
  %751 = fsub contract float %59, %750
  %752 = fcmp contract ogt float %303, %580
  %753 = fcmp contract ogt float %303, %751
  %754 = and i1 %752, %753
  br i1 %754, label %755, label %759

755:                                              ; preds = %733
  %756 = fmul contract float %303, %7
  %757 = fmul contract float %756, %7
  %758 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %757, float addrspace(1)* %758, align 4, !tbaa !7
  br label %759

759:                                              ; preds = %755, %733
  %760 = fcmp contract ogt float %580, %303
  %761 = fcmp contract ogt float %580, %751
  %762 = and i1 %760, %761
  br i1 %762, label %763, label %767

763:                                              ; preds = %759
  %764 = fmul contract float %580, %7
  %765 = fmul contract float %764, %7
  %766 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %765, float addrspace(1)* %766, align 4, !tbaa !7
  br label %767

767:                                              ; preds = %763, %759
  %768 = fcmp contract ogt float %751, %580
  %769 = fcmp contract ogt float %751, %303
  %770 = and i1 %768, %769
  br i1 %770, label %771, label %775

771:                                              ; preds = %767
  %772 = fmul contract float %751, %7
  %773 = fmul contract float %772, %7
  %774 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %773, float addrspace(1)* %774, align 4, !tbaa !7
  br label %775

775:                                              ; preds = %771, %767
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
declare float @llvm.sqrt.f32(float) #1

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
