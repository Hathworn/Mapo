; ModuleID = '../data/hip_kernels/13211/2/main.cu'
source_filename = "../data/hip_kernels/13211/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24DYbinaryentropyXsigmoidYiPKdS0_S0_Pd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %55

16:                                               ; preds = %5
  %17 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !6
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %2, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !6
  %21 = fneg contract double %20
  %22 = fmul double %20, 0xBFF71547652B82FE
  %23 = tail call double @llvm.rint.f64(double %22)
  %24 = fneg double %23
  %25 = tail call double @llvm.fma.f64(double %24, double 0x3FE62E42FEFA39EF, double %21)
  %26 = tail call double @llvm.fma.f64(double %24, double 0x3C7ABC9E3B39803F, double %25)
  %27 = tail call double @llvm.fma.f64(double %26, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %28 = tail call double @llvm.fma.f64(double %26, double %27, double 0x3EC71DEE623FDE64)
  %29 = tail call double @llvm.fma.f64(double %26, double %28, double 0x3EFA01997C89E6B0)
  %30 = tail call double @llvm.fma.f64(double %26, double %29, double 0x3F2A01A014761F6E)
  %31 = tail call double @llvm.fma.f64(double %26, double %30, double 0x3F56C16C1852B7B0)
  %32 = tail call double @llvm.fma.f64(double %26, double %31, double 0x3F81111111122322)
  %33 = tail call double @llvm.fma.f64(double %26, double %32, double 0x3FA55555555502A1)
  %34 = tail call double @llvm.fma.f64(double %26, double %33, double 0x3FC5555555555511)
  %35 = tail call double @llvm.fma.f64(double %26, double %34, double 0x3FE000000000000B)
  %36 = tail call double @llvm.fma.f64(double %26, double %35, double 1.000000e+00)
  %37 = tail call double @llvm.fma.f64(double %26, double %36, double 1.000000e+00)
  %38 = fptosi double %23 to i32
  %39 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 %38)
  %40 = fcmp olt double %20, -1.024000e+03
  %41 = fcmp ogt double %20, 1.075000e+03
  %42 = fadd contract double %39, 1.000000e+00
  %43 = fdiv contract double 1.000000e+00, %42
  %44 = select i1 %40, double 0.000000e+00, double %43
  %45 = select i1 %41, double 1.000000e+00, double %44
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !6
  %48 = fsub contract double %45, %47
  %49 = fmul contract double %17, %48
  %50 = sitofp i32 %0 to double
  %51 = fdiv contract double %49, %50
  %52 = getelementptr inbounds double, double addrspace(1)* %4, i64 %18
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !6
  %54 = fadd contract double %53, %51
  store double %54, double addrspace(1)* %52, align 8, !tbaa !7
  br label %55

55:                                               ; preds = %16, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
