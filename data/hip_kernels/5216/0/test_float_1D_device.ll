; ModuleID = '../data/hip_kernels/5216/0/main.cu'
source_filename = "../data/hip_kernels/5216/0/main.cu"
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

@texture_float_1D = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@texture_float_2D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@texture_float_3D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.1 undef, align 8
@texture_float4_1D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.2 undef, align 8
@texture_float4_2D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.3 undef, align 8
@texture_float4_3D = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.4 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @texture_float_1D to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @test_float_1D(float addrspace(1)* nocapture writeonly %0, float %1) local_unnamed_addr #0 {
  %3 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @texture_float_1D, i64 0, i32 0, i32 11), align 8
  %4 = bitcast %struct.__hip_texture* %3 to i32*
  %5 = addrspacecast i32* %4 to i32 addrspace(4)*
  %6 = getelementptr inbounds i32, i32 addrspace(4)* %5, i64 12
  %7 = getelementptr inbounds i32, i32 addrspace(4)* %5, i64 10
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = uitofp i32 %8 to float
  %10 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %11 = and i32 %10, 32768
  %12 = icmp eq i32 %11, 0
  %13 = select i1 %12, float %9, float 1.000000e+00
  %14 = bitcast i32 addrspace(4)* %6 to <4 x i32> addrspace(4)*
  %15 = load <4 x i32>, <4 x i32> addrspace(4)* %14, align 16, !tbaa !8
  %16 = bitcast %struct.__hip_texture* %3 to <8 x i32>*
  %17 = addrspacecast <8 x i32>* %16 to <8 x i32> addrspace(4)*
  %18 = load <8 x i32>, <8 x i32> addrspace(4)* %17, align 32, !tbaa !8
  %19 = extractelement <4 x i32> %15, i64 2
  %20 = and i32 %19, 1048576
  %21 = icmp eq i32 %20, 0
  %22 = tail call float @llvm.amdgcn.rcp.f32(float %13)
  %23 = fmul float %13, %1
  %24 = tail call float @llvm.floor.f32(float %23)
  %25 = fmul float %22, %24
  %26 = select i1 %21, float %25, float %1
  %27 = tail call float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 1, float %26, <8 x i32> %18, <4 x i32> %15, i1 false, i32 0, i32 0)
  store float %27, float addrspace(1)* %0, align 4, !tbaa !9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 immarg, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }

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
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
