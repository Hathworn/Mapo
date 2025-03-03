; ModuleID = '../data/hip_kernels/9921/0/main.cu'
source_filename = "../data/hip_kernels/9921/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12Mean_SD_NormPfS_S_S_iiiE7meansum = internal unnamed_addr addrspace(3) global float undef, align 4
@mean = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@sd = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12Mean_SD_NormPfS_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %24, %4
  %26 = add nsw i32 %16, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %23
  store float %29, float addrspace(3)* %30, align 4, !tbaa !7
  %31 = icmp sgt i32 %4, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %7
  %33 = add i32 %23, %5
  %34 = mul nsw i32 %4, %4
  br label %47

35:                                               ; preds = %59, %7
  %36 = icmp eq i32 %23, 0
  br i1 %36, label %39, label %37

37:                                               ; preds = %35
  %38 = zext i32 %8 to i64
  br label %124

39:                                               ; preds = %35
  %40 = load float, float addrspace(3)* @_ZZ12Mean_SD_NormPfS_S_S_iiiE7meansum, align 4, !tbaa !7
  %41 = icmp sgt i32 %5, 0
  br i1 %41, label %42, label %80

42:                                               ; preds = %39
  %43 = and i32 %5, 7
  %44 = icmp ult i32 %5, 8
  br i1 %44, label %63, label %45

45:                                               ; preds = %42
  %46 = and i32 %5, -8
  br label %86

47:                                               ; preds = %32, %59
  %48 = phi float [ %29, %32 ], [ %60, %59 ]
  %49 = phi i32 [ 0, %32 ], [ %61, %59 ]
  %50 = add i32 %33, %49
  %51 = mul i32 %50, %4
  %52 = add i32 %51, %8
  %53 = icmp slt i32 %52, %34
  br i1 %53, label %54, label %59

54:                                               ; preds = %47
  %55 = sext i32 %51 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fadd contract float %57, %48
  store float %58, float addrspace(3)* %30, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %47, %54
  %60 = phi float [ %48, %47 ], [ %58, %54 ]
  %61 = add nsw i32 %49, %5
  %62 = icmp slt i32 %61, %4
  br i1 %62, label %47, label %35, !llvm.loop !11

63:                                               ; preds = %86, %42
  %64 = phi float [ undef, %42 ], [ %120, %86 ]
  %65 = phi i32 [ 0, %42 ], [ %121, %86 ]
  %66 = phi float [ %40, %42 ], [ %120, %86 ]
  %67 = icmp eq i32 %43, 0
  br i1 %67, label %78, label %68

68:                                               ; preds = %63, %68
  %69 = phi i32 [ %75, %68 ], [ %65, %63 ]
  %70 = phi float [ %74, %68 ], [ %66, %63 ]
  %71 = phi i32 [ %76, %68 ], [ 0, %63 ]
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %69
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %74 = fadd contract float %73, %70
  %75 = add nuw nsw i32 %69, 1
  %76 = add i32 %71, 1
  %77 = icmp eq i32 %76, %43
  br i1 %77, label %78, label %68, !llvm.loop !13

78:                                               ; preds = %68, %63
  %79 = phi float [ %64, %63 ], [ %74, %68 ]
  store float %79, float addrspace(3)* @_ZZ12Mean_SD_NormPfS_S_S_iiiE7meansum, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %78, %39
  %81 = phi float [ %79, %78 ], [ %40, %39 ]
  %82 = sitofp i32 %4 to float
  %83 = fdiv contract float %81, %82
  %84 = zext i32 %8 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  store float %83, float addrspace(1)* %85, align 4, !tbaa !7
  br label %124

86:                                               ; preds = %86, %45
  %87 = phi i32 [ 0, %45 ], [ %121, %86 ]
  %88 = phi float [ %40, %45 ], [ %120, %86 ]
  %89 = phi i32 [ 0, %45 ], [ %122, %86 ]
  %90 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %87
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %92 = fadd contract float %91, %88
  %93 = or i32 %87, 1
  %94 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %93
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %96 = fadd contract float %95, %92
  %97 = or i32 %87, 2
  %98 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %100 = fadd contract float %99, %96
  %101 = or i32 %87, 3
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %101
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !7
  %104 = fadd contract float %103, %100
  %105 = or i32 %87, 4
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %105
  %107 = load float, float addrspace(3)* %106, align 4, !tbaa !7
  %108 = fadd contract float %107, %104
  %109 = or i32 %87, 5
  %110 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fadd contract float %111, %108
  %113 = or i32 %87, 6
  %114 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %116 = fadd contract float %115, %112
  %117 = or i32 %87, 7
  %118 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @mean, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !7
  %120 = fadd contract float %119, %116
  %121 = add nuw nsw i32 %87, 8
  %122 = add i32 %89, 8
  %123 = icmp eq i32 %122, %46
  br i1 %123, label %63, label %86, !llvm.loop !15

124:                                              ; preds = %37, %80
  %125 = phi i64 [ %38, %37 ], [ %84, %80 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %126 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = fsub contract float %126, %128
  %130 = tail call float @llvm.fabs.f32(float %129)
  %131 = tail call float @llvm.amdgcn.frexp.mant.f32(float %130)
  %132 = fcmp olt float %131, 0x3FE5555560000000
  %133 = zext i1 %132 to i32
  %134 = tail call float @llvm.amdgcn.ldexp.f32(float %131, i32 %133)
  %135 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %130)
  %136 = sub nsw i32 %135, %133
  %137 = fadd float %134, -1.000000e+00
  %138 = fadd float %134, 1.000000e+00
  %139 = fadd float %138, -1.000000e+00
  %140 = fsub float %134, %139
  %141 = tail call float @llvm.amdgcn.rcp.f32(float %138)
  %142 = fmul float %137, %141
  %143 = fmul float %138, %142
  %144 = fneg float %143
  %145 = tail call float @llvm.fma.f32(float %142, float %138, float %144)
  %146 = tail call float @llvm.fma.f32(float %142, float %140, float %145)
  %147 = fadd float %143, %146
  %148 = fsub float %147, %143
  %149 = fsub float %146, %148
  %150 = fsub float %137, %147
  %151 = fsub float %137, %150
  %152 = fsub float %151, %147
  %153 = fsub float %152, %149
  %154 = fadd float %150, %153
  %155 = fmul float %141, %154
  %156 = fadd float %142, %155
  %157 = fsub float %156, %142
  %158 = fsub float %155, %157
  %159 = fmul float %156, %156
  %160 = fneg float %159
  %161 = tail call float @llvm.fma.f32(float %156, float %156, float %160)
  %162 = fmul float %158, 2.000000e+00
  %163 = tail call float @llvm.fma.f32(float %156, float %162, float %161)
  %164 = fadd float %159, %163
  %165 = fsub float %164, %159
  %166 = fsub float %163, %165
  %167 = tail call float @llvm.fmuladd.f32(float %164, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %168 = tail call float @llvm.fmuladd.f32(float %164, float %167, float 0x3FD999BDE0000000)
  %169 = sitofp i32 %136 to float
  %170 = fmul float %169, 0x3FE62E4300000000
  %171 = fneg float %170
  %172 = tail call float @llvm.fma.f32(float %169, float 0x3FE62E4300000000, float %171)
  %173 = tail call float @llvm.fma.f32(float %169, float 0xBE205C6100000000, float %172)
  %174 = fadd float %170, %173
  %175 = fsub float %174, %170
  %176 = fsub float %173, %175
  %177 = tail call float @llvm.amdgcn.ldexp.f32(float %156, i32 1)
  %178 = fmul float %156, %164
  %179 = fneg float %178
  %180 = tail call float @llvm.fma.f32(float %164, float %156, float %179)
  %181 = tail call float @llvm.fma.f32(float %164, float %158, float %180)
  %182 = tail call float @llvm.fma.f32(float %166, float %156, float %181)
  %183 = fadd float %178, %182
  %184 = fsub float %183, %178
  %185 = fsub float %182, %184
  %186 = fmul float %164, %168
  %187 = fneg float %186
  %188 = tail call float @llvm.fma.f32(float %164, float %168, float %187)
  %189 = tail call float @llvm.fma.f32(float %166, float %168, float %188)
  %190 = fadd float %186, %189
  %191 = fsub float %190, %186
  %192 = fsub float %189, %191
  %193 = fadd float %190, 0x3FE5555540000000
  %194 = fadd float %193, 0xBFE5555540000000
  %195 = fsub float %190, %194
  %196 = fadd float %192, 0x3E2E720200000000
  %197 = fadd float %196, %195
  %198 = fadd float %193, %197
  %199 = fsub float %198, %193
  %200 = fsub float %197, %199
  %201 = fmul float %183, %198
  %202 = fneg float %201
  %203 = tail call float @llvm.fma.f32(float %183, float %198, float %202)
  %204 = tail call float @llvm.fma.f32(float %183, float %200, float %203)
  %205 = tail call float @llvm.fma.f32(float %185, float %198, float %204)
  %206 = tail call float @llvm.amdgcn.ldexp.f32(float %158, i32 1)
  %207 = fadd float %201, %205
  %208 = fsub float %207, %201
  %209 = fsub float %205, %208
  %210 = fadd float %177, %207
  %211 = fsub float %210, %177
  %212 = fsub float %207, %211
  %213 = fadd float %206, %209
  %214 = fadd float %213, %212
  %215 = fadd float %210, %214
  %216 = fsub float %215, %210
  %217 = fsub float %214, %216
  %218 = fadd float %174, %215
  %219 = fsub float %218, %174
  %220 = fsub float %218, %219
  %221 = fsub float %174, %220
  %222 = fsub float %215, %219
  %223 = fadd float %222, %221
  %224 = fadd float %176, %217
  %225 = fsub float %224, %176
  %226 = fsub float %224, %225
  %227 = fsub float %176, %226
  %228 = fsub float %217, %225
  %229 = fadd float %228, %227
  %230 = fadd float %224, %223
  %231 = fadd float %218, %230
  %232 = fsub float %231, %218
  %233 = fsub float %230, %232
  %234 = fadd float %229, %233
  %235 = fadd float %231, %234
  %236 = fsub float %235, %231
  %237 = fsub float %234, %236
  %238 = fmul float %235, 2.000000e+00
  %239 = fneg float %238
  %240 = tail call float @llvm.fma.f32(float %235, float 2.000000e+00, float %239)
  %241 = tail call float @llvm.fma.f32(float %237, float 2.000000e+00, float %240)
  %242 = fadd float %238, %241
  %243 = fsub float %242, %238
  %244 = fsub float %241, %243
  %245 = tail call float @llvm.fabs.f32(float %238) #4
  %246 = fcmp oeq float %245, 0x7FF0000000000000
  %247 = select i1 %246, float %238, float %242
  %248 = tail call float @llvm.fabs.f32(float %247) #4
  %249 = fcmp oeq float %248, 0x7FF0000000000000
  %250 = select i1 %249, float 0.000000e+00, float %244
  %251 = fcmp oeq float %247, 0x40562E4300000000
  %252 = select i1 %251, float 0x3EE0000000000000, float 0.000000e+00
  %253 = fsub float %247, %252
  %254 = fadd float %252, %250
  %255 = fmul float %253, 0x3FF7154760000000
  %256 = tail call float @llvm.rint.f32(float %255)
  %257 = fcmp ogt float %253, 0x40562E4300000000
  %258 = fcmp olt float %253, 0xC059D1DA00000000
  %259 = fneg float %255
  %260 = tail call float @llvm.fma.f32(float %253, float 0x3FF7154760000000, float %259)
  %261 = tail call float @llvm.fma.f32(float %253, float 0x3E54AE0BE0000000, float %260)
  %262 = fsub float %255, %256
  %263 = fadd float %261, %262
  %264 = tail call float @llvm.exp2.f32(float %263)
  %265 = fptosi float %256 to i32
  %266 = tail call float @llvm.amdgcn.ldexp.f32(float %264, i32 %265)
  %267 = select i1 %258, float 0.000000e+00, float %266
  %268 = select i1 %257, float 0x7FF0000000000000, float %267
  %269 = tail call float @llvm.fma.f32(float %268, float %254, float %268)
  %270 = tail call float @llvm.fabs.f32(float %268) #4
  %271 = fcmp oeq float %270, 0x7FF0000000000000
  %272 = select i1 %271, float %268, float %269
  %273 = tail call float @llvm.fabs.f32(float %272)
  %274 = fcmp oeq float %130, 0x7FF0000000000000
  %275 = fcmp oeq float %129, 0.000000e+00
  %276 = select i1 %274, float 0x7FF0000000000000, float %273
  %277 = select i1 %275, float 0.000000e+00, float %276
  %278 = fcmp uno float %129, 0.000000e+00
  %279 = select i1 %278, float 0x7FF8000000000000, float %277
  %280 = fcmp oeq float %129, 1.000000e+00
  %281 = select i1 %280, float 1.000000e+00, float %279
  %282 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %23
  store float %281, float addrspace(3)* %282, align 4, !tbaa !7
  br i1 %31, label %283, label %286

283:                                              ; preds = %124
  %284 = add i32 %23, %5
  %285 = mul nsw i32 %4, %4
  br label %287

286:                                              ; preds = %452, %124
  br i1 %36, label %455, label %520

287:                                              ; preds = %283, %452
  %288 = phi i32 [ 0, %283 ], [ %453, %452 ]
  %289 = add i32 %284, %288
  %290 = mul i32 %289, %4
  %291 = add i32 %290, %8
  %292 = icmp slt i32 %291, %285
  br i1 %292, label %293, label %452

293:                                              ; preds = %287
  %294 = sext i32 %290 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %0, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !7
  %297 = fsub contract float %296, %128
  %298 = tail call float @llvm.fabs.f32(float %297)
  %299 = tail call float @llvm.amdgcn.frexp.mant.f32(float %298)
  %300 = fcmp olt float %299, 0x3FE5555560000000
  %301 = zext i1 %300 to i32
  %302 = tail call float @llvm.amdgcn.ldexp.f32(float %299, i32 %301)
  %303 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %298)
  %304 = sub nsw i32 %303, %301
  %305 = fadd float %302, -1.000000e+00
  %306 = fadd float %302, 1.000000e+00
  %307 = fadd float %306, -1.000000e+00
  %308 = fsub float %302, %307
  %309 = tail call float @llvm.amdgcn.rcp.f32(float %306)
  %310 = fmul float %305, %309
  %311 = fmul float %306, %310
  %312 = fneg float %311
  %313 = tail call float @llvm.fma.f32(float %310, float %306, float %312)
  %314 = tail call float @llvm.fma.f32(float %310, float %308, float %313)
  %315 = fadd float %311, %314
  %316 = fsub float %315, %311
  %317 = fsub float %314, %316
  %318 = fsub float %305, %315
  %319 = fsub float %305, %318
  %320 = fsub float %319, %315
  %321 = fsub float %320, %317
  %322 = fadd float %318, %321
  %323 = fmul float %309, %322
  %324 = fadd float %310, %323
  %325 = fsub float %324, %310
  %326 = fsub float %323, %325
  %327 = fmul float %324, %324
  %328 = fneg float %327
  %329 = tail call float @llvm.fma.f32(float %324, float %324, float %328)
  %330 = fmul float %326, 2.000000e+00
  %331 = tail call float @llvm.fma.f32(float %324, float %330, float %329)
  %332 = fadd float %327, %331
  %333 = fsub float %332, %327
  %334 = fsub float %331, %333
  %335 = tail call float @llvm.fmuladd.f32(float %332, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %336 = tail call float @llvm.fmuladd.f32(float %332, float %335, float 0x3FD999BDE0000000)
  %337 = sitofp i32 %304 to float
  %338 = fmul float %337, 0x3FE62E4300000000
  %339 = fneg float %338
  %340 = tail call float @llvm.fma.f32(float %337, float 0x3FE62E4300000000, float %339)
  %341 = tail call float @llvm.fma.f32(float %337, float 0xBE205C6100000000, float %340)
  %342 = fadd float %338, %341
  %343 = fsub float %342, %338
  %344 = fsub float %341, %343
  %345 = tail call float @llvm.amdgcn.ldexp.f32(float %324, i32 1)
  %346 = fmul float %324, %332
  %347 = fneg float %346
  %348 = tail call float @llvm.fma.f32(float %332, float %324, float %347)
  %349 = tail call float @llvm.fma.f32(float %332, float %326, float %348)
  %350 = tail call float @llvm.fma.f32(float %334, float %324, float %349)
  %351 = fadd float %346, %350
  %352 = fsub float %351, %346
  %353 = fsub float %350, %352
  %354 = fmul float %332, %336
  %355 = fneg float %354
  %356 = tail call float @llvm.fma.f32(float %332, float %336, float %355)
  %357 = tail call float @llvm.fma.f32(float %334, float %336, float %356)
  %358 = fadd float %354, %357
  %359 = fsub float %358, %354
  %360 = fsub float %357, %359
  %361 = fadd float %358, 0x3FE5555540000000
  %362 = fadd float %361, 0xBFE5555540000000
  %363 = fsub float %358, %362
  %364 = fadd float %360, 0x3E2E720200000000
  %365 = fadd float %364, %363
  %366 = fadd float %361, %365
  %367 = fsub float %366, %361
  %368 = fsub float %365, %367
  %369 = fmul float %351, %366
  %370 = fneg float %369
  %371 = tail call float @llvm.fma.f32(float %351, float %366, float %370)
  %372 = tail call float @llvm.fma.f32(float %351, float %368, float %371)
  %373 = tail call float @llvm.fma.f32(float %353, float %366, float %372)
  %374 = tail call float @llvm.amdgcn.ldexp.f32(float %326, i32 1)
  %375 = fadd float %369, %373
  %376 = fsub float %375, %369
  %377 = fsub float %373, %376
  %378 = fadd float %345, %375
  %379 = fsub float %378, %345
  %380 = fsub float %375, %379
  %381 = fadd float %374, %377
  %382 = fadd float %381, %380
  %383 = fadd float %378, %382
  %384 = fsub float %383, %378
  %385 = fsub float %382, %384
  %386 = fadd float %342, %383
  %387 = fsub float %386, %342
  %388 = fsub float %386, %387
  %389 = fsub float %342, %388
  %390 = fsub float %383, %387
  %391 = fadd float %390, %389
  %392 = fadd float %344, %385
  %393 = fsub float %392, %344
  %394 = fsub float %392, %393
  %395 = fsub float %344, %394
  %396 = fsub float %385, %393
  %397 = fadd float %396, %395
  %398 = fadd float %392, %391
  %399 = fadd float %386, %398
  %400 = fsub float %399, %386
  %401 = fsub float %398, %400
  %402 = fadd float %397, %401
  %403 = fadd float %399, %402
  %404 = fsub float %403, %399
  %405 = fsub float %402, %404
  %406 = fmul float %403, 2.000000e+00
  %407 = fneg float %406
  %408 = tail call float @llvm.fma.f32(float %403, float 2.000000e+00, float %407)
  %409 = tail call float @llvm.fma.f32(float %405, float 2.000000e+00, float %408)
  %410 = fadd float %406, %409
  %411 = fsub float %410, %406
  %412 = fsub float %409, %411
  %413 = tail call float @llvm.fabs.f32(float %406) #4
  %414 = fcmp oeq float %413, 0x7FF0000000000000
  %415 = select i1 %414, float %406, float %410
  %416 = tail call float @llvm.fabs.f32(float %415) #4
  %417 = fcmp oeq float %416, 0x7FF0000000000000
  %418 = select i1 %417, float 0.000000e+00, float %412
  %419 = fcmp oeq float %415, 0x40562E4300000000
  %420 = select i1 %419, float 0x3EE0000000000000, float 0.000000e+00
  %421 = fsub float %415, %420
  %422 = fadd float %420, %418
  %423 = fmul float %421, 0x3FF7154760000000
  %424 = tail call float @llvm.rint.f32(float %423)
  %425 = fcmp ogt float %421, 0x40562E4300000000
  %426 = fcmp olt float %421, 0xC059D1DA00000000
  %427 = fneg float %423
  %428 = tail call float @llvm.fma.f32(float %421, float 0x3FF7154760000000, float %427)
  %429 = tail call float @llvm.fma.f32(float %421, float 0x3E54AE0BE0000000, float %428)
  %430 = fsub float %423, %424
  %431 = fadd float %429, %430
  %432 = tail call float @llvm.exp2.f32(float %431)
  %433 = fptosi float %424 to i32
  %434 = tail call float @llvm.amdgcn.ldexp.f32(float %432, i32 %433)
  %435 = select i1 %426, float 0.000000e+00, float %434
  %436 = select i1 %425, float 0x7FF0000000000000, float %435
  %437 = tail call float @llvm.fma.f32(float %436, float %422, float %436)
  %438 = tail call float @llvm.fabs.f32(float %436) #4
  %439 = fcmp oeq float %438, 0x7FF0000000000000
  %440 = select i1 %439, float %436, float %437
  %441 = tail call float @llvm.fabs.f32(float %440)
  %442 = fcmp oeq float %298, 0x7FF0000000000000
  %443 = fcmp oeq float %297, 0.000000e+00
  %444 = select i1 %442, float 0x7FF0000000000000, float %441
  %445 = select i1 %443, float 0.000000e+00, float %444
  %446 = fcmp uno float %297, 0.000000e+00
  %447 = select i1 %446, float 0x7FF8000000000000, float %445
  %448 = fcmp oeq float %297, 1.000000e+00
  %449 = select i1 %448, float 1.000000e+00, float %447
  %450 = load float, float addrspace(3)* %282, align 4, !tbaa !7
  %451 = fadd contract float %450, %449
  store float %451, float addrspace(3)* %282, align 4, !tbaa !7
  br label %452

452:                                              ; preds = %287, %293
  %453 = add nsw i32 %288, %5
  %454 = icmp slt i32 %453, %4
  br i1 %454, label %287, label %286, !llvm.loop !16

455:                                              ; preds = %286
  %456 = icmp sgt i32 %5, 0
  br i1 %456, label %457, label %477

457:                                              ; preds = %455
  %458 = and i32 %5, 7
  %459 = icmp ult i32 %5, 8
  br i1 %459, label %462, label %460

460:                                              ; preds = %457
  %461 = and i32 %5, -8
  br label %482

462:                                              ; preds = %482, %457
  %463 = phi float [ undef, %457 ], [ %516, %482 ]
  %464 = phi i32 [ 0, %457 ], [ %517, %482 ]
  %465 = phi float [ 0.000000e+00, %457 ], [ %516, %482 ]
  %466 = icmp eq i32 %458, 0
  br i1 %466, label %477, label %467

467:                                              ; preds = %462, %467
  %468 = phi i32 [ %474, %467 ], [ %464, %462 ]
  %469 = phi float [ %473, %467 ], [ %465, %462 ]
  %470 = phi i32 [ %475, %467 ], [ 0, %462 ]
  %471 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %468
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !7
  %473 = fadd contract float %472, %469
  %474 = add nuw nsw i32 %468, 1
  %475 = add i32 %470, 1
  %476 = icmp eq i32 %475, %458
  br i1 %476, label %477, label %467, !llvm.loop !17

477:                                              ; preds = %462, %467, %455
  %478 = phi float [ 0.000000e+00, %455 ], [ %463, %462 ], [ %473, %467 ]
  %479 = sitofp i32 %4 to float
  %480 = fdiv contract float %478, %479
  %481 = getelementptr inbounds float, float addrspace(1)* %3, i64 %125
  store float %480, float addrspace(1)* %481, align 4, !tbaa !7
  br label %520

482:                                              ; preds = %482, %460
  %483 = phi i32 [ 0, %460 ], [ %517, %482 ]
  %484 = phi float [ 0.000000e+00, %460 ], [ %516, %482 ]
  %485 = phi i32 [ 0, %460 ], [ %518, %482 ]
  %486 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %483
  %487 = load float, float addrspace(3)* %486, align 4, !tbaa !7
  %488 = fadd contract float %487, %484
  %489 = or i32 %483, 1
  %490 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %489
  %491 = load float, float addrspace(3)* %490, align 4, !tbaa !7
  %492 = fadd contract float %491, %488
  %493 = or i32 %483, 2
  %494 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %493
  %495 = load float, float addrspace(3)* %494, align 4, !tbaa !7
  %496 = fadd contract float %495, %492
  %497 = or i32 %483, 3
  %498 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %497
  %499 = load float, float addrspace(3)* %498, align 4, !tbaa !7
  %500 = fadd contract float %499, %496
  %501 = or i32 %483, 4
  %502 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %501
  %503 = load float, float addrspace(3)* %502, align 4, !tbaa !7
  %504 = fadd contract float %503, %500
  %505 = or i32 %483, 5
  %506 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %505
  %507 = load float, float addrspace(3)* %506, align 4, !tbaa !7
  %508 = fadd contract float %507, %504
  %509 = or i32 %483, 6
  %510 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %509
  %511 = load float, float addrspace(3)* %510, align 4, !tbaa !7
  %512 = fadd contract float %511, %508
  %513 = or i32 %483, 7
  %514 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sd, i32 0, i32 %513
  %515 = load float, float addrspace(3)* %514, align 4, !tbaa !7
  %516 = fadd contract float %515, %512
  %517 = add nuw nsw i32 %483, 8
  %518 = add i32 %485, 8
  %519 = icmp eq i32 %518, %461
  br i1 %519, label %462, label %482, !llvm.loop !18

520:                                              ; preds = %477, %286
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %521 = mul i32 %8, %4
  %522 = add i32 %521, %23
  %523 = zext i32 %522 to i64
  %524 = getelementptr inbounds float, float addrspace(1)* %0, i64 %523
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !7
  %526 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %527 = fsub contract float %525, %526
  %528 = getelementptr inbounds float, float addrspace(1)* %3, i64 %125
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %530 = fdiv contract float %527, %529
  %531 = getelementptr inbounds float, float addrspace(1)* %1, i64 %523
  store float %530, float addrspace(1)* %531, align 4, !tbaa !7
  %532 = icmp sgt i32 %6, 0
  br i1 %532, label %533, label %568

533:                                              ; preds = %520
  %534 = add i32 %23, %5
  %535 = add i32 %534, %521
  %536 = mul nsw i32 %4, %4
  %537 = icmp ult i32 %535, %536
  %538 = zext i32 %535 to i64
  %539 = getelementptr inbounds float, float addrspace(1)* %0, i64 %538
  %540 = getelementptr inbounds float, float addrspace(1)* %1, i64 %538
  br i1 %537, label %546, label %541

541:                                              ; preds = %533
  %542 = and i32 %6, 7
  %543 = icmp ult i32 %6, 8
  br i1 %543, label %562, label %544

544:                                              ; preds = %541
  %545 = and i32 %6, -8
  br label %569

546:                                              ; preds = %533
  %547 = and i32 %6, 3
  %548 = icmp ult i32 %6, 4
  br i1 %548, label %551, label %549

549:                                              ; preds = %546
  %550 = and i32 %6, -4
  br label %573

551:                                              ; preds = %573, %546
  %552 = icmp eq i32 %547, 0
  br i1 %552, label %568, label %553

553:                                              ; preds = %551, %553
  %554 = phi i32 [ %560, %553 ], [ 0, %551 ]
  %555 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %556 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %557 = fsub contract float %555, %556
  %558 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %559 = fdiv contract float %557, %558
  store float %559, float addrspace(1)* %540, align 4, !tbaa !7
  %560 = add i32 %554, 1
  %561 = icmp eq i32 %560, %547
  br i1 %561, label %568, label %553, !llvm.loop !19

562:                                              ; preds = %569, %541
  %563 = icmp eq i32 %542, 0
  br i1 %563, label %568, label %564

564:                                              ; preds = %562, %564
  %565 = phi i32 [ %566, %564 ], [ 0, %562 ]
  %566 = add i32 %565, 1
  %567 = icmp eq i32 %566, %542
  br i1 %567, label %568, label %564, !llvm.loop !20

568:                                              ; preds = %553, %551, %564, %562, %520
  ret void

569:                                              ; preds = %569, %544
  %570 = phi i32 [ 0, %544 ], [ %571, %569 ]
  %571 = add i32 %570, 8
  %572 = icmp eq i32 %571, %545
  br i1 %572, label %562, label %569, !llvm.loop !21

573:                                              ; preds = %573, %549
  %574 = phi i32 [ 0, %549 ], [ %595, %573 ]
  %575 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %576 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %577 = fsub contract float %575, %576
  %578 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %579 = fdiv contract float %577, %578
  store float %579, float addrspace(1)* %540, align 4, !tbaa !7
  %580 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %581 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %582 = fsub contract float %580, %581
  %583 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %584 = fdiv contract float %582, %583
  store float %584, float addrspace(1)* %540, align 4, !tbaa !7
  %585 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %586 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %587 = fsub contract float %585, %586
  %588 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %589 = fdiv contract float %587, %588
  store float %589, float addrspace(1)* %540, align 4, !tbaa !7
  %590 = load float, float addrspace(1)* %539, align 4, !tbaa !7
  %591 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %592 = fsub contract float %590, %591
  %593 = load float, float addrspace(1)* %528, align 4, !tbaa !7
  %594 = fdiv contract float %592, %593
  store float %594, float addrspace(1)* %540, align 4, !tbaa !7
  %595 = add i32 %574, 4
  %596 = icmp eq i32 %595, %550
  br i1 %596, label %551, label %573, !llvm.loop !21
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !12}
