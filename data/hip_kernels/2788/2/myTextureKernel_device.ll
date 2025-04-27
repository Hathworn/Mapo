; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/2788/2/myTextureKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/2788/2/myTextureKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind writeonly
define protected amdgpu_kernel void @_Z15myTextureKernelP13__hip_surfacemm(%struct.__hip_surface addrspace(1)* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 8, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = icmp ult i64 %16, %2
  br i1 %17, label %18, label %44

18:                                               ; preds = %3
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !16
  %27 = mul i32 %19, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = icmp ult i64 %30, %1
  %32 = bitcast %struct.__hip_surface addrspace(1)* %0 to i32 addrspace(1)*
  %33 = addrspacecast i32 addrspace(1)* %32 to i32 addrspace(4)*
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 8
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 9
  %36 = bitcast %struct.__hip_surface addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %37 = addrspacecast <8 x i32> addrspace(1)* %36 to <8 x i32> addrspace(4)*
  %38 = udiv i32 %12, %9
  %39 = mul i32 %38, %9
  %40 = icmp ugt i32 %12, %39
  %41 = zext i1 %40 to i32
  %42 = add i32 %38, %41
  %43 = mul i32 %42, %9
  br label %45

44:                                               ; preds = %65, %3
  ret void

45:                                               ; preds = %18, %65
  %46 = phi i32 [ %15, %18 ], [ %66, %65 ]
  br i1 %31, label %47, label %65

47:                                               ; preds = %45
  %48 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !17, !amdgpu.noclobber !5
  %49 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !17, !amdgpu.noclobber !5
  %50 = icmp eq i32 %48, 4
  %51 = sext i32 %48 to i64
  %52 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %51
  %53 = sext i32 %49 to i64
  %54 = lshr i64 4176, %53
  %55 = and i64 %54, 1
  %56 = icmp eq i64 %55, 0
  %57 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %53
  %58 = load <8 x i32>, <8 x i32> addrspace(4)* %37, align 32, !tbaa !18, !amdgpu.noclobber !5
  %59 = udiv i32 %26, %23
  %60 = mul i32 %59, %23
  %61 = icmp ugt i32 %26, %60
  %62 = zext i1 %61 to i32
  %63 = add i32 %59, %62
  %64 = mul i32 %63, %23
  br label %69

65:                                               ; preds = %84, %45
  %66 = add i32 %43, %46
  %67 = sext i32 %66 to i64
  %68 = icmp ult i64 %67, %2
  br i1 %68, label %45, label %44, !llvm.loop !19

69:                                               ; preds = %47, %84
  %70 = phi i32 [ %29, %47 ], [ %86, %84 ]
  %71 = shl i32 %70, 2
  br i1 %50, label %72, label %74

72:                                               ; preds = %69
  %73 = sdiv i32 %71, 3
  br label %77

74:                                               ; preds = %69
  %75 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !21
  %76 = ashr i32 %71, %75
  br label %77

77:                                               ; preds = %74, %72
  %78 = phi i32 [ %73, %72 ], [ %76, %74 ]
  br i1 %56, label %81, label %79

79:                                               ; preds = %77
  %80 = sdiv i32 %78, 3
  br label %84

81:                                               ; preds = %77
  %82 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !21
  %83 = ashr i32 %78, %82
  br label %84

84:                                               ; preds = %79, %81
  %85 = phi i32 [ %80, %79 ], [ %83, %81 ]
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> <float 0x371FE00000000000, float 0x371FE00000000000, float 0x371FE00000000000, float 0x371FE00000000000>, i32 15, i32 %85, i32 %46, <8 x i32> %58, i32 0, i32 0)
  %86 = add i32 %64, %70
  %87 = sext i32 %86 to i64
  %88 = icmp ult i64 %87, %1
  br i1 %88, label %69, label %65, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress norecurse nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 12}
!17 = !{!11, !11, i64 0}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = distinct !{!25, !20}
