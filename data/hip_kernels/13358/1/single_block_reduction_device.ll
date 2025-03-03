; ModuleID = '../data/hip_kernels/13358/1/main.cu'
source_filename = "../data/hip_kernels/13358/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22single_block_reductionPfS_mE13sharedSumData = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16
@_ZZ22single_block_reductionPfS_mE16sharedSquareData = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22single_block_reductionPfS_m(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = icmp ult i64 %5, %2
  br i1 %6, label %7, label %14

7:                                                ; preds = %3
  %8 = getelementptr inbounds float, float addrspace(1)* %0, i64 %5
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE13sharedSumData, i32 0, i32 %4
  store float %9, float addrspace(3)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %5
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE16sharedSquareData, i32 0, i32 %4
  store float %12, float addrspace(3)* %13, align 4, !tbaa !5
  br label %14

14:                                               ; preds = %7, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = lshr i64 %2, 1
  %16 = trunc i64 %15 to i32
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  %19 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE13sharedSumData, i32 0, i32 %4
  %20 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE16sharedSquareData, i32 0, i32 %4
  br label %23

21:                                               ; preds = %36, %14
  %22 = icmp eq i32 %4, 0
  br i1 %22, label %39, label %42

23:                                               ; preds = %18, %36
  %24 = phi i32 [ %16, %18 ], [ %37, %36 ]
  %25 = icmp slt i32 %4, %24
  br i1 %25, label %26, label %36

26:                                               ; preds = %23
  %27 = add nsw i32 %24, %4
  %28 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE13sharedSumData, i32 0, i32 %27
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %30 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %31 = fadd contract float %29, %30
  store float %31, float addrspace(3)* %19, align 4, !tbaa !5
  %32 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE16sharedSquareData, i32 0, i32 %27
  %33 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %34 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %35 = fadd contract float %33, %34
  store float %35, float addrspace(3)* %20, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %26, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = lshr i32 %24, 1
  %38 = icmp ult i32 %24, 2
  br i1 %38, label %21, label %23, !llvm.loop !10

39:                                               ; preds = %21
  %40 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE13sharedSumData, i32 0, i32 0), align 16, !tbaa !5
  store float %40, float addrspace(1)* %0, align 4, !tbaa !5
  %41 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ22single_block_reductionPfS_mE16sharedSquareData, i32 0, i32 0), align 16, !tbaa !5
  store float %41, float addrspace(1)* %1, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %39, %21
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
