; ModuleID = '../data/hip_kernels/15641/14/main.cu'
source_filename = "../data/hip_kernels/15641/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9matmul_v1PfS_S_iE1A = internal unnamed_addr addrspace(3) global [32 x [33 x float]] undef, align 16
@_ZZ9matmul_v1PfS_S_iE1B = internal unnamed_addr addrspace(3) global [32 x [33 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9matmul_v1PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %5, 5
  %10 = add nsw i32 %9, %7
  %11 = shl nsw i32 %6, 5
  %12 = add nsw i32 %11, %8
  %13 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 %7
  store float 0.000000e+00, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = icmp slt i32 %10, %3
  %15 = icmp slt i32 %12, %3
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %239

17:                                               ; preds = %4
  %18 = sitofp i32 %3 to float
  %19 = fmul contract float %18, 3.125000e-02
  %20 = fcmp contract ogt float %19, 0.000000e+00
  %21 = mul nsw i32 %12, %3
  br i1 %20, label %22, label %89

22:                                               ; preds = %17
  %23 = add i32 %21, %7
  %24 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 %8, i32 %7
  %25 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 0
  %26 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 0, i32 %7
  %27 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 1
  %28 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 1, i32 %7
  %29 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 2
  %30 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 2, i32 %7
  %31 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 3
  %32 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 3, i32 %7
  %33 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 4
  %34 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 4, i32 %7
  %35 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 5
  %36 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 5, i32 %7
  %37 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 6
  %38 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 6, i32 %7
  %39 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 7
  %40 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 7, i32 %7
  %41 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 8
  %42 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 8, i32 %7
  %43 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 9
  %44 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 9, i32 %7
  %45 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 10
  %46 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 10, i32 %7
  %47 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 11
  %48 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 11, i32 %7
  %49 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 12
  %50 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 12, i32 %7
  %51 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 13
  %52 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 13, i32 %7
  %53 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 14
  %54 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 14, i32 %7
  %55 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 15
  %56 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 15, i32 %7
  %57 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 16
  %58 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 16, i32 %7
  %59 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 17
  %60 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 17, i32 %7
  %61 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 18
  %62 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 18, i32 %7
  %63 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 19
  %64 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 19, i32 %7
  %65 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 20
  %66 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 20, i32 %7
  %67 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 21
  %68 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 21, i32 %7
  %69 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 22
  %70 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 22, i32 %7
  %71 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 23
  %72 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 23, i32 %7
  %73 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 24
  %74 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 24, i32 %7
  %75 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 25
  %76 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 25, i32 %7
  %77 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 26
  %78 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 26, i32 %7
  %79 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 27
  %80 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 27, i32 %7
  %81 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 28
  %82 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 28, i32 %7
  %83 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 29
  %84 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 29, i32 %7
  %85 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 30
  %86 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 30, i32 %7
  %87 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1A, i32 0, i32 %8, i32 31
  %88 = getelementptr inbounds [32 x [33 x float]], [32 x [33 x float]] addrspace(3)* @_ZZ9matmul_v1PfS_S_iE1B, i32 0, i32 31, i32 %7
  br label %94

89:                                               ; preds = %94, %17
  %90 = phi float [ 0.000000e+00, %17 ], [ %235, %94 ]
  %91 = add nsw i32 %21, %10
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  store float %90, float addrspace(1)* %93, align 4, !tbaa !5
  br label %239

94:                                               ; preds = %22, %94
  %95 = phi i32 [ 0, %22 ], [ %236, %94 ]
  %96 = phi float [ 0.000000e+00, %22 ], [ %235, %94 ]
  %97 = shl nsw i32 %95, 5
  %98 = add i32 %23, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5
  store float %101, float addrspace(3)* %13, align 4, !tbaa !5
  %102 = add nuw nsw i32 %97, %8
  %103 = mul nsw i32 %102, %3
  %104 = add nsw i32 %103, %10
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  store float %107, float addrspace(3)* %24, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %109 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %96, %110
  %112 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %113 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %117 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %129 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %137 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %141 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %145 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %149 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %153 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %157 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %161 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %165 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %169 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  %172 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %173 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %171, %174
  %176 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %177 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %175, %178
  %180 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %181 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %185 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %189 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %193 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %197 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %201 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %205 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %209 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %213 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %217 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %221 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %225 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %229 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %233 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %236 = add nuw nsw i32 %95, 1
  %237 = sitofp i32 %236 to float
  %238 = fcmp contract ogt float %19, %237
  br i1 %238, label %94, label %89, !llvm.loop !9

239:                                              ; preds = %4, %89
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
