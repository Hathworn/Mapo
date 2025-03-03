; ModuleID = '../data/hip_kernels/8494/8/main.cu'
source_filename = "../data/hip_kernels/8494/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18selection_sort_gpuiiiiPKfPiPf(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %1
  %10 = mul i32 %9, %2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %4, i64 %11
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %11
  %14 = getelementptr inbounds float, float addrspace(1)* %6, i64 %11
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = icmp slt i32 %15, %2
  br i1 %21, label %22, label %113

22:                                               ; preds = %7
  %23 = icmp sgt i32 %1, 0
  %24 = and i32 %1, 7
  %25 = icmp ult i32 %1, 8
  %26 = and i32 %1, -8
  %27 = icmp eq i32 %24, 0
  br label %28

28:                                               ; preds = %22, %49
  %29 = phi i32 [ %15, %22 ], [ %50, %49 ]
  br i1 %23, label %30, label %49

30:                                               ; preds = %28
  %31 = mul nsw i32 %29, %1
  br i1 %25, label %35, label %52

32:                                               ; preds = %49
  br i1 %21, label %33, label %113

33:                                               ; preds = %32
  %34 = icmp sgt i32 %3, 0
  br label %114

35:                                               ; preds = %52, %30
  %36 = phi i32 [ 0, %30 ], [ %110, %52 ]
  br i1 %27, label %49, label %37

37:                                               ; preds = %35, %37
  %38 = phi i32 [ %46, %37 ], [ %36, %35 ]
  %39 = phi i32 [ %47, %37 ], [ 0, %35 ]
  %40 = add nsw i32 %38, %31
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %12, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = getelementptr inbounds float, float addrspace(1)* %14, i64 %41
  store float %43, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %41
  store i32 %38, i32 addrspace(1)* %45, align 4, !tbaa !11
  %46 = add nuw nsw i32 %38, 1
  %47 = add i32 %39, 1
  %48 = icmp eq i32 %47, %24
  br i1 %48, label %49, label %37, !llvm.loop !13

49:                                               ; preds = %35, %37, %28
  %50 = add nuw nsw i32 %29, %20
  %51 = icmp slt i32 %50, %2
  br i1 %51, label %28, label %32, !llvm.loop !15

52:                                               ; preds = %30, %52
  %53 = phi i32 [ %110, %52 ], [ 0, %30 ]
  %54 = phi i32 [ %111, %52 ], [ 0, %30 ]
  %55 = add nsw i32 %53, %31
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %12, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = getelementptr inbounds float, float addrspace(1)* %14, i64 %56
  store float %58, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %56
  store i32 %53, i32 addrspace(1)* %60, align 4, !tbaa !11
  %61 = or i32 %53, 1
  %62 = add nsw i32 %61, %31
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %12, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds float, float addrspace(1)* %14, i64 %63
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %63
  store i32 %61, i32 addrspace(1)* %67, align 4, !tbaa !11
  %68 = or i32 %53, 2
  %69 = add nsw i32 %68, %31
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %12, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %14, i64 %70
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %70
  store i32 %68, i32 addrspace(1)* %74, align 4, !tbaa !11
  %75 = or i32 %53, 3
  %76 = add nsw i32 %75, %31
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %12, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds float, float addrspace(1)* %14, i64 %77
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %77
  store i32 %75, i32 addrspace(1)* %81, align 4, !tbaa !11
  %82 = or i32 %53, 4
  %83 = add nsw i32 %82, %31
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %12, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = getelementptr inbounds float, float addrspace(1)* %14, i64 %84
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %84
  store i32 %82, i32 addrspace(1)* %88, align 4, !tbaa !11
  %89 = or i32 %53, 5
  %90 = add nsw i32 %89, %31
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %12, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = getelementptr inbounds float, float addrspace(1)* %14, i64 %91
  store float %93, float addrspace(1)* %94, align 4, !tbaa !7
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %91
  store i32 %89, i32 addrspace(1)* %95, align 4, !tbaa !11
  %96 = or i32 %53, 6
  %97 = add nsw i32 %96, %31
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %12, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds float, float addrspace(1)* %14, i64 %98
  store float %100, float addrspace(1)* %101, align 4, !tbaa !7
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %98
  store i32 %96, i32 addrspace(1)* %102, align 4, !tbaa !11
  %103 = or i32 %53, 7
  %104 = add nsw i32 %103, %31
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %12, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = getelementptr inbounds float, float addrspace(1)* %14, i64 %105
  store float %107, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %105
  store i32 %103, i32 addrspace(1)* %109, align 4, !tbaa !11
  %110 = add nuw nsw i32 %53, 8
  %111 = add i32 %54, 8
  %112 = icmp eq i32 %111, %26
  br i1 %112, label %35, label %52, !llvm.loop !17

113:                                              ; preds = %119, %7, %32
  ret void

114:                                              ; preds = %33, %119
  %115 = phi i32 [ %15, %33 ], [ %120, %119 ]
  %116 = mul nsw i32 %115, %1
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %14, i64 %117
  br i1 %34, label %122, label %119

119:                                              ; preds = %157, %114
  %120 = add nuw nsw i32 %115, %20
  %121 = icmp slt i32 %120, %2
  br i1 %121, label %114, label %113, !llvm.loop !18

122:                                              ; preds = %114, %157
  %123 = phi i32 [ %124, %157 ], [ 0, %114 ]
  %124 = add nuw nsw i32 %123, 1
  %125 = icmp slt i32 %124, %1
  br i1 %125, label %129, label %126

126:                                              ; preds = %129, %122
  %127 = phi i32 [ %123, %122 ], [ %139, %129 ]
  %128 = icmp eq i32 %127, %123
  br i1 %128, label %157, label %142

129:                                              ; preds = %122, %129
  %130 = phi i32 [ %140, %129 ], [ %124, %122 ]
  %131 = phi i32 [ %139, %129 ], [ %123, %122 ]
  %132 = zext i32 %130 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %118, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = sext i32 %131 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %118, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7
  %138 = fcmp contract olt float %134, %137
  %139 = select i1 %138, i32 %130, i32 %131
  %140 = add nuw nsw i32 %130, 1
  %141 = icmp slt i32 %140, %1
  br i1 %141, label %129, label %126, !llvm.loop !19

142:                                              ; preds = %126
  %143 = sext i32 %127 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %118, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = zext i32 %123 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %118, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  store float %148, float addrspace(1)* %144, align 4, !tbaa !7
  store float %145, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = add nsw i32 %127, %116
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !11
  %153 = add nsw i32 %123, %116
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %154
  %156 = load i32, i32 addrspace(1)* %155, align 4, !tbaa !11
  store i32 %156, i32 addrspace(1)* %151, align 4, !tbaa !11
  store i32 %152, i32 addrspace(1)* %155, align 4, !tbaa !11
  br label %157

157:                                              ; preds = %142, %126
  %158 = icmp eq i32 %124, %3
  br i1 %158, label %119, label %122, !llvm.loop !20
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
