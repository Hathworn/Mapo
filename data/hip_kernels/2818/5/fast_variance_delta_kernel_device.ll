; ModuleID = '../data/hip_kernels/2818/5/main.cu'
source_filename = "../data/hip_kernels/2818/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26fast_variance_delta_kernelPfS_S_S_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %10, align 4, !tbaa !5
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp sgt i32 %4, 0
  br i1 %12, label %13, label %133

13:                                               ; preds = %8
  %14 = icmp sgt i32 %6, 0
  %15 = sext i32 %11 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  %17 = add i32 %6, -1
  %18 = lshr i32 %17, 9
  %19 = add nuw nsw i32 %18, 1
  %20 = and i32 %19, 3
  %21 = icmp ult i32 %6, 1537
  %22 = and i32 %19, -4
  %23 = icmp eq i32 %20, 0
  br label %24

24:                                               ; preds = %13, %129
  %25 = phi float [ 0.000000e+00, %13 ], [ %130, %129 ]
  %26 = phi i32 [ 0, %13 ], [ %131, %129 ]
  br i1 %14, label %27, label %129

27:                                               ; preds = %24
  %28 = mul i32 %26, %5
  %29 = add i32 %28, %11
  %30 = mul i32 %29, %6
  br i1 %21, label %101, label %31

31:                                               ; preds = %27, %95
  %32 = phi float [ %97, %95 ], [ %25, %27 ]
  %33 = phi i32 [ %98, %95 ], [ 0, %27 ]
  %34 = phi i32 [ %99, %95 ], [ 0, %27 ]
  %35 = or i32 %33, %9
  %36 = icmp slt i32 %35, %6
  br i1 %36, label %37, label %47

37:                                               ; preds = %31
  %38 = add i32 %35, %30
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = fsub contract float %43, %44
  %46 = fmul contract float %41, %45
  br label %47

47:                                               ; preds = %31, %37
  %48 = phi contract float [ %46, %37 ], [ 0.000000e+00, %31 ]
  %49 = fadd contract float %48, %32
  %50 = or i32 %33, 512
  %51 = add nuw nsw i32 %50, %9
  %52 = icmp slt i32 %51, %6
  br i1 %52, label %53, label %63

53:                                               ; preds = %47
  %54 = add i32 %51, %30
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fsub contract float %59, %60
  %62 = fmul contract float %57, %61
  br label %63

63:                                               ; preds = %53, %47
  %64 = phi contract float [ %62, %53 ], [ 0.000000e+00, %47 ]
  %65 = fadd contract float %64, %49
  %66 = or i32 %33, %9
  %67 = or i32 %66, 1024
  %68 = icmp slt i32 %67, %6
  br i1 %68, label %69, label %79

69:                                               ; preds = %63
  %70 = add i32 %67, %30
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fsub contract float %75, %76
  %78 = fmul contract float %73, %77
  br label %79

79:                                               ; preds = %69, %63
  %80 = phi contract float [ %78, %69 ], [ 0.000000e+00, %63 ]
  %81 = fadd contract float %80, %65
  %82 = or i32 %33, 1536
  %83 = add nuw nsw i32 %82, %9
  %84 = icmp slt i32 %83, %6
  br i1 %84, label %85, label %95

85:                                               ; preds = %79
  %86 = add i32 %83, %30
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fsub contract float %91, %92
  %94 = fmul contract float %89, %93
  br label %95

95:                                               ; preds = %85, %79
  %96 = phi contract float [ %94, %85 ], [ 0.000000e+00, %79 ]
  %97 = fadd contract float %96, %81
  %98 = add nuw nsw i32 %33, 2048
  %99 = add i32 %34, 4
  %100 = icmp eq i32 %99, %22
  br i1 %100, label %101, label %31, !llvm.loop !10

101:                                              ; preds = %95, %27
  %102 = phi float [ undef, %27 ], [ %97, %95 ]
  %103 = phi float [ %25, %27 ], [ %97, %95 ]
  %104 = phi i32 [ 0, %27 ], [ %98, %95 ]
  br i1 %23, label %127, label %105

105:                                              ; preds = %101, %121
  %106 = phi float [ %123, %121 ], [ %103, %101 ]
  %107 = phi i32 [ %124, %121 ], [ %104, %101 ]
  %108 = phi i32 [ %125, %121 ], [ 0, %101 ]
  %109 = add nuw nsw i32 %107, %9
  %110 = icmp slt i32 %109, %6
  br i1 %110, label %111, label %121

111:                                              ; preds = %105
  %112 = add i32 %109, %30
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %119 = fsub contract float %117, %118
  %120 = fmul contract float %115, %119
  br label %121

121:                                              ; preds = %111, %105
  %122 = phi contract float [ %120, %111 ], [ 0.000000e+00, %105 ]
  %123 = fadd contract float %122, %106
  %124 = add nuw nsw i32 %107, 512
  %125 = add i32 %108, 1
  %126 = icmp eq i32 %125, %20
  br i1 %126, label %127, label %105, !llvm.loop !12

127:                                              ; preds = %121, %101
  %128 = phi float [ %102, %101 ], [ %123, %121 ]
  store float %128, float addrspace(3)* %10, align 4, !tbaa !5
  br label %129

129:                                              ; preds = %127, %24
  %130 = phi float [ %128, %127 ], [ %25, %24 ]
  %131 = add nuw nsw i32 %26, 1
  %132 = icmp eq i32 %131, %4
  br i1 %132, label %133, label %24, !llvm.loop !14

133:                                              ; preds = %129, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = icmp eq i32 %9, 0
  br i1 %134, label %135, label %367

135:                                              ; preds = %133
  %136 = sext i32 %11 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %7, i64 %136
  store float 0.000000e+00, float addrspace(1)* %137, align 4, !tbaa !5
  br label %138

138:                                              ; preds = %138, %135
  %139 = phi i32 [ 0, %135 ], [ %204, %138 ]
  %140 = phi float [ 0.000000e+00, %135 ], [ %203, %138 ]
  %141 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %139
  %142 = load float, float addrspace(3)* %141, align 16, !tbaa !5
  %143 = fadd contract float %142, %140
  %144 = or i32 %139, 1
  %145 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %144
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %147 = fadd contract float %146, %143
  %148 = or i32 %139, 2
  %149 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %148
  %150 = load float, float addrspace(3)* %149, align 8, !tbaa !5
  %151 = fadd contract float %150, %147
  %152 = or i32 %139, 3
  %153 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %152
  %154 = load float, float addrspace(3)* %153, align 4, !tbaa !5
  %155 = fadd contract float %154, %151
  %156 = or i32 %139, 4
  %157 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %156
  %158 = load float, float addrspace(3)* %157, align 16, !tbaa !5
  %159 = fadd contract float %158, %155
  %160 = or i32 %139, 5
  %161 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %160
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %163 = fadd contract float %162, %159
  %164 = or i32 %139, 6
  %165 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %164
  %166 = load float, float addrspace(3)* %165, align 8, !tbaa !5
  %167 = fadd contract float %166, %163
  %168 = or i32 %139, 7
  %169 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %168
  %170 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %171 = fadd contract float %170, %167
  %172 = or i32 %139, 8
  %173 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %172
  %174 = load float, float addrspace(3)* %173, align 16, !tbaa !5
  %175 = fadd contract float %174, %171
  %176 = or i32 %139, 9
  %177 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %176
  %178 = load float, float addrspace(3)* %177, align 4, !tbaa !5
  %179 = fadd contract float %178, %175
  %180 = or i32 %139, 10
  %181 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %180
  %182 = load float, float addrspace(3)* %181, align 8, !tbaa !5
  %183 = fadd contract float %182, %179
  %184 = or i32 %139, 11
  %185 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %184
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %187 = fadd contract float %186, %183
  %188 = or i32 %139, 12
  %189 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %188
  %190 = load float, float addrspace(3)* %189, align 16, !tbaa !5
  %191 = fadd contract float %190, %187
  %192 = or i32 %139, 13
  %193 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %192
  %194 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %195 = fadd contract float %194, %191
  %196 = or i32 %139, 14
  %197 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 8, !tbaa !5
  %199 = fadd contract float %198, %195
  %200 = or i32 %139, 15
  %201 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ26fast_variance_delta_kernelPfS_S_S_iiiS_E5local, i32 0, i32 %200
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !5
  %203 = fadd contract float %202, %199
  %204 = add nuw nsw i32 %139, 16
  %205 = icmp eq i32 %204, 512
  br i1 %205, label %206, label %138, !llvm.loop !15

206:                                              ; preds = %138
  store float %203, float addrspace(1)* %137, align 4, !tbaa !5
  %207 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !5
  %209 = fadd contract float %208, 0x3EE4F8B580000000
  %210 = tail call float @llvm.fabs.f32(float %209)
  %211 = tail call float @llvm.amdgcn.frexp.mant.f32(float %210)
  %212 = fcmp olt float %211, 0x3FE5555560000000
  %213 = zext i1 %212 to i32
  %214 = tail call float @llvm.amdgcn.ldexp.f32(float %211, i32 %213)
  %215 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %210)
  %216 = sub nsw i32 %215, %213
  %217 = fadd float %214, -1.000000e+00
  %218 = fadd float %214, 1.000000e+00
  %219 = fadd float %218, -1.000000e+00
  %220 = fsub float %214, %219
  %221 = tail call float @llvm.amdgcn.rcp.f32(float %218)
  %222 = fmul float %217, %221
  %223 = fmul float %218, %222
  %224 = fneg float %223
  %225 = tail call float @llvm.fma.f32(float %222, float %218, float %224)
  %226 = tail call float @llvm.fma.f32(float %222, float %220, float %225)
  %227 = fadd float %223, %226
  %228 = fsub float %227, %223
  %229 = fsub float %226, %228
  %230 = fsub float %217, %227
  %231 = fsub float %217, %230
  %232 = fsub float %231, %227
  %233 = fsub float %232, %229
  %234 = fadd float %230, %233
  %235 = fmul float %221, %234
  %236 = fadd float %222, %235
  %237 = fsub float %236, %222
  %238 = fsub float %235, %237
  %239 = fmul float %236, %236
  %240 = fneg float %239
  %241 = tail call float @llvm.fma.f32(float %236, float %236, float %240)
  %242 = fmul float %238, 2.000000e+00
  %243 = tail call float @llvm.fma.f32(float %236, float %242, float %241)
  %244 = fadd float %239, %243
  %245 = fsub float %244, %239
  %246 = fsub float %243, %245
  %247 = tail call float @llvm.fmuladd.f32(float %244, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %248 = tail call float @llvm.fmuladd.f32(float %244, float %247, float 0x3FD999BDE0000000)
  %249 = sitofp i32 %216 to float
  %250 = fmul float %249, 0x3FE62E4300000000
  %251 = fneg float %250
  %252 = tail call float @llvm.fma.f32(float %249, float 0x3FE62E4300000000, float %251)
  %253 = tail call float @llvm.fma.f32(float %249, float 0xBE205C6100000000, float %252)
  %254 = fadd float %250, %253
  %255 = fsub float %254, %250
  %256 = fsub float %253, %255
  %257 = tail call float @llvm.amdgcn.ldexp.f32(float %236, i32 1)
  %258 = fmul float %236, %244
  %259 = fneg float %258
  %260 = tail call float @llvm.fma.f32(float %244, float %236, float %259)
  %261 = tail call float @llvm.fma.f32(float %244, float %238, float %260)
  %262 = tail call float @llvm.fma.f32(float %246, float %236, float %261)
  %263 = fadd float %258, %262
  %264 = fsub float %263, %258
  %265 = fsub float %262, %264
  %266 = fmul float %244, %248
  %267 = fneg float %266
  %268 = tail call float @llvm.fma.f32(float %244, float %248, float %267)
  %269 = tail call float @llvm.fma.f32(float %246, float %248, float %268)
  %270 = fadd float %266, %269
  %271 = fsub float %270, %266
  %272 = fsub float %269, %271
  %273 = fadd float %270, 0x3FE5555540000000
  %274 = fadd float %273, 0xBFE5555540000000
  %275 = fsub float %270, %274
  %276 = fadd float %272, 0x3E2E720200000000
  %277 = fadd float %276, %275
  %278 = fadd float %273, %277
  %279 = fsub float %278, %273
  %280 = fsub float %277, %279
  %281 = fmul float %263, %278
  %282 = fneg float %281
  %283 = tail call float @llvm.fma.f32(float %263, float %278, float %282)
  %284 = tail call float @llvm.fma.f32(float %263, float %280, float %283)
  %285 = tail call float @llvm.fma.f32(float %265, float %278, float %284)
  %286 = tail call float @llvm.amdgcn.ldexp.f32(float %238, i32 1)
  %287 = fadd float %281, %285
  %288 = fsub float %287, %281
  %289 = fsub float %285, %288
  %290 = fadd float %257, %287
  %291 = fsub float %290, %257
  %292 = fsub float %287, %291
  %293 = fadd float %286, %289
  %294 = fadd float %293, %292
  %295 = fadd float %290, %294
  %296 = fsub float %295, %290
  %297 = fsub float %294, %296
  %298 = fadd float %254, %295
  %299 = fsub float %298, %254
  %300 = fsub float %298, %299
  %301 = fsub float %254, %300
  %302 = fsub float %295, %299
  %303 = fadd float %302, %301
  %304 = fadd float %256, %297
  %305 = fsub float %304, %256
  %306 = fsub float %304, %305
  %307 = fsub float %256, %306
  %308 = fsub float %297, %305
  %309 = fadd float %308, %307
  %310 = fadd float %304, %303
  %311 = fadd float %298, %310
  %312 = fsub float %311, %298
  %313 = fsub float %310, %312
  %314 = fadd float %309, %313
  %315 = fadd float %311, %314
  %316 = fsub float %315, %311
  %317 = fsub float %314, %316
  %318 = fmul float %315, -1.500000e+00
  %319 = fneg float %318
  %320 = tail call float @llvm.fma.f32(float %315, float -1.500000e+00, float %319)
  %321 = tail call float @llvm.fma.f32(float %317, float -1.500000e+00, float %320)
  %322 = fadd float %318, %321
  %323 = fsub float %322, %318
  %324 = fsub float %321, %323
  %325 = tail call float @llvm.fabs.f32(float %318) #4
  %326 = fcmp oeq float %325, 0x7FF0000000000000
  %327 = select i1 %326, float %318, float %322
  %328 = tail call float @llvm.fabs.f32(float %327) #4
  %329 = fcmp oeq float %328, 0x7FF0000000000000
  %330 = select i1 %329, float 0.000000e+00, float %324
  %331 = fcmp oeq float %327, 0x40562E4300000000
  %332 = select i1 %331, float 0x3EE0000000000000, float 0.000000e+00
  %333 = fsub float %327, %332
  %334 = fadd float %332, %330
  %335 = fmul float %333, 0x3FF7154760000000
  %336 = tail call float @llvm.rint.f32(float %335)
  %337 = fcmp ogt float %333, 0x40562E4300000000
  %338 = fcmp olt float %333, 0xC059D1DA00000000
  %339 = fneg float %335
  %340 = tail call float @llvm.fma.f32(float %333, float 0x3FF7154760000000, float %339)
  %341 = tail call float @llvm.fma.f32(float %333, float 0x3E54AE0BE0000000, float %340)
  %342 = fsub float %335, %336
  %343 = fadd float %341, %342
  %344 = tail call float @llvm.exp2.f32(float %343)
  %345 = fptosi float %336 to i32
  %346 = tail call float @llvm.amdgcn.ldexp.f32(float %344, i32 %345)
  %347 = select i1 %338, float 0.000000e+00, float %346
  %348 = select i1 %337, float 0x7FF0000000000000, float %347
  %349 = tail call float @llvm.fma.f32(float %348, float %334, float %348)
  %350 = tail call float @llvm.fabs.f32(float %348) #4
  %351 = fcmp oeq float %350, 0x7FF0000000000000
  %352 = select i1 %351, float %348, float %349
  %353 = fcmp uge float %209, 0.000000e+00
  %354 = tail call float @llvm.fabs.f32(float %352)
  %355 = fcmp oeq float %210, 0x7FF0000000000000
  %356 = fcmp oeq float %209, 0.000000e+00
  %357 = fcmp uno float %209, 0.000000e+00
  %358 = fcmp oeq float %209, 1.000000e+00
  %359 = fmul contract float %354, -5.000000e-01
  %360 = select i1 %353, float %359, float 0x7FF8000000000000
  %361 = select i1 %355, float -0.000000e+00, float %360
  %362 = select i1 %356, float 0xFFF0000000000000, float %361
  %363 = select i1 %357, float 0x7FF8000000000000, float %362
  %364 = select i1 %358, float -5.000000e-01, float %363
  %365 = load float, float addrspace(1)* %137, align 4, !tbaa !5
  %366 = fmul contract float %365, %364
  store float %366, float addrspace(1)* %137, align 4, !tbaa !5
  br label %367

367:                                              ; preds = %206, %133
  ret void
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
declare i32 @llvm.amdgcn.workgroup.id.x() #3

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
