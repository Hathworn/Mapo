; ModuleID = '../data/hip_kernels/1132/2/main.cu'
source_filename = "../data/hip_kernels/1132/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9mov_leftKPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = icmp sgt i32 %1, 1
  br i1 %6, label %7, label %28

7:                                                ; preds = %3
  %8 = icmp eq i32 %5, 0
  %9 = mul nsw i32 %4, %1
  %10 = add i32 %9, %5
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = add nsw i32 %10, -1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  br label %16

16:                                               ; preds = %26, %7
  %17 = phi i32 [ %1, %7 ], [ %18, %26 ]
  %18 = add nsw i32 %17, -1
  br i1 %8, label %26, label %19

19:                                               ; preds = %16
  %20 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %26, label %22

22:                                               ; preds = %19
  %23 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  store i32 %20, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %12, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %25, %22, %19, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp ugt i32 %17, 2
  br i1 %27, label %16, label %28, !llvm.loop !9

28:                                               ; preds = %26, %3
  %29 = icmp ne i32 %5, 0
  %30 = icmp slt i32 %5, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %67

32:                                               ; preds = %28
  %33 = mul nsw i32 %4, %1
  %34 = add i32 %33, %5
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %67, label %39

39:                                               ; preds = %32
  %40 = add nsw i32 %34, -1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5
  %44 = icmp eq i32 %37, %43
  br i1 %44, label %45, label %63

45:                                               ; preds = %39
  %46 = add nuw nsw i32 %5, 1
  br label %47

47:                                               ; preds = %54, %45
  %48 = phi i32 [ 1, %45 ], [ %55, %54 ]
  %49 = sub i32 %34, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5
  %53 = icmp eq i32 %37, %52
  br i1 %53, label %54, label %57

54:                                               ; preds = %47
  %55 = add nuw nsw i32 %48, 1
  %56 = icmp eq i32 %48, %5
  br i1 %56, label %57, label %47, !llvm.loop !11

57:                                               ; preds = %54, %47
  %58 = phi i32 [ %46, %54 ], [ %48, %47 ]
  %59 = and i32 %58, 1
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %67

61:                                               ; preds = %57
  %62 = shl nsw i32 %37, 1
  br label %65

63:                                               ; preds = %39
  %64 = icmp eq i32 %43, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %63, %61
  %66 = phi i32 [ %62, %61 ], [ %37, %63 ]
  store i32 %66, i32 addrspace(1)* %42, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %36, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %28, %32, %57, %63, %65
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %6, label %68, label %89

68:                                               ; preds = %67
  %69 = icmp eq i32 %5, 0
  %70 = mul nsw i32 %4, %1
  %71 = add i32 %70, %5
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = add nsw i32 %71, -1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  br label %77

77:                                               ; preds = %87, %68
  %78 = phi i32 [ %1, %68 ], [ %79, %87 ]
  %79 = add nsw i32 %78, -1
  br i1 %69, label %87, label %80

80:                                               ; preds = %77
  %81 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !5
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %87, label %83

83:                                               ; preds = %80
  %84 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %87

86:                                               ; preds = %83
  store i32 %81, i32 addrspace(1)* %76, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %73, align 4, !tbaa !5
  br label %87

87:                                               ; preds = %86, %83, %80, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = icmp ugt i32 %78, 2
  br i1 %88, label %77, label %89, !llvm.loop !9

89:                                               ; preds = %87, %67
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
