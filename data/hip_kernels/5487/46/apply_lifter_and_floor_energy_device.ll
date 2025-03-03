; ModuleID = '../data/hip_kernels/5487/46/main.cu'
source_filename = "../data/hip_kernels/5487/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29apply_lifter_and_floor_energyiifbfPfS_S_i(i32 %0, i32 %1, float %2, i1 %3, float %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul nsw i32 %11, %8
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %7, i64 %13
  %15 = fcmp contract une float %2, 0.000000e+00
  %16 = icmp slt i32 %10, %1
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %28

18:                                               ; preds = %9, %18
  %19 = phi i32 [ %26, %18 ], [ %10, %9 ]
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %6, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %23 = getelementptr inbounds float, float addrspace(1)* %14, i64 %20
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5
  %25 = fmul contract float %22, %24
  store float %25, float addrspace(1)* %23, align 4, !tbaa !5
  %26 = add nuw nsw i32 %19, 256
  %27 = icmp slt i32 %26, %1
  br i1 %27, label %18, label %28, !llvm.loop !9

28:                                               ; preds = %18, %9
  %29 = icmp eq i32 %10, 0
  %30 = select i1 %3, i1 %29, i1 false
  br i1 %30, label %31, label %52

31:                                               ; preds = %28
  %32 = sext i32 %11 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %4, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %36, %4
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fcmp contract ogt float %4, 0.000000e+00
  %49 = fcmp contract olt float %34, %47
  %50 = select i1 %48, i1 %49, i1 false
  %51 = select i1 %50, float %47, float %34
  store float %51, float addrspace(1)* %14, align 4, !tbaa !5
  br label %52

52:                                               ; preds = %31, %28
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
