; ModuleID = '../data/hip_kernels/722/6/main.cu'
source_filename = "../data/hip_kernels/722/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@T2 = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8rMD_ED_DPfS_iiS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp eq i32 %6, 0
  %18 = freeze i32 %16
  %19 = freeze i32 %2
  %20 = sdiv i32 %18, %19
  %21 = shl i32 %2, 1
  %22 = mul i32 %21, %3
  %23 = mul i32 %22, %20
  %24 = mul i32 %20, %19
  %25 = sub i32 %18, %24
  %26 = add nsw i32 %23, %25
  %27 = mul nsw i32 %5, %2
  %28 = icmp slt i32 %16, %27
  br i1 %17, label %29, label %209

29:                                               ; preds = %7
  br i1 %28, label %30, label %305

30:                                               ; preds = %29
  %31 = icmp eq i32 %15, 0
  br i1 %31, label %32, label %115

32:                                               ; preds = %30
  %33 = sext i32 %3 to i64
  %34 = icmp sgt i32 %3, 0
  br i1 %34, label %35, label %115

35:                                               ; preds = %32
  %36 = sext i32 %2 to i64
  %37 = icmp sgt i32 %2, 0
  %38 = and i64 %36, 7
  %39 = icmp ult i32 %2, 8
  %40 = and i64 %36, -8
  %41 = icmp eq i64 %38, 0
  br label %42

42:                                               ; preds = %35, %112
  %43 = phi i64 [ 0, %35 ], [ %113, %112 ]
  br i1 %37, label %44, label %112

44:                                               ; preds = %42
  %45 = mul nsw i64 %43, %36
  br i1 %39, label %99, label %46

46:                                               ; preds = %44, %46
  %47 = phi i64 [ %96, %46 ], [ 0, %44 ]
  %48 = phi i64 [ %97, %46 ], [ 0, %44 ]
  %49 = add nsw i64 %47, %45
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = trunc i64 %49 to i32
  %53 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %52
  store float %51, float addrspace(3)* %53, align 4, !tbaa !7
  %54 = or i64 %47, 1
  %55 = add nsw i64 %54, %45
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = trunc i64 %55 to i32
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %58
  store float %57, float addrspace(3)* %59, align 4, !tbaa !7
  %60 = or i64 %47, 2
  %61 = add nsw i64 %60, %45
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = trunc i64 %61 to i32
  %65 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %64
  store float %63, float addrspace(3)* %65, align 4, !tbaa !7
  %66 = or i64 %47, 3
  %67 = add nsw i64 %66, %45
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = trunc i64 %67 to i32
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %70
  store float %69, float addrspace(3)* %71, align 4, !tbaa !7
  %72 = or i64 %47, 4
  %73 = add nsw i64 %72, %45
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = trunc i64 %73 to i32
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %76
  store float %75, float addrspace(3)* %77, align 4, !tbaa !7
  %78 = or i64 %47, 5
  %79 = add nsw i64 %78, %45
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = trunc i64 %79 to i32
  %83 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %82
  store float %81, float addrspace(3)* %83, align 4, !tbaa !7
  %84 = or i64 %47, 6
  %85 = add nsw i64 %84, %45
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = trunc i64 %85 to i32
  %89 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %88
  store float %87, float addrspace(3)* %89, align 4, !tbaa !7
  %90 = or i64 %47, 7
  %91 = add nsw i64 %90, %45
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = trunc i64 %91 to i32
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %94
  store float %93, float addrspace(3)* %95, align 4, !tbaa !7
  %96 = add nuw nsw i64 %47, 8
  %97 = add i64 %48, 8
  %98 = icmp eq i64 %97, %40
  br i1 %98, label %99, label %46, !llvm.loop !11

99:                                               ; preds = %46, %44
  %100 = phi i64 [ 0, %44 ], [ %96, %46 ]
  br i1 %41, label %112, label %101

101:                                              ; preds = %99, %101
  %102 = phi i64 [ %109, %101 ], [ %100, %99 ]
  %103 = phi i64 [ %110, %101 ], [ 0, %99 ]
  %104 = add nsw i64 %102, %45
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = trunc i64 %104 to i32
  %108 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %107
  store float %106, float addrspace(3)* %108, align 4, !tbaa !7
  %109 = add nuw nsw i64 %102, 1
  %110 = add i64 %103, 1
  %111 = icmp eq i64 %110, %38
  br i1 %111, label %112, label %101, !llvm.loop !13

112:                                              ; preds = %99, %101, %42
  %113 = add nuw nsw i64 %43, 1
  %114 = icmp eq i64 %113, %33
  br i1 %114, label %115, label %42, !llvm.loop !15

115:                                              ; preds = %112, %32, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = sext i32 %2 to i64
  %117 = icmp sgt i32 %2, 0
  br i1 %117, label %118, label %186

118:                                              ; preds = %115
  %119 = sext i32 %3 to i64
  %120 = icmp sgt i32 %3, 0
  %121 = sext i32 %26 to i64
  %122 = shl nsw i64 %116, 1
  %123 = and i64 %119, 1
  %124 = icmp eq i32 %3, 1
  %125 = and i64 %119, -2
  %126 = icmp eq i64 %123, 0
  br label %127

127:                                              ; preds = %118, %181
  %128 = phi i64 [ 0, %118 ], [ %184, %181 ]
  %129 = phi float [ 0.000000e+00, %118 ], [ %183, %181 ]
  br i1 %120, label %130, label %181

130:                                              ; preds = %127
  %131 = add nsw i64 %128, %121
  br i1 %124, label %164, label %132

132:                                              ; preds = %130, %132
  %133 = phi i64 [ %161, %132 ], [ 0, %130 ]
  %134 = phi float [ %160, %132 ], [ 0.000000e+00, %130 ]
  %135 = phi i64 [ %162, %132 ], [ 0, %130 ]
  %136 = mul nsw i64 %122, %133
  %137 = add nsw i64 %131, %136
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = mul nsw i64 %133, %116
  %141 = add nsw i64 %140, %128
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fsub contract float %139, %144
  %146 = fmul contract float %145, %145
  %147 = fadd contract float %134, %146
  %148 = or i64 %133, 1
  %149 = mul nsw i64 %122, %148
  %150 = add nsw i64 %131, %149
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = mul nsw i64 %148, %116
  %154 = add nsw i64 %153, %128
  %155 = trunc i64 %154 to i32
  %156 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %155
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !7
  %158 = fsub contract float %152, %157
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %147, %159
  %161 = add nuw nsw i64 %133, 2
  %162 = add i64 %135, 2
  %163 = icmp eq i64 %162, %125
  br i1 %163, label %164, label %132, !llvm.loop !16

164:                                              ; preds = %132, %130
  %165 = phi float [ undef, %130 ], [ %160, %132 ]
  %166 = phi i64 [ 0, %130 ], [ %161, %132 ]
  %167 = phi float [ 0.000000e+00, %130 ], [ %160, %132 ]
  br i1 %126, label %181, label %168

168:                                              ; preds = %164
  %169 = mul nsw i64 %122, %166
  %170 = add nsw i64 %131, %169
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = mul nsw i64 %166, %116
  %174 = add nsw i64 %173, %128
  %175 = trunc i64 %174 to i32
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !7
  %178 = fsub contract float %172, %177
  %179 = fmul contract float %178, %178
  %180 = fadd contract float %167, %179
  br label %181

181:                                              ; preds = %168, %164, %127
  %182 = phi float [ 0.000000e+00, %127 ], [ %165, %164 ], [ %180, %168 ]
  %183 = fadd contract float %129, %182
  %184 = add nuw nsw i64 %128, 1
  %185 = icmp eq i64 %184, %116
  br i1 %185, label %186, label %127, !llvm.loop !17

186:                                              ; preds = %181, %115
  %187 = phi float [ 0.000000e+00, %115 ], [ %183, %181 ]
  %188 = fcmp olt float %187, 0x39F0000000000000
  %189 = select i1 %188, float 0x41F0000000000000, float 1.000000e+00
  %190 = fmul float %187, %189
  %191 = tail call float @llvm.sqrt.f32(float %190)
  %192 = bitcast float %191 to i32
  %193 = add nsw i32 %192, -1
  %194 = bitcast i32 %193 to float
  %195 = add nsw i32 %192, 1
  %196 = bitcast i32 %195 to float
  %197 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 608)
  %198 = select i1 %188, float 0x3EF0000000000000, float 1.000000e+00
  %199 = fneg float %196
  %200 = tail call float @llvm.fma.f32(float %199, float %191, float %190)
  %201 = fcmp ogt float %200, 0.000000e+00
  %202 = fneg float %194
  %203 = tail call float @llvm.fma.f32(float %202, float %191, float %190)
  %204 = fcmp ole float %203, 0.000000e+00
  %205 = select i1 %204, float %194, float %191
  %206 = select i1 %201, float %196, float %205
  %207 = fmul float %198, %206
  %208 = select i1 %197, float %190, float %207
  br label %301

209:                                              ; preds = %7
  br i1 %28, label %210, label %305

210:                                              ; preds = %209
  %211 = sext i32 %2 to i64
  %212 = icmp sgt i32 %2, 0
  br i1 %212, label %213, label %278

213:                                              ; preds = %210
  %214 = sext i32 %3 to i64
  %215 = icmp sgt i32 %3, 0
  %216 = sext i32 %26 to i64
  %217 = shl nsw i64 %211, 1
  %218 = and i64 %214, 1
  %219 = icmp eq i32 %3, 1
  %220 = and i64 %214, -2
  %221 = icmp eq i64 %218, 0
  br label %222

222:                                              ; preds = %213, %273
  %223 = phi i64 [ 0, %213 ], [ %276, %273 ]
  %224 = phi float [ 0.000000e+00, %213 ], [ %275, %273 ]
  br i1 %215, label %225, label %273

225:                                              ; preds = %222
  %226 = add nsw i64 %223, %216
  br i1 %219, label %257, label %227

227:                                              ; preds = %225, %227
  %228 = phi i64 [ %254, %227 ], [ 0, %225 ]
  %229 = phi float [ %253, %227 ], [ 0.000000e+00, %225 ]
  %230 = phi i64 [ %255, %227 ], [ 0, %225 ]
  %231 = mul nsw i64 %217, %228
  %232 = add nsw i64 %226, %231
  %233 = getelementptr inbounds float, float addrspace(1)* %0, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7, !amdgpu.noclobber !5
  %235 = mul nsw i64 %228, %211
  %236 = add nsw i64 %235, %223
  %237 = getelementptr inbounds float, float addrspace(1)* %1, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7, !amdgpu.noclobber !5
  %239 = fsub contract float %234, %238
  %240 = fmul contract float %239, %239
  %241 = fadd contract float %229, %240
  %242 = or i64 %228, 1
  %243 = mul nsw i64 %217, %242
  %244 = add nsw i64 %226, %243
  %245 = getelementptr inbounds float, float addrspace(1)* %0, i64 %244
  %246 = load float, float addrspace(1)* %245, align 4, !tbaa !7, !amdgpu.noclobber !5
  %247 = mul nsw i64 %242, %211
  %248 = add nsw i64 %247, %223
  %249 = getelementptr inbounds float, float addrspace(1)* %1, i64 %248
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !7, !amdgpu.noclobber !5
  %251 = fsub contract float %246, %250
  %252 = fmul contract float %251, %251
  %253 = fadd contract float %241, %252
  %254 = add nuw nsw i64 %228, 2
  %255 = add i64 %230, 2
  %256 = icmp eq i64 %255, %220
  br i1 %256, label %257, label %227, !llvm.loop !18

257:                                              ; preds = %227, %225
  %258 = phi float [ undef, %225 ], [ %253, %227 ]
  %259 = phi i64 [ 0, %225 ], [ %254, %227 ]
  %260 = phi float [ 0.000000e+00, %225 ], [ %253, %227 ]
  br i1 %221, label %273, label %261

261:                                              ; preds = %257
  %262 = mul nsw i64 %217, %259
  %263 = add nsw i64 %226, %262
  %264 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !7, !amdgpu.noclobber !5
  %266 = mul nsw i64 %259, %211
  %267 = add nsw i64 %266, %223
  %268 = getelementptr inbounds float, float addrspace(1)* %1, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !7, !amdgpu.noclobber !5
  %270 = fsub contract float %265, %269
  %271 = fmul contract float %270, %270
  %272 = fadd contract float %260, %271
  br label %273

273:                                              ; preds = %261, %257, %222
  %274 = phi float [ 0.000000e+00, %222 ], [ %258, %257 ], [ %272, %261 ]
  %275 = fadd contract float %224, %274
  %276 = add nuw nsw i64 %223, 1
  %277 = icmp eq i64 %276, %211
  br i1 %277, label %278, label %222, !llvm.loop !19

278:                                              ; preds = %273, %210
  %279 = phi float [ 0.000000e+00, %210 ], [ %275, %273 ]
  %280 = fcmp olt float %279, 0x39F0000000000000
  %281 = select i1 %280, float 0x41F0000000000000, float 1.000000e+00
  %282 = fmul float %279, %281
  %283 = tail call float @llvm.sqrt.f32(float %282)
  %284 = bitcast float %283 to i32
  %285 = add nsw i32 %284, -1
  %286 = bitcast i32 %285 to float
  %287 = add nsw i32 %284, 1
  %288 = bitcast i32 %287 to float
  %289 = tail call i1 @llvm.amdgcn.class.f32(float %282, i32 608)
  %290 = select i1 %280, float 0x3EF0000000000000, float 1.000000e+00
  %291 = fneg float %288
  %292 = tail call float @llvm.fma.f32(float %291, float %283, float %282)
  %293 = fcmp ogt float %292, 0.000000e+00
  %294 = fneg float %286
  %295 = tail call float @llvm.fma.f32(float %294, float %283, float %282)
  %296 = fcmp ole float %295, 0.000000e+00
  %297 = select i1 %296, float %286, float %283
  %298 = select i1 %293, float %288, float %297
  %299 = fmul float %290, %298
  %300 = select i1 %289, float %282, float %299
  br label %301

301:                                              ; preds = %186, %278
  %302 = phi float [ %300, %278 ], [ %208, %186 ]
  %303 = sext i32 %16 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %4, i64 %303
  store float %302, float addrspace(1)* %304, align 4, !tbaa !7
  br label %305

305:                                              ; preds = %301, %209, %29
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
