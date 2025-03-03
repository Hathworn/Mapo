; ModuleID = '../data/hip_kernels/9987/1/main.cu'
source_filename = "../data/hip_kernels/9987/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12p_ary_searchiiPiS_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %9
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %9
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %14, %21
  store i32 -1, i32 addrspace(1)* %3, align 4, !tbaa !16
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 1
  store i32 0, i32 addrspace(1)* %23, align 4, !tbaa !16
  %24 = icmp eq i32 %1, 0
  br i1 %24, label %57, label %25

25:                                               ; preds = %4
  %26 = add nsw i32 %22, 1
  %27 = add nsw i32 %1, -1
  br label %28

28:                                               ; preds = %25, %54
  %29 = phi i32 [ %1, %25 ], [ %55, %54 ]
  %30 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = add nsw i32 %29, %20
  %32 = sdiv i32 %31, %20
  %33 = mul nsw i32 %32, %22
  %34 = add nsw i32 %33, %30
  %35 = icmp slt i32 %34, %1
  br i1 %35, label %36, label %54

36:                                               ; preds = %28
  %37 = mul nsw i32 %32, %26
  %38 = add nsw i32 %37, %30
  %39 = sext i32 %34 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !16
  %42 = icmp slt i32 %41, %0
  br i1 %42, label %43, label %50

43:                                               ; preds = %36
  %44 = icmp slt i32 %38, %1
  %45 = select i1 %44, i32 %38, i32 %27
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !16
  %49 = icmp sgt i32 %48, %0
  br i1 %49, label %52, label %50

50:                                               ; preds = %43, %36
  %51 = icmp eq i32 %41, %0
  br i1 %51, label %52, label %54

52:                                               ; preds = %50, %43
  %53 = phi i32 addrspace(1)* [ %23, %43 ], [ %3, %50 ]
  store i32 %34, i32 addrspace(1)* %53, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %52, %50, %28
  %55 = sdiv i32 %29, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %28, !llvm.loop !20

57:                                               ; preds = %54, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
