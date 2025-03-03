; ModuleID = '../data/hip_kernels/12405/28/main.cu'
source_filename = "../data/hip_kernels/12405/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_log(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %103

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.amdgcn.frexp.mant.f64(double %17)
  %19 = fcmp olt double %18, 0x3FE5555555555555
  %20 = zext i1 %19 to i32
  %21 = tail call double @llvm.amdgcn.ldexp.f64(double %18, i32 %20)
  %22 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %17)
  %23 = sub nsw i32 %22, %20
  %24 = fadd double %21, -1.000000e+00
  %25 = fadd double %21, 1.000000e+00
  %26 = fadd double %25, -1.000000e+00
  %27 = fsub double %21, %26
  %28 = tail call double @llvm.amdgcn.rcp.f64(double %25)
  %29 = fneg double %25
  %30 = tail call double @llvm.fma.f64(double %29, double %28, double 1.000000e+00)
  %31 = tail call double @llvm.fma.f64(double %30, double %28, double %28)
  %32 = tail call double @llvm.fma.f64(double %29, double %31, double 1.000000e+00)
  %33 = tail call double @llvm.fma.f64(double %32, double %31, double %31)
  %34 = fmul double %24, %33
  %35 = fmul double %25, %34
  %36 = fneg double %35
  %37 = tail call double @llvm.fma.f64(double %34, double %25, double %36)
  %38 = tail call double @llvm.fma.f64(double %34, double %27, double %37)
  %39 = fadd double %35, %38
  %40 = fsub double %39, %35
  %41 = fsub double %38, %40
  %42 = fsub double %24, %39
  %43 = fsub double %24, %42
  %44 = fsub double %43, %39
  %45 = fsub double %44, %41
  %46 = fadd double %42, %45
  %47 = fmul double %33, %46
  %48 = fadd double %34, %47
  %49 = fsub double %48, %34
  %50 = fsub double %47, %49
  %51 = fmul double %48, %48
  %52 = tail call double @llvm.fma.f64(double %51, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %53 = tail call double @llvm.fma.f64(double %51, double %52, double 0x3FC7474DD7F4DF2E)
  %54 = tail call double @llvm.fma.f64(double %51, double %53, double 0x3FCC71C016291751)
  %55 = tail call double @llvm.fma.f64(double %51, double %54, double 0x3FD249249B27ACF1)
  %56 = tail call double @llvm.fma.f64(double %51, double %55, double 0x3FD99999998EF7B6)
  %57 = tail call double @llvm.fma.f64(double %51, double %56, double 0x3FE5555555555780)
  %58 = tail call double @llvm.amdgcn.ldexp.f64(double %48, i32 1)
  %59 = tail call double @llvm.amdgcn.ldexp.f64(double %50, i32 1)
  %60 = fmul double %48, %51
  %61 = fmul double %60, %57
  %62 = fadd double %58, %61
  %63 = fsub double %62, %58
  %64 = fsub double %61, %63
  %65 = fadd double %59, %64
  %66 = fadd double %62, %65
  %67 = fsub double %66, %62
  %68 = fsub double %65, %67
  %69 = sitofp i32 %23 to double
  %70 = fmul double %69, 0x3FE62E42FEFA39EF
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %69, double 0x3FE62E42FEFA39EF, double %71)
  %73 = tail call double @llvm.fma.f64(double %69, double 0x3C7ABC9E3B39803F, double %72)
  %74 = fadd double %70, %73
  %75 = fsub double %74, %70
  %76 = fsub double %73, %75
  %77 = fadd double %74, %66
  %78 = fsub double %77, %74
  %79 = fsub double %77, %78
  %80 = fsub double %74, %79
  %81 = fsub double %66, %78
  %82 = fadd double %81, %80
  %83 = fadd double %76, %68
  %84 = fsub double %83, %76
  %85 = fsub double %83, %84
  %86 = fsub double %76, %85
  %87 = fsub double %68, %84
  %88 = fadd double %87, %86
  %89 = fadd double %83, %82
  %90 = fadd double %77, %89
  %91 = fsub double %90, %77
  %92 = fsub double %89, %91
  %93 = fadd double %88, %92
  %94 = fadd double %90, %93
  %95 = tail call double @llvm.fabs.f64(double %17) #3
  %96 = fcmp oeq double %95, 0x7FF0000000000000
  %97 = select i1 %96, double %17, double %94
  %98 = fcmp olt double %17, 0.000000e+00
  %99 = select i1 %98, double 0x7FF8000000000000, double %97
  %100 = fcmp oeq double %17, 0.000000e+00
  %101 = select i1 %100, double 0xFFF0000000000000, double %99
  %102 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %101, double addrspace(1)* %102, align 8, !tbaa !7
  br label %103

103:                                              ; preds = %14, %3
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
