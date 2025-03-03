; ModuleID = '../data/hip_kernels/1169/25/main.cu'
source_filename = "../data/hip_kernels/1169/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data = internal unnamed_addr addrspace(3) global [6 x [6 x [192 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29HessianPositiveDefiniteKernelPcPfiii(i8 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add nsw i32 %8, -32
  %10 = add i32 %9, %7
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 2
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add nsw i32 %13, -1
  %15 = add i32 %14, %12
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %17 = shl i32 %16, 2
  %18 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %19 = add nsw i32 %18, -1
  %20 = add i32 %19, %17
  %21 = mul nsw i32 %20, %3
  %22 = add nsw i32 %21, %15
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %23, %10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %25
  %28 = icmp slt i32 %20, 0
  br i1 %28, label %69, label %29

29:                                               ; preds = %5
  %30 = icmp slt i32 %20, %4
  %31 = icmp sgt i32 %15, -1
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %15, %3
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %69

35:                                               ; preds = %29
  %36 = getelementptr inbounds float, float addrspace(1)* %26, i64 32
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = add nuw nsw i32 %8, 32
  %39 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %38
  store float %37, float addrspace(3)* %39, align 4, !tbaa !5
  %40 = getelementptr inbounds float, float addrspace(1)* %26, i64 48
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = add nuw nsw i32 %8, 48
  %43 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %42
  store float %41, float addrspace(3)* %43, align 4, !tbaa !5
  %44 = getelementptr inbounds float, float addrspace(1)* %26, i64 64
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = add nuw nsw i32 %8, 64
  %47 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %46
  store float %45, float addrspace(3)* %47, align 4, !tbaa !5
  %48 = getelementptr inbounds float, float addrspace(1)* %26, i64 80
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = add nuw nsw i32 %8, 80
  %51 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %50
  store float %49, float addrspace(3)* %51, align 4, !tbaa !5
  %52 = getelementptr inbounds float, float addrspace(1)* %26, i64 96
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = add nuw nsw i32 %8, 96
  %55 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %54
  store float %53, float addrspace(3)* %55, align 4, !tbaa !5
  %56 = getelementptr inbounds float, float addrspace(1)* %26, i64 112
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = add nuw nsw i32 %8, 112
  %59 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %58
  store float %57, float addrspace(3)* %59, align 4, !tbaa !5
  %60 = getelementptr inbounds float, float addrspace(1)* %26, i64 128
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = add nuw nsw i32 %8, 128
  %63 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %62
  store float %61, float addrspace(3)* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds float, float addrspace(1)* %26, i64 144
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = add nuw nsw i32 %8, 144
  %67 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %66
  store float %65, float addrspace(3)* %67, align 4, !tbaa !5
  %68 = icmp sgt i32 %10, -1
  br i1 %68, label %93, label %95

69:                                               ; preds = %29, %5
  %70 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %8
  store float 0.000000e+00, float addrspace(3)* %70, align 4, !tbaa !5
  %71 = add nuw nsw i32 %8, 16
  %72 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %71
  store float 0.000000e+00, float addrspace(3)* %72, align 4, !tbaa !5
  %73 = add nuw nsw i32 %8, 32
  %74 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %73
  store float 0.000000e+00, float addrspace(3)* %74, align 4, !tbaa !5
  %75 = add nuw nsw i32 %8, 48
  %76 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %75
  store float 0.000000e+00, float addrspace(3)* %76, align 4, !tbaa !5
  %77 = add nuw nsw i32 %8, 64
  %78 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %77
  store float 0.000000e+00, float addrspace(3)* %78, align 4, !tbaa !5
  %79 = add nuw nsw i32 %8, 80
  %80 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %79
  store float 0.000000e+00, float addrspace(3)* %80, align 4, !tbaa !5
  %81 = add nuw nsw i32 %8, 96
  %82 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %81
  store float 0.000000e+00, float addrspace(3)* %82, align 4, !tbaa !5
  %83 = add nuw nsw i32 %8, 112
  %84 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %83
  store float 0.000000e+00, float addrspace(3)* %84, align 4, !tbaa !5
  %85 = add nuw nsw i32 %8, 128
  %86 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %85
  store float 0.000000e+00, float addrspace(3)* %86, align 4, !tbaa !5
  %87 = add nuw nsw i32 %8, 144
  %88 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %87
  store float 0.000000e+00, float addrspace(3)* %88, align 4, !tbaa !5
  %89 = add nuw nsw i32 %8, 160
  %90 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %89
  store float 0.000000e+00, float addrspace(3)* %90, align 4, !tbaa !5
  %91 = add nuw nsw i32 %8, 176
  %92 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %91
  store float 0.000000e+00, float addrspace(3)* %92, align 4, !tbaa !5
  br label %800

93:                                               ; preds = %35
  %94 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %95

95:                                               ; preds = %35, %93
  %96 = phi contract float [ %94, %93 ], [ 0.000000e+00, %35 ]
  %97 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %8
  store float %96, float addrspace(3)* %97, align 4, !tbaa !5
  %98 = icmp sgt i32 %10, -17
  br i1 %98, label %99, label %102

99:                                               ; preds = %95
  %100 = getelementptr inbounds float, float addrspace(1)* %26, i64 16
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %102

102:                                              ; preds = %99, %95
  %103 = phi contract float [ %101, %99 ], [ 0.000000e+00, %95 ]
  %104 = add nuw nsw i32 %8, 16
  %105 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %104
  store float %103, float addrspace(3)* %105, align 4, !tbaa !5
  %106 = add nsw i32 %10, 160
  %107 = icmp slt i32 %106, %2
  br i1 %107, label %108, label %111

108:                                              ; preds = %102
  %109 = getelementptr inbounds float, float addrspace(1)* %26, i64 160
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %111

111:                                              ; preds = %102, %108
  %112 = phi contract float [ %110, %108 ], [ 0.000000e+00, %102 ]
  %113 = add nuw nsw i32 %8, 160
  %114 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %113
  store float %112, float addrspace(3)* %114, align 4, !tbaa !5
  %115 = add nsw i32 %10, 176
  %116 = icmp slt i32 %115, %2
  br i1 %116, label %117, label %120

117:                                              ; preds = %111
  %118 = getelementptr inbounds float, float addrspace(1)* %26, i64 176
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %120

120:                                              ; preds = %117, %111
  %121 = phi contract float [ %119, %117 ], [ 0.000000e+00, %111 ]
  %122 = add nuw nsw i32 %8, 176
  %123 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %122
  store float %121, float addrspace(3)* %123, align 4, !tbaa !5
  switch i32 %18, label %124 [
    i32 0, label %800
    i32 5, label %800
  ]

124:                                              ; preds = %120
  switch i32 %13, label %125 [
    i32 0, label %800
    i32 5, label %800
  ]

125:                                              ; preds = %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %126 = add nuw nsw i32 %13, 1
  %127 = add nuw nsw i32 %18, 1
  %128 = add nuw nsw i32 %8, 31
  %129 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !5
  %131 = add nuw nsw i32 %8, 33
  %132 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %131
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !5
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %136 = fmul contract float %135, 2.000000e+00
  %137 = fsub contract float %134, %136
  %138 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %131
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %128
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %142 = fadd contract float %139, %141
  %143 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %128
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %145 = fsub contract float %142, %144
  %146 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %131
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %148 = fsub contract float %145, %147
  %149 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %131
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %151 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %128
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %153 = fadd contract float %150, %152
  %154 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %128
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %156 = fsub contract float %153, %155
  %157 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %131
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %159 = fsub contract float %156, %158
  %160 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %38
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %38
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !5
  %164 = fadd contract float %161, %163
  %165 = fsub contract float %164, %136
  %166 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %38
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %168 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %38
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !5
  %170 = fadd contract float %167, %169
  %171 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %38
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !5
  %173 = fsub contract float %170, %172
  %174 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %38
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !5
  %176 = fsub contract float %173, %175
  %177 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %38
  %178 = load float, float addrspace(3)* %177, align 4, !tbaa !5
  %179 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %38
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !5
  %181 = fadd contract float %178, %180
  %182 = fsub contract float %181, %136
  %183 = fmul contract float %148, 2.500000e-01
  %184 = fmul contract float %159, 2.500000e-01
  %185 = fmul contract float %176, 2.500000e-01
  %186 = fcmp contract olt float %137, 0.000000e+00
  br i1 %186, label %187, label %208

187:                                              ; preds = %125
  %188 = fmul contract float %137, %165
  %189 = fmul contract float %183, %183
  %190 = fsub contract float %188, %189
  %191 = fcmp contract olt float %190, 0.000000e+00
  br i1 %191, label %192, label %208

192:                                              ; preds = %187
  %193 = fmul contract float %188, %182
  %194 = fmul contract float %183, 2.000000e+00
  %195 = fmul contract float %194, %185
  %196 = fmul contract float %184, %195
  %197 = fadd contract float %196, %193
  %198 = fmul contract float %137, %185
  %199 = fmul contract float %185, %198
  %200 = fsub contract float %197, %199
  %201 = fmul contract float %184, %165
  %202 = fmul contract float %184, %201
  %203 = fsub contract float %200, %202
  %204 = fmul contract float %183, %182
  %205 = fmul contract float %183, %204
  %206 = fsub contract float %203, %205
  %207 = fcmp contract olt float %206, 0.000000e+00
  br label %208

208:                                              ; preds = %192, %187, %125
  %209 = phi i1 [ false, %187 ], [ false, %125 ], [ %207, %192 ]
  %210 = zext i1 %209 to i8
  %211 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 32
  store i8 %210, i8 addrspace(1)* %211, align 1, !tbaa !10
  %212 = add nuw nsw i32 %8, 47
  %213 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %212
  %214 = load float, float addrspace(3)* %213, align 4, !tbaa !5
  %215 = add nuw nsw i32 %8, 49
  %216 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !5
  %218 = fadd contract float %214, %217
  %219 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %220 = fmul contract float %219, 2.000000e+00
  %221 = fsub contract float %218, %220
  %222 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %215
  %223 = load float, float addrspace(3)* %222, align 4, !tbaa !5
  %224 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %212
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !5
  %226 = fadd contract float %223, %225
  %227 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %212
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = fsub contract float %226, %228
  %230 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %215
  %231 = load float, float addrspace(3)* %230, align 4, !tbaa !5
  %232 = fsub contract float %229, %231
  %233 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %215
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %235 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %212
  %236 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %237 = fadd contract float %234, %236
  %238 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %212
  %239 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %240 = fsub contract float %237, %239
  %241 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %215
  %242 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %243 = fsub contract float %240, %242
  %244 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %42
  %245 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %246 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %42
  %247 = load float, float addrspace(3)* %246, align 4, !tbaa !5
  %248 = fadd contract float %245, %247
  %249 = fsub contract float %248, %220
  %250 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %42
  %251 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %252 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %42
  %253 = load float, float addrspace(3)* %252, align 4, !tbaa !5
  %254 = fadd contract float %251, %253
  %255 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %42
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  %257 = fsub contract float %254, %256
  %258 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %42
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %260 = fsub contract float %257, %259
  %261 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %42
  %262 = load float, float addrspace(3)* %261, align 4, !tbaa !5
  %263 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %42
  %264 = load float, float addrspace(3)* %263, align 4, !tbaa !5
  %265 = fadd contract float %262, %264
  %266 = fsub contract float %265, %220
  %267 = fmul contract float %232, 2.500000e-01
  %268 = fmul contract float %243, 2.500000e-01
  %269 = fmul contract float %260, 2.500000e-01
  %270 = fcmp contract olt float %221, 0.000000e+00
  br i1 %270, label %271, label %292

271:                                              ; preds = %208
  %272 = fmul contract float %221, %249
  %273 = fmul contract float %267, %267
  %274 = fsub contract float %272, %273
  %275 = fcmp contract olt float %274, 0.000000e+00
  br i1 %275, label %276, label %292

276:                                              ; preds = %271
  %277 = fmul contract float %272, %266
  %278 = fmul contract float %267, 2.000000e+00
  %279 = fmul contract float %278, %269
  %280 = fmul contract float %268, %279
  %281 = fadd contract float %280, %277
  %282 = fmul contract float %221, %269
  %283 = fmul contract float %269, %282
  %284 = fsub contract float %281, %283
  %285 = fmul contract float %268, %249
  %286 = fmul contract float %268, %285
  %287 = fsub contract float %284, %286
  %288 = fmul contract float %267, %266
  %289 = fmul contract float %267, %288
  %290 = fsub contract float %287, %289
  %291 = fcmp contract olt float %290, 0.000000e+00
  br label %292

292:                                              ; preds = %276, %271, %208
  %293 = phi i1 [ false, %271 ], [ false, %208 ], [ %291, %276 ]
  %294 = zext i1 %293 to i8
  %295 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 48
  store i8 %294, i8 addrspace(1)* %295, align 1, !tbaa !10
  %296 = add nuw nsw i32 %8, 63
  %297 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %296
  %298 = load float, float addrspace(3)* %297, align 4, !tbaa !5
  %299 = add nuw nsw i32 %8, 65
  %300 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %299
  %301 = load float, float addrspace(3)* %300, align 4, !tbaa !5
  %302 = fadd contract float %298, %301
  %303 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %304 = fmul contract float %303, 2.000000e+00
  %305 = fsub contract float %302, %304
  %306 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %299
  %307 = load float, float addrspace(3)* %306, align 4, !tbaa !5
  %308 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %296
  %309 = load float, float addrspace(3)* %308, align 4, !tbaa !5
  %310 = fadd contract float %307, %309
  %311 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %296
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !5
  %313 = fsub contract float %310, %312
  %314 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %299
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !5
  %316 = fsub contract float %313, %315
  %317 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %299
  %318 = load float, float addrspace(3)* %317, align 4, !tbaa !5
  %319 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %296
  %320 = load float, float addrspace(3)* %319, align 4, !tbaa !5
  %321 = fadd contract float %318, %320
  %322 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %296
  %323 = load float, float addrspace(3)* %322, align 4, !tbaa !5
  %324 = fsub contract float %321, %323
  %325 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %299
  %326 = load float, float addrspace(3)* %325, align 4, !tbaa !5
  %327 = fsub contract float %324, %326
  %328 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %46
  %329 = load float, float addrspace(3)* %328, align 4, !tbaa !5
  %330 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %46
  %331 = load float, float addrspace(3)* %330, align 4, !tbaa !5
  %332 = fadd contract float %329, %331
  %333 = fsub contract float %332, %304
  %334 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %46
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !5
  %336 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %46
  %337 = load float, float addrspace(3)* %336, align 4, !tbaa !5
  %338 = fadd contract float %335, %337
  %339 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %46
  %340 = load float, float addrspace(3)* %339, align 4, !tbaa !5
  %341 = fsub contract float %338, %340
  %342 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %46
  %343 = load float, float addrspace(3)* %342, align 4, !tbaa !5
  %344 = fsub contract float %341, %343
  %345 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %46
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !5
  %347 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %46
  %348 = load float, float addrspace(3)* %347, align 4, !tbaa !5
  %349 = fadd contract float %346, %348
  %350 = fsub contract float %349, %304
  %351 = fmul contract float %316, 2.500000e-01
  %352 = fmul contract float %327, 2.500000e-01
  %353 = fmul contract float %344, 2.500000e-01
  %354 = fcmp contract olt float %305, 0.000000e+00
  br i1 %354, label %355, label %376

355:                                              ; preds = %292
  %356 = fmul contract float %305, %333
  %357 = fmul contract float %351, %351
  %358 = fsub contract float %356, %357
  %359 = fcmp contract olt float %358, 0.000000e+00
  br i1 %359, label %360, label %376

360:                                              ; preds = %355
  %361 = fmul contract float %356, %350
  %362 = fmul contract float %351, 2.000000e+00
  %363 = fmul contract float %362, %353
  %364 = fmul contract float %352, %363
  %365 = fadd contract float %364, %361
  %366 = fmul contract float %305, %353
  %367 = fmul contract float %353, %366
  %368 = fsub contract float %365, %367
  %369 = fmul contract float %352, %333
  %370 = fmul contract float %352, %369
  %371 = fsub contract float %368, %370
  %372 = fmul contract float %351, %350
  %373 = fmul contract float %351, %372
  %374 = fsub contract float %371, %373
  %375 = fcmp contract olt float %374, 0.000000e+00
  br label %376

376:                                              ; preds = %360, %355, %292
  %377 = phi i1 [ false, %355 ], [ false, %292 ], [ %375, %360 ]
  %378 = zext i1 %377 to i8
  %379 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 64
  store i8 %378, i8 addrspace(1)* %379, align 1, !tbaa !10
  %380 = add nuw nsw i32 %8, 79
  %381 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %380
  %382 = load float, float addrspace(3)* %381, align 4, !tbaa !5
  %383 = add nuw nsw i32 %8, 81
  %384 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %383
  %385 = load float, float addrspace(3)* %384, align 4, !tbaa !5
  %386 = fadd contract float %382, %385
  %387 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %388 = fmul contract float %387, 2.000000e+00
  %389 = fsub contract float %386, %388
  %390 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %383
  %391 = load float, float addrspace(3)* %390, align 4, !tbaa !5
  %392 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %380
  %393 = load float, float addrspace(3)* %392, align 4, !tbaa !5
  %394 = fadd contract float %391, %393
  %395 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %380
  %396 = load float, float addrspace(3)* %395, align 4, !tbaa !5
  %397 = fsub contract float %394, %396
  %398 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %383
  %399 = load float, float addrspace(3)* %398, align 4, !tbaa !5
  %400 = fsub contract float %397, %399
  %401 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %383
  %402 = load float, float addrspace(3)* %401, align 4, !tbaa !5
  %403 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %380
  %404 = load float, float addrspace(3)* %403, align 4, !tbaa !5
  %405 = fadd contract float %402, %404
  %406 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %380
  %407 = load float, float addrspace(3)* %406, align 4, !tbaa !5
  %408 = fsub contract float %405, %407
  %409 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %383
  %410 = load float, float addrspace(3)* %409, align 4, !tbaa !5
  %411 = fsub contract float %408, %410
  %412 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %50
  %413 = load float, float addrspace(3)* %412, align 4, !tbaa !5
  %414 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %50
  %415 = load float, float addrspace(3)* %414, align 4, !tbaa !5
  %416 = fadd contract float %413, %415
  %417 = fsub contract float %416, %388
  %418 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %50
  %419 = load float, float addrspace(3)* %418, align 4, !tbaa !5
  %420 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %50
  %421 = load float, float addrspace(3)* %420, align 4, !tbaa !5
  %422 = fadd contract float %419, %421
  %423 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %50
  %424 = load float, float addrspace(3)* %423, align 4, !tbaa !5
  %425 = fsub contract float %422, %424
  %426 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %50
  %427 = load float, float addrspace(3)* %426, align 4, !tbaa !5
  %428 = fsub contract float %425, %427
  %429 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %50
  %430 = load float, float addrspace(3)* %429, align 4, !tbaa !5
  %431 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %50
  %432 = load float, float addrspace(3)* %431, align 4, !tbaa !5
  %433 = fadd contract float %430, %432
  %434 = fsub contract float %433, %388
  %435 = fmul contract float %400, 2.500000e-01
  %436 = fmul contract float %411, 2.500000e-01
  %437 = fmul contract float %428, 2.500000e-01
  %438 = fcmp contract olt float %389, 0.000000e+00
  br i1 %438, label %439, label %460

439:                                              ; preds = %376
  %440 = fmul contract float %389, %417
  %441 = fmul contract float %435, %435
  %442 = fsub contract float %440, %441
  %443 = fcmp contract olt float %442, 0.000000e+00
  br i1 %443, label %444, label %460

444:                                              ; preds = %439
  %445 = fmul contract float %440, %434
  %446 = fmul contract float %435, 2.000000e+00
  %447 = fmul contract float %446, %437
  %448 = fmul contract float %436, %447
  %449 = fadd contract float %448, %445
  %450 = fmul contract float %389, %437
  %451 = fmul contract float %437, %450
  %452 = fsub contract float %449, %451
  %453 = fmul contract float %436, %417
  %454 = fmul contract float %436, %453
  %455 = fsub contract float %452, %454
  %456 = fmul contract float %435, %434
  %457 = fmul contract float %435, %456
  %458 = fsub contract float %455, %457
  %459 = fcmp contract olt float %458, 0.000000e+00
  br label %460

460:                                              ; preds = %444, %439, %376
  %461 = phi i1 [ false, %439 ], [ false, %376 ], [ %459, %444 ]
  %462 = zext i1 %461 to i8
  %463 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 80
  store i8 %462, i8 addrspace(1)* %463, align 1, !tbaa !10
  %464 = add nuw nsw i32 %8, 95
  %465 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %464
  %466 = load float, float addrspace(3)* %465, align 4, !tbaa !5
  %467 = add nuw nsw i32 %8, 97
  %468 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %467
  %469 = load float, float addrspace(3)* %468, align 4, !tbaa !5
  %470 = fadd contract float %466, %469
  %471 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %472 = fmul contract float %471, 2.000000e+00
  %473 = fsub contract float %470, %472
  %474 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %467
  %475 = load float, float addrspace(3)* %474, align 4, !tbaa !5
  %476 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %464
  %477 = load float, float addrspace(3)* %476, align 4, !tbaa !5
  %478 = fadd contract float %475, %477
  %479 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %464
  %480 = load float, float addrspace(3)* %479, align 4, !tbaa !5
  %481 = fsub contract float %478, %480
  %482 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %467
  %483 = load float, float addrspace(3)* %482, align 4, !tbaa !5
  %484 = fsub contract float %481, %483
  %485 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %467
  %486 = load float, float addrspace(3)* %485, align 4, !tbaa !5
  %487 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %464
  %488 = load float, float addrspace(3)* %487, align 4, !tbaa !5
  %489 = fadd contract float %486, %488
  %490 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %464
  %491 = load float, float addrspace(3)* %490, align 4, !tbaa !5
  %492 = fsub contract float %489, %491
  %493 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %467
  %494 = load float, float addrspace(3)* %493, align 4, !tbaa !5
  %495 = fsub contract float %492, %494
  %496 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %54
  %497 = load float, float addrspace(3)* %496, align 4, !tbaa !5
  %498 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %54
  %499 = load float, float addrspace(3)* %498, align 4, !tbaa !5
  %500 = fadd contract float %497, %499
  %501 = fsub contract float %500, %472
  %502 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %54
  %503 = load float, float addrspace(3)* %502, align 4, !tbaa !5
  %504 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %54
  %505 = load float, float addrspace(3)* %504, align 4, !tbaa !5
  %506 = fadd contract float %503, %505
  %507 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %54
  %508 = load float, float addrspace(3)* %507, align 4, !tbaa !5
  %509 = fsub contract float %506, %508
  %510 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %54
  %511 = load float, float addrspace(3)* %510, align 4, !tbaa !5
  %512 = fsub contract float %509, %511
  %513 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %54
  %514 = load float, float addrspace(3)* %513, align 4, !tbaa !5
  %515 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %54
  %516 = load float, float addrspace(3)* %515, align 4, !tbaa !5
  %517 = fadd contract float %514, %516
  %518 = fsub contract float %517, %472
  %519 = fmul contract float %484, 2.500000e-01
  %520 = fmul contract float %495, 2.500000e-01
  %521 = fmul contract float %512, 2.500000e-01
  %522 = fcmp contract olt float %473, 0.000000e+00
  br i1 %522, label %523, label %544

523:                                              ; preds = %460
  %524 = fmul contract float %473, %501
  %525 = fmul contract float %519, %519
  %526 = fsub contract float %524, %525
  %527 = fcmp contract olt float %526, 0.000000e+00
  br i1 %527, label %528, label %544

528:                                              ; preds = %523
  %529 = fmul contract float %524, %518
  %530 = fmul contract float %519, 2.000000e+00
  %531 = fmul contract float %530, %521
  %532 = fmul contract float %520, %531
  %533 = fadd contract float %532, %529
  %534 = fmul contract float %473, %521
  %535 = fmul contract float %521, %534
  %536 = fsub contract float %533, %535
  %537 = fmul contract float %520, %501
  %538 = fmul contract float %520, %537
  %539 = fsub contract float %536, %538
  %540 = fmul contract float %519, %518
  %541 = fmul contract float %519, %540
  %542 = fsub contract float %539, %541
  %543 = fcmp contract olt float %542, 0.000000e+00
  br label %544

544:                                              ; preds = %528, %523, %460
  %545 = phi i1 [ false, %523 ], [ false, %460 ], [ %543, %528 ]
  %546 = zext i1 %545 to i8
  %547 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 96
  store i8 %546, i8 addrspace(1)* %547, align 1, !tbaa !10
  %548 = add nuw nsw i32 %8, 111
  %549 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %548
  %550 = load float, float addrspace(3)* %549, align 4, !tbaa !5
  %551 = add nuw nsw i32 %8, 113
  %552 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %551
  %553 = load float, float addrspace(3)* %552, align 4, !tbaa !5
  %554 = fadd contract float %550, %553
  %555 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %556 = fmul contract float %555, 2.000000e+00
  %557 = fsub contract float %554, %556
  %558 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %551
  %559 = load float, float addrspace(3)* %558, align 4, !tbaa !5
  %560 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %548
  %561 = load float, float addrspace(3)* %560, align 4, !tbaa !5
  %562 = fadd contract float %559, %561
  %563 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %548
  %564 = load float, float addrspace(3)* %563, align 4, !tbaa !5
  %565 = fsub contract float %562, %564
  %566 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %551
  %567 = load float, float addrspace(3)* %566, align 4, !tbaa !5
  %568 = fsub contract float %565, %567
  %569 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %551
  %570 = load float, float addrspace(3)* %569, align 4, !tbaa !5
  %571 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %548
  %572 = load float, float addrspace(3)* %571, align 4, !tbaa !5
  %573 = fadd contract float %570, %572
  %574 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %548
  %575 = load float, float addrspace(3)* %574, align 4, !tbaa !5
  %576 = fsub contract float %573, %575
  %577 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %551
  %578 = load float, float addrspace(3)* %577, align 4, !tbaa !5
  %579 = fsub contract float %576, %578
  %580 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %58
  %581 = load float, float addrspace(3)* %580, align 4, !tbaa !5
  %582 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %58
  %583 = load float, float addrspace(3)* %582, align 4, !tbaa !5
  %584 = fadd contract float %581, %583
  %585 = fsub contract float %584, %556
  %586 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %58
  %587 = load float, float addrspace(3)* %586, align 4, !tbaa !5
  %588 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %58
  %589 = load float, float addrspace(3)* %588, align 4, !tbaa !5
  %590 = fadd contract float %587, %589
  %591 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %58
  %592 = load float, float addrspace(3)* %591, align 4, !tbaa !5
  %593 = fsub contract float %590, %592
  %594 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %58
  %595 = load float, float addrspace(3)* %594, align 4, !tbaa !5
  %596 = fsub contract float %593, %595
  %597 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %58
  %598 = load float, float addrspace(3)* %597, align 4, !tbaa !5
  %599 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %58
  %600 = load float, float addrspace(3)* %599, align 4, !tbaa !5
  %601 = fadd contract float %598, %600
  %602 = fsub contract float %601, %556
  %603 = fmul contract float %568, 2.500000e-01
  %604 = fmul contract float %579, 2.500000e-01
  %605 = fmul contract float %596, 2.500000e-01
  %606 = fcmp contract olt float %557, 0.000000e+00
  br i1 %606, label %607, label %628

607:                                              ; preds = %544
  %608 = fmul contract float %557, %585
  %609 = fmul contract float %603, %603
  %610 = fsub contract float %608, %609
  %611 = fcmp contract olt float %610, 0.000000e+00
  br i1 %611, label %612, label %628

612:                                              ; preds = %607
  %613 = fmul contract float %608, %602
  %614 = fmul contract float %603, 2.000000e+00
  %615 = fmul contract float %614, %605
  %616 = fmul contract float %604, %615
  %617 = fadd contract float %616, %613
  %618 = fmul contract float %557, %605
  %619 = fmul contract float %605, %618
  %620 = fsub contract float %617, %619
  %621 = fmul contract float %604, %585
  %622 = fmul contract float %604, %621
  %623 = fsub contract float %620, %622
  %624 = fmul contract float %603, %602
  %625 = fmul contract float %603, %624
  %626 = fsub contract float %623, %625
  %627 = fcmp contract olt float %626, 0.000000e+00
  br label %628

628:                                              ; preds = %612, %607, %544
  %629 = phi i1 [ false, %607 ], [ false, %544 ], [ %627, %612 ]
  %630 = zext i1 %629 to i8
  %631 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 112
  store i8 %630, i8 addrspace(1)* %631, align 1, !tbaa !10
  %632 = add nuw nsw i32 %8, 127
  %633 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %632
  %634 = load float, float addrspace(3)* %633, align 4, !tbaa !5
  %635 = add nuw nsw i32 %8, 129
  %636 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %635
  %637 = load float, float addrspace(3)* %636, align 4, !tbaa !5
  %638 = fadd contract float %634, %637
  %639 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %640 = fmul contract float %639, 2.000000e+00
  %641 = fsub contract float %638, %640
  %642 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %635
  %643 = load float, float addrspace(3)* %642, align 4, !tbaa !5
  %644 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %632
  %645 = load float, float addrspace(3)* %644, align 4, !tbaa !5
  %646 = fadd contract float %643, %645
  %647 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %632
  %648 = load float, float addrspace(3)* %647, align 4, !tbaa !5
  %649 = fsub contract float %646, %648
  %650 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %635
  %651 = load float, float addrspace(3)* %650, align 4, !tbaa !5
  %652 = fsub contract float %649, %651
  %653 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %635
  %654 = load float, float addrspace(3)* %653, align 4, !tbaa !5
  %655 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %632
  %656 = load float, float addrspace(3)* %655, align 4, !tbaa !5
  %657 = fadd contract float %654, %656
  %658 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %632
  %659 = load float, float addrspace(3)* %658, align 4, !tbaa !5
  %660 = fsub contract float %657, %659
  %661 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %635
  %662 = load float, float addrspace(3)* %661, align 4, !tbaa !5
  %663 = fsub contract float %660, %662
  %664 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %62
  %665 = load float, float addrspace(3)* %664, align 4, !tbaa !5
  %666 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %62
  %667 = load float, float addrspace(3)* %666, align 4, !tbaa !5
  %668 = fadd contract float %665, %667
  %669 = fsub contract float %668, %640
  %670 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %62
  %671 = load float, float addrspace(3)* %670, align 4, !tbaa !5
  %672 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %62
  %673 = load float, float addrspace(3)* %672, align 4, !tbaa !5
  %674 = fadd contract float %671, %673
  %675 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %62
  %676 = load float, float addrspace(3)* %675, align 4, !tbaa !5
  %677 = fsub contract float %674, %676
  %678 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %62
  %679 = load float, float addrspace(3)* %678, align 4, !tbaa !5
  %680 = fsub contract float %677, %679
  %681 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %62
  %682 = load float, float addrspace(3)* %681, align 4, !tbaa !5
  %683 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %62
  %684 = load float, float addrspace(3)* %683, align 4, !tbaa !5
  %685 = fadd contract float %682, %684
  %686 = fsub contract float %685, %640
  %687 = fmul contract float %652, 2.500000e-01
  %688 = fmul contract float %663, 2.500000e-01
  %689 = fmul contract float %680, 2.500000e-01
  %690 = fcmp contract olt float %641, 0.000000e+00
  br i1 %690, label %691, label %712

691:                                              ; preds = %628
  %692 = fmul contract float %641, %669
  %693 = fmul contract float %687, %687
  %694 = fsub contract float %692, %693
  %695 = fcmp contract olt float %694, 0.000000e+00
  br i1 %695, label %696, label %712

696:                                              ; preds = %691
  %697 = fmul contract float %692, %686
  %698 = fmul contract float %687, 2.000000e+00
  %699 = fmul contract float %698, %689
  %700 = fmul contract float %688, %699
  %701 = fadd contract float %700, %697
  %702 = fmul contract float %641, %689
  %703 = fmul contract float %689, %702
  %704 = fsub contract float %701, %703
  %705 = fmul contract float %688, %669
  %706 = fmul contract float %688, %705
  %707 = fsub contract float %704, %706
  %708 = fmul contract float %687, %686
  %709 = fmul contract float %687, %708
  %710 = fsub contract float %707, %709
  %711 = fcmp contract olt float %710, 0.000000e+00
  br label %712

712:                                              ; preds = %696, %691, %628
  %713 = phi i1 [ false, %691 ], [ false, %628 ], [ %711, %696 ]
  %714 = zext i1 %713 to i8
  %715 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 128
  store i8 %714, i8 addrspace(1)* %715, align 1, !tbaa !10
  %716 = add nuw nsw i32 %8, 143
  %717 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %716
  %718 = load float, float addrspace(3)* %717, align 4, !tbaa !5
  %719 = add nuw nsw i32 %8, 145
  %720 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %13, i32 %719
  %721 = load float, float addrspace(3)* %720, align 4, !tbaa !5
  %722 = fadd contract float %718, %721
  %723 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %724 = fmul contract float %723, 2.000000e+00
  %725 = fsub contract float %722, %724
  %726 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %719
  %727 = load float, float addrspace(3)* %726, align 4, !tbaa !5
  %728 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %716
  %729 = load float, float addrspace(3)* %728, align 4, !tbaa !5
  %730 = fadd contract float %727, %729
  %731 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %716
  %732 = load float, float addrspace(3)* %731, align 4, !tbaa !5
  %733 = fsub contract float %730, %732
  %734 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %719
  %735 = load float, float addrspace(3)* %734, align 4, !tbaa !5
  %736 = fsub contract float %733, %735
  %737 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %719
  %738 = load float, float addrspace(3)* %737, align 4, !tbaa !5
  %739 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %716
  %740 = load float, float addrspace(3)* %739, align 4, !tbaa !5
  %741 = fadd contract float %738, %740
  %742 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %716
  %743 = load float, float addrspace(3)* %742, align 4, !tbaa !5
  %744 = fsub contract float %741, %743
  %745 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %719
  %746 = load float, float addrspace(3)* %745, align 4, !tbaa !5
  %747 = fsub contract float %744, %746
  %748 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %126, i32 %66
  %749 = load float, float addrspace(3)* %748, align 4, !tbaa !5
  %750 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %18, i32 %14, i32 %66
  %751 = load float, float addrspace(3)* %750, align 4, !tbaa !5
  %752 = fadd contract float %749, %751
  %753 = fsub contract float %752, %724
  %754 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %126, i32 %66
  %755 = load float, float addrspace(3)* %754, align 4, !tbaa !5
  %756 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %14, i32 %66
  %757 = load float, float addrspace(3)* %756, align 4, !tbaa !5
  %758 = fadd contract float %755, %757
  %759 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %14, i32 %66
  %760 = load float, float addrspace(3)* %759, align 4, !tbaa !5
  %761 = fsub contract float %758, %760
  %762 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %126, i32 %66
  %763 = load float, float addrspace(3)* %762, align 4, !tbaa !5
  %764 = fsub contract float %761, %763
  %765 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %127, i32 %13, i32 %66
  %766 = load float, float addrspace(3)* %765, align 4, !tbaa !5
  %767 = getelementptr inbounds [6 x [6 x [192 x float]]], [6 x [6 x [192 x float]]] addrspace(3)* @_ZZ29HessianPositiveDefiniteKernelPcPfiiiE6s_Data, i32 0, i32 %19, i32 %13, i32 %66
  %768 = load float, float addrspace(3)* %767, align 4, !tbaa !5
  %769 = fadd contract float %766, %768
  %770 = fsub contract float %769, %724
  %771 = fmul contract float %736, 2.500000e-01
  %772 = fmul contract float %747, 2.500000e-01
  %773 = fmul contract float %764, 2.500000e-01
  %774 = fcmp contract olt float %725, 0.000000e+00
  br i1 %774, label %775, label %796

775:                                              ; preds = %712
  %776 = fmul contract float %725, %753
  %777 = fmul contract float %771, %771
  %778 = fsub contract float %776, %777
  %779 = fcmp contract olt float %778, 0.000000e+00
  br i1 %779, label %780, label %796

780:                                              ; preds = %775
  %781 = fmul contract float %776, %770
  %782 = fmul contract float %771, 2.000000e+00
  %783 = fmul contract float %782, %773
  %784 = fmul contract float %772, %783
  %785 = fadd contract float %784, %781
  %786 = fmul contract float %725, %773
  %787 = fmul contract float %773, %786
  %788 = fsub contract float %785, %787
  %789 = fmul contract float %772, %753
  %790 = fmul contract float %772, %789
  %791 = fsub contract float %788, %790
  %792 = fmul contract float %771, %770
  %793 = fmul contract float %771, %792
  %794 = fsub contract float %791, %793
  %795 = fcmp contract olt float %794, 0.000000e+00
  br label %796

796:                                              ; preds = %780, %775, %712
  %797 = phi i1 [ false, %775 ], [ false, %712 ], [ %795, %780 ]
  %798 = zext i1 %797 to i8
  %799 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 144
  store i8 %798, i8 addrspace(1)* %799, align 1, !tbaa !10
  br label %800

800:                                              ; preds = %796, %69, %124, %124, %120, %120
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!10 = !{!7, !7, i64 0}
