; ModuleID = '../data/hip_kernels/9391/0/main.cu'
source_filename = "../data/hip_kernels/9391/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@loss_per_row = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z35matrix_softmax_cross_entropy_kerneliiPKfS0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %6, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %16, %17
  %20 = mul i32 %19, %11
  %21 = add i32 %20, %18
  %22 = icmp slt i32 %21, %0
  br i1 %22, label %23, label %337

23:                                               ; preds = %5
  %24 = mul nsw i32 %21, %1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %28 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = icmp sgt i32 %1, 1
  br i1 %29, label %30, label %53

30:                                               ; preds = %23
  %31 = add i32 %1, -1
  %32 = add i32 %1, -2
  %33 = and i32 %31, 7
  %34 = icmp ult i32 %32, 7
  br i1 %34, label %37, label %35

35:                                               ; preds = %30
  %36 = and i32 %31, -8
  br label %61

37:                                               ; preds = %61, %30
  %38 = phi float [ undef, %30 ], [ %103, %61 ]
  %39 = phi i32 [ 1, %30 ], [ %104, %61 ]
  %40 = phi float [ %28, %30 ], [ %103, %61 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %53, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %50, %42 ], [ %39, %37 ]
  %44 = phi float [ %49, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %51, %42 ], [ 0, %37 ]
  %46 = zext i32 %43 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %26, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = tail call float @llvm.maxnum.f32(float %44, float %48)
  %50 = add nuw nsw i32 %43, 1
  %51 = add i32 %45, 1
  %52 = icmp eq i32 %51, %33
  br i1 %52, label %53, label %42, !llvm.loop !11

53:                                               ; preds = %37, %42, %23
  %54 = phi float [ %28, %23 ], [ %38, %37 ], [ %49, %42 ]
  %55 = icmp sgt i32 %1, 0
  br i1 %55, label %56, label %138

56:                                               ; preds = %53
  %57 = and i32 %1, 3
  %58 = icmp ult i32 %1, 4
  br i1 %58, label %107, label %59

59:                                               ; preds = %56
  %60 = and i32 %1, -4
  br label %140

61:                                               ; preds = %61, %35
  %62 = phi i32 [ 1, %35 ], [ %104, %61 ]
  %63 = phi float [ %28, %35 ], [ %103, %61 ]
  %64 = phi i32 [ 0, %35 ], [ %105, %61 ]
  %65 = zext i32 %62 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %26, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = tail call float @llvm.maxnum.f32(float %63, float %67)
  %69 = add nuw nsw i32 %62, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %26, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = tail call float @llvm.maxnum.f32(float %68, float %72)
  %74 = add nuw nsw i32 %62, 2
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %26, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = tail call float @llvm.maxnum.f32(float %73, float %77)
  %79 = add nuw nsw i32 %62, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %26, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = tail call float @llvm.maxnum.f32(float %78, float %82)
  %84 = add nuw nsw i32 %62, 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %26, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = tail call float @llvm.maxnum.f32(float %83, float %87)
  %89 = add nuw nsw i32 %62, 5
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %26, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = tail call float @llvm.maxnum.f32(float %88, float %92)
  %94 = add nuw nsw i32 %62, 6
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %26, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = tail call float @llvm.maxnum.f32(float %93, float %97)
  %99 = add nuw nsw i32 %62, 7
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %26, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = tail call float @llvm.maxnum.f32(float %98, float %102)
  %104 = add nuw nsw i32 %62, 8
  %105 = add i32 %64, 8
  %106 = icmp eq i32 %105, %36
  br i1 %106, label %37, label %61, !llvm.loop !13

107:                                              ; preds = %140, %56
  %108 = phi float [ undef, %56 ], [ %222, %140 ]
  %109 = phi i32 [ 0, %56 ], [ %223, %140 ]
  %110 = phi float [ 0.000000e+00, %56 ], [ %222, %140 ]
  %111 = icmp eq i32 %57, 0
  br i1 %111, label %138, label %112

112:                                              ; preds = %107, %112
  %113 = phi i32 [ %135, %112 ], [ %109, %107 ]
  %114 = phi float [ %134, %112 ], [ %110, %107 ]
  %115 = phi i32 [ %136, %112 ], [ 0, %107 ]
  %116 = zext i32 %113 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %26, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fsub contract float %118, %54
  %120 = fmul float %119, 0x3FF7154760000000
  %121 = tail call float @llvm.rint.f32(float %120)
  %122 = fcmp ogt float %119, 0x40562E4300000000
  %123 = fcmp olt float %119, 0xC059D1DA00000000
  %124 = fneg float %120
  %125 = tail call float @llvm.fma.f32(float %119, float 0x3FF7154760000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %119, float 0x3E54AE0BE0000000, float %125)
  %127 = fsub float %120, %121
  %128 = fadd float %126, %127
  %129 = tail call float @llvm.exp2.f32(float %128)
  %130 = fptosi float %121 to i32
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %129, i32 %130)
  %132 = select i1 %123, float 0.000000e+00, float %131
  %133 = select i1 %122, float 0x7FF0000000000000, float %132
  %134 = fadd contract float %114, %133
  %135 = add nuw nsw i32 %113, 1
  %136 = add i32 %115, 1
  %137 = icmp eq i32 %136, %57
  br i1 %137, label %138, label %112, !llvm.loop !15

138:                                              ; preds = %107, %112, %53
  %139 = phi float [ 0.000000e+00, %53 ], [ %108, %107 ], [ %134, %112 ]
  br i1 %55, label %239, label %226

140:                                              ; preds = %140, %59
  %141 = phi i32 [ 0, %59 ], [ %223, %140 ]
  %142 = phi float [ 0.000000e+00, %59 ], [ %222, %140 ]
  %143 = phi i32 [ 0, %59 ], [ %224, %140 ]
  %144 = zext i32 %141 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %26, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = fsub contract float %146, %54
  %148 = fmul float %147, 0x3FF7154760000000
  %149 = tail call float @llvm.rint.f32(float %148)
  %150 = fcmp ogt float %147, 0x40562E4300000000
  %151 = fcmp olt float %147, 0xC059D1DA00000000
  %152 = fneg float %148
  %153 = tail call float @llvm.fma.f32(float %147, float 0x3FF7154760000000, float %152)
  %154 = tail call float @llvm.fma.f32(float %147, float 0x3E54AE0BE0000000, float %153)
  %155 = fsub float %148, %149
  %156 = fadd float %154, %155
  %157 = tail call float @llvm.exp2.f32(float %156)
  %158 = fptosi float %149 to i32
  %159 = tail call float @llvm.amdgcn.ldexp.f32(float %157, i32 %158)
  %160 = select i1 %151, float 0.000000e+00, float %159
  %161 = select i1 %150, float 0x7FF0000000000000, float %160
  %162 = fadd contract float %142, %161
  %163 = or i32 %141, 1
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %26, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = fsub contract float %166, %54
  %168 = fmul float %167, 0x3FF7154760000000
  %169 = tail call float @llvm.rint.f32(float %168)
  %170 = fcmp ogt float %167, 0x40562E4300000000
  %171 = fcmp olt float %167, 0xC059D1DA00000000
  %172 = fneg float %168
  %173 = tail call float @llvm.fma.f32(float %167, float 0x3FF7154760000000, float %172)
  %174 = tail call float @llvm.fma.f32(float %167, float 0x3E54AE0BE0000000, float %173)
  %175 = fsub float %168, %169
  %176 = fadd float %174, %175
  %177 = tail call float @llvm.exp2.f32(float %176)
  %178 = fptosi float %169 to i32
  %179 = tail call float @llvm.amdgcn.ldexp.f32(float %177, i32 %178)
  %180 = select i1 %171, float 0.000000e+00, float %179
  %181 = select i1 %170, float 0x7FF0000000000000, float %180
  %182 = fadd contract float %162, %181
  %183 = or i32 %141, 2
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %26, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !5
  %187 = fsub contract float %186, %54
  %188 = fmul float %187, 0x3FF7154760000000
  %189 = tail call float @llvm.rint.f32(float %188)
  %190 = fcmp ogt float %187, 0x40562E4300000000
  %191 = fcmp olt float %187, 0xC059D1DA00000000
  %192 = fneg float %188
  %193 = tail call float @llvm.fma.f32(float %187, float 0x3FF7154760000000, float %192)
  %194 = tail call float @llvm.fma.f32(float %187, float 0x3E54AE0BE0000000, float %193)
  %195 = fsub float %188, %189
  %196 = fadd float %194, %195
  %197 = tail call float @llvm.exp2.f32(float %196)
  %198 = fptosi float %189 to i32
  %199 = tail call float @llvm.amdgcn.ldexp.f32(float %197, i32 %198)
  %200 = select i1 %191, float 0.000000e+00, float %199
  %201 = select i1 %190, float 0x7FF0000000000000, float %200
  %202 = fadd contract float %182, %201
  %203 = or i32 %141, 3
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %26, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !5
  %207 = fsub contract float %206, %54
  %208 = fmul float %207, 0x3FF7154760000000
  %209 = tail call float @llvm.rint.f32(float %208)
  %210 = fcmp ogt float %207, 0x40562E4300000000
  %211 = fcmp olt float %207, 0xC059D1DA00000000
  %212 = fneg float %208
  %213 = tail call float @llvm.fma.f32(float %207, float 0x3FF7154760000000, float %212)
  %214 = tail call float @llvm.fma.f32(float %207, float 0x3E54AE0BE0000000, float %213)
  %215 = fsub float %208, %209
  %216 = fadd float %214, %215
  %217 = tail call float @llvm.exp2.f32(float %216)
  %218 = fptosi float %209 to i32
  %219 = tail call float @llvm.amdgcn.ldexp.f32(float %217, i32 %218)
  %220 = select i1 %211, float 0.000000e+00, float %219
  %221 = select i1 %210, float 0x7FF0000000000000, float %220
  %222 = fadd contract float %202, %221
  %223 = add nuw nsw i32 %141, 4
  %224 = add i32 %143, 4
  %225 = icmp eq i32 %224, %60
  br i1 %225, label %107, label %140, !llvm.loop !16

226:                                              ; preds = %239, %138
  %227 = phi float [ 0.000000e+00, %138 ], [ %277, %239 ]
  %228 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %21
  store float %227, float addrspace(3)* %228, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %229 = icmp eq i32 %18, 0
  %230 = icmp eq i32 %17, 0
  %231 = select i1 %229, i1 %230, i1 false
  br i1 %231, label %232, label %337

232:                                              ; preds = %226
  %233 = icmp sgt i32 %0, 0
  br i1 %233, label %234, label %295

234:                                              ; preds = %232
  %235 = and i32 %0, 7
  %236 = icmp ult i32 %0, 8
  br i1 %236, label %280, label %237

237:                                              ; preds = %234
  %238 = and i32 %0, -8
  br label %299

239:                                              ; preds = %138, %239
  %240 = phi i32 [ %278, %239 ], [ 0, %138 ]
  %241 = phi float [ %277, %239 ], [ 0.000000e+00, %138 ]
  %242 = zext i32 %240 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %27, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7, !amdgpu.noclobber !5
  %245 = getelementptr inbounds float, float addrspace(1)* %26, i64 %242
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7, !amdgpu.noclobber !5
  %247 = fsub contract float %246, %54
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
  %262 = fdiv contract float %261, %139
  %263 = tail call i1 @llvm.amdgcn.class.f32(float %262, i32 144)
  %264 = select i1 %263, float 0x41F0000000000000, float 1.000000e+00
  %265 = fmul float %262, %264
  %266 = tail call float @llvm.log2.f32(float %265)
  %267 = fmul float %266, 0x3FE62E42E0000000
  %268 = tail call i1 @llvm.amdgcn.class.f32(float %266, i32 519)
  %269 = fneg float %267
  %270 = tail call float @llvm.fma.f32(float %266, float 0x3FE62E42E0000000, float %269)
  %271 = tail call float @llvm.fma.f32(float %266, float 0x3E6EFA39E0000000, float %270)
  %272 = fadd float %267, %271
  %273 = select i1 %268, float %266, float %272
  %274 = select i1 %263, float 0x40362E4300000000, float 0.000000e+00
  %275 = fsub float %273, %274
  %276 = fmul contract float %244, %275
  %277 = fsub contract float %241, %276
  %278 = add nuw nsw i32 %240, 1
  %279 = icmp eq i32 %278, %1
  br i1 %279, label %226, label %239, !llvm.loop !17

280:                                              ; preds = %299, %234
  %281 = phi float [ undef, %234 ], [ %333, %299 ]
  %282 = phi i32 [ 0, %234 ], [ %334, %299 ]
  %283 = phi float [ 0.000000e+00, %234 ], [ %333, %299 ]
  %284 = icmp eq i32 %235, 0
  br i1 %284, label %295, label %285

285:                                              ; preds = %280, %285
  %286 = phi i32 [ %292, %285 ], [ %282, %280 ]
  %287 = phi float [ %291, %285 ], [ %283, %280 ]
  %288 = phi i32 [ %293, %285 ], [ 0, %280 ]
  %289 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %286
  %290 = load float, float addrspace(3)* %289, align 4, !tbaa !7
  %291 = fadd contract float %287, %290
  %292 = add nuw nsw i32 %286, 1
  %293 = add i32 %288, 1
  %294 = icmp eq i32 %293, %235
  br i1 %294, label %295, label %285, !llvm.loop !18

295:                                              ; preds = %280, %285, %232
  %296 = phi float [ 0.000000e+00, %232 ], [ %281, %280 ], [ %291, %285 ]
  %297 = sitofp i32 %0 to float
  %298 = fdiv contract float %296, %297
  store float %298, float addrspace(1)* %4, align 4, !tbaa !7
  br label %337

299:                                              ; preds = %299, %237
  %300 = phi i32 [ 0, %237 ], [ %334, %299 ]
  %301 = phi float [ 0.000000e+00, %237 ], [ %333, %299 ]
  %302 = phi i32 [ 0, %237 ], [ %335, %299 ]
  %303 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %300
  %304 = load float, float addrspace(3)* %303, align 4, !tbaa !7
  %305 = fadd contract float %301, %304
  %306 = or i32 %300, 1
  %307 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %306
  %308 = load float, float addrspace(3)* %307, align 4, !tbaa !7
  %309 = fadd contract float %305, %308
  %310 = or i32 %300, 2
  %311 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %310
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !7
  %313 = fadd contract float %309, %312
  %314 = or i32 %300, 3
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !7
  %317 = fadd contract float %313, %316
  %318 = or i32 %300, 4
  %319 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %318
  %320 = load float, float addrspace(3)* %319, align 4, !tbaa !7
  %321 = fadd contract float %317, %320
  %322 = or i32 %300, 5
  %323 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %322
  %324 = load float, float addrspace(3)* %323, align 4, !tbaa !7
  %325 = fadd contract float %321, %324
  %326 = or i32 %300, 6
  %327 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %326
  %328 = load float, float addrspace(3)* %327, align 4, !tbaa !7
  %329 = fadd contract float %325, %328
  %330 = or i32 %300, 7
  %331 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @loss_per_row, i32 0, i32 %330
  %332 = load float, float addrspace(3)* %331, align 4, !tbaa !7
  %333 = fadd contract float %329, %332
  %334 = add nuw nsw i32 %300, 8
  %335 = add i32 %302, 8
  %336 = icmp eq i32 %335, %238
  br i1 %336, label %280, label %299, !llvm.loop !19

337:                                              ; preds = %226, %295, %5
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
