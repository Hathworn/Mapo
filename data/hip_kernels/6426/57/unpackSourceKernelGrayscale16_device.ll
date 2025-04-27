; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/6426/57/unpackSourceKernelGrayscale16.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/6426/57/unpackSourceKernelGrayscale16.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z29unpackSourceKernelGrayscale16PtjP13__hip_surfacejj(i16 addrspace(1)* nocapture writeonly %0, i32 %1, %struct.__hip_surface addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp ult i32 %14, %3
  %24 = icmp ult i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %69

26:                                               ; preds = %5
  %27 = shl i32 %14, 2
  %28 = bitcast %struct.__hip_surface addrspace(1)* %2 to i32 addrspace(1)*
  %29 = addrspacecast i32 addrspace(1)* %28 to i32 addrspace(4)*
  %30 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 8
  %31 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 9
  %33 = load i32, i32 addrspace(4)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp eq i32 %31, 4
  br i1 %34, label %35, label %37

35:                                               ; preds = %26
  %36 = sdiv i32 %27, 3
  br label %42

37:                                               ; preds = %26
  %38 = sext i32 %31 to i64
  %39 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %38
  %40 = load i32, i32 addrspace(4)* %39, align 4, !tbaa !11
  %41 = ashr i32 %27, %40
  br label %42

42:                                               ; preds = %37, %35
  %43 = phi i32 [ %36, %35 ], [ %41, %37 ]
  %44 = sext i32 %33 to i64
  %45 = lshr i64 4176, %44
  %46 = and i64 %45, 1
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %50, label %48

48:                                               ; preds = %42
  %49 = sdiv i32 %43, 3
  br label %54

50:                                               ; preds = %42
  %51 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %44
  %52 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !11
  %53 = ashr i32 %43, %52
  br label %54

54:                                               ; preds = %48, %50
  %55 = phi i32 [ %49, %48 ], [ %53, %50 ]
  %56 = bitcast %struct.__hip_surface addrspace(1)* %2 to <8 x i32> addrspace(1)*
  %57 = addrspacecast <8 x i32> addrspace(1)* %56 to <8 x i32> addrspace(4)*
  %58 = load <8 x i32>, <8 x i32> addrspace(4)* %57, align 32, !tbaa !15, !amdgpu.noclobber !5
  %59 = tail call float @llvm.amdgcn.image.load.2d.f32.i32(i32 1, i32 %55, i32 %22, <8 x i32> %58, i32 0, i32 0)
  %60 = fmul contract float %59, 1.000000e+03
  %61 = tail call float @llvm.round.f32(float %60)
  %62 = tail call float @llvm.minnum.f32(float %61, float 6.553500e+04)
  %63 = tail call float @llvm.maxnum.f32(float %62, float 0.000000e+00)
  %64 = fptoui float %63 to i16
  %65 = mul i32 %22, %1
  %66 = add i32 %65, %14
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %67
  store i16 %64, i16 addrspace(1)* %68, align 2, !tbaa !16
  br label %69

69:                                               ; preds = %54, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.load.2d.f32.i32(i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!9, !9, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !13, i64 0}
