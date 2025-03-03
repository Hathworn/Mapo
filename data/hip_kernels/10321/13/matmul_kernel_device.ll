; ModuleID = '../data/hip_kernels/10321/13/main.cu'
source_filename = "../data/hip_kernels/10321/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13matmul_kernelPfS_S_E2sA = internal unnamed_addr addrspace(3) global [16 x [32 x float]] undef, align 16
@_ZZ13matmul_kernelPfS_S_E2sB = internal unnamed_addr addrspace(3) global [16 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13matmul_kernelPfS_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 5
  %8 = add i32 %7, %4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 16
  %11 = shl nuw nsw i32 %5, 12
  %12 = add i32 %10, %11
  %13 = or i32 %12, %4
  %14 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 %4
  %15 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 %5, i32 %4
  %16 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 0
  %17 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 0, i32 %4
  %18 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 1
  %19 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 1, i32 %4
  %20 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 2
  %21 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 2, i32 %4
  %22 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 3
  %23 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 3, i32 %4
  %24 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 4
  %25 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 4, i32 %4
  %26 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 5
  %27 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 5, i32 %4
  %28 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 6
  %29 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 6, i32 %4
  %30 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 7
  %31 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 7, i32 %4
  %32 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 8
  %33 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 8, i32 %4
  %34 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 9
  %35 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 9, i32 %4
  %36 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 10
  %37 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 10, i32 %4
  %38 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 11
  %39 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 11, i32 %4
  %40 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 12
  %41 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 12, i32 %4
  %42 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 13
  %43 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 13, i32 %4
  %44 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 14
  %45 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 14, i32 %4
  %46 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 15
  %47 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 15, i32 %4
  %48 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 16
  %49 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 16, i32 %4
  %50 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 17
  %51 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 17, i32 %4
  %52 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 18
  %53 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 18, i32 %4
  %54 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 19
  %55 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 19, i32 %4
  %56 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 20
  %57 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 20, i32 %4
  %58 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 21
  %59 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 21, i32 %4
  %60 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 22
  %61 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 22, i32 %4
  %62 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 23
  %63 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 23, i32 %4
  %64 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 24
  %65 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 24, i32 %4
  %66 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 25
  %67 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 25, i32 %4
  %68 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 26
  %69 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 26, i32 %4
  %70 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 27
  %71 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 27, i32 %4
  %72 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 28
  %73 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 28, i32 %4
  %74 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 29
  %75 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 29, i32 %4
  %76 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 30
  %77 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 30, i32 %4
  %78 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sA, i32 0, i32 %5, i32 31
  %79 = getelementptr inbounds [16 x [32 x float]], [16 x [32 x float]] addrspace(3)* @_ZZ13matmul_kernelPfS_S_E2sB, i32 0, i32 31, i32 %4
  br label %80

80:                                               ; preds = %3, %80
  %81 = phi i32 [ 0, %3 ], [ %221, %80 ]
  %82 = phi float [ 0.000000e+00, %3 ], [ %220, %80 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = add i32 %13, %81
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  store float %86, float addrspace(3)* %14, align 4, !tbaa !5
  %87 = add nuw nsw i32 %81, %5
  %88 = shl nsw i32 %87, 12
  %89 = add nsw i32 %88, %8
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  store float %92, float addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = load float, float addrspace(3)* %16, align 16, !tbaa !5
  %94 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %82, %95
  %97 = load float, float addrspace(3)* %18, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %20, align 8, !tbaa !5
  %102 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %106 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %110 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %118 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %122 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %126 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %130 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %134 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %40, align 16, !tbaa !5
  %142 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %44, align 8, !tbaa !5
  %150 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  %153 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %154 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %155 = fmul contract float %153, %154
  %156 = fadd contract float %152, %155
  %157 = load float, float addrspace(3)* %48, align 16, !tbaa !5
  %158 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %156, %159
  %161 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %162 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %163 = fmul contract float %161, %162
  %164 = fadd contract float %160, %163
  %165 = load float, float addrspace(3)* %52, align 8, !tbaa !5
  %166 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %167 = fmul contract float %165, %166
  %168 = fadd contract float %164, %167
  %169 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %170 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %171 = fmul contract float %169, %170
  %172 = fadd contract float %168, %171
  %173 = load float, float addrspace(3)* %56, align 16, !tbaa !5
  %174 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %172, %175
  %177 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %178 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %179 = fmul contract float %177, %178
  %180 = fadd contract float %176, %179
  %181 = load float, float addrspace(3)* %60, align 8, !tbaa !5
  %182 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %183 = fmul contract float %181, %182
  %184 = fadd contract float %180, %183
  %185 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %186 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %184, %187
  %189 = load float, float addrspace(3)* %64, align 16, !tbaa !5
  %190 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %191 = fmul contract float %189, %190
  %192 = fadd contract float %188, %191
  %193 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %194 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %195 = fmul contract float %193, %194
  %196 = fadd contract float %192, %195
  %197 = load float, float addrspace(3)* %68, align 8, !tbaa !5
  %198 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %199 = fmul contract float %197, %198
  %200 = fadd contract float %196, %199
  %201 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %202 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %203 = fmul contract float %201, %202
  %204 = fadd contract float %200, %203
  %205 = load float, float addrspace(3)* %72, align 16, !tbaa !5
  %206 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %207 = fmul contract float %205, %206
  %208 = fadd contract float %204, %207
  %209 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %210 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %211 = fmul contract float %209, %210
  %212 = fadd contract float %208, %211
  %213 = load float, float addrspace(3)* %76, align 8, !tbaa !5
  %214 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %215 = fmul contract float %213, %214
  %216 = fadd contract float %212, %215
  %217 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %218 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %219 = fmul contract float %217, %218
  %220 = fadd contract float %216, %219
  %221 = add nuw nsw i32 %81, 32
  %222 = icmp ult i32 %81, 4064
  br i1 %222, label %80, label %223, !llvm.loop !9

223:                                              ; preds = %80
  %224 = add nsw i32 %12, %8
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %0, i64 %225
  store float %220, float addrspace(1)* %226, align 4, !tbaa !5
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
