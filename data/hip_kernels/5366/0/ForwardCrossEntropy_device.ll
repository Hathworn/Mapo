; ModuleID = '../data/hip_kernels/5366/0/main.cu'
source_filename = "../data/hip_kernels/5366/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19ForwardCrossEntropyPfS_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !4, !amdgpu.noclobber !8
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !4, !amdgpu.noclobber !8
  %11 = tail call i1 @llvm.amdgcn.class.f32(float %10, i32 144)
  %12 = select i1 %11, float 0x41F0000000000000, float 1.000000e+00
  %13 = fmul float %10, %12
  %14 = tail call float @llvm.log2.f32(float %13)
  %15 = fmul float %14, 0x3FE62E42E0000000
  %16 = tail call i1 @llvm.amdgcn.class.f32(float %14, i32 519)
  %17 = fneg float %15
  %18 = tail call float @llvm.fma.f32(float %14, float 0x3FE62E42E0000000, float %17)
  %19 = tail call float @llvm.fma.f32(float %14, float 0x3E6EFA39E0000000, float %18)
  %20 = fadd float %15, %19
  %21 = select i1 %16, float %14, float %20
  %22 = select i1 %11, float 0x40362E4300000000, float 0.000000e+00
  %23 = fsub float %21, %22
  %24 = fmul contract float %8, %23
  %25 = fsub contract float 1.000000e+00, %10
  %26 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 144)
  %27 = select i1 %26, float 0x41F0000000000000, float 1.000000e+00
  %28 = fmul float %25, %27
  %29 = tail call float @llvm.log2.f32(float %28)
  %30 = fmul float %29, 0x3FE62E42E0000000
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 519)
  %32 = fneg float %30
  %33 = tail call float @llvm.fma.f32(float %29, float 0x3FE62E42E0000000, float %32)
  %34 = tail call float @llvm.fma.f32(float %29, float 0x3E6EFA39E0000000, float %33)
  %35 = fadd float %30, %34
  %36 = select i1 %31, float %29, float %35
  %37 = select i1 %26, float 0x40362E4300000000, float 0.000000e+00
  %38 = fsub float %36, %37
  %39 = fsub contract float 1.000000e+00, %8
  %40 = fmul contract float %39, %38
  %41 = fadd contract float %24, %40
  %42 = fneg contract float %41
  %43 = atomicrmw fadd float addrspace(1)* %3, float %42 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
