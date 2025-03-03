; ModuleID = '../data/hip_kernels/176/46/main.cu'
source_filename = "../data/hip_kernels/176/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17kArgMaxColumnwisePfS_jjE8max_vals = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@_ZZ17kArgMaxColumnwisePfS_jjE8max_args = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17kArgMaxColumnwisePfS_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp ult i32 %5, %3
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br label %179

9:                                                ; preds = %179, %4
  %10 = phi float [ 0xC7E2CED320000000, %4 ], [ %189, %179 ]
  %11 = phi i32 [ 0, %4 ], [ %190, %179 ]
  %12 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 %5
  store float %10, float addrspace(3)* %12, align 4, !tbaa !5
  %13 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 %5
  store i32 %11, i32 addrspace(3)* %13, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %15, label %193

15:                                               ; preds = %9
  %16 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 0), align 16, !tbaa !5
  %17 = fcmp contract ogt float %16, 0xC7E2CED320000000
  %18 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 0), align 16
  %19 = select i1 %17, float %16, float 0xC7E2CED320000000
  %20 = select i1 %17, i32 %18, i32 0
  %21 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 1), align 4, !tbaa !5
  %22 = fcmp contract ogt float %21, %19
  %23 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 1), align 4
  %24 = select i1 %22, float %21, float %19
  %25 = select i1 %22, i32 %23, i32 %20
  %26 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 2), align 8, !tbaa !5
  %27 = fcmp contract ogt float %26, %24
  %28 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 2), align 8
  %29 = select i1 %27, float %26, float %24
  %30 = select i1 %27, i32 %28, i32 %25
  %31 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 3), align 4, !tbaa !5
  %32 = fcmp contract ogt float %31, %29
  %33 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 3), align 4
  %34 = select i1 %32, float %31, float %29
  %35 = select i1 %32, i32 %33, i32 %30
  %36 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 4), align 16, !tbaa !5
  %37 = fcmp contract ogt float %36, %34
  %38 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 4), align 16
  %39 = select i1 %37, float %36, float %34
  %40 = select i1 %37, i32 %38, i32 %35
  %41 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 5), align 4, !tbaa !5
  %42 = fcmp contract ogt float %41, %39
  %43 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 5), align 4
  %44 = select i1 %42, float %41, float %39
  %45 = select i1 %42, i32 %43, i32 %40
  %46 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 6), align 8, !tbaa !5
  %47 = fcmp contract ogt float %46, %44
  %48 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 6), align 8
  %49 = select i1 %47, float %46, float %44
  %50 = select i1 %47, i32 %48, i32 %45
  %51 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 7), align 4, !tbaa !5
  %52 = fcmp contract ogt float %51, %49
  %53 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 7), align 4
  %54 = select i1 %52, float %51, float %49
  %55 = select i1 %52, i32 %53, i32 %50
  %56 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 8), align 16, !tbaa !5
  %57 = fcmp contract ogt float %56, %54
  %58 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 8), align 16
  %59 = select i1 %57, float %56, float %54
  %60 = select i1 %57, i32 %58, i32 %55
  %61 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 9), align 4, !tbaa !5
  %62 = fcmp contract ogt float %61, %59
  %63 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 9), align 4
  %64 = select i1 %62, float %61, float %59
  %65 = select i1 %62, i32 %63, i32 %60
  %66 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 10), align 8, !tbaa !5
  %67 = fcmp contract ogt float %66, %64
  %68 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 10), align 8
  %69 = select i1 %67, float %66, float %64
  %70 = select i1 %67, i32 %68, i32 %65
  %71 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 11), align 4, !tbaa !5
  %72 = fcmp contract ogt float %71, %69
  %73 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 11), align 4
  %74 = select i1 %72, float %71, float %69
  %75 = select i1 %72, i32 %73, i32 %70
  %76 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 12), align 16, !tbaa !5
  %77 = fcmp contract ogt float %76, %74
  %78 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 12), align 16
  %79 = select i1 %77, float %76, float %74
  %80 = select i1 %77, i32 %78, i32 %75
  %81 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 13), align 4, !tbaa !5
  %82 = fcmp contract ogt float %81, %79
  %83 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 13), align 4
  %84 = select i1 %82, float %81, float %79
  %85 = select i1 %82, i32 %83, i32 %80
  %86 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 14), align 8, !tbaa !5
  %87 = fcmp contract ogt float %86, %84
  %88 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 14), align 8
  %89 = select i1 %87, float %86, float %84
  %90 = select i1 %87, i32 %88, i32 %85
  %91 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 15), align 4, !tbaa !5
  %92 = fcmp contract ogt float %91, %89
  %93 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 15), align 4
  %94 = select i1 %92, float %91, float %89
  %95 = select i1 %92, i32 %93, i32 %90
  %96 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 16), align 16, !tbaa !5
  %97 = fcmp contract ogt float %96, %94
  %98 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 16), align 16
  %99 = select i1 %97, float %96, float %94
  %100 = select i1 %97, i32 %98, i32 %95
  %101 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 17), align 4, !tbaa !5
  %102 = fcmp contract ogt float %101, %99
  %103 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 17), align 4
  %104 = select i1 %102, float %101, float %99
  %105 = select i1 %102, i32 %103, i32 %100
  %106 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 18), align 8, !tbaa !5
  %107 = fcmp contract ogt float %106, %104
  %108 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 18), align 8
  %109 = select i1 %107, float %106, float %104
  %110 = select i1 %107, i32 %108, i32 %105
  %111 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 19), align 4, !tbaa !5
  %112 = fcmp contract ogt float %111, %109
  %113 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 19), align 4
  %114 = select i1 %112, float %111, float %109
  %115 = select i1 %112, i32 %113, i32 %110
  %116 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 20), align 16, !tbaa !5
  %117 = fcmp contract ogt float %116, %114
  %118 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 20), align 16
  %119 = select i1 %117, float %116, float %114
  %120 = select i1 %117, i32 %118, i32 %115
  %121 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 21), align 4, !tbaa !5
  %122 = fcmp contract ogt float %121, %119
  %123 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 21), align 4
  %124 = select i1 %122, float %121, float %119
  %125 = select i1 %122, i32 %123, i32 %120
  %126 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 22), align 8, !tbaa !5
  %127 = fcmp contract ogt float %126, %124
  %128 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 22), align 8
  %129 = select i1 %127, float %126, float %124
  %130 = select i1 %127, i32 %128, i32 %125
  %131 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 23), align 4, !tbaa !5
  %132 = fcmp contract ogt float %131, %129
  %133 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 23), align 4
  %134 = select i1 %132, float %131, float %129
  %135 = select i1 %132, i32 %133, i32 %130
  %136 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 24), align 16, !tbaa !5
  %137 = fcmp contract ogt float %136, %134
  %138 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 24), align 16
  %139 = select i1 %137, float %136, float %134
  %140 = select i1 %137, i32 %138, i32 %135
  %141 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 25), align 4, !tbaa !5
  %142 = fcmp contract ogt float %141, %139
  %143 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 25), align 4
  %144 = select i1 %142, float %141, float %139
  %145 = select i1 %142, i32 %143, i32 %140
  %146 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 26), align 8, !tbaa !5
  %147 = fcmp contract ogt float %146, %144
  %148 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 26), align 8
  %149 = select i1 %147, float %146, float %144
  %150 = select i1 %147, i32 %148, i32 %145
  %151 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 27), align 4, !tbaa !5
  %152 = fcmp contract ogt float %151, %149
  %153 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 27), align 4
  %154 = select i1 %152, float %151, float %149
  %155 = select i1 %152, i32 %153, i32 %150
  %156 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 28), align 16, !tbaa !5
  %157 = fcmp contract ogt float %156, %154
  %158 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 28), align 16
  %159 = select i1 %157, float %156, float %154
  %160 = select i1 %157, i32 %158, i32 %155
  %161 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 29), align 4, !tbaa !5
  %162 = fcmp contract ogt float %161, %159
  %163 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 29), align 4
  %164 = select i1 %162, float %161, float %159
  %165 = select i1 %162, i32 %163, i32 %160
  %166 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 30), align 8, !tbaa !5
  %167 = fcmp contract ogt float %166, %164
  %168 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 30), align 8
  %169 = select i1 %167, float %166, float %164
  %170 = select i1 %167, i32 %168, i32 %165
  %171 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_vals, i32 0, i32 31), align 4, !tbaa !5
  %172 = fcmp contract ogt float %171, %169
  %173 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ17kArgMaxColumnwisePfS_jjE8max_args, i32 0, i32 31), align 4
  %174 = select i1 %172, i32 %173, i32 %170
  %175 = uitofp i32 %174 to float
  %176 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  store float %175, float addrspace(1)* %178, align 4, !tbaa !5
  br label %193

179:                                              ; preds = %7, %179
  %180 = phi i32 [ %5, %7 ], [ %191, %179 ]
  %181 = phi i32 [ 0, %7 ], [ %190, %179 ]
  %182 = phi float [ 0xC7E2CED320000000, %7 ], [ %189, %179 ]
  %183 = mul i32 %180, %2
  %184 = add i32 %183, %8
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !5, !amdgpu.noclobber !11
  %188 = fcmp contract ogt float %187, %182
  %189 = select i1 %188, float %187, float %182
  %190 = select i1 %188, i32 %180, i32 %181
  %191 = add i32 %180, 32
  %192 = icmp ult i32 %191, %3
  br i1 %192, label %179, label %9, !llvm.loop !12

193:                                              ; preds = %15, %9
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
