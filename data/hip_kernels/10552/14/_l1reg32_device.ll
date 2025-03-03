; ModuleID = '../data/hip_kernels/10552/14/main.cu'
source_filename = "../data/hip_kernels/10552/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8_l1reg32idPfS_(i32 %0, double %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %50

18:                                               ; preds = %4
  %19 = udiv i32 %14, %11
  %20 = mul i32 %19, %11
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %11
  br label %25

25:                                               ; preds = %18, %47
  %26 = phi i32 [ %16, %18 ], [ %48, %47 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = fcmp contract ogt float %29, 0.000000e+00
  br i1 %30, label %31, label %36

31:                                               ; preds = %25
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %34 = fpext float %33 to double
  %35 = fadd contract double %34, %1
  br label %43

36:                                               ; preds = %25
  %37 = fcmp contract olt float %29, 0.000000e+00
  br i1 %37, label %38, label %47

38:                                               ; preds = %36
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = fpext float %40 to double
  %42 = fsub contract double %41, %1
  br label %43

43:                                               ; preds = %31, %38
  %44 = phi double [ %42, %38 ], [ %35, %31 ]
  %45 = phi float addrspace(1)* [ %39, %38 ], [ %32, %31 ]
  %46 = fptrunc double %44 to float
  store float %46, float addrspace(1)* %45, align 4, !tbaa !16
  br label %47

47:                                               ; preds = %43, %36
  %48 = add i32 %24, %26
  %49 = icmp slt i32 %48, %0
  br i1 %49, label %25, label %50, !llvm.loop !20

50:                                               ; preds = %47, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
