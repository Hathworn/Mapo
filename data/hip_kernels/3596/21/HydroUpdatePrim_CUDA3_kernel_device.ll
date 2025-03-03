; ModuleID = '../data/hip_kernels/3596/21/main.cu'
source_filename = "../data/hip_kernels/3596/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28HydroUpdatePrim_CUDA3_kernelPfS_S_S_S_S_S_S_S_S_fi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float %10, i32 %11) local_unnamed_addr #0 {
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
  br i1 %23, label %59, label %24

24:                                               ; preds = %12
  %25 = zext i32 %19 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fmul contract float %27, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fmul contract float %27, %32
  %34 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fmul contract float %27, %35
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %25
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fmul contract float %27, %38
  %40 = getelementptr inbounds float, float addrspace(1)* %5, i64 %25
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = fadd contract float %27, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %6, i64 %25
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = fadd contract float %30, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %7, i64 %25
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = fadd contract float %33, %47
  %49 = getelementptr inbounds float, float addrspace(1)* %8, i64 %25
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = fadd contract float %36, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %9, i64 %25
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = fadd contract float %39, %53
  store float %42, float addrspace(1)* %26, align 4, !tbaa !5
  %55 = fdiv contract float %45, %42
  store float %55, float addrspace(1)* %28, align 4, !tbaa !5
  %56 = fdiv contract float %48, %42
  store float %56, float addrspace(1)* %31, align 4, !tbaa !5
  %57 = fdiv contract float %51, %42
  store float %57, float addrspace(1)* %34, align 4, !tbaa !5
  %58 = fdiv contract float %54, %42
  store float %58, float addrspace(1)* %37, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %12, %24
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
