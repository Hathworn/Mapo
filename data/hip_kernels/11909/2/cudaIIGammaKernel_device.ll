; ModuleID = '../data/hip_kernels/11909/2/main.cu'
source_filename = "../data/hip_kernels/11909/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL17cudaIIGammaKernelPdS_S_S_S_S_ = comdat any

@_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2al = internal addrspace(3) global [64 x double] undef, align 16
@_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2ar = internal addrspace(3) global [64 x double] undef, align 16
@_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E1v = internal addrspace(3) global [64 x double] undef, align 16
@_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E5x1px2 = internal addrspace(3) global [16 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL17cudaIIGammaKernelPdS_S_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 comdat {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %8 = shl nuw nsw i32 %7, 4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = shl nuw nsw i32 %9, 2
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add nuw nsw i32 %10, %11
  %13 = add nuw nsw i32 %12, %8
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 4
  %16 = shl nuw nsw i32 %7, 2
  %17 = add nuw nsw i32 %16, %11
  %18 = add i32 %17, %15
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !5, !amdgpu.noclobber !9
  %22 = zext i32 %13 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %4, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !5, !amdgpu.noclobber !9
  %25 = fmul contract double %21, %24
  %26 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2al, i32 0, i32 %13
  %27 = addrspacecast double addrspace(3)* %26 to double*
  store volatile double %25, double* %27, align 8, !tbaa !5
  %28 = getelementptr inbounds double, double addrspace(1)* %2, i64 %19
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !5, !amdgpu.noclobber !9
  %30 = getelementptr inbounds double, double addrspace(1)* %5, i64 %22
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !5, !amdgpu.noclobber !9
  %32 = fmul contract double %29, %31
  %33 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2ar, i32 0, i32 %13
  %34 = addrspacecast double addrspace(3)* %33 to double*
  store volatile double %32, double* %34, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %11, 2
  br i1 %35, label %36, label %48

36:                                               ; preds = %6
  %37 = add nuw nsw i32 %13, 2
  %38 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2al, i32 0, i32 %37
  %39 = addrspacecast double addrspace(3)* %38 to double*
  %40 = load volatile double, double* %39, align 8, !tbaa !5
  %41 = load volatile double, double* %27, align 8, !tbaa !5
  %42 = fadd contract double %40, %41
  store volatile double %42, double* %27, align 8, !tbaa !5
  %43 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2ar, i32 0, i32 %37
  %44 = addrspacecast double addrspace(3)* %43 to double*
  %45 = load volatile double, double* %44, align 8, !tbaa !5
  %46 = load volatile double, double* %34, align 8, !tbaa !5
  %47 = fadd contract double %45, %46
  store volatile double %47, double* %34, align 8, !tbaa !5
  br label %48

48:                                               ; preds = %36, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp eq i32 %11, 0
  br i1 %49, label %52, label %50

50:                                               ; preds = %48
  %51 = add nuw nsw i32 %16, %9
  br label %70

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %13, 1
  %54 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2al, i32 0, i32 %53
  %55 = addrspacecast double addrspace(3)* %54 to double*
  %56 = load volatile double, double* %55, align 8, !tbaa !5
  %57 = load volatile double, double* %27, align 8, !tbaa !5
  %58 = fadd contract double %56, %57
  store volatile double %58, double* %27, align 8, !tbaa !5
  %59 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E2ar, i32 0, i32 %53
  %60 = addrspacecast double addrspace(3)* %59 to double*
  %61 = load volatile double, double* %60, align 8, !tbaa !5
  %62 = load volatile double, double* %34, align 8, !tbaa !5
  %63 = fadd contract double %61, %62
  store volatile double %63, double* %34, align 8, !tbaa !5
  %64 = load volatile double, double* %27, align 8, !tbaa !5
  %65 = load volatile double, double* %34, align 8, !tbaa !5
  %66 = fmul contract double %64, %65
  %67 = add nuw nsw i32 %16, %9
  %68 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E5x1px2, i32 0, i32 %67
  %69 = addrspacecast double addrspace(3)* %68 to double*
  store volatile double %66, double* %69, align 8, !tbaa !5
  br label %70

70:                                               ; preds = %50, %52
  %71 = phi i32 [ %51, %50 ], [ %67, %52 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E5x1px2, i32 0, i32 %71
  %73 = addrspacecast double addrspace(3)* %72 to double*
  %74 = load volatile double, double* %73, align 8, !tbaa !5
  %75 = zext i32 %12 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !5, !amdgpu.noclobber !9
  %78 = fmul contract double %74, %77
  %79 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E1v, i32 0, i32 %13
  %80 = addrspacecast double addrspace(3)* %79 to double*
  store volatile double %78, double* %80, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ult i32 %9, 2
  br i1 %81, label %82, label %89

82:                                               ; preds = %70
  %83 = add nuw nsw i32 %13, 8
  %84 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E1v, i32 0, i32 %83
  %85 = addrspacecast double addrspace(3)* %84 to double*
  %86 = load volatile double, double* %85, align 8, !tbaa !5
  %87 = load volatile double, double* %80, align 8, !tbaa !5
  %88 = fadd contract double %86, %87
  store volatile double %88, double* %80, align 8, !tbaa !5
  br label %89

89:                                               ; preds = %82, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = icmp eq i32 %9, 0
  br i1 %90, label %91, label %100

91:                                               ; preds = %89
  %92 = add nuw nsw i32 %13, 4
  %93 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaIIGammaKernelPdS_S_S_S_S_E1v, i32 0, i32 %92
  %94 = addrspacecast double addrspace(3)* %93 to double*
  %95 = load volatile double, double* %94, align 8, !tbaa !5
  %96 = load volatile double, double* %80, align 8, !tbaa !5
  %97 = fadd contract double %95, %96
  store volatile double %97, double* %80, align 8, !tbaa !5
  %98 = load volatile double, double* %80, align 8, !tbaa !5
  %99 = getelementptr inbounds double, double addrspace(1)* %3, i64 %19
  store double %98, double addrspace(1)* %99, align 8, !tbaa !5
  br label %100

100:                                              ; preds = %91, %89
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
