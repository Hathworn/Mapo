; ModuleID = '../data/hip_kernels/5586/6/main.cu'
source_filename = "../data/hip_kernels/5586/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18matrixAdd_B_KernelPfS_S_mi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %4
  %16 = icmp sgt i32 %4, 0
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %120

18:                                               ; preds = %5
  %19 = lshr i64 %3, 2
  %20 = trunc i64 %19 to i32
  %21 = mul nsw i32 %14, %20
  %22 = and i32 %4, 7
  %23 = icmp ult i32 %4, 8
  br i1 %23, label %103, label %24

24:                                               ; preds = %18
  %25 = and i32 %4, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 0, %24 ], [ %100, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %101, %26 ]
  %29 = add nsw i32 %27, %21
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = fadd contract float %32, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = or i32 %27, 1
  %38 = add nsw i32 %37, %21
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fadd contract float %41, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  store float %44, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i32 %27, 2
  %47 = add nsw i32 %46, %21
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fadd contract float %50, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float %53, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = or i32 %27, 3
  %56 = add nsw i32 %55, %21
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fadd contract float %59, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  store float %62, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = or i32 %27, 4
  %65 = add nsw i32 %64, %21
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fadd contract float %68, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  store float %71, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %27, 5
  %74 = add nsw i32 %73, %21
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fadd contract float %77, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  store float %80, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = or i32 %27, 6
  %83 = add nsw i32 %82, %21
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %86, %88
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  store float %89, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = or i32 %27, 7
  %92 = add nsw i32 %91, %21
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fadd contract float %95, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  store float %98, float addrspace(1)* %99, align 4, !tbaa !7
  %100 = add nuw nsw i32 %27, 8
  %101 = add i32 %28, 8
  %102 = icmp eq i32 %101, %25
  br i1 %102, label %103, label %26, !llvm.loop !11

103:                                              ; preds = %26, %18
  %104 = phi i32 [ 0, %18 ], [ %100, %26 ]
  %105 = icmp eq i32 %22, 0
  br i1 %105, label %120, label %106

106:                                              ; preds = %103, %106
  %107 = phi i32 [ %117, %106 ], [ %104, %103 ]
  %108 = phi i32 [ %118, %106 ], [ 0, %103 ]
  %109 = add nsw i32 %107, %21
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fadd contract float %112, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  store float %115, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = add nuw nsw i32 %107, 1
  %118 = add i32 %108, 1
  %119 = icmp eq i32 %118, %22
  br i1 %119, label %120, label %106, !llvm.loop !13

120:                                              ; preds = %103, %106, %5
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
