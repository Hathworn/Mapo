; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/3367/0/kRgb2CIELab.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/3367/0/kRgb2CIELab.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11kRgb2CIELabP13__hip_textureP13__hip_surfaceii(%struct.__hip_texture addrspace(1)* nocapture readonly %0, %struct.__hip_surface addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %110

25:                                               ; preds = %4
  %26 = sitofp i32 %13 to float
  %27 = sitofp i32 %21 to float
  %28 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %29 = addrspacecast i32 addrspace(1)* %28 to i32 addrspace(4)*
  %30 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 12
  %31 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 10
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = uitofp i32 %32 to float
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 2
  %35 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = lshr i32 %35, 14
  %37 = and i32 %36, 16383
  %38 = add nuw nsw i32 %37, 1
  %39 = uitofp i32 %38 to float
  %40 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = and i32 %40, 32768
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, float %33, float 1.000000e+00
  %44 = select i1 %42, float %39, float 1.000000e+00
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 14
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = and i32 %46, 1048576
  %48 = icmp eq i32 %47, 0
  %49 = bitcast i32 addrspace(4)* %30 to <4 x i32> addrspace(4)*
  %50 = load <4 x i32>, <4 x i32> addrspace(4)* %49, align 16, !tbaa !11, !amdgpu.noclobber !5
  %51 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %52 = addrspacecast <8 x i32> addrspace(1)* %51 to <8 x i32> addrspace(4)*
  %53 = load <8 x i32>, <8 x i32> addrspace(4)* %52, align 32, !tbaa !11, !amdgpu.noclobber !5
  %54 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %55 = fmul float %44, %27
  %56 = tail call float @llvm.floor.f32(float %55)
  %57 = fmul float %54, %56
  %58 = select i1 %48, float %57, float %27
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %43)
  %60 = fmul float %43, %26
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fmul float %59, %61
  %63 = select i1 %48, float %62, float %26
  %64 = tail call <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 15, float %63, float %58, <8 x i32> %53, <4 x i32> %50, i1 false, i32 0, i32 0)
  %65 = bitcast <4 x float> %64 to <16 x i8>
  %66 = extractelement <16 x i8> %65, i64 0
  %67 = extractelement <16 x i8> %65, i64 4
  %68 = extractelement <16 x i8> %65, i64 8
  %69 = extractelement <16 x i8> %65, i64 12
  %70 = uitofp i8 %66 to float
  %71 = uitofp i8 %67 to float
  %72 = uitofp i8 %68 to float
  %73 = insertelement <4 x float> poison, float %70, i64 0
  %74 = insertelement <4 x float> %73, float %71, i64 1
  %75 = insertelement <4 x float> %74, float %72, i64 2
  %76 = uitofp i8 %69 to float
  %77 = insertelement <4 x float> %75, float %76, i64 3
  %78 = shl nsw i32 %13, 4
  %79 = bitcast %struct.__hip_surface addrspace(1)* %1 to i32 addrspace(1)*
  %80 = addrspacecast i32 addrspace(1)* %79 to i32 addrspace(4)*
  %81 = getelementptr inbounds i32, i32 addrspace(4)* %80, i64 8
  %82 = load i32, i32 addrspace(4)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = getelementptr inbounds i32, i32 addrspace(4)* %80, i64 9
  %84 = load i32, i32 addrspace(4)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = icmp eq i32 %82, 4
  br i1 %85, label %86, label %88

86:                                               ; preds = %25
  %87 = sdiv i32 %78, 3
  br label %93

88:                                               ; preds = %25
  %89 = sext i32 %82 to i64
  %90 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %89
  %91 = load i32, i32 addrspace(4)* %90, align 4, !tbaa !12
  %92 = ashr i32 %78, %91
  br label %93

93:                                               ; preds = %88, %86
  %94 = phi i32 [ %87, %86 ], [ %92, %88 ]
  %95 = sext i32 %84 to i64
  %96 = lshr i64 4176, %95
  %97 = and i64 %96, 1
  %98 = icmp eq i64 %97, 0
  br i1 %98, label %101, label %99

99:                                               ; preds = %93
  %100 = sdiv i32 %94, 3
  br label %105

101:                                              ; preds = %93
  %102 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %95
  %103 = load i32, i32 addrspace(4)* %102, align 4, !tbaa !12
  %104 = ashr i32 %94, %103
  br label %105

105:                                              ; preds = %99, %101
  %106 = phi i32 [ %100, %99 ], [ %104, %101 ]
  %107 = bitcast %struct.__hip_surface addrspace(1)* %1 to <8 x i32> addrspace(1)*
  %108 = addrspacecast <8 x i32> addrspace(1)* %107 to <8 x i32> addrspace(4)*
  %109 = load <8 x i32>, <8 x i32> addrspace(4)* %108, align 32, !tbaa !11, !amdgpu.noclobber !5
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %77, i32 15, i32 %106, i32 %21, <8 x i32> %109, i32 0, i32 0)
  br label %110

110:                                              ; preds = %105, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare <4 x float> @llvm.amdgcn.image.sample.lz.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nounwind willreturn writeonly }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nofree nounwind readonly willreturn }

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
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
