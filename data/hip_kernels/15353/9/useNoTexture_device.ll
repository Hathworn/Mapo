; ModuleID = '../data/hip_kernels/15353/9/main.cu'
source_filename = "../data/hip_kernels/15353/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

@c_size = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_size to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12useNoTexturePfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %22 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %28 = add i32 %26, %27
  %29 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !7
  %30 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !7
  %31 = mul i32 %28, %30
  %32 = add i32 %20, %31
  %33 = mul i32 %32, %29
  %34 = add i32 %12, %33
  %35 = mul i32 %34, %2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !10, !amdgpu.noclobber !5
  %39 = add i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !10, !amdgpu.noclobber !5
  %43 = add i32 %35, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !10, !amdgpu.noclobber !5
  %47 = tail call float @llvm.fabs.f32(float %38)
  %48 = tail call float @llvm.amdgcn.frexp.mant.f32(float %47)
  %49 = fcmp olt float %48, 0x3FE5555560000000
  %50 = zext i1 %49 to i32
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %50)
  %52 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %47)
  %53 = sub nsw i32 %52, %50
  %54 = fadd float %51, -1.000000e+00
  %55 = fadd float %51, 1.000000e+00
  %56 = fadd float %55, -1.000000e+00
  %57 = fsub float %51, %56
  %58 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %59 = fmul float %54, %58
  %60 = fmul float %55, %59
  %61 = fneg float %60
  %62 = tail call float @llvm.fma.f32(float %59, float %55, float %61)
  %63 = tail call float @llvm.fma.f32(float %59, float %57, float %62)
  %64 = fadd float %60, %63
  %65 = fsub float %64, %60
  %66 = fsub float %63, %65
  %67 = fsub float %54, %64
  %68 = fsub float %54, %67
  %69 = fsub float %68, %64
  %70 = fsub float %69, %66
  %71 = fadd float %67, %70
  %72 = fmul float %58, %71
  %73 = fadd float %59, %72
  %74 = fsub float %73, %59
  %75 = fsub float %72, %74
  %76 = fmul float %73, %73
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %73, float %73, float %77)
  %79 = fmul float %75, 2.000000e+00
  %80 = tail call float @llvm.fma.f32(float %73, float %79, float %78)
  %81 = fadd float %76, %80
  %82 = fsub float %81, %76
  %83 = fsub float %80, %82
  %84 = tail call float @llvm.fmuladd.f32(float %81, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %85 = tail call float @llvm.fmuladd.f32(float %81, float %84, float 0x3FD999BDE0000000)
  %86 = sitofp i32 %53 to float
  %87 = fmul float %86, 0x3FE62E4300000000
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %86, float 0x3FE62E4300000000, float %88)
  %90 = tail call float @llvm.fma.f32(float %86, float 0xBE205C6100000000, float %89)
  %91 = fadd float %87, %90
  %92 = fsub float %91, %87
  %93 = fsub float %90, %92
  %94 = tail call float @llvm.amdgcn.ldexp.f32(float %73, i32 1)
  %95 = fmul float %73, %81
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %81, float %73, float %96)
  %98 = tail call float @llvm.fma.f32(float %81, float %75, float %97)
  %99 = tail call float @llvm.fma.f32(float %83, float %73, float %98)
  %100 = fadd float %95, %99
  %101 = fsub float %100, %95
  %102 = fsub float %99, %101
  %103 = fmul float %81, %85
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %81, float %85, float %104)
  %106 = tail call float @llvm.fma.f32(float %83, float %85, float %105)
  %107 = fadd float %103, %106
  %108 = fsub float %107, %103
  %109 = fsub float %106, %108
  %110 = fadd float %107, 0x3FE5555540000000
  %111 = fadd float %110, 0xBFE5555540000000
  %112 = fsub float %107, %111
  %113 = fadd float %109, 0x3E2E720200000000
  %114 = fadd float %113, %112
  %115 = fadd float %110, %114
  %116 = fsub float %115, %110
  %117 = fsub float %114, %116
  %118 = fmul float %100, %115
  %119 = fneg float %118
  %120 = tail call float @llvm.fma.f32(float %100, float %115, float %119)
  %121 = tail call float @llvm.fma.f32(float %100, float %117, float %120)
  %122 = tail call float @llvm.fma.f32(float %102, float %115, float %121)
  %123 = tail call float @llvm.amdgcn.ldexp.f32(float %75, i32 1)
  %124 = fadd float %118, %122
  %125 = fsub float %124, %118
  %126 = fsub float %122, %125
  %127 = fadd float %94, %124
  %128 = fsub float %127, %94
  %129 = fsub float %124, %128
  %130 = fadd float %123, %126
  %131 = fadd float %130, %129
  %132 = fadd float %127, %131
  %133 = fsub float %132, %127
  %134 = fsub float %131, %133
  %135 = fadd float %91, %132
  %136 = fsub float %135, %91
  %137 = fsub float %135, %136
  %138 = fsub float %91, %137
  %139 = fsub float %132, %136
  %140 = fadd float %139, %138
  %141 = fadd float %93, %134
  %142 = fsub float %141, %93
  %143 = fsub float %141, %142
  %144 = fsub float %93, %143
  %145 = fsub float %134, %142
  %146 = fadd float %145, %144
  %147 = fadd float %141, %140
  %148 = fadd float %135, %147
  %149 = fsub float %148, %135
  %150 = fsub float %147, %149
  %151 = fadd float %146, %150
  %152 = fadd float %148, %151
  %153 = fsub float %152, %148
  %154 = fsub float %151, %153
  %155 = fmul float %152, 2.000000e+00
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %152, float 2.000000e+00, float %156)
  %158 = tail call float @llvm.fma.f32(float %154, float 2.000000e+00, float %157)
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = tail call float @llvm.fabs.f32(float %155) #3
  %163 = fcmp oeq float %162, 0x7FF0000000000000
  %164 = select i1 %163, float %155, float %159
  %165 = tail call float @llvm.fabs.f32(float %164) #3
  %166 = fcmp oeq float %165, 0x7FF0000000000000
  %167 = select i1 %166, float 0.000000e+00, float %161
  %168 = fcmp oeq float %164, 0x40562E4300000000
  %169 = select i1 %168, float 0x3EE0000000000000, float 0.000000e+00
  %170 = fsub float %164, %169
  %171 = fadd float %169, %167
  %172 = fmul float %170, 0x3FF7154760000000
  %173 = tail call float @llvm.rint.f32(float %172)
  %174 = fcmp ogt float %170, 0x40562E4300000000
  %175 = fcmp olt float %170, 0xC059D1DA00000000
  %176 = fneg float %172
  %177 = tail call float @llvm.fma.f32(float %170, float 0x3FF7154760000000, float %176)
  %178 = tail call float @llvm.fma.f32(float %170, float 0x3E54AE0BE0000000, float %177)
  %179 = fsub float %172, %173
  %180 = fadd float %178, %179
  %181 = tail call float @llvm.exp2.f32(float %180)
  %182 = fptosi float %173 to i32
  %183 = tail call float @llvm.amdgcn.ldexp.f32(float %181, i32 %182)
  %184 = select i1 %175, float 0.000000e+00, float %183
  %185 = select i1 %174, float 0x7FF0000000000000, float %184
  %186 = tail call float @llvm.fma.f32(float %185, float %171, float %185)
  %187 = tail call float @llvm.fabs.f32(float %185) #3
  %188 = fcmp oeq float %187, 0x7FF0000000000000
  %189 = select i1 %188, float %185, float %186
  %190 = tail call float @llvm.fabs.f32(float %189)
  %191 = fcmp oeq float %47, 0x7FF0000000000000
  %192 = fcmp oeq float %38, 0.000000e+00
  %193 = select i1 %191, float 0x7FF0000000000000, float %190
  %194 = select i1 %192, float 0.000000e+00, float %193
  %195 = fcmp uno float %38, 0.000000e+00
  %196 = select i1 %195, float 0x7FF8000000000000, float %194
  %197 = fcmp oeq float %38, 1.000000e+00
  %198 = select i1 %197, float 1.000000e+00, float %196
  %199 = tail call float @llvm.fabs.f32(float %42)
  %200 = tail call float @llvm.amdgcn.frexp.mant.f32(float %199)
  %201 = fcmp olt float %200, 0x3FE5555560000000
  %202 = zext i1 %201 to i32
  %203 = tail call float @llvm.amdgcn.ldexp.f32(float %200, i32 %202)
  %204 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %199)
  %205 = sub nsw i32 %204, %202
  %206 = fadd float %203, -1.000000e+00
  %207 = fadd float %203, 1.000000e+00
  %208 = fadd float %207, -1.000000e+00
  %209 = fsub float %203, %208
  %210 = tail call float @llvm.amdgcn.rcp.f32(float %207)
  %211 = fmul float %206, %210
  %212 = fmul float %207, %211
  %213 = fneg float %212
  %214 = tail call float @llvm.fma.f32(float %211, float %207, float %213)
  %215 = tail call float @llvm.fma.f32(float %211, float %209, float %214)
  %216 = fadd float %212, %215
  %217 = fsub float %216, %212
  %218 = fsub float %215, %217
  %219 = fsub float %206, %216
  %220 = fsub float %206, %219
  %221 = fsub float %220, %216
  %222 = fsub float %221, %218
  %223 = fadd float %219, %222
  %224 = fmul float %210, %223
  %225 = fadd float %211, %224
  %226 = fsub float %225, %211
  %227 = fsub float %224, %226
  %228 = fmul float %225, %225
  %229 = fneg float %228
  %230 = tail call float @llvm.fma.f32(float %225, float %225, float %229)
  %231 = fmul float %227, 2.000000e+00
  %232 = tail call float @llvm.fma.f32(float %225, float %231, float %230)
  %233 = fadd float %228, %232
  %234 = fsub float %233, %228
  %235 = fsub float %232, %234
  %236 = tail call float @llvm.fmuladd.f32(float %233, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %237 = tail call float @llvm.fmuladd.f32(float %233, float %236, float 0x3FD999BDE0000000)
  %238 = sitofp i32 %205 to float
  %239 = fmul float %238, 0x3FE62E4300000000
  %240 = fneg float %239
  %241 = tail call float @llvm.fma.f32(float %238, float 0x3FE62E4300000000, float %240)
  %242 = tail call float @llvm.fma.f32(float %238, float 0xBE205C6100000000, float %241)
  %243 = fadd float %239, %242
  %244 = fsub float %243, %239
  %245 = fsub float %242, %244
  %246 = tail call float @llvm.amdgcn.ldexp.f32(float %225, i32 1)
  %247 = fmul float %225, %233
  %248 = fneg float %247
  %249 = tail call float @llvm.fma.f32(float %233, float %225, float %248)
  %250 = tail call float @llvm.fma.f32(float %233, float %227, float %249)
  %251 = tail call float @llvm.fma.f32(float %235, float %225, float %250)
  %252 = fadd float %247, %251
  %253 = fsub float %252, %247
  %254 = fsub float %251, %253
  %255 = fmul float %233, %237
  %256 = fneg float %255
  %257 = tail call float @llvm.fma.f32(float %233, float %237, float %256)
  %258 = tail call float @llvm.fma.f32(float %235, float %237, float %257)
  %259 = fadd float %255, %258
  %260 = fsub float %259, %255
  %261 = fsub float %258, %260
  %262 = fadd float %259, 0x3FE5555540000000
  %263 = fadd float %262, 0xBFE5555540000000
  %264 = fsub float %259, %263
  %265 = fadd float %261, 0x3E2E720200000000
  %266 = fadd float %265, %264
  %267 = fadd float %262, %266
  %268 = fsub float %267, %262
  %269 = fsub float %266, %268
  %270 = fmul float %252, %267
  %271 = fneg float %270
  %272 = tail call float @llvm.fma.f32(float %252, float %267, float %271)
  %273 = tail call float @llvm.fma.f32(float %252, float %269, float %272)
  %274 = tail call float @llvm.fma.f32(float %254, float %267, float %273)
  %275 = tail call float @llvm.amdgcn.ldexp.f32(float %227, i32 1)
  %276 = fadd float %270, %274
  %277 = fsub float %276, %270
  %278 = fsub float %274, %277
  %279 = fadd float %246, %276
  %280 = fsub float %279, %246
  %281 = fsub float %276, %280
  %282 = fadd float %275, %278
  %283 = fadd float %282, %281
  %284 = fadd float %279, %283
  %285 = fsub float %284, %279
  %286 = fsub float %283, %285
  %287 = fadd float %243, %284
  %288 = fsub float %287, %243
  %289 = fsub float %287, %288
  %290 = fsub float %243, %289
  %291 = fsub float %284, %288
  %292 = fadd float %291, %290
  %293 = fadd float %245, %286
  %294 = fsub float %293, %245
  %295 = fsub float %293, %294
  %296 = fsub float %245, %295
  %297 = fsub float %286, %294
  %298 = fadd float %297, %296
  %299 = fadd float %293, %292
  %300 = fadd float %287, %299
  %301 = fsub float %300, %287
  %302 = fsub float %299, %301
  %303 = fadd float %298, %302
  %304 = fadd float %300, %303
  %305 = fsub float %304, %300
  %306 = fsub float %303, %305
  %307 = fmul float %304, 2.000000e+00
  %308 = fneg float %307
  %309 = tail call float @llvm.fma.f32(float %304, float 2.000000e+00, float %308)
  %310 = tail call float @llvm.fma.f32(float %306, float 2.000000e+00, float %309)
  %311 = fadd float %307, %310
  %312 = fsub float %311, %307
  %313 = fsub float %310, %312
  %314 = tail call float @llvm.fabs.f32(float %307) #3
  %315 = fcmp oeq float %314, 0x7FF0000000000000
  %316 = select i1 %315, float %307, float %311
  %317 = tail call float @llvm.fabs.f32(float %316) #3
  %318 = fcmp oeq float %317, 0x7FF0000000000000
  %319 = select i1 %318, float 0.000000e+00, float %313
  %320 = fcmp oeq float %316, 0x40562E4300000000
  %321 = select i1 %320, float 0x3EE0000000000000, float 0.000000e+00
  %322 = fsub float %316, %321
  %323 = fadd float %321, %319
  %324 = fmul float %322, 0x3FF7154760000000
  %325 = tail call float @llvm.rint.f32(float %324)
  %326 = fcmp ogt float %322, 0x40562E4300000000
  %327 = fcmp olt float %322, 0xC059D1DA00000000
  %328 = fneg float %324
  %329 = tail call float @llvm.fma.f32(float %322, float 0x3FF7154760000000, float %328)
  %330 = tail call float @llvm.fma.f32(float %322, float 0x3E54AE0BE0000000, float %329)
  %331 = fsub float %324, %325
  %332 = fadd float %330, %331
  %333 = tail call float @llvm.exp2.f32(float %332)
  %334 = fptosi float %325 to i32
  %335 = tail call float @llvm.amdgcn.ldexp.f32(float %333, i32 %334)
  %336 = select i1 %327, float 0.000000e+00, float %335
  %337 = select i1 %326, float 0x7FF0000000000000, float %336
  %338 = tail call float @llvm.fma.f32(float %337, float %323, float %337)
  %339 = tail call float @llvm.fabs.f32(float %337) #3
  %340 = fcmp oeq float %339, 0x7FF0000000000000
  %341 = select i1 %340, float %337, float %338
  %342 = tail call float @llvm.fabs.f32(float %341)
  %343 = fcmp oeq float %199, 0x7FF0000000000000
  %344 = fcmp oeq float %42, 0.000000e+00
  %345 = select i1 %343, float 0x7FF0000000000000, float %342
  %346 = select i1 %344, float 0.000000e+00, float %345
  %347 = fcmp uno float %42, 0.000000e+00
  %348 = select i1 %347, float 0x7FF8000000000000, float %346
  %349 = fcmp oeq float %42, 1.000000e+00
  %350 = select i1 %349, float 1.000000e+00, float %348
  %351 = fadd contract float %198, %350
  %352 = tail call float @llvm.fabs.f32(float %46)
  %353 = tail call float @llvm.amdgcn.frexp.mant.f32(float %352)
  %354 = fcmp olt float %353, 0x3FE5555560000000
  %355 = zext i1 %354 to i32
  %356 = tail call float @llvm.amdgcn.ldexp.f32(float %353, i32 %355)
  %357 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %352)
  %358 = sub nsw i32 %357, %355
  %359 = fadd float %356, -1.000000e+00
  %360 = fadd float %356, 1.000000e+00
  %361 = fadd float %360, -1.000000e+00
  %362 = fsub float %356, %361
  %363 = tail call float @llvm.amdgcn.rcp.f32(float %360)
  %364 = fmul float %359, %363
  %365 = fmul float %360, %364
  %366 = fneg float %365
  %367 = tail call float @llvm.fma.f32(float %364, float %360, float %366)
  %368 = tail call float @llvm.fma.f32(float %364, float %362, float %367)
  %369 = fadd float %365, %368
  %370 = fsub float %369, %365
  %371 = fsub float %368, %370
  %372 = fsub float %359, %369
  %373 = fsub float %359, %372
  %374 = fsub float %373, %369
  %375 = fsub float %374, %371
  %376 = fadd float %372, %375
  %377 = fmul float %363, %376
  %378 = fadd float %364, %377
  %379 = fsub float %378, %364
  %380 = fsub float %377, %379
  %381 = fmul float %378, %378
  %382 = fneg float %381
  %383 = tail call float @llvm.fma.f32(float %378, float %378, float %382)
  %384 = fmul float %380, 2.000000e+00
  %385 = tail call float @llvm.fma.f32(float %378, float %384, float %383)
  %386 = fadd float %381, %385
  %387 = fsub float %386, %381
  %388 = fsub float %385, %387
  %389 = tail call float @llvm.fmuladd.f32(float %386, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %390 = tail call float @llvm.fmuladd.f32(float %386, float %389, float 0x3FD999BDE0000000)
  %391 = sitofp i32 %358 to float
  %392 = fmul float %391, 0x3FE62E4300000000
  %393 = fneg float %392
  %394 = tail call float @llvm.fma.f32(float %391, float 0x3FE62E4300000000, float %393)
  %395 = tail call float @llvm.fma.f32(float %391, float 0xBE205C6100000000, float %394)
  %396 = fadd float %392, %395
  %397 = fsub float %396, %392
  %398 = fsub float %395, %397
  %399 = tail call float @llvm.amdgcn.ldexp.f32(float %378, i32 1)
  %400 = fmul float %378, %386
  %401 = fneg float %400
  %402 = tail call float @llvm.fma.f32(float %386, float %378, float %401)
  %403 = tail call float @llvm.fma.f32(float %386, float %380, float %402)
  %404 = tail call float @llvm.fma.f32(float %388, float %378, float %403)
  %405 = fadd float %400, %404
  %406 = fsub float %405, %400
  %407 = fsub float %404, %406
  %408 = fmul float %386, %390
  %409 = fneg float %408
  %410 = tail call float @llvm.fma.f32(float %386, float %390, float %409)
  %411 = tail call float @llvm.fma.f32(float %388, float %390, float %410)
  %412 = fadd float %408, %411
  %413 = fsub float %412, %408
  %414 = fsub float %411, %413
  %415 = fadd float %412, 0x3FE5555540000000
  %416 = fadd float %415, 0xBFE5555540000000
  %417 = fsub float %412, %416
  %418 = fadd float %414, 0x3E2E720200000000
  %419 = fadd float %418, %417
  %420 = fadd float %415, %419
  %421 = fsub float %420, %415
  %422 = fsub float %419, %421
  %423 = fmul float %405, %420
  %424 = fneg float %423
  %425 = tail call float @llvm.fma.f32(float %405, float %420, float %424)
  %426 = tail call float @llvm.fma.f32(float %405, float %422, float %425)
  %427 = tail call float @llvm.fma.f32(float %407, float %420, float %426)
  %428 = tail call float @llvm.amdgcn.ldexp.f32(float %380, i32 1)
  %429 = fadd float %423, %427
  %430 = fsub float %429, %423
  %431 = fsub float %427, %430
  %432 = fadd float %399, %429
  %433 = fsub float %432, %399
  %434 = fsub float %429, %433
  %435 = fadd float %428, %431
  %436 = fadd float %435, %434
  %437 = fadd float %432, %436
  %438 = fsub float %437, %432
  %439 = fsub float %436, %438
  %440 = fadd float %396, %437
  %441 = fsub float %440, %396
  %442 = fsub float %440, %441
  %443 = fsub float %396, %442
  %444 = fsub float %437, %441
  %445 = fadd float %444, %443
  %446 = fadd float %398, %439
  %447 = fsub float %446, %398
  %448 = fsub float %446, %447
  %449 = fsub float %398, %448
  %450 = fsub float %439, %447
  %451 = fadd float %450, %449
  %452 = fadd float %446, %445
  %453 = fadd float %440, %452
  %454 = fsub float %453, %440
  %455 = fsub float %452, %454
  %456 = fadd float %451, %455
  %457 = fadd float %453, %456
  %458 = fsub float %457, %453
  %459 = fsub float %456, %458
  %460 = fmul float %457, 2.000000e+00
  %461 = fneg float %460
  %462 = tail call float @llvm.fma.f32(float %457, float 2.000000e+00, float %461)
  %463 = tail call float @llvm.fma.f32(float %459, float 2.000000e+00, float %462)
  %464 = fadd float %460, %463
  %465 = fsub float %464, %460
  %466 = fsub float %463, %465
  %467 = tail call float @llvm.fabs.f32(float %460) #3
  %468 = fcmp oeq float %467, 0x7FF0000000000000
  %469 = select i1 %468, float %460, float %464
  %470 = tail call float @llvm.fabs.f32(float %469) #3
  %471 = fcmp oeq float %470, 0x7FF0000000000000
  %472 = select i1 %471, float 0.000000e+00, float %466
  %473 = fcmp oeq float %469, 0x40562E4300000000
  %474 = select i1 %473, float 0x3EE0000000000000, float 0.000000e+00
  %475 = fsub float %469, %474
  %476 = fadd float %474, %472
  %477 = fmul float %475, 0x3FF7154760000000
  %478 = tail call float @llvm.rint.f32(float %477)
  %479 = fcmp ogt float %475, 0x40562E4300000000
  %480 = fcmp olt float %475, 0xC059D1DA00000000
  %481 = fneg float %477
  %482 = tail call float @llvm.fma.f32(float %475, float 0x3FF7154760000000, float %481)
  %483 = tail call float @llvm.fma.f32(float %475, float 0x3E54AE0BE0000000, float %482)
  %484 = fsub float %477, %478
  %485 = fadd float %483, %484
  %486 = tail call float @llvm.exp2.f32(float %485)
  %487 = fptosi float %478 to i32
  %488 = tail call float @llvm.amdgcn.ldexp.f32(float %486, i32 %487)
  %489 = select i1 %480, float 0.000000e+00, float %488
  %490 = select i1 %479, float 0x7FF0000000000000, float %489
  %491 = tail call float @llvm.fma.f32(float %490, float %476, float %490)
  %492 = tail call float @llvm.fabs.f32(float %490) #3
  %493 = fcmp oeq float %492, 0x7FF0000000000000
  %494 = select i1 %493, float %490, float %491
  %495 = tail call float @llvm.fabs.f32(float %494)
  %496 = fcmp oeq float %352, 0x7FF0000000000000
  %497 = fcmp oeq float %46, 0.000000e+00
  %498 = select i1 %496, float 0x7FF0000000000000, float %495
  %499 = select i1 %497, float 0.000000e+00, float %498
  %500 = fcmp uno float %46, 0.000000e+00
  %501 = select i1 %500, float 0x7FF8000000000000, float %499
  %502 = fcmp oeq float %46, 1.000000e+00
  %503 = select i1 %502, float 1.000000e+00, float %501
  %504 = fadd contract float %351, %503
  %505 = fcmp olt float %504, 0x39F0000000000000
  %506 = select i1 %505, float 0x41F0000000000000, float 1.000000e+00
  %507 = fmul float %504, %506
  %508 = tail call float @llvm.sqrt.f32(float %507)
  %509 = bitcast float %508 to i32
  %510 = add nsw i32 %509, -1
  %511 = bitcast i32 %510 to float
  %512 = add nsw i32 %509, 1
  %513 = bitcast i32 %512 to float
  %514 = tail call i1 @llvm.amdgcn.class.f32(float %507, i32 608)
  %515 = select i1 %505, float 0x3EF0000000000000, float 1.000000e+00
  %516 = fneg float %513
  %517 = tail call float @llvm.fma.f32(float %516, float %508, float %507)
  %518 = fcmp ogt float %517, 0.000000e+00
  %519 = fneg float %511
  %520 = tail call float @llvm.fma.f32(float %519, float %508, float %507)
  %521 = fcmp ole float %520, 0.000000e+00
  %522 = select i1 %521, float %511, float %508
  %523 = select i1 %518, float %513, float %522
  %524 = fmul float %515, %523
  %525 = select i1 %514, float %507, float %524
  %526 = zext i32 %34 to i64
  %527 = getelementptr inbounds float, float addrspace(1)* %1, i64 %526
  store float %525, float addrspace(1)* %527, align 4, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
