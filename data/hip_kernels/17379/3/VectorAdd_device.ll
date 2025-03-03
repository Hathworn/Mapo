; ModuleID = '../data/hip_kernels/17379/3/main.cu'
source_filename = "../data/hip_kernels/17379/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9VectorAddPiS_id(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, double %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %5, %2
  br i1 %6, label %7, label %223

7:                                                ; preds = %4
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = sitofp i32 %10 to double
  %12 = fdiv contract double %11, 2.550000e+02
  %13 = fdiv contract double 1.000000e+00, %3
  %14 = tail call double @llvm.fabs.f64(double %12)
  %15 = tail call double @llvm.amdgcn.frexp.mant.f64(double %14)
  %16 = fcmp olt double %15, 0x3FE5555555555555
  %17 = zext i1 %16 to i32
  %18 = tail call double @llvm.amdgcn.ldexp.f64(double %15, i32 %17)
  %19 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %14)
  %20 = sub nsw i32 %19, %17
  %21 = fadd double %18, -1.000000e+00
  %22 = fadd double %18, 1.000000e+00
  %23 = fadd double %22, -1.000000e+00
  %24 = fsub double %18, %23
  %25 = tail call double @llvm.amdgcn.rcp.f64(double %22)
  %26 = fneg double %22
  %27 = tail call double @llvm.fma.f64(double %26, double %25, double 1.000000e+00)
  %28 = tail call double @llvm.fma.f64(double %27, double %25, double %25)
  %29 = tail call double @llvm.fma.f64(double %26, double %28, double 1.000000e+00)
  %30 = tail call double @llvm.fma.f64(double %29, double %28, double %28)
  %31 = fmul double %21, %30
  %32 = fmul double %22, %31
  %33 = fneg double %32
  %34 = tail call double @llvm.fma.f64(double %31, double %22, double %33)
  %35 = tail call double @llvm.fma.f64(double %31, double %24, double %34)
  %36 = fadd double %32, %35
  %37 = fsub double %36, %32
  %38 = fsub double %35, %37
  %39 = fsub double %21, %36
  %40 = fsub double %21, %39
  %41 = fsub double %40, %36
  %42 = fsub double %41, %38
  %43 = fadd double %39, %42
  %44 = fmul double %30, %43
  %45 = fadd double %31, %44
  %46 = fsub double %45, %31
  %47 = fsub double %44, %46
  %48 = fmul double %45, %45
  %49 = fneg double %48
  %50 = tail call double @llvm.fma.f64(double %45, double %45, double %49)
  %51 = fmul double %47, 2.000000e+00
  %52 = tail call double @llvm.fma.f64(double %45, double %51, double %50)
  %53 = fadd double %48, %52
  %54 = fsub double %53, %48
  %55 = fsub double %52, %54
  %56 = tail call double @llvm.fma.f64(double %53, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %57 = tail call double @llvm.fma.f64(double %53, double %56, double 0x3FBE25E43ABE935A)
  %58 = tail call double @llvm.fma.f64(double %53, double %57, double 0x3FC110EF47E6C9C2)
  %59 = tail call double @llvm.fma.f64(double %53, double %58, double 0x3FC3B13BCFA74449)
  %60 = tail call double @llvm.fma.f64(double %53, double %59, double 0x3FC745D171BF3C30)
  %61 = tail call double @llvm.fma.f64(double %53, double %60, double 0x3FCC71C71C7792CE)
  %62 = tail call double @llvm.fma.f64(double %53, double %61, double 0x3FD24924924920DA)
  %63 = tail call double @llvm.fma.f64(double %53, double %62, double 0x3FD999999999999C)
  %64 = sitofp i32 %20 to double
  %65 = fmul double %64, 0x3FE62E42FEFA39EF
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %64, double 0x3FE62E42FEFA39EF, double %66)
  %68 = tail call double @llvm.fma.f64(double %64, double 0x3C7ABC9E3B39803F, double %67)
  %69 = fadd double %65, %68
  %70 = fsub double %69, %65
  %71 = fsub double %68, %70
  %72 = tail call double @llvm.amdgcn.ldexp.f64(double %45, i32 1)
  %73 = tail call double @llvm.amdgcn.ldexp.f64(double %47, i32 1)
  %74 = fmul double %45, %53
  %75 = fneg double %74
  %76 = tail call double @llvm.fma.f64(double %53, double %45, double %75)
  %77 = tail call double @llvm.fma.f64(double %53, double %47, double %76)
  %78 = tail call double @llvm.fma.f64(double %55, double %45, double %77)
  %79 = fadd double %74, %78
  %80 = fsub double %79, %74
  %81 = fsub double %78, %80
  %82 = fmul double %53, %63
  %83 = fneg double %82
  %84 = tail call double @llvm.fma.f64(double %53, double %63, double %83)
  %85 = tail call double @llvm.fma.f64(double %55, double %63, double %84)
  %86 = fadd double %82, %85
  %87 = fsub double %86, %82
  %88 = fsub double %85, %87
  %89 = fadd double %86, 0x3FE5555555555555
  %90 = fadd double %89, 0xBFE5555555555555
  %91 = fsub double %86, %90
  %92 = fadd double %88, 0x3C8543B0D5DF274D
  %93 = fadd double %92, %91
  %94 = fadd double %89, %93
  %95 = fsub double %94, %89
  %96 = fsub double %93, %95
  %97 = fmul double %79, %94
  %98 = fneg double %97
  %99 = tail call double @llvm.fma.f64(double %79, double %94, double %98)
  %100 = tail call double @llvm.fma.f64(double %79, double %96, double %99)
  %101 = tail call double @llvm.fma.f64(double %81, double %94, double %100)
  %102 = fadd double %97, %101
  %103 = fsub double %102, %97
  %104 = fsub double %101, %103
  %105 = fadd double %72, %102
  %106 = fsub double %105, %72
  %107 = fsub double %102, %106
  %108 = fadd double %73, %104
  %109 = fadd double %108, %107
  %110 = fadd double %105, %109
  %111 = fsub double %110, %105
  %112 = fsub double %109, %111
  %113 = fadd double %69, %110
  %114 = fsub double %113, %69
  %115 = fsub double %113, %114
  %116 = fsub double %69, %115
  %117 = fsub double %110, %114
  %118 = fadd double %117, %116
  %119 = fadd double %71, %112
  %120 = fsub double %119, %71
  %121 = fsub double %119, %120
  %122 = fsub double %71, %121
  %123 = fsub double %112, %120
  %124 = fadd double %123, %122
  %125 = fadd double %119, %118
  %126 = fadd double %113, %125
  %127 = fsub double %126, %113
  %128 = fsub double %125, %127
  %129 = fadd double %124, %128
  %130 = fadd double %126, %129
  %131 = fsub double %130, %126
  %132 = fsub double %129, %131
  %133 = fmul double %13, %130
  %134 = fneg double %133
  %135 = tail call double @llvm.fma.f64(double %13, double %130, double %134)
  %136 = tail call double @llvm.fma.f64(double %13, double %132, double %135)
  %137 = fadd double %133, %136
  %138 = fsub double %137, %133
  %139 = fsub double %136, %138
  %140 = tail call double @llvm.fabs.f64(double %133) #3
  %141 = fcmp oeq double %140, 0x7FF0000000000000
  %142 = select i1 %141, double %133, double %137
  %143 = tail call double @llvm.fabs.f64(double %142) #3
  %144 = fcmp oeq double %143, 0x7FF0000000000000
  %145 = select i1 %144, double 0.000000e+00, double %139
  %146 = fmul double %142, 0x3FF71547652B82FE
  %147 = tail call double @llvm.rint.f64(double %146)
  %148 = fneg double %147
  %149 = tail call double @llvm.fma.f64(double %148, double 0x3FE62E42FEFA39EF, double %142)
  %150 = tail call double @llvm.fma.f64(double %148, double 0x3C7ABC9E3B39803F, double %149)
  %151 = tail call double @llvm.fma.f64(double %150, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %152 = tail call double @llvm.fma.f64(double %150, double %151, double 0x3EC71DEE623FDE64)
  %153 = tail call double @llvm.fma.f64(double %150, double %152, double 0x3EFA01997C89E6B0)
  %154 = tail call double @llvm.fma.f64(double %150, double %153, double 0x3F2A01A014761F6E)
  %155 = tail call double @llvm.fma.f64(double %150, double %154, double 0x3F56C16C1852B7B0)
  %156 = tail call double @llvm.fma.f64(double %150, double %155, double 0x3F81111111122322)
  %157 = tail call double @llvm.fma.f64(double %150, double %156, double 0x3FA55555555502A1)
  %158 = tail call double @llvm.fma.f64(double %150, double %157, double 0x3FC5555555555511)
  %159 = tail call double @llvm.fma.f64(double %150, double %158, double 0x3FE000000000000B)
  %160 = tail call double @llvm.fma.f64(double %150, double %159, double 1.000000e+00)
  %161 = tail call double @llvm.fma.f64(double %150, double %160, double 1.000000e+00)
  %162 = fptosi double %147 to i32
  %163 = tail call double @llvm.amdgcn.ldexp.f64(double %161, i32 %162)
  %164 = fcmp ogt double %142, 1.024000e+03
  %165 = select i1 %164, double 0x7FF0000000000000, double %163
  %166 = fcmp olt double %142, -1.075000e+03
  %167 = select i1 %166, double 0.000000e+00, double %165
  %168 = tail call double @llvm.fma.f64(double %167, double %145, double %167)
  %169 = tail call double @llvm.fabs.f64(double %167) #3
  %170 = fcmp oeq double %169, 0x7FF0000000000000
  %171 = select i1 %170, double %167, double %168
  %172 = tail call double @llvm.fabs.f64(double %13)
  %173 = tail call double @llvm.trunc.f64(double %172)
  %174 = fcmp oeq double %172, %173
  %175 = zext i1 %174 to i32
  %176 = fmul double %173, 5.000000e-01
  %177 = tail call double @llvm.amdgcn.fract.f64(double %176)
  %178 = tail call i1 @llvm.amdgcn.class.f64(double %176, i32 516)
  %179 = select i1 %178, double 0.000000e+00, double %177
  %180 = fcmp oeq double %179, 0.000000e+00
  %181 = and i1 %174, %180
  %182 = zext i1 %181 to i32
  %183 = add nuw nsw i32 %182, %175
  %184 = icmp eq i32 %183, 1
  %185 = fcmp olt double %12, 0.000000e+00
  %186 = and i1 %184, %185
  %187 = select i1 %186, double -0.000000e+00, double 0.000000e+00
  %188 = tail call double @llvm.copysign.f64(double %171, double %187)
  %189 = fcmp uge double %12, 0.000000e+00
  %190 = icmp ne i32 %183, 0
  %191 = select i1 %189, i1 true, i1 %190
  %192 = select i1 %191, double %188, double 0x7FF8000000000000
  %193 = fcmp oeq double %172, 0x7FF0000000000000
  %194 = fcmp oeq double %14, 1.000000e+00
  %195 = fadd double %14, -1.000000e+00
  %196 = bitcast double %13 to <2 x i32>
  %197 = extractelement <2 x i32> %196, i64 1
  %198 = bitcast double %195 to <2 x i32>
  %199 = extractelement <2 x i32> %198, i64 1
  %200 = xor i32 %199, %197
  %201 = icmp sgt i32 %200, -1
  %202 = select i1 %201, double 0x7FF0000000000000, double 0.000000e+00
  %203 = select i1 %194, double %14, double %202
  %204 = select i1 %193, double %203, double %192
  %205 = fcmp oeq double %14, 0x7FF0000000000000
  %206 = fcmp oeq double %12, 0.000000e+00
  %207 = or i1 %206, %205
  %208 = fcmp olt double %13, 0.000000e+00
  %209 = xor i1 %208, %206
  %210 = select i1 %209, double 0.000000e+00, double 0x7FF0000000000000
  %211 = select i1 %184, double %12, double 0.000000e+00
  %212 = tail call double @llvm.copysign.f64(double %210, double %211)
  %213 = select i1 %207, double %212, double %204
  %214 = fcmp uno double %12, %13
  %215 = fcmp oeq double %12, 1.000000e+00
  %216 = fcmp oeq double %13, 0.000000e+00
  %217 = or i1 %216, %215
  %218 = fmul contract double %213, 2.550000e+02
  %219 = select i1 %214, double 0x7FF8000000000000, double %218
  %220 = fptosi double %219 to i32
  %221 = select i1 %217, i32 255, i32 %220
  %222 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  store i32 %221, i32 addrspace(1)* %222, align 4, !tbaa !5
  br label %223

223:                                              ; preds = %7, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
