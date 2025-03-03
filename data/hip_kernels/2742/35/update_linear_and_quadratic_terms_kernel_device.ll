; ModuleID = '../data/hip_kernels/2742/35/main.cu'
source_filename = "../data/hip_kernels/2742/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40update_linear_and_quadratic_terms_kernelifPfiS_S_(i32 %0, float %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = sitofp i32 %3 to float
  %8 = icmp sgt i32 %3, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load float, float addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %11 = tail call float @llvm.maxnum.f32(float %10, float %7)
  %12 = fdiv contract float %11, %7
  %13 = fadd contract float %12, -1.000000e+00
  %14 = fadd contract float %13, 1.000000e+00
  br label %15

15:                                               ; preds = %9, %6
  %16 = phi float [ %14, %9 ], [ 1.000000e+00, %6 ]
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !9, !invariant.load !8
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !10
  %26 = mul i32 %17, %22
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %0
  br i1 %29, label %30, label %37

30:                                               ; preds = %15
  %31 = udiv i32 %25, %22
  %32 = mul i32 %31, %22
  %33 = icmp ugt i32 %25, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %22
  br label %39

37:                                               ; preds = %39, %15
  %38 = icmp eq i32 %27, 0
  br i1 %38, label %52, label %56

39:                                               ; preds = %30, %39
  %40 = phi i32 [ %28, %30 ], [ %50, %39 ]
  %41 = add nsw i32 %40, 1
  %42 = add nsw i32 %40, 2
  %43 = mul nsw i32 %41, %42
  %44 = sdiv i32 %43, 2
  %45 = add nsw i32 %44, -1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !4
  %49 = fadd contract float %16, %48
  store float %49, float addrspace(1)* %47, align 4, !tbaa !4
  %50 = add i32 %36, %40
  %51 = icmp slt i32 %50, %0
  br i1 %51, label %39, label %37, !llvm.loop !20

52:                                               ; preds = %37
  %53 = fmul contract float %16, %1
  %54 = load float, float addrspace(1)* %5, align 4, !tbaa !4
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(1)* %5, align 4, !tbaa !4
  br label %56

56:                                               ; preds = %52, %37
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i32 0, i32 1024}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
