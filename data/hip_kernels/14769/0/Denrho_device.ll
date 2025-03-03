; ModuleID = '../data/hip_kernels/14769/0/main.cu'
source_filename = "../data/hip_kernels/14769/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6DenrhoPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul i32 %7, 24
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = mul i32 %9, 24
  %11 = add nsw i32 %8, %5
  %12 = add nsw i32 %10, %6
  %13 = mul nsw i32 %11, %3
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float 0.000000e+00, float addrspace(1)* %16, align 4, !tbaa !5
  %17 = mul i32 %14, 9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  %21 = fadd contract float %20, 0.000000e+00
  store float %21, float addrspace(1)* %16, align 4, !tbaa !5
  %22 = add nsw i32 %17, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5
  %26 = fadd contract float %25, %21
  store float %26, float addrspace(1)* %16, align 4, !tbaa !5
  %27 = add nsw i32 %17, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5
  %31 = fadd contract float %30, %26
  store float %31, float addrspace(1)* %16, align 4, !tbaa !5
  %32 = add nsw i32 %17, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5
  %36 = fadd contract float %35, %31
  store float %36, float addrspace(1)* %16, align 4, !tbaa !5
  %37 = add nsw i32 %17, 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fadd contract float %40, %36
  store float %41, float addrspace(1)* %16, align 4, !tbaa !5
  %42 = add nsw i32 %17, 5
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = fadd contract float %45, %41
  store float %46, float addrspace(1)* %16, align 4, !tbaa !5
  %47 = add nsw i32 %17, 6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5
  %51 = fadd contract float %50, %46
  store float %51, float addrspace(1)* %16, align 4, !tbaa !5
  %52 = add nsw i32 %17, 7
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5
  %56 = fadd contract float %55, %51
  store float %56, float addrspace(1)* %16, align 4, !tbaa !5
  %57 = add nsw i32 %17, 8
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = fadd contract float %60, %56
  store float %61, float addrspace(1)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
