; ModuleID = '../data/hip_kernels/7729/19/main.cu'
source_filename = "../data/hip_kernels/7729/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10gPasteRowsPfPKfmPKmm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i64 %2, i64 addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %23, label %7

7:                                                ; preds = %5
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp eq i64 %2, 0
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %11 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %16, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  br label %24

23:                                               ; preds = %50, %5
  ret void

24:                                               ; preds = %7, %50
  %25 = phi i32 [ 0, %7 ], [ %52, %50 ]
  %26 = add i32 %25, %8
  %27 = sext i32 %26 to i64
  %28 = icmp ult i64 %27, %4
  br i1 %28, label %29, label %50

29:                                               ; preds = %24
  %30 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %27
  %31 = load i64, i64 addrspace(1)* %30, align 8, !tbaa !15
  %32 = mul i64 %31, %2
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = mul i64 %27, %2
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  br i1 %9, label %50, label %36

36:                                               ; preds = %29, %46
  %37 = phi i32 [ %47, %46 ], [ 0, %29 ]
  %38 = add i32 %37, %10
  %39 = sext i32 %38 to i64
  %40 = icmp ult i64 %39, %2
  br i1 %40, label %41, label %46

41:                                               ; preds = %36
  %42 = getelementptr inbounds float, float addrspace(1)* %33, i64 %39
  %43 = getelementptr inbounds float, float addrspace(1)* %35, i64 %39
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !19
  %45 = atomicrmw fadd float addrspace(1)* %42, float %44 syncscope("agent-one-as") monotonic, align 4
  br label %46

46:                                               ; preds = %41, %36
  %47 = add i32 %37, %18
  %48 = sext i32 %47 to i64
  %49 = icmp ult i64 %48, %2
  br i1 %49, label %36, label %50, !llvm.loop !21

50:                                               ; preds = %46, %29, %24
  %51 = add i32 %19, %25
  %52 = add i32 %51, %22
  %53 = sext i32 %52 to i64
  %54 = icmp ult i64 %53, %4
  br i1 %54, label %24, label %23, !llvm.loop !23
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
