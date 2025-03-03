; ModuleID = '../data/hip_kernels/13637/34/main.cu'
source_filename = "../data/hip_kernels/13637/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kGammaPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %304, %3
  ret void

24:                                               ; preds = %3, %304
  %25 = phi i32 [ %307, %304 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = fcmp ogt float %29, 1.562500e-02
  br i1 %30, label %31, label %297

31:                                               ; preds = %24
  %32 = fcmp olt float %28, 1.000000e+00
  br i1 %32, label %33, label %37

33:                                               ; preds = %31
  %34 = fadd float %29, 3.000000e+00
  %35 = tail call float @llvm.fmuladd.f32(float %34, float %29, float 2.000000e+00)
  %36 = fmul float %29, %35
  br label %47

37:                                               ; preds = %31
  %38 = fcmp olt float %29, 2.000000e+00
  br i1 %38, label %39, label %42

39:                                               ; preds = %37
  %40 = tail call float @llvm.fmuladd.f32(float %28, float %28, float %29)
  %41 = fadd float %29, 2.000000e+00
  br label %47

42:                                               ; preds = %37
  %43 = fcmp olt float %29, 3.000000e+00
  %44 = fadd float %29, 1.000000e+00
  %45 = select i1 %43, float %29, float 1.000000e+00
  %46 = select i1 %43, float %44, float %29
  br label %47

47:                                               ; preds = %42, %39, %33
  %48 = phi float [ %36, %33 ], [ %40, %39 ], [ %45, %42 ]
  %49 = phi float [ %34, %33 ], [ %41, %39 ], [ %46, %42 ]
  %50 = tail call float @llvm.fmuladd.f32(float %49, float 5.000000e-01, float -2.500000e-01)
  %51 = tail call float @llvm.fabs.f32(float %49)
  %52 = tail call float @llvm.amdgcn.frexp.mant.f32(float %51)
  %53 = fcmp olt float %52, 0x3FE5555560000000
  %54 = zext i1 %53 to i32
  %55 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 %54)
  %56 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %51)
  %57 = sub nsw i32 %56, %54
  %58 = fadd float %55, -1.000000e+00
  %59 = fadd float %55, 1.000000e+00
  %60 = fadd float %59, -1.000000e+00
  %61 = fsub float %55, %60
  %62 = tail call float @llvm.amdgcn.rcp.f32(float %59)
  %63 = fmul float %58, %62
  %64 = fmul float %59, %63
  %65 = fneg float %64
  %66 = tail call float @llvm.fma.f32(float %63, float %59, float %65)
  %67 = tail call float @llvm.fma.f32(float %63, float %61, float %66)
  %68 = fadd float %64, %67
  %69 = fsub float %68, %64
  %70 = fsub float %67, %69
  %71 = fsub float %58, %68
  %72 = fsub float %58, %71
  %73 = fsub float %72, %68
  %74 = fsub float %73, %70
  %75 = fadd float %71, %74
  %76 = fmul float %62, %75
  %77 = fadd float %63, %76
  %78 = fsub float %77, %63
  %79 = fsub float %76, %78
  %80 = fmul float %77, %77
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %77, float %77, float %81)
  %83 = fmul float %79, 2.000000e+00
  %84 = tail call float @llvm.fma.f32(float %77, float %83, float %82)
  %85 = fadd float %80, %84
  %86 = fsub float %85, %80
  %87 = fsub float %84, %86
  %88 = tail call float @llvm.fmuladd.f32(float %85, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %89 = tail call float @llvm.fmuladd.f32(float %85, float %88, float 0x3FD999BDE0000000)
  %90 = sitofp i32 %57 to float
  %91 = fmul float %90, 0x3FE62E4300000000
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %90, float 0x3FE62E4300000000, float %92)
  %94 = tail call float @llvm.fma.f32(float %90, float 0xBE205C6100000000, float %93)
  %95 = fadd float %91, %94
  %96 = fsub float %95, %91
  %97 = fsub float %94, %96
  %98 = tail call float @llvm.amdgcn.ldexp.f32(float %77, i32 1)
  %99 = fmul float %77, %85
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %85, float %77, float %100)
  %102 = tail call float @llvm.fma.f32(float %85, float %79, float %101)
  %103 = tail call float @llvm.fma.f32(float %87, float %77, float %102)
  %104 = fadd float %99, %103
  %105 = fsub float %104, %99
  %106 = fsub float %103, %105
  %107 = fmul float %85, %89
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %85, float %89, float %108)
  %110 = tail call float @llvm.fma.f32(float %87, float %89, float %109)
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = fadd float %111, 0x3FE5555540000000
  %115 = fadd float %114, 0xBFE5555540000000
  %116 = fsub float %111, %115
  %117 = fadd float %113, 0x3E2E720200000000
  %118 = fadd float %117, %116
  %119 = fadd float %114, %118
  %120 = fsub float %119, %114
  %121 = fsub float %118, %120
  %122 = fmul float %104, %119
  %123 = fneg float %122
  %124 = tail call float @llvm.fma.f32(float %104, float %119, float %123)
  %125 = tail call float @llvm.fma.f32(float %104, float %121, float %124)
  %126 = tail call float @llvm.fma.f32(float %106, float %119, float %125)
  %127 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 1)
  %128 = fadd float %122, %126
  %129 = fsub float %128, %122
  %130 = fsub float %126, %129
  %131 = fadd float %98, %128
  %132 = fsub float %131, %98
  %133 = fsub float %128, %132
  %134 = fadd float %127, %130
  %135 = fadd float %134, %133
  %136 = fadd float %131, %135
  %137 = fsub float %136, %131
  %138 = fsub float %135, %137
  %139 = fadd float %95, %136
  %140 = fsub float %139, %95
  %141 = fsub float %139, %140
  %142 = fsub float %95, %141
  %143 = fsub float %136, %140
  %144 = fadd float %143, %142
  %145 = fadd float %97, %138
  %146 = fsub float %145, %97
  %147 = fsub float %145, %146
  %148 = fsub float %97, %147
  %149 = fsub float %138, %146
  %150 = fadd float %149, %148
  %151 = fadd float %145, %144
  %152 = fadd float %139, %151
  %153 = fsub float %152, %139
  %154 = fsub float %151, %153
  %155 = fadd float %150, %154
  %156 = fadd float %152, %155
  %157 = fsub float %156, %152
  %158 = fsub float %155, %157
  %159 = fmul float %50, %156
  %160 = fneg float %159
  %161 = tail call float @llvm.fma.f32(float %50, float %156, float %160)
  %162 = tail call float @llvm.fma.f32(float %50, float %158, float %161)
  %163 = fadd float %159, %162
  %164 = fsub float %163, %159
  %165 = fsub float %162, %164
  %166 = tail call float @llvm.fabs.f32(float %159) #3
  %167 = fcmp oeq float %166, 0x7FF0000000000000
  %168 = select i1 %167, float %159, float %163
  %169 = tail call float @llvm.fabs.f32(float %168) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float 0.000000e+00, float %165
  %172 = fcmp oeq float %168, 0x40562E4300000000
  %173 = select i1 %172, float 0x3EE0000000000000, float 0.000000e+00
  %174 = fsub float %168, %173
  %175 = fadd float %173, %171
  %176 = fmul float %174, 0x3FF7154760000000
  %177 = tail call float @llvm.rint.f32(float %176)
  %178 = fcmp ogt float %174, 0x40562E4300000000
  %179 = fcmp olt float %174, 0xC059D1DA00000000
  %180 = fneg float %176
  %181 = tail call float @llvm.fma.f32(float %174, float 0x3FF7154760000000, float %180)
  %182 = tail call float @llvm.fma.f32(float %174, float 0x3E54AE0BE0000000, float %181)
  %183 = fsub float %176, %177
  %184 = fadd float %182, %183
  %185 = tail call float @llvm.exp2.f32(float %184)
  %186 = fptosi float %177 to i32
  %187 = tail call float @llvm.amdgcn.ldexp.f32(float %185, i32 %186)
  %188 = select i1 %179, float 0.000000e+00, float %187
  %189 = select i1 %178, float 0x7FF0000000000000, float %188
  %190 = tail call float @llvm.fma.f32(float %189, float %175, float %189)
  %191 = tail call float @llvm.fabs.f32(float %189) #3
  %192 = fcmp oeq float %191, 0x7FF0000000000000
  %193 = select i1 %192, float %189, float %190
  %194 = tail call float @llvm.fabs.f32(float %50)
  %195 = tail call float @llvm.fabs.f32(float %193)
  %196 = fcmp olt float %50, 0.000000e+00
  %197 = select i1 %196, float 0x7FF0000000000000, float 0.000000e+00
  %198 = select i1 %196, float 0.000000e+00, float 0x7FF0000000000000
  %199 = fcmp oeq float %49, 0.000000e+00
  %200 = select i1 %199, float %197, float %195
  %201 = fcmp oeq float %51, 0x7FF0000000000000
  %202 = select i1 %201, float %198, float %200
  %203 = fcmp oeq float %194, 0x7FF0000000000000
  %204 = fcmp olt float %51, 1.000000e+00
  %205 = select i1 %204, float %197, float %198
  %206 = select i1 %203, float %205, float %202
  %207 = fcmp oeq float %50, 0.000000e+00
  %208 = select i1 %199, i1 true, i1 %201
  %209 = select i1 %208, float 0x7FF8000000000000, float 1.000000e+00
  %210 = select i1 %207, float %209, float %206
  %211 = fcmp oeq float %49, 1.000000e+00
  %212 = select i1 %203, float 0x7FF8000000000000, float 1.000000e+00
  %213 = select i1 %211, float %212, float %210
  %214 = fcmp ult float %49, 0.000000e+00
  %215 = fcmp uno float %50, 0.000000e+00
  %216 = or i1 %214, %215
  %217 = select i1 %216, float 0x7FF8000000000000, float %213
  %218 = fneg float %49
  %219 = fmul float %49, 0xBFF7154760000000
  %220 = tail call float @llvm.rint.f32(float %219)
  %221 = fcmp ogt float %49, 0x4059D1DA00000000
  %222 = fneg float %219
  %223 = tail call float @llvm.fma.f32(float %218, float 0x3FF7154760000000, float %222)
  %224 = tail call float @llvm.fma.f32(float %218, float 0x3E54AE0BE0000000, float %223)
  %225 = fsub float %219, %220
  %226 = fadd float %224, %225
  %227 = tail call float @llvm.exp2.f32(float %226)
  %228 = fptosi float %220 to i32
  %229 = tail call float @llvm.amdgcn.ldexp.f32(float %227, i32 %228)
  %230 = select i1 %221, float 0.000000e+00, float %229
  %231 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %232 = tail call float @llvm.fmuladd.f32(float %231, float 0xBF65F72680000000, float 0x3F6C71C720000000)
  %233 = tail call float @llvm.fmuladd.f32(float %231, float %232, float 0x3FB5555560000000)
  %234 = fmul float %231, %233
  %235 = fcmp ogt float %28, 0.000000e+00
  br i1 %235, label %236, label %245

236:                                              ; preds = %47
  %237 = fmul float %230, 0x40040D9320000000
  %238 = fmul float %237, %217
  %239 = fmul float %217, %238
  %240 = tail call float @llvm.amdgcn.rcp.f32(float %48)
  %241 = fmul float %240, %239
  %242 = tail call float @llvm.fmuladd.f32(float %241, float %234, float %241)
  %243 = fcmp ogt float %28, 0x40418521E0000000
  %244 = select i1 %243, float 0x7FF0000000000000, float %242
  br label %304

245:                                              ; preds = %47
  %246 = fmul float %29, 5.000000e-01
  %247 = tail call float @llvm.amdgcn.fract.f32(float %246)
  %248 = tail call i1 @llvm.amdgcn.class.f32(float %246, i32 516)
  %249 = fmul float %247, 2.000000e+00
  %250 = select i1 %248, float 0.000000e+00, float %249
  %251 = fcmp ogt float %29, 1.000000e+00
  %252 = select i1 %251, float %250, float %29
  %253 = fmul float %252, 2.000000e+00
  %254 = tail call float @llvm.rint.f32(float %253)
  %255 = tail call float @llvm.fmuladd.f32(float %254, float -5.000000e-01, float %252)
  %256 = fptosi float %254 to i32
  %257 = fmul float %255, %255
  %258 = tail call float @llvm.fmuladd.f32(float %257, float 0x3FCEB54820000000, float 0xBFE3E497C0000000)
  %259 = tail call float @llvm.fmuladd.f32(float %257, float %258, float 0x400468E6C0000000)
  %260 = tail call float @llvm.fmuladd.f32(float %257, float %259, float 0xC014ABC1C0000000)
  %261 = fmul float %255, %257
  %262 = fmul float %261, %260
  %263 = tail call float @llvm.fmuladd.f32(float %255, float 0x400921FB60000000, float %262)
  %264 = tail call float @llvm.fmuladd.f32(float %257, float 0x3FA97CA880000000, float 0x3FCC85D3A0000000)
  %265 = tail call float @llvm.fmuladd.f32(float %257, float %264, float 0xBFF55A3B40000000)
  %266 = tail call float @llvm.fmuladd.f32(float %257, float %265, float 0x40103C1A60000000)
  %267 = tail call float @llvm.fmuladd.f32(float %257, float %266, float 0xC013BD3CC0000000)
  %268 = tail call float @llvm.fmuladd.f32(float %257, float %267, float 1.000000e+00)
  %269 = and i32 %256, 1
  %270 = icmp eq i32 %269, 0
  %271 = select i1 %270, float %263, float %268
  %272 = bitcast float %271 to i32
  %273 = shl i32 %256, 30
  %274 = and i32 %273, -2147483648
  %275 = bitcast float %28 to i32
  %276 = bitcast float %29 to i32
  %277 = xor i32 %276, %275
  %278 = xor i32 %277, %274
  %279 = xor i32 %278, %272
  %280 = bitcast i32 %279 to float
  %281 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 504)
  %282 = select i1 %281, float %280, float 0x7FF8000000000000
  %283 = fmul float %28, %282
  %284 = fmul float %283, %230
  %285 = fmul float %284, %217
  %286 = fmul float %217, %285
  %287 = fmul float %48, 0xBFF40D9320000000
  %288 = tail call float @llvm.fmuladd.f32(float %286, float %234, float %286)
  %289 = fdiv float %287, %288, !fpmath !20
  %290 = fcmp olt float %28, -4.200000e+01
  %291 = select i1 %290, float 0.000000e+00, float %289
  %292 = tail call float @llvm.amdgcn.fract.f32(float %28)
  %293 = tail call i1 @llvm.amdgcn.class.f32(float %28, i32 516)
  %294 = select i1 %293, float 0.000000e+00, float %292
  %295 = fcmp oeq float %294, 0.000000e+00
  %296 = select i1 %295, float 0x7FF8000000000000, float %291
  br label %304

297:                                              ; preds = %24
  %298 = tail call float @llvm.fmuladd.f32(float %28, float 0x3FEF6A5100000000, float 0xBFED0A1180000000)
  %299 = tail call float @llvm.fmuladd.f32(float %28, float %298, float 0x3FEFA658C0000000)
  %300 = tail call float @llvm.fmuladd.f32(float %28, float %299, float 0xBFE2788D00000000)
  %301 = fmul float %28, 4.000000e+00
  %302 = tail call float @llvm.amdgcn.rcp.f32(float %301)
  %303 = tail call float @llvm.fmuladd.f32(float %302, float 4.000000e+00, float %300)
  br label %304

304:                                              ; preds = %236, %245, %297
  %305 = phi float [ %303, %297 ], [ %244, %236 ], [ %296, %245 ]
  %306 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %305, float addrspace(1)* %306, align 4, !tbaa !16
  %307 = add i32 %25, %21
  %308 = icmp ult i32 %307, %2
  br i1 %308, label %24, label %23, !llvm.loop !21
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{float 2.500000e+00}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
