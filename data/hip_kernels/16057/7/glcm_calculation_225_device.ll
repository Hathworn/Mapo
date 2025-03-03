; ModuleID = '../data/hip_kernels/16057/7/main.cu'
source_filename = "../data/hip_kernels/16057/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20glcm_calculation_225PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  %25 = icmp sgt i32 %2, 1
  br i1 %25, label %26, label %122

26:                                               ; preds = %5
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = xor i32 %2, -1
  %30 = add i32 %24, %29
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = add i32 %2, -1
  %34 = add i32 %2, -2
  %35 = and i32 %33, 3
  %36 = icmp ult i32 %34, 3
  br i1 %36, label %100, label %37

37:                                               ; preds = %26
  %38 = and i32 %33, -4
  br label %39

39:                                               ; preds = %96, %37
  %40 = phi i32 [ 1, %37 ], [ %97, %96 ]
  %41 = phi i32 [ 0, %37 ], [ %98, %96 ]
  %42 = icmp eq i32 %7, %40
  %43 = mul nsw i32 %40, %2
  %44 = icmp ugt i32 %24, %43
  %45 = select i1 %42, i1 %44, i1 false
  br i1 %45, label %46, label %54

46:                                               ; preds = %39
  %47 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %48 = mul nsw i32 %47, %4
  %49 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = atomicrmw add i32 addrspace(1)* %52, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %54

54:                                               ; preds = %39, %46
  %55 = add nuw nsw i32 %40, 1
  %56 = icmp eq i32 %7, %55
  %57 = mul nsw i32 %55, %2
  %58 = icmp ugt i32 %24, %57
  %59 = select i1 %56, i1 %58, i1 false
  br i1 %59, label %60, label %68

60:                                               ; preds = %54
  %61 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %62 = mul nsw i32 %61, %4
  %63 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = atomicrmw add i32 addrspace(1)* %66, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %68

68:                                               ; preds = %60, %54
  %69 = add nuw nsw i32 %40, 2
  %70 = icmp eq i32 %7, %69
  %71 = mul nsw i32 %69, %2
  %72 = icmp ugt i32 %24, %71
  %73 = select i1 %70, i1 %72, i1 false
  br i1 %73, label %74, label %82

74:                                               ; preds = %68
  %75 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %76 = mul nsw i32 %75, %4
  %77 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = atomicrmw add i32 addrspace(1)* %80, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %82

82:                                               ; preds = %74, %68
  %83 = add nuw nsw i32 %40, 3
  %84 = icmp eq i32 %7, %83
  %85 = mul nsw i32 %83, %2
  %86 = icmp ugt i32 %24, %85
  %87 = select i1 %84, i1 %86, i1 false
  br i1 %87, label %88, label %96

88:                                               ; preds = %82
  %89 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %90 = mul nsw i32 %89, %4
  %91 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %92 = add nsw i32 %90, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = atomicrmw add i32 addrspace(1)* %94, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %96

96:                                               ; preds = %88, %82
  %97 = add nuw nsw i32 %40, 4
  %98 = add i32 %41, 4
  %99 = icmp eq i32 %98, %38
  br i1 %99, label %100, label %39, !llvm.loop !11

100:                                              ; preds = %96, %26
  %101 = phi i32 [ 1, %26 ], [ %97, %96 ]
  %102 = icmp eq i32 %35, 0
  br i1 %102, label %122, label %103

103:                                              ; preds = %100, %118
  %104 = phi i32 [ %119, %118 ], [ %101, %100 ]
  %105 = phi i32 [ %120, %118 ], [ 0, %100 ]
  %106 = icmp eq i32 %7, %104
  %107 = mul nsw i32 %104, %2
  %108 = icmp ugt i32 %24, %107
  %109 = select i1 %106, i1 %108, i1 false
  br i1 %109, label %110, label %118

110:                                              ; preds = %103
  %111 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %112 = mul nsw i32 %111, %4
  %113 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %114 = add nsw i32 %112, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %115
  %117 = atomicrmw add i32 addrspace(1)* %116, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %118

118:                                              ; preds = %110, %103
  %119 = add nuw nsw i32 %104, 1
  %120 = add i32 %105, 1
  %121 = icmp eq i32 %120, %35
  br i1 %121, label %122, label %103, !llvm.loop !13

122:                                              ; preds = %100, %118, %5
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
