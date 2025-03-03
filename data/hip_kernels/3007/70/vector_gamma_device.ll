; ModuleID = '../data/hip_kernels/3007/70/main.cu'
source_filename = "../data/hip_kernels/3007/70/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_gammaiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %305

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp ogt float %24, 1.562500e-02
  br i1 %25, label %26, label %292

26:                                               ; preds = %18
  %27 = fcmp olt float %23, 1.000000e+00
  br i1 %27, label %28, label %32

28:                                               ; preds = %26
  %29 = fadd float %24, 3.000000e+00
  %30 = tail call float @llvm.fmuladd.f32(float %29, float %24, float 2.000000e+00)
  %31 = fmul float %24, %30
  br label %42

32:                                               ; preds = %26
  %33 = fcmp olt float %24, 2.000000e+00
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = tail call float @llvm.fmuladd.f32(float %23, float %23, float %24)
  %36 = fadd float %24, 2.000000e+00
  br label %42

37:                                               ; preds = %32
  %38 = fcmp olt float %24, 3.000000e+00
  %39 = fadd float %24, 1.000000e+00
  %40 = select i1 %38, float %24, float 1.000000e+00
  %41 = select i1 %38, float %39, float %24
  br label %42

42:                                               ; preds = %37, %34, %28
  %43 = phi float [ %31, %28 ], [ %35, %34 ], [ %40, %37 ]
  %44 = phi float [ %29, %28 ], [ %36, %34 ], [ %41, %37 ]
  %45 = tail call float @llvm.fmuladd.f32(float %44, float 5.000000e-01, float -2.500000e-01)
  %46 = tail call float @llvm.fabs.f32(float %44)
  %47 = tail call float @llvm.amdgcn.frexp.mant.f32(float %46)
  %48 = fcmp olt float %47, 0x3FE5555560000000
  %49 = zext i1 %48 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %49)
  %51 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %46)
  %52 = sub nsw i32 %51, %49
  %53 = fadd float %50, -1.000000e+00
  %54 = fadd float %50, 1.000000e+00
  %55 = fadd float %54, -1.000000e+00
  %56 = fsub float %50, %55
  %57 = tail call float @llvm.amdgcn.rcp.f32(float %54)
  %58 = fmul float %53, %57
  %59 = fmul float %54, %58
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %58, float %54, float %60)
  %62 = tail call float @llvm.fma.f32(float %58, float %56, float %61)
  %63 = fadd float %59, %62
  %64 = fsub float %63, %59
  %65 = fsub float %62, %64
  %66 = fsub float %53, %63
  %67 = fsub float %53, %66
  %68 = fsub float %67, %63
  %69 = fsub float %68, %65
  %70 = fadd float %66, %69
  %71 = fmul float %57, %70
  %72 = fadd float %58, %71
  %73 = fsub float %72, %58
  %74 = fsub float %71, %73
  %75 = fmul float %72, %72
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %72, float %72, float %76)
  %78 = fmul float %74, 2.000000e+00
  %79 = tail call float @llvm.fma.f32(float %72, float %78, float %77)
  %80 = fadd float %75, %79
  %81 = fsub float %80, %75
  %82 = fsub float %79, %81
  %83 = tail call float @llvm.fmuladd.f32(float %80, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %84 = tail call float @llvm.fmuladd.f32(float %80, float %83, float 0x3FD999BDE0000000)
  %85 = sitofp i32 %52 to float
  %86 = fmul float %85, 0x3FE62E4300000000
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %85, float 0x3FE62E4300000000, float %87)
  %89 = tail call float @llvm.fma.f32(float %85, float 0xBE205C6100000000, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %94 = fmul float %72, %80
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %80, float %72, float %95)
  %97 = tail call float @llvm.fma.f32(float %80, float %74, float %96)
  %98 = tail call float @llvm.fma.f32(float %82, float %72, float %97)
  %99 = fadd float %94, %98
  %100 = fsub float %99, %94
  %101 = fsub float %98, %100
  %102 = fmul float %80, %84
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %80, float %84, float %103)
  %105 = tail call float @llvm.fma.f32(float %82, float %84, float %104)
  %106 = fadd float %102, %105
  %107 = fsub float %106, %102
  %108 = fsub float %105, %107
  %109 = fadd float %106, 0x3FE5555540000000
  %110 = fadd float %109, 0xBFE5555540000000
  %111 = fsub float %106, %110
  %112 = fadd float %108, 0x3E2E720200000000
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fmul float %99, %114
  %118 = fneg float %117
  %119 = tail call float @llvm.fma.f32(float %99, float %114, float %118)
  %120 = tail call float @llvm.fma.f32(float %99, float %116, float %119)
  %121 = tail call float @llvm.fma.f32(float %101, float %114, float %120)
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 1)
  %123 = fadd float %117, %121
  %124 = fsub float %123, %117
  %125 = fsub float %121, %124
  %126 = fadd float %93, %123
  %127 = fsub float %126, %93
  %128 = fsub float %123, %127
  %129 = fadd float %122, %125
  %130 = fadd float %129, %128
  %131 = fadd float %126, %130
  %132 = fsub float %131, %126
  %133 = fsub float %130, %132
  %134 = fadd float %90, %131
  %135 = fsub float %134, %90
  %136 = fsub float %134, %135
  %137 = fsub float %90, %136
  %138 = fsub float %131, %135
  %139 = fadd float %138, %137
  %140 = fadd float %92, %133
  %141 = fsub float %140, %92
  %142 = fsub float %140, %141
  %143 = fsub float %92, %142
  %144 = fsub float %133, %141
  %145 = fadd float %144, %143
  %146 = fadd float %140, %139
  %147 = fadd float %134, %146
  %148 = fsub float %147, %134
  %149 = fsub float %146, %148
  %150 = fadd float %145, %149
  %151 = fadd float %147, %150
  %152 = fsub float %151, %147
  %153 = fsub float %150, %152
  %154 = fmul float %45, %151
  %155 = fneg float %154
  %156 = tail call float @llvm.fma.f32(float %45, float %151, float %155)
  %157 = tail call float @llvm.fma.f32(float %45, float %153, float %156)
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %154) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %154, float %158
  %164 = tail call float @llvm.fabs.f32(float %163) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float 0.000000e+00, float %160
  %167 = fcmp oeq float %163, 0x40562E4300000000
  %168 = select i1 %167, float 0x3EE0000000000000, float 0.000000e+00
  %169 = fsub float %163, %168
  %170 = fadd float %168, %166
  %171 = fmul float %169, 0x3FF7154760000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = fcmp ogt float %169, 0x40562E4300000000
  %174 = fcmp olt float %169, 0xC059D1DA00000000
  %175 = fneg float %171
  %176 = tail call float @llvm.fma.f32(float %169, float 0x3FF7154760000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %169, float 0x3E54AE0BE0000000, float %176)
  %178 = fsub float %171, %172
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.exp2.f32(float %179)
  %181 = fptosi float %172 to i32
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %180, i32 %181)
  %183 = select i1 %174, float 0.000000e+00, float %182
  %184 = select i1 %173, float 0x7FF0000000000000, float %183
  %185 = tail call float @llvm.fma.f32(float %184, float %170, float %184)
  %186 = tail call float @llvm.fabs.f32(float %184) #3
  %187 = fcmp oeq float %186, 0x7FF0000000000000
  %188 = select i1 %187, float %184, float %185
  %189 = tail call float @llvm.fabs.f32(float %45)
  %190 = tail call float @llvm.fabs.f32(float %188)
  %191 = fcmp olt float %45, 0.000000e+00
  %192 = select i1 %191, float 0x7FF0000000000000, float 0.000000e+00
  %193 = select i1 %191, float 0.000000e+00, float 0x7FF0000000000000
  %194 = fcmp oeq float %44, 0.000000e+00
  %195 = select i1 %194, float %192, float %190
  %196 = fcmp oeq float %46, 0x7FF0000000000000
  %197 = select i1 %196, float %193, float %195
  %198 = fcmp oeq float %189, 0x7FF0000000000000
  %199 = fcmp olt float %46, 1.000000e+00
  %200 = select i1 %199, float %192, float %193
  %201 = select i1 %198, float %200, float %197
  %202 = fcmp oeq float %45, 0.000000e+00
  %203 = select i1 %194, i1 true, i1 %196
  %204 = select i1 %203, float 0x7FF8000000000000, float 1.000000e+00
  %205 = select i1 %202, float %204, float %201
  %206 = fcmp oeq float %44, 1.000000e+00
  %207 = select i1 %198, float 0x7FF8000000000000, float 1.000000e+00
  %208 = select i1 %206, float %207, float %205
  %209 = fcmp ult float %44, 0.000000e+00
  %210 = fcmp uno float %45, 0.000000e+00
  %211 = or i1 %209, %210
  %212 = select i1 %211, float 0x7FF8000000000000, float %208
  %213 = fneg float %44
  %214 = fmul float %44, 0xBFF7154760000000
  %215 = tail call float @llvm.rint.f32(float %214)
  %216 = fcmp ogt float %44, 0x4059D1DA00000000
  %217 = fneg float %214
  %218 = tail call float @llvm.fma.f32(float %213, float 0x3FF7154760000000, float %217)
  %219 = tail call float @llvm.fma.f32(float %213, float 0x3E54AE0BE0000000, float %218)
  %220 = fsub float %214, %215
  %221 = fadd float %219, %220
  %222 = tail call float @llvm.exp2.f32(float %221)
  %223 = fptosi float %215 to i32
  %224 = tail call float @llvm.amdgcn.ldexp.f32(float %222, i32 %223)
  %225 = select i1 %216, float 0.000000e+00, float %224
  %226 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %227 = tail call float @llvm.fmuladd.f32(float %226, float 0xBF65F72680000000, float 0x3F6C71C720000000)
  %228 = tail call float @llvm.fmuladd.f32(float %226, float %227, float 0x3FB5555560000000)
  %229 = fmul float %226, %228
  %230 = fcmp ogt float %23, 0.000000e+00
  br i1 %230, label %231, label %240

231:                                              ; preds = %42
  %232 = fmul float %225, 0x40040D9320000000
  %233 = fmul float %232, %212
  %234 = fmul float %212, %233
  %235 = tail call float @llvm.amdgcn.rcp.f32(float %43)
  %236 = fmul float %235, %234
  %237 = tail call float @llvm.fmuladd.f32(float %236, float %229, float %236)
  %238 = fcmp ogt float %23, 0x40418521E0000000
  %239 = select i1 %238, float 0x7FF0000000000000, float %237
  br label %299

240:                                              ; preds = %42
  %241 = fmul float %24, 5.000000e-01
  %242 = tail call float @llvm.amdgcn.fract.f32(float %241)
  %243 = tail call i1 @llvm.amdgcn.class.f32(float %241, i32 516)
  %244 = fmul float %242, 2.000000e+00
  %245 = select i1 %243, float 0.000000e+00, float %244
  %246 = fcmp ogt float %24, 1.000000e+00
  %247 = select i1 %246, float %245, float %24
  %248 = fmul float %247, 2.000000e+00
  %249 = tail call float @llvm.rint.f32(float %248)
  %250 = tail call float @llvm.fmuladd.f32(float %249, float -5.000000e-01, float %247)
  %251 = fptosi float %249 to i32
  %252 = fmul float %250, %250
  %253 = tail call float @llvm.fmuladd.f32(float %252, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %254 = tail call float @llvm.fmuladd.f32(float %252, float %253, float 0x400468E6C0000000)
  %255 = tail call float @llvm.fmuladd.f32(float %252, float %254, float 0xC014ABC1C0000000)
  %256 = fmul float %250, %252
  %257 = fmul float %256, %255
  %258 = tail call float @llvm.fmuladd.f32(float %250, float 0x400921FB60000000, float %257)
  %259 = tail call float @llvm.fmuladd.f32(float %252, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %260 = tail call float @llvm.fmuladd.f32(float %252, float %259, float 0xBFF55A3B40000000)
  %261 = tail call float @llvm.fmuladd.f32(float %252, float %260, float 0x40103C1A60000000)
  %262 = tail call float @llvm.fmuladd.f32(float %252, float %261, float 0xC013BD3CC0000000)
  %263 = tail call float @llvm.fmuladd.f32(float %252, float %262, float 1.000000e+00)
  %264 = and i32 %251, 1
  %265 = icmp eq i32 %264, 0
  %266 = select i1 %265, float %258, float %263
  %267 = bitcast float %266 to i32
  %268 = shl i32 %251, 30
  %269 = and i32 %268, -2147483648
  %270 = bitcast float %23 to i32
  %271 = bitcast float %24 to i32
  %272 = xor i32 %271, %270
  %273 = xor i32 %272, %269
  %274 = xor i32 %273, %267
  %275 = bitcast i32 %274 to float
  %276 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 504)
  %277 = select i1 %276, float %275, float 0x7FF8000000000000
  %278 = fmul float %23, %277
  %279 = fmul float %278, %225
  %280 = fmul float %279, %212
  %281 = fmul float %212, %280
  %282 = fmul float %43, 0xBFF40D9320000000
  %283 = tail call float @llvm.fmuladd.f32(float %281, float %229, float %281)
  %284 = fdiv float %282, %283, !fpmath !11
  %285 = fcmp olt float %23, -4.200000e+01
  %286 = select i1 %285, float 0.000000e+00, float %284
  %287 = tail call float @llvm.amdgcn.fract.f32(float %23)
  %288 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 516)
  %289 = select i1 %288, float 0.000000e+00, float %287
  %290 = fcmp oeq float %289, 0.000000e+00
  %291 = select i1 %290, float 0x7FF8000000000000, float %286
  br label %299

292:                                              ; preds = %18
  %293 = tail call float @llvm.fmuladd.f32(float %23, float 0x3FEF6A5100000000, float 0xBFED0A1180000000)
  %294 = tail call float @llvm.fmuladd.f32(float %23, float %293, float 0x3FEFA658C0000000)
  %295 = tail call float @llvm.fmuladd.f32(float %23, float %294, float 0xBFE2788D00000000)
  %296 = fmul float %23, 4.000000e+00
  %297 = tail call float @llvm.amdgcn.rcp.f32(float %296)
  %298 = tail call float @llvm.fmuladd.f32(float %297, float 4.000000e+00, float %295)
  br label %299

299:                                              ; preds = %231, %240, %292
  %300 = phi float [ %298, %292 ], [ %239, %231 ], [ %291, %240 ]
  %301 = mul nsw i32 %16, %6
  %302 = add nsw i32 %301, %5
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float addrspace(1)* %4, i64 %303
  store float %300, float addrspace(1)* %304, align 4, !tbaa !7
  br label %305

305:                                              ; preds = %299, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{float 2.500000e+00}
