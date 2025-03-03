; ModuleID = '../data/hip_kernels/1143/15/main.cu'
source_filename = "../data/hip_kernels/1143/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8cMultPhiP15HIP_vector_typeIdLj2EEPdS1_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
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
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !17, !amdgpu.noclobber !14
  %52 = tail call double @llvm.fabs.f64(double %51)
  %53 = fcmp olt double %52, 0x41D0000000000000
  br i1 %53, label %54, label %73

54:                                               ; preds = %3
  %55 = fmul double %52, 0x3FE45F306DC9C883
  %56 = tail call double @llvm.rint.f64(double %55)
  %57 = tail call double @llvm.fma.f64(double %56, double 0xBFF921FB54442D18, double %52)
  %58 = tail call double @llvm.fma.f64(double %56, double 0xBC91A62633145C00, double %57)
  %59 = fmul double %56, 0x3C91A62633145C00
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %56, double 0x3C91A62633145C00, double %60)
  %62 = fsub double %57, %59
  %63 = fsub double %57, %62
  %64 = fsub double %63, %59
  %65 = fsub double %62, %58
  %66 = fadd double %65, %64
  %67 = fsub double %66, %61
  %68 = tail call double @llvm.fma.f64(double %56, double 0xB97B839A252049C0, double %67)
  %69 = fadd double %58, %68
  %70 = fsub double %69, %58
  %71 = fsub double %68, %70
  %72 = fptosi double %56 to i32
  br label %149

73:                                               ; preds = %3
  %74 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 0)
  %75 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 1)
  %76 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 2)
  %77 = fcmp oge double %52, 0x7B00000000000000
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %52, i32 -128)
  %79 = select i1 %77, double %78, double %52
  %80 = fmul double %76, %79
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %76, double %79, double %81)
  %83 = fmul double %75, %79
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %75, double %79, double %84)
  %86 = fmul double %74, %79
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %74, double %79, double %87)
  %89 = fadd double %83, %88
  %90 = fsub double %89, %83
  %91 = fsub double %89, %90
  %92 = fsub double %88, %90
  %93 = fsub double %83, %91
  %94 = fadd double %92, %93
  %95 = fadd double %80, %85
  %96 = fsub double %95, %80
  %97 = fsub double %95, %96
  %98 = fsub double %85, %96
  %99 = fsub double %80, %97
  %100 = fadd double %98, %99
  %101 = fadd double %95, %94
  %102 = fsub double %101, %95
  %103 = fsub double %101, %102
  %104 = fsub double %94, %102
  %105 = fsub double %95, %103
  %106 = fadd double %104, %105
  %107 = fadd double %100, %106
  %108 = fadd double %82, %107
  %109 = fadd double %86, %89
  %110 = fsub double %109, %86
  %111 = fsub double %89, %110
  %112 = fadd double %111, %101
  %113 = fsub double %112, %111
  %114 = fsub double %101, %113
  %115 = fadd double %114, %108
  %116 = tail call double @llvm.amdgcn.ldexp.f64(double %109, i32 -2)
  %117 = tail call double @llvm.amdgcn.fract.f64(double %116)
  %118 = tail call i1 @llvm.amdgcn.class.f64(double %116, i32 516)
  %119 = select i1 %118, double 0.000000e+00, double %117
  %120 = tail call double @llvm.amdgcn.ldexp.f64(double %119, i32 2)
  %121 = fadd double %120, %112
  %122 = fcmp olt double %121, 0.000000e+00
  %123 = select i1 %122, double 4.000000e+00, double 0.000000e+00
  %124 = fadd double %120, %123
  %125 = fadd double %112, %124
  %126 = fptosi double %125 to i32
  %127 = sitofp i32 %126 to double
  %128 = fsub double %124, %127
  %129 = fadd double %112, %128
  %130 = fsub double %129, %128
  %131 = fsub double %112, %130
  %132 = fadd double %115, %131
  %133 = fcmp oge double %129, 5.000000e-01
  %134 = zext i1 %133 to i32
  %135 = add nsw i32 %134, %126
  %136 = select i1 %133, double 1.000000e+00, double 0.000000e+00
  %137 = fsub double %129, %136
  %138 = fadd double %137, %132
  %139 = fsub double %138, %137
  %140 = fsub double %132, %139
  %141 = fmul double %138, 0x3FF921FB54442D18
  %142 = fneg double %141
  %143 = tail call double @llvm.fma.f64(double %138, double 0x3FF921FB54442D18, double %142)
  %144 = tail call double @llvm.fma.f64(double %138, double 0x3C91A62633145C07, double %143)
  %145 = tail call double @llvm.fma.f64(double %140, double 0x3FF921FB54442D18, double %144)
  %146 = fadd double %141, %145
  %147 = fsub double %146, %141
  %148 = fsub double %145, %147
  br label %149

149:                                              ; preds = %54, %73
  %150 = phi double [ %71, %54 ], [ %148, %73 ]
  %151 = phi double [ %69, %54 ], [ %146, %73 ]
  %152 = phi i32 [ %72, %54 ], [ %135, %73 ]
  %153 = fmul double %151, %151
  %154 = fmul double %153, 5.000000e-01
  %155 = fsub double 1.000000e+00, %154
  %156 = fsub double 1.000000e+00, %155
  %157 = fsub double %156, %154
  %158 = fmul double %153, %153
  %159 = tail call double @llvm.fma.f64(double %153, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %160 = tail call double @llvm.fma.f64(double %153, double %159, double 0xBE927E4FA17F65F6)
  %161 = tail call double @llvm.fma.f64(double %153, double %160, double 0x3EFA01A019F4EC90)
  %162 = tail call double @llvm.fma.f64(double %153, double %161, double 0xBF56C16C16C16967)
  %163 = tail call double @llvm.fma.f64(double %153, double %162, double 0x3FA5555555555555)
  %164 = fneg double %150
  %165 = tail call double @llvm.fma.f64(double %151, double %164, double %157)
  %166 = tail call double @llvm.fma.f64(double %158, double %163, double %165)
  %167 = fadd double %155, %166
  %168 = tail call double @llvm.fma.f64(double %153, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %169 = tail call double @llvm.fma.f64(double %153, double %168, double 0x3EC71DE3796CDE01)
  %170 = tail call double @llvm.fma.f64(double %153, double %169, double 0xBF2A01A019E83E5C)
  %171 = tail call double @llvm.fma.f64(double %153, double %170, double 0x3F81111111110BB3)
  %172 = fneg double %153
  %173 = fmul double %151, %172
  %174 = fmul double %150, 5.000000e-01
  %175 = tail call double @llvm.fma.f64(double %173, double %171, double %174)
  %176 = tail call double @llvm.fma.f64(double %153, double %175, double %164)
  %177 = tail call double @llvm.fma.f64(double %173, double 0xBFC5555555555555, double %176)
  %178 = fsub double %151, %177
  %179 = fneg double %178
  %180 = and i32 %152, 1
  %181 = icmp eq i32 %180, 0
  %182 = select i1 %181, double %167, double %179
  %183 = bitcast double %182 to <2 x i32>
  %184 = tail call i1 @llvm.amdgcn.class.f64(double %52, i32 504)
  %185 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %49, i32 0, i32 0, i32 0, i64 0
  %186 = load double, double addrspace(1)* %185, align 16, !tbaa !21, !amdgpu.noclobber !14
  %187 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %49, i32 0, i32 0, i32 0, i64 1
  %188 = load double, double addrspace(1)* %187, align 8, !tbaa !21, !amdgpu.noclobber !14
  br i1 %53, label %189, label %286

189:                                              ; preds = %149
  %190 = fmul double %52, 0x3FE45F306DC9C883
  %191 = tail call double @llvm.rint.f64(double %190)
  %192 = tail call double @llvm.fma.f64(double %191, double 0xBFF921FB54442D18, double %52)
  %193 = tail call double @llvm.fma.f64(double %191, double 0xBC91A62633145C00, double %192)
  %194 = fmul double %191, 0x3C91A62633145C00
  %195 = fneg double %194
  %196 = tail call double @llvm.fma.f64(double %191, double 0x3C91A62633145C00, double %195)
  %197 = fsub double %192, %194
  %198 = fsub double %192, %197
  %199 = fsub double %198, %194
  %200 = fsub double %197, %193
  %201 = fadd double %200, %199
  %202 = fsub double %201, %196
  %203 = tail call double @llvm.fma.f64(double %191, double 0xB97B839A252049C0, double %202)
  %204 = fadd double %193, %203
  %205 = fsub double %204, %193
  %206 = fsub double %203, %205
  %207 = fptosi double %191 to i32
  %208 = fmul double %204, %204
  %209 = fmul double %208, 5.000000e-01
  %210 = fsub double 1.000000e+00, %209
  %211 = fsub double 1.000000e+00, %210
  %212 = fsub double %211, %209
  %213 = fmul double %208, %208
  %214 = tail call double @llvm.fma.f64(double %208, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %215 = tail call double @llvm.fma.f64(double %208, double %214, double 0xBE927E4FA17F65F6)
  %216 = tail call double @llvm.fma.f64(double %208, double %215, double 0x3EFA01A019F4EC90)
  %217 = tail call double @llvm.fma.f64(double %208, double %216, double 0xBF56C16C16C16967)
  %218 = tail call double @llvm.fma.f64(double %208, double %217, double 0x3FA5555555555555)
  %219 = fneg double %206
  %220 = tail call double @llvm.fma.f64(double %204, double %219, double %212)
  %221 = tail call double @llvm.fma.f64(double %213, double %218, double %220)
  %222 = fadd double %210, %221
  %223 = tail call double @llvm.fma.f64(double %208, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %224 = tail call double @llvm.fma.f64(double %208, double %223, double 0x3EC71DE3796CDE01)
  %225 = tail call double @llvm.fma.f64(double %208, double %224, double 0xBF2A01A019E83E5C)
  %226 = tail call double @llvm.fma.f64(double %208, double %225, double 0x3F81111111110BB3)
  %227 = fneg double %208
  %228 = fmul double %204, %227
  %229 = fmul double %206, 5.000000e-01
  %230 = tail call double @llvm.fma.f64(double %228, double %226, double %229)
  %231 = tail call double @llvm.fma.f64(double %208, double %230, double %219)
  %232 = tail call double @llvm.fma.f64(double %228, double 0xBFC5555555555555, double %231)
  %233 = fsub double %204, %232
  %234 = and i32 %207, 1
  %235 = icmp eq i32 %234, 0
  %236 = select i1 %235, double %233, double %222
  %237 = bitcast double %51 to <2 x i32>
  %238 = extractelement <2 x i32> %237, i64 1
  %239 = fmul double %52, 0x3FE45F306DC9C883
  %240 = tail call double @llvm.rint.f64(double %239)
  %241 = tail call double @llvm.fma.f64(double %240, double 0xBFF921FB54442D18, double %52)
  %242 = tail call double @llvm.fma.f64(double %240, double 0xBC91A62633145C00, double %241)
  %243 = fmul double %240, 0x3C91A62633145C00
  %244 = fneg double %243
  %245 = tail call double @llvm.fma.f64(double %240, double 0x3C91A62633145C00, double %244)
  %246 = fsub double %241, %243
  %247 = fsub double %241, %246
  %248 = fsub double %247, %243
  %249 = fsub double %246, %242
  %250 = fadd double %249, %248
  %251 = fsub double %250, %245
  %252 = tail call double @llvm.fma.f64(double %240, double 0xB97B839A252049C0, double %251)
  %253 = fadd double %242, %252
  %254 = fsub double %253, %242
  %255 = fsub double %252, %254
  %256 = fptosi double %240 to i32
  %257 = fmul double %253, %253
  %258 = fmul double %257, 5.000000e-01
  %259 = fsub double 1.000000e+00, %258
  %260 = fsub double 1.000000e+00, %259
  %261 = fsub double %260, %258
  %262 = fmul double %257, %257
  %263 = tail call double @llvm.fma.f64(double %257, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %264 = tail call double @llvm.fma.f64(double %257, double %263, double 0xBE927E4FA17F65F6)
  %265 = tail call double @llvm.fma.f64(double %257, double %264, double 0x3EFA01A019F4EC90)
  %266 = tail call double @llvm.fma.f64(double %257, double %265, double 0xBF56C16C16C16967)
  %267 = tail call double @llvm.fma.f64(double %257, double %266, double 0x3FA5555555555555)
  %268 = fneg double %255
  %269 = tail call double @llvm.fma.f64(double %253, double %268, double %261)
  %270 = tail call double @llvm.fma.f64(double %262, double %267, double %269)
  %271 = fadd double %259, %270
  %272 = tail call double @llvm.fma.f64(double %257, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %273 = tail call double @llvm.fma.f64(double %257, double %272, double 0x3EC71DE3796CDE01)
  %274 = tail call double @llvm.fma.f64(double %257, double %273, double 0xBF2A01A019E83E5C)
  %275 = tail call double @llvm.fma.f64(double %257, double %274, double 0x3F81111111110BB3)
  %276 = fneg double %257
  %277 = fmul double %253, %276
  %278 = fmul double %255, 5.000000e-01
  %279 = tail call double @llvm.fma.f64(double %277, double %275, double %278)
  %280 = tail call double @llvm.fma.f64(double %257, double %279, double %268)
  %281 = tail call double @llvm.fma.f64(double %277, double 0xBFC5555555555555, double %280)
  %282 = fsub double %253, %281
  %283 = and i32 %256, 1
  %284 = icmp eq i32 %283, 0
  %285 = select i1 %284, double %282, double %271
  br label %497

286:                                              ; preds = %149
  %287 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 0)
  %288 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 1)
  %289 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 2)
  %290 = fcmp oge double %52, 0x7B00000000000000
  %291 = tail call double @llvm.amdgcn.ldexp.f64(double %52, i32 -128)
  %292 = select i1 %290, double %291, double %52
  %293 = fmul double %289, %292
  %294 = fneg double %293
  %295 = tail call double @llvm.fma.f64(double %289, double %292, double %294)
  %296 = fmul double %288, %292
  %297 = fneg double %296
  %298 = tail call double @llvm.fma.f64(double %288, double %292, double %297)
  %299 = fmul double %287, %292
  %300 = fneg double %299
  %301 = tail call double @llvm.fma.f64(double %287, double %292, double %300)
  %302 = fadd double %296, %301
  %303 = fsub double %302, %296
  %304 = fsub double %302, %303
  %305 = fsub double %301, %303
  %306 = fsub double %296, %304
  %307 = fadd double %305, %306
  %308 = fadd double %293, %298
  %309 = fsub double %308, %293
  %310 = fsub double %308, %309
  %311 = fsub double %298, %309
  %312 = fsub double %293, %310
  %313 = fadd double %311, %312
  %314 = fadd double %308, %307
  %315 = fsub double %314, %308
  %316 = fsub double %314, %315
  %317 = fsub double %307, %315
  %318 = fsub double %308, %316
  %319 = fadd double %317, %318
  %320 = fadd double %313, %319
  %321 = fadd double %295, %320
  %322 = fadd double %299, %302
  %323 = fsub double %322, %299
  %324 = fsub double %302, %323
  %325 = fadd double %324, %314
  %326 = fsub double %325, %324
  %327 = fsub double %314, %326
  %328 = fadd double %327, %321
  %329 = tail call double @llvm.amdgcn.ldexp.f64(double %322, i32 -2)
  %330 = tail call double @llvm.amdgcn.fract.f64(double %329)
  %331 = tail call i1 @llvm.amdgcn.class.f64(double %329, i32 516)
  %332 = select i1 %331, double 0.000000e+00, double %330
  %333 = tail call double @llvm.amdgcn.ldexp.f64(double %332, i32 2)
  %334 = fadd double %333, %325
  %335 = fcmp olt double %334, 0.000000e+00
  %336 = select i1 %335, double 4.000000e+00, double 0.000000e+00
  %337 = fadd double %333, %336
  %338 = fadd double %325, %337
  %339 = fptosi double %338 to i32
  %340 = sitofp i32 %339 to double
  %341 = fsub double %337, %340
  %342 = fadd double %325, %341
  %343 = fsub double %342, %341
  %344 = fsub double %325, %343
  %345 = fadd double %328, %344
  %346 = fcmp oge double %342, 5.000000e-01
  %347 = zext i1 %346 to i32
  %348 = add nsw i32 %347, %339
  %349 = select i1 %346, double 1.000000e+00, double 0.000000e+00
  %350 = fsub double %342, %349
  %351 = fadd double %350, %345
  %352 = fsub double %351, %350
  %353 = fsub double %345, %352
  %354 = fmul double %351, 0x3FF921FB54442D18
  %355 = fneg double %354
  %356 = tail call double @llvm.fma.f64(double %351, double 0x3FF921FB54442D18, double %355)
  %357 = tail call double @llvm.fma.f64(double %351, double 0x3C91A62633145C07, double %356)
  %358 = tail call double @llvm.fma.f64(double %353, double 0x3FF921FB54442D18, double %357)
  %359 = fadd double %354, %358
  %360 = fsub double %359, %354
  %361 = fsub double %358, %360
  %362 = fmul double %359, %359
  %363 = fmul double %362, 5.000000e-01
  %364 = fsub double 1.000000e+00, %363
  %365 = fsub double 1.000000e+00, %364
  %366 = fsub double %365, %363
  %367 = fmul double %362, %362
  %368 = tail call double @llvm.fma.f64(double %362, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %369 = tail call double @llvm.fma.f64(double %362, double %368, double 0xBE927E4FA17F65F6)
  %370 = tail call double @llvm.fma.f64(double %362, double %369, double 0x3EFA01A019F4EC90)
  %371 = tail call double @llvm.fma.f64(double %362, double %370, double 0xBF56C16C16C16967)
  %372 = tail call double @llvm.fma.f64(double %362, double %371, double 0x3FA5555555555555)
  %373 = fneg double %361
  %374 = tail call double @llvm.fma.f64(double %359, double %373, double %366)
  %375 = tail call double @llvm.fma.f64(double %367, double %372, double %374)
  %376 = fadd double %364, %375
  %377 = tail call double @llvm.fma.f64(double %362, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %378 = tail call double @llvm.fma.f64(double %362, double %377, double 0x3EC71DE3796CDE01)
  %379 = tail call double @llvm.fma.f64(double %362, double %378, double 0xBF2A01A019E83E5C)
  %380 = tail call double @llvm.fma.f64(double %362, double %379, double 0x3F81111111110BB3)
  %381 = fneg double %362
  %382 = fmul double %359, %381
  %383 = fmul double %361, 5.000000e-01
  %384 = tail call double @llvm.fma.f64(double %382, double %380, double %383)
  %385 = tail call double @llvm.fma.f64(double %362, double %384, double %373)
  %386 = tail call double @llvm.fma.f64(double %382, double 0xBFC5555555555555, double %385)
  %387 = fsub double %359, %386
  %388 = and i32 %348, 1
  %389 = icmp eq i32 %388, 0
  %390 = select i1 %389, double %387, double %376
  %391 = bitcast double %51 to <2 x i32>
  %392 = extractelement <2 x i32> %391, i64 1
  %393 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 0)
  %394 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 1)
  %395 = tail call double @llvm.amdgcn.trig.preop.f64(double %52, i32 2)
  %396 = fcmp oge double %52, 0x7B00000000000000
  %397 = tail call double @llvm.amdgcn.ldexp.f64(double %52, i32 -128)
  %398 = select i1 %396, double %397, double %52
  %399 = fmul double %395, %398
  %400 = fneg double %399
  %401 = tail call double @llvm.fma.f64(double %395, double %398, double %400)
  %402 = fmul double %394, %398
  %403 = fneg double %402
  %404 = tail call double @llvm.fma.f64(double %394, double %398, double %403)
  %405 = fmul double %393, %398
  %406 = fneg double %405
  %407 = tail call double @llvm.fma.f64(double %393, double %398, double %406)
  %408 = fadd double %402, %407
  %409 = fsub double %408, %402
  %410 = fsub double %408, %409
  %411 = fsub double %407, %409
  %412 = fsub double %402, %410
  %413 = fadd double %411, %412
  %414 = fadd double %399, %404
  %415 = fsub double %414, %399
  %416 = fsub double %414, %415
  %417 = fsub double %404, %415
  %418 = fsub double %399, %416
  %419 = fadd double %417, %418
  %420 = fadd double %414, %413
  %421 = fsub double %420, %414
  %422 = fsub double %420, %421
  %423 = fsub double %413, %421
  %424 = fsub double %414, %422
  %425 = fadd double %423, %424
  %426 = fadd double %419, %425
  %427 = fadd double %401, %426
  %428 = fadd double %405, %408
  %429 = fsub double %428, %405
  %430 = fsub double %408, %429
  %431 = fadd double %430, %420
  %432 = fsub double %431, %430
  %433 = fsub double %420, %432
  %434 = fadd double %433, %427
  %435 = tail call double @llvm.amdgcn.ldexp.f64(double %428, i32 -2)
  %436 = tail call double @llvm.amdgcn.fract.f64(double %435)
  %437 = tail call i1 @llvm.amdgcn.class.f64(double %435, i32 516)
  %438 = select i1 %437, double 0.000000e+00, double %436
  %439 = tail call double @llvm.amdgcn.ldexp.f64(double %438, i32 2)
  %440 = fadd double %439, %431
  %441 = fcmp olt double %440, 0.000000e+00
  %442 = select i1 %441, double 4.000000e+00, double 0.000000e+00
  %443 = fadd double %439, %442
  %444 = fadd double %431, %443
  %445 = fptosi double %444 to i32
  %446 = sitofp i32 %445 to double
  %447 = fsub double %443, %446
  %448 = fadd double %431, %447
  %449 = fsub double %448, %447
  %450 = fsub double %431, %449
  %451 = fadd double %434, %450
  %452 = fcmp oge double %448, 5.000000e-01
  %453 = zext i1 %452 to i32
  %454 = add nsw i32 %453, %445
  %455 = select i1 %452, double 1.000000e+00, double 0.000000e+00
  %456 = fsub double %448, %455
  %457 = fadd double %456, %451
  %458 = fsub double %457, %456
  %459 = fsub double %451, %458
  %460 = fmul double %457, 0x3FF921FB54442D18
  %461 = fneg double %460
  %462 = tail call double @llvm.fma.f64(double %457, double 0x3FF921FB54442D18, double %461)
  %463 = tail call double @llvm.fma.f64(double %457, double 0x3C91A62633145C07, double %462)
  %464 = tail call double @llvm.fma.f64(double %459, double 0x3FF921FB54442D18, double %463)
  %465 = fadd double %460, %464
  %466 = fsub double %465, %460
  %467 = fsub double %464, %466
  %468 = fmul double %465, %465
  %469 = fmul double %468, 5.000000e-01
  %470 = fsub double 1.000000e+00, %469
  %471 = fsub double 1.000000e+00, %470
  %472 = fsub double %471, %469
  %473 = fmul double %468, %468
  %474 = tail call double @llvm.fma.f64(double %468, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %475 = tail call double @llvm.fma.f64(double %468, double %474, double 0xBE927E4FA17F65F6)
  %476 = tail call double @llvm.fma.f64(double %468, double %475, double 0x3EFA01A019F4EC90)
  %477 = tail call double @llvm.fma.f64(double %468, double %476, double 0xBF56C16C16C16967)
  %478 = tail call double @llvm.fma.f64(double %468, double %477, double 0x3FA5555555555555)
  %479 = fneg double %467
  %480 = tail call double @llvm.fma.f64(double %465, double %479, double %472)
  %481 = tail call double @llvm.fma.f64(double %473, double %478, double %480)
  %482 = fadd double %470, %481
  %483 = tail call double @llvm.fma.f64(double %468, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %484 = tail call double @llvm.fma.f64(double %468, double %483, double 0x3EC71DE3796CDE01)
  %485 = tail call double @llvm.fma.f64(double %468, double %484, double 0xBF2A01A019E83E5C)
  %486 = tail call double @llvm.fma.f64(double %468, double %485, double 0x3F81111111110BB3)
  %487 = fneg double %468
  %488 = fmul double %465, %487
  %489 = fmul double %467, 5.000000e-01
  %490 = tail call double @llvm.fma.f64(double %488, double %486, double %489)
  %491 = tail call double @llvm.fma.f64(double %468, double %490, double %479)
  %492 = tail call double @llvm.fma.f64(double %488, double 0xBFC5555555555555, double %491)
  %493 = fsub double %465, %492
  %494 = and i32 %454, 1
  %495 = icmp eq i32 %494, 0
  %496 = select i1 %495, double %493, double %482
  br label %497

497:                                              ; preds = %189, %286
  %498 = phi i32 [ %238, %189 ], [ %392, %286 ]
  %499 = phi double [ %236, %189 ], [ %390, %286 ]
  %500 = phi i32 [ %207, %189 ], [ %348, %286 ]
  %501 = phi double [ %285, %189 ], [ %496, %286 ]
  %502 = phi i32 [ %256, %189 ], [ %454, %286 ]
  %503 = phi i32 [ %283, %189 ], [ %494, %286 ]
  %504 = phi double [ %282, %189 ], [ %493, %286 ]
  %505 = phi double [ %271, %189 ], [ %482, %286 ]
  %506 = bitcast double %499 to <2 x i32>
  %507 = bitcast double %501 to <2 x i32>
  %508 = shl i32 %502, 30
  %509 = xor i32 %508, %498
  %510 = and i32 %509, -2147483648
  %511 = extractelement <2 x i32> %507, i64 1
  %512 = xor i32 %511, %510
  %513 = insertelement <2 x i32> %507, i32 %512, i64 1
  %514 = select i1 %184, <2 x i32> %513, <2 x i32> <i32 0, i32 2146959360>
  %515 = bitcast <2 x i32> %514 to double
  %516 = fmul contract double %186, %515
  %517 = extractelement <2 x i32> %183, i64 1
  %518 = shl i32 %152, 30
  %519 = and i32 %518, -2147483648
  %520 = xor i32 %517, %519
  %521 = insertelement <2 x i32> %183, i32 %520, i64 1
  %522 = select i1 %184, <2 x i32> %521, <2 x i32> <i32 0, i32 2146959360>
  %523 = bitcast <2 x i32> %522 to double
  %524 = fmul contract double %186, %523
  %525 = extractelement <2 x i32> %506, i64 1
  %526 = shl i32 %500, 30
  %527 = xor i32 %526, %498
  %528 = and i32 %527, -2147483648
  %529 = xor i32 %525, %528
  %530 = insertelement <2 x i32> %506, i32 %529, i64 1
  %531 = select i1 %184, <2 x i32> %530, <2 x i32> <i32 0, i32 2146959360>
  %532 = bitcast <2 x i32> %531 to double
  %533 = fmul contract double %188, %532
  %534 = fsub contract double %524, %533
  %535 = fneg double %504
  %536 = icmp eq i32 %503, 0
  %537 = select i1 %536, double %505, double %535
  %538 = bitcast double %537 to <2 x i32>
  %539 = and i32 %508, -2147483648
  %540 = extractelement <2 x i32> %538, i64 1
  %541 = xor i32 %540, %539
  %542 = insertelement <2 x i32> %538, i32 %541, i64 1
  %543 = select i1 %184, <2 x i32> %542, <2 x i32> <i32 0, i32 2146959360>
  %544 = bitcast <2 x i32> %543 to double
  %545 = fmul contract double %188, %544
  %546 = fadd contract double %516, %545
  %547 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %49, i32 0, i32 0, i32 0, i64 0
  store double %534, double addrspace(1)* %547, align 16
  %548 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %49, i32 0, i32 0, i32 0, i64 1
  store double %546, double addrspace(1)* %548, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
