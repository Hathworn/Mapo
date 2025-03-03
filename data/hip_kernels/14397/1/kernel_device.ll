; ModuleID = '../data/hip_kernels/14397/1/main.cu'
source_filename = "../data/hip_kernels/14397/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z6kernelPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = mul i32 %4, %9
  %14 = add i32 %13, %3
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %23

16:                                               ; preds = %2
  %17 = udiv i32 %12, %9
  %18 = mul i32 %17, %9
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %9
  br label %24

23:                                               ; preds = %24, %2
  ret void

24:                                               ; preds = %16, %24
  %25 = phi i32 [ %14, %16 ], [ %94, %24 ]
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 0x3FF250CF662ABF9A
  %28 = fneg double %27
  %29 = tail call double @llvm.fma.f64(double %26, double 0x3FF250CF662ABF9A, double %28)
  %30 = tail call double @llvm.fma.f64(double %26, double 0x3C96EBD950D8F4A6, double %29)
  %31 = fadd double %27, %30
  %32 = fsub double %31, %27
  %33 = fsub double %30, %32
  %34 = tail call double @llvm.fabs.f64(double %27) #3
  %35 = fcmp oeq double %34, 0x7FF0000000000000
  %36 = select i1 %35, double %27, double %31
  %37 = tail call double @llvm.fabs.f64(double %36) #3
  %38 = fcmp oeq double %37, 0x7FF0000000000000
  %39 = select i1 %38, double 0.000000e+00, double %33
  %40 = fmul double %36, 0x3FF71547652B82FE
  %41 = tail call double @llvm.rint.f64(double %40)
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double 0x3FE62E42FEFA39EF, double %36)
  %44 = tail call double @llvm.fma.f64(double %42, double 0x3C7ABC9E3B39803F, double %43)
  %45 = tail call double @llvm.fma.f64(double %44, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %46 = tail call double @llvm.fma.f64(double %44, double %45, double 0x3EC71DEE623FDE64)
  %47 = tail call double @llvm.fma.f64(double %44, double %46, double 0x3EFA01997C89E6B0)
  %48 = tail call double @llvm.fma.f64(double %44, double %47, double 0x3F2A01A014761F6E)
  %49 = tail call double @llvm.fma.f64(double %44, double %48, double 0x3F56C16C1852B7B0)
  %50 = tail call double @llvm.fma.f64(double %44, double %49, double 0x3F81111111122322)
  %51 = tail call double @llvm.fma.f64(double %44, double %50, double 0x3FA55555555502A1)
  %52 = tail call double @llvm.fma.f64(double %44, double %51, double 0x3FC5555555555511)
  %53 = tail call double @llvm.fma.f64(double %44, double %52, double 0x3FE000000000000B)
  %54 = tail call double @llvm.fma.f64(double %44, double %53, double 1.000000e+00)
  %55 = tail call double @llvm.fma.f64(double %44, double %54, double 1.000000e+00)
  %56 = fptosi double %41 to i32
  %57 = tail call double @llvm.amdgcn.ldexp.f64(double %55, i32 %56)
  %58 = fcmp ogt double %36, 1.024000e+03
  %59 = select i1 %58, double 0x7FF0000000000000, double %57
  %60 = fcmp olt double %36, -1.075000e+03
  %61 = select i1 %60, double 0.000000e+00, double %59
  %62 = tail call double @llvm.fma.f64(double %61, double %39, double %61)
  %63 = tail call double @llvm.fabs.f64(double %61) #3
  %64 = fcmp oeq double %63, 0x7FF0000000000000
  %65 = select i1 %64, double %61, double %62
  %66 = tail call double @llvm.fabs.f64(double %65)
  %67 = icmp eq i32 %25, 0
  %68 = select i1 %67, double 1.000000e+00, double %66
  %69 = fcmp olt double %68, 0x1000000000000000
  %70 = select i1 %69, double 0x4FF0000000000000, double 1.000000e+00
  %71 = fmul double %68, %70
  %72 = tail call double @llvm.amdgcn.rsq.f64(double %71)
  %73 = fmul double %71, %72
  %74 = fmul double %72, 5.000000e-01
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %75, double %73, double 5.000000e-01)
  %77 = tail call double @llvm.fma.f64(double %74, double %76, double %74)
  %78 = tail call double @llvm.fma.f64(double %73, double %76, double %73)
  %79 = fneg double %78
  %80 = tail call double @llvm.fma.f64(double %79, double %78, double %71)
  %81 = tail call double @llvm.fma.f64(double %80, double %77, double %78)
  %82 = fneg double %81
  %83 = tail call double @llvm.fma.f64(double %82, double %81, double %71)
  %84 = tail call double @llvm.fma.f64(double %83, double %77, double %81)
  %85 = select i1 %69, double 0x37F0000000000000, double 1.000000e+00
  %86 = fmul double %85, %84
  %87 = fcmp oeq double %71, 0.000000e+00
  %88 = fcmp oeq double %71, 0x7FF0000000000000
  %89 = or i1 %87, %88
  %90 = select i1 %89, double %71, double %86
  %91 = fptrunc double %90 to float
  %92 = sext i32 %25 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  store float %91, float addrspace(1)* %93, align 4, !tbaa !16
  %94 = add i32 %22, %25
  %95 = icmp slt i32 %94, %1
  br i1 %95, label %24, label %23, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
