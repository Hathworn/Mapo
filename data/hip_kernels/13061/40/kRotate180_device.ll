; ModuleID = '../data/hip_kernels/13061/40/main.cu'
source_filename = "../data/hip_kernels/13061/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kRotate180PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %2, 8
  %6 = ashr exact i32 %5, 8
  %7 = mul i32 %5, %2
  %8 = ashr exact i32 %7, 8
  %9 = shl i32 %4, 8
  %10 = ashr exact i32 %9, 8
  %11 = mul nsw i32 %8, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = icmp ult i32 %18, %2
  %20 = add nsw i32 %2, -1
  br label %22

21:                                               ; preds = %33, %3
  ret void

22:                                               ; preds = %17, %33
  %23 = phi i32 [ %15, %17 ], [ %34, %33 ]
  br i1 %19, label %24, label %33

24:                                               ; preds = %22
  %25 = sub nsw i32 %20, %23
  %26 = shl i32 %23, 8
  %27 = ashr exact i32 %26, 8
  %28 = mul nsw i32 %27, %6
  %29 = shl i32 %25, 8
  %30 = ashr exact i32 %29, 8
  %31 = mul nsw i32 %30, %6
  %32 = add i32 %31, %20
  br label %36

33:                                               ; preds = %36, %22
  %34 = add nuw nsw i32 %23, 16
  %35 = icmp slt i32 %34, %2
  br i1 %35, label %22, label %21, !llvm.loop !5

36:                                               ; preds = %24, %36
  %37 = phi i32 [ %18, %24 ], [ %45, %36 ]
  %38 = add nsw i32 %37, %28
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %13, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = sub i32 %32, %37
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %14, i64 %43
  store float %41, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = add nuw nsw i32 %37, 16
  %46 = icmp slt i32 %45, %2
  br i1 %46, label %36, label %33, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !6}
