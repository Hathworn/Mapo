; ModuleID = '../data/hip_kernels/9664/12/main.cu'
source_filename = "../data/hip_kernels/9664/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26dev_get_potential_at_pointfPfS_S_S_S_S_S_S_iS_S_S_S_S_S_S_i(float %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, i32 %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture readonly %15, float addrspace(1)* nocapture readonly %16, i32 %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !7
  %29 = mul i32 %20, %25
  %30 = add i32 %29, %19
  %31 = icmp slt i32 %30, %9
  br i1 %31, label %32, label %40

32:                                               ; preds = %18
  %33 = icmp sgt i32 %17, 0
  %34 = udiv i32 %28, %25
  %35 = mul i32 %34, %25
  %36 = icmp ugt i32 %28, %35
  %37 = zext i1 %36 to i32
  %38 = add i32 %34, %37
  %39 = mul i32 %38, %25
  br label %41

40:                                               ; preds = %56, %18
  ret void

41:                                               ; preds = %32, %56
  %42 = phi i32 [ %30, %32 ], [ %57, %56 ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = fmul contract float %45, %45
  %47 = fadd contract float %46, %0
  %48 = getelementptr inbounds float, float addrspace(1)* %8, i64 %43
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !16
  br i1 %33, label %49, label %56

49:                                               ; preds = %41
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %43
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %53 = getelementptr inbounds float, float addrspace(1)* %6, i64 %43
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %55 = getelementptr inbounds float, float addrspace(1)* %7, i64 %43
  br label %59

56:                                               ; preds = %123, %41
  %57 = add i32 %39, %42
  %58 = icmp slt i32 %57, %9
  br i1 %58, label %41, label %40, !llvm.loop !20

59:                                               ; preds = %49, %123
  %60 = phi float [ 0.000000e+00, %49 ], [ %124, %123 ]
  %61 = phi i32 [ 0, %49 ], [ %125, %123 ]
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %11, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %66 = fsub contract float %64, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %14, i64 %62
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %70 = fsub contract float %68, %69
  %71 = fadd contract float %66, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %12, i64 %62
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %75 = fsub contract float %73, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %15, i64 %62
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %79 = fsub contract float %77, %78
  %80 = fadd contract float %75, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %13, i64 %62
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %84 = fsub contract float %82, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %16, i64 %62
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  %88 = fsub contract float %86, %87
  %89 = fadd contract float %84, %88
  %90 = fmul contract float %71, %71
  %91 = fmul contract float %80, %80
  %92 = fadd contract float %90, %91
  %93 = fmul contract float %89, %89
  %94 = fadd contract float %92, %93
  %95 = fcmp contract ogt float %94, 0.000000e+00
  br i1 %95, label %96, label %123

96:                                               ; preds = %59
  %97 = fadd contract float %47, %94
  %98 = fcmp olt float %97, 0x39F0000000000000
  %99 = select i1 %98, float 0x41F0000000000000, float 1.000000e+00
  %100 = fmul float %97, %99
  %101 = tail call float @llvm.sqrt.f32(float %100)
  %102 = bitcast float %101 to i32
  %103 = add nsw i32 %102, -1
  %104 = bitcast i32 %103 to float
  %105 = add nsw i32 %102, 1
  %106 = bitcast i32 %105 to float
  %107 = tail call i1 @llvm.amdgcn.class.f32(float %100, i32 608)
  %108 = select i1 %98, float 0x3EF0000000000000, float 1.000000e+00
  %109 = fneg float %106
  %110 = tail call float @llvm.fma.f32(float %109, float %101, float %100)
  %111 = fcmp ogt float %110, 0.000000e+00
  %112 = fneg float %104
  %113 = tail call float @llvm.fma.f32(float %112, float %101, float %100)
  %114 = fcmp ole float %113, 0.000000e+00
  %115 = select i1 %114, float %104, float %101
  %116 = select i1 %111, float %106, float %115
  %117 = fmul float %108, %116
  %118 = select i1 %107, float %100, float %117
  %119 = getelementptr inbounds float, float addrspace(1)* %10, i64 %62
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fdiv contract float %120, %118
  %122 = fsub contract float %60, %121
  store float %122, float addrspace(1)* %48, align 4, !tbaa !16
  br label %123

123:                                              ; preds = %59, %96
  %124 = phi float [ %60, %59 ], [ %122, %96 ]
  %125 = add nuw nsw i32 %61, 1
  %126 = icmp eq i32 %125, %17
  br i1 %126, label %56, label %59, !llvm.loop !22
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
