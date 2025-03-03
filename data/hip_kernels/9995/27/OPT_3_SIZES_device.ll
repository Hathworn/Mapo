; ModuleID = '../data/hip_kernels/9995/27/main.cu'
source_filename = "../data/hip_kernels/9995/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z11OPT_3_SIZESPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %5, %3
  %8 = icmp slt i32 %6, %3
  %9 = select i1 %7, i1 %8, i1 false
  br i1 %9, label %10, label %65

10:                                               ; preds = %4
  %11 = add nsw i32 %5, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  %14 = sext i32 %5 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  br label %22

22:                                               ; preds = %10, %62
  %23 = phi i32 [ %6, %10 ], [ %63, %62 ]
  %24 = icmp eq i32 %5, %23
  br i1 %24, label %62, label %25

25:                                               ; preds = %22
  %26 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7
  %27 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %28 = sub nsw i32 %26, %27
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %62

30:                                               ; preds = %25
  %31 = add nsw i32 %23, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = sext i32 %23 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = sub nsw i32 %34, %37
  %39 = icmp sgt i32 %38, 0
  br label %40

40:                                               ; preds = %30, %59
  %41 = phi i32 [ 0, %30 ], [ %60, %59 ]
  br i1 %39, label %42, label %59

42:                                               ; preds = %40
  %43 = add nsw i32 %27, %41
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  br label %49

47:                                               ; preds = %49
  %48 = icmp slt i32 %56, %38
  br i1 %48, label %49, label %59, !llvm.loop !11

49:                                               ; preds = %42, %47
  %50 = phi i32 [ 0, %42 ], [ %56, %47 ]
  %51 = add nsw i32 %37, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = icmp eq i32 %46, %54
  %56 = add nuw nsw i32 %50, 1
  br i1 %55, label %57, label %47

57:                                               ; preds = %49
  %58 = atomicrmw add i32 addrspace(1)* %16, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %62

59:                                               ; preds = %47, %40
  %60 = add nuw nsw i32 %41, 1
  %61 = icmp slt i32 %60, %28
  br i1 %61, label %40, label %62, !llvm.loop !13

62:                                               ; preds = %59, %25, %57, %22
  %63 = add i32 %23, %21
  %64 = icmp slt i32 %63, %3
  br i1 %64, label %22, label %65, !llvm.loop !14

65:                                               ; preds = %62, %4
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
