; ModuleID = '../data/hip_kernels/3596/2/main.cu'
source_filename = "../data/hip_kernels/3596/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28ComputeInternalEnergy_kernelPfS_S_S_S_S_S_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = shl i32 %12, 6
  %15 = add i32 %14, %11
  %16 = mul i32 %13, 40960
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %9
  br i1 %18, label %19, label %58

19:                                               ; preds = %10
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %4, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = fpext float %22 to double
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = fmul contract float %25, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = fmul contract float %28, %28
  %30 = fadd contract float %26, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fmul contract float %32, %32
  %34 = fadd contract float %30, %33
  %35 = fpext float %34 to double
  %36 = fmul contract double %35, 5.000000e-01
  %37 = fsub contract double %23, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %6, i64 %20
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fmul contract float %39, %39
  %41 = getelementptr inbounds float, float addrspace(1)* %7, i64 %20
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fmul contract float %42, %42
  %44 = fadd contract float %40, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %8, i64 %20
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = fmul contract float %46, %46
  %48 = fadd contract float %44, %47
  %49 = fpext float %48 to double
  %50 = fmul contract double %49, 5.000000e-01
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fpext float %52 to double
  %54 = fdiv contract double %50, %53
  %55 = fsub contract double %37, %54
  %56 = fptrunc double %55 to float
  %57 = getelementptr inbounds float, float addrspace(1)* %5, i64 %20
  store float %56, float addrspace(1)* %57, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %10, %19
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
