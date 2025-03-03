; ModuleID = '../data/hip_kernels/13529/6/main.cu'
source_filename = "../data/hip_kernels/13529/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15matrixMultiply3PfS_iE2As = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15matrixMultiply3PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = shl i32 %4, 5
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 5
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %2, 0
  br i1 %12, label %13, label %82

13:                                               ; preds = %3
  %14 = add nuw nsw i32 %2, 31
  %15 = lshr i32 %14, 5
  %16 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 %10
  %17 = icmp slt i32 %11, %2
  %18 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 0
  %19 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 0, i32 %10
  %20 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 1
  %21 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 1, i32 %10
  %22 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 2
  %23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 2, i32 %10
  %24 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 3
  %25 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 3, i32 %10
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 4
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 4, i32 %10
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 5
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 5, i32 %10
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 6
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 6, i32 %10
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 7
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 7, i32 %10
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 8
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 8, i32 %10
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 9
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 9, i32 %10
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 10
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 10, i32 %10
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 11
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 11, i32 %10
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 12
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 12, i32 %10
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 13
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 13, i32 %10
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 14
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 14, i32 %10
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 15
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 15, i32 %10
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 16
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 16, i32 %10
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 17
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 17, i32 %10
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 18
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 18, i32 %10
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 19
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 19, i32 %10
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 20
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 20, i32 %10
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 21
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 21, i32 %10
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 22
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 22, i32 %10
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 23
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 23, i32 %10
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 24
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 24, i32 %10
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 25
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 25, i32 %10
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 26
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 26, i32 %10
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 27
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 27, i32 %10
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 28
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 28, i32 %10
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 29
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 29, i32 %10
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 30
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 30, i32 %10
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 %6, i32 31
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ15matrixMultiply3PfS_iE2As, i32 0, i32 31, i32 %10
  br label %87

82:                                               ; preds = %100, %3
  %83 = phi float [ 0.000000e+00, %3 ], [ %229, %100 ]
  %84 = icmp slt i32 %7, %2
  %85 = icmp slt i32 %11, %2
  %86 = select i1 %84, i1 %85, i1 false
  br i1 %86, label %232, label %250

87:                                               ; preds = %13, %100
  %88 = phi i32 [ 0, %13 ], [ %230, %100 ]
  %89 = phi float [ 0.000000e+00, %13 ], [ %229, %100 ]
  %90 = shl nsw i32 %88, 5
  %91 = add nuw i32 %90, %6
  %92 = icmp ult i32 %91, %2
  %93 = select i1 %92, i1 %17, i1 false
  br i1 %93, label %94, label %100

94:                                               ; preds = %87
  %95 = mul i32 %91, %2
  %96 = add i32 %95, %11
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %100

100:                                              ; preds = %87, %94
  %101 = phi float [ %99, %94 ], [ 0.000000e+00, %87 ]
  store float %101, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = load float, float addrspace(3)* %18, align 16, !tbaa !5
  %103 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %89, %104
  %106 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %22, align 8, !tbaa !5
  %111 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %115 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %26, align 16, !tbaa !5
  %119 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %123 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %30, align 8, !tbaa !5
  %127 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %34, align 16, !tbaa !5
  %135 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %139 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %38, align 8, !tbaa !5
  %143 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %147 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %42, align 16, !tbaa !5
  %151 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %155 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %46, align 8, !tbaa !5
  %159 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  %162 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %163 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %164 = fmul contract float %162, %163
  %165 = fadd contract float %161, %164
  %166 = load float, float addrspace(3)* %50, align 16, !tbaa !5
  %167 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %168 = fmul contract float %166, %167
  %169 = fadd contract float %165, %168
  %170 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %171 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %172 = fmul contract float %170, %171
  %173 = fadd contract float %169, %172
  %174 = load float, float addrspace(3)* %54, align 8, !tbaa !5
  %175 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %176 = fmul contract float %174, %175
  %177 = fadd contract float %173, %176
  %178 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %179 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %180 = fmul contract float %178, %179
  %181 = fadd contract float %177, %180
  %182 = load float, float addrspace(3)* %58, align 16, !tbaa !5
  %183 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %181, %184
  %186 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %187 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %188 = fmul contract float %186, %187
  %189 = fadd contract float %185, %188
  %190 = load float, float addrspace(3)* %62, align 8, !tbaa !5
  %191 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %192 = fmul contract float %190, %191
  %193 = fadd contract float %189, %192
  %194 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %195 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %193, %196
  %198 = load float, float addrspace(3)* %66, align 16, !tbaa !5
  %199 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %200 = fmul contract float %198, %199
  %201 = fadd contract float %197, %200
  %202 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %203 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %204 = fmul contract float %202, %203
  %205 = fadd contract float %201, %204
  %206 = load float, float addrspace(3)* %70, align 8, !tbaa !5
  %207 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %205, %208
  %210 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %211 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %212 = fmul contract float %210, %211
  %213 = fadd contract float %209, %212
  %214 = load float, float addrspace(3)* %74, align 16, !tbaa !5
  %215 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %216 = fmul contract float %214, %215
  %217 = fadd contract float %213, %216
  %218 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %219 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %220 = fmul contract float %218, %219
  %221 = fadd contract float %217, %220
  %222 = load float, float addrspace(3)* %78, align 8, !tbaa !5
  %223 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %224 = fmul contract float %222, %223
  %225 = fadd contract float %221, %224
  %226 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %227 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %228 = fmul contract float %226, %227
  %229 = fadd contract float %225, %228
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %230 = add nuw nsw i32 %88, 1
  %231 = icmp eq i32 %230, %15
  br i1 %231, label %82, label %87, !llvm.loop !10

232:                                              ; preds = %82
  %233 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %234 = getelementptr i8, i8 addrspace(4)* %233, i64 6
  %235 = bitcast i8 addrspace(4)* %234 to i16 addrspace(4)*
  %236 = load i16, i16 addrspace(4)* %235, align 2, !range !12, !invariant.load !9
  %237 = zext i16 %236 to i32
  %238 = mul i32 %4, %237
  %239 = add i32 %238, %6
  %240 = mul i32 %239, %2
  %241 = getelementptr i8, i8 addrspace(4)* %233, i64 4
  %242 = bitcast i8 addrspace(4)* %241 to i16 addrspace(4)*
  %243 = load i16, i16 addrspace(4)* %242, align 4, !range !12, !invariant.load !9
  %244 = zext i16 %243 to i32
  %245 = mul i32 %8, %244
  %246 = add i32 %245, %10
  %247 = add i32 %246, %240
  %248 = zext i32 %247 to i64
  %249 = getelementptr inbounds float, float addrspace(1)* %1, i64 %248
  store float %83, float addrspace(1)* %249, align 4, !tbaa !5
  br label %250

250:                                              ; preds = %232, %82
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{i16 1, i16 1025}
