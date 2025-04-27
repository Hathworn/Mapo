; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/5295/4/kernel_renderRGBA2Surface.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/5295/4/kernel_renderRGBA2Surface.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25kernel_renderRGBA2SurfaceP13__hip_surfacePmiii(%struct.__hip_surface addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp ult i32 %14, %3
  %24 = icmp ult i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %83

26:                                               ; preds = %5
  %27 = bitcast i64 addrspace(1)* %1 to i8 addrspace(1)*
  %28 = mul i32 %22, %2
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 %29
  %31 = shl i32 %14, 2
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 1
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 2
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = insertelement <4 x i8> <i8 poison, i8 poison, i8 poison, i8 -1>, i8 %34, i64 0
  %40 = insertelement <4 x i8> %39, i8 %36, i64 1
  %41 = insertelement <4 x i8> %40, i8 %38, i64 2
  %42 = bitcast <4 x i8> %41 to i32
  %43 = bitcast %struct.__hip_surface addrspace(1)* %0 to i32 addrspace(1)*
  %44 = addrspacecast i32 addrspace(1)* %43 to i32 addrspace(4)*
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %44, i64 8
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !10, !amdgpu.noclobber !5
  %47 = getelementptr inbounds i32, i32 addrspace(4)* %44, i64 9
  %48 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !10, !amdgpu.noclobber !5
  %49 = icmp eq i32 %46, 4
  br i1 %49, label %50, label %52

50:                                               ; preds = %26
  %51 = sdiv i32 %31, 3
  br label %57

52:                                               ; preds = %26
  %53 = sext i32 %46 to i64
  %54 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %53
  %55 = load i32, i32 addrspace(4)* %54, align 4, !tbaa !14
  %56 = ashr i32 %31, %55
  br label %57

57:                                               ; preds = %52, %50
  %58 = phi i32 [ %51, %50 ], [ %56, %52 ]
  %59 = sext i32 %48 to i64
  %60 = lshr i64 4176, %59
  %61 = and i64 %60, 1
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %65, label %63

63:                                               ; preds = %57
  %64 = sdiv i32 %58, 3
  br label %69

65:                                               ; preds = %57
  %66 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %59
  %67 = load i32, i32 addrspace(4)* %66, align 4, !tbaa !14
  %68 = ashr i32 %58, %67
  br label %69

69:                                               ; preds = %63, %65
  %70 = phi i32 [ %64, %63 ], [ %68, %65 ]
  %71 = lshr i32 %42, 16
  %72 = lshr i32 %42, 8
  %73 = and i32 %42, 255
  %74 = and i32 %72, 255
  %75 = and i32 %71, 255
  %76 = insertelement <4 x i32> <i32 poison, i32 poison, i32 poison, i32 255>, i32 %73, i64 0
  %77 = insertelement <4 x i32> %76, i32 %74, i64 1
  %78 = insertelement <4 x i32> %77, i32 %75, i64 2
  %79 = bitcast <4 x i32> %78 to <4 x float>
  %80 = bitcast %struct.__hip_surface addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %81 = addrspacecast <8 x i32> addrspace(1)* %80 to <8 x i32> addrspace(4)*
  %82 = load <8 x i32>, <8 x i32> addrspace(4)* %81, align 32, !tbaa !16, !amdgpu.noclobber !5
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %79, i32 15, i32 %70, i32 %22, <8 x i32> %82, i32 0, i32 0)
  br label %83

83:                                               ; preds = %69, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !8, i64 0}
!16 = !{!12, !12, i64 0}
