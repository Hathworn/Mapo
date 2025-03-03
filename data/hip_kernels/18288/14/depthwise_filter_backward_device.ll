; ModuleID = '../data/hip_kernels/18288/14/main.cu'
source_filename = "../data/hip_kernels/18288/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@gradPerBlock = external hidden addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25depthwise_filter_backwardiiiiiiiPKiS0_S0_PKfS2_Pfii(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = icmp slt i32 %16, %13
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  br label %53

24:                                               ; preds = %53, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = add nsw i32 %14, %13
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = icmp slt i32 %26, %0
  br i1 %27, label %28, label %58

28:                                               ; preds = %24
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %31 = getelementptr i8, i8 addrspace(4)* %30, i64 4
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 4, !range !5, !invariant.load !6
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 12
  %36 = bitcast i8 addrspace(4)* %35 to i32 addrspace(4)*
  %37 = load i32, i32 addrspace(4)* %36, align 4, !tbaa !7
  %38 = mul i32 %29, %34
  %39 = add i32 %38, %16
  %40 = mul i32 %5, %4
  %41 = mul nsw i32 %40, %2
  %42 = icmp slt i32 %39, %41
  %43 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 16
  %44 = bitcast i8 addrspace(4)* %43 to i32 addrspace(4)*
  %45 = getelementptr i8, i8 addrspace(4)* %30, i64 6
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = udiv i32 %37, %34
  %50 = mul i32 %49, %34
  %51 = icmp ugt i32 %37, %50
  %52 = zext i1 %51 to i32
  br label %65

53:                                               ; preds = %18, %53
  %54 = phi i32 [ %16, %18 ], [ %56, %53 ]
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gradPerBlock, i32 0, i32 %54
  store float 0.000000e+00, float addrspace(3)* %55, align 4, !tbaa !16
  %56 = add i32 %54, %23
  %57 = icmp slt i32 %56, %13
  br i1 %57, label %53, label %24, !llvm.loop !20

58:                                               ; preds = %78, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %17, label %59, label %133

59:                                               ; preds = %58
  %60 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %61 = getelementptr i8, i8 addrspace(4)* %60, i64 4
  %62 = bitcast i8 addrspace(4)* %61 to i16 addrspace(4)*
  %63 = load i16, i16 addrspace(4)* %62, align 4, !range !5, !invariant.load !6
  %64 = zext i16 %63 to i32
  br label %134

65:                                               ; preds = %28, %78
  %66 = phi i32 [ %26, %28 ], [ %80, %78 ]
  br i1 %42, label %67, label %78

67:                                               ; preds = %65
  %68 = mul nsw i32 %66, %2
  %69 = mul i32 %40, %68
  %70 = mul nsw i32 %66, %1
  %71 = load i32, i32 addrspace(4)* %44, align 8, !tbaa !22
  %72 = udiv i32 %71, %48
  %73 = mul i32 %72, %48
  %74 = icmp ugt i32 %71, %73
  %75 = zext i1 %74 to i32
  %76 = add i32 %72, %75
  %77 = mul i32 %76, %34
  br label %82

78:                                               ; preds = %101, %65
  %79 = add i32 %49, %66
  %80 = add i32 %79, %52
  %81 = icmp slt i32 %80, %0
  br i1 %81, label %65, label %58, !llvm.loop !23

82:                                               ; preds = %67, %101
  %83 = phi i32 [ %39, %67 ], [ %102, %101 ]
  %84 = freeze i32 %83
  %85 = freeze i32 %40
  %86 = sdiv i32 %84, %85
  %87 = mul i32 %86, %85
  %88 = sub i32 %84, %87
  %89 = sdiv i32 %88, %5
  %90 = add nsw i32 %86, %68
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !24, !amdgpu.noclobber !6
  %94 = icmp sgt i32 %93, 0
  br i1 %94, label %95, label %101

95:                                               ; preds = %82
  %96 = mul i32 %90, %6
  %97 = add nsw i32 %83, %69
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %11, i64 %98
  %100 = sitofp i32 %93 to float
  br label %104

101:                                              ; preds = %130, %82
  %102 = add i32 %77, %83
  %103 = icmp slt i32 %102, %41
  br i1 %103, label %82, label %78, !llvm.loop !26

104:                                              ; preds = %95, %130
  %105 = phi i32 [ 0, %95 ], [ %131, %130 ]
  %106 = add nsw i32 %105, %96
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !24, !amdgpu.noclobber !6
  %110 = mul i32 %40, %109
  %111 = add nsw i32 %110, %88
  %112 = icmp sge i32 %111, %14
  %113 = icmp slt i32 %111, %25
  %114 = select i1 %112, i1 %113, i1 false
  br i1 %114, label %115, label %130

115:                                              ; preds = %104
  %116 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !6
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %107
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !24, !amdgpu.noclobber !6
  %119 = add i32 %118, %70
  %120 = mul i32 %119, %4
  %121 = add nsw i32 %120, %89
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %10, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16, !amdgpu.noclobber !6
  %125 = fmul contract float %116, %124
  %126 = fdiv contract float %125, %100
  %127 = sub nsw i32 %111, %14
  %128 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gradPerBlock, i32 0, i32 %127
  %129 = atomicrmw fadd float addrspace(3)* %128, float %126 syncscope("agent-one-as") monotonic, align 4
  br label %130

130:                                              ; preds = %115, %104
  %131 = add nuw nsw i32 %105, 1
  %132 = icmp eq i32 %131, %93
  br i1 %132, label %101, label %104, !llvm.loop !27

133:                                              ; preds = %134, %58
  ret void

134:                                              ; preds = %59, %134
  %135 = phi i32 [ %16, %59 ], [ %142, %134 ]
  %136 = add nsw i32 %135, %14
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %12, i64 %137
  %139 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @gradPerBlock, i32 0, i32 %135
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !16
  %141 = atomicrmw fadd float addrspace(1)* %138, float %140 syncscope("agent-one-as") monotonic, align 4
  %142 = add i32 %135, %64
  %143 = icmp slt i32 %142, %13
  br i1 %143, label %134, label %133, !llvm.loop !28
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!8, !12, i64 16}
!23 = distinct !{!23, !21}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !18, i64 0}
!26 = distinct !{!26, !21}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
