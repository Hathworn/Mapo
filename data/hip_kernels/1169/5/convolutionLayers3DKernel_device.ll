; ModuleID = '../data/hip_kernels/1169/5/main.cu'
source_filename = "../data/hip_kernels/1169/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global [320 x float] zeroinitializer, align 16
@_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data = internal unnamed_addr addrspace(3) global [8 x [8 x [65 x float]]] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([320 x float] addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25convolutionLayers3DKernelPfS_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 3
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 3
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %17 = shl i32 %16, 5
  %18 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %19 = add nsw i32 %18, -16
  %20 = add i32 %19, %17
  %21 = mul nsw i32 %20, %3
  %22 = add nsw i32 %15, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %11, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = mul nsw i32 %3, %2
  %28 = mul nsw i32 %5, 80
  %29 = sext i32 %28 to i64
  %30 = shl nsw i32 %27, 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %26, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = add nuw nsw i32 %18, 16
  %35 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %34
  store float %33, float addrspace(3)* %35, align 4, !tbaa !5
  %36 = mul nsw i32 %27, 24
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %26, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = add nuw nsw i32 %18, 24
  %41 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %40
  store float %39, float addrspace(3)* %41, align 4, !tbaa !5
  %42 = shl nsw i32 %27, 5
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %26, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = add nuw nsw i32 %18, 32
  %47 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %46
  store float %45, float addrspace(3)* %47, align 4, !tbaa !5
  %48 = mul nsw i32 %27, 40
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %26, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = add nuw nsw i32 %18, 40
  %53 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %52
  store float %51, float addrspace(3)* %53, align 4, !tbaa !5
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %55 = icmp sgt i32 %20, -1
  br i1 %55, label %56, label %58

56:                                               ; preds = %7
  %57 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %58

58:                                               ; preds = %7, %56
  %59 = phi contract float [ %57, %56 ], [ 0.000000e+00, %7 ]
  %60 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %18
  store float %59, float addrspace(3)* %60, align 4, !tbaa !5
  %61 = icmp sgt i32 %20, -9
  br i1 %61, label %62, label %67

62:                                               ; preds = %58
  %63 = shl nsw i32 %27, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %26, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %67

67:                                               ; preds = %62, %58
  %68 = phi contract float [ %66, %62 ], [ 0.000000e+00, %58 ]
  %69 = add nuw nsw i32 %18, 8
  %70 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %69
  store float %68, float addrspace(3)* %70, align 4, !tbaa !5
  %71 = add nsw i32 %20, 48
  %72 = icmp slt i32 %71, %4
  br i1 %72, label %73, label %78

73:                                               ; preds = %67
  %74 = mul nsw i32 %27, 48
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %26, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %78

78:                                               ; preds = %67, %73
  %79 = phi contract float [ %77, %73 ], [ 0.000000e+00, %67 ]
  %80 = add nuw nsw i32 %18, 48
  %81 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %80
  store float %79, float addrspace(3)* %81, align 4, !tbaa !5
  %82 = add nsw i32 %20, 56
  %83 = icmp slt i32 %82, %4
  br i1 %83, label %84, label %89

84:                                               ; preds = %78
  %85 = mul nsw i32 %27, 56
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %26, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %89

89:                                               ; preds = %84, %78
  %90 = phi contract float [ %88, %84 ], [ 0.000000e+00, %78 ]
  %91 = add nuw nsw i32 %18, 56
  %92 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %91
  store float %90, float addrspace(3)* %92, align 4, !tbaa !5
  %93 = getelementptr inbounds [320 x float], [320 x float] addrspace(4)* @c_Kernel, i64 0, i64 %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = sub i32 0, %6
  %95 = icmp slt i32 %6, 0
  %96 = tail call i32 @llvm.abs.i32(i32 %6, i1 false)
  br i1 %95, label %236, label %97

97:                                               ; preds = %89
  %98 = add i32 %96, %6
  %99 = add i32 %98, 1
  %100 = and i32 %99, 7
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %118, label %102

102:                                              ; preds = %97, %102
  %103 = phi i32 [ %115, %102 ], [ %94, %97 ]
  %104 = phi float [ %114, %102 ], [ 0.000000e+00, %97 ]
  %105 = phi i32 [ %116, %102 ], [ 0, %97 ]
  %106 = sub nsw i32 %6, %103
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(4)* %93, i64 %107
  %109 = load float, float addrspace(4)* %108, align 4, !tbaa !5
  %110 = add i32 %34, %103
  %111 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %110
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !5
  %113 = fmul contract float %109, %112
  %114 = fadd contract float %104, %113
  %115 = add i32 %103, 1
  %116 = add i32 %105, 1
  %117 = icmp eq i32 %116, %100
  br i1 %117, label %118, label %102, !llvm.loop !10

118:                                              ; preds = %102, %97
  %119 = phi float [ undef, %97 ], [ %114, %102 ]
  %120 = phi i32 [ %94, %97 ], [ %115, %102 ]
  %121 = phi float [ 0.000000e+00, %97 ], [ %114, %102 ]
  %122 = icmp ult i32 %98, 7
  br i1 %122, label %123, label %483

123:                                              ; preds = %483, %118
  %124 = phi float [ %119, %118 ], [ %564, %483 ]
  %125 = shl i32 %27, 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %54, i64 %126
  store float %124, float addrspace(1)* %127, align 4, !tbaa !5
  br i1 %95, label %355, label %128

128:                                              ; preds = %123
  %129 = and i32 %99, 7
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %147, label %131

131:                                              ; preds = %128, %131
  %132 = phi i32 [ %144, %131 ], [ %94, %128 ]
  %133 = phi float [ %143, %131 ], [ 0.000000e+00, %128 ]
  %134 = phi i32 [ %145, %131 ], [ 0, %128 ]
  %135 = sub nsw i32 %6, %132
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(4)* %93, i64 %136
  %138 = load float, float addrspace(4)* %137, align 4, !tbaa !5
  %139 = add i32 %40, %132
  %140 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %139
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %142 = fmul contract float %138, %141
  %143 = fadd contract float %133, %142
  %144 = add i32 %132, 1
  %145 = add i32 %134, 1
  %146 = icmp eq i32 %145, %129
  br i1 %146, label %147, label %131, !llvm.loop !12

147:                                              ; preds = %131, %128
  %148 = phi float [ undef, %128 ], [ %143, %131 ]
  %149 = phi i32 [ %94, %128 ], [ %144, %131 ]
  %150 = phi float [ 0.000000e+00, %128 ], [ %143, %131 ]
  %151 = icmp ult i32 %98, 7
  br i1 %151, label %240, label %152

152:                                              ; preds = %147, %152
  %153 = phi i32 [ %234, %152 ], [ %149, %147 ]
  %154 = phi float [ %233, %152 ], [ %150, %147 ]
  %155 = sub nsw i32 %6, %153
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(4)* %93, i64 %156
  %158 = load float, float addrspace(4)* %157, align 4, !tbaa !5
  %159 = add i32 %40, %153
  %160 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %159
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = fmul contract float %158, %161
  %163 = fadd contract float %154, %162
  %164 = add i32 %153, 1
  %165 = sub nsw i32 %6, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(4)* %93, i64 %166
  %168 = load float, float addrspace(4)* %167, align 4, !tbaa !5
  %169 = add i32 %40, %164
  %170 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !5
  %172 = fmul contract float %168, %171
  %173 = fadd contract float %163, %172
  %174 = add i32 %153, 2
  %175 = sub nsw i32 %6, %174
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(4)* %93, i64 %176
  %178 = load float, float addrspace(4)* %177, align 4, !tbaa !5
  %179 = add i32 %40, %174
  %180 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %179
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !5
  %182 = fmul contract float %178, %181
  %183 = fadd contract float %173, %182
  %184 = add i32 %153, 3
  %185 = sub nsw i32 %6, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(4)* %93, i64 %186
  %188 = load float, float addrspace(4)* %187, align 4, !tbaa !5
  %189 = add i32 %40, %184
  %190 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %189
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %192 = fmul contract float %188, %191
  %193 = fadd contract float %183, %192
  %194 = add i32 %153, 4
  %195 = sub nsw i32 %6, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(4)* %93, i64 %196
  %198 = load float, float addrspace(4)* %197, align 4, !tbaa !5
  %199 = add i32 %40, %194
  %200 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %199
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !5
  %202 = fmul contract float %198, %201
  %203 = fadd contract float %193, %202
  %204 = add i32 %153, 5
  %205 = sub nsw i32 %6, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(4)* %93, i64 %206
  %208 = load float, float addrspace(4)* %207, align 4, !tbaa !5
  %209 = add i32 %40, %204
  %210 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %209
  %211 = load float, float addrspace(3)* %210, align 4, !tbaa !5
  %212 = fmul contract float %208, %211
  %213 = fadd contract float %203, %212
  %214 = add i32 %153, 6
  %215 = sub nsw i32 %6, %214
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(4)* %93, i64 %216
  %218 = load float, float addrspace(4)* %217, align 4, !tbaa !5
  %219 = add i32 %40, %214
  %220 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %219
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %222 = fmul contract float %218, %221
  %223 = fadd contract float %213, %222
  %224 = add i32 %153, 7
  %225 = sub nsw i32 %6, %224
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds float, float addrspace(4)* %93, i64 %226
  %228 = load float, float addrspace(4)* %227, align 4, !tbaa !5
  %229 = add i32 %40, %224
  %230 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %229
  %231 = load float, float addrspace(3)* %230, align 4, !tbaa !5
  %232 = fmul contract float %228, %231
  %233 = fadd contract float %223, %232
  %234 = add i32 %153, 8
  %235 = icmp eq i32 %224, %96
  br i1 %235, label %240, label %152, !llvm.loop !13

236:                                              ; preds = %89
  %237 = shl i32 %27, 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %54, i64 %238
  store float 0.000000e+00, float addrspace(1)* %239, align 4, !tbaa !5
  br label %240

240:                                              ; preds = %147, %152, %236
  %241 = phi float [ 0.000000e+00, %236 ], [ %148, %147 ], [ %233, %152 ]
  %242 = mul i32 %27, 24
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %54, i64 %243
  store float %241, float addrspace(1)* %244, align 4, !tbaa !5
  br i1 %95, label %474, label %245

245:                                              ; preds = %240
  %246 = add i32 %96, %6
  %247 = add i32 %246, 1
  %248 = and i32 %247, 7
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %266, label %250

250:                                              ; preds = %245, %250
  %251 = phi i32 [ %263, %250 ], [ %94, %245 ]
  %252 = phi float [ %262, %250 ], [ 0.000000e+00, %245 ]
  %253 = phi i32 [ %264, %250 ], [ 0, %245 ]
  %254 = sub nsw i32 %6, %251
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(4)* %93, i64 %255
  %257 = load float, float addrspace(4)* %256, align 4, !tbaa !5
  %258 = add i32 %46, %251
  %259 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %258
  %260 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %261 = fmul contract float %257, %260
  %262 = fadd contract float %252, %261
  %263 = add i32 %251, 1
  %264 = add i32 %253, 1
  %265 = icmp eq i32 %264, %248
  br i1 %265, label %266, label %250, !llvm.loop !15

266:                                              ; preds = %250, %245
  %267 = phi float [ undef, %245 ], [ %262, %250 ]
  %268 = phi i32 [ %94, %245 ], [ %263, %250 ]
  %269 = phi float [ 0.000000e+00, %245 ], [ %262, %250 ]
  %270 = icmp ult i32 %246, 7
  br i1 %270, label %359, label %271

271:                                              ; preds = %266, %271
  %272 = phi i32 [ %353, %271 ], [ %268, %266 ]
  %273 = phi float [ %352, %271 ], [ %269, %266 ]
  %274 = sub nsw i32 %6, %272
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(4)* %93, i64 %275
  %277 = load float, float addrspace(4)* %276, align 4, !tbaa !5
  %278 = add i32 %46, %272
  %279 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %278
  %280 = load float, float addrspace(3)* %279, align 4, !tbaa !5
  %281 = fmul contract float %277, %280
  %282 = fadd contract float %273, %281
  %283 = add i32 %272, 1
  %284 = sub nsw i32 %6, %283
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds float, float addrspace(4)* %93, i64 %285
  %287 = load float, float addrspace(4)* %286, align 4, !tbaa !5
  %288 = add i32 %46, %283
  %289 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %288
  %290 = load float, float addrspace(3)* %289, align 4, !tbaa !5
  %291 = fmul contract float %287, %290
  %292 = fadd contract float %282, %291
  %293 = add i32 %272, 2
  %294 = sub nsw i32 %6, %293
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds float, float addrspace(4)* %93, i64 %295
  %297 = load float, float addrspace(4)* %296, align 4, !tbaa !5
  %298 = add i32 %46, %293
  %299 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %298
  %300 = load float, float addrspace(3)* %299, align 4, !tbaa !5
  %301 = fmul contract float %297, %300
  %302 = fadd contract float %292, %301
  %303 = add i32 %272, 3
  %304 = sub nsw i32 %6, %303
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(4)* %93, i64 %305
  %307 = load float, float addrspace(4)* %306, align 4, !tbaa !5
  %308 = add i32 %46, %303
  %309 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %308
  %310 = load float, float addrspace(3)* %309, align 4, !tbaa !5
  %311 = fmul contract float %307, %310
  %312 = fadd contract float %302, %311
  %313 = add i32 %272, 4
  %314 = sub nsw i32 %6, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds float, float addrspace(4)* %93, i64 %315
  %317 = load float, float addrspace(4)* %316, align 4, !tbaa !5
  %318 = add i32 %46, %313
  %319 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %318
  %320 = load float, float addrspace(3)* %319, align 4, !tbaa !5
  %321 = fmul contract float %317, %320
  %322 = fadd contract float %312, %321
  %323 = add i32 %272, 5
  %324 = sub nsw i32 %6, %323
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float addrspace(4)* %93, i64 %325
  %327 = load float, float addrspace(4)* %326, align 4, !tbaa !5
  %328 = add i32 %46, %323
  %329 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %328
  %330 = load float, float addrspace(3)* %329, align 4, !tbaa !5
  %331 = fmul contract float %327, %330
  %332 = fadd contract float %322, %331
  %333 = add i32 %272, 6
  %334 = sub nsw i32 %6, %333
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds float, float addrspace(4)* %93, i64 %335
  %337 = load float, float addrspace(4)* %336, align 4, !tbaa !5
  %338 = add i32 %46, %333
  %339 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %338
  %340 = load float, float addrspace(3)* %339, align 4, !tbaa !5
  %341 = fmul contract float %337, %340
  %342 = fadd contract float %332, %341
  %343 = add i32 %272, 7
  %344 = sub nsw i32 %6, %343
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds float, float addrspace(4)* %93, i64 %345
  %347 = load float, float addrspace(4)* %346, align 4, !tbaa !5
  %348 = add i32 %46, %343
  %349 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %348
  %350 = load float, float addrspace(3)* %349, align 4, !tbaa !5
  %351 = fmul contract float %347, %350
  %352 = fadd contract float %342, %351
  %353 = add i32 %272, 8
  %354 = icmp eq i32 %343, %96
  br i1 %354, label %359, label %271, !llvm.loop !13

355:                                              ; preds = %123
  %356 = mul i32 %27, 24
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %54, i64 %357
  store float 0.000000e+00, float addrspace(1)* %358, align 4, !tbaa !5
  br label %359

359:                                              ; preds = %266, %271, %355
  %360 = phi float [ 0.000000e+00, %355 ], [ %267, %266 ], [ %352, %271 ]
  %361 = shl i32 %27, 5
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds float, float addrspace(1)* %54, i64 %362
  store float %360, float addrspace(1)* %363, align 4, !tbaa !5
  br i1 %95, label %478, label %364

364:                                              ; preds = %359
  %365 = add i32 %96, %6
  %366 = add i32 %365, 1
  %367 = and i32 %366, 7
  %368 = icmp eq i32 %367, 0
  br i1 %368, label %385, label %369

369:                                              ; preds = %364, %369
  %370 = phi i32 [ %382, %369 ], [ %94, %364 ]
  %371 = phi float [ %381, %369 ], [ 0.000000e+00, %364 ]
  %372 = phi i32 [ %383, %369 ], [ 0, %364 ]
  %373 = sub nsw i32 %6, %370
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds float, float addrspace(4)* %93, i64 %374
  %376 = load float, float addrspace(4)* %375, align 4, !tbaa !5
  %377 = add i32 %52, %370
  %378 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %377
  %379 = load float, float addrspace(3)* %378, align 4, !tbaa !5
  %380 = fmul contract float %376, %379
  %381 = fadd contract float %371, %380
  %382 = add i32 %370, 1
  %383 = add i32 %372, 1
  %384 = icmp eq i32 %383, %367
  br i1 %384, label %385, label %369, !llvm.loop !16

385:                                              ; preds = %369, %364
  %386 = phi float [ undef, %364 ], [ %381, %369 ]
  %387 = phi i32 [ %94, %364 ], [ %382, %369 ]
  %388 = phi float [ 0.000000e+00, %364 ], [ %381, %369 ]
  %389 = icmp ult i32 %365, 7
  br i1 %389, label %478, label %390

390:                                              ; preds = %385, %390
  %391 = phi i32 [ %472, %390 ], [ %387, %385 ]
  %392 = phi float [ %471, %390 ], [ %388, %385 ]
  %393 = sub nsw i32 %6, %391
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float addrspace(4)* %93, i64 %394
  %396 = load float, float addrspace(4)* %395, align 4, !tbaa !5
  %397 = add i32 %52, %391
  %398 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %397
  %399 = load float, float addrspace(3)* %398, align 4, !tbaa !5
  %400 = fmul contract float %396, %399
  %401 = fadd contract float %392, %400
  %402 = add i32 %391, 1
  %403 = sub nsw i32 %6, %402
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float addrspace(4)* %93, i64 %404
  %406 = load float, float addrspace(4)* %405, align 4, !tbaa !5
  %407 = add i32 %52, %402
  %408 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %407
  %409 = load float, float addrspace(3)* %408, align 4, !tbaa !5
  %410 = fmul contract float %406, %409
  %411 = fadd contract float %401, %410
  %412 = add i32 %391, 2
  %413 = sub nsw i32 %6, %412
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds float, float addrspace(4)* %93, i64 %414
  %416 = load float, float addrspace(4)* %415, align 4, !tbaa !5
  %417 = add i32 %52, %412
  %418 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %417
  %419 = load float, float addrspace(3)* %418, align 4, !tbaa !5
  %420 = fmul contract float %416, %419
  %421 = fadd contract float %411, %420
  %422 = add i32 %391, 3
  %423 = sub nsw i32 %6, %422
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds float, float addrspace(4)* %93, i64 %424
  %426 = load float, float addrspace(4)* %425, align 4, !tbaa !5
  %427 = add i32 %52, %422
  %428 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %427
  %429 = load float, float addrspace(3)* %428, align 4, !tbaa !5
  %430 = fmul contract float %426, %429
  %431 = fadd contract float %421, %430
  %432 = add i32 %391, 4
  %433 = sub nsw i32 %6, %432
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds float, float addrspace(4)* %93, i64 %434
  %436 = load float, float addrspace(4)* %435, align 4, !tbaa !5
  %437 = add i32 %52, %432
  %438 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %437
  %439 = load float, float addrspace(3)* %438, align 4, !tbaa !5
  %440 = fmul contract float %436, %439
  %441 = fadd contract float %431, %440
  %442 = add i32 %391, 5
  %443 = sub nsw i32 %6, %442
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds float, float addrspace(4)* %93, i64 %444
  %446 = load float, float addrspace(4)* %445, align 4, !tbaa !5
  %447 = add i32 %52, %442
  %448 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %447
  %449 = load float, float addrspace(3)* %448, align 4, !tbaa !5
  %450 = fmul contract float %446, %449
  %451 = fadd contract float %441, %450
  %452 = add i32 %391, 6
  %453 = sub nsw i32 %6, %452
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds float, float addrspace(4)* %93, i64 %454
  %456 = load float, float addrspace(4)* %455, align 4, !tbaa !5
  %457 = add i32 %52, %452
  %458 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %457
  %459 = load float, float addrspace(3)* %458, align 4, !tbaa !5
  %460 = fmul contract float %456, %459
  %461 = fadd contract float %451, %460
  %462 = add i32 %391, 7
  %463 = sub nsw i32 %6, %462
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds float, float addrspace(4)* %93, i64 %464
  %466 = load float, float addrspace(4)* %465, align 4, !tbaa !5
  %467 = add i32 %52, %462
  %468 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %467
  %469 = load float, float addrspace(3)* %468, align 4, !tbaa !5
  %470 = fmul contract float %466, %469
  %471 = fadd contract float %461, %470
  %472 = add i32 %391, 8
  %473 = icmp eq i32 %462, %96
  br i1 %473, label %478, label %390, !llvm.loop !13

474:                                              ; preds = %240
  %475 = shl i32 %27, 5
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds float, float addrspace(1)* %54, i64 %476
  store float 0.000000e+00, float addrspace(1)* %477, align 4, !tbaa !5
  br label %478

478:                                              ; preds = %385, %390, %474, %359
  %479 = phi float [ 0.000000e+00, %359 ], [ 0.000000e+00, %474 ], [ %386, %385 ], [ %471, %390 ]
  %480 = mul i32 %27, 40
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds float, float addrspace(1)* %54, i64 %481
  store float %479, float addrspace(1)* %482, align 4, !tbaa !5
  ret void

483:                                              ; preds = %118, %483
  %484 = phi i32 [ %565, %483 ], [ %120, %118 ]
  %485 = phi float [ %564, %483 ], [ %121, %118 ]
  %486 = sub nsw i32 %6, %484
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds float, float addrspace(4)* %93, i64 %487
  %489 = load float, float addrspace(4)* %488, align 4, !tbaa !5
  %490 = add i32 %34, %484
  %491 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %490
  %492 = load float, float addrspace(3)* %491, align 4, !tbaa !5
  %493 = fmul contract float %489, %492
  %494 = fadd contract float %485, %493
  %495 = add i32 %484, 1
  %496 = sub nsw i32 %6, %495
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float addrspace(4)* %93, i64 %497
  %499 = load float, float addrspace(4)* %498, align 4, !tbaa !5
  %500 = add i32 %34, %495
  %501 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %500
  %502 = load float, float addrspace(3)* %501, align 4, !tbaa !5
  %503 = fmul contract float %499, %502
  %504 = fadd contract float %494, %503
  %505 = add i32 %484, 2
  %506 = sub nsw i32 %6, %505
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float addrspace(4)* %93, i64 %507
  %509 = load float, float addrspace(4)* %508, align 4, !tbaa !5
  %510 = add i32 %34, %505
  %511 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %510
  %512 = load float, float addrspace(3)* %511, align 4, !tbaa !5
  %513 = fmul contract float %509, %512
  %514 = fadd contract float %504, %513
  %515 = add i32 %484, 3
  %516 = sub nsw i32 %6, %515
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float addrspace(4)* %93, i64 %517
  %519 = load float, float addrspace(4)* %518, align 4, !tbaa !5
  %520 = add i32 %34, %515
  %521 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %520
  %522 = load float, float addrspace(3)* %521, align 4, !tbaa !5
  %523 = fmul contract float %519, %522
  %524 = fadd contract float %514, %523
  %525 = add i32 %484, 4
  %526 = sub nsw i32 %6, %525
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds float, float addrspace(4)* %93, i64 %527
  %529 = load float, float addrspace(4)* %528, align 4, !tbaa !5
  %530 = add i32 %34, %525
  %531 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %530
  %532 = load float, float addrspace(3)* %531, align 4, !tbaa !5
  %533 = fmul contract float %529, %532
  %534 = fadd contract float %524, %533
  %535 = add i32 %484, 5
  %536 = sub nsw i32 %6, %535
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(4)* %93, i64 %537
  %539 = load float, float addrspace(4)* %538, align 4, !tbaa !5
  %540 = add i32 %34, %535
  %541 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %540
  %542 = load float, float addrspace(3)* %541, align 4, !tbaa !5
  %543 = fmul contract float %539, %542
  %544 = fadd contract float %534, %543
  %545 = add i32 %484, 6
  %546 = sub nsw i32 %6, %545
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds float, float addrspace(4)* %93, i64 %547
  %549 = load float, float addrspace(4)* %548, align 4, !tbaa !5
  %550 = add i32 %34, %545
  %551 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %550
  %552 = load float, float addrspace(3)* %551, align 4, !tbaa !5
  %553 = fmul contract float %549, %552
  %554 = fadd contract float %544, %553
  %555 = add i32 %484, 7
  %556 = sub nsw i32 %6, %555
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds float, float addrspace(4)* %93, i64 %557
  %559 = load float, float addrspace(4)* %558, align 4, !tbaa !5
  %560 = add i32 %34, %555
  %561 = getelementptr inbounds [8 x [8 x [65 x float]]], [8 x [8 x [65 x float]]] addrspace(3)* @_ZZ25convolutionLayers3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %10, i32 %14, i32 %560
  %562 = load float, float addrspace(3)* %561, align 4, !tbaa !5
  %563 = fmul contract float %559, %562
  %564 = fadd contract float %554, %563
  %565 = add i32 %484, 8
  %566 = icmp eq i32 %555, %96
  br i1 %566, label %123, label %483, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
