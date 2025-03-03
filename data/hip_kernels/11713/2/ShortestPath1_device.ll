; ModuleID = '../data/hip_kernels/11713/2/main.cu'
source_filename = "../data/hip_kernels/11713/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13ShortestPath1PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, %2
  %22 = icmp slt i32 %20, %2
  %23 = icmp slt i32 %12, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %125

25:                                               ; preds = %3
  %26 = add nsw i32 %21, %12
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  store float %29, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = icmp sgt i32 %2, 0
  br i1 %31, label %32, label %125

32:                                               ; preds = %25
  %33 = and i32 %2, 3
  %34 = icmp ult i32 %2, 4
  br i1 %34, label %102, label %35

35:                                               ; preds = %32
  %36 = and i32 %2, -4
  br label %37

37:                                               ; preds = %98, %35
  %38 = phi i32 [ 0, %35 ], [ %99, %98 ]
  %39 = phi i32 [ 0, %35 ], [ %100, %98 ]
  %40 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %41 = add nsw i32 %38, %21
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = mul nsw i32 %38, %2
  %46 = add nsw i32 %45, %12
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fadd contract float %44, %49
  %51 = fcmp contract ogt float %40, %50
  br i1 %51, label %52, label %53

52:                                               ; preds = %37
  store float %50, float addrspace(1)* %30, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %37, %52
  %54 = or i32 %38, 1
  %55 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %56 = add nsw i32 %54, %21
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = mul nsw i32 %54, %2
  %61 = add nsw i32 %60, %12
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %59, %64
  %66 = fcmp contract ogt float %55, %65
  br i1 %66, label %67, label %68

67:                                               ; preds = %53
  store float %65, float addrspace(1)* %30, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %67, %53
  %69 = or i32 %38, 2
  %70 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %71 = add nsw i32 %69, %21
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = mul nsw i32 %69, %2
  %76 = add nsw i32 %75, %12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fadd contract float %74, %79
  %81 = fcmp contract ogt float %70, %80
  br i1 %81, label %82, label %83

82:                                               ; preds = %68
  store float %80, float addrspace(1)* %30, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %82, %68
  %84 = or i32 %38, 3
  %85 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %86 = add nsw i32 %84, %21
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = mul nsw i32 %84, %2
  %91 = add nsw i32 %90, %12
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fadd contract float %89, %94
  %96 = fcmp contract ogt float %85, %95
  br i1 %96, label %97, label %98

97:                                               ; preds = %83
  store float %95, float addrspace(1)* %30, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %97, %83
  %99 = add nuw nsw i32 %38, 4
  %100 = add i32 %39, 4
  %101 = icmp eq i32 %100, %36
  br i1 %101, label %102, label %37, !llvm.loop !11

102:                                              ; preds = %98, %32
  %103 = phi i32 [ 0, %32 ], [ %99, %98 ]
  %104 = icmp eq i32 %33, 0
  br i1 %104, label %125, label %105

105:                                              ; preds = %102, %121
  %106 = phi i32 [ %122, %121 ], [ %103, %102 ]
  %107 = phi i32 [ %123, %121 ], [ 0, %102 ]
  %108 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %109 = add nsw i32 %106, %21
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = mul nsw i32 %106, %2
  %114 = add nsw i32 %113, %12
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fadd contract float %112, %117
  %119 = fcmp contract ogt float %108, %118
  br i1 %119, label %120, label %121

120:                                              ; preds = %105
  store float %118, float addrspace(1)* %30, align 4, !tbaa !7
  br label %121

121:                                              ; preds = %120, %105
  %122 = add nuw nsw i32 %106, 1
  %123 = add i32 %107, 1
  %124 = icmp eq i32 %123, %33
  br i1 %124, label %125, label %105, !llvm.loop !13

125:                                              ; preds = %102, %121, %25, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
