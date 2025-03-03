; ModuleID = '../data/hip_kernels/8367/0/main.cu'
source_filename = "../data/hip_kernels/8367/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14knapsackKernelPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp eq i32 %3, 0
  %7 = icmp eq i32 %5, 0
  %8 = select i1 %6, i1 true, i1 %7
  br i1 %8, label %35, label %9

9:                                                ; preds = %4
  %10 = add nsw i32 %3, -1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = icmp slt i32 %5, %13
  br i1 %14, label %29, label %15

15:                                               ; preds = %9
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = mul nsw i32 %10, 100
  %19 = add i32 %18, %5
  %20 = sub i32 %19, %13
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = add nsw i32 %23, %17
  %25 = sext i32 %19 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = tail call i32 @llvm.smax.i32(i32 %24, i32 %27)
  br label %35

29:                                               ; preds = %9
  %30 = mul nsw i32 %10, 100
  %31 = add nsw i32 %30, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %35

35:                                               ; preds = %4, %15, %29
  %36 = phi i32 [ %28, %15 ], [ %34, %29 ], [ 0, %4 ]
  %37 = mul nsw i32 %3, 100
  %38 = add nsw i32 %37, %5
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %36, i32 addrspace(1)* %40, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
