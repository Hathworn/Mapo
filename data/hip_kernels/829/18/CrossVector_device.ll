; ModuleID = '../data/hip_kernels/829/18/main.cu'
source_filename = "../data/hip_kernels/829/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11CrossVectorPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = fcmp olt float %14, 0x39F0000000000000
  %16 = select i1 %15, float 0x41F0000000000000, float 1.000000e+00
  %17 = fmul float %14, %16
  %18 = tail call float @llvm.sqrt.f32(float %17)
  %19 = bitcast float %18 to i32
  %20 = add nsw i32 %19, -1
  %21 = bitcast i32 %20 to float
  %22 = add nsw i32 %19, 1
  %23 = bitcast i32 %22 to float
  %24 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 608)
  %25 = select i1 %15, float 0x3EF0000000000000, float 1.000000e+00
  %26 = fneg float %23
  %27 = tail call float @llvm.fma.f32(float %26, float %18, float %17)
  %28 = fcmp ogt float %27, 0.000000e+00
  %29 = fneg float %21
  %30 = tail call float @llvm.fma.f32(float %29, float %18, float %17)
  %31 = fcmp ole float %30, 0.000000e+00
  %32 = select i1 %31, float %21, float %18
  %33 = select i1 %28, float %23, float %32
  %34 = fmul float %25, %33
  %35 = select i1 %24, float %17, float %34
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = fmul contract float %37, %35
  store float %38, float addrspace(1)* %36, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
