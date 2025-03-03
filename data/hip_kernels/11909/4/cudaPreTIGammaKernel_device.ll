; ModuleID = '../data/hip_kernels/11909/4/main.cu'
source_filename = "../data/hip_kernels/11909/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20cudaPreTIGammaKernelPdS_S_ = comdat any

@_ZZL20cudaPreTIGammaKernelPdS_S_E4sump = internal addrspace(3) global [64 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL20cudaPreTIGammaKernelPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %5 = shl nuw nsw i32 %4, 2
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add nuw nsw i32 %5, %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 2
  %10 = add i32 %9, %6
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 %11
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = zext i32 %7 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %1, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = fmul contract double %13, %16
  %18 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTIGammaKernelPdS_S_E4sump, i32 0, i32 %7
  %19 = addrspacecast double addrspace(3)* %18 to double*
  store volatile double %17, double* %19, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp ult i32 %6, 2
  br i1 %20, label %21, label %28

21:                                               ; preds = %3
  %22 = add nuw nsw i32 %7, 2
  %23 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTIGammaKernelPdS_S_E4sump, i32 0, i32 %22
  %24 = addrspacecast double addrspace(3)* %23 to double*
  %25 = load volatile double, double* %24, align 8, !tbaa !5
  %26 = load volatile double, double* %19, align 8, !tbaa !5
  %27 = fadd contract double %25, %26
  store volatile double %27, double* %19, align 8, !tbaa !5
  br label %28

28:                                               ; preds = %21, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp eq i32 %6, 0
  br i1 %29, label %30, label %42

30:                                               ; preds = %28
  %31 = add nuw nsw i32 %7, 1
  %32 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTIGammaKernelPdS_S_E4sump, i32 0, i32 %31
  %33 = addrspacecast double addrspace(3)* %32 to double*
  %34 = load volatile double, double* %33, align 8, !tbaa !5
  %35 = load volatile double, double* %19, align 8, !tbaa !5
  %36 = fadd contract double %34, %35
  store volatile double %36, double* %19, align 8, !tbaa !5
  %37 = load volatile double, double* %19, align 8, !tbaa !5
  %38 = shl i32 %8, 4
  %39 = add i32 %38, %4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  store double %37, double addrspace(1)* %41, align 8, !tbaa !5
  br label %42

42:                                               ; preds = %30, %28
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
