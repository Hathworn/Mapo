; ModuleID = '../data/hip_kernels/7/14/main.cu'
source_filename = "../data/hip_kernels/7/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12blockEigSortPfS_PiS0_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %15
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = add nsw i32 %17, -1
  %21 = add i32 %20, %19
  %22 = icmp slt i32 %17, %21
  br i1 %22, label %23, label %34

23:                                               ; preds = %5
  %24 = icmp sgt i32 %4, 0
  %25 = add i32 %19, %17
  %26 = add i32 %25, -2
  %27 = and i32 %4, 7
  %28 = icmp ult i32 %4, 8
  %29 = and i32 %4, -8
  %30 = icmp eq i32 %27, 0
  br label %31

31:                                               ; preds = %23, %35
  %32 = phi i32 [ %17, %23 ], [ %36, %35 ]
  %33 = icmp slt i32 %17, %32
  br i1 %33, label %38, label %35

34:                                               ; preds = %35, %5
  ret void

35:                                               ; preds = %154, %31
  %36 = add nsw i32 %32, 1
  %37 = icmp eq i32 %32, %26
  br i1 %37, label %34, label %31, !llvm.loop !11

38:                                               ; preds = %31, %154
  %39 = phi i32 [ %42, %154 ], [ %17, %31 ]
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = add nsw i32 %39, 1
  %43 = bitcast float addrspace(1)* %41 to <2 x float> addrspace(1)*
  %44 = load <2 x float>, <2 x float> addrspace(1)* %43, align 4, !tbaa !13
  %45 = extractelement <2 x float> %44, i64 0
  %46 = extractelement <2 x float> %44, i64 1
  %47 = fcmp contract ogt float %45, %46
  br i1 %47, label %48, label %154

48:                                               ; preds = %38
  %49 = sext i32 %42 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  store float %46, float addrspace(1)* %41, align 4, !tbaa !13
  store float %45, float addrspace(1)* %50, align 4, !tbaa !13
  br i1 %24, label %51, label %154

51:                                               ; preds = %48
  br i1 %28, label %137, label %52

52:                                               ; preds = %51, %52
  %53 = phi i32 [ %134, %52 ], [ 0, %51 ]
  %54 = phi i32 [ %135, %52 ], [ 0, %51 ]
  %55 = mul nsw i32 %53, %4
  %56 = add nsw i32 %55, %39
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !13
  %60 = add nsw i32 %56, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !13
  store float %63, float addrspace(1)* %58, align 4, !tbaa !13
  store float %59, float addrspace(1)* %62, align 4, !tbaa !13
  %64 = or i32 %53, 1
  %65 = mul nsw i32 %64, %4
  %66 = add nsw i32 %65, %39
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !13
  %70 = add nsw i32 %66, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !13
  store float %73, float addrspace(1)* %68, align 4, !tbaa !13
  store float %69, float addrspace(1)* %72, align 4, !tbaa !13
  %74 = or i32 %53, 2
  %75 = mul nsw i32 %74, %4
  %76 = add nsw i32 %75, %39
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !13
  %80 = add nsw i32 %76, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !13
  store float %83, float addrspace(1)* %78, align 4, !tbaa !13
  store float %79, float addrspace(1)* %82, align 4, !tbaa !13
  %84 = or i32 %53, 3
  %85 = mul nsw i32 %84, %4
  %86 = add nsw i32 %85, %39
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !13
  %90 = add nsw i32 %86, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !13
  store float %93, float addrspace(1)* %88, align 4, !tbaa !13
  store float %89, float addrspace(1)* %92, align 4, !tbaa !13
  %94 = or i32 %53, 4
  %95 = mul nsw i32 %94, %4
  %96 = add nsw i32 %95, %39
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !13
  %100 = add nsw i32 %96, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !13
  store float %103, float addrspace(1)* %98, align 4, !tbaa !13
  store float %99, float addrspace(1)* %102, align 4, !tbaa !13
  %104 = or i32 %53, 5
  %105 = mul nsw i32 %104, %4
  %106 = add nsw i32 %105, %39
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !13
  %110 = add nsw i32 %106, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !13
  store float %113, float addrspace(1)* %108, align 4, !tbaa !13
  store float %109, float addrspace(1)* %112, align 4, !tbaa !13
  %114 = or i32 %53, 6
  %115 = mul nsw i32 %114, %4
  %116 = add nsw i32 %115, %39
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !13
  %120 = add nsw i32 %116, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !13
  store float %123, float addrspace(1)* %118, align 4, !tbaa !13
  store float %119, float addrspace(1)* %122, align 4, !tbaa !13
  %124 = or i32 %53, 7
  %125 = mul nsw i32 %124, %4
  %126 = add nsw i32 %125, %39
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !13
  %130 = add nsw i32 %126, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !13
  store float %133, float addrspace(1)* %128, align 4, !tbaa !13
  store float %129, float addrspace(1)* %132, align 4, !tbaa !13
  %134 = add nuw nsw i32 %53, 8
  %135 = add i32 %54, 8
  %136 = icmp eq i32 %135, %29
  br i1 %136, label %137, label %52, !llvm.loop !15

137:                                              ; preds = %52, %51
  %138 = phi i32 [ 0, %51 ], [ %134, %52 ]
  br i1 %30, label %154, label %139

139:                                              ; preds = %137, %139
  %140 = phi i32 [ %151, %139 ], [ %138, %137 ]
  %141 = phi i32 [ %152, %139 ], [ 0, %137 ]
  %142 = mul nsw i32 %140, %4
  %143 = add nsw i32 %142, %39
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !13
  %147 = add nsw i32 %143, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !13
  store float %150, float addrspace(1)* %145, align 4, !tbaa !13
  store float %146, float addrspace(1)* %149, align 4, !tbaa !13
  %151 = add nuw nsw i32 %140, 1
  %152 = add i32 %141, 1
  %153 = icmp eq i32 %152, %27
  br i1 %153, label %154, label %139, !llvm.loop !16

154:                                              ; preds = %137, %139, %48, %38
  %155 = icmp slt i32 %42, %32
  br i1 %155, label %38, label %35, !llvm.loop !18
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
