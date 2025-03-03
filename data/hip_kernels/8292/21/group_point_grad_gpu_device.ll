; ModuleID = '../data/hip_kernels/8292/21/main.cu'
source_filename = "../data/hip_kernels/8292/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20group_point_grad_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul nsw i32 %4, %3
  %11 = mul nsw i32 %10, %9
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %12
  %14 = mul i32 %9, %2
  %15 = mul i32 %14, %10
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %5, i64 %16
  %18 = mul i32 %14, %1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %7, i64 %19
  %21 = icmp sgt i32 %3, 0
  br i1 %21, label %22, label %33

22:                                               ; preds = %8
  %23 = icmp sgt i32 %4, 0
  %24 = icmp sgt i32 %2, 0
  %25 = and i32 %2, 7
  %26 = icmp ult i32 %2, 8
  %27 = and i32 %2, -8
  %28 = icmp eq i32 %25, 0
  br label %29

29:                                               ; preds = %22, %34
  %30 = phi i32 [ 0, %22 ], [ %35, %34 ]
  br i1 %23, label %31, label %34

31:                                               ; preds = %29
  %32 = mul nsw i32 %30, %4
  br label %37

33:                                               ; preds = %34, %8
  ret void

34:                                               ; preds = %63, %29
  %35 = add nuw nsw i32 %30, 1
  %36 = icmp eq i32 %35, %3
  br i1 %36, label %33, label %29, !llvm.loop !5

37:                                               ; preds = %31, %63
  %38 = phi i32 [ 0, %31 ], [ %64, %63 ]
  %39 = add nsw i32 %38, %32
  br i1 %24, label %40, label %63

40:                                               ; preds = %37
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !11
  %44 = mul i32 %39, %2
  %45 = mul nsw i32 %43, %2
  br i1 %26, label %46, label %66

46:                                               ; preds = %66, %40
  %47 = phi i32 [ 0, %40 ], [ %148, %66 ]
  br i1 %28, label %63, label %48

48:                                               ; preds = %46, %48
  %49 = phi i32 [ %60, %48 ], [ %47, %46 ]
  %50 = phi i32 [ %61, %48 ], [ 0, %46 ]
  %51 = add nsw i32 %49, %44
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %17, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !12
  %55 = add nsw i32 %49, %45
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %20, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !12
  %59 = fadd contract float %54, %58
  store float %59, float addrspace(1)* %57, align 4, !tbaa !12
  %60 = add nuw nsw i32 %49, 1
  %61 = add i32 %50, 1
  %62 = icmp eq i32 %61, %25
  br i1 %62, label %63, label %48, !llvm.loop !14

63:                                               ; preds = %46, %48, %37
  %64 = add nuw nsw i32 %38, 1
  %65 = icmp eq i32 %64, %4
  br i1 %65, label %34, label %37, !llvm.loop !16

66:                                               ; preds = %40, %66
  %67 = phi i32 [ %148, %66 ], [ 0, %40 ]
  %68 = phi i32 [ %149, %66 ], [ 0, %40 ]
  %69 = add nsw i32 %67, %44
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %17, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !12
  %73 = add nsw i32 %67, %45
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %20, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !12
  %77 = fadd contract float %72, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !12
  %78 = or i32 %67, 1
  %79 = add nsw i32 %78, %44
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %17, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !12
  %83 = add nsw i32 %78, %45
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %20, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !12
  %87 = fadd contract float %82, %86
  store float %87, float addrspace(1)* %85, align 4, !tbaa !12
  %88 = or i32 %67, 2
  %89 = add nsw i32 %88, %44
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %17, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !12
  %93 = add nsw i32 %88, %45
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %20, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !12
  %97 = fadd contract float %92, %96
  store float %97, float addrspace(1)* %95, align 4, !tbaa !12
  %98 = or i32 %67, 3
  %99 = add nsw i32 %98, %44
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %17, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !12
  %103 = add nsw i32 %98, %45
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %20, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !12
  %107 = fadd contract float %102, %106
  store float %107, float addrspace(1)* %105, align 4, !tbaa !12
  %108 = or i32 %67, 4
  %109 = add nsw i32 %108, %44
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %17, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !12
  %113 = add nsw i32 %108, %45
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %20, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !12
  %117 = fadd contract float %112, %116
  store float %117, float addrspace(1)* %115, align 4, !tbaa !12
  %118 = or i32 %67, 5
  %119 = add nsw i32 %118, %44
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %17, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !12
  %123 = add nsw i32 %118, %45
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %20, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !12
  %127 = fadd contract float %122, %126
  store float %127, float addrspace(1)* %125, align 4, !tbaa !12
  %128 = or i32 %67, 6
  %129 = add nsw i32 %128, %44
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %17, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !12
  %133 = add nsw i32 %128, %45
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %20, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !12
  %137 = fadd contract float %132, %136
  store float %137, float addrspace(1)* %135, align 4, !tbaa !12
  %138 = or i32 %67, 7
  %139 = add nsw i32 %138, %44
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %17, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !12
  %143 = add nsw i32 %138, %45
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %20, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !12
  %147 = fadd contract float %142, %146
  store float %147, float addrspace(1)* %145, align 4, !tbaa !12
  %148 = add nuw nsw i32 %67, 8
  %149 = add i32 %68, 8
  %150 = icmp eq i32 %149, %27
  br i1 %150, label %46, label %66, !llvm.loop !17
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
