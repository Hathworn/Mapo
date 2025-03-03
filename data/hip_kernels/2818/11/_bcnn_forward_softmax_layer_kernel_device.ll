; ModuleID = '../data/hip_kernels/2818/11/main.cu'
source_filename = "../data/hip_kernels/2818/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34_bcnn_forward_softmax_layer_kerneliiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %1
  br i1 %25, label %26, label %358

26:                                               ; preds = %4
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %28, label %54

28:                                               ; preds = %26
  %29 = mul nsw i32 %24, %0
  %30 = and i32 %0, 7
  %31 = icmp ult i32 %0, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %28
  %33 = and i32 %0, -8
  br label %62

34:                                               ; preds = %62, %28
  %35 = phi float [ undef, %28 ], [ %136, %62 ]
  %36 = phi i32 [ 0, %28 ], [ %137, %62 ]
  %37 = phi float [ 0xFFF0000000000000, %28 ], [ %136, %62 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %54, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %51, %39 ], [ %36, %34 ]
  %41 = phi float [ %50, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %52, %39 ], [ 0, %34 ]
  %43 = add nsw i32 %40, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !14
  %47 = fptosi float %46 to i32
  %48 = sitofp i32 %47 to float
  %49 = fcmp contract olt float %41, %48
  %50 = select contract i1 %49, float %48, float %41
  %51 = add nuw nsw i32 %40, 1
  %52 = add i32 %42, 1
  %53 = icmp eq i32 %52, %30
  br i1 %53, label %54, label %39, !llvm.loop !20

54:                                               ; preds = %34, %39, %26
  %55 = phi float [ 0xFFF0000000000000, %26 ], [ %35, %34 ], [ %50, %39 ]
  br i1 %27, label %56, label %166

56:                                               ; preds = %54
  %57 = mul nsw i32 %24, %0
  %58 = and i32 %0, 1
  %59 = icmp eq i32 %0, 1
  br i1 %59, label %140, label %60

60:                                               ; preds = %56
  %61 = and i32 %0, -2
  br label %169

62:                                               ; preds = %62, %32
  %63 = phi i32 [ 0, %32 ], [ %137, %62 ]
  %64 = phi float [ 0xFFF0000000000000, %32 ], [ %136, %62 ]
  %65 = phi i32 [ 0, %32 ], [ %138, %62 ]
  %66 = add nsw i32 %63, %29
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !14
  %70 = fptosi float %69 to i32
  %71 = sitofp i32 %70 to float
  %72 = fcmp contract olt float %64, %71
  %73 = select contract i1 %72, float %71, float %64
  %74 = or i32 %63, 1
  %75 = add nsw i32 %74, %29
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !14
  %79 = fptosi float %78 to i32
  %80 = sitofp i32 %79 to float
  %81 = fcmp contract olt float %73, %80
  %82 = select contract i1 %81, float %80, float %73
  %83 = or i32 %63, 2
  %84 = add nsw i32 %83, %29
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !14
  %88 = fptosi float %87 to i32
  %89 = sitofp i32 %88 to float
  %90 = fcmp contract olt float %82, %89
  %91 = select contract i1 %90, float %89, float %82
  %92 = or i32 %63, 3
  %93 = add nsw i32 %92, %29
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !14
  %97 = fptosi float %96 to i32
  %98 = sitofp i32 %97 to float
  %99 = fcmp contract olt float %91, %98
  %100 = select contract i1 %99, float %98, float %91
  %101 = or i32 %63, 4
  %102 = add nsw i32 %101, %29
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !14
  %106 = fptosi float %105 to i32
  %107 = sitofp i32 %106 to float
  %108 = fcmp contract olt float %100, %107
  %109 = select contract i1 %108, float %107, float %100
  %110 = or i32 %63, 5
  %111 = add nsw i32 %110, %29
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !14
  %115 = fptosi float %114 to i32
  %116 = sitofp i32 %115 to float
  %117 = fcmp contract olt float %109, %116
  %118 = select contract i1 %117, float %116, float %109
  %119 = or i32 %63, 6
  %120 = add nsw i32 %119, %29
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !14
  %124 = fptosi float %123 to i32
  %125 = sitofp i32 %124 to float
  %126 = fcmp contract olt float %118, %125
  %127 = select contract i1 %126, float %125, float %118
  %128 = or i32 %63, 7
  %129 = add nsw i32 %128, %29
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !14
  %133 = fptosi float %132 to i32
  %134 = sitofp i32 %133 to float
  %135 = fcmp contract olt float %127, %134
  %136 = select contract i1 %135, float %134, float %127
  %137 = add nuw nsw i32 %63, 8
  %138 = add i32 %65, 8
  %139 = icmp eq i32 %138, %33
  br i1 %139, label %34, label %62, !llvm.loop !22

140:                                              ; preds = %169, %56
  %141 = phi float [ undef, %56 ], [ %213, %169 ]
  %142 = phi i32 [ 0, %56 ], [ %214, %169 ]
  %143 = phi float [ 0.000000e+00, %56 ], [ %213, %169 ]
  %144 = icmp eq i32 %58, 0
  br i1 %144, label %166, label %145

145:                                              ; preds = %140
  %146 = add nsw i32 %142, %57
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16, !amdgpu.noclobber !14
  %150 = fsub contract float %149, %55
  %151 = fmul float %150, 0x3FF7154760000000
  %152 = tail call float @llvm.rint.f32(float %151)
  %153 = fcmp ogt float %150, 0x40562E4300000000
  %154 = fcmp olt float %150, 0xC059D1DA00000000
  %155 = fneg float %151
  %156 = tail call float @llvm.fma.f32(float %150, float 0x3FF7154760000000, float %155)
  %157 = tail call float @llvm.fma.f32(float %150, float 0x3E54AE0BE0000000, float %156)
  %158 = fsub float %151, %152
  %159 = fadd float %157, %158
  %160 = tail call float @llvm.exp2.f32(float %159)
  %161 = fptosi float %152 to i32
  %162 = tail call float @llvm.amdgcn.ldexp.f32(float %160, i32 %161)
  %163 = select i1 %154, float 0.000000e+00, float %162
  %164 = select i1 %153, float 0x7FF0000000000000, float %163
  %165 = fadd contract float %143, %164
  br label %166

166:                                              ; preds = %145, %140, %54
  %167 = phi float [ 0.000000e+00, %54 ], [ %141, %140 ], [ %165, %145 ]
  %168 = fcmp contract une float %167, 0.000000e+00
  br i1 %168, label %217, label %231

169:                                              ; preds = %169, %60
  %170 = phi i32 [ 0, %60 ], [ %214, %169 ]
  %171 = phi float [ 0.000000e+00, %60 ], [ %213, %169 ]
  %172 = phi i32 [ 0, %60 ], [ %215, %169 ]
  %173 = add nsw i32 %170, %57
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %2, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !16, !amdgpu.noclobber !14
  %177 = fsub contract float %176, %55
  %178 = fmul float %177, 0x3FF7154760000000
  %179 = tail call float @llvm.rint.f32(float %178)
  %180 = fcmp ogt float %177, 0x40562E4300000000
  %181 = fcmp olt float %177, 0xC059D1DA00000000
  %182 = fneg float %178
  %183 = tail call float @llvm.fma.f32(float %177, float 0x3FF7154760000000, float %182)
  %184 = tail call float @llvm.fma.f32(float %177, float 0x3E54AE0BE0000000, float %183)
  %185 = fsub float %178, %179
  %186 = fadd float %184, %185
  %187 = tail call float @llvm.exp2.f32(float %186)
  %188 = fptosi float %179 to i32
  %189 = tail call float @llvm.amdgcn.ldexp.f32(float %187, i32 %188)
  %190 = select i1 %181, float 0.000000e+00, float %189
  %191 = select i1 %180, float 0x7FF0000000000000, float %190
  %192 = fadd contract float %171, %191
  %193 = or i32 %170, 1
  %194 = add nsw i32 %193, %57
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %2, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !16, !amdgpu.noclobber !14
  %198 = fsub contract float %197, %55
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = tail call float @llvm.rint.f32(float %199)
  %201 = fcmp ogt float %198, 0x40562E4300000000
  %202 = fcmp olt float %198, 0xC059D1DA00000000
  %203 = fneg float %199
  %204 = tail call float @llvm.fma.f32(float %198, float 0x3FF7154760000000, float %203)
  %205 = tail call float @llvm.fma.f32(float %198, float 0x3E54AE0BE0000000, float %204)
  %206 = fsub float %199, %200
  %207 = fadd float %205, %206
  %208 = tail call float @llvm.exp2.f32(float %207)
  %209 = fptosi float %200 to i32
  %210 = tail call float @llvm.amdgcn.ldexp.f32(float %208, i32 %209)
  %211 = select i1 %202, float 0.000000e+00, float %210
  %212 = select i1 %201, float 0x7FF0000000000000, float %211
  %213 = fadd contract float %192, %212
  %214 = add nuw nsw i32 %170, 2
  %215 = add i32 %172, 2
  %216 = icmp eq i32 %215, %61
  br i1 %216, label %140, label %169, !llvm.loop !24

217:                                              ; preds = %166
  %218 = tail call i1 @llvm.amdgcn.class.f32(float %167, i32 144)
  %219 = select i1 %218, float 0x41F0000000000000, float 1.000000e+00
  %220 = fmul float %167, %219
  %221 = tail call float @llvm.log2.f32(float %220)
  %222 = fmul float %221, 0x3FE62E42E0000000
  %223 = tail call i1 @llvm.amdgcn.class.f32(float %221, i32 519)
  %224 = fneg float %222
  %225 = tail call float @llvm.fma.f32(float %221, float 0x3FE62E42E0000000, float %224)
  %226 = tail call float @llvm.fma.f32(float %221, float 0x3E6EFA39E0000000, float %225)
  %227 = fadd float %222, %226
  %228 = select i1 %223, float %221, float %227
  %229 = select i1 %218, float 0x40362E4300000000, float 0.000000e+00
  %230 = fsub float %228, %229
  br label %231

231:                                              ; preds = %166, %217
  %232 = phi float [ %230, %217 ], [ -1.000000e+02, %166 ]
  %233 = fadd contract float %55, %232
  br i1 %27, label %234, label %358

234:                                              ; preds = %231
  %235 = mul nsw i32 %24, %0
  %236 = and i32 %0, 3
  %237 = icmp ult i32 %0, 4
  br i1 %237, label %329, label %238

238:                                              ; preds = %234
  %239 = and i32 %0, -4
  br label %240

240:                                              ; preds = %240, %238
  %241 = phi i32 [ 0, %238 ], [ %326, %240 ]
  %242 = phi i32 [ 0, %238 ], [ %327, %240 ]
  %243 = add nsw i32 %241, %235
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %2, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !16
  %247 = fsub contract float %246, %233
  %248 = fmul float %247, 0x3FF7154760000000
  %249 = tail call float @llvm.rint.f32(float %248)
  %250 = fcmp ogt float %247, 0x40562E4300000000
  %251 = fcmp olt float %247, 0xC059D1DA00000000
  %252 = fneg float %248
  %253 = tail call float @llvm.fma.f32(float %247, float 0x3FF7154760000000, float %252)
  %254 = tail call float @llvm.fma.f32(float %247, float 0x3E54AE0BE0000000, float %253)
  %255 = fsub float %248, %249
  %256 = fadd float %254, %255
  %257 = tail call float @llvm.exp2.f32(float %256)
  %258 = fptosi float %249 to i32
  %259 = tail call float @llvm.amdgcn.ldexp.f32(float %257, i32 %258)
  %260 = select i1 %251, float 0.000000e+00, float %259
  %261 = select i1 %250, float 0x7FF0000000000000, float %260
  %262 = getelementptr inbounds float, float addrspace(1)* %3, i64 %244
  store float %261, float addrspace(1)* %262, align 4, !tbaa !16
  %263 = or i32 %241, 1
  %264 = add nsw i32 %263, %235
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %2, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !16
  %268 = fsub contract float %267, %233
  %269 = fmul float %268, 0x3FF7154760000000
  %270 = tail call float @llvm.rint.f32(float %269)
  %271 = fcmp ogt float %268, 0x40562E4300000000
  %272 = fcmp olt float %268, 0xC059D1DA00000000
  %273 = fneg float %269
  %274 = tail call float @llvm.fma.f32(float %268, float 0x3FF7154760000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %268, float 0x3E54AE0BE0000000, float %274)
  %276 = fsub float %269, %270
  %277 = fadd float %275, %276
  %278 = tail call float @llvm.exp2.f32(float %277)
  %279 = fptosi float %270 to i32
  %280 = tail call float @llvm.amdgcn.ldexp.f32(float %278, i32 %279)
  %281 = select i1 %272, float 0.000000e+00, float %280
  %282 = select i1 %271, float 0x7FF0000000000000, float %281
  %283 = getelementptr inbounds float, float addrspace(1)* %3, i64 %265
  store float %282, float addrspace(1)* %283, align 4, !tbaa !16
  %284 = or i32 %241, 2
  %285 = add nsw i32 %284, %235
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %2, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !16
  %289 = fsub contract float %288, %233
  %290 = fmul float %289, 0x3FF7154760000000
  %291 = tail call float @llvm.rint.f32(float %290)
  %292 = fcmp ogt float %289, 0x40562E4300000000
  %293 = fcmp olt float %289, 0xC059D1DA00000000
  %294 = fneg float %290
  %295 = tail call float @llvm.fma.f32(float %289, float 0x3FF7154760000000, float %294)
  %296 = tail call float @llvm.fma.f32(float %289, float 0x3E54AE0BE0000000, float %295)
  %297 = fsub float %290, %291
  %298 = fadd float %296, %297
  %299 = tail call float @llvm.exp2.f32(float %298)
  %300 = fptosi float %291 to i32
  %301 = tail call float @llvm.amdgcn.ldexp.f32(float %299, i32 %300)
  %302 = select i1 %293, float 0.000000e+00, float %301
  %303 = select i1 %292, float 0x7FF0000000000000, float %302
  %304 = getelementptr inbounds float, float addrspace(1)* %3, i64 %286
  store float %303, float addrspace(1)* %304, align 4, !tbaa !16
  %305 = or i32 %241, 3
  %306 = add nsw i32 %305, %235
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds float, float addrspace(1)* %2, i64 %307
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !16
  %310 = fsub contract float %309, %233
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = tail call float @llvm.rint.f32(float %311)
  %313 = fcmp ogt float %310, 0x40562E4300000000
  %314 = fcmp olt float %310, 0xC059D1DA00000000
  %315 = fneg float %311
  %316 = tail call float @llvm.fma.f32(float %310, float 0x3FF7154760000000, float %315)
  %317 = tail call float @llvm.fma.f32(float %310, float 0x3E54AE0BE0000000, float %316)
  %318 = fsub float %311, %312
  %319 = fadd float %317, %318
  %320 = tail call float @llvm.exp2.f32(float %319)
  %321 = fptosi float %312 to i32
  %322 = tail call float @llvm.amdgcn.ldexp.f32(float %320, i32 %321)
  %323 = select i1 %314, float 0.000000e+00, float %322
  %324 = select i1 %313, float 0x7FF0000000000000, float %323
  %325 = getelementptr inbounds float, float addrspace(1)* %3, i64 %307
  store float %324, float addrspace(1)* %325, align 4, !tbaa !16
  %326 = add nuw nsw i32 %241, 4
  %327 = add i32 %242, 4
  %328 = icmp eq i32 %327, %239
  br i1 %328, label %329, label %240, !llvm.loop !25

329:                                              ; preds = %240, %234
  %330 = phi i32 [ 0, %234 ], [ %326, %240 ]
  %331 = icmp eq i32 %236, 0
  br i1 %331, label %358, label %332

332:                                              ; preds = %329, %332
  %333 = phi i32 [ %355, %332 ], [ %330, %329 ]
  %334 = phi i32 [ %356, %332 ], [ 0, %329 ]
  %335 = add nsw i32 %333, %235
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float addrspace(1)* %2, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !16
  %339 = fsub contract float %338, %233
  %340 = fmul float %339, 0x3FF7154760000000
  %341 = tail call float @llvm.rint.f32(float %340)
  %342 = fcmp ogt float %339, 0x40562E4300000000
  %343 = fcmp olt float %339, 0xC059D1DA00000000
  %344 = fneg float %340
  %345 = tail call float @llvm.fma.f32(float %339, float 0x3FF7154760000000, float %344)
  %346 = tail call float @llvm.fma.f32(float %339, float 0x3E54AE0BE0000000, float %345)
  %347 = fsub float %340, %341
  %348 = fadd float %346, %347
  %349 = tail call float @llvm.exp2.f32(float %348)
  %350 = fptosi float %341 to i32
  %351 = tail call float @llvm.amdgcn.ldexp.f32(float %349, i32 %350)
  %352 = select i1 %343, float 0.000000e+00, float %351
  %353 = select i1 %342, float 0x7FF0000000000000, float %352
  %354 = getelementptr inbounds float, float addrspace(1)* %3, i64 %336
  store float %353, float addrspace(1)* %354, align 4, !tbaa !16
  %355 = add nuw nsw i32 %333, 1
  %356 = add i32 %334, 1
  %357 = icmp eq i32 %356, %236
  br i1 %357, label %358, label %332, !llvm.loop !26

358:                                              ; preds = %329, %332, %231, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !21}
