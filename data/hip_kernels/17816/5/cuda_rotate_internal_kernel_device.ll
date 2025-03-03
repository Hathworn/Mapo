; ModuleID = '../data/hip_kernels/17816/5/main.cu'
source_filename = "../data/hip_kernels/17816/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27cuda_rotate_internal_kernelPfPKffii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = mul nsw i32 %4, %3
  %7 = sitofp i32 %3 to float
  %8 = fmul contract float %7, 5.000000e-01
  %9 = fadd contract float %8, -5.000000e-01
  %10 = sitofp i32 %4 to float
  %11 = fmul contract float %10, 5.000000e-01
  %12 = fadd contract float %11, -5.000000e-01
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = mul i32 %13, %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = udiv i32 %21, %18
  %26 = mul i32 %25, %18
  %27 = icmp ugt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %18
  %31 = icmp slt i32 %24, %4
  br i1 %31, label %32, label %226

32:                                               ; preds = %5
  %33 = icmp sgt i32 %3, 0
  %34 = tail call float @llvm.fabs.f32(float %2)
  %35 = fcmp olt float %34, 1.310720e+05
  %36 = bitcast float %34 to i32
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
  %112 = tail call i32 @llvm.ctlz.i32(i32 %109, i1 false), !range !16
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
  %123 = tail call i32 @llvm.ctlz.i32(i32 %122, i1 false), !range !16
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
  %141 = fmul float %34, 0x3FE45F3060000000
  %142 = tail call float @llvm.rint.f32(float %141)
  %143 = tail call float @llvm.fma.f32(float %142, float 0xBFF921FB40000000, float %34)
  %144 = tail call float @llvm.fma.f32(float %142, float 0xBE74442D00000000, float %143)
  %145 = tail call float @llvm.fma.f32(float %142, float 0xBCF8469880000000, float %144)
  %146 = fptosi float %142 to i32
  %147 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 504)
  %148 = bitcast float %2 to i32
  %149 = fmul float %138, %138
  %150 = tail call float @llvm.fmuladd.f32(float %149, float 0xBF29833040000000, float 0x3F81103880000000)
  %151 = tail call float @llvm.fmuladd.f32(float %149, float %150, float 0xBFC55553A0000000)
  %152 = fmul float %149, %151
  %153 = tail call float @llvm.fmuladd.f32(float %138, float %152, float %138)
  %154 = tail call float @llvm.fmuladd.f32(float %149, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %155 = tail call float @llvm.fmuladd.f32(float %149, float %154, float 0x3FA5557EE0000000)
  %156 = tail call float @llvm.fmuladd.f32(float %149, float %155, float 0xBFE0000080000000)
  %157 = tail call float @llvm.fmuladd.f32(float %149, float %156, float 1.000000e+00)
  %158 = and i32 %140, 1
  %159 = icmp eq i32 %158, 0
  %160 = select i1 %159, float %153, float %157
  %161 = bitcast float %160 to i32
  %162 = shl i32 %140, 30
  %163 = and i32 %162, -2147483648
  %164 = xor i32 %36, %148
  %165 = xor i32 %164, %163
  %166 = xor i32 %165, %161
  %167 = bitcast i32 %166 to float
  %168 = select i1 %147, float %167, float 0x7FF8000000000000
  %169 = fmul float %145, %145
  %170 = tail call float @llvm.fmuladd.f32(float %169, float 0xBF29833040000000, float 0x3F81103880000000)
  %171 = tail call float @llvm.fmuladd.f32(float %169, float %170, float 0xBFC55553A0000000)
  %172 = fmul float %169, %171
  %173 = tail call float @llvm.fmuladd.f32(float %145, float %172, float %145)
  %174 = tail call float @llvm.fmuladd.f32(float %169, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %175 = tail call float @llvm.fmuladd.f32(float %169, float %174, float 0x3FA5557EE0000000)
  %176 = tail call float @llvm.fmuladd.f32(float %169, float %175, float 0xBFE0000080000000)
  %177 = tail call float @llvm.fmuladd.f32(float %169, float %176, float 1.000000e+00)
  %178 = and i32 %146, 1
  %179 = icmp eq i32 %178, 0
  %180 = select i1 %179, float %173, float %177
  %181 = bitcast float %180 to i32
  %182 = shl i32 %146, 30
  %183 = and i32 %182, -2147483648
  %184 = xor i32 %183, %181
  %185 = xor i32 %184, %36
  %186 = xor i32 %185, %148
  %187 = bitcast i32 %186 to float
  %188 = select i1 %147, float %187, float 0x7FF8000000000000
  %189 = select i1 %35, float %145, float %138
  %190 = select i1 %35, i32 %146, i32 %140
  %191 = fmul float %189, %189
  %192 = tail call float @llvm.fmuladd.f32(float %191, float 0xBF29833040000000, float 0x3F81103880000000)
  %193 = tail call float @llvm.fmuladd.f32(float %191, float %192, float 0xBFC55553A0000000)
  %194 = fmul float %191, %193
  %195 = tail call float @llvm.fmuladd.f32(float %189, float %194, float %189)
  %196 = tail call float @llvm.fmuladd.f32(float %191, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %197 = tail call float @llvm.fmuladd.f32(float %191, float %196, float 0x3FA5557EE0000000)
  %198 = tail call float @llvm.fmuladd.f32(float %191, float %197, float 0xBFE0000080000000)
  %199 = tail call float @llvm.fmuladd.f32(float %191, float %198, float 1.000000e+00)
  %200 = fneg float %195
  %201 = and i32 %190, 1
  %202 = icmp eq i32 %201, 0
  %203 = select i1 %202, float %199, float %200
  %204 = bitcast float %203 to i32
  %205 = shl i32 %190, 30
  %206 = and i32 %205, -2147483648
  %207 = xor i32 %206, %204
  %208 = bitcast i32 %207 to float
  %209 = select i1 %147, float %208, float 0x7FF8000000000000
  %210 = select i1 %202, float %195, float %199
  %211 = bitcast float %210 to i32
  %212 = xor i32 %206, %36
  %213 = xor i32 %212, %211
  %214 = xor i32 %213, %148
  %215 = bitcast i32 %214 to float
  %216 = select i1 %147, float %215, float 0x7FF8000000000000
  %217 = select i1 %35, float %188, float %168
  br label %218

218:                                              ; preds = %32, %227
  %219 = phi i32 [ %24, %32 ], [ %228, %227 ]
  br i1 %33, label %220, label %227

220:                                              ; preds = %218
  %221 = sitofp i32 %219 to float
  %222 = fsub contract float %221, %12
  %223 = mul nsw i32 %219, %3
  %224 = fmul contract float %222, %216
  %225 = fmul contract float %222, %209
  br label %230

226:                                              ; preds = %227, %5
  ret void

227:                                              ; preds = %303, %218
  %228 = add nsw i32 %219, %30
  %229 = icmp slt i32 %228, %4
  br i1 %229, label %218, label %226, !llvm.loop !17

230:                                              ; preds = %220, %303
  %231 = phi i32 [ 0, %220 ], [ %316, %303 ]
  %232 = sitofp i32 %231 to float
  %233 = fsub contract float %232, %9
  %234 = fmul contract float %233, %209
  %235 = fsub contract float %234, %224
  %236 = fmul contract float %233, %217
  %237 = fadd contract float %236, %225
  %238 = fadd contract float %9, %235
  %239 = fadd contract float %12, %237
  %240 = add nsw i32 %231, %223
  %241 = tail call float @llvm.floor.f32(float %238)
  %242 = fptosi float %241 to i32
  %243 = tail call float @llvm.floor.f32(float %239)
  %244 = fptosi float %243 to i32
  %245 = add nsw i32 %242, 1
  %246 = add nsw i32 %244, 1
  %247 = mul nsw i32 %244, %3
  %248 = add nsw i32 %247, %242
  %249 = add nsw i32 %247, %245
  %250 = mul nsw i32 %246, %3
  %251 = add nsw i32 %250, %242
  %252 = add nsw i32 %250, %245
  %253 = icmp sgt i32 %248, -1
  %254 = icmp slt i32 %248, %6
  %255 = select i1 %253, i1 %254, i1 false
  br i1 %255, label %256, label %264

256:                                              ; preds = %230
  %257 = sitofp i32 %245 to float
  %258 = fsub contract float %257, %238
  %259 = zext i32 %248 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %1, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !19
  %262 = fmul contract float %258, %261
  %263 = fadd contract float %262, 0.000000e+00
  br label %264

264:                                              ; preds = %256, %230
  %265 = phi float [ %263, %256 ], [ 0.000000e+00, %230 ]
  %266 = icmp sgt i32 %249, -1
  %267 = icmp slt i32 %249, %6
  %268 = select i1 %266, i1 %267, i1 false
  br i1 %268, label %269, label %277

269:                                              ; preds = %264
  %270 = sitofp i32 %242 to float
  %271 = fsub contract float %238, %270
  %272 = zext i32 %249 to i64
  %273 = getelementptr inbounds float, float addrspace(1)* %1, i64 %272
  %274 = load float, float addrspace(1)* %273, align 4, !tbaa !19
  %275 = fmul contract float %271, %274
  %276 = fadd contract float %265, %275
  br label %277

277:                                              ; preds = %269, %264
  %278 = phi float [ %276, %269 ], [ %265, %264 ]
  %279 = icmp sgt i32 %251, -1
  %280 = icmp slt i32 %251, %6
  %281 = select i1 %279, i1 %280, i1 false
  br i1 %281, label %282, label %290

282:                                              ; preds = %277
  %283 = sitofp i32 %245 to float
  %284 = fsub contract float %283, %238
  %285 = zext i32 %251 to i64
  %286 = getelementptr inbounds float, float addrspace(1)* %1, i64 %285
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !19
  %288 = fmul contract float %284, %287
  %289 = fadd contract float %288, 0.000000e+00
  br label %290

290:                                              ; preds = %282, %277
  %291 = phi float [ %289, %282 ], [ 0.000000e+00, %277 ]
  %292 = icmp sgt i32 %252, -1
  %293 = icmp slt i32 %252, %6
  %294 = select i1 %292, i1 %293, i1 false
  br i1 %294, label %295, label %303

295:                                              ; preds = %290
  %296 = sitofp i32 %242 to float
  %297 = fsub contract float %238, %296
  %298 = zext i32 %252 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %1, i64 %298
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !19
  %301 = fmul contract float %297, %300
  %302 = fadd contract float %291, %301
  br label %303

303:                                              ; preds = %295, %290
  %304 = phi float [ %302, %295 ], [ %291, %290 ]
  %305 = sitofp i32 %246 to float
  %306 = fsub contract float %305, %239
  %307 = fmul contract float %306, %278
  %308 = sitofp i32 %244 to float
  %309 = fsub contract float %239, %308
  %310 = fmul contract float %309, %304
  %311 = fadd contract float %307, %310
  %312 = sext i32 %240 to i64
  %313 = getelementptr inbounds float, float addrspace(1)* %0, i64 %312
  %314 = load float, float addrspace(1)* %313, align 4, !tbaa !19
  %315 = fadd contract float %314, %311
  store float %315, float addrspace(1)* %313, align 4, !tbaa !19
  %316 = add nuw nsw i32 %231, 1
  %317 = icmp eq i32 %316, %3
  br i1 %317, label %227, label %230, !llvm.loop !23
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
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{i32 0, i32 33}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !18}
