; ModuleID = '../data/hip_kernels/5226/8/main.cu'
source_filename = "../data/hip_kernels/5226/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30MatrixMulVarSharedMemoryKernelPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = shl i32 %3, 5
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = mul i32 %7, %8
  %10 = add nsw i32 %9, %3
  %11 = add nsw i32 %10, -1
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 5
  %14 = shl nsw i32 %5, 5
  %15 = sdiv i32 %4, 32
  %16 = mul i32 %7, %15
  %17 = icmp slt i32 %9, %16
  br i1 %17, label %18, label %241

18:                                               ; preds = %6
  %19 = srem i32 %13, %5
  %20 = sdiv i32 %5, 32
  %21 = shl nsw i32 %20, 5
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %23, label %241

23:                                               ; preds = %18
  %24 = icmp slt i32 %9, %11
  br i1 %24, label %25, label %478

25:                                               ; preds = %23
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = mul i32 %26, %3
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %29 = add i32 %27, %28
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 %28
  %31 = mul i32 %26, %5
  %32 = add i32 %31, %28
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 %26, i32 %28
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 0
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 0, i32 %28
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 1
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 1, i32 %28
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 2
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 2, i32 %28
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 3
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 3, i32 %28
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 4
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 4, i32 %28
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 5
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 5, i32 %28
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 6
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 6, i32 %28
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 7
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 7, i32 %28
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 8
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 8, i32 %28
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 9
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 9, i32 %28
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 10
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 10, i32 %28
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 11
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 11, i32 %28
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 12
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 12, i32 %28
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 13
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 13, i32 %28
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 14
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 14, i32 %28
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 15
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 15, i32 %28
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 16
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 16, i32 %28
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 17
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 17, i32 %28
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 18
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 18, i32 %28
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 19
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 19, i32 %28
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 20
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 20, i32 %28
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 21
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 21, i32 %28
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 22
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 22, i32 %28
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 23
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 23, i32 %28
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 24
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 24, i32 %28
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 25
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 25, i32 %28
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 26
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 26, i32 %28
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 27
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 27, i32 %28
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 28
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 28, i32 %28
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 29
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 29, i32 %28
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 30
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 30, i32 %28
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %26, i32 31
  %97 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 31, i32 %28
  br label %98

98:                                               ; preds = %25, %98
  %99 = phi i32 [ %13, %25 ], [ %239, %98 ]
  %100 = phi i32 [ %9, %25 ], [ %238, %98 ]
  %101 = phi float [ 0.000000e+00, %25 ], [ %237, %98 ]
  %102 = add i32 %29, %100
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %105, float addrspace(3)* %30, align 4, !tbaa !5
  %106 = add i32 %32, %99
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %109, float addrspace(3)* %33, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = load float, float addrspace(3)* %34, align 16, !tbaa !5
  %111 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %101, %112
  %114 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %115 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %38, align 8, !tbaa !5
  %119 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %123 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %42, align 16, !tbaa !5
  %127 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %46, align 8, !tbaa !5
  %135 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %139 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %50, align 16, !tbaa !5
  %143 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %147 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %54, align 8, !tbaa !5
  %151 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %155 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %58, align 16, !tbaa !5
  %159 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  %162 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %163 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %164 = fmul contract float %162, %163
  %165 = fadd contract float %161, %164
  %166 = load float, float addrspace(3)* %62, align 8, !tbaa !5
  %167 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %168 = fmul contract float %166, %167
  %169 = fadd contract float %165, %168
  %170 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %171 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %172 = fmul contract float %170, %171
  %173 = fadd contract float %169, %172
  %174 = load float, float addrspace(3)* %66, align 16, !tbaa !5
  %175 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %176 = fmul contract float %174, %175
  %177 = fadd contract float %173, %176
  %178 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %179 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %180 = fmul contract float %178, %179
  %181 = fadd contract float %177, %180
  %182 = load float, float addrspace(3)* %70, align 8, !tbaa !5
  %183 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %181, %184
  %186 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %187 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %188 = fmul contract float %186, %187
  %189 = fadd contract float %185, %188
  %190 = load float, float addrspace(3)* %74, align 16, !tbaa !5
  %191 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %192 = fmul contract float %190, %191
  %193 = fadd contract float %189, %192
  %194 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %195 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %193, %196
  %198 = load float, float addrspace(3)* %78, align 8, !tbaa !5
  %199 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %200 = fmul contract float %198, %199
  %201 = fadd contract float %197, %200
  %202 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %203 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %204 = fmul contract float %202, %203
  %205 = fadd contract float %201, %204
  %206 = load float, float addrspace(3)* %82, align 16, !tbaa !5
  %207 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %205, %208
  %210 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %211 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %212 = fmul contract float %210, %211
  %213 = fadd contract float %209, %212
  %214 = load float, float addrspace(3)* %86, align 8, !tbaa !5
  %215 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %216 = fmul contract float %214, %215
  %217 = fadd contract float %213, %216
  %218 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %219 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %220 = fmul contract float %218, %219
  %221 = fadd contract float %217, %220
  %222 = load float, float addrspace(3)* %90, align 16, !tbaa !5
  %223 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %224 = fmul contract float %222, %223
  %225 = fadd contract float %221, %224
  %226 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %227 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %228 = fmul contract float %226, %227
  %229 = fadd contract float %225, %228
  %230 = load float, float addrspace(3)* %94, align 8, !tbaa !5
  %231 = load float, float addrspace(3)* %95, align 4, !tbaa !5
  %232 = fmul contract float %230, %231
  %233 = fadd contract float %229, %232
  %234 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %235 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %236 = fmul contract float %234, %235
  %237 = fadd contract float %233, %236
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %238 = add nsw i32 %100, 32
  %239 = add nsw i32 %99, %14
  %240 = icmp slt i32 %238, %11
  br i1 %240, label %98, label %478, !llvm.loop !10

241:                                              ; preds = %18, %6
  %242 = icmp sgt i32 %3, 0
  br i1 %242, label %243, label %478

243:                                              ; preds = %241
  %244 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %245 = shl i32 %8, 5
  %246 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %247 = add i32 %245, %246
  %248 = icmp uge i32 %247, %4
  %249 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 %244
  %250 = mul i32 %246, %3
  %251 = add i32 %250, %244
  %252 = add i32 %13, %244
  %253 = icmp ult i32 %252, %5
  %254 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 %246, i32 %244
  %255 = mul i32 %246, %5
  %256 = add i32 %255, %244
  %257 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 0
  %258 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 0, i32 %244
  %259 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 1
  %260 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 1, i32 %244
  %261 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 2
  %262 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 2, i32 %244
  %263 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 3
  %264 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 3, i32 %244
  %265 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 4
  %266 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 4, i32 %244
  %267 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 5
  %268 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 5, i32 %244
  %269 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 6
  %270 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 6, i32 %244
  %271 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 7
  %272 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 7, i32 %244
  %273 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 8
  %274 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 8, i32 %244
  %275 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 9
  %276 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 9, i32 %244
  %277 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 10
  %278 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 10, i32 %244
  %279 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 11
  %280 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 11, i32 %244
  %281 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 12
  %282 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 12, i32 %244
  %283 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 13
  %284 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 13, i32 %244
  %285 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 14
  %286 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 14, i32 %244
  %287 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 15
  %288 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 15, i32 %244
  %289 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 16
  %290 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 16, i32 %244
  %291 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 17
  %292 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 17, i32 %244
  %293 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 18
  %294 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 18, i32 %244
  %295 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 19
  %296 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 19, i32 %244
  %297 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 20
  %298 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 20, i32 %244
  %299 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 21
  %300 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 21, i32 %244
  %301 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 22
  %302 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 22, i32 %244
  %303 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 23
  %304 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 23, i32 %244
  %305 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 24
  %306 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 24, i32 %244
  %307 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 25
  %308 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 25, i32 %244
  %309 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 26
  %310 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 26, i32 %244
  %311 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 27
  %312 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 27, i32 %244
  %313 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 28
  %314 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 28, i32 %244
  %315 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 29
  %316 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 29, i32 %244
  %317 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 30
  %318 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 30, i32 %244
  %319 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ms, i32 0, i32 %246, i32 31
  %320 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ30MatrixMulVarSharedMemoryKernelPfS_S_iiiE2Ns, i32 0, i32 31, i32 %244
  br label %321

321:                                              ; preds = %243, %345
  %322 = phi i32 [ %13, %243 ], [ %476, %345 ]
  %323 = phi i32 [ %9, %243 ], [ %475, %345 ]
  %324 = phi float [ 0.000000e+00, %243 ], [ %474, %345 ]
  %325 = srem i32 %323, %3
  %326 = add i32 %325, %244
  %327 = icmp uge i32 %326, %3
  %328 = select i1 %327, i1 true, i1 %248
  br i1 %328, label %334, label %329

329:                                              ; preds = %321
  %330 = add i32 %251, %323
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds float, float addrspace(1)* %0, i64 %331
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %334

334:                                              ; preds = %321, %329
  %335 = phi float [ %333, %329 ], [ 0.000000e+00, %321 ]
  store float %335, float addrspace(3)* %249, align 4, !tbaa !5
  %336 = sdiv i32 %322, %5
  %337 = add i32 %336, %246
  %338 = icmp ult i32 %337, %3
  %339 = select i1 %338, i1 %253, i1 false
  br i1 %339, label %340, label %345

340:                                              ; preds = %334
  %341 = add i32 %256, %322
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, float addrspace(1)* %1, i64 %342
  %344 = load float, float addrspace(1)* %343, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %345

345:                                              ; preds = %334, %340
  %346 = phi float [ %344, %340 ], [ 0.000000e+00, %334 ]
  store float %346, float addrspace(3)* %254, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %347 = load float, float addrspace(3)* %257, align 16, !tbaa !5
  %348 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %349 = fmul contract float %347, %348
  %350 = fadd contract float %324, %349
  %351 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %352 = load float, float addrspace(3)* %260, align 4, !tbaa !5
  %353 = fmul contract float %351, %352
  %354 = fadd contract float %350, %353
  %355 = load float, float addrspace(3)* %261, align 8, !tbaa !5
  %356 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %357 = fmul contract float %355, %356
  %358 = fadd contract float %354, %357
  %359 = load float, float addrspace(3)* %263, align 4, !tbaa !5
  %360 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %361 = fmul contract float %359, %360
  %362 = fadd contract float %358, %361
  %363 = load float, float addrspace(3)* %265, align 16, !tbaa !5
  %364 = load float, float addrspace(3)* %266, align 4, !tbaa !5
  %365 = fmul contract float %363, %364
  %366 = fadd contract float %362, %365
  %367 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %368 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %369 = fmul contract float %367, %368
  %370 = fadd contract float %366, %369
  %371 = load float, float addrspace(3)* %269, align 8, !tbaa !5
  %372 = load float, float addrspace(3)* %270, align 4, !tbaa !5
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %370, %373
  %375 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %376 = load float, float addrspace(3)* %272, align 4, !tbaa !5
  %377 = fmul contract float %375, %376
  %378 = fadd contract float %374, %377
  %379 = load float, float addrspace(3)* %273, align 16, !tbaa !5
  %380 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %381 = fmul contract float %379, %380
  %382 = fadd contract float %378, %381
  %383 = load float, float addrspace(3)* %275, align 4, !tbaa !5
  %384 = load float, float addrspace(3)* %276, align 4, !tbaa !5
  %385 = fmul contract float %383, %384
  %386 = fadd contract float %382, %385
  %387 = load float, float addrspace(3)* %277, align 8, !tbaa !5
  %388 = load float, float addrspace(3)* %278, align 4, !tbaa !5
  %389 = fmul contract float %387, %388
  %390 = fadd contract float %386, %389
  %391 = load float, float addrspace(3)* %279, align 4, !tbaa !5
  %392 = load float, float addrspace(3)* %280, align 4, !tbaa !5
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %390, %393
  %395 = load float, float addrspace(3)* %281, align 16, !tbaa !5
  %396 = load float, float addrspace(3)* %282, align 4, !tbaa !5
  %397 = fmul contract float %395, %396
  %398 = fadd contract float %394, %397
  %399 = load float, float addrspace(3)* %283, align 4, !tbaa !5
  %400 = load float, float addrspace(3)* %284, align 4, !tbaa !5
  %401 = fmul contract float %399, %400
  %402 = fadd contract float %398, %401
  %403 = load float, float addrspace(3)* %285, align 8, !tbaa !5
  %404 = load float, float addrspace(3)* %286, align 4, !tbaa !5
  %405 = fmul contract float %403, %404
  %406 = fadd contract float %402, %405
  %407 = load float, float addrspace(3)* %287, align 4, !tbaa !5
  %408 = load float, float addrspace(3)* %288, align 4, !tbaa !5
  %409 = fmul contract float %407, %408
  %410 = fadd contract float %406, %409
  %411 = load float, float addrspace(3)* %289, align 16, !tbaa !5
  %412 = load float, float addrspace(3)* %290, align 4, !tbaa !5
  %413 = fmul contract float %411, %412
  %414 = fadd contract float %410, %413
  %415 = load float, float addrspace(3)* %291, align 4, !tbaa !5
  %416 = load float, float addrspace(3)* %292, align 4, !tbaa !5
  %417 = fmul contract float %415, %416
  %418 = fadd contract float %414, %417
  %419 = load float, float addrspace(3)* %293, align 8, !tbaa !5
  %420 = load float, float addrspace(3)* %294, align 4, !tbaa !5
  %421 = fmul contract float %419, %420
  %422 = fadd contract float %418, %421
  %423 = load float, float addrspace(3)* %295, align 4, !tbaa !5
  %424 = load float, float addrspace(3)* %296, align 4, !tbaa !5
  %425 = fmul contract float %423, %424
  %426 = fadd contract float %422, %425
  %427 = load float, float addrspace(3)* %297, align 16, !tbaa !5
  %428 = load float, float addrspace(3)* %298, align 4, !tbaa !5
  %429 = fmul contract float %427, %428
  %430 = fadd contract float %426, %429
  %431 = load float, float addrspace(3)* %299, align 4, !tbaa !5
  %432 = load float, float addrspace(3)* %300, align 4, !tbaa !5
  %433 = fmul contract float %431, %432
  %434 = fadd contract float %430, %433
  %435 = load float, float addrspace(3)* %301, align 8, !tbaa !5
  %436 = load float, float addrspace(3)* %302, align 4, !tbaa !5
  %437 = fmul contract float %435, %436
  %438 = fadd contract float %434, %437
  %439 = load float, float addrspace(3)* %303, align 4, !tbaa !5
  %440 = load float, float addrspace(3)* %304, align 4, !tbaa !5
  %441 = fmul contract float %439, %440
  %442 = fadd contract float %438, %441
  %443 = load float, float addrspace(3)* %305, align 16, !tbaa !5
  %444 = load float, float addrspace(3)* %306, align 4, !tbaa !5
  %445 = fmul contract float %443, %444
  %446 = fadd contract float %442, %445
  %447 = load float, float addrspace(3)* %307, align 4, !tbaa !5
  %448 = load float, float addrspace(3)* %308, align 4, !tbaa !5
  %449 = fmul contract float %447, %448
  %450 = fadd contract float %446, %449
  %451 = load float, float addrspace(3)* %309, align 8, !tbaa !5
  %452 = load float, float addrspace(3)* %310, align 4, !tbaa !5
  %453 = fmul contract float %451, %452
  %454 = fadd contract float %450, %453
  %455 = load float, float addrspace(3)* %311, align 4, !tbaa !5
  %456 = load float, float addrspace(3)* %312, align 4, !tbaa !5
  %457 = fmul contract float %455, %456
  %458 = fadd contract float %454, %457
  %459 = load float, float addrspace(3)* %313, align 16, !tbaa !5
  %460 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %461 = fmul contract float %459, %460
  %462 = fadd contract float %458, %461
  %463 = load float, float addrspace(3)* %315, align 4, !tbaa !5
  %464 = load float, float addrspace(3)* %316, align 4, !tbaa !5
  %465 = fmul contract float %463, %464
  %466 = fadd contract float %462, %465
  %467 = load float, float addrspace(3)* %317, align 8, !tbaa !5
  %468 = load float, float addrspace(3)* %318, align 4, !tbaa !5
  %469 = fmul contract float %467, %468
  %470 = fadd contract float %466, %469
  %471 = load float, float addrspace(3)* %319, align 4, !tbaa !5
  %472 = load float, float addrspace(3)* %320, align 4, !tbaa !5
  %473 = fmul contract float %471, %472
  %474 = fadd contract float %470, %473
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %475 = add nsw i32 %323, 32
  %476 = add nsw i32 %322, %14
  %477 = icmp slt i32 %475, %10
  br i1 %477, label %321, label %478, !llvm.loop !12

478:                                              ; preds = %345, %98, %241, %23
  %479 = phi float [ 0.000000e+00, %23 ], [ 0.000000e+00, %241 ], [ %237, %98 ], [ %474, %345 ]
  %480 = shl i32 %8, 5
  %481 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %482 = add i32 %480, %481
  %483 = icmp ult i32 %482, %4
  br i1 %483, label %484, label %495

484:                                              ; preds = %478
  %485 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %486 = add i32 %13, %485
  %487 = icmp ult i32 %486, %5
  br i1 %487, label %488, label %495

488:                                              ; preds = %484
  %489 = mul i32 %14, %8
  %490 = mul i32 %481, %5
  %491 = add i32 %486, %490
  %492 = add i32 %491, %489
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, float addrspace(1)* %2, i64 %493
  store float %479, float addrspace(1)* %494, align 4, !tbaa !5
  br label %495

495:                                              ; preds = %488, %484, %478
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
