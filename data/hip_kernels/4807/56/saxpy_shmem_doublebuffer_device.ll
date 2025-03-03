; ModuleID = '../data/hip_kernels/4807/56/main.cu'
source_filename = "../data/hip_kernels/4807/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_x0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_y0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_x1 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_y1 = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24saxpy_shmem_doublebufferPfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = add i32 %7, %5
  %9 = add i32 %8, 1792
  %10 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_x0, i32 0, i32 %5
  %11 = addrspacecast float addrspace(3)* %10 to float*
  %12 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_y0, i32 0, i32 %5
  %13 = addrspacecast float addrspace(3)* %12 to float*
  %14 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_x1, i32 0, i32 %5
  %15 = addrspacecast float addrspace(3)* %14 to float*
  %16 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ24saxpy_shmem_doublebufferPfS_fPlE8sdata_y1, i32 0, i32 %5
  %17 = addrspacecast float addrspace(3)* %16 to float*
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = zext i32 %8 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  store volatile float %20, float* %11, align 4, !tbaa !5
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  store volatile float %22, float* %13, align 4, !tbaa !5
  %23 = zext i32 %9 to i64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5
  store volatile float %25, float* %15, align 4, !tbaa !5
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  store volatile float %27, float* %17, align 4, !tbaa !5
  %28 = load volatile float, float* %11, align 4, !tbaa !5
  %29 = fmul contract float %28, %2
  %30 = load volatile float, float* %13, align 4, !tbaa !5
  %31 = fadd contract float %29, %30
  store float %31, float addrspace(1)* %21, align 4, !tbaa !5
  br label %39

32:                                               ; preds = %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = load volatile float, float* %15, align 4, !tbaa !5
  %34 = fmul contract float %33, %2
  %35 = load volatile float, float* %17, align 4, !tbaa !5
  %36 = fadd contract float %34, %35
  %37 = zext i32 %99 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !5
  ret void

39:                                               ; preds = %39, %4
  %40 = phi i32 [ 2, %4 ], [ %109, %39 ]
  %41 = phi i32 [ %9, %4 ], [ %99, %39 ]
  %42 = phi i32 [ %8, %4 ], [ %87, %39 ]
  %43 = add i32 %42, 3584
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  store volatile float %46, float* %11, align 4, !tbaa !5
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  store volatile float %48, float* %13, align 4, !tbaa !5
  %49 = load volatile float, float* %15, align 4, !tbaa !5
  %50 = fmul contract float %49, %2
  %51 = load volatile float, float* %17, align 4, !tbaa !5
  %52 = fadd contract float %50, %51
  %53 = zext i32 %41 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %52, float addrspace(1)* %54, align 4, !tbaa !5
  %55 = add i32 %41, 3584
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  store volatile float %58, float* %15, align 4, !tbaa !5
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  store volatile float %60, float* %17, align 4, !tbaa !5
  %61 = load volatile float, float* %11, align 4, !tbaa !5
  %62 = fmul contract float %61, %2
  %63 = load volatile float, float* %13, align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  store float %64, float addrspace(1)* %47, align 4, !tbaa !5
  %65 = add i32 %42, 7168
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5
  store volatile float %68, float* %11, align 4, !tbaa !5
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  store volatile float %70, float* %13, align 4, !tbaa !5
  %71 = load volatile float, float* %15, align 4, !tbaa !5
  %72 = fmul contract float %71, %2
  %73 = load volatile float, float* %17, align 4, !tbaa !5
  %74 = fadd contract float %72, %73
  %75 = zext i32 %55 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %74, float addrspace(1)* %76, align 4, !tbaa !5
  %77 = add i32 %41, 7168
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  store volatile float %80, float* %15, align 4, !tbaa !5
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  store volatile float %82, float* %17, align 4, !tbaa !5
  %83 = load volatile float, float* %11, align 4, !tbaa !5
  %84 = fmul contract float %83, %2
  %85 = load volatile float, float* %13, align 4, !tbaa !5
  %86 = fadd contract float %84, %85
  store float %86, float addrspace(1)* %69, align 4, !tbaa !5
  %87 = add i32 %42, 10752
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  store volatile float %90, float* %11, align 4, !tbaa !5
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  store volatile float %92, float* %13, align 4, !tbaa !5
  %93 = load volatile float, float* %15, align 4, !tbaa !5
  %94 = fmul contract float %93, %2
  %95 = load volatile float, float* %17, align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  %97 = zext i32 %77 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  store float %96, float addrspace(1)* %98, align 4, !tbaa !5
  %99 = add i32 %41, 10752
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  store volatile float %102, float* %15, align 4, !tbaa !5
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5
  store volatile float %104, float* %17, align 4, !tbaa !5
  %105 = load volatile float, float* %11, align 4, !tbaa !5
  %106 = fmul contract float %105, %2
  %107 = load volatile float, float* %13, align 4, !tbaa !5
  %108 = fadd contract float %106, %107
  store float %108, float addrspace(1)* %91, align 4, !tbaa !5
  %109 = add nuw nsw i32 %40, 6
  %110 = icmp ult i32 %40, 2042
  br i1 %110, label %39, label %32, !llvm.loop !9
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
