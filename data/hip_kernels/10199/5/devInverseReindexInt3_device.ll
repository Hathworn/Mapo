; ModuleID = '../data/hip_kernels/10199/5/main.cu'
source_filename = "../data/hip_kernels/10199/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21devInverseReindexInt3iP15HIP_vector_typeIiLj3EES1_Piii(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = icmp eq i32 %5, 0
  br i1 %7, label %22, label %8

8:                                                ; preds = %6
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %0
  br label %23

22:                                               ; preds = %57, %6
  ret void

23:                                               ; preds = %8, %57
  %24 = phi i32 [ 0, %8 ], [ %58, %57 ]
  br i1 %21, label %25, label %57

25:                                               ; preds = %23
  %26 = mul i32 %24, %4
  %27 = udiv i32 %17, %14
  %28 = mul i32 %27, %14
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %14
  br label %33

33:                                               ; preds = %25, %33
  %34 = phi i32 [ %20, %25 ], [ %55, %33 ]
  %35 = add i32 %34, %26
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 0
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !19
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 0
  store i32 %41, i32 addrspace(1)* %42, align 4, !tbaa !16
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 1
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !19
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 1
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !16
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 2
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !16
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !19
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %36, i32 0, i32 0, i32 0, i32 0, i64 2
  store i32 %53, i32 addrspace(1)* %54, align 4, !tbaa !16
  %55 = add i32 %32, %34
  %56 = icmp slt i32 %55, %0
  br i1 %56, label %33, label %57, !llvm.loop !21

57:                                               ; preds = %33, %23
  %58 = add nuw i32 %24, 1
  %59 = icmp eq i32 %58, %5
  br i1 %59, label %22, label %23, !llvm.loop !23
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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
