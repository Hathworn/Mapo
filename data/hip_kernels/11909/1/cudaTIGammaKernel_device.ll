; ModuleID = '../data/hip_kernels/11909/1/main.cu'
source_filename = "../data/hip_kernels/11909/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_ = comdat any

@_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E3ump = internal addrspace(3) global [64 x double] undef, align 16
@_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E5x1px2 = internal addrspace(3) global [16 x double] undef, align 16
@_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E1v = internal addrspace(3) global [64 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture readnone %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 comdat {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %10 = shl nuw nsw i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = shl nuw nsw i32 %11, 2
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add nuw nsw i32 %12, %13
  %15 = add nuw nsw i32 %14, %10
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = shl i32 %16, 4
  %18 = shl nuw nsw i32 %9, 2
  %19 = add nuw nsw i32 %18, %11
  %20 = zext i32 %16 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !5, !amdgpu.noclobber !8
  %23 = zext i8 %22 to i64
  %24 = shl nuw nsw i64 %23, 4
  %25 = getelementptr inbounds double, double addrspace(1)* %6, i64 %24
  %26 = add nuw nsw i32 %18, %13
  %27 = add i32 %26, %17
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !9, !amdgpu.noclobber !8
  %31 = zext i32 %15 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %5, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !9, !amdgpu.noclobber !8
  %34 = fmul contract double %30, %33
  %35 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E3ump, i32 0, i32 %15
  %36 = addrspacecast double addrspace(3)* %35 to double*
  store volatile double %34, double* %36, align 8, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i32 %13, 2
  br i1 %37, label %38, label %45

38:                                               ; preds = %8
  %39 = add nuw nsw i32 %15, 2
  %40 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E3ump, i32 0, i32 %39
  %41 = addrspacecast double addrspace(3)* %40 to double*
  %42 = load volatile double, double* %41, align 8, !tbaa !9
  %43 = load volatile double, double* %36, align 8, !tbaa !9
  %44 = fadd contract double %42, %43
  store volatile double %44, double* %36, align 8, !tbaa !9
  br label %45

45:                                               ; preds = %38, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp eq i32 %13, 0
  br i1 %46, label %47, label %66

47:                                               ; preds = %45
  %48 = add nuw nsw i32 %15, 1
  %49 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E3ump, i32 0, i32 %48
  %50 = addrspacecast double addrspace(3)* %49 to double*
  %51 = load volatile double, double* %50, align 8, !tbaa !9
  %52 = load volatile double, double* %36, align 8, !tbaa !9
  %53 = fadd contract double %51, %52
  store volatile double %53, double* %36, align 8, !tbaa !9
  %54 = load volatile double, double* %36, align 8, !tbaa !9
  %55 = shl i32 %16, 2
  %56 = add i32 %55, %11
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %7, i64 %57
  store double %54, double addrspace(1)* %58, align 8, !tbaa !9
  %59 = zext i32 %19 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %25, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !9
  %62 = load volatile double, double* %36, align 8, !tbaa !9
  %63 = fmul contract double %61, %62
  %64 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E5x1px2, i32 0, i32 %19
  %65 = addrspacecast double addrspace(3)* %64 to double*
  store volatile double %63, double* %65, align 8, !tbaa !9
  br label %66

66:                                               ; preds = %45, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E5x1px2, i32 0, i32 %19
  %68 = addrspacecast double addrspace(3)* %67 to double*
  %69 = load volatile double, double* %68, align 8, !tbaa !9
  %70 = zext i32 %14 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !9
  %73 = fmul contract double %69, %72
  %74 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E1v, i32 0, i32 %15
  %75 = addrspacecast double addrspace(3)* %74 to double*
  store volatile double %73, double* %75, align 8, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = icmp ult i32 %11, 2
  br i1 %76, label %77, label %84

77:                                               ; preds = %66
  %78 = add nuw nsw i32 %15, 8
  %79 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E1v, i32 0, i32 %78
  %80 = addrspacecast double addrspace(3)* %79 to double*
  %81 = load volatile double, double* %80, align 8, !tbaa !9
  %82 = load volatile double, double* %75, align 8, !tbaa !9
  %83 = fadd contract double %81, %82
  store volatile double %83, double* %75, align 8, !tbaa !9
  br label %84

84:                                               ; preds = %77, %66
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = icmp eq i32 %11, 0
  br i1 %85, label %86, label %95

86:                                               ; preds = %84
  %87 = add nuw nsw i32 %15, 4
  %88 = getelementptr inbounds [64 x double], [64 x double] addrspace(3)* @_ZZL17cudaTIGammaKernelPdS_S_PhS0_S_S_S_E1v, i32 0, i32 %87
  %89 = addrspacecast double addrspace(3)* %88 to double*
  %90 = load volatile double, double* %89, align 8, !tbaa !9
  %91 = load volatile double, double* %75, align 8, !tbaa !9
  %92 = fadd contract double %90, %91
  store volatile double %92, double* %75, align 8, !tbaa !9
  %93 = load volatile double, double* %75, align 8, !tbaa !9
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  store double %93, double addrspace(1)* %94, align 8, !tbaa !9
  br label %95

95:                                               ; preds = %86, %84
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
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
