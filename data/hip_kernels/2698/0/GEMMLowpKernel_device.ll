; ModuleID = '../data/hip_kernels/2698/0/main.cu'
source_filename = "../data/hip_kernels/2698/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14GEMMLowpKernelPKfiPfffxS0_b(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float %3, float %4, i64 %5, float addrspace(1)* nocapture readonly %6, i1 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %1
  br i1 %21, label %22, label %30

22:                                               ; preds = %8
  %23 = sitofp i64 %5 to float
  %24 = udiv i32 %17, %14
  %25 = mul i32 %24, %14
  %26 = icmp ugt i32 %17, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %14
  br label %31

30:                                               ; preds = %43, %8
  ret void

31:                                               ; preds = %22, %43
  %32 = phi i32 [ %20, %22 ], [ %56, %43 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  br i1 %7, label %37, label %40

37:                                               ; preds = %31
  %38 = fdiv contract float %35, %3
  %39 = fadd contract float %38, %4
  br label %43

40:                                               ; preds = %31
  %41 = fadd contract float %35, %4
  %42 = fdiv contract float %41, %3
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi float [ %42, %40 ], [ %39, %37 ]
  store float %44, float addrspace(1)* %36, align 4, !tbaa !16
  %45 = getelementptr inbounds float, float addrspace(1)* %6, i64 %33
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16
  %47 = fadd contract float %44, %46
  %48 = tail call float @llvm.minnum.f32(float %47, float %23)
  %49 = tail call float @llvm.maxnum.f32(float %48, float 0.000000e+00)
  %50 = tail call float @llvm.round.f32(float %49)
  %51 = fmul contract float %50, %3
  %52 = fsub contract float %51, %4
  %53 = fsub contract float %50, %4
  %54 = fmul contract float %53, %3
  %55 = select i1 %7, float %54, float %52
  store float %55, float addrspace(1)* %36, align 4, !tbaa !16
  %56 = add i32 %29, %32
  %57 = icmp slt i32 %56, %1
  br i1 %57, label %31, label %30, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
