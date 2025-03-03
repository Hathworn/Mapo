; ModuleID = '../data/hip_kernels/1129/1/main.cu'
source_filename = "../data/hip_kernels/1129/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21createLaplacianKernelPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = zext i32 %13 to i64
  %15 = sext i32 %3 to i64
  %16 = icmp ult i64 %14, %15
  %17 = icmp sgt i32 %2, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %110

19:                                               ; preds = %4
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  store float %22, float addrspace(1)* %20, align 4, !tbaa !7
  %23 = icmp eq i32 %2, 1
  br i1 %23, label %110, label %24

24:                                               ; preds = %19
  %25 = add i32 %2, -1
  %26 = add i32 %2, -2
  %27 = and i32 %25, 7
  %28 = icmp ult i32 %26, 7
  br i1 %28, label %93, label %29

29:                                               ; preds = %24
  %30 = and i32 %25, -8
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi float [ %22, %29 ], [ %89, %31 ]
  %33 = phi i32 [ 1, %29 ], [ %90, %31 ]
  %34 = phi i32 [ 0, %29 ], [ %91, %31 ]
  %35 = mul nsw i32 %33, %3
  %36 = sext i32 %35 to i64
  %37 = add nsw i64 %36, %14
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7
  %40 = fadd contract float %39, %32
  store float %40, float addrspace(1)* %20, align 4, !tbaa !7
  %41 = add nuw nsw i32 %33, 1
  %42 = mul nsw i32 %41, %3
  %43 = sext i32 %42 to i64
  %44 = add nsw i64 %43, %14
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %40
  store float %47, float addrspace(1)* %20, align 4, !tbaa !7
  %48 = add nuw nsw i32 %33, 2
  %49 = mul nsw i32 %48, %3
  %50 = sext i32 %49 to i64
  %51 = add nsw i64 %50, %14
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fadd contract float %53, %47
  store float %54, float addrspace(1)* %20, align 4, !tbaa !7
  %55 = add nuw nsw i32 %33, 3
  %56 = mul nsw i32 %55, %3
  %57 = sext i32 %56 to i64
  %58 = add nsw i64 %57, %14
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fadd contract float %60, %54
  store float %61, float addrspace(1)* %20, align 4, !tbaa !7
  %62 = add nuw nsw i32 %33, 4
  %63 = mul nsw i32 %62, %3
  %64 = sext i32 %63 to i64
  %65 = add nsw i64 %64, %14
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fadd contract float %67, %61
  store float %68, float addrspace(1)* %20, align 4, !tbaa !7
  %69 = add nuw nsw i32 %33, 5
  %70 = mul nsw i32 %69, %3
  %71 = sext i32 %70 to i64
  %72 = add nsw i64 %71, %14
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fadd contract float %74, %68
  store float %75, float addrspace(1)* %20, align 4, !tbaa !7
  %76 = add nuw nsw i32 %33, 6
  %77 = mul nsw i32 %76, %3
  %78 = sext i32 %77 to i64
  %79 = add nsw i64 %78, %14
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fadd contract float %81, %75
  store float %82, float addrspace(1)* %20, align 4, !tbaa !7
  %83 = add nuw nsw i32 %33, 7
  %84 = mul nsw i32 %83, %3
  %85 = sext i32 %84 to i64
  %86 = add nsw i64 %85, %14
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %88, %82
  store float %89, float addrspace(1)* %20, align 4, !tbaa !7
  %90 = add nuw nsw i32 %33, 8
  %91 = add i32 %34, 8
  %92 = icmp eq i32 %91, %30
  br i1 %92, label %93, label %31, !llvm.loop !11

93:                                               ; preds = %31, %24
  %94 = phi float [ %22, %24 ], [ %89, %31 ]
  %95 = phi i32 [ 1, %24 ], [ %90, %31 ]
  %96 = icmp eq i32 %27, 0
  br i1 %96, label %110, label %97

97:                                               ; preds = %93, %97
  %98 = phi float [ %106, %97 ], [ %94, %93 ]
  %99 = phi i32 [ %107, %97 ], [ %95, %93 ]
  %100 = phi i32 [ %108, %97 ], [ 0, %93 ]
  %101 = mul nsw i32 %99, %3
  %102 = sext i32 %101 to i64
  %103 = add nsw i64 %102, %14
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fadd contract float %105, %98
  store float %106, float addrspace(1)* %20, align 4, !tbaa !7
  %107 = add nuw nsw i32 %99, 1
  %108 = add i32 %100, 1
  %109 = icmp eq i32 %108, %27
  br i1 %109, label %110, label %97, !llvm.loop !14

110:                                              ; preds = %93, %97, %19, %4
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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.peeled.count", i32 1}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
