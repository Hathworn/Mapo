; ModuleID = '../data/hip_kernels/11654/37/main.cu'
source_filename = "../data/hip_kernels/11654/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12dnorm_kernelPfiff(float addrspace(1)* nocapture %0, i32 %1, float %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = mul i32 %21, %29
  %34 = add i32 %33, %30
  %35 = mul i32 %34, %25
  %36 = add i32 %35, %31
  %37 = mul i32 %36, %14
  %38 = add i32 %37, %32
  %39 = icmp slt i32 %38, %1
  br i1 %39, label %40, label %90

40:                                               ; preds = %4
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !14
  %44 = fsub contract float %43, %2
  %45 = fdiv contract float %44, %3
  %46 = fpext float %45 to double
  %47 = fmul contract double %46, -5.000000e-01
  %48 = fmul contract double %47, %46
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
  %71 = fptrunc double %70 to float
  %72 = fpext float %71 to double
  %73 = fpext float %3 to double
  %74 = tail call double @llvm.amdgcn.rsq.f64(double 0x401921FB54442D18)
  %75 = fmul double %74, 0x401921FB54442D18
  %76 = fmul double %74, 5.000000e-01
  %77 = fneg double %76
  %78 = tail call double @llvm.fma.f64(double %77, double %75, double 5.000000e-01)
  %79 = tail call double @llvm.fma.f64(double %76, double %78, double %76)
  %80 = tail call double @llvm.fma.f64(double %75, double %78, double %75)
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %81, double %80, double 0x401921FB54442D18)
  %83 = tail call double @llvm.fma.f64(double %82, double %79, double %80)
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %84, double %83, double 0x401921FB54442D18)
  %86 = tail call double @llvm.fma.f64(double %85, double %79, double %83)
  %87 = fmul contract double %86, %73
  %88 = fdiv contract double %72, %87
  %89 = fptrunc double %88 to float
  store float %89, float addrspace(1)* %42, align 4, !tbaa !16
  br label %90

90:                                               ; preds = %40, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
