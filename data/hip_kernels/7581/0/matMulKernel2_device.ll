; ModuleID = '../data/hip_kernels/7581/0/main.cu'
source_filename = "../data/hip_kernels/7581/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13matMulKernel2PfS_S_iE3Mds = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16
@_ZZ13matMulKernel2PfS_S_iE3Nds = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13matMulKernel2PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %6, 1
  %10 = add nsw i32 %9, %8
  %11 = shl nsw i32 %5, 1
  %12 = add nsw i32 %11, %7
  %13 = sdiv i32 %3, 2
  %14 = icmp sgt i32 %3, 1
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %24

16:                                               ; preds = %4
  %17 = add i32 %15, %7
  %18 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Mds, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Nds, i32 0, i32 %8, i32 %7
  %20 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Mds, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Nds, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Mds, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ13matMulKernel2PfS_S_iE3Nds, i32 0, i32 1, i32 %7
  br label %29

24:                                               ; preds = %29, %4
  %25 = phi float [ 0.000000e+00, %4 ], [ %50, %29 ]
  %26 = add nsw i32 %15, %12
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  store float %25, float addrspace(1)* %28, align 4, !tbaa !5
  ret void

29:                                               ; preds = %16, %29
  %30 = phi i32 [ 0, %16 ], [ %51, %29 ]
  %31 = phi float [ 0.000000e+00, %16 ], [ %50, %29 ]
  %32 = shl nuw nsw i32 %30, 1
  %33 = add i32 %17, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %36, float addrspace(3)* %18, align 4, !tbaa !5
  %37 = add nuw nsw i32 %32, %8
  %38 = mul nsw i32 %37, %3
  %39 = add nsw i32 %38, %12
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %42, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = load float, float addrspace(3)* %20, align 8, !tbaa !5
  %44 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %45 = fmul contract float %43, %44
  %46 = fadd contract float %31, %45
  %47 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %49 = fmul contract float %47, %48
  %50 = fadd contract float %46, %49
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = add nuw nsw i32 %30, 1
  %52 = icmp eq i32 %51, %13
  br i1 %52, label %24, label %29, !llvm.loop !10
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
