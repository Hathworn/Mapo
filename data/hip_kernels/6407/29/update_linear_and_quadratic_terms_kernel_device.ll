; ModuleID = '../data/hip_kernels/6407/29/main.cu'
source_filename = "../data/hip_kernels/6407/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40update_linear_and_quadratic_terms_kerneliffPfiS_S_(i32 %0, float %1, float %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = sitofp i32 %4 to float
  %9 = icmp eq i32 %4, 0
  br i1 %9, label %19, label %10

10:                                               ; preds = %7
  %11 = load float, float addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %12 = fadd contract float %11, %1
  %13 = tail call float @llvm.maxnum.f32(float %1, float %8)
  %14 = fdiv contract float %13, %8
  %15 = tail call float @llvm.maxnum.f32(float %12, float %8)
  %16 = fdiv contract float %15, %8
  %17 = fsub contract float %16, %14
  %18 = fadd contract float %17, 1.000000e+00
  br label %19

19:                                               ; preds = %10, %7
  %20 = phi float [ %18, %10 ], [ 1.000000e+00, %7 ]
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !9, !invariant.load !8
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !10
  %30 = mul i32 %21, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %32 = add i32 %30, %31
  %33 = icmp slt i32 %32, %0
  br i1 %33, label %34, label %41

34:                                               ; preds = %19
  %35 = udiv i32 %29, %26
  %36 = mul i32 %35, %26
  %37 = icmp ugt i32 %29, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %26
  br label %45

41:                                               ; preds = %45, %19
  %42 = icmp eq i32 %31, 0
  %43 = icmp eq i32 %21, 0
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %58, label %62

45:                                               ; preds = %34, %45
  %46 = phi i32 [ %32, %34 ], [ %56, %45 ]
  %47 = add nsw i32 %46, 1
  %48 = add nsw i32 %46, 2
  %49 = mul nsw i32 %47, %48
  %50 = sdiv i32 %49, 2
  %51 = add nsw i32 %50, -1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %5, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4
  %55 = fadd contract float %20, %54
  store float %55, float addrspace(1)* %53, align 4, !tbaa !4
  %56 = add i32 %40, %46
  %57 = icmp slt i32 %56, %0
  br i1 %57, label %45, label %41, !llvm.loop !20

58:                                               ; preds = %41
  %59 = fmul contract float %20, %2
  %60 = load float, float addrspace(1)* %6, align 4, !tbaa !4
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(1)* %6, align 4, !tbaa !4
  br label %62

62:                                               ; preds = %58, %41
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
