; ModuleID = '../data/hip_kernels/1132/1/main.cu'
source_filename = "../data/hip_kernels/1132/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9mov_downKPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = add nsw i32 %2, -1
  %7 = icmp sgt i32 %2, 1
  br i1 %7, label %8, label %31

8:                                                ; preds = %3
  %9 = icmp eq i32 %6, %4
  %10 = mul nsw i32 %4, %1
  %11 = add nsw i32 %10, %5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = add nuw nsw i32 %4, 1
  %15 = mul nsw i32 %14, %1
  %16 = add nsw i32 %15, %5
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  br label %19

19:                                               ; preds = %28, %8
  %20 = phi i32 [ %6, %8 ], [ %29, %28 ]
  br i1 %9, label %28, label %21

21:                                               ; preds = %19
  %22 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %21
  %25 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  store i32 %22, i32 addrspace(1)* %18, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %13, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %27, %24, %21, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = add nsw i32 %20, -1
  %30 = icmp ugt i32 %20, 1
  br i1 %30, label %19, label %31, !llvm.loop !9

31:                                               ; preds = %28, %3
  %32 = icmp ne i32 %6, %4
  %33 = icmp slt i32 %5, %1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %75

35:                                               ; preds = %31
  %36 = mul nsw i32 %4, %1
  %37 = add nsw i32 %36, %5
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !5
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %75, label %42

42:                                               ; preds = %35
  %43 = add nuw nsw i32 %4, 1
  %44 = mul nsw i32 %43, %1
  %45 = add nsw i32 %44, %5
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !5
  %49 = icmp eq i32 %40, %48
  br i1 %49, label %50, label %71

50:                                               ; preds = %42
  %51 = icmp slt i32 %4, %2
  br i1 %51, label %52, label %65

52:                                               ; preds = %50, %61
  %53 = phi i32 [ %63, %61 ], [ %43, %50 ]
  %54 = phi i32 [ %62, %61 ], [ 1, %50 ]
  %55 = mul nsw i32 %53, %1
  %56 = add nsw i32 %55, %5
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !5
  %60 = icmp eq i32 %40, %59
  br i1 %60, label %61, label %65

61:                                               ; preds = %52
  %62 = add nuw nsw i32 %54, 1
  %63 = add nuw nsw i32 %62, %4
  %64 = icmp sgt i32 %63, %2
  br i1 %64, label %65, label %52, !llvm.loop !11

65:                                               ; preds = %61, %52, %50
  %66 = phi i32 [ 1, %50 ], [ %62, %61 ], [ %54, %52 ]
  %67 = and i32 %66, 1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %75

69:                                               ; preds = %65
  %70 = shl nsw i32 %40, 1
  br label %73

71:                                               ; preds = %42
  %72 = icmp eq i32 %48, 0
  br i1 %72, label %73, label %75

73:                                               ; preds = %71, %69
  %74 = phi i32 [ %70, %69 ], [ %40, %71 ]
  store i32 %74, i32 addrspace(1)* %47, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %31, %35, %65, %71, %73
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %7, label %76, label %99

76:                                               ; preds = %75
  %77 = icmp eq i32 %6, %4
  %78 = mul nsw i32 %4, %1
  %79 = add nsw i32 %78, %5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = add nuw nsw i32 %4, 1
  %83 = mul nsw i32 %82, %1
  %84 = add nsw i32 %83, %5
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  br label %87

87:                                               ; preds = %96, %76
  %88 = phi i32 [ %6, %76 ], [ %97, %96 ]
  br i1 %77, label %96, label %89

89:                                               ; preds = %87
  %90 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %96, label %92

92:                                               ; preds = %89
  %93 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %96

95:                                               ; preds = %92
  store i32 %90, i32 addrspace(1)* %86, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %81, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %95, %92, %89, %87
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = add nsw i32 %88, -1
  %98 = icmp ugt i32 %88, 1
  br i1 %98, label %87, label %99, !llvm.loop !9

99:                                               ; preds = %96, %75
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
