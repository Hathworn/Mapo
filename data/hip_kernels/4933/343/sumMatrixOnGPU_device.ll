; ModuleID = '../data/hip_kernels/4933/343/main.cu'
source_filename = "../data/hip_kernels/4933/343/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14sumMatrixOnGPUPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp ult i32 %14, %3
  %24 = icmp ult i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %320

26:                                               ; preds = %5
  %27 = mul i32 %22, %3
  %28 = add i32 %27, %14
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = tail call float @llvm.fabs.f32(float %31)
  %33 = fcmp olt float %32, 1.310720e+05
  br i1 %33, label %34, label %42

34:                                               ; preds = %26
  %35 = fmul float %32, 0x3FE45F3060000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = tail call float @llvm.fma.f32(float %36, float 0xBFF921FB40000000, float %32)
  %38 = tail call float @llvm.fma.f32(float %36, float 0xBE74442D00000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %36, float 0xBCF8469880000000, float %38)
  %40 = fptosi float %36 to i32
  %41 = bitcast float %32 to i32
  br label %148

42:                                               ; preds = %26
  %43 = bitcast float %32 to i32
  %44 = lshr i32 %43, 23
  %45 = and i32 %43, 8388607
  %46 = or i32 %45, 8388608
  %47 = zext i32 %46 to i64
  %48 = mul nuw nsw i64 %47, 4266746795
  %49 = trunc i64 %48 to i32
  %50 = lshr i64 %48, 32
  %51 = mul nuw nsw i64 %47, 1011060801
  %52 = add nuw nsw i64 %50, %51
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %47, 3680671129
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %47, 4113882560
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %47, 4230436817
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %47, 1313084713
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %47, 2734261102
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = trunc i64 %74 to i32
  %76 = add nsw i32 %44, -120
  %77 = icmp ugt i32 %76, 63
  %78 = select i1 %77, i32 %69, i32 %75
  %79 = select i1 %77, i32 %65, i32 %73
  %80 = select i1 %77, i32 %61, i32 %69
  %81 = select i1 %77, i32 %57, i32 %65
  %82 = select i1 %77, i32 %53, i32 %61
  %83 = select i1 %77, i32 %49, i32 %57
  %84 = select i1 %77, i32 -64, i32 0
  %85 = add nsw i32 %84, %76
  %86 = icmp ugt i32 %85, 31
  %87 = select i1 %86, i32 %79, i32 %78
  %88 = select i1 %86, i32 %80, i32 %79
  %89 = select i1 %86, i32 %81, i32 %80
  %90 = select i1 %86, i32 %82, i32 %81
  %91 = select i1 %86, i32 %83, i32 %82
  %92 = select i1 %86, i32 -32, i32 0
  %93 = add nsw i32 %92, %85
  %94 = icmp ugt i32 %93, 31
  %95 = select i1 %94, i32 %88, i32 %87
  %96 = select i1 %94, i32 %89, i32 %88
  %97 = select i1 %94, i32 %90, i32 %89
  %98 = select i1 %94, i32 %91, i32 %90
  %99 = select i1 %94, i32 -32, i32 0
  %100 = add nsw i32 %99, %93
  %101 = icmp eq i32 %100, 0
  %102 = sub nsw i32 32, %100
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %102)
  %104 = tail call i32 @llvm.fshr.i32(i32 %96, i32 %97, i32 %102)
  %105 = tail call i32 @llvm.fshr.i32(i32 %97, i32 %98, i32 %102)
  %106 = select i1 %101, i32 %95, i32 %103
  %107 = select i1 %101, i32 %96, i32 %104
  %108 = select i1 %101, i32 %97, i32 %105
  %109 = lshr i32 %106, 29
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 2)
  %111 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %108, i32 2)
  %112 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %98, i32 2)
  %113 = and i32 %109, 1
  %114 = sub nsw i32 0, %113
  %115 = shl i32 %109, 31
  %116 = xor i32 %110, %114
  %117 = xor i32 %111, %114
  %118 = xor i32 %112, %114
  %119 = tail call i32 @llvm.ctlz.i32(i32 %116, i1 false), !range !11
  %120 = sub nsw i32 31, %119
  %121 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %117, i32 %120)
  %122 = tail call i32 @llvm.fshr.i32(i32 %117, i32 %118, i32 %120)
  %123 = shl nuw nsw i32 %119, 23
  %124 = sub nuw nsw i32 1056964608, %123
  %125 = lshr i32 %121, 9
  %126 = or i32 %125, %124
  %127 = or i32 %126, %115
  %128 = bitcast i32 %127 to float
  %129 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %122, i32 23)
  %130 = tail call i32 @llvm.ctlz.i32(i32 %129, i1 false), !range !11
  %131 = fmul float %128, 0x3FF921FB40000000
  %132 = add nuw nsw i32 %130, %119
  %133 = shl nuw nsw i32 %132, 23
  %134 = sub nuw nsw i32 855638016, %133
  %135 = sub nsw i32 31, %130
  %136 = tail call i32 @llvm.fshr.i32(i32 %129, i32 %122, i32 %135)
  %137 = lshr i32 %136, 9
  %138 = or i32 %134, %137
  %139 = or i32 %138, %115
  %140 = bitcast i32 %139 to float
  %141 = fneg float %131
  %142 = tail call float @llvm.fma.f32(float %128, float 0x3FF921FB40000000, float %141)
  %143 = tail call float @llvm.fma.f32(float %128, float 0x3E74442D00000000, float %142)
  %144 = tail call float @llvm.fma.f32(float %140, float 0x3FF921FB40000000, float %143)
  %145 = fadd float %131, %144
  %146 = lshr i32 %106, 30
  %147 = add nuw nsw i32 %113, %146
  br label %148

148:                                              ; preds = %34, %42
  %149 = phi i32 [ %41, %34 ], [ %43, %42 ]
  %150 = phi float [ %39, %34 ], [ %145, %42 ]
  %151 = phi i32 [ %40, %34 ], [ %147, %42 ]
  %152 = fmul float %150, %150
  %153 = tail call float @llvm.fmuladd.f32(float %152, float 0xBF29833040000000, float 0x3F81103880000000)
  %154 = tail call float @llvm.fmuladd.f32(float %152, float %153, float 0xBFC55553A0000000)
  %155 = fmul float %152, %154
  %156 = tail call float @llvm.fmuladd.f32(float %150, float %155, float %150)
  %157 = tail call float @llvm.fmuladd.f32(float %152, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %158 = tail call float @llvm.fmuladd.f32(float %152, float %157, float 0x3FA5557EE0000000)
  %159 = tail call float @llvm.fmuladd.f32(float %152, float %158, float 0xBFE0000080000000)
  %160 = tail call float @llvm.fmuladd.f32(float %152, float %159, float 1.000000e+00)
  %161 = and i32 %151, 1
  %162 = icmp eq i32 %161, 0
  %163 = select i1 %162, float %156, float %160
  %164 = bitcast float %163 to i32
  %165 = shl i32 %151, 30
  %166 = and i32 %165, -2147483648
  %167 = bitcast float %31 to i32
  %168 = xor i32 %149, %167
  %169 = xor i32 %168, %166
  %170 = xor i32 %169, %164
  %171 = bitcast i32 %170 to float
  %172 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 504)
  %173 = select i1 %172, float %171, float 0x7FF8000000000000
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !6
  %176 = tail call float @llvm.fabs.f32(float %175)
  %177 = fcmp olt float %176, 1.310720e+05
  br i1 %177, label %178, label %186

178:                                              ; preds = %148
  %179 = fmul float %176, 0x3FE45F3060000000
  %180 = tail call float @llvm.rint.f32(float %179)
  %181 = tail call float @llvm.fma.f32(float %180, float 0xBFF921FB40000000, float %176)
  %182 = tail call float @llvm.fma.f32(float %180, float 0xBE74442D00000000, float %181)
  %183 = tail call float @llvm.fma.f32(float %180, float 0xBCF8469880000000, float %182)
  %184 = fptosi float %180 to i32
  %185 = bitcast float %176 to i32
  br label %292

186:                                              ; preds = %148
  %187 = bitcast float %176 to i32
  %188 = lshr i32 %187, 23
  %189 = and i32 %187, 8388607
  %190 = or i32 %189, 8388608
  %191 = zext i32 %190 to i64
  %192 = mul nuw nsw i64 %191, 4266746795
  %193 = trunc i64 %192 to i32
  %194 = lshr i64 %192, 32
  %195 = mul nuw nsw i64 %191, 1011060801
  %196 = add nuw nsw i64 %194, %195
  %197 = trunc i64 %196 to i32
  %198 = lshr i64 %196, 32
  %199 = mul nuw nsw i64 %191, 3680671129
  %200 = add nuw nsw i64 %198, %199
  %201 = trunc i64 %200 to i32
  %202 = lshr i64 %200, 32
  %203 = mul nuw nsw i64 %191, 4113882560
  %204 = add nuw nsw i64 %202, %203
  %205 = trunc i64 %204 to i32
  %206 = lshr i64 %204, 32
  %207 = mul nuw nsw i64 %191, 4230436817
  %208 = add nuw nsw i64 %206, %207
  %209 = trunc i64 %208 to i32
  %210 = lshr i64 %208, 32
  %211 = mul nuw nsw i64 %191, 1313084713
  %212 = add nuw nsw i64 %210, %211
  %213 = trunc i64 %212 to i32
  %214 = lshr i64 %212, 32
  %215 = mul nuw nsw i64 %191, 2734261102
  %216 = add nuw nsw i64 %214, %215
  %217 = trunc i64 %216 to i32
  %218 = lshr i64 %216, 32
  %219 = trunc i64 %218 to i32
  %220 = add nsw i32 %188, -120
  %221 = icmp ugt i32 %220, 63
  %222 = select i1 %221, i32 %213, i32 %219
  %223 = select i1 %221, i32 %209, i32 %217
  %224 = select i1 %221, i32 %205, i32 %213
  %225 = select i1 %221, i32 %201, i32 %209
  %226 = select i1 %221, i32 %197, i32 %205
  %227 = select i1 %221, i32 %193, i32 %201
  %228 = select i1 %221, i32 -64, i32 0
  %229 = add nsw i32 %228, %220
  %230 = icmp ugt i32 %229, 31
  %231 = select i1 %230, i32 %223, i32 %222
  %232 = select i1 %230, i32 %224, i32 %223
  %233 = select i1 %230, i32 %225, i32 %224
  %234 = select i1 %230, i32 %226, i32 %225
  %235 = select i1 %230, i32 %227, i32 %226
  %236 = select i1 %230, i32 -32, i32 0
  %237 = add nsw i32 %236, %229
  %238 = icmp ugt i32 %237, 31
  %239 = select i1 %238, i32 %232, i32 %231
  %240 = select i1 %238, i32 %233, i32 %232
  %241 = select i1 %238, i32 %234, i32 %233
  %242 = select i1 %238, i32 %235, i32 %234
  %243 = select i1 %238, i32 -32, i32 0
  %244 = add nsw i32 %243, %237
  %245 = icmp eq i32 %244, 0
  %246 = sub nsw i32 32, %244
  %247 = tail call i32 @llvm.fshr.i32(i32 %239, i32 %240, i32 %246)
  %248 = tail call i32 @llvm.fshr.i32(i32 %240, i32 %241, i32 %246)
  %249 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %246)
  %250 = select i1 %245, i32 %239, i32 %247
  %251 = select i1 %245, i32 %240, i32 %248
  %252 = select i1 %245, i32 %241, i32 %249
  %253 = lshr i32 %250, 29
  %254 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %251, i32 2)
  %255 = tail call i32 @llvm.fshl.i32(i32 %251, i32 %252, i32 2)
  %256 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %242, i32 2)
  %257 = and i32 %253, 1
  %258 = sub nsw i32 0, %257
  %259 = shl i32 %253, 31
  %260 = xor i32 %254, %258
  %261 = xor i32 %255, %258
  %262 = xor i32 %256, %258
  %263 = tail call i32 @llvm.ctlz.i32(i32 %260, i1 false), !range !11
  %264 = sub nsw i32 31, %263
  %265 = tail call i32 @llvm.fshr.i32(i32 %260, i32 %261, i32 %264)
  %266 = tail call i32 @llvm.fshr.i32(i32 %261, i32 %262, i32 %264)
  %267 = shl nuw nsw i32 %263, 23
  %268 = sub nuw nsw i32 1056964608, %267
  %269 = lshr i32 %265, 9
  %270 = or i32 %269, %268
  %271 = or i32 %270, %259
  %272 = bitcast i32 %271 to float
  %273 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %266, i32 23)
  %274 = tail call i32 @llvm.ctlz.i32(i32 %273, i1 false), !range !11
  %275 = fmul float %272, 0x3FF921FB40000000
  %276 = add nuw nsw i32 %274, %263
  %277 = shl nuw nsw i32 %276, 23
  %278 = sub nuw nsw i32 855638016, %277
  %279 = sub nsw i32 31, %274
  %280 = tail call i32 @llvm.fshr.i32(i32 %273, i32 %266, i32 %279)
  %281 = lshr i32 %280, 9
  %282 = or i32 %278, %281
  %283 = or i32 %282, %259
  %284 = bitcast i32 %283 to float
  %285 = fneg float %275
  %286 = tail call float @llvm.fma.f32(float %272, float 0x3FF921FB40000000, float %285)
  %287 = tail call float @llvm.fma.f32(float %272, float 0x3E74442D00000000, float %286)
  %288 = tail call float @llvm.fma.f32(float %284, float 0x3FF921FB40000000, float %287)
  %289 = fadd float %275, %288
  %290 = lshr i32 %250, 30
  %291 = add nuw nsw i32 %257, %290
  br label %292

292:                                              ; preds = %178, %186
  %293 = phi i32 [ %185, %178 ], [ %187, %186 ]
  %294 = phi float [ %183, %178 ], [ %289, %186 ]
  %295 = phi i32 [ %184, %178 ], [ %291, %186 ]
  %296 = fmul float %294, %294
  %297 = tail call float @llvm.fmuladd.f32(float %296, float 0xBF29833040000000, float 0x3F81103880000000)
  %298 = tail call float @llvm.fmuladd.f32(float %296, float %297, float 0xBFC55553A0000000)
  %299 = fmul float %296, %298
  %300 = tail call float @llvm.fmuladd.f32(float %294, float %299, float %294)
  %301 = tail call float @llvm.fmuladd.f32(float %296, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %302 = tail call float @llvm.fmuladd.f32(float %296, float %301, float 0x3FA5557EE0000000)
  %303 = tail call float @llvm.fmuladd.f32(float %296, float %302, float 0xBFE0000080000000)
  %304 = tail call float @llvm.fmuladd.f32(float %296, float %303, float 1.000000e+00)
  %305 = and i32 %295, 1
  %306 = icmp eq i32 %305, 0
  %307 = select i1 %306, float %300, float %304
  %308 = bitcast float %307 to i32
  %309 = shl i32 %295, 30
  %310 = and i32 %309, -2147483648
  %311 = bitcast float %175 to i32
  %312 = xor i32 %293, %311
  %313 = xor i32 %312, %310
  %314 = xor i32 %313, %308
  %315 = bitcast i32 %314 to float
  %316 = tail call i1 @llvm.amdgcn.class.f32(float %176, i32 504)
  %317 = select i1 %316, float %315, float 0x7FF8000000000000
  %318 = fadd contract float %173, %317
  %319 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  store float %318, float addrspace(1)* %319, align 4, !tbaa !7
  br label %320

320:                                              ; preds = %292, %5
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
