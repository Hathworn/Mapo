; ModuleID = '../data/hip_kernels/5182/337/main.cu'
source_filename = "../data/hip_kernels/5182/337/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15ThresholdKernelffiPfS_iiE5delta = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15ThresholdKernelffiPfS_ii(float %0, float %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = icmp slt i32 %27, %5
  br i1 %28, label %29, label %127

29:                                               ; preds = %7
  %30 = icmp eq i32 %24, 0
  br i1 %30, label %31, label %35

31:                                               ; preds = %29
  %32 = fsub contract float %1, %0
  %33 = sitofp i32 %6 to float
  %34 = fdiv contract float %32, %33
  store float %34, float addrspace(3)* @_ZZ15ThresholdKernelffiPfS_iiE5delta, align 4, !tbaa !16
  br label %35

35:                                               ; preds = %31, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp sgt i32 %6, 0
  br i1 %36, label %37, label %55

37:                                               ; preds = %35
  %38 = and i32 %6, 7
  %39 = icmp ult i32 %6, 8
  br i1 %39, label %42, label %40

40:                                               ; preds = %37
  %41 = and i32 %6, -8
  br label %62

42:                                               ; preds = %62, %37
  %43 = phi i32 [ 0, %37 ], [ %104, %62 ]
  %44 = icmp eq i32 %38, 0
  br i1 %44, label %55, label %45

45:                                               ; preds = %42, %45
  %46 = phi i32 [ %52, %45 ], [ %43, %42 ]
  %47 = phi i32 [ %53, %45 ], [ 0, %42 ]
  %48 = mul nsw i32 %46, %5
  %49 = add nsw i32 %48, %27
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  store float 0.000000e+00, float addrspace(1)* %51, align 4, !tbaa !16
  %52 = add nuw nsw i32 %46, 1
  %53 = add i32 %47, 1
  %54 = icmp eq i32 %53, %38
  br i1 %54, label %55, label %45, !llvm.loop !20

55:                                               ; preds = %42, %45, %35
  %56 = sext i32 %27 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fsub contract float %58, %0
  %60 = load float, float addrspace(3)* @_ZZ15ThresholdKernelffiPfS_iiE5delta, align 4, !tbaa !16
  %61 = fdiv contract float %59, %60
  switch i32 %2, label %121 [
    i32 0, label %107
    i32 1, label %114
  ]

62:                                               ; preds = %62, %40
  %63 = phi i32 [ 0, %40 ], [ %104, %62 ]
  %64 = phi i32 [ 0, %40 ], [ %105, %62 ]
  %65 = mul nsw i32 %63, %5
  %66 = add nsw i32 %65, %27
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  store float 0.000000e+00, float addrspace(1)* %68, align 4, !tbaa !16
  %69 = or i32 %63, 1
  %70 = mul nsw i32 %69, %5
  %71 = add nsw i32 %70, %27
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %72
  store float 0.000000e+00, float addrspace(1)* %73, align 4, !tbaa !16
  %74 = or i32 %63, 2
  %75 = mul nsw i32 %74, %5
  %76 = add nsw i32 %75, %27
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  store float 0.000000e+00, float addrspace(1)* %78, align 4, !tbaa !16
  %79 = or i32 %63, 3
  %80 = mul nsw i32 %79, %5
  %81 = add nsw i32 %80, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %82
  store float 0.000000e+00, float addrspace(1)* %83, align 4, !tbaa !16
  %84 = or i32 %63, 4
  %85 = mul nsw i32 %84, %5
  %86 = add nsw i32 %85, %27
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  store float 0.000000e+00, float addrspace(1)* %88, align 4, !tbaa !16
  %89 = or i32 %63, 5
  %90 = mul nsw i32 %89, %5
  %91 = add nsw i32 %90, %27
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %4, i64 %92
  store float 0.000000e+00, float addrspace(1)* %93, align 4, !tbaa !16
  %94 = or i32 %63, 6
  %95 = mul nsw i32 %94, %5
  %96 = add nsw i32 %95, %27
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %4, i64 %97
  store float 0.000000e+00, float addrspace(1)* %98, align 4, !tbaa !16
  %99 = or i32 %63, 7
  %100 = mul nsw i32 %99, %5
  %101 = add nsw i32 %100, %27
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  store float 0.000000e+00, float addrspace(1)* %103, align 4, !tbaa !16
  %104 = add nuw nsw i32 %63, 8
  %105 = add i32 %64, 8
  %106 = icmp eq i32 %105, %41
  br i1 %106, label %42, label %62, !llvm.loop !22

107:                                              ; preds = %55
  %108 = add nsw i32 %6, -1
  %109 = sitofp i32 %108 to float
  %110 = tail call float @llvm.minnum.f32(float %61, float %109)
  %111 = tail call float @llvm.maxnum.f32(float %110, float 0.000000e+00)
  %112 = tail call float @llvm.floor.f32(float %111)
  %113 = fptosi float %112 to i32
  br label %121

114:                                              ; preds = %55
  %115 = fcmp contract uge float %61, 0.000000e+00
  %116 = sitofp i32 %6 to float
  %117 = fcmp contract ult float %61, %116
  %118 = select i1 %115, i1 %117, i1 false
  br i1 %118, label %119, label %127

119:                                              ; preds = %114
  %120 = fptosi float %61 to i32
  br label %121

121:                                              ; preds = %55, %119, %107
  %122 = phi i32 [ undef, %55 ], [ %120, %119 ], [ %113, %107 ]
  %123 = mul nsw i32 %122, %5
  %124 = add nsw i32 %123, %27
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %4, i64 %125
  store float 1.000000e+00, float addrspace(1)* %126, align 4, !tbaa !16
  br label %127

127:                                              ; preds = %7, %121, %114
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
