; ModuleID = '../data/hip_kernels/4431/11/main.cu'
source_filename = "../data/hip_kernels/4431/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20group_point_grad_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %29

10:                                               ; preds = %8
  %11 = icmp sgt i32 %3, 0
  %12 = icmp sgt i32 %4, 0
  %13 = icmp sgt i32 %2, 0
  %14 = mul nsw i32 %4, %3
  %15 = sext i32 %14 to i64
  %16 = mul nsw i32 %14, %2
  %17 = sext i32 %16 to i64
  %18 = mul nsw i32 %2, %1
  %19 = sext i32 %18 to i64
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  %22 = and i32 %2, -8
  %23 = icmp eq i32 %20, 0
  br label %24

24:                                               ; preds = %10, %34
  %25 = phi float addrspace(1)* [ %5, %10 ], [ %36, %34 ]
  %26 = phi i32 [ 0, %10 ], [ %38, %34 ]
  %27 = phi float addrspace(1)* [ %7, %10 ], [ %37, %34 ]
  %28 = phi i32 addrspace(1)* [ %6, %10 ], [ %35, %34 ]
  br i1 %11, label %30, label %34

29:                                               ; preds = %34, %8
  ret void

30:                                               ; preds = %24, %40
  %31 = phi i32 [ %41, %40 ], [ 0, %24 ]
  br i1 %12, label %32, label %40

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %4
  br label %43

34:                                               ; preds = %40, %24
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %28, i64 %15
  %36 = getelementptr inbounds float, float addrspace(1)* %25, i64 %17
  %37 = getelementptr inbounds float, float addrspace(1)* %27, i64 %19
  %38 = add nuw nsw i32 %26, 1
  %39 = icmp eq i32 %38, %0
  br i1 %39, label %29, label %24, !llvm.loop !4

40:                                               ; preds = %69, %30
  %41 = add nuw nsw i32 %31, 1
  %42 = icmp eq i32 %41, %3
  br i1 %42, label %34, label %30, !llvm.loop !6

43:                                               ; preds = %32, %69
  %44 = phi i32 [ 0, %32 ], [ %70, %69 ]
  %45 = add nsw i32 %44, %33
  br i1 %13, label %46, label %69

46:                                               ; preds = %43
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %28, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %50 = mul i32 %45, %2
  %51 = mul nsw i32 %49, %2
  br i1 %21, label %52, label %72

52:                                               ; preds = %72, %46
  %53 = phi i32 [ 0, %46 ], [ %154, %72 ]
  br i1 %23, label %69, label %54

54:                                               ; preds = %52, %54
  %55 = phi i32 [ %66, %54 ], [ %53, %52 ]
  %56 = phi i32 [ %67, %54 ], [ 0, %52 ]
  %57 = add nsw i32 %55, %50
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %25, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11
  %61 = add nsw i32 %55, %51
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %27, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11
  %65 = fadd contract float %60, %64
  store float %65, float addrspace(1)* %63, align 4, !tbaa !11
  %66 = add nuw nsw i32 %55, 1
  %67 = add i32 %56, 1
  %68 = icmp eq i32 %67, %20
  br i1 %68, label %69, label %54, !llvm.loop !13

69:                                               ; preds = %52, %54, %43
  %70 = add nuw nsw i32 %44, 1
  %71 = icmp eq i32 %70, %4
  br i1 %71, label %40, label %43, !llvm.loop !15

72:                                               ; preds = %46, %72
  %73 = phi i32 [ %154, %72 ], [ 0, %46 ]
  %74 = phi i32 [ %155, %72 ], [ 0, %46 ]
  %75 = add nsw i32 %73, %50
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %25, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11
  %79 = add nsw i32 %73, %51
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %27, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = fadd contract float %78, %82
  store float %83, float addrspace(1)* %81, align 4, !tbaa !11
  %84 = or i32 %73, 1
  %85 = add nsw i32 %84, %50
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %25, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !11
  %89 = add nsw i32 %84, %51
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %27, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = fadd contract float %88, %92
  store float %93, float addrspace(1)* %91, align 4, !tbaa !11
  %94 = or i32 %73, 2
  %95 = add nsw i32 %94, %50
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %25, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11
  %99 = add nsw i32 %94, %51
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %27, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11
  %103 = fadd contract float %98, %102
  store float %103, float addrspace(1)* %101, align 4, !tbaa !11
  %104 = or i32 %73, 3
  %105 = add nsw i32 %104, %50
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %25, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !11
  %109 = add nsw i32 %104, %51
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %27, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11
  %113 = fadd contract float %108, %112
  store float %113, float addrspace(1)* %111, align 4, !tbaa !11
  %114 = or i32 %73, 4
  %115 = add nsw i32 %114, %50
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %25, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !11
  %119 = add nsw i32 %114, %51
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %27, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11
  %123 = fadd contract float %118, %122
  store float %123, float addrspace(1)* %121, align 4, !tbaa !11
  %124 = or i32 %73, 5
  %125 = add nsw i32 %124, %50
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %25, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !11
  %129 = add nsw i32 %124, %51
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %27, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !11
  %133 = fadd contract float %128, %132
  store float %133, float addrspace(1)* %131, align 4, !tbaa !11
  %134 = or i32 %73, 6
  %135 = add nsw i32 %134, %50
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %25, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11
  %139 = add nsw i32 %134, %51
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %27, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !11
  %143 = fadd contract float %138, %142
  store float %143, float addrspace(1)* %141, align 4, !tbaa !11
  %144 = or i32 %73, 7
  %145 = add nsw i32 %144, %50
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %25, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !11
  %149 = add nsw i32 %144, %51
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %27, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !11
  %153 = fadd contract float %148, %152
  store float %153, float addrspace(1)* %151, align 4, !tbaa !11
  %154 = add nuw nsw i32 %73, 8
  %155 = add i32 %74, 8
  %156 = icmp eq i32 %155, %22
  br i1 %156, label %52, label %72, !llvm.loop !16
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !5}
!16 = distinct !{!16, !5}
