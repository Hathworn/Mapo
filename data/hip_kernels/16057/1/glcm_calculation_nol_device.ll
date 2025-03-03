; ModuleID = '../data/hip_kernels/16057/1/main.cu'
source_filename = "../data/hip_kernels/16057/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20glcm_calculation_nolPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = mul nsw i32 %3, %2
  %26 = icmp uge i32 %24, %25
  %27 = icmp slt i32 %4, 0
  %28 = select i1 %26, i1 true, i1 %27
  br i1 %28, label %118, label %29

29:                                               ; preds = %5
  %30 = zext i32 %24 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = add nuw i32 %24, 1
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = add i32 %4, 1
  %36 = and i32 %35, 3
  %37 = icmp ult i32 %4, 3
  %38 = and i32 %35, -4
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %29, %115
  %41 = phi i32 [ 0, %29 ], [ %116, %115 ]
  %42 = mul nsw i32 %41, %35
  br i1 %37, label %96, label %43

43:                                               ; preds = %40, %92
  %44 = phi i32 [ %93, %92 ], [ 0, %40 ]
  %45 = phi i32 [ %94, %92 ], [ 0, %40 ]
  %46 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %47 = icmp eq i32 %46, %41
  br i1 %47, label %48, label %56

48:                                               ; preds = %43
  %49 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %50 = icmp eq i32 %49, %44
  br i1 %50, label %51, label %56

51:                                               ; preds = %48
  %52 = add nsw i32 %44, %42
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = atomicrmw add i32 addrspace(1)* %54, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %43, %48, %51
  %57 = or i32 %44, 1
  %58 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %59 = icmp eq i32 %58, %41
  br i1 %59, label %60, label %68

60:                                               ; preds = %56
  %61 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %62 = icmp eq i32 %61, %57
  br i1 %62, label %63, label %68

63:                                               ; preds = %60
  %64 = add nsw i32 %57, %42
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = atomicrmw add i32 addrspace(1)* %66, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %68

68:                                               ; preds = %63, %60, %56
  %69 = or i32 %44, 2
  %70 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %71 = icmp eq i32 %70, %41
  br i1 %71, label %72, label %80

72:                                               ; preds = %68
  %73 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %74 = icmp eq i32 %73, %69
  br i1 %74, label %75, label %80

75:                                               ; preds = %72
  %76 = add nsw i32 %69, %42
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = atomicrmw add i32 addrspace(1)* %78, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %80

80:                                               ; preds = %75, %72, %68
  %81 = or i32 %44, 3
  %82 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %83 = icmp eq i32 %82, %41
  br i1 %83, label %84, label %92

84:                                               ; preds = %80
  %85 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %86 = icmp eq i32 %85, %81
  br i1 %86, label %87, label %92

87:                                               ; preds = %84
  %88 = add nsw i32 %81, %42
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = atomicrmw add i32 addrspace(1)* %90, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %92

92:                                               ; preds = %87, %84, %80
  %93 = add nuw i32 %44, 4
  %94 = add i32 %45, 4
  %95 = icmp eq i32 %94, %38
  br i1 %95, label %96, label %43, !llvm.loop !11

96:                                               ; preds = %92, %40
  %97 = phi i32 [ 0, %40 ], [ %93, %92 ]
  br i1 %39, label %115, label %98

98:                                               ; preds = %96, %111
  %99 = phi i32 [ %112, %111 ], [ %97, %96 ]
  %100 = phi i32 [ %113, %111 ], [ 0, %96 ]
  %101 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %102 = icmp eq i32 %101, %41
  br i1 %102, label %103, label %111

103:                                              ; preds = %98
  %104 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %105 = icmp eq i32 %104, %99
  br i1 %105, label %106, label %111

106:                                              ; preds = %103
  %107 = add nsw i32 %99, %42
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %108
  %110 = atomicrmw add i32 addrspace(1)* %109, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %111

111:                                              ; preds = %106, %103, %98
  %112 = add nuw i32 %99, 1
  %113 = add i32 %100, 1
  %114 = icmp eq i32 %113, %36
  br i1 %114, label %115, label %98, !llvm.loop !13

115:                                              ; preds = %111, %96
  %116 = add nuw i32 %41, 1
  %117 = icmp eq i32 %41, %4
  br i1 %117, label %118, label %40, !llvm.loop !15

118:                                              ; preds = %115, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
