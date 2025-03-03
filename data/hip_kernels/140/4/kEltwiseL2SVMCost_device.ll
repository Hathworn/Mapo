; ModuleID = '../data/hip_kernels/140/4/main.cu'
source_filename = "../data/hip_kernels/140/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kEltwiseL2SVMCostPfS_S_S_ffiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float %4, float %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = mul i32 %11, %8
  %13 = add nsw i32 %12, %8
  %14 = tail call i32 @llvm.smin.i32(i32 %13, i32 %6)
  %15 = icmp slt i32 %10, %7
  %16 = icmp slt i32 %12, %14
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %37

18:                                               ; preds = %9
  %19 = mul nsw i32 %10, %6
  br label %20

20:                                               ; preds = %18, %20
  %21 = phi i32 [ %12, %18 ], [ %35, %20 ]
  %22 = add nsw i32 %21, %19
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = fsub contract float %27, %5
  %29 = fmul contract float %25, %28
  %30 = fsub contract float %4, %29
  %31 = tail call float @llvm.maxnum.f32(float %30, float 0.000000e+00)
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  store float %31, float addrspace(1)* %32, align 4, !tbaa !5
  %33 = fmul contract float %31, %31
  %34 = getelementptr inbounds float, float addrspace(1)* %3, i64 %23
  store float %33, float addrspace(1)* %34, align 4, !tbaa !5
  %35 = add nsw i32 %21, 1
  %36 = icmp slt i32 %35, %14
  br i1 %36, label %20, label %37, !llvm.loop !9

37:                                               ; preds = %20, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
