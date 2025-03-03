; ModuleID = '../data/hip_kernels/14087/3/main.cu'
source_filename = "../data/hip_kernels/14087/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z17batch_crop_kernelPfiiiii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %7, %5
  br i1 %8, label %9, label %39

9:                                                ; preds = %6
  %10 = mul nsw i32 %7, %3
  %11 = mul nsw i32 %10, %4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %27

17:                                               ; preds = %9
  %18 = sub nsw i32 %3, %1
  %19 = icmp sge i32 %15, %18
  %20 = icmp slt i32 %15, %1
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %27

22:                                               ; preds = %17
  %23 = mul nsw i32 %15, %4
  %24 = add nsw i32 %23, %14
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %13, i64 %25
  store float 0.000000e+00, float addrspace(1)* %26, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %17, %22, %9
  %28 = icmp slt i32 %14, %4
  br i1 %28, label %29, label %39

29:                                               ; preds = %27
  %30 = sub nsw i32 %4, %2
  %31 = icmp sge i32 %14, %30
  %32 = icmp slt i32 %14, %2
  %33 = or i1 %32, %31
  br i1 %33, label %34, label %39

34:                                               ; preds = %29
  %35 = mul nsw i32 %15, %4
  %36 = add nsw i32 %35, %14
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %13, i64 %37
  store float 0.000000e+00, float addrspace(1)* %38, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %27, %34, %29, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
