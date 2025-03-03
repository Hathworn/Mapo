; ModuleID = '../data/hip_kernels/14163/0/main.cu'
source_filename = "../data/hip_kernels/14163/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA = internal unnamed_addr addrspace(3) global [64 x [64 x float]] undef, align 16
@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB = internal unnamed_addr addrspace(3) global [64 x [64 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20matrixMultiplySharedPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  %27 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !7
  %29 = icmp slt i32 %4, -62
  br i1 %29, label %164, label %30

30:                                               ; preds = %9
  %31 = add nsw i32 %4, -1
  %32 = sdiv i32 %31, 64
  %33 = icmp slt i32 %18, %3
  %34 = mul nsw i32 %18, %4
  %35 = icmp slt i32 %26, %6
  %36 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 0
  %37 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 0, i32 %25
  %38 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 1
  %39 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 1, i32 %25
  %40 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 2
  %41 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 2, i32 %25
  %42 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 3
  %43 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 3, i32 %25
  %44 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 4
  %45 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 4, i32 %25
  %46 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 5
  %47 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 5, i32 %25
  %48 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 6
  %49 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 6, i32 %25
  %50 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 7
  %51 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 7, i32 %25
  %52 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 8
  %53 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 8, i32 %25
  %54 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 9
  %55 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 9, i32 %25
  %56 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 10
  %57 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 10, i32 %25
  %58 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 11
  %59 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 11, i32 %25
  %60 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 12
  %61 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 12, i32 %25
  %62 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 13
  %63 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 13, i32 %25
  %64 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 14
  %65 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 14, i32 %25
  %66 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 15
  %67 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 15, i32 %25
  %68 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 16
  %69 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 16, i32 %25
  %70 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 17
  %71 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 17, i32 %25
  %72 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 18
  %73 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 18, i32 %25
  %74 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 19
  %75 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 19, i32 %25
  %76 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 20
  %77 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 20, i32 %25
  %78 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 21
  %79 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 21, i32 %25
  %80 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 22
  %81 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 22, i32 %25
  %82 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 23
  %83 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 23, i32 %25
  %84 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 24
  %85 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 24, i32 %25
  %86 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 25
  %87 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 25, i32 %25
  %88 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 26
  %89 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 26, i32 %25
  %90 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 27
  %91 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 27, i32 %25
  %92 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 28
  %93 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 28, i32 %25
  %94 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 29
  %95 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 29, i32 %25
  %96 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 30
  %97 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 30, i32 %25
  %98 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 31
  %99 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 31, i32 %25
  %100 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 32
  %101 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 32, i32 %25
  %102 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 33
  %103 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 33, i32 %25
  %104 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 34
  %105 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 34, i32 %25
  %106 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 35
  %107 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 35, i32 %25
  %108 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 36
  %109 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 36, i32 %25
  %110 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 37
  %111 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 37, i32 %25
  %112 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 38
  %113 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 38, i32 %25
  %114 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 39
  %115 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 39, i32 %25
  %116 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 40
  %117 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 40, i32 %25
  %118 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 41
  %119 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 41, i32 %25
  %120 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 42
  %121 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 42, i32 %25
  %122 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 43
  %123 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 43, i32 %25
  %124 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 44
  %125 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 44, i32 %25
  %126 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 45
  %127 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 45, i32 %25
  %128 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 46
  %129 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 46, i32 %25
  %130 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 47
  %131 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 47, i32 %25
  %132 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 48
  %133 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 48, i32 %25
  %134 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 49
  %135 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 49, i32 %25
  %136 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 50
  %137 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 50, i32 %25
  %138 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 51
  %139 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 51, i32 %25
  %140 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 52
  %141 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 52, i32 %25
  %142 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 53
  %143 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 53, i32 %25
  %144 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 54
  %145 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 54, i32 %25
  %146 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 55
  %147 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 55, i32 %25
  %148 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 56
  %149 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 56, i32 %25
  %150 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 57
  %151 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 57, i32 %25
  %152 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 58
  %153 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 58, i32 %25
  %154 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 59
  %155 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 59, i32 %25
  %156 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 60
  %157 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 60, i32 %25
  %158 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 61
  %159 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 61, i32 %25
  %160 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 62
  %161 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 62, i32 %25
  %162 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 63
  %163 = getelementptr inbounds [64 x [64 x float]], [64 x [64 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 63, i32 %25
  br label %169

164:                                              ; preds = %193, %9
  %165 = phi float [ 0.000000e+00, %9 ], [ %450, %193 ]
  %166 = icmp slt i32 %18, %7
  %167 = icmp slt i32 %26, %8
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %453, label %458

169:                                              ; preds = %30, %193
  %170 = phi i32 [ 0, %30 ], [ %451, %193 ]
  %171 = phi float [ 0.000000e+00, %30 ], [ %450, %193 ]
  br i1 %33, label %172, label %181

172:                                              ; preds = %169
  %173 = shl nsw i32 %170, 6
  %174 = add nuw i32 %173, %25
  %175 = icmp ult i32 %174, %4
  br i1 %175, label %176, label %181

176:                                              ; preds = %172
  %177 = add i32 %174, %34
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  br label %181

181:                                              ; preds = %169, %172, %176
  %182 = phi float [ %180, %176 ], [ 0.000000e+00, %172 ], [ 0.000000e+00, %169 ]
  store float %182, float addrspace(3)* %27, align 4, !tbaa !7
  br i1 %35, label %183, label %193

183:                                              ; preds = %181
  %184 = shl nsw i32 %170, 6
  %185 = add nuw i32 %184, %17
  %186 = icmp ult i32 %185, %5
  br i1 %186, label %187, label %193

187:                                              ; preds = %183
  %188 = mul i32 %185, %6
  %189 = add i32 %188, %26
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %1, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  br label %193

193:                                              ; preds = %181, %183, %187
  %194 = phi float [ %192, %187 ], [ 0.000000e+00, %183 ], [ 0.000000e+00, %181 ]
  store float %194, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %195 = load float, float addrspace(3)* %36, align 16, !tbaa !7
  %196 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %197 = fmul contract float %195, %196
  %198 = fadd contract float %171, %197
  %199 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %200 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %198, %201
  %203 = load float, float addrspace(3)* %40, align 8, !tbaa !7
  %204 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %205 = fmul contract float %203, %204
  %206 = fadd contract float %202, %205
  %207 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %208 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %209 = fmul contract float %207, %208
  %210 = fadd contract float %206, %209
  %211 = load float, float addrspace(3)* %44, align 16, !tbaa !7
  %212 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %210, %213
  %215 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %216 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %217 = fmul contract float %215, %216
  %218 = fadd contract float %214, %217
  %219 = load float, float addrspace(3)* %48, align 8, !tbaa !7
  %220 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %221 = fmul contract float %219, %220
  %222 = fadd contract float %218, %221
  %223 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %224 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %225 = fmul contract float %223, %224
  %226 = fadd contract float %222, %225
  %227 = load float, float addrspace(3)* %52, align 16, !tbaa !7
  %228 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %229 = fmul contract float %227, %228
  %230 = fadd contract float %226, %229
  %231 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %232 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %233 = fmul contract float %231, %232
  %234 = fadd contract float %230, %233
  %235 = load float, float addrspace(3)* %56, align 8, !tbaa !7
  %236 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %237 = fmul contract float %235, %236
  %238 = fadd contract float %234, %237
  %239 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %240 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %241 = fmul contract float %239, %240
  %242 = fadd contract float %238, %241
  %243 = load float, float addrspace(3)* %60, align 16, !tbaa !7
  %244 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %245 = fmul contract float %243, %244
  %246 = fadd contract float %242, %245
  %247 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %248 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %249 = fmul contract float %247, %248
  %250 = fadd contract float %246, %249
  %251 = load float, float addrspace(3)* %64, align 8, !tbaa !7
  %252 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %253 = fmul contract float %251, %252
  %254 = fadd contract float %250, %253
  %255 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %256 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %257 = fmul contract float %255, %256
  %258 = fadd contract float %254, %257
  %259 = load float, float addrspace(3)* %68, align 16, !tbaa !7
  %260 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %261 = fmul contract float %259, %260
  %262 = fadd contract float %258, %261
  %263 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %264 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %265 = fmul contract float %263, %264
  %266 = fadd contract float %262, %265
  %267 = load float, float addrspace(3)* %72, align 8, !tbaa !7
  %268 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %269 = fmul contract float %267, %268
  %270 = fadd contract float %266, %269
  %271 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %272 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %273 = fmul contract float %271, %272
  %274 = fadd contract float %270, %273
  %275 = load float, float addrspace(3)* %76, align 16, !tbaa !7
  %276 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %277 = fmul contract float %275, %276
  %278 = fadd contract float %274, %277
  %279 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %280 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %281 = fmul contract float %279, %280
  %282 = fadd contract float %278, %281
  %283 = load float, float addrspace(3)* %80, align 8, !tbaa !7
  %284 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %285 = fmul contract float %283, %284
  %286 = fadd contract float %282, %285
  %287 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %288 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %289 = fmul contract float %287, %288
  %290 = fadd contract float %286, %289
  %291 = load float, float addrspace(3)* %84, align 16, !tbaa !7
  %292 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %293 = fmul contract float %291, %292
  %294 = fadd contract float %290, %293
  %295 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %296 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %297 = fmul contract float %295, %296
  %298 = fadd contract float %294, %297
  %299 = load float, float addrspace(3)* %88, align 8, !tbaa !7
  %300 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %301 = fmul contract float %299, %300
  %302 = fadd contract float %298, %301
  %303 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %304 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %305 = fmul contract float %303, %304
  %306 = fadd contract float %302, %305
  %307 = load float, float addrspace(3)* %92, align 16, !tbaa !7
  %308 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %309 = fmul contract float %307, %308
  %310 = fadd contract float %306, %309
  %311 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %312 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %313 = fmul contract float %311, %312
  %314 = fadd contract float %310, %313
  %315 = load float, float addrspace(3)* %96, align 8, !tbaa !7
  %316 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %317 = fmul contract float %315, %316
  %318 = fadd contract float %314, %317
  %319 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %320 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %321 = fmul contract float %319, %320
  %322 = fadd contract float %318, %321
  %323 = load float, float addrspace(3)* %100, align 16, !tbaa !7
  %324 = load float, float addrspace(3)* %101, align 4, !tbaa !7
  %325 = fmul contract float %323, %324
  %326 = fadd contract float %322, %325
  %327 = load float, float addrspace(3)* %102, align 4, !tbaa !7
  %328 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %329 = fmul contract float %327, %328
  %330 = fadd contract float %326, %329
  %331 = load float, float addrspace(3)* %104, align 8, !tbaa !7
  %332 = load float, float addrspace(3)* %105, align 4, !tbaa !7
  %333 = fmul contract float %331, %332
  %334 = fadd contract float %330, %333
  %335 = load float, float addrspace(3)* %106, align 4, !tbaa !7
  %336 = load float, float addrspace(3)* %107, align 4, !tbaa !7
  %337 = fmul contract float %335, %336
  %338 = fadd contract float %334, %337
  %339 = load float, float addrspace(3)* %108, align 16, !tbaa !7
  %340 = load float, float addrspace(3)* %109, align 4, !tbaa !7
  %341 = fmul contract float %339, %340
  %342 = fadd contract float %338, %341
  %343 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %344 = load float, float addrspace(3)* %111, align 4, !tbaa !7
  %345 = fmul contract float %343, %344
  %346 = fadd contract float %342, %345
  %347 = load float, float addrspace(3)* %112, align 8, !tbaa !7
  %348 = load float, float addrspace(3)* %113, align 4, !tbaa !7
  %349 = fmul contract float %347, %348
  %350 = fadd contract float %346, %349
  %351 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %352 = load float, float addrspace(3)* %115, align 4, !tbaa !7
  %353 = fmul contract float %351, %352
  %354 = fadd contract float %350, %353
  %355 = load float, float addrspace(3)* %116, align 16, !tbaa !7
  %356 = load float, float addrspace(3)* %117, align 4, !tbaa !7
  %357 = fmul contract float %355, %356
  %358 = fadd contract float %354, %357
  %359 = load float, float addrspace(3)* %118, align 4, !tbaa !7
  %360 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %361 = fmul contract float %359, %360
  %362 = fadd contract float %358, %361
  %363 = load float, float addrspace(3)* %120, align 8, !tbaa !7
  %364 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %365 = fmul contract float %363, %364
  %366 = fadd contract float %362, %365
  %367 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %368 = load float, float addrspace(3)* %123, align 4, !tbaa !7
  %369 = fmul contract float %367, %368
  %370 = fadd contract float %366, %369
  %371 = load float, float addrspace(3)* %124, align 16, !tbaa !7
  %372 = load float, float addrspace(3)* %125, align 4, !tbaa !7
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %370, %373
  %375 = load float, float addrspace(3)* %126, align 4, !tbaa !7
  %376 = load float, float addrspace(3)* %127, align 4, !tbaa !7
  %377 = fmul contract float %375, %376
  %378 = fadd contract float %374, %377
  %379 = load float, float addrspace(3)* %128, align 8, !tbaa !7
  %380 = load float, float addrspace(3)* %129, align 4, !tbaa !7
  %381 = fmul contract float %379, %380
  %382 = fadd contract float %378, %381
  %383 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %384 = load float, float addrspace(3)* %131, align 4, !tbaa !7
  %385 = fmul contract float %383, %384
  %386 = fadd contract float %382, %385
  %387 = load float, float addrspace(3)* %132, align 16, !tbaa !7
  %388 = load float, float addrspace(3)* %133, align 4, !tbaa !7
  %389 = fmul contract float %387, %388
  %390 = fadd contract float %386, %389
  %391 = load float, float addrspace(3)* %134, align 4, !tbaa !7
  %392 = load float, float addrspace(3)* %135, align 4, !tbaa !7
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %390, %393
  %395 = load float, float addrspace(3)* %136, align 8, !tbaa !7
  %396 = load float, float addrspace(3)* %137, align 4, !tbaa !7
  %397 = fmul contract float %395, %396
  %398 = fadd contract float %394, %397
  %399 = load float, float addrspace(3)* %138, align 4, !tbaa !7
  %400 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %401 = fmul contract float %399, %400
  %402 = fadd contract float %398, %401
  %403 = load float, float addrspace(3)* %140, align 16, !tbaa !7
  %404 = load float, float addrspace(3)* %141, align 4, !tbaa !7
  %405 = fmul contract float %403, %404
  %406 = fadd contract float %402, %405
  %407 = load float, float addrspace(3)* %142, align 4, !tbaa !7
  %408 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %409 = fmul contract float %407, %408
  %410 = fadd contract float %406, %409
  %411 = load float, float addrspace(3)* %144, align 8, !tbaa !7
  %412 = load float, float addrspace(3)* %145, align 4, !tbaa !7
  %413 = fmul contract float %411, %412
  %414 = fadd contract float %410, %413
  %415 = load float, float addrspace(3)* %146, align 4, !tbaa !7
  %416 = load float, float addrspace(3)* %147, align 4, !tbaa !7
  %417 = fmul contract float %415, %416
  %418 = fadd contract float %414, %417
  %419 = load float, float addrspace(3)* %148, align 16, !tbaa !7
  %420 = load float, float addrspace(3)* %149, align 4, !tbaa !7
  %421 = fmul contract float %419, %420
  %422 = fadd contract float %418, %421
  %423 = load float, float addrspace(3)* %150, align 4, !tbaa !7
  %424 = load float, float addrspace(3)* %151, align 4, !tbaa !7
  %425 = fmul contract float %423, %424
  %426 = fadd contract float %422, %425
  %427 = load float, float addrspace(3)* %152, align 8, !tbaa !7
  %428 = load float, float addrspace(3)* %153, align 4, !tbaa !7
  %429 = fmul contract float %427, %428
  %430 = fadd contract float %426, %429
  %431 = load float, float addrspace(3)* %154, align 4, !tbaa !7
  %432 = load float, float addrspace(3)* %155, align 4, !tbaa !7
  %433 = fmul contract float %431, %432
  %434 = fadd contract float %430, %433
  %435 = load float, float addrspace(3)* %156, align 16, !tbaa !7
  %436 = load float, float addrspace(3)* %157, align 4, !tbaa !7
  %437 = fmul contract float %435, %436
  %438 = fadd contract float %434, %437
  %439 = load float, float addrspace(3)* %158, align 4, !tbaa !7
  %440 = load float, float addrspace(3)* %159, align 4, !tbaa !7
  %441 = fmul contract float %439, %440
  %442 = fadd contract float %438, %441
  %443 = load float, float addrspace(3)* %160, align 8, !tbaa !7
  %444 = load float, float addrspace(3)* %161, align 4, !tbaa !7
  %445 = fmul contract float %443, %444
  %446 = fadd contract float %442, %445
  %447 = load float, float addrspace(3)* %162, align 4, !tbaa !7
  %448 = load float, float addrspace(3)* %163, align 4, !tbaa !7
  %449 = fmul contract float %447, %448
  %450 = fadd contract float %446, %449
  %451 = add nuw nsw i32 %170, 1
  %452 = icmp eq i32 %170, %32
  br i1 %452, label %164, label %169, !llvm.loop !11

453:                                              ; preds = %164
  %454 = mul nsw i32 %18, %8
  %455 = add nsw i32 %454, %26
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %2, i64 %456
  store float %165, float addrspace(1)* %457, align 4, !tbaa !7
  br label %458

458:                                              ; preds = %453, %164
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
