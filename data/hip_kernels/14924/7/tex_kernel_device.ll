; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/14924/7/tex_kernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/14924/7/tex_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10tex_kernelP13__hip_textureiPf(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %1
  br i1 %13, label %14, label %44

14:                                               ; preds = %3
  %15 = uitofp i32 %12 to float
  %16 = sitofp i32 %1 to float
  %17 = fdiv contract float %15, %16
  %18 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %19 = addrspacecast i32 addrspace(1)* %18 to i32 addrspace(4)*
  %20 = getelementptr inbounds i32, i32 addrspace(4)* %19, i64 12
  %21 = getelementptr inbounds i32, i32 addrspace(4)* %19, i64 10
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = uitofp i32 %22 to float
  %24 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = and i32 %24, 32768
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, float %23, float 1.000000e+00
  %28 = bitcast i32 addrspace(4)* %20 to <4 x i32> addrspace(4)*
  %29 = load <4 x i32>, <4 x i32> addrspace(4)* %28, align 16, !tbaa !11, !amdgpu.noclobber !5
  %30 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %31 = addrspacecast <8 x i32> addrspace(1)* %30 to <8 x i32> addrspace(4)*
  %32 = load <8 x i32>, <8 x i32> addrspace(4)* %31, align 32, !tbaa !11, !amdgpu.noclobber !5
  %33 = extractelement <4 x i32> %29, i64 2
  %34 = and i32 %33, 1048576
  %35 = icmp eq i32 %34, 0
  %36 = tail call float @llvm.amdgcn.rcp.f32(float %27)
  %37 = fmul float %17, %27
  %38 = tail call float @llvm.floor.f32(float %37)
  %39 = fmul float %36, %38
  %40 = select i1 %35, float %39, float %17
  %41 = tail call float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 1, float %40, <8 x i32> %32, <4 x i32> %29, i1 false, i32 0, i32 0)
  %42 = zext i32 %12 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  store float %41, float addrspace(1)* %43, align 4, !tbaa !12
  br label %44

44:                                               ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 immarg, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
