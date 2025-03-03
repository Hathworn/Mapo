; ModuleID = '../data/hip_kernels/12828/3/main.cu'
source_filename = "../data/hip_kernels/12828/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10tileMatMulPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 5
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 5
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %4, -30
  br i1 %18, label %91, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %4, -1
  %21 = sdiv i32 %20, 32
  %22 = icmp slt i32 %13, %3
  %23 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 %16
  %24 = mul nsw i32 %13, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 %12, i32 %16
  %27 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 0
  %28 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 0, i32 %16
  %29 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 1
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 1, i32 %16
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 2
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 2, i32 %16
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 3
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 3, i32 %16
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 4
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 4, i32 %16
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 5
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 5, i32 %16
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 6
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 6, i32 %16
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 7
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 7, i32 %16
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 8
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 8, i32 %16
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 9
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 9, i32 %16
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 10
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 10, i32 %16
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 11
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 11, i32 %16
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 12
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 12, i32 %16
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 13
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 13, i32 %16
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 14
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 14, i32 %16
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 15
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 15, i32 %16
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 16
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 16, i32 %16
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 17
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 17, i32 %16
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 18
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 18, i32 %16
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 19
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 19, i32 %16
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 20
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 20, i32 %16
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 21
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 21, i32 %16
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 22
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 22, i32 %16
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 23
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 23, i32 %16
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 24
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 24, i32 %16
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 25
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 25, i32 %16
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 26
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 26, i32 %16
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 27
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 27, i32 %16
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 28
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 28, i32 %16
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 29
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 29, i32 %16
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 30
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 30, i32 %16
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatA, i32 0, i32 %12, i32 31
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ10tileMatMulPfS_S_iiiiiiE10sharedMatB, i32 0, i32 31, i32 %16
  br label %96

91:                                               ; preds = %120, %9
  %92 = phi float [ 0.000000e+00, %9 ], [ %249, %120 ]
  %93 = icmp slt i32 %13, %7
  %94 = icmp slt i32 %17, %8
  %95 = select i1 %93, i1 %94, i1 false
  br i1 %95, label %252, label %257

96:                                               ; preds = %19, %120
  %97 = phi i32 [ 0, %19 ], [ %250, %120 ]
  %98 = phi float [ 0.000000e+00, %19 ], [ %249, %120 ]
  br i1 %22, label %99, label %108

99:                                               ; preds = %96
  %100 = shl nsw i32 %97, 5
  %101 = add nuw i32 %100, %16
  %102 = icmp ult i32 %101, %4
  br i1 %102, label %103, label %108

103:                                              ; preds = %99
  %104 = add i32 %101, %24
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %108

108:                                              ; preds = %96, %99, %103
  %109 = phi float [ %107, %103 ], [ 0.000000e+00, %99 ], [ 0.000000e+00, %96 ]
  store float %109, float addrspace(3)* %23, align 4, !tbaa !5
  br i1 %25, label %110, label %120

110:                                              ; preds = %108
  %111 = shl nsw i32 %97, 5
  %112 = add nuw i32 %111, %12
  %113 = icmp ult i32 %112, %7
  br i1 %113, label %114, label %120

114:                                              ; preds = %110
  %115 = mul i32 %112, %6
  %116 = add i32 %115, %17
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %120

120:                                              ; preds = %108, %110, %114
  %121 = phi float [ %119, %114 ], [ 0.000000e+00, %110 ], [ 0.000000e+00, %108 ]
  store float %121, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = load float, float addrspace(3)* %27, align 16, !tbaa !5
  %123 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %98, %124
  %126 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %131 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %135 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %139 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %143 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %147 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %151 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %155 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %159 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  %162 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %163 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %164 = fmul contract float %162, %163
  %165 = fadd contract float %161, %164
  %166 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %167 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %168 = fmul contract float %166, %167
  %169 = fadd contract float %165, %168
  %170 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %171 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %172 = fmul contract float %170, %171
  %173 = fadd contract float %169, %172
  %174 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %175 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %176 = fmul contract float %174, %175
  %177 = fadd contract float %173, %176
  %178 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %179 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %180 = fmul contract float %178, %179
  %181 = fadd contract float %177, %180
  %182 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %183 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %181, %184
  %186 = load float, float addrspace(3)* %59, align 16, !tbaa !5
  %187 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %188 = fmul contract float %186, %187
  %189 = fadd contract float %185, %188
  %190 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %191 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %192 = fmul contract float %190, %191
  %193 = fadd contract float %189, %192
  %194 = load float, float addrspace(3)* %63, align 8, !tbaa !5
  %195 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %193, %196
  %198 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %199 = load float, float addrspace(3)* %66, align 4, !tbaa !5
  %200 = fmul contract float %198, %199
  %201 = fadd contract float %197, %200
  %202 = load float, float addrspace(3)* %67, align 16, !tbaa !5
  %203 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %204 = fmul contract float %202, %203
  %205 = fadd contract float %201, %204
  %206 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %207 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %205, %208
  %210 = load float, float addrspace(3)* %71, align 8, !tbaa !5
  %211 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %212 = fmul contract float %210, %211
  %213 = fadd contract float %209, %212
  %214 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %215 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %216 = fmul contract float %214, %215
  %217 = fadd contract float %213, %216
  %218 = load float, float addrspace(3)* %75, align 16, !tbaa !5
  %219 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %220 = fmul contract float %218, %219
  %221 = fadd contract float %217, %220
  %222 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %223 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %224 = fmul contract float %222, %223
  %225 = fadd contract float %221, %224
  %226 = load float, float addrspace(3)* %79, align 8, !tbaa !5
  %227 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %228 = fmul contract float %226, %227
  %229 = fadd contract float %225, %228
  %230 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %231 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %232 = fmul contract float %230, %231
  %233 = fadd contract float %229, %232
  %234 = load float, float addrspace(3)* %83, align 16, !tbaa !5
  %235 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %236 = fmul contract float %234, %235
  %237 = fadd contract float %233, %236
  %238 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %239 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %240 = fmul contract float %238, %239
  %241 = fadd contract float %237, %240
  %242 = load float, float addrspace(3)* %87, align 8, !tbaa !5
  %243 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %244 = fmul contract float %242, %243
  %245 = fadd contract float %241, %244
  %246 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %247 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %248 = fmul contract float %246, %247
  %249 = fadd contract float %245, %248
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %250 = add nuw nsw i32 %97, 1
  %251 = icmp eq i32 %97, %21
  br i1 %251, label %91, label %96, !llvm.loop !10

252:                                              ; preds = %91
  %253 = mul nsw i32 %13, %8
  %254 = add nsw i32 %253, %17
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %2, i64 %255
  store float %92, float addrspace(1)* %256, align 4, !tbaa !5
  br label %257

257:                                              ; preds = %252, %91
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
