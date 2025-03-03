; ModuleID = '../data/hip_kernels/16427/1/main.cu'
source_filename = "../data/hip_kernels/16427/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z14horspool_matchPcS_PiPjiiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = icmp sgt i32 %17, %5
  br i1 %18, label %75, label %19

19:                                               ; preds = %8
  %20 = mul nsw i32 %17, %4
  %21 = add nsw i32 %7, -1
  %22 = add i32 %21, %4
  %23 = add i32 %22, %20
  %24 = add i32 %21, %20
  %25 = icmp slt i32 %24, %23
  %26 = icmp slt i32 %24, %6
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %72

28:                                               ; preds = %19
  %29 = icmp sgt i32 %7, 0
  br label %30

30:                                               ; preds = %28, %66
  %31 = phi i32 [ %24, %28 ], [ %68, %66 ]
  %32 = phi i32 [ 0, %28 ], [ %67, %66 ]
  %33 = sext i32 %31 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !6
  %36 = icmp ugt i8 %35, 125
  br i1 %36, label %38, label %37

37:                                               ; preds = %30
  br i1 %29, label %40, label %55

38:                                               ; preds = %30
  %39 = add nsw i32 %31, 1
  br label %66

40:                                               ; preds = %37, %52
  %41 = phi i32 [ %53, %52 ], [ 0, %37 ]
  %42 = xor i32 %41, -1
  %43 = add i32 %42, %7
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !6
  %47 = sub nsw i32 %31, %41
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !amdgpu.noclobber !6
  %51 = icmp eq i8 %46, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %40
  %53 = add nuw nsw i32 %41, 1
  %54 = icmp eq i32 %53, %7
  br i1 %54, label %55, label %40, !llvm.loop !10

55:                                               ; preds = %40, %52, %37
  %56 = phi i32 [ 0, %37 ], [ %41, %40 ], [ %7, %52 ]
  %57 = icmp eq i32 %56, %7
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = add nsw i32 %32, 1
  %60 = add nsw i32 %31, 1
  br label %66

61:                                               ; preds = %55
  %62 = sext i8 %35 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !12, !amdgpu.noclobber !6
  %65 = add nsw i32 %64, %31
  br label %66

66:                                               ; preds = %58, %61, %38
  %67 = phi i32 [ %32, %38 ], [ %59, %58 ], [ %32, %61 ]
  %68 = phi i32 [ %39, %38 ], [ %60, %58 ], [ %65, %61 ]
  %69 = icmp slt i32 %68, %23
  %70 = icmp slt i32 %68, %6
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %30, label %72, !llvm.loop !14

72:                                               ; preds = %66, %19
  %73 = phi i32 [ 0, %19 ], [ %67, %66 ]
  %74 = atomicrmw add i32 addrspace(1)* %3, i32 %73 syncscope("agent-one-as") monotonic, align 4
  br label %75

75:                                               ; preds = %8, %72
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
!14 = distinct !{!14, !11}
