; ModuleID = '../data/hip_kernels/5366/3/main.cu'
source_filename = "../data/hip_kernels/5366/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15BackwardSigmoidPfS_iiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul nsw i32 %3, %2
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %44

17:                                               ; preds = %5
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = fneg contract float %20
  %22 = fmul float %20, 0xBFF7154760000000
  %23 = tail call float @llvm.rint.f32(float %22)
  %24 = fcmp olt float %20, 0xC0562E4300000000
  %25 = fcmp ogt float %20, 0x4059D1DA00000000
  %26 = fneg float %22
  %27 = tail call float @llvm.fma.f32(float %21, float 0x3FF7154760000000, float %26)
  %28 = tail call float @llvm.fma.f32(float %21, float 0x3E54AE0BE0000000, float %27)
  %29 = fsub float %22, %23
  %30 = fadd float %28, %29
  %31 = tail call float @llvm.exp2.f32(float %30)
  %32 = fptosi float %23 to i32
  %33 = tail call float @llvm.amdgcn.ldexp.f32(float %31, i32 %32)
  %34 = fadd contract float %33, 1.000000e+00
  %35 = fdiv contract float 1.000000e+00, %34
  %36 = select i1 %25, float 1.000000e+00, float %35
  %37 = select i1 %24, float 0.000000e+00, float %36
  %38 = fsub contract float 1.000000e+00, %37
  %39 = fmul contract float %37, %38
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %41, %39
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %18
  store float %42, float addrspace(1)* %43, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %17, %5
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
