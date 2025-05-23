; ModuleID = '../data/hip_kernels/16331/9/main.cu'
source_filename = "../data/hip_kernels/16331/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14channels_firstPfS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = shl nsw i32 %5, 1
  %12 = icmp slt i32 %10, %2
  br i1 %12, label %13, label %24

13:                                               ; preds = %6
  %14 = add nsw i32 %11, %3
  %15 = add nsw i32 %11, %4
  %16 = mul i32 %7, %2
  %17 = mul i32 %14, %7
  %18 = add nsw i32 %8, %5
  %19 = add nsw i32 %9, %5
  %20 = add i32 %18, %17
  %21 = mul i32 %20, %15
  %22 = add i32 %19, %21
  %23 = mul i32 %22, %2
  br label %25

24:                                               ; preds = %25, %6
  ret void

25:                                               ; preds = %13, %25
  %26 = phi i32 [ %10, %13 ], [ %38, %25 ]
  %27 = add i32 %26, %16
  %28 = mul i32 %27, %3
  %29 = add i32 %28, %8
  %30 = mul i32 %29, %4
  %31 = add i32 %30, %9
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = add i32 %26, %23
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %34, float addrspace(1)* %37, align 4, !tbaa !5
  %38 = add nuw nsw i32 %26, 64
  %39 = icmp slt i32 %38, %2
  br i1 %39, label %25, label %24, !llvm.loop !9
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
