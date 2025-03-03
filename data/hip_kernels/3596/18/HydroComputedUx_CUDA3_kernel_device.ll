; ModuleID = '../data/hip_kernels/3596/18/main.cu'
source_filename = "../data/hip_kernels/3596/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28HydroComputedUx_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_fi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %14, 6
  %17 = add i32 %16, %13
  %18 = mul i32 %15, 40960
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, 2
  %21 = add nsw i32 %11, -3
  %22 = icmp sgt i32 %19, %21
  %23 = select i1 %20, i1 true, i1 %22
  br i1 %23, label %63, label %24

24:                                               ; preds = %12
  %25 = add nuw nsw i32 %19, 1
  %26 = zext i32 %19 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = zext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fsub contract float %28, %31
  %33 = fmul contract float %32, %10
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %26
  store float %33, float addrspace(1)* %34, align 4, !tbaa !5
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5
  %39 = fsub contract float %36, %38
  %40 = fmul contract float %39, %10
  %41 = getelementptr inbounds float, float addrspace(1)* %6, i64 %26
  store float %40, float addrspace(1)* %41, align 4, !tbaa !5
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = fsub contract float %43, %45
  %47 = fmul contract float %46, %10
  %48 = getelementptr inbounds float, float addrspace(1)* %7, i64 %26
  store float %47, float addrspace(1)* %48, align 4, !tbaa !5
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = fsub contract float %50, %52
  %54 = fmul contract float %53, %10
  %55 = getelementptr inbounds float, float addrspace(1)* %8, i64 %26
  store float %54, float addrspace(1)* %55, align 4, !tbaa !5
  %56 = getelementptr inbounds float, float addrspace(1)* %4, i64 %26
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fsub contract float %57, %59
  %61 = fmul contract float %60, %10
  %62 = getelementptr inbounds float, float addrspace(1)* %9, i64 %26
  store float %61, float addrspace(1)* %62, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %12, %24
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
