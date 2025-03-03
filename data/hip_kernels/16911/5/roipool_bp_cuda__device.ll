; ModuleID = '../data/hip_kernels/16911/5/main.cu'
source_filename = "../data/hip_kernels/16911/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16roipool_bp_cuda_iiPfPiS0_S_(i32 %0, i32 %1, float addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readnone %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %7, %0
  br i1 %8, label %9, label %24

9:                                                ; preds = %6
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp slt i32 %10, %1
  %12 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !5
  %18 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %17, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  br label %25

24:                                               ; preds = %29, %6
  ret void

25:                                               ; preds = %9, %29
  %26 = phi i32 [ %7, %9 ], [ %31, %29 ]
  br i1 %11, label %27, label %29

27:                                               ; preds = %25
  %28 = mul nsw i32 %26, %1
  br label %33

29:                                               ; preds = %33, %25
  %30 = add i32 %20, %26
  %31 = add i32 %30, %23
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %25, label %24, !llvm.loop !16

33:                                               ; preds = %27, %33
  %34 = phi i32 [ %10, %27 ], [ %46, %33 ]
  %35 = add nsw i32 %34, %28
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !18
  %39 = mul nsw i32 %38, %1
  %40 = add nsw i32 %39, %34
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !22
  %45 = atomicrmw fadd float addrspace(1)* %42, float %44 syncscope("agent-one-as") monotonic, align 4
  %46 = add i32 %34, %19
  %47 = icmp slt i32 %46, %1
  br i1 %47, label %33, label %29, !llvm.loop !24
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
