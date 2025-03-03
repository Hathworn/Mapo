; ModuleID = '../data/hip_kernels/13913/35/main.cu'
source_filename = "../data/hip_kernels/13913/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14__fillToInds3DdPdiiPiiS0_iS0_i(double %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 addrspace(1)* readonly %4, i32 %5, i32 addrspace(1)* readonly %6, i32 %7, i32 addrspace(1)* readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %13, %17
  %22 = add i32 %21, %11
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 8, !tbaa !16
  %32 = mul i32 %24, %28
  %33 = add i32 %32, %23
  %34 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %35 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %36 = getelementptr i8, i8 addrspace(4)* %12, i64 8
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !5, !invariant.load !6
  %39 = zext i16 %38 to i32
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 20
  %41 = bitcast i8 addrspace(4)* %40 to i32 addrspace(4)*
  %42 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !17
  %43 = mul i32 %35, %39
  %44 = add i32 %43, %34
  %45 = icmp slt i32 %44, %9
  br i1 %45, label %46, label %125

46:                                               ; preds = %10
  %47 = icmp eq i32 addrspace(1)* %8, addrspacecast (i32* null to i32 addrspace(1)*)
  %48 = icmp slt i32 %33, %7
  %49 = icmp eq i32 addrspace(1)* %6, addrspacecast (i32* null to i32 addrspace(1)*)
  %50 = icmp eq i32 addrspace(1)* %4, addrspacecast (i32* null to i32 addrspace(1)*)
  %51 = icmp slt i32 %22, %5
  %52 = udiv i32 %42, %39
  %53 = mul i32 %52, %39
  %54 = icmp ugt i32 %42, %53
  %55 = zext i1 %54 to i32
  %56 = add i32 %52, %55
  %57 = mul i32 %56, %39
  br label %58

58:                                               ; preds = %46, %122
  %59 = phi i32 [ %44, %46 ], [ %123, %122 ]
  br i1 %47, label %64, label %60

60:                                               ; preds = %58
  %61 = sext i32 %59 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !18, !amdgpu.noclobber !6
  br label %64

64:                                               ; preds = %60, %58
  %65 = phi i32 [ %63, %60 ], [ %59, %58 ]
  br i1 %48, label %66, label %122

66:                                               ; preds = %64
  %67 = mul nsw i32 %65, %3
  %68 = udiv i32 %31, %28
  %69 = mul i32 %68, %28
  %70 = icmp ugt i32 %31, %69
  %71 = zext i1 %70 to i32
  %72 = add i32 %68, %71
  %73 = mul i32 %72, %28
  br label %74

74:                                               ; preds = %66, %119
  %75 = phi i32 [ %33, %66 ], [ %120, %119 ]
  br i1 %49, label %80, label %76

76:                                               ; preds = %74
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !18, !amdgpu.noclobber !6
  br label %80

80:                                               ; preds = %76, %74
  %81 = phi i32 [ %79, %76 ], [ %75, %74 ]
  br i1 %50, label %92, label %82

82:                                               ; preds = %80
  br i1 %51, label %83, label %119

83:                                               ; preds = %82
  %84 = add nsw i32 %81, %67
  %85 = mul nsw i32 %84, %2
  %86 = udiv i32 %20, %17
  %87 = mul i32 %86, %17
  %88 = icmp ugt i32 %20, %87
  %89 = zext i1 %88 to i32
  %90 = add i32 %86, %89
  %91 = mul i32 %90, %17
  br label %102

92:                                               ; preds = %80
  br i1 %51, label %93, label %119

93:                                               ; preds = %92
  %94 = add nsw i32 %81, %67
  %95 = mul nsw i32 %94, %2
  %96 = udiv i32 %20, %17
  %97 = mul i32 %96, %17
  %98 = icmp ugt i32 %20, %97
  %99 = zext i1 %98 to i32
  %100 = add i32 %96, %99
  %101 = mul i32 %100, %17
  br label %112

102:                                              ; preds = %83, %102
  %103 = phi i32 [ %22, %83 ], [ %110, %102 ]
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !18, !amdgpu.noclobber !6
  %107 = add nsw i32 %106, %85
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %108
  store double %0, double addrspace(1)* %109, align 8, !tbaa !22
  %110 = add i32 %91, %103
  %111 = icmp slt i32 %110, %5
  br i1 %111, label %102, label %119, !llvm.loop !24

112:                                              ; preds = %93, %112
  %113 = phi i32 [ %22, %93 ], [ %117, %112 ]
  %114 = add nsw i32 %113, %95
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %1, i64 %115
  store double %0, double addrspace(1)* %116, align 8, !tbaa !22
  %117 = add i32 %101, %113
  %118 = icmp slt i32 %117, %5
  br i1 %118, label %112, label %119, !llvm.loop !26

119:                                              ; preds = %102, %112, %82, %92
  %120 = add i32 %73, %75
  %121 = icmp slt i32 %120, %7
  br i1 %121, label %74, label %122, !llvm.loop !27

122:                                              ; preds = %119, %64
  %123 = add i32 %57, %59
  %124 = icmp slt i32 %123, %9
  br i1 %124, label %58, label %125, !llvm.loop !28

125:                                              ; preds = %122, %10
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
!17 = !{!8, !12, i64 20}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !20, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !25}
!28 = distinct !{!28, !25}
