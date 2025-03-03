; ModuleID = '../data/hip_kernels/1753/4/main.cu'
source_filename = "../data/hip_kernels/1753/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7mul_ctfPfiiffffff(float addrspace(1)* nocapture %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = sitofp i32 %10 to float
  %13 = ashr i32 %2, 1
  %14 = icmp slt i32 %11, %13
  %15 = select i1 %14, i32 0, i32 %2
  %16 = sub nsw i32 %11, %15
  %17 = sitofp i32 %16 to float
  %18 = shl nsw i32 %10, 1
  %19 = add nsw i32 %1, 2
  %20 = mul nsw i32 %19, %11
  %21 = add nsw i32 %20, %18
  %22 = fmul contract float %12, %12
  %23 = fmul contract float %17, %17
  %24 = fadd contract float %22, %23
  %25 = fcmp olt float %24, 0x39F0000000000000
  %26 = select i1 %25, float 0x41F0000000000000, float 1.000000e+00
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.sqrt.f32(float %27)
  %29 = bitcast float %28 to i32
  %30 = add nsw i32 %29, -1
  %31 = bitcast i32 %30 to float
  %32 = add nsw i32 %29, 1
  %33 = bitcast i32 %32 to float
  %34 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 608)
  %35 = select i1 %25, float 0x3EF0000000000000, float 1.000000e+00
  %36 = fneg float %33
  %37 = tail call float @llvm.fma.f32(float %36, float %28, float %27)
  %38 = fcmp ogt float %37, 0.000000e+00
  %39 = fneg float %31
  %40 = tail call float @llvm.fma.f32(float %39, float %28, float %27)
  %41 = fcmp ole float %40, 0.000000e+00
  %42 = select i1 %41, float %31, float %28
  %43 = select i1 %38, float %33, float %42
  %44 = fmul float %35, %43
  %45 = select i1 %34, float %27, float %44
  %46 = sitofp i32 %1 to float
  %47 = fdiv contract float %45, %46
  %48 = fdiv contract float %47, %6
  %49 = fmul contract float %4, 1.000000e+07
  %50 = fdiv contract float %8, 1.000000e+02
  %51 = fmul contract float %50, %50
  %52 = fsub contract float 1.000000e+00, %51
  %53 = fcmp olt float %52, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = fdiv contract float %50, %73
  %75 = tail call float @llvm.fabs.f32(float %74)
  %76 = fcmp ogt float %75, 1.000000e+00
  %77 = tail call float @llvm.amdgcn.rcp.f32(float %75)
  %78 = select i1 %76, float %77, float %75
  %79 = fmul float %78, %78
  %80 = tail call float @llvm.fmuladd.f32(float %79, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %81 = tail call float @llvm.fmuladd.f32(float %79, float %80, float 0x3FA53F67E0000000)
  %82 = tail call float @llvm.fmuladd.f32(float %79, float %81, float 0xBFB2FA9AE0000000)
  %83 = tail call float @llvm.fmuladd.f32(float %79, float %82, float 0x3FBB263640000000)
  %84 = tail call float @llvm.fmuladd.f32(float %79, float %83, float 0xBFC22C1CC0000000)
  %85 = tail call float @llvm.fmuladd.f32(float %79, float %84, float 0x3FC99717E0000000)
  %86 = tail call float @llvm.fmuladd.f32(float %79, float %85, float 0xBFD5554C40000000)
  %87 = fmul float %79, %86
  %88 = tail call float @llvm.fmuladd.f32(float %78, float %87, float %78)
  %89 = fsub float 0x3FF921FB60000000, %88
  %90 = select i1 %76, float %89, float %88
  %91 = tail call float @llvm.copysign.f32(float %90, float %74)
  %92 = fadd contract float %5, 1.022000e+03
  %93 = fmul contract float %92, %5
  %94 = fcmp olt float %93, 0x39F0000000000000
  %95 = select i1 %94, float 0x41F0000000000000, float 1.000000e+00
  %96 = fmul float %93, %95
  %97 = tail call float @llvm.sqrt.f32(float %96)
  %98 = bitcast float %97 to i32
  %99 = add nsw i32 %98, -1
  %100 = bitcast i32 %99 to float
  %101 = add nsw i32 %98, 1
  %102 = bitcast i32 %101 to float
  %103 = tail call i1 @llvm.amdgcn.class.f32(float %96, i32 608)
  %104 = select i1 %94, float 0x3EF0000000000000, float 1.000000e+00
  %105 = fneg float %102
  %106 = tail call float @llvm.fma.f32(float %105, float %97, float %96)
  %107 = fcmp ogt float %106, 0.000000e+00
  %108 = fneg float %100
  %109 = tail call float @llvm.fma.f32(float %108, float %97, float %96)
  %110 = fcmp ole float %109, 0.000000e+00
  %111 = select i1 %110, float %100, float %97
  %112 = select i1 %107, float %102, float %111
  %113 = fmul float %104, %112
  %114 = select i1 %103, float %96, float %113
  %115 = fdiv contract float 0x4028CBC6A0000000, %114
  %116 = fmul contract float %48, %48
  %117 = fmul contract float %3, 1.000000e+04
  %118 = fmul contract float %117, %115
  %119 = fmul contract float %118, %116
  %120 = fmul contract float %49, %115
  %121 = fmul contract float %115, %120
  %122 = fmul contract float %115, %121
  %123 = fmul contract float %122, %116
  %124 = fmul contract float %116, %123
  %125 = fmul contract float %124, 5.000000e-01
  %126 = fsub contract float %119, %125
  %127 = fpext float %126 to double
  %128 = fmul contract double %127, 3.141590e+00
  %129 = fpext float %91 to double
  %130 = fadd contract double %128, %129
  %131 = tail call double @llvm.fabs.f64(double %130)
  %132 = fcmp olt double %131, 0x41D0000000000000
  br i1 %132, label %133, label %152

133:                                              ; preds = %9
  %134 = fmul double %131, 0x3FE45F306DC9C883
  %135 = tail call double @llvm.rint.f64(double %134)
  %136 = tail call double @llvm.fma.f64(double %135, double 0xBFF921FB54442D18, double %131)
  %137 = tail call double @llvm.fma.f64(double %135, double 0xBC91A62633145C00, double %136)
  %138 = fmul double %135, 0x3C91A62633145C00
  %139 = fneg double %138
  %140 = tail call double @llvm.fma.f64(double %135, double 0x3C91A62633145C00, double %139)
  %141 = fsub double %136, %138
  %142 = fsub double %136, %141
  %143 = fsub double %142, %138
  %144 = fsub double %141, %137
  %145 = fadd double %144, %143
  %146 = fsub double %145, %140
  %147 = tail call double @llvm.fma.f64(double %135, double 0xB97B839A252049C0, double %146)
  %148 = fadd double %137, %147
  %149 = fsub double %148, %137
  %150 = fsub double %147, %149
  %151 = fptosi double %135 to i32
  br label %228

152:                                              ; preds = %9
  %153 = tail call double @llvm.amdgcn.trig.preop.f64(double %131, i32 0)
  %154 = tail call double @llvm.amdgcn.trig.preop.f64(double %131, i32 1)
  %155 = tail call double @llvm.amdgcn.trig.preop.f64(double %131, i32 2)
  %156 = fcmp oge double %131, 0x7B00000000000000
  %157 = tail call double @llvm.amdgcn.ldexp.f64(double %131, i32 -128)
  %158 = select i1 %156, double %157, double %131
  %159 = fmul double %155, %158
  %160 = fneg double %159
  %161 = tail call double @llvm.fma.f64(double %155, double %158, double %160)
  %162 = fmul double %154, %158
  %163 = fneg double %162
  %164 = tail call double @llvm.fma.f64(double %154, double %158, double %163)
  %165 = fmul double %153, %158
  %166 = fneg double %165
  %167 = tail call double @llvm.fma.f64(double %153, double %158, double %166)
  %168 = fadd double %162, %167
  %169 = fsub double %168, %162
  %170 = fsub double %168, %169
  %171 = fsub double %167, %169
  %172 = fsub double %162, %170
  %173 = fadd double %171, %172
  %174 = fadd double %159, %164
  %175 = fsub double %174, %159
  %176 = fsub double %174, %175
  %177 = fsub double %164, %175
  %178 = fsub double %159, %176
  %179 = fadd double %177, %178
  %180 = fadd double %174, %173
  %181 = fsub double %180, %174
  %182 = fsub double %180, %181
  %183 = fsub double %173, %181
  %184 = fsub double %174, %182
  %185 = fadd double %183, %184
  %186 = fadd double %179, %185
  %187 = fadd double %161, %186
  %188 = fadd double %165, %168
  %189 = fsub double %188, %165
  %190 = fsub double %168, %189
  %191 = fadd double %190, %180
  %192 = fsub double %191, %190
  %193 = fsub double %180, %192
  %194 = fadd double %193, %187
  %195 = tail call double @llvm.amdgcn.ldexp.f64(double %188, i32 -2)
  %196 = tail call double @llvm.amdgcn.fract.f64(double %195)
  %197 = tail call i1 @llvm.amdgcn.class.f64(double %195, i32 516)
  %198 = select i1 %197, double 0.000000e+00, double %196
  %199 = tail call double @llvm.amdgcn.ldexp.f64(double %198, i32 2)
  %200 = fadd double %199, %191
  %201 = fcmp olt double %200, 0.000000e+00
  %202 = select i1 %201, double 4.000000e+00, double 0.000000e+00
  %203 = fadd double %199, %202
  %204 = fadd double %191, %203
  %205 = fptosi double %204 to i32
  %206 = sitofp i32 %205 to double
  %207 = fsub double %203, %206
  %208 = fadd double %191, %207
  %209 = fsub double %208, %207
  %210 = fsub double %191, %209
  %211 = fadd double %194, %210
  %212 = fcmp oge double %208, 5.000000e-01
  %213 = zext i1 %212 to i32
  %214 = add nsw i32 %213, %205
  %215 = select i1 %212, double 1.000000e+00, double 0.000000e+00
  %216 = fsub double %208, %215
  %217 = fadd double %216, %211
  %218 = fsub double %217, %216
  %219 = fsub double %211, %218
  %220 = fmul double %217, 0x3FF921FB54442D18
  %221 = fneg double %220
  %222 = tail call double @llvm.fma.f64(double %217, double 0x3FF921FB54442D18, double %221)
  %223 = tail call double @llvm.fma.f64(double %217, double 0x3C91A62633145C07, double %222)
  %224 = tail call double @llvm.fma.f64(double %219, double 0x3FF921FB54442D18, double %223)
  %225 = fadd double %220, %224
  %226 = fsub double %225, %220
  %227 = fsub double %224, %226
  br label %228

228:                                              ; preds = %133, %152
  %229 = phi double [ %150, %133 ], [ %227, %152 ]
  %230 = phi double [ %148, %133 ], [ %225, %152 ]
  %231 = phi i32 [ %151, %133 ], [ %214, %152 ]
  %232 = fmul double %230, %230
  %233 = fmul double %232, 5.000000e-01
  %234 = fsub double 1.000000e+00, %233
  %235 = fsub double 1.000000e+00, %234
  %236 = fsub double %235, %233
  %237 = fmul double %232, %232
  %238 = tail call double @llvm.fma.f64(double %232, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %239 = tail call double @llvm.fma.f64(double %232, double %238, double 0xBE927E4FA17F65F6)
  %240 = tail call double @llvm.fma.f64(double %232, double %239, double 0x3EFA01A019F4EC90)
  %241 = tail call double @llvm.fma.f64(double %232, double %240, double 0xBF56C16C16C16967)
  %242 = tail call double @llvm.fma.f64(double %232, double %241, double 0x3FA5555555555555)
  %243 = fneg double %229
  %244 = tail call double @llvm.fma.f64(double %230, double %243, double %236)
  %245 = tail call double @llvm.fma.f64(double %237, double %242, double %244)
  %246 = fadd double %234, %245
  %247 = tail call double @llvm.fma.f64(double %232, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %248 = tail call double @llvm.fma.f64(double %232, double %247, double 0x3EC71DE3796CDE01)
  %249 = tail call double @llvm.fma.f64(double %232, double %248, double 0xBF2A01A019E83E5C)
  %250 = tail call double @llvm.fma.f64(double %232, double %249, double 0x3F81111111110BB3)
  %251 = fneg double %232
  %252 = fmul double %230, %251
  %253 = fmul double %229, 5.000000e-01
  %254 = tail call double @llvm.fma.f64(double %252, double %250, double %253)
  %255 = tail call double @llvm.fma.f64(double %232, double %254, double %243)
  %256 = tail call double @llvm.fma.f64(double %252, double 0xBFC5555555555555, double %255)
  %257 = fsub double %230, %256
  %258 = and i32 %231, 1
  %259 = icmp eq i32 %258, 0
  %260 = select i1 %259, double %257, double %246
  %261 = bitcast double %260 to <2 x i32>
  %262 = shl i32 %231, 30
  %263 = bitcast double %130 to <2 x i32>
  %264 = extractelement <2 x i32> %263, i64 1
  %265 = xor i32 %262, %264
  %266 = and i32 %265, -2147483648
  %267 = extractelement <2 x i32> %261, i64 1
  %268 = xor i32 %267, %266
  %269 = insertelement <2 x i32> %261, i32 %268, i64 1
  %270 = tail call i1 @llvm.amdgcn.class.f64(double %131, i32 504)
  %271 = select i1 %270, <2 x i32> %269, <2 x i32> <i32 0, i32 2146959360>
  %272 = bitcast <2 x i32> %271 to double
  %273 = fptrunc double %272 to float
  %274 = fcmp contract une float %7, 0.000000e+00
  br i1 %274, label %275, label %294

275:                                              ; preds = %228
  %276 = fneg contract float %7
  %277 = fmul contract float %116, %276
  %278 = fmul contract float %277, 2.500000e-01
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = tail call float @llvm.rint.f32(float %279)
  %281 = fcmp ogt float %278, 0x40562E4300000000
  %282 = fcmp olt float %278, 0xC059D1DA00000000
  %283 = fneg float %279
  %284 = tail call float @llvm.fma.f32(float %278, float 0x3FF7154760000000, float %283)
  %285 = tail call float @llvm.fma.f32(float %278, float 0x3E54AE0BE0000000, float %284)
  %286 = fsub float %279, %280
  %287 = fadd float %285, %286
  %288 = tail call float @llvm.exp2.f32(float %287)
  %289 = fptosi float %280 to i32
  %290 = tail call float @llvm.amdgcn.ldexp.f32(float %288, i32 %289)
  %291 = select i1 %282, float 0.000000e+00, float %290
  %292 = select i1 %281, float 0x7FF0000000000000, float %291
  %293 = fmul contract float %292, %273
  br label %294

294:                                              ; preds = %275, %228
  %295 = phi float [ %293, %275 ], [ %273, %228 ]
  %296 = sext i32 %21 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %0, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !5, !amdgpu.noclobber !9
  %299 = fmul contract float %295, %298
  store float %299, float addrspace(1)* %297, align 4, !tbaa !5
  %300 = add nsw i32 %21, 1
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !5, !amdgpu.noclobber !9
  %304 = fmul contract float %295, %303
  store float %304, float addrspace(1)* %302, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
