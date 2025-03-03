; ModuleID = '../data/hip_kernels/7801/68/main.cu'
source_filename = "../data/hip_kernels/7801/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_tgammaf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %296

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp ogt float %18, 1.562500e-02
  br i1 %19, label %20, label %286

20:                                               ; preds = %15
  %21 = fcmp olt float %17, 1.000000e+00
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = fadd float %18, 3.000000e+00
  %24 = tail call float @llvm.fmuladd.f32(float %23, float %18, float 2.000000e+00)
  %25 = fmul float %18, %24
  br label %36

26:                                               ; preds = %20
  %27 = fcmp olt float %18, 2.000000e+00
  br i1 %27, label %28, label %31

28:                                               ; preds = %26
  %29 = tail call float @llvm.fmuladd.f32(float %17, float %17, float %18)
  %30 = fadd float %18, 2.000000e+00
  br label %36

31:                                               ; preds = %26
  %32 = fcmp olt float %18, 3.000000e+00
  %33 = fadd float %18, 1.000000e+00
  %34 = select i1 %32, float %18, float 1.000000e+00
  %35 = select i1 %32, float %33, float %18
  br label %36

36:                                               ; preds = %31, %28, %22
  %37 = phi float [ %25, %22 ], [ %29, %28 ], [ %34, %31 ]
  %38 = phi float [ %23, %22 ], [ %30, %28 ], [ %35, %31 ]
  %39 = tail call float @llvm.fmuladd.f32(float %38, float 5.000000e-01, float -2.500000e-01)
  %40 = tail call float @llvm.fabs.f32(float %38)
  %41 = tail call float @llvm.amdgcn.frexp.mant.f32(float %40)
  %42 = fcmp olt float %41, 0x3FE5555560000000
  %43 = zext i1 %42 to i32
  %44 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %43)
  %45 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %40)
  %46 = sub nsw i32 %45, %43
  %47 = fadd float %44, -1.000000e+00
  %48 = fadd float %44, 1.000000e+00
  %49 = fadd float %48, -1.000000e+00
  %50 = fsub float %44, %49
  %51 = tail call float @llvm.amdgcn.rcp.f32(float %48)
  %52 = fmul float %47, %51
  %53 = fmul float %48, %52
  %54 = fneg float %53
  %55 = tail call float @llvm.fma.f32(float %52, float %48, float %54)
  %56 = tail call float @llvm.fma.f32(float %52, float %50, float %55)
  %57 = fadd float %53, %56
  %58 = fsub float %57, %53
  %59 = fsub float %56, %58
  %60 = fsub float %47, %57
  %61 = fsub float %47, %60
  %62 = fsub float %61, %57
  %63 = fsub float %62, %59
  %64 = fadd float %60, %63
  %65 = fmul float %51, %64
  %66 = fadd float %52, %65
  %67 = fsub float %66, %52
  %68 = fsub float %65, %67
  %69 = fmul float %66, %66
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %66, float %66, float %70)
  %72 = fmul float %68, 2.000000e+00
  %73 = tail call float @llvm.fma.f32(float %66, float %72, float %71)
  %74 = fadd float %69, %73
  %75 = fsub float %74, %69
  %76 = fsub float %73, %75
  %77 = tail call float @llvm.fmuladd.f32(float %74, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %77, float 0x3FD999BDE0000000)
  %79 = sitofp i32 %46 to float
  %80 = fmul float %79, 0x3FE62E4300000000
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %79, float 0x3FE62E4300000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %79, float 0xBE205C6100000000, float %82)
  %84 = fadd float %80, %83
  %85 = fsub float %84, %80
  %86 = fsub float %83, %85
  %87 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 1)
  %88 = fmul float %66, %74
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %74, float %66, float %89)
  %91 = tail call float @llvm.fma.f32(float %74, float %68, float %90)
  %92 = tail call float @llvm.fma.f32(float %76, float %66, float %91)
  %93 = fadd float %88, %92
  %94 = fsub float %93, %88
  %95 = fsub float %92, %94
  %96 = fmul float %74, %78
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %74, float %78, float %97)
  %99 = tail call float @llvm.fma.f32(float %76, float %78, float %98)
  %100 = fadd float %96, %99
  %101 = fsub float %100, %96
  %102 = fsub float %99, %101
  %103 = fadd float %100, 0x3FE5555540000000
  %104 = fadd float %103, 0xBFE5555540000000
  %105 = fsub float %100, %104
  %106 = fadd float %102, 0x3E2E720200000000
  %107 = fadd float %106, %105
  %108 = fadd float %103, %107
  %109 = fsub float %108, %103
  %110 = fsub float %107, %109
  %111 = fmul float %93, %108
  %112 = fneg float %111
  %113 = tail call float @llvm.fma.f32(float %93, float %108, float %112)
  %114 = tail call float @llvm.fma.f32(float %93, float %110, float %113)
  %115 = tail call float @llvm.fma.f32(float %95, float %108, float %114)
  %116 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 1)
  %117 = fadd float %111, %115
  %118 = fsub float %117, %111
  %119 = fsub float %115, %118
  %120 = fadd float %87, %117
  %121 = fsub float %120, %87
  %122 = fsub float %117, %121
  %123 = fadd float %116, %119
  %124 = fadd float %123, %122
  %125 = fadd float %120, %124
  %126 = fsub float %125, %120
  %127 = fsub float %124, %126
  %128 = fadd float %84, %125
  %129 = fsub float %128, %84
  %130 = fsub float %128, %129
  %131 = fsub float %84, %130
  %132 = fsub float %125, %129
  %133 = fadd float %132, %131
  %134 = fadd float %86, %127
  %135 = fsub float %134, %86
  %136 = fsub float %134, %135
  %137 = fsub float %86, %136
  %138 = fsub float %127, %135
  %139 = fadd float %138, %137
  %140 = fadd float %134, %133
  %141 = fadd float %128, %140
  %142 = fsub float %141, %128
  %143 = fsub float %140, %142
  %144 = fadd float %139, %143
  %145 = fadd float %141, %144
  %146 = fsub float %145, %141
  %147 = fsub float %144, %146
  %148 = fmul float %39, %145
  %149 = fneg float %148
  %150 = tail call float @llvm.fma.f32(float %39, float %145, float %149)
  %151 = tail call float @llvm.fma.f32(float %39, float %147, float %150)
  %152 = fadd float %148, %151
  %153 = fsub float %152, %148
  %154 = fsub float %151, %153
  %155 = tail call float @llvm.fabs.f32(float %148) #3
  %156 = fcmp oeq float %155, 0x7FF0000000000000
  %157 = select i1 %156, float %148, float %152
  %158 = tail call float @llvm.fabs.f32(float %157) #3
  %159 = fcmp oeq float %158, 0x7FF0000000000000
  %160 = select i1 %159, float 0.000000e+00, float %154
  %161 = fcmp oeq float %157, 0x40562E4300000000
  %162 = select i1 %161, float 0x3EE0000000000000, float 0.000000e+00
  %163 = fsub float %157, %162
  %164 = fadd float %162, %160
  %165 = fmul float %163, 0x3FF7154760000000
  %166 = tail call float @llvm.rint.f32(float %165)
  %167 = fcmp ogt float %163, 0x40562E4300000000
  %168 = fcmp olt float %163, 0xC059D1DA00000000
  %169 = fneg float %165
  %170 = tail call float @llvm.fma.f32(float %163, float 0x3FF7154760000000, float %169)
  %171 = tail call float @llvm.fma.f32(float %163, float 0x3E54AE0BE0000000, float %170)
  %172 = fsub float %165, %166
  %173 = fadd float %171, %172
  %174 = tail call float @llvm.exp2.f32(float %173)
  %175 = fptosi float %166 to i32
  %176 = tail call float @llvm.amdgcn.ldexp.f32(float %174, i32 %175)
  %177 = select i1 %168, float 0.000000e+00, float %176
  %178 = select i1 %167, float 0x7FF0000000000000, float %177
  %179 = tail call float @llvm.fma.f32(float %178, float %164, float %178)
  %180 = tail call float @llvm.fabs.f32(float %178) #3
  %181 = fcmp oeq float %180, 0x7FF0000000000000
  %182 = select i1 %181, float %178, float %179
  %183 = tail call float @llvm.fabs.f32(float %39)
  %184 = tail call float @llvm.fabs.f32(float %182)
  %185 = fcmp olt float %39, 0.000000e+00
  %186 = select i1 %185, float 0x7FF0000000000000, float 0.000000e+00
  %187 = select i1 %185, float 0.000000e+00, float 0x7FF0000000000000
  %188 = fcmp oeq float %38, 0.000000e+00
  %189 = select i1 %188, float %186, float %184
  %190 = fcmp oeq float %40, 0x7FF0000000000000
  %191 = select i1 %190, float %187, float %189
  %192 = fcmp oeq float %183, 0x7FF0000000000000
  %193 = fcmp olt float %40, 1.000000e+00
  %194 = select i1 %193, float %186, float %187
  %195 = select i1 %192, float %194, float %191
  %196 = fcmp oeq float %39, 0.000000e+00
  %197 = select i1 %188, i1 true, i1 %190
  %198 = select i1 %197, float 0x7FF8000000000000, float 1.000000e+00
  %199 = select i1 %196, float %198, float %195
  %200 = fcmp oeq float %38, 1.000000e+00
  %201 = select i1 %192, float 0x7FF8000000000000, float 1.000000e+00
  %202 = select i1 %200, float %201, float %199
  %203 = fcmp ult float %38, 0.000000e+00
  %204 = fcmp uno float %39, 0.000000e+00
  %205 = or i1 %203, %204
  %206 = select i1 %205, float 0x7FF8000000000000, float %202
  %207 = fneg float %38
  %208 = fmul float %38, 0xBFF7154760000000
  %209 = tail call float @llvm.rint.f32(float %208)
  %210 = fcmp ogt float %38, 0x4059D1DA00000000
  %211 = fneg float %208
  %212 = tail call float @llvm.fma.f32(float %207, float 0x3FF7154760000000, float %211)
  %213 = tail call float @llvm.fma.f32(float %207, float 0x3E54AE0BE0000000, float %212)
  %214 = fsub float %208, %209
  %215 = fadd float %213, %214
  %216 = tail call float @llvm.exp2.f32(float %215)
  %217 = fptosi float %209 to i32
  %218 = tail call float @llvm.amdgcn.ldexp.f32(float %216, i32 %217)
  %219 = select i1 %210, float 0.000000e+00, float %218
  %220 = tail call float @llvm.amdgcn.rcp.f32(float %38)
  %221 = tail call float @llvm.fmuladd.f32(float %220, float 0xBF65F72680000000, float 0x3F6C71C720000000)
  %222 = tail call float @llvm.fmuladd.f32(float %220, float %221, float 0x3FB5555560000000)
  %223 = fmul float %220, %222
  %224 = fcmp ogt float %17, 0.000000e+00
  br i1 %224, label %225, label %234

225:                                              ; preds = %36
  %226 = fmul float %219, 0x40040D9320000000
  %227 = fmul float %226, %206
  %228 = fmul float %206, %227
  %229 = tail call float @llvm.amdgcn.rcp.f32(float %37)
  %230 = fmul float %229, %228
  %231 = tail call float @llvm.fmuladd.f32(float %230, float %223, float %230)
  %232 = fcmp ogt float %17, 0x40418521E0000000
  %233 = select i1 %232, float 0x7FF0000000000000, float %231
  br label %293

234:                                              ; preds = %36
  %235 = fmul float %18, 5.000000e-01
  %236 = tail call float @llvm.amdgcn.fract.f32(float %235)
  %237 = tail call i1 @llvm.amdgcn.class.f32(float %235, i32 516)
  %238 = fmul float %236, 2.000000e+00
  %239 = select i1 %237, float 0.000000e+00, float %238
  %240 = fcmp ogt float %18, 1.000000e+00
  %241 = select i1 %240, float %239, float %18
  %242 = fmul float %241, 2.000000e+00
  %243 = tail call float @llvm.rint.f32(float %242)
  %244 = tail call float @llvm.fmuladd.f32(float %243, float -5.000000e-01, float %241)
  %245 = fptosi float %243 to i32
  %246 = fmul float %244, %244
  %247 = tail call float @llvm.fmuladd.f32(float %246, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %248 = tail call float @llvm.fmuladd.f32(float %246, float %247, float 0x400468E6C0000000)
  %249 = tail call float @llvm.fmuladd.f32(float %246, float %248, float 0xC014ABC1C0000000)
  %250 = fmul float %244, %246
  %251 = fmul float %250, %249
  %252 = tail call float @llvm.fmuladd.f32(float %244, float 0x400921FB60000000, float %251)
  %253 = tail call float @llvm.fmuladd.f32(float %246, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %254 = tail call float @llvm.fmuladd.f32(float %246, float %253, float 0xBFF55A3B40000000)
  %255 = tail call float @llvm.fmuladd.f32(float %246, float %254, float 0x40103C1A60000000)
  %256 = tail call float @llvm.fmuladd.f32(float %246, float %255, float 0xC013BD3CC0000000)
  %257 = tail call float @llvm.fmuladd.f32(float %246, float %256, float 1.000000e+00)
  %258 = and i32 %245, 1
  %259 = icmp eq i32 %258, 0
  %260 = select i1 %259, float %252, float %257
  %261 = bitcast float %260 to i32
  %262 = shl i32 %245, 30
  %263 = and i32 %262, -2147483648
  %264 = bitcast float %17 to i32
  %265 = bitcast float %18 to i32
  %266 = xor i32 %265, %264
  %267 = xor i32 %266, %263
  %268 = xor i32 %267, %261
  %269 = bitcast i32 %268 to float
  %270 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 504)
  %271 = select i1 %270, float %269, float 0x7FF8000000000000
  %272 = fmul float %17, %271
  %273 = fmul float %272, %219
  %274 = fmul float %273, %206
  %275 = fmul float %206, %274
  %276 = fmul float %37, 0xBFF40D9320000000
  %277 = tail call float @llvm.fmuladd.f32(float %275, float %223, float %275)
  %278 = fdiv float %276, %277, !fpmath !11
  %279 = fcmp olt float %17, -4.200000e+01
  %280 = select i1 %279, float 0.000000e+00, float %278
  %281 = tail call float @llvm.amdgcn.fract.f32(float %17)
  %282 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 516)
  %283 = select i1 %282, float 0.000000e+00, float %281
  %284 = fcmp oeq float %283, 0.000000e+00
  %285 = select i1 %284, float 0x7FF8000000000000, float %280
  br label %293

286:                                              ; preds = %15
  %287 = tail call float @llvm.fmuladd.f32(float %17, float 0x3FEF6A5100000000, float 0xBFED0A1180000000)
  %288 = tail call float @llvm.fmuladd.f32(float %17, float %287, float 0x3FEFA658C0000000)
  %289 = tail call float @llvm.fmuladd.f32(float %17, float %288, float 0xBFE2788D00000000)
  %290 = fmul float %17, 4.000000e+00
  %291 = tail call float @llvm.amdgcn.rcp.f32(float %290)
  %292 = tail call float @llvm.fmuladd.f32(float %291, float 4.000000e+00, float %289)
  br label %293

293:                                              ; preds = %225, %234, %286
  %294 = phi float [ %292, %286 ], [ %233, %225 ], [ %285, %234 ]
  %295 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %294, float addrspace(1)* %295, align 4, !tbaa !7
  br label %296

296:                                              ; preds = %293, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{float 2.500000e+00}
