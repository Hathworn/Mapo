; ModuleID = '../data/hip_kernels/7729/39/main.cu'
source_filename = "../data/hip_kernels/7729/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16gHighwayBackwardPfS_S_PKfS1_S1_S1_m(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i64 %7) local_unnamed_addr #0 {
  %9 = icmp eq i64 %7, 0
  br i1 %9, label %28, label %10

10:                                               ; preds = %8
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = mul i32 %19, %15
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = udiv i32 %18, %15
  %23 = mul i32 %22, %15
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %15
  br label %29

28:                                               ; preds = %96, %8
  ret void

29:                                               ; preds = %10, %96
  %30 = phi i32 [ 0, %10 ], [ %97, %96 ]
  %31 = add i32 %30, %21
  %32 = add i32 %31, %20
  %33 = sext i32 %32 to i64
  %34 = icmp ult i64 %33, %7
  br i1 %34, label %35, label %96

35:                                               ; preds = %29
  %36 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %38 = fcmp contract ult float %37, 0.000000e+00
  br i1 %38, label %56, label %39

39:                                               ; preds = %35
  %40 = fneg contract float %37
  %41 = fmul float %37, 0xBFF7154760000000
  %42 = tail call float @llvm.rint.f32(float %41)
  %43 = fcmp olt float %37, 0xC0562E4300000000
  %44 = fcmp ogt float %37, 0x4059D1DA00000000
  %45 = fneg float %41
  %46 = tail call float @llvm.fma.f32(float %40, float 0x3FF7154760000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %40, float 0x3E54AE0BE0000000, float %46)
  %48 = fsub float %41, %42
  %49 = fadd float %47, %48
  %50 = tail call float @llvm.exp2.f32(float %49)
  %51 = fptosi float %42 to i32
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 %51)
  %53 = select i1 %44, float 0.000000e+00, float %52
  %54 = select i1 %43, float 0x7FF0000000000000, float %53
  %55 = fpext float %54 to double
  br label %72

56:                                               ; preds = %35
  %57 = fmul float %37, 0x3FF7154760000000
  %58 = tail call float @llvm.rint.f32(float %57)
  %59 = fcmp ogt float %37, 0x40562E4300000000
  %60 = fcmp olt float %37, 0xC059D1DA00000000
  %61 = fneg float %57
  %62 = tail call float @llvm.fma.f32(float %37, float 0x3FF7154760000000, float %61)
  %63 = tail call float @llvm.fma.f32(float %37, float 0x3E54AE0BE0000000, float %62)
  %64 = fsub float %57, %58
  %65 = fadd float %63, %64
  %66 = tail call float @llvm.exp2.f32(float %65)
  %67 = fptosi float %58 to i32
  %68 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 %67)
  %69 = select i1 %60, float 0.000000e+00, float %68
  %70 = select i1 %59, float 0x7FF0000000000000, float %69
  %71 = fpext float %70 to double
  br label %72

72:                                               ; preds = %39, %56
  %73 = phi double [ %71, %56 ], [ %55, %39 ]
  %74 = phi double [ %71, %56 ], [ 1.000000e+00, %39 ]
  %75 = fadd contract double %73, 1.000000e+00
  %76 = fdiv contract double %74, %75
  %77 = fptrunc double %76 to float
  %78 = getelementptr inbounds float, float addrspace(1)* %6, i64 %33
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fmul contract float %79, %77
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  store float %80, float addrspace(1)* %81, align 4, !tbaa !16
  %82 = fsub contract float 1.000000e+00, %77
  %83 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %84 = fmul contract float %82, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %84, float addrspace(1)* %85, align 4, !tbaa !16
  %86 = fmul contract float %82, %77
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fsub contract float %88, %90
  %92 = fmul contract float %86, %91
  %93 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %94 = fmul contract float %93, %92
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  store float %94, float addrspace(1)* %95, align 4, !tbaa !16
  br label %96

96:                                               ; preds = %72, %29
  %97 = add i32 %27, %30
  %98 = sext i32 %97 to i64
  %99 = icmp ult i64 %98, %7
  br i1 %99, label %29, label %28, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
