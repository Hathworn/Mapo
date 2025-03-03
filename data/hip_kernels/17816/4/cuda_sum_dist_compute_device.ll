; ModuleID = '../data/hip_kernels/17816/4/main.cu'
source_filename = "../data/hip_kernels/17816/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z21cuda_sum_dist_computeiiiiPKiPji(i32 %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 16
  %32 = bitcast i8 addrspace(4)* %31 to i32 addrspace(4)*
  %33 = load i32, i32 addrspace(4)* %32, align 8, !tbaa !16
  %34 = mul i32 %26, %30
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %36 = add i32 %34, %35
  %37 = udiv i32 %33, %30
  %38 = mul i32 %37, %30
  %39 = icmp ugt i32 %33, %38
  %40 = zext i1 %39 to i32
  %41 = add i32 %37, %40
  %42 = mul i32 %41, %30
  %43 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %44 = getelementptr i8, i8 addrspace(4)* %9, i64 8
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 4, !range !4, !invariant.load !5
  %47 = zext i16 %46 to i32
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 20
  %49 = bitcast i8 addrspace(4)* %48 to i32 addrspace(4)*
  %50 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !17
  %51 = mul i32 %43, %47
  %52 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %53 = add i32 %51, %52
  %54 = udiv i32 %50, %47
  %55 = mul i32 %54, %47
  %56 = icmp ugt i32 %50, %55
  %57 = zext i1 %56 to i32
  %58 = add i32 %54, %57
  %59 = mul i32 %58, %47
  %60 = icmp slt i32 %53, %0
  br i1 %60, label %61, label %71

61:                                               ; preds = %7
  %62 = icmp slt i32 %36, %1
  %63 = mul i32 %3, %2
  %64 = icmp slt i32 %19, %2
  br label %65

65:                                               ; preds = %61, %72
  %66 = phi i32 [ %53, %61 ], [ %73, %72 ]
  br i1 %62, label %67, label %72

67:                                               ; preds = %65
  %68 = mul i32 %63, %66
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %69
  br label %75

71:                                               ; preds = %72, %7
  ret void

72:                                               ; preds = %81, %65
  %73 = add nsw i32 %66, %59
  %74 = icmp slt i32 %73, %0
  br i1 %74, label %65, label %71, !llvm.loop !18

75:                                               ; preds = %67, %81
  %76 = phi i32 [ %36, %67 ], [ %82, %81 ]
  %77 = mul nsw i32 %76, %2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %70, i64 %78
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %78
  br i1 %64, label %84, label %81

81:                                               ; preds = %84, %75
  %82 = add nsw i32 %76, %42
  %83 = icmp slt i32 %82, %1
  br i1 %83, label %75, label %72, !llvm.loop !20

84:                                               ; preds = %75, %84
  %85 = phi i32 [ %93, %84 ], [ %19, %75 ]
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %79, i64 %86
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %80, i64 %86
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !21
  %90 = icmp sgt i32 %89, 0
  %91 = zext i1 %90 to i32
  %92 = atomicrmw add i32 addrspace(1)* %87, i32 %91 syncscope("agent-one-as") monotonic, align 4
  %93 = add nsw i32 %85, %25
  %94 = icmp slt i32 %93, %2
  br i1 %94, label %84, label %81, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = !{!7, !11, i64 16}
!17 = !{!7, !11, i64 20}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = distinct !{!25, !19}
