; ModuleID = '../data/hip_kernels/13553/1/main.cu'
source_filename = "../data/hip_kernels/13553/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16
@_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23matrix_2d_mul_float_gpuPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %4, 3
  %12 = mul nsw i32 %11, %8
  %13 = add nsw i32 %12, %4
  %14 = shl nsw i32 %7, 3
  %15 = shl nsw i32 %5, 3
  %16 = icmp sgt i32 %4, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %6
  %18 = mul nsw i32 %10, %4
  %19 = add i32 %18, %9
  %20 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 %9
  %21 = mul nsw i32 %9, %5
  %22 = add i32 %21, %10
  %23 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 %9, i32 %10
  %24 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 0
  %25 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 0, i32 %9
  %26 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 1
  %27 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 1, i32 %9
  %28 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 2
  %29 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 2, i32 %9
  %30 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 3
  %31 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 3, i32 %9
  %32 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 4
  %33 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 4, i32 %9
  %34 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 5
  %35 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 5, i32 %9
  %36 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 6
  %37 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 6, i32 %9
  %38 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6A_tile, i32 0, i32 %10, i32 7
  %39 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ23matrix_2d_mul_float_gpuPfS_S_iiiE6B_tile, i32 0, i32 7, i32 %9
  br label %49

40:                                               ; preds = %49, %6
  %41 = phi float [ 0.000000e+00, %6 ], [ %92, %49 ]
  %42 = mul nsw i32 %15, %8
  %43 = mul nsw i32 %10, %5
  %44 = add i32 %14, %9
  %45 = add i32 %44, %43
  %46 = add i32 %45, %42
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  store float %41, float addrspace(1)* %48, align 4, !tbaa !5
  ret void

49:                                               ; preds = %17, %49
  %50 = phi float [ 0.000000e+00, %17 ], [ %92, %49 ]
  %51 = phi i32 [ %14, %17 ], [ %94, %49 ]
  %52 = phi i32 [ %12, %17 ], [ %93, %49 ]
  %53 = add i32 %19, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %56, float addrspace(3)* %20, align 4, !tbaa !5
  %57 = add i32 %22, %51
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %60, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %62 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %63 = fmul contract float %61, %62
  %64 = fadd contract float %50, %63
  %65 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %66 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %67 = fmul contract float %65, %66
  %68 = fadd contract float %64, %67
  %69 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %70 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %71 = fmul contract float %69, %70
  %72 = fadd contract float %68, %71
  %73 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %74 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %75 = fmul contract float %73, %74
  %76 = fadd contract float %72, %75
  %77 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %78 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %79 = fmul contract float %77, %78
  %80 = fadd contract float %76, %79
  %81 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %82 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %80, %83
  %85 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %86 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %87 = fmul contract float %85, %86
  %88 = fadd contract float %84, %87
  %89 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %90 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %88, %91
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = add nsw i32 %52, 8
  %94 = add nsw i32 %51, %15
  %95 = icmp slt i32 %93, %13
  br i1 %95, label %49, label %40, !llvm.loop !10
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
