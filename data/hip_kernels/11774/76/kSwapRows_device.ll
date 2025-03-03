; ModuleID = '../data/hip_kernels/11774/76/main.cu'
source_filename = "../data/hip_kernels/11774/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9kSwapRowsPfS_S_S_iiiE16sourceRowIndices = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ9kSwapRowsPfS_S_S_iiiE16targetRowIndices = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9kSwapRowsPfS_S_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 5
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = sub nsw i32 %4, %9
  %12 = tail call i32 @llvm.smin.i32(i32 %11, i32 32)
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %44

14:                                               ; preds = %7
  %15 = add nsw i32 %9, %10
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = fptosi float %18 to i32
  %20 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ9kSwapRowsPfS_S_S_iiiE16sourceRowIndices, i32 0, i32 %10
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !10
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = fptosi float %22 to i32
  %24 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ9kSwapRowsPfS_S_S_iiiE16targetRowIndices, i32 0, i32 %10
  store i32 %23, i32 addrspace(3)* %24, align 4, !tbaa !10
  %25 = icmp slt i32 %19, 0
  %26 = select i1 %25, i32 %6, i32 0
  %27 = add nsw i32 %26, %19
  %28 = icmp slt i32 %27, 0
  %29 = icmp sge i32 %27, %6
  %30 = select i1 %28, i1 true, i1 %29
  %31 = or i1 %25, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %14
  %33 = select i1 %30, i32 -1, i32 %27
  store i32 %33, i32 addrspace(3)* %20, align 4, !tbaa !10
  br label %34

34:                                               ; preds = %14, %32
  %35 = icmp slt i32 %23, 0
  %36 = select i1 %35, i32 %6, i32 0
  %37 = add nsw i32 %36, %23
  %38 = icmp slt i32 %37, 0
  %39 = icmp sge i32 %37, %6
  %40 = select i1 %38, i1 true, i1 %39
  %41 = or i1 %35, %40
  br i1 %41, label %42, label %44

42:                                               ; preds = %34
  %43 = select i1 %40, i32 -1, i32 %37
  store i32 %43, i32 addrspace(3)* %24, align 4, !tbaa !10
  br label %44

44:                                               ; preds = %42, %34, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp sgt i32 %11, 0
  br i1 %45, label %46, label %49

46:                                               ; preds = %44
  %47 = icmp slt i32 %10, %5
  %48 = tail call i32 @llvm.smax.i32(i32 %12, i32 1)
  br label %50

49:                                               ; preds = %61, %44
  ret void

50:                                               ; preds = %46, %61
  %51 = phi i32 [ 0, %46 ], [ %62, %61 ]
  %52 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ9kSwapRowsPfS_S_S_iiiE16sourceRowIndices, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !10
  %54 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ9kSwapRowsPfS_S_S_iiiE16targetRowIndices, i32 0, i32 %51
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !10
  br i1 %47, label %56, label %61

56:                                               ; preds = %50
  %57 = icmp eq i32 %53, -1
  %58 = mul nsw i32 %53, %5
  %59 = icmp eq i32 %55, -1
  %60 = mul nsw i32 %55, %5
  br label %64

61:                                               ; preds = %89, %50
  %62 = add nuw nsw i32 %51, 1
  %63 = icmp eq i32 %62, %48
  br i1 %63, label %49, label %50, !llvm.loop !12

64:                                               ; preds = %56, %89
  %65 = phi i32 [ %10, %56 ], [ %90, %89 ]
  br i1 %57, label %71, label %66

66:                                               ; preds = %64
  %67 = add nsw i32 %65, %58
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %64, %66
  %72 = phi float [ %70, %66 ], [ 0x7FF8000000000000, %64 ]
  br i1 %59, label %78, label %73

73:                                               ; preds = %71
  %74 = add nsw i32 %65, %60
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %71, %73
  %79 = phi float [ %77, %73 ], [ 0x7FF8000000000000, %71 ]
  br i1 %57, label %84, label %80

80:                                               ; preds = %78
  %81 = add nsw i32 %65, %58
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  store float %79, float addrspace(1)* %83, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %80, %78
  br i1 %59, label %89, label %85

85:                                               ; preds = %84
  %86 = add nsw i32 %65, %60
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  store float %72, float addrspace(1)* %88, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %85, %84
  %90 = add nuw nsw i32 %65, 32
  %91 = icmp slt i32 %90, %5
  br i1 %91, label %64, label %61, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
