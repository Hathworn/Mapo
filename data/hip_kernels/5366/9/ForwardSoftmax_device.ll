; ModuleID = '../data/hip_kernels/5366/9/main.cu'
source_filename = "../data/hip_kernels/5366/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14ForwardSoftmaxPfiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %2, i64 %7
  %9 = mul nsw i32 %5, %1
  %10 = add nsw i32 %9, %6
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = fmul float %13, 0x3FF7154760000000
  %15 = tail call float @llvm.rint.f32(float %14)
  %16 = fcmp ogt float %13, 0x40562E4300000000
  %17 = fcmp olt float %13, 0xC059D1DA00000000
  %18 = fneg float %14
  %19 = tail call float @llvm.fma.f32(float %13, float 0x3FF7154760000000, float %18)
  %20 = tail call float @llvm.fma.f32(float %13, float 0x3E54AE0BE0000000, float %19)
  %21 = fsub float %14, %15
  %22 = fadd float %20, %21
  %23 = tail call float @llvm.exp2.f32(float %22)
  %24 = fptosi float %15 to i32
  %25 = tail call float @llvm.amdgcn.ldexp.f32(float %23, i32 %24)
  %26 = select i1 %17, float 0.000000e+00, float %25
  %27 = select i1 %16, float 0x7FF0000000000000, float %26
  %28 = atomicrmw fadd float addrspace(1)* %8, float %27 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = load float, float addrspace(1)* %12, align 4, !tbaa !5
  %30 = fmul float %29, 0x3FF7154760000000
  %31 = tail call float @llvm.rint.f32(float %30)
  %32 = fcmp ogt float %29, 0x40562E4300000000
  %33 = fcmp olt float %29, 0xC059D1DA00000000
  %34 = fneg float %30
  %35 = tail call float @llvm.fma.f32(float %29, float 0x3FF7154760000000, float %34)
  %36 = tail call float @llvm.fma.f32(float %29, float 0x3E54AE0BE0000000, float %35)
  %37 = fsub float %30, %31
  %38 = fadd float %36, %37
  %39 = tail call float @llvm.exp2.f32(float %38)
  %40 = fptosi float %31 to i32
  %41 = tail call float @llvm.amdgcn.ldexp.f32(float %39, i32 %40)
  %42 = select i1 %33, float 0.000000e+00, float %41
  %43 = select i1 %32, float 0x7FF0000000000000, float %42
  %44 = load float, float addrspace(1)* %8, align 4, !tbaa !5
  %45 = fdiv contract float %43, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %11
  store float %45, float addrspace(1)* %46, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
