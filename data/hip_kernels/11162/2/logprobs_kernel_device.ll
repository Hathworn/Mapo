; ModuleID = '../data/hip_kernels/11162/2/main.cu'
source_filename = "../data/hip_kernels/11162/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15logprobs_kernelPdS_Pii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul nsw i32 %5, %3
  %7 = sext i32 %5 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = add nsw i32 %9, %6
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds double, double addrspace(1)* %1, i64 %11
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !9, !amdgpu.noclobber !8
  %14 = tail call double @llvm.amdgcn.frexp.mant.f64(double %13)
  %15 = fcmp olt double %14, 0x3FE5555555555555
  %16 = zext i1 %15 to i32
  %17 = tail call double @llvm.amdgcn.ldexp.f64(double %14, i32 %16)
  %18 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %13)
  %19 = sub nsw i32 %18, %16
  %20 = fadd double %17, -1.000000e+00
  %21 = fadd double %17, 1.000000e+00
  %22 = fadd double %21, -1.000000e+00
  %23 = fsub double %17, %22
  %24 = tail call double @llvm.amdgcn.rcp.f64(double %21)
  %25 = fneg double %21
  %26 = tail call double @llvm.fma.f64(double %25, double %24, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %24, double %24)
  %28 = tail call double @llvm.fma.f64(double %25, double %27, double 1.000000e+00)
  %29 = tail call double @llvm.fma.f64(double %28, double %27, double %27)
  %30 = fmul double %20, %29
  %31 = fmul double %21, %30
  %32 = fneg double %31
  %33 = tail call double @llvm.fma.f64(double %30, double %21, double %32)
  %34 = tail call double @llvm.fma.f64(double %30, double %23, double %33)
  %35 = fadd double %31, %34
  %36 = fsub double %35, %31
  %37 = fsub double %34, %36
  %38 = fsub double %20, %35
  %39 = fsub double %20, %38
  %40 = fsub double %39, %35
  %41 = fsub double %40, %37
  %42 = fadd double %38, %41
  %43 = fmul double %29, %42
  %44 = fadd double %30, %43
  %45 = fsub double %44, %30
  %46 = fsub double %43, %45
  %47 = fmul double %44, %44
  %48 = tail call double @llvm.fma.f64(double %47, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %49 = tail call double @llvm.fma.f64(double %47, double %48, double 0x3FC7474DD7F4DF2E)
  %50 = tail call double @llvm.fma.f64(double %47, double %49, double 0x3FCC71C016291751)
  %51 = tail call double @llvm.fma.f64(double %47, double %50, double 0x3FD249249B27ACF1)
  %52 = tail call double @llvm.fma.f64(double %47, double %51, double 0x3FD99999998EF7B6)
  %53 = tail call double @llvm.fma.f64(double %47, double %52, double 0x3FE5555555555780)
  %54 = tail call double @llvm.amdgcn.ldexp.f64(double %44, i32 1)
  %55 = tail call double @llvm.amdgcn.ldexp.f64(double %46, i32 1)
  %56 = fmul double %44, %47
  %57 = fmul double %56, %53
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fadd double %55, %60
  %62 = fadd double %58, %61
  %63 = fsub double %62, %58
  %64 = fsub double %61, %63
  %65 = sitofp i32 %19 to double
  %66 = fmul double %65, 0x3FE62E42FEFA39EF
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %65, double 0x3FE62E42FEFA39EF, double %67)
  %69 = tail call double @llvm.fma.f64(double %65, double 0x3C7ABC9E3B39803F, double %68)
  %70 = fadd double %66, %69
  %71 = fsub double %70, %66
  %72 = fsub double %69, %71
  %73 = fadd double %70, %62
  %74 = fsub double %73, %70
  %75 = fsub double %73, %74
  %76 = fsub double %70, %75
  %77 = fsub double %62, %74
  %78 = fadd double %77, %76
  %79 = fadd double %72, %64
  %80 = fsub double %79, %72
  %81 = fsub double %79, %80
  %82 = fsub double %72, %81
  %83 = fsub double %64, %80
  %84 = fadd double %83, %82
  %85 = fadd double %79, %78
  %86 = fadd double %73, %85
  %87 = fsub double %86, %73
  %88 = fsub double %85, %87
  %89 = fadd double %84, %88
  %90 = fadd double %86, %89
  %91 = tail call double @llvm.fabs.f64(double %13) #3
  %92 = fcmp oeq double %91, 0x7FF0000000000000
  %93 = select i1 %92, double %13, double %90
  %94 = fcmp olt double %13, 0.000000e+00
  %95 = select i1 %94, double 0x7FF8000000000000, double %93
  %96 = fcmp oeq double %13, 0.000000e+00
  %97 = select i1 %96, double 0xFFF0000000000000, double %95
  %98 = fneg contract double %97
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %7
  store double %98, double addrspace(1)* %99, align 8, !tbaa !9
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
