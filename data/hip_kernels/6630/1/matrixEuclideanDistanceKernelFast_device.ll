; ModuleID = '../data/hip_kernels/6630/1/main.cu'
source_filename = "../data/hip_kernels/6630/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33matrixEuclideanDistanceKernelFastPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %6, 4
  %10 = mul nsw i32 %9, %3
  %11 = shl nsw i32 %5, 4
  %12 = add nsw i32 %10, %3
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %147

14:                                               ; preds = %4
  %15 = mul nsw i32 %11, %3
  %16 = mul nsw i32 %8, %3
  %17 = add i32 %16, %7
  %18 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 %7, i32 %8
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 1, i32 %7
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 2, i32 %7
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 3, i32 %7
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 4, i32 %7
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 5, i32 %7
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 6, i32 %7
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 7, i32 %7
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 8, i32 %7
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 9, i32 %7
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 10
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 10, i32 %7
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 11
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 11, i32 %7
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 12
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 12, i32 %7
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 13
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 13, i32 %7
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 14
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 14, i32 %7
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Ys, i32 0, i32 %8, i32 15
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ33matrixEuclideanDistanceKernelFastPfS_iiE2Xs, i32 0, i32 15, i32 %7
  br label %52

52:                                               ; preds = %14, %52
  %53 = phi float [ 0.000000e+00, %14 ], [ %143, %52 ]
  %54 = phi i32 [ %10, %14 ], [ %144, %52 ]
  %55 = phi i32 [ %15, %14 ], [ %145, %52 ]
  %56 = add i32 %17, %54
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %59, float addrspace(3)* %18, align 4, !tbaa !5
  %60 = add i32 %17, %55
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %63, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = load float, float addrspace(3)* %20, align 16, !tbaa !5
  %65 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %66 = fsub contract float %64, %65
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %53, %67
  %69 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %70 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %71 = fsub contract float %69, %70
  %72 = fmul contract float %71, %71
  %73 = fadd contract float %68, %72
  %74 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %75 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %76 = fsub contract float %74, %75
  %77 = fmul contract float %76, %76
  %78 = fadd contract float %73, %77
  %79 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %81 = fsub contract float %79, %80
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %78, %82
  %84 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %85 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %86 = fsub contract float %84, %85
  %87 = fmul contract float %86, %86
  %88 = fadd contract float %83, %87
  %89 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %90 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %91 = fsub contract float %89, %90
  %92 = fmul contract float %91, %91
  %93 = fadd contract float %88, %92
  %94 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %95 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %96 = fsub contract float %94, %95
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %93, %97
  %99 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %101 = fsub contract float %99, %100
  %102 = fmul contract float %101, %101
  %103 = fadd contract float %98, %102
  %104 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %105 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %106 = fsub contract float %104, %105
  %107 = fmul contract float %106, %106
  %108 = fadd contract float %103, %107
  %109 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %111, %111
  %113 = fadd contract float %108, %112
  %114 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %115 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %116 = fsub contract float %114, %115
  %117 = fmul contract float %116, %116
  %118 = fadd contract float %113, %117
  %119 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %120 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %121 = fsub contract float %119, %120
  %122 = fmul contract float %121, %121
  %123 = fadd contract float %118, %122
  %124 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %125 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %126 = fsub contract float %124, %125
  %127 = fmul contract float %126, %126
  %128 = fadd contract float %123, %127
  %129 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %130 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %131 = fsub contract float %129, %130
  %132 = fmul contract float %131, %131
  %133 = fadd contract float %128, %132
  %134 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %135 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %136 = fsub contract float %134, %135
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %133, %137
  %139 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %140 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %141 = fsub contract float %139, %140
  %142 = fmul contract float %141, %141
  %143 = fadd contract float %138, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %144 = add nsw i32 %54, 16
  %145 = add nsw i32 %55, 16
  %146 = icmp slt i32 %144, %12
  br i1 %146, label %52, label %147, !llvm.loop !10

147:                                              ; preds = %52, %4
  %148 = phi float [ 0.000000e+00, %4 ], [ %143, %52 ]
  %149 = add i32 %9, %8
  %150 = mul i32 %149, %2
  %151 = add i32 %11, %7
  %152 = add i32 %151, %150
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  store float %148, float addrspace(1)* %154, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
