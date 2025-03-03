; ModuleID = '../data/hip_kernels/582/12/main.cu'
source_filename = "../data/hip_kernels/582/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18exclusivePrefixAddPjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  store i32 %6, i32 addrspace(1)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !10, !invariant.load !9
  %12 = zext i16 %11 to i32
  %13 = icmp ult i16 %11, 2
  br i1 %13, label %16, label %14

14:                                               ; preds = %2
  %15 = add nuw nsw i32 %3, 1
  br label %19

16:                                               ; preds = %32, %2
  %17 = add nsw i32 %12, -1
  %18 = icmp eq i32 %3, %17
  br i1 %18, label %35, label %36

19:                                               ; preds = %14, %32
  %20 = phi i32 [ 2, %14 ], [ %33, %32 ]
  %21 = add i32 %20, 2047
  %22 = and i32 %21, %15
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %32

24:                                               ; preds = %19
  %25 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5
  %26 = lshr exact i32 %20, 1
  %27 = sub nsw i32 %3, %26
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5
  %31 = add i32 %30, %25
  store i32 %31, i32 addrspace(1)* %7, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %24, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = shl i32 %20, 1
  %34 = icmp ugt i32 %33, %12
  br i1 %34, label %16, label %19, !llvm.loop !11

35:                                               ; preds = %16
  store i32 0, i32 addrspace(1)* %7, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %35, %16
  %37 = icmp ugt i16 %11, 1
  br i1 %37, label %38, label %40

38:                                               ; preds = %36
  %39 = add nuw nsw i32 %3, 1
  br label %41

40:                                               ; preds = %54, %36
  ret void

41:                                               ; preds = %38, %54
  %42 = phi i32 [ %12, %38 ], [ %45, %54 ]
  %43 = urem i32 %39, %42
  %44 = icmp eq i32 %43, 0
  %45 = lshr i32 %42, 1
  br i1 %44, label %46, label %54

46:                                               ; preds = %41
  %47 = sub nsw i32 %3, %45
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !5
  %51 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5
  store i32 %51, i32 addrspace(1)* %49, align 4, !tbaa !5
  %52 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5
  %53 = add i32 %52, %50
  store i32 %53, i32 addrspace(1)* %7, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %41, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = icmp ugt i32 %42, 3
  br i1 %55, label %41, label %40, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
