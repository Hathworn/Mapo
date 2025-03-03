; ModuleID = '../data/hip_kernels/528/2/main.cu'
source_filename = "../data/hip_kernels/528/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6kernelPbiS_PiS_S_S0_S0_(i8 addrspace(1)* nocapture readonly %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = add i32 %9, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !4, !amdgpu.noclobber !8
  %14 = mul nsw i32 %13, %1
  %15 = sext i32 %14 to i64
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %17 = mul nsw i32 %16, %1
  %18 = sext i32 %17 to i64
  %19 = zext i32 %16 to i64
  %20 = add nsw i64 %15, %19
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !10, !range !12, !amdgpu.noclobber !8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %39, label %24

24:                                               ; preds = %8
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %20
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %20
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !4, !amdgpu.noclobber !8
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %30, label %39

30:                                               ; preds = %24
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !10, !range !12, !amdgpu.noclobber !8
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %30
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %19
  store i8 1, i8 addrspace(1)* %35, align 1, !tbaa !10
  %36 = sext i32 %13 to i64
  %37 = add nsw i64 %36, %18
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %37
  store i8 1, i8 addrspace(1)* %38, align 1, !tbaa !10
  br label %39

39:                                               ; preds = %34, %30, %24, %8
  %40 = sext i32 %13 to i64
  %41 = add nsw i64 %40, %18
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !10, !range !12
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %56, label %45

45:                                               ; preds = %39
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %41
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !4, !amdgpu.noclobber !8
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %56

49:                                               ; preds = %45
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !10, !range !12
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %53, label %56

53:                                               ; preds = %49
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %19
  store i8 1, i8 addrspace(1)* %54, align 1, !tbaa !10
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %41
  store i8 1, i8 addrspace(1)* %55, align 1, !tbaa !10
  br label %56

56:                                               ; preds = %53, %49, %45, %39
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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"bool", !6, i64 0}
!12 = !{i8 0, i8 2}
