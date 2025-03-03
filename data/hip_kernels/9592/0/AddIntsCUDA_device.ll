; ModuleID = '../data/hip_kernels/9592/0/main.cu'
source_filename = "../data/hip_kernels/9592/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11AddIntsCUDAPiS_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  br label %5

4:                                                ; preds = %5
  ret void

5:                                                ; preds = %5, %2
  %6 = phi i32 [ %3, %2 ], [ %37, %5 ]
  %7 = phi i32 [ 0, %2 ], [ %38, %5 ]
  %8 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %9 = add nsw i32 %6, %8
  store i32 %9, i32 addrspace(1)* %0, align 4, !tbaa !4
  %10 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %11 = add nsw i32 %9, %10
  store i32 %11, i32 addrspace(1)* %0, align 4, !tbaa !4
  %12 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %13 = add nsw i32 %11, %12
  store i32 %13, i32 addrspace(1)* %0, align 4, !tbaa !4
  %14 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %15 = add nsw i32 %13, %14
  store i32 %15, i32 addrspace(1)* %0, align 4, !tbaa !4
  %16 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %17 = add nsw i32 %15, %16
  store i32 %17, i32 addrspace(1)* %0, align 4, !tbaa !4
  %18 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %19 = add nsw i32 %17, %18
  store i32 %19, i32 addrspace(1)* %0, align 4, !tbaa !4
  %20 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %21 = add nsw i32 %19, %20
  store i32 %21, i32 addrspace(1)* %0, align 4, !tbaa !4
  %22 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %23 = add nsw i32 %21, %22
  store i32 %23, i32 addrspace(1)* %0, align 4, !tbaa !4
  %24 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %25 = add nsw i32 %23, %24
  store i32 %25, i32 addrspace(1)* %0, align 4, !tbaa !4
  %26 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %27 = add nsw i32 %25, %26
  store i32 %27, i32 addrspace(1)* %0, align 4, !tbaa !4
  %28 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %29 = add nsw i32 %27, %28
  store i32 %29, i32 addrspace(1)* %0, align 4, !tbaa !4
  %30 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32 addrspace(1)* %0, align 4, !tbaa !4
  %32 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %33 = add nsw i32 %31, %32
  store i32 %33, i32 addrspace(1)* %0, align 4, !tbaa !4
  %34 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %35 = add nsw i32 %33, %34
  store i32 %35, i32 addrspace(1)* %0, align 4, !tbaa !4
  %36 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %37 = add nsw i32 %35, %36
  store i32 %37, i32 addrspace(1)* %0, align 4, !tbaa !4
  %38 = add nuw nsw i32 %7, 15
  %39 = icmp eq i32 %38, 1000005
  br i1 %39, label %4, label %5, !llvm.loop !8
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
