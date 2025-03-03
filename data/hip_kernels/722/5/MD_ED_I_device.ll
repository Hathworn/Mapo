; ModuleID = '../data/hip_kernels/722/5/main.cu'
source_filename = "../data/hip_kernels/722/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sh_mem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@DTW_single_dim = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7MD_ED_IPfS_iiiS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %10, label %377

10:                                               ; preds = %8
  %11 = mul nsw i32 %4, %3
  %12 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %11
  %13 = icmp eq i32 %6, 0
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = mul i32 %14, %4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = add i32 %15, %16
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  br i1 %13, label %24, label %35

24:                                               ; preds = %10
  %25 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = mul nuw nsw i32 %28, %23
  %30 = mul i32 %29, %19
  %31 = add i32 %30, %17
  %32 = mul i32 %31, %3
  %33 = mul nsw i32 %4, %2
  %34 = icmp ult i32 %31, %33
  br i1 %34, label %42, label %650

35:                                               ; preds = %10
  %36 = mul i32 %19, %23
  %37 = mul i32 %16, %2
  %38 = add i32 %37, %14
  %39 = add i32 %38, %36
  %40 = add nsw i32 %17, %3
  %41 = icmp sgt i32 %40, %2
  br i1 %41, label %650, label %42

42:                                               ; preds = %35, %24
  %43 = phi i32 [ %32, %24 ], [ %39, %35 ]
  %44 = icmp eq i32 %17, 0
  br i1 %44, label %45, label %128

45:                                               ; preds = %42
  %46 = sext i32 %4 to i64
  %47 = icmp sgt i32 %4, 0
  br i1 %47, label %48, label %128

48:                                               ; preds = %45
  %49 = sext i32 %3 to i64
  %50 = icmp sgt i32 %3, 0
  %51 = and i64 %49, 7
  %52 = icmp ult i32 %3, 8
  %53 = and i64 %49, -8
  %54 = icmp eq i64 %51, 0
  br label %55

55:                                               ; preds = %48, %125
  %56 = phi i64 [ 0, %48 ], [ %126, %125 ]
  br i1 %50, label %57, label %125

57:                                               ; preds = %55
  %58 = mul nsw i64 %56, %49
  br i1 %52, label %112, label %59

59:                                               ; preds = %57, %59
  %60 = phi i64 [ %109, %59 ], [ 0, %57 ]
  %61 = phi i64 [ %110, %59 ], [ 0, %57 ]
  %62 = add nsw i64 %60, %58
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = trunc i64 %62 to i32
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %65
  store float %64, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = or i64 %60, 1
  %68 = add nsw i64 %67, %58
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = trunc i64 %68 to i32
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %71
  store float %70, float addrspace(3)* %72, align 4, !tbaa !7
  %73 = or i64 %60, 2
  %74 = add nsw i64 %73, %58
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = trunc i64 %74 to i32
  %78 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %77
  store float %76, float addrspace(3)* %78, align 4, !tbaa !7
  %79 = or i64 %60, 3
  %80 = add nsw i64 %79, %58
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = trunc i64 %80 to i32
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %83
  store float %82, float addrspace(3)* %84, align 4, !tbaa !7
  %85 = or i64 %60, 4
  %86 = add nsw i64 %85, %58
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = trunc i64 %86 to i32
  %90 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %89
  store float %88, float addrspace(3)* %90, align 4, !tbaa !7
  %91 = or i64 %60, 5
  %92 = add nsw i64 %91, %58
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !6
  %95 = trunc i64 %92 to i32
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %95
  store float %94, float addrspace(3)* %96, align 4, !tbaa !7
  %97 = or i64 %60, 6
  %98 = add nsw i64 %97, %58
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = trunc i64 %98 to i32
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %101
  store float %100, float addrspace(3)* %102, align 4, !tbaa !7
  %103 = or i64 %60, 7
  %104 = add nsw i64 %103, %58
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = trunc i64 %104 to i32
  %108 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %107
  store float %106, float addrspace(3)* %108, align 4, !tbaa !7
  %109 = add nuw nsw i64 %60, 8
  %110 = add i64 %61, 8
  %111 = icmp eq i64 %110, %53
  br i1 %111, label %112, label %59, !llvm.loop !11

112:                                              ; preds = %59, %57
  %113 = phi i64 [ 0, %57 ], [ %109, %59 ]
  br i1 %54, label %125, label %114

114:                                              ; preds = %112, %114
  %115 = phi i64 [ %122, %114 ], [ %113, %112 ]
  %116 = phi i64 [ %123, %114 ], [ 0, %112 ]
  %117 = add nsw i64 %115, %58
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !6
  %120 = trunc i64 %117 to i32
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %120
  store float %119, float addrspace(3)* %121, align 4, !tbaa !7
  %122 = add nuw nsw i64 %115, 1
  %123 = add i64 %116, 1
  %124 = icmp eq i64 %123, %51
  br i1 %124, label %125, label %114, !llvm.loop !13

125:                                              ; preds = %112, %114, %55
  %126 = add nuw nsw i64 %56, 1
  %127 = icmp eq i64 %126, %46
  br i1 %127, label %128, label %55, !llvm.loop !15

128:                                              ; preds = %125, %45, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = sext i32 %3 to i64
  %130 = icmp sgt i32 %3, 0
  br i1 %130, label %131, label %255

131:                                              ; preds = %128
  %132 = sext i32 %43 to i64
  %133 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %134 = mul i32 %133, %3
  %135 = and i64 %129, 7
  %136 = icmp ult i32 %3, 8
  br i1 %136, label %233, label %137

137:                                              ; preds = %131
  %138 = and i64 %129, -8
  br label %139

139:                                              ; preds = %139, %137
  %140 = phi i64 [ 0, %137 ], [ %230, %139 ]
  %141 = phi float [ 0.000000e+00, %137 ], [ %229, %139 ]
  %142 = phi i64 [ 0, %137 ], [ %231, %139 ]
  %143 = add nsw i64 %140, %132
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !6
  %146 = trunc i64 %140 to i32
  %147 = add i32 %134, %146
  %148 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !7
  %150 = fsub contract float %145, %149
  %151 = fmul contract float %150, %150
  %152 = fadd contract float %141, %151
  %153 = or i64 %140, 1
  %154 = add nsw i64 %153, %132
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = trunc i64 %153 to i32
  %158 = add i32 %134, %157
  %159 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !7
  %161 = fsub contract float %156, %160
  %162 = fmul contract float %161, %161
  %163 = fadd contract float %152, %162
  %164 = or i64 %140, 2
  %165 = add nsw i64 %164, %132
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !6
  %168 = trunc i64 %164 to i32
  %169 = add i32 %134, %168
  %170 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !7
  %172 = fsub contract float %167, %171
  %173 = fmul contract float %172, %172
  %174 = fadd contract float %163, %173
  %175 = or i64 %140, 3
  %176 = add nsw i64 %175, %132
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7, !amdgpu.noclobber !6
  %179 = trunc i64 %175 to i32
  %180 = add i32 %134, %179
  %181 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %180
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !7
  %183 = fsub contract float %178, %182
  %184 = fmul contract float %183, %183
  %185 = fadd contract float %174, %184
  %186 = or i64 %140, 4
  %187 = add nsw i64 %186, %132
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7, !amdgpu.noclobber !6
  %190 = trunc i64 %186 to i32
  %191 = add i32 %134, %190
  %192 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !7
  %194 = fsub contract float %189, %193
  %195 = fmul contract float %194, %194
  %196 = fadd contract float %185, %195
  %197 = or i64 %140, 5
  %198 = add nsw i64 %197, %132
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7, !amdgpu.noclobber !6
  %201 = trunc i64 %197 to i32
  %202 = add i32 %134, %201
  %203 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !7
  %205 = fsub contract float %200, %204
  %206 = fmul contract float %205, %205
  %207 = fadd contract float %196, %206
  %208 = or i64 %140, 6
  %209 = add nsw i64 %208, %132
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7, !amdgpu.noclobber !6
  %212 = trunc i64 %208 to i32
  %213 = add i32 %134, %212
  %214 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %213
  %215 = load float, float addrspace(3)* %214, align 4, !tbaa !7
  %216 = fsub contract float %211, %215
  %217 = fmul contract float %216, %216
  %218 = fadd contract float %207, %217
  %219 = or i64 %140, 7
  %220 = add nsw i64 %219, %132
  %221 = getelementptr inbounds float, float addrspace(1)* %0, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7, !amdgpu.noclobber !6
  %223 = trunc i64 %219 to i32
  %224 = add i32 %134, %223
  %225 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %224
  %226 = load float, float addrspace(3)* %225, align 4, !tbaa !7
  %227 = fsub contract float %222, %226
  %228 = fmul contract float %227, %227
  %229 = fadd contract float %218, %228
  %230 = add nuw nsw i64 %140, 8
  %231 = add i64 %142, 8
  %232 = icmp eq i64 %231, %138
  br i1 %232, label %233, label %139, !llvm.loop !16

233:                                              ; preds = %139, %131
  %234 = phi float [ undef, %131 ], [ %229, %139 ]
  %235 = phi i64 [ 0, %131 ], [ %230, %139 ]
  %236 = phi float [ 0.000000e+00, %131 ], [ %229, %139 ]
  %237 = icmp eq i64 %135, 0
  br i1 %237, label %255, label %238

238:                                              ; preds = %233, %238
  %239 = phi i64 [ %252, %238 ], [ %235, %233 ]
  %240 = phi float [ %251, %238 ], [ %236, %233 ]
  %241 = phi i64 [ %253, %238 ], [ 0, %233 ]
  %242 = add nsw i64 %239, %132
  %243 = getelementptr inbounds float, float addrspace(1)* %0, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7, !amdgpu.noclobber !6
  %245 = trunc i64 %239 to i32
  %246 = add i32 %134, %245
  %247 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_mem, i32 0, i32 %246
  %248 = load float, float addrspace(3)* %247, align 4, !tbaa !7
  %249 = fsub contract float %244, %248
  %250 = fmul contract float %249, %249
  %251 = fadd contract float %240, %250
  %252 = add nuw nsw i64 %239, 1
  %253 = add i64 %241, 1
  %254 = icmp eq i64 %253, %135
  br i1 %254, label %255, label %238, !llvm.loop !17

255:                                              ; preds = %233, %238, %128
  %256 = phi float [ 0.000000e+00, %128 ], [ %234, %233 ], [ %251, %238 ]
  %257 = fcmp olt float %256, 0x39F0000000000000
  %258 = select i1 %257, float 0x41F0000000000000, float 1.000000e+00
  %259 = fmul float %256, %258
  %260 = tail call float @llvm.sqrt.f32(float %259)
  %261 = bitcast float %260 to i32
  %262 = add nsw i32 %261, -1
  %263 = bitcast i32 %262 to float
  %264 = add nsw i32 %261, 1
  %265 = bitcast i32 %264 to float
  %266 = tail call i1 @llvm.amdgcn.class.f32(float %259, i32 608)
  %267 = select i1 %257, float 0x3EF0000000000000, float 1.000000e+00
  %268 = fneg float %265
  %269 = tail call float @llvm.fma.f32(float %268, float %260, float %259)
  %270 = fcmp ogt float %269, 0.000000e+00
  %271 = fneg float %263
  %272 = tail call float @llvm.fma.f32(float %271, float %260, float %259)
  %273 = fcmp ole float %272, 0.000000e+00
  %274 = select i1 %273, float %263, float %260
  %275 = select i1 %270, float %265, float %274
  %276 = fmul float %267, %275
  %277 = select i1 %266, float %259, float %276
  %278 = getelementptr inbounds float, float addrspace(3)* %12, i32 %17
  store float %277, float addrspace(3)* %278, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %44, label %279, label %650

279:                                              ; preds = %255
  %280 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %281 = getelementptr i8, i8 addrspace(4)* %280, i64 4
  %282 = bitcast i8 addrspace(4)* %281 to i16 addrspace(4)*
  %283 = load i16, i16 addrspace(4)* %282, align 4, !range !5, !invariant.load !6
  %284 = zext i16 %283 to i64
  %285 = zext i16 %283 to i32
  %286 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %287 = mul i32 %286, %285
  %288 = zext i32 %287 to i64
  %289 = getelementptr i8, i8 addrspace(4)* %280, i64 6
  %290 = bitcast i8 addrspace(4)* %289 to i16 addrspace(4)*
  %291 = load i16, i16 addrspace(4)* %290, align 2, !range !5, !invariant.load !6
  %292 = zext i16 %291 to i64
  %293 = zext i32 %4 to i64
  %294 = and i64 %292, 7
  %295 = icmp ult i16 %291, 8
  %296 = and i64 %292, 2040
  %297 = icmp eq i64 %294, 0
  br label %298

298:                                              ; preds = %279, %373
  %299 = phi i64 [ 0, %279 ], [ %375, %373 ]
  %300 = add nuw nsw i64 %299, %288
  %301 = getelementptr inbounds float, float addrspace(1)* %5, i64 %300
  %302 = mul nuw nsw i64 %299, %293
  br i1 %295, label %357, label %303

303:                                              ; preds = %298, %303
  %304 = phi i64 [ %354, %303 ], [ 0, %298 ]
  %305 = phi float [ %353, %303 ], [ 0.000000e+00, %298 ]
  %306 = phi i64 [ %355, %303 ], [ 0, %298 ]
  %307 = add nuw nsw i64 %304, %302
  %308 = trunc i64 %307 to i32
  %309 = getelementptr inbounds float, float addrspace(3)* %12, i32 %308
  %310 = load float, float addrspace(3)* %309, align 4, !tbaa !7
  %311 = fadd contract float %310, %305
  %312 = or i64 %304, 1
  %313 = add nuw nsw i64 %312, %302
  %314 = trunc i64 %313 to i32
  %315 = getelementptr inbounds float, float addrspace(3)* %12, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !7
  %317 = fadd contract float %316, %311
  %318 = or i64 %304, 2
  %319 = add nuw nsw i64 %318, %302
  %320 = trunc i64 %319 to i32
  %321 = getelementptr inbounds float, float addrspace(3)* %12, i32 %320
  %322 = load float, float addrspace(3)* %321, align 4, !tbaa !7
  %323 = fadd contract float %322, %317
  %324 = or i64 %304, 3
  %325 = add nuw nsw i64 %324, %302
  %326 = trunc i64 %325 to i32
  %327 = getelementptr inbounds float, float addrspace(3)* %12, i32 %326
  %328 = load float, float addrspace(3)* %327, align 4, !tbaa !7
  %329 = fadd contract float %328, %323
  %330 = or i64 %304, 4
  %331 = add nuw nsw i64 %330, %302
  %332 = trunc i64 %331 to i32
  %333 = getelementptr inbounds float, float addrspace(3)* %12, i32 %332
  %334 = load float, float addrspace(3)* %333, align 4, !tbaa !7
  %335 = fadd contract float %334, %329
  %336 = or i64 %304, 5
  %337 = add nuw nsw i64 %336, %302
  %338 = trunc i64 %337 to i32
  %339 = getelementptr inbounds float, float addrspace(3)* %12, i32 %338
  %340 = load float, float addrspace(3)* %339, align 4, !tbaa !7
  %341 = fadd contract float %340, %335
  %342 = or i64 %304, 6
  %343 = add nuw nsw i64 %342, %302
  %344 = trunc i64 %343 to i32
  %345 = getelementptr inbounds float, float addrspace(3)* %12, i32 %344
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !7
  %347 = fadd contract float %346, %341
  %348 = or i64 %304, 7
  %349 = add nuw nsw i64 %348, %302
  %350 = trunc i64 %349 to i32
  %351 = getelementptr inbounds float, float addrspace(3)* %12, i32 %350
  %352 = load float, float addrspace(3)* %351, align 4, !tbaa !7
  %353 = fadd contract float %352, %347
  %354 = add nuw nsw i64 %304, 8
  %355 = add i64 %306, 8
  %356 = icmp eq i64 %355, %296
  br i1 %356, label %357, label %303, !llvm.loop !18

357:                                              ; preds = %303, %298
  %358 = phi float [ undef, %298 ], [ %353, %303 ]
  %359 = phi i64 [ 0, %298 ], [ %354, %303 ]
  %360 = phi float [ 0.000000e+00, %298 ], [ %353, %303 ]
  br i1 %297, label %373, label %361

361:                                              ; preds = %357, %361
  %362 = phi i64 [ %370, %361 ], [ %359, %357 ]
  %363 = phi float [ %369, %361 ], [ %360, %357 ]
  %364 = phi i64 [ %371, %361 ], [ 0, %357 ]
  %365 = add nuw nsw i64 %362, %302
  %366 = trunc i64 %365 to i32
  %367 = getelementptr inbounds float, float addrspace(3)* %12, i32 %366
  %368 = load float, float addrspace(3)* %367, align 4, !tbaa !7
  %369 = fadd contract float %368, %363
  %370 = add nuw nsw i64 %362, 1
  %371 = add i64 %364, 1
  %372 = icmp eq i64 %371, %294
  br i1 %372, label %373, label %361, !llvm.loop !19

373:                                              ; preds = %361, %357
  %374 = phi float [ %358, %357 ], [ %369, %361 ]
  store float %374, float addrspace(1)* %301, align 4, !tbaa !7
  %375 = add nuw nsw i64 %299, 1
  %376 = icmp eq i64 %375, %284
  br i1 %376, label %650, label %298, !llvm.loop !20

377:                                              ; preds = %8
  %378 = icmp eq i32 %6, 0
  %379 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %380 = mul i32 %379, %4
  %381 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %382 = add i32 %380, %381
  %383 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %384 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %385 = getelementptr i8, i8 addrspace(4)* %383, i64 4
  %386 = bitcast i8 addrspace(4)* %385 to i16 addrspace(4)*
  %387 = load i16, i16 addrspace(4)* %386, align 4, !range !5, !invariant.load !6
  %388 = zext i16 %387 to i32
  br i1 %378, label %389, label %400

389:                                              ; preds = %377
  %390 = getelementptr i8, i8 addrspace(4)* %383, i64 6
  %391 = bitcast i8 addrspace(4)* %390 to i16 addrspace(4)*
  %392 = load i16, i16 addrspace(4)* %391, align 2, !range !5, !invariant.load !6
  %393 = zext i16 %392 to i32
  %394 = mul nuw nsw i32 %393, %388
  %395 = mul i32 %394, %384
  %396 = add i32 %395, %382
  %397 = mul i32 %396, %3
  %398 = mul nsw i32 %4, %2
  %399 = icmp ult i32 %396, %398
  br i1 %399, label %407, label %650

400:                                              ; preds = %377
  %401 = mul i32 %384, %388
  %402 = mul i32 %381, %2
  %403 = add i32 %402, %379
  %404 = add i32 %403, %401
  %405 = add nsw i32 %382, %3
  %406 = icmp sgt i32 %405, %2
  br i1 %406, label %650, label %407

407:                                              ; preds = %400, %389
  %408 = phi i32 [ %397, %389 ], [ %404, %400 ]
  %409 = sext i32 %3 to i64
  %410 = icmp sgt i32 %3, 0
  br i1 %410, label %411, label %527

411:                                              ; preds = %407
  %412 = sext i32 %408 to i64
  %413 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %414 = mul i32 %413, %3
  %415 = zext i32 %414 to i64
  %416 = and i64 %409, 7
  %417 = icmp ult i32 %3, 8
  br i1 %417, label %506, label %418

418:                                              ; preds = %411
  %419 = and i64 %409, -8
  br label %420

420:                                              ; preds = %420, %418
  %421 = phi i64 [ 0, %418 ], [ %503, %420 ]
  %422 = phi float [ 0.000000e+00, %418 ], [ %502, %420 ]
  %423 = phi i64 [ 0, %418 ], [ %504, %420 ]
  %424 = add nsw i64 %421, %412
  %425 = getelementptr inbounds float, float addrspace(1)* %0, i64 %424
  %426 = load float, float addrspace(1)* %425, align 4, !tbaa !7, !amdgpu.noclobber !6
  %427 = add nuw nsw i64 %421, %415
  %428 = getelementptr inbounds float, float addrspace(1)* %1, i64 %427
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !7, !amdgpu.noclobber !6
  %430 = fsub contract float %426, %429
  %431 = fmul contract float %430, %430
  %432 = fadd contract float %422, %431
  %433 = or i64 %421, 1
  %434 = add nsw i64 %433, %412
  %435 = getelementptr inbounds float, float addrspace(1)* %0, i64 %434
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !7, !amdgpu.noclobber !6
  %437 = add nuw nsw i64 %433, %415
  %438 = getelementptr inbounds float, float addrspace(1)* %1, i64 %437
  %439 = load float, float addrspace(1)* %438, align 4, !tbaa !7, !amdgpu.noclobber !6
  %440 = fsub contract float %436, %439
  %441 = fmul contract float %440, %440
  %442 = fadd contract float %432, %441
  %443 = or i64 %421, 2
  %444 = add nsw i64 %443, %412
  %445 = getelementptr inbounds float, float addrspace(1)* %0, i64 %444
  %446 = load float, float addrspace(1)* %445, align 4, !tbaa !7, !amdgpu.noclobber !6
  %447 = add nuw nsw i64 %443, %415
  %448 = getelementptr inbounds float, float addrspace(1)* %1, i64 %447
  %449 = load float, float addrspace(1)* %448, align 4, !tbaa !7, !amdgpu.noclobber !6
  %450 = fsub contract float %446, %449
  %451 = fmul contract float %450, %450
  %452 = fadd contract float %442, %451
  %453 = or i64 %421, 3
  %454 = add nsw i64 %453, %412
  %455 = getelementptr inbounds float, float addrspace(1)* %0, i64 %454
  %456 = load float, float addrspace(1)* %455, align 4, !tbaa !7, !amdgpu.noclobber !6
  %457 = add nuw nsw i64 %453, %415
  %458 = getelementptr inbounds float, float addrspace(1)* %1, i64 %457
  %459 = load float, float addrspace(1)* %458, align 4, !tbaa !7, !amdgpu.noclobber !6
  %460 = fsub contract float %456, %459
  %461 = fmul contract float %460, %460
  %462 = fadd contract float %452, %461
  %463 = or i64 %421, 4
  %464 = add nsw i64 %463, %412
  %465 = getelementptr inbounds float, float addrspace(1)* %0, i64 %464
  %466 = load float, float addrspace(1)* %465, align 4, !tbaa !7, !amdgpu.noclobber !6
  %467 = add nuw nsw i64 %463, %415
  %468 = getelementptr inbounds float, float addrspace(1)* %1, i64 %467
  %469 = load float, float addrspace(1)* %468, align 4, !tbaa !7, !amdgpu.noclobber !6
  %470 = fsub contract float %466, %469
  %471 = fmul contract float %470, %470
  %472 = fadd contract float %462, %471
  %473 = or i64 %421, 5
  %474 = add nsw i64 %473, %412
  %475 = getelementptr inbounds float, float addrspace(1)* %0, i64 %474
  %476 = load float, float addrspace(1)* %475, align 4, !tbaa !7, !amdgpu.noclobber !6
  %477 = add nuw nsw i64 %473, %415
  %478 = getelementptr inbounds float, float addrspace(1)* %1, i64 %477
  %479 = load float, float addrspace(1)* %478, align 4, !tbaa !7, !amdgpu.noclobber !6
  %480 = fsub contract float %476, %479
  %481 = fmul contract float %480, %480
  %482 = fadd contract float %472, %481
  %483 = or i64 %421, 6
  %484 = add nsw i64 %483, %412
  %485 = getelementptr inbounds float, float addrspace(1)* %0, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !7, !amdgpu.noclobber !6
  %487 = add nuw nsw i64 %483, %415
  %488 = getelementptr inbounds float, float addrspace(1)* %1, i64 %487
  %489 = load float, float addrspace(1)* %488, align 4, !tbaa !7, !amdgpu.noclobber !6
  %490 = fsub contract float %486, %489
  %491 = fmul contract float %490, %490
  %492 = fadd contract float %482, %491
  %493 = or i64 %421, 7
  %494 = add nsw i64 %493, %412
  %495 = getelementptr inbounds float, float addrspace(1)* %0, i64 %494
  %496 = load float, float addrspace(1)* %495, align 4, !tbaa !7, !amdgpu.noclobber !6
  %497 = add nuw nsw i64 %493, %415
  %498 = getelementptr inbounds float, float addrspace(1)* %1, i64 %497
  %499 = load float, float addrspace(1)* %498, align 4, !tbaa !7, !amdgpu.noclobber !6
  %500 = fsub contract float %496, %499
  %501 = fmul contract float %500, %500
  %502 = fadd contract float %492, %501
  %503 = add nuw nsw i64 %421, 8
  %504 = add i64 %423, 8
  %505 = icmp eq i64 %504, %419
  br i1 %505, label %506, label %420, !llvm.loop !21

506:                                              ; preds = %420, %411
  %507 = phi float [ undef, %411 ], [ %502, %420 ]
  %508 = phi i64 [ 0, %411 ], [ %503, %420 ]
  %509 = phi float [ 0.000000e+00, %411 ], [ %502, %420 ]
  %510 = icmp eq i64 %416, 0
  br i1 %510, label %527, label %511

511:                                              ; preds = %506, %511
  %512 = phi i64 [ %524, %511 ], [ %508, %506 ]
  %513 = phi float [ %523, %511 ], [ %509, %506 ]
  %514 = phi i64 [ %525, %511 ], [ 0, %506 ]
  %515 = add nsw i64 %512, %412
  %516 = getelementptr inbounds float, float addrspace(1)* %0, i64 %515
  %517 = load float, float addrspace(1)* %516, align 4, !tbaa !7, !amdgpu.noclobber !6
  %518 = add nuw nsw i64 %512, %415
  %519 = getelementptr inbounds float, float addrspace(1)* %1, i64 %518
  %520 = load float, float addrspace(1)* %519, align 4, !tbaa !7, !amdgpu.noclobber !6
  %521 = fsub contract float %517, %520
  %522 = fmul contract float %521, %521
  %523 = fadd contract float %513, %522
  %524 = add nuw nsw i64 %512, 1
  %525 = add i64 %514, 1
  %526 = icmp eq i64 %525, %416
  br i1 %526, label %527, label %511, !llvm.loop !22

527:                                              ; preds = %506, %511, %407
  %528 = phi float [ 0.000000e+00, %407 ], [ %507, %506 ], [ %523, %511 ]
  %529 = fcmp olt float %528, 0x39F0000000000000
  %530 = select i1 %529, float 0x41F0000000000000, float 1.000000e+00
  %531 = fmul float %528, %530
  %532 = tail call float @llvm.sqrt.f32(float %531)
  %533 = bitcast float %532 to i32
  %534 = add nsw i32 %533, -1
  %535 = bitcast i32 %534 to float
  %536 = add nsw i32 %533, 1
  %537 = bitcast i32 %536 to float
  %538 = tail call i1 @llvm.amdgcn.class.f32(float %531, i32 608)
  %539 = select i1 %529, float 0x3EF0000000000000, float 1.000000e+00
  %540 = fneg float %537
  %541 = tail call float @llvm.fma.f32(float %540, float %532, float %531)
  %542 = fcmp ogt float %541, 0.000000e+00
  %543 = fneg float %535
  %544 = tail call float @llvm.fma.f32(float %543, float %532, float %531)
  %545 = fcmp ole float %544, 0.000000e+00
  %546 = select i1 %545, float %535, float %532
  %547 = select i1 %542, float %537, float %546
  %548 = fmul float %539, %547
  %549 = select i1 %538, float %531, float %548
  %550 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %382
  store float %549, float addrspace(3)* %550, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %551 = icmp eq i32 %382, 0
  br i1 %551, label %552, label %650

552:                                              ; preds = %527
  %553 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %554 = getelementptr i8, i8 addrspace(4)* %553, i64 4
  %555 = bitcast i8 addrspace(4)* %554 to i16 addrspace(4)*
  %556 = load i16, i16 addrspace(4)* %555, align 4, !range !5, !invariant.load !6
  %557 = zext i16 %556 to i64
  %558 = zext i16 %556 to i32
  %559 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %560 = mul i32 %559, %558
  %561 = zext i32 %560 to i64
  %562 = getelementptr i8, i8 addrspace(4)* %553, i64 6
  %563 = bitcast i8 addrspace(4)* %562 to i16 addrspace(4)*
  %564 = load i16, i16 addrspace(4)* %563, align 2, !range !5, !invariant.load !6
  %565 = zext i16 %564 to i64
  %566 = zext i32 %4 to i64
  %567 = and i64 %565, 7
  %568 = icmp ult i16 %564, 8
  %569 = and i64 %565, 2040
  %570 = icmp eq i64 %567, 0
  br label %571

571:                                              ; preds = %552, %646
  %572 = phi i64 [ 0, %552 ], [ %648, %646 ]
  %573 = add nuw nsw i64 %572, %561
  %574 = getelementptr inbounds float, float addrspace(1)* %5, i64 %573
  %575 = mul nuw nsw i64 %572, %566
  br i1 %568, label %630, label %576

576:                                              ; preds = %571, %576
  %577 = phi i64 [ %627, %576 ], [ 0, %571 ]
  %578 = phi float [ %626, %576 ], [ 0.000000e+00, %571 ]
  %579 = phi i64 [ %628, %576 ], [ 0, %571 ]
  %580 = add nuw nsw i64 %577, %575
  %581 = trunc i64 %580 to i32
  %582 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %581
  %583 = load float, float addrspace(3)* %582, align 4, !tbaa !7
  %584 = fadd contract float %583, %578
  %585 = or i64 %577, 1
  %586 = add nuw nsw i64 %585, %575
  %587 = trunc i64 %586 to i32
  %588 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %587
  %589 = load float, float addrspace(3)* %588, align 4, !tbaa !7
  %590 = fadd contract float %589, %584
  %591 = or i64 %577, 2
  %592 = add nuw nsw i64 %591, %575
  %593 = trunc i64 %592 to i32
  %594 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %593
  %595 = load float, float addrspace(3)* %594, align 4, !tbaa !7
  %596 = fadd contract float %595, %590
  %597 = or i64 %577, 3
  %598 = add nuw nsw i64 %597, %575
  %599 = trunc i64 %598 to i32
  %600 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %599
  %601 = load float, float addrspace(3)* %600, align 4, !tbaa !7
  %602 = fadd contract float %601, %596
  %603 = or i64 %577, 4
  %604 = add nuw nsw i64 %603, %575
  %605 = trunc i64 %604 to i32
  %606 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %605
  %607 = load float, float addrspace(3)* %606, align 4, !tbaa !7
  %608 = fadd contract float %607, %602
  %609 = or i64 %577, 5
  %610 = add nuw nsw i64 %609, %575
  %611 = trunc i64 %610 to i32
  %612 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %611
  %613 = load float, float addrspace(3)* %612, align 4, !tbaa !7
  %614 = fadd contract float %613, %608
  %615 = or i64 %577, 6
  %616 = add nuw nsw i64 %615, %575
  %617 = trunc i64 %616 to i32
  %618 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %617
  %619 = load float, float addrspace(3)* %618, align 4, !tbaa !7
  %620 = fadd contract float %619, %614
  %621 = or i64 %577, 7
  %622 = add nuw nsw i64 %621, %575
  %623 = trunc i64 %622 to i32
  %624 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %623
  %625 = load float, float addrspace(3)* %624, align 4, !tbaa !7
  %626 = fadd contract float %625, %620
  %627 = add nuw nsw i64 %577, 8
  %628 = add i64 %579, 8
  %629 = icmp eq i64 %628, %569
  br i1 %629, label %630, label %576, !llvm.loop !23

630:                                              ; preds = %576, %571
  %631 = phi float [ undef, %571 ], [ %626, %576 ]
  %632 = phi i64 [ 0, %571 ], [ %627, %576 ]
  %633 = phi float [ 0.000000e+00, %571 ], [ %626, %576 ]
  br i1 %570, label %646, label %634

634:                                              ; preds = %630, %634
  %635 = phi i64 [ %643, %634 ], [ %632, %630 ]
  %636 = phi float [ %642, %634 ], [ %633, %630 ]
  %637 = phi i64 [ %644, %634 ], [ 0, %630 ]
  %638 = add nuw nsw i64 %635, %575
  %639 = trunc i64 %638 to i32
  %640 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DTW_single_dim, i32 0, i32 %639
  %641 = load float, float addrspace(3)* %640, align 4, !tbaa !7
  %642 = fadd contract float %641, %636
  %643 = add nuw nsw i64 %635, 1
  %644 = add i64 %637, 1
  %645 = icmp eq i64 %644, %567
  br i1 %645, label %646, label %634, !llvm.loop !24

646:                                              ; preds = %634, %630
  %647 = phi float [ %631, %630 ], [ %642, %634 ]
  store float %647, float addrspace(1)* %574, align 4, !tbaa !7
  %648 = add nuw nsw i64 %572, 1
  %649 = icmp eq i64 %648, %557
  br i1 %649, label %650, label %571, !llvm.loop !25

650:                                              ; preds = %646, %373, %24, %35, %527, %255, %400, %389
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
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
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !12}
