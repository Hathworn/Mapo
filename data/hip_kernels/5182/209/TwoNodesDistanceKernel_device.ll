; ModuleID = '../data/hip_kernels/5182/209/main.cu'
source_filename = "../data/hip_kernels/5182/209/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22TwoNodesDistanceKernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %13
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %12
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %20
  %24 = icmp slt i32 %23, 1
  br i1 %24, label %25, label %138

25:                                               ; preds = %3
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %27, label %51

27:                                               ; preds = %25
  %28 = mul nsw i32 %23, %2
  %29 = and i32 %2, 7
  %30 = icmp ult i32 %2, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %27
  %32 = and i32 %2, -8
  br label %76

33:                                               ; preds = %76, %27
  %34 = phi float [ undef, %27 ], [ %134, %76 ]
  %35 = phi i32 [ 0, %27 ], [ %135, %76 ]
  %36 = phi float [ 0.000000e+00, %27 ], [ %134, %76 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %51, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %48, %38 ], [ %35, %33 ]
  %40 = phi float [ %47, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %49, %38 ], [ 0, %33 ]
  %42 = add nsw i32 %39, %28
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !5
  %46 = fmul contract float %45, %45
  %47 = fadd contract float %40, %46
  %48 = add nuw nsw i32 %39, 1
  %49 = add i32 %41, 1
  %50 = icmp eq i32 %49, %29
  br i1 %50, label %51, label %38, !llvm.loop !20

51:                                               ; preds = %33, %38, %25
  %52 = phi float [ 0.000000e+00, %25 ], [ %34, %33 ], [ %47, %38 ]
  %53 = fcmp olt float %52, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = sext i32 %23 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  store float %73, float addrspace(1)* %75, align 4, !tbaa !16
  br label %138

76:                                               ; preds = %76, %31
  %77 = phi i32 [ 0, %31 ], [ %135, %76 ]
  %78 = phi float [ 0.000000e+00, %31 ], [ %134, %76 ]
  %79 = phi i32 [ 0, %31 ], [ %136, %76 ]
  %80 = add nsw i32 %77, %28
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %78, %84
  %86 = or i32 %77, 1
  %87 = add nsw i32 %86, %28
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = fmul contract float %90, %90
  %92 = fadd contract float %85, %91
  %93 = or i32 %77, 2
  %94 = add nsw i32 %93, %28
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16, !amdgpu.noclobber !5
  %98 = fmul contract float %97, %97
  %99 = fadd contract float %92, %98
  %100 = or i32 %77, 3
  %101 = add nsw i32 %100, %28
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !5
  %105 = fmul contract float %104, %104
  %106 = fadd contract float %99, %105
  %107 = or i32 %77, 4
  %108 = add nsw i32 %107, %28
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !16, !amdgpu.noclobber !5
  %112 = fmul contract float %111, %111
  %113 = fadd contract float %106, %112
  %114 = or i32 %77, 5
  %115 = add nsw i32 %114, %28
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16, !amdgpu.noclobber !5
  %119 = fmul contract float %118, %118
  %120 = fadd contract float %113, %119
  %121 = or i32 %77, 6
  %122 = add nsw i32 %121, %28
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !5
  %126 = fmul contract float %125, %125
  %127 = fadd contract float %120, %126
  %128 = or i32 %77, 7
  %129 = add nsw i32 %128, %28
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !5
  %133 = fmul contract float %132, %132
  %134 = fadd contract float %127, %133
  %135 = add nuw nsw i32 %77, 8
  %136 = add i32 %79, 8
  %137 = icmp eq i32 %136, %32
  br i1 %137, label %33, label %76, !llvm.loop !22

138:                                              ; preds = %51, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
