; ModuleID = '../data/hip_kernels/3190/5/main.cu'
source_filename = "../data/hip_kernels/3190/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z12windowHann2dPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = icmp slt i32 %12, %1
  %22 = icmp slt i32 %20, %2
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %325

24:                                               ; preds = %3
  %25 = shl nsw i32 %20, 1
  %26 = sitofp i32 %25 to float
  %27 = fmul contract float %26, 0x400921FA00000000
  %28 = add nsw i32 %2, -1
  %29 = sitofp i32 %28 to float
  %30 = fdiv contract float %27, %29
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = fcmp olt float %31, 1.310720e+05
  br i1 %32, label %33, label %40

33:                                               ; preds = %24
  %34 = fmul float %31, 0x3FE45F3060000000
  %35 = tail call float @llvm.rint.f32(float %34)
  %36 = tail call float @llvm.fma.f32(float %35, float 0xBFF921FB40000000, float %31)
  %37 = tail call float @llvm.fma.f32(float %35, float 0xBE74442D00000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %35, float 0xBCF8469880000000, float %37)
  %39 = fptosi float %35 to i32
  br label %146

40:                                               ; preds = %24
  %41 = bitcast float %31 to i32
  %42 = lshr i32 %41, 23
  %43 = and i32 %41, 8388607
  %44 = or i32 %43, 8388608
  %45 = zext i32 %44 to i64
  %46 = mul nuw nsw i64 %45, 4266746795
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %45, 1011060801
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %45, 3680671129
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %45, 4113882560
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %45, 4230436817
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = mul nuw nsw i64 %45, 1313084713
  %66 = add nuw nsw i64 %64, %65
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = mul nuw nsw i64 %45, 2734261102
  %70 = add nuw nsw i64 %68, %69
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = trunc i64 %72 to i32
  %74 = add nsw i32 %42, -120
  %75 = icmp ugt i32 %74, 63
  %76 = select i1 %75, i32 %67, i32 %73
  %77 = select i1 %75, i32 %63, i32 %71
  %78 = select i1 %75, i32 %59, i32 %67
  %79 = select i1 %75, i32 %55, i32 %63
  %80 = select i1 %75, i32 %51, i32 %59
  %81 = select i1 %75, i32 %47, i32 %55
  %82 = select i1 %75, i32 -64, i32 0
  %83 = add nsw i32 %82, %74
  %84 = icmp ugt i32 %83, 31
  %85 = select i1 %84, i32 %77, i32 %76
  %86 = select i1 %84, i32 %78, i32 %77
  %87 = select i1 %84, i32 %79, i32 %78
  %88 = select i1 %84, i32 %80, i32 %79
  %89 = select i1 %84, i32 %81, i32 %80
  %90 = select i1 %84, i32 -32, i32 0
  %91 = add nsw i32 %90, %83
  %92 = icmp ugt i32 %91, 31
  %93 = select i1 %92, i32 %86, i32 %85
  %94 = select i1 %92, i32 %87, i32 %86
  %95 = select i1 %92, i32 %88, i32 %87
  %96 = select i1 %92, i32 %89, i32 %88
  %97 = select i1 %92, i32 -32, i32 0
  %98 = add nsw i32 %97, %91
  %99 = icmp eq i32 %98, 0
  %100 = sub nsw i32 32, %98
  %101 = tail call i32 @llvm.fshr.i32(i32 %93, i32 %94, i32 %100)
  %102 = tail call i32 @llvm.fshr.i32(i32 %94, i32 %95, i32 %100)
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %100)
  %104 = select i1 %99, i32 %93, i32 %101
  %105 = select i1 %99, i32 %94, i32 %102
  %106 = select i1 %99, i32 %95, i32 %103
  %107 = lshr i32 %104, 29
  %108 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %105, i32 2)
  %109 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %106, i32 2)
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %96, i32 2)
  %111 = and i32 %107, 1
  %112 = sub nsw i32 0, %111
  %113 = shl i32 %107, 31
  %114 = xor i32 %108, %112
  %115 = xor i32 %109, %112
  %116 = xor i32 %110, %112
  %117 = tail call i32 @llvm.ctlz.i32(i32 %114, i1 false), !range !7
  %118 = sub nsw i32 31, %117
  %119 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %115, i32 %118)
  %120 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %116, i32 %118)
  %121 = shl nuw nsw i32 %117, 23
  %122 = sub nuw nsw i32 1056964608, %121
  %123 = lshr i32 %119, 9
  %124 = or i32 %123, %122
  %125 = or i32 %124, %113
  %126 = bitcast i32 %125 to float
  %127 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %120, i32 23)
  %128 = tail call i32 @llvm.ctlz.i32(i32 %127, i1 false), !range !7
  %129 = fmul float %126, 0x3FF921FB40000000
  %130 = add nuw nsw i32 %128, %117
  %131 = shl nuw nsw i32 %130, 23
  %132 = sub nuw nsw i32 855638016, %131
  %133 = sub nsw i32 31, %128
  %134 = tail call i32 @llvm.fshr.i32(i32 %127, i32 %120, i32 %133)
  %135 = lshr i32 %134, 9
  %136 = or i32 %132, %135
  %137 = or i32 %136, %113
  %138 = bitcast i32 %137 to float
  %139 = fneg float %129
  %140 = tail call float @llvm.fma.f32(float %126, float 0x3FF921FB40000000, float %139)
  %141 = tail call float @llvm.fma.f32(float %126, float 0x3E74442D00000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %138, float 0x3FF921FB40000000, float %141)
  %143 = fadd float %129, %142
  %144 = lshr i32 %104, 30
  %145 = add nuw nsw i32 %111, %144
  br label %146

146:                                              ; preds = %33, %40
  %147 = phi float [ %38, %33 ], [ %143, %40 ]
  %148 = phi i32 [ %39, %33 ], [ %145, %40 ]
  %149 = fmul float %147, %147
  %150 = tail call float @llvm.fmuladd.f32(float %149, float 0xBF29833040000000, float 0x3F81103880000000)
  %151 = tail call float @llvm.fmuladd.f32(float %149, float %150, float 0xBFC55553A0000000)
  %152 = fmul float %149, %151
  %153 = tail call float @llvm.fmuladd.f32(float %147, float %152, float %147)
  %154 = tail call float @llvm.fmuladd.f32(float %149, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %155 = tail call float @llvm.fmuladd.f32(float %149, float %154, float 0x3FA5557EE0000000)
  %156 = tail call float @llvm.fmuladd.f32(float %149, float %155, float 0xBFE0000080000000)
  %157 = tail call float @llvm.fmuladd.f32(float %149, float %156, float 1.000000e+00)
  %158 = fneg float %153
  %159 = and i32 %148, 1
  %160 = icmp eq i32 %159, 0
  %161 = select i1 %160, float %157, float %158
  %162 = bitcast float %161 to i32
  %163 = shl i32 %148, 30
  %164 = and i32 %163, -2147483648
  %165 = xor i32 %164, %162
  %166 = bitcast i32 %165 to float
  %167 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 504)
  %168 = fadd contract float %166, 1.000000e+00
  %169 = fpext float %168 to double
  %170 = fmul contract double %169, 5.000000e-01
  %171 = fmul contract double %170, 5.000000e-01
  %172 = select i1 %167, double %171, double 0x7FF8000000000000
  %173 = shl nsw i32 %12, 1
  %174 = sitofp i32 %173 to float
  %175 = fmul contract float %174, 0x400921FA00000000
  %176 = add nsw i32 %1, -1
  %177 = sitofp i32 %176 to float
  %178 = fdiv contract float %175, %177
  %179 = tail call float @llvm.fabs.f32(float %178)
  %180 = fcmp olt float %179, 1.310720e+05
  br i1 %180, label %181, label %188

181:                                              ; preds = %146
  %182 = fmul float %179, 0x3FE45F3060000000
  %183 = tail call float @llvm.rint.f32(float %182)
  %184 = tail call float @llvm.fma.f32(float %183, float 0xBFF921FB40000000, float %179)
  %185 = tail call float @llvm.fma.f32(float %183, float 0xBE74442D00000000, float %184)
  %186 = tail call float @llvm.fma.f32(float %183, float 0xBCF8469880000000, float %185)
  %187 = fptosi float %183 to i32
  br label %294

188:                                              ; preds = %146
  %189 = bitcast float %179 to i32
  %190 = lshr i32 %189, 23
  %191 = and i32 %189, 8388607
  %192 = or i32 %191, 8388608
  %193 = zext i32 %192 to i64
  %194 = mul nuw nsw i64 %193, 4266746795
  %195 = trunc i64 %194 to i32
  %196 = lshr i64 %194, 32
  %197 = mul nuw nsw i64 %193, 1011060801
  %198 = add nuw nsw i64 %196, %197
  %199 = trunc i64 %198 to i32
  %200 = lshr i64 %198, 32
  %201 = mul nuw nsw i64 %193, 3680671129
  %202 = add nuw nsw i64 %200, %201
  %203 = trunc i64 %202 to i32
  %204 = lshr i64 %202, 32
  %205 = mul nuw nsw i64 %193, 4113882560
  %206 = add nuw nsw i64 %204, %205
  %207 = trunc i64 %206 to i32
  %208 = lshr i64 %206, 32
  %209 = mul nuw nsw i64 %193, 4230436817
  %210 = add nuw nsw i64 %208, %209
  %211 = trunc i64 %210 to i32
  %212 = lshr i64 %210, 32
  %213 = mul nuw nsw i64 %193, 1313084713
  %214 = add nuw nsw i64 %212, %213
  %215 = trunc i64 %214 to i32
  %216 = lshr i64 %214, 32
  %217 = mul nuw nsw i64 %193, 2734261102
  %218 = add nuw nsw i64 %216, %217
  %219 = trunc i64 %218 to i32
  %220 = lshr i64 %218, 32
  %221 = trunc i64 %220 to i32
  %222 = add nsw i32 %190, -120
  %223 = icmp ugt i32 %222, 63
  %224 = select i1 %223, i32 %215, i32 %221
  %225 = select i1 %223, i32 %211, i32 %219
  %226 = select i1 %223, i32 %207, i32 %215
  %227 = select i1 %223, i32 %203, i32 %211
  %228 = select i1 %223, i32 %199, i32 %207
  %229 = select i1 %223, i32 %195, i32 %203
  %230 = select i1 %223, i32 -64, i32 0
  %231 = add nsw i32 %230, %222
  %232 = icmp ugt i32 %231, 31
  %233 = select i1 %232, i32 %225, i32 %224
  %234 = select i1 %232, i32 %226, i32 %225
  %235 = select i1 %232, i32 %227, i32 %226
  %236 = select i1 %232, i32 %228, i32 %227
  %237 = select i1 %232, i32 %229, i32 %228
  %238 = select i1 %232, i32 -32, i32 0
  %239 = add nsw i32 %238, %231
  %240 = icmp ugt i32 %239, 31
  %241 = select i1 %240, i32 %234, i32 %233
  %242 = select i1 %240, i32 %235, i32 %234
  %243 = select i1 %240, i32 %236, i32 %235
  %244 = select i1 %240, i32 %237, i32 %236
  %245 = select i1 %240, i32 -32, i32 0
  %246 = add nsw i32 %245, %239
  %247 = icmp eq i32 %246, 0
  %248 = sub nsw i32 32, %246
  %249 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %248)
  %250 = tail call i32 @llvm.fshr.i32(i32 %242, i32 %243, i32 %248)
  %251 = tail call i32 @llvm.fshr.i32(i32 %243, i32 %244, i32 %248)
  %252 = select i1 %247, i32 %241, i32 %249
  %253 = select i1 %247, i32 %242, i32 %250
  %254 = select i1 %247, i32 %243, i32 %251
  %255 = lshr i32 %252, 29
  %256 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %253, i32 2)
  %257 = tail call i32 @llvm.fshl.i32(i32 %253, i32 %254, i32 2)
  %258 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %244, i32 2)
  %259 = and i32 %255, 1
  %260 = sub nsw i32 0, %259
  %261 = shl i32 %255, 31
  %262 = xor i32 %256, %260
  %263 = xor i32 %257, %260
  %264 = xor i32 %258, %260
  %265 = tail call i32 @llvm.ctlz.i32(i32 %262, i1 false), !range !7
  %266 = sub nsw i32 31, %265
  %267 = tail call i32 @llvm.fshr.i32(i32 %262, i32 %263, i32 %266)
  %268 = tail call i32 @llvm.fshr.i32(i32 %263, i32 %264, i32 %266)
  %269 = shl nuw nsw i32 %265, 23
  %270 = sub nuw nsw i32 1056964608, %269
  %271 = lshr i32 %267, 9
  %272 = or i32 %271, %270
  %273 = or i32 %272, %261
  %274 = bitcast i32 %273 to float
  %275 = tail call i32 @llvm.fshl.i32(i32 %267, i32 %268, i32 23)
  %276 = tail call i32 @llvm.ctlz.i32(i32 %275, i1 false), !range !7
  %277 = fmul float %274, 0x3FF921FB40000000
  %278 = add nuw nsw i32 %276, %265
  %279 = shl nuw nsw i32 %278, 23
  %280 = sub nuw nsw i32 855638016, %279
  %281 = sub nsw i32 31, %276
  %282 = tail call i32 @llvm.fshr.i32(i32 %275, i32 %268, i32 %281)
  %283 = lshr i32 %282, 9
  %284 = or i32 %280, %283
  %285 = or i32 %284, %261
  %286 = bitcast i32 %285 to float
  %287 = fneg float %277
  %288 = tail call float @llvm.fma.f32(float %274, float 0x3FF921FB40000000, float %287)
  %289 = tail call float @llvm.fma.f32(float %274, float 0x3E74442D00000000, float %288)
  %290 = tail call float @llvm.fma.f32(float %286, float 0x3FF921FB40000000, float %289)
  %291 = fadd float %277, %290
  %292 = lshr i32 %252, 30
  %293 = add nuw nsw i32 %259, %292
  br label %294

294:                                              ; preds = %181, %188
  %295 = phi float [ %186, %181 ], [ %291, %188 ]
  %296 = phi i32 [ %187, %181 ], [ %293, %188 ]
  %297 = fmul float %295, %295
  %298 = tail call float @llvm.fmuladd.f32(float %297, float 0xBF29833040000000, float 0x3F81103880000000)
  %299 = tail call float @llvm.fmuladd.f32(float %297, float %298, float 0xBFC55553A0000000)
  %300 = fmul float %297, %299
  %301 = tail call float @llvm.fmuladd.f32(float %295, float %300, float %295)
  %302 = tail call float @llvm.fmuladd.f32(float %297, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %303 = tail call float @llvm.fmuladd.f32(float %297, float %302, float 0x3FA5557EE0000000)
  %304 = tail call float @llvm.fmuladd.f32(float %297, float %303, float 0xBFE0000080000000)
  %305 = tail call float @llvm.fmuladd.f32(float %297, float %304, float 1.000000e+00)
  %306 = fneg float %301
  %307 = and i32 %296, 1
  %308 = icmp eq i32 %307, 0
  %309 = select i1 %308, float %305, float %306
  %310 = bitcast float %309 to i32
  %311 = shl i32 %296, 30
  %312 = and i32 %311, -2147483648
  %313 = xor i32 %312, %310
  %314 = bitcast i32 %313 to float
  %315 = tail call i1 @llvm.amdgcn.class.f32(float %179, i32 504)
  %316 = fadd contract float %314, 1.000000e+00
  %317 = fpext float %316 to double
  %318 = select i1 %315, double %317, double 0x7FF8000000000000
  %319 = fmul contract double %172, %318
  %320 = fptrunc double %319 to float
  %321 = mul nsw i32 %20, %1
  %322 = add nsw i32 %321, %12
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  store float %320, float addrspace(1)* %324, align 4, !tbaa !8
  br label %325

325:                                              ; preds = %294, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
