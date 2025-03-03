; ModuleID = '../data/hip_kernels/14395/42/main.cu'
source_filename = "../data/hip_kernels/14395/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11cu_multiplyPKfS0_Pfiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !7
  %29 = icmp slt i32 %4, -30
  br i1 %29, label %100, label %30

30:                                               ; preds = %9
  %31 = add nsw i32 %4, -1
  %32 = sdiv i32 %31, 32
  %33 = icmp slt i32 %18, %3
  %34 = mul nsw i32 %18, %4
  %35 = icmp slt i32 %26, %6
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 0
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 0, i32 %25
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 1
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 1, i32 %25
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 2
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 2, i32 %25
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 3
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 3, i32 %25
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 4
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 4, i32 %25
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 5
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 5, i32 %25
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 6
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 6, i32 %25
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 7
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 7, i32 %25
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 8
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 8, i32 %25
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 9
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 9, i32 %25
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 10
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 10, i32 %25
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 11
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 11, i32 %25
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 12
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 12, i32 %25
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 13
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 13, i32 %25
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 14
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 14, i32 %25
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 15
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 15, i32 %25
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 16
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 16, i32 %25
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 17
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 17, i32 %25
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 18
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 18, i32 %25
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 19
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 19, i32 %25
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 20
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 20, i32 %25
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 21
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 21, i32 %25
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 22
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 22, i32 %25
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 23
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 23, i32 %25
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 24
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 24, i32 %25
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 25
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 25, i32 %25
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 26
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 26, i32 %25
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 27
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 27, i32 %25
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 28
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 28, i32 %25
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 29
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 29, i32 %25
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 30
  %97 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 30, i32 %25
  %98 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sA, i32 0, i32 %17, i32 31
  %99 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11cu_multiplyPKfS0_PfiiiiiiE2sB, i32 0, i32 31, i32 %25
  br label %105

100:                                              ; preds = %129, %9
  %101 = phi float [ 0.000000e+00, %9 ], [ %258, %129 ]
  %102 = icmp slt i32 %18, %7
  %103 = icmp slt i32 %26, %8
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %261, label %266

105:                                              ; preds = %30, %129
  %106 = phi i32 [ 0, %30 ], [ %259, %129 ]
  %107 = phi float [ 0.000000e+00, %30 ], [ %258, %129 ]
  br i1 %33, label %108, label %117

108:                                              ; preds = %105
  %109 = shl nsw i32 %106, 5
  %110 = add nuw i32 %109, %25
  %111 = icmp ult i32 %110, %4
  br i1 %111, label %112, label %117

112:                                              ; preds = %108
  %113 = add i32 %110, %34
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  br label %117

117:                                              ; preds = %105, %108, %112
  %118 = phi float [ %116, %112 ], [ 0.000000e+00, %108 ], [ 0.000000e+00, %105 ]
  store float %118, float addrspace(3)* %27, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %35, label %119, label %129

119:                                              ; preds = %117
  %120 = shl nsw i32 %106, 5
  %121 = add nuw i32 %120, %17
  %122 = icmp ult i32 %121, %5
  br i1 %122, label %123, label %129

123:                                              ; preds = %119
  %124 = mul i32 %121, %6
  %125 = add i32 %124, %26
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %117, %119, %123
  %130 = phi float [ %128, %123 ], [ 0.000000e+00, %119 ], [ 0.000000e+00, %117 ]
  store float %130, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %131 = load float, float addrspace(3)* %36, align 16, !tbaa !7
  %132 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %107, %133
  %135 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %136 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %40, align 8, !tbaa !7
  %140 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %144 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %44, align 16, !tbaa !7
  %148 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %152 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  %155 = load float, float addrspace(3)* %48, align 8, !tbaa !7
  %156 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %154, %157
  %159 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %160 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %161 = fmul contract float %159, %160
  %162 = fadd contract float %158, %161
  %163 = load float, float addrspace(3)* %52, align 16, !tbaa !7
  %164 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %165 = fmul contract float %163, %164
  %166 = fadd contract float %162, %165
  %167 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %168 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %169 = fmul contract float %167, %168
  %170 = fadd contract float %166, %169
  %171 = load float, float addrspace(3)* %56, align 8, !tbaa !7
  %172 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %173 = fmul contract float %171, %172
  %174 = fadd contract float %170, %173
  %175 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %176 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %177 = fmul contract float %175, %176
  %178 = fadd contract float %174, %177
  %179 = load float, float addrspace(3)* %60, align 16, !tbaa !7
  %180 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %181 = fmul contract float %179, %180
  %182 = fadd contract float %178, %181
  %183 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %184 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %185 = fmul contract float %183, %184
  %186 = fadd contract float %182, %185
  %187 = load float, float addrspace(3)* %64, align 8, !tbaa !7
  %188 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %186, %189
  %191 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %192 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %193 = fmul contract float %191, %192
  %194 = fadd contract float %190, %193
  %195 = load float, float addrspace(3)* %68, align 16, !tbaa !7
  %196 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %197 = fmul contract float %195, %196
  %198 = fadd contract float %194, %197
  %199 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %200 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %198, %201
  %203 = load float, float addrspace(3)* %72, align 8, !tbaa !7
  %204 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %205 = fmul contract float %203, %204
  %206 = fadd contract float %202, %205
  %207 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %208 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %209 = fmul contract float %207, %208
  %210 = fadd contract float %206, %209
  %211 = load float, float addrspace(3)* %76, align 16, !tbaa !7
  %212 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %210, %213
  %215 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %216 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %217 = fmul contract float %215, %216
  %218 = fadd contract float %214, %217
  %219 = load float, float addrspace(3)* %80, align 8, !tbaa !7
  %220 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %221 = fmul contract float %219, %220
  %222 = fadd contract float %218, %221
  %223 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %224 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %225 = fmul contract float %223, %224
  %226 = fadd contract float %222, %225
  %227 = load float, float addrspace(3)* %84, align 16, !tbaa !7
  %228 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %229 = fmul contract float %227, %228
  %230 = fadd contract float %226, %229
  %231 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %232 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %233 = fmul contract float %231, %232
  %234 = fadd contract float %230, %233
  %235 = load float, float addrspace(3)* %88, align 8, !tbaa !7
  %236 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %237 = fmul contract float %235, %236
  %238 = fadd contract float %234, %237
  %239 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %240 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %241 = fmul contract float %239, %240
  %242 = fadd contract float %238, %241
  %243 = load float, float addrspace(3)* %92, align 16, !tbaa !7
  %244 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %245 = fmul contract float %243, %244
  %246 = fadd contract float %242, %245
  %247 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %248 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %249 = fmul contract float %247, %248
  %250 = fadd contract float %246, %249
  %251 = load float, float addrspace(3)* %96, align 8, !tbaa !7
  %252 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %253 = fmul contract float %251, %252
  %254 = fadd contract float %250, %253
  %255 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %256 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %257 = fmul contract float %255, %256
  %258 = fadd contract float %254, %257
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %259 = add nuw nsw i32 %106, 1
  %260 = icmp eq i32 %106, %32
  br i1 %260, label %100, label %105, !llvm.loop !11

261:                                              ; preds = %100
  %262 = mul nsw i32 %18, %8
  %263 = add nsw i32 %262, %26
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %2, i64 %264
  store float %101, float addrspace(1)* %265, align 4, !tbaa !7
  br label %266

266:                                              ; preds = %261, %100
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
