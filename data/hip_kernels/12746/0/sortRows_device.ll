; ModuleID = '../data/hip_kernels/12746/0/main.cu'
source_filename = "../data/hip_kernels/12746/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8sortRowsPiiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %1
  %15 = icmp sgt i32 %2, 0
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %83

17:                                               ; preds = %4
  %18 = mul nsw i32 %13, %2
  %19 = add nsw i32 %2, -1
  br label %20

20:                                               ; preds = %17, %80
  %21 = phi i32 [ 0, %17 ], [ %81, %80 ]
  %22 = icmp slt i32 %21, %2
  br i1 %22, label %23, label %34

23:                                               ; preds = %20, %31
  %24 = phi i32 [ %32, %31 ], [ %21, %20 ]
  %25 = add nsw i32 %24, %18
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7
  %29 = sub nsw i32 %3, %28
  %30 = icmp sgt i32 %29, 10010000
  br i1 %30, label %34, label %31

31:                                               ; preds = %23
  %32 = add nsw i32 %24, 1
  %33 = icmp slt i32 %32, %2
  br i1 %33, label %23, label %34, !llvm.loop !11

34:                                               ; preds = %23, %31, %20
  %35 = phi i32 [ -1, %20 ], [ -1, %31 ], [ %24, %23 ]
  br label %36

36:                                               ; preds = %40, %34
  %37 = phi i32 [ %35, %34 ], [ %38, %40 ]
  %38 = add nsw i32 %37, 1
  %39 = icmp slt i32 %38, %2
  br i1 %39, label %40, label %47

40:                                               ; preds = %36
  %41 = add nsw i32 %38, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = sub nsw i32 %3, %44
  %46 = icmp slt i32 %45, 10010001
  br i1 %46, label %47, label %36, !llvm.loop !13

47:                                               ; preds = %36, %40
  %48 = phi i32 [ %19, %36 ], [ %37, %40 ]
  %49 = icmp slt i32 %35, 0
  br i1 %49, label %83, label %50

50:                                               ; preds = %47
  %51 = add nsw i32 %35, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = sub nsw i32 %48, %35
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %80

56:                                               ; preds = %50
  %57 = icmp eq i32 %54, 1
  %58 = add nsw i32 %54, -2
  br label %59

59:                                               ; preds = %63, %56
  %60 = phi i32 [ 0, %56 ], [ %64, %63 ]
  br i1 %57, label %63, label %61

61:                                               ; preds = %59
  %62 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  br label %66

63:                                               ; preds = %77, %59
  %64 = add nuw nsw i32 %60, 1
  %65 = icmp eq i32 %64, %54
  br i1 %65, label %80, label %59, !llvm.loop !14

66:                                               ; preds = %77, %61
  %67 = phi i32 [ %78, %77 ], [ %62, %61 ]
  %68 = phi i32 [ %69, %77 ], [ 0, %61 ]
  %69 = add nuw nsw i32 %68, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %53, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = icmp sgt i32 %67, %72
  br i1 %73, label %74, label %77

74:                                               ; preds = %66
  %75 = zext i32 %68 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %53, i64 %75
  store i32 %72, i32 addrspace(1)* %76, align 4, !tbaa !7
  store i32 %67, i32 addrspace(1)* %71, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %74, %66
  %78 = phi i32 [ %72, %66 ], [ %67, %74 ]
  %79 = icmp eq i32 %68, %58
  br i1 %79, label %63, label %66, !llvm.loop !15

80:                                               ; preds = %63, %50
  %81 = add nsw i32 %48, 1
  %82 = icmp slt i32 %48, %2
  br i1 %82, label %20, label %83, !llvm.loop !16

83:                                               ; preds = %47, %80, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
