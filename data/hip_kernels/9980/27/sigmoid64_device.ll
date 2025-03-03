; ModuleID = '../data/hip_kernels/9980/27/main.cu'
source_filename = "../data/hip_kernels/9980/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9sigmoid64Pdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 8, !tbaa !15
  %21 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = mul i32 %29, %30
  %32 = add i32 %31, %4
  %33 = mul i32 %32, %17
  %34 = add i32 %33, %3
  %35 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !13, !invariant.load !14
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %39, %40
  %44 = mul i32 %43, %24
  %45 = add i32 %44, %41
  %46 = mul i32 %45, %12
  %47 = add i32 %46, %42
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %49, label %103

49:                                               ; preds = %2
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !17, !amdgpu.noclobber !14
  %53 = fneg contract double %52
  %54 = fsub double %52, %52
  %55 = tail call double @llvm.fma.f64(double %53, double 0xBC8EA9677470FEF8, double %54)
  %56 = fsub double %55, %52
  %57 = fadd double %52, %56
  %58 = fsub double %55, %57
  %59 = tail call double @llvm.fabs.f64(double %53) #3
  %60 = fcmp oeq double %59, 0x7FF0000000000000
  %61 = select i1 %60, double %53, double %56
  %62 = tail call double @llvm.fabs.f64(double %61) #3
  %63 = fcmp oeq double %62, 0x7FF0000000000000
  %64 = select i1 %63, double 0.000000e+00, double %58
  %65 = fmul double %61, 0x3FF71547652B82FE
  %66 = tail call double @llvm.rint.f64(double %65)
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %67, double 0x3FE62E42FEFA39EF, double %61)
  %69 = tail call double @llvm.fma.f64(double %67, double 0x3C7ABC9E3B39803F, double %68)
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %71 = tail call double @llvm.fma.f64(double %69, double %70, double 0x3EC71DEE623FDE64)
  %72 = tail call double @llvm.fma.f64(double %69, double %71, double 0x3EFA01997C89E6B0)
  %73 = tail call double @llvm.fma.f64(double %69, double %72, double 0x3F2A01A014761F6E)
  %74 = tail call double @llvm.fma.f64(double %69, double %73, double 0x3F56C16C1852B7B0)
  %75 = tail call double @llvm.fma.f64(double %69, double %74, double 0x3F81111111122322)
  %76 = tail call double @llvm.fma.f64(double %69, double %75, double 0x3FA55555555502A1)
  %77 = tail call double @llvm.fma.f64(double %69, double %76, double 0x3FC5555555555511)
  %78 = tail call double @llvm.fma.f64(double %69, double %77, double 0x3FE000000000000B)
  %79 = tail call double @llvm.fma.f64(double %69, double %78, double 1.000000e+00)
  %80 = tail call double @llvm.fma.f64(double %69, double %79, double 1.000000e+00)
  %81 = fptosi double %66 to i32
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %80, i32 %81)
  %83 = fcmp ogt double %61, 1.024000e+03
  %84 = select i1 %83, double 0x7FF0000000000000, double %82
  %85 = fcmp olt double %61, -1.075000e+03
  %86 = select i1 %85, double 0.000000e+00, double %84
  %87 = tail call double @llvm.fma.f64(double %86, double %64, double %86)
  %88 = tail call double @llvm.fabs.f64(double %86) #3
  %89 = fcmp oeq double %88, 0x7FF0000000000000
  %90 = select i1 %89, double %86, double %87
  %91 = tail call double @llvm.fabs.f64(double %90)
  %92 = bitcast double %53 to <2 x i32>
  %93 = extractelement <2 x i32> %92, i64 1
  %94 = icmp sgt i32 %93, -1
  %95 = select i1 %94, double 0x7FF0000000000000, double 0.000000e+00
  %96 = select i1 %60, double %95, double %91
  %97 = fcmp uno double %52, 0.000000e+00
  %98 = fcmp oeq double %52, 0.000000e+00
  %99 = fadd contract double %96, 1.000000e+00
  %100 = fdiv contract double 1.000000e+00, %99
  %101 = select i1 %97, double 0x7FF8000000000000, double %100
  %102 = select i1 %98, double 5.000000e-01, double %101
  store double %102, double addrspace(1)* %51, align 8, !tbaa !17
  br label %103

103:                                              ; preds = %2, %49
  ret void
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
