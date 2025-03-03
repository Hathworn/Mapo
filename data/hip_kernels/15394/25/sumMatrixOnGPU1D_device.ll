; ModuleID = '../data/hip_kernels/15394/25/main.cu'
source_filename = "../data/hip_kernels/15394/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16sumMatrixOnGPU1DPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp ult i32 %14, %3
  %16 = icmp sgt i32 %4, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %126

18:                                               ; preds = %5
  %19 = and i32 %4, 7
  %20 = icmp ult i32 %4, 8
  br i1 %20, label %108, label %21

21:                                               ; preds = %18
  %22 = and i32 %4, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %105, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %106, %23 ]
  %26 = mul nsw i32 %24, %3
  %27 = add i32 %26, %14
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = fadd contract float %30, %32
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  store float %33, float addrspace(1)* %34, align 4, !tbaa !7
  %35 = or i32 %24, 1
  %36 = mul nsw i32 %35, %3
  %37 = add i32 %36, %14
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fadd contract float %40, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  store float %43, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = or i32 %24, 2
  %46 = mul nsw i32 %45, %3
  %47 = add i32 %46, %14
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fadd contract float %50, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float %53, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = or i32 %24, 3
  %56 = mul nsw i32 %55, %3
  %57 = add i32 %56, %14
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fadd contract float %60, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  store float %63, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = or i32 %24, 4
  %66 = mul nsw i32 %65, %3
  %67 = add i32 %66, %14
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fadd contract float %70, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  store float %73, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = or i32 %24, 5
  %76 = mul nsw i32 %75, %3
  %77 = add i32 %76, %14
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %80, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  store float %83, float addrspace(1)* %84, align 4, !tbaa !7
  %85 = or i32 %24, 6
  %86 = mul nsw i32 %85, %3
  %87 = add i32 %86, %14
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fadd contract float %90, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  store float %93, float addrspace(1)* %94, align 4, !tbaa !7
  %95 = or i32 %24, 7
  %96 = mul nsw i32 %95, %3
  %97 = add i32 %96, %14
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fadd contract float %100, %102
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  store float %103, float addrspace(1)* %104, align 4, !tbaa !7
  %105 = add nuw nsw i32 %24, 8
  %106 = add i32 %25, 8
  %107 = icmp eq i32 %106, %22
  br i1 %107, label %108, label %23, !llvm.loop !11

108:                                              ; preds = %23, %18
  %109 = phi i32 [ 0, %18 ], [ %105, %23 ]
  %110 = icmp eq i32 %19, 0
  br i1 %110, label %126, label %111

111:                                              ; preds = %108, %111
  %112 = phi i32 [ %123, %111 ], [ %109, %108 ]
  %113 = phi i32 [ %124, %111 ], [ 0, %108 ]
  %114 = mul nsw i32 %112, %3
  %115 = add i32 %114, %14
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fadd contract float %118, %120
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  store float %121, float addrspace(1)* %122, align 4, !tbaa !7
  %123 = add nuw nsw i32 %112, 1
  %124 = add i32 %113, 1
  %125 = icmp eq i32 %124, %19
  br i1 %125, label %126, label %111, !llvm.loop !13

126:                                              ; preds = %108, %111, %5
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
