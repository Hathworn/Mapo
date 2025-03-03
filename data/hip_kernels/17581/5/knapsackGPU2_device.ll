; ModuleID = '../data/hip_kernels/17581/5/main.cu'
source_filename = "../data/hip_kernels/17581/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12knapsackGPU2PiS_S_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %4, 0
  br i1 %15, label %63, label %16

16:                                               ; preds = %5
  %17 = add nsw i32 %3, 1
  %18 = icmp sle i32 %14, %17
  %19 = icmp sgt i32 %14, 0
  %20 = and i1 %18, %19
  %21 = icmp eq i32 %14, 0
  %22 = sext i32 %14 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  store i32 0, i32 addrspace(1)* %23, align 4, !tbaa !7
  %24 = icmp eq i32 %4, 0
  br i1 %24, label %63, label %25

25:                                               ; preds = %16
  %26 = and i32 %4, 1
  %27 = icmp eq i32 %4, 1
  br i1 %27, label %30, label %28

28:                                               ; preds = %25
  %29 = and i32 %4, -2
  br label %64

30:                                               ; preds = %126, %25
  %31 = phi i32 [ 1, %25 ], [ %127, %126 ]
  %32 = icmp eq i32 %26, 0
  br i1 %32, label %63, label %33

33:                                               ; preds = %30
  %34 = mul nsw i32 %31, %17
  %35 = add nsw i32 %34, %14
  br i1 %20, label %36, label %59

36:                                               ; preds = %33
  %37 = add nsw i32 %31, -1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = icmp slt i32 %14, %40
  %42 = sub nsw i32 %35, %17
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  br i1 %41, label %55, label %46

46:                                               ; preds = %36
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = sub nsw i32 %42, %40
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %53 = add nsw i32 %52, %48
  %54 = tail call i32 @llvm.smax.i32(i32 %45, i32 %53)
  br label %55

55:                                               ; preds = %46, %36
  %56 = phi i32 [ %54, %46 ], [ %45, %36 ]
  %57 = sext i32 %35 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %57
  store i32 %56, i32 addrspace(1)* %58, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %55, %33
  br i1 %21, label %60, label %63

60:                                               ; preds = %59
  %61 = sext i32 %35 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 0, i32 addrspace(1)* %62, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %30, %60, %59, %16, %5
  ret void

64:                                               ; preds = %126, %28
  %65 = phi i32 [ 1, %28 ], [ %127, %126 ]
  %66 = phi i32 [ 0, %28 ], [ %128, %126 ]
  %67 = mul nsw i32 %65, %17
  %68 = add nsw i32 %67, %14
  br i1 %20, label %69, label %92

69:                                               ; preds = %64
  %70 = add nsw i32 %65, -1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7
  %74 = icmp slt i32 %14, %73
  %75 = sub nsw i32 %68, %17
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7
  br i1 %74, label %88, label %79

79:                                               ; preds = %69
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = sub nsw i32 %75, %73
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %85, %81
  %87 = tail call i32 @llvm.smax.i32(i32 %78, i32 %86)
  br label %88

88:                                               ; preds = %69, %79
  %89 = phi i32 [ %87, %79 ], [ %78, %69 ]
  %90 = sext i32 %68 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %90
  store i32 %89, i32 addrspace(1)* %91, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %88, %64
  br i1 %21, label %93, label %96

93:                                               ; preds = %92
  %94 = sext i32 %68 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %94
  store i32 0, i32 addrspace(1)* %95, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %92, %93
  %97 = add nuw i32 %65, 1
  %98 = mul nsw i32 %97, %17
  %99 = add nsw i32 %98, %14
  br i1 %20, label %100, label %122

100:                                              ; preds = %96
  %101 = sext i32 %65 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = icmp slt i32 %14, %103
  %105 = sub nsw i32 %99, %17
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7
  br i1 %104, label %118, label %109

109:                                              ; preds = %100
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = sub nsw i32 %105, %103
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7
  %116 = add nsw i32 %115, %111
  %117 = tail call i32 @llvm.smax.i32(i32 %108, i32 %116)
  br label %118

118:                                              ; preds = %109, %100
  %119 = phi i32 [ %117, %109 ], [ %108, %100 ]
  %120 = sext i32 %99 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %120
  store i32 %119, i32 addrspace(1)* %121, align 4, !tbaa !7
  br label %122

122:                                              ; preds = %118, %96
  br i1 %21, label %123, label %126

123:                                              ; preds = %122
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  store i32 0, i32 addrspace(1)* %125, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %123, %122
  %127 = add nuw i32 %65, 2
  %128 = add i32 %66, 2
  %129 = icmp eq i32 %128, %29
  br i1 %129, label %30, label %64, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.peeled.count", i32 1}
