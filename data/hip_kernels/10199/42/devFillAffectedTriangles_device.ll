; ModuleID = '../data/hip_kernels/10199/42/main.cu'
source_filename = "../data/hip_kernels/10199/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24devFillAffectedTrianglesiPiS_S_P15HIP_vector_typeIiLj2EE(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp ult i32 %17, %0
  br i1 %18, label %19, label %44

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %26

26:                                               ; preds = %19, %26
  %27 = phi i32 [ %17, %19 ], [ %42, %26 ]
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  store i32 %27, i32 addrspace(1)* %31, align 4, !tbaa !16
  %32 = add i32 %27, %0
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  store i32 %27, i32 addrspace(1)* %34, align 4, !tbaa !16
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %35, i32 0, i32 0, i32 0, i64 0
  %37 = load i32, i32 addrspace(1)* %36, align 8, !tbaa !20
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  store i32 %37, i32 addrspace(1)* %38, align 4, !tbaa !16
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %35, i32 0, i32 0, i32 0, i64 1
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !20
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  store i32 %40, i32 addrspace(1)* %41, align 4, !tbaa !16
  %42 = add i32 %25, %27
  %43 = icmp ult i32 %42, %0
  br i1 %43, label %26, label %44, !llvm.loop !21

44:                                               ; preds = %26, %5
  ret void
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
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
