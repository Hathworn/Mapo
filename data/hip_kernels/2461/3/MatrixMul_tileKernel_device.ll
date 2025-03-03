; ModuleID = '../data/hip_kernels/2461/3/main.cu'
source_filename = "../data/hip_kernels/2461/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20MatrixMul_tileKernelPfS_S_iE1a = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ20MatrixMul_tileKernelPfS_S_iE1b = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20MatrixMul_tileKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = sdiv i32 %3, 16
  %14 = icmp sgt i32 %3, 15
  %15 = mul nsw i32 %8, %3
  br i1 %14, label %16, label %52

16:                                               ; preds = %4
  %17 = add i32 %15, %11
  %18 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 %11
  %19 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 %7, i32 %11
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 0
  %21 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 0, i32 %11
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 1
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 1, i32 %11
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 2
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 2, i32 %11
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 3
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 3, i32 %11
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 4
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 4, i32 %11
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 5
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 5, i32 %11
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 6
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 6, i32 %11
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 7
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 7, i32 %11
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 8
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 8, i32 %11
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 9
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 9, i32 %11
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 10
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 10, i32 %11
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 11
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 11, i32 %11
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 12
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 12, i32 %11
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 13
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 13, i32 %11
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 14
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 14, i32 %11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1a, i32 0, i32 %7, i32 15
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ20MatrixMul_tileKernelPfS_S_iE1b, i32 0, i32 15, i32 %11
  br label %57

52:                                               ; preds = %57, %4
  %53 = phi float [ 0.000000e+00, %4 ], [ %134, %57 ]
  %54 = add nsw i32 %15, %12
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float %53, float addrspace(1)* %56, align 4, !tbaa !5
  ret void

57:                                               ; preds = %16, %57
  %58 = phi i32 [ 0, %16 ], [ %135, %57 ]
  %59 = phi float [ 0.000000e+00, %16 ], [ %134, %57 ]
  %60 = shl nsw i32 %58, 4
  %61 = add i32 %17, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %64, float addrspace(3)* %18, align 4, !tbaa !5
  %65 = add nuw nsw i32 %60, %7
  %66 = mul nsw i32 %65, %3
  %67 = add nsw i32 %66, %12
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %70, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = load float, float addrspace(3)* %20, align 16, !tbaa !5
  %72 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %73 = fmul contract float %71, %72
  %74 = fadd contract float %59, %73
  %75 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %76 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %74, %77
  %79 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %80 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %78, %81
  %83 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %85 = fmul contract float %83, %84
  %86 = fadd contract float %82, %85
  %87 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %88 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %86, %89
  %91 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %90, %93
  %95 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %96 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %104 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %108 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %112 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %120 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %124 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %128 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %132 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %135 = add nuw nsw i32 %58, 1
  %136 = icmp eq i32 %135, %13
  br i1 %136, label %52, label %57, !llvm.loop !10
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
