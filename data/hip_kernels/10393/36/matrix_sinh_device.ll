; ModuleID = '../data/hip_kernels/10393/36/main.cu'
source_filename = "../data/hip_kernels/10393/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_sinh(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %149

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fadd double %18, 0xBFE62E42FEFA39EF
  %20 = fsub double %19, %18
  %21 = fsub double %20, %19
  %22 = fadd double %18, %21
  %23 = fadd double %20, 0x3FE62E42FEFA39EF
  %24 = fsub double %22, %23
  %25 = fadd double %24, 0xBC7ABC9E3B39803F
  %26 = fadd double %19, %25
  %27 = fsub double %26, %19
  %28 = fsub double %25, %27
  %29 = fmul double %26, 0x3FF71547652B82FE
  %30 = tail call double @llvm.rint.f64(double %29)
  %31 = tail call double @llvm.fma.f64(double %30, double 0xBFE62E42FEFA3000, double %26)
  %32 = fadd double %28, %31
  %33 = fsub double %32, %31
  %34 = fsub double %28, %33
  %35 = fmul double %30, 0x3D53DE6AF278E000
  %36 = fsub double %32, %35
  %37 = fsub double %32, %36
  %38 = fsub double %37, %35
  %39 = fadd double %34, %38
  %40 = fadd double %36, %39
  %41 = fsub double %40, %36
  %42 = fsub double %39, %41
  %43 = fmul double %30, 0x3AC9CC01F97B57A0
  %44 = fsub double %40, %43
  %45 = fsub double %40, %44
  %46 = fsub double %45, %43
  %47 = fadd double %42, %46
  %48 = fadd double %44, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %49
  %51 = tail call double @llvm.fma.f64(double %48, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %52 = tail call double @llvm.fma.f64(double %48, double %51, double 0x3EC71DEE623FDE64)
  %53 = tail call double @llvm.fma.f64(double %48, double %52, double 0x3EFA01997C89E6B0)
  %54 = tail call double @llvm.fma.f64(double %48, double %53, double 0x3F2A01A014761F6E)
  %55 = tail call double @llvm.fma.f64(double %48, double %54, double 0x3F56C16C1852B7B0)
  %56 = tail call double @llvm.fma.f64(double %48, double %55, double 0x3F81111111122322)
  %57 = tail call double @llvm.fma.f64(double %48, double %56, double 0x3FA55555555502A1)
  %58 = tail call double @llvm.fma.f64(double %48, double %57, double 0x3FC5555555555511)
  %59 = tail call double @llvm.fma.f64(double %48, double %58, double 0x3FE000000000000B)
  %60 = fmul double %48, %48
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %48, double %48, double %61)
  %63 = fmul double %50, 2.000000e+00
  %64 = tail call double @llvm.fma.f64(double %48, double %63, double %62)
  %65 = fadd double %60, %64
  %66 = fsub double %65, %60
  %67 = fsub double %64, %66
  %68 = fmul double %65, %59
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %65, double %59, double %69)
  %71 = tail call double @llvm.fma.f64(double %67, double %59, double %70)
  %72 = fadd double %68, %71
  %73 = fsub double %72, %68
  %74 = fsub double %71, %73
  %75 = fadd double %48, %72
  %76 = fsub double %75, %48
  %77 = fsub double %72, %76
  %78 = fadd double %50, %74
  %79 = fadd double %78, %77
  %80 = fadd double %75, %79
  %81 = fsub double %80, %75
  %82 = fsub double %79, %81
  %83 = fadd double %80, 1.000000e+00
  %84 = fadd double %83, -1.000000e+00
  %85 = fsub double %80, %84
  %86 = fadd double %82, %85
  %87 = fadd double %83, %86
  %88 = fsub double %87, %83
  %89 = fsub double %86, %88
  %90 = fptosi double %30 to i32
  %91 = tail call double @llvm.amdgcn.ldexp.f64(double %87, i32 %90)
  %92 = tail call double @llvm.amdgcn.ldexp.f64(double %89, i32 %90)
  %93 = tail call double @llvm.amdgcn.rcp.f64(double %91)
  %94 = fneg double %91
  %95 = tail call double @llvm.fma.f64(double %94, double %93, double 1.000000e+00)
  %96 = tail call double @llvm.fma.f64(double %95, double %93, double %93)
  %97 = tail call double @llvm.fma.f64(double %94, double %96, double 1.000000e+00)
  %98 = tail call double @llvm.fma.f64(double %97, double %96, double %96)
  %99 = fmul double %91, %98
  %100 = fneg double %99
  %101 = tail call double @llvm.fma.f64(double %98, double %91, double %100)
  %102 = tail call double @llvm.fma.f64(double %98, double %92, double %101)
  %103 = fadd double %99, %102
  %104 = fsub double %103, %99
  %105 = fsub double %102, %104
  %106 = fsub double 1.000000e+00, %103
  %107 = fsub double 1.000000e+00, %106
  %108 = fsub double %107, %103
  %109 = fsub double %108, %105
  %110 = fadd double %106, %109
  %111 = fsub double %110, %106
  %112 = fsub double %109, %111
  %113 = fmul double %98, %110
  %114 = fmul double %91, %113
  %115 = fneg double %114
  %116 = tail call double @llvm.fma.f64(double %113, double %91, double %115)
  %117 = tail call double @llvm.fma.f64(double %113, double %92, double %116)
  %118 = fadd double %114, %117
  %119 = fsub double %118, %114
  %120 = fsub double %117, %119
  %121 = fsub double %110, %118
  %122 = fsub double %110, %121
  %123 = fsub double %122, %118
  %124 = fadd double %112, %123
  %125 = fsub double %124, %120
  %126 = fadd double %121, %125
  %127 = fmul double %98, %126
  %128 = fadd double %98, %113
  %129 = fsub double %128, %98
  %130 = fsub double %113, %129
  %131 = fadd double %130, %127
  %132 = fadd double %128, %131
  %133 = fsub double %132, %128
  %134 = fsub double %131, %133
  %135 = tail call double @llvm.amdgcn.ldexp.f64(double %132, i32 -2)
  %136 = tail call double @llvm.amdgcn.ldexp.f64(double %134, i32 -2)
  %137 = fsub double %91, %135
  %138 = fsub double %91, %137
  %139 = fsub double %138, %135
  %140 = fadd double %92, %139
  %141 = fsub double %140, %136
  %142 = fadd double %137, %141
  %143 = fcmp oge double %18, 0x408633CE8FB9F87E
  %144 = select i1 %143, double 0x7FF0000000000000, double %142
  %145 = fcmp olt double %18, 0x3E40000000000000
  %146 = select i1 %145, double %18, double %144
  %147 = tail call double @llvm.copysign.f64(double %146, double %17)
  %148 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %147, double addrspace(1)* %148, align 8, !tbaa !7
  br label %149

149:                                              ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
