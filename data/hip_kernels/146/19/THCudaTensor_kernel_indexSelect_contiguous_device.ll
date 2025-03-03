; ModuleID = '../data/hip_kernels/146/19/main.cu'
source_filename = "../data/hip_kernels/146/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z42THCudaTensor_kernel_indexSelect_contiguousPfS_lS_l(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = icmp slt i64 %15, %4
  br i1 %16, label %17, label %26

17:                                               ; preds = %5
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = shl i32 %18, 7
  %21 = add i32 %20, %19
  %22 = sext i32 %21 to i64
  %23 = icmp slt i64 %22, %2
  %24 = trunc i64 %2 to i32
  %25 = mul nuw nsw i32 %11, 65535
  br label %27

26:                                               ; preds = %33, %5
  ret void

27:                                               ; preds = %17, %33
  %28 = phi i64 [ %15, %17 ], [ %35, %33 ]
  %29 = trunc i64 %28 to i32
  br i1 %23, label %30, label %33

30:                                               ; preds = %27
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %32 = mul i32 %29, %24
  br label %37

33:                                               ; preds = %89, %27
  %34 = add i32 %25, %29
  %35 = sext i32 %34 to i64
  %36 = icmp slt i64 %35, %4
  br i1 %36, label %27, label %26, !llvm.loop !7

37:                                               ; preds = %30, %89
  %38 = phi i32 [ %21, %30 ], [ %90, %89 ]
  %39 = load float, float addrspace(1)* %31, align 4, !tbaa !9
  %40 = fptosi float %39 to i32
  %41 = add nsw i32 %40, -1
  %42 = mul i32 %41, %24
  %43 = sext i32 %38 to i64
  %44 = icmp slt i64 %43, %2
  br i1 %44, label %45, label %53

45:                                               ; preds = %37
  %46 = add nsw i32 %38, %42
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !9
  %50 = add nsw i32 %38, %32
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  store float %49, float addrspace(1)* %52, align 4, !tbaa !9
  br label %53

53:                                               ; preds = %45, %37
  %54 = add nsw i32 %38, 32
  %55 = sext i32 %54 to i64
  %56 = icmp slt i64 %55, %2
  br i1 %56, label %57, label %65

57:                                               ; preds = %53
  %58 = add nsw i32 %54, %42
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !9
  %62 = add nsw i32 %54, %32
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float %61, float addrspace(1)* %64, align 4, !tbaa !9
  br label %65

65:                                               ; preds = %57, %53
  %66 = add nsw i32 %38, 64
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %67, %2
  br i1 %68, label %69, label %77

69:                                               ; preds = %65
  %70 = add nsw i32 %66, %42
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !9
  %74 = add nsw i32 %66, %32
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %73, float addrspace(1)* %76, align 4, !tbaa !9
  br label %77

77:                                               ; preds = %69, %65
  %78 = add nsw i32 %38, 96
  %79 = sext i32 %78 to i64
  %80 = icmp slt i64 %79, %2
  br i1 %80, label %81, label %89

81:                                               ; preds = %77
  %82 = add nsw i32 %78, %42
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !9
  %86 = add nsw i32 %78, %32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %85, float addrspace(1)* %88, align 4, !tbaa !9
  br label %89

89:                                               ; preds = %81, %77
  %90 = add nsw i32 %38, 8388480
  %91 = sext i32 %90 to i64
  %92 = icmp slt i64 %91, %2
  br i1 %92, label %37, label %33, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
