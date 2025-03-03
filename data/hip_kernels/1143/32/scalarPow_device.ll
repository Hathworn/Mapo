; ModuleID = '../data/hip_kernels/1143/32/main.cu'
source_filename = "../data/hip_kernels/1143/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9scalarPowP15HIP_vector_typeIdLj2EEdS1_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, double %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !15
  %22 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %32 = mul i32 %30, %31
  %33 = add i32 %32, %5
  %34 = mul i32 %33, %18
  %35 = add i32 %34, %4
  %36 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !13, !invariant.load !14
  %39 = zext i16 %38 to i32
  %40 = mul i32 %35, %39
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %43 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %44 = add i32 %40, %42
  %45 = mul i32 %44, %25
  %46 = add i32 %45, %41
  %47 = mul i32 %46, %13
  %48 = add i32 %47, %43
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %49, i32 0, i32 0, i32 0, i64 0
  %51 = load double, double addrspace(1)* %50, align 16, !tbaa !17, !amdgpu.noclobber !14
  %52 = tail call double @llvm.fabs.f64(double %51)
  %53 = tail call double @llvm.amdgcn.frexp.mant.f64(double %52)
  %54 = fcmp olt double %53, 0x3FE5555555555555
  %55 = zext i1 %54 to i32
  %56 = tail call double @llvm.amdgcn.ldexp.f64(double %53, i32 %55)
  %57 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %52)
  %58 = sub nsw i32 %57, %55
  %59 = fadd double %56, -1.000000e+00
  %60 = fadd double %56, 1.000000e+00
  %61 = fadd double %60, -1.000000e+00
  %62 = fsub double %56, %61
  %63 = tail call double @llvm.amdgcn.rcp.f64(double %60)
  %64 = fneg double %60
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double 1.000000e+00)
  %66 = tail call double @llvm.fma.f64(double %65, double %63, double %63)
  %67 = tail call double @llvm.fma.f64(double %64, double %66, double 1.000000e+00)
  %68 = tail call double @llvm.fma.f64(double %67, double %66, double %66)
  %69 = fmul double %59, %68
  %70 = fmul double %60, %69
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %69, double %60, double %71)
  %73 = tail call double @llvm.fma.f64(double %69, double %62, double %72)
  %74 = fadd double %70, %73
  %75 = fsub double %74, %70
  %76 = fsub double %73, %75
  %77 = fsub double %59, %74
  %78 = fsub double %59, %77
  %79 = fsub double %78, %74
  %80 = fsub double %79, %76
  %81 = fadd double %77, %80
  %82 = fmul double %68, %81
  %83 = fadd double %69, %82
  %84 = fsub double %83, %69
  %85 = fsub double %82, %84
  %86 = fmul double %83, %83
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %83, double %83, double %87)
  %89 = fmul double %85, 2.000000e+00
  %90 = tail call double @llvm.fma.f64(double %83, double %89, double %88)
  %91 = fadd double %86, %90
  %92 = fsub double %91, %86
  %93 = fsub double %90, %92
  %94 = tail call double @llvm.fma.f64(double %91, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %95 = tail call double @llvm.fma.f64(double %91, double %94, double 0x3FBE25E43ABE935A)
  %96 = tail call double @llvm.fma.f64(double %91, double %95, double 0x3FC110EF47E6C9C2)
  %97 = tail call double @llvm.fma.f64(double %91, double %96, double 0x3FC3B13BCFA74449)
  %98 = tail call double @llvm.fma.f64(double %91, double %97, double 0x3FC745D171BF3C30)
  %99 = tail call double @llvm.fma.f64(double %91, double %98, double 0x3FCC71C71C7792CE)
  %100 = tail call double @llvm.fma.f64(double %91, double %99, double 0x3FD24924924920DA)
  %101 = tail call double @llvm.fma.f64(double %91, double %100, double 0x3FD999999999999C)
  %102 = sitofp i32 %58 to double
  %103 = fmul double %102, 0x3FE62E42FEFA39EF
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %102, double 0x3FE62E42FEFA39EF, double %104)
  %106 = tail call double @llvm.fma.f64(double %102, double 0x3C7ABC9E3B39803F, double %105)
  %107 = fadd double %103, %106
  %108 = fsub double %107, %103
  %109 = fsub double %106, %108
  %110 = tail call double @llvm.amdgcn.ldexp.f64(double %83, i32 1)
  %111 = tail call double @llvm.amdgcn.ldexp.f64(double %85, i32 1)
  %112 = fmul double %83, %91
  %113 = fneg double %112
  %114 = tail call double @llvm.fma.f64(double %91, double %83, double %113)
  %115 = tail call double @llvm.fma.f64(double %91, double %85, double %114)
  %116 = tail call double @llvm.fma.f64(double %93, double %83, double %115)
  %117 = fadd double %112, %116
  %118 = fsub double %117, %112
  %119 = fsub double %116, %118
  %120 = fmul double %91, %101
  %121 = fneg double %120
  %122 = tail call double @llvm.fma.f64(double %91, double %101, double %121)
  %123 = tail call double @llvm.fma.f64(double %93, double %101, double %122)
  %124 = fadd double %120, %123
  %125 = fsub double %124, %120
  %126 = fsub double %123, %125
  %127 = fadd double %124, 0x3FE5555555555555
  %128 = fadd double %127, 0xBFE5555555555555
  %129 = fsub double %124, %128
  %130 = fadd double %126, 0x3C8543B0D5DF274D
  %131 = fadd double %130, %129
  %132 = fadd double %127, %131
  %133 = fsub double %132, %127
  %134 = fsub double %131, %133
  %135 = fmul double %117, %132
  %136 = fneg double %135
  %137 = tail call double @llvm.fma.f64(double %117, double %132, double %136)
  %138 = tail call double @llvm.fma.f64(double %117, double %134, double %137)
  %139 = tail call double @llvm.fma.f64(double %119, double %132, double %138)
  %140 = fadd double %135, %139
  %141 = fsub double %140, %135
  %142 = fsub double %139, %141
  %143 = fadd double %110, %140
  %144 = fsub double %143, %110
  %145 = fsub double %140, %144
  %146 = fadd double %111, %142
  %147 = fadd double %146, %145
  %148 = fadd double %143, %147
  %149 = fsub double %148, %143
  %150 = fsub double %147, %149
  %151 = fadd double %107, %148
  %152 = fsub double %151, %107
  %153 = fsub double %151, %152
  %154 = fsub double %107, %153
  %155 = fsub double %148, %152
  %156 = fadd double %155, %154
  %157 = fadd double %109, %150
  %158 = fsub double %157, %109
  %159 = fsub double %157, %158
  %160 = fsub double %109, %159
  %161 = fsub double %150, %158
  %162 = fadd double %161, %160
  %163 = fadd double %157, %156
  %164 = fadd double %151, %163
  %165 = fsub double %164, %151
  %166 = fsub double %163, %165
  %167 = fadd double %162, %166
  %168 = fadd double %164, %167
  %169 = fsub double %168, %164
  %170 = fsub double %167, %169
  %171 = fmul double %168, %1
  %172 = fneg double %171
  %173 = tail call double @llvm.fma.f64(double %1, double %168, double %172)
  %174 = tail call double @llvm.fma.f64(double %1, double %170, double %173)
  %175 = fadd double %171, %174
  %176 = fsub double %175, %171
  %177 = fsub double %174, %176
  %178 = tail call double @llvm.fabs.f64(double %171) #3
  %179 = fcmp oeq double %178, 0x7FF0000000000000
  %180 = select i1 %179, double %171, double %175
  %181 = tail call double @llvm.fabs.f64(double %180) #3
  %182 = fcmp oeq double %181, 0x7FF0000000000000
  %183 = select i1 %182, double 0.000000e+00, double %177
  %184 = fmul double %180, 0x3FF71547652B82FE
  %185 = tail call double @llvm.rint.f64(double %184)
  %186 = fneg double %185
  %187 = tail call double @llvm.fma.f64(double %186, double 0x3FE62E42FEFA39EF, double %180)
  %188 = tail call double @llvm.fma.f64(double %186, double 0x3C7ABC9E3B39803F, double %187)
  %189 = tail call double @llvm.fma.f64(double %188, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %190 = tail call double @llvm.fma.f64(double %188, double %189, double 0x3EC71DEE623FDE64)
  %191 = tail call double @llvm.fma.f64(double %188, double %190, double 0x3EFA01997C89E6B0)
  %192 = tail call double @llvm.fma.f64(double %188, double %191, double 0x3F2A01A014761F6E)
  %193 = tail call double @llvm.fma.f64(double %188, double %192, double 0x3F56C16C1852B7B0)
  %194 = tail call double @llvm.fma.f64(double %188, double %193, double 0x3F81111111122322)
  %195 = tail call double @llvm.fma.f64(double %188, double %194, double 0x3FA55555555502A1)
  %196 = tail call double @llvm.fma.f64(double %188, double %195, double 0x3FC5555555555511)
  %197 = tail call double @llvm.fma.f64(double %188, double %196, double 0x3FE000000000000B)
  %198 = tail call double @llvm.fma.f64(double %188, double %197, double 1.000000e+00)
  %199 = tail call double @llvm.fma.f64(double %188, double %198, double 1.000000e+00)
  %200 = fptosi double %185 to i32
  %201 = tail call double @llvm.amdgcn.ldexp.f64(double %199, i32 %200)
  %202 = fcmp ogt double %180, 1.024000e+03
  %203 = select i1 %202, double 0x7FF0000000000000, double %201
  %204 = fcmp olt double %180, -1.075000e+03
  %205 = select i1 %204, double 0.000000e+00, double %203
  %206 = tail call double @llvm.fma.f64(double %205, double %183, double %205)
  %207 = tail call double @llvm.fabs.f64(double %205) #3
  %208 = fcmp oeq double %207, 0x7FF0000000000000
  %209 = select i1 %208, double %205, double %206
  %210 = tail call double @llvm.fabs.f64(double %1)
  %211 = tail call double @llvm.trunc.f64(double %210)
  %212 = fcmp oeq double %210, %211
  %213 = zext i1 %212 to i32
  %214 = fmul double %211, 5.000000e-01
  %215 = tail call double @llvm.amdgcn.fract.f64(double %214)
  %216 = tail call i1 @llvm.amdgcn.class.f64(double %214, i32 516)
  %217 = select i1 %216, double 0.000000e+00, double %215
  %218 = fcmp oeq double %217, 0.000000e+00
  %219 = and i1 %212, %218
  %220 = zext i1 %219 to i32
  %221 = add nuw nsw i32 %220, %213
  %222 = icmp eq i32 %221, 1
  %223 = fcmp olt double %51, 0.000000e+00
  %224 = and i1 %222, %223
  %225 = select i1 %224, double -0.000000e+00, double 0.000000e+00
  %226 = tail call double @llvm.copysign.f64(double %209, double %225)
  %227 = fcmp uge double %51, 0.000000e+00
  %228 = icmp ne i32 %221, 0
  %229 = select i1 %227, i1 true, i1 %228
  %230 = select i1 %229, double %226, double 0x7FF8000000000000
  %231 = fcmp oeq double %210, 0x7FF0000000000000
  %232 = fcmp oeq double %52, 1.000000e+00
  %233 = fadd double %52, -1.000000e+00
  %234 = bitcast double %1 to <2 x i32>
  %235 = extractelement <2 x i32> %234, i64 1
  %236 = bitcast double %233 to <2 x i32>
  %237 = extractelement <2 x i32> %236, i64 1
  %238 = xor i32 %237, %235
  %239 = icmp sgt i32 %238, -1
  %240 = select i1 %239, double 0x7FF0000000000000, double 0.000000e+00
  %241 = select i1 %232, double %52, double %240
  %242 = select i1 %231, double %241, double %230
  %243 = fcmp oeq double %52, 0x7FF0000000000000
  %244 = fcmp oeq double %51, 0.000000e+00
  %245 = or i1 %244, %243
  %246 = fcmp olt double %1, 0.000000e+00
  %247 = xor i1 %246, %244
  %248 = select i1 %247, double 0.000000e+00, double 0x7FF0000000000000
  %249 = select i1 %222, double %51, double 0.000000e+00
  %250 = tail call double @llvm.copysign.f64(double %248, double %249)
  %251 = select i1 %245, double %250, double %242
  %252 = fcmp uno double %51, %1
  %253 = select i1 %252, double 0x7FF8000000000000, double %251
  %254 = fcmp oeq double %51, 1.000000e+00
  %255 = fcmp oeq double %1, 0.000000e+00
  %256 = or i1 %255, %254
  %257 = select i1 %256, double 1.000000e+00, double %253
  %258 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %49, i32 0, i32 0, i32 0, i64 1
  %259 = load double, double addrspace(1)* %258, align 8, !tbaa !17, !amdgpu.noclobber !14
  %260 = tail call double @llvm.fabs.f64(double %259)
  %261 = tail call double @llvm.amdgcn.frexp.mant.f64(double %260)
  %262 = fcmp olt double %261, 0x3FE5555555555555
  %263 = zext i1 %262 to i32
  %264 = tail call double @llvm.amdgcn.ldexp.f64(double %261, i32 %263)
  %265 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %260)
  %266 = sub nsw i32 %265, %263
  %267 = fadd double %264, -1.000000e+00
  %268 = fadd double %264, 1.000000e+00
  %269 = fadd double %268, -1.000000e+00
  %270 = fsub double %264, %269
  %271 = tail call double @llvm.amdgcn.rcp.f64(double %268)
  %272 = fneg double %268
  %273 = tail call double @llvm.fma.f64(double %272, double %271, double 1.000000e+00)
  %274 = tail call double @llvm.fma.f64(double %273, double %271, double %271)
  %275 = tail call double @llvm.fma.f64(double %272, double %274, double 1.000000e+00)
  %276 = tail call double @llvm.fma.f64(double %275, double %274, double %274)
  %277 = fmul double %267, %276
  %278 = fmul double %268, %277
  %279 = fneg double %278
  %280 = tail call double @llvm.fma.f64(double %277, double %268, double %279)
  %281 = tail call double @llvm.fma.f64(double %277, double %270, double %280)
  %282 = fadd double %278, %281
  %283 = fsub double %282, %278
  %284 = fsub double %281, %283
  %285 = fsub double %267, %282
  %286 = fsub double %267, %285
  %287 = fsub double %286, %282
  %288 = fsub double %287, %284
  %289 = fadd double %285, %288
  %290 = fmul double %276, %289
  %291 = fadd double %277, %290
  %292 = fsub double %291, %277
  %293 = fsub double %290, %292
  %294 = fmul double %291, %291
  %295 = fneg double %294
  %296 = tail call double @llvm.fma.f64(double %291, double %291, double %295)
  %297 = fmul double %293, 2.000000e+00
  %298 = tail call double @llvm.fma.f64(double %291, double %297, double %296)
  %299 = fadd double %294, %298
  %300 = fsub double %299, %294
  %301 = fsub double %298, %300
  %302 = tail call double @llvm.fma.f64(double %299, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %303 = tail call double @llvm.fma.f64(double %299, double %302, double 0x3FBE25E43ABE935A)
  %304 = tail call double @llvm.fma.f64(double %299, double %303, double 0x3FC110EF47E6C9C2)
  %305 = tail call double @llvm.fma.f64(double %299, double %304, double 0x3FC3B13BCFA74449)
  %306 = tail call double @llvm.fma.f64(double %299, double %305, double 0x3FC745D171BF3C30)
  %307 = tail call double @llvm.fma.f64(double %299, double %306, double 0x3FCC71C71C7792CE)
  %308 = tail call double @llvm.fma.f64(double %299, double %307, double 0x3FD24924924920DA)
  %309 = tail call double @llvm.fma.f64(double %299, double %308, double 0x3FD999999999999C)
  %310 = sitofp i32 %266 to double
  %311 = fmul double %310, 0x3FE62E42FEFA39EF
  %312 = fneg double %311
  %313 = tail call double @llvm.fma.f64(double %310, double 0x3FE62E42FEFA39EF, double %312)
  %314 = tail call double @llvm.fma.f64(double %310, double 0x3C7ABC9E3B39803F, double %313)
  %315 = fadd double %311, %314
  %316 = fsub double %315, %311
  %317 = fsub double %314, %316
  %318 = tail call double @llvm.amdgcn.ldexp.f64(double %291, i32 1)
  %319 = tail call double @llvm.amdgcn.ldexp.f64(double %293, i32 1)
  %320 = fmul double %291, %299
  %321 = fneg double %320
  %322 = tail call double @llvm.fma.f64(double %299, double %291, double %321)
  %323 = tail call double @llvm.fma.f64(double %299, double %293, double %322)
  %324 = tail call double @llvm.fma.f64(double %301, double %291, double %323)
  %325 = fadd double %320, %324
  %326 = fsub double %325, %320
  %327 = fsub double %324, %326
  %328 = fmul double %299, %309
  %329 = fneg double %328
  %330 = tail call double @llvm.fma.f64(double %299, double %309, double %329)
  %331 = tail call double @llvm.fma.f64(double %301, double %309, double %330)
  %332 = fadd double %328, %331
  %333 = fsub double %332, %328
  %334 = fsub double %331, %333
  %335 = fadd double %332, 0x3FE5555555555555
  %336 = fadd double %335, 0xBFE5555555555555
  %337 = fsub double %332, %336
  %338 = fadd double %334, 0x3C8543B0D5DF274D
  %339 = fadd double %338, %337
  %340 = fadd double %335, %339
  %341 = fsub double %340, %335
  %342 = fsub double %339, %341
  %343 = fmul double %325, %340
  %344 = fneg double %343
  %345 = tail call double @llvm.fma.f64(double %325, double %340, double %344)
  %346 = tail call double @llvm.fma.f64(double %325, double %342, double %345)
  %347 = tail call double @llvm.fma.f64(double %327, double %340, double %346)
  %348 = fadd double %343, %347
  %349 = fsub double %348, %343
  %350 = fsub double %347, %349
  %351 = fadd double %318, %348
  %352 = fsub double %351, %318
  %353 = fsub double %348, %352
  %354 = fadd double %319, %350
  %355 = fadd double %354, %353
  %356 = fadd double %351, %355
  %357 = fsub double %356, %351
  %358 = fsub double %355, %357
  %359 = fadd double %315, %356
  %360 = fsub double %359, %315
  %361 = fsub double %359, %360
  %362 = fsub double %315, %361
  %363 = fsub double %356, %360
  %364 = fadd double %363, %362
  %365 = fadd double %317, %358
  %366 = fsub double %365, %317
  %367 = fsub double %365, %366
  %368 = fsub double %317, %367
  %369 = fsub double %358, %366
  %370 = fadd double %369, %368
  %371 = fadd double %365, %364
  %372 = fadd double %359, %371
  %373 = fsub double %372, %359
  %374 = fsub double %371, %373
  %375 = fadd double %370, %374
  %376 = fadd double %372, %375
  %377 = fsub double %376, %372
  %378 = fsub double %375, %377
  %379 = fmul double %376, %1
  %380 = fneg double %379
  %381 = tail call double @llvm.fma.f64(double %1, double %376, double %380)
  %382 = tail call double @llvm.fma.f64(double %1, double %378, double %381)
  %383 = fadd double %379, %382
  %384 = fsub double %383, %379
  %385 = fsub double %382, %384
  %386 = tail call double @llvm.fabs.f64(double %379) #3
  %387 = fcmp oeq double %386, 0x7FF0000000000000
  %388 = select i1 %387, double %379, double %383
  %389 = tail call double @llvm.fabs.f64(double %388) #3
  %390 = fcmp oeq double %389, 0x7FF0000000000000
  %391 = select i1 %390, double 0.000000e+00, double %385
  %392 = fmul double %388, 0x3FF71547652B82FE
  %393 = tail call double @llvm.rint.f64(double %392)
  %394 = fneg double %393
  %395 = tail call double @llvm.fma.f64(double %394, double 0x3FE62E42FEFA39EF, double %388)
  %396 = tail call double @llvm.fma.f64(double %394, double 0x3C7ABC9E3B39803F, double %395)
  %397 = tail call double @llvm.fma.f64(double %396, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %398 = tail call double @llvm.fma.f64(double %396, double %397, double 0x3EC71DEE623FDE64)
  %399 = tail call double @llvm.fma.f64(double %396, double %398, double 0x3EFA01997C89E6B0)
  %400 = tail call double @llvm.fma.f64(double %396, double %399, double 0x3F2A01A014761F6E)
  %401 = tail call double @llvm.fma.f64(double %396, double %400, double 0x3F56C16C1852B7B0)
  %402 = tail call double @llvm.fma.f64(double %396, double %401, double 0x3F81111111122322)
  %403 = tail call double @llvm.fma.f64(double %396, double %402, double 0x3FA55555555502A1)
  %404 = tail call double @llvm.fma.f64(double %396, double %403, double 0x3FC5555555555511)
  %405 = tail call double @llvm.fma.f64(double %396, double %404, double 0x3FE000000000000B)
  %406 = tail call double @llvm.fma.f64(double %396, double %405, double 1.000000e+00)
  %407 = tail call double @llvm.fma.f64(double %396, double %406, double 1.000000e+00)
  %408 = fptosi double %393 to i32
  %409 = tail call double @llvm.amdgcn.ldexp.f64(double %407, i32 %408)
  %410 = fcmp ogt double %388, 1.024000e+03
  %411 = select i1 %410, double 0x7FF0000000000000, double %409
  %412 = fcmp olt double %388, -1.075000e+03
  %413 = select i1 %412, double 0.000000e+00, double %411
  %414 = tail call double @llvm.fma.f64(double %413, double %391, double %413)
  %415 = tail call double @llvm.fabs.f64(double %413) #3
  %416 = fcmp oeq double %415, 0x7FF0000000000000
  %417 = select i1 %416, double %413, double %414
  %418 = fcmp olt double %259, 0.000000e+00
  %419 = and i1 %222, %418
  %420 = select i1 %419, double -0.000000e+00, double 0.000000e+00
  %421 = tail call double @llvm.copysign.f64(double %417, double %420)
  %422 = fcmp uge double %259, 0.000000e+00
  %423 = select i1 %422, i1 true, i1 %228
  %424 = select i1 %423, double %421, double 0x7FF8000000000000
  %425 = fcmp oeq double %260, 1.000000e+00
  %426 = fadd double %260, -1.000000e+00
  %427 = bitcast double %426 to <2 x i32>
  %428 = extractelement <2 x i32> %427, i64 1
  %429 = xor i32 %428, %235
  %430 = icmp sgt i32 %429, -1
  %431 = select i1 %430, double 0x7FF0000000000000, double 0.000000e+00
  %432 = select i1 %425, double %260, double %431
  %433 = select i1 %231, double %432, double %424
  %434 = fcmp oeq double %260, 0x7FF0000000000000
  %435 = fcmp oeq double %259, 0.000000e+00
  %436 = or i1 %435, %434
  %437 = xor i1 %246, %435
  %438 = select i1 %437, double 0.000000e+00, double 0x7FF0000000000000
  %439 = select i1 %222, double %259, double 0.000000e+00
  %440 = tail call double @llvm.copysign.f64(double %438, double %439)
  %441 = select i1 %436, double %440, double %433
  %442 = fcmp uno double %259, %1
  %443 = select i1 %442, double 0x7FF8000000000000, double %441
  %444 = fcmp oeq double %259, 1.000000e+00
  %445 = or i1 %255, %444
  %446 = select i1 %445, double 1.000000e+00, double %443
  %447 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %49, i32 0, i32 0, i32 0, i64 0
  store double %257, double addrspace(1)* %447, align 16
  %448 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %49, i32 0, i32 0, i32 0, i64 1
  store double %446, double addrspace(1)* %448, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
