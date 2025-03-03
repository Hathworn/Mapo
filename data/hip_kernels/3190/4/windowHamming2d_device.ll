; ModuleID = '../data/hip_kernels/3190/4/main.cu'
source_filename = "../data/hip_kernels/3190/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z15windowHamming2dPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
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
  %168 = fpext float %166 to double
  %169 = fmul contract double %168, 4.600000e-01
  %170 = fsub contract double 5.400000e-01, %169
  %171 = select i1 %167, double %170, double 0x7FF8000000000000
  %172 = shl nsw i32 %12, 1
  %173 = sitofp i32 %172 to float
  %174 = fmul contract float %173, 0x400921FA00000000
  %175 = add nsw i32 %1, -1
  %176 = sitofp i32 %175 to float
  %177 = fdiv contract float %174, %176
  %178 = tail call float @llvm.fabs.f32(float %177)
  %179 = fcmp olt float %178, 1.310720e+05
  br i1 %179, label %180, label %187

180:                                              ; preds = %146
  %181 = fmul float %178, 0x3FE45F3060000000
  %182 = tail call float @llvm.rint.f32(float %181)
  %183 = tail call float @llvm.fma.f32(float %182, float 0xBFF921FB40000000, float %178)
  %184 = tail call float @llvm.fma.f32(float %182, float 0xBE74442D00000000, float %183)
  %185 = tail call float @llvm.fma.f32(float %182, float 0xBCF8469880000000, float %184)
  %186 = fptosi float %182 to i32
  br label %293

187:                                              ; preds = %146
  %188 = bitcast float %178 to i32
  %189 = lshr i32 %188, 23
  %190 = and i32 %188, 8388607
  %191 = or i32 %190, 8388608
  %192 = zext i32 %191 to i64
  %193 = mul nuw nsw i64 %192, 4266746795
  %194 = trunc i64 %193 to i32
  %195 = lshr i64 %193, 32
  %196 = mul nuw nsw i64 %192, 1011060801
  %197 = add nuw nsw i64 %195, %196
  %198 = trunc i64 %197 to i32
  %199 = lshr i64 %197, 32
  %200 = mul nuw nsw i64 %192, 3680671129
  %201 = add nuw nsw i64 %199, %200
  %202 = trunc i64 %201 to i32
  %203 = lshr i64 %201, 32
  %204 = mul nuw nsw i64 %192, 4113882560
  %205 = add nuw nsw i64 %203, %204
  %206 = trunc i64 %205 to i32
  %207 = lshr i64 %205, 32
  %208 = mul nuw nsw i64 %192, 4230436817
  %209 = add nuw nsw i64 %207, %208
  %210 = trunc i64 %209 to i32
  %211 = lshr i64 %209, 32
  %212 = mul nuw nsw i64 %192, 1313084713
  %213 = add nuw nsw i64 %211, %212
  %214 = trunc i64 %213 to i32
  %215 = lshr i64 %213, 32
  %216 = mul nuw nsw i64 %192, 2734261102
  %217 = add nuw nsw i64 %215, %216
  %218 = trunc i64 %217 to i32
  %219 = lshr i64 %217, 32
  %220 = trunc i64 %219 to i32
  %221 = add nsw i32 %189, -120
  %222 = icmp ugt i32 %221, 63
  %223 = select i1 %222, i32 %214, i32 %220
  %224 = select i1 %222, i32 %210, i32 %218
  %225 = select i1 %222, i32 %206, i32 %214
  %226 = select i1 %222, i32 %202, i32 %210
  %227 = select i1 %222, i32 %198, i32 %206
  %228 = select i1 %222, i32 %194, i32 %202
  %229 = select i1 %222, i32 -64, i32 0
  %230 = add nsw i32 %229, %221
  %231 = icmp ugt i32 %230, 31
  %232 = select i1 %231, i32 %224, i32 %223
  %233 = select i1 %231, i32 %225, i32 %224
  %234 = select i1 %231, i32 %226, i32 %225
  %235 = select i1 %231, i32 %227, i32 %226
  %236 = select i1 %231, i32 %228, i32 %227
  %237 = select i1 %231, i32 -32, i32 0
  %238 = add nsw i32 %237, %230
  %239 = icmp ugt i32 %238, 31
  %240 = select i1 %239, i32 %233, i32 %232
  %241 = select i1 %239, i32 %234, i32 %233
  %242 = select i1 %239, i32 %235, i32 %234
  %243 = select i1 %239, i32 %236, i32 %235
  %244 = select i1 %239, i32 -32, i32 0
  %245 = add nsw i32 %244, %238
  %246 = icmp eq i32 %245, 0
  %247 = sub nsw i32 32, %245
  %248 = tail call i32 @llvm.fshr.i32(i32 %240, i32 %241, i32 %247)
  %249 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %247)
  %250 = tail call i32 @llvm.fshr.i32(i32 %242, i32 %243, i32 %247)
  %251 = select i1 %246, i32 %240, i32 %248
  %252 = select i1 %246, i32 %241, i32 %249
  %253 = select i1 %246, i32 %242, i32 %250
  %254 = lshr i32 %251, 29
  %255 = tail call i32 @llvm.fshl.i32(i32 %251, i32 %252, i32 2)
  %256 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %253, i32 2)
  %257 = tail call i32 @llvm.fshl.i32(i32 %253, i32 %243, i32 2)
  %258 = and i32 %254, 1
  %259 = sub nsw i32 0, %258
  %260 = shl i32 %254, 31
  %261 = xor i32 %255, %259
  %262 = xor i32 %256, %259
  %263 = xor i32 %257, %259
  %264 = tail call i32 @llvm.ctlz.i32(i32 %261, i1 false), !range !7
  %265 = sub nsw i32 31, %264
  %266 = tail call i32 @llvm.fshr.i32(i32 %261, i32 %262, i32 %265)
  %267 = tail call i32 @llvm.fshr.i32(i32 %262, i32 %263, i32 %265)
  %268 = shl nuw nsw i32 %264, 23
  %269 = sub nuw nsw i32 1056964608, %268
  %270 = lshr i32 %266, 9
  %271 = or i32 %270, %269
  %272 = or i32 %271, %260
  %273 = bitcast i32 %272 to float
  %274 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %267, i32 23)
  %275 = tail call i32 @llvm.ctlz.i32(i32 %274, i1 false), !range !7
  %276 = fmul float %273, 0x3FF921FB40000000
  %277 = add nuw nsw i32 %275, %264
  %278 = shl nuw nsw i32 %277, 23
  %279 = sub nuw nsw i32 855638016, %278
  %280 = sub nsw i32 31, %275
  %281 = tail call i32 @llvm.fshr.i32(i32 %274, i32 %267, i32 %280)
  %282 = lshr i32 %281, 9
  %283 = or i32 %279, %282
  %284 = or i32 %283, %260
  %285 = bitcast i32 %284 to float
  %286 = fneg float %276
  %287 = tail call float @llvm.fma.f32(float %273, float 0x3FF921FB40000000, float %286)
  %288 = tail call float @llvm.fma.f32(float %273, float 0x3E74442D00000000, float %287)
  %289 = tail call float @llvm.fma.f32(float %285, float 0x3FF921FB40000000, float %288)
  %290 = fadd float %276, %289
  %291 = lshr i32 %251, 30
  %292 = add nuw nsw i32 %258, %291
  br label %293

293:                                              ; preds = %180, %187
  %294 = phi float [ %185, %180 ], [ %290, %187 ]
  %295 = phi i32 [ %186, %180 ], [ %292, %187 ]
  %296 = fmul float %294, %294
  %297 = tail call float @llvm.fmuladd.f32(float %296, float 0xBF29833040000000, float 0x3F81103880000000)
  %298 = tail call float @llvm.fmuladd.f32(float %296, float %297, float 0xBFC55553A0000000)
  %299 = fmul float %296, %298
  %300 = tail call float @llvm.fmuladd.f32(float %294, float %299, float %294)
  %301 = tail call float @llvm.fmuladd.f32(float %296, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %302 = tail call float @llvm.fmuladd.f32(float %296, float %301, float 0x3FA5557EE0000000)
  %303 = tail call float @llvm.fmuladd.f32(float %296, float %302, float 0xBFE0000080000000)
  %304 = tail call float @llvm.fmuladd.f32(float %296, float %303, float 1.000000e+00)
  %305 = fneg float %300
  %306 = and i32 %295, 1
  %307 = icmp eq i32 %306, 0
  %308 = select i1 %307, float %304, float %305
  %309 = bitcast float %308 to i32
  %310 = shl i32 %295, 30
  %311 = and i32 %310, -2147483648
  %312 = xor i32 %311, %309
  %313 = bitcast i32 %312 to float
  %314 = tail call i1 @llvm.amdgcn.class.f32(float %178, i32 504)
  %315 = fpext float %313 to double
  %316 = fmul contract double %315, 4.600000e-01
  %317 = fsub contract double 5.400000e-01, %316
  %318 = select i1 %314, double %317, double 0x7FF8000000000000
  %319 = fmul contract double %171, %318
  %320 = fptrunc double %319 to float
  %321 = mul nsw i32 %20, %1
  %322 = add nsw i32 %321, %12
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %0, i64 %323
  store float %320, float addrspace(1)* %324, align 4, !tbaa !8
  br label %325

325:                                              ; preds = %293, %3
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
