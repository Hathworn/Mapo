; ModuleID = '../data/hip_kernels/3909/6/main.cu'
source_filename = "../data/hip_kernels/3909/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8mm_tiledPfS_S_iiiE2sA = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ8mm_tiledPfS_S_iiiE2sB = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8mm_tiledPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %8, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %10, %13
  %15 = mul nsw i32 %12, %3
  %16 = add nsw i32 %14, %15
  %17 = icmp sgt i32 %16, %5
  br i1 %17, label %235, label %18

18:                                               ; preds = %6
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %231

20:                                               ; preds = %18
  %21 = add i32 %15, %13
  %22 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 %13
  %23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 %11, i32 %13
  %24 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 0
  %25 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 0, i32 %13
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 1
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 1, i32 %13
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 2
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 2, i32 %13
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 3
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 3, i32 %13
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 4
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 4, i32 %13
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 5
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 5, i32 %13
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 6
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 6, i32 %13
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 7
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 7, i32 %13
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 8
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 8, i32 %13
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 9
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 9, i32 %13
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 10
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 10, i32 %13
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 11
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 11, i32 %13
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 12
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 12, i32 %13
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 13
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 13, i32 %13
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 14
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 14, i32 %13
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 15
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 15, i32 %13
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 16
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 16, i32 %13
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 17
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 17, i32 %13
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 18
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 18, i32 %13
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 19
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 19, i32 %13
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 20
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 20, i32 %13
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 21
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 21, i32 %13
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 22
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 22, i32 %13
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 23
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 23, i32 %13
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 24
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 24, i32 %13
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 25
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 25, i32 %13
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 26
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 26, i32 %13
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 27
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 27, i32 %13
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 28
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 28, i32 %13
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 29
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 29, i32 %13
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 30
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 30, i32 %13
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sA, i32 0, i32 %11, i32 31
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ8mm_tiledPfS_S_iiiE2sB, i32 0, i32 31, i32 %13
  br label %88

88:                                               ; preds = %20, %88
  %89 = phi float [ 0.000000e+00, %20 ], [ %228, %88 ]
  %90 = phi i32 [ 0, %20 ], [ %229, %88 ]
  %91 = add i32 %21, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %94, float addrspace(3)* %22, align 4, !tbaa !5
  %95 = add nuw i32 %90, %11
  %96 = mul i32 %95, %3
  %97 = add i32 %14, %96
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %100, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %102 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %89, %103
  %105 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %106 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %110 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %118 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %122 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %126 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %130 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %40, align 16, !tbaa !5
  %134 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %44, align 8, !tbaa !5
  %142 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %48, align 16, !tbaa !5
  %150 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  %153 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %154 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %155 = fmul contract float %153, %154
  %156 = fadd contract float %152, %155
  %157 = load float, float addrspace(3)* %52, align 8, !tbaa !5
  %158 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %156, %159
  %161 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %162 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %163 = fmul contract float %161, %162
  %164 = fadd contract float %160, %163
  %165 = load float, float addrspace(3)* %56, align 16, !tbaa !5
  %166 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %167 = fmul contract float %165, %166
  %168 = fadd contract float %164, %167
  %169 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %170 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %171 = fmul contract float %169, %170
  %172 = fadd contract float %168, %171
  %173 = load float, float addrspace(3)* %60, align 8, !tbaa !5
  %174 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %172, %175
  %177 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %178 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %179 = fmul contract float %177, %178
  %180 = fadd contract float %176, %179
  %181 = load float, float addrspace(3)* %64, align 16, !tbaa !5
  %182 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %183 = fmul contract float %181, %182
  %184 = fadd contract float %180, %183
  %185 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %186 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %184, %187
  %189 = load float, float addrspace(3)* %68, align 8, !tbaa !5
  %190 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %191 = fmul contract float %189, %190
  %192 = fadd contract float %188, %191
  %193 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %194 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %195 = fmul contract float %193, %194
  %196 = fadd contract float %192, %195
  %197 = load float, float addrspace(3)* %72, align 16, !tbaa !5
  %198 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %199 = fmul contract float %197, %198
  %200 = fadd contract float %196, %199
  %201 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %202 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %203 = fmul contract float %201, %202
  %204 = fadd contract float %200, %203
  %205 = load float, float addrspace(3)* %76, align 8, !tbaa !5
  %206 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %207 = fmul contract float %205, %206
  %208 = fadd contract float %204, %207
  %209 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %210 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %211 = fmul contract float %209, %210
  %212 = fadd contract float %208, %211
  %213 = load float, float addrspace(3)* %80, align 16, !tbaa !5
  %214 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %215 = fmul contract float %213, %214
  %216 = fadd contract float %212, %215
  %217 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %218 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %219 = fmul contract float %217, %218
  %220 = fadd contract float %216, %219
  %221 = load float, float addrspace(3)* %84, align 8, !tbaa !5
  %222 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %223 = fmul contract float %221, %222
  %224 = fadd contract float %220, %223
  %225 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %226 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %227 = fmul contract float %225, %226
  %228 = fadd contract float %224, %227
  %229 = add nuw nsw i32 %90, 32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %230 = icmp slt i32 %229, %3
  br i1 %230, label %88, label %231, !llvm.loop !10

231:                                              ; preds = %88, %18
  %232 = phi float [ 0.000000e+00, %18 ], [ %228, %88 ]
  %233 = sext i32 %16 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %2, i64 %233
  store float %232, float addrspace(1)* %234, align 4, !tbaa !5
  br label %235

235:                                              ; preds = %231, %6
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
