; ModuleID = '../data/hip_kernels/2729/0/main.cu'
source_filename = "../data/hip_kernels/2729/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10scaleIndexPdii(double addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = mul nsw i32 %2, %1
  %5 = add nsw i32 %4, %2
  %6 = add nsw i32 %4, %1
  %7 = add nsw i32 %5, 1
  %8 = icmp slt i32 %7, %6
  br i1 %8, label %9, label %12

9:                                                ; preds = %3
  %10 = sext i32 %5 to i64
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 %10
  br label %13

12:                                               ; preds = %13, %3
  ret void

13:                                               ; preds = %9, %13
  %14 = phi i32 [ %7, %9 ], [ %20, %13 ]
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4
  %18 = load double, double addrspace(1)* %11, align 8, !tbaa !4
  %19 = fdiv contract double %17, %18
  store double %19, double addrspace(1)* %16, align 8, !tbaa !4
  %20 = add nsw i32 %14, 1
  %21 = icmp slt i32 %20, %6
  br i1 %21, label %13, label %12, !llvm.loop !8
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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
