; ModuleID = '../data/hip_kernels/16057/19/main.cu'
source_filename = "../data/hip_kernels/16057/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z4Div0PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = icmp sgt i32 %2, 0
  br i1 %25, label %26, label %71

26:                                               ; preds = %5
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = add nsw i32 %24, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = add i32 %24, %4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = add i32 %32, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = add i32 %2, -1
  %39 = lshr i32 %38, 1
  %40 = add nuw i32 %39, 1
  %41 = and i32 %40, 1
  %42 = icmp ult i32 %2, 3
  br i1 %42, label %45, label %43

43:                                               ; preds = %26
  %44 = and i32 %40, -2
  br label %72

45:                                               ; preds = %121, %26
  %46 = phi i32 [ 0, %26 ], [ %122, %121 ]
  %47 = icmp eq i32 %41, 0
  %48 = mul nsw i32 %46, %2
  %49 = icmp slt i32 %24, %48
  %50 = select i1 %47, i1 true, i1 %49
  br i1 %50, label %71, label %51

51:                                               ; preds = %45
  %52 = or i32 %46, 1
  %53 = mul nsw i32 %52, %2
  %54 = add nsw i32 %53, -1
  %55 = icmp slt i32 %24, %54
  br i1 %55, label %56, label %71

56:                                               ; preds = %51
  %57 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %58 = mul nsw i32 %57, %4
  %59 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  %63 = atomicrmw add i32 addrspace(1)* %62, i32 1 syncscope("agent-one-as") monotonic, align 4
  %64 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %65 = mul nsw i32 %64, %4
  %66 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = atomicrmw add i32 addrspace(1)* %69, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %71

71:                                               ; preds = %45, %56, %51, %5
  ret void

72:                                               ; preds = %121, %43
  %73 = phi i32 [ 0, %43 ], [ %122, %121 ]
  %74 = phi i32 [ 0, %43 ], [ %123, %121 ]
  %75 = mul nsw i32 %73, %2
  %76 = icmp slt i32 %24, %75
  br i1 %76, label %97, label %77

77:                                               ; preds = %72
  %78 = or i32 %73, 1
  %79 = mul nsw i32 %78, %2
  %80 = add nsw i32 %79, -1
  %81 = icmp slt i32 %24, %80
  br i1 %81, label %82, label %97

82:                                               ; preds = %77
  %83 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %84 = mul nsw i32 %83, %4
  %85 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %86 = add nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %89 = atomicrmw add i32 addrspace(1)* %88, i32 1 syncscope("agent-one-as") monotonic, align 4
  %90 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %91 = mul nsw i32 %90, %4
  %92 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %93 = add nsw i32 %91, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %94
  %96 = atomicrmw add i32 addrspace(1)* %95, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %97

97:                                               ; preds = %72, %77, %82
  %98 = or i32 %73, 2
  %99 = mul nsw i32 %98, %2
  %100 = icmp slt i32 %24, %99
  br i1 %100, label %121, label %101

101:                                              ; preds = %97
  %102 = or i32 %73, 3
  %103 = mul nsw i32 %102, %2
  %104 = add nsw i32 %103, -1
  %105 = icmp slt i32 %24, %104
  br i1 %105, label %106, label %121

106:                                              ; preds = %101
  %107 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %108 = mul nsw i32 %107, %4
  %109 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %110 = add nsw i32 %108, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %111
  %113 = atomicrmw add i32 addrspace(1)* %112, i32 1 syncscope("agent-one-as") monotonic, align 4
  %114 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %115 = mul nsw i32 %114, %4
  %116 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %117 = add nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  %120 = atomicrmw add i32 addrspace(1)* %119, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %121

121:                                              ; preds = %106, %101, %97
  %122 = add nuw nsw i32 %73, 4
  %123 = add nuw nsw i32 %74, 2
  %124 = icmp eq i32 %123, %44
  br i1 %124, label %45, label %72, !llvm.loop !11
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
