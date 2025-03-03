; ModuleID = '../data/hip_kernels/16079/1/main.cu'
source_filename = "../data/hip_kernels/16079/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@texCoarse = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@texCoarseFloat2 = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @texCoarse to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22TgvUpscaleMaskedKernelPfiiifS_(float addrspace(1)* nocapture readnone %0, i32 %1, i32 %2, i32 %3, float %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %23, %2
  %25 = icmp slt i32 %15, %1
  %26 = select i1 %24, i1 true, i1 %25
  br i1 %26, label %27, label %79

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %3
  %29 = add nsw i32 %28, %15
  %30 = sitofp i32 %15 to float
  %31 = fadd contract float %30, 5.000000e-01
  %32 = sitofp i32 %1 to float
  %33 = fdiv contract float %31, %32
  %34 = sitofp i32 %23 to float
  %35 = fadd contract float %34, 5.000000e-01
  %36 = sitofp i32 %2 to float
  %37 = fdiv contract float %35, %36
  %38 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @texCoarse, i64 0, i32 0, i32 11), align 8
  %39 = bitcast %struct.__hip_texture* %38 to i32*
  %40 = addrspacecast i32* %39 to i32 addrspace(4)*
  %41 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 12
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 10
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = uitofp i32 %43 to float
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 2
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7
  %47 = lshr i32 %46, 14
  %48 = and i32 %47, 16383
  %49 = add nuw nsw i32 %48, 1
  %50 = uitofp i32 %49 to float
  %51 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !7
  %52 = and i32 %51, 32768
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, float %44, float 1.000000e+00
  %55 = select i1 %53, float %50, float 1.000000e+00
  %56 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 14
  %57 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !7
  %58 = and i32 %57, 1048576
  %59 = icmp eq i32 %58, 0
  %60 = bitcast i32 addrspace(4)* %41 to <4 x i32> addrspace(4)*
  %61 = load <4 x i32>, <4 x i32> addrspace(4)* %60, align 16, !tbaa !11
  %62 = bitcast %struct.__hip_texture* %38 to <8 x i32>*
  %63 = addrspacecast <8 x i32>* %62 to <8 x i32> addrspace(4)*
  %64 = load <8 x i32>, <8 x i32> addrspace(4)* %63, align 32, !tbaa !11
  %65 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %66 = fmul float %37, %55
  %67 = tail call float @llvm.floor.f32(float %66)
  %68 = fmul float %65, %67
  %69 = select i1 %59, float %68, float %37
  %70 = tail call float @llvm.amdgcn.rcp.f32(float %54)
  %71 = fmul float %33, %54
  %72 = tail call float @llvm.floor.f32(float %71)
  %73 = fmul float %70, %72
  %74 = select i1 %59, float %73, float %33
  %75 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %74, float %69, <8 x i32> %64, <4 x i32> %61, i1 false, i32 0, i32 0)
  %76 = fmul contract float %75, %4
  %77 = sext i32 %29 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %5, i64 %77
  store float %76, float addrspace(1)* %78, align 4, !tbaa !12
  br label %79

79:                                               ; preds = %6, %27
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
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

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
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
