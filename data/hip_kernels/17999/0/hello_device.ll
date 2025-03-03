; ModuleID = '../data/hip_kernels/17999/0/main.cu'
source_filename = "../data/hip_kernels/17999/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5helloPcPi(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %4 = load i8, i8 addrspace(1)* %0, align 1, !tbaa !8
  %5 = trunc i32 %3 to i8
  %6 = add i8 %4, %5
  store i8 %6, i8 addrspace(1)* %0, align 1, !tbaa !8
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !4
  %9 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 1
  %10 = load i8, i8 addrspace(1)* %9, align 1, !tbaa !8
  %11 = trunc i32 %8 to i8
  %12 = add i8 %10, %11
  store i8 %12, i8 addrspace(1)* %9, align 1, !tbaa !8
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !4
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 2
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !8
  %17 = trunc i32 %14 to i8
  %18 = add i8 %16, %17
  store i8 %18, i8 addrspace(1)* %15, align 1, !tbaa !8
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 3
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !4
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 3
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !8
  %23 = trunc i32 %20 to i8
  %24 = add i8 %22, %23
  store i8 %24, i8 addrspace(1)* %21, align 1, !tbaa !8
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 4
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 4
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !8
  %29 = trunc i32 %26 to i8
  %30 = add i8 %28, %29
  store i8 %30, i8 addrspace(1)* %27, align 1, !tbaa !8
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 5
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 5
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !8
  %35 = trunc i32 %32 to i8
  %36 = add i8 %34, %35
  store i8 %36, i8 addrspace(1)* %33, align 1, !tbaa !8
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !4
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 6
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !8
  %41 = trunc i32 %38 to i8
  %42 = add i8 %40, %41
  store i8 %42, i8 addrspace(1)* %39, align 1, !tbaa !8
  ret void
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
!8 = !{!6, !6, i64 0}
