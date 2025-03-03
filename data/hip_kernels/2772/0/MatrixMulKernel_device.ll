; ModuleID = '../data/hip_kernels/2772/0/main.cu'
source_filename = "../data/hip_kernels/2772/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15MatrixMulKernelPfS_S_iE3Mds = internal unnamed_addr addrspace(3) global [7 x [7 x float]] undef, align 16
@_ZZ15MatrixMulKernelPfS_S_iE3Nds = internal unnamed_addr addrspace(3) global [7 x [7 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15MatrixMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = mul nsw i32 %6, 7
  %10 = add nsw i32 %9, %8
  %11 = mul nsw i32 %5, 7
  %12 = add nsw i32 %11, %7
  %13 = sdiv i32 %3, 7
  %14 = icmp sgt i32 %3, 6
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %34

16:                                               ; preds = %4
  %17 = add i32 %15, %7
  %18 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 %8, i32 %7
  %20 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 1, i32 %7
  %24 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 2, i32 %7
  %26 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 3, i32 %7
  %28 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 4, i32 %7
  %30 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 5, i32 %7
  %32 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Mds, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [7 x [7 x float]], [7 x [7 x float]] addrspace(3)* @_ZZ15MatrixMulKernelPfS_S_iE3Nds, i32 0, i32 6, i32 %7
  br label %39

34:                                               ; preds = %39, %4
  %35 = phi float [ 0.000000e+00, %4 ], [ %80, %39 ]
  %36 = add nsw i32 %15, %12
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float %35, float addrspace(1)* %38, align 4, !tbaa !5
  ret void

39:                                               ; preds = %16, %39
  %40 = phi i32 [ 0, %16 ], [ %81, %39 ]
  %41 = phi float [ 0.000000e+00, %16 ], [ %80, %39 ]
  %42 = mul nuw nsw i32 %40, 7
  %43 = add i32 %17, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %46, float addrspace(3)* %18, align 4, !tbaa !5
  %47 = add nuw nsw i32 %42, %8
  %48 = mul nsw i32 %47, %3
  %49 = add nsw i32 %48, %12
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %52, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %54 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %55 = fmul contract float %53, %54
  %56 = fadd contract float %41, %55
  %57 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %58 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %59 = fmul contract float %57, %58
  %60 = fadd contract float %56, %59
  %61 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %62 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %63 = fmul contract float %61, %62
  %64 = fadd contract float %60, %63
  %65 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %66 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %67 = fmul contract float %65, %66
  %68 = fadd contract float %64, %67
  %69 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %70 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %71 = fmul contract float %69, %70
  %72 = fadd contract float %68, %71
  %73 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %74 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %75 = fmul contract float %73, %74
  %76 = fadd contract float %72, %75
  %77 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %78 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %79 = fmul contract float %77, %78
  %80 = fadd contract float %76, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = add nuw nsw i32 %40, 1
  %82 = icmp eq i32 %81, %13
  br i1 %82, label %34, label %39, !llvm.loop !10
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
