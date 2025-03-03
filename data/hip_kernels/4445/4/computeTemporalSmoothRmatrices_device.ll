; ModuleID = '../data/hip_kernels/4445/4/main.cu'
source_filename = "../data/hip_kernels/4445/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30computeTemporalSmoothRmatricesPKfjjjPKjjPf(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul nuw nsw i32 %8, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add nuw nsw i32 %15, %16
  %18 = icmp ult i32 %10, %1
  br i1 %18, label %19, label %70

19:                                               ; preds = %7
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %20, %1
  %22 = add i32 %21, %10
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %70

27:                                               ; preds = %19
  %28 = add nuw nsw i32 %25, 1
  %29 = mul nsw i32 %28, %25
  %30 = sdiv i32 %29, 2
  %31 = add i32 %2, 1
  %32 = mul i32 %31, %2
  %33 = lshr i32 %32, 1
  %34 = sub nsw i32 %10, %5
  %35 = tail call i32 @llvm.smax.i32(i32 %34, i32 0)
  %36 = add i32 %35, %21
  %37 = add nsw i32 %1, -1
  %38 = add nsw i32 %10, %5
  %39 = tail call i32 @llvm.smin.i32(i32 %37, i32 %38)
  %40 = add i32 %39, %21
  %41 = icmp slt i32 %17, %30
  br i1 %41, label %42, label %70

42:                                               ; preds = %27
  %43 = icmp sgt i32 %36, %40
  %44 = mul i32 %33, %22
  %45 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 2, !range !5, !invariant.load !6
  %48 = zext i16 %47 to i32
  %49 = mul nuw nsw i32 %48, %14
  br label %50

50:                                               ; preds = %42, %52
  %51 = phi i32 [ %17, %42 ], [ %57, %52 ]
  br i1 %43, label %52, label %59

52:                                               ; preds = %59, %50
  %53 = phi float [ 0.000000e+00, %50 ], [ %67, %59 ]
  %54 = add i32 %51, %44
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %6, i64 %55
  store float %53, float addrspace(1)* %56, align 4, !tbaa !11
  %57 = add i32 %49, %51
  %58 = icmp slt i32 %57, %30
  br i1 %58, label %50, label %70, !llvm.loop !13

59:                                               ; preds = %50, %59
  %60 = phi i32 [ %68, %59 ], [ %36, %50 ]
  %61 = phi float [ %67, %59 ], [ 0.000000e+00, %50 ]
  %62 = mul nsw i32 %60, %33
  %63 = add nsw i32 %62, %51
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !11
  %67 = fadd contract float %61, %66
  %68 = add nsw i32 %60, 1
  %69 = icmp slt i32 %60, %40
  br i1 %69, label %59, label %52, !llvm.loop !15

70:                                               ; preds = %52, %27, %19, %7
  ret void
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
