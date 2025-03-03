; ModuleID = '../data/hip_kernels/7626/4/main.cu'
source_filename = "../data/hip_kernels/7626/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convdw_gpu_kernelPfS_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %5
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp sgt i32 %3, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %120

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %4
  %31 = add nsw i32 %30, %23
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = and i32 %3, 3
  %36 = icmp ult i32 %3, 4
  br i1 %36, label %97, label %37

37:                                               ; preds = %29
  %38 = and i32 %3, -4
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi float [ %34, %37 ], [ %93, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %94, %39 ]
  %42 = phi i32 [ 0, %37 ], [ %95, %39 ]
  %43 = mul nsw i32 %41, %3
  %44 = add nsw i32 %43, %15
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul nsw i32 %41, %4
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %47, %52
  %54 = fadd contract float %40, %53
  store float %54, float addrspace(1)* %33, align 4, !tbaa !7
  %55 = or i32 %41, 1
  %56 = mul nsw i32 %55, %3
  %57 = add nsw i32 %56, %15
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = mul nsw i32 %55, %4
  %62 = add nsw i32 %61, %23
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fmul contract float %60, %65
  %67 = fadd contract float %54, %66
  store float %67, float addrspace(1)* %33, align 4, !tbaa !7
  %68 = or i32 %41, 2
  %69 = mul nsw i32 %68, %3
  %70 = add nsw i32 %69, %15
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = mul nsw i32 %68, %4
  %75 = add nsw i32 %74, %23
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fmul contract float %73, %78
  %80 = fadd contract float %67, %79
  store float %80, float addrspace(1)* %33, align 4, !tbaa !7
  %81 = or i32 %41, 3
  %82 = mul nsw i32 %81, %3
  %83 = add nsw i32 %82, %15
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = mul nsw i32 %81, %4
  %88 = add nsw i32 %87, %23
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %80, %92
  store float %93, float addrspace(1)* %33, align 4, !tbaa !7
  %94 = add nuw nsw i32 %41, 4
  %95 = add i32 %42, 4
  %96 = icmp eq i32 %95, %38
  br i1 %96, label %97, label %39, !llvm.loop !11

97:                                               ; preds = %39, %29
  %98 = phi float [ %34, %29 ], [ %93, %39 ]
  %99 = phi i32 [ 0, %29 ], [ %94, %39 ]
  %100 = icmp eq i32 %35, 0
  br i1 %100, label %120, label %101

101:                                              ; preds = %97, %101
  %102 = phi float [ %116, %101 ], [ %98, %97 ]
  %103 = phi i32 [ %117, %101 ], [ %99, %97 ]
  %104 = phi i32 [ %118, %101 ], [ 0, %97 ]
  %105 = mul nsw i32 %103, %3
  %106 = add nsw i32 %105, %15
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = mul nsw i32 %103, %4
  %111 = add nsw i32 %110, %23
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fmul contract float %109, %114
  %116 = fadd contract float %102, %115
  store float %116, float addrspace(1)* %33, align 4, !tbaa !7
  %117 = add nuw nsw i32 %103, 1
  %118 = add i32 %104, 1
  %119 = icmp eq i32 %118, %35
  br i1 %119, label %120, label %101, !llvm.loop !13

120:                                              ; preds = %97, %101, %6
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
