; ModuleID = '../data/hip_kernels/11896/16/main.cu'
source_filename = "../data/hip_kernels/11896/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z8KparamARPdS_S_ddii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double %3, double %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %5
  %26 = icmp slt i32 %24, %6
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %244

28:                                               ; preds = %7
  %29 = sdiv i32 %5, 2
  %30 = icmp sgt i32 %16, %29
  %31 = sub nsw i32 %5, %16
  %32 = select i1 %30, i32 %31, i32 %16
  %33 = sdiv i32 %6, 2
  %34 = icmp sgt i32 %24, %33
  %35 = sub nsw i32 %6, %24
  %36 = select i1 %34, i32 %35, i32 %24
  %37 = sitofp i32 %32 to double
  %38 = fmul contract double %37, %37
  %39 = sitofp i32 %36 to double
  %40 = fmul contract double %39, %39
  %41 = fadd contract double %38, %40
  %42 = fcmp olt double %41, 0x1000000000000000
  %43 = select i1 %42, double 0x4FF0000000000000, double 1.000000e+00
  %44 = fmul double %41, %43
  %45 = tail call double @llvm.amdgcn.rsq.f64(double %44)
  %46 = fmul double %44, %45
  %47 = fmul double %45, 5.000000e-01
  %48 = fneg double %47
  %49 = tail call double @llvm.fma.f64(double %48, double %46, double 5.000000e-01)
  %50 = tail call double @llvm.fma.f64(double %47, double %49, double %47)
  %51 = tail call double @llvm.fma.f64(double %46, double %49, double %46)
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double %44)
  %54 = tail call double @llvm.fma.f64(double %53, double %50, double %51)
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double %44)
  %57 = tail call double @llvm.fma.f64(double %56, double %50, double %54)
  %58 = select i1 %42, double 0x37F0000000000000, double 1.000000e+00
  %59 = fmul double %58, %57
  %60 = fcmp oeq double %44, 0.000000e+00
  %61 = fcmp oeq double %44, 0x7FF0000000000000
  %62 = or i1 %60, %61
  %63 = select i1 %62, double %44, double %59
  %64 = fadd contract double %63, 0x3EB0C6F7A0B5ED8D
  %65 = fmul contract double %4, 2.000000e+00
  %66 = fmul contract double %65, %3
  %67 = fmul contract double %66, %64
  %68 = fsub contract double 2.000000e+00, %67
  %69 = fmul contract double %3, %4
  %70 = fmul contract double %69, %64
  %71 = tail call double @llvm.fabs.f64(double %70)
  %72 = tail call double @llvm.amdgcn.frexp.mant.f64(double %71)
  %73 = fcmp olt double %72, 0x3FE5555555555555
  %74 = zext i1 %73 to i32
  %75 = tail call double @llvm.amdgcn.ldexp.f64(double %72, i32 %74)
  %76 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %71)
  %77 = sub nsw i32 %76, %74
  %78 = fadd double %75, -1.000000e+00
  %79 = fadd double %75, 1.000000e+00
  %80 = fadd double %79, -1.000000e+00
  %81 = fsub double %75, %80
  %82 = tail call double @llvm.amdgcn.rcp.f64(double %79)
  %83 = fneg double %79
  %84 = tail call double @llvm.fma.f64(double %83, double %82, double 1.000000e+00)
  %85 = tail call double @llvm.fma.f64(double %84, double %82, double %82)
  %86 = tail call double @llvm.fma.f64(double %83, double %85, double 1.000000e+00)
  %87 = tail call double @llvm.fma.f64(double %86, double %85, double %85)
  %88 = fmul double %78, %87
  %89 = fmul double %79, %88
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double %79, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double %81, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fsub double %78, %93
  %97 = fsub double %78, %96
  %98 = fsub double %97, %93
  %99 = fsub double %98, %95
  %100 = fadd double %96, %99
  %101 = fmul double %87, %100
  %102 = fadd double %88, %101
  %103 = fsub double %102, %88
  %104 = fsub double %101, %103
  %105 = fmul double %102, %102
  %106 = fneg double %105
  %107 = tail call double @llvm.fma.f64(double %102, double %102, double %106)
  %108 = fmul double %104, 2.000000e+00
  %109 = tail call double @llvm.fma.f64(double %102, double %108, double %107)
  %110 = fadd double %105, %109
  %111 = fsub double %110, %105
  %112 = fsub double %109, %111
  %113 = tail call double @llvm.fma.f64(double %110, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %114 = tail call double @llvm.fma.f64(double %110, double %113, double 0x3FBE25E43ABE935A)
  %115 = tail call double @llvm.fma.f64(double %110, double %114, double 0x3FC110EF47E6C9C2)
  %116 = tail call double @llvm.fma.f64(double %110, double %115, double 0x3FC3B13BCFA74449)
  %117 = tail call double @llvm.fma.f64(double %110, double %116, double 0x3FC745D171BF3C30)
  %118 = tail call double @llvm.fma.f64(double %110, double %117, double 0x3FCC71C71C7792CE)
  %119 = tail call double @llvm.fma.f64(double %110, double %118, double 0x3FD24924924920DA)
  %120 = tail call double @llvm.fma.f64(double %110, double %119, double 0x3FD999999999999C)
  %121 = sitofp i32 %77 to double
  %122 = fmul double %121, 0x3FE62E42FEFA39EF
  %123 = fneg double %122
  %124 = tail call double @llvm.fma.f64(double %121, double 0x3FE62E42FEFA39EF, double %123)
  %125 = tail call double @llvm.fma.f64(double %121, double 0x3C7ABC9E3B39803F, double %124)
  %126 = fadd double %122, %125
  %127 = fsub double %126, %122
  %128 = fsub double %125, %127
  %129 = tail call double @llvm.amdgcn.ldexp.f64(double %102, i32 1)
  %130 = tail call double @llvm.amdgcn.ldexp.f64(double %104, i32 1)
  %131 = fmul double %102, %110
  %132 = fneg double %131
  %133 = tail call double @llvm.fma.f64(double %110, double %102, double %132)
  %134 = tail call double @llvm.fma.f64(double %110, double %104, double %133)
  %135 = tail call double @llvm.fma.f64(double %112, double %102, double %134)
  %136 = fadd double %131, %135
  %137 = fsub double %136, %131
  %138 = fsub double %135, %137
  %139 = fmul double %110, %120
  %140 = fneg double %139
  %141 = tail call double @llvm.fma.f64(double %110, double %120, double %140)
  %142 = tail call double @llvm.fma.f64(double %112, double %120, double %141)
  %143 = fadd double %139, %142
  %144 = fsub double %143, %139
  %145 = fsub double %142, %144
  %146 = fadd double %143, 0x3FE5555555555555
  %147 = fadd double %146, 0xBFE5555555555555
  %148 = fsub double %143, %147
  %149 = fadd double %145, 0x3C8543B0D5DF274D
  %150 = fadd double %149, %148
  %151 = fadd double %146, %150
  %152 = fsub double %151, %146
  %153 = fsub double %150, %152
  %154 = fmul double %136, %151
  %155 = fneg double %154
  %156 = tail call double @llvm.fma.f64(double %136, double %151, double %155)
  %157 = tail call double @llvm.fma.f64(double %136, double %153, double %156)
  %158 = tail call double @llvm.fma.f64(double %138, double %151, double %157)
  %159 = fadd double %154, %158
  %160 = fsub double %159, %154
  %161 = fsub double %158, %160
  %162 = fadd double %129, %159
  %163 = fsub double %162, %129
  %164 = fsub double %159, %163
  %165 = fadd double %130, %161
  %166 = fadd double %165, %164
  %167 = fadd double %162, %166
  %168 = fsub double %167, %162
  %169 = fsub double %166, %168
  %170 = fadd double %126, %167
  %171 = fsub double %170, %126
  %172 = fsub double %170, %171
  %173 = fsub double %126, %172
  %174 = fsub double %167, %171
  %175 = fadd double %174, %173
  %176 = fadd double %128, %169
  %177 = fsub double %176, %128
  %178 = fsub double %176, %177
  %179 = fsub double %128, %178
  %180 = fsub double %169, %177
  %181 = fadd double %180, %179
  %182 = fadd double %176, %175
  %183 = fadd double %170, %182
  %184 = fsub double %183, %170
  %185 = fsub double %182, %184
  %186 = fadd double %181, %185
  %187 = fadd double %183, %186
  %188 = fsub double %187, %183
  %189 = fsub double %186, %188
  %190 = fmul double %187, 2.000000e+00
  %191 = fneg double %190
  %192 = tail call double @llvm.fma.f64(double %187, double 2.000000e+00, double %191)
  %193 = tail call double @llvm.fma.f64(double %189, double 2.000000e+00, double %192)
  %194 = fadd double %190, %193
  %195 = fsub double %194, %190
  %196 = fsub double %193, %195
  %197 = tail call double @llvm.fabs.f64(double %190) #3
  %198 = fcmp oeq double %197, 0x7FF0000000000000
  %199 = select i1 %198, double %190, double %194
  %200 = tail call double @llvm.fabs.f64(double %199) #3
  %201 = fcmp oeq double %200, 0x7FF0000000000000
  %202 = select i1 %201, double 0.000000e+00, double %196
  %203 = fmul double %199, 0x3FF71547652B82FE
  %204 = tail call double @llvm.rint.f64(double %203)
  %205 = fneg double %204
  %206 = tail call double @llvm.fma.f64(double %205, double 0x3FE62E42FEFA39EF, double %199)
  %207 = tail call double @llvm.fma.f64(double %205, double 0x3C7ABC9E3B39803F, double %206)
  %208 = tail call double @llvm.fma.f64(double %207, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %209 = tail call double @llvm.fma.f64(double %207, double %208, double 0x3EC71DEE623FDE64)
  %210 = tail call double @llvm.fma.f64(double %207, double %209, double 0x3EFA01997C89E6B0)
  %211 = tail call double @llvm.fma.f64(double %207, double %210, double 0x3F2A01A014761F6E)
  %212 = tail call double @llvm.fma.f64(double %207, double %211, double 0x3F56C16C1852B7B0)
  %213 = tail call double @llvm.fma.f64(double %207, double %212, double 0x3F81111111122322)
  %214 = tail call double @llvm.fma.f64(double %207, double %213, double 0x3FA55555555502A1)
  %215 = tail call double @llvm.fma.f64(double %207, double %214, double 0x3FC5555555555511)
  %216 = tail call double @llvm.fma.f64(double %207, double %215, double 0x3FE000000000000B)
  %217 = tail call double @llvm.fma.f64(double %207, double %216, double 1.000000e+00)
  %218 = tail call double @llvm.fma.f64(double %207, double %217, double 1.000000e+00)
  %219 = fptosi double %204 to i32
  %220 = tail call double @llvm.amdgcn.ldexp.f64(double %218, i32 %219)
  %221 = fcmp ogt double %199, 1.024000e+03
  %222 = select i1 %221, double 0x7FF0000000000000, double %220
  %223 = fcmp olt double %199, -1.075000e+03
  %224 = select i1 %223, double 0.000000e+00, double %222
  %225 = tail call double @llvm.fma.f64(double %224, double %202, double %224)
  %226 = tail call double @llvm.fabs.f64(double %224) #3
  %227 = fcmp oeq double %226, 0x7FF0000000000000
  %228 = select i1 %227, double %224, double %225
  %229 = tail call double @llvm.fabs.f64(double %228)
  %230 = fcmp oeq double %71, 0x7FF0000000000000
  %231 = fcmp oeq double %70, 0.000000e+00
  %232 = select i1 %230, double 0x7FF0000000000000, double %229
  %233 = select i1 %231, double 0.000000e+00, double %232
  %234 = fcmp uno double %70, 0.000000e+00
  %235 = select i1 %234, double 0x7FF8000000000000, double %233
  %236 = fsub contract double %68, %235
  %237 = mul nsw i32 %24, %5
  %238 = add nsw i32 %237, %16
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds double, double addrspace(1)* %0, i64 %239
  store double %236, double addrspace(1)* %240, align 8, !tbaa !7
  %241 = fadd contract double %67, -1.000000e+00
  %242 = getelementptr inbounds double, double addrspace(1)* %1, i64 %239
  store double %241, double addrspace(1)* %242, align 8, !tbaa !7
  %243 = getelementptr inbounds double, double addrspace(1)* %2, i64 %239
  store double 1.000000e+00, double addrspace(1)* %243, align 8, !tbaa !7
  br label %244

244:                                              ; preds = %7, %28
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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
