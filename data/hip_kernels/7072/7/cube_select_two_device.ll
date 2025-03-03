; ModuleID = '../data/hip_kernels/7072/7/main.cu'
source_filename = "../data/hip_kernels/7072/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cube_select_twoiifPKfPi(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %1
  %8 = mul nsw i32 %7, 3
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %3, i64 %9
  %11 = shl nsw i32 %7, 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %14 = fmul contract float %2, %2
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %25

17:                                               ; preds = %5
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = insertelement <16 x float> poison, float %14, i64 0
  %24 = shufflevector <16 x float> %23, <16 x float> poison, <16 x i32> zeroinitializer
  br label %26

25:                                               ; preds = %88, %5
  ret void

26:                                               ; preds = %17, %88
  %27 = phi i32 [ %15, %17 ], [ %89, %88 ]
  %28 = mul nsw i32 %27, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %10, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nsw i32 %28, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %10, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = add nsw i32 %28, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %10, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = shl nsw i32 %27, 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %41
  store i32 %27, i32 addrspace(1)* %42, align 4, !tbaa !11
  %43 = add nuw nsw i32 %40, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %44
  store i32 %27, i32 addrspace(1)* %45, align 4, !tbaa !11
  %46 = add nuw nsw i32 %40, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %47
  store i32 %27, i32 addrspace(1)* %48, align 4, !tbaa !11
  %49 = add nuw nsw i32 %40, 3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %50
  store i32 %27, i32 addrspace(1)* %51, align 4, !tbaa !11
  %52 = add nuw nsw i32 %40, 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %53
  store i32 %27, i32 addrspace(1)* %54, align 4, !tbaa !11
  %55 = add nuw nsw i32 %40, 5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %56
  store i32 %27, i32 addrspace(1)* %57, align 4, !tbaa !11
  %58 = add nuw nsw i32 %40, 6
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %59
  store i32 %27, i32 addrspace(1)* %60, align 4, !tbaa !11
  %61 = add nuw nsw i32 %40, 7
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %62
  store i32 %27, i32 addrspace(1)* %63, align 4, !tbaa !11
  %64 = add nuw nsw i32 %40, 8
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %65
  store i32 %27, i32 addrspace(1)* %66, align 4, !tbaa !11
  %67 = add nuw nsw i32 %40, 9
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %68
  store i32 %27, i32 addrspace(1)* %69, align 4, !tbaa !11
  %70 = add nuw nsw i32 %40, 10
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %71
  store i32 %27, i32 addrspace(1)* %72, align 4, !tbaa !11
  %73 = add nuw nsw i32 %40, 11
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %74
  store i32 %27, i32 addrspace(1)* %75, align 4, !tbaa !11
  %76 = add nuw nsw i32 %40, 12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %77
  store i32 %27, i32 addrspace(1)* %78, align 4, !tbaa !11
  %79 = add nuw nsw i32 %40, 13
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %80
  store i32 %27, i32 addrspace(1)* %81, align 4, !tbaa !11
  %82 = add nuw nsw i32 %40, 14
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %83
  store i32 %27, i32 addrspace(1)* %84, align 4, !tbaa !11
  %85 = add nuw nsw i32 %40, 15
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %86
  store i32 %27, i32 addrspace(1)* %87, align 4, !tbaa !11
  br label %91

88:                                               ; preds = %151
  %89 = add i32 %27, %22
  %90 = icmp slt i32 %89, %1
  br i1 %90, label %26, label %25, !llvm.loop !13

91:                                               ; preds = %26, %151
  %92 = phi i32 [ 0, %26 ], [ %153, %151 ]
  %93 = phi <16 x float> [ %24, %26 ], [ %152, %151 ]
  %94 = icmp eq i32 %27, %92
  br i1 %94, label %151, label %95

95:                                               ; preds = %91
  %96 = mul nsw i32 %92, 3
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %10, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = add nuw nsw i32 %96, 1
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %10, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = add nuw nsw i32 %96, 2
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %10, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = fsub contract float %31, %99
  %109 = fmul contract float %108, %108
  %110 = fsub contract float %35, %103
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %109, %111
  %113 = fsub contract float %39, %107
  %114 = fmul contract float %113, %113
  %115 = fadd contract float %112, %114
  %116 = fcmp contract ogt float %115, %14
  br i1 %116, label %151, label %117

117:                                              ; preds = %95
  %118 = fcmp contract ogt float %99, %31
  %119 = fcmp contract ogt float %103, %35
  %120 = fcmp contract ogt float %107, %39
  %121 = select i1 %118, i32 8, i32 0
  %122 = select i1 %119, i32 4, i32 0
  %123 = or i32 %122, %121
  %124 = select i1 %120, i32 2, i32 0
  %125 = or i32 %123, %124
  %126 = extractelement <16 x float> %93, i32 %125
  %127 = fcmp contract olt float %115, %126
  br i1 %127, label %128, label %147

128:                                              ; preds = %147, %117
  %129 = phi i32 [ 0, %117 ], [ 1, %147 ]
  %130 = phi i32 [ %125, %117 ], [ %148, %147 ]
  %131 = or i32 %125, %40
  br i1 %127, label %132, label %141

132:                                              ; preds = %128
  %133 = or i32 %131, 1
  %134 = sext i32 %131 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %134
  %136 = sext i32 %133 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %136
  %138 = or i32 %125, 1
  %139 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !11
  %140 = insertelement <16 x float> %93, float %126, i32 %138
  store i32 %139, i32 addrspace(1)* %137, align 4, !tbaa !11
  br label %141

141:                                              ; preds = %128, %132
  %142 = phi <16 x float> [ %140, %132 ], [ %93, %128 ]
  %143 = or i32 %131, %129
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %144
  store i32 %92, i32 addrspace(1)* %145, align 4, !tbaa !11
  %146 = insertelement <16 x float> %142, float %115, i32 %130
  br label %151

147:                                              ; preds = %117
  %148 = or i32 %125, 1
  %149 = extractelement <16 x float> %93, i32 %148
  %150 = fcmp contract olt float %115, %149
  br i1 %150, label %128, label %151

151:                                              ; preds = %147, %95, %141, %91
  %152 = phi <16 x float> [ %93, %91 ], [ %93, %95 ], [ %146, %141 ], [ %93, %147 ]
  %153 = add nuw nsw i32 %92, 1
  %154 = icmp eq i32 %153, %1
  br i1 %154, label %88, label %91, !llvm.loop !15
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
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
