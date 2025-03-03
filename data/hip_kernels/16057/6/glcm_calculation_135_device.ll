; ModuleID = '../data/hip_kernels/16057/6/main.cu'
source_filename = "../data/hip_kernels/16057/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20glcm_calculation_135PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  %25 = add i32 %2, -1
  %26 = icmp sgt i32 %2, 1
  br i1 %26, label %27, label %121

27:                                               ; preds = %5
  %28 = zext i32 %24 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = add i32 %24, %25
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = add i32 %2, -2
  %34 = and i32 %25, 3
  %35 = icmp ult i32 %33, 3
  br i1 %35, label %99, label %36

36:                                               ; preds = %27
  %37 = and i32 %25, -4
  br label %38

38:                                               ; preds = %95, %36
  %39 = phi i32 [ 0, %36 ], [ %96, %95 ]
  %40 = phi i32 [ 0, %36 ], [ %97, %95 ]
  %41 = icmp eq i32 %7, %39
  %42 = mul nsw i32 %39, %2
  %43 = icmp ugt i32 %24, %42
  %44 = select i1 %41, i1 %43, i1 false
  br i1 %44, label %45, label %53

45:                                               ; preds = %38
  %46 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %47 = mul nsw i32 %46, %4
  %48 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = atomicrmw add i32 addrspace(1)* %51, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %53

53:                                               ; preds = %38, %45
  %54 = or i32 %39, 1
  %55 = icmp eq i32 %7, %54
  %56 = mul nsw i32 %54, %2
  %57 = icmp ugt i32 %24, %56
  %58 = select i1 %55, i1 %57, i1 false
  br i1 %58, label %59, label %67

59:                                               ; preds = %53
  %60 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %61 = mul nsw i32 %60, %4
  %62 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %66 = atomicrmw add i32 addrspace(1)* %65, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %67

67:                                               ; preds = %59, %53
  %68 = or i32 %39, 2
  %69 = icmp eq i32 %7, %68
  %70 = mul nsw i32 %68, %2
  %71 = icmp ugt i32 %24, %70
  %72 = select i1 %69, i1 %71, i1 false
  br i1 %72, label %73, label %81

73:                                               ; preds = %67
  %74 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %75 = mul nsw i32 %74, %4
  %76 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %77 = add nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = atomicrmw add i32 addrspace(1)* %79, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %81

81:                                               ; preds = %73, %67
  %82 = or i32 %39, 3
  %83 = icmp eq i32 %7, %82
  %84 = mul nsw i32 %82, %2
  %85 = icmp ugt i32 %24, %84
  %86 = select i1 %83, i1 %85, i1 false
  br i1 %86, label %87, label %95

87:                                               ; preds = %81
  %88 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %89 = mul nsw i32 %88, %4
  %90 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = atomicrmw add i32 addrspace(1)* %93, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %95

95:                                               ; preds = %87, %81
  %96 = add nuw nsw i32 %39, 4
  %97 = add i32 %40, 4
  %98 = icmp eq i32 %97, %37
  br i1 %98, label %99, label %38, !llvm.loop !11

99:                                               ; preds = %95, %27
  %100 = phi i32 [ 0, %27 ], [ %96, %95 ]
  %101 = icmp eq i32 %34, 0
  br i1 %101, label %121, label %102

102:                                              ; preds = %99, %117
  %103 = phi i32 [ %118, %117 ], [ %100, %99 ]
  %104 = phi i32 [ %119, %117 ], [ 0, %99 ]
  %105 = icmp eq i32 %7, %103
  %106 = mul nsw i32 %103, %2
  %107 = icmp ugt i32 %24, %106
  %108 = select i1 %105, i1 %107, i1 false
  br i1 %108, label %109, label %117

109:                                              ; preds = %102
  %110 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %111 = mul nsw i32 %110, %4
  %112 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %113 = add nsw i32 %111, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %116 = atomicrmw add i32 addrspace(1)* %115, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %117

117:                                              ; preds = %109, %102
  %118 = add nuw nsw i32 %103, 1
  %119 = add i32 %104, 1
  %120 = icmp eq i32 %119, %34
  br i1 %120, label %121, label %102, !llvm.loop !13

121:                                              ; preds = %99, %117, %5
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
