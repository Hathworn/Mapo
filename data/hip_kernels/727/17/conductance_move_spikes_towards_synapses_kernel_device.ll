; ModuleID = '../data/hip_kernels/727/17/main.cu'
source_filename = "../data/hip_kernels/727/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z47conductance_move_spikes_towards_synapses_kernelPifS_S_iiiPfS_S0_S_iS0_S0_f(i32 addrspace(1)* nocapture readnone %0, float %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10, i32 %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !7
  %26 = mul i32 %17, %22
  %27 = add i32 %26, %16
  %28 = sext i32 %4 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16
  %31 = icmp slt i32 %27, %30
  br i1 %31, label %32, label %65

32:                                               ; preds = %15
  %33 = mul nsw i32 %6, %4
  %34 = udiv i32 %25, %22
  %35 = mul i32 %34, %22
  %36 = icmp ugt i32 %25, %35
  %37 = zext i1 %36 to i32
  %38 = add i32 %34, %37
  %39 = mul i32 %38, %22
  br label %40

40:                                               ; preds = %32, %40
  %41 = phi i32 [ %27, %32 ], [ %62, %40 ]
  %42 = add nsw i32 %41, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  store float %1, float addrspace(1)* %47, align 4, !tbaa !20
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %46
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %46
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !16
  %52 = getelementptr inbounds float, float addrspace(1)* %13, i64 %46
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !20
  %54 = getelementptr inbounds float, float addrspace(1)* %12, i64 %46
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !20
  %56 = fmul contract float %53, %55
  %57 = mul nsw i32 %51, %11
  %58 = add nsw i32 %57, %49
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %9, i64 %59
  %61 = atomicrmw fadd float addrspace(1)* %60, float %56 syncscope("agent-one-as") monotonic, align 4
  %62 = add i32 %39, %41
  %63 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %40, label %65, !llvm.loop !22

65:                                               ; preds = %40, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
