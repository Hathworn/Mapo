; ModuleID = '../data/hip_kernels/16858/6/main.cu'
source_filename = "../data/hip_kernels/16858/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12seq_max_normPfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  store float 0.000000e+00, float addrspace(1)* %3, align 4, !tbaa !4
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = icmp sgt i32 %2, 0
  %8 = and i32 %2, 7
  %9 = icmp ult i32 %2, 8
  %10 = and i32 %2, -8
  %11 = icmp eq i32 %8, 0
  br label %12

12:                                               ; preds = %6, %35
  %13 = phi float [ 0.000000e+00, %6 ], [ %36, %35 ]
  %14 = phi i32 [ 0, %6 ], [ %37, %35 ]
  br i1 %7, label %15, label %35

15:                                               ; preds = %12
  %16 = mul nsw i32 %14, %2
  br i1 %9, label %18, label %39

17:                                               ; preds = %35, %4
  ret void

18:                                               ; preds = %39, %15
  %19 = phi float [ undef, %15 ], [ %97, %39 ]
  %20 = phi float [ %13, %15 ], [ %97, %39 ]
  %21 = phi i32 [ 0, %15 ], [ %98, %39 ]
  br i1 %11, label %35, label %22

22:                                               ; preds = %18, %22
  %23 = phi float [ %31, %22 ], [ %20, %18 ]
  %24 = phi i32 [ %32, %22 ], [ %21, %18 ]
  %25 = phi i32 [ %33, %22 ], [ 0, %18 ]
  %26 = add nsw i32 %24, %16
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !4
  %30 = tail call float @llvm.fabs.f32(float %29)
  %31 = tail call float @llvm.maxnum.f32(float %30, float %23)
  store float %31, float addrspace(1)* %3, align 4, !tbaa !4
  %32 = add nuw nsw i32 %24, 1
  %33 = add i32 %25, 1
  %34 = icmp eq i32 %33, %8
  br i1 %34, label %35, label %22, !llvm.loop !8

35:                                               ; preds = %18, %22, %12
  %36 = phi float [ %13, %12 ], [ %19, %18 ], [ %31, %22 ]
  %37 = add nuw nsw i32 %14, 1
  %38 = icmp eq i32 %37, %1
  br i1 %38, label %17, label %12, !llvm.loop !10

39:                                               ; preds = %15, %39
  %40 = phi float [ %97, %39 ], [ %13, %15 ]
  %41 = phi i32 [ %98, %39 ], [ 0, %15 ]
  %42 = phi i32 [ %99, %39 ], [ 0, %15 ]
  %43 = add nsw i32 %41, %16
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !4
  %47 = tail call float @llvm.fabs.f32(float %46)
  %48 = tail call float @llvm.maxnum.f32(float %47, float %40)
  store float %48, float addrspace(1)* %3, align 4, !tbaa !4
  %49 = or i32 %41, 1
  %50 = add nsw i32 %49, %16
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !4
  %54 = tail call float @llvm.fabs.f32(float %53)
  %55 = tail call float @llvm.maxnum.f32(float %54, float %48)
  store float %55, float addrspace(1)* %3, align 4, !tbaa !4
  %56 = or i32 %41, 2
  %57 = add nsw i32 %56, %16
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !4
  %61 = tail call float @llvm.fabs.f32(float %60)
  %62 = tail call float @llvm.maxnum.f32(float %61, float %55)
  store float %62, float addrspace(1)* %3, align 4, !tbaa !4
  %63 = or i32 %41, 3
  %64 = add nsw i32 %63, %16
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !4
  %68 = tail call float @llvm.fabs.f32(float %67)
  %69 = tail call float @llvm.maxnum.f32(float %68, float %62)
  store float %69, float addrspace(1)* %3, align 4, !tbaa !4
  %70 = or i32 %41, 4
  %71 = add nsw i32 %70, %16
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !4
  %75 = tail call float @llvm.fabs.f32(float %74)
  %76 = tail call float @llvm.maxnum.f32(float %75, float %69)
  store float %76, float addrspace(1)* %3, align 4, !tbaa !4
  %77 = or i32 %41, 5
  %78 = add nsw i32 %77, %16
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4
  %82 = tail call float @llvm.fabs.f32(float %81)
  %83 = tail call float @llvm.maxnum.f32(float %82, float %76)
  store float %83, float addrspace(1)* %3, align 4, !tbaa !4
  %84 = or i32 %41, 6
  %85 = add nsw i32 %84, %16
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !4
  %89 = tail call float @llvm.fabs.f32(float %88)
  %90 = tail call float @llvm.maxnum.f32(float %89, float %83)
  store float %90, float addrspace(1)* %3, align 4, !tbaa !4
  %91 = or i32 %41, 7
  %92 = add nsw i32 %91, %16
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !4
  %96 = tail call float @llvm.fabs.f32(float %95)
  %97 = tail call float @llvm.maxnum.f32(float %96, float %90)
  store float %97, float addrspace(1)* %3, align 4, !tbaa !4
  %98 = add nuw nsw i32 %41, 8
  %99 = add i32 %42, 8
  %100 = icmp eq i32 %99, %10
  br i1 %100, label %18, label %39, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
