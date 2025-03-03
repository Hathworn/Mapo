; ModuleID = '../data/hip_kernels/1614/3/main.cu'
source_filename = "../data/hip_kernels/1614/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20NmDistanceGradKerneliiPKfiS0_S0_PKiPfS3_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %36

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7
  %23 = mul i32 %14, %19
  %24 = add i32 %23, %13
  %25 = icmp slt i32 %24, %1
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %22, %19
  %33 = mul i32 %32, %19
  %34 = icmp ugt i32 %22, %33
  %35 = zext i1 %34 to i32
  br label %37

36:                                               ; preds = %49, %9
  ret void

37:                                               ; preds = %12, %49
  %38 = phi i32 [ %10, %12 ], [ %51, %49 ]
  br i1 %25, label %39, label %49

39:                                               ; preds = %37
  %40 = mul nsw i32 %38, %1
  %41 = mul nsw i32 %38, %3
  %42 = load i32, i32 addrspace(4)* %27, align 8, !tbaa !16
  %43 = udiv i32 %42, %31
  %44 = mul i32 %43, %31
  %45 = icmp ugt i32 %42, %44
  %46 = zext i1 %45 to i32
  %47 = add i32 %43, %46
  %48 = mul i32 %47, %19
  br label %53

49:                                               ; preds = %53, %37
  %50 = add i32 %32, %38
  %51 = add i32 %50, %35
  %52 = icmp slt i32 %51, %0
  br i1 %52, label %37, label %36, !llvm.loop !17

53:                                               ; preds = %39, %53
  %54 = phi i32 [ %24, %39 ], [ %138, %53 ]
  %55 = add nsw i32 %54, %40
  %56 = mul nsw i32 %55, 5
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !19
  %60 = add nsw i32 %56, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !19
  %64 = add nsw i32 %56, 2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !19
  %68 = add nsw i32 %56, 3
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !19
  %72 = add nsw i32 %56, 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !19
  %76 = sext i32 %55 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !23
  %79 = add nsw i32 %78, %41
  %80 = mul nsw i32 %79, 5
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !19
  %84 = add nsw i32 %80, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !19
  %88 = add nsw i32 %80, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !19
  %92 = add nsw i32 %80, 3
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !19
  %96 = add nsw i32 %80, 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %4, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !19
  %100 = getelementptr inbounds float, float addrspace(1)* %5, i64 %76
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !19
  %102 = fmul contract float %101, 2.000000e+00
  %103 = getelementptr inbounds float, float addrspace(1)* %7, i64 %57
  %104 = fsub contract float %59, %83
  %105 = fmul contract float %104, %102
  %106 = atomicrmw fadd float addrspace(1)* %103, float %105 syncscope("agent-one-as") monotonic, align 4
  %107 = getelementptr inbounds float, float addrspace(1)* %7, i64 %61
  %108 = fsub contract float %63, %87
  %109 = fmul contract float %108, %102
  %110 = atomicrmw fadd float addrspace(1)* %107, float %109 syncscope("agent-one-as") monotonic, align 4
  %111 = getelementptr inbounds float, float addrspace(1)* %7, i64 %65
  %112 = fsub contract float %67, %91
  %113 = fmul contract float %112, %102
  %114 = atomicrmw fadd float addrspace(1)* %111, float %113 syncscope("agent-one-as") monotonic, align 4
  %115 = getelementptr inbounds float, float addrspace(1)* %7, i64 %69
  %116 = fsub contract float %71, %95
  %117 = fmul contract float %116, %102
  %118 = atomicrmw fadd float addrspace(1)* %115, float %117 syncscope("agent-one-as") monotonic, align 4
  %119 = getelementptr inbounds float, float addrspace(1)* %7, i64 %73
  %120 = fsub contract float %75, %99
  %121 = fmul contract float %120, %102
  %122 = atomicrmw fadd float addrspace(1)* %119, float %121 syncscope("agent-one-as") monotonic, align 4
  %123 = getelementptr inbounds float, float addrspace(1)* %8, i64 %81
  %124 = fneg contract float %105
  %125 = atomicrmw fadd float addrspace(1)* %123, float %124 syncscope("agent-one-as") monotonic, align 4
  %126 = getelementptr inbounds float, float addrspace(1)* %8, i64 %85
  %127 = fneg contract float %109
  %128 = atomicrmw fadd float addrspace(1)* %126, float %127 syncscope("agent-one-as") monotonic, align 4
  %129 = getelementptr inbounds float, float addrspace(1)* %8, i64 %89
  %130 = fneg contract float %113
  %131 = atomicrmw fadd float addrspace(1)* %129, float %130 syncscope("agent-one-as") monotonic, align 4
  %132 = getelementptr inbounds float, float addrspace(1)* %8, i64 %93
  %133 = fneg contract float %117
  %134 = atomicrmw fadd float addrspace(1)* %132, float %133 syncscope("agent-one-as") monotonic, align 4
  %135 = getelementptr inbounds float, float addrspace(1)* %8, i64 %97
  %136 = fneg contract float %121
  %137 = atomicrmw fadd float addrspace(1)* %135, float %136 syncscope("agent-one-as") monotonic, align 4
  %138 = add i32 %48, %54
  %139 = icmp slt i32 %138, %1
  br i1 %139, label %53, label %49, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!16 = !{!8, !12, i64 16}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !21, i64 0}
!25 = distinct !{!25, !18}
