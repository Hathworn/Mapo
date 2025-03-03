; ModuleID = '../data/hip_kernels/11793/1/main.cu'
source_filename = "../data/hip_kernels/11793/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10MaxElementPdiiPi(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = mul nsw i32 %2, %1
  %6 = add nsw i32 %5, %2
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 %7
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  store i32 %2, i32 addrspace(1)* %3, align 4, !tbaa !9
  %10 = icmp slt i32 %2, %1
  br i1 %10, label %15, label %11

11:                                               ; preds = %26, %4
  %12 = phi double [ %9, %4 ], [ %27, %26 ]
  %13 = tail call double @llvm.fabs.f64(double %12)
  %14 = fcmp contract olt double %13, 0x3E7AD7F29ABCAF48
  br i1 %14, label %30, label %31

15:                                               ; preds = %4, %26
  %16 = phi i32 [ %28, %26 ], [ %2, %4 ]
  %17 = phi double [ %27, %26 ], [ %9, %4 ]
  %18 = add nsw i32 %16, %5
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !4, !amdgpu.noclobber !8
  %22 = tail call double @llvm.fabs.f64(double %21)
  %23 = tail call double @llvm.fabs.f64(double %17)
  %24 = fcmp contract ogt double %22, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %15
  store i32 %16, i32 addrspace(1)* %3, align 4, !tbaa !9
  br label %26

26:                                               ; preds = %15, %25
  %27 = phi double [ %21, %25 ], [ %17, %15 ]
  %28 = add nsw i32 %16, 1
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %15, label %11, !llvm.loop !11

30:                                               ; preds = %11
  store i32 -1, i32 addrspace(1)* %3, align 4, !tbaa !9
  br label %31

31:                                               ; preds = %30, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
