; ModuleID = '../data/hip_kernels/9878/4/main.cu'
source_filename = "../data/hip_kernels/9878/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z37assemble_boundary_potential_on_devicePfPKfiiPKiS3_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = udiv i32 %16, %13
  %18 = mul i32 %17, %13
  %19 = icmp ugt i32 %16, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = mul i32 %29, %21
  %31 = add i32 %30, %8
  %32 = mul i32 %31, %13
  %33 = add i32 %32, %7
  %34 = icmp sgt i32 %2, 0
  br i1 %34, label %35, label %143

35:                                               ; preds = %6
  %36 = and i32 %2, 3
  %37 = icmp ult i32 %2, 4
  br i1 %37, label %117, label %38

38:                                               ; preds = %35
  %39 = and i32 %2, -4
  br label %40

40:                                               ; preds = %113, %38
  %41 = phi i32 [ 0, %38 ], [ %114, %113 ]
  %42 = phi i32 [ 0, %38 ], [ %115, %113 ]
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16
  %46 = icmp slt i32 %33, %45
  br i1 %46, label %47, label %59

47:                                               ; preds = %40
  %48 = mul nsw i32 %41, %3
  %49 = add nsw i32 %48, %33
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %53 = add nsw i32 %52, -1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !20
  %58 = atomicrmw fadd float addrspace(1)* %55, float %57 syncscope("agent-one-as") monotonic, align 4
  br label %59

59:                                               ; preds = %40, %47
  %60 = or i32 %41, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !16
  %64 = icmp slt i32 %33, %63
  br i1 %64, label %65, label %77

65:                                               ; preds = %59
  %66 = mul nsw i32 %60, %3
  %67 = add nsw i32 %66, %33
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !16
  %71 = add nsw i32 %70, -1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !20
  %76 = atomicrmw fadd float addrspace(1)* %73, float %75 syncscope("agent-one-as") monotonic, align 4
  br label %77

77:                                               ; preds = %65, %59
  %78 = or i32 %41, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !16
  %82 = icmp slt i32 %33, %81
  br i1 %82, label %83, label %95

83:                                               ; preds = %77
  %84 = mul nsw i32 %78, %3
  %85 = add nsw i32 %84, %33
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16
  %89 = add nsw i32 %88, -1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !20
  %94 = atomicrmw fadd float addrspace(1)* %91, float %93 syncscope("agent-one-as") monotonic, align 4
  br label %95

95:                                               ; preds = %83, %77
  %96 = or i32 %41, 3
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  %100 = icmp slt i32 %33, %99
  br i1 %100, label %101, label %113

101:                                              ; preds = %95
  %102 = mul nsw i32 %96, %3
  %103 = add nsw i32 %102, %33
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !16
  %107 = add nsw i32 %106, -1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !20
  %112 = atomicrmw fadd float addrspace(1)* %109, float %111 syncscope("agent-one-as") monotonic, align 4
  br label %113

113:                                              ; preds = %101, %95
  %114 = add nuw nsw i32 %41, 4
  %115 = add i32 %42, 4
  %116 = icmp eq i32 %115, %39
  br i1 %116, label %117, label %40, !llvm.loop !22

117:                                              ; preds = %113, %35
  %118 = phi i32 [ 0, %35 ], [ %114, %113 ]
  %119 = icmp eq i32 %36, 0
  br i1 %119, label %143, label %120

120:                                              ; preds = %117, %139
  %121 = phi i32 [ %140, %139 ], [ %118, %117 ]
  %122 = phi i32 [ %141, %139 ], [ 0, %117 ]
  %123 = zext i32 %121 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !16
  %126 = icmp slt i32 %33, %125
  br i1 %126, label %127, label %139

127:                                              ; preds = %120
  %128 = mul nsw i32 %121, %3
  %129 = add nsw i32 %128, %33
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !16
  %133 = add nsw i32 %132, -1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !20
  %138 = atomicrmw fadd float addrspace(1)* %135, float %137 syncscope("agent-one-as") monotonic, align 4
  br label %139

139:                                              ; preds = %127, %120
  %140 = add nuw nsw i32 %121, 1
  %141 = add i32 %122, 1
  %142 = icmp eq i32 %141, %36
  br i1 %142, label %143, label %120, !llvm.loop !24

143:                                              ; preds = %117, %139, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
