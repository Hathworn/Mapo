; ModuleID = '../data/hip_kernels/16034/74/main.cu'
source_filename = "../data/hip_kernels/16034/74/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_tgamma(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %629

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp ogt double %36, 0x3F40000000000000
  br i1 %37, label %38, label %620

38:                                               ; preds = %32
  %39 = fcmp olt double %36, 4.500000e+00
  br i1 %39, label %40, label %51

40:                                               ; preds = %38
  %41 = fcmp olt double %36, 1.000000e+00
  br i1 %41, label %42, label %44

42:                                               ; preds = %40
  %43 = fadd double %36, 1.000000e+00
  br label %61

44:                                               ; preds = %40
  %45 = fcmp uge double %36, 3.000000e+00
  %46 = fcmp olt double %36, 4.000000e+00
  %47 = and i1 %45, %46
  %48 = fadd double %36, -1.000000e+00
  %49 = select i1 %47, double %48, double %36
  %50 = select i1 %47, double %48, double 1.000000e+00
  br label %61

51:                                               ; preds = %38
  %52 = fcmp olt double %36, 5.500000e+00
  br i1 %52, label %53, label %56

53:                                               ; preds = %51
  %54 = tail call double @llvm.fma.f64(double %35, double %35, double %36)
  %55 = fadd double %36, 2.000000e+00
  br label %61

56:                                               ; preds = %51
  %57 = fcmp olt double %36, 6.500000e+00
  %58 = fadd double %36, 1.000000e+00
  %59 = select i1 %57, double %58, double %36
  %60 = select i1 %57, double %36, double 1.000000e+00
  br label %61

61:                                               ; preds = %56, %53, %44, %42
  %62 = phi double [ %43, %42 ], [ %55, %53 ], [ %49, %44 ], [ %59, %56 ]
  %63 = phi double [ %36, %42 ], [ %54, %53 ], [ 1.000000e+00, %44 ], [ %60, %56 ]
  %64 = phi double [ 1.000000e+00, %42 ], [ 1.000000e+00, %53 ], [ %50, %44 ], [ 1.000000e+00, %56 ]
  %65 = fcmp olt double %35, 0.000000e+00
  br i1 %65, label %66, label %111

66:                                               ; preds = %61
  %67 = fneg double %35
  %68 = fmul double %36, 5.000000e-01
  %69 = tail call double @llvm.amdgcn.fract.f64(double %68)
  %70 = tail call i1 @llvm.amdgcn.class.f64(double %68, i32 516)
  %71 = fmul double %69, 2.000000e+00
  %72 = select i1 %70, double 0.000000e+00, double %71
  %73 = fcmp ogt double %36, 1.000000e+00
  %74 = select i1 %73, double %72, double %36
  %75 = fmul double %74, 2.000000e+00
  %76 = tail call double @llvm.rint.f64(double %75)
  %77 = tail call double @llvm.fma.f64(double %76, double -5.000000e-01, double %74)
  %78 = fptosi double %76 to i32
  %79 = fmul double %77, %77
  %80 = tail call double @llvm.fma.f64(double %79, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %81 = tail call double @llvm.fma.f64(double %79, double %80, double 0x3FB50782D5F14825)
  %82 = tail call double @llvm.fma.f64(double %79, double %81, double 0xBFE32D2CCDFE9424)
  %83 = tail call double @llvm.fma.f64(double %79, double %82, double 0x400466BC67754FFF)
  %84 = tail call double @llvm.fma.f64(double %79, double %83, double 0xC014ABBCE625BE09)
  %85 = fmul double %77, %79
  %86 = fmul double %85, %84
  %87 = tail call double @llvm.fma.f64(double %77, double 0x400921FB54442D18, double %86)
  %88 = tail call double @llvm.fma.f64(double %79, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %89 = tail call double @llvm.fma.f64(double %79, double %88, double 0xBF9A6D1E7294BFF9)
  %90 = tail call double @llvm.fma.f64(double %79, double %89, double 0x3FCE1F5067B90B37)
  %91 = tail call double @llvm.fma.f64(double %79, double %90, double 0xBFF55D3C7E3C325B)
  %92 = tail call double @llvm.fma.f64(double %79, double %91, double 0x40103C1F081B5A67)
  %93 = tail call double @llvm.fma.f64(double %79, double %92, double 0xC013BD3CC9BE45DE)
  %94 = tail call double @llvm.fma.f64(double %79, double %93, double 1.000000e+00)
  %95 = and i32 %78, 1
  %96 = icmp eq i32 %95, 0
  %97 = select i1 %96, double %87, double %94
  %98 = bitcast double %97 to <2 x i32>
  %99 = shl i32 %78, 30
  %100 = bitcast double %35 to <2 x i32>
  %101 = extractelement <2 x i32> %100, i64 1
  %102 = xor i32 %99, %101
  %103 = and i32 %102, -2147483648
  %104 = extractelement <2 x i32> %98, i64 1
  %105 = xor i32 %104, %103
  %106 = insertelement <2 x i32> %98, i32 %105, i64 1
  %107 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 519)
  %108 = select i1 %107, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %106
  %109 = bitcast <2 x i32> %108 to double
  %110 = fmul double %67, %109
  br label %111

111:                                              ; preds = %66, %61
  %112 = phi double [ %110, %66 ], [ 1.000000e+00, %61 ]
  %113 = fneg double %62
  %114 = fmul double %62, 0xBFF71547652B82FE
  %115 = tail call double @llvm.rint.f64(double %114)
  %116 = fneg double %115
  %117 = tail call double @llvm.fma.f64(double %116, double 0x3FE62E42FEFA39EF, double %113)
  %118 = tail call double @llvm.fma.f64(double %116, double 0x3C7ABC9E3B39803F, double %117)
  %119 = tail call double @llvm.fma.f64(double %118, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %120 = tail call double @llvm.fma.f64(double %118, double %119, double 0x3EC71DEE623FDE64)
  %121 = tail call double @llvm.fma.f64(double %118, double %120, double 0x3EFA01997C89E6B0)
  %122 = tail call double @llvm.fma.f64(double %118, double %121, double 0x3F2A01A014761F6E)
  %123 = tail call double @llvm.fma.f64(double %118, double %122, double 0x3F56C16C1852B7B0)
  %124 = tail call double @llvm.fma.f64(double %118, double %123, double 0x3F81111111122322)
  %125 = tail call double @llvm.fma.f64(double %118, double %124, double 0x3FA55555555502A1)
  %126 = tail call double @llvm.fma.f64(double %118, double %125, double 0x3FC5555555555511)
  %127 = tail call double @llvm.fma.f64(double %118, double %126, double 0x3FE000000000000B)
  %128 = tail call double @llvm.fma.f64(double %118, double %127, double 1.000000e+00)
  %129 = tail call double @llvm.fma.f64(double %118, double %128, double 1.000000e+00)
  %130 = fptosi double %115 to i32
  %131 = tail call double @llvm.amdgcn.ldexp.f64(double %129, i32 %130)
  %132 = fcmp olt double %62, -1.024000e+03
  %133 = select i1 %132, double 0x7FF0000000000000, double %131
  %134 = fcmp ogt double %62, 1.075000e+03
  %135 = select i1 %134, double 0.000000e+00, double %133
  %136 = fcmp olt double %62, 4.500000e+00
  br i1 %136, label %137, label %367

137:                                              ; preds = %111
  %138 = tail call double @llvm.fma.f64(double %62, double 0x40F4AB1F6E83DCE9, double 0x4110D0CE4500BC82)
  %139 = tail call double @llvm.fma.f64(double %62, double %138, double 0x411AE4AFD120301F)
  %140 = tail call double @llvm.fma.f64(double %62, double %139, double 0x4115082AF927D6F4)
  %141 = tail call double @llvm.fma.f64(double %62, double %140, double 0x410012DB432D213B)
  %142 = tail call double @llvm.fma.f64(double %62, double %141, double 0x40D0878904CC0A98)
  %143 = tail call double @llvm.fma.f64(double %62, double %142, double 0x407294FE7CB03F7E)
  %144 = fmul double %64, %143
  %145 = tail call double @llvm.fma.f64(double %62, double 0x40E07DB4866AD8C9, double 0x40FA259259D8939B)
  %146 = tail call double @llvm.fma.f64(double %62, double %145, double 0x41045A9F332EF3D7)
  %147 = tail call double @llvm.fma.f64(double %62, double %146, double 0x40FE19DE58C591E1)
  %148 = tail call double @llvm.fma.f64(double %62, double %147, double 0x40E47E912BCE5459)
  %149 = tail call double @llvm.fma.f64(double %62, double %148, double 0x40A98DE345ECF69C)
  %150 = tail call double @llvm.fma.f64(double %62, double %149, double 0xC02AAE2055F91864)
  %151 = tail call double @llvm.fma.f64(double %62, double %150, double 1.000000e+00)
  %152 = fmul double %63, %151
  %153 = fadd double %62, 5.000000e-01
  %154 = tail call double @llvm.fabs.f64(double %62)
  %155 = tail call double @llvm.amdgcn.frexp.mant.f64(double %154)
  %156 = fcmp olt double %155, 0x3FE5555555555555
  %157 = zext i1 %156 to i32
  %158 = tail call double @llvm.amdgcn.ldexp.f64(double %155, i32 %157)
  %159 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %154)
  %160 = sub nsw i32 %159, %157
  %161 = fadd double %158, -1.000000e+00
  %162 = fadd double %158, 1.000000e+00
  %163 = fadd double %162, -1.000000e+00
  %164 = fsub double %158, %163
  %165 = tail call double @llvm.amdgcn.rcp.f64(double %162)
  %166 = fneg double %162
  %167 = tail call double @llvm.fma.f64(double %166, double %165, double 1.000000e+00)
  %168 = tail call double @llvm.fma.f64(double %167, double %165, double %165)
  %169 = tail call double @llvm.fma.f64(double %166, double %168, double 1.000000e+00)
  %170 = tail call double @llvm.fma.f64(double %169, double %168, double %168)
  %171 = fmul double %161, %170
  %172 = fmul double %162, %171
  %173 = fneg double %172
  %174 = tail call double @llvm.fma.f64(double %171, double %162, double %173)
  %175 = tail call double @llvm.fma.f64(double %171, double %164, double %174)
  %176 = fadd double %172, %175
  %177 = fsub double %176, %172
  %178 = fsub double %175, %177
  %179 = fsub double %161, %176
  %180 = fsub double %161, %179
  %181 = fsub double %180, %176
  %182 = fsub double %181, %178
  %183 = fadd double %179, %182
  %184 = fmul double %170, %183
  %185 = fadd double %171, %184
  %186 = fsub double %185, %171
  %187 = fsub double %184, %186
  %188 = fmul double %185, %185
  %189 = fneg double %188
  %190 = tail call double @llvm.fma.f64(double %185, double %185, double %189)
  %191 = fmul double %187, 2.000000e+00
  %192 = tail call double @llvm.fma.f64(double %185, double %191, double %190)
  %193 = fadd double %188, %192
  %194 = fsub double %193, %188
  %195 = fsub double %192, %194
  %196 = tail call double @llvm.fma.f64(double %193, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %197 = tail call double @llvm.fma.f64(double %193, double %196, double 0x3FBE25E43ABE935A)
  %198 = tail call double @llvm.fma.f64(double %193, double %197, double 0x3FC110EF47E6C9C2)
  %199 = tail call double @llvm.fma.f64(double %193, double %198, double 0x3FC3B13BCFA74449)
  %200 = tail call double @llvm.fma.f64(double %193, double %199, double 0x3FC745D171BF3C30)
  %201 = tail call double @llvm.fma.f64(double %193, double %200, double 0x3FCC71C71C7792CE)
  %202 = tail call double @llvm.fma.f64(double %193, double %201, double 0x3FD24924924920DA)
  %203 = tail call double @llvm.fma.f64(double %193, double %202, double 0x3FD999999999999C)
  %204 = sitofp i32 %160 to double
  %205 = fmul double %204, 0x3FE62E42FEFA39EF
  %206 = fneg double %205
  %207 = tail call double @llvm.fma.f64(double %204, double 0x3FE62E42FEFA39EF, double %206)
  %208 = tail call double @llvm.fma.f64(double %204, double 0x3C7ABC9E3B39803F, double %207)
  %209 = fadd double %205, %208
  %210 = fsub double %209, %205
  %211 = fsub double %208, %210
  %212 = tail call double @llvm.amdgcn.ldexp.f64(double %185, i32 1)
  %213 = tail call double @llvm.amdgcn.ldexp.f64(double %187, i32 1)
  %214 = fmul double %185, %193
  %215 = fneg double %214
  %216 = tail call double @llvm.fma.f64(double %193, double %185, double %215)
  %217 = tail call double @llvm.fma.f64(double %193, double %187, double %216)
  %218 = tail call double @llvm.fma.f64(double %195, double %185, double %217)
  %219 = fadd double %214, %218
  %220 = fsub double %219, %214
  %221 = fsub double %218, %220
  %222 = fmul double %193, %203
  %223 = fneg double %222
  %224 = tail call double @llvm.fma.f64(double %193, double %203, double %223)
  %225 = tail call double @llvm.fma.f64(double %195, double %203, double %224)
  %226 = fadd double %222, %225
  %227 = fsub double %226, %222
  %228 = fsub double %225, %227
  %229 = fadd double %226, 0x3FE5555555555555
  %230 = fadd double %229, 0xBFE5555555555555
  %231 = fsub double %226, %230
  %232 = fadd double %228, 0x3C8543B0D5DF274D
  %233 = fadd double %232, %231
  %234 = fadd double %229, %233
  %235 = fsub double %234, %229
  %236 = fsub double %233, %235
  %237 = fmul double %219, %234
  %238 = fneg double %237
  %239 = tail call double @llvm.fma.f64(double %219, double %234, double %238)
  %240 = tail call double @llvm.fma.f64(double %219, double %236, double %239)
  %241 = tail call double @llvm.fma.f64(double %221, double %234, double %240)
  %242 = fadd double %237, %241
  %243 = fsub double %242, %237
  %244 = fsub double %241, %243
  %245 = fadd double %212, %242
  %246 = fsub double %245, %212
  %247 = fsub double %242, %246
  %248 = fadd double %213, %244
  %249 = fadd double %248, %247
  %250 = fadd double %245, %249
  %251 = fsub double %250, %245
  %252 = fsub double %249, %251
  %253 = fadd double %209, %250
  %254 = fsub double %253, %209
  %255 = fsub double %253, %254
  %256 = fsub double %209, %255
  %257 = fsub double %250, %254
  %258 = fadd double %257, %256
  %259 = fadd double %211, %252
  %260 = fsub double %259, %211
  %261 = fsub double %259, %260
  %262 = fsub double %211, %261
  %263 = fsub double %252, %260
  %264 = fadd double %263, %262
  %265 = fadd double %259, %258
  %266 = fadd double %253, %265
  %267 = fsub double %266, %253
  %268 = fsub double %265, %267
  %269 = fadd double %264, %268
  %270 = fadd double %266, %269
  %271 = fsub double %270, %266
  %272 = fsub double %269, %271
  %273 = fmul double %153, %270
  %274 = fneg double %273
  %275 = tail call double @llvm.fma.f64(double %153, double %270, double %274)
  %276 = tail call double @llvm.fma.f64(double %153, double %272, double %275)
  %277 = fadd double %273, %276
  %278 = fsub double %277, %273
  %279 = fsub double %276, %278
  %280 = tail call double @llvm.fabs.f64(double %273) #3
  %281 = fcmp oeq double %280, 0x7FF0000000000000
  %282 = select i1 %281, double %273, double %277
  %283 = tail call double @llvm.fabs.f64(double %282) #3
  %284 = fcmp oeq double %283, 0x7FF0000000000000
  %285 = select i1 %284, double 0.000000e+00, double %279
  %286 = fmul double %282, 0x3FF71547652B82FE
  %287 = tail call double @llvm.rint.f64(double %286)
  %288 = fneg double %287
  %289 = tail call double @llvm.fma.f64(double %288, double 0x3FE62E42FEFA39EF, double %282)
  %290 = tail call double @llvm.fma.f64(double %288, double 0x3C7ABC9E3B39803F, double %289)
  %291 = tail call double @llvm.fma.f64(double %290, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %292 = tail call double @llvm.fma.f64(double %290, double %291, double 0x3EC71DEE623FDE64)
  %293 = tail call double @llvm.fma.f64(double %290, double %292, double 0x3EFA01997C89E6B0)
  %294 = tail call double @llvm.fma.f64(double %290, double %293, double 0x3F2A01A014761F6E)
  %295 = tail call double @llvm.fma.f64(double %290, double %294, double 0x3F56C16C1852B7B0)
  %296 = tail call double @llvm.fma.f64(double %290, double %295, double 0x3F81111111122322)
  %297 = tail call double @llvm.fma.f64(double %290, double %296, double 0x3FA55555555502A1)
  %298 = tail call double @llvm.fma.f64(double %290, double %297, double 0x3FC5555555555511)
  %299 = tail call double @llvm.fma.f64(double %290, double %298, double 0x3FE000000000000B)
  %300 = tail call double @llvm.fma.f64(double %290, double %299, double 1.000000e+00)
  %301 = tail call double @llvm.fma.f64(double %290, double %300, double 1.000000e+00)
  %302 = fptosi double %287 to i32
  %303 = tail call double @llvm.amdgcn.ldexp.f64(double %301, i32 %302)
  %304 = fcmp ogt double %282, 1.024000e+03
  %305 = select i1 %304, double 0x7FF0000000000000, double %303
  %306 = fcmp olt double %282, -1.075000e+03
  %307 = select i1 %306, double 0.000000e+00, double %305
  %308 = tail call double @llvm.fma.f64(double %307, double %285, double %307)
  %309 = tail call double @llvm.fabs.f64(double %307) #3
  %310 = fcmp oeq double %309, 0x7FF0000000000000
  %311 = select i1 %310, double %307, double %308
  %312 = tail call double @llvm.fabs.f64(double %153)
  %313 = tail call double @llvm.trunc.f64(double %312)
  %314 = fcmp oeq double %312, %313
  %315 = zext i1 %314 to i32
  %316 = fmul double %313, 5.000000e-01
  %317 = tail call double @llvm.amdgcn.fract.f64(double %316)
  %318 = tail call i1 @llvm.amdgcn.class.f64(double %316, i32 516)
  %319 = select i1 %318, double 0.000000e+00, double %317
  %320 = fcmp oeq double %319, 0.000000e+00
  %321 = and i1 %314, %320
  %322 = zext i1 %321 to i32
  %323 = add nuw nsw i32 %322, %315
  %324 = icmp eq i32 %323, 1
  %325 = fcmp olt double %62, 0.000000e+00
  %326 = and i1 %325, %324
  %327 = select i1 %326, double -0.000000e+00, double 0.000000e+00
  %328 = tail call double @llvm.copysign.f64(double %311, double %327)
  %329 = fcmp olt double %153, 0.000000e+00
  %330 = select i1 %329, double 0x7FF0000000000000, double 0.000000e+00
  %331 = select i1 %329, double 0.000000e+00, double 0x7FF0000000000000
  %332 = fcmp oeq double %62, 0.000000e+00
  %333 = select i1 %332, double %330, double %328
  %334 = fcmp oeq double %154, 0x7FF0000000000000
  %335 = select i1 %334, double %331, double %333
  %336 = fcmp oeq double %312, 0x7FF0000000000000
  %337 = fcmp olt double %154, 1.000000e+00
  %338 = select i1 %337, double %330, double %331
  %339 = select i1 %336, double %338, double %335
  %340 = fcmp oeq double %153, 0.000000e+00
  %341 = or i1 %332, %334
  %342 = select i1 %341, double 0x7FF8000000000000, double 1.000000e+00
  %343 = select i1 %340, double %342, double %339
  %344 = fcmp oeq double %62, 1.000000e+00
  %345 = select i1 %336, double 0x7FF8000000000000, double 1.000000e+00
  %346 = select i1 %344, double %345, double %343
  %347 = fcmp ult double %62, 0.000000e+00
  %348 = fcmp uno double %153, 0.000000e+00
  %349 = or i1 %347, %348
  %350 = select i1 %349, double 0x7FF8000000000000, double %346
  %351 = fcmp ult double %35, 0.000000e+00
  br i1 %351, label %356, label %352

352:                                              ; preds = %137
  %353 = fmul double %135, %350
  %354 = fdiv double %144, %152
  %355 = fmul double %354, %353
  br label %626

356:                                              ; preds = %137
  %357 = fmul double %152, 0x400921FB54442D18
  %358 = fmul double %135, %112
  %359 = fmul double %350, %358
  %360 = fmul double %144, %359
  %361 = fdiv double %357, %360
  %362 = tail call double @llvm.amdgcn.fract.f64(double %35)
  %363 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 516)
  %364 = select i1 %363, double 0.000000e+00, double %362
  %365 = fcmp oeq double %364, 0.000000e+00
  %366 = select i1 %365, double 0x7FF8000000000000, double %361
  br label %626

367:                                              ; preds = %111
  %368 = fdiv double 1.000000e+00, %62
  %369 = tail call double @llvm.fma.f64(double %368, double 0x3FDCCD75F8F2C906, double 0xBF797AFD9D48525D)
  %370 = tail call double @llvm.fma.f64(double %368, double %369, double 0xBFB2F2ACB5BF5FFD)
  %371 = tail call double @llvm.fma.f64(double %368, double %370, double 0x3F562F0E23FD0C19)
  %372 = tail call double @llvm.fma.f64(double %368, double %371, double 0x3F906FA254FEA952)
  %373 = tail call double @llvm.fma.f64(double %368, double %372, double 0xBF3AB27FA22C15A8)
  %374 = tail call double @llvm.fma.f64(double %368, double %373, double 0xBF73A7E4383F8766)
  %375 = tail call double @llvm.fma.f64(double %368, double %374, double 0x3F27ABEDB872AF00)
  %376 = tail call double @llvm.fma.f64(double %368, double %375, double 0x3F613D0F7D32582E)
  %377 = tail call double @llvm.fma.f64(double %368, double %376, double 0xBF20FDEA4648ED9D)
  %378 = tail call double @llvm.fma.f64(double %368, double %377, double 0xBF5851C7286C560C)
  %379 = tail call double @llvm.fma.f64(double %368, double %378, double 0x3F26E8BA6CCAF74E)
  %380 = tail call double @llvm.fma.f64(double %368, double %379, double 0x3F601985A7C9E683)
  %381 = tail call double @llvm.fma.f64(double %368, double %380, double 0xBF42D92340CE801F)
  %382 = tail call double @llvm.fma.f64(double %368, double %381, double 0xBF7B8792FC787C5E)
  %383 = tail call double @llvm.fma.f64(double %368, double %382, double 0x3F81D32D71BE5B93)
  %384 = tail call double @llvm.fma.f64(double %368, double %383, double 0x3FCABCC42A9D895D)
  %385 = tail call double @llvm.fma.f64(double %368, double %384, double 0x40040D931FF62706)
  %386 = tail call double @llvm.fma.f64(double %62, double 5.000000e-01, double -2.500000e-01)
  %387 = tail call double @llvm.fabs.f64(double %62)
  %388 = tail call double @llvm.amdgcn.frexp.mant.f64(double %387)
  %389 = fcmp olt double %388, 0x3FE5555555555555
  %390 = zext i1 %389 to i32
  %391 = tail call double @llvm.amdgcn.ldexp.f64(double %388, i32 %390)
  %392 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %387)
  %393 = sub nsw i32 %392, %390
  %394 = fadd double %391, -1.000000e+00
  %395 = fadd double %391, 1.000000e+00
  %396 = fadd double %395, -1.000000e+00
  %397 = fsub double %391, %396
  %398 = tail call double @llvm.amdgcn.rcp.f64(double %395)
  %399 = fneg double %395
  %400 = tail call double @llvm.fma.f64(double %399, double %398, double 1.000000e+00)
  %401 = tail call double @llvm.fma.f64(double %400, double %398, double %398)
  %402 = tail call double @llvm.fma.f64(double %399, double %401, double 1.000000e+00)
  %403 = tail call double @llvm.fma.f64(double %402, double %401, double %401)
  %404 = fmul double %394, %403
  %405 = fmul double %395, %404
  %406 = fneg double %405
  %407 = tail call double @llvm.fma.f64(double %404, double %395, double %406)
  %408 = tail call double @llvm.fma.f64(double %404, double %397, double %407)
  %409 = fadd double %405, %408
  %410 = fsub double %409, %405
  %411 = fsub double %408, %410
  %412 = fsub double %394, %409
  %413 = fsub double %394, %412
  %414 = fsub double %413, %409
  %415 = fsub double %414, %411
  %416 = fadd double %412, %415
  %417 = fmul double %403, %416
  %418 = fadd double %404, %417
  %419 = fsub double %418, %404
  %420 = fsub double %417, %419
  %421 = fmul double %418, %418
  %422 = fneg double %421
  %423 = tail call double @llvm.fma.f64(double %418, double %418, double %422)
  %424 = fmul double %420, 2.000000e+00
  %425 = tail call double @llvm.fma.f64(double %418, double %424, double %423)
  %426 = fadd double %421, %425
  %427 = fsub double %426, %421
  %428 = fsub double %425, %427
  %429 = tail call double @llvm.fma.f64(double %426, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %430 = tail call double @llvm.fma.f64(double %426, double %429, double 0x3FBE25E43ABE935A)
  %431 = tail call double @llvm.fma.f64(double %426, double %430, double 0x3FC110EF47E6C9C2)
  %432 = tail call double @llvm.fma.f64(double %426, double %431, double 0x3FC3B13BCFA74449)
  %433 = tail call double @llvm.fma.f64(double %426, double %432, double 0x3FC745D171BF3C30)
  %434 = tail call double @llvm.fma.f64(double %426, double %433, double 0x3FCC71C71C7792CE)
  %435 = tail call double @llvm.fma.f64(double %426, double %434, double 0x3FD24924924920DA)
  %436 = tail call double @llvm.fma.f64(double %426, double %435, double 0x3FD999999999999C)
  %437 = sitofp i32 %393 to double
  %438 = fmul double %437, 0x3FE62E42FEFA39EF
  %439 = fneg double %438
  %440 = tail call double @llvm.fma.f64(double %437, double 0x3FE62E42FEFA39EF, double %439)
  %441 = tail call double @llvm.fma.f64(double %437, double 0x3C7ABC9E3B39803F, double %440)
  %442 = fadd double %438, %441
  %443 = fsub double %442, %438
  %444 = fsub double %441, %443
  %445 = tail call double @llvm.amdgcn.ldexp.f64(double %418, i32 1)
  %446 = tail call double @llvm.amdgcn.ldexp.f64(double %420, i32 1)
  %447 = fmul double %418, %426
  %448 = fneg double %447
  %449 = tail call double @llvm.fma.f64(double %426, double %418, double %448)
  %450 = tail call double @llvm.fma.f64(double %426, double %420, double %449)
  %451 = tail call double @llvm.fma.f64(double %428, double %418, double %450)
  %452 = fadd double %447, %451
  %453 = fsub double %452, %447
  %454 = fsub double %451, %453
  %455 = fmul double %426, %436
  %456 = fneg double %455
  %457 = tail call double @llvm.fma.f64(double %426, double %436, double %456)
  %458 = tail call double @llvm.fma.f64(double %428, double %436, double %457)
  %459 = fadd double %455, %458
  %460 = fsub double %459, %455
  %461 = fsub double %458, %460
  %462 = fadd double %459, 0x3FE5555555555555
  %463 = fadd double %462, 0xBFE5555555555555
  %464 = fsub double %459, %463
  %465 = fadd double %461, 0x3C8543B0D5DF274D
  %466 = fadd double %465, %464
  %467 = fadd double %462, %466
  %468 = fsub double %467, %462
  %469 = fsub double %466, %468
  %470 = fmul double %452, %467
  %471 = fneg double %470
  %472 = tail call double @llvm.fma.f64(double %452, double %467, double %471)
  %473 = tail call double @llvm.fma.f64(double %452, double %469, double %472)
  %474 = tail call double @llvm.fma.f64(double %454, double %467, double %473)
  %475 = fadd double %470, %474
  %476 = fsub double %475, %470
  %477 = fsub double %474, %476
  %478 = fadd double %445, %475
  %479 = fsub double %478, %445
  %480 = fsub double %475, %479
  %481 = fadd double %446, %477
  %482 = fadd double %481, %480
  %483 = fadd double %478, %482
  %484 = fsub double %483, %478
  %485 = fsub double %482, %484
  %486 = fadd double %442, %483
  %487 = fsub double %486, %442
  %488 = fsub double %486, %487
  %489 = fsub double %442, %488
  %490 = fsub double %483, %487
  %491 = fadd double %490, %489
  %492 = fadd double %444, %485
  %493 = fsub double %492, %444
  %494 = fsub double %492, %493
  %495 = fsub double %444, %494
  %496 = fsub double %485, %493
  %497 = fadd double %496, %495
  %498 = fadd double %492, %491
  %499 = fadd double %486, %498
  %500 = fsub double %499, %486
  %501 = fsub double %498, %500
  %502 = fadd double %497, %501
  %503 = fadd double %499, %502
  %504 = fsub double %503, %499
  %505 = fsub double %502, %504
  %506 = fmul double %386, %503
  %507 = fneg double %506
  %508 = tail call double @llvm.fma.f64(double %386, double %503, double %507)
  %509 = tail call double @llvm.fma.f64(double %386, double %505, double %508)
  %510 = fadd double %506, %509
  %511 = fsub double %510, %506
  %512 = fsub double %509, %511
  %513 = tail call double @llvm.fabs.f64(double %506) #3
  %514 = fcmp oeq double %513, 0x7FF0000000000000
  %515 = select i1 %514, double %506, double %510
  %516 = tail call double @llvm.fabs.f64(double %515) #3
  %517 = fcmp oeq double %516, 0x7FF0000000000000
  %518 = select i1 %517, double 0.000000e+00, double %512
  %519 = fmul double %515, 0x3FF71547652B82FE
  %520 = tail call double @llvm.rint.f64(double %519)
  %521 = fneg double %520
  %522 = tail call double @llvm.fma.f64(double %521, double 0x3FE62E42FEFA39EF, double %515)
  %523 = tail call double @llvm.fma.f64(double %521, double 0x3C7ABC9E3B39803F, double %522)
  %524 = tail call double @llvm.fma.f64(double %523, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %525 = tail call double @llvm.fma.f64(double %523, double %524, double 0x3EC71DEE623FDE64)
  %526 = tail call double @llvm.fma.f64(double %523, double %525, double 0x3EFA01997C89E6B0)
  %527 = tail call double @llvm.fma.f64(double %523, double %526, double 0x3F2A01A014761F6E)
  %528 = tail call double @llvm.fma.f64(double %523, double %527, double 0x3F56C16C1852B7B0)
  %529 = tail call double @llvm.fma.f64(double %523, double %528, double 0x3F81111111122322)
  %530 = tail call double @llvm.fma.f64(double %523, double %529, double 0x3FA55555555502A1)
  %531 = tail call double @llvm.fma.f64(double %523, double %530, double 0x3FC5555555555511)
  %532 = tail call double @llvm.fma.f64(double %523, double %531, double 0x3FE000000000000B)
  %533 = tail call double @llvm.fma.f64(double %523, double %532, double 1.000000e+00)
  %534 = tail call double @llvm.fma.f64(double %523, double %533, double 1.000000e+00)
  %535 = fptosi double %520 to i32
  %536 = tail call double @llvm.amdgcn.ldexp.f64(double %534, i32 %535)
  %537 = fcmp ogt double %515, 1.024000e+03
  %538 = select i1 %537, double 0x7FF0000000000000, double %536
  %539 = fcmp olt double %515, -1.075000e+03
  %540 = select i1 %539, double 0.000000e+00, double %538
  %541 = tail call double @llvm.fma.f64(double %540, double %518, double %540)
  %542 = tail call double @llvm.fabs.f64(double %540) #3
  %543 = fcmp oeq double %542, 0x7FF0000000000000
  %544 = select i1 %543, double %540, double %541
  %545 = tail call double @llvm.fabs.f64(double %386)
  %546 = tail call double @llvm.trunc.f64(double %545)
  %547 = fcmp oeq double %545, %546
  %548 = zext i1 %547 to i32
  %549 = fmul double %546, 5.000000e-01
  %550 = tail call double @llvm.amdgcn.fract.f64(double %549)
  %551 = tail call i1 @llvm.amdgcn.class.f64(double %549, i32 516)
  %552 = select i1 %551, double 0.000000e+00, double %550
  %553 = fcmp oeq double %552, 0.000000e+00
  %554 = and i1 %547, %553
  %555 = zext i1 %554 to i32
  %556 = add nuw nsw i32 %555, %548
  %557 = icmp eq i32 %556, 1
  %558 = fcmp olt double %62, 0.000000e+00
  %559 = and i1 %558, %557
  %560 = select i1 %559, double -0.000000e+00, double 0.000000e+00
  %561 = tail call double @llvm.copysign.f64(double %544, double %560)
  %562 = fcmp olt double %386, 0.000000e+00
  %563 = select i1 %562, double 0x7FF0000000000000, double 0.000000e+00
  %564 = select i1 %562, double 0.000000e+00, double 0x7FF0000000000000
  %565 = fcmp oeq double %62, 0.000000e+00
  %566 = select i1 %565, double %563, double %561
  %567 = fcmp oeq double %387, 0x7FF0000000000000
  %568 = select i1 %567, double %564, double %566
  %569 = fcmp oeq double %545, 0x7FF0000000000000
  %570 = fcmp olt double %387, 1.000000e+00
  %571 = select i1 %570, double %563, double %564
  %572 = select i1 %569, double %571, double %568
  %573 = fcmp oeq double %386, 0.000000e+00
  %574 = or i1 %565, %567
  %575 = select i1 %574, double 0x7FF8000000000000, double 1.000000e+00
  %576 = select i1 %573, double %575, double %572
  %577 = fcmp oeq double %62, 1.000000e+00
  %578 = select i1 %569, double 0x7FF8000000000000, double 1.000000e+00
  %579 = select i1 %577, double %578, double %576
  %580 = fcmp ult double %62, 0.000000e+00
  %581 = fcmp uno double %386, 0.000000e+00
  %582 = or i1 %580, %581
  %583 = select i1 %582, double 0x7FF8000000000000, double %579
  %584 = fcmp ult double %35, 0.000000e+00
  br i1 %584, label %592, label %585

585:                                              ; preds = %367
  %586 = fmul double %135, %583
  %587 = fmul double %583, %586
  %588 = fmul double %385, %587
  %589 = fdiv double %588, %63
  %590 = fcmp ogt double %35, 0x406573FAE561F647
  %591 = select i1 %590, double 0x7FF0000000000000, double %589
  br label %626

592:                                              ; preds = %367
  br i1 %65, label %593, label %626

593:                                              ; preds = %592
  %594 = fcmp ult double %35, -1.705000e+02
  br i1 %594, label %602, label %595

595:                                              ; preds = %593
  %596 = fmul double %63, 0x400921FB54442D18
  %597 = fmul double %135, %583
  %598 = fmul double %583, %597
  %599 = fmul double %385, %598
  %600 = fmul double %599, %112
  %601 = fdiv double %596, %600
  br label %613

602:                                              ; preds = %593
  %603 = fcmp ult double %35, -1.840000e+02
  br i1 %603, label %611, label %604

604:                                              ; preds = %602
  %605 = fmul double %63, 0x400921FB54442D18
  %606 = fmul double %135, %583
  %607 = fmul double %385, %606
  %608 = fdiv double %605, %607
  %609 = fmul double %583, %112
  %610 = fdiv double %608, %609
  br label %613

611:                                              ; preds = %602
  %612 = tail call double @llvm.copysign.f64(double 0.000000e+00, double %112)
  br label %613

613:                                              ; preds = %611, %604, %595
  %614 = phi double [ %601, %595 ], [ %610, %604 ], [ %612, %611 ]
  %615 = tail call double @llvm.amdgcn.fract.f64(double %35)
  %616 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 516)
  %617 = select i1 %616, double 0.000000e+00, double %615
  %618 = fcmp oeq double %617, 0.000000e+00
  %619 = select i1 %618, double 0x7FF8000000000000, double %614
  br label %626

620:                                              ; preds = %32
  %621 = tail call double @llvm.fma.f64(double %35, double 0x3FEF6A51055096B5, double 0xBFED0A118F324B63)
  %622 = tail call double @llvm.fma.f64(double %35, double %621, double 0x3FEFA658C23B1578)
  %623 = tail call double @llvm.fma.f64(double %35, double %622, double 0xBFE2788CFC6FB619)
  %624 = fdiv double 1.000000e+00, %35
  %625 = fadd double %624, %623
  br label %626

626:                                              ; preds = %352, %356, %585, %592, %613, %620
  %627 = phi double [ %625, %620 ], [ %355, %352 ], [ %366, %356 ], [ %591, %585 ], [ %619, %613 ], [ %35, %592 ]
  %628 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %627, double addrspace(1)* %628, align 8, !tbaa !16
  br label %629

629:                                              ; preds = %626, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
