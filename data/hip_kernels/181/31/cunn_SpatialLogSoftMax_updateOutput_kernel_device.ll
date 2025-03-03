; ModuleID = '../data/hip_kernels/181/31/main.cu'
source_filename = "../data/hip_kernels/181/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z42cunn_SpatialLogSoftMax_updateOutput_kernelPfS_iiif(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = freeze i32 %15
  %17 = freeze i32 %3
  %18 = sdiv i32 %16, %17
  %19 = mul nsw i32 %18, %2
  %20 = mul i32 %18, %17
  %21 = sub i32 %16, %20
  %22 = add nsw i32 %19, %21
  %23 = icmp slt i32 %22, %4
  br i1 %23, label %24, label %66

24:                                               ; preds = %6
  %25 = add nsw i32 %22, %2
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %29, label %27

27:                                               ; preds = %29, %24
  %28 = phi float [ 0xC7E2CED320000000, %24 ], [ %36, %29 ]
  br i1 %26, label %44, label %39

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %37, %29 ], [ %22, %24 ]
  %31 = phi float [ %36, %29 ], [ 0xC7E2CED320000000, %24 ]
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = fcmp contract olt float %31, %34
  %36 = select i1 %35, float %34, float %31
  %37 = add nsw i32 %30, %3
  %38 = icmp slt i32 %37, %25
  br i1 %38, label %29, label %27, !llvm.loop !11

39:                                               ; preds = %44, %27
  %40 = phi float [ 0.000000e+00, %27 ], [ %54, %44 ]
  %41 = fadd contract float %40, %5
  %42 = tail call float @llvm.log.f32(float %41)
  %43 = fadd contract float %28, %42
  br i1 %26, label %57, label %66

44:                                               ; preds = %27, %44
  %45 = phi i32 [ %55, %44 ], [ %22, %27 ]
  %46 = phi float [ %54, %44 ], [ 0.000000e+00, %27 ]
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fcmp uno float %49, 0.000000e+00
  %51 = fsub contract float %49, %28
  %52 = tail call float @llvm.exp.f32(float %51)
  %53 = select i1 %50, float -0.000000e+00, float %52
  %54 = fadd contract float %46, %53
  %55 = add nsw i32 %45, %3
  %56 = icmp slt i32 %55, %25
  br i1 %56, label %44, label %39, !llvm.loop !13

57:                                               ; preds = %39, %57
  %58 = phi i32 [ %64, %57 ], [ %22, %39 ]
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fsub contract float %61, %43
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %62, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nsw i32 %58, %3
  %65 = icmp slt i32 %64, %25
  br i1 %65, label %57, label %66, !llvm.loop !14

66:                                               ; preds = %57, %39, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
