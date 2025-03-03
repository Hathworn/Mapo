; ModuleID = '../data/hip_kernels/11654/27/main.cu'
source_filename = "../data/hip_kernels/11654/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13log_truncNormPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = add i32 %19, %4
  %21 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !13, !invariant.load !14
  %28 = zext i16 %27 to i32
  %29 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = mul i32 %20, %28
  %33 = add i32 %32, %29
  %34 = mul i32 %33, %24
  %35 = add i32 %34, %30
  %36 = mul i32 %35, %13
  %37 = add i32 %36, %31
  %38 = icmp slt i32 %37, %2
  br i1 %38, label %39, label %102

39:                                               ; preds = %3
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !14
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 144)
  %44 = select i1 %43, float 0x41F0000000000000, float 1.000000e+00
  %45 = fmul float %42, %44
  %46 = tail call float @llvm.log2.f32(float %45)
  %47 = fmul float %46, 0x3FE62E42E0000000
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 519)
  %49 = fneg float %47
  %50 = tail call float @llvm.fma.f32(float %46, float 0x3FE62E42E0000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %46, float 0x3E6EFA39E0000000, float %50)
  %52 = fadd float %47, %51
  %53 = select i1 %48, float %46, float %52
  %54 = select i1 %43, float 0x40362E4300000000, float 0.000000e+00
  %55 = fsub float %53, %54
  %56 = fpext float %55 to double
  %57 = fpext float %42 to double
  %58 = fmul contract double %57, -5.000000e-01
  %59 = fmul contract double %58, %57
  %60 = fmul double %59, 0x3FF71547652B82FE
  %61 = tail call double @llvm.rint.f64(double %60)
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double 0x3FE62E42FEFA39EF, double %59)
  %64 = tail call double @llvm.fma.f64(double %62, double 0x3C7ABC9E3B39803F, double %63)
  %65 = tail call double @llvm.fma.f64(double %64, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %66 = tail call double @llvm.fma.f64(double %64, double %65, double 0x3EC71DEE623FDE64)
  %67 = tail call double @llvm.fma.f64(double %64, double %66, double 0x3EFA01997C89E6B0)
  %68 = tail call double @llvm.fma.f64(double %64, double %67, double 0x3F2A01A014761F6E)
  %69 = tail call double @llvm.fma.f64(double %64, double %68, double 0x3F56C16C1852B7B0)
  %70 = tail call double @llvm.fma.f64(double %64, double %69, double 0x3F81111111122322)
  %71 = tail call double @llvm.fma.f64(double %64, double %70, double 0x3FA55555555502A1)
  %72 = tail call double @llvm.fma.f64(double %64, double %71, double 0x3FC5555555555511)
  %73 = tail call double @llvm.fma.f64(double %64, double %72, double 0x3FE000000000000B)
  %74 = tail call double @llvm.fma.f64(double %64, double %73, double 1.000000e+00)
  %75 = tail call double @llvm.fma.f64(double %64, double %74, double 1.000000e+00)
  %76 = fptosi double %61 to i32
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %75, i32 %76)
  %78 = fcmp ogt double %59, 1.024000e+03
  %79 = select i1 %78, double 0x7FF0000000000000, double %77
  %80 = fcmp olt double %59, -1.075000e+03
  %81 = select i1 %80, double 0.000000e+00, double %79
  %82 = fptrunc double %81 to float
  %83 = fpext float %82 to double
  %84 = tail call double @llvm.amdgcn.rsq.f64(double 0x401921FB54442D18)
  %85 = fmul double %84, 0x401921FB54442D18
  %86 = fmul double %84, 5.000000e-01
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %87, double %85, double 5.000000e-01)
  %89 = tail call double @llvm.fma.f64(double %86, double %88, double %86)
  %90 = tail call double @llvm.fma.f64(double %85, double %88, double %85)
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %91, double %90, double 0x401921FB54442D18)
  %93 = tail call double @llvm.fma.f64(double %92, double %89, double %90)
  %94 = fneg double %93
  %95 = tail call double @llvm.fma.f64(double %94, double %93, double 0x401921FB54442D18)
  %96 = tail call double @llvm.fma.f64(double %95, double %89, double %93)
  %97 = fdiv contract double %83, %96
  %98 = fmul contract double %97, %56
  %99 = fdiv contract double %98, 0x3FD5D897A241A3F5
  %100 = fptrunc double %99 to float
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  store float %100, float addrspace(1)* %101, align 4, !tbaa !16
  br label %102

102:                                              ; preds = %39, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
