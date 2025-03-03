; ModuleID = '../data/hip_kernels/18288/5/main.cu'
source_filename = "../data/hip_kernels/18288/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z19max_pool3d_backwardiiiiPKiPKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp slt i32 %8, %0
  br i1 %9, label %10, label %26

10:                                               ; preds = %7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = mul i32 %3, %2
  %13 = icmp slt i32 %11, %12
  %14 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !5
  %20 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %19, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  br label %27

26:                                               ; preds = %32, %7
  ret void

27:                                               ; preds = %10, %32
  %28 = phi i32 [ %8, %10 ], [ %34, %32 ]
  br i1 %13, label %29, label %32

29:                                               ; preds = %27
  %30 = mul i32 %12, %28
  %31 = mul nsw i32 %28, %1
  br label %36

32:                                               ; preds = %36, %27
  %33 = add i32 %22, %28
  %34 = add i32 %33, %25
  %35 = icmp slt i32 %34, %0
  br i1 %35, label %27, label %26, !llvm.loop !16

36:                                               ; preds = %29, %36
  %37 = phi i32 [ %11, %29 ], [ %51, %36 ]
  %38 = srem i32 %37, %3
  %39 = add nsw i32 %37, %30
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !18
  %43 = add i32 %42, %31
  %44 = mul i32 %43, %3
  %45 = add nsw i32 %44, %38
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %6, i64 %46
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %40
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !22
  %50 = atomicrmw fadd float addrspace(1)* %47, float %49 syncscope("agent-one-as") monotonic, align 4
  %51 = add i32 %37, %21
  %52 = icmp slt i32 %51, %12
  br i1 %52, label %36, label %32, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !20, i64 0}
!24 = distinct !{!24, !17}
