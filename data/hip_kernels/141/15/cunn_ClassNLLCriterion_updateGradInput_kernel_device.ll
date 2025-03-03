; ModuleID = '../data/hip_kernels/141/15/main.cu'
source_filename = "../data/hip_kernels/141/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z45cunn_ClassNLLCriterion_updateGradInput_kernelPfS_iifi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %9, label %96

9:                                                ; preds = %6
  %10 = icmp sgt i32 %5, 0
  %11 = and i32 %5, 3
  %12 = icmp ult i32 %5, 4
  %13 = and i32 %5, -4
  %14 = icmp eq i32 %11, 0
  br label %15

15:                                               ; preds = %9, %93
  %16 = phi i32 [ %7, %9 ], [ %94, %93 ]
  br i1 %10, label %17, label %93

17:                                               ; preds = %15
  %18 = mul nsw i32 %16, %5
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, -1
  br i1 %12, label %74, label %21

21:                                               ; preds = %17, %70
  %22 = phi i32 [ %71, %70 ], [ 0, %17 ]
  %23 = phi i32 [ %72, %70 ], [ 0, %17 ]
  %24 = add nsw i32 %22, %18
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = fptosi float %27 to i32
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %21
  %31 = add i32 %20, %28
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float %4, float addrspace(1)* %33, align 4, !tbaa !5
  br label %34

34:                                               ; preds = %21, %30
  %35 = or i32 %22, 1
  %36 = add nsw i32 %35, %18
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %40 = fptosi float %39 to i32
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %46

42:                                               ; preds = %34
  %43 = add i32 %20, %40
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float %4, float addrspace(1)* %45, align 4, !tbaa !5
  br label %46

46:                                               ; preds = %42, %34
  %47 = or i32 %22, 2
  %48 = add nsw i32 %47, %18
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = fptosi float %51 to i32
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %46
  %55 = add i32 %20, %52
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  store float %4, float addrspace(1)* %57, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %54, %46
  %59 = or i32 %22, 3
  %60 = add nsw i32 %59, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %64 = fptosi float %63 to i32
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %66, label %70

66:                                               ; preds = %58
  %67 = add i32 %20, %64
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %4, float addrspace(1)* %69, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %66, %58
  %71 = add nuw nsw i32 %22, 4
  %72 = add i32 %23, 4
  %73 = icmp eq i32 %72, %13
  br i1 %73, label %74, label %21, !llvm.loop !9

74:                                               ; preds = %70, %17
  %75 = phi i32 [ 0, %17 ], [ %71, %70 ]
  br i1 %14, label %93, label %76

76:                                               ; preds = %74, %89
  %77 = phi i32 [ %90, %89 ], [ %75, %74 ]
  %78 = phi i32 [ %91, %89 ], [ 0, %74 ]
  %79 = add nsw i32 %77, %18
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fptosi float %82 to i32
  %84 = icmp sgt i32 %83, 0
  br i1 %84, label %85, label %89

85:                                               ; preds = %76
  %86 = add i32 %20, %83
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %4, float addrspace(1)* %88, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %85, %76
  %90 = add nuw nsw i32 %77, 1
  %91 = add i32 %78, 1
  %92 = icmp eq i32 %91, %11
  br i1 %92, label %93, label %76, !llvm.loop !11

93:                                               ; preds = %74, %89, %15
  %94 = add nuw nsw i32 %16, 32
  %95 = icmp slt i32 %94, %2
  br i1 %95, label %15, label %96, !llvm.loop !13

96:                                               ; preds = %93, %6
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !10}
