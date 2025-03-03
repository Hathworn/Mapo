; ModuleID = '../data/hip_kernels/9959/10/main.cu'
source_filename = "../data/hip_kernels/9959/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17cuda_activateTanhPdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %167

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !7, !amdgpu.noclobber !5
  %17 = tail call double @llvm.fabs.f64(double %16)
  %18 = fmul double %17, 0x3FF71547652B82FE
  %19 = tail call double @llvm.rint.f64(double %18)
  %20 = tail call double @llvm.fma.f64(double %19, double 0xBFE62E42FEFA3000, double %17)
  %21 = fadd double %20, 0.000000e+00
  %22 = fsub double %20, %21
  %23 = fadd double %22, 0.000000e+00
  %24 = fmul double %19, 0x3D53DE6AF278E000
  %25 = fsub double %21, %24
  %26 = fsub double %21, %25
  %27 = fsub double %26, %24
  %28 = fadd double %23, %27
  %29 = fadd double %25, %28
  %30 = fsub double %29, %25
  %31 = fsub double %28, %30
  %32 = fmul double %19, 0x3AC9CC01F97B57A0
  %33 = fsub double %29, %32
  %34 = fsub double %29, %33
  %35 = fsub double %34, %32
  %36 = fadd double %31, %35
  %37 = fadd double %33, %36
  %38 = fsub double %37, %33
  %39 = fsub double %36, %38
  %40 = tail call double @llvm.fma.f64(double %37, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %41 = tail call double @llvm.fma.f64(double %37, double %40, double 0x3EC71DEE623FDE64)
  %42 = tail call double @llvm.fma.f64(double %37, double %41, double 0x3EFA01997C89E6B0)
  %43 = tail call double @llvm.fma.f64(double %37, double %42, double 0x3F2A01A014761F6E)
  %44 = tail call double @llvm.fma.f64(double %37, double %43, double 0x3F56C16C1852B7B0)
  %45 = tail call double @llvm.fma.f64(double %37, double %44, double 0x3F81111111122322)
  %46 = tail call double @llvm.fma.f64(double %37, double %45, double 0x3FA55555555502A1)
  %47 = tail call double @llvm.fma.f64(double %37, double %46, double 0x3FC5555555555511)
  %48 = tail call double @llvm.fma.f64(double %37, double %47, double 0x3FE000000000000B)
  %49 = fmul double %37, %37
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %37, double %37, double %50)
  %52 = fmul double %39, 2.000000e+00
  %53 = tail call double @llvm.fma.f64(double %37, double %52, double %51)
  %54 = fadd double %49, %53
  %55 = fsub double %54, %49
  %56 = fsub double %53, %55
  %57 = fmul double %54, %48
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %54, double %48, double %58)
  %60 = tail call double @llvm.fma.f64(double %56, double %48, double %59)
  %61 = fadd double %57, %60
  %62 = fsub double %61, %57
  %63 = fsub double %60, %62
  %64 = fadd double %37, %61
  %65 = fsub double %64, %37
  %66 = fsub double %61, %65
  %67 = fadd double %39, %63
  %68 = fadd double %67, %66
  %69 = fadd double %64, %68
  %70 = fsub double %69, %64
  %71 = fsub double %68, %70
  %72 = fadd double %69, 1.000000e+00
  %73 = fadd double %72, -1.000000e+00
  %74 = fsub double %69, %73
  %75 = fadd double %71, %74
  %76 = fadd double %72, %75
  %77 = fsub double %76, %72
  %78 = fsub double %75, %77
  %79 = fptosi double %19 to i32
  %80 = tail call double @llvm.amdgcn.ldexp.f64(double %76, i32 %79)
  %81 = tail call double @llvm.amdgcn.ldexp.f64(double %78, i32 %79)
  %82 = tail call double @llvm.amdgcn.rcp.f64(double %80)
  %83 = fneg double %80
  %84 = tail call double @llvm.fma.f64(double %83, double %82, double 1.000000e+00)
  %85 = tail call double @llvm.fma.f64(double %84, double %82, double %82)
  %86 = tail call double @llvm.fma.f64(double %83, double %85, double 1.000000e+00)
  %87 = tail call double @llvm.fma.f64(double %86, double %85, double %85)
  %88 = fmul double %80, %87
  %89 = fneg double %88
  %90 = tail call double @llvm.fma.f64(double %87, double %80, double %89)
  %91 = tail call double @llvm.fma.f64(double %87, double %81, double %90)
  %92 = fadd double %88, %91
  %93 = fsub double %92, %88
  %94 = fsub double %91, %93
  %95 = fsub double 1.000000e+00, %92
  %96 = fsub double 1.000000e+00, %95
  %97 = fsub double %96, %92
  %98 = fsub double %97, %94
  %99 = fadd double %95, %98
  %100 = fsub double %99, %95
  %101 = fsub double %98, %100
  %102 = fmul double %87, %99
  %103 = fmul double %80, %102
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %102, double %80, double %104)
  %106 = tail call double @llvm.fma.f64(double %102, double %81, double %105)
  %107 = fadd double %103, %106
  %108 = fsub double %107, %103
  %109 = fsub double %106, %108
  %110 = fsub double %99, %107
  %111 = fsub double %99, %110
  %112 = fsub double %111, %107
  %113 = fadd double %101, %112
  %114 = fsub double %113, %109
  %115 = fadd double %110, %114
  %116 = fmul double %87, %115
  %117 = fadd double %87, %102
  %118 = fsub double %117, %87
  %119 = fsub double %102, %118
  %120 = fadd double %119, %116
  %121 = fadd double %117, %120
  %122 = fsub double %121, %117
  %123 = fsub double %120, %122
  %124 = fsub double %80, %121
  %125 = fsub double %80, %124
  %126 = fsub double %125, %121
  %127 = fadd double %81, %126
  %128 = fsub double %127, %123
  %129 = fadd double %124, %128
  %130 = fsub double %129, %124
  %131 = fsub double %128, %130
  %132 = fadd double %80, %121
  %133 = fsub double %132, %80
  %134 = fsub double %121, %133
  %135 = fadd double %81, %123
  %136 = fadd double %135, %134
  %137 = fadd double %132, %136
  %138 = fsub double %137, %132
  %139 = fsub double %136, %138
  %140 = tail call double @llvm.amdgcn.rcp.f64(double %137)
  %141 = fneg double %137
  %142 = tail call double @llvm.fma.f64(double %141, double %140, double 1.000000e+00)
  %143 = tail call double @llvm.fma.f64(double %142, double %140, double %140)
  %144 = tail call double @llvm.fma.f64(double %141, double %143, double 1.000000e+00)
  %145 = tail call double @llvm.fma.f64(double %144, double %143, double %143)
  %146 = fmul double %129, %145
  %147 = fmul double %137, %146
  %148 = fneg double %147
  %149 = tail call double @llvm.fma.f64(double %146, double %137, double %148)
  %150 = tail call double @llvm.fma.f64(double %146, double %139, double %149)
  %151 = fadd double %147, %150
  %152 = fsub double %151, %147
  %153 = fsub double %150, %152
  %154 = fsub double %129, %151
  %155 = fsub double %129, %154
  %156 = fsub double %155, %151
  %157 = fsub double %156, %153
  %158 = fadd double %131, %157
  %159 = fadd double %154, %158
  %160 = fmul double %145, %159
  %161 = fadd double %146, %160
  %162 = fcmp ogt double %17, 1.906250e+01
  %163 = select i1 %162, double 1.000000e+00, double %161
  %164 = fcmp olt double %17, 0x3E40000000000000
  %165 = select i1 %164, double %17, double %163
  %166 = tail call double @llvm.copysign.f64(double %165, double %16)
  store double %166, double addrspace(1)* %15, align 8, !tbaa !7
  br label %167

167:                                              ; preds = %13, %2
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
