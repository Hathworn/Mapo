; ModuleID = '../data/hip_kernels/9995/33/main.cu'
source_filename = "../data/hip_kernels/9995/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10OPT_4_HISTPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %75

15:                                               ; preds = %4
  %16 = icmp sgt i32 %13, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %15
  %18 = add nsw i32 %13, -1
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %22

22:                                               ; preds = %17, %15
  %23 = phi i32 [ %21, %17 ], [ 0, %15 ]
  %24 = sext i32 %13 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = sub nsw i32 %26, %23
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %22
  %30 = icmp slt i32 %27, 1
  br label %36

31:                                               ; preds = %71, %22
  %32 = phi i32 [ 0, %22 ], [ %72, %71 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = atomicrmw add i32 addrspace(1)* %34, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %75

36:                                               ; preds = %29, %71
  %37 = phi i32 [ 0, %29 ], [ %72, %71 ]
  %38 = phi i32 [ 0, %29 ], [ %73, %71 ]
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %45, label %40

40:                                               ; preds = %36
  %41 = add nsw i32 %38, -1
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %45

45:                                               ; preds = %40, %36
  %46 = phi i32 [ %44, %40 ], [ 0, %36 ]
  %47 = zext i32 %38 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = sub nsw i32 %49, %46
  %51 = icmp eq i32 %27, %50
  br i1 %51, label %52, label %71

52:                                               ; preds = %45
  br i1 %30, label %67, label %53

53:                                               ; preds = %52, %53
  %54 = phi i32 [ %64, %53 ], [ 0, %52 ]
  %55 = add nsw i32 %54, %23
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = add nsw i32 %54, %46
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = icmp eq i32 %58, %62
  %64 = add nuw nsw i32 %54, 1
  %65 = icmp slt i32 %64, %27
  %66 = select i1 %63, i1 %65, i1 false
  br i1 %66, label %53, label %67, !llvm.loop !11

67:                                               ; preds = %53, %52
  %68 = phi i1 [ true, %52 ], [ %63, %53 ]
  %69 = zext i1 %68 to i32
  %70 = add nsw i32 %37, %69
  br label %71

71:                                               ; preds = %45, %67
  %72 = phi i32 [ %70, %67 ], [ %37, %45 ]
  %73 = add nuw nsw i32 %38, 1
  %74 = icmp eq i32 %73, %3
  br i1 %74, label %31, label %36, !llvm.loop !13

75:                                               ; preds = %31, %4
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
