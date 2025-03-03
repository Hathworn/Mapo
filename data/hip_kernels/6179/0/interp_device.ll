; ModuleID = '../data/hip_kernels/6179/0/main.cu'
source_filename = "../data/hip_kernels/6179/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque

@tex_sin = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@tex_sin2 = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@tex_sin3 = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @tex_sin to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @tex_sin3 to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z6interpPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %71

14:                                               ; preds = %3
  %15 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @tex_sin3, i64 0, i32 0, i32 11), align 8
  %16 = sitofp i32 %12 to float
  %17 = sitofp i32 %2 to float
  %18 = fdiv contract float %16, %17
  %19 = bitcast %struct.__hip_texture* %15 to i32*
  %20 = addrspacecast i32* %19 to i32 addrspace(4)*
  %21 = getelementptr inbounds i32, i32 addrspace(4)* %20, i64 12
  %22 = getelementptr inbounds i32, i32 addrspace(4)* %20, i64 10
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = uitofp i32 %23 to float
  %25 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7
  %26 = and i32 %25, 32768
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, float %24, float 1.000000e+00
  %29 = bitcast i32 addrspace(4)* %21 to <4 x i32> addrspace(4)*
  %30 = load <4 x i32>, <4 x i32> addrspace(4)* %29, align 16, !tbaa !11
  %31 = bitcast %struct.__hip_texture* %15 to <8 x i32>*
  %32 = addrspacecast <8 x i32>* %31 to <8 x i32> addrspace(4)*
  %33 = load <8 x i32>, <8 x i32> addrspace(4)* %32, align 32, !tbaa !11
  %34 = extractelement <4 x i32> %30, i64 2
  %35 = and i32 %34, 1048576
  %36 = icmp eq i32 %35, 0
  %37 = tail call float @llvm.amdgcn.rcp.f32(float %28)
  %38 = fmul float %18, %28
  %39 = tail call float @llvm.floor.f32(float %38)
  %40 = fmul float %37, %39
  %41 = select i1 %36, float %40, float %18
  %42 = tail call float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 1, float %41, <8 x i32> %33, <4 x i32> %30, i1 false, i32 0, i32 0)
  %43 = sext i32 %12 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  store float %42, float addrspace(1)* %44, align 4, !tbaa !12
  %45 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @tex_sin, i64 0, i32 0, i32 11), align 8
  %46 = bitcast %struct.__hip_texture* %45 to i32*
  %47 = addrspacecast i32* %46 to i32 addrspace(4)*
  %48 = getelementptr inbounds i32, i32 addrspace(4)* %47, i64 12
  %49 = getelementptr inbounds i32, i32 addrspace(4)* %47, i64 10
  %50 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !7
  %51 = uitofp i32 %50 to float
  %52 = load i32, i32 addrspace(4)* %48, align 4, !tbaa !7
  %53 = and i32 %52, 32768
  %54 = icmp eq i32 %53, 0
  %55 = select i1 %54, float %51, float 1.000000e+00
  %56 = bitcast i32 addrspace(4)* %48 to <4 x i32> addrspace(4)*
  %57 = load <4 x i32>, <4 x i32> addrspace(4)* %56, align 16, !tbaa !11
  %58 = bitcast %struct.__hip_texture* %45 to <8 x i32>*
  %59 = addrspacecast <8 x i32>* %58 to <8 x i32> addrspace(4)*
  %60 = load <8 x i32>, <8 x i32> addrspace(4)* %59, align 32, !tbaa !11
  %61 = extractelement <4 x i32> %57, i64 2
  %62 = and i32 %61, 1048576
  %63 = icmp eq i32 %62, 0
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %65 = fmul float %18, %55
  %66 = tail call float @llvm.floor.f32(float %65)
  %67 = fmul float %64, %66
  %68 = select i1 %63, float %67, float %18
  %69 = tail call float @llvm.amdgcn.image.sample.lz.1d.f32.f32(i32 1, float %68, <8 x i32> %60, <4 x i32> %57, i1 false, i32 0, i32 0)
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %69, float addrspace(1)* %70, align 4, !tbaa !12
  br label %71

71:                                               ; preds = %14, %3
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
