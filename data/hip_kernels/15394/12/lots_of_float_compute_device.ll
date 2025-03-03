; ModuleID = '../data/hip_kernels/15394/12/main.cu'
source_filename = "../data/hip_kernels/15394/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21lots_of_float_computePfimS_(float addrspace(1)* nocapture readonly %0, i32 %1, i64 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %10
  %24 = zext i32 %23 to i64
  %25 = sext i32 %1 to i64
  %26 = icmp ult i64 %17, %25
  br i1 %26, label %27, label %55

27:                                               ; preds = %4
  %28 = icmp eq i64 %2, 0
  br label %29

29:                                               ; preds = %27, %50
  %30 = phi i64 [ %17, %27 ], [ %53, %50 ]
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  br i1 %28, label %50, label %33

33:                                               ; preds = %29, %33
  %34 = phi float [ %47, %33 ], [ %32, %29 ]
  %35 = phi i64 [ %48, %33 ], [ 0, %29 ]
  %36 = fadd contract float %34, 5.000000e+00
  %37 = fadd contract float %36, -1.010000e+02
  %38 = fdiv contract float %37, 3.000000e+00
  %39 = fadd contract float %38, 1.020000e+02
  %40 = fadd contract float %39, 0x3FF11EB860000000
  %41 = fadd contract float %40, -1.030000e+02
  %42 = fdiv contract float %41, 0x3FF0978D40000000
  %43 = fadd contract float %42, 1.040000e+02
  %44 = fadd contract float %43, 3.000000e+00
  %45 = fadd contract float %44, -1.050000e+02
  %46 = fdiv contract float %45, 0x3FCC28F5C0000000
  %47 = fadd contract float %46, 1.060000e+02
  %48 = add nuw i64 %35, 1
  %49 = icmp eq i64 %48, %2
  br i1 %49, label %50, label %33, !llvm.loop !20

50:                                               ; preds = %33, %29
  %51 = phi float [ %32, %29 ], [ %47, %33 ]
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  store float %51, float addrspace(1)* %52, align 4, !tbaa !16
  %53 = add i64 %30, %24
  %54 = icmp ult i64 %53, %25
  br i1 %54, label %29, label %55, !llvm.loop !22

55:                                               ; preds = %50, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!22 = distinct !{!22, !21}
