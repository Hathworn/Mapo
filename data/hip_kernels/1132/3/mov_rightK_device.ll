; ModuleID = '../data/hip_kernels/1132/3/main.cu'
source_filename = "../data/hip_kernels/1132/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10mov_rightKPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %1, 1
  br i1 %7, label %8, label %29

8:                                                ; preds = %3
  %9 = icmp eq i32 %6, %5
  %10 = mul nsw i32 %4, %1
  %11 = add i32 %10, %5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = add i32 %11, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  br label %17

17:                                               ; preds = %26, %8
  %18 = phi i32 [ %6, %8 ], [ %27, %26 ]
  br i1 %9, label %26, label %19

19:                                               ; preds = %17
  %20 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %26, label %22

22:                                               ; preds = %19
  %23 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  store i32 %20, i32 addrspace(1)* %16, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %13, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %25, %22, %19, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = add nsw i32 %18, -1
  %28 = icmp ugt i32 %18, 1
  br i1 %28, label %17, label %29, !llvm.loop !9

29:                                               ; preds = %26, %3
  %30 = icmp ne i32 %6, %5
  %31 = icmp slt i32 %5, %1
  %32 = and i1 %31, %30
  br i1 %32, label %33, label %71

33:                                               ; preds = %29
  %34 = mul nsw i32 %4, %1
  %35 = add i32 %34, %5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !5
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %71, label %40

40:                                               ; preds = %33
  %41 = add i32 %35, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %45 = icmp eq i32 %38, %44
  br i1 %45, label %46, label %67

46:                                               ; preds = %40
  %47 = add nuw nsw i32 %5, 1
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %49, label %61

49:                                               ; preds = %46, %57
  %50 = phi i32 [ %59, %57 ], [ %47, %46 ]
  %51 = phi i32 [ %58, %57 ], [ 1, %46 ]
  %52 = add nsw i32 %50, %34
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5
  %56 = icmp eq i32 %38, %55
  br i1 %56, label %57, label %61

57:                                               ; preds = %49
  %58 = add nuw nsw i32 %51, 1
  %59 = add nuw nsw i32 %58, %5
  %60 = icmp slt i32 %59, %1
  br i1 %60, label %49, label %61, !llvm.loop !11

61:                                               ; preds = %57, %49, %46
  %62 = phi i32 [ 1, %46 ], [ %58, %57 ], [ %51, %49 ]
  %63 = and i32 %62, 1
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %71

65:                                               ; preds = %61
  %66 = shl nsw i32 %38, 1
  br label %69

67:                                               ; preds = %40
  %68 = icmp eq i32 %44, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %67, %65
  %70 = phi i32 [ %66, %65 ], [ %38, %67 ]
  store i32 %70, i32 addrspace(1)* %43, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %37, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %29, %33, %61, %67, %69
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %7, label %72, label %93

72:                                               ; preds = %71
  %73 = icmp eq i32 %6, %5
  %74 = mul nsw i32 %4, %1
  %75 = add i32 %74, %5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = add i32 %75, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  br label %81

81:                                               ; preds = %90, %72
  %82 = phi i32 [ %6, %72 ], [ %91, %90 ]
  br i1 %73, label %90, label %83

83:                                               ; preds = %81
  %84 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !5
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %90, label %86

86:                                               ; preds = %83
  %87 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %90

89:                                               ; preds = %86
  store i32 %84, i32 addrspace(1)* %80, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %77, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %89, %86, %83, %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = add nsw i32 %82, -1
  %92 = icmp ugt i32 %82, 1
  br i1 %92, label %81, label %93, !llvm.loop !9

93:                                               ; preds = %90, %71
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
