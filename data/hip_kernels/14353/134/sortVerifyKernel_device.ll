; ModuleID = '../data/hip_kernels/14353/134/main.cu'
source_filename = "../data/hip_kernels/14353/134/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16sortVerifyKernelPjS_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = shl i32 %13, 3
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %23 = icmp eq i32 %20, %22
  br i1 %23, label %26, label %24

24:                                               ; preds = %4
  %25 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %26

26:                                               ; preds = %4, %24
  %27 = add nuw nsw i32 %14, 1
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %36 = icmp eq i32 %33, %35
  br i1 %36, label %39, label %37

37:                                               ; preds = %26
  %38 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %39

39:                                               ; preds = %37, %26
  %40 = add nuw nsw i32 %14, 2
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = icmp eq i32 %46, %48
  br i1 %49, label %52, label %50

50:                                               ; preds = %39
  %51 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %52

52:                                               ; preds = %50, %39
  %53 = add nuw nsw i32 %14, 3
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = icmp eq i32 %59, %61
  br i1 %62, label %65, label %63

63:                                               ; preds = %52
  %64 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %65

65:                                               ; preds = %63, %52
  %66 = add nuw nsw i32 %14, 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %78, label %76

76:                                               ; preds = %65
  %77 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %78

78:                                               ; preds = %76, %65
  %79 = add nuw nsw i32 %14, 5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %91, label %89

89:                                               ; preds = %78
  %90 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %91

91:                                               ; preds = %89, %78
  %92 = add nuw nsw i32 %14, 6
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %93
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = icmp eq i32 %98, %100
  br i1 %101, label %104, label %102

102:                                              ; preds = %91
  %103 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %104

104:                                              ; preds = %102, %91
  %105 = add nuw nsw i32 %14, 7
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7
  %114 = icmp eq i32 %111, %113
  br i1 %114, label %117, label %115

115:                                              ; preds = %104
  %116 = atomicrmw add i32 addrspace(1)* %3, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %117

117:                                              ; preds = %115, %104
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
