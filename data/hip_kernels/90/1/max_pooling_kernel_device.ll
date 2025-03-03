; ModuleID = '../data/hip_kernels/90/1/main.cu'
source_filename = "../data/hip_kernels/90/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm = internal unnamed_addr addrspace(3) global [48 x [48 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18max_pooling_kernelPfS_S_iiiS_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = sdiv i32 %3, 16
  %11 = sdiv i32 %10, %5
  %12 = udiv i32 %9, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = udiv i32 %13, %11
  %15 = sdiv i32 %3, %5
  %16 = sdiv i32 %15, 16
  %17 = urem i32 %13, %16
  %18 = shl i32 %17, 4
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = add i32 %18, %19
  %21 = urem i32 %9, %16
  %22 = shl i32 %21, 4
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = add i32 %22, %23
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = mul i32 %9, %29
  %31 = add i32 %30, %23
  %32 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 4, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = mul i32 %13, %35
  %37 = mul i32 %36, %31
  %38 = add i32 %37, %19
  %39 = urem i32 %38, %7
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %6, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %43 = mul nsw i32 %12, %4
  %44 = mul i32 %3, %3
  %45 = mul i32 %44, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = mul i32 %44, %14
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %47, i64 %49
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %52 = getelementptr inbounds float, float addrspace(1)* %51, i64 %49
  %53 = mul i32 %15, %15
  %54 = icmp sgt i32 %5, 0
  br i1 %54, label %55, label %70

55:                                               ; preds = %8
  %56 = mul nsw i32 %24, %5
  %57 = mul nsw i32 %20, %5
  %58 = mul i32 %23, %5
  %59 = mul i32 %19, %5
  %60 = and i32 %5, 7
  %61 = icmp ult i32 %5, 8
  %62 = and i32 %5, -8
  %63 = icmp eq i32 %60, 0
  br label %64

64:                                               ; preds = %55, %92
  %65 = phi i32 [ 0, %55 ], [ %93, %92 ]
  %66 = add nsw i32 %65, %56
  %67 = mul nsw i32 %66, %3
  %68 = add i32 %67, %57
  %69 = add i32 %65, %58
  br i1 %61, label %78, label %95

70:                                               ; preds = %92, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %54, label %71, label %162

71:                                               ; preds = %70
  %72 = mul i32 %23, %5
  %73 = mul i32 %19, %5
  %74 = and i32 %5, 7
  %75 = icmp ult i32 %5, 8
  %76 = and i32 %5, -8
  %77 = icmp eq i32 %74, 0
  br label %156

78:                                               ; preds = %95, %64
  %79 = phi i32 [ 0, %64 ], [ %153, %95 ]
  br i1 %63, label %92, label %80

80:                                               ; preds = %78, %80
  %81 = phi i32 [ %89, %80 ], [ %79, %78 ]
  %82 = phi i32 [ %90, %80 ], [ 0, %78 ]
  %83 = add i32 %68, %81
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %50, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = add i32 %81, %59
  %88 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %87
  store float %86, float addrspace(3)* %88, align 4, !tbaa !7
  %89 = add nuw nsw i32 %81, 1
  %90 = add i32 %82, 1
  %91 = icmp eq i32 %90, %60
  br i1 %91, label %92, label %80, !llvm.loop !11

92:                                               ; preds = %80, %78
  %93 = add nuw nsw i32 %65, 1
  %94 = icmp eq i32 %93, %5
  br i1 %94, label %70, label %64, !llvm.loop !13

95:                                               ; preds = %64, %95
  %96 = phi i32 [ %153, %95 ], [ 0, %64 ]
  %97 = phi i32 [ %154, %95 ], [ 0, %64 ]
  %98 = add i32 %68, %96
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %50, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = add i32 %96, %59
  %103 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %102
  store float %101, float addrspace(3)* %103, align 4, !tbaa !7
  %104 = or i32 %96, 1
  %105 = add i32 %68, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %50, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !6
  %109 = add i32 %104, %59
  %110 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %109
  store float %108, float addrspace(3)* %110, align 4, !tbaa !7
  %111 = or i32 %96, 2
  %112 = add i32 %68, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %50, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = add i32 %111, %59
  %117 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %116
  store float %115, float addrspace(3)* %117, align 4, !tbaa !7
  %118 = or i32 %96, 3
  %119 = add i32 %68, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %50, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = add i32 %118, %59
  %124 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %123
  store float %122, float addrspace(3)* %124, align 4, !tbaa !7
  %125 = or i32 %96, 4
  %126 = add i32 %68, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %50, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = add i32 %125, %59
  %131 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %130
  store float %129, float addrspace(3)* %131, align 4, !tbaa !7
  %132 = or i32 %96, 5
  %133 = add i32 %68, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %50, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !6
  %137 = add i32 %132, %59
  %138 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %137
  store float %136, float addrspace(3)* %138, align 4, !tbaa !7
  %139 = or i32 %96, 6
  %140 = add i32 %68, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %50, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !6
  %144 = add i32 %139, %59
  %145 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %144
  store float %143, float addrspace(3)* %145, align 4, !tbaa !7
  %146 = or i32 %96, 7
  %147 = add i32 %68, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %50, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !6
  %151 = add i32 %146, %59
  %152 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %69, i32 %151
  store float %150, float addrspace(3)* %152, align 4, !tbaa !7
  %153 = add nuw nsw i32 %96, 8
  %154 = add i32 %97, 8
  %155 = icmp eq i32 %154, %62
  br i1 %155, label %78, label %95, !llvm.loop !15

156:                                              ; preds = %71, %191
  %157 = phi i32 [ 0, %71 ], [ %193, %191 ]
  %158 = phi float [ 0.000000e+00, %71 ], [ %192, %191 ]
  %159 = add i32 %157, %72
  br i1 %75, label %173, label %195

160:                                              ; preds = %191
  %161 = fadd contract float %192, 1.000000e+00
  br label %162

162:                                              ; preds = %160, %70
  %163 = phi float [ 1.000000e+00, %70 ], [ %161, %160 ]
  br i1 %54, label %164, label %271

164:                                              ; preds = %162
  %165 = mul i32 %23, %5
  %166 = mul i32 %19, %5
  %167 = mul nsw i32 %24, %5
  %168 = mul nsw i32 %20, %5
  %169 = and i32 %5, 3
  %170 = icmp ult i32 %5, 4
  %171 = and i32 %5, -4
  %172 = icmp eq i32 %169, 0
  br label %265

173:                                              ; preds = %195, %156
  %174 = phi float [ undef, %156 ], [ %261, %195 ]
  %175 = phi i32 [ 0, %156 ], [ %262, %195 ]
  %176 = phi float [ %158, %156 ], [ %261, %195 ]
  br i1 %77, label %191, label %177

177:                                              ; preds = %173, %177
  %178 = phi i32 [ %188, %177 ], [ %175, %173 ]
  %179 = phi float [ %187, %177 ], [ %176, %173 ]
  %180 = phi i32 [ %189, %177 ], [ 0, %173 ]
  %181 = add i32 %178, %73
  %182 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %181
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !7
  %184 = fcmp contract ogt float %183, 5.000000e+01
  %185 = select i1 %184, float 5.000000e+01, float %183
  %186 = tail call float @llvm.exp.f32(float %185)
  store float %186, float addrspace(3)* %182, align 4, !tbaa !7
  %187 = fadd contract float %179, %186
  %188 = add nuw nsw i32 %178, 1
  %189 = add i32 %180, 1
  %190 = icmp eq i32 %189, %74
  br i1 %190, label %191, label %177, !llvm.loop !16

191:                                              ; preds = %177, %173
  %192 = phi float [ %174, %173 ], [ %187, %177 ]
  %193 = add nuw nsw i32 %157, 1
  %194 = icmp eq i32 %193, %5
  br i1 %194, label %160, label %156, !llvm.loop !17

195:                                              ; preds = %156, %195
  %196 = phi i32 [ %262, %195 ], [ 0, %156 ]
  %197 = phi float [ %261, %195 ], [ %158, %156 ]
  %198 = phi i32 [ %263, %195 ], [ 0, %156 ]
  %199 = add i32 %196, %73
  %200 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %199
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !7
  %202 = fcmp contract ogt float %201, 5.000000e+01
  %203 = select i1 %202, float 5.000000e+01, float %201
  %204 = tail call float @llvm.exp.f32(float %203)
  store float %204, float addrspace(3)* %200, align 4, !tbaa !7
  %205 = fadd contract float %197, %204
  %206 = or i32 %196, 1
  %207 = add i32 %206, %73
  %208 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %207
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !7
  %210 = fcmp contract ogt float %209, 5.000000e+01
  %211 = select i1 %210, float 5.000000e+01, float %209
  %212 = tail call float @llvm.exp.f32(float %211)
  store float %212, float addrspace(3)* %208, align 4, !tbaa !7
  %213 = fadd contract float %205, %212
  %214 = or i32 %196, 2
  %215 = add i32 %214, %73
  %216 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !7
  %218 = fcmp contract ogt float %217, 5.000000e+01
  %219 = select i1 %218, float 5.000000e+01, float %217
  %220 = tail call float @llvm.exp.f32(float %219)
  store float %220, float addrspace(3)* %216, align 4, !tbaa !7
  %221 = fadd contract float %213, %220
  %222 = or i32 %196, 3
  %223 = add i32 %222, %73
  %224 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %223
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !7
  %226 = fcmp contract ogt float %225, 5.000000e+01
  %227 = select i1 %226, float 5.000000e+01, float %225
  %228 = tail call float @llvm.exp.f32(float %227)
  store float %228, float addrspace(3)* %224, align 4, !tbaa !7
  %229 = fadd contract float %221, %228
  %230 = or i32 %196, 4
  %231 = add i32 %230, %73
  %232 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !7
  %234 = fcmp contract ogt float %233, 5.000000e+01
  %235 = select i1 %234, float 5.000000e+01, float %233
  %236 = tail call float @llvm.exp.f32(float %235)
  store float %236, float addrspace(3)* %232, align 4, !tbaa !7
  %237 = fadd contract float %229, %236
  %238 = or i32 %196, 5
  %239 = add i32 %238, %73
  %240 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %239
  %241 = load float, float addrspace(3)* %240, align 4, !tbaa !7
  %242 = fcmp contract ogt float %241, 5.000000e+01
  %243 = select i1 %242, float 5.000000e+01, float %241
  %244 = tail call float @llvm.exp.f32(float %243)
  store float %244, float addrspace(3)* %240, align 4, !tbaa !7
  %245 = fadd contract float %237, %244
  %246 = or i32 %196, 6
  %247 = add i32 %246, %73
  %248 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %247
  %249 = load float, float addrspace(3)* %248, align 4, !tbaa !7
  %250 = fcmp contract ogt float %249, 5.000000e+01
  %251 = select i1 %250, float 5.000000e+01, float %249
  %252 = tail call float @llvm.exp.f32(float %251)
  store float %252, float addrspace(3)* %248, align 4, !tbaa !7
  %253 = fadd contract float %245, %252
  %254 = or i32 %196, 7
  %255 = add i32 %254, %73
  %256 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %159, i32 %255
  %257 = load float, float addrspace(3)* %256, align 4, !tbaa !7
  %258 = fcmp contract ogt float %257, 5.000000e+01
  %259 = select i1 %258, float 5.000000e+01, float %257
  %260 = tail call float @llvm.exp.f32(float %259)
  store float %260, float addrspace(3)* %256, align 4, !tbaa !7
  %261 = fadd contract float %253, %260
  %262 = add nuw nsw i32 %196, 8
  %263 = add i32 %198, 8
  %264 = icmp eq i32 %263, %76
  br i1 %264, label %173, label %195, !llvm.loop !18

265:                                              ; preds = %164, %294
  %266 = phi i32 [ 0, %164 ], [ %295, %294 ]
  %267 = add i32 %266, %165
  %268 = add nsw i32 %266, %167
  %269 = mul nsw i32 %268, %3
  %270 = add i32 %269, %168
  br i1 %170, label %278, label %297

271:                                              ; preds = %294, %162
  %272 = icmp slt i32 %5, 1
  br i1 %272, label %366, label %273

273:                                              ; preds = %271
  %274 = mul i32 %23, %5
  %275 = mul i32 %19, %5
  %276 = mul nsw i32 %24, %5
  %277 = mul nsw i32 %20, %5
  br label %338

278:                                              ; preds = %297, %265
  %279 = phi i32 [ 0, %265 ], [ %335, %297 ]
  br i1 %172, label %294, label %280

280:                                              ; preds = %278, %280
  %281 = phi i32 [ %291, %280 ], [ %279, %278 ]
  %282 = phi i32 [ %292, %280 ], [ 0, %278 ]
  %283 = add i32 %281, %166
  %284 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %267, i32 %283
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !7
  %286 = fdiv contract float %285, %163
  store float %286, float addrspace(3)* %284, align 4, !tbaa !7
  %287 = add i32 %270, %281
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float, float addrspace(1)* %52, i64 %288
  store float %286, float addrspace(1)* %289, align 4, !tbaa !7
  %290 = getelementptr inbounds float, float addrspace(1)* %50, i64 %288
  store float 0.000000e+00, float addrspace(1)* %290, align 4, !tbaa !7
  %291 = add nuw nsw i32 %281, 1
  %292 = add i32 %282, 1
  %293 = icmp eq i32 %292, %169
  br i1 %293, label %294, label %280, !llvm.loop !19

294:                                              ; preds = %280, %278
  %295 = add nuw nsw i32 %266, 1
  %296 = icmp eq i32 %295, %5
  br i1 %296, label %271, label %265, !llvm.loop !20

297:                                              ; preds = %265, %297
  %298 = phi i32 [ %335, %297 ], [ 0, %265 ]
  %299 = phi i32 [ %336, %297 ], [ 0, %265 ]
  %300 = add i32 %298, %166
  %301 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %267, i32 %300
  %302 = load float, float addrspace(3)* %301, align 4, !tbaa !7
  %303 = fdiv contract float %302, %163
  store float %303, float addrspace(3)* %301, align 4, !tbaa !7
  %304 = add i32 %270, %298
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %52, i64 %305
  store float %303, float addrspace(1)* %306, align 4, !tbaa !7
  %307 = getelementptr inbounds float, float addrspace(1)* %50, i64 %305
  store float 0.000000e+00, float addrspace(1)* %307, align 4, !tbaa !7
  %308 = or i32 %298, 1
  %309 = add i32 %308, %166
  %310 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %267, i32 %309
  %311 = load float, float addrspace(3)* %310, align 4, !tbaa !7
  %312 = fdiv contract float %311, %163
  store float %312, float addrspace(3)* %310, align 4, !tbaa !7
  %313 = add i32 %270, %308
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds float, float addrspace(1)* %52, i64 %314
  store float %312, float addrspace(1)* %315, align 4, !tbaa !7
  %316 = getelementptr inbounds float, float addrspace(1)* %50, i64 %314
  store float 0.000000e+00, float addrspace(1)* %316, align 4, !tbaa !7
  %317 = or i32 %298, 2
  %318 = add i32 %317, %166
  %319 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %267, i32 %318
  %320 = load float, float addrspace(3)* %319, align 4, !tbaa !7
  %321 = fdiv contract float %320, %163
  store float %321, float addrspace(3)* %319, align 4, !tbaa !7
  %322 = add i32 %270, %317
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %52, i64 %323
  store float %321, float addrspace(1)* %324, align 4, !tbaa !7
  %325 = getelementptr inbounds float, float addrspace(1)* %50, i64 %323
  store float 0.000000e+00, float addrspace(1)* %325, align 4, !tbaa !7
  %326 = or i32 %298, 3
  %327 = add i32 %326, %166
  %328 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %267, i32 %327
  %329 = load float, float addrspace(3)* %328, align 4, !tbaa !7
  %330 = fdiv contract float %329, %163
  store float %330, float addrspace(3)* %328, align 4, !tbaa !7
  %331 = add i32 %270, %326
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds float, float addrspace(1)* %52, i64 %332
  store float %330, float addrspace(1)* %333, align 4, !tbaa !7
  %334 = getelementptr inbounds float, float addrspace(1)* %50, i64 %332
  store float 0.000000e+00, float addrspace(1)* %334, align 4, !tbaa !7
  %335 = add nuw nsw i32 %298, 4
  %336 = add i32 %299, 4
  %337 = icmp eq i32 %336, %171
  br i1 %337, label %278, label %297, !llvm.loop !21

338:                                              ; preds = %273, %346
  %339 = phi i32 [ 0, %273 ], [ %347, %346 ]
  %340 = phi float [ 0.000000e+00, %273 ], [ %356, %346 ]
  %341 = add i32 %339, %274
  %342 = add nsw i32 %339, %276
  %343 = mul nsw i32 %342, %3
  %344 = add i32 %343, %277
  br label %350

345:                                              ; preds = %346
  br i1 %357, label %367, label %366

346:                                              ; preds = %362
  %347 = add nuw nsw i32 %339, 1
  %348 = icmp sge i32 %347, %5
  %349 = select i1 %348, i1 true, i1 %357
  br i1 %349, label %345, label %338, !llvm.loop !22

350:                                              ; preds = %338, %362
  %351 = phi i32 [ 0, %338 ], [ %363, %362 ]
  %352 = phi float [ %340, %338 ], [ %356, %362 ]
  %353 = add i32 %351, %275
  %354 = getelementptr inbounds [48 x [48 x float]], [48 x [48 x float]] addrspace(3)* @_ZZ18max_pooling_kernelPfS_S_iiiS_iE4shFm, i32 0, i32 %341, i32 %353
  %355 = load float, float addrspace(3)* %354, align 4, !tbaa !7
  %356 = fadd contract float %352, %355
  %357 = fcmp contract olt float %42, %356
  br i1 %357, label %358, label %362

358:                                              ; preds = %350
  %359 = add i32 %344, %351
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds float, float addrspace(1)* %50, i64 %360
  store float 1.000000e+00, float addrspace(1)* %361, align 4, !tbaa !7
  br label %362

362:                                              ; preds = %350, %358
  %363 = add nuw nsw i32 %351, 1
  %364 = icmp sge i32 %363, %5
  %365 = select i1 %364, i1 true, i1 %357
  br i1 %365, label %346, label %350, !llvm.loop !23

366:                                              ; preds = %271, %345
  br label %367

367:                                              ; preds = %345, %366
  %368 = phi float [ 0.000000e+00, %366 ], [ 1.000000e+00, %345 ]
  %369 = mul i32 %53, %43
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds float, float addrspace(1)* %2, i64 %370
  %372 = mul i32 %53, %14
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds float, float addrspace(1)* %371, i64 %373
  %375 = mul i32 %15, %23
  %376 = add i32 %375, %19
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %374, i64 %377
  store float %368, float addrspace(1)* %378, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #2

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14}
