; ModuleID = '../data/hip_kernels/5182/149/main.cu'
source_filename = "../data/hip_kernels/5182/149/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29FullyConnectedCurvatureKernelPfS_S_S_S_S_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = icmp slt i32 %31, %10
  br i1 %32, label %33, label %129

33:                                               ; preds = %11
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %8, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !5
  %37 = fcmp contract une float %36, 0.000000e+00
  br i1 %37, label %129, label %38

38:                                               ; preds = %33
  %39 = icmp sgt i32 %9, 0
  br i1 %39, label %40, label %118

40:                                               ; preds = %38
  %41 = and i32 %9, 3
  %42 = icmp ult i32 %9, 4
  br i1 %42, label %98, label %43

43:                                               ; preds = %40
  %44 = and i32 %9, -4
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ %31, %43 ], [ %95, %45 ]
  %47 = phi i32 [ 0, %43 ], [ %96, %45 ]
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fsub contract float %52, %54
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = fdiv contract float %56, %50
  %58 = getelementptr inbounds float, float addrspace(1)* %6, i64 %48
  store float %57, float addrspace(1)* %58, align 4, !tbaa !16
  %59 = add nsw i32 %46, %10
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fsub contract float %64, %66
  %68 = tail call float @llvm.fabs.f32(float %67)
  %69 = fdiv contract float %68, %62
  %70 = getelementptr inbounds float, float addrspace(1)* %6, i64 %60
  store float %69, float addrspace(1)* %70, align 4, !tbaa !16
  %71 = add nsw i32 %59, %10
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fsub contract float %76, %78
  %80 = tail call float @llvm.fabs.f32(float %79)
  %81 = fdiv contract float %80, %74
  %82 = getelementptr inbounds float, float addrspace(1)* %6, i64 %72
  store float %81, float addrspace(1)* %82, align 4, !tbaa !16
  %83 = add nsw i32 %71, %10
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fsub contract float %88, %90
  %92 = tail call float @llvm.fabs.f32(float %91)
  %93 = fdiv contract float %92, %86
  %94 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  store float %93, float addrspace(1)* %94, align 4, !tbaa !16
  %95 = add nsw i32 %83, %10
  %96 = add i32 %47, 4
  %97 = icmp eq i32 %96, %44
  br i1 %97, label %98, label %45, !llvm.loop !20

98:                                               ; preds = %45, %40
  %99 = phi i32 [ %31, %40 ], [ %95, %45 ]
  %100 = icmp eq i32 %41, 0
  br i1 %100, label %118, label %101

101:                                              ; preds = %98, %101
  %102 = phi i32 [ %115, %101 ], [ %99, %98 ]
  %103 = phi i32 [ %116, %101 ], [ 0, %98 ]
  %104 = sext i32 %102 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fsub contract float %108, %110
  %112 = tail call float @llvm.fabs.f32(float %111)
  %113 = fdiv contract float %112, %106
  %114 = getelementptr inbounds float, float addrspace(1)* %6, i64 %104
  store float %113, float addrspace(1)* %114, align 4, !tbaa !16
  %115 = add nsw i32 %102, %10
  %116 = add i32 %103, 1
  %117 = icmp eq i32 %116, %41
  br i1 %117, label %118, label %101, !llvm.loop !22

118:                                              ; preds = %98, %101, %38
  %119 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fsub contract float %122, %124
  %126 = tail call float @llvm.fabs.f32(float %125)
  %127 = fdiv contract float %126, %120
  %128 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  store float %127, float addrspace(1)* %128, align 4, !tbaa !16
  br label %129

129:                                              ; preds = %33, %118, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
