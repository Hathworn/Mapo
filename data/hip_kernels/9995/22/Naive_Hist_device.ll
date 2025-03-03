; ModuleID = '../data/hip_kernels/9995/22/main.cu'
source_filename = "../data/hip_kernels/9995/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10Naive_HistPiS_iE5count = internal addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10Naive_HistPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  store i32 0, i32 addrspace(3)* @_ZZ10Naive_HistPiS_iE5count, align 4, !tbaa !5
  br label %8

8:                                                ; preds = %7, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %9 = icmp slt i32 %4, %2
  br i1 %9, label %10, label %41

10:                                               ; preds = %8
  %11 = icmp slt i32 %5, %2
  br i1 %11, label %12, label %41

12:                                               ; preds = %10
  %13 = mul nsw i32 %4, %2
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !9, !invariant.load !10
  %18 = zext i16 %17 to i32
  br label %19

19:                                               ; preds = %12, %38
  %20 = phi i32 [ %5, %12 ], [ %39, %38 ]
  %21 = mul nsw i32 %20, %2
  br label %24

22:                                               ; preds = %24
  %23 = icmp eq i32 %35, %2
  br i1 %23, label %36, label %24, !llvm.loop !11

24:                                               ; preds = %19, %22
  %25 = phi i32 [ 0, %19 ], [ %35, %22 ]
  %26 = add nsw i32 %25, %13
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5
  %30 = add nsw i32 %25, %21
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5
  %34 = icmp eq i32 %29, %33
  %35 = add nuw nsw i32 %25, 1
  br i1 %34, label %22, label %38

36:                                               ; preds = %22
  %37 = atomicrmw add i32 addrspace(3)* @_ZZ10Naive_HistPiS_iE5count, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %38

38:                                               ; preds = %24, %36
  %39 = add i32 %20, %18
  %40 = icmp slt i32 %39, %2
  br i1 %40, label %19, label %41, !llvm.loop !13

41:                                               ; preds = %38, %10, %8
  %42 = phi i1 [ %6, %10 ], [ false, %8 ], [ %6, %38 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = load i32, i32 addrspace(3)* @_ZZ10Naive_HistPiS_iE5count, align 4
  %44 = icmp sgt i32 %43, 0
  %45 = select i1 %42, i1 %44, i1 false
  br i1 %45, label %46, label %50

46:                                               ; preds = %41
  %47 = zext i32 %43 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %49 = atomicrmw add i32 addrspace(1)* %48, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %50

50:                                               ; preds = %46, %41
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
