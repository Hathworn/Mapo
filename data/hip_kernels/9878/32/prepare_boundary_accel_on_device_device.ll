; ModuleID = '../data/hip_kernels/9878/32/main.cu'
source_filename = "../data/hip_kernels/9878/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32prepare_boundary_accel_on_devicePKfPfiiPKiS3_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
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
  br i1 %34, label %35, label %149

35:                                               ; preds = %6
  %36 = and i32 %2, 1
  %37 = icmp eq i32 %2, 1
  br i1 %37, label %113, label %38

38:                                               ; preds = %35
  %39 = and i32 %2, -2
  br label %40

40:                                               ; preds = %109, %38
  %41 = phi i32 [ 0, %38 ], [ %110, %109 ]
  %42 = phi i32 [ 0, %38 ], [ %111, %109 ]
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !6
  %46 = icmp slt i32 %33, %45
  br i1 %46, label %47, label %75

47:                                               ; preds = %40
  %48 = mul nsw i32 %41, %3
  %49 = add nsw i32 %48, %33
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !6
  %53 = mul i32 %52, 3
  %54 = add i32 %53, -3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !20
  %58 = mul nsw i32 %49, 3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !20
  %61 = add i32 %53, -2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !20
  %65 = add nsw i32 %58, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %64, float addrspace(1)* %67, align 4, !tbaa !20
  %68 = add i32 %53, -1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !20
  %72 = add nsw i32 %58, 2
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  store float %71, float addrspace(1)* %74, align 4, !tbaa !20
  br label %75

75:                                               ; preds = %40, %47
  %76 = or i32 %41, 1
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !16, !amdgpu.noclobber !6
  %80 = icmp slt i32 %33, %79
  br i1 %80, label %81, label %109

81:                                               ; preds = %75
  %82 = mul nsw i32 %76, %3
  %83 = add nsw i32 %82, %33
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !6
  %87 = mul i32 %86, 3
  %88 = add i32 %87, -3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !20
  %92 = mul nsw i32 %83, 3
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  store float %91, float addrspace(1)* %94, align 4, !tbaa !20
  %95 = add i32 %87, -2
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !20
  %99 = add nsw i32 %92, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !20
  %102 = add i32 %87, -1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !20
  %106 = add nsw i32 %92, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %105, float addrspace(1)* %108, align 4, !tbaa !20
  br label %109

109:                                              ; preds = %81, %75
  %110 = add nuw nsw i32 %41, 2
  %111 = add i32 %42, 2
  %112 = icmp eq i32 %111, %39
  br i1 %112, label %113, label %40, !llvm.loop !22

113:                                              ; preds = %109, %35
  %114 = phi i32 [ 0, %35 ], [ %110, %109 ]
  %115 = icmp eq i32 %36, 0
  br i1 %115, label %149, label %116

116:                                              ; preds = %113
  %117 = zext i32 %114 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !6
  %120 = icmp slt i32 %33, %119
  br i1 %120, label %121, label %149

121:                                              ; preds = %116
  %122 = mul nsw i32 %114, %3
  %123 = add nsw i32 %122, %33
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !6
  %127 = mul i32 %126, 3
  %128 = add i32 %127, -3
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !20
  %132 = mul nsw i32 %123, 3
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !20
  %135 = add i32 %127, -2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !20
  %139 = add nsw i32 %132, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  store float %138, float addrspace(1)* %141, align 4, !tbaa !20
  %142 = add i32 %127, -1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !20
  %146 = add nsw i32 %132, 2
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  store float %145, float addrspace(1)* %148, align 4, !tbaa !20
  br label %149

149:                                              ; preds = %113, %121, %116, %6
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
