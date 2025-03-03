; ModuleID = '../data/hip_kernels/1119/40/main.cu'
source_filename = "../data/hip_kernels/1119/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z24cuSetupSincKernel_kernelPfiffiffff(float addrspace(1)* nocapture writeonly %0, i32 %1, float %2, float %3, i32 %4, float %5, float %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = icmp sgt i32 %18, %1
  br i1 %19, label %321, label %20

20:                                               ; preds = %9
  %21 = sitofp i32 %18 to float
  %22 = fsub contract float %21, %2
  %23 = fsub contract float 1.000000e+00, %3
  %24 = fmul contract float %22, 0x400921FB60000000
  %25 = fmul contract float %24, %5
  %26 = tail call float @llvm.fabs.f32(float %25)
  %27 = fcmp olt float %26, 1.310720e+05
  br i1 %27, label %28, label %35

28:                                               ; preds = %20
  %29 = fmul float %26, 0x3FE45F3060000000
  %30 = tail call float @llvm.rint.f32(float %29)
  %31 = tail call float @llvm.fma.f32(float %30, float 0xBFF921FB40000000, float %26)
  %32 = tail call float @llvm.fma.f32(float %30, float 0xBE74442D00000000, float %31)
  %33 = tail call float @llvm.fma.f32(float %30, float 0xBCF8469880000000, float %32)
  %34 = fptosi float %30 to i32
  br label %141

35:                                               ; preds = %20
  %36 = bitcast float %26 to i32
  %37 = lshr i32 %36, 23
  %38 = and i32 %36, 8388607
  %39 = or i32 %38, 8388608
  %40 = zext i32 %39 to i64
  %41 = mul nuw nsw i64 %40, 4266746795
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %41, 32
  %44 = mul nuw nsw i64 %40, 1011060801
  %45 = add nuw nsw i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %40, 3680671129
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %40, 4113882560
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %40, 4230436817
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %40, 1313084713
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %40, 2734261102
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = trunc i64 %67 to i32
  %69 = add nsw i32 %37, -120
  %70 = icmp ugt i32 %69, 63
  %71 = select i1 %70, i32 %62, i32 %68
  %72 = select i1 %70, i32 %58, i32 %66
  %73 = select i1 %70, i32 %54, i32 %62
  %74 = select i1 %70, i32 %50, i32 %58
  %75 = select i1 %70, i32 %46, i32 %54
  %76 = select i1 %70, i32 %42, i32 %50
  %77 = select i1 %70, i32 -64, i32 0
  %78 = add nsw i32 %77, %69
  %79 = icmp ugt i32 %78, 31
  %80 = select i1 %79, i32 %72, i32 %71
  %81 = select i1 %79, i32 %73, i32 %72
  %82 = select i1 %79, i32 %74, i32 %73
  %83 = select i1 %79, i32 %75, i32 %74
  %84 = select i1 %79, i32 %76, i32 %75
  %85 = select i1 %79, i32 -32, i32 0
  %86 = add nsw i32 %85, %78
  %87 = icmp ugt i32 %86, 31
  %88 = select i1 %87, i32 %81, i32 %80
  %89 = select i1 %87, i32 %82, i32 %81
  %90 = select i1 %87, i32 %83, i32 %82
  %91 = select i1 %87, i32 %84, i32 %83
  %92 = select i1 %87, i32 -32, i32 0
  %93 = add nsw i32 %92, %86
  %94 = icmp eq i32 %93, 0
  %95 = sub nsw i32 32, %93
  %96 = tail call i32 @llvm.fshr.i32(i32 %88, i32 %89, i32 %95)
  %97 = tail call i32 @llvm.fshr.i32(i32 %89, i32 %90, i32 %95)
  %98 = tail call i32 @llvm.fshr.i32(i32 %90, i32 %91, i32 %95)
  %99 = select i1 %94, i32 %88, i32 %96
  %100 = select i1 %94, i32 %89, i32 %97
  %101 = select i1 %94, i32 %90, i32 %98
  %102 = lshr i32 %99, 29
  %103 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %100, i32 2)
  %104 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %101, i32 2)
  %105 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %91, i32 2)
  %106 = and i32 %102, 1
  %107 = sub nsw i32 0, %106
  %108 = shl i32 %102, 31
  %109 = xor i32 %103, %107
  %110 = xor i32 %104, %107
  %111 = xor i32 %105, %107
  %112 = tail call i32 @llvm.ctlz.i32(i32 %109, i1 false), !range !7
  %113 = sub nsw i32 31, %112
  %114 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %113)
  %115 = tail call i32 @llvm.fshr.i32(i32 %110, i32 %111, i32 %113)
  %116 = shl nuw nsw i32 %112, 23
  %117 = sub nuw nsw i32 1056964608, %116
  %118 = lshr i32 %114, 9
  %119 = or i32 %118, %117
  %120 = or i32 %119, %108
  %121 = bitcast i32 %120 to float
  %122 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %115, i32 23)
  %123 = tail call i32 @llvm.ctlz.i32(i32 %122, i1 false), !range !7
  %124 = fmul float %121, 0x3FF921FB40000000
  %125 = add nuw nsw i32 %123, %112
  %126 = shl nuw nsw i32 %125, 23
  %127 = sub nuw nsw i32 855638016, %126
  %128 = sub nsw i32 31, %123
  %129 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %115, i32 %128)
  %130 = lshr i32 %129, 9
  %131 = or i32 %127, %130
  %132 = or i32 %131, %108
  %133 = bitcast i32 %132 to float
  %134 = fneg float %124
  %135 = tail call float @llvm.fma.f32(float %121, float 0x3FF921FB40000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %121, float 0x3E74442D00000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %133, float 0x3FF921FB40000000, float %136)
  %138 = fadd float %124, %137
  %139 = lshr i32 %99, 30
  %140 = add nuw nsw i32 %106, %139
  br label %141

141:                                              ; preds = %28, %35
  %142 = phi float [ %33, %28 ], [ %138, %35 ]
  %143 = phi i32 [ %34, %28 ], [ %140, %35 ]
  %144 = fmul float %142, %142
  %145 = tail call float @llvm.fmuladd.f32(float %144, float 0xBF29833040000000, float 0x3F81103880000000)
  %146 = tail call float @llvm.fmuladd.f32(float %144, float %145, float 0xBFC55553A0000000)
  %147 = fmul float %144, %146
  %148 = tail call float @llvm.fmuladd.f32(float %142, float %147, float %142)
  %149 = tail call float @llvm.fmuladd.f32(float %144, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %150 = tail call float @llvm.fmuladd.f32(float %144, float %149, float 0x3FA5557EE0000000)
  %151 = tail call float @llvm.fmuladd.f32(float %144, float %150, float 0xBFE0000080000000)
  %152 = tail call float @llvm.fmuladd.f32(float %144, float %151, float 1.000000e+00)
  %153 = fneg float %148
  %154 = and i32 %143, 1
  %155 = icmp eq i32 %154, 0
  %156 = select i1 %155, float %152, float %153
  %157 = bitcast float %156 to i32
  %158 = shl i32 %143, 30
  %159 = and i32 %158, -2147483648
  %160 = xor i32 %159, %157
  %161 = bitcast i32 %160 to float
  %162 = tail call i1 @llvm.amdgcn.class.f32(float %26, i32 504)
  %163 = select i1 %162, float %161, float 0x7FF8000000000000
  %164 = fmul contract float %163, %3
  %165 = fadd contract float %23, %164
  %166 = fmul contract float %22, %6
  %167 = fmul contract float %166, %7
  %168 = fmul contract float %167, 0x400921FB60000000
  %169 = fcmp contract une float %168, 0.000000e+00
  br i1 %169, label %170, label %314

170:                                              ; preds = %141
  %171 = tail call float @llvm.fabs.f32(float %168)
  %172 = fcmp olt float %171, 1.310720e+05
  br i1 %172, label %173, label %181

173:                                              ; preds = %170
  %174 = fmul float %171, 0x3FE45F3060000000
  %175 = tail call float @llvm.rint.f32(float %174)
  %176 = tail call float @llvm.fma.f32(float %175, float 0xBFF921FB40000000, float %171)
  %177 = tail call float @llvm.fma.f32(float %175, float 0xBE74442D00000000, float %176)
  %178 = tail call float @llvm.fma.f32(float %175, float 0xBCF8469880000000, float %177)
  %179 = fptosi float %175 to i32
  %180 = bitcast float %171 to i32
  br label %287

181:                                              ; preds = %170
  %182 = bitcast float %171 to i32
  %183 = lshr i32 %182, 23
  %184 = and i32 %182, 8388607
  %185 = or i32 %184, 8388608
  %186 = zext i32 %185 to i64
  %187 = mul nuw nsw i64 %186, 4266746795
  %188 = trunc i64 %187 to i32
  %189 = lshr i64 %187, 32
  %190 = mul nuw nsw i64 %186, 1011060801
  %191 = add nuw nsw i64 %189, %190
  %192 = trunc i64 %191 to i32
  %193 = lshr i64 %191, 32
  %194 = mul nuw nsw i64 %186, 3680671129
  %195 = add nuw nsw i64 %193, %194
  %196 = trunc i64 %195 to i32
  %197 = lshr i64 %195, 32
  %198 = mul nuw nsw i64 %186, 4113882560
  %199 = add nuw nsw i64 %197, %198
  %200 = trunc i64 %199 to i32
  %201 = lshr i64 %199, 32
  %202 = mul nuw nsw i64 %186, 4230436817
  %203 = add nuw nsw i64 %201, %202
  %204 = trunc i64 %203 to i32
  %205 = lshr i64 %203, 32
  %206 = mul nuw nsw i64 %186, 1313084713
  %207 = add nuw nsw i64 %205, %206
  %208 = trunc i64 %207 to i32
  %209 = lshr i64 %207, 32
  %210 = mul nuw nsw i64 %186, 2734261102
  %211 = add nuw nsw i64 %209, %210
  %212 = trunc i64 %211 to i32
  %213 = lshr i64 %211, 32
  %214 = trunc i64 %213 to i32
  %215 = add nsw i32 %183, -120
  %216 = icmp ugt i32 %215, 63
  %217 = select i1 %216, i32 %208, i32 %214
  %218 = select i1 %216, i32 %204, i32 %212
  %219 = select i1 %216, i32 %200, i32 %208
  %220 = select i1 %216, i32 %196, i32 %204
  %221 = select i1 %216, i32 %192, i32 %200
  %222 = select i1 %216, i32 %188, i32 %196
  %223 = select i1 %216, i32 -64, i32 0
  %224 = add nsw i32 %223, %215
  %225 = icmp ugt i32 %224, 31
  %226 = select i1 %225, i32 %218, i32 %217
  %227 = select i1 %225, i32 %219, i32 %218
  %228 = select i1 %225, i32 %220, i32 %219
  %229 = select i1 %225, i32 %221, i32 %220
  %230 = select i1 %225, i32 %222, i32 %221
  %231 = select i1 %225, i32 -32, i32 0
  %232 = add nsw i32 %231, %224
  %233 = icmp ugt i32 %232, 31
  %234 = select i1 %233, i32 %227, i32 %226
  %235 = select i1 %233, i32 %228, i32 %227
  %236 = select i1 %233, i32 %229, i32 %228
  %237 = select i1 %233, i32 %230, i32 %229
  %238 = select i1 %233, i32 -32, i32 0
  %239 = add nsw i32 %238, %232
  %240 = icmp eq i32 %239, 0
  %241 = sub nsw i32 32, %239
  %242 = tail call i32 @llvm.fshr.i32(i32 %234, i32 %235, i32 %241)
  %243 = tail call i32 @llvm.fshr.i32(i32 %235, i32 %236, i32 %241)
  %244 = tail call i32 @llvm.fshr.i32(i32 %236, i32 %237, i32 %241)
  %245 = select i1 %240, i32 %234, i32 %242
  %246 = select i1 %240, i32 %235, i32 %243
  %247 = select i1 %240, i32 %236, i32 %244
  %248 = lshr i32 %245, 29
  %249 = tail call i32 @llvm.fshl.i32(i32 %245, i32 %246, i32 2)
  %250 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %247, i32 2)
  %251 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %237, i32 2)
  %252 = and i32 %248, 1
  %253 = sub nsw i32 0, %252
  %254 = shl i32 %248, 31
  %255 = xor i32 %249, %253
  %256 = xor i32 %250, %253
  %257 = xor i32 %251, %253
  %258 = tail call i32 @llvm.ctlz.i32(i32 %255, i1 false), !range !7
  %259 = sub nsw i32 31, %258
  %260 = tail call i32 @llvm.fshr.i32(i32 %255, i32 %256, i32 %259)
  %261 = tail call i32 @llvm.fshr.i32(i32 %256, i32 %257, i32 %259)
  %262 = shl nuw nsw i32 %258, 23
  %263 = sub nuw nsw i32 1056964608, %262
  %264 = lshr i32 %260, 9
  %265 = or i32 %264, %263
  %266 = or i32 %265, %254
  %267 = bitcast i32 %266 to float
  %268 = tail call i32 @llvm.fshl.i32(i32 %260, i32 %261, i32 23)
  %269 = tail call i32 @llvm.ctlz.i32(i32 %268, i1 false), !range !7
  %270 = fmul float %267, 0x3FF921FB40000000
  %271 = add nuw nsw i32 %269, %258
  %272 = shl nuw nsw i32 %271, 23
  %273 = sub nuw nsw i32 855638016, %272
  %274 = sub nsw i32 31, %269
  %275 = tail call i32 @llvm.fshr.i32(i32 %268, i32 %261, i32 %274)
  %276 = lshr i32 %275, 9
  %277 = or i32 %273, %276
  %278 = or i32 %277, %254
  %279 = bitcast i32 %278 to float
  %280 = fneg float %270
  %281 = tail call float @llvm.fma.f32(float %267, float 0x3FF921FB40000000, float %280)
  %282 = tail call float @llvm.fma.f32(float %267, float 0x3E74442D00000000, float %281)
  %283 = tail call float @llvm.fma.f32(float %279, float 0x3FF921FB40000000, float %282)
  %284 = fadd float %270, %283
  %285 = lshr i32 %245, 30
  %286 = add nuw nsw i32 %252, %285
  br label %287

287:                                              ; preds = %173, %181
  %288 = phi i32 [ %180, %173 ], [ %182, %181 ]
  %289 = phi float [ %178, %173 ], [ %284, %181 ]
  %290 = phi i32 [ %179, %173 ], [ %286, %181 ]
  %291 = fmul float %289, %289
  %292 = tail call float @llvm.fmuladd.f32(float %291, float 0xBF29833040000000, float 0x3F81103880000000)
  %293 = tail call float @llvm.fmuladd.f32(float %291, float %292, float 0xBFC55553A0000000)
  %294 = fmul float %291, %293
  %295 = tail call float @llvm.fmuladd.f32(float %289, float %294, float %289)
  %296 = tail call float @llvm.fmuladd.f32(float %291, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %297 = tail call float @llvm.fmuladd.f32(float %291, float %296, float 0x3FA5557EE0000000)
  %298 = tail call float @llvm.fmuladd.f32(float %291, float %297, float 0xBFE0000080000000)
  %299 = tail call float @llvm.fmuladd.f32(float %291, float %298, float 1.000000e+00)
  %300 = and i32 %290, 1
  %301 = icmp eq i32 %300, 0
  %302 = select i1 %301, float %295, float %299
  %303 = bitcast float %302 to i32
  %304 = shl i32 %290, 30
  %305 = and i32 %304, -2147483648
  %306 = bitcast float %168 to i32
  %307 = xor i32 %288, %306
  %308 = xor i32 %307, %305
  %309 = xor i32 %308, %303
  %310 = bitcast i32 %309 to float
  %311 = tail call i1 @llvm.amdgcn.class.f32(float %171, i32 504)
  %312 = select i1 %311, float %310, float 0x7FF8000000000000
  %313 = fdiv contract float %312, %168
  br label %314

314:                                              ; preds = %141, %287
  %315 = phi float [ %313, %287 ], [ 1.000000e+00, %141 ]
  %316 = icmp eq i32 %4, 1
  %317 = select i1 %316, float %165, float 1.000000e+00
  %318 = fmul contract float %315, %317
  %319 = sext i32 %18 to i64
  %320 = getelementptr inbounds float, float addrspace(1)* %0, i64 %319
  store float %318, float addrspace(1)* %320, align 4, !tbaa !8
  br label %321

321:                                              ; preds = %314, %9
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
