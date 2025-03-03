; ModuleID = '../data/hip_kernels/7729/38/main.cu'
source_filename = "../data/hip_kernels/7729/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gHighwayForwardPfPKfS1_S1_m(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %25, label %7

7:                                                ; preds = %5
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %12
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  br label %26

25:                                               ; preds = %84, %5
  ret void

26:                                               ; preds = %7, %84
  %27 = phi i32 [ 0, %7 ], [ %85, %84 ]
  %28 = add i32 %27, %18
  %29 = add i32 %28, %17
  %30 = sext i32 %29 to i64
  %31 = icmp ult i64 %30, %4
  br i1 %31, label %32, label %84

32:                                               ; preds = %26
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fcmp contract ult float %34, 0.000000e+00
  br i1 %35, label %53, label %36

36:                                               ; preds = %32
  %37 = fneg contract float %34
  %38 = fmul float %34, 0xBFF7154760000000
  %39 = tail call float @llvm.rint.f32(float %38)
  %40 = fcmp olt float %34, 0xC0562E4300000000
  %41 = fcmp ogt float %34, 0x4059D1DA00000000
  %42 = fneg float %38
  %43 = tail call float @llvm.fma.f32(float %37, float 0x3FF7154760000000, float %42)
  %44 = tail call float @llvm.fma.f32(float %37, float 0x3E54AE0BE0000000, float %43)
  %45 = fsub float %38, %39
  %46 = fadd float %44, %45
  %47 = tail call float @llvm.exp2.f32(float %46)
  %48 = fptosi float %39 to i32
  %49 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %48)
  %50 = select i1 %41, float 0.000000e+00, float %49
  %51 = select i1 %40, float 0x7FF0000000000000, float %50
  %52 = fpext float %51 to double
  br label %69

53:                                               ; preds = %32
  %54 = fmul float %34, 0x3FF7154760000000
  %55 = tail call float @llvm.rint.f32(float %54)
  %56 = fcmp ogt float %34, 0x40562E4300000000
  %57 = fcmp olt float %34, 0xC059D1DA00000000
  %58 = fneg float %54
  %59 = tail call float @llvm.fma.f32(float %34, float 0x3FF7154760000000, float %58)
  %60 = tail call float @llvm.fma.f32(float %34, float 0x3E54AE0BE0000000, float %59)
  %61 = fsub float %54, %55
  %62 = fadd float %60, %61
  %63 = tail call float @llvm.exp2.f32(float %62)
  %64 = fptosi float %55 to i32
  %65 = tail call float @llvm.amdgcn.ldexp.f32(float %63, i32 %64)
  %66 = select i1 %57, float 0.000000e+00, float %65
  %67 = select i1 %56, float 0x7FF0000000000000, float %66
  %68 = fpext float %67 to double
  br label %69

69:                                               ; preds = %36, %53
  %70 = phi double [ %68, %53 ], [ %52, %36 ]
  %71 = phi double [ %68, %53 ], [ 1.000000e+00, %36 ]
  %72 = fadd contract double %70, 1.000000e+00
  %73 = fdiv contract double %71, %72
  %74 = fptrunc double %73 to float
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = fmul contract float %76, %74
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fsub contract float 1.000000e+00, %74
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %77, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  store float %82, float addrspace(1)* %83, align 4, !tbaa !16
  br label %84

84:                                               ; preds = %69, %26
  %85 = add i32 %24, %27
  %86 = sext i32 %85 to i64
  %87 = icmp ult i64 %86, %4
  br i1 %87, label %26, label %25, !llvm.loop !20
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
