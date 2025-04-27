; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/3879/14/add.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/3879/14/add.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3addPK15HIP_vector_typeIfLj3EEjPS0_(%struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %0, i32 %1, %struct.HIP_vector_type addrspace(1)* noalias nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %1
  br i1 %22, label %23, label %44

23:                                               ; preds = %3
  %24 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !16
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16, !amdgpu.noclobber !5
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %30

30:                                               ; preds = %23, %30
  %31 = phi i32 [ %15, %23 ], [ %42, %30 ]
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %32, i32 0, i32 0, i32 0, i32 0, i64 0
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fadd contract float %25, %34
  store float %35, float addrspace(1)* %33, align 4, !tbaa !16
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %32, i32 0, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %38 = fadd contract float %27, %37
  store float %38, float addrspace(1)* %36, align 4, !tbaa !16
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %32, i32 0, i32 0, i32 0, i32 0, i64 2
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = fadd contract float %29, %40
  store float %41, float addrspace(1)* %39, align 4, !tbaa !16
  %42 = add i32 %31, %21
  %43 = icmp ult i32 %42, %1
  br i1 %43, label %30, label %44, !llvm.loop !19

44:                                               ; preds = %30, %3
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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
