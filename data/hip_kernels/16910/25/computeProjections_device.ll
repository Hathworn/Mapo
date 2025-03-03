; ModuleID = '../data/hip_kernels/16910/25/main.cu'
source_filename = "../data/hip_kernels/16910/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW = internal addrspace(3) global [243 x float] undef, align 16
@_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD = internal addrspace(3) global [1377 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18computeProjectionsPKdPKfPKiS4_S4_S2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = freeze i32 %12
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptosi double %15 to i32
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !4, !amdgpu.noclobber !8
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = icmp slt i32 %22, %16
  br i1 %25, label %28, label %26

26:                                               ; preds = %7
  %27 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %45

28:                                               ; preds = %7
  %29 = mul nsw i32 %23, %16
  %30 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %31 = getelementptr i8, i8 addrspace(4)* %30, i64 4
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  br label %33

33:                                               ; preds = %28, %33
  %34 = phi i32 [ %22, %28 ], [ %43, %33 ]
  %35 = add nsw i32 %34, %29
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !10, !amdgpu.noclobber !8
  %39 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %35
  %40 = addrspacecast float addrspace(3)* %39 to float*
  store volatile float %38, float* %40, align 4, !tbaa !10
  %41 = load i16, i16 addrspace(4)* %32, align 4, !range !12, !invariant.load !8
  %42 = zext i16 %41 to i32
  %43 = add i32 %34, %42
  %44 = icmp slt i32 %43, %16
  br i1 %44, label %33, label %45, !llvm.loop !13

45:                                               ; preds = %33, %26
  %46 = phi i8 addrspace(4)* [ %27, %26 ], [ %30, %33 ]
  %47 = getelementptr i8, i8 addrspace(4)* %46, i64 4
  %48 = bitcast i8 addrspace(4)* %47 to i16 addrspace(4)*
  %49 = load i16, i16 addrspace(4)* %48, align 4, !range !12, !invariant.load !8
  %50 = zext i16 %49 to i32
  %51 = mul nuw nsw i32 %23, %50
  %52 = add nuw nsw i32 %51, %22
  %53 = icmp slt i32 %52, %16
  br i1 %53, label %54, label %162

54:                                               ; preds = %45
  %55 = sext i32 %24 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !15, !amdgpu.noclobber !8
  %58 = icmp sgt i32 %13, 0
  %59 = mul nsw i32 %57, %13
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %55
  %61 = add nsw i32 %21, -1
  %62 = getelementptr i8, i8 addrspace(4)* %46, i64 6
  %63 = bitcast i8 addrspace(4)* %62 to i16 addrspace(4)*
  %64 = load i16, i16 addrspace(4)* %63, align 2
  %65 = zext i16 %64 to i32
  %66 = mul nuw nsw i32 %65, %50
  %67 = and i32 %13, 3
  %68 = icmp ult i32 %13, 4
  %69 = and i32 %13, -4
  %70 = icmp eq i32 %67, 0
  br label %71

71:                                               ; preds = %54, %159
  %72 = phi i32 [ %52, %54 ], [ %160, %159 ]
  br i1 %58, label %73, label %159

73:                                               ; preds = %71
  %74 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !15, !amdgpu.noclobber !8
  %75 = add i32 %61, %72
  %76 = add i32 %75, %74
  br i1 %68, label %138, label %77

77:                                               ; preds = %73, %77
  %78 = phi i32 [ %135, %77 ], [ 0, %73 ]
  %79 = phi i32 [ %136, %77 ], [ 0, %73 ]
  %80 = add nsw i32 %78, %59
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !15, !amdgpu.noclobber !8
  %84 = mul nsw i32 %83, %9
  %85 = add i32 %76, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !10, !amdgpu.noclobber !8
  %89 = mul nsw i32 %78, %16
  %90 = add nsw i32 %89, %72
  %91 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %90
  %92 = addrspacecast float addrspace(3)* %91 to float*
  store volatile float %88, float* %92, align 4, !tbaa !10
  %93 = or i32 %78, 1
  %94 = add nsw i32 %93, %59
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !15, !amdgpu.noclobber !8
  %98 = mul nsw i32 %97, %9
  %99 = add i32 %76, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !10, !amdgpu.noclobber !8
  %103 = mul nsw i32 %93, %16
  %104 = add nsw i32 %103, %72
  %105 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %104
  %106 = addrspacecast float addrspace(3)* %105 to float*
  store volatile float %102, float* %106, align 4, !tbaa !10
  %107 = or i32 %78, 2
  %108 = add nsw i32 %107, %59
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !15, !amdgpu.noclobber !8
  %112 = mul nsw i32 %111, %9
  %113 = add i32 %76, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !10, !amdgpu.noclobber !8
  %117 = mul nsw i32 %107, %16
  %118 = add nsw i32 %117, %72
  %119 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %118
  %120 = addrspacecast float addrspace(3)* %119 to float*
  store volatile float %116, float* %120, align 4, !tbaa !10
  %121 = or i32 %78, 3
  %122 = add nsw i32 %121, %59
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !15, !amdgpu.noclobber !8
  %126 = mul nsw i32 %125, %9
  %127 = add i32 %76, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !10, !amdgpu.noclobber !8
  %131 = mul nsw i32 %121, %16
  %132 = add nsw i32 %131, %72
  %133 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %132
  %134 = addrspacecast float addrspace(3)* %133 to float*
  store volatile float %130, float* %134, align 4, !tbaa !10
  %135 = add nuw nsw i32 %78, 4
  %136 = add i32 %79, 4
  %137 = icmp eq i32 %136, %69
  br i1 %137, label %138, label %77, !llvm.loop !17

138:                                              ; preds = %77, %73
  %139 = phi i32 [ 0, %73 ], [ %135, %77 ]
  br i1 %70, label %159, label %140

140:                                              ; preds = %138, %140
  %141 = phi i32 [ %156, %140 ], [ %139, %138 ]
  %142 = phi i32 [ %157, %140 ], [ 0, %138 ]
  %143 = add nsw i32 %141, %59
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %144
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !15, !amdgpu.noclobber !8
  %147 = mul nsw i32 %146, %9
  %148 = add i32 %76, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !10, !amdgpu.noclobber !8
  %152 = mul nsw i32 %141, %16
  %153 = add nsw i32 %152, %72
  %154 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %153
  %155 = addrspacecast float addrspace(3)* %154 to float*
  store volatile float %151, float* %155, align 4, !tbaa !10
  %156 = add nuw nsw i32 %141, 1
  %157 = add i32 %142, 1
  %158 = icmp eq i32 %157, %67
  br i1 %158, label %159, label %140, !llvm.loop !18

159:                                              ; preds = %138, %140, %71
  %160 = add i32 %66, %72
  %161 = icmp slt i32 %160, %16
  br i1 %161, label %71, label %162, !llvm.loop !20

162:                                              ; preds = %159, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = icmp sgt i32 %16, 0
  br i1 %163, label %164, label %287

164:                                              ; preds = %162
  %165 = mul nsw i32 %22, %16
  %166 = mul nsw i32 %23, %16
  %167 = and i32 %16, 7
  %168 = icmp ult i32 %16, 8
  br i1 %168, label %265, label %169

169:                                              ; preds = %164
  %170 = and i32 %16, -8
  br label %171

171:                                              ; preds = %171, %169
  %172 = phi float [ 0.000000e+00, %169 ], [ %261, %171 ]
  %173 = phi i32 [ 0, %169 ], [ %262, %171 ]
  %174 = phi i32 [ 0, %169 ], [ %263, %171 ]
  %175 = add nsw i32 %173, %165
  %176 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %175
  %177 = addrspacecast float addrspace(3)* %176 to float*
  %178 = load volatile float, float* %177, align 4, !tbaa !10
  %179 = add nsw i32 %173, %166
  %180 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %179
  %181 = addrspacecast float addrspace(3)* %180 to float*
  %182 = load volatile float, float* %181, align 4, !tbaa !10
  %183 = fmul contract float %178, %182
  %184 = fadd contract float %172, %183
  %185 = or i32 %173, 1
  %186 = add nsw i32 %185, %165
  %187 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %186
  %188 = addrspacecast float addrspace(3)* %187 to float*
  %189 = load volatile float, float* %188, align 4, !tbaa !10
  %190 = add nsw i32 %185, %166
  %191 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %190
  %192 = addrspacecast float addrspace(3)* %191 to float*
  %193 = load volatile float, float* %192, align 4, !tbaa !10
  %194 = fmul contract float %189, %193
  %195 = fadd contract float %184, %194
  %196 = or i32 %173, 2
  %197 = add nsw i32 %196, %165
  %198 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %197
  %199 = addrspacecast float addrspace(3)* %198 to float*
  %200 = load volatile float, float* %199, align 4, !tbaa !10
  %201 = add nsw i32 %196, %166
  %202 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %201
  %203 = addrspacecast float addrspace(3)* %202 to float*
  %204 = load volatile float, float* %203, align 4, !tbaa !10
  %205 = fmul contract float %200, %204
  %206 = fadd contract float %195, %205
  %207 = or i32 %173, 3
  %208 = add nsw i32 %207, %165
  %209 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %208
  %210 = addrspacecast float addrspace(3)* %209 to float*
  %211 = load volatile float, float* %210, align 4, !tbaa !10
  %212 = add nsw i32 %207, %166
  %213 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %212
  %214 = addrspacecast float addrspace(3)* %213 to float*
  %215 = load volatile float, float* %214, align 4, !tbaa !10
  %216 = fmul contract float %211, %215
  %217 = fadd contract float %206, %216
  %218 = or i32 %173, 4
  %219 = add nsw i32 %218, %165
  %220 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %219
  %221 = addrspacecast float addrspace(3)* %220 to float*
  %222 = load volatile float, float* %221, align 4, !tbaa !10
  %223 = add nsw i32 %218, %166
  %224 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %223
  %225 = addrspacecast float addrspace(3)* %224 to float*
  %226 = load volatile float, float* %225, align 4, !tbaa !10
  %227 = fmul contract float %222, %226
  %228 = fadd contract float %217, %227
  %229 = or i32 %173, 5
  %230 = add nsw i32 %229, %165
  %231 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %230
  %232 = addrspacecast float addrspace(3)* %231 to float*
  %233 = load volatile float, float* %232, align 4, !tbaa !10
  %234 = add nsw i32 %229, %166
  %235 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %234
  %236 = addrspacecast float addrspace(3)* %235 to float*
  %237 = load volatile float, float* %236, align 4, !tbaa !10
  %238 = fmul contract float %233, %237
  %239 = fadd contract float %228, %238
  %240 = or i32 %173, 6
  %241 = add nsw i32 %240, %165
  %242 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %241
  %243 = addrspacecast float addrspace(3)* %242 to float*
  %244 = load volatile float, float* %243, align 4, !tbaa !10
  %245 = add nsw i32 %240, %166
  %246 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %245
  %247 = addrspacecast float addrspace(3)* %246 to float*
  %248 = load volatile float, float* %247, align 4, !tbaa !10
  %249 = fmul contract float %244, %248
  %250 = fadd contract float %239, %249
  %251 = or i32 %173, 7
  %252 = add nsw i32 %251, %165
  %253 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %252
  %254 = addrspacecast float addrspace(3)* %253 to float*
  %255 = load volatile float, float* %254, align 4, !tbaa !10
  %256 = add nsw i32 %251, %166
  %257 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %256
  %258 = addrspacecast float addrspace(3)* %257 to float*
  %259 = load volatile float, float* %258, align 4, !tbaa !10
  %260 = fmul contract float %255, %259
  %261 = fadd contract float %250, %260
  %262 = add nuw nsw i32 %173, 8
  %263 = add i32 %174, 8
  %264 = icmp eq i32 %263, %170
  br i1 %264, label %265, label %171, !llvm.loop !21

265:                                              ; preds = %171, %164
  %266 = phi float [ undef, %164 ], [ %261, %171 ]
  %267 = phi float [ 0.000000e+00, %164 ], [ %261, %171 ]
  %268 = phi i32 [ 0, %164 ], [ %262, %171 ]
  %269 = icmp eq i32 %167, 0
  br i1 %269, label %287, label %270

270:                                              ; preds = %265, %270
  %271 = phi float [ %283, %270 ], [ %267, %265 ]
  %272 = phi i32 [ %284, %270 ], [ %268, %265 ]
  %273 = phi i32 [ %285, %270 ], [ 0, %265 ]
  %274 = add nsw i32 %272, %165
  %275 = getelementptr inbounds [1377 x float], [1377 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sD, i32 0, i32 %274
  %276 = addrspacecast float addrspace(3)* %275 to float*
  %277 = load volatile float, float* %276, align 4, !tbaa !10
  %278 = add nsw i32 %272, %166
  %279 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ18computeProjectionsPKdPKfPKiS4_S4_S2_PfE2sW, i32 0, i32 %278
  %280 = addrspacecast float addrspace(3)* %279 to float*
  %281 = load volatile float, float* %280, align 4, !tbaa !10
  %282 = fmul contract float %277, %281
  %283 = fadd contract float %271, %282
  %284 = add nuw nsw i32 %272, 1
  %285 = add i32 %273, 1
  %286 = icmp eq i32 %285, %167
  br i1 %286, label %287, label %270, !llvm.loop !22

287:                                              ; preds = %265, %270, %162
  %288 = phi float [ 0.000000e+00, %162 ], [ %266, %265 ], [ %283, %270 ]
  %289 = fptosi double %18 to i32
  %290 = mul i32 %24, %13
  %291 = add i32 %290, %22
  %292 = mul i32 %291, %289
  %293 = add i32 %292, %23
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %6, i64 %294
  store float %288, float addrspace(1)* %295, align 4, !tbaa !10
  ret void
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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !6, i64 0}
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !6, i64 0}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !19}
