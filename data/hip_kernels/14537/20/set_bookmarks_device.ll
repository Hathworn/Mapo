; ModuleID = '../data/hip_kernels/14537/20/main.cu'
source_filename = "../data/hip_kernels/14537/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13set_bookmarksP15HIP_vector_typeIiLj2EEiiiPi(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
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
  %18 = icmp sgt i32 %17, %1
  br i1 %18, label %26, label %19

19:                                               ; preds = %5
  %20 = udiv i32 %15, %12
  %21 = mul i32 %20, %12
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %12
  br label %27

26:                                               ; preds = %69, %5
  ret void

27:                                               ; preds = %19, %69
  %28 = phi i32 [ %17, %19 ], [ %70, %69 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %29, i32 0, i32 0, i32 0, i64 0
  %31 = load i32, i32 addrspace(1)* %30, align 8
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %29, i32 0, i32 0, i32 0, i64 1
  %33 = load i32, i32 addrspace(1)* %32, align 4
  %34 = add nsw i32 %28, -1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i64 0
  %37 = load i32, i32 addrspace(1)* %36, align 8
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %35, i32 0, i32 0, i32 0, i64 1
  %39 = load i32, i32 addrspace(1)* %38, align 4
  %40 = sdiv i32 %31, 8
  %41 = sdiv i32 %40, %2
  %42 = sdiv i32 %37, 8
  %43 = sdiv i32 %42, %2
  %44 = sdiv i32 %33, 8
  %45 = sdiv i32 %44, %2
  %46 = sdiv i32 %39, 8
  %47 = sdiv i32 %46, %2
  %48 = icmp eq i32 %28, 0
  %49 = select i1 %48, i32 -1, i32 %43
  %50 = select i1 %48, i32 0, i32 %47
  %51 = icmp eq i32 %28, %1
  %52 = select i1 %51, i32 %3, i32 %41
  %53 = select i1 %51, i32 %3, i32 %45
  %54 = icmp eq i32 %52, %49
  %55 = icmp eq i32 %53, %50
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %69, label %57

57:                                               ; preds = %27
  %58 = mul nsw i32 %50, %3
  %59 = add nsw i32 %58, %49
  %60 = mul nsw i32 %53, %3
  %61 = add nsw i32 %60, %52
  %62 = icmp slt i32 %59, %61
  br i1 %62, label %63, label %69

63:                                               ; preds = %57, %63
  %64 = phi i32 [ %65, %63 ], [ %59, %57 ]
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %66
  store i32 %28, i32 addrspace(1)* %67, align 4, !tbaa !16
  %68 = icmp slt i32 %65, %61
  br i1 %68, label %63, label %69, !llvm.loop !20

69:                                               ; preds = %63, %57, %27
  %70 = add i32 %25, %28
  %71 = icmp sgt i32 %70, %1
  br i1 %71, label %26, label %27, !llvm.loop !22
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
