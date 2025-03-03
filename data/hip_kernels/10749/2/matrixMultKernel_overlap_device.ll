; ModuleID = '../data/hip_kernels/10749/2/main.cu'
source_filename = "../data/hip_kernels/10749/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24matrixMultKernel_overlapPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  br i1 %15, label %16, label %443

16:                                               ; preds = %4
  %17 = mul nsw i32 %8, %3
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = zext i32 %11 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %19, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = mul i32 %7, %3
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = sext i32 %12 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %25, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = icmp sgt i32 %3, 63
  br i1 %29, label %30, label %99

30:                                               ; preds = %16
  %31 = lshr i32 %3, 5
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 %11
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 %7, i32 %11
  %34 = getelementptr float, float addrspace(1)* %1, i64 %26
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 0
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 0, i32 %11
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 1
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 1, i32 %11
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 2
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 2, i32 %11
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 3
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 3, i32 %11
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 4
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 4, i32 %11
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 5
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 5, i32 %11
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 6
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 6, i32 %11
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 7
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 7, i32 %11
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 8
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 8, i32 %11
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 9
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 9, i32 %11
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 10
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 10, i32 %11
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 11
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 11, i32 %11
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 12
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 12, i32 %11
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 13
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 13, i32 %11
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 14
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 14, i32 %11
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 15
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 15, i32 %11
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 16
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 16, i32 %11
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 17
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 17, i32 %11
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 18
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 18, i32 %11
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 19
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 19, i32 %11
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 20
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 20, i32 %11
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 21
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 21, i32 %11
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 22
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 22, i32 %11
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 23
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 23, i32 %11
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 24
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 24, i32 %11
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 25
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 25, i32 %11
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 26
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 26, i32 %11
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 27
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 27, i32 %11
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 28
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 28, i32 %11
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 29
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 29, i32 %11
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 30
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 30, i32 %11
  %97 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 31
  %98 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 31, i32 %11
  br label %299

99:                                               ; preds = %299, %16
  %100 = phi float [ 0.000000e+00, %16 ], [ %440, %299 ]
  %101 = phi float [ %22, %16 ], [ %307, %299 ]
  %102 = phi float [ %28, %16 ], [ %312, %299 ]
  %103 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 %11
  store float %101, float addrspace(3)* %103, align 4, !tbaa !5
  %104 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 %7, i32 %11
  store float %102, float addrspace(3)* %104, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 0
  %106 = load float, float addrspace(3)* %105, align 16, !tbaa !5
  %107 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 0, i32 %11
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !5
  %109 = fmul contract float %106, %108
  %110 = fadd contract float %100, %109
  %111 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 1
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !5
  %113 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 1, i32 %11
  %114 = load float, float addrspace(3)* %113, align 4, !tbaa !5
  %115 = fmul contract float %112, %114
  %116 = fadd contract float %110, %115
  %117 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 2
  %118 = load float, float addrspace(3)* %117, align 8, !tbaa !5
  %119 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 2, i32 %11
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !5
  %121 = fmul contract float %118, %120
  %122 = fadd contract float %116, %121
  %123 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 3
  %124 = load float, float addrspace(3)* %123, align 4, !tbaa !5
  %125 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 3, i32 %11
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %127 = fmul contract float %124, %126
  %128 = fadd contract float %122, %127
  %129 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 4
  %130 = load float, float addrspace(3)* %129, align 16, !tbaa !5
  %131 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 4, i32 %11
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %133 = fmul contract float %130, %132
  %134 = fadd contract float %128, %133
  %135 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 5
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !5
  %137 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 5, i32 %11
  %138 = load float, float addrspace(3)* %137, align 4, !tbaa !5
  %139 = fmul contract float %136, %138
  %140 = fadd contract float %134, %139
  %141 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 6
  %142 = load float, float addrspace(3)* %141, align 8, !tbaa !5
  %143 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 6, i32 %11
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %145 = fmul contract float %142, %144
  %146 = fadd contract float %140, %145
  %147 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 7
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !5
  %149 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 7, i32 %11
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %151 = fmul contract float %148, %150
  %152 = fadd contract float %146, %151
  %153 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 8
  %154 = load float, float addrspace(3)* %153, align 16, !tbaa !5
  %155 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 8, i32 %11
  %156 = load float, float addrspace(3)* %155, align 4, !tbaa !5
  %157 = fmul contract float %154, %156
  %158 = fadd contract float %152, %157
  %159 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 9
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !5
  %161 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 9, i32 %11
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %163 = fmul contract float %160, %162
  %164 = fadd contract float %158, %163
  %165 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 10
  %166 = load float, float addrspace(3)* %165, align 8, !tbaa !5
  %167 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 10, i32 %11
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %169 = fmul contract float %166, %168
  %170 = fadd contract float %164, %169
  %171 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 11
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !5
  %173 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 11, i32 %11
  %174 = load float, float addrspace(3)* %173, align 4, !tbaa !5
  %175 = fmul contract float %172, %174
  %176 = fadd contract float %170, %175
  %177 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 12
  %178 = load float, float addrspace(3)* %177, align 16, !tbaa !5
  %179 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 12, i32 %11
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !5
  %181 = fmul contract float %178, %180
  %182 = fadd contract float %176, %181
  %183 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 13
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  %185 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 13, i32 %11
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %187 = fmul contract float %184, %186
  %188 = fadd contract float %182, %187
  %189 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 14
  %190 = load float, float addrspace(3)* %189, align 8, !tbaa !5
  %191 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 14, i32 %11
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %193 = fmul contract float %190, %192
  %194 = fadd contract float %188, %193
  %195 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 15
  %196 = load float, float addrspace(3)* %195, align 4, !tbaa !5
  %197 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 15, i32 %11
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %199 = fmul contract float %196, %198
  %200 = fadd contract float %194, %199
  %201 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 16
  %202 = load float, float addrspace(3)* %201, align 16, !tbaa !5
  %203 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 16, i32 %11
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = fmul contract float %202, %204
  %206 = fadd contract float %200, %205
  %207 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 17
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !5
  %209 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 17, i32 %11
  %210 = load float, float addrspace(3)* %209, align 4, !tbaa !5
  %211 = fmul contract float %208, %210
  %212 = fadd contract float %206, %211
  %213 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 18
  %214 = load float, float addrspace(3)* %213, align 8, !tbaa !5
  %215 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 18, i32 %11
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %217 = fmul contract float %214, %216
  %218 = fadd contract float %212, %217
  %219 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 19
  %220 = load float, float addrspace(3)* %219, align 4, !tbaa !5
  %221 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 19, i32 %11
  %222 = load float, float addrspace(3)* %221, align 4, !tbaa !5
  %223 = fmul contract float %220, %222
  %224 = fadd contract float %218, %223
  %225 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 20
  %226 = load float, float addrspace(3)* %225, align 16, !tbaa !5
  %227 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 20, i32 %11
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = fmul contract float %226, %228
  %230 = fadd contract float %224, %229
  %231 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 21
  %232 = load float, float addrspace(3)* %231, align 4, !tbaa !5
  %233 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 21, i32 %11
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %235 = fmul contract float %232, %234
  %236 = fadd contract float %230, %235
  %237 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 22
  %238 = load float, float addrspace(3)* %237, align 8, !tbaa !5
  %239 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 22, i32 %11
  %240 = load float, float addrspace(3)* %239, align 4, !tbaa !5
  %241 = fmul contract float %238, %240
  %242 = fadd contract float %236, %241
  %243 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 23
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !5
  %245 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 23, i32 %11
  %246 = load float, float addrspace(3)* %245, align 4, !tbaa !5
  %247 = fmul contract float %244, %246
  %248 = fadd contract float %242, %247
  %249 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 24
  %250 = load float, float addrspace(3)* %249, align 16, !tbaa !5
  %251 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 24, i32 %11
  %252 = load float, float addrspace(3)* %251, align 4, !tbaa !5
  %253 = fmul contract float %250, %252
  %254 = fadd contract float %248, %253
  %255 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 25
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  %257 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 25, i32 %11
  %258 = load float, float addrspace(3)* %257, align 4, !tbaa !5
  %259 = fmul contract float %256, %258
  %260 = fadd contract float %254, %259
  %261 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 26
  %262 = load float, float addrspace(3)* %261, align 8, !tbaa !5
  %263 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 26, i32 %11
  %264 = load float, float addrspace(3)* %263, align 4, !tbaa !5
  %265 = fmul contract float %262, %264
  %266 = fadd contract float %260, %265
  %267 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 27
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %269 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 27, i32 %11
  %270 = load float, float addrspace(3)* %269, align 4, !tbaa !5
  %271 = fmul contract float %268, %270
  %272 = fadd contract float %266, %271
  %273 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 28
  %274 = load float, float addrspace(3)* %273, align 16, !tbaa !5
  %275 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 28, i32 %11
  %276 = load float, float addrspace(3)* %275, align 4, !tbaa !5
  %277 = fmul contract float %274, %276
  %278 = fadd contract float %272, %277
  %279 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 29
  %280 = load float, float addrspace(3)* %279, align 4, !tbaa !5
  %281 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 29, i32 %11
  %282 = load float, float addrspace(3)* %281, align 4, !tbaa !5
  %283 = fmul contract float %280, %282
  %284 = fadd contract float %278, %283
  %285 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 30
  %286 = load float, float addrspace(3)* %285, align 8, !tbaa !5
  %287 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 30, i32 %11
  %288 = load float, float addrspace(3)* %287, align 4, !tbaa !5
  %289 = fmul contract float %286, %288
  %290 = fadd contract float %284, %289
  %291 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8A_shared, i32 0, i32 %7, i32 31
  %292 = load float, float addrspace(3)* %291, align 4, !tbaa !5
  %293 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ24matrixMultKernel_overlapPfS_S_iE8B_shared, i32 0, i32 31, i32 %11
  %294 = load float, float addrspace(3)* %293, align 4, !tbaa !5
  %295 = fmul contract float %292, %294
  %296 = fadd contract float %290, %295
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %297 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %298 = getelementptr inbounds float, float addrspace(1)* %297, i64 %26
  store float %296, float addrspace(1)* %298, align 4, !tbaa !5
  br label %443

299:                                              ; preds = %30, %299
  %300 = phi i32 [ 1, %30 ], [ %441, %299 ]
  %301 = phi float [ %28, %30 ], [ %312, %299 ]
  %302 = phi float [ %22, %30 ], [ %307, %299 ]
  %303 = phi float [ 0.000000e+00, %30 ], [ %440, %299 ]
  store float %302, float addrspace(3)* %32, align 4, !tbaa !5
  store float %301, float addrspace(3)* %33, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %304 = shl nsw i32 %300, 5
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds float, float addrspace(1)* %21, i64 %305
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !5, !amdgpu.noclobber !9
  %308 = add nuw i32 %304, %7
  %309 = mul i32 %308, %3
  %310 = zext i32 %309 to i64
  %311 = getelementptr float, float addrspace(1)* %34, i64 %310
  %312 = load float, float addrspace(1)* %311, align 4, !tbaa !5
  %313 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %314 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %315 = fmul contract float %313, %314
  %316 = fadd contract float %303, %315
  %317 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %318 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %319 = fmul contract float %317, %318
  %320 = fadd contract float %316, %319
  %321 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %322 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %323 = fmul contract float %321, %322
  %324 = fadd contract float %320, %323
  %325 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %326 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %327 = fmul contract float %325, %326
  %328 = fadd contract float %324, %327
  %329 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %330 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %331 = fmul contract float %329, %330
  %332 = fadd contract float %328, %331
  %333 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %334 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %335 = fmul contract float %333, %334
  %336 = fadd contract float %332, %335
  %337 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %338 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %339 = fmul contract float %337, %338
  %340 = fadd contract float %336, %339
  %341 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %342 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %343 = fmul contract float %341, %342
  %344 = fadd contract float %340, %343
  %345 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %346 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %347 = fmul contract float %345, %346
  %348 = fadd contract float %344, %347
  %349 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %350 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %351 = fmul contract float %349, %350
  %352 = fadd contract float %348, %351
  %353 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %354 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %355 = fmul contract float %353, %354
  %356 = fadd contract float %352, %355
  %357 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %358 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %359 = fmul contract float %357, %358
  %360 = fadd contract float %356, %359
  %361 = load float, float addrspace(3)* %59, align 16, !tbaa !5
  %362 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %363 = fmul contract float %361, %362
  %364 = fadd contract float %360, %363
  %365 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %366 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %367 = fmul contract float %365, %366
  %368 = fadd contract float %364, %367
  %369 = load float, float addrspace(3)* %63, align 8, !tbaa !5
  %370 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %371 = fmul contract float %369, %370
  %372 = fadd contract float %368, %371
  %373 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %374 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %375 = fmul contract float %373, %374
  %376 = fadd contract float %372, %375
  %377 = load float, float addrspace(3)* %67, align 16, !tbaa !5
  %378 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %379 = fmul contract float %377, %378
  %380 = fadd contract float %376, %379
  %381 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %382 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %383 = fmul contract float %381, %382
  %384 = fadd contract float %380, %383
  %385 = load float, float addrspace(3)* %71, align 8, !tbaa !5
  %386 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %387 = fmul contract float %385, %386
  %388 = fadd contract float %384, %387
  %389 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %390 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %391 = fmul contract float %389, %390
  %392 = fadd contract float %388, %391
  %393 = load float, float addrspace(3)* %75, align 16, !tbaa !5
  %394 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %395 = fmul contract float %393, %394
  %396 = fadd contract float %392, %395
  %397 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %398 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %399 = fmul contract float %397, %398
  %400 = fadd contract float %396, %399
  %401 = load float, float addrspace(3)* %79, align 8, !tbaa !5
  %402 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %403 = fmul contract float %401, %402
  %404 = fadd contract float %400, %403
  %405 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %406 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %407 = fmul contract float %405, %406
  %408 = fadd contract float %404, %407
  %409 = load float, float addrspace(3)* %83, align 16, !tbaa !5
  %410 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %411 = fmul contract float %409, %410
  %412 = fadd contract float %408, %411
  %413 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %414 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %415 = fmul contract float %413, %414
  %416 = fadd contract float %412, %415
  %417 = load float, float addrspace(3)* %87, align 8, !tbaa !5
  %418 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %419 = fmul contract float %417, %418
  %420 = fadd contract float %416, %419
  %421 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %422 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %423 = fmul contract float %421, %422
  %424 = fadd contract float %420, %423
  %425 = load float, float addrspace(3)* %91, align 16, !tbaa !5
  %426 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %427 = fmul contract float %425, %426
  %428 = fadd contract float %424, %427
  %429 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %430 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %431 = fmul contract float %429, %430
  %432 = fadd contract float %428, %431
  %433 = load float, float addrspace(3)* %95, align 8, !tbaa !5
  %434 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %435 = fmul contract float %433, %434
  %436 = fadd contract float %432, %435
  %437 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %438 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %439 = fmul contract float %437, %438
  %440 = fadd contract float %436, %439
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %441 = add nuw nsw i32 %300, 1
  %442 = icmp eq i32 %441, %31
  br i1 %442, label %99, label %299, !llvm.loop !10

443:                                              ; preds = %4, %99
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
