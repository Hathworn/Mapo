; ModuleID = '../data/hip_kernels/14434/1/main.cu'
source_filename = "../data/hip_kernels/14434/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@buffer = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15cuda_neural_netPfiiiiiifS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %5
  %13 = mul nsw i32 %3, %2
  %14 = add nsw i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %15
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %18, label %48

18:                                               ; preds = %10
  %19 = mul i32 %11, %3
  %20 = mul i32 %15, %3
  %21 = add i32 %12, %20
  %22 = and i32 %3, 7
  %23 = icmp ult i32 %3, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %18
  %25 = and i32 %3, -8
  br label %77

26:                                               ; preds = %77, %18
  %27 = phi float [ undef, %18 ], [ %167, %77 ]
  %28 = phi float [ 0.000000e+00, %18 ], [ %167, %77 ]
  %29 = phi i32 [ 0, %18 ], [ %168, %77 ]
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %48, label %31

31:                                               ; preds = %26, %31
  %32 = phi float [ %44, %31 ], [ %28, %26 ]
  %33 = phi i32 [ %45, %31 ], [ %29, %26 ]
  %34 = phi i32 [ %46, %31 ], [ 0, %26 ]
  %35 = add i32 %33, %19
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %8, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add i32 %21, %33
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fmul contract float %38, %42
  %44 = fadd contract float %32, %43
  %45 = add nuw nsw i32 %33, 1
  %46 = add i32 %34, 1
  %47 = icmp eq i32 %46, %22
  br i1 %47, label %48, label %31, !llvm.loop !10

48:                                               ; preds = %26, %31, %10
  %49 = phi float [ 0.000000e+00, %10 ], [ %27, %26 ], [ %44, %31 ]
  %50 = fneg contract float %49
  %51 = fdiv contract float %50, %7
  %52 = fmul float %51, 0x3FF7154760000000
  %53 = tail call float @llvm.rint.f32(float %52)
  %54 = fcmp ogt float %51, 0x40562E4300000000
  %55 = fcmp olt float %51, 0xC059D1DA00000000
  %56 = fneg float %52
  %57 = tail call float @llvm.fma.f32(float %51, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %51, float 0x3E54AE0BE0000000, float %57)
  %59 = fsub float %52, %53
  %60 = fadd float %58, %59
  %61 = tail call float @llvm.exp2.f32(float %60)
  %62 = fptosi float %53 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = select i1 %55, float 0.000000e+00, float %63
  %65 = select i1 %54, float 0x7FF0000000000000, float %64
  %66 = fpext float %65 to double
  %67 = fadd contract double %66, 1.000000e+00
  %68 = fdiv contract double 1.000000e+00, %67
  %69 = fptrunc double %68 to float
  store float %69, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp sgt i32 %6, 0
  br i1 %70, label %71, label %178

71:                                               ; preds = %48
  %72 = icmp sgt i32 %2, 0
  %73 = and i32 %2, 7
  %74 = icmp ult i32 %2, 8
  %75 = and i32 %2, -8
  %76 = icmp eq i32 %73, 0
  br label %171

77:                                               ; preds = %77, %24
  %78 = phi float [ 0.000000e+00, %24 ], [ %167, %77 ]
  %79 = phi i32 [ 0, %24 ], [ %168, %77 ]
  %80 = phi i32 [ 0, %24 ], [ %169, %77 ]
  %81 = add i32 %79, %19
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %8, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = add i32 %21, %79
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fmul contract float %84, %88
  %90 = fadd contract float %78, %89
  %91 = or i32 %79, 1
  %92 = add i32 %91, %19
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = add i32 %21, %91
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = fmul contract float %95, %99
  %101 = fadd contract float %90, %100
  %102 = or i32 %79, 2
  %103 = add i32 %102, %19
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %8, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = add i32 %21, %102
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fmul contract float %106, %110
  %112 = fadd contract float %101, %111
  %113 = or i32 %79, 3
  %114 = add i32 %113, %19
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %8, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = add i32 %21, %113
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %112, %122
  %124 = or i32 %79, 4
  %125 = add i32 %124, %19
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %8, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  %129 = add i32 %21, %124
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %123, %133
  %135 = or i32 %79, 5
  %136 = add i32 %135, %19
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %8, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = add i32 %21, %135
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = fmul contract float %139, %143
  %145 = fadd contract float %134, %144
  %146 = or i32 %79, 6
  %147 = add i32 %146, %19
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %8, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5, !amdgpu.noclobber !9
  %151 = add i32 %21, %146
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !5, !amdgpu.noclobber !9
  %155 = fmul contract float %150, %154
  %156 = fadd contract float %145, %155
  %157 = or i32 %79, 7
  %158 = add i32 %157, %19
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %8, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  %162 = add i32 %21, %157
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5, !amdgpu.noclobber !9
  %166 = fmul contract float %161, %165
  %167 = fadd contract float %156, %166
  %168 = add nuw nsw i32 %79, 8
  %169 = add i32 %80, 8
  %170 = icmp eq i32 %169, %25
  br i1 %170, label %26, label %77, !llvm.loop !12

171:                                              ; preds = %71, %210
  %172 = phi i32 [ 0, %71 ], [ %232, %210 ]
  br i1 %72, label %173, label %210

173:                                              ; preds = %171
  %174 = mul i32 %172, %2
  %175 = add i32 %174, %15
  %176 = mul i32 %175, %2
  %177 = add i32 %176, %14
  br i1 %74, label %191, label %234

178:                                              ; preds = %210, %48
  %179 = icmp ult i32 %15, %4
  br i1 %179, label %180, label %436

180:                                              ; preds = %178
  %181 = icmp sgt i32 %2, 0
  br i1 %181, label %182, label %332

182:                                              ; preds = %180
  %183 = mul i32 %6, %2
  %184 = add i32 %183, %15
  %185 = mul i32 %184, %2
  %186 = add i32 %185, %14
  %187 = and i32 %2, 7
  %188 = icmp ult i32 %2, 8
  br i1 %188, label %312, label %189

189:                                              ; preds = %182
  %190 = and i32 %2, -8
  br label %358

191:                                              ; preds = %234, %173
  %192 = phi float [ undef, %173 ], [ %308, %234 ]
  %193 = phi i32 [ 0, %173 ], [ %309, %234 ]
  %194 = phi float [ 0.000000e+00, %173 ], [ %308, %234 ]
  br i1 %76, label %210, label %195

195:                                              ; preds = %191, %195
  %196 = phi i32 [ %207, %195 ], [ %193, %191 ]
  %197 = phi float [ %206, %195 ], [ %194, %191 ]
  %198 = phi i32 [ %208, %195 ], [ 0, %191 ]
  %199 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %196
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = add i32 %177, %196
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %0, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !5, !amdgpu.noclobber !9
  %205 = fmul contract float %200, %204
  %206 = fadd contract float %197, %205
  %207 = add nuw nsw i32 %196, 1
  %208 = add i32 %198, 1
  %209 = icmp eq i32 %208, %73
  br i1 %209, label %210, label %195, !llvm.loop !14

210:                                              ; preds = %191, %195, %171
  %211 = phi float [ 0.000000e+00, %171 ], [ %192, %191 ], [ %206, %195 ]
  %212 = fneg contract float %211
  %213 = fdiv contract float %212, %7
  %214 = fmul float %213, 0x3FF7154760000000
  %215 = tail call float @llvm.rint.f32(float %214)
  %216 = fcmp ogt float %213, 0x40562E4300000000
  %217 = fcmp olt float %213, 0xC059D1DA00000000
  %218 = fneg float %214
  %219 = tail call float @llvm.fma.f32(float %213, float 0x3FF7154760000000, float %218)
  %220 = tail call float @llvm.fma.f32(float %213, float 0x3E54AE0BE0000000, float %219)
  %221 = fsub float %214, %215
  %222 = fadd float %220, %221
  %223 = tail call float @llvm.exp2.f32(float %222)
  %224 = fptosi float %215 to i32
  %225 = tail call float @llvm.amdgcn.ldexp.f32(float %223, i32 %224)
  %226 = select i1 %217, float 0.000000e+00, float %225
  %227 = select i1 %216, float 0x7FF0000000000000, float %226
  %228 = fpext float %227 to double
  %229 = fadd contract double %228, 1.000000e+00
  %230 = fdiv contract double 1.000000e+00, %229
  %231 = fptrunc double %230 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float %231, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %232 = add nuw nsw i32 %172, 1
  %233 = icmp eq i32 %232, %6
  br i1 %233, label %178, label %171, !llvm.loop !15

234:                                              ; preds = %173, %234
  %235 = phi i32 [ %309, %234 ], [ 0, %173 ]
  %236 = phi float [ %308, %234 ], [ 0.000000e+00, %173 ]
  %237 = phi i32 [ %310, %234 ], [ 0, %173 ]
  %238 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %235
  %239 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %240 = add i32 %177, %235
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 %241
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !5, !amdgpu.noclobber !9
  %244 = fmul contract float %239, %243
  %245 = fadd contract float %236, %244
  %246 = or i32 %235, 1
  %247 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %246
  %248 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %249 = add i32 %177, %246
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(1)* %0, i64 %250
  %252 = load float, float addrspace(1)* %251, align 4, !tbaa !5, !amdgpu.noclobber !9
  %253 = fmul contract float %248, %252
  %254 = fadd contract float %245, %253
  %255 = or i32 %235, 2
  %256 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %255
  %257 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %258 = add i32 %177, %255
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !5, !amdgpu.noclobber !9
  %262 = fmul contract float %257, %261
  %263 = fadd contract float %254, %262
  %264 = or i32 %235, 3
  %265 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %264
  %266 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %267 = add i32 %177, %264
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %0, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !5, !amdgpu.noclobber !9
  %271 = fmul contract float %266, %270
  %272 = fadd contract float %263, %271
  %273 = or i32 %235, 4
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %273
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %276 = add i32 %177, %273
  %277 = zext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !5, !amdgpu.noclobber !9
  %280 = fmul contract float %275, %279
  %281 = fadd contract float %272, %280
  %282 = or i32 %235, 5
  %283 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %282
  %284 = load float, float addrspace(3)* %283, align 4, !tbaa !5
  %285 = add i32 %177, %282
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %0, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !5, !amdgpu.noclobber !9
  %289 = fmul contract float %284, %288
  %290 = fadd contract float %281, %289
  %291 = or i32 %235, 6
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %291
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !5
  %294 = add i32 %177, %291
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %0, i64 %295
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !5, !amdgpu.noclobber !9
  %298 = fmul contract float %293, %297
  %299 = fadd contract float %290, %298
  %300 = or i32 %235, 7
  %301 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %300
  %302 = load float, float addrspace(3)* %301, align 4, !tbaa !5
  %303 = add i32 %177, %300
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %0, i64 %304
  %306 = load float, float addrspace(1)* %305, align 4, !tbaa !5, !amdgpu.noclobber !9
  %307 = fmul contract float %302, %306
  %308 = fadd contract float %299, %307
  %309 = add nuw nsw i32 %235, 8
  %310 = add i32 %237, 8
  %311 = icmp eq i32 %310, %75
  br i1 %311, label %191, label %234, !llvm.loop !16

312:                                              ; preds = %358, %182
  %313 = phi float [ undef, %182 ], [ %432, %358 ]
  %314 = phi i32 [ 0, %182 ], [ %433, %358 ]
  %315 = phi float [ 0.000000e+00, %182 ], [ %432, %358 ]
  %316 = icmp eq i32 %187, 0
  br i1 %316, label %332, label %317

317:                                              ; preds = %312, %317
  %318 = phi i32 [ %329, %317 ], [ %314, %312 ]
  %319 = phi float [ %328, %317 ], [ %315, %312 ]
  %320 = phi i32 [ %330, %317 ], [ 0, %312 ]
  %321 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %318
  %322 = load float, float addrspace(3)* %321, align 4, !tbaa !5
  %323 = add i32 %186, %318
  %324 = zext i32 %323 to i64
  %325 = getelementptr inbounds float, float addrspace(1)* %0, i64 %324
  %326 = load float, float addrspace(1)* %325, align 4, !tbaa !5, !amdgpu.noclobber !9
  %327 = fmul contract float %322, %326
  %328 = fadd contract float %319, %327
  %329 = add nuw nsw i32 %318, 1
  %330 = add i32 %320, 1
  %331 = icmp eq i32 %330, %187
  br i1 %331, label %332, label %317, !llvm.loop !17

332:                                              ; preds = %312, %317, %180
  %333 = phi float [ 0.000000e+00, %180 ], [ %313, %312 ], [ %328, %317 ]
  %334 = fneg contract float %333
  %335 = fdiv contract float %334, %7
  %336 = fmul float %335, 0x3FF7154760000000
  %337 = tail call float @llvm.rint.f32(float %336)
  %338 = fcmp ogt float %335, 0x40562E4300000000
  %339 = fcmp olt float %335, 0xC059D1DA00000000
  %340 = fneg float %336
  %341 = tail call float @llvm.fma.f32(float %335, float 0x3FF7154760000000, float %340)
  %342 = tail call float @llvm.fma.f32(float %335, float 0x3E54AE0BE0000000, float %341)
  %343 = fsub float %336, %337
  %344 = fadd float %342, %343
  %345 = tail call float @llvm.exp2.f32(float %344)
  %346 = fptosi float %337 to i32
  %347 = tail call float @llvm.amdgcn.ldexp.f32(float %345, i32 %346)
  %348 = select i1 %339, float 0.000000e+00, float %347
  %349 = select i1 %338, float 0x7FF0000000000000, float %348
  %350 = fpext float %349 to double
  %351 = fadd contract double %350, 1.000000e+00
  %352 = fdiv contract double 1.000000e+00, %351
  %353 = fptrunc double %352 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %354 = mul i32 %11, %4
  %355 = add i32 %354, %15
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %9, i64 %356
  store float %353, float addrspace(1)* %357, align 4, !tbaa !5
  br label %436

358:                                              ; preds = %358, %189
  %359 = phi i32 [ 0, %189 ], [ %433, %358 ]
  %360 = phi float [ 0.000000e+00, %189 ], [ %432, %358 ]
  %361 = phi i32 [ 0, %189 ], [ %434, %358 ]
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %359
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !5
  %364 = add i32 %186, %359
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(1)* %0, i64 %365
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !5, !amdgpu.noclobber !9
  %368 = fmul contract float %363, %367
  %369 = fadd contract float %360, %368
  %370 = or i32 %359, 1
  %371 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %370
  %372 = load float, float addrspace(3)* %371, align 4, !tbaa !5
  %373 = add i32 %186, %370
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds float, float addrspace(1)* %0, i64 %374
  %376 = load float, float addrspace(1)* %375, align 4, !tbaa !5, !amdgpu.noclobber !9
  %377 = fmul contract float %372, %376
  %378 = fadd contract float %369, %377
  %379 = or i32 %359, 2
  %380 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %379
  %381 = load float, float addrspace(3)* %380, align 4, !tbaa !5
  %382 = add i32 %186, %379
  %383 = zext i32 %382 to i64
  %384 = getelementptr inbounds float, float addrspace(1)* %0, i64 %383
  %385 = load float, float addrspace(1)* %384, align 4, !tbaa !5, !amdgpu.noclobber !9
  %386 = fmul contract float %381, %385
  %387 = fadd contract float %378, %386
  %388 = or i32 %359, 3
  %389 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %388
  %390 = load float, float addrspace(3)* %389, align 4, !tbaa !5
  %391 = add i32 %186, %388
  %392 = zext i32 %391 to i64
  %393 = getelementptr inbounds float, float addrspace(1)* %0, i64 %392
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !5, !amdgpu.noclobber !9
  %395 = fmul contract float %390, %394
  %396 = fadd contract float %387, %395
  %397 = or i32 %359, 4
  %398 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %397
  %399 = load float, float addrspace(3)* %398, align 4, !tbaa !5
  %400 = add i32 %186, %397
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, float addrspace(1)* %0, i64 %401
  %403 = load float, float addrspace(1)* %402, align 4, !tbaa !5, !amdgpu.noclobber !9
  %404 = fmul contract float %399, %403
  %405 = fadd contract float %396, %404
  %406 = or i32 %359, 5
  %407 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %406
  %408 = load float, float addrspace(3)* %407, align 4, !tbaa !5
  %409 = add i32 %186, %406
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds float, float addrspace(1)* %0, i64 %410
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !5, !amdgpu.noclobber !9
  %413 = fmul contract float %408, %412
  %414 = fadd contract float %405, %413
  %415 = or i32 %359, 6
  %416 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %415
  %417 = load float, float addrspace(3)* %416, align 4, !tbaa !5
  %418 = add i32 %186, %415
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, float addrspace(1)* %0, i64 %419
  %421 = load float, float addrspace(1)* %420, align 4, !tbaa !5, !amdgpu.noclobber !9
  %422 = fmul contract float %417, %421
  %423 = fadd contract float %414, %422
  %424 = or i32 %359, 7
  %425 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @buffer, i32 0, i32 %424
  %426 = load float, float addrspace(3)* %425, align 4, !tbaa !5
  %427 = add i32 %186, %424
  %428 = zext i32 %427 to i64
  %429 = getelementptr inbounds float, float addrspace(1)* %0, i64 %428
  %430 = load float, float addrspace(1)* %429, align 4, !tbaa !5, !amdgpu.noclobber !9
  %431 = fmul contract float %426, %430
  %432 = fadd contract float %423, %431
  %433 = add nuw nsw i32 %359, 8
  %434 = add i32 %361, 8
  %435 = icmp eq i32 %434, %190
  br i1 %435, label %312, label %358, !llvm.loop !18

436:                                              ; preds = %332, %178
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !13}
