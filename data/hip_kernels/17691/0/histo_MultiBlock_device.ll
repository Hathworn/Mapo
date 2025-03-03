; ModuleID = '../data/hip_kernels/17691/0/main.cu'
source_filename = "../data/hip_kernels/17691/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16histo_MultiBlockPhlPjE4temp = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16histo_MultiBlockPhlPj(i8 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 8
  %7 = add i32 %6, %4
  %8 = icmp ult i32 %4, 256
  br i1 %8, label %9, label %11

9:                                                ; preds = %3
  %10 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16histo_MultiBlockPhlPjE4temp, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %10, align 4, !tbaa !5
  br label %11

11:                                               ; preds = %9, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %12 = sext i32 %7 to i64
  %13 = icmp slt i64 %12, %1
  br i1 %13, label %14, label %25

14:                                               ; preds = %11, %14
  %15 = phi i64 [ %23, %14 ], [ %12, %11 ]
  %16 = phi i32 [ %22, %14 ], [ %7, %11 ]
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %15
  %18 = load i8, i8 addrspace(1)* %17, align 1, !tbaa !9, !amdgpu.noclobber !10
  %19 = zext i8 %18 to i32
  %20 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16histo_MultiBlockPhlPjE4temp, i32 0, i32 %19
  %21 = atomicrmw add i32 addrspace(3)* %20, i32 1 syncscope("agent-one-as") monotonic, align 4
  %22 = add nsw i32 %16, 256000
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %23, %1
  br i1 %24, label %14, label %25, !llvm.loop !11

25:                                               ; preds = %14, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %26, label %32

26:                                               ; preds = %25
  %27 = zext i32 %7 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %29 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16histo_MultiBlockPhlPjE4temp, i32 0, i32 %4
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %31 = atomicrmw add i32 addrspace(1)* %28, i32 %30 syncscope("agent-one-as") monotonic, align 4
  br label %32

32:                                               ; preds = %26, %25
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!9 = !{!7, !7, i64 0}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
