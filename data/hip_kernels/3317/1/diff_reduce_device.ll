; ModuleID = '../data/hip_kernels/3317/1/main.cu'
source_filename = "../data/hip_kernels/3317/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11diff_reducePdS_S_iiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %17, %3
  %27 = mul nsw i32 %25, %3
  %28 = mul nsw i32 %17, %4
  %29 = mul nsw i32 %25, %4
  %30 = icmp ne i32 %17, %25
  %31 = icmp slt i32 %17, %7
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %25, %7
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %361

35:                                               ; preds = %8
  %36 = icmp sgt i32 %3, 0
  br i1 %36, label %37, label %65

37:                                               ; preds = %35
  %38 = and i32 %3, 7
  %39 = icmp ult i32 %3, 8
  br i1 %39, label %42, label %40

40:                                               ; preds = %37
  %41 = and i32 %3, -8
  br label %73

42:                                               ; preds = %73, %37
  %43 = phi double [ undef, %37 ], [ %171, %73 ]
  %44 = phi i32 [ 0, %37 ], [ %172, %73 ]
  %45 = phi double [ 0.000000e+00, %37 ], [ %171, %73 ]
  %46 = icmp eq i32 %38, 0
  br i1 %46, label %65, label %47

47:                                               ; preds = %42, %47
  %48 = phi i32 [ %62, %47 ], [ %44, %42 ]
  %49 = phi double [ %61, %47 ], [ %45, %42 ]
  %50 = phi i32 [ %63, %47 ], [ 0, %42 ]
  %51 = add nsw i32 %48, %26
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !5
  %55 = add nsw i32 %48, %27
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %1, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = fsub contract double %54, %58
  %60 = fmul contract double %59, %59
  %61 = fadd contract double %49, %60
  %62 = add nuw nsw i32 %48, 1
  %63 = add i32 %50, 1
  %64 = icmp eq i32 %63, %38
  br i1 %64, label %65, label %47, !llvm.loop !11

65:                                               ; preds = %42, %47, %35
  %66 = phi double [ 0.000000e+00, %35 ], [ %43, %42 ], [ %61, %47 ]
  %67 = icmp sgt i32 %4, 0
  br i1 %67, label %68, label %300

68:                                               ; preds = %65
  %69 = and i32 %4, 7
  %70 = icmp ult i32 %4, 8
  br i1 %70, label %277, label %71

71:                                               ; preds = %68
  %72 = and i32 %4, -8
  br label %175

73:                                               ; preds = %73, %40
  %74 = phi i32 [ 0, %40 ], [ %172, %73 ]
  %75 = phi double [ 0.000000e+00, %40 ], [ %171, %73 ]
  %76 = phi i32 [ 0, %40 ], [ %173, %73 ]
  %77 = add nsw i32 %74, %26
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7, !amdgpu.noclobber !5
  %81 = add nsw i32 %74, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = fsub contract double %80, %84
  %86 = fmul contract double %85, %85
  %87 = fadd contract double %75, %86
  %88 = or i32 %74, 1
  %89 = add nsw i32 %88, %26
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %1, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !5
  %93 = add nsw i32 %88, %27
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %1, i64 %94
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !7, !amdgpu.noclobber !5
  %97 = fsub contract double %92, %96
  %98 = fmul contract double %97, %97
  %99 = fadd contract double %87, %98
  %100 = or i32 %74, 2
  %101 = add nsw i32 %100, %26
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %1, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = add nsw i32 %100, %27
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %1, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = fsub contract double %104, %108
  %110 = fmul contract double %109, %109
  %111 = fadd contract double %99, %110
  %112 = or i32 %74, 3
  %113 = add nsw i32 %112, %26
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7, !amdgpu.noclobber !5
  %117 = add nsw i32 %112, %27
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7, !amdgpu.noclobber !5
  %121 = fsub contract double %116, %120
  %122 = fmul contract double %121, %121
  %123 = fadd contract double %111, %122
  %124 = or i32 %74, 4
  %125 = add nsw i32 %124, %26
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %1, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7, !amdgpu.noclobber !5
  %129 = add nsw i32 %124, %27
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %1, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !7, !amdgpu.noclobber !5
  %133 = fsub contract double %128, %132
  %134 = fmul contract double %133, %133
  %135 = fadd contract double %123, %134
  %136 = or i32 %74, 5
  %137 = add nsw i32 %136, %26
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds double, double addrspace(1)* %1, i64 %138
  %140 = load double, double addrspace(1)* %139, align 8, !tbaa !7, !amdgpu.noclobber !5
  %141 = add nsw i32 %136, %27
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %1, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7, !amdgpu.noclobber !5
  %145 = fsub contract double %140, %144
  %146 = fmul contract double %145, %145
  %147 = fadd contract double %135, %146
  %148 = or i32 %74, 6
  %149 = add nsw i32 %148, %26
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds double, double addrspace(1)* %1, i64 %150
  %152 = load double, double addrspace(1)* %151, align 8, !tbaa !7, !amdgpu.noclobber !5
  %153 = add nsw i32 %148, %27
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds double, double addrspace(1)* %1, i64 %154
  %156 = load double, double addrspace(1)* %155, align 8, !tbaa !7, !amdgpu.noclobber !5
  %157 = fsub contract double %152, %156
  %158 = fmul contract double %157, %157
  %159 = fadd contract double %147, %158
  %160 = or i32 %74, 7
  %161 = add nsw i32 %160, %26
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds double, double addrspace(1)* %1, i64 %162
  %164 = load double, double addrspace(1)* %163, align 8, !tbaa !7, !amdgpu.noclobber !5
  %165 = add nsw i32 %160, %27
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds double, double addrspace(1)* %1, i64 %166
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !7, !amdgpu.noclobber !5
  %169 = fsub contract double %164, %168
  %170 = fmul contract double %169, %169
  %171 = fadd contract double %159, %170
  %172 = add nuw nsw i32 %74, 8
  %173 = add i32 %76, 8
  %174 = icmp eq i32 %173, %41
  br i1 %174, label %42, label %73, !llvm.loop !13

175:                                              ; preds = %175, %71
  %176 = phi i32 [ 0, %71 ], [ %274, %175 ]
  %177 = phi double [ 0.000000e+00, %71 ], [ %273, %175 ]
  %178 = phi i32 [ 0, %71 ], [ %275, %175 ]
  %179 = add nsw i32 %176, %28
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds double, double addrspace(1)* %2, i64 %180
  %182 = load double, double addrspace(1)* %181, align 8, !tbaa !7, !amdgpu.noclobber !5
  %183 = add nsw i32 %176, %29
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double, double addrspace(1)* %2, i64 %184
  %186 = load double, double addrspace(1)* %185, align 8, !tbaa !7, !amdgpu.noclobber !5
  %187 = fsub contract double %182, %186
  %188 = fmul contract double %187, %187
  %189 = fadd contract double %177, %188
  %190 = or i32 %176, 1
  %191 = add nsw i32 %190, %28
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds double, double addrspace(1)* %2, i64 %192
  %194 = load double, double addrspace(1)* %193, align 8, !tbaa !7, !amdgpu.noclobber !5
  %195 = add nsw i32 %190, %29
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds double, double addrspace(1)* %2, i64 %196
  %198 = load double, double addrspace(1)* %197, align 8, !tbaa !7, !amdgpu.noclobber !5
  %199 = fsub contract double %194, %198
  %200 = fmul contract double %199, %199
  %201 = fadd contract double %189, %200
  %202 = or i32 %176, 2
  %203 = add nsw i32 %202, %28
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds double, double addrspace(1)* %2, i64 %204
  %206 = load double, double addrspace(1)* %205, align 8, !tbaa !7, !amdgpu.noclobber !5
  %207 = add nsw i32 %202, %29
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds double, double addrspace(1)* %2, i64 %208
  %210 = load double, double addrspace(1)* %209, align 8, !tbaa !7, !amdgpu.noclobber !5
  %211 = fsub contract double %206, %210
  %212 = fmul contract double %211, %211
  %213 = fadd contract double %201, %212
  %214 = or i32 %176, 3
  %215 = add nsw i32 %214, %28
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds double, double addrspace(1)* %2, i64 %216
  %218 = load double, double addrspace(1)* %217, align 8, !tbaa !7, !amdgpu.noclobber !5
  %219 = add nsw i32 %214, %29
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds double, double addrspace(1)* %2, i64 %220
  %222 = load double, double addrspace(1)* %221, align 8, !tbaa !7, !amdgpu.noclobber !5
  %223 = fsub contract double %218, %222
  %224 = fmul contract double %223, %223
  %225 = fadd contract double %213, %224
  %226 = or i32 %176, 4
  %227 = add nsw i32 %226, %28
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds double, double addrspace(1)* %2, i64 %228
  %230 = load double, double addrspace(1)* %229, align 8, !tbaa !7, !amdgpu.noclobber !5
  %231 = add nsw i32 %226, %29
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds double, double addrspace(1)* %2, i64 %232
  %234 = load double, double addrspace(1)* %233, align 8, !tbaa !7, !amdgpu.noclobber !5
  %235 = fsub contract double %230, %234
  %236 = fmul contract double %235, %235
  %237 = fadd contract double %225, %236
  %238 = or i32 %176, 5
  %239 = add nsw i32 %238, %28
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds double, double addrspace(1)* %2, i64 %240
  %242 = load double, double addrspace(1)* %241, align 8, !tbaa !7, !amdgpu.noclobber !5
  %243 = add nsw i32 %238, %29
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds double, double addrspace(1)* %2, i64 %244
  %246 = load double, double addrspace(1)* %245, align 8, !tbaa !7, !amdgpu.noclobber !5
  %247 = fsub contract double %242, %246
  %248 = fmul contract double %247, %247
  %249 = fadd contract double %237, %248
  %250 = or i32 %176, 6
  %251 = add nsw i32 %250, %28
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds double, double addrspace(1)* %2, i64 %252
  %254 = load double, double addrspace(1)* %253, align 8, !tbaa !7, !amdgpu.noclobber !5
  %255 = add nsw i32 %250, %29
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds double, double addrspace(1)* %2, i64 %256
  %258 = load double, double addrspace(1)* %257, align 8, !tbaa !7, !amdgpu.noclobber !5
  %259 = fsub contract double %254, %258
  %260 = fmul contract double %259, %259
  %261 = fadd contract double %249, %260
  %262 = or i32 %176, 7
  %263 = add nsw i32 %262, %28
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds double, double addrspace(1)* %2, i64 %264
  %266 = load double, double addrspace(1)* %265, align 8, !tbaa !7, !amdgpu.noclobber !5
  %267 = add nsw i32 %262, %29
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds double, double addrspace(1)* %2, i64 %268
  %270 = load double, double addrspace(1)* %269, align 8, !tbaa !7, !amdgpu.noclobber !5
  %271 = fsub contract double %266, %270
  %272 = fmul contract double %271, %271
  %273 = fadd contract double %261, %272
  %274 = add nuw nsw i32 %176, 8
  %275 = add i32 %178, 8
  %276 = icmp eq i32 %275, %72
  br i1 %276, label %277, label %175, !llvm.loop !15

277:                                              ; preds = %175, %68
  %278 = phi double [ undef, %68 ], [ %273, %175 ]
  %279 = phi i32 [ 0, %68 ], [ %274, %175 ]
  %280 = phi double [ 0.000000e+00, %68 ], [ %273, %175 ]
  %281 = icmp eq i32 %69, 0
  br i1 %281, label %300, label %282

282:                                              ; preds = %277, %282
  %283 = phi i32 [ %297, %282 ], [ %279, %277 ]
  %284 = phi double [ %296, %282 ], [ %280, %277 ]
  %285 = phi i32 [ %298, %282 ], [ 0, %277 ]
  %286 = add nsw i32 %283, %28
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds double, double addrspace(1)* %2, i64 %287
  %289 = load double, double addrspace(1)* %288, align 8, !tbaa !7, !amdgpu.noclobber !5
  %290 = add nsw i32 %283, %29
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds double, double addrspace(1)* %2, i64 %291
  %293 = load double, double addrspace(1)* %292, align 8, !tbaa !7, !amdgpu.noclobber !5
  %294 = fsub contract double %289, %293
  %295 = fmul contract double %294, %294
  %296 = fadd contract double %284, %295
  %297 = add nuw nsw i32 %283, 1
  %298 = add i32 %285, 1
  %299 = icmp eq i32 %298, %69
  br i1 %299, label %300, label %282, !llvm.loop !16

300:                                              ; preds = %277, %282, %65
  %301 = phi double [ 0.000000e+00, %65 ], [ %278, %277 ], [ %296, %282 ]
  %302 = fneg contract double %66
  %303 = mul nsw i32 %5, %3
  %304 = mul nsw i32 %303, %5
  %305 = sitofp i32 %304 to double
  %306 = fdiv contract double %302, %305
  %307 = fmul double %306, 0x3FF71547652B82FE
  %308 = tail call double @llvm.rint.f64(double %307)
  %309 = fneg double %308
  %310 = tail call double @llvm.fma.f64(double %309, double 0x3FE62E42FEFA39EF, double %306)
  %311 = tail call double @llvm.fma.f64(double %309, double 0x3C7ABC9E3B39803F, double %310)
  %312 = tail call double @llvm.fma.f64(double %311, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %313 = tail call double @llvm.fma.f64(double %311, double %312, double 0x3EC71DEE623FDE64)
  %314 = tail call double @llvm.fma.f64(double %311, double %313, double 0x3EFA01997C89E6B0)
  %315 = tail call double @llvm.fma.f64(double %311, double %314, double 0x3F2A01A014761F6E)
  %316 = tail call double @llvm.fma.f64(double %311, double %315, double 0x3F56C16C1852B7B0)
  %317 = tail call double @llvm.fma.f64(double %311, double %316, double 0x3F81111111122322)
  %318 = tail call double @llvm.fma.f64(double %311, double %317, double 0x3FA55555555502A1)
  %319 = tail call double @llvm.fma.f64(double %311, double %318, double 0x3FC5555555555511)
  %320 = tail call double @llvm.fma.f64(double %311, double %319, double 0x3FE000000000000B)
  %321 = tail call double @llvm.fma.f64(double %311, double %320, double 1.000000e+00)
  %322 = tail call double @llvm.fma.f64(double %311, double %321, double 1.000000e+00)
  %323 = fptosi double %308 to i32
  %324 = tail call double @llvm.amdgcn.ldexp.f64(double %322, i32 %323)
  %325 = fcmp ogt double %306, 1.024000e+03
  %326 = select i1 %325, double 0x7FF0000000000000, double %324
  %327 = fcmp olt double %306, -1.075000e+03
  %328 = select i1 %327, double 0.000000e+00, double %326
  %329 = fneg contract double %301
  %330 = mul nsw i32 %6, %4
  %331 = mul nsw i32 %330, %6
  %332 = sitofp i32 %331 to double
  %333 = fdiv contract double %329, %332
  %334 = fmul double %333, 0x3FF71547652B82FE
  %335 = tail call double @llvm.rint.f64(double %334)
  %336 = fneg double %335
  %337 = tail call double @llvm.fma.f64(double %336, double 0x3FE62E42FEFA39EF, double %333)
  %338 = tail call double @llvm.fma.f64(double %336, double 0x3C7ABC9E3B39803F, double %337)
  %339 = tail call double @llvm.fma.f64(double %338, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %340 = tail call double @llvm.fma.f64(double %338, double %339, double 0x3EC71DEE623FDE64)
  %341 = tail call double @llvm.fma.f64(double %338, double %340, double 0x3EFA01997C89E6B0)
  %342 = tail call double @llvm.fma.f64(double %338, double %341, double 0x3F2A01A014761F6E)
  %343 = tail call double @llvm.fma.f64(double %338, double %342, double 0x3F56C16C1852B7B0)
  %344 = tail call double @llvm.fma.f64(double %338, double %343, double 0x3F81111111122322)
  %345 = tail call double @llvm.fma.f64(double %338, double %344, double 0x3FA55555555502A1)
  %346 = tail call double @llvm.fma.f64(double %338, double %345, double 0x3FC5555555555511)
  %347 = tail call double @llvm.fma.f64(double %338, double %346, double 0x3FE000000000000B)
  %348 = tail call double @llvm.fma.f64(double %338, double %347, double 1.000000e+00)
  %349 = tail call double @llvm.fma.f64(double %338, double %348, double 1.000000e+00)
  %350 = fptosi double %335 to i32
  %351 = tail call double @llvm.amdgcn.ldexp.f64(double %349, i32 %350)
  %352 = fcmp ogt double %333, 1.024000e+03
  %353 = select i1 %352, double 0x7FF0000000000000, double %351
  %354 = fcmp olt double %333, -1.075000e+03
  %355 = select i1 %354, double 0.000000e+00, double %353
  %356 = fmul contract double %328, %355
  %357 = mul nsw i32 %25, %7
  %358 = add nsw i32 %357, %17
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds double, double addrspace(1)* %0, i64 %359
  store double %356, double addrspace(1)* %360, align 8, !tbaa !7
  br label %361

361:                                              ; preds = %8, %300
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
