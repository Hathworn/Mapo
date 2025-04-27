; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/15353/8/useSingleTexture.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/15353/8/useSingleTexture.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }
%struct.__hip_texture = type opaque

@c_size = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_size to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16useSingleTextureP13__hip_texturePf(%struct.__hip_texture addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %21 = getelementptr i8, i8 addrspace(4)* %4, i64 8
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %27 = add i32 %25, %26
  %28 = uitofp i32 %11 to double
  %29 = fadd contract double %28, 5.000000e-01
  %30 = fptrunc double %29 to float
  %31 = uitofp i32 %19 to double
  %32 = fadd contract double %31, 5.000000e-01
  %33 = fptrunc double %32 to float
  %34 = uitofp i32 %27 to double
  %35 = fadd contract double %34, 5.000000e-01
  %36 = fptrunc double %35 to float
  %37 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %38 = addrspacecast i32 addrspace(1)* %37 to i32 addrspace(4)*
  %39 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 12
  %40 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 10
  %41 = load i32, i32 addrspace(4)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = uitofp i32 %41 to float
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 2
  %44 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = lshr i32 %44, 14
  %46 = and i32 %45, 16383
  %47 = add nuw nsw i32 %46, 1
  %48 = uitofp i32 %47 to float
  %49 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 4
  %50 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = and i32 %50, 8191
  %52 = add nuw nsw i32 %51, 1
  %53 = uitofp i32 %52 to float
  %54 = load i32, i32 addrspace(4)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = and i32 %54, 32768
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, float %42, float 1.000000e+00
  %58 = select i1 %56, float %48, float 1.000000e+00
  %59 = select i1 %56, float %53, float 1.000000e+00
  %60 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 14
  %61 = load i32, i32 addrspace(4)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = and i32 %61, 1048576
  %63 = icmp eq i32 %62, 0
  %64 = bitcast i32 addrspace(4)* %39 to <4 x i32> addrspace(4)*
  %65 = load <4 x i32>, <4 x i32> addrspace(4)* %64, align 16, !tbaa !11, !amdgpu.noclobber !5
  %66 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %67 = addrspacecast <8 x i32> addrspace(1)* %66 to <8 x i32> addrspace(4)*
  %68 = load <8 x i32>, <8 x i32> addrspace(4)* %67, align 32, !tbaa !11, !amdgpu.noclobber !5
  %69 = tail call float @llvm.amdgcn.rcp.f32(float %59)
  %70 = fmul float %59, %36
  %71 = tail call float @llvm.floor.f32(float %70)
  %72 = fmul float %69, %71
  %73 = select i1 %63, float %72, float %36
  %74 = tail call float @llvm.amdgcn.rcp.f32(float %58)
  %75 = fmul float %58, %33
  %76 = tail call float @llvm.floor.f32(float %75)
  %77 = fmul float %74, %76
  %78 = select i1 %63, float %77, float %33
  %79 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %80 = fmul float %57, %30
  %81 = tail call float @llvm.floor.f32(float %80)
  %82 = fmul float %79, %81
  %83 = select i1 %63, float %82, float %30
  %84 = tail call <3 x float> @llvm.amdgcn.image.sample.lz.3d.v3f32.f32(i32 7, float %83, float %78, float %73, <8 x i32> %68, <4 x i32> %65, i1 false, i32 0, i32 0)
  %85 = extractelement <3 x float> %84, i64 0
  %86 = tail call float @llvm.fabs.f32(float %85)
  %87 = tail call float @llvm.amdgcn.frexp.mant.f32(float %86)
  %88 = fcmp olt float %87, 0x3FE5555560000000
  %89 = zext i1 %88 to i32
  %90 = tail call float @llvm.amdgcn.ldexp.f32(float %87, i32 %89)
  %91 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %86)
  %92 = sub nsw i32 %91, %89
  %93 = fadd float %90, -1.000000e+00
  %94 = fadd float %90, 1.000000e+00
  %95 = fadd float %94, -1.000000e+00
  %96 = fsub float %90, %95
  %97 = tail call float @llvm.amdgcn.rcp.f32(float %94)
  %98 = fmul float %93, %97
  %99 = fmul float %94, %98
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %98, float %94, float %100)
  %102 = tail call float @llvm.fma.f32(float %98, float %96, float %101)
  %103 = fadd float %99, %102
  %104 = fsub float %103, %99
  %105 = fsub float %102, %104
  %106 = fsub float %93, %103
  %107 = fsub float %93, %106
  %108 = fsub float %107, %103
  %109 = fsub float %108, %105
  %110 = fadd float %106, %109
  %111 = fmul float %97, %110
  %112 = fadd float %98, %111
  %113 = fsub float %112, %98
  %114 = fsub float %111, %113
  %115 = fmul float %112, %112
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %112, float %112, float %116)
  %118 = fmul float %114, 2.000000e+00
  %119 = tail call float @llvm.fma.f32(float %112, float %118, float %117)
  %120 = fadd float %115, %119
  %121 = fsub float %120, %115
  %122 = fsub float %119, %121
  %123 = tail call float @llvm.fmuladd.f32(float %120, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %124 = tail call float @llvm.fmuladd.f32(float %120, float %123, float 0x3FD999BDE0000000)
  %125 = sitofp i32 %92 to float
  %126 = fmul float %125, 0x3FE62E4300000000
  %127 = fneg float %126
  %128 = tail call float @llvm.fma.f32(float %125, float 0x3FE62E4300000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %125, float 0xBE205C6100000000, float %128)
  %130 = fadd float %126, %129
  %131 = fsub float %130, %126
  %132 = fsub float %129, %131
  %133 = tail call float @llvm.amdgcn.ldexp.f32(float %112, i32 1)
  %134 = fmul float %112, %120
  %135 = fneg float %134
  %136 = tail call float @llvm.fma.f32(float %120, float %112, float %135)
  %137 = tail call float @llvm.fma.f32(float %120, float %114, float %136)
  %138 = tail call float @llvm.fma.f32(float %122, float %112, float %137)
  %139 = fadd float %134, %138
  %140 = fsub float %139, %134
  %141 = fsub float %138, %140
  %142 = fmul float %120, %124
  %143 = fneg float %142
  %144 = tail call float @llvm.fma.f32(float %120, float %124, float %143)
  %145 = tail call float @llvm.fma.f32(float %122, float %124, float %144)
  %146 = fadd float %142, %145
  %147 = fsub float %146, %142
  %148 = fsub float %145, %147
  %149 = fadd float %146, 0x3FE5555540000000
  %150 = fadd float %149, 0xBFE5555540000000
  %151 = fsub float %146, %150
  %152 = fadd float %148, 0x3E2E720200000000
  %153 = fadd float %152, %151
  %154 = fadd float %149, %153
  %155 = fsub float %154, %149
  %156 = fsub float %153, %155
  %157 = fmul float %139, %154
  %158 = fneg float %157
  %159 = tail call float @llvm.fma.f32(float %139, float %154, float %158)
  %160 = tail call float @llvm.fma.f32(float %139, float %156, float %159)
  %161 = tail call float @llvm.fma.f32(float %141, float %154, float %160)
  %162 = tail call float @llvm.amdgcn.ldexp.f32(float %114, i32 1)
  %163 = fadd float %157, %161
  %164 = fsub float %163, %157
  %165 = fsub float %161, %164
  %166 = fadd float %133, %163
  %167 = fsub float %166, %133
  %168 = fsub float %163, %167
  %169 = fadd float %162, %165
  %170 = fadd float %169, %168
  %171 = fadd float %166, %170
  %172 = fsub float %171, %166
  %173 = fsub float %170, %172
  %174 = fadd float %130, %171
  %175 = fsub float %174, %130
  %176 = fsub float %174, %175
  %177 = fsub float %130, %176
  %178 = fsub float %171, %175
  %179 = fadd float %178, %177
  %180 = fadd float %132, %173
  %181 = fsub float %180, %132
  %182 = fsub float %180, %181
  %183 = fsub float %132, %182
  %184 = fsub float %173, %181
  %185 = fadd float %184, %183
  %186 = fadd float %180, %179
  %187 = fadd float %174, %186
  %188 = fsub float %187, %174
  %189 = fsub float %186, %188
  %190 = fadd float %185, %189
  %191 = fadd float %187, %190
  %192 = fsub float %191, %187
  %193 = fsub float %190, %192
  %194 = fmul float %191, 2.000000e+00
  %195 = fneg float %194
  %196 = tail call float @llvm.fma.f32(float %191, float 2.000000e+00, float %195)
  %197 = tail call float @llvm.fma.f32(float %193, float 2.000000e+00, float %196)
  %198 = fadd float %194, %197
  %199 = fsub float %198, %194
  %200 = fsub float %197, %199
  %201 = tail call float @llvm.fabs.f32(float %194) #4
  %202 = fcmp oeq float %201, 0x7FF0000000000000
  %203 = select i1 %202, float %194, float %198
  %204 = tail call float @llvm.fabs.f32(float %203) #4
  %205 = fcmp oeq float %204, 0x7FF0000000000000
  %206 = select i1 %205, float 0.000000e+00, float %200
  %207 = fcmp oeq float %203, 0x40562E4300000000
  %208 = select i1 %207, float 0x3EE0000000000000, float 0.000000e+00
  %209 = fsub float %203, %208
  %210 = fadd float %208, %206
  %211 = fmul float %209, 0x3FF7154760000000
  %212 = tail call float @llvm.rint.f32(float %211)
  %213 = fcmp ogt float %209, 0x40562E4300000000
  %214 = fcmp olt float %209, 0xC059D1DA00000000
  %215 = fneg float %211
  %216 = tail call float @llvm.fma.f32(float %209, float 0x3FF7154760000000, float %215)
  %217 = tail call float @llvm.fma.f32(float %209, float 0x3E54AE0BE0000000, float %216)
  %218 = fsub float %211, %212
  %219 = fadd float %217, %218
  %220 = tail call float @llvm.exp2.f32(float %219)
  %221 = fptosi float %212 to i32
  %222 = tail call float @llvm.amdgcn.ldexp.f32(float %220, i32 %221)
  %223 = select i1 %214, float 0.000000e+00, float %222
  %224 = select i1 %213, float 0x7FF0000000000000, float %223
  %225 = tail call float @llvm.fma.f32(float %224, float %210, float %224)
  %226 = tail call float @llvm.fabs.f32(float %224) #4
  %227 = fcmp oeq float %226, 0x7FF0000000000000
  %228 = select i1 %227, float %224, float %225
  %229 = tail call float @llvm.fabs.f32(float %228)
  %230 = fcmp oeq float %86, 0x7FF0000000000000
  %231 = fcmp oeq float %85, 0.000000e+00
  %232 = select i1 %230, float 0x7FF0000000000000, float %229
  %233 = select i1 %231, float 0.000000e+00, float %232
  %234 = fcmp uno float %85, 0.000000e+00
  %235 = select i1 %234, float 0x7FF8000000000000, float %233
  %236 = fcmp oeq float %85, 1.000000e+00
  %237 = select i1 %236, float 1.000000e+00, float %235
  %238 = extractelement <3 x float> %84, i64 1
  %239 = tail call float @llvm.fabs.f32(float %238)
  %240 = tail call float @llvm.amdgcn.frexp.mant.f32(float %239)
  %241 = fcmp olt float %240, 0x3FE5555560000000
  %242 = zext i1 %241 to i32
  %243 = tail call float @llvm.amdgcn.ldexp.f32(float %240, i32 %242)
  %244 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %239)
  %245 = sub nsw i32 %244, %242
  %246 = fadd float %243, -1.000000e+00
  %247 = fadd float %243, 1.000000e+00
  %248 = fadd float %247, -1.000000e+00
  %249 = fsub float %243, %248
  %250 = tail call float @llvm.amdgcn.rcp.f32(float %247)
  %251 = fmul float %246, %250
  %252 = fmul float %247, %251
  %253 = fneg float %252
  %254 = tail call float @llvm.fma.f32(float %251, float %247, float %253)
  %255 = tail call float @llvm.fma.f32(float %251, float %249, float %254)
  %256 = fadd float %252, %255
  %257 = fsub float %256, %252
  %258 = fsub float %255, %257
  %259 = fsub float %246, %256
  %260 = fsub float %246, %259
  %261 = fsub float %260, %256
  %262 = fsub float %261, %258
  %263 = fadd float %259, %262
  %264 = fmul float %250, %263
  %265 = fadd float %251, %264
  %266 = fsub float %265, %251
  %267 = fsub float %264, %266
  %268 = fmul float %265, %265
  %269 = fneg float %268
  %270 = tail call float @llvm.fma.f32(float %265, float %265, float %269)
  %271 = fmul float %267, 2.000000e+00
  %272 = tail call float @llvm.fma.f32(float %265, float %271, float %270)
  %273 = fadd float %268, %272
  %274 = fsub float %273, %268
  %275 = fsub float %272, %274
  %276 = tail call float @llvm.fmuladd.f32(float %273, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %277 = tail call float @llvm.fmuladd.f32(float %273, float %276, float 0x3FD999BDE0000000)
  %278 = sitofp i32 %245 to float
  %279 = fmul float %278, 0x3FE62E4300000000
  %280 = fneg float %279
  %281 = tail call float @llvm.fma.f32(float %278, float 0x3FE62E4300000000, float %280)
  %282 = tail call float @llvm.fma.f32(float %278, float 0xBE205C6100000000, float %281)
  %283 = fadd float %279, %282
  %284 = fsub float %283, %279
  %285 = fsub float %282, %284
  %286 = tail call float @llvm.amdgcn.ldexp.f32(float %265, i32 1)
  %287 = fmul float %265, %273
  %288 = fneg float %287
  %289 = tail call float @llvm.fma.f32(float %273, float %265, float %288)
  %290 = tail call float @llvm.fma.f32(float %273, float %267, float %289)
  %291 = tail call float @llvm.fma.f32(float %275, float %265, float %290)
  %292 = fadd float %287, %291
  %293 = fsub float %292, %287
  %294 = fsub float %291, %293
  %295 = fmul float %273, %277
  %296 = fneg float %295
  %297 = tail call float @llvm.fma.f32(float %273, float %277, float %296)
  %298 = tail call float @llvm.fma.f32(float %275, float %277, float %297)
  %299 = fadd float %295, %298
  %300 = fsub float %299, %295
  %301 = fsub float %298, %300
  %302 = fadd float %299, 0x3FE5555540000000
  %303 = fadd float %302, 0xBFE5555540000000
  %304 = fsub float %299, %303
  %305 = fadd float %301, 0x3E2E720200000000
  %306 = fadd float %305, %304
  %307 = fadd float %302, %306
  %308 = fsub float %307, %302
  %309 = fsub float %306, %308
  %310 = fmul float %292, %307
  %311 = fneg float %310
  %312 = tail call float @llvm.fma.f32(float %292, float %307, float %311)
  %313 = tail call float @llvm.fma.f32(float %292, float %309, float %312)
  %314 = tail call float @llvm.fma.f32(float %294, float %307, float %313)
  %315 = tail call float @llvm.amdgcn.ldexp.f32(float %267, i32 1)
  %316 = fadd float %310, %314
  %317 = fsub float %316, %310
  %318 = fsub float %314, %317
  %319 = fadd float %286, %316
  %320 = fsub float %319, %286
  %321 = fsub float %316, %320
  %322 = fadd float %315, %318
  %323 = fadd float %322, %321
  %324 = fadd float %319, %323
  %325 = fsub float %324, %319
  %326 = fsub float %323, %325
  %327 = fadd float %283, %324
  %328 = fsub float %327, %283
  %329 = fsub float %327, %328
  %330 = fsub float %283, %329
  %331 = fsub float %324, %328
  %332 = fadd float %331, %330
  %333 = fadd float %285, %326
  %334 = fsub float %333, %285
  %335 = fsub float %333, %334
  %336 = fsub float %285, %335
  %337 = fsub float %326, %334
  %338 = fadd float %337, %336
  %339 = fadd float %333, %332
  %340 = fadd float %327, %339
  %341 = fsub float %340, %327
  %342 = fsub float %339, %341
  %343 = fadd float %338, %342
  %344 = fadd float %340, %343
  %345 = fsub float %344, %340
  %346 = fsub float %343, %345
  %347 = fmul float %344, 2.000000e+00
  %348 = fneg float %347
  %349 = tail call float @llvm.fma.f32(float %344, float 2.000000e+00, float %348)
  %350 = tail call float @llvm.fma.f32(float %346, float 2.000000e+00, float %349)
  %351 = fadd float %347, %350
  %352 = fsub float %351, %347
  %353 = fsub float %350, %352
  %354 = tail call float @llvm.fabs.f32(float %347) #4
  %355 = fcmp oeq float %354, 0x7FF0000000000000
  %356 = select i1 %355, float %347, float %351
  %357 = tail call float @llvm.fabs.f32(float %356) #4
  %358 = fcmp oeq float %357, 0x7FF0000000000000
  %359 = select i1 %358, float 0.000000e+00, float %353
  %360 = fcmp oeq float %356, 0x40562E4300000000
  %361 = select i1 %360, float 0x3EE0000000000000, float 0.000000e+00
  %362 = fsub float %356, %361
  %363 = fadd float %361, %359
  %364 = fmul float %362, 0x3FF7154760000000
  %365 = tail call float @llvm.rint.f32(float %364)
  %366 = fcmp ogt float %362, 0x40562E4300000000
  %367 = fcmp olt float %362, 0xC059D1DA00000000
  %368 = fneg float %364
  %369 = tail call float @llvm.fma.f32(float %362, float 0x3FF7154760000000, float %368)
  %370 = tail call float @llvm.fma.f32(float %362, float 0x3E54AE0BE0000000, float %369)
  %371 = fsub float %364, %365
  %372 = fadd float %370, %371
  %373 = tail call float @llvm.exp2.f32(float %372)
  %374 = fptosi float %365 to i32
  %375 = tail call float @llvm.amdgcn.ldexp.f32(float %373, i32 %374)
  %376 = select i1 %367, float 0.000000e+00, float %375
  %377 = select i1 %366, float 0x7FF0000000000000, float %376
  %378 = tail call float @llvm.fma.f32(float %377, float %363, float %377)
  %379 = tail call float @llvm.fabs.f32(float %377) #4
  %380 = fcmp oeq float %379, 0x7FF0000000000000
  %381 = select i1 %380, float %377, float %378
  %382 = tail call float @llvm.fabs.f32(float %381)
  %383 = fcmp oeq float %239, 0x7FF0000000000000
  %384 = fcmp oeq float %238, 0.000000e+00
  %385 = select i1 %383, float 0x7FF0000000000000, float %382
  %386 = select i1 %384, float 0.000000e+00, float %385
  %387 = fcmp uno float %238, 0.000000e+00
  %388 = select i1 %387, float 0x7FF8000000000000, float %386
  %389 = fcmp oeq float %238, 1.000000e+00
  %390 = select i1 %389, float 1.000000e+00, float %388
  %391 = fadd contract float %237, %390
  %392 = extractelement <3 x float> %84, i64 2
  %393 = tail call float @llvm.fabs.f32(float %392)
  %394 = tail call float @llvm.amdgcn.frexp.mant.f32(float %393)
  %395 = fcmp olt float %394, 0x3FE5555560000000
  %396 = zext i1 %395 to i32
  %397 = tail call float @llvm.amdgcn.ldexp.f32(float %394, i32 %396)
  %398 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %393)
  %399 = sub nsw i32 %398, %396
  %400 = fadd float %397, -1.000000e+00
  %401 = fadd float %397, 1.000000e+00
  %402 = fadd float %401, -1.000000e+00
  %403 = fsub float %397, %402
  %404 = tail call float @llvm.amdgcn.rcp.f32(float %401)
  %405 = fmul float %400, %404
  %406 = fmul float %401, %405
  %407 = fneg float %406
  %408 = tail call float @llvm.fma.f32(float %405, float %401, float %407)
  %409 = tail call float @llvm.fma.f32(float %405, float %403, float %408)
  %410 = fadd float %406, %409
  %411 = fsub float %410, %406
  %412 = fsub float %409, %411
  %413 = fsub float %400, %410
  %414 = fsub float %400, %413
  %415 = fsub float %414, %410
  %416 = fsub float %415, %412
  %417 = fadd float %413, %416
  %418 = fmul float %404, %417
  %419 = fadd float %405, %418
  %420 = fsub float %419, %405
  %421 = fsub float %418, %420
  %422 = fmul float %419, %419
  %423 = fneg float %422
  %424 = tail call float @llvm.fma.f32(float %419, float %419, float %423)
  %425 = fmul float %421, 2.000000e+00
  %426 = tail call float @llvm.fma.f32(float %419, float %425, float %424)
  %427 = fadd float %422, %426
  %428 = fsub float %427, %422
  %429 = fsub float %426, %428
  %430 = tail call float @llvm.fmuladd.f32(float %427, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %431 = tail call float @llvm.fmuladd.f32(float %427, float %430, float 0x3FD999BDE0000000)
  %432 = sitofp i32 %399 to float
  %433 = fmul float %432, 0x3FE62E4300000000
  %434 = fneg float %433
  %435 = tail call float @llvm.fma.f32(float %432, float 0x3FE62E4300000000, float %434)
  %436 = tail call float @llvm.fma.f32(float %432, float 0xBE205C6100000000, float %435)
  %437 = fadd float %433, %436
  %438 = fsub float %437, %433
  %439 = fsub float %436, %438
  %440 = tail call float @llvm.amdgcn.ldexp.f32(float %419, i32 1)
  %441 = fmul float %419, %427
  %442 = fneg float %441
  %443 = tail call float @llvm.fma.f32(float %427, float %419, float %442)
  %444 = tail call float @llvm.fma.f32(float %427, float %421, float %443)
  %445 = tail call float @llvm.fma.f32(float %429, float %419, float %444)
  %446 = fadd float %441, %445
  %447 = fsub float %446, %441
  %448 = fsub float %445, %447
  %449 = fmul float %427, %431
  %450 = fneg float %449
  %451 = tail call float @llvm.fma.f32(float %427, float %431, float %450)
  %452 = tail call float @llvm.fma.f32(float %429, float %431, float %451)
  %453 = fadd float %449, %452
  %454 = fsub float %453, %449
  %455 = fsub float %452, %454
  %456 = fadd float %453, 0x3FE5555540000000
  %457 = fadd float %456, 0xBFE5555540000000
  %458 = fsub float %453, %457
  %459 = fadd float %455, 0x3E2E720200000000
  %460 = fadd float %459, %458
  %461 = fadd float %456, %460
  %462 = fsub float %461, %456
  %463 = fsub float %460, %462
  %464 = fmul float %446, %461
  %465 = fneg float %464
  %466 = tail call float @llvm.fma.f32(float %446, float %461, float %465)
  %467 = tail call float @llvm.fma.f32(float %446, float %463, float %466)
  %468 = tail call float @llvm.fma.f32(float %448, float %461, float %467)
  %469 = tail call float @llvm.amdgcn.ldexp.f32(float %421, i32 1)
  %470 = fadd float %464, %468
  %471 = fsub float %470, %464
  %472 = fsub float %468, %471
  %473 = fadd float %440, %470
  %474 = fsub float %473, %440
  %475 = fsub float %470, %474
  %476 = fadd float %469, %472
  %477 = fadd float %476, %475
  %478 = fadd float %473, %477
  %479 = fsub float %478, %473
  %480 = fsub float %477, %479
  %481 = fadd float %437, %478
  %482 = fsub float %481, %437
  %483 = fsub float %481, %482
  %484 = fsub float %437, %483
  %485 = fsub float %478, %482
  %486 = fadd float %485, %484
  %487 = fadd float %439, %480
  %488 = fsub float %487, %439
  %489 = fsub float %487, %488
  %490 = fsub float %439, %489
  %491 = fsub float %480, %488
  %492 = fadd float %491, %490
  %493 = fadd float %487, %486
  %494 = fadd float %481, %493
  %495 = fsub float %494, %481
  %496 = fsub float %493, %495
  %497 = fadd float %492, %496
  %498 = fadd float %494, %497
  %499 = fsub float %498, %494
  %500 = fsub float %497, %499
  %501 = fmul float %498, 2.000000e+00
  %502 = fneg float %501
  %503 = tail call float @llvm.fma.f32(float %498, float 2.000000e+00, float %502)
  %504 = tail call float @llvm.fma.f32(float %500, float 2.000000e+00, float %503)
  %505 = fadd float %501, %504
  %506 = fsub float %505, %501
  %507 = fsub float %504, %506
  %508 = tail call float @llvm.fabs.f32(float %501) #4
  %509 = fcmp oeq float %508, 0x7FF0000000000000
  %510 = select i1 %509, float %501, float %505
  %511 = tail call float @llvm.fabs.f32(float %510) #4
  %512 = fcmp oeq float %511, 0x7FF0000000000000
  %513 = select i1 %512, float 0.000000e+00, float %507
  %514 = fcmp oeq float %510, 0x40562E4300000000
  %515 = select i1 %514, float 0x3EE0000000000000, float 0.000000e+00
  %516 = fsub float %510, %515
  %517 = fadd float %515, %513
  %518 = fmul float %516, 0x3FF7154760000000
  %519 = tail call float @llvm.rint.f32(float %518)
  %520 = fcmp ogt float %516, 0x40562E4300000000
  %521 = fcmp olt float %516, 0xC059D1DA00000000
  %522 = fneg float %518
  %523 = tail call float @llvm.fma.f32(float %516, float 0x3FF7154760000000, float %522)
  %524 = tail call float @llvm.fma.f32(float %516, float 0x3E54AE0BE0000000, float %523)
  %525 = fsub float %518, %519
  %526 = fadd float %524, %525
  %527 = tail call float @llvm.exp2.f32(float %526)
  %528 = fptosi float %519 to i32
  %529 = tail call float @llvm.amdgcn.ldexp.f32(float %527, i32 %528)
  %530 = select i1 %521, float 0.000000e+00, float %529
  %531 = select i1 %520, float 0x7FF0000000000000, float %530
  %532 = tail call float @llvm.fma.f32(float %531, float %517, float %531)
  %533 = tail call float @llvm.fabs.f32(float %531) #4
  %534 = fcmp oeq float %533, 0x7FF0000000000000
  %535 = select i1 %534, float %531, float %532
  %536 = tail call float @llvm.fabs.f32(float %535)
  %537 = fcmp oeq float %393, 0x7FF0000000000000
  %538 = fcmp oeq float %392, 0.000000e+00
  %539 = select i1 %537, float 0x7FF0000000000000, float %536
  %540 = select i1 %538, float 0.000000e+00, float %539
  %541 = fcmp uno float %392, 0.000000e+00
  %542 = select i1 %541, float 0x7FF8000000000000, float %540
  %543 = fcmp oeq float %392, 1.000000e+00
  %544 = select i1 %543, float 1.000000e+00, float %542
  %545 = fadd contract float %544, %391
  %546 = fcmp olt float %545, 0x39F0000000000000
  %547 = select i1 %546, float 0x41F0000000000000, float 1.000000e+00
  %548 = fmul float %545, %547
  %549 = tail call float @llvm.sqrt.f32(float %548)
  %550 = bitcast float %549 to i32
  %551 = add nsw i32 %550, -1
  %552 = bitcast i32 %551 to float
  %553 = add nsw i32 %550, 1
  %554 = bitcast i32 %553 to float
  %555 = tail call i1 @llvm.amdgcn.class.f32(float %548, i32 608)
  %556 = select i1 %546, float 0x3EF0000000000000, float 1.000000e+00
  %557 = fneg float %554
  %558 = tail call float @llvm.fma.f32(float %557, float %549, float %548)
  %559 = fcmp ogt float %558, 0.000000e+00
  %560 = fneg float %552
  %561 = tail call float @llvm.fma.f32(float %560, float %549, float %548)
  %562 = fcmp ole float %561, 0.000000e+00
  %563 = select i1 %562, float %552, float %549
  %564 = select i1 %559, float %554, float %563
  %565 = fmul float %556, %564
  %566 = select i1 %555, float %548, float %565
  %567 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !12
  %568 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !12
  %569 = mul i32 %568, %27
  %570 = add i32 %569, %19
  %571 = mul i32 %570, %567
  %572 = add i32 %571, %11
  %573 = zext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %1, i64 %573
  store float %566, float addrspace(1)* %574, align 4, !tbaa !15
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: nounwind readonly willreturn
declare <3 x float> @llvm.amdgcn.image.sample.lz.3d.v3f32.f32(i32 immarg, float, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }
attributes #4 = { readnone }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !13, i64 0}
