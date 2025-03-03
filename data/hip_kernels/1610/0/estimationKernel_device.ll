; ModuleID = '../data/hip_kernels/1610/0/main.cu'
source_filename = "../data/hip_kernels/1610/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16estimationKernelPfmS_mff(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture %2, i64 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %13
  %25 = sext i32 %18 to i64
  %26 = icmp ult i64 %25, %3
  br i1 %26, label %27, label %46

27:                                               ; preds = %6
  %28 = icmp eq i64 %1, 0
  %29 = uitofp i64 %1 to float
  %30 = fmul contract float %29, %5
  %31 = fpext float %30 to double
  %32 = tail call double @llvm.amdgcn.rsq.f64(double 0x401921FB54442D18)
  %33 = fmul double %32, 0x401921FB54442D18
  %34 = fmul double %32, 5.000000e-01
  %35 = fneg double %34
  %36 = tail call double @llvm.fma.f64(double %35, double %33, double 5.000000e-01)
  %37 = tail call double @llvm.fma.f64(double %34, double %36, double %34)
  %38 = tail call double @llvm.fma.f64(double %33, double %36, double %33)
  %39 = fneg double %38
  %40 = tail call double @llvm.fma.f64(double %39, double %38, double 0x401921FB54442D18)
  %41 = tail call double @llvm.fma.f64(double %40, double %37, double %38)
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double 0x401921FB54442D18)
  %44 = tail call double @llvm.fma.f64(double %43, double %37, double %41)
  %45 = fmul contract double %44, %31
  br label %47

46:                                               ; preds = %53, %6
  ret void

47:                                               ; preds = %27, %53
  %48 = phi i64 [ %25, %27 ], [ %59, %53 ]
  %49 = phi i32 [ %18, %27 ], [ %58, %53 ]
  %50 = sitofp i32 %49 to float
  %51 = fmul contract float %50, %4
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float 0.000000e+00, float addrspace(1)* %52, align 4, !tbaa !16
  br i1 %28, label %53, label %61

53:                                               ; preds = %61, %47
  %54 = phi float [ 0.000000e+00, %47 ], [ %85, %61 ]
  %55 = fpext float %54 to double
  %56 = fdiv contract double %55, %45
  %57 = fptrunc double %56 to float
  store float %57, float addrspace(1)* %52, align 4, !tbaa !16
  %58 = add nsw i32 %49, %24
  %59 = sext i32 %58 to i64
  %60 = icmp ult i64 %59, %3
  br i1 %60, label %47, label %46, !llvm.loop !20

61:                                               ; preds = %47, %61
  %62 = phi float [ %85, %61 ], [ 0.000000e+00, %47 ]
  %63 = phi i64 [ %87, %61 ], [ 0, %47 ]
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fsub contract float %51, %65
  %67 = fmul contract float %66, -5.000000e-01
  %68 = fmul contract float %66, %67
  %69 = fdiv contract float %68, %5
  %70 = fdiv contract float %69, %5
  %71 = fmul float %70, 0x3FF7154760000000
  %72 = tail call float @llvm.rint.f32(float %71)
  %73 = fcmp ogt float %70, 0x40562E4300000000
  %74 = fcmp olt float %70, 0xC059D1DA00000000
  %75 = fneg float %71
  %76 = tail call float @llvm.fma.f32(float %70, float 0x3FF7154760000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %70, float 0x3E54AE0BE0000000, float %76)
  %78 = fsub float %71, %72
  %79 = fadd float %77, %78
  %80 = tail call float @llvm.exp2.f32(float %79)
  %81 = fptosi float %72 to i32
  %82 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 %81)
  %83 = select i1 %74, float 0.000000e+00, float %82
  %84 = select i1 %73, float 0x7FF0000000000000, float %83
  %85 = fadd contract float %62, %84
  store float %85, float addrspace(1)* %52, align 4, !tbaa !16
  %86 = add nuw nsw i64 %63, 1
  %87 = and i64 %86, 4294967295
  %88 = icmp ult i64 %87, %1
  br i1 %88, label %61, label %53, !llvm.loop !22
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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
