; ModuleID = '../data/hip_kernels/11105/14/main.cu'
source_filename = "../data/hip_kernels/11105/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27adaptive_log_tonemap_kernelPfS_iiiffS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %3
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %320

29:                                               ; preds = %8
  %30 = mul nsw i32 %17, %2
  %31 = add nsw i32 %30, %25
  %32 = mul nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %32, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = add nsw i32 %32, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fpext float %35 to double
  %45 = fmul contract double %44, 7.220000e-02
  %46 = fpext float %39 to double
  %47 = fmul contract double %46, 7.152000e-01
  %48 = fadd contract double %45, %47
  %49 = fpext float %43 to double
  %50 = fmul contract double %49, 2.126000e-01
  %51 = fadd contract double %48, %50
  %52 = fptrunc double %51 to float
  %53 = load float, float addrspace(1)* %7, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fadd contract float %53, 1.000000e+00
  %55 = tail call i1 @llvm.amdgcn.class.f32(float %54, i32 144)
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %54, %56
  %58 = tail call float @llvm.log2.f32(float %57)
  %59 = fmul float %58, 0x3FD3441340000000
  %60 = fadd contract float %52, 1.000000e+00
  %61 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 144)
  %62 = select i1 %61, float 0x41F0000000000000, float 1.000000e+00
  %63 = fmul float %60, %62
  %64 = tail call float @llvm.log2.f32(float %63)
  %65 = fmul float %64, 0x3FE62E42E0000000
  %66 = fdiv contract float %52, %53
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %5, i32 144)
  %68 = select i1 %67, float 0x41F0000000000000, float 1.000000e+00
  %69 = fmul float %68, %5
  %70 = tail call float @llvm.log2.f32(float %69)
  %71 = fmul float %70, 0x3FE62E42E0000000
  %72 = tail call i1 @llvm.amdgcn.class.f32(float %70, i32 519)
  %73 = fneg float %71
  %74 = tail call float @llvm.fma.f32(float %70, float 0x3FE62E42E0000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %70, float 0x3E6EFA39E0000000, float %74)
  %76 = fadd float %71, %75
  %77 = select i1 %72, float %70, float %76
  %78 = select i1 %67, float 0x40362E4300000000, float 0.000000e+00
  %79 = fsub float %77, %78
  %80 = fdiv contract float %79, 0xBFE62E4300000000
  %81 = tail call float @llvm.fabs.f32(float %66)
  %82 = tail call float @llvm.amdgcn.frexp.mant.f32(float %81)
  %83 = fcmp olt float %82, 0x3FE5555560000000
  %84 = zext i1 %83 to i32
  %85 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 %84)
  %86 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %81)
  %87 = sub nsw i32 %86, %84
  %88 = fadd float %85, -1.000000e+00
  %89 = fadd float %85, 1.000000e+00
  %90 = fadd float %89, -1.000000e+00
  %91 = fsub float %85, %90
  %92 = tail call float @llvm.amdgcn.rcp.f32(float %89)
  %93 = fmul float %88, %92
  %94 = fmul float %89, %93
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %93, float %89, float %95)
  %97 = tail call float @llvm.fma.f32(float %93, float %91, float %96)
  %98 = fadd float %94, %97
  %99 = fsub float %98, %94
  %100 = fsub float %97, %99
  %101 = fsub float %88, %98
  %102 = fsub float %88, %101
  %103 = fsub float %102, %98
  %104 = fsub float %103, %100
  %105 = fadd float %101, %104
  %106 = fmul float %92, %105
  %107 = fadd float %93, %106
  %108 = fsub float %107, %93
  %109 = fsub float %106, %108
  %110 = fmul float %107, %107
  %111 = fneg float %110
  %112 = tail call float @llvm.fma.f32(float %107, float %107, float %111)
  %113 = fmul float %109, 2.000000e+00
  %114 = tail call float @llvm.fma.f32(float %107, float %113, float %112)
  %115 = fadd float %110, %114
  %116 = fsub float %115, %110
  %117 = fsub float %114, %116
  %118 = tail call float @llvm.fmuladd.f32(float %115, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %119 = tail call float @llvm.fmuladd.f32(float %115, float %118, float 0x3FD999BDE0000000)
  %120 = sitofp i32 %87 to float
  %121 = fmul float %120, 0x3FE62E4300000000
  %122 = fneg float %121
  %123 = tail call float @llvm.fma.f32(float %120, float 0x3FE62E4300000000, float %122)
  %124 = tail call float @llvm.fma.f32(float %120, float 0xBE205C6100000000, float %123)
  %125 = fadd float %121, %124
  %126 = fsub float %125, %121
  %127 = fsub float %124, %126
  %128 = tail call float @llvm.amdgcn.ldexp.f32(float %107, i32 1)
  %129 = fmul float %107, %115
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %115, float %107, float %130)
  %132 = tail call float @llvm.fma.f32(float %115, float %109, float %131)
  %133 = tail call float @llvm.fma.f32(float %117, float %107, float %132)
  %134 = fadd float %129, %133
  %135 = fsub float %134, %129
  %136 = fsub float %133, %135
  %137 = fmul float %115, %119
  %138 = fneg float %137
  %139 = tail call float @llvm.fma.f32(float %115, float %119, float %138)
  %140 = tail call float @llvm.fma.f32(float %117, float %119, float %139)
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = fadd float %141, 0x3FE5555540000000
  %145 = fadd float %144, 0xBFE5555540000000
  %146 = fsub float %141, %145
  %147 = fadd float %143, 0x3E2E720200000000
  %148 = fadd float %147, %146
  %149 = fadd float %144, %148
  %150 = fsub float %149, %144
  %151 = fsub float %148, %150
  %152 = fmul float %134, %149
  %153 = fneg float %152
  %154 = tail call float @llvm.fma.f32(float %134, float %149, float %153)
  %155 = tail call float @llvm.fma.f32(float %134, float %151, float %154)
  %156 = tail call float @llvm.fma.f32(float %136, float %149, float %155)
  %157 = tail call float @llvm.amdgcn.ldexp.f32(float %109, i32 1)
  %158 = fadd float %152, %156
  %159 = fsub float %158, %152
  %160 = fsub float %156, %159
  %161 = fadd float %128, %158
  %162 = fsub float %161, %128
  %163 = fsub float %158, %162
  %164 = fadd float %157, %160
  %165 = fadd float %164, %163
  %166 = fadd float %161, %165
  %167 = fsub float %166, %161
  %168 = fsub float %165, %167
  %169 = fadd float %125, %166
  %170 = fsub float %169, %125
  %171 = fsub float %169, %170
  %172 = fsub float %125, %171
  %173 = fsub float %166, %170
  %174 = fadd float %173, %172
  %175 = fadd float %127, %168
  %176 = fsub float %175, %127
  %177 = fsub float %175, %176
  %178 = fsub float %127, %177
  %179 = fsub float %168, %176
  %180 = fadd float %179, %178
  %181 = fadd float %175, %174
  %182 = fadd float %169, %181
  %183 = fsub float %182, %169
  %184 = fsub float %181, %183
  %185 = fadd float %180, %184
  %186 = fadd float %182, %185
  %187 = fsub float %186, %182
  %188 = fsub float %185, %187
  %189 = fmul float %80, %186
  %190 = fneg float %189
  %191 = tail call float @llvm.fma.f32(float %80, float %186, float %190)
  %192 = tail call float @llvm.fma.f32(float %80, float %188, float %191)
  %193 = fadd float %189, %192
  %194 = fsub float %193, %189
  %195 = fsub float %192, %194
  %196 = tail call float @llvm.fabs.f32(float %189) #3
  %197 = fcmp oeq float %196, 0x7FF0000000000000
  %198 = select i1 %197, float %189, float %193
  %199 = tail call float @llvm.fabs.f32(float %198) #3
  %200 = fcmp oeq float %199, 0x7FF0000000000000
  %201 = select i1 %200, float 0.000000e+00, float %195
  %202 = fcmp oeq float %198, 0x40562E4300000000
  %203 = select i1 %202, float 0x3EE0000000000000, float 0.000000e+00
  %204 = fsub float %198, %203
  %205 = fadd float %203, %201
  %206 = fmul float %204, 0x3FF7154760000000
  %207 = tail call float @llvm.rint.f32(float %206)
  %208 = fcmp ogt float %204, 0x40562E4300000000
  %209 = fcmp olt float %204, 0xC059D1DA00000000
  %210 = fneg float %206
  %211 = tail call float @llvm.fma.f32(float %204, float 0x3FF7154760000000, float %210)
  %212 = tail call float @llvm.fma.f32(float %204, float 0x3E54AE0BE0000000, float %211)
  %213 = fsub float %206, %207
  %214 = fadd float %212, %213
  %215 = tail call float @llvm.exp2.f32(float %214)
  %216 = fptosi float %207 to i32
  %217 = tail call float @llvm.amdgcn.ldexp.f32(float %215, i32 %216)
  %218 = select i1 %209, float 0.000000e+00, float %217
  %219 = select i1 %208, float 0x7FF0000000000000, float %218
  %220 = tail call float @llvm.fma.f32(float %219, float %205, float %219)
  %221 = tail call float @llvm.fabs.f32(float %219) #3
  %222 = fcmp oeq float %221, 0x7FF0000000000000
  %223 = select i1 %222, float %219, float %220
  %224 = tail call float @llvm.fabs.f32(float %80)
  %225 = tail call float @llvm.trunc.f32(float %224)
  %226 = fcmp oeq float %224, %225
  %227 = zext i1 %226 to i32
  %228 = fmul float %225, 5.000000e-01
  %229 = tail call float @llvm.amdgcn.fract.f32(float %228)
  %230 = tail call i1 @llvm.amdgcn.class.f32(float %228, i32 516)
  %231 = select i1 %230, float 0.000000e+00, float %229
  %232 = fcmp oeq float %231, 0.000000e+00
  %233 = and i1 %226, %232
  %234 = zext i1 %233 to i32
  %235 = add nuw nsw i32 %234, %227
  %236 = icmp eq i32 %235, 1
  %237 = fcmp olt float %66, 0.000000e+00
  %238 = and i1 %236, %237
  %239 = select i1 %238, float -0.000000e+00, float 0.000000e+00
  %240 = tail call float @llvm.copysign.f32(float %223, float %239)
  %241 = fcmp uge float %66, 0.000000e+00
  %242 = icmp ne i32 %235, 0
  %243 = select i1 %241, i1 true, i1 %242
  %244 = select i1 %243, float %240, float 0x7FF8000000000000
  %245 = fcmp oeq float %224, 0x7FF0000000000000
  br i1 %245, label %246, label %255

246:                                              ; preds = %29
  %247 = fcmp oeq float %81, 1.000000e+00
  %248 = fadd float %81, -1.000000e+00
  %249 = bitcast float %80 to i32
  %250 = bitcast float %248 to i32
  %251 = xor i32 %250, %249
  %252 = icmp sgt i32 %251, -1
  %253 = select i1 %252, float 0x7FF0000000000000, float 0.000000e+00
  %254 = select i1 %247, float %81, float %253
  br label %255

255:                                              ; preds = %29, %246
  %256 = phi float [ %244, %29 ], [ %254, %246 ]
  %257 = tail call i1 @llvm.amdgcn.class.f32(float %64, i32 519)
  %258 = fneg float %65
  %259 = tail call float @llvm.fma.f32(float %64, float 0x3FE62E42E0000000, float %258)
  %260 = tail call float @llvm.fma.f32(float %64, float 0x3E6EFA39E0000000, float %259)
  %261 = fadd float %65, %260
  %262 = select i1 %257, float %64, float %261
  %263 = select i1 %61, float 0x40362E4300000000, float 0.000000e+00
  %264 = fsub float %262, %263
  %265 = fpext float %6 to double
  %266 = tail call i1 @llvm.amdgcn.class.f32(float %58, i32 519)
  %267 = fneg float %59
  %268 = tail call float @llvm.fma.f32(float %58, float 0x3FD3441340000000, float %267)
  %269 = tail call float @llvm.fma.f32(float %58, float 0x3E509F79E0000000, float %268)
  %270 = fadd float %59, %269
  %271 = select i1 %266, float %58, float %270
  %272 = select i1 %55, float 0x4023441360000000, float 0.000000e+00
  %273 = fsub float %271, %272
  %274 = fpext float %273 to double
  %275 = fmul contract double %274, 1.000000e+02
  %276 = fdiv contract double %265, %275
  %277 = fcmp oeq float %81, 0x7FF0000000000000
  %278 = fcmp oeq float %66, 0.000000e+00
  %279 = or i1 %278, %277
  %280 = fcmp olt float %80, 0.000000e+00
  %281 = xor i1 %280, %278
  %282 = select i1 %281, float 0.000000e+00, float 0x7FF0000000000000
  %283 = select i1 %236, float %66, float 0.000000e+00
  %284 = tail call float @llvm.copysign.f32(float %282, float %283)
  %285 = select i1 %279, float %284, float %256
  %286 = fcmp uno float %66, %80
  %287 = select i1 %286, float 0x7FF8000000000000, float %285
  %288 = fcmp oeq float %66, 1.000000e+00
  %289 = fcmp oeq float %80, 0.000000e+00
  %290 = or i1 %289, %288
  %291 = fpext float %287 to double
  %292 = fmul contract double %291, 8.000000e+00
  %293 = fadd contract double %292, 2.000000e+00
  %294 = fptrunc double %293 to float
  %295 = select i1 %290, float 1.000000e+01, float %294
  %296 = tail call i1 @llvm.amdgcn.class.f32(float %295, i32 144)
  %297 = select i1 %296, float 0x41F0000000000000, float 1.000000e+00
  %298 = fmul float %295, %297
  %299 = tail call float @llvm.log2.f32(float %298)
  %300 = fmul float %299, 0x3FE62E42E0000000
  %301 = tail call i1 @llvm.amdgcn.class.f32(float %299, i32 519)
  %302 = fneg float %300
  %303 = tail call float @llvm.fma.f32(float %299, float 0x3FE62E42E0000000, float %302)
  %304 = tail call float @llvm.fma.f32(float %299, float 0x3E6EFA39E0000000, float %303)
  %305 = fadd float %300, %304
  %306 = select i1 %301, float %299, float %305
  %307 = select i1 %296, float 0x40362E4300000000, float 0.000000e+00
  %308 = fsub float %306, %307
  %309 = fdiv contract float %264, %308
  %310 = fpext float %309 to double
  %311 = fmul contract double %276, %310
  %312 = fptrunc double %311 to float
  %313 = fdiv contract float %312, %52
  %314 = fmul contract float %35, %313
  %315 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %314, float addrspace(1)* %315, align 4, !tbaa !7
  %316 = fmul contract float %39, %313
  %317 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  store float %316, float addrspace(1)* %317, align 4, !tbaa !7
  %318 = fmul contract float %43, %313
  %319 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %318, float addrspace(1)* %319, align 4, !tbaa !7
  br label %320

320:                                              ; preds = %255, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

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
