; ModuleID = '../data/hip_kernels/9526/65/main.cu'
source_filename = "../data/hip_kernels/9526/65/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x2 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x3 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y2 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y3 = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19saxpy_float4s_shmemPfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = add i32 %7, %5
  %9 = bitcast float addrspace(1)* %1 to %struct.HIP_vector_type addrspace(1)*
  %10 = bitcast float addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %11 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x0, i32 0, i32 %5
  %12 = addrspacecast float addrspace(3)* %11 to float*
  %13 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x1, i32 0, i32 %5
  %14 = addrspacecast float addrspace(3)* %13 to float*
  %15 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x2, i32 0, i32 %5
  %16 = addrspacecast float addrspace(3)* %15 to float*
  %17 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_x3, i32 0, i32 %5
  %18 = addrspacecast float addrspace(3)* %17 to float*
  %19 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y0, i32 0, i32 %5
  %20 = addrspacecast float addrspace(3)* %19 to float*
  %21 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y1, i32 0, i32 %5
  %22 = addrspacecast float addrspace(3)* %21 to float*
  %23 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y2, i32 0, i32 %5
  %24 = addrspacecast float addrspace(3)* %23 to float*
  %25 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ19saxpy_float4s_shmemPfS_fPlE8sdata_y3, i32 0, i32 %5
  %26 = addrspacecast float addrspace(3)* %25 to float*
  br label %28

27:                                               ; preds = %28
  ret void

28:                                               ; preds = %28, %4
  %29 = phi i32 [ 0, %4 ], [ %101, %28 ]
  %30 = mul nuw nsw i32 %29, 1792
  %31 = add i32 %8, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %32, i32 0, i32 0, i32 0, i64 0
  %34 = load float, float addrspace(1)* %33, align 16
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %32, i32 0, i32 0, i32 0, i64 1
  %36 = load float, float addrspace(1)* %35, align 4
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %32, i32 0, i32 0, i32 0, i64 2
  %38 = load float, float addrspace(1)* %37, align 8
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %32, i32 0, i32 0, i32 0, i64 3
  %40 = load float, float addrspace(1)* %39, align 4
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 0
  %42 = load float, float addrspace(1)* %41, align 16
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 1
  %44 = load float, float addrspace(1)* %43, align 4
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 2
  %46 = load float, float addrspace(1)* %45, align 8
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %32, i32 0, i32 0, i32 0, i64 3
  %48 = load float, float addrspace(1)* %47, align 4
  store volatile float %34, float* %12, align 4, !tbaa !5
  store volatile float %36, float* %14, align 4, !tbaa !5
  store volatile float %38, float* %16, align 4, !tbaa !5
  store volatile float %40, float* %18, align 4, !tbaa !5
  store volatile float %42, float* %20, align 4, !tbaa !5
  store volatile float %44, float* %22, align 4, !tbaa !5
  store volatile float %46, float* %24, align 4, !tbaa !5
  store volatile float %48, float* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = load volatile float, float* %12, align 4, !tbaa !5
  %50 = fmul contract float %49, %2
  %51 = load volatile float, float* %20, align 4, !tbaa !5
  %52 = fadd contract float %50, %51
  %53 = load volatile float, float* %14, align 4, !tbaa !5
  %54 = fmul contract float %53, %2
  %55 = load volatile float, float* %22, align 4, !tbaa !5
  %56 = fadd contract float %54, %55
  %57 = load volatile float, float* %16, align 4, !tbaa !5
  %58 = fmul contract float %57, %2
  %59 = load volatile float, float* %24, align 4, !tbaa !5
  %60 = fadd contract float %58, %59
  %61 = load volatile float, float* %18, align 4, !tbaa !5
  %62 = fmul contract float %61, %2
  %63 = load volatile float, float* %26, align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  store float %52, float addrspace(1)* %41, align 16
  store float %56, float addrspace(1)* %43, align 4
  store float %60, float addrspace(1)* %45, align 8
  store float %64, float addrspace(1)* %47, align 4
  %65 = mul nuw i32 %29, 1792
  %66 = add nuw i32 %65, 1792
  %67 = add i32 %8, %66
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %68, i32 0, i32 0, i32 0, i64 0
  %70 = load float, float addrspace(1)* %69, align 16
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %68, i32 0, i32 0, i32 0, i64 1
  %72 = load float, float addrspace(1)* %71, align 4
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %68, i32 0, i32 0, i32 0, i64 2
  %74 = load float, float addrspace(1)* %73, align 8
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %68, i32 0, i32 0, i32 0, i64 3
  %76 = load float, float addrspace(1)* %75, align 4
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %68, i32 0, i32 0, i32 0, i64 0
  %78 = load float, float addrspace(1)* %77, align 16
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %68, i32 0, i32 0, i32 0, i64 1
  %80 = load float, float addrspace(1)* %79, align 4
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %68, i32 0, i32 0, i32 0, i64 2
  %82 = load float, float addrspace(1)* %81, align 8
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %68, i32 0, i32 0, i32 0, i64 3
  %84 = load float, float addrspace(1)* %83, align 4
  store volatile float %70, float* %12, align 4, !tbaa !5
  store volatile float %72, float* %14, align 4, !tbaa !5
  store volatile float %74, float* %16, align 4, !tbaa !5
  store volatile float %76, float* %18, align 4, !tbaa !5
  store volatile float %78, float* %20, align 4, !tbaa !5
  store volatile float %80, float* %22, align 4, !tbaa !5
  store volatile float %82, float* %24, align 4, !tbaa !5
  store volatile float %84, float* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = load volatile float, float* %12, align 4, !tbaa !5
  %86 = fmul contract float %85, %2
  %87 = load volatile float, float* %20, align 4, !tbaa !5
  %88 = fadd contract float %86, %87
  %89 = load volatile float, float* %14, align 4, !tbaa !5
  %90 = fmul contract float %89, %2
  %91 = load volatile float, float* %22, align 4, !tbaa !5
  %92 = fadd contract float %90, %91
  %93 = load volatile float, float* %16, align 4, !tbaa !5
  %94 = fmul contract float %93, %2
  %95 = load volatile float, float* %24, align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  %97 = load volatile float, float* %18, align 4, !tbaa !5
  %98 = fmul contract float %97, %2
  %99 = load volatile float, float* %26, align 4, !tbaa !5
  %100 = fadd contract float %98, %99
  store float %88, float addrspace(1)* %77, align 16
  store float %92, float addrspace(1)* %79, align 4
  store float %96, float addrspace(1)* %81, align 8
  store float %100, float addrspace(1)* %83, align 4
  %101 = add nuw nsw i32 %29, 2
  %102 = icmp eq i32 %101, 512
  br i1 %102, label %27, label %28, !llvm.loop !9
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
