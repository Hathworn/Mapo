; ModuleID = '../data/hip_kernels/153/0/main.cu'
source_filename = "../data/hip_kernels/153/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13run_reductionPbS_PiiS0_E12s_block_conv = internal unnamed_addr addrspace(3) global i8 undef, align 1

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13run_reductionPbS_PiiS0_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = sext i32 %22 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !16, !amdgpu.noclobber !14
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !14
  store i8 1, i8 addrspace(3)* @_ZZ13run_reductionPbS_PiiS0_E12s_block_conv, align 1, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp slt i32 %23, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %5
  %32 = mul nsw i32 %26, %14
  %33 = add nsw i32 %32, %23
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !20, !range !22, !amdgpu.noclobber !14
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %31
  store i8 0, i8 addrspace(3)* @_ZZ13run_reductionPbS_PiiS0_E12s_block_conv, align 1, !tbaa !20
  br label %39

39:                                               ; preds = %31, %38, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp eq i32 %23, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %39
  %42 = load i8, i8 addrspace(3)* @_ZZ13run_reductionPbS_PiiS0_E12s_block_conv, align 1, !tbaa !20, !range !22
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %27
  store i8 %42, i8 addrspace(1)* %43, align 1, !tbaa !20
  br label %44

44:                                               ; preds = %41, %39
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"bool", !18, i64 0}
!22 = !{i8 0, i8 2}
