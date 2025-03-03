; ModuleID = '../data/hip_kernels/4786/0/main.cu'
source_filename = "../data/hip_kernels/4786/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@localMatrix = external protected local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12Cholesky_GPUPdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %26

5:                                                ; preds = %2
  %6 = add i32 %1, -1
  %7 = and i32 %1, 7
  %8 = icmp ult i32 %6, 7
  br i1 %8, label %11, label %9

9:                                                ; preds = %5
  %10 = and i32 %1, -8
  br label %34

11:                                               ; preds = %34, %5
  %12 = phi i32 [ 0, %5 ], [ %92, %34 ]
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %26, label %14

14:                                               ; preds = %11, %14
  %15 = phi i32 [ %23, %14 ], [ %12, %11 ]
  %16 = phi i32 [ %24, %14 ], [ 0, %11 ]
  %17 = mul nsw i32 %15, %1
  %18 = add nsw i32 %17, %3
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %18
  store double %21, double addrspace(3)* %22, align 8, !tbaa !5
  %23 = add nuw nsw i32 %15, 1
  %24 = add i32 %16, 1
  %25 = icmp eq i32 %24, %7
  br i1 %25, label %26, label %14, !llvm.loop !10

26:                                               ; preds = %11, %14, %2
  %27 = mul nsw i32 %1, %1
  %28 = add nuw nsw i32 %27, %3
  %29 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %28
  store double 0.000000e+00, double addrspace(3)* %29, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %4, label %30, label %95

30:                                               ; preds = %26
  %31 = mul nsw i32 %3, %1
  %32 = add nsw i32 %31, %3
  %33 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %32
  br label %102

34:                                               ; preds = %34, %9
  %35 = phi i32 [ 0, %9 ], [ %92, %34 ]
  %36 = phi i32 [ 0, %9 ], [ %93, %34 ]
  %37 = mul nsw i32 %35, %1
  %38 = add nsw i32 %37, %3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !5, !amdgpu.noclobber !9
  %42 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %38
  store double %41, double addrspace(3)* %42, align 8, !tbaa !5
  %43 = or i32 %35, 1
  %44 = mul nsw i32 %43, %1
  %45 = add nsw i32 %44, %3
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !5, !amdgpu.noclobber !9
  %49 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %45
  store double %48, double addrspace(3)* %49, align 8, !tbaa !5
  %50 = or i32 %35, 2
  %51 = mul nsw i32 %50, %1
  %52 = add nsw i32 %51, %3
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !5, !amdgpu.noclobber !9
  %56 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %52
  store double %55, double addrspace(3)* %56, align 8, !tbaa !5
  %57 = or i32 %35, 3
  %58 = mul nsw i32 %57, %1
  %59 = add nsw i32 %58, %3
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !5, !amdgpu.noclobber !9
  %63 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %59
  store double %62, double addrspace(3)* %63, align 8, !tbaa !5
  %64 = or i32 %35, 4
  %65 = mul nsw i32 %64, %1
  %66 = add nsw i32 %65, %3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !9
  %70 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %66
  store double %69, double addrspace(3)* %70, align 8, !tbaa !5
  %71 = or i32 %35, 5
  %72 = mul nsw i32 %71, %1
  %73 = add nsw i32 %72, %3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !5, !amdgpu.noclobber !9
  %77 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %73
  store double %76, double addrspace(3)* %77, align 8, !tbaa !5
  %78 = or i32 %35, 6
  %79 = mul nsw i32 %78, %1
  %80 = add nsw i32 %79, %3
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !5, !amdgpu.noclobber !9
  %84 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %80
  store double %83, double addrspace(3)* %84, align 8, !tbaa !5
  %85 = or i32 %35, 7
  %86 = mul nsw i32 %85, %1
  %87 = add nsw i32 %86, %3
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %0, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !5, !amdgpu.noclobber !9
  %91 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %87
  store double %90, double addrspace(3)* %91, align 8, !tbaa !5
  %92 = add nuw nsw i32 %35, 8
  %93 = add i32 %36, 8
  %94 = icmp eq i32 %93, %10
  br i1 %94, label %11, label %34, !llvm.loop !12

95:                                               ; preds = %264, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %4, label %96, label %282

96:                                               ; preds = %95
  %97 = add i32 %1, -1
  %98 = and i32 %1, 7
  %99 = icmp ult i32 %97, 7
  br i1 %99, label %267, label %100

100:                                              ; preds = %96
  %101 = and i32 %1, -8
  br label %283

102:                                              ; preds = %30, %264
  %103 = phi i32 [ %265, %264 ], [ 0, %30 ]
  %104 = icmp ult i32 %3, %103
  br i1 %104, label %105, label %109

105:                                              ; preds = %102
  %106 = mul nsw i32 %103, %1
  %107 = add nsw i32 %106, %3
  %108 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %107
  store double 0.000000e+00, double addrspace(3)* %108, align 8, !tbaa !5
  br label %264

109:                                              ; preds = %102
  store double 0.000000e+00, double addrspace(3)* %29, align 8, !tbaa !5
  %110 = icmp eq i32 %103, 0
  br i1 %110, label %137, label %111

111:                                              ; preds = %109
  %112 = and i32 %103, 7
  %113 = icmp ult i32 %103, 8
  br i1 %113, label %116, label %114

114:                                              ; preds = %111
  %115 = and i32 %103, 2147483640
  br label %140

116:                                              ; preds = %140, %111
  %117 = phi double [ undef, %111 ], [ %222, %140 ]
  %118 = phi double [ 0.000000e+00, %111 ], [ %222, %140 ]
  %119 = phi i32 [ 0, %111 ], [ %223, %140 ]
  %120 = icmp eq i32 %112, 0
  br i1 %120, label %137, label %121

121:                                              ; preds = %116, %121
  %122 = phi double [ %133, %121 ], [ %118, %116 ]
  %123 = phi i32 [ %134, %121 ], [ %119, %116 ]
  %124 = phi i32 [ %135, %121 ], [ 0, %116 ]
  %125 = mul nsw i32 %123, %1
  %126 = add nsw i32 %125, %103
  %127 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %126
  %128 = load double, double addrspace(3)* %127, align 8, !tbaa !5
  %129 = add nsw i32 %125, %3
  %130 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %129
  %131 = load double, double addrspace(3)* %130, align 8, !tbaa !5
  %132 = fmul contract double %128, %131
  %133 = fadd contract double %122, %132
  store double %133, double addrspace(3)* %29, align 8, !tbaa !5
  %134 = add nuw nsw i32 %123, 1
  %135 = add i32 %124, 1
  %136 = icmp eq i32 %135, %112
  br i1 %136, label %137, label %121, !llvm.loop !14

137:                                              ; preds = %116, %121, %109
  %138 = phi double [ 0.000000e+00, %109 ], [ %117, %116 ], [ %133, %121 ]
  %139 = icmp eq i32 %103, %3
  br i1 %139, label %226, label %251

140:                                              ; preds = %140, %114
  %141 = phi double [ 0.000000e+00, %114 ], [ %222, %140 ]
  %142 = phi i32 [ 0, %114 ], [ %223, %140 ]
  %143 = phi i32 [ 0, %114 ], [ %224, %140 ]
  %144 = mul nsw i32 %142, %1
  %145 = add nsw i32 %144, %103
  %146 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %145
  %147 = load double, double addrspace(3)* %146, align 8, !tbaa !5
  %148 = add nsw i32 %144, %3
  %149 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %148
  %150 = load double, double addrspace(3)* %149, align 8, !tbaa !5
  %151 = fmul contract double %147, %150
  %152 = fadd contract double %141, %151
  store double %152, double addrspace(3)* %29, align 8, !tbaa !5
  %153 = or i32 %142, 1
  %154 = mul nsw i32 %153, %1
  %155 = add nsw i32 %154, %103
  %156 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %155
  %157 = load double, double addrspace(3)* %156, align 8, !tbaa !5
  %158 = add nsw i32 %154, %3
  %159 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %158
  %160 = load double, double addrspace(3)* %159, align 8, !tbaa !5
  %161 = fmul contract double %157, %160
  %162 = fadd contract double %152, %161
  store double %162, double addrspace(3)* %29, align 8, !tbaa !5
  %163 = or i32 %142, 2
  %164 = mul nsw i32 %163, %1
  %165 = add nsw i32 %164, %103
  %166 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %165
  %167 = load double, double addrspace(3)* %166, align 8, !tbaa !5
  %168 = add nsw i32 %164, %3
  %169 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %168
  %170 = load double, double addrspace(3)* %169, align 8, !tbaa !5
  %171 = fmul contract double %167, %170
  %172 = fadd contract double %162, %171
  store double %172, double addrspace(3)* %29, align 8, !tbaa !5
  %173 = or i32 %142, 3
  %174 = mul nsw i32 %173, %1
  %175 = add nsw i32 %174, %103
  %176 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %175
  %177 = load double, double addrspace(3)* %176, align 8, !tbaa !5
  %178 = add nsw i32 %174, %3
  %179 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %178
  %180 = load double, double addrspace(3)* %179, align 8, !tbaa !5
  %181 = fmul contract double %177, %180
  %182 = fadd contract double %172, %181
  store double %182, double addrspace(3)* %29, align 8, !tbaa !5
  %183 = or i32 %142, 4
  %184 = mul nsw i32 %183, %1
  %185 = add nsw i32 %184, %103
  %186 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %185
  %187 = load double, double addrspace(3)* %186, align 8, !tbaa !5
  %188 = add nsw i32 %184, %3
  %189 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %188
  %190 = load double, double addrspace(3)* %189, align 8, !tbaa !5
  %191 = fmul contract double %187, %190
  %192 = fadd contract double %182, %191
  store double %192, double addrspace(3)* %29, align 8, !tbaa !5
  %193 = or i32 %142, 5
  %194 = mul nsw i32 %193, %1
  %195 = add nsw i32 %194, %103
  %196 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %195
  %197 = load double, double addrspace(3)* %196, align 8, !tbaa !5
  %198 = add nsw i32 %194, %3
  %199 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %198
  %200 = load double, double addrspace(3)* %199, align 8, !tbaa !5
  %201 = fmul contract double %197, %200
  %202 = fadd contract double %192, %201
  store double %202, double addrspace(3)* %29, align 8, !tbaa !5
  %203 = or i32 %142, 6
  %204 = mul nsw i32 %203, %1
  %205 = add nsw i32 %204, %103
  %206 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %205
  %207 = load double, double addrspace(3)* %206, align 8, !tbaa !5
  %208 = add nsw i32 %204, %3
  %209 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %208
  %210 = load double, double addrspace(3)* %209, align 8, !tbaa !5
  %211 = fmul contract double %207, %210
  %212 = fadd contract double %202, %211
  store double %212, double addrspace(3)* %29, align 8, !tbaa !5
  %213 = or i32 %142, 7
  %214 = mul nsw i32 %213, %1
  %215 = add nsw i32 %214, %103
  %216 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %215
  %217 = load double, double addrspace(3)* %216, align 8, !tbaa !5
  %218 = add nsw i32 %214, %3
  %219 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %218
  %220 = load double, double addrspace(3)* %219, align 8, !tbaa !5
  %221 = fmul contract double %217, %220
  %222 = fadd contract double %212, %221
  store double %222, double addrspace(3)* %29, align 8, !tbaa !5
  %223 = add nuw nsw i32 %142, 8
  %224 = add i32 %143, 8
  %225 = icmp eq i32 %224, %115
  br i1 %225, label %116, label %140, !llvm.loop !15

226:                                              ; preds = %137
  %227 = load double, double addrspace(3)* %33, align 8, !tbaa !5
  %228 = fsub contract double %227, %138
  %229 = fcmp olt double %228, 0x1000000000000000
  %230 = select i1 %229, double 0x4FF0000000000000, double 1.000000e+00
  %231 = fmul double %228, %230
  %232 = tail call double @llvm.amdgcn.rsq.f64(double %231)
  %233 = fmul double %231, %232
  %234 = fmul double %232, 5.000000e-01
  %235 = fneg double %234
  %236 = tail call double @llvm.fma.f64(double %235, double %233, double 5.000000e-01)
  %237 = tail call double @llvm.fma.f64(double %234, double %236, double %234)
  %238 = tail call double @llvm.fma.f64(double %233, double %236, double %233)
  %239 = fneg double %238
  %240 = tail call double @llvm.fma.f64(double %239, double %238, double %231)
  %241 = tail call double @llvm.fma.f64(double %240, double %237, double %238)
  %242 = fneg double %241
  %243 = tail call double @llvm.fma.f64(double %242, double %241, double %231)
  %244 = tail call double @llvm.fma.f64(double %243, double %237, double %241)
  %245 = select i1 %229, double 0x37F0000000000000, double 1.000000e+00
  %246 = fmul double %245, %244
  %247 = fcmp oeq double %231, 0.000000e+00
  %248 = fcmp oeq double %231, 0x7FF0000000000000
  %249 = or i1 %247, %248
  %250 = select i1 %249, double %231, double %246
  store double %250, double addrspace(3)* %33, align 8, !tbaa !5
  br label %251

251:                                              ; preds = %226, %137
  %252 = icmp ugt i32 %3, %103
  br i1 %252, label %253, label %264

253:                                              ; preds = %251
  %254 = mul nsw i32 %103, %1
  %255 = add nsw i32 %254, %3
  %256 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %255
  %257 = load double, double addrspace(3)* %256, align 8, !tbaa !5
  %258 = load double, double addrspace(3)* %29, align 8, !tbaa !5
  %259 = fsub contract double %257, %258
  %260 = add nsw i32 %254, %103
  %261 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %260
  %262 = load double, double addrspace(3)* %261, align 8, !tbaa !5
  %263 = fdiv contract double %259, %262
  store double %263, double addrspace(3)* %256, align 8, !tbaa !5
  br label %264

264:                                              ; preds = %105, %253, %251
  %265 = add nuw nsw i32 %103, 1
  %266 = icmp eq i32 %265, %1
  br i1 %266, label %95, label %102, !llvm.loop !16

267:                                              ; preds = %283, %96
  %268 = phi i32 [ 0, %96 ], [ %341, %283 ]
  %269 = icmp eq i32 %98, 0
  br i1 %269, label %282, label %270

270:                                              ; preds = %267, %270
  %271 = phi i32 [ %279, %270 ], [ %268, %267 ]
  %272 = phi i32 [ %280, %270 ], [ 0, %267 ]
  %273 = mul nsw i32 %271, %1
  %274 = add nsw i32 %273, %3
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %274
  %277 = load double, double addrspace(3)* %276, align 8, !tbaa !5
  %278 = getelementptr inbounds double, double addrspace(1)* %0, i64 %275
  store double %277, double addrspace(1)* %278, align 8, !tbaa !5
  %279 = add nuw nsw i32 %271, 1
  %280 = add i32 %272, 1
  %281 = icmp eq i32 %280, %98
  br i1 %281, label %282, label %270, !llvm.loop !18

282:                                              ; preds = %267, %270, %95
  ret void

283:                                              ; preds = %283, %100
  %284 = phi i32 [ 0, %100 ], [ %341, %283 ]
  %285 = phi i32 [ 0, %100 ], [ %342, %283 ]
  %286 = mul nsw i32 %284, %1
  %287 = add nsw i32 %286, %3
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %287
  %290 = load double, double addrspace(3)* %289, align 8, !tbaa !5
  %291 = getelementptr inbounds double, double addrspace(1)* %0, i64 %288
  store double %290, double addrspace(1)* %291, align 8, !tbaa !5
  %292 = or i32 %284, 1
  %293 = mul nsw i32 %292, %1
  %294 = add nsw i32 %293, %3
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %294
  %297 = load double, double addrspace(3)* %296, align 8, !tbaa !5
  %298 = getelementptr inbounds double, double addrspace(1)* %0, i64 %295
  store double %297, double addrspace(1)* %298, align 8, !tbaa !5
  %299 = or i32 %284, 2
  %300 = mul nsw i32 %299, %1
  %301 = add nsw i32 %300, %3
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %301
  %304 = load double, double addrspace(3)* %303, align 8, !tbaa !5
  %305 = getelementptr inbounds double, double addrspace(1)* %0, i64 %302
  store double %304, double addrspace(1)* %305, align 8, !tbaa !5
  %306 = or i32 %284, 3
  %307 = mul nsw i32 %306, %1
  %308 = add nsw i32 %307, %3
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %308
  %311 = load double, double addrspace(3)* %310, align 8, !tbaa !5
  %312 = getelementptr inbounds double, double addrspace(1)* %0, i64 %309
  store double %311, double addrspace(1)* %312, align 8, !tbaa !5
  %313 = or i32 %284, 4
  %314 = mul nsw i32 %313, %1
  %315 = add nsw i32 %314, %3
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %315
  %318 = load double, double addrspace(3)* %317, align 8, !tbaa !5
  %319 = getelementptr inbounds double, double addrspace(1)* %0, i64 %316
  store double %318, double addrspace(1)* %319, align 8, !tbaa !5
  %320 = or i32 %284, 5
  %321 = mul nsw i32 %320, %1
  %322 = add nsw i32 %321, %3
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %322
  %325 = load double, double addrspace(3)* %324, align 8, !tbaa !5
  %326 = getelementptr inbounds double, double addrspace(1)* %0, i64 %323
  store double %325, double addrspace(1)* %326, align 8, !tbaa !5
  %327 = or i32 %284, 6
  %328 = mul nsw i32 %327, %1
  %329 = add nsw i32 %328, %3
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %329
  %332 = load double, double addrspace(3)* %331, align 8, !tbaa !5
  %333 = getelementptr inbounds double, double addrspace(1)* %0, i64 %330
  store double %332, double addrspace(1)* %333, align 8, !tbaa !5
  %334 = or i32 %284, 7
  %335 = mul nsw i32 %334, %1
  %336 = add nsw i32 %335, %3
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @localMatrix, i32 0, i32 %336
  %339 = load double, double addrspace(3)* %338, align 8, !tbaa !5
  %340 = getelementptr inbounds double, double addrspace(1)* %0, i64 %337
  store double %339, double addrspace(1)* %340, align 8, !tbaa !5
  %341 = add nuw nsw i32 %284, 8
  %342 = add i32 %285, 8
  %343 = icmp eq i32 %342, %101
  br i1 %343, label %267, label %283, !llvm.loop !19
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13, !17}
!17 = !{!"llvm.loop.unroll.enable"}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
