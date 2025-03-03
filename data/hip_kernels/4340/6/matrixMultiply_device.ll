; ModuleID = '../data/hip_kernels/4340/6/main.cu'
source_filename = "../data/hip_kernels/4340/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A = internal unnamed_addr addrspace(3) global [14 x [14 x float]] undef, align 16
@_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B = internal unnamed_addr addrspace(3) global [14 x [14 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14matrixMultiplyPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = mul nsw i32 %11, 14
  %15 = add nsw i32 %14, %13
  %16 = mul nsw i32 %10, 14
  %17 = add nsw i32 %16, %12
  %18 = icmp slt i32 %5, -12
  br i1 %18, label %55, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %5, -1
  %21 = sdiv i32 %20, 14
  %22 = icmp slt i32 %15, %3
  %23 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 %12
  %24 = mul nsw i32 %15, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 %13, i32 %12
  %27 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 0
  %28 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 0, i32 %12
  %29 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 1
  %30 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 1, i32 %12
  %31 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 2
  %32 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 2, i32 %12
  %33 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 3
  %34 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 3, i32 %12
  %35 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 4
  %36 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 4, i32 %12
  %37 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 5
  %38 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 5, i32 %12
  %39 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 6
  %40 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 6, i32 %12
  %41 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 7
  %42 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 7, i32 %12
  %43 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 8
  %44 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 8, i32 %12
  %45 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 9
  %46 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 9, i32 %12
  %47 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 10
  %48 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 10, i32 %12
  %49 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 11
  %50 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 11, i32 %12
  %51 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 12
  %52 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 12, i32 %12
  %53 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_A, i32 0, i32 %13, i32 13
  %54 = getelementptr inbounds [14 x [14 x float]], [14 x [14 x float]] addrspace(3)* @_ZZ14matrixMultiplyPfS_S_iiiiiiE4ds_B, i32 0, i32 13, i32 %12
  br label %60

55:                                               ; preds = %83, %9
  %56 = phi float [ 0.000000e+00, %9 ], [ %140, %83 ]
  %57 = icmp slt i32 %15, %3
  %58 = icmp slt i32 %17, %6
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %143, label %148

60:                                               ; preds = %19, %83
  %61 = phi i32 [ 0, %19 ], [ %141, %83 ]
  %62 = phi float [ 0.000000e+00, %19 ], [ %140, %83 ]
  %63 = mul nuw nsw i32 %61, 14
  br i1 %22, label %64, label %72

64:                                               ; preds = %60
  %65 = add nuw i32 %63, %12
  %66 = icmp slt i32 %65, %5
  br i1 %66, label %67, label %72

67:                                               ; preds = %64
  %68 = add i32 %65, %24
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %72

72:                                               ; preds = %64, %60, %67
  %73 = phi float [ %71, %67 ], [ 0.000000e+00, %60 ], [ 0.000000e+00, %64 ]
  store float %73, float addrspace(3)* %23, align 4, !tbaa !5
  %74 = add nuw nsw i32 %63, %13
  %75 = icmp slt i32 %74, %5
  %76 = select i1 %75, i1 %25, i1 false
  br i1 %76, label %77, label %83

77:                                               ; preds = %72
  %78 = mul nsw i32 %74, %6
  %79 = add nsw i32 %78, %17
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %72, %77
  %84 = phi float [ %82, %77 ], [ 0.000000e+00, %72 ]
  store float %84, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = load float, float addrspace(3)* %27, align 8, !tbaa !5
  %86 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %87 = fmul contract float %85, %86
  %88 = fadd contract float %62, %87
  %89 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %90 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %88, %91
  %93 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %94 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %92, %95
  %97 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %35, align 8, !tbaa !5
  %102 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %106 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %110 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %43, align 8, !tbaa !5
  %118 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %122 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %126 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %130 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %51, align 8, !tbaa !5
  %134 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = add nuw nsw i32 %61, 1
  %142 = icmp eq i32 %61, %21
  br i1 %142, label %55, label %60, !llvm.loop !10

143:                                              ; preds = %55
  %144 = mul nsw i32 %15, %6
  %145 = add nsw i32 %144, %17
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  store float %56, float addrspace(1)* %147, align 4, !tbaa !5
  br label %148

148:                                              ; preds = %143, %55
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
