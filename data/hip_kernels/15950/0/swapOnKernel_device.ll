; ModuleID = '../data/hip_kernels/15950/0/main.cu'
source_filename = "../data/hip_kernels/15950/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12swapOnKernelPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = shl nuw nsw i32 %10, 1
  %12 = add i32 %9, %11
  %13 = icmp slt i32 %1, -1
  br i1 %13, label %26, label %14

14:                                               ; preds = %2
  %15 = sdiv i32 %1, 2
  %16 = add nsw i32 %12, 1
  %17 = icmp slt i32 %16, %1
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = add nsw i32 %12, 2
  %23 = icmp slt i32 %22, %1
  %24 = sext i32 %22 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  br label %27

26:                                               ; preds = %41, %2
  ret void

27:                                               ; preds = %14, %41
  %28 = phi i32 [ undef, %14 ], [ %36, %41 ]
  %29 = phi i32 [ 0, %14 ], [ %42, %41 ]
  br i1 %17, label %30, label %35

30:                                               ; preds = %27
  %31 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7
  %32 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  store i32 %32, i32 addrspace(1)* %19, align 4, !tbaa !7
  store i32 %31, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %30, %34, %27
  %36 = phi i32 [ %31, %34 ], [ %32, %30 ], [ %28, %27 ]
  br i1 %23, label %37, label %41

37:                                               ; preds = %35
  %38 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7
  %39 = icmp sgt i32 %36, %38
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  store i32 %38, i32 addrspace(1)* %21, align 4, !tbaa !7
  store i32 %36, i32 addrspace(1)* %25, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %37, %40, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = add nuw nsw i32 %29, 1
  %43 = icmp eq i32 %29, %15
  br i1 %43, label %26, label %27, !llvm.loop !11
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
