; ModuleID = '../data/hip_kernels/90/2/main.cu'
source_filename = "../data/hip_kernels/90/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden = internal unnamed_addr addrspace(3) global [30 x [30 x float]] undef, align 16
@_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27convolution_backward_kernelPfS_S_S_S_iiiiiiS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, float addrspace(1)* nocapture readonly %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = sdiv i32 %5, 16
  %16 = freeze i32 %14
  %17 = freeze i32 %15
  %18 = udiv i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = freeze i32 %19
  %21 = freeze i32 %15
  %22 = udiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = shl i32 %24, 4
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = add i32 %25, %26
  %28 = mul i32 %18, %17
  %29 = sub i32 %16, %28
  %30 = shl i32 %29, 4
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %32 = add i32 %30, %31
  %33 = add nsw i32 %10, -1
  %34 = sub i32 1, %10
  %35 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 6
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 2, !range !5, !invariant.load !6
  %39 = zext i16 %38 to i32
  %40 = mul i32 %14, %39
  %41 = add i32 %40, %31
  %42 = getelementptr i8, i8 addrspace(4)* %35, i64 4
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !5, !invariant.load !6
  %45 = zext i16 %44 to i32
  %46 = mul i32 %19, %45
  %47 = mul i32 %46, %41
  %48 = add i32 %47, %26
  %49 = urem i32 %48, %12
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %11, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = mul i32 %5, %5
  %54 = mul i32 %53, %7
  %55 = mul i32 %54, %18
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = mul i32 %53, %22
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %57, i64 %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp sgt i32 %9, 0
  br i1 %61, label %62, label %130

62:                                               ; preds = %13
  %63 = mul i32 %8, %8
  %64 = mul i32 %63, %9
  %65 = mul i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = icmp ult i32 %26, %10
  %69 = icmp ult i32 %31, %10
  %70 = select i1 %68, i1 %69, i1 false
  %71 = mul i32 %10, %10
  %72 = mul i32 %71, %7
  %73 = mul i32 %71, %22
  %74 = sext i32 %73 to i64
  %75 = sub i32 %33, %31
  %76 = mul i32 %75, %10
  %77 = xor i32 %26, -1
  %78 = add i32 %77, %10
  %79 = add i32 %78, %76
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %31, i32 %26
  %82 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %31, i32 %26
  %83 = icmp slt i32 %27, %33
  %84 = icmp slt i32 %32, %33
  %85 = select i1 %83, i1 true, i1 %84
  %86 = sub nsw i32 %32, %33
  %87 = mul nsw i32 %86, %5
  %88 = add i32 %27, %34
  %89 = add nsw i32 %88, %87
  %90 = sext i32 %89 to i64
  %91 = shl nsw i32 %33, 1
  %92 = icmp ult i32 %26, %91
  %93 = add nuw nsw i32 %26, 16
  %94 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %31, i32 %93
  %95 = add nsw i32 %27, 16
  %96 = add nsw i32 %33, %8
  %97 = icmp sge i32 %95, %96
  %98 = mul nsw i32 %86, %8
  %99 = add i32 %95, %34
  %100 = add nsw i32 %99, %98
  %101 = sext i32 %100 to i64
  %102 = icmp ult i32 %31, %91
  %103 = add nuw nsw i32 %31, 16
  %104 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %103, i32 %26
  %105 = add nsw i32 %32, 16
  %106 = icmp sge i32 %105, %96
  %107 = sub nsw i32 %105, %33
  %108 = mul nsw i32 %107, %8
  %109 = add nsw i32 %88, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %103, i32 %93
  %112 = add nsw i32 %99, %108
  %113 = sext i32 %112 to i64
  %114 = icmp sgt i32 %10, 0
  %115 = add i32 %31, %6
  %116 = add i32 %26, %6
  %117 = mul nsw i32 %32, %5
  %118 = add nsw i32 %117, %27
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %60, i64 %119
  %121 = getelementptr float, float addrspace(1)* %1, i64 %74
  %122 = getelementptr float, float addrspace(1)* %121, i64 %80
  %123 = select i1 %84, i1 true, i1 %97
  %124 = select i1 %83, i1 true, i1 %106
  %125 = select i1 %106, i1 true, i1 %97
  %126 = and i32 %10, 7
  %127 = icmp ult i32 %10, 8
  %128 = and i32 %10, -8
  %129 = icmp eq i32 %126, 0
  br label %145

130:                                              ; preds = %190, %13
  %131 = phi float [ 0.000000e+00, %13 ], [ %191, %190 ]
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %133 = getelementptr inbounds float, float addrspace(1)* %132, i64 %59
  %134 = sext i32 %22 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fadd contract float %131, %136
  %138 = fcmp contract olt float %52, %137
  %139 = mul nsw i32 %32, %5
  %140 = add nsw i32 %139, %27
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %133, i64 %141
  %143 = select i1 %138, float 1.000000e+00, float 0.000000e+00
  store float %143, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = getelementptr inbounds float, float addrspace(1)* %60, i64 %141
  store float %137, float addrspace(1)* %144, align 4, !tbaa !7
  ret void

145:                                              ; preds = %62, %190
  %146 = phi float [ 0.000000e+00, %62 ], [ %191, %190 ]
  %147 = phi i32 [ 0, %62 ], [ %192, %190 ]
  %148 = mul i32 %63, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %67, i64 %149
  br i1 %70, label %151, label %156

151:                                              ; preds = %145
  %152 = mul i32 %72, %147
  %153 = sext i32 %152 to i64
  %154 = getelementptr float, float addrspace(1)* %122, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  store float %155, float addrspace(3)* %81, align 4, !tbaa !7
  br label %156

156:                                              ; preds = %151, %145
  br i1 %85, label %160, label %157

157:                                              ; preds = %156
  %158 = getelementptr inbounds float, float addrspace(1)* %150, i64 %90
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  br label %160

160:                                              ; preds = %156, %157
  %161 = phi float [ %159, %157 ], [ 0.000000e+00, %156 ]
  store float %161, float addrspace(3)* %82, align 4, !tbaa !7
  br i1 %92, label %162, label %168

162:                                              ; preds = %160
  br i1 %123, label %166, label %163

163:                                              ; preds = %162
  %164 = getelementptr inbounds float, float addrspace(1)* %150, i64 %101
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  br label %166

166:                                              ; preds = %162, %163
  %167 = phi float [ %165, %163 ], [ 0.000000e+00, %162 ]
  store float %167, float addrspace(3)* %94, align 4, !tbaa !7
  br label %168

168:                                              ; preds = %166, %160
  br i1 %102, label %169, label %181

169:                                              ; preds = %168
  br i1 %124, label %173, label %170

170:                                              ; preds = %169
  %171 = getelementptr inbounds float, float addrspace(1)* %150, i64 %110
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  br label %173

173:                                              ; preds = %169, %170
  %174 = phi float [ %172, %170 ], [ 0.000000e+00, %169 ]
  store float %174, float addrspace(3)* %104, align 4, !tbaa !7
  br i1 %92, label %175, label %181

175:                                              ; preds = %173
  br i1 %125, label %179, label %176

176:                                              ; preds = %175
  %177 = getelementptr inbounds float, float addrspace(1)* %150, i64 %113
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  br label %179

179:                                              ; preds = %175, %176
  %180 = phi float [ %178, %176 ], [ 0.000000e+00, %175 ]
  store float %180, float addrspace(3)* %111, align 4, !tbaa !7
  br label %181

181:                                              ; preds = %179, %173, %168
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %114, label %182, label %190

182:                                              ; preds = %181
  %183 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %182, %216
  %185 = phi float [ %218, %216 ], [ %183, %182 ]
  %186 = phi i32 [ %219, %216 ], [ 0, %182 ]
  %187 = phi float [ %217, %216 ], [ %146, %182 ]
  %188 = add i32 %115, %186
  br i1 %127, label %194, label %221

189:                                              ; preds = %216
  store float %218, float addrspace(1)* %120, align 4, !tbaa !7
  br label %190

190:                                              ; preds = %189, %181
  %191 = phi float [ %146, %181 ], [ %217, %189 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = add nuw nsw i32 %147, 1
  %193 = icmp eq i32 %192, %9
  br i1 %193, label %130, label %145, !llvm.loop !11

194:                                              ; preds = %221, %184
  %195 = phi float [ undef, %184 ], [ %295, %221 ]
  %196 = phi float [ undef, %184 ], [ %296, %221 ]
  %197 = phi float [ %185, %184 ], [ %296, %221 ]
  %198 = phi i32 [ 0, %184 ], [ %297, %221 ]
  %199 = phi float [ %187, %184 ], [ %295, %221 ]
  br i1 %129, label %216, label %200

200:                                              ; preds = %194, %200
  %201 = phi float [ %212, %200 ], [ %197, %194 ]
  %202 = phi i32 [ %213, %200 ], [ %198, %194 ]
  %203 = phi float [ %211, %200 ], [ %199, %194 ]
  %204 = phi i32 [ %214, %200 ], [ 0, %194 ]
  %205 = add i32 %116, %202
  %206 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !7
  %208 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %202
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !7
  %210 = fmul contract float %207, %209
  %211 = fadd contract float %203, %210
  %212 = fadd contract float %201, %211
  %213 = add nuw nsw i32 %202, 1
  %214 = add i32 %204, 1
  %215 = icmp eq i32 %214, %126
  br i1 %215, label %216, label %200, !llvm.loop !13

216:                                              ; preds = %200, %194
  %217 = phi float [ %195, %194 ], [ %211, %200 ]
  %218 = phi float [ %196, %194 ], [ %212, %200 ]
  %219 = add nuw nsw i32 %186, 1
  %220 = icmp eq i32 %219, %10
  br i1 %220, label %189, label %184, !llvm.loop !15

221:                                              ; preds = %184, %221
  %222 = phi float [ %296, %221 ], [ %185, %184 ]
  %223 = phi i32 [ %297, %221 ], [ 0, %184 ]
  %224 = phi float [ %295, %221 ], [ %187, %184 ]
  %225 = phi i32 [ %298, %221 ], [ 0, %184 ]
  %226 = add i32 %116, %223
  %227 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %226
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !7
  %229 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %223
  %230 = load float, float addrspace(3)* %229, align 16, !tbaa !7
  %231 = fmul contract float %228, %230
  %232 = fadd contract float %224, %231
  %233 = fadd contract float %222, %232
  %234 = or i32 %223, 1
  %235 = add i32 %116, %234
  %236 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %235
  %237 = load float, float addrspace(3)* %236, align 4, !tbaa !7
  %238 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %234
  %239 = load float, float addrspace(3)* %238, align 4, !tbaa !7
  %240 = fmul contract float %237, %239
  %241 = fadd contract float %232, %240
  %242 = fadd contract float %233, %241
  %243 = or i32 %223, 2
  %244 = add i32 %116, %243
  %245 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %244
  %246 = load float, float addrspace(3)* %245, align 4, !tbaa !7
  %247 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %243
  %248 = load float, float addrspace(3)* %247, align 8, !tbaa !7
  %249 = fmul contract float %246, %248
  %250 = fadd contract float %241, %249
  %251 = fadd contract float %242, %250
  %252 = or i32 %223, 3
  %253 = add i32 %116, %252
  %254 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !7
  %256 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %252
  %257 = load float, float addrspace(3)* %256, align 4, !tbaa !7
  %258 = fmul contract float %255, %257
  %259 = fadd contract float %250, %258
  %260 = fadd contract float %251, %259
  %261 = or i32 %223, 4
  %262 = add i32 %116, %261
  %263 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %262
  %264 = load float, float addrspace(3)* %263, align 4, !tbaa !7
  %265 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %261
  %266 = load float, float addrspace(3)* %265, align 16, !tbaa !7
  %267 = fmul contract float %264, %266
  %268 = fadd contract float %259, %267
  %269 = fadd contract float %260, %268
  %270 = or i32 %223, 5
  %271 = add i32 %116, %270
  %272 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %271
  %273 = load float, float addrspace(3)* %272, align 4, !tbaa !7
  %274 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %270
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !7
  %276 = fmul contract float %273, %275
  %277 = fadd contract float %268, %276
  %278 = fadd contract float %269, %277
  %279 = or i32 %223, 6
  %280 = add i32 %116, %279
  %281 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %280
  %282 = load float, float addrspace(3)* %281, align 4, !tbaa !7
  %283 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %279
  %284 = load float, float addrspace(3)* %283, align 8, !tbaa !7
  %285 = fmul contract float %282, %284
  %286 = fadd contract float %277, %285
  %287 = fadd contract float %278, %286
  %288 = or i32 %223, 7
  %289 = add i32 %116, %288
  %290 = getelementptr inbounds [30 x [30 x float]], [30 x [30 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE8shHidden, i32 0, i32 %188, i32 %289
  %291 = load float, float addrspace(3)* %290, align 4, !tbaa !7
  %292 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ27convolution_backward_kernelPfS_S_S_S_iiiiiiS_iE12shFlipFilter, i32 0, i32 %186, i32 %288
  %293 = load float, float addrspace(3)* %292, align 4, !tbaa !7
  %294 = fmul contract float %291, %293
  %295 = fadd contract float %286, %294
  %296 = fadd contract float %287, %295
  %297 = add nuw nsw i32 %223, 8
  %298 = add i32 %225, 8
  %299 = icmp eq i32 %298, %128
  br i1 %299, label %194, label %221, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
