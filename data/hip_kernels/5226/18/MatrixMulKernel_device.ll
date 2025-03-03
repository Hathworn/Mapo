; ModuleID = '../data/hip_kernels/5226/18/main.cu'
source_filename = "../data/hip_kernels/5226/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15MatrixMulKernelPfS_S_iE2Ms = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ15MatrixMulKernelPfS_S_iE2Ns = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = shl nsw i32 %3, 5
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = mul i32 %5, %6
  %8 = add nsw i32 %3, -1
  %9 = add i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 5
  %12 = icmp slt i32 %7, %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = mul i32 %13, %3
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  br i1 %12, label %16, label %84

16:                                               ; preds = %4
  %17 = add i32 %14, %15
  %18 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 %15
  %19 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 %13, i32 %15
  %20 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 0
  %21 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 0, i32 %15
  %22 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 1
  %23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 1, i32 %15
  %24 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 2
  %25 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 2, i32 %15
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 3
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 3, i32 %15
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 4
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 4, i32 %15
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 5
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 5, i32 %15
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 6
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 6, i32 %15
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 7
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 7, i32 %15
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 8
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 8, i32 %15
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 9
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 9, i32 %15
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 10
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 10, i32 %15
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 11
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 11, i32 %15
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 12
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 12, i32 %15
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 13
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 13, i32 %15
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 14
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 14, i32 %15
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 15
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 15, i32 %15
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 16
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 16, i32 %15
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 17
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 17, i32 %15
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 18
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 18, i32 %15
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 19
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 19, i32 %15
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 20
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 20, i32 %15
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 21
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 21, i32 %15
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 22
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 22, i32 %15
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 23
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 23, i32 %15
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 24
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 24, i32 %15
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 25
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 25, i32 %15
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 26
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 26, i32 %15
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 27
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 27, i32 %15
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 28
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 28, i32 %15
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 29
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 29, i32 %15
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 30
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 30, i32 %15
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ms, i32 0, i32 %13, i32 31
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE2Ns, i32 0, i32 31, i32 %15
  br label %91

84:                                               ; preds = %91, %4
  %85 = phi float [ 0.000000e+00, %4 ], [ %230, %91 ]
  %86 = add i32 %11, %15
  %87 = add i32 %86, %14
  %88 = add i32 %87, %7
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  store float %85, float addrspace(1)* %90, align 4, !tbaa !5
  ret void

91:                                               ; preds = %16, %91
  %92 = phi i32 [ %11, %16 ], [ %232, %91 ]
  %93 = phi i32 [ %7, %16 ], [ %231, %91 ]
  %94 = phi float [ 0.000000e+00, %16 ], [ %230, %91 ]
  %95 = add i32 %17, %93
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %98, float addrspace(3)* %18, align 4, !tbaa !5
  %99 = add i32 %17, %92
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %102, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = load float, float addrspace(3)* %20, align 16, !tbaa !5
  %104 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %94, %105
  %107 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %108 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %112 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %120 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %124 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %128 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %132 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %136 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %140 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %144 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %148 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %152 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  %155 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %156 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %154, %157
  %159 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %160 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %161 = fmul contract float %159, %160
  %162 = fadd contract float %158, %161
  %163 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %164 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %165 = fmul contract float %163, %164
  %166 = fadd contract float %162, %165
  %167 = load float, float addrspace(3)* %52, align 16, !tbaa !5
  %168 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %169 = fmul contract float %167, %168
  %170 = fadd contract float %166, %169
  %171 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %172 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %173 = fmul contract float %171, %172
  %174 = fadd contract float %170, %173
  %175 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %176 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %177 = fmul contract float %175, %176
  %178 = fadd contract float %174, %177
  %179 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %180 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %181 = fmul contract float %179, %180
  %182 = fadd contract float %178, %181
  %183 = load float, float addrspace(3)* %60, align 16, !tbaa !5
  %184 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %185 = fmul contract float %183, %184
  %186 = fadd contract float %182, %185
  %187 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %188 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %186, %189
  %191 = load float, float addrspace(3)* %64, align 8, !tbaa !5
  %192 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %193 = fmul contract float %191, %192
  %194 = fadd contract float %190, %193
  %195 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %196 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %197 = fmul contract float %195, %196
  %198 = fadd contract float %194, %197
  %199 = load float, float addrspace(3)* %68, align 16, !tbaa !5
  %200 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %198, %201
  %203 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %204 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %205 = fmul contract float %203, %204
  %206 = fadd contract float %202, %205
  %207 = load float, float addrspace(3)* %72, align 8, !tbaa !5
  %208 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %209 = fmul contract float %207, %208
  %210 = fadd contract float %206, %209
  %211 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %212 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %210, %213
  %215 = load float, float addrspace(3)* %76, align 16, !tbaa !5
  %216 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %217 = fmul contract float %215, %216
  %218 = fadd contract float %214, %217
  %219 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %220 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %221 = fmul contract float %219, %220
  %222 = fadd contract float %218, %221
  %223 = load float, float addrspace(3)* %80, align 8, !tbaa !5
  %224 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %225 = fmul contract float %223, %224
  %226 = fadd contract float %222, %225
  %227 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %228 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %229 = fmul contract float %227, %228
  %230 = fadd contract float %226, %229
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %231 = add nsw i32 %93, 32
  %232 = add nsw i32 %92, %5
  %233 = icmp slt i32 %231, %9
  br i1 %233, label %91, label %84, !llvm.loop !10
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
