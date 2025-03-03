; ModuleID = '../data/hip_kernels/10552/78/main.cu'
source_filename = "../data/hip_kernels/10552/78/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7_drop64iPdS_S_dd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double %4, double %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %42

20:                                               ; preds = %6
  %21 = udiv i32 %16, %13
  %22 = mul i32 %21, %13
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %13
  br label %27

27:                                               ; preds = %20, %37
  %28 = phi i32 [ %18, %20 ], [ %40, %37 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %3, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !16
  %32 = fcmp contract olt double %31, %4
  br i1 %32, label %37, label %33

33:                                               ; preds = %27
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %36 = fmul contract double %35, %5
  br label %37

37:                                               ; preds = %27, %33
  %38 = phi double [ %36, %33 ], [ 0.000000e+00, %27 ]
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %29
  store double %38, double addrspace(1)* %39, align 8
  %40 = add i32 %26, %28
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %27, label %42, !llvm.loop !20

42:                                               ; preds = %37, %6
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
