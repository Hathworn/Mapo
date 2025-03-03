; ModuleID = '../data/hip_kernels/7581/2/main.cu'
source_filename = "../data/hip_kernels/7581/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14matMulKernel10PfS_S_iE5Mds10 = internal unnamed_addr addrspace(3) global [10 x [10 x float]] undef, align 16
@_ZZ14matMulKernel10PfS_S_iE5Nds10 = internal unnamed_addr addrspace(3) global [10 x [10 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14matMulKernel10PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = mul nsw i32 %6, 10
  %10 = add nsw i32 %9, %8
  %11 = mul nsw i32 %5, 10
  %12 = add nsw i32 %11, %7
  %13 = sdiv i32 %3, 10
  %14 = icmp sgt i32 %3, 9
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %40

16:                                               ; preds = %4
  %17 = add i32 %15, %7
  %18 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 %8, i32 %7
  %20 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 1, i32 %7
  %24 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 2, i32 %7
  %26 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 3, i32 %7
  %28 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 4, i32 %7
  %30 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 5, i32 %7
  %32 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 6, i32 %7
  %34 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 7, i32 %7
  %36 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 8
  %37 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 8, i32 %7
  %38 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Mds10, i32 0, i32 %8, i32 9
  %39 = getelementptr inbounds [10 x [10 x float]], [10 x [10 x float]] addrspace(3)* @_ZZ14matMulKernel10PfS_S_iE5Nds10, i32 0, i32 9, i32 %7
  br label %45

40:                                               ; preds = %45, %4
  %41 = phi float [ 0.000000e+00, %4 ], [ %98, %45 ]
  %42 = add nsw i32 %15, %12
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  store float %41, float addrspace(1)* %44, align 4, !tbaa !5
  ret void

45:                                               ; preds = %16, %45
  %46 = phi i32 [ 0, %16 ], [ %99, %45 ]
  %47 = phi float [ 0.000000e+00, %16 ], [ %98, %45 ]
  %48 = mul nuw nsw i32 %46, 10
  %49 = add i32 %17, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %52, float addrspace(3)* %18, align 4, !tbaa !5
  %53 = add nuw nsw i32 %48, %8
  %54 = mul nsw i32 %53, %3
  %55 = add nsw i32 %54, %12
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %58, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = load float, float addrspace(3)* %20, align 8, !tbaa !5
  %60 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %61 = fmul contract float %59, %60
  %62 = fadd contract float %47, %61
  %63 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %64 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %65 = fmul contract float %63, %64
  %66 = fadd contract float %62, %65
  %67 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %68 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %69 = fmul contract float %67, %68
  %70 = fadd contract float %66, %69
  %71 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %72 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %73 = fmul contract float %71, %72
  %74 = fadd contract float %70, %73
  %75 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %76 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %74, %77
  %79 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %78, %81
  %83 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %84 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %85 = fmul contract float %83, %84
  %86 = fadd contract float %82, %85
  %87 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %88 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %86, %89
  %91 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %92 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %90, %93
  %95 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %96 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = add nuw nsw i32 %46, 1
  %100 = icmp eq i32 %99, %13
  br i1 %100, label %40, label %45, !llvm.loop !10
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
