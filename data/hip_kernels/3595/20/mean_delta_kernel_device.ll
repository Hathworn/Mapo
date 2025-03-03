; ModuleID = '../data/hip_kernels/3595/20/main.cu'
source_filename = "../data/hip_kernels/3595/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17mean_delta_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %3
  br i1 %27, label %28, label %147

28:                                               ; preds = %6
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %5, i64 %29
  store float 0.000000e+00, float addrspace(1)* %30, align 4, !tbaa !16
  %31 = icmp sgt i32 %2, 0
  br i1 %31, label %32, label %119

32:                                               ; preds = %28
  %33 = icmp sgt i32 %4, 0
  %34 = and i32 %4, 7
  %35 = icmp ult i32 %4, 8
  %36 = and i32 %4, -8
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %32, %115
  %39 = phi float [ 0.000000e+00, %32 ], [ %116, %115 ]
  %40 = phi i32 [ 0, %32 ], [ %117, %115 ]
  br i1 %33, label %41, label %115

41:                                               ; preds = %38
  %42 = mul nsw i32 %40, %3
  %43 = add i32 %42, %26
  %44 = mul i32 %43, %4
  br i1 %35, label %99, label %45

45:                                               ; preds = %41, %45
  %46 = phi float [ %95, %45 ], [ %39, %41 ]
  %47 = phi i32 [ %96, %45 ], [ 0, %41 ]
  %48 = phi i32 [ %97, %45 ], [ 0, %41 ]
  %49 = add nsw i32 %47, %44
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = fadd contract float %52, %46
  store float %53, float addrspace(1)* %30, align 4, !tbaa !16
  %54 = or i32 %47, 1
  %55 = add nsw i32 %54, %44
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fadd contract float %58, %53
  store float %59, float addrspace(1)* %30, align 4, !tbaa !16
  %60 = or i32 %47, 2
  %61 = add nsw i32 %60, %44
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fadd contract float %64, %59
  store float %65, float addrspace(1)* %30, align 4, !tbaa !16
  %66 = or i32 %47, 3
  %67 = add nsw i32 %66, %44
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fadd contract float %70, %65
  store float %71, float addrspace(1)* %30, align 4, !tbaa !16
  %72 = or i32 %47, 4
  %73 = add nsw i32 %72, %44
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = fadd contract float %76, %71
  store float %77, float addrspace(1)* %30, align 4, !tbaa !16
  %78 = or i32 %47, 5
  %79 = add nsw i32 %78, %44
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fadd contract float %82, %77
  store float %83, float addrspace(1)* %30, align 4, !tbaa !16
  %84 = or i32 %47, 6
  %85 = add nsw i32 %84, %44
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fadd contract float %88, %83
  store float %89, float addrspace(1)* %30, align 4, !tbaa !16
  %90 = or i32 %47, 7
  %91 = add nsw i32 %90, %44
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fadd contract float %94, %89
  store float %95, float addrspace(1)* %30, align 4, !tbaa !16
  %96 = add nuw nsw i32 %47, 8
  %97 = add i32 %48, 8
  %98 = icmp eq i32 %97, %36
  br i1 %98, label %99, label %45, !llvm.loop !20

99:                                               ; preds = %45, %41
  %100 = phi float [ undef, %41 ], [ %95, %45 ]
  %101 = phi float [ %39, %41 ], [ %95, %45 ]
  %102 = phi i32 [ 0, %41 ], [ %96, %45 ]
  br i1 %37, label %115, label %103

103:                                              ; preds = %99, %103
  %104 = phi float [ %111, %103 ], [ %101, %99 ]
  %105 = phi i32 [ %112, %103 ], [ %102, %99 ]
  %106 = phi i32 [ %113, %103 ], [ 0, %99 ]
  %107 = add nsw i32 %105, %44
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fadd contract float %110, %104
  store float %111, float addrspace(1)* %30, align 4, !tbaa !16
  %112 = add nuw nsw i32 %105, 1
  %113 = add i32 %106, 1
  %114 = icmp eq i32 %113, %34
  br i1 %114, label %115, label %103, !llvm.loop !22

115:                                              ; preds = %99, %103, %38
  %116 = phi float [ %39, %38 ], [ %100, %99 ], [ %111, %103 ]
  %117 = add nuw nsw i32 %40, 1
  %118 = icmp eq i32 %117, %2
  br i1 %118, label %119, label %38, !llvm.loop !24

119:                                              ; preds = %115, %28
  %120 = phi float [ 0.000000e+00, %28 ], [ %116, %115 ]
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = fadd contract float %122, 0x3EE4F8B580000000
  %124 = fcmp olt float %123, 0x39F0000000000000
  %125 = select i1 %124, float 0x41F0000000000000, float 1.000000e+00
  %126 = fmul float %123, %125
  %127 = tail call float @llvm.sqrt.f32(float %126)
  %128 = bitcast float %127 to i32
  %129 = add nsw i32 %128, -1
  %130 = bitcast i32 %129 to float
  %131 = add nsw i32 %128, 1
  %132 = bitcast i32 %131 to float
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %126, i32 608)
  %134 = select i1 %124, float 0x3EF0000000000000, float 1.000000e+00
  %135 = fneg float %132
  %136 = tail call float @llvm.fma.f32(float %135, float %127, float %126)
  %137 = fcmp ogt float %136, 0.000000e+00
  %138 = fneg float %130
  %139 = tail call float @llvm.fma.f32(float %138, float %127, float %126)
  %140 = fcmp ole float %139, 0.000000e+00
  %141 = select i1 %140, float %130, float %127
  %142 = select i1 %137, float %132, float %141
  %143 = fmul float %134, %142
  %144 = select i1 %133, float %126, float %143
  %145 = fdiv contract float -1.000000e+00, %144
  %146 = fmul contract float %120, %145
  store float %146, float addrspace(1)* %30, align 4, !tbaa !16
  br label %147

147:                                              ; preds = %6, %119
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
