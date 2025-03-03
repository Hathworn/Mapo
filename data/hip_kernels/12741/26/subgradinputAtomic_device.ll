; ModuleID = '../data/hip_kernels/12741/26/main.cu'
source_filename = "../data/hip_kernels/12741/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z18subgradinputAtomicPfS_S_iiiiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = sub nsw i32 %5, %7
  %12 = sdiv i32 %11, %9
  %13 = add nsw i32 %12, 1
  %14 = sub nsw i32 %4, %6
  %15 = sdiv i32 %14, %8
  %16 = add nsw i32 %15, 1
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = urem i32 %17, %3
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 16
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 8, !tbaa !7
  %33 = mul i32 %25, %29
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %35 = add i32 %33, %34
  %36 = udiv i32 %32, %29
  %37 = mul i32 %36, %29
  %38 = icmp ugt i32 %32, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %29
  %42 = mul nsw i32 %13, %17
  %43 = mul nsw i32 %42, %16
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = mul i32 %17, %4
  %47 = mul i32 %46, %5
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = sext i32 %18 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !6
  %53 = icmp sgt i32 %35, %15
  br i1 %53, label %145, label %54

54:                                               ; preds = %10
  %55 = icmp sgt i32 %19, %12
  %56 = mul i32 %8, %5
  %57 = icmp sgt i32 %6, 0
  %58 = icmp sgt i32 %7, 0
  %59 = sext i32 %5 to i64
  %60 = and i32 %7, 7
  %61 = icmp ult i32 %7, 8
  %62 = and i32 %7, -8
  %63 = icmp eq i32 %60, 0
  br label %64

64:                                               ; preds = %54, %142
  %65 = phi i32 [ %35, %54 ], [ %143, %142 ]
  br i1 %55, label %142, label %66

66:                                               ; preds = %64
  %67 = mul i32 %56, %65
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %49, i64 %68
  %70 = mul nsw i32 %65, %13
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %45, i64 %71
  br label %73

73:                                               ; preds = %66, %139
  %74 = phi i32 [ %19, %66 ], [ %140, %139 ]
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %72, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fmul contract float %52, %77
  br i1 %57, label %79, label %139

79:                                               ; preds = %73
  %80 = mul nsw i32 %74, %9
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %69, i64 %81
  br label %83

83:                                               ; preds = %79, %135
  %84 = phi i32 [ %137, %135 ], [ 0, %79 ]
  %85 = phi float addrspace(1)* [ %136, %135 ], [ %82, %79 ]
  br i1 %58, label %86, label %135

86:                                               ; preds = %83
  br i1 %61, label %124, label %87

87:                                               ; preds = %86, %87
  %88 = phi i32 [ %121, %87 ], [ 0, %86 ]
  %89 = phi i32 [ %122, %87 ], [ 0, %86 ]
  %90 = zext i32 %88 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %85, i64 %90
  %92 = atomicrmw fadd float addrspace(1)* %91, float %78 syncscope("agent-one-as") monotonic, align 4
  %93 = or i32 %88, 1
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %85, i64 %94
  %96 = atomicrmw fadd float addrspace(1)* %95, float %78 syncscope("agent-one-as") monotonic, align 4
  %97 = or i32 %88, 2
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %85, i64 %98
  %100 = atomicrmw fadd float addrspace(1)* %99, float %78 syncscope("agent-one-as") monotonic, align 4
  %101 = or i32 %88, 3
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %85, i64 %102
  %104 = atomicrmw fadd float addrspace(1)* %103, float %78 syncscope("agent-one-as") monotonic, align 4
  %105 = or i32 %88, 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %85, i64 %106
  %108 = atomicrmw fadd float addrspace(1)* %107, float %78 syncscope("agent-one-as") monotonic, align 4
  %109 = or i32 %88, 5
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %85, i64 %110
  %112 = atomicrmw fadd float addrspace(1)* %111, float %78 syncscope("agent-one-as") monotonic, align 4
  %113 = or i32 %88, 6
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %85, i64 %114
  %116 = atomicrmw fadd float addrspace(1)* %115, float %78 syncscope("agent-one-as") monotonic, align 4
  %117 = or i32 %88, 7
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %85, i64 %118
  %120 = atomicrmw fadd float addrspace(1)* %119, float %78 syncscope("agent-one-as") monotonic, align 4
  %121 = add nuw nsw i32 %88, 8
  %122 = add i32 %89, 8
  %123 = icmp eq i32 %122, %62
  br i1 %123, label %124, label %87, !llvm.loop !20

124:                                              ; preds = %87, %86
  %125 = phi i32 [ 0, %86 ], [ %121, %87 ]
  br i1 %63, label %135, label %126

126:                                              ; preds = %124, %126
  %127 = phi i32 [ %132, %126 ], [ %125, %124 ]
  %128 = phi i32 [ %133, %126 ], [ 0, %124 ]
  %129 = zext i32 %127 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %85, i64 %129
  %131 = atomicrmw fadd float addrspace(1)* %130, float %78 syncscope("agent-one-as") monotonic, align 4
  %132 = add nuw nsw i32 %127, 1
  %133 = add i32 %128, 1
  %134 = icmp eq i32 %133, %60
  br i1 %134, label %135, label %126, !llvm.loop !22

135:                                              ; preds = %124, %126, %83
  %136 = getelementptr inbounds float, float addrspace(1)* %85, i64 %59
  %137 = add nuw nsw i32 %84, 1
  %138 = icmp eq i32 %137, %6
  br i1 %138, label %139, label %83, !llvm.loop !24

139:                                              ; preds = %135, %73
  %140 = add nuw nsw i32 %74, %24
  %141 = icmp sgt i32 %140, %12
  br i1 %141, label %142, label %73, !llvm.loop !25

142:                                              ; preds = %139, %64
  %143 = add nsw i32 %65, %41
  %144 = icmp sgt i32 %143, %15
  br i1 %144, label %145, label %64, !llvm.loop !26

145:                                              ; preds = %142, %10
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
!7 = !{!8, !12, i64 16}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
