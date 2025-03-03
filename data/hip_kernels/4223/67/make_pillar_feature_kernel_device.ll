; ModuleID = '../data/hip_kernels/4223/67/main.cu'
source_filename = "../data/hip_kernels/4223/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26make_pillar_feature_kernelPfS_S_S_S_S_S_S_PiS0_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %10, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi float %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %20 = icmp slt i32 %19, %18
  br i1 %20, label %21, label %46

21:                                               ; preds = %13
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %15
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !10, !amdgpu.noclobber !8
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %15
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !10, !amdgpu.noclobber !8
  %26 = mul nsw i32 %14, %11
  %27 = add nsw i32 %26, %19
  %28 = mul nsw i32 %25, %12
  %29 = add i32 %28, %23
  %30 = mul i32 %29, %11
  %31 = add nsw i32 %30, %19
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = sext i32 %27 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  store float %34, float addrspace(1)* %36, align 4, !tbaa !4
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4
  %39 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  store float %38, float addrspace(1)* %39, align 4, !tbaa !4
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !4
  %42 = getelementptr inbounds float, float addrspace(1)* %6, i64 %35
  store float %41, float addrspace(1)* %42, align 4, !tbaa !4
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !4
  %45 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  store float %44, float addrspace(1)* %45, align 4, !tbaa !4
  br label %46

46:                                               ; preds = %13, %21
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
