; ModuleID = '../data/hip_kernels/9526/55/main.cu'
source_filename = "../data/hip_kernels/9526/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11saxpy_shmemPfS_fPlE8sdata_x0 = internal addrspace(3) global [128 x float] undef, align 16
@_ZZ11saxpy_shmemPfS_fPlE8sdata_y0 = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11saxpy_shmemPfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 7
  %8 = add i32 %7, %5
  %9 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ11saxpy_shmemPfS_fPlE8sdata_x0, i32 0, i32 %5
  %10 = addrspacecast float addrspace(3)* %9 to float*
  %11 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ11saxpy_shmemPfS_fPlE8sdata_y0, i32 0, i32 %5
  %12 = addrspacecast float addrspace(3)* %11 to float*
  br label %14

13:                                               ; preds = %14
  ret void

14:                                               ; preds = %14, %4
  %15 = phi i32 [ 0, %4 ], [ %63, %14 ]
  %16 = mul nuw nsw i32 %15, 1792
  %17 = add i32 %8, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  store volatile float %20, float* %10, align 4, !tbaa !5
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  store volatile float %22, float* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = load volatile float, float* %10, align 4, !tbaa !5
  %24 = fmul contract float %23, %2
  %25 = load volatile float, float* %12, align 4, !tbaa !5
  %26 = fadd contract float %24, %25
  store float %26, float addrspace(1)* %21, align 4, !tbaa !5
  %27 = mul nuw i32 %15, 1792
  %28 = add nuw i32 %27, 1792
  %29 = add i32 %8, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5
  store volatile float %32, float* %10, align 4, !tbaa !5
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  store volatile float %34, float* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = load volatile float, float* %10, align 4, !tbaa !5
  %36 = fmul contract float %35, %2
  %37 = load volatile float, float* %12, align 4, !tbaa !5
  %38 = fadd contract float %36, %37
  store float %38, float addrspace(1)* %33, align 4, !tbaa !5
  %39 = mul nuw i32 %15, 1792
  %40 = add nuw i32 %39, 3584
  %41 = add i32 %8, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5
  store volatile float %44, float* %10, align 4, !tbaa !5
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  store volatile float %46, float* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = load volatile float, float* %10, align 4, !tbaa !5
  %48 = fmul contract float %47, %2
  %49 = load volatile float, float* %12, align 4, !tbaa !5
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(1)* %45, align 4, !tbaa !5
  %51 = mul nuw i32 %15, 1792
  %52 = add nuw i32 %51, 5376
  %53 = add i32 %8, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  store volatile float %56, float* %10, align 4, !tbaa !5
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  store volatile float %58, float* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = load volatile float, float* %10, align 4, !tbaa !5
  %60 = fmul contract float %59, %2
  %61 = load volatile float, float* %12, align 4, !tbaa !5
  %62 = fadd contract float %60, %61
  store float %62, float addrspace(1)* %57, align 4, !tbaa !5
  %63 = add nuw nsw i32 %15, 4
  %64 = icmp eq i32 %63, 2048
  br i1 %64, label %13, label %14, !llvm.loop !9
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
