; ModuleID = '../data/hip_kernels/9256/13/main.cu'
source_filename = "../data/hip_kernels/9256/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23multiClassTestingKerneliiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul nsw i32 %8, %3
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %44

11:                                               ; preds = %7
  %12 = icmp sgt i32 %1, 0
  br label %15

13:                                               ; preds = %20
  %14 = icmp eq i32 %24, %2
  br i1 %14, label %44, label %15, !llvm.loop !4

15:                                               ; preds = %11, %13
  %16 = phi i32 [ %24, %13 ], [ 0, %11 ]
  %17 = mul nsw i32 %16, %1
  %18 = add nsw i32 %17, %9
  %19 = add nsw i32 %18, %1
  br i1 %12, label %25, label %20

20:                                               ; preds = %25, %15
  %21 = phi i32 [ -1, %15 ], [ %38, %25 ]
  %22 = phi i32 [ -1, %15 ], [ %41, %25 ]
  %23 = icmp eq i32 %21, %22
  %24 = add nuw nsw i32 %16, 1
  br i1 %23, label %13, label %44

25:                                               ; preds = %15, %25
  %26 = phi i32 [ %42, %25 ], [ %18, %15 ]
  %27 = phi i32 [ %41, %25 ], [ -1, %15 ]
  %28 = phi float [ %40, %25 ], [ 0.000000e+00, %15 ]
  %29 = phi i32 [ %38, %25 ], [ -1, %15 ]
  %30 = phi float [ %37, %25 ], [ 0.000000e+00, %15 ]
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !6, !amdgpu.noclobber !10
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !6, !amdgpu.noclobber !10
  %36 = fcmp contract ogt float %33, %30
  %37 = select i1 %36, float %33, float %30
  %38 = select i1 %36, i32 %26, i32 %29
  %39 = fcmp contract ogt float %35, %28
  %40 = select i1 %39, float %35, float %28
  %41 = select i1 %39, i32 %26, i32 %27
  %42 = add nsw i32 %26, 1
  %43 = icmp slt i32 %42, %19
  br i1 %43, label %25, label %20, !llvm.loop !11

44:                                               ; preds = %13, %20, %7
  %45 = phi i32 [ 1, %7 ], [ 0, %20 ], [ 1, %13 ]
  %46 = add nsw i32 %8, %0
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  store i32 %45, i32 addrspace(1)* %48, align 4, !tbaa !12
  ret void
}

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
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{}
!11 = distinct !{!11, !5}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
