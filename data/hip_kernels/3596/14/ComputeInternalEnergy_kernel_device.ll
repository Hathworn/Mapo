; ModuleID = '../data/hip_kernels/3596/14/main.cu'
source_filename = "../data/hip_kernels/3596/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28ComputeInternalEnergy_kernelPfS_S_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %8, 6
  %11 = add i32 %10, %7
  %12 = mul i32 %9, 40960
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %5
  br i1 %14, label %15, label %36

15:                                               ; preds = %6
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = fpext float %18 to double
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = fmul contract float %21, %21
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = fmul contract float %24, %24
  %26 = fadd contract float %22, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = fmul contract float %28, %28
  %30 = fadd contract float %26, %29
  %31 = fpext float %30 to double
  %32 = fmul contract double %31, 5.000000e-01
  %33 = fsub contract double %19, %32
  %34 = fptrunc double %33 to float
  %35 = getelementptr inbounds float, float addrspace(1)* %4, i64 %16
  store float %34, float addrspace(1)* %35, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %6, %15
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
