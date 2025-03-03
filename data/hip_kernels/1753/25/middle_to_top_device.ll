; ModuleID = '../data/hip_kernels/1753/25/main.cu'
source_filename = "../data/hip_kernels/1753/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13middle_to_topPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = sdiv i32 %2, 2
  %7 = mul nsw i32 %6, %1
  %8 = icmp slt i32 %6, %2
  br label %10

9:                                                ; preds = %17, %3
  ret void

10:                                               ; preds = %5, %17
  %11 = phi i32 [ 0, %5 ], [ %18, %17 ]
  br i1 %8, label %12, label %17

12:                                               ; preds = %10
  %13 = add nsw i32 %11, %7
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !4
  br label %20

17:                                               ; preds = %20, %10
  %18 = add nuw nsw i32 %11, 1
  %19 = icmp eq i32 %18, %1
  br i1 %19, label %9, label %10, !llvm.loop !8

20:                                               ; preds = %12, %20
  %21 = phi i32 [ %23, %20 ], [ %2, %12 ]
  %22 = phi float [ %28, %20 ], [ %16, %12 ]
  %23 = add nsw i32 %21, -1
  %24 = mul nsw i32 %23, %1
  %25 = add nsw i32 %24, %11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !4
  store float %22, float addrspace(1)* %27, align 4, !tbaa !4
  %29 = icmp sgt i32 %23, %6
  br i1 %29, label %20, label %17, !llvm.loop !10
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
