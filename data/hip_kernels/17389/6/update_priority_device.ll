; ModuleID = '../data/hip_kernels/17389/6/main.cu'
source_filename = "../data/hip_kernels/17389/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15update_priorityPiiPKiiS1_S1_(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %131

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = icmp sgt i32 %3, 0
  br i1 %21, label %22, label %131

22:                                               ; preds = %17
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %24 = and i32 %3, 7
  %25 = icmp ult i32 %3, 8
  br i1 %25, label %113, label %26

26:                                               ; preds = %22
  %27 = and i32 %3, -8
  br label %28

28:                                               ; preds = %109, %26
  %29 = phi i32 [ 0, %26 ], [ %110, %109 ]
  %30 = phi i32 [ 0, %26 ], [ %111, %109 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = icmp eq i32 %33, %20
  br i1 %34, label %35, label %39

35:                                               ; preds = %28
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %31
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = add nsw i32 %37, 1
  store i32 %38, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %28, %35
  %40 = or i32 %29, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = icmp eq i32 %43, %20
  br i1 %44, label %45, label %49

45:                                               ; preds = %39
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %41
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, 1
  store i32 %48, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %45, %39
  %50 = or i32 %29, 2
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = icmp eq i32 %53, %20
  br i1 %54, label %55, label %59

55:                                               ; preds = %49
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = add nsw i32 %57, 1
  store i32 %58, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %55, %49
  %60 = or i32 %29, 3
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %64 = icmp eq i32 %63, %20
  br i1 %64, label %65, label %69

65:                                               ; preds = %59
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %61
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = add nsw i32 %67, 1
  store i32 %68, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %65, %59
  %70 = or i32 %29, 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7
  %74 = icmp eq i32 %73, %20
  br i1 %74, label %75, label %79

75:                                               ; preds = %69
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %71
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7
  %78 = add nsw i32 %77, 1
  store i32 %78, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %75, %69
  %80 = or i32 %29, 5
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = icmp eq i32 %83, %20
  br i1 %84, label %85, label %89

85:                                               ; preds = %79
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %81
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %87, 1
  store i32 %88, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %85, %79
  %90 = or i32 %29, 6
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = icmp eq i32 %93, %20
  br i1 %94, label %95, label %99

95:                                               ; preds = %89
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %91
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = add nsw i32 %97, 1
  store i32 %98, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %95, %89
  %100 = or i32 %29, 7
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = icmp eq i32 %103, %20
  br i1 %104, label %105, label %109

105:                                              ; preds = %99
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %101
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7
  %108 = add nsw i32 %107, 1
  store i32 %108, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %109

109:                                              ; preds = %105, %99
  %110 = add nuw nsw i32 %29, 8
  %111 = add i32 %30, 8
  %112 = icmp eq i32 %111, %27
  br i1 %112, label %113, label %28, !llvm.loop !11

113:                                              ; preds = %109, %22
  %114 = phi i32 [ 0, %22 ], [ %110, %109 ]
  %115 = icmp eq i32 %24, 0
  br i1 %115, label %131, label %116

116:                                              ; preds = %113, %127
  %117 = phi i32 [ %128, %127 ], [ %114, %113 ]
  %118 = phi i32 [ %129, %127 ], [ 0, %113 ]
  %119 = zext i32 %117 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7
  %122 = icmp eq i32 %121, %20
  br i1 %122, label %123, label %127

123:                                              ; preds = %116
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %119
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %125, 1
  store i32 %126, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %127

127:                                              ; preds = %123, %116
  %128 = add nuw nsw i32 %117, 1
  %129 = add i32 %118, 1
  %130 = icmp eq i32 %129, %24
  br i1 %130, label %131, label %116, !llvm.loop !13

131:                                              ; preds = %113, %127, %17, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
