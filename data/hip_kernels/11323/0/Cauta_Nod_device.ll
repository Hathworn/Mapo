; ModuleID = '../data/hip_kernels/11323/0/main.cu'
source_filename = "../data/hip_kernels/11323/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Nod = type { i32, i8 }
%struct.Muchie = type { i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9Cauta_NodP3NodP6MuchiePiS3_S3_(%struct.Nod addrspace(1)* nocapture %0, %struct.Muchie addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %struct.Nod, %struct.Nod addrspace(1)* %0, i64 %7, i32 1
  %9 = load i8, i8 addrspace(1)* %8, align 4, !tbaa !5, !range !11, !amdgpu.noclobber !12
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %91

11:                                               ; preds = %5
  store i8 1, i8 addrspace(1)* %8, align 4, !tbaa !5
  %12 = getelementptr inbounds %struct.Nod, %struct.Nod addrspace(1)* %0, i64 %7, i32 0
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %7
  br label %14

14:                                               ; preds = %11, %88
  %15 = phi i32 [ 0, %11 ], [ %89, %88 ]
  %16 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !13
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds %struct.Nod, %struct.Nod addrspace(1)* %0, i64 %17, i32 0
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa.struct !13
  br label %20

20:                                               ; preds = %75, %14
  %21 = phi i32 [ 0, %14 ], [ %76, %75 ]
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %22, i32 0
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !16
  %25 = icmp eq i32 %24, %16
  br i1 %25, label %26, label %35

26:                                               ; preds = %20
  %27 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %22, i32 1
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !18
  %29 = icmp eq i32 %28, %19
  br i1 %29, label %30, label %35

30:                                               ; preds = %71, %61, %51, %41, %26
  %31 = phi i32 [ %21, %26 ], [ %36, %41 ], [ %46, %51 ], [ %56, %61 ], [ %66, %71 ]
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !14
  br label %78

35:                                               ; preds = %26, %20
  %36 = add nuw nsw i32 %21, 1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %37, i32 0
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16
  %40 = icmp eq i32 %39, %16
  br i1 %40, label %41, label %45

41:                                               ; preds = %35
  %42 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %37, i32 1
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !18
  %44 = icmp eq i32 %43, %19
  br i1 %44, label %30, label %45

45:                                               ; preds = %41, %35
  %46 = add nuw nsw i32 %21, 2
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %47, i32 0
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  %50 = icmp eq i32 %49, %16
  br i1 %50, label %51, label %55

51:                                               ; preds = %45
  %52 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %47, i32 1
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !18
  %54 = icmp eq i32 %53, %19
  br i1 %54, label %30, label %55

55:                                               ; preds = %51, %45
  %56 = add nuw nsw i32 %21, 3
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %57, i32 0
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16
  %60 = icmp eq i32 %59, %16
  br i1 %60, label %61, label %65

61:                                               ; preds = %55
  %62 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %57, i32 1
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !18
  %64 = icmp eq i32 %63, %19
  br i1 %64, label %30, label %65

65:                                               ; preds = %61, %55
  %66 = add nuw nsw i32 %21, 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %67, i32 0
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !16
  %70 = icmp eq i32 %69, %16
  br i1 %70, label %71, label %75

71:                                               ; preds = %65
  %72 = getelementptr inbounds %struct.Muchie, %struct.Muchie addrspace(1)* %1, i64 %67, i32 1
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !18
  %74 = icmp eq i32 %73, %19
  br i1 %74, label %30, label %75

75:                                               ; preds = %71, %65
  %76 = add nuw nsw i32 %21, 5
  %77 = icmp eq i32 %76, 500
  br i1 %77, label %78, label %20, !llvm.loop !19

78:                                               ; preds = %75, %30
  %79 = phi i32 [ %34, %30 ], [ 1000000, %75 ]
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %17
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !14
  %82 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !14
  %83 = add nsw i32 %82, %79
  %84 = icmp sgt i32 %81, %83
  %85 = icmp slt i32 %79, 1000000
  %86 = and i1 %85, %84
  br i1 %86, label %87, label %88

87:                                               ; preds = %78
  store i32 %83, i32 addrspace(1)* %80, align 4, !tbaa !14
  br label %88

88:                                               ; preds = %87, %78
  %89 = add nuw nsw i32 %15, 1
  %90 = icmp eq i32 %89, 500
  br i1 %90, label %91, label %14, !llvm.loop !21

91:                                               ; preds = %88, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !10, i64 4}
!6 = !{!"_ZTS3Nod", !7, i64 0, !10, i64 4}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!"bool", !8, i64 0}
!11 = !{i8 0, i8 2}
!12 = !{}
!13 = !{i64 0, i64 4, !14, i64 4, i64 1, !15}
!14 = !{!7, !7, i64 0}
!15 = !{!10, !10, i64 0}
!16 = !{!17, !7, i64 0}
!17 = !{!"_ZTS6Muchie", !7, i64 0, !7, i64 4}
!18 = !{!17, !7, i64 4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
