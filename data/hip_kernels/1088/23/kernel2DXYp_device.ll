; ModuleID = '../data/hip_kernels/1088/23/main.cu'
source_filename = "../data/hip_kernels/1088/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@memory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kernel2DXYpPdS_S_S_PKdiiiiiiiiiiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17) local_unnamed_addr #0 {
  %19 = mul nsw i32 %13, %12
  %20 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %19
  %21 = icmp sgt i32 %5, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %18
  %23 = and i32 %5, 7
  %24 = icmp ult i32 %5, 8
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %26 = and i32 %5, -8
  br label %69

27:                                               ; preds = %69, %22
  %28 = phi i32 [ 0, %22 ], [ %111, %69 ]
  %29 = icmp eq i32 %23, 0
  br i1 %29, label %40, label %30

30:                                               ; preds = %27, %30
  %31 = phi i32 [ %37, %30 ], [ %28, %27 ]
  %32 = phi i32 [ %38, %30 ], [ 0, %27 ]
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !4, !amdgpu.noclobber !8
  %36 = getelementptr inbounds double, double addrspace(3)* %20, i32 %31
  store double %35, double addrspace(3)* %36, align 8, !tbaa !4
  %37 = add nuw nsw i32 %31, 1
  %38 = add nuw nsw i32 %32, 1
  %39 = icmp eq i32 %38, %23
  br i1 %39, label %40, label %30, !llvm.loop !9

40:                                               ; preds = %30, %27, %18
  %41 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %43 = getelementptr i8, i8 addrspace(4)* %41, i64 4
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 4, !range !11, !invariant.load !8
  %46 = zext i16 %45 to i32
  %47 = mul i32 %42, %46
  %48 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %49 = add i32 %47, %48
  %50 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %51 = getelementptr i8, i8 addrspace(4)* %41, i64 6
  %52 = bitcast i8 addrspace(4)* %51 to i16 addrspace(4)*
  %53 = load i16, i16 addrspace(4)* %52, align 2, !range !11, !invariant.load !8
  %54 = zext i16 %53 to i32
  %55 = mul i32 %50, %54
  %56 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %57 = add i32 %55, %56
  %58 = add i32 %48, %7
  %59 = add i32 %56, %10
  %60 = mul nsw i32 %57, %16
  %61 = add nsw i32 %60, %49
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !4, !amdgpu.noclobber !8
  %65 = mul nsw i32 %59, %12
  %66 = add nsw i32 %65, %58
  %67 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %66
  store double %64, double addrspace(3)* %67, align 8, !tbaa !4
  %68 = icmp eq i32 %42, 0
  br i1 %68, label %130, label %114

69:                                               ; preds = %69, %25
  %70 = phi i32 [ 0, %25 ], [ %111, %69 ]
  %71 = phi i32 [ 0, %25 ], [ %112, %69 ]
  %72 = zext i32 %70 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %4, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !4, !amdgpu.noclobber !8
  %75 = getelementptr inbounds double, double addrspace(3)* %20, i32 %70
  store double %74, double addrspace(3)* %75, align 8, !tbaa !4
  %76 = or i32 %70, 1
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %4, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !4, !amdgpu.noclobber !8
  %80 = getelementptr inbounds double, double addrspace(3)* %20, i32 %76
  store double %79, double addrspace(3)* %80, align 8, !tbaa !4
  %81 = or i32 %70, 2
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %4, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !4, !amdgpu.noclobber !8
  %85 = getelementptr inbounds double, double addrspace(3)* %20, i32 %81
  store double %84, double addrspace(3)* %85, align 8, !tbaa !4
  %86 = or i32 %70, 3
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %4, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !4, !amdgpu.noclobber !8
  %90 = getelementptr inbounds double, double addrspace(3)* %20, i32 %86
  store double %89, double addrspace(3)* %90, align 8, !tbaa !4
  %91 = or i32 %70, 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %4, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !4, !amdgpu.noclobber !8
  %95 = getelementptr inbounds double, double addrspace(3)* %20, i32 %91
  store double %94, double addrspace(3)* %95, align 8, !tbaa !4
  %96 = or i32 %70, 5
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %4, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !4, !amdgpu.noclobber !8
  %100 = getelementptr inbounds double, double addrspace(3)* %20, i32 %96
  store double %99, double addrspace(3)* %100, align 8, !tbaa !4
  %101 = or i32 %70, 6
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %4, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !4, !amdgpu.noclobber !8
  %105 = getelementptr inbounds double, double addrspace(3)* %20, i32 %101
  store double %104, double addrspace(3)* %105, align 8, !tbaa !4
  %106 = or i32 %70, 7
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %4, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !4, !amdgpu.noclobber !8
  %110 = getelementptr inbounds double, double addrspace(3)* %20, i32 %106
  store double %109, double addrspace(3)* %110, align 8, !tbaa !4
  %111 = add nuw nsw i32 %70, 8
  %112 = add nuw i32 %71, 8
  %113 = icmp eq i32 %112, %26
  br i1 %113, label %27, label %69, !llvm.loop !13

114:                                              ; preds = %40
  %115 = sdiv i32 %16, %14
  %116 = add nsw i32 %115, -1
  %117 = icmp eq i32 %42, %116
  br i1 %117, label %151, label %118

118:                                              ; preds = %114
  %119 = icmp ult i32 %48, %7
  br i1 %119, label %120, label %128

120:                                              ; preds = %118
  %121 = sub i32 %49, %7
  %122 = add nsw i32 %121, %60
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !4, !amdgpu.noclobber !8
  %126 = add i32 %65, %48
  %127 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %126
  store double %125, double addrspace(3)* %127, align 8, !tbaa !4
  br label %128

128:                                              ; preds = %120, %118
  %129 = icmp ult i32 %48, %8
  br i1 %129, label %143, label %151

130:                                              ; preds = %40
  %131 = icmp ult i32 %48, %7
  br i1 %131, label %132, label %141

132:                                              ; preds = %130
  %133 = add i32 %60, %48
  %134 = sub i32 %133, %7
  %135 = add i32 %134, %16
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %1, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !4, !amdgpu.noclobber !8
  %139 = add i32 %65, %48
  %140 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %139
  store double %138, double addrspace(3)* %140, align 8, !tbaa !4
  br label %141

141:                                              ; preds = %132, %130
  %142 = icmp ult i32 %48, %8
  br i1 %142, label %143, label %151

143:                                              ; preds = %141, %128
  %144 = add nsw i32 %61, %14
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %1, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !4
  %148 = add nsw i32 %58, %14
  %149 = add nsw i32 %148, %65
  %150 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %149
  store double %147, double addrspace(3)* %150, align 8, !tbaa !4
  br label %151

151:                                              ; preds = %143, %114, %128, %141
  %152 = sdiv i32 %16, %14
  %153 = add nsw i32 %152, -1
  %154 = icmp eq i32 %42, %153
  br i1 %154, label %155, label %175

155:                                              ; preds = %151
  %156 = icmp ult i32 %48, %7
  br i1 %156, label %157, label %165

157:                                              ; preds = %155
  %158 = sub i32 %49, %7
  %159 = add nsw i32 %158, %60
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds double, double addrspace(1)* %1, i64 %160
  %162 = load double, double addrspace(1)* %161, align 8, !tbaa !4, !amdgpu.noclobber !8
  %163 = add i32 %65, %48
  %164 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %163
  store double %162, double addrspace(3)* %164, align 8, !tbaa !4
  br label %165

165:                                              ; preds = %157, %155
  %166 = icmp ult i32 %48, %8
  br i1 %166, label %167, label %175

167:                                              ; preds = %165
  %168 = add i32 %60, %48
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds double, double addrspace(1)* %1, i64 %169
  %171 = load double, double addrspace(1)* %170, align 8, !tbaa !4, !amdgpu.noclobber !8
  %172 = add nsw i32 %58, %14
  %173 = add nsw i32 %172, %65
  %174 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %173
  store double %171, double addrspace(3)* %174, align 8, !tbaa !4
  br label %175

175:                                              ; preds = %165, %167, %151
  %176 = icmp eq i32 %50, 0
  br i1 %176, label %195, label %177

177:                                              ; preds = %175
  %178 = sdiv i32 %17, %15
  %179 = add nsw i32 %178, -1
  %180 = icmp eq i32 %50, %179
  br i1 %180, label %219, label %181

181:                                              ; preds = %177
  %182 = icmp ult i32 %56, %10
  br i1 %182, label %183, label %193

183:                                              ; preds = %181
  %184 = sub nsw i32 %57, %10
  %185 = mul nsw i32 %184, %16
  %186 = add nsw i32 %185, %49
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds double, double addrspace(1)* %1, i64 %187
  %189 = load double, double addrspace(1)* %188, align 8, !tbaa !4, !amdgpu.noclobber !8
  %190 = mul i32 %56, %12
  %191 = add i32 %190, %58
  %192 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %191
  store double %189, double addrspace(3)* %192, align 8, !tbaa !4
  br label %193

193:                                              ; preds = %183, %181
  %194 = icmp ult i32 %56, %11
  br i1 %194, label %208, label %219

195:                                              ; preds = %175
  %196 = icmp ult i32 %56, %10
  br i1 %196, label %197, label %206

197:                                              ; preds = %195
  %198 = mul i32 %56, %16
  %199 = add i32 %49, %198
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds double, double addrspace(1)* %2, i64 %200
  %202 = load double, double addrspace(1)* %201, align 8, !tbaa !4, !amdgpu.noclobber !8
  %203 = mul i32 %56, %12
  %204 = add i32 %203, %58
  %205 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %204
  store double %202, double addrspace(3)* %205, align 8, !tbaa !4
  br label %206

206:                                              ; preds = %197, %195
  %207 = icmp ult i32 %56, %11
  br i1 %207, label %208, label %219

208:                                              ; preds = %206, %193
  %209 = add nsw i32 %57, %15
  %210 = mul nsw i32 %209, %16
  %211 = add nsw i32 %210, %49
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds double, double addrspace(1)* %1, i64 %212
  %214 = load double, double addrspace(1)* %213, align 8, !tbaa !4
  %215 = add nsw i32 %59, %15
  %216 = mul nsw i32 %215, %12
  %217 = add nsw i32 %216, %58
  %218 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %217
  store double %214, double addrspace(3)* %218, align 8, !tbaa !4
  br label %219

219:                                              ; preds = %208, %177, %193, %206
  %220 = sdiv i32 %17, %15
  %221 = add nsw i32 %220, -1
  %222 = icmp eq i32 %50, %221
  br i1 %222, label %223, label %247

223:                                              ; preds = %219
  %224 = icmp ult i32 %56, %10
  br i1 %224, label %225, label %235

225:                                              ; preds = %223
  %226 = sub nsw i32 %57, %10
  %227 = mul nsw i32 %226, %16
  %228 = add nsw i32 %227, %49
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds double, double addrspace(1)* %1, i64 %229
  %231 = load double, double addrspace(1)* %230, align 8, !tbaa !4, !amdgpu.noclobber !8
  %232 = mul i32 %56, %12
  %233 = add i32 %232, %58
  %234 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %233
  store double %231, double addrspace(3)* %234, align 8, !tbaa !4
  br label %235

235:                                              ; preds = %225, %223
  %236 = icmp ult i32 %56, %11
  br i1 %236, label %237, label %247

237:                                              ; preds = %235
  %238 = mul i32 %56, %16
  %239 = add i32 %49, %238
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds double, double addrspace(1)* %3, i64 %240
  %242 = load double, double addrspace(1)* %241, align 8, !tbaa !4, !amdgpu.noclobber !8
  %243 = add nsw i32 %59, %15
  %244 = mul nsw i32 %243, %12
  %245 = add nsw i32 %244, %58
  %246 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %245
  store double %242, double addrspace(3)* %246, align 8, !tbaa !4
  br label %247

247:                                              ; preds = %235, %237, %219
  %248 = select i1 %176, i1 true, i1 %222
  br i1 %248, label %433, label %249

249:                                              ; preds = %247
  %250 = select i1 %68, i1 true, i1 %154
  br i1 %250, label %311, label %251

251:                                              ; preds = %249
  %252 = icmp ult i32 %48, %7
  %253 = icmp ult i32 %56, %10
  %254 = select i1 %252, i1 %253, i1 false
  br i1 %254, label %255, label %266

255:                                              ; preds = %251
  %256 = sub nsw i32 %57, %10
  %257 = mul nsw i32 %256, %16
  %258 = sub i32 %49, %7
  %259 = add nsw i32 %258, %257
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds double, double addrspace(1)* %1, i64 %260
  %262 = load double, double addrspace(1)* %261, align 8, !tbaa !4, !amdgpu.noclobber !8
  %263 = mul i32 %56, %12
  %264 = add i32 %263, %48
  %265 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %264
  store double %262, double addrspace(3)* %265, align 8, !tbaa !4
  br label %266

266:                                              ; preds = %255, %251
  %267 = icmp ult i32 %48, %8
  %268 = select i1 %267, i1 %253, i1 false
  br i1 %268, label %269, label %281

269:                                              ; preds = %266
  %270 = sub nsw i32 %57, %10
  %271 = mul nsw i32 %270, %16
  %272 = add nsw i32 %49, %14
  %273 = add nsw i32 %272, %271
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds double, double addrspace(1)* %1, i64 %274
  %276 = load double, double addrspace(1)* %275, align 8, !tbaa !4, !amdgpu.noclobber !8
  %277 = mul i32 %56, %12
  %278 = add nsw i32 %58, %14
  %279 = add i32 %278, %277
  %280 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %279
  store double %276, double addrspace(3)* %280, align 8, !tbaa !4
  br label %281

281:                                              ; preds = %269, %266
  %282 = icmp ult i32 %56, %11
  %283 = select i1 %252, i1 %282, i1 false
  br i1 %283, label %284, label %296

284:                                              ; preds = %281
  %285 = add nsw i32 %57, %15
  %286 = mul nsw i32 %285, %16
  %287 = sub i32 %49, %7
  %288 = add nsw i32 %287, %286
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds double, double addrspace(1)* %1, i64 %289
  %291 = load double, double addrspace(1)* %290, align 8, !tbaa !4, !amdgpu.noclobber !8
  %292 = add nsw i32 %59, %15
  %293 = mul nsw i32 %292, %12
  %294 = add i32 %293, %48
  %295 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %294
  store double %291, double addrspace(3)* %295, align 8, !tbaa !4
  br label %296

296:                                              ; preds = %284, %281
  %297 = select i1 %267, i1 %282, i1 false
  br i1 %297, label %298, label %311

298:                                              ; preds = %296
  %299 = add nsw i32 %57, %15
  %300 = mul nsw i32 %299, %16
  %301 = add nsw i32 %49, %14
  %302 = add nsw i32 %301, %300
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds double, double addrspace(1)* %1, i64 %303
  %305 = load double, double addrspace(1)* %304, align 8, !tbaa !4, !amdgpu.noclobber !8
  %306 = add nsw i32 %59, %15
  %307 = mul nsw i32 %306, %12
  %308 = add nsw i32 %58, %14
  %309 = add nsw i32 %308, %307
  %310 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %309
  store double %305, double addrspace(3)* %310, align 8, !tbaa !4
  br label %311

311:                                              ; preds = %249, %296, %298
  br i1 %68, label %312, label %374

312:                                              ; preds = %311
  %313 = icmp ult i32 %48, %7
  %314 = icmp ult i32 %56, %10
  %315 = select i1 %313, i1 %314, i1 false
  br i1 %315, label %316, label %328

316:                                              ; preds = %312
  %317 = sub nsw i32 %57, %10
  %318 = mul nsw i32 %317, %16
  %319 = sub i32 %48, %7
  %320 = add i32 %319, %16
  %321 = add i32 %320, %318
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds double, double addrspace(1)* %1, i64 %322
  %324 = load double, double addrspace(1)* %323, align 8, !tbaa !4, !amdgpu.noclobber !8
  %325 = mul i32 %56, %12
  %326 = add i32 %325, %48
  %327 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %326
  store double %324, double addrspace(3)* %327, align 8, !tbaa !4
  br label %328

328:                                              ; preds = %316, %312
  %329 = icmp ult i32 %48, %8
  %330 = select i1 %329, i1 %314, i1 false
  br i1 %330, label %331, label %343

331:                                              ; preds = %328
  %332 = sub nsw i32 %57, %10
  %333 = mul nsw i32 %332, %16
  %334 = add nsw i32 %49, %14
  %335 = add nsw i32 %334, %333
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds double, double addrspace(1)* %1, i64 %336
  %338 = load double, double addrspace(1)* %337, align 8, !tbaa !4, !amdgpu.noclobber !8
  %339 = mul i32 %56, %12
  %340 = add nsw i32 %58, %14
  %341 = add i32 %340, %339
  %342 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %341
  store double %338, double addrspace(3)* %342, align 8, !tbaa !4
  br label %343

343:                                              ; preds = %331, %328
  %344 = icmp ult i32 %56, %11
  %345 = select i1 %313, i1 %344, i1 false
  br i1 %345, label %346, label %359

346:                                              ; preds = %343
  %347 = add nsw i32 %57, %15
  %348 = mul nsw i32 %347, %16
  %349 = sub i32 %48, %7
  %350 = add i32 %349, %16
  %351 = add i32 %350, %348
  %352 = zext i32 %351 to i64
  %353 = getelementptr inbounds double, double addrspace(1)* %1, i64 %352
  %354 = load double, double addrspace(1)* %353, align 8, !tbaa !4, !amdgpu.noclobber !8
  %355 = add nsw i32 %59, %15
  %356 = mul nsw i32 %355, %12
  %357 = add i32 %356, %48
  %358 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %357
  store double %354, double addrspace(3)* %358, align 8, !tbaa !4
  br label %359

359:                                              ; preds = %346, %343
  %360 = select i1 %329, i1 %344, i1 false
  br i1 %360, label %361, label %374

361:                                              ; preds = %359
  %362 = add nsw i32 %57, %15
  %363 = mul nsw i32 %362, %16
  %364 = add nsw i32 %49, %14
  %365 = add nsw i32 %364, %363
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds double, double addrspace(1)* %1, i64 %366
  %368 = load double, double addrspace(1)* %367, align 8, !tbaa !4, !amdgpu.noclobber !8
  %369 = add nsw i32 %59, %15
  %370 = mul nsw i32 %369, %12
  %371 = add nsw i32 %58, %14
  %372 = add nsw i32 %371, %370
  %373 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %372
  store double %368, double addrspace(3)* %373, align 8, !tbaa !4
  br label %374

374:                                              ; preds = %359, %361, %311
  br i1 %154, label %375, label %433

375:                                              ; preds = %374
  %376 = icmp ult i32 %48, %7
  %377 = icmp ult i32 %56, %10
  %378 = select i1 %376, i1 %377, i1 false
  br i1 %378, label %379, label %390

379:                                              ; preds = %375
  %380 = sub nsw i32 %57, %10
  %381 = mul nsw i32 %380, %16
  %382 = sub i32 %49, %7
  %383 = add nsw i32 %382, %381
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds double, double addrspace(1)* %1, i64 %384
  %386 = load double, double addrspace(1)* %385, align 8, !tbaa !4, !amdgpu.noclobber !8
  %387 = mul i32 %56, %12
  %388 = add i32 %387, %48
  %389 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %388
  store double %386, double addrspace(3)* %389, align 8, !tbaa !4
  br label %390

390:                                              ; preds = %379, %375
  %391 = icmp ult i32 %48, %8
  %392 = select i1 %391, i1 %377, i1 false
  br i1 %392, label %393, label %404

393:                                              ; preds = %390
  %394 = sub nsw i32 %57, %10
  %395 = mul nsw i32 %394, %16
  %396 = add i32 %395, %48
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds double, double addrspace(1)* %1, i64 %397
  %399 = load double, double addrspace(1)* %398, align 8, !tbaa !4, !amdgpu.noclobber !8
  %400 = mul i32 %56, %12
  %401 = add nsw i32 %58, %14
  %402 = add i32 %401, %400
  %403 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %402
  store double %399, double addrspace(3)* %403, align 8, !tbaa !4
  br label %404

404:                                              ; preds = %393, %390
  %405 = icmp ult i32 %56, %11
  %406 = select i1 %376, i1 %405, i1 false
  br i1 %406, label %407, label %419

407:                                              ; preds = %404
  %408 = add nsw i32 %57, %15
  %409 = mul nsw i32 %408, %16
  %410 = sub i32 %49, %7
  %411 = add nsw i32 %410, %409
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds double, double addrspace(1)* %1, i64 %412
  %414 = load double, double addrspace(1)* %413, align 8, !tbaa !4, !amdgpu.noclobber !8
  %415 = add nsw i32 %59, %15
  %416 = mul nsw i32 %415, %12
  %417 = add i32 %416, %48
  %418 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %417
  store double %414, double addrspace(3)* %418, align 8, !tbaa !4
  br label %419

419:                                              ; preds = %407, %404
  %420 = select i1 %391, i1 %405, i1 false
  br i1 %420, label %421, label %433

421:                                              ; preds = %419
  %422 = add nsw i32 %57, %15
  %423 = mul nsw i32 %422, %16
  %424 = add i32 %423, %48
  %425 = zext i32 %424 to i64
  %426 = getelementptr inbounds double, double addrspace(1)* %1, i64 %425
  %427 = load double, double addrspace(1)* %426, align 8, !tbaa !4, !amdgpu.noclobber !8
  %428 = add nsw i32 %59, %15
  %429 = mul nsw i32 %428, %12
  %430 = add nsw i32 %58, %14
  %431 = add nsw i32 %430, %429
  %432 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %431
  store double %427, double addrspace(3)* %432, align 8, !tbaa !4
  br label %433

433:                                              ; preds = %247, %374, %421, %419
  br i1 %176, label %434, label %612

434:                                              ; preds = %433
  %435 = select i1 %68, i1 true, i1 %154
  br i1 %435, label %494, label %436

436:                                              ; preds = %434
  %437 = icmp ult i32 %48, %7
  %438 = icmp ult i32 %56, %10
  %439 = select i1 %437, i1 %438, i1 false
  br i1 %439, label %440, label %450

440:                                              ; preds = %436
  %441 = mul i32 %56, %16
  %442 = sub i32 %441, %7
  %443 = add i32 %442, %49
  %444 = zext i32 %443 to i64
  %445 = getelementptr inbounds double, double addrspace(1)* %2, i64 %444
  %446 = load double, double addrspace(1)* %445, align 8, !tbaa !4, !amdgpu.noclobber !8
  %447 = mul i32 %56, %12
  %448 = add i32 %447, %48
  %449 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %448
  store double %446, double addrspace(3)* %449, align 8, !tbaa !4
  br label %450

450:                                              ; preds = %440, %436
  %451 = icmp ult i32 %48, %8
  %452 = select i1 %451, i1 %438, i1 false
  br i1 %452, label %453, label %464

453:                                              ; preds = %450
  %454 = mul i32 %56, %16
  %455 = add nsw i32 %49, %14
  %456 = add i32 %455, %454
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds double, double addrspace(1)* %2, i64 %457
  %459 = load double, double addrspace(1)* %458, align 8, !tbaa !4, !amdgpu.noclobber !8
  %460 = mul i32 %56, %12
  %461 = add nsw i32 %58, %14
  %462 = add i32 %461, %460
  %463 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %462
  store double %459, double addrspace(3)* %463, align 8, !tbaa !4
  br label %464

464:                                              ; preds = %453, %450
  %465 = icmp ult i32 %56, %11
  %466 = select i1 %437, i1 %465, i1 false
  br i1 %466, label %467, label %479

467:                                              ; preds = %464
  %468 = add nsw i32 %57, %15
  %469 = mul nsw i32 %468, %16
  %470 = sub i32 %49, %7
  %471 = add nsw i32 %470, %469
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds double, double addrspace(1)* %1, i64 %472
  %474 = load double, double addrspace(1)* %473, align 8, !tbaa !4, !amdgpu.noclobber !8
  %475 = add nsw i32 %59, %15
  %476 = mul nsw i32 %475, %12
  %477 = add i32 %476, %48
  %478 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %477
  store double %474, double addrspace(3)* %478, align 8, !tbaa !4
  br label %479

479:                                              ; preds = %467, %464
  %480 = select i1 %451, i1 %465, i1 false
  br i1 %480, label %481, label %494

481:                                              ; preds = %479
  %482 = add nsw i32 %57, %15
  %483 = mul nsw i32 %482, %16
  %484 = add nsw i32 %49, %14
  %485 = add nsw i32 %484, %483
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds double, double addrspace(1)* %1, i64 %486
  %488 = load double, double addrspace(1)* %487, align 8, !tbaa !4, !amdgpu.noclobber !8
  %489 = add nsw i32 %59, %15
  %490 = mul nsw i32 %489, %12
  %491 = add nsw i32 %58, %14
  %492 = add nsw i32 %491, %490
  %493 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %492
  store double %488, double addrspace(3)* %493, align 8, !tbaa !4
  br label %494

494:                                              ; preds = %434, %479, %481
  br i1 %68, label %495, label %555

495:                                              ; preds = %494
  %496 = icmp ult i32 %48, %7
  %497 = icmp ult i32 %56, %10
  %498 = select i1 %496, i1 %497, i1 false
  br i1 %498, label %499, label %510

499:                                              ; preds = %495
  %500 = mul i32 %56, %16
  %501 = sub i32 %48, %7
  %502 = add i32 %501, %16
  %503 = add i32 %502, %500
  %504 = zext i32 %503 to i64
  %505 = getelementptr inbounds double, double addrspace(1)* %2, i64 %504
  %506 = load double, double addrspace(1)* %505, align 8, !tbaa !4, !amdgpu.noclobber !8
  %507 = mul i32 %56, %12
  %508 = add i32 %507, %48
  %509 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %508
  store double %506, double addrspace(3)* %509, align 8, !tbaa !4
  br label %510

510:                                              ; preds = %499, %495
  %511 = icmp ult i32 %48, %8
  %512 = select i1 %511, i1 %497, i1 false
  br i1 %512, label %513, label %524

513:                                              ; preds = %510
  %514 = mul i32 %56, %16
  %515 = add nsw i32 %49, %14
  %516 = add i32 %515, %514
  %517 = zext i32 %516 to i64
  %518 = getelementptr inbounds double, double addrspace(1)* %2, i64 %517
  %519 = load double, double addrspace(1)* %518, align 8, !tbaa !4, !amdgpu.noclobber !8
  %520 = mul i32 %56, %12
  %521 = add nsw i32 %58, %14
  %522 = add i32 %521, %520
  %523 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %522
  store double %519, double addrspace(3)* %523, align 8, !tbaa !4
  br label %524

524:                                              ; preds = %513, %510
  %525 = icmp ult i32 %56, %11
  %526 = select i1 %496, i1 %525, i1 false
  br i1 %526, label %527, label %540

527:                                              ; preds = %524
  %528 = add nsw i32 %57, %15
  %529 = mul nsw i32 %528, %16
  %530 = sub i32 %48, %7
  %531 = add i32 %530, %16
  %532 = add i32 %531, %529
  %533 = zext i32 %532 to i64
  %534 = getelementptr inbounds double, double addrspace(1)* %1, i64 %533
  %535 = load double, double addrspace(1)* %534, align 8, !tbaa !4, !amdgpu.noclobber !8
  %536 = add nsw i32 %59, %15
  %537 = mul nsw i32 %536, %12
  %538 = add i32 %537, %48
  %539 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %538
  store double %535, double addrspace(3)* %539, align 8, !tbaa !4
  br label %540

540:                                              ; preds = %527, %524
  %541 = select i1 %511, i1 %525, i1 false
  br i1 %541, label %542, label %555

542:                                              ; preds = %540
  %543 = add nsw i32 %57, %15
  %544 = mul nsw i32 %543, %16
  %545 = add nsw i32 %49, %14
  %546 = add nsw i32 %545, %544
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds double, double addrspace(1)* %1, i64 %547
  %549 = load double, double addrspace(1)* %548, align 8, !tbaa !4, !amdgpu.noclobber !8
  %550 = add nsw i32 %59, %15
  %551 = mul nsw i32 %550, %12
  %552 = add nsw i32 %58, %14
  %553 = add nsw i32 %552, %551
  %554 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %553
  store double %549, double addrspace(3)* %554, align 8, !tbaa !4
  br label %555

555:                                              ; preds = %540, %542, %494
  br i1 %154, label %556, label %612

556:                                              ; preds = %555
  %557 = icmp ult i32 %48, %7
  %558 = icmp ult i32 %56, %10
  %559 = select i1 %557, i1 %558, i1 false
  br i1 %559, label %560, label %570

560:                                              ; preds = %556
  %561 = mul i32 %56, %16
  %562 = sub i32 %561, %7
  %563 = add i32 %562, %49
  %564 = zext i32 %563 to i64
  %565 = getelementptr inbounds double, double addrspace(1)* %2, i64 %564
  %566 = load double, double addrspace(1)* %565, align 8, !tbaa !4, !amdgpu.noclobber !8
  %567 = mul i32 %56, %12
  %568 = add i32 %567, %48
  %569 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %568
  store double %566, double addrspace(3)* %569, align 8, !tbaa !4
  br label %570

570:                                              ; preds = %560, %556
  %571 = icmp ult i32 %48, %8
  %572 = select i1 %571, i1 %558, i1 false
  br i1 %572, label %573, label %583

573:                                              ; preds = %570
  %574 = mul i32 %56, %16
  %575 = add i32 %574, %48
  %576 = zext i32 %575 to i64
  %577 = getelementptr inbounds double, double addrspace(1)* %2, i64 %576
  %578 = load double, double addrspace(1)* %577, align 8, !tbaa !4, !amdgpu.noclobber !8
  %579 = mul i32 %56, %12
  %580 = add nsw i32 %58, %14
  %581 = add i32 %580, %579
  %582 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %581
  store double %578, double addrspace(3)* %582, align 8, !tbaa !4
  br label %583

583:                                              ; preds = %573, %570
  %584 = icmp ult i32 %56, %11
  %585 = select i1 %557, i1 %584, i1 false
  br i1 %585, label %586, label %598

586:                                              ; preds = %583
  %587 = add nsw i32 %57, %15
  %588 = mul nsw i32 %587, %16
  %589 = sub i32 %49, %7
  %590 = add nsw i32 %589, %588
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds double, double addrspace(1)* %1, i64 %591
  %593 = load double, double addrspace(1)* %592, align 8, !tbaa !4, !amdgpu.noclobber !8
  %594 = add nsw i32 %59, %15
  %595 = mul nsw i32 %594, %12
  %596 = add i32 %595, %48
  %597 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %596
  store double %593, double addrspace(3)* %597, align 8, !tbaa !4
  br label %598

598:                                              ; preds = %586, %583
  %599 = select i1 %571, i1 %584, i1 false
  br i1 %599, label %600, label %612

600:                                              ; preds = %598
  %601 = add nsw i32 %57, %15
  %602 = mul nsw i32 %601, %16
  %603 = add i32 %602, %48
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds double, double addrspace(1)* %1, i64 %604
  %606 = load double, double addrspace(1)* %605, align 8, !tbaa !4, !amdgpu.noclobber !8
  %607 = add nsw i32 %59, %15
  %608 = mul nsw i32 %607, %12
  %609 = add nsw i32 %58, %14
  %610 = add nsw i32 %609, %608
  %611 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %610
  store double %606, double addrspace(3)* %611, align 8, !tbaa !4
  br label %612

612:                                              ; preds = %555, %600, %598, %433
  br i1 %222, label %613, label %791

613:                                              ; preds = %612
  %614 = select i1 %68, i1 true, i1 %154
  br i1 %614, label %673, label %615

615:                                              ; preds = %613
  %616 = icmp ult i32 %48, %7
  %617 = icmp ult i32 %56, %10
  %618 = select i1 %616, i1 %617, i1 false
  br i1 %618, label %619, label %630

619:                                              ; preds = %615
  %620 = sub nsw i32 %57, %10
  %621 = mul nsw i32 %620, %16
  %622 = sub i32 %49, %7
  %623 = add nsw i32 %622, %621
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds double, double addrspace(1)* %1, i64 %624
  %626 = load double, double addrspace(1)* %625, align 8, !tbaa !4, !amdgpu.noclobber !8
  %627 = mul i32 %56, %12
  %628 = add i32 %627, %48
  %629 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %628
  store double %626, double addrspace(3)* %629, align 8, !tbaa !4
  br label %630

630:                                              ; preds = %619, %615
  %631 = icmp ult i32 %48, %8
  %632 = select i1 %631, i1 %617, i1 false
  br i1 %632, label %633, label %645

633:                                              ; preds = %630
  %634 = sub nsw i32 %57, %10
  %635 = mul nsw i32 %634, %16
  %636 = add nsw i32 %49, %14
  %637 = add nsw i32 %636, %635
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds double, double addrspace(1)* %1, i64 %638
  %640 = load double, double addrspace(1)* %639, align 8, !tbaa !4, !amdgpu.noclobber !8
  %641 = mul i32 %56, %12
  %642 = add nsw i32 %58, %14
  %643 = add i32 %642, %641
  %644 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %643
  store double %640, double addrspace(3)* %644, align 8, !tbaa !4
  br label %645

645:                                              ; preds = %633, %630
  %646 = icmp ult i32 %56, %11
  %647 = select i1 %616, i1 %646, i1 false
  br i1 %647, label %648, label %659

648:                                              ; preds = %645
  %649 = mul i32 %56, %16
  %650 = sub i32 %649, %7
  %651 = add i32 %650, %49
  %652 = zext i32 %651 to i64
  %653 = getelementptr inbounds double, double addrspace(1)* %3, i64 %652
  %654 = load double, double addrspace(1)* %653, align 8, !tbaa !4, !amdgpu.noclobber !8
  %655 = add nsw i32 %59, %15
  %656 = mul nsw i32 %655, %12
  %657 = add i32 %656, %48
  %658 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %657
  store double %654, double addrspace(3)* %658, align 8, !tbaa !4
  br label %659

659:                                              ; preds = %648, %645
  %660 = select i1 %631, i1 %646, i1 false
  br i1 %660, label %661, label %673

661:                                              ; preds = %659
  %662 = mul i32 %56, %16
  %663 = add nsw i32 %49, %14
  %664 = add i32 %663, %662
  %665 = zext i32 %664 to i64
  %666 = getelementptr inbounds double, double addrspace(1)* %3, i64 %665
  %667 = load double, double addrspace(1)* %666, align 8, !tbaa !4, !amdgpu.noclobber !8
  %668 = add nsw i32 %59, %15
  %669 = mul nsw i32 %668, %12
  %670 = add nsw i32 %58, %14
  %671 = add nsw i32 %670, %669
  %672 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %671
  store double %667, double addrspace(3)* %672, align 8, !tbaa !4
  br label %673

673:                                              ; preds = %613, %659, %661
  br i1 %68, label %674, label %734

674:                                              ; preds = %673
  %675 = icmp ult i32 %48, %7
  %676 = icmp ult i32 %56, %10
  %677 = select i1 %675, i1 %676, i1 false
  br i1 %677, label %678, label %690

678:                                              ; preds = %674
  %679 = sub nsw i32 %57, %10
  %680 = mul nsw i32 %679, %16
  %681 = sub i32 %48, %7
  %682 = add i32 %681, %16
  %683 = add i32 %682, %680
  %684 = zext i32 %683 to i64
  %685 = getelementptr inbounds double, double addrspace(1)* %1, i64 %684
  %686 = load double, double addrspace(1)* %685, align 8, !tbaa !4, !amdgpu.noclobber !8
  %687 = mul i32 %56, %12
  %688 = add i32 %687, %48
  %689 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %688
  store double %686, double addrspace(3)* %689, align 8, !tbaa !4
  br label %690

690:                                              ; preds = %678, %674
  %691 = icmp ult i32 %48, %8
  %692 = select i1 %691, i1 %676, i1 false
  br i1 %692, label %693, label %705

693:                                              ; preds = %690
  %694 = sub nsw i32 %57, %10
  %695 = mul nsw i32 %694, %16
  %696 = add nsw i32 %49, %14
  %697 = add nsw i32 %696, %695
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds double, double addrspace(1)* %1, i64 %698
  %700 = load double, double addrspace(1)* %699, align 8, !tbaa !4, !amdgpu.noclobber !8
  %701 = mul i32 %56, %12
  %702 = add nsw i32 %58, %14
  %703 = add i32 %702, %701
  %704 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %703
  store double %700, double addrspace(3)* %704, align 8, !tbaa !4
  br label %705

705:                                              ; preds = %693, %690
  %706 = icmp ult i32 %56, %11
  %707 = select i1 %675, i1 %706, i1 false
  br i1 %707, label %708, label %720

708:                                              ; preds = %705
  %709 = mul i32 %56, %16
  %710 = sub i32 %48, %7
  %711 = add i32 %710, %16
  %712 = add i32 %711, %709
  %713 = zext i32 %712 to i64
  %714 = getelementptr inbounds double, double addrspace(1)* %3, i64 %713
  %715 = load double, double addrspace(1)* %714, align 8, !tbaa !4, !amdgpu.noclobber !8
  %716 = add nsw i32 %59, %15
  %717 = mul nsw i32 %716, %12
  %718 = add i32 %717, %48
  %719 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %718
  store double %715, double addrspace(3)* %719, align 8, !tbaa !4
  br label %720

720:                                              ; preds = %708, %705
  %721 = select i1 %691, i1 %706, i1 false
  br i1 %721, label %722, label %734

722:                                              ; preds = %720
  %723 = mul i32 %56, %16
  %724 = add nsw i32 %49, %14
  %725 = add i32 %724, %723
  %726 = zext i32 %725 to i64
  %727 = getelementptr inbounds double, double addrspace(1)* %3, i64 %726
  %728 = load double, double addrspace(1)* %727, align 8, !tbaa !4, !amdgpu.noclobber !8
  %729 = add nsw i32 %59, %15
  %730 = mul nsw i32 %729, %12
  %731 = add nsw i32 %58, %14
  %732 = add nsw i32 %731, %730
  %733 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %732
  store double %728, double addrspace(3)* %733, align 8, !tbaa !4
  br label %734

734:                                              ; preds = %720, %722, %673
  br i1 %154, label %735, label %791

735:                                              ; preds = %734
  %736 = icmp ult i32 %48, %7
  %737 = icmp ult i32 %56, %10
  %738 = select i1 %736, i1 %737, i1 false
  br i1 %738, label %739, label %750

739:                                              ; preds = %735
  %740 = sub nsw i32 %57, %10
  %741 = mul nsw i32 %740, %16
  %742 = sub i32 %49, %7
  %743 = add nsw i32 %742, %741
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds double, double addrspace(1)* %1, i64 %744
  %746 = load double, double addrspace(1)* %745, align 8, !tbaa !4, !amdgpu.noclobber !8
  %747 = mul i32 %56, %12
  %748 = add i32 %747, %48
  %749 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %748
  store double %746, double addrspace(3)* %749, align 8, !tbaa !4
  br label %750

750:                                              ; preds = %739, %735
  %751 = icmp ult i32 %48, %8
  %752 = select i1 %751, i1 %737, i1 false
  br i1 %752, label %753, label %764

753:                                              ; preds = %750
  %754 = sub nsw i32 %57, %10
  %755 = mul nsw i32 %754, %16
  %756 = add i32 %755, %48
  %757 = zext i32 %756 to i64
  %758 = getelementptr inbounds double, double addrspace(1)* %1, i64 %757
  %759 = load double, double addrspace(1)* %758, align 8, !tbaa !4, !amdgpu.noclobber !8
  %760 = mul i32 %56, %12
  %761 = add nsw i32 %58, %14
  %762 = add i32 %761, %760
  %763 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %762
  store double %759, double addrspace(3)* %763, align 8, !tbaa !4
  br label %764

764:                                              ; preds = %753, %750
  %765 = icmp ult i32 %56, %11
  %766 = select i1 %736, i1 %765, i1 false
  br i1 %766, label %767, label %778

767:                                              ; preds = %764
  %768 = mul i32 %56, %16
  %769 = sub i32 %768, %7
  %770 = add i32 %769, %49
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds double, double addrspace(1)* %3, i64 %771
  %773 = load double, double addrspace(1)* %772, align 8, !tbaa !4, !amdgpu.noclobber !8
  %774 = add nsw i32 %59, %15
  %775 = mul nsw i32 %774, %12
  %776 = add i32 %775, %48
  %777 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %776
  store double %773, double addrspace(3)* %777, align 8, !tbaa !4
  br label %778

778:                                              ; preds = %767, %764
  %779 = select i1 %751, i1 %765, i1 false
  br i1 %779, label %780, label %791

780:                                              ; preds = %778
  %781 = mul i32 %56, %16
  %782 = add i32 %781, %48
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds double, double addrspace(1)* %3, i64 %783
  %785 = load double, double addrspace(1)* %784, align 8, !tbaa !4, !amdgpu.noclobber !8
  %786 = add nsw i32 %59, %15
  %787 = mul nsw i32 %786, %12
  %788 = add nsw i32 %58, %14
  %789 = add nsw i32 %788, %787
  %790 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %789
  store double %785, double addrspace(3)* %790, align 8, !tbaa !4
  br label %791

791:                                              ; preds = %734, %780, %778, %612
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %792 = icmp sgt i32 %9, 0
  br i1 %792, label %793, label %799

793:                                              ; preds = %791
  %794 = icmp sgt i32 %6, 0
  %795 = and i32 %6, 7
  %796 = icmp ult i32 %6, 8
  %797 = and i32 %6, -8
  %798 = icmp eq i32 %795, 0
  br label %802

799:                                              ; preds = %834, %791
  %800 = phi double [ 0.000000e+00, %791 ], [ %835, %834 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %801 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  store double %800, double addrspace(1)* %801, align 8, !tbaa !4
  ret void

802:                                              ; preds = %793, %834
  %803 = phi i32 [ 0, %793 ], [ %837, %834 ]
  %804 = phi i32 [ 0, %793 ], [ %836, %834 ]
  %805 = phi double [ 0.000000e+00, %793 ], [ %835, %834 ]
  br i1 %794, label %806, label %834

806:                                              ; preds = %802
  %807 = add nuw i32 %803, %56
  %808 = mul i32 %807, %12
  %809 = add i32 %808, %48
  br i1 %796, label %810, label %839

810:                                              ; preds = %839, %806
  %811 = phi double [ undef, %806 ], [ %913, %839 ]
  %812 = phi i32 [ 0, %806 ], [ %915, %839 ]
  %813 = phi i32 [ %804, %806 ], [ %914, %839 ]
  %814 = phi double [ %805, %806 ], [ %913, %839 ]
  br i1 %798, label %831, label %815

815:                                              ; preds = %810, %815
  %816 = phi i32 [ %828, %815 ], [ %812, %810 ]
  %817 = phi i32 [ %827, %815 ], [ %813, %810 ]
  %818 = phi double [ %826, %815 ], [ %814, %810 ]
  %819 = phi i32 [ %829, %815 ], [ 0, %810 ]
  %820 = getelementptr inbounds double, double addrspace(3)* %20, i32 %817
  %821 = load double, double addrspace(3)* %820, align 8, !tbaa !4
  %822 = add i32 %809, %816
  %823 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %822
  %824 = load double, double addrspace(3)* %823, align 8, !tbaa !4
  %825 = fmul contract double %821, %824
  %826 = fadd contract double %818, %825
  %827 = add nsw i32 %817, 1
  %828 = add nuw nsw i32 %816, 1
  %829 = add i32 %819, 1
  %830 = icmp eq i32 %829, %795
  br i1 %830, label %831, label %815, !llvm.loop !15

831:                                              ; preds = %815, %810
  %832 = phi double [ %811, %810 ], [ %826, %815 ]
  %833 = add i32 %804, %6
  br label %834

834:                                              ; preds = %831, %802
  %835 = phi double [ %805, %802 ], [ %832, %831 ]
  %836 = phi i32 [ %804, %802 ], [ %833, %831 ]
  %837 = add nuw nsw i32 %803, 1
  %838 = icmp eq i32 %837, %9
  br i1 %838, label %799, label %802, !llvm.loop !16

839:                                              ; preds = %806, %839
  %840 = phi i32 [ %915, %839 ], [ 0, %806 ]
  %841 = phi i32 [ %914, %839 ], [ %804, %806 ]
  %842 = phi double [ %913, %839 ], [ %805, %806 ]
  %843 = phi i32 [ %916, %839 ], [ 0, %806 ]
  %844 = getelementptr inbounds double, double addrspace(3)* %20, i32 %841
  %845 = load double, double addrspace(3)* %844, align 8, !tbaa !4
  %846 = add i32 %809, %840
  %847 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %846
  %848 = load double, double addrspace(3)* %847, align 8, !tbaa !4
  %849 = fmul contract double %845, %848
  %850 = fadd contract double %842, %849
  %851 = add nsw i32 %841, 1
  %852 = or i32 %840, 1
  %853 = getelementptr inbounds double, double addrspace(3)* %20, i32 %851
  %854 = load double, double addrspace(3)* %853, align 8, !tbaa !4
  %855 = add i32 %809, %852
  %856 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %855
  %857 = load double, double addrspace(3)* %856, align 8, !tbaa !4
  %858 = fmul contract double %854, %857
  %859 = fadd contract double %850, %858
  %860 = add nsw i32 %841, 2
  %861 = or i32 %840, 2
  %862 = getelementptr inbounds double, double addrspace(3)* %20, i32 %860
  %863 = load double, double addrspace(3)* %862, align 8, !tbaa !4
  %864 = add i32 %809, %861
  %865 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %864
  %866 = load double, double addrspace(3)* %865, align 8, !tbaa !4
  %867 = fmul contract double %863, %866
  %868 = fadd contract double %859, %867
  %869 = add nsw i32 %841, 3
  %870 = or i32 %840, 3
  %871 = getelementptr inbounds double, double addrspace(3)* %20, i32 %869
  %872 = load double, double addrspace(3)* %871, align 8, !tbaa !4
  %873 = add i32 %809, %870
  %874 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %873
  %875 = load double, double addrspace(3)* %874, align 8, !tbaa !4
  %876 = fmul contract double %872, %875
  %877 = fadd contract double %868, %876
  %878 = add nsw i32 %841, 4
  %879 = or i32 %840, 4
  %880 = getelementptr inbounds double, double addrspace(3)* %20, i32 %878
  %881 = load double, double addrspace(3)* %880, align 8, !tbaa !4
  %882 = add i32 %809, %879
  %883 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %882
  %884 = load double, double addrspace(3)* %883, align 8, !tbaa !4
  %885 = fmul contract double %881, %884
  %886 = fadd contract double %877, %885
  %887 = add nsw i32 %841, 5
  %888 = or i32 %840, 5
  %889 = getelementptr inbounds double, double addrspace(3)* %20, i32 %887
  %890 = load double, double addrspace(3)* %889, align 8, !tbaa !4
  %891 = add i32 %809, %888
  %892 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %891
  %893 = load double, double addrspace(3)* %892, align 8, !tbaa !4
  %894 = fmul contract double %890, %893
  %895 = fadd contract double %886, %894
  %896 = add nsw i32 %841, 6
  %897 = or i32 %840, 6
  %898 = getelementptr inbounds double, double addrspace(3)* %20, i32 %896
  %899 = load double, double addrspace(3)* %898, align 8, !tbaa !4
  %900 = add i32 %809, %897
  %901 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %900
  %902 = load double, double addrspace(3)* %901, align 8, !tbaa !4
  %903 = fmul contract double %899, %902
  %904 = fadd contract double %895, %903
  %905 = add nsw i32 %841, 7
  %906 = or i32 %840, 7
  %907 = getelementptr inbounds double, double addrspace(3)* %20, i32 %905
  %908 = load double, double addrspace(3)* %907, align 8, !tbaa !4
  %909 = add i32 %809, %906
  %910 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %909
  %911 = load double, double addrspace(3)* %910, align 8, !tbaa !4
  %912 = fmul contract double %908, %911
  %913 = fadd contract double %904, %912
  %914 = add nsw i32 %841, 8
  %915 = add nuw nsw i32 %840, 8
  %916 = add i32 %843, 8
  %917 = icmp eq i32 %916, %797
  br i1 %917, label %810, label %839, !llvm.loop !17
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
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
