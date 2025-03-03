; ModuleID = '../data/hip_kernels/5182/150/main.cu'
source_filename = "../data/hip_kernels/5182/150/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40FullyConnectedEstimateLearningRateKernelPfS_S_S_S_S_S_S_S_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = udiv i32 %21, %18
  %25 = mul i32 %24, %18
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %23
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %22
  %32 = mul i32 %31, %18
  %33 = add i32 %32, %30
  %34 = icmp slt i32 %33, %12
  br i1 %34, label %35, label %114

35:                                               ; preds = %13
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %10, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !5
  %39 = fcmp contract une float %38, 0.000000e+00
  br i1 %39, label %114, label %40

40:                                               ; preds = %35
  %41 = icmp sgt i32 %11, 0
  br i1 %41, label %42, label %100

42:                                               ; preds = %40
  %43 = and i32 %11, 1
  %44 = icmp eq i32 %11, 1
  br i1 %44, label %82, label %45

45:                                               ; preds = %42
  %46 = and i32 %11, -2
  br label %47

47:                                               ; preds = %47, %45
  %48 = phi i32 [ %33, %45 ], [ %79, %47 ]
  %49 = phi i32 [ 0, %45 ], [ %80, %47 ]
  %50 = sext i32 %48 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = getelementptr inbounds float, float addrspace(1)* %8, i64 %50
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fdiv contract float %52, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fmul contract float %57, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = fdiv contract float %58, %60
  %62 = fmul contract float %55, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %62, float addrspace(1)* %63, align 4, !tbaa !16
  %64 = add nsw i32 %48, %12
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %6, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = getelementptr inbounds float, float addrspace(1)* %8, i64 %65
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fdiv contract float %67, %69
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16
  %73 = fmul contract float %72, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %65
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = fdiv contract float %73, %75
  %77 = fmul contract float %70, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %77, float addrspace(1)* %78, align 4, !tbaa !16
  %79 = add nsw i32 %64, %12
  %80 = add i32 %49, 2
  %81 = icmp eq i32 %80, %46
  br i1 %81, label %82, label %47, !llvm.loop !20

82:                                               ; preds = %47, %42
  %83 = phi i32 [ %33, %42 ], [ %79, %47 ]
  %84 = icmp eq i32 %43, 0
  br i1 %84, label %100, label %85

85:                                               ; preds = %82
  %86 = sext i32 %83 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %6, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %8, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fdiv contract float %88, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fmul contract float %93, %93
  %95 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fdiv contract float %94, %96
  %98 = fmul contract float %91, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float %98, float addrspace(1)* %99, align 4, !tbaa !16
  br label %100

100:                                              ; preds = %85, %82, %40
  %101 = getelementptr inbounds float, float addrspace(1)* %7, i64 %36
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = getelementptr inbounds float, float addrspace(1)* %9, i64 %36
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fdiv contract float %102, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fmul contract float %107, %107
  %109 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fdiv contract float %108, %110
  %112 = fmul contract float %105, %111
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %112, float addrspace(1)* %113, align 4, !tbaa !16
  br label %114

114:                                              ; preds = %35, %100, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
