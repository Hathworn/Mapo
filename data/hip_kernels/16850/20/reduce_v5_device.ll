; ModuleID = '../data/hip_kernels/16850/20/main.cu'
source_filename = "../data/hip_kernels/16850/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reduce_v5PfS_iE1S = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z9reduce_v5PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl nsw i32 %5, 6
  %7 = add nsw i32 %6, %4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = add nsw i32 %7, 32
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = fadd contract float %10, %14
  %16 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %4
  store float %15, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ult i32 %4, 32
  br i1 %17, label %18, label %49

18:                                               ; preds = %3
  %19 = add nuw nsw i32 %4, 32
  %20 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %19
  %21 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %22 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %23 = fadd contract float %21, %22
  store float %23, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = add nuw nsw i32 %4, 16
  %25 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %24
  %26 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %27 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %28 = fadd contract float %26, %27
  store float %28, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = add nuw nsw i32 %4, 8
  %30 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %29
  %31 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %32 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %33 = fadd contract float %31, %32
  store float %33, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = add nuw nsw i32 %4, 4
  %35 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %37 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %38 = fadd contract float %36, %37
  store float %38, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = add nuw nsw i32 %4, 2
  %40 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %39
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %42 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %43 = fadd contract float %41, %42
  store float %43, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add nuw nsw i32 %4, 1
  %45 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %47 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %48 = fadd contract float %46, %47
  store float %48, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %49

49:                                               ; preds = %18, %3
  %50 = icmp eq i32 %4, 0
  br i1 %50, label %51, label %55

51:                                               ; preds = %49
  %52 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9reduce_v5PfS_iE1S, i32 0, i32 0), align 16, !tbaa !5
  %53 = sext i32 %5 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  store float %52, float addrspace(1)* %54, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %51, %49
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
