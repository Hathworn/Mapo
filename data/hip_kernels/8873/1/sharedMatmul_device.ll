; ModuleID = '../data/hip_kernels/8873/1/main.cu'
source_filename = "../data/hip_kernels/8873/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12sharedMatmulPfS_S_iE6A_tile = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ12sharedMatmulPfS_S_iE6B_tile = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12sharedMatmulPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %17, %12
  %20 = shl i32 %18, 5
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %24 = icmp eq i32 %17, 0
  br i1 %24, label %97, label %25

25:                                               ; preds = %4
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = shl i32 %26, 5
  %28 = add i32 %27, %23
  %29 = mul nsw i32 %19, %28
  %30 = add i32 %29, %21
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 %21
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 %23, i32 %21
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 0
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 0, i32 %21
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 1
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 1, i32 %21
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 2
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 2, i32 %21
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 3
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 3, i32 %21
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 4
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 4, i32 %21
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 5
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 5, i32 %21
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 6
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 6, i32 %21
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 7
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 7, i32 %21
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 8
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 8, i32 %21
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 9
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 9, i32 %21
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 10
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 10, i32 %21
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 11
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 11, i32 %21
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 12
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 12, i32 %21
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 13
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 13, i32 %21
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 14
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 14, i32 %21
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 15
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 15, i32 %21
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 16
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 16, i32 %21
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 17
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 17, i32 %21
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 18
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 18, i32 %21
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 19
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 19, i32 %21
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 20
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 20, i32 %21
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 21
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 21, i32 %21
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 22
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 22, i32 %21
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 23
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 23, i32 %21
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 24
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 24, i32 %21
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 25
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 25, i32 %21
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 26
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 26, i32 %21
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 27
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 27, i32 %21
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 28
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 28, i32 %21
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 29
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 29, i32 %21
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 30
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 30, i32 %21
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6A_tile, i32 0, i32 %23, i32 31
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ12sharedMatmulPfS_S_iE6B_tile, i32 0, i32 31, i32 %21
  br label %103

97:                                               ; preds = %103, %4
  %98 = phi i32 [ 0, %4 ], [ %29, %103 ]
  %99 = phi float [ 0.000000e+00, %4 ], [ %244, %103 ]
  %100 = add nsw i32 %98, %22
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  store float %99, float addrspace(1)* %102, align 4, !tbaa !16
  ret void

103:                                              ; preds = %25, %103
  %104 = phi i32 [ 0, %25 ], [ %245, %103 ]
  %105 = phi float [ 0.000000e+00, %25 ], [ %244, %103 ]
  %106 = shl nsw i32 %104, 5
  %107 = add i32 %30, %106
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !14
  store float %110, float addrspace(3)* %31, align 4, !tbaa !16
  %111 = add nuw i32 %106, %23
  %112 = mul i32 %111, %19
  %113 = add i32 %112, %22
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16, !amdgpu.noclobber !14
  store float %116, float addrspace(3)* %32, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = load float, float addrspace(3)* %33, align 16, !tbaa !16
  %118 = load float, float addrspace(3)* %34, align 4, !tbaa !16
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %105, %119
  %121 = load float, float addrspace(3)* %35, align 4, !tbaa !16
  %122 = load float, float addrspace(3)* %36, align 4, !tbaa !16
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %37, align 8, !tbaa !16
  %126 = load float, float addrspace(3)* %38, align 4, !tbaa !16
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %130 = load float, float addrspace(3)* %40, align 4, !tbaa !16
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %41, align 16, !tbaa !16
  %134 = load float, float addrspace(3)* %42, align 4, !tbaa !16
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %43, align 4, !tbaa !16
  %138 = load float, float addrspace(3)* %44, align 4, !tbaa !16
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %45, align 8, !tbaa !16
  %142 = load float, float addrspace(3)* %46, align 4, !tbaa !16
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %47, align 4, !tbaa !16
  %146 = load float, float addrspace(3)* %48, align 4, !tbaa !16
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %49, align 16, !tbaa !16
  %150 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  %153 = load float, float addrspace(3)* %51, align 4, !tbaa !16
  %154 = load float, float addrspace(3)* %52, align 4, !tbaa !16
  %155 = fmul contract float %153, %154
  %156 = fadd contract float %152, %155
  %157 = load float, float addrspace(3)* %53, align 8, !tbaa !16
  %158 = load float, float addrspace(3)* %54, align 4, !tbaa !16
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %156, %159
  %161 = load float, float addrspace(3)* %55, align 4, !tbaa !16
  %162 = load float, float addrspace(3)* %56, align 4, !tbaa !16
  %163 = fmul contract float %161, %162
  %164 = fadd contract float %160, %163
  %165 = load float, float addrspace(3)* %57, align 16, !tbaa !16
  %166 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %167 = fmul contract float %165, %166
  %168 = fadd contract float %164, %167
  %169 = load float, float addrspace(3)* %59, align 4, !tbaa !16
  %170 = load float, float addrspace(3)* %60, align 4, !tbaa !16
  %171 = fmul contract float %169, %170
  %172 = fadd contract float %168, %171
  %173 = load float, float addrspace(3)* %61, align 8, !tbaa !16
  %174 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %172, %175
  %177 = load float, float addrspace(3)* %63, align 4, !tbaa !16
  %178 = load float, float addrspace(3)* %64, align 4, !tbaa !16
  %179 = fmul contract float %177, %178
  %180 = fadd contract float %176, %179
  %181 = load float, float addrspace(3)* %65, align 16, !tbaa !16
  %182 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %183 = fmul contract float %181, %182
  %184 = fadd contract float %180, %183
  %185 = load float, float addrspace(3)* %67, align 4, !tbaa !16
  %186 = load float, float addrspace(3)* %68, align 4, !tbaa !16
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %184, %187
  %189 = load float, float addrspace(3)* %69, align 8, !tbaa !16
  %190 = load float, float addrspace(3)* %70, align 4, !tbaa !16
  %191 = fmul contract float %189, %190
  %192 = fadd contract float %188, %191
  %193 = load float, float addrspace(3)* %71, align 4, !tbaa !16
  %194 = load float, float addrspace(3)* %72, align 4, !tbaa !16
  %195 = fmul contract float %193, %194
  %196 = fadd contract float %192, %195
  %197 = load float, float addrspace(3)* %73, align 16, !tbaa !16
  %198 = load float, float addrspace(3)* %74, align 4, !tbaa !16
  %199 = fmul contract float %197, %198
  %200 = fadd contract float %196, %199
  %201 = load float, float addrspace(3)* %75, align 4, !tbaa !16
  %202 = load float, float addrspace(3)* %76, align 4, !tbaa !16
  %203 = fmul contract float %201, %202
  %204 = fadd contract float %200, %203
  %205 = load float, float addrspace(3)* %77, align 8, !tbaa !16
  %206 = load float, float addrspace(3)* %78, align 4, !tbaa !16
  %207 = fmul contract float %205, %206
  %208 = fadd contract float %204, %207
  %209 = load float, float addrspace(3)* %79, align 4, !tbaa !16
  %210 = load float, float addrspace(3)* %80, align 4, !tbaa !16
  %211 = fmul contract float %209, %210
  %212 = fadd contract float %208, %211
  %213 = load float, float addrspace(3)* %81, align 16, !tbaa !16
  %214 = load float, float addrspace(3)* %82, align 4, !tbaa !16
  %215 = fmul contract float %213, %214
  %216 = fadd contract float %212, %215
  %217 = load float, float addrspace(3)* %83, align 4, !tbaa !16
  %218 = load float, float addrspace(3)* %84, align 4, !tbaa !16
  %219 = fmul contract float %217, %218
  %220 = fadd contract float %216, %219
  %221 = load float, float addrspace(3)* %85, align 8, !tbaa !16
  %222 = load float, float addrspace(3)* %86, align 4, !tbaa !16
  %223 = fmul contract float %221, %222
  %224 = fadd contract float %220, %223
  %225 = load float, float addrspace(3)* %87, align 4, !tbaa !16
  %226 = load float, float addrspace(3)* %88, align 4, !tbaa !16
  %227 = fmul contract float %225, %226
  %228 = fadd contract float %224, %227
  %229 = load float, float addrspace(3)* %89, align 16, !tbaa !16
  %230 = load float, float addrspace(3)* %90, align 4, !tbaa !16
  %231 = fmul contract float %229, %230
  %232 = fadd contract float %228, %231
  %233 = load float, float addrspace(3)* %91, align 4, !tbaa !16
  %234 = load float, float addrspace(3)* %92, align 4, !tbaa !16
  %235 = fmul contract float %233, %234
  %236 = fadd contract float %232, %235
  %237 = load float, float addrspace(3)* %93, align 8, !tbaa !16
  %238 = load float, float addrspace(3)* %94, align 4, !tbaa !16
  %239 = fmul contract float %237, %238
  %240 = fadd contract float %236, %239
  %241 = load float, float addrspace(3)* %95, align 4, !tbaa !16
  %242 = load float, float addrspace(3)* %96, align 4, !tbaa !16
  %243 = fmul contract float %241, %242
  %244 = fadd contract float %240, %243
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %245 = add nuw nsw i32 %104, 1
  %246 = icmp eq i32 %245, %17
  br i1 %246, label %97, label %103, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
