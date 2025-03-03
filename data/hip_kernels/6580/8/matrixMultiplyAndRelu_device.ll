; ModuleID = '../data/hip_kernels/6580/8/main.cu'
source_filename = "../data/hip_kernels/6580/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21matrixMultiplyAndReluPfS_S_S_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = shl nsw i32 %13, 4
  %17 = add nsw i32 %16, %15
  %18 = shl nsw i32 %12, 4
  %19 = add nsw i32 %18, %14
  %20 = icmp slt i32 %6, -14
  br i1 %20, label %61, label %21

21:                                               ; preds = %11
  %22 = add nsw i32 %6, -1
  %23 = sdiv i32 %22, 16
  %24 = icmp slt i32 %17, %5
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 %14
  %26 = mul nsw i32 %17, %6
  %27 = icmp slt i32 %19, %8
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 %15, i32 %14
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 0
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 0, i32 %14
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 1
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 1, i32 %14
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 2
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 2, i32 %14
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 3
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 3, i32 %14
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 4
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 4, i32 %14
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 5
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 5, i32 %14
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 6
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 6, i32 %14
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 7
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 7, i32 %14
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 8, i32 %14
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 9, i32 %14
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 10
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 10, i32 %14
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 11
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 11, i32 %14
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 12
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 12, i32 %14
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 13
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 13, i32 %14
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 14
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 14, i32 %14
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_M, i32 0, i32 %15, i32 15
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ21matrixMultiplyAndReluPfS_S_S_S_iiiiiiE4ds_N, i32 0, i32 15, i32 %14
  br label %66

61:                                               ; preds = %90, %11
  %62 = phi float [ 0.000000e+00, %11 ], [ %155, %90 ]
  %63 = icmp slt i32 %17, %9
  %64 = icmp slt i32 %19, %10
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %158, label %169

66:                                               ; preds = %21, %90
  %67 = phi float [ 0.000000e+00, %21 ], [ %155, %90 ]
  %68 = phi i32 [ 0, %21 ], [ %156, %90 ]
  br i1 %24, label %69, label %78

69:                                               ; preds = %66
  %70 = shl nsw i32 %68, 4
  %71 = add nuw i32 %70, %14
  %72 = icmp slt i32 %71, %6
  br i1 %72, label %73, label %78

73:                                               ; preds = %69
  %74 = add i32 %71, %26
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %78

78:                                               ; preds = %66, %69, %73
  %79 = phi float [ %77, %73 ], [ 0.000000e+00, %69 ], [ 0.000000e+00, %66 ]
  store float %79, float addrspace(3)* %25, align 4, !tbaa !5
  br i1 %27, label %80, label %90

80:                                               ; preds = %78
  %81 = shl nsw i32 %68, 4
  %82 = add nuw nsw i32 %81, %15
  %83 = icmp slt i32 %82, %7
  br i1 %83, label %84, label %90

84:                                               ; preds = %80
  %85 = mul nsw i32 %82, %8
  %86 = add nsw i32 %85, %19
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %90

90:                                               ; preds = %78, %80, %84
  %91 = phi float [ %89, %84 ], [ 0.000000e+00, %80 ], [ 0.000000e+00, %78 ]
  store float %91, float addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = load float, float addrspace(3)* %29, align 16, !tbaa !5
  %93 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %67, %94
  %96 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %97 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %95, %98
  %100 = load float, float addrspace(3)* %33, align 8, !tbaa !5
  %101 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %99, %102
  %104 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %105 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %103, %106
  %108 = load float, float addrspace(3)* %37, align 16, !tbaa !5
  %109 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %107, %110
  %112 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %113 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %41, align 8, !tbaa !5
  %117 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %45, align 16, !tbaa !5
  %125 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %129 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %49, align 8, !tbaa !5
  %133 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %137 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %53, align 16, !tbaa !5
  %141 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %145 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %57, align 8, !tbaa !5
  %149 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %153 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = add nuw nsw i32 %68, 1
  %157 = icmp eq i32 %68, %23
  br i1 %157, label %61, label %66, !llvm.loop !10

158:                                              ; preds = %61
  %159 = sext i32 %17 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %3, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  %162 = fadd contract float %62, %161
  %163 = mul nsw i32 %17, %10
  %164 = add nsw i32 %163, %19
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %4, i64 %165
  store float %162, float addrspace(1)* %166, align 4, !tbaa !5
  %167 = tail call float @llvm.maxnum.f32(float %162, float 0.000000e+00)
  %168 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  store float %167, float addrspace(1)* %168, align 4, !tbaa !5
  br label %169

169:                                              ; preds = %158, %61
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
