; ModuleID = '../data/hip_kernels/1088/21/main.cu'
source_filename = "../data/hip_kernels/1088/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@memory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kernel2DXnpPdS_PKdiiiiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = mul nsw i32 %7, %6
  %12 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %11
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %32

14:                                               ; preds = %10
  %15 = and i32 %3, 7
  %16 = icmp ult i32 %3, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %3, -8
  br label %52

19:                                               ; preds = %52, %14
  %20 = phi i32 [ 0, %14 ], [ %94, %52 ]
  %21 = icmp eq i32 %15, 0
  br i1 %21, label %32, label %22

22:                                               ; preds = %19, %22
  %23 = phi i32 [ %29, %22 ], [ %20, %19 ]
  %24 = phi i32 [ %30, %22 ], [ 0, %19 ]
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !4, !amdgpu.noclobber !8
  %28 = getelementptr inbounds double, double addrspace(3)* %12, i32 %23
  store double %27, double addrspace(3)* %28, align 8, !tbaa !4
  %29 = add nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 %24, 1
  %31 = icmp eq i32 %30, %15
  br i1 %31, label %32, label %22, !llvm.loop !9

32:                                               ; preds = %22, %19, %10
  %33 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = getelementptr i8, i8 addrspace(4)* %33, i64 4
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !11, !invariant.load !8
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %41 = add i32 %39, %40
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = getelementptr i8, i8 addrspace(4)* %33, i64 6
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 2, !range !11, !invariant.load !8
  %46 = zext i16 %45 to i32
  %47 = mul i32 %42, %46
  %48 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %49 = add i32 %47, %48
  %50 = add i32 %40, %4
  %51 = icmp eq i32 %34, 0
  br i1 %51, label %227, label %97

52:                                               ; preds = %52, %17
  %53 = phi i32 [ 0, %17 ], [ %94, %52 ]
  %54 = phi i32 [ 0, %17 ], [ %95, %52 ]
  %55 = zext i32 %53 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !4, !amdgpu.noclobber !8
  %58 = getelementptr inbounds double, double addrspace(3)* %12, i32 %53
  store double %57, double addrspace(3)* %58, align 8, !tbaa !4
  %59 = or i32 %53, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !4, !amdgpu.noclobber !8
  %63 = getelementptr inbounds double, double addrspace(3)* %12, i32 %59
  store double %62, double addrspace(3)* %63, align 8, !tbaa !4
  %64 = or i32 %53, 2
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %2, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !4, !amdgpu.noclobber !8
  %68 = getelementptr inbounds double, double addrspace(3)* %12, i32 %64
  store double %67, double addrspace(3)* %68, align 8, !tbaa !4
  %69 = or i32 %53, 3
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %2, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !4, !amdgpu.noclobber !8
  %73 = getelementptr inbounds double, double addrspace(3)* %12, i32 %69
  store double %72, double addrspace(3)* %73, align 8, !tbaa !4
  %74 = or i32 %53, 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %2, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !4, !amdgpu.noclobber !8
  %78 = getelementptr inbounds double, double addrspace(3)* %12, i32 %74
  store double %77, double addrspace(3)* %78, align 8, !tbaa !4
  %79 = or i32 %53, 5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !4, !amdgpu.noclobber !8
  %83 = getelementptr inbounds double, double addrspace(3)* %12, i32 %79
  store double %82, double addrspace(3)* %83, align 8, !tbaa !4
  %84 = or i32 %53, 6
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !4, !amdgpu.noclobber !8
  %88 = getelementptr inbounds double, double addrspace(3)* %12, i32 %84
  store double %87, double addrspace(3)* %88, align 8, !tbaa !4
  %89 = or i32 %53, 7
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %2, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !4, !amdgpu.noclobber !8
  %93 = getelementptr inbounds double, double addrspace(3)* %12, i32 %89
  store double %92, double addrspace(3)* %93, align 8, !tbaa !4
  %94 = add nuw nsw i32 %53, 8
  %95 = add nuw i32 %54, 8
  %96 = icmp eq i32 %95, %18
  br i1 %96, label %19, label %52, !llvm.loop !13

97:                                               ; preds = %32
  %98 = sdiv i32 %9, %8
  %99 = add nsw i32 %98, -1
  %100 = icmp eq i32 %34, %99
  br i1 %100, label %227, label %101

101:                                              ; preds = %97
  %102 = mul nsw i32 %49, %9
  %103 = add nsw i32 %102, %41
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %1, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !4, !amdgpu.noclobber !8
  %107 = mul nsw i32 %48, %6
  %108 = add i32 %107, %50
  %109 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %108
  store double %106, double addrspace(3)* %109, align 8, !tbaa !4
  %110 = icmp ult i32 %40, %4
  br i1 %110, label %111, label %119

111:                                              ; preds = %101
  %112 = sub i32 %41, %4
  %113 = add nsw i32 %112, %102
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !4, !amdgpu.noclobber !8
  %117 = add i32 %107, %40
  %118 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %117
  store double %116, double addrspace(3)* %118, align 8, !tbaa !4
  br label %119

119:                                              ; preds = %111, %101
  %120 = icmp ult i32 %40, %5
  br i1 %120, label %121, label %128

121:                                              ; preds = %119
  %122 = add nsw i32 %103, %8
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !4, !amdgpu.noclobber !8
  %126 = add i32 %108, %8
  %127 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %126
  store double %125, double addrspace(3)* %127, align 8, !tbaa !4
  br label %128

128:                                              ; preds = %121, %119
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = add i32 %107, %40
  br i1 %13, label %130, label %154

130:                                              ; preds = %128
  %131 = and i32 %3, 7
  %132 = icmp ult i32 %3, 8
  br i1 %132, label %135, label %133

133:                                              ; preds = %130
  %134 = and i32 %3, -8
  br label %157

135:                                              ; preds = %157, %130
  %136 = phi double [ undef, %130 ], [ %223, %157 ]
  %137 = phi i32 [ 0, %130 ], [ %224, %157 ]
  %138 = phi double [ 0.000000e+00, %130 ], [ %223, %157 ]
  %139 = icmp eq i32 %131, 0
  br i1 %139, label %154, label %140

140:                                              ; preds = %135, %140
  %141 = phi i32 [ %151, %140 ], [ %137, %135 ]
  %142 = phi double [ %150, %140 ], [ %138, %135 ]
  %143 = phi i32 [ %152, %140 ], [ 0, %135 ]
  %144 = getelementptr inbounds double, double addrspace(3)* %12, i32 %141
  %145 = load double, double addrspace(3)* %144, align 8, !tbaa !4
  %146 = add nsw i32 %129, %141
  %147 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %146
  %148 = load double, double addrspace(3)* %147, align 8, !tbaa !4
  %149 = fmul contract double %145, %148
  %150 = fadd contract double %142, %149
  %151 = add nuw nsw i32 %141, 1
  %152 = add nuw nsw i32 %143, 1
  %153 = icmp eq i32 %152, %131
  br i1 %153, label %154, label %140, !llvm.loop !15

154:                                              ; preds = %140, %135, %128
  %155 = phi double [ 0.000000e+00, %128 ], [ %136, %135 ], [ %150, %140 ]
  %156 = getelementptr inbounds double, double addrspace(1)* %0, i64 %104
  store double %155, double addrspace(1)* %156, align 8, !tbaa !4
  br label %227

157:                                              ; preds = %157, %133
  %158 = phi i32 [ 0, %133 ], [ %224, %157 ]
  %159 = phi double [ 0.000000e+00, %133 ], [ %223, %157 ]
  %160 = phi i32 [ 0, %133 ], [ %225, %157 ]
  %161 = getelementptr inbounds double, double addrspace(3)* %12, i32 %158
  %162 = load double, double addrspace(3)* %161, align 8, !tbaa !4
  %163 = add nsw i32 %129, %158
  %164 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %163
  %165 = load double, double addrspace(3)* %164, align 8, !tbaa !4
  %166 = fmul contract double %162, %165
  %167 = fadd contract double %159, %166
  %168 = or i32 %158, 1
  %169 = getelementptr inbounds double, double addrspace(3)* %12, i32 %168
  %170 = load double, double addrspace(3)* %169, align 8, !tbaa !4
  %171 = add nsw i32 %129, %168
  %172 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %171
  %173 = load double, double addrspace(3)* %172, align 8, !tbaa !4
  %174 = fmul contract double %170, %173
  %175 = fadd contract double %167, %174
  %176 = or i32 %158, 2
  %177 = getelementptr inbounds double, double addrspace(3)* %12, i32 %176
  %178 = load double, double addrspace(3)* %177, align 8, !tbaa !4
  %179 = add nsw i32 %129, %176
  %180 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %179
  %181 = load double, double addrspace(3)* %180, align 8, !tbaa !4
  %182 = fmul contract double %178, %181
  %183 = fadd contract double %175, %182
  %184 = or i32 %158, 3
  %185 = getelementptr inbounds double, double addrspace(3)* %12, i32 %184
  %186 = load double, double addrspace(3)* %185, align 8, !tbaa !4
  %187 = add nsw i32 %129, %184
  %188 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %187
  %189 = load double, double addrspace(3)* %188, align 8, !tbaa !4
  %190 = fmul contract double %186, %189
  %191 = fadd contract double %183, %190
  %192 = or i32 %158, 4
  %193 = getelementptr inbounds double, double addrspace(3)* %12, i32 %192
  %194 = load double, double addrspace(3)* %193, align 8, !tbaa !4
  %195 = add nsw i32 %129, %192
  %196 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %195
  %197 = load double, double addrspace(3)* %196, align 8, !tbaa !4
  %198 = fmul contract double %194, %197
  %199 = fadd contract double %191, %198
  %200 = or i32 %158, 5
  %201 = getelementptr inbounds double, double addrspace(3)* %12, i32 %200
  %202 = load double, double addrspace(3)* %201, align 8, !tbaa !4
  %203 = add nsw i32 %129, %200
  %204 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %203
  %205 = load double, double addrspace(3)* %204, align 8, !tbaa !4
  %206 = fmul contract double %202, %205
  %207 = fadd contract double %199, %206
  %208 = or i32 %158, 6
  %209 = getelementptr inbounds double, double addrspace(3)* %12, i32 %208
  %210 = load double, double addrspace(3)* %209, align 8, !tbaa !4
  %211 = add nsw i32 %129, %208
  %212 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %211
  %213 = load double, double addrspace(3)* %212, align 8, !tbaa !4
  %214 = fmul contract double %210, %213
  %215 = fadd contract double %207, %214
  %216 = or i32 %158, 7
  %217 = getelementptr inbounds double, double addrspace(3)* %12, i32 %216
  %218 = load double, double addrspace(3)* %217, align 8, !tbaa !4
  %219 = add nsw i32 %129, %216
  %220 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %219
  %221 = load double, double addrspace(3)* %220, align 8, !tbaa !4
  %222 = fmul contract double %218, %221
  %223 = fadd contract double %215, %222
  %224 = add nuw nsw i32 %158, 8
  %225 = add nuw i32 %160, 8
  %226 = icmp eq i32 %225, %134
  br i1 %226, label %135, label %157, !llvm.loop !16

227:                                              ; preds = %154, %97, %32
  %228 = phi double [ %155, %154 ], [ 0.000000e+00, %97 ], [ 0.000000e+00, %32 ]
  br i1 %51, label %229, label %347

229:                                              ; preds = %227
  %230 = mul nsw i32 %49, %9
  %231 = add nsw i32 %230, %41
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds double, double addrspace(1)* %1, i64 %232
  %234 = load double, double addrspace(1)* %233, align 8, !tbaa !4
  %235 = mul nsw i32 %48, %6
  %236 = add i32 %235, %40
  %237 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %236
  store double %234, double addrspace(3)* %237, align 8, !tbaa !4
  %238 = icmp ult i32 %40, %5
  br i1 %238, label %239, label %246

239:                                              ; preds = %229
  %240 = add nsw i32 %231, %8
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds double, double addrspace(1)* %1, i64 %241
  %243 = load double, double addrspace(1)* %242, align 8, !tbaa !4
  %244 = add i32 %236, %8
  %245 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %244
  store double %243, double addrspace(3)* %245, align 8, !tbaa !4
  br label %246

246:                                              ; preds = %239, %229
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %247 = icmp ult i32 %40, %4
  br i1 %247, label %347, label %248

248:                                              ; preds = %246
  %249 = sub i32 %236, %4
  br i1 %13, label %250, label %274

250:                                              ; preds = %248
  %251 = and i32 %3, 7
  %252 = icmp ult i32 %3, 8
  br i1 %252, label %255, label %253

253:                                              ; preds = %250
  %254 = and i32 %3, -8
  br label %277

255:                                              ; preds = %277, %250
  %256 = phi double [ undef, %250 ], [ %343, %277 ]
  %257 = phi i32 [ 0, %250 ], [ %344, %277 ]
  %258 = phi double [ %228, %250 ], [ %343, %277 ]
  %259 = icmp eq i32 %251, 0
  br i1 %259, label %274, label %260

260:                                              ; preds = %255, %260
  %261 = phi i32 [ %271, %260 ], [ %257, %255 ]
  %262 = phi double [ %270, %260 ], [ %258, %255 ]
  %263 = phi i32 [ %272, %260 ], [ 0, %255 ]
  %264 = getelementptr inbounds double, double addrspace(3)* %12, i32 %261
  %265 = load double, double addrspace(3)* %264, align 8, !tbaa !4
  %266 = add nsw i32 %249, %261
  %267 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %266
  %268 = load double, double addrspace(3)* %267, align 8, !tbaa !4
  %269 = fmul contract double %265, %268
  %270 = fadd contract double %262, %269
  %271 = add nuw nsw i32 %261, 1
  %272 = add nuw nsw i32 %263, 1
  %273 = icmp eq i32 %272, %251
  br i1 %273, label %274, label %260, !llvm.loop !17

274:                                              ; preds = %260, %255, %248
  %275 = phi double [ %228, %248 ], [ %256, %255 ], [ %270, %260 ]
  %276 = getelementptr inbounds double, double addrspace(1)* %0, i64 %232
  store double %275, double addrspace(1)* %276, align 8, !tbaa !4
  br label %347

277:                                              ; preds = %277, %253
  %278 = phi i32 [ 0, %253 ], [ %344, %277 ]
  %279 = phi double [ %228, %253 ], [ %343, %277 ]
  %280 = phi i32 [ 0, %253 ], [ %345, %277 ]
  %281 = getelementptr inbounds double, double addrspace(3)* %12, i32 %278
  %282 = load double, double addrspace(3)* %281, align 8, !tbaa !4
  %283 = add nsw i32 %249, %278
  %284 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %283
  %285 = load double, double addrspace(3)* %284, align 8, !tbaa !4
  %286 = fmul contract double %282, %285
  %287 = fadd contract double %279, %286
  %288 = or i32 %278, 1
  %289 = getelementptr inbounds double, double addrspace(3)* %12, i32 %288
  %290 = load double, double addrspace(3)* %289, align 8, !tbaa !4
  %291 = add nsw i32 %249, %288
  %292 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %291
  %293 = load double, double addrspace(3)* %292, align 8, !tbaa !4
  %294 = fmul contract double %290, %293
  %295 = fadd contract double %287, %294
  %296 = or i32 %278, 2
  %297 = getelementptr inbounds double, double addrspace(3)* %12, i32 %296
  %298 = load double, double addrspace(3)* %297, align 8, !tbaa !4
  %299 = add nsw i32 %249, %296
  %300 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %299
  %301 = load double, double addrspace(3)* %300, align 8, !tbaa !4
  %302 = fmul contract double %298, %301
  %303 = fadd contract double %295, %302
  %304 = or i32 %278, 3
  %305 = getelementptr inbounds double, double addrspace(3)* %12, i32 %304
  %306 = load double, double addrspace(3)* %305, align 8, !tbaa !4
  %307 = add nsw i32 %249, %304
  %308 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %307
  %309 = load double, double addrspace(3)* %308, align 8, !tbaa !4
  %310 = fmul contract double %306, %309
  %311 = fadd contract double %303, %310
  %312 = or i32 %278, 4
  %313 = getelementptr inbounds double, double addrspace(3)* %12, i32 %312
  %314 = load double, double addrspace(3)* %313, align 8, !tbaa !4
  %315 = add nsw i32 %249, %312
  %316 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %315
  %317 = load double, double addrspace(3)* %316, align 8, !tbaa !4
  %318 = fmul contract double %314, %317
  %319 = fadd contract double %311, %318
  %320 = or i32 %278, 5
  %321 = getelementptr inbounds double, double addrspace(3)* %12, i32 %320
  %322 = load double, double addrspace(3)* %321, align 8, !tbaa !4
  %323 = add nsw i32 %249, %320
  %324 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %323
  %325 = load double, double addrspace(3)* %324, align 8, !tbaa !4
  %326 = fmul contract double %322, %325
  %327 = fadd contract double %319, %326
  %328 = or i32 %278, 6
  %329 = getelementptr inbounds double, double addrspace(3)* %12, i32 %328
  %330 = load double, double addrspace(3)* %329, align 8, !tbaa !4
  %331 = add nsw i32 %249, %328
  %332 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %331
  %333 = load double, double addrspace(3)* %332, align 8, !tbaa !4
  %334 = fmul contract double %330, %333
  %335 = fadd contract double %327, %334
  %336 = or i32 %278, 7
  %337 = getelementptr inbounds double, double addrspace(3)* %12, i32 %336
  %338 = load double, double addrspace(3)* %337, align 8, !tbaa !4
  %339 = add nsw i32 %249, %336
  %340 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %339
  %341 = load double, double addrspace(3)* %340, align 8, !tbaa !4
  %342 = fmul contract double %338, %341
  %343 = fadd contract double %335, %342
  %344 = add nuw nsw i32 %278, 8
  %345 = add nuw i32 %280, 8
  %346 = icmp eq i32 %345, %254
  br i1 %346, label %255, label %277, !llvm.loop !18

347:                                              ; preds = %246, %274, %227
  %348 = phi double [ %275, %274 ], [ %228, %246 ], [ %228, %227 ]
  %349 = sdiv i32 %9, %8
  %350 = add nsw i32 %349, -1
  %351 = icmp eq i32 %34, %350
  br i1 %351, label %352, label %471

352:                                              ; preds = %347
  %353 = mul nsw i32 %49, %9
  %354 = add nsw i32 %353, %41
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds double, double addrspace(1)* %1, i64 %355
  %357 = load double, double addrspace(1)* %356, align 8, !tbaa !4
  %358 = mul nsw i32 %48, %6
  %359 = add i32 %358, %40
  %360 = add i32 %359, %4
  %361 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %360
  store double %357, double addrspace(3)* %361, align 8, !tbaa !4
  %362 = icmp ult i32 %40, %4
  br i1 %362, label %363, label %370

363:                                              ; preds = %352
  %364 = sub i32 %41, %4
  %365 = add nsw i32 %364, %353
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds double, double addrspace(1)* %1, i64 %366
  %368 = load double, double addrspace(1)* %367, align 8, !tbaa !4
  %369 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %359
  store double %368, double addrspace(3)* %369, align 8, !tbaa !4
  br label %370

370:                                              ; preds = %363, %352
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %371 = sub nsw i32 %8, %5
  %372 = icmp ult i32 %40, %371
  %373 = select i1 %372, i1 %13, i1 false
  br i1 %373, label %374, label %468

374:                                              ; preds = %370
  %375 = and i32 %3, 7
  %376 = icmp ult i32 %3, 8
  br i1 %376, label %449, label %377

377:                                              ; preds = %374
  %378 = and i32 %3, -8
  br label %379

379:                                              ; preds = %379, %377
  %380 = phi i32 [ 0, %377 ], [ %446, %379 ]
  %381 = phi double [ %348, %377 ], [ %445, %379 ]
  %382 = phi i32 [ 0, %377 ], [ %447, %379 ]
  %383 = getelementptr inbounds double, double addrspace(3)* %12, i32 %380
  %384 = load double, double addrspace(3)* %383, align 8, !tbaa !4
  %385 = add nsw i32 %380, %359
  %386 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %385
  %387 = load double, double addrspace(3)* %386, align 8, !tbaa !4
  %388 = fmul contract double %384, %387
  %389 = fadd contract double %381, %388
  %390 = or i32 %380, 1
  %391 = getelementptr inbounds double, double addrspace(3)* %12, i32 %390
  %392 = load double, double addrspace(3)* %391, align 8, !tbaa !4
  %393 = add nsw i32 %390, %359
  %394 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %393
  %395 = load double, double addrspace(3)* %394, align 8, !tbaa !4
  %396 = fmul contract double %392, %395
  %397 = fadd contract double %389, %396
  %398 = or i32 %380, 2
  %399 = getelementptr inbounds double, double addrspace(3)* %12, i32 %398
  %400 = load double, double addrspace(3)* %399, align 8, !tbaa !4
  %401 = add nsw i32 %398, %359
  %402 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %401
  %403 = load double, double addrspace(3)* %402, align 8, !tbaa !4
  %404 = fmul contract double %400, %403
  %405 = fadd contract double %397, %404
  %406 = or i32 %380, 3
  %407 = getelementptr inbounds double, double addrspace(3)* %12, i32 %406
  %408 = load double, double addrspace(3)* %407, align 8, !tbaa !4
  %409 = add nsw i32 %406, %359
  %410 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %409
  %411 = load double, double addrspace(3)* %410, align 8, !tbaa !4
  %412 = fmul contract double %408, %411
  %413 = fadd contract double %405, %412
  %414 = or i32 %380, 4
  %415 = getelementptr inbounds double, double addrspace(3)* %12, i32 %414
  %416 = load double, double addrspace(3)* %415, align 8, !tbaa !4
  %417 = add nsw i32 %414, %359
  %418 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %417
  %419 = load double, double addrspace(3)* %418, align 8, !tbaa !4
  %420 = fmul contract double %416, %419
  %421 = fadd contract double %413, %420
  %422 = or i32 %380, 5
  %423 = getelementptr inbounds double, double addrspace(3)* %12, i32 %422
  %424 = load double, double addrspace(3)* %423, align 8, !tbaa !4
  %425 = add nsw i32 %422, %359
  %426 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %425
  %427 = load double, double addrspace(3)* %426, align 8, !tbaa !4
  %428 = fmul contract double %424, %427
  %429 = fadd contract double %421, %428
  %430 = or i32 %380, 6
  %431 = getelementptr inbounds double, double addrspace(3)* %12, i32 %430
  %432 = load double, double addrspace(3)* %431, align 8, !tbaa !4
  %433 = add nsw i32 %430, %359
  %434 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %433
  %435 = load double, double addrspace(3)* %434, align 8, !tbaa !4
  %436 = fmul contract double %432, %435
  %437 = fadd contract double %429, %436
  %438 = or i32 %380, 7
  %439 = getelementptr inbounds double, double addrspace(3)* %12, i32 %438
  %440 = load double, double addrspace(3)* %439, align 8, !tbaa !4
  %441 = add nsw i32 %438, %359
  %442 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %441
  %443 = load double, double addrspace(3)* %442, align 8, !tbaa !4
  %444 = fmul contract double %440, %443
  %445 = fadd contract double %437, %444
  %446 = add nuw nsw i32 %380, 8
  %447 = add nuw i32 %382, 8
  %448 = icmp eq i32 %447, %378
  br i1 %448, label %449, label %379, !llvm.loop !19

449:                                              ; preds = %379, %374
  %450 = phi double [ undef, %374 ], [ %445, %379 ]
  %451 = phi i32 [ 0, %374 ], [ %446, %379 ]
  %452 = phi double [ %348, %374 ], [ %445, %379 ]
  %453 = icmp eq i32 %375, 0
  br i1 %453, label %468, label %454

454:                                              ; preds = %449, %454
  %455 = phi i32 [ %465, %454 ], [ %451, %449 ]
  %456 = phi double [ %464, %454 ], [ %452, %449 ]
  %457 = phi i32 [ %466, %454 ], [ 0, %449 ]
  %458 = getelementptr inbounds double, double addrspace(3)* %12, i32 %455
  %459 = load double, double addrspace(3)* %458, align 8, !tbaa !4
  %460 = add nsw i32 %455, %359
  %461 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %460
  %462 = load double, double addrspace(3)* %461, align 8, !tbaa !4
  %463 = fmul contract double %459, %462
  %464 = fadd contract double %456, %463
  %465 = add nuw nsw i32 %455, 1
  %466 = add nuw nsw i32 %457, 1
  %467 = icmp eq i32 %466, %375
  br i1 %467, label %468, label %454, !llvm.loop !20

468:                                              ; preds = %454, %449, %370
  %469 = phi double [ %348, %370 ], [ %450, %449 ], [ %464, %454 ]
  %470 = getelementptr inbounds double, double addrspace(1)* %0, i64 %355
  store double %469, double addrspace(1)* %470, align 8, !tbaa !4
  br label %471

471:                                              ; preds = %468, %347
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i16 1, i16 1025}
!12 = !{i32 0, i32 1024}
!13 = distinct !{!13, !14, !10}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !14, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !14, !10}
!19 = distinct !{!19, !14, !10}
!20 = distinct !{!20, !10}
