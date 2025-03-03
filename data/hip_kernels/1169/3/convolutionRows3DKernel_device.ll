; ModuleID = '../data/hip_kernels/1169/3/main.cu'
source_filename = "../data/hip_kernels/1169/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global [320 x float] zeroinitializer, align 16
@_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data = internal unnamed_addr addrspace(3) global [4 x [4 x [192 x float]]] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([320 x float] addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23convolutionRows3DKernelPfS_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add nsw i32 %10, -32
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 2
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = shl i32 %17, 2
  %19 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, %3
  %22 = add nsw i32 %16, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = mul nsw i32 %5, 80
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %26, i64 32
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = add nuw nsw i32 %10, 32
  %32 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %31
  store float %30, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds float, float addrspace(1)* %26, i64 48
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = add nuw nsw i32 %10, 48
  %36 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %35
  store float %34, float addrspace(3)* %36, align 4, !tbaa !5
  %37 = getelementptr inbounds float, float addrspace(1)* %26, i64 64
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add nuw nsw i32 %10, 64
  %40 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %39
  store float %38, float addrspace(3)* %40, align 4, !tbaa !5
  %41 = getelementptr inbounds float, float addrspace(1)* %26, i64 80
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = add nuw nsw i32 %10, 80
  %44 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %43
  store float %42, float addrspace(3)* %44, align 4, !tbaa !5
  %45 = getelementptr inbounds float, float addrspace(1)* %26, i64 96
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add nuw nsw i32 %10, 96
  %48 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %47
  store float %46, float addrspace(3)* %48, align 4, !tbaa !5
  %49 = getelementptr inbounds float, float addrspace(1)* %26, i64 112
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = add nuw nsw i32 %10, 112
  %52 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %51
  store float %50, float addrspace(3)* %52, align 4, !tbaa !5
  %53 = getelementptr inbounds float, float addrspace(1)* %26, i64 128
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = add nuw nsw i32 %10, 128
  %56 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %55
  store float %54, float addrspace(3)* %56, align 4, !tbaa !5
  %57 = getelementptr inbounds float, float addrspace(1)* %26, i64 144
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = add nuw nsw i32 %10, 144
  %60 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %59
  store float %58, float addrspace(3)* %60, align 4, !tbaa !5
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %62 = icmp sgt i32 %12, -1
  br i1 %62, label %63, label %65

63:                                               ; preds = %7
  %64 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %65

65:                                               ; preds = %7, %63
  %66 = phi contract float [ %64, %63 ], [ 0.000000e+00, %7 ]
  %67 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %10
  store float %66, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = icmp sgt i32 %12, -17
  br i1 %68, label %69, label %72

69:                                               ; preds = %65
  %70 = getelementptr inbounds float, float addrspace(1)* %26, i64 16
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %72

72:                                               ; preds = %69, %65
  %73 = phi contract float [ %71, %69 ], [ 0.000000e+00, %65 ]
  %74 = add nuw nsw i32 %10, 16
  %75 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %74
  store float %73, float addrspace(3)* %75, align 4, !tbaa !5
  %76 = add nsw i32 %12, 160
  %77 = icmp slt i32 %76, %2
  br i1 %77, label %78, label %81

78:                                               ; preds = %72
  %79 = getelementptr inbounds float, float addrspace(1)* %26, i64 160
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %81

81:                                               ; preds = %72, %78
  %82 = phi contract float [ %80, %78 ], [ 0.000000e+00, %72 ]
  %83 = add nuw nsw i32 %10, 160
  %84 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %83
  store float %82, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = add nsw i32 %12, 176
  %86 = icmp slt i32 %85, %2
  br i1 %86, label %87, label %90

87:                                               ; preds = %81
  %88 = getelementptr inbounds float, float addrspace(1)* %26, i64 176
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %90

90:                                               ; preds = %87, %81
  %91 = phi contract float [ %89, %87 ], [ 0.000000e+00, %81 ]
  %92 = add nuw nsw i32 %10, 176
  %93 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %92
  store float %91, float addrspace(3)* %93, align 4, !tbaa !5
  %94 = getelementptr inbounds [320 x float], [320 x float] addrspace(4)* @c_Kernel, i64 0, i64 %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = sub i32 0, %6
  %96 = icmp slt i32 %6, 0
  %97 = tail call i32 @llvm.abs.i32(i32 %6, i1 false)
  br i1 %96, label %235, label %98

98:                                               ; preds = %90
  %99 = add i32 %97, %6
  %100 = add i32 %99, 1
  %101 = and i32 %100, 7
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %119, label %103

103:                                              ; preds = %98, %103
  %104 = phi i32 [ %116, %103 ], [ %95, %98 ]
  %105 = phi float [ %115, %103 ], [ 0.000000e+00, %98 ]
  %106 = phi i32 [ %117, %103 ], [ 0, %98 ]
  %107 = sub nsw i32 %6, %104
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(4)* %94, i64 %108
  %110 = load float, float addrspace(4)* %109, align 4, !tbaa !5
  %111 = add i32 %31, %104
  %112 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %111
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %114 = fmul contract float %110, %113
  %115 = fadd contract float %105, %114
  %116 = add i32 %104, 1
  %117 = add i32 %106, 1
  %118 = icmp eq i32 %117, %101
  br i1 %118, label %119, label %103, !llvm.loop !10

119:                                              ; preds = %103, %98
  %120 = phi float [ undef, %98 ], [ %115, %103 ]
  %121 = phi i32 [ %95, %98 ], [ %116, %103 ]
  %122 = phi float [ 0.000000e+00, %98 ], [ %115, %103 ]
  %123 = icmp ult i32 %99, 7
  br i1 %123, label %124, label %930

124:                                              ; preds = %930, %119
  %125 = phi float [ %120, %119 ], [ %1011, %930 ]
  %126 = getelementptr inbounds float, float addrspace(1)* %61, i64 32
  store float %125, float addrspace(1)* %126, align 4, !tbaa !5
  br i1 %96, label %350, label %127

127:                                              ; preds = %124
  %128 = and i32 %100, 7
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %146, label %130

130:                                              ; preds = %127, %130
  %131 = phi i32 [ %143, %130 ], [ %95, %127 ]
  %132 = phi float [ %142, %130 ], [ 0.000000e+00, %127 ]
  %133 = phi i32 [ %144, %130 ], [ 0, %127 ]
  %134 = sub nsw i32 %6, %131
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(4)* %94, i64 %135
  %137 = load float, float addrspace(4)* %136, align 4, !tbaa !5
  %138 = add i32 %35, %131
  %139 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %141 = fmul contract float %137, %140
  %142 = fadd contract float %132, %141
  %143 = add i32 %131, 1
  %144 = add i32 %133, 1
  %145 = icmp eq i32 %144, %128
  br i1 %145, label %146, label %130, !llvm.loop !12

146:                                              ; preds = %130, %127
  %147 = phi float [ undef, %127 ], [ %142, %130 ]
  %148 = phi i32 [ %95, %127 ], [ %143, %130 ]
  %149 = phi float [ 0.000000e+00, %127 ], [ %142, %130 ]
  %150 = icmp ult i32 %99, 7
  br i1 %150, label %237, label %151

151:                                              ; preds = %146, %151
  %152 = phi i32 [ %233, %151 ], [ %148, %146 ]
  %153 = phi float [ %232, %151 ], [ %149, %146 ]
  %154 = sub nsw i32 %6, %152
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(4)* %94, i64 %155
  %157 = load float, float addrspace(4)* %156, align 4, !tbaa !5
  %158 = add i32 %35, %152
  %159 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !5
  %161 = fmul contract float %157, %160
  %162 = fadd contract float %153, %161
  %163 = add i32 %152, 1
  %164 = sub nsw i32 %6, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(4)* %94, i64 %165
  %167 = load float, float addrspace(4)* %166, align 4, !tbaa !5
  %168 = add i32 %35, %163
  %169 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %168
  %170 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %171 = fmul contract float %167, %170
  %172 = fadd contract float %162, %171
  %173 = add i32 %152, 2
  %174 = sub nsw i32 %6, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(4)* %94, i64 %175
  %177 = load float, float addrspace(4)* %176, align 4, !tbaa !5
  %178 = add i32 %35, %173
  %179 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %178
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !5
  %181 = fmul contract float %177, %180
  %182 = fadd contract float %172, %181
  %183 = add i32 %152, 3
  %184 = sub nsw i32 %6, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(4)* %94, i64 %185
  %187 = load float, float addrspace(4)* %186, align 4, !tbaa !5
  %188 = add i32 %35, %183
  %189 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %188
  %190 = load float, float addrspace(3)* %189, align 4, !tbaa !5
  %191 = fmul contract float %187, %190
  %192 = fadd contract float %182, %191
  %193 = add i32 %152, 4
  %194 = sub nsw i32 %6, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(4)* %94, i64 %195
  %197 = load float, float addrspace(4)* %196, align 4, !tbaa !5
  %198 = add i32 %35, %193
  %199 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = fmul contract float %197, %200
  %202 = fadd contract float %192, %201
  %203 = add i32 %152, 5
  %204 = sub nsw i32 %6, %203
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(4)* %94, i64 %205
  %207 = load float, float addrspace(4)* %206, align 4, !tbaa !5
  %208 = add i32 %35, %203
  %209 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %208
  %210 = load float, float addrspace(3)* %209, align 4, !tbaa !5
  %211 = fmul contract float %207, %210
  %212 = fadd contract float %202, %211
  %213 = add i32 %152, 6
  %214 = sub nsw i32 %6, %213
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(4)* %94, i64 %215
  %217 = load float, float addrspace(4)* %216, align 4, !tbaa !5
  %218 = add i32 %35, %213
  %219 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %218
  %220 = load float, float addrspace(3)* %219, align 4, !tbaa !5
  %221 = fmul contract float %217, %220
  %222 = fadd contract float %212, %221
  %223 = add i32 %152, 7
  %224 = sub nsw i32 %6, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(4)* %94, i64 %225
  %227 = load float, float addrspace(4)* %226, align 4, !tbaa !5
  %228 = add i32 %35, %223
  %229 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %228
  %230 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %231 = fmul contract float %227, %230
  %232 = fadd contract float %222, %231
  %233 = add i32 %152, 8
  %234 = icmp eq i32 %223, %97
  br i1 %234, label %237, label %151, !llvm.loop !13

235:                                              ; preds = %90
  %236 = getelementptr inbounds float, float addrspace(1)* %61, i64 32
  store float 0.000000e+00, float addrspace(1)* %236, align 4, !tbaa !5
  br label %237

237:                                              ; preds = %146, %151, %235
  %238 = phi float [ 0.000000e+00, %235 ], [ %147, %146 ], [ %232, %151 ]
  %239 = getelementptr inbounds float, float addrspace(1)* %61, i64 48
  store float %238, float addrspace(1)* %239, align 4, !tbaa !5
  br i1 %96, label %465, label %240

240:                                              ; preds = %237
  %241 = add i32 %97, %6
  %242 = add i32 %241, 1
  %243 = and i32 %242, 7
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %261, label %245

245:                                              ; preds = %240, %245
  %246 = phi i32 [ %258, %245 ], [ %95, %240 ]
  %247 = phi float [ %257, %245 ], [ 0.000000e+00, %240 ]
  %248 = phi i32 [ %259, %245 ], [ 0, %240 ]
  %249 = sub nsw i32 %6, %246
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds float, float addrspace(4)* %94, i64 %250
  %252 = load float, float addrspace(4)* %251, align 4, !tbaa !5
  %253 = add i32 %39, %246
  %254 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %253
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !5
  %256 = fmul contract float %252, %255
  %257 = fadd contract float %247, %256
  %258 = add i32 %246, 1
  %259 = add i32 %248, 1
  %260 = icmp eq i32 %259, %243
  br i1 %260, label %261, label %245, !llvm.loop !15

261:                                              ; preds = %245, %240
  %262 = phi float [ undef, %240 ], [ %257, %245 ]
  %263 = phi i32 [ %95, %240 ], [ %258, %245 ]
  %264 = phi float [ 0.000000e+00, %240 ], [ %257, %245 ]
  %265 = icmp ult i32 %241, 7
  br i1 %265, label %352, label %266

266:                                              ; preds = %261, %266
  %267 = phi i32 [ %348, %266 ], [ %263, %261 ]
  %268 = phi float [ %347, %266 ], [ %264, %261 ]
  %269 = sub nsw i32 %6, %267
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(4)* %94, i64 %270
  %272 = load float, float addrspace(4)* %271, align 4, !tbaa !5
  %273 = add i32 %39, %267
  %274 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %273
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %276 = fmul contract float %272, %275
  %277 = fadd contract float %268, %276
  %278 = add i32 %267, 1
  %279 = sub nsw i32 %6, %278
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(4)* %94, i64 %280
  %282 = load float, float addrspace(4)* %281, align 4, !tbaa !5
  %283 = add i32 %39, %278
  %284 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %283
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !5
  %286 = fmul contract float %282, %285
  %287 = fadd contract float %277, %286
  %288 = add i32 %267, 2
  %289 = sub nsw i32 %6, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds float, float addrspace(4)* %94, i64 %290
  %292 = load float, float addrspace(4)* %291, align 4, !tbaa !5
  %293 = add i32 %39, %288
  %294 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %293
  %295 = load float, float addrspace(3)* %294, align 4, !tbaa !5
  %296 = fmul contract float %292, %295
  %297 = fadd contract float %287, %296
  %298 = add i32 %267, 3
  %299 = sub nsw i32 %6, %298
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float addrspace(4)* %94, i64 %300
  %302 = load float, float addrspace(4)* %301, align 4, !tbaa !5
  %303 = add i32 %39, %298
  %304 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %303
  %305 = load float, float addrspace(3)* %304, align 4, !tbaa !5
  %306 = fmul contract float %302, %305
  %307 = fadd contract float %297, %306
  %308 = add i32 %267, 4
  %309 = sub nsw i32 %6, %308
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds float, float addrspace(4)* %94, i64 %310
  %312 = load float, float addrspace(4)* %311, align 4, !tbaa !5
  %313 = add i32 %39, %308
  %314 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %313
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = fmul contract float %312, %315
  %317 = fadd contract float %307, %316
  %318 = add i32 %267, 5
  %319 = sub nsw i32 %6, %318
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(4)* %94, i64 %320
  %322 = load float, float addrspace(4)* %321, align 4, !tbaa !5
  %323 = add i32 %39, %318
  %324 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %323
  %325 = load float, float addrspace(3)* %324, align 4, !tbaa !5
  %326 = fmul contract float %322, %325
  %327 = fadd contract float %317, %326
  %328 = add i32 %267, 6
  %329 = sub nsw i32 %6, %328
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float addrspace(4)* %94, i64 %330
  %332 = load float, float addrspace(4)* %331, align 4, !tbaa !5
  %333 = add i32 %39, %328
  %334 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %333
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !5
  %336 = fmul contract float %332, %335
  %337 = fadd contract float %327, %336
  %338 = add i32 %267, 7
  %339 = sub nsw i32 %6, %338
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds float, float addrspace(4)* %94, i64 %340
  %342 = load float, float addrspace(4)* %341, align 4, !tbaa !5
  %343 = add i32 %39, %338
  %344 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %343
  %345 = load float, float addrspace(3)* %344, align 4, !tbaa !5
  %346 = fmul contract float %342, %345
  %347 = fadd contract float %337, %346
  %348 = add i32 %267, 8
  %349 = icmp eq i32 %338, %97
  br i1 %349, label %352, label %266, !llvm.loop !13

350:                                              ; preds = %124
  %351 = getelementptr inbounds float, float addrspace(1)* %61, i64 48
  store float 0.000000e+00, float addrspace(1)* %351, align 4, !tbaa !5
  br label %352

352:                                              ; preds = %261, %266, %350
  %353 = phi float [ 0.000000e+00, %350 ], [ %262, %261 ], [ %347, %266 ]
  %354 = getelementptr inbounds float, float addrspace(1)* %61, i64 64
  store float %353, float addrspace(1)* %354, align 4, !tbaa !5
  br i1 %96, label %580, label %355

355:                                              ; preds = %352
  %356 = add i32 %97, %6
  %357 = add i32 %356, 1
  %358 = and i32 %357, 7
  %359 = icmp eq i32 %358, 0
  br i1 %359, label %376, label %360

360:                                              ; preds = %355, %360
  %361 = phi i32 [ %373, %360 ], [ %95, %355 ]
  %362 = phi float [ %372, %360 ], [ 0.000000e+00, %355 ]
  %363 = phi i32 [ %374, %360 ], [ 0, %355 ]
  %364 = sub nsw i32 %6, %361
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds float, float addrspace(4)* %94, i64 %365
  %367 = load float, float addrspace(4)* %366, align 4, !tbaa !5
  %368 = add i32 %43, %361
  %369 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %368
  %370 = load float, float addrspace(3)* %369, align 4, !tbaa !5
  %371 = fmul contract float %367, %370
  %372 = fadd contract float %362, %371
  %373 = add i32 %361, 1
  %374 = add i32 %363, 1
  %375 = icmp eq i32 %374, %358
  br i1 %375, label %376, label %360, !llvm.loop !16

376:                                              ; preds = %360, %355
  %377 = phi float [ undef, %355 ], [ %372, %360 ]
  %378 = phi i32 [ %95, %355 ], [ %373, %360 ]
  %379 = phi float [ 0.000000e+00, %355 ], [ %372, %360 ]
  %380 = icmp ult i32 %356, 7
  br i1 %380, label %467, label %381

381:                                              ; preds = %376, %381
  %382 = phi i32 [ %463, %381 ], [ %378, %376 ]
  %383 = phi float [ %462, %381 ], [ %379, %376 ]
  %384 = sub nsw i32 %6, %382
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds float, float addrspace(4)* %94, i64 %385
  %387 = load float, float addrspace(4)* %386, align 4, !tbaa !5
  %388 = add i32 %43, %382
  %389 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %388
  %390 = load float, float addrspace(3)* %389, align 4, !tbaa !5
  %391 = fmul contract float %387, %390
  %392 = fadd contract float %383, %391
  %393 = add i32 %382, 1
  %394 = sub nsw i32 %6, %393
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds float, float addrspace(4)* %94, i64 %395
  %397 = load float, float addrspace(4)* %396, align 4, !tbaa !5
  %398 = add i32 %43, %393
  %399 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %398
  %400 = load float, float addrspace(3)* %399, align 4, !tbaa !5
  %401 = fmul contract float %397, %400
  %402 = fadd contract float %392, %401
  %403 = add i32 %382, 2
  %404 = sub nsw i32 %6, %403
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds float, float addrspace(4)* %94, i64 %405
  %407 = load float, float addrspace(4)* %406, align 4, !tbaa !5
  %408 = add i32 %43, %403
  %409 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %408
  %410 = load float, float addrspace(3)* %409, align 4, !tbaa !5
  %411 = fmul contract float %407, %410
  %412 = fadd contract float %402, %411
  %413 = add i32 %382, 3
  %414 = sub nsw i32 %6, %413
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds float, float addrspace(4)* %94, i64 %415
  %417 = load float, float addrspace(4)* %416, align 4, !tbaa !5
  %418 = add i32 %43, %413
  %419 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %418
  %420 = load float, float addrspace(3)* %419, align 4, !tbaa !5
  %421 = fmul contract float %417, %420
  %422 = fadd contract float %412, %421
  %423 = add i32 %382, 4
  %424 = sub nsw i32 %6, %423
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(4)* %94, i64 %425
  %427 = load float, float addrspace(4)* %426, align 4, !tbaa !5
  %428 = add i32 %43, %423
  %429 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %428
  %430 = load float, float addrspace(3)* %429, align 4, !tbaa !5
  %431 = fmul contract float %427, %430
  %432 = fadd contract float %422, %431
  %433 = add i32 %382, 5
  %434 = sub nsw i32 %6, %433
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds float, float addrspace(4)* %94, i64 %435
  %437 = load float, float addrspace(4)* %436, align 4, !tbaa !5
  %438 = add i32 %43, %433
  %439 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %438
  %440 = load float, float addrspace(3)* %439, align 4, !tbaa !5
  %441 = fmul contract float %437, %440
  %442 = fadd contract float %432, %441
  %443 = add i32 %382, 6
  %444 = sub nsw i32 %6, %443
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds float, float addrspace(4)* %94, i64 %445
  %447 = load float, float addrspace(4)* %446, align 4, !tbaa !5
  %448 = add i32 %43, %443
  %449 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %448
  %450 = load float, float addrspace(3)* %449, align 4, !tbaa !5
  %451 = fmul contract float %447, %450
  %452 = fadd contract float %442, %451
  %453 = add i32 %382, 7
  %454 = sub nsw i32 %6, %453
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds float, float addrspace(4)* %94, i64 %455
  %457 = load float, float addrspace(4)* %456, align 4, !tbaa !5
  %458 = add i32 %43, %453
  %459 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %458
  %460 = load float, float addrspace(3)* %459, align 4, !tbaa !5
  %461 = fmul contract float %457, %460
  %462 = fadd contract float %452, %461
  %463 = add i32 %382, 8
  %464 = icmp eq i32 %453, %97
  br i1 %464, label %467, label %381, !llvm.loop !13

465:                                              ; preds = %237
  %466 = getelementptr inbounds float, float addrspace(1)* %61, i64 64
  store float 0.000000e+00, float addrspace(1)* %466, align 4, !tbaa !5
  br label %467

467:                                              ; preds = %376, %381, %465
  %468 = phi float [ 0.000000e+00, %465 ], [ %377, %376 ], [ %462, %381 ]
  %469 = getelementptr inbounds float, float addrspace(1)* %61, i64 80
  store float %468, float addrspace(1)* %469, align 4, !tbaa !5
  br i1 %96, label %695, label %470

470:                                              ; preds = %467
  %471 = add i32 %97, %6
  %472 = add i32 %471, 1
  %473 = and i32 %472, 7
  %474 = icmp eq i32 %473, 0
  br i1 %474, label %491, label %475

475:                                              ; preds = %470, %475
  %476 = phi i32 [ %488, %475 ], [ %95, %470 ]
  %477 = phi float [ %487, %475 ], [ 0.000000e+00, %470 ]
  %478 = phi i32 [ %489, %475 ], [ 0, %470 ]
  %479 = sub nsw i32 %6, %476
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds float, float addrspace(4)* %94, i64 %480
  %482 = load float, float addrspace(4)* %481, align 4, !tbaa !5
  %483 = add i32 %47, %476
  %484 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %483
  %485 = load float, float addrspace(3)* %484, align 4, !tbaa !5
  %486 = fmul contract float %482, %485
  %487 = fadd contract float %477, %486
  %488 = add i32 %476, 1
  %489 = add i32 %478, 1
  %490 = icmp eq i32 %489, %473
  br i1 %490, label %491, label %475, !llvm.loop !17

491:                                              ; preds = %475, %470
  %492 = phi float [ undef, %470 ], [ %487, %475 ]
  %493 = phi i32 [ %95, %470 ], [ %488, %475 ]
  %494 = phi float [ 0.000000e+00, %470 ], [ %487, %475 ]
  %495 = icmp ult i32 %471, 7
  br i1 %495, label %582, label %496

496:                                              ; preds = %491, %496
  %497 = phi i32 [ %578, %496 ], [ %493, %491 ]
  %498 = phi float [ %577, %496 ], [ %494, %491 ]
  %499 = sub nsw i32 %6, %497
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(4)* %94, i64 %500
  %502 = load float, float addrspace(4)* %501, align 4, !tbaa !5
  %503 = add i32 %47, %497
  %504 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %503
  %505 = load float, float addrspace(3)* %504, align 4, !tbaa !5
  %506 = fmul contract float %502, %505
  %507 = fadd contract float %498, %506
  %508 = add i32 %497, 1
  %509 = sub nsw i32 %6, %508
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds float, float addrspace(4)* %94, i64 %510
  %512 = load float, float addrspace(4)* %511, align 4, !tbaa !5
  %513 = add i32 %47, %508
  %514 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %513
  %515 = load float, float addrspace(3)* %514, align 4, !tbaa !5
  %516 = fmul contract float %512, %515
  %517 = fadd contract float %507, %516
  %518 = add i32 %497, 2
  %519 = sub nsw i32 %6, %518
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds float, float addrspace(4)* %94, i64 %520
  %522 = load float, float addrspace(4)* %521, align 4, !tbaa !5
  %523 = add i32 %47, %518
  %524 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %523
  %525 = load float, float addrspace(3)* %524, align 4, !tbaa !5
  %526 = fmul contract float %522, %525
  %527 = fadd contract float %517, %526
  %528 = add i32 %497, 3
  %529 = sub nsw i32 %6, %528
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds float, float addrspace(4)* %94, i64 %530
  %532 = load float, float addrspace(4)* %531, align 4, !tbaa !5
  %533 = add i32 %47, %528
  %534 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %533
  %535 = load float, float addrspace(3)* %534, align 4, !tbaa !5
  %536 = fmul contract float %532, %535
  %537 = fadd contract float %527, %536
  %538 = add i32 %497, 4
  %539 = sub nsw i32 %6, %538
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(4)* %94, i64 %540
  %542 = load float, float addrspace(4)* %541, align 4, !tbaa !5
  %543 = add i32 %47, %538
  %544 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %543
  %545 = load float, float addrspace(3)* %544, align 4, !tbaa !5
  %546 = fmul contract float %542, %545
  %547 = fadd contract float %537, %546
  %548 = add i32 %497, 5
  %549 = sub nsw i32 %6, %548
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds float, float addrspace(4)* %94, i64 %550
  %552 = load float, float addrspace(4)* %551, align 4, !tbaa !5
  %553 = add i32 %47, %548
  %554 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %553
  %555 = load float, float addrspace(3)* %554, align 4, !tbaa !5
  %556 = fmul contract float %552, %555
  %557 = fadd contract float %547, %556
  %558 = add i32 %497, 6
  %559 = sub nsw i32 %6, %558
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds float, float addrspace(4)* %94, i64 %560
  %562 = load float, float addrspace(4)* %561, align 4, !tbaa !5
  %563 = add i32 %47, %558
  %564 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %563
  %565 = load float, float addrspace(3)* %564, align 4, !tbaa !5
  %566 = fmul contract float %562, %565
  %567 = fadd contract float %557, %566
  %568 = add i32 %497, 7
  %569 = sub nsw i32 %6, %568
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds float, float addrspace(4)* %94, i64 %570
  %572 = load float, float addrspace(4)* %571, align 4, !tbaa !5
  %573 = add i32 %47, %568
  %574 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %573
  %575 = load float, float addrspace(3)* %574, align 4, !tbaa !5
  %576 = fmul contract float %572, %575
  %577 = fadd contract float %567, %576
  %578 = add i32 %497, 8
  %579 = icmp eq i32 %568, %97
  br i1 %579, label %582, label %496, !llvm.loop !13

580:                                              ; preds = %352
  %581 = getelementptr inbounds float, float addrspace(1)* %61, i64 80
  store float 0.000000e+00, float addrspace(1)* %581, align 4, !tbaa !5
  br label %582

582:                                              ; preds = %491, %496, %580
  %583 = phi float [ 0.000000e+00, %580 ], [ %492, %491 ], [ %577, %496 ]
  %584 = getelementptr inbounds float, float addrspace(1)* %61, i64 96
  store float %583, float addrspace(1)* %584, align 4, !tbaa !5
  br i1 %96, label %810, label %585

585:                                              ; preds = %582
  %586 = add i32 %97, %6
  %587 = add i32 %586, 1
  %588 = and i32 %587, 7
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %606, label %590

590:                                              ; preds = %585, %590
  %591 = phi i32 [ %603, %590 ], [ %95, %585 ]
  %592 = phi float [ %602, %590 ], [ 0.000000e+00, %585 ]
  %593 = phi i32 [ %604, %590 ], [ 0, %585 ]
  %594 = sub nsw i32 %6, %591
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds float, float addrspace(4)* %94, i64 %595
  %597 = load float, float addrspace(4)* %596, align 4, !tbaa !5
  %598 = add i32 %51, %591
  %599 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %598
  %600 = load float, float addrspace(3)* %599, align 4, !tbaa !5
  %601 = fmul contract float %597, %600
  %602 = fadd contract float %592, %601
  %603 = add i32 %591, 1
  %604 = add i32 %593, 1
  %605 = icmp eq i32 %604, %588
  br i1 %605, label %606, label %590, !llvm.loop !18

606:                                              ; preds = %590, %585
  %607 = phi float [ undef, %585 ], [ %602, %590 ]
  %608 = phi i32 [ %95, %585 ], [ %603, %590 ]
  %609 = phi float [ 0.000000e+00, %585 ], [ %602, %590 ]
  %610 = icmp ult i32 %586, 7
  br i1 %610, label %697, label %611

611:                                              ; preds = %606, %611
  %612 = phi i32 [ %693, %611 ], [ %608, %606 ]
  %613 = phi float [ %692, %611 ], [ %609, %606 ]
  %614 = sub nsw i32 %6, %612
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds float, float addrspace(4)* %94, i64 %615
  %617 = load float, float addrspace(4)* %616, align 4, !tbaa !5
  %618 = add i32 %51, %612
  %619 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %618
  %620 = load float, float addrspace(3)* %619, align 4, !tbaa !5
  %621 = fmul contract float %617, %620
  %622 = fadd contract float %613, %621
  %623 = add i32 %612, 1
  %624 = sub nsw i32 %6, %623
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds float, float addrspace(4)* %94, i64 %625
  %627 = load float, float addrspace(4)* %626, align 4, !tbaa !5
  %628 = add i32 %51, %623
  %629 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %628
  %630 = load float, float addrspace(3)* %629, align 4, !tbaa !5
  %631 = fmul contract float %627, %630
  %632 = fadd contract float %622, %631
  %633 = add i32 %612, 2
  %634 = sub nsw i32 %6, %633
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds float, float addrspace(4)* %94, i64 %635
  %637 = load float, float addrspace(4)* %636, align 4, !tbaa !5
  %638 = add i32 %51, %633
  %639 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %638
  %640 = load float, float addrspace(3)* %639, align 4, !tbaa !5
  %641 = fmul contract float %637, %640
  %642 = fadd contract float %632, %641
  %643 = add i32 %612, 3
  %644 = sub nsw i32 %6, %643
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds float, float addrspace(4)* %94, i64 %645
  %647 = load float, float addrspace(4)* %646, align 4, !tbaa !5
  %648 = add i32 %51, %643
  %649 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %648
  %650 = load float, float addrspace(3)* %649, align 4, !tbaa !5
  %651 = fmul contract float %647, %650
  %652 = fadd contract float %642, %651
  %653 = add i32 %612, 4
  %654 = sub nsw i32 %6, %653
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds float, float addrspace(4)* %94, i64 %655
  %657 = load float, float addrspace(4)* %656, align 4, !tbaa !5
  %658 = add i32 %51, %653
  %659 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %658
  %660 = load float, float addrspace(3)* %659, align 4, !tbaa !5
  %661 = fmul contract float %657, %660
  %662 = fadd contract float %652, %661
  %663 = add i32 %612, 5
  %664 = sub nsw i32 %6, %663
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(4)* %94, i64 %665
  %667 = load float, float addrspace(4)* %666, align 4, !tbaa !5
  %668 = add i32 %51, %663
  %669 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %668
  %670 = load float, float addrspace(3)* %669, align 4, !tbaa !5
  %671 = fmul contract float %667, %670
  %672 = fadd contract float %662, %671
  %673 = add i32 %612, 6
  %674 = sub nsw i32 %6, %673
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds float, float addrspace(4)* %94, i64 %675
  %677 = load float, float addrspace(4)* %676, align 4, !tbaa !5
  %678 = add i32 %51, %673
  %679 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %678
  %680 = load float, float addrspace(3)* %679, align 4, !tbaa !5
  %681 = fmul contract float %677, %680
  %682 = fadd contract float %672, %681
  %683 = add i32 %612, 7
  %684 = sub nsw i32 %6, %683
  %685 = sext i32 %684 to i64
  %686 = getelementptr inbounds float, float addrspace(4)* %94, i64 %685
  %687 = load float, float addrspace(4)* %686, align 4, !tbaa !5
  %688 = add i32 %51, %683
  %689 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %688
  %690 = load float, float addrspace(3)* %689, align 4, !tbaa !5
  %691 = fmul contract float %687, %690
  %692 = fadd contract float %682, %691
  %693 = add i32 %612, 8
  %694 = icmp eq i32 %683, %97
  br i1 %694, label %697, label %611, !llvm.loop !13

695:                                              ; preds = %467
  %696 = getelementptr inbounds float, float addrspace(1)* %61, i64 96
  store float 0.000000e+00, float addrspace(1)* %696, align 4, !tbaa !5
  br label %697

697:                                              ; preds = %606, %611, %695
  %698 = phi float [ 0.000000e+00, %695 ], [ %607, %606 ], [ %692, %611 ]
  %699 = getelementptr inbounds float, float addrspace(1)* %61, i64 112
  store float %698, float addrspace(1)* %699, align 4, !tbaa !5
  br i1 %96, label %925, label %700

700:                                              ; preds = %697
  %701 = add i32 %97, %6
  %702 = add i32 %701, 1
  %703 = and i32 %702, 7
  %704 = icmp eq i32 %703, 0
  br i1 %704, label %721, label %705

705:                                              ; preds = %700, %705
  %706 = phi i32 [ %718, %705 ], [ %95, %700 ]
  %707 = phi float [ %717, %705 ], [ 0.000000e+00, %700 ]
  %708 = phi i32 [ %719, %705 ], [ 0, %700 ]
  %709 = sub nsw i32 %6, %706
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds float, float addrspace(4)* %94, i64 %710
  %712 = load float, float addrspace(4)* %711, align 4, !tbaa !5
  %713 = add i32 %55, %706
  %714 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %713
  %715 = load float, float addrspace(3)* %714, align 4, !tbaa !5
  %716 = fmul contract float %712, %715
  %717 = fadd contract float %707, %716
  %718 = add i32 %706, 1
  %719 = add i32 %708, 1
  %720 = icmp eq i32 %719, %703
  br i1 %720, label %721, label %705, !llvm.loop !19

721:                                              ; preds = %705, %700
  %722 = phi float [ undef, %700 ], [ %717, %705 ]
  %723 = phi i32 [ %95, %700 ], [ %718, %705 ]
  %724 = phi float [ 0.000000e+00, %700 ], [ %717, %705 ]
  %725 = icmp ult i32 %701, 7
  br i1 %725, label %812, label %726

726:                                              ; preds = %721, %726
  %727 = phi i32 [ %808, %726 ], [ %723, %721 ]
  %728 = phi float [ %807, %726 ], [ %724, %721 ]
  %729 = sub nsw i32 %6, %727
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds float, float addrspace(4)* %94, i64 %730
  %732 = load float, float addrspace(4)* %731, align 4, !tbaa !5
  %733 = add i32 %55, %727
  %734 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %733
  %735 = load float, float addrspace(3)* %734, align 4, !tbaa !5
  %736 = fmul contract float %732, %735
  %737 = fadd contract float %728, %736
  %738 = add i32 %727, 1
  %739 = sub nsw i32 %6, %738
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds float, float addrspace(4)* %94, i64 %740
  %742 = load float, float addrspace(4)* %741, align 4, !tbaa !5
  %743 = add i32 %55, %738
  %744 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %743
  %745 = load float, float addrspace(3)* %744, align 4, !tbaa !5
  %746 = fmul contract float %742, %745
  %747 = fadd contract float %737, %746
  %748 = add i32 %727, 2
  %749 = sub nsw i32 %6, %748
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds float, float addrspace(4)* %94, i64 %750
  %752 = load float, float addrspace(4)* %751, align 4, !tbaa !5
  %753 = add i32 %55, %748
  %754 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %753
  %755 = load float, float addrspace(3)* %754, align 4, !tbaa !5
  %756 = fmul contract float %752, %755
  %757 = fadd contract float %747, %756
  %758 = add i32 %727, 3
  %759 = sub nsw i32 %6, %758
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds float, float addrspace(4)* %94, i64 %760
  %762 = load float, float addrspace(4)* %761, align 4, !tbaa !5
  %763 = add i32 %55, %758
  %764 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %763
  %765 = load float, float addrspace(3)* %764, align 4, !tbaa !5
  %766 = fmul contract float %762, %765
  %767 = fadd contract float %757, %766
  %768 = add i32 %727, 4
  %769 = sub nsw i32 %6, %768
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds float, float addrspace(4)* %94, i64 %770
  %772 = load float, float addrspace(4)* %771, align 4, !tbaa !5
  %773 = add i32 %55, %768
  %774 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %773
  %775 = load float, float addrspace(3)* %774, align 4, !tbaa !5
  %776 = fmul contract float %772, %775
  %777 = fadd contract float %767, %776
  %778 = add i32 %727, 5
  %779 = sub nsw i32 %6, %778
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds float, float addrspace(4)* %94, i64 %780
  %782 = load float, float addrspace(4)* %781, align 4, !tbaa !5
  %783 = add i32 %55, %778
  %784 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %783
  %785 = load float, float addrspace(3)* %784, align 4, !tbaa !5
  %786 = fmul contract float %782, %785
  %787 = fadd contract float %777, %786
  %788 = add i32 %727, 6
  %789 = sub nsw i32 %6, %788
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds float, float addrspace(4)* %94, i64 %790
  %792 = load float, float addrspace(4)* %791, align 4, !tbaa !5
  %793 = add i32 %55, %788
  %794 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %793
  %795 = load float, float addrspace(3)* %794, align 4, !tbaa !5
  %796 = fmul contract float %792, %795
  %797 = fadd contract float %787, %796
  %798 = add i32 %727, 7
  %799 = sub nsw i32 %6, %798
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds float, float addrspace(4)* %94, i64 %800
  %802 = load float, float addrspace(4)* %801, align 4, !tbaa !5
  %803 = add i32 %55, %798
  %804 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %803
  %805 = load float, float addrspace(3)* %804, align 4, !tbaa !5
  %806 = fmul contract float %802, %805
  %807 = fadd contract float %797, %806
  %808 = add i32 %727, 8
  %809 = icmp eq i32 %798, %97
  br i1 %809, label %812, label %726, !llvm.loop !13

810:                                              ; preds = %582
  %811 = getelementptr inbounds float, float addrspace(1)* %61, i64 112
  store float 0.000000e+00, float addrspace(1)* %811, align 4, !tbaa !5
  br label %812

812:                                              ; preds = %721, %726, %810
  %813 = phi float [ 0.000000e+00, %810 ], [ %722, %721 ], [ %807, %726 ]
  %814 = getelementptr inbounds float, float addrspace(1)* %61, i64 128
  store float %813, float addrspace(1)* %814, align 4, !tbaa !5
  br i1 %96, label %927, label %815

815:                                              ; preds = %812
  %816 = add i32 %97, %6
  %817 = add i32 %816, 1
  %818 = and i32 %817, 7
  %819 = icmp eq i32 %818, 0
  br i1 %819, label %836, label %820

820:                                              ; preds = %815, %820
  %821 = phi i32 [ %833, %820 ], [ %95, %815 ]
  %822 = phi float [ %832, %820 ], [ 0.000000e+00, %815 ]
  %823 = phi i32 [ %834, %820 ], [ 0, %815 ]
  %824 = sub nsw i32 %6, %821
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds float, float addrspace(4)* %94, i64 %825
  %827 = load float, float addrspace(4)* %826, align 4, !tbaa !5
  %828 = add i32 %59, %821
  %829 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %828
  %830 = load float, float addrspace(3)* %829, align 4, !tbaa !5
  %831 = fmul contract float %827, %830
  %832 = fadd contract float %822, %831
  %833 = add i32 %821, 1
  %834 = add i32 %823, 1
  %835 = icmp eq i32 %834, %818
  br i1 %835, label %836, label %820, !llvm.loop !20

836:                                              ; preds = %820, %815
  %837 = phi float [ undef, %815 ], [ %832, %820 ]
  %838 = phi i32 [ %95, %815 ], [ %833, %820 ]
  %839 = phi float [ 0.000000e+00, %815 ], [ %832, %820 ]
  %840 = icmp ult i32 %816, 7
  br i1 %840, label %927, label %841

841:                                              ; preds = %836, %841
  %842 = phi i32 [ %923, %841 ], [ %838, %836 ]
  %843 = phi float [ %922, %841 ], [ %839, %836 ]
  %844 = sub nsw i32 %6, %842
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds float, float addrspace(4)* %94, i64 %845
  %847 = load float, float addrspace(4)* %846, align 4, !tbaa !5
  %848 = add i32 %59, %842
  %849 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %848
  %850 = load float, float addrspace(3)* %849, align 4, !tbaa !5
  %851 = fmul contract float %847, %850
  %852 = fadd contract float %843, %851
  %853 = add i32 %842, 1
  %854 = sub nsw i32 %6, %853
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds float, float addrspace(4)* %94, i64 %855
  %857 = load float, float addrspace(4)* %856, align 4, !tbaa !5
  %858 = add i32 %59, %853
  %859 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %858
  %860 = load float, float addrspace(3)* %859, align 4, !tbaa !5
  %861 = fmul contract float %857, %860
  %862 = fadd contract float %852, %861
  %863 = add i32 %842, 2
  %864 = sub nsw i32 %6, %863
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds float, float addrspace(4)* %94, i64 %865
  %867 = load float, float addrspace(4)* %866, align 4, !tbaa !5
  %868 = add i32 %59, %863
  %869 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %868
  %870 = load float, float addrspace(3)* %869, align 4, !tbaa !5
  %871 = fmul contract float %867, %870
  %872 = fadd contract float %862, %871
  %873 = add i32 %842, 3
  %874 = sub nsw i32 %6, %873
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds float, float addrspace(4)* %94, i64 %875
  %877 = load float, float addrspace(4)* %876, align 4, !tbaa !5
  %878 = add i32 %59, %873
  %879 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %878
  %880 = load float, float addrspace(3)* %879, align 4, !tbaa !5
  %881 = fmul contract float %877, %880
  %882 = fadd contract float %872, %881
  %883 = add i32 %842, 4
  %884 = sub nsw i32 %6, %883
  %885 = sext i32 %884 to i64
  %886 = getelementptr inbounds float, float addrspace(4)* %94, i64 %885
  %887 = load float, float addrspace(4)* %886, align 4, !tbaa !5
  %888 = add i32 %59, %883
  %889 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %888
  %890 = load float, float addrspace(3)* %889, align 4, !tbaa !5
  %891 = fmul contract float %887, %890
  %892 = fadd contract float %882, %891
  %893 = add i32 %842, 5
  %894 = sub nsw i32 %6, %893
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds float, float addrspace(4)* %94, i64 %895
  %897 = load float, float addrspace(4)* %896, align 4, !tbaa !5
  %898 = add i32 %59, %893
  %899 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %898
  %900 = load float, float addrspace(3)* %899, align 4, !tbaa !5
  %901 = fmul contract float %897, %900
  %902 = fadd contract float %892, %901
  %903 = add i32 %842, 6
  %904 = sub nsw i32 %6, %903
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds float, float addrspace(4)* %94, i64 %905
  %907 = load float, float addrspace(4)* %906, align 4, !tbaa !5
  %908 = add i32 %59, %903
  %909 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %908
  %910 = load float, float addrspace(3)* %909, align 4, !tbaa !5
  %911 = fmul contract float %907, %910
  %912 = fadd contract float %902, %911
  %913 = add i32 %842, 7
  %914 = sub nsw i32 %6, %913
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds float, float addrspace(4)* %94, i64 %915
  %917 = load float, float addrspace(4)* %916, align 4, !tbaa !5
  %918 = add i32 %59, %913
  %919 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %918
  %920 = load float, float addrspace(3)* %919, align 4, !tbaa !5
  %921 = fmul contract float %917, %920
  %922 = fadd contract float %912, %921
  %923 = add i32 %842, 8
  %924 = icmp eq i32 %913, %97
  br i1 %924, label %927, label %841, !llvm.loop !13

925:                                              ; preds = %697
  %926 = getelementptr inbounds float, float addrspace(1)* %61, i64 128
  store float 0.000000e+00, float addrspace(1)* %926, align 4, !tbaa !5
  br label %927

927:                                              ; preds = %836, %841, %925, %812
  %928 = phi float [ 0.000000e+00, %812 ], [ 0.000000e+00, %925 ], [ %837, %836 ], [ %922, %841 ]
  %929 = getelementptr inbounds float, float addrspace(1)* %61, i64 144
  store float %928, float addrspace(1)* %929, align 4, !tbaa !5
  ret void

930:                                              ; preds = %119, %930
  %931 = phi i32 [ %1012, %930 ], [ %121, %119 ]
  %932 = phi float [ %1011, %930 ], [ %122, %119 ]
  %933 = sub nsw i32 %6, %931
  %934 = sext i32 %933 to i64
  %935 = getelementptr inbounds float, float addrspace(4)* %94, i64 %934
  %936 = load float, float addrspace(4)* %935, align 4, !tbaa !5
  %937 = add i32 %31, %931
  %938 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %937
  %939 = load float, float addrspace(3)* %938, align 4, !tbaa !5
  %940 = fmul contract float %936, %939
  %941 = fadd contract float %932, %940
  %942 = add i32 %931, 1
  %943 = sub nsw i32 %6, %942
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds float, float addrspace(4)* %94, i64 %944
  %946 = load float, float addrspace(4)* %945, align 4, !tbaa !5
  %947 = add i32 %31, %942
  %948 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %947
  %949 = load float, float addrspace(3)* %948, align 4, !tbaa !5
  %950 = fmul contract float %946, %949
  %951 = fadd contract float %941, %950
  %952 = add i32 %931, 2
  %953 = sub nsw i32 %6, %952
  %954 = sext i32 %953 to i64
  %955 = getelementptr inbounds float, float addrspace(4)* %94, i64 %954
  %956 = load float, float addrspace(4)* %955, align 4, !tbaa !5
  %957 = add i32 %31, %952
  %958 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %957
  %959 = load float, float addrspace(3)* %958, align 4, !tbaa !5
  %960 = fmul contract float %956, %959
  %961 = fadd contract float %951, %960
  %962 = add i32 %931, 3
  %963 = sub nsw i32 %6, %962
  %964 = sext i32 %963 to i64
  %965 = getelementptr inbounds float, float addrspace(4)* %94, i64 %964
  %966 = load float, float addrspace(4)* %965, align 4, !tbaa !5
  %967 = add i32 %31, %962
  %968 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %967
  %969 = load float, float addrspace(3)* %968, align 4, !tbaa !5
  %970 = fmul contract float %966, %969
  %971 = fadd contract float %961, %970
  %972 = add i32 %931, 4
  %973 = sub nsw i32 %6, %972
  %974 = sext i32 %973 to i64
  %975 = getelementptr inbounds float, float addrspace(4)* %94, i64 %974
  %976 = load float, float addrspace(4)* %975, align 4, !tbaa !5
  %977 = add i32 %31, %972
  %978 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %977
  %979 = load float, float addrspace(3)* %978, align 4, !tbaa !5
  %980 = fmul contract float %976, %979
  %981 = fadd contract float %971, %980
  %982 = add i32 %931, 5
  %983 = sub nsw i32 %6, %982
  %984 = sext i32 %983 to i64
  %985 = getelementptr inbounds float, float addrspace(4)* %94, i64 %984
  %986 = load float, float addrspace(4)* %985, align 4, !tbaa !5
  %987 = add i32 %31, %982
  %988 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %987
  %989 = load float, float addrspace(3)* %988, align 4, !tbaa !5
  %990 = fmul contract float %986, %989
  %991 = fadd contract float %981, %990
  %992 = add i32 %931, 6
  %993 = sub nsw i32 %6, %992
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds float, float addrspace(4)* %94, i64 %994
  %996 = load float, float addrspace(4)* %995, align 4, !tbaa !5
  %997 = add i32 %31, %992
  %998 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %997
  %999 = load float, float addrspace(3)* %998, align 4, !tbaa !5
  %1000 = fmul contract float %996, %999
  %1001 = fadd contract float %991, %1000
  %1002 = add i32 %931, 7
  %1003 = sub nsw i32 %6, %1002
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds float, float addrspace(4)* %94, i64 %1004
  %1006 = load float, float addrspace(4)* %1005, align 4, !tbaa !5
  %1007 = add i32 %31, %1002
  %1008 = getelementptr inbounds [4 x [4 x [192 x float]]], [4 x [4 x [192 x float]]] addrspace(3)* @_ZZ23convolutionRows3DKernelPfS_iiiiiE6s_Data, i32 0, i32 %19, i32 %15, i32 %1007
  %1009 = load float, float addrspace(3)* %1008, align 4, !tbaa !5
  %1010 = fmul contract float %1006, %1009
  %1011 = fadd contract float %1001, %1010
  %1012 = add i32 %931, 8
  %1013 = icmp eq i32 %1002, %97
  br i1 %1013, label %124, label %930, !llvm.loop !13
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
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
