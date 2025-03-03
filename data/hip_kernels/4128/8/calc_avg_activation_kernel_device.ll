; ModuleID = '../data/hip_kernels/4128/8/main.cu'
source_filename = "../data/hip_kernels/4128/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26calc_avg_activation_kernelPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = freeze i32 %14
  %16 = freeze i32 %2
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = mul nsw i32 %4, %2
  %21 = icmp slt i32 %14, %20
  br i1 %21, label %22, label %125

22:                                               ; preds = %5
  %23 = sext i32 %14 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !7
  %25 = icmp sgt i32 %3, 0
  br i1 %25, label %26, label %51

26:                                               ; preds = %22
  %27 = mul nsw i32 %17, %3
  %28 = and i32 %3, 7
  %29 = icmp ult i32 %3, 8
  br i1 %29, label %32, label %30

30:                                               ; preds = %26
  %31 = and i32 %3, -8
  br label %55

32:                                               ; preds = %55, %26
  %33 = phi float [ undef, %26 ], [ %121, %55 ]
  %34 = phi float [ 0.000000e+00, %26 ], [ %121, %55 ]
  %35 = phi i32 [ 0, %26 ], [ %122, %55 ]
  %36 = icmp eq i32 %28, 0
  br i1 %36, label %51, label %37

37:                                               ; preds = %32, %37
  %38 = phi float [ %47, %37 ], [ %34, %32 ]
  %39 = phi i32 [ %48, %37 ], [ %35, %32 ]
  %40 = phi i32 [ %49, %37 ], [ 0, %32 ]
  %41 = add nsw i32 %39, %27
  %42 = mul nsw i32 %41, %2
  %43 = add nsw i32 %42, %19
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %38
  store float %47, float addrspace(1)* %24, align 4, !tbaa !7
  %48 = add nuw nsw i32 %39, 1
  %49 = add i32 %40, 1
  %50 = icmp eq i32 %49, %28
  br i1 %50, label %51, label %37, !llvm.loop !11

51:                                               ; preds = %32, %37, %22
  %52 = phi float [ 0.000000e+00, %22 ], [ %33, %32 ], [ %47, %37 ]
  %53 = sitofp i32 %3 to float
  %54 = fdiv contract float %52, %53
  store float %54, float addrspace(1)* %24, align 4, !tbaa !7
  br label %125

55:                                               ; preds = %55, %30
  %56 = phi float [ 0.000000e+00, %30 ], [ %121, %55 ]
  %57 = phi i32 [ 0, %30 ], [ %122, %55 ]
  %58 = phi i32 [ 0, %30 ], [ %123, %55 ]
  %59 = add nsw i32 %57, %27
  %60 = mul nsw i32 %59, %2
  %61 = add nsw i32 %60, %19
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %64, %56
  store float %65, float addrspace(1)* %24, align 4, !tbaa !7
  %66 = or i32 %57, 1
  %67 = add nsw i32 %66, %27
  %68 = mul nsw i32 %67, %2
  %69 = add nsw i32 %68, %19
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fadd contract float %72, %65
  store float %73, float addrspace(1)* %24, align 4, !tbaa !7
  %74 = or i32 %57, 2
  %75 = add nsw i32 %74, %27
  %76 = mul nsw i32 %75, %2
  %77 = add nsw i32 %76, %19
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fadd contract float %80, %73
  store float %81, float addrspace(1)* %24, align 4, !tbaa !7
  %82 = or i32 %57, 3
  %83 = add nsw i32 %82, %27
  %84 = mul nsw i32 %83, %2
  %85 = add nsw i32 %84, %19
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %88, %81
  store float %89, float addrspace(1)* %24, align 4, !tbaa !7
  %90 = or i32 %57, 4
  %91 = add nsw i32 %90, %27
  %92 = mul nsw i32 %91, %2
  %93 = add nsw i32 %92, %19
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fadd contract float %96, %89
  store float %97, float addrspace(1)* %24, align 4, !tbaa !7
  %98 = or i32 %57, 5
  %99 = add nsw i32 %98, %27
  %100 = mul nsw i32 %99, %2
  %101 = add nsw i32 %100, %19
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fadd contract float %104, %97
  store float %105, float addrspace(1)* %24, align 4, !tbaa !7
  %106 = or i32 %57, 6
  %107 = add nsw i32 %106, %27
  %108 = mul nsw i32 %107, %2
  %109 = add nsw i32 %108, %19
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fadd contract float %112, %105
  store float %113, float addrspace(1)* %24, align 4, !tbaa !7
  %114 = or i32 %57, 7
  %115 = add nsw i32 %114, %27
  %116 = mul nsw i32 %115, %2
  %117 = add nsw i32 %116, %19
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fadd contract float %120, %113
  store float %121, float addrspace(1)* %24, align 4, !tbaa !7
  %122 = add nuw nsw i32 %57, 8
  %123 = add i32 %58, 8
  %124 = icmp eq i32 %123, %31
  br i1 %124, label %32, label %55, !llvm.loop !13

125:                                              ; preds = %51, %5
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
