; ModuleID = '../data/hip_kernels/1143/61/main.cu'
source_filename = "../data/hip_kernels/1143/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8kstd_wfcPdS_S_S_dS_P15HIP_vector_typeIdLj2EE(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, double addrspace(1)* nocapture %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
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
  %59 = sext i32 %57 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !17, !amdgpu.noclobber !14
  %62 = sext i32 %56 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !17, !amdgpu.noclobber !14
  %65 = tail call double @llvm.fabs.f64(double %61)
  %66 = tail call double @llvm.fabs.f64(double %64)
  %67 = tail call double @llvm.maxnum.f64(double %66, double %65)
  %68 = tail call double @llvm.minnum.f64(double %66, double %65)
  %69 = fdiv double %68, %67
  %70 = fmul double %69, %69
  %71 = tail call double @llvm.fma.f64(double %70, double 0x3EEBA404B5E68A13, double 0xBF23E260BD3237F4)
  %72 = tail call double @llvm.fma.f64(double %70, double %71, double 0x3F4B2BB069EFB384)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double 0xBF67952DAF56DE9B)
  %74 = tail call double @llvm.fma.f64(double %70, double %73, double 0x3F7D6D43A595C56F)
  %75 = tail call double @llvm.fma.f64(double %70, double %74, double 0xBF8C6EA4A57D9582)
  %76 = tail call double @llvm.fma.f64(double %70, double %75, double 0x3F967E295F08B19F)
  %77 = tail call double @llvm.fma.f64(double %70, double %76, double 0xBF9E9AE6FC27006A)
  %78 = tail call double @llvm.fma.f64(double %70, double %77, double 0x3FA2C15B5711927A)
  %79 = tail call double @llvm.fma.f64(double %70, double %78, double 0xBFA59976E82D3FF0)
  %80 = tail call double @llvm.fma.f64(double %70, double %79, double 0x3FA82D5D6EF28734)
  %81 = tail call double @llvm.fma.f64(double %70, double %80, double 0xBFAAE5CE6A214619)
  %82 = tail call double @llvm.fma.f64(double %70, double %81, double 0x3FAE1BB48427B883)
  %83 = tail call double @llvm.fma.f64(double %70, double %82, double 0xBFB110E48B207F05)
  %84 = tail call double @llvm.fma.f64(double %70, double %83, double 0x3FB3B13657B87036)
  %85 = tail call double @llvm.fma.f64(double %70, double %84, double 0xBFB745D119378E4F)
  %86 = tail call double @llvm.fma.f64(double %70, double %85, double 0x3FBC71C717E1913C)
  %87 = tail call double @llvm.fma.f64(double %70, double %86, double 0xBFC2492492376B7D)
  %88 = tail call double @llvm.fma.f64(double %70, double %87, double 0x3FC99999999952CC)
  %89 = tail call double @llvm.fma.f64(double %70, double %88, double 0xBFD5555555555523)
  %90 = fmul double %70, %89
  %91 = tail call double @llvm.fma.f64(double %69, double %90, double %69)
  %92 = bitcast double %64 to <2 x i32>
  %93 = extractelement <2 x i32> %92, i64 1
  %94 = icmp slt i32 %93, 0
  %95 = fsub double 0x3FF921FB54442D18, %91
  %96 = fcmp olt double %66, %65
  %97 = select i1 %96, double %95, double %91
  %98 = fcmp uno double %64, %61
  %99 = fcmp oeq double %65, 0x7FF0000000000000
  %100 = fcmp oeq double %66, 0x7FF0000000000000
  %101 = and i1 %99, %100
  %102 = select i1 %94, double 0x4002D97C7F3321D2, double 0x3FE921FB54442D18
  %103 = tail call double @llvm.copysign.f64(double %102, double %61)
  %104 = fcmp oeq double %61, 0.000000e+00
  %105 = select i1 %94, double 0x400921FB54442D18, double 0.000000e+00
  %106 = fsub double 0x400921FB54442D18, %97
  %107 = select i1 %94, double %106, double %97
  %108 = select i1 %104, double %105, double %107
  %109 = select i1 %101, double %103, double %108
  %110 = select i1 %98, double 0x7FF8000000000000, double %109
  %111 = tail call double @llvm.copysign.f64(double %110, double %61)
  %112 = fmul contract double %111, %4
  %113 = tail call double @llvm.fabs.f64(double %112)
  %114 = fcmp ogt double %113, 0x401921FB54442D18
  br i1 %114, label %115, label %152

115:                                              ; preds = %7
  %116 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %113)
  %117 = tail call double @llvm.amdgcn.frexp.mant.f64(double %113)
  %118 = tail call double @llvm.amdgcn.ldexp.f64(double %117, i32 26)
  %119 = add i32 %116, -3
  %120 = icmp sgt i32 %119, 26
  br i1 %120, label %121, label %134

121:                                              ; preds = %115, %121
  %122 = phi double [ %131, %121 ], [ %118, %115 ]
  %123 = phi i32 [ %132, %121 ], [ %119, %115 ]
  %124 = fmul double %122, 0x3FE45F306DC9C883
  %125 = tail call double @llvm.rint.f64(double %124)
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %126, double 0x3FF921FB54442D18, double %122)
  %128 = fcmp olt double %127, 0.000000e+00
  %129 = select i1 %128, double 0x3FF921FB54442D18, double -0.000000e+00
  %130 = fadd double %127, %129
  %131 = tail call double @llvm.amdgcn.ldexp.f64(double %130, i32 26)
  %132 = add nsw i32 %123, -26
  %133 = icmp ugt i32 %123, 52
  br i1 %133, label %121, label %134

134:                                              ; preds = %121, %115
  %135 = phi i32 [ %119, %115 ], [ %132, %121 ]
  %136 = phi double [ %118, %115 ], [ %131, %121 ]
  %137 = add nsw i32 %135, -25
  %138 = tail call double @llvm.amdgcn.ldexp.f64(double %136, i32 %137)
  %139 = fmul double %138, 0x3FE45F306DC9C883
  %140 = tail call double @llvm.rint.f64(double %139)
  %141 = fneg double %140
  %142 = tail call double @llvm.fma.f64(double %141, double 0x3FF921FB54442D18, double %138)
  %143 = fcmp olt double %142, 0.000000e+00
  %144 = select i1 %143, double 0x3FF921FB54442D18, double -0.000000e+00
  %145 = fadd double %142, %144
  %146 = tail call double @llvm.amdgcn.ldexp.f64(double %145, i32 2)
  %147 = bitcast double %112 to i64
  %148 = and i64 %147, -9223372036854775808
  %149 = bitcast double %146 to i64
  %150 = xor i64 %148, %149
  %151 = bitcast i64 %150 to double
  br label %156

152:                                              ; preds = %7
  %153 = fcmp oeq double %113, 0x401921FB54442D18
  %154 = tail call double @llvm.copysign.f64(double 0.000000e+00, double %112)
  %155 = select i1 %153, double %154, double %112
  br label %156

156:                                              ; preds = %134, %152
  %157 = phi double [ %151, %134 ], [ %155, %152 ]
  %158 = tail call i1 @llvm.amdgcn.class.f64(double %112, i32 504)
  %159 = select i1 %158, double %157, double 0x7FF8000000000000
  %160 = fneg contract double %159
  %161 = sext i32 %55 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %5, i64 %161
  store double %160, double addrspace(1)* %162, align 8, !tbaa !17
  %163 = load double, double addrspace(1)* %63, align 8, !tbaa !17
  %164 = fmul contract double %163, %163
  %165 = getelementptr inbounds double, double addrspace(1)* %3, i64 14
  %166 = load double, double addrspace(1)* %165, align 8, !tbaa !17
  %167 = fmul contract double %166, %166
  %168 = getelementptr inbounds double, double addrspace(1)* %3, i64 15
  %169 = load double, double addrspace(1)* %168, align 8, !tbaa !17
  %170 = fmul contract double %167, %169
  %171 = fmul contract double %169, %170
  %172 = fdiv contract double %164, %171
  %173 = load double, double addrspace(1)* %60, align 8, !tbaa !17
  %174 = fmul contract double %173, %173
  %175 = getelementptr inbounds double, double addrspace(1)* %3, i64 16
  %176 = load double, double addrspace(1)* %175, align 8, !tbaa !17
  %177 = fmul contract double %167, %176
  %178 = fmul contract double %176, %177
  %179 = fdiv contract double %174, %178
  %180 = fadd contract double %172, %179
  %181 = sext i32 %58 to i64
  %182 = getelementptr inbounds double, double addrspace(1)* %2, i64 %181
  %183 = load double, double addrspace(1)* %182, align 8, !tbaa !17
  %184 = fmul contract double %183, %183
  %185 = getelementptr inbounds double, double addrspace(1)* %3, i64 17
  %186 = load double, double addrspace(1)* %185, align 8, !tbaa !17
  %187 = fmul contract double %167, %186
  %188 = fmul contract double %186, %187
  %189 = fdiv contract double %184, %188
  %190 = fadd contract double %180, %189
  %191 = fneg contract double %190
  %192 = fmul double %190, 0xBFF71547652B82FE
  %193 = tail call double @llvm.rint.f64(double %192)
  %194 = fneg double %193
  %195 = tail call double @llvm.fma.f64(double %194, double 0x3FE62E42FEFA39EF, double %191)
  %196 = tail call double @llvm.fma.f64(double %194, double 0x3C7ABC9E3B39803F, double %195)
  %197 = tail call double @llvm.fma.f64(double %196, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %198 = tail call double @llvm.fma.f64(double %196, double %197, double 0x3EC71DEE623FDE64)
  %199 = tail call double @llvm.fma.f64(double %196, double %198, double 0x3EFA01997C89E6B0)
  %200 = tail call double @llvm.fma.f64(double %196, double %199, double 0x3F2A01A014761F6E)
  %201 = tail call double @llvm.fma.f64(double %196, double %200, double 0x3F56C16C1852B7B0)
  %202 = tail call double @llvm.fma.f64(double %196, double %201, double 0x3F81111111122322)
  %203 = tail call double @llvm.fma.f64(double %196, double %202, double 0x3FA55555555502A1)
  %204 = tail call double @llvm.fma.f64(double %196, double %203, double 0x3FC5555555555511)
  %205 = tail call double @llvm.fma.f64(double %196, double %204, double 0x3FE000000000000B)
  %206 = tail call double @llvm.fma.f64(double %196, double %205, double 1.000000e+00)
  %207 = tail call double @llvm.fma.f64(double %196, double %206, double 1.000000e+00)
  %208 = fptosi double %193 to i32
  %209 = tail call double @llvm.amdgcn.ldexp.f64(double %207, i32 %208)
  %210 = fcmp olt double %190, -1.024000e+03
  %211 = select i1 %210, double 0x7FF0000000000000, double %209
  %212 = fcmp ogt double %190, 1.075000e+03
  %213 = select i1 %212, double 0.000000e+00, double %211
  %214 = tail call double @llvm.fabs.f64(double %160)
  %215 = fcmp olt double %214, 0x41D0000000000000
  br i1 %215, label %216, label %235

216:                                              ; preds = %156
  %217 = fmul double %214, 0x3FE45F306DC9C883
  %218 = tail call double @llvm.rint.f64(double %217)
  %219 = tail call double @llvm.fma.f64(double %218, double 0xBFF921FB54442D18, double %214)
  %220 = tail call double @llvm.fma.f64(double %218, double 0xBC91A62633145C00, double %219)
  %221 = fmul double %218, 0x3C91A62633145C00
  %222 = fneg double %221
  %223 = tail call double @llvm.fma.f64(double %218, double 0x3C91A62633145C00, double %222)
  %224 = fsub double %219, %221
  %225 = fsub double %219, %224
  %226 = fsub double %225, %221
  %227 = fsub double %224, %220
  %228 = fadd double %227, %226
  %229 = fsub double %228, %223
  %230 = tail call double @llvm.fma.f64(double %218, double 0xB97B839A252049C0, double %229)
  %231 = fadd double %220, %230
  %232 = fsub double %231, %220
  %233 = fsub double %230, %232
  %234 = fptosi double %218 to i32
  br label %311

235:                                              ; preds = %156
  %236 = tail call double @llvm.amdgcn.trig.preop.f64(double %214, i32 0)
  %237 = tail call double @llvm.amdgcn.trig.preop.f64(double %214, i32 1)
  %238 = tail call double @llvm.amdgcn.trig.preop.f64(double %214, i32 2)
  %239 = fcmp oge double %214, 0x7B00000000000000
  %240 = tail call double @llvm.amdgcn.ldexp.f64(double %214, i32 -128)
  %241 = select i1 %239, double %240, double %214
  %242 = fmul double %238, %241
  %243 = fneg double %242
  %244 = tail call double @llvm.fma.f64(double %238, double %241, double %243)
  %245 = fmul double %237, %241
  %246 = fneg double %245
  %247 = tail call double @llvm.fma.f64(double %237, double %241, double %246)
  %248 = fmul double %236, %241
  %249 = fneg double %248
  %250 = tail call double @llvm.fma.f64(double %236, double %241, double %249)
  %251 = fadd double %245, %250
  %252 = fsub double %251, %245
  %253 = fsub double %251, %252
  %254 = fsub double %250, %252
  %255 = fsub double %245, %253
  %256 = fadd double %254, %255
  %257 = fadd double %242, %247
  %258 = fsub double %257, %242
  %259 = fsub double %257, %258
  %260 = fsub double %247, %258
  %261 = fsub double %242, %259
  %262 = fadd double %260, %261
  %263 = fadd double %257, %256
  %264 = fsub double %263, %257
  %265 = fsub double %263, %264
  %266 = fsub double %256, %264
  %267 = fsub double %257, %265
  %268 = fadd double %266, %267
  %269 = fadd double %262, %268
  %270 = fadd double %244, %269
  %271 = fadd double %248, %251
  %272 = fsub double %271, %248
  %273 = fsub double %251, %272
  %274 = fadd double %273, %263
  %275 = fsub double %274, %273
  %276 = fsub double %263, %275
  %277 = fadd double %276, %270
  %278 = tail call double @llvm.amdgcn.ldexp.f64(double %271, i32 -2)
  %279 = tail call double @llvm.amdgcn.fract.f64(double %278)
  %280 = tail call i1 @llvm.amdgcn.class.f64(double %278, i32 516)
  %281 = select i1 %280, double 0.000000e+00, double %279
  %282 = tail call double @llvm.amdgcn.ldexp.f64(double %281, i32 2)
  %283 = fadd double %282, %274
  %284 = fcmp olt double %283, 0.000000e+00
  %285 = select i1 %284, double 4.000000e+00, double 0.000000e+00
  %286 = fadd double %282, %285
  %287 = fadd double %274, %286
  %288 = fptosi double %287 to i32
  %289 = sitofp i32 %288 to double
  %290 = fsub double %286, %289
  %291 = fadd double %274, %290
  %292 = fsub double %291, %290
  %293 = fsub double %274, %292
  %294 = fadd double %277, %293
  %295 = fcmp oge double %291, 5.000000e-01
  %296 = zext i1 %295 to i32
  %297 = add nsw i32 %296, %288
  %298 = select i1 %295, double 1.000000e+00, double 0.000000e+00
  %299 = fsub double %291, %298
  %300 = fadd double %299, %294
  %301 = fsub double %300, %299
  %302 = fsub double %294, %301
  %303 = fmul double %300, 0x3FF921FB54442D18
  %304 = fneg double %303
  %305 = tail call double @llvm.fma.f64(double %300, double 0x3FF921FB54442D18, double %304)
  %306 = tail call double @llvm.fma.f64(double %300, double 0x3C91A62633145C07, double %305)
  %307 = tail call double @llvm.fma.f64(double %302, double 0x3FF921FB54442D18, double %306)
  %308 = fadd double %303, %307
  %309 = fsub double %308, %303
  %310 = fsub double %307, %309
  br label %311

311:                                              ; preds = %216, %235
  %312 = phi double [ %233, %216 ], [ %310, %235 ]
  %313 = phi double [ %231, %216 ], [ %308, %235 ]
  %314 = phi i32 [ %234, %216 ], [ %297, %235 ]
  %315 = fmul double %313, %313
  %316 = fmul double %315, 5.000000e-01
  %317 = fsub double 1.000000e+00, %316
  %318 = fsub double 1.000000e+00, %317
  %319 = fsub double %318, %316
  %320 = fmul double %315, %315
  %321 = tail call double @llvm.fma.f64(double %315, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %322 = tail call double @llvm.fma.f64(double %315, double %321, double 0xBE927E4FA17F65F6)
  %323 = tail call double @llvm.fma.f64(double %315, double %322, double 0x3EFA01A019F4EC90)
  %324 = tail call double @llvm.fma.f64(double %315, double %323, double 0xBF56C16C16C16967)
  %325 = tail call double @llvm.fma.f64(double %315, double %324, double 0x3FA5555555555555)
  %326 = fneg double %312
  %327 = tail call double @llvm.fma.f64(double %313, double %326, double %319)
  %328 = tail call double @llvm.fma.f64(double %320, double %325, double %327)
  %329 = fadd double %317, %328
  %330 = tail call double @llvm.fma.f64(double %315, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %331 = tail call double @llvm.fma.f64(double %315, double %330, double 0x3EC71DE3796CDE01)
  %332 = tail call double @llvm.fma.f64(double %315, double %331, double 0xBF2A01A019E83E5C)
  %333 = tail call double @llvm.fma.f64(double %315, double %332, double 0x3F81111111110BB3)
  %334 = fneg double %315
  %335 = fmul double %313, %334
  %336 = fmul double %312, 5.000000e-01
  %337 = tail call double @llvm.fma.f64(double %335, double %333, double %336)
  %338 = tail call double @llvm.fma.f64(double %315, double %337, double %326)
  %339 = tail call double @llvm.fma.f64(double %335, double 0xBFC5555555555555, double %338)
  %340 = fsub double %313, %339
  %341 = fneg double %340
  %342 = and i32 %314, 1
  %343 = icmp eq i32 %342, 0
  %344 = select i1 %343, double %329, double %341
  %345 = bitcast double %344 to <2 x i32>
  %346 = shl i32 %314, 30
  %347 = and i32 %346, -2147483648
  %348 = extractelement <2 x i32> %345, i64 1
  %349 = xor i32 %348, %347
  %350 = insertelement <2 x i32> %345, i32 %349, i64 1
  %351 = tail call i1 @llvm.amdgcn.class.f64(double %214, i32 504)
  %352 = select i1 %351, <2 x i32> %350, <2 x i32> <i32 0, i32 2146959360>
  %353 = bitcast <2 x i32> %352 to double
  %354 = fmul contract double %213, %353
  %355 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %161, i32 0, i32 0, i32 0, i64 0
  store double %354, double addrspace(1)* %355, align 16, !tbaa !21
  %356 = load double, double addrspace(1)* %63, align 8, !tbaa !17
  %357 = fmul contract double %356, %356
  %358 = load double, double addrspace(1)* %165, align 8, !tbaa !17
  %359 = fmul contract double %358, %358
  %360 = load double, double addrspace(1)* %168, align 8, !tbaa !17
  %361 = fmul contract double %359, %360
  %362 = fmul contract double %360, %361
  %363 = fdiv contract double %357, %362
  %364 = load double, double addrspace(1)* %60, align 8, !tbaa !17
  %365 = fmul contract double %364, %364
  %366 = load double, double addrspace(1)* %175, align 8, !tbaa !17
  %367 = fmul contract double %359, %366
  %368 = fmul contract double %366, %367
  %369 = fdiv contract double %365, %368
  %370 = fadd contract double %363, %369
  %371 = load double, double addrspace(1)* %182, align 8, !tbaa !17
  %372 = fmul contract double %371, %371
  %373 = load double, double addrspace(1)* %185, align 8, !tbaa !17
  %374 = fmul contract double %359, %373
  %375 = fmul contract double %373, %374
  %376 = fdiv contract double %372, %375
  %377 = fadd contract double %370, %376
  %378 = fneg contract double %377
  %379 = fmul double %377, 0xBFF71547652B82FE
  %380 = tail call double @llvm.rint.f64(double %379)
  %381 = fneg double %380
  %382 = tail call double @llvm.fma.f64(double %381, double 0x3FE62E42FEFA39EF, double %378)
  %383 = tail call double @llvm.fma.f64(double %381, double 0x3C7ABC9E3B39803F, double %382)
  %384 = load double, double addrspace(1)* %162, align 8, !tbaa !17
  %385 = tail call double @llvm.fabs.f64(double %384)
  %386 = fcmp olt double %385, 0x41D0000000000000
  br i1 %386, label %387, label %406

387:                                              ; preds = %311
  %388 = fmul double %385, 0x3FE45F306DC9C883
  %389 = tail call double @llvm.rint.f64(double %388)
  %390 = tail call double @llvm.fma.f64(double %389, double 0xBFF921FB54442D18, double %385)
  %391 = tail call double @llvm.fma.f64(double %389, double 0xBC91A62633145C00, double %390)
  %392 = fmul double %389, 0x3C91A62633145C00
  %393 = fneg double %392
  %394 = tail call double @llvm.fma.f64(double %389, double 0x3C91A62633145C00, double %393)
  %395 = fsub double %390, %392
  %396 = fsub double %390, %395
  %397 = fsub double %396, %392
  %398 = fsub double %395, %391
  %399 = fadd double %398, %397
  %400 = fsub double %399, %394
  %401 = tail call double @llvm.fma.f64(double %389, double 0xB97B839A252049C0, double %400)
  %402 = fadd double %391, %401
  %403 = fsub double %402, %391
  %404 = fsub double %401, %403
  %405 = fptosi double %389 to i32
  br label %482

406:                                              ; preds = %311
  %407 = tail call double @llvm.amdgcn.trig.preop.f64(double %385, i32 0)
  %408 = tail call double @llvm.amdgcn.trig.preop.f64(double %385, i32 1)
  %409 = tail call double @llvm.amdgcn.trig.preop.f64(double %385, i32 2)
  %410 = fcmp oge double %385, 0x7B00000000000000
  %411 = tail call double @llvm.amdgcn.ldexp.f64(double %385, i32 -128)
  %412 = select i1 %410, double %411, double %385
  %413 = fmul double %409, %412
  %414 = fneg double %413
  %415 = tail call double @llvm.fma.f64(double %409, double %412, double %414)
  %416 = fmul double %408, %412
  %417 = fneg double %416
  %418 = tail call double @llvm.fma.f64(double %408, double %412, double %417)
  %419 = fmul double %407, %412
  %420 = fneg double %419
  %421 = tail call double @llvm.fma.f64(double %407, double %412, double %420)
  %422 = fadd double %416, %421
  %423 = fsub double %422, %416
  %424 = fsub double %422, %423
  %425 = fsub double %421, %423
  %426 = fsub double %416, %424
  %427 = fadd double %425, %426
  %428 = fadd double %413, %418
  %429 = fsub double %428, %413
  %430 = fsub double %428, %429
  %431 = fsub double %418, %429
  %432 = fsub double %413, %430
  %433 = fadd double %431, %432
  %434 = fadd double %428, %427
  %435 = fsub double %434, %428
  %436 = fsub double %434, %435
  %437 = fsub double %427, %435
  %438 = fsub double %428, %436
  %439 = fadd double %437, %438
  %440 = fadd double %433, %439
  %441 = fadd double %415, %440
  %442 = fadd double %419, %422
  %443 = fsub double %442, %419
  %444 = fsub double %422, %443
  %445 = fadd double %444, %434
  %446 = fsub double %445, %444
  %447 = fsub double %434, %446
  %448 = fadd double %447, %441
  %449 = tail call double @llvm.amdgcn.ldexp.f64(double %442, i32 -2)
  %450 = tail call double @llvm.amdgcn.fract.f64(double %449)
  %451 = tail call i1 @llvm.amdgcn.class.f64(double %449, i32 516)
  %452 = select i1 %451, double 0.000000e+00, double %450
  %453 = tail call double @llvm.amdgcn.ldexp.f64(double %452, i32 2)
  %454 = fadd double %453, %445
  %455 = fcmp olt double %454, 0.000000e+00
  %456 = select i1 %455, double 4.000000e+00, double 0.000000e+00
  %457 = fadd double %453, %456
  %458 = fadd double %445, %457
  %459 = fptosi double %458 to i32
  %460 = sitofp i32 %459 to double
  %461 = fsub double %457, %460
  %462 = fadd double %445, %461
  %463 = fsub double %462, %461
  %464 = fsub double %445, %463
  %465 = fadd double %448, %464
  %466 = fcmp oge double %462, 5.000000e-01
  %467 = zext i1 %466 to i32
  %468 = add nsw i32 %467, %459
  %469 = select i1 %466, double 1.000000e+00, double 0.000000e+00
  %470 = fsub double %462, %469
  %471 = fadd double %470, %465
  %472 = fsub double %471, %470
  %473 = fsub double %465, %472
  %474 = fmul double %471, 0x3FF921FB54442D18
  %475 = fneg double %474
  %476 = tail call double @llvm.fma.f64(double %471, double 0x3FF921FB54442D18, double %475)
  %477 = tail call double @llvm.fma.f64(double %471, double 0x3C91A62633145C07, double %476)
  %478 = tail call double @llvm.fma.f64(double %473, double 0x3FF921FB54442D18, double %477)
  %479 = fadd double %474, %478
  %480 = fsub double %479, %474
  %481 = fsub double %478, %480
  br label %482

482:                                              ; preds = %387, %406
  %483 = phi double [ %404, %387 ], [ %481, %406 ]
  %484 = phi double [ %402, %387 ], [ %479, %406 ]
  %485 = phi i32 [ %405, %387 ], [ %468, %406 ]
  %486 = fcmp ogt double %377, 1.075000e+03
  %487 = fcmp olt double %377, -1.024000e+03
  %488 = tail call double @llvm.fma.f64(double %383, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %489 = tail call double @llvm.fma.f64(double %383, double %488, double 0x3EC71DEE623FDE64)
  %490 = tail call double @llvm.fma.f64(double %383, double %489, double 0x3EFA01997C89E6B0)
  %491 = tail call double @llvm.fma.f64(double %383, double %490, double 0x3F2A01A014761F6E)
  %492 = tail call double @llvm.fma.f64(double %383, double %491, double 0x3F56C16C1852B7B0)
  %493 = tail call double @llvm.fma.f64(double %383, double %492, double 0x3F81111111122322)
  %494 = tail call double @llvm.fma.f64(double %383, double %493, double 0x3FA55555555502A1)
  %495 = tail call double @llvm.fma.f64(double %383, double %494, double 0x3FC5555555555511)
  %496 = tail call double @llvm.fma.f64(double %383, double %495, double 0x3FE000000000000B)
  %497 = tail call double @llvm.fma.f64(double %383, double %496, double 1.000000e+00)
  %498 = tail call double @llvm.fma.f64(double %383, double %497, double 1.000000e+00)
  %499 = fptosi double %380 to i32
  %500 = tail call double @llvm.amdgcn.ldexp.f64(double %498, i32 %499)
  %501 = select i1 %487, double 0x7FF0000000000000, double %500
  %502 = select i1 %486, double 0.000000e+00, double %501
  %503 = fneg contract double %502
  %504 = fmul double %484, %484
  %505 = fmul double %504, 5.000000e-01
  %506 = fsub double 1.000000e+00, %505
  %507 = fsub double 1.000000e+00, %506
  %508 = fsub double %507, %505
  %509 = fmul double %504, %504
  %510 = tail call double @llvm.fma.f64(double %504, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %511 = tail call double @llvm.fma.f64(double %504, double %510, double 0xBE927E4FA17F65F6)
  %512 = tail call double @llvm.fma.f64(double %504, double %511, double 0x3EFA01A019F4EC90)
  %513 = tail call double @llvm.fma.f64(double %504, double %512, double 0xBF56C16C16C16967)
  %514 = tail call double @llvm.fma.f64(double %504, double %513, double 0x3FA5555555555555)
  %515 = fneg double %483
  %516 = tail call double @llvm.fma.f64(double %484, double %515, double %508)
  %517 = tail call double @llvm.fma.f64(double %509, double %514, double %516)
  %518 = fadd double %506, %517
  %519 = tail call double @llvm.fma.f64(double %504, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %520 = tail call double @llvm.fma.f64(double %504, double %519, double 0x3EC71DE3796CDE01)
  %521 = tail call double @llvm.fma.f64(double %504, double %520, double 0xBF2A01A019E83E5C)
  %522 = tail call double @llvm.fma.f64(double %504, double %521, double 0x3F81111111110BB3)
  %523 = fneg double %504
  %524 = fmul double %484, %523
  %525 = fmul double %483, 5.000000e-01
  %526 = tail call double @llvm.fma.f64(double %524, double %522, double %525)
  %527 = tail call double @llvm.fma.f64(double %504, double %526, double %515)
  %528 = tail call double @llvm.fma.f64(double %524, double 0xBFC5555555555555, double %527)
  %529 = fsub double %484, %528
  %530 = and i32 %485, 1
  %531 = icmp eq i32 %530, 0
  %532 = select i1 %531, double %529, double %518
  %533 = bitcast double %532 to <2 x i32>
  %534 = shl i32 %485, 30
  %535 = bitcast double %384 to <2 x i32>
  %536 = extractelement <2 x i32> %535, i64 1
  %537 = xor i32 %534, %536
  %538 = and i32 %537, -2147483648
  %539 = extractelement <2 x i32> %533, i64 1
  %540 = xor i32 %539, %538
  %541 = insertelement <2 x i32> %533, i32 %540, i64 1
  %542 = tail call i1 @llvm.amdgcn.class.f64(double %385, i32 504)
  %543 = select i1 %542, <2 x i32> %541, <2 x i32> <i32 0, i32 2146959360>
  %544 = bitcast <2 x i32> %543 to double
  %545 = fmul contract double %503, %544
  %546 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %161, i32 0, i32 0, i32 0, i64 1
  store double %545, double addrspace(1)* %546, align 8, !tbaa !21
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
