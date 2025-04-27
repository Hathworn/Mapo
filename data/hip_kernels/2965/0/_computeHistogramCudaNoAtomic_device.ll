; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/2965/0/_computeHistogramCudaNoAtomic.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/2965/0/_computeHistogramCudaNoAtomic.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29_computeHistogramCudaNoAtomicPKhmPj(i8 addrspace(1)* noalias nocapture readonly %0, i64 %1, i32 addrspace(1)* noalias nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %8
  %20 = zext i32 %19 to i64
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %13, %21
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %23, %1
  br i1 %24, label %26, label %25

25:                                               ; preds = %26, %3
  ret void

26:                                               ; preds = %3, %26
  %27 = phi i64 [ %34, %26 ], [ %23, %3 ]
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16, !amdgpu.noclobber !5
  %30 = zext i8 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !19
  %33 = add i32 %32, 1
  store i32 %33, i32 addrspace(1)* %31, align 4, !tbaa !19
  %34 = add i64 %27, %20
  %35 = icmp ult i64 %34, %1
  br i1 %35, label %26, label %25, !llvm.loop !21
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
