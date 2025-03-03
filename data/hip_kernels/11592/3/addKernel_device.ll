; ModuleID = '../data/hip_kernels/11592/3/main.cu'
source_filename = "../data/hip_kernels/11592/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@smem = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9addKernelPiPKi(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %3
  store i32 %6, i32 addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %3, label %45 [
    i32 0, label %30
    i32 1, label %19
    i32 2, label %8
  ]

8:                                                ; preds = %2
  %9 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 0), align 4, !tbaa !5
  %10 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 1), align 4, !tbaa !5
  %11 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 2), align 4, !tbaa !5
  %12 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 3), align 4, !tbaa !5
  %13 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 4), align 4, !tbaa !5
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 2
  %15 = mul nsw i32 %9, %10
  %16 = mul nsw i32 %15, %11
  %17 = mul nsw i32 %16, %12
  %18 = mul nsw i32 %17, %13
  store i32 %18, i32 addrspace(1)* %14, align 4, !tbaa !5
  br label %45

19:                                               ; preds = %2
  %20 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 0), align 4, !tbaa !5
  %21 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 1), align 4, !tbaa !5
  %22 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 2), align 4, !tbaa !5
  %23 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 3), align 4, !tbaa !5
  %24 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 4), align 4, !tbaa !5
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %26 = add nsw i32 %20, %21
  %27 = add nsw i32 %26, %22
  %28 = add nsw i32 %27, %23
  %29 = add nsw i32 %28, %24
  store i32 %29, i32 addrspace(1)* %25, align 4, !tbaa !5
  br label %45

30:                                               ; preds = %2
  %31 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 0), align 4, !tbaa !5
  %32 = mul nsw i32 %31, %31
  %33 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 1), align 4, !tbaa !5
  %34 = mul nsw i32 %33, %33
  %35 = add nuw nsw i32 %32, %34
  %36 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 2), align 4, !tbaa !5
  %37 = mul nsw i32 %36, %36
  %38 = add nuw nsw i32 %35, %37
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 3), align 4, !tbaa !5
  %40 = mul nsw i32 %39, %39
  %41 = add nuw nsw i32 %38, %40
  %42 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 4), align 4, !tbaa !5
  %43 = mul nsw i32 %42, %42
  %44 = add nuw nsw i32 %41, %43
  store i32 %44, i32 addrspace(1)* %0, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %19, %30, %8, %2
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
