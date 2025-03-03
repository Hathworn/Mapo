; ModuleID = '../data/hip_kernels/727/5/main.cu'
source_filename = "../data/hip_kernels/727/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z36masquelier_get_indices_to_apply_stdpPiPfS0_S_PbS_fS_m(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i8 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, float %6, i32 addrspace(1)* nocapture readonly %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %11, %16
  %21 = add i32 %20, %10
  %22 = sext i32 %21 to i64
  %23 = icmp ult i64 %22, %8
  br i1 %23, label %24, label %60

24:                                               ; preds = %9
  %25 = udiv i32 %19, %16
  %26 = mul i32 %25, %16
  %27 = icmp ugt i32 %19, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %16
  br label %31

31:                                               ; preds = %24, %56
  %32 = phi i64 [ %22, %24 ], [ %58, %56 ]
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %32
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !20
  %41 = fcmp contract oeq float %40, %6
  %42 = sext i32 %38 to i64
  br i1 %41, label %43, label %46

43:                                               ; preds = %31
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  %45 = atomicrmw xchg i32 addrspace(1)* %44, i32 %35 syncscope("agent-one-as") monotonic, align 4
  br label %46

46:                                               ; preds = %31, %43
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %42
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !22, !range !24
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %50, label %56

50:                                               ; preds = %46
  %51 = load float, float addrspace(1)* %39, align 4, !tbaa !20
  %52 = fcmp contract oeq float %51, %6
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  store i8 1, i8 addrspace(1)* %47, align 1, !tbaa !22
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %42
  %55 = atomicrmw xchg i32 addrspace(1)* %54, i32 %35 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %50, %53, %46
  %57 = add i32 %30, %33
  %58 = sext i32 %57 to i64
  %59 = icmp ult i64 %58, %8
  br i1 %59, label %31, label %60, !llvm.loop !25

60:                                               ; preds = %56, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"bool", !18, i64 0}
!24 = !{i8 0, i8 2}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
