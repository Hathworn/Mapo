; ModuleID = '../data/hip_kernels/11885/2/main.cu'
source_filename = "../data/hip_kernels/11885/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16FindClosestPointP15HIP_vector_typeIfLj3EEPii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0, i32 0, i64 0
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15, i32 0, i32 0, i32 0, i32 0, i64 1
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  br label %20

19:                                               ; preds = %342, %3
  ret void

20:                                               ; preds = %14, %342
  %21 = phi i32 [ 0, %14 ], [ %344, %342 ]
  %22 = phi i32 [ 9999999, %14 ], [ %343, %342 ]
  %23 = icmp eq i32 %12, %21
  br i1 %23, label %342, label %24

24:                                               ; preds = %20
  %25 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %26 = zext i32 %21 to i64
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i32 0, i64 0
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = fsub contract float %25, %28
  %30 = tail call float @llvm.fabs.f32(float %29)
  %31 = tail call float @llvm.amdgcn.frexp.mant.f32(float %30)
  %32 = fcmp olt float %31, 0x3FE5555560000000
  %33 = zext i1 %32 to i32
  %34 = tail call float @llvm.amdgcn.ldexp.f32(float %31, i32 %33)
  %35 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %30)
  %36 = sub nsw i32 %35, %33
  %37 = fadd float %34, -1.000000e+00
  %38 = fadd float %34, 1.000000e+00
  %39 = fadd float %38, -1.000000e+00
  %40 = fsub float %34, %39
  %41 = tail call float @llvm.amdgcn.rcp.f32(float %38)
  %42 = fmul float %37, %41
  %43 = fmul float %38, %42
  %44 = fneg float %43
  %45 = tail call float @llvm.fma.f32(float %42, float %38, float %44)
  %46 = tail call float @llvm.fma.f32(float %42, float %40, float %45)
  %47 = fadd float %43, %46
  %48 = fsub float %47, %43
  %49 = fsub float %46, %48
  %50 = fsub float %37, %47
  %51 = fsub float %37, %50
  %52 = fsub float %51, %47
  %53 = fsub float %52, %49
  %54 = fadd float %50, %53
  %55 = fmul float %41, %54
  %56 = fadd float %42, %55
  %57 = fsub float %56, %42
  %58 = fsub float %55, %57
  %59 = fmul float %56, %56
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %56, float %56, float %60)
  %62 = fmul float %58, 2.000000e+00
  %63 = tail call float @llvm.fma.f32(float %56, float %62, float %61)
  %64 = fadd float %59, %63
  %65 = fsub float %64, %59
  %66 = fsub float %63, %65
  %67 = tail call float @llvm.fmuladd.f32(float %64, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %68 = tail call float @llvm.fmuladd.f32(float %64, float %67, float 0x3FD999BDE0000000)
  %69 = sitofp i32 %36 to float
  %70 = fmul float %69, 0x3FE62E4300000000
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %69, float 0x3FE62E4300000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %69, float 0xBE205C6100000000, float %72)
  %74 = fadd float %70, %73
  %75 = fsub float %74, %70
  %76 = fsub float %73, %75
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %56, i32 1)
  %78 = fmul float %56, %64
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %64, float %56, float %79)
  %81 = tail call float @llvm.fma.f32(float %64, float %58, float %80)
  %82 = tail call float @llvm.fma.f32(float %66, float %56, float %81)
  %83 = fadd float %78, %82
  %84 = fsub float %83, %78
  %85 = fsub float %82, %84
  %86 = fmul float %64, %68
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %64, float %68, float %87)
  %89 = tail call float @llvm.fma.f32(float %66, float %68, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = fadd float %90, 0x3FE5555540000000
  %94 = fadd float %93, 0xBFE5555540000000
  %95 = fsub float %90, %94
  %96 = fadd float %92, 0x3E2E720200000000
  %97 = fadd float %96, %95
  %98 = fadd float %93, %97
  %99 = fsub float %98, %93
  %100 = fsub float %97, %99
  %101 = fmul float %83, %98
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %83, float %98, float %102)
  %104 = tail call float @llvm.fma.f32(float %83, float %100, float %103)
  %105 = tail call float @llvm.fma.f32(float %85, float %98, float %104)
  %106 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 1)
  %107 = fadd float %101, %105
  %108 = fsub float %107, %101
  %109 = fsub float %105, %108
  %110 = fadd float %77, %107
  %111 = fsub float %110, %77
  %112 = fsub float %107, %111
  %113 = fadd float %106, %109
  %114 = fadd float %113, %112
  %115 = fadd float %110, %114
  %116 = fsub float %115, %110
  %117 = fsub float %114, %116
  %118 = fadd float %74, %115
  %119 = fsub float %118, %74
  %120 = fsub float %118, %119
  %121 = fsub float %74, %120
  %122 = fsub float %115, %119
  %123 = fadd float %122, %121
  %124 = fadd float %76, %117
  %125 = fsub float %124, %76
  %126 = fsub float %124, %125
  %127 = fsub float %76, %126
  %128 = fsub float %117, %125
  %129 = fadd float %128, %127
  %130 = fadd float %124, %123
  %131 = fadd float %118, %130
  %132 = fsub float %131, %118
  %133 = fsub float %130, %132
  %134 = fadd float %129, %133
  %135 = fadd float %131, %134
  %136 = fsub float %135, %131
  %137 = fsub float %134, %136
  %138 = fmul float %135, 2.000000e+00
  %139 = fneg float %138
  %140 = tail call float @llvm.fma.f32(float %135, float 2.000000e+00, float %139)
  %141 = fmul float %135, 0.000000e+00
  %142 = tail call float @llvm.fma.f32(float %137, float 2.000000e+00, float %141)
  %143 = fadd float %140, %142
  %144 = fadd float %138, %143
  %145 = fsub float %144, %138
  %146 = fsub float %143, %145
  %147 = tail call float @llvm.fabs.f32(float %138) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float %138, float %144
  %150 = tail call float @llvm.fabs.f32(float %149) #3
  %151 = fcmp oeq float %150, 0x7FF0000000000000
  %152 = select i1 %151, float 0.000000e+00, float %146
  %153 = fcmp oeq float %149, 0x40562E4300000000
  %154 = select i1 %153, float 0x3EE0000000000000, float 0.000000e+00
  %155 = fsub float %149, %154
  %156 = fadd float %154, %152
  %157 = fmul float %155, 0x3FF7154760000000
  %158 = tail call float @llvm.rint.f32(float %157)
  %159 = fcmp ogt float %155, 0x40562E4300000000
  %160 = fcmp olt float %155, 0xC059D1DA00000000
  %161 = fneg float %157
  %162 = tail call float @llvm.fma.f32(float %155, float 0x3FF7154760000000, float %161)
  %163 = tail call float @llvm.fma.f32(float %155, float 0x3E54AE0BE0000000, float %162)
  %164 = fsub float %157, %158
  %165 = fadd float %163, %164
  %166 = tail call float @llvm.exp2.f32(float %165)
  %167 = fptosi float %158 to i32
  %168 = tail call float @llvm.amdgcn.ldexp.f32(float %166, i32 %167)
  %169 = select i1 %160, float 0.000000e+00, float %168
  %170 = select i1 %159, float 0x7FF0000000000000, float %169
  %171 = tail call float @llvm.fma.f32(float %170, float %156, float %170)
  %172 = tail call float @llvm.fabs.f32(float %170) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float %170, float %171
  %175 = tail call float @llvm.fabs.f32(float %174)
  %176 = fcmp oeq float %30, 0x7FF0000000000000
  %177 = fcmp oeq float %29, 0.000000e+00
  %178 = select i1 %176, float 0x7FF0000000000000, float %175
  %179 = select i1 %177, float 0.000000e+00, float %178
  %180 = fcmp uno float %29, 0.000000e+00
  %181 = select i1 %180, float 0x7FF8000000000000, float %179
  %182 = load float, float addrspace(1)* %17, align 4, !tbaa !7
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %26, i32 0, i32 0, i32 0, i32 0, i64 1
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fsub contract float %182, %184
  %186 = tail call float @llvm.fabs.f32(float %185)
  %187 = tail call float @llvm.amdgcn.frexp.mant.f32(float %186)
  %188 = fcmp olt float %187, 0x3FE5555560000000
  %189 = zext i1 %188 to i32
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %187, i32 %189)
  %191 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %186)
  %192 = sub nsw i32 %191, %189
  %193 = fadd float %190, -1.000000e+00
  %194 = fadd float %190, 1.000000e+00
  %195 = fadd float %194, -1.000000e+00
  %196 = fsub float %190, %195
  %197 = tail call float @llvm.amdgcn.rcp.f32(float %194)
  %198 = fmul float %193, %197
  %199 = fmul float %194, %198
  %200 = fneg float %199
  %201 = tail call float @llvm.fma.f32(float %198, float %194, float %200)
  %202 = tail call float @llvm.fma.f32(float %198, float %196, float %201)
  %203 = fadd float %199, %202
  %204 = fsub float %203, %199
  %205 = fsub float %202, %204
  %206 = fsub float %193, %203
  %207 = fsub float %193, %206
  %208 = fsub float %207, %203
  %209 = fsub float %208, %205
  %210 = fadd float %206, %209
  %211 = fmul float %197, %210
  %212 = fadd float %198, %211
  %213 = fsub float %212, %198
  %214 = fsub float %211, %213
  %215 = fmul float %212, %212
  %216 = fneg float %215
  %217 = tail call float @llvm.fma.f32(float %212, float %212, float %216)
  %218 = fmul float %214, 2.000000e+00
  %219 = tail call float @llvm.fma.f32(float %212, float %218, float %217)
  %220 = fadd float %215, %219
  %221 = fsub float %220, %215
  %222 = fsub float %219, %221
  %223 = tail call float @llvm.fmuladd.f32(float %220, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %224 = tail call float @llvm.fmuladd.f32(float %220, float %223, float 0x3FD999BDE0000000)
  %225 = sitofp i32 %192 to float
  %226 = fmul float %225, 0x3FE62E4300000000
  %227 = fneg float %226
  %228 = tail call float @llvm.fma.f32(float %225, float 0x3FE62E4300000000, float %227)
  %229 = tail call float @llvm.fma.f32(float %225, float 0xBE205C6100000000, float %228)
  %230 = fadd float %226, %229
  %231 = fsub float %230, %226
  %232 = fsub float %229, %231
  %233 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 1)
  %234 = fmul float %212, %220
  %235 = fneg float %234
  %236 = tail call float @llvm.fma.f32(float %220, float %212, float %235)
  %237 = tail call float @llvm.fma.f32(float %220, float %214, float %236)
  %238 = tail call float @llvm.fma.f32(float %222, float %212, float %237)
  %239 = fadd float %234, %238
  %240 = fsub float %239, %234
  %241 = fsub float %238, %240
  %242 = fmul float %220, %224
  %243 = fneg float %242
  %244 = tail call float @llvm.fma.f32(float %220, float %224, float %243)
  %245 = tail call float @llvm.fma.f32(float %222, float %224, float %244)
  %246 = fadd float %242, %245
  %247 = fsub float %246, %242
  %248 = fsub float %245, %247
  %249 = fadd float %246, 0x3FE5555540000000
  %250 = fadd float %249, 0xBFE5555540000000
  %251 = fsub float %246, %250
  %252 = fadd float %248, 0x3E2E720200000000
  %253 = fadd float %252, %251
  %254 = fadd float %249, %253
  %255 = fsub float %254, %249
  %256 = fsub float %253, %255
  %257 = fmul float %239, %254
  %258 = fneg float %257
  %259 = tail call float @llvm.fma.f32(float %239, float %254, float %258)
  %260 = tail call float @llvm.fma.f32(float %239, float %256, float %259)
  %261 = tail call float @llvm.fma.f32(float %241, float %254, float %260)
  %262 = tail call float @llvm.amdgcn.ldexp.f32(float %214, i32 1)
  %263 = fadd float %257, %261
  %264 = fsub float %263, %257
  %265 = fsub float %261, %264
  %266 = fadd float %233, %263
  %267 = fsub float %266, %233
  %268 = fsub float %263, %267
  %269 = fadd float %262, %265
  %270 = fadd float %269, %268
  %271 = fadd float %266, %270
  %272 = fsub float %271, %266
  %273 = fsub float %270, %272
  %274 = fadd float %230, %271
  %275 = fsub float %274, %230
  %276 = fsub float %274, %275
  %277 = fsub float %230, %276
  %278 = fsub float %271, %275
  %279 = fadd float %278, %277
  %280 = fadd float %232, %273
  %281 = fsub float %280, %232
  %282 = fsub float %280, %281
  %283 = fsub float %232, %282
  %284 = fsub float %273, %281
  %285 = fadd float %284, %283
  %286 = fadd float %280, %279
  %287 = fadd float %274, %286
  %288 = fsub float %287, %274
  %289 = fsub float %286, %288
  %290 = fadd float %285, %289
  %291 = fadd float %287, %290
  %292 = fsub float %291, %287
  %293 = fsub float %290, %292
  %294 = fmul float %291, 2.000000e+00
  %295 = fneg float %294
  %296 = tail call float @llvm.fma.f32(float %291, float 2.000000e+00, float %295)
  %297 = fmul float %291, 0.000000e+00
  %298 = tail call float @llvm.fma.f32(float %293, float 2.000000e+00, float %297)
  %299 = fadd float %296, %298
  %300 = fadd float %294, %299
  %301 = fsub float %300, %294
  %302 = fsub float %299, %301
  %303 = tail call float @llvm.fabs.f32(float %294) #3
  %304 = fcmp oeq float %303, 0x7FF0000000000000
  %305 = select i1 %304, float %294, float %300
  %306 = tail call float @llvm.fabs.f32(float %305) #3
  %307 = fcmp oeq float %306, 0x7FF0000000000000
  %308 = select i1 %307, float 0.000000e+00, float %302
  %309 = fcmp oeq float %305, 0x40562E4300000000
  %310 = select i1 %309, float 0x3EE0000000000000, float 0.000000e+00
  %311 = fsub float %305, %310
  %312 = fadd float %310, %308
  %313 = fmul float %311, 0x3FF7154760000000
  %314 = tail call float @llvm.rint.f32(float %313)
  %315 = fcmp ogt float %311, 0x40562E4300000000
  %316 = fcmp olt float %311, 0xC059D1DA00000000
  %317 = fneg float %313
  %318 = tail call float @llvm.fma.f32(float %311, float 0x3FF7154760000000, float %317)
  %319 = tail call float @llvm.fma.f32(float %311, float 0x3E54AE0BE0000000, float %318)
  %320 = fsub float %313, %314
  %321 = fadd float %319, %320
  %322 = tail call float @llvm.exp2.f32(float %321)
  %323 = fptosi float %314 to i32
  %324 = tail call float @llvm.amdgcn.ldexp.f32(float %322, i32 %323)
  %325 = select i1 %316, float 0.000000e+00, float %324
  %326 = select i1 %315, float 0x7FF0000000000000, float %325
  %327 = tail call float @llvm.fma.f32(float %326, float %312, float %326)
  %328 = tail call float @llvm.fabs.f32(float %326) #3
  %329 = fcmp oeq float %328, 0x7FF0000000000000
  %330 = select i1 %329, float %326, float %327
  %331 = tail call float @llvm.fabs.f32(float %330)
  %332 = fcmp oeq float %186, 0x7FF0000000000000
  %333 = fcmp oeq float %185, 0.000000e+00
  %334 = select i1 %332, float 0x7FF0000000000000, float %331
  %335 = select i1 %333, float 0.000000e+00, float %334
  %336 = fcmp uno float %185, 0.000000e+00
  %337 = select i1 %336, float 0x7FF8000000000000, float %335
  %338 = fadd contract float %181, %337
  %339 = fptosi float %338 to i32
  %340 = icmp sgt i32 %22, %339
  br i1 %340, label %341, label %342

341:                                              ; preds = %24
  store i32 %21, i32 addrspace(1)* %18, align 4, !tbaa !10
  br label %342

342:                                              ; preds = %20, %341, %24
  %343 = phi i32 [ %339, %341 ], [ %22, %24 ], [ %22, %20 ]
  %344 = add nuw nsw i32 %21, 1
  %345 = icmp eq i32 %344, %2
  br i1 %345, label %19, label %20, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
