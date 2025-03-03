; ModuleID = '../data/hip_kernels/15524/6/main.cu'
source_filename = "../data/hip_kernels/15524/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30convolutionRowsKernel_down_smpPfS_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 7
  %10 = shl i32 %6, 4
  %11 = sub i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add i32 %11, %12
  %14 = shl i32 %8, 6
  %15 = add i32 %14, %12
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = shl i32 %16, 2
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %4
  br i1 %20, label %21, label %762

21:                                               ; preds = %7
  %22 = mul nsw i32 %19, %2
  %23 = add nsw i32 %13, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = mul nsw i32 %19, %3
  %27 = add nsw i32 %26, %15
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = icmp sgt i32 %6, 0
  %31 = shl i32 %6, 1
  %32 = add i32 %31, 8
  br i1 %30, label %33, label %61

33:                                               ; preds = %21
  %34 = shl nuw nsw i32 %18, 4
  %35 = mul i32 %34, %32
  %36 = add i32 %35, %12
  %37 = and i32 %6, 7
  %38 = icmp ult i32 %6, 8
  br i1 %38, label %41, label %39

39:                                               ; preds = %33
  %40 = and i32 %6, -8
  br label %89

41:                                               ; preds = %183, %33
  %42 = phi i32 [ 0, %33 ], [ %187, %183 ]
  %43 = icmp eq i32 %37, 0
  br i1 %43, label %61, label %44

44:                                               ; preds = %41, %54
  %45 = phi i32 [ %58, %54 ], [ %42, %41 ]
  %46 = phi i32 [ %59, %54 ], [ 0, %41 ]
  %47 = shl nsw i32 %45, 4
  %48 = add nsw i32 %47, %13
  %49 = icmp sgt i32 %48, -1
  br i1 %49, label %50, label %54

50:                                               ; preds = %44
  %51 = zext i32 %47 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %25, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %54

54:                                               ; preds = %50, %44
  %55 = phi contract float [ %53, %50 ], [ 0.000000e+00, %44 ]
  %56 = add i32 %36, %47
  %57 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %56
  store float %55, float addrspace(3)* %57, align 4, !tbaa !5
  %58 = add nuw nsw i32 %45, 1
  %59 = add nuw nsw i32 %46, 1
  %60 = icmp eq i32 %59, %37
  br i1 %60, label %61, label %44, !llvm.loop !10

61:                                               ; preds = %54, %41, %21
  %62 = icmp sgt i32 %32, %6
  %63 = mul i32 %32, %18
  %64 = shl i32 %63, 4
  br i1 %62, label %65, label %190

65:                                               ; preds = %61
  %66 = add i32 %64, %12
  %67 = and i32 %6, 7
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %86, label %69

69:                                               ; preds = %65, %79
  %70 = phi i32 [ %83, %79 ], [ %6, %65 ]
  %71 = phi i32 [ %84, %79 ], [ 0, %65 ]
  %72 = shl nsw i32 %70, 4
  %73 = add nsw i32 %72, %13
  %74 = icmp slt i32 %73, %2
  br i1 %74, label %75, label %79

75:                                               ; preds = %69
  %76 = sext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %25, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %79

79:                                               ; preds = %75, %69
  %80 = phi contract float [ %78, %75 ], [ 0.000000e+00, %69 ]
  %81 = add i32 %66, %72
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %81
  store float %80, float addrspace(3)* %82, align 4, !tbaa !5
  %83 = add nsw i32 %70, 1
  %84 = add nuw nsw i32 %71, 1
  %85 = icmp eq i32 %84, %67
  br i1 %85, label %86, label %69, !llvm.loop !12

86:                                               ; preds = %79, %65
  %87 = phi i32 [ %6, %65 ], [ %83, %79 ]
  %88 = icmp ugt i32 %6, -8
  br i1 %88, label %190, label %204

89:                                               ; preds = %183, %39
  %90 = phi i32 [ 0, %39 ], [ %187, %183 ]
  %91 = phi i32 [ 0, %39 ], [ %188, %183 ]
  %92 = shl nsw i32 %90, 4
  %93 = add nsw i32 %92, %13
  %94 = icmp sgt i32 %93, -1
  br i1 %94, label %95, label %99

95:                                               ; preds = %89
  %96 = zext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %25, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %99

99:                                               ; preds = %89, %95
  %100 = phi contract float [ %98, %95 ], [ 0.000000e+00, %89 ]
  %101 = add i32 %36, %92
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %101
  store float %100, float addrspace(3)* %102, align 4, !tbaa !5
  %103 = shl i32 %90, 4
  %104 = or i32 %103, 16
  %105 = add nsw i32 %104, %13
  %106 = icmp sgt i32 %105, -1
  br i1 %106, label %107, label %111

107:                                              ; preds = %99
  %108 = zext i32 %104 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %25, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %111

111:                                              ; preds = %107, %99
  %112 = phi contract float [ %110, %107 ], [ 0.000000e+00, %99 ]
  %113 = add i32 %36, %104
  %114 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %113
  store float %112, float addrspace(3)* %114, align 4, !tbaa !5
  %115 = shl i32 %90, 4
  %116 = or i32 %115, 32
  %117 = add nsw i32 %116, %13
  %118 = icmp sgt i32 %117, -1
  br i1 %118, label %119, label %123

119:                                              ; preds = %111
  %120 = zext i32 %116 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %25, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %123

123:                                              ; preds = %119, %111
  %124 = phi contract float [ %122, %119 ], [ 0.000000e+00, %111 ]
  %125 = add i32 %36, %116
  %126 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %125
  store float %124, float addrspace(3)* %126, align 4, !tbaa !5
  %127 = shl i32 %90, 4
  %128 = or i32 %127, 48
  %129 = add nsw i32 %128, %13
  %130 = icmp sgt i32 %129, -1
  br i1 %130, label %131, label %135

131:                                              ; preds = %123
  %132 = zext i32 %128 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %25, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %135

135:                                              ; preds = %131, %123
  %136 = phi contract float [ %134, %131 ], [ 0.000000e+00, %123 ]
  %137 = add i32 %36, %128
  %138 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %137
  store float %136, float addrspace(3)* %138, align 4, !tbaa !5
  %139 = shl i32 %90, 4
  %140 = or i32 %139, 64
  %141 = add nsw i32 %140, %13
  %142 = icmp sgt i32 %141, -1
  br i1 %142, label %143, label %147

143:                                              ; preds = %135
  %144 = zext i32 %140 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %25, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %147

147:                                              ; preds = %143, %135
  %148 = phi contract float [ %146, %143 ], [ 0.000000e+00, %135 ]
  %149 = add i32 %36, %140
  %150 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %149
  store float %148, float addrspace(3)* %150, align 4, !tbaa !5
  %151 = shl i32 %90, 4
  %152 = or i32 %151, 80
  %153 = add nsw i32 %152, %13
  %154 = icmp sgt i32 %153, -1
  br i1 %154, label %155, label %159

155:                                              ; preds = %147
  %156 = zext i32 %152 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %25, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %159

159:                                              ; preds = %155, %147
  %160 = phi contract float [ %158, %155 ], [ 0.000000e+00, %147 ]
  %161 = add i32 %36, %152
  %162 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %161
  store float %160, float addrspace(3)* %162, align 4, !tbaa !5
  %163 = shl i32 %90, 4
  %164 = or i32 %163, 96
  %165 = add nsw i32 %164, %13
  %166 = icmp sgt i32 %165, -1
  br i1 %166, label %167, label %171

167:                                              ; preds = %159
  %168 = zext i32 %164 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %25, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %171

171:                                              ; preds = %167, %159
  %172 = phi contract float [ %170, %167 ], [ 0.000000e+00, %159 ]
  %173 = add i32 %36, %164
  %174 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %173
  store float %172, float addrspace(3)* %174, align 4, !tbaa !5
  %175 = shl i32 %90, 4
  %176 = or i32 %175, 112
  %177 = add nsw i32 %176, %13
  %178 = icmp sgt i32 %177, -1
  br i1 %178, label %179, label %183

179:                                              ; preds = %171
  %180 = zext i32 %176 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %25, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %183

183:                                              ; preds = %179, %171
  %184 = phi contract float [ %182, %179 ], [ 0.000000e+00, %171 ]
  %185 = add i32 %36, %176
  %186 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %185
  store float %184, float addrspace(3)* %186, align 4, !tbaa !5
  %187 = add nuw nsw i32 %90, 8
  %188 = add i32 %91, 8
  %189 = icmp eq i32 %188, %40
  br i1 %189, label %41, label %89, !llvm.loop !13

190:                                              ; preds = %297, %86, %61
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %191 = sub i32 0, %5
  %192 = icmp slt i32 %5, 0
  %193 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %194 = shl nuw nsw i32 %12, 1
  %195 = add i32 %10, %194
  %196 = add i32 %195, %64
  %197 = tail call i32 @llvm.abs.i32(i32 %5, i1 false)
  %198 = add nuw i32 %197, 1
  %199 = add i32 %197, %5
  %200 = add i32 %199, 1
  %201 = and i32 %200, 7
  %202 = sub i32 %201, %5
  %203 = icmp slt i32 %15, %3
  br i1 %203, label %303, label %414

204:                                              ; preds = %86, %297
  %205 = phi i32 [ %301, %297 ], [ %87, %86 ]
  %206 = shl nsw i32 %205, 4
  %207 = add nsw i32 %206, %13
  %208 = icmp slt i32 %207, %2
  br i1 %208, label %209, label %213

209:                                              ; preds = %204
  %210 = sext i32 %206 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %25, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %213

213:                                              ; preds = %204, %209
  %214 = phi contract float [ %212, %209 ], [ 0.000000e+00, %204 ]
  %215 = add i32 %66, %206
  %216 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %215
  store float %214, float addrspace(3)* %216, align 4, !tbaa !5
  %217 = shl i32 %205, 4
  %218 = add i32 %217, 16
  %219 = add nsw i32 %218, %13
  %220 = icmp slt i32 %219, %2
  br i1 %220, label %221, label %225

221:                                              ; preds = %213
  %222 = sext i32 %218 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %25, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %225

225:                                              ; preds = %221, %213
  %226 = phi contract float [ %224, %221 ], [ 0.000000e+00, %213 ]
  %227 = add i32 %66, %218
  %228 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %227
  store float %226, float addrspace(3)* %228, align 4, !tbaa !5
  %229 = shl i32 %205, 4
  %230 = add i32 %229, 32
  %231 = add nsw i32 %230, %13
  %232 = icmp slt i32 %231, %2
  br i1 %232, label %233, label %237

233:                                              ; preds = %225
  %234 = sext i32 %230 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %25, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %237

237:                                              ; preds = %233, %225
  %238 = phi contract float [ %236, %233 ], [ 0.000000e+00, %225 ]
  %239 = add i32 %66, %230
  %240 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %239
  store float %238, float addrspace(3)* %240, align 4, !tbaa !5
  %241 = shl i32 %205, 4
  %242 = add i32 %241, 48
  %243 = add nsw i32 %242, %13
  %244 = icmp slt i32 %243, %2
  br i1 %244, label %245, label %249

245:                                              ; preds = %237
  %246 = sext i32 %242 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %25, i64 %246
  %248 = load float, float addrspace(1)* %247, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %249

249:                                              ; preds = %245, %237
  %250 = phi contract float [ %248, %245 ], [ 0.000000e+00, %237 ]
  %251 = add i32 %66, %242
  %252 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %251
  store float %250, float addrspace(3)* %252, align 4, !tbaa !5
  %253 = shl i32 %205, 4
  %254 = add i32 %253, 64
  %255 = add nsw i32 %254, %13
  %256 = icmp slt i32 %255, %2
  br i1 %256, label %257, label %261

257:                                              ; preds = %249
  %258 = sext i32 %254 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %25, i64 %258
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %261

261:                                              ; preds = %257, %249
  %262 = phi contract float [ %260, %257 ], [ 0.000000e+00, %249 ]
  %263 = add i32 %66, %254
  %264 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %263
  store float %262, float addrspace(3)* %264, align 4, !tbaa !5
  %265 = shl i32 %205, 4
  %266 = add i32 %265, 80
  %267 = add nsw i32 %266, %13
  %268 = icmp slt i32 %267, %2
  br i1 %268, label %269, label %273

269:                                              ; preds = %261
  %270 = sext i32 %266 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %25, i64 %270
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %273

273:                                              ; preds = %269, %261
  %274 = phi contract float [ %272, %269 ], [ 0.000000e+00, %261 ]
  %275 = add i32 %66, %266
  %276 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %275
  store float %274, float addrspace(3)* %276, align 4, !tbaa !5
  %277 = shl i32 %205, 4
  %278 = add i32 %277, 96
  %279 = add nsw i32 %278, %13
  %280 = icmp slt i32 %279, %2
  br i1 %280, label %281, label %285

281:                                              ; preds = %273
  %282 = sext i32 %278 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %25, i64 %282
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %285

285:                                              ; preds = %281, %273
  %286 = phi contract float [ %284, %281 ], [ 0.000000e+00, %273 ]
  %287 = add i32 %66, %278
  %288 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %287
  store float %286, float addrspace(3)* %288, align 4, !tbaa !5
  %289 = shl i32 %205, 4
  %290 = add i32 %289, 112
  %291 = add nsw i32 %290, %13
  %292 = icmp slt i32 %291, %2
  br i1 %292, label %293, label %297

293:                                              ; preds = %285
  %294 = sext i32 %290 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %25, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %297

297:                                              ; preds = %293, %285
  %298 = phi contract float [ %296, %293 ], [ 0.000000e+00, %285 ]
  %299 = add i32 %66, %290
  %300 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %299
  store float %298, float addrspace(3)* %300, align 4, !tbaa !5
  %301 = add nsw i32 %205, 8
  %302 = icmp eq i32 %205, %31
  br i1 %302, label %190, label %204, !llvm.loop !15

303:                                              ; preds = %190
  br i1 %192, label %328, label %304

304:                                              ; preds = %303
  %305 = and i32 %200, 7
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %323, label %307

307:                                              ; preds = %304, %307
  %308 = phi i32 [ %320, %307 ], [ %191, %304 ]
  %309 = phi float [ %319, %307 ], [ 0.000000e+00, %304 ]
  %310 = phi i32 [ %321, %307 ], [ 0, %304 ]
  %311 = sub nsw i32 %5, %308
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds float, float* %193, i64 %312
  %314 = load float, float* %313, align 4, !tbaa !5
  %315 = add i32 %196, %308
  %316 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %315
  %317 = load float, float addrspace(3)* %316, align 4, !tbaa !5
  %318 = fmul contract float %314, %317
  %319 = fadd contract float %309, %318
  %320 = add i32 %308, 1
  %321 = add nuw nsw i32 %310, 1
  %322 = icmp eq i32 %321, %305
  br i1 %322, label %323, label %307, !llvm.loop !16

323:                                              ; preds = %307, %304
  %324 = phi i32 [ %191, %304 ], [ %202, %307 ]
  %325 = phi float [ 0.000000e+00, %304 ], [ %319, %307 ]
  %326 = phi float [ undef, %304 ], [ %319, %307 ]
  %327 = icmp ult i32 %199, 7
  br i1 %327, label %328, label %330

328:                                              ; preds = %330, %323, %303
  %329 = phi float [ 0.000000e+00, %303 ], [ %326, %323 ], [ %411, %330 ]
  store float %329, float addrspace(1)* %29, align 4, !tbaa !5
  br label %414

330:                                              ; preds = %323, %330
  %331 = phi i32 [ %412, %330 ], [ %324, %323 ]
  %332 = phi float [ %411, %330 ], [ %325, %323 ]
  %333 = sub nsw i32 %5, %331
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds float, float* %193, i64 %334
  %336 = load float, float* %335, align 4, !tbaa !5
  %337 = add i32 %196, %331
  %338 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %337
  %339 = load float, float addrspace(3)* %338, align 4, !tbaa !5
  %340 = fmul contract float %336, %339
  %341 = fadd contract float %332, %340
  %342 = add i32 %331, 1
  %343 = sub nsw i32 %5, %342
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float* %193, i64 %344
  %346 = load float, float* %345, align 4, !tbaa !5
  %347 = add i32 %196, %342
  %348 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %347
  %349 = load float, float addrspace(3)* %348, align 4, !tbaa !5
  %350 = fmul contract float %346, %349
  %351 = fadd contract float %341, %350
  %352 = add i32 %331, 2
  %353 = sub nsw i32 %5, %352
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds float, float* %193, i64 %354
  %356 = load float, float* %355, align 4, !tbaa !5
  %357 = add i32 %196, %352
  %358 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %357
  %359 = load float, float addrspace(3)* %358, align 4, !tbaa !5
  %360 = fmul contract float %356, %359
  %361 = fadd contract float %351, %360
  %362 = add i32 %331, 3
  %363 = sub nsw i32 %5, %362
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds float, float* %193, i64 %364
  %366 = load float, float* %365, align 4, !tbaa !5
  %367 = add i32 %196, %362
  %368 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %367
  %369 = load float, float addrspace(3)* %368, align 4, !tbaa !5
  %370 = fmul contract float %366, %369
  %371 = fadd contract float %361, %370
  %372 = add i32 %331, 4
  %373 = sub nsw i32 %5, %372
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds float, float* %193, i64 %374
  %376 = load float, float* %375, align 4, !tbaa !5
  %377 = add i32 %196, %372
  %378 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %377
  %379 = load float, float addrspace(3)* %378, align 4, !tbaa !5
  %380 = fmul contract float %376, %379
  %381 = fadd contract float %371, %380
  %382 = add i32 %331, 5
  %383 = sub nsw i32 %5, %382
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds float, float* %193, i64 %384
  %386 = load float, float* %385, align 4, !tbaa !5
  %387 = add i32 %196, %382
  %388 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %387
  %389 = load float, float addrspace(3)* %388, align 4, !tbaa !5
  %390 = fmul contract float %386, %389
  %391 = fadd contract float %381, %390
  %392 = add i32 %331, 6
  %393 = sub nsw i32 %5, %392
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float* %193, i64 %394
  %396 = load float, float* %395, align 4, !tbaa !5
  %397 = add i32 %196, %392
  %398 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %397
  %399 = load float, float addrspace(3)* %398, align 4, !tbaa !5
  %400 = fmul contract float %396, %399
  %401 = fadd contract float %391, %400
  %402 = add i32 %331, 7
  %403 = sub nsw i32 %5, %402
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds float, float* %193, i64 %404
  %406 = load float, float* %405, align 4, !tbaa !5
  %407 = add i32 %196, %402
  %408 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %407
  %409 = load float, float addrspace(3)* %408, align 4, !tbaa !5
  %410 = fmul contract float %406, %409
  %411 = fadd contract float %401, %410
  %412 = add i32 %331, 8
  %413 = icmp eq i32 %412, %198
  br i1 %413, label %328, label %330, !llvm.loop !17

414:                                              ; preds = %328, %190
  %415 = add nsw i32 %15, 16
  %416 = icmp slt i32 %415, %3
  br i1 %416, label %417, label %530

417:                                              ; preds = %414
  br i1 %192, label %527, label %418

418:                                              ; preds = %417
  %419 = add i32 %196, 32
  %420 = and i32 %200, 7
  %421 = icmp eq i32 %420, 0
  br i1 %421, label %438, label %422

422:                                              ; preds = %418, %422
  %423 = phi i32 [ %435, %422 ], [ %191, %418 ]
  %424 = phi float [ %434, %422 ], [ 0.000000e+00, %418 ]
  %425 = phi i32 [ %436, %422 ], [ 0, %418 ]
  %426 = sub nsw i32 %5, %423
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds float, float* %193, i64 %427
  %429 = load float, float* %428, align 4, !tbaa !5
  %430 = add i32 %419, %423
  %431 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %430
  %432 = load float, float addrspace(3)* %431, align 4, !tbaa !5
  %433 = fmul contract float %429, %432
  %434 = fadd contract float %424, %433
  %435 = add i32 %423, 1
  %436 = add nuw nsw i32 %425, 1
  %437 = icmp eq i32 %436, %420
  br i1 %437, label %438, label %422, !llvm.loop !16

438:                                              ; preds = %422, %418
  %439 = phi i32 [ %191, %418 ], [ %202, %422 ]
  %440 = phi float [ 0.000000e+00, %418 ], [ %434, %422 ]
  %441 = phi float [ undef, %418 ], [ %434, %422 ]
  %442 = icmp ult i32 %199, 7
  br i1 %442, label %527, label %443

443:                                              ; preds = %438, %443
  %444 = phi i32 [ %525, %443 ], [ %439, %438 ]
  %445 = phi float [ %524, %443 ], [ %440, %438 ]
  %446 = sub nsw i32 %5, %444
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds float, float* %193, i64 %447
  %449 = load float, float* %448, align 4, !tbaa !5
  %450 = add i32 %419, %444
  %451 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %450
  %452 = load float, float addrspace(3)* %451, align 4, !tbaa !5
  %453 = fmul contract float %449, %452
  %454 = fadd contract float %445, %453
  %455 = add i32 %444, 1
  %456 = sub nsw i32 %5, %455
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds float, float* %193, i64 %457
  %459 = load float, float* %458, align 4, !tbaa !5
  %460 = add i32 %419, %455
  %461 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %460
  %462 = load float, float addrspace(3)* %461, align 4, !tbaa !5
  %463 = fmul contract float %459, %462
  %464 = fadd contract float %454, %463
  %465 = add i32 %444, 2
  %466 = sub nsw i32 %5, %465
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds float, float* %193, i64 %467
  %469 = load float, float* %468, align 4, !tbaa !5
  %470 = add i32 %419, %465
  %471 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %470
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !5
  %473 = fmul contract float %469, %472
  %474 = fadd contract float %464, %473
  %475 = add i32 %444, 3
  %476 = sub nsw i32 %5, %475
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds float, float* %193, i64 %477
  %479 = load float, float* %478, align 4, !tbaa !5
  %480 = add i32 %419, %475
  %481 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %480
  %482 = load float, float addrspace(3)* %481, align 4, !tbaa !5
  %483 = fmul contract float %479, %482
  %484 = fadd contract float %474, %483
  %485 = add i32 %444, 4
  %486 = sub nsw i32 %5, %485
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds float, float* %193, i64 %487
  %489 = load float, float* %488, align 4, !tbaa !5
  %490 = add i32 %419, %485
  %491 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %490
  %492 = load float, float addrspace(3)* %491, align 4, !tbaa !5
  %493 = fmul contract float %489, %492
  %494 = fadd contract float %484, %493
  %495 = add i32 %444, 5
  %496 = sub nsw i32 %5, %495
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds float, float* %193, i64 %497
  %499 = load float, float* %498, align 4, !tbaa !5
  %500 = add i32 %419, %495
  %501 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %500
  %502 = load float, float addrspace(3)* %501, align 4, !tbaa !5
  %503 = fmul contract float %499, %502
  %504 = fadd contract float %494, %503
  %505 = add i32 %444, 6
  %506 = sub nsw i32 %5, %505
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float* %193, i64 %507
  %509 = load float, float* %508, align 4, !tbaa !5
  %510 = add i32 %419, %505
  %511 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %510
  %512 = load float, float addrspace(3)* %511, align 4, !tbaa !5
  %513 = fmul contract float %509, %512
  %514 = fadd contract float %504, %513
  %515 = add i32 %444, 7
  %516 = sub nsw i32 %5, %515
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds float, float* %193, i64 %517
  %519 = load float, float* %518, align 4, !tbaa !5
  %520 = add i32 %419, %515
  %521 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %520
  %522 = load float, float addrspace(3)* %521, align 4, !tbaa !5
  %523 = fmul contract float %519, %522
  %524 = fadd contract float %514, %523
  %525 = add i32 %444, 8
  %526 = icmp eq i32 %525, %198
  br i1 %526, label %527, label %443, !llvm.loop !17

527:                                              ; preds = %443, %438, %417
  %528 = phi float [ 0.000000e+00, %417 ], [ %441, %438 ], [ %524, %443 ]
  %529 = getelementptr inbounds float, float addrspace(1)* %29, i64 16
  store float %528, float addrspace(1)* %529, align 4, !tbaa !5
  br label %530

530:                                              ; preds = %527, %414
  %531 = add nsw i32 %15, 32
  %532 = icmp slt i32 %531, %3
  br i1 %532, label %533, label %646

533:                                              ; preds = %530
  br i1 %192, label %643, label %534

534:                                              ; preds = %533
  %535 = add i32 %196, 64
  %536 = and i32 %200, 7
  %537 = icmp eq i32 %536, 0
  br i1 %537, label %554, label %538

538:                                              ; preds = %534, %538
  %539 = phi i32 [ %551, %538 ], [ %191, %534 ]
  %540 = phi float [ %550, %538 ], [ 0.000000e+00, %534 ]
  %541 = phi i32 [ %552, %538 ], [ 0, %534 ]
  %542 = sub nsw i32 %5, %539
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds float, float* %193, i64 %543
  %545 = load float, float* %544, align 4, !tbaa !5
  %546 = add i32 %535, %539
  %547 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %546
  %548 = load float, float addrspace(3)* %547, align 4, !tbaa !5
  %549 = fmul contract float %545, %548
  %550 = fadd contract float %540, %549
  %551 = add i32 %539, 1
  %552 = add nuw nsw i32 %541, 1
  %553 = icmp eq i32 %552, %536
  br i1 %553, label %554, label %538, !llvm.loop !16

554:                                              ; preds = %538, %534
  %555 = phi i32 [ %191, %534 ], [ %202, %538 ]
  %556 = phi float [ 0.000000e+00, %534 ], [ %550, %538 ]
  %557 = phi float [ undef, %534 ], [ %550, %538 ]
  %558 = icmp ult i32 %199, 7
  br i1 %558, label %643, label %559

559:                                              ; preds = %554, %559
  %560 = phi i32 [ %641, %559 ], [ %555, %554 ]
  %561 = phi float [ %640, %559 ], [ %556, %554 ]
  %562 = sub nsw i32 %5, %560
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float* %193, i64 %563
  %565 = load float, float* %564, align 4, !tbaa !5
  %566 = add i32 %535, %560
  %567 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %566
  %568 = load float, float addrspace(3)* %567, align 4, !tbaa !5
  %569 = fmul contract float %565, %568
  %570 = fadd contract float %561, %569
  %571 = add i32 %560, 1
  %572 = sub nsw i32 %5, %571
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float* %193, i64 %573
  %575 = load float, float* %574, align 4, !tbaa !5
  %576 = add i32 %535, %571
  %577 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %576
  %578 = load float, float addrspace(3)* %577, align 4, !tbaa !5
  %579 = fmul contract float %575, %578
  %580 = fadd contract float %570, %579
  %581 = add i32 %560, 2
  %582 = sub nsw i32 %5, %581
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float* %193, i64 %583
  %585 = load float, float* %584, align 4, !tbaa !5
  %586 = add i32 %535, %581
  %587 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %586
  %588 = load float, float addrspace(3)* %587, align 4, !tbaa !5
  %589 = fmul contract float %585, %588
  %590 = fadd contract float %580, %589
  %591 = add i32 %560, 3
  %592 = sub nsw i32 %5, %591
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds float, float* %193, i64 %593
  %595 = load float, float* %594, align 4, !tbaa !5
  %596 = add i32 %535, %591
  %597 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %596
  %598 = load float, float addrspace(3)* %597, align 4, !tbaa !5
  %599 = fmul contract float %595, %598
  %600 = fadd contract float %590, %599
  %601 = add i32 %560, 4
  %602 = sub nsw i32 %5, %601
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds float, float* %193, i64 %603
  %605 = load float, float* %604, align 4, !tbaa !5
  %606 = add i32 %535, %601
  %607 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %606
  %608 = load float, float addrspace(3)* %607, align 4, !tbaa !5
  %609 = fmul contract float %605, %608
  %610 = fadd contract float %600, %609
  %611 = add i32 %560, 5
  %612 = sub nsw i32 %5, %611
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float* %193, i64 %613
  %615 = load float, float* %614, align 4, !tbaa !5
  %616 = add i32 %535, %611
  %617 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %616
  %618 = load float, float addrspace(3)* %617, align 4, !tbaa !5
  %619 = fmul contract float %615, %618
  %620 = fadd contract float %610, %619
  %621 = add i32 %560, 6
  %622 = sub nsw i32 %5, %621
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds float, float* %193, i64 %623
  %625 = load float, float* %624, align 4, !tbaa !5
  %626 = add i32 %535, %621
  %627 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %626
  %628 = load float, float addrspace(3)* %627, align 4, !tbaa !5
  %629 = fmul contract float %625, %628
  %630 = fadd contract float %620, %629
  %631 = add i32 %560, 7
  %632 = sub nsw i32 %5, %631
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds float, float* %193, i64 %633
  %635 = load float, float* %634, align 4, !tbaa !5
  %636 = add i32 %535, %631
  %637 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %636
  %638 = load float, float addrspace(3)* %637, align 4, !tbaa !5
  %639 = fmul contract float %635, %638
  %640 = fadd contract float %630, %639
  %641 = add i32 %560, 8
  %642 = icmp eq i32 %641, %198
  br i1 %642, label %643, label %559, !llvm.loop !17

643:                                              ; preds = %559, %554, %533
  %644 = phi float [ 0.000000e+00, %533 ], [ %557, %554 ], [ %640, %559 ]
  %645 = getelementptr inbounds float, float addrspace(1)* %29, i64 32
  store float %644, float addrspace(1)* %645, align 4, !tbaa !5
  br label %646

646:                                              ; preds = %643, %530
  %647 = add nsw i32 %15, 48
  %648 = icmp slt i32 %647, %3
  br i1 %648, label %649, label %762

649:                                              ; preds = %646
  br i1 %192, label %759, label %650

650:                                              ; preds = %649
  %651 = add i32 %196, 96
  %652 = and i32 %200, 7
  %653 = icmp eq i32 %652, 0
  br i1 %653, label %670, label %654

654:                                              ; preds = %650, %654
  %655 = phi i32 [ %667, %654 ], [ %191, %650 ]
  %656 = phi float [ %666, %654 ], [ 0.000000e+00, %650 ]
  %657 = phi i32 [ %668, %654 ], [ 0, %650 ]
  %658 = sub nsw i32 %5, %655
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds float, float* %193, i64 %659
  %661 = load float, float* %660, align 4, !tbaa !5
  %662 = add i32 %651, %655
  %663 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %662
  %664 = load float, float addrspace(3)* %663, align 4, !tbaa !5
  %665 = fmul contract float %661, %664
  %666 = fadd contract float %656, %665
  %667 = add i32 %655, 1
  %668 = add nuw nsw i32 %657, 1
  %669 = icmp eq i32 %668, %652
  br i1 %669, label %670, label %654, !llvm.loop !16

670:                                              ; preds = %654, %650
  %671 = phi i32 [ %191, %650 ], [ %202, %654 ]
  %672 = phi float [ 0.000000e+00, %650 ], [ %666, %654 ]
  %673 = phi float [ undef, %650 ], [ %666, %654 ]
  %674 = icmp ult i32 %199, 7
  br i1 %674, label %759, label %675

675:                                              ; preds = %670, %675
  %676 = phi i32 [ %757, %675 ], [ %671, %670 ]
  %677 = phi float [ %756, %675 ], [ %672, %670 ]
  %678 = sub nsw i32 %5, %676
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds float, float* %193, i64 %679
  %681 = load float, float* %680, align 4, !tbaa !5
  %682 = add i32 %651, %676
  %683 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %682
  %684 = load float, float addrspace(3)* %683, align 4, !tbaa !5
  %685 = fmul contract float %681, %684
  %686 = fadd contract float %677, %685
  %687 = add i32 %676, 1
  %688 = sub nsw i32 %5, %687
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds float, float* %193, i64 %689
  %691 = load float, float* %690, align 4, !tbaa !5
  %692 = add i32 %651, %687
  %693 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %692
  %694 = load float, float addrspace(3)* %693, align 4, !tbaa !5
  %695 = fmul contract float %691, %694
  %696 = fadd contract float %686, %695
  %697 = add i32 %676, 2
  %698 = sub nsw i32 %5, %697
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds float, float* %193, i64 %699
  %701 = load float, float* %700, align 4, !tbaa !5
  %702 = add i32 %651, %697
  %703 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %702
  %704 = load float, float addrspace(3)* %703, align 4, !tbaa !5
  %705 = fmul contract float %701, %704
  %706 = fadd contract float %696, %705
  %707 = add i32 %676, 3
  %708 = sub nsw i32 %5, %707
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds float, float* %193, i64 %709
  %711 = load float, float* %710, align 4, !tbaa !5
  %712 = add i32 %651, %707
  %713 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %712
  %714 = load float, float addrspace(3)* %713, align 4, !tbaa !5
  %715 = fmul contract float %711, %714
  %716 = fadd contract float %706, %715
  %717 = add i32 %676, 4
  %718 = sub nsw i32 %5, %717
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds float, float* %193, i64 %719
  %721 = load float, float* %720, align 4, !tbaa !5
  %722 = add i32 %651, %717
  %723 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %722
  %724 = load float, float addrspace(3)* %723, align 4, !tbaa !5
  %725 = fmul contract float %721, %724
  %726 = fadd contract float %716, %725
  %727 = add i32 %676, 5
  %728 = sub nsw i32 %5, %727
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds float, float* %193, i64 %729
  %731 = load float, float* %730, align 4, !tbaa !5
  %732 = add i32 %651, %727
  %733 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %732
  %734 = load float, float addrspace(3)* %733, align 4, !tbaa !5
  %735 = fmul contract float %731, %734
  %736 = fadd contract float %726, %735
  %737 = add i32 %676, 6
  %738 = sub nsw i32 %5, %737
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds float, float* %193, i64 %739
  %741 = load float, float* %740, align 4, !tbaa !5
  %742 = add i32 %651, %737
  %743 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %742
  %744 = load float, float addrspace(3)* %743, align 4, !tbaa !5
  %745 = fmul contract float %741, %744
  %746 = fadd contract float %736, %745
  %747 = add i32 %676, 7
  %748 = sub nsw i32 %5, %747
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds float, float* %193, i64 %749
  %751 = load float, float* %750, align 4, !tbaa !5
  %752 = add i32 %651, %747
  %753 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %752
  %754 = load float, float addrspace(3)* %753, align 4, !tbaa !5
  %755 = fmul contract float %751, %754
  %756 = fadd contract float %746, %755
  %757 = add i32 %676, 8
  %758 = icmp eq i32 %757, %198
  br i1 %758, label %759, label %675, !llvm.loop !17

759:                                              ; preds = %675, %670, %649
  %760 = phi float [ 0.000000e+00, %649 ], [ %673, %670 ], [ %756, %675 ]
  %761 = getelementptr inbounds float, float addrspace(1)* %29, i64 48
  store float %760, float addrspace(1)* %761, align 4, !tbaa !5
  br label %762

762:                                              ; preds = %646, %759, %7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14, !11}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !14, !11}
