; ModuleID = '../data/hip_kernels/18210/11/main.cu'
source_filename = "../data/hip_kernels/18210/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16matmul_partitionPKfS0_PfiE2na = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16
@_ZZ16matmul_partitionPKfS0_PfiE2nb = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16matmul_partitionPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %7, 3
  %10 = add nsw i32 %9, %8
  %11 = shl nsw i32 %5, 3
  %12 = add nsw i32 %11, %6
  %13 = sdiv i32 %3, 8
  %14 = icmp sgt i32 %3, 7
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %36

16:                                               ; preds = %4
  %17 = add i32 %15, %6
  %18 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 %6
  %19 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 %8, i32 %6
  %20 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 0, i32 %6
  %22 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 1, i32 %6
  %24 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 2, i32 %6
  %26 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 3, i32 %6
  %28 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 4, i32 %6
  %30 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 5, i32 %6
  %32 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 6, i32 %6
  %34 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2na, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ16matmul_partitionPKfS0_PfiE2nb, i32 0, i32 7, i32 %6
  br label %41

36:                                               ; preds = %41, %4
  %37 = phi float [ 0.000000e+00, %4 ], [ %86, %41 ]
  %38 = add nsw i32 %15, %12
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  store float %37, float addrspace(1)* %40, align 4, !tbaa !5
  ret void

41:                                               ; preds = %16, %41
  %42 = phi i32 [ 0, %16 ], [ %87, %41 ]
  %43 = phi float [ 0.000000e+00, %16 ], [ %86, %41 ]
  %44 = shl nsw i32 %42, 3
  %45 = add i32 %17, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %48, float addrspace(3)* %18, align 4, !tbaa !5
  %49 = add nuw nsw i32 %44, %8
  %50 = mul nsw i32 %49, %3
  %51 = add nsw i32 %50, %12
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %54, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = load float, float addrspace(3)* %20, align 16, !tbaa !5
  %56 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %57 = fmul contract float %55, %56
  %58 = fadd contract float %43, %57
  %59 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %60 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %61 = fmul contract float %59, %60
  %62 = fadd contract float %58, %61
  %63 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %64 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %65 = fmul contract float %63, %64
  %66 = fadd contract float %62, %65
  %67 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %68 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %69 = fmul contract float %67, %68
  %70 = fadd contract float %66, %69
  %71 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %72 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %73 = fmul contract float %71, %72
  %74 = fadd contract float %70, %73
  %75 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %76 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %74, %77
  %79 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %80 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %78, %81
  %83 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %85 = fmul contract float %83, %84
  %86 = fadd contract float %82, %85
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = add nuw nsw i32 %42, 1
  %88 = icmp eq i32 %87, %13
  br i1 %88, label %36, label %41, !llvm.loop !10
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
