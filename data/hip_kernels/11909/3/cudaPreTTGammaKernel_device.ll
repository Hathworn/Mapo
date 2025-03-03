; ModuleID = '../data/hip_kernels/11909/3/main.cu'
source_filename = "../data/hip_kernels/11909/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL20cudaPreTTGammaKernelPdS_S_S_S_ = comdat any

@_ZZL20cudaPreTTGammaKernelPdS_S_S_S_E3ump = internal addrspace(3) global [64 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL20cudaPreTTGammaKernelPdS_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 comdat {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = shl nuw nsw i32 %6, 2
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add nuw nsw i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = icmp eq i32 %10, 0
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 2
  %14 = add i32 %13, %8
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !5
  %18 = zext i32 %9 to i64
  %19 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTTGammaKernelPdS_S_S_S_E3ump, i32 0, i32 %9
  %20 = addrspacecast double addrspace(3)* %19 to double*
  br i1 %11, label %21, label %35

21:                                               ; preds = %5
  %22 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !5, !amdgpu.noclobber !9
  %24 = fmul contract double %17, %23
  store volatile double %24, double* %20, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp ult i32 %8, 2
  br i1 %25, label %26, label %33

26:                                               ; preds = %21
  %27 = add nuw nsw i32 %9, 2
  %28 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTTGammaKernelPdS_S_S_S_E3ump, i32 0, i32 %27
  %29 = addrspacecast double addrspace(3)* %28 to double*
  %30 = load volatile double, double* %29, align 8, !tbaa !5
  %31 = load volatile double, double* %20, align 8, !tbaa !5
  %32 = fadd contract double %30, %31
  store volatile double %32, double* %20, align 8, !tbaa !5
  br label %33

33:                                               ; preds = %26, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp eq i32 %8, 0
  br i1 %34, label %49, label %62

35:                                               ; preds = %5
  %36 = getelementptr inbounds double, double addrspace(1)* %2, i64 %18
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !5, !amdgpu.noclobber !9
  %38 = fmul contract double %17, %37
  store volatile double %38, double* %20, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %8, 2
  br i1 %39, label %40, label %47

40:                                               ; preds = %35
  %41 = add nuw nsw i32 %9, 2
  %42 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTTGammaKernelPdS_S_S_S_E3ump, i32 0, i32 %41
  %43 = addrspacecast double addrspace(3)* %42 to double*
  %44 = load volatile double, double* %43, align 8, !tbaa !5
  %45 = load volatile double, double* %20, align 8, !tbaa !5
  %46 = fadd contract double %44, %45
  store volatile double %46, double* %20, align 8, !tbaa !5
  br label %47

47:                                               ; preds = %40, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp eq i32 %8, 0
  br i1 %48, label %49, label %62

49:                                               ; preds = %47, %33
  %50 = phi double addrspace(1)* [ %3, %33 ], [ %4, %47 ]
  %51 = add nuw nsw i32 %9, 1
  %52 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL20cudaPreTTGammaKernelPdS_S_S_S_E3ump, i32 0, i32 %51
  %53 = addrspacecast double addrspace(3)* %52 to double*
  %54 = load volatile double, double* %53, align 8, !tbaa !5
  %55 = load volatile double, double* %20, align 8, !tbaa !5
  %56 = fadd contract double %54, %55
  store volatile double %56, double* %20, align 8, !tbaa !5
  %57 = load volatile double, double* %20, align 8, !tbaa !5
  %58 = shl i32 %12, 4
  %59 = add i32 %58, %6
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %50, i64 %60
  store double %57, double addrspace(1)* %61, align 8, !tbaa !5
  br label %62

62:                                               ; preds = %49, %47, %33
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
