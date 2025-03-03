; ModuleID = '../data/hip_kernels/24/14/main.cu'
source_filename = "../data/hip_kernels/24/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20twiddleImgKernelIDFTPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %143

14:                                               ; preds = %3
  %15 = icmp eq i32 %12, 0
  br i1 %15, label %16, label %52

16:                                               ; preds = %14
  %17 = icmp sgt i32 %2, 0
  br i1 %17, label %18, label %143

18:                                               ; preds = %16
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %113, label %21

21:                                               ; preds = %18
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %49, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %50, %23 ]
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float 0.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = or i32 %24, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float 0.000000e+00, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = or i32 %24, 2
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !7
  %34 = or i32 %24, 3
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float 0.000000e+00, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = or i32 %24, 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float 0.000000e+00, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = or i32 %24, 5
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float 0.000000e+00, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %24, 6
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float 0.000000e+00, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i32 %24, 7
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %24, 8
  %50 = add i32 %25, 8
  %51 = icmp eq i32 %50, %22
  br i1 %51, label %113, label %23, !llvm.loop !11

52:                                               ; preds = %14
  %53 = mul nsw i32 %12, %2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  store float 0.000000e+00, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = icmp sgt i32 %2, 1
  br i1 %56, label %57, label %143

57:                                               ; preds = %52
  %58 = add i32 %2, -1
  %59 = add i32 %2, -2
  %60 = and i32 %58, 3
  %61 = icmp ult i32 %59, 3
  br i1 %61, label %124, label %62

62:                                               ; preds = %57
  %63 = and i32 %58, -4
  br label %64

64:                                               ; preds = %64, %62
  %65 = phi i32 [ 1, %62 ], [ %110, %64 ]
  %66 = phi i32 [ 0, %62 ], [ %111, %64 ]
  %67 = mul nsw i32 %65, %12
  %68 = srem i32 %67, %2
  %69 = shl nsw i32 %68, 1
  %70 = add nuw nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = add nsw i32 %65, %53
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float %73, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = add nuw nsw i32 %65, 1
  %78 = mul nsw i32 %77, %12
  %79 = srem i32 %78, %2
  %80 = shl nsw i32 %79, 1
  %81 = add nuw nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = add nsw i32 %77, %53
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float %84, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = add nuw nsw i32 %65, 2
  %89 = mul nsw i32 %88, %12
  %90 = srem i32 %89, %2
  %91 = shl nsw i32 %90, 1
  %92 = add nuw nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = add nsw i32 %88, %53
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  store float %95, float addrspace(1)* %98, align 4, !tbaa !7
  %99 = add nuw nsw i32 %65, 3
  %100 = mul nsw i32 %99, %12
  %101 = srem i32 %100, %2
  %102 = shl nsw i32 %101, 1
  %103 = add nuw nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = add nsw i32 %99, %53
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  store float %106, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = add nuw nsw i32 %65, 4
  %111 = add i32 %66, 4
  %112 = icmp eq i32 %111, %63
  br i1 %112, label %124, label %64, !llvm.loop !13

113:                                              ; preds = %23, %18
  %114 = phi i32 [ 0, %18 ], [ %49, %23 ]
  %115 = icmp eq i32 %19, 0
  br i1 %115, label %143, label %116

116:                                              ; preds = %113, %116
  %117 = phi i32 [ %121, %116 ], [ %114, %113 ]
  %118 = phi i32 [ %122, %116 ], [ 0, %113 ]
  %119 = zext i32 %117 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  store float 0.000000e+00, float addrspace(1)* %120, align 4, !tbaa !7
  %121 = add nuw nsw i32 %117, 1
  %122 = add i32 %118, 1
  %123 = icmp eq i32 %122, %19
  br i1 %123, label %143, label %116, !llvm.loop !14

124:                                              ; preds = %64, %57
  %125 = phi i32 [ 1, %57 ], [ %110, %64 ]
  %126 = icmp eq i32 %60, 0
  br i1 %126, label %143, label %127

127:                                              ; preds = %124, %127
  %128 = phi i32 [ %140, %127 ], [ %125, %124 ]
  %129 = phi i32 [ %141, %127 ], [ 0, %124 ]
  %130 = mul nsw i32 %128, %12
  %131 = srem i32 %130, %2
  %132 = shl nsw i32 %131, 1
  %133 = add nuw nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = add nsw i32 %128, %53
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  store float %136, float addrspace(1)* %139, align 4, !tbaa !7
  %140 = add nuw nsw i32 %128, 1
  %141 = add i32 %129, 1
  %142 = icmp eq i32 %141, %60
  br i1 %142, label %143, label %127, !llvm.loop !16

143:                                              ; preds = %124, %127, %113, %116, %52, %16, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
