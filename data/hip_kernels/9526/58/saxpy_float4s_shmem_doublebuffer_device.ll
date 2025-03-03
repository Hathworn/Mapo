; ModuleID = '../data/hip_kernels/9526/58/main.cu'
source_filename = "../data/hip_kernels/9526/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x0_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x1_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x2_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x3_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y0_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y1_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y2_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y3_0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x0_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x1_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x2_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x3_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y0_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y1_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y2_1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y3_1 = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z32saxpy_float4s_shmem_doublebufferPfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = add i32 %7, %5
  %9 = add i32 %8, 1792
  %10 = bitcast float addrspace(1)* %1 to %struct.HIP_vector_type addrspace(1)*
  %11 = bitcast float addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %12 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x0_0, i32 0, i32 %5
  %13 = addrspacecast float addrspace(3)* %12 to float*
  %14 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x0_1, i32 0, i32 %5
  %15 = addrspacecast float addrspace(3)* %14 to float*
  %16 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y0_1, i32 0, i32 %5
  %17 = addrspacecast float addrspace(3)* %16 to float*
  %18 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x1_1, i32 0, i32 %5
  %19 = addrspacecast float addrspace(3)* %18 to float*
  %20 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y1_1, i32 0, i32 %5
  %21 = addrspacecast float addrspace(3)* %20 to float*
  %22 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x2_1, i32 0, i32 %5
  %23 = addrspacecast float addrspace(3)* %22 to float*
  %24 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y2_1, i32 0, i32 %5
  %25 = addrspacecast float addrspace(3)* %24 to float*
  %26 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x3_1, i32 0, i32 %5
  %27 = addrspacecast float addrspace(3)* %26 to float*
  %28 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y3_1, i32 0, i32 %5
  %29 = addrspacecast float addrspace(3)* %28 to float*
  %30 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x1_0, i32 0, i32 %5
  %31 = addrspacecast float addrspace(3)* %30 to float*
  %32 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x2_0, i32 0, i32 %5
  %33 = addrspacecast float addrspace(3)* %32 to float*
  %34 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_x3_0, i32 0, i32 %5
  %35 = addrspacecast float addrspace(3)* %34 to float*
  %36 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y0_0, i32 0, i32 %5
  %37 = addrspacecast float addrspace(3)* %36 to float*
  %38 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y1_0, i32 0, i32 %5
  %39 = addrspacecast float addrspace(3)* %38 to float*
  %40 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y2_0, i32 0, i32 %5
  %41 = addrspacecast float addrspace(3)* %40 to float*
  %42 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ32saxpy_float4s_shmem_doublebufferPfS_fPlE10sdata_y3_0, i32 0, i32 %5
  %43 = addrspacecast float addrspace(3)* %42 to float*
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = zext i32 %8 to i64
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 0
  %46 = load float, float addrspace(1)* %45, align 16
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 1
  %48 = load float, float addrspace(1)* %47, align 4
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 2
  %50 = load float, float addrspace(1)* %49, align 8
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %44, i32 0, i32 0, i32 0, i64 3
  %52 = load float, float addrspace(1)* %51, align 4
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %44, i32 0, i32 0, i32 0, i64 0
  %54 = load float, float addrspace(1)* %53, align 16
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %44, i32 0, i32 0, i32 0, i64 1
  %56 = load float, float addrspace(1)* %55, align 4
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %44, i32 0, i32 0, i32 0, i64 2
  %58 = load float, float addrspace(1)* %57, align 8
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %44, i32 0, i32 0, i32 0, i64 3
  %60 = load float, float addrspace(1)* %59, align 4
  %61 = zext i32 %9 to i64
  store volatile float %46, float* %13, align 4, !tbaa !5
  store volatile float %48, float* %31, align 4, !tbaa !5
  store volatile float %50, float* %33, align 4, !tbaa !5
  store volatile float %52, float* %35, align 4, !tbaa !5
  store volatile float %54, float* %37, align 4, !tbaa !5
  store volatile float %56, float* %39, align 4, !tbaa !5
  store volatile float %58, float* %41, align 4, !tbaa !5
  store volatile float %60, float* %43, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %61, i32 0, i32 0, i32 0, i64 0
  %63 = load float, float addrspace(1)* %62, align 16
  %64 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %61, i32 0, i32 0, i32 0, i64 1
  %65 = load float, float addrspace(1)* %64, align 4
  %66 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %61, i32 0, i32 0, i32 0, i64 2
  %67 = load float, float addrspace(1)* %66, align 8
  %68 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %61, i32 0, i32 0, i32 0, i64 3
  %69 = load float, float addrspace(1)* %68, align 4
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %61, i32 0, i32 0, i32 0, i64 0
  %71 = load float, float addrspace(1)* %70, align 16
  %72 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %61, i32 0, i32 0, i32 0, i64 1
  %73 = load float, float addrspace(1)* %72, align 4
  %74 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %61, i32 0, i32 0, i32 0, i64 2
  %75 = load float, float addrspace(1)* %74, align 8
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %61, i32 0, i32 0, i32 0, i64 3
  %77 = load float, float addrspace(1)* %76, align 4
  %78 = load volatile float, float* %13, align 4, !tbaa !5
  %79 = fmul contract float %78, %2
  %80 = load volatile float, float* %37, align 4, !tbaa !5
  %81 = fadd contract float %79, %80
  %82 = load volatile float, float* %31, align 4, !tbaa !5
  %83 = fmul contract float %82, %2
  %84 = load volatile float, float* %39, align 4, !tbaa !5
  %85 = fadd contract float %83, %84
  %86 = load volatile float, float* %33, align 4, !tbaa !5
  %87 = fmul contract float %86, %2
  %88 = load volatile float, float* %41, align 4, !tbaa !5
  %89 = fadd contract float %87, %88
  %90 = load volatile float, float* %35, align 4, !tbaa !5
  %91 = fmul contract float %90, %2
  %92 = load volatile float, float* %43, align 4, !tbaa !5
  %93 = fadd contract float %91, %92
  store float %81, float addrspace(1)* %53, align 16
  store float %85, float addrspace(1)* %55, align 4
  store float %89, float addrspace(1)* %57, align 8
  store float %93, float addrspace(1)* %59, align 4
  store volatile float %63, float* %15, align 4, !tbaa !5
  store volatile float %65, float* %19, align 4, !tbaa !5
  store volatile float %67, float* %23, align 4, !tbaa !5
  store volatile float %69, float* %27, align 4, !tbaa !5
  store volatile float %71, float* %17, align 4, !tbaa !5
  store volatile float %73, float* %21, align 4, !tbaa !5
  store volatile float %75, float* %25, align 4, !tbaa !5
  store volatile float %77, float* %29, align 4, !tbaa !5
  br label %116

94:                                               ; preds = %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = load volatile float, float* %15, align 4, !tbaa !5
  %96 = fmul contract float %95, %2
  %97 = load volatile float, float* %17, align 4, !tbaa !5
  %98 = fadd contract float %96, %97
  %99 = load volatile float, float* %19, align 4, !tbaa !5
  %100 = fmul contract float %99, %2
  %101 = load volatile float, float* %21, align 4, !tbaa !5
  %102 = fadd contract float %100, %101
  %103 = load volatile float, float* %23, align 4, !tbaa !5
  %104 = fmul contract float %103, %2
  %105 = load volatile float, float* %25, align 4, !tbaa !5
  %106 = fadd contract float %104, %105
  %107 = load volatile float, float* %27, align 4, !tbaa !5
  %108 = fmul contract float %107, %2
  %109 = load volatile float, float* %29, align 4, !tbaa !5
  %110 = fadd contract float %108, %109
  %111 = zext i32 %159 to i64
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %111, i32 0, i32 0, i32 0, i64 0
  store float %98, float addrspace(1)* %112, align 16
  %113 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %111, i32 0, i32 0, i32 0, i64 1
  store float %102, float addrspace(1)* %113, align 4
  %114 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %111, i32 0, i32 0, i32 0, i64 2
  store float %106, float addrspace(1)* %114, align 8
  %115 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %111, i32 0, i32 0, i32 0, i64 3
  store float %110, float addrspace(1)* %115, align 4
  ret void

116:                                              ; preds = %4, %116
  %117 = phi i32 [ 2, %4 ], [ %193, %116 ]
  %118 = phi i32 [ %8, %4 ], [ %120, %116 ]
  %119 = phi i32 [ %9, %4 ], [ %159, %116 ]
  %120 = add i32 %118, 3584
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %121, i32 0, i32 0, i32 0, i64 0
  %123 = load float, float addrspace(1)* %122, align 16
  %124 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %121, i32 0, i32 0, i32 0, i64 1
  %125 = load float, float addrspace(1)* %124, align 4
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %121, i32 0, i32 0, i32 0, i64 2
  %127 = load float, float addrspace(1)* %126, align 8
  %128 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %121, i32 0, i32 0, i32 0, i64 3
  %129 = load float, float addrspace(1)* %128, align 4
  %130 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 0
  %131 = load float, float addrspace(1)* %130, align 16
  %132 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 1
  %133 = load float, float addrspace(1)* %132, align 4
  %134 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 2
  %135 = load float, float addrspace(1)* %134, align 8
  %136 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %121, i32 0, i32 0, i32 0, i64 3
  %137 = load float, float addrspace(1)* %136, align 4
  %138 = load volatile float, float* %15, align 4, !tbaa !5
  %139 = fmul contract float %138, %2
  %140 = load volatile float, float* %17, align 4, !tbaa !5
  %141 = fadd contract float %139, %140
  %142 = load volatile float, float* %19, align 4, !tbaa !5
  %143 = fmul contract float %142, %2
  %144 = load volatile float, float* %21, align 4, !tbaa !5
  %145 = fadd contract float %143, %144
  %146 = load volatile float, float* %23, align 4, !tbaa !5
  %147 = fmul contract float %146, %2
  %148 = load volatile float, float* %25, align 4, !tbaa !5
  %149 = fadd contract float %147, %148
  %150 = load volatile float, float* %27, align 4, !tbaa !5
  %151 = fmul contract float %150, %2
  %152 = load volatile float, float* %29, align 4, !tbaa !5
  %153 = fadd contract float %151, %152
  %154 = zext i32 %119 to i64
  %155 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %154, i32 0, i32 0, i32 0, i64 0
  store float %141, float addrspace(1)* %155, align 16
  %156 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %154, i32 0, i32 0, i32 0, i64 1
  store float %145, float addrspace(1)* %156, align 4
  %157 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %154, i32 0, i32 0, i32 0, i64 2
  store float %149, float addrspace(1)* %157, align 8
  %158 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %154, i32 0, i32 0, i32 0, i64 3
  store float %153, float addrspace(1)* %158, align 4
  %159 = add i32 %119, 3584
  store volatile float %123, float* %13, align 4, !tbaa !5
  store volatile float %125, float* %31, align 4, !tbaa !5
  store volatile float %127, float* %33, align 4, !tbaa !5
  store volatile float %129, float* %35, align 4, !tbaa !5
  store volatile float %131, float* %37, align 4, !tbaa !5
  store volatile float %133, float* %39, align 4, !tbaa !5
  store volatile float %135, float* %41, align 4, !tbaa !5
  store volatile float %137, float* %43, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %160, i32 0, i32 0, i32 0, i64 0
  %162 = load float, float addrspace(1)* %161, align 16
  %163 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %160, i32 0, i32 0, i32 0, i64 1
  %164 = load float, float addrspace(1)* %163, align 4
  %165 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %160, i32 0, i32 0, i32 0, i64 2
  %166 = load float, float addrspace(1)* %165, align 8
  %167 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %160, i32 0, i32 0, i32 0, i64 3
  %168 = load float, float addrspace(1)* %167, align 4
  %169 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %160, i32 0, i32 0, i32 0, i64 0
  %170 = load float, float addrspace(1)* %169, align 16
  %171 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %160, i32 0, i32 0, i32 0, i64 1
  %172 = load float, float addrspace(1)* %171, align 4
  %173 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %160, i32 0, i32 0, i32 0, i64 2
  %174 = load float, float addrspace(1)* %173, align 8
  %175 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %11, i64 %160, i32 0, i32 0, i32 0, i64 3
  %176 = load float, float addrspace(1)* %175, align 4
  %177 = load volatile float, float* %13, align 4, !tbaa !5
  %178 = fmul contract float %177, %2
  %179 = load volatile float, float* %37, align 4, !tbaa !5
  %180 = fadd contract float %178, %179
  %181 = load volatile float, float* %31, align 4, !tbaa !5
  %182 = fmul contract float %181, %2
  %183 = load volatile float, float* %39, align 4, !tbaa !5
  %184 = fadd contract float %182, %183
  %185 = load volatile float, float* %33, align 4, !tbaa !5
  %186 = fmul contract float %185, %2
  %187 = load volatile float, float* %41, align 4, !tbaa !5
  %188 = fadd contract float %186, %187
  %189 = load volatile float, float* %35, align 4, !tbaa !5
  %190 = fmul contract float %189, %2
  %191 = load volatile float, float* %43, align 4, !tbaa !5
  %192 = fadd contract float %190, %191
  store float %180, float addrspace(1)* %130, align 16
  store float %184, float addrspace(1)* %132, align 4
  store float %188, float addrspace(1)* %134, align 8
  store float %192, float addrspace(1)* %136, align 4
  store volatile float %162, float* %15, align 4, !tbaa !5
  store volatile float %164, float* %19, align 4, !tbaa !5
  store volatile float %166, float* %23, align 4, !tbaa !5
  store volatile float %168, float* %27, align 4, !tbaa !5
  store volatile float %170, float* %17, align 4, !tbaa !5
  store volatile float %172, float* %21, align 4, !tbaa !5
  store volatile float %174, float* %25, align 4, !tbaa !5
  store volatile float %176, float* %29, align 4, !tbaa !5
  %193 = add nuw nsw i32 %117, 2
  %194 = icmp ult i32 %117, 510
  br i1 %194, label %116, label %94, !llvm.loop !9
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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.peeled.count", i32 1}
