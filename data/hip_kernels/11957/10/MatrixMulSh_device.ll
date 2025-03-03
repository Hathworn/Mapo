; ModuleID = '../data/hip_kernels/11957/10/main.cu'
source_filename = "../data/hip_kernels/11957/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11MatrixMulShPfS_S_iE3Mds = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16
@_ZZ11MatrixMulShPfS_S_iE3Nds = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11MatrixMulShPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = sdiv i32 %3, 2
  %11 = icmp sgt i32 %3, 1
  br i1 %11, label %12, label %27

12:                                               ; preds = %4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %13, 1
  %15 = add i32 %14, %9
  %16 = mul i32 %15, %3
  %17 = add i32 %16, %7
  %18 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Mds, i32 0, i32 %9, i32 %7
  %19 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Nds, i32 0, i32 %9, i32 %7
  %20 = add i32 %16, %8
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %23 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Mds, i32 0, i32 %7, i32 0
  %24 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Nds, i32 0, i32 0, i32 %9
  %25 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Mds, i32 0, i32 %7, i32 1
  %26 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ11MatrixMulShPfS_S_iE3Nds, i32 0, i32 1, i32 %9
  br label %28

27:                                               ; preds = %28, %4
  ret void

28:                                               ; preds = %12, %28
  %29 = phi i32 [ 0, %12 ], [ %50, %28 ]
  %30 = shl nuw nsw i32 %29, 1
  %31 = add i32 %17, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  store float %34, float addrspace(3)* %18, align 4, !tbaa !5
  %35 = add nuw i32 %30, %9
  %36 = mul i32 %35, %3
  %37 = add i32 %36, %8
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  store float %40, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = load float, float addrspace(1)* %22, align 4, !tbaa !5
  %42 = load float, float addrspace(3)* %23, align 8, !tbaa !5
  %43 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %44 = fmul contract float %42, %43
  %45 = fadd contract float %41, %44
  %46 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %47 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %48 = fmul contract float %46, %47
  %49 = fadd contract float %45, %48
  store float %49, float addrspace(1)* %22, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = add nuw nsw i32 %29, 1
  %51 = icmp eq i32 %50, %10
  br i1 %51, label %27, label %28, !llvm.loop !9
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
