; ModuleID = '../data/hip_kernels/151/2/main.cu'
source_filename = "../data/hip_kernels/151/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque

@texA = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cuInsertionSortPfiiii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %1
  br i1 %15, label %16, label %110

16:                                               ; preds = %5
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = mul nsw i32 %4, %2
  %20 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %21 = icmp sgt i32 %19, %2
  br i1 %21, label %22, label %25

22:                                               ; preds = %16
  %23 = sext i32 %2 to i64
  %24 = sub nsw i64 0, %23
  br label %37

25:                                               ; preds = %70, %16
  %26 = phi float [ %20, %16 ], [ %71, %70 ]
  %27 = mul nsw i32 %3, %2
  %28 = icmp slt i32 %19, %27
  br i1 %28, label %29, label %110

29:                                               ; preds = %25
  %30 = icmp sgt i32 %19, 0
  %31 = add nsw i32 %4, -1
  %32 = mul nsw i32 %31, %2
  %33 = sext i32 %2 to i64
  %34 = sub nsw i64 0, %33
  %35 = sext i32 %32 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %18, i64 %35
  br label %74

37:                                               ; preds = %22, %70
  %38 = phi float [ %20, %22 ], [ %71, %70 ]
  %39 = phi i32 [ %2, %22 ], [ %72, %70 ]
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %18, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fcmp contract olt float %42, %38
  br i1 %43, label %44, label %70

44:                                               ; preds = %37
  %45 = icmp sgt i32 %39, 0
  br i1 %45, label %46, label %55

46:                                               ; preds = %44, %52
  %47 = phi i32 [ %53, %52 ], [ 0, %44 ]
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %18, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fcmp contract ugt float %50, %42
  br i1 %51, label %55, label %52

52:                                               ; preds = %46
  %53 = add nsw i32 %47, %2
  %54 = icmp slt i32 %53, %39
  br i1 %54, label %46, label %55, !llvm.loop !11

55:                                               ; preds = %46, %52, %44
  %56 = phi i32 [ 0, %44 ], [ %47, %46 ], [ %53, %52 ]
  %57 = icmp sgt i32 %39, %56
  br i1 %57, label %58, label %66

58:                                               ; preds = %55, %58
  %59 = phi i32 [ %64, %58 ], [ %39, %55 ]
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %18, i64 %60
  %62 = getelementptr inbounds float, float addrspace(1)* %61, i64 %24
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  %64 = sub nsw i32 %59, %2
  %65 = icmp sgt i32 %64, %56
  br i1 %65, label %58, label %66, !llvm.loop !13

66:                                               ; preds = %58, %55
  %67 = sext i32 %56 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %18, i64 %67
  store float %42, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %66, %37
  %71 = phi float [ %69, %66 ], [ %42, %37 ]
  %72 = add nsw i32 %39, %2
  %73 = icmp slt i32 %72, %19
  br i1 %73, label %37, label %25, !llvm.loop !14

74:                                               ; preds = %29, %106
  %75 = phi i32 [ %19, %29 ], [ %108, %106 ]
  %76 = phi float [ %26, %29 ], [ %107, %106 ]
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %18, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fcmp contract olt float %79, %76
  br i1 %80, label %81, label %106

81:                                               ; preds = %74
  br i1 %30, label %82, label %91

82:                                               ; preds = %81, %88
  %83 = phi i32 [ %89, %88 ], [ 0, %81 ]
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %18, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fcmp contract ugt float %86, %79
  br i1 %87, label %91, label %88

88:                                               ; preds = %82
  %89 = add nsw i32 %83, %2
  %90 = icmp slt i32 %89, %19
  br i1 %90, label %82, label %91, !llvm.loop !15

91:                                               ; preds = %82, %88, %81
  %92 = phi i32 [ 0, %81 ], [ %83, %82 ], [ %89, %88 ]
  %93 = icmp sgt i32 %32, %92
  br i1 %93, label %94, label %102

94:                                               ; preds = %91, %94
  %95 = phi i32 [ %100, %94 ], [ %32, %91 ]
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %18, i64 %96
  %98 = getelementptr inbounds float, float addrspace(1)* %97, i64 %34
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  store float %99, float addrspace(1)* %97, align 4, !tbaa !7
  %100 = sub nsw i32 %95, %2
  %101 = icmp sgt i32 %100, %92
  br i1 %101, label %94, label %102, !llvm.loop !16

102:                                              ; preds = %94, %91
  %103 = sext i32 %92 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %18, i64 %103
  store float %79, float addrspace(1)* %104, align 4, !tbaa !7
  %105 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  br label %106

106:                                              ; preds = %74, %102
  %107 = phi float [ %105, %102 ], [ %76, %74 ]
  %108 = add nsw i32 %75, %2
  %109 = icmp slt i32 %108, %27
  br i1 %109, label %74, label %110, !llvm.loop !17

110:                                              ; preds = %106, %25, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
