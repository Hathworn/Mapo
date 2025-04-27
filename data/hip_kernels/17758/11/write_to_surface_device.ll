; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/17758/11/write_to_surface.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/17758/11/write_to_surface.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16write_to_surfacePKfP13__hip_surfaceii(float addrspace(1)* nocapture readonly %0, %struct.__hip_surface addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %23 = icmp slt i32 %13, %2
  %24 = icmp slt i32 %21, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %86

26:                                               ; preds = %4
  %27 = shl i32 %22, 2
  %28 = mul nsw i32 %3, %2
  %29 = mul nsw i32 %27, %28
  %30 = mul nsw i32 %21, %2
  %31 = add i32 %13, %29
  %32 = add i32 %31, %30
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = insertelement <4 x float> undef, float %35, i64 0
  %37 = add nsw i32 %32, %28
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = insertelement <4 x float> %36, float %40, i64 1
  %42 = shl nsw i32 %28, 1
  %43 = add nsw i32 %32, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = insertelement <4 x float> %41, float %46, i64 2
  %48 = mul nsw i32 %28, 3
  %49 = add nsw i32 %32, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = insertelement <4 x float> %47, float %52, i64 3
  %54 = shl i32 %13, 4
  %55 = bitcast %struct.__hip_surface addrspace(1)* %1 to i32 addrspace(1)*
  %56 = addrspacecast i32 addrspace(1)* %55 to i32 addrspace(4)*
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 8
  %58 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !11, !amdgpu.noclobber !5
  %59 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 9
  %60 = load i32, i32 addrspace(4)* %59, align 4, !tbaa !11, !amdgpu.noclobber !5
  %61 = icmp eq i32 %58, 4
  br i1 %61, label %62, label %64

62:                                               ; preds = %26
  %63 = sdiv i32 %54, 3
  br label %69

64:                                               ; preds = %26
  %65 = sext i32 %58 to i64
  %66 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %65
  %67 = load i32, i32 addrspace(4)* %66, align 4, !tbaa !15
  %68 = ashr i32 %54, %67
  br label %69

69:                                               ; preds = %64, %62
  %70 = phi i32 [ %63, %62 ], [ %68, %64 ]
  %71 = sext i32 %60 to i64
  %72 = lshr i64 4176, %71
  %73 = and i64 %72, 1
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %77, label %75

75:                                               ; preds = %69
  %76 = sdiv i32 %70, 3
  br label %81

77:                                               ; preds = %69
  %78 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %71
  %79 = load i32, i32 addrspace(4)* %78, align 4, !tbaa !15
  %80 = ashr i32 %70, %79
  br label %81

81:                                               ; preds = %75, %77
  %82 = phi i32 [ %76, %75 ], [ %80, %77 ]
  %83 = bitcast %struct.__hip_surface addrspace(1)* %1 to <8 x i32> addrspace(1)*
  %84 = addrspacecast <8 x i32> addrspace(1)* %83 to <8 x i32> addrspace(4)*
  %85 = load <8 x i32>, <8 x i32> addrspace(4)* %84, align 32, !tbaa !17, !amdgpu.noclobber !5
  tail call void @llvm.amdgcn.image.store.mip.2d.v4f32.i32(<4 x float> %53, i32 15, i32 %82, i32 %21, i32 %22, <8 x i32> %85, i32 0, i32 0)
  br label %86

86:                                               ; preds = %81, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.mip.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nounwind willreturn writeonly }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
!17 = !{!13, !13, i64 0}
