; ModuleID = '../data/hip_kernels/6580/38/main.cu'
source_filename = "../data/hip_kernels/6580/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24matrixMultiplyAndSoftmaxPfS_S_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = shl nsw i32 %12, 4
  %16 = add nsw i32 %15, %14
  %17 = shl nsw i32 %11, 4
  %18 = add nsw i32 %17, %13
  %19 = icmp slt i32 %5, -14
  br i1 %19, label %60, label %20

20:                                               ; preds = %10
  %21 = add nsw i32 %5, -1
  %22 = sdiv i32 %21, 16
  %23 = icmp slt i32 %16, %4
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 %13
  %25 = mul nsw i32 %16, %5
  %26 = icmp slt i32 %18, %7
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 %14, i32 %13
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 0
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 0, i32 %13
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 1
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 1, i32 %13
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 2
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 2, i32 %13
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 3
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 3, i32 %13
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 4
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 4, i32 %13
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 5
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 5, i32 %13
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 6
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 6, i32 %13
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 7
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 7, i32 %13
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 8
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 8, i32 %13
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 9
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 9, i32 %13
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 10
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 10, i32 %13
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 11
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 11, i32 %13
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 12
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 12, i32 %13
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 13
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 13, i32 %13
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 14
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 14, i32 %13
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_M, i32 0, i32 %14, i32 15
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ24matrixMultiplyAndSoftmaxPfS_S_S_iiiiiiE4ds_N, i32 0, i32 15, i32 %13
  br label %65

60:                                               ; preds = %89, %10
  %61 = phi float [ 0.000000e+00, %10 ], [ %154, %89 ]
  %62 = icmp slt i32 %16, %8
  %63 = icmp slt i32 %18, %9
  %64 = select i1 %62, i1 %63, i1 false
  br i1 %64, label %157, label %166

65:                                               ; preds = %20, %89
  %66 = phi i32 [ 0, %20 ], [ %155, %89 ]
  %67 = phi float [ 0.000000e+00, %20 ], [ %154, %89 ]
  br i1 %23, label %68, label %77

68:                                               ; preds = %65
  %69 = shl nsw i32 %66, 4
  %70 = add nuw i32 %69, %13
  %71 = icmp slt i32 %70, %5
  br i1 %71, label %72, label %77

72:                                               ; preds = %68
  %73 = add i32 %70, %25
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %77

77:                                               ; preds = %65, %68, %72
  %78 = phi float [ %76, %72 ], [ 0.000000e+00, %68 ], [ 0.000000e+00, %65 ]
  store float %78, float addrspace(3)* %24, align 4, !tbaa !5
  br i1 %26, label %79, label %89

79:                                               ; preds = %77
  %80 = shl nsw i32 %66, 4
  %81 = add nuw nsw i32 %80, %14
  %82 = icmp slt i32 %81, %6
  br i1 %82, label %83, label %89

83:                                               ; preds = %79
  %84 = mul nsw i32 %81, %7
  %85 = add nsw i32 %84, %18
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %89

89:                                               ; preds = %77, %79, %83
  %90 = phi float [ %88, %83 ], [ 0.000000e+00, %79 ], [ 0.000000e+00, %77 ]
  store float %90, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %92 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %67, %93
  %95 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %96 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %100 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %104 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %108 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %112 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %116 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %120 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %124 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %128 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %132 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %136 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %52, align 16, !tbaa !5
  %140 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %144 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %148 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %152 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = add nuw nsw i32 %66, 1
  %156 = icmp eq i32 %66, %22
  br i1 %156, label %60, label %65, !llvm.loop !10

157:                                              ; preds = %60
  %158 = sext i32 %16 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5, !amdgpu.noclobber !9
  %161 = fadd contract float %61, %160
  %162 = mul nsw i32 %16, %9
  %163 = add nsw i32 %162, %18
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  store float %161, float addrspace(1)* %165, align 4, !tbaa !5
  br label %166

166:                                              ; preds = %157, %60
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
