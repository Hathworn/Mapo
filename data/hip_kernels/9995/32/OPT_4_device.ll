; ModuleID = '../data/hip_kernels/9995/32/main.cu'
source_filename = "../data/hip_kernels/9995/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5OPT_4PiS_S_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %99

16:                                               ; preds = %5
  %17 = icmp sgt i32 %14, 0
  br i1 %17, label %18, label %25

18:                                               ; preds = %16
  %19 = add nsw i32 %14, -1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %20
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %25

25:                                               ; preds = %18, %16
  %26 = phi i32 [ %24, %18 ], [ 0, %16 ]
  %27 = phi i32 [ %22, %18 ], [ 0, %16 ]
  %28 = sext i32 %14 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = icmp slt i32 %26, %30
  br i1 %31, label %36, label %32

32:                                               ; preds = %36, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %34, label %99

34:                                               ; preds = %32
  %35 = icmp slt i32 %27, %30
  br label %42

36:                                               ; preds = %25, %36
  %37 = phi i32 [ %40, %36 ], [ %26, %25 ]
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = add nsw i32 %37, 1
  %41 = icmp slt i32 %40, %30
  br i1 %41, label %36, label %32, !llvm.loop !11

42:                                               ; preds = %34, %95
  %43 = phi i32 [ 0, %34 ], [ %97, %95 ]
  %44 = phi i32 [ 0, %34 ], [ %96, %95 ]
  %45 = icmp eq i32 %14, %43
  br i1 %45, label %95, label %46

46:                                               ; preds = %42
  %47 = icmp eq i32 %43, 0
  br i1 %47, label %53, label %48

48:                                               ; preds = %46
  %49 = add nsw i32 %43, -1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %48, %46
  %54 = phi i32 [ %52, %48 ], [ 0, %46 ]
  %55 = zext i32 %43 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = icmp slt i32 %54, %57
  %59 = select i1 %35, i1 %58, i1 false
  br i1 %59, label %60, label %86

60:                                               ; preds = %53, %79
  %61 = phi i32 [ %82, %79 ], [ 0, %53 ]
  %62 = phi i32 [ %81, %79 ], [ %54, %53 ]
  %63 = phi i32 [ %80, %79 ], [ %27, %53 ]
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7
  %67 = sext i32 %62 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = icmp slt i32 %66, %69
  br i1 %70, label %71, label %73

71:                                               ; preds = %60
  %72 = add nsw i32 %63, 1
  br label %79

73:                                               ; preds = %60
  %74 = icmp slt i32 %69, %66
  %75 = add nsw i32 %62, 1
  br i1 %74, label %79, label %76

76:                                               ; preds = %73
  %77 = add nsw i32 %63, 1
  %78 = add nsw i32 %61, 1
  br label %79

79:                                               ; preds = %73, %76, %71
  %80 = phi i32 [ %72, %71 ], [ %77, %76 ], [ %63, %73 ]
  %81 = phi i32 [ %62, %71 ], [ %75, %76 ], [ %75, %73 ]
  %82 = phi i32 [ %61, %71 ], [ %78, %76 ], [ %61, %73 ]
  %83 = icmp slt i32 %80, %30
  %84 = icmp slt i32 %81, %57
  %85 = select i1 %83, i1 %84, i1 false
  br i1 %85, label %60, label %86, !llvm.loop !13

86:                                               ; preds = %79, %53
  %87 = phi i32 [ 0, %53 ], [ %82, %79 ]
  %88 = icmp sgt i32 %87, 0
  br i1 %88, label %89, label %95

89:                                               ; preds = %86
  %90 = add nsw i32 %44, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %91
  %93 = atomicrmw add i32 addrspace(1)* %92, i32 %87 syncscope("agent-one-as") monotonic, align 4
  %94 = add nsw i32 %44, 1
  br label %95

95:                                               ; preds = %86, %89, %42
  %96 = phi i32 [ %44, %42 ], [ %94, %89 ], [ %44, %86 ]
  %97 = add nuw nsw i32 %43, 1
  %98 = icmp eq i32 %97, %4
  br i1 %98, label %99, label %42, !llvm.loop !14

99:                                               ; preds = %95, %32, %5
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
