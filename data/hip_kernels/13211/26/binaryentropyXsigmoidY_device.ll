; ModuleID = '../data/hip_kernels/13211/26/main.cu'
source_filename = "../data/hip_kernels/13211/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22binaryentropyXsigmoidYiPKdS0_Pd(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %304

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %1, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !6
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
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %54 = tail call double @llvm.fma.f64(double %52, double %53, double 0x3FC7474DD7F4DF2E)
  %55 = tail call double @llvm.fma.f64(double %52, double %54, double 0x3FCC71C016291751)
  %56 = tail call double @llvm.fma.f64(double %52, double %55, double 0x3FD249249B27ACF1)
  %57 = tail call double @llvm.fma.f64(double %52, double %56, double 0x3FD99999998EF7B6)
  %58 = tail call double @llvm.fma.f64(double %52, double %57, double 0x3FE5555555555780)
  %59 = tail call double @llvm.amdgcn.ldexp.f64(double %49, i32 1)
  %60 = tail call double @llvm.amdgcn.ldexp.f64(double %51, i32 1)
  %61 = fmul double %49, %52
  %62 = fmul double %61, %58
  %63 = fadd double %59, %62
  %64 = fsub double %63, %59
  %65 = fsub double %62, %64
  %66 = fadd double %60, %65
  %67 = fadd double %63, %66
  %68 = fsub double %67, %63
  %69 = fsub double %66, %68
  %70 = sitofp i32 %24 to double
  %71 = fmul double %70, 0x3FE62E42FEFA39EF
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %70, double 0x3FE62E42FEFA39EF, double %72)
  %74 = tail call double @llvm.fma.f64(double %70, double 0x3C7ABC9E3B39803F, double %73)
  %75 = fadd double %71, %74
  %76 = fsub double %75, %71
  %77 = fsub double %74, %76
  %78 = fadd double %75, %67
  %79 = fsub double %78, %75
  %80 = fsub double %78, %79
  %81 = fsub double %75, %80
  %82 = fsub double %67, %79
  %83 = fadd double %82, %81
  %84 = fadd double %77, %69
  %85 = fsub double %84, %77
  %86 = fsub double %84, %85
  %87 = fsub double %77, %86
  %88 = fsub double %69, %85
  %89 = fadd double %88, %87
  %90 = fadd double %84, %83
  %91 = fadd double %78, %90
  %92 = fsub double %91, %78
  %93 = fsub double %90, %92
  %94 = fadd double %89, %93
  %95 = fadd double %91, %94
  %96 = tail call double @llvm.fabs.f64(double %18) #3
  %97 = fcmp oeq double %96, 0x7FF0000000000000
  %98 = select i1 %97, double %18, double %95
  %99 = fcmp olt double %18, 0.000000e+00
  %100 = select i1 %99, double 0x7FF8000000000000, double %98
  %101 = fcmp oeq double %18, 0.000000e+00
  %102 = select i1 %101, double 0xFFF0000000000000, double %100
  %103 = fmul contract double %18, %102
  %104 = fsub contract double 1.000000e+00, %18
  %105 = tail call double @llvm.amdgcn.frexp.mant.f64(double %104)
  %106 = fcmp olt double %105, 0x3FE5555555555555
  %107 = zext i1 %106 to i32
  %108 = tail call double @llvm.amdgcn.ldexp.f64(double %105, i32 %107)
  %109 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %104)
  %110 = sub nsw i32 %109, %107
  %111 = fadd double %108, -1.000000e+00
  %112 = fadd double %108, 1.000000e+00
  %113 = fadd double %112, -1.000000e+00
  %114 = fsub double %108, %113
  %115 = tail call double @llvm.amdgcn.rcp.f64(double %112)
  %116 = fneg double %112
  %117 = tail call double @llvm.fma.f64(double %116, double %115, double 1.000000e+00)
  %118 = tail call double @llvm.fma.f64(double %117, double %115, double %115)
  %119 = tail call double @llvm.fma.f64(double %116, double %118, double 1.000000e+00)
  %120 = tail call double @llvm.fma.f64(double %119, double %118, double %118)
  %121 = fmul double %111, %120
  %122 = fmul double %112, %121
  %123 = fneg double %122
  %124 = tail call double @llvm.fma.f64(double %121, double %112, double %123)
  %125 = tail call double @llvm.fma.f64(double %121, double %114, double %124)
  %126 = fadd double %122, %125
  %127 = fsub double %126, %122
  %128 = fsub double %125, %127
  %129 = fsub double %111, %126
  %130 = fsub double %111, %129
  %131 = fsub double %130, %126
  %132 = fsub double %131, %128
  %133 = fadd double %129, %132
  %134 = fmul double %120, %133
  %135 = fadd double %121, %134
  %136 = fsub double %135, %121
  %137 = fsub double %134, %136
  %138 = fmul double %135, %135
  %139 = tail call double @llvm.fma.f64(double %138, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %140 = tail call double @llvm.fma.f64(double %138, double %139, double 0x3FC7474DD7F4DF2E)
  %141 = tail call double @llvm.fma.f64(double %138, double %140, double 0x3FCC71C016291751)
  %142 = tail call double @llvm.fma.f64(double %138, double %141, double 0x3FD249249B27ACF1)
  %143 = tail call double @llvm.fma.f64(double %138, double %142, double 0x3FD99999998EF7B6)
  %144 = tail call double @llvm.fma.f64(double %138, double %143, double 0x3FE5555555555780)
  %145 = tail call double @llvm.amdgcn.ldexp.f64(double %135, i32 1)
  %146 = tail call double @llvm.amdgcn.ldexp.f64(double %137, i32 1)
  %147 = fmul double %135, %138
  %148 = fmul double %147, %144
  %149 = fadd double %145, %148
  %150 = fsub double %149, %145
  %151 = fsub double %148, %150
  %152 = fadd double %146, %151
  %153 = fadd double %149, %152
  %154 = fsub double %153, %149
  %155 = fsub double %152, %154
  %156 = sitofp i32 %110 to double
  %157 = fmul double %156, 0x3FE62E42FEFA39EF
  %158 = fneg double %157
  %159 = tail call double @llvm.fma.f64(double %156, double 0x3FE62E42FEFA39EF, double %158)
  %160 = tail call double @llvm.fma.f64(double %156, double 0x3C7ABC9E3B39803F, double %159)
  %161 = fadd double %157, %160
  %162 = fsub double %161, %157
  %163 = fsub double %160, %162
  %164 = fadd double %161, %153
  %165 = fsub double %164, %161
  %166 = fsub double %164, %165
  %167 = fsub double %161, %166
  %168 = fsub double %153, %165
  %169 = fadd double %168, %167
  %170 = fadd double %163, %155
  %171 = fsub double %170, %163
  %172 = fsub double %170, %171
  %173 = fsub double %163, %172
  %174 = fsub double %155, %171
  %175 = fadd double %174, %173
  %176 = fadd double %170, %169
  %177 = fadd double %164, %176
  %178 = fsub double %177, %164
  %179 = fsub double %176, %178
  %180 = fadd double %175, %179
  %181 = fadd double %177, %180
  %182 = tail call double @llvm.fabs.f64(double %104) #3
  %183 = fcmp oeq double %182, 0x7FF0000000000000
  %184 = select i1 %183, double %104, double %181
  %185 = fcmp olt double %104, 0.000000e+00
  %186 = select i1 %185, double 0x7FF8000000000000, double %184
  %187 = fcmp oeq double %104, 0.000000e+00
  %188 = select i1 %187, double 0xFFF0000000000000, double %186
  %189 = fmul contract double %104, %188
  %190 = fadd contract double %103, %189
  %191 = getelementptr inbounds double, double addrspace(1)* %2, i64 %16
  %192 = load double, double addrspace(1)* %191, align 8, !tbaa !7, !amdgpu.noclobber !6
  %193 = fmul contract double %18, %192
  %194 = fsub contract double %190, %193
  %195 = fmul double %192, 0x3FF71547652B82FE
  %196 = tail call double @llvm.rint.f64(double %195)
  %197 = fneg double %196
  %198 = tail call double @llvm.fma.f64(double %197, double 0x3FE62E42FEFA39EF, double %192)
  %199 = tail call double @llvm.fma.f64(double %197, double 0x3C7ABC9E3B39803F, double %198)
  %200 = tail call double @llvm.fma.f64(double %199, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %201 = tail call double @llvm.fma.f64(double %199, double %200, double 0x3EC71DEE623FDE64)
  %202 = tail call double @llvm.fma.f64(double %199, double %201, double 0x3EFA01997C89E6B0)
  %203 = tail call double @llvm.fma.f64(double %199, double %202, double 0x3F2A01A014761F6E)
  %204 = tail call double @llvm.fma.f64(double %199, double %203, double 0x3F56C16C1852B7B0)
  %205 = tail call double @llvm.fma.f64(double %199, double %204, double 0x3F81111111122322)
  %206 = tail call double @llvm.fma.f64(double %199, double %205, double 0x3FA55555555502A1)
  %207 = tail call double @llvm.fma.f64(double %199, double %206, double 0x3FC5555555555511)
  %208 = tail call double @llvm.fma.f64(double %199, double %207, double 0x3FE000000000000B)
  %209 = tail call double @llvm.fma.f64(double %199, double %208, double 1.000000e+00)
  %210 = tail call double @llvm.fma.f64(double %199, double %209, double 1.000000e+00)
  %211 = fptosi double %196 to i32
  %212 = tail call double @llvm.amdgcn.ldexp.f64(double %210, i32 %211)
  %213 = fcmp ogt double %192, 1.024000e+03
  %214 = fcmp olt double %192, -1.075000e+03
  %215 = fadd contract double %212, 1.000000e+00
  %216 = select i1 %213, double 0x7FF0000000000000, double %215
  %217 = select i1 %214, double 1.000000e+00, double %216
  %218 = tail call double @llvm.amdgcn.frexp.mant.f64(double %217)
  %219 = fcmp olt double %218, 0x3FE5555555555555
  %220 = zext i1 %219 to i32
  %221 = tail call double @llvm.amdgcn.ldexp.f64(double %218, i32 %220)
  %222 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %217)
  %223 = sub nsw i32 %222, %220
  %224 = fadd double %221, -1.000000e+00
  %225 = fadd double %221, 1.000000e+00
  %226 = fadd double %225, -1.000000e+00
  %227 = fsub double %221, %226
  %228 = tail call double @llvm.amdgcn.rcp.f64(double %225)
  %229 = fneg double %225
  %230 = tail call double @llvm.fma.f64(double %229, double %228, double 1.000000e+00)
  %231 = tail call double @llvm.fma.f64(double %230, double %228, double %228)
  %232 = tail call double @llvm.fma.f64(double %229, double %231, double 1.000000e+00)
  %233 = tail call double @llvm.fma.f64(double %232, double %231, double %231)
  %234 = fmul double %224, %233
  %235 = fmul double %225, %234
  %236 = fneg double %235
  %237 = tail call double @llvm.fma.f64(double %234, double %225, double %236)
  %238 = tail call double @llvm.fma.f64(double %234, double %227, double %237)
  %239 = fadd double %235, %238
  %240 = fsub double %239, %235
  %241 = fsub double %238, %240
  %242 = fsub double %224, %239
  %243 = fsub double %224, %242
  %244 = fsub double %243, %239
  %245 = fsub double %244, %241
  %246 = fadd double %242, %245
  %247 = fmul double %233, %246
  %248 = fadd double %234, %247
  %249 = fsub double %248, %234
  %250 = fsub double %247, %249
  %251 = fmul double %248, %248
  %252 = tail call double @llvm.fma.f64(double %251, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %253 = tail call double @llvm.fma.f64(double %251, double %252, double 0x3FC7474DD7F4DF2E)
  %254 = tail call double @llvm.fma.f64(double %251, double %253, double 0x3FCC71C016291751)
  %255 = tail call double @llvm.fma.f64(double %251, double %254, double 0x3FD249249B27ACF1)
  %256 = tail call double @llvm.fma.f64(double %251, double %255, double 0x3FD99999998EF7B6)
  %257 = tail call double @llvm.fma.f64(double %251, double %256, double 0x3FE5555555555780)
  %258 = tail call double @llvm.amdgcn.ldexp.f64(double %248, i32 1)
  %259 = tail call double @llvm.amdgcn.ldexp.f64(double %250, i32 1)
  %260 = fmul double %248, %251
  %261 = fmul double %260, %257
  %262 = fadd double %258, %261
  %263 = fsub double %262, %258
  %264 = fsub double %261, %263
  %265 = fadd double %259, %264
  %266 = fadd double %262, %265
  %267 = fsub double %266, %262
  %268 = fsub double %265, %267
  %269 = sitofp i32 %223 to double
  %270 = fmul double %269, 0x3FE62E42FEFA39EF
  %271 = fneg double %270
  %272 = tail call double @llvm.fma.f64(double %269, double 0x3FE62E42FEFA39EF, double %271)
  %273 = tail call double @llvm.fma.f64(double %269, double 0x3C7ABC9E3B39803F, double %272)
  %274 = fadd double %270, %273
  %275 = fsub double %274, %270
  %276 = fsub double %273, %275
  %277 = fadd double %274, %266
  %278 = fsub double %277, %274
  %279 = fsub double %277, %278
  %280 = fsub double %274, %279
  %281 = fsub double %266, %278
  %282 = fadd double %281, %280
  %283 = fadd double %276, %268
  %284 = fsub double %283, %276
  %285 = fsub double %283, %284
  %286 = fsub double %276, %285
  %287 = fsub double %268, %284
  %288 = fadd double %287, %286
  %289 = fadd double %283, %282
  %290 = fadd double %277, %289
  %291 = fsub double %290, %277
  %292 = fsub double %289, %291
  %293 = fadd double %288, %292
  %294 = fadd double %290, %293
  %295 = tail call double @llvm.fabs.f64(double %217) #3
  %296 = fcmp oeq double %295, 0x7FF0000000000000
  %297 = select i1 %296, double %217, double %294
  %298 = fcmp olt double %217, 0.000000e+00
  %299 = select i1 %298, double 0x7FF8000000000000, double %297
  %300 = fcmp oeq double %217, 0.000000e+00
  %301 = select i1 %300, double 0xFFF0000000000000, double %299
  %302 = fadd contract double %194, %301
  %303 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  store double %302, double addrspace(1)* %303, align 8, !tbaa !7
  br label %304

304:                                              ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
