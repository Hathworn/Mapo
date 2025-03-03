; ModuleID = '../data/hip_kernels/16910/10/main.cu'
source_filename = "../data/hip_kernels/16910/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4getWPKdPdS1_E2sW = internal addrspace(3) global [213 x double] undef, align 16
@_ZZ4getWPKdPdS1_E4swtw = internal addrspace(3) global [5041 x double] undef, align 16
@_ZZ4getWPKdPdS1_E2xN = internal addrspace(3) global [1 x double] undef, align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4getWPKdPdS1_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %5 = load double, double addrspace(1)* %4, align 8, !tbaa !4, !amdgpu.noclobber !8
  %6 = fptosi double %5 to i32
  %7 = freeze i32 %6
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = freeze i32 %10
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 11
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !4, !amdgpu.noclobber !8
  %17 = fptosi double %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = icmp sgt i32 %7, 0
  br i1 %20, label %21, label %45

21:                                               ; preds = %3
  %22 = mul nsw i32 %19, %7
  %23 = mul nsw i32 %22, %7
  %24 = and i32 %7, 7
  %25 = icmp ult i32 %7, 8
  br i1 %25, label %28, label %26

26:                                               ; preds = %21
  %27 = and i32 %7, -8
  br label %54

28:                                               ; preds = %54, %21
  %29 = phi i32 [ 0, %21 ], [ %128, %54 ]
  %30 = icmp eq i32 %24, 0
  br i1 %30, label %45, label %31

31:                                               ; preds = %28, %31
  %32 = phi i32 [ %42, %31 ], [ %29, %28 ]
  %33 = phi i32 [ %43, %31 ], [ 0, %28 ]
  %34 = mul nsw i32 %32, %7
  %35 = add nsw i32 %34, %18
  %36 = add nsw i32 %35, %23
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !4, !amdgpu.noclobber !8
  %40 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %35
  %41 = addrspacecast double addrspace(3)* %40 to double*
  store volatile double %39, double* %41, align 8, !tbaa !4
  %42 = add nuw nsw i32 %32, 1
  %43 = add i32 %33, 1
  %44 = icmp eq i32 %43, %24
  br i1 %44, label %45, label %31, !llvm.loop !10

45:                                               ; preds = %28, %31, %3
  %46 = icmp sgt i32 %11, 0
  br i1 %46, label %47, label %194

47:                                               ; preds = %45
  %48 = mul nsw i32 %19, %7
  %49 = add nsw i32 %48, %18
  %50 = and i32 %11, 3
  %51 = icmp ult i32 %11, 4
  br i1 %51, label %176, label %52

52:                                               ; preds = %47
  %53 = and i32 %11, -4
  br label %131

54:                                               ; preds = %54, %26
  %55 = phi i32 [ 0, %26 ], [ %128, %54 ]
  %56 = phi i32 [ 0, %26 ], [ %129, %54 ]
  %57 = mul nsw i32 %55, %7
  %58 = add nsw i32 %57, %18
  %59 = add nsw i32 %58, %23
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %1, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !4, !amdgpu.noclobber !8
  %63 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %58
  %64 = addrspacecast double addrspace(3)* %63 to double*
  store volatile double %62, double* %64, align 8, !tbaa !4
  %65 = or i32 %55, 1
  %66 = mul nsw i32 %65, %7
  %67 = add nsw i32 %66, %18
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !4, !amdgpu.noclobber !8
  %72 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %67
  %73 = addrspacecast double addrspace(3)* %72 to double*
  store volatile double %71, double* %73, align 8, !tbaa !4
  %74 = or i32 %55, 2
  %75 = mul nsw i32 %74, %7
  %76 = add nsw i32 %75, %18
  %77 = add nsw i32 %76, %23
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !4, !amdgpu.noclobber !8
  %81 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %76
  %82 = addrspacecast double addrspace(3)* %81 to double*
  store volatile double %80, double* %82, align 8, !tbaa !4
  %83 = or i32 %55, 3
  %84 = mul nsw i32 %83, %7
  %85 = add nsw i32 %84, %18
  %86 = add nsw i32 %85, %23
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %1, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !4, !amdgpu.noclobber !8
  %90 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %85
  %91 = addrspacecast double addrspace(3)* %90 to double*
  store volatile double %89, double* %91, align 8, !tbaa !4
  %92 = or i32 %55, 4
  %93 = mul nsw i32 %92, %7
  %94 = add nsw i32 %93, %18
  %95 = add nsw i32 %94, %23
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %1, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !4, !amdgpu.noclobber !8
  %99 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %94
  %100 = addrspacecast double addrspace(3)* %99 to double*
  store volatile double %98, double* %100, align 8, !tbaa !4
  %101 = or i32 %55, 5
  %102 = mul nsw i32 %101, %7
  %103 = add nsw i32 %102, %18
  %104 = add nsw i32 %103, %23
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !4, !amdgpu.noclobber !8
  %108 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %103
  %109 = addrspacecast double addrspace(3)* %108 to double*
  store volatile double %107, double* %109, align 8, !tbaa !4
  %110 = or i32 %55, 6
  %111 = mul nsw i32 %110, %7
  %112 = add nsw i32 %111, %18
  %113 = add nsw i32 %112, %23
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !4, !amdgpu.noclobber !8
  %117 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %112
  %118 = addrspacecast double addrspace(3)* %117 to double*
  store volatile double %116, double* %118, align 8, !tbaa !4
  %119 = or i32 %55, 7
  %120 = mul nsw i32 %119, %7
  %121 = add nsw i32 %120, %18
  %122 = add nsw i32 %121, %23
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !4, !amdgpu.noclobber !8
  %126 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %121
  %127 = addrspacecast double addrspace(3)* %126 to double*
  store volatile double %125, double* %127, align 8, !tbaa !4
  %128 = add nuw nsw i32 %55, 8
  %129 = add i32 %56, 8
  %130 = icmp eq i32 %129, %27
  br i1 %130, label %28, label %54, !llvm.loop !12

131:                                              ; preds = %131, %52
  %132 = phi i32 [ 0, %52 ], [ %173, %131 ]
  %133 = phi i32 [ 0, %52 ], [ %174, %131 ]
  %134 = mul nsw i32 %132, %7
  %135 = mul nsw i32 %134, %14
  %136 = add nsw i32 %49, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %2, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !4, !amdgpu.noclobber !8
  %140 = add nsw i32 %134, %18
  %141 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %140
  %142 = addrspacecast double addrspace(3)* %141 to double*
  store volatile double %139, double* %142, align 8, !tbaa !4
  %143 = or i32 %132, 1
  %144 = mul nsw i32 %143, %7
  %145 = mul nsw i32 %144, %14
  %146 = add nsw i32 %49, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds double, double addrspace(1)* %2, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !4, !amdgpu.noclobber !8
  %150 = add nsw i32 %144, %18
  %151 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %150
  %152 = addrspacecast double addrspace(3)* %151 to double*
  store volatile double %149, double* %152, align 8, !tbaa !4
  %153 = or i32 %132, 2
  %154 = mul nsw i32 %153, %7
  %155 = mul nsw i32 %154, %14
  %156 = add nsw i32 %49, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %2, i64 %157
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !4, !amdgpu.noclobber !8
  %160 = add nsw i32 %154, %18
  %161 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %160
  %162 = addrspacecast double addrspace(3)* %161 to double*
  store volatile double %159, double* %162, align 8, !tbaa !4
  %163 = or i32 %132, 3
  %164 = mul nsw i32 %163, %7
  %165 = mul nsw i32 %164, %14
  %166 = add nsw i32 %49, %165
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds double, double addrspace(1)* %2, i64 %167
  %169 = load double, double addrspace(1)* %168, align 8, !tbaa !4, !amdgpu.noclobber !8
  %170 = add nsw i32 %164, %18
  %171 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %170
  %172 = addrspacecast double addrspace(3)* %171 to double*
  store volatile double %169, double* %172, align 8, !tbaa !4
  %173 = add nuw nsw i32 %132, 4
  %174 = add i32 %133, 4
  %175 = icmp eq i32 %174, %53
  br i1 %175, label %176, label %131, !llvm.loop !14

176:                                              ; preds = %131, %47
  %177 = phi i32 [ 0, %47 ], [ %173, %131 ]
  %178 = icmp eq i32 %50, 0
  br i1 %178, label %194, label %179

179:                                              ; preds = %176, %179
  %180 = phi i32 [ %191, %179 ], [ %177, %176 ]
  %181 = phi i32 [ %192, %179 ], [ 0, %176 ]
  %182 = mul nsw i32 %180, %7
  %183 = mul nsw i32 %182, %14
  %184 = add nsw i32 %49, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds double, double addrspace(1)* %2, i64 %185
  %187 = load double, double addrspace(1)* %186, align 8, !tbaa !4, !amdgpu.noclobber !8
  %188 = add nsw i32 %182, %18
  %189 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %188
  %190 = addrspacecast double addrspace(3)* %189 to double*
  store volatile double %187, double* %190, align 8, !tbaa !4
  %191 = add nuw nsw i32 %180, 1
  %192 = add i32 %181, 1
  %193 = icmp eq i32 %192, %50
  br i1 %193, label %194, label %179, !llvm.loop !15

194:                                              ; preds = %176, %179, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %195, label %543

195:                                              ; preds = %194
  %196 = icmp eq i32 %18, 0
  %197 = and i32 %7, 7
  %198 = icmp ult i32 %7, 8
  %199 = and i32 %7, -8
  %200 = icmp eq i32 %197, 0
  %201 = and i32 %7, 7
  %202 = icmp ult i32 %7, 8
  %203 = and i32 %7, -8
  %204 = icmp eq i32 %201, 0
  %205 = and i32 %7, 3
  %206 = icmp ult i32 %7, 4
  %207 = and i32 %7, -4
  %208 = icmp eq i32 %205, 0
  br label %209

209:                                              ; preds = %195, %540
  %210 = phi i32 [ 0, %195 ], [ %541, %540 ]
  %211 = mul nsw i32 %210, %7
  %212 = add nsw i32 %211, %18
  %213 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %212
  %214 = addrspacecast double addrspace(3)* %213 to double*
  br label %217

215:                                              ; preds = %465
  br i1 %20, label %216, label %540

216:                                              ; preds = %215
  br i1 %206, label %521, label %468

217:                                              ; preds = %209, %465
  %218 = phi i32 [ 0, %209 ], [ %466, %465 ]
  br i1 %20, label %219, label %344

219:                                              ; preds = %217
  br i1 %198, label %322, label %220

220:                                              ; preds = %219, %220
  %221 = phi double [ %318, %220 ], [ 0.000000e+00, %219 ]
  %222 = phi i32 [ %319, %220 ], [ 0, %219 ]
  %223 = phi i32 [ %320, %220 ], [ 0, %219 ]
  %224 = mul nsw i32 %222, %7
  %225 = add nsw i32 %224, %18
  %226 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %225
  %227 = addrspacecast double addrspace(3)* %226 to double*
  %228 = load volatile double, double* %227, align 8, !tbaa !4
  %229 = add nsw i32 %222, %211
  %230 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %229
  %231 = addrspacecast double addrspace(3)* %230 to double*
  %232 = load volatile double, double* %231, align 8, !tbaa !4
  %233 = fmul contract double %228, %232
  %234 = fadd contract double %221, %233
  %235 = or i32 %222, 1
  %236 = mul nsw i32 %235, %7
  %237 = add nsw i32 %236, %18
  %238 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %237
  %239 = addrspacecast double addrspace(3)* %238 to double*
  %240 = load volatile double, double* %239, align 8, !tbaa !4
  %241 = add nsw i32 %235, %211
  %242 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %241
  %243 = addrspacecast double addrspace(3)* %242 to double*
  %244 = load volatile double, double* %243, align 8, !tbaa !4
  %245 = fmul contract double %240, %244
  %246 = fadd contract double %234, %245
  %247 = or i32 %222, 2
  %248 = mul nsw i32 %247, %7
  %249 = add nsw i32 %248, %18
  %250 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %249
  %251 = addrspacecast double addrspace(3)* %250 to double*
  %252 = load volatile double, double* %251, align 8, !tbaa !4
  %253 = add nsw i32 %247, %211
  %254 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %253
  %255 = addrspacecast double addrspace(3)* %254 to double*
  %256 = load volatile double, double* %255, align 8, !tbaa !4
  %257 = fmul contract double %252, %256
  %258 = fadd contract double %246, %257
  %259 = or i32 %222, 3
  %260 = mul nsw i32 %259, %7
  %261 = add nsw i32 %260, %18
  %262 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %261
  %263 = addrspacecast double addrspace(3)* %262 to double*
  %264 = load volatile double, double* %263, align 8, !tbaa !4
  %265 = add nsw i32 %259, %211
  %266 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %265
  %267 = addrspacecast double addrspace(3)* %266 to double*
  %268 = load volatile double, double* %267, align 8, !tbaa !4
  %269 = fmul contract double %264, %268
  %270 = fadd contract double %258, %269
  %271 = or i32 %222, 4
  %272 = mul nsw i32 %271, %7
  %273 = add nsw i32 %272, %18
  %274 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %273
  %275 = addrspacecast double addrspace(3)* %274 to double*
  %276 = load volatile double, double* %275, align 8, !tbaa !4
  %277 = add nsw i32 %271, %211
  %278 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %277
  %279 = addrspacecast double addrspace(3)* %278 to double*
  %280 = load volatile double, double* %279, align 8, !tbaa !4
  %281 = fmul contract double %276, %280
  %282 = fadd contract double %270, %281
  %283 = or i32 %222, 5
  %284 = mul nsw i32 %283, %7
  %285 = add nsw i32 %284, %18
  %286 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %285
  %287 = addrspacecast double addrspace(3)* %286 to double*
  %288 = load volatile double, double* %287, align 8, !tbaa !4
  %289 = add nsw i32 %283, %211
  %290 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %289
  %291 = addrspacecast double addrspace(3)* %290 to double*
  %292 = load volatile double, double* %291, align 8, !tbaa !4
  %293 = fmul contract double %288, %292
  %294 = fadd contract double %282, %293
  %295 = or i32 %222, 6
  %296 = mul nsw i32 %295, %7
  %297 = add nsw i32 %296, %18
  %298 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %297
  %299 = addrspacecast double addrspace(3)* %298 to double*
  %300 = load volatile double, double* %299, align 8, !tbaa !4
  %301 = add nsw i32 %295, %211
  %302 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %301
  %303 = addrspacecast double addrspace(3)* %302 to double*
  %304 = load volatile double, double* %303, align 8, !tbaa !4
  %305 = fmul contract double %300, %304
  %306 = fadd contract double %294, %305
  %307 = or i32 %222, 7
  %308 = mul nsw i32 %307, %7
  %309 = add nsw i32 %308, %18
  %310 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %309
  %311 = addrspacecast double addrspace(3)* %310 to double*
  %312 = load volatile double, double* %311, align 8, !tbaa !4
  %313 = add nsw i32 %307, %211
  %314 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %313
  %315 = addrspacecast double addrspace(3)* %314 to double*
  %316 = load volatile double, double* %315, align 8, !tbaa !4
  %317 = fmul contract double %312, %316
  %318 = fadd contract double %306, %317
  %319 = add nuw nsw i32 %222, 8
  %320 = add i32 %223, 8
  %321 = icmp eq i32 %320, %199
  br i1 %321, label %322, label %220, !llvm.loop !16

322:                                              ; preds = %220, %219
  %323 = phi double [ undef, %219 ], [ %318, %220 ]
  %324 = phi double [ 0.000000e+00, %219 ], [ %318, %220 ]
  %325 = phi i32 [ 0, %219 ], [ %319, %220 ]
  br i1 %200, label %344, label %326

326:                                              ; preds = %322, %326
  %327 = phi double [ %340, %326 ], [ %324, %322 ]
  %328 = phi i32 [ %341, %326 ], [ %325, %322 ]
  %329 = phi i32 [ %342, %326 ], [ 0, %322 ]
  %330 = mul nsw i32 %328, %7
  %331 = add nsw i32 %330, %18
  %332 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %331
  %333 = addrspacecast double addrspace(3)* %332 to double*
  %334 = load volatile double, double* %333, align 8, !tbaa !4
  %335 = add nsw i32 %328, %211
  %336 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %335
  %337 = addrspacecast double addrspace(3)* %336 to double*
  %338 = load volatile double, double* %337, align 8, !tbaa !4
  %339 = fmul contract double %334, %338
  %340 = fadd contract double %327, %339
  %341 = add nuw nsw i32 %328, 1
  %342 = add i32 %329, 1
  %343 = icmp eq i32 %342, %197
  br i1 %343, label %344, label %326, !llvm.loop !17

344:                                              ; preds = %322, %326, %217
  %345 = phi double [ 0.000000e+00, %217 ], [ %323, %322 ], [ %340, %326 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %346 = icmp ult i32 %218, 99
  br i1 %346, label %347, label %465

347:                                              ; preds = %344
  store volatile double %345, double* %214, align 8, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %196, label %348, label %462

348:                                              ; preds = %347
  br i1 %20, label %349, label %438

349:                                              ; preds = %348
  br i1 %202, label %420, label %350

350:                                              ; preds = %349, %350
  %351 = phi double [ %416, %350 ], [ 0x3EE4F8B580000000, %349 ]
  %352 = phi i32 [ %417, %350 ], [ 0, %349 ]
  %353 = phi i32 [ %418, %350 ], [ 0, %349 ]
  %354 = add nsw i32 %352, %211
  %355 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %354
  %356 = addrspacecast double addrspace(3)* %355 to double*
  %357 = load volatile double, double* %356, align 8, !tbaa !4
  %358 = load volatile double, double* %356, align 8, !tbaa !4
  %359 = fmul contract double %357, %358
  %360 = fadd contract double %351, %359
  %361 = or i32 %352, 1
  %362 = add nsw i32 %361, %211
  %363 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %362
  %364 = addrspacecast double addrspace(3)* %363 to double*
  %365 = load volatile double, double* %364, align 8, !tbaa !4
  %366 = load volatile double, double* %364, align 8, !tbaa !4
  %367 = fmul contract double %365, %366
  %368 = fadd contract double %360, %367
  %369 = or i32 %352, 2
  %370 = add nsw i32 %369, %211
  %371 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %370
  %372 = addrspacecast double addrspace(3)* %371 to double*
  %373 = load volatile double, double* %372, align 8, !tbaa !4
  %374 = load volatile double, double* %372, align 8, !tbaa !4
  %375 = fmul contract double %373, %374
  %376 = fadd contract double %368, %375
  %377 = or i32 %352, 3
  %378 = add nsw i32 %377, %211
  %379 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %378
  %380 = addrspacecast double addrspace(3)* %379 to double*
  %381 = load volatile double, double* %380, align 8, !tbaa !4
  %382 = load volatile double, double* %380, align 8, !tbaa !4
  %383 = fmul contract double %381, %382
  %384 = fadd contract double %376, %383
  %385 = or i32 %352, 4
  %386 = add nsw i32 %385, %211
  %387 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %386
  %388 = addrspacecast double addrspace(3)* %387 to double*
  %389 = load volatile double, double* %388, align 8, !tbaa !4
  %390 = load volatile double, double* %388, align 8, !tbaa !4
  %391 = fmul contract double %389, %390
  %392 = fadd contract double %384, %391
  %393 = or i32 %352, 5
  %394 = add nsw i32 %393, %211
  %395 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %394
  %396 = addrspacecast double addrspace(3)* %395 to double*
  %397 = load volatile double, double* %396, align 8, !tbaa !4
  %398 = load volatile double, double* %396, align 8, !tbaa !4
  %399 = fmul contract double %397, %398
  %400 = fadd contract double %392, %399
  %401 = or i32 %352, 6
  %402 = add nsw i32 %401, %211
  %403 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %402
  %404 = addrspacecast double addrspace(3)* %403 to double*
  %405 = load volatile double, double* %404, align 8, !tbaa !4
  %406 = load volatile double, double* %404, align 8, !tbaa !4
  %407 = fmul contract double %405, %406
  %408 = fadd contract double %400, %407
  %409 = or i32 %352, 7
  %410 = add nsw i32 %409, %211
  %411 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %410
  %412 = addrspacecast double addrspace(3)* %411 to double*
  %413 = load volatile double, double* %412, align 8, !tbaa !4
  %414 = load volatile double, double* %412, align 8, !tbaa !4
  %415 = fmul contract double %413, %414
  %416 = fadd contract double %408, %415
  %417 = add nuw nsw i32 %352, 8
  %418 = add i32 %353, 8
  %419 = icmp eq i32 %418, %203
  br i1 %419, label %420, label %350, !llvm.loop !18

420:                                              ; preds = %350, %349
  %421 = phi double [ undef, %349 ], [ %416, %350 ]
  %422 = phi double [ 0x3EE4F8B580000000, %349 ], [ %416, %350 ]
  %423 = phi i32 [ 0, %349 ], [ %417, %350 ]
  br i1 %204, label %438, label %424

424:                                              ; preds = %420, %424
  %425 = phi double [ %434, %424 ], [ %422, %420 ]
  %426 = phi i32 [ %435, %424 ], [ %423, %420 ]
  %427 = phi i32 [ %436, %424 ], [ 0, %420 ]
  %428 = add nsw i32 %426, %211
  %429 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %428
  %430 = addrspacecast double addrspace(3)* %429 to double*
  %431 = load volatile double, double* %430, align 8, !tbaa !4
  %432 = load volatile double, double* %430, align 8, !tbaa !4
  %433 = fmul contract double %431, %432
  %434 = fadd contract double %425, %433
  %435 = add nuw nsw i32 %426, 1
  %436 = add i32 %427, 1
  %437 = icmp eq i32 %436, %201
  br i1 %437, label %438, label %424, !llvm.loop !19

438:                                              ; preds = %420, %424, %348
  %439 = phi double [ 0x3EE4F8B580000000, %348 ], [ %421, %420 ], [ %434, %424 ]
  %440 = fcmp olt double %439, 0x1000000000000000
  %441 = select i1 %440, double 0x4FF0000000000000, double 1.000000e+00
  %442 = fmul double %439, %441
  %443 = tail call double @llvm.amdgcn.rsq.f64(double %442)
  %444 = fmul double %442, %443
  %445 = fmul double %443, 5.000000e-01
  %446 = fneg double %445
  %447 = tail call double @llvm.fma.f64(double %446, double %444, double 5.000000e-01)
  %448 = tail call double @llvm.fma.f64(double %445, double %447, double %445)
  %449 = tail call double @llvm.fma.f64(double %444, double %447, double %444)
  %450 = fneg double %449
  %451 = tail call double @llvm.fma.f64(double %450, double %449, double %442)
  %452 = tail call double @llvm.fma.f64(double %451, double %448, double %449)
  %453 = fneg double %452
  %454 = tail call double @llvm.fma.f64(double %453, double %452, double %442)
  %455 = tail call double @llvm.fma.f64(double %454, double %448, double %452)
  %456 = select i1 %440, double 0x37F0000000000000, double 1.000000e+00
  %457 = fmul double %456, %455
  %458 = fcmp oeq double %442, 0.000000e+00
  %459 = fcmp oeq double %442, 0x7FF0000000000000
  %460 = or i1 %458, %459
  %461 = select i1 %460, double %442, double %457
  store volatile double %461, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([1 x double], [1 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2xN, i32 0, i32 0) to double*), align 8, !tbaa !4
  br label %462

462:                                              ; preds = %438, %347
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %463 = load volatile double, double* addrspacecast (double addrspace(3)* getelementptr inbounds ([1 x double], [1 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2xN, i32 0, i32 0) to double*), align 8, !tbaa !4
  %464 = fdiv contract double %345, %463
  store volatile double %464, double* %214, align 8, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %465

465:                                              ; preds = %344, %462
  %466 = add nuw nsw i32 %218, 1
  %467 = icmp eq i32 %466, 100
  br i1 %467, label %215, label %217, !llvm.loop !20

468:                                              ; preds = %216, %468
  %469 = phi i32 [ %518, %468 ], [ 0, %216 ]
  %470 = phi i32 [ %519, %468 ], [ 0, %216 ]
  %471 = add nsw i32 %469, %211
  %472 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %471
  %473 = addrspacecast double addrspace(3)* %472 to double*
  %474 = load volatile double, double* %473, align 8, !tbaa !4
  %475 = fmul contract double %345, %474
  %476 = mul nsw i32 %469, %7
  %477 = add nsw i32 %476, %18
  %478 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %477
  %479 = addrspacecast double addrspace(3)* %478 to double*
  %480 = load volatile double, double* %479, align 8, !tbaa !4
  %481 = fsub contract double %480, %475
  store volatile double %481, double* %479, align 8, !tbaa !4
  %482 = or i32 %469, 1
  %483 = add nsw i32 %482, %211
  %484 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %483
  %485 = addrspacecast double addrspace(3)* %484 to double*
  %486 = load volatile double, double* %485, align 8, !tbaa !4
  %487 = fmul contract double %345, %486
  %488 = mul nsw i32 %482, %7
  %489 = add nsw i32 %488, %18
  %490 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %489
  %491 = addrspacecast double addrspace(3)* %490 to double*
  %492 = load volatile double, double* %491, align 8, !tbaa !4
  %493 = fsub contract double %492, %487
  store volatile double %493, double* %491, align 8, !tbaa !4
  %494 = or i32 %469, 2
  %495 = add nsw i32 %494, %211
  %496 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %495
  %497 = addrspacecast double addrspace(3)* %496 to double*
  %498 = load volatile double, double* %497, align 8, !tbaa !4
  %499 = fmul contract double %345, %498
  %500 = mul nsw i32 %494, %7
  %501 = add nsw i32 %500, %18
  %502 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %501
  %503 = addrspacecast double addrspace(3)* %502 to double*
  %504 = load volatile double, double* %503, align 8, !tbaa !4
  %505 = fsub contract double %504, %499
  store volatile double %505, double* %503, align 8, !tbaa !4
  %506 = or i32 %469, 3
  %507 = add nsw i32 %506, %211
  %508 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %507
  %509 = addrspacecast double addrspace(3)* %508 to double*
  %510 = load volatile double, double* %509, align 8, !tbaa !4
  %511 = fmul contract double %345, %510
  %512 = mul nsw i32 %506, %7
  %513 = add nsw i32 %512, %18
  %514 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %513
  %515 = addrspacecast double addrspace(3)* %514 to double*
  %516 = load volatile double, double* %515, align 8, !tbaa !4
  %517 = fsub contract double %516, %511
  store volatile double %517, double* %515, align 8, !tbaa !4
  %518 = add nuw nsw i32 %469, 4
  %519 = add i32 %470, 4
  %520 = icmp eq i32 %519, %207
  br i1 %520, label %521, label %468, !llvm.loop !21

521:                                              ; preds = %468, %216
  %522 = phi i32 [ 0, %216 ], [ %518, %468 ]
  br i1 %208, label %540, label %523

523:                                              ; preds = %521, %523
  %524 = phi i32 [ %537, %523 ], [ %522, %521 ]
  %525 = phi i32 [ %538, %523 ], [ 0, %521 ]
  %526 = add nsw i32 %524, %211
  %527 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %526
  %528 = addrspacecast double addrspace(3)* %527 to double*
  %529 = load volatile double, double* %528, align 8, !tbaa !4
  %530 = fmul contract double %345, %529
  %531 = mul nsw i32 %524, %7
  %532 = add nsw i32 %531, %18
  %533 = getelementptr inbounds [5041 x double], [5041 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E4swtw, i32 0, i32 %532
  %534 = addrspacecast double addrspace(3)* %533 to double*
  %535 = load volatile double, double* %534, align 8, !tbaa !4
  %536 = fsub contract double %535, %530
  store volatile double %536, double* %534, align 8, !tbaa !4
  %537 = add nuw nsw i32 %524, 1
  %538 = add i32 %525, 1
  %539 = icmp eq i32 %538, %205
  br i1 %539, label %540, label %523, !llvm.loop !22

540:                                              ; preds = %521, %523, %215
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %541 = add nuw nsw i32 %210, 1
  %542 = icmp eq i32 %541, %11
  br i1 %542, label %543, label %209, !llvm.loop !23

543:                                              ; preds = %540, %194
  %544 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %17
  %545 = addrspacecast double addrspace(3)* %544 to double*
  %546 = load volatile double, double* %545, align 8, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %547 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %18
  %548 = addrspacecast double addrspace(3)* %547 to double*
  %549 = load volatile double, double* %548, align 8, !tbaa !4
  %550 = fneg contract double %549
  %551 = tail call double @llvm.copysign.f64(double 1.000000e+00, double %546)
  %552 = fmul contract double %551, %550
  store volatile double %552, double* %548, align 8, !tbaa !4
  br i1 %46, label %553, label %623

553:                                              ; preds = %543
  %554 = mul nsw i32 %19, %7
  %555 = add nsw i32 %554, %18
  %556 = and i32 %11, 3
  %557 = icmp ult i32 %11, 4
  br i1 %557, label %605, label %558

558:                                              ; preds = %553
  %559 = and i32 %11, -4
  br label %560

560:                                              ; preds = %560, %558
  %561 = phi i32 [ 0, %558 ], [ %602, %560 ]
  %562 = phi i32 [ 0, %558 ], [ %603, %560 ]
  %563 = mul nsw i32 %561, %7
  %564 = add nsw i32 %563, %18
  %565 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %564
  %566 = addrspacecast double addrspace(3)* %565 to double*
  %567 = load volatile double, double* %566, align 8, !tbaa !4
  %568 = mul nsw i32 %563, %14
  %569 = add nsw i32 %555, %568
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds double, double addrspace(1)* %2, i64 %570
  store double %567, double addrspace(1)* %571, align 8, !tbaa !4
  %572 = or i32 %561, 1
  %573 = mul nsw i32 %572, %7
  %574 = add nsw i32 %573, %18
  %575 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %574
  %576 = addrspacecast double addrspace(3)* %575 to double*
  %577 = load volatile double, double* %576, align 8, !tbaa !4
  %578 = mul nsw i32 %573, %14
  %579 = add nsw i32 %555, %578
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds double, double addrspace(1)* %2, i64 %580
  store double %577, double addrspace(1)* %581, align 8, !tbaa !4
  %582 = or i32 %561, 2
  %583 = mul nsw i32 %582, %7
  %584 = add nsw i32 %583, %18
  %585 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %584
  %586 = addrspacecast double addrspace(3)* %585 to double*
  %587 = load volatile double, double* %586, align 8, !tbaa !4
  %588 = mul nsw i32 %583, %14
  %589 = add nsw i32 %555, %588
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds double, double addrspace(1)* %2, i64 %590
  store double %587, double addrspace(1)* %591, align 8, !tbaa !4
  %592 = or i32 %561, 3
  %593 = mul nsw i32 %592, %7
  %594 = add nsw i32 %593, %18
  %595 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %594
  %596 = addrspacecast double addrspace(3)* %595 to double*
  %597 = load volatile double, double* %596, align 8, !tbaa !4
  %598 = mul nsw i32 %593, %14
  %599 = add nsw i32 %555, %598
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds double, double addrspace(1)* %2, i64 %600
  store double %597, double addrspace(1)* %601, align 8, !tbaa !4
  %602 = add nuw nsw i32 %561, 4
  %603 = add i32 %562, 4
  %604 = icmp eq i32 %603, %559
  br i1 %604, label %605, label %560, !llvm.loop !24

605:                                              ; preds = %560, %553
  %606 = phi i32 [ 0, %553 ], [ %602, %560 ]
  %607 = icmp eq i32 %556, 0
  br i1 %607, label %623, label %608

608:                                              ; preds = %605, %608
  %609 = phi i32 [ %620, %608 ], [ %606, %605 ]
  %610 = phi i32 [ %621, %608 ], [ 0, %605 ]
  %611 = mul nsw i32 %609, %7
  %612 = add nsw i32 %611, %18
  %613 = getelementptr inbounds [213 x double], [213 x double] addrspace(3)* @_ZZ4getWPKdPdS1_E2sW, i32 0, i32 %612
  %614 = addrspacecast double addrspace(3)* %613 to double*
  %615 = load volatile double, double* %614, align 8, !tbaa !4
  %616 = mul nsw i32 %611, %14
  %617 = add nsw i32 %555, %616
  %618 = sext i32 %617 to i64
  %619 = getelementptr inbounds double, double addrspace(1)* %2, i64 %618
  store double %615, double addrspace(1)* %619, align 8, !tbaa !4
  %620 = add nuw nsw i32 %609, 1
  %621 = add i32 %610, 1
  %622 = icmp eq i32 %621, %556
  br i1 %622, label %623, label %608, !llvm.loop !25

623:                                              ; preds = %605, %608, %543
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

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
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !11}
