; ModuleID = '../data/hip_kernels/4024/0/main.cu'
source_filename = "../data/hip_kernels/4024/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18matrixMulOptimizedPiS_S_E7a_share = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ18matrixMulOptimizedPiS_S_E7b_share = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18matrixMulOptimizedPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = shl nsw i32 %12, 10
  %22 = or i32 %21, %19
  %23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 %19
  %24 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 %11, i32 %19
  %25 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 0
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 0, i32 %19
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 1
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 1, i32 %19
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 2
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 2, i32 %19
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 3
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 3, i32 %19
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 4
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 4, i32 %19
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 5
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 5, i32 %19
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 6
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 6, i32 %19
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 7
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 7, i32 %19
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 8
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 8, i32 %19
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 9
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 9, i32 %19
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 10
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 10, i32 %19
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 11
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 11, i32 %19
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 12
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 12, i32 %19
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 13
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 13, i32 %19
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 14
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 14, i32 %19
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 15
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 15, i32 %19
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 16
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 16, i32 %19
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 17
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 17, i32 %19
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 18
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 18, i32 %19
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 19
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 19, i32 %19
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 20
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 20, i32 %19
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 21
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 21, i32 %19
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 22
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 22, i32 %19
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 23
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 23, i32 %19
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 24
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 24, i32 %19
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 25
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 25, i32 %19
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 26
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 26, i32 %19
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 27
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 27, i32 %19
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 28
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 28, i32 %19
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 29
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 29, i32 %19
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 30
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 30, i32 %19
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7a_share, i32 0, i32 %11, i32 31
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ18matrixMulOptimizedPiS_S_E7b_share, i32 0, i32 31, i32 %19
  br label %93

89:                                               ; preds = %93
  %90 = add nsw i32 %21, %20
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %91
  store i32 %301, i32 addrspace(1)* %92, align 4, !tbaa !7
  ret void

93:                                               ; preds = %3, %93
  %94 = phi i32 [ 0, %3 ], [ %302, %93 ]
  %95 = phi i32 [ 0, %3 ], [ %301, %93 ]
  %96 = mul nuw nsw i32 %94, %9
  %97 = add i32 %22, %96
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = sitofp i32 %100 to float
  store float %101, float addrspace(3)* %23, align 4, !tbaa !11
  %102 = mul nuw nsw i32 %94, %17
  %103 = add i32 %102, %5
  %104 = shl i32 %103, 10
  %105 = add i32 %104, %20
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = sitofp i32 %108 to float
  store float %109, float addrspace(3)* %24, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = load float, float addrspace(3)* %25, align 16, !tbaa !11
  %111 = load float, float addrspace(3)* %26, align 4, !tbaa !11
  %112 = fmul contract float %110, %111
  %113 = sitofp i32 %95 to float
  %114 = fadd contract float %112, %113
  %115 = fptosi float %114 to i32
  %116 = load float, float addrspace(3)* %27, align 4, !tbaa !11
  %117 = load float, float addrspace(3)* %28, align 4, !tbaa !11
  %118 = fmul contract float %116, %117
  %119 = sitofp i32 %115 to float
  %120 = fadd contract float %118, %119
  %121 = fptosi float %120 to i32
  %122 = load float, float addrspace(3)* %29, align 8, !tbaa !11
  %123 = load float, float addrspace(3)* %30, align 4, !tbaa !11
  %124 = fmul contract float %122, %123
  %125 = sitofp i32 %121 to float
  %126 = fadd contract float %124, %125
  %127 = fptosi float %126 to i32
  %128 = load float, float addrspace(3)* %31, align 4, !tbaa !11
  %129 = load float, float addrspace(3)* %32, align 4, !tbaa !11
  %130 = fmul contract float %128, %129
  %131 = sitofp i32 %127 to float
  %132 = fadd contract float %130, %131
  %133 = fptosi float %132 to i32
  %134 = load float, float addrspace(3)* %33, align 16, !tbaa !11
  %135 = load float, float addrspace(3)* %34, align 4, !tbaa !11
  %136 = fmul contract float %134, %135
  %137 = sitofp i32 %133 to float
  %138 = fadd contract float %136, %137
  %139 = fptosi float %138 to i32
  %140 = load float, float addrspace(3)* %35, align 4, !tbaa !11
  %141 = load float, float addrspace(3)* %36, align 4, !tbaa !11
  %142 = fmul contract float %140, %141
  %143 = sitofp i32 %139 to float
  %144 = fadd contract float %142, %143
  %145 = fptosi float %144 to i32
  %146 = load float, float addrspace(3)* %37, align 8, !tbaa !11
  %147 = load float, float addrspace(3)* %38, align 4, !tbaa !11
  %148 = fmul contract float %146, %147
  %149 = sitofp i32 %145 to float
  %150 = fadd contract float %148, %149
  %151 = fptosi float %150 to i32
  %152 = load float, float addrspace(3)* %39, align 4, !tbaa !11
  %153 = load float, float addrspace(3)* %40, align 4, !tbaa !11
  %154 = fmul contract float %152, %153
  %155 = sitofp i32 %151 to float
  %156 = fadd contract float %154, %155
  %157 = fptosi float %156 to i32
  %158 = load float, float addrspace(3)* %41, align 16, !tbaa !11
  %159 = load float, float addrspace(3)* %42, align 4, !tbaa !11
  %160 = fmul contract float %158, %159
  %161 = sitofp i32 %157 to float
  %162 = fadd contract float %160, %161
  %163 = fptosi float %162 to i32
  %164 = load float, float addrspace(3)* %43, align 4, !tbaa !11
  %165 = load float, float addrspace(3)* %44, align 4, !tbaa !11
  %166 = fmul contract float %164, %165
  %167 = sitofp i32 %163 to float
  %168 = fadd contract float %166, %167
  %169 = fptosi float %168 to i32
  %170 = load float, float addrspace(3)* %45, align 8, !tbaa !11
  %171 = load float, float addrspace(3)* %46, align 4, !tbaa !11
  %172 = fmul contract float %170, %171
  %173 = sitofp i32 %169 to float
  %174 = fadd contract float %172, %173
  %175 = fptosi float %174 to i32
  %176 = load float, float addrspace(3)* %47, align 4, !tbaa !11
  %177 = load float, float addrspace(3)* %48, align 4, !tbaa !11
  %178 = fmul contract float %176, %177
  %179 = sitofp i32 %175 to float
  %180 = fadd contract float %178, %179
  %181 = fptosi float %180 to i32
  %182 = load float, float addrspace(3)* %49, align 16, !tbaa !11
  %183 = load float, float addrspace(3)* %50, align 4, !tbaa !11
  %184 = fmul contract float %182, %183
  %185 = sitofp i32 %181 to float
  %186 = fadd contract float %184, %185
  %187 = fptosi float %186 to i32
  %188 = load float, float addrspace(3)* %51, align 4, !tbaa !11
  %189 = load float, float addrspace(3)* %52, align 4, !tbaa !11
  %190 = fmul contract float %188, %189
  %191 = sitofp i32 %187 to float
  %192 = fadd contract float %190, %191
  %193 = fptosi float %192 to i32
  %194 = load float, float addrspace(3)* %53, align 8, !tbaa !11
  %195 = load float, float addrspace(3)* %54, align 4, !tbaa !11
  %196 = fmul contract float %194, %195
  %197 = sitofp i32 %193 to float
  %198 = fadd contract float %196, %197
  %199 = fptosi float %198 to i32
  %200 = load float, float addrspace(3)* %55, align 4, !tbaa !11
  %201 = load float, float addrspace(3)* %56, align 4, !tbaa !11
  %202 = fmul contract float %200, %201
  %203 = sitofp i32 %199 to float
  %204 = fadd contract float %202, %203
  %205 = fptosi float %204 to i32
  %206 = load float, float addrspace(3)* %57, align 16, !tbaa !11
  %207 = load float, float addrspace(3)* %58, align 4, !tbaa !11
  %208 = fmul contract float %206, %207
  %209 = sitofp i32 %205 to float
  %210 = fadd contract float %208, %209
  %211 = fptosi float %210 to i32
  %212 = load float, float addrspace(3)* %59, align 4, !tbaa !11
  %213 = load float, float addrspace(3)* %60, align 4, !tbaa !11
  %214 = fmul contract float %212, %213
  %215 = sitofp i32 %211 to float
  %216 = fadd contract float %214, %215
  %217 = fptosi float %216 to i32
  %218 = load float, float addrspace(3)* %61, align 8, !tbaa !11
  %219 = load float, float addrspace(3)* %62, align 4, !tbaa !11
  %220 = fmul contract float %218, %219
  %221 = sitofp i32 %217 to float
  %222 = fadd contract float %220, %221
  %223 = fptosi float %222 to i32
  %224 = load float, float addrspace(3)* %63, align 4, !tbaa !11
  %225 = load float, float addrspace(3)* %64, align 4, !tbaa !11
  %226 = fmul contract float %224, %225
  %227 = sitofp i32 %223 to float
  %228 = fadd contract float %226, %227
  %229 = fptosi float %228 to i32
  %230 = load float, float addrspace(3)* %65, align 16, !tbaa !11
  %231 = load float, float addrspace(3)* %66, align 4, !tbaa !11
  %232 = fmul contract float %230, %231
  %233 = sitofp i32 %229 to float
  %234 = fadd contract float %232, %233
  %235 = fptosi float %234 to i32
  %236 = load float, float addrspace(3)* %67, align 4, !tbaa !11
  %237 = load float, float addrspace(3)* %68, align 4, !tbaa !11
  %238 = fmul contract float %236, %237
  %239 = sitofp i32 %235 to float
  %240 = fadd contract float %238, %239
  %241 = fptosi float %240 to i32
  %242 = load float, float addrspace(3)* %69, align 8, !tbaa !11
  %243 = load float, float addrspace(3)* %70, align 4, !tbaa !11
  %244 = fmul contract float %242, %243
  %245 = sitofp i32 %241 to float
  %246 = fadd contract float %244, %245
  %247 = fptosi float %246 to i32
  %248 = load float, float addrspace(3)* %71, align 4, !tbaa !11
  %249 = load float, float addrspace(3)* %72, align 4, !tbaa !11
  %250 = fmul contract float %248, %249
  %251 = sitofp i32 %247 to float
  %252 = fadd contract float %250, %251
  %253 = fptosi float %252 to i32
  %254 = load float, float addrspace(3)* %73, align 16, !tbaa !11
  %255 = load float, float addrspace(3)* %74, align 4, !tbaa !11
  %256 = fmul contract float %254, %255
  %257 = sitofp i32 %253 to float
  %258 = fadd contract float %256, %257
  %259 = fptosi float %258 to i32
  %260 = load float, float addrspace(3)* %75, align 4, !tbaa !11
  %261 = load float, float addrspace(3)* %76, align 4, !tbaa !11
  %262 = fmul contract float %260, %261
  %263 = sitofp i32 %259 to float
  %264 = fadd contract float %262, %263
  %265 = fptosi float %264 to i32
  %266 = load float, float addrspace(3)* %77, align 8, !tbaa !11
  %267 = load float, float addrspace(3)* %78, align 4, !tbaa !11
  %268 = fmul contract float %266, %267
  %269 = sitofp i32 %265 to float
  %270 = fadd contract float %268, %269
  %271 = fptosi float %270 to i32
  %272 = load float, float addrspace(3)* %79, align 4, !tbaa !11
  %273 = load float, float addrspace(3)* %80, align 4, !tbaa !11
  %274 = fmul contract float %272, %273
  %275 = sitofp i32 %271 to float
  %276 = fadd contract float %274, %275
  %277 = fptosi float %276 to i32
  %278 = load float, float addrspace(3)* %81, align 16, !tbaa !11
  %279 = load float, float addrspace(3)* %82, align 4, !tbaa !11
  %280 = fmul contract float %278, %279
  %281 = sitofp i32 %277 to float
  %282 = fadd contract float %280, %281
  %283 = fptosi float %282 to i32
  %284 = load float, float addrspace(3)* %83, align 4, !tbaa !11
  %285 = load float, float addrspace(3)* %84, align 4, !tbaa !11
  %286 = fmul contract float %284, %285
  %287 = sitofp i32 %283 to float
  %288 = fadd contract float %286, %287
  %289 = fptosi float %288 to i32
  %290 = load float, float addrspace(3)* %85, align 8, !tbaa !11
  %291 = load float, float addrspace(3)* %86, align 4, !tbaa !11
  %292 = fmul contract float %290, %291
  %293 = sitofp i32 %289 to float
  %294 = fadd contract float %292, %293
  %295 = fptosi float %294 to i32
  %296 = load float, float addrspace(3)* %87, align 4, !tbaa !11
  %297 = load float, float addrspace(3)* %88, align 4, !tbaa !11
  %298 = fmul contract float %296, %297
  %299 = sitofp i32 %295 to float
  %300 = fadd contract float %298, %299
  %301 = fptosi float %300 to i32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %302 = add nuw nsw i32 %94, 1
  %303 = icmp eq i32 %302, 32
  br i1 %303, label %89, label %93, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
