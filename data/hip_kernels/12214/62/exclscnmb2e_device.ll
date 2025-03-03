; ModuleID = '../data/hip_kernels/12214/62/main.cu'
source_filename = "../data/hip_kernels/12214/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11exclscnmb2ePiS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture writeonly %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture writeonly %11, i32 addrspace(1)* nocapture readonly %12, i32 addrspace(1)* nocapture writeonly %13, i32 addrspace(1)* nocapture readonly %14, i32 addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  switch i32 %18, label %42 [
    i32 0, label %19
    i32 1, label %21
    i32 2, label %23
    i32 3, label %25
    i32 4, label %27
    i32 5, label %29
    i32 6, label %31
    i32 7, label %33
  ]

19:                                               ; preds = %16
  %20 = icmp ult i32 %17, 2
  br i1 %20, label %35, label %42

21:                                               ; preds = %16
  %22 = icmp ult i32 %17, 2
  br i1 %22, label %35, label %42

23:                                               ; preds = %16
  %24 = icmp ult i32 %17, 2
  br i1 %24, label %35, label %42

25:                                               ; preds = %16
  %26 = icmp ult i32 %17, 2
  br i1 %26, label %35, label %42

27:                                               ; preds = %16
  %28 = icmp ult i32 %17, 2
  br i1 %28, label %35, label %42

29:                                               ; preds = %16
  %30 = icmp ult i32 %17, 2
  br i1 %30, label %35, label %42

31:                                               ; preds = %16
  %32 = icmp ult i32 %17, 2
  br i1 %32, label %35, label %42

33:                                               ; preds = %16
  %34 = icmp ult i32 %17, 2
  br i1 %34, label %35, label %42

35:                                               ; preds = %33, %31, %29, %27, %25, %23, %21, %19
  %36 = phi i32 addrspace(1)* [ %0, %19 ], [ %2, %21 ], [ %4, %23 ], [ %6, %25 ], [ %8, %27 ], [ %10, %29 ], [ %12, %31 ], [ %14, %33 ]
  %37 = phi i32 addrspace(1)* [ %1, %19 ], [ %3, %21 ], [ %5, %23 ], [ %7, %25 ], [ %9, %27 ], [ %11, %29 ], [ %13, %31 ], [ %15, %33 ]
  %38 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %39 = mul nuw nsw i32 %38, %17
  %40 = zext i32 %17 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %35, %16, %33, %31, %29, %27, %25, %23, %21, %19
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
