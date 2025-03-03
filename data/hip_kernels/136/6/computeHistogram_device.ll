; ModuleID = '../data/hip_kernels/136/6/main.cu'
source_filename = "../data/hip_kernels/136/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16computeHistogramPjiS_E4temp = internal addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16computeHistogramPjiS_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16computeHistogramPjiS_E4temp, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  %6 = add nuw nsw i32 %4, 256
  %7 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16computeHistogramPjiS_E4temp, i32 0, i32 %6
  store i32 0, i32 addrspace(3)* %7, align 4, !tbaa !5
  %8 = add nuw nsw i32 %4, 512
  %9 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16computeHistogramPjiS_E4temp, i32 0, i32 %8
  store i32 0, i32 addrspace(3)* %9, align 4, !tbaa !5
  %10 = add nuw nsw i32 %4, 768
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16computeHistogramPjiS_E4temp, i32 0, i32 %10
  store i32 0, i32 addrspace(3)* %11, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !10
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !11
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %4
  %23 = udiv i32 %20, %17
  %24 = mul i32 %23, %17
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %17
  %29 = icmp slt i32 %22, %1
  br i1 %29, label %30, label %39

30:                                               ; preds = %3, %30
  %31 = phi i32 [ %37, %30 ], [ %22, %3 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !10
  %35 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16computeHistogramPjiS_E4temp, i32 0, i32 %34
  %36 = atomicrmw add i32 addrspace(3)* %35, i32 1 syncscope("agent-one-as") monotonic, align 4
  %37 = add nsw i32 %31, %28
  %38 = icmp slt i32 %37, %1
  br i1 %38, label %30, label %39, !llvm.loop !20

39:                                               ; preds = %30, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = zext i32 %4 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %43 = atomicrmw add i32 addrspace(1)* %41, i32 %42 syncscope("agent-one-as") monotonic, align 4
  %44 = zext i32 %6 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %46 = load i32, i32 addrspace(3)* %7, align 4, !tbaa !5
  %47 = atomicrmw add i32 addrspace(1)* %45, i32 %46 syncscope("agent-one-as") monotonic, align 4
  %48 = zext i32 %8 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %48
  %50 = load i32, i32 addrspace(3)* %9, align 4, !tbaa !5
  %51 = atomicrmw add i32 addrspace(1)* %49, i32 %50 syncscope("agent-one-as") monotonic, align 4
  %52 = zext i32 %10 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  %54 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %55 = atomicrmw add i32 addrspace(1)* %53, i32 %54 syncscope("agent-one-as") monotonic, align 4
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
