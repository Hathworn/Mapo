; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/2965/2/_computeHistogramCudaSharedAtomic.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/2965/2/_computeHistogramCudaSharedAtomic.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33_computeHistogramCudaSharedAtomicPKhmPjE4temp = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33_computeHistogramCudaSharedAtomicPKhmPj(i8 addrspace(1)* noalias nocapture readonly %0, i64 %1, i32 addrspace(1)* noalias nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ33_computeHistogramCudaSharedAtomicPKhmPjE4temp, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !9, !invariant.load !10
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !11
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %10
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %10
  %22 = zext i32 %21 to i64
  %23 = add i32 %15, %4
  %24 = zext i32 %23 to i64
  %25 = icmp ult i64 %24, %1
  br i1 %25, label %31, label %26

26:                                               ; preds = %31, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = zext i32 %4 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %29 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %30 = atomicrmw add i32 addrspace(1)* %28, i32 %29 syncscope("agent-one-as") monotonic, align 4
  ret void

31:                                               ; preds = %3, %31
  %32 = phi i64 [ %38, %31 ], [ %24, %3 ]
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !20, !amdgpu.noclobber !10
  %35 = zext i8 %34 to i32
  %36 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ33_computeHistogramCudaSharedAtomicPKhmPjE4temp, i32 0, i32 %35
  %37 = atomicrmw add i32 addrspace(3)* %36, i32 1 syncscope("agent-one-as") monotonic, align 4
  %38 = add i64 %32, %22
  %39 = icmp ult i64 %38, %1
  br i1 %39, label %31, label %26, !llvm.loop !21
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!7, !7, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
