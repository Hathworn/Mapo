; ModuleID = '../data/hip_kernels/6630/2/main.cu'
source_filename = "../data/hip_kernels/6630/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z43matrixEuclideanDistanceKernelFastPartialOutPfS_llll(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = zext i32 %9 to i64
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %10, 4
  %16 = mul nsw i64 %15, %3
  %17 = shl nuw nsw i64 %8, 4
  %18 = add nsw i64 %16, %3
  %19 = icmp sgt i64 %3, 0
  br i1 %19, label %20, label %151

20:                                               ; preds = %6
  %21 = mul nsw i64 %17, %3
  %22 = mul nsw i64 %14, %3
  %23 = add i64 %22, %12
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 %11
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 %11, i32 %13
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 0
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 0, i32 %11
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 1
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 1, i32 %11
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 2
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 2, i32 %11
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 3
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 3, i32 %11
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 4
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 4, i32 %11
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 5
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 5, i32 %11
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 6
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 6, i32 %11
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 7
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 7, i32 %11
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 8
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 8, i32 %11
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 9
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 9, i32 %11
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 10
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 10, i32 %11
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 11
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 11, i32 %11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 12
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 12, i32 %11
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 13
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 13, i32 %11
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 14
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 14, i32 %11
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Ys, i32 0, i32 %13, i32 15
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_llllE2Xs, i32 0, i32 15, i32 %11
  br label %58

58:                                               ; preds = %20, %58
  %59 = phi float [ 0.000000e+00, %20 ], [ %147, %58 ]
  %60 = phi i64 [ %16, %20 ], [ %148, %58 ]
  %61 = phi i64 [ %21, %20 ], [ %149, %58 ]
  %62 = add i64 %23, %60
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %64, float addrspace(3)* %24, align 4, !tbaa !5
  %65 = add i64 %23, %61
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %67, float addrspace(3)* %25, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = load float, float addrspace(3)* %26, align 16, !tbaa !5
  %69 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %70 = fsub contract float %68, %69
  %71 = fmul contract float %70, %70
  %72 = fadd contract float %59, %71
  %73 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %74 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %75 = fsub contract float %73, %74
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %72, %76
  %78 = load float, float addrspace(3)* %30, align 8, !tbaa !5
  %79 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %80 = fsub contract float %78, %79
  %81 = fmul contract float %80, %80
  %82 = fadd contract float %77, %81
  %83 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %85 = fsub contract float %83, %84
  %86 = fmul contract float %85, %85
  %87 = fadd contract float %82, %86
  %88 = load float, float addrspace(3)* %34, align 16, !tbaa !5
  %89 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %90 = fsub contract float %88, %89
  %91 = fmul contract float %90, %90
  %92 = fadd contract float %87, %91
  %93 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %95 = fsub contract float %93, %94
  %96 = fmul contract float %95, %95
  %97 = fadd contract float %92, %96
  %98 = load float, float addrspace(3)* %38, align 8, !tbaa !5
  %99 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %100 = fsub contract float %98, %99
  %101 = fmul contract float %100, %100
  %102 = fadd contract float %97, %101
  %103 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %104 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %105 = fsub contract float %103, %104
  %106 = fmul contract float %105, %105
  %107 = fadd contract float %102, %106
  %108 = load float, float addrspace(3)* %42, align 16, !tbaa !5
  %109 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %110 = fsub contract float %108, %109
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %107, %111
  %113 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %115 = fsub contract float %113, %114
  %116 = fmul contract float %115, %115
  %117 = fadd contract float %112, %116
  %118 = load float, float addrspace(3)* %46, align 8, !tbaa !5
  %119 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %120 = fsub contract float %118, %119
  %121 = fmul contract float %120, %120
  %122 = fadd contract float %117, %121
  %123 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %124 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %125 = fsub contract float %123, %124
  %126 = fmul contract float %125, %125
  %127 = fadd contract float %122, %126
  %128 = load float, float addrspace(3)* %50, align 16, !tbaa !5
  %129 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %130 = fsub contract float %128, %129
  %131 = fmul contract float %130, %130
  %132 = fadd contract float %127, %131
  %133 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %135 = fsub contract float %133, %134
  %136 = fmul contract float %135, %135
  %137 = fadd contract float %132, %136
  %138 = load float, float addrspace(3)* %54, align 8, !tbaa !5
  %139 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %140 = fsub contract float %138, %139
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %137, %141
  %143 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %144 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %145 = fsub contract float %143, %144
  %146 = fmul contract float %145, %145
  %147 = fadd contract float %142, %146
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %148 = add nsw i64 %60, 16
  %149 = add nsw i64 %61, 16
  %150 = icmp slt i64 %148, %18
  br i1 %150, label %58, label %151, !llvm.loop !10

151:                                              ; preds = %58, %6
  %152 = phi float [ 0.000000e+00, %6 ], [ %147, %58 ]
  %153 = add nuw nsw i64 %15, %14
  %154 = mul i64 %153, %2
  %155 = add nuw nsw i64 %17, %12
  %156 = add i64 %155, %154
  %157 = icmp sge i64 %156, %4
  %158 = icmp slt i64 %156, %5
  %159 = select i1 %157, i1 %158, i1 false
  br i1 %159, label %160, label %163

160:                                              ; preds = %151
  %161 = sub nsw i64 %156, %4
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  store float %152, float addrspace(1)* %162, align 4, !tbaa !5
  br label %163

163:                                              ; preds = %160, %151
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
