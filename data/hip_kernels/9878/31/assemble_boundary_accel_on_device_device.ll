; ModuleID = '../data/hip_kernels/9878/31/main.cu'
source_filename = "../data/hip_kernels/9878/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z33assemble_boundary_accel_on_devicePfPKfiiPKiS3_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
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
  br i1 %34, label %35, label %146

35:                                               ; preds = %6
  %36 = and i32 %2, 1
  %37 = icmp eq i32 %2, 1
  br i1 %37, label %111, label %38

38:                                               ; preds = %35
  %39 = and i32 %2, -2
  br label %40

40:                                               ; preds = %107, %38
  %41 = phi i32 [ 0, %38 ], [ %108, %107 ]
  %42 = phi i32 [ 0, %38 ], [ %109, %107 ]
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16
  %46 = icmp slt i32 %33, %45
  br i1 %46, label %47, label %74

47:                                               ; preds = %40
  %48 = mul nsw i32 %41, %3
  %49 = add nsw i32 %48, %33
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %53 = mul i32 %52, 3
  %54 = add i32 %53, -3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = mul nsw i32 %49, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !20
  %61 = atomicrmw fadd float addrspace(1)* %56, float %60 syncscope("agent-one-as") monotonic, align 4
  %62 = getelementptr inbounds float, float addrspace(1)* %56, i64 1
  %63 = add nsw i32 %57, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !20
  %67 = atomicrmw fadd float addrspace(1)* %62, float %66 syncscope("agent-one-as") monotonic, align 4
  %68 = getelementptr inbounds float, float addrspace(1)* %56, i64 2
  %69 = add nsw i32 %57, 2
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !20
  %73 = atomicrmw fadd float addrspace(1)* %68, float %72 syncscope("agent-one-as") monotonic, align 4
  br label %74

74:                                               ; preds = %40, %47
  %75 = or i32 %41, 1
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !16
  %79 = icmp slt i32 %33, %78
  br i1 %79, label %80, label %107

80:                                               ; preds = %74
  %81 = mul nsw i32 %75, %3
  %82 = add nsw i32 %81, %33
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !16
  %86 = mul i32 %85, 3
  %87 = add i32 %86, -3
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = mul nsw i32 %82, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !20
  %94 = atomicrmw fadd float addrspace(1)* %89, float %93 syncscope("agent-one-as") monotonic, align 4
  %95 = getelementptr inbounds float, float addrspace(1)* %89, i64 1
  %96 = add nsw i32 %90, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !20
  %100 = atomicrmw fadd float addrspace(1)* %95, float %99 syncscope("agent-one-as") monotonic, align 4
  %101 = getelementptr inbounds float, float addrspace(1)* %89, i64 2
  %102 = add nsw i32 %90, 2
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !20
  %106 = atomicrmw fadd float addrspace(1)* %101, float %105 syncscope("agent-one-as") monotonic, align 4
  br label %107

107:                                              ; preds = %80, %74
  %108 = add nuw nsw i32 %41, 2
  %109 = add i32 %42, 2
  %110 = icmp eq i32 %109, %39
  br i1 %110, label %111, label %40, !llvm.loop !22

111:                                              ; preds = %107, %35
  %112 = phi i32 [ 0, %35 ], [ %108, %107 ]
  %113 = icmp eq i32 %36, 0
  br i1 %113, label %146, label %114

114:                                              ; preds = %111
  %115 = zext i32 %112 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !16
  %118 = icmp slt i32 %33, %117
  br i1 %118, label %119, label %146

119:                                              ; preds = %114
  %120 = mul nsw i32 %112, %3
  %121 = add nsw i32 %120, %33
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !16
  %125 = mul i32 %124, 3
  %126 = add i32 %125, -3
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = mul nsw i32 %121, 3
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !20
  %133 = atomicrmw fadd float addrspace(1)* %128, float %132 syncscope("agent-one-as") monotonic, align 4
  %134 = getelementptr inbounds float, float addrspace(1)* %128, i64 1
  %135 = add nsw i32 %129, 1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !20
  %139 = atomicrmw fadd float addrspace(1)* %134, float %138 syncscope("agent-one-as") monotonic, align 4
  %140 = getelementptr inbounds float, float addrspace(1)* %128, i64 2
  %141 = add nsw i32 %129, 2
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !20
  %145 = atomicrmw fadd float addrspace(1)* %140, float %144 syncscope("agent-one-as") monotonic, align 4
  br label %146

146:                                              ; preds = %111, %119, %114, %6
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
