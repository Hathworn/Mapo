; ModuleID = '../data/hip_kernels/7452/3/main.cu'
source_filename = "../data/hip_kernels/7452/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12calcSumTablePKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  %15 = icmp sgt i32 %2, 1
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %99

17:                                               ; preds = %4
  %18 = add i32 %2, -1
  %19 = add i32 %2, -2
  %20 = and i32 %18, 3
  %21 = icmp ult i32 %19, 3
  br i1 %21, label %78, label %22

22:                                               ; preds = %17
  %23 = and i32 %18, -4
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 1, %22 ], [ %75, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %76, %24 ]
  %27 = add nsw i32 %25, -1
  %28 = mul nsw i32 %27, %3
  %29 = add nsw i32 %28, %13
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = mul nsw i32 %25, %3
  %34 = add nsw i32 %33, %13
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = fadd contract float %32, %37
  store float %38, float addrspace(1)* %36, align 4, !tbaa !7
  %39 = add nuw nsw i32 %25, 1
  %40 = mul nsw i32 %25, %3
  %41 = add nsw i32 %40, %13
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = mul nsw i32 %39, %3
  %46 = add nsw i32 %45, %13
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fadd contract float %44, %49
  store float %50, float addrspace(1)* %48, align 4, !tbaa !7
  %51 = add nuw nsw i32 %25, 2
  %52 = mul nsw i32 %39, %3
  %53 = add nsw i32 %52, %13
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = mul nsw i32 %51, %3
  %58 = add nsw i32 %57, %13
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fadd contract float %56, %61
  store float %62, float addrspace(1)* %60, align 4, !tbaa !7
  %63 = add nuw nsw i32 %25, 3
  %64 = mul nsw i32 %51, %3
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = mul nsw i32 %63, %3
  %70 = add nsw i32 %69, %13
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fadd contract float %68, %73
  store float %74, float addrspace(1)* %72, align 4, !tbaa !7
  %75 = add nuw nsw i32 %25, 4
  %76 = add i32 %26, 4
  %77 = icmp eq i32 %76, %23
  br i1 %77, label %78, label %24, !llvm.loop !11

78:                                               ; preds = %24, %17
  %79 = phi i32 [ 1, %17 ], [ %75, %24 ]
  %80 = icmp eq i32 %20, 0
  br i1 %80, label %99, label %81

81:                                               ; preds = %78, %81
  %82 = phi i32 [ %96, %81 ], [ %79, %78 ]
  %83 = phi i32 [ %97, %81 ], [ 0, %78 ]
  %84 = add nsw i32 %82, -1
  %85 = mul nsw i32 %84, %3
  %86 = add nsw i32 %85, %13
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = mul nsw i32 %82, %3
  %91 = add nsw i32 %90, %13
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fadd contract float %89, %94
  store float %95, float addrspace(1)* %93, align 4, !tbaa !7
  %96 = add nuw nsw i32 %82, 1
  %97 = add i32 %83, 1
  %98 = icmp eq i32 %97, %20
  br i1 %98, label %99, label %81, !llvm.loop !13

99:                                               ; preds = %78, %81, %4
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
