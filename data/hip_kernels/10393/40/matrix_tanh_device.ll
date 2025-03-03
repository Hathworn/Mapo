; ModuleID = '../data/hip_kernels/10393/40/main.cu'
source_filename = "../data/hip_kernels/10393/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_tanh(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %169

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fmul double %18, 0x3FF71547652B82FE
  %20 = tail call double @llvm.rint.f64(double %19)
  %21 = tail call double @llvm.fma.f64(double %20, double 0xBFE62E42FEFA3000, double %18)
  %22 = fadd double %21, 0.000000e+00
  %23 = fsub double %21, %22
  %24 = fadd double %23, 0.000000e+00
  %25 = fmul double %20, 0x3D53DE6AF278E000
  %26 = fsub double %22, %25
  %27 = fsub double %22, %26
  %28 = fsub double %27, %25
  %29 = fadd double %24, %28
  %30 = fadd double %26, %29
  %31 = fsub double %30, %26
  %32 = fsub double %29, %31
  %33 = fmul double %20, 0x3AC9CC01F97B57A0
  %34 = fsub double %30, %33
  %35 = fsub double %30, %34
  %36 = fsub double %35, %33
  %37 = fadd double %32, %36
  %38 = fadd double %34, %37
  %39 = fsub double %38, %34
  %40 = fsub double %37, %39
  %41 = tail call double @llvm.fma.f64(double %38, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %42 = tail call double @llvm.fma.f64(double %38, double %41, double 0x3EC71DEE623FDE64)
  %43 = tail call double @llvm.fma.f64(double %38, double %42, double 0x3EFA01997C89E6B0)
  %44 = tail call double @llvm.fma.f64(double %38, double %43, double 0x3F2A01A014761F6E)
  %45 = tail call double @llvm.fma.f64(double %38, double %44, double 0x3F56C16C1852B7B0)
  %46 = tail call double @llvm.fma.f64(double %38, double %45, double 0x3F81111111122322)
  %47 = tail call double @llvm.fma.f64(double %38, double %46, double 0x3FA55555555502A1)
  %48 = tail call double @llvm.fma.f64(double %38, double %47, double 0x3FC5555555555511)
  %49 = tail call double @llvm.fma.f64(double %38, double %48, double 0x3FE000000000000B)
  %50 = fmul double %38, %38
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %38, double %38, double %51)
  %53 = fmul double %40, 2.000000e+00
  %54 = tail call double @llvm.fma.f64(double %38, double %53, double %52)
  %55 = fadd double %50, %54
  %56 = fsub double %55, %50
  %57 = fsub double %54, %56
  %58 = fmul double %55, %49
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %55, double %49, double %59)
  %61 = tail call double @llvm.fma.f64(double %57, double %49, double %60)
  %62 = fadd double %58, %61
  %63 = fsub double %62, %58
  %64 = fsub double %61, %63
  %65 = fadd double %38, %62
  %66 = fsub double %65, %38
  %67 = fsub double %62, %66
  %68 = fadd double %40, %64
  %69 = fadd double %68, %67
  %70 = fadd double %65, %69
  %71 = fsub double %70, %65
  %72 = fsub double %69, %71
  %73 = fadd double %70, 1.000000e+00
  %74 = fadd double %73, -1.000000e+00
  %75 = fsub double %70, %74
  %76 = fadd double %72, %75
  %77 = fadd double %73, %76
  %78 = fsub double %77, %73
  %79 = fsub double %76, %78
  %80 = fptosi double %20 to i32
  %81 = tail call double @llvm.amdgcn.ldexp.f64(double %77, i32 %80)
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %79, i32 %80)
  %83 = tail call double @llvm.amdgcn.rcp.f64(double %81)
  %84 = fneg double %81
  %85 = tail call double @llvm.fma.f64(double %84, double %83, double 1.000000e+00)
  %86 = tail call double @llvm.fma.f64(double %85, double %83, double %83)
  %87 = tail call double @llvm.fma.f64(double %84, double %86, double 1.000000e+00)
  %88 = tail call double @llvm.fma.f64(double %87, double %86, double %86)
  %89 = fmul double %81, %88
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double %81, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double %82, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fsub double 1.000000e+00, %93
  %97 = fsub double 1.000000e+00, %96
  %98 = fsub double %97, %93
  %99 = fsub double %98, %95
  %100 = fadd double %96, %99
  %101 = fsub double %100, %96
  %102 = fsub double %99, %101
  %103 = fmul double %88, %100
  %104 = fmul double %81, %103
  %105 = fneg double %104
  %106 = tail call double @llvm.fma.f64(double %103, double %81, double %105)
  %107 = tail call double @llvm.fma.f64(double %103, double %82, double %106)
  %108 = fadd double %104, %107
  %109 = fsub double %108, %104
  %110 = fsub double %107, %109
  %111 = fsub double %100, %108
  %112 = fsub double %100, %111
  %113 = fsub double %112, %108
  %114 = fadd double %102, %113
  %115 = fsub double %114, %110
  %116 = fadd double %111, %115
  %117 = fmul double %88, %116
  %118 = fadd double %88, %103
  %119 = fsub double %118, %88
  %120 = fsub double %103, %119
  %121 = fadd double %120, %117
  %122 = fadd double %118, %121
  %123 = fsub double %122, %118
  %124 = fsub double %121, %123
  %125 = fsub double %81, %122
  %126 = fsub double %81, %125
  %127 = fsub double %126, %122
  %128 = fadd double %82, %127
  %129 = fsub double %128, %124
  %130 = fadd double %125, %129
  %131 = fsub double %130, %125
  %132 = fsub double %129, %131
  %133 = fadd double %81, %122
  %134 = fsub double %133, %81
  %135 = fsub double %122, %134
  %136 = fadd double %82, %124
  %137 = fadd double %136, %135
  %138 = fadd double %133, %137
  %139 = fsub double %138, %133
  %140 = fsub double %137, %139
  %141 = tail call double @llvm.amdgcn.rcp.f64(double %138)
  %142 = fneg double %138
  %143 = tail call double @llvm.fma.f64(double %142, double %141, double 1.000000e+00)
  %144 = tail call double @llvm.fma.f64(double %143, double %141, double %141)
  %145 = tail call double @llvm.fma.f64(double %142, double %144, double 1.000000e+00)
  %146 = tail call double @llvm.fma.f64(double %145, double %144, double %144)
  %147 = fmul double %130, %146
  %148 = fmul double %138, %147
  %149 = fneg double %148
  %150 = tail call double @llvm.fma.f64(double %147, double %138, double %149)
  %151 = tail call double @llvm.fma.f64(double %147, double %140, double %150)
  %152 = fadd double %148, %151
  %153 = fsub double %152, %148
  %154 = fsub double %151, %153
  %155 = fsub double %130, %152
  %156 = fsub double %130, %155
  %157 = fsub double %156, %152
  %158 = fsub double %157, %154
  %159 = fadd double %132, %158
  %160 = fadd double %155, %159
  %161 = fmul double %146, %160
  %162 = fadd double %147, %161
  %163 = fcmp ogt double %18, 1.906250e+01
  %164 = select i1 %163, double 1.000000e+00, double %162
  %165 = fcmp olt double %18, 0x3E40000000000000
  %166 = select i1 %165, double %18, double %164
  %167 = tail call double @llvm.copysign.f64(double %166, double %17)
  %168 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %167, double addrspace(1)* %168, align 8, !tbaa !7
  br label %169

169:                                              ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
