; ModuleID = '../data/hip_kernels/17141/11/main.cu'
source_filename = "../data/hip_kernels/17141/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23ComplementNBLearnKernelPfS_S_S_fjj(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp ult i32 %16, %6
  %18 = icmp ne i32 %5, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %143

20:                                               ; preds = %7
  %21 = sext i32 %16 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %23 = uitofp i32 %6 to float
  br label %24

24:                                               ; preds = %20, %24
  %25 = phi i32 [ 0, %20 ], [ %141, %24 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = fsub contract float %4, %28
  %30 = load float, float addrspace(1)* %22, align 4, !tbaa !7
  %31 = mul i32 %25, %6
  %32 = add i32 %31, %16
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = fsub contract float %30, %35
  %37 = fpext float %36 to double
  %38 = fadd contract double %37, 1.000000e+00
  %39 = tail call double @llvm.amdgcn.frexp.mant.f64(double %38)
  %40 = fcmp olt double %39, 0x3FE5555555555555
  %41 = zext i1 %40 to i32
  %42 = tail call double @llvm.amdgcn.ldexp.f64(double %39, i32 %41)
  %43 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %38)
  %44 = sub nsw i32 %43, %41
  %45 = fadd double %42, -1.000000e+00
  %46 = fadd double %42, 1.000000e+00
  %47 = fadd double %46, -1.000000e+00
  %48 = fsub double %42, %47
  %49 = tail call double @llvm.amdgcn.rcp.f64(double %46)
  %50 = fneg double %46
  %51 = tail call double @llvm.fma.f64(double %50, double %49, double 1.000000e+00)
  %52 = tail call double @llvm.fma.f64(double %51, double %49, double %49)
  %53 = tail call double @llvm.fma.f64(double %50, double %52, double 1.000000e+00)
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double %52)
  %55 = fmul double %45, %54
  %56 = fmul double %46, %55
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %55, double %46, double %57)
  %59 = tail call double @llvm.fma.f64(double %55, double %48, double %58)
  %60 = fadd double %56, %59
  %61 = fsub double %60, %56
  %62 = fsub double %59, %61
  %63 = fsub double %45, %60
  %64 = fsub double %45, %63
  %65 = fsub double %64, %60
  %66 = fsub double %65, %62
  %67 = fadd double %63, %66
  %68 = fmul double %54, %67
  %69 = fadd double %55, %68
  %70 = fsub double %69, %55
  %71 = fsub double %68, %70
  %72 = fmul double %69, %69
  %73 = tail call double @llvm.fma.f64(double %72, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %74 = tail call double @llvm.fma.f64(double %72, double %73, double 0x3FC7474DD7F4DF2E)
  %75 = tail call double @llvm.fma.f64(double %72, double %74, double 0x3FCC71C016291751)
  %76 = tail call double @llvm.fma.f64(double %72, double %75, double 0x3FD249249B27ACF1)
  %77 = tail call double @llvm.fma.f64(double %72, double %76, double 0x3FD99999998EF7B6)
  %78 = tail call double @llvm.fma.f64(double %72, double %77, double 0x3FE5555555555780)
  %79 = tail call double @llvm.amdgcn.ldexp.f64(double %69, i32 1)
  %80 = tail call double @llvm.amdgcn.ldexp.f64(double %71, i32 1)
  %81 = fmul double %69, %72
  %82 = fmul double %81, %78
  %83 = fadd double %79, %82
  %84 = fsub double %83, %79
  %85 = fsub double %82, %84
  %86 = fadd double %80, %85
  %87 = fadd double %83, %86
  %88 = fsub double %87, %83
  %89 = fsub double %86, %88
  %90 = sitofp i32 %44 to double
  %91 = fmul double %90, 0x3FE62E42FEFA39EF
  %92 = fneg double %91
  %93 = tail call double @llvm.fma.f64(double %90, double 0x3FE62E42FEFA39EF, double %92)
  %94 = tail call double @llvm.fma.f64(double %90, double 0x3C7ABC9E3B39803F, double %93)
  %95 = fadd double %91, %94
  %96 = fsub double %95, %91
  %97 = fsub double %94, %96
  %98 = fadd double %95, %87
  %99 = fsub double %98, %95
  %100 = fsub double %98, %99
  %101 = fsub double %95, %100
  %102 = fsub double %87, %99
  %103 = fadd double %102, %101
  %104 = fadd double %97, %89
  %105 = fsub double %104, %97
  %106 = fsub double %104, %105
  %107 = fsub double %97, %106
  %108 = fsub double %89, %105
  %109 = fadd double %108, %107
  %110 = fadd double %104, %103
  %111 = fadd double %98, %110
  %112 = fsub double %111, %98
  %113 = fsub double %110, %112
  %114 = fadd double %109, %113
  %115 = fadd double %111, %114
  %116 = tail call double @llvm.fabs.f64(double %38) #3
  %117 = fcmp oeq double %116, 0x7FF0000000000000
  %118 = select i1 %117, double %38, double %115
  %119 = fcmp olt double %38, 0.000000e+00
  %120 = select i1 %119, double 0x7FF8000000000000, double %118
  %121 = fcmp oeq double %38, 0.000000e+00
  %122 = select i1 %121, double 0xFFF0000000000000, double %120
  %123 = fadd contract float %29, %23
  %124 = tail call i1 @llvm.amdgcn.class.f32(float %123, i32 144)
  %125 = select i1 %124, float 0x41F0000000000000, float 1.000000e+00
  %126 = fmul float %123, %125
  %127 = tail call float @llvm.log2.f32(float %126)
  %128 = fmul float %127, 0x3FE62E42E0000000
  %129 = tail call i1 @llvm.amdgcn.class.f32(float %127, i32 519)
  %130 = fneg float %128
  %131 = tail call float @llvm.fma.f32(float %127, float 0x3FE62E42E0000000, float %130)
  %132 = tail call float @llvm.fma.f32(float %127, float 0x3E6EFA39E0000000, float %131)
  %133 = fadd float %128, %132
  %134 = select i1 %129, float %127, float %133
  %135 = select i1 %124, float 0x40362E4300000000, float 0.000000e+00
  %136 = fsub float %134, %135
  %137 = fpext float %136 to double
  %138 = fsub contract double %122, %137
  %139 = fptrunc double %138 to float
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  store float %139, float addrspace(1)* %140, align 4, !tbaa !7
  %141 = add nuw i32 %25, 1
  %142 = icmp eq i32 %141, %5
  br i1 %142, label %143, label %24, !llvm.loop !11

143:                                              ; preds = %24, %7
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
