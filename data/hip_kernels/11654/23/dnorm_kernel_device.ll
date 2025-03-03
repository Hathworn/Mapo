; ModuleID = '../data/hip_kernels/11654/23/main.cu'
source_filename = "../data/hip_kernels/11654/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12dnorm_kernelPfiffS_(float addrspace(1)* nocapture readonly %0, i32 %1, float %2, float %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = mul i32 %22, %30
  %35 = add i32 %34, %31
  %36 = mul i32 %35, %26
  %37 = add i32 %36, %32
  %38 = mul i32 %37, %15
  %39 = add i32 %38, %33
  %40 = icmp slt i32 %39, %1
  br i1 %40, label %41, label %92

41:                                               ; preds = %5
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16, !amdgpu.noclobber !14
  %45 = fsub contract float %44, %2
  %46 = fdiv contract float %45, %3
  %47 = fpext float %46 to double
  %48 = fmul contract double %47, -5.000000e-01
  %49 = fmul contract double %48, %47
  %50 = fmul double %49, 0x3FF71547652B82FE
  %51 = tail call double @llvm.rint.f64(double %50)
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3FE62E42FEFA39EF, double %49)
  %54 = tail call double @llvm.fma.f64(double %52, double 0x3C7ABC9E3B39803F, double %53)
  %55 = tail call double @llvm.fma.f64(double %54, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %56 = tail call double @llvm.fma.f64(double %54, double %55, double 0x3EC71DEE623FDE64)
  %57 = tail call double @llvm.fma.f64(double %54, double %56, double 0x3EFA01997C89E6B0)
  %58 = tail call double @llvm.fma.f64(double %54, double %57, double 0x3F2A01A014761F6E)
  %59 = tail call double @llvm.fma.f64(double %54, double %58, double 0x3F56C16C1852B7B0)
  %60 = tail call double @llvm.fma.f64(double %54, double %59, double 0x3F81111111122322)
  %61 = tail call double @llvm.fma.f64(double %54, double %60, double 0x3FA55555555502A1)
  %62 = tail call double @llvm.fma.f64(double %54, double %61, double 0x3FC5555555555511)
  %63 = tail call double @llvm.fma.f64(double %54, double %62, double 0x3FE000000000000B)
  %64 = tail call double @llvm.fma.f64(double %54, double %63, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %54, double %64, double 1.000000e+00)
  %66 = fptosi double %51 to i32
  %67 = tail call double @llvm.amdgcn.ldexp.f64(double %65, i32 %66)
  %68 = fcmp ogt double %49, 1.024000e+03
  %69 = select i1 %68, double 0x7FF0000000000000, double %67
  %70 = fcmp olt double %49, -1.075000e+03
  %71 = select i1 %70, double 0.000000e+00, double %69
  %72 = fptrunc double %71 to float
  %73 = fpext float %72 to double
  %74 = fpext float %3 to double
  %75 = tail call double @llvm.amdgcn.rsq.f64(double 0x401921FB54442D18)
  %76 = fmul double %75, 0x401921FB54442D18
  %77 = fmul double %75, 5.000000e-01
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %78, double %76, double 5.000000e-01)
  %80 = tail call double @llvm.fma.f64(double %77, double %79, double %77)
  %81 = tail call double @llvm.fma.f64(double %76, double %79, double %76)
  %82 = fneg double %81
  %83 = tail call double @llvm.fma.f64(double %82, double %81, double 0x401921FB54442D18)
  %84 = tail call double @llvm.fma.f64(double %83, double %80, double %81)
  %85 = fneg double %84
  %86 = tail call double @llvm.fma.f64(double %85, double %84, double 0x401921FB54442D18)
  %87 = tail call double @llvm.fma.f64(double %86, double %80, double %84)
  %88 = fmul contract double %87, %74
  %89 = fdiv contract double %73, %88
  %90 = fptrunc double %89 to float
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %42
  store float %90, float addrspace(1)* %91, align 4, !tbaa !16
  br label %92

92:                                               ; preds = %41, %5
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
