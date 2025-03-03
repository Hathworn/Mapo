; ModuleID = '../data/hip_kernels/9035/0/main.cu'
source_filename = "../data/hip_kernels/9035/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6calcpiilPd(i32 %0, i64 %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds double, double addrspace(1)* %2, i64 %5
  store double 0.000000e+00, double addrspace(1)* %6, align 8, !tbaa !5
  %7 = sitofp i64 %1 to double
  %8 = fdiv contract double 1.000000e+00, %7
  %9 = mul nsw i64 %5, %1
  %10 = sext i32 %0 to i64
  %11 = sdiv i64 %9, %10
  %12 = add nuw nsw i32 %4, 1
  %13 = zext i32 %12 to i64
  %14 = mul nsw i64 %13, %1
  %15 = sdiv i64 %14, %10
  %16 = icmp slt i64 %11, %15
  br i1 %16, label %19, label %18

17:                                               ; preds = %19
  store double %28, double addrspace(1)* %6, align 8, !tbaa !5
  br label %18

18:                                               ; preds = %17, %3
  ret void

19:                                               ; preds = %3, %19
  %20 = phi double [ %28, %19 ], [ 0.000000e+00, %3 ]
  %21 = phi i64 [ %29, %19 ], [ %11, %3 ]
  %22 = sitofp i64 %21 to double
  %23 = fadd contract double %22, 5.000000e-01
  %24 = fmul contract double %8, %23
  %25 = fmul contract double %24, %24
  %26 = fadd contract double %25, 1.000000e+00
  %27 = fdiv contract double 4.000000e+00, %26
  %28 = fadd contract double %27, %20
  %29 = add nsw i64 %21, 1
  %30 = icmp slt i64 %29, %15
  br i1 %30, label %19, label %17, !llvm.loop !9
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
