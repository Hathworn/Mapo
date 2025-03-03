; ModuleID = '../data/hip_kernels/11066/0/main.cu'
source_filename = "../data/hip_kernels/11066/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20convertDbmToMwKernalPfPKf(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !5
  %15 = fdiv contract float %14, 1.000000e+01
  %16 = fmul float %15, 0x40026BB1C0000000
  %17 = fneg float %16
  %18 = tail call float @llvm.fma.f32(float %15, float 0x40026BB1C0000000, float %17)
  %19 = tail call float @llvm.fma.f32(float %15, float 0xBE6129FAE0000000, float %18)
  %20 = fadd float %16, %19
  %21 = fsub float %20, %16
  %22 = fsub float %19, %21
  %23 = tail call float @llvm.fabs.f32(float %16) #3
  %24 = fcmp oeq float %23, 0x7FF0000000000000
  %25 = select i1 %24, float %16, float %20
  %26 = tail call float @llvm.fabs.f32(float %25) #3
  %27 = fcmp oeq float %26, 0x7FF0000000000000
  %28 = select i1 %27, float 0.000000e+00, float %22
  %29 = fcmp oeq float %25, 0x40562E4300000000
  %30 = select i1 %29, float 0x3EE0000000000000, float 0.000000e+00
  %31 = fsub float %25, %30
  %32 = fadd float %30, %28
  %33 = fmul float %31, 0x3FF7154760000000
  %34 = tail call float @llvm.rint.f32(float %33)
  %35 = fcmp ogt float %31, 0x40562E4300000000
  %36 = fcmp olt float %31, 0xC059D1DA00000000
  %37 = fneg float %33
  %38 = tail call float @llvm.fma.f32(float %31, float 0x3FF7154760000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %31, float 0x3E54AE0BE0000000, float %38)
  %40 = fsub float %33, %34
  %41 = fadd float %39, %40
  %42 = tail call float @llvm.exp2.f32(float %41)
  %43 = fptosi float %34 to i32
  %44 = tail call float @llvm.amdgcn.ldexp.f32(float %42, i32 %43)
  %45 = select i1 %36, float 0.000000e+00, float %44
  %46 = select i1 %35, float 0x7FF0000000000000, float %45
  %47 = tail call float @llvm.fma.f32(float %46, float %32, float %46)
  %48 = tail call float @llvm.fabs.f32(float %46) #3
  %49 = fcmp oeq float %48, 0x7FF0000000000000
  %50 = select i1 %49, float %46, float %47
  %51 = tail call float @llvm.fabs.f32(float %15)
  %52 = tail call float @llvm.fabs.f32(float %50)
  %53 = fcmp oeq float %51, 0x7FF0000000000000
  %54 = bitcast float %15 to i32
  %55 = icmp sgt i32 %54, -1
  %56 = select i1 %55, float 0x7FF0000000000000, float 0.000000e+00
  %57 = select i1 %53, float %56, float %52
  %58 = fcmp uno float %15, 0.000000e+00
  %59 = select i1 %58, float 0x7FF8000000000000, float %57
  %60 = fcmp oeq float %15, 0.000000e+00
  %61 = select i1 %60, float 1.000000e+00, float %59
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  store float %61, float addrspace(1)* %62, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
