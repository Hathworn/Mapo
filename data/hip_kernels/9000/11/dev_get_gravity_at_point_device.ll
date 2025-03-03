; ModuleID = '../data/hip_kernels/9000/11/main.cu'
source_filename = "../data/hip_kernels/9000/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24dev_get_gravity_at_pointfPfS_S_S_S_S_S_S_S_S_iS_S_S_S_S_S_S_i(float %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, i32 %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture readonly %18, i32 %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 12
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !7
  %31 = mul i32 %22, %27
  %32 = add i32 %31, %21
  %33 = icmp slt i32 %32, %11
  br i1 %33, label %34, label %42

34:                                               ; preds = %20
  %35 = icmp sgt i32 %19, 0
  %36 = udiv i32 %30, %27
  %37 = mul i32 %36, %27
  %38 = icmp ugt i32 %30, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %27
  br label %43

42:                                               ; preds = %60, %20
  ret void

43:                                               ; preds = %34, %60
  %44 = phi i32 [ %32, %34 ], [ %61, %60 ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %48, %0
  %50 = getelementptr inbounds float, float addrspace(1)* %8, i64 %45
  store float 0.000000e+00, float addrspace(1)* %50, align 4, !tbaa !16
  %51 = getelementptr inbounds float, float addrspace(1)* %9, i64 %45
  store float 0.000000e+00, float addrspace(1)* %51, align 4, !tbaa !16
  %52 = getelementptr inbounds float, float addrspace(1)* %10, i64 %45
  store float 0.000000e+00, float addrspace(1)* %52, align 4, !tbaa !16
  br i1 %35, label %53, label %60

53:                                               ; preds = %43
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %55 = getelementptr inbounds float, float addrspace(1)* %5, i64 %45
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %45
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %59 = getelementptr inbounds float, float addrspace(1)* %7, i64 %45
  br label %63

60:                                               ; preds = %135, %43
  %61 = add i32 %41, %44
  %62 = icmp slt i32 %61, %11
  br i1 %62, label %43, label %42, !llvm.loop !20

63:                                               ; preds = %53, %135
  %64 = phi i32 [ 0, %53 ], [ %136, %135 ]
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %13, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %69 = fsub contract float %67, %68
  %70 = getelementptr inbounds float, float addrspace(1)* %16, i64 %65
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  %73 = fsub contract float %71, %72
  %74 = fadd contract float %69, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %14, i64 %65
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %78 = fsub contract float %76, %77
  %79 = getelementptr inbounds float, float addrspace(1)* %17, i64 %65
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %82 = fsub contract float %80, %81
  %83 = fadd contract float %78, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %15, i64 %65
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %87 = fsub contract float %85, %86
  %88 = getelementptr inbounds float, float addrspace(1)* %18, i64 %65
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %91 = fsub contract float %89, %90
  %92 = fadd contract float %87, %91
  %93 = fmul contract float %74, %74
  %94 = fmul contract float %83, %83
  %95 = fadd contract float %93, %94
  %96 = fmul contract float %92, %92
  %97 = fadd contract float %95, %96
  %98 = fcmp contract ogt float %97, 0.000000e+00
  br i1 %98, label %99, label %135

99:                                               ; preds = %63
  %100 = fadd contract float %49, %97
  %101 = getelementptr inbounds float, float addrspace(1)* %12, i64 %65
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = fcmp olt float %100, 0x39F0000000000000
  %104 = select i1 %103, float 0x41F0000000000000, float 1.000000e+00
  %105 = fmul float %100, %104
  %106 = tail call float @llvm.sqrt.f32(float %105)
  %107 = bitcast float %106 to i32
  %108 = add nsw i32 %107, -1
  %109 = bitcast i32 %108 to float
  %110 = add nsw i32 %107, 1
  %111 = bitcast i32 %110 to float
  %112 = tail call i1 @llvm.amdgcn.class.f32(float %105, i32 608)
  %113 = select i1 %103, float 0x3EF0000000000000, float 1.000000e+00
  %114 = fneg float %111
  %115 = tail call float @llvm.fma.f32(float %114, float %106, float %105)
  %116 = fcmp ogt float %115, 0.000000e+00
  %117 = fneg float %109
  %118 = tail call float @llvm.fma.f32(float %117, float %106, float %105)
  %119 = fcmp ole float %118, 0.000000e+00
  %120 = select i1 %119, float %109, float %106
  %121 = select i1 %116, float %111, float %120
  %122 = fmul float %113, %121
  %123 = select i1 %112, float %105, float %122
  %124 = fmul contract float %100, %123
  %125 = fdiv contract float %102, %124
  %126 = fmul contract float %74, %125
  %127 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %128 = fadd contract float %127, %126
  store float %128, float addrspace(1)* %50, align 4, !tbaa !16
  %129 = fmul contract float %83, %125
  %130 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %131 = fadd contract float %129, %130
  store float %131, float addrspace(1)* %51, align 4, !tbaa !16
  %132 = fmul contract float %92, %125
  %133 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %134 = fadd contract float %132, %133
  store float %134, float addrspace(1)* %52, align 4, !tbaa !16
  br label %135

135:                                              ; preds = %63, %99
  %136 = add nuw nsw i32 %64, 1
  %137 = icmp eq i32 %136, %19
  br i1 %137, label %60, label %63, !llvm.loop !22
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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
