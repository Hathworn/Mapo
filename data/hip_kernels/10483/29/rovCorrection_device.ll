; ModuleID = '../data/hip_kernels/10483/29/main.cu'
source_filename = "../data/hip_kernels/10483/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13rovCorrectioniiiiiiiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %240

19:                                               ; preds = %8
  %20 = mul nsw i32 %5, %4
  %21 = mul nsw i32 %2, %1
  %22 = sitofp i32 %2 to double
  %23 = sitofp i32 %1 to double
  %24 = tail call double @llvm.fabs.f64(double %22)
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
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %55, double %55, double %59)
  %61 = fmul double %57, 2.000000e+00
  %62 = tail call double @llvm.fma.f64(double %55, double %61, double %60)
  %63 = fadd double %58, %62
  %64 = fsub double %63, %58
  %65 = fsub double %62, %64
  %66 = tail call double @llvm.fma.f64(double %63, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %67 = tail call double @llvm.fma.f64(double %63, double %66, double 0x3FBE25E43ABE935A)
  %68 = tail call double @llvm.fma.f64(double %63, double %67, double 0x3FC110EF47E6C9C2)
  %69 = tail call double @llvm.fma.f64(double %63, double %68, double 0x3FC3B13BCFA74449)
  %70 = tail call double @llvm.fma.f64(double %63, double %69, double 0x3FC745D171BF3C30)
  %71 = tail call double @llvm.fma.f64(double %63, double %70, double 0x3FCC71C71C7792CE)
  %72 = tail call double @llvm.fma.f64(double %63, double %71, double 0x3FD24924924920DA)
  %73 = tail call double @llvm.fma.f64(double %63, double %72, double 0x3FD999999999999C)
  %74 = sitofp i32 %30 to double
  %75 = fmul double %74, 0x3FE62E42FEFA39EF
  %76 = fneg double %75
  %77 = tail call double @llvm.fma.f64(double %74, double 0x3FE62E42FEFA39EF, double %76)
  %78 = tail call double @llvm.fma.f64(double %74, double 0x3C7ABC9E3B39803F, double %77)
  %79 = fadd double %75, %78
  %80 = fsub double %79, %75
  %81 = fsub double %78, %80
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %55, i32 1)
  %83 = tail call double @llvm.amdgcn.ldexp.f64(double %57, i32 1)
  %84 = fmul double %55, %63
  %85 = fneg double %84
  %86 = tail call double @llvm.fma.f64(double %63, double %55, double %85)
  %87 = tail call double @llvm.fma.f64(double %63, double %57, double %86)
  %88 = tail call double @llvm.fma.f64(double %65, double %55, double %87)
  %89 = fadd double %84, %88
  %90 = fsub double %89, %84
  %91 = fsub double %88, %90
  %92 = fmul double %63, %73
  %93 = fneg double %92
  %94 = tail call double @llvm.fma.f64(double %63, double %73, double %93)
  %95 = tail call double @llvm.fma.f64(double %65, double %73, double %94)
  %96 = fadd double %92, %95
  %97 = fsub double %96, %92
  %98 = fsub double %95, %97
  %99 = fadd double %96, 0x3FE5555555555555
  %100 = fadd double %99, 0xBFE5555555555555
  %101 = fsub double %96, %100
  %102 = fadd double %98, 0x3C8543B0D5DF274D
  %103 = fadd double %102, %101
  %104 = fadd double %99, %103
  %105 = fsub double %104, %99
  %106 = fsub double %103, %105
  %107 = fmul double %89, %104
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %89, double %104, double %108)
  %110 = tail call double @llvm.fma.f64(double %89, double %106, double %109)
  %111 = tail call double @llvm.fma.f64(double %91, double %104, double %110)
  %112 = fadd double %107, %111
  %113 = fsub double %112, %107
  %114 = fsub double %111, %113
  %115 = fadd double %82, %112
  %116 = fsub double %115, %82
  %117 = fsub double %112, %116
  %118 = fadd double %83, %114
  %119 = fadd double %118, %117
  %120 = fadd double %115, %119
  %121 = fsub double %120, %115
  %122 = fsub double %119, %121
  %123 = fadd double %79, %120
  %124 = fsub double %123, %79
  %125 = fsub double %123, %124
  %126 = fsub double %79, %125
  %127 = fsub double %120, %124
  %128 = fadd double %127, %126
  %129 = fadd double %81, %122
  %130 = fsub double %129, %81
  %131 = fsub double %129, %130
  %132 = fsub double %81, %131
  %133 = fsub double %122, %130
  %134 = fadd double %133, %132
  %135 = fadd double %129, %128
  %136 = fadd double %123, %135
  %137 = fsub double %136, %123
  %138 = fsub double %135, %137
  %139 = fadd double %134, %138
  %140 = fadd double %136, %139
  %141 = fsub double %140, %136
  %142 = fsub double %139, %141
  %143 = fmul double %140, %23
  %144 = fneg double %143
  %145 = tail call double @llvm.fma.f64(double %23, double %140, double %144)
  %146 = tail call double @llvm.fma.f64(double %23, double %142, double %145)
  %147 = fadd double %143, %146
  %148 = fsub double %147, %143
  %149 = fsub double %146, %148
  %150 = tail call double @llvm.fabs.f64(double %143) #3
  %151 = fcmp oeq double %150, 0x7FF0000000000000
  %152 = select i1 %151, double %143, double %147
  %153 = tail call double @llvm.fabs.f64(double %152) #3
  %154 = fcmp oeq double %153, 0x7FF0000000000000
  %155 = select i1 %154, double 0.000000e+00, double %149
  %156 = fmul double %152, 0x3FF71547652B82FE
  %157 = tail call double @llvm.rint.f64(double %156)
  %158 = fneg double %157
  %159 = tail call double @llvm.fma.f64(double %158, double 0x3FE62E42FEFA39EF, double %152)
  %160 = tail call double @llvm.fma.f64(double %158, double 0x3C7ABC9E3B39803F, double %159)
  %161 = tail call double @llvm.fma.f64(double %160, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %162 = tail call double @llvm.fma.f64(double %160, double %161, double 0x3EC71DEE623FDE64)
  %163 = tail call double @llvm.fma.f64(double %160, double %162, double 0x3EFA01997C89E6B0)
  %164 = tail call double @llvm.fma.f64(double %160, double %163, double 0x3F2A01A014761F6E)
  %165 = tail call double @llvm.fma.f64(double %160, double %164, double 0x3F56C16C1852B7B0)
  %166 = tail call double @llvm.fma.f64(double %160, double %165, double 0x3F81111111122322)
  %167 = tail call double @llvm.fma.f64(double %160, double %166, double 0x3FA55555555502A1)
  %168 = tail call double @llvm.fma.f64(double %160, double %167, double 0x3FC5555555555511)
  %169 = tail call double @llvm.fma.f64(double %160, double %168, double 0x3FE000000000000B)
  %170 = tail call double @llvm.fma.f64(double %160, double %169, double 1.000000e+00)
  %171 = tail call double @llvm.fma.f64(double %160, double %170, double 1.000000e+00)
  %172 = fptosi double %157 to i32
  %173 = tail call double @llvm.amdgcn.ldexp.f64(double %171, i32 %172)
  %174 = fcmp ogt double %152, 1.024000e+03
  %175 = select i1 %174, double 0x7FF0000000000000, double %173
  %176 = fcmp olt double %152, -1.075000e+03
  %177 = select i1 %176, double 0.000000e+00, double %175
  %178 = tail call double @llvm.fma.f64(double %177, double %155, double %177)
  %179 = tail call double @llvm.fabs.f64(double %177) #3
  %180 = fcmp oeq double %179, 0x7FF0000000000000
  %181 = select i1 %180, double %177, double %178
  %182 = tail call double @llvm.fabs.f64(double %23)
  %183 = tail call double @llvm.trunc.f64(double %182)
  %184 = fcmp oeq double %182, %183
  %185 = zext i1 %184 to i32
  %186 = fmul double %183, 5.000000e-01
  %187 = tail call double @llvm.amdgcn.fract.f64(double %186)
  %188 = tail call i1 @llvm.amdgcn.class.f64(double %186, i32 516)
  %189 = select i1 %188, double 0.000000e+00, double %187
  %190 = fcmp oeq double %189, 0.000000e+00
  %191 = and i1 %184, %190
  %192 = zext i1 %191 to i32
  %193 = add nuw nsw i32 %192, %185
  %194 = icmp eq i32 %193, 1
  %195 = icmp slt i32 %2, 0
  %196 = and i1 %195, %194
  %197 = select i1 %196, double -0.000000e+00, double 0.000000e+00
  %198 = tail call double @llvm.copysign.f64(double %181, double %197)
  %199 = icmp sgt i32 %2, -1
  %200 = icmp ne i32 %193, 0
  %201 = select i1 %199, i1 true, i1 %200
  %202 = select i1 %201, double %198, double 0x7FF8000000000000
  %203 = fcmp oeq double %182, 0x7FF0000000000000
  %204 = fcmp oeq double %24, 1.000000e+00
  %205 = fadd double %24, -1.000000e+00
  %206 = bitcast double %23 to <2 x i32>
  %207 = extractelement <2 x i32> %206, i64 1
  %208 = bitcast double %205 to <2 x i32>
  %209 = extractelement <2 x i32> %208, i64 1
  %210 = xor i32 %209, %207
  %211 = icmp sgt i32 %210, -1
  %212 = select i1 %211, double 0x7FF0000000000000, double 0.000000e+00
  %213 = select i1 %204, double %24, double %212
  %214 = select i1 %203, double %213, double %202
  %215 = fcmp oeq double %24, 0x7FF0000000000000
  %216 = icmp eq i32 %2, 0
  %217 = or i1 %216, %215
  %218 = icmp slt i32 %1, 0
  %219 = xor i1 %218, %216
  %220 = select i1 %219, double 0.000000e+00, double 0x7FF0000000000000
  %221 = select i1 %194, double %22, double 0.000000e+00
  %222 = tail call double @llvm.copysign.f64(double %220, double %221)
  %223 = select i1 %217, double %222, double %214
  %224 = icmp eq i32 %2, 1
  %225 = icmp eq i32 %1, 0
  %226 = or i1 %225, %224
  %227 = fptosi double %223 to i32
  %228 = shl nsw i32 %227, 1
  %229 = select i1 %226, i32 2, i32 %228
  %230 = add nsw i32 %229, %21
  %231 = add i32 %20, %6
  %232 = mul i32 %230, %231
  %233 = add nsw i32 %232, %21
  %234 = add nsw i32 %233, %17
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %7, i64 %235
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !7, !amdgpu.noclobber !5
  %238 = fcmp contract ogt float %237, 0.000000e+00
  br i1 %238, label %239, label %240

239:                                              ; preds = %19
  store float 0.000000e+00, float addrspace(1)* %236, align 4, !tbaa !7
  br label %240

240:                                              ; preds = %19, %239, %8
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
