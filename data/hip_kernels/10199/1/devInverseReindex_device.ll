; ModuleID = '../data/hip_kernels/10199/1/main.cu'
source_filename = "../data/hip_kernels/10199/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17devInverseReindexiPiS_Pjiiib(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i1 %7) local_unnamed_addr #0 {
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %24, label %10

10:                                               ; preds = %8
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br label %25

24:                                               ; preds = %73, %8
  ret void

25:                                               ; preds = %10, %73
  %26 = phi i32 [ 0, %10 ], [ %74, %73 ]
  br i1 %23, label %27, label %73

27:                                               ; preds = %25
  %28 = mul i32 %26, %4
  %29 = udiv i32 %19, %16
  %30 = mul i32 %29, %16
  %31 = icmp ugt i32 %19, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %16
  br label %35

35:                                               ; preds = %27, %68
  %36 = phi i32 [ %22, %27 ], [ %71, %68 ]
  %37 = add i32 %36, %28
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !16
  %41 = icmp eq i32 %40, -1
  %42 = select i1 %41, i1 %7, i1 false
  br i1 %42, label %68, label %43

43:                                               ; preds = %35
  %44 = icmp slt i32 %40, %6
  br i1 %44, label %45, label %49

45:                                               ; preds = %49, %43
  %46 = phi i32 [ %40, %43 ], [ %52, %49 ]
  %47 = phi i32 [ 0, %43 ], [ %53, %49 ]
  %48 = icmp slt i32 %46, 0
  br i1 %48, label %55, label %61

49:                                               ; preds = %43, %49
  %50 = phi i32 [ %53, %49 ], [ 0, %43 ]
  %51 = phi i32 [ %52, %49 ], [ %40, %43 ]
  %52 = sub nsw i32 %51, %6
  %53 = add nsw i32 %50, %6
  %54 = icmp slt i32 %52, %6
  br i1 %54, label %45, label %49, !llvm.loop !20

55:                                               ; preds = %45, %55
  %56 = phi i32 [ %59, %55 ], [ %47, %45 ]
  %57 = phi i32 [ %58, %55 ], [ %46, %45 ]
  %58 = add nsw i32 %57, %6
  %59 = sub nsw i32 %56, %6
  %60 = icmp slt i32 %58, 0
  br i1 %60, label %55, label %61, !llvm.loop !22

61:                                               ; preds = %55, %45
  %62 = phi i32 [ %46, %45 ], [ %58, %55 ]
  %63 = phi i32 [ %47, %45 ], [ %59, %55 ]
  %64 = zext i32 %62 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !16
  %67 = add nsw i32 %66, %63
  br label %68

68:                                               ; preds = %35, %61
  %69 = phi i32 [ %67, %61 ], [ -1, %35 ]
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !16
  %71 = add i32 %34, %36
  %72 = icmp slt i32 %71, %0
  br i1 %72, label %35, label %73, !llvm.loop !23

73:                                               ; preds = %68, %25
  %74 = add nuw i32 %26, 1
  %75 = icmp eq i32 %74, %5
  br i1 %75, label %24, label %25, !llvm.loop !24
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
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
