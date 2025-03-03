; ModuleID = '../data/hip_kernels/3557/74/main.cu'
source_filename = "../data/hip_kernels/3557/74/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34cudaDSoftplus_backPropagate_kernelPdS_j(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %24, %3
  ret void

24:                                               ; preds = %3, %24
  %25 = phi i32 [ %56, %24 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %0, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !16
  %29 = fneg contract double %28
  %30 = fmul double %28, 0xBFF71547652B82FE
  %31 = tail call double @llvm.rint.f64(double %30)
  %32 = fneg double %31
  %33 = tail call double @llvm.fma.f64(double %32, double 0x3FE62E42FEFA39EF, double %29)
  %34 = tail call double @llvm.fma.f64(double %32, double 0x3C7ABC9E3B39803F, double %33)
  %35 = tail call double @llvm.fma.f64(double %34, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %36 = tail call double @llvm.fma.f64(double %34, double %35, double 0x3EC71DEE623FDE64)
  %37 = tail call double @llvm.fma.f64(double %34, double %36, double 0x3EFA01997C89E6B0)
  %38 = tail call double @llvm.fma.f64(double %34, double %37, double 0x3F2A01A014761F6E)
  %39 = tail call double @llvm.fma.f64(double %34, double %38, double 0x3F56C16C1852B7B0)
  %40 = tail call double @llvm.fma.f64(double %34, double %39, double 0x3F81111111122322)
  %41 = tail call double @llvm.fma.f64(double %34, double %40, double 0x3FA55555555502A1)
  %42 = tail call double @llvm.fma.f64(double %34, double %41, double 0x3FC5555555555511)
  %43 = tail call double @llvm.fma.f64(double %34, double %42, double 0x3FE000000000000B)
  %44 = tail call double @llvm.fma.f64(double %34, double %43, double 1.000000e+00)
  %45 = tail call double @llvm.fma.f64(double %34, double %44, double 1.000000e+00)
  %46 = fptosi double %31 to i32
  %47 = tail call double @llvm.amdgcn.ldexp.f64(double %45, i32 %46)
  %48 = fcmp olt double %28, -1.024000e+03
  %49 = fcmp ogt double %28, 1.075000e+03
  %50 = fsub contract double 1.000000e+00, %47
  %51 = select i1 %48, double 0xFFF0000000000000, double %50
  %52 = select i1 %49, double 1.000000e+00, double %51
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16
  %55 = fmul contract double %54, %52
  store double %55, double addrspace(1)* %53, align 8, !tbaa !16
  %56 = add i32 %25, %21
  %57 = icmp ult i32 %56, %2
  br i1 %57, label %24, label %23, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
