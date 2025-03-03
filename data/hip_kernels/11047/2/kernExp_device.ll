; ModuleID = '../data/hip_kernels/11047/2/main.cu'
source_filename = "../data/hip_kernels/11047/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7kernExpPdS_(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = mul i32 %16, %3
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = add i32 %17, %18
  %20 = mul i32 %19, %11
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !16, !amdgpu.noclobber !14
  %26 = load double, double addrspace(1)* %1, align 8, !tbaa !16, !amdgpu.noclobber !14
  %27 = fsub contract double %25, %26
  %28 = fmul double %27, 0x3FF71547652B82FE
  %29 = tail call double @llvm.rint.f64(double %28)
  %30 = fneg double %29
  %31 = tail call double @llvm.fma.f64(double %30, double 0x3FE62E42FEFA39EF, double %27)
  %32 = tail call double @llvm.fma.f64(double %30, double 0x3C7ABC9E3B39803F, double %31)
  %33 = tail call double @llvm.fma.f64(double %32, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %34 = tail call double @llvm.fma.f64(double %32, double %33, double 0x3EC71DEE623FDE64)
  %35 = tail call double @llvm.fma.f64(double %32, double %34, double 0x3EFA01997C89E6B0)
  %36 = tail call double @llvm.fma.f64(double %32, double %35, double 0x3F2A01A014761F6E)
  %37 = tail call double @llvm.fma.f64(double %32, double %36, double 0x3F56C16C1852B7B0)
  %38 = tail call double @llvm.fma.f64(double %32, double %37, double 0x3F81111111122322)
  %39 = tail call double @llvm.fma.f64(double %32, double %38, double 0x3FA55555555502A1)
  %40 = tail call double @llvm.fma.f64(double %32, double %39, double 0x3FC5555555555511)
  %41 = tail call double @llvm.fma.f64(double %32, double %40, double 0x3FE000000000000B)
  %42 = tail call double @llvm.fma.f64(double %32, double %41, double 1.000000e+00)
  %43 = tail call double @llvm.fma.f64(double %32, double %42, double 1.000000e+00)
  %44 = fptosi double %29 to i32
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %43, i32 %44)
  %46 = fcmp ogt double %27, 1.024000e+03
  %47 = select i1 %46, double 0x7FF0000000000000, double %45
  %48 = fcmp olt double %27, -1.075000e+03
  %49 = select i1 %48, double 0.000000e+00, double %47
  store double %49, double addrspace(1)* %24, align 8, !tbaa !16
  ret void
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
