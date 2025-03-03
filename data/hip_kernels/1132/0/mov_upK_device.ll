; ModuleID = '../data/hip_kernels/1132/0/main.cu'
source_filename = "../data/hip_kernels/1132/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7mov_upKPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = icmp sgt i32 %2, 1
  br i1 %6, label %7, label %29

7:                                                ; preds = %3
  %8 = icmp eq i32 %4, 0
  %9 = mul nsw i32 %4, %1
  %10 = add nsw i32 %9, %5
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = sub i32 %5, %1
  %14 = add nsw i32 %13, %9
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  br label %17

17:                                               ; preds = %27, %7
  %18 = phi i32 [ %2, %7 ], [ %19, %27 ]
  %19 = add nsw i32 %18, -1
  br i1 %8, label %27, label %20

20:                                               ; preds = %17
  %21 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

23:                                               ; preds = %20
  %24 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  store i32 %21, i32 addrspace(1)* %16, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %12, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %26, %23, %20, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ugt i32 %18, 2
  br i1 %28, label %17, label %29, !llvm.loop !9

29:                                               ; preds = %27, %3
  %30 = icmp ne i32 %4, 0
  %31 = icmp slt i32 %5, %1
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %72

33:                                               ; preds = %29
  %34 = mul nsw i32 %4, %1
  %35 = add nsw i32 %34, %5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !5
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %72, label %40

40:                                               ; preds = %33
  %41 = add nsw i32 %4, -1
  %42 = mul nsw i32 %41, %1
  %43 = add nsw i32 %42, %5
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5
  %47 = icmp eq i32 %38, %46
  br i1 %47, label %48, label %68

48:                                               ; preds = %40
  %49 = add nuw nsw i32 %4, 1
  br label %50

50:                                               ; preds = %59, %48
  %51 = phi i32 [ %60, %59 ], [ 1, %48 ]
  %52 = sub nsw i32 %4, %51
  %53 = mul nsw i32 %52, %1
  %54 = add nsw i32 %53, %5
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5
  %58 = icmp eq i32 %38, %57
  br i1 %58, label %59, label %62

59:                                               ; preds = %50
  %60 = add nuw nsw i32 %51, 1
  %61 = icmp eq i32 %4, %51
  br i1 %61, label %62, label %50, !llvm.loop !11

62:                                               ; preds = %59, %50
  %63 = phi i32 [ %49, %59 ], [ %51, %50 ]
  %64 = and i32 %63, 1
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %72

66:                                               ; preds = %62
  %67 = shl nsw i32 %38, 1
  br label %70

68:                                               ; preds = %40
  %69 = icmp eq i32 %46, 0
  br i1 %69, label %70, label %72

70:                                               ; preds = %68, %66
  %71 = phi i32 [ %67, %66 ], [ %38, %68 ]
  store i32 %71, i32 addrspace(1)* %45, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %37, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %29, %33, %62, %68, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %6, label %73, label %95

73:                                               ; preds = %72
  %74 = icmp eq i32 %4, 0
  %75 = mul nsw i32 %4, %1
  %76 = add nsw i32 %75, %5
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = sub i32 %5, %1
  %80 = add nsw i32 %79, %75
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  br label %83

83:                                               ; preds = %93, %73
  %84 = phi i32 [ %2, %73 ], [ %85, %93 ]
  %85 = add nsw i32 %84, -1
  br i1 %74, label %93, label %86

86:                                               ; preds = %83
  %87 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %93, label %89

89:                                               ; preds = %86
  %90 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !5
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %93

92:                                               ; preds = %89
  store i32 %87, i32 addrspace(1)* %82, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %78, align 4, !tbaa !5
  br label %93

93:                                               ; preds = %92, %89, %86, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = icmp ugt i32 %84, 2
  br i1 %94, label %83, label %95, !llvm.loop !9

95:                                               ; preds = %93, %72
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
