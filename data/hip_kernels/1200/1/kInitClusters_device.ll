; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/1200/1/kInitClusters.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/1200/1/kInitClusters.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13kInitClustersP13__hip_surfacePfiiii(%struct.__hip_surface addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %5, %4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %87

18:                                               ; preds = %6
  %19 = sdiv i32 %2, %4
  %20 = sdiv i32 %3, %5
  %21 = freeze i32 %15
  %22 = freeze i32 %4
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = mul nsw i32 %25, %19
  %27 = sdiv i32 %19, 2
  %28 = add nsw i32 %26, %27
  %29 = mul nsw i32 %23, %20
  %30 = sdiv i32 %20, 2
  %31 = add nsw i32 %29, %30
  %32 = shl nsw i32 %28, 4
  %33 = bitcast %struct.__hip_surface addrspace(1)* %0 to i32 addrspace(1)*
  %34 = addrspacecast i32 addrspace(1)* %33 to i32 addrspace(4)*
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 8
  %36 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 9
  %38 = load i32, i32 addrspace(4)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = icmp eq i32 %36, 4
  br i1 %39, label %40, label %42

40:                                               ; preds = %18
  %41 = sdiv i32 %32, 3
  br label %47

42:                                               ; preds = %18
  %43 = sext i32 %36 to i64
  %44 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %43
  %45 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !11
  %46 = ashr i32 %32, %45
  br label %47

47:                                               ; preds = %42, %40
  %48 = phi i32 [ %41, %40 ], [ %46, %42 ]
  %49 = sext i32 %38 to i64
  %50 = lshr i64 4176, %49
  %51 = and i64 %50, 1
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %55, label %53

53:                                               ; preds = %47
  %54 = sdiv i32 %48, 3
  br label %59

55:                                               ; preds = %47
  %56 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %49
  %57 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !11
  %58 = ashr i32 %48, %57
  br label %59

59:                                               ; preds = %53, %55
  %60 = phi i32 [ %54, %53 ], [ %58, %55 ]
  %61 = bitcast %struct.__hip_surface addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %62 = addrspacecast <8 x i32> addrspace(1)* %61 to <8 x i32> addrspace(4)*
  %63 = load <8 x i32>, <8 x i32> addrspace(4)* %62, align 32, !tbaa !15, !amdgpu.noclobber !5
  %64 = tail call <3 x float> @llvm.amdgcn.image.load.2d.v3f32.i32(i32 7, i32 %60, i32 %31, <8 x i32> %63, i32 0, i32 0)
  %65 = extractelement <3 x float> %64, i64 0
  %66 = sext i32 %15 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %65, float addrspace(1)* %67, align 4, !tbaa !16
  %68 = extractelement <3 x float> %64, i64 1
  %69 = add nsw i32 %15, %16
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %68, float addrspace(1)* %71, align 4, !tbaa !16
  %72 = extractelement <3 x float> %64, i64 2
  %73 = shl nsw i32 %16, 1
  %74 = add nsw i32 %15, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  store float %72, float addrspace(1)* %76, align 4, !tbaa !16
  %77 = sitofp i32 %28 to float
  %78 = mul nsw i32 %16, 3
  %79 = add nsw i32 %15, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %77, float addrspace(1)* %81, align 4, !tbaa !16
  %82 = sitofp i32 %31 to float
  %83 = shl nsw i32 %16, 2
  %84 = add nsw i32 %15, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %82, float addrspace(1)* %86, align 4, !tbaa !16
  br label %87

87:                                               ; preds = %59, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readonly willreturn
declare <3 x float> @llvm.amdgcn.image.load.2d.v3f32.i32(i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!9, !9, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !13, i64 0}
