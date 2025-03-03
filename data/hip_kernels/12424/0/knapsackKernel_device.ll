; ModuleID = '../data/hip_kernels/12424/0/main.cu'
source_filename = "../data/hip_kernels/12424/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14knapsackKernelPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %4, 0
  %8 = icmp eq i32 %6, 0
  %9 = select i1 %7, i1 true, i1 %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %5
  %11 = add nsw i32 %3, 1
  br label %33

12:                                               ; preds = %5
  %13 = add nsw i32 %4, -1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = icmp slt i32 %6, %16
  %18 = add nsw i32 %3, 1
  %19 = mul nsw i32 %13, %18
  %20 = add i32 %19, %6
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5
  br i1 %17, label %33, label %24

24:                                               ; preds = %12
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = sub i32 %20, %16
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = add nsw i32 %30, %26
  %32 = tail call i32 @llvm.smax.i32(i32 %23, i32 %31)
  br label %33

33:                                               ; preds = %12, %24, %10
  %34 = phi i32 [ %18, %24 ], [ %11, %10 ], [ %18, %12 ]
  %35 = phi i32 [ %32, %24 ], [ 0, %10 ], [ %23, %12 ]
  %36 = mul nsw i32 %34, %4
  %37 = add nsw i32 %36, %6
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  store i32 %35, i32 addrspace(1)* %39, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
