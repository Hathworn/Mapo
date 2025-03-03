; ModuleID = '../data/hip_kernels/10749/1/main.cu'
source_filename = "../data/hip_kernels/10749/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22matrixMultKernel_tiledPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %8, %3
  %14 = icmp slt i32 %12, %3
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %16, label %242

16:                                               ; preds = %4
  %17 = sdiv i32 %3, 32
  %18 = icmp sgt i32 %3, 31
  %19 = mul nsw i32 %8, %3
  %20 = sext i32 %19 to i64
  br i1 %18, label %23, label %21

21:                                               ; preds = %16
  %22 = sext i32 %12 to i64
  br label %95

23:                                               ; preds = %16
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %25 = zext i32 %11 to i64
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 %11
  %27 = sext i32 %12 to i64
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 %7, i32 %11
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 0
  %30 = getelementptr inbounds float, float addrspace(1)* %24, i64 %25
  %31 = getelementptr float, float addrspace(1)* %1, i64 %27
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 0, i32 %11
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 1
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 1, i32 %11
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 2
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 2, i32 %11
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 3
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 3, i32 %11
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 4
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 4, i32 %11
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 5
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 5, i32 %11
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 6
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 6, i32 %11
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 7
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 7, i32 %11
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 8
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 8, i32 %11
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 9
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 9, i32 %11
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 10
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 10, i32 %11
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 11
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 11, i32 %11
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 12
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 12, i32 %11
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 13
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 13, i32 %11
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 14
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 14, i32 %11
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 15
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 15, i32 %11
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 16
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 16, i32 %11
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 17
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 17, i32 %11
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 18
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 18, i32 %11
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 19
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 19, i32 %11
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 20
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 20, i32 %11
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 21
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 21, i32 %11
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 22
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 22, i32 %11
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 23
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 23, i32 %11
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 24
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 24, i32 %11
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 25
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 25, i32 %11
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 26
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 26, i32 %11
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 27
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 27, i32 %11
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 28
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 28, i32 %11
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 29
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 29, i32 %11
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 30
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 30, i32 %11
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8A_shared, i32 0, i32 %7, i32 31
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ22matrixMultKernel_tiledPfS_S_iE8B_shared, i32 0, i32 31, i32 %11
  br label %100

95:                                               ; preds = %100, %21
  %96 = phi i64 [ %22, %21 ], [ %27, %100 ]
  %97 = phi float [ 0.000000e+00, %21 ], [ %239, %100 ]
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %99 = getelementptr inbounds float, float addrspace(1)* %98, i64 %96
  store float %97, float addrspace(1)* %99, align 4, !tbaa !5
  br label %242

100:                                              ; preds = %23, %100
  %101 = phi i32 [ 0, %23 ], [ %240, %100 ]
  %102 = phi float [ 0.000000e+00, %23 ], [ %239, %100 ]
  %103 = shl nsw i32 %101, 5
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %30, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %106, float addrspace(3)* %26, align 4, !tbaa !5
  %107 = add nuw i32 %103, %7
  %108 = mul i32 %107, %3
  %109 = zext i32 %108 to i64
  %110 = getelementptr float, float addrspace(1)* %31, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %111, float addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %112 = load float, float addrspace(3)* %29, align 16, !tbaa !5
  %113 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %102, %114
  %116 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %117 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %35, align 8, !tbaa !5
  %121 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %39, align 16, !tbaa !5
  %129 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %43, align 8, !tbaa !5
  %137 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %141 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %47, align 16, !tbaa !5
  %145 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %149 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %51, align 8, !tbaa !5
  %153 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %157 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %55, align 16, !tbaa !5
  %161 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %165 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %59, align 8, !tbaa !5
  %169 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  %172 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %173 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %171, %174
  %176 = load float, float addrspace(3)* %63, align 16, !tbaa !5
  %177 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %175, %178
  %180 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %181 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %67, align 8, !tbaa !5
  %185 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %189 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %71, align 16, !tbaa !5
  %193 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %197 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %75, align 8, !tbaa !5
  %201 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %205 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %79, align 16, !tbaa !5
  %209 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %213 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %83, align 8, !tbaa !5
  %217 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %221 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %87, align 16, !tbaa !5
  %225 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %229 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %91, align 8, !tbaa !5
  %233 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  %236 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %237 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %235, %238
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %240 = add nuw nsw i32 %101, 1
  %241 = icmp eq i32 %240, %17
  br i1 %241, label %95, label %100, !llvm.loop !10

242:                                              ; preds = %4, %95
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
