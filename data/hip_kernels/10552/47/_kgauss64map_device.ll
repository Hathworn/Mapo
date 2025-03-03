; ModuleID = '../data/hip_kernels/10552/47/main.cu'
source_filename = "../data/hip_kernels/10552/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12_kgauss64mapiiPdS_S_d(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4, double %5) local_unnamed_addr #0 {
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
  %19 = mul nsw i32 %1, %0
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %73

21:                                               ; preds = %6
  %22 = fneg contract double %5
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  br label %29

29:                                               ; preds = %21, %29
  %30 = phi i32 [ %18, %21 ], [ %71, %29 ]
  %31 = freeze i32 %30
  %32 = freeze i32 %0
  %33 = sdiv i32 %31, %32
  %34 = mul i32 %33, %32
  %35 = sub i32 %31, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16
  %39 = sext i32 %33 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %3, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = fadd contract double %38, %41
  %43 = sext i32 %30 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %4, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !16
  %46 = fmul contract double %45, 2.000000e+00
  %47 = fsub contract double %42, %46
  %48 = fmul contract double %47, %22
  %49 = fmul double %48, 0x3FF71547652B82FE
  %50 = tail call double @llvm.rint.f64(double %49)
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3FE62E42FEFA39EF, double %48)
  %53 = tail call double @llvm.fma.f64(double %51, double 0x3C7ABC9E3B39803F, double %52)
  %54 = tail call double @llvm.fma.f64(double %53, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %55 = tail call double @llvm.fma.f64(double %53, double %54, double 0x3EC71DEE623FDE64)
  %56 = tail call double @llvm.fma.f64(double %53, double %55, double 0x3EFA01997C89E6B0)
  %57 = tail call double @llvm.fma.f64(double %53, double %56, double 0x3F2A01A014761F6E)
  %58 = tail call double @llvm.fma.f64(double %53, double %57, double 0x3F56C16C1852B7B0)
  %59 = tail call double @llvm.fma.f64(double %53, double %58, double 0x3F81111111122322)
  %60 = tail call double @llvm.fma.f64(double %53, double %59, double 0x3FA55555555502A1)
  %61 = tail call double @llvm.fma.f64(double %53, double %60, double 0x3FC5555555555511)
  %62 = tail call double @llvm.fma.f64(double %53, double %61, double 0x3FE000000000000B)
  %63 = tail call double @llvm.fma.f64(double %53, double %62, double 1.000000e+00)
  %64 = tail call double @llvm.fma.f64(double %53, double %63, double 1.000000e+00)
  %65 = fptosi double %50 to i32
  %66 = tail call double @llvm.amdgcn.ldexp.f64(double %64, i32 %65)
  %67 = fcmp ogt double %48, 1.024000e+03
  %68 = select i1 %67, double 0x7FF0000000000000, double %66
  %69 = fcmp olt double %48, -1.075000e+03
  %70 = select i1 %69, double 0.000000e+00, double %68
  store double %70, double addrspace(1)* %44, align 8, !tbaa !16
  %71 = add i32 %28, %30
  %72 = icmp slt i32 %71, %19
  br i1 %72, label %29, label %73, !llvm.loop !20

73:                                               ; preds = %29, %6
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
