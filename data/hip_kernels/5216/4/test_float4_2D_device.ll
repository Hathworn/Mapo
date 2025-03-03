; ModuleID = '../data/hip_kernels/5216/4/main.cu'
source_filename = "../data/hip_kernels/5216/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }
%struct.texture.1 = type { %struct.textureReference }
%struct.texture.2 = type { %struct.textureReference }
%struct.texture.3 = type { %struct.textureReference }
%struct.texture.4 = type { %struct.textureReference }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

@texture_float_1D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@texture_float_2D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@texture_float_3D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.1 undef, align 8
@texture_float4_1D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.2 undef, align 8
@texture_float4_2D = protected addrspace(1) externally_initialized global %struct.texture.3 undef, align 8
@texture_float4_3D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.4 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture.3 addrspace(1)* @texture_float4_2D to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @test_float4_2D(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float %1, float %2) local_unnamed_addr #0 {
  %4 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture.3, %struct.texture.3 addrspace(1)* @texture_float4_2D, i64 0, i32 0, i32 11), align 8
  %5 = bitcast %struct.__hip_texture* %4 to i32*
  %6 = addrspacecast i32* %5 to i32 addrspace(4)*
  %7 = getelementptr inbounds i32, i32 addrspace(4)* %6, i64 12
  %8 = getelementptr inbounds i32, i32 addrspace(4)* %6, i64 10
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = uitofp i32 %9 to float
  %11 = getelementptr inbounds i32, i32 addrspace(4)* %6, i64 2
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = lshr i32 %12, 14
  %14 = and i32 %13, 16383
  %15 = add nuw nsw i32 %14, 1
  %16 = uitofp i32 %15 to float
  %17 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %18 = and i32 %17, 32768
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, float %10, float 1.000000e+00
  %21 = select i1 %19, float %16, float 1.000000e+00
  %22 = getelementptr inbounds i32, i32 addrspace(4)* %6, i64 14
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = and i32 %23, 1048576
  %25 = icmp eq i32 %24, 0
  %26 = bitcast i32 addrspace(4)* %7 to <4 x i32> addrspace(4)*
  %27 = load <4 x i32>, <4 x i32> addrspace(4)* %26, align 16, !tbaa !8
  %28 = bitcast %struct.__hip_texture* %4 to <8 x i32>*
  %29 = addrspacecast <8 x i32>* %28 to <8 x i32> addrspace(4)*
  %30 = load <8 x i32>, <8 x i32> addrspace(4)* %29, align 32, !tbaa !8
  %31 = tail call float @llvm.amdgcn.rcp.f32(float %21)
  %32 = fmul float %21, %2
  %33 = tail call float @llvm.floor.f32(float %32)
  %34 = fmul float %31, %33
  %35 = select i1 %25, float %34, float %2
  %36 = tail call float @llvm.amdgcn.rcp.f32(float %20)
  %37 = fmul float %20, %1
  %38 = tail call float @llvm.floor.f32(float %37)
  %39 = fmul float %36, %38
  %40 = select i1 %25, float %39, float %1
  %41 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %40, float %35, <8 x i32> %30, <4 x i32> %27, i1 false, i32 0, i32 0)
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  store <4 x float> %41, <4 x float> addrspace(1)* %42, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
