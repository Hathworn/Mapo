; ModuleID = '../data/hip_kernels/6580/43/main.cu'
source_filename = "../data/hip_kernels/6580/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14softmax_linearPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %5, %3
  %8 = add nsw i32 %7, %6
  %9 = mul nsw i32 %3, %2
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %337

11:                                               ; preds = %4
  %12 = icmp sgt i32 %2, 0
  br i1 %12, label %13, label %115

13:                                               ; preds = %11
  %14 = and i32 %2, 7
  %15 = icmp ult i32 %2, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %2, -8
  br label %39

18:                                               ; preds = %39, %13
  %19 = phi i32 [ 0, %13 ], [ %97, %39 ]
  %20 = icmp eq i32 %14, 0
  br i1 %20, label %33, label %21

21:                                               ; preds = %18, %21
  %22 = phi i32 [ %30, %21 ], [ %19, %18 ]
  %23 = phi i32 [ %31, %21 ], [ 0, %18 ]
  %24 = mul nsw i32 %22, %3
  %25 = add nsw i32 %24, %6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %22
  store float %28, float addrspace(3)* %29, align 4, !tbaa !5
  %30 = add nuw nsw i32 %22, 1
  %31 = add i32 %23, 1
  %32 = icmp eq i32 %31, %14
  br i1 %32, label %33, label %21, !llvm.loop !10

33:                                               ; preds = %21, %18
  br i1 %12, label %34, label %115

34:                                               ; preds = %33
  %35 = and i32 %2, 7
  %36 = icmp ult i32 %2, 8
  br i1 %36, label %100, label %37

37:                                               ; preds = %34
  %38 = and i32 %2, -8
  br label %122

39:                                               ; preds = %39, %16
  %40 = phi i32 [ 0, %16 ], [ %97, %39 ]
  %41 = phi i32 [ 0, %16 ], [ %98, %39 ]
  %42 = mul nsw i32 %40, %3
  %43 = add nsw i32 %42, %6
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %40
  store float %46, float addrspace(3)* %47, align 4, !tbaa !5
  %48 = or i32 %40, 1
  %49 = mul nsw i32 %48, %3
  %50 = add nsw i32 %49, %6
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %48
  store float %53, float addrspace(3)* %54, align 4, !tbaa !5
  %55 = or i32 %40, 2
  %56 = mul nsw i32 %55, %3
  %57 = add nsw i32 %56, %6
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %55
  store float %60, float addrspace(3)* %61, align 4, !tbaa !5
  %62 = or i32 %40, 3
  %63 = mul nsw i32 %62, %3
  %64 = add nsw i32 %63, %6
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %62
  store float %67, float addrspace(3)* %68, align 4, !tbaa !5
  %69 = or i32 %40, 4
  %70 = mul nsw i32 %69, %3
  %71 = add nsw i32 %70, %6
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %69
  store float %74, float addrspace(3)* %75, align 4, !tbaa !5
  %76 = or i32 %40, 5
  %77 = mul nsw i32 %76, %3
  %78 = add nsw i32 %77, %6
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %76
  store float %81, float addrspace(3)* %82, align 4, !tbaa !5
  %83 = or i32 %40, 6
  %84 = mul nsw i32 %83, %3
  %85 = add nsw i32 %84, %6
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %83
  store float %88, float addrspace(3)* %89, align 4, !tbaa !5
  %90 = or i32 %40, 7
  %91 = mul nsw i32 %90, %3
  %92 = add nsw i32 %91, %6
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %90
  store float %95, float addrspace(3)* %96, align 4, !tbaa !5
  %97 = add nuw nsw i32 %40, 8
  %98 = add i32 %41, 8
  %99 = icmp eq i32 %98, %17
  br i1 %99, label %18, label %39, !llvm.loop !12

100:                                              ; preds = %122, %34
  %101 = phi float [ undef, %34 ], [ %156, %122 ]
  %102 = phi i32 [ 0, %34 ], [ %157, %122 ]
  %103 = phi float [ -1.000000e+08, %34 ], [ %156, %122 ]
  %104 = icmp eq i32 %35, 0
  br i1 %104, label %115, label %105

105:                                              ; preds = %100, %105
  %106 = phi i32 [ %112, %105 ], [ %102, %100 ]
  %107 = phi float [ %111, %105 ], [ %103, %100 ]
  %108 = phi i32 [ %113, %105 ], [ 0, %100 ]
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %106
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %111 = tail call float @llvm.maxnum.f32(float %107, float %110)
  %112 = add nuw nsw i32 %106, 1
  %113 = add i32 %108, 1
  %114 = icmp eq i32 %113, %35
  br i1 %114, label %115, label %105, !llvm.loop !14

115:                                              ; preds = %100, %105, %11, %33
  %116 = phi float [ -1.000000e+08, %33 ], [ -1.000000e+08, %11 ], [ %101, %100 ], [ %111, %105 ]
  br i1 %12, label %117, label %239

117:                                              ; preds = %115
  %118 = and i32 %2, 7
  %119 = icmp ult i32 %2, 8
  br i1 %119, label %160, label %120

120:                                              ; preds = %117
  %121 = and i32 %2, -8
  br label %179

122:                                              ; preds = %122, %37
  %123 = phi i32 [ 0, %37 ], [ %157, %122 ]
  %124 = phi float [ -1.000000e+08, %37 ], [ %156, %122 ]
  %125 = phi i32 [ 0, %37 ], [ %158, %122 ]
  %126 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %123
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !5
  %128 = tail call float @llvm.maxnum.f32(float %124, float %127)
  %129 = or i32 %123, 1
  %130 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %132 = tail call float @llvm.maxnum.f32(float %128, float %131)
  %133 = or i32 %123, 2
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %136 = tail call float @llvm.maxnum.f32(float %132, float %135)
  %137 = or i32 %123, 3
  %138 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = tail call float @llvm.maxnum.f32(float %136, float %139)
  %141 = or i32 %123, 4
  %142 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %144 = tail call float @llvm.maxnum.f32(float %140, float %143)
  %145 = or i32 %123, 5
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %145
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %148 = tail call float @llvm.maxnum.f32(float %144, float %147)
  %149 = or i32 %123, 6
  %150 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %149
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !5
  %152 = tail call float @llvm.maxnum.f32(float %148, float %151)
  %153 = or i32 %123, 7
  %154 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %153
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %156 = tail call float @llvm.maxnum.f32(float %152, float %155)
  %157 = add nuw nsw i32 %123, 8
  %158 = add i32 %125, 8
  %159 = icmp eq i32 %158, %38
  br i1 %159, label %100, label %122, !llvm.loop !15

160:                                              ; preds = %179, %117
  %161 = phi i32 [ 0, %117 ], [ %221, %179 ]
  %162 = icmp eq i32 %118, 0
  br i1 %162, label %173, label %163

163:                                              ; preds = %160, %163
  %164 = phi i32 [ %170, %163 ], [ %161, %160 ]
  %165 = phi i32 [ %171, %163 ], [ 0, %160 ]
  %166 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %164
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %168 = fsub contract float %167, %116
  %169 = tail call float @llvm.exp.f32(float %168)
  store float %169, float addrspace(3)* %166, align 4, !tbaa !5
  %170 = add nuw nsw i32 %164, 1
  %171 = add i32 %165, 1
  %172 = icmp eq i32 %171, %118
  br i1 %172, label %173, label %163, !llvm.loop !16

173:                                              ; preds = %163, %160
  br i1 %12, label %174, label %239

174:                                              ; preds = %173
  %175 = and i32 %2, 7
  %176 = icmp ult i32 %2, 8
  br i1 %176, label %224, label %177

177:                                              ; preds = %174
  %178 = and i32 %2, -8
  br label %246

179:                                              ; preds = %179, %120
  %180 = phi i32 [ 0, %120 ], [ %221, %179 ]
  %181 = phi i32 [ 0, %120 ], [ %222, %179 ]
  %182 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %180
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !5
  %184 = fsub contract float %183, %116
  %185 = tail call float @llvm.exp.f32(float %184)
  store float %185, float addrspace(3)* %182, align 4, !tbaa !5
  %186 = or i32 %180, 1
  %187 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %189 = fsub contract float %188, %116
  %190 = tail call float @llvm.exp.f32(float %189)
  store float %190, float addrspace(3)* %187, align 4, !tbaa !5
  %191 = or i32 %180, 2
  %192 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = fsub contract float %193, %116
  %195 = tail call float @llvm.exp.f32(float %194)
  store float %195, float addrspace(3)* %192, align 4, !tbaa !5
  %196 = or i32 %180, 3
  %197 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %199 = fsub contract float %198, %116
  %200 = tail call float @llvm.exp.f32(float %199)
  store float %200, float addrspace(3)* %197, align 4, !tbaa !5
  %201 = or i32 %180, 4
  %202 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %201
  %203 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %204 = fsub contract float %203, %116
  %205 = tail call float @llvm.exp.f32(float %204)
  store float %205, float addrspace(3)* %202, align 4, !tbaa !5
  %206 = or i32 %180, 5
  %207 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !5
  %209 = fsub contract float %208, %116
  %210 = tail call float @llvm.exp.f32(float %209)
  store float %210, float addrspace(3)* %207, align 4, !tbaa !5
  %211 = or i32 %180, 6
  %212 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %211
  %213 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %214 = fsub contract float %213, %116
  %215 = tail call float @llvm.exp.f32(float %214)
  store float %215, float addrspace(3)* %212, align 4, !tbaa !5
  %216 = or i32 %180, 7
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %216
  %218 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %219 = fsub contract float %218, %116
  %220 = tail call float @llvm.exp.f32(float %219)
  store float %220, float addrspace(3)* %217, align 4, !tbaa !5
  %221 = add nuw nsw i32 %180, 8
  %222 = add i32 %181, 8
  %223 = icmp eq i32 %222, %121
  br i1 %223, label %160, label %179, !llvm.loop !17

224:                                              ; preds = %246, %174
  %225 = phi float [ undef, %174 ], [ %280, %246 ]
  %226 = phi i32 [ 0, %174 ], [ %281, %246 ]
  %227 = phi float [ 0.000000e+00, %174 ], [ %280, %246 ]
  %228 = icmp eq i32 %175, 0
  br i1 %228, label %239, label %229

229:                                              ; preds = %224, %229
  %230 = phi i32 [ %236, %229 ], [ %226, %224 ]
  %231 = phi float [ %235, %229 ], [ %227, %224 ]
  %232 = phi i32 [ %237, %229 ], [ 0, %224 ]
  %233 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %230
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %235 = fadd contract float %231, %234
  %236 = add nuw nsw i32 %230, 1
  %237 = add i32 %232, 1
  %238 = icmp eq i32 %237, %175
  br i1 %238, label %239, label %229, !llvm.loop !18

239:                                              ; preds = %224, %229, %115, %173
  %240 = phi float [ 0.000000e+00, %173 ], [ 0.000000e+00, %115 ], [ %225, %224 ], [ %235, %229 ]
  br i1 %12, label %241, label %337

241:                                              ; preds = %239
  %242 = and i32 %2, 3
  %243 = icmp ult i32 %2, 4
  br i1 %243, label %321, label %244

244:                                              ; preds = %241
  %245 = and i32 %2, -4
  br label %284

246:                                              ; preds = %246, %177
  %247 = phi i32 [ 0, %177 ], [ %281, %246 ]
  %248 = phi float [ 0.000000e+00, %177 ], [ %280, %246 ]
  %249 = phi i32 [ 0, %177 ], [ %282, %246 ]
  %250 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %247
  %251 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %252 = fadd contract float %248, %251
  %253 = or i32 %247, 1
  %254 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !5
  %256 = fadd contract float %252, %255
  %257 = or i32 %247, 2
  %258 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %257
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %260 = fadd contract float %256, %259
  %261 = or i32 %247, 3
  %262 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %261
  %263 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %264 = fadd contract float %260, %263
  %265 = or i32 %247, 4
  %266 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %265
  %267 = load float, float addrspace(3)* %266, align 4, !tbaa !5
  %268 = fadd contract float %264, %267
  %269 = or i32 %247, 5
  %270 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %269
  %271 = load float, float addrspace(3)* %270, align 4, !tbaa !5
  %272 = fadd contract float %268, %271
  %273 = or i32 %247, 6
  %274 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %273
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %276 = fadd contract float %272, %275
  %277 = or i32 %247, 7
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %277
  %279 = load float, float addrspace(3)* %278, align 4, !tbaa !5
  %280 = fadd contract float %276, %279
  %281 = add nuw nsw i32 %247, 8
  %282 = add i32 %249, 8
  %283 = icmp eq i32 %282, %178
  br i1 %283, label %224, label %246, !llvm.loop !19

284:                                              ; preds = %284, %244
  %285 = phi i32 [ 0, %244 ], [ %318, %284 ]
  %286 = phi i32 [ 0, %244 ], [ %319, %284 ]
  %287 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %285
  %288 = load float, float addrspace(3)* %287, align 4, !tbaa !5
  %289 = fdiv contract float %288, %240
  %290 = mul nsw i32 %285, %3
  %291 = add nsw i32 %290, %6
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %0, i64 %292
  store float %289, float addrspace(1)* %293, align 4, !tbaa !5
  %294 = or i32 %285, 1
  %295 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %294
  %296 = load float, float addrspace(3)* %295, align 4, !tbaa !5
  %297 = fdiv contract float %296, %240
  %298 = mul nsw i32 %294, %3
  %299 = add nsw i32 %298, %6
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(1)* %0, i64 %300
  store float %297, float addrspace(1)* %301, align 4, !tbaa !5
  %302 = or i32 %285, 2
  %303 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %302
  %304 = load float, float addrspace(3)* %303, align 4, !tbaa !5
  %305 = fdiv contract float %304, %240
  %306 = mul nsw i32 %302, %3
  %307 = add nsw i32 %306, %6
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds float, float addrspace(1)* %0, i64 %308
  store float %305, float addrspace(1)* %309, align 4, !tbaa !5
  %310 = or i32 %285, 3
  %311 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %310
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !5
  %313 = fdiv contract float %312, %240
  %314 = mul nsw i32 %310, %3
  %315 = add nsw i32 %314, %6
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %0, i64 %316
  store float %313, float addrspace(1)* %317, align 4, !tbaa !5
  %318 = add nuw nsw i32 %285, 4
  %319 = add nuw i32 %286, 4
  %320 = icmp eq i32 %319, %245
  br i1 %320, label %321, label %284, !llvm.loop !20

321:                                              ; preds = %284, %241
  %322 = phi i32 [ 0, %241 ], [ %318, %284 ]
  %323 = icmp eq i32 %242, 0
  br i1 %323, label %337, label %324

324:                                              ; preds = %321, %324
  %325 = phi i32 [ %334, %324 ], [ %322, %321 ]
  %326 = phi i32 [ %335, %324 ], [ 0, %321 ]
  %327 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %325
  %328 = load float, float addrspace(3)* %327, align 4, !tbaa !5
  %329 = fdiv contract float %328, %240
  %330 = mul nsw i32 %325, %3
  %331 = add nsw i32 %330, %6
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %0, i64 %332
  store float %329, float addrspace(1)* %333, align 4, !tbaa !5
  %334 = add nuw nsw i32 %325, 1
  %335 = add i32 %326, 1
  %336 = icmp eq i32 %335, %242
  br i1 %336, label %337, label %324, !llvm.loop !21

337:                                              ; preds = %321, %324, %239, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !11}
