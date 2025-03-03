; ModuleID = '../data/hip_kernels/722/4/main.cu'
source_filename = "../data/hip_kernels/722/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@T2 = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7MD_ED_DPfS_iiiS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp eq i32 %7, 0
  %19 = icmp eq i32 %6, 0
  br i1 %18, label %20, label %298

20:                                               ; preds = %8
  br i1 %19, label %21, label %113

21:                                               ; preds = %20
  %22 = mul nsw i32 %4, %3
  %23 = mul nsw i32 %17, %22
  %24 = add nsw i32 %23, %22
  %25 = mul nsw i32 %22, %2
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %405, label %27

27:                                               ; preds = %21
  %28 = icmp eq i32 %16, 0
  br i1 %28, label %29, label %112

29:                                               ; preds = %27
  %30 = sext i32 %4 to i64
  %31 = icmp sgt i32 %4, 0
  br i1 %31, label %32, label %112

32:                                               ; preds = %29
  %33 = sext i32 %3 to i64
  %34 = icmp sgt i32 %3, 0
  %35 = and i64 %33, 7
  %36 = icmp ult i32 %3, 8
  %37 = and i64 %33, -8
  %38 = icmp eq i64 %35, 0
  br label %39

39:                                               ; preds = %32, %109
  %40 = phi i64 [ 0, %32 ], [ %110, %109 ]
  br i1 %34, label %41, label %109

41:                                               ; preds = %39
  %42 = mul nsw i64 %40, %33
  br i1 %36, label %96, label %43

43:                                               ; preds = %41, %43
  %44 = phi i64 [ %93, %43 ], [ 0, %41 ]
  %45 = phi i64 [ %94, %43 ], [ 0, %41 ]
  %46 = add nsw i64 %44, %42
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = trunc i64 %46 to i32
  %50 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %49
  store float %48, float addrspace(3)* %50, align 4, !tbaa !7
  %51 = or i64 %44, 1
  %52 = add nsw i64 %51, %42
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = trunc i64 %52 to i32
  %56 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %55
  store float %54, float addrspace(3)* %56, align 4, !tbaa !7
  %57 = or i64 %44, 2
  %58 = add nsw i64 %57, %42
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = trunc i64 %58 to i32
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %61
  store float %60, float addrspace(3)* %62, align 4, !tbaa !7
  %63 = or i64 %44, 3
  %64 = add nsw i64 %63, %42
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = trunc i64 %64 to i32
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %67
  store float %66, float addrspace(3)* %68, align 4, !tbaa !7
  %69 = or i64 %44, 4
  %70 = add nsw i64 %69, %42
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = trunc i64 %70 to i32
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %73
  store float %72, float addrspace(3)* %74, align 4, !tbaa !7
  %75 = or i64 %44, 5
  %76 = add nsw i64 %75, %42
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = trunc i64 %76 to i32
  %80 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %79
  store float %78, float addrspace(3)* %80, align 4, !tbaa !7
  %81 = or i64 %44, 6
  %82 = add nsw i64 %81, %42
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = trunc i64 %82 to i32
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %85
  store float %84, float addrspace(3)* %86, align 4, !tbaa !7
  %87 = or i64 %44, 7
  %88 = add nsw i64 %87, %42
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = trunc i64 %88 to i32
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %91
  store float %90, float addrspace(3)* %92, align 4, !tbaa !7
  %93 = add nuw nsw i64 %44, 8
  %94 = add i64 %45, 8
  %95 = icmp eq i64 %94, %37
  br i1 %95, label %96, label %43, !llvm.loop !11

96:                                               ; preds = %43, %41
  %97 = phi i64 [ 0, %41 ], [ %93, %43 ]
  br i1 %38, label %109, label %98

98:                                               ; preds = %96, %98
  %99 = phi i64 [ %106, %98 ], [ %97, %96 ]
  %100 = phi i64 [ %107, %98 ], [ 0, %96 ]
  %101 = add nsw i64 %99, %42
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = trunc i64 %101 to i32
  %105 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %104
  store float %103, float addrspace(3)* %105, align 4, !tbaa !7
  %106 = add nuw nsw i64 %99, 1
  %107 = add i64 %100, 1
  %108 = icmp eq i64 %107, %35
  br i1 %108, label %109, label %98, !llvm.loop !13

109:                                              ; preds = %96, %98, %39
  %110 = add nuw nsw i64 %40, 1
  %111 = icmp eq i64 %110, %30
  br i1 %111, label %112, label %39, !llvm.loop !15

112:                                              ; preds = %109, %29, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %202

113:                                              ; preds = %20
  %114 = add nsw i32 %17, %3
  %115 = icmp sgt i32 %114, %2
  br i1 %115, label %405, label %116

116:                                              ; preds = %113
  %117 = icmp eq i32 %16, 0
  br i1 %117, label %118, label %201

118:                                              ; preds = %116
  %119 = sext i32 %4 to i64
  %120 = icmp sgt i32 %4, 0
  br i1 %120, label %121, label %201

121:                                              ; preds = %118
  %122 = sext i32 %3 to i64
  %123 = icmp sgt i32 %3, 0
  %124 = and i64 %122, 7
  %125 = icmp ult i32 %3, 8
  %126 = and i64 %122, -8
  %127 = icmp eq i64 %124, 0
  br label %128

128:                                              ; preds = %121, %198
  %129 = phi i64 [ 0, %121 ], [ %199, %198 ]
  br i1 %123, label %130, label %198

130:                                              ; preds = %128
  %131 = mul nsw i64 %129, %122
  br i1 %125, label %185, label %132

132:                                              ; preds = %130, %132
  %133 = phi i64 [ %182, %132 ], [ 0, %130 ]
  %134 = phi i64 [ %183, %132 ], [ 0, %130 ]
  %135 = add nsw i64 %133, %131
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = trunc i64 %135 to i32
  %139 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %138
  store float %137, float addrspace(3)* %139, align 4, !tbaa !7
  %140 = or i64 %133, 1
  %141 = add nsw i64 %140, %131
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = trunc i64 %141 to i32
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %144
  store float %143, float addrspace(3)* %145, align 4, !tbaa !7
  %146 = or i64 %133, 2
  %147 = add nsw i64 %146, %131
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = trunc i64 %147 to i32
  %151 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %150
  store float %149, float addrspace(3)* %151, align 4, !tbaa !7
  %152 = or i64 %133, 3
  %153 = add nsw i64 %152, %131
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = trunc i64 %153 to i32
  %157 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %156
  store float %155, float addrspace(3)* %157, align 4, !tbaa !7
  %158 = or i64 %133, 4
  %159 = add nsw i64 %158, %131
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = trunc i64 %159 to i32
  %163 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %162
  store float %161, float addrspace(3)* %163, align 4, !tbaa !7
  %164 = or i64 %133, 5
  %165 = add nsw i64 %164, %131
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = trunc i64 %165 to i32
  %169 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %168
  store float %167, float addrspace(3)* %169, align 4, !tbaa !7
  %170 = or i64 %133, 6
  %171 = add nsw i64 %170, %131
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !5
  %174 = trunc i64 %171 to i32
  %175 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %174
  store float %173, float addrspace(3)* %175, align 4, !tbaa !7
  %176 = or i64 %133, 7
  %177 = add nsw i64 %176, %131
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7, !amdgpu.noclobber !5
  %180 = trunc i64 %177 to i32
  %181 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %180
  store float %179, float addrspace(3)* %181, align 4, !tbaa !7
  %182 = add nuw nsw i64 %133, 8
  %183 = add i64 %134, 8
  %184 = icmp eq i64 %183, %126
  br i1 %184, label %185, label %132, !llvm.loop !16

185:                                              ; preds = %132, %130
  %186 = phi i64 [ 0, %130 ], [ %182, %132 ]
  br i1 %127, label %198, label %187

187:                                              ; preds = %185, %187
  %188 = phi i64 [ %195, %187 ], [ %186, %185 ]
  %189 = phi i64 [ %196, %187 ], [ 0, %185 ]
  %190 = add nsw i64 %188, %131
  %191 = getelementptr inbounds float, float addrspace(1)* %1, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7, !amdgpu.noclobber !5
  %193 = trunc i64 %190 to i32
  %194 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %193
  store float %192, float addrspace(3)* %194, align 4, !tbaa !7
  %195 = add nuw nsw i64 %188, 1
  %196 = add i64 %189, 1
  %197 = icmp eq i64 %196, %124
  br i1 %197, label %198, label %187, !llvm.loop !17

198:                                              ; preds = %185, %187, %128
  %199 = add nuw nsw i64 %129, 1
  %200 = icmp eq i64 %199, %119
  br i1 %200, label %201, label %128, !llvm.loop !18

201:                                              ; preds = %198, %118, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %202

202:                                              ; preds = %112, %201
  %203 = phi i32 [ %23, %112 ], [ %17, %201 ]
  %204 = phi i32 [ %3, %112 ], [ %2, %201 ]
  fence syncscope("workgroup") acquire
  %205 = sext i32 %3 to i64
  %206 = icmp sgt i32 %3, 0
  br i1 %206, label %207, label %275

207:                                              ; preds = %202
  %208 = sext i32 %4 to i64
  %209 = icmp sgt i32 %4, 0
  %210 = sext i32 %203 to i64
  %211 = sext i32 %204 to i64
  %212 = and i64 %208, 1
  %213 = icmp eq i32 %4, 1
  %214 = and i64 %208, -2
  %215 = icmp eq i64 %212, 0
  br label %216

216:                                              ; preds = %207, %270
  %217 = phi i64 [ 0, %207 ], [ %273, %270 ]
  %218 = phi float [ 0.000000e+00, %207 ], [ %272, %270 ]
  br i1 %209, label %219, label %270

219:                                              ; preds = %216
  %220 = add nsw i64 %217, %210
  br i1 %213, label %253, label %221

221:                                              ; preds = %219, %221
  %222 = phi i64 [ %250, %221 ], [ 0, %219 ]
  %223 = phi float [ %249, %221 ], [ 0.000000e+00, %219 ]
  %224 = phi i64 [ %251, %221 ], [ 0, %219 ]
  %225 = mul nsw i64 %222, %211
  %226 = add nsw i64 %220, %225
  %227 = getelementptr inbounds float, float addrspace(1)* %0, i64 %226
  %228 = load float, float addrspace(1)* %227, align 4, !tbaa !7, !amdgpu.noclobber !5
  %229 = mul nsw i64 %222, %205
  %230 = add nsw i64 %229, %217
  %231 = trunc i64 %230 to i32
  %232 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !7
  %234 = fsub contract float %228, %233
  %235 = fmul contract float %234, %234
  %236 = fadd contract float %223, %235
  %237 = or i64 %222, 1
  %238 = mul nsw i64 %237, %211
  %239 = add nsw i64 %220, %238
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !7, !amdgpu.noclobber !5
  %242 = mul nsw i64 %237, %205
  %243 = add nsw i64 %242, %217
  %244 = trunc i64 %243 to i32
  %245 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %244
  %246 = load float, float addrspace(3)* %245, align 4, !tbaa !7
  %247 = fsub contract float %241, %246
  %248 = fmul contract float %247, %247
  %249 = fadd contract float %236, %248
  %250 = add nuw nsw i64 %222, 2
  %251 = add i64 %224, 2
  %252 = icmp eq i64 %251, %214
  br i1 %252, label %253, label %221, !llvm.loop !19

253:                                              ; preds = %221, %219
  %254 = phi float [ undef, %219 ], [ %249, %221 ]
  %255 = phi i64 [ 0, %219 ], [ %250, %221 ]
  %256 = phi float [ 0.000000e+00, %219 ], [ %249, %221 ]
  br i1 %215, label %270, label %257

257:                                              ; preds = %253
  %258 = mul nsw i64 %255, %211
  %259 = add nsw i64 %220, %258
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !7, !amdgpu.noclobber !5
  %262 = mul nsw i64 %255, %205
  %263 = add nsw i64 %262, %217
  %264 = trunc i64 %263 to i32
  %265 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @T2, i32 0, i32 %264
  %266 = load float, float addrspace(3)* %265, align 4, !tbaa !7
  %267 = fsub contract float %261, %266
  %268 = fmul contract float %267, %267
  %269 = fadd contract float %256, %268
  br label %270

270:                                              ; preds = %257, %253, %216
  %271 = phi float [ 0.000000e+00, %216 ], [ %254, %253 ], [ %269, %257 ]
  %272 = fadd contract float %218, %271
  %273 = add nuw nsw i64 %217, 1
  %274 = icmp eq i64 %273, %205
  br i1 %274, label %275, label %216, !llvm.loop !20

275:                                              ; preds = %270, %202
  %276 = phi float [ 0.000000e+00, %202 ], [ %272, %270 ]
  %277 = fcmp olt float %276, 0x39F0000000000000
  %278 = select i1 %277, float 0x41F0000000000000, float 1.000000e+00
  %279 = fmul float %276, %278
  %280 = tail call float @llvm.sqrt.f32(float %279)
  %281 = bitcast float %280 to i32
  %282 = add nsw i32 %281, -1
  %283 = bitcast i32 %282 to float
  %284 = add nsw i32 %281, 1
  %285 = bitcast i32 %284 to float
  %286 = tail call i1 @llvm.amdgcn.class.f32(float %279, i32 608)
  %287 = select i1 %277, float 0x3EF0000000000000, float 1.000000e+00
  %288 = fneg float %285
  %289 = tail call float @llvm.fma.f32(float %288, float %280, float %279)
  %290 = fcmp ogt float %289, 0.000000e+00
  %291 = fneg float %283
  %292 = tail call float @llvm.fma.f32(float %291, float %280, float %279)
  %293 = fcmp ole float %292, 0.000000e+00
  %294 = select i1 %293, float %283, float %280
  %295 = select i1 %290, float %285, float %294
  %296 = fmul float %287, %295
  %297 = select i1 %286, float %279, float %296
  br label %401

298:                                              ; preds = %8
  br i1 %19, label %299, label %305

299:                                              ; preds = %298
  %300 = mul nsw i32 %4, %3
  %301 = mul nsw i32 %17, %300
  %302 = add nsw i32 %301, %300
  %303 = mul nsw i32 %300, %2
  %304 = icmp sgt i32 %302, %303
  br i1 %304, label %405, label %308

305:                                              ; preds = %298
  %306 = add nsw i32 %17, %3
  %307 = icmp sgt i32 %306, %2
  br i1 %307, label %405, label %308

308:                                              ; preds = %305, %299
  %309 = phi i32 [ %301, %299 ], [ %17, %305 ]
  %310 = phi i32 [ %3, %299 ], [ %2, %305 ]
  %311 = sext i32 %3 to i64
  %312 = icmp sgt i32 %3, 0
  br i1 %312, label %313, label %378

313:                                              ; preds = %308
  %314 = sext i32 %4 to i64
  %315 = icmp sgt i32 %4, 0
  %316 = sext i32 %309 to i64
  %317 = sext i32 %310 to i64
  %318 = and i64 %314, 1
  %319 = icmp eq i32 %4, 1
  %320 = and i64 %314, -2
  %321 = icmp eq i64 %318, 0
  br label %322

322:                                              ; preds = %313, %373
  %323 = phi i64 [ 0, %313 ], [ %376, %373 ]
  %324 = phi float [ 0.000000e+00, %313 ], [ %375, %373 ]
  br i1 %315, label %325, label %373

325:                                              ; preds = %322
  %326 = add nsw i64 %323, %316
  br i1 %319, label %357, label %327

327:                                              ; preds = %325, %327
  %328 = phi i64 [ %354, %327 ], [ 0, %325 ]
  %329 = phi float [ %353, %327 ], [ 0.000000e+00, %325 ]
  %330 = phi i64 [ %355, %327 ], [ 0, %325 ]
  %331 = mul nsw i64 %328, %317
  %332 = add nsw i64 %326, %331
  %333 = getelementptr inbounds float, float addrspace(1)* %0, i64 %332
  %334 = load float, float addrspace(1)* %333, align 4, !tbaa !7, !amdgpu.noclobber !5
  %335 = mul nsw i64 %328, %311
  %336 = add nsw i64 %335, %323
  %337 = getelementptr inbounds float, float addrspace(1)* %1, i64 %336
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !7, !amdgpu.noclobber !5
  %339 = fsub contract float %334, %338
  %340 = fmul contract float %339, %339
  %341 = fadd contract float %329, %340
  %342 = or i64 %328, 1
  %343 = mul nsw i64 %342, %317
  %344 = add nsw i64 %326, %343
  %345 = getelementptr inbounds float, float addrspace(1)* %0, i64 %344
  %346 = load float, float addrspace(1)* %345, align 4, !tbaa !7, !amdgpu.noclobber !5
  %347 = mul nsw i64 %342, %311
  %348 = add nsw i64 %347, %323
  %349 = getelementptr inbounds float, float addrspace(1)* %1, i64 %348
  %350 = load float, float addrspace(1)* %349, align 4, !tbaa !7, !amdgpu.noclobber !5
  %351 = fsub contract float %346, %350
  %352 = fmul contract float %351, %351
  %353 = fadd contract float %341, %352
  %354 = add nuw nsw i64 %328, 2
  %355 = add i64 %330, 2
  %356 = icmp eq i64 %355, %320
  br i1 %356, label %357, label %327, !llvm.loop !21

357:                                              ; preds = %327, %325
  %358 = phi float [ undef, %325 ], [ %353, %327 ]
  %359 = phi i64 [ 0, %325 ], [ %354, %327 ]
  %360 = phi float [ 0.000000e+00, %325 ], [ %353, %327 ]
  br i1 %321, label %373, label %361

361:                                              ; preds = %357
  %362 = mul nsw i64 %359, %317
  %363 = add nsw i64 %326, %362
  %364 = getelementptr inbounds float, float addrspace(1)* %0, i64 %363
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !7, !amdgpu.noclobber !5
  %366 = mul nsw i64 %359, %311
  %367 = add nsw i64 %366, %323
  %368 = getelementptr inbounds float, float addrspace(1)* %1, i64 %367
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !7, !amdgpu.noclobber !5
  %370 = fsub contract float %365, %369
  %371 = fmul contract float %370, %370
  %372 = fadd contract float %360, %371
  br label %373

373:                                              ; preds = %361, %357, %322
  %374 = phi float [ 0.000000e+00, %322 ], [ %358, %357 ], [ %372, %361 ]
  %375 = fadd contract float %324, %374
  %376 = add nuw nsw i64 %323, 1
  %377 = icmp eq i64 %376, %311
  br i1 %377, label %378, label %322, !llvm.loop !22

378:                                              ; preds = %373, %308
  %379 = phi float [ 0.000000e+00, %308 ], [ %375, %373 ]
  %380 = fcmp olt float %379, 0x39F0000000000000
  %381 = select i1 %380, float 0x41F0000000000000, float 1.000000e+00
  %382 = fmul float %379, %381
  %383 = tail call float @llvm.sqrt.f32(float %382)
  %384 = bitcast float %383 to i32
  %385 = add nsw i32 %384, -1
  %386 = bitcast i32 %385 to float
  %387 = add nsw i32 %384, 1
  %388 = bitcast i32 %387 to float
  %389 = tail call i1 @llvm.amdgcn.class.f32(float %382, i32 608)
  %390 = select i1 %380, float 0x3EF0000000000000, float 1.000000e+00
  %391 = fneg float %388
  %392 = tail call float @llvm.fma.f32(float %391, float %383, float %382)
  %393 = fcmp ogt float %392, 0.000000e+00
  %394 = fneg float %386
  %395 = tail call float @llvm.fma.f32(float %394, float %383, float %382)
  %396 = fcmp ole float %395, 0.000000e+00
  %397 = select i1 %396, float %386, float %383
  %398 = select i1 %393, float %388, float %397
  %399 = fmul float %390, %398
  %400 = select i1 %389, float %382, float %399
  br label %401

401:                                              ; preds = %378, %275
  %402 = phi float [ %297, %275 ], [ %400, %378 ]
  %403 = sext i32 %17 to i64
  %404 = getelementptr inbounds float, float addrspace(1)* %5, i64 %403
  store float %402, float addrspace(1)* %404, align 4, !tbaa !7
  br label %405

405:                                              ; preds = %401, %299, %305, %113, %21
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
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !12}
