; ModuleID = '../data/hip_kernels/15618/4/main.cu'
source_filename = "../data/hip_kernels/15618/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23computePositionParallelPfS_S_S_S_iPi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = icmp slt i32 %19, %5
  br i1 %26, label %28, label %27

27:                                               ; preds = %125, %7
  ret void

28:                                               ; preds = %7, %125
  %29 = phi i32 [ %126, %125 ], [ %19, %7 ]
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = fcmp contract oeq float %32, -1.000000e+00
  br i1 %33, label %125, label %34

34:                                               ; preds = %28
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fcmp contract oeq float %36, -1.000000e+00
  br i1 %37, label %125, label %38

38:                                               ; preds = %34
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = fsub contract float %32, %40
  %42 = fpext float %41 to double
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %45 = fsub contract float %36, %44
  %46 = fpext float %45 to double
  %47 = fmul contract double %42, %42
  %48 = fmul contract double %46, %46
  %49 = fadd contract double %47, %48
  %50 = fptrunc double %49 to float
  %51 = fcmp olt float %50, 0x39F0000000000000
  %52 = select i1 %51, float 0x41F0000000000000, float 1.000000e+00
  %53 = fmul float %52, %50
  %54 = tail call float @llvm.sqrt.f32(float %53)
  %55 = bitcast float %54 to i32
  %56 = add nsw i32 %55, -1
  %57 = bitcast i32 %56 to float
  %58 = add nsw i32 %55, 1
  %59 = bitcast i32 %58 to float
  %60 = tail call i1 @llvm.amdgcn.class.f32(float %53, i32 608)
  %61 = select i1 %51, float 0x3EF0000000000000, float 1.000000e+00
  %62 = fneg float %59
  %63 = tail call float @llvm.fma.f32(float %62, float %54, float %53)
  %64 = fcmp ogt float %63, 0.000000e+00
  %65 = fneg float %57
  %66 = tail call float @llvm.fma.f32(float %65, float %54, float %53)
  %67 = fcmp ole float %66, 0.000000e+00
  %68 = select i1 %67, float %57, float %54
  %69 = select i1 %64, float %59, float %68
  %70 = fmul float %61, %69
  %71 = select i1 %60, float %53, float %70
  %72 = fpext float %71 to double
  %73 = fpext float %40 to double
  %74 = fdiv contract double %42, %72
  %75 = fadd contract double %74, %73
  %76 = fptrunc double %75 to float
  %77 = tail call float @llvm.rint.f32(float %76)
  %78 = fptosi float %77 to i64
  %79 = sitofp i64 %78 to float
  store float %79, float addrspace(1)* %39, align 4, !tbaa !16
  %80 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %81 = fpext float %80 to double
  %82 = fdiv contract double %46, %72
  %83 = fadd contract double %82, %81
  %84 = fptrunc double %83 to float
  %85 = tail call float @llvm.rint.f32(float %84)
  %86 = fptosi float %85 to i64
  %87 = sitofp i64 %86 to float
  store float %87, float addrspace(1)* %43, align 4, !tbaa !16
  %88 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %89 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %90 = fsub contract float %88, %89
  %91 = fpext float %90 to double
  %92 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %93 = fsub contract float %92, %87
  %94 = fpext float %93 to double
  %95 = fmul contract double %91, %91
  %96 = fmul contract double %94, %94
  %97 = fadd contract double %95, %96
  %98 = fptrunc double %97 to float
  %99 = fcmp olt float %98, 0x39F0000000000000
  %100 = select i1 %99, float 0x41F0000000000000, float 1.000000e+00
  %101 = fmul float %100, %98
  %102 = tail call float @llvm.sqrt.f32(float %101)
  %103 = bitcast float %102 to i32
  %104 = add nsw i32 %103, -1
  %105 = bitcast i32 %104 to float
  %106 = add nsw i32 %103, 1
  %107 = bitcast i32 %106 to float
  %108 = tail call i1 @llvm.amdgcn.class.f32(float %101, i32 608)
  %109 = select i1 %99, float 0x3EF0000000000000, float 1.000000e+00
  %110 = fneg float %107
  %111 = tail call float @llvm.fma.f32(float %110, float %102, float %101)
  %112 = fcmp ogt float %111, 0.000000e+00
  %113 = fneg float %105
  %114 = tail call float @llvm.fma.f32(float %113, float %102, float %101)
  %115 = fcmp ole float %114, 0.000000e+00
  %116 = select i1 %115, float %105, float %102
  %117 = select i1 %112, float %107, float %116
  %118 = fmul float %109, %117
  %119 = select i1 %108, float %101, float %118
  %120 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = fcmp contract olt float %119, %121
  br i1 %122, label %123, label %125

123:                                              ; preds = %38
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %30
  store i32 1, i32 addrspace(1)* %124, align 4, !tbaa !20
  br label %125

125:                                              ; preds = %38, %123, %28, %34
  %126 = add nsw i32 %29, %25
  %127 = icmp slt i32 %126, %5
  br i1 %127, label %28, label %27, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
