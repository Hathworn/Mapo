; ModuleID = '../data/hip_kernels/9878/17/main.cu'
source_filename = "../data/hip_kernels/9878/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z36prepare_boundary_potential_on_devicePKfPfiiPKiS3_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
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
  br i1 %34, label %35, label %138

35:                                               ; preds = %6
  %36 = and i32 %2, 3
  %37 = icmp ult i32 %2, 4
  br i1 %37, label %113, label %38

38:                                               ; preds = %35
  %39 = and i32 %2, -4
  br label %40

40:                                               ; preds = %109, %38
  %41 = phi i32 [ 0, %38 ], [ %110, %109 ]
  %42 = phi i32 [ 0, %38 ], [ %111, %109 ]
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !6
  %46 = icmp slt i32 %33, %45
  br i1 %46, label %47, label %58

47:                                               ; preds = %40
  %48 = mul nsw i32 %41, %3
  %49 = add nsw i32 %48, %33
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !6
  %53 = add nsw i32 %52, -1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !20
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %56, float addrspace(1)* %57, align 4, !tbaa !20
  br label %58

58:                                               ; preds = %40, %47
  %59 = or i32 %41, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !6
  %63 = icmp slt i32 %33, %62
  br i1 %63, label %64, label %75

64:                                               ; preds = %58
  %65 = mul nsw i32 %59, %3
  %66 = add nsw i32 %65, %33
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !6
  %70 = add nsw i32 %69, -1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !20
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  store float %73, float addrspace(1)* %74, align 4, !tbaa !20
  br label %75

75:                                               ; preds = %64, %58
  %76 = or i32 %41, 2
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !16, !amdgpu.noclobber !6
  %80 = icmp slt i32 %33, %79
  br i1 %80, label %81, label %92

81:                                               ; preds = %75
  %82 = mul nsw i32 %76, %3
  %83 = add nsw i32 %82, %33
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !6
  %87 = add nsw i32 %86, -1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !20
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  store float %90, float addrspace(1)* %91, align 4, !tbaa !20
  br label %92

92:                                               ; preds = %81, %75
  %93 = or i32 %41, 3
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !6
  %97 = icmp slt i32 %33, %96
  br i1 %97, label %98, label %109

98:                                               ; preds = %92
  %99 = mul nsw i32 %93, %3
  %100 = add nsw i32 %99, %33
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !16, !amdgpu.noclobber !6
  %104 = add nsw i32 %103, -1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !20
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %107, float addrspace(1)* %108, align 4, !tbaa !20
  br label %109

109:                                              ; preds = %98, %92
  %110 = add nuw nsw i32 %41, 4
  %111 = add i32 %42, 4
  %112 = icmp eq i32 %111, %39
  br i1 %112, label %113, label %40, !llvm.loop !22

113:                                              ; preds = %109, %35
  %114 = phi i32 [ 0, %35 ], [ %110, %109 ]
  %115 = icmp eq i32 %36, 0
  br i1 %115, label %138, label %116

116:                                              ; preds = %113, %134
  %117 = phi i32 [ %135, %134 ], [ %114, %113 ]
  %118 = phi i32 [ %136, %134 ], [ 0, %113 ]
  %119 = zext i32 %117 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !16, !amdgpu.noclobber !6
  %122 = icmp slt i32 %33, %121
  br i1 %122, label %123, label %134

123:                                              ; preds = %116
  %124 = mul nsw i32 %117, %3
  %125 = add nsw i32 %124, %33
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !6
  %129 = add nsw i32 %128, -1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !20
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  store float %132, float addrspace(1)* %133, align 4, !tbaa !20
  br label %134

134:                                              ; preds = %123, %116
  %135 = add nuw nsw i32 %117, 1
  %136 = add i32 %118, 1
  %137 = icmp eq i32 %136, %36
  br i1 %137, label %138, label %116, !llvm.loop !24

138:                                              ; preds = %113, %134, %6
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
