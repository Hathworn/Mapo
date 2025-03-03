; ModuleID = '../data/hip_kernels/15524/8/main.cu'
source_filename = "../data/hip_kernels/15524/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_Kernel = protected addrspace(4) externally_initialized global float* null, align 8
@s_Data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @c_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z28convolutionRowsKernel_up_smpPfS_iiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 6
  %10 = shl i32 %6, 4
  %11 = sub i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 2
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = add i32 %15, %16
  %18 = shl i32 %8, 7
  %19 = shl nuw nsw i32 %12, 1
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %17, %4
  br i1 %21, label %22, label %1068

22:                                               ; preds = %7
  %23 = mul nsw i32 %17, %2
  %24 = add nsw i32 %13, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = mul nsw i32 %17, %3
  %28 = add nsw i32 %27, %20
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = icmp sgt i32 %6, 0
  br i1 %31, label %32, label %62

32:                                               ; preds = %22
  %33 = shl nuw nsw i32 %6, 1
  %34 = add nsw i32 %33, 4
  %35 = shl nuw nsw i32 %16, 4
  %36 = mul i32 %35, %34
  %37 = add i32 %36, %12
  %38 = and i32 %6, 7
  %39 = icmp ult i32 %6, 8
  br i1 %39, label %42, label %40

40:                                               ; preds = %32
  %41 = and i32 %6, -8
  br label %72

42:                                               ; preds = %166, %32
  %43 = phi i32 [ 0, %32 ], [ %170, %166 ]
  %44 = icmp eq i32 %38, 0
  br i1 %44, label %62, label %45

45:                                               ; preds = %42, %55
  %46 = phi i32 [ %59, %55 ], [ %43, %42 ]
  %47 = phi i32 [ %60, %55 ], [ 0, %42 ]
  %48 = shl nsw i32 %46, 4
  %49 = add nsw i32 %48, %13
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %51, label %55

51:                                               ; preds = %45
  %52 = zext i32 %48 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %26, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %55

55:                                               ; preds = %51, %45
  %56 = phi contract float [ %54, %51 ], [ 0.000000e+00, %45 ]
  %57 = add i32 %37, %48
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %57
  store float %56, float addrspace(3)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i32 %46, 1
  %60 = add i32 %47, 1
  %61 = icmp eq i32 %60, %38
  br i1 %61, label %62, label %45, !llvm.loop !10

62:                                               ; preds = %42, %55, %22
  %63 = shl i32 %6, 1
  %64 = add i32 %63, 4
  %65 = icmp sgt i32 %6, -4
  %66 = shl nsw i32 %6, 1
  %67 = add nsw i32 %66, 4
  br i1 %65, label %68, label %173

68:                                               ; preds = %62
  %69 = shl nuw nsw i32 %16, 4
  %70 = mul i32 %69, %67
  %71 = add i32 %70, %12
  br label %186

72:                                               ; preds = %166, %40
  %73 = phi i32 [ 0, %40 ], [ %170, %166 ]
  %74 = phi i32 [ 0, %40 ], [ %171, %166 ]
  %75 = shl nsw i32 %73, 4
  %76 = add nsw i32 %75, %13
  %77 = icmp sgt i32 %76, -1
  br i1 %77, label %78, label %82

78:                                               ; preds = %72
  %79 = zext i32 %75 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %26, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %82

82:                                               ; preds = %72, %78
  %83 = phi contract float [ %81, %78 ], [ 0.000000e+00, %72 ]
  %84 = add i32 %37, %75
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %84
  store float %83, float addrspace(3)* %85, align 4, !tbaa !5
  %86 = shl i32 %73, 4
  %87 = or i32 %86, 16
  %88 = add nsw i32 %87, %13
  %89 = icmp sgt i32 %88, -1
  br i1 %89, label %90, label %94

90:                                               ; preds = %82
  %91 = zext i32 %87 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %26, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %94

94:                                               ; preds = %90, %82
  %95 = phi contract float [ %93, %90 ], [ 0.000000e+00, %82 ]
  %96 = add i32 %37, %87
  %97 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %96
  store float %95, float addrspace(3)* %97, align 4, !tbaa !5
  %98 = shl i32 %73, 4
  %99 = or i32 %98, 32
  %100 = add nsw i32 %99, %13
  %101 = icmp sgt i32 %100, -1
  br i1 %101, label %102, label %106

102:                                              ; preds = %94
  %103 = zext i32 %99 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %26, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %106

106:                                              ; preds = %102, %94
  %107 = phi contract float [ %105, %102 ], [ 0.000000e+00, %94 ]
  %108 = add i32 %37, %99
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %108
  store float %107, float addrspace(3)* %109, align 4, !tbaa !5
  %110 = shl i32 %73, 4
  %111 = or i32 %110, 48
  %112 = add nsw i32 %111, %13
  %113 = icmp sgt i32 %112, -1
  br i1 %113, label %114, label %118

114:                                              ; preds = %106
  %115 = zext i32 %111 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %26, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %118

118:                                              ; preds = %114, %106
  %119 = phi contract float [ %117, %114 ], [ 0.000000e+00, %106 ]
  %120 = add i32 %37, %111
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %120
  store float %119, float addrspace(3)* %121, align 4, !tbaa !5
  %122 = shl i32 %73, 4
  %123 = or i32 %122, 64
  %124 = add nsw i32 %123, %13
  %125 = icmp sgt i32 %124, -1
  br i1 %125, label %126, label %130

126:                                              ; preds = %118
  %127 = zext i32 %123 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %26, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %130

130:                                              ; preds = %126, %118
  %131 = phi contract float [ %129, %126 ], [ 0.000000e+00, %118 ]
  %132 = add i32 %37, %123
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %132
  store float %131, float addrspace(3)* %133, align 4, !tbaa !5
  %134 = shl i32 %73, 4
  %135 = or i32 %134, 80
  %136 = add nsw i32 %135, %13
  %137 = icmp sgt i32 %136, -1
  br i1 %137, label %138, label %142

138:                                              ; preds = %130
  %139 = zext i32 %135 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %26, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %142

142:                                              ; preds = %138, %130
  %143 = phi contract float [ %141, %138 ], [ 0.000000e+00, %130 ]
  %144 = add i32 %37, %135
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %144
  store float %143, float addrspace(3)* %145, align 4, !tbaa !5
  %146 = shl i32 %73, 4
  %147 = or i32 %146, 96
  %148 = add nsw i32 %147, %13
  %149 = icmp sgt i32 %148, -1
  br i1 %149, label %150, label %154

150:                                              ; preds = %142
  %151 = zext i32 %147 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %26, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %154

154:                                              ; preds = %150, %142
  %155 = phi contract float [ %153, %150 ], [ 0.000000e+00, %142 ]
  %156 = add i32 %37, %147
  %157 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %156
  store float %155, float addrspace(3)* %157, align 4, !tbaa !5
  %158 = shl i32 %73, 4
  %159 = or i32 %158, 112
  %160 = add nsw i32 %159, %13
  %161 = icmp sgt i32 %160, -1
  br i1 %161, label %162, label %166

162:                                              ; preds = %154
  %163 = zext i32 %159 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %26, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %166

166:                                              ; preds = %162, %154
  %167 = phi contract float [ %165, %162 ], [ 0.000000e+00, %154 ]
  %168 = add i32 %37, %159
  %169 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %168
  store float %167, float addrspace(3)* %169, align 4, !tbaa !5
  %170 = add nuw nsw i32 %73, 8
  %171 = add i32 %74, 8
  %172 = icmp eq i32 %171, %41
  br i1 %172, label %42, label %72, !llvm.loop !12

173:                                              ; preds = %195, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %174 = sdiv i32 %5, 2
  %175 = sub nsw i32 0, %174
  %176 = icmp slt i32 %5, -1
  %177 = mul i32 %67, %16
  %178 = load float*, float* addrspace(4)* @c_Kernel, align 8
  %179 = shl nsw i32 %5, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float* %178, i64 %180
  %182 = add nuw nsw i32 %12, 1
  %183 = add nsw i32 %182, %174
  %184 = tail call i32 @llvm.abs.i32(i32 %174, i1 true)
  %185 = icmp slt i32 %20, %3
  br i1 %185, label %201, label %414

186:                                              ; preds = %68, %195
  %187 = phi i32 [ %6, %68 ], [ %199, %195 ]
  %188 = shl nsw i32 %187, 4
  %189 = add nsw i32 %188, %13
  %190 = icmp slt i32 %189, %2
  br i1 %190, label %191, label %195

191:                                              ; preds = %186
  %192 = sext i32 %188 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %26, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %195

195:                                              ; preds = %186, %191
  %196 = phi contract float [ %194, %191 ], [ 0.000000e+00, %186 ]
  %197 = add i32 %71, %188
  %198 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %197
  store float %196, float addrspace(3)* %198, align 4, !tbaa !5
  %199 = add nsw i32 %187, 1
  %200 = icmp slt i32 %199, %64
  br i1 %200, label %186, label %173, !llvm.loop !14

201:                                              ; preds = %173
  %202 = add i32 %177, %6
  %203 = shl i32 %202, 4
  br i1 %176, label %243, label %204

204:                                              ; preds = %201
  %205 = add i32 %203, %12
  %206 = add i32 %174, %184
  %207 = add i32 %206, 1
  %208 = and i32 %207, 7
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %236, label %210

210:                                              ; preds = %204, %210
  %211 = phi i32 [ %233, %210 ], [ %175, %204 ]
  %212 = phi float [ %232, %210 ], [ 0.000000e+00, %204 ]
  %213 = phi float [ %225, %210 ], [ 0.000000e+00, %204 ]
  %214 = phi i32 [ %234, %210 ], [ 0, %204 ]
  %215 = shl nsw i32 %211, 1
  %216 = add i32 %205, %211
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %216
  %218 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %219 = add nsw i32 %215, %5
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds float, float* %178, i64 %220
  %222 = load float, float* %221, align 4, !tbaa !5
  %223 = fmul contract float %218, %222
  %224 = fmul contract float %223, 2.000000e+00
  %225 = fadd contract float %213, %224
  %226 = add nsw i32 %219, -1
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float* %178, i64 %227
  %229 = load float, float* %228, align 4, !tbaa !5
  %230 = fmul contract float %218, %229
  %231 = fmul contract float %230, 2.000000e+00
  %232 = fadd contract float %212, %231
  %233 = add i32 %211, 1
  %234 = add i32 %214, 1
  %235 = icmp eq i32 %234, %208
  br i1 %235, label %236, label %210, !llvm.loop !15

236:                                              ; preds = %210, %204
  %237 = phi float [ undef, %204 ], [ %225, %210 ]
  %238 = phi float [ undef, %204 ], [ %232, %210 ]
  %239 = phi i32 [ %175, %204 ], [ %233, %210 ]
  %240 = phi float [ 0.000000e+00, %204 ], [ %232, %210 ]
  %241 = phi float [ 0.000000e+00, %204 ], [ %225, %210 ]
  %242 = icmp ult i32 %206, 7
  br i1 %242, label %243, label %252

243:                                              ; preds = %236, %252, %201
  %244 = phi float [ 0.000000e+00, %201 ], [ %237, %236 ], [ %399, %252 ]
  %245 = phi float [ 0.000000e+00, %201 ], [ %238, %236 ], [ %406, %252 ]
  %246 = load float, float* %181, align 4, !tbaa !5
  %247 = add i32 %183, %203
  %248 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %247
  %249 = load float, float addrspace(3)* %248, align 4, !tbaa !5
  store float %244, float addrspace(1)* %30, align 4, !tbaa !5
  %250 = or i32 %20, 1
  %251 = icmp slt i32 %250, %3
  br i1 %251, label %409, label %414

252:                                              ; preds = %236, %252
  %253 = phi i32 [ %407, %252 ], [ %239, %236 ]
  %254 = phi float [ %406, %252 ], [ %240, %236 ]
  %255 = phi float [ %399, %252 ], [ %241, %236 ]
  %256 = shl nsw i32 %253, 1
  %257 = add i32 %205, %253
  %258 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %257
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %260 = add nsw i32 %256, %5
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float* %178, i64 %261
  %263 = load float, float* %262, align 4, !tbaa !5
  %264 = fmul contract float %259, %263
  %265 = fmul contract float %264, 2.000000e+00
  %266 = fadd contract float %255, %265
  %267 = add nsw i32 %260, -1
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float* %178, i64 %268
  %270 = load float, float* %269, align 4, !tbaa !5
  %271 = fmul contract float %259, %270
  %272 = fmul contract float %271, 2.000000e+00
  %273 = fadd contract float %254, %272
  %274 = add i32 %253, 1
  %275 = shl nsw i32 %274, 1
  %276 = add i32 %205, %274
  %277 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %276
  %278 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %279 = add nsw i32 %275, %5
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float* %178, i64 %280
  %282 = load float, float* %281, align 4, !tbaa !5
  %283 = fmul contract float %278, %282
  %284 = fmul contract float %283, 2.000000e+00
  %285 = fadd contract float %266, %284
  %286 = add nsw i32 %279, -1
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float* %178, i64 %287
  %289 = load float, float* %288, align 4, !tbaa !5
  %290 = fmul contract float %278, %289
  %291 = fmul contract float %290, 2.000000e+00
  %292 = fadd contract float %273, %291
  %293 = add i32 %253, 2
  %294 = shl nsw i32 %293, 1
  %295 = add i32 %205, %293
  %296 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %295
  %297 = load float, float addrspace(3)* %296, align 4, !tbaa !5
  %298 = add nsw i32 %294, %5
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds float, float* %178, i64 %299
  %301 = load float, float* %300, align 4, !tbaa !5
  %302 = fmul contract float %297, %301
  %303 = fmul contract float %302, 2.000000e+00
  %304 = fadd contract float %285, %303
  %305 = add nsw i32 %298, -1
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float* %178, i64 %306
  %308 = load float, float* %307, align 4, !tbaa !5
  %309 = fmul contract float %297, %308
  %310 = fmul contract float %309, 2.000000e+00
  %311 = fadd contract float %292, %310
  %312 = add i32 %253, 3
  %313 = shl nsw i32 %312, 1
  %314 = add i32 %205, %312
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %314
  %316 = load float, float addrspace(3)* %315, align 4, !tbaa !5
  %317 = add nsw i32 %313, %5
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float* %178, i64 %318
  %320 = load float, float* %319, align 4, !tbaa !5
  %321 = fmul contract float %316, %320
  %322 = fmul contract float %321, 2.000000e+00
  %323 = fadd contract float %304, %322
  %324 = add nsw i32 %317, -1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds float, float* %178, i64 %325
  %327 = load float, float* %326, align 4, !tbaa !5
  %328 = fmul contract float %316, %327
  %329 = fmul contract float %328, 2.000000e+00
  %330 = fadd contract float %311, %329
  %331 = add i32 %253, 4
  %332 = shl nsw i32 %331, 1
  %333 = add i32 %205, %331
  %334 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %333
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !5
  %336 = add nsw i32 %332, %5
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds float, float* %178, i64 %337
  %339 = load float, float* %338, align 4, !tbaa !5
  %340 = fmul contract float %335, %339
  %341 = fmul contract float %340, 2.000000e+00
  %342 = fadd contract float %323, %341
  %343 = add nsw i32 %336, -1
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds float, float* %178, i64 %344
  %346 = load float, float* %345, align 4, !tbaa !5
  %347 = fmul contract float %335, %346
  %348 = fmul contract float %347, 2.000000e+00
  %349 = fadd contract float %330, %348
  %350 = add i32 %253, 5
  %351 = shl nsw i32 %350, 1
  %352 = add i32 %205, %350
  %353 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %352
  %354 = load float, float addrspace(3)* %353, align 4, !tbaa !5
  %355 = add nsw i32 %351, %5
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds float, float* %178, i64 %356
  %358 = load float, float* %357, align 4, !tbaa !5
  %359 = fmul contract float %354, %358
  %360 = fmul contract float %359, 2.000000e+00
  %361 = fadd contract float %342, %360
  %362 = add nsw i32 %355, -1
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds float, float* %178, i64 %363
  %365 = load float, float* %364, align 4, !tbaa !5
  %366 = fmul contract float %354, %365
  %367 = fmul contract float %366, 2.000000e+00
  %368 = fadd contract float %349, %367
  %369 = add i32 %253, 6
  %370 = shl nsw i32 %369, 1
  %371 = add i32 %205, %369
  %372 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %371
  %373 = load float, float addrspace(3)* %372, align 4, !tbaa !5
  %374 = add nsw i32 %370, %5
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds float, float* %178, i64 %375
  %377 = load float, float* %376, align 4, !tbaa !5
  %378 = fmul contract float %373, %377
  %379 = fmul contract float %378, 2.000000e+00
  %380 = fadd contract float %361, %379
  %381 = add nsw i32 %374, -1
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds float, float* %178, i64 %382
  %384 = load float, float* %383, align 4, !tbaa !5
  %385 = fmul contract float %373, %384
  %386 = fmul contract float %385, 2.000000e+00
  %387 = fadd contract float %368, %386
  %388 = add i32 %253, 7
  %389 = shl nsw i32 %388, 1
  %390 = add i32 %205, %388
  %391 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %390
  %392 = load float, float addrspace(3)* %391, align 4, !tbaa !5
  %393 = add nsw i32 %389, %5
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds float, float* %178, i64 %394
  %396 = load float, float* %395, align 4, !tbaa !5
  %397 = fmul contract float %392, %396
  %398 = fmul contract float %397, 2.000000e+00
  %399 = fadd contract float %380, %398
  %400 = add nsw i32 %393, -1
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds float, float* %178, i64 %401
  %403 = load float, float* %402, align 4, !tbaa !5
  %404 = fmul contract float %392, %403
  %405 = fmul contract float %404, 2.000000e+00
  %406 = fadd contract float %387, %405
  %407 = add i32 %253, 8
  %408 = icmp eq i32 %388, %184
  br i1 %408, label %243, label %252, !llvm.loop !16

409:                                              ; preds = %243
  %410 = fmul contract float %246, 2.000000e+00
  %411 = fmul contract float %410, %249
  %412 = fadd contract float %245, %411
  %413 = getelementptr inbounds float, float addrspace(1)* %30, i64 1
  store float %412, float addrspace(1)* %413, align 4, !tbaa !5
  br label %414

414:                                              ; preds = %243, %409, %173
  %415 = add nsw i32 %20, 32
  %416 = icmp slt i32 %415, %3
  br i1 %416, label %417, label %632

417:                                              ; preds = %414
  %418 = add nsw i32 %6, 1
  %419 = add i32 %418, %177
  %420 = shl i32 %419, 4
  br i1 %176, label %617, label %421

421:                                              ; preds = %417
  %422 = add i32 %420, %12
  %423 = add i32 %174, %184
  %424 = add i32 %423, 1
  %425 = and i32 %424, 7
  %426 = icmp eq i32 %425, 0
  br i1 %426, label %453, label %427

427:                                              ; preds = %421, %427
  %428 = phi i32 [ %450, %427 ], [ %175, %421 ]
  %429 = phi float [ %449, %427 ], [ 0.000000e+00, %421 ]
  %430 = phi float [ %442, %427 ], [ 0.000000e+00, %421 ]
  %431 = phi i32 [ %451, %427 ], [ 0, %421 ]
  %432 = shl nsw i32 %428, 1
  %433 = add i32 %422, %428
  %434 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %433
  %435 = load float, float addrspace(3)* %434, align 4, !tbaa !5
  %436 = add nsw i32 %432, %5
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds float, float* %178, i64 %437
  %439 = load float, float* %438, align 4, !tbaa !5
  %440 = fmul contract float %435, %439
  %441 = fmul contract float %440, 2.000000e+00
  %442 = fadd contract float %430, %441
  %443 = add nsw i32 %436, -1
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds float, float* %178, i64 %444
  %446 = load float, float* %445, align 4, !tbaa !5
  %447 = fmul contract float %435, %446
  %448 = fmul contract float %447, 2.000000e+00
  %449 = fadd contract float %429, %448
  %450 = add i32 %428, 1
  %451 = add i32 %431, 1
  %452 = icmp eq i32 %451, %425
  br i1 %452, label %453, label %427, !llvm.loop !17

453:                                              ; preds = %427, %421
  %454 = phi float [ undef, %421 ], [ %442, %427 ]
  %455 = phi float [ undef, %421 ], [ %449, %427 ]
  %456 = phi i32 [ %175, %421 ], [ %450, %427 ]
  %457 = phi float [ 0.000000e+00, %421 ], [ %449, %427 ]
  %458 = phi float [ 0.000000e+00, %421 ], [ %442, %427 ]
  %459 = icmp ult i32 %423, 7
  br i1 %459, label %617, label %460

460:                                              ; preds = %453, %460
  %461 = phi i32 [ %615, %460 ], [ %456, %453 ]
  %462 = phi float [ %614, %460 ], [ %457, %453 ]
  %463 = phi float [ %607, %460 ], [ %458, %453 ]
  %464 = shl nsw i32 %461, 1
  %465 = add i32 %422, %461
  %466 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %465
  %467 = load float, float addrspace(3)* %466, align 4, !tbaa !5
  %468 = add nsw i32 %464, %5
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds float, float* %178, i64 %469
  %471 = load float, float* %470, align 4, !tbaa !5
  %472 = fmul contract float %467, %471
  %473 = fmul contract float %472, 2.000000e+00
  %474 = fadd contract float %463, %473
  %475 = add nsw i32 %468, -1
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds float, float* %178, i64 %476
  %478 = load float, float* %477, align 4, !tbaa !5
  %479 = fmul contract float %467, %478
  %480 = fmul contract float %479, 2.000000e+00
  %481 = fadd contract float %462, %480
  %482 = add i32 %461, 1
  %483 = shl nsw i32 %482, 1
  %484 = add i32 %422, %482
  %485 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %484
  %486 = load float, float addrspace(3)* %485, align 4, !tbaa !5
  %487 = add nsw i32 %483, %5
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds float, float* %178, i64 %488
  %490 = load float, float* %489, align 4, !tbaa !5
  %491 = fmul contract float %486, %490
  %492 = fmul contract float %491, 2.000000e+00
  %493 = fadd contract float %474, %492
  %494 = add nsw i32 %487, -1
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds float, float* %178, i64 %495
  %497 = load float, float* %496, align 4, !tbaa !5
  %498 = fmul contract float %486, %497
  %499 = fmul contract float %498, 2.000000e+00
  %500 = fadd contract float %481, %499
  %501 = add i32 %461, 2
  %502 = shl nsw i32 %501, 1
  %503 = add i32 %422, %501
  %504 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %503
  %505 = load float, float addrspace(3)* %504, align 4, !tbaa !5
  %506 = add nsw i32 %502, %5
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float* %178, i64 %507
  %509 = load float, float* %508, align 4, !tbaa !5
  %510 = fmul contract float %505, %509
  %511 = fmul contract float %510, 2.000000e+00
  %512 = fadd contract float %493, %511
  %513 = add nsw i32 %506, -1
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds float, float* %178, i64 %514
  %516 = load float, float* %515, align 4, !tbaa !5
  %517 = fmul contract float %505, %516
  %518 = fmul contract float %517, 2.000000e+00
  %519 = fadd contract float %500, %518
  %520 = add i32 %461, 3
  %521 = shl nsw i32 %520, 1
  %522 = add i32 %422, %520
  %523 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %522
  %524 = load float, float addrspace(3)* %523, align 4, !tbaa !5
  %525 = add nsw i32 %521, %5
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds float, float* %178, i64 %526
  %528 = load float, float* %527, align 4, !tbaa !5
  %529 = fmul contract float %524, %528
  %530 = fmul contract float %529, 2.000000e+00
  %531 = fadd contract float %512, %530
  %532 = add nsw i32 %525, -1
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds float, float* %178, i64 %533
  %535 = load float, float* %534, align 4, !tbaa !5
  %536 = fmul contract float %524, %535
  %537 = fmul contract float %536, 2.000000e+00
  %538 = fadd contract float %519, %537
  %539 = add i32 %461, 4
  %540 = shl nsw i32 %539, 1
  %541 = add i32 %422, %539
  %542 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %541
  %543 = load float, float addrspace(3)* %542, align 4, !tbaa !5
  %544 = add nsw i32 %540, %5
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds float, float* %178, i64 %545
  %547 = load float, float* %546, align 4, !tbaa !5
  %548 = fmul contract float %543, %547
  %549 = fmul contract float %548, 2.000000e+00
  %550 = fadd contract float %531, %549
  %551 = add nsw i32 %544, -1
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds float, float* %178, i64 %552
  %554 = load float, float* %553, align 4, !tbaa !5
  %555 = fmul contract float %543, %554
  %556 = fmul contract float %555, 2.000000e+00
  %557 = fadd contract float %538, %556
  %558 = add i32 %461, 5
  %559 = shl nsw i32 %558, 1
  %560 = add i32 %422, %558
  %561 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %560
  %562 = load float, float addrspace(3)* %561, align 4, !tbaa !5
  %563 = add nsw i32 %559, %5
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds float, float* %178, i64 %564
  %566 = load float, float* %565, align 4, !tbaa !5
  %567 = fmul contract float %562, %566
  %568 = fmul contract float %567, 2.000000e+00
  %569 = fadd contract float %550, %568
  %570 = add nsw i32 %563, -1
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds float, float* %178, i64 %571
  %573 = load float, float* %572, align 4, !tbaa !5
  %574 = fmul contract float %562, %573
  %575 = fmul contract float %574, 2.000000e+00
  %576 = fadd contract float %557, %575
  %577 = add i32 %461, 6
  %578 = shl nsw i32 %577, 1
  %579 = add i32 %422, %577
  %580 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %579
  %581 = load float, float addrspace(3)* %580, align 4, !tbaa !5
  %582 = add nsw i32 %578, %5
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float* %178, i64 %583
  %585 = load float, float* %584, align 4, !tbaa !5
  %586 = fmul contract float %581, %585
  %587 = fmul contract float %586, 2.000000e+00
  %588 = fadd contract float %569, %587
  %589 = add nsw i32 %582, -1
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds float, float* %178, i64 %590
  %592 = load float, float* %591, align 4, !tbaa !5
  %593 = fmul contract float %581, %592
  %594 = fmul contract float %593, 2.000000e+00
  %595 = fadd contract float %576, %594
  %596 = add i32 %461, 7
  %597 = shl nsw i32 %596, 1
  %598 = add i32 %422, %596
  %599 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %598
  %600 = load float, float addrspace(3)* %599, align 4, !tbaa !5
  %601 = add nsw i32 %597, %5
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds float, float* %178, i64 %602
  %604 = load float, float* %603, align 4, !tbaa !5
  %605 = fmul contract float %600, %604
  %606 = fmul contract float %605, 2.000000e+00
  %607 = fadd contract float %588, %606
  %608 = add nsw i32 %601, -1
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float* %178, i64 %609
  %611 = load float, float* %610, align 4, !tbaa !5
  %612 = fmul contract float %600, %611
  %613 = fmul contract float %612, 2.000000e+00
  %614 = fadd contract float %595, %613
  %615 = add i32 %461, 8
  %616 = icmp eq i32 %596, %184
  br i1 %616, label %617, label %460, !llvm.loop !16

617:                                              ; preds = %453, %460, %417
  %618 = phi float [ 0.000000e+00, %417 ], [ %454, %453 ], [ %607, %460 ]
  %619 = phi float [ 0.000000e+00, %417 ], [ %455, %453 ], [ %614, %460 ]
  %620 = load float, float* %181, align 4, !tbaa !5
  %621 = add i32 %183, %420
  %622 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %621
  %623 = load float, float addrspace(3)* %622, align 4, !tbaa !5
  %624 = getelementptr inbounds float, float addrspace(1)* %30, i64 32
  store float %618, float addrspace(1)* %624, align 4, !tbaa !5
  %625 = or i32 %415, 1
  %626 = icmp slt i32 %625, %3
  br i1 %626, label %627, label %632

627:                                              ; preds = %617
  %628 = fmul contract float %620, 2.000000e+00
  %629 = fmul contract float %628, %623
  %630 = fadd contract float %619, %629
  %631 = getelementptr inbounds float, float addrspace(1)* %30, i64 33
  store float %630, float addrspace(1)* %631, align 4, !tbaa !5
  br label %632

632:                                              ; preds = %627, %617, %414
  %633 = add nsw i32 %20, 64
  %634 = icmp slt i32 %633, %3
  br i1 %634, label %635, label %850

635:                                              ; preds = %632
  %636 = add nsw i32 %6, 2
  %637 = add i32 %636, %177
  %638 = shl i32 %637, 4
  br i1 %176, label %835, label %639

639:                                              ; preds = %635
  %640 = add i32 %638, %12
  %641 = add i32 %174, %184
  %642 = add i32 %641, 1
  %643 = and i32 %642, 7
  %644 = icmp eq i32 %643, 0
  br i1 %644, label %671, label %645

645:                                              ; preds = %639, %645
  %646 = phi i32 [ %668, %645 ], [ %175, %639 ]
  %647 = phi float [ %667, %645 ], [ 0.000000e+00, %639 ]
  %648 = phi float [ %660, %645 ], [ 0.000000e+00, %639 ]
  %649 = phi i32 [ %669, %645 ], [ 0, %639 ]
  %650 = shl nsw i32 %646, 1
  %651 = add i32 %640, %646
  %652 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %651
  %653 = load float, float addrspace(3)* %652, align 4, !tbaa !5
  %654 = add nsw i32 %650, %5
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds float, float* %178, i64 %655
  %657 = load float, float* %656, align 4, !tbaa !5
  %658 = fmul contract float %653, %657
  %659 = fmul contract float %658, 2.000000e+00
  %660 = fadd contract float %648, %659
  %661 = add nsw i32 %654, -1
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds float, float* %178, i64 %662
  %664 = load float, float* %663, align 4, !tbaa !5
  %665 = fmul contract float %653, %664
  %666 = fmul contract float %665, 2.000000e+00
  %667 = fadd contract float %647, %666
  %668 = add i32 %646, 1
  %669 = add i32 %649, 1
  %670 = icmp eq i32 %669, %643
  br i1 %670, label %671, label %645, !llvm.loop !18

671:                                              ; preds = %645, %639
  %672 = phi float [ undef, %639 ], [ %660, %645 ]
  %673 = phi float [ undef, %639 ], [ %667, %645 ]
  %674 = phi i32 [ %175, %639 ], [ %668, %645 ]
  %675 = phi float [ 0.000000e+00, %639 ], [ %667, %645 ]
  %676 = phi float [ 0.000000e+00, %639 ], [ %660, %645 ]
  %677 = icmp ult i32 %641, 7
  br i1 %677, label %835, label %678

678:                                              ; preds = %671, %678
  %679 = phi i32 [ %833, %678 ], [ %674, %671 ]
  %680 = phi float [ %832, %678 ], [ %675, %671 ]
  %681 = phi float [ %825, %678 ], [ %676, %671 ]
  %682 = shl nsw i32 %679, 1
  %683 = add i32 %640, %679
  %684 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %683
  %685 = load float, float addrspace(3)* %684, align 4, !tbaa !5
  %686 = add nsw i32 %682, %5
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds float, float* %178, i64 %687
  %689 = load float, float* %688, align 4, !tbaa !5
  %690 = fmul contract float %685, %689
  %691 = fmul contract float %690, 2.000000e+00
  %692 = fadd contract float %681, %691
  %693 = add nsw i32 %686, -1
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds float, float* %178, i64 %694
  %696 = load float, float* %695, align 4, !tbaa !5
  %697 = fmul contract float %685, %696
  %698 = fmul contract float %697, 2.000000e+00
  %699 = fadd contract float %680, %698
  %700 = add i32 %679, 1
  %701 = shl nsw i32 %700, 1
  %702 = add i32 %640, %700
  %703 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %702
  %704 = load float, float addrspace(3)* %703, align 4, !tbaa !5
  %705 = add nsw i32 %701, %5
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds float, float* %178, i64 %706
  %708 = load float, float* %707, align 4, !tbaa !5
  %709 = fmul contract float %704, %708
  %710 = fmul contract float %709, 2.000000e+00
  %711 = fadd contract float %692, %710
  %712 = add nsw i32 %705, -1
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds float, float* %178, i64 %713
  %715 = load float, float* %714, align 4, !tbaa !5
  %716 = fmul contract float %704, %715
  %717 = fmul contract float %716, 2.000000e+00
  %718 = fadd contract float %699, %717
  %719 = add i32 %679, 2
  %720 = shl nsw i32 %719, 1
  %721 = add i32 %640, %719
  %722 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %721
  %723 = load float, float addrspace(3)* %722, align 4, !tbaa !5
  %724 = add nsw i32 %720, %5
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds float, float* %178, i64 %725
  %727 = load float, float* %726, align 4, !tbaa !5
  %728 = fmul contract float %723, %727
  %729 = fmul contract float %728, 2.000000e+00
  %730 = fadd contract float %711, %729
  %731 = add nsw i32 %724, -1
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds float, float* %178, i64 %732
  %734 = load float, float* %733, align 4, !tbaa !5
  %735 = fmul contract float %723, %734
  %736 = fmul contract float %735, 2.000000e+00
  %737 = fadd contract float %718, %736
  %738 = add i32 %679, 3
  %739 = shl nsw i32 %738, 1
  %740 = add i32 %640, %738
  %741 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %740
  %742 = load float, float addrspace(3)* %741, align 4, !tbaa !5
  %743 = add nsw i32 %739, %5
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds float, float* %178, i64 %744
  %746 = load float, float* %745, align 4, !tbaa !5
  %747 = fmul contract float %742, %746
  %748 = fmul contract float %747, 2.000000e+00
  %749 = fadd contract float %730, %748
  %750 = add nsw i32 %743, -1
  %751 = sext i32 %750 to i64
  %752 = getelementptr inbounds float, float* %178, i64 %751
  %753 = load float, float* %752, align 4, !tbaa !5
  %754 = fmul contract float %742, %753
  %755 = fmul contract float %754, 2.000000e+00
  %756 = fadd contract float %737, %755
  %757 = add i32 %679, 4
  %758 = shl nsw i32 %757, 1
  %759 = add i32 %640, %757
  %760 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %759
  %761 = load float, float addrspace(3)* %760, align 4, !tbaa !5
  %762 = add nsw i32 %758, %5
  %763 = sext i32 %762 to i64
  %764 = getelementptr inbounds float, float* %178, i64 %763
  %765 = load float, float* %764, align 4, !tbaa !5
  %766 = fmul contract float %761, %765
  %767 = fmul contract float %766, 2.000000e+00
  %768 = fadd contract float %749, %767
  %769 = add nsw i32 %762, -1
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds float, float* %178, i64 %770
  %772 = load float, float* %771, align 4, !tbaa !5
  %773 = fmul contract float %761, %772
  %774 = fmul contract float %773, 2.000000e+00
  %775 = fadd contract float %756, %774
  %776 = add i32 %679, 5
  %777 = shl nsw i32 %776, 1
  %778 = add i32 %640, %776
  %779 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %778
  %780 = load float, float addrspace(3)* %779, align 4, !tbaa !5
  %781 = add nsw i32 %777, %5
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds float, float* %178, i64 %782
  %784 = load float, float* %783, align 4, !tbaa !5
  %785 = fmul contract float %780, %784
  %786 = fmul contract float %785, 2.000000e+00
  %787 = fadd contract float %768, %786
  %788 = add nsw i32 %781, -1
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds float, float* %178, i64 %789
  %791 = load float, float* %790, align 4, !tbaa !5
  %792 = fmul contract float %780, %791
  %793 = fmul contract float %792, 2.000000e+00
  %794 = fadd contract float %775, %793
  %795 = add i32 %679, 6
  %796 = shl nsw i32 %795, 1
  %797 = add i32 %640, %795
  %798 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %797
  %799 = load float, float addrspace(3)* %798, align 4, !tbaa !5
  %800 = add nsw i32 %796, %5
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds float, float* %178, i64 %801
  %803 = load float, float* %802, align 4, !tbaa !5
  %804 = fmul contract float %799, %803
  %805 = fmul contract float %804, 2.000000e+00
  %806 = fadd contract float %787, %805
  %807 = add nsw i32 %800, -1
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds float, float* %178, i64 %808
  %810 = load float, float* %809, align 4, !tbaa !5
  %811 = fmul contract float %799, %810
  %812 = fmul contract float %811, 2.000000e+00
  %813 = fadd contract float %794, %812
  %814 = add i32 %679, 7
  %815 = shl nsw i32 %814, 1
  %816 = add i32 %640, %814
  %817 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %816
  %818 = load float, float addrspace(3)* %817, align 4, !tbaa !5
  %819 = add nsw i32 %815, %5
  %820 = sext i32 %819 to i64
  %821 = getelementptr inbounds float, float* %178, i64 %820
  %822 = load float, float* %821, align 4, !tbaa !5
  %823 = fmul contract float %818, %822
  %824 = fmul contract float %823, 2.000000e+00
  %825 = fadd contract float %806, %824
  %826 = add nsw i32 %819, -1
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds float, float* %178, i64 %827
  %829 = load float, float* %828, align 4, !tbaa !5
  %830 = fmul contract float %818, %829
  %831 = fmul contract float %830, 2.000000e+00
  %832 = fadd contract float %813, %831
  %833 = add i32 %679, 8
  %834 = icmp eq i32 %814, %184
  br i1 %834, label %835, label %678, !llvm.loop !16

835:                                              ; preds = %671, %678, %635
  %836 = phi float [ 0.000000e+00, %635 ], [ %672, %671 ], [ %825, %678 ]
  %837 = phi float [ 0.000000e+00, %635 ], [ %673, %671 ], [ %832, %678 ]
  %838 = load float, float* %181, align 4, !tbaa !5
  %839 = add i32 %183, %638
  %840 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %839
  %841 = load float, float addrspace(3)* %840, align 4, !tbaa !5
  %842 = getelementptr inbounds float, float addrspace(1)* %30, i64 64
  store float %836, float addrspace(1)* %842, align 4, !tbaa !5
  %843 = or i32 %633, 1
  %844 = icmp slt i32 %843, %3
  br i1 %844, label %845, label %850

845:                                              ; preds = %835
  %846 = fmul contract float %838, 2.000000e+00
  %847 = fmul contract float %846, %841
  %848 = fadd contract float %837, %847
  %849 = getelementptr inbounds float, float addrspace(1)* %30, i64 65
  store float %848, float addrspace(1)* %849, align 4, !tbaa !5
  br label %850

850:                                              ; preds = %845, %835, %632
  %851 = add nsw i32 %20, 96
  %852 = icmp slt i32 %851, %3
  br i1 %852, label %853, label %1068

853:                                              ; preds = %850
  %854 = add nsw i32 %6, 3
  %855 = add i32 %854, %177
  %856 = shl i32 %855, 4
  br i1 %176, label %1053, label %857

857:                                              ; preds = %853
  %858 = add i32 %856, %12
  %859 = add i32 %174, %184
  %860 = add i32 %859, 1
  %861 = and i32 %860, 7
  %862 = icmp eq i32 %861, 0
  br i1 %862, label %889, label %863

863:                                              ; preds = %857, %863
  %864 = phi i32 [ %886, %863 ], [ %175, %857 ]
  %865 = phi float [ %885, %863 ], [ 0.000000e+00, %857 ]
  %866 = phi float [ %878, %863 ], [ 0.000000e+00, %857 ]
  %867 = phi i32 [ %887, %863 ], [ 0, %857 ]
  %868 = shl nsw i32 %864, 1
  %869 = add i32 %858, %864
  %870 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %869
  %871 = load float, float addrspace(3)* %870, align 4, !tbaa !5
  %872 = add nsw i32 %868, %5
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds float, float* %178, i64 %873
  %875 = load float, float* %874, align 4, !tbaa !5
  %876 = fmul contract float %871, %875
  %877 = fmul contract float %876, 2.000000e+00
  %878 = fadd contract float %866, %877
  %879 = add nsw i32 %872, -1
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds float, float* %178, i64 %880
  %882 = load float, float* %881, align 4, !tbaa !5
  %883 = fmul contract float %871, %882
  %884 = fmul contract float %883, 2.000000e+00
  %885 = fadd contract float %865, %884
  %886 = add i32 %864, 1
  %887 = add i32 %867, 1
  %888 = icmp eq i32 %887, %861
  br i1 %888, label %889, label %863, !llvm.loop !19

889:                                              ; preds = %863, %857
  %890 = phi float [ undef, %857 ], [ %878, %863 ]
  %891 = phi float [ undef, %857 ], [ %885, %863 ]
  %892 = phi i32 [ %175, %857 ], [ %886, %863 ]
  %893 = phi float [ 0.000000e+00, %857 ], [ %885, %863 ]
  %894 = phi float [ 0.000000e+00, %857 ], [ %878, %863 ]
  %895 = icmp ult i32 %859, 7
  br i1 %895, label %1053, label %896

896:                                              ; preds = %889, %896
  %897 = phi i32 [ %1051, %896 ], [ %892, %889 ]
  %898 = phi float [ %1050, %896 ], [ %893, %889 ]
  %899 = phi float [ %1043, %896 ], [ %894, %889 ]
  %900 = shl nsw i32 %897, 1
  %901 = add i32 %858, %897
  %902 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %901
  %903 = load float, float addrspace(3)* %902, align 4, !tbaa !5
  %904 = add nsw i32 %900, %5
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds float, float* %178, i64 %905
  %907 = load float, float* %906, align 4, !tbaa !5
  %908 = fmul contract float %903, %907
  %909 = fmul contract float %908, 2.000000e+00
  %910 = fadd contract float %899, %909
  %911 = add nsw i32 %904, -1
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds float, float* %178, i64 %912
  %914 = load float, float* %913, align 4, !tbaa !5
  %915 = fmul contract float %903, %914
  %916 = fmul contract float %915, 2.000000e+00
  %917 = fadd contract float %898, %916
  %918 = add i32 %897, 1
  %919 = shl nsw i32 %918, 1
  %920 = add i32 %858, %918
  %921 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %920
  %922 = load float, float addrspace(3)* %921, align 4, !tbaa !5
  %923 = add nsw i32 %919, %5
  %924 = sext i32 %923 to i64
  %925 = getelementptr inbounds float, float* %178, i64 %924
  %926 = load float, float* %925, align 4, !tbaa !5
  %927 = fmul contract float %922, %926
  %928 = fmul contract float %927, 2.000000e+00
  %929 = fadd contract float %910, %928
  %930 = add nsw i32 %923, -1
  %931 = sext i32 %930 to i64
  %932 = getelementptr inbounds float, float* %178, i64 %931
  %933 = load float, float* %932, align 4, !tbaa !5
  %934 = fmul contract float %922, %933
  %935 = fmul contract float %934, 2.000000e+00
  %936 = fadd contract float %917, %935
  %937 = add i32 %897, 2
  %938 = shl nsw i32 %937, 1
  %939 = add i32 %858, %937
  %940 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %939
  %941 = load float, float addrspace(3)* %940, align 4, !tbaa !5
  %942 = add nsw i32 %938, %5
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds float, float* %178, i64 %943
  %945 = load float, float* %944, align 4, !tbaa !5
  %946 = fmul contract float %941, %945
  %947 = fmul contract float %946, 2.000000e+00
  %948 = fadd contract float %929, %947
  %949 = add nsw i32 %942, -1
  %950 = sext i32 %949 to i64
  %951 = getelementptr inbounds float, float* %178, i64 %950
  %952 = load float, float* %951, align 4, !tbaa !5
  %953 = fmul contract float %941, %952
  %954 = fmul contract float %953, 2.000000e+00
  %955 = fadd contract float %936, %954
  %956 = add i32 %897, 3
  %957 = shl nsw i32 %956, 1
  %958 = add i32 %858, %956
  %959 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %958
  %960 = load float, float addrspace(3)* %959, align 4, !tbaa !5
  %961 = add nsw i32 %957, %5
  %962 = sext i32 %961 to i64
  %963 = getelementptr inbounds float, float* %178, i64 %962
  %964 = load float, float* %963, align 4, !tbaa !5
  %965 = fmul contract float %960, %964
  %966 = fmul contract float %965, 2.000000e+00
  %967 = fadd contract float %948, %966
  %968 = add nsw i32 %961, -1
  %969 = sext i32 %968 to i64
  %970 = getelementptr inbounds float, float* %178, i64 %969
  %971 = load float, float* %970, align 4, !tbaa !5
  %972 = fmul contract float %960, %971
  %973 = fmul contract float %972, 2.000000e+00
  %974 = fadd contract float %955, %973
  %975 = add i32 %897, 4
  %976 = shl nsw i32 %975, 1
  %977 = add i32 %858, %975
  %978 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %977
  %979 = load float, float addrspace(3)* %978, align 4, !tbaa !5
  %980 = add nsw i32 %976, %5
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds float, float* %178, i64 %981
  %983 = load float, float* %982, align 4, !tbaa !5
  %984 = fmul contract float %979, %983
  %985 = fmul contract float %984, 2.000000e+00
  %986 = fadd contract float %967, %985
  %987 = add nsw i32 %980, -1
  %988 = sext i32 %987 to i64
  %989 = getelementptr inbounds float, float* %178, i64 %988
  %990 = load float, float* %989, align 4, !tbaa !5
  %991 = fmul contract float %979, %990
  %992 = fmul contract float %991, 2.000000e+00
  %993 = fadd contract float %974, %992
  %994 = add i32 %897, 5
  %995 = shl nsw i32 %994, 1
  %996 = add i32 %858, %994
  %997 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %996
  %998 = load float, float addrspace(3)* %997, align 4, !tbaa !5
  %999 = add nsw i32 %995, %5
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds float, float* %178, i64 %1000
  %1002 = load float, float* %1001, align 4, !tbaa !5
  %1003 = fmul contract float %998, %1002
  %1004 = fmul contract float %1003, 2.000000e+00
  %1005 = fadd contract float %986, %1004
  %1006 = add nsw i32 %999, -1
  %1007 = sext i32 %1006 to i64
  %1008 = getelementptr inbounds float, float* %178, i64 %1007
  %1009 = load float, float* %1008, align 4, !tbaa !5
  %1010 = fmul contract float %998, %1009
  %1011 = fmul contract float %1010, 2.000000e+00
  %1012 = fadd contract float %993, %1011
  %1013 = add i32 %897, 6
  %1014 = shl nsw i32 %1013, 1
  %1015 = add i32 %858, %1013
  %1016 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1015
  %1017 = load float, float addrspace(3)* %1016, align 4, !tbaa !5
  %1018 = add nsw i32 %1014, %5
  %1019 = sext i32 %1018 to i64
  %1020 = getelementptr inbounds float, float* %178, i64 %1019
  %1021 = load float, float* %1020, align 4, !tbaa !5
  %1022 = fmul contract float %1017, %1021
  %1023 = fmul contract float %1022, 2.000000e+00
  %1024 = fadd contract float %1005, %1023
  %1025 = add nsw i32 %1018, -1
  %1026 = sext i32 %1025 to i64
  %1027 = getelementptr inbounds float, float* %178, i64 %1026
  %1028 = load float, float* %1027, align 4, !tbaa !5
  %1029 = fmul contract float %1017, %1028
  %1030 = fmul contract float %1029, 2.000000e+00
  %1031 = fadd contract float %1012, %1030
  %1032 = add i32 %897, 7
  %1033 = shl nsw i32 %1032, 1
  %1034 = add i32 %858, %1032
  %1035 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1034
  %1036 = load float, float addrspace(3)* %1035, align 4, !tbaa !5
  %1037 = add nsw i32 %1033, %5
  %1038 = sext i32 %1037 to i64
  %1039 = getelementptr inbounds float, float* %178, i64 %1038
  %1040 = load float, float* %1039, align 4, !tbaa !5
  %1041 = fmul contract float %1036, %1040
  %1042 = fmul contract float %1041, 2.000000e+00
  %1043 = fadd contract float %1024, %1042
  %1044 = add nsw i32 %1037, -1
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds float, float* %178, i64 %1045
  %1047 = load float, float* %1046, align 4, !tbaa !5
  %1048 = fmul contract float %1036, %1047
  %1049 = fmul contract float %1048, 2.000000e+00
  %1050 = fadd contract float %1031, %1049
  %1051 = add i32 %897, 8
  %1052 = icmp eq i32 %1032, %184
  br i1 %1052, label %1053, label %896, !llvm.loop !16

1053:                                             ; preds = %889, %896, %853
  %1054 = phi float [ 0.000000e+00, %853 ], [ %890, %889 ], [ %1043, %896 ]
  %1055 = phi float [ 0.000000e+00, %853 ], [ %891, %889 ], [ %1050, %896 ]
  %1056 = load float, float* %181, align 4, !tbaa !5
  %1057 = add i32 %183, %856
  %1058 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_Data, i32 0, i32 %1057
  %1059 = load float, float addrspace(3)* %1058, align 4, !tbaa !5
  %1060 = getelementptr inbounds float, float addrspace(1)* %30, i64 96
  store float %1054, float addrspace(1)* %1060, align 4, !tbaa !5
  %1061 = or i32 %851, 1
  %1062 = icmp slt i32 %1061, %3
  br i1 %1062, label %1063, label %1068

1063:                                             ; preds = %1053
  %1064 = fmul contract float %1056, 2.000000e+00
  %1065 = fmul contract float %1064, %1059
  %1066 = fadd contract float %1055, %1065
  %1067 = getelementptr inbounds float, float addrspace(1)* %30, i64 97
  store float %1066, float addrspace(1)* %1067, align 4, !tbaa !5
  br label %1068

1068:                                             ; preds = %1063, %1053, %850, %7
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
