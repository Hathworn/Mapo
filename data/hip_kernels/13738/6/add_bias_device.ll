; ModuleID = '../data/hip_kernels/13738/6/main.cu'
source_filename = "../data/hip_kernels/13738/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8add_biasPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %140

27:                                               ; preds = %6
  %28 = mul nsw i32 %15, %4
  %29 = add nsw i32 %28, %23
  %30 = mul nsw i32 %29, %5
  %31 = icmp sgt i32 %5, 0
  br i1 %31, label %32, label %140

32:                                               ; preds = %27
  %33 = and i32 %5, 7
  %34 = icmp ult i32 %5, 8
  br i1 %34, label %122, label %35

35:                                               ; preds = %32
  %36 = and i32 %5, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %119, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %120, %37 ]
  %40 = add nsw i32 %38, %30
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = zext i32 %38 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %43, %46
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = or i32 %38, 1
  %50 = add nsw i32 %49, %30
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = zext i32 %49 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fadd contract float %53, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  store float %57, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %38, 2
  %60 = add nsw i32 %59, %30
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = zext i32 %59 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fadd contract float %63, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  store float %67, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i32 %38, 3
  %70 = add nsw i32 %69, %30
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fadd contract float %73, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = or i32 %38, 4
  %80 = add nsw i32 %79, %30
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = zext i32 %79 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fadd contract float %83, %86
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  store float %87, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = or i32 %38, 5
  %90 = add nsw i32 %89, %30
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = zext i32 %89 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fadd contract float %93, %96
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  store float %97, float addrspace(1)* %98, align 4, !tbaa !7
  %99 = or i32 %38, 6
  %100 = add nsw i32 %99, %30
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = zext i32 %99 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fadd contract float %103, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  store float %107, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = or i32 %38, 7
  %110 = add nsw i32 %109, %30
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = zext i32 %109 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fadd contract float %113, %116
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  store float %117, float addrspace(1)* %118, align 4, !tbaa !7
  %119 = add nuw nsw i32 %38, 8
  %120 = add i32 %39, 8
  %121 = icmp eq i32 %120, %36
  br i1 %121, label %122, label %37, !llvm.loop !11

122:                                              ; preds = %37, %32
  %123 = phi i32 [ 0, %32 ], [ %119, %37 ]
  %124 = icmp eq i32 %33, 0
  br i1 %124, label %140, label %125

125:                                              ; preds = %122, %125
  %126 = phi i32 [ %137, %125 ], [ %123, %122 ]
  %127 = phi i32 [ %138, %125 ], [ 0, %122 ]
  %128 = add nsw i32 %126, %30
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = zext i32 %126 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fadd contract float %131, %134
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  store float %135, float addrspace(1)* %136, align 4, !tbaa !7
  %137 = add nuw nsw i32 %126, 1
  %138 = add i32 %127, 1
  %139 = icmp eq i32 %138, %33
  br i1 %139, label %140, label %125, !llvm.loop !13

140:                                              ; preds = %122, %125, %27, %6
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
