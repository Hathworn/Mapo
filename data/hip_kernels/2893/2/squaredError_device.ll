; ModuleID = '../data/hip_kernels/2893/2/main.cu'
source_filename = "../data/hip_kernels/2893/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12squaredErrorPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %3
  br i1 %14, label %15, label %192

15:                                               ; preds = %4
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = fsub contract float %18, %20
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = fpext float %22 to double
  %24 = tail call double @llvm.amdgcn.frexp.mant.f64(double %23)
  %25 = fcmp olt double %24, 0x3FE5555555555555
  %26 = zext i1 %25 to i32
  %27 = tail call double @llvm.amdgcn.ldexp.f64(double %24, i32 %26)
  %28 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %23)
  %29 = sub nsw i32 %28, %26
  %30 = fadd double %27, -1.000000e+00
  %31 = fadd double %27, 1.000000e+00
  %32 = fadd double %31, -1.000000e+00
  %33 = fsub double %27, %32
  %34 = tail call double @llvm.amdgcn.rcp.f64(double %31)
  %35 = fneg double %31
  %36 = tail call double @llvm.fma.f64(double %35, double %34, double 1.000000e+00)
  %37 = tail call double @llvm.fma.f64(double %36, double %34, double %34)
  %38 = tail call double @llvm.fma.f64(double %35, double %37, double 1.000000e+00)
  %39 = tail call double @llvm.fma.f64(double %38, double %37, double %37)
  %40 = fmul double %30, %39
  %41 = fmul double %31, %40
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %40, double %31, double %42)
  %44 = tail call double @llvm.fma.f64(double %40, double %33, double %43)
  %45 = fadd double %41, %44
  %46 = fsub double %45, %41
  %47 = fsub double %44, %46
  %48 = fsub double %30, %45
  %49 = fsub double %30, %48
  %50 = fsub double %49, %45
  %51 = fsub double %50, %47
  %52 = fadd double %48, %51
  %53 = fmul double %39, %52
  %54 = fadd double %40, %53
  %55 = fsub double %54, %40
  %56 = fsub double %53, %55
  %57 = fmul double %54, %54
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %54, double %54, double %58)
  %60 = fmul double %56, 2.000000e+00
  %61 = tail call double @llvm.fma.f64(double %54, double %60, double %59)
  %62 = fadd double %57, %61
  %63 = fsub double %62, %57
  %64 = fsub double %61, %63
  %65 = tail call double @llvm.fma.f64(double %62, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %66 = tail call double @llvm.fma.f64(double %62, double %65, double 0x3FBE25E43ABE935A)
  %67 = tail call double @llvm.fma.f64(double %62, double %66, double 0x3FC110EF47E6C9C2)
  %68 = tail call double @llvm.fma.f64(double %62, double %67, double 0x3FC3B13BCFA74449)
  %69 = tail call double @llvm.fma.f64(double %62, double %68, double 0x3FC745D171BF3C30)
  %70 = tail call double @llvm.fma.f64(double %62, double %69, double 0x3FCC71C71C7792CE)
  %71 = tail call double @llvm.fma.f64(double %62, double %70, double 0x3FD24924924920DA)
  %72 = tail call double @llvm.fma.f64(double %62, double %71, double 0x3FD999999999999C)
  %73 = sitofp i32 %29 to double
  %74 = fmul double %73, 0x3FE62E42FEFA39EF
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %73, double 0x3FE62E42FEFA39EF, double %75)
  %77 = tail call double @llvm.fma.f64(double %73, double 0x3C7ABC9E3B39803F, double %76)
  %78 = fadd double %74, %77
  %79 = fsub double %78, %74
  %80 = fsub double %77, %79
  %81 = tail call double @llvm.amdgcn.ldexp.f64(double %54, i32 1)
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %56, i32 1)
  %83 = fmul double %54, %62
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %62, double %54, double %84)
  %86 = tail call double @llvm.fma.f64(double %62, double %56, double %85)
  %87 = tail call double @llvm.fma.f64(double %64, double %54, double %86)
  %88 = fadd double %83, %87
  %89 = fsub double %88, %83
  %90 = fsub double %87, %89
  %91 = fmul double %62, %72
  %92 = fneg double %91
  %93 = tail call double @llvm.fma.f64(double %62, double %72, double %92)
  %94 = tail call double @llvm.fma.f64(double %64, double %72, double %93)
  %95 = fadd double %91, %94
  %96 = fsub double %95, %91
  %97 = fsub double %94, %96
  %98 = fadd double %95, 0x3FE5555555555555
  %99 = fadd double %98, 0xBFE5555555555555
  %100 = fsub double %95, %99
  %101 = fadd double %97, 0x3C8543B0D5DF274D
  %102 = fadd double %101, %100
  %103 = fadd double %98, %102
  %104 = fsub double %103, %98
  %105 = fsub double %102, %104
  %106 = fmul double %88, %103
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %88, double %103, double %107)
  %109 = tail call double @llvm.fma.f64(double %88, double %105, double %108)
  %110 = tail call double @llvm.fma.f64(double %90, double %103, double %109)
  %111 = fadd double %106, %110
  %112 = fsub double %111, %106
  %113 = fsub double %110, %112
  %114 = fadd double %81, %111
  %115 = fsub double %114, %81
  %116 = fsub double %111, %115
  %117 = fadd double %82, %113
  %118 = fadd double %117, %116
  %119 = fadd double %114, %118
  %120 = fsub double %119, %114
  %121 = fsub double %118, %120
  %122 = fadd double %78, %119
  %123 = fsub double %122, %78
  %124 = fsub double %122, %123
  %125 = fsub double %78, %124
  %126 = fsub double %119, %123
  %127 = fadd double %126, %125
  %128 = fadd double %80, %121
  %129 = fsub double %128, %80
  %130 = fsub double %128, %129
  %131 = fsub double %80, %130
  %132 = fsub double %121, %129
  %133 = fadd double %132, %131
  %134 = fadd double %128, %127
  %135 = fadd double %122, %134
  %136 = fsub double %135, %122
  %137 = fsub double %134, %136
  %138 = fadd double %133, %137
  %139 = fadd double %135, %138
  %140 = fsub double %139, %135
  %141 = fsub double %138, %140
  %142 = fmul double %139, 2.000000e+00
  %143 = fneg double %142
  %144 = tail call double @llvm.fma.f64(double %139, double 2.000000e+00, double %143)
  %145 = tail call double @llvm.fma.f64(double %141, double 2.000000e+00, double %144)
  %146 = fadd double %142, %145
  %147 = fsub double %146, %142
  %148 = fsub double %145, %147
  %149 = tail call double @llvm.fabs.f64(double %142) #4
  %150 = fcmp oeq double %149, 0x7FF0000000000000
  %151 = select i1 %150, double %142, double %146
  %152 = tail call double @llvm.fabs.f64(double %151) #4
  %153 = fcmp oeq double %152, 0x7FF0000000000000
  %154 = select i1 %153, double 0.000000e+00, double %148
  %155 = fmul double %151, 0x3FF71547652B82FE
  %156 = tail call double @llvm.rint.f64(double %155)
  %157 = fneg double %156
  %158 = tail call double @llvm.fma.f64(double %157, double 0x3FE62E42FEFA39EF, double %151)
  %159 = tail call double @llvm.fma.f64(double %157, double 0x3C7ABC9E3B39803F, double %158)
  %160 = tail call double @llvm.fma.f64(double %159, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %161 = tail call double @llvm.fma.f64(double %159, double %160, double 0x3EC71DEE623FDE64)
  %162 = tail call double @llvm.fma.f64(double %159, double %161, double 0x3EFA01997C89E6B0)
  %163 = tail call double @llvm.fma.f64(double %159, double %162, double 0x3F2A01A014761F6E)
  %164 = tail call double @llvm.fma.f64(double %159, double %163, double 0x3F56C16C1852B7B0)
  %165 = tail call double @llvm.fma.f64(double %159, double %164, double 0x3F81111111122322)
  %166 = tail call double @llvm.fma.f64(double %159, double %165, double 0x3FA55555555502A1)
  %167 = tail call double @llvm.fma.f64(double %159, double %166, double 0x3FC5555555555511)
  %168 = tail call double @llvm.fma.f64(double %159, double %167, double 0x3FE000000000000B)
  %169 = tail call double @llvm.fma.f64(double %159, double %168, double 1.000000e+00)
  %170 = tail call double @llvm.fma.f64(double %159, double %169, double 1.000000e+00)
  %171 = fptosi double %156 to i32
  %172 = tail call double @llvm.amdgcn.ldexp.f64(double %170, i32 %171)
  %173 = fcmp ogt double %151, 1.024000e+03
  %174 = select i1 %173, double 0x7FF0000000000000, double %172
  %175 = fcmp olt double %151, -1.075000e+03
  %176 = select i1 %175, double 0.000000e+00, double %174
  %177 = tail call double @llvm.fma.f64(double %176, double %154, double %176)
  %178 = tail call double @llvm.fabs.f64(double %176) #4
  %179 = fcmp oeq double %178, 0x7FF0000000000000
  %180 = select i1 %179, double %176, double %177
  %181 = fcmp oeq float %22, 0x7FF0000000000000
  %182 = fcmp oeq float %21, 0.000000e+00
  %183 = fcmp uno float %21, 0.000000e+00
  %184 = fcmp oeq float %21, 1.000000e+00
  %185 = fptrunc double %180 to float
  %186 = tail call float @llvm.fabs.f32(float %185)
  %187 = select i1 %181, float 0x7FF0000000000000, float %186
  %188 = select i1 %182, float 0.000000e+00, float %187
  %189 = select i1 %183, float 0x7FF8000000000000, float %188
  %190 = select i1 %184, float 1.000000e+00, float %189
  %191 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  store float %190, float addrspace(1)* %191, align 4, !tbaa !7
  br label %192

192:                                              ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
