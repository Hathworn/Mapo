; ModuleID = '../data/hip_kernels/13913/150/main.cu'
source_filename = "../data/hip_kernels/13913/150/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14__fillToInds4DfPfiiiPiiS0_iS0_iS0_i(float %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* readonly %5, i32 %6, i32 addrspace(1)* readonly %7, i32 %8, i32 addrspace(1)* readonly %9, i32 %10, i32 addrspace(1)* readonly %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = udiv i32 %22, %19
  %25 = mul i32 %24, %19
  %26 = icmp ugt i32 %22, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = mul i32 %28, %29
  %31 = add i32 %30, %23
  %32 = mul i32 %31, %19
  %33 = add i32 %32, %14
  %34 = mul i32 %28, %19
  %35 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %36 = bitcast i8 addrspace(4)* %35 to i32 addrspace(4)*
  %37 = load i32, i32 addrspace(4)* %36, align 8, !tbaa !16
  %38 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 2, !range !5, !invariant.load !6
  %41 = zext i16 %40 to i32
  %42 = udiv i32 %37, %41
  %43 = mul i32 %42, %41
  %44 = icmp ugt i32 %37, %43
  %45 = zext i1 %44 to i32
  %46 = add i32 %42, %45
  %47 = mul i32 %34, %46
  %48 = mul nsw i32 %8, %6
  %49 = mul nsw i32 %48, %10
  %50 = sdiv i32 %33, %49
  %51 = mul nsw i32 %50, %49
  %52 = sub nsw i32 %33, %51
  %53 = sdiv i32 %47, %49
  %54 = mul nsw i32 %53, %49
  %55 = sub nsw i32 %47, %54
  %56 = sdiv i32 %52, %48
  %57 = mul nsw i32 %56, %48
  %58 = sub nsw i32 %52, %57
  %59 = sdiv i32 %55, %48
  %60 = mul nsw i32 %59, %48
  %61 = sub nsw i32 %55, %60
  %62 = sdiv i32 %58, %6
  %63 = sdiv i32 %61, %6
  %64 = mul nsw i32 %63, %6
  %65 = sub nsw i32 %61, %64
  %66 = mul nsw i32 %49, %12
  %67 = icmp slt i32 %33, %66
  br i1 %67, label %68, label %134

68:                                               ; preds = %13
  %69 = mul nsw i32 %62, %6
  %70 = sub nsw i32 %58, %69
  %71 = icmp eq i32 addrspace(1)* %11, addrspacecast (i32* null to i32 addrspace(1)*)
  %72 = icmp eq i32 addrspace(1)* %9, addrspacecast (i32* null to i32 addrspace(1)*)
  %73 = icmp eq i32 addrspace(1)* %7, addrspacecast (i32* null to i32 addrspace(1)*)
  %74 = icmp eq i32 addrspace(1)* %5, addrspacecast (i32* null to i32 addrspace(1)*)
  br label %75

75:                                               ; preds = %68, %103
  %76 = phi i32 [ %33, %68 ], [ %132, %103 ]
  %77 = phi i32 [ %50, %68 ], [ %131, %103 ]
  %78 = phi i32 [ %56, %68 ], [ %128, %103 ]
  %79 = phi i32 [ %70, %68 ], [ %117, %103 ]
  %80 = phi i32 [ %62, %68 ], [ %122, %103 ]
  br i1 %71, label %85, label %81

81:                                               ; preds = %75
  %82 = sext i32 %77 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %85

85:                                               ; preds = %81, %75
  %86 = phi i32 [ %84, %81 ], [ %77, %75 ]
  br i1 %72, label %91, label %87

87:                                               ; preds = %85
  %88 = sext i32 %78 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %91

91:                                               ; preds = %87, %85
  %92 = phi i32 [ %90, %87 ], [ %78, %85 ]
  br i1 %73, label %97, label %93

93:                                               ; preds = %91
  %94 = sext i32 %80 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %97

97:                                               ; preds = %93, %91
  %98 = phi i32 [ %96, %93 ], [ %80, %91 ]
  br i1 %74, label %103, label %99

99:                                               ; preds = %97
  %100 = sext i32 %79 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %103

103:                                              ; preds = %99, %97
  %104 = phi i32 [ %102, %99 ], [ %79, %97 ]
  %105 = mul nsw i32 %86, %4
  %106 = add nsw i32 %92, %105
  %107 = mul nsw i32 %106, %3
  %108 = add nsw i32 %98, %107
  %109 = mul nsw i32 %108, %2
  %110 = add nsw i32 %104, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  store float %0, float addrspace(1)* %112, align 4, !tbaa !21
  %113 = add nsw i32 %79, %65
  %114 = icmp sge i32 %113, %6
  %115 = zext i1 %114 to i32
  %116 = select i1 %114, i32 %6, i32 0
  %117 = sub nsw i32 %113, %116
  %118 = add i32 %80, %63
  %119 = add i32 %118, %115
  %120 = icmp sge i32 %119, %8
  %121 = select i1 %120, i32 %8, i32 0
  %122 = sub nsw i32 %119, %121
  %123 = zext i1 %120 to i32
  %124 = add i32 %78, %59
  %125 = add i32 %124, %123
  %126 = icmp sge i32 %125, %10
  %127 = select i1 %126, i32 %10, i32 0
  %128 = sub nsw i32 %125, %127
  %129 = zext i1 %126 to i32
  %130 = add i32 %77, %53
  %131 = add i32 %130, %129
  %132 = add nsw i32 %76, %47
  %133 = icmp slt i32 %132, %66
  br i1 %133, label %75, label %134, !llvm.loop !23

134:                                              ; preds = %103, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!22 = !{!"float", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
