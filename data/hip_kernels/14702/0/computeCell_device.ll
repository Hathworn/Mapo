; ModuleID = '../data/hip_kernels/14702/0/main.cu'
source_filename = "../data/hip_kernels/14702/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11computeCellPcPjS0_(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !4
  %5 = icmp ugt i32 %4, 1
  br i1 %5, label %6, label %87

6:                                                ; preds = %3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !8
  %8 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  br label %11

11:                                               ; preds = %6, %83
  %12 = phi i32 [ 1, %6 ], [ %84, %83 ]
  %13 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  %14 = icmp ult i32 %7, %13
  br i1 %14, label %15, label %83

15:                                               ; preds = %11
  %16 = add nsw i32 %12, -1
  %17 = load i16, i16 addrspace(4)* %10, align 4, !range !9, !invariant.load !10
  %18 = zext i16 %17 to i32
  br label %19

19:                                               ; preds = %15, %79
  %20 = phi i32 [ %13, %15 ], [ %80, %79 ]
  %21 = phi i32 [ %7, %15 ], [ %81, %79 ]
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %25, label %23

23:                                               ; preds = %19
  %24 = mul i32 %20, %16
  br label %32

25:                                               ; preds = %19
  %26 = add nsw i32 %21, -1
  %27 = mul i32 %20, %16
  %28 = add i32 %26, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !11
  br label %32

32:                                               ; preds = %23, %25
  %33 = phi i32 [ %24, %23 ], [ %27, %25 ]
  %34 = phi i8 [ 0, %23 ], [ %31, %25 ]
  %35 = add i32 %33, %21
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !11
  %39 = add nsw i32 %21, 1
  %40 = icmp ult i32 %39, %20
  br i1 %40, label %41, label %46

41:                                               ; preds = %32
  %42 = add i32 %33, %39
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !11
  br label %46

46:                                               ; preds = %32, %41
  %47 = phi i8 [ %45, %41 ], [ 0, %32 ]
  %48 = mul i32 %20, %12
  %49 = add i32 %48, %21
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = icmp eq i8 %34, 0
  %53 = icmp eq i8 %38, 0
  %54 = select i1 %52, i1 %53, i1 false
  %55 = icmp eq i8 %47, 0
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %76, label %57

57:                                               ; preds = %46
  %58 = icmp eq i8 %47, 1
  %59 = select i1 %54, i1 %58, i1 false
  br i1 %59, label %76, label %60

60:                                               ; preds = %57
  %61 = icmp eq i8 %38, 1
  %62 = select i1 %52, i1 %61, i1 false
  %63 = icmp ult i8 %47, 2
  %64 = select i1 %62, i1 %63, i1 false
  br i1 %64, label %76, label %65

65:                                               ; preds = %60
  %66 = icmp eq i8 %34, 1
  %67 = select i1 %66, i1 %53, i1 false
  %68 = select i1 %67, i1 %55, i1 false
  br i1 %68, label %76, label %69

69:                                               ; preds = %65
  %70 = select i1 %67, i1 %58, i1 false
  br i1 %70, label %76, label %71

71:                                               ; preds = %69
  %72 = select i1 %66, i1 %61, i1 false
  %73 = select i1 %72, i1 %55, i1 false
  br i1 %73, label %76, label %74

74:                                               ; preds = %71
  %75 = select i1 %72, i1 %58, i1 false
  br i1 %75, label %76, label %79

76:                                               ; preds = %74, %71, %69, %65, %60, %57, %46
  %77 = phi i8 [ 0, %46 ], [ 1, %57 ], [ 1, %60 ], [ 0, %65 ], [ 1, %69 ], [ 1, %71 ], [ 0, %74 ]
  store i8 %77, i8 addrspace(1)* %51, align 1, !tbaa !11
  %78 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4
  br label %79

79:                                               ; preds = %74, %76
  %80 = phi i32 [ %20, %74 ], [ %78, %76 ]
  %81 = add i32 %21, %18
  %82 = icmp ult i32 %81, %80
  br i1 %82, label %19, label %83, !llvm.loop !12

83:                                               ; preds = %79, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = add nuw nsw i32 %12, 1
  %85 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !4
  %86 = icmp ult i32 %84, %85
  br i1 %86, label %11, label %87, !llvm.loop !14

87:                                               ; preds = %83, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i32 0, i32 1024}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!6, !6, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
