; ModuleID = '../data/hip_kernels/14087/4/main.cu'
source_filename = "../data/hip_kernels/14087/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z17batch_crop_kernelPfiiiii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %7, %5
  br i1 %8, label %9, label %37

9:                                                ; preds = %6
  %10 = mul nsw i32 %7, %3
  %11 = mul nsw i32 %10, %4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  switch i32 %16, label %37 [
    i32 0, label %17
    i32 1, label %20
    i32 2, label %25
    i32 3, label %28
  ]

17:                                               ; preds = %9
  %18 = mul nsw i32 %15, %4
  %19 = add nsw i32 %18, %14
  br label %33

20:                                               ; preds = %9
  %21 = xor i32 %15, -1
  %22 = add i32 %21, %3
  %23 = mul nsw i32 %22, %4
  %24 = add nsw i32 %23, %14
  br label %33

25:                                               ; preds = %9
  %26 = mul nsw i32 %14, %4
  %27 = add nsw i32 %26, %15
  br label %33

28:                                               ; preds = %9
  %29 = mul nsw i32 %14, %4
  %30 = xor i32 %15, -1
  %31 = add i32 %30, %4
  %32 = add i32 %31, %29
  br label %33

33:                                               ; preds = %28, %17, %20, %25
  %34 = phi i32 [ %27, %25 ], [ %24, %20 ], [ %19, %17 ], [ %32, %28 ]
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %13, i64 %35
  store float 0.000000e+00, float addrspace(1)* %36, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %33, %9, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

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
