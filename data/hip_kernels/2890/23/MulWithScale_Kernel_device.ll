; ModuleID = '../data/hip_kernels/2890/23/main.cu'
source_filename = "../data/hip_kernels/2890/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19MulWithScale_KernelPffiii(float addrspace(1)* nocapture %0, float %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  %26 = icmp sgt i32 %4, 0
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %103

28:                                               ; preds = %5
  %29 = mul nsw i32 %22, %2
  %30 = add nsw i32 %29, %14
  %31 = mul nsw i32 %30, %4
  %32 = and i32 %4, 7
  %33 = icmp ult i32 %4, 8
  br i1 %33, label %89, label %34

34:                                               ; preds = %28
  %35 = and i32 %4, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %86, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %87, %36 ]
  %39 = add nsw i32 %37, %31
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fmul contract float %42, %1
  store float %43, float addrspace(1)* %41, align 4, !tbaa !7
  %44 = or i32 %37, 1
  %45 = add nsw i32 %44, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fmul contract float %48, %1
  store float %49, float addrspace(1)* %47, align 4, !tbaa !7
  %50 = or i32 %37, 2
  %51 = add nsw i32 %50, %31
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fmul contract float %54, %1
  store float %55, float addrspace(1)* %53, align 4, !tbaa !7
  %56 = or i32 %37, 3
  %57 = add nsw i32 %56, %31
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fmul contract float %60, %1
  store float %61, float addrspace(1)* %59, align 4, !tbaa !7
  %62 = or i32 %37, 4
  %63 = add nsw i32 %62, %31
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fmul contract float %66, %1
  store float %67, float addrspace(1)* %65, align 4, !tbaa !7
  %68 = or i32 %37, 5
  %69 = add nsw i32 %68, %31
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fmul contract float %72, %1
  store float %73, float addrspace(1)* %71, align 4, !tbaa !7
  %74 = or i32 %37, 6
  %75 = add nsw i32 %74, %31
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fmul contract float %78, %1
  store float %79, float addrspace(1)* %77, align 4, !tbaa !7
  %80 = or i32 %37, 7
  %81 = add nsw i32 %80, %31
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fmul contract float %84, %1
  store float %85, float addrspace(1)* %83, align 4, !tbaa !7
  %86 = add nuw nsw i32 %37, 8
  %87 = add i32 %38, 8
  %88 = icmp eq i32 %87, %35
  br i1 %88, label %89, label %36, !llvm.loop !11

89:                                               ; preds = %36, %28
  %90 = phi i32 [ 0, %28 ], [ %86, %36 ]
  %91 = icmp eq i32 %32, 0
  br i1 %91, label %103, label %92

92:                                               ; preds = %89, %92
  %93 = phi i32 [ %100, %92 ], [ %90, %89 ]
  %94 = phi i32 [ %101, %92 ], [ 0, %89 ]
  %95 = add nsw i32 %93, %31
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fmul contract float %98, %1
  store float %99, float addrspace(1)* %97, align 4, !tbaa !7
  %100 = add nuw nsw i32 %93, 1
  %101 = add i32 %94, 1
  %102 = icmp eq i32 %101, %32
  br i1 %102, label %103, label %92, !llvm.loop !13

103:                                              ; preds = %89, %92, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
