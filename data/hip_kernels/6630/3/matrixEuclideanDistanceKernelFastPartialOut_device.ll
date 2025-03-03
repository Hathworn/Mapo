; ModuleID = '../data/hip_kernels/6630/3/main.cu'
source_filename = "../data/hip_kernels/6630/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llll(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i64 %4, i64 %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = zext i32 %12 to i64
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %11, 4
  %17 = mul nsw i64 %16, %4
  %18 = shl nuw nsw i64 %9, 4
  %19 = add nsw i64 %17, %4
  %20 = icmp sgt i64 %4, 0
  br i1 %20, label %21, label %152

21:                                               ; preds = %7
  %22 = mul nsw i64 %18, %4
  %23 = mul nsw i64 %15, %4
  %24 = add i64 %23, %13
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 %12
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 %12, i32 %14
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 0
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 0, i32 %12
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 1
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 1, i32 %12
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 2
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 2, i32 %12
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 3
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 3, i32 %12
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 4
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 4, i32 %12
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 5
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 5, i32 %12
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 6
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 6, i32 %12
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 7
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 7, i32 %12
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 8, i32 %12
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 9, i32 %12
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 10, i32 %12
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 11, i32 %12
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 12
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 12, i32 %12
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 13
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 13, i32 %12
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 14
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 14, i32 %12
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Ys, i32 0, i32 %14, i32 15
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ43matrixEuclideanDistanceKernelFastPartialOutPfS_S_llllE2Xs, i32 0, i32 15, i32 %12
  br label %59

59:                                               ; preds = %21, %59
  %60 = phi float [ 0.000000e+00, %21 ], [ %148, %59 ]
  %61 = phi i64 [ %17, %21 ], [ %149, %59 ]
  %62 = phi i64 [ %22, %21 ], [ %150, %59 ]
  %63 = add i64 %24, %61
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %65, float addrspace(3)* %25, align 4, !tbaa !5
  %66 = add i64 %24, %62
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %68, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = load float, float addrspace(3)* %27, align 16, !tbaa !5
  %70 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %71 = fsub contract float %69, %70
  %72 = fmul contract float %71, %71
  %73 = fadd contract float %60, %72
  %74 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %75 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %76 = fsub contract float %74, %75
  %77 = fmul contract float %76, %76
  %78 = fadd contract float %73, %77
  %79 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %80 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %81 = fsub contract float %79, %80
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %78, %82
  %84 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %85 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %86 = fsub contract float %84, %85
  %87 = fmul contract float %86, %86
  %88 = fadd contract float %83, %87
  %89 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %90 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %91 = fsub contract float %89, %90
  %92 = fmul contract float %91, %91
  %93 = fadd contract float %88, %92
  %94 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %96 = fsub contract float %94, %95
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %93, %97
  %99 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %100 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %101 = fsub contract float %99, %100
  %102 = fmul contract float %101, %101
  %103 = fadd contract float %98, %102
  %104 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %105 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %106 = fsub contract float %104, %105
  %107 = fmul contract float %106, %106
  %108 = fadd contract float %103, %107
  %109 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %110 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %111, %111
  %113 = fadd contract float %108, %112
  %114 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %115 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %116 = fsub contract float %114, %115
  %117 = fmul contract float %116, %116
  %118 = fadd contract float %113, %117
  %119 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %120 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %121 = fsub contract float %119, %120
  %122 = fmul contract float %121, %121
  %123 = fadd contract float %118, %122
  %124 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %125 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %126 = fsub contract float %124, %125
  %127 = fmul contract float %126, %126
  %128 = fadd contract float %123, %127
  %129 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %130 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %131 = fsub contract float %129, %130
  %132 = fmul contract float %131, %131
  %133 = fadd contract float %128, %132
  %134 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %135 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %136 = fsub contract float %134, %135
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %133, %137
  %139 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %140 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %141 = fsub contract float %139, %140
  %142 = fmul contract float %141, %141
  %143 = fadd contract float %138, %142
  %144 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %145 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %146 = fsub contract float %144, %145
  %147 = fmul contract float %146, %146
  %148 = fadd contract float %143, %147
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %149 = add nsw i64 %61, 16
  %150 = add nsw i64 %62, 16
  %151 = icmp slt i64 %149, %19
  br i1 %151, label %59, label %152, !llvm.loop !10

152:                                              ; preds = %59, %7
  %153 = phi float [ 0.000000e+00, %7 ], [ %148, %59 ]
  %154 = add nuw nsw i64 %16, %15
  %155 = mul i64 %154, %3
  %156 = add nuw nsw i64 %18, %13
  %157 = add i64 %156, %155
  %158 = icmp sge i64 %157, %5
  %159 = icmp slt i64 %157, %6
  %160 = select i1 %158, i1 %159, i1 false
  br i1 %160, label %161, label %164

161:                                              ; preds = %152
  %162 = sub nsw i64 %157, %5
  %163 = getelementptr inbounds float, float addrspace(1)* %2, i64 %162
  store float %153, float addrspace(1)* %163, align 4, !tbaa !5
  br label %164

164:                                              ; preds = %161, %152
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
