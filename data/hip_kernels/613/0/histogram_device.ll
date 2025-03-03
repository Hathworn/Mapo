; ModuleID = '../data/hip_kernels/613/0/main.cu'
source_filename = "../data/hip_kernels/613/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_local_hist = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9histogramPjS_ijjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp ult i32 %7, %3
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %8, label %10, label %15

10:                                               ; preds = %6
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  br label %27

15:                                               ; preds = %27, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = mul i32 %16, %20
  %25 = add i32 %24, %7
  %26 = icmp slt i32 %25, %2
  br i1 %26, label %32, label %40

27:                                               ; preds = %10, %27
  %28 = phi i32 [ %7, %10 ], [ %30, %27 ]
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_local_hist, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !16
  %30 = add i32 %28, %14
  %31 = icmp ult i32 %30, %3
  br i1 %31, label %27, label %15, !llvm.loop !20

32:                                               ; preds = %15
  %33 = sext i32 %25 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !6
  %36 = lshr i32 %35, %5
  %37 = and i32 %36, %4
  %38 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_local_hist, i32 0, i32 %37
  %39 = atomicrmw add i32 addrspace(3)* %38, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %40

40:                                               ; preds = %32, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %41, label %47

41:                                               ; preds = %40
  %42 = udiv i32 %23, %20
  %43 = mul i32 %42, %20
  %44 = icmp ugt i32 %23, %43
  %45 = zext i1 %44 to i32
  %46 = add i32 %42, %45
  br label %48

47:                                               ; preds = %48, %40
  ret void

48:                                               ; preds = %41, %48
  %49 = phi i32 [ %7, %41 ], [ %56, %48 ]
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_local_hist, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !16
  %52 = mul i32 %46, %49
  %53 = add i32 %52, %16
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  store i32 %51, i32 addrspace(1)* %55, align 4, !tbaa !16
  %56 = add i32 %49, %20
  %57 = icmp ult i32 %56, %3
  br i1 %57, label %48, label %47, !llvm.loop !22
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
!22 = distinct !{!22, !21}
