; ModuleID = '../data/hip_kernels/16057/3/main.cu'
source_filename = "../data/hip_kernels/16057/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20glcm_calculation_270PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  br i1 %25, label %26, label %126

26:                                               ; preds = %5
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = add i32 %24, %2
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = add i32 %2, -1
  %33 = add i32 %2, -2
  %34 = and i32 %32, 3
  %35 = icmp ult i32 %33, 3
  br i1 %35, label %103, label %36

36:                                               ; preds = %26
  %37 = and i32 %32, -4
  br label %38

38:                                               ; preds = %100, %36
  %39 = phi i32 [ 0, %36 ], [ %88, %100 ]
  %40 = phi i32 [ 0, %36 ], [ %101, %100 ]
  %41 = mul nsw i32 %39, %2
  %42 = icmp uge i32 %24, %41
  %43 = or i32 %39, 1
  %44 = mul nsw i32 %43, %2
  %45 = icmp ult i32 %24, %44
  %46 = select i1 %42, i1 %45, i1 false
  br i1 %46, label %47, label %55

47:                                               ; preds = %38
  %48 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %49 = mul nsw i32 %48, %4
  %50 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = atomicrmw add i32 addrspace(1)* %53, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %55

55:                                               ; preds = %38, %47
  %56 = mul nsw i32 %43, %2
  %57 = icmp uge i32 %24, %56
  %58 = or i32 %39, 2
  %59 = mul nsw i32 %58, %2
  %60 = icmp ult i32 %24, %59
  %61 = select i1 %57, i1 %60, i1 false
  br i1 %61, label %62, label %70

62:                                               ; preds = %55
  %63 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %64 = mul nsw i32 %63, %4
  %65 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = atomicrmw add i32 addrspace(1)* %68, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %70

70:                                               ; preds = %62, %55
  %71 = mul nsw i32 %58, %2
  %72 = icmp uge i32 %24, %71
  %73 = or i32 %39, 3
  %74 = mul nsw i32 %73, %2
  %75 = icmp ult i32 %24, %74
  %76 = select i1 %72, i1 %75, i1 false
  br i1 %76, label %77, label %85

77:                                               ; preds = %70
  %78 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %79 = mul nsw i32 %78, %4
  %80 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %84 = atomicrmw add i32 addrspace(1)* %83, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %85

85:                                               ; preds = %77, %70
  %86 = mul nsw i32 %73, %2
  %87 = icmp uge i32 %24, %86
  %88 = add nuw nsw i32 %39, 4
  %89 = mul nsw i32 %88, %2
  %90 = icmp ult i32 %24, %89
  %91 = select i1 %87, i1 %90, i1 false
  br i1 %91, label %92, label %100

92:                                               ; preds = %85
  %93 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %94 = mul nsw i32 %93, %4
  %95 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %96 = add nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  %99 = atomicrmw add i32 addrspace(1)* %98, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %100

100:                                              ; preds = %92, %85
  %101 = add i32 %40, 4
  %102 = icmp eq i32 %101, %37
  br i1 %102, label %103, label %38, !llvm.loop !11

103:                                              ; preds = %100, %26
  %104 = phi i32 [ 0, %26 ], [ %88, %100 ]
  %105 = icmp eq i32 %34, 0
  br i1 %105, label %126, label %106

106:                                              ; preds = %103, %123
  %107 = phi i32 [ %111, %123 ], [ %104, %103 ]
  %108 = phi i32 [ %124, %123 ], [ 0, %103 ]
  %109 = mul nsw i32 %107, %2
  %110 = icmp uge i32 %24, %109
  %111 = add nuw nsw i32 %107, 1
  %112 = mul nsw i32 %111, %2
  %113 = icmp ult i32 %24, %112
  %114 = select i1 %110, i1 %113, i1 false
  br i1 %114, label %115, label %123

115:                                              ; preds = %106
  %116 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %117 = mul nsw i32 %116, %4
  %118 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %119 = add nsw i32 %117, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  %122 = atomicrmw add i32 addrspace(1)* %121, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %123

123:                                              ; preds = %115, %106
  %124 = add i32 %108, 1
  %125 = icmp eq i32 %124, %34
  br i1 %125, label %126, label %106, !llvm.loop !13

126:                                              ; preds = %103, %123, %5
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
