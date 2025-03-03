; ModuleID = '../data/hip_kernels/14295/5/main.cu'
source_filename = "../data/hip_kernels/14295/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7scatterPjS_S_S_S_S_S_S_m(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readnone %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl nsw i32 %11, 2
  %13 = add nsw i32 %12, %10
  %14 = add i64 %8, -1
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %14
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = add i32 %18, %16
  %20 = sext i32 %13 to i64
  %21 = icmp ult i64 %20, %8
  br i1 %21, label %22, label %44

22:                                               ; preds = %9
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %20
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %22
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %20
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %33

29:                                               ; preds = %22
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %20
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = add i32 %19, %31
  br label %33

33:                                               ; preds = %29, %26
  %34 = phi i32 [ %28, %26 ], [ %32, %29 ]
  %35 = sext i32 %34 to i64
  %36 = icmp ult i64 %35, %8
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !5
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %35
  store i32 %42, i32 addrspace(1)* %43, align 4, !tbaa !5
  br label %44

44:                                               ; preds = %33, %37, %9
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
