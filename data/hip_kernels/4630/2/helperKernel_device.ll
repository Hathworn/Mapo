; ModuleID = '../data/hip_kernels/4630/2/main.cu'
source_filename = "../data/hip_kernels/4630/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12helperKernelPcPiili(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i64 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = sub nsw i32 %2, %4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %28

20:                                               ; preds = %5
  %21 = udiv i32 %14, %11
  %22 = mul i32 %21, %11
  %23 = icmp ugt i32 %14, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %11
  %27 = icmp sgt i32 %4, 1
  br label %29

28:                                               ; preds = %118, %5
  ret void

29:                                               ; preds = %20, %118
  %30 = phi i32 [ %17, %20 ], [ %126, %118 ]
  %31 = add nsw i32 %30, %4
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !16
  %35 = sext i32 %31 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !16
  %38 = icmp eq i8 %34, %37
  br i1 %38, label %39, label %96

39:                                               ; preds = %29
  %40 = add nsw i32 %30, 1
  %41 = mul nsw i32 %40, %2
  %42 = add nsw i32 %31, -1
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !19
  %47 = shl nsw i32 %46, 1
  %48 = mul nsw i32 %30, %2
  %49 = add nsw i32 %48, %31
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  store i32 %47, i32 addrspace(1)* %51, align 4, !tbaa !19
  br i1 %27, label %52, label %63

52:                                               ; preds = %39
  %53 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !16
  br label %54

54:                                               ; preds = %52, %60
  %55 = phi i32 [ %40, %52 ], [ %61, %60 ]
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !16
  %59 = icmp eq i8 %58, %53
  br i1 %59, label %63, label %60

60:                                               ; preds = %54
  %61 = add nsw i32 %55, 1
  %62 = icmp slt i32 %61, %31
  br i1 %62, label %54, label %63, !llvm.loop !21

63:                                               ; preds = %54, %60, %39
  %64 = phi i32 [ %40, %39 ], [ %55, %54 ], [ %61, %60 ]
  %65 = icmp slt i32 %64, %31
  br i1 %65, label %66, label %78

66:                                               ; preds = %63
  %67 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !16
  %68 = add i32 %64, -1
  br label %69

69:                                               ; preds = %66, %75
  %70 = phi i32 [ %42, %66 ], [ %76, %75 ]
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !16
  %74 = icmp ne i8 %73, %67
  br i1 %74, label %75, label %78

75:                                               ; preds = %69
  %76 = add nsw i32 %70, -1
  %77 = icmp slt i32 %64, %70
  br i1 %77, label %69, label %78, !llvm.loop !23

78:                                               ; preds = %69, %75, %63
  %79 = phi i32 [ %42, %63 ], [ %70, %69 ], [ %68, %75 ]
  %80 = phi i1 [ true, %63 ], [ %74, %75 ], [ %74, %69 ]
  %81 = icmp eq i32 %64, %79
  br i1 %81, label %82, label %84

82:                                               ; preds = %78
  %83 = add nuw nsw i32 %47, 1
  store i32 %83, i32 addrspace(1)* %51, align 4, !tbaa !19
  br label %118

84:                                               ; preds = %78
  br i1 %80, label %85, label %87

85:                                               ; preds = %84
  %86 = add nsw i32 %47, 2
  store i32 %86, i32 addrspace(1)* %51, align 4, !tbaa !19
  br label %118

87:                                               ; preds = %84
  %88 = add nsw i32 %64, 1
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %79, -1
  %91 = add nsw i32 %90, %89
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !19
  %95 = sub nsw i32 %47, %94
  store i32 %95, i32 addrspace(1)* %51, align 4, !tbaa !19
  br label %118

96:                                               ; preds = %29
  %97 = mul nsw i32 %30, %2
  %98 = add nsw i32 %31, -1
  %99 = add nsw i32 %98, %97
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !19
  %103 = add nsw i32 %30, 1
  %104 = mul nsw i32 %103, %2
  %105 = add nsw i32 %104, %31
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !19
  %109 = add nsw i32 %108, %102
  %110 = add nsw i32 %104, %98
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !19
  %114 = sub i32 %109, %113
  %115 = add nsw i32 %97, %31
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  store i32 %114, i32 addrspace(1)* %117, align 4, !tbaa !19
  br label %118

118:                                              ; preds = %82, %87, %85, %96
  %119 = phi i32 [ %83, %82 ], [ %95, %87 ], [ %86, %85 ], [ %114, %96 ]
  %120 = phi i64 [ %50, %82 ], [ %50, %87 ], [ %50, %85 ], [ %116, %96 ]
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  %122 = sext i32 %119 to i64
  %123 = add nsw i64 %122, %3
  %124 = srem i64 %123, %3
  %125 = trunc i64 %124 to i32
  store i32 %125, i32 addrspace(1)* %121, align 4, !tbaa !19
  %126 = add i32 %26, %30
  %127 = icmp slt i32 %126, %18
  br i1 %127, label %29, label %28, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
!24 = distinct !{!24, !22}
