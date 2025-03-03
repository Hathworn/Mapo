; ModuleID = '../data/hip_kernels/12063/9/main.cu'
source_filename = "../data/hip_kernels/12063/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16partialSumKernelPiiE10partialSum = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16partialSumKernelPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = mul i32 %4, %9
  %14 = add i32 %13, %3
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %32

16:                                               ; preds = %2
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !16, !amdgpu.noclobber !6
  %20 = udiv i32 %12, %9
  %21 = mul i32 %20, %9
  %22 = icmp ugt i32 %12, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %9
  %26 = add i32 %25, %14
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !6
  %30 = add nuw nsw i32 %3, %9
  %31 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %30
  store i32 %29, i32 addrspace(3)* %31, align 4, !tbaa !16
  br label %32

32:                                               ; preds = %2, %16
  %33 = phi i32 [ %19, %16 ], [ 0, %2 ]
  %34 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %3
  store i32 %33, i32 addrspace(3)* %34, align 4
  br label %37

35:                                               ; preds = %46
  %36 = icmp eq i32 %3, 0
  br i1 %36, label %49, label %53

37:                                               ; preds = %32, %46
  %38 = phi i32 [ %9, %32 ], [ %47, %46 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %3, %38
  br i1 %39, label %40, label %46

40:                                               ; preds = %37
  %41 = add nuw nsw i32 %38, %3
  %42 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !16
  %44 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !16
  %45 = add nsw i32 %44, %43
  store i32 %45, i32 addrspace(3)* %34, align 4, !tbaa !16
  br label %46

46:                                               ; preds = %37, %40
  %47 = lshr i32 %38, 1
  %48 = icmp ult i32 %38, 2
  br i1 %48, label %35, label %37, !llvm.loop !20

49:                                               ; preds = %35
  %50 = load i32, i32 addrspace(3)* getelementptr inbounds ([16 x i32], [16 x i32] addrspace(3)* @_ZZ16partialSumKernelPiiE10partialSum, i32 0, i32 0), align 16, !tbaa !16
  %51 = zext i32 %4 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  store i32 %50, i32 addrspace(1)* %52, align 4, !tbaa !16
  br label %53

53:                                               ; preds = %49, %35
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
