; ModuleID = '../data/hip_kernels/13211/16/main.cu'
source_filename = "../data/hip_kernels/13211/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24DXbinaryentropyXsigmoidYiPKdS0_S0_Pd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4) local_unnamed_addr #0 {
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
  br i1 %15, label %16, label %116

16:                                               ; preds = %5
  %17 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !6
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %2, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = fsub contract double 1.000000e+00, %22
  %24 = fdiv contract double %22, %23
  %25 = tail call double @llvm.amdgcn.frexp.mant.f64(double %24)
  %26 = fcmp olt double %25, 0x3FE5555555555555
  %27 = zext i1 %26 to i32
  %28 = tail call double @llvm.amdgcn.ldexp.f64(double %25, i32 %27)
  %29 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %24)
  %30 = sub nsw i32 %29, %27
  %31 = fadd double %28, -1.000000e+00
  %32 = fadd double %28, 1.000000e+00
  %33 = fadd double %32, -1.000000e+00
  %34 = fsub double %28, %33
  %35 = tail call double @llvm.amdgcn.rcp.f64(double %32)
  %36 = fneg double %32
  %37 = tail call double @llvm.fma.f64(double %36, double %35, double 1.000000e+00)
  %38 = tail call double @llvm.fma.f64(double %37, double %35, double %35)
  %39 = tail call double @llvm.fma.f64(double %36, double %38, double 1.000000e+00)
  %40 = tail call double @llvm.fma.f64(double %39, double %38, double %38)
  %41 = fmul double %31, %40
  %42 = fmul double %32, %41
  %43 = fneg double %42
  %44 = tail call double @llvm.fma.f64(double %41, double %32, double %43)
  %45 = tail call double @llvm.fma.f64(double %41, double %34, double %44)
  %46 = fadd double %42, %45
  %47 = fsub double %46, %42
  %48 = fsub double %45, %47
  %49 = fsub double %31, %46
  %50 = fsub double %31, %49
  %51 = fsub double %50, %46
  %52 = fsub double %51, %48
  %53 = fadd double %49, %52
  %54 = fmul double %40, %53
  %55 = fadd double %41, %54
  %56 = fsub double %55, %41
  %57 = fsub double %54, %56
  %58 = fmul double %55, %55
  %59 = tail call double @llvm.fma.f64(double %58, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %60 = tail call double @llvm.fma.f64(double %58, double %59, double 0x3FC7474DD7F4DF2E)
  %61 = tail call double @llvm.fma.f64(double %58, double %60, double 0x3FCC71C016291751)
  %62 = tail call double @llvm.fma.f64(double %58, double %61, double 0x3FD249249B27ACF1)
  %63 = tail call double @llvm.fma.f64(double %58, double %62, double 0x3FD99999998EF7B6)
  %64 = tail call double @llvm.fma.f64(double %58, double %63, double 0x3FE5555555555780)
  %65 = tail call double @llvm.amdgcn.ldexp.f64(double %55, i32 1)
  %66 = tail call double @llvm.amdgcn.ldexp.f64(double %57, i32 1)
  %67 = fmul double %55, %58
  %68 = fmul double %67, %64
  %69 = fadd double %65, %68
  %70 = fsub double %69, %65
  %71 = fsub double %68, %70
  %72 = fadd double %66, %71
  %73 = fadd double %69, %72
  %74 = fsub double %73, %69
  %75 = fsub double %72, %74
  %76 = sitofp i32 %30 to double
  %77 = fmul double %76, 0x3FE62E42FEFA39EF
  %78 = fneg double %77
  %79 = tail call double @llvm.fma.f64(double %76, double 0x3FE62E42FEFA39EF, double %78)
  %80 = tail call double @llvm.fma.f64(double %76, double 0x3C7ABC9E3B39803F, double %79)
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %81, %73
  %85 = fsub double %84, %81
  %86 = fsub double %84, %85
  %87 = fsub double %81, %86
  %88 = fsub double %73, %85
  %89 = fadd double %88, %87
  %90 = fadd double %83, %75
  %91 = fsub double %90, %83
  %92 = fsub double %90, %91
  %93 = fsub double %83, %92
  %94 = fsub double %75, %91
  %95 = fadd double %94, %93
  %96 = fadd double %90, %89
  %97 = fadd double %84, %96
  %98 = fsub double %97, %84
  %99 = fsub double %96, %98
  %100 = fadd double %95, %99
  %101 = fadd double %97, %100
  %102 = tail call double @llvm.fabs.f64(double %24) #3
  %103 = fcmp oeq double %102, 0x7FF0000000000000
  %104 = select i1 %103, double %24, double %101
  %105 = fcmp olt double %24, 0.000000e+00
  %106 = select i1 %105, double 0x7FF8000000000000, double %104
  %107 = fcmp oeq double %24, 0.000000e+00
  %108 = select i1 %107, double 0xFFF0000000000000, double %106
  %109 = fsub contract double %20, %108
  %110 = fmul contract double %17, %109
  %111 = sitofp i32 %0 to double
  %112 = fdiv contract double %110, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %4, i64 %18
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7, !amdgpu.noclobber !6
  %115 = fsub contract double %114, %112
  store double %115, double addrspace(1)* %113, align 8, !tbaa !7
  br label %116

116:                                              ; preds = %16, %5
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
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
