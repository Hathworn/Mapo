; ModuleID = '../data/hip_kernels/14521/6/main.cu'
source_filename = "../data/hip_kernels/14521/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8Kernel11iiiPfS_S_E2sA = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ8Kernel11iiiPfS_S_E2sB = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8Kernel11iiiPfS_S_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = srem i32 %2, 16
  %16 = sub nsw i32 %2, %15
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %134

18:                                               ; preds = %6
  %19 = mul nsw i32 %12, %2
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 0
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 0, i32 %9
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 1
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 1, i32 %9
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 2
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 2, i32 %9
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 3
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 3, i32 %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 4
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 4, i32 %9
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 5
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 5, i32 %9
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 6
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 6, i32 %9
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 7
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 7, i32 %9
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 8
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 8, i32 %9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 9
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 9, i32 %9
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 10
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 10, i32 %9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 11
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 11, i32 %9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 12
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 12, i32 %9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 13
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 13, i32 %9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 14
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 14, i32 %9
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 15
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 15, i32 %9
  br label %54

54:                                               ; preds = %18, %54
  %55 = phi float [ 0.000000e+00, %18 ], [ %131, %54 ]
  %56 = phi i32 [ 0, %18 ], [ %132, %54 ]
  %57 = add nuw i32 %56, %9
  %58 = add i32 %57, %19
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %61, float addrspace(3)* %20, align 4, !tbaa !5
  %62 = add nuw nsw i32 %56, %10
  %63 = mul nsw i32 %62, %1
  %64 = add nsw i32 %63, %14
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %4, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %67, float addrspace(3)* %21, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = load float, float addrspace(3)* %22, align 16, !tbaa !5
  %69 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %70 = fmul contract float %68, %69
  %71 = fadd contract float %55, %70
  %72 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %73 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %74 = fmul contract float %72, %73
  %75 = fadd contract float %71, %74
  %76 = load float, float addrspace(3)* %26, align 8, !tbaa !5
  %77 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %78 = fmul contract float %76, %77
  %79 = fadd contract float %75, %78
  %80 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %81 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %79, %82
  %84 = load float, float addrspace(3)* %30, align 16, !tbaa !5
  %85 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %86 = fmul contract float %84, %85
  %87 = fadd contract float %83, %86
  %88 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %89 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %87, %90
  %92 = load float, float addrspace(3)* %34, align 8, !tbaa !5
  %93 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  %96 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %97 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %95, %98
  %100 = load float, float addrspace(3)* %38, align 16, !tbaa !5
  %101 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %99, %102
  %104 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %105 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %103, %106
  %108 = load float, float addrspace(3)* %42, align 8, !tbaa !5
  %109 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %107, %110
  %112 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %113 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %46, align 16, !tbaa !5
  %117 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %50, align 8, !tbaa !5
  %125 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %129 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = add nuw nsw i32 %56, 16
  %133 = icmp slt i32 %132, %16
  br i1 %133, label %54, label %134, !llvm.loop !10

134:                                              ; preds = %54, %6
  %135 = phi i32 [ 0, %6 ], [ %132, %54 ]
  %136 = phi float [ 0.000000e+00, %6 ], [ %131, %54 ]
  %137 = icmp sgt i32 %15, 0
  br i1 %137, label %138, label %251

138:                                              ; preds = %134
  %139 = icmp slt i32 %14, %2
  %140 = icmp slt i32 %12, %0
  %141 = select i1 %139, i1 %140, i1 false
  br i1 %141, label %142, label %149

142:                                              ; preds = %138
  %143 = mul nsw i32 %12, %2
  %144 = add i32 %135, %9
  %145 = add i32 %144, %143
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %149

149:                                              ; preds = %138, %142
  %150 = phi float [ %148, %142 ], [ 0.000000e+00, %138 ]
  %151 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  store float %150, float addrspace(3)* %151, align 4
  %152 = icmp slt i32 %12, %2
  %153 = icmp slt i32 %14, %1
  %154 = select i1 %152, i1 %153, i1 false
  br i1 %154, label %155, label %162

155:                                              ; preds = %149
  %156 = add nuw nsw i32 %135, %10
  %157 = mul nsw i32 %156, %1
  %158 = add nsw i32 %157, %14
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %4, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %162

162:                                              ; preds = %149, %155
  %163 = phi float [ %161, %155 ], [ 0.000000e+00, %149 ]
  %164 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  store float %163, float addrspace(3)* %164, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %165 = and i32 %15, 7
  %166 = icmp ult i32 %15, 8
  br i1 %166, label %231, label %167

167:                                              ; preds = %162
  %168 = and i32 %15, -8
  br label %169

169:                                              ; preds = %169, %167
  %170 = phi float [ %136, %167 ], [ %227, %169 ]
  %171 = phi i32 [ 0, %167 ], [ %228, %169 ]
  %172 = phi i32 [ 0, %167 ], [ %229, %169 ]
  %173 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %171
  %174 = load float, float addrspace(3)* %173, align 16, !tbaa !5
  %175 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %171, i32 %9
  %176 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %177 = fmul contract float %174, %176
  %178 = fadd contract float %170, %177
  %179 = or i32 %171, 1
  %180 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %179
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !5
  %182 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %179, i32 %9
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !5
  %184 = fmul contract float %181, %183
  %185 = fadd contract float %178, %184
  %186 = or i32 %171, 2
  %187 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %186
  %188 = load float, float addrspace(3)* %187, align 8, !tbaa !5
  %189 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %186, i32 %9
  %190 = load float, float addrspace(3)* %189, align 4, !tbaa !5
  %191 = fmul contract float %188, %190
  %192 = fadd contract float %185, %191
  %193 = or i32 %171, 3
  %194 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %193
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !5
  %196 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %193, i32 %9
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %198 = fmul contract float %195, %197
  %199 = fadd contract float %192, %198
  %200 = or i32 %171, 4
  %201 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %200
  %202 = load float, float addrspace(3)* %201, align 16, !tbaa !5
  %203 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %200, i32 %9
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = fmul contract float %202, %204
  %206 = fadd contract float %199, %205
  %207 = or i32 %171, 5
  %208 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %207
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %210 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %207, i32 %9
  %211 = load float, float addrspace(3)* %210, align 4, !tbaa !5
  %212 = fmul contract float %209, %211
  %213 = fadd contract float %206, %212
  %214 = or i32 %171, 6
  %215 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %214
  %216 = load float, float addrspace(3)* %215, align 8, !tbaa !5
  %217 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %214, i32 %9
  %218 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %219 = fmul contract float %216, %218
  %220 = fadd contract float %213, %219
  %221 = or i32 %171, 7
  %222 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %221
  %223 = load float, float addrspace(3)* %222, align 4, !tbaa !5
  %224 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %221, i32 %9
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !5
  %226 = fmul contract float %223, %225
  %227 = fadd contract float %220, %226
  %228 = add nuw nsw i32 %171, 8
  %229 = add i32 %172, 8
  %230 = icmp eq i32 %229, %168
  br i1 %230, label %231, label %169, !llvm.loop !12

231:                                              ; preds = %169, %162
  %232 = phi float [ undef, %162 ], [ %227, %169 ]
  %233 = phi float [ %136, %162 ], [ %227, %169 ]
  %234 = phi i32 [ 0, %162 ], [ %228, %169 ]
  %235 = icmp eq i32 %165, 0
  br i1 %235, label %249, label %236

236:                                              ; preds = %231, %236
  %237 = phi float [ %245, %236 ], [ %233, %231 ]
  %238 = phi i32 [ %246, %236 ], [ %234, %231 ]
  %239 = phi i32 [ %247, %236 ], [ 0, %231 ]
  %240 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %238
  %241 = load float, float addrspace(3)* %240, align 4, !tbaa !5
  %242 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %238, i32 %9
  %243 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %244 = fmul contract float %241, %243
  %245 = fadd contract float %237, %244
  %246 = add nuw nsw i32 %238, 1
  %247 = add i32 %239, 1
  %248 = icmp eq i32 %247, %165
  br i1 %248, label %249, label %236, !llvm.loop !13

249:                                              ; preds = %236, %231
  %250 = phi float [ %232, %231 ], [ %245, %236 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %251

251:                                              ; preds = %249, %134
  %252 = phi float [ %250, %249 ], [ %136, %134 ]
  %253 = icmp slt i32 %12, %0
  %254 = icmp slt i32 %14, %1
  %255 = select i1 %253, i1 %254, i1 false
  br i1 %255, label %256, label %261

256:                                              ; preds = %251
  %257 = mul nsw i32 %12, %1
  %258 = add nsw i32 %257, %14
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %5, i64 %259
  store float %252, float addrspace(1)* %260, align 4, !tbaa !5
  br label %261

261:                                              ; preds = %256, %251
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
