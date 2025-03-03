; ModuleID = '../data/hip_kernels/1143/62/main.cu'
source_filename = "../data/hip_kernels/1143/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10ktorus_wfcPdS_S_S_dS_P15HIP_vector_typeIdLj2EE(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, double addrspace(1)* nocapture readnone %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !15
  %26 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %25, %29
  %31 = mul i32 %30, %29
  %32 = icmp ugt i32 %25, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %36 = mul i32 %34, %35
  %37 = add i32 %36, %9
  %38 = mul i32 %37, %22
  %39 = add i32 %38, %8
  %40 = mul i32 %8, %17
  %41 = mul i32 %9, %29
  %42 = getelementptr i8, i8 addrspace(4)* %10, i64 8
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !13, !invariant.load !14
  %45 = zext i16 %44 to i32
  %46 = mul i32 %35, %45
  %47 = mul i32 %39, %45
  %48 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %49 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %50 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %51 = add i32 %47, %49
  %52 = mul i32 %51, %29
  %53 = add i32 %52, %48
  %54 = mul i32 %53, %17
  %55 = add i32 %54, %50
  %56 = add i32 %40, %50
  %57 = add i32 %41, %48
  %58 = add i32 %46, %49
  %59 = sext i32 %56 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !17, !amdgpu.noclobber !14
  %62 = getelementptr inbounds double, double addrspace(1)* %3, i64 6
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !17, !amdgpu.noclobber !14
  %64 = fsub contract double %61, %63
  %65 = fmul contract double %64, %64
  %66 = sext i32 %57 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !17, !amdgpu.noclobber !14
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 7
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !17, !amdgpu.noclobber !14
  %71 = fsub contract double %68, %70
  %72 = fmul contract double %71, %71
  %73 = fadd contract double %65, %72
  %74 = fcmp olt double %73, 0x1000000000000000
  %75 = select i1 %74, double 0x4FF0000000000000, double 1.000000e+00
  %76 = fmul double %73, %75
  %77 = tail call double @llvm.amdgcn.rsq.f64(double %76)
  %78 = fmul double %76, %77
  %79 = fmul double %77, 5.000000e-01
  %80 = fneg double %79
  %81 = tail call double @llvm.fma.f64(double %80, double %78, double 5.000000e-01)
  %82 = tail call double @llvm.fma.f64(double %79, double %81, double %79)
  %83 = tail call double @llvm.fma.f64(double %78, double %81, double %78)
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %84, double %83, double %76)
  %86 = tail call double @llvm.fma.f64(double %85, double %82, double %83)
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %87, double %86, double %76)
  %89 = tail call double @llvm.fma.f64(double %88, double %82, double %86)
  %90 = select i1 %74, double 0x37F0000000000000, double 1.000000e+00
  %91 = fmul double %90, %89
  %92 = fcmp oeq double %76, 0.000000e+00
  %93 = fcmp oeq double %76, 0x7FF0000000000000
  %94 = or i1 %92, %93
  %95 = select i1 %94, double %76, double %91
  %96 = load double, double addrspace(1)* %3, align 8, !tbaa !17, !amdgpu.noclobber !14
  %97 = fmul contract double %96, 5.000000e-01
  %98 = fsub contract double %95, %97
  %99 = getelementptr inbounds double, double addrspace(1)* %3, i64 14
  %100 = bitcast double addrspace(1)* %99 to <2 x double> addrspace(1)*
  %101 = load <2 x double>, <2 x double> addrspace(1)* %100, align 8, !tbaa !17
  %102 = extractelement <2 x double> %101, i64 0
  %103 = extractelement <2 x double> %101, i64 1
  %104 = fmul contract double %102, %103
  %105 = fmul contract double %104, 5.000000e-01
  %106 = fdiv contract double %98, %105
  %107 = tail call double @llvm.fabs.f64(double %106)
  %108 = tail call double @llvm.amdgcn.frexp.mant.f64(double %107)
  %109 = fcmp olt double %108, 0x3FE5555555555555
  %110 = zext i1 %109 to i32
  %111 = tail call double @llvm.amdgcn.ldexp.f64(double %108, i32 %110)
  %112 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %107)
  %113 = sub nsw i32 %112, %110
  %114 = fadd double %111, -1.000000e+00
  %115 = fadd double %111, 1.000000e+00
  %116 = fadd double %115, -1.000000e+00
  %117 = fsub double %111, %116
  %118 = tail call double @llvm.amdgcn.rcp.f64(double %115)
  %119 = fneg double %115
  %120 = tail call double @llvm.fma.f64(double %119, double %118, double 1.000000e+00)
  %121 = tail call double @llvm.fma.f64(double %120, double %118, double %118)
  %122 = tail call double @llvm.fma.f64(double %119, double %121, double 1.000000e+00)
  %123 = tail call double @llvm.fma.f64(double %122, double %121, double %121)
  %124 = fmul double %114, %123
  %125 = fmul double %115, %124
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %124, double %115, double %126)
  %128 = tail call double @llvm.fma.f64(double %124, double %117, double %127)
  %129 = fadd double %125, %128
  %130 = fsub double %129, %125
  %131 = fsub double %128, %130
  %132 = fsub double %114, %129
  %133 = fsub double %114, %132
  %134 = fsub double %133, %129
  %135 = fsub double %134, %131
  %136 = fadd double %132, %135
  %137 = fmul double %123, %136
  %138 = fadd double %124, %137
  %139 = fsub double %138, %124
  %140 = fsub double %137, %139
  %141 = fmul double %138, %138
  %142 = fneg double %141
  %143 = tail call double @llvm.fma.f64(double %138, double %138, double %142)
  %144 = fmul double %140, 2.000000e+00
  %145 = tail call double @llvm.fma.f64(double %138, double %144, double %143)
  %146 = fadd double %141, %145
  %147 = fsub double %146, %141
  %148 = fsub double %145, %147
  %149 = tail call double @llvm.fma.f64(double %146, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %150 = tail call double @llvm.fma.f64(double %146, double %149, double 0x3FBE25E43ABE935A)
  %151 = tail call double @llvm.fma.f64(double %146, double %150, double 0x3FC110EF47E6C9C2)
  %152 = tail call double @llvm.fma.f64(double %146, double %151, double 0x3FC3B13BCFA74449)
  %153 = tail call double @llvm.fma.f64(double %146, double %152, double 0x3FC745D171BF3C30)
  %154 = tail call double @llvm.fma.f64(double %146, double %153, double 0x3FCC71C71C7792CE)
  %155 = tail call double @llvm.fma.f64(double %146, double %154, double 0x3FD24924924920DA)
  %156 = tail call double @llvm.fma.f64(double %146, double %155, double 0x3FD999999999999C)
  %157 = sitofp i32 %113 to double
  %158 = fmul double %157, 0x3FE62E42FEFA39EF
  %159 = fneg double %158
  %160 = tail call double @llvm.fma.f64(double %157, double 0x3FE62E42FEFA39EF, double %159)
  %161 = tail call double @llvm.fma.f64(double %157, double 0x3C7ABC9E3B39803F, double %160)
  %162 = fadd double %158, %161
  %163 = fsub double %162, %158
  %164 = fsub double %161, %163
  %165 = tail call double @llvm.amdgcn.ldexp.f64(double %138, i32 1)
  %166 = tail call double @llvm.amdgcn.ldexp.f64(double %140, i32 1)
  %167 = fmul double %138, %146
  %168 = fneg double %167
  %169 = tail call double @llvm.fma.f64(double %146, double %138, double %168)
  %170 = tail call double @llvm.fma.f64(double %146, double %140, double %169)
  %171 = tail call double @llvm.fma.f64(double %148, double %138, double %170)
  %172 = fadd double %167, %171
  %173 = fsub double %172, %167
  %174 = fsub double %171, %173
  %175 = fmul double %146, %156
  %176 = fneg double %175
  %177 = tail call double @llvm.fma.f64(double %146, double %156, double %176)
  %178 = tail call double @llvm.fma.f64(double %148, double %156, double %177)
  %179 = fadd double %175, %178
  %180 = fsub double %179, %175
  %181 = fsub double %178, %180
  %182 = fadd double %179, 0x3FE5555555555555
  %183 = fadd double %182, 0xBFE5555555555555
  %184 = fsub double %179, %183
  %185 = fadd double %181, 0x3C8543B0D5DF274D
  %186 = fadd double %185, %184
  %187 = fadd double %182, %186
  %188 = fsub double %187, %182
  %189 = fsub double %186, %188
  %190 = fmul double %172, %187
  %191 = fneg double %190
  %192 = tail call double @llvm.fma.f64(double %172, double %187, double %191)
  %193 = tail call double @llvm.fma.f64(double %172, double %189, double %192)
  %194 = tail call double @llvm.fma.f64(double %174, double %187, double %193)
  %195 = fadd double %190, %194
  %196 = fsub double %195, %190
  %197 = fsub double %194, %196
  %198 = fadd double %165, %195
  %199 = fsub double %198, %165
  %200 = fsub double %195, %199
  %201 = fadd double %166, %197
  %202 = fadd double %201, %200
  %203 = fadd double %198, %202
  %204 = fsub double %203, %198
  %205 = fsub double %202, %204
  %206 = fadd double %162, %203
  %207 = fsub double %206, %162
  %208 = fsub double %206, %207
  %209 = fsub double %162, %208
  %210 = fsub double %203, %207
  %211 = fadd double %210, %209
  %212 = fadd double %164, %205
  %213 = fsub double %212, %164
  %214 = fsub double %212, %213
  %215 = fsub double %164, %214
  %216 = fsub double %205, %213
  %217 = fadd double %216, %215
  %218 = fadd double %212, %211
  %219 = fadd double %206, %218
  %220 = fsub double %219, %206
  %221 = fsub double %218, %220
  %222 = fadd double %217, %221
  %223 = fadd double %219, %222
  %224 = fsub double %223, %219
  %225 = fsub double %222, %224
  %226 = fmul double %223, 2.000000e+00
  %227 = fneg double %226
  %228 = tail call double @llvm.fma.f64(double %223, double 2.000000e+00, double %227)
  %229 = tail call double @llvm.fma.f64(double %225, double 2.000000e+00, double %228)
  %230 = fadd double %226, %229
  %231 = fsub double %230, %226
  %232 = fsub double %229, %231
  %233 = tail call double @llvm.fabs.f64(double %226) #3
  %234 = fcmp oeq double %233, 0x7FF0000000000000
  %235 = select i1 %234, double %226, double %230
  %236 = tail call double @llvm.fabs.f64(double %235) #3
  %237 = fcmp oeq double %236, 0x7FF0000000000000
  %238 = select i1 %237, double 0.000000e+00, double %232
  %239 = fmul double %235, 0x3FF71547652B82FE
  %240 = tail call double @llvm.rint.f64(double %239)
  %241 = fneg double %240
  %242 = tail call double @llvm.fma.f64(double %241, double 0x3FE62E42FEFA39EF, double %235)
  %243 = tail call double @llvm.fma.f64(double %241, double 0x3C7ABC9E3B39803F, double %242)
  %244 = tail call double @llvm.fma.f64(double %243, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %245 = tail call double @llvm.fma.f64(double %243, double %244, double 0x3EC71DEE623FDE64)
  %246 = tail call double @llvm.fma.f64(double %243, double %245, double 0x3EFA01997C89E6B0)
  %247 = tail call double @llvm.fma.f64(double %243, double %246, double 0x3F2A01A014761F6E)
  %248 = tail call double @llvm.fma.f64(double %243, double %247, double 0x3F56C16C1852B7B0)
  %249 = tail call double @llvm.fma.f64(double %243, double %248, double 0x3F81111111122322)
  %250 = tail call double @llvm.fma.f64(double %243, double %249, double 0x3FA55555555502A1)
  %251 = tail call double @llvm.fma.f64(double %243, double %250, double 0x3FC5555555555511)
  %252 = tail call double @llvm.fma.f64(double %243, double %251, double 0x3FE000000000000B)
  %253 = tail call double @llvm.fma.f64(double %243, double %252, double 1.000000e+00)
  %254 = tail call double @llvm.fma.f64(double %243, double %253, double 1.000000e+00)
  %255 = fptosi double %240 to i32
  %256 = tail call double @llvm.amdgcn.ldexp.f64(double %254, i32 %255)
  %257 = fcmp ogt double %235, 1.024000e+03
  %258 = select i1 %257, double 0x7FF0000000000000, double %256
  %259 = fcmp olt double %235, -1.075000e+03
  %260 = select i1 %259, double 0.000000e+00, double %258
  %261 = tail call double @llvm.fma.f64(double %260, double %238, double %260)
  %262 = tail call double @llvm.fabs.f64(double %260) #3
  %263 = fcmp oeq double %262, 0x7FF0000000000000
  %264 = select i1 %263, double %260, double %261
  %265 = tail call double @llvm.fabs.f64(double %264)
  %266 = fcmp oeq double %107, 0x7FF0000000000000
  %267 = fcmp oeq double %106, 0.000000e+00
  %268 = select i1 %266, double 0x7FF0000000000000, double %265
  %269 = select i1 %267, double 0.000000e+00, double %268
  %270 = fcmp uno double %106, 0.000000e+00
  %271 = select i1 %270, double 0x7FF8000000000000, double %269
  %272 = sext i32 %58 to i64
  %273 = getelementptr inbounds double, double addrspace(1)* %2, i64 %272
  %274 = load double, double addrspace(1)* %273, align 8, !tbaa !17, !amdgpu.noclobber !14
  %275 = getelementptr inbounds double, double addrspace(1)* %3, i64 17
  %276 = load double, double addrspace(1)* %275, align 8, !tbaa !17, !amdgpu.noclobber !14
  %277 = fmul contract double %102, %276
  %278 = fmul contract double %277, 5.000000e-01
  %279 = fdiv contract double %274, %278
  %280 = tail call double @llvm.fabs.f64(double %279)
  %281 = tail call double @llvm.amdgcn.frexp.mant.f64(double %280)
  %282 = fcmp olt double %281, 0x3FE5555555555555
  %283 = zext i1 %282 to i32
  %284 = tail call double @llvm.amdgcn.ldexp.f64(double %281, i32 %283)
  %285 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %280)
  %286 = sub nsw i32 %285, %283
  %287 = fadd double %284, -1.000000e+00
  %288 = fadd double %284, 1.000000e+00
  %289 = fadd double %288, -1.000000e+00
  %290 = fsub double %284, %289
  %291 = tail call double @llvm.amdgcn.rcp.f64(double %288)
  %292 = fneg double %288
  %293 = tail call double @llvm.fma.f64(double %292, double %291, double 1.000000e+00)
  %294 = tail call double @llvm.fma.f64(double %293, double %291, double %291)
  %295 = tail call double @llvm.fma.f64(double %292, double %294, double 1.000000e+00)
  %296 = tail call double @llvm.fma.f64(double %295, double %294, double %294)
  %297 = fmul double %287, %296
  %298 = fmul double %288, %297
  %299 = fneg double %298
  %300 = tail call double @llvm.fma.f64(double %297, double %288, double %299)
  %301 = tail call double @llvm.fma.f64(double %297, double %290, double %300)
  %302 = fadd double %298, %301
  %303 = fsub double %302, %298
  %304 = fsub double %301, %303
  %305 = fsub double %287, %302
  %306 = fsub double %287, %305
  %307 = fsub double %306, %302
  %308 = fsub double %307, %304
  %309 = fadd double %305, %308
  %310 = fmul double %296, %309
  %311 = fadd double %297, %310
  %312 = fsub double %311, %297
  %313 = fsub double %310, %312
  %314 = fmul double %311, %311
  %315 = fneg double %314
  %316 = tail call double @llvm.fma.f64(double %311, double %311, double %315)
  %317 = fmul double %313, 2.000000e+00
  %318 = tail call double @llvm.fma.f64(double %311, double %317, double %316)
  %319 = fadd double %314, %318
  %320 = fsub double %319, %314
  %321 = fsub double %318, %320
  %322 = tail call double @llvm.fma.f64(double %319, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %323 = tail call double @llvm.fma.f64(double %319, double %322, double 0x3FBE25E43ABE935A)
  %324 = tail call double @llvm.fma.f64(double %319, double %323, double 0x3FC110EF47E6C9C2)
  %325 = tail call double @llvm.fma.f64(double %319, double %324, double 0x3FC3B13BCFA74449)
  %326 = tail call double @llvm.fma.f64(double %319, double %325, double 0x3FC745D171BF3C30)
  %327 = tail call double @llvm.fma.f64(double %319, double %326, double 0x3FCC71C71C7792CE)
  %328 = tail call double @llvm.fma.f64(double %319, double %327, double 0x3FD24924924920DA)
  %329 = tail call double @llvm.fma.f64(double %319, double %328, double 0x3FD999999999999C)
  %330 = sitofp i32 %286 to double
  %331 = fmul double %330, 0x3FE62E42FEFA39EF
  %332 = fneg double %331
  %333 = tail call double @llvm.fma.f64(double %330, double 0x3FE62E42FEFA39EF, double %332)
  %334 = tail call double @llvm.fma.f64(double %330, double 0x3C7ABC9E3B39803F, double %333)
  %335 = fadd double %331, %334
  %336 = fsub double %335, %331
  %337 = fsub double %334, %336
  %338 = tail call double @llvm.amdgcn.ldexp.f64(double %311, i32 1)
  %339 = tail call double @llvm.amdgcn.ldexp.f64(double %313, i32 1)
  %340 = fmul double %311, %319
  %341 = fneg double %340
  %342 = tail call double @llvm.fma.f64(double %319, double %311, double %341)
  %343 = tail call double @llvm.fma.f64(double %319, double %313, double %342)
  %344 = tail call double @llvm.fma.f64(double %321, double %311, double %343)
  %345 = fadd double %340, %344
  %346 = fsub double %345, %340
  %347 = fsub double %344, %346
  %348 = fmul double %319, %329
  %349 = fneg double %348
  %350 = tail call double @llvm.fma.f64(double %319, double %329, double %349)
  %351 = tail call double @llvm.fma.f64(double %321, double %329, double %350)
  %352 = fadd double %348, %351
  %353 = fsub double %352, %348
  %354 = fsub double %351, %353
  %355 = fadd double %352, 0x3FE5555555555555
  %356 = fadd double %355, 0xBFE5555555555555
  %357 = fsub double %352, %356
  %358 = fadd double %354, 0x3C8543B0D5DF274D
  %359 = fadd double %358, %357
  %360 = fadd double %355, %359
  %361 = fsub double %360, %355
  %362 = fsub double %359, %361
  %363 = fmul double %345, %360
  %364 = fneg double %363
  %365 = tail call double @llvm.fma.f64(double %345, double %360, double %364)
  %366 = tail call double @llvm.fma.f64(double %345, double %362, double %365)
  %367 = tail call double @llvm.fma.f64(double %347, double %360, double %366)
  %368 = fadd double %363, %367
  %369 = fsub double %368, %363
  %370 = fsub double %367, %369
  %371 = fadd double %338, %368
  %372 = fsub double %371, %338
  %373 = fsub double %368, %372
  %374 = fadd double %339, %370
  %375 = fadd double %374, %373
  %376 = fadd double %371, %375
  %377 = fsub double %376, %371
  %378 = fsub double %375, %377
  %379 = fadd double %335, %376
  %380 = fsub double %379, %335
  %381 = fsub double %379, %380
  %382 = fsub double %335, %381
  %383 = fsub double %376, %380
  %384 = fadd double %383, %382
  %385 = fadd double %337, %378
  %386 = fsub double %385, %337
  %387 = fsub double %385, %386
  %388 = fsub double %337, %387
  %389 = fsub double %378, %386
  %390 = fadd double %389, %388
  %391 = fadd double %385, %384
  %392 = fadd double %379, %391
  %393 = fsub double %392, %379
  %394 = fsub double %391, %393
  %395 = fadd double %390, %394
  %396 = fadd double %392, %395
  %397 = fsub double %396, %392
  %398 = fsub double %395, %397
  %399 = fmul double %396, 2.000000e+00
  %400 = fneg double %399
  %401 = tail call double @llvm.fma.f64(double %396, double 2.000000e+00, double %400)
  %402 = tail call double @llvm.fma.f64(double %398, double 2.000000e+00, double %401)
  %403 = fadd double %399, %402
  %404 = fsub double %403, %399
  %405 = fsub double %402, %404
  %406 = tail call double @llvm.fabs.f64(double %399) #3
  %407 = fcmp oeq double %406, 0x7FF0000000000000
  %408 = select i1 %407, double %399, double %403
  %409 = tail call double @llvm.fabs.f64(double %408) #3
  %410 = fcmp oeq double %409, 0x7FF0000000000000
  %411 = select i1 %410, double 0.000000e+00, double %405
  %412 = fmul double %408, 0x3FF71547652B82FE
  %413 = tail call double @llvm.rint.f64(double %412)
  %414 = fneg double %413
  %415 = tail call double @llvm.fma.f64(double %414, double 0x3FE62E42FEFA39EF, double %408)
  %416 = tail call double @llvm.fma.f64(double %414, double 0x3C7ABC9E3B39803F, double %415)
  %417 = tail call double @llvm.fma.f64(double %416, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %418 = tail call double @llvm.fma.f64(double %416, double %417, double 0x3EC71DEE623FDE64)
  %419 = tail call double @llvm.fma.f64(double %416, double %418, double 0x3EFA01997C89E6B0)
  %420 = tail call double @llvm.fma.f64(double %416, double %419, double 0x3F2A01A014761F6E)
  %421 = tail call double @llvm.fma.f64(double %416, double %420, double 0x3F56C16C1852B7B0)
  %422 = tail call double @llvm.fma.f64(double %416, double %421, double 0x3F81111111122322)
  %423 = tail call double @llvm.fma.f64(double %416, double %422, double 0x3FA55555555502A1)
  %424 = tail call double @llvm.fma.f64(double %416, double %423, double 0x3FC5555555555511)
  %425 = tail call double @llvm.fma.f64(double %416, double %424, double 0x3FE000000000000B)
  %426 = tail call double @llvm.fma.f64(double %416, double %425, double 1.000000e+00)
  %427 = tail call double @llvm.fma.f64(double %416, double %426, double 1.000000e+00)
  %428 = fptosi double %413 to i32
  %429 = tail call double @llvm.amdgcn.ldexp.f64(double %427, i32 %428)
  %430 = fcmp ogt double %408, 1.024000e+03
  %431 = select i1 %430, double 0x7FF0000000000000, double %429
  %432 = fcmp olt double %408, -1.075000e+03
  %433 = select i1 %432, double 0.000000e+00, double %431
  %434 = tail call double @llvm.fma.f64(double %433, double %411, double %433)
  %435 = tail call double @llvm.fabs.f64(double %433) #3
  %436 = fcmp oeq double %435, 0x7FF0000000000000
  %437 = select i1 %436, double %433, double %434
  %438 = tail call double @llvm.fabs.f64(double %437)
  %439 = fcmp oeq double %280, 0x7FF0000000000000
  %440 = fcmp oeq double %279, 0.000000e+00
  %441 = select i1 %439, double 0x7FF0000000000000, double %438
  %442 = select i1 %440, double 0.000000e+00, double %441
  %443 = fcmp uno double %279, 0.000000e+00
  %444 = select i1 %443, double 0x7FF8000000000000, double %442
  %445 = fadd contract double %444, %271
  %446 = fneg contract double %445
  %447 = fmul double %445, 0xBFF71547652B82FE
  %448 = tail call double @llvm.rint.f64(double %447)
  %449 = fneg double %448
  %450 = tail call double @llvm.fma.f64(double %449, double 0x3FE62E42FEFA39EF, double %446)
  %451 = tail call double @llvm.fma.f64(double %449, double 0x3C7ABC9E3B39803F, double %450)
  %452 = tail call double @llvm.fma.f64(double %451, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %453 = tail call double @llvm.fma.f64(double %451, double %452, double 0x3EC71DEE623FDE64)
  %454 = tail call double @llvm.fma.f64(double %451, double %453, double 0x3EFA01997C89E6B0)
  %455 = tail call double @llvm.fma.f64(double %451, double %454, double 0x3F2A01A014761F6E)
  %456 = tail call double @llvm.fma.f64(double %451, double %455, double 0x3F56C16C1852B7B0)
  %457 = tail call double @llvm.fma.f64(double %451, double %456, double 0x3F81111111122322)
  %458 = tail call double @llvm.fma.f64(double %451, double %457, double 0x3FA55555555502A1)
  %459 = tail call double @llvm.fma.f64(double %451, double %458, double 0x3FC5555555555511)
  %460 = tail call double @llvm.fma.f64(double %451, double %459, double 0x3FE000000000000B)
  %461 = tail call double @llvm.fma.f64(double %451, double %460, double 1.000000e+00)
  %462 = tail call double @llvm.fma.f64(double %451, double %461, double 1.000000e+00)
  %463 = fptosi double %448 to i32
  %464 = tail call double @llvm.amdgcn.ldexp.f64(double %462, i32 %463)
  %465 = fcmp ogt double %445, 1.075000e+03
  %466 = select i1 %465, double 0.000000e+00, double %464
  %467 = sext i32 %55 to i64
  %468 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %467, i32 0, i32 0, i32 0, i64 0
  store double %466, double addrspace(1)* %468, align 16, !tbaa !21
  %469 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %467, i32 0, i32 0, i32 0, i64 1
  store double 0.000000e+00, double addrspace(1)* %469, align 8, !tbaa !21
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!19, !19, i64 0}
