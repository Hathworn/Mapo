; ModuleID = '../data/hip_kernels/14521/9/main.cu'
source_filename = "../data/hip_kernels/14521/9/main.cu"
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
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %56, label %17

17:                                               ; preds = %6
  %18 = sub nsw i32 %2, %15
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %254

20:                                               ; preds = %17
  %21 = mul nsw i32 %12, %2
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 0
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 0, i32 %9
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 1
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 1, i32 %9
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 2
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 2, i32 %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 3
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 3, i32 %9
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 4
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 4, i32 %9
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 5
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 5, i32 %9
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 6
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 6, i32 %9
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 7
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 7, i32 %9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 8, i32 %9
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 9, i32 %9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 10
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 10, i32 %9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 11
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 11, i32 %9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 12
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 12, i32 %9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 13
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 13, i32 %9
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 14
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 14, i32 %9
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 15
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 15, i32 %9
  br label %174

56:                                               ; preds = %6
  %57 = icmp sgt i32 %2, 0
  br i1 %57, label %58, label %369

58:                                               ; preds = %56
  %59 = mul nsw i32 %12, %2
  %60 = add i32 %59, %9
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 0
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 0, i32 %9
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 1
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 1, i32 %9
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 2
  %68 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 2, i32 %9
  %69 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 3
  %70 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 3, i32 %9
  %71 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 4
  %72 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 4, i32 %9
  %73 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 5
  %74 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 5, i32 %9
  %75 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 6
  %76 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 6, i32 %9
  %77 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 7
  %78 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 7, i32 %9
  %79 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 8
  %80 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 8, i32 %9
  %81 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 9
  %82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 9, i32 %9
  %83 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 10
  %84 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 10, i32 %9
  %85 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 11
  %86 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 11, i32 %9
  %87 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 12
  %88 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 12, i32 %9
  %89 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 13
  %90 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 13, i32 %9
  %91 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 14
  %92 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 14, i32 %9
  %93 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 15
  %94 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 15, i32 %9
  br label %95

95:                                               ; preds = %58, %95
  %96 = phi float [ 0.000000e+00, %58 ], [ %171, %95 ]
  %97 = phi i32 [ 0, %58 ], [ %172, %95 ]
  %98 = add i32 %60, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %3, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %101, float addrspace(3)* %61, align 4, !tbaa !5
  %102 = add nuw nsw i32 %97, %10
  %103 = mul nsw i32 %102, %1
  %104 = add nsw i32 %103, %14
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %4, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %107, float addrspace(3)* %62, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = load float, float addrspace(3)* %63, align 16, !tbaa !5
  %109 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %96, %110
  %112 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %113 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %67, align 8, !tbaa !5
  %117 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %71, align 16, !tbaa !5
  %125 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %129 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %75, align 8, !tbaa !5
  %133 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %137 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %79, align 16, !tbaa !5
  %141 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %145 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %83, align 8, !tbaa !5
  %149 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %153 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %87, align 16, !tbaa !5
  %157 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %161 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %91, align 8, !tbaa !5
  %165 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %169 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %172 = add nuw nsw i32 %97, 16
  %173 = icmp slt i32 %172, %2
  br i1 %173, label %95, label %369, !llvm.loop !10

174:                                              ; preds = %20, %174
  %175 = phi float [ 0.000000e+00, %20 ], [ %251, %174 ]
  %176 = phi i32 [ 0, %20 ], [ %252, %174 ]
  %177 = add nuw i32 %176, %9
  %178 = add i32 %177, %21
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %3, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %181, float addrspace(3)* %22, align 4, !tbaa !5
  %182 = add nuw nsw i32 %176, %10
  %183 = mul nsw i32 %182, %1
  %184 = add nsw i32 %183, %14
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %4, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %187, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %188 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %189 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %175, %190
  %192 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %193 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %197 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %201 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %205 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %209 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %213 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %217 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %40, align 16, !tbaa !5
  %221 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %225 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %44, align 8, !tbaa !5
  %229 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %233 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  %236 = load float, float addrspace(3)* %48, align 16, !tbaa !5
  %237 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %235, %238
  %240 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %241 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %242 = fmul contract float %240, %241
  %243 = fadd contract float %239, %242
  %244 = load float, float addrspace(3)* %52, align 8, !tbaa !5
  %245 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %246 = fmul contract float %244, %245
  %247 = fadd contract float %243, %246
  %248 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %249 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %250 = fmul contract float %248, %249
  %251 = fadd contract float %247, %250
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %252 = add nuw nsw i32 %176, 16
  %253 = icmp slt i32 %252, %18
  br i1 %253, label %174, label %254, !llvm.loop !12

254:                                              ; preds = %174, %17
  %255 = phi i32 [ 0, %17 ], [ %252, %174 ]
  %256 = phi float [ 0.000000e+00, %17 ], [ %251, %174 ]
  %257 = icmp slt i32 %14, %2
  %258 = icmp slt i32 %12, %0
  %259 = select i1 %257, i1 %258, i1 false
  br i1 %259, label %260, label %267

260:                                              ; preds = %254
  %261 = mul nsw i32 %12, %2
  %262 = add i32 %255, %9
  %263 = add i32 %262, %261
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %3, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %267

267:                                              ; preds = %254, %260
  %268 = phi float [ %266, %260 ], [ 0.000000e+00, %254 ]
  %269 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %9
  store float %268, float addrspace(3)* %269, align 4
  %270 = icmp slt i32 %12, %2
  %271 = icmp slt i32 %14, %1
  %272 = select i1 %270, i1 %271, i1 false
  br i1 %272, label %273, label %280

273:                                              ; preds = %267
  %274 = add nuw nsw i32 %255, %10
  %275 = mul nsw i32 %274, %1
  %276 = add nsw i32 %275, %14
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds float, float addrspace(1)* %4, i64 %277
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %280

280:                                              ; preds = %267, %273
  %281 = phi float [ %279, %273 ], [ 0.000000e+00, %267 ]
  %282 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %10, i32 %9
  store float %281, float addrspace(3)* %282, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %283 = icmp sgt i32 %15, 0
  br i1 %283, label %284, label %369

284:                                              ; preds = %280
  %285 = and i32 %15, 7
  %286 = icmp ult i32 %15, 8
  br i1 %286, label %351, label %287

287:                                              ; preds = %284
  %288 = and i32 %15, -8
  br label %289

289:                                              ; preds = %289, %287
  %290 = phi float [ %256, %287 ], [ %347, %289 ]
  %291 = phi i32 [ 0, %287 ], [ %348, %289 ]
  %292 = phi i32 [ 0, %287 ], [ %349, %289 ]
  %293 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %291
  %294 = load float, float addrspace(3)* %293, align 16, !tbaa !5
  %295 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %291, i32 %9
  %296 = load float, float addrspace(3)* %295, align 4, !tbaa !5
  %297 = fmul contract float %294, %296
  %298 = fadd contract float %290, %297
  %299 = or i32 %291, 1
  %300 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %299
  %301 = load float, float addrspace(3)* %300, align 4, !tbaa !5
  %302 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %299, i32 %9
  %303 = load float, float addrspace(3)* %302, align 4, !tbaa !5
  %304 = fmul contract float %301, %303
  %305 = fadd contract float %298, %304
  %306 = or i32 %291, 2
  %307 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %306
  %308 = load float, float addrspace(3)* %307, align 8, !tbaa !5
  %309 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %306, i32 %9
  %310 = load float, float addrspace(3)* %309, align 4, !tbaa !5
  %311 = fmul contract float %308, %310
  %312 = fadd contract float %305, %311
  %313 = or i32 %291, 3
  %314 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %313
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %313, i32 %9
  %317 = load float, float addrspace(3)* %316, align 4, !tbaa !5
  %318 = fmul contract float %315, %317
  %319 = fadd contract float %312, %318
  %320 = or i32 %291, 4
  %321 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %320
  %322 = load float, float addrspace(3)* %321, align 16, !tbaa !5
  %323 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %320, i32 %9
  %324 = load float, float addrspace(3)* %323, align 4, !tbaa !5
  %325 = fmul contract float %322, %324
  %326 = fadd contract float %319, %325
  %327 = or i32 %291, 5
  %328 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %327
  %329 = load float, float addrspace(3)* %328, align 4, !tbaa !5
  %330 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %327, i32 %9
  %331 = load float, float addrspace(3)* %330, align 4, !tbaa !5
  %332 = fmul contract float %329, %331
  %333 = fadd contract float %326, %332
  %334 = or i32 %291, 6
  %335 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %334
  %336 = load float, float addrspace(3)* %335, align 8, !tbaa !5
  %337 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %334, i32 %9
  %338 = load float, float addrspace(3)* %337, align 4, !tbaa !5
  %339 = fmul contract float %336, %338
  %340 = fadd contract float %333, %339
  %341 = or i32 %291, 7
  %342 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %341
  %343 = load float, float addrspace(3)* %342, align 4, !tbaa !5
  %344 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %341, i32 %9
  %345 = load float, float addrspace(3)* %344, align 4, !tbaa !5
  %346 = fmul contract float %343, %345
  %347 = fadd contract float %340, %346
  %348 = add nuw nsw i32 %291, 8
  %349 = add i32 %292, 8
  %350 = icmp eq i32 %349, %288
  br i1 %350, label %351, label %289, !llvm.loop !13

351:                                              ; preds = %289, %284
  %352 = phi float [ undef, %284 ], [ %347, %289 ]
  %353 = phi float [ %256, %284 ], [ %347, %289 ]
  %354 = phi i32 [ 0, %284 ], [ %348, %289 ]
  %355 = icmp eq i32 %285, 0
  br i1 %355, label %369, label %356

356:                                              ; preds = %351, %356
  %357 = phi float [ %365, %356 ], [ %353, %351 ]
  %358 = phi i32 [ %366, %356 ], [ %354, %351 ]
  %359 = phi i32 [ %367, %356 ], [ 0, %351 ]
  %360 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sA, i32 0, i32 %10, i32 %358
  %361 = load float, float addrspace(3)* %360, align 4, !tbaa !5
  %362 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8Kernel11iiiPfS_S_E2sB, i32 0, i32 %358, i32 %9
  %363 = load float, float addrspace(3)* %362, align 4, !tbaa !5
  %364 = fmul contract float %361, %363
  %365 = fadd contract float %357, %364
  %366 = add nuw nsw i32 %358, 1
  %367 = add i32 %359, 1
  %368 = icmp eq i32 %367, %285
  br i1 %368, label %369, label %356, !llvm.loop !14

369:                                              ; preds = %351, %356, %95, %280, %56
  %370 = phi float [ 0.000000e+00, %56 ], [ %256, %280 ], [ %171, %95 ], [ %352, %351 ], [ %365, %356 ]
  %371 = icmp slt i32 %12, %0
  %372 = icmp slt i32 %14, %1
  %373 = select i1 %371, i1 %372, i1 false
  br i1 %373, label %374, label %379

374:                                              ; preds = %369
  %375 = mul nsw i32 %12, %1
  %376 = add nsw i32 %375, %14
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %5, i64 %377
  store float %370, float addrspace(1)* %378, align 4, !tbaa !5
  br label %379

379:                                              ; preds = %374, %369
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
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
