; ModuleID = '../data/hip_kernels/642/17/main.cu'
source_filename = "../data/hip_kernels/642/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_incScan = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19incSumScanB1_kernelPjS_mS_j(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i64 %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = mul i32 %7, %12
  %17 = add i32 %16, %6
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %18, %2
  br i1 %19, label %20, label %55

20:                                               ; preds = %5
  %21 = icmp eq i32 %6, 0
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !16
  %24 = select i1 %21, i32 %4, i32 0
  %25 = add i32 %23, %24
  %26 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_incScan, i32 0, i32 %6
  store i32 %25, i32 addrspace(3)* %26, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %32

27:                                               ; preds = %41
  %28 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !16
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  store i32 %28, i32 addrspace(1)* %29, align 4, !tbaa !16
  %30 = add nuw nsw i32 %6, 1
  %31 = icmp eq i32 %30, %12
  br i1 %31, label %44, label %55

32:                                               ; preds = %20, %41
  %33 = phi i32 [ 1, %20 ], [ %42, %41 ]
  %34 = icmp ult i32 %6, %33
  br i1 %34, label %41, label %35

35:                                               ; preds = %32
  %36 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !16
  %37 = sub i32 %6, %33
  %38 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_incScan, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = add i32 %39, %36
  store i32 %40, i32 addrspace(3)* %26, align 4, !tbaa !16
  br label %41

41:                                               ; preds = %35, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = shl nsw i32 %33, 1
  %43 = icmp ugt i32 %42, %12
  br i1 %43, label %27, label %32, !llvm.loop !20

44:                                               ; preds = %27
  %45 = add i32 %7, 1
  %46 = udiv i32 %15, %12
  %47 = mul i32 %46, %12
  %48 = icmp ugt i32 %15, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = icmp ult i32 %45, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %44
  %53 = zext i32 %45 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %53
  store i32 %28, i32 addrspace(1)* %54, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %27, %52, %44, %5
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
