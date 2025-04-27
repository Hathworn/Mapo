; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/19/markPotentialMatchedDepthPairKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/19/markPotentialMatchedDepthPairKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z35markPotentialMatchedDepthPairKernelP13__hip_texturejjPj(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp ult i32 %13, %2
  %23 = icmp ult i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %72

25:                                               ; preds = %4
  %26 = mul i32 %21, %2
  %27 = add i32 %26, %13
  %28 = uitofp i32 %13 to float
  %29 = uitofp i32 %21 to float
  %30 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %31 = addrspacecast i32 addrspace(1)* %30 to i32 addrspace(4)*
  %32 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 12
  %33 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 10
  %34 = load i32, i32 addrspace(4)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = uitofp i32 %34 to float
  %36 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 2
  %37 = load i32, i32 addrspace(4)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = lshr i32 %37, 14
  %39 = and i32 %38, 16383
  %40 = add nuw nsw i32 %39, 1
  %41 = uitofp i32 %40 to float
  %42 = load i32, i32 addrspace(4)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %43 = and i32 %42, 32768
  %44 = icmp eq i32 %43, 0
  %45 = select i1 %44, float %35, float 1.000000e+00
  %46 = select i1 %44, float %41, float 1.000000e+00
  %47 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 14
  %48 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = and i32 %48, 1048576
  %50 = icmp eq i32 %49, 0
  %51 = bitcast i32 addrspace(4)* %32 to <4 x i32> addrspace(4)*
  %52 = load <4 x i32>, <4 x i32> addrspace(4)* %51, align 16, !tbaa !11, !amdgpu.noclobber !6
  %53 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %54 = addrspacecast <8 x i32> addrspace(1)* %53 to <8 x i32> addrspace(4)*
  %55 = load <8 x i32>, <8 x i32> addrspace(4)* %54, align 32, !tbaa !11, !amdgpu.noclobber !6
  %56 = tail call float @llvm.amdgcn.rcp.f32(float %46)
  %57 = fmul float %46, %29
  %58 = tail call float @llvm.floor.f32(float %57)
  %59 = fmul float %56, %58
  %60 = select i1 %50, float %59, float %29
  %61 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %62 = fmul float %45, %28
  %63 = tail call float @llvm.floor.f32(float %62)
  %64 = fmul float %61, %63
  %65 = select i1 %50, float %64, float %28
  %66 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %65, float %60, <8 x i32> %55, <4 x i32> %52, i1 false, i32 0, i32 0)
  %67 = bitcast float %66 to i32
  %68 = icmp ne i32 %67, -1
  %69 = zext i1 %68 to i32
  %70 = zext i32 %27 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %70
  store i32 %69, i32 addrspace(1)* %71, align 4, !tbaa !12
  br label %72

72:                                               ; preds = %4, %25
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
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
