; ModuleID = '../data/hip_kernels/43/8/main.cu'
source_filename = "../data/hip_kernels/43/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31chol_kernel_optimized_no_stridePfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = add i32 %4, 1
  %6 = add i32 %5, %1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = mul i32 %7, %2
  %9 = add i32 %8, %6
  %10 = add nsw i32 %2, -1
  %11 = add nsw i32 %10, %9
  %12 = icmp slt i32 %9, %6
  %13 = icmp sgt i32 %11, 2047
  %14 = select i1 %12, i1 true, i1 %13
  %15 = icmp ugt i32 %9, %11
  %16 = select i1 %14, i1 true, i1 %15
  br i1 %16, label %38, label %17

17:                                               ; preds = %3
  %18 = shl i32 %1, 11
  %19 = add i32 %6, %18
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = shl i32 %6, 11
  br label %23

23:                                               ; preds = %17, %23
  %24 = phi i32 [ %9, %17 ], [ %36, %23 ]
  %25 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %26 = add i32 %24, %18
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5
  %30 = fmul contract float %25, %29
  %31 = add i32 %24, %22
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = fsub contract float %34, %30
  store float %35, float addrspace(1)* %33, align 4, !tbaa !5
  %36 = add i32 %24, 1
  %37 = icmp ugt i32 %36, %11
  br i1 %37, label %38, label %23, !llvm.loop !9

38:                                               ; preds = %23, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
