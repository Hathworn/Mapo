; ModuleID = '../data/hip_kernels/11652/4/main.cu'
source_filename = "../data/hip_kernels/11652/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17MatrixMulKernelV3PfS_S_iE3Mds = internal unnamed_addr addrspace(3) global [64 x [64 x float]] undef, align 16
@_ZZ17MatrixMulKernelV3PfS_S_iE3Nds = internal unnamed_addr addrspace(3) global [64 x [64 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17MatrixMulKernelV3PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %6, 6
  %10 = add nsw i32 %9, %8
  %11 = shl nsw i32 %5, 6
  %12 = add nsw i32 %11, %7
  %13 = sitofp i32 %3 to float
  %14 = fmul contract float %13, 1.562500e-02
  %15 = tail call float @llvm.ceil.f32(float %14)
  %16 = fcmp contract ogt float %15, 0.000000e+00
  br i1 %16, label %17, label %151

17:                                               ; preds = %4
  %18 = icmp slt i32 %10, %3
  %19 = mul nsw i32 %10, %3
  %20 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 %7
  %21 = icmp slt i32 %12, %3
  %22 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 %8, i32 %7
  %23 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 0
  %24 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 0, i32 %7
  %25 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 1
  %26 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 1, i32 %7
  %27 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 2
  %28 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 2, i32 %7
  %29 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 3
  %30 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 3, i32 %7
  %31 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 4
  %32 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 4, i32 %7
  %33 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 5
  %34 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 5, i32 %7
  %35 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 6
  %36 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 6, i32 %7
  %37 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 7
  %38 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 7, i32 %7
  %39 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 8
  %40 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 8, i32 %7
  %41 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 9
  %42 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 9, i32 %7
  %43 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 10
  %44 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 10, i32 %7
  %45 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 11
  %46 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 11, i32 %7
  %47 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 12
  %48 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 12, i32 %7
  %49 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 13
  %50 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 13, i32 %7
  %51 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 14
  %52 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 14, i32 %7
  %53 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 15
  %54 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 15, i32 %7
  %55 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 16
  %56 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 16, i32 %7
  %57 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 17
  %58 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 17, i32 %7
  %59 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 18
  %60 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 18, i32 %7
  %61 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 19
  %62 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 19, i32 %7
  %63 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 20
  %64 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 20, i32 %7
  %65 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 21
  %66 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 21, i32 %7
  %67 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 22
  %68 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 22, i32 %7
  %69 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 23
  %70 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 23, i32 %7
  %71 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 24
  %72 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 24, i32 %7
  %73 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 25
  %74 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 25, i32 %7
  %75 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 26
  %76 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 26, i32 %7
  %77 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 27
  %78 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 27, i32 %7
  %79 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 28
  %80 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 28, i32 %7
  %81 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 29
  %82 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 29, i32 %7
  %83 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 30
  %84 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 30, i32 %7
  %85 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 31
  %86 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 31, i32 %7
  %87 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 32
  %88 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 32, i32 %7
  %89 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 33
  %90 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 33, i32 %7
  %91 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 34
  %92 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 34, i32 %7
  %93 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 35
  %94 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 35, i32 %7
  %95 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 36
  %96 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 36, i32 %7
  %97 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 37
  %98 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 37, i32 %7
  %99 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 38
  %100 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 38, i32 %7
  %101 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 39
  %102 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 39, i32 %7
  %103 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 40
  %104 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 40, i32 %7
  %105 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 41
  %106 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 41, i32 %7
  %107 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 42
  %108 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 42, i32 %7
  %109 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 43
  %110 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 43, i32 %7
  %111 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 44
  %112 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 44, i32 %7
  %113 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 45
  %114 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 45, i32 %7
  %115 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 46
  %116 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 46, i32 %7
  %117 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 47
  %118 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 47, i32 %7
  %119 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 48
  %120 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 48, i32 %7
  %121 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 49
  %122 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 49, i32 %7
  %123 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 50
  %124 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 50, i32 %7
  %125 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 51
  %126 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 51, i32 %7
  %127 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 52
  %128 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 52, i32 %7
  %129 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 53
  %130 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 53, i32 %7
  %131 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 54
  %132 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 54, i32 %7
  %133 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 55
  %134 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 55, i32 %7
  %135 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 56
  %136 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 56, i32 %7
  %137 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 57
  %138 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 57, i32 %7
  %139 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 58
  %140 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 58, i32 %7
  %141 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 59
  %142 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 59, i32 %7
  %143 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 60
  %144 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 60, i32 %7
  %145 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 61
  %146 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 61, i32 %7
  %147 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 62
  %148 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 62, i32 %7
  %149 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Mds, i32 0, i32 %8, i32 63
  %150 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ17MatrixMulKernelV3PfS_S_iE3Nds, i32 0, i32 63, i32 %7
  br label %156

151:                                              ; preds = %178, %4
  %152 = phi float [ 0.000000e+00, %4 ], [ %434, %178 ]
  %153 = icmp slt i32 %10, %3
  %154 = icmp slt i32 %12, %3
  %155 = select i1 %153, i1 %154, i1 false
  br i1 %155, label %438, label %443

156:                                              ; preds = %17, %178
  %157 = phi i32 [ 0, %17 ], [ %435, %178 ]
  %158 = phi float [ 0.000000e+00, %17 ], [ %434, %178 ]
  %159 = shl nsw i32 %157, 6
  br i1 %18, label %160, label %168

160:                                              ; preds = %156
  %161 = add nuw i32 %159, %7
  %162 = icmp slt i32 %161, %3
  br i1 %162, label %163, label %168

163:                                              ; preds = %160
  %164 = add i32 %161, %19
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %167, float addrspace(3)* %20, align 4, !tbaa !5
  br label %168

168:                                              ; preds = %156, %163, %160
  %169 = add nuw nsw i32 %159, %8
  %170 = icmp slt i32 %169, %3
  %171 = select i1 %170, i1 %21, i1 false
  br i1 %171, label %172, label %178

172:                                              ; preds = %168
  %173 = mul nsw i32 %169, %3
  %174 = add nsw i32 %173, %12
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %1, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %177, float addrspace(3)* %22, align 4, !tbaa !5
  br label %178

178:                                              ; preds = %172, %168
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %179 = load float, float addrspace(3)* %23, align 16, !tbaa !5
  %180 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %181 = fmul contract float %179, %180
  %182 = fadd contract float %158, %181
  %183 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %184 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %185 = fmul contract float %183, %184
  %186 = fadd contract float %182, %185
  %187 = load float, float addrspace(3)* %27, align 8, !tbaa !5
  %188 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %186, %189
  %191 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %192 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %193 = fmul contract float %191, %192
  %194 = fadd contract float %190, %193
  %195 = load float, float addrspace(3)* %31, align 16, !tbaa !5
  %196 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %197 = fmul contract float %195, %196
  %198 = fadd contract float %194, %197
  %199 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %200 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %198, %201
  %203 = load float, float addrspace(3)* %35, align 8, !tbaa !5
  %204 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %205 = fmul contract float %203, %204
  %206 = fadd contract float %202, %205
  %207 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %208 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %209 = fmul contract float %207, %208
  %210 = fadd contract float %206, %209
  %211 = load float, float addrspace(3)* %39, align 16, !tbaa !5
  %212 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %210, %213
  %215 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %216 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %217 = fmul contract float %215, %216
  %218 = fadd contract float %214, %217
  %219 = load float, float addrspace(3)* %43, align 8, !tbaa !5
  %220 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %221 = fmul contract float %219, %220
  %222 = fadd contract float %218, %221
  %223 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %224 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %225 = fmul contract float %223, %224
  %226 = fadd contract float %222, %225
  %227 = load float, float addrspace(3)* %47, align 16, !tbaa !5
  %228 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %229 = fmul contract float %227, %228
  %230 = fadd contract float %226, %229
  %231 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %232 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %233 = fmul contract float %231, %232
  %234 = fadd contract float %230, %233
  %235 = load float, float addrspace(3)* %51, align 8, !tbaa !5
  %236 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %237 = fmul contract float %235, %236
  %238 = fadd contract float %234, %237
  %239 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %240 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %241 = fmul contract float %239, %240
  %242 = fadd contract float %238, %241
  %243 = load float, float addrspace(3)* %55, align 16, !tbaa !5
  %244 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %245 = fmul contract float %243, %244
  %246 = fadd contract float %242, %245
  %247 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %248 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %249 = fmul contract float %247, %248
  %250 = fadd contract float %246, %249
  %251 = load float, float addrspace(3)* %59, align 8, !tbaa !5
  %252 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %253 = fmul contract float %251, %252
  %254 = fadd contract float %250, %253
  %255 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %256 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %257 = fmul contract float %255, %256
  %258 = fadd contract float %254, %257
  %259 = load float, float addrspace(3)* %63, align 16, !tbaa !5
  %260 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %261 = fmul contract float %259, %260
  %262 = fadd contract float %258, %261
  %263 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %264 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %265 = fmul contract float %263, %264
  %266 = fadd contract float %262, %265
  %267 = load float, float addrspace(3)* %67, align 8, !tbaa !5
  %268 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %269 = fmul contract float %267, %268
  %270 = fadd contract float %266, %269
  %271 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %272 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %273 = fmul contract float %271, %272
  %274 = fadd contract float %270, %273
  %275 = load float, float addrspace(3)* %71, align 16, !tbaa !5
  %276 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %277 = fmul contract float %275, %276
  %278 = fadd contract float %274, %277
  %279 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %280 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %281 = fmul contract float %279, %280
  %282 = fadd contract float %278, %281
  %283 = load float, float addrspace(3)* %75, align 8, !tbaa !5
  %284 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %285 = fmul contract float %283, %284
  %286 = fadd contract float %282, %285
  %287 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %288 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %289 = fmul contract float %287, %288
  %290 = fadd contract float %286, %289
  %291 = load float, float addrspace(3)* %79, align 16, !tbaa !5
  %292 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %293 = fmul contract float %291, %292
  %294 = fadd contract float %290, %293
  %295 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %296 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %297 = fmul contract float %295, %296
  %298 = fadd contract float %294, %297
  %299 = load float, float addrspace(3)* %83, align 8, !tbaa !5
  %300 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %301 = fmul contract float %299, %300
  %302 = fadd contract float %298, %301
  %303 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %304 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %305 = fmul contract float %303, %304
  %306 = fadd contract float %302, %305
  %307 = load float, float addrspace(3)* %87, align 16, !tbaa !5
  %308 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %309 = fmul contract float %307, %308
  %310 = fadd contract float %306, %309
  %311 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %312 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %313 = fmul contract float %311, %312
  %314 = fadd contract float %310, %313
  %315 = load float, float addrspace(3)* %91, align 8, !tbaa !5
  %316 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %317 = fmul contract float %315, %316
  %318 = fadd contract float %314, %317
  %319 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %320 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %321 = fmul contract float %319, %320
  %322 = fadd contract float %318, %321
  %323 = load float, float addrspace(3)* %95, align 16, !tbaa !5
  %324 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %325 = fmul contract float %323, %324
  %326 = fadd contract float %322, %325
  %327 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %328 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %329 = fmul contract float %327, %328
  %330 = fadd contract float %326, %329
  %331 = load float, float addrspace(3)* %99, align 8, !tbaa !5
  %332 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %333 = fmul contract float %331, %332
  %334 = fadd contract float %330, %333
  %335 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %336 = load float, float addrspace(3)* %102, align 4, !tbaa !5
  %337 = fmul contract float %335, %336
  %338 = fadd contract float %334, %337
  %339 = load float, float addrspace(3)* %103, align 16, !tbaa !5
  %340 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %341 = fmul contract float %339, %340
  %342 = fadd contract float %338, %341
  %343 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %344 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %345 = fmul contract float %343, %344
  %346 = fadd contract float %342, %345
  %347 = load float, float addrspace(3)* %107, align 8, !tbaa !5
  %348 = load float, float addrspace(3)* %108, align 4, !tbaa !5
  %349 = fmul contract float %347, %348
  %350 = fadd contract float %346, %349
  %351 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %352 = load float, float addrspace(3)* %110, align 4, !tbaa !5
  %353 = fmul contract float %351, %352
  %354 = fadd contract float %350, %353
  %355 = load float, float addrspace(3)* %111, align 16, !tbaa !5
  %356 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %357 = fmul contract float %355, %356
  %358 = fadd contract float %354, %357
  %359 = load float, float addrspace(3)* %113, align 4, !tbaa !5
  %360 = load float, float addrspace(3)* %114, align 4, !tbaa !5
  %361 = fmul contract float %359, %360
  %362 = fadd contract float %358, %361
  %363 = load float, float addrspace(3)* %115, align 8, !tbaa !5
  %364 = load float, float addrspace(3)* %116, align 4, !tbaa !5
  %365 = fmul contract float %363, %364
  %366 = fadd contract float %362, %365
  %367 = load float, float addrspace(3)* %117, align 4, !tbaa !5
  %368 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %369 = fmul contract float %367, %368
  %370 = fadd contract float %366, %369
  %371 = load float, float addrspace(3)* %119, align 16, !tbaa !5
  %372 = load float, float addrspace(3)* %120, align 4, !tbaa !5
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %370, %373
  %375 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %376 = load float, float addrspace(3)* %122, align 4, !tbaa !5
  %377 = fmul contract float %375, %376
  %378 = fadd contract float %374, %377
  %379 = load float, float addrspace(3)* %123, align 8, !tbaa !5
  %380 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %381 = fmul contract float %379, %380
  %382 = fadd contract float %378, %381
  %383 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %384 = load float, float addrspace(3)* %126, align 4, !tbaa !5
  %385 = fmul contract float %383, %384
  %386 = fadd contract float %382, %385
  %387 = load float, float addrspace(3)* %127, align 16, !tbaa !5
  %388 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %389 = fmul contract float %387, %388
  %390 = fadd contract float %386, %389
  %391 = load float, float addrspace(3)* %129, align 4, !tbaa !5
  %392 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %390, %393
  %395 = load float, float addrspace(3)* %131, align 8, !tbaa !5
  %396 = load float, float addrspace(3)* %132, align 4, !tbaa !5
  %397 = fmul contract float %395, %396
  %398 = fadd contract float %394, %397
  %399 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %400 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %401 = fmul contract float %399, %400
  %402 = fadd contract float %398, %401
  %403 = load float, float addrspace(3)* %135, align 16, !tbaa !5
  %404 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %405 = fmul contract float %403, %404
  %406 = fadd contract float %402, %405
  %407 = load float, float addrspace(3)* %137, align 4, !tbaa !5
  %408 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %409 = fmul contract float %407, %408
  %410 = fadd contract float %406, %409
  %411 = load float, float addrspace(3)* %139, align 8, !tbaa !5
  %412 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %413 = fmul contract float %411, %412
  %414 = fadd contract float %410, %413
  %415 = load float, float addrspace(3)* %141, align 4, !tbaa !5
  %416 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %417 = fmul contract float %415, %416
  %418 = fadd contract float %414, %417
  %419 = load float, float addrspace(3)* %143, align 16, !tbaa !5
  %420 = load float, float addrspace(3)* %144, align 4, !tbaa !5
  %421 = fmul contract float %419, %420
  %422 = fadd contract float %418, %421
  %423 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %424 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %425 = fmul contract float %423, %424
  %426 = fadd contract float %422, %425
  %427 = load float, float addrspace(3)* %147, align 8, !tbaa !5
  %428 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %429 = fmul contract float %427, %428
  %430 = fadd contract float %426, %429
  %431 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %432 = load float, float addrspace(3)* %150, align 4, !tbaa !5
  %433 = fmul contract float %431, %432
  %434 = fadd contract float %430, %433
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %435 = add nuw nsw i32 %157, 1
  %436 = sitofp i32 %435 to float
  %437 = fcmp contract ogt float %15, %436
  br i1 %437, label %156, label %151, !llvm.loop !10

438:                                              ; preds = %151
  %439 = mul nsw i32 %10, %3
  %440 = add nsw i32 %439, %12
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds float, float addrspace(1)* %2, i64 %441
  store float %152, float addrspace(1)* %442, align 4, !tbaa !5
  br label %443

443:                                              ; preds = %438, %151
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
