; ModuleID = '../data/hip_kernels/12506/1/main.cu'
source_filename = "../data/hip_kernels/12506/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M = internal unnamed_addr addrspace(3) global [40 x [40 x double]] undef, align 16
@_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N = internal unnamed_addr addrspace(3) global [40 x [40 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23matrixMultiplySharedMemPdS_S_iiiiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = mul nsw i32 %11, 40
  %15 = add nsw i32 %14, %13
  %16 = mul nsw i32 %10, 40
  %17 = add nsw i32 %16, %12
  %18 = icmp slt i32 %4, -38
  br i1 %18, label %107, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %4, -1
  %21 = sdiv i32 %20, 40
  %22 = icmp slt i32 %15, %3
  %23 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 %12
  %24 = mul nsw i32 %15, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 %13, i32 %12
  %27 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 0
  %28 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 0, i32 %12
  %29 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 1
  %30 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 1, i32 %12
  %31 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 2
  %32 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 2, i32 %12
  %33 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 3
  %34 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 3, i32 %12
  %35 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 4
  %36 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 4, i32 %12
  %37 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 5
  %38 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 5, i32 %12
  %39 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 6
  %40 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 6, i32 %12
  %41 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 7
  %42 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 7, i32 %12
  %43 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 8
  %44 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 8, i32 %12
  %45 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 9
  %46 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 9, i32 %12
  %47 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 10
  %48 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 10, i32 %12
  %49 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 11
  %50 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 11, i32 %12
  %51 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 12
  %52 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 12, i32 %12
  %53 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 13
  %54 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 13, i32 %12
  %55 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 14
  %56 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 14, i32 %12
  %57 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 15
  %58 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 15, i32 %12
  %59 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 16
  %60 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 16, i32 %12
  %61 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 17
  %62 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 17, i32 %12
  %63 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 18
  %64 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 18, i32 %12
  %65 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 19
  %66 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 19, i32 %12
  %67 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 20
  %68 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 20, i32 %12
  %69 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 21
  %70 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 21, i32 %12
  %71 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 22
  %72 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 22, i32 %12
  %73 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 23
  %74 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 23, i32 %12
  %75 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 24
  %76 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 24, i32 %12
  %77 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 25
  %78 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 25, i32 %12
  %79 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 26
  %80 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 26, i32 %12
  %81 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 27
  %82 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 27, i32 %12
  %83 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 28
  %84 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 28, i32 %12
  %85 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 29
  %86 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 29, i32 %12
  %87 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 30
  %88 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 30, i32 %12
  %89 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 31
  %90 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 31, i32 %12
  %91 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 32
  %92 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 32, i32 %12
  %93 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 33
  %94 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 33, i32 %12
  %95 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 34
  %96 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 34, i32 %12
  %97 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 35
  %98 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 35, i32 %12
  %99 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 36
  %100 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 36, i32 %12
  %101 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 37
  %102 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 37, i32 %12
  %103 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 38
  %104 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 38, i32 %12
  %105 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 39
  %106 = getelementptr inbounds [40 x [40 x double]], [40 x [40 x double]] addrspace(3)* @_ZZ23matrixMultiplySharedMemPdS_S_iiiiiiE4ds_N, i32 0, i32 39, i32 %12
  br label %112

107:                                              ; preds = %136, %9
  %108 = phi double [ 0.000000e+00, %9 ], [ %297, %136 ]
  %109 = icmp slt i32 %15, %7
  %110 = icmp slt i32 %17, %8
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %300, label %305

112:                                              ; preds = %19, %136
  %113 = phi i32 [ 0, %19 ], [ %298, %136 ]
  %114 = phi double [ 0.000000e+00, %19 ], [ %297, %136 ]
  br i1 %22, label %115, label %124

115:                                              ; preds = %112
  %116 = mul nuw nsw i32 %113, 40
  %117 = add nuw i32 %116, %12
  %118 = icmp slt i32 %117, %4
  br i1 %118, label %119, label %124

119:                                              ; preds = %115
  %120 = add i32 %117, %24
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %0, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %124

124:                                              ; preds = %112, %115, %119
  %125 = phi double [ %123, %119 ], [ 0.000000e+00, %115 ], [ 0.000000e+00, %112 ]
  store double %125, double addrspace(3)* %23, align 8, !tbaa !5
  br i1 %25, label %126, label %136

126:                                              ; preds = %124
  %127 = mul nuw nsw i32 %113, 40
  %128 = add nuw nsw i32 %127, %13
  %129 = icmp slt i32 %128, %5
  br i1 %129, label %130, label %136

130:                                              ; preds = %126
  %131 = mul nsw i32 %128, %6
  %132 = add nsw i32 %131, %17
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %1, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %136

136:                                              ; preds = %124, %126, %130
  %137 = phi double [ %135, %130 ], [ 0.000000e+00, %126 ], [ 0.000000e+00, %124 ]
  store double %137, double addrspace(3)* %26, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = load double, double addrspace(3)* %27, align 16, !tbaa !5
  %139 = load double, double addrspace(3)* %28, align 8, !tbaa !5
  %140 = fmul contract double %138, %139
  %141 = fadd contract double %114, %140
  %142 = load double, double addrspace(3)* %29, align 8, !tbaa !5
  %143 = load double, double addrspace(3)* %30, align 8, !tbaa !5
  %144 = fmul contract double %142, %143
  %145 = fadd contract double %141, %144
  %146 = load double, double addrspace(3)* %31, align 16, !tbaa !5
  %147 = load double, double addrspace(3)* %32, align 8, !tbaa !5
  %148 = fmul contract double %146, %147
  %149 = fadd contract double %145, %148
  %150 = load double, double addrspace(3)* %33, align 8, !tbaa !5
  %151 = load double, double addrspace(3)* %34, align 8, !tbaa !5
  %152 = fmul contract double %150, %151
  %153 = fadd contract double %149, %152
  %154 = load double, double addrspace(3)* %35, align 16, !tbaa !5
  %155 = load double, double addrspace(3)* %36, align 8, !tbaa !5
  %156 = fmul contract double %154, %155
  %157 = fadd contract double %153, %156
  %158 = load double, double addrspace(3)* %37, align 8, !tbaa !5
  %159 = load double, double addrspace(3)* %38, align 8, !tbaa !5
  %160 = fmul contract double %158, %159
  %161 = fadd contract double %157, %160
  %162 = load double, double addrspace(3)* %39, align 16, !tbaa !5
  %163 = load double, double addrspace(3)* %40, align 8, !tbaa !5
  %164 = fmul contract double %162, %163
  %165 = fadd contract double %161, %164
  %166 = load double, double addrspace(3)* %41, align 8, !tbaa !5
  %167 = load double, double addrspace(3)* %42, align 8, !tbaa !5
  %168 = fmul contract double %166, %167
  %169 = fadd contract double %165, %168
  %170 = load double, double addrspace(3)* %43, align 16, !tbaa !5
  %171 = load double, double addrspace(3)* %44, align 8, !tbaa !5
  %172 = fmul contract double %170, %171
  %173 = fadd contract double %169, %172
  %174 = load double, double addrspace(3)* %45, align 8, !tbaa !5
  %175 = load double, double addrspace(3)* %46, align 8, !tbaa !5
  %176 = fmul contract double %174, %175
  %177 = fadd contract double %173, %176
  %178 = load double, double addrspace(3)* %47, align 16, !tbaa !5
  %179 = load double, double addrspace(3)* %48, align 8, !tbaa !5
  %180 = fmul contract double %178, %179
  %181 = fadd contract double %177, %180
  %182 = load double, double addrspace(3)* %49, align 8, !tbaa !5
  %183 = load double, double addrspace(3)* %50, align 8, !tbaa !5
  %184 = fmul contract double %182, %183
  %185 = fadd contract double %181, %184
  %186 = load double, double addrspace(3)* %51, align 16, !tbaa !5
  %187 = load double, double addrspace(3)* %52, align 8, !tbaa !5
  %188 = fmul contract double %186, %187
  %189 = fadd contract double %185, %188
  %190 = load double, double addrspace(3)* %53, align 8, !tbaa !5
  %191 = load double, double addrspace(3)* %54, align 8, !tbaa !5
  %192 = fmul contract double %190, %191
  %193 = fadd contract double %189, %192
  %194 = load double, double addrspace(3)* %55, align 16, !tbaa !5
  %195 = load double, double addrspace(3)* %56, align 8, !tbaa !5
  %196 = fmul contract double %194, %195
  %197 = fadd contract double %193, %196
  %198 = load double, double addrspace(3)* %57, align 8, !tbaa !5
  %199 = load double, double addrspace(3)* %58, align 8, !tbaa !5
  %200 = fmul contract double %198, %199
  %201 = fadd contract double %197, %200
  %202 = load double, double addrspace(3)* %59, align 16, !tbaa !5
  %203 = load double, double addrspace(3)* %60, align 8, !tbaa !5
  %204 = fmul contract double %202, %203
  %205 = fadd contract double %201, %204
  %206 = load double, double addrspace(3)* %61, align 8, !tbaa !5
  %207 = load double, double addrspace(3)* %62, align 8, !tbaa !5
  %208 = fmul contract double %206, %207
  %209 = fadd contract double %205, %208
  %210 = load double, double addrspace(3)* %63, align 16, !tbaa !5
  %211 = load double, double addrspace(3)* %64, align 8, !tbaa !5
  %212 = fmul contract double %210, %211
  %213 = fadd contract double %209, %212
  %214 = load double, double addrspace(3)* %65, align 8, !tbaa !5
  %215 = load double, double addrspace(3)* %66, align 8, !tbaa !5
  %216 = fmul contract double %214, %215
  %217 = fadd contract double %213, %216
  %218 = load double, double addrspace(3)* %67, align 16, !tbaa !5
  %219 = load double, double addrspace(3)* %68, align 8, !tbaa !5
  %220 = fmul contract double %218, %219
  %221 = fadd contract double %217, %220
  %222 = load double, double addrspace(3)* %69, align 8, !tbaa !5
  %223 = load double, double addrspace(3)* %70, align 8, !tbaa !5
  %224 = fmul contract double %222, %223
  %225 = fadd contract double %221, %224
  %226 = load double, double addrspace(3)* %71, align 16, !tbaa !5
  %227 = load double, double addrspace(3)* %72, align 8, !tbaa !5
  %228 = fmul contract double %226, %227
  %229 = fadd contract double %225, %228
  %230 = load double, double addrspace(3)* %73, align 8, !tbaa !5
  %231 = load double, double addrspace(3)* %74, align 8, !tbaa !5
  %232 = fmul contract double %230, %231
  %233 = fadd contract double %229, %232
  %234 = load double, double addrspace(3)* %75, align 16, !tbaa !5
  %235 = load double, double addrspace(3)* %76, align 8, !tbaa !5
  %236 = fmul contract double %234, %235
  %237 = fadd contract double %233, %236
  %238 = load double, double addrspace(3)* %77, align 8, !tbaa !5
  %239 = load double, double addrspace(3)* %78, align 8, !tbaa !5
  %240 = fmul contract double %238, %239
  %241 = fadd contract double %237, %240
  %242 = load double, double addrspace(3)* %79, align 16, !tbaa !5
  %243 = load double, double addrspace(3)* %80, align 8, !tbaa !5
  %244 = fmul contract double %242, %243
  %245 = fadd contract double %241, %244
  %246 = load double, double addrspace(3)* %81, align 8, !tbaa !5
  %247 = load double, double addrspace(3)* %82, align 8, !tbaa !5
  %248 = fmul contract double %246, %247
  %249 = fadd contract double %245, %248
  %250 = load double, double addrspace(3)* %83, align 16, !tbaa !5
  %251 = load double, double addrspace(3)* %84, align 8, !tbaa !5
  %252 = fmul contract double %250, %251
  %253 = fadd contract double %249, %252
  %254 = load double, double addrspace(3)* %85, align 8, !tbaa !5
  %255 = load double, double addrspace(3)* %86, align 8, !tbaa !5
  %256 = fmul contract double %254, %255
  %257 = fadd contract double %253, %256
  %258 = load double, double addrspace(3)* %87, align 16, !tbaa !5
  %259 = load double, double addrspace(3)* %88, align 8, !tbaa !5
  %260 = fmul contract double %258, %259
  %261 = fadd contract double %257, %260
  %262 = load double, double addrspace(3)* %89, align 8, !tbaa !5
  %263 = load double, double addrspace(3)* %90, align 8, !tbaa !5
  %264 = fmul contract double %262, %263
  %265 = fadd contract double %261, %264
  %266 = load double, double addrspace(3)* %91, align 16, !tbaa !5
  %267 = load double, double addrspace(3)* %92, align 8, !tbaa !5
  %268 = fmul contract double %266, %267
  %269 = fadd contract double %265, %268
  %270 = load double, double addrspace(3)* %93, align 8, !tbaa !5
  %271 = load double, double addrspace(3)* %94, align 8, !tbaa !5
  %272 = fmul contract double %270, %271
  %273 = fadd contract double %269, %272
  %274 = load double, double addrspace(3)* %95, align 16, !tbaa !5
  %275 = load double, double addrspace(3)* %96, align 8, !tbaa !5
  %276 = fmul contract double %274, %275
  %277 = fadd contract double %273, %276
  %278 = load double, double addrspace(3)* %97, align 8, !tbaa !5
  %279 = load double, double addrspace(3)* %98, align 8, !tbaa !5
  %280 = fmul contract double %278, %279
  %281 = fadd contract double %277, %280
  %282 = load double, double addrspace(3)* %99, align 16, !tbaa !5
  %283 = load double, double addrspace(3)* %100, align 8, !tbaa !5
  %284 = fmul contract double %282, %283
  %285 = fadd contract double %281, %284
  %286 = load double, double addrspace(3)* %101, align 8, !tbaa !5
  %287 = load double, double addrspace(3)* %102, align 8, !tbaa !5
  %288 = fmul contract double %286, %287
  %289 = fadd contract double %285, %288
  %290 = load double, double addrspace(3)* %103, align 16, !tbaa !5
  %291 = load double, double addrspace(3)* %104, align 8, !tbaa !5
  %292 = fmul contract double %290, %291
  %293 = fadd contract double %289, %292
  %294 = load double, double addrspace(3)* %105, align 8, !tbaa !5
  %295 = load double, double addrspace(3)* %106, align 8, !tbaa !5
  %296 = fmul contract double %294, %295
  %297 = fadd contract double %293, %296
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %298 = add nuw nsw i32 %113, 1
  %299 = icmp eq i32 %113, %21
  br i1 %299, label %107, label %112, !llvm.loop !10

300:                                              ; preds = %107
  %301 = mul nsw i32 %15, %8
  %302 = add nsw i32 %301, %17
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds double, double addrspace(1)* %2, i64 %303
  store double %108, double addrspace(1)* %304, align 8, !tbaa !5
  br label %305

305:                                              ; preds = %300, %107
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
