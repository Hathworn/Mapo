; ModuleID = '../data/hip_kernels/2766/6/main.cu'
source_filename = "../data/hip_kernels/2766/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@partialActiveIdx = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27cudaUpdateMostActive_kernelPjS_S_jjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = mul i32 %4, %3
  %8 = mul i32 %7, %5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 %20
  store i32 0, i32 addrspace(3)* %22, align 4, !tbaa !16
  %23 = icmp ult i32 %21, %8
  br i1 %23, label %24, label %30

24:                                               ; preds = %6
  %25 = mul i32 %8, %9
  %26 = add i32 %21, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !5
  store i32 %29, i32 addrspace(3)* %22, align 4, !tbaa !16
  br label %30

30:                                               ; preds = %24, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i16 %14, 2
  br i1 %31, label %32, label %34

32:                                               ; preds = %51, %30
  %33 = icmp eq i32 %20, 0
  br i1 %33, label %53, label %64

34:                                               ; preds = %30, %51
  %35 = phi i32 [ %36, %51 ], [ %15, %30 ]
  %36 = lshr i32 %35, 1
  %37 = icmp ult i32 %20, %36
  br i1 %37, label %38, label %51

38:                                               ; preds = %34
  %39 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !16
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !5
  %43 = add nuw nsw i32 %36, %20
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 %43
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !16
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !5
  %49 = icmp ult i32 %42, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %38
  store i32 %45, i32 addrspace(3)* %22, align 4, !tbaa !16
  br label %51

51:                                               ; preds = %38, %50, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %35, 4
  br i1 %52, label %32, label %34, !llvm.loop !20

53:                                               ; preds = %32
  %54 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 0), align 4, !tbaa !16
  %55 = udiv i32 %18, %15
  %56 = mul i32 %55, %15
  %57 = icmp ugt i32 %18, %56
  %58 = zext i1 %57 to i32
  %59 = add i32 %55, %58
  %60 = mul i32 %59, %9
  %61 = add i32 %60, %10
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  store i32 %54, i32 addrspace(1)* %63, align 4, !tbaa !16
  br label %64

64:                                               ; preds = %53, %32
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
