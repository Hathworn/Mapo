; ModuleID = '../data/hip_kernels/12219/0/main.cu'
source_filename = "../data/hip_kernels/12219/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@inTex = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @inTex to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z28CuDeviceArrayCopyFromTextureP15HIP_vector_typeIfLj3EEiii(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %13, %2
  %23 = icmp sgt i32 %21, %3
  %24 = select i1 %22, i1 true, i1 %23
  br i1 %24, label %78, label %25

25:                                               ; preds = %4
  %26 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @inTex, i64 0, i32 0, i32 11), align 8
  %27 = sitofp i32 %13 to float
  %28 = sitofp i32 %21 to float
  %29 = bitcast %struct.__hip_texture* %26 to i32*
  %30 = addrspacecast i32* %29 to i32 addrspace(4)*
  %31 = getelementptr inbounds i32, i32 addrspace(4)* %30, i64 12
  %32 = getelementptr inbounds i32, i32 addrspace(4)* %30, i64 10
  %33 = load i32, i32 addrspace(4)* %32, align 4, !tbaa !7
  %34 = uitofp i32 %33 to float
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %30, i64 2
  %36 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !7
  %37 = lshr i32 %36, 14
  %38 = and i32 %37, 16383
  %39 = add nuw nsw i32 %38, 1
  %40 = uitofp i32 %39 to float
  %41 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7
  %42 = and i32 %41, 32768
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, float %34, float 1.000000e+00
  %45 = select i1 %43, float %40, float 1.000000e+00
  %46 = getelementptr inbounds i32, i32 addrspace(4)* %30, i64 14
  %47 = load i32, i32 addrspace(4)* %46, align 4, !tbaa !7
  %48 = and i32 %47, 1048576
  %49 = icmp eq i32 %48, 0
  %50 = bitcast i32 addrspace(4)* %31 to <4 x i32> addrspace(4)*
  %51 = load <4 x i32>, <4 x i32> addrspace(4)* %50, align 16, !tbaa !11
  %52 = bitcast %struct.__hip_texture* %26 to <8 x i32>*
  %53 = addrspacecast <8 x i32>* %52 to <8 x i32> addrspace(4)*
  %54 = load <8 x i32>, <8 x i32> addrspace(4)* %53, align 32, !tbaa !11
  %55 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %56 = fmul float %45, %28
  %57 = tail call float @llvm.floor.f32(float %56)
  %58 = fmul float %55, %57
  %59 = select i1 %49, float %58, float %28
  %60 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %61 = fmul float %44, %27
  %62 = tail call float @llvm.floor.f32(float %61)
  %63 = fmul float %60, %62
  %64 = select i1 %49, float %63, float %27
  %65 = tail call <3 x float> @llvm.amdgcn.image.sample.lz.2d.v3f32.f32(i32 7, float %64, float %59, <8 x i32> %54, <4 x i32> %51, i1 false, i32 0, i32 0)
  %66 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %67 = mul nsw i32 %21, %1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %66, i64 %68
  %70 = bitcast i8 addrspace(1)* %69 to %struct.HIP_vector_type addrspace(1)*
  %71 = extractelement <3 x float> %65, i64 0
  %72 = extractelement <3 x float> %65, i64 1
  %73 = extractelement <3 x float> %65, i64 2
  %74 = sext i32 %13 to i64
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %70, i64 %74, i32 0, i32 0, i32 0, i32 0, i64 0
  store float %71, float addrspace(1)* %75, align 4
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %70, i64 %74, i32 0, i32 0, i32 0, i32 0, i64 1
  store float %72, float addrspace(1)* %76, align 4
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %70, i64 %74, i32 0, i32 0, i32 0, i32 0, i64 2
  store float %73, float addrspace(1)* %77, align 4
  br label %78

78:                                               ; preds = %4, %25
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
declare <3 x float> @llvm.amdgcn.image.sample.lz.2d.v3f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
