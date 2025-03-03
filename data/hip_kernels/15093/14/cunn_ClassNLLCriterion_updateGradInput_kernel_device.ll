; ModuleID = '../data/hip_kernels/15093/14/main.cu'
source_filename = "../data/hip_kernels/15093/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z45cunn_ClassNLLCriterion_updateGradInput_kernelPfS_iifiS_b(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, i32 %5, float addrspace(1)* nocapture readonly %6, i1 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp slt i32 %9, %2
  br i1 %10, label %11, label %91

11:                                               ; preds = %8
  %12 = icmp sgt i32 %5, 0
  %13 = and i32 %5, 1
  %14 = icmp eq i32 %5, 1
  %15 = and i32 %5, -2
  %16 = icmp eq i32 %13, 0
  br label %17

17:                                               ; preds = %11, %88
  %18 = phi i32 [ %9, %11 ], [ %89, %88 ]
  br i1 %12, label %19, label %88

19:                                               ; preds = %17
  %20 = mul nsw i32 %18, %5
  %21 = mul nsw i32 %18, %3
  br i1 %14, label %67, label %22

22:                                               ; preds = %19, %63
  %23 = phi i32 [ %64, %63 ], [ 0, %19 ]
  %24 = phi i32 [ %65, %63 ], [ 0, %19 ]
  %25 = add nsw i32 %23, %20
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5
  %29 = fptosi float %28 to i32
  %30 = add nsw i32 %29, -1
  %31 = icmp sgt i32 %29, 0
  br i1 %31, label %32, label %43

32:                                               ; preds = %22
  br i1 %7, label %33, label %38

33:                                               ; preds = %32
  %34 = zext i32 %30 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %6, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = fmul contract float %36, %4
  br label %38

38:                                               ; preds = %32, %33
  %39 = phi float [ %37, %33 ], [ %4, %32 ]
  %40 = add nsw i32 %30, %21
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %39, float addrspace(1)* %42, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %38, %22
  %44 = or i32 %23, 1
  %45 = add nsw i32 %44, %20
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = fptosi float %48 to i32
  %50 = add nsw i32 %49, -1
  %51 = icmp sgt i32 %49, 0
  br i1 %51, label %52, label %63

52:                                               ; preds = %43
  br i1 %7, label %53, label %58

53:                                               ; preds = %52
  %54 = zext i32 %50 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  %57 = fmul contract float %56, %4
  br label %58

58:                                               ; preds = %53, %52
  %59 = phi float [ %57, %53 ], [ %4, %52 ]
  %60 = add nsw i32 %50, %21
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  store float %59, float addrspace(1)* %62, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %58, %43
  %64 = add nuw nsw i32 %23, 2
  %65 = add i32 %24, 2
  %66 = icmp eq i32 %65, %15
  br i1 %66, label %67, label %22, !llvm.loop !9

67:                                               ; preds = %63, %19
  %68 = phi i32 [ 0, %19 ], [ %64, %63 ]
  br i1 %16, label %88, label %69

69:                                               ; preds = %67
  %70 = add nsw i32 %68, %20
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5
  %74 = fptosi float %73 to i32
  %75 = add nsw i32 %74, -1
  %76 = icmp sgt i32 %74, 0
  br i1 %76, label %77, label %88

77:                                               ; preds = %69
  br i1 %7, label %78, label %83

78:                                               ; preds = %77
  %79 = zext i32 %75 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %6, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fmul contract float %81, %4
  br label %83

83:                                               ; preds = %78, %77
  %84 = phi float [ %82, %78 ], [ %4, %77 ]
  %85 = add nsw i32 %75, %21
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float %84, float addrspace(1)* %87, align 4, !tbaa !5
  br label %88

88:                                               ; preds = %67, %83, %69, %17
  %89 = add nuw nsw i32 %18, 32
  %90 = icmp slt i32 %89, %2
  br i1 %90, label %17, label %91, !llvm.loop !11

91:                                               ; preds = %88, %8
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
!11 = distinct !{!11, !10}
