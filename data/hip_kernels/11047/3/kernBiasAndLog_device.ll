; ModuleID = '../data/hip_kernels/11047/3/main.cu'
source_filename = "../data/hip_kernels/11047/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14kernBiasAndLogPdS_(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load double, double addrspace(1)* %1, align 8, !tbaa !4, !amdgpu.noclobber !8
  %4 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %5 = tail call double @llvm.amdgcn.frexp.mant.f64(double %4)
  %6 = fcmp olt double %5, 0x3FE5555555555555
  %7 = zext i1 %6 to i32
  %8 = tail call double @llvm.amdgcn.ldexp.f64(double %5, i32 %7)
  %9 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %4)
  %10 = sub nsw i32 %9, %7
  %11 = fadd double %8, -1.000000e+00
  %12 = fadd double %8, 1.000000e+00
  %13 = fadd double %12, -1.000000e+00
  %14 = fsub double %8, %13
  %15 = tail call double @llvm.amdgcn.rcp.f64(double %12)
  %16 = fneg double %12
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double %15)
  %19 = tail call double @llvm.fma.f64(double %16, double %18, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %18, double %18)
  %21 = fmul double %11, %20
  %22 = fmul double %12, %21
  %23 = fneg double %22
  %24 = tail call double @llvm.fma.f64(double %21, double %12, double %23)
  %25 = tail call double @llvm.fma.f64(double %21, double %14, double %24)
  %26 = fadd double %22, %25
  %27 = fsub double %26, %22
  %28 = fsub double %25, %27
  %29 = fsub double %11, %26
  %30 = fsub double %11, %29
  %31 = fsub double %30, %26
  %32 = fsub double %31, %28
  %33 = fadd double %29, %32
  %34 = fmul double %20, %33
  %35 = fadd double %21, %34
  %36 = fsub double %35, %21
  %37 = fsub double %34, %36
  %38 = fmul double %35, %35
  %39 = tail call double @llvm.fma.f64(double %38, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %40 = tail call double @llvm.fma.f64(double %38, double %39, double 0x3FC7474DD7F4DF2E)
  %41 = tail call double @llvm.fma.f64(double %38, double %40, double 0x3FCC71C016291751)
  %42 = tail call double @llvm.fma.f64(double %38, double %41, double 0x3FD249249B27ACF1)
  %43 = tail call double @llvm.fma.f64(double %38, double %42, double 0x3FD99999998EF7B6)
  %44 = tail call double @llvm.fma.f64(double %38, double %43, double 0x3FE5555555555780)
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %35, i32 1)
  %46 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 1)
  %47 = fmul double %35, %38
  %48 = fmul double %47, %44
  %49 = fadd double %45, %48
  %50 = fsub double %49, %45
  %51 = fsub double %48, %50
  %52 = fadd double %46, %51
  %53 = fadd double %49, %52
  %54 = fsub double %53, %49
  %55 = fsub double %52, %54
  %56 = sitofp i32 %10 to double
  %57 = fmul double %56, 0x3FE62E42FEFA39EF
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %56, double 0x3FE62E42FEFA39EF, double %58)
  %60 = tail call double @llvm.fma.f64(double %56, double 0x3C7ABC9E3B39803F, double %59)
  %61 = fadd double %57, %60
  %62 = fsub double %61, %57
  %63 = fsub double %60, %62
  %64 = fadd double %61, %53
  %65 = fsub double %64, %61
  %66 = fsub double %64, %65
  %67 = fsub double %61, %66
  %68 = fsub double %53, %65
  %69 = fadd double %68, %67
  %70 = fadd double %63, %55
  %71 = fsub double %70, %63
  %72 = fsub double %70, %71
  %73 = fsub double %63, %72
  %74 = fsub double %55, %71
  %75 = fadd double %74, %73
  %76 = fadd double %70, %69
  %77 = fadd double %64, %76
  %78 = fsub double %77, %64
  %79 = fsub double %76, %78
  %80 = fadd double %75, %79
  %81 = fadd double %77, %80
  %82 = tail call double @llvm.fabs.f64(double %4) #3
  %83 = fcmp oeq double %82, 0x7FF0000000000000
  %84 = select i1 %83, double %4, double %81
  %85 = fcmp olt double %4, 0.000000e+00
  %86 = select i1 %85, double 0x7FF8000000000000, double %84
  %87 = fcmp oeq double %4, 0.000000e+00
  %88 = select i1 %87, double 0xFFF0000000000000, double %86
  %89 = fadd contract double %3, %88
  store double %89, double addrspace(1)* %0, align 8, !tbaa !4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
