; ModuleID = '../data/hip_kernels/16079/0/main.cu'
source_filename = "../data/hip_kernels/16079/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

@texCoarse = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture undef, align 8
@texCoarseFloat2 = protected addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture.0 addrspace(1)* @texCoarseFloat2 to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22TgvUpscaleFloat2KerneliiifP15HIP_vector_typeIfLj2EE(i32 %0, i32 %1, i32 %2, float %3, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %0
  %24 = icmp slt i32 %22, %1
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %82

26:                                               ; preds = %5
  %27 = sitofp i32 %14 to float
  %28 = fadd contract float %27, 5.000000e-01
  %29 = sitofp i32 %0 to float
  %30 = fdiv contract float %28, %29
  %31 = sitofp i32 %22 to float
  %32 = fadd contract float %31, 5.000000e-01
  %33 = sitofp i32 %1 to float
  %34 = fdiv contract float %32, %33
  %35 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture.0, %struct.texture.0 addrspace(1)* @texCoarseFloat2, i64 0, i32 0, i32 11), align 8
  %36 = bitcast %struct.__hip_texture* %35 to i32*
  %37 = addrspacecast i32* %36 to i32 addrspace(4)*
  %38 = getelementptr inbounds i32, i32 addrspace(4)* %37, i64 12
  %39 = getelementptr inbounds i32, i32 addrspace(4)* %37, i64 10
  %40 = load i32, i32 addrspace(4)* %39, align 4, !tbaa !7
  %41 = uitofp i32 %40 to float
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %37, i64 2
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = lshr i32 %43, 14
  %45 = and i32 %44, 16383
  %46 = add nuw nsw i32 %45, 1
  %47 = uitofp i32 %46 to float
  %48 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !7
  %49 = and i32 %48, 32768
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, float %41, float 1.000000e+00
  %52 = select i1 %50, float %47, float 1.000000e+00
  %53 = getelementptr inbounds i32, i32 addrspace(4)* %37, i64 14
  %54 = load i32, i32 addrspace(4)* %53, align 4, !tbaa !7
  %55 = and i32 %54, 1048576
  %56 = icmp eq i32 %55, 0
  %57 = bitcast i32 addrspace(4)* %38 to <4 x i32> addrspace(4)*
  %58 = load <4 x i32>, <4 x i32> addrspace(4)* %57, align 16, !tbaa !11
  %59 = bitcast %struct.__hip_texture* %35 to <8 x i32>*
  %60 = addrspacecast <8 x i32>* %59 to <8 x i32> addrspace(4)*
  %61 = load <8 x i32>, <8 x i32> addrspace(4)* %60, align 32, !tbaa !11
  %62 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %63 = fmul float %34, %52
  %64 = tail call float @llvm.floor.f32(float %63)
  %65 = fmul float %62, %64
  %66 = select i1 %56, float %65, float %34
  %67 = tail call float @llvm.amdgcn.rcp.f32(float %51)
  %68 = fmul float %30, %51
  %69 = tail call float @llvm.floor.f32(float %68)
  %70 = fmul float %67, %69
  %71 = select i1 %56, float %70, float %30
  %72 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %71, float %66, <8 x i32> %61, <4 x i32> %58, i1 false, i32 0, i32 0)
  %73 = extractelement <2 x float> %72, i64 0
  %74 = extractelement <2 x float> %72, i64 1
  %75 = fmul contract float %73, %3
  %76 = mul nsw i32 %22, %2
  %77 = add nsw i32 %76, %14
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %78, i32 0, i32 0, i32 0, i64 0
  store float %75, float addrspace(1)* %79, align 8, !tbaa !12
  %80 = fmul contract float %74, %3
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %78, i32 0, i32 0, i32 0, i64 1
  store float %80, float addrspace(1)* %81, align 4, !tbaa !12
  br label %82

82:                                               ; preds = %5, %26
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nounwind readonly willreturn
declare <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
