; ModuleID = '../data/hip_kernels/1088/20/main.cu'
source_filename = "../data/hip_kernels/1088/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@memory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kernel2DYnpPdS_S_S_PKdiiiiiiiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = mul nsw i32 %9, %8
  %17 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %16
  %18 = icmp sgt i32 %5, 0
  br i1 %18, label %19, label %37

19:                                               ; preds = %15
  %20 = and i32 %5, 7
  %21 = icmp ult i32 %5, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %5, -8
  br label %57

24:                                               ; preds = %57, %19
  %25 = phi i32 [ 0, %19 ], [ %99, %57 ]
  %26 = icmp eq i32 %20, 0
  br i1 %26, label %37, label %27

27:                                               ; preds = %24, %27
  %28 = phi i32 [ %34, %27 ], [ %25, %24 ]
  %29 = phi i32 [ %35, %27 ], [ 0, %24 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %4, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !4, !amdgpu.noclobber !8
  %33 = getelementptr inbounds double, double addrspace(3)* %17, i32 %28
  store double %32, double addrspace(3)* %33, align 8, !tbaa !4
  %34 = add nuw nsw i32 %28, 1
  %35 = add nuw nsw i32 %29, 1
  %36 = icmp eq i32 %35, %20
  br i1 %36, label %37, label %27, !llvm.loop !9

37:                                               ; preds = %27, %24, %15
  %38 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %40 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 4, !range !11, !invariant.load !8
  %43 = zext i16 %42 to i32
  %44 = mul i32 %39, %43
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %46 = add i32 %44, %45
  %47 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %48 = getelementptr i8, i8 addrspace(4)* %38, i64 6
  %49 = bitcast i8 addrspace(4)* %48 to i16 addrspace(4)*
  %50 = load i16, i16 addrspace(4)* %49, align 2, !range !11, !invariant.load !8
  %51 = zext i16 %50 to i32
  %52 = mul i32 %47, %51
  %53 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %54 = add i32 %52, %53
  %55 = add i32 %53, %6
  %56 = icmp eq i32 %47, 0
  br i1 %56, label %255, label %102

57:                                               ; preds = %57, %22
  %58 = phi i32 [ 0, %22 ], [ %99, %57 ]
  %59 = phi i32 [ 0, %22 ], [ %100, %57 ]
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %4, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !4, !amdgpu.noclobber !8
  %63 = getelementptr inbounds double, double addrspace(3)* %17, i32 %58
  store double %62, double addrspace(3)* %63, align 8, !tbaa !4
  %64 = or i32 %58, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %4, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !4, !amdgpu.noclobber !8
  %68 = getelementptr inbounds double, double addrspace(3)* %17, i32 %64
  store double %67, double addrspace(3)* %68, align 8, !tbaa !4
  %69 = or i32 %58, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %4, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !4, !amdgpu.noclobber !8
  %73 = getelementptr inbounds double, double addrspace(3)* %17, i32 %69
  store double %72, double addrspace(3)* %73, align 8, !tbaa !4
  %74 = or i32 %58, 3
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %4, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !4, !amdgpu.noclobber !8
  %78 = getelementptr inbounds double, double addrspace(3)* %17, i32 %74
  store double %77, double addrspace(3)* %78, align 8, !tbaa !4
  %79 = or i32 %58, 4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %4, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !4, !amdgpu.noclobber !8
  %83 = getelementptr inbounds double, double addrspace(3)* %17, i32 %79
  store double %82, double addrspace(3)* %83, align 8, !tbaa !4
  %84 = or i32 %58, 5
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %4, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !4, !amdgpu.noclobber !8
  %88 = getelementptr inbounds double, double addrspace(3)* %17, i32 %84
  store double %87, double addrspace(3)* %88, align 8, !tbaa !4
  %89 = or i32 %58, 6
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %4, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !4, !amdgpu.noclobber !8
  %93 = getelementptr inbounds double, double addrspace(3)* %17, i32 %89
  store double %92, double addrspace(3)* %93, align 8, !tbaa !4
  %94 = or i32 %58, 7
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %4, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !4, !amdgpu.noclobber !8
  %98 = getelementptr inbounds double, double addrspace(3)* %17, i32 %94
  store double %97, double addrspace(3)* %98, align 8, !tbaa !4
  %99 = add nuw nsw i32 %58, 8
  %100 = add nuw i32 %59, 8
  %101 = icmp eq i32 %100, %23
  br i1 %101, label %24, label %57, !llvm.loop !13

102:                                              ; preds = %37
  %103 = sdiv i32 %12, %10
  %104 = add nsw i32 %103, -1
  %105 = icmp eq i32 %47, %104
  br i1 %105, label %255, label %106

106:                                              ; preds = %102
  %107 = mul nsw i32 %54, %11
  %108 = add nsw i32 %107, %46
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %1, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !4, !amdgpu.noclobber !8
  %112 = mul nsw i32 %55, %8
  %113 = add nsw i32 %112, %45
  %114 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %113
  store double %111, double addrspace(3)* %114, align 8, !tbaa !4
  %115 = icmp ult i32 %53, %6
  br i1 %115, label %116, label %126

116:                                              ; preds = %106
  %117 = sub nsw i32 %54, %6
  %118 = mul nsw i32 %117, %11
  %119 = add nsw i32 %118, %46
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double addrspace(1)* %1, i64 %120
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !4, !amdgpu.noclobber !8
  %123 = mul i32 %53, %8
  %124 = add i32 %123, %45
  %125 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %124
  store double %122, double addrspace(3)* %125, align 8, !tbaa !4
  br label %126

126:                                              ; preds = %116, %106
  %127 = icmp ult i32 %53, %7
  br i1 %127, label %128, label %139

128:                                              ; preds = %126
  %129 = add nsw i32 %54, %10
  %130 = mul nsw i32 %129, %11
  %131 = add nsw i32 %130, %46
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %1, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !4, !amdgpu.noclobber !8
  %135 = add nsw i32 %55, %10
  %136 = mul nsw i32 %135, %8
  %137 = add nsw i32 %136, %45
  %138 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %137
  store double %134, double addrspace(3)* %138, align 8, !tbaa !4
  br label %139

139:                                              ; preds = %128, %126
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %140, label %166

140:                                              ; preds = %139
  %141 = and i32 %5, 7
  %142 = icmp ult i32 %5, 8
  br i1 %142, label %145, label %143

143:                                              ; preds = %140
  %144 = and i32 %5, -8
  br label %169

145:                                              ; preds = %169, %140
  %146 = phi double [ undef, %140 ], [ %251, %169 ]
  %147 = phi i32 [ 0, %140 ], [ %252, %169 ]
  %148 = phi double [ 0.000000e+00, %140 ], [ %251, %169 ]
  %149 = icmp eq i32 %141, 0
  br i1 %149, label %166, label %150

150:                                              ; preds = %145, %150
  %151 = phi i32 [ %163, %150 ], [ %147, %145 ]
  %152 = phi double [ %162, %150 ], [ %148, %145 ]
  %153 = phi i32 [ %164, %150 ], [ 0, %145 ]
  %154 = getelementptr inbounds double, double addrspace(3)* %17, i32 %151
  %155 = load double, double addrspace(3)* %154, align 8, !tbaa !4
  %156 = add nuw i32 %151, %53
  %157 = mul i32 %156, %8
  %158 = add i32 %157, %45
  %159 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %158
  %160 = load double, double addrspace(3)* %159, align 8, !tbaa !4
  %161 = fmul contract double %155, %160
  %162 = fadd contract double %152, %161
  %163 = add nuw nsw i32 %151, 1
  %164 = add nuw nsw i32 %153, 1
  %165 = icmp eq i32 %164, %141
  br i1 %165, label %166, label %150, !llvm.loop !15

166:                                              ; preds = %150, %145, %139
  %167 = phi double [ 0.000000e+00, %139 ], [ %146, %145 ], [ %162, %150 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %168 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  store double %167, double addrspace(1)* %168, align 8, !tbaa !4
  br label %255

169:                                              ; preds = %169, %143
  %170 = phi i32 [ 0, %143 ], [ %252, %169 ]
  %171 = phi double [ 0.000000e+00, %143 ], [ %251, %169 ]
  %172 = phi i32 [ 0, %143 ], [ %253, %169 ]
  %173 = getelementptr inbounds double, double addrspace(3)* %17, i32 %170
  %174 = load double, double addrspace(3)* %173, align 8, !tbaa !4
  %175 = add nuw i32 %170, %53
  %176 = mul i32 %175, %8
  %177 = add i32 %176, %45
  %178 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %177
  %179 = load double, double addrspace(3)* %178, align 8, !tbaa !4
  %180 = fmul contract double %174, %179
  %181 = fadd contract double %171, %180
  %182 = or i32 %170, 1
  %183 = getelementptr inbounds double, double addrspace(3)* %17, i32 %182
  %184 = load double, double addrspace(3)* %183, align 8, !tbaa !4
  %185 = add nuw i32 %182, %53
  %186 = mul i32 %185, %8
  %187 = add i32 %186, %45
  %188 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %187
  %189 = load double, double addrspace(3)* %188, align 8, !tbaa !4
  %190 = fmul contract double %184, %189
  %191 = fadd contract double %181, %190
  %192 = or i32 %170, 2
  %193 = getelementptr inbounds double, double addrspace(3)* %17, i32 %192
  %194 = load double, double addrspace(3)* %193, align 8, !tbaa !4
  %195 = add nuw i32 %192, %53
  %196 = mul i32 %195, %8
  %197 = add i32 %196, %45
  %198 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %197
  %199 = load double, double addrspace(3)* %198, align 8, !tbaa !4
  %200 = fmul contract double %194, %199
  %201 = fadd contract double %191, %200
  %202 = or i32 %170, 3
  %203 = getelementptr inbounds double, double addrspace(3)* %17, i32 %202
  %204 = load double, double addrspace(3)* %203, align 8, !tbaa !4
  %205 = add nuw i32 %202, %53
  %206 = mul i32 %205, %8
  %207 = add i32 %206, %45
  %208 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %207
  %209 = load double, double addrspace(3)* %208, align 8, !tbaa !4
  %210 = fmul contract double %204, %209
  %211 = fadd contract double %201, %210
  %212 = or i32 %170, 4
  %213 = getelementptr inbounds double, double addrspace(3)* %17, i32 %212
  %214 = load double, double addrspace(3)* %213, align 8, !tbaa !4
  %215 = add nuw i32 %212, %53
  %216 = mul i32 %215, %8
  %217 = add i32 %216, %45
  %218 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %217
  %219 = load double, double addrspace(3)* %218, align 8, !tbaa !4
  %220 = fmul contract double %214, %219
  %221 = fadd contract double %211, %220
  %222 = or i32 %170, 5
  %223 = getelementptr inbounds double, double addrspace(3)* %17, i32 %222
  %224 = load double, double addrspace(3)* %223, align 8, !tbaa !4
  %225 = add nuw i32 %222, %53
  %226 = mul i32 %225, %8
  %227 = add i32 %226, %45
  %228 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %227
  %229 = load double, double addrspace(3)* %228, align 8, !tbaa !4
  %230 = fmul contract double %224, %229
  %231 = fadd contract double %221, %230
  %232 = or i32 %170, 6
  %233 = getelementptr inbounds double, double addrspace(3)* %17, i32 %232
  %234 = load double, double addrspace(3)* %233, align 8, !tbaa !4
  %235 = add nuw i32 %232, %53
  %236 = mul i32 %235, %8
  %237 = add i32 %236, %45
  %238 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %237
  %239 = load double, double addrspace(3)* %238, align 8, !tbaa !4
  %240 = fmul contract double %234, %239
  %241 = fadd contract double %231, %240
  %242 = or i32 %170, 7
  %243 = getelementptr inbounds double, double addrspace(3)* %17, i32 %242
  %244 = load double, double addrspace(3)* %243, align 8, !tbaa !4
  %245 = add nuw i32 %242, %53
  %246 = mul i32 %245, %8
  %247 = add i32 %246, %45
  %248 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %247
  %249 = load double, double addrspace(3)* %248, align 8, !tbaa !4
  %250 = fmul contract double %244, %249
  %251 = fadd contract double %241, %250
  %252 = add nuw nsw i32 %170, 8
  %253 = add nuw i32 %172, 8
  %254 = icmp eq i32 %253, %144
  br i1 %254, label %145, label %169, !llvm.loop !16

255:                                              ; preds = %166, %102, %37
  %256 = phi double [ %167, %166 ], [ 0.000000e+00, %102 ], [ 0.000000e+00, %37 ]
  br i1 %56, label %257, label %539

257:                                              ; preds = %255
  %258 = icmp eq i32 %13, 1
  %259 = mul nsw i32 %54, %11
  %260 = add nsw i32 %259, %46
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds double, double addrspace(1)* %1, i64 %261
  %263 = load double, double addrspace(1)* %262, align 8, !tbaa !4
  br i1 %258, label %406, label %264

264:                                              ; preds = %257
  %265 = mul nsw i32 %55, %8
  %266 = add nsw i32 %265, %45
  %267 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %266
  store double %263, double addrspace(3)* %267, align 8, !tbaa !4
  %268 = icmp ult i32 %53, %6
  br i1 %268, label %269, label %278

269:                                              ; preds = %264
  %270 = mul i32 %53, %11
  %271 = add i32 %46, %270
  %272 = zext i32 %271 to i64
  %273 = getelementptr inbounds double, double addrspace(1)* %2, i64 %272
  %274 = load double, double addrspace(1)* %273, align 8, !tbaa !4
  %275 = mul i32 %53, %8
  %276 = add i32 %275, %45
  %277 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %276
  store double %274, double addrspace(3)* %277, align 8, !tbaa !4
  br label %278

278:                                              ; preds = %269, %264
  %279 = icmp ult i32 %53, %7
  br i1 %279, label %280, label %291

280:                                              ; preds = %278
  %281 = add nsw i32 %54, %10
  %282 = mul nsw i32 %281, %11
  %283 = add nsw i32 %282, %46
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds double, double addrspace(1)* %1, i64 %284
  %286 = load double, double addrspace(1)* %285, align 8, !tbaa !4
  %287 = add nsw i32 %55, %10
  %288 = mul nsw i32 %287, %8
  %289 = add nsw i32 %288, %45
  %290 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %289
  store double %286, double addrspace(3)* %290, align 8, !tbaa !4
  br label %291

291:                                              ; preds = %280, %278
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %292, label %318

292:                                              ; preds = %291
  %293 = and i32 %5, 7
  %294 = icmp ult i32 %5, 8
  br i1 %294, label %297, label %295

295:                                              ; preds = %292
  %296 = and i32 %5, -8
  br label %320

297:                                              ; preds = %320, %292
  %298 = phi double [ undef, %292 ], [ %402, %320 ]
  %299 = phi i32 [ 0, %292 ], [ %403, %320 ]
  %300 = phi double [ %256, %292 ], [ %402, %320 ]
  %301 = icmp eq i32 %293, 0
  br i1 %301, label %318, label %302

302:                                              ; preds = %297, %302
  %303 = phi i32 [ %315, %302 ], [ %299, %297 ]
  %304 = phi double [ %314, %302 ], [ %300, %297 ]
  %305 = phi i32 [ %316, %302 ], [ 0, %297 ]
  %306 = getelementptr inbounds double, double addrspace(3)* %17, i32 %303
  %307 = load double, double addrspace(3)* %306, align 8, !tbaa !4
  %308 = add nuw i32 %303, %53
  %309 = mul i32 %308, %8
  %310 = add i32 %309, %45
  %311 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %310
  %312 = load double, double addrspace(3)* %311, align 8, !tbaa !4
  %313 = fmul contract double %307, %312
  %314 = fadd contract double %304, %313
  %315 = add nuw nsw i32 %303, 1
  %316 = add nuw nsw i32 %305, 1
  %317 = icmp eq i32 %316, %293
  br i1 %317, label %318, label %302, !llvm.loop !17

318:                                              ; preds = %302, %297, %291
  %319 = phi double [ %256, %291 ], [ %298, %297 ], [ %314, %302 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %535

320:                                              ; preds = %320, %295
  %321 = phi i32 [ 0, %295 ], [ %403, %320 ]
  %322 = phi double [ %256, %295 ], [ %402, %320 ]
  %323 = phi i32 [ 0, %295 ], [ %404, %320 ]
  %324 = getelementptr inbounds double, double addrspace(3)* %17, i32 %321
  %325 = load double, double addrspace(3)* %324, align 8, !tbaa !4
  %326 = add nuw i32 %321, %53
  %327 = mul i32 %326, %8
  %328 = add i32 %327, %45
  %329 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %328
  %330 = load double, double addrspace(3)* %329, align 8, !tbaa !4
  %331 = fmul contract double %325, %330
  %332 = fadd contract double %322, %331
  %333 = or i32 %321, 1
  %334 = getelementptr inbounds double, double addrspace(3)* %17, i32 %333
  %335 = load double, double addrspace(3)* %334, align 8, !tbaa !4
  %336 = add nuw i32 %333, %53
  %337 = mul i32 %336, %8
  %338 = add i32 %337, %45
  %339 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %338
  %340 = load double, double addrspace(3)* %339, align 8, !tbaa !4
  %341 = fmul contract double %335, %340
  %342 = fadd contract double %332, %341
  %343 = or i32 %321, 2
  %344 = getelementptr inbounds double, double addrspace(3)* %17, i32 %343
  %345 = load double, double addrspace(3)* %344, align 8, !tbaa !4
  %346 = add nuw i32 %343, %53
  %347 = mul i32 %346, %8
  %348 = add i32 %347, %45
  %349 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %348
  %350 = load double, double addrspace(3)* %349, align 8, !tbaa !4
  %351 = fmul contract double %345, %350
  %352 = fadd contract double %342, %351
  %353 = or i32 %321, 3
  %354 = getelementptr inbounds double, double addrspace(3)* %17, i32 %353
  %355 = load double, double addrspace(3)* %354, align 8, !tbaa !4
  %356 = add nuw i32 %353, %53
  %357 = mul i32 %356, %8
  %358 = add i32 %357, %45
  %359 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %358
  %360 = load double, double addrspace(3)* %359, align 8, !tbaa !4
  %361 = fmul contract double %355, %360
  %362 = fadd contract double %352, %361
  %363 = or i32 %321, 4
  %364 = getelementptr inbounds double, double addrspace(3)* %17, i32 %363
  %365 = load double, double addrspace(3)* %364, align 8, !tbaa !4
  %366 = add nuw i32 %363, %53
  %367 = mul i32 %366, %8
  %368 = add i32 %367, %45
  %369 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %368
  %370 = load double, double addrspace(3)* %369, align 8, !tbaa !4
  %371 = fmul contract double %365, %370
  %372 = fadd contract double %362, %371
  %373 = or i32 %321, 5
  %374 = getelementptr inbounds double, double addrspace(3)* %17, i32 %373
  %375 = load double, double addrspace(3)* %374, align 8, !tbaa !4
  %376 = add nuw i32 %373, %53
  %377 = mul i32 %376, %8
  %378 = add i32 %377, %45
  %379 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %378
  %380 = load double, double addrspace(3)* %379, align 8, !tbaa !4
  %381 = fmul contract double %375, %380
  %382 = fadd contract double %372, %381
  %383 = or i32 %321, 6
  %384 = getelementptr inbounds double, double addrspace(3)* %17, i32 %383
  %385 = load double, double addrspace(3)* %384, align 8, !tbaa !4
  %386 = add nuw i32 %383, %53
  %387 = mul i32 %386, %8
  %388 = add i32 %387, %45
  %389 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %388
  %390 = load double, double addrspace(3)* %389, align 8, !tbaa !4
  %391 = fmul contract double %385, %390
  %392 = fadd contract double %382, %391
  %393 = or i32 %321, 7
  %394 = getelementptr inbounds double, double addrspace(3)* %17, i32 %393
  %395 = load double, double addrspace(3)* %394, align 8, !tbaa !4
  %396 = add nuw i32 %393, %53
  %397 = mul i32 %396, %8
  %398 = add i32 %397, %45
  %399 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %398
  %400 = load double, double addrspace(3)* %399, align 8, !tbaa !4
  %401 = fmul contract double %395, %400
  %402 = fadd contract double %392, %401
  %403 = add nuw nsw i32 %321, 8
  %404 = add nuw i32 %323, 8
  %405 = icmp eq i32 %404, %296
  br i1 %405, label %297, label %320, !llvm.loop !18

406:                                              ; preds = %257
  %407 = mul i32 %53, %8
  %408 = add i32 %407, %45
  %409 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %408
  store double %263, double addrspace(3)* %409, align 8, !tbaa !4
  %410 = icmp ult i32 %53, %7
  br i1 %410, label %411, label %422

411:                                              ; preds = %406
  %412 = add nsw i32 %54, %10
  %413 = mul nsw i32 %412, %11
  %414 = add nsw i32 %413, %46
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds double, double addrspace(1)* %1, i64 %415
  %417 = load double, double addrspace(1)* %416, align 8, !tbaa !4
  %418 = add i32 %53, %10
  %419 = mul i32 %418, %8
  %420 = add i32 %419, %45
  %421 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %420
  store double %417, double addrspace(3)* %421, align 8, !tbaa !4
  br label %422

422:                                              ; preds = %411, %406
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %423, label %448

423:                                              ; preds = %422
  %424 = and i32 %5, 7
  %425 = icmp ult i32 %5, 8
  br i1 %425, label %428, label %426

426:                                              ; preds = %423
  %427 = and i32 %5, -8
  br label %452

428:                                              ; preds = %452, %423
  %429 = phi double [ undef, %423 ], [ %526, %452 ]
  %430 = phi i32 [ 0, %423 ], [ %527, %452 ]
  %431 = phi double [ %256, %423 ], [ %526, %452 ]
  %432 = icmp eq i32 %424, 0
  br i1 %432, label %448, label %433

433:                                              ; preds = %428, %433
  %434 = phi i32 [ %445, %433 ], [ %430, %428 ]
  %435 = phi double [ %444, %433 ], [ %431, %428 ]
  %436 = phi i32 [ %446, %433 ], [ 0, %428 ]
  %437 = getelementptr inbounds double, double addrspace(3)* %17, i32 %434
  %438 = load double, double addrspace(3)* %437, align 8, !tbaa !4
  %439 = mul nsw i32 %434, %8
  %440 = add nsw i32 %439, %408
  %441 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %440
  %442 = load double, double addrspace(3)* %441, align 8, !tbaa !4
  %443 = fmul contract double %438, %442
  %444 = fadd contract double %435, %443
  %445 = add nuw nsw i32 %434, 1
  %446 = add nuw nsw i32 %436, 1
  %447 = icmp eq i32 %446, %424
  br i1 %447, label %448, label %433, !llvm.loop !19

448:                                              ; preds = %433, %428, %422
  %449 = phi double [ %256, %422 ], [ %429, %428 ], [ %444, %433 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %450 = sub nsw i32 %10, %6
  %451 = icmp ult i32 %53, %450
  br i1 %451, label %530, label %539

452:                                              ; preds = %452, %426
  %453 = phi i32 [ 0, %426 ], [ %527, %452 ]
  %454 = phi double [ %256, %426 ], [ %526, %452 ]
  %455 = phi i32 [ 0, %426 ], [ %528, %452 ]
  %456 = getelementptr inbounds double, double addrspace(3)* %17, i32 %453
  %457 = load double, double addrspace(3)* %456, align 8, !tbaa !4
  %458 = mul nsw i32 %453, %8
  %459 = add nsw i32 %458, %408
  %460 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %459
  %461 = load double, double addrspace(3)* %460, align 8, !tbaa !4
  %462 = fmul contract double %457, %461
  %463 = fadd contract double %454, %462
  %464 = or i32 %453, 1
  %465 = getelementptr inbounds double, double addrspace(3)* %17, i32 %464
  %466 = load double, double addrspace(3)* %465, align 8, !tbaa !4
  %467 = mul nsw i32 %464, %8
  %468 = add nsw i32 %467, %408
  %469 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %468
  %470 = load double, double addrspace(3)* %469, align 8, !tbaa !4
  %471 = fmul contract double %466, %470
  %472 = fadd contract double %463, %471
  %473 = or i32 %453, 2
  %474 = getelementptr inbounds double, double addrspace(3)* %17, i32 %473
  %475 = load double, double addrspace(3)* %474, align 8, !tbaa !4
  %476 = mul nsw i32 %473, %8
  %477 = add nsw i32 %476, %408
  %478 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %477
  %479 = load double, double addrspace(3)* %478, align 8, !tbaa !4
  %480 = fmul contract double %475, %479
  %481 = fadd contract double %472, %480
  %482 = or i32 %453, 3
  %483 = getelementptr inbounds double, double addrspace(3)* %17, i32 %482
  %484 = load double, double addrspace(3)* %483, align 8, !tbaa !4
  %485 = mul nsw i32 %482, %8
  %486 = add nsw i32 %485, %408
  %487 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %486
  %488 = load double, double addrspace(3)* %487, align 8, !tbaa !4
  %489 = fmul contract double %484, %488
  %490 = fadd contract double %481, %489
  %491 = or i32 %453, 4
  %492 = getelementptr inbounds double, double addrspace(3)* %17, i32 %491
  %493 = load double, double addrspace(3)* %492, align 8, !tbaa !4
  %494 = mul nsw i32 %491, %8
  %495 = add nsw i32 %494, %408
  %496 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %495
  %497 = load double, double addrspace(3)* %496, align 8, !tbaa !4
  %498 = fmul contract double %493, %497
  %499 = fadd contract double %490, %498
  %500 = or i32 %453, 5
  %501 = getelementptr inbounds double, double addrspace(3)* %17, i32 %500
  %502 = load double, double addrspace(3)* %501, align 8, !tbaa !4
  %503 = mul nsw i32 %500, %8
  %504 = add nsw i32 %503, %408
  %505 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %504
  %506 = load double, double addrspace(3)* %505, align 8, !tbaa !4
  %507 = fmul contract double %502, %506
  %508 = fadd contract double %499, %507
  %509 = or i32 %453, 6
  %510 = getelementptr inbounds double, double addrspace(3)* %17, i32 %509
  %511 = load double, double addrspace(3)* %510, align 8, !tbaa !4
  %512 = mul nsw i32 %509, %8
  %513 = add nsw i32 %512, %408
  %514 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %513
  %515 = load double, double addrspace(3)* %514, align 8, !tbaa !4
  %516 = fmul contract double %511, %515
  %517 = fadd contract double %508, %516
  %518 = or i32 %453, 7
  %519 = getelementptr inbounds double, double addrspace(3)* %17, i32 %518
  %520 = load double, double addrspace(3)* %519, align 8, !tbaa !4
  %521 = mul nsw i32 %518, %8
  %522 = add nsw i32 %521, %408
  %523 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %522
  %524 = load double, double addrspace(3)* %523, align 8, !tbaa !4
  %525 = fmul contract double %520, %524
  %526 = fadd contract double %517, %525
  %527 = add nuw nsw i32 %453, 8
  %528 = add nuw i32 %455, 8
  %529 = icmp eq i32 %528, %427
  br i1 %529, label %428, label %452, !llvm.loop !20

530:                                              ; preds = %448
  %531 = add nsw i32 %54, %6
  %532 = mul nsw i32 %531, %11
  %533 = add nsw i32 %532, %46
  %534 = sext i32 %533 to i64
  br label %535

535:                                              ; preds = %530, %318
  %536 = phi i64 [ %261, %318 ], [ %534, %530 ]
  %537 = phi double [ %319, %318 ], [ %449, %530 ]
  %538 = getelementptr inbounds double, double addrspace(1)* %0, i64 %536
  store double %537, double addrspace(1)* %538, align 8, !tbaa !4
  br label %539

539:                                              ; preds = %535, %448, %255
  %540 = phi double [ %449, %448 ], [ %256, %255 ], [ %537, %535 ]
  %541 = sdiv i32 %12, %10
  %542 = add nsw i32 %541, -1
  %543 = icmp eq i32 %47, %542
  br i1 %543, label %544, label %824

544:                                              ; preds = %539
  %545 = icmp eq i32 %14, 1
  %546 = mul nsw i32 %54, %11
  %547 = add nsw i32 %546, %46
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds double, double addrspace(1)* %1, i64 %548
  %550 = load double, double addrspace(1)* %549, align 8, !tbaa !4
  %551 = mul nsw i32 %55, %8
  %552 = add nsw i32 %551, %45
  %553 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %552
  store double %550, double addrspace(3)* %553, align 8, !tbaa !4
  %554 = icmp ult i32 %53, %6
  br i1 %545, label %693, label %555

555:                                              ; preds = %544
  br i1 %554, label %556, label %566

556:                                              ; preds = %555
  %557 = sub nsw i32 %54, %6
  %558 = mul nsw i32 %557, %11
  %559 = add nsw i32 %558, %46
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds double, double addrspace(1)* %1, i64 %560
  %562 = load double, double addrspace(1)* %561, align 8, !tbaa !4
  %563 = mul i32 %53, %8
  %564 = add i32 %563, %45
  %565 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %564
  store double %562, double addrspace(3)* %565, align 8, !tbaa !4
  br label %566

566:                                              ; preds = %556, %555
  %567 = icmp ult i32 %53, %7
  br i1 %567, label %568, label %578

568:                                              ; preds = %566
  %569 = mul i32 %53, %11
  %570 = add i32 %46, %569
  %571 = zext i32 %570 to i64
  %572 = getelementptr inbounds double, double addrspace(1)* %3, i64 %571
  %573 = load double, double addrspace(1)* %572, align 8, !tbaa !4
  %574 = add nsw i32 %55, %10
  %575 = mul nsw i32 %574, %8
  %576 = add nsw i32 %575, %45
  %577 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %576
  store double %573, double addrspace(3)* %577, align 8, !tbaa !4
  br label %578

578:                                              ; preds = %568, %566
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %579, label %605

579:                                              ; preds = %578
  %580 = and i32 %5, 7
  %581 = icmp ult i32 %5, 8
  br i1 %581, label %584, label %582

582:                                              ; preds = %579
  %583 = and i32 %5, -8
  br label %607

584:                                              ; preds = %607, %579
  %585 = phi double [ undef, %579 ], [ %689, %607 ]
  %586 = phi i32 [ 0, %579 ], [ %690, %607 ]
  %587 = phi double [ %540, %579 ], [ %689, %607 ]
  %588 = icmp eq i32 %580, 0
  br i1 %588, label %605, label %589

589:                                              ; preds = %584, %589
  %590 = phi i32 [ %602, %589 ], [ %586, %584 ]
  %591 = phi double [ %601, %589 ], [ %587, %584 ]
  %592 = phi i32 [ %603, %589 ], [ 0, %584 ]
  %593 = getelementptr inbounds double, double addrspace(3)* %17, i32 %590
  %594 = load double, double addrspace(3)* %593, align 8, !tbaa !4
  %595 = add nuw i32 %590, %53
  %596 = mul i32 %595, %8
  %597 = add i32 %596, %45
  %598 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %597
  %599 = load double, double addrspace(3)* %598, align 8, !tbaa !4
  %600 = fmul contract double %594, %599
  %601 = fadd contract double %591, %600
  %602 = add nuw nsw i32 %590, 1
  %603 = add nuw nsw i32 %592, 1
  %604 = icmp eq i32 %603, %580
  br i1 %604, label %605, label %589, !llvm.loop !21

605:                                              ; preds = %589, %584, %578
  %606 = phi double [ %540, %578 ], [ %585, %584 ], [ %601, %589 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %821

607:                                              ; preds = %607, %582
  %608 = phi i32 [ 0, %582 ], [ %690, %607 ]
  %609 = phi double [ %540, %582 ], [ %689, %607 ]
  %610 = phi i32 [ 0, %582 ], [ %691, %607 ]
  %611 = getelementptr inbounds double, double addrspace(3)* %17, i32 %608
  %612 = load double, double addrspace(3)* %611, align 8, !tbaa !4
  %613 = add nuw i32 %608, %53
  %614 = mul i32 %613, %8
  %615 = add i32 %614, %45
  %616 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %615
  %617 = load double, double addrspace(3)* %616, align 8, !tbaa !4
  %618 = fmul contract double %612, %617
  %619 = fadd contract double %609, %618
  %620 = or i32 %608, 1
  %621 = getelementptr inbounds double, double addrspace(3)* %17, i32 %620
  %622 = load double, double addrspace(3)* %621, align 8, !tbaa !4
  %623 = add nuw i32 %620, %53
  %624 = mul i32 %623, %8
  %625 = add i32 %624, %45
  %626 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %625
  %627 = load double, double addrspace(3)* %626, align 8, !tbaa !4
  %628 = fmul contract double %622, %627
  %629 = fadd contract double %619, %628
  %630 = or i32 %608, 2
  %631 = getelementptr inbounds double, double addrspace(3)* %17, i32 %630
  %632 = load double, double addrspace(3)* %631, align 8, !tbaa !4
  %633 = add nuw i32 %630, %53
  %634 = mul i32 %633, %8
  %635 = add i32 %634, %45
  %636 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %635
  %637 = load double, double addrspace(3)* %636, align 8, !tbaa !4
  %638 = fmul contract double %632, %637
  %639 = fadd contract double %629, %638
  %640 = or i32 %608, 3
  %641 = getelementptr inbounds double, double addrspace(3)* %17, i32 %640
  %642 = load double, double addrspace(3)* %641, align 8, !tbaa !4
  %643 = add nuw i32 %640, %53
  %644 = mul i32 %643, %8
  %645 = add i32 %644, %45
  %646 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %645
  %647 = load double, double addrspace(3)* %646, align 8, !tbaa !4
  %648 = fmul contract double %642, %647
  %649 = fadd contract double %639, %648
  %650 = or i32 %608, 4
  %651 = getelementptr inbounds double, double addrspace(3)* %17, i32 %650
  %652 = load double, double addrspace(3)* %651, align 8, !tbaa !4
  %653 = add nuw i32 %650, %53
  %654 = mul i32 %653, %8
  %655 = add i32 %654, %45
  %656 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %655
  %657 = load double, double addrspace(3)* %656, align 8, !tbaa !4
  %658 = fmul contract double %652, %657
  %659 = fadd contract double %649, %658
  %660 = or i32 %608, 5
  %661 = getelementptr inbounds double, double addrspace(3)* %17, i32 %660
  %662 = load double, double addrspace(3)* %661, align 8, !tbaa !4
  %663 = add nuw i32 %660, %53
  %664 = mul i32 %663, %8
  %665 = add i32 %664, %45
  %666 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %665
  %667 = load double, double addrspace(3)* %666, align 8, !tbaa !4
  %668 = fmul contract double %662, %667
  %669 = fadd contract double %659, %668
  %670 = or i32 %608, 6
  %671 = getelementptr inbounds double, double addrspace(3)* %17, i32 %670
  %672 = load double, double addrspace(3)* %671, align 8, !tbaa !4
  %673 = add nuw i32 %670, %53
  %674 = mul i32 %673, %8
  %675 = add i32 %674, %45
  %676 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %675
  %677 = load double, double addrspace(3)* %676, align 8, !tbaa !4
  %678 = fmul contract double %672, %677
  %679 = fadd contract double %669, %678
  %680 = or i32 %608, 7
  %681 = getelementptr inbounds double, double addrspace(3)* %17, i32 %680
  %682 = load double, double addrspace(3)* %681, align 8, !tbaa !4
  %683 = add nuw i32 %680, %53
  %684 = mul i32 %683, %8
  %685 = add i32 %684, %45
  %686 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %685
  %687 = load double, double addrspace(3)* %686, align 8, !tbaa !4
  %688 = fmul contract double %682, %687
  %689 = fadd contract double %679, %688
  %690 = add nuw nsw i32 %608, 8
  %691 = add nuw i32 %610, 8
  %692 = icmp eq i32 %691, %583
  br i1 %692, label %584, label %607, !llvm.loop !22

693:                                              ; preds = %544
  br i1 %554, label %694, label %704

694:                                              ; preds = %693
  %695 = sub nsw i32 %54, %6
  %696 = mul nsw i32 %695, %11
  %697 = add nsw i32 %696, %46
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds double, double addrspace(1)* %1, i64 %698
  %700 = load double, double addrspace(1)* %699, align 8, !tbaa !4
  %701 = mul i32 %53, %8
  %702 = add i32 %701, %45
  %703 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %702
  store double %700, double addrspace(3)* %703, align 8, !tbaa !4
  br label %704

704:                                              ; preds = %694, %693
  br i1 %18, label %705, label %731

705:                                              ; preds = %704
  %706 = and i32 %5, 7
  %707 = icmp ult i32 %5, 8
  br i1 %707, label %710, label %708

708:                                              ; preds = %705
  %709 = and i32 %5, -8
  br label %735

710:                                              ; preds = %735, %705
  %711 = phi double [ undef, %705 ], [ %817, %735 ]
  %712 = phi i32 [ 0, %705 ], [ %818, %735 ]
  %713 = phi double [ %540, %705 ], [ %817, %735 ]
  %714 = icmp eq i32 %706, 0
  br i1 %714, label %731, label %715

715:                                              ; preds = %710, %715
  %716 = phi i32 [ %728, %715 ], [ %712, %710 ]
  %717 = phi double [ %727, %715 ], [ %713, %710 ]
  %718 = phi i32 [ %729, %715 ], [ 0, %710 ]
  %719 = getelementptr inbounds double, double addrspace(3)* %17, i32 %716
  %720 = load double, double addrspace(3)* %719, align 8, !tbaa !4
  %721 = add nuw i32 %716, %53
  %722 = mul i32 %721, %8
  %723 = add i32 %722, %45
  %724 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %723
  %725 = load double, double addrspace(3)* %724, align 8, !tbaa !4
  %726 = fmul contract double %720, %725
  %727 = fadd contract double %717, %726
  %728 = add nuw nsw i32 %716, 1
  %729 = add nuw nsw i32 %718, 1
  %730 = icmp eq i32 %729, %706
  br i1 %730, label %731, label %715, !llvm.loop !23

731:                                              ; preds = %715, %710, %704
  %732 = phi double [ %540, %704 ], [ %711, %710 ], [ %727, %715 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %733 = sub nsw i32 %10, %7
  %734 = icmp ult i32 %53, %733
  br i1 %734, label %821, label %824

735:                                              ; preds = %735, %708
  %736 = phi i32 [ 0, %708 ], [ %818, %735 ]
  %737 = phi double [ %540, %708 ], [ %817, %735 ]
  %738 = phi i32 [ 0, %708 ], [ %819, %735 ]
  %739 = getelementptr inbounds double, double addrspace(3)* %17, i32 %736
  %740 = load double, double addrspace(3)* %739, align 8, !tbaa !4
  %741 = add nuw i32 %736, %53
  %742 = mul i32 %741, %8
  %743 = add i32 %742, %45
  %744 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %743
  %745 = load double, double addrspace(3)* %744, align 8, !tbaa !4
  %746 = fmul contract double %740, %745
  %747 = fadd contract double %737, %746
  %748 = or i32 %736, 1
  %749 = getelementptr inbounds double, double addrspace(3)* %17, i32 %748
  %750 = load double, double addrspace(3)* %749, align 8, !tbaa !4
  %751 = add nuw i32 %748, %53
  %752 = mul i32 %751, %8
  %753 = add i32 %752, %45
  %754 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %753
  %755 = load double, double addrspace(3)* %754, align 8, !tbaa !4
  %756 = fmul contract double %750, %755
  %757 = fadd contract double %747, %756
  %758 = or i32 %736, 2
  %759 = getelementptr inbounds double, double addrspace(3)* %17, i32 %758
  %760 = load double, double addrspace(3)* %759, align 8, !tbaa !4
  %761 = add nuw i32 %758, %53
  %762 = mul i32 %761, %8
  %763 = add i32 %762, %45
  %764 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %763
  %765 = load double, double addrspace(3)* %764, align 8, !tbaa !4
  %766 = fmul contract double %760, %765
  %767 = fadd contract double %757, %766
  %768 = or i32 %736, 3
  %769 = getelementptr inbounds double, double addrspace(3)* %17, i32 %768
  %770 = load double, double addrspace(3)* %769, align 8, !tbaa !4
  %771 = add nuw i32 %768, %53
  %772 = mul i32 %771, %8
  %773 = add i32 %772, %45
  %774 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %773
  %775 = load double, double addrspace(3)* %774, align 8, !tbaa !4
  %776 = fmul contract double %770, %775
  %777 = fadd contract double %767, %776
  %778 = or i32 %736, 4
  %779 = getelementptr inbounds double, double addrspace(3)* %17, i32 %778
  %780 = load double, double addrspace(3)* %779, align 8, !tbaa !4
  %781 = add nuw i32 %778, %53
  %782 = mul i32 %781, %8
  %783 = add i32 %782, %45
  %784 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %783
  %785 = load double, double addrspace(3)* %784, align 8, !tbaa !4
  %786 = fmul contract double %780, %785
  %787 = fadd contract double %777, %786
  %788 = or i32 %736, 5
  %789 = getelementptr inbounds double, double addrspace(3)* %17, i32 %788
  %790 = load double, double addrspace(3)* %789, align 8, !tbaa !4
  %791 = add nuw i32 %788, %53
  %792 = mul i32 %791, %8
  %793 = add i32 %792, %45
  %794 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %793
  %795 = load double, double addrspace(3)* %794, align 8, !tbaa !4
  %796 = fmul contract double %790, %795
  %797 = fadd contract double %787, %796
  %798 = or i32 %736, 6
  %799 = getelementptr inbounds double, double addrspace(3)* %17, i32 %798
  %800 = load double, double addrspace(3)* %799, align 8, !tbaa !4
  %801 = add nuw i32 %798, %53
  %802 = mul i32 %801, %8
  %803 = add i32 %802, %45
  %804 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %803
  %805 = load double, double addrspace(3)* %804, align 8, !tbaa !4
  %806 = fmul contract double %800, %805
  %807 = fadd contract double %797, %806
  %808 = or i32 %736, 7
  %809 = getelementptr inbounds double, double addrspace(3)* %17, i32 %808
  %810 = load double, double addrspace(3)* %809, align 8, !tbaa !4
  %811 = add nuw i32 %808, %53
  %812 = mul i32 %811, %8
  %813 = add i32 %812, %45
  %814 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %813
  %815 = load double, double addrspace(3)* %814, align 8, !tbaa !4
  %816 = fmul contract double %810, %815
  %817 = fadd contract double %807, %816
  %818 = add nuw nsw i32 %736, 8
  %819 = add nuw i32 %738, 8
  %820 = icmp eq i32 %819, %709
  br i1 %820, label %710, label %735, !llvm.loop !24

821:                                              ; preds = %731, %605
  %822 = phi double [ %606, %605 ], [ %732, %731 ]
  %823 = getelementptr inbounds double, double addrspace(1)* %0, i64 %548
  store double %822, double addrspace(1)* %823, align 8, !tbaa !4
  br label %824

824:                                              ; preds = %821, %731, %539
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
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !14, !10}
!21 = distinct !{!21, !10}
!22 = distinct !{!22, !14, !10}
!23 = distinct !{!23, !10}
!24 = distinct !{!24, !14, !10}
