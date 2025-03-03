; ModuleID = '../data/hip_kernels/1823/5/main.cu'
source_filename = "../data/hip_kernels/1823/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotPiS_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, 1000
  br i1 %17, label %18, label %37

18:                                               ; preds = %4
  %19 = udiv i32 %13, %10
  %20 = mul i32 %19, %10
  %21 = icmp ugt i32 %13, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %10
  br label %25

25:                                               ; preds = %18, %25
  %26 = phi i32 [ 0, %18 ], [ %34, %25 ]
  %27 = phi i32 [ %16, %18 ], [ %35, %25 ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !5
  %33 = mul nsw i32 %32, %30
  %34 = add nsw i32 %33, %26
  %35 = add i32 %24, %27
  %36 = icmp slt i32 %35, 1000
  br i1 %36, label %25, label %37, !llvm.loop !20

37:                                               ; preds = %25, %4
  %38 = phi i32 [ 0, %4 ], [ %34, %25 ]
  %39 = sext i32 %16 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %38, i32 addrspace(1)* %40, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i16 %9, 2
  br i1 %41, label %58, label %42

42:                                               ; preds = %37
  %43 = lshr i32 %10, 1
  br label %44

44:                                               ; preds = %42, %54
  %45 = phi i32 [ %55, %54 ], [ %43, %42 ]
  %46 = icmp ult i32 %15, %45
  br i1 %46, label %47, label %54

47:                                               ; preds = %44
  %48 = add nsw i32 %45, %16
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !16
  %52 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !16
  %53 = add nsw i32 %52, %51
  store i32 %53, i32 addrspace(1)* %40, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %47, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = sdiv i32 %45, 2
  %56 = add nsw i32 %45, 1
  %57 = icmp ult i32 %56, 3
  br i1 %57, label %58, label %44, !llvm.loop !22

58:                                               ; preds = %54, %37
  %59 = icmp eq i32 %15, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %58
  %61 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !16
  %62 = zext i32 %5 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  store i32 %61, i32 addrspace(1)* %63, align 4, !tbaa !16
  br label %64

64:                                               ; preds = %60, %58
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
!22 = distinct !{!22, !21}
