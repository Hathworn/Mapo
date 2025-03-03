; ModuleID = '../data/hip_kernels/176/49/main.cu'
source_filename = "../data/hip_kernels/176/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14kArgMinRowwisePfS_jjE8min_vals = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@_ZZ14kArgMinRowwisePfS_jjE8min_args = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14kArgMinRowwisePfS_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp ult i32 %5, %2
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %2
  br label %180

10:                                               ; preds = %180, %4
  %11 = phi float [ 0x47E2CED320000000, %4 ], [ %189, %180 ]
  %12 = phi i32 [ 0, %4 ], [ %190, %180 ]
  %13 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 %5
  store float %11, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 %5
  store i32 %12, i32 addrspace(3)* %14, align 4, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = icmp eq i32 %5, 0
  br i1 %15, label %16, label %193

16:                                               ; preds = %10
  %17 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 0), align 16, !tbaa !5
  %18 = fcmp contract olt float %17, 0x47E2CED320000000
  %19 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 0), align 16
  %20 = select i1 %18, float %17, float 0x47E2CED320000000
  %21 = select i1 %18, i32 %19, i32 0
  %22 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 1), align 4, !tbaa !5
  %23 = fcmp contract olt float %22, %20
  %24 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 1), align 4
  %25 = select i1 %23, float %22, float %20
  %26 = select i1 %23, i32 %24, i32 %21
  %27 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 2), align 8, !tbaa !5
  %28 = fcmp contract olt float %27, %25
  %29 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 2), align 8
  %30 = select i1 %28, float %27, float %25
  %31 = select i1 %28, i32 %29, i32 %26
  %32 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 3), align 4, !tbaa !5
  %33 = fcmp contract olt float %32, %30
  %34 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 3), align 4
  %35 = select i1 %33, float %32, float %30
  %36 = select i1 %33, i32 %34, i32 %31
  %37 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 4), align 16, !tbaa !5
  %38 = fcmp contract olt float %37, %35
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 4), align 16
  %40 = select i1 %38, float %37, float %35
  %41 = select i1 %38, i32 %39, i32 %36
  %42 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 5), align 4, !tbaa !5
  %43 = fcmp contract olt float %42, %40
  %44 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 5), align 4
  %45 = select i1 %43, float %42, float %40
  %46 = select i1 %43, i32 %44, i32 %41
  %47 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 6), align 8, !tbaa !5
  %48 = fcmp contract olt float %47, %45
  %49 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 6), align 8
  %50 = select i1 %48, float %47, float %45
  %51 = select i1 %48, i32 %49, i32 %46
  %52 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 7), align 4, !tbaa !5
  %53 = fcmp contract olt float %52, %50
  %54 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 7), align 4
  %55 = select i1 %53, float %52, float %50
  %56 = select i1 %53, i32 %54, i32 %51
  %57 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 8), align 16, !tbaa !5
  %58 = fcmp contract olt float %57, %55
  %59 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 8), align 16
  %60 = select i1 %58, float %57, float %55
  %61 = select i1 %58, i32 %59, i32 %56
  %62 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 9), align 4, !tbaa !5
  %63 = fcmp contract olt float %62, %60
  %64 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 9), align 4
  %65 = select i1 %63, float %62, float %60
  %66 = select i1 %63, i32 %64, i32 %61
  %67 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 10), align 8, !tbaa !5
  %68 = fcmp contract olt float %67, %65
  %69 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 10), align 8
  %70 = select i1 %68, float %67, float %65
  %71 = select i1 %68, i32 %69, i32 %66
  %72 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 11), align 4, !tbaa !5
  %73 = fcmp contract olt float %72, %70
  %74 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 11), align 4
  %75 = select i1 %73, float %72, float %70
  %76 = select i1 %73, i32 %74, i32 %71
  %77 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 12), align 16, !tbaa !5
  %78 = fcmp contract olt float %77, %75
  %79 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 12), align 16
  %80 = select i1 %78, float %77, float %75
  %81 = select i1 %78, i32 %79, i32 %76
  %82 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 13), align 4, !tbaa !5
  %83 = fcmp contract olt float %82, %80
  %84 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 13), align 4
  %85 = select i1 %83, float %82, float %80
  %86 = select i1 %83, i32 %84, i32 %81
  %87 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 14), align 8, !tbaa !5
  %88 = fcmp contract olt float %87, %85
  %89 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 14), align 8
  %90 = select i1 %88, float %87, float %85
  %91 = select i1 %88, i32 %89, i32 %86
  %92 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 15), align 4, !tbaa !5
  %93 = fcmp contract olt float %92, %90
  %94 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 15), align 4
  %95 = select i1 %93, float %92, float %90
  %96 = select i1 %93, i32 %94, i32 %91
  %97 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 16), align 16, !tbaa !5
  %98 = fcmp contract olt float %97, %95
  %99 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 16), align 16
  %100 = select i1 %98, float %97, float %95
  %101 = select i1 %98, i32 %99, i32 %96
  %102 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 17), align 4, !tbaa !5
  %103 = fcmp contract olt float %102, %100
  %104 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 17), align 4
  %105 = select i1 %103, float %102, float %100
  %106 = select i1 %103, i32 %104, i32 %101
  %107 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 18), align 8, !tbaa !5
  %108 = fcmp contract olt float %107, %105
  %109 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 18), align 8
  %110 = select i1 %108, float %107, float %105
  %111 = select i1 %108, i32 %109, i32 %106
  %112 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 19), align 4, !tbaa !5
  %113 = fcmp contract olt float %112, %110
  %114 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 19), align 4
  %115 = select i1 %113, float %112, float %110
  %116 = select i1 %113, i32 %114, i32 %111
  %117 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 20), align 16, !tbaa !5
  %118 = fcmp contract olt float %117, %115
  %119 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 20), align 16
  %120 = select i1 %118, float %117, float %115
  %121 = select i1 %118, i32 %119, i32 %116
  %122 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 21), align 4, !tbaa !5
  %123 = fcmp contract olt float %122, %120
  %124 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 21), align 4
  %125 = select i1 %123, float %122, float %120
  %126 = select i1 %123, i32 %124, i32 %121
  %127 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 22), align 8, !tbaa !5
  %128 = fcmp contract olt float %127, %125
  %129 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 22), align 8
  %130 = select i1 %128, float %127, float %125
  %131 = select i1 %128, i32 %129, i32 %126
  %132 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 23), align 4, !tbaa !5
  %133 = fcmp contract olt float %132, %130
  %134 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 23), align 4
  %135 = select i1 %133, float %132, float %130
  %136 = select i1 %133, i32 %134, i32 %131
  %137 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 24), align 16, !tbaa !5
  %138 = fcmp contract olt float %137, %135
  %139 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 24), align 16
  %140 = select i1 %138, float %137, float %135
  %141 = select i1 %138, i32 %139, i32 %136
  %142 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 25), align 4, !tbaa !5
  %143 = fcmp contract olt float %142, %140
  %144 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 25), align 4
  %145 = select i1 %143, float %142, float %140
  %146 = select i1 %143, i32 %144, i32 %141
  %147 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 26), align 8, !tbaa !5
  %148 = fcmp contract olt float %147, %145
  %149 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 26), align 8
  %150 = select i1 %148, float %147, float %145
  %151 = select i1 %148, i32 %149, i32 %146
  %152 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 27), align 4, !tbaa !5
  %153 = fcmp contract olt float %152, %150
  %154 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 27), align 4
  %155 = select i1 %153, float %152, float %150
  %156 = select i1 %153, i32 %154, i32 %151
  %157 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 28), align 16, !tbaa !5
  %158 = fcmp contract olt float %157, %155
  %159 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 28), align 16
  %160 = select i1 %158, float %157, float %155
  %161 = select i1 %158, i32 %159, i32 %156
  %162 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 29), align 4, !tbaa !5
  %163 = fcmp contract olt float %162, %160
  %164 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 29), align 4
  %165 = select i1 %163, float %162, float %160
  %166 = select i1 %163, i32 %164, i32 %161
  %167 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 30), align 8, !tbaa !5
  %168 = fcmp contract olt float %167, %165
  %169 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 30), align 8
  %170 = select i1 %168, float %167, float %165
  %171 = select i1 %168, i32 %169, i32 %166
  %172 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_vals, i32 0, i32 31), align 4, !tbaa !5
  %173 = fcmp contract olt float %172, %170
  %174 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ14kArgMinRowwisePfS_jjE8min_args, i32 0, i32 31), align 4
  %175 = select i1 %173, i32 %174, i32 %171
  %176 = uitofp i32 %175 to float
  %177 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %178
  store float %176, float addrspace(1)* %179, align 4, !tbaa !5
  br label %193

180:                                              ; preds = %7, %180
  %181 = phi i32 [ %5, %7 ], [ %191, %180 ]
  %182 = phi i32 [ 0, %7 ], [ %190, %180 ]
  %183 = phi float [ 0x47E2CED320000000, %7 ], [ %189, %180 ]
  %184 = add i32 %181, %9
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !5, !amdgpu.noclobber !11
  %188 = fcmp contract olt float %187, %183
  %189 = select i1 %188, float %187, float %183
  %190 = select i1 %188, i32 %181, i32 %182
  %191 = add i32 %181, 32
  %192 = icmp ult i32 %191, %2
  br i1 %192, label %180, label %10, !llvm.loop !12

193:                                              ; preds = %16, %10
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
