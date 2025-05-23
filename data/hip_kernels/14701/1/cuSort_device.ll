; ModuleID = '../data/hip_kernels/14701/1/main.cu'
source_filename = "../data/hip_kernels/14701/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6cuSortPfiPi(float addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul i32 %4, %1
  %6 = add nsw i32 %5, %1
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %7
  store i32 %5, i32 addrspace(1)* %8, align 4, !tbaa !4
  %9 = icmp sgt i32 %1, 1
  br i1 %9, label %10, label %12

10:                                               ; preds = %3
  %11 = add nsw i32 %5, 1
  br label %13

12:                                               ; preds = %38, %3
  ret void

13:                                               ; preds = %10, %38
  %14 = phi i32 [ %43, %38 ], [ %11, %10 ]
  %15 = phi i32 [ %14, %38 ], [ %5, %10 ]
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !8
  %19 = sext i32 %15 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !8
  %22 = fcmp contract olt float %18, %21
  %23 = icmp sgt i32 %15, -1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %38

25:                                               ; preds = %13, %25
  %26 = phi float [ %34, %25 ], [ %21, %13 ]
  %27 = phi i32 [ %31, %25 ], [ %15, %13 ]
  %28 = add nuw nsw i32 %27, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float %26, float addrspace(1)* %30, align 4, !tbaa !8
  %31 = add nsw i32 %27, -1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !8
  %35 = fcmp contract olt float %18, %34
  %36 = icmp ne i32 %27, 0
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %25, label %38, !llvm.loop !10

38:                                               ; preds = %25, %13
  %39 = phi i32 [ %15, %13 ], [ %31, %25 ]
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %18, float addrspace(1)* %42, align 4, !tbaa !8
  %43 = add nsw i32 %14, 1
  %44 = icmp slt i32 %43, %6
  br i1 %44, label %13, label %12, !llvm.loop !12
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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
