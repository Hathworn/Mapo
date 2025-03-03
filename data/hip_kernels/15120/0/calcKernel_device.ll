; ModuleID = '../data/hip_kernels/15120/0/main.cu'
source_filename = "../data/hip_kernels/15120/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10calcKernelPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = fpext float %14 to double
  %16 = fadd contract double %15, -2.300000e+00
  %17 = fdiv contract double %15, %16
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = tail call double @llvm.amdgcn.frexp.mant.f64(double %18)
  %20 = fcmp olt double %19, 0x3FE5555555555555
  %21 = zext i1 %20 to i32
  %22 = tail call double @llvm.amdgcn.ldexp.f64(double %19, i32 %21)
  %23 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %18)
  %24 = sub nsw i32 %23, %21
  %25 = fadd double %22, -1.000000e+00
  %26 = fadd double %22, 1.000000e+00
  %27 = fadd double %26, -1.000000e+00
  %28 = fsub double %22, %27
  %29 = tail call double @llvm.amdgcn.rcp.f64(double %26)
  %30 = fneg double %26
  %31 = tail call double @llvm.fma.f64(double %30, double %29, double 1.000000e+00)
  %32 = tail call double @llvm.fma.f64(double %31, double %29, double %29)
  %33 = tail call double @llvm.fma.f64(double %30, double %32, double 1.000000e+00)
  %34 = tail call double @llvm.fma.f64(double %33, double %32, double %32)
  %35 = fmul double %25, %34
  %36 = fmul double %26, %35
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %35, double %26, double %37)
  %39 = tail call double @llvm.fma.f64(double %35, double %28, double %38)
  %40 = fadd double %36, %39
  %41 = fsub double %40, %36
  %42 = fsub double %39, %41
  %43 = fsub double %25, %40
  %44 = fsub double %25, %43
  %45 = fsub double %44, %40
  %46 = fsub double %45, %42
  %47 = fadd double %43, %46
  %48 = fmul double %34, %47
  %49 = fadd double %35, %48
  %50 = fsub double %49, %35
  %51 = fsub double %48, %50
  %52 = fmul double %49, %49
  %53 = fneg double %52
  %54 = tail call double @llvm.fma.f64(double %49, double %49, double %53)
  %55 = fmul double %51, 2.000000e+00
  %56 = tail call double @llvm.fma.f64(double %49, double %55, double %54)
  %57 = fadd double %52, %56
  %58 = fsub double %57, %52
  %59 = fsub double %56, %58
  %60 = tail call double @llvm.fma.f64(double %57, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %61 = tail call double @llvm.fma.f64(double %57, double %60, double 0x3FBE25E43ABE935A)
  %62 = tail call double @llvm.fma.f64(double %57, double %61, double 0x3FC110EF47E6C9C2)
  %63 = tail call double @llvm.fma.f64(double %57, double %62, double 0x3FC3B13BCFA74449)
  %64 = tail call double @llvm.fma.f64(double %57, double %63, double 0x3FC745D171BF3C30)
  %65 = tail call double @llvm.fma.f64(double %57, double %64, double 0x3FCC71C71C7792CE)
  %66 = tail call double @llvm.fma.f64(double %57, double %65, double 0x3FD24924924920DA)
  %67 = tail call double @llvm.fma.f64(double %57, double %66, double 0x3FD999999999999C)
  %68 = sitofp i32 %24 to double
  %69 = fmul double %68, 0x3FE62E42FEFA39EF
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %68, double 0x3FE62E42FEFA39EF, double %70)
  %72 = tail call double @llvm.fma.f64(double %68, double 0x3C7ABC9E3B39803F, double %71)
  %73 = fadd double %69, %72
  %74 = fsub double %73, %69
  %75 = fsub double %72, %74
  %76 = tail call double @llvm.amdgcn.ldexp.f64(double %49, i32 1)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %51, i32 1)
  %78 = fmul double %49, %57
  %79 = fneg double %78
  %80 = tail call double @llvm.fma.f64(double %57, double %49, double %79)
  %81 = tail call double @llvm.fma.f64(double %57, double %51, double %80)
  %82 = tail call double @llvm.fma.f64(double %59, double %49, double %81)
  %83 = fadd double %78, %82
  %84 = fsub double %83, %78
  %85 = fsub double %82, %84
  %86 = fmul double %57, %67
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %57, double %67, double %87)
  %89 = tail call double @llvm.fma.f64(double %59, double %67, double %88)
  %90 = fadd double %86, %89
  %91 = fsub double %90, %86
  %92 = fsub double %89, %91
  %93 = fadd double %90, 0x3FE5555555555555
  %94 = fadd double %93, 0xBFE5555555555555
  %95 = fsub double %90, %94
  %96 = fadd double %92, 0x3C8543B0D5DF274D
  %97 = fadd double %96, %95
  %98 = fadd double %93, %97
  %99 = fsub double %98, %93
  %100 = fsub double %97, %99
  %101 = fmul double %83, %98
  %102 = fneg double %101
  %103 = tail call double @llvm.fma.f64(double %83, double %98, double %102)
  %104 = tail call double @llvm.fma.f64(double %83, double %100, double %103)
  %105 = tail call double @llvm.fma.f64(double %85, double %98, double %104)
  %106 = fadd double %101, %105
  %107 = fsub double %106, %101
  %108 = fsub double %105, %107
  %109 = fadd double %76, %106
  %110 = fsub double %109, %76
  %111 = fsub double %106, %110
  %112 = fadd double %77, %108
  %113 = fadd double %112, %111
  %114 = fadd double %109, %113
  %115 = fsub double %114, %109
  %116 = fsub double %113, %115
  %117 = fadd double %73, %114
  %118 = fsub double %117, %73
  %119 = fsub double %117, %118
  %120 = fsub double %73, %119
  %121 = fsub double %114, %118
  %122 = fadd double %121, %120
  %123 = fadd double %75, %116
  %124 = fsub double %123, %75
  %125 = fsub double %123, %124
  %126 = fsub double %75, %125
  %127 = fsub double %116, %124
  %128 = fadd double %127, %126
  %129 = fadd double %123, %122
  %130 = fadd double %117, %129
  %131 = fsub double %130, %117
  %132 = fsub double %129, %131
  %133 = fadd double %128, %132
  %134 = fadd double %130, %133
  %135 = fsub double %134, %130
  %136 = fsub double %133, %135
  %137 = fmul double %134, 3.000000e+00
  %138 = fneg double %137
  %139 = tail call double @llvm.fma.f64(double %134, double 3.000000e+00, double %138)
  %140 = tail call double @llvm.fma.f64(double %136, double 3.000000e+00, double %139)
  %141 = fadd double %137, %140
  %142 = fsub double %141, %137
  %143 = fsub double %140, %142
  %144 = tail call double @llvm.fabs.f64(double %137) #3
  %145 = fcmp oeq double %144, 0x7FF0000000000000
  %146 = select i1 %145, double %137, double %141
  %147 = tail call double @llvm.fabs.f64(double %146) #3
  %148 = fcmp oeq double %147, 0x7FF0000000000000
  %149 = select i1 %148, double 0.000000e+00, double %143
  %150 = fmul double %146, 0x3FF71547652B82FE
  %151 = tail call double @llvm.rint.f64(double %150)
  %152 = fneg double %151
  %153 = tail call double @llvm.fma.f64(double %152, double 0x3FE62E42FEFA39EF, double %146)
  %154 = tail call double @llvm.fma.f64(double %152, double 0x3C7ABC9E3B39803F, double %153)
  %155 = tail call double @llvm.fma.f64(double %154, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %156 = tail call double @llvm.fma.f64(double %154, double %155, double 0x3EC71DEE623FDE64)
  %157 = tail call double @llvm.fma.f64(double %154, double %156, double 0x3EFA01997C89E6B0)
  %158 = tail call double @llvm.fma.f64(double %154, double %157, double 0x3F2A01A014761F6E)
  %159 = tail call double @llvm.fma.f64(double %154, double %158, double 0x3F56C16C1852B7B0)
  %160 = tail call double @llvm.fma.f64(double %154, double %159, double 0x3F81111111122322)
  %161 = tail call double @llvm.fma.f64(double %154, double %160, double 0x3FA55555555502A1)
  %162 = tail call double @llvm.fma.f64(double %154, double %161, double 0x3FC5555555555511)
  %163 = tail call double @llvm.fma.f64(double %154, double %162, double 0x3FE000000000000B)
  %164 = tail call double @llvm.fma.f64(double %154, double %163, double 1.000000e+00)
  %165 = tail call double @llvm.fma.f64(double %154, double %164, double 1.000000e+00)
  %166 = fptosi double %151 to i32
  %167 = tail call double @llvm.amdgcn.ldexp.f64(double %165, i32 %166)
  %168 = fcmp ogt double %146, 1.024000e+03
  %169 = select i1 %168, double 0x7FF0000000000000, double %167
  %170 = fcmp olt double %146, -1.075000e+03
  %171 = select i1 %170, double 0.000000e+00, double %169
  %172 = tail call double @llvm.fma.f64(double %171, double %149, double %171)
  %173 = tail call double @llvm.fabs.f64(double %171) #3
  %174 = fcmp oeq double %173, 0x7FF0000000000000
  %175 = select i1 %174, double %171, double %172
  %176 = fcmp uge double %17, 0.000000e+00
  %177 = select i1 %176, double 0.000000e+00, double -0.000000e+00
  %178 = tail call double @llvm.copysign.f64(double %175, double %177)
  %179 = fcmp oeq double %18, 0x7FF0000000000000
  %180 = fcmp oeq double %17, 0.000000e+00
  %181 = or i1 %180, %179
  %182 = select i1 %180, double 0.000000e+00, double 0x7FF0000000000000
  %183 = tail call double @llvm.copysign.f64(double %182, double %17)
  %184 = select i1 %181, double %183, double %178
  %185 = fcmp uno double %17, 0.000000e+00
  %186 = select i1 %185, double 0x7FF8000000000000, double %184
  %187 = fptrunc double %186 to float
  %188 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  store float %187, float addrspace(1)* %188, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
