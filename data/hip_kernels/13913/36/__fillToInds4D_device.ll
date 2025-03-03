; ModuleID = '../data/hip_kernels/13913/36/main.cu'
source_filename = "../data/hip_kernels/13913/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14__fillToInds4DdPdiiiPiiS0_iS0_iS0_iiiii(double %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* readonly %5, i32 %6, i32 addrspace(1)* readonly %7, i32 %8, i32 addrspace(1)* readonly %9, i32 %10, i32 addrspace(1)* readonly %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !7
  %28 = mul i32 %20, %24
  %29 = add i32 %28, %18
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 16
  %37 = bitcast i8 addrspace(4)* %36 to i32 addrspace(4)*
  %38 = load i32, i32 addrspace(4)* %37, align 8, !tbaa !16
  %39 = mul i32 %31, %35
  %40 = add i32 %39, %30
  %41 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %42 = udiv i32 %41, %15
  %43 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %44 = udiv i32 %43, %16
  %45 = mul i32 %44, %16
  %46 = mul nsw i32 %44, %13
  %47 = add nsw i32 %46, %42
  %48 = add i32 %45, %42
  %49 = sub i32 %43, %48
  %50 = mul i32 %49, %15
  %51 = add i32 %50, %41
  %52 = icmp slt i32 %51, %12
  br i1 %52, label %53, label %144

53:                                               ; preds = %17
  %54 = icmp eq i32 addrspace(1)* %11, addrspacecast (i32* null to i32 addrspace(1)*)
  %55 = icmp slt i32 %47, %10
  %56 = icmp eq i32 addrspace(1)* %9, addrspacecast (i32* null to i32 addrspace(1)*)
  %57 = icmp slt i32 %40, %8
  %58 = icmp eq i32 addrspace(1)* %7, addrspacecast (i32* null to i32 addrspace(1)*)
  %59 = icmp eq i32 addrspace(1)* %5, addrspacecast (i32* null to i32 addrspace(1)*)
  %60 = icmp slt i32 %29, %6
  %61 = mul nsw i32 %14, %13
  %62 = mul nsw i32 %16, %15
  br label %63

63:                                               ; preds = %53, %141
  %64 = phi i32 [ %51, %53 ], [ %142, %141 ]
  br i1 %54, label %69, label %65

65:                                               ; preds = %63
  %66 = sext i32 %64 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %69

69:                                               ; preds = %65, %63
  %70 = phi i32 [ %68, %65 ], [ %64, %63 ]
  br i1 %55, label %71, label %141

71:                                               ; preds = %69
  %72 = mul nsw i32 %70, %4
  br label %73

73:                                               ; preds = %71, %138
  %74 = phi i32 [ %47, %71 ], [ %139, %138 ]
  br i1 %56, label %79, label %75

75:                                               ; preds = %73
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %79

79:                                               ; preds = %75, %73
  %80 = phi i32 [ %78, %75 ], [ %74, %73 ]
  br i1 %57, label %81, label %138

81:                                               ; preds = %79
  %82 = add nsw i32 %80, %72
  %83 = mul nsw i32 %82, %3
  %84 = udiv i32 %38, %35
  %85 = mul i32 %84, %35
  %86 = icmp ugt i32 %38, %85
  %87 = zext i1 %86 to i32
  %88 = add i32 %84, %87
  %89 = mul i32 %88, %35
  br label %90

90:                                               ; preds = %81, %135
  %91 = phi i32 [ %40, %81 ], [ %136, %135 ]
  br i1 %58, label %96, label %92

92:                                               ; preds = %90
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %96

96:                                               ; preds = %92, %90
  %97 = phi i32 [ %95, %92 ], [ %91, %90 ]
  br i1 %59, label %108, label %98

98:                                               ; preds = %96
  br i1 %60, label %99, label %135

99:                                               ; preds = %98
  %100 = add nsw i32 %97, %83
  %101 = mul nsw i32 %100, %2
  %102 = udiv i32 %27, %24
  %103 = mul i32 %102, %24
  %104 = icmp ugt i32 %27, %103
  %105 = zext i1 %104 to i32
  %106 = add i32 %102, %105
  %107 = mul i32 %106, %24
  br label %118

108:                                              ; preds = %96
  br i1 %60, label %109, label %135

109:                                              ; preds = %108
  %110 = add nsw i32 %97, %83
  %111 = mul nsw i32 %110, %2
  %112 = udiv i32 %27, %24
  %113 = mul i32 %112, %24
  %114 = icmp ugt i32 %27, %113
  %115 = zext i1 %114 to i32
  %116 = add i32 %112, %115
  %117 = mul i32 %116, %24
  br label %128

118:                                              ; preds = %99, %118
  %119 = phi i32 [ %29, %99 ], [ %126, %118 ]
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !17, !amdgpu.noclobber !6
  %123 = add nsw i32 %122, %101
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %1, i64 %124
  store double %0, double addrspace(1)* %125, align 8, !tbaa !21
  %126 = add i32 %107, %119
  %127 = icmp slt i32 %126, %6
  br i1 %127, label %118, label %135, !llvm.loop !23

128:                                              ; preds = %109, %128
  %129 = phi i32 [ %29, %109 ], [ %133, %128 ]
  %130 = add nsw i32 %129, %111
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %1, i64 %131
  store double %0, double addrspace(1)* %132, align 8, !tbaa !21
  %133 = add i32 %117, %129
  %134 = icmp slt i32 %133, %6
  br i1 %134, label %128, label %135, !llvm.loop !25

135:                                              ; preds = %118, %128, %98, %108
  %136 = add i32 %89, %91
  %137 = icmp slt i32 %136, %8
  br i1 %137, label %90, label %138, !llvm.loop !26

138:                                              ; preds = %135, %79
  %139 = add nsw i32 %74, %61
  %140 = icmp slt i32 %139, %10
  br i1 %140, label %73, label %141, !llvm.loop !27

141:                                              ; preds = %138, %69
  %142 = add nsw i32 %64, %62
  %143 = icmp slt i32 %142, %12
  br i1 %143, label %63, label %144, !llvm.loop !28

144:                                              ; preds = %141, %17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"double", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24}
