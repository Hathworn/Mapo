; ModuleID = '../data/hip_kernels/14324/5/main.cu'
source_filename = "../data/hip_kernels/14324/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3sumPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4
  %5 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %6 = add nsw i32 %5, %4
  store i32 %6, i32 addrspace(1)* %2, align 4, !tbaa !4
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !4
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !4
  %11 = add nsw i32 %10, %8
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  store i32 %11, i32 addrspace(1)* %12, align 4, !tbaa !4
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 2
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !4
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4
  %17 = add nsw i32 %16, %14
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 2
  store i32 %17, i32 addrspace(1)* %18, align 4, !tbaa !4
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 3
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !4
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 3
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !4
  %23 = add nsw i32 %22, %20
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 3
  store i32 %23, i32 addrspace(1)* %24, align 4, !tbaa !4
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 4
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 4
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !4
  %29 = add nsw i32 %28, %26
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 4
  store i32 %29, i32 addrspace(1)* %30, align 4, !tbaa !4
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 5
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 5
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !4
  %35 = add nsw i32 %34, %32
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 5
  store i32 %35, i32 addrspace(1)* %36, align 4, !tbaa !4
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 6
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !4
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !4
  %41 = add nsw i32 %40, %38
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 6
  store i32 %41, i32 addrspace(1)* %42, align 4, !tbaa !4
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 7
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !4
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 7
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !4
  %47 = add nsw i32 %46, %44
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 7
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !4
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 8
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !4
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 8
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !4
  %53 = add nsw i32 %52, %50
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 8
  store i32 %53, i32 addrspace(1)* %54, align 4, !tbaa !4
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 9
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !4
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 9
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !4
  %59 = add nsw i32 %58, %56
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 9
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !4
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
