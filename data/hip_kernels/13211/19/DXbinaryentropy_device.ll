; ModuleID = '../data/hip_kernels/13211/19/main.cu'
source_filename = "../data/hip_kernels/13211/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15DXbinaryentropyiPKdS0_S0_Pd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4) local_unnamed_addr #0 {
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
  br i1 %15, label %16, label %118

16:                                               ; preds = %5
  %17 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !6
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds double, double addrspace(1)* %2, i64 %18
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = fsub contract double 1.000000e+00, %22
  %24 = fmul contract double %20, %23
  %25 = fsub contract double 1.000000e+00, %20
  %26 = fmul contract double %22, %25
  %27 = fdiv contract double %24, %26
  %28 = tail call double @llvm.amdgcn.frexp.mant.f64(double %27)
  %29 = fcmp olt double %28, 0x3FE5555555555555
  %30 = zext i1 %29 to i32
  %31 = tail call double @llvm.amdgcn.ldexp.f64(double %28, i32 %30)
  %32 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %27)
  %33 = sub nsw i32 %32, %30
  %34 = fadd double %31, -1.000000e+00
  %35 = fadd double %31, 1.000000e+00
  %36 = fadd double %35, -1.000000e+00
  %37 = fsub double %31, %36
  %38 = tail call double @llvm.amdgcn.rcp.f64(double %35)
  %39 = fneg double %35
  %40 = tail call double @llvm.fma.f64(double %39, double %38, double 1.000000e+00)
  %41 = tail call double @llvm.fma.f64(double %40, double %38, double %38)
  %42 = tail call double @llvm.fma.f64(double %39, double %41, double 1.000000e+00)
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double %41)
  %44 = fmul double %34, %43
  %45 = fmul double %35, %44
  %46 = fneg double %45
  %47 = tail call double @llvm.fma.f64(double %44, double %35, double %46)
  %48 = tail call double @llvm.fma.f64(double %44, double %37, double %47)
  %49 = fadd double %45, %48
  %50 = fsub double %49, %45
  %51 = fsub double %48, %50
  %52 = fsub double %34, %49
  %53 = fsub double %34, %52
  %54 = fsub double %53, %49
  %55 = fsub double %54, %51
  %56 = fadd double %52, %55
  %57 = fmul double %43, %56
  %58 = fadd double %44, %57
  %59 = fsub double %58, %44
  %60 = fsub double %57, %59
  %61 = fmul double %58, %58
  %62 = tail call double @llvm.fma.f64(double %61, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %63 = tail call double @llvm.fma.f64(double %61, double %62, double 0x3FC7474DD7F4DF2E)
  %64 = tail call double @llvm.fma.f64(double %61, double %63, double 0x3FCC71C016291751)
  %65 = tail call double @llvm.fma.f64(double %61, double %64, double 0x3FD249249B27ACF1)
  %66 = tail call double @llvm.fma.f64(double %61, double %65, double 0x3FD99999998EF7B6)
  %67 = tail call double @llvm.fma.f64(double %61, double %66, double 0x3FE5555555555780)
  %68 = tail call double @llvm.amdgcn.ldexp.f64(double %58, i32 1)
  %69 = tail call double @llvm.amdgcn.ldexp.f64(double %60, i32 1)
  %70 = fmul double %58, %61
  %71 = fmul double %70, %67
  %72 = fadd double %68, %71
  %73 = fsub double %72, %68
  %74 = fsub double %71, %73
  %75 = fadd double %69, %74
  %76 = fadd double %72, %75
  %77 = fsub double %76, %72
  %78 = fsub double %75, %77
  %79 = sitofp i32 %33 to double
  %80 = fmul double %79, 0x3FE62E42FEFA39EF
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %79, double 0x3FE62E42FEFA39EF, double %81)
  %83 = tail call double @llvm.fma.f64(double %79, double 0x3C7ABC9E3B39803F, double %82)
  %84 = fadd double %80, %83
  %85 = fsub double %84, %80
  %86 = fsub double %83, %85
  %87 = fadd double %84, %76
  %88 = fsub double %87, %84
  %89 = fsub double %87, %88
  %90 = fsub double %84, %89
  %91 = fsub double %76, %88
  %92 = fadd double %91, %90
  %93 = fadd double %86, %78
  %94 = fsub double %93, %86
  %95 = fsub double %93, %94
  %96 = fsub double %86, %95
  %97 = fsub double %78, %94
  %98 = fadd double %97, %96
  %99 = fadd double %93, %92
  %100 = fadd double %87, %99
  %101 = fsub double %100, %87
  %102 = fsub double %99, %101
  %103 = fadd double %98, %102
  %104 = fadd double %100, %103
  %105 = tail call double @llvm.fabs.f64(double %27) #3
  %106 = fcmp oeq double %105, 0x7FF0000000000000
  %107 = select i1 %106, double %27, double %104
  %108 = fcmp olt double %27, 0.000000e+00
  %109 = select i1 %108, double 0x7FF8000000000000, double %107
  %110 = fcmp oeq double %27, 0.000000e+00
  %111 = select i1 %110, double 0xFFF0000000000000, double %109
  %112 = fmul contract double %17, %111
  %113 = sitofp i32 %0 to double
  %114 = fdiv contract double %112, %113
  %115 = getelementptr inbounds double, double addrspace(1)* %4, i64 %18
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7, !amdgpu.noclobber !6
  %117 = fadd contract double %116, %114
  store double %117, double addrspace(1)* %115, align 8, !tbaa !7
  br label %118

118:                                              ; preds = %16, %5
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
