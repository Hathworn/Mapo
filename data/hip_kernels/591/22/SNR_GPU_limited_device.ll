; ModuleID = '../data/hip_kernels/591/22/main.cu'
source_filename = "../data/hip_kernels/591/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15SNR_GPU_limitedPfS_PtS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i16 addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = lshr i32 %9, 5
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = lshr i16 %14, 5
  %16 = zext i16 %15 to i32
  %17 = load float, float addrspace(1)* %3, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = getelementptr inbounds float, float addrspace(1)* %3, i64 1
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %20, %16
  %22 = add i32 %21, %10
  %23 = mul i32 %22, %6
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %25, label %34

25:                                               ; preds = %8
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = shl i32 %26, 5
  %28 = mul i32 %27, %4
  %29 = and i32 %9, 31
  %30 = or i32 %28, %29
  %31 = sub nsw i32 %6, %7
  %32 = icmp eq i32 %5, 1
  %33 = trunc i32 %5 to i16
  br label %35

34:                                               ; preds = %62, %8
  ret void

35:                                               ; preds = %25, %62
  %36 = phi i32 [ 0, %25 ], [ %64, %62 ]
  %37 = phi i32 [ %30, %25 ], [ %63, %62 ]
  %38 = icmp slt i32 %37, %31
  br i1 %38, label %39, label %52

39:                                               ; preds = %35
  %40 = add nsw i32 %37, %23
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fsub contract float %44, %17
  %46 = fdiv contract float %45, %19
  br i1 %32, label %47, label %48

47:                                               ; preds = %39
  store float %46, float addrspace(1)* %42, align 4, !tbaa !7
  br label %58

48:                                               ; preds = %39
  %49 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %50 = fcmp contract ogt float %46, %49
  br i1 %50, label %51, label %62

51:                                               ; preds = %48
  store float %46, float addrspace(1)* %42, align 4, !tbaa !7
  br label %58

52:                                               ; preds = %35
  %53 = icmp slt i32 %37, %6
  br i1 %53, label %54, label %62

54:                                               ; preds = %52
  %55 = add nsw i32 %37, %23
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  store float 0.000000e+00, float addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %51, %47, %54
  %59 = phi i64 [ %56, %54 ], [ %41, %47 ], [ %41, %51 ]
  %60 = phi i16 [ 0, %54 ], [ 1, %47 ], [ %33, %51 ]
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %2, i64 %59
  store i16 %60, i16 addrspace(1)* %61, align 2, !tbaa !11
  br label %62

62:                                               ; preds = %58, %52, %48
  %63 = add nsw i32 %37, 32
  %64 = add nuw nsw i32 %36, 1
  %65 = icmp eq i32 %64, %4
  br i1 %65, label %34, label %35, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
