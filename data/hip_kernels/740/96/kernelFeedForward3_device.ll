; ModuleID = '../data/hip_kernels/740/96/main.cu'
source_filename = "../data/hip_kernels/740/96/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18kernelFeedForward3PfS_iS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %5, %2
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %1, i64 %7
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !10, !invariant.load !9
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %5
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = fadd contract float %9, %20
  store float %21, float addrspace(1)* %19, align 4, !tbaa !5
  %22 = fneg contract float %21
  %23 = fmul float %21, 0xBFF7154760000000
  %24 = tail call float @llvm.rint.f32(float %23)
  %25 = fcmp olt float %21, 0xC0562E4300000000
  %26 = fcmp ogt float %21, 0x4059D1DA00000000
  %27 = fneg float %23
  %28 = tail call float @llvm.fma.f32(float %22, float 0x3FF7154760000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %22, float 0x3E54AE0BE0000000, float %28)
  %30 = fsub float %23, %24
  %31 = fadd float %29, %30
  %32 = tail call float @llvm.exp2.f32(float %31)
  %33 = fptosi float %24 to i32
  %34 = tail call float @llvm.amdgcn.ldexp.f32(float %32, i32 %33)
  %35 = select i1 %26, float 0.000000e+00, float %34
  %36 = select i1 %25, float 0x7FF0000000000000, float %35
  %37 = fpext float %36 to double
  %38 = fadd contract double %37, 1.000000e+00
  %39 = fdiv contract double 1.000000e+00, %38
  %40 = fptrunc double %39 to float
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %18
  store float %40, float addrspace(1)* %41, align 4, !tbaa !5
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!10 = !{i16 1, i16 1025}
