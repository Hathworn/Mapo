; ModuleID = '../data/hip_kernels/16910/11/main.cu'
source_filename = "../data/hip_kernels/16910/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW = internal addrspace(3) global [213 x double] undef, align 16
@_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU = internal addrspace(3) global [3072 x double] undef, align 16
@_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS = internal addrspace(3) global [4 x double] undef, align 16
@_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup = internal addrspace(3) global [710 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11reNormalizePKdS0_S0_PdS1_S1_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = freeze i32 %9
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !4, !amdgpu.noclobber !8
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptosi double %15 to i32
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !4, !amdgpu.noclobber !8
  %19 = fptosi double %18 to i32
  %20 = freeze i32 %19
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 11
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !4, !amdgpu.noclobber !8
  %23 = fptosi double %22 to i32
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %26 = freeze i32 %25
  %27 = icmp sgt i32 %20, 0
  br i1 %27, label %28, label %53

28:                                               ; preds = %6
  %29 = and i32 %20, 3
  %30 = icmp ult i32 %20, 4
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %20, -4
  br label %61

33:                                               ; preds = %61, %28
  %34 = phi i32 [ 0, %28 ], [ %111, %61 ]
  %35 = icmp eq i32 %29, 0
  br i1 %35, label %53, label %36

36:                                               ; preds = %33, %36
  %37 = phi i32 [ %50, %36 ], [ %34, %33 ]
  %38 = phi i32 [ %51, %36 ], [ 0, %33 ]
  %39 = mul i32 %37, %16
  %40 = add i32 %39, %24
  %41 = mul i32 %40, %10
  %42 = add i32 %41, %26
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %3, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !4, !amdgpu.noclobber !8
  %46 = mul nsw i32 %37, %10
  %47 = add nsw i32 %46, %26
  %48 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %47
  %49 = addrspacecast double addrspace(3)* %48 to double*
  store volatile double %45, double* %49, align 8, !tbaa !4
  %50 = add nuw nsw i32 %37, 1
  %51 = add i32 %38, 1
  %52 = icmp eq i32 %51, %29
  br i1 %52, label %53, label %36, !llvm.loop !10

53:                                               ; preds = %33, %36, %6
  %54 = mul nsw i32 %20, %13
  %55 = icmp slt i32 %26, %54
  br i1 %55, label %56, label %131

56:                                               ; preds = %53
  %57 = mul nsw i32 %24, %13
  %58 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %59 = getelementptr i8, i8 addrspace(4)* %58, i64 4
  %60 = bitcast i8 addrspace(4)* %59 to i16 addrspace(4)*
  br label %114

61:                                               ; preds = %61, %31
  %62 = phi i32 [ 0, %31 ], [ %111, %61 ]
  %63 = phi i32 [ 0, %31 ], [ %112, %61 ]
  %64 = mul i32 %62, %16
  %65 = add i32 %64, %24
  %66 = mul i32 %65, %10
  %67 = add i32 %66, %26
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !4, !amdgpu.noclobber !8
  %71 = mul nsw i32 %62, %10
  %72 = add nsw i32 %71, %26
  %73 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %72
  %74 = addrspacecast double addrspace(3)* %73 to double*
  store volatile double %70, double* %74, align 8, !tbaa !4
  %75 = or i32 %62, 1
  %76 = mul i32 %75, %16
  %77 = add i32 %76, %24
  %78 = mul i32 %77, %10
  %79 = add i32 %78, %26
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !4, !amdgpu.noclobber !8
  %83 = mul nsw i32 %75, %10
  %84 = add nsw i32 %83, %26
  %85 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %84
  %86 = addrspacecast double addrspace(3)* %85 to double*
  store volatile double %82, double* %86, align 8, !tbaa !4
  %87 = or i32 %62, 2
  %88 = mul i32 %87, %16
  %89 = add i32 %88, %24
  %90 = mul i32 %89, %10
  %91 = add i32 %90, %26
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !4, !amdgpu.noclobber !8
  %95 = mul nsw i32 %87, %10
  %96 = add nsw i32 %95, %26
  %97 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %96
  %98 = addrspacecast double addrspace(3)* %97 to double*
  store volatile double %94, double* %98, align 8, !tbaa !4
  %99 = or i32 %62, 3
  %100 = mul i32 %99, %16
  %101 = add i32 %100, %24
  %102 = mul i32 %101, %10
  %103 = add i32 %102, %26
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %3, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !4, !amdgpu.noclobber !8
  %107 = mul nsw i32 %99, %10
  %108 = add nsw i32 %107, %26
  %109 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %108
  %110 = addrspacecast double addrspace(3)* %109 to double*
  store volatile double %106, double* %110, align 8, !tbaa !4
  %111 = add nuw nsw i32 %62, 4
  %112 = add i32 %63, 4
  %113 = icmp eq i32 %112, %32
  br i1 %113, label %33, label %61, !llvm.loop !12

114:                                              ; preds = %56, %114
  %115 = phi i32 [ %26, %56 ], [ %129, %114 ]
  %116 = srem i32 %115, %13
  %117 = add nsw i32 %116, %57
  %118 = sub nsw i32 %115, %116
  %119 = mul nsw i32 %118, %16
  %120 = add nsw i32 %117, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %4, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !4, !amdgpu.noclobber !8
  %124 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %115
  %125 = addrspacecast double addrspace(3)* %124 to double*
  store volatile double %123, double* %125, align 8, !tbaa !4
  %126 = load i16, i16 addrspace(4)* %60, align 4, !range !14, !invariant.load !8
  %127 = freeze i16 %126
  %128 = zext i16 %127 to i32
  %129 = add i32 %115, %128
  %130 = icmp slt i32 %129, %54
  br i1 %130, label %114, label %131, !llvm.loop !15

131:                                              ; preds = %114, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = icmp slt i32 %26, %20
  br i1 %132, label %133, label %256

133:                                              ; preds = %131
  %134 = icmp sgt i32 %13, 0
  br i1 %134, label %135, label %230

135:                                              ; preds = %133
  %136 = mul nsw i32 %26, %13
  %137 = and i32 %13, 7
  %138 = icmp ult i32 %13, 8
  br i1 %138, label %211, label %139

139:                                              ; preds = %135
  %140 = and i32 %13, -8
  br label %141

141:                                              ; preds = %141, %139
  %142 = phi double [ 0.000000e+00, %139 ], [ %207, %141 ]
  %143 = phi i32 [ 0, %139 ], [ %208, %141 ]
  %144 = phi i32 [ 0, %139 ], [ %209, %141 ]
  %145 = add nsw i32 %143, %136
  %146 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %145
  %147 = addrspacecast double addrspace(3)* %146 to double*
  %148 = load volatile double, double* %147, align 8, !tbaa !4
  %149 = load volatile double, double* %147, align 8, !tbaa !4
  %150 = fmul contract double %148, %149
  %151 = fadd contract double %142, %150
  %152 = or i32 %143, 1
  %153 = add nsw i32 %152, %136
  %154 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %153
  %155 = addrspacecast double addrspace(3)* %154 to double*
  %156 = load volatile double, double* %155, align 8, !tbaa !4
  %157 = load volatile double, double* %155, align 8, !tbaa !4
  %158 = fmul contract double %156, %157
  %159 = fadd contract double %151, %158
  %160 = or i32 %143, 2
  %161 = add nsw i32 %160, %136
  %162 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %161
  %163 = addrspacecast double addrspace(3)* %162 to double*
  %164 = load volatile double, double* %163, align 8, !tbaa !4
  %165 = load volatile double, double* %163, align 8, !tbaa !4
  %166 = fmul contract double %164, %165
  %167 = fadd contract double %159, %166
  %168 = or i32 %143, 3
  %169 = add nsw i32 %168, %136
  %170 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %169
  %171 = addrspacecast double addrspace(3)* %170 to double*
  %172 = load volatile double, double* %171, align 8, !tbaa !4
  %173 = load volatile double, double* %171, align 8, !tbaa !4
  %174 = fmul contract double %172, %173
  %175 = fadd contract double %167, %174
  %176 = or i32 %143, 4
  %177 = add nsw i32 %176, %136
  %178 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %177
  %179 = addrspacecast double addrspace(3)* %178 to double*
  %180 = load volatile double, double* %179, align 8, !tbaa !4
  %181 = load volatile double, double* %179, align 8, !tbaa !4
  %182 = fmul contract double %180, %181
  %183 = fadd contract double %175, %182
  %184 = or i32 %143, 5
  %185 = add nsw i32 %184, %136
  %186 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %185
  %187 = addrspacecast double addrspace(3)* %186 to double*
  %188 = load volatile double, double* %187, align 8, !tbaa !4
  %189 = load volatile double, double* %187, align 8, !tbaa !4
  %190 = fmul contract double %188, %189
  %191 = fadd contract double %183, %190
  %192 = or i32 %143, 6
  %193 = add nsw i32 %192, %136
  %194 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %193
  %195 = addrspacecast double addrspace(3)* %194 to double*
  %196 = load volatile double, double* %195, align 8, !tbaa !4
  %197 = load volatile double, double* %195, align 8, !tbaa !4
  %198 = fmul contract double %196, %197
  %199 = fadd contract double %191, %198
  %200 = or i32 %143, 7
  %201 = add nsw i32 %200, %136
  %202 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %201
  %203 = addrspacecast double addrspace(3)* %202 to double*
  %204 = load volatile double, double* %203, align 8, !tbaa !4
  %205 = load volatile double, double* %203, align 8, !tbaa !4
  %206 = fmul contract double %204, %205
  %207 = fadd contract double %199, %206
  %208 = add nuw nsw i32 %143, 8
  %209 = add i32 %144, 8
  %210 = icmp eq i32 %209, %140
  br i1 %210, label %211, label %141, !llvm.loop !16

211:                                              ; preds = %141, %135
  %212 = phi double [ undef, %135 ], [ %207, %141 ]
  %213 = phi double [ 0.000000e+00, %135 ], [ %207, %141 ]
  %214 = phi i32 [ 0, %135 ], [ %208, %141 ]
  %215 = icmp eq i32 %137, 0
  br i1 %215, label %230, label %216

216:                                              ; preds = %211, %216
  %217 = phi double [ %226, %216 ], [ %213, %211 ]
  %218 = phi i32 [ %227, %216 ], [ %214, %211 ]
  %219 = phi i32 [ %228, %216 ], [ 0, %211 ]
  %220 = add nsw i32 %218, %136
  %221 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %220
  %222 = addrspacecast double addrspace(3)* %221 to double*
  %223 = load volatile double, double* %222, align 8, !tbaa !4
  %224 = load volatile double, double* %222, align 8, !tbaa !4
  %225 = fmul contract double %223, %224
  %226 = fadd contract double %217, %225
  %227 = add nuw nsw i32 %218, 1
  %228 = add i32 %219, 1
  %229 = icmp eq i32 %228, %137
  br i1 %229, label %230, label %216, !llvm.loop !17

230:                                              ; preds = %211, %216, %133
  %231 = phi double [ 0.000000e+00, %133 ], [ %212, %211 ], [ %226, %216 ]
  %232 = fcmp olt double %231, 0x1000000000000000
  %233 = select i1 %232, double 0x4FF0000000000000, double 1.000000e+00
  %234 = fmul double %231, %233
  %235 = tail call double @llvm.amdgcn.rsq.f64(double %234)
  %236 = fmul double %234, %235
  %237 = fmul double %235, 5.000000e-01
  %238 = fneg double %237
  %239 = tail call double @llvm.fma.f64(double %238, double %236, double 5.000000e-01)
  %240 = tail call double @llvm.fma.f64(double %237, double %239, double %237)
  %241 = tail call double @llvm.fma.f64(double %236, double %239, double %236)
  %242 = fneg double %241
  %243 = tail call double @llvm.fma.f64(double %242, double %241, double %234)
  %244 = tail call double @llvm.fma.f64(double %243, double %240, double %241)
  %245 = fneg double %244
  %246 = tail call double @llvm.fma.f64(double %245, double %244, double %234)
  %247 = tail call double @llvm.fma.f64(double %246, double %240, double %244)
  %248 = select i1 %232, double 0x37F0000000000000, double 1.000000e+00
  %249 = fmul double %248, %247
  %250 = fcmp oeq double %234, 0.000000e+00
  %251 = fcmp oeq double %234, 0x7FF0000000000000
  %252 = or i1 %250, %251
  %253 = select i1 %252, double %234, double %249
  %254 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %26
  %255 = addrspacecast double addrspace(3)* %254 to double*
  store volatile double %253, double* %255, align 8, !tbaa !4
  br label %256

256:                                              ; preds = %230, %131
  %257 = icmp eq i32 %26, 0
  br i1 %257, label %258, label %372

258:                                              ; preds = %256
  br i1 %27, label %259, label %344

259:                                              ; preds = %258
  %260 = and i32 %20, 7
  %261 = icmp ult i32 %20, 8
  br i1 %261, label %326, label %262

262:                                              ; preds = %259
  %263 = and i32 %20, -8
  br label %264

264:                                              ; preds = %264, %262
  %265 = phi double [ 0x3E7AD7F2A0000000, %262 ], [ %322, %264 ]
  %266 = phi i32 [ 0, %262 ], [ %323, %264 ]
  %267 = phi i32 [ 0, %262 ], [ %324, %264 ]
  %268 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %266
  %269 = addrspacecast double addrspace(3)* %268 to double*
  %270 = load volatile double, double* %269, align 8, !tbaa !4
  %271 = load volatile double, double* %269, align 8, !tbaa !4
  %272 = fmul contract double %270, %271
  %273 = fadd contract double %265, %272
  %274 = or i32 %266, 1
  %275 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %274
  %276 = addrspacecast double addrspace(3)* %275 to double*
  %277 = load volatile double, double* %276, align 8, !tbaa !4
  %278 = load volatile double, double* %276, align 8, !tbaa !4
  %279 = fmul contract double %277, %278
  %280 = fadd contract double %273, %279
  %281 = or i32 %266, 2
  %282 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %281
  %283 = addrspacecast double addrspace(3)* %282 to double*
  %284 = load volatile double, double* %283, align 8, !tbaa !4
  %285 = load volatile double, double* %283, align 8, !tbaa !4
  %286 = fmul contract double %284, %285
  %287 = fadd contract double %280, %286
  %288 = or i32 %266, 3
  %289 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %288
  %290 = addrspacecast double addrspace(3)* %289 to double*
  %291 = load volatile double, double* %290, align 8, !tbaa !4
  %292 = load volatile double, double* %290, align 8, !tbaa !4
  %293 = fmul contract double %291, %292
  %294 = fadd contract double %287, %293
  %295 = or i32 %266, 4
  %296 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %295
  %297 = addrspacecast double addrspace(3)* %296 to double*
  %298 = load volatile double, double* %297, align 8, !tbaa !4
  %299 = load volatile double, double* %297, align 8, !tbaa !4
  %300 = fmul contract double %298, %299
  %301 = fadd contract double %294, %300
  %302 = or i32 %266, 5
  %303 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %302
  %304 = addrspacecast double addrspace(3)* %303 to double*
  %305 = load volatile double, double* %304, align 8, !tbaa !4
  %306 = load volatile double, double* %304, align 8, !tbaa !4
  %307 = fmul contract double %305, %306
  %308 = fadd contract double %301, %307
  %309 = or i32 %266, 6
  %310 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %309
  %311 = addrspacecast double addrspace(3)* %310 to double*
  %312 = load volatile double, double* %311, align 8, !tbaa !4
  %313 = load volatile double, double* %311, align 8, !tbaa !4
  %314 = fmul contract double %312, %313
  %315 = fadd contract double %308, %314
  %316 = or i32 %266, 7
  %317 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %316
  %318 = addrspacecast double addrspace(3)* %317 to double*
  %319 = load volatile double, double* %318, align 8, !tbaa !4
  %320 = load volatile double, double* %318, align 8, !tbaa !4
  %321 = fmul contract double %319, %320
  %322 = fadd contract double %315, %321
  %323 = add nuw nsw i32 %266, 8
  %324 = add nuw i32 %267, 8
  %325 = icmp eq i32 %324, %263
  br i1 %325, label %326, label %264, !llvm.loop !18

326:                                              ; preds = %264, %259
  %327 = phi double [ undef, %259 ], [ %322, %264 ]
  %328 = phi double [ 0x3E7AD7F2A0000000, %259 ], [ %322, %264 ]
  %329 = phi i32 [ 0, %259 ], [ %323, %264 ]
  %330 = icmp eq i32 %260, 0
  br i1 %330, label %344, label %331

331:                                              ; preds = %326, %331
  %332 = phi double [ %340, %331 ], [ %328, %326 ]
  %333 = phi i32 [ %341, %331 ], [ %329, %326 ]
  %334 = phi i32 [ %342, %331 ], [ 0, %326 ]
  %335 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %333
  %336 = addrspacecast double addrspace(3)* %335 to double*
  %337 = load volatile double, double* %336, align 8, !tbaa !4
  %338 = load volatile double, double* %336, align 8, !tbaa !4
  %339 = fmul contract double %337, %338
  %340 = fadd contract double %332, %339
  %341 = add nuw nsw i32 %333, 1
  %342 = add i32 %334, 1
  %343 = icmp eq i32 %342, %260
  br i1 %343, label %344, label %331, !llvm.loop !19

344:                                              ; preds = %326, %331, %258
  %345 = phi double [ 0x3E7AD7F2A0000000, %258 ], [ %327, %326 ], [ %340, %331 ]
  %346 = fcmp olt double %345, 0x1000000000000000
  %347 = select i1 %346, double 0x4FF0000000000000, double 1.000000e+00
  %348 = fmul double %345, %347
  %349 = tail call double @llvm.amdgcn.rsq.f64(double %348)
  %350 = fmul double %348, %349
  %351 = fmul double %349, 5.000000e-01
  %352 = fneg double %351
  %353 = tail call double @llvm.fma.f64(double %352, double %350, double 5.000000e-01)
  %354 = tail call double @llvm.fma.f64(double %351, double %353, double %351)
  %355 = tail call double @llvm.fma.f64(double %350, double %353, double %350)
  %356 = fneg double %355
  %357 = tail call double @llvm.fma.f64(double %356, double %355, double %348)
  %358 = tail call double @llvm.fma.f64(double %357, double %354, double %355)
  %359 = fneg double %358
  %360 = tail call double @llvm.fma.f64(double %359, double %358, double %348)
  %361 = tail call double @llvm.fma.f64(double %360, double %354, double %358)
  %362 = select i1 %346, double 0x37F0000000000000, double 1.000000e+00
  %363 = fmul double %362, %361
  %364 = fcmp oeq double %348, 0.000000e+00
  %365 = fcmp oeq double %348, 0x7FF0000000000000
  %366 = or i1 %364, %365
  %367 = select i1 %366, double %348, double %363
  %368 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %20
  %369 = addrspacecast double addrspace(3)* %368 to double*
  store volatile double %367, double* %369, align 8, !tbaa !4
  %370 = sext i32 %24 to i64
  %371 = getelementptr inbounds double, double addrspace(1)* %5, i64 %370
  store double %367, double addrspace(1)* %371, align 8, !tbaa !4
  br label %372

372:                                              ; preds = %344, %256
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %55, label %373, label %399

373:                                              ; preds = %372
  %374 = getelementptr inbounds [4 x double], [4 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sS, i32 0, i32 %20
  %375 = addrspacecast double addrspace(3)* %374 to double*
  %376 = mul nsw i32 %24, %13
  %377 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %378 = getelementptr i8, i8 addrspace(4)* %377, i64 4
  %379 = bitcast i8 addrspace(4)* %378 to i16 addrspace(4)*
  %380 = load i16, i16 addrspace(4)* %379, align 4, !range !14, !invariant.load !8
  %381 = freeze i16 %380
  %382 = zext i16 %381 to i32
  br label %383

383:                                              ; preds = %373, %383
  %384 = phi i32 [ %26, %373 ], [ %397, %383 ]
  %385 = getelementptr inbounds [3072 x double], [3072 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sU, i32 0, i32 %384
  %386 = addrspacecast double addrspace(3)* %385 to double*
  %387 = load volatile double, double* %386, align 8, !tbaa !4
  %388 = load volatile double, double* %375, align 8, !tbaa !4
  %389 = fdiv contract double %387, %388
  %390 = srem i32 %384, %13
  %391 = add nsw i32 %390, %376
  %392 = sub nsw i32 %384, %390
  %393 = mul nsw i32 %392, %16
  %394 = add nsw i32 %391, %393
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds double, double addrspace(1)* %4, i64 %395
  store double %389, double addrspace(1)* %396, align 8, !tbaa !4
  %397 = add i32 %384, %382
  %398 = icmp slt i32 %397, %54
  br i1 %398, label %383, label %399, !llvm.loop !20

399:                                              ; preds = %383, %372
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %400 = icmp sgt i32 %10, 0
  br i1 %400, label %401, label %431

401:                                              ; preds = %399
  %402 = and i32 %10, 7
  %403 = icmp ult i32 %10, 8
  br i1 %403, label %406, label %404

404:                                              ; preds = %401
  %405 = and i32 %10, -8
  br label %445

406:                                              ; preds = %542, %401
  %407 = phi i32 [ undef, %401 ], [ %543, %542 ]
  %408 = phi double [ 0.000000e+00, %401 ], [ %544, %542 ]
  %409 = phi i32 [ 0, %401 ], [ %545, %542 ]
  %410 = phi i32 [ 0, %401 ], [ %543, %542 ]
  %411 = icmp eq i32 %402, 0
  br i1 %411, label %431, label %412

412:                                              ; preds = %406, %425
  %413 = phi double [ %427, %425 ], [ %408, %406 ]
  %414 = phi i32 [ %428, %425 ], [ %409, %406 ]
  %415 = phi i32 [ %426, %425 ], [ %410, %406 ]
  %416 = phi i32 [ %429, %425 ], [ 0, %406 ]
  %417 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %414
  %418 = addrspacecast double addrspace(3)* %417 to double*
  %419 = load volatile double, double* %418, align 8, !tbaa !4
  %420 = tail call double @llvm.fabs.f64(double %419)
  %421 = fcmp contract ogt double %420, %413
  br i1 %421, label %422, label %425

422:                                              ; preds = %412
  %423 = load volatile double, double* %418, align 8, !tbaa !4
  %424 = tail call double @llvm.fabs.f64(double %423)
  br label %425

425:                                              ; preds = %422, %412
  %426 = phi i32 [ %414, %422 ], [ %415, %412 ]
  %427 = phi double [ %424, %422 ], [ %413, %412 ]
  %428 = add nuw nsw i32 %414, 1
  %429 = add i32 %416, 1
  %430 = icmp eq i32 %429, %402
  br i1 %430, label %431, label %412, !llvm.loop !21

431:                                              ; preds = %406, %425, %399
  %432 = phi i32 [ 0, %399 ], [ %407, %406 ], [ %426, %425 ]
  br i1 %27, label %433, label %611

433:                                              ; preds = %431
  %434 = sub i32 %26, %23
  %435 = add i32 %434, %432
  %436 = srem i32 %435, %10
  %437 = add nsw i32 %436, %10
  %438 = srem i32 %437, %10
  %439 = mul nsw i32 %24, %10
  %440 = add nsw i32 %439, %26
  %441 = and i32 %20, 3
  %442 = icmp ult i32 %20, 4
  br i1 %442, label %593, label %443

443:                                              ; preds = %433
  %444 = and i32 %20, -4
  br label %548

445:                                              ; preds = %542, %404
  %446 = phi double [ 0.000000e+00, %404 ], [ %544, %542 ]
  %447 = phi i32 [ 0, %404 ], [ %545, %542 ]
  %448 = phi i32 [ 0, %404 ], [ %543, %542 ]
  %449 = phi i32 [ 0, %404 ], [ %546, %542 ]
  %450 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %447
  %451 = addrspacecast double addrspace(3)* %450 to double*
  %452 = load volatile double, double* %451, align 8, !tbaa !4
  %453 = tail call double @llvm.fabs.f64(double %452)
  %454 = fcmp contract ogt double %453, %446
  br i1 %454, label %455, label %458

455:                                              ; preds = %445
  %456 = load volatile double, double* %451, align 8, !tbaa !4
  %457 = tail call double @llvm.fabs.f64(double %456)
  br label %458

458:                                              ; preds = %445, %455
  %459 = phi i32 [ %447, %455 ], [ %448, %445 ]
  %460 = phi double [ %457, %455 ], [ %446, %445 ]
  %461 = or i32 %447, 1
  %462 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %461
  %463 = addrspacecast double addrspace(3)* %462 to double*
  %464 = load volatile double, double* %463, align 8, !tbaa !4
  %465 = tail call double @llvm.fabs.f64(double %464)
  %466 = fcmp contract ogt double %465, %460
  br i1 %466, label %467, label %470

467:                                              ; preds = %458
  %468 = load volatile double, double* %463, align 8, !tbaa !4
  %469 = tail call double @llvm.fabs.f64(double %468)
  br label %470

470:                                              ; preds = %467, %458
  %471 = phi i32 [ %461, %467 ], [ %459, %458 ]
  %472 = phi double [ %469, %467 ], [ %460, %458 ]
  %473 = or i32 %447, 2
  %474 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %473
  %475 = addrspacecast double addrspace(3)* %474 to double*
  %476 = load volatile double, double* %475, align 8, !tbaa !4
  %477 = tail call double @llvm.fabs.f64(double %476)
  %478 = fcmp contract ogt double %477, %472
  br i1 %478, label %479, label %482

479:                                              ; preds = %470
  %480 = load volatile double, double* %475, align 8, !tbaa !4
  %481 = tail call double @llvm.fabs.f64(double %480)
  br label %482

482:                                              ; preds = %479, %470
  %483 = phi i32 [ %473, %479 ], [ %471, %470 ]
  %484 = phi double [ %481, %479 ], [ %472, %470 ]
  %485 = or i32 %447, 3
  %486 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %485
  %487 = addrspacecast double addrspace(3)* %486 to double*
  %488 = load volatile double, double* %487, align 8, !tbaa !4
  %489 = tail call double @llvm.fabs.f64(double %488)
  %490 = fcmp contract ogt double %489, %484
  br i1 %490, label %491, label %494

491:                                              ; preds = %482
  %492 = load volatile double, double* %487, align 8, !tbaa !4
  %493 = tail call double @llvm.fabs.f64(double %492)
  br label %494

494:                                              ; preds = %491, %482
  %495 = phi i32 [ %485, %491 ], [ %483, %482 ]
  %496 = phi double [ %493, %491 ], [ %484, %482 ]
  %497 = or i32 %447, 4
  %498 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %497
  %499 = addrspacecast double addrspace(3)* %498 to double*
  %500 = load volatile double, double* %499, align 8, !tbaa !4
  %501 = tail call double @llvm.fabs.f64(double %500)
  %502 = fcmp contract ogt double %501, %496
  br i1 %502, label %503, label %506

503:                                              ; preds = %494
  %504 = load volatile double, double* %499, align 8, !tbaa !4
  %505 = tail call double @llvm.fabs.f64(double %504)
  br label %506

506:                                              ; preds = %503, %494
  %507 = phi i32 [ %497, %503 ], [ %495, %494 ]
  %508 = phi double [ %505, %503 ], [ %496, %494 ]
  %509 = or i32 %447, 5
  %510 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %509
  %511 = addrspacecast double addrspace(3)* %510 to double*
  %512 = load volatile double, double* %511, align 8, !tbaa !4
  %513 = tail call double @llvm.fabs.f64(double %512)
  %514 = fcmp contract ogt double %513, %508
  br i1 %514, label %515, label %518

515:                                              ; preds = %506
  %516 = load volatile double, double* %511, align 8, !tbaa !4
  %517 = tail call double @llvm.fabs.f64(double %516)
  br label %518

518:                                              ; preds = %515, %506
  %519 = phi i32 [ %509, %515 ], [ %507, %506 ]
  %520 = phi double [ %517, %515 ], [ %508, %506 ]
  %521 = or i32 %447, 6
  %522 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %521
  %523 = addrspacecast double addrspace(3)* %522 to double*
  %524 = load volatile double, double* %523, align 8, !tbaa !4
  %525 = tail call double @llvm.fabs.f64(double %524)
  %526 = fcmp contract ogt double %525, %520
  br i1 %526, label %527, label %530

527:                                              ; preds = %518
  %528 = load volatile double, double* %523, align 8, !tbaa !4
  %529 = tail call double @llvm.fabs.f64(double %528)
  br label %530

530:                                              ; preds = %527, %518
  %531 = phi i32 [ %521, %527 ], [ %519, %518 ]
  %532 = phi double [ %529, %527 ], [ %520, %518 ]
  %533 = or i32 %447, 7
  %534 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %533
  %535 = addrspacecast double addrspace(3)* %534 to double*
  %536 = load volatile double, double* %535, align 8, !tbaa !4
  %537 = tail call double @llvm.fabs.f64(double %536)
  %538 = fcmp contract ogt double %537, %532
  br i1 %538, label %539, label %542

539:                                              ; preds = %530
  %540 = load volatile double, double* %535, align 8, !tbaa !4
  %541 = tail call double @llvm.fabs.f64(double %540)
  br label %542

542:                                              ; preds = %539, %530
  %543 = phi i32 [ %533, %539 ], [ %531, %530 ]
  %544 = phi double [ %541, %539 ], [ %532, %530 ]
  %545 = add nuw nsw i32 %447, 8
  %546 = add nuw i32 %449, 8
  %547 = icmp eq i32 %546, %405
  br i1 %547, label %406, label %445, !llvm.loop !22

548:                                              ; preds = %548, %443
  %549 = phi i32 [ 0, %443 ], [ %590, %548 ]
  %550 = phi i32 [ 0, %443 ], [ %591, %548 ]
  %551 = mul nsw i32 %549, %10
  %552 = add nsw i32 %438, %551
  %553 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %552
  %554 = addrspacecast double addrspace(3)* %553 to double*
  %555 = load volatile double, double* %554, align 8, !tbaa !4
  %556 = mul nsw i32 %551, %16
  %557 = add nsw i32 %440, %556
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds double, double addrspace(1)* %3, i64 %558
  store double %555, double addrspace(1)* %559, align 8, !tbaa !4
  %560 = or i32 %549, 1
  %561 = mul nsw i32 %560, %10
  %562 = add nsw i32 %438, %561
  %563 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %562
  %564 = addrspacecast double addrspace(3)* %563 to double*
  %565 = load volatile double, double* %564, align 8, !tbaa !4
  %566 = mul nsw i32 %561, %16
  %567 = add nsw i32 %440, %566
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds double, double addrspace(1)* %3, i64 %568
  store double %565, double addrspace(1)* %569, align 8, !tbaa !4
  %570 = or i32 %549, 2
  %571 = mul nsw i32 %570, %10
  %572 = add nsw i32 %438, %571
  %573 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %572
  %574 = addrspacecast double addrspace(3)* %573 to double*
  %575 = load volatile double, double* %574, align 8, !tbaa !4
  %576 = mul nsw i32 %571, %16
  %577 = add nsw i32 %440, %576
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds double, double addrspace(1)* %3, i64 %578
  store double %575, double addrspace(1)* %579, align 8, !tbaa !4
  %580 = or i32 %549, 3
  %581 = mul nsw i32 %580, %10
  %582 = add nsw i32 %438, %581
  %583 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %582
  %584 = addrspacecast double addrspace(3)* %583 to double*
  %585 = load volatile double, double* %584, align 8, !tbaa !4
  %586 = mul nsw i32 %581, %16
  %587 = add nsw i32 %440, %586
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds double, double addrspace(1)* %3, i64 %588
  store double %585, double addrspace(1)* %589, align 8, !tbaa !4
  %590 = add nuw nsw i32 %549, 4
  %591 = add i32 %550, 4
  %592 = icmp eq i32 %591, %444
  br i1 %592, label %593, label %548, !llvm.loop !23

593:                                              ; preds = %548, %433
  %594 = phi i32 [ 0, %433 ], [ %590, %548 ]
  %595 = icmp eq i32 %441, 0
  br i1 %595, label %611, label %596

596:                                              ; preds = %593, %596
  %597 = phi i32 [ %608, %596 ], [ %594, %593 ]
  %598 = phi i32 [ %609, %596 ], [ 0, %593 ]
  %599 = mul nsw i32 %597, %10
  %600 = add nsw i32 %438, %599
  %601 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %600
  %602 = addrspacecast double addrspace(3)* %601 to double*
  %603 = load volatile double, double* %602, align 8, !tbaa !4
  %604 = mul nsw i32 %599, %16
  %605 = add nsw i32 %440, %604
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds double, double addrspace(1)* %3, i64 %606
  store double %603, double addrspace(1)* %607, align 8, !tbaa !4
  %608 = add nuw nsw i32 %597, 1
  %609 = add i32 %598, 1
  %610 = icmp eq i32 %609, %441
  br i1 %610, label %611, label %596, !llvm.loop !24

611:                                              ; preds = %593, %596, %431
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %27, label %612, label %682

612:                                              ; preds = %611
  %613 = mul nsw i32 %24, %10
  %614 = add nsw i32 %613, %26
  %615 = and i32 %20, 3
  %616 = icmp ult i32 %20, 4
  br i1 %616, label %664, label %617

617:                                              ; preds = %612
  %618 = and i32 %20, -4
  br label %619

619:                                              ; preds = %619, %617
  %620 = phi i32 [ 0, %617 ], [ %661, %619 ]
  %621 = phi i32 [ 0, %617 ], [ %662, %619 ]
  %622 = mul nsw i32 %620, %10
  %623 = mul nsw i32 %622, %16
  %624 = add nsw i32 %614, %623
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds double, double addrspace(1)* %3, i64 %625
  %627 = load double, double addrspace(1)* %626, align 8, !tbaa !4
  %628 = add nsw i32 %622, %26
  %629 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %628
  %630 = addrspacecast double addrspace(3)* %629 to double*
  store volatile double %627, double* %630, align 8, !tbaa !4
  %631 = or i32 %620, 1
  %632 = mul nsw i32 %631, %10
  %633 = mul nsw i32 %632, %16
  %634 = add nsw i32 %614, %633
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds double, double addrspace(1)* %3, i64 %635
  %637 = load double, double addrspace(1)* %636, align 8, !tbaa !4
  %638 = add nsw i32 %632, %26
  %639 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %638
  %640 = addrspacecast double addrspace(3)* %639 to double*
  store volatile double %637, double* %640, align 8, !tbaa !4
  %641 = or i32 %620, 2
  %642 = mul nsw i32 %641, %10
  %643 = mul nsw i32 %642, %16
  %644 = add nsw i32 %614, %643
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds double, double addrspace(1)* %3, i64 %645
  %647 = load double, double addrspace(1)* %646, align 8, !tbaa !4
  %648 = add nsw i32 %642, %26
  %649 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %648
  %650 = addrspacecast double addrspace(3)* %649 to double*
  store volatile double %647, double* %650, align 8, !tbaa !4
  %651 = or i32 %620, 3
  %652 = mul nsw i32 %651, %10
  %653 = mul nsw i32 %652, %16
  %654 = add nsw i32 %614, %653
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds double, double addrspace(1)* %3, i64 %655
  %657 = load double, double addrspace(1)* %656, align 8, !tbaa !4
  %658 = add nsw i32 %652, %26
  %659 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %658
  %660 = addrspacecast double addrspace(3)* %659 to double*
  store volatile double %657, double* %660, align 8, !tbaa !4
  %661 = add nuw nsw i32 %620, 4
  %662 = add i32 %621, 4
  %663 = icmp eq i32 %662, %618
  br i1 %663, label %664, label %619, !llvm.loop !25

664:                                              ; preds = %619, %612
  %665 = phi i32 [ 0, %612 ], [ %661, %619 ]
  %666 = icmp eq i32 %615, 0
  br i1 %666, label %682, label %667

667:                                              ; preds = %664, %667
  %668 = phi i32 [ %679, %667 ], [ %665, %664 ]
  %669 = phi i32 [ %680, %667 ], [ 0, %664 ]
  %670 = mul nsw i32 %668, %10
  %671 = mul nsw i32 %670, %16
  %672 = add nsw i32 %614, %671
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds double, double addrspace(1)* %3, i64 %673
  %675 = load double, double addrspace(1)* %674, align 8, !tbaa !4
  %676 = add nsw i32 %670, %26
  %677 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %676
  %678 = addrspacecast double addrspace(3)* %677 to double*
  store volatile double %675, double* %678, align 8, !tbaa !4
  %679 = add nuw nsw i32 %668, 1
  %680 = add i32 %669, 1
  %681 = icmp eq i32 %680, %615
  br i1 %681, label %682, label %667, !llvm.loop !26

682:                                              ; preds = %664, %667, %611
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %683 = icmp ult i32 %26, 10
  br i1 %683, label %684, label %813

684:                                              ; preds = %682
  %685 = getelementptr inbounds [710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 %26
  %686 = addrspacecast double addrspace(3)* %685 to double*
  store volatile double 0.000000e+00, double* %686, align 8, !tbaa !4
  br i1 %400, label %687, label %813

687:                                              ; preds = %684
  %688 = and i32 %10, 7
  %689 = icmp ult i32 %10, 8
  br i1 %689, label %793, label %690

690:                                              ; preds = %687
  %691 = and i32 %10, -8
  br label %692

692:                                              ; preds = %692, %690
  %693 = phi i32 [ 0, %690 ], [ %790, %692 ]
  %694 = phi i32 [ 0, %690 ], [ %791, %692 ]
  %695 = mul nuw nsw i32 %693, 10
  %696 = add nuw nsw i32 %695, %26
  %697 = zext i32 %696 to i64
  %698 = getelementptr inbounds double, double addrspace(1)* %1, i64 %697
  %699 = load double, double addrspace(1)* %698, align 8, !tbaa !4
  %700 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %693
  %701 = addrspacecast double addrspace(3)* %700 to double*
  %702 = load volatile double, double* %701, align 8, !tbaa !4
  %703 = fmul contract double %699, %702
  %704 = load volatile double, double* %686, align 8, !tbaa !4
  %705 = fadd contract double %704, %703
  store volatile double %705, double* %686, align 8, !tbaa !4
  %706 = or i32 %693, 1
  %707 = mul nuw nsw i32 %706, 10
  %708 = add nuw nsw i32 %707, %26
  %709 = zext i32 %708 to i64
  %710 = getelementptr inbounds double, double addrspace(1)* %1, i64 %709
  %711 = load double, double addrspace(1)* %710, align 8, !tbaa !4
  %712 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %706
  %713 = addrspacecast double addrspace(3)* %712 to double*
  %714 = load volatile double, double* %713, align 8, !tbaa !4
  %715 = fmul contract double %711, %714
  %716 = load volatile double, double* %686, align 8, !tbaa !4
  %717 = fadd contract double %716, %715
  store volatile double %717, double* %686, align 8, !tbaa !4
  %718 = or i32 %693, 2
  %719 = mul nuw nsw i32 %718, 10
  %720 = add nuw nsw i32 %719, %26
  %721 = zext i32 %720 to i64
  %722 = getelementptr inbounds double, double addrspace(1)* %1, i64 %721
  %723 = load double, double addrspace(1)* %722, align 8, !tbaa !4
  %724 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %718
  %725 = addrspacecast double addrspace(3)* %724 to double*
  %726 = load volatile double, double* %725, align 8, !tbaa !4
  %727 = fmul contract double %723, %726
  %728 = load volatile double, double* %686, align 8, !tbaa !4
  %729 = fadd contract double %728, %727
  store volatile double %729, double* %686, align 8, !tbaa !4
  %730 = or i32 %693, 3
  %731 = mul nuw nsw i32 %730, 10
  %732 = add nuw nsw i32 %731, %26
  %733 = zext i32 %732 to i64
  %734 = getelementptr inbounds double, double addrspace(1)* %1, i64 %733
  %735 = load double, double addrspace(1)* %734, align 8, !tbaa !4
  %736 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %730
  %737 = addrspacecast double addrspace(3)* %736 to double*
  %738 = load volatile double, double* %737, align 8, !tbaa !4
  %739 = fmul contract double %735, %738
  %740 = load volatile double, double* %686, align 8, !tbaa !4
  %741 = fadd contract double %740, %739
  store volatile double %741, double* %686, align 8, !tbaa !4
  %742 = or i32 %693, 4
  %743 = mul nuw nsw i32 %742, 10
  %744 = add nuw nsw i32 %743, %26
  %745 = zext i32 %744 to i64
  %746 = getelementptr inbounds double, double addrspace(1)* %1, i64 %745
  %747 = load double, double addrspace(1)* %746, align 8, !tbaa !4
  %748 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %742
  %749 = addrspacecast double addrspace(3)* %748 to double*
  %750 = load volatile double, double* %749, align 8, !tbaa !4
  %751 = fmul contract double %747, %750
  %752 = load volatile double, double* %686, align 8, !tbaa !4
  %753 = fadd contract double %752, %751
  store volatile double %753, double* %686, align 8, !tbaa !4
  %754 = or i32 %693, 5
  %755 = mul nuw nsw i32 %754, 10
  %756 = add nuw nsw i32 %755, %26
  %757 = zext i32 %756 to i64
  %758 = getelementptr inbounds double, double addrspace(1)* %1, i64 %757
  %759 = load double, double addrspace(1)* %758, align 8, !tbaa !4
  %760 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %754
  %761 = addrspacecast double addrspace(3)* %760 to double*
  %762 = load volatile double, double* %761, align 8, !tbaa !4
  %763 = fmul contract double %759, %762
  %764 = load volatile double, double* %686, align 8, !tbaa !4
  %765 = fadd contract double %764, %763
  store volatile double %765, double* %686, align 8, !tbaa !4
  %766 = or i32 %693, 6
  %767 = mul nuw nsw i32 %766, 10
  %768 = add nuw nsw i32 %767, %26
  %769 = zext i32 %768 to i64
  %770 = getelementptr inbounds double, double addrspace(1)* %1, i64 %769
  %771 = load double, double addrspace(1)* %770, align 8, !tbaa !4
  %772 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %766
  %773 = addrspacecast double addrspace(3)* %772 to double*
  %774 = load volatile double, double* %773, align 8, !tbaa !4
  %775 = fmul contract double %771, %774
  %776 = load volatile double, double* %686, align 8, !tbaa !4
  %777 = fadd contract double %776, %775
  store volatile double %777, double* %686, align 8, !tbaa !4
  %778 = or i32 %693, 7
  %779 = mul nuw nsw i32 %778, 10
  %780 = add nuw nsw i32 %779, %26
  %781 = zext i32 %780 to i64
  %782 = getelementptr inbounds double, double addrspace(1)* %1, i64 %781
  %783 = load double, double addrspace(1)* %782, align 8, !tbaa !4
  %784 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %778
  %785 = addrspacecast double addrspace(3)* %784 to double*
  %786 = load volatile double, double* %785, align 8, !tbaa !4
  %787 = fmul contract double %783, %786
  %788 = load volatile double, double* %686, align 8, !tbaa !4
  %789 = fadd contract double %788, %787
  store volatile double %789, double* %686, align 8, !tbaa !4
  %790 = add nuw nsw i32 %693, 8
  %791 = add nuw i32 %694, 8
  %792 = icmp eq i32 %791, %691
  br i1 %792, label %793, label %692, !llvm.loop !27

793:                                              ; preds = %692, %687
  %794 = phi i32 [ 0, %687 ], [ %790, %692 ]
  %795 = icmp eq i32 %688, 0
  br i1 %795, label %813, label %796

796:                                              ; preds = %793, %796
  %797 = phi i32 [ %810, %796 ], [ %794, %793 ]
  %798 = phi i32 [ %811, %796 ], [ 0, %793 ]
  %799 = mul nuw nsw i32 %797, 10
  %800 = add nuw nsw i32 %799, %26
  %801 = zext i32 %800 to i64
  %802 = getelementptr inbounds double, double addrspace(1)* %1, i64 %801
  %803 = load double, double addrspace(1)* %802, align 8, !tbaa !4
  %804 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %797
  %805 = addrspacecast double addrspace(3)* %804 to double*
  %806 = load volatile double, double* %805, align 8, !tbaa !4
  %807 = fmul contract double %803, %806
  %808 = load volatile double, double* %686, align 8, !tbaa !4
  %809 = fadd contract double %808, %807
  store volatile double %809, double* %686, align 8, !tbaa !4
  %810 = add nuw nsw i32 %797, 1
  %811 = add i32 %798, 1
  %812 = icmp eq i32 %811, %688
  br i1 %812, label %813, label %796, !llvm.loop !28

813:                                              ; preds = %793, %796, %684, %682
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %814 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 0) to double*), align 16, !tbaa !4
  %815 = fcmp contract ueq double %814, 0.000000e+00
  br i1 %815, label %827, label %822

816:                                              ; preds = %933
  %817 = mul i32 %934, %10
  %818 = and i32 %10, 7
  %819 = icmp ult i32 %10, 8
  %820 = and i32 %10, -8
  %821 = icmp eq i32 %818, 0
  br label %936

822:                                              ; preds = %813
  %823 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 0) to double*), align 16, !tbaa !4
  %824 = tail call double @llvm.fabs.f64(double %823)
  %825 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 0) to double*), align 16, !tbaa !4
  %826 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %825)
  br label %827

827:                                              ; preds = %813, %822
  %828 = phi double [ %824, %822 ], [ 0.000000e+00, %813 ]
  %829 = phi double [ %826, %822 ], [ 1.000000e+00, %813 ]
  %830 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 1) to double*), align 8, !tbaa !4
  %831 = tail call double @llvm.fabs.f64(double %830)
  %832 = fcmp contract ogt double %831, %828
  br i1 %832, label %833, label %838

833:                                              ; preds = %827
  %834 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 1) to double*), align 8, !tbaa !4
  %835 = tail call double @llvm.fabs.f64(double %834)
  %836 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 1) to double*), align 8, !tbaa !4
  %837 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %836)
  br label %838

838:                                              ; preds = %833, %827
  %839 = phi i32 [ 1, %833 ], [ 0, %827 ]
  %840 = phi double [ %835, %833 ], [ %828, %827 ]
  %841 = phi double [ %837, %833 ], [ %829, %827 ]
  %842 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 2) to double*), align 8, !tbaa !4
  %843 = tail call double @llvm.fabs.f64(double %842)
  %844 = fcmp contract ogt double %843, %840
  br i1 %844, label %845, label %850

845:                                              ; preds = %838
  %846 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 2) to double*), align 8, !tbaa !4
  %847 = tail call double @llvm.fabs.f64(double %846)
  %848 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 2) to double*), align 8, !tbaa !4
  %849 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %848)
  br label %850

850:                                              ; preds = %845, %838
  %851 = phi i32 [ 2, %845 ], [ %839, %838 ]
  %852 = phi double [ %847, %845 ], [ %840, %838 ]
  %853 = phi double [ %849, %845 ], [ %841, %838 ]
  %854 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 3) to double*), align 8, !tbaa !4
  %855 = tail call double @llvm.fabs.f64(double %854)
  %856 = fcmp contract ogt double %855, %852
  br i1 %856, label %857, label %862

857:                                              ; preds = %850
  %858 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 3) to double*), align 8, !tbaa !4
  %859 = tail call double @llvm.fabs.f64(double %858)
  %860 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 3) to double*), align 8, !tbaa !4
  %861 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %860)
  br label %862

862:                                              ; preds = %857, %850
  %863 = phi i32 [ 3, %857 ], [ %851, %850 ]
  %864 = phi double [ %859, %857 ], [ %852, %850 ]
  %865 = phi double [ %861, %857 ], [ %853, %850 ]
  %866 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 4) to double*), align 8, !tbaa !4
  %867 = tail call double @llvm.fabs.f64(double %866)
  %868 = fcmp contract ogt double %867, %864
  br i1 %868, label %869, label %874

869:                                              ; preds = %862
  %870 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 4) to double*), align 8, !tbaa !4
  %871 = tail call double @llvm.fabs.f64(double %870)
  %872 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 4) to double*), align 8, !tbaa !4
  %873 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %872)
  br label %874

874:                                              ; preds = %869, %862
  %875 = phi i32 [ 4, %869 ], [ %863, %862 ]
  %876 = phi double [ %871, %869 ], [ %864, %862 ]
  %877 = phi double [ %873, %869 ], [ %865, %862 ]
  %878 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 5) to double*), align 8, !tbaa !4
  %879 = tail call double @llvm.fabs.f64(double %878)
  %880 = fcmp contract ogt double %879, %876
  br i1 %880, label %881, label %886

881:                                              ; preds = %874
  %882 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 5) to double*), align 8, !tbaa !4
  %883 = tail call double @llvm.fabs.f64(double %882)
  %884 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 5) to double*), align 8, !tbaa !4
  %885 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %884)
  br label %886

886:                                              ; preds = %881, %874
  %887 = phi i32 [ 5, %881 ], [ %875, %874 ]
  %888 = phi double [ %883, %881 ], [ %876, %874 ]
  %889 = phi double [ %885, %881 ], [ %877, %874 ]
  %890 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 6) to double*), align 8, !tbaa !4
  %891 = tail call double @llvm.fabs.f64(double %890)
  %892 = fcmp contract ogt double %891, %888
  br i1 %892, label %893, label %898

893:                                              ; preds = %886
  %894 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 6) to double*), align 8, !tbaa !4
  %895 = tail call double @llvm.fabs.f64(double %894)
  %896 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 6) to double*), align 8, !tbaa !4
  %897 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %896)
  br label %898

898:                                              ; preds = %893, %886
  %899 = phi i32 [ 6, %893 ], [ %887, %886 ]
  %900 = phi double [ %895, %893 ], [ %888, %886 ]
  %901 = phi double [ %897, %893 ], [ %889, %886 ]
  %902 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 7) to double*), align 8, !tbaa !4
  %903 = tail call double @llvm.fabs.f64(double %902)
  %904 = fcmp contract ogt double %903, %900
  br i1 %904, label %905, label %910

905:                                              ; preds = %898
  %906 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 7) to double*), align 8, !tbaa !4
  %907 = tail call double @llvm.fabs.f64(double %906)
  %908 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 7) to double*), align 8, !tbaa !4
  %909 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %908)
  br label %910

910:                                              ; preds = %905, %898
  %911 = phi i32 [ 7, %905 ], [ %899, %898 ]
  %912 = phi double [ %907, %905 ], [ %900, %898 ]
  %913 = phi double [ %909, %905 ], [ %901, %898 ]
  %914 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 8) to double*), align 8, !tbaa !4
  %915 = tail call double @llvm.fabs.f64(double %914)
  %916 = fcmp contract ogt double %915, %912
  br i1 %916, label %917, label %922

917:                                              ; preds = %910
  %918 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 8) to double*), align 8, !tbaa !4
  %919 = tail call double @llvm.fabs.f64(double %918)
  %920 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 8) to double*), align 8, !tbaa !4
  %921 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %920)
  br label %922

922:                                              ; preds = %917, %910
  %923 = phi i32 [ 8, %917 ], [ %911, %910 ]
  %924 = phi double [ %919, %917 ], [ %912, %910 ]
  %925 = phi double [ %921, %917 ], [ %913, %910 ]
  %926 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 9) to double*), align 8, !tbaa !4
  %927 = tail call double @llvm.fabs.f64(double %926)
  %928 = fcmp contract ogt double %927, %924
  br i1 %928, label %929, label %933

929:                                              ; preds = %922
  %930 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 9) to double*), align 8, !tbaa !4
  %931 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([710 x double], [710 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E4sWup, i32 0, i32 9) to double*), align 8, !tbaa !4
  %932 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %931)
  br label %933

933:                                              ; preds = %929, %922
  %934 = phi i32 [ 9, %929 ], [ %923, %922 ]
  %935 = phi double [ %932, %929 ], [ %925, %922 ]
  br i1 %27, label %816, label %1087

936:                                              ; preds = %816, %1073
  %937 = phi i32 [ 0, %816 ], [ %1085, %1073 ]
  br i1 %400, label %938, label %1073

938:                                              ; preds = %936
  %939 = mul nsw i32 %937, %10
  br i1 %819, label %1050, label %940

940:                                              ; preds = %938, %940
  %941 = phi double [ %1046, %940 ], [ 0.000000e+00, %938 ]
  %942 = phi i32 [ %1047, %940 ], [ 0, %938 ]
  %943 = phi i32 [ %1048, %940 ], [ 0, %938 ]
  %944 = add i32 %942, %817
  %945 = mul i32 %944, %10
  %946 = add i32 %945, %26
  %947 = sext i32 %946 to i64
  %948 = getelementptr inbounds double, double addrspace(1)* %2, i64 %947
  %949 = load double, double addrspace(1)* %948, align 8, !tbaa !4
  %950 = add nsw i32 %942, %939
  %951 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %950
  %952 = addrspacecast double addrspace(3)* %951 to double*
  %953 = load volatile double, double* %952, align 8, !tbaa !4
  %954 = fmul contract double %949, %953
  %955 = fadd contract double %941, %954
  %956 = or i32 %942, 1
  %957 = add i32 %956, %817
  %958 = mul i32 %957, %10
  %959 = add i32 %958, %26
  %960 = sext i32 %959 to i64
  %961 = getelementptr inbounds double, double addrspace(1)* %2, i64 %960
  %962 = load double, double addrspace(1)* %961, align 8, !tbaa !4
  %963 = add nsw i32 %956, %939
  %964 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %963
  %965 = addrspacecast double addrspace(3)* %964 to double*
  %966 = load volatile double, double* %965, align 8, !tbaa !4
  %967 = fmul contract double %962, %966
  %968 = fadd contract double %955, %967
  %969 = or i32 %942, 2
  %970 = add i32 %969, %817
  %971 = mul i32 %970, %10
  %972 = add i32 %971, %26
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds double, double addrspace(1)* %2, i64 %973
  %975 = load double, double addrspace(1)* %974, align 8, !tbaa !4
  %976 = add nsw i32 %969, %939
  %977 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %976
  %978 = addrspacecast double addrspace(3)* %977 to double*
  %979 = load volatile double, double* %978, align 8, !tbaa !4
  %980 = fmul contract double %975, %979
  %981 = fadd contract double %968, %980
  %982 = or i32 %942, 3
  %983 = add i32 %982, %817
  %984 = mul i32 %983, %10
  %985 = add i32 %984, %26
  %986 = sext i32 %985 to i64
  %987 = getelementptr inbounds double, double addrspace(1)* %2, i64 %986
  %988 = load double, double addrspace(1)* %987, align 8, !tbaa !4
  %989 = add nsw i32 %982, %939
  %990 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %989
  %991 = addrspacecast double addrspace(3)* %990 to double*
  %992 = load volatile double, double* %991, align 8, !tbaa !4
  %993 = fmul contract double %988, %992
  %994 = fadd contract double %981, %993
  %995 = or i32 %942, 4
  %996 = add i32 %995, %817
  %997 = mul i32 %996, %10
  %998 = add i32 %997, %26
  %999 = sext i32 %998 to i64
  %1000 = getelementptr inbounds double, double addrspace(1)* %2, i64 %999
  %1001 = load double, double addrspace(1)* %1000, align 8, !tbaa !4
  %1002 = add nsw i32 %995, %939
  %1003 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %1002
  %1004 = addrspacecast double addrspace(3)* %1003 to double*
  %1005 = load volatile double, double* %1004, align 8, !tbaa !4
  %1006 = fmul contract double %1001, %1005
  %1007 = fadd contract double %994, %1006
  %1008 = or i32 %942, 5
  %1009 = add i32 %1008, %817
  %1010 = mul i32 %1009, %10
  %1011 = add i32 %1010, %26
  %1012 = sext i32 %1011 to i64
  %1013 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1012
  %1014 = load double, double addrspace(1)* %1013, align 8, !tbaa !4
  %1015 = add nsw i32 %1008, %939
  %1016 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %1015
  %1017 = addrspacecast double addrspace(3)* %1016 to double*
  %1018 = load volatile double, double* %1017, align 8, !tbaa !4
  %1019 = fmul contract double %1014, %1018
  %1020 = fadd contract double %1007, %1019
  %1021 = or i32 %942, 6
  %1022 = add i32 %1021, %817
  %1023 = mul i32 %1022, %10
  %1024 = add i32 %1023, %26
  %1025 = sext i32 %1024 to i64
  %1026 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1025
  %1027 = load double, double addrspace(1)* %1026, align 8, !tbaa !4
  %1028 = add nsw i32 %1021, %939
  %1029 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %1028
  %1030 = addrspacecast double addrspace(3)* %1029 to double*
  %1031 = load volatile double, double* %1030, align 8, !tbaa !4
  %1032 = fmul contract double %1027, %1031
  %1033 = fadd contract double %1020, %1032
  %1034 = or i32 %942, 7
  %1035 = add i32 %1034, %817
  %1036 = mul i32 %1035, %10
  %1037 = add i32 %1036, %26
  %1038 = sext i32 %1037 to i64
  %1039 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1038
  %1040 = load double, double addrspace(1)* %1039, align 8, !tbaa !4
  %1041 = add nsw i32 %1034, %939
  %1042 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %1041
  %1043 = addrspacecast double addrspace(3)* %1042 to double*
  %1044 = load volatile double, double* %1043, align 8, !tbaa !4
  %1045 = fmul contract double %1040, %1044
  %1046 = fadd contract double %1033, %1045
  %1047 = add nuw nsw i32 %942, 8
  %1048 = add i32 %943, 8
  %1049 = icmp eq i32 %1048, %820
  br i1 %1049, label %1050, label %940, !llvm.loop !29

1050:                                             ; preds = %940, %938
  %1051 = phi double [ undef, %938 ], [ %1046, %940 ]
  %1052 = phi double [ 0.000000e+00, %938 ], [ %1046, %940 ]
  %1053 = phi i32 [ 0, %938 ], [ %1047, %940 ]
  br i1 %821, label %1073, label %1054

1054:                                             ; preds = %1050, %1054
  %1055 = phi double [ %1069, %1054 ], [ %1052, %1050 ]
  %1056 = phi i32 [ %1070, %1054 ], [ %1053, %1050 ]
  %1057 = phi i32 [ %1071, %1054 ], [ 0, %1050 ]
  %1058 = add i32 %1056, %817
  %1059 = mul i32 %1058, %10
  %1060 = add i32 %1059, %26
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1061
  %1063 = load double, double addrspace(1)* %1062, align 8, !tbaa !4
  %1064 = add nsw i32 %1056, %939
  %1065 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ11reNormalizePKdS0_S0_PdS1_S1_E2sW, i32 0, i32 %1064
  %1066 = addrspacecast double addrspace(3)* %1065 to double*
  %1067 = load volatile double, double* %1066, align 8, !tbaa !4
  %1068 = fmul contract double %1063, %1067
  %1069 = fadd contract double %1055, %1068
  %1070 = add nuw nsw i32 %1056, 1
  %1071 = add i32 %1057, 1
  %1072 = icmp eq i32 %1071, %818
  br i1 %1072, label %1073, label %1054, !llvm.loop !30

1073:                                             ; preds = %1050, %1054, %936
  %1074 = phi double [ 0.000000e+00, %936 ], [ %1051, %1050 ], [ %1069, %1054 ]
  %1075 = icmp eq i32 %937, 0
  %1076 = fneg contract double %1074
  %1077 = fmul contract double %935, %1076
  %1078 = select i1 %1075, double %1077, double %1074
  %1079 = mul i32 %937, %16
  %1080 = add i32 %1079, %24
  %1081 = mul i32 %1080, %10
  %1082 = add i32 %1081, %26
  %1083 = sext i32 %1082 to i64
  %1084 = getelementptr inbounds double, double addrspace(1)* %3, i64 %1083
  store double %1078, double addrspace(1)* %1084, align 8, !tbaa !4
  %1085 = add nuw nsw i32 %937, 1
  %1086 = icmp eq i32 %1085, %20
  br i1 %1086, label %1087, label %936, !llvm.loop !31

1087:                                             ; preds = %1073, %933
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{i16 1, i16 1025}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !11}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !11}
!27 = distinct !{!27, !13}
!28 = distinct !{!28, !11}
!29 = distinct !{!29, !13}
!30 = distinct !{!30, !11}
!31 = distinct !{!31, !13}
