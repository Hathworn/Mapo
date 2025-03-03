; ModuleID = '../data/hip_kernels/16802/8/main.cu'
source_filename = "../data/hip_kernels/16802/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@CFL = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@cs_square = protected addrspace(4) externally_initialized global double 0x40AA0AAAAAAAAAAA, align 8
@K = protected addrspace(4) externally_initialized global double 2.500000e-05, align 8
@w0 = protected addrspace(4) externally_initialized global double 0x3FD2F684BDA12F68, align 8
@ws = protected addrspace(4) externally_initialized global double 0x3FB2F684BDA12F68, align 8
@wa = protected addrspace(4) externally_initialized global double 0x3F92F684BDA12F68, align 8
@wd = protected addrspace(4) externally_initialized global double 0x3F72F684BDA12F68, align 8
@llvm.compiler.used = appending addrspace(1) global [7 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @CFL to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @K to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @cs_square to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @w0 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @wa to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @wd to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @ws to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20gpu_init_equilibriumPdS_S_S_S_S_S_S_S_S_S_S_S_S_S_(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = shl i32 %17, 3
  %28 = add i32 %27, %16
  %29 = mul i32 %28, 200
  %30 = add i32 %26, %29
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %6, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7, !amdgpu.noclobber !5
  %34 = getelementptr inbounds double, double addrspace(1)* %8, i64 %31
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds double, double addrspace(1)* %9, i64 %31
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !5
  %38 = getelementptr inbounds double, double addrspace(1)* %10, i64 %31
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds double, double addrspace(1)* %7, i64 %31
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = getelementptr inbounds double, double addrspace(1)* %11, i64 %31
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !5
  %44 = getelementptr inbounds double, double addrspace(1)* %12, i64 %31
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !5
  %46 = getelementptr inbounds double, double addrspace(1)* %13, i64 %31
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds double, double addrspace(1)* %14, i64 %31
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7, !amdgpu.noclobber !5
  %50 = load double, double addrspace(4)* @w0, align 8, !tbaa !7
  %51 = fmul contract double %33, %50
  %52 = load double, double addrspace(4)* @ws, align 8, !tbaa !7
  %53 = fmul contract double %33, %52
  %54 = load double, double addrspace(4)* @wa, align 8, !tbaa !7
  %55 = fmul contract double %33, %54
  %56 = load double, double addrspace(4)* @wd, align 8, !tbaa !7
  %57 = fmul contract double %33, %56
  %58 = fmul contract double %41, %50
  %59 = fmul contract double %41, %52
  %60 = fmul contract double %41, %54
  %61 = fmul contract double %41, %56
  %62 = fmul contract double %49, %50
  %63 = fmul contract double %49, %52
  %64 = fmul contract double %49, %54
  %65 = fmul contract double %49, %56
  %66 = fmul contract double %35, %35
  %67 = fmul contract double %37, %37
  %68 = fadd contract double %66, %67
  %69 = fmul contract double %39, %39
  %70 = fadd contract double %68, %69
  %71 = fmul contract double %70, 5.000000e-01
  %72 = load double, double addrspace(4)* @cs_square, align 8, !tbaa !7
  %73 = fdiv contract double %71, %72
  %74 = fsub contract double 1.000000e+00, %73
  %75 = load double, double addrspace(4)* @K, align 8, !tbaa !7
  %76 = fmul contract double %43, %75
  %77 = fadd contract double %35, %76
  %78 = fmul contract double %77, %77
  %79 = fmul contract double %45, %75
  %80 = fadd contract double %37, %79
  %81 = fmul contract double %80, %80
  %82 = fadd contract double %78, %81
  %83 = fmul contract double %47, %75
  %84 = fadd contract double %39, %83
  %85 = fmul contract double %84, %84
  %86 = fadd contract double %85, %82
  %87 = fmul contract double %86, 5.000000e-01
  %88 = fdiv contract double %87, %72
  %89 = fsub contract double 1.000000e+00, %88
  %90 = fdiv contract double %35, %72
  %91 = load double, double addrspace(4)* @CFL, align 8, !tbaa !7
  %92 = fdiv contract double %90, %91
  %93 = fdiv contract double %37, %72
  %94 = fdiv contract double %93, %91
  %95 = fdiv contract double %39, %72
  %96 = fdiv contract double %95, %91
  %97 = fdiv contract double %77, %72
  %98 = fdiv contract double %97, %91
  %99 = fdiv contract double %80, %72
  %100 = fdiv contract double %99, %91
  %101 = fdiv contract double %84, %72
  %102 = fdiv contract double %101, %91
  %103 = fmul contract double %51, %74
  %104 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  store double %103, double addrspace(1)* %104, align 8, !tbaa !7
  %105 = fmul contract double %58, %89
  %106 = getelementptr inbounds double, double addrspace(1)* %2, i64 %31
  store double %105, double addrspace(1)* %106, align 8, !tbaa !7
  %107 = fmul contract double %62, %74
  %108 = getelementptr inbounds double, double addrspace(1)* %4, i64 %31
  store double %107, double addrspace(1)* %108, align 8, !tbaa !7
  %109 = fmul contract double %92, 5.000000e-01
  %110 = fadd contract double %109, 1.000000e+00
  %111 = fmul contract double %92, %110
  %112 = fadd contract double %74, %111
  %113 = fmul contract double %53, %112
  %114 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  store double %113, double addrspace(1)* %114, align 8, !tbaa !7
  %115 = fneg contract double %92
  %116 = fsub contract double 1.000000e+00, %109
  %117 = fmul contract double %92, %116
  %118 = fsub contract double %74, %117
  %119 = fmul contract double %53, %118
  %120 = add i32 %16, 808
  %121 = add i32 %120, %27
  %122 = mul i32 %121, 200
  %123 = add i32 %26, %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %1, i64 %124
  store double %119, double addrspace(1)* %125, align 8, !tbaa !7
  %126 = fmul contract double %94, 5.000000e-01
  %127 = fadd contract double %126, 1.000000e+00
  %128 = fmul contract double %94, %127
  %129 = fadd contract double %74, %128
  %130 = fmul contract double %53, %129
  %131 = add i32 %16, 1616
  %132 = add i32 %131, %27
  %133 = mul i32 %132, 200
  %134 = add i32 %26, %133
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %1, i64 %135
  store double %130, double addrspace(1)* %136, align 8, !tbaa !7
  %137 = fneg contract double %94
  %138 = fsub contract double 1.000000e+00, %126
  %139 = fmul contract double %94, %138
  %140 = fsub contract double %74, %139
  %141 = fmul contract double %53, %140
  %142 = add i32 %16, 2424
  %143 = add i32 %142, %27
  %144 = mul i32 %143, 200
  %145 = add i32 %26, %144
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %1, i64 %146
  store double %141, double addrspace(1)* %147, align 8, !tbaa !7
  %148 = fmul contract double %96, 5.000000e-01
  %149 = fadd contract double %148, 1.000000e+00
  %150 = fmul contract double %96, %149
  %151 = fadd contract double %74, %150
  %152 = fmul contract double %53, %151
  %153 = add i32 %16, 3232
  %154 = add i32 %153, %27
  %155 = mul i32 %154, 200
  %156 = add i32 %26, %155
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %1, i64 %157
  store double %152, double addrspace(1)* %158, align 8, !tbaa !7
  %159 = fsub contract double 1.000000e+00, %148
  %160 = fmul contract double %96, %159
  %161 = fsub contract double %74, %160
  %162 = fmul contract double %53, %161
  %163 = add i32 %16, 4040
  %164 = add i32 %163, %27
  %165 = mul i32 %164, 200
  %166 = add i32 %26, %165
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds double, double addrspace(1)* %1, i64 %167
  store double %162, double addrspace(1)* %168, align 8, !tbaa !7
  %169 = fmul contract double %98, 5.000000e-01
  %170 = fadd contract double %169, 1.000000e+00
  %171 = fmul contract double %98, %170
  %172 = fadd contract double %171, %89
  %173 = fmul contract double %59, %172
  %174 = getelementptr inbounds double, double addrspace(1)* %3, i64 %31
  store double %173, double addrspace(1)* %174, align 8, !tbaa !7
  %175 = fneg contract double %98
  %176 = fsub contract double 1.000000e+00, %169
  %177 = fmul contract double %98, %176
  %178 = fsub contract double %89, %177
  %179 = fmul contract double %59, %178
  %180 = getelementptr inbounds double, double addrspace(1)* %3, i64 %124
  store double %179, double addrspace(1)* %180, align 8, !tbaa !7
  %181 = fmul contract double %100, 5.000000e-01
  %182 = fadd contract double %181, 1.000000e+00
  %183 = fmul contract double %100, %182
  %184 = fadd contract double %183, %89
  %185 = fmul contract double %59, %184
  %186 = getelementptr inbounds double, double addrspace(1)* %3, i64 %135
  store double %185, double addrspace(1)* %186, align 8, !tbaa !7
  %187 = fneg contract double %100
  %188 = fsub contract double 1.000000e+00, %181
  %189 = fmul contract double %100, %188
  %190 = fsub contract double %89, %189
  %191 = fmul contract double %59, %190
  %192 = getelementptr inbounds double, double addrspace(1)* %3, i64 %146
  store double %191, double addrspace(1)* %192, align 8, !tbaa !7
  %193 = fmul contract double %102, 5.000000e-01
  %194 = fadd contract double %193, 1.000000e+00
  %195 = fmul contract double %102, %194
  %196 = fadd contract double %195, %89
  %197 = fmul contract double %59, %196
  %198 = getelementptr inbounds double, double addrspace(1)* %3, i64 %157
  store double %197, double addrspace(1)* %198, align 8, !tbaa !7
  %199 = fsub contract double 1.000000e+00, %193
  %200 = fmul contract double %102, %199
  %201 = fsub contract double %89, %200
  %202 = fmul contract double %59, %201
  %203 = getelementptr inbounds double, double addrspace(1)* %3, i64 %167
  store double %202, double addrspace(1)* %203, align 8, !tbaa !7
  %204 = fmul contract double %63, %112
  %205 = getelementptr inbounds double, double addrspace(1)* %5, i64 %31
  store double %204, double addrspace(1)* %205, align 8, !tbaa !7
  %206 = fmul contract double %63, %118
  %207 = getelementptr inbounds double, double addrspace(1)* %5, i64 %124
  store double %206, double addrspace(1)* %207, align 8, !tbaa !7
  %208 = fmul contract double %63, %129
  %209 = getelementptr inbounds double, double addrspace(1)* %5, i64 %135
  store double %208, double addrspace(1)* %209, align 8, !tbaa !7
  %210 = fmul contract double %63, %140
  %211 = getelementptr inbounds double, double addrspace(1)* %5, i64 %146
  store double %210, double addrspace(1)* %211, align 8, !tbaa !7
  %212 = fmul contract double %63, %151
  %213 = getelementptr inbounds double, double addrspace(1)* %5, i64 %157
  store double %212, double addrspace(1)* %213, align 8, !tbaa !7
  %214 = fmul contract double %63, %161
  %215 = getelementptr inbounds double, double addrspace(1)* %5, i64 %167
  store double %214, double addrspace(1)* %215, align 8, !tbaa !7
  %216 = fadd contract double %92, %94
  %217 = fmul contract double %216, 5.000000e-01
  %218 = fadd contract double %217, 1.000000e+00
  %219 = fmul contract double %216, %218
  %220 = fadd contract double %74, %219
  %221 = fmul contract double %55, %220
  %222 = add i32 %16, 4848
  %223 = add i32 %222, %27
  %224 = mul i32 %223, 200
  %225 = add i32 %26, %224
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds double, double addrspace(1)* %1, i64 %226
  store double %221, double addrspace(1)* %227, align 8, !tbaa !7
  %228 = fsub contract double %137, %92
  %229 = fmul contract double %228, 5.000000e-01
  %230 = fadd contract double %229, 1.000000e+00
  %231 = fmul contract double %228, %230
  %232 = fadd contract double %74, %231
  %233 = fmul contract double %55, %232
  %234 = add i32 %16, 5656
  %235 = add i32 %234, %27
  %236 = mul i32 %235, 200
  %237 = add i32 %26, %236
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds double, double addrspace(1)* %1, i64 %238
  store double %233, double addrspace(1)* %239, align 8, !tbaa !7
  %240 = fadd contract double %92, %96
  %241 = fmul contract double %240, 5.000000e-01
  %242 = fadd contract double %241, 1.000000e+00
  %243 = fmul contract double %240, %242
  %244 = fadd contract double %74, %243
  %245 = fmul contract double %55, %244
  %246 = add i32 %16, 6464
  %247 = add i32 %246, %27
  %248 = mul i32 %247, 200
  %249 = add i32 %26, %248
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds double, double addrspace(1)* %1, i64 %250
  store double %245, double addrspace(1)* %251, align 8, !tbaa !7
  %252 = fsub contract double %115, %96
  %253 = fmul contract double %252, 5.000000e-01
  %254 = fadd contract double %253, 1.000000e+00
  %255 = fmul contract double %252, %254
  %256 = fadd contract double %74, %255
  %257 = fmul contract double %55, %256
  %258 = add i32 %16, 7272
  %259 = add i32 %258, %27
  %260 = mul i32 %259, 200
  %261 = add i32 %26, %260
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds double, double addrspace(1)* %1, i64 %262
  store double %257, double addrspace(1)* %263, align 8, !tbaa !7
  %264 = fadd contract double %96, %94
  %265 = fmul contract double %264, 5.000000e-01
  %266 = fadd contract double %265, 1.000000e+00
  %267 = fmul contract double %264, %266
  %268 = fadd contract double %74, %267
  %269 = fmul contract double %55, %268
  %270 = add i32 %16, 8080
  %271 = add i32 %270, %27
  %272 = mul i32 %271, 200
  %273 = add i32 %26, %272
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds double, double addrspace(1)* %1, i64 %274
  store double %269, double addrspace(1)* %275, align 8, !tbaa !7
  %276 = fsub contract double %137, %96
  %277 = fmul contract double %276, 5.000000e-01
  %278 = fadd contract double %277, 1.000000e+00
  %279 = fmul contract double %276, %278
  %280 = fadd contract double %74, %279
  %281 = fmul contract double %55, %280
  %282 = add i32 %16, 8888
  %283 = add i32 %282, %27
  %284 = mul i32 %283, 200
  %285 = add i32 %26, %284
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds double, double addrspace(1)* %1, i64 %286
  store double %281, double addrspace(1)* %287, align 8, !tbaa !7
  %288 = fsub contract double %92, %94
  %289 = fmul contract double %288, 5.000000e-01
  %290 = fadd contract double %289, 1.000000e+00
  %291 = fmul contract double %288, %290
  %292 = fadd contract double %74, %291
  %293 = fmul contract double %55, %292
  %294 = add i32 %16, 9696
  %295 = add i32 %294, %27
  %296 = mul i32 %295, 200
  %297 = add i32 %26, %296
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds double, double addrspace(1)* %1, i64 %298
  store double %293, double addrspace(1)* %299, align 8, !tbaa !7
  %300 = fsub contract double %94, %92
  %301 = fmul contract double %300, 5.000000e-01
  %302 = fadd contract double %301, 1.000000e+00
  %303 = fmul contract double %300, %302
  %304 = fadd contract double %74, %303
  %305 = fmul contract double %55, %304
  %306 = add i32 %16, 10504
  %307 = add i32 %306, %27
  %308 = mul i32 %307, 200
  %309 = add i32 %26, %308
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds double, double addrspace(1)* %1, i64 %310
  store double %305, double addrspace(1)* %311, align 8, !tbaa !7
  %312 = fsub contract double %92, %96
  %313 = fmul contract double %312, 5.000000e-01
  %314 = fadd contract double %313, 1.000000e+00
  %315 = fmul contract double %312, %314
  %316 = fadd contract double %74, %315
  %317 = fmul contract double %55, %316
  %318 = add i32 %16, 11312
  %319 = add i32 %318, %27
  %320 = mul i32 %319, 200
  %321 = add i32 %26, %320
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds double, double addrspace(1)* %1, i64 %322
  store double %317, double addrspace(1)* %323, align 8, !tbaa !7
  %324 = fsub contract double %96, %92
  %325 = fmul contract double %324, 5.000000e-01
  %326 = fadd contract double %325, 1.000000e+00
  %327 = fmul contract double %324, %326
  %328 = fadd contract double %74, %327
  %329 = fmul contract double %55, %328
  %330 = add i32 %16, 12120
  %331 = add i32 %330, %27
  %332 = mul i32 %331, 200
  %333 = add i32 %26, %332
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds double, double addrspace(1)* %1, i64 %334
  store double %329, double addrspace(1)* %335, align 8, !tbaa !7
  %336 = fsub contract double %94, %96
  %337 = fmul contract double %336, 5.000000e-01
  %338 = fadd contract double %337, 1.000000e+00
  %339 = fmul contract double %336, %338
  %340 = fadd contract double %74, %339
  %341 = fmul contract double %55, %340
  %342 = add i32 %16, 12928
  %343 = add i32 %342, %27
  %344 = mul i32 %343, 200
  %345 = add i32 %26, %344
  %346 = zext i32 %345 to i64
  %347 = getelementptr inbounds double, double addrspace(1)* %1, i64 %346
  store double %341, double addrspace(1)* %347, align 8, !tbaa !7
  %348 = fsub contract double %96, %94
  %349 = fmul contract double %348, 5.000000e-01
  %350 = fadd contract double %349, 1.000000e+00
  %351 = fmul contract double %348, %350
  %352 = fadd contract double %74, %351
  %353 = fmul contract double %55, %352
  %354 = add i32 %16, 13736
  %355 = add i32 %354, %27
  %356 = mul i32 %355, 200
  %357 = add i32 %26, %356
  %358 = zext i32 %357 to i64
  %359 = getelementptr inbounds double, double addrspace(1)* %1, i64 %358
  store double %353, double addrspace(1)* %359, align 8, !tbaa !7
  %360 = fadd contract double %98, %100
  %361 = fmul contract double %360, 5.000000e-01
  %362 = fadd contract double %361, 1.000000e+00
  %363 = fmul contract double %360, %362
  %364 = fadd contract double %89, %363
  %365 = fmul contract double %60, %364
  %366 = getelementptr inbounds double, double addrspace(1)* %3, i64 %226
  store double %365, double addrspace(1)* %366, align 8, !tbaa !7
  %367 = fsub contract double %187, %98
  %368 = fmul contract double %367, 5.000000e-01
  %369 = fadd contract double %368, 1.000000e+00
  %370 = fmul contract double %367, %369
  %371 = fadd contract double %89, %370
  %372 = fmul contract double %60, %371
  %373 = getelementptr inbounds double, double addrspace(1)* %3, i64 %238
  store double %372, double addrspace(1)* %373, align 8, !tbaa !7
  %374 = fadd contract double %98, %102
  %375 = fmul contract double %374, 5.000000e-01
  %376 = fadd contract double %375, 1.000000e+00
  %377 = fmul contract double %374, %376
  %378 = fadd contract double %89, %377
  %379 = fmul contract double %60, %378
  %380 = getelementptr inbounds double, double addrspace(1)* %3, i64 %250
  store double %379, double addrspace(1)* %380, align 8, !tbaa !7
  %381 = fsub contract double %175, %102
  %382 = fmul contract double %381, 5.000000e-01
  %383 = fadd contract double %382, 1.000000e+00
  %384 = fmul contract double %381, %383
  %385 = fadd contract double %89, %384
  %386 = fmul contract double %60, %385
  %387 = getelementptr inbounds double, double addrspace(1)* %3, i64 %262
  store double %386, double addrspace(1)* %387, align 8, !tbaa !7
  %388 = fadd contract double %100, %102
  %389 = fmul contract double %388, 5.000000e-01
  %390 = fadd contract double %389, 1.000000e+00
  %391 = fmul contract double %388, %390
  %392 = fadd contract double %89, %391
  %393 = fmul contract double %60, %392
  %394 = getelementptr inbounds double, double addrspace(1)* %3, i64 %274
  store double %393, double addrspace(1)* %394, align 8, !tbaa !7
  %395 = fsub contract double %187, %102
  %396 = fmul contract double %395, 5.000000e-01
  %397 = fadd contract double %396, 1.000000e+00
  %398 = fmul contract double %395, %397
  %399 = fadd contract double %89, %398
  %400 = fmul contract double %60, %399
  %401 = getelementptr inbounds double, double addrspace(1)* %3, i64 %286
  store double %400, double addrspace(1)* %401, align 8, !tbaa !7
  %402 = fsub contract double %98, %100
  %403 = fmul contract double %402, 5.000000e-01
  %404 = fadd contract double %403, 1.000000e+00
  %405 = fmul contract double %402, %404
  %406 = fadd contract double %89, %405
  %407 = fmul contract double %60, %406
  %408 = getelementptr inbounds double, double addrspace(1)* %3, i64 %298
  store double %407, double addrspace(1)* %408, align 8, !tbaa !7
  %409 = fsub contract double %100, %98
  %410 = fmul contract double %409, 5.000000e-01
  %411 = fadd contract double %410, 1.000000e+00
  %412 = fmul contract double %409, %411
  %413 = fadd contract double %89, %412
  %414 = fmul contract double %60, %413
  %415 = getelementptr inbounds double, double addrspace(1)* %3, i64 %310
  store double %414, double addrspace(1)* %415, align 8, !tbaa !7
  %416 = fsub contract double %98, %102
  %417 = fmul contract double %416, 5.000000e-01
  %418 = fadd contract double %417, 1.000000e+00
  %419 = fmul contract double %416, %418
  %420 = fadd contract double %89, %419
  %421 = fmul contract double %60, %420
  %422 = getelementptr inbounds double, double addrspace(1)* %3, i64 %322
  store double %421, double addrspace(1)* %422, align 8, !tbaa !7
  %423 = fsub contract double %102, %98
  %424 = fmul contract double %423, 5.000000e-01
  %425 = fadd contract double %424, 1.000000e+00
  %426 = fmul contract double %423, %425
  %427 = fadd contract double %89, %426
  %428 = fmul contract double %60, %427
  %429 = getelementptr inbounds double, double addrspace(1)* %3, i64 %334
  store double %428, double addrspace(1)* %429, align 8, !tbaa !7
  %430 = fsub contract double %100, %102
  %431 = fmul contract double %430, 5.000000e-01
  %432 = fadd contract double %431, 1.000000e+00
  %433 = fmul contract double %430, %432
  %434 = fadd contract double %89, %433
  %435 = fmul contract double %60, %434
  %436 = getelementptr inbounds double, double addrspace(1)* %3, i64 %346
  store double %435, double addrspace(1)* %436, align 8, !tbaa !7
  %437 = fsub contract double %102, %100
  %438 = fmul contract double %437, 5.000000e-01
  %439 = fadd contract double %438, 1.000000e+00
  %440 = fmul contract double %437, %439
  %441 = fadd contract double %89, %440
  %442 = fmul contract double %60, %441
  %443 = getelementptr inbounds double, double addrspace(1)* %3, i64 %358
  store double %442, double addrspace(1)* %443, align 8, !tbaa !7
  %444 = fmul contract double %64, %220
  %445 = getelementptr inbounds double, double addrspace(1)* %5, i64 %226
  store double %444, double addrspace(1)* %445, align 8, !tbaa !7
  %446 = fmul contract double %64, %232
  %447 = getelementptr inbounds double, double addrspace(1)* %5, i64 %238
  store double %446, double addrspace(1)* %447, align 8, !tbaa !7
  %448 = fmul contract double %64, %244
  %449 = getelementptr inbounds double, double addrspace(1)* %5, i64 %250
  store double %448, double addrspace(1)* %449, align 8, !tbaa !7
  %450 = fmul contract double %64, %256
  %451 = getelementptr inbounds double, double addrspace(1)* %5, i64 %262
  store double %450, double addrspace(1)* %451, align 8, !tbaa !7
  %452 = fmul contract double %64, %268
  %453 = getelementptr inbounds double, double addrspace(1)* %5, i64 %274
  store double %452, double addrspace(1)* %453, align 8, !tbaa !7
  %454 = fmul contract double %64, %280
  %455 = getelementptr inbounds double, double addrspace(1)* %5, i64 %286
  store double %454, double addrspace(1)* %455, align 8, !tbaa !7
  %456 = fmul contract double %64, %292
  %457 = getelementptr inbounds double, double addrspace(1)* %5, i64 %298
  store double %456, double addrspace(1)* %457, align 8, !tbaa !7
  %458 = fmul contract double %64, %304
  %459 = getelementptr inbounds double, double addrspace(1)* %5, i64 %310
  store double %458, double addrspace(1)* %459, align 8, !tbaa !7
  %460 = fmul contract double %64, %316
  %461 = getelementptr inbounds double, double addrspace(1)* %5, i64 %322
  store double %460, double addrspace(1)* %461, align 8, !tbaa !7
  %462 = fmul contract double %64, %328
  %463 = getelementptr inbounds double, double addrspace(1)* %5, i64 %334
  store double %462, double addrspace(1)* %463, align 8, !tbaa !7
  %464 = fmul contract double %64, %340
  %465 = getelementptr inbounds double, double addrspace(1)* %5, i64 %346
  store double %464, double addrspace(1)* %465, align 8, !tbaa !7
  %466 = fmul contract double %64, %352
  %467 = getelementptr inbounds double, double addrspace(1)* %5, i64 %358
  store double %466, double addrspace(1)* %467, align 8, !tbaa !7
  %468 = fadd contract double %96, %216
  %469 = fmul contract double %468, 5.000000e-01
  %470 = fadd contract double %469, 1.000000e+00
  %471 = fmul contract double %468, %470
  %472 = fadd contract double %74, %471
  %473 = fmul contract double %57, %472
  %474 = add i32 %16, 14544
  %475 = add i32 %474, %27
  %476 = mul i32 %475, 200
  %477 = add i32 %26, %476
  %478 = zext i32 %477 to i64
  %479 = getelementptr inbounds double, double addrspace(1)* %1, i64 %478
  store double %473, double addrspace(1)* %479, align 8, !tbaa !7
  %480 = fsub contract double %228, %96
  %481 = fmul contract double %480, 5.000000e-01
  %482 = fadd contract double %481, 1.000000e+00
  %483 = fmul contract double %480, %482
  %484 = fadd contract double %74, %483
  %485 = fmul contract double %57, %484
  %486 = add i32 %16, 15352
  %487 = add i32 %486, %27
  %488 = mul i32 %487, 200
  %489 = add i32 %26, %488
  %490 = zext i32 %489 to i64
  %491 = getelementptr inbounds double, double addrspace(1)* %1, i64 %490
  store double %485, double addrspace(1)* %491, align 8, !tbaa !7
  %492 = fsub contract double %216, %96
  %493 = fmul contract double %492, 5.000000e-01
  %494 = fadd contract double %493, 1.000000e+00
  %495 = fmul contract double %492, %494
  %496 = fadd contract double %74, %495
  %497 = fmul contract double %57, %496
  %498 = add i32 %16, 16160
  %499 = add i32 %498, %27
  %500 = mul i32 %499, 200
  %501 = add i32 %26, %500
  %502 = zext i32 %501 to i64
  %503 = getelementptr inbounds double, double addrspace(1)* %1, i64 %502
  store double %497, double addrspace(1)* %503, align 8, !tbaa !7
  %504 = fsub contract double %324, %94
  %505 = fmul contract double %504, 5.000000e-01
  %506 = fadd contract double %505, 1.000000e+00
  %507 = fmul contract double %504, %506
  %508 = fadd contract double %74, %507
  %509 = fmul contract double %57, %508
  %510 = add i32 %16, 16968
  %511 = add i32 %510, %27
  %512 = mul i32 %511, 200
  %513 = add i32 %26, %512
  %514 = zext i32 %513 to i64
  %515 = getelementptr inbounds double, double addrspace(1)* %1, i64 %514
  store double %509, double addrspace(1)* %515, align 8, !tbaa !7
  %516 = fsub contract double %240, %94
  %517 = fmul contract double %516, 5.000000e-01
  %518 = fadd contract double %517, 1.000000e+00
  %519 = fmul contract double %516, %518
  %520 = fadd contract double %74, %519
  %521 = fmul contract double %57, %520
  %522 = add i32 %16, 17776
  %523 = add i32 %522, %27
  %524 = mul i32 %523, 200
  %525 = add i32 %26, %524
  %526 = zext i32 %525 to i64
  %527 = getelementptr inbounds double, double addrspace(1)* %1, i64 %526
  store double %521, double addrspace(1)* %527, align 8, !tbaa !7
  %528 = fsub contract double %300, %96
  %529 = fmul contract double %528, 5.000000e-01
  %530 = fadd contract double %529, 1.000000e+00
  %531 = fmul contract double %528, %530
  %532 = fadd contract double %74, %531
  %533 = fmul contract double %57, %532
  %534 = add i32 %16, 18584
  %535 = add i32 %534, %27
  %536 = mul i32 %535, 200
  %537 = add i32 %26, %536
  %538 = zext i32 %537 to i64
  %539 = getelementptr inbounds double, double addrspace(1)* %1, i64 %538
  store double %533, double addrspace(1)* %539, align 8, !tbaa !7
  %540 = fsub contract double %264, %92
  %541 = fmul contract double %540, 5.000000e-01
  %542 = fadd contract double %541, 1.000000e+00
  %543 = fmul contract double %540, %542
  %544 = fadd contract double %74, %543
  %545 = fmul contract double %57, %544
  %546 = add i32 %16, 19392
  %547 = add i32 %546, %27
  %548 = mul i32 %547, 200
  %549 = add i32 %26, %548
  %550 = zext i32 %549 to i64
  %551 = getelementptr inbounds double, double addrspace(1)* %1, i64 %550
  store double %545, double addrspace(1)* %551, align 8, !tbaa !7
  %552 = fsub contract double %288, %96
  %553 = fmul contract double %552, 5.000000e-01
  %554 = fadd contract double %553, 1.000000e+00
  %555 = fmul contract double %552, %554
  %556 = fadd contract double %74, %555
  %557 = fmul contract double %57, %556
  %558 = add i32 %16, 20200
  %559 = add i32 %558, %27
  %560 = mul i32 %559, 200
  %561 = add i32 %26, %560
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds double, double addrspace(1)* %1, i64 %562
  store double %557, double addrspace(1)* %563, align 8, !tbaa !7
  %564 = fadd contract double %102, %360
  %565 = fmul contract double %564, 5.000000e-01
  %566 = fadd contract double %565, 1.000000e+00
  %567 = fmul contract double %564, %566
  %568 = fadd contract double %89, %567
  %569 = fmul contract double %61, %568
  %570 = getelementptr inbounds double, double addrspace(1)* %3, i64 %478
  store double %569, double addrspace(1)* %570, align 8, !tbaa !7
  %571 = fsub contract double %175, %100
  %572 = fsub contract double %571, %102
  %573 = fmul contract double %572, 5.000000e-01
  %574 = fadd contract double %573, 1.000000e+00
  %575 = fmul contract double %572, %574
  %576 = fadd contract double %89, %575
  %577 = fmul contract double %61, %576
  %578 = getelementptr inbounds double, double addrspace(1)* %3, i64 %490
  store double %577, double addrspace(1)* %578, align 8, !tbaa !7
  %579 = fsub contract double %360, %102
  %580 = fmul contract double %579, 5.000000e-01
  %581 = fadd contract double %580, 1.000000e+00
  %582 = fmul contract double %579, %581
  %583 = fadd contract double %89, %582
  %584 = fmul contract double %61, %583
  %585 = getelementptr inbounds double, double addrspace(1)* %3, i64 %502
  store double %584, double addrspace(1)* %585, align 8, !tbaa !7
  %586 = fsub contract double %423, %100
  %587 = fmul contract double %586, 5.000000e-01
  %588 = fadd contract double %587, 1.000000e+00
  %589 = fmul contract double %586, %588
  %590 = fadd contract double %89, %589
  %591 = fmul contract double %61, %590
  %592 = getelementptr inbounds double, double addrspace(1)* %3, i64 %514
  store double %591, double addrspace(1)* %592, align 8, !tbaa !7
  %593 = fsub contract double %374, %100
  %594 = fmul contract double %593, 5.000000e-01
  %595 = fadd contract double %594, 1.000000e+00
  %596 = fmul contract double %593, %595
  %597 = fadd contract double %89, %596
  %598 = fmul contract double %61, %597
  %599 = getelementptr inbounds double, double addrspace(1)* %3, i64 %526
  store double %598, double addrspace(1)* %599, align 8, !tbaa !7
  %600 = fsub contract double %409, %102
  %601 = fmul contract double %600, 5.000000e-01
  %602 = fadd contract double %601, 1.000000e+00
  %603 = fmul contract double %600, %602
  %604 = fadd contract double %89, %603
  %605 = fmul contract double %61, %604
  %606 = getelementptr inbounds double, double addrspace(1)* %3, i64 %538
  store double %605, double addrspace(1)* %606, align 8, !tbaa !7
  %607 = fsub contract double %388, %98
  %608 = fmul contract double %607, 5.000000e-01
  %609 = fadd contract double %608, 1.000000e+00
  %610 = fmul contract double %607, %609
  %611 = fadd contract double %89, %610
  %612 = fmul contract double %61, %611
  %613 = getelementptr inbounds double, double addrspace(1)* %3, i64 %550
  store double %612, double addrspace(1)* %613, align 8, !tbaa !7
  %614 = fsub contract double %402, %102
  %615 = fmul contract double %614, 5.000000e-01
  %616 = fadd contract double %615, 1.000000e+00
  %617 = fmul contract double %614, %616
  %618 = fadd contract double %89, %617
  %619 = fmul contract double %61, %618
  %620 = getelementptr inbounds double, double addrspace(1)* %3, i64 %562
  store double %619, double addrspace(1)* %620, align 8, !tbaa !7
  %621 = fmul contract double %65, %472
  %622 = getelementptr inbounds double, double addrspace(1)* %5, i64 %478
  store double %621, double addrspace(1)* %622, align 8, !tbaa !7
  %623 = fsub contract double %115, %94
  %624 = fsub contract double %623, %96
  %625 = fmul contract double %624, 5.000000e-01
  %626 = fadd contract double %625, 1.000000e+00
  %627 = fmul contract double %624, %626
  %628 = fadd contract double %74, %627
  %629 = fmul contract double %65, %628
  %630 = getelementptr inbounds double, double addrspace(1)* %5, i64 %490
  store double %629, double addrspace(1)* %630, align 8, !tbaa !7
  %631 = fmul contract double %65, %496
  %632 = getelementptr inbounds double, double addrspace(1)* %5, i64 %502
  store double %631, double addrspace(1)* %632, align 8, !tbaa !7
  %633 = fmul contract double %65, %508
  %634 = getelementptr inbounds double, double addrspace(1)* %5, i64 %514
  store double %633, double addrspace(1)* %634, align 8, !tbaa !7
  %635 = fmul contract double %65, %520
  %636 = getelementptr inbounds double, double addrspace(1)* %5, i64 %526
  store double %635, double addrspace(1)* %636, align 8, !tbaa !7
  %637 = fmul contract double %65, %532
  %638 = getelementptr inbounds double, double addrspace(1)* %5, i64 %538
  store double %637, double addrspace(1)* %638, align 8, !tbaa !7
  %639 = fmul contract double %65, %544
  %640 = getelementptr inbounds double, double addrspace(1)* %5, i64 %550
  store double %639, double addrspace(1)* %640, align 8, !tbaa !7
  %641 = fmul contract double %65, %556
  %642 = getelementptr inbounds double, double addrspace(1)* %5, i64 %562
  store double %641, double addrspace(1)* %642, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
