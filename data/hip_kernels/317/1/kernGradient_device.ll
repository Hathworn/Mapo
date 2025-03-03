; ModuleID = '../data/hip_kernels/317/1/main.cu'
source_filename = "../data/hip_kernels/317/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12kernGradientiiiPhS_S_PfS0_(i32 %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %1
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %317

29:                                               ; preds = %8
  %30 = mul nsw i32 %25, %1
  %31 = add nsw i32 %25, -1
  %32 = icmp slt i32 %25, 1
  %33 = mul nsw i32 %31, %1
  %34 = add nsw i32 %33, -1
  %35 = icmp slt i32 %17, 1
  %36 = select i1 %35, i1 true, i1 %32
  br i1 %36, label %49, label %37

37:                                               ; preds = %29
  %38 = add i32 %34, %17
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !5
  %42 = uitofp i8 %41 to float
  %43 = load float, float addrspace(1)* %6, align 4, !tbaa !10, !amdgpu.noclobber !5
  %44 = fmul contract float %43, %42
  %45 = fadd contract float %44, 0.000000e+00
  %46 = load float, float addrspace(1)* %7, align 4, !tbaa !10, !amdgpu.noclobber !5
  %47 = fmul contract float %46, %42
  %48 = fadd contract float %47, 0.000000e+00
  br label %49

49:                                               ; preds = %29, %37
  %50 = phi float [ %45, %37 ], [ 0.000000e+00, %29 ]
  %51 = phi float [ %48, %37 ], [ 0.000000e+00, %29 ]
  %52 = icmp slt i32 %17, 0
  %53 = select i1 %52, i1 true, i1 %32
  %54 = icmp sge i32 %17, %1
  %55 = select i1 %53, i1 true, i1 %54
  br i1 %55, label %70, label %56

56:                                               ; preds = %49
  %57 = add i32 %33, %17
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7, !amdgpu.noclobber !5
  %61 = uitofp i8 %60 to float
  %62 = getelementptr inbounds float, float addrspace(1)* %6, i64 1
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !10, !amdgpu.noclobber !5
  %64 = fmul contract float %63, %61
  %65 = fadd contract float %50, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %7, i64 1
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !10, !amdgpu.noclobber !5
  %68 = fmul contract float %67, %61
  %69 = fadd contract float %51, %68
  br label %70

70:                                               ; preds = %56, %49
  %71 = phi float [ %65, %56 ], [ %50, %49 ]
  %72 = phi float [ %69, %56 ], [ %51, %49 ]
  %73 = add nsw i32 %17, 2
  %74 = icmp slt i32 %17, -1
  %75 = select i1 %74, i1 true, i1 %32
  %76 = icmp sgt i32 %73, %1
  %77 = select i1 %75, i1 true, i1 %76
  br i1 %77, label %92, label %78

78:                                               ; preds = %70
  %79 = add i32 %34, %73
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = uitofp i8 %82 to float
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 2
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !10, !amdgpu.noclobber !5
  %86 = fmul contract float %85, %83
  %87 = fadd contract float %71, %86
  %88 = getelementptr inbounds float, float addrspace(1)* %7, i64 2
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !10, !amdgpu.noclobber !5
  %90 = fmul contract float %89, %83
  %91 = fadd contract float %72, %90
  br label %92

92:                                               ; preds = %78, %70
  %93 = phi float [ %87, %78 ], [ %71, %70 ]
  %94 = phi float [ %91, %78 ], [ %72, %70 ]
  %95 = icmp slt i32 %25, 0
  %96 = icmp sge i32 %25, %2
  %97 = add nsw i32 %30, -1
  %98 = select i1 %35, i1 true, i1 %95
  %99 = select i1 %98, i1 true, i1 %96
  br i1 %99, label %114, label %100

100:                                              ; preds = %92
  %101 = add i32 %97, %17
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !7, !amdgpu.noclobber !5
  %105 = uitofp i8 %104 to float
  %106 = getelementptr inbounds float, float addrspace(1)* %6, i64 3
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !10, !amdgpu.noclobber !5
  %108 = fmul contract float %107, %105
  %109 = fadd contract float %93, %108
  %110 = getelementptr inbounds float, float addrspace(1)* %7, i64 3
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !10, !amdgpu.noclobber !5
  %112 = fmul contract float %111, %105
  %113 = fadd contract float %94, %112
  br label %114

114:                                              ; preds = %100, %92
  %115 = phi float [ %109, %100 ], [ %93, %92 ]
  %116 = phi float [ %113, %100 ], [ %94, %92 ]
  %117 = select i1 %52, i1 true, i1 %95
  %118 = select i1 %117, i1 true, i1 %54
  %119 = select i1 %118, i1 true, i1 %96
  br i1 %119, label %134, label %120

120:                                              ; preds = %114
  %121 = add i32 %30, %17
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !7, !amdgpu.noclobber !5
  %125 = uitofp i8 %124 to float
  %126 = getelementptr inbounds float, float addrspace(1)* %6, i64 4
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !10, !amdgpu.noclobber !5
  %128 = fmul contract float %127, %125
  %129 = fadd contract float %115, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %7, i64 4
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !10, !amdgpu.noclobber !5
  %132 = fmul contract float %131, %125
  %133 = fadd contract float %116, %132
  br label %134

134:                                              ; preds = %120, %114
  %135 = phi float [ %129, %120 ], [ %115, %114 ]
  %136 = phi float [ %133, %120 ], [ %116, %114 ]
  %137 = select i1 %74, i1 true, i1 %95
  %138 = select i1 %137, i1 true, i1 %76
  %139 = select i1 %138, i1 true, i1 %96
  br i1 %139, label %154, label %140

140:                                              ; preds = %134
  %141 = add i32 %97, %73
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !7, !amdgpu.noclobber !5
  %145 = uitofp i8 %144 to float
  %146 = getelementptr inbounds float, float addrspace(1)* %6, i64 5
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !10, !amdgpu.noclobber !5
  %148 = fmul contract float %147, %145
  %149 = fadd contract float %135, %148
  %150 = getelementptr inbounds float, float addrspace(1)* %7, i64 5
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !10, !amdgpu.noclobber !5
  %152 = fmul contract float %151, %145
  %153 = fadd contract float %136, %152
  br label %154

154:                                              ; preds = %140, %134
  %155 = phi float [ %149, %140 ], [ %135, %134 ]
  %156 = phi float [ %153, %140 ], [ %136, %134 ]
  %157 = add nsw i32 %25, 2
  %158 = add nsw i32 %25, 1
  %159 = icmp slt i32 %25, -1
  %160 = icmp sgt i32 %157, %2
  %161 = mul nsw i32 %158, %1
  %162 = add nsw i32 %161, -1
  %163 = select i1 %35, i1 true, i1 %159
  %164 = select i1 %163, i1 true, i1 %160
  br i1 %164, label %179, label %165

165:                                              ; preds = %154
  %166 = add i32 %162, %17
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %167
  %169 = load i8, i8 addrspace(1)* %168, align 1, !tbaa !7, !amdgpu.noclobber !5
  %170 = uitofp i8 %169 to float
  %171 = getelementptr inbounds float, float addrspace(1)* %6, i64 6
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !10, !amdgpu.noclobber !5
  %173 = fmul contract float %172, %170
  %174 = fadd contract float %155, %173
  %175 = getelementptr inbounds float, float addrspace(1)* %7, i64 6
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !10, !amdgpu.noclobber !5
  %177 = fmul contract float %176, %170
  %178 = fadd contract float %156, %177
  br label %179

179:                                              ; preds = %165, %154
  %180 = phi float [ %174, %165 ], [ %155, %154 ]
  %181 = phi float [ %178, %165 ], [ %156, %154 ]
  %182 = select i1 %52, i1 true, i1 %159
  %183 = select i1 %182, i1 true, i1 %54
  %184 = select i1 %183, i1 true, i1 %160
  br i1 %184, label %199, label %185

185:                                              ; preds = %179
  %186 = add i32 %161, %17
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %187
  %189 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !7, !amdgpu.noclobber !5
  %190 = uitofp i8 %189 to float
  %191 = getelementptr inbounds float, float addrspace(1)* %6, i64 7
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !10, !amdgpu.noclobber !5
  %193 = fmul contract float %192, %190
  %194 = fadd contract float %180, %193
  %195 = getelementptr inbounds float, float addrspace(1)* %7, i64 7
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !10, !amdgpu.noclobber !5
  %197 = fmul contract float %196, %190
  %198 = fadd contract float %181, %197
  br label %199

199:                                              ; preds = %185, %179
  %200 = phi float [ %194, %185 ], [ %180, %179 ]
  %201 = phi float [ %198, %185 ], [ %181, %179 ]
  %202 = select i1 %74, i1 true, i1 %159
  %203 = select i1 %202, i1 true, i1 %76
  %204 = select i1 %203, i1 true, i1 %160
  br i1 %204, label %219, label %205

205:                                              ; preds = %199
  %206 = add i32 %162, %73
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %207
  %209 = load i8, i8 addrspace(1)* %208, align 1, !tbaa !7, !amdgpu.noclobber !5
  %210 = uitofp i8 %209 to float
  %211 = getelementptr inbounds float, float addrspace(1)* %6, i64 8
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !10, !amdgpu.noclobber !5
  %213 = fmul contract float %212, %210
  %214 = fadd contract float %200, %213
  %215 = getelementptr inbounds float, float addrspace(1)* %7, i64 8
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !10, !amdgpu.noclobber !5
  %217 = fmul contract float %216, %210
  %218 = fadd contract float %201, %217
  br label %219

219:                                              ; preds = %205, %199
  %220 = phi float [ %214, %205 ], [ %200, %199 ]
  %221 = phi float [ %218, %205 ], [ %201, %199 ]
  %222 = add nsw i32 %30, %17
  %223 = fmul contract float %220, %220
  %224 = fmul contract float %221, %221
  %225 = fadd contract float %223, %224
  %226 = fcmp olt float %225, 0x39F0000000000000
  %227 = select i1 %226, float 0x41F0000000000000, float 1.000000e+00
  %228 = fmul float %225, %227
  %229 = tail call float @llvm.sqrt.f32(float %228)
  %230 = bitcast float %229 to i32
  %231 = add nsw i32 %230, -1
  %232 = bitcast i32 %231 to float
  %233 = add nsw i32 %230, 1
  %234 = bitcast i32 %233 to float
  %235 = tail call i1 @llvm.amdgcn.class.f32(float %228, i32 608)
  %236 = select i1 %226, float 0x3EF0000000000000, float 1.000000e+00
  %237 = fneg float %234
  %238 = tail call float @llvm.fma.f32(float %237, float %229, float %228)
  %239 = fcmp ogt float %238, 0.000000e+00
  %240 = fneg float %232
  %241 = tail call float @llvm.fma.f32(float %240, float %229, float %228)
  %242 = fcmp ole float %241, 0.000000e+00
  %243 = select i1 %242, float %232, float %229
  %244 = select i1 %239, float %234, float %243
  %245 = fmul float %236, %244
  %246 = select i1 %235, float %228, float %245
  %247 = tail call float @llvm.fabs.f32(float %221)
  %248 = tail call float @llvm.fabs.f32(float %220)
  %249 = tail call float @llvm.minnum.f32(float %247, float %248)
  %250 = tail call float @llvm.maxnum.f32(float %247, float %248)
  %251 = fdiv float %249, %250, !fpmath !12
  %252 = fmul float %251, %251
  %253 = tail call float @llvm.fmuladd.f32(float %252, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %254 = tail call float @llvm.fmuladd.f32(float %252, float %253, float 0x3FA53F67E0000000)
  %255 = tail call float @llvm.fmuladd.f32(float %252, float %254, float 0xBFB2FA9AE0000000)
  %256 = tail call float @llvm.fmuladd.f32(float %252, float %255, float 0x3FBB263640000000)
  %257 = tail call float @llvm.fmuladd.f32(float %252, float %256, float 0xBFC22C1CC0000000)
  %258 = tail call float @llvm.fmuladd.f32(float %252, float %257, float 0x3FC99717E0000000)
  %259 = tail call float @llvm.fmuladd.f32(float %252, float %258, float 0xBFD5554C40000000)
  %260 = fmul float %252, %259
  %261 = tail call float @llvm.fmuladd.f32(float %251, float %260, float %251)
  %262 = fsub float 0x3FF921FB60000000, %261
  %263 = fcmp ogt float %248, %247
  %264 = select i1 %263, float %262, float %261
  %265 = fsub float 0x400921FB60000000, %264
  %266 = fcmp olt float %221, 0.000000e+00
  %267 = select i1 %266, float %265, float %264
  %268 = bitcast float %221 to i32
  %269 = icmp slt i32 %268, 0
  %270 = select i1 %269, float 0x400921FB60000000, float 0.000000e+00
  %271 = fcmp oeq float %220, 0.000000e+00
  %272 = select i1 %271, float %270, float %267
  %273 = select i1 %266, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %274 = fcmp oeq float %247, 0x7FF0000000000000
  %275 = fcmp oeq float %248, 0x7FF0000000000000
  %276 = and i1 %275, %274
  %277 = select i1 %276, float %273, float %272
  %278 = fcmp uno float %221, %220
  %279 = select i1 %278, float 0x7FF8000000000000, float %277
  %280 = tail call float @llvm.copysign.f32(float %279, float %220)
  %281 = fdiv contract float %280, 0x400921FA00000000
  %282 = fmul contract float %281, 1.800000e+02
  %283 = fcmp contract ule float %282, -1.575000e+02
  %284 = fcmp contract ugt float %282, -1.125000e+02
  %285 = or i1 %283, %284
  br i1 %285, label %286, label %290

286:                                              ; preds = %219
  %287 = fcmp contract ule float %282, 2.250000e+01
  %288 = fcmp contract ugt float %282, 6.750000e+01
  %289 = or i1 %287, %288
  br i1 %289, label %291, label %290

290:                                              ; preds = %286, %219
  br label %291

291:                                              ; preds = %290, %286
  %292 = phi i8 [ 45, %290 ], [ 0, %286 ]
  %293 = fcmp contract ule float %282, -1.125000e+02
  %294 = fcmp contract ugt float %282, -6.750000e+01
  %295 = or i1 %293, %294
  br i1 %295, label %296, label %300

296:                                              ; preds = %291
  %297 = fcmp contract ule float %282, 6.750000e+01
  %298 = fcmp contract ugt float %282, 1.125000e+02
  %299 = or i1 %297, %298
  br i1 %299, label %301, label %300

300:                                              ; preds = %296, %291
  br label %301

301:                                              ; preds = %300, %296
  %302 = phi i8 [ 90, %300 ], [ %292, %296 ]
  %303 = fcmp contract ule float %282, -6.750000e+01
  %304 = fcmp contract ugt float %282, -2.250000e+01
  %305 = or i1 %303, %304
  br i1 %305, label %306, label %310

306:                                              ; preds = %301
  %307 = fcmp contract ule float %282, 1.125000e+02
  %308 = fcmp contract ugt float %282, 1.575000e+02
  %309 = or i1 %307, %308
  br i1 %309, label %311, label %310

310:                                              ; preds = %306, %301
  br label %311

311:                                              ; preds = %310, %306
  %312 = phi i8 [ -121, %310 ], [ %302, %306 ]
  %313 = fptoui float %246 to i8
  %314 = sext i32 %222 to i64
  %315 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %314
  store i8 %313, i8 addrspace(1)* %315, align 1, !tbaa !7
  %316 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %314
  store i8 %312, i8 addrspace(1)* %316, align 1, !tbaa !7
  br label %317

317:                                              ; preds = %8, %311
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = !{float 2.500000e+00}
