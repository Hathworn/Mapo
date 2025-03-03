; ModuleID = '../data/hip_kernels/14707/1/main.cu'
source_filename = "../data/hip_kernels/14707/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13kernel_jacobiPlS_l(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl nsw i32 %4, 7
  %7 = add nsw i32 %6, %5
  %8 = sext i32 %7 to i64
  %9 = icmp slt i64 %8, %2
  br i1 %9, label %10, label %57

10:                                               ; preds = %3
  %11 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %8
  %12 = load i64, i64 addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %13

13:                                               ; preds = %10, %49
  %14 = phi i64 [ 1, %10 ], [ %54, %49 ]
  %15 = phi i64 [ 5, %10 ], [ %53, %49 ]
  %16 = mul nsw i64 %14, %15
  %17 = srem i64 %16, %12
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %49, label %19

19:                                               ; preds = %13, %37
  %20 = phi i64 [ %47, %37 ], [ %17, %13 ]
  %21 = phi i64 [ %39, %37 ], [ %12, %13 ]
  %22 = phi i32 [ %46, %37 ], [ 1, %13 ]
  %23 = and i64 %20, 1
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %37

25:                                               ; preds = %19
  %26 = srem i64 %21, 8
  br label %27

27:                                               ; preds = %25, %33
  %28 = phi i64 [ %20, %25 ], [ %30, %33 ]
  %29 = phi i32 [ %22, %25 ], [ %34, %33 ]
  %30 = sdiv i64 %28, 2
  switch i64 %26, label %33 [
    i64 3, label %31
    i64 5, label %31
  ]

31:                                               ; preds = %27, %27
  %32 = sub nsw i32 0, %29
  br label %33

33:                                               ; preds = %27, %31
  %34 = phi i32 [ %32, %31 ], [ %29, %27 ]
  %35 = and i64 %30, 1
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %27, label %37, !llvm.loop !10

37:                                               ; preds = %33, %19
  %38 = phi i32 [ %22, %19 ], [ %34, %33 ]
  %39 = phi i64 [ %20, %19 ], [ %30, %33 ]
  %40 = and i64 %21, -9223372036854775805
  %41 = icmp eq i64 %40, 3
  %42 = and i64 %39, -9223372036854775805
  %43 = icmp eq i64 %42, 3
  %44 = select i1 %41, i1 %43, i1 false
  %45 = sub nsw i32 0, %38
  %46 = select i1 %44, i32 %45, i32 %38
  %47 = srem i64 %21, %39
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %19, !llvm.loop !12

49:                                               ; preds = %37, %13
  %50 = phi i32 [ 1, %13 ], [ %46, %37 ]
  %51 = phi i64 [ %12, %13 ], [ %39, %37 ]
  %52 = icmp eq i64 %51, 1
  %53 = add nuw nsw i64 %15, 2
  %54 = sub nsw i64 0, %14
  %55 = icmp eq i32 %50, -1
  %56 = select i1 %52, i1 %55, i1 false
  br i1 %56, label %57, label %13, !llvm.loop !13

57:                                               ; preds = %49, %3
  %58 = phi i64 [ undef, %3 ], [ %16, %49 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %9, label %59, label %61

59:                                               ; preds = %57
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %8
  store i64 %58, i64 addrspace(1)* %60, align 8, !tbaa !5
  br label %61

61:                                               ; preds = %59, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
