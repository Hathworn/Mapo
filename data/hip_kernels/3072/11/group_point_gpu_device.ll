; ModuleID = '../data/hip_kernels/3072/11/main.cu'
source_filename = "../data/hip_kernels/3072/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15group_point_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %29

10:                                               ; preds = %8
  %11 = icmp sgt i32 %3, 0
  %12 = icmp sgt i32 %4, 0
  %13 = icmp sgt i32 %2, 0
  %14 = mul nsw i32 %2, %1
  %15 = sext i32 %14 to i64
  %16 = mul nsw i32 %4, %3
  %17 = sext i32 %16 to i64
  %18 = mul nsw i32 %16, %2
  %19 = sext i32 %18 to i64
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  %22 = and i32 %2, -8
  %23 = icmp eq i32 %20, 0
  br label %24

24:                                               ; preds = %10, %34
  %25 = phi float addrspace(1)* [ %5, %10 ], [ %35, %34 ]
  %26 = phi i32 [ 0, %10 ], [ %38, %34 ]
  %27 = phi float addrspace(1)* [ %7, %10 ], [ %37, %34 ]
  %28 = phi i32 addrspace(1)* [ %6, %10 ], [ %36, %34 ]
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
  %35 = getelementptr inbounds float, float addrspace(1)* %25, i64 %15
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %28, i64 %17
  %37 = getelementptr inbounds float, float addrspace(1)* %27, i64 %19
  %38 = add nuw nsw i32 %26, 1
  %39 = icmp eq i32 %38, %0
  br i1 %39, label %29, label %24, !llvm.loop !4

40:                                               ; preds = %67, %30
  %41 = add nuw nsw i32 %31, 1
  %42 = icmp eq i32 %41, %3
  br i1 %42, label %34, label %30, !llvm.loop !6

43:                                               ; preds = %32, %67
  %44 = phi i32 [ 0, %32 ], [ %68, %67 ]
  %45 = add nsw i32 %44, %33
  br i1 %13, label %46, label %67

46:                                               ; preds = %43
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %28, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %50 = mul nsw i32 %49, %2
  %51 = mul i32 %45, %2
  br i1 %21, label %52, label %70

52:                                               ; preds = %70, %46
  %53 = phi i32 [ 0, %46 ], [ %136, %70 ]
  br i1 %23, label %67, label %54

54:                                               ; preds = %52, %54
  %55 = phi i32 [ %64, %54 ], [ %53, %52 ]
  %56 = phi i32 [ %65, %54 ], [ 0, %52 ]
  %57 = add nsw i32 %55, %50
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %25, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11
  %61 = add nsw i32 %55, %51
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %27, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !11
  %64 = add nuw nsw i32 %55, 1
  %65 = add i32 %56, 1
  %66 = icmp eq i32 %65, %20
  br i1 %66, label %67, label %54, !llvm.loop !13

67:                                               ; preds = %52, %54, %43
  %68 = add nuw nsw i32 %44, 1
  %69 = icmp eq i32 %68, %4
  br i1 %69, label %40, label %43, !llvm.loop !15

70:                                               ; preds = %46, %70
  %71 = phi i32 [ %136, %70 ], [ 0, %46 ]
  %72 = phi i32 [ %137, %70 ], [ 0, %46 ]
  %73 = add nsw i32 %71, %50
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %25, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11
  %77 = add nsw i32 %71, %51
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %27, i64 %78
  store float %76, float addrspace(1)* %79, align 4, !tbaa !11
  %80 = or i32 %71, 1
  %81 = add nsw i32 %80, %50
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %25, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11
  %85 = add nsw i32 %80, %51
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %27, i64 %86
  store float %84, float addrspace(1)* %87, align 4, !tbaa !11
  %88 = or i32 %71, 2
  %89 = add nsw i32 %88, %50
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %25, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = add nsw i32 %88, %51
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %27, i64 %94
  store float %92, float addrspace(1)* %95, align 4, !tbaa !11
  %96 = or i32 %71, 3
  %97 = add nsw i32 %96, %50
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %25, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11
  %101 = add nsw i32 %96, %51
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %27, i64 %102
  store float %100, float addrspace(1)* %103, align 4, !tbaa !11
  %104 = or i32 %71, 4
  %105 = add nsw i32 %104, %50
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %25, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !11
  %109 = add nsw i32 %104, %51
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %27, i64 %110
  store float %108, float addrspace(1)* %111, align 4, !tbaa !11
  %112 = or i32 %71, 5
  %113 = add nsw i32 %112, %50
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %25, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11
  %117 = add nsw i32 %112, %51
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %27, i64 %118
  store float %116, float addrspace(1)* %119, align 4, !tbaa !11
  %120 = or i32 %71, 6
  %121 = add nsw i32 %120, %50
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %25, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !11
  %125 = add nsw i32 %120, %51
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %27, i64 %126
  store float %124, float addrspace(1)* %127, align 4, !tbaa !11
  %128 = or i32 %71, 7
  %129 = add nsw i32 %128, %50
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %25, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !11
  %133 = add nsw i32 %128, %51
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %27, i64 %134
  store float %132, float addrspace(1)* %135, align 4, !tbaa !11
  %136 = add nuw nsw i32 %71, 8
  %137 = add i32 %72, 8
  %138 = icmp eq i32 %137, %22
  br i1 %138, label %52, label %70, !llvm.loop !16
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
