; ModuleID = '../data/hip_kernels/5216/5/main.cu'
source_filename = "../data/hip_kernels/5216/5/main.cu"
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
@texture_float4_2D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.3 undef, align 8
@texture_float4_3D = protected addrspace(1) externally_initialized global %struct.texture.4 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture.4 addrspace(1)* @texture_float4_3D to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @test_float4_3D(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float %1, float %2, float %3) local_unnamed_addr #0 {
  %5 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture.4, %struct.texture.4 addrspace(1)* @texture_float4_3D, i64 0, i32 0, i32 11), align 8
  %6 = bitcast %struct.__hip_texture* %5 to i32*
  %7 = addrspacecast i32* %6 to i32 addrspace(4)*
  %8 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 12
  %9 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 10
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = uitofp i32 %10 to float
  %12 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 2
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = lshr i32 %13, 14
  %15 = and i32 %14, 16383
  %16 = add nuw nsw i32 %15, 1
  %17 = uitofp i32 %16 to float
  %18 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 4
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !4
  %20 = and i32 %19, 8191
  %21 = add nuw nsw i32 %20, 1
  %22 = uitofp i32 %21 to float
  %23 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %24 = and i32 %23, 32768
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, float %11, float 1.000000e+00
  %27 = select i1 %25, float %17, float 1.000000e+00
  %28 = select i1 %25, float %22, float 1.000000e+00
  %29 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 14
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !4
  %31 = and i32 %30, 1048576
  %32 = icmp eq i32 %31, 0
  %33 = bitcast i32 addrspace(4)* %8 to <4 x i32> addrspace(4)*
  %34 = load <4 x i32>, <4 x i32> addrspace(4)* %33, align 16, !tbaa !8
  %35 = bitcast %struct.__hip_texture* %5 to <8 x i32>*
  %36 = addrspacecast <8 x i32>* %35 to <8 x i32> addrspace(4)*
  %37 = load <8 x i32>, <8 x i32> addrspace(4)* %36, align 32, !tbaa !8
  %38 = tail call float @llvm.amdgcn.rcp.f32(float %28)
  %39 = fmul float %28, %3
  %40 = tail call float @llvm.floor.f32(float %39)
  %41 = fmul float %38, %40
  %42 = select i1 %32, float %41, float %3
  %43 = tail call float @llvm.amdgcn.rcp.f32(float %27)
  %44 = fmul float %27, %2
  %45 = tail call float @llvm.floor.f32(float %44)
  %46 = fmul float %43, %45
  %47 = select i1 %32, float %46, float %2
  %48 = tail call float @llvm.amdgcn.rcp.f32(float %26)
  %49 = fmul float %26, %1
  %50 = tail call float @llvm.floor.f32(float %49)
  %51 = fmul float %48, %50
  %52 = select i1 %32, float %51, float %1
  %53 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.3d.v4f32.f32(i32 15, float %52, float %47, float %42, <8 x i32> %37, <4 x i32> %34, i1 false, i32 0, i32 0)
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  store <4 x float> %53, <4 x float> addrspace(1)* %54, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.3d.v4f32.f32(i32 immarg, float, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

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
