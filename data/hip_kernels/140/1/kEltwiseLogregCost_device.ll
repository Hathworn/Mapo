; ModuleID = '../data/hip_kernels/140/1/main.cu'
source_filename = "../data/hip_kernels/140/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18kEltwiseLogregCostPfS_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul i32 %9, %6
  %11 = add nsw i32 %10, %6
  %12 = tail call i32 @llvm.smin.i32(i32 %11, i32 %4)
  %13 = icmp slt i32 %8, %5
  %14 = icmp slt i32 %10, %12
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %16, label %39

16:                                               ; preds = %7
  %17 = mul nsw i32 %8, %4
  br label %18

18:                                               ; preds = %16, %18
  %19 = phi i32 [ %10, %16 ], [ %37, %18 ]
  %20 = add nsw i32 %19, %17
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5
  %24 = fneg contract float %23
  %25 = tail call float @llvm.exp.f32(float %24)
  %26 = fadd contract float %25, 1.000000e+00
  %27 = fdiv contract float 1.000000e+00, %26
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5
  %30 = fcmp contract oeq float %29, 1.000000e+00
  %31 = fsub contract float 1.000000e+00, %27
  %32 = select i1 %30, float %27, float %31
  %33 = tail call float @llvm.maxnum.f32(float %32, float 0x3BC79CA100000000)
  %34 = tail call float @llvm.log.f32(float %33)
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  store float %34, float addrspace(1)* %35, align 4
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %21
  store float %33, float addrspace(1)* %36, align 4
  %37 = add nsw i32 %19, 1
  %38 = icmp slt i32 %37, %12
  br i1 %38, label %18, label %39, !llvm.loop !9

39:                                               ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log.f32(float) #1

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
