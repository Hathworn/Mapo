; ModuleID = '../data/hip_kernels/9995/30/main.cu'
source_filename = "../data/hip_kernels/9995/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10OPT_3_HISTPiS_S_iE4cval = internal addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10OPT_3_HISTPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  store i32 0, i32 addrspace(3)* @_ZZ10OPT_3_HISTPiS_S_iE4cval, align 4, !tbaa !5
  br label %9

9:                                                ; preds = %8, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %10 = icmp slt i32 %5, %3
  br i1 %10, label %11, label %61

11:                                               ; preds = %9
  %12 = icmp slt i32 %6, %3
  br i1 %12, label %13, label %61

13:                                               ; preds = %11
  %14 = add nsw i32 %5, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %17 = sext i32 %5 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !9, !invariant.load !10
  %23 = zext i16 %22 to i32
  br label %24

24:                                               ; preds = %13, %58
  %25 = phi i32 [ %6, %13 ], [ %59, %58 ]
  %26 = icmp eq i32 %5, %25
  br i1 %26, label %56, label %27

27:                                               ; preds = %24
  %28 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %29 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5
  %30 = sub nsw i32 %28, %29
  %31 = add nsw i32 %25, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5
  %35 = sext i32 %25 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %38 = sub nsw i32 %34, %37
  %39 = icmp eq i32 %30, %38
  %40 = icmp sgt i32 %30, 0
  %41 = and i1 %39, %40
  br i1 %41, label %44, label %58

42:                                               ; preds = %44
  %43 = icmp slt i32 %55, %30
  br i1 %43, label %44, label %56, !llvm.loop !11

44:                                               ; preds = %27, %42
  %45 = phi i32 [ %55, %42 ], [ 0, %27 ]
  %46 = add nsw i32 %45, %29
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5
  %50 = add nsw i32 %45, %37
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !5
  %54 = icmp eq i32 %49, %53
  %55 = add nuw nsw i32 %45, 1
  br i1 %54, label %42, label %58

56:                                               ; preds = %42, %24
  %57 = atomicrmw add i32 addrspace(3)* @_ZZ10OPT_3_HISTPiS_S_iE4cval, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %58

58:                                               ; preds = %44, %56, %27
  %59 = add i32 %25, %23
  %60 = icmp slt i32 %59, %3
  br i1 %60, label %24, label %61, !llvm.loop !13

61:                                               ; preds = %58, %11, %9
  %62 = phi i1 [ %7, %11 ], [ false, %9 ], [ %7, %58 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = load i32, i32 addrspace(3)* @_ZZ10OPT_3_HISTPiS_S_iE4cval, align 4
  %64 = icmp sgt i32 %63, 0
  %65 = select i1 %62, i1 %64, i1 false
  br i1 %65, label %66, label %70

66:                                               ; preds = %61
  %67 = zext i32 %63 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = atomicrmw add i32 addrspace(1)* %68, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %70

70:                                               ; preds = %66, %61
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
