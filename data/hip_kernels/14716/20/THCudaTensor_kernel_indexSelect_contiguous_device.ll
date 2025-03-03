; ModuleID = '../data/hip_kernels/14716/20/main.cu'
source_filename = "../data/hip_kernels/14716/20/main.cu"
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
  br i1 %16, label %17, label %25

17:                                               ; preds = %5
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = shl i32 %18, 7
  %21 = add i32 %20, %19
  %22 = sext i32 %21 to i64
  %23 = icmp slt i64 %22, %2
  %24 = mul nuw nsw i32 %11, 65535
  br label %26

25:                                               ; preds = %32, %5
  ret void

26:                                               ; preds = %17, %32
  %27 = phi i64 [ %15, %17 ], [ %34, %32 ]
  %28 = trunc i64 %27 to i32
  br i1 %23, label %29, label %32

29:                                               ; preds = %26
  %30 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %31 = mul nsw i64 %27, %2
  br label %36

32:                                               ; preds = %80, %26
  %33 = add i32 %24, %28
  %34 = sext i32 %33 to i64
  %35 = icmp slt i64 %34, %4
  br i1 %35, label %26, label %25, !llvm.loop !7

36:                                               ; preds = %29, %80
  %37 = phi i32 [ %21, %29 ], [ %81, %80 ]
  %38 = load float, float addrspace(1)* %30, align 4, !tbaa !9
  %39 = fptosi float %38 to i64
  %40 = add nsw i64 %39, -1
  %41 = mul nsw i64 %40, %2
  %42 = sext i32 %37 to i64
  %43 = icmp slt i64 %42, %2
  br i1 %43, label %44, label %50

44:                                               ; preds = %36
  %45 = add nsw i64 %41, %42
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !9
  %48 = add nsw i64 %31, %42
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  store float %47, float addrspace(1)* %49, align 4, !tbaa !9
  br label %50

50:                                               ; preds = %44, %36
  %51 = add nsw i32 %37, 32
  %52 = sext i32 %51 to i64
  %53 = icmp slt i64 %52, %2
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = add nsw i64 %41, %52
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !9
  %58 = add nsw i64 %31, %52
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !9
  br label %60

60:                                               ; preds = %54, %50
  %61 = add nsw i32 %37, 64
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %62, %2
  br i1 %63, label %64, label %70

64:                                               ; preds = %60
  %65 = add nsw i64 %41, %62
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !9
  %68 = add nsw i64 %31, %62
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %67, float addrspace(1)* %69, align 4, !tbaa !9
  br label %70

70:                                               ; preds = %64, %60
  %71 = add nsw i32 %37, 96
  %72 = sext i32 %71 to i64
  %73 = icmp slt i64 %72, %2
  br i1 %73, label %74, label %80

74:                                               ; preds = %70
  %75 = add nsw i64 %41, %72
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !9
  %78 = add nsw i64 %31, %72
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  store float %77, float addrspace(1)* %79, align 4, !tbaa !9
  br label %80

80:                                               ; preds = %74, %70
  %81 = add nsw i32 %37, 8388480
  %82 = sext i32 %81 to i64
  %83 = icmp slt i64 %82, %2
  br i1 %83, label %36, label %32, !llvm.loop !13
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
