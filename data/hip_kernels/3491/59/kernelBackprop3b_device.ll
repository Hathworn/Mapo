; ModuleID = '../data/hip_kernels/3491/59/main.cu'
source_filename = "../data/hip_kernels/3491/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16kernelBackprop3bPfiS_(float addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds float, float addrspace(1)* %2, i64 %5
  %7 = load float, float addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = fneg contract float %7
  %9 = fmul float %7, 0xBFF7154760000000
  %10 = tail call float @llvm.rint.f32(float %9)
  %11 = fcmp olt float %7, 0xC0562E4300000000
  %12 = fcmp ogt float %7, 0x4059D1DA00000000
  %13 = fneg float %9
  %14 = tail call float @llvm.fma.f32(float %8, float 0x3FF7154760000000, float %13)
  %15 = tail call float @llvm.fma.f32(float %8, float 0x3E54AE0BE0000000, float %14)
  %16 = fsub float %9, %10
  %17 = fadd float %15, %16
  %18 = tail call float @llvm.exp2.f32(float %17)
  %19 = fptosi float %10 to i32
  %20 = tail call float @llvm.amdgcn.ldexp.f32(float %18, i32 %19)
  %21 = select i1 %12, float 0.000000e+00, float %20
  %22 = select i1 %11, float 0x7FF0000000000000, float %21
  %23 = fpext float %22 to double
  %24 = fadd contract double %23, 1.000000e+00
  %25 = fdiv contract double 1.000000e+00, %24
  %26 = fsub contract double 1.000000e+00, %25
  %27 = fmul contract double %25, %26
  %28 = add i32 %4, %1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fpext float %31 to double
  %33 = fmul contract double %27, %32
  %34 = fptrunc double %33 to float
  store float %34, float addrspace(1)* %30, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
