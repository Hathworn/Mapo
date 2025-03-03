; ModuleID = '../data/hip_kernels/6580/46/main.cu'
source_filename = "../data/hip_kernels/6580/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29matrixMultiplyBackPropSigmoidPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = shl nsw i32 %11, 4
  %15 = add nsw i32 %14, %13
  %16 = shl nsw i32 %10, 4
  %17 = add nsw i32 %16, %12
  %18 = icmp slt i32 %4, -14
  br i1 %18, label %59, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %4, -1
  %21 = sdiv i32 %20, 16
  %22 = icmp slt i32 %15, %3
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 %12
  %24 = mul nsw i32 %15, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 %13, i32 %12
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 0
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 0, i32 %12
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 1
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 1, i32 %12
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 2
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 2, i32 %12
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 3
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 3, i32 %12
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 4
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 4, i32 %12
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 5
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 5, i32 %12
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 6
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 6, i32 %12
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 7
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 7, i32 %12
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 8, i32 %12
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 9, i32 %12
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 10, i32 %12
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 11, i32 %12
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 12
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 12, i32 %12
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 13
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 13, i32 %12
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 14
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 14, i32 %12
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 15
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ29matrixMultiplyBackPropSigmoidPfS_S_iiiiiiE4ds_N, i32 0, i32 15, i32 %12
  br label %64

59:                                               ; preds = %88, %9
  %60 = phi float [ 0.000000e+00, %9 ], [ %153, %88 ]
  %61 = icmp slt i32 %15, %7
  %62 = icmp slt i32 %17, %8
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %156, label %161

64:                                               ; preds = %19, %88
  %65 = phi i32 [ 0, %19 ], [ %154, %88 ]
  %66 = phi float [ 0.000000e+00, %19 ], [ %153, %88 ]
  br i1 %22, label %67, label %76

67:                                               ; preds = %64
  %68 = shl nsw i32 %65, 4
  %69 = add nuw i32 %68, %12
  %70 = icmp slt i32 %69, %4
  br i1 %70, label %71, label %76

71:                                               ; preds = %67
  %72 = add i32 %69, %24
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %76

76:                                               ; preds = %64, %67, %71
  %77 = phi float [ %75, %71 ], [ 0.000000e+00, %67 ], [ 0.000000e+00, %64 ]
  store float %77, float addrspace(3)* %23, align 4, !tbaa !5
  br i1 %25, label %78, label %88

78:                                               ; preds = %76
  %79 = shl nsw i32 %65, 4
  %80 = add nuw nsw i32 %79, %13
  %81 = icmp slt i32 %80, %5
  br i1 %81, label %82, label %88

82:                                               ; preds = %78
  %83 = mul nsw i32 %80, %6
  %84 = add nsw i32 %83, %17
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %88

88:                                               ; preds = %76, %78, %82
  %89 = phi float [ %87, %82 ], [ 0.000000e+00, %78 ], [ 0.000000e+00, %76 ]
  store float %89, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = load float, float addrspace(3)* %27, align 16, !tbaa !5
  %91 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %92 = fmul contract float %90, %91
  %93 = fadd contract float %66, %92
  %94 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %96 = fmul contract float %94, %95
  %97 = fadd contract float %93, %96
  %98 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %99 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %97, %100
  %102 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %103 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %107 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %111 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %115 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %119 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %123 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %131 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %135 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %139 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %143 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %147 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %151 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = add nuw nsw i32 %65, 1
  %155 = icmp eq i32 %65, %21
  br i1 %155, label %59, label %64, !llvm.loop !10

156:                                              ; preds = %59
  %157 = mul nsw i32 %15, %8
  %158 = add nsw i32 %157, %17
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  store float %60, float addrspace(1)* %160, align 4, !tbaa !5
  br label %161

161:                                              ; preds = %156, %59
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
