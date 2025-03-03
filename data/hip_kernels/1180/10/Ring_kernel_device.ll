; ModuleID = '../data/hip_kernels/1180/10/main.cu'
source_filename = "../data/hip_kernels/1180/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11Ring_kernelPfS_PiS_iiii(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = freeze i32 %17
  %19 = mul nsw i32 %7, %6
  %20 = shl nsw i32 %4, 1
  %21 = add nuw nsw i32 %20, 1
  %22 = mul nsw i32 %21, %21
  %23 = icmp slt i32 %18, %19
  br i1 %23, label %24, label %140

24:                                               ; preds = %8
  %25 = srem i32 %18, %7
  %26 = shl nsw i32 %18, 1
  %27 = add nuw nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = sub i32 0, %4
  %35 = icmp slt i32 %4, 0
  br i1 %35, label %140, label %36

36:                                               ; preds = %24
  %37 = icmp slt i32 %5, 1
  %38 = sub nsw i32 %18, %25
  %39 = add i32 %5, -1
  %40 = and i32 %5, 3
  %41 = icmp ult i32 %39, 3
  %42 = and i32 %5, -4
  %43 = icmp eq i32 %40, 0
  br label %44

44:                                               ; preds = %36, %50
  %45 = phi i32 [ %34, %36 ], [ %51, %50 ]
  %46 = add nsw i32 %45, %4
  %47 = add nsw i32 %45, %33
  %48 = icmp sgt i32 %47, -1
  %49 = icmp sge i32 %47, %7
  br label %53

50:                                               ; preds = %137
  %51 = add i32 %45, 1
  %52 = icmp eq i32 %45, %4
  br i1 %52, label %140, label %44, !llvm.loop !11

53:                                               ; preds = %44, %137
  %54 = phi i32 [ %34, %44 ], [ %138, %137 ]
  %55 = add nsw i32 %54, %4
  %56 = mul nsw i32 %55, %21
  %57 = add nsw i32 %46, %56
  %58 = add nsw i32 %54, %30
  br i1 %48, label %59, label %137

59:                                               ; preds = %53
  %60 = icmp slt i32 %58, 0
  %61 = select i1 %49, i1 true, i1 %60
  %62 = icmp sge i32 %58, %6
  %63 = select i1 %61, i1 true, i1 %62
  %64 = select i1 %63, i1 true, i1 %37
  br i1 %64, label %137, label %65

65:                                               ; preds = %59
  %66 = mul nsw i32 %58, %7
  %67 = add i32 %66, %47
  %68 = mul nsw i32 %57, %7
  %69 = add i32 %68, %25
  br i1 %41, label %119, label %70

70:                                               ; preds = %65, %70
  %71 = phi i32 [ %116, %70 ], [ 0, %65 ]
  %72 = phi i32 [ %117, %70 ], [ 0, %65 ]
  %73 = mul nsw i32 %71, %19
  %74 = add i32 %67, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !13
  %78 = add nsw i32 %38, %73
  %79 = mul nsw i32 %22, %78
  %80 = add i32 %69, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  store float %77, float addrspace(1)* %82, align 4, !tbaa !13
  %83 = or i32 %71, 1
  %84 = mul nsw i32 %83, %19
  %85 = add i32 %67, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !13
  %89 = add nsw i32 %38, %84
  %90 = mul nsw i32 %22, %89
  %91 = add i32 %69, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  store float %88, float addrspace(1)* %93, align 4, !tbaa !13
  %94 = or i32 %71, 2
  %95 = mul nsw i32 %94, %19
  %96 = add i32 %67, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !13
  %100 = add nsw i32 %38, %95
  %101 = mul nsw i32 %22, %100
  %102 = add i32 %69, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %103
  store float %99, float addrspace(1)* %104, align 4, !tbaa !13
  %105 = or i32 %71, 3
  %106 = mul nsw i32 %105, %19
  %107 = add i32 %67, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !13
  %111 = add nsw i32 %38, %106
  %112 = mul nsw i32 %22, %111
  %113 = add i32 %69, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %114
  store float %110, float addrspace(1)* %115, align 4, !tbaa !13
  %116 = add nuw nsw i32 %71, 4
  %117 = add i32 %72, 4
  %118 = icmp eq i32 %117, %42
  br i1 %118, label %119, label %70, !llvm.loop !15

119:                                              ; preds = %70, %65
  %120 = phi i32 [ 0, %65 ], [ %116, %70 ]
  br i1 %43, label %137, label %121

121:                                              ; preds = %119, %121
  %122 = phi i32 [ %134, %121 ], [ %120, %119 ]
  %123 = phi i32 [ %135, %121 ], [ 0, %119 ]
  %124 = mul nsw i32 %122, %19
  %125 = add i32 %67, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !13
  %129 = add nsw i32 %38, %124
  %130 = mul nsw i32 %22, %129
  %131 = add i32 %69, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  store float %128, float addrspace(1)* %133, align 4, !tbaa !13
  %134 = add nuw nsw i32 %122, 1
  %135 = add i32 %123, 1
  %136 = icmp eq i32 %135, %40
  br i1 %136, label %137, label %121, !llvm.loop !16

137:                                              ; preds = %119, %121, %59, %53
  %138 = add i32 %54, 1
  %139 = icmp eq i32 %54, %4
  br i1 %139, label %50, label %53, !llvm.loop !18

140:                                              ; preds = %50, %24, %8
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !12}
