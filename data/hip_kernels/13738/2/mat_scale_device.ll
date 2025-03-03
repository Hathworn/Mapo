; ModuleID = '../data/hip_kernels/13738/2/main.cu'
source_filename = "../data/hip_kernels/13738/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9mat_scalefPfS_iii(float %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %27 = icmp sgt i32 %5, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %113

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %4
  %31 = add nsw i32 %30, %23
  %32 = mul nsw i32 %31, %5
  %33 = and i32 %5, 7
  %34 = icmp ult i32 %5, 8
  br i1 %34, label %98, label %35

35:                                               ; preds = %29
  %36 = and i32 %5, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %95, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %96, %37 ]
  %40 = add nsw i32 %38, %32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fmul contract float %43, %0
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  store float %44, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i32 %38, 1
  %47 = add nsw i32 %46, %32
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fmul contract float %50, %0
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float %51, float addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i32 %38, 2
  %54 = add nsw i32 %53, %32
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fmul contract float %57, %0
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float %58, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = or i32 %38, 3
  %61 = add nsw i32 %60, %32
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fmul contract float %64, %0
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i32 %38, 4
  %68 = add nsw i32 %67, %32
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fmul contract float %71, %0
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %38, 5
  %75 = add nsw i32 %74, %32
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fmul contract float %78, %0
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i32 %38, 6
  %82 = add nsw i32 %81, %32
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fmul contract float %85, %0
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  store float %86, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = or i32 %38, 7
  %89 = add nsw i32 %88, %32
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %92, %0
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  store float %93, float addrspace(1)* %94, align 4, !tbaa !7
  %95 = add nuw nsw i32 %38, 8
  %96 = add i32 %39, 8
  %97 = icmp eq i32 %96, %36
  br i1 %97, label %98, label %37, !llvm.loop !11

98:                                               ; preds = %37, %29
  %99 = phi i32 [ 0, %29 ], [ %95, %37 ]
  %100 = icmp eq i32 %33, 0
  br i1 %100, label %113, label %101

101:                                              ; preds = %98, %101
  %102 = phi i32 [ %110, %101 ], [ %99, %98 ]
  %103 = phi i32 [ %111, %101 ], [ 0, %98 ]
  %104 = add nsw i32 %102, %32
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %107, %0
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  store float %108, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = add nuw nsw i32 %102, 1
  %111 = add i32 %103, 1
  %112 = icmp eq i32 %111, %33
  br i1 %112, label %113, label %101, !llvm.loop !13

113:                                              ; preds = %98, %101, %6
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
